-- Encyclopedia presentation pass: Abū Maʿshar rank, authority, honour and success lots.
-- Preserve distinct historical identities; the generic authority entry remains an umbrella.

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'authority-lot-family','Rank, authority, honour and success lots',
  'Abū Maʿshar preserves several separate lots in this semantic field. Similar subject matter does not imply one shared formula.',
  '["Lot","Day formula","Night formula","Key distinction"]',
  '[["High Rank","Asc + 19° Aries - Sun","Asc + 3° Taurus - Moon","Uses luminary exaltation degrees rather than simple sect reversal"],["Rulership and Authority","Asc + Moon - Mars","Asc + Mars - Moon","Mars/Moon authority stream"],["Authority, Support, and Victory","Asc + Saturn - Sun","Asc + Sun - Saturn","Substitute Jupiter for Saturn if Saturn is under the rays"],["Authority and Occupation","Asc + Moon - Saturn","Same","Joins authority/status with occupation or craft"],["Honour","Asc + Absence - Fortune","Asc + Fortune - Absence","Constructed from two lots"],["Well-Known and Honoured","Asc + Sun - Fortune","Asc + Fortune - Sun","Public recognition / eminence stream"],["Success","Asc + Jupiter - Fortune","Asc + Fortune - Jupiter","Successful attainment"]]',
  20,'reviewed','Direct-source comparison based on Great Introduction VIII.4.59–4.74.'
FROM terms WHERE slug='lot-of-authority';

WITH data(slug,day_formula,night_formula,note) AS (
  VALUES
    ('lot-of-rank','Asc + 19° Aries - Sun','Asc + 3° Taurus - Moon','Day and night use different luminary/exaltation pairs'),
    ('lot-of-rulership-and-authority','Asc + Moon - Mars','Asc + Mars - Moon','Sect reversal'),
    ('lot-of-authority-support-victory','Asc + Saturn - Sun','Asc + Sun - Saturn','If Saturn is under the rays, substitute Jupiter'),
    ('lot-of-authority-and-occupation','Asc + Moon - Saturn','Same as day','No sect reversal'),
    ('lot-of-honour','Asc + Absence - Fortune','Asc + Fortune - Absence','Constructed from luminary lots'),
    ('lot-of-well-known-and-honoured','Asc + Sun - Fortune','Asc + Fortune - Sun','Public recognition / eminence'),
    ('lot-of-success','Asc + Jupiter - Fortune','Asc + Fortune - Jupiter','Successful attainment')
)
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT t.id,'formula-summary','Formula at a glance',data.note,
  '["Day","Night"]',json_array(json_array(data.day_formula,data.night_formula)),15,'reviewed',
  'Source-specific formula summary; full historical wording remains in source accounts.'
FROM data JOIN terms t ON t.slug=data.slug;
