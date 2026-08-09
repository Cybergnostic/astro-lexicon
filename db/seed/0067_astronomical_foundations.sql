-- Astronomical foundations pass.
-- Adds the basic geometrical and kinematic vocabulary required by later astrological
-- techniques, sourced to al-Biruni's Tafhim. No private course wording is stored.

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('celestial-sphere','Celestial Sphere','The traditional spherical model of the heavens surrounding the observer and carrying celestial bodies in ordered circular motions.','astronomical framework','reviewed','Historical geometrical model; not a literal modern physical shell.','astronomical',5),
  ('geocentric-model','Geocentric Model','An Earth-centered astronomical framework in which celestial positions and motions are described relative to the terrestrial centre and observer.','astronomical framework','reviewed','Historical and observational coordinate framework; not a modern claim that the physical solar system is geocentric.','astronomical',5),
  ('first-movement','First Movement','The uniform apparent westward daily motion that carries the celestial sphere and its bodies from rising through culmination toward setting.','celestial motion','reviewed','Historical term commonly corresponding to primary or diurnal motion.','astronomical',5),
  ('second-movement','Second Movement','The slower eastward motion proper to planets and stars against the daily westward first movement, varying in rate from body to body.','celestial motion','reviewed','Historical term commonly corresponding to secondary motion; do not confuse with modern stellar proper motion.','astronomical',5),
  ('horizon','Horizon','The circle separating the visible and invisible portions of the celestial sphere for an observer; traditional astronomy distinguishes sensible and true horizons.','celestial circle','reviewed','Foundation astronomical circle used in rising, setting, house and sect doctrine.','astronomical',5),
  ('meridian','Meridian','The great circle passing through the zenith that divides the apparent daily course into eastern and western halves and marks culmination.','celestial circle','reviewed','Foundation astronomical circle; distinct from ecliptic and horizon.','astronomical',5),
  ('equinoctial','Equinoctial / Celestial Equator','The great circle midway between the poles of the first movement, corresponding to the celestial equator.','celestial circle','reviewed','Historical term equinoctial; Celestial Equator is the modern descriptive equivalent.','astronomical',5),
  ('ecliptic','Ecliptic','The great circle of the zodiacal signs followed by the Sun in its annual eastward motion, inclined to the equinoctial.','celestial circle','reviewed','Foundation circle for zodiacal longitude; distinguish it from named constellations.','astronomical',5),
  ('epicycle','Epicycle','A small orbit in the traditional planetary model on whose circumference a planet moves while the epicycle itself is carried around a larger orbit.','planetary model','reviewed','Historical geometrical device used to model direct, stationary and retrograde appearances.','astronomical',5),
  ('deferent','Deferent','The larger orbit along which the centre of a planet''s epicycle travels in the traditional geocentric planetary model.','planetary model','reviewed','Historical geometrical model; its centre need not coincide with the centre of the world.','astronomical',5),
  ('equant','Equant','The point in the traditional planetary model relative to which the centre of an epicycle is treated as moving with uniform angular motion.','planetary model','reviewed','Historical Ptolemaic geometrical device for modelling non-uniform motion around the deferent.','astronomical',5),
  ('apogee','Apogee','The point of an eccentric orbit or epicycle at greatest distance from the Earth or terrestrial centre in the traditional geocentric model.','planetary model','reviewed','Source authors may distinguish apogee of eccentric or deferent from apogee of epicycle.','astronomical',5),
  ('perigee','Perigee','The point of an eccentric orbit or epicycle at least distance from the Earth or terrestrial centre in the traditional geocentric model.','planetary model','reviewed','Source authors may distinguish perigee of eccentric or deferent from perigee of epicycle.','astronomical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Primary Motion','English','later-equivalent','Common later term for the daily first movement.' FROM terms WHERE slug='first-movement';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Diurnal Motion','English','later-equivalent','Descriptive equivalent for the daily first movement.' FROM terms WHERE slug='first-movement';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Secondary Motion','English','later-equivalent','Common later term for the eastward second movement.' FROM terms WHERE slug='second-movement';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Celestial Equator','English','modern-equivalent','Modern descriptive name for the equinoctial.' FROM terms WHERE slug='equinoctial';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Earth-centered Model','English','descriptive-equivalent','Plain-language equivalent for geocentric model.' FROM terms WHERE slug='geocentric-model';

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'120-129','§§120-129: celestial sphere, nested planetary spheres, terrestrial centre, first and second movements, horizon and meridian',NULL,'Primary anchor for celestial sphere, geocentric framework, first/second movement, horizon and meridian.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'138-146','§§138-146: equinoctial, ecliptic, their inclination and intersections, and division of the ecliptic into zodiacal signs',NULL,'Primary anchor for equinoctial and ecliptic.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'151','§151: epicycle and the combination of epicyclic motion with the motion of the epicycle itself to model direct, stationary and retrograde appearances',NULL,'Primary anchor for epicycle.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'170-181','§§170-181: parecliptic, eccentric solar orbit, apogee and perigee, inclined orbits, epicycle, deferent, equant and apogee/perigee of the epicycle',NULL,'Primary anchor for deferent, equant, apogee and perigee; also corroborates epicycle.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('celestial-sphere','Al-Biruni defines the celestial sphere as a revolving spherical body containing celestial objects whose motions may differ from that of the sphere itself. He describes nested planetary spheres and places the terrestrial globe at the centre of the lunar sphere.','§§120-124, form of the heavens and planetary spheres'),
    ('geocentric-model','Al-Biruni presents celestial geometry from an Earth-centred frame: the observer and terrestrial globe occupy the centre of the surrounding celestial arrangement, while planetary and stellar motions are described relative to that centre.','§§120-124, terrestrial centre within the celestial arrangement'),
    ('first-movement','Al-Biruni calls the familiar daily westward course of celestial bodies the first movement: they rise, culminate, descend and set in the west before returning to the place of rising.','§126, first or westerly movement'),
    ('second-movement','Al-Biruni calls the easterly motion of celestial bodies the second movement. It differs in amount among planets, is slower than the uniform first movement, and proceeds opposite to that dominating daily motion.','§127, second or easterly movement'),
    ('horizon','Al-Biruni defines the horizon as the circular boundary of the visible celestial dome. He distinguishes the sensible horizon from the true astronomical horizon whose plane passes through the centre of the Earth and bisects the celestial sphere.','§128, sensible and true horizon'),
    ('meridian','Al-Biruni defines the meridian as the circle through the zenith that divides the apparent course of the day into two halves; rising bodies approach it, culminate there, and then descend toward the west.','§129, meridian'),
    ('equinoctial','Al-Biruni describes the equinoctial as the great circle midway between the two poles of the first movement and therefore the girdle of that daily celestial rotation.','§138, equinoctial'),
    ('ecliptic','Al-Biruni defines the ecliptic as the zodiacal girdle or circle of the signs followed by the Sun in its eastward movement. It is inclined to the equinoctial and intersects it at two opposite points.','§139, ecliptic'),
    ('epicycle','Al-Biruni describes the epicycle as a small orbit external to the Earth on whose circumference a planet moves while the epicycle itself is carried eastward. The combination of these motions accounts for changes between direct motion, station and retrogradation.','§151 and §178, epicycle and apparent planetary motion'),
    ('deferent','Al-Biruni defines the deferent as the orbit along whose circumference the centre of the epicycle continually travels in zodiacal order; its centre is distinct from the centre of the world.','§179, deferent'),
    ('equant','Al-Biruni defines the equant as the point of equal progress from which the epicycle centre is treated as traversing equal angular intervals in equal times despite its non-uniform relation to the deferent centre.','§180, equant'),
    ('apogee','Al-Biruni identifies apogee as the farthest point of an eccentric orbit from the Earth and also uses a corresponding summit for the epicycle. The source distinguishes several geometrical apogees while sharing the principle of greatest distance.','§171 and §181, apogee of eccentric orbit and epicycle'),
    ('perigee','Al-Biruni identifies perigee as the nearest point of an eccentric orbit to the Earth and likewise recognizes the point opposite the apogee on an epicycle. The common principle is least distance from the terrestrial centre.','§171 and §181, perigee of eccentric orbit and epicycle')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='al-biruni-tafhim';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('celestial-sphere','geocentric-model','first-movement','second-movement','horizon','meridian')
  AND sp.section='120-129';
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp JOIN editions e ON e.id=sp.edition_id JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('equinoctial','ecliptic') AND sp.section='138-146';
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp JOIN editions e ON e.id=sp.edition_id JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug='epicycle' AND sp.section IN ('151','170-181');
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i JOIN terms t ON t.id=i.term_id JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp JOIN editions e ON e.id=sp.edition_id JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('deferent','equant','apogee','perigee') AND sp.section='170-181';

WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('geocentric-model','celestial-sphere','uses-framework','The celestial sphere is expressed in an Earth-centred observational geometry.'),
    ('first-movement','celestial-sphere','motion-of','The first movement is the dominant daily motion of the celestial sphere.'),
    ('second-movement','first-movement','opposed-to','The second easterly movement proceeds opposite to the first daily westerly movement.'),
    ('horizon','celestial-sphere','divides','The true horizon divides the celestial sphere into visible and invisible hemispheres.'),
    ('meridian','celestial-sphere','great-circle-of','The meridian is a great circle of the observer-centred celestial sphere.'),
    ('ecliptic','equinoctial','inclined-to','The ecliptic is inclined to and intersects the equinoctial.'),
    ('epicycle','deferent','carried-on','The centre of the epicycle travels along the deferent.'),
    ('equant','deferent','models-motion-on','The equant models uniform angular progress of the epicycle centre relative to the deferent.'),
    ('apogee','perigee','opposite-point','Apogee and perigee are opposite extrema of distance.'),
    ('perigee','apogee','opposite-point','Perigee and apogee are opposite extrema of distance.'),
    ('apogee','geocentric-model','defined-within','Apogee is defined by greatest distance from the terrestrial centre.'),
    ('perigee','geocentric-model','defined-within','Perigee is defined by least distance from the terrestrial centre.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel JOIN terms s ON s.slug=rel.subject_slug JOIN terms o ON o.slug=rel.object_slug;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'conceptually-corresponds-to','Bonatti''s Auge belongs to the same apogee framework; preserve the source term as its own lexical entry.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='apogee' AND b.slug='auge';
