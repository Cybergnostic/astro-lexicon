-- Editorial Baseline v1: Lots / Parts.
--
-- Correct a later editorial drift in the meanings of natural/general Lot indicators,
-- merge the late duplicate `lot-of-haylaj` into the source-backed `lot-of-the-haylaj`,
-- remove duplicated formula presentation, compose the core Lot pages, and add the
-- Hellenistic Greek term for Lot / Part.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- RESTORE SOURCE-BACKED LOT TERMINOLOGY
-- -----------------------------------------------------------------------------

UPDATE terms
SET label='Natural / Immovable Significators of a Lot',
    short_definition='The two primary points whose zodiacal relationship supplies the interval used to construct a Lot; Abū Maʿshar calls them natural indicators and Bonatti natural or immovable significators, in contrast to the movable projection point.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical',
    editorial_notes='Editorial Baseline v1 restores the direct Abū Maʿshar/Bonatti definition after a later bird’s-eye pass incorrectly redefined this term as generic topic planets.'
WHERE slug='natural-indicators-of-a-lot';

UPDATE term_articles
SET intro='The natural or immovable significators of a Lot are the two primary factors whose relationship supplies the zodiacal interval used in the construction. They are distinct from the movable significator—the Ascendant or another specified origin—from which that interval is projected.',
    editorial_notes='Source-backed definition restored from Abū Maʿshar Part VIII and Bonatti Treatise 8.2.'
WHERE term_id=(SELECT id FROM terms WHERE slug='natural-indicators-of-a-lot');

UPDATE terms
SET label='General Indicators / Significators of a Lot',
    short_definition='The formal significators involved in a Lot beyond its two natural interval-defining factors, especially the ruler of the place where the Lot falls and, in Bonatti, the ruler of the place from which projection begins; overlap can reduce the effective number of distinct significators.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical',
    editorial_notes='Abū Maʿshar gives one to three general indicators; Bonatti expands the formal scheme to as many as four significators when the two natural factors, ruler of the Lot, and ruler of the projection place are distinct.'
WHERE slug='general-indicators-of-a-lot';

UPDATE term_articles
SET intro='General indicators are the additional formal significators used to describe a Lot once it has been constructed. Abū Maʿshar allows one, two or three depending on overlap; Bonatti explicitly distinguishes as many as four formal roles when the two natural significators, the ruler of the Lot’s place and the ruler of the projection place are all different.',
    editorial_notes='Source-backed definition restored from Abū Maʿshar Part VIII and Bonatti Treatise 8.2.'
WHERE term_id=(SELECT id FROM terms WHERE slug='general-indicators-of-a-lot');

-- Remove later article sections whose wording depended on the incorrect bird's-eye
-- reinterpretation of these two terms.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='natural-indicators-of-a-lot')
  AND section_key='distinction';
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='general-indicators-of-a-lot')
  AND section_key='distinction';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formal-roles','Construction roles and interpretive roles',
       'The two natural or immovable significators define the interval of the Lot. The movable significator supplies the origin from which that interval is projected. Once the Lot has a zodiacal place, its ruler and the ruler of the projection place can become additional formal significators. The terminology therefore describes roles inside one construction-and-signification system, not a contrast between generic topic planets and chart-specific planets.',10,'reviewed',NULL
FROM terms WHERE slug='general-indicators-of-a-lot';

-- -----------------------------------------------------------------------------
-- MERGE DUPLICATE LOT OF THE HAYLAJ HEADWORDS
-- -----------------------------------------------------------------------------

-- The older `lot-of-the-haylaj` owns direct Abū Maʿshar and Bonatti evidence. A later
-- editorial pass created `lot-of-haylaj` with the same prenatal-syzygy -> Moon formula.
-- Preserve any useful late material under the source-backed canonical headword.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT canonical.id,a.label,a.language,a.alias_type,a.scope_note
FROM aliases a
JOIN terms duplicate ON duplicate.id=a.term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Haylaj','English','short-form','Shortened English form of Lot of the Haylāǧ.'
FROM terms WHERE slug='lot-of-the-haylaj';

UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='lot-of-the-haylaj')
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-haylaj');

INSERT OR IGNORE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT canonical.id,s.section_key,s.heading,s.body,s.sort_order,s.status,s.editorial_notes
FROM term_article_sections s
JOIN terms duplicate ON duplicate.id=s.term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj';

