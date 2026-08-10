-- A-tier editorial completion: causal natural-philosophy vocabulary.
--
-- Abū Maʿshar's Celestial Power and Bonatti's Astral Influence belong to the same broad
-- causal family, but the translated labels are not asserted to be one stable historical
-- lexical identity. The reader-facing task is to expose that correspondence while keeping
-- causal power distinct from significatory Indication.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- CELESTIAL POWER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Celestial Power is Abū Maʿshar’s causal category for the capacity of celestial bodies and their motions to alter or act upon the lower world. In his explanatory framework this must be distinguished from Indication: a celestial condition may signify a terrestrial condition, while causal power concerns the separate question of how celestial bodies are understood to act upon terrestrial change.',
  'reviewed',
  'Source-bound natural-philosophy synthesis. Existing evidence is B-grade; do not inflate the translated label into a universal technical term.'
FROM terms WHERE slug='celestial-power';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='celestial-power');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'causal-category','A causal category',
  'The entry concerns causal or altering power, not merely the fact that a celestial configuration can be read as a sign. It belongs to the natural-philosophical explanation of astrology rather than to a chart-reading technique with one operational recognition rule.',10,'reviewed',NULL
FROM terms WHERE slug='celestial-power';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-indication','Distinct from Indication',
  'Abū Maʿshar explicitly separates the causal power attributed to celestial bodies from their significatory relation to terrestrial events. Indication concerns what a celestial condition points to or signifies; Celestial Power concerns causal action. The two can appear together in the same theory without being synonyms.',20,'reviewed',NULL
FROM terms WHERE slug='celestial-power';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'bonatti-correspondence','Correspondence with Bonatti’s Astral Influence',
  'Bonatti’s Astral Influence belongs to the same broad family of celestial causal action on the lower world. The corpus therefore links the two concepts, but it does not claim that the translated expressions Celestial Power and Astral Influence were historically one fixed technical term.',30,'reviewed',NULL
FROM terms WHERE slug='celestial-power';

-- -----------------------------------------------------------------------------
-- ASTRAL INFLUENCE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Astral Influence is Bonatti’s causal language for celestial action upon the lower world. It conceptually corresponds to Abū Maʿshar’s discussion of Celestial Power, but the lexicon keeps the two source expressions separate because the surviving corpus does not establish them as one stable historical term.',
  'reviewed',
  'Bonatti source concept with B-grade evidence; preserve correspondence without forcing lexical identity.'
FROM terms WHERE slug='astral-influence';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='astral-influence');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'causal-language','Celestial action on the lower world',
  'The entry belongs to the causal natural philosophy surrounding astrological practice. It describes celestial influence or action rather than a specific predictive technique, dignity, aspect or time-lord rule.',10,'reviewed',NULL
FROM terms WHERE slug='astral-influence';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'correspondence-not-synonymy','Conceptual correspondence, not asserted synonymy',
  'Abū Maʿshar’s Celestial Power and Bonatti’s Astral Influence address closely corresponding causal ideas. Because the labels come through different source and translation contexts, the encyclopedia links them as conceptually corresponding rather than merging them as lexical synonyms.',20,'reviewed',NULL
FROM terms WHERE slug='astral-influence';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'signification-distinction','Do not collapse cause into signification',
  'The causal vocabulary should also remain distinct from Indication. A source may distinguish what a celestial condition signifies from the causal power attributed to celestial bodies themselves. Preserving that difference is necessary to represent the historical theory accurately.',30,'reviewed',NULL
FROM terms WHERE slug='astral-influence';

-- Make the causal/significatory distinction explicit from both reader directions.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'distinct-from','Astral Influence belongs to causal natural philosophy; Indication names a significatory relation rather than the causal action itself.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='astral-influence' AND b.slug='indication';

-- Explicit composition.
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('celestial-power','astral-influence'));
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'causal-doctrine','Celestial causation',10,'reviewed','A-tier causal-doctrine synthesis.'
FROM terms WHERE slug IN ('celestial-power','astral-influence');
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','A-tier causal-doctrine synthesis.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='causal-doctrine'
  AND ps.term_id IN (SELECT id FROM terms WHERE slug IN ('celestial-power','astral-influence'))
  AND s.status IN ('reviewed','published');
