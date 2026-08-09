-- Encyclopedia conversion pass: astronomical geometry, coordinates and historical
-- planetary-model vocabulary. The underlying terms already have reviewed primary
-- evidence from al-Biruni, with Bonatti providing additional confirmation for the
-- first/second motion terminology.
--
-- These entries explain the historical geometrical framework used by astrology;
-- they do not present premodern orbital models as modern physical astronomy.

-- -----------------------------------------------------------------------------
-- CELESTIAL FRAMEWORK AND DAILY MOTIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The celestial sphere is the observer-centered spherical framework on which traditional astronomy represents the positions and motions of celestial bodies. It supplies the geometry for horizon, meridian, rising, setting, culmination, coordinates and the zodiac without requiring the sphere to be understood as a literal modern physical shell.',
  'reviewed','Historical geometrical framework anchored to al-Biruni §120.'
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'observational-frame','An observer-centered geometrical frame',
  'The usefulness of the celestial sphere is geometrical. Circles such as the horizon, meridian, equinoctial and ecliptic can be defined on it, and a body can be located by angular coordinates even though the bodies themselves lie at very different physical distances.',10,'reviewed'
FROM terms WHERE slug='celestial-sphere';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'principal-circles','Principal circles and points',
  'A compact map of the main geometrical references used throughout the lexicon.',
  '["Reference","What it describes","Observer-dependent?"]',
  '[["Horizon","Boundary between visible and invisible hemispheres","Yes"],["Meridian","Great circle of culmination through zenith and nadir","Yes"],["Zenith / Nadir","Opposite poles of the local horizon","Yes"],["Equinoctial / Celestial Equator","Reference circle for declination and daily rotation","No local latitude dependence"],["Ecliptic","Solar path and reference circle for zodiacal longitude/latitude","No local latitude dependence"]]',
  20,'reviewed','Orientation table; detailed definitions remain on individual pages.'
FROM terms WHERE slug='celestial-sphere';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'First Motion is the uniform apparent westward daily motion that carries celestial bodies from rising toward culmination, setting and return. It is the dominant daily rotation of the traditional celestial framework and is distinct from a planet’s own eastward motion through the zodiac.',
  'reviewed','al-Biruni §§126-127; Bonatti independently confirms the contrast.'
FROM terms WHERE slug='first-movement';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','First motion versus second motion',
  'First motion is the daily westward turning of the heavens. Second motion is the slower eastward proper progress of planets against that daily rotation. The words first and second describe two motions, not a ranking of importance and not the predictive technique called primary directions.',10,'reviewed'
FROM terms WHERE slug='first-movement';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Second Motion is the eastward proper motion of the planets against the westward first motion of the heavens. Its rate differs from planet to planet and underlies ordinary zodiacal progress, stations and retrogradation as represented in the traditional model.',
  'reviewed','al-Biruni §127; Bonatti independently confirms the terminology.'
FROM terms WHERE slug='second-movement';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','Proper motion against daily rotation',
  'A planet can be carried westward across the local sky by first motion while simultaneously advancing eastward through zodiacal longitude by second motion. Keeping these motions separate prevents confusion between daily rising/setting geometry and a planet’s changing zodiacal position.',10,'reviewed'
FROM terms WHERE slug='second-movement';

-- -----------------------------------------------------------------------------
-- LOCAL SKY: HORIZON, MERIDIAN, ZENITH/NADIR, ALTITUDE/AZIMUTH
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The horizon is the circle that divides the visible and invisible halves of the sky for an observer. Premodern astronomy distinguishes the sensible horizon seen from the observer’s surface position from the true or astronomical horizon represented through the Earth’s center.',
  'reviewed','Anchored to al-Biruni §128.'
FROM terms WHERE slug='horizon';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'astrological-role','Why the horizon matters astrologically',
  'The eastern and western intersections of the relevant celestial paths with the horizon define rising and setting. The Sun’s position above or below the horizon also determines whether a chart is diurnal or nocturnal, making the horizon fundamental to both house geometry and sect.',10,'reviewed'
