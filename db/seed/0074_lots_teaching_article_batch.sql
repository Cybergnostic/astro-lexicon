-- Lexicon enrichment pass: lots / calculated points.
--
-- The private curriculum is used only to identify encyclopedia terms that need
-- clearer teaching coverage. This seed does NOT publish financial-analysis
-- workflows or course-specific judgment sequences. Public content below is
-- original synthesis of terms already supported by the historical corpus.

-- -----------------------------------------------------------------------------
-- LOT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'A lot is a calculated zodiacal point constructed from the relationship between two significators and a movable projection point, most commonly the Ascendant. Traditional authors use many different lots, each defined by its own significators and subject matter.',
       'reviewed',
       'Expanded because the private curriculum repeatedly depends on lots as named concepts; no private workflow or wording retained.'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formal-structure','The formal structure of a lot',
       'In the historical model preserved by Abū Maʿshar and Bonatti, two primary or natural significators provide the zodiacal interval used to construct the lot. That interval is then projected from a movable significator, commonly the Ascendant. This makes a lot a derived point rather than a physical celestial body.',
       10,'reviewed',NULL
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'families','Lots form families rather than one single doctrine',
       'The Lot of Fortune is only one member of a much larger family. Historical authors preserve planetary lots, lots assigned to the twelve places, and additional topical lots. Because formulas and names vary across authors and translations, each named lot should be documented separately instead of treating every calculated point as interchangeable.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'terminology','Lot and Part',
       'English texts often use both lot and part for the same calculated-point family. The lexicon therefore treats labels such as Lot of Fortune and Part of Fortune as translation variants where the historical structure is the same, while preserving genuinely distinct lots as separate terms.',
       30,'reviewed',NULL
FROM terms WHERE slug='lot';

-- -----------------------------------------------------------------------------
-- LOT EXTRACTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Lot extraction is the geometrical operation used to calculate a lot: measure the zodiacal distance between the two natural significators and project that distance from the movable significator specified by the formula.',
       'reviewed',
       'A technical-definition article, not a chart-analysis workflow.'
FROM terms WHERE slug='lot-extraction';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'direction','Direction matters',
       'A formula is directional. Measuring from A to B is not generally the same as measuring from B to A, and some lots reverse the order of their significators between day and night charts. The exact order belongs to the definition of the particular lot rather than to one universal lot formula.',
       10,'reviewed',NULL
FROM terms WHERE slug='lot-extraction';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'projection','Projection from the movable point',
       'After the interval has been measured, it is projected from the formula''s movable significator. The Ascendant is the most familiar projection point, but historical texts can prescribe another point for particular lots. The movable point is therefore part of the lot''s formal definition.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-extraction';

-- -----------------------------------------------------------------------------
-- NATURAL / IMMOVABLE SIGNIFICATORS OF A LOT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The natural or immovable significators of a lot are the two primary points whose relationship supplies the zodiacal interval used in the lot''s construction. Abū Maʿshar calls them natural indicators; Bonatti also describes them as natural or immovable significators.',
       'reviewed',
       'Existing cross-source term enriched as a structural definition.'
FROM terms WHERE slug='natural-indicators-of-a-lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-from-movable','Distinct from the movable significator',
       'The two natural significators define the interval, while the movable significator provides the point from which that interval is cast. Confusing these roles obscures why traditional lot formulas contain three components even when written in compact arithmetic form.',
       10,'reviewed',NULL
FROM terms WHERE slug='natural-indicators-of-a-lot';

-- -----------------------------------------------------------------------------
-- GENERAL INDICATORS OF A LOT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'General indicators of a lot are the additional significators used by Abū Maʿshar to clarify what a calculated lot signifies and how its subject is represented. Depending on the particular lot, he allows one, two or three such indicators.',
       'reviewed',
       'Term-level explanation only; no private topical workflow imported.'
FROM terms WHERE slug='general-indicators-of-a-lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-formula-components','Not the same as formula components',
       'General indicators belong to interpretation of the lot and should not be confused with the natural and movable significators that construct it. The distinction is useful because a lot can be calculated from one set of points while being interpreted through additional planetary or topical indicators.',
       10,'reviewed',NULL
FROM terms WHERE slug='general-indicators-of-a-lot';

-- -----------------------------------------------------------------------------
-- LOT OF FORTUNE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Fortune is the principal lunar lot in much of the traditional astrological literature. It is constructed from the relationship of the Sun and Moon projected from the Ascendant, with the luminary order reversed between day and night in the formulation preserved by Abū Maʿshar.',
       'reviewed',
       'Expanded from existing Abū Maʿshar/Bonatti/al-Bīrūnī evidence; private finance-course interpretations are not treated as independent authority.'
FROM terms WHERE slug='lot-of-fortune';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'luminary-lot','A luminary lot',
       'Fortune is built from the two luminaries rather than from a single planet or house. Its formula therefore encodes the relationship between solar and lunar positions relative to the Ascendant. This structural origin is more fundamental than any later one-word keyword assigned to the point.',
       10,'reviewed',NULL
FROM terms WHERE slug='lot-of-fortune';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'day-night','Day and night formulas',
       'In Abū Maʿshar''s formulation the arc is taken from the Sun to the Moon by day and from the Moon to the Sun by night, then projected from the Ascendant. Historical authors and later traditions should still be checked individually because formula conventions can vary in transmission.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-of-fortune';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'part-of-fortune','Part of Fortune is a translation variant',
       'Part of Fortune and Lot of Fortune are not separate canonical points in this lexicon. They are translation and naming variants for the same luminary lot where the underlying historical definition is identical.',
       30,'reviewed',NULL
FROM terms WHERE slug='lot-of-fortune';
