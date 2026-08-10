-- Complete Dorothean triplicity-ruler reference for the composite dignity overview.
--
-- This is intentionally separate from Lilly's two-ruler triplicity scheme. The
-- Dorothean system uses a day ruler, a night ruler, and a third participating /
-- cooperating ruler for each elemental triplicity.
--
-- Bibliographic witness: Dorotheus of Sidon, Carmen Astrologicum, trans. David
-- Pingree. Normalized ruler assignments are stored here; no copyrighted prose is
-- reproduced.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO authors
  (slug,name,original_name,historical_layer,notes)
VALUES
  ('dorotheus-of-sidon','Dorotheus of Sidon',NULL,'Hellenistic',
   'First-century astrologer whose Carmen Astrologicum is a major witness for sect-ordered triplicity rulers.');

INSERT OR IGNORE INTO works
  (author_id,slug,title,original_title,composition_year_start,composition_year_end,language,notes,corpus_status)
SELECT id,'dorotheus-carmen-astrologicum','Carmen Astrologicum',NULL,1,100,'Greek / transmitted through Middle Persian and Arabic',
       'Partial source onboarding for the triplicity-ruler reference system. No sequential extraction of the complete work is claimed.',
       'partial'
FROM authors WHERE slug='dorotheus-of-sidon';

INSERT OR IGNORE INTO editions
  (work_id,label,translator,publisher,publication_year,source_language,target_language,copyright_note,local_source_key)
SELECT id,
       'David Pingree English translation',
       'David Pingree',
       'Astrology Center of America',
       2005,
       'Arabic / Middle Persian transmission','English',
       'Bibliographic/source locator only. The repository stores normalized triplicity assignments, not translated prose.',
       'dorotheus-carmen-pingree'
FROM works WHERE slug='dorotheus-carmen-astrologicum';

INSERT OR IGNORE INTO reference_schemes
  (slug,label,domain,work_id,edition_id,status,notes)
SELECT 'dorothean-triplicity-rulers',
       'Dorothean triplicity rulers',
       'essential-dignity',
       w.id,e.id,'reviewed',
       'Three-ruler triplicity system: day ruler, night ruler, and participating/cooperating ruler. Kept separate from Lilly and Ptolemaic variants.'
FROM works w
JOIN editions e ON e.work_id=w.id
WHERE w.slug='dorotheus-carmen-astrologicum'
ORDER BY e.id
LIMIT 1;

-- sect_condition='any' is used here for the third participating/cooperating ruler,
-- which is not itself day- or night-specific. The note preserves that semantic.
WITH data(sign_slug,day_planet,night_planet,coop_planet) AS (VALUES
  ('aries','sun','jupiter','saturn'),
  ('leo','sun','jupiter','saturn'),
  ('sagittarius','sun','jupiter','saturn'),
  ('taurus','venus','moon','mars'),
  ('virgo','venus','moon','mars'),
  ('capricorn','venus','moon','mars'),
  ('gemini','saturn','mercury','jupiter'),
  ('libra','saturn','mercury','jupiter'),
  ('aquarius','saturn','mercury','jupiter'),
  ('cancer','venus','mars','moon'),
  ('scorpio','venus','mars','moon'),
  ('pisces','venus','mars','moon')
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,sequence_no,note)
SELECT rs.id,s.id,p.id,'triplicity',x.sect_condition,0,30,x.sequence_no,x.note
FROM data d
JOIN reference_schemes rs ON rs.slug='dorothean-triplicity-rulers'
JOIN terms s ON s.slug=d.sign_slug
JOIN (
  SELECT 'day' AS sect_condition,1 AS sequence_no,'Day ruler' AS note
  UNION ALL SELECT 'night',2,'Night ruler'
  UNION ALL SELECT 'any',3,'Participating / cooperating ruler'
) x
JOIN terms p ON p.slug=CASE x.sect_condition
  WHEN 'day' THEN d.day_planet
  WHEN 'night' THEN d.night_planet
  ELSE d.coop_planet
END;

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'triplicity-scheme-variation','Triplicity rulers depend on the named historical scheme',
       'The encyclopedia keeps Dorothean and Lilly triplicity rulership separate. The Dorothean system uses day, night, and participating rulers for each elemental triplicity; Lilly’s table uses a different two-ruler arrangement and assigns Mars to the watery triplicity by both day and night. Reference tables must therefore identify which scheme supplies the triplicity column.',
       7,'reviewed','Added with the composite dignity overview so source variants are not silently merged.'
FROM terms WHERE slug='essential-dignity';
