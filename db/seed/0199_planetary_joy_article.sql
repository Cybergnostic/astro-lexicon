-- Editorial follow-up: complete the Planetary Joy teaching article.
--
-- Abū Maʿshar and Bonatti preserve the same seven place assignments and explain joy
-- through correspondence between a planet's nature and the significations of the place.
-- Treat joy as an accidental place-based condition, not as another form of domicile.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Joy is a traditional place-based condition in which a planet is said to rejoice in a particular house or place because the significations of that place correspond especially well with the planet’s own nature. The doctrine assigns one joy to each of the seven traditional planets and belongs to accidental, chart-position condition rather than to the sign-based scheme of essential dignity.',
  'reviewed',
  'Cross-source synthesis of reviewed Abū Maʿshar and Bonatti evidence. Preserve as accidental place doctrine, distinct from domicile/exaltation.'
FROM terms WHERE slug='planetary-joy';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-joy');
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-joy');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'correspondence','Joy is based on correspondence',
  'The organizing principle is not ownership of the place. Abū Maʿshar says a planet rejoices where the place’s indications correspond to the planet’s own indications, and Bonatti likewise treats joy as an accidental power arising from agreement between planetary nature and house meaning. The doctrine therefore explains why a particular planet is especially at home in the function of a particular place without making that place one of the planet’s zodiacal domiciles.',
  10,'reviewed',NULL
FROM terms WHERE slug='planetary-joy';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'accidental-not-essential','An accidental condition, not essential dignity',
  'Domicile, exaltation, triplicity, terms and face are sign-based dignities. Joy instead depends on where the planet falls in the local twelve-place framework of a particular chart. A planet can therefore be in its joy while having a separate essential condition by sign, and those two judgments should remain distinct.',
  20,'reviewed','Bonatti explicitly calls joy an accidental power.'
FROM terms WHERE slug='planetary-joy';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'joy-assignments','Traditional planetary joys',
  'Abū Maʿshar and Bonatti preserve the same seven assignments.',
  '["Planet","Place of joy"]',
  '[["Mercury","1st place"],["Moon","3rd place"],["Venus","5th place"],["Mars","6th place"],["Sun","9th place"],["Jupiter","11th place"],["Saturn","12th place"]]',
  30,'reviewed','Cross-source assignment table; interpretation of each correspondence remains source-attributed where needed.'
FROM terms WHERE slug='planetary-joy';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'why-preserve-framework','Why the place framework matters',
  'The joy assignments presuppose the traditional twelve-place structure and its established topics. Their logic is therefore clearest when read together with the meanings of the places themselves: for example, authors explain the assignments by matching planetary qualities with the topics or character of those places. The encyclopedia preserves that relational logic rather than reducing joy to a detached list of memorized house numbers.',
  40,'reviewed',NULL
FROM terms WHERE slug='planetary-joy';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-joy');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'joy-doctrine','Doctrine and assignments',10,'reviewed',
  'Family-specific composition for the completed Planetary Joy article.'
FROM terms WHERE slug='planetary-joy';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','correspondence','paragraph',0,10,'reviewed',
  'Family-specific composition for the Planetary Joy article.'
FROM term_page_sections ps
WHERE ps.section_key='joy-doctrine';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','accidental-not-essential','subsection',1,20,'reviewed',
  'Family-specific composition for the Planetary Joy article.'
FROM term_page_sections ps
WHERE ps.section_key='joy-doctrine';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table','joy-assignments','table',1,30,'reviewed',
  'Family-specific composition for the Planetary Joy article.'
FROM term_page_sections ps
WHERE ps.section_key='joy-doctrine';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','why-preserve-framework','subsection',1,40,'reviewed',
  'Family-specific composition for the Planetary Joy article.'
FROM term_page_sections ps
WHERE ps.section_key='joy-doctrine';
