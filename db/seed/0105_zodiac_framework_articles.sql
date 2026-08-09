-- Encyclopedia conversion batch: zodiac framework and major sign classifications.

-- ZODIAC
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The zodiac is the twelve-sign framework used to measure celestial longitude and organize astrological relationships. In the tropical tradition the twelve signs are equal thirty-degree divisions beginning from the vernal equinox; they are mathematical divisions of the ecliptic and should not be confused with the unequal visible constellations that share their names.',
  'reviewed','Foundational framework conversion.'
FROM terms WHERE slug='zodiac';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'division','Twelve equal signs',
  'The full zodiac contains 360 degrees divided into twelve equal signs of thirty degrees each. Sign boundaries therefore belong to a geometrical coordinate system rather than to the irregular outlines of stellar constellations.',10,'reviewed'
FROM terms WHERE slug='zodiac';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'tropical','Tropical reference',
  'In tropical astrology the zodiac is anchored to the equinoxes and solstices. Aries begins at the vernal equinox, Cancer at the northern solstice, Libra at the autumnal equinox and Capricorn at the southern solstice.',20,'reviewed'
FROM terms WHERE slug='zodiac';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'not-houses','Signs are not houses',
  'The zodiac and the houses are different coordinate structures. Signs divide the ecliptic; houses or places organize the figure relative to the horizon, meridian and chosen house system. A sign can occupy different houses in different charts.',30,'reviewed'
FROM terms WHERE slug='zodiac';

-- ZODIAC SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A zodiac sign is one of the twelve equal thirty-degree divisions of the zodiac. Each sign participates simultaneously in several traditional classifications—elemental triplicity, modality, masculine or feminine class, diurnal or nocturnal class, rulership and other historical taxonomies.',
  'reviewed','Framework article; individual sign pages carry the sign-specific synthesis.'
FROM terms WHERE slug='zodiac-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'multiple-classes','One sign, many classifications',
  'A sign is not defined by one keyword. For example, element, modality, polarity, ascensional class, voice or form classifications and planetary dignities answer different technical questions. The encyclopedia keeps those systems distinct and lets an individual sign participate in several at once.',10,'reviewed'
FROM terms WHERE slug='zodiac-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'constellation','Sign and constellation',
  'Traditional zodiacal signs are equal geometrical divisions. The constellations are unequal stellar figures. Sharing a name does not make the two structures identical.',20,'reviewed'
FROM terms WHERE slug='zodiac-sign';

-- TRIPLICITY
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A triplicity is one of the four elemental groups of three signs: fire, earth, air and water. Triplicity organizes the zodiac by shared elemental nature and also forms the basis of a distinct system of essential dignity through triplicity rulers.',
  'reviewed','Foundational classification conversion.'
FROM terms WHERE slug='triplicity';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'groups','The four triplicities',
  'Aries, Leo and Sagittarius form the fire triplicity; Taurus, Virgo and Capricorn earth; Gemini, Libra and Aquarius air; Cancer, Scorpio and Pisces water.',10,'reviewed'
FROM terms WHERE slug='triplicity';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'rulers','Triplicity and triplicity rulers',
  'The elemental grouping and the dignity called triplicity rulership are related but not identical concepts. Historical systems assign planetary rulers to each triplicity, commonly distinguishing day, night and sometimes participating rulers.',20,'reviewed'
FROM terms WHERE slug='triplicity';

-- MOVABLE / CARDINAL
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A tropical or movable sign begins one of the four seasonal quarters: Aries, Cancer, Libra or Capricorn. Later terminology commonly calls these cardinal signs. Their defining structure is their position at an equinox or solstice, not a generalized personality adjective.',
  'reviewed','Classification conversion.'
FROM terms WHERE slug='tropical-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four movable signs',
  'Aries begins the spring quarter, Cancer the summer quarter, Libra the autumn quarter and Capricorn the winter quarter in the northern seasonal framework. Each therefore marks a major seasonal turning point.',10,'reviewed'
FROM terms WHERE slug='tropical-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'name','Movable, tropical and cardinal',
  'Medieval sources commonly use movable or tropical language for this class. Cardinal is the later conventional English term. These labels refer to the same four-sign structural group, although authors may emphasize different reasons for the name.',20,'reviewed'
FROM terms WHERE slug='tropical-sign';

-- FIXED
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A fixed sign is the middle sign of a seasonal quarter: Taurus, Leo, Scorpio or Aquarius. The class represents the established middle phase between the turning point of a movable sign and the transition represented by a common or bicorporeal sign.',
  'reviewed','Classification conversion.'
FROM terms WHERE slug='fixed-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four fixed signs',
  'Taurus, Leo, Scorpio and Aquarius are the fixed signs. Each follows one of the equinoctial or solstitial signs and occupies the middle of its seasonal quarter.',10,'reviewed'
FROM terms WHERE slug='fixed-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct','A structural classification',
  'Fixed classification is one layer among several. A fixed sign may be fiery, earthy, airy or watery and masculine or feminine; modality does not replace those other classifications.',20,'reviewed'
FROM terms WHERE slug='fixed-sign';

-- BICORPOREAL / COMMON / MUTABLE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A bicorporeal or common sign is the final sign of a seasonal quarter: Gemini, Virgo, Sagittarius or Pisces. Later astrology commonly calls the same group mutable. The class occupies a transitional position between the established season and the next seasonal turning point.',
  'reviewed','Classification conversion.'
