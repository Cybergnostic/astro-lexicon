#!/usr/bin/env python3
"""Surface likely duplicate canonical term identities for manual review.

This is deliberately non-blocking. It is a discovery aid for ontology cleanup, not an
automatic merge system: similar historical terms can be genuine false friends and must
remain distinct until the source recognition rules are compared.
"""

from __future__ import annotations

import argparse
import re
import sqlite3
from difflib import SequenceMatcher
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/ontology-duplicate-audit.sqlite"
DEFAULT_REPORT = ROOT / ".tmp/ontology-duplicate-audit.md"

STOPWORDS = {
    "a", "an", "and", "as", "at", "by", "for", "from", "in", "into", "is", "of",
    "on", "or", "the", "to", "with", "within", "one", "two", "traditional",
    "planet", "planetary", "astrological", "astrology", "condition", "term",
}


def normalize_label(text: str) -> str:
    text = text.casefold().replace("’", "'")
    text = re.sub(r"\([^)]*\)", " ", text)
    text = text.replace("/", " ").replace("-", " ")
    text = re.sub(r"[^a-z0-9]+", " ", text)
    return " ".join(text.split())


def tokens(text: str) -> set[str]:
    return {
        tok
        for tok in normalize_label(text).split()
        if len(tok) >= 3 and tok not in STOPWORDS
    }


def ratio(a: str, b: str) -> float:
    return SequenceMatcher(None, a.casefold(), b.casefold()).ratio()


def jaccard(a: set[str], b: set[str]) -> float:
    if not a or not b:
        return 0.0
    return len(a & b) / len(a | b)


def load_terms(con: sqlite3.Connection) -> list[dict]:
    alias_map: dict[int, list[str]] = {}
    for term_id, label in con.execute("SELECT term_id,label FROM aliases"):
        alias_map.setdefault(term_id, []).append(label)

    out = []
    for row in con.execute(
        """SELECT id,slug,label,short_definition,category,entry_type,definition_quality
           FROM terms
           WHERE status IN ('reviewed','published')
           ORDER BY id"""
    ):
        aliases = alias_map.get(row[0], [])
        definition = row[3] or ""
        out.append(
            {
                "id": row[0],
                "slug": row[1],
                "label": row[2],
                "norm_label": normalize_label(row[2]),
                "definition": definition,
                "definition_tokens": tokens(definition),
                "category": row[4] or "",
                "entry_type": row[5] or "",
                "quality": int(row[6] or 0),
                "aliases": aliases,
                "norm_aliases": {normalize_label(x) for x in aliases},
            }
        )
    return out


def candidate(a: dict, b: dict) -> dict | None:
    label_a = a["norm_label"]
    label_b = b["norm_label"]
    label_sim = ratio(label_a, label_b)
    def_j = jaccard(a["definition_tokens"], b["definition_tokens"])
    same_category = bool(a["category"] and a["category"] == b["category"])

    aliases_a = a["norm_aliases"]
    aliases_b = b["norm_aliases"]
    cross_alias = label_a in aliases_b or label_b in aliases_a or bool(aliases_a & aliases_b)

    # Cheap prefilter before the much more expensive full-definition SequenceMatcher.
    # Pairs survive if terminology is already similar, aliases cross, or the definitions
    # share enough substantive vocabulary to warrant closer comparison.
    if not cross_alias and label_sim < 0.62 and def_j < 0.35:
        return None

    def_sim = ratio(a["definition"], b["definition"])
    reasons: list[str] = []
    score = 0.0

    if label_a == label_b:
        reasons.append("same normalized canonical label")
        score += 5.0
    elif label_sim >= 0.86:
        reasons.append(f"very similar labels ({label_sim:.2f})")
        score += 2.5
    elif label_sim >= 0.70 and same_category:
        reasons.append(f"similar labels in same category ({label_sim:.2f})")
        score += 1.25

    if cross_alias:
        reasons.append("canonical/alias identity overlaps")
        score += 4.0

    if def_sim >= 0.88:
        reasons.append(f"very similar definitions ({def_sim:.2f})")
        score += 3.0
    elif def_sim >= 0.72:
        reasons.append(f"similar definitions ({def_sim:.2f})")
        score += 1.5

    if def_j >= 0.70:
        reasons.append(f"high definition-token overlap ({def_j:.2f})")
        score += 2.0
    elif def_j >= 0.50:
        reasons.append(f"definition-token overlap ({def_j:.2f})")
        score += 0.75

    if same_category:
        score += 0.5

    # Require at least two independent similarity signals, or one exceptionally strong
    # identity signal. This keeps mirrored but genuinely distinct concepts out of the top
    # of the report while still catching spelling/translation duplicates.
    strong_identity = label_a == label_b or cross_alias
    if not strong_identity and len(reasons) < 2:
        return None
    if score < 2.75:
        return None

    return {
        "a": a,
        "b": b,
        "score": score,
        "reasons": reasons,
        "label_sim": label_sim,
        "def_sim": def_sim,
        "def_j": def_j,
    }


def render(candidates: list[dict], total_terms: int) -> str:
    lines = [
        "# Ontology duplicate candidate audit",
        "",
        "Non-blocking review aid. A candidate is not permission to merge: historical false friends must be checked against source mechanics first.",
        "",
        f"Reviewed/published terms scanned: **{total_terms}**",
        f"Candidate pairs: **{len(candidates)}**",
        "",
    ]
    for item in candidates:
        a, b = item["a"], item["b"]
        lines += [
            f"## {a['label']} ↔ {b['label']}",
            "",
            f"- Slugs: `{a['slug']}` ↔ `{b['slug']}`",
            f"- Score: {item['score']:.2f}",
            f"- Categories: `{a['category']}` ↔ `{b['category']}`",
            f"- Signals: {'; '.join(item['reasons'])}",
            f"- Definitions: {a['definition']} / {b['definition']}",
            "",
        ]
    return "\n".join(lines)


def main() -> None:
    parser = argparse.ArgumentParser()
    parser.add_argument("--db", type=Path, default=DEFAULT_DB)
    parser.add_argument("--report", type=Path, default=DEFAULT_REPORT)
    parser.add_argument("--limit", type=int, default=40)
    args = parser.parse_args()

    args.db.parent.mkdir(parents=True, exist_ok=True)
    args.report.parent.mkdir(parents=True, exist_ok=True)
    build_db(args.db)

    con = sqlite3.connect(args.db)
    try:
        terms = load_terms(con)
    finally:
        con.close()

    candidates = []
    for idx, a in enumerate(terms):
        for b in terms[idx + 1 :]:
            item = candidate(a, b)
            if item:
                candidates.append(item)

    candidates.sort(
        key=lambda x: (
            -x["score"],
            x["a"]["label"].casefold(),
            x["b"]["label"].casefold(),
        )
    )
    shown = candidates[: args.limit]
    args.report.write_text(render(shown, len(terms)), encoding="utf-8")

    print(f"ONTOLOGY DUPLICATE AUDIT|terms={len(terms)}|candidates={len(candidates)}|shown={len(shown)}")
    for item in shown:
        a, b = item["a"], item["b"]
        print(
            f"DUPLICATE CANDIDATE|score={item['score']:.2f}|{a['slug']}|{a['label']}|"
            f"{b['slug']}|{b['label']}|" + "; ".join(item["reasons"])
        )
    print(f"Report: {args.report}")


if __name__ == "__main__":
    main()
