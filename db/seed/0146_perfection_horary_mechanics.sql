-- Source-backed horary terminology: Perfection.
--
-- Lilly uses "perfection" as the umbrella outcome term for a matter being
-- accomplished, and separately names several mechanics by which perfection can be
-- produced or prevented. This seed documents the concept only; it does not import a
-- horary judgment workflow.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'145','147','Book II','Chapter XXI','Perfection of the matter',
       'Book II, Chapter XXI, pp. 145-147: Lilly asks whether the thing demanded will be brought to perfection and distinguishes conjunction/aspect, translation and collection as ways a matter can be accomplished.',
       NULL,
       'Direct terminology witness for Perfection as the accomplishment/conclusion of the matter. No long quotation stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.book='Book II'
      AND sp.chapter='Chapter XXI'
      AND sp.section='Perfection of the matter'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('perfection','Perfection',
   'In traditional horary terminology, the completion or accomplishment of the matter signified, especially when the relevant significators or connecting mechanics reach the condition that brings the matter to conclusion.',
   'horary mechanics','reviewed',
   'Lilly Book II, Chapter XXI. Define as terminology, not as a checklist for judging a chart. Keep distinct from the narrower astronomical idea of an exact/perfect aspect.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Perfection of the Matter','English','source-derived-variant','Close normalization of Lilly’s recurring wording for a matter being brought to perfection.'
FROM terms WHERE slug='perfection';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Perfecting the Matter','English','name-variant','Reader-facing variant for accomplishment of the horary matter.'
FROM terms WHERE slug='perfection';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly uses perfection as the umbrella term for the demanded matter being accomplished or brought to conclusion. In Chapter XXI he distinguishes direct application/conjunction or aspect, translation of light, and collection of light as different structures through which a matter may be brought to perfection, while elsewhere prohibition, frustration, refrenation and abscission describe interventions around that process.',
       'Book II, Chapter XXI, pp. 145-147',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='perfection'
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
      AND i.scope='Book II, Chapter XXI, pp. 145-147'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='perfection'
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book II, Chapter XXI, pp. 145-147'
  AND sp.book='Book II'
  AND sp.chapter='Chapter XXI'
  AND sp.section='Perfection of the matter';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Perfection is the traditional horary term for the matter of a question reaching accomplishment or conclusion. It is an outcome concept, not the name of one single planetary configuration: several different configurations can be described as producing perfection, while other named conditions can interrupt or alter the route toward it.',
  'reviewed','Source-backed terminology article; intentionally excludes a chart-judgment recipe.'
FROM terms WHERE slug='perfection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'outcome-not-aspect','Outcome, not merely an exact aspect',
  'A perfect aspect is an aspect that has reached exactness; Perfection in horary is broader. It refers to the accomplishment of the matter represented by the chart. Exact application can participate in perfection, but the two expressions should not be treated as synonyms.',10,'reviewed',NULL
FROM terms WHERE slug='perfection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'multiple-mechanics','More than one route to perfection',
  'Lilly discusses direct conjunction or aspect, Translation of Light and Collection of Light as distinct structures through which a matter can be brought to perfection. The lexicon therefore treats Perfection as the umbrella outcome and keeps those mechanics as their own terms.',20,'reviewed',NULL
FROM terms WHERE slug='perfection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'interruption','Interruption and alteration',
  'Prohibition, Frustration and Refrenation describe different ways an expected application can be prevented from completing. Abscission of Light is also a distinct intervention in Lilly’s vocabulary and can alter which contact reaches completion. These terms belong to the same mechanics family but are not interchangeable.',30,'reviewed',NULL
FROM terms WHERE slug='perfection';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Application is one basic motion toward exact contact and can underlie direct perfection, but application and perfection are not synonyms.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='application';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-produced-by','Lilly explicitly presents Translation of Light as a way a matter may be brought to perfection.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='translation-of-light';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-produced-by','Lilly explicitly presents Collection of Light as a way a matter may be brought to perfection.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='collection-of-light';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-prevented-by','Prohibition can intervene before the expected contact reaches completion.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='prohibition';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-prevented-by','Frustration is a distinct interruption in which the slower target perfects with another planet first.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='frustration';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-prevented-by','Refrenation occurs when the applying planet turns retrograde before completing the expected contact.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='refrenation';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Abscission of Light is a separate intervening mechanic in Lilly and can alter which contact proceeds to completion.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='perfection' AND b.slug='abscission-of-light';
