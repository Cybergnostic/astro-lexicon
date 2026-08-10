-- Editorial Baseline v1: final residual cleanup.
--
-- This seed does not add new editorial architecture. It removes stale composition pointers
-- left behind by article pruning and resolves alias collisions surfaced by the final audit.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- REMOVE DANGLING COMPOSITION POINTERS
-- -----------------------------------------------------------------------------
-- A composition block is invalid only when it points to an article section/table that no
-- longer exists as reviewed/published content. Stored article blocks that are intentionally
-- omitted from composition are allowed and are handled as non-blocking editorial coverage.

DELETE FROM term_page_blocks
WHERE source_kind='article-section'
  AND NOT EXISTS (
    SELECT 1
    FROM term_page_sections ps
    JOIN term_article_sections s
      ON s.term_id=ps.term_id
     AND s.section_key=term_page_blocks.source_key
     AND s.status IN ('reviewed','published')
    WHERE ps.id=term_page_blocks.page_section_id
  );

DELETE FROM term_page_blocks
WHERE source_kind='article-table'
  AND NOT EXISTS (
    SELECT 1
    FROM term_page_sections ps
    JOIN term_article_tables tb
      ON tb.term_id=ps.term_id
     AND tb.table_key=term_page_blocks.source_key
     AND tb.status IN ('reviewed','published')
    WHERE ps.id=term_page_blocks.page_section_id
  );

-- -----------------------------------------------------------------------------
-- RESOLVE AMBIGUOUS / MISLEADING ALIASES
-- -----------------------------------------------------------------------------
-- These aliases collide with another canonical term or with a genuinely distinct concept.
-- Removing the ambiguous shorthand preserves the concepts themselves and their source data.

-- Two distinct Lot entries both inherited the broad shorthand "Lot of Courage". The phrase
-- is too ambiguous to resolve safely to either canonical entry, so keep only the specific
-- canonical labels and source-specific aliases.
DELETE FROM aliases
WHERE lower(trim(label))='lot of courage'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('lot-of-mars-courage','lot-of-courage-violence-combat')
  );

-- "Radical Figure" belongs with the concrete radical question/figure, not with the abstract
-- doctrine of radicality.
DELETE FROM aliases
WHERE lower(trim(label))='radical figure'
  AND term_id=(SELECT id FROM terms WHERE slug='radicality');

-- Jarbakhtar is related to Distributor but remains operationally distinct in the reviewed
-- corpus; do not make the canonical Distributor label an alias of Jarbakhtar.
DELETE FROM aliases
WHERE lower(trim(label))='distributor'
  AND term_id=(SELECT id FROM terms WHERE slug='jarbakhtar');

-- Election is the act/figure selected for an undertaking; Electional Astrology is the branch.
DELETE FROM aliases
WHERE lower(trim(label))='electional astrology'
  AND term_id=(SELECT id FROM terms WHERE slug='election');

-- Judicial Astrology is retained as its own historical branch/context entry rather than an
-- alias that collapses it into Predictive Astrology.
DELETE FROM aliases
WHERE lower(trim(label))='judicial astrology'
  AND term_id=(SELECT id FROM terms WHERE slug='predictive-astrology');
