-- Encyclopedia-quality pass: historically corroborated family lots.
--
-- These entries explain identities, distinctions, and transmitted formula variants.
-- They remain historical reference pages and do not provide fertility, pregnancy,
-- reproductive-health, or family-outcome prediction workflows.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- LOT OF BROTHERS / SIBLINGS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Brothers, represented in this lexicon by the broader searchable label Lot / Part of Brothers or Siblings, is a traditional calculated lot associated with siblings. Abū Maʿshar preserves more than one transmitted formula and explicitly distinguishes his preferred Hermetic construction from a variant attributed to Wālīs.',
  'reviewed','Historical reference only; no sibling-outcome judgment workflow.'
FROM terms WHERE slug='lot-of-siblings';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'identity','Identity and naming',
  'Historical sources can speak specifically of brothers even where modern indexing uses siblings for discoverability. The canonical entry therefore preserves the historical source-name while allowing the broader English search term. This should not be confused with the separate Lot of the Number of Brothers, which answers a different technical question and has its own formula.',20,'reviewed',NULL
FROM terms WHERE slug='lot-of-siblings';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variant','Abū Maʿshar records a competing formula',
  'Abū Maʿshar gives the Saturn-to-Jupiter extraction as the preferred Hermetic formula but also records a Wālīs variant measured from Mercury to Jupiter. Keeping both accounts visible is important: the existence of a named lot does not imply that every historical authority transmitted exactly the same construction.',30,'reviewed',NULL
FROM terms WHERE slug='lot-of-siblings';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'brothers-formulas','Transmitted formulas in Abū Maʿshar',
  'Both constructions are non-reversing in the account currently stored; Abū Maʿshar prefers the Hermetic Saturn-to-Jupiter form.',
  '["Stream","Day","Night","Status in source"]',
  '[["Hermetic / preferred","Asc + Jupiter − Saturn","Asc + Jupiter − Saturn","Preferred by Abū Maʿshar"],["Wālīs variant","Asc + Jupiter − Mercury","Asc + Jupiter − Mercury","Reported variant"]]',
  40,'reviewed','Source-specific comparison, not a universal lot table.'
FROM terms WHERE slug='lot-of-siblings';

-- -----------------------------------------------------------------------------
-- LOT OF NUMBER OF BROTHERS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of the Number of Brothers is a distinct traditional lot concerned with the number of brothers or siblings. It is not merely an alternative name for the ordinary Lot of Brothers: Abū Maʿshar catalogs it separately and gives it a different construction.',
  'reviewed','Historical term distinction only; no family-size prediction workflow.'
FROM terms WHERE slug='lot-of-number-of-siblings';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct','Distinct from the Lot of Brothers',
  'The ordinary sibling lot and the number-of-siblings lot belong to the same topical family but are separate calculated points. Preserving the distinction prevents two historically different formula identities from collapsing simply because their English labels are similar.',20,'reviewed'
FROM terms WHERE slug='lot-of-number-of-siblings';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'number-brothers-formula','Formula in Abū Maʿshar',
  'The currently corroborated construction does not reverse by sect.',
  '["Day","Night","Extraction"]',
  '[["Asc + Saturn − Mercury","Asc + Saturn − Mercury","Mercury → Saturn, projected from the Ascendant"]]',
  40,'reviewed','Directly source-anchored formula summary.'
FROM terms WHERE slug='lot-of-number-of-siblings';

-- -----------------------------------------------------------------------------
-- LOT OF THE FATHER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of the Father is a traditional family lot associated with the father. In Abū Maʿshar it is normally constructed from the Sun and Saturn with day/night reversal, but his account also preserves a specific substitution rule when Saturn is under the Sun’s rays.',
  'reviewed','Historical reference only; no parent-outcome prediction workflow.'
FROM terms WHERE slug='lot-of-father';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'substitution','A source-specific substitution rule',
  'Abū Maʿshar replaces Saturn with Jupiter when Saturn is under the rays. This is not a generic rule for every lot or every author; it belongs to this transmitted account of the father lot and should remain attached to the source that gives it.',20,'reviewed'
FROM terms WHERE slug='lot-of-father';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'father-formulas','Abū Maʿshar’s father-lot formulas',
  'The Jupiter rows apply when Saturn is under the rays.',
  '["Condition","Day","Night"]',
  '[["Normal Saturn form","Asc + Saturn − Sun","Asc + Sun − Saturn"],["Saturn under rays: Jupiter substitution","Asc + Jupiter − Sun","Asc + Sun − Jupiter"]]',
  40,'reviewed','Source-specific formula and fallback rule.'
FROM terms WHERE slug='lot-of-father';

-- -----------------------------------------------------------------------------
-- LOT OF THE MOTHER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of the Mother is a traditional family lot associated with the mother. Abū Maʿshar gives a sect-sensitive Venus–Moon construction: the day formula measures from Venus to the Moon, while the night formula reverses that arc.',
  'reviewed','Historical reference only; no parent-outcome prediction workflow.'
