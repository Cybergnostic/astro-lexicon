PRAGMA foreign_keys = ON;

-- Bird's-eye planet-family reference layer.
--
-- This table stores stable, cross-page profile data that would otherwise be repeated in
-- seven hand-written article tables. Historical disagreements still belong in individual
-- interpretations/source accounts; this is the reviewed canonical comparison layer.

CREATE TABLE planetary_profiles (
  planet_term_id INTEGER PRIMARY KEY REFERENCES terms(id) ON DELETE CASCADE,
  astronomical_class TEXT NOT NULL CHECK(astronomical_class IN ('star','natural-satellite','terrestrial-planet','gas-giant')),
  solar_orbit_relation TEXT NOT NULL CHECK(solar_orbit_relation IN ('reference-body','earth-satellite','interior-to-earth','exterior-to-earth')),
  traditional_family TEXT NOT NULL CHECK(traditional_family IN ('luminary','inferior-planet','superior-planet')),
  sect_affiliation TEXT NOT NULL CHECK(sect_affiliation IN ('diurnal','nocturnal','conditional')),
  beneficence_class TEXT NOT NULL CHECK(beneficence_class IN ('benefic','malefic','conditional','luminary')),
  temperature_quality TEXT NOT NULL CHECK(temperature_quality IN ('hot','cold','conditional')),
  moisture_quality TEXT NOT NULL CHECK(moisture_quality IN ('dry','moist','conditional')),
  zodiacal_motion TEXT NOT NULL CHECK(zodiacal_motion IN ('direct-only','direct-station-retrograde')),
  solar_phase_family TEXT NOT NULL CHECK(solar_phase_family IN ('solar-reference','lunation','inferior-synodic','superior-synodic')),
  astronomy_note TEXT,
  traditional_note TEXT,
  astronomy_source_label TEXT,
  astronomy_source_url TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published'))
);
