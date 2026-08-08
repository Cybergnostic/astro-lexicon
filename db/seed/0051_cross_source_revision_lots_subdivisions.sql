-- Cross-source editorial revision, pass 5: lots, degree doctrines and sign subdivisions.
-- Run after 0050_cross_source_revision_perfection_impediments.sql.
--
-- This pass also repairs the Abū Maʿshar Part VIII seed, whose source/interpretation
-- INSERTs used the obsolete work slug 'great-introduction' instead of the canonical
-- 'abu-mashar-great-introduction'. The original extraction terms survived, but the
-- Abū Maʿshar lot interpretations and passages did not.

-- -----------------------------------------------------------------------------
-- CLEAR DUPLICATES / SYNONYMS
-- -----------------------------------------------------------------------------

-- Part and Lot are translation variants of the same calculated-point family. al-Bīrūnī's
-- provisional Part of Fortune entry is therefore merged into the existing Lot of Fortune.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='lot-of-fortune')
WHERE term_id=(SELECT id FROM terms WHERE slug='part-of-fortune');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part of Fortune', 'English', 'translation-variant',
       'Common English/Latin-tradition rendering of the same luminary lot.'
FROM terms WHERE slug='lot-of-fortune';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='part-of-fortune')
   OR object_term_id=(SELECT id FROM terms WHERE slug='part-of-fortune');
DELETE FROM terms WHERE slug='part-of-fortune';

-- Antiochus' Twelfth-part and the Arabic dodecatemorion/twelfth doctrine use the same
-- twelvefold 2°30′ division and multiplication-by-twelve procedure. Preserve the historical
-- names and author-specific explanations under one canonical concept.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='dodecatemorion')
WHERE term_id=(SELECT id FROM terms WHERE slug='twelfth-part');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Twelfth-part', 'English', 'historical-equivalent',
       'Antiochus and al-Bīrūnī terminology for the twelvefold subdivision represented canonically as dodecatemorion.'
FROM terms WHERE slug='dodecatemorion';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Twelfths', 'English', 'historical-equivalent',
       'al-Bīrūnī’s English translation label for the same twelvefold division.'
FROM terms WHERE slug='dodecatemorion';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='twelfth-part')
   OR object_term_id=(SELECT id FROM terms WHERE slug='twelfth-part');
DELETE FROM terms WHERE slug='twelfth-part';

-- -----------------------------------------------------------------------------
-- REPAIR ABŪ MAʿSHAR PART VIII SOURCE LINKS
-- -----------------------------------------------------------------------------

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '819', '823', 'Part VIII', 'Chapter 1', '1.4-1.10',
       'Abū Maʿshar Part VIII Ch. 1: formal definition of a lot', NULL,
       'Repair of 0014 work-slug bug. Two natural indicators and a third movable indicator define the formal structure of a lot.'
FROM editions e JOIN works w ON e.work_id=w.id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Abū Maʿshar Part VIII Ch. 1: formal definition of a lot'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '825', '831', 'Part VIII', 'Chapter 2', '2.3-2.7',
       'Abū Maʿshar Part VIII Ch. 2: classes of authenticated lots', NULL,
       'Repair of 0014 work-slug bug. Seven planetary lots, eighty lots of the twelve places, and ten additional lots.'
FROM editions e JOIN works w ON e.work_id=w.id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Abū Maʿshar Part VIII Ch. 2: classes of authenticated lots'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '835', '841', 'Part VIII', 'Chapter 3', '3.6-3.12',
       'Abū Maʿshar Part VIII Ch. 3: Fortune and Absence', NULL,
       'Repair of 0014 work-slug bug. Day/night formulas for the paired luminary lots.'
FROM editions e JOIN works w ON e.work_id=w.id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Abū Maʿshar Part VIII Ch. 3: Fortune and Absence'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '911', '917', 'Part VIII', 'Chapter 5', '5.2-5.12',
       'Abū Maʿshar Part VIII Ch. 5: Lot of the Haylāǧ', NULL,
       'Repair of 0014 work-slug bug. The Lot of the Haylāǧ is distinct from the haylāǧ itself.'
