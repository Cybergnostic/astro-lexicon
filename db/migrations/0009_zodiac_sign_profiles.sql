PRAGMA foreign_keys = ON;

-- Bird's-eye zodiac-family reference layer.
--
-- Stable sign-family facts belong here rather than being repeated in twelve article
-- paragraphs. The foreign keys point back to canonical classification terms so element,
-- modality, polarity, and day/night sign class remain one connected ontology.

CREATE TABLE zodiac_sign_profiles (
  sign_term_id INTEGER PRIMARY KEY REFERENCES terms(id) ON DELETE CASCADE,
  ordinal INTEGER NOT NULL UNIQUE CHECK(ordinal BETWEEN 1 AND 12),
  longitude_start REAL NOT NULL CHECK(longitude_start >= 0 AND longitude_start < 360),
  longitude_end REAL NOT NULL CHECK(longitude_end > 0 AND longitude_end <= 360),
  element_term_id INTEGER NOT NULL REFERENCES terms(id),
  modality_term_id INTEGER NOT NULL REFERENCES terms(id),
  polarity_term_id INTEGER NOT NULL REFERENCES terms(id),
  day_night_term_id INTEGER NOT NULL REFERENCES terms(id),
  quarter_anchor TEXT NOT NULL CHECK(quarter_anchor IN ('march-equinox','june-solstice','september-equinox','december-solstice')),
  quarter_position TEXT NOT NULL CHECK(quarter_position IN ('beginning','middle','closing')),
  solar_declination_half TEXT NOT NULL CHECK(solar_declination_half IN ('north','south')),
  geometry_note TEXT,
  tradition_note TEXT,
  astronomy_source_label TEXT,
  astronomy_source_url TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  CHECK(longitude_end - longitude_start = 30)
);

CREATE INDEX idx_zodiac_sign_profiles_element ON zodiac_sign_profiles(element_term_id);
CREATE INDEX idx_zodiac_sign_profiles_modality ON zodiac_sign_profiles(modality_term_id);
