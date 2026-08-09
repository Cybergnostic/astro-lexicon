PRAGMA foreign_keys = ON;

-- Structured reader-facing tables for encyclopedia articles.
-- Keep tabular presentation separate from prose sections so data that is naturally
-- comparative (dignities, formula variants, classifications, house groupings, etc.)
-- does not have to be encoded as long paragraphs.
CREATE TABLE term_article_tables (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  table_key TEXT NOT NULL,
  heading TEXT NOT NULL,
  caption TEXT,
  columns_json TEXT NOT NULL,
  rows_json TEXT NOT NULL,
  sort_order INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  UNIQUE(term_id, table_key),
  UNIQUE(term_id, sort_order)
);

CREATE INDEX idx_term_article_tables_term
  ON term_article_tables(term_id, sort_order);
