PRAGMA foreign_keys = ON;

CREATE TABLE authors (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  name TEXT NOT NULL,
  original_name TEXT,
  birth_year INTEGER,
  death_year INTEGER,
  historical_layer TEXT,
  notes TEXT
);

CREATE TABLE works (
  id INTEGER PRIMARY KEY,
  author_id INTEGER NOT NULL REFERENCES authors(id),
  slug TEXT NOT NULL UNIQUE,
  title TEXT NOT NULL,
  original_title TEXT,
  composition_year_start INTEGER,
  composition_year_end INTEGER,
  language TEXT,
  notes TEXT
);

CREATE TABLE editions (
  id INTEGER PRIMARY KEY,
  work_id INTEGER NOT NULL REFERENCES works(id),
  label TEXT NOT NULL,
  translator TEXT,
  editor TEXT,
  publisher TEXT,
  publication_year INTEGER,
  publication_place TEXT,
  isbn TEXT,
  source_language TEXT,
  target_language TEXT,
  copyright_note TEXT,
  local_source_key TEXT,
  UNIQUE(work_id, label)
);

CREATE TABLE terms (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  short_definition TEXT,
  category TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE aliases (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  label TEXT NOT NULL,
  language TEXT,
  alias_type TEXT NOT NULL,
  scope_note TEXT,
  UNIQUE(term_id, label, alias_type)
);

CREATE TABLE source_passages (
  id INTEGER PRIMARY KEY,
  edition_id INTEGER NOT NULL REFERENCES editions(id),
  page_start TEXT,
  page_end TEXT,
  book TEXT,
  tractate TEXT,
  chapter TEXT,
  section TEXT,
  locator_text TEXT,
  quote TEXT,
  internal_notes TEXT
);

CREATE TABLE interpretations (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  work_id INTEGER NOT NULL REFERENCES works(id),
  summary TEXT NOT NULL,
  scope TEXT,
  certainty TEXT NOT NULL DEFAULT 'direct' CHECK(certainty IN ('direct','close_paraphrase','editorial_inference','secondary')),
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  UNIQUE(term_id, work_id, summary)
);

CREATE TABLE citations (
  id INTEGER PRIMARY KEY,
  interpretation_id INTEGER NOT NULL REFERENCES interpretations(id) ON DELETE CASCADE,
  source_passage_id INTEGER NOT NULL REFERENCES source_passages(id) ON DELETE CASCADE,
  citation_role TEXT NOT NULL DEFAULT 'support',
  UNIQUE(interpretation_id, source_passage_id, citation_role)
);

CREATE TABLE term_relations (
  id INTEGER PRIMARY KEY,
  subject_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  object_term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  relation_type TEXT NOT NULL,
  note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  CHECK(subject_term_id <> object_term_id),
  UNIQUE(subject_term_id, object_term_id, relation_type)
);

CREATE INDEX idx_aliases_label ON aliases(label);
CREATE INDEX idx_interpretations_term ON interpretations(term_id);
CREATE INDEX idx_source_passages_edition ON source_passages(edition_id);
CREATE INDEX idx_term_relations_subject ON term_relations(subject_term_id);
CREATE INDEX idx_term_relations_object ON term_relations(object_term_id);
