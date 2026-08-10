-- Editorial family pass: complete a cluster of basic celestial vocabulary already backed
-- by reviewed Abū Maʿshar evidence.
--
-- The terms belong to one teaching layer: the stellar sphere, its conventional figures,
-- the two luminaries, lunar stations, and the Moon's increase/decrease of light.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- FIXED STARS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Fixed Stars are the slow-moving stars of the stellar sphere, distinguished in traditional astronomy from the seven wandering planets by their much slower common motion against the celestial background. Abū Maʿshar treats them as a large stellar population organized by brightness and by conventional constellational figures.',
  'reviewed',
  'Teaching synthesis from reviewed Abū Maʿshar Part II evidence. The separate singular Fixed Star taxonomy entry remains a narrower modern-reference page for now.'
FROM terms WHERE slug='fixed-stars';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='fixed-stars');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'wandering-contrast','Fixed stars versus wandering planets',
  'The defining contrast is kinematic. The seven planets change their positions through the zodiac comparatively quickly and irregularly, while the fixed stars are treated as sharing the very slow motion of the stellar sphere. “Fixed” therefore means relatively fixed against one another, not absolutely motionless.',
  10,'reviewed',NULL
FROM terms WHERE slug='fixed-stars';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'organization','Brightness and constellation organize the stellar sphere',
  'Abū Maʿshar presents the fixed stars through magnitude classes and the traditional constellation catalogue. Magnitude describes apparent brightness; constellation groups stars into conventional figures. These are different organizing systems and neither should be confused with the equal thirty-degree zodiacal signs.',
  20,'reviewed',NULL
FROM terms WHERE slug='fixed-stars';

-- -----------------------------------------------------------------------------
-- CONSTELLATION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Constellation is a conventional stellar figure formed by grouping stars into an imagined pattern. Abū Maʿshar explicitly treats the traditional figures as constructions of imagination and thought and reports the familiar forty-eight-constellation framework divided into northern, zodiacal and southern groups.',
  'reviewed',
  'Source-backed teaching article from Abū Maʿshar Part II, Chapter 1.'
FROM terms WHERE slug='constellation';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='constellation');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'imagined-figure','A figure imposed on a field of stars',
  'The constellation is not a literal line or physical outline in the sky. It is a conventional way of organizing stars into a recognizable figure. Individual stars retain their own positions and brightness even when they are named as parts of one constellation.',
  10,'reviewed',NULL
FROM terms WHERE slug='constellation';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-zodiac-sign','Constellation is not the same as zodiacal sign',
  'The twelve zodiacal constellations and the twelve zodiacal signs can share names, but the concepts are different. A sign is an equal thirty-degree division of the zodiac; a constellation is an irregular stellar figure. Keeping the two separate is essential when reading historical astronomical and astrological texts.',
  20,'reviewed',NULL
FROM terms WHERE slug='constellation';

-- -----------------------------------------------------------------------------
-- LUMINARIES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Luminaries are the Sun and Moon considered together as the two principal celestial lights. Traditional authors frequently treat them as a pair while still distinguishing their different motions, light cycles, sect roles and astrological functions.',
  'reviewed',
  'Foundational paired term; detailed solar and lunar doctrines remain on the individual Sun and Moon pages.'
FROM terms WHERE slug='luminaries';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='luminaries');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired-lights','A paired category, not a third celestial body',
  'Luminaries is a collective term. It does not name an additional astrological factor beyond the Sun and Moon; it is used when a doctrine applies to the two principal lights together or contrasts them with the five non-luminary planets.',
  10,'reviewed',NULL
FROM terms WHERE slug='luminaries';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'different-cycles','The pair remains internally differentiated',
  'The Sun and Moon are grouped as lights but do not behave identically. The Sun supplies the central annual and diurnal light reference, while the Moon changes rapidly in phase and position. Historical doctrines therefore use the collective category without erasing the different properties of each luminary.',
  20,'reviewed',NULL
FROM terms WHERE slug='luminaries';

