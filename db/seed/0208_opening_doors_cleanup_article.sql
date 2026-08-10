-- Editorial cleanup and teaching article: Opening the Doors.
--
-- An early Bonatti extraction attached his reception-based "Opening of the Gates" to the
-- meteorological `opening-the-doors` slug. The canonical reconciliation later separated
-- these doctrines but did not remove that stale interpretation. Bonatti's reception doctrine
-- is already represented correctly under `opening-of-gates`, so the stale duplicate is
-- removed here before the al-Bīrūnī meteorological article is composed.

PRAGMA foreign_keys = ON;

DELETE FROM interpretations
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND scope='Treatise 9, Part 3, Ch. 5';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Opening the Doors is al-Bīrūnī’s meteorological configuration involving planetary pairs that stand in opposition by nature or by domicile. In his weather doctrine these pairings act as testimonies for the release or opening of particular kinds of weather, including rain, storms and winds. The condition is not simply an ordinary zodiacal opposition, and it is distinct from Bonatti’s reception doctrine called Opening of the Gates.',
  'reviewed',
  'Source-specific al-Bīrūnī §511 article. A stale Bonatti Opening-of-the-Gates interpretation was removed from this term in the same seed.'
FROM terms WHERE slug='opening-the-doors';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'weather-context','A meteorological configuration',
  'Al-Bīrūnī presents Opening the Doors inside weather astrology. The configuration is used as one testimony for atmospheric release or change, and he associates different planetary pairings with different kinds of weather. Its historical scope in the reviewed corpus is therefore meteorological rather than a general rule for every branch of astrology.',
  10,'reviewed','Directly reflects al-Bīrūnī §511.'
FROM terms WHERE slug='opening-the-doors';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'kind-of-opposition','Opposition by nature or domicile',
  'The relevant opposition is not limited to two planets standing 180° apart in zodiacal longitude. Al-Bīrūnī explains the configuration through planets whose natures oppose one another or whose domiciles stand opposed. The doctrine therefore depends on a qualitative or rulership relationship between the planets, not merely on an ordinary aspect measurement.',
  20,'reviewed',NULL
FROM terms WHERE slug='opening-the-doors';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'weather-release','Different pairs signify different weather release',
  'Within al-Bīrūnī’s account, particular opposed planetary pairs are associated with the opening of rain, storms or winds. Those pairings belong to the source-specific meteorological catalogue. The canonical concept therefore records the shared mechanism—opposed planetary natures or domiciles functioning as a weather testimony—without turning one transmitted list into a universal table.',
  30,'reviewed','Keeps source-specific weather pair catalogues out of the canonical definition.'
FROM terms WHERE slug='opening-the-doors';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-opening-gates','Not Bonatti’s Opening of the Gates',
  'Bonatti uses a closely similar English phrase for a different mechanism. His Opening of the Gates belongs to reception doctrine: reception overcomes ordinary hostility and allows one planet to welcome another. Because that recognition rule is different from al-Bīrūnī’s meteorological configuration, the lexicon keeps the two entries separate despite the similar translated names.',
  40,'reviewed','Makes the corrected canonical separation explicit for readers.'
FROM terms WHERE slug='opening-the-doors';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'opening-doors-doctrine','Opening the Doors',10,'reviewed',
  'Family-specific composition for the corrected Opening the Doors article.'
FROM terms WHERE slug='opening-the-doors';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='weather-context' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='weather-context' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the corrected Opening the Doors article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='opening-doors-doctrine'
  AND s.status IN ('reviewed','published');
