#!/usr/bin/env python3
"""Batch 05 integrity checks; not a substitute for historical source judgment."""
from collections import Counter
import argparse
import csv
from pathlib import Path
import sqlite3
from generate_frontend_data import ROOT

parser = argparse.ArgumentParser()
parser.add_argument("--db", type=Path, required=True)
args = parser.parse_args()
con = sqlite3.connect(f"file:{args.db.resolve()}?mode=ro", uri=True)
try:
    edited = con.execute("""
        SELECT t.slug, s.section_key FROM term_article_sections s
        JOIN terms t ON t.id=s.term_id
        WHERE s.editorial_notes='Batch 05: source-scoped lexicographic clarification; earlier reference data preserved.'
    """).fetchall()
    interpretations = con.execute("""
        SELECT t.slug, i.id, COUNT(DISTINCT c.source_passage_id)
        FROM interpretations i JOIN terms t ON t.id=i.term_id
        LEFT JOIN citations c ON c.interpretation_id=i.id
        WHERE i.scope LIKE '%(Batch 05 direct witness:%'
        GROUP BY t.slug, i.id
    """).fetchall()
    cited_passages = con.execute("""
        SELECT COUNT(DISTINCT locator_text) FROM source_passages
        WHERE locator_text LIKE 'Batch 05 directly checked%'
    """).fetchone()[0]
    public = con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk = con.execute("PRAGMA foreign_key_check").fetchall()
finally:
    con.close()
if len(edited) != 14 or len({slug for slug, _ in edited}) != 13:
    raise AssertionError(f"Expected 14 real section edits / 13 headwords, got {edited}")
if len(interpretations) != 6 or any(n != 1 for _, _, n in interpretations) or cited_passages != 6:
    raise AssertionError(f"Expected 6 precisely linked direct witnesses, found {interpretations} / {cited_passages}")
if public != 468 or fk:
    raise AssertionError(f"Corpus changed: public={public}; foreign key errors={fk[:3]}")
selection = [x.strip() for x in (ROOT/"docs/editorial/batch-05-dignities-slugs.txt").read_text(encoding="utf-8").splitlines() if x.strip()]
if len(selection) != 40 or len(set(selection)) != 40:
    raise AssertionError("Expected 40 distinct canonical public headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8", newline="") as f:
    ledger = {row["slug"]: row for row in csv.DictReader(f)}
if not set(selection).issubset(ledger):
    raise AssertionError("Missing editorial ledger entry")
states = Counter(ledger[slug]["review_state"] for slug in selection)
expected = {"source-pending":14, "triaged":19, "revised-awaiting-review":7}
if dict(states) != expected:
    raise AssertionError(f"Unexpected proposed states {states}, expected {expected}")
if any(ledger[slug]["reviewer_signoff"] for slug in selection):
    raise AssertionError("Batch 05 approvals require human identity")
print("Batch 05 OK: 40 published entries, 13 revised, 14 sections, 6 direct cited witnesses, 14 explicit source holds, zero automatic approvals.")
