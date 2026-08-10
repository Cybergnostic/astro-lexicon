-- Evidence-rich article completion: Planetary Years.
--
-- The canonical reconciliation already distinguishes assigned planetary year-values from
-- chronological time-lord sequences such as Firdaria. This article explains the doctrine
-- at recognition level while leaving exact numerical values and their applications in the
-- attributed source accounts and reference material.

PRAGMA foreign_keys = ON;

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-years');

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-years');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Years are traditional numerical year-values assigned to the seven planets. The values occur in several named classes—least or small, mean or middle, great, and greatest—and can be used as temporal quantities inside different astrological procedures. The doctrine supplies numbers associated with planets; it is not by itself one universal sequence telling which planet rules each successive period of a life or event.',
  'reviewed','Teaching synthesis from the reconciled Abū Maʿshar/al-Bīrūnī evidence. Exact values and procedural applications remain source-specific.'
FROM terms WHERE slug='planetary-years';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'classes','Several classes of year-values',
  'The sources do not present one single number for each planet. They distinguish several classes of planetary years, conventionally described as least or small, mean or middle, great, and greatest. The class is therefore part of the technical meaning: saying only that a planet has “its years” can be incomplete unless the relevant class or procedure is known.',
  10,'reviewed','Recognition-level synthesis; numerical tables remain in source/reference layers.'
FROM terms WHERE slug='planetary-years';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'quantities-not-sequence','Assigned quantities, not a rulership sequence',
  'Planetary Years should not be confused with a time-lord sequence. A doctrine such as Firdaria arranges planets into successive periods of rulership with its own order and subdivisions. Planetary Years instead assigns numerical temporal quantities to planets. A historical procedure may use those quantities, but the numbers themselves do not create the sequence of rulers.',
  20,'reviewed','Follows the reviewed distinct-from relation between Planetary Years and Firdaria.'
FROM terms WHERE slug='planetary-years';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'procedure-dependent','Use depends on the procedure',
  'The same numerical doctrine can enter more than one astrological context, so the meaning of a planetary year-value depends on what a particular author is doing with it. The lexicon therefore keeps the stable four-class doctrine in the canonical article while leaving exact allowances, conversions, and predictive applications attached to their individual sources.',
  30,'reviewed','Prevents source-specific applications from being universalized.'
FROM terms WHERE slug='planetary-years';

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'classes-and-use','Classes and use',10,'reviewed',
  'Reader-facing composition for the completed Planetary Years article.'
FROM terms WHERE slug='planetary-years';

WITH blocks(source_key,show_heading,sort_order) AS (
  VALUES
    ('classes',0,10),
    ('quantities-not-sequence',1,20),
    ('procedure-dependent',1,30)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,
       CASE WHEN b.show_heading=0 THEN 'paragraph' ELSE 'subsection' END,
       b.show_heading,b.sort_order,'reviewed','Reader-facing composition for Planetary Years.'
FROM blocks b
JOIN term_page_sections ps
  ON ps.term_id=(SELECT id FROM terms WHERE slug='planetary-years')
 AND ps.section_key='classes-and-use';
