#!/usr/bin/env python3
"""Generate a non-blocking editorial cleanup ledger from the canonical corpus.

The audit is deliberately descriptive. Findings are candidates for human review,
not automatic content errors. Once a class of issues has been cleaned corpus-wide,
that rule can later be promoted into the blocking corpus audit.
"""

from __future__ import annotations

import argparse
import re
import sqlite3
from dataclasses import dataclass
from difflib import SequenceMatcher
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/editorial-baseline.sqlite"
DEFAULT_REPORT = ROOT / ".tmp/editorial-baseline-report.md"

PROCESS_PATTERNS = {
    "normalization": re.compile(r"\bnormaliz(?:e|ed|es|ing|ation)\b", re.I),
    "database": re.compile(r"\bdatabase\b|\bsqlite\b", re.I),
    "generation": re.compile(r"\bgenerated\b|\bgenerator\b", re.I),
    "corpus-status": re.compile(r"\bcanonical corpus\b|\bcurrent corpus\b|\breviewed corpus\b", re.I),
    "review-process": re.compile(r"\breview status\b|\beditorial\b|\bmigration\b|\bseed(?:ed|ing)?\b", re.I),
    "software-layer": re.compile(r"\bfront[ -]?end\b|\bback[ -]?end\b|\bstructured data\b", re.I),
    "coverage-process": re.compile(r"\bcoverage\b|\bextraction\b", re.I),
}


@dataclass(frozen=True)
class PublicText:
    term_id: int
    slug: str
    label: str
    location: str
    text: str


def normalize(value: str | None) -> str:
    if not value:
        return ""
    value = value.casefold().replace("’", "'").replace("‘", "'")
    value = re.sub(r"[^\w\s]", " ", value, flags=re.UNICODE)
    return " ".join(value.split())


def similarity(a: str | None, b: str | None) -> float:
    left, right = normalize(a), normalize(b)
    if not left or not right:
        return 0.0
    if left == right:
        return 1.0
    return SequenceMatcher(None, left, right).ratio()


def preview(text: str | None, limit: int = 155) -> str:
    clean = " ".join((text or "").split())
    return clean if len(clean) <= limit else clean[: limit - 1].rstrip() + "…"


def table_exists(con: sqlite3.Connection, table: str) -> bool:
    return con.execute(
        "SELECT 1 FROM sqlite_master WHERE type='table' AND name=?", (table,)
    ).fetchone() is not None


def add_public_query(
    con: sqlite3.Connection, output: list[PublicText], location: str, sql: str
) -> None:
    try:
        for row in con.execute(sql):
            text = row[3]
            if text and str(text).strip():
                output.append(PublicText(row[0], row[1], row[2], location, str(text)))
    except sqlite3.OperationalError:
        # The report should also work against older canonical snapshots.
        return


