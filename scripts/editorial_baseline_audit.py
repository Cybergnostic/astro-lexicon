#!/usr/bin/env python3
"""Corpus-wide editorial baseline audit.

This is intentionally a reporting tool, not a blocking validator. It builds the
canonical SQLite corpus from migrations + seeds (unless --db is supplied), then
produces a finite ledger of editorial cleanup candidates before further source
ingestion.

The report distinguishes mechanical findings from heuristic/research candidates:
- exact or near duplication between canonical definitions and article prose;
- article fragmentation and missing reader-facing composition;
- public prose that appears to describe the project/database rather than astrology;
- Hellenistic-source terms that currently lack an Ancient Greek term form;
- article blocks that are semantically close enough to deserve human review.

No finding in this report is automatically a content error. The goal is to make the
cleanup phase enumerable and reviewable family by family.
"""

from __future__ import annotations

import argparse
import re
import sqlite3
from collections import Counter, defaultdict
from dataclasses import dataclass
from difflib import SequenceMatcher
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/editorial-baseline.sqlite"
DEFAULT_REPORT = ROOT / ".tmp/editorial-baseline-report.md"

INTERNAL_LANGUAGE_PATTERNS = {
    "normalized": re.compile(r"\bnormaliz(?:ed|ation|ing)\b", re.I),
    "database": re.compile(r"\bdatabase\b|\bsqlite\b", re.I),
    "generated": re.compile(r"\bgenerated\b|\bgenerator\b", re.I),
    "canonical corpus": re.compile(r"\bcanonical corpus\b|\bcurrent corpus\b", re.I),
    "review workflow": re.compile(r"\breviewed\b|\breview status\b", re.I),
    "editorial process": re.compile(r"\beditorial\b|\bmigration\b|\bseed(?:ed|ing)?\b", re.I),
    "frontend/backend": re.compile(r"\bfront[ -]?end\b|\bback[ -]?end\b", re.I),
    "coverage/process": re.compile(r"\bcoverage\b|\bextraction\b|\bstructured data\b", re.I),
}

WORD_RE = re.compile(r"[\wἀ-῾]+", re.UNICODE)


@dataclass(frozen=True)
class TextItem:
    term_id: int
    slug: str
    label: str
    location: str
    text: str


def normalize_text(value: str | None) -> str:
    if not value:
        return ""
    value = value.casefold().replace("’", "'").replace("‘", "'").replace("“", '"').replace("”", '"')
    value = re.sub(r"[^\w\s]", " ", value, flags=re.UNICODE)
    return " ".join(value.split())


def similarity(a: str | None, b: str | None) -> float:
    na, nb = normalize_text(a), normalize_text(b)
    if not na or not nb:
        return 0.0
    if na == nb:
        return 1.0
    return SequenceMatcher(None, na, nb).ratio()


def preview(text: str | None, limit: int = 155) -> str:
    clean = " ".join((text or "").split())
    if len(clean) <= limit:
        return clean
    return clean[: limit - 1].rstrip() + "…"


def table_exists(con: sqlite3.Connection, table: str) -> bool:
    return con.execute(
        "SELECT 1 FROM sqlite_master WHERE type='table' AND name=?", (table,)
    ).fetchone() is not None


def columns(con: sqlite3.Connection, table: str) -> set[str]:
    if not table_exists(con, table):
        return set()
    return {row[1] for row in con.execute(f"PRAGMA table_info({table})")}


