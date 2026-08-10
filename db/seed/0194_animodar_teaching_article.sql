-- Evidence-rich article completion: Animodar / Namudar.
--
-- The canonical term is already reconciled across Bonatti, al-Biruni and Lilly. This seed
-- adds a reader-facing synthesis from those reviewed source accounts without turning the
-- historical rectification method into a prescriptive workflow.

PRAGMA foreign_keys = ON;

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='animodar');

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='animodar');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Animodar, also represented by the historical form Namudar, is a natal rectification method that begins from the prenatal conjunction or opposition of the luminaries. A planet is selected from the dignity rulers of that syzygy, and its zodiacal position and relation to an angle are then used to correct an uncertain natal Ascendant or set of angles. The sources agree on this basic structure while differing in procedural details.',
  'reviewed','Cross-source teaching synthesis from the existing Bonatti, al-Biruni and Lilly evidence. Exact ranking and tie-breaking rules remain source-specific.'
FROM terms WHERE slug='animodar';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'prenatal-syzygy','The prenatal syzygy is the starting point',
  'The method does not begin by adjusting the birth time directly. It first identifies the conjunction or opposition of the Sun and Moon preceding birth and examines that degree. The prenatal syzygy supplies the reference place from which the rectification indicator is chosen.',
  10,'reviewed','Shared recognition structure in the reviewed Bonatti and al-Biruni accounts.'
FROM terms WHERE slug='animodar';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'indicator','A dignity ruler becomes the indicator',
  'The planets having dignity or testimony at the syzygy degree are compared, and the most suitable or strongest candidate becomes the rectification indicator. Bonatti and al-Biruni both describe this selection through dignity and additional testimony, but the exact priorities belong to each author rather than to one universal Animodar checklist.',
  20,'reviewed','Keep source-specific ranking details in attributed source accounts.'
FROM terms WHERE slug='animodar';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'angles','The indicator is related back to the angles',
  'After the indicator is selected, its zodiacal degree and proximity or relationship to the relevant angle are used to reconstruct or correct the natal angles. Animodar is therefore a defined prenatal-syzygy method of rectification, not a generic name for every attempt to revise a birth time.',
  30,'reviewed','General synthesis of the reviewed method descriptions; computational particulars remain source-scoped.'
FROM terms WHERE slug='animodar';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'other-methods','Distinct from other rectification methods',
  'Lilly presents Animodar alongside other approaches, including the Trutine of Hermes and rectification by dated accidents. The lexicon therefore treats Natal Rectification as the broader task and Animodar as one historical method within it rather than using the two names interchangeably.',
  40,'reviewed','Supported by the reviewed Lilly taxonomy of rectification methods.'
FROM terms WHERE slug='animodar';

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'method-and-distinction','Method and distinctions',10,'reviewed',
  'Reader-facing composition for the completed Animodar article.'
FROM terms WHERE slug='animodar';

WITH blocks(source_key,show_heading,sort_order) AS (
  VALUES
    ('prenatal-syzygy',0,10),
    ('indicator',1,20),
    ('angles',1,30),
    ('other-methods',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,
       CASE WHEN b.show_heading=0 THEN 'paragraph' ELSE 'subsection' END,
       b.show_heading,b.sort_order,'reviewed','Reader-facing composition for Animodar.'
FROM blocks b
JOIN term_page_sections ps
  ON ps.term_id=(SELECT id FROM terms WHERE slug='animodar')
 AND ps.section_key='method-and-distinction';
