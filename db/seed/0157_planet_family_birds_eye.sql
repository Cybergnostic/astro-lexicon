-- Bird's-eye encyclopedia review: the seven traditional planets as one family.
--
-- Goals:
-- - replace ontology-like headword definitions with reader-facing definitions;
-- - separate modern astronomical identity from traditional classification;
-- - move repeated family facts into normalized planetary_profiles;
-- - remove the now-duplicated hand-written dignity summary tables;
-- - connect each planet to the source-specific planetary/luminary lot already in corpus.
--
-- Astronomy reference layer: NASA Science solar-system basics. This reference is used
-- only for physical/observational classification, not as a source for astrological doctrine.

PRAGMA foreign_keys = ON;

WITH data(
  slug,astronomical_class,solar_orbit_relation,traditional_family,sect_affiliation,
  beneficence_class,temperature_quality,moisture_quality,zodiacal_motion,solar_phase_family,
  astronomy_note,traditional_note,source_label,source_url
) AS (VALUES
  ('sun','star','reference-body','luminary','diurnal','luminary','hot','dry','direct-only','solar-reference',
   'The Sun is a star. On an astrological page it also serves as the observational reference body for elongation, visibility and the solar phases of the other traditional planets.',
   'Greater luminary and leader of the diurnal sect. Traditional heat/dryness is a historical attributed quality, not a statement about modern stellar physics.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-1/'),
  ('moon','natural-satellite','earth-satellite','luminary','nocturnal','luminary','cold','moist','direct-only','lunation',
   'The Moon is Earth’s natural satellite. Its changing elongation from the Sun produces the familiar lunation and visible lunar phases.',
   'Lesser luminary and leader of the nocturnal sect. The reviewed traditional sources treat its qualities as phase-sensitive.',
   'NASA Science — Moons','https://science.nasa.gov/solar-system/moons/'),
  ('mercury','terrestrial-planet','interior-to-earth','inferior-planet','conditional','conditional','conditional','conditional','direct-station-retrograde','inferior-synodic',
   'Mercury is a rocky planet orbiting closer to the Sun than Earth. From Earth it is therefore an inferior planet and remains comparatively close to the Sun in the sky.',
   'Mercury is deliberately not flattened to a fixed sect, benefic/malefic or elemental-quality label; reviewed traditional sources make several classifications conditional on phase and association.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-2/'),
  ('venus','terrestrial-planet','interior-to-earth','inferior-planet','nocturnal','benefic','cold','moist','direct-station-retrograde','inferior-synodic',
   'Venus is a rocky planet orbiting closer to the Sun than Earth. From Earth it appears as an inferior planet, alternating between morning and evening visibility around its conjunctions.',
   'Lesser benefic of the nocturnal sect in the reviewed traditional sources; its attributed nature is cold and moist in the current canonical comparison layer.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-2/'),
  ('mars','terrestrial-planet','exterior-to-earth','superior-planet','nocturnal','malefic','hot','dry','direct-station-retrograde','superior-synodic',
   'Mars is a rocky planet orbiting farther from the Sun than Earth. From Earth it belongs to the superior planets and its synodic cycle includes stations, retrogradation and opposition.',
   'Lesser malefic of the nocturnal sect in the reviewed traditional sources, with an attributed hot and dry nature.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-2/'),
  ('jupiter','gas-giant','exterior-to-earth','superior-planet','diurnal','benefic','hot','moist','direct-station-retrograde','superior-synodic',
   'Jupiter is a gas giant orbiting farther from the Sun than Earth. From Earth it is a superior planet whose synodic cycle centers observationally on conjunction, stations and opposition.',
   'Greater benefic of the diurnal sect in the reviewed traditional sources, with an attributed moderately hot and moist nature.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-2/'),
  ('saturn','gas-giant','exterior-to-earth','superior-planet','diurnal','malefic','cold','dry','direct-station-retrograde','superior-synodic',
   'Saturn is a gas giant orbiting farther from the Sun than Earth. It is the outermost of the seven bodies visible to and used by the classical naked-eye planetary scheme.',
   'Greater malefic of the diurnal sect in the reviewed traditional sources, with an attributed strongly cold and dry nature.',
   'NASA Science — Basics of Space Flight: The Solar System','https://science.nasa.gov/learn/basics-of-space-flight/chapter1-2/')
)
INSERT OR REPLACE INTO planetary_profiles
  (planet_term_id,astronomical_class,solar_orbit_relation,traditional_family,sect_affiliation,
   beneficence_class,temperature_quality,moisture_quality,zodiacal_motion,solar_phase_family,
   astronomy_note,traditional_note,astronomy_source_label,astronomy_source_url,status)
