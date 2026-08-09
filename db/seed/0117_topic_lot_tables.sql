-- Encyclopedia presentation pass: topical lots from Abū Maʿshar.
-- Structured tables summarize already-reviewed formulas while preserving source identity.
-- The historical Lot of Death remains descriptive and is intentionally excluded from formula tables.

-- Ninth-place topic lots.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'ninth-place-lots','Journey, piety and knowledge lots',
  'Directly corroborated ninth-place lots in Abū Maʿshar. Most are projected from the Ascendant; the Knowledge and Understanding lot is an important exception and is projected from Mercury.',
  '["Lot","Day formula","Night formula","Projection / note"]',
  '[["Journey","Asc + degree IX - ruler IX","Same","Ruler-to-place formula"],["Travel on Water","Asc + 15° Cancer - Saturn","Asc + Saturn - 15° Cancer","Separate from general Journey"],["Piety","Asc + Mercury - Moon","Asc + Moon - Mercury","Sect reversal"],["Intelligence and Depth of Thought","Asc + Moon - Saturn","Asc + Saturn - Moon","Sect reversal"],["Knowledge and Understanding","Mercury + Jupiter - Saturn","Mercury + Saturn - Jupiter","Projected from Mercury, not Ascendant"]]',
  55,'reviewed','Comparison of Great Introduction VIII.4.52–4.56 and related formula summary.'
FROM terms WHERE slug='lot';

WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('lot-of-travel','Asc + degree IX - ruler IX','Same as day','Ruler-to-place formula; no sect reversal'),
    ('lot-of-travel-on-water','Asc + 15° Cancer - Saturn','Asc + Saturn - 15° Cancer','Separate lot specifically for water travel'),
    ('lot-of-faith','Asc + Mercury - Moon','Asc + Moon - Mercury','Source name: Lot of Piety'),
    ('lot-of-intelligence-and-depth-of-thought','Asc + Moon - Saturn','Asc + Saturn - Moon','Sect reversal'),
    ('lot-of-knowledge','Mercury + Jupiter - Saturn','Mercury + Saturn - Jupiter','Projection from Mercury is part of the formula')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',json_array(json_array(data.day_formula,data.night_formula)),15,'reviewed',
  'Source-specific formula summary.'
FROM data JOIN terms t ON t.slug=data.slug;

-- Friends / enemies disambiguation.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'enemy-lot-streams','Distinct enemy-lot streams',
  'The label “Lot of Enemies” is not one universal formula. Abū Maʿshar preserves at least two separate twelfth-place lots.',
  '["Historical identity","Day","Night","Source distinction"]',
  '[["Enemies according to some of the Ancients","Asc + Mars - Saturn","Same","Saturn-to-Mars extraction"],["Hermes’ Lot of Enemies","Asc + degree XII - ruler XII","Same","Ruler-to-place extraction"]]',
  20,'reviewed','Do not merge these with other Saturn/Nemesis streams without direct formula evidence.'
FROM terms WHERE slug='lot-of-enemies';

WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('lot-of-friends','Asc + Mercury - Moon','Same as day','Source name: Friends and Brothers'),
    ('lot-of-enemies-ancients','Asc + Mars - Saturn','Same as day','Attributed to some of the Ancients'),
    ('lot-of-enemies-hermes','Asc + degree XII - ruler XII','Same as day','Attributed to Hermes')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',json_array(json_array(data.day_formula,data.night_formula)),15,'reviewed',
  'Source-specific formula summary.'
FROM data JOIN terms t ON t.slug=data.slug;

-- Captives / bondage uses different luminary rulers by sect rather than a simple reversal.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'formula-summary','Formula at a glance',
  'The construction changes with sect by using the ruler of the relevant luminary’s sign.',
  '["Day","Night"]',
  '[["Asc + Sun - ruler of Sun’s sign","Asc + Moon - ruler of Moon’s sign"]]',
  15,'reviewed','Abū Maʿshar VIII.4.30; historical source formula.'
FROM terms WHERE slug='lot-of-imprisonment';

-- Historical Lot of Death: improve encyclopedia framing without operationalizing the technique.
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Death is a historical eighth-place lot transmitted by Abū Maʿshar. It belongs to a premodern technical vocabulary surrounding mortality, but the lexicon treats it as a historical term rather than as a practical method for predicting an individual death or lifespan.',
  'reviewed','Descriptive historical treatment only; no operational death-prediction procedure.'
FROM terms WHERE slug='lot-of-death';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-scope','Historical scope',
  'Abū Maʿshar preserves more than one transmitted construction under this topic, including a principal Hermetic-style formula and a different Persian variant. Their coexistence is evidence that the name should not be assumed to refer to one universal formula across all traditions.',
  20,'reviewed','No formula reproduced in the public teaching layer.'
FROM terms WHERE slug='lot-of-death';
