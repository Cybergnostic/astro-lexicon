-- Bird's-eye encyclopedia review: historical cosmology / foundational models.
--
-- Main correction: the Thema Mundi's domicile sequence is not the same thing as the
-- geocentric order of planetary spheres. This pass gives Planetary Order its own source-
-- backed entry and connects the celestial model, zodiac, planets, sect and domicile model
-- without flattening them into one undifferentiated "cosmology".
--
-- Direct public witnesses added/used:
-- - Ptolemy, Tetrabiblos I.17 for the rationale of planetary houses/domiciles.
-- - Ptolemy, Tetrabiblos IV.10 for the Moon-to-Saturn sphere/age order.
-- - Firmicus, Mathesis III.1 remains the direct Thema Mundi witness already in the corpus.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- PTOLEMY I.17: DOMICILE COSMOLOGY
-- -----------------------------------------------------------------------------

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'79','83','Book I','17','Houses of the several planets',
       'Tetrabiblos I.17: Ptolemy explains the houses/domiciles from Cancer and Leo as the luminary houses, then distributes the paired houses of the five planets outward in relation to planetary spheres, natures and aspects to the luminaries.',
       NULL,
       'Direct public witness checked in the Robbins/LacusCurtius text. Original project summary only; no copied translation stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Houses of the several planets'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Ptolemy places the luminaries at the centre of the domicile arrangement, with the Moon ruling Cancer and the Sun Leo. The five remaining planets receive paired signs extending away from the luminaries: Mercury Gemini/Virgo, Venus Taurus/Libra, Mars Aries/Scorpio, Jupiter Pisces/Sagittarius and Saturn Aquarius/Capricorn. His explanation relates this symmetry to planetary sphere order, planetary natures and the aspects formed to the luminary houses.',
  'Tetrabiblos I.17: rationale of planetary houses','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='domicile' AND w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Tetrabiblos I.17: rationale of planetary houses'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='domicile'
  AND w.slug='ptolemy-tetrabiblos'
  AND sp.section='Houses of the several planets';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ptolemaic-symmetry','The luminary-centred domicile symmetry',
  'Ptolemy’s explanation of the domicile scheme begins with Cancer and Leo as the houses of the Moon and Sun. The remaining planets receive paired signs on either side of those luminary houses: Mercury nearest, then Venus, Mars, Jupiter and Saturn farthest away. This is a zodiacal rulership pattern informed by planetary order and aspect relationships; it is not itself a diagram of the planets’ physical or geocentric sphere positions.',18,'reviewed',
  'Direct Ptolemy I.17 witness attached in seed 0165.'
FROM terms WHERE slug='domicile';

-- -----------------------------------------------------------------------------
-- PLANETARY ORDER AS ITS OWN CONCEPT
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('planetary-order','Traditional Planetary Order',
   'The traditional geocentric ordering of the seven planets by their spheres, from the Moon nearest the Earth outward through Mercury, Venus, Sun, Mars, Jupiter and Saturn.',
   'foundational cosmology','reviewed',
   'Source-backed here from Ptolemy. Keep distinct from the zodiacal sequence of domicile assignments in the Thema Mundi or Ptolemaic house rationale.',
   'technical',5);

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Ptolemy’s general age sequence explicitly proceeds from the first sphere nearest us, the Moon, through Mercury, Venus, the Sun, Mars and Jupiter to Saturn as the outermost of the seven planetary spheres. His domicile discussion independently describes Saturn as highest/farthest from the luminaries, Jupiter beneath Saturn, Mars beneath Jupiter, Venus beneath Mars and Mercury beneath the others and close to the luminaries.',
  'Tetrabiblos I.17 and IV.10: order of planetary spheres','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-order' AND w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Tetrabiblos I.17 and IV.10: order of planetary spheres'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='planetary-order'
  AND w.slug='ptolemy-tetrabiblos'
  AND sp.section IN ('Houses of the several planets','Ages of life');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Traditional Planetary Order is the geocentric sequence of the seven wandering lights by sphere: Moon, Mercury, Venus, Sun, Mars, Jupiter and Saturn from the Earth outward. This order is a cosmological/astronomical model inherited by much traditional astrology. It is related to several astrological structures, but it should not be confused with the zodiacal order in which planets appear in the Thema Mundi or with the order of weekday rulers.',
  'reviewed','Bird’s-eye foundational article. Current direct witness: Ptolemy I.17 and IV.10.'
FROM terms WHERE slug='planetary-order';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'model-status','A geocentric ordering model',
  'The order describes the inherited arrangement of planetary spheres around the Earth in the traditional astronomical framework. Modern heliocentric astronomy uses a different physical model, but the historical order remains necessary for understanding older astrological doctrines that explicitly refer to superior/inferior placement, planetary spheres or sequences derived from them.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-order';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-thema-sequence','Not the same sequence as the Thema Mundi',
  'The Thema Mundi preserved by Firmicus places Moon in Cancer, Sun in Leo, Mercury in Virgo, Venus in Libra, Mars in Scorpio, Jupiter in Sagittarius and Saturn in Capricorn. That is a zodiacal domicile model. The geocentric planetary order instead places Mercury and Venus between the Moon and Sun. The two structures interact historically, but they answer different questions.',20,'reviewed',NULL
FROM terms WHERE slug='planetary-order';

-- -----------------------------------------------------------------------------
-- CORRECT THE THEMA MUNDI ARTICLE
-- -----------------------------------------------------------------------------

