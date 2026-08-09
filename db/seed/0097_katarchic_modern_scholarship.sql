-- Modern-scholarly terminology corroboration: katarchic astrology.
--
-- The initial historical corpus contains elections, questions/interrogations, event
-- charts and decumbiture-related material, but it should not be made to speak a
-- modern English umbrella label it does not necessarily use. Add a modern scholarly
-- witness specifically for terminological scope and keep it distinct from historical
-- astrological authorities.

INSERT OR IGNORE INTO authors (slug,name,historical_layer,notes)
VALUES (
  'dorian-gieseler-greenbaum',
  'Dorian Gieseler Greenbaum',
  'Modern scholarship',
  'Modern historian of astrology. Included as a secondary scholarly witness for terminology and historical scope, not as a historical astrological authority.'
);

INSERT OR IGNORE INTO works
  (author_id,slug,title,language,notes,corpus_status)
SELECT id,
       'greenbaum-origins-of-questions',
       'The Origins of Questions in Astrology',
       'English',
       'Chapter in Astrologers at Work. DOI 10.1163/9789004745322_002. Used here only for scholarly terminology/scope; full copyrighted chapter is not stored in the repository.',
       'partial'
FROM authors WHERE slug='dorian-gieseler-greenbaum';

INSERT OR IGNORE INTO editions
  (work_id,label,publisher,publication_year,target_language,copyright_note,local_source_key)
SELECT id,
       'Brill chapter / online scholarly edition',
       'Brill',
       2025,
       'English',
       'Copyrighted modern scholarship; store bibliographic metadata and original paraphrase only.',
       'greenbaum-origins-of-questions'
FROM works WHERE slug='greenbaum-origins-of-questions';

INSERT INTO source_passages
  (edition_id,page_start,page_end,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'1','58','Chapter 1','Abstract / scope statement',
       'Chapter metadata and abstract: katarchic astrology as the platform encompassing elections, event interpretation, interrogations and decumbitures',
       NULL,
       'Only the publicly available abstract/scope statement is used for this terminology record. No copyrighted chapter text is stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='greenbaum-origins-of-questions'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.chapter='Chapter 1' AND sp.section='Abstract / scope statement'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES (
  'katarchic-astrology',
  'Katarchic Astrology',
  'A modern scholarly umbrella term for astrology concerned with beginnings or initiated situations, commonly encompassing elections and event charts and, in broader scholarly usage, interrogations and decumbitures.',
  'branches','reviewed',
  'Do not reduce this automatically to electional astrology. Scope varies across scholarship and historical contexts; the term is being documented as terminology, not projected retroactively onto every pre-modern author.',
  'technical',5
);

UPDATE terms SET
  label='Katarchic Astrology',
  short_definition='A modern scholarly umbrella term for astrology concerned with beginnings or initiated situations, commonly encompassing elections and event charts and, in broader scholarly usage, interrogations and decumbitures.',
  category='branches',
  status='reviewed',
  definition_quality=5,
  editorial_notes='Modern scholarly terminology witness added from Greenbaum. Keep historical source practices and the later umbrella label distinct; do not equate katarchic astrology with electional astrology alone.'
WHERE slug='katarchic-astrology';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Katarche','Greek/transliteration','etymological-variant',
       'Transliteration associated with Greek katarchē; scholarly scope varies and should not be treated as a simple synonym for electional astrology.'
FROM terms WHERE slug='katarchic-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Greenbaum treats katarchic astrology as a broad platform through which elections, interpretation of events, interrogations and decumbitures can be understood together. This supports using “katarchic astrology” as an umbrella term while preserving the distinct identities of those practices.',
       'Chapter 1 abstract: scope of katarchic astrology',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='katarchic-astrology'
  AND w.slug='greenbaum-origins-of-questions'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Chapter 1 abstract: scope of katarchic astrology'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'secondary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='katarchic-astrology'
  AND w.slug='greenbaum-origins-of-questions'
  AND i.scope='Chapter 1 abstract: scope of katarchic astrology'
  AND sp.chapter='Chapter 1' AND sp.section='Abstract / scope statement';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Katarchic astrology is best treated as an umbrella term rather than as a synonym for electional astrology. In modern historical scholarship it can gather several related practices concerned with initiated situations and significant moments: choosing a beginning, interpreting an event that has begun, answering an interrogation, and examining a decumbiture. Historical authors may organize these practices differently and need not use one equivalent umbrella label.',
       'reviewed',
       'Modern scholarly scope statement; historical practices remain separately sourced under their own canonical entries.'
FROM terms WHERE slug='katarchic-astrology';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','Scope',
       'The narrowest use of katarchic can resemble inceptional or electional astrology, but modern scholarship can use it more broadly for elections, event interpretation, interrogations and decumbitures. The lexicon therefore keeps Electional Astrology, Horary/Questions, event or inception charts, and Decumbiture as separate related concepts rather than collapsing them into one technique.',
       10,'reviewed',NULL
FROM terms WHERE slug='katarchic-astrology';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-caution','Historical caution',
       'A modern umbrella term should not be retrojected as though every ancient or medieval astrologer used the same category. When a historical source discusses elections, questions or beginnings, the encyclopedia records the source’s own structure and terminology first; “katarchic” supplies a scholarly cross-reference across those practices.',
       20,'reviewed',NULL
FROM terms WHERE slug='katarchic-astrology';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Electional astrology is one major practice commonly grouped under the katarchic umbrella, but the two terms are not universally coextensive.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='katarchic-astrology' AND b.slug='electional-astrology';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Interrogations/horary can fall within broader scholarly treatments of katarchic astrology, while remaining a distinct technical practice.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='katarchic-astrology' AND b.slug='horary-astrology';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Decumbiture is included within broad scholarly descriptions of katarchic astrology but remains its own historical technique/term.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='katarchic-astrology' AND b.slug='decumbiture';
