PRAGMA foreign_keys = ON;

-- Explanatory teaching content is kept separate from canonical definitions and
-- source-specific historical interpretations. This lets the frontend teach a
-- concept without duplicating short_definition or flattening source differences.

CREATE TABLE term_articles (
  term_id INTEGER PRIMARY KEY REFERENCES terms(id) ON DELETE CASCADE,
  intro TEXT NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  created_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP,
  updated_at TEXT NOT NULL DEFAULT CURRENT_TIMESTAMP
);

CREATE TABLE term_article_sections (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  section_key TEXT NOT NULL,
  heading TEXT NOT NULL,
  body TEXT NOT NULL,
  sort_order INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  UNIQUE(term_id, section_key),
  UNIQUE(term_id, sort_order)
);

CREATE INDEX idx_term_article_sections_term
  ON term_article_sections(term_id, sort_order);
