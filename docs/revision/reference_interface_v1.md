# Reference-first UI redesign — Phase 1

Status: review branch, not yet approved for `main`.

## Editorial goal

Present Astro Lexicon as a scholarly historical lexicon rather than a landing page for a research project. Readers should immediately find headwords, definitions, historical variants, authors and related terms.

## Changes in this branch

- Homepage leads with search, a complete A–Z access strip and subject browsing rather than promotional project sections or prominent corpus statistics.
- Representative entries include concise descriptions so readers can recognize concepts before opening pages.
- Historical authors are listed as a secondary reference path rather than a marketing timeline.
- Global navigation prioritizes the alphabetical index.
- Individual terms show a breadcrumb, variant names and immediate cross-references above the long article material.
- Article display uses more restrained heading sizes, sentence-case section titles, a tighter reading width and scholarly reference styling.
- A–Z anchors from the homepage resolve to the matching filtered letter on the terms index, preserving the subject/search filters.
- All existing source data, specialized tables, diagrams and reviewed term bodies remain unchanged.

## Review checklist before merge

1. Run corpus audit, generated-data tests and production build on this branch.
2. Inspect the homepage and representative term pages on desktop and mobile.
3. Verify opening A, F, R and Z from the home A–Z strip lands on the intended filtered list.
4. Verify search mouse and keyboard navigation, including GitHub Pages base paths.
5. Inspect these entry types: Reception (complex technical), Animodar (historical method), Firdaria (timing tables), a zodiac sign, a planet, and a definition-only headword.
6. Confirm horizontal scrolling of dense reference tables works on narrow screens.
7. Recheck source references and historical forms after layout changes.

## Next UI/editorial phases

- Decide a stable headword template with concise definition, historical forms, explanation, source-specific variants, references and see-also links.
- Remove redundant top-level prose where the canonical short definition and article intro repeat without adding information.
- Integrate historical source citations near disputed claims, while maintaining the underlying normalized source data.
- Add consistent bibliographic locators and improved cross-reference labels; avoid rendering database relation keys as reader-facing headings.
- Build a separately reviewed lexicographic sample of 8–12 diverse terms before rolling content changes across the full corpus.

## Source expansion after UI baseline

The existing historical-source database and extraction ledgers remain authoritative. Additional source witnesses must be onboarded by registering exact editions, reading in source order, recording passage/page locators, separating author text from editor notes, matching existing headwords first and preserving genuine disagreements. Avoid copying copyrighted translation text into the public corpus.

Candidate available sources for the next verified extraction: Sahl and Masha'allah; Bonatti, Abū Maʿshar, al-Bīrūnī, Antiochus and Lilly for corrections/cross-witness checks. Do not claim a source is fully processed until its coverage ledger and audit support it.
