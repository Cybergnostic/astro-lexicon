-- Public-source expansion: named connection/interference mechanics in Lilly.
--
-- These are lexical/mechanical concepts only. The entries define what each named
-- condition is and distinguish nearby terms; they do not reproduce a horary
-- judgment workflow.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'111','113','Book I',NULL,'Prohibition, Refrenation, Translation, Frustration',
       'Book I, pp. 111-113: Lilly defines Prohibition, Refrenation, Translation of Light and Nature, and Frustration as distinct planetary mechanics.',
       NULL,
       'Direct terminology/definition witness. Long quotation not stored.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Prohibition, Refrenation, Translation, Frustration'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'126','126','Book II',NULL,'Translation and Collection',
       'Book II, p. 126: Lilly explains perfection by Translation of Light and Nature and by Collection of Light.',
       NULL,
       'Direct terminology/definition witness. Long quotation not stored.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Translation and Collection'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('translation-of-light','Translation of Light',
   'A planetary connection in which a faster planet separates from one planet and then applies to another, carrying a connection between them.',
   'planetary mechanics','reviewed','Lilly also says “Translation of light and nature.” Definition kept mechanical rather than as a full horary judgment rule.','technical',5),
  ('collection-of-light','Collection of Light',
   'A planetary connection in which two planets apply separately to a slower or more ponderous planet, which receives and gathers their applications.',
   'planetary mechanics','reviewed','Lilly’s Book II explanation requires the collecting planet to be more ponderous; reception conditions are source-specific and described in the source account.','technical',5),
  ('prohibition','Prohibition',
   'An interference condition in which a third planet perfects a conjunction or aspect before two applying planets can complete their intended contact.',
   'planetary mechanics','reviewed','Lilly distinguishes bodily/conjunctional prohibition and prohibition by aspect.','technical',5),
  ('frustration','Frustration',
   'An interference condition in which a slower planet joins another planet before the faster planet applying to it can perfect the intended conjunction.',
   'planetary mechanics','reviewed','Keep distinct from Prohibition and Refrenation.','technical',5),
  ('refrenation','Refrenation',
   'An interference condition in which an applying planet turns retrograde before perfecting the intended conjunction or aspect.',
   'planetary mechanics','reviewed','Spelling normalized to Lilly’s “Refrenation”; later English often uses refranation/refrain.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Translation of Light and Nature','English','source-phrase','Lilly’s fuller wording in Christian Astrology.' FROM terms WHERE slug='translation-of-light';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Collection','English','source-variant','Lilly also labels the condition simply Collection.' FROM terms WHERE slug='collection-of-light';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Bodily Prohibition','English','subtype-name','Lilly’s conjunctional/bodily form of prohibition.' FROM terms WHERE slug='prohibition';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Conjunctional Prohibition','English','subtype-name','Lilly’s conjunctional/bodily form of prohibition.' FROM terms WHERE slug='prohibition';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Prohibition by Aspect','English','subtype-name','Lilly’s aspectual form of prohibition.' FROM terms WHERE slug='prohibition';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Refranation','English','spelling-variant','Common later spelling variant of Lilly’s Refrenation.' FROM terms WHERE slug='refrenation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Refraining','English','translation-variant','Plain-English rendering of the same mechanic.' FROM terms WHERE slug='refrenation';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('translation-of-light','Lilly defines Translation of Light and Nature as a swift/light planet separating from a heavier planet and then joining or aspecting another heavier planet, thereby carrying the first planet’s virtue to the second.','Book I pp. 111-112; Book II p. 126'),
    ('collection-of-light','Lilly defines Collection as two principal significators casting separate aspects to a more ponderous planet which collects both lights; in his Book II formulation the collecting planet is received by them in essential dignity.','Book II p. 126'),
    ('prohibition','Lilly defines Prohibition as a third planet interposing its body or aspect before two applying planets perfect their intended contact, and distinguishes bodily/conjunctional from aspectual prohibition.','Book I pp. 110-111'),
    ('frustration','Lilly defines Frustration as the case where a swift planet applies bodily to a heavier planet, but the heavier planet perfects with another first.','Book I pp. 112-113'),
    ('refrenation','Lilly describes Refrenation as an applying planet becoming retrograde before reaching the promised conjunction, thereby withdrawing from perfection.','Book I p. 111')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('translation-of-light','collection-of-light','prohibition','frustration','refrenation')
  AND sp.section IN ('Prohibition, Refrenation, Translation, Frustration','Translation and Collection');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Translation of Light is a connecting mechanic in which a faster planet separates from one planet and then applies to another, carrying a relationship between two planets that are not themselves completing the relevant contact. Traditional authors can attach additional reception requirements or interpretive rules, so the core encyclopedia definition should remain mechanical.',
  'reviewed','Direct Lilly terminology; workflow intentionally omitted.'
FROM terms WHERE slug='translation-of-light';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanics','Core mechanics','The translating planet must first separate from one planet and then apply to another. Lilly allows the connection by conjunction or aspect. The key distinction is sequential contact by the faster intermediary.',10,'reviewed',NULL FROM terms WHERE slug='translation-of-light';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Collection of Light is a connecting mechanic in which two planets that do not complete the needed contact with each other both apply to a slower or more ponderous third planet. That third planet gathers or “collects” their lights.',
  'reviewed','Direct Lilly terminology; reception details remain source-scoped.'
FROM terms WHERE slug='collection-of-light';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanics','Core mechanics','Unlike Translation, where one faster planet moves sequentially from one planet to another, Collection has two separate applications converging on one slower collecting planet.',10,'reviewed',NULL FROM terms WHERE slug='collection-of-light';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Prohibition is an interference mechanic: two planets are applying toward perfection, but a third planet reaches one or both before their intended contact completes. Lilly distinguishes prohibition by bodily conjunction from prohibition by aspect.',
  'reviewed','Direct Lilly terminology.'
FROM terms WHERE slug='prohibition';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'forms','Forms in Lilly','Bodily or conjunctional prohibition occurs when the interposing planet reaches the relevant bodies first. Prohibition by aspect occurs when its intervening aspect perfects first. The shared idea is interruption before the original application completes.',10,'reviewed',NULL FROM terms WHERE slug='prohibition';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Frustration is a distinct interference mechanic in which a faster planet applies to a slower one, but the slower planet completes a conjunction with a third planet first. The intended first contact is therefore frustrated.',
  'reviewed','Direct Lilly terminology.'
FROM terms WHERE slug='frustration';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Not the same as prohibition','In Prohibition, an interposing planet overtakes or intervenes before the original contact. In Frustration, the slower target itself perfects with someone else first. The geometries are related but not identical.',10,'reviewed',NULL FROM terms WHERE slug='frustration';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Refrenation is an interference mechanic caused by a change in motion: a planet that is applying toward perfection turns retrograde before the contact becomes exact and therefore withdraws from it.',
  'reviewed','Lilly spells the term Refrenation; Refranation retained as alias.'
FROM terms WHERE slug='refrenation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Motion rather than a third planet','Refrenation differs from Prohibition and Frustration because the failure arises from the applying planet’s own change of motion rather than another planet completing an intervening contact.',10,'reviewed',NULL FROM terms WHERE slug='refrenation';

-- Comparison table on the general Configuration page if present.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'connection-interference','Connection and interference mechanics',
  'Named mechanics describe different geometries of connection, interruption, or withdrawal.',
  '["Term","Basic geometry","Role"]',
  '[["Translation of Light","One faster intermediary separates from A, then applies to B","Connects"],["Collection of Light","A and B both apply to slower C","Connects"],["Prohibition","A third planet intervenes before A–B perfect","Interrupts"],["Frustration","The slower target perfects with another planet first","Interrupts"],["Refrenation","The applying planet turns retrograde before perfection","Withdraws"]]',
  80,'reviewed','Lilly-based comparison; not a judgment workflow.'
FROM terms WHERE slug='configuration';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both are named mechanics of planetary connection through a third planet.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='translation-of-light' AND b.slug='collection-of-light';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both describe interruption before an applying contact perfects, but by different geometry.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='prohibition' AND b.slug='frustration';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Refrenation can stop an application through retrogradation.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='refrenation' AND b.slug='retrogradation';
