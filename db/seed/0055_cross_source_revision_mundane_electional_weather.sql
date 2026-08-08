-- Cross-source editorial revision, pass 9: mundane, electional and weather vocabulary.
-- Run after 0054_cross_source_revision_predictive_time_lords.sql.
--
-- Strict lexicality is especially important here: a memorable configuration, a catalogue,
-- or a useful predictive rule is not automatically a lexicon term.

-- -----------------------------------------------------------------------------
-- PRUNE APPLICATION LABELS / EDITORIAL PROCEDURE LABELS THAT ARE NOT TERMS
-- -----------------------------------------------------------------------------

-- A specific Saturn-Mars configuration in Cancer is a source application of conjunction,
-- dignity and reception doctrine, not an independently named technical concept.
DELETE FROM terms WHERE slug='saturn-mars-cancer-conjunction';

-- 'Eclipse Duration Rule' was our editorial label for a transmitted conversion rule.
-- The passage remains in the source corpus, but the rule does not need its own noun-entry.
DELETE FROM terms WHERE slug='eclipse-duration-rule';

-- 'Comet Judgment' was likewise an extraction heading for a method/catalogue rather than
-- a stable named technical object. Preserve the source passage, not a manufactured term.
DELETE FROM terms WHERE slug='comet-judgment';

-- Electional timing is a body of judgment rules inside Elections, not a distinct named
-- concept in Bonatti. Its useful material remains in the Treatise 7 source passage.
DELETE FROM terms WHERE slug='electional-timing';

-- -----------------------------------------------------------------------------
-- ANIMODAR DUPLICATE FROM TREATISE 4
-- -----------------------------------------------------------------------------

-- The 'Syzygy Almuten Rectification' extraction label describes the same operative
-- method already normalized as Animodar/Namudar: preceding syzygy -> prevailing dignity
-- ruler -> correction of the Ascendant/angle.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='animodar'),
    summary='In Treatise 4 Bonatti gives the same prenatal-syzygy rectification family represented canonically as Animodar: begin from an approximate figure, determine whether the preceding syzygy was a conjunction or opposition, identify the planet prevailing by dignity at that degree, and use its position to correct the Ascendant.',
    evidence_grade='A',
    status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='syzygy-almuten-rectification')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae');

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='syzygy-almuten-rectification');
DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='syzygy-almuten-rectification')
   OR object_term_id=(SELECT id FROM terms WHERE slug='syzygy-almuten-rectification');
DELETE FROM terms WHERE slug='syzygy-almuten-rectification';

-- -----------------------------------------------------------------------------
-- PRENATAL SYZYGY BRANCH TERMS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A nativity or other beginning whose relevant preceding syzygy is a conjunction of the Sun and Moon.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='conjunctional-nativity';

UPDATE terms SET
  short_definition='A nativity or other beginning whose relevant preceding syzygy is an opposition of the Sun and Moon; Bonatti uses “prevention” for this preceding full-Moon condition.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='preventional-nativity';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Conjunctional Beginning', 'English', 'broader-source-form', 'The same preceding-new-Moon branch can apply to beginnings beyond nativities.' FROM terms WHERE slug='conjunctional-nativity';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Preventional Beginning', 'English', 'broader-source-form', 'The same preceding-full-Moon branch can apply to beginnings beyond nativities.' FROM terms WHERE slug='preventional-nativity';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('conjunctional-nativity','preventional-nativity'))
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- ELECTIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The deliberate selection of a fitting future inception for an intended action, arranging the relevant significators so that the beginning supports what is already intended rather than treating the elected chart as the cause of the action itself.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='election';

UPDATE terms SET
  short_definition='Bonatti’s prior astrological foundation for an election, preferably the nativity of the person concerned or a properly grounded horary question, against which the elected beginning is tested for agreement.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='root-of-election';

UPDATE terms SET
  short_definition='Bonatti’s process of making the principal electional factors fit for the intended action by strengthening relevant significators, freeing them from impediment and placing them appropriately, while prioritizing what can realistically be adapted.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='electional-adaptation';

UPDATE terms SET
  short_definition='The operative beginning of an undertaking: the first intrinsic act by which the intended work itself begins, distinguished from planning or other preparation that does not yet constitute the action.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='inception';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('election','root-of-election','electional-adaptation','inception'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'foundation-for', 'Bonatti prefers an election to be grounded in a prior nativity or radical question when available.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='root-of-election' AND b.slug='election';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'operative-moment-of', 'The elected chart belongs to the true inception of the intended work rather than to merely preparatory acts.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='inception' AND b.slug='election';

-- -----------------------------------------------------------------------------
-- MUNDANE ANNUAL FRAMEWORK
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A mundane annual revolution erected for the Sun’s entrance into the first minute of Aries and used to judge the condition of the coming year for a region.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='world-year-revolution';

UPDATE terms SET
  short_definition='The luminary possessing temporal authority in a judgment: the Sun by day and the Moon by night.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='luminary-of-time';

UPDATE terms SET
  short_definition='The planet formally selected in a mundane revolution to represent the king, ruler or highest governing authority, using the source’s hierarchy of tenth-house rulership, solar testimony, dignity and condition.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='significator-of-king';

UPDATE terms SET
  short_definition='One of the traditional latitude zones into which the inhabited world was divided for astronomical and astrological geography; in Bonatti’s mundane doctrine the seven climes are also associated successively with the seven planets.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='clime';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('world-year-revolution','luminary-of-time','significator-of-king','clime'));

