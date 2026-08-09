-- Astronomy foundation pass guided by the private study-corpus gap audit but sourced
-- exclusively to historical works already represented in the canonical corpus.
-- No private course wording, attribution, transcript, slide, or quotation is stored here.
--
-- Scope: coordinate circles, the two fundamental motions, and the basic geocentric
-- orbit machinery that later astrological techniques already presuppose.

-- -----------------------------------------------------------------------------
-- TERMS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('celestial-sphere', 'Celestial Sphere', 'The spherical framework of the heavens surrounding the observer and Earth, within which celestial bodies are represented as moving.', 'astronomical framework', 'reviewed', 'Historical geometrical framework. The entry records the model used by the source rather than asserting a modern physical cosmology.', 'astronomical', 5),
  ('first-movement', 'First Motion', 'The uniform westward daily motion of the heavens that carries celestial bodies from rising through culmination toward setting.', 'celestial motion', 'reviewed', 'Historical technical term. Later English often calls this primary motion; keep it distinct from primary directions.', 'astronomical', 5),
  ('second-movement', 'Second Motion', 'The eastward proper motion of planets against the first motion, varying in amount from body to body and providing their motion through the zodiac.', 'celestial motion', 'reviewed', 'Historical technical term. Later English often calls this secondary motion; keep it distinct from secondary directions.', 'astronomical', 5),
  ('horizon', 'Horizon', 'The circle separating the visible and invisible portions of the heavens for an observer; the astronomical or true horizon is the parallel plane through the centre of the Earth.', 'celestial coordinate circle', 'reviewed', 'Al-Biruni distinguishes the sensible horizon from the true astronomical horizon. Preserve both in source interpretations.', 'astronomical', 5),
  ('meridian', 'Meridian', 'The great circle through the zenith that divides the daily path of a celestial body into rising and setting halves and is crossed at culmination.', 'celestial coordinate circle', 'reviewed', 'Astronomical foundation used by house and culmination doctrine.', 'astronomical', 5),
  ('equinoctial', 'Equinoctial / Celestial Equator', 'The great circle midway between the poles of the first motion, corresponding to the celestial equator and serving as the reference circle for declination.', 'celestial coordinate circle', 'reviewed', 'Historical source term normalized with the modern descriptive equivalent Celestial Equator.', 'astronomical', 5),
  ('ecliptic', 'Ecliptic', 'The great circle followed by the Sun in its eastward motion, inclined to the equinoctial and serving as the central reference circle of the zodiac.', 'celestial coordinate circle', 'reviewed', 'Keep the ecliptic distinct from both the celestial equator and the zodiacal signs constructed along it.', 'astronomical', 5),
  ('declination', 'Declination', 'The angular distance of a celestial body north or south of the equinoctial, measured on a great circle through the celestial poles.', 'celestial coordinate', 'reviewed', 'Coordinate definition only; source-specific uses belong in interpretations.', 'astronomical', 5),
  ('celestial-latitude', 'Celestial Latitude', 'The angular distance of a celestial body north or south of the ecliptic, measured on a great circle through the poles of the zodiacal sphere.', 'celestial coordinate', 'reviewed', 'Equivalent to ecliptic latitude in modern descriptive terminology; do not confuse with geographic latitude or declination.', 'astronomical', 5),
  ('celestial-longitude', 'Celestial Longitude', 'The position of a celestial body along the ecliptic, expressed by the ecliptic degree corresponding to the body after projection by its latitude circle.', 'celestial coordinate', 'reviewed', 'Equivalent to ecliptic longitude in modern descriptive terminology; in astrology this supplies the familiar zodiacal degree coordinate.', 'astronomical', 5),
  ('epicycle', 'Epicycle', 'A smaller orbit in the historical planetary model on whose circumference a planet moves while the epicycle itself is carried through the larger orbital system.', 'historical planetary model', 'reviewed', 'Historical astronomical model. Record its geometrical role without presenting it as modern physical astronomy.', 'astronomical', 5),
  ('deferent', 'Deferent', 'The larger orbit in the historical planetary model along which the centre of a planet’s epicycle is carried in the direction of the zodiacal signs.', 'historical planetary model', 'reviewed', 'Historical astronomical model; al-Biruni describes the deferent as having a centre distinct from the centre of the world.', 'astronomical', 5),
  ('equant', 'Equant', 'The point used in the historical planetary model as the centre of equal angular progress for the motion of an epicycle centre along its deferent.', 'historical planetary model', 'reviewed', 'Historical astronomical construct used to represent non-uniform motion relative to the deferent.', 'astronomical', 5),
  ('apogee', 'Apogee', 'The point of an eccentric or deferent-type orbit farthest from the Earth or centre of the world; related historical sources also use auj or auge terminology.', 'historical planetary model', 'reviewed', 'General historical astronomical entry. Keep source-specific distinctions such as apogee of deferent versus apogee of epicycle in interpretations.', 'astronomical', 5),
  ('perigee', 'Perigee', 'The point of an eccentric or deferent-type orbit nearest to the Earth or centre of the world, opposite the apogee.', 'historical planetary model', 'reviewed', 'General historical astronomical entry. Keep source-specific orbit distinctions in interpretations.', 'astronomical', 5);