FROM editions e JOIN works w ON e.work_id=w.id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Abū Maʿshar Part VIII Ch. 5: Lot of the Haylāǧ'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '939', '943', 'Part VIII', 'Chapter 8', '8.2-8.8',
       'Abū Maʿshar Part VIII Ch. 8: indicators of a lot', NULL,
       'Repair of 0014 work-slug bug. General interpretation through one, two or three indicators.'
FROM editions e JOIN works w ON e.work_id=w.id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Abū Maʿshar Part VIII Ch. 8: indicators of a lot'
  );

-- Re-create the missing Abū Maʿshar interpretations under the correct work slug.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar defines a lot through two natural indicators that share the relevant signification and a third movable indicator from which their zodiacal distance is projected.',
       'Part VIII, Chapter 1', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 1');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar’s general extraction method measures the equal-degree zodiacal interval between the two natural indicators and projects that interval from the ascendant or another appropriate movable point.',
       'Part VIII, Chapters 1 and 3', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-extraction' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapters 1 and 3');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar divides the authenticated lots into three classes: seven planetary lots, eighty lots associated with the twelve places, and ten additional lots, ninety-seven in all.',
       'Part VIII, Chapter 2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-lots' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 2');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar forms the Lot of Fortune from Sun to Moon by day and Moon to Sun by night, projected from the ascendant. It is the principal lunar lot in his system.',
       'Part VIII, Chapter 3, Fortune', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-fortune' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 3, Fortune');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar’s Lot of Absence reverses the luminary arc used for Fortune: Moon to Sun by day and Sun to Moon by night, projected from the ascendant. It is the paired solar counterpart of Fortune.',
       'Part VIII, Chapter 3, Absence', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-absence' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 3, Absence');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar computes the Lot of the Haylāǧ from the prenatal conjunction or opposition and the Moon, then treats the resulting point as a separately movable predictive factor; it is not the haylāǧ itself.',
       'Part VIII, Chapter 5', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-the-haylaj' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 5');

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar says a lot may have one, two or three general indicators depending on the formula and the place in which the lot falls; their condition and relationship to the lot govern its interpretation.',
       'Part VIII, Chapter 8', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='general-indicators-of-a-lot' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 8');

-- Link repaired interpretations to repaired source passages.
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND ((t.slug IN ('lot','lot-extraction') AND sp.locator_text='Abū Maʿshar Part VIII Ch. 1: formal definition of a lot')
    OR (t.slug='planetary-lots' AND sp.locator_text='Abū Maʿshar Part VIII Ch. 2: classes of authenticated lots')
    OR (t.slug IN ('lot-of-fortune','lot-of-absence') AND sp.locator_text='Abū Maʿshar Part VIII Ch. 3: Fortune and Absence')
    OR (t.slug='lot-of-the-haylaj' AND sp.locator_text='Abū Maʿshar Part VIII Ch. 5: Lot of the Haylāǧ')
    OR (t.slug='general-indicators-of-a-lot' AND sp.locator_text='Abū Maʿshar Part VIII Ch. 8: indicators of a lot'));

-- -----------------------------------------------------------------------------
-- MISSED LOT TERM: NATURAL / IMMOVABLE SIGNIFICATORS
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('natural-indicators-of-a-lot', 'Natural / Immovable Significators of a Lot',
   'The two primary points whose relationship supplies the interval used to construct a lot; they are contrasted with the movable projection point from which that interval is cast.',
   'lots', 'reviewed',
   'Abū Maʿshar calls them natural indicators; Bonatti calls them natural or immovable significators. This was a strong structural concept missed as a standalone term during extraction.',
   'technical', 5);

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Immovable Significators', 'English', 'source-form',
       'Bonatti terminology for the two formal significators whose interval is projected.'
FROM terms WHERE slug='natural-indicators-of-a-lot';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Natural Indicators', 'English', 'source-form',
       'Abū Maʿshar terminology for the two primary indicators in the lot formula.'
