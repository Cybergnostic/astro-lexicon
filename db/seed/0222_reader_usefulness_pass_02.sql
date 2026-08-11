-- Reader usefulness pass 02: useful completeness, sequence exposure, and examples.
--
-- This batch addresses three reader-identified defects without changing the underlying
-- historical evidence layer: Affliction needs its actual conditions made visible,
-- Alfridary needs its period order exposed, and Almuguea needs concrete examples of
-- its domicile-distance rule.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- AFFLICTION
-- -----------------------------------------------------------------------------
UPDATE terms
SET short_definition = 'Affliction is an umbrella term for conditions that harm, impede, weaken, or compromise a planet or significator. It can arise through hostile planetary contact, destructive enclosure or application, opposition, or dependence on a badly placed ruler rather than from one single aspect or debility.'
WHERE slug='affliction';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Affliction means that a planet or significator is being harmed, impeded, or placed under conditions that reduce its ability to act well. It is not one single configuration. A planet can be afflicted through hostile rays from malefics, enclosure, application or contact with a destructive planet, opposition, or through being ruled by a planet that is itself badly placed. The term therefore works as a broad diagnosis of adverse condition whose exact cause should be stated.',
  'reviewed',
  'Reader-usefulness revision centered on the reviewed Antiochus affliction catalogue; teach the umbrella category by enumerating its principal conditions.'
FROM terms WHERE slug='affliction';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='affliction');
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='affliction');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'umbrella','An umbrella condition, not one aspect',
  'Calling a planet afflicted does not by itself tell the reader what is wrong with it. The useful statement is the cause of the affliction: for example, that the planet is struck by malefic rays, enclosed, applying to or contacting a destroyer, opposed, or dependent on a ruler that is badly situated. Affliction summarizes the adverse state; the underlying condition explains it.',10,'reviewed',NULL
FROM terms WHERE slug='affliction';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'affliction-conditions','Ways a planet can be afflicted',
  'The following conditions are explicitly included in the reviewed Antiochus definition. They are examples of the umbrella concept, not a claim that every later author uses an identical checklist.',
  '["Condition","What is happening"]',
  '[["Malefic rays","A malefic casts its rays upon the planet."],["Enclosure / containment","The planet is contained or enclosed in an adverse planetary situation."],["Application to a destroyer","The planet moves into application with a destructive planet."],["Contact with a destroyer","The planet comes into bodily or effective contact with a destructive planet."],["Opposition","The planet is placed in an opposed relation treated as afflicting in the definition."],["Badly placed ruler","The planet is ruled by a planet that is itself badly situated, including placement in places described as having no dealings."]]',
  20,'reviewed','Reader-facing enumeration from the reviewed Antiochus affliction passage.'
FROM terms WHERE slug='affliction';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'read-specific-cause','Always ask what is causing the affliction',
  'The word is most informative when followed by the actual condition. Two planets can both be described as afflicted for completely different reasons, and those reasons are not interchangeable. The lexicon therefore treats Affliction as the parent idea and keeps the particular mechanics—such as destructive contact, enclosure, or other adverse conditions—on their own terms where they have distinct recognition rules.',30,'reviewed',NULL
FROM terms WHERE slug='affliction';

-- -----------------------------------------------------------------------------
-- ALFRIDARY
-- -----------------------------------------------------------------------------
UPDATE terms
SET short_definition = 'Alfridary is a sequence of fixed seven-year planetary periods used by Lilly: a day nativity begins with the Sun and a night nativity with the Moon, after which the planets proceed in a fixed order.'
WHERE slug='alfridary';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Alfridary is a planetary period system in which the seven traditional planets govern successive seven-year spans. The sequence depends on sect. In a day nativity it begins with the Sun and proceeds through Venus, Mercury, Moon, Saturn, Jupiter, and Mars. In a night nativity it begins with the Moon and proceeds through Saturn, Jupiter, Mars, Sun, Venus, and Mercury. The order is part of the definition of the system and should be visible rather than left implicit.',
  'reviewed',
  'Reader-usefulness revision: expose the septennial order already represented by the reviewed Lilly doctrine; keep distinct from Firdaria/Fardar.'
FROM terms WHERE slug='alfridary';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='alfridary');
DELETE FROM term_article_tables
WHERE term_id=(SELECT id FROM terms WHERE slug='alfridary');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'seven-year-periods','Seven-year planetary periods',
  'Each planetary ruler governs a fixed span of seven years before rulership passes to the next planet in the sequence. The starting planet changes with a day or night nativity, so sect determines where the cycle begins.',10,'reviewed',NULL
FROM terms WHERE slug='alfridary';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'alfridary-orders','Planetary order',
  'The two septennial sequences differ by their starting point and order.',
  '["Period","Day nativity","Night nativity"]',
  '[["1","Sun","Moon"],["2","Venus","Saturn"],["3","Mercury","Jupiter"],["4","Moon","Mars"],["5","Saturn","Sun"],["6","Jupiter","Venus"],["7","Mars","Mercury"]]',
  20,'reviewed','Reader-facing sequence table for Lilly’s Alfridary.'
