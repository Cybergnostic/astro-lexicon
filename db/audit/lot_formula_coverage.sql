-- Non-blocking editorial coverage audit for calculated lots.
--
-- Mature source-specific lot entries should normally expose at least one public
-- formula section. Generic umbrella/disambiguation entries may legitimately have
-- no single formula and are listed separately rather than treated as failures.

.headers on
.mode column

SELECT
  'LOT FORMULA COVERAGE' AS audit_section,
  COUNT(*) AS reviewed_lot_terms,
  SUM(CASE WHEN EXISTS (
        SELECT 1 FROM term_article_sections s
        WHERE s.term_id=t.id AND lower(s.section_key) LIKE '%formula%'
      ) THEN 1 ELSE 0 END) AS with_formula_section,
  SUM(CASE WHEN NOT EXISTS (
        SELECT 1 FROM term_article_sections s
        WHERE s.term_id=t.id AND lower(s.section_key) LIKE '%formula%'
      ) THEN 1 ELSE 0 END) AS without_formula_section
FROM terms t
WHERE t.category='lots' AND t.status IN ('reviewed','published');

SELECT
  t.slug,
  t.label,
  t.definition_quality,
  COALESCE(t.editorial_notes,'') AS editorial_notes
FROM terms t
WHERE t.category='lots'
  AND t.status IN ('reviewed','published')
  AND NOT EXISTS (
    SELECT 1 FROM term_article_sections s
    WHERE s.term_id=t.id AND lower(s.section_key) LIKE '%formula%'
  )
ORDER BY t.definition_quality DESC, t.label;
