# Encyclopedia-quality checkpoint — 2026-08-09

## Status

The first large **public-source corroboration + encyclopedia-quality conversion** pass has reached checkpoint.

This does **not** mean the lexicon is complete. It means the systematic conversion of the current core corpus has reached diminishing returns: most remaining work is now targeted source expansion, lower-priority article refinement, frontend presentation, or new-book onboarding rather than another full pass over the same private curriculum.

## Scope preserved

This project is a **term encyclopedia / lexicon**, not a chart-analysis manual.

Included:

- named terms and technical concepts;
- historical terminology and aliases;
- taxonomies and classifications;
- named astrological conditions;
- historically established named techniques;
- source variants and disagreements;
- semantic relations;
- calculated lots and source-specific formulas;
- enough procedure to define a named concept.

Excluded by default:

- ordered chart-analysis workflows;
- topic judgment recipes;
- factor checklists;
- lecturer-specific scoring systems;
- course-specific sequencing methods;
- private copyrighted expression.

The private lecture corpus remains an editorial/coverage map. Public prose is original synthesis and public historical claims are grounded in public/historical witnesses where possible.

## Major work completed in this pass

### Encyclopedia conversion

Large article families converted or substantially expanded:

- twelve zodiac signs;
- seven traditional planets;
- major aspects;
- zodiac framework and sign classifications;
- qualities and elements;
- dignities/debilities and planetary condition;
- sect, hayz, halb and motion/solar conditions;
- houses/places and house-strength structure;
- secondary aspect geometry;
- ascensional/sign-pair relations;
- predictive terminology;
- specialized historical terms;
- fixed stars and eclipse taxonomy;
- astronomy foundations;
- astrology branch/chart-type taxonomy;
- core, family, marriage, authority/rank, planetary, social and topic lots.

### Structured article presentation

`term_article_tables` is now a first-class article block and is exported/rendered by the frontend.

Tables are used selectively for information that is inherently structured, including:

- essential dignities/debilities;
- planet condition summaries;
- sign classifications;
- house strength;
- formula variants;
- planetary/source lots;
- predictive technique roles;
- sect and motion distinctions;
- solar-condition thresholds;
- reception/aspect mechanics;
- source-specific triplicity rulers.

### Canonical/source reconciliation

Resolved or materially improved during the pass:

- Bonatti Lot of Substance;
- Abū Maʿshar authority/rank/honour lots;
- family and marriage lots;
- topic lots;
- planetary lots;
- Courage / Victory / Necessity streams;
- Eros formula traditions;
- Prenatal Syzygy;
- Lord of the Geniture;
- Hyleg / Apheta / Hylegical Place / Alcochoden / Anareta terminology;
- Lilly Significator of Manners;
- al-Bīrūnī commanding/obedient signs;
- Katarchic Astrology as modern scholarly umbrella terminology.

### Connective vocabulary added

The pass also filled high-use concepts that were previously implicit inside longer articles:

- Dispositor;
- Translation of Light;
- Collection of Light;
- Prohibition;
- Frustration;
- Refrenation / Refranation;
- Abscission of Light;
- Perfection;
- Querent;
- Quesited;
- Significator;
- Cosignificator / Consignificator;
- Radicality;
- Planetary Hour;
- Lord of the Hour;
- Testimony;
- Fortitude;
- Debility;
- Natural Significator;
- Accidental Signification;
- Radix / Root of the Nativity;
- Interrogation.

### Important distinctions now explicit

- peregrine means lacking **one's own** essential dignity at the position; another planet's term/face does not remove peregrinity;
- Radix is not Radicality;
- a perfect/exact aspect is not the same thing as horary Perfection;
- Significator is a broad concept, not only its primary-direction use;
- Dispositor is not Reception;
- Partile/Platick are not identical to application/separation;
- Eros is not automatically Abū Maʿshar's Venus planetary Lot of Love and Intimacy;
- similarly translated Courage/Victory/Necessity lots are not merged merely by English resemblance;
- source-specific numerical thresholds and formula tables are not silently universalized.

## Final P0/P1 cleanup

The last deliberately deferred strong gap was **Triplicity Rulers**.

Seed `0151_lilly_triplicity_rulers_reference.sql` binds a source-specific reference table to Lilly:

| Triplicity | Signs | Day ruler | Night ruler |
|---|---|---|---|
| Fire | Aries, Leo, Sagittarius | Sun | Jupiter |
| Earth | Taurus, Virgo, Capricorn | Venus | Moon |
| Air | Gemini, Libra, Aquarius | Saturn | Mercury |
| Water | Cancer, Scorpio, Pisces | Mars | Mars |

This is explicitly labeled **Lilly's scheme**, not a universal table for all historical traditions.

At this checkpoint there is no known remaining **systematic P0/P1 family** from the current core pass that warrants another broad conversion sweep before moving forward. Lower-priority thin articles should continue to be surfaced by `db/audit/article_quality_coverage.sql` as the corpus grows.

## Known unresolved items

These are research tasks, not reasons to reopen the entire pass:

1. **Lot / Part of Divorce**
   - modern traditional formula witness found;
   - suitable premodern witness for the normalized historical identity still unresolved;
   - keep formula status provisional.

2. **Solar Directions / Divisions**
   - current initial historical corpus did not provide enough direct evidence to force reconciliation;
   - retain source-sensitive/provisional treatment until a better witness is onboarded.

3. **Ptolemaic Ages exact tables**
   - preserve source specificity;
   - do not silently universalize one later table.

4. **Triplicity ruler variants beyond Lilly**
   - Lilly now has a direct source-bound table;
   - future authors/traditions should receive separately witnessed variant tables.

5. **Visible prose/presentation polish**
   - some early article headings and prose can be improved later (for example overly editorial headings);
   - this is frontend/editorial polish, not a canonical-evidence blocker.

6. **P2/P3/P4 article gaps**
   - continue through the article-quality audit when useful;
   - no longer treated as blockers for this checkpoint.

## Architecture / scaling state

- SQL migrations + sorted seeds remain canonical.
- Generated frontend JSON is disposable/generated output, not a source of truth.
- `scripts/generate_frontend_data.py` fingerprints generator + migrations + seeds and skips unchanged rebuilds.
- `npm run audit:corpus` is the canonical fresh-build editorial/integrity audit.
- `npm run build` regenerates frontend data and builds the Astro site.
- New books should enter through provenance-preserving extraction/review, not ad-hoc article rewriting.
- Existing canonical terms should be enriched/reconciled when new witnesses arrive rather than duplicated.
- Source-specific variants should remain distinguishable instead of being normalized away for convenience.

## Validation status

The newest work from the remote GitHub-only pass has **not** been claimed as locally audited by the assistant.

Run after pulling:

```bash
cd ~/projects/astro-lexicon
git pull origin main
npm run audit:corpus
npm run build
```

A clean result confirms the ordered seeds through `0151_lilly_triplicity_rulers_reference.sql`, schema constraints, article/table generation and Astro build all work together on the local checkout.

## Next phase options

The checkpoint deliberately leaves the next direction open. Sensible next phases include:

- onboarding the next historical books and using them to enrich/reconcile the existing lexicon;
- targeted research into the unresolved terms above;
- frontend/reference UX and visible prose cleanup;
- lower-priority article-quality refinement;
- bibliography/source-navigation improvements;
- diagrams and visual teaching aids where they materially improve understanding.

The next phase should **not** restart raw extraction of the same 40 private lessons unless new evidence shows a specific coverage failure.
