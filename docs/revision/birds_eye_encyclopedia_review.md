# Bird's-eye encyclopedia review

## Status

**Major-family bird's-eye review complete on remote `main` as of 2026-08-10.**

This phase reviewed the lexicon as a reader-facing encyclopedia rather than as a collection of isolated sourced terms. The goal was to make the major traditional-astrology families teach coherent systems while preserving historical differences, source identities and the boundary between an encyclopedia and an analysis manual.

The phase is complete at the architectural/editorial level. It does **not** mean that the encyclopedia can never gain another source, historical variant or lower-priority entry. Remaining research questions are now bounded follow-up work rather than blockers for this review.

## Review standard

Every major family was checked across five dimensions:

1. **Definition** — the lead should immediately explain what the concept is.
2. **Explanation** — the page should teach mechanism or structure rather than repeat an ontology label.
3. **Reference data** — reusable degree ranges, formulas, phases, sequences and pairings should live in normalized SQLite data.
4. **Connections** — related concepts should form navigable systems rather than isolated pages.
5. **Presentation** — diagrams, tables, glyphs and comparisons should be used where they materially improve understanding.

Public web material was used as editorial discovery and verification support. Historical claims remain source-attributed, and private lecture material remains an editorial/coverage layer rather than public copyrighted prose or a proprietary workflow source.

## Canonical structured layers added or consolidated

The current normalized reference/domain architecture includes:

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

`concept_families` is the generic reader-navigation layer for larger doctrinal systems. Pairwise `term_relations` still describe relationships between two concepts; a concept family explains how several entries function together.

## Completed major-family blocks

### Essential dignity and historical reference schemes

- complete Lilly/Ptolemaic dignity reference data;
- domicile, detriment, exaltation/fall and exact exaltation/fall degrees where supplied;
- sect-dependent triplicity rulers in the represented Lilly scheme;
- complete term/bound and face/decan ranges;
- Egyptian terms/bounds transmitted by Ptolemy as a separate named historical scheme;
- explicit side-by-side terms/bounds comparison rather than an unlabeled universal table;
- planet- and sign-centric dignity views driven from the same canonical rows.

### Historical/original-language terminology

- dedicated `term_forms` architecture rather than overloading aliases;
- Greek script, transliteration, gloss, English renderings, ambiguity notes and source/tradition scope;
- initial Hellenistic vocabulary for the seven planets, twelve signs and major technical terms;
- false friends and translation ambiguity kept visible.

### Seven traditional planets

- consistent reader-facing definitions;
- normalized modern astronomical identity separated from traditional classification;
- family, sect, benefic/malefic class, attributed qualities and motion profile;
- dignity participation from normalized schemes;
- solar/synodic cycle data and visual phase sequences;
- direct/station/retrograde relationships where applicable;
- Greek historical forms;
- source-specific planetary/luminary Lot links;
- planetary day/hour reference sequences now visible from the same planet pages.

### Twelve zodiac signs

- coordinate-first definitions and exact 30° intervals;
- normalized element, modality, polarity, day/night class and tropical-quarter position;
- explicit sign-versus-modern-constellation distinction;
- responsive twelve-sign position strip;
- Greek historical sign forms;
- normalized dignity relationships;
- normalized source-labelled sign-to-sign relation schemes where applicable.

### Astronomical mechanics and visibility

- celestial sphere, horizon, meridian, ecliptic and equinoctial/equator organized as one teaching system;
- longitude, latitude and declination clearly separated;
- First Motion versus planetary Second Motion;
- direct, station and retrograde described as apparent geocentric longitude states;
- oriental/occidental disambiguated by context;
- solar orientation, solar-proximity conditions and actual visibility separated;
- source-backed combustion / under-the-beams / cazimi thresholds kept author-specific;
- eclipse, occultation and ecliptic-projection geometry connected to the coordinate system;
- original lightweight celestial-sphere, motion, solar-relative and eclipse visuals.

Modern physical/observational mechanics were checked against reliable astronomy references; historical astrological meanings remain source-attributed.

### Aspects, application and perfection

- normalized `aspect-perfection-mechanics` family;
- geometry separated from application/separation;
- horary Perfection separated from merely exact aspect;
- Translation and Collection of Light treated as distinct mediation structures;
- Prohibition, Lilly Frustration, Refrenation and Abscission located in an interruption layer;
- source-specific false friends remain separate, including Lilly versus Bonatti Frustration;
- reusable Concept Family frontend map added.

### Houses / places