def public_texts(con: sqlite3.Connection) -> list[PublicText]:
    output: list[PublicText] = []
    queries = [
        (
            "short_definition",
            "SELECT id,slug,label,short_definition FROM terms WHERE status IN ('reviewed','published')",
        ),
        (
            "article:intro",
            """SELECT t.id,t.slug,t.label,a.intro
               FROM term_articles a JOIN terms t ON t.id=a.term_id
               WHERE a.status IN ('reviewed','published')""",
        ),
        (
            "article:section",
            """SELECT t.id,t.slug,t.label,s.body
               FROM term_article_sections s JOIN terms t ON t.id=s.term_id
               WHERE s.status IN ('reviewed','published')""",
        ),
        (
            "article:table-caption",
            """SELECT t.id,t.slug,t.label,x.caption
               FROM term_article_tables x JOIN terms t ON t.id=x.term_id
               WHERE x.status IN ('reviewed','published') AND x.caption IS NOT NULL""",
        ),
        (
            "concept-family:description",
            """SELECT t.id,t.slug,t.label,cf.description
               FROM concept_family_members m
               JOIN concept_families cf ON cf.id=m.family_id
               JOIN terms t ON t.id=m.term_id
               WHERE cf.status IN ('reviewed','published')
                 AND m.status IN ('reviewed','published')""",
        ),
        (
            "planet-profile:astronomy-note",
            """SELECT t.id,t.slug,t.label,p.astronomy_note
               FROM planetary_profiles p JOIN terms t ON t.id=p.planet_term_id
               WHERE p.status IN ('reviewed','published') AND p.astronomy_note IS NOT NULL""",
        ),
        (
            "planet-profile:traditional-note",
            """SELECT t.id,t.slug,t.label,p.traditional_note
               FROM planetary_profiles p JOIN terms t ON t.id=p.planet_term_id
               WHERE p.status IN ('reviewed','published') AND p.traditional_note IS NOT NULL""",
        ),
        (
            "zodiac-profile:geometry-note",
            """SELECT t.id,t.slug,t.label,z.geometry_note
               FROM zodiac_sign_profiles z JOIN terms t ON t.id=z.sign_term_id
               WHERE z.status IN ('reviewed','published') AND z.geometry_note IS NOT NULL""",
        ),
        (
            "zodiac-profile:tradition-note",
            """SELECT t.id,t.slug,t.label,z.tradition_note
               FROM zodiac_sign_profiles z JOIN terms t ON t.id=z.sign_term_id
               WHERE z.status IN ('reviewed','published') AND z.tradition_note IS NOT NULL""",
        ),
        (
            "planetary-cycle:period-note",
            """SELECT t.id,t.slug,t.label,pc.period_note
               FROM planetary_cycles pc JOIN terms t ON t.id=pc.planet_term_id
               WHERE pc.status IN ('reviewed','published') AND pc.period_note IS NOT NULL""",
        ),
        (
            "planetary-cycle:notes",
            """SELECT t.id,t.slug,t.label,pc.notes
               FROM planetary_cycles pc JOIN terms t ON t.id=pc.planet_term_id
               WHERE pc.status IN ('reviewed','published') AND pc.notes IS NOT NULL""",
        ),
        (
            "planetary-cycle:phase-note",
            """SELECT t.id,t.slug,t.label,ph.notes
               FROM planetary_cycle_phases ph
               JOIN planetary_cycles pc ON pc.id=ph.cycle_id
               JOIN terms t ON t.id=pc.planet_term_id
               WHERE pc.status IN ('reviewed','published') AND ph.notes IS NOT NULL""",
        ),
        (
            "planetary-time:notes",
            """SELECT t.id,t.slug,t.label,s.notes
               FROM term_planetary_time_sequences link
               JOIN planetary_time_sequences s ON s.id=link.sequence_id
               JOIN terms t ON t.id=link.term_id
               WHERE s.status IN ('reviewed','published') AND s.notes IS NOT NULL""",
        ),
        (
            "zodiac-relations:geometry-note",
            """SELECT t.id,t.slug,t.label,s.geometry_note
               FROM term_zodiac_relation_schemes link
               JOIN zodiac_relation_schemes s ON s.id=link.scheme_id
               JOIN terms t ON t.id=link.term_id
               WHERE s.status IN ('reviewed','published') AND s.geometry_note IS NOT NULL""",
        ),
        (
            "zodiac-relations:notes",
            """SELECT t.id,t.slug,t.label,s.notes
               FROM term_zodiac_relation_schemes link
               JOIN zodiac_relation_schemes s ON s.id=link.scheme_id
               JOIN terms t ON t.id=link.term_id
               WHERE s.status IN ('reviewed','published') AND s.notes IS NOT NULL""",
        ),
    ]
    for location, sql in queries:
        add_public_query(con, output, location, sql)
    return output


def corpus_counts(con: sqlite3.Connection) -> dict[str, int]:
    terms = con.execute(
        "SELECT COUNT(*) FROM terms WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    articles = con.execute(
        "SELECT COUNT(*) FROM term_articles WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    interpretations = con.execute(
        "SELECT COUNT(*) FROM interpretations WHERE status IN ('reviewed','published')"
    ).fetchone()[0]
    return {
        "terms": terms,
        "articles": articles,
        "definition_only": terms - articles,
        "interpretations": interpretations,
    }


