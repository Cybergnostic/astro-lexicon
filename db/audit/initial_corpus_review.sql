-- Initial five-source corpus: post-revision editorial audit.
--
-- Run after migrations and every seed through the latest cross-source revision.
-- This file is intentionally READ-ONLY: it reports anything that still prevents the
-- canonical term set from being treated as publication-ready.
--
-- The audit embodies the project rule:
--   A = definition / recognition rule / mechanism
--   B = substantial explanation
--   C / mention-only = not an interpretation

.headers on
.mode column

.print '=== 1. TERMS FAILING PUBLIC DEFINITION STANDARD ==='
SELECT
  slug,
  label,
  status,
  entry_type,
  definition_quality,
  CASE
    WHEN short_definition IS NULL OR trim(short_definition)='' THEN 'missing definition'
    WHEN definition_quality IS NULL THEN 'quality not reviewed'
    WHEN definition_quality < 4 THEN 'quality below public threshold'
    WHEN status='draft' THEN 'still draft'
    WHEN entry_type NOT IN ('technical','astronomical','contextual') THEN 'invalid entry type'
    ELSE 'check manually'
  END AS problem
FROM terms
WHERE short_definition IS NULL
   OR trim(short_definition)=''
   OR definition_quality IS NULL
   OR definition_quality < 4
   OR status='draft'
   OR entry_type NOT IN ('technical','astronomical','contextual')
ORDER BY COALESCE(definition_quality,0), slug;

.print ''
.print '=== 2. INTERPRETATIONS FAILING A/B REVIEW STANDARD ==='
SELECT
  t.slug AS term_slug,
  w.slug AS work_slug,
  i.id AS interpretation_id,
  i.status,
  i.certainty,
  i.evidence_grade,
  i.scope
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
WHERE i.evidence_grade IS NULL
   OR i.evidence_grade NOT IN ('A','B')
   OR i.status='draft'
ORDER BY t.slug, w.slug, i.id;

.print ''
.print '=== 3. REVIEWED INTERPRETATIONS WITHOUT A CITATION LINK ==='
SELECT
  t.slug AS term_slug,
  w.slug AS work_slug,
  i.id AS interpretation_id,
  i.evidence_grade,
  i.scope
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
LEFT JOIN citations c ON c.interpretation_id=i.id
WHERE i.status IN ('reviewed','published')
  AND i.evidence_grade IN ('A','B')
GROUP BY i.id
HAVING COUNT(c.id)=0
ORDER BY t.slug, w.slug, i.id;

.print ''
.print '=== 4. REVIEWED TERMS WITH NO SOURCE INTERPRETATION ==='
SELECT
  t.slug,
  t.label,
  t.entry_type,
  t.definition_quality
FROM terms t
LEFT JOIN interpretations i ON i.term_id=t.id
WHERE t.status IN ('reviewed','published')
GROUP BY t.id
HAVING COUNT(i.id)=0
ORDER BY t.slug;

.print ''
.print '=== 5. TERMS WITH ONLY B-GRADE EVIDENCE ==='
-- Not automatically a failure. This identifies entries whose canonical definition should
-- receive an extra manual check before publication because no source gives a clean A-grade
-- definition in the current corpus.
SELECT
  t.slug,
  t.label,
  t.definition_quality,
  COUNT(i.id) AS interpretation_count,
  SUM(CASE WHEN i.evidence_grade='A' THEN 1 ELSE 0 END) AS grade_a,
  SUM(CASE WHEN i.evidence_grade='B' THEN 1 ELSE 0 END) AS grade_b
FROM terms t
JOIN interpretations i ON i.term_id=t.id
WHERE t.status IN ('reviewed','published')
GROUP BY t.id
HAVING SUM(CASE WHEN i.evidence_grade='A' THEN 1 ELSE 0 END)=0
ORDER BY t.slug;

.print ''
.print '=== 6. ALIAS LABELS SHARED BY DIFFERENT CANONICAL TERMS ==='
-- Shared strings can be legitimate false friends. Every result here requires an explicit
-- editorial reason rather than automatic merging.
SELECT
  lower(trim(a.label)) AS normalized_alias,
  COUNT(DISTINCT a.term_id) AS term_count,
  group_concat(DISTINCT t.slug) AS canonical_terms
FROM aliases a
JOIN terms t ON t.id=a.term_id
GROUP BY lower(trim(a.label))
HAVING COUNT(DISTINCT a.term_id)>1
ORDER BY normalized_alias;

.print ''
.print '=== 7. CANONICAL LABEL COLLISIONS WITH ANOTHER TERM''S ALIAS ==='
SELECT
  t.slug AS canonical_slug,
  t.label AS canonical_label,
  t2.slug AS alias_belongs_to,
  a.alias_type
FROM terms t
JOIN aliases a ON lower(trim(a.label))=lower(trim(t.label))
JOIN terms t2 ON t2.id=a.term_id
WHERE t.id<>t2.id
ORDER BY lower(t.label), t.slug, t2.slug;

