# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions. Its goal is not merely to store normalized terms and citations, but to produce entries that help a reader genuinely understand each concept.

## Initial historical corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Additional public witnesses may be onboarded as needed for unresolved terminology or doctrine. Partial public witnesses currently include Firmicus Maternus for the Thema Mundi and Claudius Ptolemy for the Egyptian terms/bounds transmitted in *Tetrabiblos* I.21.

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

The active phase is a **whole-encyclopedia editorial architecture review**.

The previous workflow often asked questions from inside the database: Is a term present? Is it sourced? Does it have an article? The current pass asks a different question from the reader's point of view:

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

The detailed phase ledger is:

`docs/revision/birds_eye_encyclopedia_review.md`

## Bird's-eye implementation now on `main`

### Normalized reusable doctrine/reference layers

The canonical SQLite layer now includes:

- `reference_schemes`
- `zodiac_reference_assignments`
- `planetary_cycles`
- `planetary_cycle_phases`
- `term_symbols`
- `term_media`
- `term_forms`
- `term_form_renderings`
- `term_form_attestations`
- `planetary_profiles`
- `zodiac_sign_profiles`

Do not recreate these facts as parallel hand-written JSON or repeated article tables when the normalized layer can drive the same information across several pages.

### Essential dignity / historical schemes

- complete Lilly/Ptolemaic essential-dignity dataset;
- domicile, detriment, exaltation and fall, including exact exaltation/fall degrees where supplied;
- Lilly's sect-dependent triplicity rulers;
- all 60 Lilly/Ptolemaic term/bound ranges;
- all 36 faces/decans;
- Egyptian terms/bounds transmitted by Ptolemy in *Tetrabiblos* I.21 as a **separate named scheme**;
- frontend comparison that labels the competing term/bound schemes explicitly rather than silently calling one table “the terms”;
- planet- and sign-centric dignity views generated from the same canonical rows.

### Original-language terminology

Historical/original-language forms are no longer forced into `aliases`.

The dedicated form layer can preserve:

- language and script;
- historical form/lemma;
- transliteration;
- literal gloss;
- multiple English renderings;
- translation ambiguity / false-friend notes;
- source/work/tradition scope;
- relation to the canonical English headword.

The first reviewed Ancient Greek layer includes major Hellenistic technical vocabulary, all seven traditional planets and the twelve zodiac signs. It uses HOROI as a philological editorial/reference layer while keeping public prose independently written.

Do **not** turn this into a modern-Greek translation project.

### Seven traditional planets

Sun, Moon, Mercury, Venus, Mars, Jupiter and Saturn have been reviewed as one family.

The current planet-page architecture includes:

- reader-facing definition rather than ontology-like wording;
- glyph and historical Greek names/forms;
- modern astronomical identity separated from traditional classification;
- normalized object class / Earth-based observational geometry;
- traditional family, sect, benefic/malefic class and attributed qualities;
- normalized dignity participation, including named term/bound schemes;
- structured synodic/visibility phase sequence where applicable;
- direct/stationary/retrograde cycle relationship where applicable;
- source-specific historical accounts;
- associated source-specific planetary/luminary lot links;
- related concepts.

The old hand-written `planet-summary` dignity tables were removed because they duplicated canonical reference data.

### Twelve zodiac signs

The twelve signs have also been reviewed as one family.

The current sign-page architecture includes:

- coordinate-first reader-facing definition;
- exact equal 30° tropical longitude interval;
- ordinal position in the twelve-sign system;
- normalized element/triplicity, modality, polarity and day/night sign class;
- tropical-quarter position;
- explicit distinction between equal astrological sign and modern IAU constellation boundaries;
- original responsive twelve-sign position strip;
- glyph and historical Greek sign name/form;
- normalized scheme-aware dignity relationships;
- historical source accounts and source-specific additional taxonomies.

Repeated hand-written sign classification and dignity lists were replaced with teaching prose plus normalized linked data.

### Other completed bird's-eye foundation work

- source-backed Thema Mundi entry using Firmicus Maternus, *Mathesis* III.1;
- generated whole-system Essential Dignity display;
- structured solar synodic-cycle records for Moon, Mercury, Venus, Mars, Jupiter and Saturn;
- responsive phase sequences on planet pages.

## Immediate next work

The next pass should **not** redo Egyptian bounds, Greek terminology architecture, the seven-planet family normalization or the twelve-sign family normalization. Build on them.

Continue in this order unless evidence changes the priority:

### 1. Astronomical mechanics / visibility / synodic terminology

Review these as one teaching system:

- celestial sphere;
- ecliptic and celestial equator;
- longitude/latitude and relevant coordinate distinctions;
- primary versus secondary motion;
- direct, stationary and retrograde apparent motion;
- solar elongation and visibility;
- morning/evening appearance and oriental/occidental terminology;
- under-the-beams / combustion / related solar proximity conditions where historically sourced;
- nodes and eclipses;
- fixed-star geometry.

The planet cycle data already exists. The next task is to make sure the standalone concept pages and diagrams allow a reader to understand the mechanics behind those phase labels.

Prefer original lightweight diagrams when the geometry is difficult to understand from prose alone.

### 2. Aspects and connection mechanics

Review aspect geometry and application/perfection/interference vocabulary together. A reader should be able to distinguish:

- geometrical aspect;
- application/separation;
- orb / partile / platick distinctions;
- reception;
- translation / collection;
- prohibition, frustration, refranation and abscission.

Do not turn the family into a horary judgment checklist.

### 3. Houses / places

Review house/place structure and topical meanings together while preserving the distinction between positional strength and topical signification.

### 4. Lots

Most of the large lot extraction/reconciliation work already exists. Review the family as an encyclopedia system: formula visibility, source identities, disambiguation, cross-links and presentation.

### 5. Predictive terminology

Build a comparative overview of profections, firdaria, directions/distributions, revolutions and related terminology without publishing an ordered forecasting workflow.

### 6. Historical cosmology / foundational models

Review Thema Mundi, planetary order, sect, zodiac systems and related cosmological/astronomical models together.

### 7. Long-tail entries

Only after the major families teach coherent systems should the pass return to thin lower-priority definitions.

## Remaining targeted questions inside completed families

The planet/sign passes establish the family architecture but do not imply that every secondary doctrine is exhausted. Keep these as targeted follow-ups rather than reopening a broad extraction pass:

- oriental/occidental terminology and whether every phase label needs its own standalone concept page;
- planetary day/hour correspondences if source-backed and useful;
- commanding/obeying, hearing/seeing and equal-ascension sign-relation families;
- additional historical triplicity or term/bound schemes where a named source warrants them;
- whether an original ecliptic/season diagram adds enough teaching value beyond the existing twelve-sign strip.

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

The current direction is to use it **more**, not less: structured doctrine that appears across many pages should be modeled once as canonical domain data and projected into the relevant encyclopedia pages. The reference-system, historical-form, planet-profile and sign-profile layers all follow this rule.

A future migration to a client/server database would only become necessary if the project evolves into a high-concurrency collaborative editing system. That is not the current architecture.

## Validation

The canonical validation commands remain:

```bash
npm run audit:corpus
npm run build
```

These rebuild the corpus from migrations + ordered seeds, run integrity/editorial diagnostics, generate frontend data, and build the Astro site.

**Important:** the latest bird's-eye changes on `main` were committed remotely through GitHub. They have **not** been locally validated in this session. After pulling `main`, run both commands before treating the latest schema/frontend changes as validated.
