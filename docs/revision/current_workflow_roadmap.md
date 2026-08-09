# Current Workflow Roadmap

Status date: 2026-08-09

## Goal

Turn the existing historical corpus plus the private structured study corpus into a source-based, teaching-quality traditional astrology encyclopedia without duplicating extraction work or publishing private lecture text.

## Where we are

### Phase 1 — Historical corpus foundation — COMPLETE for initial corpus

- Five initial historical works sequentially extracted.
- Cross-source normalization/revision completed.
- Reviewed A/B evidence linked to canonical terms.
- Fresh SQLite rebuild/audit passes.
- Canonical SQLite -> generated frontend pipeline exists.

This phase is complete for the initial five works, not for every astrology book in the wider private collection.

### Phase 2 — Clean lecture curriculum extraction — COMPLETE at first-pass level

- 40-lesson clean curriculum has structured distillations.
- NA06 Temperament received the stricter Terra/Sol benchmark treatment.
- All 177 mandatory NA06 Sol records have decisions.
- Remaining 39 legacy distillations audited for reuse quality.

Audit result excluding NA06:

- 31 A — reuse + targeted Sol review
- 8 B — reuse + targeted source/safety audit
- 0 C — default full raw re-extraction

Raw lecture re-extraction is now exception-driven rather than the default workflow.

### Phase 3 — Doctrine migration and canonical-term mapping — IN PROGRESS

For each lesson:

1. read the existing structured distillation;
2. map records to existing canonical lexicon terms;
3. add genuinely missing concepts only where justified;
4. separate general historical doctrine from instructor-specific method;
5. Sol-check ambiguity, attribution, contradiction, reconstruction, high-impact variants or sensitive content;
6. return to raw sources only when provenance or coverage needs verification;
7. publish original synthesis, not private-course wording.

Course chapters are not automatically encyclopedia entries. Knowledge is distributed across the canonical concept graph instead.

### Phase 4 — Encyclopedia article layer — IN PROGRESS

A separate reviewed article layer exists in SQLite:

- `term_articles`
- `term_article_sections`

The frontend generator exports reviewed article content and term pages render it between the concise lead and historical source accounts.

Teaching/article migration now includes:

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

The private lecture corpus remains a pedagogy/coverage map; no private lecture wording or lecturer attribution is stored publicly.

### Phase 5 — Foundational A-class migration — SUBSTANTIALLY COMPLETE

Completed or mapped:

- accidental dignity / accidental-condition family;
- house strength;
- aspect/reception mechanics;
- triplicity rulers;
- Almuten and Almuten of the Figure;
- natal mind layers through Mercury and Moon;
- natal synthesis framework as internal editorial sequencing.

Important migration decisions:

- `Primary Motivation` remains private/course-specific unless independently historically corroborated;
- `Ruler of Behavior / Manners` is preserved for migration but awaits a public historical witness outside the initial five-source corpus;
- the exact private `Quality of Mind` recipe is not published as universal doctrine, while portable Mercury/Moon doctrine is mapped into existing terms.

See `docs/revision/natal_method_migration_map.md`.

### Phase 6 — Topic-specific natal and prognostic A-class migration — CURRENT ACTIVE PHASE

Current starting cluster:

1. fortune / misfortune;
2. finances;
3. third, fourth and ninth house topic modules;
4. friends / enemies;
5. profession;
6. career / fame;
7. relationships / marriage;
8. Ptolemaic ages and firdaria;
9. primary directions;
10. profections;
11. solar revolutions;
12. lunar returns / transits;
13. divisions.

These modules should produce canonical term enrichment, procedural pages and relations rather than one public page per lesson.

Fortune/misfortune and finances are now under active migration review.

### Phase 7 — B-class sensitive/compressed lessons — QUEUED WITH GATES

- physical appearance;
- Hyleg/Alcocoden and lifespan material;
- medical astrology;
- accidents/death;
- offspring/fertility;
- worked exercises;
- sensitive house meanings;
- fixed-star catalogue coverage.

These distillations remain reusable but require explicit source, human or publication-safety gates before public synthesis.

### Phase 8 — Encyclopedia-quality audit — STARTED, then corpus-wide

For every significant public term, check whether the page actually teaches:

- what the concept is;
- how it works;
- how it is recognized/calculated;
- examples where useful;
- distinctions from similar concepts;
- practical/interpretive significance;
- exceptions and historical variants;
- related prerequisite concepts;
- tables/diagrams/worked examples where they materially improve understanding.

### Phase 9 — Frontend refinement — STARTED, iterative

As migrated content grows:

- improve article navigation and hierarchy;
- add structured tables/diagrams where needed;
- improve related-concept navigation;
- expose procedural sequences cleanly;
- verify mobile/readability behavior;
- keep SQLite as the source of truth.

### Phase 10 — Wider corpus expansion — LATER / PARALLEL

Once the migration process is stable:

- inventory private lecture/course series outside the 40-lesson core;
- classify their distillations with the same A/B/C rule;
- add further historical books from the wider collection;
- let new public witnesses strengthen, qualify or challenge existing articles;
- preserve historical disagreement rather than flattening it.

## Current position in one line

**Initial historical corpus complete -> core lecture extraction complete -> reuse audit complete -> foundational migration substantially complete -> topic-specific natal/prognostic migration now active.**

## Current milestone

Complete the A-class topic-specific natal/prognostic migration while preserving the distinction between historically sourced public doctrine, editorial synthesis, and private/course-specific procedures.
