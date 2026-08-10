-- Editorial Baseline v1: merge duplicate solar-proximity headwords.
--
-- The initial Lilly extraction created `under-the-rays`; the later source-backed teaching
-- pass created `under-the-beams` for the same Lilly condition and 17-degree threshold.
-- Keep Under the Beams as the canonical English headword and preserve Rays as a variant.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Under the Sun''s Rays','English','translation-variant',
       'Earlier English rendering of the same solar-proximity condition represented canonically as Under the Beams.'
FROM terms WHERE slug='under-the-beams';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,a.scope_note
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams';

-- Move any distinct source interpretations. Duplicate Lilly rows are ignored and then
-- removed with the superseded term.
UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='under-the-beams')
WHERE term_id=(SELECT id FROM terms WHERE slug='under-the-rays');

INSERT OR IGNORE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT canonical.id,s.section_key,s.heading,s.body,s.sort_order,s.status,s.editorial_notes
FROM term_article_sections s
JOIN terms duplicate ON duplicate.id=s.term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams';

INSERT OR IGNORE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT canonical.id,tb.table_key,tb.heading,tb.caption,tb.columns_json,tb.rows_json,tb.sort_order,tb.status,tb.editorial_notes
FROM term_article_tables tb
JOIN terms duplicate ON duplicate.id=tb.term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams';

UPDATE term_forms
SET term_id=(SELECT id FROM terms WHERE slug='under-the-beams')
WHERE term_id=(SELECT id FROM terms WHERE slug='under-the-rays')
  AND NOT EXISTS (
    SELECT 1 FROM term_forms e
    WHERE e.term_id=(SELECT id FROM terms WHERE slug='under-the-beams')
      AND e.language_code=term_forms.language_code
      AND e.form=term_forms.form
      AND e.form_type=term_forms.form_type
  );

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='under-the-rays'
JOIN terms canonical ON canonical.slug='under-the-beams';

DELETE FROM terms WHERE slug='under-the-rays';

UPDATE terms
SET label='Under the Beams',
    short_definition='Under the Beams is a solar-proximity condition broader than combustion in which a planet lies close enough to the Sun to be obscured or weakened by its light. Exact limits are source-specific; Lilly uses 17°.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='under-the-beams';
