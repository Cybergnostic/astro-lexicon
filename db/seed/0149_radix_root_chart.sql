-- Source-backed foundational-chart terminology: Radix / Root of the Nativity.
--
-- Keep distinct from radicality: radix names the root/base figure, while radicality
-- concerns whether a horary figure is regarded as fit for judgment.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'714','716','Book III',NULL,'Root of the Nativity / Radix',
       'Book III, directional discussion: Lilly refers to what is promised in the Root of the Nativity and elsewhere remarks that “Radix” is the more proper expression for the root natal figure.',
       NULL,
       'Direct witness for Radix as the base natal figure used as reference for directions and later predictive figures.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Root of the Nativity / Radix'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('radix','Radix',
   'The root or foundational chart from which later comparisons, directions, revolutions, or other derivative judgments are referenced; in natal work, the radix is the natal chart itself.',
   'chart terminology','reviewed',
   'Lilly explicitly prefers “Radix” to “Root of the Nativity” in his directional discussion. Keep distinct from Radicality, despite the shared Latin root.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Root of the Nativity','English','source-phrase','Lilly’s English phrase for the natal base figure; he notes that Radix is the more proper expression.'
FROM terms WHERE slug='radix';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Root Chart','English','modern-navigation-variant','Plain-English description of the foundational figure to which later charts or techniques are referred.'
FROM terms WHERE slug='radix';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Natal Radix','English','scope-variant','Radix specifically referring to the natal chart.'
FROM terms WHERE slug='radix';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly repeatedly uses Radix for a foundational chart and, in his discussion of directions, explicitly notes that “Radix” is more proper than “Root of the Nativity.” In predictive natal work the radix is the base natal figure whose placements and promises later directions or revolutions refer back to.',
       'Book III: directions and the Root/Radix of the Nativity',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='radix' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III: directions and the Root/Radix of the Nativity'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='radix'
  AND w.slug='lilly-christian-astrology'
  AND sp.section='Root of the Nativity / Radix';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Radix means the root or base chart. In natal astrology it normally refers to the nativity itself: the foundational figure whose placements are later compared with directions, revolutions, profections, transits, or other timing techniques. The word can also be used more generally for the foundational figure of a particular astrological inquiry.',
  'reviewed','Terminology article; no predictive workflow imported.'
FROM terms WHERE slug='radix';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'natal','The natal radix',
  'In natal predictive writing, the radix is the birth chart considered as the root figure. Later charts and motions can be described in relation to their positions in the radix, which allows an author to distinguish the foundational placement from a return, transit, profection or directed position.',10,'reviewed',NULL
FROM terms WHERE slug='radix';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-radicality','Radix is not radicality',
  'Radix names a base chart. Radicality is a horary concept concerning whether a figure is considered fit or capable of judgment. The words share an etymological idea of a root, but they are not interchangeable technical terms.',20,'reviewed',NULL
FROM terms WHERE slug='radix';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'radix-comparison','Radix and related chart terms',
  'The radix supplies the base reference; the other terms name later or derived figures and motions.',
  '["Term","What it names","Relation to the radix"]',
  '[["Radix","The foundational/root chart","Base reference"],["Nativity","The birth chart","Usually the radix in natal astrology"],["Solar Return / Revolution","Chart for the Sun’s return to its natal place","Compared with the natal radix"],["Lunar Return / Revolution","Chart for the Moon’s return","Compared with the natal radix"],["Primary Direction","Directed motion of a radix significator/promissor framework","Uses positions and promises rooted in the nativity"]]',
  30,'reviewed','Reference comparison only; no technique hierarchy implied.'
FROM terms WHERE slug='radix';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'commonly-identical-with','In natal astrology the nativity is ordinarily the radix or root chart.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='nativity';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Radix names the root chart; radicality concerns fitness for horary judgment.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='radicality';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'reference-for','A solar return/revolution is interpreted as a later chart in relation to the natal radix.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='solar-return';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'reference-for','A lunar return/revolution is a later return figure referred back to the natal radix.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='lunar-return';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'reference-for','Primary directions operate from the natal/root figure and its significators and promissors.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='primary-direction';
