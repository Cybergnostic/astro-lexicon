# Ontology

## Goal

Model traditional astrological terminology in a way that preserves historical and doctrinal distinctions.

The encyclopedia should not assume that similar wording across authors means identical concepts.

## Core entities

### Term
A canonical encyclopedia concept.

Fields:
- `slug`
- `label`
- `short_definition`
- `status` — draft, reviewed, published
- `category`
- `notes`

### Alias
A historically attested, translated, spelling, transliteration, or editorial variant that points to a term without implying total semantic equivalence.

Fields:
- `term_id`
- `label`
- `language`
- `alias_type`
- `scope_note`

Suggested alias types:
- spelling
- translation
- transliteration
- historical synonym
- approximate synonym
- editorial normalization

### Author
Historical or modern author associated with a work.

### Work
A specific textual work, with edition and translation information kept separately where necessary.

### Edition
A publication/translation witness used for page references and quotations.

### Source Passage
A passage from an edition used as evidence.

Fields:
- `edition_id`
- `page_start`
- `page_end`
- `section`
- `locator_text`
- `quote`
- `internal_notes`

### Interpretation
A structured statement of how a particular author/work treats a term.

Fields:
- `term_id`
- `work_id`
- `summary`
- `scope`
- `certainty`

### Citation
Links an interpretation or encyclopedia claim to a source passage.

### Term Relation
Explicit relation between concepts.

Initial relation types:
- broader-than
- narrower-than
- related-to
- contrasted-with
- historically-associated-with
- sometimes-confused-with
- possibly-equivalent-to

Do not use `equivalent-to` without editorial confirmation.

## Editorial rule: concept identity

Two labels should be merged into one canonical term only when the sources and historical context support treating them as the same technical concept.

Similarity in modern English translation is not enough.

When uncertain:
1. keep separate term records;
2. create a relation such as `possibly-equivalent-to` or `sometimes-confused-with`;
3. attach an editorial note;
4. revisit after additional sources are indexed.

## Historical layers

Each interpretation may optionally be tagged with a broad historical layer for browsing, but these labels are descriptive metadata, not doctrinal assumptions.

Initial controlled values:
- Hellenistic
- Late Antique
- Arabic/Persian
- Medieval Latin
- Renaissance/Early Modern
- Modern Traditional

## Categories

The category system should emerge from the corpus rather than being fully imposed in advance. Initial broad categories may include:

- astronomical foundations
- zodiac and signs
- planets
- essential dignity
- accidental condition
- sect and planetary condition
- aspects and configurations
- application and perfection
- houses/places
- lots
- natal technique
- horary technique
- elections
- mundane astrology
- timing techniques
- medical astrology
- meteorological astrology
- technical calculations
- philosophical foundations

These are provisional and may be split or renamed as the corpus develops.