FROM terms WHERE slug='alfridary';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-firdaria','Not the same system as Firdaria',
  'Alfridary and Firdaria both organize life into planetary periods, but they are retained as different systems. Alfridary is defined here by its fixed seven-year planetary spans and the day/night orders shown above; the Firdaria/Fardar entry preserves its own sequence and subdivisions.',30,'reviewed',NULL
FROM terms WHERE slug='alfridary';

-- -----------------------------------------------------------------------------
-- ALMUGUEA / PROPER FACE
-- -----------------------------------------------------------------------------
UPDATE terms
SET short_definition = 'Almuguea, or Proper Face, occurs when a planet stands from the Sun or Moon at the same sign-distance and prescribed direction that the planet’s domicile stands from the luminary’s domicile.'
WHERE slug='almuguea';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Almuguea, also called Proper Face, reproduces the geometry of the domicile scheme around the Sun or Moon. A planet is in Almuguea when its distance in signs from a luminary matches the distance between the planet’s domicile and that luminary’s domicile, using the prescribed solar or lunar direction. This makes the rule easier to recognize as a repeated domicile pattern rather than as an unexplained special aspect.',
  'reviewed',
  'Reader-usefulness revision: keep the existing domicile-distance doctrine but add concrete recognition examples.'
FROM terms WHERE slug='almuguea';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='almuguea');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rule','The domicile-distance rule',
  'Start with the luminary’s domicile—Leo for the Sun or Cancer for the Moon—and compare it with the relevant domicile of the planet. Count the separation in signs. Almuguea occurs when the actual planet and luminary reproduce that same separation in the required direction. The relationship is therefore generated from domicile geometry; the aspect-like distance is the result of the rule, not its starting definition.',10,'reviewed',NULL
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'examples','Examples',
  'Mercury gives the simplest pattern: its domiciles lie one sign from the luminary domiciles in the corresponding solar and lunar halves, so Mercury can reproduce that one-sign separation around the actual luminary. For a concrete example, Mercury in Aquarius is in Almuguea with the Sun in Capricorn, and also with the Moon in Pisces. Venus gives a two-sign pattern: Venus in Aries is in Almuguea with the Sun in Aquarius or with the Moon in Gemini. These examples show why the condition can resemble an ordinary aspect while still being defined by the domicile pattern.',20,'reviewed',NULL
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'direction','Solar and lunar direction matters',
  'The same numerical distance is not enough on its own. The traditional construction preserves direction: the solar form is taken on the western or occidental side of the Sun, while the lunar form is taken on the eastern or oriental side of the Moon. Direction therefore belongs to the recognition rule.',30,'reviewed',NULL
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-ordinary-aspect','Why it is not merely an aspect',
  'Mercury’s pattern produces a one-sign separation, Venus a two-sign separation, and other planets reproduce larger domicile distances. Some of these distances coincide with familiar aspect intervals, but Almuguea is recognized because the planetary positions mirror the domiciles of the planet and luminary. An aspect distance by itself does not establish the condition.',40,'reviewed',NULL
FROM terms WHERE slug='almuguea';

-- -----------------------------------------------------------------------------
-- PAGE COMPOSITION
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('affliction','alfridary','almuguea'));

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'reader-usefulness','Understanding the concept',10,'reviewed','Reader usefulness pass 02.'
FROM terms WHERE slug IN ('affliction','alfridary','almuguea');

-- Affliction: explanation, table, then reading rule.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','umbrella','paragraph',0,10,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='affliction' AND ps.section_key='reader-usefulness';
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table','affliction-conditions','table',1,20,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='affliction' AND ps.section_key='reader-usefulness';
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','read-specific-cause','subsection',1,30,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='affliction' AND ps.section_key='reader-usefulness';

-- Alfridary: explanation, sequence table, distinction.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','seven-year-periods','paragraph',0,10,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='alfridary' AND ps.section_key='reader-usefulness';
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table','alfridary-orders','table',1,20,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='alfridary' AND ps.section_key='reader-usefulness';
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section','not-firdaria','subsection',1,30,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps JOIN terms t ON t.id=ps.term_id
WHERE t.slug='alfridary' AND ps.section_key='reader-usefulness';

-- Almuguea: all four explanatory sections in order.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Reader usefulness pass 02.'
FROM term_page_sections ps
JOIN terms t ON t.id=ps.term_id
JOIN term_article_sections s ON s.term_id=t.id
WHERE t.slug='almuguea' AND ps.section_key='reader-usefulness'
  AND s.section_key IN ('rule','examples','direction','not-ordinary-aspect')
  AND s.status IN ('reviewed','published');
