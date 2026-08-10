-- Editorial Baseline v1: canonical dignity-term deduplication.
--
-- Earlier source extraction established `terms` and `face-decan` as source-backed
-- canonical headwords. A later gap pass accidentally introduced duplicate reviewed
-- headwords `bound` and `decan` without source interpretations. Preserve useful aliases
-- and relations, then remove the duplicate canonical records.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- BOUND -> TERMS / BOUNDS
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,
       COALESCE(a.scope_note,'Transferred from the superseded duplicate Bound / Term headword.')
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='bound'
JOIN terms canonical ON canonical.slug='terms';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Bound','English','preferred-modern-variant',
       'Modern singular form of the historical terms/bounds subdivision.'
FROM terms WHERE slug='terms';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='bound'
JOIN terms canonical ON canonical.slug='terms'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='bound'
JOIN terms canonical ON canonical.slug='terms'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='bound'
JOIN terms canonical ON canonical.slug='terms';

-- The duplicate has no reviewed source interpretations in the current corpus. Any
-- residual rows attached to it are extraction-era presentation/navigation artifacts and
-- may be safely removed by ON DELETE CASCADE after the useful links above are migrated.
DELETE FROM terms WHERE slug='bound';

-- -----------------------------------------------------------------------------
-- DECAN -> FACE / DECAN
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,
       COALESCE(a.scope_note,'Transferred from the superseded duplicate Decan / Face headword.')
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='decan'
JOIN terms canonical ON canonical.slug='face-decan';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Decan','English','preferred-modern-variant',
       'Modern singular form of the face/decan subdivision.'
FROM terms WHERE slug='face-decan';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='decan'
JOIN terms canonical ON canonical.slug='face-decan'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='decan'
JOIN terms canonical ON canonical.slug='face-decan'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='decan'
JOIN terms canonical ON canonical.slug='face-decan';

DELETE FROM terms WHERE slug='decan';

-- Broad branches of astrology are contextual encyclopedia entries rather than technical
-- mechanics or astronomical objects. Normalize the legacy `concept` entry type to the
-- existing public `contextual` class instead of inventing a fourth public type.
UPDATE terms
SET entry_type='contextual'
WHERE slug IN (
  'astrometeorology','medical-astrology','predictive-astrology','electional-astrology',
  'horary-astrology','mundane-astrology','natal-astrology'
);
