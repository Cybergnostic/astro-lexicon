#!/usr/bin/env python3
"""Batch 09: fail-closed substantive edit, direct witness, cohort and signoff checks."""
from __future__ import annotations
import argparse,csv,sqlite3
from pathlib import Path
from collections import Counter
from generate_frontend_data import ROOT

p=argparse.ArgumentParser();p.add_argument("--db",type=Path,required=True)
args=p.parse_args();db=args.db.resolve()
con=sqlite3.connect(f"file:{db}?mode=ro",uri=True)
try:
    definitions=con.execute("SELECT slug FROM terms WHERE editorial_notes='Batch 09: directly checked Lilly attribution of later minor aspect; no retrospective classical claim.'").fetchall()
    sections=con.execute("""SELECT t.slug,s.section_key FROM term_article_sections s JOIN terms t ON t.id=s.term_id WHERE s.editorial_notes='Batch 09: verified Lilly illustration or source-bounded distinction.'""").fetchall()
    intros=con.execute("""SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id WHERE a.editorial_notes='Batch 09: remove repetition or distinguish principal and newer aspects.'""").fetchall()
    sources=con.execute("""SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id) FROM interpretations i JOIN terms t ON t.id=i.term_id LEFT JOIN citations c ON c.interpretation_id=i.id WHERE i.scope LIKE '%(Batch 09 direct passage:%' GROUP BY t.slug,i.id""").fetchall()
    witnesses=con.execute("SELECT COUNT(DISTINCT locator_text) FROM source_passages WHERE locator_text LIKE 'Batch 09 direct Lilly%'").fetchone()[0]
    public=con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=con.execute("PRAGMA foreign_key_check").fetchall()
finally:con.close()
if len(definitions)!=8 or len(set(s for s, in definitions))!=8:raise AssertionError(f"8 new aspect definitions required: {definitions}")
if len(sections)!=8 or len(set((a,b) for a,b in sections))!=8:raise AssertionError(f"8 edited explanatory sections required: {sections}")
if len(intros)!=3:raise AssertionError(f"Three actual edited article intros required: {intros}")
changed={s for s, in definitions}|{s for s,_ in sections}|{s for s, in intros}
if len(changed)!=16:raise AssertionError(f"16 uniquely revised entries required, got {changed}")
if len(sources)!=15 or witnesses!=15 or any(n!=1 for _,_,n in sources):
    raise AssertionError(f"Expected 15 citation-linked primary passage accounts, got {sources} passages={witnesses}")
if public!=468 or fk:raise AssertionError(f"Public count or referential integrity changed: {public}, {fk[:4]}")
slugs=[s.strip() for s in (ROOT/"docs/editorial/batch-09-conditions-slugs.txt").read_text(encoding="utf-8").splitlines() if s.strip()]
if len(slugs)!=40 or len(set(slugs))!=40:raise AssertionError("Forty distinct public headwords required")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8",newline="") as f:
    ledger={r["slug"]:r for r in csv.DictReader(f)}
if not set(slugs).issubset(ledger):raise AssertionError("Missing ledger headwords")
states=Counter(ledger[s]["review_state"] for s in slugs)
expected={"source-pending":20,"revised-awaiting-review":4,"triaged":16}
if states!=expected:raise AssertionError(f"Unexpected Batch 09 states: {states}, expected {expected}")
if any(ledger[s]["reviewer_signoff"] for s in slugs):raise AssertionError("No automatic human approvals")
print("Batch 09 PASS: forty canonical entries, sixteen changed headwords, eight definitions, eight sections, three intros, fifteen linked Lilly witnesses; twenty source holds, zero signoffs.")
