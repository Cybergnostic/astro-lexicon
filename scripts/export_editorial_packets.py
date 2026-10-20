#!/usr/bin/env python3
"""Export actual current editorial entry packets for a bounded list of canonical slugs.

This is an inspection export, not a source transcription or rewriting engine.
No copyrighted source-translation quotes are exported.
"""
from __future__ import annotations

import argparse
import json
import sqlite3
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/editorial-packet.sqlite"


def get_rows(con: sqlite3.Connection, sql: str, *params):
    return con.execute(sql, params).fetchall()


def clean(value):
    return (value or "").strip()


def locate_source(c):
    fields = [c["book"], c["tractate"], c["chapter"], c["section"], c["locator_text"]]
    locus = " · ".join(str(s).strip() for s in fields if s)
    pages = ""
    if c["page_start"]:
        pages = "pp. " + c["page_start"]
        if c["page_end"] and c["page_end"] != c["page_start"]:
            pages += "–" + c["page_end"]
    return "; ".join(x for x in [locus, pages, c["edition_label"]] if x)


def one_packet(con: sqlite3.Connection, slug: str) -> str:
    t = con.execute(
        "SELECT id, slug, label, category, short_definition, status FROM terms WHERE slug=?",
        (slug,),
    ).fetchone()
    if not t or t["status"] not in ("reviewed", "published"):
        raise ValueError(f"Unknown / nonpublic headword: {slug}")
    term_id = t["id"]
    out = [
        f"# {t['label']} ({t['slug']})",
        f"Category: {t['category'] or 'unspecified'}",
        "",
        "## Canonical short definition",
        clean(t["short_definition"]) or "(missing)",
        "",
    ]
    aliases = get_rows(con, "SELECT label,language,alias_type,scope_note FROM aliases WHERE term_id=? ORDER BY label", term_id)
    if aliases:
        out.extend(["## Aliases", ""])
        for a in aliases:
            out.append("- " + a["label"] + " (" + ", ".join(v for v in [a["language"], a["alias_type"]] if v) + ")"
                       + (": " + a["scope_note"] if a["scope_note"] else ""))
        out.append("")
    article = con.execute(
        "SELECT intro FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')", (term_id,)
    ).fetchone()
    out.extend(["## Article introduction", clean(article["intro"]) if article else "(none)", ""])
    out.extend(["## Current reviewable prose sections", ""])
    sections = get_rows(con,
        """SELECT section_key,heading,body FROM term_article_sections WHERE term_id=?
           AND status IN ('reviewed','published') ORDER BY sort_order,id""", term_id)
    if not sections:
        out.append("(No reviewed prose sections.)")
    for sec in sections:
        out.extend([f"### {sec['heading']} [section_key: {sec['section_key']}]",
                    clean(sec["body"]), ""])
    out.extend(["## Reader-facing composition", ""])
    blocks = get_rows(con,
        """SELECT p.heading group_heading, p.section_key group_key,
                  b.source_kind,b.source_key,b.presentation_role,b.show_heading
           FROM term_page_sections p
           JOIN term_page_blocks b ON b.page_section_id=p.id
           WHERE p.term_id=? AND p.status IN ('reviewed','published')
             AND b.status IN ('reviewed','published')
           ORDER BY p.sort_order,b.sort_order""", term_id)
    if blocks:
        for b in blocks:
            out.append("- " + b["group_heading"] + " → " + b["source_kind"] + "/" + b["source_key"]
                       + (" (visible subheading)" if b["show_heading"] else " (no subheading)"))
    else:
        out.append("(No explicit page composition. Renderer uses article blocks.)")
    out.append("")
    tables = get_rows(con,
        """SELECT table_key,heading,caption,columns_json,rows_json
           FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published')
           ORDER BY sort_order""", term_id)
    out.extend(["## Reviewed structured article tables", ""])
    if not tables:
        out.append("(None.)")
    for table in tables:
        out.append("### " + table["heading"] + " [table_key: " + table["table_key"] + "]")
        if table["caption"]:
            out.append(table["caption"])
        columns = json.loads(table["columns_json"])
        data = json.loads(table["rows_json"])
        out.append("Columns: " + "; ".join(map(str,columns)))
        for row in data[:30]:
            out.append("- " + " | ".join(str(cell) for cell in row))
        if len(data)>30:
            out.append(f"(Plus {len(data)-30} more rows; inspect canonical table.)")
        out.append("")
    out.extend(["## Historical interpretations and precise linked locators", ""])
    interpretations = get_rows(con,
        """SELECT i.id,i.summary,i.scope,i.certainty,i.evidence_grade,
                  w.title work_title,a.name author_name
           FROM interpretations i JOIN works w ON w.id=i.work_id
           JOIN authors a ON a.id=w.author_id
           WHERE i.term_id=? AND i.status IN ('reviewed','published')
           ORDER BY a.name,w.title,i.id""", term_id)
    if not interpretations:
        out.append("(No reviewed historical interpretations.)")
    for interp in interpretations:
        out.append("### " + interp["author_name"] + " — " + interp["work_title"])
        out.append("Scope: " + (interp["scope"] or "n/a") + "; certainty: "
                   + (interp["certainty"] or "n/a") + "; evidence: " + (interp["evidence_grade"] or "ungraded"))
        out.append(clean(interp["summary"]))
        cites = get_rows(con,
            """SELECT sp.book,sp.tractate,sp.chapter,sp.section,sp.locator_text,
                      sp.page_start,sp.page_end,ed.label edition_label
               FROM citations c JOIN source_passages sp ON sp.id=c.source_passage_id
               JOIN editions ed ON ed.id=sp.edition_id
               WHERE c.interpretation_id=? ORDER BY sp.id""", interp["id"])
        if cites:
            for cite in cites:
                out.append("- Citation: " + locate_source(cite))
        else:
            out.append("- Citation: NO LINKED PASSAGE — verification required")
        out.append("")
    links = get_rows(con,
        """SELECT t2.slug AS other_slug,t2.label AS other_label,r.relation_type,r.note
           FROM term_relations r JOIN terms t2 ON t2.id=r.object_term_id
           WHERE r.subject_term_id=? AND r.status IN ('reviewed','published')
           ORDER BY t2.label LIMIT 40""", term_id)
    out.extend(["## Direct outgoing cross references", ""])
    if not links:
        out.append("(None.)")
    for link in links:
        out.append("- " + link["other_label"] + " (" + link["other_slug"] + ") — " + link["relation_type"]
                   + (": " + link["note"] if link["note"] else ""))
    out.extend(["", "## Editorial reminder",
        "This packet is derived from current published/reviewed database rows. Inspect the "
        "rendered page, shared visual components and actual source books before changing "
        "facts or considering this entry approved.", ""])
    return "\n".join(out)


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--slugs-file", type=Path, required=True)
    parser.add_argument("--out", type=Path, required=True)
    parser.add_argument("--db", type=Path, default=None)
    args = parser.parse_args()
    slugs = [line.strip() for line in args.slugs_file.read_text(encoding="utf-8").splitlines()
             if line.strip() and not line.lstrip().startswith("#")]
    if not slugs or len(slugs) > 60 or len(slugs) != len(set(slugs)):
        parser.error("Provide 1–60 distinct canonical slugs, one per line.")
    db_path = args.db or DEFAULT_DB
    if args.db is None:
        db_path.parent.mkdir(parents=True, exist_ok=True)
        build_db(db_path)
    elif not db_path.is_file():
        parser.error(f"Database missing: {db_path}")
    con = sqlite3.connect(f"file:{db_path.resolve()}?mode=ro",uri=True)
    con.row_factory = sqlite3.Row
    try:
        packets = [one_packet(con, slug) for slug in slugs]
    finally:
        con.close()
    args.out.parent.mkdir(parents=True, exist_ok=True)
    args.out.write_text(
        "# Astro Lexicon — editorial review packet\n\n"
        + "These are **current database entries**, not raw historical sources. "
        + "No modern translation quotations are reproduced.\n\n"
        + "\n\n---\n\n".join(packets) + "\n",
        encoding="utf-8",
    )
    print(f"Wrote {len(slugs)} entry packets: {args.out}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
