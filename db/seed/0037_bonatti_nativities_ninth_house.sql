-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Ninth House (religion, faith, knowledge, pilgrimages and long journeys),
-- compiled PDF pp. 1158-1169.
-- Only definition-level or substantively explanatory evidence is retained.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('ninth-house', 'Ninth House', 'In Bonatti’s natal doctrine, the ninth house signifies religion and faith, knowledge, pilgrimages and long journeys.', 'houses', 'draft', 'Keep to Bonatti’s explicitly stated traditional topics; do not import modern ninth-house meanings.')
;

-- NINTH HOUSE: religion, faith and knowledge
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1158', '1165', 'Treatise 9, Part 3', 'Ninth House, Chapters 1-2', 'Ninth House',
       'Religion, faith and knowledge; ninth-house significators and timing', NULL,
       'Bonatti explicitly assigns religion, faith and knowledge to the ninth. He also gives substantial procedures using the ninth and its lord, Mercury, the Part of Faith, and the triplicity rulers. Planet-by-planet religious character catalogues are not promoted as separate entries.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly treats the ninth house as the principal place of religion and faith and of knowledge. In judging these topics he combines the ninth and its lord with the native’s principal significators and later gives Mercury a special universal role in faith and depth of knowledge.',
       'Treatise 9, Part 3, Ninth House, Chs. 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='ninth-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Within the Ninth House doctrine Bonatti again uses the three triplicity rulers serially: the rulers of the triplicity associated with the Part of Faith can show in which successive third of life the native’s faith, law or religion is in its better condition.',
       'Treatise 9, Part 3, Ninth House, Ch. 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

-- NINTH HOUSE: pilgrimages and long journeys
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1165', '1169', 'Treatise 9, Part 3', 'Ninth House, Chapters 3-4', 'Ninth House',
       'Pilgrimages and long journeys; ninth-house travel procedure', NULL,
       'Bonatti judges pilgrimages and long journeys from the ninth and its lord together with planets there, Mars, the Part of Pilgrimage and its lord, and their relation to the Ascendant. Detailed direction, danger and livelihood catalogues are not promoted.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti also assigns pilgrimages and long journeys to the ninth. His procedure begins from the ninth and its lord and can add planets in the ninth, Mars, the Part of Pilgrimage and its ruler, comparing their condition and their relations with the Ascendant and its ruler.',
       'Treatise 9, Part 3, Ninth House, Chs. 3-4', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='ninth-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For long journeys Bonatti applies the triplicity rulers to periods of life: the condition of the relevant ruler indicates which life period is more favorable or unfavorable for pilgrimages and journeys.',
       'Treatise 9, Part 3, Ninth House, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

-- Citation links for the interpretations created above.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='ninth-house'
  AND i.scope='Treatise 9, Part 3, Ninth House, Chs. 1-2'
  AND sp.locator_text='Religion, faith and knowledge; ninth-house significators and timing';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='ninth-house'
  AND i.scope='Treatise 9, Part 3, Ninth House, Chs. 3-4'
  AND sp.locator_text='Pilgrimages and long journeys; ninth-house travel procedure';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='triplicity-life-division'
  AND i.scope='Treatise 9, Part 3, Ninth House, Ch. 2'
  AND sp.locator_text='Religion, faith and knowledge; ninth-house significators and timing';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='triplicity-life-division'
  AND i.scope='Treatise 9, Part 3, Ninth House, Ch. 3'
  AND sp.locator_text='Pilgrimages and long journeys; ninth-house travel procedure';
