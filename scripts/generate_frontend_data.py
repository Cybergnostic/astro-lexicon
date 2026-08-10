#!/usr/bin/env python3
import argparse
import hashlib
import json
import sqlite3
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CACHE_PATH = ROOT / ".tmp/frontend-corpus.sha256"


def source_fingerprint() -> str:
    """Hash every input that can change the generated frontend corpus."""
    digest = hashlib.sha256()
    inputs = [Path(__file__)]
    for folder in ("db/migrations", "db/seed"):
        inputs.extend(sorted((ROOT / folder).glob("*.sql")))

    for path in inputs:
        rel = path.resolve().relative_to(ROOT.resolve())
        digest.update(str(rel).encode("utf-8"))
        digest.update(b"\0")
        digest.update(path.read_bytes())
        digest.update(b"\0")
    return digest.hexdigest()


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

        forms = []
        for form in con.execute(
            """SELECT id,language_code,script,form,lemma,transliteration,literal_gloss,
                      form_type,ambiguity_note,editorial_note
               FROM term_forms
               WHERE term_id=? AND status IN ('reviewed','published')
               ORDER BY language_code,form_type,form COLLATE NOCASE""",
            (term["id"],),
        ):
            item = dict(form)
            item["renderings"] = [
                dict(row)
                for row in con.execute(
                    """SELECT rendering,rendering_type,scope_note
                       FROM term_form_renderings
                       WHERE term_form_id=?
                       ORDER BY CASE rendering_type
                         WHEN 'preferred' THEN 0
                         WHEN 'translation' THEN 1
                         WHEN 'variant' THEN 2
                         WHEN 'literal' THEN 3
                         ELSE 4 END,id""",
                    (form["id"],),
                )
            ]
            item["attestations"] = [
                dict(row)
                for row in con.execute(
                    """SELECT tfa.source_kind,tfa.tradition_scope,
                              tfa.external_source_label,tfa.external_source_url,tfa.source_note,
                              w.slug work_slug,w.title work_title,
                              a.slug author_slug,a.name author_name,
                              sp.book,sp.tractate,sp.chapter,sp.section,sp.locator_text
                       FROM term_form_attestations tfa
                       LEFT JOIN works w ON w.id=tfa.work_id
                       LEFT JOIN authors a ON a.id=w.author_id
                       LEFT JOIN source_passages sp ON sp.id=tfa.source_passage_id
                       WHERE tfa.term_form_id=? AND tfa.status IN ('reviewed','published')
                       ORDER BY tfa.id""",
                    (form["id"],),
                )
            ]
            item.pop("id", None)
            forms.append(item)
        record["forms"] = forms

        record["symbols"] = [
            dict(row)
            for row in con.execute(
                """SELECT symbol_system,symbol_text,label,is_primary,notes
                   FROM term_symbols
                   WHERE term_id=?
                   ORDER BY is_primary DESC,id""",
                (term["id"],),
            )
        ]

        record["media"] = [
            dict(row)
            for row in con.execute(
                """SELECT media_key,media_type,asset_path,alt_text,caption,credit,license_note,source_url,sort_order
                   FROM term_media
                   WHERE term_id=? AND status IN ('reviewed','published')
                   ORDER BY sort_order,id""",
                (term["id"],),
            )
        ]

        record["reference_assignments"] = [
            dict(row)
            for row in con.execute(
                """SELECT rs.slug scheme_slug,rs.label scheme_label,rs.domain,
                          z.assignment_type,z.sect_condition,z.degree_start,z.degree_end,
                          z.exact_degree_number,z.sequence_no,z.note,
                          s.slug sign_slug,s.label sign_label,
                          p.slug planet_slug,p.label planet_label
                   FROM zodiac_reference_assignments z
                   JOIN reference_schemes rs ON rs.id=z.scheme_id
                   JOIN terms s ON s.id=z.sign_term_id
                   JOIN terms p ON p.id=z.planet_term_id
                   WHERE rs.status IN ('reviewed','published')
                     AND (z.sign_term_id=? OR z.planet_term_id=?)
                   ORDER BY rs.id,s.id,z.assignment_type,z.sect_condition,z.degree_start,z.sequence_no""",
                (term["id"], term["id"]),
            )
        ]

        profile = con.execute(
            """SELECT astronomical_class,solar_orbit_relation,traditional_family,
                      sect_affiliation,beneficence_class,temperature_quality,moisture_quality,
                      zodiacal_motion,solar_phase_family,astronomy_note,traditional_note,
                      astronomy_source_label,astronomy_source_url
               FROM planetary_profiles
               WHERE planet_term_id=? AND status IN ('reviewed','published')""",
            (term["id"],),
        ).fetchone()
        record["planet_profile"] = dict(profile) if profile else None

        sign_profile = con.execute(
            """SELECT z.ordinal,z.longitude_start,z.longitude_end,z.quarter_anchor,z.quarter_position,
                      z.solar_declination_half,z.geometry_note,z.tradition_note,
                      z.astronomy_source_label,z.astronomy_source_url,
                      e.slug element_slug,e.label element_label,
                      m.slug modality_slug,m.label modality_label,
                      p.slug polarity_slug,p.label polarity_label,
                      dn.slug day_night_slug,dn.label day_night_label
               FROM zodiac_sign_profiles z
               JOIN terms e ON e.id=z.element_term_id
               JOIN terms m ON m.id=z.modality_term_id
               JOIN terms p ON p.id=z.polarity_term_id
               JOIN terms dn ON dn.id=z.day_night_term_id
               WHERE z.sign_term_id=? AND z.status IN ('reviewed','published')""",
            (term["id"],),
        ).fetchone()
        record["zodiac_sign_profile"] = dict(sign_profile) if sign_profile else None

        concept_families = []
        for family in con.execute(
            """SELECT DISTINCT cf.id,cf.slug,cf.label,cf.description,cf.family_type,cf.editorial_note
               FROM concept_families cf
               JOIN concept_family_members own ON own.family_id=cf.id
               WHERE own.term_id=?
                 AND cf.status IN ('reviewed','published')
                 AND own.status IN ('reviewed','published')
               ORDER BY cf.label COLLATE NOCASE""",
            (term["id"],),
        ):
            item = dict(family)
            item["members"] = [
                dict(row)
                for row in con.execute(
                    """SELECT m.role_key,m.role_label,m.sequence_no,m.note,
                              t.slug term_slug,t.label term_label
                       FROM concept_family_members m
                       JOIN terms t ON t.id=m.term_id
                       WHERE m.family_id=? AND m.status IN ('reviewed','published')
                         AND t.status IN ('reviewed','published')
                       ORDER BY m.sequence_no,t.label COLLATE NOCASE""",
                    (family["id"],),
                )
            ]
            item.pop("id", None)
            concept_families.append(item)
        record["concept_families"] = concept_families

        cycles = []
        for cycle in con.execute(
            """SELECT pc.id,pc.slug,pc.cycle_type,pc.mean_period_days,pc.period_note,pc.notes,
                      r.slug reference_body_slug,r.label reference_body_label
               FROM planetary_cycles pc
               LEFT JOIN terms r ON r.id=pc.reference_body_term_id
               WHERE pc.planet_term_id=? AND pc.status IN ('reviewed','published')
               ORDER BY pc.id""",
            (term["id"],),
        ):
            item = dict(cycle)
            item["phases"] = [
                dict(row)
                for row in con.execute(
                    """SELECT phase_key,label,sequence_no,geometric_condition,
                              visibility_condition,motion_condition,notes
                       FROM planetary_cycle_phases
                       WHERE cycle_id=? ORDER BY sequence_no""",
                    (cycle["id"],),
                )
            ]
            item.pop("id", None)
            cycles.append(item)
        record["cycles"] = cycles

        reference_schemes = []
        for scheme in con.execute(
            """SELECT rs.id,rs.slug,rs.label,rs.domain,rs.notes,
                      w.slug work_slug,w.title work_title,
                      a.slug author_slug,a.name author_name
               FROM reference_schemes rs
               LEFT JOIN works w ON w.id=rs.work_id
               LEFT JOIN authors a ON a.id=w.author_id
               WHERE rs.status IN ('reviewed','published') AND rs.domain=?
               ORDER BY rs.id""",
            (term["slug"],),
        ):
            item = dict(scheme)
            item["assignments"] = [
                dict(row)
                for row in con.execute(
                    """SELECT z.assignment_type,z.sect_condition,z.degree_start,z.degree_end,
                              z.exact_degree_number,z.sequence_no,z.note,
                              s.slug sign_slug,s.label sign_label,
                              p.slug planet_slug,p.label planet_label
                       FROM zodiac_reference_assignments z
                       JOIN terms s ON s.id=z.sign_term_id
                       JOIN terms p ON p.id=z.planet_term_id
                       WHERE z.scheme_id=?
                       ORDER BY s.id,z.assignment_type,z.sect_condition,z.degree_start,z.sequence_no""",
                    (scheme["id"],),
                )
            ]
            item.pop("id", None)
            reference_schemes.append(item)
        record["reference_schemes"] = reference_schemes

        article = con.execute(
            """SELECT intro
               FROM term_articles
               WHERE term_id=? AND status IN ('reviewed','published')""",
            (term["id"],),
        ).fetchone()
        if article:
            article_record = dict(article)
            sections = [
                dict(row)
                for row in con.execute(
                    """SELECT section_key,heading,body,sort_order
                       FROM term_article_sections
                       WHERE term_id=? AND status IN ('reviewed','published')
                       ORDER BY sort_order,id""",
                    (term["id"],),
                )
            ]
            tables = []
            for row in con.execute(
                """SELECT table_key,heading,caption,columns_json,rows_json,sort_order
                   FROM term_article_tables
                   WHERE term_id=? AND status IN ('reviewed','published')
                   ORDER BY sort_order,id""",
                (term["id"],),
            ):
                item = dict(row)
                item["columns"] = json.loads(item.pop("columns_json"))
                item["rows"] = json.loads(item.pop("rows_json"))
                tables.append(item)

            article_record["sections"] = [
                {k: v for k, v in section.items() if k != "sort_order"} for section in sections
            ]
            article_record["tables"] = [
                {k: v for k, v in table.items() if k != "sort_order"} for table in tables
            ]
            blocks = [
                {"type": "section", **section} for section in sections
            ] + [
                {"type": "table", **table} for table in tables
            ]
            blocks.sort(key=lambda item: (item["sort_order"], item.get("section_key", item.get("table_key", ""))))
            article_record["blocks"] = [
                {k: v for k, v in block.items() if k != "sort_order"} for block in blocks
            ]
            record["article"] = article_record
        else:
            record["article"] = None

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
                """SELECT slug,title,original_title,composition_year_start,composition_year_end,
                          language,notes,corpus_status
                   FROM works WHERE author_id=? ORDER BY title COLLATE NOCASE""",
                (author["id"],),
            )
        ]
        authors.append(item)

    works = []
    for work in con.execute(
        """SELECT w.id,w.slug,w.title,w.original_title,w.composition_year_start,w.composition_year_end,
                  w.language,w.notes,w.corpus_status,a.slug author_slug,a.name author_name,a.historical_layer
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

    reference_scheme_count = con.execute(
        "SELECT COUNT(*) FROM reference_schemes WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    historical_form_count = con.execute(
        "SELECT COUNT(*) FROM term_forms WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    planetary_profile_count = con.execute(
        "SELECT COUNT(*) FROM planetary_profiles WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    zodiac_sign_profile_count = con.execute(
        "SELECT COUNT(*) FROM zodiac_sign_profiles WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    concept_family_count = con.execute(
        "SELECT COUNT(*) FROM concept_families WHERE status IN ('reviewed','published')"
    ).fetchone()[0]

    payload = {
        "meta": {
            "terms": len(terms),
            "interpretations": sum(len(term["interpretations"]) for term in terms),
            "articles": sum(1 for term in terms if term["article"]),
            "authors": len(authors),
            "works": len(works),
            "reference_schemes": reference_scheme_count,
            "historical_forms": historical_form_count,
            "planetary_profiles": planetary_profile_count,
            "zodiac_sign_profiles": zodiac_sign_profile_count,
            "concept_families": concept_family_count,
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
    parser.add_argument("--force", action="store_true", help="Regenerate even when source inputs are unchanged.")
    args = parser.parse_args()

    if args.db:
        export(args.db, args.out)
        return

    fingerprint = source_fingerprint()
    if not args.force and args.out.exists() and CACHE_PATH.exists():
        cached = CACHE_PATH.read_text(encoding="utf-8").strip()
        if cached == fingerprint:
            print("Frontend corpus unchanged; skipping SQLite rebuild.")
            return

    db_path = ROOT / ".tmp/frontend-corpus.sqlite"
    db_path.parent.mkdir(exist_ok=True)
    build_db(db_path)
    export(db_path, args.out)
    CACHE_PATH.parent.mkdir(exist_ok=True)
    CACHE_PATH.write_text(fingerprint + "\n", encoding="utf-8")


if __name__ == "__main__":
    main()
