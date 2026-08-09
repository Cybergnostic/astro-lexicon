-- Non-blocking encyclopedia-quality coverage audit.
--
-- Evidence quality and article quality are separate. This report surfaces reviewed
-- canonical terms that are technically mature enough to matter but still lack a
-- reader-facing article or enough explanatory structure. It also explicitly surfaces
-- evidence-rich terms whose reviewed source accounts substantially outpace the
-- synthesized article layer.
--
-- Structured tables count as article blocks alongside prose sections. A page should not
-- be marked thin merely because part of its teaching content is better expressed as a table.

.headers on
.mode column

WITH reviewed AS (
  SELECT
    t.id,
    t.slug,
    t.label,
    t.category,
    t.entry_type,
    t.definition_quality,
    CASE WHEN ta.term_id IS NOT NULL THEN 1 ELSE 0 END AS has_article,
    COALESCE((
      SELECT COUNT(*)
      FROM term_article_sections s
      WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    ),0) AS section_count,
    COALESCE((
      SELECT COUNT(*)
      FROM term_article_tables tb
      WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
    ),0) AS table_count,
    COALESCE((
      SELECT COUNT(*)
      FROM interpretations i
      WHERE i.term_id=t.id AND i.status IN ('reviewed','published')
    ),0) AS interpretation_count
  FROM terms t
  LEFT JOIN term_articles ta
    ON ta.term_id=t.id AND ta.status IN ('reviewed','published')
  WHERE t.status IN ('reviewed','published')
), scored AS (
  SELECT *, section_count + table_count AS block_count
  FROM reviewed
)
SELECT
  'ARTICLE QUALITY COVERAGE' AS audit_section,
  COUNT(*) AS reviewed_terms,
  SUM(has_article) AS with_article,
  SUM(CASE WHEN has_article=0 THEN 1 ELSE 0 END) AS without_article,
  SUM(CASE WHEN has_article=1 AND block_count=0 THEN 1 ELSE 0 END) AS intro_only,
  SUM(CASE WHEN has_article=1 AND block_count>=2 THEN 1 ELSE 0 END) AS with_2plus_blocks,
  SUM(CASE WHEN interpretation_count>=3 AND block_count<3 THEN 1 ELSE 0 END) AS evidence_rich_article_poor
FROM scored;

SELECT
  slug,
  label,
  category,
  definition_quality,
  interpretation_count,
  has_article,
  section_count,
  table_count,
  block_count,
  CASE
    WHEN interpretation_count>=5 AND block_count<3 THEN 'P0 evidence-rich / article-poor'
    WHEN interpretation_count>=3 AND has_article=0 THEN 'P0 evidence-rich / no article'
    WHEN has_article=0 AND definition_quality>=5 THEN 'P1 missing article'
    WHEN has_article=0 AND definition_quality=4 THEN 'P2 missing article'
    WHEN has_article=1 AND block_count=0 THEN 'P2 intro only'
    WHEN has_article=1 AND block_count=1 AND definition_quality>=4 THEN 'P3 thin article'
    ELSE 'P4 review later'
  END AS editorial_priority
FROM scored
WHERE definition_quality>=4
  AND (
    has_article=0
    OR block_count<2
    OR (interpretation_count>=5 AND block_count<3)
  )
ORDER BY
  CASE
    WHEN interpretation_count>=5 AND block_count<3 THEN 0
    WHEN interpretation_count>=3 AND has_article=0 THEN 0
    WHEN has_article=0 AND definition_quality>=5 THEN 1
    WHEN has_article=0 AND definition_quality=4 THEN 2
    WHEN has_article=1 AND block_count=0 THEN 3
    WHEN has_article=1 AND block_count=1 THEN 4
    ELSE 5
  END,
  interpretation_count DESC,
  block_count ASC,
  label COLLATE NOCASE;
