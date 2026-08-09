-- First encyclopedia-quality teaching article.
-- The private lecture corpus was used as a coverage/pedagogy checklist, while
-- all public prose below is newly written and the technical method is anchored
-- to reviewed historical evidence already present in the canonical corpus.

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Temperament is the traditional attempt to describe the underlying constitutional mixture of hot, cold, moist and dry qualities in a nativity. It is broader than a modern personality label: the same temperamental basis can be expressed in many different ways depending on the condition of the planets and the rest of the chart.',
       'reviewed',
       'NA06 pilot article. Private study material informed coverage and pedagogy only; no lecture wording, attribution, or proprietary workflow is reproduced.'
FROM terms WHERE slug='temperament';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'what-it-describes','What temperament describes',
       'The doctrine begins from the four primary qualities. Heat and cold describe contrary active conditions, while moisture and dryness describe contrary passive conditions. Their mixtures produce the four familiar temperaments. In astrological use, temperament is therefore a synthesis: it describes the prevailing constitutional quality of the native rather than the meaning of one isolated planet, sign or house.',
       10,'reviewed',NULL
FROM terms WHERE slug='temperament';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'four-mixtures','The four principal mixtures',
       'The sanguine mixture is hot and moist, the choleric hot and dry, the melancholic cold and dry, and the phlegmatic cold and moist. These are ideal categories used to organize a mixed result. A chart does not have to produce a perfectly pure type: one quality or temperament may predominate while another remains an important secondary component.',
       20,'reviewed',NULL
FROM terms WHERE slug='temperament';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'how-judged','How the judgment is made',
       'Traditional judgment does not reduce temperament to the Sun sign, Ascendant sign, or any single placement. Lilly collects qualitative testimony from several natal factors, including the Ascendant and its ruler, planets strongly affecting the Ascendant, the Moon and planets affecting her, the seasonal condition represented by the Sun, and the lord of the geniture. The testimonies are compared before a final mixture is assigned. The important principle is cumulative judgment: repeated hot, cold, moist and dry indications matter more than an isolated testimony.',
       30,'reviewed',
       'Public method follows the reviewed Lilly account already cited on this term; lecturer-specific sequencing and variants are intentionally excluded.'
FROM terms WHERE slug='temperament';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'interpretive-role','Its role in interpretation',
       'Temperament supplies background context for the rest of natal interpretation. It can help explain why the same planetary symbolism is expressed differently in different people, but it does not replace the detailed judgment of significators, houses, rulers or planetary condition. It is best treated as a constitutional filter or baseline, not as a complete description of character or destiny.',
       40,'reviewed',NULL
FROM terms WHERE slug='temperament';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'common-mistakes','Common mistakes',
       'Two reductions are especially misleading. The first is to turn the four temperaments into four rigid modern personality stereotypes. The second is to use historical constitutional correspondences as though they were medical diagnoses. In the source tradition, temperament belongs to a larger natural-philosophical and astrological framework; on this site, historical medical associations are treated as historical doctrine rather than modern clinical fact.',
       50,'reviewed',NULL
FROM terms WHERE slug='temperament';

-- Strengthen useful public navigation around the pilot entry without adding
-- private-course-only concepts to the canonical term graph.
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('temperament','hot','built-from-quality','Temperament is judged through combinations and predominance of the primary qualities.'),
    ('temperament','cold','built-from-quality','Temperament is judged through combinations and predominance of the primary qualities.'),
    ('temperament','moist','built-from-quality','Temperament is judged through combinations and predominance of the primary qualities.'),
    ('temperament','dry','built-from-quality','Temperament is judged through combinations and predominance of the primary qualities.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
