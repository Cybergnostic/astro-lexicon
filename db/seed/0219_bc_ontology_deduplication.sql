-- B/C ontology sanity sweep: remove late duplicate identities that survived the
-- source-based reconciliation passes.
--
-- These are canonical-identity repairs, not article expansion. The historical/source-
-- backed entries already carry the stronger evidence and reader-facing explanation.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ALMUGUEA: normalize the curriculum spelling identity onto the reconciled concept.
-- -----------------------------------------------------------------------------
-- `almugea` was introduced from the private-curriculum coverage pass before the later
-- historical reconciliation established `almuguea` as the canonical identity shared by
-- Antiochus' Proper Face and Bonatti's Almuguea. Preserve useful spellings as aliases,
-- then remove the redundant public headword and its generic article.

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Almugea','English/Latinized','spelling-variant',
       'Earlier curriculum spelling normalized to the source-reconciled Almuguea / Proper Face identity.'
FROM terms WHERE slug='almuguea';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Almugia','English/Latinized','spelling-variant',
       'Historical/transliteration spelling preserved from the earlier curriculum entry; use Almuguea as the canonical headword.'
FROM terms WHERE slug='almuguea';

DELETE FROM terms WHERE slug='almugea';

-- -----------------------------------------------------------------------------
-- DORYPHORY: normalize the generic duplicate onto Spear-bearing / Doruphoria.
-- -----------------------------------------------------------------------------
-- The source reconciliation already treats Doruphoria as the scholarly name for the
-- spear-bearing configuration and preserves medieval Dasturiya as a related but not
-- invariantly equivalent tradition. A separate generic `doryphory` headword therefore
-- duplicates the canonical `spear-bearing` identity.

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Doryphory','English scholarly form','spelling-variant',
       'English scholarly spelling of Doruphoria; normalized to Spear-bearing / Doruphoria.'
FROM terms WHERE slug='spear-bearing';

DELETE FROM terms WHERE slug='doryphory';
