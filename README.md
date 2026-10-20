# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares technical concepts across historical sources without flattening differences between authors, periods, languages, translators or traditions. SQLite is the canonical source of truth; the public Astro frontend is generated from the reviewed corpus.

## Human editorial review workbench

The local reviewer supports eight manifest-defined cohorts: **10 pilot terms**, **20 Lots/Parts terms**, and six **40-term** groups covering Foundations, Horary, Dignities, Astronomy, Core and zodiacal Sign terminology. Additional groups can be added without changing the interface. It displays the live website beside actual before/after SQLite prose, historical witness summaries, pending checks and approval decisions.

Run in one terminal:

    npm run dev

In a second terminal:

    npm run review

Open http://127.0.0.1:4322/ to review, search, approve, flag sources and leave passage-specific comments. The live website preview runs on port 4321.

Review judgments are saved immediately to the tracked CSV file at docs/editorial/lexicographic-ledger.csv. The existing editorial/reviews.json retains comments and image attachments. Approval requires a human name and all recorded source/review holds to be resolved with an explanation.

Reviewing does not rewrite astrological articles, formulas or source records. Commit and push the saved ledger when your human review session is finished.

Full instructions and safeguards: docs/editorial/human-review-workbench.md.

Validation, including an isolated HTTP test of the decision API:

    npm run review:check

---

## Current status

The major **bird's-eye encyclopedia review** and **Editorial Baseline v1** are complete on remote `main`.

The bird's-eye phase reviewed the lexicon as a reader-facing system rather than as isolated database entries. Editorial Baseline v1 then passed through the existing corpus family by family to repair canonical duplicates, remove public project-language, reduce article over-segmentation, separate structured reference data from explanatory prose, improve historical-form coverage, and correct several source/provenance inconsistencies discovered during the pass.

No further generic editorial-expansion pass is planned at this stage. Future work should be driven by concrete source additions, audit findings or reader-facing defects rather than by another open-ended cleanup sweep.

Detailed bird's-eye closure ledger:

`docs/revision/birds_eye_encyclopedia_review.md`

Earlier encyclopedia-quality checkpoint:

`docs/revision/encyclopedia_quality_checkpoint_2026-08-09.md`

### Validation status

The current `main` state is fully validated by GitHub Actions as of 2026-08-10.

The validation chain rebuilds the canonical SQLite database from the complete migration/seed history, runs SQLite integrity and foreign-key checks, applies the blocking corpus audit, runs the non-blocking editorial report, regenerates the frontend corpus, checks generated-output invariants, and completes the Astro production build.

The generated-output check was added because database integrity alone cannot guarantee that the exported static site is internally coherent. On introduction it immediately exposed two real cross-layer defects that the earlier audits/build did not catch:

- a reviewed relation from `primary-direction` to draft `solar-direction`, which could create a frontend link to a non-exported term;
- reviewed composed content for `promittor` that was being omitted because the canonical term had article sections but no parent `term_articles` intro row after the earlier Promissor/Promittor merge.

Both defects are fixed on `main`. Public relations are now limited to exported terms, and reviewed article sections/tables can be exported even when no intro row exists.

