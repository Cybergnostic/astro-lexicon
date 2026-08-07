# Astro Lexicon

A source-based encyclopedia of traditional astrological terminology.

The project is designed to compare how technical terms are defined and used across historical astrological sources without flattening differences between authors, periods, languages, or traditions.

## Initial corpus

- Antiochus of Athens — *The Thesaurus*
- Abū Maʿshar — *The Great Introduction to Astrology*
- al-Bīrūnī — *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti — *Liber Astronomiae*
- William Lilly — *Christian Astrology*

Source PDFs are not stored in this repository.

## Project principles

- Every substantive claim should be traceable to a source.
- Historical terminology is preserved rather than silently modernized.
- Similar terms are not merged unless the evidence supports equivalence.
- Author-specific disagreements and doctrinal differences are shown explicitly.
- Short quotations may be used where useful, but encyclopedia prose should primarily be original synthesis with precise references.
- Editorial review is required before generated or extracted material is treated as canonical.

## Planned architecture

- `app/` — public Cloudflare application
- `db/` — D1 schema, migrations, and seed data
- `data/` — curated structured records for authors, works, and terms
- `pipeline/` — local extraction/import tooling
- `docs/` — ontology, editorial policy, citation rules, and extraction specification

## Status

Early research and schema-design phase. The first milestone is a small set of difficult representative terms used to test the ontology before scaling to the full corpus.
