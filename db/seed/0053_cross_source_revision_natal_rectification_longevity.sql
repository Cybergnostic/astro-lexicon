-- Cross-source editorial revision, pass 7: natal, rectification and longevity vocabulary.
-- Run after 0052_cross_source_revision_horary.sql.
--
-- The aim here is especially to separate:
--   * a general technique from one historical method of that technique;
--   * a source-specific name from a genuinely distinct technical role;
--   * a life-signifying factor from the planet giving years, and from the factor that interrupts it.
--
-- Detailed mortality calculations remain source material and are not promoted as public operating recipes.

-- -----------------------------------------------------------------------------
-- NATIVITY, CONCEPTION AND RADIX
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The astrological figure cast for the moment of birth and used as the principal natal figure from which the native and postnatal life are judged.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='nativity';

UPDATE terms SET
  short_definition='Bonatti’s first or prenatal beginning: conception considered as an incomplete astrological beginning whose scope extends through gestation until birth, when the nativity becomes the complete postnatal beginning.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical'
WHERE slug='conceptional-beginning';

UPDATE terms SET
  short_definition='The original or root natal figure to which later predictive operations such as directions, profections, revolutions and transits are referred.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='radix';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('nativity','conceptional-beginning','radix'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'precedes', 'Bonatti treats conception as the incomplete first beginning and birth/nativity as the complete second beginning.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='conceptional-beginning' AND b.slug='nativity';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'root-figure-of', 'Radix is Lilly’s term for the root/original natal figure rather than a synonym for the abstract subject of nativity.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radix' AND b.slug='nativity';

-- -----------------------------------------------------------------------------
-- RECTIFICATION: GENERAL TECHNIQUE AND DISTINCT METHODS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The correction of an uncertain birth time or natal angles by testing an approximate figure against a defined astrological rectification method.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Keep the general technique distinct from its historical methods. In the present corpus these include Animodar, the Trutine of Hermes and Lilly’s rectification by dated accidents.'
WHERE slug='natal-rectification';

UPDATE terms SET
  label='Animodar / Namudar',
  short_definition='A natal rectification method that starts from the prenatal conjunction or opposition of the luminaries, selects the planet strongest by dignity there, and uses that planet’s degree and proximity to an angle to correct the natal angles.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti, Lilly and al-Bīrūnī describe the same basic method. Exact tie-breaking and angular details remain source-specific.'
WHERE slug='animodar';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Namudar', 'Arabic/Persian transliteration', 'historical-form', 'al-Bīrūnī’s translated namūdār/indicator behind the Latinized Animodar.' FROM terms WHERE slug='animodar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'An-namudar', 'Arabic/Persian transliteration', 'historical-form', 'Historical form represented by Bonatti’s and Lilly’s Animodar.' FROM terms WHERE slug='animodar';

UPDATE terms SET
  short_definition='A rectification method that tests the natal Ascendant through the traditional relationship between the Moon at birth and a proposed conception figure.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Lilly calls it the Trutine or Scrutiny of Hermes and explicitly treats it as distinct from Animodar.'
WHERE slug='trutine-of-hermes';

UPDATE terms SET
  short_definition='Lilly’s preferred rectification method: adjust an estimated birth time by comparing dated life events with appropriate primary directions until the directed chronology fits the recorded accidents.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='rectification-by-accidents';

-- al-Bīrūnī supplies an independent definition-level witness for Animodar/Namudar.
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '346', '348', '§525',
       'al-Bīrūnī: namūdār / Animodar rectification from the prenatal syzygy', NULL,
       'Narrow source block for the rectification method. No translator footnote is treated as author doctrine.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='al-Bīrūnī: namūdār / Animodar rectification from the prenatal syzygy'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Al-Bīrūnī describes the commonly used namūdār by first erecting the best approximate natal figure, taking the preceding lunar conjunction or opposition, ranking the planets by dignity and testimony at that degree, and using the most suitable planet nearest an angle to correct that angle and derive the Ascendant.',
       '§525', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='animodar' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§525'
  );

-- Lilly’s opening is valuable as a taxonomy of rectification methods, not merely another
-- duplicate definition of Animodar.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly treats natal rectification as a general problem with several distinct methods. He presents the Trutine of Hermes, Animodar and rectification by dated accidents separately, and explicitly regards the last as more secure than the two prenatal methods.',
       'Book III, Chapters XCVIII-C', 'close_paraphrase', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='natal-rectification' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III, Chapters XCVIII-C'
  );

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('animodar','trutine-of-hermes','rectification-by-accidents','natal-rectification'));

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug='animodar'
  AND i.scope='§525'
  AND sp.locator_text='al-Bīrūnī: namūdār / Animodar rectification from the prenatal syzygy'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'method-of', 'Animodar is a specific prenatal-syzygy method of natal rectification.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='animodar' AND b.slug='natal-rectification';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'method-of', 'The Trutine of Hermes is a distinct conception-Moon method of natal rectification.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='trutine-of-hermes' AND b.slug='natal-rectification';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'method-of', 'Rectification by Accidents is Lilly’s event-and-direction method of natal rectification.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='rectification-by-accidents' AND b.slug='natal-rectification';

