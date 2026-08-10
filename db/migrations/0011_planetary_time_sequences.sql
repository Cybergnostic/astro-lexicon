PRAGMA foreign_keys = ON;

-- Named historical sequences used by planetary-hour / planetary-day doctrine.
--
-- This is deliberately separate from planetary_order. A time-ruler sequence can be
-- derived from or related to a cosmological order without being the same ordered list.
-- Source identity remains explicit so later traditions can be added without silently
-- overwriting Lilly's scheme.

CREATE TABLE planetary_time_sequences (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  sequence_kind TEXT NOT NULL CHECK(sequence_kind IN ('hour-cycle','weekday-cycle')),
  work_id INTEGER REFERENCES works(id),
  edition_id INTEGER REFERENCES editions(id),
  notes TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published'))
);

CREATE TABLE planetary_time_sequence_steps (
  id INTEGER PRIMARY KEY,
  sequence_id INTEGER NOT NULL REFERENCES planetary_time_sequences(id) ON DELETE CASCADE,
  sequence_no INTEGER NOT NULL,
  step_key TEXT NOT NULL,
  step_label TEXT NOT NULL,
  planet_term_id INTEGER NOT NULL REFERENCES terms(id),
  note TEXT,
  UNIQUE(sequence_id,sequence_no),
  UNIQUE(sequence_id,step_key)
);

CREATE TABLE term_planetary_time_sequences (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  sequence_id INTEGER NOT NULL REFERENCES planetary_time_sequences(id) ON DELETE CASCADE,
  relation_role TEXT NOT NULL DEFAULT 'reference',
  note TEXT,
  UNIQUE(term_id,sequence_id,relation_role)
);

CREATE INDEX idx_planetary_time_steps_sequence ON planetary_time_sequence_steps(sequence_id,sequence_no);
CREATE INDEX idx_term_planetary_time_sequences_term ON term_planetary_time_sequences(term_id);