FROM terms WHERE slug='bicorporeal-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four common signs',
  'Gemini, Virgo, Sagittarius and Pisces complete the four seasonal quarters. Historical imagery also contributes to the label bicorporeal or double-bodied in several sources.',10,'reviewed'
FROM terms WHERE slug='bicorporeal-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'names','Bicorporeal, common and mutable',
  'Bicorporeal and common are common historical labels; mutable is the later conventional term. The encyclopedia records the variants without treating them as three different modalities.',20,'reviewed'
FROM terms WHERE slug='bicorporeal-sign';

-- MASCULINE SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Masculine sign is a traditional alternating zodiacal classification comprising Aries, Gemini, Leo, Libra, Sagittarius and Aquarius. It belongs to the sign taxonomy and is distinct from the natural gender classification of planets.',
  'reviewed','Historical technical classification; not a statement about modern social gender.'
FROM terms WHERE slug='masculine-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Alternating six-sign series',
  'Beginning with Aries, every other sign belongs to the masculine series. In many traditional sources the same six signs are also classed as diurnal, although sign gender and planetary sect remain separate doctrines.',10,'reviewed'
FROM terms WHERE slug='masculine-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Historical technical usage',
  'The classification belongs to premodern astrological taxonomy. It should not be translated directly into modern claims about a person’s sex, gender identity or social role.',20,'reviewed'
FROM terms WHERE slug='masculine-sign';

-- FEMININE SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Feminine sign is a traditional alternating zodiacal classification comprising Taurus, Cancer, Virgo, Scorpio, Capricorn and Pisces. It is a sign taxonomy distinct from planetary gender and from modern social concepts of gender.',
  'reviewed','Historical technical classification.'
FROM terms WHERE slug='feminine-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Alternating six-sign series',
  'Beginning with Taurus, every other sign belongs to the feminine series. In many historical sources the same six signs are also described as nocturnal, but the categories should still be kept conceptually distinct.',10,'reviewed'
FROM terms WHERE slug='feminine-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Historical technical usage',
  'The classification is part of the inherited zodiacal taxonomy and should not be converted mechanically into modern claims about personality, sex or gender identity.',20,'reviewed'
FROM terms WHERE slug='feminine-sign';

-- DIURNAL / NOCTURNAL SIGNS
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A diurnal sign belongs to the alternating day-sign series traditionally beginning with Aries. This classification parallels the masculine series in many sources but should not be confused with the sect membership of planets or the day/night status of an entire chart.',
  'reviewed','Sign classification conversion.'
FROM terms WHERE slug='diurnal-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Sign class versus chart sect',
  'Calling a sign diurnal does not by itself make a chart a day chart. Chart sect depends on the Sun’s position relative to the horizon; planetary sect is another related but distinct classification.',10,'reviewed'
FROM terms WHERE slug='diurnal-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A nocturnal sign belongs to the alternating night-sign series traditionally beginning with Taurus. The category commonly coincides with the feminine sign series but remains distinct from chart sect and planetary sect.',
  'reviewed','Sign classification conversion.'
FROM terms WHERE slug='nocturnal-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Sign class versus chart sect',
  'A planet occupying a nocturnal sign is not automatically in sect. Sect judgment also depends on whether the chart is by day or night, the planet’s own sect and, in fuller conditions such as hayz or halb, its horizon position and other factors.',10,'reviewed'
FROM terms WHERE slug='nocturnal-sign';

-- LONG / SHORT ASCENSION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Straight, direct or long-ascension signs are the six signs Cancer through Sagittarius in the northern-latitude framework used by the medieval sources in this corpus. Their oblique rising times exceed those of their opposite signs.',
  'reviewed','Astronomical-historical classification; latitude dependence is essential.'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'latitude','A latitude-dependent classification',
  'Long and short ascension arise from oblique rising time, not from an intrinsic speed assigned to the sign. The familiar Cancer-through-Sagittarius long-ascension grouping applies to the northern latitudes assumed by the relevant sources and reverses in the opposite hemisphere.',10,'reviewed'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'terminology','Straight, direct and long ascension',
  'Historical translations vary between straight, direct and long ascension. These names belong to the same general ascensional class represented here; individual source wording remains visible in the source accounts.',20,'reviewed'
FROM terms WHERE slug='straight-rising-signs';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Crooked or short-ascension signs are the six signs Capricorn through Gemini in the northern-latitude framework used by the medieval sources in this corpus. Their oblique rising times are shorter than those of their opposite signs.',
  'reviewed','Astronomical-historical classification; latitude dependence is essential.'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'latitude','A latitude-dependent classification',
  'Short ascension describes rising duration relative to the local horizon. It should not be confused with a sign being psychologically fast, with planetary speed, or with modality. The familiar Capricorn-through-Gemini group is specific to the northern-latitude convention preserved in these sources.',10,'reviewed'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'terminology','Crooked and short ascension',
  'Crooked ascension is historical translation language for the class commonly called short ascension. The name concerns the geometry of oblique rising rather than an irregular zodiacal path.',20,'reviewed'
FROM terms WHERE slug='crooked-rising-signs';