-- -----------------------------------------------------------------------------
-- DIRECTIONAL ROLE: PROMITTOR
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='In primary direction, the planet, aspect, cusp or other zodiacal point toward which the significator is directed; the direction perfects when the significator reaches the promittor.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='promittor';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='promittor')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'role-in', 'The promittor is the target encountered by the moving significator in a primary direction.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='promittor' AND b.slug='primary-direction';

-- -----------------------------------------------------------------------------
-- HYLEG / KADKHUDA / ANARETA: THREE DISTINCT LONGEVITY ROLES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Hyleg / Apheta',
  short_definition='The selected aphetic planet or zodiacal place whose directions are used in traditional longevity doctrine to signify life and its continuation or condition.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Selection hierarchies differ among authors. The stable identity is the aphetic life-signifying point, not one universal candidate list.'
WHERE slug='hyleg';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Prorogator of Life', 'English', 'source-name', 'Lilly’s heading for the Hyleg/Hylech/Apheta.' FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Hylech', 'English/Latinized', 'historical-spelling', 'Lilly spelling of Hyleg.' FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Haylaj', 'Arabic/Persian transliteration', 'historical-form', 'Arabic-Persian form represented by Hyleg/Hīlāj in the sources.' FROM terms WHERE slug='hyleg';

-- Merge Lilly’s separate Alcochodon extraction into the already existing Kadkhuda term.
-- The sources describe the same technical role: dignity ruler related to the Hyleg that gives years.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='kadkhuda')
WHERE term_id=(SELECT id FROM terms WHERE slug='alcochodon');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Alcochodon', 'Latin/English', 'historical-form', 'Lilly’s spelling of the Latinized Kadkhuda/Alcocoden.' FROM terms WHERE slug='kadkhuda';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Alcochoden', 'Latin/English', 'historical-spelling', 'Common Latinized spelling of Kadkhuda.' FROM terms WHERE slug='kadkhuda';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Giver of Years', 'English', 'source-equivalent', 'Functional English description used for Kadkhuda/Alcochodon.' FROM terms WHERE slug='kadkhuda';

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='alcochodon');
DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='alcochodon')
   OR object_term_id=(SELECT id FROM terms WHERE slug='alcochodon');
DELETE FROM terms WHERE slug='alcochodon';

UPDATE terms SET
  label='Kadkhuda / Alcochodon',
  short_definition='The planet selected from the dignity rulers of the Hyleg, with the required aspect or other source-specific qualification, and used in traditional longevity doctrine as the giver or allocator of years.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Kadkhuda, Alcocoden/Alcochodon and giver of years are the same technical role in al-Bīrūnī, Bonatti and Lilly. Exact selection priorities and year allowances vary by source.'
WHERE slug='kadkhuda';

UPDATE terms SET
  label='Anareta / Interficient Factor',
  short_definition='The destructive or interficient factor in traditional longevity doctrine whose directed contact with the Hyleg or another life-signifying point is treated as an interruption of that life-signifying direction. Sources differ over whether the anareta is restricted to planets or may include other places and degrees.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Lilly presents competing planetary candidates; al-Bīrūnī also speaks of multiple anaeretai including zodiacal places. Do not reduce the term to a single universally defined planet.'
WHERE slug='anareta';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Interficient Planet', 'English', 'source-name', 'Lilly’s wording when the Anareta is treated specifically as a planet.' FROM terms WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Intersector', 'English', 'source-name', 'Lilly’s technical English equivalent.' FROM terms WHERE slug='anareta';

-- Narrow al-Bīrūnī source block for Hyleg/Kadkhuda/Anareta.
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '341', '343', '§§521-523',
       'al-Bīrūnī: Hyleg, Kadkhuda, allowances and anaeretai', NULL,
       'Historical longevity doctrine. Retain technical definitions and source disagreement; do not turn the numerical material into public prediction recipes.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='al-Bīrūnī: Hyleg, Kadkhuda, allowances and anaeretai'
  );

-- Existing al-Bīrūnī definitions are strong enough for A grade.
UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='al-biruni-tafhim')
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('hyleg','kadkhuda'))
  AND certainty='direct';