UPDATE term_article_sections
SET body='Firmicus places the Ascendant and Moon at the 15th degree of Cancer, the Sun at 15 Leo, Mercury at 15 Virgo, Venus at 15 Libra, Mars at 15 Scorpio, Jupiter at 15 Sagittarius and Saturn at 15 Capricorn. Read zodiacally, the model places every planet in a domicile and produces an ordered sequence of rulerships around the signs. This zodiacal domicile sequence should not be mistaken for the geocentric order of planetary spheres, in which Mercury and Venus lie between the Moon and the Sun.',
    editorial_notes='Bird’s-eye correction: removed the earlier inaccurate claim that the Thema Mundi sequence itself walks outward through planetary sphere order.'
WHERE term_id=(SELECT id FROM terms WHERE slug='thema-mundi')
  AND section_key='structure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'domicile-model','A domicile model rather than a sphere diagram',
  'The figure is especially useful as a compact model of planetary domiciles: Cancer and Leo hold the luminaries, followed zodiacally by Mercury, Venus, Mars, Jupiter and Saturn through their signs. The conceptual relationship between this pattern and broader domicile doctrine can be studied without claiming that the chart literally depicts the physical spacing or sphere order of the planets.',25,'reviewed',NULL
FROM terms WHERE slug='thema-mundi';

-- -----------------------------------------------------------------------------
-- SEVEN-PLANET AND COSMOLOGICAL FAMILY MAPS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The Seven Traditional Planets are the Sun, Moon, Mercury, Venus, Mars, Jupiter and Saturn—the seven visible wandering lights used as the complete planetary framework of premodern astrology before the discovery of the modern outer planets.',
  editorial_notes='Bird’s-eye cosmology review. “Planet” here is the traditional astrological category and includes the two luminaries.'
WHERE slug='seven-planets';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Seven Traditional Planets are the complete set of wandering lights used in the classical and medieval astrological framework: Sun, Moon, Mercury, Venus, Mars, Jupiter and Saturn. In modern astronomy the Sun is a star and the Moon a natural satellite, but traditional astrological vocabulary groups both luminaries with the five visible planets because all seven are moving celestial significators rather than fixed stars.',
  'reviewed','Bird’s-eye cosmology article. Historical category is stated separately from modern object classification.'
FROM terms WHERE slug='seven-planets';

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('traditional-planetary-order','Traditional Geocentric Planetary Order',
   'Ptolemy’s inherited ordering of the seven planetary spheres from the Earth outward, separated explicitly from zodiacal domicile sequences.',
   'historical-system',
   'Source-specific ordered cosmological model. Modern physical astronomy differs; retain the historical order because later doctrines refer to it.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('planetary-order','framework','Framework',5,'The ordered cosmological concept itself.'),
  ('moon','ordered-sphere','Earth outward',10,'First/nearest planetary sphere in Ptolemy’s sequence.'),
  ('mercury','ordered-sphere','Earth outward',20,'Second planetary sphere.'),
  ('venus','ordered-sphere','Earth outward',30,'Third planetary sphere.'),
  ('sun','ordered-sphere','Earth outward',40,'Middle/fourth planetary sphere.'),
  ('mars','ordered-sphere','Earth outward',50,'Fifth planetary sphere.'),
  ('jupiter','ordered-sphere','Earth outward',60,'Sixth planetary sphere.'),
  ('saturn','ordered-sphere','Earth outward',70,'Seventh/outermost traditional planetary sphere.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='traditional-planetary-order'
JOIN terms t ON t.slug=m.term_slug;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('cosmological-foundations','Cosmological Foundations',
   'The basic models that let a reader distinguish the positional sky, the zodiacal reference system, the seven-planet framework, day/night sect organization, domicile structure and the schematic Thema Mundi.',
   'historical-system',
   'This is a teaching map of related foundations, not a claim that all authors held one identical cosmology. Source-specific models remain attributable.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('celestial-sphere','sky-model','Positional sky model',10,'Observer-centred geometrical model for celestial directions and reference circles.'),
  ('ecliptic','zodiacal-geometry','Zodiacal geometry',20,'Reference circle for zodiacal longitude.'),
  ('zodiac','zodiacal-geometry','Zodiacal geometry',30,'Twelve-sign division used to organize longitude and astrological relationships.'),
  ('seven-planets','planetary-framework','Planetary framework',40,'The seven traditional moving significators.'),
  ('planetary-order','planetary-framework','Planetary framework',50,'Geocentric sphere order of those seven planets.'),
  ('sect','day-night-organization','Day / night organization',60,'Planetary and chart classification organized around diurnal/nocturnal affiliation.'),
  ('domicile','planet-zodiac-relation','Planet–zodiac relation',70,'Planetary rulership relation connecting the seven planets to the zodiac.'),
  ('thema-mundi','model-chart','Model chart',80,'Traditional schematic world chart used to display an idealized domicile configuration.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='cosmological-foundations'
JOIN terms t ON t.slug=m.term_slug;

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('planetary-order','seven-planets','orders','Planetary Order arranges the seven traditional planets in the inherited geocentric sphere sequence.'),
  ('planetary-order','thema-mundi','distinct-from','The geocentric sphere sequence is not the same as the zodiacal domicile sequence in the Thema Mundi.'),
  ('thema-mundi','domicile','models','The Thema Mundi functions as a model of the traditional domicile arrangement.'),
  ('domicile','seven-planets','relates-to-zodiac','Domicile doctrine assigns zodiacal houses to the seven traditional planets.'),
  ('sect','seven-planets','classifies','Sect organizes the traditional planets by diurnal/nocturnal affiliation, with Mercury variable by condition.'),
  ('zodiac','ecliptic','divides-reference-circle','The zodiac divides longitude along the ecliptic into twelve equal signs in the tropical framework represented by the core encyclopedia.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
