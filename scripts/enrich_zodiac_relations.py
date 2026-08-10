#!/usr/bin/env python3
"""Append normalized sign-pair relation schemes to the generated frontend corpus.

The canonical data remains SQLite. This deliberately small enrichment step keeps the
main corpus generator stable while the bird's-eye sign-relation layer is introduced.
It is deterministic and runs immediately after generate_frontend_data.py.
"""

import json
import sqlite3
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DB_PATH = ROOT / ".tmp/frontend-corpus.sqlite"
CORPUS_PATH = ROOT / "src/data/generated/corpus.json"


def ensure_db() -> None:
    if not DB_PATH.exists():
        DB_PATH.parent.mkdir(exist_ok=True)
        build_db(DB_PATH)


def main() -> None:
    ensure_db()
    if not CORPUS_PATH.exists():
        raise RuntimeError("Generated corpus is missing; run generate_frontend_data.py first.")

    payload = json.loads(CORPUS_PATH.read_text(encoding="utf-8"))

    con = sqlite3.connect(DB_PATH)
    con.row_factory = sqlite3.Row
    try:
        term_ids = {
            row["slug"]: row["id"]
            for row in con.execute(
                "SELECT id,slug FROM terms WHERE status IN ('reviewed','published')"
            )
        }

        for term in payload.get("terms", []):
            term_id = term_ids.get(term.get("slug"))
            if term_id is None:
                term["zodiac_relation_schemes"] = []
                continue

            schemes = []
            for scheme in con.execute(
                """SELECT DISTINCT s.id,s.slug,s.label,s.relation_kind,s.geometry_note,s.notes,
                                  w.slug work_slug,w.title work_title,
                                  a.slug author_slug,a.name author_name
                   FROM zodiac_relation_schemes s
                   LEFT JOIN term_zodiac_relation_schemes link ON link.scheme_id=s.id
                   LEFT JOIN zodiac_relation_pairs pair ON pair.scheme_id=s.id
                   LEFT JOIN works w ON w.id=s.work_id
                   LEFT JOIN authors a ON a.id=w.author_id
                   WHERE s.status IN ('reviewed','published')
                     AND (link.term_id=? OR pair.sign_a_term_id=? OR pair.sign_b_term_id=?)
                   ORDER BY s.id""",
                (term_id, term_id, term_id),
            ):
                item = dict(scheme)
                item["pairs"] = [
                    dict(row)
                    for row in con.execute(
                        """SELECT pair.sequence_no,pair.sign_a_role,pair.sign_b_role,pair.note,
                                          a.slug sign_a_slug,a.label sign_a_label,
                                          b.slug sign_b_slug,b.label sign_b_label
                           FROM zodiac_relation_pairs pair
                           JOIN terms a ON a.id=pair.sign_a_term_id
                           JOIN terms b ON b.id=pair.sign_b_term_id
                           WHERE pair.scheme_id=?
                           ORDER BY pair.sequence_no""",
                        (scheme["id"],),
                    )
                ]
                item.pop("id", None)
                schemes.append(item)

            term["zodiac_relation_schemes"] = schemes

        payload.setdefault("meta", {})["zodiac_relation_schemes"] = con.execute(
            "SELECT COUNT(*) FROM zodiac_relation_schemes WHERE status IN ('reviewed','published')"
        ).fetchone()[0]
    finally:
        con.close()

    CORPUS_PATH.write_text(
        json.dumps(payload, ensure_ascii=False, indent=2),
        encoding="utf-8",
    )
    print(f"Enriched {CORPUS_PATH} with zodiac relation schemes")


if __name__ == "__main__":
    main()