-- Normalize any pre-existing same-slug draft records to the reviewed definitions above.
UPDATE terms SET
  short_definition='The spherical framework of the heavens surrounding the observer and Earth, within which celestial bodies are represented as moving.',
  category='astronomical framework', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical geometrical framework. The entry records the model used by the source rather than asserting a modern physical cosmology.'
WHERE slug='celestial-sphere';
UPDATE terms SET
  short_definition='The uniform westward daily motion of the heavens that carries celestial bodies from rising through culmination toward setting.',
  category='celestial motion', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical technical term. Later English often calls this primary motion; keep it distinct from primary directions.'
WHERE slug='first-movement';
UPDATE terms SET
  short_definition='The eastward proper motion of planets against the first motion, varying in amount from body to body and providing their motion through the zodiac.',
  category='celestial motion', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical technical term. Later English often calls this secondary motion; keep it distinct from secondary directions.'
WHERE slug='second-movement';
UPDATE terms SET
  short_definition='The circle separating the visible and invisible portions of the heavens for an observer; the astronomical or true horizon is the parallel plane through the centre of the Earth.',
  category='celestial coordinate circle', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Al-Biruni distinguishes the sensible horizon from the true astronomical horizon. Preserve both in source interpretations.'
WHERE slug='horizon';
UPDATE terms SET
  short_definition='The great circle through the zenith that divides the daily path of a celestial body into rising and setting halves and is crossed at culmination.',
  category='celestial coordinate circle', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Astronomical foundation used by house and culmination doctrine.'
WHERE slug='meridian';
UPDATE terms SET
  short_definition='The great circle midway between the poles of the first motion, corresponding to the celestial equator and serving as the reference circle for declination.',
  category='celestial coordinate circle', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical source term normalized with the modern descriptive equivalent Celestial Equator.'
WHERE slug='equinoctial';
UPDATE terms SET
  short_definition='The great circle followed by the Sun in its eastward motion, inclined to the equinoctial and serving as the central reference circle of the zodiac.',
  category='celestial coordinate circle', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Keep the ecliptic distinct from both the celestial equator and the zodiacal signs constructed along it.'
WHERE slug='ecliptic';
UPDATE terms SET
  short_definition='The angular distance of a celestial body north or south of the equinoctial, measured on a great circle through the celestial poles.',
  category='celestial coordinate', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Coordinate definition only; source-specific uses belong in interpretations.'
WHERE slug='declination';
UPDATE terms SET
  short_definition='The angular distance of a celestial body north or south of the ecliptic, measured on a great circle through the poles of the zodiacal sphere.',
  category='celestial coordinate', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Equivalent to ecliptic latitude in modern descriptive terminology; do not confuse with geographic latitude or declination.'
WHERE slug='celestial-latitude';
UPDATE terms SET
  short_definition='The position of a celestial body along the ecliptic, expressed by the ecliptic degree corresponding to the body after projection by its latitude circle.',
  category='celestial coordinate', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Equivalent to ecliptic longitude in modern descriptive terminology; in astrology this supplies the familiar zodiacal degree coordinate.'
WHERE slug='celestial-longitude';
UPDATE terms SET
  short_definition='A smaller orbit in the historical planetary model on whose circumference a planet moves while the epicycle itself is carried through the larger orbital system.',
  category='historical planetary model', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical astronomical model. Record its geometrical role without presenting it as modern physical astronomy.'
WHERE slug='epicycle';
UPDATE terms SET
  short_definition='The larger orbit in the historical planetary model along which the centre of a planet’s epicycle is carried in the direction of the zodiacal signs.',
  category='historical planetary model', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical astronomical model; al-Biruni describes the deferent as having a centre distinct from the centre of the world.'
