#!/usr/bin/env python3
"""Fail closed when Batch 02 corrections silently miss canonical database rows.

This protects the review packet integrity. It is NOT historical source validation.
"""
from __future__ import annotations

import argparse
import csv
import sqlite3
from pathlib import Path

from generate_frontend_data import ROOT

EXPECTED_CHANGED_HEADWORDS = {
    "lot", "hermes-lot-of-time-of-marriage", "lot-of-siblings", "lot-of-children",
    "lot-of-friends", "lot-of-rank", "lot-of-daughters", "lot-of-sons",
    "lot-of-fortune", "lot-of-substance", "lot-of-absence", "lot-of-necessity",
    "egyptian-lot-of-necessity", "persian-lot-of-necessity", "lot-of-eros",
    "lot-extraction", "lot-of-the-haylaj", "natural-indicators-of-a-lot",
    "planetary-lots",
}
UNMODIFIED_HEADWORD = "general-indicators-of-a-lot"
EXPECTED_SECTION_EDITS = 23
EXPECTED_INTRO_EDITS = 19

def main() -> int:
    p = argparse.ArgumentParser()
    p.add_argument("--db", type=Path, required=True)
    args = p.parse_args()
    if not args.db.is_file():
        p.error("Built database missing; run lexicographic_triage.py first.")
    con = sqlite3.connect(f"file:{args.db.resolve()}?mode=ro", uri=True)
    try:
        section_rows = con.execute("""
            SELECT t.slug, s.section_key
            FROM term_article_sections s JOIN terms t ON t.id=s.term_id
            WHERE s.editorial_notes='Lexicographic Batch 02: source-aware explanatory prose; formula tables preserved.'
        """).fetchall()
        intro_rows = con.execute("""
            SELECT t.slug
            FROM term_articles a JOIN terms t ON t.id=a.term_id
            WHERE a.editorial_notes LIKE 'Batch 02:%'
        """).fetchall()
        changed = {row[0] for row in section_rows} | {row[0] for row in intro_rows}
        if changed != EXPECTED_CHANGED_HEADWORDS:
            raise AssertionError(f"Changed-headword mismatch: missing={sorted(EXPECTED_CHANGED_HEADWORDS-changed)}, extra={sorted(changed-EXPECTED_CHANGED_HEADWORDS)}")
        if len(section_rows) != EXPECTED_SECTION_EDITS:
            raise AssertionError(f"Expected {EXPECTED_SECTION_EDITS} updated sections; found {len(section_rows)}.")
        if len(intro_rows) != EXPECTED_INTRO_EDITS:
            raise AssertionError(f"Expected {EXPECTED_INTRO_EDITS} updated introductions; found {len(intro_rows)}.")
        if any(row[0] == UNMODIFIED_HEADWORD for row in section_rows) or any(row[0] == UNMODIFIED_HEADWORD for row in intro_rows):
            raise AssertionError("Control headword unexpectedly edited.")
        slugs = [
            row[0] for row in con.execute("""
                SELECT slug FROM terms WHERE status IN ('reviewed','published')
            """)
        ]
        if len(slugs) != 468:
            raise AssertionError(f"Expected 468 public entries, found {len(slugs)}")
        if not con.execute("PRAGMA foreign_key_check").fetchall() == []:
            raise AssertionError("Foreign keys invalid")
    finally:
        con.close()
    with (ROOT / "docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8", newline="") as f:
        rows = list(csv.DictReader(f))
    by_slug = {row["slug"]: row for row in rows}
    relevant = EXPECTED_CHANGED_HEADWORDS | {UNMODIFIED_HEADWORD}
    if not relevant.issubset(by_slug) or len(by_slug) != len(rows):
        raise AssertionError("Missing or duplicate Batch 02 ledger headwords.")
    if any(by_slug[slug]["review_state"] in ("approved", "no-change-justified") for slug in relevant):
        raise AssertionError("Automated approval is forbidden.")
    print(f"PASS: {len(relevant)} headwords tracked; {len(intro_rows)} article leads and {len(section_rows)} prose sections verified.")
    print("PASS: all 468 public terms retained, no automatic approvals; existing structured formula tables are untouched by the correction seed.")
    return 0

if __name__ == "__main__":
    raise SystemExit(main())
