-- Celestial coordinates and observational geometry foundation pass.
-- Continues the private-study-guided coverage audit while grounding every public
-- definition in al-Biruni's Tafhim. This pass deliberately separates coordinate
-- vocabulary from the already-reviewed rising-time and long/short ascension sign classes.

-- -----------------------------------------------------------------------------
-- TERMS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('ecliptic-longitude', 'Ecliptic Longitude', 'The position of a celestial body measured by the corresponding degree of the ecliptic, giving its longitudinal place in the zodiacal circle.', 'celestial coordinate', 'reviewed', 'Foundation astronomical coordinate. Keep distinct from terrestrial longitude and from right ascension measured on the equinoctial.', 'astronomical', 5),
  ('celestial-latitude', 'Celestial Latitude', 'Angular distance north or south of the ecliptic, measured on a great circle through the poles of the ecliptic.', 'celestial coordinate', 'reviewed', 'Foundation astronomical coordinate. In traditional texts unqualified latitude may require the celestial body to be specified.', 'astronomical', 5),
  ('declination', 'Declination', 'Angular distance north or south of the celestial equator or equinoctial, measured on a great circle through its poles.', 'celestial coordinate', 'reviewed', 'Foundation astronomical coordinate; distinct from celestial latitude because the reference circle is the equinoctial rather than the ecliptic.', 'astronomical', 5),
  ('zenith', 'Zenith', 'The point of the celestial sphere directly above an observer and one of the two poles of the local horizon.', 'observational geometry', 'reviewed', 'Local observational point; its position changes with the observer. Keep distinct from the Midheaven, which lies on the ecliptic-meridian intersection.', 'astronomical', 5),
  ('nadir', 'Nadir', 'The point of the celestial sphere directly opposite the zenith and below the observer, forming the opposite pole of the local horizon.', 'observational geometry', 'reviewed', 'Canonical definition is the local antipode of the zenith. Historical authors also use nadir more broadly for a point exactly opposite another point.', 'astronomical', 5),
  ('altitude', 'Altitude', 'The angular distance of a celestial body above the horizon, measured on a vertical circle passing through the body and the zenith.', 'observational coordinate', 'reviewed', 'Foundation horizon-coordinate quantity. Bodies below the horizon are treated by the corresponding depression rather than positive altitude.', 'astronomical', 5),
  ('zenith-distance', 'Zenith Distance', 'The angular distance between a celestial body and the zenith, complementary to its altitude when the body is above the horizon.', 'observational coordinate', 'reviewed', 'Foundation observational coordinate and explicit complement of altitude.', 'astronomical', 5),
  ('azimuth', 'Azimuth', 'The angular position of a vertical circle around the horizon, locating the direction in which a celestial body lies relative to the meridian or another chosen horizon reference.', 'observational coordinate', 'reviewed', 'Historical conventions can measure azimuth from different horizon reference points; preserve source-specific conventions in interpretations.', 'astronomical', 5),
  ('right-ascension', 'Right Ascension / Erect-Sphere Ascension', 'The equatorial arc associated with the rising of a celestial position in the erect sphere, corresponding to ascension at the terrestrial equator and to the later astronomical concept of right ascension.', 'ascensional coordinate', 'reviewed', 'The Tafhim explains the geometry as co-ascension of ecliptic and equinoctial rather than using the later English label Right Ascension. Treat the equivalence carefully.', 'astronomical', 4),
  ('oblique-ascension', 'Oblique Ascension', 'The amount of the celestial equator that rises with a zodiacal degree or sign at a terrestrial latitude away from the equator.', 'ascensional coordinate', 'reviewed', 'Direct historical geometry underlying rising times and the long/short ascension sign classes.', 'astronomical', 5),
  ('diurnal-arc', 'Diurnal Arc', 'The portion of a celestial body''s daily circle that lies above the horizon between rising and setting.', 'daily motion geometry', 'reviewed', 'Al-Biruni calls this the arc of day and contrasts it with the corresponding arc below the horizon.', 'astronomical', 5),
  ('semi-diurnal-arc', 'Semi-Diurnal Arc', 'Half of a celestial body''s diurnal arc, conventionally measured from rising to meridian passage or from meridian passage to setting.', 'daily motion geometry', 'reviewed', 'The source diagrams and house-division discussion use the semi-diurnal arc explicitly; definition synthesizes that geometry with the meridian definition.', 'astronomical', 4),
  ('eccentric-orbit', 'Eccentric / Excentric Orbit', 'A circular orbit in the traditional planetary model whose centre does not coincide with the centre of the world or Earth.', 'planetary model', 'reviewed', 'Historical geometrical device. The source translation uses excentric; eccentric is the conventional modern spelling.', 'astronomical', 5),
  ('inclined-orbit', 'Inclined Orbit', 'A planetary orbital circle whose plane is inclined to the ecliptic, allowing the body to move north and south of the ecliptic.', 'planetary model', 'reviewed', 'Historical geometrical device used to explain celestial latitude and the existence of orbital nodes.', 'astronomical', 5),
  ('ascending-node', 'Ascending Node', 'The intersection of an inclined orbit with the ecliptic at which the body crosses from south of the ecliptic to north of it.', 'orbital node', 'reviewed', 'Generic astronomical node. When used without qualification in much astrological literature the lunar node is often intended; do not silently universalize lunar aliases to every planet.', 'astronomical', 5),
  ('descending-node', 'Descending Node', 'The intersection of an inclined orbit with the ecliptic at which the body crosses from north of the ecliptic to south of it.', 'orbital node', 'reviewed', 'Generic astronomical node. When used without qualification in much astrological literature the lunar node is often intended; do not silently universalize lunar aliases to every planet.', 'astronomical', 5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Excentric Orbit','English','translation-variant','Spelling used in the Tafhim translation for an eccentric orbit.' FROM terms WHERE slug='eccentric-orbit';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Erect-Sphere Ascension','English','historical-descriptive-equivalent','Ascension measured in the erect sphere at the equator; geometrically corresponds to right ascension for ecliptic positions.' FROM terms WHERE slug='right-ascension';

-- -----------------------------------------------------------------------------
-- NEW SOURCE PASSAGES
-- The previous seed already added a broad §§170-181 block, reused below for
-- eccentric/inclined orbits and nodes rather than inserting a duplicate passage.
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,'72','73','147-149',
       '§§147-149: declination, celestial latitude, and the ecliptic degree or longitude of a star',
       NULL,
       'Primary source anchor for the three basic ecliptic/equatorial coordinates used in this pass.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='147-149'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,'144','148','221-230',
       '§§221-230: day and night arcs, semi-diurnal arcs, altitude, zenith distance and azimuth',
       NULL,
       'Primary source anchor for observational geometry relative to the local horizon and zenith.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='221-230'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id,'159','161','242-243',
       '§§242-243: co-ascensions of the equinoctial and ecliptic, erect-sphere and latitude-dependent ascensions',
       NULL,
       'Primary source anchor for right/erect-sphere and oblique ascension. The later English label right ascension is editorially normalized rather than quoted from the source.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='242-243'
  );

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines a star''s degree or longitude as the degree of the ecliptic intersected by the great circle on which its celestial latitude is measured.',
       '§148, ecliptic degree or longitude of a star', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='ecliptic-longitude' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§148, ecliptic degree or longitude of a star');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines celestial latitude as a body''s divergence north or south from the ecliptic, measured on great circles passing through the poles of the zodiac or ecliptic sphere.',
       '§147, celestial latitude', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='celestial-latitude' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§147, celestial latitude');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines declination as a body''s distance north or south from the equinoctial, measured on the great circle through the body and the poles of the equinoctial.',
       '§147, declination', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='declination' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§147, declination');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In Al-Biruni''s local-sky geometry the zenith is the pole of the horizon above the observer. Vertical circles used for altitude pass through it, and zenith distance is measured from it to the body.',
       '§225 and §230, zenith in local horizon geometry', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='zenith' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§225 and §230, zenith in local horizon geometry');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni uses the nadir as the point opposite the zenith in local celestial geometry and more generally as the exactly opposite counterpart of a point; the local nadir lies below the observer.',
       '§§222-230, nadir as opposite local point', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='nadir' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§§222-230, nadir as opposite local point');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines altitude as the arc of a vertical great circle between a celestial body above the horizon and the horizon itself.',
       '§225, altitude', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='altitude' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§225, altitude');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni calls the arc between a body and the zenith the complement of altitude or zenith distance, making the two quantities complementary for bodies above the horizon.',
       '§225, zenith distance', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='zenith-distance' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§225, zenith distance');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni locates a body''s azimuth through the intersection of its vertical circle with the horizon and describes the corresponding angular distance relative to the meridian and equinoctial reference.',
       '§230, azimuth', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='azimuth' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§230, azimuth');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the arc of day as the portion of a body''s daily parallel lying above the horizon; its complementary portion below the horizon is the arc of night.',
       '§222, arc of day or diurnal arc', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='diurnal-arc' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§222, arc of day or diurnal arc');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni''s diagram of the arc of day explicitly marks semi-diurnal arcs, while his meridian definition divides the visible daily course into two halves. Together these establish the semi-diurnal arc as half the above-horizon daily arc.',
       '§129 and §222, semi-diurnal arc', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='semi-diurnal-arc' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§129 and §222, semi-diurnal arc');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni explains that at the equator the ascensions occur in the erect sphere: each ecliptic interval rises with a corresponding arc of the equinoctial. This is the historical geometry represented here under the later normalized label right ascension.',
       '§242, erect-sphere co-ascension', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='right-ascension' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§242, erect-sphere co-ascension');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni explains that away from the equator the arc of the equinoctial rising with a sign or degree changes with terrestrial latitude. He explicitly calls the resulting quantity oblique ascension and uses it to distinguish short/crooked from long/direct ascensions.',
       '§242, latitude-dependent or oblique ascension', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='oblique-ascension' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§242, latitude-dependent or oblique ascension');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni describes the Sun as travelling on an excentric orbit in the same plane as the ecliptic but with a centre different from the centre of the world, producing nearest and farthest points relative to Earth.',
       '§171, excentric orbit', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='eccentric-orbit' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§171, excentric orbit');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni explains that the planets deviate north and south of the ecliptic because they move in orbital planes inclined to it; these inclined orbits have their own inclination and intersection points with the ecliptic.',
       '§176, inclined planetary orbits', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='inclined-orbit' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§176, inclined planetary orbits');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the ascending node as the intersection at which a body moving on an inclined orbit crosses the ecliptic toward the north.',
       '§177, ascending node', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='ascending-node' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§177, ascending node');

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni defines the descending node as the opposite intersection at which a body moving on an inclined orbit crosses the ecliptic toward the south.',
       '§177, descending node', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='descending-node' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§177, descending node');

