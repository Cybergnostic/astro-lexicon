-- Encyclopedia presentation pass: predictive technique reference tables.
-- These tables summarize already-reviewed term-level structure. They do not create a
-- forecasting workflow, and source-sensitive variants remain explicitly qualified.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- PTOLEMAIC AGES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-age-sequence','Planetary age sequence',
  'The currently preserved seven-stage scheme. This is a historical life-stage model, not a prediction of individual lifespan.',
  '["Planet","Age span"]',
  '[["Moon","0–3"],["Mercury","4–13"],["Venus","14–21"],["Sun","22–40"],["Mars","41–55"],["Jupiter","56–67"],["Saturn","68 onward"]]',
  40,'reviewed','Direct comparison against Ptolemy/translation conventions remains a historical-source task; table mirrors the already-reviewed article data.'
FROM terms WHERE slug='ptolemaic-ages';

-- -----------------------------------------------------------------------------
-- PROFECTION FAMILY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'profection-family','Profection scales at a glance',
  'The named scales share regular zodiacal advancement but operate at different chronological levels.',
  '["Term","Scale","What is activated"]',
  '[["Annual Profection","One sign per year in the common whole-sign form","A yearly profected sign and its ruler"],["Monthly Profection","Shorter subdivision within the year","A monthly-scale sign/ruler activation"],["Profected Sign","Result, not a separate technique","The sign reached by the profection"],["Lord of the Year","Role derived by a stated annual method","The planet holding annual chronological authority"]]',
  50,'reviewed','Reference comparison only; historical profection variants remain source-specific.'
FROM terms WHERE slug='profection';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'twelve-year-cycle','Whole-sign annual cycle',
  'For the common Ascendant-based whole-sign form, each successive year advances to the next sign and the pattern repeats after twelve signs.',
  '["Cycle position","Activated place relative to natal Ascendant"]',
  '[["1","1st"],["2","2nd"],["3","3rd"],["4","4th"],["5","5th"],["6","6th"],["7","7th"],["8","8th"],["9","9th"],["10","10th"],["11","11th"],["12","12th"]]',
  50,'reviewed','Structural cycle only; no topic-judgment recipe.'
FROM terms WHERE slug='annual-profection';

-- -----------------------------------------------------------------------------
-- PRIMARY DIRECTION ROLES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'directional-roles','Formal roles in primary directions',
  'Role names describe what a factor is doing in a particular directional configuration; they are not permanent labels attached to a planet.',
  '["Role","Function"]',
  '[["Significator","The directed or receiving factor whose contact is being timed"],["Promissor","The planet, point or ray whose influence is brought to the significator"]]',
  50,'reviewed','Role comparison only; calculation systems, keys and judgment procedures remain source-specific.'
FROM terms WHERE slug='primary-direction';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'distribution-roles','Roles within a distribution',
  'Distribution distinguishes the ruler of the occupied bound from planets that join the period through additional contact.',
  '["Role","How it is obtained","Function"]',
  '[["Directed significator","The point being carried through the bounds","Provides the moving reference"],["Distributor","Ruler of the bound currently occupied","Principal ruler of that interval"],["Participator","Planet entering through a relevant directed contact","Shares or modifies the interval without replacing the distributor"]]',
  50,'reviewed','Terminological structure only; no operational timing workflow.'
FROM terms WHERE slug='distribution';

-- -----------------------------------------------------------------------------
-- RETURN / REVOLUTION FAMILY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'return-family','Return charts at a glance',
  'Both are revolution charts defined by recurrence to a natal zodiacal position, but their periods and scale differ.',
  '["Return","Returning body","Approximate scale","Common synonym"]',
  '[["Solar Return","Sun","Annual","Solar Revolution"],["Lunar Return","Moon","Monthly-scale","Lunar Revolution"]]',
  50,'reviewed','Comparison of chart types only; interpretive workflows excluded.'
FROM terms WHERE slug='revolution-chart';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'solar-vs-lunar','Solar and lunar returns',
  'The shared principle is exact recurrence to the natal zodiacal position; the cycle length differs because the bodies move at different rates.',
  '["Feature","Solar Return","Lunar Return"]',
  '[["Body","Sun","Moon"],["Typical recurrence","About yearly","About monthly"],["Also called","Solar Revolution","Lunar Revolution"],["Generic family","Revolution / return chart","Revolution / return chart"]]',
  50,'reviewed','Reference comparison; location conventions and judgment rules remain historical variants.'
FROM terms WHERE slug='solar-return';
