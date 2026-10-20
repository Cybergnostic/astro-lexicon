#!/usr/bin/env python3
"""Batch 12: verify exact edited rows, citation links, public corpus and human signoffs."""
import argparse, csv, sqlite3
from collections import Counter
from pathlib import Path
from generate_frontend_data import ROOT

parser=argparse.ArgumentParser()
parser.add_argument("--db",required=True,type=Path)
args=parser.parse_args()
con=sqlite3.connect(f"file:{args.db.resolve()}?mode=ro",uri=True)
try:
    defs=con.execute("""SELECT slug FROM terms
       WHERE editorial_notes='Batch 12: source-bounded historical distinction; not contemporary medical advice.'""").fetchall()
    intros=con.execute("""SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id
       WHERE a.editorial_notes='Batch 12: concise non-redundant source-attributed introduction.'""").fetchall()
    sections=con.execute("""SELECT t.slug,s.section_key FROM term_article_sections s
       JOIN terms t ON t.id=s.term_id
       WHERE s.editorial_notes='Batch 12: revised actual explanation, preserving source distinctions and medical history context.'""").fetchall()
    witnesses=con.execute("""SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
       FROM interpretations i JOIN terms t ON t.id=i.term_id
       LEFT JOIN citations c ON c.interpretation_id=i.id
       WHERE i.scope LIKE '%(Batch 12 directly checked:%'
       GROUP BY t.slug,i.id""").fetchall()
    passages=con.execute("""SELECT COUNT(DISTINCT locator_text) FROM source_passages
       WHERE locator_text LIKE 'Batch 12 checked %'""").fetchone()[0]
    published=con.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=con.execute("PRAGMA foreign_key_check").fetchall()
finally:
    con.close()
changed={r[0] for r in defs}|{r[0] for r in intros}|{r[0] for r in sections}
if (len(defs),len(intros),len(sections),len(changed))!=(1,4,10,14):
    raise AssertionError(f"Incorrect applied revision count: defs={defs}; intros={intros}; sections={sections}")
if len(witnesses)!=10 or passages!=10 or any(n!=1 for _,_,n in witnesses):
    raise AssertionError(f"Expected ten directly linked witnesses, found {witnesses}, passages {passages}")
if published!=468 or fk:
    raise AssertionError(f"Corpus integrity failure: published={published}; foreign keys={fk[:4]}")
slugs=[s.strip() for s in (ROOT/"docs/editorial/batch-12-foundations-slugs.txt").read_text(encoding="utf-8").splitlines() if s.strip()]
if len(slugs)!=40 or len(set(slugs))!=40 or not changed.issubset(slugs):
    raise AssertionError("Expected 40 distinct canonical headwords and all edits inside cohort")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf-8",newline="") as f:
    ledger={r["slug"]:r for r in csv.DictReader(f)}
if not set(slugs).issubset(ledger):raise AssertionError("Missing original review ledger entries")
states=Counter(ledger[s]["review_state"] for s in slugs)
expected={"source-pending":24,"revised-awaiting-review":7,"triaged":9}
if states!=expected:raise AssertionError(f"Unexpected review states: {states} != {expected}")
if any(ledger[s]["reviewer_signoff"] for s in slugs):
    raise AssertionError("Human approvals cannot be synthesized")
if not all(ledger[s]["pending_check"] for s in slugs if ledger[s]["review_state"]=="source-pending"):
    raise AssertionError("Source-pending entries must retain explicit questions")
print("Batch 12 PASS: 40 public entries, 14 actual edits, 10 linked source passages, 24 source holds, 0 human approvals.")
