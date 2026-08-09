# Astro Lexicon

A source-based, teaching-quality encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions. Its goal is not merely to store normalized terms and citations, but to produce entries that help a reader genuinely understand each concept.

## Initial historical corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

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

## Evidence quality is not article quality

The corpus audit and the encyclopedia-quality audit solve different problems.

A term can have an excellent canonical definition, A-grade historical evidence, precise citations, and correct relations while still being a poor teaching entry. A mature article should, where appropriate, also provide:

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

The canonical schema now includes a separate reviewed **term article layer** (`term_articles` and ordered `term_article_sections`). `Temperament / Complexion` is the first pilot entry using that layer. Its article is original editorial prose informed by the reviewed private-study coverage map while its public technical method remains anchored to historical evidence already present in the corpus.

## Editorial evidence standard

- **A — definition:** the source gives an actual definition, recognition rule or technical mechanism.
- **B — substantial explanation:** the source does not give a compact definition but adds enough criteria, structure, distinctions or exceptions to materially explain the concept.
- **C — mention/context only:** retained in the searchable source corpus when useful, but not stored as an encyclopedia interpretation.

Public historical interpretations are expected to have reviewed A/B evidence. This evidence grade is independent of the eventual expository completeness of the public article.

## Repository structure

- `db/migrations/` — canonical SQLite/D1 schema and editorial-review fields
- `db/seed/` — source extraction, cross-source editorial revision, reviewed ontology, and reviewed article seeds
- `db/audit/` — read-only editorial/integrity audits
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions and lecture-corpus migration audits
- `docs/` — ontology, definition, citation, extraction, and source-onboarding policies
- `scripts/generate_frontend_data.py` — reproducible SQLite → public frontend-data generator
- `src/` — static Astro frontend generated from the canonical corpus

Generated frontend JSON is not a second source of truth. The SQL migrations and ordered seeds remain canonical.

## Current status

The substantive text of all five initial historical sources has been read sequentially, extracted and cross-source reviewed. The canonical corpus passes a reproducible fresh-database audit from an empty SQLite file, and the public Astro site is generated from that same audited corpus.

Completed work includes:

- source-by-source extraction of the initial five-source corpus;
- cross-source normalization of core terminology, dignities, sect, signs, houses, aspects, perfection/impediment, lots, horary, natal/rectification, predictive methods, mundane/electional/weather terminology and rare source-specific vocabulary;
- explicit preservation of technical disagreements and false friends;
- removal of mention-only interpretations and extraction-heading artifacts;
- recovery of missed definition-level terms and silent seed mismatches;
- source-specific edition provenance repair for the compiled Bonatti PDF;
- citation linkage for reviewed A/B interpretations;
- reviewed term relations and documented exceptions for intentional historical alias collisions;
- reproducible fresh SQLite builds with foreign-key enforcement and blocking editorial checks in CI;
- replacement of the hand-written frontend preview dataset with a canonical SQLite → JSON → Astro build pipeline;
- generated A–Z term index, canonical term pages, author pages, work pages and bibliography-oriented work navigation;
- scalable work lifecycle states (`bibliographic`, `partial`, `indexed`) for future corpus growth;
- foundation ontology for zodiac signs, traditional planets, primary qualities, elements, temperament, sign classifications, planetary gender, luminaries, and essential dignity;
- astronomical foundation entries including celestial sphere, geocentric framework, primary/secondary motion, horizon, meridian, equinoctial, ecliptic, epicycle, deferent, equant, apogee, and perigee;
- complete reuse audit of the 40-lesson clean core curriculum: NA06 is the reviewed benchmark; the remaining 39 legacy distillations are classified 31 A / 8 B / 0 C for migration rather than default re-extraction;
- separate encyclopedia article schema and the first frontend-ready teaching article for `Temperament / Complexion`;
- 68 ordered seed files currently applied by the reproducible corpus build.

## Current priority: migrate the structured lecture corpus

The 40-lesson clean core curriculum has already been distilled once. NA06 Temperament has completed the stricter Terra/Sol review benchmark, and the remaining 39 lesson distillations have been audited for reuse quality.

The current task is therefore **migration and targeted review**, not wholesale re-extraction. The lecture/doctrine pipeline preserves atomic propositions such as:

- definitions;
- rules and recognition criteria;
- mechanisms;
- qualifications and exceptions;
- comparisons and distinctions;
- examples and worked examples;
- interpretive significance;
- common mistakes or teaching cautions;
- methodological notes when they are genuinely general doctrine.

The purpose is not to publish the lectures themselves. The structured corpus is a **coverage and pedagogy map** that reveals what the lexicon knows, what it can explain, and what is still missing.

## Encyclopedia-quality phase

The article phase has now started with Temperament as the pilot. The sequence is:

1. migrate reviewed lecture/doctrine records to canonical lexicon terms;
2. compare pedagogical coverage against historical/source coverage;
3. audit public terms for actual teaching usefulness, not merely citation completeness;
4. classify entries that need explanation, examples, comparisons, diagrams, structural correction, or stronger definitions;
5. add reviewed explanatory sections through the separate term-article layer;
6. render article sections on term pages while keeping `short_definition` as the concise lead/index definition;
7. continue adding new historical books and source evidence in parallel once this article model is established.

The long-term target is a historical reference work in which a reader can both verify **where a doctrine comes from** and actually **learn what the doctrine means and how it works**.