FROM terms WHERE slug='natural-indicators-of-a-lot';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar’s formal definition of a lot begins with two natural indicators sharing the matter being signified; their zodiacal distance is what is projected from the third, movable indicator.',
       'Part VIII, Chapter 1', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='natural-indicators-of-a-lot' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Bonatti calls the two points whose relationship supplies the lot interval its natural or immovable significators, distinguishing them from the movable significator that serves as the projection point.',
       'Treatise 8.2, Chapters 1-2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='natural-indicators-of-a-lot' AND w.slug='bonatti-liber-astronomiae';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='natural-indicators-of-a-lot'
  AND ((w.slug='abu-mashar-great-introduction' AND sp.locator_text='Abū Maʿshar Part VIII Ch. 1: formal definition of a lot')
    OR (w.slug='bonatti-liber-astronomiae' AND sp.book='Treatise 8.2: Parts' AND sp.chapter='Chapters 1-3'));

-- -----------------------------------------------------------------------------
-- LOT FAMILY: CANONICAL DEFINITIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Astrological Lot / Part',
  short_definition='A calculated zodiacal point constructed from three positions: the interval between two natural significators is measured and projected from a third, movable reference point, commonly the Ascendant.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lot';

UPDATE terms SET
  short_definition='The procedure for constructing a lot by measuring the zodiacal interval between two natural significators and projecting that interval from a movable reference point such as the Ascendant or a relevant house place.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lot-extraction';

UPDATE terms SET
  label='Movable Significator / Projection Point',
  short_definition='The third point in a lot formula from which the interval between the two natural significators is projected. It is commonly the Ascendant but may be another relevant place according to the lot.',
  definition_quality=5,
  status='reviewed'
WHERE slug='movable-indicator';

UPDATE terms SET
  label='Significators of a Lot',
  short_definition='The formal planets or points used to judge a lot in addition to the lot itself. Abū Maʿshar allows one to three general indicators; Bonatti expands the analysis to as many as four roles when the two natural significators, the ruler of the lot’s place, and the ruler of the projection point are distinct.',
  definition_quality=5,
  status='reviewed'
WHERE slug='general-indicators-of-a-lot';

UPDATE terms SET
  short_definition='A principal class of lots associated with the seven planets. In Abū Maʿshar and Bonatti the luminary lots provide the basic pair before the remaining planetary lots are treated.',
  definition_quality=5,
  status='reviewed'
WHERE slug='planetary-lots';

UPDATE terms SET
  short_definition='Abū Maʿshar’s class of eighty lots organized under the topics of the twelve astrological places, distinct from the seven planetary lots and ten additional lots.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lots-of-the-twelve-places';

UPDATE terms SET
  label='Lot / Part of Fortune',
  short_definition='The principal lunar lot formed from the arc between the Sun and Moon and projected from the Ascendant. Whether the luminary order is reversed at night is source-specific: Abū Maʿshar and Bonatti reverse it, while Lilly explicitly does not.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Do not print one formula as universally traditional. al-Bīrūnī explicitly reports both Ptolemy’s unreversed practice and the sect-reversing practice of other astrologers.'
WHERE slug='lot-of-fortune';

UPDATE terms SET
  label='Lot of Absence / Part of the Sun',
  short_definition='The solar counterpart to the Lot of Fortune in Abū Maʿshar and Bonatti, constructed by reversing the Fortune luminary arc and projecting it from the Ascendant; Bonatti calls it the Part of Things to Be or Part of the Sun.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lot-of-absence';

UPDATE terms SET
  label='Lot / Part of the Haylāǧ',
  short_definition='A calculated lot based on the prenatal conjunction or opposition and the Moon, projected from the Ascendant. Sources explicitly distinguish this calculated point from the haylāǧ itself.',
  definition_quality=5,
  status='reviewed'
WHERE slug='lot-of-the-haylaj';

UPDATE terms SET
  short_definition='Abū Maʿshar’s source-specific paired lot derived from the luminaries and the central degrees of their domiciles, producing two positions associated together with the paired domiciles of a planet.',
  definition_quality=4,
  status='reviewed'
WHERE slug='lot-of-nature-of-planets';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'component-of', 'The two natural/immovable significators supply the interval used in lot extraction.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='natural-indicators-of-a-lot' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'component-of', 'The movable significator is the projection point from which the lot interval is cast.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='movable-indicator' AND b.slug='lot';

