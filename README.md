# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions. Its goal is not merely to store normalized terms and citations, but to produce entries that help a reader genuinely understand each concept.

## Initial historical corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Additional public witnesses may be onboarded as needed for unresolved terminology or doctrine. Partial public witnesses currently include Firmicus Maternus for the Thema Mundi and Claudius Ptolemy for directly verified passages in the *Tetrabiblos*, including the Egyptian terms/bounds and the general ages of life.

Source PDFs are not stored in this repository.

## Supplemental private study corpus

The project also uses a private study corpus consisting of lecture notes, transcripts, slides, and derived structured distillations covering traditional astrological doctrine.

This material is an **editorial and pedagogical research layer**, not a separately attributed public authority.

The knowledge contained in the private corpus may be used in the lexicon when it expresses general or widely shared traditional doctrine. Concepts such as domicile, exaltation, sect, triplicity, planetary nature, sign classifications, temperament, and similar technical material are not excluded merely because they were learned or summarized in private teaching material.

The important boundary is between **knowledge** and **authored expression or method**:

- copyrighted lecture text, slides, transcripts, distinctive wording, and recognizable presentation are not copied into the public lexicon;
- universal or traditional doctrine may be synthesized into original editorial prose;
- the private corpus may directly supply definitions, distinctions, examples, relationships, and pedagogical clues when these are expressed in new language rather than reproduced verbatim;
- historical/public sources should be used as public evidence whenever a suitable witness exists;
- the private corpus is especially useful for detecting missing fundamentals, weak explanations, absent examples, and concepts that the historical extraction did not promote into standalone entries;
- lecturer-specific analytical workflows, sequencing rules, or proprietary methods are treated as authored methodology and are generally outside the scope of the lexicon unless they are independently historical and relevant as a documented tradition;
- the lecturer is not named or presented as a public source unless there is a separate reason and permission to do so.

The private study corpus itself is not stored in this repository.

## Scope rule: this is a term encyclopedia, not an analysis manual

The project extracts and explains **named terms, technical concepts, classifications, historical terminology, synonyms, source variants and historically established techniques**.

It does **not** convert the private curriculum into a public chart-analysis manual. In particular, the public lexicon should not promote:

- ordered analysis workflows;
- topic-judgment recipes;
- factor checklists;
- lecturer-specific scoring systems;
- procedural chapter structures merely because they exist in the course material.

A procedure belongs in an entry only as far as needed to define a named concept—for example, the arithmetic of a named lot, the geometry of application/separation, or the recognition rule for a technical condition.

## Project principles

- Every substantive historical claim should be traceable to a source; editorial synthesis should be clearly distinguishable from attributed historical evidence.
- A mention is not an interpretation: public historical interpretations must contain definition-level evidence or substantial explanation.
- Historical terminology is preserved rather than silently modernized.
- Similar translated labels are not merged unless their recognition rules support equivalence.
- False friends, author disagreements and doctrinal differences remain visible.
- Canonical definitions identify what a term **is** and how it is recognized; they are not expected to carry the full pedagogical burden of an encyclopedia article.
- Quotations are selective. Public prose is primarily original synthesis with precise source locators.
- Translator and editor commentary is not attributed to the historical author.
- Editorial review is required before extracted material is treated as canonical.
- Private teaching material may guide and inform public synthesis, but copyrighted phrasing and proprietary methodology are not reproduced.
- Source-specific numerical thresholds, formulas, dignity systems and classification tables are labeled as source-specific when the tradition is not uniform.
- Structured astrological reference data should live canonically in SQLite when the same facts need to appear on multiple pages, rather than being duplicated as hand-written article prose or JSON tables.

## Evidence quality is not article quality

The corpus audit and the encyclopedia-quality audit solve different problems.

A term can have an excellent canonical definition, A-grade historical evidence, precise citations, and correct relations while still be a poor teaching entry. A mature article should, where appropriate, also provide:

- a clear plain-language explanation;
- the rule or mechanism by which the concept works;
- one or more concrete examples;
- distinctions from easily confused or related concepts;
- interpretive or practical significance where historically supported;
- important exceptions, qualifications, and source disagreements;
- historical variants and aliases;
- useful links to prerequisite and related concepts;
- a table, diagram, or worked example when prose alone is insufficient.

