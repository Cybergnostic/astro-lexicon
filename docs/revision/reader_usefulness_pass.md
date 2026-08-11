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
   - Do not organize ordinary public prose around project/extraction language.
   - Historical disagreement belongs after the common conceptual ground has been made clear.

2. **Operational clarity**
   - For a mechanism, explain what changes, which actors are involved, and what counts as the event.
   - A technically correct definition is insufficient if the reader still cannot picture or recognize the condition.

3. **Useful completeness**
   - Umbrella categories should enumerate important members or conditions where the reviewed data supports this.
   - Ordered systems should expose the order rather than merely say that an order exists.
   - Classificatory entries should surface the classifications astrologers actually consult.

4. **Examples for abstract relations**
   - Add schematic or concrete examples when a relational definition is difficult to instantiate mentally.
   - Examples should clarify recognition without turning the encyclopedia into a chart-judgment manual.

5. **Visuals for spatial concepts**
   - Use a diagram when it communicates geometry, motion, or position materially faster or more accurately than prose.
   - Prefer reusable visual families over isolated decorative illustrations.

6. **Astrological priority**
   - For astrological entities such as signs and planets, lead with traditional astrological identity and classification.
   - Astronomical coordinates and modern physical facts are supporting reference data, not the primary identity.

7. **Sources as evidence, not subject**
   - Source accounts preserve attribution, disagreement and historical nuance.
   - Public articles should not read like a source-extraction catalogue.

## Defect labels

- `definition` — the entry does not clearly say what the concept is.
- `depth` — correct but too thin to be useful.
- `structure` — useful information exists but is badly ordered or hidden.
- `example` — abstraction needs a concrete demonstration.
- `visual` — geometry or spatial relations should be shown.
- `priority` — secondary information is emphasized before the astrological core.
- `lexicon-voice` — project/source-extraction language dominates the public explanation.
- `coverage` — important members, classifications, sequences or conditions are missing.

## Current corpus inventory

The reader-usefulness triage is a planning map, not an automatic quality score. Human editorial judgment remains authoritative.

Current inventory after Batches A–E: **468 entries**.

| Primary action | Entries | Meaning |
|---|---:|---|
| OK as-is | 321 | Current reader-facing treatment is proportionate. |
| Dictionary enough | 99 | A concise definition is sufficient; do not expand merely for uniformity. |
| Tiny fix | 0 | No residual wording/voice fixes. |
| Needs expansion | 4 | Intentional deferrals to visual/family-aware treatment rather than prose padding. |
| Structure / table | 11 | Residual flags are either served by shared components or await exact source data / visual treatment. |
| Family fix | 0 | Batch D completed. |
| Ontology review | 0 | Batch E completed. |
| Visual / explanation | 33 | Spatial, geometrical, or motion-based concepts that materially benefit from diagrams. |

Effort estimate by individual entry is now **420 S**, **15 M**, **33 L**.

The remaining planned work is therefore concentrated rather than corpus-wide:

- 33 geometry / visual candidates
- 11 residual structure flags, mostly intentional deferrals
- 4 residual expansion flags, all intentionally deferred
- 0 family-model defects
- 0 ontology-review defects
- 0 tiny wording/voice defects

The complete generated inventory is reproducible with `scripts/reader_usefulness_triage.py` and is also produced by the `Reader usefulness inventory` GitHub Actions workflow.

## Execution record

### Batch A — Tiny fixes — completed

Resolved all 16 small reader-facing defects in one compact pass, chiefly residual project/corpus language. `Tiny fix` fell from 16 to 0.

### Batch B — Substantive expansions — completed

The source-aware review examined all 21 original expansion candidates against reviewed interpretations, article blocks and relations. Seventeen received substantive public expansions from evidence already present in the canonical corpus.

The four residual flags are intentional:

- **First Movement** and **Second Movement** already have proportionate prose and belong with the later motion/geometry visual family.
- **Masculine Planet** is already a concise membership entry; the broader conditional doctrine is handled by **Planetary Masculinity**.
- **Solar Eclipse** has a clear astronomical definition and relation structure but no reviewed historical interpretation layer; further treatment belongs with the eclipse/astronomy visual family.

### Batch C — Structured systems — completed for the current evidence layer

The source-aware review started with 24 structure/table candidates and added structure only where order, membership, comparison or repeated subdivision materially improved recognition. Thirteen moved to `OK as-is`; 11 remain intentionally flagged.

