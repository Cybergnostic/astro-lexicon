# Lexicographic editorial standard — v1

**Status:** calibration policy for reviewing 468 published/reviewed headwords. Derived from ten pilot entries. This standard supplements, not replaces, the earlier reader-usefulness audit; it does not force longer articles. Automated suggestions do not constitute scholarly approval.

## 1. Non-negotiable historical invariants

1. Preserve historically distinct doctrines even when their English names resemble each other: unequal Firdaria (database slug fardar) is not Lilly's Alfridary; one-way reception is not identical to mutual reception; named-source formula variants remain separate.
2. Attribute numerical rules, formulae, conditions and conflicting readings to the **author, work, edition and locator**. Don't combine incompatible rules into one universal procedure.
3. Distinguish the historical author from a translator's/editor's annotations. The editorial footnote identifying an-namudar in the Bonatti PDF is not Bonatti's own statement.
4. Keep schemes, tables, diagram components, aliases, sources and relationship records intact unless independent evidence demands change. No restoration of prose already eliminated as duplicate table content.
5. Do not copy extended passages from copyrighted translations. Paraphrase faithfully, using short quotes only when justified.
6. Never rewrite older migration/seed files: add new ordered SQL correction seeds and run full build/integrity checks.

## 2. Entry archetypes — choose appropriate treatment

| Type | Expected substance | Common mistake |
| --- | --- | --- |
| Dictionary headword | Independent short definition; variant name and see-also when useful. | Manufactured three-section essay. |
| Motion / technical relation | Actors, required configuration and temporal sequence; useful named-source example. | Four repetitions of the same motion. |
| Method / calculation | Preconditions, source-scoped steps, evidence-backed example/formula, known variants. | One fabricated universal algorithm. |
| Classification / reference system | Membership, tests, well-labelled tables and source differences. | Prose duplicates every table row. |
| Planet / sign / entity | Traditional identity first, then structured classifications and relevant source accounts. | Modern physical astronomy takes over the entry. |
| Philological/historical term | Original language, transliterations, attestations, senses and false friends. | Unattested etymology or merged senses. |

A term may combine archetypes. The type is an editorial aid, not a rigid schema.

## 3. Editorial rules

- **D1: Headword identity.** Begin with genus and distinguishing characteristic. No circular definitions or rhetorical openings.
- **D2: Independent short definition.** It must make sense in an alphabetic index without the rest of the article.
- **D3: Information gain.** Each paragraph must add mechanism, comparison, evidence, use or a recognition example. Remove intros that merely paraphrase the already-rendered definition.
- **D4: Named-source scope.** Write "Lilly's rule" or "al-Biruni's list" when not known to be universally shared.
- **D5: Public voice.** No "our corpus", "the project maintains", "this encyclopedia chooses" or project-internal justifications. State the historical distinction instead.
- **D6: Avoid defensive padding.** "Not equivalent" belongs where it prevents a documented confusion; it should not substitute for describing what a concept actually means.
- **D7: Concrete examples.** A source-verified historical example often adds more than a generic extra explanatory paragraph.
- **D8: Reading structure.** Definitions, technical exposition, named-source differences, citation and see-also links each have their role. Don't restate the same data in all layers.
- **D9: Conservatism.** Good dictionary-length entries stay short. Do not insert sections merely for symmetry.
- **D10: No silent fact edits.** A style pass must not alter formulas, planetary tables or doctrines without separately reviewed evidence.

## 4. Source handling

- **S1:** Claims about historical variants, numerical values, formulae, quotations or named authors require precise passage identification. Use book/part/chapter/section and printed-page of a named edition where possible; PDF pages alone are research aids.
- **S2:** Label the evidence nature in review notes: historical author / translator-editor note / secondary report / editorial inference / source not yet checked.
- **S3:** Bad OCR is not evidence of historical disagreement. Flag uncertain readings, especially tables, for visual/manual checking.
- **S4:** Count independent historical works, not raw interpretations, as corroboration; never infer truth from the number of witnesses.
- **S5:** Where source streams disagree, explain the divergence where the issue is discussed, while keeping full historical accounts in the source section.

## 5. Review workflow / release gates

Per entry record canonical slug, archetype, genuine defects, intended edit, checked evidence with edition/locator, affected tables/aliases/relations, validation and human verdict.

Human states:
- unreviewed
- triaged
- source-pending
- revised-awaiting-review
- no-change-justified (only after human review)
- approved (only after explicit human signoff)

One family per batch, approximately 15–25 entries. Produce a review ledger, evidence pointers, before/after changes, append-only SQL seed, database audits and production build. Make the PR reviewable. No unattended 468-article rewriting.

## 6. Automated triage

Run: python3 scripts/lexicographic_triage.py --out .tmp/lexicographic-triage.csv

The script regenerates the SQLite corpus and flags candidate problems: missing short definitions, project/editorial language in public text, potential intro-definition overlap, historical interpretations with no linked source passage, unusually many sections. It records article and citation coverage; it never marks an entry factually correct, historically verified or approved. It joins curator states from docs/editorial/lexicographic-ledger.csv to the full 468-entry report.

False positives are expected. Evidence checking and rewriting remain editorial tasks. The next batches can be selected from the triage report *after* manual prioritization.

## 7. Source spot checks supporting the ten-entry pilot

- Reception: William Lilly, Christian Astrology, I, p. 112 — mutual reception example.
- Essential Dignity: al-Biruni, Book of Instruction, §§440–445 — domiciles, exaltations and varying schemes.
- Sect and Saturn: al-Biruni, Book of Instruction, §§396–401 — traditional planetary natures and diurnal/nocturnal affiliations.
- Firdaria: al-Biruni, Book of Instruction, §§395 and 438–439 — sect-dependent starting planet and subperiod associations. **The period table is poorly machine-extracted; numerical verification remains open.**
- Annual Profection: Lilly, Christian Astrology, III, ch. CLXVI, pp. 715–716 — one sign/year, twelve-year return; the solar-return starting rule is specific to his presentation, not assumed universal.
- Lot of Fortune: al-Biruni, Book of Instruction, §475 — construction and a historically distinct nocturnal reverse-order practice. Do not merge these formula streams.
- Application: existing review of Abu Ma'shar, Great Introduction, VII.5.4–5.5; full original-edition reconfirmation pending.
- Translation of Light: Lilly, Christian Astrology, I, p. 111 — Mars/Mercury/Saturn example.
- Animodar: Lilly, Christian Astrology, III, ch. XCIX, pp. 505–506; Bonatti rectification passages in the merged PDF pp. 1023–1024. Bonatti's namudar-identification in the modern English PDF footnote is editorial, not authorial.

These are passage spot checks, not blanket verification of all claims, interpretations or structured tables for each entry.
