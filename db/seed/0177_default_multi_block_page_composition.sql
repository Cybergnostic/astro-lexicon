-- Editorial Baseline v1: corpus-wide composition safety net.
--
-- Family-specific editorial passes should define the best public hierarchy. Until each
-- family has received that deeper review, however, no multi-block article should expose
-- every normalized content object as an equal top-level h2. For every remaining reviewed
-- article with at least two stored blocks and no explicit page composition, group all
-- blocks under one reader-facing section and demote internal distinctions to subsections.
--
-- Later family-specific seeds may DELETE/replace these compositions. This seed does not
-- delete, rewrite, or merge article content; it only fixes public hierarchy globally.

PRAGMA foreign_keys = ON;

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'editorial-overview',
       CASE
         WHEN t.entry_type='astronomical' THEN 'Geometry and description'
         WHEN lower(t.category) LIKE '%lot%' THEN 'Construction and distinctions'
         WHEN lower(t.category) LIKE '%house%' THEN 'Structure and distinctions'
         WHEN lower(t.category) LIKE '%aspect%' OR lower(t.category) LIKE '%perfection%' THEN 'Mechanics and distinctions'
         WHEN lower(t.category) LIKE '%motion%' OR lower(t.category) LIKE '%solar%' THEN 'Mechanics and condition'
         WHEN lower(t.category) LIKE '%sign%' THEN 'Structure and distinctions'
         WHEN lower(t.category) LIKE '%dignit%' OR lower(t.category) LIKE '%rulership%' THEN 'Doctrine and distinctions'
         WHEN t.entry_type='contextual' THEN 'Scope and distinctions'
         ELSE 'Explanation and distinctions'
       END,
       10,'reviewed','Editorial Baseline v1 default composition; replace with family-specific composition when that family receives deep review.'
FROM terms t
JOIN term_articles a ON a.term_id=t.id AND a.status IN ('reviewed','published')
WHERE t.status IN ('reviewed','published')
  AND NOT EXISTS (
    SELECT 1 FROM term_page_sections ps
    WHERE ps.term_id=t.id AND ps.status IN ('reviewed','published')
  )
  AND (
    (SELECT COUNT(*) FROM term_article_sections s
     WHERE s.term_id=t.id AND s.status IN ('reviewed','published'))
    +
    (SELECT COUNT(*) FROM term_article_tables tb
     WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published'))
  ) >= 2;

-- Build one ordered stream from prose sections and article tables. The first prose block
-- may flow directly under the public section heading; later prose distinctions keep their
-- own h3. Tables retain headings because their labels often carry essential comparison
-- context.
WITH blocks AS (
  SELECT s.term_id,'article-section' AS source_kind,s.section_key AS source_key,
         s.sort_order,0 AS kind_order
  FROM term_article_sections s
  WHERE s.status IN ('reviewed','published')
  UNION ALL
  SELECT tb.term_id,'article-table',tb.table_key,tb.sort_order,1
  FROM term_article_tables tb
  WHERE tb.status IN ('reviewed','published')
), ranked AS (
  SELECT b.*,
         ROW_NUMBER() OVER (
           PARTITION BY b.term_id
           ORDER BY b.sort_order,b.kind_order,b.source_key
         ) AS rn
  FROM blocks b
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,r.source_kind,r.source_key,
       CASE
         WHEN r.source_kind='article-table' THEN 'table'
         WHEN r.rn=1 THEN 'paragraph'
         ELSE 'subsection'
       END,
       CASE
         WHEN r.source_kind='article-table' THEN 1
         WHEN r.rn=1 THEN 0
         ELSE 1
       END,
       r.rn*10,'reviewed',
       'Editorial Baseline v1 default composition; family-specific composition may replace this block later.'
FROM ranked r
JOIN term_page_sections ps ON ps.term_id=r.term_id
WHERE ps.section_key='editorial-overview'
  AND ps.status='reviewed';