def article_inventory(con: sqlite3.Connection) -> list[dict]:
    composed_available = table_exists(con, "term_page_sections")
    output = []
    for row in con.execute(
        """SELECT t.id,t.slug,t.label
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')
           ORDER BY t.label COLLATE NOCASE"""
    ):
        term_id, slug, label = row
        section_count = con.execute(
            """SELECT COUNT(*) FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')""",
            (term_id,),
        ).fetchone()[0]
        table_count = con.execute(
            """SELECT COUNT(*) FROM term_article_tables
               WHERE term_id=? AND status IN ('reviewed','published')""",
            (term_id,),
        ).fetchone()[0]
        composition_sections = 0
        if composed_available:
            composition_sections = con.execute(
                """SELECT COUNT(*) FROM term_page_sections
                   WHERE term_id=? AND status IN ('reviewed','published')""",
                (term_id,),
            ).fetchone()[0]
        output.append(
            {
                "id": term_id,
                "slug": slug,
                "label": label,
                "sections": section_count,
                "tables": table_count,
                "blocks": section_count + table_count,
                "composition_sections": composition_sections,
            }
        )
    return output


def definition_intro_candidates(con: sqlite3.Connection) -> tuple[list[dict], list[dict]]:
    exact, near = [], []
    for row in con.execute(
        """SELECT t.slug,t.label,t.short_definition,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')
           ORDER BY t.label COLLATE NOCASE"""
    ):
        score = similarity(row[2], row[3])
        item = {
            "slug": row[0], "label": row[1], "definition": row[2],
            "intro": row[3], "score": score,
        }
        if score == 1.0:
            exact.append(item)
        elif score >= 0.72:
            near.append(item)
    near.sort(key=lambda x: (-x["score"], x["label"].casefold()))
    return exact, near


def first_block_candidates(con: sqlite3.Connection) -> list[dict]:
    output = []
    for row in con.execute(
        """SELECT t.id,t.slug,t.label,t.short_definition,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')"""
    ):
        first = con.execute(
            """SELECT section_key,heading,body FROM term_article_sections
               WHERE term_id=? AND status IN ('reviewed','published')
               ORDER BY sort_order,id LIMIT 1""",
            (row[0],),
        ).fetchone()
        if not first:
            continue
        score = max(similarity(row[3], first[2]), similarity(row[4], first[2]))
        if score >= 0.72:
            output.append(
                {
                    "slug": row[1], "label": row[2], "section_key": first[0],
                    "heading": first[1], "body": first[2], "score": score,
                }
            )
    return sorted(output, key=lambda x: (-x["score"], x["label"].casefold()))


def within_article_candidates(con: sqlite3.Connection) -> list[dict]:
    output = []
    for term in con.execute(
        """SELECT t.id,t.slug,t.label,a.intro
           FROM terms t JOIN term_articles a ON a.term_id=t.id
           WHERE t.status IN ('reviewed','published')
             AND a.status IN ('reviewed','published')"""
    ):
        blocks: list[tuple[str, str]] = [("intro", term[3])]
        blocks += [
            (f"section:{row[0]}", row[1])
            for row in con.execute(
                """SELECT section_key,body FROM term_article_sections
                   WHERE term_id=? AND status IN ('reviewed','published')
                   ORDER BY sort_order,id""",
                (term[0],),
            )
        ]
        blocks += [
            (f"table-caption:{row[0]}", row[1])
            for row in con.execute(
                """SELECT table_key,caption FROM term_article_tables
                   WHERE term_id=? AND status IN ('reviewed','published')
                     AND caption IS NOT NULL
                   ORDER BY sort_order,id""",
                (term[0],),
            )
        ]
        for index, (left_key, left_text) in enumerate(blocks):
            for right_key, right_text in blocks[index + 1 :]:
                score = similarity(left_text, right_text)
                if score >= 0.68:
                    output.append(
                        {
                            "slug": term[1], "label": term[2], "left": left_key,
                            "right": right_key, "score": score,
                        }
                    )
    return sorted(output, key=lambda x: (-x["score"], x["label"].casefold()))


