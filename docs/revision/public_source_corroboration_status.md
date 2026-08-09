# Public-source corroboration status

Status: **active; first provisional queue substantially resolved**

This ledger follows the completed 40-lesson curriculum term-discovery stage. It tracks whether curriculum-discovered terms have been promoted into source-grounded lexicon identities, retained as editorial umbrellas, or left for later source onboarding.

The governing rule remains: the project is a **term encyclopedia**, not a chart-analysis workflow manual.

## Resolved from the existing historical corpus

The first five historical works already contained enough evidence to resolve or materially upgrade many items that the curriculum had only surfaced as provisional vocabulary.

### Lots

Resolved or source-structured in the current corroboration pass include:

- Lot / Part of Substance — direct Bonatti witness;
- Lot of High Rank — Abū Maʿshar;
- distinct Abū Maʿshar authority lots rather than one flattened Authority formula;
- Lot of Honour;
- Lot of the Well-Known and Honoured;
- Lot of the Praised and Commended;
- Lot of Success;
- family lots for brothers/siblings, number of brothers, father, mother and children;
- separate marriage lots attributed by Abū Maʿshar to Hermes and Wālīs/Valens;
- Lot of the Journey and Lot of Travel on Water;
- Lot of Piety;
- Lot of Knowledge and Understanding;
- Lot of Intelligence and Depth of Thought;
- Lot of Friends;
- distinct enemy lots according to the Ancients and Hermes;
- Lot of Captives and Bondage;
- Lot of Death;
- Abū Maʿshar’s planetary lots of Heavy Saturn, Jupiter, Mars, Venus and Mercury;
- Lot of Fortune;
- Lot of Absence;
- Lot of the Haylāǧ.

Where historical names or formulas diverge, the lexicon keeps separate source identities rather than merging by topic alone.

## Formula policy now implemented

Calculated-lot entries should normally expose an explicit article section whose `section_key` contains `formula`.

Formula notation uses the convention:

`Asc + B - A`

meaning: measure the zodiacal arc from A to B and project that arc from the Ascendant.

Rules:

- day/night reversals are shown explicitly;
- same-direction day/night formulas are stated explicitly;
- source-specific substitutions or exceptional factors are preserved;
- competing author variants remain separate;
- umbrella/disambiguation pages are allowed to have no single formula;
- formula presence is now reported by `db/audit/lot_formula_coverage.sql` through the normal corpus audit.

The foundational formula backfill currently includes explicit standardized formula sections for Fortune, Absence and the Lot of the Haylāǧ in addition to the many topical lots already given formulas during corroboration.

## Resolved non-lot terminology

### Commanding / obedient signs

The provisional `commanding-sign` question is resolved against al-Bīrūnī’s discussion of commanding/obedient and ascensional relations. Editorial material in Wright’s edition is kept distinct from al-Bīrūnī’s own wording.

### Significator of Manners

The private-course ruler-of-behavior/ruler-of-manners label is now crosswalked to William Lilly’s directly attested **Significator of Manners**. Lilly-specific recognition criteria are described as source-specific evidence rather than promoted into a universal natal workflow.

### Katarchic Astrology

`katarchic-astrology` is retained as a legitimate **modern scholarly umbrella term**, not projected backwards as though every historical astrologer used one equivalent category.

A modern scholarship source layer now records Dorian Gieseler Greenbaum’s treatment of katarchic astrology as encompassing elections, event interpretation, interrogations and decumbitures. The historical component practices remain separate canonical terms.

## Editorial umbrellas retained intentionally

Some curriculum labels remain useful for navigation but should not imply one historical formula.

Examples:

- Lot of Authority (generic umbrella);
- Lot of Fame;
- Lot of Reputation;
- Lot of Exaltation.

These guide readers toward more precise historically attested lots such as High Rank, Honour, Well-Known and Honoured, Praised and Commended, and the several authority-related lots.

## Intentionally excluded

The following remain outside public doctrine unless a future source demonstrates a genuine historical named term independent of the course method:

- Primary Motivation as a course-specific synthesis method;
- topic-analysis sequences for finances, profession, relationships, parents, friends, health, death, fertility, etc.;
- scoring/checklist procedures that are not themselves historical named concepts;
- sensitive predictive workflows for lifespan, death, diagnosis or fertility.

## Remaining source work

The initial provisional queue is no longer the main bottleneck. Remaining work is increasingly **expansion rather than rescue**:

1. run the lot-formula coverage audit and backfill source-specific calculated lots still lacking explicit formula sections;
2. add additional formula variants when new historical witnesses are encountered;
3. improve encyclopedia articles for important terms that are technically sourced but pedagogically thin;
4. onboard additional historical books to broaden author comparison and terminology coverage;
5. use targeted web/scholarly research for obscure aliases, translation problems and source discovery, then prefer direct editions for final historical claims where available;
6. improve frontend presentation as the article layer becomes richer.

## Validation note

The seed schema used by the current corroboration work was checked against the repository migrations. `works.corpus_status='partial'` is a supported lifecycle state, and the modern-scholarship source is deliberately marked partial because only the public metadata/abstract scope is being used at this stage.

A full local fresh-database audit still needs to be run in an environment with the repository checkout; the connector environment used for these edits cannot currently clone GitHub over DNS. The repository’s standard validation command remains:

```bash
npm run audit:corpus
```
