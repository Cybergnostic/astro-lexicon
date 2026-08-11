#!/usr/bin/env python3
"""Print source-aware details for Batch E ontology-review candidates."""

from __future__ import annotations

import sqlite3

from reader_usefulness_triage import ROOT, build_db

DB = ROOT / '.tmp/reader-ontology-details.sqlite'
SLUGS = [
    'opening-the-doors','universal-question','exaltation-degree','lot-of-eros',
    'bond-of-moon','celestial-power','dustoria','lunar-dichotomy','natal-rectification',
    'planetary-elevation','rejoicing-condition','trutine-of-hermes','feral',
    'opening-of-gates','fardar',
]


def clip(value, n=1400):
    if value is None:
        return ''
    s = str(value).replace('\n',' ').strip()
    return s if len(s) <= n else s[:n] + '…'


DB.parent.mkdir(parents=True, exist_ok=True)
build_db(DB)
con = sqlite3.connect(DB)
con.row_factory = sqlite3.Row
try:
    print(f'ONTOLOGY DETAILS|count={len(SLUGS)}')
    for slug in SLUGS:
        term = con.execute("SELECT id,label,short_definition,category,editorial_notes,definition_quality FROM terms WHERE slug=?", (slug,)).fetchone()
        if not term:
            print(f'\n### MISSING {slug}')
            continue
        print(f"\n### {term['label']} [{slug}] quality={term['definition_quality']}")
        print('DEF:', clip(term['short_definition']))
        print('NOTES:', clip(term['editorial_notes']))
        article = con.execute("SELECT intro,editorial_notes FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')", (term['id'],)).fetchone()
        if article:
            print('INTRO:', clip(article['intro']))
            print('ARTICLE NOTES:', clip(article['editorial_notes']))
        for row in con.execute("SELECT section_key,heading,body,sort_order,editorial_notes FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id", (term['id'],)):
            print(f"SECTION {row['sort_order']} {row['section_key']} | {row['heading']}: {clip(row['body'])} | notes={clip(row['editorial_notes'],700)}")
        for row in con.execute("SELECT table_key,heading,caption,columns_json,rows_json,sort_order FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id", (term['id'],)):
            print(f"TABLE {row['sort_order']} {row['table_key']} | {row['heading']}: {clip(row['caption'],700)} | columns={clip(row['columns_json'],500)} | rows={clip(row['rows_json'],1600)}")
        for row in con.execute("""
            SELECT tr.relation_type,tr.note,
                   CASE WHEN tr.subject_term_id=? THEN 'out' ELSE 'in' END direction,
                   CASE WHEN tr.subject_term_id=? THEN o.slug ELSE s.slug END other_slug,
                   CASE WHEN tr.subject_term_id=? THEN o.label ELSE s.label END other_label
            FROM term_relations tr JOIN terms s ON s.id=tr.subject_term_id JOIN terms o ON o.id=tr.object_term_id
            WHERE tr.status IN ('reviewed','published') AND (tr.subject_term_id=? OR tr.object_term_id=?)
            ORDER BY tr.relation_type,other_label
        """, (term['id'],term['id'],term['id'],term['id'],term['id'])):
            print(f"REL {row['direction']} {row['relation_type']} -> {row['other_label']} [{row['other_slug']}] note={clip(row['note'],800)}")
        for i,row in enumerate(con.execute("""
            SELECT i.summary,i.scope,i.certainty,i.evidence_grade,i.editorial_notes,
                   w.title work_title,a.name author_name
            FROM interpretations i LEFT JOIN works w ON w.id=i.work_id LEFT JOIN authors a ON a.id=w.author_id
            WHERE i.term_id=? AND i.status IN ('reviewed','published') ORDER BY i.id
        """, (term['id'],)),1):
            print(f"INTERP {i}: {row['author_name']} | {row['work_title']} | grade={row['evidence_grade']} | scope={clip(row['scope'],400)} | {clip(row['summary'])} | notes={clip(row['editorial_notes'],800)}")
finally:
    con.close()
