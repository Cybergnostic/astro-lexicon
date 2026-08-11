#!/usr/bin/env python3
"""Print the current public text for entries classified as tiny-fix."""

from pathlib import Path
import sqlite3

from reader_usefulness_triage import ROOT, build_db, load_rows, classify

DB = ROOT / '.tmp/reader-usefulness-tiny-details.sqlite'

build_db(DB)
con = sqlite3.connect(DB)
try:
    rows = [classify(r) for r in load_rows(con)]
    tiny = [r for r in rows if r['action'] == 'tiny-fix']
    print(f'TINY DETAILS|count={len(tiny)}')
    for r in sorted(tiny, key=lambda x: x['label'].casefold()):
        print(f"\n### {r['label']} [{r['slug']}] flags={','.join(r['flags'])}")
        print('DEFINITION:', r['definition'])
        print('INTRO:', r['intro'])
        sections = con.execute(
            """SELECT section_key,heading,body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published') ORDER BY sort_order,id""",
            (r['id'],),
        ).fetchall()
        for key, heading, body in sections:
            print(f'SECTION {key} | {heading}: {body}')
finally:
    con.close()
