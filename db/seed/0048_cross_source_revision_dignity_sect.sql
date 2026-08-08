-- Cross-source editorial revision, pass 2: dignity, sect and several now-clear
-- cross-tradition synonym families.
-- Run after 0047_cross_source_revision_core.sql.

-- -----------------------------------------------------------------------------
-- CLEAR SYNONYM / NORMALIZATION CASES
-- -----------------------------------------------------------------------------

-- Abū Maʿshar's Part VII ḥayyiz is the same compound condition represented by the
-- canonical Hayz entry. The extraction temporarily kept 'planetary-domain' separate because
-- the Brill translation used 'domain'. Now that al-Biruni and Lilly give the same structural
-- condition, normalize the translation label as an alias rather than a second term.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction')
  AND term_id=(SELECT id FROM terms WHERE slug='hayz')
  AND scope='Part VII, Chapter 1, §1.13';

UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='hayz')
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-domain');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Domain', 'English', 'source-translation', 'Yamamoto/Burnett rendering of Abū Maʿshar’s ḥayyiz in Part VII.'
FROM terms WHERE slug='hayz';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Ḥayyiz', 'Arabic transliteration', 'historical-form', 'Arabic source term underlying the later Latin/English form hayz.'
FROM terms WHERE slug='hayz';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='planetary-domain')
   OR object_term_id=(SELECT id FROM terms WHERE slug='planetary-domain');
DELETE FROM terms WHERE slug='planetary-domain';

-- Al-Biruni's mubtazz is explicitly the predominating/victorious planet by accumulated
-- dignities/testimonies and the seed already notes its later Almuten equivalence.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='almuten')
WHERE term_id=(SELECT id FROM terms WHERE slug='mubtazz');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Mubtazz', 'Arabic/Persian transliteration', 'historical-form', 'Al-Biruni’s term for the planet prevailing by the strongest relevant dignities or testimonies.'
FROM terms WHERE slug='almuten';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='mubtazz')
   OR object_term_id=(SELECT id FROM terms WHERE slug='mubtazz');
DELETE FROM terms WHERE slug='mubtazz';

-- Antiochus' reciprocal mastership is a source-specific reciprocal form of reception.
-- It does not need a second canonical entry beside Reception.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='reception')
WHERE term_id=(SELECT id FROM terms WHERE slug='reciprocal-mastership');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Reciprocal Mastership', 'English', 'source-specific-form', 'Antiochus’ reciprocal dignity relation; a mutual/reciprocal form within the broader reception family.'
FROM terms WHERE slug='reception';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Reciprocal Rulership', 'English', 'translation-variant', 'Descriptive English variant for Antiochus’ reciprocal mastership.'
FROM terms WHERE slug='reception';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='reciprocal-mastership')
   OR object_term_id=(SELECT id FROM terms WHERE slug='reciprocal-mastership');
DELETE FROM terms WHERE slug='reciprocal-mastership';

-- Abū Maʿshar's solitary motion is definitionally the same family later called void of course:
-- separation followed by no further application during the remainder of the sign.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='void-of-course')
WHERE term_id=(SELECT id FROM terms WHERE slug='solitary-motion');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Solitary Motion', 'English', 'source-translation', 'Abū Maʿshar’s translated label for the no-further-application condition during the remainder of a sign.'
FROM terms WHERE slug='void-of-course';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='solitary-motion')
   OR object_term_id=(SELECT id FROM terms WHERE slug='solitary-motion');
DELETE FROM terms WHERE slug='solitary-motion';

-- Abū Maʿshar's wildness and al-Biruni's feral condition share the stricter criterion that
-- no planet aspects the planet during its passage through the sign. Keep this separate from
-- void of course, but normalize the two source labels under Feral.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='feral')
WHERE term_id=(SELECT id FROM terms WHERE slug='wild-planet');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Wild Planet', 'English', 'source-translation', 'Abū Maʿshar’s translated label for the condition later represented here by Feral.'
FROM terms WHERE slug='feral';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Wildness', 'English', 'source-translation', 'Abū Maʿshar’s noun form for the feral condition.'
FROM terms WHERE slug='feral';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='wild-planet')
   OR object_term_id=(SELECT id FROM terms WHERE slug='wild-planet');
