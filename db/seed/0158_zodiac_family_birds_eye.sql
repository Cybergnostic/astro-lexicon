-- Bird's-eye encyclopedia review: the twelve zodiac signs as one family.
--
-- This seed separates stable coordinate/classification facts from descriptive source
-- accounts. Equal-sign geometry and the traditional classification axes are normalized;
-- historical authors' additional sign attributions remain in their own interpretations.
--
-- Astronomy boundary reference: International Astronomical Union FAQ / constellation
-- boundaries. The IAU reference is used only to clarify that modern astronomical
-- constellations are unequal bounded sky areas and are not identical to equal 30-degree
-- astrological signs.

PRAGMA foreign_keys = ON;

WITH data(
  sign_slug,ordinal,d0,d1,element_slug,modality_slug,polarity_slug,day_night_slug,
  quarter_anchor,quarter_position,solar_declination_half,geometry_note,tradition_note
) AS (VALUES
  ('aries',1,0,30,'element-fire','tropical-sign','masculine-sign','diurnal-sign','march-equinox','beginning','north',
   'Aries is the 0–30° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Aries.',
   'Begins an equinoctial/solstitial quarter and belongs to the fire triplicity, movable class, masculine series and diurnal sign series.'),
  ('taurus',2,30,60,'element-earth','fixed-sign','feminine-sign','nocturnal-sign','march-equinox','middle','north',
   'Taurus is the 30–60° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Taurus.',
   'Occupies the middle of the March-equinox quarter and belongs to the earth triplicity, fixed class, feminine series and nocturnal sign series.'),
  ('gemini',3,60,90,'element-air','bicorporeal-sign','masculine-sign','diurnal-sign','march-equinox','closing','north',
   'Gemini is the 60–90° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Gemini.',
   'Closes the March-equinox quarter and belongs to the air triplicity, bicorporeal/common class, masculine series and diurnal sign series.'),
  ('cancer',4,90,120,'element-water','tropical-sign','feminine-sign','nocturnal-sign','june-solstice','beginning','north',
   'Cancer is the 90–120° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Cancer.',
   'Begins the June-solstice quarter and belongs to the water triplicity, movable class, feminine series and nocturnal sign series.'),
  ('leo',5,120,150,'element-fire','fixed-sign','masculine-sign','diurnal-sign','june-solstice','middle','north',
   'Leo is the 120–150° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Leo.',
   'Occupies the middle of the June-solstice quarter and belongs to the fire triplicity, fixed class, masculine series and diurnal sign series.'),
  ('virgo',6,150,180,'element-earth','bicorporeal-sign','feminine-sign','nocturnal-sign','june-solstice','closing','north',
   'Virgo is the 150–180° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Virgo.',
   'Closes the June-solstice quarter and belongs to the earth triplicity, bicorporeal/common class, feminine series and nocturnal sign series.'),
  ('libra',7,180,210,'element-air','tropical-sign','masculine-sign','diurnal-sign','september-equinox','beginning','south',
   'Libra is the 180–210° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Libra.',
   'Begins the September-equinox quarter and belongs to the air triplicity, movable class, masculine series and diurnal sign series.'),
  ('scorpio',8,210,240,'element-water','fixed-sign','feminine-sign','nocturnal-sign','september-equinox','middle','south',
   'Scorpio is the 210–240° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Scorpius.',
   'Occupies the middle of the September-equinox quarter and belongs to the water triplicity, fixed class, feminine series and nocturnal sign series.'),
  ('sagittarius',9,240,270,'element-fire','bicorporeal-sign','masculine-sign','diurnal-sign','september-equinox','closing','south',
   'Sagittarius is the 240–270° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Sagittarius.',
   'Closes the September-equinox quarter and belongs to the fire triplicity, bicorporeal/common class, masculine series and diurnal sign series.'),
  ('capricorn',10,270,300,'element-earth','tropical-sign','feminine-sign','nocturnal-sign','december-solstice','beginning','south',
   'Capricorn is the 270–300° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Capricornus.',
   'Begins the December-solstice quarter and belongs to the earth triplicity, movable class, feminine series and nocturnal sign series.'),
  ('aquarius',11,300,330,'element-air','fixed-sign','masculine-sign','diurnal-sign','december-solstice','middle','south',
   'Aquarius is the 300–330° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Aquarius.',
   'Occupies the middle of the December-solstice quarter and belongs to the air triplicity, fixed class, masculine series and diurnal sign series.'),
  ('pisces',12,330,360,'element-water','bicorporeal-sign','feminine-sign','nocturnal-sign','december-solstice','closing','south',
   'Pisces is the 330–360° interval of tropical ecliptic longitude. It is an equal zodiacal sign, not the modern IAU constellation Pisces.',
   'Closes the December-solstice quarter and belongs to the water triplicity, bicorporeal/common class, feminine series and nocturnal sign series.')
)
INSERT OR REPLACE INTO zodiac_sign_profiles
  (sign_term_id,ordinal,longitude_start,longitude_end,element_term_id,modality_term_id,
   polarity_term_id,day_night_term_id,quarter_anchor,quarter_position,solar_declination_half,
   geometry_note,tradition_note,astronomy_source_label,astronomy_source_url,status)
