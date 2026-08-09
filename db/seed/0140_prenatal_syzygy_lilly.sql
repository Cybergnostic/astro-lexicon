-- Public-source corroboration: prenatal / preceding syzygy terminology.
--
-- Lilly does not use the modern English label "Prenatal Syzygy" in the passage
-- corroborated here. He explicitly refers to the new Moon or full Moon before birth
-- and to the "Conjunction or Opposition preceding." The canonical label below is an
-- editorial modern umbrella for that historical concept; source wording is retained
-- as aliases and in the source account.
--
-- The concept appears within Lilly's Hyleg discussion, but this entry documents the
-- term and identity only. It does not publish a longevity-selection procedure.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'527','528','Book III','Chapter CIV','Conjunction or Opposition preceding',
       'Book III, Chapter CIV, pp. 527-528: Lilly discusses the new Moon or full Moon before the nativity and repeatedly refers to the preceding conjunction or opposition.',
       NULL,
       'Direct witness for the historical concept now commonly indexed as the prenatal or preceding syzygy. No long quotation stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.book='Book III'
      AND sp.chapter='Chapter CIV'
      AND sp.section='Conjunction or Opposition preceding'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('prenatal-syzygy','Prenatal Syzygy',
   'The conjunction or opposition of the Sun and Moon preceding a nativity, represented by the preceding new Moon or full Moon and used as a technical reference point in several traditional natal doctrines.',
   'natal terminology','reviewed',
   'Canonical English navigation label. Lilly directly attests the concept as the new/full Moon before birth and the "Conjunction or Opposition preceding"; do not imply that he uses the modern phrase Prenatal Syzygy.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Preceding Syzygy','English','name-variant','Common modern/traditional navigation wording for the preceding conjunction or opposition.'
FROM terms WHERE slug='prenatal-syzygy';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Conjunction or Opposition Preceding','English','source-phrase','Close normalization of Lilly’s direct wording in Christian Astrology, Book III, Chapter CIV.'
FROM terms WHERE slug='prenatal-syzygy';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Preceding Conjunction','English','source-derived-variant','The preceding new Moon / solar-lunar conjunction.'
FROM terms WHERE slug='prenatal-syzygy';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Preceding Opposition','English','source-derived-variant','The preceding full Moon / solar-lunar opposition.'
FROM terms WHERE slug='prenatal-syzygy';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In his discussion of the Hyleg, Lilly explicitly considers the new Moon or full Moon before the nativity and repeatedly refers to the preceding conjunction or opposition. His day/night treatment is source-specific, but the passage directly establishes the preceding solar-lunar syzygy as a distinct natal reference point.',
       'Book III, Chapter CIV, pp. 527-528: preceding conjunction/opposition',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='prenatal-syzygy'
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
      AND i.scope='Book III, Chapter CIV, pp. 527-528: preceding conjunction/opposition'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='prenatal-syzygy'
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book III, Chapter CIV, pp. 527-528: preceding conjunction/opposition'
  AND sp.book='Book III'
  AND sp.chapter='Chapter CIV'
  AND sp.section='Conjunction or Opposition preceding';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Prenatal Syzygy is the Sun–Moon conjunction or opposition preceding a birth: in other words, the relevant preceding new Moon or full Moon. The modern label is a convenient umbrella; historical authors can describe the point more literally as the conjunction or opposition preceding the nativity.',
  'reviewed','Reader-facing terminology article. Lilly source wording is preserved separately; no longevity workflow imported.'
FROM terms WHERE slug='prenatal-syzygy';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'new-full','Conjunction and opposition',
  'A solar-lunar conjunction corresponds to a new Moon, while a solar-lunar opposition corresponds to a full Moon. The term syzygy groups these two principal alignments. In natal contexts the qualifier prenatal or preceding identifies the relevant alignment before the birth.',10,'reviewed',NULL
FROM terms WHERE slug='prenatal-syzygy';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly','Lilly’s terminology',
  'William Lilly does not need a separate technical noun in the corroborated passage: he speaks of the new Moon or full Moon before birth and of the conjunction or opposition preceding. The encyclopedia therefore distinguishes the modern navigation label Prenatal Syzygy from Lilly’s directly attested phrasing.',20,'reviewed',NULL
FROM terms WHERE slug='prenatal-syzygy';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'uses','A reference point in natal doctrine',
  'Historical natal authors can use the preceding conjunction or opposition as a reference degree in other technical doctrines. Those doctrines have their own entries and source-specific rules. The syzygy itself is simply the preceding solar-lunar alignment and should not be confused with the procedures that make use of it.',30,'reviewed','Keeps Hyleg/longevity procedures outside this term definition.'
FROM terms WHERE slug='prenatal-syzygy';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Lilly uses the preceding conjunction/opposition as a reference point within his Hyleg discussion; the concepts remain distinct.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='prenatal-syzygy' AND b.slug='hyleg';
