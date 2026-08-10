-- B/C ontology sanity sweep: normalize duplicate First/Second Motion identities onto
-- the source-backed First/Second Movement entries.
--
-- `first-movement` and `second-movement` carry the direct al-Biruni astronomical evidence,
-- Bonatti corroboration, concept-family placement and reader-facing articles. The older
-- `first-motion` / `second-motion` rows express the same two celestial motions under an
-- alternate English noun. Move any surviving evidence/relations first, preserve the labels
-- as aliases, then remove the redundant public headwords.

PRAGMA foreign_keys = ON;

-- Preserve the alternate canonical spellings as search/history aliases.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'First Motion','English','translation-variant',
       'Alternate English rendering of the source-backed First Movement; normalized to the canonical celestial-motion entry.'
FROM terms WHERE slug='first-movement';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Second Motion','English','translation-variant',
       'Alternate English rendering of the source-backed Second Movement; normalized to the canonical celestial-motion entry.'
FROM terms WHERE slug='second-movement';

-- Move any source interpretations. Citation rows follow because they reference the
-- interpretation id rather than the term directly.
UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='first-movement')
WHERE term_id=(SELECT id FROM terms WHERE slug='first-motion');

UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='second-movement')
WHERE term_id=(SELECT id FROM terms WHERE slug='second-motion');

-- Preserve aliases attached to the redundant identities, if any.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT (SELECT id FROM terms WHERE slug='first-movement'),label,language,alias_type,scope_note
FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='first-motion');

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT (SELECT id FROM terms WHERE slug='second-movement'),label,language,alias_type,scope_note
FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='second-motion');

-- Rebuild outward relations on the canonical identities, avoiding self-relations and
-- duplicates already represented by the richer astronomy foundation graph.
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT (SELECT id FROM terms WHERE slug='first-movement'),r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
WHERE r.subject_term_id=(SELECT id FROM terms WHERE slug='first-motion')
  AND r.object_term_id<>(SELECT id FROM terms WHERE slug='first-movement');

INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT (SELECT id FROM terms WHERE slug='second-movement'),r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
WHERE r.subject_term_id=(SELECT id FROM terms WHERE slug='second-motion')
  AND r.object_term_id<>(SELECT id FROM terms WHERE slug='second-movement');

-- Rebuild inward relations, again excluding relations that would collapse to self.
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,(SELECT id FROM terms WHERE slug='first-movement'),r.relation_type,r.note,r.status
FROM term_relations r
WHERE r.object_term_id=(SELECT id FROM terms WHERE slug='first-motion')
  AND r.subject_term_id<>(SELECT id FROM terms WHERE slug='first-movement');

INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,(SELECT id FROM terms WHERE slug='second-movement'),r.relation_type,r.note,r.status
FROM term_relations r
WHERE r.object_term_id=(SELECT id FROM terms WHERE slug='second-motion')
  AND r.subject_term_id<>(SELECT id FROM terms WHERE slug='second-movement');

-- Remove the redundant identities only after evidence and navigation have been retained.
DELETE FROM terms WHERE slug IN ('first-motion','second-motion');
