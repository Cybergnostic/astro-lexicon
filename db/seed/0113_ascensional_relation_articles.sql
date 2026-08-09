-- Encyclopedia conversion batch: rising times, climes and sign-pair relations.

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Rising times measure how much equatorial or oblique ascension corresponds to the rising of a zodiacal sign or degree at a specified terrestrial latitude. Because signs do not rise in equal clock time away from the equator, rising-time doctrine underlies several historical sign classifications and timing procedures.',
  'reviewed','Astronomical framework; detailed timing procedures remain separate.'
FROM terms WHERE slug='rising-times';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'latitude','Dependence on latitude',
  'Rising time is not a single universal number attached permanently to a sign. Oblique ascension changes with terrestrial latitude, so historical tables are normally organized by clime or latitude.',10,'reviewed'
FROM terms WHERE slug='rising-times';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'classes','Long and short ascension',
  'In the northern latitudes represented by the standard medieval classifications, Cancer through Sagittarius are the long or direct-ascension signs, while Capricorn through Gemini are the short or crooked-ascension signs. The relation reverses across hemispheres.',20,'reviewed'
FROM terms WHERE slug='rising-times';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A clime is a premodern geographical latitude band used in astronomical and astrological calculation. Climes organize phenomena that vary with terrestrial latitude, especially day length and oblique rising times.',
  'reviewed','Historical astronomical geography.'
FROM terms WHERE slug='clime';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'use','Why climes appear in astrology',
  'Astrological calculations that depend on horizon geometry cannot be identical at every latitude. Clime tables provided a practical historical way to organize those changes before modern coordinate-based computation.',10,'reviewed'
FROM terms WHERE slug='clime';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not a zodiacal division',
  'A clime divides terrestrial latitude, not the zodiac. It belongs to astronomical geography and should not be confused with signs, houses or triplicities.',20,'reviewed'
FROM terms WHERE slug='clime';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Straight or direct-ascension signs are the six signs whose oblique rising times are longer than those of their opposites in the northern-latitude scheme used by the medieval sources: Cancer through Sagittarius.',
  'reviewed','Hemisphere dependence stated explicitly.'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The six long-ascension signs',
  'Cancer, Leo, Virgo, Libra, Scorpio and Sagittarius form the long- or straight-ascension half of the zodiac in the standard northern-hemisphere scheme.',10,'reviewed'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'context','A latitude-dependent class',
  'The classification arises from oblique ascension, not from an intrinsic elemental property of the signs. Its practical meaning therefore depends on the observer’s hemisphere and latitude.',20,'reviewed'
FROM terms WHERE slug='straight-rising-signs';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Crooked or short-ascension signs are the six signs whose oblique rising times are shorter than those of their opposites in the northern-latitude scheme used by the medieval sources: Capricorn through Gemini.',
  'reviewed','Hemisphere dependence stated explicitly.'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The six short-ascension signs',
  'Capricorn, Aquarius, Pisces, Aries, Taurus and Gemini form the short- or crooked-ascension half of the zodiac in the standard northern-hemisphere scheme.',10,'reviewed'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'context','A latitude-dependent class',
  'Short ascension describes horizon geometry. It should not be turned into a universal psychological meaning of the signs, and its north/south orientation reverses across hemispheres.',20,'reviewed'
FROM terms WHERE slug='crooked-rising-signs';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'ascension-pairs','Opposite long/short-ascension pairs',
  'Northern-hemisphere structural pairing used by the historical sources.',
  '["Short / crooked","Long / direct"]',
  '[["Capricorn","Cancer"],["Aquarius","Leo"],["Pisces","Virgo"],["Aries","Libra"],["Taurus","Scorpio"],["Gemini","Sagittarius"]]',
  30,'reviewed','Reference geometry only.'
FROM terms WHERE slug='rising-times';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Signs Agreeing in Zone, or Equal Ascension, is a paired-sign relation based on corresponding ascensional behavior. Historical authors use closely related language for signs symmetrically placed around an equinoctial boundary and rising in equal or complementary fashion.',
  'reviewed','Keep distinct from ordinary aspects.'
