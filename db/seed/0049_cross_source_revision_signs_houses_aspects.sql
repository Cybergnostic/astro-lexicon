-- Cross-source editorial revision, pass 3: zodiacal structure, aspects, houses,
-- ascensional relations and sign classifications.
-- Run after 0048_cross_source_revision_dignity_sect.sql.
--
-- Editorial rule: retain a term only when it names a repeatable configuration,
-- classification, relation or technique. Descriptive effect-labels that merely restate
-- an already-defined aspect are removed.

-- -----------------------------------------------------------------------------
-- NORMALIZE CLEAR ASCENSIONAL SYNONYMS
-- -----------------------------------------------------------------------------

-- Bonatti's "direct ascension" and Abu Ma'shar's "straight-rising" describe the same
-- six-sign long-ascension class: Cancer through Sagittarius.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='straight-rising-signs')
WHERE term_id=(SELECT id FROM terms WHERE slug='direct-ascension-signs');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Signs of Direct Ascension', 'English', 'source-form',
       'Bonatti terminology for the same long/straight-ascension class.'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Long-Ascension Signs', 'English', 'descriptive-equivalent',
       'Later descriptive label for signs whose oblique ascension exceeds thirty degrees in the northern latitudes treated by these sources.'
FROM terms WHERE slug='straight-rising-signs';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='direct-ascension-signs')
   OR object_term_id=(SELECT id FROM terms WHERE slug='direct-ascension-signs');
DELETE FROM terms WHERE slug='direct-ascension-signs';

-- Bonatti's "crooked ascension" and Abu Ma'shar's "crooked-rising" likewise name the
-- same short-ascension class: Capricorn through Gemini.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='crooked-rising-signs')
WHERE term_id=(SELECT id FROM terms WHERE slug='crooked-ascension-signs');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Signs of Crooked Ascension', 'English', 'source-form',
       'Bonatti terminology for the same short/crooked-ascension class.'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Short-Ascension Signs', 'English', 'descriptive-equivalent',
       'Later descriptive label for signs whose oblique ascension is less than thirty degrees in the northern latitudes treated by these sources.'
FROM terms WHERE slug='crooked-rising-signs';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='crooked-ascension-signs')
   OR object_term_id=(SELECT id FROM terms WHERE slug='crooked-ascension-signs');
DELETE FROM terms WHERE slug='crooked-ascension-signs';

-- Bonatti's "harmonious in journeys" uses the same sign-pairs as Abu Ma'shar's
-- signs agreeing in zone/equal ascensional relation. Preserve the source wording as an alias.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='signs-agreeing-in-zone')
WHERE term_id=(SELECT id FROM terms WHERE slug='harmonious-in-journeys');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Harmonious in Journeys', 'English', 'source-form',
       'Bonatti/Alchabitius wording for the same paired-sign relation represented here by agreement in zone/equal ascensional correspondence.'
FROM terms WHERE slug='signs-agreeing-in-zone';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='harmonious-in-journeys')
   OR object_term_id=(SELECT id FROM terms WHERE slug='harmonious-in-journeys');
DELETE FROM terms WHERE slug='harmonious-in-journeys';

-- -----------------------------------------------------------------------------
-- REMOVE DESCRIPTIVE LABELS THAT DO NOT NEED INDEPENDENT ENTRIES
-- -----------------------------------------------------------------------------

-- These three Abu Ma'shar labels merely rename the ordinary aspect classes by their
-- attributed friendliness/hostility. They add no independent recognition rule beyond
-- trine/sextile, quartile and opposition.
DELETE FROM terms WHERE slug IN ('loving-signs','hating-signs','hostile-signs');

-- This extraction label bundles two timing procedures but is not itself a stable technical
-- term. The underlying rising-time and planetary-year doctrines remain independently indexed.
DELETE FROM terms WHERE slug='sign-time-measures';

-- -----------------------------------------------------------------------------
-- ZODIAC, SIGNS AND MODALITIES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The zodiacal belt divided into 360 degrees and twelve equal thirty-degree signs. It is a geometrical framework and is distinct from the unequal pictorial constellations that share several of the same names.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='zodiac';

UPDATE terms SET
  short_definition='One of the twelve equal thirty-degree divisions of the zodiac used as the principal sign framework of astrological judgment, distinct from a stellar constellation or mundane house.',
  definition_quality=5,
  status='reviewed'
WHERE slug='zodiac-sign';

