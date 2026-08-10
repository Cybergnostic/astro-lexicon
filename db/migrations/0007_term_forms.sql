PRAGMA foreign_keys = ON;

-- Historical/original-language terminology layer.
--
-- Aliases remain lightweight navigation/search synonyms. These tables preserve
-- source-sensitive historical forms without implying that every attested rendering
-- is a canonical synonym of the English headword.

CREATE TABLE term_forms (
  id INTEGER PRIMARY KEY,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  language_code TEXT NOT NULL,
  script TEXT,
  form TEXT NOT NULL,
  lemma TEXT,
  transliteration TEXT,
  literal_gloss TEXT,
  form_type TEXT NOT NULL DEFAULT 'lemma' CHECK(form_type IN ('lemma','inflected','phrase','name')),
  ambiguity_note TEXT,
  editorial_note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  UNIQUE(term_id, language_code, form, form_type)
);

CREATE INDEX idx_term_forms_term ON term_forms(term_id);
CREATE INDEX idx_term_forms_language ON term_forms(language_code, form);

CREATE TABLE term_form_renderings (
  id INTEGER PRIMARY KEY,
  term_form_id INTEGER NOT NULL REFERENCES term_forms(id) ON DELETE CASCADE,
  rendering TEXT NOT NULL,
  rendering_type TEXT NOT NULL DEFAULT 'translation' CHECK(rendering_type IN ('preferred','translation','variant','literal','false-friend')),
  scope_note TEXT,
  UNIQUE(term_form_id, rendering, rendering_type)
);

CREATE INDEX idx_term_form_renderings_form ON term_form_renderings(term_form_id);

CREATE TABLE term_form_attestations (
  id INTEGER PRIMARY KEY,
  term_form_id INTEGER NOT NULL REFERENCES term_forms(id) ON DELETE CASCADE,
  work_id INTEGER REFERENCES works(id) ON DELETE SET NULL,
  source_passage_id INTEGER REFERENCES source_passages(id) ON DELETE SET NULL,
  source_kind TEXT NOT NULL DEFAULT 'historical' CHECK(source_kind IN ('historical','scholarship','reference')),
  tradition_scope TEXT,
  external_source_label TEXT,
  external_source_url TEXT,
  source_note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  CHECK(work_id IS NOT NULL OR source_passage_id IS NOT NULL OR external_source_label IS NOT NULL)
);

CREATE INDEX idx_term_form_attestations_form ON term_form_attestations(term_form_id);
CREATE INDEX idx_term_form_attestations_work ON term_form_attestations(work_id);
