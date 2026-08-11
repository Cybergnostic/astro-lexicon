# Reader Usefulness Editorial Pass

Status: **completed — Editorial Baseline v1**

## Purpose

This pass reviewed the public lexicon as an astrological reference work rather than as a record of extraction or corpus construction.

The primary test was:

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
   - Umbrella categories should enumerate important members or conditions where reviewed data supports this.
   - Ordered systems should expose the order rather than merely say that an order exists.
   - Classificatory entries should surface the classifications astrologers actually consult.

4. **Examples for abstract relations**
   - Add schematic or concrete examples when a relational definition is difficult to instantiate mentally.
   - Examples should clarify recognition without turning the encyclopedia into a chart-judgment manual.

5. **Visuals for spatial concepts**
   - Use a diagram when it communicates geometry, motion or position materially faster or more accurately than prose.
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

## Final corpus inventory

The reader-usefulness triage is a planning map, not an automatic quality score. Human editorial judgment remains authoritative, and shared components count as part of a page's reader-facing treatment.

Final inventory: **468 reviewed/public entries**.

| Primary action | Entries | Meaning |
|---|---:|---|
| OK as-is | 365 | Reader-facing treatment is proportionate. |
| Dictionary enough | 103 | A concise definition is sufficient; do not expand merely for uniformity. |
| Tiny fix | 0 | No residual wording/voice defects. |
| Needs expansion | 0 | No generic expansion work remains. |
| Structure / table | 0 | No unresolved structured-presentation work remains. |
| Family fix | 0 | Shared family-model work is complete. |
| Ontology review | 0 | Source-sensitive identity/distinction work is complete for the current corpus. |
| Visual / explanation | 0 | Current visual candidates are served by reusable visual systems. |

Effort classification is therefore **468 S / 0 M / 0 L** for the completed baseline. This does not mean every entry is equally long; it means the current corpus no longer contains a machine-identified generic reader-usefulness action that survived human review.

The complete inventory remains reproducible with `scripts/reader_usefulness_triage.py` and the `Reader usefulness inventory` GitHub Actions workflow.

## Execution record

### Batch A — Tiny fixes — completed

Resolved all 16 small reader-facing defects, chiefly residual project/corpus language. `Tiny fix` fell from 16 to 0.

### Batch B — Substantive expansions — completed

Reviewed the 21 original expansion candidates against interpretations, article blocks and relations. Seventeen received substantive public expansions. The four apparent residuals were later closed through shared visual/family treatment rather than prose padding: First Movement, Second Movement, Masculine Planet and Solar Eclipse.

### Batch C — Structured systems — completed

Added structure only where order, membership, comparison or repeated subdivision materially improved recognition. Structured presentations were added or strengthened for Annual Revolution, Direction / Period by Term Lords, Jarbakhtar / Divisor, Lord of Profection, Lord of the Day, Lord of the Orb / Circle, Lord of the Revolution, Lord of the Year, Monthly Profection, Darīǧān / Indian Decan, Degree Sign-Nature, Dodecatemorion / Twelfth-part and Ninth / Nawbahar.

Residual table-like flags were subsequently resolved by shared components, human review or exact source recovery rather than duplicated tables.

### Batch D — Family models — completed

The family-model pass resolved the 43 entries previously forced into `family-fix`.

**Zodiac signs**
- Traditional classification now leads; geometry/longitude is supporting data.
- All twelve signs use the shared sign profile and highlighted dignity reference rather than repetitive prose tables.

**Traditional planets**
- Sect, benefic/malefic class, traditional family and qualities lead before physical/orbital data.
- All seven planets have concise traditional identity treatment.

**Sign classifications**
- Source-supported membership tables expose fertility, sex/day-night, voice, human/quadruped and related classes.
- Modality exposes its three tetragons.
- Voiced Sign functions as a real umbrella article without collapsing historically distinct voice scales.

**Houses / places**
- Twelve-place structural overview added.
- Seven planetary joys exposed by house.
- Antiochus' no-dealings places exposed explicitly.
- Lilly's Short Journey expanded into a usable recognition rule.

### Batch E — Ontology review — completed

All 15 ontology-review candidates were checked against reviewed definitions, editorial distinctions, relations and source interpretations. Historical false friends were not merged simply because English labels looked similar.

Public distinctions were strengthened for Opening the Doors / Opening of the Gates, Universal / Absolute Question, Exaltation Degree / Exaltation, Lot of Eros formula streams, Bond of the Moon, Celestial Power / Indication, Dustoria / Hayz, Lunar Dichotomy, Natal Rectification methods, Planetary Elevation, Rejoicing Condition, Trutine / Animodar, Feral / Void of Course and Firdaria / Alfridary.

Firdaria also gained its exact source-attested major-period structure and sect-dependent starting order.

### Batch F — Visual systems — completed

The visual pass expanded `AstronomyMechanics` into reusable teaching families instead of creating 33 unrelated illustrations.

Current shared families cover:

1. local celestial-sphere / horizon geometry — altitude, azimuth, zenith, nadir, quadrants;
2. ecliptic and coordinate geometry — equator, ecliptic, longitude, latitude, declination and projection;
3. aspect geometry — aspect families plus application and separation;
4. antiscia / contra-antiscia;
5. geocentric orbital geometry — apogee, perigee and auge;
6. ascension and time-arc geometry — right/oblique ascension, rising times and semi-diurnal arc;
7. first/second planetary motion;
8. solar-relative orientation and proximity;
9. eclipse and occultation geometry.

The term-page routing was corrected so Orientality / Occidentality use the solar-relative visual. The triage now recognizes shared visual components as legitimate reader treatment rather than repeatedly flagging those entries as thin.

### Final residual audit — completed

The remaining flags were inspected against a fresh canonical SQLite build rather than being cleared mechanically.

Three genuine content gaps were resolved:

- **Planetary Years** now exposes Abū Maʿshar's exact greatest, great, middle and small planetary-year table for all seven planets.
- **Planetary Recurrence** now exposes Antiochus' seven longest recurrence values and distinguishes recurrence from ordinary planetary-year classes.
- **Figure Ascending in a Decan** now explains the symbolic decan image, its distinction from an actual stellar constellation, and the existence of multiple transmitted image traditions.

Other residual flags were confirmed as classifier artifacts because the information was already supplied by shared dignity/time/visual components or proportionate prose. The classifier records those decisions explicitly so future inventories measure unresolved work rather than repeatedly reopening completed family decisions.

Final rerun:

- **365 OK as-is**
- **103 dictionary-enough**
- **0 tiny-fix**
- **0 needs-expansion**
- **0 structure / table**
- **0 family-fix**
- **0 ontology-review**
- **0 visual / explanation**

## Baseline policy going forward

Editorial Baseline v1 is complete. Do **not** start another generic corpus-wide expansion sweep merely because entries differ in length.

Future work should be triggered by one of the following:

- a new primary or scholarly source that materially changes or expands a concept;
- an audit finding that reveals a concrete defect;
- a reader-facing bug, ambiguity or missing recognition rule;
- a newly onboarded concept or family requiring integration with the existing model;
- a targeted frontend improvement that materially improves navigation or comprehension.

New books should enter through the normal source-onboarding and review pipeline. Their evidence can enrich existing entries or create new ones without reopening already satisfactory pages by default.

## Working rule

Do not expand an entry merely to make it longer. Every addition should answer a reader question, expose an existing structure, distinguish a nearby concept, provide a recognition example, or make a spatial idea easier to understand.
