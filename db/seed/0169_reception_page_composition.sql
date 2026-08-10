-- First reader-facing composition prototype: Reception.
--
-- The underlying article sections and tables remain independent canonical content objects.
-- This seed only determines how those objects are grouped and ranked on the public page.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'how-reception-works','How reception works',10,'reviewed',
       'Composition prototype: group mechanism, mutuality and aspect distinction into one public section.'
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'limits','Limits of reception',20,'reviewed',
       'Composition prototype: retain the limitation paragraph as a distinct reader-facing section.'
FROM terms WHERE slug='reception';

WITH blocks(section_key,source_kind,source_key,presentation_role,show_heading,sort_order) AS (VALUES
  ('how-reception-works','article-section','mechanism','paragraph',0,10),
  ('how-reception-works','article-section','mutuality','subsection',1,20),
  ('how-reception-works','article-table','reception-types','table',0,30),
  ('how-reception-works','article-section','aspect','subsection',1,40),
  ('how-reception-works','article-table','reception-vs-aspect','table',0,50),
  ('limits','article-section','limits','paragraph',0,10)
)
INSERT OR REPLACE INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,b.source_kind,b.source_key,b.presentation_role,b.show_heading,b.sort_order,'reviewed',NULL
FROM blocks b
JOIN terms t ON t.slug='reception'
JOIN term_page_sections ps ON ps.term_id=t.id AND ps.section_key=b.section_key;
