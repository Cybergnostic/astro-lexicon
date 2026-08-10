# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions. Its goal is not merely to store normalized terms and citations, but to produce entries that help a reader genuinely understand each concept.

## Initial historical corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Additional public witnesses may be onboarded as needed for unresolved terminology or doctrine. Firmicus Maternus has now been added as a partial source for the Thema Mundi.

Source PDFs are not stored in this repository.

## Supplemental private study corpus

The project also uses a private study corpus consisting of lecture notes, transcripts, slides, and derived structured distillations covering traditional astrological doctrine.

This material is an **editorial and pedagogical research layer**, not a separately attributed public authority.

The knowledge contained in the private corpus may be used in the lexicon when it expresses general or widely shared traditional doctrine. Concepts such as domicile, exaltation, sect, triplicity, planetary nature, sign classifications, temperament, and similar technical material are not excluded merely because they were learned or summarized in private teaching material.

The important boundary is between **knowledge** and **authored expression or method**:

- copyrighted lecture text, slides, transcripts, distinctive wording, and recognizable presentation are not copied into the public lexicon;
- universal or traditional doctrine may be synthesized into original editorial prose;
- the private corpus may directly supply definitions, distinctions, examples, relationships, and pedagogical clues when these are expressed in new language rather than reproduced verbatim;
- historical/public sources should be used as public evidence whenever a suitable witness exists;
- the private corpus is especially useful for detecting missing fundamentals, weak explanations, absent examples, and concepts that the historical extraction did not promote into standalone entries;
- lecturer-specific analytical workflows, sequencing rules, or proprietary methods are treated as authored methodology and are generally outside the scope of the lexicon unless they are independently historical and relevant as a documented tradition;
- the lecturer is not named or presented as a public source unless there is a separate reason and permission to do so.

The private study corpus itself is not stored in this repository.

## Scope rule: this is a term encyclopedia, not an analysis manual

The project extracts and explains **named terms, technical concepts, classifications, historical terminology, synonyms, source variants and historically established techniques**.

It does **not** convert the private curriculum into a public chart-analysis manual. In particular, the public lexicon should not promote:

- ordered analysis workflows;
- topic-judgment recipes;
- factor checklists;
- lecturer-specific scoring systems;
- procedural chapter structures merely because they exist in the course material.

A procedure belongs in an entry only as far as needed to define a named concept—for example, the arithmetic of a named lot, the geometry of application/separation, or the recognition rule for a technical condition.

## Project principles

- Every substantive historical claim should be traceable to a source; editorial synthesis should be clearly distinguishable from attributed historical evidence.
- A mention is not an interpretation: public historical interpretations must contain definition-level evidence or substantial explanation.
- Historical terminology is preserved rather than silently modernized.
- Similar translated labels are not merged unless their recognition rules support equivalence.
- False friends, author disagreements and doctrinal differences remain visible.
- Canonical definitions identify what a term **is** and how it is recognized; they are not expected to carry the full pedagogical burden of an encyclopedia article.
- Quotations are selective. Public prose is primarily original synthesis with precise source locators.
- Translator and editor commentary is not attributed to the historical author.
- Editorial review is required before extracted material is treated as canonical.
- Private teaching material may guide and inform public synthesis, but copyrighted phrasing and proprietary methodology are not reproduced.
- Source-specific numerical thresholds, formulas, dignity systems and classification tables are labeled as source-specific when the tradition is not uniform.
- Structured astrological reference data should live canonically in SQLite when the same facts need to appear on multiple pages, rather than being duplicated as hand-written article prose or JSON tables.

## Evidence quality is not article quality

The corpus audit and the encyclopedia-quality audit solve different problems.

A term can have an excellent canonical definition, A-grade historical evidence, precise citations, and correct relations while still be a poor teaching entry. A mature article should, where appropriate, also provide:

- a clear plain-language explanation;
- the rule or mechanism by which the concept works;
- one or more concrete examples;
- distinctions from easily confused or related concepts;
- interpretive or practical significance where historically supported;
- important exceptions, qualifications, and source disagreements;
- historical variants and aliases;
- useful links to prerequisite and related concepts;
- a table, diagram, or worked example when prose alone is insufficient.

The public frontend should not repeat the same `short_definition` as both a lead and a visible “Canonical definition” section. The canonical definition remains valuable internally for indexing, normalization, search, APIs, and editorial control; the public article body should add explanatory value rather than duplicate it.

## Repository structure

