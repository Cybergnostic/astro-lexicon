# Bird's-eye encyclopedia review

## Purpose

This pass reviews the project from outside the database: as a reader, editor, historian and astrologer encountering the encyclopedia as a whole.

Earlier passes asked whether a term existed, whether its canonical definition was defensible, whether evidence was attached, and whether an article had enough blocks. Those questions remain necessary, but they do not guarantee that the encyclopedia teaches a subject coherently.

The central question of this pass is:

> If a reader knew little or nothing about this subject and opened this entry or this family of entries, would the system actually make sense?

The review therefore evaluates five dimensions together:

1. **Definition** — is the lead definition clear, concrete and technically correct?
2. **Explanation** — does the page explain what the concept is doing, not merely restate a category label?
3. **Reference data** — are inherently structured facts modeled and visible as tables/data rather than buried in prose?
4. **Connections** — can the reader move naturally to prerequisites, components, opposites, variants and applications?
5. **Presentation** — would a table, diagram, glyph, timeline or comparison make the concept easier to understand?

## Research method

The public web is used aggressively as an editorial discovery layer, not as authority by popularity.

For important entries, compare several kinds of material when available:

- general encyclopedic presentation;
- astronomy/science references for physical and observational mechanics;
- scholarship on the history of astrology;
- strong traditional-astrology reference sites;
- primary historical texts already in the corpus or newly onboarded public sources.

The purpose of comparison is to discover what questions a good entry ought to answer, what distinctions or visuals may be missing, and where historical variants require separate treatment. Public article prose remains original synthesis. Historical claims remain source-attributed.

Private lecture material may still be used as a coverage/editorial checklist. It is not a public textual source and must not be reproduced as proprietary wording or as a private analysis workflow.

## Family-level review

Do not inspect only one page at a time. For every major family, define what a complete member page should contain and then check the entire family against that model.

### Planets

Every traditional planet page should eventually expose, where relevant:

- glyph / symbol;
- astronomical and traditional identity;
- primary qualities and sect;
- benefic/malefic classification where applicable;
- domicile, exaltation and debility relationships;
- triplicity, term and face participation by named scheme;
- solar/synodic phase cycle;
- direct/station/retrograde relationship to that cycle;
- oriental/occidental or morning/evening phase terminology;
- related planetary lot(s), planetary hour/day and other established correspondences where source-backed;
- historical source variants;
- useful diagrams or timelines.

### Signs

Every sign page should eventually expose:

- glyph;
- exact position in the equal-sign zodiac;
- modality, element/triplicity, gender/sect classification and other reviewed sign taxonomies;
- explicit distinction between equal astrological sign and modern astronomical constellation;
- domicile ruler;
- exaltation/fall where applicable, including degree numbers by named scheme;
- day/night triplicity rulers by named scheme;
- complete terms/bounds and faces/decans;
- related equal-ascension / commanding-obedient / hearing-seeing relations where historically relevant;
- source differences rather than flattened modern keyword lists.

### Essential dignity

The system overview must show the whole system at once:

- domicile;
- exaltation and exaltation degrees;
- triplicity by sect and source scheme;
- complete term/bound degree ranges;
- complete face/decan ranges;
- detriment/exile;
- fall and fall degrees;
- explicit distinction between a scheme and the universal normalized concept;
- links from every planet/sign cell to the corresponding entry.

### Astronomical mechanics

Review celestial sphere, ecliptic/equator, coordinates, primary/secondary motion, planetary motion, solar phase, visibility, nodes, eclipses and fixed-star geometry as one teaching system. Add diagrams where a reader cannot reasonably form the geometry from prose alone.

### Aspects and connection mechanics

Review aspects, application/separation, orb, partile/platick, reception, translation, collection, prohibition, frustration, refrenation and abscission as one coherent mechanics family. The reader should be able to distinguish geometry from perfection/interference terminology.

### Houses / places

Review structural house classes and topical place meanings together. Preserve the distinction between positional strength and topical signification. Do not turn the encyclopedia into a house-judgment workflow.

### Lots

Check formula visibility, source-specific variants, aliases, historical identity, and disambiguation. Formulas remain source-bound and should never silently become universal arithmetic definitions.

