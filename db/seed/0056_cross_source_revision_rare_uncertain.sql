-- Cross-source editorial revision, pass 10: rare terms and uncertain equivalences.
-- Run after 0055_cross_source_revision_mundane_electional_weather.sql.
--
-- This pass revisits source-specific vocabulary that was deliberately left unresolved
-- during sequential extraction. It merges only where the recognition rule is genuinely
-- the same across sources; near-equivalences remain explicit relations.

-- -----------------------------------------------------------------------------
-- PLANETARY ORB: ABU MASHAR'S 'POWER OF THE BODY' IS THE SAME TECHNICAL FAMILY
-- -----------------------------------------------------------------------------

-- Abu Mashar Part VII Ch. 3 gives the same planet-specific before/after ranges that
-- Bonatti later calls orbs; one Latin witness of the Great Introduction itself renders
-- the relevant word as 'orbs'. Move the interpretation rather than maintaining a
-- duplicate canonical concept.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='planetary-orb')
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-body-power');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Power of a Planetary Body', 'English', 'source-translation',
       'Yamamoto/Burnett wording for Abu Mashar Part VII Ch. 3; a Latin witness renders the same passage with orb terminology.'
FROM terms WHERE slug='planetary-orb';

DELETE FROM terms WHERE slug='planetary-body-power';

UPDATE terms SET
  short_definition='A planet-specific angular reach extending before and after the planet, used to determine when another planet can enter or leave effective bodily or aspectual contact with it.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Abu Mashar, al-Biruni and Bonatti give the same basic planet-specific reach, while Lilly explicitly works with the moieties of two planets’ orbs. Numerical allowances remain source-specific rather than being forced into one universal table.'
WHERE slug='planetary-orb';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-orb')
  AND certainty='direct';

-- Link Abu Mashar's moved interpretation to his Part VII Chs. 3-4 passage.
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='abu-mashar-great-introduction'
  AND i.term_id=(SELECT id FROM terms WHERE slug='planetary-orb')
  AND sp.book='Part VII'
  AND sp.chapter='Chapters 3-4';

-- -----------------------------------------------------------------------------
-- BONATTI'S TWO DIFFERENT 'OWN LIGHT' USES
-- -----------------------------------------------------------------------------

-- Treatise 5 defines 'own light' by sect and hemisphere. That recognition rule is
-- exactly the condition represented canonically by Halb. Keep Bonatti's wording as an
-- alias, but do not confuse it with the completely different solar-phase use in Tr. 3.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='halb')
WHERE term_id=(SELECT id FROM terms WHERE slug='own-light');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Own Light', 'English', 'Bonatti-source-form',
       'Treatise 5 usage: sect planet on the appropriate side of the horizon; equivalent in mechanism to Halb.'
FROM terms WHERE slug='halb';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'In Its Own Light', 'English', 'Bonatti-source-form',
       'Treatise 5 usage only. Bonatti also uses the same English translation elsewhere for a different solar-phase condition.'
FROM terms WHERE slug='halb';

DELETE FROM terms WHERE slug='own-light';

UPDATE terms SET
  label='In Its Own Light (Solar-Phase Use)',
  short_definition='Bonatti’s separate solar-phase use of “in its own light”: a planet has emerged from the Sun’s rays and has not yet joined another planet.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Do not merge with Bonatti Treatise 5 “own light,” which is a sect/hemisphere condition equivalent in mechanism to Halb. The identical English wording represents two different source usages.'
WHERE slug='in-own-light';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='in-own-light')
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from',
       'Bonatti uses similar “own light” wording for two different conditions: this solar-phase condition and the sect/hemisphere condition represented by Halb.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='in-own-light' AND b.slug='halb';