- normalized `houses-places-structure` family;
- twelve-place framework, angles/cardines, succedents and cadents shown as one repeating structural system;
- positional strength explicitly separated from topical signification;
- derived houses explained as relational recounting in the same figure;
- Antiochus’ Places for/without Dealings kept as a separate source-specific taxonomy;
- no house-judgment workflow imported.

### Lots / Parts

- normalized `lot-mechanics` family;
- construction, historical identity, equivalence and interpretation separated;
- separate Abū Maʿshar planetary-Lot family;
- formula-stream disambiguation retained by source;
- repeated English names do not establish identity without formula/source agreement;
- source-sensitive Fortune/Spirit/other Lot distinctions preserved;
- original directed-arc construction schematic added with generic formula origin rather than assuming every Lot begins from one universal point.

### Predictive terminology

- duplicate canonical entries repaired: later `firdaria`, `solar-return` and `lord-of-the-year` duplicates were merged back into the already source-backed canonical entries;
- Ptolemy’s seven Ages of Life directly verified against *Tetrabiblos* IV.10;
- normalized `time-lord-chronology`, `directions-distributions` and `revolutions-returns` families;
- profection, Firdaria, Lilly’s Alfridary, primary directions, distributions and return charts shown as different timing mechanisms rather than interchangeable techniques;
- formal roles such as promissor, significator, distributor and participator remain distinct;
- `solar-direction` and `divisions` remain visibly source-audit-open rather than being promoted as historically settled from private curriculum material alone.

### Historical cosmology / foundational models

- source-backed Traditional Planetary Order added from Ptolemy’s geocentric sphere model;
- Earth-outward Moon → Mercury → Venus → Sun → Mars → Jupiter → Saturn order distinguished from temporal planetary-hour ordering;
- Thema Mundi retained as a model chart rather than a literal historical event chart;
- misleading wording that treated the Thema Mundi domicile sequence as the same as the physical/geocentric sphere order was corrected;
- Ptolemy I.17 added directly to domicile-system explanation;
- original data-driven planetary-order visual added.

### Planetary days and hours

- source-backed Planetary Day entry added from Lilly;
- planetary hour, planetary day and Lord of the Hour organized as one family;
- named Lilly hour-cycle and weekday-ruler sequences normalized in SQLite;
- hour cycle and weekday order shown together in a frontend teaching visual;
- temporal order explicitly distinguished from geocentric planetary sphere order.

### Sign relational geometry

- source-backed Ptolemy commanding/obeying and beholding/equal-power relations normalized as sign-to-sign schemes;
- Robbins’ explicit sign-level pair notes used to prevent false degree-axis extrapolation;
- commanding/obeying pairs: Taurus–Pisces, Gemini–Aquarius, Cancer–Capricorn, Leo–Sagittarius, Virgo–Scorpio; Aries/Libra unpaired in this scheme;
- beholding/equal-power pairs: Gemini–Leo, Taurus–Virgo, Aries–Libra, Pisces–Scorpio, Aquarius–Sagittarius; Cancer/Capricorn unpaired;
- relation tables render on both concept pages and relevant sign pages;
- beholding/equal-power kept distinct from ordinary aspect and from later antiscion pair tables.

## Reader-facing components added during the phase

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

The components are driven by canonical generated data wherever the same doctrine needs to appear on multiple pages.

## Remaining bounded research questions

These are **not bird's-eye blockers**. They are future source-expansion or long-tail tasks:

- direct historical provenance for `solar-direction` and `divisions`;
- premodern provenance of the modern-traditional Part/Lot of Divorce formula currently recorded only cautiously;
- additional named triplicity, bounds/terms or orb schemes when a specific historical witness warrants them;
- further original-language terminology only where it improves historical disambiguation;
- dedicated lunar-node historical terminology if the source corpus supports a stronger standalone article;
- lower-priority thin entries, reviewed family-by-family rather than through a generic missing-term sweep;
- new books and submitted sources should enter through the established source-onboarding/extraction/reconciliation workflow instead of reopening this review globally.

No additional diagram is required merely for decoration. Future visuals should be added only when they solve a genuine explanatory problem.

## Phase boundary

The next substantial project work should now be one of three things:

1. **validation/fixes** from a fresh local corpus audit and Astro build;
2. **new-source ingestion** through the existing scalable extraction/reconciliation workflow;
3. **bounded source research** on one of the unresolved items above.

Do not restart a general “find missing terms” or “review every page again” pass unless a later corpus expansion gives a concrete reason.

## Validation

All latest bird's-eye commits were made remotely through GitHub in this session. A fresh local SQLite audit and Astro build have **not** been run here.

After pulling `main`, the canonical validation gate is:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run build
```

Only after those commands pass should this remote phase be described as locally validated.
