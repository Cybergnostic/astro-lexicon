-- Source-backed terminology: Interrogation / Interrogations.
--
-- This is a lexical bridge, not a horary workflow. Modern scholarship uses
-- "interrogations" for the historical question-astrology stream, while Lilly's
-- bibliography preserves the Latin title de Interrogationibus for Sahl/Zael.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('interrogation','Interrogation',
   'A historical term for an astrological question or the branch of practice concerned with judging questions, closely corresponding to what is now commonly called horary astrology.',
   'branches','reviewed',
   'Use as historical/question-astrology terminology. Do not collapse every use of interrogation into a modern standardized horary workflow, and do not treat the English singular as necessarily the exact preferred title of every historical author.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Interrogations','English','number-variant','Common plural in modern historical scholarship when discussing question astrology.'
FROM terms WHERE slug='interrogation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Interrogationes','Latin','historical-variant','Latin family of terminology found in titles and transmission of works on questions.'
FROM terms WHERE slug='interrogation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'de Interrogationibus','Latin','source-phrase','Lilly lists Zael/Sahl under the title de Interrogationibus in his bibliography.'
FROM terms WHERE slug='interrogation';

-- Reuse the already-onboarded Greenbaum scholarly witness for scope.
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Greenbaum includes interrogations among the practices grouped within a broad scholarly account of katarchic astrology. This supports “interrogation” as historical/question-astrology terminology while keeping it distinct from elections and decumbitures.',
       'Chapter 1 abstract: interrogations within broad katarchic scope',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='interrogation'
  AND w.slug='greenbaum-origins-of-questions'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Chapter 1 abstract: interrogations within broad katarchic scope'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'secondary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='interrogation'
  AND w.slug='greenbaum-origins-of-questions'
  AND i.scope='Chapter 1 abstract: interrogations within broad katarchic scope'
  AND sp.chapter='Chapter 1' AND sp.section='Abstract / scope statement';

-- Lilly gives an additional historical-terminology witness in his bibliography.
INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'907','908',NULL,NULL,'Bibliography: de Interrogationibus',
       'Bibliographical listing of Zael/Sahl de Interrogationibus.',
       NULL,
       'Terminology/title witness only; not used to reconstruct a method or definition beyond question-astrology scope.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Bibliography: de Interrogationibus'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly’s bibliography lists a work attributed to Zael/Sahl under the Latin title de Interrogationibus, preserving the interrogation terminology in the textual tradition available to a seventeenth-century English astrologer.',
       'Bibliography: de Interrogationibus terminology witness',
       'direct','reviewed','B'
FROM terms t CROSS JOIN works w
WHERE t.slug='interrogation' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Bibliography: de Interrogationibus terminology witness'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='interrogation'
  AND w.slug='lilly-christian-astrology'
  AND sp.section='Bibliography: de Interrogationibus';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Interrogation is historical terminology for astrological questions and the practice of judging them. In modern English, Horary Astrology is usually the more familiar navigation label, but historical scholarship and textual titles preserve a broader vocabulary of questions, interrogations and interrogational astrology. The lexicon therefore keeps Interrogation as its own terminology entry while linking it closely to Horary Astrology.',
  'reviewed','Terminology entry only; no question-analysis workflow imported.'
FROM terms WHERE slug='interrogation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-scope','Historical scope',
  'An interrogation is a question presented for astrological judgment. The term can refer to an individual question and, in plural or title form, to the literature and practice of question astrology. Historical authors organize the material differently, so “interrogation” should not be used to impose one later standardized horary procedure on every source.',10,'reviewed',NULL
FROM terms WHERE slug='interrogation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'relation-to-horary','Relation to horary astrology',
  'Horary Astrology is the clearest modern English branch label for judging a question from a chart cast for the inquiry. Interrogation is useful as a historical and scholarly cross-reference for that same broad question-astrology stream. The terms substantially overlap in scope, but preserving both makes source titles and historical discussions easier to navigate.',20,'reviewed',NULL
FROM terms WHERE slug='interrogation';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'historical-counterpart-of','Interrogation is historical/question-astrology terminology closely corresponding to the modern navigation label Horary Astrology.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='interrogation' AND b.slug='horary-astrology';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Modern scholarship can place interrogations within a broad katarchic umbrella alongside elections, event interpretation and decumbitures.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='interrogation' AND b.slug='katarchic-astrology';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses-role','A person asking an interrogation/question is the querent.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='interrogation' AND b.slug='querent';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses-role','The person or matter asked about in an interrogation is represented by the quesited.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='interrogation' AND b.slug='quesited';