SELECT s.id,d.ordinal,d.d0,d.d1,e.id,m.id,p.id,n.id,d.quarter_anchor,d.quarter_position,
       d.solar_declination_half,d.geometry_note,d.tradition_note,
       'International Astronomical Union — Zodiac / constellation FAQ',
       'https://www.iau.org/IAU/IAU/Science/What-we-do/FAQs.aspx','reviewed'
FROM data d
JOIN terms s ON s.slug=d.sign_slug
JOIN terms e ON e.slug=d.element_slug
JOIN terms m ON m.slug=d.modality_slug
JOIN terms p ON p.slug=d.polarity_slug
JOIN terms n ON n.slug=d.day_night_slug;

WITH defs(slug,short_definition,intro) AS (VALUES
  ('aries',
   'Aries is the first equal 30° sign of the tropical zodiac, spanning 0°–30° ecliptic longitude from the March equinox.',
   'Aries is the first of the twelve equal signs of the tropical zodiac. It begins at 0° tropical longitude, the March equinox, and opens the first equinoctial quarter. Its elemental, modal, polarity and day/night classifications are shown together in the normalized sign profile below; planetary dignity belongs to a separate structured reference layer.'),
  ('taurus',
   'Taurus is the second equal 30° sign of the tropical zodiac, spanning 30°–60° ecliptic longitude in the middle of the March-equinox quarter.',
   'Taurus is the second of the twelve equal signs of the tropical zodiac. It occupies 30°–60° tropical longitude, the middle segment of the quarter that begins at the March equinox. Its family classifications and its planetary dignity relations are presented as separate structured layers below.'),
  ('gemini',
   'Gemini is the third equal 30° sign of the tropical zodiac, spanning 60°–90° ecliptic longitude and closing the March-equinox quarter.',
   'Gemini is the third of the twelve equal signs of the tropical zodiac. It occupies 60°–90° tropical longitude and closes the quarter that began at the March equinox. The profile below separates its coordinate position, triplicity, modality, polarity and day/night class from the dignity system.'),
  ('cancer',
   'Cancer is the fourth equal 30° sign of the tropical zodiac, spanning 90°–120° ecliptic longitude from the June solstice.',
   'Cancer is the fourth of the twelve equal signs of the tropical zodiac. It begins at 90° tropical longitude, the June solstice, and opens the next quarter. The family profile below keeps its structural classifications distinct from the separate planetary dignity network.'),
  ('leo',
   'Leo is the fifth equal 30° sign of the tropical zodiac, spanning 120°–150° ecliptic longitude in the middle of the June-solstice quarter.',
   'Leo is the fifth of the twelve equal signs of the tropical zodiac. It occupies 120°–150° tropical longitude, the middle segment of the June-solstice quarter. Its structural classifications are normalized in the sign profile, while rulership and other dignities are drawn from the separate dignity tables.'),
  ('virgo',
   'Virgo is the sixth equal 30° sign of the tropical zodiac, spanning 150°–180° ecliptic longitude and closing the June-solstice quarter.',
   'Virgo is the sixth of the twelve equal signs of the tropical zodiac. It occupies 150°–180° tropical longitude and closes the June-solstice quarter. The profile below separates the sign-family taxonomy from dignity assignments and from the additional classifications preserved in individual source accounts.'),
  ('libra',
   'Libra is the seventh equal 30° sign of the tropical zodiac, spanning 180°–210° ecliptic longitude from the September equinox.',
   'Libra is the seventh of the twelve equal signs of the tropical zodiac. It begins at 180° tropical longitude, the September equinox, and opens the third quarter of the zodiac. Its many traditional classifications are easier to read when coordinate position, sign-family taxonomy, dignity and source-specific attributions remain separate layers.'),
  ('scorpio',
   'Scorpio is the eighth equal 30° sign of the tropical zodiac, spanning 210°–240° ecliptic longitude in the middle of the September-equinox quarter.',
   'Scorpio is the eighth of the twelve equal signs of the tropical zodiac. It occupies 210°–240° tropical longitude, the middle segment of the September-equinox quarter. The normalized profile supplies its stable family classifications; dignity and historical descriptive taxonomies remain distinct.'),
  ('sagittarius',
   'Sagittarius is the ninth equal 30° sign of the tropical zodiac, spanning 240°–270° ecliptic longitude and closing the September-equinox quarter.',
   'Sagittarius is the ninth of the twelve equal signs of the tropical zodiac. It occupies 240°–270° tropical longitude and closes the September-equinox quarter. Its structural sign-family profile, planetary dignities and source-specific descriptions are presented separately below.'),
  ('capricorn',
   'Capricorn is the tenth equal 30° sign of the tropical zodiac, spanning 270°–300° ecliptic longitude from the December solstice.',
   'Capricorn is the tenth of the twelve equal signs of the tropical zodiac. It begins at 270° tropical longitude, the December solstice, and opens the fourth quarter. The profile below treats coordinate position and sign taxonomy as one layer, with planetary dignities and historical descriptions kept separately attributable.'),
  ('aquarius',
   'Aquarius is the eleventh equal 30° sign of the tropical zodiac, spanning 300°–330° ecliptic longitude in the middle of the December-solstice quarter.',
   'Aquarius is the eleventh of the twelve equal signs of the tropical zodiac. It occupies 300°–330° tropical longitude, the middle segment of the December-solstice quarter. Its normalized family profile is separated from the dignity network and from additional source-specific sign classifications.'),
  ('pisces',
   'Pisces is the twelfth equal 30° sign of the tropical zodiac, spanning 330°–360° ecliptic longitude and closing the tropical zodiac before the March equinox.',
   'Pisces is the twelfth of the twelve equal signs of the tropical zodiac. It occupies 330°–360° tropical longitude and closes the December-solstice quarter before the zodiac returns to the March equinox. Its family classifications, planetary dignities and historical source attributions are kept as distinct reference layers.')
)
UPDATE terms
SET short_definition=(SELECT d.short_definition FROM defs d WHERE d.slug=terms.slug),
    editorial_notes='Bird’s-eye zodiac-family review: the headword definition now begins with coordinate identity; stable classifications are normalized and source-variable descriptions remain in source accounts.'
