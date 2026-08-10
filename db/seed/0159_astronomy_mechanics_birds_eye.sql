-- Bird's-eye encyclopedia review: astronomical mechanics, apparent motion and visibility.
--
-- The canonical vocabulary already exists. This pass does not invent a second mechanics
-- ontology; it reorganizes the existing coordinate, motion and solar-phase entries so a
-- reader can understand them as one system.
--
-- Modern physical/observational checks used editorially:
-- - NASA / GSFC celestial-sphere and Earth-rotation teaching material
-- - NASA Science / JPL planetary-motion and retrogradation explanations
-- - USNO Astronomical Applications glossary for ecliptic longitude/latitude
-- Historical doctrine and numerical astrological thresholds remain source-attributed in
-- the existing historical interpretations. Skyscript was used only as an editorial
-- completeness check for the multiple historical uses of oriental/occidental.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- CLEARER READER-FACING DEFINITIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The celestial sphere is an observer-centred geometrical model that maps directions in the sky onto an imaginary sphere, allowing horizons, great circles and celestial coordinates to be described consistently.',
  editorial_notes='Bird’s-eye astronomy review. Treat as a geometrical reference model: useful in both historical and modern positional astronomy, not a claim that the stars are physically attached to a sphere.'
WHERE slug='celestial-sphere';

UPDATE terms SET
  short_definition='The ecliptic is the great circle of the Sun’s apparent annual path on the celestial sphere, corresponding to the plane of Earth’s orbit and providing the reference circle for zodiacal longitude.',
  editorial_notes='Bird’s-eye astronomy review. Modern physical explanation checked against NASA; historical source accounts remain separately attributed.'
WHERE slug='ecliptic';

UPDATE terms SET
  short_definition='The equinoctial, or celestial equator, is Earth’s equatorial plane projected onto the celestial sphere; it is the reference great circle from which declination is measured.',
  editorial_notes='Bird’s-eye astronomy review. Keep the historical name equinoctial visible while making the modern geometrical equivalent immediately clear.'
WHERE slug='equinoctial';

UPDATE terms SET
  short_definition='Celestial longitude is angular position measured eastward along the ecliptic from the chosen zero point; zodiacal sign and degree are the traditional astrological way of expressing this ecliptic-longitude coordinate.',
  editorial_notes='Bird’s-eye astronomy review. Coordinate wording checked against the USNO ecliptic-longitude definition.'
WHERE slug='celestial-longitude';

UPDATE terms SET
  short_definition='Celestial latitude is angular distance north or south of the ecliptic, measured on a great circle through the ecliptic poles; it is independent of a body’s longitude along the zodiac.',
  editorial_notes='Bird’s-eye astronomy review. Coordinate wording checked against the USNO ecliptic-latitude definition.'
WHERE slug='celestial-latitude';

UPDATE terms SET
  short_definition='Declination is angular distance north or south of the celestial equator, measured on the equatorial coordinate grid rather than from the ecliptic.',
  editorial_notes='Bird’s-eye astronomy review. Explicitly distinguishes declination from ecliptic latitude.'
WHERE slug='declination';

UPDATE terms SET
  short_definition='First Motion is the apparent daily westward sweep of the heavens from rising through culmination to setting; in modern physical terms this apparent motion is produced primarily by Earth’s eastward rotation.',
  editorial_notes='Historical term with modern observational explanation. Keep distinct from primary directions.'
WHERE slug='first-movement';

UPDATE terms SET
  short_definition='Second Motion is the slower change of a planet or luminary against the stellar background and through the zodiac, considered apart from the daily westward sweep of First Motion.',
  editorial_notes='Historical observational term. The modern physical causes differ by body and geometry; do not reduce it to one literal orbital motion statement.'
WHERE slug='second-movement';

UPDATE terms SET
  short_definition='Direct motion is apparent eastward progress in zodiacal longitude relative to the background stars, the ordinary direction opposite retrogradation.',
  editorial_notes='Bird’s-eye motion review. “Direct” is a geocentric apparent-longitude state, not a claim about reversal of the planet’s physical orbit.'