-- -----------------------------------------------------------------------------
-- SIGN SUBDIVISIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Dodecatemorion / Twelfth-part',
  short_definition='One of twelve equal 2°30′ subdivisions of a zodiacal sign. The first twelfth corresponds to the sign itself and the following twelfths to the succeeding signs; equivalently, the position within the sign can be multiplied by twelve to locate its twelfth-part through the zodiac.',
  definition_quality=5,
  status='reviewed'
WHERE slug='dodecatemorion';

UPDATE terms SET
  label='Ninth / Nawbahar',
  short_definition='One of nine equal divisions of a sign, each measuring 3°20′, in the Indian ninth-part system transmitted by Abū Maʿshar and al-Bīrūnī. The rulership sequence is source-specific and should not be replaced by a different later scheme.',
  definition_quality=5,
  status='reviewed'
WHERE slug='ninth-nawbahr';

UPDATE terms SET
  label='Darīǧān / Indian Decan',
  short_definition='One of three ten-degree divisions of a sign in the Indian decan system, ruled successively by the ruler of the sign, the ruler of the fifth sign from it, and the ruler of the ninth sign from it.',
  definition_quality=5,
  status='reviewed'
WHERE slug='darijan';

UPDATE terms SET
  short_definition='Abū Maʿshar’s degree-level scheme in which the natures of the twelve signs are assigned successively to the thirty individual degrees of each sign, repeating after the twelfth degree. It is distinct from the 2°30′ dodecatemoria.',
  definition_quality=5,
  status='reviewed'
WHERE slug='degree-sign-nature';

UPDATE terms SET
  short_definition='A transmitted classification of individual degrees or degree ranges as masculine or feminine independently of the sex of the sign as a whole. Abū Maʿshar preserves three competing procedures and treats agreement between them as the stronger testimony.',
  definition_quality=4,
  status='reviewed'
WHERE slug='masculine-feminine-degrees';

-- Terms/bounds systems are genuine alternative systems, not separate kinds of dignity.
UPDATE terms SET
  short_definition='The Egyptian system of planetary terms/bounds, dividing every sign into unequal sections ruled by the five non-luminary planets. Abū Maʿshar explicitly prefers this system among the alternatives he records.',
  definition_quality=5,
  status='reviewed'
WHERE slug='egyptian-terms';

UPDATE terms SET
  short_definition='A distinct system of planetary terms/bounds attributed to Ptolemy, with its own unequal distribution of planetary rulers through each sign.',
  definition_quality=5,
  status='reviewed'
WHERE slug='ptolemaic-terms';

UPDATE terms SET
  short_definition='A historical terms/bounds system attributed to the Chaldeans or Babylonians. Abū Maʿshar reports disagreement and textual confusion in its transmission and therefore does not preserve a single secure full table.',
  definition_quality=4,
  status='reviewed'
WHERE slug='chaldean-terms';

UPDATE terms SET
  label='Terms of Asṭraṭū',
  short_definition='A terms/bounds system attributed by Abū Maʿshar to Asṭraṭū in which the luminaries as well as the five planets receive portions of the signs, distinguishing it structurally from the other systems he records.',
  definition_quality=4,
  status='reviewed'
WHERE slug='astratu-terms';

UPDATE terms SET
  short_definition='An Indian terms/bounds system recorded by Abū Maʿshar, using repeating distributions that differ according to the masculine or feminine class of the sign.',
  definition_quality=5,
  status='reviewed'
WHERE slug='indian-terms';

-- -----------------------------------------------------------------------------
-- DEGREE DOCTRINES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The specific degree traditionally associated with a planet’s exaltation within its exaltation sign. Sources distinguish this degree-level doctrine from exaltation as a dignity of the sign and disagree over how much force belongs to the exact degree.',
  definition_quality=5,
  status='reviewed'
WHERE slug='exaltation-degree';

UPDATE terms SET
  short_definition='A named class in the transmitted bright/dusky/dark/empty degree catalogue. Bright degrees are the favorable/luminous class; the source presents the classification as inherited data rather than deriving it from a calculation.',
  definition_quality=4,
  status='reviewed'
