-- Encyclopedia conversion batch: twelve zodiac signs.
--
-- This is not a new doctrine-extraction pass. It converts already canonical and
-- historically attested sign structure into reader-facing articles, while leaving
-- source-variable classifications and descriptive attributions in their individual
-- source accounts until explicitly reconciled.

-- Helper pattern: each sign gets a reviewed intro plus structural, dignity, and
-- historical-reading sections. Source accounts remain visible separately.

-- ARIES
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Aries is the first sign of the tropical zodiac. In the standard traditional scheme it is a fiery, movable or cardinal, masculine and diurnal sign ruled by Mars. Its place in the zodiac begins the northern half of the ecliptic and marks the vernal equinox in the tropical framework.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='aries';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Aries belongs to the fire triplicity and the movable or cardinal quadruplicity. It is traditionally classed as masculine and diurnal. In the usual northern-hemisphere ascensional scheme it belongs to the short- or crooked-ascension signs.',10,'reviewed'
FROM terms WHERE slug='aries';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Mars has domicile in Aries and the Sun is exalted there. Venus is in detriment or exile in Aries, while Saturn is in fall. Fire-triplicity rulership is sect-sensitive, so the operative triplicity ruler depends on whether the figure is diurnal or nocturnal.',20,'reviewed'
FROM terms WHERE slug='aries';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Historical authors attach additional classifications and practical meanings to Aries, but those should not be collapsed into a single timeless personality description. The source accounts below preserve individual attributions so agreements, disagreements and changes of terminology remain visible.',30,'reviewed'
FROM terms WHERE slug='aries';

-- TAURUS
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Taurus is the second sign of the tropical zodiac. In the standard traditional scheme it is an earthy, fixed, feminine and nocturnal sign ruled by Venus. It follows the vernal equinox and represents the fixed phase of the spring quarter in the tropical zodiac.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='taurus';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Taurus belongs to the earth triplicity and the fixed quadruplicity. It is traditionally feminine and nocturnal. In the usual northern-hemisphere ascensional scheme Taurus belongs to the short- or crooked-ascension signs.',10,'reviewed'
FROM terms WHERE slug='taurus';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Venus has domicile in Taurus and the Moon is exalted there. Mars is in detriment or exile in Taurus. The earth triplicity has its own sect-sensitive rulers, distinct from Venus''s domicile rulership.',20,'reviewed'
FROM terms WHERE slug='taurus';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Traditional sources add further classifications concerning form, fertility, voice and practical significations. Those attributions can vary by author, so the encyclopedia keeps them source-attributed rather than blending them into one synthetic list.',30,'reviewed'
FROM terms WHERE slug='taurus';

-- GEMINI
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Gemini is the third sign of the tropical zodiac. It is traditionally airy, bicorporeal or common, masculine and diurnal, with Mercury as its domicile ruler. As the final sign of the spring quarter it combines the air triplicity with the transitional quality of the common signs.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='gemini';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Gemini belongs to the air triplicity and to the common, mutable or bicorporeal quadruplicity. It is masculine and diurnal. In the usual northern-hemisphere ascensional scheme it is the last of the short- or crooked-ascension signs.',10,'reviewed'
FROM terms WHERE slug='gemini';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Mercury has domicile in Gemini. Jupiter is in detriment or exile there. Unlike several other signs, Gemini has no universally standard planetary exaltation in the common medieval dignity table. Air-triplicity rulership remains a separate, sect-sensitive dignity.',20,'reviewed'
FROM terms WHERE slug='gemini';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Gemini receives many additional historical classifications because its double-bodied image, human form and mercurial rulership invite several technical associations. These are retained as source-specific accounts rather than treated as interchangeable modern keywords.',30,'reviewed'
FROM terms WHERE slug='gemini';

-- CANCER
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Cancer is the fourth sign of the tropical zodiac and begins the summer quarter. It is traditionally watery, movable or cardinal, feminine and nocturnal, and is the sole domicile of the Moon. In the tropical zodiac the Sun''s ingress into Cancer marks the northern solstice.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='cancer';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Cancer belongs to the water triplicity and the movable or cardinal quadruplicity. It is traditionally feminine and nocturnal. In the usual northern-hemisphere ascensional scheme Cancer begins the long- or direct-ascension half of the zodiac.',10,'reviewed'
FROM terms WHERE slug='cancer';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'The Moon has domicile in Cancer and Jupiter is exalted there. Saturn is in detriment or exile in Cancer, while Mars is in fall. Water-triplicity rulership is an additional dignity system whose operative ruler depends on sect.',20,'reviewed'
FROM terms WHERE slug='cancer';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Historical authors attach further bodily, fertility, climatic and practical classifications to Cancer. Because those attributions belong to particular technical contexts, they remain separately attributable in the source accounts below.',30,'reviewed'
FROM terms WHERE slug='cancer';

