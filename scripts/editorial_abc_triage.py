#!/usr/bin/env python3
"""Classify reviewed lexicon terms into A/B/C editorial prospects.

A = genuine editorial priority: rich or multi-source evidence without adequate synthesis,
    ontology/reconciliation risk, or a structurally central concept that a bare definition
    does not represent well.
B = basically serviceable: current reader-facing material is proportionate to the concept.
C = dictionary-level is enough: narrow, well-defined, low-complexity entries where article
    expansion would mostly restate the definition or a single source account.

This is a non-blocking prioritization report, not a quality gate.
"""

from __future__ import annotations

import argparse
import re
import sqlite3
from collections import Counter
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/editorial-abc-triage.sqlite"
DEFAULT_REPORT = ROOT / ".tmp/editorial-abc-triage.md"

ONTOLOGY_RE = re.compile(
    r"\b(?:do not merge|don['’]t merge|distinct from|keep distinct|uncertain|ambig(?:uous|uity)|"
    r"conflict(?:ing)?|false friend|duplicate|same (?:word|term|label)|different (?:use|usage|sense)|"
    r"reconcil(?:e|ed|iation)|not identical|not equivalent)\b",
    re.I,
)


def scalar(con: sqlite3.Connection, sql: str, params: tuple = ()) -> int:
    row = con.execute(sql, params).fetchone()
    return int(row[0] or 0)


def term_metrics(con: sqlite3.Connection) -> list[dict]:
    rows: list[dict] = []
    for t in con.execute(
        """SELECT id,slug,label,category,entry_type,definition_quality,editorial_notes
           FROM terms
           WHERE status IN ('reviewed','published')
           ORDER BY label COLLATE NOCASE"""
    ):
        term_id = t[0]
        has_article = scalar(
            con,
            "SELECT COUNT(*) FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')",
            (term_id,),
        ) > 0
        sections = scalar(
            con,
            "SELECT COUNT(*) FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published')",
            (term_id,),
        )
        tables = scalar(
            con,
            "SELECT COUNT(*) FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published')",
            (term_id,),
        )
        interpretations = scalar(
            con,
            "SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')",
            (term_id,),
        )
        works = scalar(
            con,
            "SELECT COUNT(DISTINCT work_id) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')",
            (term_id,),
        )
        grade_a = scalar(
            con,
            "SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published') AND evidence_grade='A'",
            (term_id,),
        )
        aliases = scalar(con, "SELECT COUNT(*) FROM aliases WHERE term_id=?", (term_id,))
        relations = scalar(
            con,
            """SELECT COUNT(*) FROM term_relations
               WHERE status IN ('reviewed','published')
                 AND (subject_term_id=? OR object_term_id=?)""",
            (term_id, term_id),
        )
        contrast_relations = scalar(
            con,
            """SELECT COUNT(*) FROM term_relations
               WHERE status IN ('reviewed','published')
                 AND relation_type IN ('distinct-from','contrasts-with','historical-correspondence','conceptually-corresponds-to')
                 AND (subject_term_id=? OR object_term_id=?)""",
            (term_id, term_id),
        )
        notes = t[6] or ""
        rows.append(
            {
                "id": term_id,
                "slug": t[1],
                "label": t[2],
                "category": t[3] or "",
                "entry_type": t[4] or "",
                "definition_quality": int(t[5] or 0),
                "editorial_notes": notes,
                "has_article": has_article,
                "sections": sections,
                "tables": tables,
                "blocks": sections + tables,
                "interpretations": interpretations,
                "works": works,
                "grade_a": grade_a,
                "aliases": aliases,
                "relations": relations,
                "contrast_relations": contrast_relations,
                "ontology_signal": bool(ONTOLOGY_RE.search(notes)),
            }
        )
    return rows


