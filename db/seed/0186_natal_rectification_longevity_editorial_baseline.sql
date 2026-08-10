-- Editorial Baseline v1: natal, rectification and longevity terminology.
--
-- Prefer established European/Latin public headwords when multiple historical forms name
-- the same concept. Preserve source-language variants as aliases/forms. Keep historical
-- longevity doctrine descriptive and source-attributed rather than procedural.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- CANONICAL PUBLIC HEADWORDS
-- -----------------------------------------------------------------------------

UPDATE terms
SET label='Animodar',
    short_definition='Animodar is a natal rectification method that begins from the prenatal conjunction or opposition of the luminaries, selects the planet strongest by dignity there, and uses that planet’s position in correcting the natal angles.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='animodar';

UPDATE terms
SET label='Hyleg',
    short_definition='The Hyleg is the selected life-signifying or prorogating planet, luminary, degree, or place used in historical longevity doctrine; eligibility and selection rules vary by author.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='hyleg';

UPDATE terms
SET label='Alcochoden',
    short_definition='The Alcochoden is the planet selected in relation to the Hyleg and used in medieval longevity doctrine as the giver or allocator of years; exact qualification rules vary by source.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='alcochoden';

UPDATE terms
SET label='Anareta',
    short_definition='The Anareta is the destructive or interficient factor in historical longevity doctrine, contrasted with the life-signifying Hyleg; sources differ over whether it must be a planet or can include other places and degrees.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='anareta';

-- Ensure the non-canonical forms remain searchable after simplifying the labels.
WITH alias_data(slug,label,language,alias_type,scope_note) AS (VALUES
  ('animodar','Namudar','Arabic/Persian transliteration','historical-form','Historical form behind the Latinized Animodar.'),
  ('animodar','An-namudar','Arabic/Persian transliteration','historical-form','Historical transliteration represented by Animodar in Latin sources.'),
  ('hyleg','Apheta','Greek/Latin technical','historical-synonym','Historical synonym or near-equivalent for the life-signifying factor.'),
  ('hyleg','Hylech','English/Latinized','historical-spelling','Historical spelling represented in Lilly.'),
  ('hyleg','Haylaj','Arabic/Persian transliteration','historical-form','Arabic/Persian form represented by Hyleg/Hīlāj.'),
  ('alcochoden','Kadkhuda','Arabic/Persian transliteration','historical-form','Arabic/Persian form for the same giver-of-years role.'),
  ('alcochoden','Alcochodon','English historical spelling','historical-spelling','William Lilly’s spelling.'),
  ('alcochoden','Alcocoden','Latin/English','historical-spelling','Common Latinized spelling variant.'),
  ('alcochoden','Giver of Years','English','source-gloss','Functional English description of the role.'),
  ('anareta','Intersector','English/Latin technical','source-variant','Lilly’s technical equivalent.'),
  ('anareta','Interficient Planet','English historical','source-variant','Historical wording when the Anareta is specifically treated as a planet.')
)
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT t.id,a.label,a.language,a.alias_type,a.scope_note
FROM alias_data a JOIN terms t ON t.slug=a.slug;

-- -----------------------------------------------------------------------------
-- REMOVE PUBLIC PROJECT-LANGUAGE FROM HISTORICAL ARTICLES
-- -----------------------------------------------------------------------------

UPDATE term_article_sections
SET body='Lilly describes the Alcochoden as a planet chosen in relation to the Hyleg and glosses it as the giver of years. He then states that he is no more satisfied with the Alcochoden doctrine than with the Hyleg or Anareta and hoped to test it further from experience. His reservation is part of the historical evidence and should be read alongside the doctrine itself.'
WHERE term_id=(SELECT id FROM terms WHERE slug='alcochoden')
  AND section_key='lilly-account';

UPDATE term_article_sections
SET body='Historical authors do not all use identical eligibility rules for Hylegical places. Lilly supplies one explicit list inside his own Hyleg doctrine, but that list belongs to Lilly’s system rather than defining the term universally. A Hylegical place is simply a position accepted as eligible for the Hyleg under the rules being used.'
WHERE term_id=(SELECT id FROM terms WHERE slug='hylegical-place')
  AND section_key='source-variation';

-- -----------------------------------------------------------------------------
-- COMPOSITION: RECTIFICATION FAMILY
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'natal-rectification','animodar','trutine-of-hermes','rectification-by-accidents'
));

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'rectification','Rectification method and scope',10,'reviewed','Editorial Baseline v1 rectification composition.'
FROM terms t
WHERE t.slug IN ('natal-rectification','animodar','trutine-of-hermes','rectification-by-accidents')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 rectification composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='rectification' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,10000+tb.sort_order,'reviewed','Editorial Baseline v1 rectification composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='rectification' AND tb.status IN ('reviewed','published');

-- -----------------------------------------------------------------------------
-- COMPOSITION: HISTORICAL LONGEVITY VOCABULARY
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'hyleg','hylegical-place','alcochoden','anareta'
));

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'historical-role','Historical role and source variation',10,'reviewed','Editorial Baseline v1 longevity terminology composition.'
FROM terms t
WHERE t.slug IN ('hyleg','hylegical-place','alcochoden','anareta')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 longevity terminology composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='historical-role' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,10000+tb.sort_order,'reviewed','Editorial Baseline v1 longevity terminology composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='historical-role' AND tb.status IN ('reviewed','published');
