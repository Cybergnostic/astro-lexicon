# Astro Lexicon

A source-based encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions.

## Initial historical corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Source PDFs are not stored in this repository.

## Supplemental private study corpus

The project also uses a private study corpus consisting of lecture notes, transcripts, slides, and derived structured distillations covering traditional astrological doctrine.

This material is an **editorial research layer**, not a public source corpus:

- copyrighted lecture text, slides, transcripts, and distinctive phrasing are not published in this repository;
- the private material is not presented as a historical authority and is not mixed into source accounts attributed to historical authors;
- distilled claims may be used to identify missing concepts, relations, classifications, and terminology that should be checked against the historical corpus;
- public definitions and explanatory prose are rewritten as original editorial synthesis;
- when a claim can be anchored to a historical source already in the corpus, the historical source remains the public evidence;
- claims that remain course-specific or insufficiently sourced should stay editorial/private until independently verified.

The private study corpus itself is not stored in this repository.

## Project principles

- Every substantive encyclopedia claim should be traceable to a source or explicitly identified as editorial structure.
- A mention is not an interpretation: public interpretations must contain definition-level evidence or substantial explanation.
- Historical terminology is preserved rather than silently modernized.
- Similar translated labels are not merged unless their recognition rules support equivalence.
- False friends, author disagreements and doctrinal differences remain visible.
- Canonical definitions describe what a term **is** and how it is recognized; attributed effects belong in source-specific interpretations.
- Quotations are selective. Public prose is primarily original synthesis with precise source locators.
- Translator and editor commentary is not attributed to the historical author.
- Editorial review is required before extracted material is treated as canonical.
- Private teaching material may guide discovery and normalization, but it must not be reproduced or falsely presented as historical evidence.

## Editorial evidence standard

- **A — definition:** the source gives an actual definition, recognition rule or technical mechanism.
- **B — substantial explanation:** the source does not give a compact definition but adds enough criteria, structure, distinctions or exceptions to materially explain the concept.
- **C — mention/context only:** retained in the searchable source corpus when useful, but not stored as an encyclopedia interpretation.

Public entries are expected to have definition quality 4–5 and reviewed A/B evidence.

## Repository structure

- `db/migrations/` — canonical SQLite/D1 schema and editorial-review fields
- `db/seed/` — source extraction, cross-source editorial revision, and reviewed ontology seeds
- `db/audit/` — read-only editorial/integrity audits
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions
- `docs/` — ontology, definition, citation and extraction policies
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
- citation linkage for every reviewed A/B interpretation in the initial corpus;
- reviewed term relations and documented exceptions for intentional historical alias collisions;
- reproducible fresh SQLite builds with foreign-key enforcement and blocking editorial checks in CI;
- replacement of the hand-written frontend preview dataset with a canonical SQLite → JSON → Astro build pipeline;
- generated A–Z term index, canonical term pages, author pages, work pages and bibliography-oriented work navigation;
- foundation ontology for all twelve zodiac signs, the seven traditional planets, the four primary qualities, and the four elements;
- structural links from foundation entities into modality, triplicity, polarity, diurnal/nocturnal classification, domicile, sect, benefic/malefic doctrine and planetary nature;
- 62 ordered seed files currently applied by the reproducible corpus build.

## Next research milestone

Use the private structured study distillations to audit the **foundation layer** for missing basic classifications and reference data, especially:

- individual sign properties and traditional sign classes;
- individual planetary natures, sect, benefic/malefic status and significations;
- elemental and temperamental doctrine;
- exaltation/fall and other dignity relations;
- sign fertility, voice, human/bestial and related historical classifications;
- traditional astronomical/cosmological basics needed to make the lexicon navigable for beginners.

The private corpus should function as a discovery checklist. Public claims should be cross-checked against historical sources where possible and expressed in original editorial language rather than copied from teaching material.
