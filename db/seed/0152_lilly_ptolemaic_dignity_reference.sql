-- Bird's-eye reference pass: normalize Lilly's complete essential-dignity table.
--
-- Source: Christian Astrology, Book I, table titled
-- "A TABLE OF THE ESSENTIAL DIGNITIES OF THE PLANETS ACCORDING TO PTOLOMY".
-- The scheme is source-bound to Lilly's presentation; it is not asserted to be the
-- only historical dignity scheme. Degree ranges are stored as half-open zodiacal
-- intervals [start,end). exact_degree_number preserves Lilly's traditional ordinal
-- exaltation/fall degree labels (e.g. Sun: 19th degree of Aries).

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'150','150','Book I',NULL,'Table of Essential Dignities according to Ptolomy',
       'Lilly presents one table containing houses, exaltations, day/night triplicity rulers, planetary terms, faces, detriments and falls.',
       NULL,
       'Direct table witness. Values are normalized below for reusable reference data; no table image or copyrighted facsimile is stored in the repository.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Table of Essential Dignities according to Ptolomy'
  );

INSERT OR IGNORE INTO reference_schemes
  (slug,label,domain,work_id,edition_id,status,notes)
SELECT 'lilly-ptolemaic-essential-dignities',
       'Lilly — Essential Dignities according to Ptolemy',
       'essential-dignity',
       w.id,e.id,'reviewed',
       'Normalized from Lilly’s Book I dignity table. Keep source-specific: other historical term/bound and triplicity systems may differ.'
FROM works w
JOIN editions e ON e.work_id=w.id
WHERE w.slug='lilly-christian-astrology'
ORDER BY e.id
LIMIT 1;

-- Whole-sign domicile rulership.
WITH data(sign_slug,planet_slug) AS (VALUES
  ('aries','mars'),('taurus','venus'),('gemini','mercury'),('cancer','moon'),
  ('leo','sun'),('virgo','mercury'),('libra','venus'),('scorpio','mars'),
  ('sagittarius','jupiter'),('capricorn','saturn'),('aquarius','saturn'),('pisces','jupiter')
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end)
SELECT rs.id,s.id,p.id,'domicile','any',0,30
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Whole-sign detriment/exile.
WITH data(sign_slug,planet_slug) AS (VALUES
  ('aries','venus'),('taurus','mars'),('gemini','jupiter'),('cancer','saturn'),
  ('leo','saturn'),('virgo','jupiter'),('libra','mars'),('scorpio','venus'),
  ('sagittarius','mercury'),('capricorn','moon'),('aquarius','sun'),('pisces','mercury')
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end)
SELECT rs.id,s.id,p.id,'detriment','any',0,30
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Exaltations and their traditional degree numbers in Lilly's table.
WITH data(sign_slug,planet_slug,degree_no) AS (VALUES
  ('aries','sun',19),('taurus','moon',3),('cancer','jupiter',15),
  ('virgo','mercury',15),('libra','saturn',21),('capricorn','mars',28),('pisces','venus',27)
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,exact_degree_number)
SELECT rs.id,s.id,p.id,'exaltation','any',0,30,d.degree_no
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Falls: opposite sign and corresponding traditional degree number.
WITH data(sign_slug,planet_slug,degree_no) AS (VALUES
  ('libra','sun',19),('scorpio','moon',3),('capricorn','jupiter',15),
  ('pisces','mercury',15),('aries','saturn',21),('cancer','mars',28),('virgo','venus',27)
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,exact_degree_number)
SELECT rs.id,s.id,p.id,'fall','any',0,30,d.degree_no
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Lilly's day/night triplicity rulers.
WITH data(sign_slug,planet_slug,sect) AS (VALUES
  ('aries','sun','day'),('leo','sun','day'),('sagittarius','sun','day'),
  ('aries','jupiter','night'),('leo','jupiter','night'),('sagittarius','jupiter','night'),
  ('taurus','venus','day'),('virgo','venus','day'),('capricorn','venus','day'),
  ('taurus','moon','night'),('virgo','moon','night'),('capricorn','moon','night'),
  ('gemini','saturn','day'),('libra','saturn','day'),('aquarius','saturn','day'),
  ('gemini','mercury','night'),('libra','mercury','night'),('aquarius','mercury','night'),
  ('cancer','mars','any'),('scorpio','mars','any'),('pisces','mars','any')
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end)
SELECT rs.id,s.id,p.id,'triplicity',d.sect,0,30
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Ptolemaic terms/bounds as printed by Lilly.  Endpoints mark where rulership transfers.
WITH data(sign_slug,planet_slug,d0,d1,seq) AS (VALUES
  ('aries','jupiter',0,6,1),('aries','venus',6,14,2),('aries','mercury',14,21,3),('aries','mars',21,26,4),('aries','saturn',26,30,5),
  ('taurus','venus',0,8,1),('taurus','mercury',8,15,2),('taurus','jupiter',15,22,3),('taurus','saturn',22,26,4),('taurus','mars',26,30,5),
  ('gemini','mercury',0,7,1),('gemini','jupiter',7,14,2),('gemini','venus',14,21,3),('gemini','mars',21,25,4),('gemini','saturn',25,30,5),
  ('cancer','mars',0,6,1),('cancer','jupiter',6,13,2),('cancer','mercury',13,20,3),('cancer','venus',20,27,4),('cancer','saturn',27,30,5),
  ('leo','jupiter',0,6,1),('leo','venus',6,13,2),('leo','saturn',13,19,3),('leo','mercury',19,25,4),('leo','mars',25,30,5),
  ('virgo','mercury',0,7,1),('virgo','venus',7,13,2),('virgo','jupiter',13,18,3),('virgo','saturn',18,24,4),('virgo','mars',24,30,5),
  ('libra','saturn',0,6,1),('libra','mercury',6,11,2),('libra','jupiter',11,19,3),('libra','venus',19,24,4),('libra','mars',24,30,5),
  ('scorpio','mars',0,6,1),('scorpio','jupiter',6,14,2),('scorpio','venus',14,21,3),('scorpio','mercury',21,27,4),('scorpio','saturn',27,30,5),
  ('sagittarius','jupiter',0,8,1),('sagittarius','venus',8,14,2),('sagittarius','mercury',14,19,3),('sagittarius','saturn',19,25,4),('sagittarius','mars',25,30,5),
  ('capricorn','venus',0,6,1),('capricorn','mercury',6,12,2),('capricorn','jupiter',12,19,3),('capricorn','mars',19,25,4),('capricorn','saturn',25,30,5),
  ('aquarius','saturn',0,6,1),('aquarius','mercury',6,12,2),('aquarius','venus',12,20,3),('aquarius','jupiter',20,25,4),('aquarius','mars',25,30,5),
  ('pisces','venus',0,8,1),('pisces','jupiter',8,14,2),('pisces','mercury',14,20,3),('pisces','mars',20,26,4),('pisces','saturn',26,30,5)
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,sequence_no)
SELECT rs.id,s.id,p.id,'term','any',d.d0,d.d1,d.seq
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Faces/decans: three 10-degree rulers per sign.
WITH data(sign_slug,planet_slug,d0,d1,seq) AS (VALUES
  ('aries','mars',0,10,1),('aries','sun',10,20,2),('aries','venus',20,30,3),
  ('taurus','mercury',0,10,1),('taurus','moon',10,20,2),('taurus','saturn',20,30,3),
  ('gemini','jupiter',0,10,1),('gemini','mars',10,20,2),('gemini','sun',20,30,3),
  ('cancer','venus',0,10,1),('cancer','mercury',10,20,2),('cancer','moon',20,30,3),
  ('leo','saturn',0,10,1),('leo','jupiter',10,20,2),('leo','mars',20,30,3),
  ('virgo','sun',0,10,1),('virgo','venus',10,20,2),('virgo','mercury',20,30,3),
  ('libra','moon',0,10,1),('libra','saturn',10,20,2),('libra','jupiter',20,30,3),
  ('scorpio','mars',0,10,1),('scorpio','sun',10,20,2),('scorpio','venus',20,30,3),
  ('sagittarius','mercury',0,10,1),('sagittarius','moon',10,20,2),('sagittarius','saturn',20,30,3),
  ('capricorn','jupiter',0,10,1),('capricorn','mars',10,20,2),('capricorn','sun',20,30,3),
  ('aquarius','venus',0,10,1),('aquarius','mercury',10,20,2),('aquarius','moon',20,30,3),
  ('pisces','saturn',0,10,1),('pisces','jupiter',10,20,2),('pisces','mars',20,30,3)
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,sequence_no)
SELECT rs.id,s.id,p.id,'face','any',d.d0,d.d1,d.seq
FROM data d
JOIN reference_schemes rs ON rs.slug='lilly-ptolemaic-essential-dignities'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

