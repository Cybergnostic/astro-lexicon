-- Encyclopedia presentation pass: solar condition and planetary motion.
-- Existing articles already define the concepts; these tables make the distinctions
-- scannable without replacing source-specific historical accounts.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- SOLAR CONDITION FAMILY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'solar-condition-family','Solar-condition terms compared',
  'The terms describe different degrees or kinds of proximity to the Sun. Exact numerical boundaries can vary by historical author.',
  '["Term","Basic relation to the Sun","Traditional distinction"]',
  '[["Cazimi","Extremely close to the Sun","A special fortified condition in authors such as Lilly"],["Combustion","Close enough to be overwhelmed by the Sun","Traditionally treated as a serious accidental impairment"],["Under the Beams","Within a broader solar proximity zone","Weaker/broader solar obscuration than combustion"]]',
  60,'reviewed','Do not universalize one numerical threshold. Lilly-specific distances remain attached to his source account.'
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'lilly-solar-thresholds','Lilly’s stated thresholds',
  'These figures belong specifically to William Lilly’s presentation and are not asserted as universal limits for every traditional author.',
  '["Condition","Lilly’s stated distance"]',
  '[["Cazimi","Within 17′ of the Sun"],["Combustion","Within 8°30′, with Lilly’s same-sign qualification"],["Under the Beams","Within 17°"]]',
  70,'reviewed','Source-specific numerical summary derived from the already-reviewed Lilly evidence in seed 0098.'
FROM terms WHERE slug='combustion';

-- -----------------------------------------------------------------------------
-- DIRECTION / STATION / SPEED FAMILY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'motion-states','Apparent motion states',
  'Direction of motion and rate of motion are separate properties and should not be collapsed into one strength label.',
  '["State","What it describes"]',
  '[["Direct Motion","Zodiacal longitude increasing in the ordinary apparent course"],["Station","Transition point where apparent motion slows to a turning point"],["Retrogradation","Apparent backward movement in zodiacal longitude"]]',
  60,'reviewed','Geocentric apparent-motion vocabulary.'
FROM terms WHERE slug='direct-motion';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'direction-vs-speed','Direction versus speed',
  'A planet can combine these dimensions in different ways—for example, it can be direct yet slow.',
  '["Dimension","Terms","Question answered"]',
  '[["Direction / phase","Direct · Stationary · Retrograde","Which way is apparent zodiacal motion proceeding, or is it at a turning point?"],["Rate","Swift · Slow","How fast is the planet moving relative to its expected or mean motion?"]]',
  70,'reviewed','Conceptual distinction; detailed mean-motion standards can be source-sensitive.'
FROM terms WHERE slug='direct-motion';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'station-types','Two station transitions',
  'A station is a boundary phase, so the direction of the coming motion matters.',
  '["Transition","Movement after the station"]',
  '[["Station before retrogradation","Direct → retrograde"],["Station before direct motion","Retrograde → direct"]]',
  60,'reviewed','Terminological distinction only; historical interpretive weighting remains source-specific.'
FROM terms WHERE slug='station';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'speed-comparison','Swift and slow motion',
  'Speed is judged relative to the planet’s own expected motion, not by comparing raw daily speed across different planets.',
  '["Term","Meaning"]',
  '[["Swift in Motion","Moving faster than the relevant expected/mean rate"],["Slow in Motion","Moving slower than the relevant expected/mean rate"]]',
  60,'reviewed','Reference distinction; exact historical mean-motion tables can vary.'
FROM terms WHERE slug='swift-in-motion';
