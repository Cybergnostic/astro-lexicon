# Abū Maʿshar — Part VIII extraction notes

Status: reviewed completely, Chapters 1–9, in sequential reading order.

Source: *The Great Introduction to Astrology*, ed. and trans. Keiji Yamamoto and Charles Burnett, Brill, 2019.

## Scope

Part VIII is a systematic treatment of lots. It explains why lots are extracted, defines their formal structure, classifies the traditional lots, gives the seven planetary lots, the lots connected with the twelve places, additional lots not belonging to either class, a compact list of the complete corpus, rules for coincident lots, general interpretive rules, and a final algebraic procedure for recovering one unknown indicator from the other known positions.

## Core doctrine

### Chapter 1 — rationale and definition

Abū Maʿshar does not present lots as arbitrary symbolic points. A lot is constructed from multiple indicators that naturally signify the same topic. Two indicators are treated as fixed in their natural signification, while a third indicator is movable and provides the place from which their distance is projected.

His formal definition makes the concept relational: the lot captures the distance between two natural indicators and locates that relationship at another place of the sphere. The ascendant is the normal movable reference because it signifies bodies and beginnings, but another relevant place or planet can be used where the subject requires it.

All lot calculations use equal zodiacal degrees, not rising-time degrees.

### Chapter 2 — classification

Abū Maʿshar says the authenticated lots preserved by earlier Persian, Babylonian, and Egyptian astrologers total 97 and fall into three classes:

- seven planetary lots;
- eighty lots associated with the twelve places;
- ten additional lots not assigned either to the seven planets or to the twelve places.

This classification is important for ontology. The 97 named lots are source data, but not every named lot should automatically become a top-level dictionary concept. Many are better represented as members of a lot catalogue attached to the canonical concept `Lot`.

### Chapter 3 — planetary lots and Fortune/Absence

The Lot of Fortune is taken from Sun to Moon by day and Moon to Sun by night, projected from the ascendant. Abū Maʿshar identifies it with the Moon and calls it the highest and most eminent of the lots.

The Lot of Absence reverses that luminary formula: Moon to Sun by day and Sun to Moon by night. It is treated as the solar counterpart to Fortune. The source also records disagreement in naming, with some astrologers reversing which of the two is called the solar or lunar lot.

The other planetary lots are associated with Saturn, Jupiter, Mars, Venus, and Mercury and are derived through source-specific formulas. Their names and meanings should remain attributable to Abū Maʿshar rather than treated as universally standardized.

### Chapter 4 — lots of the twelve places

The chapter expands the eighty place-related lots. Abū Maʿshar repeatedly notes variant formulas attributed to Hermes, Wālīs, Persians, Tawfīl, and others, and sometimes explicitly judges one procedure more correct than another.

This is evidence that a modern database must store lot formula by source/authority, not merely one canonical formula per lot name.

### Chapter 5 — ten additional lots

The ten extra lots include the Lot of the Haylāǧ, the lot concerning bodily emaciation, lots of chivalry/courage, cunning, necessity, recompense, and right action.

The Lot of the Haylāǧ is especially important. It is extracted from the prenatal conjunction or opposition to the Moon and is then moved through degrees and signs. It should remain distinct from the haylāǧ itself.

### Chapter 6 — summary catalogue

Chapter 6 repeats the complete system in compact form. The repetition functions almost like a reference table and confirms many formulas given in the preceding chapters.

Where the compact catalogue differs from earlier explanatory passages or where manuscript/translation notes show disagreement, the difference should be retained rather than silently harmonized.

### Chapter 7 — coincidence of lots

Multiple lots can coincide in the same position because different formulas can resolve to the same degree. Coincidence does not erase their different thematic origins. The same zodiacal point may therefore carry several distinct lot identities.

This supports modelling `lot position` separately from `lot identity` in any future computational implementation.

### Chapter 8 — general interpretation

A lot can have one, two, or three general indicators depending on the construction and the place in which it falls. The lord of the place of the lot is especially important. A lot is strongest when all relevant indicators aspect it.

If none of its indicators aspects it, Abū Maʿshar describes the indication as weak and liable to remain at the level of thoughts, expectations, or unrealized matters.

A planet that naturally signifies the subject can still contribute when the formal indicators do not aspect the lot, but this is weaker and more partial. Benefic/malefic condition, reception, angularity/cadency, retrogradation, fall, and the nature of the aspect modify the outcome.

### Chapter 9 — reconstruction of unknown positions

The last chapter treats a lot formula algebraically. There are four positions in the construction: first indicator, second indicator, casting point, and resulting lot. If three are known, the fourth can be reconstructed by reversing the calculation.

This is not a separate divinatory doctrine so much as a mathematical consequence of the lot formula, but it is technically important for implementation and for understanding the internal logic of the system.

## Editorial decisions

1. `Lot` is the canonical umbrella concept. `Part` is retained as a translation alias, not a separate ontology node by default.
2. The 97 lots are not automatically 97 independent top-level lexicon terms. They should be stored in a structured lot catalogue, with individual promotion only when historical importance or cross-source recurrence justifies it.
3. Lot formulas are source-specific. Variant procedures by Hermes, Wālīs, Persians, Tawfīl, and other authorities must remain distinct.
4. Day/night reversal is part of the formula and cannot be stripped away as implementation detail.
5. The Lot of Fortune and Lot of Absence are paired but not interchangeable.
6. The Lot of the Haylāǧ is related to predictive haylāǧ doctrine but is not the haylāǧ itself.
7. A lot's identity must remain separate from its calculated zodiacal position; different lots can coincide at one degree.
8. General interpretation depends on formal indicators, the lord of the lot's place, aspects, reception, and planetary condition. A lot should not be interpreted from sign placement alone.
9. The source itself acknowledges disagreement and later innovation in the construction of lots. Those disagreements are part of the historical data.
10. Public text should paraphrase this copyrighted edition and cite it, not reproduce the long catalogues verbatim.

## Completion

With Part VIII Chapter 9, the Arabic/English text explicitly states that Abū Maʿshar's *Introduction* is complete. The sequential review of Parts I–VIII is therefore complete for the main Arabic/English work.

The remainder of Volume 2 contains the Greek version, glossaries, and indexes. Those are valuable secondary witnesses and research aids, but they are not a further ninth part of the work. They should be handled later as textual apparatus and cross-linguistic evidence rather than as unread chapters of the main treatise.