DELETE FROM terms WHERE slug='wild-planet';

-- Besieging / besiegement is one concept with source-specific bodily/ray variants.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='besiegement')
WHERE term_id=(SELECT id FROM terms WHERE slug='besieging');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Besieging', 'English', 'source-form', 'Abū Maʿshar source label for the besiegement/enclosure condition.'
FROM terms WHERE slug='besiegement';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='besieging')
   OR object_term_id=(SELECT id FROM terms WHERE slug='besieging');
DELETE FROM terms WHERE slug='besieging';

-- -----------------------------------------------------------------------------
-- DIGNITIES AND DEBILITIES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A zodiacal sign assigned as a planet’s own place of rulership or house. In the standard scheme the Sun and Moon have one domicile each and the other five planets have two.',
  definition_quality=5,
  status='reviewed'
WHERE slug='domicile';

UPDATE terms SET
  short_definition='A planetary dignity assigned to a traditional exaltation sign, often also associated with a particular exaltation degree. Historical authors disagree over how strongly the dignity is tied to the exact degree rather than the sign as a whole.',
  definition_quality=5,
  status='reviewed'
WHERE slug='exaltation';

UPDATE terms SET
  short_definition='The essential debility corresponding to exaltation, located opposite the planet’s exaltation position, ordinarily in the opposite sign and in some traditions also relative to the exaltation degree.',
  definition_quality=5,
  status='reviewed'
WHERE slug='fall';

UPDATE terms SET
  short_definition='The essential debility of a planet placed in the sign opposite one of its domiciles.',
  definition_quality=5,
  status='reviewed'
WHERE slug='detriment';

UPDATE terms SET
  label='Face / Decan',
  short_definition='One of the thirty-six ten-degree divisions of the zodiac, three to each sign. In dignity doctrine each face/decan is assigned a planetary ruler; alternative decan systems such as the Indian darīǧān are kept distinct.',
  definition_quality=5,
  status='reviewed'
WHERE slug='face-decan';

UPDATE terms SET
  short_definition='Planetary rulers assigned to each elemental triplicity, normally differentiated by day and night and, in several traditions, by an additional participating ruler. The exact rulership order is source-specific.',
  definition_quality=5,
  status='reviewed'
WHERE slug='triplicity-rulers';

UPDATE terms SET
  short_definition='A broad source-specific framework of planetary participation or share in a zodiacal sign, embracing major dignities and lesser subdivisions and, in Abū Maʿshar, some adverse or special degree conditions as well.',
  definition_quality=4
WHERE slug='planetary-share';

-- -----------------------------------------------------------------------------
-- SECT FAMILY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The division of charts and planets into diurnal and nocturnal conditions, used to judge whether a planet is operating in a context appropriate to its day or night class. Planetary membership and auxiliary sect conditions must remain source-specific where the texts differ.',
  definition_quality=5,
  status='reviewed'
WHERE slug='sect';

UPDATE terms SET
  short_definition='A planet assigned to the diurnal sect or day group in a given tradition.',
  definition_quality=5,
  status='reviewed'
WHERE slug='diurnal-planet';

UPDATE terms SET
  short_definition='A planet assigned to the nocturnal sect or night group in a given tradition.',
  definition_quality=5,
  status='reviewed'
WHERE slug='nocturnal-planet';

UPDATE terms SET
  short_definition='A sect condition in which a diurnal planet is above the horizon by day and below it by night, while a nocturnal planet is above by night and below by day.',
  definition_quality=5,
  status='reviewed'
WHERE slug='halb';

UPDATE terms SET
  short_definition='A compound sect condition that includes the horizon/day-night conformity of halb and additionally matches planetary gender with the gender of the occupied sign. Source traditions may treat Mars exceptionally.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Al-Biruni explicitly distinguishes halb from hayz: hayz contains the halb condition plus sign-gender conformity. Lilly gives the same compound structure. Abū Maʿshar’s ḥayyiz/domain is normalized here as a source-specific hayz interpretation.'
