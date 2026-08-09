-- Public-source expansion: Abscission of Light in Lilly.
--
-- Keep this separate from Prohibition/Frustration. In Lilly's explicit discussion,
-- abscission can cut off an approaching harmful contact and therefore remove an
-- impediment rather than simply being a synonym for interruption.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'185','185','Book II',NULL,'Abscission of light',
       'Book II: Lilly asks whether another planet cuts off the light and virtue of the significators before their perfect conjunction with an evil planet, calling this an abscission of light.',
       NULL,
       'Direct terminology witness. Page numbering in scan/printed edition may differ; locator retained by phrase rather than workflow.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Abscission of light'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('abscission-of-light','Abscission of Light',
   'A named interference mechanic in which another planet cuts off a developing transmission or contact before its completion; in Lilly’s explicit example the cut-off removes an approaching malefic contact.',
   'planetary mechanics','reviewed',
   'Direct Lilly terminology. Do not equate automatically with Prohibition: Lilly can describe abscission as removing a harmful contact and thus taking off the maleficence.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Abscission','English','short-source-variant','Lilly also refers simply to abscission in worked judgments.'
FROM terms WHERE slug='abscission-of-light';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Cutting Off the Light','English','plain-language-variant','Literal explanatory rendering of Lilly’s wording.'
FROM terms WHERE slug='abscission-of-light';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly distinguishes an abscission of light in which another planet cuts off the light and virtue of significators before a perfect conjunction with an evil planet; in this passage the intervention removes the malefic contact rather than constituting the same geometry as Prohibition.',
       'Book II: explicit abscission-of-light discussion',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='abscission-of-light' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II: explicit abscission-of-light discussion'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='abscission-of-light'
  AND w.slug='lilly-christian-astrology'
  AND sp.section='Abscission of light';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Abscission of Light is a named planetary interference condition found in traditional judgment. The literal image is one of cutting off a developing light, virtue, or contact before it reaches completion. It belongs beside Prohibition, Frustration, and Refrenation, but should not simply be used as another name for them.',
  'reviewed','Direct Lilly witness; intentionally defined without importing a judgment recipe.'
FROM terms WHERE slug='abscission-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly','Lilly’s explicit use',
  'In Lilly’s discussion, a planet can cut off the light and virtue of the significators before their perfect conjunction with an evil planet. He says that when such an abscission intervenes, the maleficence of the infortune can be taken off. This makes the concept especially important to keep distinct from a generic idea of “something interrupts the matter.”',10,'reviewed',NULL
FROM terms WHERE slug='abscission-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Relation to nearby mechanics',
  'Prohibition describes a third planet perfecting an intervening body or aspect before the intended contact. Frustration describes the slower target perfecting elsewhere first. Refrenation arises when the applying planet turns retrograde. Abscission is retained separately because Lilly uses the term for a cutting-off of light or virtue and gives it a distinct function in his examples.',20,'reviewed',NULL
FROM terms WHERE slug='abscission-of-light';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both are named interference mechanics, but Lilly does not treat them as simple synonyms.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='abscission-of-light' AND b.slug='prohibition';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both concern failure or alteration before perfection, with different mechanics.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='abscission-of-light' AND b.slug='frustration';

-- Extend the existing Configuration comparison table if the table schema is present.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'connection-interference-extended','Connection and interference mechanics',
  'Similar-looking conditions are kept separate because the planetary geometry differs.',
  '["Term","Basic geometry","Role"]',
  '[["Translation of Light","One faster intermediary separates from A, then applies to B","Connects"],["Collection of Light","A and B both apply to slower C","Connects"],["Prohibition","A third planet intervenes before A–B perfect","Interrupts"],["Frustration","The slower target perfects with another planet first","Interrupts"],["Refrenation","The applying planet turns retrograde before perfection","Withdraws"],["Abscission of Light","Another contact cuts off a developing light/virtue before completion","Cuts off / redirects"]]',
  81,'reviewed','Lilly-based structural comparison; no outcome workflow.'
FROM terms WHERE slug='configuration';
