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
- modality, element/triplicity, gender/sect classification and other reviewed sign taxonomies;
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

The first implemented scheme is Lilly's Book I table of essential dignities according to Ptolemy. It supplies one canonical dataset to the Essential Dignity overview and the corresponding planet/sign pages.

## Visual policy

Prefer project-owned, lightweight and accessible visual material:

- Unicode astrological glyphs for simple symbols;
- original SVG diagrams for geometry, cycles and schematic charts;
- responsive HTML/CSS tables for structured reference data;
- external historical images only when they add genuine historical value and licensing/provenance are clear.

A diagram should teach something prose or a table cannot communicate as efficiently. Do not decorate pages merely to make them look busier.

## Current first block

Implemented at the start of this pass:

- normalized reference-system schema;
- complete Lilly/Ptolemaic dignity data, including term and face ranges and exaltation/fall degree numbers;
- Unicode planet and sign glyphs;
- generator export of symbols, media, dignity assignments, reference schemes and cycles;
- complete Essential Dignity reference component;
- planet- and sign-centric dignity connection views;
- source-backed Thema Mundi entry from Firmicus Maternus, *Mathesis* III.1;
- solar synodic-cycle datasets and visual phase sequences for Moon, Mercury, Venus, Mars, Jupiter and Saturn.

## Next review order

1. **Planets as a complete family** — re-read every planet page from a distance; improve definitions, article architecture and cross-links using astronomy + historical sources + strong reference-site comparisons.
2. **Signs as a complete family** — same treatment, now with normalized dignity data available.
3. **Essential dignity family** — reconcile other historical term/bound and triplicity schemes rather than presenting Lilly as universal.
4. **Astronomical mechanics / visibility / synodic terminology** — add missing standalone concepts and original diagrams where useful.
5. **Aspects and horary mechanics**.
6. **Houses / places**.
7. **Lots**.
8. **Predictive terminology**.
9. **Long-tail entries and lower-priority definitions**.

At each stage, stop adding terms merely because a source mentions them. Add or expand an entry only when it improves the encyclopedia's conceptual coverage, historical accuracy, navigation or teaching quality.

## Validation

This pass is being committed remotely. Do not claim a fresh SQLite audit or Astro build until run locally. At the next validation point:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run build
```