- `db/migrations/` — canonical SQLite schema and editorial/reference-system fields
- `db/seed/` — source extraction, cross-source editorial revision, reviewed ontology, article seeds and structured reference datasets
- `db/audit/` — read-only editorial/integrity audits, including lot-formula and article-quality coverage
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions, curriculum audits, stage closures, checkpoints and bird's-eye review plans
- `docs/` — ontology, definition, citation, extraction, and source-onboarding policies
- `scripts/generate_frontend_data.py` — reproducible SQLite → public frontend-data generator with source-fingerprint caching
- `src/` — static Astro frontend generated from the canonical corpus

Generated frontend JSON is not a second source of truth. The SQL migrations and ordered seeds remain canonical.

## Previous checkpoint

The first large encyclopedia-quality conversion/corroboration pass is complete. It systematically converted the initial corpus and private curriculum term-discovery map into source-backed encyclopedia entries, structured tables, reconciled lot identities, source-sensitive formulas, connective vocabulary and a usable generated frontend.

The detailed checkpoint is recorded in:

`docs/revision/encyclopedia_quality_checkpoint_2026-08-09.md`

That pass deliberately ended before lower-priority polishing became open-ended.

## Current phase: bird's-eye encyclopedia review

The active phase is now a **whole-encyclopedia editorial architecture review**.

The previous workflow often asked questions from inside the database: Is a term present? Is it sourced? Does it have an article? The new pass asks a different question from the reader's point of view:

> If a reader knew nothing about this subject and opened this entry—or several related entries together—would the doctrine actually make sense as a coherent system?

For every major family and important entry, review five dimensions together:

1. **Definition** — is the lead immediately clear and accurate?
2. **Explanation** — does the reader understand how the concept works and why it matters?
3. **Reference data** — are the tables, degree ranges, formulas, phases or classifications actually present?
4. **Connections** — is the entry wired to the planets, signs, dignities, phases, techniques and related concepts it belongs to?
5. **Presentation** — would a diagram, glyph, comparison table or other visual make the concept easier to understand?

External web research is encouraged in this phase as an **editorial discovery and inspiration layer**. Strong reference sites, astronomy resources, scholarly papers, historical dictionaries and specialist traditional-astrology sites may be used to identify what a good entry should cover and what questions readers expect answered. Their prose, diagrams and organization are not copied. Historical claims remain grounded in primary/historical sources or reliable scholarship.

Useful external benchmarks include:

- Skyscript for reader-facing completeness and traditional-reference pedagogy;
- HOROI and relevant scholarship for Hellenistic terminology, Greek technical vocabulary and source precision;
- reliable astronomy references for physical and observational mechanics;
- the project's own historical corpus for canonical attribution and source comparison.

The bird's-eye review plan is recorded in:

`docs/revision/birds_eye_encyclopedia_review.md`

## Bird's-eye implementation already completed

The first structural block of this phase is already on `main`:

- a normalized reference-data layer for schemes, zodiac/dignity assignments, planetary cycles/phases, symbols and media;
- a complete Lilly/Ptolemaic essential-dignity scheme stored as structured data rather than only article tables;
- domicile, detriment, exaltation and fall assignments, including exact exaltation/fall degrees where present in Lilly's table;
- Lilly's sect-dependent triplicity rulers;
- all 60 term/bound ranges in the Lilly/Ptolemaic scheme;
- all 36 planetary faces/decans;
- Unicode planetary and zodiac glyphs;
- generated whole-system Essential Dignity display;
- planet-centric and sign-centric dignity views built from the same canonical reference rows;
- glyphs displayed on planet/sign entries;
- a source-backed Thema Mundi entry using Firmicus as a partial public witness;
- structured solar synodic-cycle records for the Moon, Mercury, Venus, Mars, Jupiter and Saturn;
- reader-facing planetary-cycle phase sequences on planet pages.

Recent commits at the start of this phase include:

- `21a53b4002f67a0630201ade00a3c3b68457ff21` — normalized reference-system schema
- `03c25680682dcf3a0cf9659e0cda35862813d1fb` — complete Lilly/Ptolemaic dignity data + glyphs
- `761a73ad01b46687bb52257b51860af866dd495e` — generator export for reference systems/cycles/media
- `e075351b68e1a8b748bbc04acfe336485e9eb5cd` — complete Essential Dignity component
- `a14dfbaa19ec0529703ea9381084ec4bdbff13e2` — planet/sign dignity summary component
- `612801f6c6db7841fce51a0147625c510c083ef3` — frontend dignity/glyph wiring
- `df5ba4558e3d1e7b6252b6eda6242c0f2c102f79` — Thema Mundi + Firmicus witness
- `9e5c4943b26cf9e16cbf1f0e600259a3edbf95c4` — planetary synodic-cycle data
- `2a50c366a2d69733a2a8c7024121aef45f6982f5` and `984e98a42335cbfc3613f984e980e176c01195f5` — synodic-cycle frontend
- `a55774096faa88ce83ba07f90dd2a957d575c08e` — bird's-eye review plan

