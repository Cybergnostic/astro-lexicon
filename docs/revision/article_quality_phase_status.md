# Encyclopedia-quality phase status

Status: **active**

The core 40-lesson curriculum discovery stage is closed. The current phase improves the public lexicon as a reader-facing reference work while continuing targeted public-source corroboration.

## Current editorial goals

1. Give calculated lots explicit formulas when a reliable source formula is known.
2. Preserve day/night reversals and author-specific formula variants rather than flattening them.
3. Upgrade important reviewed terms from concise canonical definitions into teaching-quality articles.
4. Prefer direct historical witnesses for mechanics, recognition rules and thresholds.
5. Keep source-specific numerical rules labelled as source-specific.
6. Maintain distinctions between related concepts instead of collapsing them for convenience.
7. Continue excluding private lecture workflows and chart-analysis recipes from public doctrine.

## Automated coverage reports

`npm run audit:corpus` now includes two non-blocking editorial reports in addition to the blocking integrity checks:

- `db/audit/lot_formula_coverage.sql` — reviewed lot entries without a visible formula section;
- `db/audit/article_quality_coverage.sql` — reviewed terms that lack an article or have too little explanatory structure.

These reports are editorial queues, not publication blockers. Umbrella/disambiguation terms can legitimately lack a single formula, and some specialized terms can legitimately need shorter articles than foundational concepts.

## Reader-facing quality work completed in this phase

### Lots

Formula display conventions were standardized. Foundational formula coverage has been added or clarified for the Lot of Fortune, Lot of Absence and Lot of the Haylāǧ, while numerous Abū Maʿshar and Bonatti topic lots already expose source-specific formulas from the corroboration passes.

### Aspect mechanics

Application and Separation now have source-backed teaching articles anchored to Abū Maʿshar, with explicit explanation of motion toward perfection, exact contact, post-perfection separation and the difference between separation and simple distance.

### Solar conditions

Combustion, Under the Beams and Cazimi now have source-backed teaching articles anchored to William Lilly. Lilly’s 8°30′ combustion, 17° under-beams and 17′ cazimi thresholds are recorded explicitly as **Lilly’s thresholds**, not universal constants.

### Sect family

Sect, Halb and Hayz now explain their hierarchy and distinctions: broad day/night context, horizon conformity and the fuller compound conformity represented by hayz.

### Motion family

Direct motion, retrogradation and station now explain how direction, speed and turning points differ, including the distinction between the two stations.

### House-strength family

Cardine/Angle, Succedent Place and Cadent Place now explain the comparative accidental-strength hierarchy while keeping strength separate from topical house importance and from essential quality.

## Existing strong pages that did not need rewriting

The audit pass confirmed that several foundational pages were already mature enough to leave alone, including:

- Essential Dignity;
- Reception;
- Primary Qualities;
- Sign Modality;
- Planetary Gender;
- Aspect;
- Accidental Fortitude;
- Triplicity Rulers;
- Almuten;
- Almuten of the Figure.

The project should avoid rewriting mature articles merely to increase section counts.

## Next queue

The next pass should be driven by the article-quality and lot-formula coverage reports after a fresh local SQLite build. Likely high-value families include:

- remaining one-section planetary-condition terms;
- individual essential dignities where the canonical term exists but the public article is thin;
- planetary phase/orientality terminology;
- fixed-star mechanics and orb/projection terms;
- predictive-technique pages that currently define the technique but do not yet explain its formal vocabulary clearly;
- remaining lot entries identified by the formula audit.

This phase is iterative. The goal is not equal article length for every term; it is enough explanation for a reader to understand the concept, distinguish it from nearby concepts, and see where important historical variants belong.
