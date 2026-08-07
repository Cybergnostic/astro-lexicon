# Extraction Specification v0.2

## Purpose

This specification defines how source material is converted into candidate encyclopedia records.

The extraction system must favor precision over coverage. Missing a candidate term is preferable to inventing one, and a mere mention is preferable to store only in full-text search rather than promote into the lexicon.

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

Candidate discovery is deliberately broader than database promotion. Finding a term does not mean the source has earned a lexicon interpretation for it.

## Phase 4 — source interpretation and evidence grade

For each candidate, answer only from the source passages:
- Is the term explicitly technical here?
- Does the author define it?
- Does the author provide a recognition rule, calculation, mechanism, subtype, exception, or worked example?
- Is the passage merely mentioning or using the term?
- Does the wording suggest an alias or a distinct concept?
- Does this occurrence add anything substantive beyond stronger evidence already stored from another author?

Assign one evidence grade:

### A — definition-level
The source explains what the concept is well enough to define and distinguish it. Promote to a source interpretation and, if appropriate, use it to create or improve the canonical term.

### B — substantial explanation
The source does not give a compact formal definition but contributes enough mechanism, criteria, subtypes, examples, exceptions, or doctrine to be independently useful. Promote to a source interpretation.

### C — mention/context only
The source only names, lists, casually uses, or associates effects with the term without explaining what it is. **Do not create an interpretation. Do not create a canonical term solely from this evidence.** Keep the occurrence available through source full-text/indexing if useful.

This rule applies even when no better definition has yet been found. The absence of a good definition is not a reason to manufacture a vague one.

It also applies when a good definition already exists. If the new author merely mentions the concept, skip the occurrence rather than adding a weaker duplicate interpretation.

## Phase 5 — cross-source comparison

Only after substantive source-specific interpretations exist:
- compare definitions;
- identify shared core meaning;
- identify disagreements;
- identify translation problems;
- propose aliases and term relations;
- flag possible historical development;
- identify old interpretations that were promoted from weak evidence and should now be pruned.

A later, stronger source may improve the canonical definition without requiring every earlier mention to remain attached to the term.

## Phase 6 — editorial decision

A human editor confirms:
- canonical label;
- term boundaries;
- aliases;
- relations;
- final summary;
- publication status;
- which source interpretations add independent value and which should be deleted as redundant or mention-only.

The goal is not exhaustive author-occurrence tracking. The goal is a useful encyclopedia with source-specific accounts only where the sources actually explain something.

## Pruning rule

Delete an existing source interpretation when all of the following are true:
- it is based only on mention/context-level evidence;
- it does not define or substantially explain the concept;
- it adds no meaningful variant, disagreement, attribution, example, terminology, or historical information;
- stronger evidence now exists, or the entry never met the evidence threshold in the first place.

If deleting that interpretation leaves a canonical term with no substantive evidence at all, delete the term as well. A later source may recreate it when proper evidence appears.

Do **not** delete an earlier interpretation merely because a later author is clearer if the earlier author independently provides a real definition, distinctive rule, variant, or historically useful explanation.

## Failure conditions

Flag for manual review when:
- OCR is poor;
- the passage depends on a table or diagram;
- a translator's terminology is ambiguous;
- an apparent synonym could hide a doctrinal distinction;
- page numbering cannot be verified;
- the source passage is too fragmentary to support a definition.

Fragmentary or mention-only evidence should normally remain unpromoted rather than receiving a guessed definition.

## Model-use rule

Small local models may perform constrained extraction and matching, but should not be trusted to decide canonical identity, historical equivalence, evidence grade in difficult cases, or whether a vague occurrence should survive editorial pruning.

Stronger reasoning models are reserved for cross-source comparison, ontology decisions, evidence grading, definition revision, and difficult editorial review.