FROM terms WHERE slug='lot-of-mother';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Sect reversal is part of this formula',
  'Unlike several non-reversing lots in the same source, this construction changes planetary order between day and night charts. The reversal belongs to the formula itself and should be displayed explicitly rather than left implicit in prose.',20,'reviewed'
FROM terms WHERE slug='lot-of-mother';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'mother-formula','Formula in Abū Maʿshar',
  'The Venus–Moon arc reverses between day and night.',
  '["Day","Night"]',
  '[["Asc + Moon − Venus","Asc + Venus − Moon"]]',
  40,'reviewed','Directly source-anchored formula summary.'
FROM terms WHERE slug='lot-of-mother';

-- -----------------------------------------------------------------------------
-- LOT OF CHILDREN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Children is a traditional calculated lot associated historically with children or offspring. Abū Maʿshar preserves a preferred sect-dependent Hermetic construction from Jupiter and Saturn and also records a competing non-reversing formula attributed to Tawfīl.',
  'reviewed','Historical reference only. Do not use this page for fertility, pregnancy, reproductive-health, or family-outcome prediction.'
FROM terms WHERE slug='lot-of-children';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Preferred and transmitted variants',
  'The important encyclopedic point is that the historical record contains more than one construction. Abū Maʿshar prefers the sect-dependent Hermetic form while still preserving Tawfīl’s non-reversing version. The lexicon records that disagreement rather than normalizing it away.',20,'reviewed','No interpretive fertility procedure.'
FROM terms WHERE slug='lot-of-children';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'children-formulas','Children-lot formula streams',
  'Abū Maʿshar prefers the sect-dependent Hermetic form.',
  '["Stream","Day","Night","Status in source"]',
  '[["Hermetic / preferred","Asc + Saturn − Jupiter","Asc + Jupiter − Saturn","Preferred by Abū Maʿshar"],["Tawfīl variant","Asc + Saturn − Jupiter","Asc + Saturn − Jupiter","Reported non-reversing variant"]]',
  40,'reviewed','Historical formula comparison only.'
FROM terms WHERE slug='lot-of-children';

-- -----------------------------------------------------------------------------
-- LOTS OF MALE AND FEMALE CHILDREN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Male Children is a distinct traditional lot preserved in Abū Maʿshar’s formula summary. It is constructed from the Moon to Jupiter in both day and night charts and should not be collapsed into the more general Lot of Children.',
  'reviewed','Historical vocabulary/formula only; no reproductive or family-outcome prediction.'
FROM terms WHERE slug='lot-of-sons';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct','A separate formula identity',
  'This lot belongs to the same family as the general Lot of Children but is transmitted as a separate calculated point with a different planetary pair. The distinction is historical and technical, not an invitation to infer modern reproductive outcomes.',20,'reviewed'
FROM terms WHERE slug='lot-of-sons';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'male-children-formula','Formula in Abū Maʿshar',
  'The construction is the same by day and night.',
  '["Day","Night","Extraction"]',
  '[["Asc + Jupiter − Moon","Asc + Jupiter − Moon","Moon → Jupiter"]]',
  40,'reviewed','Historical formula only.'
FROM terms WHERE slug='lot-of-sons';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Female Children is a distinct traditional lot preserved in Abū Maʿshar’s formula summary. It is constructed from the Moon to Venus in both day and night charts and should not be collapsed into the more general Lot of Children.',
  'reviewed','Historical vocabulary/formula only; no reproductive or family-outcome prediction.'
FROM terms WHERE slug='lot-of-daughters';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct','A separate formula identity',
  'Like the corresponding male-children lot, this is a historically distinct calculated point rather than a synonym for the general children lot. Its formula identity is preserved because the source itself distinguishes the entries.',20,'reviewed'
FROM terms WHERE slug='lot-of-daughters';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'female-children-formula','Formula in Abū Maʿshar',
  'The construction is the same by day and night.',
  '["Day","Night","Extraction"]',
  '[["Asc + Venus − Moon","Asc + Venus − Moon","Moon → Venus"]]',
  40,'reviewed','Historical formula only.'
FROM terms WHERE slug='lot-of-daughters';

-- -----------------------------------------------------------------------------
-- FAMILY-LOT ORIENTATION TABLE ON THE GENERIC LOT PAGE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'family-lot-family','Family-related lots in the corroborated corpus',
  'These are separate historical formula identities, not interchangeable names for one family lot.',
  '["Entry","Primary distinction"]',
  '[["Lot of Brothers / Siblings","General sibling topic"],["Lot of Number of Brothers","Separate quantity-oriented historical identity"],["Lot of Father","Father; Sun/Saturn with source-specific substitution"],["Lot of Mother","Mother; Venus/Moon sect reversal"],["Lot of Children","General children/offspring lot with competing formula streams"],["Lot of Male Children","Separate Moon/Jupiter construction"],["Lot of Female Children","Separate Moon/Venus construction"]]',
  95,'reviewed','Navigation/disambiguation table only; no family-outcome judgment guidance.'
FROM terms WHERE slug='lot';
