-- Editorial Baseline v1: astronomy / motion / visibility / solar phase.
--
-- Structured AstronomyMechanics visuals now own the compact comparative geometry for
-- coordinate grids, motion phases, solar-relative classes and eclipse alignment. Article
-- prose should explain the concepts and historical/source-specific rules rather than repeat
-- the same comparison as a second table or paragraph block.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- REMOVE PRESENTATION DUPLICATION NOW OWNED BY STRUCTURED VISUALS
-- -----------------------------------------------------------------------------

-- The AstronomyMechanics coordinate visual already contrasts the ecliptic and equatorial
-- grids. Keep the observer-frame explanation, but remove the second prose restatement and
-- the near-identical comparison table.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='celestial-sphere')
  AND section_key='two-grids';

DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='celestial-sphere')
  AND table_key='coordinate-systems';

-- The motion visual already gives the First Motion / Second Motion comparison and the
-- direct -> station -> retrograde sequence. Keep the individual articles, but not another
-- system-level comparison table saying the same thing.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='second-movement')
  AND table_key='first-second-motion';

-- Ecliptic projection's visual already carries the longitude-vs-latitude warning. The
-- canonical definition and source/coordinate relations retain the doctrine without a
-- duplicated article subsection.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='ecliptic-projection')
  AND section_key='longitude-latitude';

-- -----------------------------------------------------------------------------
-- READER-FACING COPY: REMOVE PROJECT / IMPLEMENTATION LANGUAGE
-- -----------------------------------------------------------------------------

UPDATE term_articles
SET intro='The celestial sphere is a positional model: imagine every direction from the observer projected onto a surrounding sphere. It makes it possible to describe the horizon, meridian, celestial equator, ecliptic and coordinate circles without implying that celestial bodies are physically fixed to a shell.'
WHERE term_id=(SELECT id FROM terms WHERE slug='celestial-sphere');

UPDATE term_articles
SET intro='The ecliptic is the central reference circle of zodiacal astronomy: the Sun’s apparent annual path on the celestial sphere and, geometrically, the plane of Earth’s orbit projected into the sky. Zodiacal longitude is measured along it, while ecliptic latitude measures distance north or south of it.'
WHERE term_id=(SELECT id FROM terms WHERE slug='ecliptic');

UPDATE term_articles
SET intro='Ecliptic projection expresses a celestial position by its longitude along the ecliptic so that an off-ecliptic body can be compared directly with zodiacal degrees. It is deliberately a projection: the object’s latitude remains a separate coordinate.'
WHERE term_id=(SELECT id FROM terms WHERE slug='ecliptic-projection');

-- -----------------------------------------------------------------------------
-- COMPOSE THE MAIN ASTRONOMY FAMILY INTO GENUINE ARTICLE SECTIONS
-- -----------------------------------------------------------------------------

-- Replace generic/global composition for the main foundation terms with explicit public
-- groupings. Terms not listed here continue to use the database-wide default composition.
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'celestial-sphere','ecliptic','equinoctial','celestial-longitude','celestial-latitude',
  'declination','first-movement','second-movement','direct-motion','station','retrogradation',
  'oriental','occidental','combustion','under-the-beams','cazimi','ecliptic-projection',
  'occultation','eclipse','solar-eclipse','lunar-eclipse'
));

-- Coordinate foundations: remaining article sections/tables are subordinate to one public
-- section rather than each becoming an independent H2.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'geometry','Geometry and coordinates',10,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM terms t
WHERE t.slug IN ('celestial-sphere','ecliptic','equinoctial','celestial-longitude','celestial-latitude','declination','ecliptic-projection','occultation')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s
    WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb
    WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='geometry' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='geometry' AND tb.status IN ('reviewed','published');

-- Apparent motion family.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'motion','Apparent motion',10,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM terms t
WHERE t.slug IN ('first-movement','second-movement','direct-motion','station','retrogradation')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='motion' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='motion' AND tb.status IN ('reviewed','published');

-- Solar phase / solar proximity family.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'solar-condition','Solar phase and proximity',10,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM terms t
WHERE t.slug IN ('oriental','occidental','combustion','under-the-beams','cazimi')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='solar-condition' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='solar-condition' AND tb.status IN ('reviewed','published');

-- Eclipse / occultation family. Occultation may already have a coordinate section above;
-- do not add a second top-level section to it here.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'eclipse-geometry','Eclipse geometry',10,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM terms t
WHERE t.slug IN ('eclipse','solar-eclipse','lunar-eclipse')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='eclipse-geometry' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 astronomy composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='eclipse-geometry' AND tb.status IN ('reviewed','published');
