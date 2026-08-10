-- Editorial Baseline v1: aspect, application, reception, perfection and impediments.
--
-- Earlier passes correctly preserved source-specific mechanics, but successive teaching,
-- reference-table and bird's-eye passes left many useful blocks at the same visual level.
-- This pass keeps the source taxonomy intact and assigns a reader-facing hierarchy.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- REMOVE ONLY GENUINELY REDUNDANT REFERENCE DUPLICATION
-- -----------------------------------------------------------------------------

-- Reception already has a dedicated composed article whose prose explains the same
-- one-way/mutual distinction. Keep the compact reception-types table, but the second
-- generic reception-vs-aspect table duplicates both the composed prose and the larger
-- aspect/perfection family map.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='reception')
  AND table_key='reception-vs-aspect';

-- The aspect page already participates in the data-driven concept-family map. This later
-- hand-written table repeats the same geometry/motion/reception layering at a lower level.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='aspect')
  AND table_key='independent-aspect-dimensions';

-- -----------------------------------------------------------------------------
-- READER-FACING ARTICLE INTRO CLEANUP
-- -----------------------------------------------------------------------------

UPDATE term_articles
SET intro='Application describes planetary motion toward exact contact. It is a temporal condition layered onto aspect or conjunction geometry: two planets can be close without applying, and an application can still be interrupted before the relevant matter reaches perfection.',
    editorial_notes='Editorial Baseline v1: concise reader-facing synthesis; source-specific mechanics remain in attributed sections and source accounts.'
WHERE term_id=(SELECT id FROM terms WHERE slug='application');

UPDATE term_articles
SET intro='Separation describes the phase after exact contact, when the planets move away from one another. In traditional mechanics it therefore presupposes a contact that has already perfected rather than one that never formed.',
    editorial_notes='Editorial Baseline v1: concise reader-facing synthesis; source-specific residual-contact rules remain attributed.'
WHERE term_id=(SELECT id FROM terms WHERE slug='separation');

UPDATE term_articles
SET intro='Translation of Light is a form of mediation in which a faster planet separates from one planet and then applies to another, carrying the earlier contact forward. Its defining feature is the sequence of motion, not merely the existence of a three-planet configuration.',
    editorial_notes='Editorial Baseline v1: mediation article; source-specific reception and orb requirements remain source-attributed.'
WHERE term_id=(SELECT id FROM terms WHERE slug='translation-of-light');

UPDATE term_articles
SET intro='Collection of Light is a different form of mediation: two planets apply separately to a third, slower or otherwise qualifying planet that gathers their applications. It should be distinguished from Translation, where one intermediary moves sequentially from one principal planet to another.',
    editorial_notes='Editorial Baseline v1: mediation article; source-specific qualification rules remain source-attributed.'
WHERE term_id=(SELECT id FROM terms WHERE slug='collection-of-light');

-- -----------------------------------------------------------------------------
-- REPLACE GENERIC/GLOBAL COMPOSITION FOR THIS FAMILY WITH DELIBERATE COMPOSITION
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'aspect','application','separation','perfection','translation-of-light','collection-of-light',
  'prohibition','frustration','refrenation','abscission-of-light','evasion','return-of-virtue',
  'resistance','planetary-contrariety','intervention','intervention-by-rays','frustration-bonatti',
  'planetary-orb','partile-aspect','platick-aspect'
));

-- ASPECT
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'aspect-structure','Aspect as geometry',10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM terms WHERE slug='aspect';

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='geometry-first' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='geometry-first' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='aspect-structure' AND s.status IN ('reviewed','published');

-- APPLICATION
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'application-mechanics','How application works',10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM terms WHERE slug='application';

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='mechanism' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='mechanism' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='application-mechanics' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='application-mechanics' AND tb.status IN ('reviewed','published');

-- SEPARATION
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'separation-mechanics','After exact contact',10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM terms WHERE slug='separation';

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='mechanism' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='mechanism' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='separation-mechanics' AND s.status IN ('reviewed','published');

-- PERFECTION
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'perfection-mechanics','From contact to perfection',10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM terms WHERE slug='perfection';

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='perfection-mechanics' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='perfection-mechanics' AND tb.status IN ('reviewed','published');

-- TRANSLATION / COLLECTION
WITH entries(slug,section_key,heading) AS (VALUES
  ('translation-of-light','translation-mechanics','How Translation works'),
  ('collection-of-light','collection-mechanics','How Collection works')
)
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,e.section_key,e.heading,10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM entries e JOIN terms t ON t.slug=e.slug;

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.term_id IN (SELECT id FROM terms WHERE slug IN ('translation-of-light','collection-of-light'))
  AND s.status IN ('reviewed','published');

-- INTERRUPTION / DENIAL TERMS
WITH entries(slug,heading) AS (VALUES
  ('prohibition','How the interruption works'),
  ('frustration','How the interruption works'),
  ('refrenation','How the interruption works'),
  ('abscission-of-light','How the interruption works'),
  ('evasion','How the interruption works'),
  ('return-of-virtue','How the return works'),
  ('resistance','How the interruption works'),
  ('planetary-contrariety','How the interruption works'),
  ('intervention','How the intervention works'),
  ('intervention-by-rays','How the intervention works'),
  ('frustration-bonatti','How Bonatti’s Frustration works')
)
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'mechanics',e.heading,10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM entries e JOIN terms t ON t.slug=e.slug
WHERE EXISTS (
  SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
) OR EXISTS (
  SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
);

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='mechanics' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='mechanics' AND tb.status IN ('reviewed','published');

-- ORB / PARTILE / PLATICK: compact technical entries. Keep any explanatory material under
-- one shared article section rather than promoting individual distinctions to page-level h2s.
WITH entries(slug) AS (VALUES ('planetary-orb'),('partile-aspect'),('platick-aspect'))
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'exactness-range','Exactness and range',10,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM entries e JOIN terms t ON t.slug=e.slug
WHERE EXISTS (SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published'))
   OR EXISTS (SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published'));

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='exactness-range' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 aspect-family composition.'
FROM term_page_sections ps JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='exactness-range' AND tb.status IN ('reviewed','published');