def public_text_items(con: sqlite3.Connection) -> list[TextItem]:
    """Return text fields that are currently or plausibly rendered to public pages.

    Editorial-note/status columns are deliberately excluded: the previous frontend pass
    already stopped rendering those, and this audit is about reader-visible prose.
    """
    items: list[TextItem] = []

    def add_query(location: str, sql: str) -> None:
        try:
            for row in con.execute(sql):
                if row[3] and str(row[3]).strip():
                    items.append(TextItem(row[0], row[1], row[2], location, str(row[3])))
        except sqlite3.OperationalError:
            # Optional/newer structured layers may not exist in older DB snapshots.
            pass

    add_query(
        "short_definition",
        "SELECT id,slug,label,short_definition FROM terms WHERE status IN ('reviewed','published')",
    )
    add_query(
        "article:intro",
        """SELECT t.id,t.slug,t.label,a.intro
           FROM term_articles a JOIN terms t ON t.id=a.term_id
           WHERE a.status IN ('reviewed','published')""",
    )
    add_query(
        "article:section",
        """SELECT t.id,t.slug,t.label,s.body
           FROM term_article_sections s JOIN terms t ON t.id=s.term_id
           WHERE s.status IN ('reviewed','published')""",
    )
    add_query(
        "article:table-caption",
        """SELECT t.id,t.slug,t.label,tab.caption
           FROM term_article_tables tab JOIN terms t ON t.id=tab.term_id
           WHERE tab.status IN ('reviewed','published') AND tab.caption IS NOT NULL""",
    )
    add_query(
        "concept-family:description",
        """SELECT t.id,t.slug,t.label,cf.description
           FROM concept_family_members m
           JOIN concept_families cf ON cf.id=m.family_id
           JOIN terms t ON t.id=m.term_id
           WHERE cf.status IN ('reviewed','published')
             AND m.status IN ('reviewed','published')""",
    )
    add_query(
        "planet-profile:astronomy-note",
        """SELECT t.id,t.slug,t.label,p.astronomy_note
           FROM planetary_profiles p JOIN terms t ON t.id=p.term_id
           WHERE p.status IN ('reviewed','published') AND p.astronomy_note IS NOT NULL""",
    )
    add_query(
        "planet-profile:traditional-note",
        """SELECT t.id,t.slug,t.label,p.traditional_note
           FROM planetary_profiles p JOIN terms t ON t.id=p.term_id
           WHERE p.status IN ('reviewed','published') AND p.traditional_note IS NOT NULL""",
    )
    add_query(
        "zodiac-profile:geometry-note",
        """SELECT t.id,t.slug,t.label,z.geometry_note
           FROM zodiac_sign_profiles z JOIN terms t ON t.id=z.sign_term_id
           WHERE z.status IN ('reviewed','published') AND z.geometry_note IS NOT NULL""",
    )
    add_query(
        "zodiac-profile:tradition-note",
        """SELECT t.id,t.slug,t.label,z.tradition_note
           FROM zodiac_sign_profiles z JOIN terms t ON t.id=z.sign_term_id
           WHERE z.status IN ('reviewed','published') AND z.tradition_note IS NOT NULL""",
    )

    # Structured layers with less stable schemas are inspected dynamically.
    if table_exists(con, "planetary_cycles"):
        pc_cols = columns(con, "planetary_cycles")
        for field in ("period_note", "notes"):
            if field in pc_cols:
                add_query(
                    f"planetary-cycle:{field}",
                    f"""SELECT t.id,t.slug,t.label,pc.{field}
                        FROM planetary_cycles pc JOIN terms t ON t.id=pc.planet_term_id
                        WHERE pc.status IN ('reviewed','published') AND pc.{field} IS NOT NULL""",
                )
    if table_exists(con, "planetary_cycle_phases"):
        phase_cols = columns(con, "planetary_cycle_phases")
        if "notes" in phase_cols:
            add_query(
                "planetary-cycle:phase-note",
                """SELECT t.id,t.slug,t.label,ph.notes
                   FROM planetary_cycle_phases ph
                   JOIN planetary_cycles pc ON pc.id=ph.cycle_id
                   JOIN terms t ON t.id=pc.planet_term_id
                   WHERE pc.status IN ('reviewed','published') AND ph.notes IS NOT NULL""",
            )
    if table_exists(con, "planetary_time_sequences"):
        seq_cols = columns(con, "planetary_time_sequences")
        if "notes" in seq_cols:
            add_query(
                "planetary-time:notes",
                """SELECT t.id,t.slug,t.label,s.notes
                   FROM term_planetary_time_sequences link
                   JOIN planetary_time_sequences s ON s.id=link.sequence_id
                   JOIN terms t ON t.id=link.term_id
                   WHERE s.status IN ('reviewed','published') AND s.notes IS NOT NULL""",
            )
    if table_exists(con, "zodiac_relation_schemes"):
        zrs_cols = columns(con, "zodiac_relation_schemes")
        for field in ("geometry_note", "notes"):
            if field in zrs_cols:
                add_query(
                    f"zodiac-relations:{field}",
                    f"""SELECT t.id,t.slug,t.label,s.{field}
                        FROM term_zodiac_relation_schemes link
                        JOIN zodiac_relation_schemes s ON s.id=link.scheme_id
                        JOIN terms t ON t.id=link.term_id
                        WHERE s.status IN ('reviewed','published') AND s.{field} IS NOT NULL""",
                )

    return items