SELECT t.id,d.astronomical_class,d.solar_orbit_relation,d.traditional_family,d.sect_affiliation,
       d.beneficence_class,d.temperature_quality,d.moisture_quality,d.zodiacal_motion,d.solar_phase_family,
       d.astronomy_note,d.traditional_note,d.source_label,d.source_url,'reviewed'
FROM data d JOIN terms t ON t.slug=d.slug;

UPDATE terms SET short_definition=CASE slug
  WHEN 'sun' THEN 'The Sun is our star and the greater luminary of the traditional seven-planet scheme; it leads the diurnal sect and supplies the reference body for planetary solar phase and visibility.'
  WHEN 'moon' THEN 'The Moon is Earth’s natural satellite and the lesser luminary of the traditional seven-planet scheme; it leads the nocturnal sect and is read through its rapidly changing phase and motion.'
  WHEN 'mercury' THEN 'Mercury is the innermost rocky planet and an inferior planet in Earth-based observational geometry; traditional astrology treats its sect, qualitative expression and benefic or malefic tendency as unusually conditional.'
  WHEN 'venus' THEN 'Venus is a rocky inferior planet seen alternately as a morning or evening star; in the reviewed traditional scheme it is the nocturnal lesser benefic with an attributed cold and moist nature.'
  WHEN 'mars' THEN 'Mars is a rocky superior planet whose apparent cycle includes opposition and retrogradation; in the reviewed traditional scheme it is the nocturnal lesser malefic with an attributed hot and dry nature.'
  WHEN 'jupiter' THEN 'Jupiter is a gas-giant superior planet; in the reviewed traditional scheme it is the diurnal greater benefic with an attributed moderately hot and moist nature.'
  WHEN 'saturn' THEN 'Saturn is a gas-giant superior planet and the outermost body of the traditional naked-eye planetary order; in the reviewed traditional scheme it is the diurnal greater malefic with an attributed cold and dry nature.'
END,
editorial_notes='Bird’s-eye planet-family review: definition now separates physical identity from traditional classification; detailed historical claims remain in source accounts.'
WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

