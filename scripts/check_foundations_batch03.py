#!/usr/bin/env python3
"""Batch 03 guardrail: no silent SQL misses or fabricated approval states."""
import csv
import sqlite3
from pathlib import Path
import sys

from generate_frontend_data import ROOT

if len(sys.argv) != 2:
    raise SystemExit("Usage: python3 scripts/check_foundations_batch03.py <built_sqlite>")
db = Path(sys.argv[1]).resolve()
con = sqlite3.connect(f"file:{db}?mode=ro", uri=True)
try:
    section_rows = con.execute("""
        SELECT t.slug,s.section_key FROM term_article_sections s
        JOIN terms t ON t.id=s.term_id
        WHERE s.editorial_notes='Lexicographic Batch 03: reviewed expression; source-specific differences and reference data preserved.'
    """).fetchall()
    intro_rows = con.execute("""
        SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id
        WHERE a.editorial_notes='Lexicographic Batch 03: historically situated clinical-language correction.'
    """).fetchall()
    if len(section_rows) != 20 or len(set(slug for slug, _ in section_rows)) != 20:
        raise AssertionError(f"Expected 20 distinct updated prose sections; got {section_rows}")
    if intro_rows != [('medical-astrology',)]:
        raise AssertionError(f"Expected only the medical astrology lead changed: {intro_rows}")
    if con.execute("PRAGMA foreign_key_check").fetchall():
        raise AssertionError("Foreign key check failed")
finally:
    con.close()
with (ROOT / "docs/editorial/batch-03-foundations-slugs.txt").open(encoding="utf-8") as f:
    selected = [line.strip() for line in f if line.strip() and not line.startswith("#")]
if len(selected) != 40 or len(set(selected)) != 40:
    raise AssertionError("Batch 03 must have forty unique headwords")
with (ROOT / "docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8", newline="") as f:
    ledger = {row["slug"]: row for row in csv.DictReader(f)}
if not set(selected).issubset(ledger):
    raise AssertionError("Batch 03 includes untracked headwords")
counts = {}
for slug in selected:
    state = ledger[slug]["review_state"]
    counts[state] = counts.get(state, 0) + 1
    if state in {"approved", "no-change-justified"}:
        raise AssertionError("Batch 03 cannot receive automated human approval")
if counts != {"revised-awaiting-review": 20, "triaged": 10, "source-pending": 10}:
    raise AssertionError(f"Batch 03 triage states differ: {counts}")
print("Batch 03 PASS: 40 distinct headwords; 20 actual prose section edits; one intro edit; 10 source holds; no automated approvals.")
