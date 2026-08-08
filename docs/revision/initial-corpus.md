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

## Batch 4 — perfection, mediation and impediment

Implemented in `db/seed/0050_cross_source_revision_perfection_impediments.sql`.

This batch deliberately re-opened the densest perfection passages instead of normalizing from English labels alone.

### Clear normalizations

- Bonatti/Alchabitius **Alitifal / Continuation** → historical aliases of **Application**. Bonatti explicitly defines it as bodily or aspectual application.
- Abū Maʿshar’s **Returning**, al-Bīrūnī’s **Return / radd**, and Bonatti’s **Return of Virtue / Disposition** → one canonical **Return of Virtue / Return (Radd)** mechanism: a debilitated receiver cannot retain what has been given and returns it to the donor.
- Abū Maʿshar’s **Cutting the Light** → canonical **Abscission / Cutting of Light**, together with al-Bīrūnī’s equivalent terminology. The sources preserve several geometries inside this family rather than one universal diagram.
- al-Bīrūnī’s translated **Prevention** is normalized as an alias/form of **Prohibition**, because its direct mechanism matches the interposing-planet doctrine found in the later sources.

### False friends deliberately split

Two cases were previously over-normalized because translators used the same English word:

- **Intervention**: Antiochus defines intervention by a third star casting rays into the intermediate degrees of an application; al-Bīrūnī defines a retrograde three-planet sequence. Antiochus now has the separate entry **Intervention by Rays (Antiochus)**.
- **Frustration**: Lilly’s target perfects another conjunction first; Bonatti’s target leaves the sign and encounters another planet’s rays in the next sign before the original applicant can catch it. Bonatti now has **Frustration (Bonatti)** rather than being forced into Lilly’s definition.

These are explicit examples of the rule that identical translated vocabulary does not prove historical technical identity.

### Important terms revised

Publication-ready definitions now cover:

- Contact / Kollesis
- Natural Application
- Joining by Latitude
- Reflecting the Light
- Giving Nature
- Giving Power
- Giving Two Natures
- Giving Management
- Return of Virtue / radd
- Evasion
- Resistance
- Bonatti’s Contrariety
- al-Bīrūnī’s Intervention
- Antiochus’ Intervention by Rays
- Favour and Recompense
- Lilly’s Frustration and Bonatti’s distinct Frustration

**Abscission / Cutting of Light** remains quality 4 rather than being forced to 5 because the sources clearly use the family for several related interruption geometries.

### Bonatti’s Return of Light corrected

The first extraction represented only one use of **Return of Light**. Re-reading Chapters XI–XII showed that Bonatti uses the label in at least two related but non-identical ways:

1. a collecting planet projects gathered light onward to a zodiacal place it aspects;
2. an intended receiver gives back an earlier applicant’s light after a nearer third planet reaches it first — a configuration Bonatti explicitly also calls **Abscission of Light**.

The old narrow interpretation was removed and replaced with two separate A-grade interpretations. Return of Light therefore remains a source-specific quality-4 entry rather than being falsely merged into either Reflecting the Light or Return of Virtue.

### Related but not merged

Abū Maʿshar’s **Resistance** and Bonatti’s **Contrariety** have an almost identical three-planet retrograde mechanism. They are linked as mechanically corresponding, but remain separate because the current corpus does not establish that the historical terms themselves are identical.

Likewise, Bonatti’s **Opening of the Gates** and al-Bīrūnī’s **Opening the Doors** are explicitly marked distinct: the first concerns reception overcoming planetary hostility, the second is meteorological.

### Quotations

No new public quotations were added in this batch. The key passages are mostly modern translations, and precise locators plus paraphrase are sufficient.

## Batch 5 — lots, degree doctrines and sign subdivisions

Implemented in `db/seed/0051_cross_source_revision_lots_subdivisions.sql`.

### Important repair: Abū Maʿshar Part VIII

The original `0014_abumashar_part8.sql` used the obsolete work slug `great-introduction` for its source-passage and interpretation inserts. The canonical work slug is `abu-mashar-great-introduction`, so those inserts had never attached to Abū Maʿshar even though the term rows themselves existed.

The revision repairs the missing Part VIII passages, interpretations and citation links under the correct work slug rather than hiding the historical seed error.

### Clear normalizations

- al-Bīrūnī’s provisional **Part of Fortune** → canonical **Lot / Part of Fortune**.
- Antiochus’ **Twelfth-part** → canonical **Dodecatemorion / Twelfth-part**. Abū Maʿshar and al-Bīrūnī independently give the same twelvefold 2°30′ structure and multiplication-by-twelve procedure.

The erroneous Antiochus **Ninth-part** remains deleted by `0041_antiochus_correction.sql`; this revision does not reintroduce it.

### Missed strong term recovered

The formal lot doctrine clearly distinguishes two **Natural / Immovable Significators** from the third **Movable Significator / Projection Point**. This was structurally central in Abū Maʿshar and Bonatti but had not been promoted as its own term. It is now a first-class A-grade entry with interpretations from both authors.