WHERE slug='direct-motion';

UPDATE terms SET
  short_definition='A station is the apparent turning phase at which a planet’s change in zodiacal longitude slows to near zero before reversing between direct and retrograde motion.',
  editorial_notes='Bird’s-eye motion review. The exact instant depends on the coordinate/ephemeris convention; the encyclopedia treats station as the observable transition concept.'
WHERE slug='station';

UPDATE terms SET
  short_definition='Retrogradation is apparent westward motion in zodiacal longitude against the planet’s usual direct course; the planet does not physically reverse its orbit, and the effect arises from changing Earth–planet viewing geometry.',
  editorial_notes='Bird’s-eye motion review. Modern apparent-motion explanation checked against NASA/JPL; traditional interpretive claims remain source-specific.'
WHERE slug='retrogradation';

-- Oriental/occidental are especially vulnerable to false simplification. In planetary
-- solar phase, use rising-before / setting-after language. Preserve the separate chart-half
-- usage in the article instead of calling one side simply “east of the Sun”.
UPDATE terms SET
  short_definition='Oriental of the Sun is the traditional solar-phase condition in which a planet rises before the Sun and is therefore visible, when sufficiently separated, in the morning sky; some texts separately use “oriental in the figure” for the eastern half of a chart.',
  editorial_notes='Bird’s-eye phase review. Do not collapse solar-phase oriental with “oriental in the figure”. Planet-specific consequences remain source-bound.'
WHERE slug='oriental';

UPDATE terms SET
  short_definition='Occidental of the Sun is the traditional solar-phase condition in which a planet sets after the Sun and is therefore visible, when sufficiently separated, in the evening sky; some texts separately use “occidental in the figure” for the western half of a chart.',
  editorial_notes='Bird’s-eye phase review. Do not collapse solar-phase occidental with “occidental in the figure”. Planet-specific consequences remain source-bound.'
WHERE slug='occidental';

-- -----------------------------------------------------------------------------
-- CELESTIAL-SPHERE / COORDINATE TEACHING SYSTEM
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The celestial sphere is a positional model: imagine every direction from the observer projected onto a surrounding sphere. This makes it possible to describe the horizon, meridian, celestial equator, ecliptic and coordinate circles without implying that the celestial bodies are physically fixed to a shell.',
  'reviewed','Bird’s-eye astronomy foundation. Historical model and modern positional use are explicitly separated.'
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'observer-frame','An observer-centred map of directions',
  'The model puts the observer at the centre because its purpose is to map where things appear in the sky. A direction above the local horizon, a meridian crossing, or an angular distance between two celestial positions can all be represented on the same sphere. Modern astronomy still uses celestial-sphere language as a convenient positional framework even though the stars lie at very different physical distances.',10,'reviewed',
  'Modern explanatory check: NASA GSFC celestial-sphere teaching material.'
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-grids','Equatorial and ecliptic reference grids',
  'Two great-circle systems matter especially for this encyclopedia. The celestial equator projects Earth’s equator into the sky and supplies the reference for declination. The ecliptic follows the Sun’s apparent annual path and supplies the reference for ecliptic latitude and longitude. Astrological zodiacal position belongs to the ecliptic system, not the equatorial one.',20,'reviewed',NULL
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'coordinate-systems','Two coordinate frameworks at a glance',
  'The same celestial body can be described in either framework; the coordinates answer different geometrical questions.',
  '["Reference plane / circle","Along the reference","North / south of the reference","Encyclopedia terms"]',
  '[["Celestial equator","Right ascension in modern equatorial coordinates","Declination","Equinoctial · Declination"],["Ecliptic","Celestial / ecliptic longitude","Celestial / ecliptic latitude","Ecliptic · Celestial Longitude · Celestial Latitude"]]',
  30,'reviewed','Teaching comparison only. The project does not currently need a standalone right-ascension entry for traditional astrological doctrine.'
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The ecliptic is the central reference circle of zodiacal astronomy. It is the Sun’s apparent annual path on the celestial sphere and corresponds geometrically to the plane of Earth’s orbit. Zodiacal longitude is measured along it, while celestial or ecliptic latitude measures distance north or south of it.',
  'reviewed','Bird’s-eye coordinate article; modern geometry checked against NASA and USNO.'