UPDATE terms SET
  short_definition='One of four groups of three signs united by a common elemental nature: fire, earth, air or water.',
  definition_quality=5,
  status='reviewed'
WHERE slug='triplicity';

UPDATE terms SET
  label='Tropical / Movable Sign',
  short_definition='The first sign of a seasonal quadrant, marking the turn into a new seasonal condition: Aries, Cancer, Libra or Capricorn. Medieval sources commonly call this class movable; later terminology often says cardinal.',
  definition_quality=5,
  status='reviewed'
WHERE slug='tropical-sign';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Movable Sign', 'English', 'historical-equivalent', 'Common medieval terminology for the tropical sign class.' FROM terms WHERE slug='tropical-sign';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Cardinal Sign', 'English', 'later-equivalent', 'Later conventional label for the same seasonal-beginning class.' FROM terms WHERE slug='tropical-sign';

UPDATE terms SET
  short_definition='The middle sign of a seasonal quadrant, where the seasonal condition is established or made firm: Taurus, Leo, Scorpio or Aquarius.',
  definition_quality=5,
  status='reviewed'
WHERE slug='fixed-sign';

UPDATE terms SET
  label='Bicorporeal / Common Sign',
  short_definition='The final sign of a seasonal quadrant, sharing the ending condition of one season with the approach of the next: Gemini, Virgo, Sagittarius or Pisces. Medieval sources also call this class common; later terminology often says mutable.',
  definition_quality=5,
  status='reviewed'
WHERE slug='bicorporeal-sign';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Common Sign', 'English', 'historical-equivalent', 'Bonatti and other medieval terminology for the bicorporeal class.' FROM terms WHERE slug='bicorporeal-sign';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Mutable Sign', 'English', 'later-equivalent', 'Later conventional label for the same seasonal-ending class.' FROM terms WHERE slug='bicorporeal-sign';

UPDATE terms SET
  short_definition='A sign in the alternating masculine series beginning with Aries. This is a zodiacal sign classification and is distinct from planetary gender.',
  definition_quality=5,
  status='reviewed'
WHERE slug='masculine-sign';

UPDATE terms SET
  short_definition='A sign in the alternating feminine series beginning with Taurus. This is a zodiacal sign classification and is distinct from planetary gender.',
  definition_quality=5,
  status='reviewed'
WHERE slug='feminine-sign';

UPDATE terms SET
  short_definition='A sign belonging to the alternating diurnal series beginning with Aries. This classification of signs is distinct from the sect membership of planets.',
  definition_quality=5,
  status='reviewed'
WHERE slug='diurnal-sign';

UPDATE terms SET
  short_definition='A sign belonging to the alternating nocturnal series beginning with Taurus. This classification of signs is distinct from the sect membership of planets.',
  definition_quality=5,
  status='reviewed'
WHERE slug='nocturnal-sign';

UPDATE terms SET
  short_definition='The six zodiacal signs lying north of the celestial equator in the sign framework used by Bonatti: Aries through Virgo.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='northern-signs';

UPDATE terms SET
  short_definition='The six zodiacal signs lying south of the celestial equator in the sign framework used by Bonatti: Libra through Pisces.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='southern-signs';

UPDATE terms SET
  short_definition='A historical sign classification based on human or substantially human imagery and associated in the source with rationality and speech.',
  definition_quality=4,
  status='reviewed'
WHERE slug='rational-sign';

UPDATE terms SET
  short_definition='A historical voice classification for signs represented by animals capable of bleating, lowing, roaring or similar sound, intermediate between fully voiced/rational and voiceless classes.',
  definition_quality=4,
  status='reviewed'
WHERE slug='half-voice-sign';

UPDATE terms SET
  short_definition='A historical voice classification for signs represented by creatures treated by the source as lacking voice.',
  definition_quality=4,
  status='reviewed'
WHERE slug='voiceless-sign';

UPDATE terms SET
  short_definition='The zodiacal interval from about 15 degrees Libra to about 15 degrees Scorpio, treated as a distinct adverse zone in medieval astrology. It is unrelated to combustion by solar proximity despite the shared word combust.',
  definition_quality=5,
  status='reviewed'
WHERE slug='via-combusta';

-- -----------------------------------------------------------------------------
-- RISING TIMES, CLIMES AND ASCENSIONAL RELATIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The amount of equatorial or oblique ascension corresponding to the rising of a zodiacal sign or degree at a specified terrestrial latitude.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='rising-times';