WHERE slug='deferent';
UPDATE terms SET
  short_definition='The point used in the historical planetary model as the centre of equal angular progress for the motion of an epicycle centre along its deferent.',
  category='historical planetary model', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='Historical astronomical construct used to represent non-uniform motion relative to the deferent.'
WHERE slug='equant';
UPDATE terms SET
  short_definition='The point of an eccentric or deferent-type orbit farthest from the Earth or centre of the world; related historical sources also use auj or auge terminology.',
  category='historical planetary model', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='General historical astronomical entry. Keep source-specific distinctions such as apogee of deferent versus apogee of epicycle in interpretations.'
WHERE slug='apogee';
UPDATE terms SET
  short_definition='The point of an eccentric or deferent-type orbit nearest to the Earth or centre of the world, opposite the apogee.',
  category='historical planetary model', status='reviewed', entry_type='astronomical', definition_quality=5,
  editorial_notes='General historical astronomical entry. Keep source-specific orbit distinctions in interpretations.'
WHERE slug='perigee';

-- -----------------------------------------------------------------------------
-- ALIASES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Primary Motion','English','later-equivalent','Later English equivalent for the historical first motion; not identical to the technique of primary directions.' FROM terms WHERE slug='first-movement';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Secondary Motion','English','later-equivalent','Later English equivalent for the historical second motion; not identical to the technique of secondary directions.' FROM terms WHERE slug='second-movement';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Celestial Equator','English','modern-equivalent','Modern descriptive equivalent of the historical equinoctial circle.' FROM terms WHERE slug='equinoctial';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Ecliptic Latitude','English','modern-equivalent','Descriptive equivalent of celestial latitude measured from the ecliptic.' FROM terms WHERE slug='celestial-latitude';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Ecliptic Longitude','English','modern-equivalent','Descriptive equivalent of celestial longitude measured along the ecliptic.' FROM terms WHERE slug='celestial-longitude';

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGES
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'120',
       '§120, definition of the celestial sphere and the observer at its centre',
       NULL,
       'Primary source anchor for Celestial Sphere. Public text is original paraphrase.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim';

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'126-151',
       '§§126-151, first and second motions; horizon and meridian; equinoctial and ecliptic; declination, latitude and longitude; introductory epicycle model',
       NULL,
       'Definition-rich astronomical foundation sequence used for the coordinate and motion entries.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim';

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'171-184',
       '§§171-184, apogee and perigee; epicycle, deferent and equant; mean and corrected longitude',
       NULL,
       'Primary source anchor for the historical planetary-orbit model entries.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim';

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'93','95','Second Tractate','Chapter VII','First and second motion',
       'Chapter VII, house order explained through the first westward motion of the sky and second eastward motion of the planets',
       NULL,
       'Independent astrological confirmation of the first/second motion terminology. Editorial footnotes are not used as evidence.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS: AL-BIRUNI
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the celestial sphere as a spherical heavenly framework revolving in place and containing bodies whose motions differ from the motion of the sphere itself. He explicitly places the observer and Earth at the centre of this representational framework.',
       '§120, celestial sphere', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-sphere' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni calls the immediately visible westward daily motion of the heavenly bodies the first motion: bodies rise, culminate, descend and set in the west. He later characterizes this motion as uniform and dominant over the contrary proper motions of individual planets.',
       '§§126-127, first and second motions', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='first-movement' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni calls the contrary eastward motion of the planets the second motion. It differs in amount from planet to planet, is less immediately obvious than the uniform first motion, and supplies the planets’ proper progress against the daily westward turning of the heavens.',
       '§127, second easterly movement', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='second-movement' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni distinguishes a sensible horizon, which bounds the visible sky for an observer, from a true astronomical horizon parallel to it whose plane passes through the centre of the Earth and divides the celestial sphere into equal halves.',
       '§128, horizon', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='horizon' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the meridian as the great circle passing through the zenith that divides the Sun’s daily arc into two halves. Celestial points rise toward it, reach it at culmination, and then descend toward the west.',
       '§129, meridian', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='meridian' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the equinoctial as the great circle midway between the poles of the first motion. It is the girdle of that daily motion and the reference circle from which declination is measured.',
       '§138 and §147, equinoctial and declination', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='equinoctial' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the ecliptic as the girdle of the second motion and the circle or sphere of the signs. The Sun remains on it in its eastward motion; the ecliptic is inclined to the equinoctial and intersects it at the two equinoctial points.',
       '§139, ecliptic', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='ecliptic' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines declination as a star’s distance north or south of the equinoctial, measured on a great circle through the star and the poles of the first motion.',
       '§147, declination and latitude of stars', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='declination' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines celestial latitude as divergence north or south from the ecliptic, measured on great circles passing through the poles of the zodiacal sphere. He explicitly distinguishes this coordinate from declination relative to the equinoctial.',
       '§147, declination and latitude of stars', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-latitude' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'For a body possessing latitude, al-Biruni identifies its degree or longitude with the degree of the ecliptic intersected by the great circle on which that latitude is measured. Longitude is therefore the body’s projected position along the ecliptic.',
       '§148, degree or longitude of a star', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-longitude' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni describes the epicycle as a small orbit outside the Earth on whose circumference the planet moves. In his explanatory model the motion on the epicycle combines with the eastward carriage of the epicycle itself and accounts for alternations of direct, stationary and retrograde appearance.',
       '§151 and §178, epicycle', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='epicycle' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the deferent as the orbit on whose circumference the centre of the epicycle is continuously carried in the direction of the signs. In this model its centre differs from the centre of the world.',
       '§179, deferent', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='deferent' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the equant as the point of equal progress used to calculate the epicycle centre’s motion on the deferent. Equal-time motion is represented by equal angles from this point rather than from the centre of the deferent.',
       '§180, equant', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='equant' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni uses apogee for the farthest or highest point of an eccentric-type orbit relative to the Earth and distinguishes the apogee of an eccentric or deferent from the apogee of an epicycle. The translated source also records auj for this upper orbital point.',
       '§171 and §181, apogee', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='apogee' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni identifies perigee as the nearest or lowest point of the relevant eccentric or deferent-type orbit relative to the Earth, diametrically opposed to apogee; he also distinguishes the corresponding lower point of an epicycle.',
       '§171 and §181, perigee', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='perigee' AND w.slug='al-biruni-tafhim';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS: BONATTI CROSS-SOURCE CONFIRMATION