FROM terms WHERE slug='ecliptic';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'equator-intersection','The ecliptic and celestial equator are tilted to one another',
  'The ecliptic and celestial equator are different great circles. They intersect at the two equinoctial points. This distinction explains why a body can have one ecliptic latitude but a different declination: each coordinate is measured from a different reference plane.',10,'reviewed',NULL
FROM terms WHERE slug='ecliptic';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'zodiac-reference','Why the ecliptic matters to the zodiac',
  'Traditional zodiacal sign and degree specify ecliptic longitude. A planet at 15° Taurus, for example, is being located by longitude along the zodiac; its celestial latitude is a separate north–south displacement from the ecliptic. This is why a chart’s familiar zodiacal degree does not by itself describe the planet’s full two-dimensional position on the celestial sphere.',20,'reviewed',NULL
FROM terms WHERE slug='ecliptic';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The equinoctial is the historical celestial-equator circle. It is the projection of Earth’s equator onto the sky and forms a different reference grid from the ecliptic. Declination is measured north or south of this circle.',
  'reviewed','Bird’s-eye coordinate article.'
FROM terms WHERE slug='equinoctial';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'equinoxes','Where the two great circles cross',
  'The ecliptic crosses the celestial equator at two points: the equinoxes. In the tropical zodiac these crossings anchor 0° Aries and 0° Libra. The geometrical intersection therefore connects the astronomical coordinate framework to the tropical zodiac without making the ecliptic and equator the same circle.',10,'reviewed',NULL
FROM terms WHERE slug='equinoctial';

WITH data(slug,intro,heading,body) AS (VALUES
  ('celestial-longitude',
   'Celestial or ecliptic longitude answers the along-the-zodiac question: how far around the ecliptic is the body from the zero point? Traditional astrology normally expresses this coordinate as sign plus degree.',
   'Longitude is not latitude',
   'Two bodies can share the same zodiacal longitude while having different ecliptic latitudes. Conjunction by longitude therefore does not automatically mean the bodies occupy the exact same point on the celestial sphere.'),
  ('celestial-latitude',
   'Celestial or ecliptic latitude answers the north–south question relative to the ecliptic. It is a second coordinate, separate from the zodiacal longitude used to name a planet’s sign and degree.',
   'Latitude is measured from the ecliptic',
   'A planet north or south of the ecliptic can still occupy the same zodiacal sign and degree as a body lying on the ecliptic. Latitude becomes especially important wherever exact spatial geometry, parallels to the ecliptic, occultation or similar phenomena are being discussed.'),
  ('declination',
   'Declination is the north–south coordinate measured from the celestial equator. It belongs to the equatorial reference system and should not be confused with ecliptic latitude, which is measured from the ecliptic.',
   'Declination and ecliptic latitude are different',
   'Because the celestial equator and ecliptic are inclined to each other, a body’s declination cannot be inferred simply from its ecliptic latitude. A planet on the ecliptic can still have substantial north or south declination depending on its longitude.')
)
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,d.intro,'reviewed','Bird’s-eye coordinate distinction.'
FROM data d JOIN terms t ON t.slug=d.slug;