def article_inventory(con: sqlite3.Connection) -> list[dict]:
    rows = []
    composition_table = table_exists(con, "term_page_sections")
    for term in con.execute(
        """SELECT t.id,t.slug,t.label,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')
           ORDER BY t.label COLLATE NOCASE"""
    ):
        section_count = con.execute(
            """SELECT COUNT(*) FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')""",
            (term[0],),
        ).fetchone()[0]
        table_count = con.execute(
            """SELECT COUNT(*) FROM term_article_tables
               WHERE term_id=? AND status IN ('reviewed','published')""",
            (term[0],),
        ).fetchone()[0]
        composition_sections = 0
        composition_blocks = 0
        if composition_table:
            composition_sections = con.execute(
                """SELECT COUNT(*) FROM term_page_sections
                   WHERE term_id=? AND status IN ('reviewed','published')""",
                (term[0],),
            ).fetchone()[0]
            composition_blocks = con.execute(
                """SELECT COUNT(*)
                   FROM term_page_blocks b
                   JOIN term_page_sections s ON s.id=b.page_section_id
                   WHERE s.term_id=? AND b.status IN ('reviewed','published')
                     AND s.status IN ('reviewed','published')""",
                (term[0],),
            ).fetchone()[0]
        rows.append(
            {
                "id": term[0],
                "slug": term[1],
                "label": term[2],
                "intro": term[3],
                "sections": section_count,
                "tables": table_count,
                "blocks": section_count + table_count,
                "composition_sections": composition_sections,
                "composition_blocks": composition_blocks,
            }
        )
    return rows


def definition_duplication(con: sqlite3.Connection) -> tuple[list[dict], list[dict]]:
    exact = []
    near = []
    for row in con.execute(
        """SELECT t.slug,t.label,t.short_definition,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')
           ORDER BY t.label COLLATE NOCASE"""
    ):
        score = similarity(row[2], row[3])
        item = {
            "slug": row[0],
            "label": row[1],
            "score": score,
            "definition": row[2],
            "intro": row[3],
        }
        if score == 1.0:
            exact.append(item)
        elif score >= 0.72:
            near.append(item)
    near.sort(key=lambda item: (-item["score"], item["label"].casefold()))
    return exact, near


def first_block_duplication(con: sqlite3.Connection) -> list[dict]:
    candidates = []
    for row in con.execute(
        """SELECT t.id,t.slug,t.label,t.short_definition,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')"""
    ):
        section = con.execute(
            """SELECT section_key,heading,body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')
               ORDER BY sort_order,id LIMIT 1""",
            (row[0],),
        ).fetchone()
        if not section:
            continue
        score_intro = similarity(row[4], section[2])
        score_def = similarity(row[3], section[2])
        score = max(score_intro, score_def)
        if score >= 0.72:
            candidates.append(
                {
                    "slug": row[1],
                    "label": row[2],
                    "section_key": section[0],
                    "heading": section[1],
                    "score": score,
                    "body": section[2],
                }
            )
    return sorted(candidates, key=lambda item: (-item["score"], item["label"].casefold()))


def internal_language(items: list[TextItem]) -> list[dict]:
    findings = []
    for item in items:
        matches = [name for name, pattern in INTERNAL_LANGUAGE_PATTERNS.items() if pattern.search(item.text)]
        if matches:
            findings.append(
                {
                    "slug": item.slug,
                    "label": item.label,
                    "location": item.location,
                    "matches": matches,
                    "text": item.text,
                }
            )
    return sorted(findings, key=lambda item: (item["label"].casefold(), item["location"]))


