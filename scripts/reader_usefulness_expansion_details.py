#!/usr/bin/env python3
"""Print evidence and public treatment for current needs-expansion entries."""

from __future__ import annotations

import sqlite3

from reader_usefulness_triage import ROOT, build_db, load_rows, classify

DB = ROOT / '.tmp/reader-usefulness-expansion-details.sqlite'


def columns(con: sqlite3.Connection, table: str) -> list[str]:
    return [r[1] for r in con.execute(f'PRAGMA table_info({table})')]


def clip(value, n=900):
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
    targets = [r for r in rows if r['action'] == 'needs-expansion']
    print(f'EXPANSION DETAILS|count={len(targets)}')
    print('INTERPRETATION COLUMNS:', ','.join(columns(con, 'interpretations')))
    print('RELATION COLUMNS:', ','.join(columns(con, 'term_relations')))

    for r in sorted(targets, key=lambda x: (x['family'], x['label'].casefold())):
        print(f"\n### {r['family']} | {r['label']} [{r['slug']}] flags={','.join(r['flags'])}")
        print('DEFINITION:', r['definition'])
        print('INTRO:', r['intro'])

        for sec in con.execute(
            """SELECT section_key, heading, body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id""",
            (r['id'],),
        ):
            print(f"SECTION {sec['section_key']} | {sec['heading']}: {clip(sec['body'], 1200)}")

        ints = con.execute(
            """SELECT i.*, w.title AS work_title, a.name AS author_name
               FROM interpretations i
               LEFT JOIN works w ON w.id=i.work_id
               LEFT JOIN authors a ON a.id=w.author_id
               WHERE i.term_id=? AND i.status IN ('reviewed','published')
               ORDER BY i.id""",
            (r['id'],),
        ).fetchall()
        for i, row in enumerate(ints, 1):
            parts=[]
            for key in row.keys():
                if key in {'id','term_id','work_id','status','created_at','updated_at'}:
                    continue
                val=clip(row[key])
                if val:
                    parts.append(f'{key}={val}')
            print(f"INTERP {i}: " + ' | '.join(parts))

        rels = con.execute(
            """SELECT tr.relation_type, tr.note,
                      s.slug AS subject_slug, s.label AS subject_label,
                      o.slug AS object_slug, o.label AS object_label
               FROM term_relations tr
               JOIN terms s ON s.id=tr.subject_term_id
               JOIN terms o ON o.id=tr.object_term_id
               WHERE tr.status IN ('reviewed','published')
                 AND (tr.subject_term_id=? OR tr.object_term_id=?)
               ORDER BY tr.id""",
            (r['id'], r['id']),
        ).fetchall()
        for rel in rels:
            print('REL:', ' | '.join(f'{k}={clip(rel[k],400)}' for k in rel.keys() if rel[k] not in (None,'')))
finally:
    con.close()
