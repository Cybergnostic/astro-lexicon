-- Reader usefulness Batch C, pass 02: remaining high-value structures that can be
-- exposed from the reviewed evidence without inventing missing numerical source data.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- LORD OF THE ORB / CIRCLE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti’s Lord of the Orb or Circle belongs to a repeating yearly-ruler procedure. For each successive year he pairs the ruler of the corresponding natal house or sign with the ruler of a corresponding planetary hour. The paired rulers modify the topic of that house during that year, and the sequence continues after the first twelve years through the remaining planetary-hour positions.',
  'reviewed','Reader usefulness Batch C: expose the yearly pairing structure without inventing a full numerical cycle not yet encoded in the source layer.'
FROM terms WHERE slug='lord-of-orb';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-orb') AND table_key='orb-circle-structure';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'orb-circle-structure','How Bonatti’s yearly pairing works',
  'The doctrine combines a natal place ruler with a planetary-hour ruler for each successive year.',
  '["Element","Function"]',
  '[["Natal house or sign in sequence","Supplies the ruler connected with the topic being activated."],["Corresponding planetary hour","Supplies a second planetary ruler for that year."],["Yearly pair","The two rulers are judged together for the corresponding year."],["Years 1–12","Proceed successively through the twelve natal places/signs."],["Continuation","After twelve, the remaining planetary-hour sequence continues the cycle."]]',
  10,'reviewed','Reader-facing structure from Bonatti Treatise 9, Part 3, Chs. 13–14.'
FROM terms WHERE slug='lord-of-orb';

-- -----------------------------------------------------------------------------
-- MONTHLY PROFECTION
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='monthly-profection') AND table_key='monthly-profection-cycle';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'monthly-profection-cycle','The twelve-month sign sequence',
  'This table shows the simple relative sequence represented by the current canonical entry. Historical authors can subdivide or time the year differently, so exact conversion rules remain source-specific.',
  '["Month in profected year","Sign relative to annual profected sign"]',
  '[["1","Annual profected sign"],["2","Next zodiacal sign"],["3","2 signs after the annual sign"],["4","3 signs after the annual sign"],["5","4 signs after the annual sign"],["6","5 signs after the annual sign"],["7","6 signs after the annual sign"],["8","7 signs after the annual sign"],["9","8 signs after the annual sign"],["10","9 signs after the annual sign"],["11","10 signs after the annual sign"],["12","11 signs after the annual sign"]]',
  15,'reviewed','Reader-facing relative sequence; exact historical timing remains attached to source witnesses.'
FROM terms WHERE slug='monthly-profection';

-- -----------------------------------------------------------------------------
-- NINTH / NAWBAHAR
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr') AND table_key='ninth-parts';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'ninth-parts','The nine equal parts of a sign',
  'Each ninth measures 3°20′. The geometric division is stable; the ruler sequence should be read from the historical scheme being used.',
  '["Ninth","Degree span within sign"]',
  '[["1","0°00′–3°20′"],["2","3°20′–6°40′"],["3","6°40′–10°00′"],["4","10°00′–13°20′"],["5","13°20′–16°40′"],["6","16°40′–20°00′"],["7","20°00′–23°20′"],["8","23°20′–26°40′"],["9","26°40′–30°00′"]]',
  15,'reviewed','Reader-facing geometry from the reviewed Abū Maʿshar, al-Bīrūnī and Bonatti evidence.'
FROM terms WHERE slug='ninth-nawbahr';

DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr') AND table_key='ninth-source-rules';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'ninth-source-rules','How the transmitted ruler schemes are described',
  'The reviewed witnesses agree on nine equal parts but require source attribution for the ruler order.',
  '["Witness","Rulership framing"]',
  '[["Abū Maʿshar","Preferred Indian sequence assigns successive sign natures and lords in an order anchored in triplicity structure."],["al-Bīrūnī","Reports a received Hindu order and explicitly distinguishes it from an altered local version."],["Bonatti","Begins from the ruler of the movable sign of the relevant triplicity and proceeds through rulers of successive zodiacal signs."]]',
  25,'reviewed','Reader-facing comparison from reviewed interpretations; exact assignments remain source-specific.'
FROM terms WHERE slug='ninth-nawbahr';

UPDATE term_article_sections
SET body='Both Abū Maʿshar and al-Bīrūnī present the ninth as an Indian doctrine. The parts receive successive sign natures and rulers, and Abū Maʿshar describes the preferred sequence as anchored in triplicity structure. The historical identity of the system therefore includes more than merely cutting a sign into nine equal pieces.'
WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr') AND section_key='indian-system';

UPDATE term_article_sections
SET body='Al-Bīrūnī explicitly distinguishes the received Hindu order from an altered local version and prefers the received sequence. Because the witnesses do not support an unattributed universal ruler table, exact assignments should be stated together with the historical scheme that supplies them.'
WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr') AND section_key='rulership-variation';

-- -----------------------------------------------------------------------------
-- PAGE COMPOSITION
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE section_key='reader-structure-c2'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('lord-of-orb','monthly-profection','ninth-nawbahr'));

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'reader-structure-c2','Reference structure',86,'reviewed','Reader usefulness Batch C.'
FROM terms WHERE slug IN ('lord-of-orb','monthly-profection','ninth-nawbahr');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,tb.sort_order,'reviewed','Reader usefulness Batch C.'
FROM term_page_sections ps
JOIN terms t ON t.id=ps.term_id
JOIN term_article_tables tb ON tb.term_id=t.id
WHERE ps.section_key='reader-structure-c2'
  AND tb.table_key IN ('orb-circle-structure','monthly-profection-cycle','ninth-parts','ninth-source-rules')
  AND tb.status IN ('reviewed','published');
