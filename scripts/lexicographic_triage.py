#!/usr/bin/env python3
"""Generate non-authoritative editorial leads for every reviewed lexicon headword.

Usage:
  python3 scripts/lexicographic_triage.py
  python3 scripts/lexicographic_triage.py --focus reception,fardar
  python3 scripts/lexicographic_triage.py --db .tmp/astro-lexicon-audit.sqlite

Never changes source data and NEVER labels an entry 'approved' automatically.
"""
from __future__ import annotations

import argparse
import csv
import re
import sqlite3
from collections import Counter
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/lexicographic-triage.sqlite"
DEFAULT_OUT = ROOT / ".tmp/lexicographic-triage.csv"
DEFAULT_LEDGER = ROOT / "docs/editorial/lexicographic-ledger.csv"

STATES = {
    "unreviewed", "triaged", "source-pending", "revised-awaiting-review",
    "no-change-justified", "approved",
}
PUBLIC_VOICE = re.compile(
    r"\b(?:"
    r"(?:this|the) (?:lexicon|encyclopedia|project|corpus|database)\s+(?:keeps|"
    r"preserves|records|chooses|distinguishes|treats|separates|maintains|uses|"
    r"marks|labels|includes|represents|documents|is designed|is intended)"
    r"|(?:the|this) (?:entry|article)\s+(?:keeps|preserves|records|chooses|"
    r"treats|separates|is kept|is deliberately|names)"
    r"|reviewed corpus|source[- ]extraction|canonical(?:ly)?\s+(?:entry|slug)"
    r")\b", re.I,
)
STOP = {
    "a", "an", "and", "are", "as", "at", "be", "been", "by", "for", "from", "has",
    "have", "in", "into", "is", "it", "its", "of", "on", "or", "that", "the", "their",
    "there", "these", "this", "through", "to", "when", "where", "which", "while",
    "with", "within", "than", "one", "two", "they", "can", "also", "not",
}
FIELDNAMES = [
    "slug", "label", "category", "archetype", "review_state",
    "flags", "next_action", "definition_words", "intro_words", "sections",
    "tables", "interpretations", "historical_works", "unlocated_interpretations",
    "project_voice_example", "primary_finding", "checked_source_locator",
    "pending_check", "reviewer_signoff",
]


def lexical_tokens(text: str) -> set[str]:
    words = re.findall(r"[^\W\d_]{4,}", (text or "").casefold(), flags=re.UNICODE)
    return {word for word in words if word not in STOP}


def possible_intro_overlap(definition: str, intro: str) -> bool:
    """A *candidate* duplication, not a semantic equivalence assertion."""
    if not definition or not intro:
        return False
    a, b = lexical_tokens(definition), lexical_tokens(intro)
    if len(a) < 5 or len(b) < 5:
        return False
    return len(a & b) / min(len(a), len(b)) >= 0.67


def archetype(slug: str, label: str, category: str, has_tables: bool) -> str:
    s = (slug or "").lower()
    c = (category or "").lower()
    if s in {"sun", "moon", "mercury", "venus", "mars", "jupiter", "saturn"} or s in {
        "aries", "taurus", "gemini", "cancer", "leo", "virgo", "libra",
        "scorpio", "sagittarius", "capricorn", "aquarius", "pisces",
    }:
        return "planet-sign"
    if any(part in s for part in ("firdar", "profection", "direction", "rectification")) or s in {
        "animodar", "trutine-of-hermes", "solar-revolution", "annual-revolution",
    }:
        return "technical-method"
    if s in {
        "application", "separation", "reception", "translation-of-light",
        "collection-of-light", "frustration", "prohibition", "refranation",
    }:
        return "technical-relation"
    if has_tables or any(word in c for word in ("dignity", "classification", "scheme")) or s in {
        "sect", "lot-of-fortune", "triplicity", "terms", "face-decan",
    }:
        return "reference-system"
    if any(word in c for word in ("terminology", "linguistic", "translation")):
        return "historical-term"
    return "dictionary-headword"


def load_ledger(path: Path) -> dict[str, dict[str, str]]:
    if not path.is_file():
        raise FileNotFoundError(f"Editorial ledger not found: {path}")
    output: dict[str, dict[str, str]] = {}
    with path.open(encoding="utf-8", newline="") as handle:
        for row in csv.DictReader(handle):
            slug = (row.get("slug") or "").strip()
            state = (row.get("review_state") or "").strip()
            if not slug or slug in output:
                raise ValueError(f"Missing/duplicate editorial ledger slug: {slug!r}")
            if state not in STATES:
                raise ValueError(f"Invalid editorial review state on {slug}: {state}")
            if state == "approved" and not (row.get("reviewer_signoff") or "").strip():
                raise ValueError(f"Approval requires named human reviewer: {slug}")
            output[slug] = row
    return output


def scalar(con: sqlite3.Connection, sql: str, term_id: int):
    row = con.execute(sql, (term_id,)).fetchone()
    return row[0] if row else None


def source_metrics(con: sqlite3.Connection, term_id: int) -> tuple[int, int, int]:
    result = con.execute(
        """SELECT COUNT(*) AS interpretations, COUNT(DISTINCT i.work_id) AS works,
           SUM(CASE WHEN NOT EXISTS (
               SELECT 1 FROM citations c
               JOIN source_passages sp ON sp.id=c.source_passage_id
               WHERE c.interpretation_id=i.id
           ) THEN 1 ELSE 0 END) AS unlocated
           FROM interpretations i
           WHERE i.term_id=? AND i.status IN ('reviewed','published')""",
        (term_id,),
    ).fetchone()
    return int(result[0] or 0), int(result[1] or 0), int(result[2] or 0)