WHERE slug='hayz';

UPDATE terms SET
  short_definition='Bonatti’s accidental fortitude in which sect, position above or below the horizon, and planetary/sign gender conform in the same compound pattern. Bonatti calls the condition “own similitude” and associates it with Aym.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Structurally very close to hayz, but retained as a source-visible term because Bonatti’s wording and the Aym identification have their own transmission/editorial history.'
WHERE slug='own-similitude';

-- Curated relations for the sect family.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'component-of', 'Al-Biruni explicitly says hayz includes the horizon/sect conformity defined as halb and adds sign-gender conformity.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='halb' AND b.slug='hayz';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'closely-corresponds-to', 'Bonatti’s own-similitude/Aym definition has the same compound sect-horizon-gender structure as hayz, but the historical terminology is retained separately.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='own-similitude' AND b.slug='hayz';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A diurnal planet is a member of the day side of the sect division.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='diurnal-planet' AND b.slug='sect';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A nocturnal planet is a member of the night side of the sect division.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='nocturnal-planet' AND b.slug='sect';

-- -----------------------------------------------------------------------------
-- ALMUTEN / PREDOMINANCE FAMILY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Almuten',
  short_definition='The planet that prevails in a specified degree, house or topic by possessing the greatest total of the relevant dignities or testimonies, and is therefore chosen as the principal ruler or significator for that matter.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Includes Bonatti’s Almutes/Victor and al-Biruni’s mubtazz terminology. Do not collapse a topic-specific almuten with the more specialized Almuten of the Figure.'
WHERE slug='almuten';

UPDATE terms SET
  short_definition='The planet judged strongest in the whole chart by the combined weight of essential and accidental fortitude, distinguished from an almuten calculated for one particular house or topic.',
  definition_quality=5,
  status='reviewed'
WHERE slug='almuten-of-figure';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialization-of', 'Lilly distinguishes the almuten of the whole figure from the almuten of a particular house or topic.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='almuten-of-figure' AND b.slug='almuten';

-- -----------------------------------------------------------------------------
-- ACCIDENTAL DIGNITY / JOY / ENCLOSURE
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Strength arising from a planet’s circumstances rather than from sign-based essential dignity, including conditions such as angularity, direct or swift motion, favorable configurations, solar freedom and other contextual fortitudes recognized by the source.',
  definition_quality=5,
  status='reviewed'
WHERE slug='accidental-fortitude';

UPDATE terms SET
  short_definition='A source-variable condition of planetary congruence or rejoicing. The best-known form places each planet in its traditional house of joy, while some authors use the language of joy more broadly for other conditions congenial to the planet.',
  definition_quality=4
WHERE slug='planetary-joy';

UPDATE terms SET
  short_definition='A condition in which a planet is enclosed between two planets or their rays. Sources distinguish bodily besiegement from besiegement by rays and may describe enclosure by benefics as a favorable counterpart to enclosure by malefics.',
  definition_quality=5,
  status='reviewed'
WHERE slug='besiegement';

UPDATE terms SET
  short_definition='A stricter no-contact condition than void of course: during the planet’s passage through a sign, no other planet forms an aspect with it. Historical sources also call this wild or feral.',
  definition_quality=5,
  status='reviewed'
WHERE slug='feral';

-- -----------------------------------------------------------------------------
-- EVIDENCE GRADES FOR THIS FAMILY
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'domicile','exaltation','fall','detriment','face-decan','triplicity-rulers',
      'sect','diurnal-planet','nocturnal-planet','halb','hayz','own-similitude',
      'almuten','almuten-of-figure','accidental-fortitude','besiegement','feral'
    )
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'domicile','exaltation','fall','detriment','face-decan','triplicity-rulers',
      'sect','diurnal-planet','nocturnal-planet','halb','hayz','own-similitude',
      'almuten','almuten-of-figure','accidental-fortitude','besiegement','feral'
    )
  );
