-- Foundation ontology pass: individual signs, traditional planets, primary qualities, and elements.
-- Added after the initial five-source corpus audit so basic reference entities can function as hub pages.
-- Definitions are deliberately structural; source-specific meanings remain in interpretations.

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('aries', 'Aries', 'The first thirty-degree zodiacal sign, belonging to the fiery triplicity and the tropical or movable class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('taurus', 'Taurus', 'The second thirty-degree zodiacal sign, belonging to the earthy triplicity and the fixed class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('gemini', 'Gemini', 'The third thirty-degree zodiacal sign, belonging to the airy triplicity and the bicorporeal class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('cancer', 'Cancer', 'The fourth thirty-degree zodiacal sign, belonging to the watery triplicity and the tropical or movable class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('leo', 'Leo', 'The fifth thirty-degree zodiacal sign, belonging to the fiery triplicity and the fixed class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('virgo', 'Virgo', 'The sixth thirty-degree zodiacal sign, belonging to the earthy triplicity and the bicorporeal class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('libra', 'Libra', 'The seventh thirty-degree zodiacal sign, belonging to the airy triplicity and the tropical or movable class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('scorpio', 'Scorpio', 'The eighth thirty-degree zodiacal sign, belonging to the watery triplicity and the fixed class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('sagittarius', 'Sagittarius', 'The ninth thirty-degree zodiacal sign, belonging to the fiery triplicity and the bicorporeal class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('capricorn', 'Capricorn', 'The tenth thirty-degree zodiacal sign, belonging to the earthy triplicity and the tropical or movable class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('aquarius', 'Aquarius', 'The eleventh thirty-degree zodiacal sign, belonging to the airy triplicity and the fixed class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('pisces', 'Pisces', 'The twelfth thirty-degree zodiacal sign, belonging to the watery triplicity and the bicorporeal class.', 'zodiac sign', 'reviewed', 'Foundation zodiac entity. Keep the public page structural and source-based; do not add modern personality keywords as canonical definition.', 'technical', 5),
  ('saturn', 'Saturn', 'One of the seven traditional planets; in the reviewed corpus it is classified as diurnal and malefic, with a strongly cold and dry attributed nature.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('jupiter', 'Jupiter', 'One of the seven traditional planets; in the reviewed corpus it is classified as diurnal and benefic, with a moderately hot and moist attributed nature.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('mars', 'Mars', 'One of the seven traditional planets; in the reviewed corpus it is classified as nocturnal and malefic, with a strongly hot and dry attributed nature.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('sun', 'Sun', 'One of the two luminaries and one of the seven traditional planets; in the reviewed corpus it is diurnal and assigned a predominantly hot and dry attributed nature.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('venus', 'Venus', 'One of the seven traditional planets; in the reviewed corpus it is classified as nocturnal and benefic, with a moderately cold and moist attributed nature.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('mercury', 'Mercury', 'One of the seven traditional planets; its qualitative, sect, and benefic or malefic classification is treated as unusually variable according to association and condition.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('moon', 'Moon', 'One of the two luminaries and one of the seven traditional planets; in the reviewed corpus it is nocturnal and assigned a generally cold and moist nature whose expression changes with lunar phase.', 'traditional planet', 'reviewed', 'Foundation planetary entity. Canonical definition records stable traditional classification; detailed significations belong in source-specific accounts.', 'astronomical', 5),
  ('hot', 'Hot', 'One of the four primary qualitative predicates used in traditional natural philosophy and astrology, opposed to cold and combined with moist or dry in elemental and planetary natures.', 'primary quality', 'reviewed', 'Foundation natural-philosophical quality used by the astrological sources. Treat as historical technical vocabulary, not a modern personality label.', 'contextual', 4),
  ('cold', 'Cold', 'One of the four primary qualitative predicates used in traditional natural philosophy and astrology, opposed to hot and combined with moist or dry in elemental and planetary natures.', 'primary quality', 'reviewed', 'Foundation natural-philosophical quality used by the astrological sources. Treat as historical technical vocabulary, not a modern personality label.', 'contextual', 4),
  ('moist', 'Moist / Wet', 'One of the four primary qualitative predicates used in traditional natural philosophy and astrology, opposed to dry and combined with hot or cold in elemental and planetary natures.', 'primary quality', 'reviewed', 'Foundation natural-philosophical quality used by the astrological sources. Treat as historical technical vocabulary, not a modern personality label.', 'contextual', 4),
  ('dry', 'Dry', 'One of the four primary qualitative predicates used in traditional natural philosophy and astrology, opposed to moist or wet and combined with hot or cold in elemental and planetary natures.', 'primary quality', 'reviewed', 'Foundation natural-philosophical quality used by the astrological sources. Treat as historical technical vocabulary, not a modern personality label.', 'contextual', 4),
  ('element-fire', 'Fire', 'One of the four sublunary elements or natures, characterized in the astrological elemental scheme as hot and dry and represented zodiacally by Aries, Leo, and Sagittarius.', 'element', 'reviewed', 'Foundation elemental entity. The page should connect natural philosophy, triplicity doctrine, and source-specific usage without importing modern element stereotypes.', 'contextual', 5),
  ('element-earth', 'Earth', 'One of the four sublunary elements or natures, characterized in the astrological elemental scheme as cold and dry and represented zodiacally by Taurus, Virgo, and Capricorn.', 'element', 'reviewed', 'Foundation elemental entity. The page should connect natural philosophy, triplicity doctrine, and source-specific usage without importing modern element stereotypes.', 'contextual', 5),
  ('element-air', 'Air', 'One of the four sublunary elements or natures, characterized in the astrological elemental scheme as hot and moist and represented zodiacally by Gemini, Libra, and Aquarius.', 'element', 'reviewed', 'Foundation elemental entity. The page should connect natural philosophy, triplicity doctrine, and source-specific usage without importing modern element stereotypes.', 'contextual', 5),
  ('element-water', 'Water', 'One of the four sublunary elements or natures, characterized in the astrological elemental scheme as cold and moist and represented zodiacally by Cancer, Scorpio, and Pisces.', 'element', 'reviewed', 'Foundation elemental entity. The page should connect natural philosophy, triplicity doctrine, and source-specific usage without importing modern element stereotypes.', 'contextual', 5);

-- Historical / translation variants useful for lookup.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Wet', 'English', 'translation-variant', 'Common translation variant for the passive quality represented canonically as Moist / Wet.' FROM terms WHERE slug='moist';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Scorpius', 'Latin/English historical', 'source-form', 'Historical Latinized form used in some editions and tables.' FROM terms WHERE slug='scorpio';

-- -----------------------------------------------------------------------------
-- INDIVIDUAL ZODIAC SIGNS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats Aries as the first sign, hot and dry and therefore fiery; it begins a seasonal quadrant and is tropical, masculine and diurnal. In the canonical house scheme Aries is a domicile of Mars.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='aries' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Taurus as cold and dry and therefore earthy; it is fixed, feminine and nocturnal. In the canonical house scheme Taurus is a domicile of Venus.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='taurus' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Gemini as hot and wet and therefore airy; it is bicorporeal, masculine and diurnal. In the canonical house scheme Gemini is a domicile of Mercury.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='gemini' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Cancer as cold and wet and therefore watery; it begins a seasonal quadrant and is tropical, feminine and nocturnal. In the canonical house scheme Cancer is the domicile of the Moon.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='cancer' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Leo as hot and dry and therefore fiery; it is fixed, masculine and diurnal. In the canonical house scheme Leo is the domicile of the Sun.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='leo' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Virgo as cold and dry and therefore earthy; it is bicorporeal, feminine and nocturnal. In the canonical house scheme Virgo is a domicile of Mercury.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='virgo' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Libra as hot and wet and therefore airy; it begins a seasonal quadrant and is tropical, masculine and diurnal. In the canonical house scheme Libra is a domicile of Venus.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='libra' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Scorpio as cold and wet and therefore watery; it is fixed, feminine and nocturnal. In the canonical house scheme Scorpio is a domicile of Mars.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='scorpio' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Sagittarius as hot and dry and therefore fiery; it is bicorporeal, masculine and diurnal. In the canonical house scheme Sagittarius is a domicile of Jupiter.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='sagittarius' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Capricorn as cold and dry and therefore earthy; it begins a seasonal quadrant and is tropical, feminine and nocturnal. In the canonical house scheme Capricorn is a domicile of Saturn.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='capricorn' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Aquarius as hot and wet and therefore airy; it is fixed, masculine and diurnal. In the canonical house scheme Aquarius is a domicile of Saturn.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='aquarius' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar classifies Pisces as cold and wet and therefore watery; it is bicorporeal, feminine and nocturnal. In the canonical house scheme Pisces is a domicile of Jupiter.',
       'Parts II and V: sign nature, modality, polarity/day-night class, and house assignment', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='pisces' AND w.slug='abu-mashar-great-introduction';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('aries', 'taurus', 'gemini', 'cancer', 'leo', 'virgo', 'libra', 'scorpio', 'sagittarius', 'capricorn', 'aquarius', 'pisces')
  AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text IN (
    'Why the twelve zodiacal constellations/signs carry universal indication; division into 360 degrees; derivation of twelve signs and elemental triplicities',
    'Why Aries begins the signs; seasonal quadrants; tropical, fixed, and bicorporeal signs; Hermes/Agathodaimon account',
    'Masculine/feminine signs and diurnal/nocturnal signs',
    'Competing explanations for planetary houses; canonical house assignments; detriment; lot of the nature of the planets'
  );

-- -----------------------------------------------------------------------------
-- INDIVIDUAL TRADITIONAL PLANETS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes Saturn as extremely cold and dry, one of the principal malefics, and diurnal; he assigns Capricorn and Aquarius as its domiciles.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='saturn' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar counts Saturn among the seven planets, classifies it as a principal malefic and a diurnal planet, and assigns Capricorn and Aquarius as its houses.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='saturn' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes Jupiter as moderately hot and moist, one of the principal benefics, and diurnal; he assigns Sagittarius and Pisces as its domiciles.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='jupiter' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar counts Jupiter among the seven planets, classifies it as benefic and diurnal, and assigns Sagittarius and Pisces as its houses.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='jupiter' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes Mars as extremely hot and dry, one of the principal malefics, and nocturnal; he assigns Aries and Scorpio as its domiciles.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='mars' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar counts Mars among the seven planets, classifies it as a principal malefic and a nocturnal planet, and assigns Aries and Scorpio as its houses.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='mars' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes the Sun as strongly hot and dry with heat predominating, classifies it as diurnal, and assigns Leo as its domicile; he treats its benefic or malefic manifestation as dependent on condition and proximity.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='sun' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats the Sun as one of the two luminaries and one of the seven planets, classifies it as diurnal, and assigns Leo as its house.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='sun' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes Venus as moderately cold and moist with moisture predominating, one of the principal benefics, and nocturnal; he assigns Taurus and Libra as its domiciles.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='venus' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar counts Venus among the seven planets, classifies it as benefic and nocturnal, and assigns Taurus and Libra as its houses.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='venus' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī gives Mercury a baseline tendency toward cold and dryness, with dryness stronger, but says association can alter it; he treats Mercury as variable in beneficence and sect and assigns Gemini and Virgo as its domiciles.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='mercury' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats Mercury as the mixed planet whose benefic or malefic, masculine or feminine, and diurnal or nocturnal manifestation changes with association and phase; he assigns Gemini and Virgo as its houses.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='mercury' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Bīrūnī describes the Moon as moderately cold and moist, with the balance altered through its phases and received solar heat; he classifies it as nocturnal and assigns Cancer as its domicile.',
       '§§381-386 and §§440-441', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='moon' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats the Moon as one of the two luminaries and one of the seven planets, classifies it as nocturnal, and assigns Cancer as its house.',
       'Parts III-V: planetary framework, benefic/malefic or mixed class, sect, and houses', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='moon' AND w.slug='abu-mashar-great-introduction';

-- al-Bīrūnī: nature/sect/classification and domicile evidence.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('saturn', 'jupiter', 'mars', 'sun', 'venus', 'mercury', 'moon') AND w.slug='al-biruni-tafhim'
  AND sp.locator_text IN (
    'Planetary natures, beneficence/maleficence, sex and sect',
    'Domiciles, exaltations, triplicity rulers, faces/decanates, terms, ninths, twelfths and degree classes'
  );

-- Abū Maʿshar: seven-planet framework, class, sect, luminaries where relevant, and houses.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('saturn', 'jupiter', 'mars', 'sun', 'venus', 'mercury', 'moon') AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text IN (
    'Why the seven swift-moving planets are used for general indications; contrast with fixed stars',
    'Definition of benefic and malefic through agreement/temperateness versus excess; planetary property; ranking and conditional variation of beneficence and maleficence',
    'Masculine and feminine planets; diurnal and nocturnal planets; modification by easternness, westernness and quadrants',
    'Competing explanations for planetary houses; canonical house assignments; detriment; lot of the nature of the planets'
  );

-- Additional luminary evidence for Sun and Moon.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('sun','moon') AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text='Sun and Moon as luminaries; lunar causation of ebb and flow; strength, timing, local variation, and solar/wind modification';

-- -----------------------------------------------------------------------------
-- PRIMARY QUALITIES
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar uses heat as one of the primary qualities by which sign and planetary natures are described: the fiery and airy triplicities are hot, while planetary heat is treated as an attributed action rather than literal elemental composition.',
       'Parts II and IV: elemental/sign qualities and attributed planetary natures', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='hot' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar uses cold as one of the primary qualities by which sign and planetary natures are described: the earthy and watery triplicities are cold, while planetary coldness is treated as an attributed action rather than literal elemental composition.',
       'Parts II and IV: elemental/sign qualities and attributed planetary natures', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='cold' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar uses wetness or moisture as one of the primary qualities by which sign and planetary natures are described: the airy and watery triplicities are wet, while planetary wetness is treated as an attributed action rather than literal elemental composition.',
       'Parts II and IV: elemental/sign qualities and attributed planetary natures', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='moist' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar uses dryness as one of the primary qualities by which sign and planetary natures are described: the fiery and earthy triplicities are dry, while planetary dryness is treated as an attributed action rather than literal elemental composition.',
       'Parts II and IV: elemental/sign qualities and attributed planetary natures', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='dry' AND w.slug='abu-mashar-great-introduction';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('hot', 'cold', 'moist', 'dry') AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text IN (
    'Why the twelve zodiacal constellations/signs carry universal indication; division into 360 degrees; derivation of twelve signs and elemental triplicities',
    'Planetary natures according to Ptolemy and the common astrologers; critique of deriving planetary nature solely from elemental analogy and colour'
  );

-- -----------------------------------------------------------------------------
-- INDIVIDUAL ELEMENTS / NATURES
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats fire as one of the four mutable elements of the sublunary world and identifies Aries, Leo, and Sagittarius as hot, dry, and fiery, forming the fiery triplicity.',
       'Parts I-II: four elements/natures and zodiacal triplicities', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='element-fire' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats earth as one of the four mutable elements of the sublunary world and identifies Taurus, Virgo, and Capricorn as cold, dry, and earthy, forming the earthy triplicity.',
       'Parts I-II: four elements/natures and zodiacal triplicities', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='element-earth' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats air as one of the four mutable elements of the sublunary world and identifies Gemini, Libra, and Aquarius as hot, wet, and airy, forming the airy triplicity.',
       'Parts I-II: four elements/natures and zodiacal triplicities', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='element-air' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats water as one of the four mutable elements of the sublunary world and identifies Cancer, Scorpio, and Pisces as cold, wet, and watery, forming the watery triplicity.',
       'Parts I-II: four elements/natures and zodiacal triplicities', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w WHERE t.slug='element-water' AND w.slug='abu-mashar-great-introduction';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('element-fire', 'element-earth', 'element-air', 'element-water') AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text IN (
    'On the existence of astrology; two species of the science of the stars',
    'Why the twelve zodiacal constellations/signs carry universal indication; division into 360 degrees; derivation of twelve signs and elemental triplicities',
    'Why Aries begins the signs; seasonal quadrants; tropical, fixed, and bicorporeal signs; Hermes/Agathodaimon account'
  );

-- -----------------------------------------------------------------------------
-- REVIEWED STRUCTURAL RELATIONS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('aries', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('taurus', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('gemini', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('cancer', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('leo', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('virgo', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('libra', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('scorpio', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('sagittarius', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('capricorn', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('aquarius', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('pisces', 'zodiac-sign', 'instance-of', 'This named sign is one of the twelve equal zodiacal signs.'),
    ('aries', 'element-fire', 'belongs-to-triplicity', 'Aries belongs to the fire triplicity in the reviewed traditional sources.'),
    ('aries', 'tropical-sign', 'classified-as', 'Aries is classified as tropical sign in the seasonal modality scheme.'),
    ('aries', 'masculine-sign', 'classified-as', 'Aries belongs to the alternating masculine sign class.'),
    ('aries', 'diurnal-sign', 'classified-as', 'Aries belongs to the alternating diurnal sign class.'),
    ('aries', 'mars', 'domicile-of', 'Aries is a domicile/house of Mars in the canonical traditional house scheme.'),
    ('taurus', 'element-earth', 'belongs-to-triplicity', 'Taurus belongs to the earth triplicity in the reviewed traditional sources.'),
    ('taurus', 'fixed-sign', 'classified-as', 'Taurus is classified as fixed sign in the seasonal modality scheme.'),
    ('taurus', 'feminine-sign', 'classified-as', 'Taurus belongs to the alternating feminine sign class.'),
    ('taurus', 'nocturnal-sign', 'classified-as', 'Taurus belongs to the alternating nocturnal sign class.'),
    ('taurus', 'venus', 'domicile-of', 'Taurus is a domicile/house of Venus in the canonical traditional house scheme.'),
    ('gemini', 'element-air', 'belongs-to-triplicity', 'Gemini belongs to the air triplicity in the reviewed traditional sources.'),
    ('gemini', 'bicorporeal-sign', 'classified-as', 'Gemini is classified as bicorporeal sign in the seasonal modality scheme.'),
    ('gemini', 'masculine-sign', 'classified-as', 'Gemini belongs to the alternating masculine sign class.'),
    ('gemini', 'diurnal-sign', 'classified-as', 'Gemini belongs to the alternating diurnal sign class.'),
    ('gemini', 'mercury', 'domicile-of', 'Gemini is a domicile/house of Mercury in the canonical traditional house scheme.'),
    ('cancer', 'element-water', 'belongs-to-triplicity', 'Cancer belongs to the water triplicity in the reviewed traditional sources.'),
    ('cancer', 'tropical-sign', 'classified-as', 'Cancer is classified as tropical sign in the seasonal modality scheme.'),
    ('cancer', 'feminine-sign', 'classified-as', 'Cancer belongs to the alternating feminine sign class.'),
    ('cancer', 'nocturnal-sign', 'classified-as', 'Cancer belongs to the alternating nocturnal sign class.'),
    ('cancer', 'moon', 'domicile-of', 'Cancer is a domicile/house of Moon in the canonical traditional house scheme.'),
    ('leo', 'element-fire', 'belongs-to-triplicity', 'Leo belongs to the fire triplicity in the reviewed traditional sources.'),
    ('leo', 'fixed-sign', 'classified-as', 'Leo is classified as fixed sign in the seasonal modality scheme.'),
    ('leo', 'masculine-sign', 'classified-as', 'Leo belongs to the alternating masculine sign class.'),
    ('leo', 'diurnal-sign', 'classified-as', 'Leo belongs to the alternating diurnal sign class.'),
    ('leo', 'sun', 'domicile-of', 'Leo is a domicile/house of Sun in the canonical traditional house scheme.'),
    ('virgo', 'element-earth', 'belongs-to-triplicity', 'Virgo belongs to the earth triplicity in the reviewed traditional sources.'),
    ('virgo', 'bicorporeal-sign', 'classified-as', 'Virgo is classified as bicorporeal sign in the seasonal modality scheme.'),
    ('virgo', 'feminine-sign', 'classified-as', 'Virgo belongs to the alternating feminine sign class.'),
    ('virgo', 'nocturnal-sign', 'classified-as', 'Virgo belongs to the alternating nocturnal sign class.'),
    ('virgo', 'mercury', 'domicile-of', 'Virgo is a domicile/house of Mercury in the canonical traditional house scheme.'),
    ('libra', 'element-air', 'belongs-to-triplicity', 'Libra belongs to the air triplicity in the reviewed traditional sources.'),
    ('libra', 'tropical-sign', 'classified-as', 'Libra is classified as tropical sign in the seasonal modality scheme.'),
    ('libra', 'masculine-sign', 'classified-as', 'Libra belongs to the alternating masculine sign class.'),
    ('libra', 'diurnal-sign', 'classified-as', 'Libra belongs to the alternating diurnal sign class.'),
    ('libra', 'venus', 'domicile-of', 'Libra is a domicile/house of Venus in the canonical traditional house scheme.'),
    ('scorpio', 'element-water', 'belongs-to-triplicity', 'Scorpio belongs to the water triplicity in the reviewed traditional sources.'),
    ('scorpio', 'fixed-sign', 'classified-as', 'Scorpio is classified as fixed sign in the seasonal modality scheme.'),
    ('scorpio', 'feminine-sign', 'classified-as', 'Scorpio belongs to the alternating feminine sign class.'),
    ('scorpio', 'nocturnal-sign', 'classified-as', 'Scorpio belongs to the alternating nocturnal sign class.'),
    ('scorpio', 'mars', 'domicile-of', 'Scorpio is a domicile/house of Mars in the canonical traditional house scheme.'),
    ('sagittarius', 'element-fire', 'belongs-to-triplicity', 'Sagittarius belongs to the fire triplicity in the reviewed traditional sources.'),
    ('sagittarius', 'bicorporeal-sign', 'classified-as', 'Sagittarius is classified as bicorporeal sign in the seasonal modality scheme.'),
    ('sagittarius', 'masculine-sign', 'classified-as', 'Sagittarius belongs to the alternating masculine sign class.'),
    ('sagittarius', 'diurnal-sign', 'classified-as', 'Sagittarius belongs to the alternating diurnal sign class.'),
    ('sagittarius', 'jupiter', 'domicile-of', 'Sagittarius is a domicile/house of Jupiter in the canonical traditional house scheme.'),
    ('capricorn', 'element-earth', 'belongs-to-triplicity', 'Capricorn belongs to the earth triplicity in the reviewed traditional sources.'),
    ('capricorn', 'tropical-sign', 'classified-as', 'Capricorn is classified as tropical sign in the seasonal modality scheme.'),
    ('capricorn', 'feminine-sign', 'classified-as', 'Capricorn belongs to the alternating feminine sign class.'),
    ('capricorn', 'nocturnal-sign', 'classified-as', 'Capricorn belongs to the alternating nocturnal sign class.'),
    ('capricorn', 'saturn', 'domicile-of', 'Capricorn is a domicile/house of Saturn in the canonical traditional house scheme.'),
    ('aquarius', 'element-air', 'belongs-to-triplicity', 'Aquarius belongs to the air triplicity in the reviewed traditional sources.'),
    ('aquarius', 'fixed-sign', 'classified-as', 'Aquarius is classified as fixed sign in the seasonal modality scheme.'),
    ('aquarius', 'masculine-sign', 'classified-as', 'Aquarius belongs to the alternating masculine sign class.'),
    ('aquarius', 'diurnal-sign', 'classified-as', 'Aquarius belongs to the alternating diurnal sign class.'),
    ('aquarius', 'saturn', 'domicile-of', 'Aquarius is a domicile/house of Saturn in the canonical traditional house scheme.'),
    ('pisces', 'element-water', 'belongs-to-triplicity', 'Pisces belongs to the water triplicity in the reviewed traditional sources.'),
    ('pisces', 'bicorporeal-sign', 'classified-as', 'Pisces is classified as bicorporeal sign in the seasonal modality scheme.'),
    ('pisces', 'feminine-sign', 'classified-as', 'Pisces belongs to the alternating feminine sign class.'),
    ('pisces', 'nocturnal-sign', 'classified-as', 'Pisces belongs to the alternating nocturnal sign class.'),
    ('pisces', 'jupiter', 'domicile-of', 'Pisces is a domicile/house of Jupiter in the canonical traditional house scheme.'),
    ('saturn', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('saturn', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('saturn', 'diurnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('saturn', 'malefic', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('saturn', 'cold', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('saturn', 'dry', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('jupiter', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('jupiter', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('jupiter', 'diurnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('jupiter', 'benefic', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('jupiter', 'hot', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('jupiter', 'moist', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mars', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('mars', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('mars', 'nocturnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mars', 'malefic', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mars', 'hot', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mars', 'dry', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('sun', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('sun', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('sun', 'diurnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('sun', 'luminaries', 'member-of', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('sun', 'hot', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('sun', 'dry', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('venus', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('venus', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('venus', 'nocturnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('venus', 'benefic', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('venus', 'cold', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('venus', 'moist', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mercury', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('mercury', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('mercury', 'mixed-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('mercury', 'cold', 'baseline-nature-quality', 'Al-Bīrūnī gives this as Mercury’s baseline tendency but explicitly says association can alter it.'),
    ('mercury', 'dry', 'baseline-nature-quality', 'Al-Bīrūnī gives this as Mercury’s baseline tendency but explicitly says association can alter it.'),
    ('moon', 'seven-planets', 'member-of', 'This body belongs to the seven traditional planets used in the initial corpus.'),
    ('moon', 'planetary-nature', 'described-by', 'Its source accounts participate in the doctrine of attributed planetary nature.'),
    ('moon', 'nocturnal-planet', 'classified-as', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('moon', 'luminaries', 'member-of', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('moon', 'cold', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('moon', 'moist', 'has-nature-quality', 'Reviewed traditional classification drawn from Abū Maʿshar and/or al-Bīrūnī.'),
    ('element-fire', 'four-elements', 'member-of', 'Fire is one of the four mutable sublunary elements/natures.'),
    ('element-fire', 'hot', 'has-quality', 'Fire is characterized by the hot quality in the traditional elemental scheme.'),
    ('element-fire', 'dry', 'has-quality', 'Fire is characterized by the dry quality in the traditional elemental scheme.'),
    ('element-fire', 'triplicity', 'structures', 'The fire element supplies the common nature of one zodiacal triplicity.'),
    ('element-earth', 'four-elements', 'member-of', 'Earth is one of the four mutable sublunary elements/natures.'),
    ('element-earth', 'cold', 'has-quality', 'Earth is characterized by the cold quality in the traditional elemental scheme.'),
    ('element-earth', 'dry', 'has-quality', 'Earth is characterized by the dry quality in the traditional elemental scheme.'),
    ('element-earth', 'triplicity', 'structures', 'The earth element supplies the common nature of one zodiacal triplicity.'),
    ('element-air', 'four-elements', 'member-of', 'Air is one of the four mutable sublunary elements/natures.'),
    ('element-air', 'hot', 'has-quality', 'Air is characterized by the hot quality in the traditional elemental scheme.'),
    ('element-air', 'moist', 'has-quality', 'Air is characterized by the moist quality in the traditional elemental scheme.'),
    ('element-air', 'triplicity', 'structures', 'The air element supplies the common nature of one zodiacal triplicity.'),
    ('element-water', 'four-elements', 'member-of', 'Water is one of the four mutable sublunary elements/natures.'),
    ('element-water', 'cold', 'has-quality', 'Water is characterized by the cold quality in the traditional elemental scheme.'),
    ('element-water', 'moist', 'has-quality', 'Water is characterized by the moist quality in the traditional elemental scheme.'),
    ('element-water', 'triplicity', 'structures', 'The water element supplies the common nature of one zodiacal triplicity.'),
    ('hot', 'cold', 'opposed-to', 'Hot and cold are the paired active primary qualities.'),
    ('moist', 'dry', 'opposed-to', 'Moist/wet and dry are the paired passive primary qualities.'),
    ('hot', 'planetary-nature', 'used-in-classification', 'This primary quality is used in source descriptions of planetary nature.'),
    ('cold', 'planetary-nature', 'used-in-classification', 'This primary quality is used in source descriptions of planetary nature.'),
    ('moist', 'planetary-nature', 'used-in-classification', 'This primary quality is used in source descriptions of planetary nature.'),
    ('dry', 'planetary-nature', 'used-in-classification', 'This primary quality is used in source descriptions of planetary nature.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