def audit_rows(con: sqlite3.Connection, ledger: dict[str, dict[str, str]]) -> list[dict]:
    con.row_factory = sqlite3.Row
    public = list(con.execute(
        """SELECT id,slug,label,category,short_definition FROM terms
           WHERE status IN ('reviewed','published') ORDER BY label COLLATE NOCASE"""
    ))
    known = {r["slug"] for r in public}
    unknown = set(ledger) - known
    if unknown:
        raise ValueError(f"Editorial ledger refers to non-public/nonexistent slugs: {sorted(unknown)}")
    rows = []
    for term in public:
        term_id = term["id"]
        intro = scalar(con,
            "SELECT intro FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')",
            term_id) or ""
        sections = list(con.execute(
            """SELECT section_key,heading,body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')
               ORDER BY sort_order,id""", (term_id,)
        ))
        tables = int(scalar(con,
            """SELECT COUNT(*) FROM term_article_tables
               WHERE term_id=? AND status IN ('reviewed','published')""",
            term_id) or 0)
        interpretations, works, unlocated = source_metrics(con, term_id)
        definition = term["short_definition"] or ""
        visible = [("definition", definition), ("intro", intro)]
        visible.extend((str(s["section_key"]), s["body"] or "") for s in sections)
        voice_hits = [(field, found.group(0)) for field, text in visible
                      if (found := PUBLIC_VOICE.search(text))]
        flags = []
        if not definition.strip():
            flags.append("missing-definition")
        if voice_hits:
            flags.append("project-voice")
        if possible_intro_overlap(definition, intro):
            flags.append("intro-overlap")
        if unlocated:
            flags.append("unlocated-witness")
        if len(sections) >= 7:
            flags.append("many-sections")
        if "missing-definition" in flags:
            action = "definition-review"
        elif "project-voice" in flags or "intro-overlap" in flags:
            action = "copy-review"
        elif unlocated:
            action = "source-locator-review"
        elif len(sections) >= 7:
            action = "structure-review"
        else:
            action = "manual-sample"
        manual = ledger.get(term["slug"], {})
        rows.append({
            "slug": term["slug"],
            "label": term["label"],
            "category": term["category"] or "",
            "archetype": manual.get("archetype") or archetype(
                term["slug"], term["label"], term["category"], tables > 0
            ),
            "review_state": manual.get("review_state") or "unreviewed",
            "flags": ";".join(flags),
            "next_action": action,
            "definition_words": len(definition.split()),
            "intro_words": len(intro.split()),
            "sections": len(sections),
            "tables": tables,
            "interpretations": interpretations,
            "historical_works": works,
            "unlocated_interpretations": unlocated,
            "project_voice_example": "; ".join(f"{field}: {word}" for field, word in voice_hits[:2]),
            "primary_finding": manual.get("primary_finding") or "",
            "checked_source_locator": manual.get("checked_source_locator") or "",
            "pending_check": manual.get("pending_check") or "",
            "reviewer_signoff": manual.get("reviewer_signoff") or "",
        })
    return rows


def main() -> int:
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("--db", type=Path, help="Existing built SQLite database (read only).")
    p.add_argument("--out", type=Path, default=DEFAULT_OUT)
    p.add_argument("--ledger", type=Path, default=DEFAULT_LEDGER)
    p.add_argument("--focus", default="", help="Comma-separated canonical slugs for console preview.")
    args = p.parse_args()
    ledger = load_ledger(args.ledger)
    db_path = args.db or DEFAULT_DB
    if args.db and not db_path.is_file():
        p.error(f"Provided database does not exist: {db_path}")
    if not args.db:
        db_path.parent.mkdir(parents=True, exist_ok=True)
        build_db(db_path)
    con = sqlite3.connect(f"file:{db_path.resolve()}?mode=ro", uri=True)
    try:
        rows = audit_rows(con, ledger)
    finally:
        con.close()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    with args.out.open("w", encoding="utf-8", newline="") as handle:
        writer = csv.DictWriter(handle, fieldnames=FIELDNAMES)
        writer.writeheader()
        writer.writerows(rows)
    actions = Counter(row["next_action"] for row in rows)
    states = Counter(row["review_state"] for row in rows)
    signals = Counter(signal for row in rows for signal in row["flags"].split(";") if signal)
    print(f"Lexicographic candidate audit: {len(rows)} public terms; report {args.out}")
    print("Actions (NOT approvals):", dict(sorted(actions.items())))
    print("Human review states:", dict(sorted(states.items())))
    print("Flags:", dict(sorted(signals.items())))
    focus = {s.strip() for s in args.focus.split(",") if s.strip()}
    if focus:
        for row in rows:
            if row["slug"] in focus:
                print(f"- {row['label']} [{row['slug']}]: {row['review_state']}; "
                      f"{row['next_action']}; flags={row['flags'] or 'none'}")
        missing = focus - {row["slug"] for row in rows}
        if missing:
            raise ValueError(f"Requested slugs were not public: {sorted(missing)}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
