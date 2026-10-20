#!/usr/bin/env python3
"""Check Batch 07 against rebuilt SQLite; source witnesses require linked citations."""
import argparse
import csv
import sqlite3
from collections import Counter
from pathlib import Path
from generate_frontend_data import ROOT

p=argparse.ArgumentParser()
p.add_argument("--db",type=Path,required=True)
args=p.parse_args()
conn=sqlite3.connect(f"file:{args.db.resolve()}?mode=ro",uri=True)
try:
    defs=conn.execute("""SELECT slug FROM terms WHERE editorial_notes=
        'Batch 07: traditional lexicographic headword priority, source-collated planetary nature.'""").fetchall()
    sections=conn.execute("""SELECT t.slug,s.section_key FROM term_article_sections s
        JOIN terms t ON t.id=s.term_id WHERE s.editorial_notes=
        'Batch 07: precise source-dependent clarification or removal of duplicate interpretive language.'""").fetchall()
    intros=conn.execute("""SELECT t.slug,a.intro FROM term_articles a
        JOIN terms t ON t.id=a.term_id WHERE a.editorial_notes=
        'Batch 07: omitted introduction duplicated the definition and existing technical sections.'""").fetchall()
    witnesses=conn.execute("""SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
        FROM interpretations i JOIN terms t ON t.id=i.term_id
        LEFT JOIN citations c ON c.interpretation_id=i.id
        WHERE i.scope LIKE '%(Batch 07 direct check:%'
        GROUP BY t.slug,i.id""").fetchall()
    passages=conn.execute("""SELECT COUNT(*) FROM source_passages
        WHERE locator_text LIKE 'Batch 07 checked al-Bīrūnī %'""").fetchone()[0]
    public=conn.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=conn.execute("PRAGMA foreign_key_check").fetchall()
finally:conn.close()

if len(defs)!=6 or len(sections)!=8 or len(intros)!=8:
    raise AssertionError(f"Expected 6 planetary definitions, 8 sections, 8 introductions; got {defs}, {sections}, {intros}")
if any(intro for _,intro in intros):
    raise AssertionError("The eight fully repeated leads must be removed, not replaced with another repetitive paragraph")
changed={s for s, in defs}|{s for s,_ in sections}|{s for s,_ in intros}
if len(changed)!=18:
    raise AssertionError(f"Expected 18 genuinely changed public headwords, got {len(changed)} {sorted(changed)}")
if len(witnesses)!=12 or passages!=12 or any(count!=1 for _,_,count in witnesses):
    raise AssertionError(f"12 citation-linked direct source witnesses required: {witnesses} / {passages}")
if public!=468 or fk:
    raise AssertionError(f"Corpus integrity problem: public={public}, foreign keys={fk}")
slugs=[x.strip() for x in (ROOT/"docs/editorial/batch-07-core-slugs.txt").read_text(encoding="utf8").splitlines() if x.strip()]
if len(slugs)!=40 or len(set(slugs))!=40:
    raise AssertionError("Expected exactly 40 distinct selected public headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf8",newline="") as f:
    ledger={x["slug"]:x for x in csv.DictReader(f)}
if not set(slugs).issubset(ledger):
    raise AssertionError("Every selected slug needs an editorial review state")
states=Counter(ledger[slug]["review_state"] for slug in slugs)
expected={"revised-awaiting-review":9,"source-pending":14,"triaged":17}
if dict(states)!=expected:
    raise AssertionError(f"Expected status breakdown {expected} got {dict(states)}")
if any(ledger[slug]["reviewer_signoff"] for slug in slugs):
    raise AssertionError("No automatic human approval")
print("PASS Batch 07: 40 new terms, 18 changed, 6 definitions, 8 technical sections, 8 repeated leads removed, 12 cited witnesses, 14 source holds.")
