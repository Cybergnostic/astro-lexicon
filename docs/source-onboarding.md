# Source onboarding and corpus lifecycle

Astro Lexicon is designed so the bibliography can grow faster than the fully indexed evidence corpus. A work does not need to be completely extracted before it can be represented honestly on the site.

## Work status

Every work has one corpus status:

- `bibliographic` — the work and its edition metadata are recorded, but its substantive text has not yet been indexed for lexicon evidence.
- `partial` — sequential extraction has begun and some reviewed source accounts may be public, but the work is not yet covered end to end.
- `indexed` — the intended substantive scope has been read sequentially, extracted, reviewed and passed the corpus audit.

Status describes corpus coverage, not the importance or quality of a book.

## Adding a new book

1. **Register the author once.** Reuse an existing author record when another work by the same person is added.
2. **Register the work.** Give it a stable slug and begin with `bibliographic`, unless extraction is already underway.
3. **Register the edition or translation actually used.** A work may have many editions. Source passages always point to a specific edition so translator/editor provenance remains explicit.
4. **Create an extraction ledger.** Add `docs/extraction/<work-slug>.md` and record the sequential reading boundary, edition used, chapters/sections covered and any unresolved problems.
5. **Extract in coherent chunks.** Append new numbered seed files; do not renumber or rewrite the historical seed order merely because a new book is added. A long work should normally have several sequential extraction seeds rather than one enormous seed.
6. **Promote only useful evidence.** A public interpretation requires definition-level evidence or substantial explanation. Mention-only occurrences can remain in research notes without becoming public interpretations.
7. **Cite every reviewed interpretation.** Link it to one or more source passages with precise locators and edition provenance.
8. **Normalize across sources.** Reuse an existing canonical term when recognition rules truly match. Preserve false friends, aliases, translation differences and author disagreement when they do not.
9. **Run a completion pass.** When sequential extraction is finished, review missing citations, draft relations, weak definitions, duplicate concepts and cross-source conflicts. Change the work to `indexed` only after that review passes.
10. **Run the gates.** A source is not publication-ready until the fresh SQLite audit and generated frontend build are clean.

## Stable identifiers

Database integer IDs are internal implementation details. Public identity is carried by stable slugs for authors, works and terms. New books should therefore reference records by slug in seeds whenever practical rather than depending on numeric IDs.

## Private study material

Private lecture notes, transcripts, slides and distillations may be used as an internal coverage checklist or discovery layer. They are not public historical authorities and should not be committed, quoted, attributed or converted into public source accounts unless the project has the rights to do so.

The preferred workflow is:

`private checklist -> identify a missing concept -> locate historical/public evidence -> write original synthesis -> review -> publish`

## When the corpus becomes very large

The current append-only SQL seed chain is intentionally simple and reproducible. It remains practical for many works because a fresh build is deterministic and all public data is derived from the same canonical database.

If the corpus grows to the point where rebuild time or seed navigation becomes cumbersome, the next orchestration step should be structured per-work manifests/extraction files that generate the canonical database. That change should preserve the same relational model and stable slugs rather than replacing them.

Likewise, the frontend currently exports one generated corpus JSON file. If thousands of terms or tens of thousands of source accounts make that payload unnecessarily large, the export can be split deterministically by term, author/work and search index while keeping SQLite as the canonical build source.
