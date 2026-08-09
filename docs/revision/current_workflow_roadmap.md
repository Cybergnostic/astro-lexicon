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

Current workflow for each lesson:

1. read the existing structured distillation;
2. identify which records map to existing canonical lexicon terms;
3. identify genuinely missing concepts that deserve new canonical terms;
4. separate general historical/traditional doctrine from instructor-specific method;
5. Sol-check only ambiguity, attribution, contradiction, reconstruction, high-impact method variants, or sensitive content;
6. return to the raw source only when provenance or coverage actually needs verification;
7. preserve private-course provenance internally while publishing only original synthesis supported by public historical evidence where available.

Important structural rule: course chapters are not automatically encyclopedia entries. A lesson such as accidental dignities may distribute knowledge across many canonical pages (combustion, cazimi, retrogradation, sect, reception, speed, angularity, etc.).

### Phase 4 — Encyclopedia article layer — IN PROGRESS

A separate reviewed article layer now exists in SQLite:

- `term_articles`
- `term_article_sections`

The frontend generator exports reviewed article content, and term pages render it between the concise lead and historical source accounts.

Completed teaching/article migrations so far:

- Temperament / Complexion
- Primary Quality
- Sign Modality / Quadruplicity
- Planetary Gender
- Essential Dignity
- Reception
- Saturn
- Jupiter
- Mars
- Sun
- Venus
- Mercury
- Moon

The private lecture corpus is used as a pedagogy/coverage map; no private lecture wording or lecturer attribution is stored publicly.

### Phase 5 — Foundational A-class migration — CURRENT ACTIVE BATCH

Next priority cluster:

- accidental dignity / accidental condition family;
- houses and house strength;
- aspects, application/separation and reception-related mechanics;
- natal introduction and synthesis principles;
- triplicity rulers;
- primary motivation;
- Almuten Figuris;
- behavior ruler;
- quality of mind.

For this cluster, prefer enriching existing canonical pages over creating broad course-chapter pages.

### Phase 6 — Topic-specific natal and prognostic A-class migration — QUEUED

After foundations are stable:

- fortune/misfortune;
- finances;
- third/fourth/ninth house topic modules;
- friends/enemies;
- profession;
- career/fame;
- relationships/marriage;
- Ptolemaic ages and firdaria;
- primary directions;
- profections;
- solar revolutions;
- lunar returns/transits;
- divisions.

These should produce a mixture of canonical term enrichment, procedural pages and relations rather than one public page per lesson.

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
- a useful example where appropriate;
- distinctions from similar concepts;
- practical/interpretive significance;
- exceptions and historical variants;
- related prerequisite concepts;
- tables/diagrams/worked examples where they materially improve understanding.

The article layer exists specifically so `short_definition` does not have to carry all of this.

### Phase 9 — Frontend refinement — STARTED, iterative

Current term pages already render article content from the canonical database.

As migrated content grows:

- improve article navigation and hierarchy;
- add structured tables/diagrams where needed;
- improve related-concept navigation;
- expose procedural sequences cleanly;
- avoid duplicated canonical definition blocks;
- verify mobile/readability behavior;
- keep generated frontend data subordinate to SQLite as source of truth.

### Phase 10 — Wider corpus expansion — LATER / PARALLEL

Once the article model and migration process are stable:

- inventory other private lecture/course series outside the 40-lesson core;
- classify their existing distillations with the same A/B/C rule;
- add further historical books from the wider collection;
- let new public historical witnesses strengthen, qualify or challenge existing canonical articles;
- preserve author/tradition disagreement instead of flattening it.

## Current position in one line

**Initial historical corpus complete -> core lecture extraction complete at first-pass level -> reuse audit complete -> doctrine migration + encyclopedia article construction now actively underway.**

## Definition of done for the current milestone

The current milestone is complete when the high-dependency foundational A-class lessons have been mapped into canonical terms and those terms have teaching-quality article content where the lecture corpus demonstrates a real pedagogical gap.

At that point the architecture is considered validated and the same migration pattern can be applied rapidly to topic-specific natal/prognostic lessons.