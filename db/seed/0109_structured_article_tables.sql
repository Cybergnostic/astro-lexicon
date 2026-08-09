-- First structured presentation batch.
-- Tables are used where comparison is clearer than paragraph prose; they do not replace
-- source accounts or author-specific variants.

-- -----------------------------------------------------------------------------
-- SEVEN PLANETS: DIGNITY / CLASSIFICATION AT A GLANCE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme. Smaller dignities such as triplicity, term and face depend on sign, sect and degree.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Malefic · diurnal","Capricorn · Aquarius","Libra","Cancer · Leo","Aries"]]',
  35,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='saturn';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme. Smaller dignities such as triplicity, term and face depend on sign, sect and degree.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Greater benefic · diurnal","Sagittarius · Pisces","Cancer","Gemini · Virgo","Capricorn"]]',
  35,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='jupiter';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme. Smaller dignities such as triplicity, term and face depend on sign, sect and degree.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Malefic · nocturnal","Aries · Scorpio","Capricorn","Libra · Taurus","Cancer"]]',
  35,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='mars';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Luminary · diurnal","Leo","Aries","Aquarius","Libra"]]',
  35,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='sun';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme. Smaller dignities such as triplicity, term and face depend on sign, sect and degree.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Lesser benefic · nocturnal","Taurus · Libra","Pisces","Scorpio · Aries","Virgo"]]',
  35,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='venus';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Mercury is unusually variable in sect and other classifications; the dignity assignments below are the stable part of the standard medieval scheme.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Variable","Gemini · Virgo","Virgo","Sagittarius · Pisces","Pisces"]]',
  45,'reviewed','Mercury classification is intentionally not flattened to one fixed benefic/malefic or sect label.'
FROM terms WHERE slug='mercury';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planet-summary','Traditional condition at a glance',
  'Principal domicile, exaltation and debility assignments in the standard medieval scheme.',
  '["Class / sect","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Luminary · nocturnal","Cancer","Taurus","Capricorn","Scorpio"]]',
  45,'reviewed','Compact comparison table; detailed source variants remain in source accounts.'
FROM terms WHERE slug='moon';

-- -----------------------------------------------------------------------------
-- ESSENTIAL DIGNITY: SYSTEM OVERVIEW AND PLANETARY REFERENCE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'dignity-levels','The essential dignity system',
  'The five principal dignity types are not interchangeable. Domicile and exaltation are sign-wide; triplicity is sign-wide but sect-sensitive; term and face divide individual signs by degree.',
  '["Dignity","Scale","What it establishes","Paired debility"]',
  '[["Domicile","Whole sign","Planet is in a sign it rules","Detriment / exile"],["Exaltation","Whole sign","Planet occupies its traditional place of exaltation","Fall"],["Triplicity","Whole sign + sect","Planet has rulership through the elemental triplicity","—"],["Term / bound","Degree range","Planet rules a bounded portion of a sign","—"],["Face / decan","10° division","Planet rules one decan of a sign","—"]]',
  15,'reviewed','Reference table, not a scoring system.'
FROM terms WHERE slug='essential-dignity';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-dignities','Principal dignities and debilities by planet',
  'This compact table shows domicile and exaltation with their opposite debilities. Triplicity, terms and faces require separate tables because they depend on sect and degree.',
  '["Planet","Domicile","Exaltation","Detriment / exile","Fall"]',
  '[["Saturn","Capricorn · Aquarius","Libra","Cancer · Leo","Aries"],["Jupiter","Sagittarius · Pisces","Cancer","Gemini · Virgo","Capricorn"],["Mars","Aries · Scorpio","Capricorn","Libra · Taurus","Cancer"],["Sun","Leo","Aries","Aquarius","Libra"],["Venus","Taurus · Libra","Pisces","Scorpio · Aries","Virgo"],["Mercury","Gemini · Virgo","Virgo","Sagittarius · Pisces","Pisces"],["Moon","Cancer","Taurus","Capricorn","Scorpio"]]',
  25,'reviewed','Standard medieval reference table; author-specific table variants remain attributable elsewhere.'
FROM terms WHERE slug='essential-dignity';
