-- Editorial follow-up: complete the Revolution of the World-Year teaching article.
--
-- The reviewed Bonatti material defines this as the mundane annual revolution erected
-- for the Sun's entrance into the first minute of Aries and used to judge the coming
-- year for a region. Related ruler-selection, quarterly/half-year renewal and eclipse
-- procedures remain separate doctrines rather than being folded into the definition.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Revolution of the World-Year is a mundane annual figure erected for the Sun’s entrance into the first minute of Aries. Bonatti treats that ingress as the beginning of the year for this purpose and uses the resulting chart to judge the general condition of the coming year for a region. It is therefore an annual revolution with a specific mundane starting point, not a natal solar return and not merely a generic chart for any date in the year.',
  'reviewed',
  'Synthesis of reviewed Bonatti Treatise 8.1 evidence. Lord-of-Year selection and shorter revolution periods remain separate technical entries.'
FROM terms WHERE slug='world-year-revolution';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='world-year-revolution');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'aries-ingress','The Aries ingress defines the world-year',
  'Bonatti defines an annual revolution generally as the Sun returning to the zodiacal point from which the year is reckoned. For the year of the world, that point is the first minute of Aries. The figure begins when the Sun enters that point and is judged as the principal annual mundane chart.',
  10,'reviewed','Directly reflects Treatise 8.1, Preface.'
FROM terms WHERE slug='world-year-revolution';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mundane-scope','A regional mundane judgment, not a natal return',
  'The world-year revolution belongs to mundane astrology. Its subject is the condition of the coming year for a region and the collective matters represented in the ingress figure. Bonatti explicitly distinguishes this use from the revolution of a nativity or another inception, where the Sun returns to that figure’s own starting longitude instead.',
  20,'reviewed',NULL
FROM terms WHERE slug='world-year-revolution';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'annual-framework','The ingress is the framework; annual rulers are separate judgments',
  'Once the ingress figure is established, Bonatti applies further annual procedures within it, including selection of the Lord of the Year, judgment of the Lord of the Ascendant, the significator of the ruler, reception, planetary condition and other testimonies. These procedures describe how the revolution is judged; they are not alternative definitions of the revolution itself.',
  30,'reviewed','Keeps the chart object distinct from its ruler-selection and delineation procedures.'
FROM terms WHERE slug='world-year-revolution';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'eclipse-modification','Eclipses can modify the annual judgment',
  'Bonatti says that when an eclipse occurs within the year, the ordinary annual judgment must be reconsidered through the eclipse figure, especially the eclipsed sign and its ruler, the eclipse Ascendant, the Lord of the Year and the significator of the ruler. The eclipse does not replace the definition of the world-year revolution; it becomes an additional figure that can alter how that year is judged.',
  40,'reviewed','Directly reflects Treatise 8.1, Chapter 115.'
FROM terms WHERE slug='world-year-revolution';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='world-year-revolution');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'world-year-doctrine','World-year revolution',10,'reviewed',
  'Family-specific composition for the completed Revolution of the World-Year article.'
FROM terms WHERE slug='world-year-revolution';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='aries-ingress' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='aries-ingress' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Revolution of the World-Year article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='world-year-doctrine'
  AND s.status IN ('reviewed','published');