def classify(row: dict) -> tuple[str, list[str]]:
    reasons: list[str] = []

    # A: substantial evidence or conceptual structure is not yet adequately synthesized.
    if row["works"] >= 2 and not row["has_article"]:
        reasons.append(f"{row['works']} source works but no article")
    if row["interpretations"] >= 3 and row["blocks"] < 2:
        reasons.append(f"{row['interpretations']} interpretations but only {row['blocks']} article blocks")
    if row["ontology_signal"] and row["blocks"] < 2 and (
        row["works"] >= 2 or row["aliases"] >= 2 or row["contrast_relations"] >= 1
    ):
        reasons.append("ontology/reconciliation warning with little reader explanation")
    if not row["has_article"] and row["relations"] >= 5 and row["definition_quality"] >= 4:
        reasons.append(f"central concept with {row['relations']} reviewed relations but no article")
    if row["definition_quality"] <= 3 and row["interpretations"] >= 2:
        reasons.append("reviewed evidence exists but canonical definition remains low-confidence")

    if reasons:
        return "A", reasons

    # C: a compact dictionary entry is proportionate to the evidence and complexity.
    if (
        not row["has_article"]
        and row["definition_quality"] >= 4
        and row["works"] <= 1
        and row["interpretations"] <= 1
        and row["contrast_relations"] == 0
        and row["relations"] <= 3
        and not row["ontology_signal"]
    ):
        return "C", ["narrow, low-complexity entry; strong definition is proportionate"]

    # Existing concise articles are B unless another rule above found a real defect.
    return "B", ["serviceable at current depth; no strong signal for expansion"]


def render(rows: list[dict]) -> str:
    counts = Counter(row["tier"] for row in rows)
    lines = [
        "# Editorial A / B / C triage",
        "",
        "This report is non-blocking. It prioritizes editorial attention; it does not grade the truth or worth of a term.",
        "",
        "## Summary",
        "",
        f"- **A — substantial editorial work:** {counts['A']}",
        f"- **B — basically serviceable:** {counts['B']}",
        f"- **C — dictionary-level is enough:** {counts['C']}",
        f"- **Total reviewed/published terms:** {len(rows)}",
        "",
        "## A — substantial editorial work",
        "",
    ]
    for row in [r for r in rows if r["tier"] == "A"]:
        lines.append(
            f"- **{row['label']}** (`{row['slug']}`) — " + "; ".join(row["reasons"])
            + f". Evidence: {row['interpretations']} interpretations / {row['works']} works; "
              f"article blocks: {row['blocks']}; relations: {row['relations']}."
        )

    lines += ["", "## B — basically serviceable", ""]
    for row in [r for r in rows if r["tier"] == "B"]:
        lines.append(
            f"- **{row['label']}** (`{row['slug']}`) — {row['reasons'][0]}. "
            f"Evidence {row['interpretations']}/{row['works']} works; blocks {row['blocks']}."
        )

    lines += ["", "## C — dictionary-level is enough", ""]
    for row in [r for r in rows if r["tier"] == "C"]:
        lines.append(
            f"- **{row['label']}** (`{row['slug']}`) — {row['reasons'][0]}."
        )
    lines.append("")
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--db", type=Path, default=DEFAULT_DB)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    args = parser.parse_args()

    args.db.parent.mkdir(parents=True, exist_ok=True)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    build_db(args.db)

    con = sqlite3.connect(args.db)
    try:
        rows = term_metrics(con)
    finally:
        con.close()

    for row in rows:
        row["tier"], row["reasons"] = classify(row)

    # Put the strongest A candidates first without pretending this is an absolute score.
    rows.sort(
        key=lambda r: (
            {"A": 0, "B": 1, "C": 2}[r["tier"]],
            -r["works"],
            -r["interpretations"],
            r["blocks"],
            r["label"].casefold(),
        )
    )
    args.report.write_text(render(rows), encoding="utf-8")

    counts = Counter(row["tier"] for row in rows)
    print(
        f"ABC TRIAGE|total={len(rows)}|A={counts['A']}|B={counts['B']}|C={counts['C']}"
    )
    print("Top A prospects:")
    for row in [r for r in rows if r["tier"] == "A"][:30]:
        print(
            f"A|{row['slug']}|{row['label']}|"
            + "; ".join(row["reasons"])
            + f"|interpretations={row['interpretations']}|works={row['works']}|blocks={row['blocks']}"
        )
    print(f"Report: {args.report}")


if __name__ == "__main__":
    main()
