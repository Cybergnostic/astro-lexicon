-- Foundational taxonomy terms discovered in the general traditional-astrology curriculum.
-- These are basic lexicon concepts, not analytical workflows.

-- -----------------------------------------------------------------------------
-- ZODIAC TYPES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('tropical-zodiac','Tropical Zodiac',
   'A zodiac referenced to the equinoxes and solstices, with 0° Aries defined by the vernal equinox rather than by a fixed stellar reference.',
   'zodiac','reviewed',NULL,'technical',5),
  ('sidereal-zodiac','Sidereal Zodiac',
   'A zodiac referenced to a stellar framework, typically offset from the tropical zodiac by an ayanamsa or comparable precessional correction.',
   'zodiac','reviewed','Exact ayanamsa systems are separate variants and should not be collapsed into the definition.','technical',5),
  ('draconic-zodiac','Draconic Zodiac',
   'A zodiacal coordinate system that places the Moon''s ascending node at 0° Aries and measures positions relative to that nodal reference.',
   'zodiac','reviewed','Basic coordinate-system definition only; interpretive uses vary by tradition.','technical',4);

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A form of zodiacal reference system.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='tropical-zodiac' AND b.slug='zodiac';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A form of zodiacal reference system.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='sidereal-zodiac' AND b.slug='zodiac';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A form of zodiacal reference system.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='draconic-zodiac' AND b.slug='zodiac';

-- -----------------------------------------------------------------------------
-- MELOTHESIA
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('melothesia','Melothesia',
   'The traditional correspondence of zodiacal signs, planets or other astrological factors with regions and parts of the human body.',
   'medical-astrology','reviewed','Historical astrological doctrine; not a medical diagnosis system.','technical',5);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Zodiacal Melothesia','English','expanded-form','Specifically the sign-to-body correspondence.' FROM terms WHERE slug='melothesia';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Melothesia is the traditional mapping of astrological factors onto the body. In its familiar zodiacal form, the sequence runs from the head under Aries through successive bodily regions to the feet under Pisces. Historical planetary and other melothesias also exist and should be documented separately rather than treated as one universal table.','reviewed','Historical terminology only; no medical claims implied.' FROM terms WHERE slug='melothesia';

-- -----------------------------------------------------------------------------
-- MAJOR BRANCHES OF ASTROLOGY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('mundane-astrology','Mundane Astrology',
   'The branch of astrology concerned with collective affairs such as states, rulers, wars, weather, public events and historical cycles.',
   'astrology-branches','reviewed',NULL,'concept',5),
  ('natal-astrology','Natal Astrology',
   'The branch of astrology concerned with a nativity or birth chart and the life of the native.',
   'astrology-branches','reviewed',NULL,'concept',5),
  ('horary-astrology','Horary Astrology',
   'The branch of astrology in which a chart is erected for the time a specific question is received or understood and judged from that chart.',
   'astrology-branches','reviewed',NULL,'concept',5),
  ('electional-astrology','Electional Astrology',
   'The branch of astrology concerned with choosing an auspicious or suitable time to begin an action.',
   'astrology-branches','reviewed',NULL,'concept',5),
  ('predictive-astrology','Predictive Astrology',
   'A broad category for techniques used to time or describe developments through cycles, directions, profections, returns and related methods.',
   'astrology-branches','reviewed','Broad taxonomy term; individual techniques have their own entries.','concept',4),
  ('medical-astrology','Medical Astrology',
   'The historical branch of astrology concerned with bodily condition, illness, temperament and medical timing within premodern astrological medicine.',
   'astrology-branches','reviewed','Historical branch definition only; not medical advice or modern diagnosis.','concept',4),
  ('astrometeorology','Astrometeorology',
   'The branch of mundane astrology concerned with weather and atmospheric conditions through astrological cycles and configurations.',
   'astrology-branches','reviewed',NULL,'concept',4);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Election Astrology','English','name-variant','Common name variant.' FROM terms WHERE slug='electional-astrology';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Judicial Astrology','English','historical-broader-term','Historical umbrella term sometimes used for interpretive branches; requires contextual use.' FROM terms WHERE slug='predictive-astrology';

-- -----------------------------------------------------------------------------
-- HOROSCOPE / CHART TYPE VOCABULARY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('nativity','Nativity',
   'A horoscope or chart erected for a birth; in traditional literature the term can refer both to the chart and to the birth it represents.',
   'chart-types','reviewed',NULL,'technical',5),
  ('election','Election',
   'A chart or chosen moment selected in electional astrology for beginning a planned action.',
   'chart-types','reviewed',NULL,'technical',4),
  ('revolution-chart','Revolution Chart',
   'A return chart erected for the recurrence of a celestial body to a reference position, especially solar and lunar revolutions.',
   'chart-types','reviewed','Umbrella term; solar and lunar returns have separate entries.','technical',4),
  ('katarchic-astrology','Katarchic Astrology',
   'A historical category of astrology concerned with beginnings, initiatives and event charts, closely related to electional and interrogational practice.',
   'astrology-branches','provisional','Terminological scope varies across ancient and modern scholarship; direct historical-source expansion recommended.','concept',3);
