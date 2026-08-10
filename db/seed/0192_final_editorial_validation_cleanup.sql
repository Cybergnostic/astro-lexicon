-- Final Editorial Baseline validation cleanup.
--
-- Resolve only concrete integrity issues exposed by the final corpus audit. This seed does
-- not add new article architecture or new doctrine.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- AMBIGUOUS / OVER-BROAD ALIASES
-- -----------------------------------------------------------------------------

-- "Lot of Courage" should not point to two different canonical Lots. Keep the shorter
-- generic rendering with the Mars/Courage entry and remove it from the broader
-- Courage/Violence/Combat construction.
DELETE FROM aliases
WHERE lower(trim(label))='lot of courage'
  AND term_id=(SELECT id FROM terms WHERE slug='lot-of-courage-violence-combat');

-- Radicality is a quality of a figure/question, not itself a "Radical Figure".
DELETE FROM aliases
WHERE lower(trim(label))='radical figure'
  AND term_id=(SELECT id FROM terms WHERE slug='radicality');

-- Jarbakhtar and Distributor are related but intentionally distinct in the canonical corpus;
-- do not let a translation alias collapse them back together.
DELETE FROM aliases
WHERE lower(trim(label))='distributor'
  AND term_id=(SELECT id FROM terms WHERE slug='jarbakhtar');

-- Election is the selected act/time/chart; Electional Astrology is the broader branch.
DELETE FROM aliases
WHERE lower(trim(label))='electional astrology'
  AND term_id=(SELECT id FROM terms WHERE slug='election');

-- Judicial Astrology has a broader historical scope than the modern predictive-astrology
-- category. Keep the relation conceptually, not as a one-to-one alias.
DELETE FROM aliases
WHERE lower(trim(label))='judicial astrology'
  AND term_id=(SELECT id FROM terms WHERE slug='predictive-astrology');

-- -----------------------------------------------------------------------------
-- DANGLING PAGE-COMPOSITION REFERENCES
-- -----------------------------------------------------------------------------

-- Editorial cleanup removed or demoted some stored article blocks after earlier composition
-- seeds had referenced them. A public composition must never point at a source block that no
-- longer exists in reviewed/published form.
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
