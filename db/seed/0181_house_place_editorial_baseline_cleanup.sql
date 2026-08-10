-- Editorial Baseline v1: houses / places.
--
-- Consolidate the house-family teaching layer after the bird's-eye pass. Stable structural
-- facts remain available in article tables and concept-family relations, while public prose
-- is composed into a small number of meaningful sections rather than one h2 per stored block.
-- Add source-supported Hellenistic Greek terminology for the core positional classes.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- REMOVE REDUNDANT PRESENTATION
-- -----------------------------------------------------------------------------

-- `house-structure` already gives the full 12-place angle/succedent/cadent sequence, while
-- the article prose explains why positional class differs from topical signification. The
-- later two-row structure-vs-topic table repeats that distinction without adding reference
-- information.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='twelve-places')
  AND table_key='structure-vs-topic';

-- -----------------------------------------------------------------------------
-- READER-FACING COMPOSITION
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'twelve-places','cardine','succedent-place','cadent-place','derived-house',
  'places-for-dealings','places-without-dealings'
));

-- Twelve Places: one real article section. The basic structure opens the section, the
-- reference table follows it, and the two conceptual distinctions become subsections.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'structure-and-strength','Structure and positional strength',10,'reviewed',
       'Editorial Baseline v1 house-family composition.'
FROM terms WHERE slug='twelve-places';

WITH blocks(source_kind,source_key,presentation_role,show_heading,sort_order) AS (VALUES
  ('article-section','structure','paragraph',0,10),
  ('article-table','house-structure','table',1,20),
  ('article-section','strength','subsection',1,30),
  ('article-section','not-topic','subsection',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,b.source_kind,b.source_key,b.presentation_role,b.show_heading,b.sort_order,
       'reviewed','Editorial Baseline v1 house-family composition.'
FROM blocks b
JOIN term_page_sections ps ON ps.term_id=(SELECT id FROM terms WHERE slug='twelve-places')
WHERE ps.section_key='structure-and-strength';

-- Positional classes: each is one compact explanatory unit rather than two equal h2s.
WITH sections(slug,section_key,heading) AS (VALUES
  ('cardine','position','Angles and positional capacity'),
  ('succedent-place','position','Succedent position'),
  ('cadent-place','position','Cadent position')
)
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,s.section_key,s.heading,10,'reviewed','Editorial Baseline v1 house-family composition.'
FROM sections s JOIN terms t ON t.slug=s.slug;

WITH mappings(slug,source_key,role,show_heading,sort_order) AS (VALUES
  ('cardine','members','paragraph',0,10),
  ('cardine','strength','subsection',1,20),
  ('succedent-place','members','paragraph',0,10),
  ('succedent-place','strength','subsection',1,20),
  ('cadent-place','members','paragraph',0,10),
  ('cadent-place','distinction','subsection',1,20)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',m.source_key,m.role,m.show_heading,m.sort_order,'reviewed',
       'Editorial Baseline v1 house-family composition.'
FROM mappings m
JOIN terms t ON t.slug=m.slug
JOIN term_page_sections ps ON ps.term_id=t.id AND ps.section_key='position';

-- Derived houses: the second stored paragraph is a clarification within the same mechanism.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'derived-counting','How derived houses work',10,'reviewed',
       'Editorial Baseline v1 house-family composition.'
FROM terms WHERE slug='derived-house';

WITH blocks(source_key,role,show_heading,sort_order) AS (VALUES
  ('mechanics','paragraph',0,10),
  ('distinction','subsection',1,20),
  ('reference-shift','paragraph',0,30)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,b.role,b.show_heading,b.sort_order,'reviewed',
       'Editorial Baseline v1 house-family composition.'
FROM blocks b
JOIN term_page_sections ps ON ps.term_id=(SELECT id FROM terms WHERE slug='derived-house')
WHERE ps.section_key='derived-counting';

-- Antiochus-specific classes are already concise; keep one source-scoped section each.
WITH sections(slug,section_key,heading,source_key) AS (VALUES
  ('places-for-dealings','antiochus-class','Antiochus’ house classification','scope'),
  ('places-without-dealings','antiochus-class','The contrasting Antiochan class','contrast')
)
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,s.section_key,s.heading,10,'reviewed','Editorial Baseline v1 house-family composition.'
FROM sections s JOIN terms t ON t.slug=s.slug;

WITH mappings(slug,source_key) AS (VALUES
  ('places-for-dealings','scope'),
  ('places-without-dealings','contrast')
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',m.source_key,'paragraph',0,10,'reviewed',
       'Editorial Baseline v1 house-family composition.'
FROM mappings m
JOIN terms t ON t.slug=m.slug
JOIN term_page_sections ps ON ps.term_id=t.id AND ps.section_key='antiochus-class';

-- -----------------------------------------------------------------------------
-- HELLENISTIC GREEK TERMINOLOGY
-- Reference: HOROI Project glossary. These are historical technical forms, not modern
-- Greek translations manufactured from the English headwords.
-- -----------------------------------------------------------------------------

WITH forms(term_slug,form,lemma,transliteration,literal_gloss,ambiguity_note,editorial_note) AS (VALUES
  ('twelve-places','τόπος','τόπος','topos','place',
   'The word can mean position more generally; in astrological context it is also the Hellenistic equivalent of a house/place.',
   'Historical Greek term for an astrological place/house.'),
  ('cardine','κέντρον','κέντρον','kentron','pivot / centre',
   'The astrological technical sense is a pivot or angle of the figure.',
   'Historical Greek term for an angle/pivot.'),
  ('succedent-place','ἐπαναφορά','ἐπαναφορά','epanaphora','post-ascending / carrying up again',
   'The technical astrological sense is the place following a pivot and leading toward a decline.',
   'Historical Greek term for a succedent place.'),
  ('cadent-place','ἀπόκλιμα','ἀπόκλιμα','apoklima','decline / falling away',
   'The technical astrological sense is a cadent place or decline.',
   'Historical Greek term for a cadent place.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,
   ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',f.form,f.lemma,f.transliteration,f.literal_gloss,'lemma',
       f.ambiguity_note,f.editorial_note,'reviewed'
FROM forms f JOIN terms t ON t.slug=f.term_slug;

WITH renderings(form,rendering,rendering_type,scope_note) AS (VALUES
  ('τόπος','Place','preferred','Hellenistic astrological house/place sense.'),
  ('τόπος','House','variant','Standard later English equivalent in the astrological context.'),
  ('κέντρον','Angle','preferred','Astrological pivot/angle.'),
  ('κέντρον','Pivot','variant','Closer to the historical spatial metaphor.'),
  ('ἐπαναφορά','Succedent','preferred','House/place following an angle.'),
  ('ἀπόκλιμα','Cadent','preferred','House/place falling away before the next pivot.'),
  ('ἀπόκλιμα','Decline','variant','Literalizing historical rendering.')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=r.form;

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify the historical Greek form and technical scope; encyclopedia prose is independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.form IN ('τόπος','κέντρον','ἐπαναφορά','ἀπόκλιμα')
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