WHERE slug IN (SELECT slug FROM defs);

WITH defs(slug,intro) AS (VALUES
  ('aries','Aries is the first of the twelve equal signs of the tropical zodiac. It begins at 0° tropical longitude, the March equinox, and opens the first equinoctial quarter. Its elemental, modal, polarity and day/night classifications are shown together in the normalized sign profile below; planetary dignity belongs to a separate structured reference layer.'),
  ('taurus','Taurus is the second of the twelve equal signs of the tropical zodiac. It occupies 30°–60° tropical longitude, the middle segment of the quarter that begins at the March equinox. Its family classifications and its planetary dignity relations are presented as separate structured layers below.'),
  ('gemini','Gemini is the third of the twelve equal signs of the tropical zodiac. It occupies 60°–90° tropical longitude and closes the quarter that began at the March equinox. The profile below separates its coordinate position, triplicity, modality, polarity and day/night class from the dignity system.'),
  ('cancer','Cancer is the fourth of the twelve equal signs of the tropical zodiac. It begins at 90° tropical longitude, the June solstice, and opens the next quarter. The family profile below keeps its structural classifications distinct from the separate planetary dignity network.'),
  ('leo','Leo is the fifth of the twelve equal signs of the tropical zodiac. It occupies 120°–150° tropical longitude, the middle segment of the June-solstice quarter. Its structural classifications are normalized in the sign profile, while rulership and other dignities are drawn from the separate dignity tables.'),
  ('virgo','Virgo is the sixth of the twelve equal signs of the tropical zodiac. It occupies 150°–180° tropical longitude and closes the June-solstice quarter. The profile below separates the sign-family taxonomy from dignity assignments and from the additional classifications preserved in individual source accounts.'),
  ('libra','Libra is the seventh of the twelve equal signs of the tropical zodiac. It begins at 180° tropical longitude, the September equinox, and opens the third quarter of the zodiac. Its many traditional classifications are easier to read when coordinate position, sign-family taxonomy, dignity and source-specific attributions remain separate layers.'),
  ('scorpio','Scorpio is the eighth of the twelve equal signs of the tropical zodiac. It occupies 210°–240° tropical longitude, the middle segment of the September-equinox quarter. The normalized profile supplies its stable family classifications; dignity and historical descriptive taxonomies remain distinct.'),
  ('sagittarius','Sagittarius is the ninth of the twelve equal signs of the tropical zodiac. It occupies 240°–270° tropical longitude and closes the September-equinox quarter. Its structural sign-family profile, planetary dignities and source-specific descriptions are presented separately below.'),
  ('capricorn','Capricorn is the tenth of the twelve equal signs of the tropical zodiac. It begins at 270° tropical longitude, the December solstice, and opens the fourth quarter. The profile below treats coordinate position and sign taxonomy as one layer, with planetary dignities and historical descriptions kept separately attributable.'),
  ('aquarius','Aquarius is the eleventh of the twelve equal signs of the tropical zodiac. It occupies 300°–330° tropical longitude, the middle segment of the December-solstice quarter. Its normalized family profile is separated from the dignity network and from additional source-specific sign classifications.'),
  ('pisces','Pisces is the twelfth of the twelve equal signs of the tropical zodiac. It occupies 330°–360° tropical longitude and closes the December-solstice quarter before the zodiac returns to the March equinox. Its family classifications, planetary dignities and historical source attributions are kept as distinct reference layers.')
)
UPDATE term_articles
SET intro=(SELECT d.intro FROM defs d WHERE d.slug=(SELECT slug FROM terms WHERE id=term_articles.term_id)),
    editorial_notes='Bird’s-eye zodiac-family review: introduction teaches coordinate position first; structured family and dignity data are rendered separately.'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (SELECT slug FROM defs));