-- LEO
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Leo is the fifth sign of the tropical zodiac. It is traditionally fiery, fixed, masculine and diurnal, and is the sole domicile of the Sun. It occupies the fixed phase of the summer quarter and belongs to the fire triplicity.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='leo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Leo belongs to the fire triplicity and fixed quadruplicity and is classed as masculine and diurnal. In the usual northern-hemisphere ascensional scheme it is a long- or direct-ascension sign.',10,'reviewed'
FROM terms WHERE slug='leo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'The Sun has domicile in Leo and Saturn is in detriment or exile there. Leo has no universally standard planetary exaltation in the common medieval table. Fire-triplicity rulers provide an additional sect-sensitive layer of essential dignity.',20,'reviewed'
FROM terms WHERE slug='leo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Descriptions of Leo in historical texts often combine its solar rulership, fixed quality and leonine image with additional classifications. The encyclopedia preserves those statements by source rather than replacing them with a single modern personality profile.',30,'reviewed'
FROM terms WHERE slug='leo';

-- VIRGO
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Virgo is the sixth sign of the tropical zodiac. It is traditionally earthy, common or bicorporeal, feminine and nocturnal, and ruled by Mercury. It closes the summer quarter and combines earth-triplicity qualities with the transitional structure of a common sign.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='virgo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Virgo belongs to the earth triplicity and to the common, mutable or bicorporeal quadruplicity. It is traditionally feminine and nocturnal. In the usual northern-hemisphere ascensional scheme Virgo is a long- or direct-ascension sign.',10,'reviewed'
FROM terms WHERE slug='virgo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Mercury both rules and is exalted in Virgo in the standard medieval dignity scheme. Jupiter is in detriment or exile there, while Venus is in fall. Earth-triplicity rulership remains a separate sect-sensitive dignity.',20,'reviewed'
FROM terms WHERE slug='virgo';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Virgo has accumulated numerous historical classifications concerning human form, fertility, voice and practical matters. These do not all have identical scope across authors, so they are best read through the separate source witnesses below.',30,'reviewed'
FROM terms WHERE slug='virgo';

-- LIBRA
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Libra is the seventh sign of the tropical zodiac and begins the autumn quarter. It is traditionally airy, movable or cardinal, masculine and diurnal, ruled by Venus, with Saturn exalted there. In the tropical framework the Sun''s ingress into Libra marks the autumnal equinox and the beginning of the southern half of the zodiac.',
  'reviewed','Evidence-rich sign conversion prompted by the large gap between Libra source evidence and its previously thin public entry.'
FROM terms WHERE slug='libra';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Libra belongs to the air triplicity and the movable or cardinal quadruplicity. It is traditionally masculine and diurnal. Lilly also places Libra among the southern signs. In the usual northern-hemisphere ascensional scheme Libra is a long- or direct-ascension sign.',10,'reviewed'
FROM terms WHERE slug='libra';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Venus has domicile in Libra and Saturn is exalted there. Mars is in detriment or exile in Libra, while the Sun is in fall. The air triplicity adds sect-sensitive rulers—distinct from Venus''s domicile rulership and Saturn''s exaltation.',20,'reviewed'
FROM terms WHERE slug='libra';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relational-classes','Relations to other signs',
  'Traditional authors classify signs through several relational systems in addition to element and modality. Libra participates in ascensional and commanding/obeying schemes, but the exact equivalences and pairings are not uniform across every authority. These relations should therefore be read together with their source-specific accounts rather than flattened into a single universal table.',30,'reviewed'
FROM terms WHERE slug='libra';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Why Libra has many source accounts',
  'A sign is not defined by one list of personality adjectives. Historical sources describe Libra through multiple technical layers: planetary rulership, exaltation and debility, elemental and seasonal classification, polarity, ascensional behavior, sign pairings and other specialized categories. The source accounts below preserve these attributions individually so the reader can see both the shared structure and the differences between authors.',40,'reviewed'
FROM terms WHERE slug='libra';

-- SCORPIO
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Scorpio is the eighth sign of the tropical zodiac. In the traditional seven-planet system it is watery, fixed, feminine and nocturnal, with Mars as its domicile ruler. It occupies the fixed phase of the autumn quarter and belongs to the water triplicity.',
  'reviewed','Evidence-rich sign conversion. No modern outer-planet rulership is introduced.'
FROM terms WHERE slug='scorpio';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Scorpio belongs to the water triplicity and fixed quadruplicity and is traditionally feminine and nocturnal. Lilly places it among the southern signs, and in the usual northern-hemisphere ascensional scheme it is a long- or direct-ascension sign.',10,'reviewed'
FROM terms WHERE slug='scorpio';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Mars has domicile in Scorpio and Venus is in detriment or exile there. Scorpio has no universally standard planetary exaltation in the common medieval table. Water-triplicity rulers provide an additional sect-sensitive dignity layer.',20,'reviewed'
FROM terms WHERE slug='scorpio';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Scorpio receives numerous traditional classifications connected with its animal image, fertility, voice and practical signification. Because historical authors do not always use those categories identically, the encyclopedia keeps their statements source-specific.',30,'reviewed'
FROM terms WHERE slug='scorpio';