WITH data(slug,heading,body) AS (VALUES
  ('celestial-longitude','Longitude is not latitude','Two bodies can share the same zodiacal longitude while having different ecliptic latitudes. Conjunction by longitude therefore does not automatically mean the bodies occupy the exact same point on the celestial sphere.'),
  ('celestial-latitude','Latitude is measured from the ecliptic','A planet north or south of the ecliptic can still occupy the same zodiacal sign and degree as a body lying on the ecliptic. Latitude becomes especially important wherever exact spatial geometry, occultation or similar phenomena are being discussed.'),
  ('declination','Declination and ecliptic latitude are different','Because the celestial equator and ecliptic are inclined to each other, a body’s declination cannot be inferred simply from its ecliptic latitude. A planet on the ecliptic can still have substantial north or south declination depending on its longitude.')
)
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT t.id,'coordinate-distinction',d.heading,d.body,10,'reviewed',NULL
FROM data d JOIN terms t ON t.slug=d.slug;

-- -----------------------------------------------------------------------------
-- FIRST / SECOND MOTION AND APPARENT PLANETARY MOTION
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'First Motion is the rapid apparent daily rotation of the sky from east to west. In the historical geocentric framework it is described as a motion of the heavens; in modern physical explanation the apparent sweep results primarily from Earth rotating eastward on its axis.',
  'reviewed','Historical observational category with explicit modern physical explanation.'
FROM terms WHERE slug='first-movement';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'daily-sweep','Rising, culmination and setting belong to the daily sweep',
  'First Motion carries every ordinary celestial object through the local sequence of rising, crossing the meridian, and setting. This is much faster than the planets’ slower change of position against the stellar background. Keeping these motions separate prevents confusion between daily house/horizon movement and zodiacal planetary motion.',10,'reviewed',NULL
FROM terms WHERE slug='first-movement';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Second Motion is the slower change of celestial bodies against the stellar background and through zodiacal longitude once the daily sweep of First Motion is conceptually removed. The planets differ greatly in this motion, and the five non-luminary planets can pass through direct, stationary and retrograde phases.',
  'reviewed','Bird’s-eye motion article. Historical category retained; modern physical causes are not flattened across Sun, Moon and planets.'
FROM terms WHERE slug='second-movement';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'first-second-motion','First and Second Motion compared',
  'Traditional observational distinction. The modern physical explanation of First Motion differs from the historical geocentric model.',
  '["Motion","Observed behaviour","Modern physical frame","Related concepts"]',
  '[["First Motion","Fast daily westward sweep of the sky","Earth’s eastward rotation produces the apparent sweep","Horizon · Meridian · rising · setting"],["Second Motion","Slower change against the stars / through zodiacal longitude","Relative orbital geometry and each body’s own motion","Direct · Station · Retrogradation · synodic phase"]]',
  20,'reviewed','Teaching table; not a replacement for the historical source accounts.'
FROM terms WHERE slug='second-movement';

WITH data(slug,intro,heading,body) AS (VALUES
  ('direct-motion',
   'Direct motion is the ordinary apparent eastward progress of a planet in zodiacal longitude. It is one phase of the planet’s geocentric apparent-motion cycle and should be distinguished from the much faster daily westward sweep of First Motion.',
   'Direct does not mean physically moving forward in space',
   'A planet remains in its physical orbit throughout the cycle. “Direct” labels the direction of its apparent change in zodiacal longitude as viewed from Earth. This is why direct and retrograde are best understood together with station and synodic geometry.'),
  ('station',
   'A station is the turning phase between direct and retrograde apparent motion. In an ephemeris the planet’s longitudinal rate approaches zero, changes sign, and then increases again in the opposite direction.',
   'A station is a transition, not a third permanent direction',
   'The first station leads from direct to retrograde motion; the second leads from retrograde back to direct motion. The labels describe the geometry of a changing apparent cycle. Historical authors can assign different interpretive weight to the two stations.'),
  ('retrogradation',
   'Retrogradation is the apparent reversal in which a planet moves westward through zodiacal longitude for part of its synodic cycle. The planet does not reverse its physical orbit; the reversal is produced by changing lines of sight as Earth and the planet move around the Sun.',
   'Why the planet appears to go backward',
   'For the superior planets Mars, Jupiter and Saturn, retrograde motion occurs around opposition as Earth overtakes them. Mercury and Venus also undergo retrograde loops, but because they orbit inside Earth’s orbit their geometry is tied to inferior conjunction. The shared observable result is reversal in apparent zodiacal motion, not one identical physical configuration for every planet.')
)
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,d.intro,'reviewed','Bird’s-eye apparent-motion explanation checked against NASA/JPL; historical interpretation remains source-specific.'
FROM data d JOIN terms t ON t.slug=d.slug;

