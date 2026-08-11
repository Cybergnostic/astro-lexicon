#!/usr/bin/env python3
"""Print source-aware details for the remaining Batch D families."""

from __future__ import annotations

import sqlite3

from reader_usefulness_triage import ROOT, build_db

DB = ROOT / '.tmp/reader-family-details.sqlite'
SIGN_CLASS_SLUGS = [
    'barren-sign','diurnal-sign','fecund-sign','feminine-sign','half-voice-sign',
    'half-voiced-sign','human-sign','masculine-sign','nocturnal-sign','powerful-voiced-sign',
    'quadruped-sign','sign-modality','voiced-sign','voiceless-sign','weak-voiced-sign',
]
HOUSE_SLUGS = [
    'cardine','cadent-place','derived-house','places-for-dealings','places-without-dealings',
    'planetary-joy','short-journey','succedent-place','twelve-places',
]


def clip(value, n=900):
    if value is None:
        return ''
    s = str(value).replace('\n',' ').strip()
    return s if len(s) <= n else s[:n] + '…'


DB.parent.mkdir(parents=True, exist_ok=True)
build_db(DB)
con = sqlite3.connect(DB)
con.row_factory = sqlite3.Row
try:
    for family, slugs in [('SIGN CLASSIFICATIONS', SIGN_CLASS_SLUGS), ('HOUSES / PLACES', HOUSE_SLUGS)]:
        print(f'\n## {family}')
        for slug in slugs:
            term = con.execute("SELECT id,label,short_definition,category FROM terms WHERE slug=?", (slug,)).fetchone()
            if not term:
                print(f'\n### MISSING {slug}')
                continue
            print(f"\n### {term['label']} [{slug}]")
            print('DEF:', clip(term['short_definition'], 700))
            article = con.execute("SELECT intro FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')", (term['id'],)).fetchone()
            if article and article['intro']:
                print('INTRO:', clip(article['intro'], 1000))
            for row in con.execute("SELECT heading,body,sort_order FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id", (term['id'],)):
                print(f"SECTION {row['sort_order']} {row['heading']}: {clip(row['body'],1200)}")
            for row in con.execute("""
                SELECT tr.relation_type, tr.note,
                       CASE WHEN tr.subject_term_id=? THEN 'out' ELSE 'in' END direction,
                       CASE WHEN tr.subject_term_id=? THEN o.slug ELSE s.slug END other_slug,
                       CASE WHEN tr.subject_term_id=? THEN o.label ELSE s.label END other_label
                FROM term_relations tr
                JOIN terms s ON s.id=tr.subject_term_id
                JOIN terms o ON o.id=tr.object_term_id
                WHERE tr.status IN ('reviewed','published') AND (tr.subject_term_id=? OR tr.object_term_id=?)
                ORDER BY tr.relation_type, other_label
            """, (term['id'],term['id'],term['id'],term['id'],term['id'])):
                print(f"REL {row['direction']} {row['relation_type']} -> {row['other_label']} [{row['other_slug']}] note={clip(row['note'],500)}")
            for i,row in enumerate(con.execute("""
                SELECT i.summary, i.scope, i.evidence_grade, w.title work_title, a.name author_name
                FROM interpretations i LEFT JOIN works w ON w.id=i.work_id LEFT JOIN authors a ON a.id=w.author_id
                WHERE i.term_id=? AND i.status IN ('reviewed','published') ORDER BY i.id
            """, (term['id'],)),1):
                print(f"INTERP {i}: {row['author_name']} | {row['work_title']} | {clip(row['summary'],1200)}")
finally:
    con.close()
