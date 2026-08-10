-- Editorial follow-up: complete the Darīǧān / Indian Decan teaching article.
--
-- Abū Maʿshar and al-Bīrūnī preserve a threefold ten-degree Indian subdivision that is
-- structurally comparable to a decan but uses a different rulership rule. The article
-- keeps the shared geometry while making the alternative ruler sequence explicit.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Darīǧān is an Indian threefold subdivision of a zodiacal sign into three equal ten-degree parts. Its geometry is therefore the same 10° + 10° + 10° structure as a decan, but its rulers are assigned by a different rule: the first part belongs to the ruler of the sign itself, the second to the ruler of the fifth sign from it, and the third to the ruler of the ninth sign from it.',
  'reviewed',
  'Synthesis of reviewed Abū Maʿshar and al-Bīrūnī evidence. The ordinary face/decan system remains a distinct rulership scheme.'
FROM terms WHERE slug='darijan';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='darijan');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'three-ten-degree-parts','Three equal ten-degree parts',
  'Every sign contains three darīǧāns of ten degrees each. The subdivision itself is therefore simple and regular: 0°–10°, 10°–20° and 20°–30° of the sign. What distinguishes the system is not the size of the parts but the way their rulers are selected.',
  10,'reviewed',NULL
FROM terms WHERE slug='darijan';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rulership-sequence','Rulership follows the 1st, 5th and 9th signs',
  'The first darīǧān is ruled by the ruler of the sign being divided. The second is ruled by the ruler of the fifth sign from that sign, and the third by the ruler of the ninth sign. Because the fifth and ninth signs belong to the same triplicity relationship as the starting sign, the sequence links the three parts through sign rulership rather than through the ordinary decan ruler cycle.',
  20,'reviewed','Directly reflects Abū Maʿshar Part V, Chapter 16 and al-Bīrūnī §451.'
FROM terms WHERE slug='darijan';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variant-decan-system','A decan-shaped subdivision with a different ruler scheme',
  'Darīǧān should not be treated as merely another spelling of face or decan. The two systems divide a sign into the same number of equal parts, but they assign planetary rulers differently. The corpus therefore relates Darīǧān to the ordinary decan as a variant system rather than merging the two canonical concepts.',
  30,'reviewed','Preserves the reviewed variant-system-of relation to face-decan.'
FROM terms WHERE slug='darijan';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-framing','An Indian system in the medieval Arabic sources',
  'Abū Maʿshar and al-Bīrūnī present this ruler pattern as an Indian form of the ten-degree subdivision. Their reports establish the historical system represented here; the entry does not silently replace it with a later decan convention or assume that every tradition using ten-degree divisions used the same rulers.',
  40,'reviewed',NULL
FROM terms WHERE slug='darijan';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='darijan');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'darijan-doctrine','Indian decan system',10,'reviewed',
  'Family-specific composition for the completed Darīǧān / Indian Decan article.'
FROM terms WHERE slug='darijan';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='three-ten-degree-parts' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='three-ten-degree-parts' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Darīǧān / Indian Decan article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='darijan-doctrine'
  AND s.status IN ('reviewed','published');