WITH sections(slug,body) AS (VALUES
  ('sun','Physically, the Sun is a star and the central body of the solar system. Traditional astrology is organized observationally from Earth, so the same page also has to explain the Sun as the moving zodiacal luminary seen from Earth and as the reference body for visibility conditions such as conjunction, under-the-beams states and planetary morning/evening appearances. Modern physical identity and traditional geocentric observation answer different questions and should not be confused.'),
  ('moon','Physically, the Moon is Earth’s natural satellite. Observationally, its angular relationship with the Sun produces the lunation: conjunction, waxing phases, opposition, waning phases and return to conjunction. Traditional lunar doctrine depends heavily on this changing relation, so physical identity, visible phase and astrological condition belong on the same reference page but remain distinct layers.'),
  ('mercury','Mercury is a rocky planet whose orbit lies inside Earth’s orbit. In Earth-based observational language it is therefore an inferior planet: it remains near the Sun, alternates between morning and evening visibility, reaches greatest elongations, and passes through conjunctions, stations and retrograde loops. These mechanics explain why solar phase and motion occupy unusually large parts of Mercury’s traditional condition.'),
  ('venus','Venus is a rocky planet whose orbit lies inside Earth’s orbit. In Earth-based observational language it is an inferior planet, so its appearances alternate between morning-star and evening-star phases around inferior and superior conjunction. Its stations and retrograde loop belong to that same solar cycle rather than forming an unrelated doctrine.'),
  ('mars','Mars is a rocky planet whose orbit lies outside Earth’s orbit. In Earth-based observational language it is a superior planet: conjunction with the Sun is followed by emergence, a first station, retrogradation through opposition, a second station and eventual return toward conjunction. The structured cycle below presents this as an observational sequence rather than a list of disconnected conditions.'),
  ('jupiter','Jupiter is a gas giant whose orbit lies outside Earth’s orbit. In Earth-based observational language it is a superior planet, so conjunction, heliacal emergence, stations, retrogradation and opposition belong to one repeating solar cycle. The structured cycle below keeps those phases connected.'),
  ('saturn','Saturn is a gas giant whose orbit lies outside Earth’s orbit and is the outermost member of the traditional seven-planet naked-eye order. In Earth-based observational language it is a superior planet, so conjunction, emergence, stations, retrogradation and opposition form one repeating solar cycle.')
)
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT t.id,'astronomical-identity','Astronomical identity and observational geometry',s.body,5,'reviewed',
       'Physical classification checked against NASA Science; geocentric wording describes observational geometry, not a physical geocentric cosmology.'
FROM sections s JOIN terms t ON t.slug=s.slug;

-- The old dignity paragraphs listed values that are now canonical structured rows. Keep
-- only the teaching explanation here and let DignityConnections render the actual data.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'dignities','Dignity network',
       'A planet can participate in several dignity layers at once: domicile and exaltation operate at sign scale, triplicity adds sect-sensitive rulership, and terms/bounds and faces divide the sign by degree. The reference section below is generated from the normalized dignity tables, including explicitly named historical term schemes, so the article does not duplicate or silently flatten those assignments.',30,'reviewed',
       'Bird’s-eye cleanup: actual assignments now come exclusively from normalized reference data.'
FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn');

-- Superseded by normalized planetary_profiles plus normalized DignityConnections.
DELETE FROM term_article_tables
WHERE table_key='planet-summary'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('sun','moon','mercury','venus','mars','jupiter','saturn'));

-- Surface already-reviewed planetary-lot material on the corresponding planet pages.
WITH rel(planet_slug,lot_slug,note) AS (VALUES
  ('saturn','lot-of-heavy-saturn','Abū Maʿshar’s source-specific Saturnian lot; keep distinct from other Saturn-associated lots unless formula identity is demonstrated.'),
  ('jupiter','lot-of-jupiter-prosperity-assistance','Abū Maʿshar’s source-specific Jupiter lot of prosperity and assistance.'),
  ('mars','lot-of-mars-courage','Abū Maʿshar’s source-specific Mars lot associated with courage and boldness.'),
  ('venus','lot-of-venus-love-intimacy','Abū Maʿshar’s source-specific Venus lot of love and intimacy; it is not silently equated with the Hermetic/Pauline Eros lot.'),
  ('mercury','lot-of-mercury-means','Abū Maʿshar’s source-specific Mercury lot whose transmitted meaning includes means and lack of means.'),
  ('moon','lot-of-fortune','Fortune is the lunar side of the reviewed reverse-luminary lot pair; other traditions can frame or name the luminary lots differently.'),
  ('sun','lot-of-absence','Abū Maʿshar’s reviewed reverse-luminary counterpart to Fortune is the solar side of this formula pair; naming varies across traditions.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT p.id,l.id,'associated-planetary-lot',r.note,'reviewed'
FROM rel r
JOIN terms p ON p.slug=r.planet_slug
JOIN terms l ON l.slug=r.lot_slug;
