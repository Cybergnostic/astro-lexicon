-- Lexicographic pilot 01: focused revisions after review of the existing corpus.
-- Source data, historical interpretations, formulas and relations are NOT changed.
-- Primary spot checks: Lilly, Christian Astrology I p. 111 and III ch. 99 pp. 505–506;
-- Bonatti, Liber Astronomiae, natal rectification passage (merged PDF pp. 1023–1024).
-- Application's Abū Maʿshar account retains the source-specific claims already registered
-- in 0098_core_mechanics_article_quality.sql (Great Introduction VII.5.4–5.5).
PRAGMA foreign_keys = ON;

-- The canonical short_definition already gives the concise dictionary definition.
-- Remove redundant intro summaries on these three entries so the reader proceeds
-- directly to substance rather than reading the definition twice.
UPDATE term_articles
SET intro = '',
    editorial_notes = 'Lexicographic pilot 01: short_definition supplies the lemma definition; sections now give evidence or mechanism without repeating the lead.'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('application','translation-of-light','animodar'));

UPDATE term_article_sections
SET heading = 'Application and planetary motion',
    body = 'A configuration is applying when planetary movement reduces the distance to the exact conjunction or aspect. Two planets can stand close together without applying if the relevant contact is already past or their motion is taking them farther apart. The motion of both planets, not their positions alone, determines the phase.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'application')
  AND section_key = 'mechanism';
 
UPDATE term_article_sections
SET heading = 'Abū Maʿshar''s rule for conjunction',
    body = 'For bodily conjunction, Abū Maʿshar describes a faster planet approaching a slower one while both are direct and occupy the same sign. The contact becomes exact when their degrees and minutes coincide. His account also recognizes an interval of interaction around exact conjunction; its limits belong to his stated rules rather than to every historical treatment of application.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'application')
  AND section_key = 'abu-mashar';
 
UPDATE term_article_sections
SET heading = 'Approach does not guarantee perfection',
    body = 'Application identifies an approaching contact. A planet may turn retrograde or another event may intervene before that contact is completed. This distinction matters especially in questions of perfection: an applying aspect describes the motion, not by itself the outcome of the matter.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'application')
  AND section_key = 'not-proximity';
 
UPDATE term_article_sections
SET heading = 'Transmission between two planets',
    body = 'The intermediary carries light from one planet to another through successive contacts: it separates from the first and applies to the second. Its earlier contact and subsequent application are both necessary to recognize the sequence; the simultaneous presence of three planets in aspect does not by itself constitute translation.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'translation-of-light')
  AND section_key = 'core-mechanics';
 
UPDATE term_article_sections
SET heading = 'An example from William Lilly',
    body = 'Lilly gives Mars at 15° Aries, Mercury at 16° Aries, and Saturn at 20° Aries. Mercury, the faster intermediary, has passed Mars and proceeds toward Saturn, transferring Mars''s light to Saturn. Lilly permits this translation through an aspect as well as through bodily conjunction (Christian Astrology, Book I, p. 111).',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'translation-of-light')
  AND section_key = 'sequence';
 
UPDATE term_article_sections
SET heading = 'Translation and collection distinguished',
    body = 'In translation, one swift planet moves from a first contact to a second. In collection, two planets apply separately to a third planet that receives their lights. The distinction lies in the direction and sequence of the contacts.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'translation-of-light')
  AND section_key = 'translation-vs-collection';
 
UPDATE term_article_sections
SET heading = 'The prenatal syzygy',
    body = 'Animodar begins from the last conjunction or opposition of the Sun and Moon before birth. Its degree supplies the point at which planetary dignities are examined; it is not itself substituted for the uncertain birth time.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'animodar')
  AND section_key = 'prenatal-syzygy';
 
UPDATE term_article_sections
SET heading = 'Choosing the planetary indicator',
    body = 'In Lilly''s account, the planet with the greatest essential dignity at the relevant syzygy degree is selected from an estimated natal figure. Bonatti also considers dignities and additional planetary testimony, with more elaborate rules for ranking competing candidates. Those differences belong to the individual authorities rather than to a single standardized algorithm.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'animodar')
  AND section_key = 'indicator';
 
UPDATE term_article_sections
SET heading = 'Relating the indicator to the angles',
    body = 'In the procedure described by Lilly, the selected planet''s degree within its sign is used to correct the Ascendant or Midheaven according to the nearer angle. Bonatti also relates the indicator to natal angles, although his selection and comparison rules differ. Both presuppose an approximate nativity to be rectified.',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'animodar')
  AND section_key = 'angles';
 
UPDATE term_article_sections
SET heading = 'Other rectification methods',
    body = 'Lilly discusses Animodar alongside the Trutine of Hermes and rectification by dated events. He favors rectification by events when suitable evidence is available, while presenting Animodar as an alternative where such evidence is lacking (Christian Astrology, Book III, ch. 99, pp. 505–506).',
    editorial_notes = 'Lexicographic pilot 01: original review evidence preserved; see docs/editorial/lexicographic-pilot-01.md.'
WHERE term_id = (SELECT id FROM terms WHERE slug = 'animodar')
  AND section_key = 'other-methods';
 
-- The public composition groups remain intact: only their reader-facing headings change.
UPDATE term_page_sections SET heading = 'Motion, application and completion'
WHERE term_id = (SELECT id FROM terms WHERE slug='application') AND section_key='application-mechanics';
UPDATE term_page_sections SET heading = 'Mechanism and example'
WHERE term_id = (SELECT id FROM terms WHERE slug='translation-of-light') AND section_key='mechanics-and-distinctions';
UPDATE term_page_sections SET heading = 'Method and historical accounts'
WHERE term_id = (SELECT id FROM terms WHERE slug='animodar') AND section_key='method-and-distinction';