WHERE slug='bright-degree';

UPDATE terms SET
  short_definition='A named adverse class in the transmitted degree catalogue. The manuscript and translation tradition is unstable over the exact distinction among dusky, dark, shadowy and smoky labels, so this class must remain textually qualified.',
  definition_quality=4,
  status='reviewed'
WHERE slug='dusky-degree';

UPDATE terms SET
  short_definition='A named adverse degree class transmitted alongside bright, dusky and empty degrees. Its exact boundary from the dusky/shadowy/smoky category is textually unstable in the surviving witnesses.',
  definition_quality=4,
  status='reviewed'
WHERE slug='dark-degree';

UPDATE terms SET
  short_definition='The “empty” class in a transmitted catalogue of degree qualities, presented as a named inherited category rather than the result of a separate astronomical calculation.',
  definition_quality=4,
  status='reviewed'
WHERE slug='empty-degree';

UPDATE terms SET
  label='Planetary Well / Puteal Degree',
  short_definition='A specified zodiacal degree treated as a pit or well in which a planet or significator is weakened or impeded. The exact degree lists vary between transmitted authorities.',
  definition_quality=5,
  status='reviewed'
WHERE slug='planetary-well';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Puteal Degree', 'Latin/English', 'historical-form', 'Bonatti terminology for the same pit/well degree family.' FROM terms WHERE slug='planetary-well';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Deep Degree', 'English', 'translation-variant', 'Bonatti translation wording for puteal degrees.' FROM terms WHERE slug='planetary-well';

UPDATE terms SET
  short_definition='A transmitted set of particular degrees said by Abū Maʿshar’s earlier authorities to strengthen an already favorable indication. The category is source-specific catalogue doctrine rather than a derived geometrical rule.',
  definition_quality=4,
  status='reviewed'
WHERE slug='degrees-increasing-good-fortune';

UPDATE terms SET
  short_definition='A Bonatti degree class historically associated with a lasting bodily impediment considered inseparable from the native’s constitution. It is preserved as medieval astrological terminology, not as a modern medical category.',
  definition_quality=4,
  status='reviewed'
WHERE slug='azemene-degree';

UPDATE terms SET
  short_definition='Bonatti’s paired-degree relation in which degrees equidistant from the beginnings of movable signs are said to possess equal power or virtue. The geometric principle is clearer than the text’s inconsistent numerical examples.',
  definition_quality=4,
  status='reviewed'
WHERE slug='equal-power-degrees';

-- -----------------------------------------------------------------------------
-- EVIDENCE GRADES
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'lot','lot-extraction','natural-indicators-of-a-lot','movable-indicator',
      'general-indicators-of-a-lot','planetary-lots','lots-of-the-twelve-places',
      'lot-of-fortune','lot-of-absence','lot-of-the-haylaj','lot-of-nature-of-planets',
      'dodecatemorion','ninth-nawbahr','darijan','degree-sign-nature',
      'masculine-feminine-degrees','egyptian-terms','ptolemaic-terms','chaldean-terms',
      'astratu-terms','indian-terms','exaltation-degree','bright-degree','dusky-degree',
      'dark-degree','empty-degree','planetary-well','degrees-increasing-good-fortune',
      'azemene-degree','equal-power-degrees'
    )
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'lot','lot-extraction','natural-indicators-of-a-lot','movable-indicator',
      'general-indicators-of-a-lot','planetary-lots','lots-of-the-twelve-places',
      'lot-of-fortune','lot-of-absence','lot-of-the-haylaj','lot-of-nature-of-planets',
      'dodecatemorion','ninth-nawbahr','darijan','degree-sign-nature',
      'masculine-feminine-degrees','egyptian-terms','ptolemaic-terms','chaldean-terms',
      'astratu-terms','indian-terms','exaltation-degree','bright-degree','dusky-degree',
      'dark-degree','empty-degree','planetary-well','degrees-increasing-good-fortune',
      'azemene-degree','equal-power-degrees'
    )
  );

-- No new quotation is necessary here. Formula disagreement is clearer in source-specific
-- paraphrase, and the modern translated sources do not benefit from decorative quotation.
