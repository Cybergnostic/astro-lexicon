# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares technical concepts across historical sources without flattening differences between authors, periods, languages, translators or traditions. SQLite is the canonical source of truth; the public Astro frontend is generated from the reviewed corpus.

## Current status

The major **bird's-eye encyclopedia review is complete on remote `main`**.

That phase reviewed the lexicon as a reader-facing system rather than as isolated database entries. The major families now have coherent definitions, normalized reference data, cross-links and teaching visuals where useful.

Detailed closure ledger:

`docs/revision/birds_eye_encyclopedia_review.md`

Earlier encyclopedia-quality checkpoint:

`docs/revision/encyclopedia_quality_checkpoint_2026-08-09.md`

### Validation status

The latest bird's-eye commits were made remotely through GitHub. They have **not yet been freshly validated locally** in this session.

After pulling `main`, run:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run build
```

Only after both pass should the current remote state be described as locally validated.

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
- Historical disagreements remain visible.
- Translator/editor commentary is not silently attributed to the historical author.
- Source-specific thresholds, formulas and tables stay source-labelled.
- Reusable facts belong in normalized SQLite data rather than repeated prose or hand-written JSON.
- Canonical definitions answer **what the term is**; article prose carries the teaching burden.
- Visuals are added only when they materially improve understanding.

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

`concept_families` is the generic ordered teaching-family layer. Pairwise `term_relations` still describe two-term relationships; concept families describe a larger system and the role of each member inside it.

## Major bird's-eye blocks now complete

### Essential dignity and historical schemes

- complete Lilly/Ptolemaic dignity reference data;
- exaltation/fall degree numbers where supplied;
- complete terms/bounds and faces;
- Egyptian terms/bounds transmitted by Ptolemy as a separate named scheme;
- explicit named-scheme comparison instead of an unlabeled universal “terms” table;
- planet- and sign-centric dignity views from the same canonical rows.

### Historical terminology

- dedicated original-language `term_forms` architecture;
- Greek script, transliteration, gloss, rendering variants and ambiguity notes;
- initial Hellenistic forms for the seven planets, twelve signs and major technical vocabulary.

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
- interruption family including Prohibition, source-specific Frustration, Refrenation and Abscission;
- reusable concept-family frontend map.

### Houses / places

- twelve-place structure;
- angles, succedents and cadents as positional classes;
- positional strength separated from topical signification;
- derived houses as relational recounting;
- Antiochus' dealings taxonomy kept source-specific.

### Lots / Parts

- construction, identity, equivalence and interpretation separated;
- source-specific formula streams preserved;
- separate Abū Maʿshar planetary-Lot family;
- original directed-arc construction visual;
- repeated English names do not imply historical identity.

### Predictive terminology

- duplicate canonical headwords repaired;
- Ptolemy's Ages of Life directly source-backed;
- separate families for time-lord chronology, directions/distributions and revolutions/returns;
- profection, Firdaria, Alfridary, primary directions, distributions and returns presented as different timing mechanisms;
- `solar-direction` and `divisions` remain visibly source-audit-open.

### Historical cosmology / foundational models

- source-backed Traditional Planetary Order;
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

The build pipeline remains generated-data-first. `npm run generate:data` now runs the main SQLite corpus generator and the deterministic zodiac-relation enrichment step before Astro builds the site.

## Repository structure

- `db/migrations/` — canonical SQLite schema
- `db/seed/` — source extraction, reconciliation, reviewed articles and structured data
- `db/audit/` — editorial/integrity audits
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — review decisions, checkpoints and phase closures
- `scripts/generate_frontend_data.py` — main SQLite → frontend corpus generator
- `scripts/enrich_zodiac_relations.py` — deterministic sign-relation enrichment step
- `src/` — Astro frontend

Generated frontend JSON is **not** a second source of truth.

## What remains open

These are bounded future research tasks, not reasons to reopen the whole bird's-eye review:

- direct historical provenance for `solar-direction` and `divisions`;
- premodern provenance for the cautiously recorded modern-traditional Part/Lot of Divorce formula;
- additional named triplicity, bounds/terms or orb schemes when a specific historical witness justifies them;
- stronger standalone lunar-node historical terminology if the corpus supports it;
- lower-priority thin entries, reviewed only inside their relevant families;
- additional books or user-submitted sources through the established source-onboarding/extraction/reconciliation workflow.

Do not restart a generic “find every missing term” pass unless a later corpus expansion creates a concrete reason.

## Scaling to new books

New material should enter through the same layered workflow:

1. register source / edition metadata;
2. extract candidate terminology and substantive doctrine;
3. attach source passages and interpretations;
4. reconcile against existing canonical terms before creating new headwords;
5. preserve source variants instead of flattening them;
6. promote reusable repeated facts into normalized reference tables when justified;
7. run the corpus audit and frontend build.

This keeps the project scalable: new books extend the corpus instead of forcing a rewrite of the existing encyclopedia.

## Validation commands

```bash
npm run audit:corpus
npm run build
```

`audit:corpus` rebuilds the database from migrations + ordered seeds and runs the blocking integrity/editorial checks. `build` runs generated-data preparation and the Astro build.