INSERT OR IGNORE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT canonical.id,tb.table_key,tb.heading,tb.caption,tb.columns_json,tb.rows_json,tb.sort_order,tb.status,tb.editorial_notes
FROM term_article_tables tb
JOIN terms duplicate ON duplicate.id=tb.term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj';

UPDATE term_forms
SET term_id=(SELECT id FROM terms WHERE slug='lot-of-the-haylaj')
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-haylaj')
  AND NOT EXISTS (
    SELECT 1 FROM term_forms existing
    WHERE existing.term_id=(SELECT id FROM terms WHERE slug='lot-of-the-haylaj')
      AND existing.language_code=term_forms.language_code
      AND existing.form=term_forms.form
      AND existing.form_type=term_forms.form_type
  );

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT canonical.id,r.object_term_id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.subject_term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj'
WHERE r.object_term_id<>canonical.id;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT r.subject_term_id,canonical.id,r.relation_type,r.note,r.status
FROM term_relations r
JOIN terms duplicate ON duplicate.id=r.object_term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj'
WHERE r.subject_term_id<>canonical.id;

INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT m.family_id,canonical.id,m.role_key,m.role_label,m.sequence_no,m.note,m.status
FROM concept_family_members m
JOIN terms duplicate ON duplicate.id=m.term_id AND duplicate.slug='lot-of-haylaj'
JOIN terms canonical ON canonical.slug='lot-of-the-haylaj';

-- Ensure the canonical source-backed entry remains in the main Lot family even when the
-- duplicate member row cascades away.
INSERT OR IGNORE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,'resolved-stream','Resolved source stream',80,
       'A source-specific Lot involving the Ascendant, Moon and prenatal syzygy; distinct from the Hyleg itself.',
       'reviewed'
FROM concept_families f CROSS JOIN terms t
WHERE f.slug='lot-mechanics' AND t.slug='lot-of-the-haylaj';

DELETE FROM terms WHERE slug='lot-of-haylaj';

-- -----------------------------------------------------------------------------
-- ASSIGN PRESENTATION OWNERSHIP
-- -----------------------------------------------------------------------------

-- Formula tables own the compact arithmetic display on the core resolved Lots. Remove
-- prose formula sections where they simply repeat the same day/night construction.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-fortune')
  AND section_key='formula';
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-absence')
  AND section_key='formula';
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-the-haylaj')
  AND section_key='formula';

-- On the umbrella Lot page, keep the conceptual four-layer table and the concrete formula
-- examples, but remove prose that duplicates the same source-identity warning twice.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='lot')
  AND section_key='source-variation';

-- -----------------------------------------------------------------------------
-- READER-FACING COMPOSITION
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'lot','lot-extraction','natural-indicators-of-a-lot','general-indicators-of-a-lot',
  'lot-of-fortune','lot-of-absence','lot-of-substance','lot-of-the-haylaj'
));

-- Umbrella Lot article: construction first, then historical identity/terminology.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'construction','Construction and formula notation',10,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM terms WHERE slug='lot';