### Predictive terminology

Review profections, firdaria, directions, distributions, solar/lunar revolutions, divisions and related terms from a comparative overview. Distinctions should be visible without providing an ordered forecasting recipe.

### Historical cosmology / foundational models

Review concepts such as Thema Mundi, planetary order, sect, zodiac systems and cosmological/astronomical models together. Distinguish model diagrams from literal historical event charts.

## Structured reference layer

The bird's-eye pass adds normalized domain tables where information is inherently reusable. Hand-written article tables remain useful for source comparison and exposition, but canonical repeated facts should not be duplicated across pages.

Current normalized layers:

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

`concept_families` is the generic family-level layer added during the aspect/perfection review. Pairwise `term_relations` still describe how two concepts relate; a concept family describes a larger ordered teaching system and the role each term plays inside it. This avoids hard-coding family taxonomies in the frontend and is reusable for houses, lots, predictive methods and later review blocks.

Reference schemes now include both:

- Lilly's Book I table presented according to Ptolemy;
- the Egyptian terms/bounds transmitted by Ptolemy in *Tetrabiblos* I.21.

These are separate named datasets. Neither is presented silently as simply “the terms.”

The original-language terminology layer is also separate from aliases. A historical form can preserve Greek script, transliteration, literal gloss, multiple English renderings, source/tradition scope and ambiguity notes without implying that every rendering is a canonical navigation synonym.

## Visual policy

Prefer project-owned, lightweight and accessible visual material:

- Unicode astrological glyphs for simple symbols;
- original SVG or HTML/CSS diagrams for geometry, cycles and schematic charts;
- responsive HTML/CSS tables for structured reference data;
- external historical images only when they add genuine historical value and licensing/provenance are clear.

A diagram should teach something prose or a table cannot communicate as efficiently. Do not decorate pages merely to make them look busier.

## Completed bird's-eye blocks

### Reference / dignity foundation

- normalized reference-system schema;
- complete Lilly/Ptolemaic dignity data, including term and face ranges and exaltation/fall degree numbers;
- Egyptian terms/bounds as a separate Ptolemy-transmitted historical scheme;
- explicit side-by-side named-scheme comparison for terms/bounds;
- Unicode planet and sign glyphs;
- complete Essential Dignity reference component;
- planet- and sign-centric dignity connection views;
- source-backed Thema Mundi entry from Firmicus Maternus, *Mathesis* III.1.

### Greek technical terminology

- dedicated `term_forms` layer rather than overloading aliases;
- Greek script, transliteration, literal gloss, English rendering variants and ambiguity/false-friend notes;
- initial Hellenistic technical vocabulary for planets, domicile, exaltation/fall, triplicity, sect, Ascendant, zodiac, face, station, retrograde motion and bounds;
- Ancient Greek names of the twelve zodiac signs and `ζῴδιον`;
- source-scope metadata through the HOROI philological reference layer.

### Seven traditional planets

- reader-facing definitions that separate modern physical identity from traditional classification;
- normalized `planetary_profiles` for object class, Earth-based geometry, family, sect, benefic/malefic class, attributed qualities, motion and solar-cycle family;
- astronomy/observational-geometry teaching sections;
- removal of duplicated hand-written dignity summary tables in favour of normalized reference data;
- solar synodic-cycle datasets and visual phase sequences for Moon, Mercury, Venus, Mars, Jupiter and Saturn;
- associated source-specific planetary/luminary lots linked from the planet pages;
- historical Greek planetary names/forms rendered separately from navigation aliases.

### Twelve zodiac signs

- reader-facing coordinate-first definitions for all twelve signs;
- normalized `zodiac_sign_profiles` for ordinal, 30° longitude interval, element, modality, polarity, day/night class and tropical-quarter position;
- original responsive twelve-sign position strip on each sign page;
- explicit sign-versus-modern-constellation distinction using the IAU astronomy boundary framework;
- repeated sign-classification prose replaced by normalized linked data;
- repeated dignity lists replaced by normalized scheme-aware dignity views;
- Ancient Greek sign names with transliteration and literal name glosses.