The public frontend should not repeat the same `short_definition` as both a lead and a visible “Canonical definition” section. The canonical definition remains valuable internally for indexing, normalization, search, APIs, and editorial control; the public article body should add explanatory value rather than duplicate it.

## Repository structure

- `db/migrations/` — canonical SQLite schema and editorial/reference-system fields
- `db/seed/` — source extraction, cross-source editorial revision, reviewed ontology, article seeds and structured reference datasets
- `db/audit/` — read-only editorial/integrity audits, including lot-formula and article-quality coverage
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions, curriculum audits, stage closures, checkpoints and bird's-eye review plans
- `docs/` — ontology, definition, citation, extraction, and source-onboarding policies
- `scripts/generate_frontend_data.py` — reproducible SQLite → public frontend-data generator with source-fingerprint caching
- `src/` — static Astro frontend generated from the canonical corpus

Generated frontend JSON is not a second source of truth. The SQL migrations and ordered seeds remain canonical.

## Previous checkpoint

The first large encyclopedia-quality conversion/corroboration pass is complete. It systematically converted the initial corpus and private curriculum term-discovery map into source-backed encyclopedia entries, structured tables, reconciled lot identities, source-sensitive formulas, connective vocabulary and a usable generated frontend.

The detailed checkpoint is recorded in:

`docs/revision/encyclopedia_quality_checkpoint_2026-08-09.md`

That pass deliberately ended before lower-priority polishing became open-ended.

## Current phase: bird's-eye encyclopedia review

The active phase is a **whole-encyclopedia editorial architecture review**.

The previous workflow often asked questions from inside the database: Is a term present? Is it sourced? Does it have an article? The current pass asks a different question from the reader's point of view:

> If a reader knew nothing about this subject and opened this entry—or several related entries together—would the doctrine actually make sense as a coherent system?

For every major family and important entry, review five dimensions together:

1. **Definition** — is the lead immediately clear and accurate?
2. **Explanation** — does the reader understand how the concept works and why it matters?
3. **Reference data** — are the tables, degree ranges, formulas, phases or classifications actually present?
4. **Connections** — is the entry wired to the planets, signs, dignities, phases, techniques and related concepts it belongs to?
5. **Presentation** — would a diagram, glyph, comparison table or other visual make the concept easier to understand?

External web research is encouraged in this phase as an **editorial discovery and inspiration layer**. Strong reference sites, astronomy resources, scholarly papers, historical dictionaries and specialist traditional-astrology sites may be used to identify what a good entry should cover and what questions readers expect answered. Their prose, diagrams and organization are not copied. Historical claims remain grounded in primary/historical sources or reliable scholarship.

Useful external benchmarks include:

- Skyscript for reader-facing completeness and traditional-reference pedagogy;
- HOROI and relevant scholarship for Hellenistic terminology, Greek technical vocabulary and source precision;
- reliable astronomy references for physical and observational mechanics;
- the project's own historical corpus for canonical attribution and source comparison.

The detailed phase ledger is:

`docs/revision/birds_eye_encyclopedia_review.md`

## Normalized reusable doctrine/reference layers

The canonical SQLite layer now includes:

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

`concept_families` is a generic ordered teaching-family layer. Use it when several terms form one coherent doctrine or mechanics family. Pairwise `term_relations` still describe individual connections; the family layer describes the larger system and each member’s role inside it.

Do not recreate normalized facts as parallel hand-written JSON or repeated article tables when SQLite can drive the same information across several pages.

## Bird's-eye blocks completed on `main`

### Essential dignity / historical schemes

- complete Lilly/Ptolemaic essential-dignity dataset;
- domicile, detriment, exaltation and fall, including exact exaltation/fall degrees where supplied;
- Lilly's sect-dependent triplicity rulers;
- all 60 Lilly/Ptolemaic term/bound ranges;
- all 36 faces/decans;
- Egyptian terms/bounds transmitted by Ptolemy in *Tetrabiblos* I.21 as a **separate named scheme**;
- explicit frontend comparison between named term/bound schemes;
- planet- and sign-centric dignity views generated from the same canonical rows.

