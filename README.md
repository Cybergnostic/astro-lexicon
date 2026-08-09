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

## Scope rule: this is a term encyclopedia

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
- Source-specific numerical thresholds, formulas and classification tables are labeled as source-specific when the tradition is not uniform.

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

The canonical schema includes reviewed **term articles**, ordered prose sections, and first-class structured article tables. Tables are used selectively for information that is genuinely comparative or reference-like: dignity systems, classification families, formulas, planetary roles, source variants, and similar material.

## Editorial evidence standard

- **A — definition:** the source gives an actual definition, recognition rule or technical mechanism.
- **B — substantial explanation:** the source does not give a compact definition but adds enough criteria, structure, distinctions or exceptions to materially explain the concept.
- **C — mention/context only:** retained in the searchable source corpus when useful, but not stored as an encyclopedia interpretation.

Public historical interpretations are expected to have reviewed A/B evidence. This evidence grade is independent of the eventual expository completeness of the public article.

## Repository structure

- `db/migrations/` — canonical SQLite/D1 schema and editorial-review fields
- `db/seed/` — source extraction, cross-source editorial revision, reviewed ontology, and reviewed article seeds
- `db/audit/` — read-only editorial/integrity audits, including lot-formula and article-quality coverage
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions, curriculum audits, stage closures and checkpoint status
- `docs/` — ontology, definition, citation, extraction, and source-onboarding policies
- `scripts/generate_frontend_data.py` — reproducible SQLite → public frontend-data generator with source-fingerprint caching
- `src/` — static Astro frontend generated from the canonical corpus

Generated frontend JSON is not a second source of truth. The SQL migrations and ordered seeds remain canonical.

## Current status — encyclopedia-quality checkpoint

The substantive text of all five initial historical sources has been read sequentially, extracted and cross-source reviewed. The 40-lesson clean private curriculum has also completed its role as a systematic **term-discovery map**. The current canonical corpus is designed to rebuild reproducibly from an empty SQLite database, and the public Astro site is generated from that canonical corpus.

The first large encyclopedia-quality conversion/corroboration pass is now at checkpoint. Completed work includes:

- source-by-source extraction of the initial five-source corpus;
- cross-source normalization of core terminology, dignities, sect, signs, houses/places, aspects, lots, horary, natal and predictive terminology;
- explicit preservation of technical disagreements and false friends;
- source-sensitive calculated-lot formulas with explicit day/night reversals and variant streams;
- direct historical reconciliation of many curriculum-discovered lots, including Substance, family/marriage lots, rank/authority lots, planetary lots, travel/knowledge/social lots, Courage/Victory/Necessity streams, and Eros;
- clear provisional status for unresolved identities such as the current Divorce lot formula rather than presenting uncertain material as canonical;
- expanded encyclopedia articles for all twelve zodiac signs, seven traditional planets, major aspects, zodiac framework terms, predictive techniques, specialized historical terminology, houses/places, secondary aspect geometry, ascensional relations, fixed-star/eclipses, sign classifications, qualities/elements, astronomical foundations, and astrology branch taxonomy;
- structured tables for dignities, planet conditions, classifications, lot formulas, predictive roles, sect, solar conditions, motion, reception/aspect mechanics, house strength and other inherently comparative material;
- source-specific numerical presentation where needed, including Lilly-specific solar-condition thresholds and Lilly-specific triplicity rulers rather than universalizing one author’s scheme;
- source-backed connective vocabulary including Prenatal Syzygy, Lord of the Geniture, Dispositor, Perfection, Translation of Light, Collection of Light, Prohibition, Frustration, Refrenation/Refranation, Abscission of Light, Querent, Quesited, Significator, Cosignificator, Radicality, Planetary Hour, Lord of the Hour, Testimony, Fortitude, Debility, Natural Significator, Accidental Signification, Radix, and Interrogation;
- separation of easily confused identities such as Radix vs Radicality, perfect aspect vs horary Perfection, Significator vs its specialized directional use, Eros vs Abū Maʿshar’s Venus planetary lot, and the several Courage/Victory/Necessity lots;
- public-source expansion of Hyleg/Apheta, Hylegical Place, Alcochoden and Anareta while keeping sensitive lifespan/death material descriptive rather than operational;
- a table-aware article-quality audit that prioritizes evidence-rich/article-poor entries;
- a non-blocking lot-formula coverage audit integrated into the corpus audit;
- generated A–Z term index, canonical term pages, author pages, work pages and bibliography-oriented work navigation;
- responsive structured-table rendering in the public term pages;
- source-fingerprint caching in `scripts/generate_frontend_data.py` so unchanged `npm run dev` / `npm run build` runs do not needlessly rebuild the corpus;
- ordered seed development now extends through `0151_lilly_triplicity_rulers_reference.sql`.

A detailed checkpoint is recorded in `docs/revision/encyclopedia_quality_checkpoint_2026-08-09.md`.

## What remains unresolved at this checkpoint

A checkpoint does not mean the encyclopedia is finished. It means the first systematic conversion/corroboration pass has reached diminishing returns and the remaining work is better handled as targeted expansion.

Known open items include:

- **Lot / Part of Divorce:** a modern traditional formula has been located, but a suitable premodern witness for the currently normalized historical identity has not yet been established; keep the historical formula status provisional.
- **Solar Directions / Divisions terminology:** the current initial corpus did not yield enough direct evidence to force a source reconciliation; keep source-sensitive until a better witness is onboarded.
- **Ptolemaic Ages exact tables:** preserve source-specificity rather than silently presenting one later table as universal.
- **Triplicity ruler variants:** Lilly’s scheme is now directly documented, but other historical systems should be added under their own source witnesses rather than merged into one universal table.
- **Lower-priority thin entries:** the article-quality audit will continue to surface P2/P3/P4 entries as the corpus grows; these are no longer blockers for this checkpoint.
- **Presentation wording cleanup:** some early converted headings and prose can still be improved later on the visible frontend without reopening the underlying canonical/source work.

## Next phase

After this checkpoint, development can proceed in several parallel but clearly separated directions:

1. **New historical-source onboarding** — add books/authors and let them enrich or challenge existing canonical entries.
2. **Targeted unresolved-term research** — resolve specific provisional identities only when new evidence warrants it.
3. **Article-quality refinement** — use the audit to improve remaining thin entries and visible prose rather than reprocessing the whole corpus.
4. **Frontend/reference UX** — improve discovery, cross-linking, bibliography navigation, search, tables, diagrams and other reader-facing presentation.
5. **Corpus scaling** — new books should enter through the same provenance-preserving extraction/review pipeline rather than through ad-hoc manual rewriting.

The long-term target is a historical reference work in which a reader can both verify **where a doctrine comes from** and actually **learn what the doctrine means and how it works**.

## Validation

The canonical validation commands remain:

```bash
npm run audit:corpus
npm run build
```

These rebuild the canonical corpus from migrations + ordered seeds, run the integrity/editorial diagnostics, generate frontend data, and build the Astro site. The latest remote-only seed work in this checkpoint has not been claimed as locally validated until those commands are run against the pulled `main` branch.
