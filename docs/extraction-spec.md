# Extraction Specification v0.1

## Purpose

This specification defines how source material is converted into candidate encyclopedia records.

The extraction system must favor precision over coverage. Missing a candidate term is preferable to inventing one.

## Phase 1 — source registration

For every source edition record:
- author;
- work title;
- edition title;
- translator/editor;
- publication details;
- language(s);
- copyright/public-domain notes;
- file hash (local only if source files remain private).

## Phase 2 — deterministic extraction

Before using an LLM:
- extract text with page boundaries;
- preserve printed page numbers where recoverable;
- capture table of contents and indexes;
- identify headings and section boundaries;
- create lexical full-text search;
- optionally create embeddings for semantic retrieval.

Do not let the LLM invent page or section metadata.

## Phase 3 — candidate term discovery

Use multiple signals:
- index/glossary entries;
- section and chapter headings;
- typographic definitions;
- repeated technical nouns/phrases;
- matches against the existing canonical term list;
- semantic retrieval around already-known concepts.

A candidate record should include:

```json
{
  "surface_form": "reception",
  "proposed_canonical_term": "reception",
  "source_id": "...",
  "page": 0,
  "section": "...",
  "evidence_text": "...",
  "candidate_type": "known_term | new_term | alias | uncertain",
  "confidence": 0.0
}
```

## Phase 4 — source interpretation

For each candidate, answer only from the retrieved source passages:
- Is the term explicitly technical here?
- Does the author define it?
- Does the author describe effects, conditions, exceptions, or subtypes?
- Is the passage merely mentioning the term?
- Does the wording suggest an alias or a distinct concept?

Do not import doctrine from other authors during this phase.

## Phase 5 — cross-source comparison

Only after source-specific interpretations exist:
- compare definitions;
- identify shared core meaning;
- identify disagreements;
- identify translation problems;
- propose aliases and term relations;
- flag possible historical development.

## Phase 6 — editorial decision

A human editor confirms:
- canonical label;
- term boundaries;
- aliases;
- relations;
- final summary;
- publication status.

## Failure conditions

Flag for manual review when:
- OCR is poor;
- the passage depends on a table or diagram;
- a translator's terminology is ambiguous;
- an apparent synonym could hide a doctrinal distinction;
- page numbering cannot be verified;
- the source passage is too fragmentary to support a definition.

## Model-use rule

Small local models may perform constrained extraction and matching, but should not be trusted to decide canonical identity or historical equivalence.

Stronger reasoning models are reserved for cross-source comparison, ontology decisions, and difficult editorial review.