### Lot ontology revised

Publication-ready definitions now cover:

- Astrological Lot / Part
- Lot Extraction
- Natural / Immovable Significators
- Movable Significator / Projection Point
- Significators of a Lot
- Planetary Lots
- Lots of the Twelve Places
- Lot / Part of Fortune
- Lot of Absence / Part of the Sun
- Lot / Part of the Haylāǧ

The **Lot of Fortune** definition explicitly preserves formula disagreement rather than pretending that one rule is universal: Abū Maʿshar and Bonatti reverse the luminaries by night, Lilly explicitly keeps the same procedure by day and night, and al-Bīrūnī records both Ptolemy’s unreversed method and the reversing practice of other astrologers.

### Sign subdivisions revised

Publication-ready or strong definitions now cover:

- Dodecatemorion / Twelfth-part
- Ninth / Nawbahar
- Darīǧān / Indian Decan
- Degree Sign-Nature
- Masculine/Feminine Degrees
- Egyptian, Ptolemaic, Chaldean, Asṭraṭū and Indian systems of Terms / Bounds

These alternative systems remain systems *of* terms/bounds, not separate kinds of dignity.

### Degree doctrines revised

- Exaltation Degree — quality 5.
- Planetary Well / Puteal Degree — quality 5, with Bonatti’s puteal/deep terminology retained as aliases.
- Bright, Dusky, Dark and Empty Degrees — quality 4 because the source tradition is explicitly unstable over the dark/dusky/shadowy/smoky vocabulary.
- Degrees Increasing Good Fortune — retained as a named transmitted catalogue category, quality 4.
- Azemene Degree — retained as historical medieval astrological terminology only, quality 4.
- Equal-Power Degrees — quality 4 because Bonatti’s geometric principle is clearer than the inconsistent transmitted numerical examples.

### Quotations

No new quotations were added. Formula differences and degree-catalogue uncertainty are clearer through source-specific paraphrase and precise locators, and most of the relevant texts are modern translations.

## Batch 6 — horary / interrogational vocabulary

Implemented in `db/seed/0052_cross_source_revision_horary.sql`.

### Mention-level material pruned

Abū Maʿshar’s provisional **Astrological Question** entry was removed. Part I merely names questions alongside nativities and annual revolutions; it does not yet define the interrogational technique, so it does not deserve an interpretation once stronger question doctrine is available elsewhere.

### Rooted / radical question normalized

Bonatti’s **Rooted Question** and Lilly’s **Radical Question** use the same core radicality test: agreement between the lord of the hour and the Ascendant or its ruler by identity, triplicity or compatible nature. They are now one canonical **Radical Question**, with Bonatti’s rooted terminology retained as an alias.

### Basic role terms recovered

Lilly gives unusually explicit dictionary-like definitions that had not been promoted as standalone terms. The revision therefore adds:

- **Querent** — the person asking the question;
- **Quesited** — the person, thing or matter sought;
- **Significator** — the appointed planetary factor representing the person or matter in judgment.

**Cosignificator** is also revised as the secondary factor participating alongside a principal significator.

One short Lilly quotation is retained for Querent/Quesited because the wording is genuinely lexical; no additional decorative quotations are added.

### Horary definition and root time revised

**Horary / Interrogational Question** is now defined from actual method rather than by a vague branch label: the figure is rooted in the presented question, the Ascendant and its ruler signify the querent, the relevant house and its ruler signify the matter, and the Moon and other source-specific factors participate.

Lilly’s **Time of the Horary Question** remains a separate technique-level entry. His rule uses the moment the astrologer actually receives and understands the question or intention rather than merely the querent’s arrival or the physical delivery of a letter.

### Bonatti’s question classes preserved without flattening

- **Absolute Question** — asks about a subject generally without specifying a particular instance/source/person.
- **Determinate Question** — restricts the inquiry to a particular instance/source/person.
- **Universal Question** — retained separately at quality 4 because Bonatti’s usage emphasizes breadth and temporal scope; it overlaps with but is not identical to an absolute question.

### Specialized question vocabulary

- **Participator of a Question** — publication-ready source-specific procedure from Bonatti’s 146th Consideration.
- **Abscissor / Destroyer / Obstructor** — retained as a broader destructive planetary role, explicitly distinguished from the individual mechanisms Prohibition, Frustration and Abscission of Light.
- **Thought Reading** — retained only as a contextual boundary entry because al-Bīrūnī explicitly names and criticizes attempts to infer an unstated hidden object or secret thought. It is not presented as standard horary doctrine.

## Remaining revision sequence

1. natal, rectification and longevity terminology;
2. predictive/time-lord systems;
3. mundane, electional and weather terminology;
4. author-specific rare terms and uncertain equivalences;
5. final orphan/duplicate/alias/citation audit;
6. frontend generation from canonical reviewed data.

The final pass should leave only A/B interpretations, definitions at quality 4–5 for public entries, and explicit unresolved notes where the corpus genuinely does not permit a clean identification.
