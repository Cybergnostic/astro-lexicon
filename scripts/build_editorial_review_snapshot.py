#!/usr/bin/env python3
"""Build on-screen editorial comparisons from the canonical SQLite corpus.

The baseline is the last database state before the proposed correction seeds
0233-0238. Current prose is taken from all ordered seeds. This is a *review*
artifact under .tmp/, not a second source of truth or an automatically accepted
historical edition.
"""
from __future__ import annotations

import json
import sqlite3
from datetime import datetime, timezone
from pathlib import Path

from generate_frontend_data import ROOT, build_db

OUT = ROOT / ".tmp/editorial-review-snapshot.json"
BASE = ROOT / ".tmp/editorial-before.sqlite"
CURRENT = ROOT / ".tmp/editorial-after.sqlite"
EXCLUDED_EDITORIAL_SEEDS = (
    "0237_lexicographic_", "0238_lexicographic_",
    "0233_lexicographic_", "0234_lexicographic_",
    "0235_lexicographic_", "0236_lots_batch02_",
)
BATCH_MANIFEST = ROOT / "docs/editorial/review-batches.json"
MAX_REVIEW_BATCH = 60


def configured_groups():
    """Load bounded, human-curated batches rather than hardcoding UI cohorts."""
    document = json.loads(BATCH_MANIFEST.read_text(encoding="utf-8"))
    if document.get("version") != 1 or not document.get("batches"):
        raise ValueError("Review batch manifest requires version 1 and nonempty batches")
    known_ids = set()
    groups = []
    for group in document["batches"]:
        key = group["id"]
        if key in known_ids or not key.isascii() or not key.replace("-", "").isalnum():
            raise ValueError("Duplicate or invalid editorial batch id: " + key)
        known_ids.add(key)
        name = group["slugs_file"]
        location = (ROOT / name).resolve()
        if ROOT.resolve() not in location.parents:
            raise ValueError("Batch slug path must remain inside project.")
        groups.append((key, group["label"], location))
    return groups


def build_before(path: Path) -> None:
    if path.exists():
        path.unlink()
    con = sqlite3.connect(path)
    try:
        con.execute("PRAGMA foreign_keys=ON")
        for folder in ("db/migrations", "db/seed"):
            for source in sorted((ROOT / folder).glob("*.sql")):
                if folder == "db/seed" and source.name.startswith(EXCLUDED_EDITORIAL_SEEDS):
                    continue
                con.executescript(source.read_text(encoding="utf-8"))
                con.execute("PRAGMA foreign_keys=ON")
        problems = con.execute("PRAGMA foreign_key_check").fetchall()
        if problems:
            raise RuntimeError(f"Baseline foreign-key errors: {problems[:3]}")
        if con.execute("PRAGMA integrity_check").fetchone()[0] != "ok":
            raise RuntimeError("Baseline SQLite integrity check failed")
        con.commit()
    finally:
        con.close()


def term_snapshot(con: sqlite3.Connection, slug: str) -> dict:
    con.row_factory = sqlite3.Row
    term = con.execute(
        "SELECT id,label,category,short_definition FROM terms WHERE slug=? "
        "AND status IN ('reviewed','published')", (slug,),
    ).fetchone()
    if term is None:
        raise ValueError(f"Cannot compare unknown/non-public term: {slug}")
    intro = con.execute(
        "SELECT intro FROM term_articles WHERE term_id=? "
        "AND status IN ('reviewed','published')", (term["id"],),
    ).fetchone()
    sections = [
        dict(row) for row in con.execute(
            "SELECT section_key,heading,body FROM term_article_sections "
            "WHERE term_id=? AND status IN ('reviewed','published') "
            "ORDER BY sort_order,id", (term["id"],),
        )
    ]
    return {
        "label": term["label"], "category": term["category"],
        "definition": term["short_definition"] or "",
        "intro": intro["intro"] if intro else "",
        "sections": sections,
    }