-- -----------------------------------------------------------------------------
-- DASTURIYA / SPEAR-BEARING: RELATED TRADITIONS, NOT A FORCED MERGE
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A medieval attendant or spear-bearing condition connected with planets supporting a luminary. In the surviving corpus its exact criteria vary: Abu Mashar embeds dasturiya in strong eastern solar phases, while Bonatti uses it in inherited luminary-attendant doctrine.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='The corpus supports a historical connection with doruphoria/spear-bearing, but not one invariant recognition rule. Preserve the ambiguity instead of reducing dasturiya to ordinary orientality or silently identifying every occurrence with Antiochus’ spear-bearing definitions.'
WHERE slug='dasturiya';

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='dasturiya')
  AND work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction');

-- Bonatti supplies a second, independent witness to the medieval use of dasturiya as
-- an attendant relation to the luminaries. Keep the wording cautious because his
-- transmitted authorities and the Latin text are not fully consistent.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'In Bonatti’s natal doctrine, dasturiya is used for planets attending the luminaries in judgments of force, dignity and honor. In diurnal material he explicitly connects the Sun’s dasturiya with diurnal planets oriental from the Sun; elsewhere the surrounding or bodyguard planets of the luminaries belong to the same inherited spear-bearing complex. The transmitted criteria are not fully consistent, so this evidence is retained as substantial explanation rather than a single universal definition.',
       'Treatise 9, Part 3, Fourth and Tenth House material', 'close_paraphrase', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='dasturiya' AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Treatise 9, Part 3, Fourth and Tenth House material'
  );

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Doruphoria', 'Greek/Latin scholarly usage', 'historical-name',
       'Conventional scholarly name for the spear-bearing/bodyguard configuration. Antiochus is represented in this edition by “spear-bearing.”'
FROM terms WHERE slug='spear-bearing';

UPDATE terms SET
  label='Spear-bearing / Doruphoria',
  short_definition='A luminary-attendant configuration in which one or more planets act as spear-bearers or bodyguards according to specified relations of dignity, sect, direction and configuration; the exact eligible forms are source-specific.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Antiochus gives several explicit forms rather than one single geometry. Medieval dasturiya belongs to the same historical complex but is kept separate because the five-source corpus does not support a perfectly invariant equivalence.'
WHERE slug='spear-bearing';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='spear-bearing')
  AND work_id=(SELECT id FROM works WHERE slug='antiochus-thesaurus');

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'historical-correspondence',
       'Medieval dasturiya is repeatedly connected with the older spear-bearing/doruphoria complex, but the surviving source criteria are not identical enough to justify a complete merge.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='dasturiya' AND b.slug='spear-bearing';

-- -----------------------------------------------------------------------------
-- ANTIOCHUS 'PROPER FACE' AND BONATTI ALMUGUEA
-- -----------------------------------------------------------------------------

-- This is a strong cross-source identification. Antiochus defines a planet in its
-- “proper face” by reproducing, relative to a luminary, the same zodiacal relation that
-- its domicile bears to that luminary’s domicile, with the same solar/lunar directional
-- distinction. Bonatti defines Almuguea by that same rule and glosses it as face-to-face.
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Proper Face', 'English', 'Antiochus-source-form',
       'Antiochus §29: the same domicile-distance relation later represented by Bonatti’s Almuguea.'
FROM terms WHERE slug='almuguea';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Face-to-face', 'English', 'translation',
       'Bonatti’s explanatory gloss of Almuguea.'
FROM terms WHERE slug='almuguea';

UPDATE terms SET
  short_definition='A planetary “face-to-face” relation in which a planet reproduces, relative to a luminary, the zodiacal distance that its own domicile bears to the luminary’s domicile, with the solar and lunar forms using opposite directional orientation.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Antiochus calls this being in the planet’s Proper Face; Bonatti calls the same structure Almuguea. Venus receives a special practical treatment in Bonatti because her elongation cannot reproduce her theoretical domicile distance from the Sun.'
