#!/usr/bin/env python3
"""Batch 10: fail-closed Lots editing, direct witnesses, source holds and public headwords."""
from __future__ import annotations
import argparse,csv,sqlite3
from pathlib import Path
from collections import Counter
from generate_frontend_data import ROOT
p=argparse.ArgumentParser();p.add_argument("--db",required=True,type=Path);a=p.parse_args()
con=sqlite3.connect(f"file:{a.db.resolve()}?mode=ro",uri=True)
try:
    intros=con.execute("""SELECT t.slug FROM term_articles x JOIN terms t ON t.id=x.term_id
    WHERE x.editorial_notes='Batch 10: source-specific Lot distinction or removal of repeated introductory wording.'""").fetchall()
    sections=con.execute("""SELECT t.slug,s.section_key FROM term_article_sections s JOIN terms t ON t.id=s.term_id
    WHERE s.editorial_notes='Batch 10: checked source conflict or author-specific alternative preserved.'""").fetchall()
    witnesses=con.execute("""SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
    FROM interpretations i JOIN terms t ON t.id=i.term_id LEFT JOIN citations c ON c.interpretation_id=i.id
    WHERE i.scope LIKE '%(Batch 10 checked passage:%' GROUP BY t.slug,i.id""").fetchall()
    passages=con.execute("""SELECT COUNT(DISTINCT locator_text) FROM source_passages
    WHERE locator_text LIKE 'Batch 10 directly inspected%'""").fetchone()[0]
    public=con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=con.execute("PRAGMA foreign_key_check").fetchall()
finally:con.close()
changed={slug for slug, in intros}|{slug for slug,_ in sections}
if len(intros)!=19 or len(sections)!=3 or len(changed)!=19:
    raise AssertionError(f"Expect 19 changed intros, 3 sections on 19 headwords. Actual intro={intros} sections={sections}")
if len(witnesses)!=16 or passages!=16 or any(n!=1 for _,_,n in witnesses):
    raise AssertionError(f"Expect 16 individually cited source accounts; found {witnesses}, passages={passages}")
if public!=468 or fk:raise AssertionError(f"Corpus integrity changed: public={public}, foreign keys={fk[:3]}")
cohort=[x.strip() for x in (ROOT/"docs/editorial/batch-10-lots-slugs.txt").read_text(encoding="utf-8").splitlines() if x.strip()]
if len(cohort)!=40 or len(set(cohort))!=40:
    raise AssertionError("Require 40 distinct canonical public headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8",newline="") as f:
    ledger={r["slug"]:r for r in csv.DictReader(f)}
if not set(cohort).issubset(ledger):raise AssertionError("A selected term is absent from the editorial ledger")
states=Counter(ledger[s]["review_state"] for s in cohort)
expected={"source-pending":26,"revised-awaiting-review":5,"triaged":9}
if states!=expected:raise AssertionError(f"Batch 10 review states {states} do not equal {expected}")
if any(ledger[s]["reviewer_signoff"] for s in cohort):
    raise AssertionError("Automatic human approval is forbidden")
if "4.83" not in ledger["lot-of-enemies-hermes"]["pending_check"] or "6.15" not in ledger["lot-of-enemies-hermes"]["pending_check"]:
    raise AssertionError("The historical Hermes Enemies Lot source conflict must remain open")
print("PASS Batch 10: 40 public terms; 19 actual revisions and 3 updated technical sections; 16 cited witnesses; 26 source checks; no fabricated approvals.")
