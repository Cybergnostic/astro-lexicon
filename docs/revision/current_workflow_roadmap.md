# Current Workflow Roadmap

Status date: 2026-08-09

## Goal

Build a source-based, teaching-quality traditional astrology **term encyclopedia / lexicon** from the historical corpus plus the private structured study corpus, without duplicating extraction work or publishing private lecture text.

The public unit is the **term or concept**, not the course lesson and not a chart-analysis workflow.

## Where we are

### Phase 1 — Historical corpus foundation — COMPLETE for initial corpus

- Five initial historical works sequentially extracted.
- Cross-source normalization/revision completed.
- Reviewed A/B evidence linked to canonical terms.
- Fresh SQLite rebuild/audit passes.
- Canonical SQLite -> generated frontend pipeline exists.

This phase is complete for the initial five works, not for every astrology book in the wider private collection.

### Phase 2 — Clean private curriculum distillation — COMPLETE at first-pass level

- 40-lesson clean curriculum has structured distillations.
- NA06 Temperament received the stricter Terra/Sol benchmark treatment.
- All 177 mandatory NA06 Sol records have decisions.
- Remaining 39 legacy distillations audited for reuse quality.

Audit result excluding NA06:

- 31 A — reusable distillation
- 8 B — reusable with targeted source/safety audit
- 0 C — default full raw re-extraction

Raw lecture re-extraction is exception-driven rather than the default workflow.

### Phase 3 — Term discovery and canonical mapping — CURRENT CORE WORK

For each existing distillation:

1. identify named concepts, classifications, conditions, techniques, historical terms, formula-defined points and genuine technical distinctions;
2. map each surviving concept to an existing canonical term where possible;
3. add a new canonical term only when the concept is genuinely missing;
4. preserve synonyms, translation variants and author/tradition variants without duplicating concepts;
5. use private material as a coverage and disambiguation aid, not as public authority;
6. return to raw private sources only when a term's meaning or provenance is unclear;
7. publish only original synthesis supported by public historical evidence where available.

### Explicit exclusion: analysis workflows

Do **not** turn course procedures into public encyclopedia content merely because they are present in the distillation.

Examples of excluded material:

- ordered chart-reading sequences;
- "first inspect X, then Y" instructions;
- topic checklists such as all factors to inspect for finances, marriage or profession;
- instructor-specific synthesis recipes;
- client-reading workflows;
- scoring systems that have no independently established historical identity.

A procedure belongs in the lexicon only when the procedure itself is a historically identifiable **named technique or term** that needs definition. For example, `Lot Extraction`, `Primary Direction`, `Profection`, or `Solar Revolution` can have entries because they are canonical techniques; a lecturer's sequence for analysing finances does not become an encyclopedia entry.

### Phase 4 — Encyclopedia article layer — IN PROGRESS

A separate reviewed article layer exists in SQLite:

- `term_articles`
- `term_article_sections`

The frontend generator exports reviewed article content and term pages render it between the concise lead and historical source accounts.

Teaching/article migration now includes, among others:

- Temperament / Complexion
- Primary Quality
- Sign Modality / Quadruplicity
- Planetary Gender
- Essential Dignity
- Reception
- all seven traditional planets
- Aspect
- Twelve Houses / Places
- Angle / Cardine
- Succedent House / Place
- Cadent House / Place
- Accidental Fortitude
- Direct Motion
- Station
- Retrogradation
- Sect
- Hayz
- Halb
- Triplicity Rulers
- Almuten
- Almuten of the Figure
- Void of Course
- Feral
- Besiegement
- Mercury rational-mind layer
- Moon perceptive/habitual layer
- Lot
- Lot Extraction
- Natural / Immovable Significators of a Lot
- General Indicators of a Lot
- Lot of Fortune

The private lecture corpus remains a term-discovery/pedagogy map; no private lecture wording or lecturer attribution is stored publicly.

### Phase 5 — Foundational term-family migration — SUBSTANTIALLY COMPLETE

Major foundational families already mapped or enriched:

- planets and planetary classifications;
- signs and sign classifications;
- essential and accidental dignity/debility;
- sect;
- houses and house strength;
- aspects and reception;
- motion and solar conditions;
- temperament;
- triplicity rulers;
- almuten terminology;
- lots / calculated points;
- basic astronomical geometry and coordinates.

Important exclusions/holds:

- `Primary Motivation` remains private/course-specific unless independently historically corroborated as a stable traditional term;
- `Ruler of Behavior / Manners` remains a valid candidate term but awaits a public historical witness outside the initial five-source corpus;
- the private `Quality of Mind` recipe is not published as a universal workflow; portable Mercury/Moon concepts enrich those canonical entries instead.

### Phase 6 — Corpus-wide lesson-to-term sweep — CURRENT ACTIVE PHASE

The remaining A-class lessons are now treated as **term-mining passes**, not as topic modules to reproduce publicly.

Current sweep order:

1. fortune / finances material -> lots, wealth-related named points, historical wealth terminology, relevant fixed technical concepts;
2. house-topic lessons -> named house concepts, historical labels and distinctions, not house-analysis checklists;
3. friends/enemies -> named lots, classifications and historical terms;
4. profession / career / eminence -> canonical vocational and eminence terms only;
5. relationships / marriage -> named lots, significator terms and historical distinctions only;
6. predictive lessons -> each canonical technique and its subterms (Firdaria, Primary Directions, Profections, Solar Revolutions, Lunar Revolutions, Transits, Divisions), not a predictive workflow.

A lesson may contribute zero, one or many encyclopedia entries. It does not automatically get its own public page.

### Phase 7 — B-class sensitive/compressed lessons — QUEUED WITH GATES

- physical appearance;
- Hyleg/Alcocoden and lifespan terminology;
- medical-astrology terminology;
- accidents/death terminology;
- offspring/fertility terminology;
- worked exercises used only for gap detection;
- sensitive house meanings;
- fixed-star catalogue coverage.

These remain useful for term discovery but require stronger source/human/publication checks before public synthesis.

### Phase 8 — Encyclopedia-quality audit — STARTED, then corpus-wide

For every significant public term, check whether the page explains:

- what the term means;
- aliases and historical forms;
- how the concept is recognized or calculated when that is intrinsic to its definition;
- distinctions from nearby concepts;
- historical variants and disagreements;
- interpretive significance in the sources;
- related terms;
- tables/diagrams/examples where useful.

The page should explain the **concept**, not teach a full chart-reading workflow.

### Phase 9 — Frontend refinement — ITERATIVE

As term coverage grows:

- improve A–Z and category navigation;
- improve related-term navigation;
- add term-family tables and diagrams;
- add formula displays where intrinsic to a term;
- improve historical-source comparison blocks;
- verify mobile/readability behavior;
- keep SQLite as the source of truth.

### Phase 10 — Wider corpus expansion — LATER / PARALLEL

Once the term-migration process is stable:

- inventory private lecture/course series outside the 40-lesson core;
- audit their distillations for new term coverage;
- add further historical books from the wider collection;
- use new public witnesses to strengthen, qualify or challenge canonical entries;
- preserve historical disagreement rather than flattening it.

## Current position in one line

**Initial historical corpus complete -> private core distillation complete -> reuse audit complete -> foundational term families substantially mapped -> corpus-wide lesson-to-term sweep now active.**

## Current milestone

Finish the A-class lesson-to-term sweep and produce a canonical inventory of missing, enriched and source-blocked lexicon entries without importing analysis workflows into the public encyclopedia.
