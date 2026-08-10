PRAGMA foreign_keys = ON;

-- Generic bird's-eye family layer.
--
-- Pairwise term_relations answer how two concepts are connected. This layer answers a
-- different editorial question: which concepts belong to one coherent teaching family,
-- what role each member plays inside that family, and in what order a reader should see
-- the family overview. It is reusable for aspect mechanics, houses, lots, prediction and
-- later bird's-eye review blocks.

CREATE TABLE concept_families (
  id INTEGER PRIMARY KEY,
  slug TEXT NOT NULL UNIQUE,
  label TEXT NOT NULL,
  description TEXT NOT NULL,
  family_type TEXT NOT NULL DEFAULT 'doctrine' CHECK(family_type IN ('doctrine','taxonomy','mechanics','historical-system','reference')),
  editorial_note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published'))
);

CREATE TABLE concept_family_members (
  id INTEGER PRIMARY KEY,
  family_id INTEGER NOT NULL REFERENCES concept_families(id) ON DELETE CASCADE,
  term_id INTEGER NOT NULL REFERENCES terms(id) ON DELETE CASCADE,
  role_key TEXT NOT NULL,
  role_label TEXT NOT NULL,
  sequence_no INTEGER NOT NULL,
  note TEXT,
  status TEXT NOT NULL DEFAULT 'draft' CHECK(status IN ('draft','reviewed','published')),
  UNIQUE(family_id,term_id,role_key)
);

CREATE INDEX idx_concept_family_members_family ON concept_family_members(family_id,sequence_no);
CREATE INDEX idx_concept_family_members_term ON concept_family_members(term_id);
