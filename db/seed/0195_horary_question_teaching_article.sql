-- Evidence-rich article completion: Horary / Interrogational Question.
--
-- The corpus already distinguishes the question, the root time of the question, the
-- querent/quesited roles, and the historical terminology of interrogation. This seed
-- synthesizes those reviewed distinctions into a reader-facing article without importing
-- a full horary judgment procedure.

PRAGMA foreign_keys = ON;

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='horary-question');

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='horary-question');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Horary or Interrogational Question is a concrete question presented for astrological judgment from a figure erected for the question’s operative moment. Traditional question astrology distinguishes the person asking from the person, object, or matter asked about and assigns significators accordingly. The entry names the question-figure framework itself; the exact time rule, house assignment, and judgment mechanics remain separate technical concepts and source-specific procedures.',
  'reviewed','Teaching synthesis from the existing reviewed horary/interrogational evidence. Deliberately not a chart-judgment recipe.'
FROM terms WHERE slug='horary-question';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'question-and-figure','The question and its figure',
  'Horary judgment begins from an actual inquiry rather than from the native’s birth figure or a freely selected election. A figure is erected from the operative time of that question and used to represent the inquiry. This is why the Horary Question and the Time of the Horary Question are related but distinct entries: one names the inquiry and its astrological framework, while the other identifies the moment from which the figure is rooted.',
  10,'reviewed','Keeps question identity separate from the source-specific root-time rule.'
FROM terms WHERE slug='horary-question';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'roles','Querent, quesited, and significators',
  'The person asking is the Querent; the person, object, or matter sought is the Quesited. In Lilly’s introductory account the Ascendant and its lord signify the querent, while the house belonging to the subject of inquiry and its ruler provide the principal significator of the quesited. The broader Significator entry is kept separate because assignment rules vary by branch, topic, and source.',
  20,'reviewed','Lilly-specific introductory assignment is identified as such rather than universalized.'
FROM terms WHERE slug='horary-question';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-language','Question, horary, and interrogation',
  'Modern English usually uses Horary Astrology for the branch, while historical texts and scholarship also use the language of questions, interrogations, and interrogational astrology. These labels belong to the same broad question-astrology stream, but the lexicon preserves Interrogation as a historical terminology entry so that source titles and older discussions remain visible rather than being silently modernized.',
  30,'reviewed','Cross-reference synthesis using the reviewed Interrogation terminology entry.'
FROM terms WHERE slug='horary-question';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'question-classes','A general framework with source-specific question classes',
  'Historical authors can subdivide questions in different ways. Bonatti, for example, distinguishes absolute and determinate questions and also uses a broader universal category. Those classes are represented as their own terms because they refine the kind or scope of a question without changing the identity of horary questioning as the larger framework.',
  40,'reviewed','Uses existing Bonatti question-class reconciliation without importing procedural detail.'
FROM terms WHERE slug='horary-question';

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'question-framework','Question framework and terminology',10,'reviewed',
  'Reader-facing composition for the completed Horary Question article.'
FROM terms WHERE slug='horary-question';

WITH blocks(source_key,show_heading,sort_order) AS (
  VALUES
    ('question-and-figure',0,10),
    ('roles',1,20),
    ('historical-language',1,30),
    ('question-classes',1,40)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',b.source_key,
       CASE WHEN b.show_heading=0 THEN 'paragraph' ELSE 'subsection' END,
       b.show_heading,b.sort_order,'reviewed','Reader-facing composition for Horary Question.'
FROM blocks b
JOIN term_page_sections ps
  ON ps.term_id=(SELECT id FROM terms WHERE slug='horary-question')
 AND ps.section_key='question-framework';

INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'historical-terminology-related-to',
       'Interrogation is historical/question-astrology terminology that overlaps with the horary-question framework while remaining useful as a separate source-language entry.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='horary-question' AND b.slug='interrogation';
