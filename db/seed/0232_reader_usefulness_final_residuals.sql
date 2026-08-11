-- Reader usefulness final residual content pass.
-- Adds exact source-backed numerical structures and the one genuinely thin decan entry.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- PLANETARY YEARS — exact Abū Maʿshar Part VII, Chapter 8 values.
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-years')
  AND table_key='abu-mashar-planetary-years';

INSERT INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'abu-mashar-planetary-years','Planetary years in Abū Maʿshar',
  'Abū Maʿshar distinguishes four classes of planetary years. These figures belong to his transmitted table and should not be treated as one universal predictive rule detached from the procedure in which they are used.',
  '["Planet","Greatest","Great","Middle","Small"]',
  '[["Sun","1461","120","39½","19"],["Venus","1151","82","45","8"],["Mercury","480","76","48","20"],["Moon","520","108","39½","25"],["Saturn","265","57","43½","30"],["Jupiter","427","79","45½","12"],["Mars","284","66","40½","15"]]',
  25,'reviewed','Exact values recovered from Abū Maʿshar, Great Introduction VII.8.3. Textual witnesses preserve variants for some values; the main translated reading is used here.'
FROM terms WHERE slug='planetary-years';

-- -----------------------------------------------------------------------------
-- PLANETARY RECURRENCE — Antiochus §51 longest recurrences.
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Recurrence is Antiochus’ name for a long return period associated with each of the seven planets. These recurrence values are not the same thing as the ordinary small, middle or great planetary-year allocations: they describe much longer cyclical returns, and Antiochus also places them beside an immense combined recurrence of all seven wandering stars.',
  'reviewed','Reader-usefulness final pass: expose Antiochus §51 recurrence structure without turning it into a universal timing rule.'
FROM terms WHERE slug='planetary-recurrence';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-recurrence');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-recurrence');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-years','A recurrence is not an ordinary planetary-year value',
  'The technical point is the scale and function of the number. Antiochus gives these as the longest recurrences of the seven planets, separately from the ordinary classes of planetary years. A recurrence value therefore identifies a long cyclical return associated with a planet; it should not be substituted automatically for a small, middle, great or other year-value used in a different procedure.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-recurrence';

INSERT INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'antiochus-recurrences','Longest planetary recurrences in Antiochus',
  'The values below reproduce the seven planetary recurrence periods given in Thesaurus §51.',
  '["Planet","Longest recurrence (years)"]',
  '[["Saturn","265"],["Jupiter","427"],["Mars","284"],["Sun","1461"],["Venus","1151"],["Mercury","480"],["Moon","25"]]',
  20,'reviewed','Exact §51 catalogue. The separate cosmic recurrence is intentionally not folded into the seven-planet table.'
FROM terms WHERE slug='planetary-recurrence';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'relation-to-greatest-years','Relation to the greatest-year tradition',
  'For the six non-lunar entries in this catalogue, the numbers correspond to values also transmitted as greatest planetary years in other sources. The Moon is a warning against flattening the traditions mechanically: Antiochus gives 25 years in this recurrence catalogue, while Abū Maʿshar’s greatest lunar year is 520. The label and source context therefore matter as much as the number itself.',30,'reviewed','Cross-source clarification based on the reviewed Antiochus and Abū Maʿshar evidence.'
FROM terms WHERE slug='planetary-recurrence';

-- -----------------------------------------------------------------------------
-- FIGURE ASCENDING IN A DECAN — convert definition-only entry into a useful article.
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Figure Ascending in a Decan is an inherited symbolic image assigned to one of the thirty-six ten-degree decans. The figure expresses indications attached to that decan in a particular tradition. It should not automatically be read as a literal constellation occupying the same patch of sky: Abū Maʿshar explicitly distinguishes doctrinal decan figures from stellar constellations whose actual rising positions change over long periods.',
  'reviewed','Reader-usefulness final pass from Abū Maʿshar VI.1.'
FROM terms WHERE slug='decan-figure';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='decan-figure');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'what-it-is','A symbolic image attached to a decan',
  'Each zodiacal sign contains three decans, making thirty-six in the zodiac. Historical traditions assign figures or images to these decans and use them to express the decan’s proper indications. The figure is therefore part of a symbolic decan catalogue: recognizing the concept means identifying an image doctrinally assigned to a ten-degree division, not merely spotting a group of stars.',10,'reviewed',NULL
FROM terms WHERE slug='decan-figure';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-constellation','Not the same thing as a stellar constellation',
  'Abū Maʿshar separates inherited decan figures from actual constellations that rise with parts of the zodiac. Stellar positions shift relative to the tropical zodiac over centuries, whereas a symbolic decan figure remains assigned to its doctrinal decan. This distinction prevents a traditional image catalogue from being mistaken for a literal map of fixed star shapes.',20,'reviewed',NULL
FROM terms WHERE slug='decan-figure';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'multiple-traditions','Several image traditions were transmitted',
  'Abū Maʿshar preserves material associated with Persian, Babylonian, Egyptian, Indian and Ptolemaic streams. Their presence does not imply that every catalogue is identical. The stable concept is the assignment of a symbolic figure to a decan; the particular figure and its delineation depend on the historical scheme being followed.',30,'reviewed',NULL
FROM terms WHERE slug='decan-figure';
