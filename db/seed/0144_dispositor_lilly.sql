-- Public-source canonical gap: Dispositor / disposition.
--
-- Lilly repeatedly uses "Dispositor" and the verb "dispose" for the planet governing
-- the sign occupied by another planet or calculated point. The entry below documents
-- the structural term only; it does not import an ordered chart-analysis workflow.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,section,locator_text,quote,internal_notes)
SELECT e.id,'184','188','Book II','Dispositor usage',
       'Book II examples around pp. 184-188: Lilly refers to the Dispositor of the Moon and Part of Fortune and to planets disposing other planets/points by the signs they occupy.',
       NULL,
       'Direct terminology evidence for dispositor/disposition. No copyrighted quotation stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book II' AND sp.section='Dispositor usage'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('dispositor','Dispositor',
   'The planet that governs the zodiacal place occupied by another planet or point, most commonly the domicile ruler of that sign. Historical texts can also specify disposition by another dignity when that dignity is named explicitly.',
   'rulership and condition','reviewed',
   'Directly attested in Lilly. Default unqualified usage is domicile/sign rulership; dignity-specific disposition should be labeled rather than silently treated as identical.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Disposer','English','spelling-variant','Common English spelling/wording variant in translations and later practice.'
FROM terms WHERE slug='dispositor';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Disposition','English','concept-variant','The rulership relationship itself rather than the planet occupying the role of dispositor.'
FROM terms WHERE slug='dispositor';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Planet that disposes','English','source-derived-phrase','Close normalization of Lilly’s repeated verbal usage.'
FROM terms WHERE slug='dispositor';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Lilly repeatedly identifies the ruler of the sign occupied by a planet or calculated point as its dispositor, for example the Dispositor of the Moon or Part of Fortune. His examples show disposition as a rulership relationship tied to the zodiacal place occupied by the object.',
  'Book II, pp. 184-188: repeated dispositor terminology',
  'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='dispositor'
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II, pp. 184-188: repeated dispositor terminology'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='dispositor'
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book II, pp. 184-188: repeated dispositor terminology'
  AND sp.book='Book II' AND sp.section='Dispositor usage';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A dispositor is the planet governing the zodiacal place occupied by another planet or calculated point. In ordinary unqualified use this is the domicile ruler of the sign: a planet in Aries is disposed by Mars, a planet in Taurus by Venus, and so on. The term describes a rulership relationship, not an aspect.',
  'reviewed','Reader-facing structural definition based on direct Lilly usage.'
FROM terms WHERE slug='dispositor';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sign-rulership','Disposition by sign rulership',
  'The simplest form of disposition follows domicile rulership. The dispositor is the planet that rules the sign containing the object being considered. The object can be another planet, the Moon, the Lot of Fortune or another calculated point. This is why disposition can be discussed even when no aspect exists between the two planets.',10,'reviewed',NULL
FROM terms WHERE slug='dispositor';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'other-dignities','Disposition by other dignities',
  'Some traditional texts also speak of disposition through exaltation, bound, triplicity or another dignity. When that narrower meaning is intended, the dignity should be stated explicitly. The unqualified word dispositor is therefore best read first as the sign ruler unless the source says otherwise.',20,'reviewed',NULL
FROM terms WHERE slug='dispositor';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'reception-distinction','Disposition is not reception',
  'Disposition identifies which planet governs the place occupied by another body or point. Reception asks whether one planet receives another into a dignity it rules and is a relational doctrine with its own conditions. The concepts frequently interact, but they should not be treated as synonyms.',30,'reviewed',NULL
FROM terms WHERE slug='dispositor';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'dispositor-comparison','Disposition at a glance',
  'The word can be used at different dignity levels, so the source should make the level clear when it is not domicile rulership.',
  '["Form","Meaning"]',
  '[["Domicile dispositor","Ruler of the sign occupied by the planet or point; normal unqualified meaning"],["Exaltation dispositor","Planet ruling the exaltation dignity at that place, when explicitly specified"],["Other dignity disposition","Triplicity, bound/term or face-based governance when the source explicitly names that dignity"]]',
  50,'reviewed','Reference distinction only; not a hierarchy or judgment procedure.'
FROM terms WHERE slug='dispositor';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Domicile rulership supplies the ordinary unqualified dispositor relationship.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='dispositor' AND b.slug='domicile';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'must-not-be-confused-with','Reception can involve the same dignity relationship, but it is not identical to disposition.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='dispositor' AND b.slug='reception';