FROM terms WHERE slug='signs-agreeing-in-zone';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Ascensional correspondence',
  'The defining relation is astronomical rather than aspectual: the signs correspond through rising behavior. Bonatti preserves the same sign pairs under the phrase “harmonious in journeys,” showing how one geometric relation could acquire different source labels.',10,'reviewed'
FROM terms WHERE slug='signs-agreeing-in-zone';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not an ordinary zodiacal aspect',
  'Equal-ascension relations can connect signs without making them sextile, square, trine or opposite. They therefore belong to a separate family of sign correspondences.',20,'reviewed'
FROM terms WHERE slug='signs-agreeing-in-zone';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Signs Agreeing in Power is a historical paired-sign relation based on equal daytime power or equal day-length conditions. It belongs to the family of solar and ascensional correspondences rather than the ordinary aspect system.',
  'reviewed','Source-specific terminology retained.'
FROM terms WHERE slug='signs-agreeing-in-power';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'principle','Equality of solar power',
  'The relation links signs whose positions correspond through the seasonal distribution of daylight. This makes it geometrically related to reflection principles such as antiscia while remaining a distinct historical term.',10,'reviewed'
FROM terms WHERE slug='signs-agreeing-in-power';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Signs Agreeing in Path is a source-specific paired-sign relation based on shared planetary rulership, with Cancer and Leo treated together as the houses of the two luminaries. It is one of several non-aspectual ways historical authors relate signs.',
  'reviewed','Do not generalize beyond source-defined pairing.'
FROM terms WHERE slug='signs-agreeing-in-path';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'principle','Correspondence through rulership',
  'Unlike equal ascension or equal day-length relations, agreement in path is organized through planetary domicile structure. The term therefore illustrates that historical sign relations could be geometrical, solar or rulership-based.',10,'reviewed'
FROM terms WHERE slug='signs-agreeing-in-path';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Natural Opposition is Abū Maʿshar’s name for a non-aspectual sign relation in which relatively distant signs nevertheless agree through ascensional, daylight-power or rulership correspondences. Despite the word opposition, it is not identical to the ordinary 180° aspect and can carry a concordant relation.',
  'reviewed','Source-specific technical term.'
FROM terms WHERE slug='natural-opposition';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Why it is not ordinary opposition',
  'Ordinary opposition is defined by 180° angular separation. Natural opposition instead names a correspondence produced through other sign-pair systems. The two concepts must therefore remain separate in the lexicon.',10,'reviewed'
FROM terms WHERE slug='natural-opposition';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Natural Sextile is Abū Maʿshar’s name for a non-aspectual relation among relatively near signs linked through ascensional, daylight-power or rulership correspondences. The textual tradition preserves disagreement over the exact qualitative effect of this relation.',
  'reviewed','Source-specific and textually variant.'
FROM terms WHERE slug='natural-sextile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not the ordinary 60° sextile',
  'The name does not mean that the signs are simply sixty degrees apart. It belongs to Abū Maʿshar’s broader taxonomy of natural sign relations, whose logic comes from correspondence rather than ordinary aspect geometry.',10,'reviewed'
FROM terms WHERE slug='natural-sextile';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Hearing and Seeing Relation is Antiochus’ directional inter-sign relation in which one sign is said to hear or see another according to zodiacal order. It belongs to a historical family of sign sympathy doctrines and should not be replaced automatically with ordinary aspect terminology.',
  'reviewed','Source-specific directional relation.'
FROM terms WHERE slug='hearing-seeing-relation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'direction','A directional relation',
  'The wording matters because the relation is directional: one sign can be described as hearing or seeing another according to the source’s geometry. Treating it as a generic mutual aspect would erase part of the technical distinction.',10,'reviewed'
FROM terms WHERE slug='hearing-seeing-relation';