### Original-language terminology

Historical/original-language forms are no longer forced into `aliases`.

The dedicated form layer preserves language/script, historical form or lemma, transliteration, literal gloss, multiple English renderings, translation ambiguity / false-friend notes, and source/work/tradition scope.

The first reviewed Ancient Greek layer includes major Hellenistic technical vocabulary, all seven traditional planets and the twelve zodiac signs. It uses HOROI as a philological editorial/reference layer while keeping public prose independently written.

Do **not** turn this into a modern-Greek translation project.

### Seven traditional planets

Sun, Moon, Mercury, Venus, Mars, Jupiter and Saturn have been reviewed as one family.

The current planet-page architecture includes:

- reader-facing definition rather than ontology-like wording;
- glyph and historical Greek names/forms;
- modern astronomical identity separated from traditional classification;
- normalized object class / Earth-based observational geometry;
- traditional family, sect, benefic/malefic class and attributed qualities;
- normalized dignity participation, including named term/bound schemes;
- structured synodic/visibility phase sequence where applicable;
- direct/stationary/retrograde cycle relationship where applicable;
- source-specific historical accounts;
- associated source-specific planetary/luminary lot links;
- related concepts.

The old hand-written `planet-summary` dignity tables were removed because they duplicated canonical reference data.

### Twelve zodiac signs

The current sign-page architecture includes:

- coordinate-first reader-facing definition;
- exact equal 30° tropical longitude interval;
- ordinal position;
- normalized element/triplicity, modality, polarity and day/night sign class;
- tropical-quarter position;
- explicit distinction between equal astrological signs and modern IAU constellation boundaries;
- original responsive twelve-sign position strip;
- glyph and historical Greek sign name/form;
- normalized scheme-aware dignity relationships;
- source-specific additional taxonomies.

### Astronomical mechanics / visibility

The astronomy family now teaches one connected geometry:

- celestial sphere, ecliptic and celestial equator;
- ecliptic longitude vs ecliptic latitude vs declination;
- First Motion vs slower Second Motion;
- direct, stationary and retrograde apparent motion;
- oriental/occidental solar-phase usage vs “in the figure” usage;
- solar orientation vs traditional proximity conditions vs actual naked-eye visibility;
- eclipse, occultation and ecliptic-projection geometry;
- original HTML/CSS schematics for the celestial sphere, motion cycle, solar-relative conditions and eclipse alignment;
- repaired the older fixed-star-nature article seed that targeted a non-canonical slug.

Modern physical explanations were checked against NASA/JPL/USNO material. Historical astrological thresholds remain source-attributed.

### Aspects / application / perfection

The `aspect-perfection-mechanics` family now visibly separates:

- aspect/orb geometry;
- partile/platick exactness;
- application vs separation;
- horary Perfection as an outcome concept;
- Translation vs Collection of Light as distinct mediation structures;
- reception as a relational modifier rather than aspect geometry;
- Prohibition, Frustration, Refrenation, Abscission and source-specific interruption variants.

The reusable `ConceptFamilyMap` frontend component is generated from SQLite and appears on every family member page.

### Houses / places

The `houses-places-structure` family now separates:

- the twelve-place framework;
- angles/cardines, succedents and cadents as positional classes;
- positional accidental capacity from topical house signification;
- derived houses as relational recounting inside the same chart;
- Antiochus’ Places for Dealings / Places without Dealings as a separate source-specific classification rather than synonyms for angular/cadent structure.

### Lots / Parts

The Lots review now includes:

- `lot-mechanics` family separating construction, historical identity, canonical equivalence and interpretation;
- separate `abu-mashar-planetary-lots` historical family for the five non-luminary planetary Lots in *Great Introduction* VIII.3.12–3.16;
- explicit rule that repeated English names do not establish historical identity without formula/source agreement;
- Fortune/Absence and Eros/Venus-Love distinctions kept source-sensitive;
- original generic directed-arc projection schematic;
- the diagram uses a source-defined **Origin**, not a universalized Ascendant, while noting that the Ascendant is usual in the major represented streams.

### Predictive terminology

The predictive family pass is comparative rather than procedural.

It now includes:

