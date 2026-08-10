-- Editorial Baseline v1: specialized and residual terminology.
--
-- Simplify public headwords where one source-backed European/Latin form is sufficient,
-- preserve genuine source-specific distinctions, and compose residual teaching material.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- CANONICAL HEADWORD CLEANUP
-- -----------------------------------------------------------------------------

UPDATE terms
SET label='Magistry',
    short_definition='Magistry is Lilly’s natal term for the principal study, art, trade, action, or profession by which a person chiefly conducts life and gains a living.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='magistry';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Profession','English','Lilly-source-equivalent','Lilly explicitly uses profession as an equivalent when defining Magistry.'
FROM terms WHERE slug='magistry';

UPDATE terms
SET label='Semisquare',
    short_definition='A minor aspect of 45 degrees; Lilly also calls it the Semiquadrate and treats it as participating in the nature of the square.',
    definition_quality=5,
    status='reviewed',
    entry_type='technical'
WHERE slug='semisquare';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Semiquadrate','English/Latin-derived','historical-form','Lilly’s alternative name for the same 45° aspect.'
FROM terms WHERE slug='semisquare';

UPDATE terms
SET label='Significator of the Soul’s Qualities'
WHERE slug='significator-of-the-soul';

-- -----------------------------------------------------------------------------
-- PRESERVE FALSE-FRIEND DISTINCTIONS EXPLICITLY
-- -----------------------------------------------------------------------------

UPDATE terms
SET short_definition='Opening of the Gates is Bonatti’s name for the good will and security produced when one planet receives another into a qualifying dignity, overcoming their ordinary hostility in that encounter.'
WHERE slug='opening-of-gates';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'distinct-from',
       'Bonatti’s Opening of the Gates is a reception doctrine. The separately preserved Opening the Doors in al-Bīrūnī belongs to a different source-specific recognition rule and should not be merged merely because the English phrases resemble one another.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='opening-of-gates' AND b.slug='opening-the-doors';

-- -----------------------------------------------------------------------------
-- COMPOSITION: SOURCE-SPECIFIC SPECIALIZED TERMS
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'planetary-friendship','planetary-hostility','opening-of-gates','opening-the-doors',
  'magistry','significator-of-the-soul','significator-of-substance','short-journey',
  'infirmity','disease','bodily-impediment','infirmity-of-soul','impediment-of-soul',
  'decumbiture','medical-crisis','critical-days'
));

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'source-scope','Historical definition and source scope',10,'reviewed','Editorial Baseline v1 specialized-term composition.'
FROM terms t
WHERE t.slug IN (
  'planetary-friendship','planetary-hostility','opening-of-gates','opening-the-doors',
  'magistry','significator-of-the-soul','significator-of-substance','short-journey',
  'infirmity','disease','bodily-impediment','infirmity-of-soul','impediment-of-soul',
  'decumbiture','medical-crisis','critical-days'
)
  AND t.status='reviewed'
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
       s.sort_order,'reviewed','Editorial Baseline v1 specialized-term composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='source-scope' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 specialized-term composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='source-scope' AND tb.status IN ('reviewed','published');

-- -----------------------------------------------------------------------------
-- COMPOSITION: MINOR ASPECT VOCABULARY
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'semisextile','semiquintile','quintile','sesquiquintile','biquintile',
  'semisquare','sesquiquadrate','quincunx'
));

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'aspect-definition','Angular definition and historical naming',10,'reviewed','Editorial Baseline v1 minor-aspect composition.'
FROM terms t
WHERE t.slug IN (
  'semisextile','semiquintile','quintile','sesquiquintile','biquintile',
  'semisquare','sesquiquadrate','quincunx'
)
  AND t.status='reviewed'
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
       s.sort_order,'reviewed','Editorial Baseline v1 minor-aspect composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='aspect-definition' AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 minor-aspect composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='aspect-definition' AND tb.status IN ('reviewed','published');
