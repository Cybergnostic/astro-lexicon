# Clean lecture corpus status

Updated: 2026-08-09

This file tracks the private lecture/doctrine pipeline separately from the public encyclopedia rewrite.

## Editorial boundary

- GitHub `main` is the source of truth for project policy, public lexicon state, and this progress record.
- Private lecture/course files are evidence inputs and are not committed to this repository.
- General traditional-astrology doctrine learned from the private corpus may inform the public lexicon, but public prose must be independently rewritten rather than copied from lecture wording, slides, transcripts, or distinctive authored exposition.
- Lecturer-specific chart-analysis sequences and proprietary workflows are not encyclopedia content unless a general historical doctrine can be separated from them.
- Evidence quality and article quality are separate concerns. The encyclopedia-quality rewrite remains a later phase.

## Current workflow

The active extraction policy is the resumable Terra -> Sol workflow used for NA06:

1. Terra-style atomic extraction from bounded source ranges.
2. Stable IDs and line-level provenance are preserved; earlier records are not renumbered or silently rewritten.
3. Examples remain examples and are not universalized.
4. Reconstructed, ambiguous, sensitive, methodological, contradictory, historical-attribution, and high-impact records are flagged for Sol/editorial review.
5. Human review is retained where chart/table/visual evidence or sensitive claims require it.
6. Only after source coverage, unresolved-item review, Sol review, and provenance-preserving consolidation may a verified topic document be assembled.
7. Mass encyclopedia-quality article rewriting comes after the structured lecture corpus is clean.

## NA06 - Temperament

Source: `natalna_06_temperament.md`

Status after checkpoint 06 and Sol review batch 01-02:

- Terra source coverage: **complete**
- Source lines accounted for: **1-6371**
- Cumulative atomic records: **316**
- Final Terra record: `NAT.05-NA06-0316`
- Next unused claim ID: `NAT.05-NA06-0317`
- Mandatory Sol-review records: **177**
- Sol-approved so far: **24**
- Mandatory Sol-review records remaining: **153**
- Human-review flags: **46**
- Unresolved items: **5** (`UNR-NA06-0001` through `UNR-NA06-0005`)
- Verified `NAT.05` topic document: **not yet created**
- Encyclopedia-quality rewrite: **not started**
- Lecture source SHA-256: `01c3d6d56dabf283999d33ce0dab2263b0ec3e1830e6e0d046e17b060e902369`

Checkpoint 05 covered source lines 4683-5283 and added `NAT.05-NA06-0303` through `NAT.05-NA06-0310` as worked-example records.

Checkpoint 06 covered source lines 5284-6371 and added `NAT.05-NA06-0311` through `NAT.05-NA06-0316`. The late lecture tail was processed but correctly produced no doctrine records where it became personal, political, conversational, or otherwise non-transferable.

The first Sol pass has rechecked and approved `NAT.05-NA06-0001`, `NAT.05-NA06-0016` through `NAT.05-NA06-0027`, and `NAT.05-NA06-0028` through `NAT.05-NA06-0038`. These cover the explicitly labeled Hippocratic table attribution, the twelve-step temperament formula, the Kant temperament section, and the methodological priority that later planetary interpretation is filtered through temperament. Approval here means that the structured claim accurately matches and scopes the lecture evidence; it does not independently authenticate a historical attribution.

The pre-existing cross-topic record `PRX.06-NA06-0050` is intentional and remains unchanged; numeric record suffixes remain unique and contiguous through `0316`.

### Remaining NA06 work

- Resolve or explicitly disposition the five unresolved items.
- Continue Sol/editorial review on the remaining 153 mandatory-review records.
- Consolidate duplicates without destroying source provenance.
- Assemble and audit the verified `NAT.05` knowledge document.
- Do not begin the encyclopedia-quality mass rewrite before this stage is complete.

## NA07 - Vladar ponasanja / vladar geniture

A legacy structured file exists: `natalna_07_vladar_ponasanja__distilled.yaml`.

Known state:

- 32 records.
- Older schema.
- Records are marked `status: distilled`, not Terra/Sol reviewed.
- Some records already carry human-review flags.
- Therefore NA07 must **not** be counted as a completed clean lecture topic under the current workflow.

Next treatment for NA07 should be migration/audit into the current stable-ID, evidence-checked Terra -> Sol policy rather than treating the legacy distillation as final.

## Wider lecture corpus

The stored source inventory contains many additional natal and traditional-astrology lectures. Their presence in the RAG/source inventory is not evidence that they have been completely extracted and editorially reviewed.

Until a source has explicit current-workflow coverage and review state, classify it as one of:

- raw/clean source available;
- legacy distillation available but not current-workflow reviewed;
- Terra extraction in progress;
- Terra extraction complete, Sol review pending;
- verified structured topic complete.

This distinction should be kept explicit in future README/status updates so that retrieval/indexing, structured extraction, editorial verification, and encyclopedia article quality are never conflated.