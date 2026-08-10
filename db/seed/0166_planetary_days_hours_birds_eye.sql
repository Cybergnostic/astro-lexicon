-- Bird's-eye encyclopedia review: planetary days and hours.
--
-- Direct project witness: William Lilly, Christian Astrology, planetary-hour tables and
-- discussion on pp. 474-482. The weekday rulerships and repeating seven-planet hour order
-- are stored as named Lilly reference sequences rather than as an unlabeled universal table.
--
-- The hour cycle follows the traditional Saturn -> Jupiter -> Mars -> Sun -> Venus ->
-- Mercury -> Moon order, repeated continuously. The first planetary hour after sunrise
-- gives the planetary ruler of the weekday in Lilly's presentation.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('planetary-day','Planetary Day',
   'A weekday assigned to one of the seven traditional planets, with the day ruler matching the ruler of the first planetary hour after sunrise in the planetary-hour system represented by Lilly.',
   'time rulers','reviewed',
   'Bird’s-eye planetary-time review. Current structured sequence is explicitly Lilly’s presentation; later or different traditions can be added as separate named sequences.',
   'technical',5);

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'474','482','Book III',NULL,'Planetary days and hour sequence',
       'Book III, pp. 474-482: planetary-hour tables and the relationship of the seven planets to the days and planetary hours.',
       NULL,
       'Direct source window for the named Lilly planetary day/hour sequence. Structured rows below preserve the correspondences without copying table layout or prose.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Planetary days and hour sequence'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Lilly assigns the seven weekdays to the seven traditional planets: Sunday to the Sun, Monday to the Moon, Tuesday to Mars, Wednesday to Mercury, Thursday to Jupiter, Friday to Venus and Saturday to Saturn. The weekday ruler also rules the first planetary hour after sunrise.',
  'Book III, pp. 474-482: planetary days and hours','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-day' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III, pp. 474-482: planetary days and hours'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='planetary-day'
  AND w.slug='lilly-christian-astrology'
  AND sp.section='Planetary days and hour sequence';

-- Update the existing planetary-hour account so the family relation is explicit.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'day-relation','How the weekday ruler and hour ruler connect',
  'In Lilly’s planetary-hour system the planet ruling the first unequal hour after sunrise is also the ruler of that weekday. The hour rulers then continue through a repeating seven-planet sequence. Because twenty-four hours do not divide evenly by seven, the next sunrise falls three positions farther along the repeating cycle, producing the familiar succession of weekday rulers.',25,'reviewed',
  'Bird’s-eye planetary-time explanation. Current sequence is source-labelled to Lilly.'
FROM terms WHERE slug='planetary-hour';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Planetary Day is a weekday assigned to one of the seven traditional planets. In Lilly’s presentation the day ruler is also the ruler of the first planetary hour after sunrise. The planetary hours then proceed through their repeating seven-planet order, so the weekday sequence emerges from the interaction between a seven-step ruler cycle and the twenty-four unequal hours of each full day and night.',
  'reviewed','Bird’s-eye planetary-time article. Current structured sequence is Lilly-specific.'
FROM terms WHERE slug='planetary-day';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-clock-day','A ruler of the weekday, not a new calendar length',
  'Planetary day names a planetary rulership assigned to an ordinary weekday. It does not create a different length of civil day. The unequal-hour doctrine instead divides daylight and nighttime separately into twelve seasonal hours, whose clock duration varies through the year.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-day';

-- Named Lilly sequences.
INSERT OR REPLACE INTO planetary_time_sequences
  (slug,label,sequence_kind,work_id,edition_id,notes,status)
SELECT 'lilly-planetary-hour-cycle',
       'Lilly planetary-hour ruler cycle',
       'hour-cycle',w.id,e.id,
       'Repeating seven-planet sequence used for planetary-hour rulership. This sequence is related to the traditional outer-to-inner planetary order but is stored independently because it is a temporal ruler cycle.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='lilly-christian-astrology'
ORDER BY e.id LIMIT 1;

INSERT OR REPLACE INTO planetary_time_sequences
  (slug,label,sequence_kind,work_id,edition_id,notes,status)
SELECT 'lilly-planetary-weekday-cycle',
       'Lilly planetary weekday rulers',
       'weekday-cycle',w.id,e.id,
       'Weekday ruler sequence beginning with Sunday. Day ruler matches ruler of the first planetary hour after sunrise.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='lilly-christian-astrology'
ORDER BY e.id LIMIT 1;

WITH data(seq,key,label,planet_slug) AS (VALUES
  (1,'saturn','Saturn','saturn'),
  (2,'jupiter','Jupiter','jupiter'),
  (3,'mars','Mars','mars'),
  (4,'sun','Sun','sun'),
  (5,'venus','Venus','venus'),
  (6,'mercury','Mercury','mercury'),
  (7,'moon','Moon','moon')
)
INSERT OR REPLACE INTO planetary_time_sequence_steps
  (sequence_id,sequence_no,step_key,step_label,planet_term_id,note)