- duplicate cleanup: late `firdaria` merged into source-backed `fardar`; `solar-return` into source-backed `solar-revolution`; `lord-of-the-year` into source-backed `lord-of-year`;
- useful common names retained as aliases rather than duplicate canonical terms;
- direct Ptolemy *Tetrabiblos* IV.10 witness for the seven Ages of Life, confirming the stored Moon 4 / Mercury 10 / Venus 8 / Sun 19 / Mars 15 / Jupiter 12 / Saturn-remainder sequence;
- `time-lord-chronology` family separating Firdaria, Lilly’s Alfridary, profections, annual roles, planetary-year quantities and Ptolemy’s general life-stage model;
- `directions-distributions` family separating primary directions, significator/promissor roles, distributions and distributor/participator roles;
- `revolutions-returns` family separating generic revolution charts, annual revolutions, natal Solar Revolution/Return, world-year revolution, Lunar Return and the Lord of the Revolution;
- comparative table showing that planetary-period sequences, symbolic zodiacal advancement, directed geometry and astronomical returns are different timing mechanisms;
- `solar-direction` and `divisions` explicitly marked **source-audit-open** because their direct historical terminology/provenance remains unresolved in the current public corpus.

## Immediate next work

Do **not** redo the completed family passes above. Continue from the current `main` branch and use the normalized structures already present.

Priority order:

### 1. Historical cosmology / foundational models

Review the remaining cosmological/foundational system around:

- Thema Mundi;
- traditional planetary order;
- sect as a cosmological/day-night organization;
- luminaries and the seven-planet framework;
- zodiac/ecliptic relation where foundational rather than sign-specific;
- historical model concepts that help a reader understand how the doctrines fit together.

Distinguish pedagogical/model diagrams from literal historical event charts.

### 2. Remaining planet/sign secondary families

Targeted follow-ups only:

- commanding/obeying, hearing/seeing, equal-ascension and related sign relations;
- planetary day/hour correspondences if source-backed and useful;
- additional historical triplicity or term/bound schemes only under explicit named source identities;
- lunar nodes as standalone astronomical/historical terminology if the current corpus supports a clean canonical identity.

### 3. Long-tail definitions

Only after the remaining coherent families are reviewed should the pass return to thin lower-priority entries. Do not restart a generic missing-term hunt.

## Remaining targeted research questions

- **Lot / Part of Divorce:** modern traditional formula located, but premodern provenance remains unresolved.
- **Solar Directions / Divisions:** kept source-audit-open; direct historical terminology/provenance remains unresolved.
- **Triplicity-ruler variants:** Lilly is represented; add other historical schemes only under explicit named witnesses.
- **Historical aspect/orb schemes:** consider normalized named schemes only if the source comparison shows genuine reusable value.
- **Lunar nodes:** assess whether standalone source-backed entries are needed beyond eclipse context.
- **Lower-priority thin articles:** revisit only during the relevant family review.

## Definition-quality rule for this phase

Definitions should answer **“what is this?”** immediately and naturally. Avoid ontology-style leads such as “a classification denoting…” when a direct sentence is clearer.

For example, a good peregrine definition should immediately explain that the planet has none of **its own** essential dignities at that degree. Occupying another planet's term or face does not make it non-peregrine.

The article body may then explain mechanism, history, exceptions, examples and source disagreement.

## SQLite strategy

SQLite remains the canonical backend and is appropriate for this project.

The current direction is to use it **more**, not less: structured doctrine that appears across many pages should be modeled once as canonical domain data and projected into the relevant encyclopedia pages. Reference schemes, historical forms, planet/sign profiles and concept families all follow this rule.

A future migration to a client/server database would only become necessary if the project evolves into a high-concurrency collaborative editing system. That is not the current architecture.

## Validation

The canonical validation commands remain:

```bash
npm run audit:corpus
npm run build
```

These rebuild the corpus from migrations + ordered seeds, run integrity/editorial diagnostics, generate frontend data, and build the Astro site.

**Important:** the latest bird's-eye changes on `main` were committed remotely through GitHub. They have **not** been locally validated in this session. After pulling `main`, run both commands before treating the latest schema/frontend changes as validated.
