-- Cross-source editorial revision, pass 8: predictive and time-lord systems.
-- Run after 0053_cross_source_revision_natal_rectification_longevity.sql.
--
-- Central editorial rule for this batch:
-- historical names that resemble one another are not merged unless the operative period
-- structure also agrees. This is especially important for Firdaria versus Lilly's Alfridary.

-- -----------------------------------------------------------------------------
-- FIRDARIA / FARDAR
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Firdaria / Fardār',
  short_definition='A planetary time-lord system of unequal major periods beginning from the sect luminary—Sun by day and Moon by night—in which each principal period is subdivided into successive planetary subperiods or associations.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Abū Maʿshar supplies the fixed fardār numbers; al-Bīrūnī and Bonatti explicitly describe the sect-dependent sequence and planetary participation. Keep distinct from Lilly’s seven-year Alfridary system despite the related vocabulary.'
WHERE slug='fardar';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Firdaria', 'Latin/English', 'historical-form', 'Common Latin/English form of firdār/firdārīyah.' FROM terms WHERE slug='fardar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Firdārīyah', 'Arabic/Persian tradition', 'historical-form', 'Form represented in Bonatti’s firdārah/firdaria terminology.' FROM terms WHERE slug='fardar';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='fardar')
  AND work_id IN (
    SELECT id FROM works WHERE slug IN ('abu-mashar-great-introduction','al-biruni-tafhim','bonatti-liber-astronomiae')
  )
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- LILLY'S ALFRIDARY: RELATED NAME, DIFFERENT SYSTEM
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Alfridary (Septennial Years)',
  short_definition='Lilly’s septennial planetary period system in which each ruler governs a fixed seven-year span, beginning with the Sun in a day nativity and the Moon in a night nativity and then proceeding through a stated planetary order.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Do not merge with medieval Firdaria. Lilly explicitly defines every Alfridary period as seven years, whereas Abū Maʿshar, al-Bīrūnī and Bonatti use unequal firdaria periods such as 10, 8, 13, 9, 11, 12 and 7 years for the planets.'
WHERE slug='alfridary';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '795', '795', 'Book III', 'End of Chapter CLXXI',
       'Lilly: Lords of the Septennial Years, called Lords of the Alfridary', NULL,
       'Direct source for Lilly’s seven-year Alfridary system. Kept separate from the unequal medieval Firdaria sequence.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: Lords of the Septennial Years, called Lords of the Alfridary'
  );

UPDATE interpretations SET
  summary='Lilly calls these rulers the Lords of the Septennial Years, vulgarly the Lords of the Alfridary. Every ruler receives a seven-year period: day nativities begin with the Sun and night nativities with the Moon, after which the succeeding planets take their seven-year spans in the order he gives.',
  evidence_grade='A',
  status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='alfridary')
  AND work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology');

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='alfridary'
  AND w.slug='lilly-christian-astrology'
  AND sp.locator_text='Lilly: Lords of the Septennial Years, called Lords of the Alfridary'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'historically-related-but-distinct',
       'The names are historically related, but the operative systems differ in the present corpus: medieval Firdaria uses unequal planetary periods with subperiod participation, while Lilly’s Alfridary assigns fixed seven-year periods.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='alfridary' AND b.slug='fardar';

-- -----------------------------------------------------------------------------
-- PLANETARY YEARS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Planetary Years',
  short_definition='Traditional numerical year-values assigned to each planet in several classes—least or small, mean or middle, great, and greatest—and used as temporal quantities in different astrological procedures.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Exact values and applications belong in source interpretations. The canonical entry describes the four-class numerical doctrine rather than treating the numbers as one universal predictive rule.'
WHERE slug='planetary-years';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-years')
  AND work_id IN (SELECT id FROM works WHERE slug IN ('abu-mashar-great-introduction','al-biruni-tafhim'))
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'Planetary years are assigned numerical quantities; Firdaria is a chronological sequence of planetary rulership periods. The two doctrines are explicitly distinguished by Bonatti.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-years' AND b.slug='fardar';

