#!/usr/bin/env python3
"""Batch 08 audit: actual SQLite edits, exact evidence links, human holds."""
from __future__ import annotations
import argparse
import csv
import sqlite3
from pathlib import Path
from collections import Counter
from generate_frontend_data import ROOT

p = argparse.ArgumentParser()
p.add_argument("--db", type=Path, required=True)
a = p.parse_args()
con = sqlite3.connect(f"file:{a.db.resolve()}?mode=ro", uri=True)
try:
    intros = con.execute("""
        SELECT t.slug, a.intro FROM term_articles a JOIN terms t ON t.id=a.term_id
        WHERE a.editorial_notes='Batch 08: remove duplicated introduction; retain canonical definition and distinct sourced article sections.'
    """).fetchall()
    edited = con.execute("""
        SELECT t.slug,s.section_key FROM term_article_sections s JOIN terms t ON t.id=s.term_id
        WHERE s.editorial_notes='Batch 08: source-scoped technical difference from historical author or direct evidence.'
    """).fetchall()
    witnesses = con.execute("""
        SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
        FROM interpretations i JOIN terms t ON t.id=i.term_id
        LEFT JOIN citations c ON c.interpretation_id=i.id
        WHERE i.scope LIKE '%(Batch 08 direct witness:%'
        GROUP BY t.slug,i.id
    """).fetchall()
    passage_count = con.execute("""
        SELECT COUNT(DISTINCT locator_text) FROM source_passages
        WHERE locator_text LIKE 'Batch 08 direct al-Bīrūnī %'
    """).fetchone()[0]
    public = con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk = con.execute("PRAGMA foreign_key_check").fetchall()
finally:
    con.close()

if len(intros)!=20 or any(intro for _,intro in intros):
    raise AssertionError(f"Expected 20 actually removed redundant leads: {intros}")
if len(edited)!=14:
    raise AssertionError(f"Expected 14 edited existing sections: {edited}")
changed={slug for slug,_ in intros}|{slug for slug,_ in edited}
if len(changed)!=22:
    raise AssertionError(f"Expected 22 actual revised headwords, got {sorted(changed)}")
if len(witnesses)!=13 or passage_count!=13 or any(n!=1 for _,_,n in witnesses):
    raise AssertionError(f"Expected 13 individually cited direct historical witnesses, got {witnesses}; passages={passage_count}")
if public!=468 or fk:
    raise AssertionError(f"Corpus integrity changed: public={public}, fk={fk[:5]}")
slugs=[x.strip() for x in (ROOT/"docs/editorial/batch-08-signs-slugs.txt").read_text(encoding="utf-8").splitlines() if x.strip()]
if len(slugs)!=40 or len(set(slugs))!=40:
    raise AssertionError("Exactly 40 distinct canonical public headwords required")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8",newline="") as f:
    ledger={row["slug"]:row for row in csv.DictReader(f)}
if not set(slugs).issubset(ledger):
    raise AssertionError("Batch 08 public headwords missing from review ledger")
state=Counter(ledger[s]["review_state"] for s in slugs)
wanted={"source-pending":12,"revised-awaiting-review":18,"triaged":10}
if dict(state)!=wanted:
    raise AssertionError(f"Ledger state expected {wanted} got {state}")
if any(ledger[s]["reviewer_signoff"] for s in slugs):
    raise AssertionError("Human approvals may never be automatically recorded")
print("PASS Batch 08: 40 new headwords, 22 actual changes, 20 redundant leads removed, 14 sections, 13 direct cited witnesses and 12 research holds.")