-- SAGITTARIUS
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Sagittarius is the ninth sign of the tropical zodiac. It is traditionally fiery, common or bicorporeal, masculine and diurnal, and ruled by Jupiter. It closes the autumn quarter and combines the fire triplicity with the transitional structure of a common sign.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='sagittarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Sagittarius belongs to the fire triplicity and to the common, mutable or bicorporeal quadruplicity. It is traditionally masculine and diurnal. Lilly places it among the southern signs, and in the usual northern-hemisphere ascensional scheme it is a long- or direct-ascension sign.',10,'reviewed'
FROM terms WHERE slug='sagittarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Jupiter has domicile in Sagittarius and Mercury is in detriment or exile there. Sagittarius has no universally standard planetary exaltation in the common medieval table. Fire-triplicity rulership supplies an additional sect-sensitive dignity.',20,'reviewed'
FROM terms WHERE slug='sagittarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'The centaur or double-bodied imagery of Sagittarius produces additional historical classifications concerning human and animal form, voice and practical topics. These are best kept attributable to the authors who use them.',30,'reviewed'
FROM terms WHERE slug='sagittarius';

-- CAPRICORN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Capricorn is the tenth sign of the tropical zodiac and begins the winter quarter. It is traditionally earthy, movable or cardinal, feminine and nocturnal, and ruled by Saturn. In the tropical framework the Sun''s ingress into Capricorn marks the southern solstice.',
  'reviewed','Evidence-rich sign conversion. Source-variable descriptive traits remain in source accounts.'
FROM terms WHERE slug='capricorn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Capricorn belongs to the earth triplicity and the movable or cardinal quadruplicity. It is traditionally feminine and nocturnal. Lilly places it among the southern signs, and in the usual northern-hemisphere ascensional scheme Capricorn begins the short- or crooked-ascension half of the zodiac.',10,'reviewed'
FROM terms WHERE slug='capricorn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Saturn has domicile in Capricorn and Mars is exalted there. The Moon is in detriment or exile in Capricorn, while Jupiter is in fall. Earth-triplicity rulership supplies an additional sect-sensitive dignity layer.',20,'reviewed'
FROM terms WHERE slug='capricorn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Capricorn''s historical classifications reflect both its seasonal position and its composite animal image. Those details can vary substantially across texts, so the source accounts are retained as attributable evidence rather than fused into one personality description.',30,'reviewed'
FROM terms WHERE slug='capricorn';

-- AQUARIUS
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Aquarius is the eleventh sign of the tropical zodiac. In the traditional seven-planet system it is airy, fixed, masculine and diurnal, with Saturn as its domicile ruler. It occupies the fixed phase of the winter quarter and belongs to the air triplicity.',
  'reviewed','Evidence-rich sign conversion. No modern outer-planet rulership is introduced.'
FROM terms WHERE slug='aquarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Aquarius belongs to the air triplicity and fixed quadruplicity and is traditionally masculine and diurnal. Lilly places it among the southern signs, and in the usual northern-hemisphere ascensional scheme it is a short- or crooked-ascension sign.',10,'reviewed'
FROM terms WHERE slug='aquarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Saturn has domicile in Aquarius and the Sun is in detriment or exile there. Aquarius has no universally standard planetary exaltation in the common medieval table. Air-triplicity rulers provide a separate sect-sensitive form of essential dignity.',20,'reviewed'
FROM terms WHERE slug='aquarius';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Historical authors add human-form, voice, fertility and other classifications to Aquarius. These belong to technical taxonomies that may differ by source and should not be replaced by modern Uranian interpretations.',30,'reviewed'
FROM terms WHERE slug='aquarius';

-- PISCES
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Pisces is the twelfth sign of the tropical zodiac. It is traditionally watery, common or bicorporeal, feminine and nocturnal, and ruled by Jupiter. It closes the winter quarter and the zodiacal cycle, combining the water triplicity with the transitional structure of a common sign.',
  'reviewed','Evidence-rich sign conversion. No modern outer-planet rulership is introduced.'
FROM terms WHERE slug='pisces';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural classification',
  'Pisces belongs to the water triplicity and to the common, mutable or bicorporeal quadruplicity. It is traditionally feminine and nocturnal. Lilly places it among the southern signs, and in the usual northern-hemisphere ascensional scheme Pisces is a short- or crooked-ascension sign.',10,'reviewed'
FROM terms WHERE slug='pisces';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Rulership and dignities',
  'Jupiter has domicile in Pisces and Venus is exalted there. Mercury is both in detriment or exile and in fall in Pisces in the standard medieval dignity scheme. Water-triplicity rulership remains a separate sect-sensitive dignity.',20,'reviewed'
FROM terms WHERE slug='pisces';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sources','Reading the historical accounts',
  'Pisces is described through numerous historical classifications involving its double-bodied and aquatic imagery, fertility, voice and practical significations. Those statements remain visible by source so the encyclopedia can show variation rather than manufacture a single synthetic stereotype.',30,'reviewed'
FROM terms WHERE slug='pisces';