WITH data(slug,heading,body) AS (VALUES
  ('direct-motion','Direct does not mean physically moving forward in space','A planet remains in its physical orbit throughout the cycle. “Direct” labels the direction of its apparent change in zodiacal longitude as viewed from Earth. This is why direct and retrograde are best understood together with station and synodic geometry.'),
  ('station','A station is a transition, not a third permanent direction','The first station leads from direct to retrograde motion; the second leads from retrograde back to direct motion. The labels describe the geometry of a changing apparent cycle. Historical authors can assign different interpretive weight to the two stations.'),
  ('retrogradation','Why the planet appears to go backward','For the superior planets Mars, Jupiter and Saturn, retrograde motion occurs around opposition as Earth overtakes them. Mercury and Venus also undergo retrograde loops, but because they orbit inside Earth’s orbit their geometry is tied to inferior conjunction. The shared observable result is reversal in apparent zodiacal motion, not one identical physical configuration for every planet.')
)
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT t.id,'apparent-geometry',d.heading,d.body,10,'reviewed',NULL
FROM data d JOIN terms t ON t.slug=d.slug;

-- -----------------------------------------------------------------------------
-- SOLAR ORIENTATION, VISIBILITY AND PROXIMITY
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Oriental of the Sun is fundamentally an observational phase relation: the planet rises before the Sun and, when far enough from solar glare, belongs to the morning side of its visibility cycle. Historical authors can use the same word in other geometrical contexts, especially “oriental in the figure”, so the scope must be stated.',
  'reviewed','Bird’s-eye phase article. Solar phase and chart-half usage explicitly disambiguated.'
FROM terms WHERE slug='oriental';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-chart-half','Solar phase versus “oriental in the figure”',
  'When a source says a planet is oriental of the Sun, the relation is solar and phase-based. A separate historical usage describes a body or region as oriental in the figure, meaning the eastern/rising half or quarter of the chart. Those meanings are related by east/rising language but are not interchangeable technical conditions.',10,'reviewed',
  'Editorial completeness checked against Skyscript; historical attribution remains in project sources.'
FROM terms WHERE slug='oriental';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Occidental of the Sun is the complementary observational phase relation: the planet sets after the Sun and, when far enough from solar glare, belongs to the evening side of its visibility cycle. As with oriental, texts can separately use occidental for the western/setting half of the figure.',
  'reviewed','Bird’s-eye phase article. Solar phase and chart-half usage explicitly disambiguated.'
FROM terms WHERE slug='occidental';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-chart-half','Solar phase versus “occidental in the figure”',
  'Occidental of the Sun concerns the planet’s phase relative to the Sun. Occidental in the figure concerns chart geometry around the western/setting side. A source may use both senses, so an encyclopedia entry must name the reference instead of treating “occidental” as a free-standing personality or strength label.',10,'reviewed',
  'Editorial completeness checked against Skyscript; historical attribution remains in project sources.'
FROM terms WHERE slug='occidental';