-- -----------------------------------------------------------------------------
-- LUNAR MANSIONS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Lunar Mansions are twenty-eight traditional stations associated with the Moon’s course. They divide the lunar circuit into a sequence of named or numbered places used in several branches of astrology, including electional and meteorological practice. Abū Maʿshar also presents them as part of an inherited observational tradition connecting lunar position with terrestrial conditions.',
  'reviewed',
  'Source-backed introductory article; individual mansion catalogues and judgment rules remain source-specific.'
FROM terms WHERE slug='lunar-mansions';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='lunar-mansions');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'twenty-eight','A twenty-eight-station lunar framework',
  'The mansion system follows the Moon through twenty-eight successive stations. It is therefore a lunar positional framework rather than another twelve-sign zodiac. Historical traditions can differ in boundaries, names and applications, so the encyclopedia keeps detailed mansion systems attached to their sources.',
  10,'reviewed',NULL
FROM terms WHERE slug='lunar-mansions';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'uses','Used across more than one branch of astrology',
  'The mansions occur in several technical contexts rather than belonging to one single method. Source authors use lunar stations in weather observation, elections and other lunar judgments. Their presence in a chart is therefore a positional datum whose interpretation depends on the doctrine being applied.',
  20,'reviewed',NULL
FROM terms WHERE slug='lunar-mansions';

-- -----------------------------------------------------------------------------
-- WAXING / WANING
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Waxing is the increase of the Moon’s visible illuminated portion as the Moon proceeds from conjunction with the Sun toward opposition. It describes the growing-light half of the synodic cycle and should be distinguished from the Moon simply increasing in zodiacal longitude or speed.',
  'reviewed',
  'Astronomical/lunar-condition teaching article based on reviewed Abū Maʿshar evidence.'
FROM terms WHERE slug='waxing';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='waxing');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'light-cycle','Increase of light, not generic increase',
  'Waxing refers specifically to the increasing illuminated phase of the Moon. It is a relation to the Sun within the lunation cycle, not a statement that every astronomical quantity associated with the Moon is increasing at the same time.',
  10,'reviewed',NULL
FROM terms WHERE slug='waxing';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired-with-waning','Paired with Waning',
  'Waxing and Waning are complementary halves of the lunar light cycle. The Moon waxes toward opposition/fullness and wanes after opposition toward the following conjunction.',
  20,'reviewed',NULL
FROM terms WHERE slug='waxing';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Waning is the decrease of the Moon’s visible illuminated portion as the Moon proceeds from opposition toward the following conjunction with the Sun. It describes the diminishing-light half of the synodic cycle and is the counterpart of Waxing.',
  'reviewed',
  'Astronomical/lunar-condition teaching article based on reviewed Abū Maʿshar evidence.'
FROM terms WHERE slug='waning';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='waning');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'light-cycle','Decrease of light, not generic decrease',
  'Waning refers specifically to the diminishing illuminated phase of the Moon. It should not be confused with decreasing zodiacal speed, descending latitude or another unrelated astronomical decrease.',
  10,'reviewed',NULL
FROM terms WHERE slug='waning';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired-with-waxing','Paired with Waxing',
  'Waning follows the opposition/full-Moon side of the cycle and continues toward the next conjunction. Together, Waxing and Waning describe the increase and decrease of lunar light across the synodic month.',
  20,'reviewed',NULL
FROM terms WHERE slug='waning';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Waxing and Waning are complementary phases of the lunar light cycle.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='waxing' AND b.slug='waning';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Waning and Waxing are complementary phases of the lunar light cycle.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='waning' AND b.slug='waxing';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'organized-into','Constellations are conventional figures used to organize groups of fixed stars.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='fixed-stars' AND b.slug='constellation';

-- -----------------------------------------------------------------------------
-- FAMILY-SPECIFIC PAGE COMPOSITION
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'fixed-stars','constellation','luminaries','lunar-mansions','waxing','waning'
  )
);

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'celestial-vocabulary','Celestial vocabulary',10,'reviewed',
  'Family-specific composition for basic stellar and lunar vocabulary.'
FROM terms WHERE slug IN (
  'fixed-stars','constellation','luminaries','lunar-mansions','waxing','waning'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for basic celestial vocabulary.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='celestial-vocabulary'
  AND s.status IN ('reviewed','published');