.print ''
.print '=== 8. UNREVIEWED TERM RELATIONS ==='
SELECT
  s.slug AS subject_slug,
  r.relation_type,
  o.slug AS object_slug,
  r.status,
  r.note
FROM term_relations r
JOIN terms s ON s.id=r.subject_term_id
JOIN terms o ON o.id=r.object_term_id
WHERE r.status='draft'
ORDER BY s.slug, r.relation_type, o.slug;

.print ''
.print '=== 9. POSSIBLE DUPLICATE SOURCE PASSAGES ==='
-- Same edition + same locator/page fingerprint. Some duplicates are intentional where a
-- later revision creates a narrower passage, so inspect rather than delete automatically.
SELECT
  e.id AS edition_id,
  w.slug AS work_slug,
  COALESCE(sp.page_start,'') AS page_start,
  COALESCE(sp.page_end,'') AS page_end,
  COALESCE(sp.book,'') AS book,
  COALESCE(sp.chapter,'') AS chapter,
  COALESCE(sp.section,'') AS section,
  COUNT(*) AS copies,
  group_concat(sp.id) AS passage_ids
FROM source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works w ON w.id=e.work_id
GROUP BY
  e.id,
  COALESCE(sp.page_start,''),
  COALESCE(sp.page_end,''),
  COALESCE(sp.book,''),
  COALESCE(sp.chapter,''),
  COALESCE(sp.section,''),
  COALESCE(sp.locator_text,'')
HAVING COUNT(*)>1
ORDER BY w.slug, CAST(sp.page_start AS INTEGER), sp.page_start;

.print ''
.print '=== 10. SOURCE PASSAGES NEVER USED BY A CITATION ==='
-- Informational only. Extraction blocks may intentionally remain corpus evidence without
-- supporting a public interpretation. This query is useful for distinguishing that case
-- from accidentally orphaned definition passages.
SELECT
  w.slug AS work_slug,
  sp.id AS passage_id,
  sp.page_start,
  sp.page_end,
  sp.book,
  sp.chapter,
  sp.section,
  sp.locator_text
FROM source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works w ON w.id=e.work_id
LEFT JOIN citations c ON c.source_passage_id=sp.id
WHERE c.id IS NULL
ORDER BY w.slug, CAST(sp.page_start AS INTEGER), sp.page_start, sp.id;

.print ''
.print '=== 11. SUPERSEDED / EXTRACTION-ARTIFACT SLUGS THAT SHOULD NO LONGER EXIST ==='
WITH superseded(slug) AS (
  VALUES
    ('easternness'),('westernness'),('planetary-domain'),('solitary-motion'),('wild-planet'),
    ('besieging'),('mubtazz'),('reciprocal-mastership'),('part-of-fortune'),('twelfth-part'),
    ('rooted-question'),('alcochodon'),('syzygy-almuten-rectification'),('planetary-body-power'),
    ('own-light'),('house-of-substance'),('seventh-house'),('eighth-house'),('ninth-house'),
    ('triplicity-life-thirds'),('fixed-star-gift'),('sign-country-correspondence'),
    ('zodiacal-body-correspondence'),('sign-animal-correspondence'),('sign-plant-correspondence'),
    ('sign-water-fire-correspondence'),('sign-direction'),('quadrant-body-spirit'),
    ('quadrant-element-mixture'),('place-colour'),('fourfold-natural-correspondence')
)
SELECT t.slug, t.label
FROM terms t
JOIN superseded s ON s.slug=t.slug
ORDER BY t.slug;

.print ''
.print '=== 12. REVIEWED TERMS BY TYPE / QUALITY ==='
SELECT
  entry_type,
  definition_quality,
  COUNT(*) AS terms
FROM terms
WHERE status IN ('reviewed','published')
GROUP BY entry_type, definition_quality
ORDER BY entry_type, definition_quality DESC;

.print ''
.print '=== 13. INTERPRETATIONS BY EVIDENCE GRADE ==='
SELECT
  evidence_grade,
  status,
  COUNT(*) AS interpretations
FROM interpretations
GROUP BY evidence_grade, status
ORDER BY evidence_grade, status;

.print ''
.print '=== 14. SOURCE COVERAGE SUMMARY ==='
SELECT
  w.slug AS work_slug,
  COUNT(DISTINCT sp.id) AS source_passages,
  COUNT(DISTINCT i.id) AS interpretations,
  COUNT(DISTINCT CASE WHEN i.evidence_grade='A' THEN i.id END) AS grade_a,
  COUNT(DISTINCT CASE WHEN i.evidence_grade='B' THEN i.id END) AS grade_b,
  COUNT(DISTINCT c.id) AS citation_links
FROM works w
LEFT JOIN editions e ON e.work_id=w.id
LEFT JOIN source_passages sp ON sp.edition_id=e.id
LEFT JOIN interpretations i ON i.work_id=w.id
LEFT JOIN citations c ON c.interpretation_id=i.id
GROUP BY w.id
ORDER BY w.slug;
