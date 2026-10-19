#!/usr/bin/env python3
"""Batch 04 guardrail: SQL updates, primary-source links and human holds."""
from __future__ import annotations
import argparse
import csv
import sqlite3
from pathlib import Path
from collections import Counter
from generate_frontend_data import ROOT

p=argparse.ArgumentParser()
p.add_argument("--db",type=Path,required=True)
args=p.parse_args()
db=args.db.resolve()
if not db.is_file():p.error(f"Database missing: {db}")
con=sqlite3.connect(f"file:{db}?mode=ro",uri=True)
try:
    sections=con.execute("""
        SELECT t.slug,s.section_key FROM term_article_sections s
        JOIN terms t ON t.id=s.term_id
        WHERE s.editorial_notes='Batch 04: source-aware explanation, distinct mechanism or verified Lilly illustration.'
    """).fetchall()
    leads=con.execute("""
        SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id
        WHERE a.editorial_notes='Batch 04: definition-to-article redundancy reduced without changing technical identity.'
    """).fetchall()
    direct=con.execute("""
        SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
        FROM interpretations i JOIN terms t ON t.id=i.term_id
        LEFT JOIN citations c ON c.interpretation_id=i.id
        WHERE i.scope LIKE '%(Batch 04 checked passage:%'
        GROUP BY i.id,t.slug
    """).fetchall()
    passages=con.execute("""
        SELECT COUNT(*) FROM source_passages
        WHERE locator_text LIKE 'Batch 04 checked Lilly%'
    """).fetchone()[0]
    fk=con.execute("PRAGMA foreign_key_check").fetchall()
    public=con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
finally:con.close()
if len(sections)!=18:raise AssertionError(f"Expected 18 changed sections, found {len(sections)}: {sections}")
if len(leads)!=6:raise AssertionError(f"Expected six revised introductions, found {len(leads)}: {leads}")
edited=set(s for s,_ in sections)|set(s for s, in leads)
if len(edited)!=15:raise AssertionError(f"Expected 15 genuinely changed headwords, found {len(edited)}: {sorted(edited)}")
if len(direct)!=12 or any(n!=1 for _,_,n in direct) or passages!=12:
    raise AssertionError(f"Expected twelve distinct linked Lilly witnesses: interpretations={direct}; passages={passages}")
if fk:raise AssertionError(f"Foreign key violations: {fk[:5]}")
if public!=468:raise AssertionError(f"Expected 468 public headwords, got {public}")
slugs=[line.strip() for line in (ROOT/"docs/editorial/batch-04-horary-slugs.txt").read_text(encoding="utf8").splitlines() if line.strip()]
if len(slugs)!=40 or len(set(slugs))!=40:raise AssertionError("Batch 04 needs 40 unique canonical headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf8",newline="") as f:
    ledger={r["slug"]:r for r in csv.DictReader(f)}
if any(s not in ledger for s in slugs):raise AssertionError("Missing Batch 04 editorial ledger rows")
states=Counter(ledger[s]["review_state"] for s in slugs)
expected={"revised-awaiting-review":14,"source-pending":10,"triaged":16}
if dict(states)!=expected:raise AssertionError(f"Unexpected review states {dict(states)} != {expected}")
if any(ledger[s]["reviewer_signoff"] for s in slugs):
    raise AssertionError("No unsupervised reviewer signoff is allowed")
print(f"PASS: Batch 04 — 40 entries; 15 edited headwords; {len(sections)} sections, {len(leads)} leads; 12 linked checked witnesses; ten unresolved source holds.")
