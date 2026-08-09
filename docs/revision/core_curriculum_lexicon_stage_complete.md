# Core curriculum -> lexicon discovery stage: complete

Status: **complete for the 40-lesson clean core curriculum**

This document closes the curriculum-discovery/migration stage. It does **not** mean that every private file or every astrology book in the wider archive has been processed. It means that the already-distilled 40-lesson core curriculum has now been systematically used as a term-discovery and coverage map for the public lexicon.

## Scope of this stage

The objective was to build a **term encyclopedia/lexicon**, not a chart-analysis manual.

The curriculum was therefore used to identify and clarify:

- named technical terms;
- historical classifications and taxonomies;
- named lots and calculated points;
- named predictive techniques and their formal sub-terms;
- dignity, aspect, motion, sect and solar-condition vocabulary;
- basic astronomical and zodiacal terminology;
- aliases, translation variants and related-term structure;
- concepts that deserve a standalone encyclopedia identity even when their historical evidence still needs expansion.

The following were explicitly excluded from public migration unless they are independently established historical terms in their own right:

- lecturer-specific analytical sequences;
- topic checklists (for example, which factors to inspect for finances, profession or marriage);
- scoring recipes and synthesis workflows;
- proprietary or course-specific methods;
- worked-chart procedures whose value is procedural rather than lexical;
- sensitive predictive instructions for disease, lifespan, death or fertility.

## Input corpus status

The clean core curriculum contains 40 lessons.

- NA06 Temperament completed the stricter Terra -> Sol benchmark review.
- The remaining 39 legacy structured distillations were audited for reuse as **31 A / 8 B / 0 C**.
- No lesson required wholesale raw re-extraction for this lexicon-discovery stage.
- All 40 lessons have now been considered from the **term-discovery** perspective rather than treated as chapters to reproduce publicly.

## Main lexicon areas surfaced or enriched

The stage materially expanded or enriched the canonical vocabulary around:

- zodiac types, primary qualities, elements and sign modality;
- sign classifications including human/quadruped, voice, fecundity/barrenness and ascensional classes;
- the seven traditional planets and their classifications;
- essential and accidental dignity terminology;
- aspect, application/separation, orb and dexter/sinister terminology;
- sect, hayz, halb, orientality/occidentality and motion;
- reception, triplicity rulership, almuten and Almuten of the Figure;
- temperament and related constitutional vocabulary;
- lots, including numerous topic-specific lots whose formulas can be expanded later;
- firdaria, Ptolemaic ages, profections, primary directions, distributions, returns and divisions;
- hyleg/apheta, alcochoden, anareta and hylegical-place terminology;
- medical-astrology labels such as decumbiture, kept historical/descriptive rather than diagnostic;
- fixed-star taxonomy, magnitude, planetary nature, star clusters and projected contact vocabulary;
- eclipse, occultation, eclipse types, Saros and eclipse-path vocabulary;
- foundational branches and chart types such as natal, horary, electional, mundane, predictive and revolution charts.

## Reconciliation result

A final duplicate audit found several late-pass labels that overlapped with stronger canonical identities already created from public historical evidence.

Seed `0085_core_curriculum_reconciliation.sql` normalizes those labels instead of keeping parallel terms. Examples include:

- `quadrupedal-sign` -> canonical `quadruped-sign`;
- `fertile-sign` -> canonical `fecund-sign`;
- `sign-of-long-ascension` -> canonical `straight-rising-signs`;
- `sign-of-short-ascension` -> canonical `crooked-rising-signs`;
- `obeying-sign` -> canonical `obedient-signs`;
- generic vocal/semi-vocal/silent/mute labels -> the existing historically sourced powerful/half/weak/voiceless taxonomy.

Useful alternate labels were preserved as aliases before the duplicate identities were removed.

## Provisional / source-needed queue

The following are valid lexicon candidates or already-provisional identities, but need stronger public historical corroboration or source-specific expansion before they should be treated as mature articles:

### Lots

Several lots now have basic identities and, where safely preserved, formulas. Formula transmission is often variant and should not be flattened. Priority examples include:

- Lot / Part of Substance (`Pars Substantiae`);
- Lot of Reputation;
- Lot of Rank;
- Lot of Authority;
- Lot of Exaltation;
- Lot of Success;
- Lot of Fame;
- Lot of Death;
- relationship, parent, sibling, travel, knowledge, faith and offspring lots where multiple historical formulas may exist.

The next source pass should attach named authors, formula variants and precise witnesses rather than assuming one universal formula.

### Terminological scope

- `commanding-sign` remains provisional pending direct historical-source reconciliation with the already-sourced obedient/ascensional taxonomy.
- `katarchic-astrology` remains provisional because its scholarly/historical scope varies by context.
- ruler-of-manners / ruler-of-behavior terminology should be onboarded when the relevant public historical source is added rather than copied from the private course.
- course-specific Primary Motivation methodology remains outside public doctrine unless independently corroborated as a historical named method.

### Sensitive historical terms

Hyleg, alcochoden, anareta, decumbiture, medical/fertility/death lots and related vocabulary may exist as historical lexicon entries, but detailed predictive procedures remain deliberately outside this migration stage. Any later article expansion should clearly distinguish historical doctrine from modern medical or factual claims.

## Next phase

The next phase is **public-source corroboration + encyclopedia-quality expansion**, not another pass through the same 40 lessons.

Recommended order:

1. run targeted public historical/web research for provisional terms, obscure lots, aliases and formula variants;
2. prefer primary or scholarly historical sources for canonical evidence;
3. attach new sources through the existing edition-aware source-onboarding workflow;
4. reconcile remaining provisional identities and historical disagreements;
5. audit important term pages for teaching quality: clear explanation, distinctions, examples, variants, related terms and diagrams/tables where useful;
6. improve the frontend presentation as richer articles accumulate;
7. separately inventory the wider private corpus outside the 40-lesson core and future historical books when ready.

## Stage boundary

This stage is considered closed unless a later audit demonstrates a concrete missed term from the 40-lesson clean curriculum.

Future work should not restart wholesale lecture extraction. The curriculum remains available as a private coverage map while the public lexicon grows through source corroboration, canonical normalization and article-quality editorial work.