FROM terms WHERE slug='horizon';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The meridian is the great circle passing through the observer’s zenith and nadir that marks culmination. A celestial body reaches its upper meridian passage when it is highest in the local daily arc and later crosses the opposite portion below the horizon.',
  'reviewed','Anchored to al-Biruni §129.'
FROM terms WHERE slug='meridian';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation-to-houses','Meridian and angles',
  'The meridian provides the astronomical geometry behind the upper and lower meridian directions associated with the Midheaven and lower culmination. It should not be confused with the ecliptic itself: house angles arise from intersections among local circles and the zodiacal framework.',10,'reviewed'
FROM terms WHERE slug='meridian';

WITH z(slug,intro,relation) AS (
  VALUES
    ('zenith','The zenith is the point of the celestial sphere directly above the observer and the upper pole of the local horizon. Vertical circles used for altitude and azimuth pass through it.','The zenith depends on the observer’s location. It is not the same point as the Midheaven: the zenith is a local horizon pole, whereas the Midheaven is defined through the meridian/ecliptic geometry of the chart.'),
    ('nadir','The nadir is the point directly opposite the zenith and below the observer, forming the lower pole of the local horizon.','Zenith and nadir are antipodal local points. Like the zenith, the nadir should not be identified automatically with an ecliptic house cusp or lower-meridian zodiacal degree.'),
    ('altitude','Altitude is the angular height of a celestial body above the local horizon, measured on the vertical circle through the body and zenith.','Altitude is a local observational coordinate. For a body above the horizon it is complementary to zenith distance: increasing altitude means decreasing distance from the zenith.'),
    ('zenith-distance','Zenith Distance is the angular distance between a celestial body and the zenith. For a body above the horizon it is complementary to altitude.','Altitude and zenith distance describe the same vertical-circle position from opposite references. Their sum is a quadrant for an object above the horizon.'),
    ('azimuth','Azimuth locates the direction of a celestial body around the local horizon by identifying the vertical circle on which the body lies.','Historical conventions can choose different horizon origins for counting azimuth. The stable concept is directional position around the horizon; numerical convention should remain source-specific.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,z.intro,'reviewed','Local observational geometry from al-Biruni §§221-230.'
FROM z JOIN terms t ON t.slug=z.slug;

WITH z(slug,relation) AS (
  VALUES
    ('zenith','The zenith depends on the observer’s location. It is not the same point as the Midheaven: the zenith is a local horizon pole, whereas the Midheaven is defined through the meridian/ecliptic geometry of the chart.'),
    ('nadir','Zenith and nadir are antipodal local points. Like the zenith, the nadir should not be identified automatically with an ecliptic house cusp or lower-meridian zodiacal degree.'),
    ('altitude','Altitude is a local observational coordinate. For a body above the horizon it is complementary to zenith distance: increasing altitude means decreasing distance from the zenith.'),
    ('zenith-distance','Altitude and zenith distance describe the same vertical-circle position from opposite references. Their sum is a quadrant for an object above the horizon.'),
    ('azimuth','Historical conventions can choose different horizon origins for counting azimuth. The stable concept is directional position around the horizon; numerical convention should remain source-specific.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'geometry','Geometrical relation',z.relation,10,'reviewed'
FROM z JOIN terms t ON t.slug=z.slug;

-- A local-coordinate comparison belongs on the Altitude page.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'local-coordinates','Local observational coordinates',
  'These quantities depend on the observer and local horizon rather than simply on zodiacal longitude.',
  '["Quantity","Reference","Meaning"]',
  '[["Altitude","Horizon","Angular height above the horizon"],["Zenith distance","Zenith","Angular distance from the zenith"],["Azimuth","Horizon direction","Position around the horizon"]]',
  20,'reviewed','Compact local-coordinate reference.'
FROM terms WHERE slug='altitude';

-- -----------------------------------------------------------------------------
-- EQUINOCTIAL, ECLIPTIC AND COORDINATES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Equinoctial, equivalent to the celestial equator, is the great circle midway between the poles of the daily first motion. It is the reference circle from which declination is measured and is inclined to the ecliptic.',
  'reviewed','Anchored to al-Biruni §§138 and 147.'
FROM terms WHERE slug='equinoctial';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation-to-ecliptic','Relation to the ecliptic',
  'The equinoctial and ecliptic are different great circles. They intersect at the equinoctial points and are inclined to one another. Declination is measured from the equinoctial, while zodiacal latitude is measured from the ecliptic.',10,'reviewed'
FROM terms WHERE slug='equinoctial';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The ecliptic is the great circle followed by the Sun in its annual eastward motion and the central reference circle of the zodiac. Zodiacal longitude is measured along it, while celestial or ecliptic latitude measures distance north or south of it.',
  'reviewed','Anchored to al-Biruni §§139 and 147-148.'
FROM terms WHERE slug='ecliptic';
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'coordinate-comparison','Coordinate references',
  'Several angular quantities use different reference circles; they should not be collapsed into one generic “latitude/longitude” idea.',
  '["Quantity","Reference circle / frame","What it measures"]',
  '[["Celestial longitude","Ecliptic","Position along the ecliptic"],["Celestial latitude","Ecliptic","Distance north or south of the ecliptic"],["Declination","Equinoctial / celestial equator","Distance north or south of the equinoctial"],["Right ascension","Equinoctial","Equatorial co-ascension in the erect sphere"],["Oblique ascension","Equinoctial + local latitude","Equatorial arc rising with an ecliptic position at a terrestrial latitude"]]',
  10,'reviewed','Coordinate comparison table.'
FROM terms WHERE slug='ecliptic';

WITH c(slug,intro,distinction) AS (
  VALUES
    ('declination','Declination is the angular distance of a celestial body north or south of the equinoctial or celestial equator. It is measured in an equatorial frame, not from the ecliptic.','Declination and celestial latitude are different coordinates because they use different reference circles. A body may have zero ecliptic latitude while still possessing declination because the ecliptic itself is inclined to the equinoctial.'),
    ('celestial-latitude','Celestial or ecliptic latitude is the angular distance of a body north or south of the ecliptic, measured on a circle through the poles of the zodiacal sphere.','Celestial latitude should not be confused with terrestrial latitude or declination. The first locates a body relative to the ecliptic; declination locates it relative to the celestial equator.'),
    ('celestial-longitude','Celestial or ecliptic longitude is the body’s projected position along the ecliptic and supplies the familiar zodiacal degree coordinate used throughout astrology.','Longitude and latitude form an ecliptic coordinate pair. Longitude states where along the zodiacal circle the projected position falls; latitude states how far north or south of the ecliptic the body actually lies.'),
    ('right-ascension','Right Ascension, represented here as the later normalized equivalent of erect-sphere ascension for ecliptic positions, measures the corresponding equatorial arc in the geometry of an observer at the terrestrial equator.','Right ascension belongs to equatorial rather than zodiacal measurement. In the historical source the concept is explained through co-ascension of the ecliptic and equinoctial in the erect sphere; the modern English label is editorial normalization.'),
    ('oblique-ascension','Oblique Ascension is the amount of the celestial equator that rises with a zodiacal degree or sign at a terrestrial latitude away from the equator.','Unlike erect-sphere/right ascension, oblique ascension changes with terrestrial latitude. This latitude dependence produces the unequal rising times behind the long/straight and short/crooked ascension sign classes.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,c.intro,'reviewed','Coordinate article synthesized from reviewed al-Biruni evidence.'
FROM c JOIN terms t ON t.slug=c.slug;

WITH c(slug,distinction) AS (
  VALUES
    ('declination','Declination and celestial latitude are different coordinates because they use different reference circles. A body may have zero ecliptic latitude while still possessing declination because the ecliptic itself is inclined to the equinoctial.'),
    ('celestial-latitude','Celestial latitude should not be confused with terrestrial latitude or declination. The first locates a body relative to the ecliptic; declination locates it relative to the celestial equator.'),
    ('celestial-longitude','Longitude and latitude form an ecliptic coordinate pair. Longitude states where along the zodiacal circle the projected position falls; latitude states how far north or south of the ecliptic the body actually lies.'),
    ('right-ascension','Right ascension belongs to equatorial rather than zodiacal measurement. In the historical source the concept is explained through co-ascension of the ecliptic and equinoctial in the erect sphere; the modern English label is editorial normalization.'),
    ('oblique-ascension','Unlike erect-sphere/right ascension, oblique ascension changes with terrestrial latitude. This latitude dependence produces the unequal rising times behind the long/straight and short/crooked ascension sign classes.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'distinction','Key distinction',c.distinction,10,'reviewed'
FROM c JOIN terms t ON t.slug=c.slug;

-- -----------------------------------------------------------------------------
-- DAILY ARCS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The diurnal arc is the portion of a celestial body’s daily circle lying above the horizon between rising and setting. Its length varies with the body’s declination and the observer’s terrestrial latitude.',
  'reviewed','Anchored to al-Biruni §222.'
FROM terms WHERE slug='diurnal-arc';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'local-dependence','A local, latitude-dependent arc',
  'The same celestial declination can spend different amounts of time above the horizon at different terrestrial latitudes. Diurnal arc therefore belongs to local observational geometry and is important to time-based house and directional calculations.',10,'reviewed'
FROM terms WHERE slug='diurnal-arc';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The semi-diurnal arc is one half of a body’s diurnal arc, conventionally corresponding to the above-horizon motion from rising to upper meridian passage or from that passage to setting.',
  'reviewed','Historical term represented in al-Biruni’s arc-of-day geometry.'
FROM terms WHERE slug='semi-diurnal-arc';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation','Relation to the full diurnal arc',
  'Semi-diurnal arc is a derived half-arc rather than an independent orbit. It divides the above-horizon daily path around the upper meridian and is useful in traditional proportional measurements tied to local rising and culmination.',10,'reviewed'
FROM terms WHERE slug='semi-diurnal-arc';

-- -----------------------------------------------------------------------------
-- HISTORICAL PLANETARY MODEL
-- -----------------------------------------------------------------------------
WITH p(slug,intro,role) AS (
  VALUES
    ('eccentric-orbit','An eccentric or excentric orbit is a circular orbit in the historical planetary model whose center does not coincide with the center of the world. The displacement supplies geometrical variation in a body’s distance and apparent motion.','Eccentricity in this historical sense is a geometrical device of the geocentric model. It produces farthest and nearest orbital points represented by apogee and perigee.'),
    ('inclined-orbit','An inclined orbit is an orbital circle whose plane is tilted relative to the ecliptic. The model uses this inclination to represent a planet’s motion north and south of the ecliptic.','Where an inclined orbit crosses the ecliptic it produces ascending and descending nodes. Inclination therefore belongs directly to the geometry of celestial latitude.'),
    ('epicycle','An epicycle is a smaller circle on whose circumference a planet moves while the epicycle itself is carried through a larger orbital system. Premodern astronomers used the combined motions to model changes in speed, station and retrogradation.','The epicycle is one component in a geometrical model, not a separate zodiacal motion rule. Its center is carried on the deferent while the planet moves around the epicycle.'),
    ('deferent','The deferent is the larger orbit along which the center of a planet’s epicycle is carried in the traditional planetary model. Its own center can be displaced from the center of the world.','Deferent, epicycle and equant perform different roles: the deferent carries the epicycle center, the epicycle carries the planet, and the equant represents uniform angular progress from a different reference point.'),
    ('equant','The equant is the point from which the center of an epicycle is represented as making equal angular progress in equal times along its deferent, even when that motion is not uniform relative to the deferent’s own center.','The equant is a calculation/reference point, not another orbit. Its function is to represent non-uniform motion geometrically within the historical model.'),
    ('apogee','Apogee is the farthest point of an eccentric or deferent-type orbit from the Earth or center of the world. Historical texts also preserve related auj or auge terminology.','Apogee is paired with perigee. Sources may distinguish the apogee of a deferent/eccentric from the farthest point of an epicycle, so the general term should not erase those model-specific distinctions.'),
    ('perigee','Perigee is the nearest point of an eccentric or deferent-type orbit to the Earth or center of the world, opposite the apogee.','Perigee and apogee are extrema of distance within a particular orbital circle. A source may distinguish corresponding extrema for different circles in the same planetary model.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,p.intro,'reviewed','Historical astronomy article; not modern physical astronomy.'
FROM p JOIN terms t ON t.slug=p.slug;

WITH p(slug,role) AS (
  VALUES
    ('eccentric-orbit','Eccentricity in this historical sense is a geometrical device of the geocentric model. It produces farthest and nearest orbital points represented by apogee and perigee.'),
    ('inclined-orbit','Where an inclined orbit crosses the ecliptic it produces ascending and descending nodes. Inclination therefore belongs directly to the geometry of celestial latitude.'),
    ('epicycle','The epicycle is one component in a geometrical model, not a separate zodiacal motion rule. Its center is carried on the deferent while the planet moves around the epicycle.'),
    ('deferent','Deferent, epicycle and equant perform different roles: the deferent carries the epicycle center, the epicycle carries the planet, and the equant represents uniform angular progress from a different reference point.'),
    ('equant','The equant is a calculation/reference point, not another orbit. Its function is to represent non-uniform motion geometrically within the historical model.'),
    ('apogee','Apogee is paired with perigee. Sources may distinguish the apogee of a deferent/eccentric from the farthest point of an epicycle, so the general term should not erase those model-specific distinctions.'),
    ('perigee','Perigee and apogee are extrema of distance within a particular orbital circle. A source may distinguish corresponding extrema for different circles in the same planetary model.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'model-role','Role in the historical model',p.role,10,'reviewed'
FROM p JOIN terms t ON t.slug=p.slug;

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-model','Components of the historical planetary model',
  'A schematic comparison of the principal geometrical components; individual authors can vary in implementation.',
  '["Component","Function"]',
  '[["Deferent","Carries the center of the epicycle"],["Epicycle","Carries the planet around a smaller circle"],["Equant","Reference point for equal angular progress"],["Eccentric orbit","Orbit whose center is displaced from Earth/world center"],["Inclined orbit","Tilted plane allowing north/south ecliptic latitude"],["Apogee / Perigee","Farthest / nearest orbital points"]]',
  20,'reviewed','Historical-model orientation table.'
FROM terms WHERE slug='epicycle';

-- -----------------------------------------------------------------------------
-- NODES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The ascending node is the intersection at which a body moving on an inclined orbit crosses the ecliptic from south to north. It is a generic orbital concept; unqualified astrological node terminology often refers specifically to the Moon, but that narrower usage should not be universalized.',
  'reviewed','Anchored to al-Biruni §177.'
FROM terms WHERE slug='ascending-node';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'pair','Paired with the descending node',
  'An inclined orbital plane intersects the ecliptic at two opposite nodes. The ascending node is the northward crossing; the descending node is the southward crossing.',10,'reviewed'
FROM terms WHERE slug='ascending-node';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The descending node is the intersection at which a body moving on an inclined orbit crosses the ecliptic from north to south. It is the opposite crossing from the ascending node.',
  'reviewed','Anchored to al-Biruni §177.'
FROM terms WHERE slug='descending-node';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'pair','Paired with the ascending node',
  'Both nodes belong to the same inclined orbit/ecliptic intersection. The distinction is directional: ascending crosses toward northern latitude, descending toward southern latitude.',10,'reviewed'
FROM terms WHERE slug='descending-node';