def greek_form_candidates(con: sqlite3.Connection) -> list[dict]:
    if not table_exists(con, "term_forms"):
        return []
    rows = con.execute(
        """SELECT DISTINCT t.id,t.slug,t.label,
                  GROUP_CONCAT(DISTINCT a.name) AS authors
           FROM terms t
           JOIN interpretations i ON i.term_id=t.id
           JOIN works w ON w.id=i.work_id
           JOIN authors a ON a.id=w.author_id
           WHERE t.status IN ('reviewed','published')
             AND i.status IN ('reviewed','published')
             AND (
               lower(COALESCE(a.historical_layer,'')) LIKE '%hellen%'
               OR lower(COALESCE(w.language,'')) LIKE '%greek%'
             )
             AND NOT EXISTS (
               SELECT 1 FROM term_forms f
               WHERE f.term_id=t.id
                 AND f.status IN ('reviewed','published')
                 AND f.language_code='grc'
             )
           GROUP BY t.id,t.slug,t.label
           ORDER BY t.label COLLATE NOCASE"""
    ).fetchall()
    return [
        {"id": row[0], "slug": row[1], "label": row[2], "authors": row[3] or ""}
        for row in rows
    ]


def historical_form_stats(con: sqlite3.Connection) -> dict:
    if not table_exists(con, "term_forms"):
        return {"terms_with_forms": 0, "forms": 0, "languages": []}
    terms_with_forms = con.execute(
        """SELECT COUNT(DISTINCT term_id) FROM term_forms
           WHERE status IN ('reviewed','published')"""
    ).fetchone()[0]
    forms = con.execute(
        """SELECT COUNT(*) FROM term_forms
           WHERE status IN ('reviewed','published')"""
    ).fetchone()[0]
    languages = con.execute(
        """SELECT language_code,COUNT(*) FROM term_forms
           WHERE status IN ('reviewed','published')
           GROUP BY language_code ORDER BY COUNT(*) DESC,language_code"""
    ).fetchall()
    return {"terms_with_forms": terms_with_forms, "forms": forms, "languages": languages}


def within_article_similarity(con: sqlite3.Connection) -> list[dict]:
    findings = []
    term_ids = [
        row[0]
        for row in con.execute(
            """SELECT term_id FROM term_articles
               WHERE status IN ('reviewed','published')"""
        )
    ]
    for term_id in term_ids:
        term = con.execute("SELECT slug,label FROM terms WHERE id=?", (term_id,)).fetchone()
        if not term:
            continue
        blocks: list[tuple[str, str]] = []
        article = con.execute(
            "SELECT intro FROM term_articles WHERE term_id=?", (term_id,)
        ).fetchone()
        if article and article[0]:
            blocks.append(("intro", article[0]))
        for row in con.execute(
            """SELECT section_key,body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')
               ORDER BY sort_order,id""",
            (term_id,),
        ):
            blocks.append((f"section:{row[0]}", row[1]))
        for row in con.execute(
            """SELECT table_key,caption FROM term_article_tables
               WHERE term_id=? AND status IN ('reviewed','published')
                 AND caption IS NOT NULL
               ORDER BY sort_order,id""",
            (term_id,),
        ):
            blocks.append((f"table-caption:{row[0]}", row[1]))
        for idx, (left_key, left_text) in enumerate(blocks):
            for right_key, right_text in blocks[idx + 1 :]:
                score = similarity(left_text, right_text)
                if score >= 0.68:
                    findings.append(
                        {
                            "slug": term[0],
                            "label": term[1],
                            "left": left_key,
                            "right": right_key,
                            "score": score,
                            "left_text": left_text,
                            "right_text": right_text,
                        }
                    )
    return sorted(findings, key=lambda item: (-item["score"], item["label"].casefold()))


def term_counts(con: sqlite3.Connection) -> dict:
    total = con.execute(
        "SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    with_articles = con.execute(
        """SELECT COUNT(*) FROM term_articles
           WHERE status IN ('reviewed','published')"""
    ).fetchone()[0]
    source_interpretations = con.execute(
        """SELECT COUNT(*) FROM interpretations
           WHERE status IN ('reviewed','published')"""
    ).fetchone()[0]
    return {
        "terms": total,
        "articles": with_articles,
        "definition_only": total - with_articles,
        "interpretations": source_interpretations,
    }


