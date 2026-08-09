-- Encyclopedia presentation pass: sect-family and natal-role comparison tables.
-- The goal is to make related concepts easy to distinguish without converting the
-- lexicon into a procedural chart-reading manual.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- SECT / HALB / HAYZ
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-sect-membership','Planetary sect membership',
  'Natural planetary affiliation is compared with the day/night condition of the figure. Mercury is variable rather than permanently assigned to one sect.',
  '["Planet","Natural sect / rule"]',
  '[["Sun","Diurnal"],["Jupiter","Diurnal"],["Saturn","Diurnal"],["Moon","Nocturnal"],["Venus","Nocturnal"],["Mars","Nocturnal"],["Mercury","Variable; traditionally follows its solar phase/condition"]]',
  55,'reviewed','Reference summary of the already-reviewed sect doctrine; source-specific refinements can remain in historical accounts.'
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sect-halb-hayz','Sect, halb and hayz compared',
  'These terms describe increasingly specific kinds of contextual conformity and should not be treated as synonyms.',
  '["Term","What it compares","Relative scope"]',
  '[["Sect","Planetary affiliation with a day or night figure","Broad doctrine"],["Halb","Sect affiliation plus appropriate horizon relation","More specific positional condition"],["Hayz","Fuller compound conformity including sect/horizon and, in the medieval formulation represented here, sign-gender agreement","Strictest of the three"]]',
  65,'reviewed','Comparison only; exact historical formulations remain source-sensitive.'
FROM terms WHERE slug='sect';

-- -----------------------------------------------------------------------------
-- NATAL ROLE VOCABULARY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'nearby-natal-roles','Nearby natal roles and concepts',
  'These concepts can coincide in a particular chart, but they are not interchangeable names for one universal “chart ruler.”',
  '["Term","Basic function","Not the same as"]',
  '[["Significator of Manners","Planet or planets assigned to signify manners and disposition in the source tradition","Temperament or automatically the Ascendant ruler"],["Almuten","Planet prevailing in a specified dignity/testimony calculation","A permanent whole-chart ruler"],["Almuten of the Figure","Specialized chart-wide almuten calculation","Simply the Ascendant ruler"],["Temperament","Constitutional mixture described through qualities/elements","A single planetary office"]]',
  45,'reviewed','Conceptual distinction table only; no selection workflow is imported.'
FROM terms WHERE slug='significator-of-manners';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'almuten-scope','Almuten terminology by scope',
  'The word almuten names comparative predominance within a stated calculation; the scope of that calculation must be identified.',
  '["Term","Scope"]',
  '[["Almuten","A degree, house, lot, topic or other specified calculation"],["Almuten of the Figure","A specialized whole-chart predominance calculation"]]',
  45,'reviewed','Scope distinction only; historical weighting systems remain source-specific.'
FROM terms WHERE slug='almuten';