-- Add al-Bīrūnī’s important broadening of Anareta beyond one single planet.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Al-Bīrūnī treats the anaeretai as destructive factors encountered by the life-signifying direction and indicates that the category is not limited to one single planet: he mentions malefics and their rays and also other degrees or cusps treated as destructive places in different authorities.',
       '§§521-523', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='anareta' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§§521-523'
  );

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('hyleg','kadkhuda'));

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='anareta')
  AND work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology')
  AND certainty='direct';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('hyleg','kadkhuda','anareta')
  AND sp.locator_text='al-Bīrūnī: Hyleg, Kadkhuda, allowances and anaeretai'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'The Hyleg is the aphetic life-signifying factor; the Kadkhuda is selected in relation to it and supplies the year-giving function.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='hyleg' AND b.slug='kadkhuda';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'acts-against', 'The Anareta is the destructive/interficient factor in the same longevity framework in which the Hyleg serves as the aphetic life-signifying factor.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='anareta' AND b.slug='hyleg';

-- -----------------------------------------------------------------------------
-- ALMUDABIT: SPECIALIZED NAME, NOT A NEW KIND OF RULER
-- -----------------------------------------------------------------------------

-- Bonatti introduces almudābit for the planet strongest by the multitude of dignities
-- among a defined group of early-life significators, and immediately refers to that same
-- prevailing planet as the al-mubtazz. It therefore supplies a source-specific name/use of
-- the Almuten principle rather than an independent recognition mechanism.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='almuten'),
    summary='In Bonatti’s early-life judgment the planet strongest by the multitude of dignities among the specified life and nourishment significators is called the almudābit; the continuation of the passage treats this prevailing planet as the al-mubtazz. The name is therefore retained as a source-specific specialized form of the Almuten principle rather than a separate canonical rulership mechanism.',
    evidence_grade='A',
    status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='almudabit')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Almudabit', 'Arabic/Latinized', 'source-specialized-form', 'Bonatti’s name for the prevailing dignity ruler in a specific early-life natal judgment.' FROM terms WHERE slug='almuten';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Almudebit', 'Latinized spelling', 'source-spelling', 'Printed variant in Bonatti’s natal section.' FROM terms WHERE slug='almuten';

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='almudabit');
DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='almudabit')
   OR object_term_id=(SELECT id FROM terms WHERE slug='almudabit');
DELETE FROM terms WHERE slug='almudabit';

-- -----------------------------------------------------------------------------
-- LORD OF THE GENITURE: CLOSE TO, BUT NOT FLATTENED INTO, ALMUTEN OF THE FIGURE
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A planet assigned overarching governance of the nativity. Lilly prefers the planet strongest in the whole figure by combined essential and accidental dignity and best placement, while explicitly recording that older authorities defined the role differently.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Lilly’s preferred criterion nearly coincides with his Almuten of the Figure, but the Lord of the Geniture is a natal governing role and Lilly records competing historical definitions. Keep the two linked rather than silently identical.'
WHERE slug='lord-of-geniture';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-geniture')
  AND work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'closely-corresponds-to', 'Lilly’s preferred Lord of the Geniture is selected by essentially the same whole-chart strength criterion as his Almuten of the Figure, but the terms are not explicitly declared synonymous and older Lord-of-Geniture definitions differ.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='lord-of-geniture' AND b.slug='almuten-of-figure';

-- -----------------------------------------------------------------------------
-- JARBAKHTAR / DIVISOR
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Jarbakhtar / Divisor',
  short_definition='A natal directing role associated with the Ascendant as it is carried through successive planetary bounds, so that the ruler of each bound disposes the corresponding span of the direction.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti explicitly calls the directed Ascendant the jārbakhtār or divisor. The wider transmission varies over whether the name denotes the Ascendant/divisor itself or the bound-direction procedure, so the canonical definition remains deliberately cautious.'
WHERE slug='jarbakhtar';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Divisor', 'English', 'source-equivalent', 'Bonatti’s direct English translation/equivalent for jārbakhtār.' FROM terms WHERE slug='jarbakhtar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Distributor', 'English', 'translation-variant', 'al-Bīrūnī describes jān-bakhtār/al-qāsim as a divisor or distributor of the fortunes of life.' FROM terms WHERE slug='jarbakhtar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Al-Qasim', 'Arabic', 'source-equivalent', 'al-Bīrūnī gives al-qāsim alongside jān-bakhtār.' FROM terms WHERE slug='jarbakhtar';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='jarbakhtar')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialized-form-of', 'Jarbakhtar belongs to the primary-direction family and specifically concerns direction of the Ascendant through successive bounds.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='jarbakhtar' AND b.slug='primary-direction';

-- -----------------------------------------------------------------------------
-- FINAL GRADING FOR THIS BATCH
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'nativity','conceptional-beginning','radix','animodar','trutine-of-hermes',
      'rectification-by-accidents','promittor','hyleg','kadkhuda','lord-of-geniture','jarbakhtar'
    )
  );