def process_language_candidates(con: sqlite3.Connection) -> list[dict]:
    output = []
    for item in public_texts(con):
        hits = [name for name, pattern in PROCESS_PATTERNS.items() if pattern.search(item.text)]
        if hits:
            output.append(
                {
                    "slug": item.slug, "label": item.label, "location": item.location,
                    "hits": hits, "text": item.text,
                }
            )
    return sorted(output, key=lambda x: (x["label"].casefold(), x["location"]))


def form_stats(con: sqlite3.Connection) -> dict:
    if not table_exists(con, "term_forms"):
        return {"terms": 0, "forms": 0, "languages": []}
    return {
        "terms": con.execute(
            "SELECT COUNT(DISTINCT term_id) FROM term_forms WHERE status IN ('reviewed','published')"
        ).fetchone()[0],
        "forms": con.execute(
            "SELECT COUNT(*) FROM term_forms WHERE status IN ('reviewed','published')"
        ).fetchone()[0],
        "languages": con.execute(
            """SELECT language_code,COUNT(*) FROM term_forms
               WHERE status IN ('reviewed','published')
               GROUP BY language_code ORDER BY COUNT(*) DESC,language_code"""
        ).fetchall(),
    }


def greek_form_candidates(con: sqlite3.Connection) -> list[dict]:
    if not table_exists(con, "term_forms"):
        return []
    rows = con.execute(
        """SELECT t.id,t.slug,t.label,GROUP_CONCAT(DISTINCT a.name)
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


def write_report(con: sqlite3.Connection, output: Path) -> dict:
    counts = corpus_counts(con)
    inventory = article_inventory(con)
    exact, near = definition_intro_candidates(con)
    first_block = first_block_candidates(con)
    within = within_article_candidates(con)
    process = process_language_candidates(con)
    forms = form_stats(con)
    greek = greek_form_candidates(con)

    fragmented = [x for x in inventory if x["blocks"] >= 4]
    uncomposed = [x for x in inventory if x["blocks"] >= 2 and x["composition_sections"] == 0]
    composed = [x for x in inventory if x["composition_sections"] > 0]

    lines = [
        "# Editorial Baseline Audit",
        "",
        "Generated from a fresh canonical SQLite build. This is a cleanup ledger, not a blocking validator.",
        "",
        "## Corpus snapshot",
        "",
        f"- Reviewed/published terms: **{counts['terms']}**",
        f"- Terms with teaching articles: **{counts['articles']}**",
        f"- Definition/source-only terms: **{counts['definition_only']}**",
        f"- Source interpretations: **{counts['interpretations']}**",
        f"- Terms with historical forms: **{forms['terms']}**",
        f"- Historical form records: **{forms['forms']}**",
        f"- Entries already using page composition: **{len(composed)}**",
        "",
    ]
    if forms["languages"]:
        lines += [
            "Historical-form languages: " + ", ".join(f"`{code}` {n}" for code, n in forms["languages"]) + ".",
            "",
        ]

    lines += [
        "## Mechanical / high-confidence findings",
        "",
        "### Definition and article intro are exact duplicates",
        "",
        f"Count: **{len(exact)}**",
        "",
    ]
    lines += [f"- **{x['label']}** (`{x['slug']}`) — {preview(x['definition'])}" for x in exact] or ["- None."]

    lines += [
        "",
        "### Reader-visible prose containing project/process vocabulary",
        "",
        f"Count: **{len(process)}**",
        "",
        "These are review candidates, not automatic errors. The relevant question is whether the sentence teaches astrology/history or explains our software/editorial process.",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) · `{x['location']}` · {', '.join(x['hits'])} — {preview(x['text'])}"
        for x in process
    ] or ["- None."]

    lines += [
        "",
        "## Composition / hierarchy workload",
        "",
        f"- Articles with 4+ stored blocks: **{len(fragmented)}**",
        f"- Multi-block articles not yet composed: **{len(uncomposed)}**",
        f"- Articles already composed: **{len(composed)}**",
        "",
        "### Articles with 4+ blocks",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) — {x['sections']} prose + {x['tables']} table = {x['blocks']} blocks; "
        + (f"composed into {x['composition_sections']} public section(s)." if x["composition_sections"] else "not composed.")
        for x in sorted(fragmented, key=lambda y: (-y["blocks"], y["label"].casefold()))
    ] or ["- None."]

    lines += ["", "### Multi-block articles awaiting composition", ""]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) — {x['blocks']} stored blocks."
        for x in sorted(uncomposed, key=lambda y: (-y["blocks"], y["label"].casefold()))
    ] or ["- None."]

    lines += [
        "",
        "## Redundancy candidates",
        "",
        "### Definition and article intro are very similar (≥ 0.72)",
        "",
        f"Count: **{len(near)}**",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) · similarity {x['score']:.2f} — {preview(x['intro'])}"
        for x in near
    ] or ["- None."]

    lines += [
        "",
        "### First prose block substantially repeats the definition or intro (≥ 0.72)",
        "",
        f"Count: **{len(first_block)}**",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) · `{x['section_key']}` / {x['heading']} · similarity {x['score']:.2f} — {preview(x['body'])}"
        for x in first_block
    ] or ["- None."]

    lines += [
        "",
        "### Similar prose/table captions within one entry (≥ 0.68)",
        "",
        f"Count: **{len(within)}**",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) · `{x['left']}` ↔ `{x['right']}` · similarity {x['score']:.2f}"
        for x in within
    ] or ["- None."]

    lines += [
        "",
        "## Historical-language coverage candidates",
        "",
        "### Hellenistic/Greek-source terms without an Ancient Greek (`grc`) form",
        "",
        f"Count: **{len(greek)}**",
        "",
        "This is a research list. A term is only added after source verification; Hellenistic provenance alone does not prove that every English headword corresponds to one recoverable Greek technical term.",
        "",
    ]
    lines += [
        f"- **{x['label']}** (`{x['slug']}`) — source authors: {x['authors']}"
        for x in greek
    ] or ["- None."]

    lines += [
        "",
        "## Cleanup order",
        "",
        "1. Fix objective duplication and reader-visible process language.",
        "2. Compose the most fragmented families before rewriting individual paragraphs.",
        "3. Resolve semantic redundancy and assign each fact to the correct layer.",
        "4. Verify missing Greek forms, then run equivalent Arabic and Latin form audits.",
        "5. Promote resolved issue classes into blocking invariants only after cleanup.",
        "",
    ]

    output.parent.mkdir(parents=True, exist_ok=True)
    output.write_text("\n".join(lines), encoding="utf-8")
    return {
        "counts": counts,
        "exact": len(exact),
        "near": len(near),
        "first_block": len(first_block),
        "within": len(within),
        "process": len(process),
        "fragmented": len(fragmented),
        "uncomposed": len(uncomposed),
        "composed": len(composed),
        "greek": len(greek),
        "report": output,
    }


def main() -> int:
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument("--db", type=Path, help="Audit an existing canonical SQLite database.")
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
    print(f"  teaching articles: {result['counts']['articles']}")
    print(f"  exact definition/intro duplicates: {result['exact']}")
    print(f"  near definition/intro duplicates: {result['near']}")
    print(f"  first-block redundancy candidates: {result['first_block']}")
    print(f"  within-article redundancy candidates: {result['within']}")
    print(f"  public process-language candidates: {result['process']}")
    print(f"  articles with 4+ stored blocks: {result['fragmented']}")
    print(f"  uncomposed multi-block articles: {result['uncomposed']}")
    print(f"  Greek-form research candidates: {result['greek']}")
    print(f"  report: {result['report']}")
    return 0


if __name__ == "__main__":
    raise SystemExit(main())
