# Initial corpus — cross-source revision ledger

This ledger tracks the editorial revision performed after completing sequential extraction of the five-source starter corpus.

Sources in scope:

- Antiochus of Athens, *The Thesaurus*
- Abū Maʿshar, *The Great Introduction to Astrology*
- al-Bīrūnī, *The Book of Instruction in the Elements of the Art of Astrology*
- Guido Bonatti, *Liber Astronomiae*
- William Lilly, *Christian Astrology*

The revision is global rather than author-by-author: every canonical term is judged against the strongest evidence available anywhere in the completed corpus.

## Revision tests

For each canonical entry:

1. **Lexicality** — is this actually a named/delimited astrological, astronomical, or historically useful astrological concept?
2. **Definition quality** — does the short definition say what the thing is and how it is recognized?
3. **Source evidence** — does each retained interpretation deserve A (definition) or B (substantial explanation)?
4. **Redundancy** — are weak same-author interpretations duplicated by later stronger evidence?
5. **Identity** — are aliases, variants and near-equivalents being merged or separated correctly?
6. **Disagreement** — are real technical differences visible rather than harmonized away?
7. **Citation** — does each publishable interpretation have a useful source passage?
8. **Quote** — would exact wording genuinely help? If not, no quote is added.

## Batch 1 — core vocabulary and extraction artifacts

Implemented in `db/seed/0047_cross_source_revision_core.sql`.

### Structural changes

`db/migrations/0002_editorial_review.sql` adds:

- `terms.entry_type`
- `terms.definition_quality`
- `interpretations.evidence_grade`

Entry types are `technical`, `astronomical`, and `contextual`.

### Removed as non-lexical public entries

The following were judged to be general natural-philosophical or natural-history topics rather than useful astrological lexicon entries:

- Form
- Natural Composition
- Natured Things
- Coming-to-be and Passing-away
- Ebb and Flow of the Tide

Their historical passages remain part of the searchable source corpus; only the public ontology entries are removed.

### Merged provisional terminology

- `Easternness` → alias of **Orientality**
- `Westernness` → alias of **Occidentality**

The early Abū Maʿshar occurrences were provisional mention-level labels. Later dedicated planetary-condition material supplies the stronger canonical concepts.

### Weak/misfiled interpretations pruned

- Abū Maʿshar’s Part V chapter 1 list occurrences for domicile, exaltation, fall and detriment are removed where later chapters give the substantive doctrine.
- the Indian darīǧān explanation is removed from the ordinary Face/Decan interpretation and remains under the separate Darijan concept.
- Bonatti’s Aym / own-similitude warning is removed as an interpretation of Sect; it is not itself a definition of sect.
- Abū Maʿshar’s tidal/natural applications of waxing and celestial power are removed where they do not add to the definition of those concepts.

### Canonical definitions revised

First publication-quality or strong cross-source definitions were written for:

- Application
- Separation
- Reception
- Terms / Bounds
- Prohibition
- Refranation
- Translation of Light
- Collection of Light
- Frustration
- Void of Course
- Peregrine
- Combustion
- Cazimi
- Under the Sun’s Rays
- Hayz
- Orientality
- Occidentality
- Head / Tail of the Dragon
- Profection
- Solar Revolution
- Transit
- Primary Direction

A major revision principle established here is that the canonical definition must describe **identity**, not attributed effects. The lunar nodes, for example, are defined geometrically; benefic/malefic judgments belong in individual source interpretations.

### Selective quotations

Short quotations were added only where wording is unusually useful. The first batch uses a few compact Lilly definitions for application, reception, peregrination, void-of-course, profection, solar revolution and quincunx.

This is intentionally sparse. Modern translated sources will receive quotations only where terminology, ambiguity or disagreement genuinely benefits from showing the wording.

## Remaining revision sequence

1. dignity / debility / sect families;
2. signs, houses, aspects, ascensions and sign relations;
3. perfection and impediment families beyond the already revised core;
4. lots, degree doctrines and sign subdivisions;
5. horary/interrogational vocabulary;
6. natal, rectification and longevity terminology;
7. predictive/time-lord systems;
8. mundane, electional and weather terminology;
9. author-specific rare terms and uncertain equivalences;
10. final orphan/duplicate/alias/citation audit;
11. frontend generation from canonical reviewed data.

The final pass should leave only A/B interpretations, definitions at quality 4–5 for public entries, and explicit unresolved notes where the corpus genuinely does not permit a clean identification.
