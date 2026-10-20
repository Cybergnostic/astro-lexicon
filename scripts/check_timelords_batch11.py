#!/usr/bin/env python3
"""Batch 11 fail-closed control: actual edits, exact cited passages, status and count."""
import argparse, csv, sqlite3
from collections import Counter
from pathlib import Path
from generate_frontend_data import ROOT

parser=argparse.ArgumentParser();parser.add_argument("--db",type=Path,required=True)
args=parser.parse_args();con=sqlite3.connect(f"file:{args.db.resolve()}?mode=ro",uri=True)
try:
    defs=con.execute("""SELECT slug FROM terms WHERE editorial_notes='Batch 11: corrected source-specific timing or directional definition.'""").fetchall()
    sections=con.execute("""SELECT t.slug,s.section_key FROM term_article_sections s JOIN terms t ON t.id=s.term_id
       WHERE s.editorial_notes='Batch 11: edited original section with source-bounded timing evidence.'""").fetchall()
    intros=con.execute("""SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id
       WHERE a.editorial_notes='Batch 11: condensed historical technique introduction without changing methods or numeric data.'""").fetchall()
    source=con.execute("""SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
       FROM interpretations i JOIN terms t ON t.id=i.term_id
       LEFT JOIN citations c ON c.interpretation_id=i.id
       WHERE i.scope LIKE '%(Batch 11 checked witness:%'
       GROUP BY i.id,t.slug""").fetchall()
    witness_count=con.execute("SELECT COUNT(DISTINCT locator_text) FROM source_passages WHERE locator_text LIKE 'Batch 11 checked Lilly%'").fetchone()[0]
    public=con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=con.execute("PRAGMA foreign_key_check").fetchall()
finally:con.close()
all_edited={r[0] for r in defs}|{r[0] for r in sections}|{r[0] for r in intros}
if (len(defs),len(sections),len(intros),len(all_edited))!=(3,11,3,13):
    raise AssertionError(f"Actual edit mismatch: defs={defs} sections={sections} intros={intros}")
if len(source)!=11 or witness_count!=11 or any(n!=1 for _,_,n in source):
    raise AssertionError(f"Missing linked source witness: source={source} passages={witness_count}")
if fk or public!=468:raise AssertionError(f"Corpus integrity failure: public={public}, foreign keys={fk[:4]}")
members=[s.strip() for s in (ROOT/"docs/editorial/batch-11-time-lords-slugs.txt").read_text(encoding="utf8").splitlines() if s.strip()]
if len(members)!=40 or len(set(members))!=40:raise AssertionError("Expected 40 distinct public headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf8",newline="") as f:
    ledger={row["slug"]:row for row in csv.DictReader(f)}
if not set(members).issubset(ledger):raise AssertionError("Batch members missing ledger entries")
states=Counter(ledger[s]["review_state"] for s in members)
expected={"source-pending":23,"revised-awaiting-review":6,"triaged":11}
if states!=expected:raise AssertionError(f"Review states mismatch {states} != {expected}")
if any(ledger[s]["reviewer_signoff"] for s in members):
    raise AssertionError("Only the human reviewer can approve a term")
print("Batch 11 PASS: 40 headwords; 13 actual revisions, 11 source-linked Lilly witnesses, 23 held source checks, 0 human approvals.")
