-- Editorial Baseline v1: seven traditional planets.
--
-- This pass removes prose that duplicates normalized structured reference layers,
-- removes reader-irrelevant corpus/process wording, and composes the remaining
-- teaching paragraphs into a small public hierarchy. Historical/source accounts
-- and normalized planetary/dignity/cycle data remain unchanged.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- READER-FACING DEFINITIONS / PROFILE NOTES
-- -----------------------------------------------------------------------------

UPDATE terms SET short_definition=CASE slug
  WHEN 'sun' THEN 'The Sun is our star and the greater luminary of the traditional seven-planet scheme; it leads the diurnal sect and serves as the reference body for planetary solar phase and visibility.'
  WHEN 'moon' THEN 'The Moon is Earth’s natural satellite and the lesser luminary of the traditional seven-planet scheme; it leads the nocturnal sect and is read through its rapidly changing phase and motion.'
  WHEN 'mercury' THEN 'Mercury is the innermost rocky planet and an inferior planet in Earth-based observational geometry; traditional astrology treats its sect, qualitative expression and benefic or malefic tendency as unusually conditional.'
  WHEN 'venus' THEN 'Venus is a rocky inferior planet seen alternately as a morning or evening star; in traditional astrology it is the nocturnal lesser benefic with an attributed cold and moist nature.'
  WHEN 'mars' THEN 'Mars is a rocky superior planet whose apparent cycle includes opposition and retrogradation; in traditional astrology it is the nocturnal lesser malefic with an attributed hot and dry nature.'
  WHEN 'jupiter' THEN 'Jupiter is a gas-giant superior planet; in traditional astrology it is the diurnal greater benefic with an attributed moderately hot and moist nature.'
  WHEN 'saturn' THEN 'Saturn is a gas-giant superior planet and the outermost body of the traditional naked-eye planetary order; in traditional astrology it is the diurnal greater malefic with an attributed cold and dry nature.'
END
WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

UPDATE planetary_profiles
SET traditional_note=CASE (SELECT slug FROM terms WHERE id=planet_term_id)
  WHEN 'sun' THEN 'Greater luminary and leader of the diurnal sect. Its traditional heat and dryness are attributed qualities and should not be confused with modern stellar physics.'
  WHEN 'moon' THEN 'Lesser luminary and leader of the nocturnal sect. Traditional descriptions of the Moon are strongly sensitive to phase and changing relation to the Sun.'
  WHEN 'mercury' THEN 'Mercury is not assigned one fixed sect, benefic/malefic class or elemental-quality expression in every circumstance; several traditional classifications vary with phase and planetary association.'
  WHEN 'venus' THEN 'Lesser benefic of the nocturnal sect, traditionally attributed a cold and moist nature.'
  WHEN 'mars' THEN 'Lesser malefic of the nocturnal sect, traditionally attributed a hot and dry nature.'
  WHEN 'jupiter' THEN 'Greater benefic of the diurnal sect, traditionally attributed a moderately hot and moist nature.'
  WHEN 'saturn' THEN 'Greater malefic of the diurnal sect, traditionally attributed a strongly cold and dry nature.'
END
WHERE planet_term_id IN (
  SELECT id FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn')
);

-- -----------------------------------------------------------------------------
-- STRUCTURED DATA OWNS STRUCTURED FACTS
-- -----------------------------------------------------------------------------

-- The dignity paragraph merely explained that the assignments below came from
-- normalized tables. DignityConnections already renders the actual source-labelled
-- dignity data, so this prose does not belong in the public article.
DELETE FROM term_article_sections
WHERE section_key='dignities'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn')
  );

-- The synodic-cycle prose repeats the dedicated PlanetaryCycle component, which already
-- presents the period and phase sequence. Keep the structured cycle as the sole owner.
DELETE FROM term_article_sections
WHERE section_key='synodic-cycle'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('moon','mercury','venus','mars','jupiter','saturn')
  );

-- -----------------------------------------------------------------------------
-- PUBLIC ARTICLE COMPOSITION
-- -----------------------------------------------------------------------------

-- Replace any earlier composition for these entries so this seed is deterministic.
DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn')
);

-- Two genuine article sections are sufficient. Dedicated structured components for
-- profile, dignities and synodic cycle follow independently on the page.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'nature-condition','Nature and condition',10,'reviewed',
       'Editorial Baseline v1 planet-family composition.'
FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'astronomy-motion','Astronomy and motion',20,'reviewed',
       'Editorial Baseline v1 planet-family composition.'
FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

-- Nature/condition blocks. Existing content remains normalized as individual article
-- sections; this layer only controls reader-facing hierarchy.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE
         WHEN s.section_key IN ('nature','variability','mind','joining','change','centrality','constructive-destructive') THEN 'subsection'
         ELSE 'paragraph'
       END,
       CASE
         WHEN s.section_key IN ('nature','variability','mind','joining','change','centrality','constructive-destructive') THEN 1
         ELSE 0
       END,
       s.sort_order,'reviewed','Editorial Baseline v1 planet-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='nature-condition'
  AND ps.status='reviewed'
  AND s.status IN ('reviewed','published')
  AND s.section_key NOT IN ('astronomical-identity','phase-motion','solar-relations','phase','sequence')
ORDER BY ps.term_id,s.sort_order,s.id;

-- Astronomy/motion blocks. The first astronomical identity paragraph is intentionally
-- unheaded; the section heading already supplies its context. Distinct phase/motion
-- doctrines retain subsection headings where they add real orientation.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key IN ('phase-motion','solar-relations','phase','sequence') THEN 'subsection' ELSE 'paragraph' END,
       CASE WHEN s.section_key IN ('phase-motion','solar-relations','phase','sequence') THEN 1 ELSE 0 END,
       s.sort_order,'reviewed','Editorial Baseline v1 planet-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='astronomy-motion'
  AND ps.status='reviewed'
  AND s.status IN ('reviewed','published')
  AND s.section_key IN ('astronomical-identity','phase-motion','solar-relations','phase','sequence')
ORDER BY ps.term_id,s.sort_order,s.id;