Structured presentations were added or strengthened for Annual Revolution, Direction / Period by Term Lords, Jarbakhtar / Divisor, Lord of Profection, Lord of the Day, Lord of the Orb / Circle, Lord of the Revolution, Lord of the Year, Monthly Profection, Darīǧān / Indian Decan, Degree Sign-Nature, Dodecatemorion / Twelfth-part, and Ninth / Nawbahar.

Residual structure flags:

- **Detriment, Domicile, Face / Decan, Triplicity** — already served by the shared dignity-reference presentation; duplicating the same tables on each entry would add noise.
- **Planetary Hour** — already served by the shared planetary-time sequence component.
- **Revolution of the World-Year** — already has substantial explanatory structure; the residual flag is heuristic.
- **Anareta** — table-like language in the article does not itself justify a table.
- **Figure Ascending in a Decan** and **Inconjunct Signs** — better handled in the visual pass.
- **Planetary Recurrence** and **Planetary Years** — numerical tables should be added only after exact source values are explicitly recovered and reviewed; do not reconstruct them from memory.

Firdaria was originally ontology/structure-heavy but was resolved in Batch E because its exact source-attested periods were available.

### Batch D — Family models — completed

The family-model pass resolved the 43 entries previously forced into `family-fix`.

**Zodiac signs**
- Reordered the shared sign profile so traditional classification leads and geometry/longitude becomes supporting data.
- Added concise traditional identity introductions for all twelve signs.
- Reused the shared dignity reference instead of duplicating dignity tables in prose.

**Traditional planets**
- Reordered the shared planet profile so sect, benefic/malefic class, traditional family and qualities lead before modern physical/orbital data.
- Added concise traditional identity introductions for all seven planets.

**Sign classifications**
- Exposed source-supported membership tables for major fertility, sex/day-night, voice, human/quadruped and related classes.
- Added the three modality tetragons.
- Expanded **Voiced Sign** into a real umbrella article without collapsing historically distinct voice scales.

**Houses / places**
- Added a twelve-place overview with structural class and selected source-attributed topics.
- Exposed the seven planetary joys by house.
- Exposed Antiochus’ explicit no-dealings places.
- Expanded Lilly’s **Short Journey** into a usable recognition rule.

The triage no longer treats mere membership in a completed family as an unresolved defect.

### Batch E — Ontology review — completed

All 15 ontology-review candidates were checked against their reviewed definitions, editorial distinctions, relations and source interpretations. No historical false friends were merged.

Public distinctions were strengthened for:

- Opening the Doors vs Opening of the Gates
- Universal Question vs Absolute / Determinate Question
- Exaltation Degree vs sign-level Exaltation
- Lot of Eros formula streams vs the Venus planetary lot
- Bond of the Moon vs generic solar-proximity terminology
- Celestial Power vs Indication
- Dustoria vs Hayz / Own Similitude
- Lunar Dichotomy vs other lunar subdivisions
- Natal Rectification vs its separate historical methods
- Bonatti’s Planetary Elevation vs other superiority doctrines
- Rejoicing Condition vs planetary joys by house
- Trutine of Hermes vs Animodar
- Feral condition vs Void of Course
- Opening of the Gates vs the meteorological Opening the Doors
- Firdaria vs Lilly’s Alfridary

Firdaria also gained its exact source-attested major-period table: Sun 10, Venus 8, Mercury 13, Moon 9, Saturn 11, Jupiter 12, Mars 7, Head 3, Tail 2 years, with the sect-dependent day/night order retained.

The rerun moved `Ontology review` from 15 to **0**, `Family fix` from 43 to **0**, and `OK as-is` to **321**.

### Batch F — Visual systems — next

Build reusable diagram families for the 33 spatial/geometry candidates rather than 33 unrelated bespoke graphics.

The pass should first audit the existing `AstronomyMechanics` coverage and group missing candidates by shared geometry. Likely families include:

1. local celestial sphere / horizon geometry;
2. ecliptic and coordinate geometry;
3. aspect geometry plus application/separation;
4. antiscia / contra-antiscia;
5. geocentric orbital geometry such as apogee/perigee/auge;
6. movement, solar-proximity and eclipse diagrams already partly present.

A visual candidate may be closed without a new diagram if an existing shared component already explains it well. The goal is comprehension, not eliminating flags mechanically.

### Final audit

After Batch F, rerun the inventory and manually inspect all residual structure/expansion/visual flags. A flagged entry can remain intentionally concise or be documented as deliberately served by a shared component.

## Working rule

Do not expand an entry merely to make it longer. Every addition should answer a reader question, expose an existing structure, distinguish a nearby concept, provide a recognition example, or make a spatial idea easier to understand.
