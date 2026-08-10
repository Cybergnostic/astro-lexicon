#!/usr/bin/env python3
"""Attach reader-facing page composition metadata to the generated frontend corpus."""

from __future__ import annotations

import json
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DB_PATH = ROOT / ".tmp/frontend-corpus.sqlite"
CORPUS_PATH = ROOT / "src/data/generated/corpus.json"


def main() -> int:
    if not DB_PATH.exists():
        raise SystemExit(f"missing generated SQLite database: {DB_PATH}")
    if not CORPUS_PATH.exists():
        raise SystemExit(f"missing generated corpus: {CORPUS_PATH}")

    payload = json.loads(CORPUS_PATH.read_text(encoding="utf-8"))
    terms_by_slug = {term["slug"]: term for term in payload.get("terms", [])}

    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    try:
        rows = con.execute(
            """SELECT t.slug term_slug,
                      ps.id page_section_id,ps.section_key,ps.heading,ps.sort_order section_order,
                      pb.source_kind,pb.source_key,pb.presentation_role,pb.show_heading,
                      pb.sort_order block_order
               FROM term_page_sections ps
               JOIN terms t ON t.id=ps.term_id
               LEFT JOIN term_page_blocks pb
                 ON pb.page_section_id=ps.id
                AND pb.status IN ('reviewed','published')
               WHERE ps.status IN ('reviewed','published')
               ORDER BY t.slug,ps.sort_order,ps.id,pb.sort_order,pb.id"""
        ).fetchall()
    finally:
        con.close()

    composed: dict[str, list[dict]] = {}
    section_index: dict[tuple[str, int], dict] = {}
    for row in rows:
        slug = row["term_slug"]
        key = (slug, row["page_section_id"])
        section = section_index.get(key)
        if section is None:
            section = {
                "section_key": row["section_key"],
                "heading": row["heading"],
                "blocks": [],
            }
            section_index[key] = section
            composed.setdefault(slug, []).append(section)
        if row["source_kind"]:
            section["blocks"].append(
                {
                    "source_kind": row["source_kind"],
                    "source_key": row["source_key"],
                    "presentation_role": row["presentation_role"],
                    "show_heading": bool(row["show_heading"]),
                }
            )

    for slug, sections in composed.items():
        term = terms_by_slug.get(slug)
        if term is not None:
            term["page_composition"] = sections

    CORPUS_PATH.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Attached page composition for {len(composed)} term(s)")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
