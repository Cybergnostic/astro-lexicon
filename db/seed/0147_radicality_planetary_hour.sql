-- Source-backed horary/time-ruler terminology: Radicality and Planetary Hour.
--
-- These are lexical concepts only. Lilly's larger "Considerations before Judgment"
-- remain a procedural/historical discussion and are not migrated as a workflow page.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'142','143','Book II',NULL,'Considerations before Judgment — radical figure',
       'Book II, pp. 142-143: Lilly discusses whether a figure is radical and capable of judgment, relating the Lord of the Hour to the Lord of the Ascendant by identity, triplicity, or nature.',
       NULL,
       'Direct terminology witness for radical/radicality and Lord of the Hour. The full considerations are not imported as a workflow.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Considerations before Judgment — radical figure'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'474','482','Book III',NULL,'Planetary-hour tables',
       'Book III, pp. 474-482: Lilly supplies tables for planetary hours and explains how to identify the planet ruling an hour of day or night.',
       NULL,
       'Direct witness that planetary hours and the planetary ruler of an hour are explicit technical concepts in Lilly.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Planetary-hour tables'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('radicality','Radicality',
   'In horary terminology, the quality of a figure being considered radical, fit, or capable of judgment according to the criteria of a particular historical author or tradition.',
   'horary terminology','reviewed',
   'Lilly directly uses "radicall" and "capable of judgment." Do not universalize his specific hour-ruler/Ascendant-ruler test as the only historical definition of radicality.',
   'technical',5),
  ('planetary-hour','Planetary Hour',
   'A traditional unequal-hour division of day or night assigned to a planetary ruler, used in astrological timing and in some historical horary considerations.',
   'time rulers','reviewed',
   'Lilly explicitly provides planetary-hour tables. Keep the concept distinct from a modern equal sixty-minute clock hour.',
   'technical',5),
  ('lord-of-the-hour','Lord of the Hour',
   'The planet assigned as ruler of the planetary hour in which an event, question, or chart time occurs.',
   'time rulers','reviewed',
   'Source-backed in Lilly. This is the planetary ruler of a planetary hour, not a general synonym for any time-lord.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Radical Figure','English','source-derived-variant','A chart or figure described as radical / fit to be judged.'
FROM terms WHERE slug='radicality';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Radical Chart','English','modern-navigation-variant','Common modern wording for a horary figure considered radical.'
FROM terms WHERE slug='radicality';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hour Ruler','English','name-variant','Plain-English variant of Lord of the Hour.'
FROM terms WHERE slug='lord-of-the-hour';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Planetary Hour Ruler','English','expanded-variant','Clarifying form for the planet ruling a planetary hour.'
FROM terms WHERE slug='lord-of-the-hour';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly calls a horary figure radical or capable of judgment and gives as one criterion a correspondence between the Lord of the Hour and the Lord of the Ascendant by identity, triplicity, or planetary nature. This directly attests radicality as a historical horary concept while also showing that the specific test belongs to Lilly’s methodological context.',
       'Book II, pp. 142-143: radical figure',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='radicality' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II, pp. 142-143: radical figure'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       CASE t.slug
         WHEN 'planetary-hour' THEN 'Lilly explicitly provides tables of planetary hours and instructions for identifying which planet rules an hour of day or night, directly attesting the planetary-hour system as technical vocabulary.'
         ELSE 'Lilly repeatedly uses the Lord of the Hour as the planet ruling the relevant planetary hour, including within his considerations of whether a horary figure is radical.'
       END,
       CASE t.slug
         WHEN 'planetary-hour' THEN 'Book III, pp. 474-482: planetary-hour tables'
         ELSE 'Book II, pp. 142-143: Lord of the Hour'
       END,
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug IN ('planetary-hour','lord-of-the-hour') AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
      AND i.scope=CASE t.slug
        WHEN 'planetary-hour' THEN 'Book III, pp. 474-482: planetary-hour tables'
        ELSE 'Book II, pp. 142-143: Lord of the Hour'
      END
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND (
    (t.slug='radicality' AND sp.section='Considerations before Judgment — radical figure') OR
    (t.slug='lord-of-the-hour' AND sp.section='Considerations before Judgment — radical figure') OR
    (t.slug='planetary-hour' AND sp.section='Planetary-hour tables')
  );

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Radicality is a historical horary concept describing whether a figure is considered fit or capable of judgment. Different authors and traditions can frame that fitness differently, so the term should not be reduced to one universal checklist.',
  'reviewed','Terminology article only; no procedural considerations checklist.'
FROM terms WHERE slug='radicality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly','Lilly’s use',
  'Lilly describes a question as radical when the figure is fit to be judged and gives a correspondence between the Lord of the Hour and the Lord of the Ascendant as one test. His formulation is historically important, but the encyclopedia records it as Lilly’s criterion rather than defining all horary radicality by that single rule.',10,'reviewed',NULL
FROM terms WHERE slug='radicality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-validity','Not a truth guarantee',
  'Radicality concerns whether a chart is regarded as appropriately rooted or fit for judgment within a technical tradition. It is not the same thing as proving that an interpretation is correct, nor is it a generic label for a chart that happens to give a convincing answer.',20,'reviewed',NULL
FROM terms WHERE slug='radicality';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Planetary Hour is one of the traditional day or night time divisions assigned to the seven classical planets. Because the length of daylight and darkness changes through the year, planetary hours are historically unequal or seasonal hours rather than fixed sixty-minute units.',
  'reviewed','Reader-facing definition; calculation procedure intentionally kept minimal.'
FROM terms WHERE slug='planetary-hour';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'unequal','Unequal hours',
  'The daylight interval and the nighttime interval are each divided into twelve planetary hours. Their clock duration therefore varies with season and latitude. The term “hour” here names a proportional temporal division, not necessarily sixty modern minutes.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-hour';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ruler','Planetary ruler',
  'Each planetary hour has a planetary ruler, called the Lord of the Hour. That ruler is a time assignment and should not be confused with broader time-lord systems such as annual profections, firdaria or distributions.',20,'reviewed',NULL
FROM terms WHERE slug='planetary-hour';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lord of the Hour is the planet ruling the planetary hour in which the relevant time falls. Lilly uses the term directly and employs the hour ruler in several technical contexts, including his discussion of whether a horary figure is radical.',
  'reviewed','Keep separate from generic time-lord vocabulary.'
FROM terms WHERE slug='lord-of-the-hour';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','A specific kind of time ruler',
  'The Lord of the Hour rules one planetary hour. It is therefore narrower than the general concept of a time-lord and should not be confused with the Lord of the Year, a firdaria ruler, a distributor or other longer-period rulers.',10,'reviewed',NULL
FROM terms WHERE slug='lord-of-the-hour';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses','Lilly uses the Lord of the Hour in one of his radicality criteria.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radicality' AND b.slug='lord-of-the-hour';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'has-ruler','Each planetary hour has a planetary ruler, the Lord of the Hour.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-hour' AND b.slug='lord-of-the-hour';
