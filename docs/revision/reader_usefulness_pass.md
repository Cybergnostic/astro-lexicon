# Reader Usefulness Editorial Pass

Status: active

## Purpose

This pass reviews the public lexicon as an astrological reference work rather than as a record of extraction or corpus construction.

The primary test for every entry is:

> After reading this page, could a reader understand and recognize the concept in an astrological text, doctrine table, or chart discussion?

Historical sources remain essential evidence, but public explanatory prose should normally teach the concept before discussing differences between authors, editions, names, or source witnesses.

## Editorial standard

1. **Concept before source history**
   - Open by explaining what the concept is and what it does.
   - Do not organize ordinary public prose around phrases such as "source names", "source-backed identity", "the corpus distinguishes", or other project/extraction language.
   - Historical disagreement belongs after the common conceptual ground has been made clear.

2. **Operational clarity**
   - For a mechanism, explain what changes, which actors are involved, and what counts as the event.
   - A technically correct definition is insufficient if the reader still cannot picture or recognize the condition.

3. **Useful completeness**
   - Umbrella categories should enumerate their important members or conditions where the reviewed data supports this.
   - Ordered systems should expose the order rather than merely say that an order exists.
   - Classificatory entries should surface the classifications astrologers actually consult.

4. **Examples for abstract relations**
   - Add simple schematic or concrete examples when a relational definition is difficult to instantiate mentally.
   - Examples should clarify the recognition rule without turning the encyclopedia into a chart-judgment manual.

5. **Visuals for spatial concepts**
   - Flag geometry, motion and positional concepts for a diagram when a picture would communicate the idea materially faster or more accurately than prose.
   - Prefer reusable visual families over isolated decorative illustrations.

6. **Astrological priority**
   - For astrological entities such as signs and planets, lead with traditional astrological identity and classification.
   - Astronomical coordinates and modern physical facts remain useful supporting reference data but should not displace the astrological content readers primarily seek.

7. **Sources as evidence, not subject**
   - Source accounts preserve attribution, disagreement and historical nuance.
   - The public article should not make the project sound primarily like a source-extraction catalogue.

## Defect labels

- `definition` — the entry does not clearly say what the concept is.
- `depth` — correct but too thin to be useful.
- `structure` — useful information exists but is badly ordered or hidden.
- `example` — abstraction needs a concrete demonstration.
- `visual` — geometry or spatial relations should be shown.
- `priority` — secondary/trivia information is emphasized before the astrological core.
- `lexicon-voice` — project/source-extraction language dominates the public explanation.
- `coverage` — important members, classifications, sequences or conditions are missing.

## Corpus-wide inventory

The reader-usefulness triage now classifies every reviewed/public entry from a fresh canonical SQLite build. It is a planning map rather than an automatic quality score; human editorial judgment remains authoritative.

Current inventory: **468 entries**.

| Primary action | Entries | Meaning |
|---|---:|---|
| OK as-is | 217 | Current reader-facing treatment is proportionate. |
| Dictionary enough | 99 | A concise definition is sufficient; do not expand merely for uniformity. |
| Tiny fix | 16 | Mostly wording, source/project voice, or another small presentation defect. |
| Needs expansion | 21 | Correct or promising, but too thin to teach the concept adequately. |
| Structure / table | 24 | Existing doctrine is better exposed as an order, scheme, table, or other structured presentation. |
| Family fix | 43 | Should be edited with related entries under one shared content model. |
| Ontology review | 15 | Needs careful distinction, false-friend handling, or source reconciliation before editing. |
| Visual / explanation | 33 | Spatial, geometrical, or motion-based concepts that materially benefit from diagrams. |

Effort estimate by individual entry: **332 S**, **88 M**, **48 L**. Family and visual work should be executed as shared batches, so these are not 136 unrelated medium/large rewrites.

The large coherent batches already exposed by the inventory are:

- 12 zodiac signs
- 7 traditional planets
- 15 sign-quality/classification entries
- 9 house/place entries
- 33 geometry/visual candidates
- 24 structured/table candidates
- 21 substantive expansion candidates
- 15 ontology/reconciliation candidates
- 16 tiny wording/voice fixes

The complete generated inventory is reproducible with `scripts/reader_usefulness_triage.py` and is also produced by the `Reader usefulness inventory` GitHub Actions workflow.

## Initial reader findings

| Entry / family | Defects | Status | Notes |
|---|---|---|---|
| Abscission / Cutting of Light | definition, depth, example | revised in pass 01 | Explain the intercepted developing contact and distinguish nearby interruption mechanics. |
| Abscissor / Destroyer / Obstructor | definition, depth, lexicon-voice | revised in pass 01 | Remove "overlapping source names" framing; explain the destructive planetary role first. |
| Affliction | depth, coverage | revised in pass 02 | Treat as an umbrella condition and expose the actual affliction conditions rather than leaving the category empty. |
| Alfridary | depth, structure | revised in pass 02 | Expose both day- and night-nativity seven-period planetary orders in a reader-facing table. |
| Almuguea | example | revised in pass 02 | Add concrete Mercury and Venus examples and explain the domicile-distance rule before historical naming. |
| Altitude | visual | classified: visual / explanation | Geometry should be illustrated. |
| Apogee | visual | classified: visual / explanation | Geometry should be illustrated. |
| Application | visual, example | classified: visual / explanation | A diagram should show decreasing separation toward perfection. |
| Zodiac signs | priority, coverage | classified: family fix | Traditional classifications should lead; longitude spans should move to supporting technical data. Include relevant classifications such as element, modality, polarity/sex, rulership and other reviewed sign qualities. |
| Ascending / Descending Quadrants | visual, depth | classified: visual / explanation | A chart/circle diagram should make the quadrants immediately recognizable. |

## Execution order after inventory

### Batch A — Tiny fixes
Resolve the 16 small reader-facing defects in one compact pass, especially residual project/corpus language.

### Batch B — Substantive expansions
Handle the 21 thin entries in small doctrinal families rather than one by one.

### Batch C — Structured systems
Review the 24 sequence/table candidates and expose structure only where it genuinely improves the entry.

### Batch D — Family models
Apply shared templates to zodiac signs, planets, sign classifications, and houses/places. The zodiac-sign family is the clearest priority because all twelve currently foreground insufficient or badly prioritized information.

### Batch E — Ontology review
Resolve the 15 terms whose distinctions need source-aware judgment before prose changes.

### Batch F — Visual systems
Build reusable diagrams for the 33 spatial/geometry candidates rather than bespoke visuals entry by entry.

### Final audit
Rerun the inventory and manually inspect residual flags. A flagged entry can still be intentionally concise; the goal is reader usefulness, not eliminating every machine-generated flag.

## Planned passes

### Pass 1 — Concept clarity and usefulness
Review public entries for definition, depth, useful completeness, examples and lexicon voice. Fix the clearest reader-facing defects first.

### Pass 2 — Family consistency
Review related terms together: signs, planets, dignity families, perfection/interruption mechanics, houses, Lots, predictive techniques and other coherent families.

### Pass 3 — Structures, examples and visuals
Expose existing structured sequences/tables and add reusable diagrams for geometry, motion and positional concepts.

### Pass 4 — Final reader audit
Read completed pages as encyclopedia entries, remove residual project language, repair ordering and confirm that technically complete entries are also useful.

## Working rule

Do not expand an entry merely to make it longer. Every addition should answer a reader question, expose an existing structure, distinguish a nearby concept, provide a recognition example, or make a spatial idea easier to understand.
