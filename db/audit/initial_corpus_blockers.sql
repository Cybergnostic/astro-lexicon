-- Machine-readable blocking checks for the initial-corpus audit.
-- Every row must report issue_count = 0 for the corpus audit command to succeed.
-- Informational review queries (B-only evidence, duplicate passage fingerprints,
-- uncited extraction passages, coverage summaries) remain in initial_corpus_review.sql.

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
    GROUP BY lower(trim(a.label))
    HAVING COUNT(DISTINCT a.term_id)>1
  ) collisions

  UNION ALL

  SELECT 'canonical_label_alias_collisions', COUNT(*)
  FROM terms t
  JOIN aliases a ON lower(trim(a.label))=lower(trim(t.label))
  WHERE t.id<>a.term_id

  UNION ALL

  SELECT 'unreviewed_term_relations', COUNT(*)
  FROM term_relations
  WHERE status='draft'

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
