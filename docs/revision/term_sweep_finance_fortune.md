# Term Sweep — Fortune / Finances

Status date: 2026-08-09

## Scope rule

This is a **term-enrichment sweep**, not a chart-analysis extraction.

The source distillations `natalna_11_sreca_i_nesreca__distilled.yaml` and `natalna_12_finansije__distilled.yaml` are used only to identify named concepts, technical distinctions, historical terminology and missing lexicon coverage.

Analysis sequences, factor checklists, priority order and synthesis recipes are excluded from public migration.

## Public canonical terms enriched now

### Lot

Already historically supported in the canonical corpus. The finance/fortune material confirms that the concept is pedagogically central enough to deserve a fuller article.

Article now explains:

- formal three-part structure;
- families of lots;
- Lot / Part terminology distinction.

### Lot Extraction

Already historically supported. Retained because calculation is intrinsic to the definition of the term itself, not because it is part of a finance workflow.

Article now explains:

- directional interval;
- projection from a movable point;
- formula-specific reversal and projection rules.

### Natural / Immovable Significators of a Lot

Already supported cross-source by Abū Maʿshar and Bonatti.

Article now distinguishes:

- the two natural/immovable significators that define the interval;
- the movable significator from which the interval is projected.

### General Indicators of a Lot

Already supported in Abū Maʿshar.

Article now distinguishes interpretive indicators from the components that construct the lot.

### Lot of Fortune / Part of Fortune

Already strongly supported in the historical corpus.

Article now explains:

- its status as a luminary lot;
- the day/night reversal preserved by Abū Maʿshar;
- Part of Fortune as a translation variant rather than a separate canonical point.

Seed: `db/seed/0074_lots_teaching_article_batch.sql`.

## Candidate term requiring public-source confirmation

### Lot / Part of Substance (`Tačka supstancije`)

The private finance distillation contains a clearly named calculated point and formula, so it is a legitimate **lexicon candidate**, not merely workflow prose.

However, it is not currently established in the initial public historical corpus. Do not create a reviewed public term from the private course alone.

Action:

- preserve as `source-blocked candidate`;
- search future/public historical sources for `pars substantiae`, `part of substance`, `lot of substance`, or equivalent historical terminology;
- if corroborated, add as a canonical lot with author-specific formula variants;
- if not corroborated, leave it outside the public lexicon.

## Explicitly excluded as workflow, not terms

The following private-course records are not encyclopedia entries merely because they are structured records:

- finance-analysis checklist;
- financial almuten recipe;
- priority of II-house factors;
- three-period financial analysis through triplicity rulers;
- complete prosperity judgment checklist;
- financial-loss judgment checklist;
- moderate-life judgment checklist;
- rise-from-poverty judgment checklist;
- persistent-misfortune judgment checklist;
- finance synthesis rule.

Historical procedures quoted or summarized from named authors may still help identify **named terms inside them**, but the entire procedure is not promoted as an encyclopedia page.

## Existing terms touched but not duplicated

- Jupiter — already has wealth among its historical significations; no separate `Jupiter as wealth significator` term needed.
- Fixed Stars — existing canonical family; finance-specific effects belong in source interpretations, not a new term.
- Triplicity Rulers — existing canonical term; their use in wealth judgments is an application of the term, not a new lexicon concept.
- Sect Light / Light of the Time — evaluate as a possible canonical terminology item independently; do not create it simply from the finance workflow.

## Outcome

The two finance/fortune lessons contribute **five immediate article enrichments and one source-blocked candidate term**, while most of their remaining structured records are correctly excluded as analysis workflow.
