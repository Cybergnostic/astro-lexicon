#!/usr/bin/env python3
"""Print public treatment and evidence for current structure/table candidates."""

from __future__ import annotations

import sqlite3

from reader_usefulness_triage import ROOT, build_db, load_rows, classify

DB = ROOT / '.tmp/reader-usefulness-structure-details.sqlite'


def clip(value, n=850):
    if value is None:
        return ''
    s = str(value).replace('\n', ' ').strip()
    return s if len(s) <= n else s[:n] + '…'


DB.parent.mkdir(parents=True, exist_ok=True)
build_db(DB)
con = sqlite3.connect(DB)
con.row_factory = sqlite3.Row
try:
    rows = [classify(r) for r in load_rows(con)]
    targets = [r for r in rows if r['action'] == 'structure / table']
    print(f'STRUCTURE DETAILS|count={len(targets)}')
    for r in sorted(targets, key=lambda x: (x['family'], x['label'].casefold())):
        print(f"\n### {r['family']} | {r['label']} [{r['slug']}] flags={','.join(r['flags'])}")
        print('DEFINITION:', r['definition'])
        print('INTRO:', r['intro'])
        sections = con.execute(
            """SELECT section_key, heading, body, sort_order FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id""",
            (r['id'],),
        ).fetchall()
        for sec in sections:
            print(f"SECTION {sec['sort_order']} {sec['section_key']} | {sec['heading']}: {clip(sec['body'], 1100)}")
        tables = con.execute(
            """SELECT table_key, heading, caption, columns_json, rows_json, sort_order
               FROM term_article_tables
               WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id""",
            (r['id'],),
        ).fetchall()
        for tb in tables:
            print(f"TABLE {tb['sort_order']} {tb['table_key']} | {tb['heading']}: caption={clip(tb['caption'],500)} | columns={clip(tb['columns_json'],500)} | rows={clip(tb['rows_json'],1200)}")
        ints = con.execute(
            """SELECT i.summary, i.scope, i.certainty, i.evidence_grade,
                      w.title AS work_title, a.name AS author_name
               FROM interpretations i
               LEFT JOIN works w ON w.id=i.work_id
               LEFT JOIN authors a ON a.id=w.author_id
               WHERE i.term_id=? AND i.status IN ('reviewed','published')
               ORDER BY i.id""",
            (r['id'],),
        ).fetchall()
        for i, row in enumerate(ints,1):
            print('INTERP',i,':',' | '.join(f'{k}={clip(row[k])}' for k in row.keys() if row[k] not in (None,'')))
finally:
    con.close()