WITH blocks(source_kind,source_key,role,show_heading,sort_order) AS (VALUES
  ('article-section','formal-structure','paragraph',0,10),
  ('article-section','notation','subsection',1,20),
  ('article-table','core-lot-examples','table',1,30),
  ('article-table','lot-layers','table',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,b.source_kind,b.source_key,b.role,b.show_heading,b.sort_order,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM blocks b
JOIN term_page_sections ps ON ps.term_id=(SELECT id FROM terms WHERE slug='lot')
WHERE ps.section_key='construction';

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'identity','Names, families and historical identity',20,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM terms WHERE slug='lot';

WITH blocks(source_key,role,show_heading,sort_order) AS (VALUES
  ('families','paragraph',0,10),
  ('terminology','subsection',1,20),
  ('name-not-identity','subsection',1,30),
  ('formula-source','subsection',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,b.role,b.show_heading,b.sort_order,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM blocks b
JOIN term_page_sections ps ON ps.term_id=(SELECT id FROM terms WHERE slug='lot')
WHERE ps.section_key='identity';

-- Lot extraction: one mechanics section.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'mechanics','How Lot extraction works',10,'reviewed','Editorial Baseline v1 Lots composition.'
FROM terms WHERE slug='lot-extraction';

WITH blocks(source_key,role,show_heading,sort_order) AS (VALUES
  ('mechanics','paragraph',0,10),
  ('direction','subsection',1,20),
  ('projection','subsection',1,30),
  ('projection-not-body','subsection',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,b.role,b.show_heading,b.sort_order,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM blocks b
JOIN term_page_sections ps ON ps.term_id=(SELECT id FROM terms WHERE slug='lot-extraction')
WHERE ps.section_key='mechanics';

-- Indicator terminology: concise source-backed units.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'role','Role in Lot doctrine',10,'reviewed','Editorial Baseline v1 Lots composition.'
FROM terms WHERE slug='natural-indicators-of-a-lot';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','distinct-from-movable','paragraph',0,10,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM term_page_sections ps
WHERE ps.term_id=(SELECT id FROM terms WHERE slug='natural-indicators-of-a-lot')
  AND ps.section_key='role'
  AND EXISTS (SELECT 1 FROM term_article_sections s WHERE s.term_id=ps.term_id AND s.section_key='distinct-from-movable');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'role','Formal significators of the Lot',10,'reviewed','Editorial Baseline v1 Lots composition.'
FROM terms WHERE slug='general-indicators-of-a-lot';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','formal-roles','paragraph',0,10,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM term_page_sections ps
WHERE ps.term_id=(SELECT id FROM terms WHERE slug='general-indicators-of-a-lot')
  AND ps.section_key='role';

-- Core resolved Lots: formula table first, then only genuinely explanatory distinctions.
WITH sections(slug,heading) AS (VALUES
  ('lot-of-fortune','Formula and historical identity'),
  ('lot-of-absence','Formula and historical identity'),
  ('lot-of-substance','Formula and construction'),
  ('lot-of-the-haylaj','Formula and distinction from the Hyleg')
)
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'formula-and-identity',s.heading,10,'reviewed','Editorial Baseline v1 Lots composition.'
FROM sections s JOIN terms t ON t.slug=s.slug;

-- Tables have inconsistent historical keys, so map them explicitly.
WITH blocks(slug,source_kind,source_key,role,show_heading,sort_order) AS (VALUES
  ('lot-of-fortune','article-table','formula','table',1,10),
  ('lot-of-fortune','article-section','luminary-lot','paragraph',0,20),
  ('lot-of-fortune','article-section','part-of-fortune','subsection',1,30),
  ('lot-of-fortune','article-section','relation','subsection',1,40),
  ('lot-of-fortune','article-section','source-formula','paragraph',0,50),
  ('lot-of-absence','article-table','formula-table','table',1,10),
  ('lot-of-absence','article-section','name-variants','subsection',1,20),
  ('lot-of-absence','article-section','source-formula','paragraph',0,30),
  ('lot-of-substance','article-table','formula-table','table',1,10),
  ('lot-of-substance','article-section','meaning','paragraph',0,20),
  ('lot-of-the-haylaj','article-table','formula-table','table',1,10),
  ('lot-of-the-haylaj','article-section','distinction','paragraph',0,20),
  ('lot-of-the-haylaj','article-section','syzygy','subsection',1,30)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,b.source_kind,b.source_key,b.role,b.show_heading,b.sort_order,'reviewed',
       'Editorial Baseline v1 Lots composition.'
FROM blocks b
JOIN terms t ON t.slug=b.slug
JOIN term_page_sections ps ON ps.term_id=t.id AND ps.section_key='formula-and-identity'
WHERE (b.source_kind='article-section' AND EXISTS (
         SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.section_key=b.source_key
       ))
   OR (b.source_kind='article-table' AND EXISTS (
         SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.table_key=b.source_key
       ));

-- -----------------------------------------------------------------------------
-- HELLENISTIC TERMINOLOGY
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,
   ambiguity_note,editorial_note,status)
SELECT id,'grc','Greek','κλῆρος','κλῆρος','klēros','lot / allotment','lemma',
       'The ordinary word has a broader allotment/share sense; in astrological context it denotes the calculated Lot/Part family.',
       'Historical Greek term for an astrological Lot.','reviewed'
FROM terms WHERE slug='lot';

INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,'Lot','preferred','Standard English rendering in Hellenistic astrology.'
FROM term_forms tf
WHERE tf.term_id=(SELECT id FROM terms WHERE slug='lot')
  AND tf.language_code='grc' AND tf.form='κλῆρος';

INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,'Part','variant','Common Latin/medieval English rendering of the same calculated-point family where historical identity agrees.'
FROM term_forms tf
WHERE tf.term_id=(SELECT id FROM terms WHERE slug='lot')
  AND tf.language_code='grc' AND tf.form='κλῆρος';

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify the Greek technical form; encyclopedia prose is independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.term_id=(SELECT id FROM terms WHERE slug='lot')
  AND tf.language_code='grc' AND tf.form='κλῆρος'
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
