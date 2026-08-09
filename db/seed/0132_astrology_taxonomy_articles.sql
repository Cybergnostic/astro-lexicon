-- Encyclopedia conversion pass: zodiac reference systems, branches of astrology,
-- chart types and melothesia. These are taxonomy/reference entries, not manuals for
-- chart judgment. Sensitive medical material remains historical and descriptive.

-- -----------------------------------------------------------------------------
-- ZODIAC REFERENCE SYSTEMS
-- -----------------------------------------------------------------------------
WITH z(slug,intro,distinction) AS (
  VALUES
    ('tropical-zodiac','The Tropical Zodiac is a twelve-sign zodiac anchored to the seasonal equinoxes and solstices. Zero Aries is defined by the vernal equinox, so the signs remain tied to the tropical year rather than to a fixed stellar marker.','The tropical zodiac and the visible constellations are not identical objects. Precession changes the stellar background of the equinoctial point while the tropical zodiac continues to define 0° Aries from that moving seasonal reference.'),
    ('sidereal-zodiac','A Sidereal Zodiac is a twelve-sign zodiac referenced to a stellar framework rather than directly to the moving equinox. Different sidereal systems can choose different fiducial stars or ayanamsa values, so “sidereal zodiac” names a family of related reference systems rather than one universally fixed offset.','The defining distinction from the tropical zodiac is the reference origin. A sidereal zodiac preserves a stellar relation by applying a precessional offset; the exact offset is a separate technical convention and should not be built into the generic definition.'),
    ('draconic-zodiac','The Draconic Zodiac is a nodal coordinate system that places the Moon’s ascending node at 0° Aries and measures the remaining positions relative to that reference. It re-expresses positions in a node-centered zodiac rather than changing the physical location of the planets.','Draconic coordinates are distinct from both tropical and sidereal zodiac systems because the zero point is the lunar ascending node. Interpretive uses vary considerably and are not part of the coordinate-system definition itself.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,z.intro,'reviewed','Zodiac-system article; interpretive doctrines remain source-specific.'
FROM z JOIN terms t ON t.slug=z.slug;

WITH z(slug,distinction) AS (
  VALUES
    ('tropical-zodiac','The tropical zodiac and the visible constellations are not identical objects. Precession changes the stellar background of the equinoctial point while the tropical zodiac continues to define 0° Aries from that moving seasonal reference.'),
    ('sidereal-zodiac','The defining distinction from the tropical zodiac is the reference origin. A sidereal zodiac preserves a stellar relation by applying a precessional offset; the exact offset is a separate technical convention and should not be built into the generic definition.'),
    ('draconic-zodiac','Draconic coordinates are distinct from both tropical and sidereal zodiac systems because the zero point is the lunar ascending node. Interpretive uses vary considerably and are not part of the coordinate-system definition itself.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'distinction','Reference-point distinction',z.distinction,10,'reviewed'
FROM z JOIN terms t ON t.slug=z.slug;

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'zodiac-reference-systems','Zodiac reference systems',
  'The same twelve-sign, 360-degree structure can be expressed from different zero-point conventions.',
  '["System","Primary reference","Key qualification"]',
  '[["Tropical","Vernal equinox / seasonal year","0° Aries follows the equinoctial point"],["Sidereal","Stellar framework","Requires a chosen fiducial/ayanamsa convention"],["Draconic","Lunar ascending node","0° Aries is reset to the node"]]',
  35,'reviewed','Reference-system comparison; interpretive traditions are outside this table.'
FROM terms WHERE slug='zodiac';

-- -----------------------------------------------------------------------------
-- BRANCHES OF ASTROLOGY
-- -----------------------------------------------------------------------------
WITH b(slug,intro,scope_text) AS (
  VALUES
    ('natal-astrology','Natal Astrology is the branch of astrology centered on a nativity: a chart erected for birth and interpreted in relation to the native’s life. The branch includes many distinct doctrines and timing techniques, none of which is synonymous with natal astrology as a whole.','The defining object is the nativity itself. Character, family, livelihood, relationships, eminence and timing can all appear within natal literature, but they remain topics and techniques inside the larger branch rather than separate definitions of it.'),
    ('horary-astrology','Horary Astrology judges a specific question from a chart erected for the time at which the question is received, understood or otherwise becomes astrologically radical according to the relevant tradition.','Horary is defined by the question/event of inquiry rather than by the querent’s birth. Its historical rules for radicality, significators, perfection and judgment belong to separate technical entries and should not be compressed into the branch definition.'),
    ('electional-astrology','Electional Astrology is concerned with choosing a suitable time to begin an intended action. Instead of asking what a given moment signifies, it searches among possible moments for one whose configuration better supports the proposed undertaking.','Electional astrology is distinct from horary because the astrologer is selecting a future beginning rather than judging a question from the moment it is asked. The specific criteria for choosing times vary by undertaking and source.'),
    ('mundane-astrology','Mundane Astrology concerns collective and public affairs rather than an individual nativity. Historical mundane literature includes rulers and states, wars, political change, weather, ingresses, eclipses and larger cycles.','Mundane is a broad branch rather than one technique. Individual techniques such as ingress charts, eclipse doctrine or astrometeorology should remain separate entries even when they are used within mundane practice.'),
    ('predictive-astrology','Predictive Astrology is a broad modern taxonomic label for timing doctrines that activate or develop a chart through time, including directions, profections, returns and period systems.','The category groups techniques by function rather than historical origin. Firdaria, primary directions, profections and revolutions remain distinct techniques with different mechanics and should not be blended into one predictive workflow.'),
    ('medical-astrology','Medical Astrology is the historical branch in which astrological doctrine was applied to bodily constitution, illness, treatment timing and related premodern medical questions.','This encyclopedia documents the terminology and historical role of medical astrology. It does not use astrological configurations to diagnose illness, prescribe treatment or replace modern medical assessment.'),
    ('astrometeorology','Astrometeorology is the branch of mundane astrology concerned specifically with weather and atmospheric conditions through astrological configurations, seasonal charts and related historical doctrines.','Astrometeorology is narrower than mundane astrology: all astrometeorology is mundane in scope, but mundane astrology also covers political, social and historical matters unrelated to weather.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,b.intro,'reviewed',CASE WHEN b.slug='medical-astrology' THEN 'Historical branch only; no diagnostic or treatment guidance.' ELSE 'Branch taxonomy article.' END
FROM b JOIN terms t ON t.slug=b.slug;

WITH b(slug,scope_text) AS (
  VALUES
    ('natal-astrology','The defining object is the nativity itself. Character, family, livelihood, relationships, eminence and timing can all appear within natal literature, but they remain topics and techniques inside the larger branch rather than separate definitions of it.'),
    ('horary-astrology','Horary is defined by the question/event of inquiry rather than by the querent’s birth. Its historical rules for radicality, significators, perfection and judgment belong to separate technical entries and should not be compressed into the branch definition.'),
    ('electional-astrology','Electional astrology is distinct from horary because the astrologer is selecting a future beginning rather than judging a question from the moment it is asked. The specific criteria for choosing times vary by undertaking and source.'),
    ('mundane-astrology','Mundane is a broad branch rather than one technique. Individual techniques such as ingress charts, eclipse doctrine or astrometeorology should remain separate entries even when they are used within mundane practice.'),
    ('predictive-astrology','The category groups techniques by function rather than historical origin. Firdaria, primary directions, profections and revolutions remain distinct techniques with different mechanics and should not be blended into one predictive workflow.'),
    ('medical-astrology','This encyclopedia documents the terminology and historical role of medical astrology. It does not use astrological configurations to diagnose illness, prescribe treatment or replace modern medical assessment.'),
    ('astrometeorology','Astrometeorology is narrower than mundane astrology: all astrometeorology is mundane in scope, but mundane astrology also covers political, social and historical matters unrelated to weather.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'scope','Scope and boundary',b.scope_text,10,'reviewed'
FROM b JOIN terms t ON t.slug=b.slug;

-- Give the broad predictive category a compact map to the named techniques already indexed.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'predictive-families','Major timing families in this lexicon',
  'A functional map only; the techniques are historically and mechanically distinct.',
  '["Family","Examples","Basic principle"]',
  '[["Period systems","Firdaria · Ptolemaic Ages","Time divided into planetary or life-period rulerships"],["Profections","Annual · Monthly Profection","Chart factors advanced by a regular zodiacal step"],["Directions","Primary Directions · Solar Directions","Significators/promissors or directed positions moved by a defined measure"],["Revolutions / Returns","Solar Return · Lunar Return","Chart erected for recurrence to a reference position"]]',
  20,'reviewed','Not a sequence or workflow.'
FROM terms WHERE slug='predictive-astrology';

-- A branch comparison is most useful on the generic taxonomy pages and can also stand
-- alone on Natal Astrology for readers entering the site there.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'branch-comparison','Major branches at a glance',
  'The distinction is primarily the kind of chart, question or collective subject being considered.',
  '["Branch","Primary object"]',
  '[["Natal","Birth / nativity"],["Horary","Specific question"],["Electional","Chosen beginning"],["Mundane","Collective/public affairs"],["Predictive","Timing across charts and techniques"],["Medical","Historical bodily/medical questions"],["Astrometeorology","Weather and atmospheric conditions"]]',
  20,'reviewed','Taxonomy table, not a methodological hierarchy.'
FROM terms WHERE slug='natal-astrology';

-- -----------------------------------------------------------------------------
-- CHART-TYPE VOCABULARY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Nativity is a horoscope erected for birth. Traditional authors can use the word for the birth itself, the chart representing that birth, or the astrological study of the native, so context determines the exact grammatical sense.',
  'reviewed','Chart-type vocabulary article.'
FROM terms WHERE slug='nativity';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'chart-vs-branch','Nativity versus natal astrology',
  'The nativity is the chart or birth represented; natal astrology is the broader branch concerned with interpreting nativities. A technique such as profection or solar revolution may be applied to a nativity without becoming part of the definition of the word nativity.',10,'reviewed'
FROM terms WHERE slug='nativity';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An Election is a chosen astrological beginning or the chart for that selected moment. Electional astrology is the broader practice of comparing candidate times and choosing one for a proposed action.',
  'reviewed','Chart-type vocabulary article.'
FROM terms WHERE slug='election';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'term-scope','Moment, chart and act of choosing',
  'Historical usage can shift among the selected time, the horoscope erected for it and the act of making the choice. The core idea is intentional selection of a beginning rather than retrospective judgment of a birth or spontaneous question.',10,'reviewed'
FROM terms WHERE slug='election';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Revolution Chart is erected for the return of a celestial body to a reference position, most commonly the Sun to its natal longitude in a solar revolution or the Moon to its natal longitude in a lunar revolution. “Revolution” is therefore an umbrella chart-type term.',
  'reviewed','Umbrella chart-type article; individual returns remain separate.'
FROM terms WHERE slug='revolution-chart';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'return-family','A family of return charts',
  'Solar and lunar revolutions share the general principle of recurrence but differ greatly in period and practical use. The generic revolution-chart entry should not substitute for the separate Solar Return and Lunar Return articles.',10,'reviewed'
FROM terms WHERE slug='revolution-chart';

-- -----------------------------------------------------------------------------
-- KATARCHIC ASTROLOGY
-- -----------------------------------------------------------------------------
-- Preserve the modern-scholarship qualification established in 0097; add only a concise
-- reader-facing distinction section and do not overwrite the reviewed article there.
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope-variation','Variable scope in modern scholarship',
  'Katarchic astrology is best treated here as a modern scholarly umbrella whose exact scope varies with author and historical context. It can include elections, interrogations or horary questions, event interpretation and decumbitures. It should not be presented as though every premodern astrologer used one identical technical category under this English label.',30,'reviewed','Preserves the modern-scholarship framing established in seed 0097.'
FROM terms WHERE slug='katarchic-astrology';

-- -----------------------------------------------------------------------------
-- MELOTHESIA
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-scope','Historical correspondence system',
  'Melothesia assigns bodily regions to astrological factors in premodern medicine and astrology. Zodiacal melothesia is only one form: planetary and other correspondence systems also occur. The presence of such a correspondence in a historical text does not establish a modern diagnosis or medical mechanism.',10,'reviewed','Historical/descriptive safety boundary.'
FROM terms WHERE slug='melothesia';
