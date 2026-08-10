-- Editorial Baseline v1: restore Alcochoden / Kadkhuda as one canonical concept.
--
-- Editorial convention: when one technical role is transmitted under both Arabic/Persian
-- and established European/Latin forms, prefer the European/Latin form as the public
-- canonical headword unless a specific historical reason requires otherwise.
--
-- The earlier cross-source revision normalized Alcochodon into `kadkhuda`, but a later
-- curriculum expansion recreated `alcochoden`, and a subsequent Lilly evidence pass
-- attached direct evidence/article material to that Latinized headword. The historical
-- evidence shows one technical role, so preserve all evidence under canonical `alcochoden`
-- and retain Kadkhuda as a historical/original-language form rather than a second page.

PRAGMA foreign_keys = ON;

UPDATE terms
SET label='Alcochoden',
    short_definition='The planet selected in relation to the Hyleg from the relevant dignity rulers and used in medieval longevity doctrine as the giver or allocator of years. Alcochoden, Alcochodon, Alcocoden and Kadkhuda are historical forms for the same technical role, while exact qualification rules vary by source.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical',
    editorial_notes='Editorial Baseline v1: Latin/European Alcochoden is the canonical public headword; Kadkhuda is retained as a historical Arabic/Persian form.'
WHERE slug='alcochoden';

WITH alias_data(label,language,alias_type,scope_note) AS (VALUES
  ('Alcochodon','English historical spelling','source-spelling','William Lilly’s spelling in Christian Astrology.'),
  ('Alcocoden','Latin/English','historical-spelling','Common Latinized spelling variant.'),
  ('Kadkhuda','Arabic/Persian transliteration','historical-form','Arabic/Persian form for the same giver-of-years role.'),
  ('Giver of Years','English translation','source-gloss','Functional English description of the Alcochoden role.')
)
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT t.id,a.label,a.language,a.alias_type,a.scope_note
FROM terms t CROSS JOIN alias_data a
WHERE t.slug='alcochoden';

-- Preserve all useful aliases previously attached to the Arabic/Persian canonical entry.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,a.scope_note
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden';

-- Move source interpretations from Kadkhuda to Alcochoden while retaining interpretation
-- ids wherever possible so existing citation links remain attached.
UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='alcochoden')
WHERE term_id=(SELECT id FROM terms WHERE slug='kadkhuda');

-- Preserve the cross-source article material accumulated on Kadkhuda. The later
-- Alcochoden article already supplies the Lilly-focused introduction; extra sections from
-- either identity remain available under the one canonical term.
INSERT OR IGNORE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT canonical.id,s.section_key,s.heading,s.body,s.sort_order,s.status,s.editorial_notes
FROM term_article_sections s
JOIN terms duplicate ON duplicate.id=s.term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden';

INSERT OR IGNORE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT canonical.id,tb.table_key,tb.heading,tb.caption,tb.columns_json,tb.rows_json,tb.sort_order,tb.status,tb.editorial_notes
FROM term_article_tables tb
JOIN terms duplicate ON duplicate.id=tb.term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden';

-- Historical/original-language forms belong to the canonical Alcochoden entry.
UPDATE term_forms
SET term_id=(SELECT id FROM terms WHERE slug='alcochoden')
WHERE term_id=(SELECT id FROM terms WHERE slug='kadkhuda')
  AND NOT EXISTS (
    SELECT 1 FROM term_forms existing
    WHERE existing.term_id=(SELECT id FROM terms WHERE slug='alcochoden')
      AND existing.language_code=term_forms.language_code
      AND existing.form=term_forms.form
      AND existing.form_type=term_forms.form_type
  );

-- Migrate pairwise relations in both directions.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='kadkhuda'
JOIN terms canonical ON canonical.slug='alcochoden';

DELETE FROM terms WHERE slug='kadkhuda';
