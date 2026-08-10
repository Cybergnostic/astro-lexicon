#!/usr/bin/env python3
"""Small invariant checks for the generated frontend corpus.

These checks complement the SQL/editorial audits by validating assumptions made by
Astro after the canonical database has been exported to JSON.
"""

from __future__ import annotations

import json
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
CORPUS_PATH = ROOT / "src/data/generated/corpus.json"


def fail(message: str) -> None:
    raise AssertionError(message)


def require_unique(values: list[str], label: str) -> None:
    duplicates = sorted({value for value in values if values.count(value) > 1})
    if duplicates:
        fail(f"duplicate {label}: {', '.join(duplicates[:10])}")


def main() -> int:
    if not CORPUS_PATH.exists():
        print(
            f"missing generated corpus: {CORPUS_PATH}\n"
            "Run `npm run generate:data` before this check.",
            file=sys.stderr,
        )
        return 1

    try:
        corpus = json.loads(CORPUS_PATH.read_text(encoding="utf-8"))

        terms = corpus.get("terms")
        authors = corpus.get("authors")
        works = corpus.get("works")
        meta = corpus.get("meta")
        if not isinstance(terms, list) or not isinstance(authors, list) or not isinstance(works, list):
            fail("corpus must expose terms, authors, and works arrays")
        if not isinstance(meta, dict):
            fail("corpus must expose a meta object")

        term_slugs = [term.get("slug") for term in terms]
        author_slugs = [author.get("slug") for author in authors]
        work_slugs = [work.get("slug") for work in works]
        if any(not slug for slug in term_slugs):
            fail("every exported term must have a slug")
        if any(not slug for slug in author_slugs):
            fail("every exported author must have a slug")
        if any(not slug for slug in work_slugs):
            fail("every exported work must have a slug")
        require_unique(term_slugs, "term slugs")
        require_unique(author_slugs, "author slugs")
        require_unique(work_slugs, "work slugs")

        if meta.get("terms") != len(terms):
            fail(f"meta.terms={meta.get('terms')} but exported terms={len(terms)}")
        if meta.get("authors") != len(authors):
            fail(f"meta.authors={meta.get('authors')} but exported authors={len(authors)}")
        if meta.get("works") != len(works):
            fail(f"meta.works={meta.get('works')} but exported works={len(works)}")

        interpretation_count = sum(len(term.get("interpretations", [])) for term in terms)
        if meta.get("interpretations") != interpretation_count:
            fail(
                f"meta.interpretations={meta.get('interpretations')} "
                f"but exported interpretations={interpretation_count}"
            )

        term_slug_set = set(term_slugs)
        work_slug_set = set(work_slugs)
        author_slug_set = set(author_slugs)

        for term in terms:
            slug = term["slug"]
            if not term.get("label"):
                fail(f"term {slug} has no label")
            if not isinstance(term.get("aliases", []), list):
                fail(f"term {slug} aliases must be an array")

            for relation in term.get("relations", []):
                target = relation.get("target_slug")
                if target not in term_slug_set:
                    fail(f"term {slug} relation targets non-exported term {target!r}")

            for interpretation in term.get("interpretations", []):
                work_slug = interpretation.get("work_slug")
                author_slug = interpretation.get("author_slug")
                if work_slug not in work_slug_set:
                    fail(f"term {slug} interpretation references non-exported work {work_slug!r}")
                if author_slug not in author_slug_set:
                    fail(f"term {slug} interpretation references non-exported author {author_slug!r}")

            article = term.get("article")
            composition = term.get("page_composition", [])
            if composition and not isinstance(composition, list):
                fail(f"term {slug} page_composition must be an array")
            if not composition:
                continue

            section_keys = set()
            table_keys = set()
            if article:
                section_keys = {section.get("section_key") for section in article.get("sections", [])}
                table_keys = {table.get("table_key") for table in article.get("tables", [])}

            seen_page_sections = set()
            for page_section in composition:
                page_key = page_section.get("section_key")
                if not page_key:
                    fail(f"term {slug} has a composed page section without section_key")
                if page_key in seen_page_sections:
                    fail(f"term {slug} repeats composed page section {page_key!r}")
                seen_page_sections.add(page_key)

                for block in page_section.get("blocks", []):
                    source_kind = block.get("source_kind")
                    source_key = block.get("source_key")
                    if source_kind == "article-section" and source_key not in section_keys:
                        fail(f"term {slug} composition references missing article section {source_key!r}")
                    if source_kind == "article-table" and source_key not in table_keys:
                        fail(f"term {slug} composition references missing article table {source_key!r}")
                    if source_kind not in {"article-section", "article-table", "component"}:
                        fail(f"term {slug} has unsupported composition source_kind {source_kind!r}")

        for author in authors:
            for work in author.get("works", []):
                if work.get("slug") not in work_slug_set:
                    fail(
                        f"author {author['slug']} embeds work {work.get('slug')!r} "
                        "that is absent from the exported works index"
                    )

        print(
            "Generated corpus checks passed: "
            f"{len(terms)} terms, {len(authors)} authors, {len(works)} works, "
            f"{interpretation_count} interpretations."
        )
        return 0
    except (AssertionError, json.JSONDecodeError) as exc:
        print(f"generated corpus check failed: {exc}", file=sys.stderr)
        return 1


if __name__ == "__main__":
    raise SystemExit(main())
