#!/usr/bin/env python3
import argparse
import json
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]


def build_db(db_path: Path):
    if db_path.exists():
        db_path.unlink()
    con = sqlite3.connect(db_path)
    try:
        con.execute("PRAGMA foreign_keys=ON")
        for folder in ("db/migrations", "db/seed"):
            for path in sorted((ROOT / folder).glob("*.sql")):
                con.executescript(path.read_text(encoding="utf-8"))
                con.execute("PRAGMA foreign_keys=ON")
        fk = con.execute("PRAGMA foreign_key_check").fetchall()
        if fk:
            raise RuntimeError(f"foreign key violations after build: {fk[:5]}")
        if con.execute("PRAGMA integrity_check").fetchone()[0] != "ok":
            raise RuntimeError("SQLite integrity_check failed")
        con.commit()
    finally:
        con.close()


def export(db_path: Path, out_path: Path):
    con = sqlite3.connect(db_path)
    con.row_factory = sqlite3.Row

    terms = []
    for term in con.execute(
        """SELECT id,slug,label,short_definition,category,entry_type,
                  definition_quality,editorial_notes
           FROM terms
           WHERE status IN ('reviewed','published')
           ORDER BY label COLLATE NOCASE"""
    ):
        record = dict(term)
        record["aliases"] = [
            dict(row)
            for row in con.execute(
                """SELECT label,language,alias_type,scope_note
                   FROM aliases WHERE term_id=? ORDER BY label COLLATE NOCASE""",
                (term["id"],),
            )
        ]

        interpretations = []
        for interpretation in con.execute(
            """SELECT i.id,i.summary,i.scope,i.certainty,i.evidence_grade,
                      w.slug work_slug,w.title work_title,
                      a.slug author_slug,a.name author_name,a.historical_layer
               FROM interpretations i
               JOIN works w ON w.id=i.work_id
               JOIN authors a ON a.id=w.author_id
               WHERE i.term_id=? AND i.status IN ('reviewed','published')
               ORDER BY a.name COLLATE NOCASE,i.scope""",
            (term["id"],),
        ):
            item = dict(interpretation)
            item["citations"] = [
                dict(row)
                for row in con.execute(
                    """SELECT c.citation_role,
                              e.label edition_label,e.translator,e.editor,e.publisher,e.publication_year,
                              sp.page_start,sp.page_end,sp.book,sp.tractate,sp.chapter,sp.section,sp.locator_text
                       FROM citations c
                       JOIN source_passages sp ON sp.id=c.source_passage_id
                       JOIN editions e ON e.id=sp.edition_id
                       WHERE c.interpretation_id=?
                       ORDER BY c.id""",
                    (interpretation["id"],),
                )
            ]
            item.pop("id", None)
            interpretations.append(item)
        record["interpretations"] = interpretations

        record["relations"] = [
            dict(row)
            for row in con.execute(
                """SELECT tr.relation_type,tr.note,
                          CASE WHEN tr.subject_term_id=? THEN 'outgoing' ELSE 'incoming' END direction,
                          other.slug target_slug,other.label target_label
                   FROM term_relations tr
                   JOIN terms other ON other.id=CASE
                       WHEN tr.subject_term_id=? THEN tr.object_term_id
                       ELSE tr.subject_term_id END
                   WHERE tr.status IN ('reviewed','published')
                     AND (tr.subject_term_id=? OR tr.object_term_id=?)
                   ORDER BY tr.relation_type,other.label COLLATE NOCASE""",
                (term["id"], term["id"], term["id"], term["id"]),
            )
        ]
        terms.append(record)

    authors = []
    for author in con.execute(
        """SELECT id,slug,name,original_name,birth_year,death_year,historical_layer,notes
           FROM authors ORDER BY id"""
    ):
        item = dict(author)
        item["works"] = [
            dict(row)
            for row in con.execute(
                """SELECT slug,title,original_title,composition_year_start,composition_year_end,language,notes
                   FROM works WHERE author_id=? ORDER BY title COLLATE NOCASE""",
                (author["id"],),
            )
        ]
        authors.append(item)

    works = []
    for work in con.execute(
        """SELECT w.id,w.slug,w.title,w.original_title,w.composition_year_start,w.composition_year_end,
                  w.language,w.notes,a.slug author_slug,a.name author_name,a.historical_layer
           FROM works w JOIN authors a ON a.id=w.author_id
           ORDER BY a.id,w.title"""
    ):
        item = dict(work)
        item["editions"] = [
            dict(row)
            for row in con.execute(
                """SELECT label,translator,editor,publisher,publication_year,publication_place,
                          source_language,target_language,copyright_note
                   FROM editions WHERE work_id=? ORDER BY publication_year,label""",
                (work["id"],),
            )
        ]
        item["interpretation_count"] = con.execute(
            """SELECT COUNT(*) FROM interpretations
               WHERE work_id=? AND status IN ('reviewed','published')""",
            (work["id"],),
        ).fetchone()[0]
        works.append(item)

    payload = {
        "meta": {
            "terms": len(terms),
            "interpretations": sum(len(term["interpretations"]) for term in terms),
            "authors": len(authors),
            "works": len(works),
            "evidence_standard": "Reviewed A/B evidence only",
        },
        "terms": terms,
        "authors": authors,
        "works": works,
    }
    out_path.parent.mkdir(parents=True, exist_ok=True)
    out_path.write_text(json.dumps(payload, ensure_ascii=False, indent=2), encoding="utf-8")
    print(f"Wrote {out_path} ({len(terms)} terms)")


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument(
        "--db", type=Path, help="Use an existing canonical SQLite database instead of rebuilding from SQL."
    )
    parser.add_argument("--out", type=Path, default=ROOT / "src/data/generated/corpus.json")
    args = parser.parse_args()

    if args.db:
        export(args.db, args.out)
        return

    db_path = ROOT / ".tmp/frontend-corpus.sqlite"
    db_path.parent.mkdir(exist_ok=True)
    build_db(db_path)
    export(db_path, args.out)


if __name__ == "__main__":
    main()
