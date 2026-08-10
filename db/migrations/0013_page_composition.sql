PRAGMA foreign_keys = ON;

-- Public article composition is intentionally separate from normalized article content.
-- A stored article section or table is a reusable content object; it does not necessarily
-- deserve a top-level heading on the public page. These tables group existing objects into
-- reader-facing sections without rewriting or denormalizing their factual content.

CREATE TABLE term_page_sections (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  section_key TEXT NOT NULL,
  heading TEXT NOT NULL,
  sort_order INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  UNIQUE(term_id, section_key),
  UNIQUE(term_id, sort_order)
);

CREATE TABLE term_page_blocks (
  id INTEGER PRIMARY KEY,
  page_section_id INTEGER NOT NULL REFERENCES term_page_sections(id) ON DELETE CASCADE,
  source_kind TEXT NOT NULL CHECK(source_kind IN ('article-section','article-table','component')),
  source_key TEXT NOT NULL,
  presentation_role TEXT NOT NULL DEFAULT 'paragraph'
    CHECK(presentation_role IN ('paragraph','subsection','table','inline-component')),
  show_heading INTEGER NOT NULL DEFAULT 1 CHECK(show_heading IN (0,1)),
  sort_order INTEGER NOT NULL,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  editorial_notes TEXT,
  UNIQUE(page_section_id, source_kind, source_key),
  UNIQUE(page_section_id, sort_order)
);

CREATE INDEX idx_term_page_sections_term
  ON term_page_sections(term_id, sort_order);
CREATE INDEX idx_term_page_blocks_section
  ON term_page_blocks(page_section_id, sort_order);