-- -----------------------------------------------------------------------------
-- CITATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id AND e.work_id=w.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('ecliptic-longitude','celestial-latitude','declination')
  AND sp.section='147-149';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id AND e.work_id=w.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('zenith','nadir','altitude','zenith-distance','azimuth','diurnal-arc','semi-diurnal-arc')
  AND sp.section='221-230';

-- Semi-diurnal arc also depends on the already-reviewed meridian definition.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id AND e.work_id=w.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug='semi-diurnal-arc'
  AND sp.section='120-129';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id AND e.work_id=w.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('right-ascension','oblique-ascension')
  AND sp.section='242-243';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id AND e.work_id=w.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('eccentric-orbit','inclined-orbit','ascending-node','descending-node')
  AND sp.section='170-181';

-- -----------------------------------------------------------------------------
-- RELATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'measured-on','Ecliptic longitude is measured by position on the ecliptic.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='ecliptic-longitude' AND b.slug='ecliptic';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'measured-from','Celestial latitude is angular distance north or south from the ecliptic.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='celestial-latitude' AND b.slug='ecliptic';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'measured-from','Declination is angular distance north or south from the equinoctial/celestial equator.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='declination' AND b.slug='equinoctial';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'opposite-to','Zenith and nadir are the two opposite poles of the local horizon.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='zenith' AND b.slug='nadir';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'complementary-to','For a body above the horizon, altitude and zenith distance sum to a quadrant.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='altitude' AND b.slug='zenith-distance';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'measured-around','Azimuth locates a vertical circle around the local horizon.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='azimuth' AND b.slug='horizon';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'underlies','Right or erect-sphere ascension is the equatorial ascensional measure underlying rising-time calculations at zero latitude.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='right-ascension' AND b.slug='rising-times';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'underlies','Oblique ascension is the latitude-dependent equatorial measure used in rising times.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='oblique-ascension' AND b.slug='rising-times';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'depends-on','Oblique ascension varies with terrestrial latitude, historically organized through climes.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='oblique-ascension' AND b.slug='clime';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'half-of','The semi-diurnal arc is one half of the above-horizon diurnal arc.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='semi-diurnal-arc' AND b.slug='diurnal-arc';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'produces-extreme','An eccentric orbit produces a farthest point represented by apogee.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='eccentric-orbit' AND b.slug='apogee';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'produces-extreme','An eccentric orbit produces a nearest point represented by perigee.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='eccentric-orbit' AND b.slug='perigee';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'intersects-at','An inclined orbit crosses the ecliptic at the ascending node when the body moves north.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='inclined-orbit' AND b.slug='ascending-node';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'intersects-at','An inclined orbit crosses the ecliptic at the descending node when the body moves south.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='inclined-orbit' AND b.slug='descending-node';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'paired-with','Ascending and descending nodes are opposite crossings of the same inclined orbit and ecliptic.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='ascending-node' AND b.slug='descending-node';