def changed_blocks(before: dict, after: dict) -> list[dict]:
    out = []
    if before["definition"] != after["definition"]:
        out.append({
            "kind": "definition", "key": "definition", "heading": "Short definition",
            "before": before["definition"], "after": after["definition"],
        })
    if (before["intro"] or "") != (after["intro"] or ""):
        out.append({
            "kind": "intro", "key": "overview", "heading": "Article introduction",
            "before": before["intro"] or "", "after": after["intro"] or "",
        })
    old = {s["section_key"]: s for s in before["sections"]}
    new = {s["section_key"]: s for s in after["sections"]}
    keys = list(dict.fromkeys([*old, *new]))
    for key in keys:
        left, right = old.get(key, {}), new.get(key, {})
        left_text, right_text = left.get("body") or "", right.get("body") or ""
        if left_text != right_text or left.get("heading") != right.get("heading"):
            out.append({
                "kind": "section", "key": key,
                "heading": right.get("heading") or left.get("heading") or key,
                "before": left_text, "after": right_text,
                "before_heading": left.get("heading") or "",
            })
    return out


def witnesses(con: sqlite3.Connection, slug: str) -> list[dict]:
    con.row_factory = sqlite3.Row
    rows = con.execute(
        """SELECT i.id, i.summary, i.scope, w.title work, a.name author
           FROM interpretations i
           JOIN terms t ON t.id=i.term_id
           JOIN works w ON w.id=i.work_id
           JOIN authors a ON a.id=w.author_id
           WHERE t.slug=? AND i.status IN ('reviewed','published')
           ORDER BY a.name,w.title,i.id""", (slug,),
    ).fetchall()
    entries = []
    for row in rows:
        refs = [
            dict(ref) for ref in con.execute(
                """SELECT sp.book,sp.tractate,sp.chapter,sp.section,
                          sp.page_start,sp.page_end,sp.locator_text
                   FROM citations c
                   JOIN source_passages sp ON sp.id=c.source_passage_id
                   WHERE c.interpretation_id=?
                   ORDER BY sp.id""", (row["id"],),
            )
        ]
        entries.append({
            "author": row["author"], "work": row["work"],
            "scope": row["scope"] or "",
            "summary": row["summary"] or "",
            "locators": [
                ", ".join(str(ref[f]) for f in (
                    "book", "tractate", "chapter", "section", "locator_text"
                ) if ref[f])
                + ((" · printed pp. " + str(ref["page_start"])
                    + (("–" + str(ref["page_end"]))
                       if ref["page_end"] and ref["page_end"] != ref["page_start"] else ""))
                   if ref["page_start"] else "")
                for ref in refs
            ],
        })
    return entries


def main() -> None:
    OUT.parent.mkdir(parents=True, exist_ok=True)
    build_db(CURRENT)
    build_before(BASE)
    current, baseline = sqlite3.connect(CURRENT), sqlite3.connect(BASE)
    try:
        groups = []
        records = {}
        for key, title, file in configured_groups():
            slugs = [line.strip() for line in file.read_text(encoding="utf-8").splitlines()
                     if line.strip() and not line.startswith("#")]
            if not 1 <= len(slugs) <= MAX_REVIEW_BATCH:
                raise ValueError(f"Batch {key} must have 1–{MAX_REVIEW_BATCH} entries, found {len(slugs)}")
            if len(slugs) != len(set(slugs)):
                raise ValueError(f"Duplicate slugs in {file}")
            groups.append({"id": key, "label": title, "slugs": slugs})
            for slug in slugs:
                if slug not in records:
                    old = term_snapshot(baseline, slug)
                    new = term_snapshot(current, slug)
                    records[slug] = {
                        "slug": slug, "label": new["label"], "category": new["category"],
                        "before": old, "proposed": new,
                        "changes": changed_blocks(old, new),
                        "witnesses": witnesses(current, slug),
                    }
        payload = {
            "version": 1, "generated_at": datetime.now(timezone.utc).isoformat(),
            "explanation": (
                "Before = corpus with editorial seeds 0233–0238 omitted; "
                "proposed = assembled current branch. Other non-edited passages "
                "and normalized tables are shown on the live site. "
                "Citations are database witnesses, not automatic source verification."
            ),
            "groups": groups, "entries": records,
        }
        OUT.write_text(json.dumps(payload, ensure_ascii=False, indent=2) + "\n",
                       encoding="utf-8")
        print(f"Editorial comparison prepared: {len(records)} distinct entries, "
              f"{sum(bool(v['changes']) for v in records.values())} with copy differences; "
              f"file {OUT}")
    finally:
        baseline.close()
        current.close()


if __name__ == "__main__":
    main()
