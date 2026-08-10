PRAGMA foreign_keys = ON;

-- Named sign-to-sign relation systems.
--
-- These relations are not ordinary taxonomic properties of one sign. They describe a
-- geometry between two zodiacal signs, often with source-specific terminology and roles.
-- Keeping them in a pair table avoids duplicating counterpart lists across twelve pages.

CREATE TABLE zodiac_relation_schemes (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  relation_kind TEXT NOT NULL,
  work_id INTEGER REFERENCES works(id),
  edition_id INTEGER REFERENCES editions(id),
  geometry_note TEXT,
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published'))
);

CREATE TABLE zodiac_relation_pairs (
  id INTEGER PRIMARY KEY,
  scheme_id INTEGER NOT NULL REFERENCES zodiac_relation_schemes(id) ON DELETE CASCADE,
  sign_a_term_id INTEGER NOT NULL REFERENCES terms(id),
  sign_b_term_id INTEGER NOT NULL REFERENCES terms(id),
  sign_a_role TEXT,
  sign_b_role TEXT,
  sequence_no INTEGER NOT NULL,
  note TEXT,
  CHECK(sign_a_term_id <> sign_b_term_id),
  UNIQUE(scheme_id,sign_a_term_id,sign_b_term_id),
  UNIQUE(scheme_id,sequence_no)
);

CREATE TABLE term_zodiac_relation_schemes (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  scheme_id INTEGER NOT NULL REFERENCES zodiac_relation_schemes(id) ON DELETE CASCADE,
  relation_role TEXT NOT NULL DEFAULT 'concept',
  note TEXT,
  UNIQUE(term_id,scheme_id,relation_role)
);

CREATE INDEX idx_zodiac_relation_pairs_scheme ON zodiac_relation_pairs(scheme_id,sequence_no);
CREATE INDEX idx_zodiac_relation_pairs_a ON zodiac_relation_pairs(sign_a_term_id);
CREATE INDEX idx_zodiac_relation_pairs_b ON zodiac_relation_pairs(sign_b_term_id);
CREATE INDEX idx_term_zodiac_relation_schemes_term ON term_zodiac_relation_schemes(term_id);