-- -----------------------------------------------------------------------------
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Bonatti explicitly contrasts the first and second motions while explaining the order of the houses: the sky turns from east to west by the first motion, while the planets are moved from west to east by the second motion.',
       'Second Tractate, Chapter VII, first and second motion', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='first-movement' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Bonatti explicitly contrasts the first and second motions while explaining the order of the houses: the sky turns from east to west by the first motion, while the planets are moved from west to east by the second motion.',
       'Second Tractate, Chapter VII, first and second motion', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w WHERE t.slug='second-movement' AND w.slug='bonatti-liber-astronomiae';

-- -----------------------------------------------------------------------------
-- CITATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug='celestial-sphere' AND sp.section='120';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('first-movement','second-movement','horizon','meridian','equinoctial','ecliptic','declination','celestial-latitude','celestial-longitude')
  AND sp.section='126-151';

-- Epicycle is supported by both the introductory explanation and the later formal orbit definition.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug='epicycle' AND sp.section IN ('126-151','171-184');

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim' AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('deferent','equant','apogee','perigee') AND sp.section='171-184';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='bonatti-liber-astronomiae' AND sw.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('first-movement','second-movement') AND sp.section='First and second motion';

-- -----------------------------------------------------------------------------
-- RELATIONS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('first-movement','second-movement','distinct-from','The first motion is the uniform westward daily motion; the second is the contrary eastward proper motion of the planets.'),
    ('equinoctial','ecliptic','intersects','The equinoctial and ecliptic intersect at the two equinoctial points and are mutually inclined.'),
    ('declination','equinoctial','measured-from','Declination is measured north or south from the equinoctial.'),
    ('celestial-latitude','ecliptic','measured-from','Celestial latitude is measured north or south from the ecliptic.'),
    ('celestial-longitude','ecliptic','measured-on','Celestial longitude is the projected degree position along the ecliptic.'),
    ('epicycle','deferent','carried-on','In the historical model, the centre of the epicycle is carried along the deferent.'),
    ('equant','deferent','models-motion-on','The equant is the point from which equal angular progress of the epicycle centre on the deferent is represented.'),
    ('apogee','perigee','opposite-point','Apogee and perigee are opposed farthest and nearest orbital points.'),
    ('apogee','auge','historically-corresponds-to','Bonatti’s Auge belongs to the same historical apogee/auj family of orbital terminology.'),
    ('ascending-in-apogee-orb','apogee','related-to','This phase is defined by motion toward the apogee region.'),
    ('descending-in-apogee-orb','apogee','related-to','This phase is defined by motion away from the apogee region.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