UPDATE terms SET
  short_definition='A terrestrial latitude band used in premodern astronomical and astrological calculation, especially for rising times and the length of daylight.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='clime';

UPDATE terms SET
  label='Straight / Direct Ascension Signs',
  short_definition='The six signs Cancer through Sagittarius whose oblique rising times are longer than those of their opposites in the northern latitudes used by these sources; they are also called signs of direct or long ascension.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='straight-rising-signs';

UPDATE terms SET
  label='Crooked / Short Ascension Signs',
  short_definition='The six signs Capricorn through Gemini whose oblique rising times are shorter than those of their opposites in the northern latitudes used by these sources; they are also called signs of crooked or short ascension.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='crooked-rising-signs';

UPDATE terms SET
  short_definition='A paired-sign relation based on equal or corresponding ascensional behavior. Antiochus uses the relation as a form of sympathy even where ordinary zodiacal aspect is absent.',
  definition_quality=4,
  status='reviewed'
WHERE slug='co-rising-relation';

UPDATE terms SET
  label='Signs Agreeing in Zone / Equal Ascension',
  short_definition='A paired-sign relation for signs symmetrically placed around an equinoctial boundary and corresponding in ascensional behavior; Bonatti preserves the same pairs under the label harmonious in journeys.',
  definition_quality=5,
  status='reviewed'
WHERE slug='signs-agreeing-in-zone';

UPDATE terms SET
  short_definition='A paired-sign relation based on equal daytime power or equal day-length conditions, distinct from ordinary zodiacal aspect.',
  definition_quality=5,
  status='reviewed'
WHERE slug='signs-agreeing-in-power';

UPDATE terms SET
  short_definition='A source-specific paired-sign relation based on shared planetary rulership, with Cancer and Leo treated together as the houses of the two luminaries.',
  definition_quality=5,
  status='reviewed'
WHERE slug='signs-agreeing-in-path';

UPDATE terms SET
  short_definition='A historical relation in which a crooked-rising sign is said to obey a corresponding straight-rising sign. Abu Ma''shar also records a closely related use of obedience for signs agreeing in equal daytime power.',
  definition_quality=4,
  status='reviewed'
WHERE slug='obedient-signs';

UPDATE terms SET
  short_definition='Abu Ma''shar''s non-aspecting relation called natural opposition: signs relatively far apart that nevertheless agree through ascensional, daylight-power or rulership/path correspondences. Unlike ordinary opposition, the relation can signify concord.',
  definition_quality=4,
  status='reviewed'
WHERE slug='natural-opposition';

UPDATE terms SET
  short_definition='Abu Ma''shar''s non-aspecting relation called natural sextile: relatively near signs that agree through ascensional, daylight-power or rulership/path correspondences. The textual tradition disagrees over whether its effect is concordant or contrary.',
  definition_quality=4,
  status='reviewed'
WHERE slug='natural-sextile';

UPDATE terms SET
  short_definition='A directional inter-sign relation in Antiochus expressed as one sign hearing or seeing another according to zodiacal order. Its source-specific geometry should not be replaced by ordinary aspect terminology.',
  definition_quality=4,
  status='reviewed'
WHERE slug='hearing-seeing-relation';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'closely-corresponds-to',
       'Antiochus'' co-rising sympathy and the Arabic/Latin equal-ascension relations occupy the same historical family, but the current corpus does not justify collapsing the terminology completely.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='co-rising-relation' AND b.slug='signs-agreeing-in-zone';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'structurally-related-to',
       'Agreement in equal day-length power is geometrically related to the reflection principle underlying antiscia, but the source traditions use the concepts differently and they remain separate.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='signs-agreeing-in-power' AND b.slug='antiscion';

-- -----------------------------------------------------------------------------
-- ASPECTS AND ASPECT-RELATED RELATIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A specified angular relation between zodiacal positions produced by division of the circle. The principal traditional aspects are sextile, square/quartile, trine and opposition; conjunction is treated alongside them in application doctrine, while some later authors also admit minor aspects.',
  definition_quality=5,
  status='reviewed'
WHERE slug='aspect';

UPDATE terms SET
  short_definition='The 180-degree aspect between two zodiacal positions.',
  definition_quality=5,
  status='reviewed'
WHERE slug='opposition';

UPDATE terms SET
  short_definition='The 120-degree aspect between two zodiacal positions.',
  definition_quality=5,
  status='reviewed'
