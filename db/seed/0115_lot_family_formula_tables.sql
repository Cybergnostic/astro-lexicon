-- Encyclopedia presentation pass: structured lot formula tables.
-- These tables summarize already-reviewed source-specific formulas. They do not replace
-- source accounts and do not imply that same-themed lots from different traditions are synonyms.

-- -----------------------------------------------------------------------------
-- ABU MASHAR'S NON-LUMINARY PLANETARY LOTS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'abu-mashar-planetary-lots','Abū Maʿshar’s planetary lots',
  'Five non-luminary planetary lots in Great Introduction VIII.3.12–3.16. Each formula is projected from the Ascendant; night formulas reverse the day arc.',
  '["Lot","Day formula","Night formula"]',
  '[["Heavy Saturn","Asc + Fortune - Saturn","Asc + Saturn - Fortune"],["Jupiter — Prosperity and Assistance","Asc + Jupiter - Absence","Asc + Absence - Jupiter"],["Mars — Courage and Boldness","Asc + Fortune - Mars","Asc + Mars - Fortune"],["Venus — Love and Intimacy","Asc + Absence - Fortune","Asc + Fortune - Absence"],["Mercury — Means / Lack of Means","Asc + Fortune - Absence","Asc + Absence - Fortune"]]',
  35,'reviewed','Source-specific comparison table; do not merge with similarly named lots from other formula streams.'
FROM terms WHERE slug='lot';

WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('lot-of-heavy-saturn','Asc + Fortune - Saturn','Asc + Saturn - Fortune','Abū Maʿshar VIII.3.12'),
    ('lot-of-jupiter-prosperity-assistance','Asc + Jupiter - Absence','Asc + Absence - Jupiter','Abū Maʿshar VIII.3.13'),
    ('lot-of-mars-courage','Asc + Fortune - Mars','Asc + Mars - Fortune','Abū Maʿshar VIII.3.14'),
    ('lot-of-venus-love-intimacy','Asc + Absence - Fortune','Asc + Fortune - Absence','Abū Maʿshar VIII.3.15'),
    ('lot-of-mercury-means','Asc + Fortune - Absence','Asc + Absence - Fortune','Abū Maʿshar VIII.3.16')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',
  json_array(json_array(data.day_formula,data.night_formula)),
  15,'reviewed','Arithmetic notation follows the lexicon convention Asc + B - A.'
FROM data JOIN terms t ON t.slug=data.slug;

-- -----------------------------------------------------------------------------
-- FAMILY LOTS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'family-lots','Family lots in Abū Maʿshar',
  'A compact comparison of directly corroborated family lots. “Same” means the formula is not reversed by sect.',
  '["Lot","Day","Night","Source note"]',
  '[["Brothers / Siblings","Asc + Jupiter - Saturn","Same","Preferred Hermetic formula; Wālīs variant uses Mercury instead of Saturn"],["Number of Siblings","Asc + Saturn - Mercury","Same","Distinct lot from the general siblings lot"],["Father","Asc + Saturn - Sun","Asc + Sun - Saturn","If Saturn is under the rays, substitute Jupiter"],["Mother","Asc + Moon - Venus","Asc + Venus - Moon","Sect reversal"],["Children","Asc + Saturn - Jupiter","Asc + Jupiter - Saturn","Abū Maʿshar prefers sect reversal; Tawfīl variant does not reverse"],["Male Children","Asc + Jupiter - Moon","Same","Moon to Jupiter"],["Female Children","Asc + Venus - Moon","Same","Moon to Venus"]]',
  45,'reviewed','Summary of Great Introduction Part VIII evidence already stored on the individual entries.'
FROM terms WHERE slug='lot';

-- Individual family-lot reference tables.
WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('lot-of-siblings','Asc + Jupiter - Saturn','Same as day','Preferred Hermetic formula; Wālīs variant: Asc + Jupiter - Mercury'),
    ('lot-of-number-of-siblings','Asc + Saturn - Mercury','Same as day','Separate lot for number of siblings'),
    ('lot-of-father','Asc + Saturn - Sun','Asc + Sun - Saturn','If Saturn is under the rays, Jupiter substitutes for Saturn'),
    ('lot-of-mother','Asc + Moon - Venus','Asc + Venus - Moon','Sect-dependent reversal'),
    ('lot-of-children','Asc + Saturn - Jupiter','Asc + Jupiter - Saturn','Tawfīl non-reversing variant also transmitted'),
    ('lot-of-sons','Asc + Jupiter - Moon','Same as day','Male-children lot'),
    ('lot-of-daughters','Asc + Venus - Moon','Same as day','Female-children lot')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',json_array(json_array(data.day_formula,data.night_formula)),15,'reviewed',
  'Source-specific formula summary; variants remain explained in prose/source accounts.'
FROM data JOIN terms t ON t.slug=data.slug;

-- -----------------------------------------------------------------------------
-- MARRIAGE LOTS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'marriage-lot-streams','Marriage-lot formula streams',
  'Abū Maʿshar preserves several distinct marriage lots. They should not be collapsed into one generic “marriage lot.”',
  '["Historical identity","Day","Night","Transmission note"]',
  '[["Hermes — Marriage of Men","Asc + Venus - Saturn","Same","Some authorities reverse at night; Abū Maʿshar prefers fixed formula"],["Wālīs / Valens — Marriage of Men","Asc + Venus - Sun","Same","Distinct male marriage formula"],["Hermes — Marriage of Women","Asc + Saturn - Venus","Same","Reverse planetary order of Hermes’ male formula"],["Wālīs / Valens — Marriage of Women","Asc + Mars - Moon","Same","Persian nocturnal reversal also reported"],["Hermes — General Marriage","Asc + marriage cardine - Venus","Same","Uses the degree of the marriage cardine"],["Hermes — Time of Marriage","Asc + Moon - Sun","Same","Sun-to-Moon arc"]]',
  20,'reviewed','Disambiguation table for the distinct historical formula streams.'
FROM terms WHERE slug='hermes-lot-of-marriage';

WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('hermes-lot-of-marriage-men','Asc + Venus - Saturn','Same as day','Some authorities reverse at night; Abū Maʿshar prefers fixed Hermetic formula'),
    ('walis-lot-of-marriage-men','Asc + Venus - Sun','Same as day','Attributed to Wālīs / Vettius Valens'),
    ('hermes-lot-of-marriage-women','Asc + Saturn - Venus','Same as day','Hermetic female marriage formula'),
    ('walis-lot-of-marriage-women','Asc + Mars - Moon','Same as day','Persian nocturnal reversal also reported'),
    ('hermes-general-lot-of-marriage','Asc + marriage cardine - Venus','Same as day','Marriage cardine is source-specific; one witness glosses it as the western angle'),
    ('hermes-lot-of-time-of-marriage','Asc + Moon - Sun','Same as day','Hermetic time-of-marriage lot')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',json_array(json_array(data.day_formula,data.night_formula)),15,'reviewed',
  'Source-specific formula summary.'
FROM data JOIN terms t ON t.slug=data.slug;