-- Standard Unicode astrological glyphs. These are text symbols, not copied images.
WITH data(term_slug,symbol_text,label) AS (VALUES
  ('sun','☉','Sun glyph'),('moon','☽','Moon glyph'),('mercury','☿','Mercury glyph'),
  ('venus','♀','Venus glyph'),('mars','♂','Mars glyph'),('jupiter','♃','Jupiter glyph'),('saturn','♄','Saturn glyph'),
  ('aries','♈','Aries glyph'),('taurus','♉','Taurus glyph'),('gemini','♊','Gemini glyph'),('cancer','♋','Cancer glyph'),
  ('leo','♌','Leo glyph'),('virgo','♍','Virgo glyph'),('libra','♎','Libra glyph'),('scorpio','♏','Scorpio glyph'),
  ('sagittarius','♐','Sagittarius glyph'),('capricorn','♑','Capricorn glyph'),('aquarius','♒','Aquarius glyph'),('pisces','♓','Pisces glyph')
)
INSERT OR IGNORE INTO term_symbols (term_id,symbol_system,symbol_text,label,is_primary,notes)
SELECT t.id,'astrological-unicode',d.symbol_text,d.label,1,'Unicode astrological symbol for navigation and visual reference.'
FROM data d JOIN terms t ON t.slug=d.term_slug;

-- Strengthen the Essential Dignity article with an explicit whole-system explanation.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'reference-system','Essential dignity is a complete zodiacal rulership system',
       'Essential dignity is not only domicile and exaltation. In Lilly’s Ptolemaic table, every zodiacal degree can be read through several simultaneous rulers: sign or domicile, exaltation where one exists, sect-dependent triplicity, term or bound, and face or decan. Detriment and fall describe corresponding essential debilities. The normalized reference data attached to this entry preserves those layers separately so the same scheme can also be shown from the perspective of each planet and each sign.',
       5,'reviewed','Bird’s-eye pass: make the complete reference architecture explicit before individual dignity explanations.'
FROM terms WHERE slug='essential-dignity';
