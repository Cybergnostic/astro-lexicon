-- Editorial Baseline v1: merge duplicate Refrenation/Refranation headwords.
--
-- The initial cross-source extraction established `refranation` with direct Lilly and
-- al-Biruni evidence. A later Lilly-focused expansion accidentally created a second
-- canonical `refrenation` entry for the same retrograde-before-perfection mechanic.
-- Preserve Lilly's spelling as a historical/source form, merge evidence and article data,
-- then remove the duplicate canonical term.

PRAGMA foreign_keys = ON;

UPDATE terms
SET label='Refrenation / Refranation',
    short_definition='An interrupted application in which the applying planet turns retrograde before the intended conjunction or aspect reaches perfection; Lilly spells the term Refrenation, while Refranation also appears in historical translation and later usage.',
    definition_quality=5,
    status='reviewed',
    editorial_notes='Canonical spelling family merged in Editorial Baseline v1. Preserve source spelling in aliases/forms rather than as separate headwords.'
WHERE slug='refranation';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Refrenation','English','historical-spelling','William Lilly’s spelling in Christian Astrology.'
FROM terms WHERE slug='refranation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Refranation','English','translation-variant','Alternative historical/translation spelling of the same mechanic.'
FROM terms WHERE slug='refranation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Refraining','English','translation-variant','Plain-English rendering of the same retrograde withdrawal mechanic.'
FROM terms WHERE slug='refranation';

-- Move source interpretations while retaining their ids/citations.
UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='refranation')
WHERE term_id=(SELECT id FROM terms WHERE slug='refrenation');

-- Copy any aliases that are not already present.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,a.scope_note
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='refrenation'
JOIN terms canonical ON canonical.slug='refranation';

-- Preserve useful article material from the later Lilly-focused entry. The canonical
-- article already explains the mechanism; use the later distinction paragraph as an
-- additional subsection only if it is not present.
INSERT OR IGNORE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT canonical.id,s.section_key,s.heading,s.body,s.sort_order,s.status,s.editorial_notes
FROM term_article_sections s
JOIN terms duplicate ON duplicate.id=s.term_id AND duplicate.slug='refrenation'
JOIN terms canonical ON canonical.slug='refranation';

-- Migrate pairwise relations in both directions.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='refrenation'
JOIN terms canonical ON canonical.slug='refranation'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='refrenation'
JOIN terms canonical ON canonical.slug='refranation'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='refrenation'
JOIN terms canonical ON canonical.slug='refranation';

DELETE FROM terms WHERE slug='refrenation';