def write_report(con: sqlite3.Connection, output: Path) -> dict:
    counts = term_counts(con)
    inventory = article_inventory(con)
    exact_dupes, near_dupes = definition_duplication(con)
    first_block_dupes = first_block_duplication(con)
    internal = internal_language(public_text_items(con))
    greek_candidates = greek_form_candidates(con)
    form_stats = historical_form_stats(con)
    redundancy = within_article_similarity(con)

    over_fragmented = [item for item in inventory if item["blocks"] >= 4]
    uncomposed = [item for item in inventory if item["blocks"] >= 2 and item["composition_sections"] == 0]
    composed = [item for item in inventory if item["composition_sections"] > 0]

    lines: list[str] = []
    lines += [
        "# Editorial Baseline Audit",
        "",
        "This report is generated from a fresh canonical SQLite build. It is a cleanup ledger, not a blocking validator.",
        "",
        "## Corpus snapshot",
        "",
        f"- Reviewed/published terms: **{counts['terms']}**",
        f"- Terms with teaching articles: **{counts['articles']}**",
        f"- Definition/source-only terms: **{counts['definition_only']}**",
        f"- Source interpretations: **{counts['interpretations']}**",
        f"- Terms with historical forms: **{form_stats['terms_with_forms']}**",
        f"- Historical form records: **{form_stats['forms']}**",
        f"- Entries already using page composition: **{len(composed)}**",
        "",
    ]
    if form_stats["languages"]:
        lines.append("Historical-form languages: " + ", ".join(f"`{code}` {n}" for code, n in form_stats["languages"]) + ".")
        lines.append("")

    lines += [
        "## Mechanical / high-confidence findings",
        "",
        "### Definition and article intro are exact duplicates",
        "",
        f"Count: **{len(exact_dupes)}**",
        "",
    ]
    if exact_dupes:
        for item in exact_dupes:
            lines.append(f"- **{item['label']}** (`{item['slug']}`) — {preview(item['definition'])}")
    else:
        lines.append("- None.")

    lines += [
        "",
        "### Public prose containing project/process vocabulary",
        "",
        f"Count: **{len(internal)}**",
        "",
        "These need human review: some words can be legitimate in context, but phrases about normalization, databases, generation, corpus coverage, or editorial workflow usually do not belong in reader-facing astrology prose.",
        "",
    ]
    if internal:
        for item in internal:
            tags = ", ".join(item["matches"])
            lines.append(f"- **{item['label']}** (`{item['slug']}`) · `{item['location']}` · {tags} — {preview(item['text'])}")
    else:
        lines.append("- None.")

    lines += [
        "",
        "## Composition / hierarchy workload",
        "",
        f"- Articles with 4+ stored article blocks: **{len(over_fragmented)}**",
        f"- Multi-block articles not yet using page composition: **{len(uncomposed)}**",
        f"- Articles already composed: **{len(composed)}**",
        "",
        "### Articles with 4+ blocks",
        "",
    ]
    if over_fragmented:
        for item in sorted(over_fragmented, key=lambda x: (-x["blocks"], x["label"].casefold())):
            status = f"composed into {item['composition_sections']} public section(s)" if item["composition_sections"] else "not composed"
            lines.append(
                f"- **{item['label']}** (`{item['slug']}`) — {item['sections']} prose section(s) + {item['tables']} table(s) = {item['blocks']} blocks; {status}."
            )
    else:
        lines.append("- None.")

    lines += [
        "",
        "### Multi-block articles still awaiting composition",
        "",
    ]
    if uncomposed:
        for item in sorted(uncomposed, key=lambda x: (-x["blocks"], x["label"].casefold())):
            lines.append(f"- **{item['label']}** (`{item['slug']}`) — {item['blocks']} stored blocks.")
    else:
        lines.append("- None.")

    lines += [
        "",
        "## Redundancy candidates",
        "",
        "### Definition and article intro are very similar (≥ 0.72)",
        "",
        f"Count: **{len(near_dupes)}**",
        "",
    ]
    if near_dupes:
        for item in near_dupes:
            lines.append(
                f"- **{item['label']}** (`{item['slug']}`) · similarity {item['score']:.2f} — intro: {preview(item['intro'])}"
            )
    else:
        lines.append("- None.")

    lines += [
        "",
        "### First article block substantially repeats definition or intro (≥ 0.72)",
        "",
        f"Count: **{len(first_block_dupes)}**",
        "",
    ]
    if first_block_dupes:
        for item in first_block_dupes:
            lines.append(
                f"- **{item['label']}** (`{item['slug']}`) · `{item['section_key']}` / {item['heading']} · similarity {item['score']:.2f} — {preview(item['body'])}"
            )
    else:
        lines.append("- None.")

    lines += [
        "",
        "### Similar article blocks/captions within one entry (≥ 0.68)",
        "",
        f"Count: **{len(redundancy)}**",
        "",
    ]
    if redundancy:
        for item in redundancy:
            lines.append(
                f"- **{item['label']}** (`{item['slug']}`) · `{item['left']}` ↔ `{item['right']}` · similarity {item['score']:.2f}"
            )
    else:
        lines.append("- None.")

    lines += [
        "",
        "## Historical-language coverage candidates",
        "",
        "### Terms with Hellenistic/Greek source evidence but no Ancient Greek (`grc`) form",
        "",
        f"Count: **{len(greek_candidates)}**",
        "",
        "This is a research candidate list, not an assertion that every entry must receive a Greek headword. Each candidate needs source verification before a form is added.",
        "",
    ]
    if greek_candidates:
        for item in greek_candidates:
            lines.append(f"- **{item['label']}** (`{item['slug']}`) — source authors: {item['authors']}")
    else:
        lines.append("- None.")

    lines += [
        "",
        "## Recommended cleanup order",
        "",
        "1. Remove objective definition/intro duplication and reader-visible process language.",
        "2. Compose the most fragmented article families before rewriting individual paragraphs.",
        "3. Review semantic redundancy inside each family and decide which layer owns each fact.",
        "4. Audit Greek forms for Hellenistic-source terminology, then repeat for Arabic and Latin layers.",
        "5. Promote resolved classes into blocking audit rules only after the corpus is clean.",
        "",
    ]

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines), encoding="utf-8")

    return {
        "counts": counts,
        "exact_definition_intro_duplicates": len(exact_dupes),
        "near_definition_intro_duplicates": len(near_dupes),
        "first_block_duplicates": len(first_block_dupes),
        "internal_language_findings": len(internal),
        "over_fragmented_articles": len(over_fragmented),
        "uncomposed_multi_block_articles": len(uncomposed),
        "composed_articles": len(composed),
        "within_article_redundancy_candidates": len(redundancy),
        "greek_form_candidates": len(greek_candidates),
        "report": output,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", type=Path, help="Audit an existing canonical SQLite database instead of rebuilding.")
    parser.add_argument("--output", type=Path, default=DEFAULT_REPORT, help="Markdown report path.")
    args = parser.parse_args()

    db_path = args.db.expanduser() if args.db else DEFAULT_DB
    if not args.db:
        db_path.parent.mkdir(parents=True, exist_ok=True)
        build_db(db_path)

    con = sqlite3.connect(db_path)
    try:
        result = write_report(con, args.output.expanduser())
    finally:
        con.close()

    print("Editorial baseline audit complete")
    print(f"  terms: {result['counts']['terms']}")
    print(f"  articles: {result['counts']['articles']}")
    print(f"  exact definition/intro duplicates: {result['exact_definition_intro_duplicates']}")
    print(f"  near definition/intro duplicates: {result['near_definition_intro_duplicates']}")
    print(f"  first-block duplication candidates: {result['first_block_duplicates']}")
    print(f"  internal-language findings: {result['internal_language_findings']}")
    print(f"  over-fragmented articles: {result['over_fragmented_articles']}")
    print(f"  uncomposed multi-block articles: {result['uncomposed_multi_block_articles']}")
    print(f"  Greek-form research candidates: {result['greek_form_candidates']}")
    print(f"  report: {result['report']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