For a full local validation after pulling `main`, run:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run audit:editorial
npm run generate:data
npm run test:generated
npm run build
```

## Editorial Baseline v1

The baseline pass is now closed as an editorial phase.

### What the pass changed

- reviewed the existing corpus family by family rather than only selected showcase entries;
- repaired duplicate canonical identities such as duplicate Bounds/Terms, Decan/Face, Refrenation/Refranation, Promissor/Promittor and duplicate solar-condition headwords;
- preserved historically distinct false friends rather than merging them by English resemblance;
- established the public-headword preference for established European/Latin forms when the same concept also survives under Arabic/Persian forms, while preserving original-language forms in aliases and `term_forms`;
- restored source-backed distinctions where later editorial synthesis had drifted from the historical evidence, especially in the Lots family;
- removed speculative or curriculum-only entries from reviewed/public status when direct historical provenance remained unresolved;
- added and corrected Hellenistic Greek terminology only where the historical equivalence was sufficiently clear;
- reduced repeated definition/intro text and public implementation language;
- introduced page composition as a presentation layer over normalized article content, without making every stored content block mandatory on the public page;
- kept normalized structured data responsible for repeated reference facts while article prose carries explanation and source comparison.

### Composition policy

Database normalization and editorial segmentation are separate concerns.

Stored article sections/tables remain reusable normalized content objects. `term_page_sections` and `term_page_blocks` decide how those objects are grouped for a public article. A composed page may intentionally omit a redundant stored block; omission is therefore an editorial coverage question, not a database-integrity failure.

A composition block that points to a source section/table that no longer exists **is** an integrity error and remains blocking.

## Historical corpus

Initial major public sources:

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Partial public witnesses also include:

- Firmicus Maternus — currently used for the Thema Mundi witness;
- Claudius Ptolemy — directly verified passages currently include Egyptian terms/bounds, domicile structure, planetary order, the ages of life, and sign-relational geometry.

Source PDFs are not stored in this repository.

## Private study corpus policy

A private corpus of lecture notes, transcripts, slides and derived distillations can be used as an **editorial and coverage layer**.

It may help identify missing concepts, distinctions, examples and pedagogical problems. General traditional doctrine learned from it may be synthesized in new language.

It must **not** be used to publish:

- copyrighted lecture wording or slide text;
- recognizable proprietary presentation;
- lecturer-specific scoring systems;
- ordered chart-analysis workflows;
- private methodology merely because it appears in the course.

Whenever a suitable historical/public witness exists, public claims should be attached to that source rather than to the private curriculum.

## Scope: encyclopedia, not analysis manual

The project documents:

- named technical terms;
- classifications;
- historical terminology and original-language forms;
- synonyms and false friends;
- source variants;
- named historical techniques;
- the minimum geometry/arithmetic needed to define a concept.

It does **not** publish full chart-reading recipes, topic-judgment workflows or lecturer-specific procedures.

## Core editorial principles

- A mention is not an interpretation: historical accounts need definition-level or substantive evidence.
- Similar English translations are not merged unless their operative definitions actually agree.
- When one historical concept has both an established European/Latin technical form and an Arabic/Persian form, prefer the European/Latin form as the canonical public headword unless a specific historical reason requires otherwise; preserve Arabic/Persian forms in aliases and the historical terminology layer.
- Historical disagreements remain visible.
- Translator/editor commentary is not silently attributed to the historical author.
- Source-specific thresholds, formulas and tables stay source-labelled.
- Reusable facts belong in normalized SQLite data rather than repeated prose or hand-written JSON.
- Canonical definitions answer **what the term is**; article prose carries the teaching burden.
- Visuals are added only when they materially improve understanding.
- A reviewed encyclopedia entry does not require a synthetic `interpretations` row merely to satisfy an audit if its public identity is already supported by structured/reference evidence; source-interpretation coverage remains visible as a review metric rather than a blanket publication blocker.

## Canonical structured layers

Current reusable domain/reference architecture includes:

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
- `concept_families`
- `concept_family_members`
- `planetary_time_sequences`
- `planetary_time_sequence_steps`
- `term_planetary_time_sequences`
- `zodiac_relation_schemes`
- `zodiac_relation_pairs`
- `term_zodiac_relation_schemes`
- `term_page_sections`
- `term_page_blocks`

`concept_families` is the generic ordered teaching-family layer. Pairwise `term_relations` still describe two-term relationships; concept families describe a larger system and the role of each member inside it.

## Major reviewed families

### Essential dignity and historical schemes

- complete Lilly/Ptolemaic dignity reference data;
- exaltation/fall degree numbers where supplied;
- complete terms/bounds and faces;
- Egyptian terms/bounds transmitted by Ptolemy as a separate named scheme;
- Dorothean triplicity reference kept distinct from Lilly's triplicity scheme;
- explicit named-scheme comparison instead of an unlabeled universal “terms” table;
- planet- and sign-centric dignity views from the same canonical rows.

### Historical terminology

- dedicated original-language `term_forms` architecture;
- Greek script, transliteration, gloss, rendering variants and ambiguity notes;
- Hellenistic forms for the seven planets, twelve signs and a broader set of major technical vocabulary;
- historical forms are added source-sensitively rather than as a modern translation dictionary.

### Seven planets

- consistent definitions and normalized profiles;
- modern physical identity separated from traditional classification;
- sect, benefic/malefic class, attributed qualities and motion;
- dignity participation;
- synodic/visibility cycles and diagrams;
- planetary/luminary Lot links;
- historical Greek forms;
- source-labelled planetary day/hour sequences.

### Twelve signs

- coordinate-first definitions and exact 30° intervals;
- normalized element, modality, polarity and day/night class;
- tropical-quarter position;
- sign-versus-modern-constellation distinction;
- sign-position strip, glyphs and Greek forms;
- dignity relationships;
- source-labelled relational sign geometries.

### Astronomical mechanics

- celestial sphere, ecliptic/equator and coordinates;
- First versus Second Motion;
- direct/station/retrograde apparent motion;
- oriental/occidental distinctions;
- solar proximity versus actual visibility;
- eclipse/occultation/ecliptic-projection geometry;
- original explanatory diagrams.

### Aspects / application / perfection

- geometry separated from application/separation;
- horary Perfection separated from exact aspect;
- Translation versus Collection of Light;
- reception as a relational modifier;
- interruption family including Prohibition, source-specific Frustration, Refranation and Abscission;
- reusable concept-family frontend map;
- high-confidence Greek historical forms added for core Hellenistic aspect/application vocabulary.

### Houses / places

- twelve-place structure;
- angles, succedents and cadents as positional classes;
- positional strength separated from topical signification;
- derived houses as relational recounting;
- Antiochus' dealings taxonomy kept source-specific;
- Hellenistic place/class terminology retained in the historical-form layer.

### Lots / Parts

- construction, identity, equivalence and interpretation separated;
- source-specific formula streams preserved;
- separate Abū Maʿshar planetary-Lot family;
- original directed-arc construction visual;
- repeated English names do not imply historical identity;
- Natural/Immovable and General Significators restored to their direct Abū Maʿshar/Bonatti meanings after a later editorial pass had conflated them with different concepts.

### Horary / interrogation vocabulary

- Querent, Quesited, Significator and Cosignificator retained as roles rather than generic prose labels;
- Interrogation and Horary Astrology related without being flattened into one historically invariant label;
- Radicality and planetary-hour terminology kept source-sensitive;
- public project/navigation language removed.

### Natal / rectification / longevity

- canonical public headwords normalized to Animodar, Hyleg, Alcochoden and Anareta;
- Namudar, Apheta/Haylaj, Kadkhuda and Intersector preserved as historical forms/aliases;
- historical longevity doctrine remains descriptive/source-attributed rather than procedural;
- rectification techniques grouped editorially without publishing a generic rectification workflow.

### Predictive terminology

- duplicate canonical headwords repaired;
- Ptolemy's Ages of Life directly source-backed;
- separate families for time-lord chronology, directions/distributions and revolutions/returns;
- profection, Firdaria, Alfridary, primary directions, distributions and returns presented as different timing mechanisms;
- Promittor retained as the canonical directional role, with Promissor as a spelling variant;
- Distributor and Jarbakhtar remain distinct rather than being collapsed by translation similarity;
- `solar-direction` and `divisions` remain draft research candidates pending direct historical provenance.

### Historical cosmology / foundational models

- source-backed Planetary Order;
- Moon → Mercury → Venus → Sun → Mars → Jupiter → Saturn Earth-outward sequence;
- sphere order distinguished from planetary-hour temporal ordering;
- Thema Mundi kept as a model chart rather than a literal historical event chart;
- corrected the earlier misleading conflation between Thema Mundi domicile order and sphere order;
- data-driven planetary-order visual.

### Planetary days / hours

- source-backed Planetary Day entry;
- normalized Lilly hour-cycle and weekday-ruler sequences;
- Planetary Hour / Planetary Day / Lord of the Hour family;
- generated frontend visual explaining how the two sequences relate.

### Sign relational geometry

Ptolemy I.14–15 is normalized as two separate named pair systems:

- commanding/obeying: Taurus–Pisces, Gemini–Aquarius, Cancer–Capricorn, Leo–Sagittarius, Virgo–Scorpio; Aries/Libra unpaired;
- beholding/equal-power: Gemini–Leo, Taurus–Virgo, Aries–Libra, Pisces–Scorpio, Aquarius–Sagittarius; Cancer/Capricorn unpaired.

These relations are rendered on both concept and sign pages. They are kept distinct from ordinary aspects and from later antiscion pair tables.

## Frontend components added during the review

- `DignityReference.astro`
- `HistoricalForms.astro`
- `PlanetProfile.astro`
- `ZodiacSignProfile.astro`
- `ConceptFamilyMap.astro`
- `AstronomyMechanics.astro`
- `LotMechanics.astro`
- `PlanetaryOrder.astro`
- `PlanetaryTimeSequences.astro`
- `ZodiacRelations.astro`

The build pipeline remains generated-data-first. `npm run generate:data` runs the main SQLite corpus generator plus deterministic enrichment steps before Astro builds the site.

## Repository structure

- `db/migrations/` — canonical SQLite schema
- `db/seed/` — source extraction, reconciliation, reviewed articles and structured data
- `db/audit/` — blocking integrity checks plus non-blocking editorial/coverage reports
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — review decisions, checkpoints and phase closures
- `scripts/generate_frontend_data.py` — main SQLite → frontend corpus generator
- `scripts/test_generated_corpus.py` — generated frontend invariant checks
- `scripts/editorial_baseline_audit.py` — non-blocking editorial cleanup ledger
- `scripts/enrich_page_compositions.py` — deterministic composition enrichment
- `scripts/enrich_zodiac_relations.py` — deterministic sign-relation enrichment
- `src/` — Astro frontend

Generated frontend JSON is **not** a second source of truth.

## What remains open

These are bounded future research or quality tasks, not reasons to reopen the whole Editorial Baseline pass:

- direct historical provenance for draft `solar-direction` and `divisions`;
- stronger direct-source coverage for reviewed contextual/astronomical/reference entries currently surfaced by the non-blocking source-interpretation report;
- additional historical-language forms where a direct technical equivalence can be verified;
- additional named triplicity, bounds/terms or orb schemes when a specific historical witness justifies them;
- lower-priority thin or definition-only entries, improved only when their family/source context warrants it;
- additional books or user-submitted sources through the established source-onboarding/extraction/reconciliation workflow.

Do not restart a generic “find every missing term” or generic “compose every stored block” pass unless a later corpus expansion creates a concrete reason.

## Scaling to new books

New material should enter through the same layered workflow:

1. register source / edition metadata;
2. extract candidate terminology and substantive doctrine;
3. attach source passages and interpretations where the source actually supports a concept;
4. reconcile against existing canonical terms before creating new headwords;
5. preserve source variants instead of flattening them;
6. promote reusable repeated facts into normalized reference tables when justified;
7. run the corpus audit, editorial report, generated-output check and frontend build.

This keeps the project scalable: new books extend the corpus instead of forcing a rewrite of the existing encyclopedia.

## Validation commands

```bash
npm run audit:corpus
npm run audit:editorial
npm run generate:data
npm run test:generated
npm run build
```

`audit:corpus` rebuilds the database from migrations + ordered seeds and blocks on real integrity/publication failures: invalid public definitions, invalid reviewed evidence grades, missing citation links for reviewed interpretations, unresolved alias collisions, dangling/duplicated composition pointers, relevant draft relations and superseded extraction artifacts.

`audit:editorial` is a non-blocking cleanup ledger for definition redundancy, article fragmentation/composition coverage, public process-language and historical-form research candidates.

`generate:data` rebuilds the reviewed frontend corpus and deterministic enrichment layers.

`test:generated` checks the exported corpus for cross-layer invariants such as unique slugs, valid relation targets, interpretation references and composition pointers.

`build` runs generated-data preparation and the Astro production build.
