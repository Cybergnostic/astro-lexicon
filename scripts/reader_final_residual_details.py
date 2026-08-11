#!/usr/bin/env python3
"""Print source-aware evidence for the final reader-usefulness residual set."""

from __future__ import annotations

import sqlite3
from reader_usefulness_triage import ROOT, build_db

DB = ROOT / '.tmp/reader-final-residual-details.sqlite'
SLUGS = [
    'apogee','equinoctial','first-movement','masculine-planet','second-movement','solar-eclipse',
    'detriment','domicile','face-decan','triplicity','anareta','planetary-hour',
    'planetary-recurrence','planetary-years','world-year-revolution','decan-figure','inconjunct',
]

def clip(v, n=1800):
    s = '' if v is None else str(v).replace('\n',' ').strip()
    return s if len(s) <= n else s[:n] + '…'

DB.parent.mkdir(parents=True, exist_ok=True)
build_db(DB)
con=sqlite3.connect(DB); con.row_factory=sqlite3.Row
try:
    print(f'FINAL RESIDUAL DETAILS|count={len(SLUGS)}')
    for slug in SLUGS:
        t=con.execute("SELECT id,label,short_definition,category,definition_quality,editorial_notes FROM terms WHERE slug=?",(slug,)).fetchone()
        if not t:
            print(f'\n### MISSING {slug}'); continue
        print(f"\n### {t['label']} [{slug}] quality={t['definition_quality']} category={t['category']}")
        print('DEF:',clip(t['short_definition']))
        print('NOTES:',clip(t['editorial_notes']))
        a=con.execute("SELECT intro,editorial_notes FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')",(t['id'],)).fetchone()
        if a:
            print('INTRO:',clip(a['intro']))
            print('ARTICLE NOTES:',clip(a['editorial_notes']))
        for r in con.execute("SELECT section_key,heading,body,sort_order,editorial_notes FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id",(t['id'],)):
            print(f"SECTION {r['sort_order']} {r['section_key']} | {r['heading']}: {clip(r['body'])} | notes={clip(r['editorial_notes'],800)}")
        for r in con.execute("SELECT table_key,heading,caption,columns_json,rows_json,sort_order FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id",(t['id'],)):
            print(f"TABLE {r['sort_order']} {r['table_key']} | {r['heading']}: {clip(r['caption'],700)} | columns={clip(r['columns_json'],500)} | rows={clip(r['rows_json'],2200)}")
        for r in con.execute("""
            SELECT tr.relation_type,tr.note,
              CASE WHEN tr.subject_term_id=? THEN 'out' ELSE 'in' END direction,
              CASE WHEN tr.subject_term_id=? THEN o.slug ELSE s.slug END other_slug,
              CASE WHEN tr.subject_term_id=? THEN o.label ELSE s.label END other_label
            FROM term_relations tr JOIN terms s ON s.id=tr.subject_term_id JOIN terms o ON o.id=tr.object_term_id
            WHERE tr.status IN ('reviewed','published') AND (tr.subject_term_id=? OR tr.object_term_id=?)
            ORDER BY tr.relation_type,other_label
        """,(t['id'],t['id'],t['id'],t['id'],t['id'])):
            print(f"REL {r['direction']} {r['relation_type']} -> {r['other_label']} [{r['other_slug']}] note={clip(r['note'],900)}")
        for i,r in enumerate(con.execute("""
          SELECT i.summary,i.scope,i.certainty,i.evidence_grade,w.title work_title,a.name author_name
          FROM interpretations i LEFT JOIN works w ON w.id=i.work_id LEFT JOIN authors a ON a.id=w.author_id
          WHERE i.term_id=? AND i.status IN ('reviewed','published') ORDER BY i.id
        """,(t['id'],)),1):
            print(f"INTERP {i}: {r['author_name']} | {r['work_title']} | grade={r['evidence_grade']} | scope={clip(r['scope'],450)} | {clip(r['summary'])}")
finally:
    con.close()
