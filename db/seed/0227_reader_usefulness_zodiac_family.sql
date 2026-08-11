-- Reader usefulness Batch D, pass 01: zodiac-sign family model.
--
-- The shared ZodiacSignProfile now leads with traditional classification. These concise
-- article introductions give each sign an astrological identity before the page reaches
-- geometry, source relations, or technical reference tables. Detailed dignity schemes
-- remain in the existing shared dignity reference rather than being duplicated here.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'','reviewed','Reader usefulness Batch D: zodiac family.'
FROM terms WHERE slug IN ('aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces');

UPDATE term_articles
SET intro='Aries is a fire, movable, masculine and diurnal sign ruled by Mars. It begins the zodiac at the March equinox. In the traditional dignity scheme the Sun is exalted here, Venus is in detriment, and Saturn is in fall. These classifications describe Aries as a zodiacal place and should be distinguished from later personality shorthand about people “being an Aries.”',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='aries');

UPDATE term_articles
SET intro='Taurus is an earth, fixed, feminine and nocturnal sign ruled by Venus. It is the middle sign of the March-equinox quarter. The Moon is exalted in Taurus and Mars is in detriment. Its traditional identity begins with these zodiacal classifications and dignities rather than with modern personality keywords.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='taurus');

UPDATE term_articles
SET intro='Gemini is an air, bicorporeal or common, masculine and diurnal sign ruled by Mercury. It closes the March-equinox quarter. Jupiter is in detriment in Gemini. The sign’s traditional identity is therefore built from its triplicity, modality, sex, sect classification and rulership before any later character descriptions are considered.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='gemini');

UPDATE term_articles
SET intro='Cancer is a water, movable, feminine and nocturnal sign ruled by the Moon. It begins the zodiacal quarter at the June solstice. Jupiter is exalted in Cancer, Saturn is in detriment, and Mars is in fall. These are properties of Cancer as a zodiacal place within traditional doctrine.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='cancer');

UPDATE term_articles
SET intro='Leo is a fire, fixed, masculine and diurnal sign ruled by the Sun. It is the middle sign of the June-solstice quarter, and Saturn is in detriment here. Traditional treatment begins with Leo’s place in the fiery triplicity, its fixed modality, solar rulership and related dignity structure rather than with generalized personality traits.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='leo');

UPDATE term_articles
SET intro='Virgo is an earth, bicorporeal or common, feminine and nocturnal sign ruled by Mercury. It closes the June-solstice quarter. Mercury is also exalted in Virgo, while Jupiter is in detriment and Venus is in fall. These dignity relations are part of the sign’s traditional technical identity.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='virgo');

UPDATE term_articles
SET intro='Libra is an air, movable, masculine and diurnal sign ruled by Venus. It begins the zodiacal quarter at the September equinox. Saturn is exalted in Libra, Mars is in detriment, and the Sun is in fall. Its traditional identity combines these dignities with its airy triplicity and movable quality.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='libra');

UPDATE term_articles
SET intro='Scorpio is a water, fixed, feminine and nocturnal sign ruled by Mars. It is the middle sign of the September-equinox quarter. Venus is in detriment in Scorpio and the Moon is in fall. Traditional classification therefore places Scorpio within the watery triplicity and fixed modality under Mars’s domicile rulership.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='scorpio');

UPDATE term_articles
SET intro='Sagittarius is a fire, bicorporeal or common, masculine and diurnal sign ruled by Jupiter. It closes the September-equinox quarter, and Mercury is in detriment here. Its basic traditional identity comes from Jupiter’s domicile rulership, the fiery triplicity and the common or bicorporeal modality.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='sagittarius');

UPDATE term_articles
SET intro='Capricorn is an earth, movable, feminine and nocturnal sign ruled by Saturn. It begins the zodiacal quarter at the December solstice. Mars is exalted in Capricorn, the Moon is in detriment, and Jupiter is in fall. These relations define its place within the traditional dignity system alongside its earthy and movable classifications.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='capricorn');

UPDATE term_articles
SET intro='Aquarius is an air, fixed, masculine and diurnal sign ruled by Saturn. It is the middle sign of the December-solstice quarter, and the Sun is in detriment here. Traditional doctrine therefore begins from Saturn’s domicile rulership, the airy triplicity and the fixed quality rather than from modern sign-character stereotypes.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='aquarius');

UPDATE term_articles
SET intro='Pisces is a water, bicorporeal or common, feminine and nocturnal sign ruled by Jupiter. It closes the December-solstice quarter. Venus is exalted in Pisces, while Mercury is both in detriment and in fall. These classifications and dignities form the sign’s traditional technical identity.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: zodiac family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='pisces');