-- Replace repeated lists with explanations of the classification systems. Actual values
-- are rendered from zodiac_sign_profiles and zodiac_reference_assignments.
UPDATE term_article_sections
SET heading='How the sign classifications fit together',
    body='Elemental triplicity, modality, masculine/feminine polarity and diurnal/nocturnal sign class are separate classification axes. A sign belongs to one member of each system at the same time. The normalized profile below stores those facts once and links each class to its own encyclopedia entry rather than repeating a loose list of labels in prose.',
    editorial_notes='Bird’s-eye cleanup: sign-family values now come from normalized profile data.'
WHERE section_key='structure'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'));

UPDATE term_article_sections
SET heading='Planetary dignity is a separate layer',
    body='Domicile, exaltation, detriment or exile, fall, triplicity rulership, terms or bounds, and faces answer a different question from element or modality. The structured dignity section below is generated from the normalized reference tables and names the historical scheme when terms/bounds differ, so the page does not silently merge competing tables.',
    editorial_notes='Bird’s-eye cleanup: actual dignity assignments now come exclusively from normalized reference data.'
WHERE section_key='dignities'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'));

-- Strengthen the generic framework entry with an explicit modern-astronomy boundary note.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'modern-constellations','Equal signs and modern constellations are different coordinate objects',
       'The twelve astrological signs are equal thirty-degree divisions of zodiacal longitude. Modern astronomical constellations, by contrast, are bounded areas of sky of unequal shapes and sizes. The shared historical names can therefore be useful for orientation without implying identical boundaries; the astronomical Sun also passes through the modern constellation Ophiuchus.',25,'reviewed',
       'Modern constellation distinction checked against the International Astronomical Union FAQ; wording is original synthesis.'
FROM terms WHERE slug='zodiac';
