-- Reader usefulness Batch D, pass 02: seven traditional planets.
--
-- Give each planetary entry a concise traditional identity before the physical/astronomical
-- reference material. Detailed sign-by-sign dignity schemes remain in the shared reference
-- tables rather than being duplicated in prose.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'','reviewed','Reader usefulness Batch D: planet family.'
FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

UPDATE term_articles
SET intro='The Sun is one of the two luminaries and the principal light of the diurnal sect. It rules Leo and is exalted in Aries. Traditional doctrine treats the Sun as a source of light, authority, visibility and centrality, while its exact accidental condition still depends on place, aspects and the surrounding chart.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='sun');

UPDATE term_articles
SET intro='The Moon is one of the two luminaries and the principal light of the nocturnal sect. It rules Cancer and is exalted in Taurus. Because of its rapid motion and changing light, traditional astrology gives the Moon a central role in bodily and material change, the flow of events, and the transmission of planetary influences.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='moon');

UPDATE term_articles
SET intro='Mercury is the traditional planet of mediation, speech, reasoning, calculation and exchange. It rules Gemini and Virgo and is exalted in Virgo. Its classification is unusually conditional: Mercury can participate with either sect and readily takes on the character of planets with which it is configured, so it should not be forced into a simple permanent benefic or malefic category.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='mercury');

UPDATE term_articles
SET intro='Venus is the lesser benefic and a planet of the nocturnal sect. It rules Taurus and Libra and is exalted in Pisces. Traditional doctrine associates Venus with union, pleasure, affection, beauty and concord, while its ability to produce those significations depends on dignity, sect, place and configuration.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='venus');

UPDATE term_articles
SET intro='Mars is the lesser malefic and a planet of the nocturnal sect. It rules Aries and Scorpio and is exalted in Capricorn. Traditional doctrine associates Mars with heat, severing, conflict, force and decisive action; sect, dignity and accidental condition determine whether that force is constructive, excessive or damaging in a particular chart.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='mars');

UPDATE term_articles
SET intro='Jupiter is the greater benefic and a planet of the diurnal sect. It rules Sagittarius and Pisces and is exalted in Cancer. Traditional doctrine associates Jupiter with increase, support, justice, faith, prosperity and constructive order, with its actual effectiveness depending on dignity, sect, place and configuration.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='jupiter');

UPDATE term_articles
SET intro='Saturn is the greater malefic and a planet of the diurnal sect. It rules Capricorn and Aquarius and is exalted in Libra. Traditional doctrine associates Saturn with coldness, restriction, endurance, separation, age and long duration; its condition determines whether those qualities operate as stability and discipline or as deprivation and obstruction.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: planet family; traditional identity first.'
WHERE term_id=(SELECT id FROM terms WHERE slug='saturn');
