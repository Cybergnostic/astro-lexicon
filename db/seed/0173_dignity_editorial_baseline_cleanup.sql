-- Editorial Baseline v1: essential dignity / debility family.
--
-- This pass assigns clear ownership between explanatory prose and structured reference
-- data, removes duplicated hand-written summaries, restores the Terms/Bounds teaching
-- article under the source-backed canonical `terms` headword, and composes the family
-- into reader-facing hierarchies rather than exposing every stored block as an h2.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- TERMS / BOUNDS: restore teaching content on the source-backed canonical headword.
-- The old article-quality seed targeted a superseded/non-canonical `bound-term` slug.
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Terms or bounds are unequal subdivisions of each zodiacal sign assigned to planetary rulers. A planet occupying its own bound possesses a minor essential dignity at that degree, while the exact sequence and lengths depend on the historical bound table being used.',
       'reviewed','Editorial Baseline v1: teaching article moved to the source-backed canonical Terms / Bounds headword.'
FROM terms WHERE slug='terms';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'unequal','Unequal subdivisions',
       'Unlike faces or decans, terms do not divide every sign into equal pieces. Each sign is divided into consecutive degree ranges of unequal length, and each range is assigned to a planetary ruler.',
       10,'reviewed',NULL
FROM terms WHERE slug='terms';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'dignity','A minor essential dignity',
       'When a planet occupies the bound assigned to itself, it has dignity by term or bound. This is a genuine but limited form of essential dignity and is sufficient to prevent peregrine status under a scheme that recognizes terms.',
       20,'reviewed',NULL
FROM terms WHERE slug='terms';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Historical tables vary',
       'Several bound systems circulated historically. Egyptian and Ptolemaic-type tables differ in their planetary sequences and degree limits, so a statement that a planet is in its own term is meaningful only relative to the table being used.',
       30,'reviewed',NULL
FROM terms WHERE slug='terms';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'bound-face-comparison','Terms and faces compared',
       'Both can provide minor essential dignity, but they divide the zodiac differently.',
       '["Feature","Terms / Bounds","Faces / Decans"]',
       '[["Subdivision size","Unequal degree ranges","Three equal 10° divisions per sign"],["Historical schemes","Multiple bound tables are preserved","Planetary face/decan sequences are source-sensitive"],["Dignity test","Planet rules the bound it occupies","Planet rules the face it occupies"]]',
       40,'reviewed','Reader-facing structural comparison; detailed assignments remain in named reference schemes.'
FROM terms WHERE slug='terms';

-- -----------------------------------------------------------------------------
-- REMOVE PROSE/TABLES NOW OWNED BY STRUCTURED REFERENCE DATA
-- -----------------------------------------------------------------------------

-- Essential Dignity already has a full data-driven reference matrix. Keep one compact
-- conceptual table, but remove hand-written assignment/relationship summaries that repeat
-- either the matrix or nearby prose.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity')
  AND table_key IN ('planetary-dignities','dignity-debility-relations');

-- The five-dignities prose says substantially the same thing as the retained
-- `dignity-levels` conceptual table; the table is the clearer owner of that comparison.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity')
  AND section_key='five-dignities';

-- Tiny axis/comparison tables on individual entries restate their prose definitions.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='detriment')
  AND table_key='paired-axes';

-- Peregrine recognition is already explained directly in prose. Retain the useful
-- three-way distinction table, but remove the yes/no table that repeats the paragraph.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='peregrine')
  AND table_key='peregrine-recognition';

-- Face/Decan and Terms/Bounds each need only one cross-comparison. Keep the canonical
-- comparison on the Terms page and remove the reversed duplicate from Face/Decan.
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='face-decan')
  AND table_key='face-bound-comparison';

-- -----------------------------------------------------------------------------
-- PAGE COMPOSITION
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'essential-dignity','domicile','exaltation','detriment','fall','peregrine',
    'terms','face-decan','triplicity-rulers'
  )
);

-- Essential dignity: one explanatory section and one historical/reference section.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'meaning','How essential dignity works',10,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM terms WHERE slug='essential-dignity';
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'schemes','Dignity types and historical schemes',20,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM terms WHERE slug='essential-dignity';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='quality-versus-power' THEN 'subsection' ELSE 'paragraph' END,
       CASE WHEN s.section_key='quality-versus-power' THEN 1 ELSE 0 END,
       s.sort_order,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='meaning'
  AND s.section_key IN ('dignity-and-debility','quality-versus-power');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table','dignity-levels','table',0,10,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM term_page_sections ps
WHERE ps.section_key='schemes' AND ps.term_id=(SELECT id FROM terms WHERE slug='essential-dignity')
  AND EXISTS (
    SELECT 1 FROM term_article_tables t
    WHERE t.term_id=ps.term_id AND t.table_key='dignity-levels'
  );
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','tables-and-variants','paragraph',0,20,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM term_page_sections ps
WHERE ps.section_key='schemes' AND ps.term_id=(SELECT id FROM terms WHERE slug='essential-dignity')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s
    WHERE s.term_id=ps.term_id AND s.section_key='tables-and-variants'
  );

-- One coherent public section is sufficient for the smaller dignity/debility entries.
WITH entries(slug,section_key,heading) AS (VALUES
  ('domicile','doctrine','How domicile works'),
  ('exaltation','doctrine','How exaltation works'),
  ('detriment','doctrine','How detriment works'),
  ('fall','doctrine','How fall works'),
  ('peregrine','doctrine','How peregrine condition works'),
  ('terms','doctrine','How terms and bounds work'),
  ('face-decan','doctrine','How faces and decans work'),
  ('triplicity-rulers','doctrine','How triplicity rulership works')
)
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,e.section_key,e.heading,10,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM entries e JOIN terms t ON t.slug=e.slug;

-- Add every surviving reviewed prose section for those entries. The opening structural
-- explanation is unheaded; later distinctions become h3 subsections only where useful.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(
         SELECT MIN(s2.sort_order) FROM term_article_sections s2
         WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')
       ) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(
         SELECT MIN(s2.sort_order) FROM term_article_sections s2
         WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')
       ) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
JOIN terms t ON t.id=ps.term_id
WHERE ps.section_key='doctrine'
  AND t.slug IN ('domicile','exaltation','detriment','fall','peregrine','terms','face-decan','triplicity-rulers')
  AND s.status IN ('reviewed','published');

-- Surviving small comparison tables belong inside the same doctrine section, after prose.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 dignity-family composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
JOIN terms t ON t.id=ps.term_id
WHERE ps.section_key='doctrine'
  AND t.slug IN ('domicile','exaltation','detriment','fall','peregrine','terms','face-decan','triplicity-rulers')
  AND tb.status IN ('reviewed','published');
