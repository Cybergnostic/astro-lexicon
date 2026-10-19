#!/usr/bin/env python3
"""Batch 06 non-destructive edit, citation and review-state guardrail."""
import argparse,csv,sqlite3
from pathlib import Path
from collections import Counter
from generate_frontend_data import ROOT
p=argparse.ArgumentParser();p.add_argument("--db",type=Path,required=True);args=p.parse_args()
db=args.db.resolve()
if not db.exists():p.error("Build SQLite before checking.")
conn=sqlite3.connect(f"file:{db}?mode=ro",uri=True)
try:
    sections=conn.execute("""
        SELECT t.slug,s.section_key FROM term_article_sections s JOIN terms t ON t.id=s.term_id
        WHERE s.editorial_notes='Batch 06: verified astronomy/reference-frame clarification; existing schemes preserved.'
    """).fetchall()
    intros=conn.execute("""
        SELECT t.slug FROM term_articles a JOIN terms t ON t.id=a.term_id
        WHERE a.editorial_notes='Batch 06: redundant definition lead suppressed or replaced with primary-source distinction.'
    """).fetchall()
    checks=conn.execute("""
        SELECT t.slug,i.id,COUNT(DISTINCT c.source_passage_id)
        FROM interpretations i JOIN terms t ON t.id=i.term_id
        LEFT JOIN citations c ON c.interpretation_id=i.id
        WHERE i.scope LIKE '%(Batch 06 directly inspected:%'
        GROUP BY t.slug,i.id
    """).fetchall()
    passages=conn.execute("SELECT COUNT(DISTINCT locator_text) FROM source_passages WHERE locator_text LIKE 'Batch 06 primary witness:%'").fetchone()[0]
    public=conn.execute("SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')").fetchone()[0]
    fk=conn.execute("PRAGMA foreign_key_check").fetchall()
finally:conn.close()
changed={slug for slug,_ in sections}|{slug for slug, in intros}
if len(sections)!=19 or len(intros)!=10 or len(changed)!=22:
    raise AssertionError(f"Expected 19 section edits / 10 introductions across 22 headwords; actual {sections},{intros}")
if len(checks)!=15 or passages!=15 or any(n!=1 for _,_,n in checks):
    raise AssertionError(f"Expected 15 exactly linked source witnesses, found checks={checks} passages={passages}")
if public!=468 or fk:raise AssertionError(f"Corpus changed unexpectedly: public {public}, fk {fk}")
slugs=[line.strip() for line in (ROOT/"docs/editorial/batch-06-astronomical-slugs.txt").read_text(encoding="utf8").splitlines() if line.strip()]
if len(slugs)!=40 or len(set(slugs))!=40:raise AssertionError("Batch requires forty distinct headwords")
with (ROOT/"docs/editorial/lexicographic-ledger.csv").open(encoding="utf8",newline="") as f:ledger={r["slug"]:r for r in csv.DictReader(f)}
if not set(slugs).issubset(ledger):raise AssertionError("Missing or unpublished term in review ledger")
states=Counter(ledger[s]["review_state"] for s in slugs)
expected={"revised-awaiting-review":13,"source-pending":12,"triaged":15}
if dict(states)!=expected:raise AssertionError(f"Review ledger statuses {dict(states)} differ from {expected}")
if any(ledger[s]["reviewer_signoff"] for s in slugs):raise AssertionError("Human signoff must not be invented")
print("PASS: Batch 06 has 40 verified public slugs, 22 edited entries, 15 checked and linked passages, 12 open source holds, zero automatic approvals.")
