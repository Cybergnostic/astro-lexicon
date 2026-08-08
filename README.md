# Astro Lexicon

A source-based encyclopedia of traditional astrological terminology.

The project compares how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, translators, or traditions.

## Initial corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Source PDFs are not stored in this repository.

## Project principles

- Every substantive encyclopedia claim should be traceable to a source.
- A mention is not an interpretation: public interpretations must contain definition-level evidence or substantial explanation.
- Historical terminology is preserved rather than silently modernized.
- Similar translated labels are not merged unless their recognition rules support equivalence.
- False friends, author disagreements and doctrinal differences remain visible.
- Canonical definitions describe what a term **is** and how it is recognized; attributed effects belong in source-specific interpretations.
- Quotations are selective. Public prose is primarily original synthesis with precise source locators.
- Translator and editor commentary is not attributed to the historical author.
- Editorial review is required before extracted material is treated as canonical.

## Editorial evidence standard

- **A — definition:** the source gives an actual definition, recognition rule or technical mechanism.
- **B — substantial explanation:** the source does not give a compact definition but adds enough criteria, structure, distinctions or exceptions to materially explain the concept.
- **C — mention/context only:** retained in the searchable source corpus when useful, but not stored as an encyclopedia interpretation.

Public entries are expected to have definition quality 4–5 and reviewed A/B evidence.

## Repository structure

- `db/migrations/` — canonical SQLite/D1 schema and editorial-review fields
- `db/seed/` — source extraction and cross-source editorial revision seeds
- `db/audit/` — read-only editorial/integrity audits
- `docs/extraction/` — sequential source-coverage ledgers
- `docs/revision/` — cross-source editorial decisions
- `docs/` — ontology, definition, citation and extraction policies
- `src/` — public-site frontend

## Status

The substantive text of all five initial sources has been read sequentially, extracted and cross-source reviewed. The initial canonical corpus now passes a reproducible fresh-database audit from an empty SQLite file.

Completed work includes:

- source-by-source extraction of the initial corpus;
- cross-source normalization of core terminology, dignities, sect, signs, houses, aspects, perfection/impediment, lots, horary, natal/rectification, predictive methods, mundane/electional/weather terminology and rare source-specific vocabulary;
- explicit preservation of technical disagreements and false friends;
- removal of mention-only interpretations and extraction-heading artifacts;
- recovery of missed definition-level terms and silent seed mismatches;
- source-specific edition provenance repair for the compiled Bonatti PDF;
- complete citation linkage for every reviewed A/B interpretation in the initial corpus;
- reviewed term relations and documented exceptions for intentional historical alias collisions;
- a fresh SQLite build applying both migrations and all 61 seed files with foreign-key enforcement on every connection;
- passing SQLite integrity, foreign-key and blocking editorial checks in CI.

The next milestone is frontend generation from the reviewed canonical database: replace the hand-written preview dataset with a database-backed data layer and generate term, author and work pages from the source records, citations, aliases and relations.