WHERE slug='almuguea';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '37', '38', 'Part I', '§§29-30',
       'Antiochus: Proper Face and Participation', NULL,
       'Proper Face is compared cross-source with Bonatti’s Almuguea because both use the same domicile-distance and luminary-direction recognition rule. Participation is retained as a separate Antiochian relation.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='antiochus-thesaurus'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Antiochus: Proper Face and Participation'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Antiochus says a star is in its proper face when it approaches the Sun or Moon in the same zodiacal relation that its domicile bears to the luminary’s domicile, using a western relation to the Sun and an eastern relation to the Moon. This is the same structural rule Bonatti later calls Almuguea or face-to-face.',
       'Part I, §29', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='almuguea' AND w.slug='antiochus-thesaurus'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part I, §29'
  );

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='almuguea')
  AND certainty='direct';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='antiochus-thesaurus'
  AND i.term_id=(SELECT id FROM terms WHERE slug='almuguea')
  AND i.scope='Part I, §29'
  AND sp.locator_text='Antiochus: Proper Face and Participation';

-- A missed dictionary-like Antiochian term recovered from the same page.
INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('participation-antiochus', 'Participation (Antiochus)',
   'A relation in which two planets occupy the same sign or adjacent/bordering signs while one stands in the domicile of one planet and the other in the exaltation of the other.',
   'planetary relationship', 'reviewed',
   'Source-specific Antiochian definition. Kept separate from the ordinary English word participation and from later time-lord participation.',
   'technical', 5);

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Antiochus defines participation when two planets are in the same sign or bordering signs and the configuration simultaneously places one in the domicile of one planet and the other in the exaltation of the other. The term therefore names a specific dignity-based planetary relationship, not generic cooperation.',
       'Part I, §30', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='participation-antiochus' AND w.slug='antiochus-thesaurus';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='antiochus-thesaurus'
  AND i.term_id=(SELECT id FROM terms WHERE slug='participation-antiochus')
  AND sp.locator_text='Antiochus: Proper Face and Participation';

-- -----------------------------------------------------------------------------
-- OTHER ANTIOCHIAN TECHNICAL TERMS: KEEP THE DIRECT DEFINITIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET definition_quality=5, status='reviewed'
WHERE slug IN (
  'looking-ahead','hurling-of-rays','position-upon-tenth-place','counter-revolution',
  'contact-kollesis','surpassing','bond-of-moon','containment','chariot-condition'
);

UPDATE terms SET definition_quality=4, status='reviewed'
WHERE slug IN ('affliction','juxtaposition','rejoicing-condition','planetary-recurrence');

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='antiochus-thesaurus')
  AND certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'looking-ahead','hurling-of-rays','position-upon-tenth-place','counter-revolution',
      'contact-kollesis','surpassing','bond-of-moon','containment','chariot-condition',
      'affliction','juxtaposition','rejoicing-condition','planetary-recurrence'
    )
  );

-- -----------------------------------------------------------------------------
-- SOLAR AND LUNAR HALVES: BONATTI + AL-BIRUNI INDEPENDENTLY SUPPORT THE DIVISION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The six-sign half of the zodiac from Leo through Capricorn assigned to the Sun in the symmetrical domicile scheme.',
  definition_quality=5,
  status='reviewed'
WHERE slug='solar-half';

UPDATE terms SET
  short_definition='The six-sign half of the zodiac from Aquarius through Cancer assigned to the Moon in the symmetrical domicile scheme.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lunar-half';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Al-Biruni divides the zodiac into two halves before deriving the planetary domiciles: Leo through Capricorn is the Sun’s half, beginning with the solar domicile Leo, while the opposite half belongs to the Moon.',
       '§440', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='solar-half' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§440');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Al-Biruni assigns Aquarius through Cancer to the Moon as the second half of the zodiac, beginning from the lunar domicile Cancer when the paired domicile scheme is viewed symmetrically around Leo and Cancer.',
       '§440', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lunar-half' AND w.slug='al-biruni-tafhim'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§440');

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('solar-half','lunar-half'))
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- BONATTI SOURCE-SPECIFIC CONDITIONS / PERIODS
-- -----------------------------------------------------------------------------

UPDATE terms SET definition_quality=5, status='reviewed'
WHERE slug='auge';

UPDATE terms SET definition_quality=4, status='reviewed'
WHERE slug IN ('planetary-rearing-period','dustoria','in-own-light','planetary-impediment');

