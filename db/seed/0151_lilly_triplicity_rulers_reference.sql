-- Final P0/P1 cleanup: source-bind the Triplicity Rulers reference table.
--
-- Lilly's scheme is recorded as Lilly's historical scheme, not as a universal table for
-- every traditional author. This closes a deliberately deferred presentation gap.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'78','101','Book I',NULL,'Triplicity rulers in planetary chapters',
       'Lilly assigns Saturn to the airy triplicity by day, Mercury to the airy triplicity by night, Venus to the earthy triplicity by day, the Moon to it by night, the Sun to the fiery triplicity by day, Jupiter to it by night, and Mars to the watery triplicity both day and night.',
       NULL,
       'Synthesized locator from Lilly planetary chapters; no extended quotation stored. This records Lilly’s own scheme only.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Triplicity rulers in planetary chapters'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly uses sect-dependent triplicity rulership: Sun/Jupiter for the fiery triplicity by day/night; Venus/Moon for the earthy triplicity by day/night; Saturn/Mercury for the airy triplicity by day/night; and Mars for the watery triplicity both day and night. This is presented as Lilly’s historical scheme rather than a universal traditional table.',
       'Book I planetary chapters: triplicity rulership scheme',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE (t.label='Triplicity Rulers' OR t.slug IN ('triplicity-rulers','triplicity-ruler'))
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I planetary chapters: triplicity rulership scheme'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE (t.label='Triplicity Rulers' OR t.slug IN ('triplicity-rulers','triplicity-ruler'))
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book I planetary chapters: triplicity rulership scheme'
  AND sp.section='Triplicity rulers in planetary chapters';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,
       'lilly-triplicity-rulers',
       'Triplicity rulers in Lilly',
       'Lilly’s Book I scheme. Other historical authors and traditions can preserve different triplicity-ruler systems, so this table is source-specific rather than universal.',
       '["Triplicity","Signs","Day ruler","Night ruler"]',
       '[["Fire","Aries, Leo, Sagittarius","Sun","Jupiter"],["Earth","Taurus, Virgo, Capricorn","Venus","Moon"],["Air","Gemini, Libra, Aquarius","Saturn","Mercury"],["Water","Cancer, Scorpio, Pisces","Mars","Mars"]]',
       40,'reviewed',
       'Directly tied to Lilly planetary chapters. Do not generalize this table across all traditional source traditions.'
FROM terms
WHERE label='Triplicity Rulers' OR slug IN ('triplicity-rulers','triplicity-ruler');

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-variation','Source variation',
       'Triplicity rulership is not safest treated as one timeless universal table. Lilly’s assignments provide one clearly documented early-modern scheme, while other authors and textual traditions may organize triplicity rulers differently or preserve additional participating rulers. The encyclopedia therefore attaches ruler tables to named source traditions when possible.',
       35,'reviewed','Final article-quality clarification: source-specific table policy.'
FROM terms
WHERE label='Triplicity Rulers' OR slug IN ('triplicity-rulers','triplicity-ruler');