-- -----------------------------------------------------------------------------
-- GREAT CONJUNCTION FRAMEWORK
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Great Conjunction Cycle',
  short_definition='The mundane cycle of Saturn-Jupiter conjunctions organized hierarchically by ordinary conjunctions, changes of triplicity and the larger return of the conjunctional sequence to its starting region of the zodiac.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti gives explicit period scales for the hierarchy. Keep those numerical values in the source interpretation rather than building one supposedly universal historical cycle into the canonical definition.'
WHERE slug='great-conjunction-cycle';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='great-conjunction-cycle')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- FIXED STARS IN MUNDANE JUDGMENT
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='An exact or near-exact zodiacal conjunction between a fixed star and a planet, angle or other significator, with operative strength increasing as the positions approach exact degree-and-minute coincidence.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='fixed-star-conjunction';

UPDATE terms SET
  short_definition='A source classification for a fixed star treated as naturally unfortunate or harmful in astrological judgment, whose attributed planetary nature and exact contact with a significator condition the interpretation.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='malefic-fixed-star';

UPDATE terms SET
  short_definition='A source classification for a fixed star treated as naturally fortunate in astrological judgment, whose attributed planetary nature and exact contact with a significator condition the interpretation.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='benefic-fixed-star';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('fixed-star-conjunction','malefic-fixed-star','benefic-fixed-star'));

-- -----------------------------------------------------------------------------
-- WEATHER: OPENING THE DOORS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Opening the Doors',
  short_definition='In al-Bīrūnī’s meteorological terminology, a configuration involving planetary pairs opposed by nature or domicile, used as a testimony for the opening or release of particular kinds of weather.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Keep distinct from Bonatti’s Opening of the Gates, which belongs to reception doctrine and describes reception overcoming planetary hostility.'
WHERE slug='opening-the-doors';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors')
  AND work_id=(SELECT id FROM works WHERE slug='al-biruni-tafhim')
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- BONATTI WEATHER CATEGORIES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Bonatti’s operational category for a planet whose expressed quality changes toward the nature of the planet to which it applies; in his weather doctrine Mercury and the Moon are the principal convertible planets.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='convertible-planet';

UPDATE terms SET
  short_definition='A lunar mansion classified as naturally wet in Bonatti’s meteorological doctrine and therefore contributing moisture testimony when occupied by the relevant lunation or Moon.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='wet-lunar-mansion';

UPDATE terms SET
  short_definition='A lunar mansion classified as naturally dry in Bonatti’s meteorological doctrine and therefore opposing or reducing moisture testimony.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='dry-lunar-mansion';

UPDATE terms SET
  short_definition='A lunar mansion classified as common or temperate rather than intrinsically wet or dry in Bonatti’s meteorological doctrine, so its result depends more strongly on the Moon’s application and the planet involved.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='common-lunar-mansion';

UPDATE terms SET
  short_definition='One of four approximately seven-day divisions of the lunar month from conjunction to conjunction, used by Bonatti as principal checkpoints for changes in weather.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='lunar-dichotomy';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('convertible-planet','wet-lunar-mansion','dry-lunar-mansion','common-lunar-mansion','lunar-dichotomy'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contrasting-class', 'Wet and dry are opposing meteorological mansion classes in Bonatti.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='wet-lunar-mansion' AND b.slug='dry-lunar-mansion';

-- -----------------------------------------------------------------------------
-- COMBUST / INCOMBUST HOURS AND LUNAR DUODENA
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A repeating twelve-hour interval beginning from a Sun-Moon conjunction and recurring after each following seventy-two-hour incombust interval in Bonatti’s transmitted electional time doctrine; it is unrelated to ordinary planetary combustion.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='combust-hours';

UPDATE terms SET
  short_definition='The seventy-two-hour interval following each twelve-hour combust interval in Bonatti’s post-lunation electional cycle, after which the twelve combust hours recur.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='incombust-hours';

UPDATE terms SET
  label='Duodena of the Moon / Lunar Hour Cycle',
  short_definition='A post-lunation temporal subdivision transmitted by Bonatti in which successive planetary or triplicity rulerships are assigned to hour-blocks after the lunation.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti’s Treatise 4 and later Treatise 9 accounts do not organize the hour sequence identically. Preserve both source interpretations rather than forcing a single reconstructed schedule.'
WHERE slug='moon-duodena-hours';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('combust-hours','incombust-hours','moon-duodena-hours'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'The post-lunation cycle alternates a twelve-hour combust interval with a seventy-two-hour incombust interval.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='combust-hours' AND b.slug='incombust-hours';

-- -----------------------------------------------------------------------------
-- FINAL BATCH GRADING
-- -----------------------------------------------------------------------------

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'animodar','conjunctional-nativity','preventional-nativity','election','root-of-election',
      'electional-adaptation','inception','world-year-revolution','luminary-of-time',
      'significator-of-king','clime','great-conjunction-cycle','fixed-star-conjunction',
      'malefic-fixed-star','benefic-fixed-star','opening-the-doors','convertible-planet',
      'wet-lunar-mansion','dry-lunar-mansion','common-lunar-mansion','lunar-dichotomy',
      'combust-hours','incombust-hours','moon-duodena-hours'
    )
  );