WHERE slug='trine';

UPDATE terms SET
  label='Square / Quartile',
  short_definition='The 90-degree aspect between two zodiacal positions. Earlier sources frequently call it the quartile.',
  definition_quality=5,
  status='reviewed'
WHERE slug='quartile';

UPDATE terms SET
  short_definition='The 60-degree aspect between two zodiacal positions.',
  definition_quality=5,
  status='reviewed'
WHERE slug='sextile';

UPDATE terms SET
  short_definition='An aspect exact by degree, in which the planets occupy the precise zodiacal separation required for the aspect.',
  definition_quality=5,
  status='reviewed'
WHERE slug='partile-aspect';

UPDATE terms SET
  label='Platic / Platick Aspect',
  short_definition='An aspect considered operative within the combined moieties of the two planets'' orbs even though exact degree perfection has not been reached.',
  definition_quality=5,
  status='reviewed'
WHERE slug='platick-aspect';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Platic Aspect', 'English', 'normalized-spelling', 'Normalized spelling of Lilly''s platick.' FROM terms WHERE slug='platick-aspect';

UPDATE terms SET
  short_definition='A zodiacal degree obtained by reflection across the solstitial axis so that the original degree and its antiscion have corresponding solar declination/equal-day relationships.',
  definition_quality=5,
  status='reviewed'
WHERE slug='antiscion';

UPDATE terms SET
  short_definition='The zodiacal degree opposite an antiscion.',
  definition_quality=5,
  status='reviewed'
WHERE slug='contra-antiscion';

UPDATE terms SET
  short_definition='A sign relationship lacking conjunction and the recognized sextile, square, trine or opposition configuration; in the classical sign scheme these are the second, sixth, eighth and twelfth signs from a given sign.',
  definition_quality=5,
  status='reviewed'
WHERE slug='inconjunct';

-- Lilly gives a clean definition that was missed during extraction: dexter aspects run
-- against zodiacal succession, sinister aspects with it.
INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('dexter-aspect', 'Dexter Aspect', 'A directional aspect cast contrary to the succession of the zodiacal signs.', 'aspect doctrine', 'reviewed', 'Lilly defines dexter and sinister direction explicitly in Book I. Do not confuse dexter/sinister direction with benefic/malefic aspect quality.', 'technical', 5),
  ('sinister-aspect', 'Sinister Aspect', 'A directional aspect cast in the order of the succession of the zodiacal signs.', 'aspect doctrine', 'reviewed', 'Lilly defines dexter and sinister direction explicitly in Book I. Do not confuse dexter/sinister direction with benefic/malefic aspect quality.', 'technical', 5);

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '129', '130', 'Book I', 'Chapter XIX',
       'Dexter and sinister aspect definitions, original pp. 108-109',
       'Dexter Aspects are contrary to the succession of Signes, Sinister in order as they follow one another.',
       'Short public-domain quotation selected because the directional distinction is easily confused.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.locator_text='Dexter and sinister aspect definitions, original pp. 108-109'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly calls an aspect dexter when it is cast contrary to the succession of the signs. From Aries, for example, aspects toward Aquarius, Capricorn and Sagittarius are dexter.',
       'Book I, Chapter XIX, dexter/sinister aspects', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='dexter-aspect' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I, Chapter XIX, dexter/sinister aspects'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly calls an aspect sinister when it is cast in the ordinary succession of the signs. From Aries, for example, aspects toward Gemini, Cancer and Leo are sinister.',
       'Book I, Chapter XIX, dexter/sinister aspects', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='sinister-aspect' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I, Chapter XIX, dexter/sinister aspects'
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('dexter-aspect','sinister-aspect')
  AND sp.locator_text='Dexter and sinister aspect definitions, original pp. 108-109';

-- -----------------------------------------------------------------------------
-- HOUSES / PLACES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Twelve Houses / Places',
  short_definition='The twelve astrological places used to organize topics and planetary position in a figure. Across the corpus they are structurally grouped as four angles, four succedents and four cadents, while detailed house geometry and topical assignments remain source-specific.',
  definition_quality=5,
  status='reviewed'
WHERE slug='twelve-places';

UPDATE terms SET
  label='Angle / Cardine',
  short_definition='One of the four principal angular houses or pivots of a figure: the first, tenth, seventh or fourth. Angles begin the four house quadrants and are ordinarily the strongest house positions.',
  definition_quality=5,
  status='reviewed'