### Astronomical mechanics / visibility

- celestial sphere, ecliptic, celestial equator/equinoctial and coordinate pages reorganized as one teaching system;
- explicit distinction between ecliptic longitude, ecliptic latitude and declination;
- First Motion separated from slower planetary Second Motion, with the modern Earth-rotation explanation stated without erasing the historical framework;
- direct, station and retrograde motion rewritten as apparent geocentric longitude states rather than physical orbital reversal;
- oriental/occidental disambiguated between solar-phase usage and “in the figure” usage;
- solar orientation, traditional proximity conditions and actual naked-eye visibility separated as three different questions;
- original HTML/CSS celestial-sphere, motion-cycle and solar-relative schematics;
- eclipse, occultation and ecliptic-projection geometry connected to the coordinate system and illustrated with original schematics;
- repaired the older fixed-star-nature article seed that targeted a non-canonical slug.

Modern astronomical mechanics in this block were checked against NASA/JPL/USNO material; historical astrological thresholds and meanings remain source-attributed.

### Aspects / application / perfection

- generic `concept_families` / `concept_family_members` schema introduced and exported to the frontend;
- first normalized family: `aspect-perfection-mechanics`;
- visible hierarchy from geometry → motion phase → outcome → mediation / relational modifiers → interruption;
- aspect, application, separation and horary Perfection explicitly separated as different conceptual levels;
- Translation and Collection of Light rewritten as two different mediation geometries rather than generic “help” conditions;
- Prohibition, Lilly Frustration, Refrenation and Abscission located inside the interruption family while source-specific variants remain separate;
- reusable Concept Family frontend map now appears on every family member page;
- historical false-friend distinctions already established in earlier cross-source work remain preserved, including Lilly vs Bonatti Frustration and Antiochus vs al-Bīrūnī Intervention.

Skyscript and its historical review of denial of perfection were used only as editorial completeness checks; project claims remain grounded in the existing source corpus.

### Houses / places

- normalized `houses-places-structure` concept family;
- twelve-place framework, angles/cardines, succedents and cadents shown as one repeating structural system;
- positional strength kept explicitly separate from topical house signification;
- derived-house doctrine presented as relational recounting within the same chart, not a new set of houses;
- Antiochus’ Places for Dealings / Places without Dealings kept as a separate source-specific taxonomy rather than folded into angular/cadent strength;
- improved house-family definitions and cross-links without adding a house-judgment workflow.

## Remaining checks inside completed families

The family passes above establish the architecture, but they do not close every secondary doctrine. Before calling those families exhaustive, still check:

- planetary day/hour correspondences if source-backed and genuinely useful to the encyclopedia;
- sign-relation families such as commanding/obeying, hearing/seeing and equal-ascension relations;
- whether an additional ecliptic/season diagram would teach more than the current twelve-sign strip;
- source-specific variants that should become additional named reference schemes rather than prose notes;
- lunar nodes as standalone astronomical/historical terminology if the existing corpus supports a clean canonical identity rather than only eclipse context;
- whether historical aspect/orb schemes need their own normalized named reference systems beyond the current source-attributed prose/tables;
- individual house-topic pages only where they improve navigation and source comparison, not as a pretext to publish house-judgment recipes.

## Next review order

1. **Lots** — largely extracted and formula-rich; review the whole family as a reader, tighten formula-stream disambiguation, and use the concept-family layer where it improves navigation.
2. **Predictive terminology** — comparative overview of profections, firdaria, directions, distributions, solar/lunar revolutions and related terms without procedural forecasting workflows.
3. **Historical cosmology / foundational models** — planetary order, sect/cosmology and related model concepts beyond the already-completed Thema Mundi block.
4. **Remaining planetary/sign secondary families** — sign relations, planetary day/hour and source-specific schemes where justified.
5. **Long-tail entries and lower-priority definitions**.

At each stage, stop adding terms merely because a source mentions them. Add or expand an entry only when it improves the encyclopedia's conceptual coverage, historical accuracy, navigation or teaching quality.

## Validation

This pass is being committed remotely. Do not claim a fresh SQLite audit or Astro build until run locally. At the next validation point:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run build
```
