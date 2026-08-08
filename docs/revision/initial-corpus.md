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

## Batch 2 — dignity, sect and clear synonym families

Implemented in `db/seed/0048_cross_source_revision_dignity_sect.sql`.

### Clear synonym normalizations

The completed corpus now supports several merges that were deliberately postponed during extraction:

- Abū Maʿshar’s translated **Domain / ḥayyiz** → canonical **Hayz**.
- al-Bīrūnī’s **Mubtazz** → canonical **Almuten**.
- Antiochus’ **Reciprocal Mastership** → a source-specific reciprocal form of **Reception**.
- Abū Maʿshar’s **Solitary Motion** → **Void of Course**.
- Abū Maʿshar’s **Wild / Wildness** → **Feral**.
- Abū Maʿshar’s **Besieging** → **Besiegement**.

The superseded labels are retained as aliases where useful; the duplicate canonical terms are removed.

### Dignity and debility definitions revised

Publication-quality definitions were written for:

- Domicile
- Exaltation
- Fall
- Detriment
- Face / Decan
- Triplicity Rulers

`Planetary Share` remains a strong source-specific draft rather than being forced into the ordinary essential-dignity hierarchy, because Abū Maʿshar uses the umbrella category more broadly.

### Sect family revised

The revision now cleanly separates:

- Sect — the general diurnal/nocturnal division;
- Diurnal Planet / Nocturnal Planet — membership in the two planetary groups;
- Halb — sect plus correct side of the horizon;
- Hayz — the halb structure plus planetary/sign gender conformity;
- Bonatti’s Own Similitude / Aym — structurally very close to hayz, but retained as a separate source-visible term because the historical naming/equivalence is not clean enough to erase.

Relations now record that halb is a component of hayz and that Bonatti’s own similitude closely corresponds to hayz without asserting an unsupported absolute identity.

### Almuten family revised

Bonatti’s `Almutes / Victor` and al-Bīrūnī’s `Mubtazz` are normalized under **Almuten**: the planet prevailing in a degree, house or topic by the greatest relevant dignity/testimony total.

Lilly’s **Almuten of the Figure** remains a specialization for the planet strongest in the chart as a whole rather than a synonym for every topic-specific almuten.

### Other revised concepts

- Accidental Fortitude — publication-quality definition.
- Besiegement — bodily and ray-based forms are retained as source variants.
- Feral — kept distinct from Void of Course because its no-aspect criterion is stricter.
- Planetary Joy — retained as a strong draft because authors use the language of joy at different levels of breadth.

## Batch 3 — signs, houses, aspects and ascensional relations

Implemented in `db/seed/0049_cross_source_revision_signs_houses_aspects.sql`.

### Normalized terminology

- Bonatti’s **Signs of Direct Ascension** → **Straight / Direct Ascension Signs** with Abū Maʿshar’s straight-rising terminology.
- Bonatti’s **Signs of Crooked Ascension** → **Crooked / Short Ascension Signs** with Abū Maʿshar’s crooked-rising terminology.
- Bonatti’s **Harmonious in Journeys** is normalized as an alias/source form of Abū Maʿshar’s equal-ascensional **Signs Agreeing in Zone** relation because the sign-pairs and structural criterion agree.
- `Movable` is retained as a historical equivalent of **Tropical Sign**; `Common` as a historical equivalent of **Bicorporeal Sign**. Later `Cardinal` and `Mutable` terminology is recorded only as later aliases.

### Pruned as redundant/non-lexical

- Signs that Love Each Other
- Signs that Hate Each Other
- Signs Hostile to Each Other

These labels merely restated trine/sextile, square and opposition by attributed effect and supplied no independent recognition rule.

The provisional `Years, Months, Days and Hours of the Signs` extraction label was also removed as a bundled procedure rather than a stable term; its underlying rising-time and period doctrines remain.

### Definitions revised

Publication-ready or strong definitions now cover:

- Zodiac and Zodiacal Sign
- Triplicity and the three seasonal modalities
- masculine/feminine and diurnal/nocturnal sign classes
- northern/southern signs
- Rising Times and Clime
- straight/direct and crooked/short ascension signs
- agreement in zone, power and path
- obedience, natural sextile and natural opposition
- Antiochus’ co-rising and hearing/seeing relations without forcing uncertain equivalence
- Aspect, Opposition, Trine, Square/Quartile and Sextile
- Partile and Platic/Platick aspects
- Antiscion and Contra-antiscion
- Inconjunct signs
- Twelve Houses / Places
- Angle/Cardine, Succedent and Cadent places
- Derived House
- Antiochus’ places for/without dealings
- First Motion and Second Motion
- Via Combusta

### Missed strong term recovered

Lilly’s Book I explicitly defines **Dexter Aspect** and **Sinister Aspect**, but the extraction pass had not promoted them. They are now first-class terms with A-grade source interpretations and one short public-domain quotation shared by the two entries.

This is exactly the kind of recovery the revision is intended to catch: a real definition omitted during extraction is added, while weak catalogued labels are removed.

## Remaining revision sequence

1. perfection and impediment families beyond the already revised core;
2. lots, degree doctrines and sign subdivisions;
3. horary/interrogational vocabulary;
4. natal, rectification and longevity terminology;
5. predictive/time-lord systems;
6. mundane, electional and weather terminology;
7. author-specific rare terms and uncertain equivalences;
8. final orphan/duplicate/alias/citation audit;
9. frontend generation from canonical reviewed data.

The final pass should leave only A/B interpretations, definitions at quality 4–5 for public entries, and explicit unresolved notes where the corpus genuinely does not permit a clean identification.