-- -----------------------------------------------------------------------------
-- ANNUAL REVOLUTION FAMILY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='An annual solar-return figure produced when the Sun returns to a specified zodiacal starting degree and minute. The starting point may belong to a nativity, a mundane year, or another inception, so the particular kind of annual revolution must be stated.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='annual-revolution';

-- Bonatti's Revolution of the Year of a Nativity is exactly the natal solar-return
-- concept already represented canonically by Solar Revolution.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='solar-revolution')
WHERE term_id=(SELECT id FROM terms WHERE slug='nativity-year-revolution');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Revolution of the Year of a Nativity', 'English', 'source-name', 'Bonatti’s name for the Sun’s annual return to its exact natal longitude.' FROM terms WHERE slug='solar-revolution';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Annual Conversion', 'English', 'source-name', 'Lilly’s term for the annual return of the Sun to its radical position.' FROM terms WHERE slug='solar-revolution';

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='nativity-year-revolution');
DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='nativity-year-revolution')
   OR object_term_id=(SELECT id FROM terms WHERE slug='nativity-year-revolution');
DELETE FROM terms WHERE slug='nativity-year-revolution';

UPDATE terms SET
  label='Solar Revolution / Natal Annual Revolution',
  short_definition='The annual return of the Sun to the exact zodiacal degree and minute it occupied in the radix, for which a new figure is erected and compared with the natal figure.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='solar-revolution';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='solar-revolution')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A natal solar revolution is the annual-revolution form whose starting point is the Sun’s exact radical longitude.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='solar-revolution' AND b.slug='annual-revolution';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'The world-year revolution is the mundane annual-revolution form reckoned from the solar ingress into Aries.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='world-year-revolution' AND b.slug='annual-revolution';

-- -----------------------------------------------------------------------------
-- LORD OF THE YEAR AND LORD OF THE REVOLUTION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Lord of the Year',
  short_definition='The principal planetary ruler assigned to a particular year in an annual-revolution or related annual judgment. The method of selection varies substantially by author and technique and is therefore part of each source interpretation rather than the canonical definition.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Do not reduce this to the ruler of the annual Ascendant. al-Bīrūnī and Bonatti give hierarchical selection procedures, while Lilly uses Chronocrator as an equivalent name in his annual/profection context.'
WHERE slug='lord-of-year';

-- Narrow al-Bīrūnī witness for his specific world-year hierarchy.
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '340', '340', '§520',
       'al-Bīrūnī: sālkhudā / Lord of the Year in world-year anniversaries', NULL,
       'Source-specific Lord-of-Year selection. Do not assume that the same Persian/Arabic name always denotes Bonatti’s later profected sālkhudāy.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='al-Bīrūnī: sālkhudā / Lord of the Year in world-year anniversaries'
  );

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-year')
  AND work_id IN (SELECT id FROM works WHERE slug IN ('al-biruni-tafhim','bonatti-liber-astronomiae'))
  AND certainty='direct';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lord-of-year'
  AND w.slug='al-biruni-tafhim'
  AND sp.locator_text='al-Bīrūnī: sālkhudā / Lord of the Year in world-year anniversaries'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

-- Lilly explicitly equates Lord of the Year and Chronocrator in the immediate annual/profection context.
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Chronocrator', 'Greek/Latinized', 'source-equivalent', 'Lilly explicitly says the Lord of the Year and Chronocrator are the same in his Book III annual/profection discussion; do not universalize this as a synonym for every historical chronocrator.' FROM terms WHERE slug='lord-of-year';