SELECT s.id,d.seq,d.key,d.label,p.id,
       'Repeating planetary-hour ruler order in the Lilly sequence.'
FROM data d
JOIN planetary_time_sequences s ON s.slug='lilly-planetary-hour-cycle'
JOIN terms p ON p.slug=d.planet_slug;

WITH data(seq,key,label,planet_slug) AS (VALUES
  (1,'sunday','Sunday','sun'),
  (2,'monday','Monday','moon'),
  (3,'tuesday','Tuesday','mars'),
  (4,'wednesday','Wednesday','mercury'),
  (5,'thursday','Thursday','jupiter'),
  (6,'friday','Friday','venus'),
  (7,'saturday','Saturday','saturn')
)
INSERT OR REPLACE INTO planetary_time_sequence_steps
  (sequence_id,sequence_no,step_key,step_label,planet_term_id,note)
SELECT s.id,d.seq,d.key,d.label,p.id,
       'Weekday and planetary ruler in Lilly’s planetary-day presentation.'
FROM data d
JOIN planetary_time_sequences s ON s.slug='lilly-planetary-weekday-cycle'
JOIN terms p ON p.slug=d.planet_slug;

-- Both sequences are useful on the day/hour pages; the hour-ruler page needs the hour cycle.
INSERT OR REPLACE INTO term_planetary_time_sequences (term_id,sequence_id,relation_role,note)
SELECT t.id,s.id,'reference','Planetary Hour page displays the repeating planetary ruler cycle.'
FROM terms t CROSS JOIN planetary_time_sequences s
WHERE t.slug='planetary-hour' AND s.slug='lilly-planetary-hour-cycle';

INSERT OR REPLACE INTO term_planetary_time_sequences (term_id,sequence_id,relation_role,note)
SELECT t.id,s.id,'comparison','Planetary Hour page also shows the weekday sequence generated by the first-hour rulers.'
FROM terms t CROSS JOIN planetary_time_sequences s
WHERE t.slug='planetary-hour' AND s.slug='lilly-planetary-weekday-cycle';

INSERT OR REPLACE INTO term_planetary_time_sequences (term_id,sequence_id,relation_role,note)
SELECT t.id,s.id,'reference','Planetary Day page shows the weekday rulers.'
FROM terms t CROSS JOIN planetary_time_sequences s
WHERE t.slug='planetary-day' AND s.slug='lilly-planetary-weekday-cycle';

INSERT OR REPLACE INTO term_planetary_time_sequences (term_id,sequence_id,relation_role,note)
SELECT t.id,s.id,'mechanism','Planetary Day page shows the underlying repeating hour order from which the next day ruler emerges.'
FROM terms t CROSS JOIN planetary_time_sequences s
WHERE t.slug='planetary-day' AND s.slug='lilly-planetary-hour-cycle';

INSERT OR REPLACE INTO term_planetary_time_sequences (term_id,sequence_id,relation_role,note)
SELECT t.id,s.id,'reference','Lord of the Hour is selected from the repeating planetary-hour ruler cycle.'
FROM terms t CROSS JOIN planetary_time_sequences s
WHERE t.slug='lord-of-the-hour' AND s.slug='lilly-planetary-hour-cycle';

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('planetary-days-hours','Planetary Days and Hours',
   'The source-backed temporal rulership family connecting weekday rulers, unequal planetary hours and the Lord of the Hour.',
   'historical-system',
   'Current structured sequences are Lilly-specific. Do not merge this automatically with longer-period time-lord systems such as Firdaria or annual profections.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('planetary-day','day-rulership','Day rulership',10,'One of the seven weekdays assigned to a planetary ruler.'),
  ('planetary-hour','hour-system','Hour system',20,'Daylight and nighttime are each divided into twelve unequal planetary hours.'),
  ('lord-of-the-hour','hour-role','Hour ruler',30,'Planet ruling the particular planetary hour.'),
  ('planetary-order','related-order','Related cosmological order',40,'The temporal hour cycle is historically related to planetary ordering but is not identical with the Moon-to-Saturn Earth-outward sequence.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='planetary-days-hours'
JOIN terms t ON t.slug=m.term_slug;

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('planetary-day','planetary-hour','defined-through-first-hour','In Lilly’s system the weekday ruler also rules the first planetary hour after sunrise.'),
  ('planetary-hour','lord-of-the-hour','has-ruler','Each planetary hour has a planetary ruler.'),
  ('planetary-hour','planetary-order','historically-related-order','The hour cycle uses a seven-planet order related to inherited planetary ordering, but it is a temporal sequence rather than the Earth-outward sphere order.'),
  ('planetary-day','seven-planets','assigns-rulership-among','The seven weekdays are distributed among the seven traditional planets.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms a ON a.slug=r.subject_slug
JOIN terms b ON b.slug=r.object_slug;
