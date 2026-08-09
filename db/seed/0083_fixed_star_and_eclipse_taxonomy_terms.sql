-- Fixed-star and eclipse taxonomy gap pass.
-- Adds standalone terminology only; named-star delineations and mundane/natal
-- judgment workflows remain source-level material rather than canonical method.

-- -----------------------------------------------------------------------------
-- FIXED-STAR TECHNICAL VOCABULARY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('fixed-star','Fixed Star',
   'A star treated in traditional astrology as part of the apparently fixed stellar sphere, distinguished from the wandering stars or planets.',
   'fixed stars','reviewed','Apparent fixedness is relative; precession changes tropical longitudes over long periods.','astronomical',5),
  ('stellar-magnitude','Stellar Magnitude',
   'A scale describing the apparent brightness of a star, with numerically lower magnitudes corresponding to brighter objects.',
   'fixed stars','reviewed','Astronomical quantity used by astrological sources when prioritizing stars; interpretive importance is a separate historical question.','astronomical',5),
  ('fixed-star-nature','Planetary Nature of a Fixed Star',
   'A traditional classification that describes a fixed star by analogy with the nature of one or more planets.',
   'fixed stars','reviewed','Planetary-nature assignments vary among authorities and belong in source-specific evidence where they disagree.','technical',4),
  ('star-cluster','Star Cluster',
   'A recognizable group of stars treated collectively, whether astronomically associated or traditionally perceived as a coherent stellar group.',
   'fixed stars','reviewed','Examples in astrological literature include the Pleiades and Hyades; individual traditions may treat clusters differently from isolated stars.','astronomical',4),
  ('ecliptic-projection','Ecliptic Projection',
   'The representation of a celestial object’s position by projecting it onto the ecliptic, allowing comparison by zodiacal longitude.',
   'celestial coordinates','reviewed','A conjunction in projected longitude is not necessarily a true spatial occultation because latitude and declination can differ.','astronomical',5),
  ('fixed-star-orb','Fixed-star Orb',
   'The angular allowance within which an astrologer treats a planet, angle or other point as conjunct a fixed star.',
   'fixed stars','provisional','Historical and modern practitioners use different allowances; no single curriculum-specific orb is made canonical here.','technical',3);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Magnitude','English','short-form','When context makes clear that stellar brightness is meant.' FROM terms WHERE slug='stellar-magnitude';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Star Nature','English','short-form','Traditional planetary analogy assigned to a fixed star.' FROM terms WHERE slug='fixed-star-nature';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Projected Longitude','English','related-form','Longitude obtained by projection to the ecliptic.' FROM terms WHERE slug='ecliptic-projection';

-- -----------------------------------------------------------------------------
-- ECLIPSE / OCCULTATION VOCABULARY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('eclipse','Eclipse',
   'An astronomical obscuration involving the luminaries, in which the Sun or Moon is partially or wholly darkened because of the alignment of the Sun, Earth and Moon near the lunar nodes.',
   'eclipses','reviewed','Keep astronomical definition distinct from historical astrological interpretation.','astronomical',5),
  ('solar-eclipse','Solar Eclipse',
   'An eclipse occurring when the Moon passes between Earth and the Sun and obscures the Sun for observers within the relevant visibility region.',
   'eclipses','reviewed',NULL,'astronomical',5),
  ('lunar-eclipse','Lunar Eclipse',
   'An eclipse occurring when the Moon passes through Earth’s shadow at or near full moon.',
   'eclipses','reviewed',NULL,'astronomical',5),
  ('total-eclipse','Total Eclipse',
   'An eclipse in which the eclipsed luminary is completely obscured for the relevant observer or geometric phase.',
   'eclipses','reviewed','Umbrella subtype applying to both solar and lunar eclipses in different geometries.','astronomical',4),
  ('partial-eclipse','Partial Eclipse',
   'An eclipse in which only part of the apparent disk of the eclipsed luminary is obscured.',
   'eclipses','reviewed',NULL,'astronomical',4),
  ('annular-eclipse','Annular Solar Eclipse',
   'A solar eclipse in which the apparent disk of the Moon is too small to cover the Sun completely, leaving a bright ring around it.',
   'eclipses','reviewed',NULL,'astronomical',5),
  ('occultation','Occultation',
   'An astronomical event in which one celestial body passes in front of and hides another from the observer.',
   'celestial phenomena','reviewed','A true occultation is geometrically stronger than mere equality of projected zodiacal longitude; astrological interpretation remains source-specific.','astronomical',5),
  ('eclipse-path','Path of Eclipse',
   'The geographic track or region on Earth from which a solar eclipse, especially totality or annularity, is visible.',
   'eclipses','reviewed','Astronomical/geographic term; mundane interpretations of visibility belong in historical-source accounts.','astronomical',4);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Solar Occultation','English','descriptive-variant','Occasionally used descriptively for the Moon obscuring the Sun; solar eclipse is the canonical label.' FROM terms WHERE slug='solar-eclipse';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Annular Eclipse','English','short-form','Usually refers to an annular solar eclipse.' FROM terms WHERE slug='annular-eclipse';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Solar eclipses are a class of eclipse.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='solar-eclipse' AND b.slug='eclipse';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Lunar eclipses are a class of eclipse.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='lunar-eclipse' AND b.slug='eclipse';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Annularity is a subtype of solar eclipse.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='annular-eclipse' AND b.slug='solar-eclipse';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Occultation is a geometric event, not merely an astrological synonym for conjunction. Two objects can share nearly the same zodiacal longitude while remaining separated in latitude or declination; an occultation requires one apparent disk or body actually to pass in front of the other from the observer’s line of sight.',
       'reviewed','Original explanatory synthesis; source-specific astrological significance belongs in historical interpretations.'
FROM terms WHERE slug='occultation';
