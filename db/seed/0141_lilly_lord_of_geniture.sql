-- Public-source corroboration: Lord of the Geniture.
--
-- William Lilly explicitly titles Book III, Chapter CV "Of the Lord of the Geniture".
-- He records more than one historical way of identifying the role and then states his
-- own preferred criterion. This seed canonicalizes the named role without converting
-- Lilly's chapter into a general natal-analysis workflow or equating it automatically
-- with the Almuten of the Figure.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'530','531','Book III','Chapter CV','Lord of the Geniture',
       'Book III, Chapter CV, pp. 530-531: Lilly discusses differing ancient opinions concerning the Lord of the Geniture and states his own preferred criterion.',
       NULL,
       'Direct witness for the named natal role. Public summaries are paraphrased; detailed selection procedure remains source-specific.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.book='Book III'
      AND sp.chapter='Chapter CV'
      AND sp.section='Lord of the Geniture'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lord-of-geniture','Lord of the Geniture',
   'A named natal role for the planet judged to hold principal overall authority in the nativity. William Lilly explicitly discusses competing historical criteria for identifying it and gives his own preferred view.',
   'natal terminology','reviewed',
   'Directly attested in William Lilly, Christian Astrology, Book III, Chapter CV. Keep distinct from the Ascendant ruler, Significator of Manners and Almuten of the Figure unless a source explicitly identifies them.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lord of the Nativity','English','name-variant','Common English rendering for the same general natal role; source wording here is Lord of the Geniture.'
FROM terms WHERE slug='lord-of-geniture';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lady of the Geniture','English','grammatical-variant','Historical grammatical variant when the qualifying planet is described with feminine wording.'
FROM terms WHERE slug='lord-of-geniture';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly explicitly treats the Lord of the Geniture as a chart-wide natal role. He reports an opinion that compares essential dignities at the Ascendant, Midheaven, Sun, Moon and Lot of Fortune, then states his own preference for the planet with the greatest combined essential and accidental strength, best placement and elevation in the figure. He also notes that another planet of nearly equal strength can participate.',
       'Book III, Chapter CV: Lord of the Geniture',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lord-of-geniture'
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
      AND i.scope='Book III, Chapter CV: Lord of the Geniture'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lord-of-geniture'
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book III, Chapter CV: Lord of the Geniture'
  AND sp.book='Book III'
  AND sp.chapter='Chapter CV'
  AND sp.section='Lord of the Geniture';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lord of the Geniture is a traditional natal role for the planet judged to have the strongest overall authority in the nativity. William Lilly devotes a chapter to the subject and explicitly notes that earlier authors did not all agree on how the planet should be selected.',
  'reviewed','Source-backed role definition. Detailed selection algorithms remain attached to historical accounts rather than being universalized.'
FROM terms WHERE slug='lord-of-geniture';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-view','Lilly’s preferred view',
  'After reporting earlier opinions, Lilly favors the planet that combines the greatest essential and accidental strength, is well placed, and is strongly elevated in the figure. He also allows a nearly equal planet to participate. This is Lilly’s own source-specific treatment, not a universal definition of how every traditional author finds the role.',10,'reviewed',NULL
FROM terms WHERE slug='lord-of-geniture';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-asc-ruler','Not simply the Ascendant ruler',
  'The Lord of the Geniture is a chart-wide predominance role. The ruler of the Ascendant has authority because it rules the first place, but it does not automatically become Lord of the Geniture. The two roles can coincide in a particular nativity without being identical concepts.',20,'reviewed',NULL
FROM terms WHERE slug='lord-of-geniture';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'related-roles','Related but distinct natal roles',
  'The Lord of the Geniture should also be kept distinct from the Significator of Manners and from the Almuten of the Figure. All three can concern broad features of the nativity, but their historical names, recognition rules and functions are not interchangeable. The encyclopedia therefore preserves them as separate canonical entries and links them for comparison.',30,'reviewed',NULL
FROM terms WHERE slug='lord-of-geniture';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'related-natal-roles','Related natal roles at a glance',
  'These roles may overlap in a chart, but they should not be collapsed into a generic “chart ruler.”',
  '["Role","Primary idea","Source/status"]',
  '[["Lord of the Geniture","Planet of broad overall predominance in the nativity","Explicitly treated by Lilly, Book III, Ch. CV"],["Almuten of the Figure","Chart-wide almuten derived from a specified set of testimonies","Historical calculation family; method must be named"],["Significator of Manners","Planet or planets signifying manners/disposition","Explicitly treated by Lilly, Book III, Ch. CVII"],["Ascendant ruler","Planet ruling the rising sign / first place","Specific house-rulership office"]]',
  40,'reviewed','Comparative taxonomy only; not a selection sequence.'
FROM terms WHERE slug='lord-of-geniture';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both are chart-wide natal predominance concepts, but historical criteria and terminology differ and should not be automatically equated.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lord-of-geniture' AND b.slug='almuten-of-figure';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'distinct-from','Lilly treats the Lord of the Geniture and Significator of Manners in separate chapters with different recognition logic.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lord-of-geniture' AND b.slug='significator-of-manners';