WHERE slug='cardine';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Angle', 'English', 'historical-equivalent', 'Common English term for a cardine/pivot.' FROM terms WHERE slug='cardine';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Angular House', 'English', 'descriptive-equivalent', 'House occupying one of the four angles.' FROM terms WHERE slug='cardine';

UPDATE terms SET
  label='Succedent House / Place',
  short_definition='A house immediately following an angle in the structural sequence of the four house quadrants: the second, fifth, eighth or eleventh. Succedents are generally intermediate in strength between angles and cadents.',
  definition_quality=5,
  status='reviewed'
WHERE slug='succedent-place';

UPDATE terms SET
  label='Cadent House / Place',
  short_definition='A house falling away from an angle in the structural sequence of the four house quadrants: the third, sixth, ninth or twelfth. Cadency is generally associated with weaker capacity to act or complete matters, subject to topical exceptions.',
  definition_quality=5,
  status='reviewed'
WHERE slug='cadent-place';

UPDATE terms SET
  short_definition='A house reckoned relative to another person or topic by treating that person''s or topic''s significating house as a temporary first house and counting onward from it.',
  definition_quality=5,
  status='reviewed'
WHERE slug='derived-house';

UPDATE terms SET
  short_definition='Antiochus'' source-specific group of places in which planetary dealings are said to occur, comprising the four pivots together with specified trinal and post-ascensional places.',
  definition_quality=4,
  status='reviewed'
WHERE slug='places-for-dealings';

UPDATE terms SET
  short_definition='Antiochus'' source-specific group of places in which dealings are said not to occur, contrasted with his places for having dealings.',
  definition_quality=4,
  status='reviewed'
WHERE slug='places-without-dealings';

-- The derived-house technique is independently and explicitly explained by Bonatti and Lilly.
-- Keep it as a genuine technical entry rather than treating it as a modern editorial convenience.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'operates-within',
       'Derived houses are generated by recounting the twelve-house sequence from another house taken temporarily as the first.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='derived-house' AND b.slug='twelve-places';

-- -----------------------------------------------------------------------------
-- ASTRONOMICAL MOTION TERMS USED TO EXPLAIN HOUSE ORDER
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The daily east-to-west rotation of the celestial sphere or firmament.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='first-motion';

UPDATE terms SET
  short_definition='The planets'' ordinary west-to-east motion through the zodiac, contrary to the daily first motion except during apparent retrogradation.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='second-motion';

-- -----------------------------------------------------------------------------
-- EVIDENCE GRADING
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'zodiac','zodiac-sign','triplicity','tropical-sign','fixed-sign','bicorporeal-sign',
      'masculine-sign','feminine-sign','diurnal-sign','nocturnal-sign',
      'northern-signs','southern-signs','rising-times','clime',
      'straight-rising-signs','crooked-rising-signs','signs-agreeing-in-zone',
      'signs-agreeing-in-power','signs-agreeing-in-path','obedient-signs',
      'natural-opposition','natural-sextile','co-rising-relation','hearing-seeing-relation',
      'aspect','opposition','trine','quartile','sextile','partile-aspect','platick-aspect',
      'antiscion','contra-antiscion','inconjunct','dexter-aspect','sinister-aspect',
      'twelve-places','cardine','succedent-place','cadent-place','derived-house',
      'places-for-dealings','places-without-dealings','first-motion','second-motion','via-combusta'
    )
  );

-- Topical catalogues and broad structural comparisons are substantial explanations rather
-- than dictionary definitions even when the wording is direct.
UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='twelve-places')
  AND scope IN (
    'Second Tractate, Part III, Ch. V',
    'Second Tractate, Part III, Ch. VIII'
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'zodiac','zodiac-sign','triplicity','tropical-sign','fixed-sign','bicorporeal-sign',
      'rising-times','clime','straight-rising-signs','crooked-rising-signs',
      'signs-agreeing-in-zone','signs-agreeing-in-power','signs-agreeing-in-path',
      'obedient-signs','natural-opposition','natural-sextile','co-rising-relation',
      'hearing-seeing-relation','aspect','opposition','trine','quartile','sextile',
      'partile-aspect','platick-aspect','antiscion','contra-antiscion','inconjunct',
      'twelve-places','cardine','succedent-place','cadent-place','derived-house',
      'places-for-dealings','places-without-dealings','first-motion','second-motion'
    )
  );