UPDATE terms SET
  short_definition='The ruler governing the effective span of a particular annual or subannual revolution. In Bonatti a fixed Aries-ingress Ascendant can give one ruler for the whole year, while common or movable Ascendants produce half-year or quarterly revolutions with their own rulers.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='lord-of-revolution';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-revolution')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-annual-role', 'Bonatti states that every Lord of the Year is a Lord of a Revolution, but a Lord governing only a quarter- or half-year revolution is not necessarily Lord of the whole year.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='lord-of-year' AND b.slug='lord-of-revolution';

-- -----------------------------------------------------------------------------
-- PROFECTION AND THE PROFECTION RULER
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A regular advancement of a natal or other starting point through the zodiac; in annual profection one complete sign, or thirty degrees, is allotted to each completed solar year while the original degree within the sign is retained.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='profection';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='profection')
  AND certainty='direct';

UPDATE terms SET
  label='Sālkhudāy / Lord of the Profection',
  short_definition='In Bonatti’s natal profection doctrine, the ruler of the sign reached by the annual profection; it acts as the profected Lord of the Year and participates with the ruler of the annual revolution.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Keep separate from the generic Lord of the Year because Bonatti defines this role specifically from the profected sign. Similar historical vocabulary is used more broadly in other sources.'
WHERE slug='salkhuday';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='salkhuday')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'ruler-of', 'The sālkhudāy is the ruler of the sign reached by the annual profection.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='salkhuday' AND b.slug='profection';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialized-form-of', 'Bonatti uses sālkhudāy as a profected Lord of the Year; the project keeps it separate from broader Lord-of-Year algorithms.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='salkhuday' AND b.slug='lord-of-year';

-- -----------------------------------------------------------------------------
-- OTHER PERIOD RULERS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Bonatti’s yearly-ruler system that pairs the ruler of the relevant natal house or sign with the ruler of the corresponding planetary hour, proceeding year by year through a repeating sequence.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='A distinct annual ruler system. Bonatti compares it with profectional logic but does not identify it with the sālkhudāy or Firdaria.'
WHERE slug='lord-of-orb';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-orb')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

UPDATE terms SET
  short_definition='Bonatti’s division of life into three successive portions governed by the three rulers of the relevant triplicity, with the first, second and participating ruler assigned to the earlier, middle and later portions respectively.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='triplicity-life-division';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

-- Keep the early term-lord period doctrine separate from Jarbakhtar. The earlier chapter
-- assigns spans from the lengths of successive terms; the later Jarbakhtar treatment uses
-- the Ascendant's direction through bounds with ascensional measurement. They are related,
-- but the corpus does not justify declaring the two labels exact synonyms.
UPDATE terms SET
  label='Direction / Period by Term Lords',
  short_definition='Bonatti’s period doctrine in which successive rulers of the bounds, beginning from the Ascendant, govern successive spans corresponding to the extent of those bounds.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Closely related to the later Jarbakhtar/divisor doctrine, but not merged: the later treatment is a more explicit primary direction through bounds and uses ascensional measurement.'
WHERE slug='term-direction';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='term-direction')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'closely-related-to', 'Both doctrines distribute periods through successive bounds from the Ascendant, but the later Jarbakhtar treatment explicitly uses primary directional/ascensional measurement.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='term-direction' AND b.slug='jarbakhtar';

-- -----------------------------------------------------------------------------
-- ALREADY-STABLE PREDICTIVE TECHNIQUES: FINAL GRADING / RELATIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET definition_quality=5, status='reviewed', entry_type='technical'
WHERE slug IN ('primary-direction','transit');

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('primary-direction','solar-revolution','transit'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'used-with', 'Bonatti and Lilly both combine annual revolution with profection rather than treating either technique as a replacement for the other.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='profection' AND b.slug='solar-revolution';

-- -----------------------------------------------------------------------------
-- FINAL BATCH GRADING
-- -----------------------------------------------------------------------------

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'fardar','alfridary','planetary-years','annual-revolution','solar-revolution',
      'lord-of-year','lord-of-revolution','profection','salkhuday','lord-of-orb',
      'triplicity-life-division','term-direction','primary-direction','transit'
    )
  );