UPDATE terms SET
  short_definition='Bonatti’s compound condition, transmitted from Alchabitius, combining hayz/similitude with additional solar or lunar orientation and, in one formulation, angular configuration to a luminary.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Do not merge with Hayz or Aym/Own Similitude. Bonatti explicitly begins from those conditions but adds further requirements, and then transmits another formulation of Dustoria as dextration/security.'
WHERE slug='dustoria';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('auge','planetary-rearing-period','dustoria','in-own-light','planetary-impediment')
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'built-from',
       'Bonatti’s Dustoria begins from hayz/similitude but adds further orientation/configuration conditions.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='dustoria' AND b.slug='hayz';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-to',
       'Bonatti presents Aym/Own Similitude as closely related to the condition from which Dustoria is constructed, without making the two labels interchangeable.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='dustoria' AND b.slug='own-similitude';

-- The extraction label 'Gift of a Fixed Star' describes a Bonatti explanatory passage,
-- but it is not a sufficiently stable lexical item for the public term list.
DELETE FROM terms WHERE slug='fixed-star-gift';

-- -----------------------------------------------------------------------------
-- SOURCE-SPECIFIC SIGN CLASSES / DECAN FIGURES
-- -----------------------------------------------------------------------------

UPDATE terms SET definition_quality=4, status='reviewed'
WHERE slug IN (
  'decan-figure','mobile-resting-signs','voiced-sign','fecund-sign','barren-sign',
  'rational-sign','half-voice-sign','voiceless-sign'
);

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'decan-figure','mobile-resting-signs','voiced-sign','fecund-sign','barren-sign',
      'rational-sign','half-voice-sign','voiceless-sign'
    )
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'overlaps-with',
       'Bonatti’s rational/human-image signs substantially overlap Abu Mashar’s voiced-sign class, but the recognition principles are not identical and should not be normalized as synonyms.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='rational-sign' AND b.slug='voiced-sign';

-- -----------------------------------------------------------------------------
-- PLANETARY HOURS AND DAY LORDS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A variable-length day or night hour assigned cyclically to one of the seven planets in Chaldean planetary order, beginning from the ruler of the first hour.',
  definition_quality=5,
  status='reviewed'
WHERE slug='planetary-hour';

UPDATE terms SET
  short_definition='The planet ruling a weekday because it rules the first planetary hour of that day; the weekday sequence follows from the planetary-hour cycle.',
  definition_quality=5,
  status='reviewed'
WHERE slug='day-lord';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('planetary-hour','day-lord'));

-- -----------------------------------------------------------------------------
-- BONATTI'S SCIENCE / CAUSATION VOCABULARY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The practical branch of the science of the stars that judges terrestrial matters from celestial configurations and significators.',
  definition_quality=5,
  status='reviewed'
WHERE slug='judicial-astrology';

UPDATE terms SET
  short_definition='The natural causal action attributed to celestial motion and configuration upon the elemental world, distinguished from the act of interpreting celestial indications.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='astral-influence';

UPDATE interpretations
SET evidence_grade=CASE WHEN term_id=(SELECT id FROM terms WHERE slug='judicial-astrology') THEN 'A' ELSE 'B' END,
    status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('judicial-astrology','astral-influence'));

-- -----------------------------------------------------------------------------
-- PRUNE EDITORIAL CORRESPONDENCE HEADINGS
-- -----------------------------------------------------------------------------

-- These entries were useful during extraction as handles for large catalogues, but the
-- source does not present the English bundle-label as a technical lexical item. The
-- underlying passages remain searchable source evidence.
DELETE FROM terms WHERE slug IN (
  'sign-country-correspondence',
  'zodiacal-body-correspondence',
  'sign-animal-correspondence',
  'sign-plant-correspondence',
  'sign-water-fire-correspondence',
  'sign-direction',
  'quadrant-body-spirit',
  'quadrant-element-mixture',
  'place-colour',
  'fourfold-natural-correspondence'
);