-- Solar proximity and actual naked-eye visibility are related but not identical. The
-- traditional categories use author-specific angular rules, while real heliacal visibility
-- also varies with brightness, latitude, season, atmospheric extinction and geometry.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'visibility-distinction','Traditional solar condition is not a universal visibility threshold',
  'Combustion, under-the-beams and cazimi are textual astrological conditions defined by particular angular rules in particular traditions. Actual naked-eye visibility is an observational problem that also depends on the body’s brightness, its altitude at twilight, latitude, season and atmospheric conditions. A planet can therefore be classified by a traditional solar-distance rule without that rule functioning as a universal physical visibility boundary.',55,'reviewed',
  'Bird’s-eye distinction informed by modern observing references; retain source-specific thresholds already stored for Lilly and other authors.'
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'solar-phase-map','Solar-relative conditions belong to different layers',
  'Do not collapse angular proximity, morning/evening orientation and naked-eye visibility into one variable.',
  '["Layer","Examples","What it describes"]',
  '[["Solar proximity rule","Cazimi · Combustion · Under the Beams","Textual angular condition relative to the Sun"],["Solar orientation / phase","Oriental · Occidental","Whether the planet belongs to the morning/rising-before or evening/setting-after side of the solar cycle"],["Observed visibility","Heliacal emergence / disappearance in observational language","Whether sky and atmospheric conditions actually permit the body to be seen"]]',
  58,'reviewed','The third row is descriptive observational language; do not imply that a standalone heliacal term has already been canonically sourced in the lexicon.'
FROM terms WHERE slug='combustion';

-- -----------------------------------------------------------------------------
-- CONNECT THE FAMILY
-- -----------------------------------------------------------------------------

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('celestial-sphere','horizon','contains-reference-circle','The horizon is an observer-dependent circle on the celestial sphere.'),
  ('celestial-sphere','meridian','contains-reference-circle','The meridian is an observer-dependent great circle on the celestial sphere.'),
  ('celestial-sphere','equinoctial','contains-reference-circle','The celestial equator/equinoctial is a fundamental great circle on the celestial sphere.'),
  ('celestial-sphere','ecliptic','contains-reference-circle','The ecliptic is a fundamental great circle on the celestial sphere.'),
  ('ecliptic','celestial-longitude','reference-for','Ecliptic longitude is measured along the ecliptic.'),
  ('ecliptic','celestial-latitude','reference-for','Ecliptic latitude is measured north or south of the ecliptic.'),
  ('equinoctial','declination','reference-for','Declination is measured north or south of the celestial equator.'),
  ('ecliptic','zodiac','reference-for','The zodiac organizes equal longitude divisions along the ecliptic.'),
  ('first-movement','horizon','describes-motion-relative-to','Rising and setting occur through the daily apparent motion relative to the local horizon.'),
  ('first-movement','meridian','describes-motion-relative-to','Culmination occurs when daily apparent motion carries a body across the meridian.'),
  ('second-movement','direct-motion','includes-state','Direct motion is one state of apparent zodiacal Second Motion.'),
  ('second-movement','station','includes-state','Station is a turning state within apparent zodiacal Second Motion.'),
  ('second-movement','retrogradation','includes-state','Retrogradation is one state of apparent zodiacal Second Motion.'),
  ('direct-motion','station','transitions-through','Direct and retrograde motion meet through stationary turning phases.'),
  ('station','retrogradation','transitions-between','A station marks a transition into or out of retrogradation.'),
  ('oriental','occidental','paired-with','Oriental and occidental are complementary solar-phase orientation terms.'),
  ('oriental','sun','defined-relative-to','The solar-phase use of oriental is defined relative to the Sun.'),
  ('occidental','sun','defined-relative-to','The solar-phase use of occidental is defined relative to the Sun.'),
  ('combustion','sun','defined-relative-to','Combustion is a source-sensitive angular condition relative to the Sun.'),
  ('under-the-beams','sun','defined-relative-to','Under the Beams is a source-sensitive angular condition relative to the Sun.'),
  ('cazimi','sun','defined-relative-to','Cazimi is a source-sensitive close solar condition.'),
  ('retrogradation','station','bounded-by','A retrograde phase is bounded by stationary turning phases.'),
  ('retrogradation','second-movement','subtype-of','Retrogradation is a state of apparent planetary motion through zodiacal longitude.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
