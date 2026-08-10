PRAGMA foreign_keys = ON;

-- Bird's-eye encyclopedia reference layer.
--
-- The existing ontology is intentionally term/source-centric.  These tables model
-- repeated astrological reference systems once, so the same canonical data can feed
-- overview articles, planet pages, sign pages, diagrams, APIs and future tools without
-- copying values into hand-written article tables.

CREATE TABLE reference_schemes (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  domain TEXT NOT NULL,
  work_id INTEGER REFERENCES works(id),
  edition_id INTEGER REFERENCES editions(id),
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  notes TEXT
);

CREATE TABLE zodiac_reference_assignments (
  id INTEGER PRIMARY KEY,
  scheme_id INTEGER NOT NULL REFERENCES reference_schemes(id) ON DELETE CASCADE,
  sign_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  planet_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  assignment_type TEXT NOT NULL CHECK(assignment_type IN (
    'domicile','exaltation','triplicity','term','face','detriment','fall'
  )),
  sect_condition TEXT NOT NULL DEFAULT 'any' CHECK(sect_condition IN ('any','day','night')),
  degree_start REAL NOT NULL DEFAULT 0 CHECK(degree_start >= 0 AND degree_start < 30),
  degree_end REAL NOT NULL DEFAULT 30 CHECK(degree_end > 0 AND degree_end <= 30),
  exact_degree_number INTEGER CHECK(exact_degree_number BETWEEN 1 AND 30),
  sequence_no INTEGER,
  note TEXT,
  CHECK(degree_end > degree_start),
  UNIQUE(
    scheme_id, sign_term_id, planet_term_id, assignment_type,
    sect_condition, degree_start, degree_end
  )
);

CREATE INDEX idx_zodiac_reference_scheme
  ON zodiac_reference_assignments(scheme_id, assignment_type);
CREATE INDEX idx_zodiac_reference_sign
  ON zodiac_reference_assignments(sign_term_id, assignment_type);
CREATE INDEX idx_zodiac_reference_planet
  ON zodiac_reference_assignments(planet_term_id, assignment_type);

CREATE TABLE planetary_cycles (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  planet_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  reference_body_term_id INTEGER REFERENCES terms(id) ON DELETE SET NULL,
  cycle_type TEXT NOT NULL,
  mean_period_days REAL,
  period_note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  notes TEXT
);

CREATE TABLE planetary_cycle_phases (
  id INTEGER PRIMARY KEY,
  cycle_id INTEGER NOT NULL REFERENCES planetary_cycles(id) ON DELETE CASCADE,
  phase_key TEXT NOT NULL,
  label TEXT NOT NULL,
  sequence_no INTEGER NOT NULL,
  geometric_condition TEXT,
  visibility_condition TEXT,
  motion_condition TEXT,
  notes TEXT,
  UNIQUE(cycle_id, phase_key),
  UNIQUE(cycle_id, sequence_no)
);

CREATE INDEX idx_planetary_cycles_planet ON planetary_cycles(planet_term_id);
CREATE INDEX idx_planetary_cycle_phases_cycle ON planetary_cycle_phases(cycle_id, sequence_no);

CREATE TABLE term_symbols (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  symbol_system TEXT NOT NULL DEFAULT 'astrological',
  symbol_text TEXT NOT NULL,
  label TEXT,
  is_primary INTEGER NOT NULL DEFAULT 0 CHECK(is_primary IN (0,1)),
  notes TEXT,
  UNIQUE(term_id, symbol_system, symbol_text)
);

CREATE INDEX idx_term_symbols_term ON term_symbols(term_id);

CREATE TABLE term_media (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  media_key TEXT NOT NULL,
  media_type TEXT NOT NULL CHECK(media_type IN ('svg','image','diagram')),
  asset_path TEXT NOT NULL,
  alt_text TEXT NOT NULL,
  caption TEXT,
  credit TEXT,
  license_note TEXT,
  source_url TEXT,
  sort_order INTEGER NOT NULL DEFAULT 0,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  UNIQUE(term_id, media_key)
);

CREATE INDEX idx_term_media_term ON term_media(term_id, sort_order);