## Immediate next work

The next chat/pass should continue in this order unless new evidence changes the priority:

### 1. Add Egyptian terms/bounds

Egyptian terms must be represented as a **separate named historical reference scheme**, not merged with the Lilly/Ptolemaic term table. Verify the degree ranges against reliable historical/scholarly evidence, store them structurally in the reference tables, and let the frontend distinguish/compare schemes explicitly.

Do not silently call one scheme simply “the terms.”

### 2. Establish the Greek technical-terminology layer

The encyclopedia should preserve original-language technical forms where useful, especially for Hellenistic vocabulary.

Do not merely translate the entire English lexicon into Greek. Extract historically attested technical forms and record, where evidence permits:

- Greek lemma/form;
- Greek script;
- transliteration;
- literal sense or gloss;
- English rendering(s);
- source/work or tradition scope;
- relationship to the canonical English term;
- translation ambiguity or false-friend notes.

Before overloading `aliases`, assess whether a dedicated `term_forms` / historical-language-form schema is cleaner. HOROI and scholarly/primary sources can guide this work, but do not treat modern reconstructed terminology as source-attested without evidence.

### 3. Review the seven traditional planets as one family

This is the first complete family-level bird's-eye review.

Inspect Sun, Moon, Mercury, Venus, Mars, Jupiter and Saturn side-by-side. Establish a consistent editorial model for what every planetary entry should contain, while preserving genuine source-specific variation.

At minimum examine:

- clear human-readable definition;
- astronomical/observational identity;
- glyph and naming forms;
- traditional qualities/nature;
- sect;
- benefic/malefic and other historical classifications;
- domicile/exaltation/detriment/fall;
- triplicity, terms and faces through structured reference data;
- synodic cycle and visibility/motion phases;
- oriental/occidental distinctions where applicable;
- station/retrogradation/direct motion where applicable;
- historical differences between authors;
- associated planetary lots and related doctrine;
- useful diagrams or other visual teaching aids.

Use external reference sites and astronomy sources aggressively to discover missing dimensions and improve pedagogy, but write original prose and source historical claims properly.

### 4. Then review the twelve signs and zodiac as a family

Apply the same method after the planetary family establishes the template. Sign pages should become coherent system pages rather than disconnected descriptions, with structured relations to element/triplicity, modality, gender, domicile/exaltation/debility, historical sign-pair relations, rising-time classifications, glyphs and relevant cosmological structure.

### 5. Continue family-by-family

After planets and signs, proceed through major coherent families such as:

- planetary conditions and motion;
- aspects/configurations;
- houses/places;
- lots;
- astronomical foundations;
- predictive terminology;
- horary vocabulary;
- sect, qualities and temperament;
- specialized historical terminology.

Periodically zoom back out and judge whether the encyclopedia teaches the **system**, not just whether individual entries pass a database audit.

## Definition-quality rule for this phase

Definitions should answer **“what is this?”** immediately and naturally. Avoid ontology-style leads such as “a classification denoting…” when a direct sentence is clearer.

For example, a good peregrine definition should immediately explain that the planet has none of **its own** essential dignities at that degree. Occupying another planet's term or face does not make it non-peregrine.

The article body may then explain mechanism, history, exceptions, examples and source disagreement.

## Known unresolved items

These remain targeted research questions rather than reasons to reopen a broad extraction pass:

- **Lot / Part of Divorce:** modern traditional formula located, but premodern provenance remains unresolved.
- **Solar Directions / Divisions:** insufficient direct witness in the initial corpus for forced reconciliation.
- **Ptolemaic Ages exact tables:** source-sensitive; do not universalize later tables without a named witness.
- **Triplicity-ruler variants:** Lilly is represented; other historical schemes should be added under explicit source identities.
- **Lower-priority thin articles:** revisit during the relevant family-level bird's-eye review rather than through an isolated global cleanup.

## SQLite strategy

SQLite remains the canonical backend and is considered appropriate for this project.

The current direction is to use it **more**, not less: structured doctrine that appears across many pages should be modeled once as canonical domain data and projected into the relevant encyclopedia pages. The new reference-system schema is the first implementation of this approach.

A future migration to a client/server database would only become necessary if the project evolves into a high-concurrency collaborative editing system. That is not the current architecture.

## Validation

The canonical validation commands remain:

```bash
npm run audit:corpus
npm run build
```

These rebuild the corpus from migrations + ordered seeds, run integrity/editorial diagnostics, generate frontend data, and build the Astro site.

Important: the latest bird's-eye phase commits were made remotely through GitHub and have **not** been claimed as locally validated. After pulling `main`, run both commands before treating the latest schema/frontend changes as validated.
