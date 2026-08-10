-- Machine-readable blocking checks for the initial-corpus audit.
-- Every row must report issue_count = 0 for the corpus audit command to succeed.
-- Informational review queries (B-only evidence, duplicate passage fingerprints,
-- uncited extraction passages, coverage summaries) remain in initial_corpus_review.sql.
--
-- Two alias collisions are deliberate historical false friends and therefore are
-- excluded narrowly here rather than deleting useful source terminology:
--   * House -> zodiacal domicile / mundane place
--   * Intervention -> al-Biruni's mechanism / Antiochus' intervention by rays

WITH blocker_counts(check_name, issue_count) AS (
  SELECT 'terms_failing_public_definition_standard', COUNT(*)
  FROM terms
  WHERE short_definition IS NULL
     OR trim(short_definition)=''
     OR definition_quality IS NULL
     OR definition_quality < 4
     OR status='draft'
     OR entry_type NOT IN ('technical','astronomical','contextual')

  UNION ALL

  SELECT 'interpretations_failing_ab_review_standard', COUNT(*)
  FROM interpretations
  WHERE evidence_grade IS NULL
     OR evidence_grade NOT IN ('A','B')
     OR status='draft'

  UNION ALL

  SELECT 'reviewed_interpretations_without_citation', COUNT(*)
  FROM interpretations i
  WHERE i.status IN ('reviewed','published')
    AND i.evidence_grade IN ('A','B')
    AND NOT EXISTS (
      SELECT 1 FROM citations c WHERE c.interpretation_id=i.id
    )

  UNION ALL

  SELECT 'reviewed_terms_without_source_interpretation', COUNT(*)
  FROM terms t
  WHERE t.status IN ('reviewed','published')
    AND NOT EXISTS (
      SELECT 1 FROM interpretations i WHERE i.term_id=t.id
    )

  UNION ALL

  SELECT 'alias_labels_shared_by_canonical_terms', COUNT(*)
  FROM (
    SELECT lower(trim(a.label)) AS normalized_alias
    FROM aliases a
    JOIN terms t ON t.id=a.term_id
    GROUP BY lower(trim(a.label))
    HAVING COUNT(DISTINCT a.term_id)>1
       AND NOT (
         lower(trim(a.label))='house'
         AND COUNT(DISTINCT a.term_id)=2
         AND COUNT(DISTINCT CASE WHEN t.slug IN ('domicile','twelve-places') THEN a.term_id END)=2
       )
  ) collisions

  UNION ALL

  SELECT 'canonical_label_alias_collisions', COUNT(*)
  FROM terms canonical
  JOIN aliases a ON lower(trim(a.label))=lower(trim(canonical.label))
  JOIN terms alias_term ON alias_term.id=a.term_id
  WHERE canonical.id<>a.term_id
    AND NOT (
      lower(trim(a.label))='intervention'
      AND canonical.slug='intervention'
      AND alias_term.slug='intervention-by-rays'
    )

  UNION ALL

  SELECT 'unreviewed_term_relations', COUNT(*)
  FROM term_relations
  WHERE status='draft'

  UNION ALL

  SELECT 'page_composition_missing_article_source', COUNT(*)
  FROM term_page_blocks pb
  JOIN term_page_sections ps ON ps.id=pb.page_section_id
  WHERE pb.status IN ('reviewed','published')
    AND (
      (pb.source_kind='article-section' AND NOT EXISTS (
        SELECT 1 FROM term_article_sections s
        WHERE s.term_id=ps.term_id AND s.section_key=pb.source_key
          AND s.status IN ('reviewed','published')
      ))
      OR
      (pb.source_kind='article-table' AND NOT EXISTS (
        SELECT 1 FROM term_article_tables t
        WHERE t.term_id=ps.term_id AND t.table_key=pb.source_key
          AND t.status IN ('reviewed','published')
      ))
    )

  UNION ALL

  SELECT 'page_composition_duplicate_source', COUNT(*)
  FROM (
    SELECT ps.term_id,pb.source_kind,pb.source_key
    FROM term_page_blocks pb
    JOIN term_page_sections ps ON ps.id=pb.page_section_id
    WHERE ps.status IN ('reviewed','published')
      AND pb.status IN ('reviewed','published')
      AND pb.source_kind IN ('article-section','article-table')
    GROUP BY ps.term_id,pb.source_kind,pb.source_key
    HAVING COUNT(*)>1
  ) duplicates

  UNION ALL

  SELECT 'page_composition_unplaced_article_block', COUNT(*)
  FROM (
    SELECT s.term_id,'article-section' source_kind,s.section_key source_key
    FROM term_article_sections s
    WHERE s.status IN ('reviewed','published')
      AND EXISTS (
        SELECT 1 FROM term_page_sections ps
        WHERE ps.term_id=s.term_id AND ps.status IN ('reviewed','published')
      )
    UNION ALL
    SELECT t.term_id,'article-table' source_kind,t.table_key source_key
    FROM term_article_tables t
    WHERE t.status IN ('reviewed','published')
      AND EXISTS (
        SELECT 1 FROM term_page_sections ps
        WHERE ps.term_id=t.term_id AND ps.status IN ('reviewed','published')
      )
  ) content
  WHERE NOT EXISTS (
    SELECT 1
    FROM term_page_blocks pb
    JOIN term_page_sections ps ON ps.id=pb.page_section_id
    WHERE ps.term_id=content.term_id
      AND ps.status IN ('reviewed','published')
      AND pb.status IN ('reviewed','published')
      AND pb.source_kind=content.source_kind
      AND pb.source_key=content.source_key
  )

  UNION ALL

  SELECT 'superseded_extraction_artifact_slugs', COUNT(*)
  FROM terms
  WHERE slug IN (
    'easternness','westernness','planetary-domain','solitary-motion','wild-planet',
    'besieging','mubtazz','reciprocal-mastership','part-of-fortune','twelfth-part',
    'rooted-question','alcochodon','syzygy-almuten-rectification','planetary-body-power',
    'own-light','house-of-substance','seventh-house','eighth-house','ninth-house',
    'triplicity-life-thirds','fixed-star-gift','sign-country-correspondence',
    'zodiacal-body-correspondence','sign-animal-correspondence','sign-plant-correspondence',
    'sign-water-fire-correspondence','sign-direction','quadrant-body-spirit',
    'quadrant-element-mixture','place-colour','fourfold-natural-correspondence'
  )
)
SELECT check_name, issue_count
FROM blocker_counts
ORDER BY check_name;
