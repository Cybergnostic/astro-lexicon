-- Cross-source editorial revision, pass 11: foundational doctrine, astronomical vocabulary,
-- planetary natures and motion.
-- Run after 0056_cross_source_revision_rare_uncertain.sql.
--
-- The early Abu Mashar books contain many concepts that are genuinely important for
-- understanding the intellectual architecture of astrology, but not all are ordinary
-- chart-reading terms. This pass keeps explicit source concepts while marking philosophical
-- framework entries as contextual and refusing to inflate natural-philosophical prose into
-- technical vocabulary.

-- -----------------------------------------------------------------------------
-- THE SCIENCE AND ITS DOCTRINE OF INDICATION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The science that judges terrestrial conditions from the natures, powers, motions and configurations of celestial bodies and from what those celestial conditions signify at a specified time.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Abu Mashar explicitly distinguishes astrology from the astronomical branch he calls the Science of the Universe. His definition also distinguishes celestial indication from the event indicated.'
WHERE slug='astrology';

UPDATE terms SET
  short_definition='Abu Mashar’s umbrella “science of the stars,” comprising both the astronomical study of celestial motions and the astrological study of celestial natures and indications.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual'
WHERE slug='science-of-the-stars';

UPDATE terms SET
  short_definition='Abu Mashar’s name for the astronomical branch that studies the celestial spheres, their dimensions and motions, planetary order and speed, eclipses and related celestial quantities.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='A historical source term corresponding functionally to astronomy within Abu Mashar’s twofold division of the science of the stars.'
WHERE slug='science-of-the-universe';

UPDATE terms SET
  short_definition='The significatory relation by which a celestial condition points to, or is taken as a sign of, a terrestrial condition without being identical to the thing signified.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Abu Mashar repeatedly separates indication from causal celestial power. The distinction is methodological and should not be flattened into a generic word for prediction.'
WHERE slug='indication';

UPDATE terms SET
  short_definition='A celestial indication whose scope applies broadly to a genus, species, population, general condition or other universal class rather than to one narrowly specified individual instance.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual'
WHERE slug='universal-indication';

UPDATE terms SET
  short_definition='A celestial indication restricted to an individual, bodily part, exact degree, specific quality or another narrowly delimited matter.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual'
WHERE slug='particular-indication';

UPDATE terms SET
  short_definition='Abu Mashar’s class of sufficiently evident or knowable stellar indications that can be used in practical astrological judgment.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='obvious-indication';

UPDATE terms SET
  short_definition='Abu Mashar’s class of subtle or remote stellar indications whose exact signification is acknowledged as possible but is not considered reliably comprehensible for practical judgment.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='hidden-indication';

UPDATE terms SET
  short_definition='The condition of future possibility in which more than one outcome remains possible before an event is actualized, leaving room for deliberation and choice.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Retained because contingency is structurally important to Abu Mashar’s defense of astrological prediction without strict necessity; it is philosophical framework rather than a chart factor.'
WHERE slug='contingency';

UPDATE terms SET
  short_definition='Advance knowledge of a future condition obtained through astrological judgment, valued by Abu Mashar because preparation, avoidance or mitigation may still be possible even when the event itself is not wholly preventable.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='foreknowledge';

UPDATE terms SET
  short_definition='A practitioner who knows the conditions and indications of the stars and judges what they signify for a present or specified future time.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Retained because Abu Mashar gives an explicit source definition, although this is a professional role rather than a chart technique.'
WHERE slug='astrologer';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'astrology','science-of-the-stars','science-of-the-universe','indication',
      'universal-indication','particular-indication','obvious-indication','hidden-indication',
      'contingency','foreknowledge','astrologer'
    )
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A universal indication is one scope-class within Abu Mashar’s doctrine of indication.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='universal-indication' AND b.slug='indication';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A particular indication is one scope-class within Abu Mashar’s doctrine of indication.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='particular-indication' AND b.slug='indication';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Obvious/knowable indications are the practically usable epistemic class in Abu Mashar.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='obvious-indication' AND b.slug='indication';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Hidden/subtle indications are acknowledged but exceed reliable practical comprehension.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='hidden-indication' AND b.slug='indication';

-- -----------------------------------------------------------------------------
-- COSMOLOGICAL FRAMEWORK: KEEP AS CONTEXT, NOT AS CHART TECHNIQUE
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The terrestrial realm beneath the lunar sphere in which elemental alteration, generation and corruption occur in the traditional cosmological model.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='sublunary-world';

UPDATE terms SET
  short_definition='Fire, air, water and earth, the four mutable elements or natures of the traditional sublunary cosmology used by Abu Mashar to explain terrestrial composition and change.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='four-elements';

UPDATE terms SET
  short_definition='The distinct celestial nature traditionally attributed to the spheres and stars, contrasted with the four mutable elements of the sublunary world.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='fifth-nature';

-- Celestial Power is useful only insofar as it preserves Abu Mashar’s explicit distinction
-- between causal power and significatory indication. Do not make it an effects catalogue.
UPDATE terms SET
  short_definition='The causal or altering power Abu Mashar attributes to celestial bodies and their motions, distinguished from the separate relation by which those same conditions signify terrestrial events.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='celestial-power';

UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('sublunary-world','four-elements','fifth-nature','celestial-power')
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'Abu Mashar explicitly distinguishes causal celestial power from the significatory relation called indication.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='celestial-power' AND b.slug='indication';

-- Bonatti's Astral Influence is the same broad causal family, but neither source supplies
-- evidence for a stable historical lexical identity between the translated labels.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'conceptually-corresponds-to', 'Both entries describe celestial causal action on the lower world; the translated vocabulary is not normalized as one historical term.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='astral-influence' AND b.slug='celestial-power';

-- -----------------------------------------------------------------------------
-- BASIC CELESTIAL VOCABULARY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The seven traditional wandering stars: Saturn, Jupiter, Mars, the Sun, Venus, Mercury and the Moon, distinguished from the fixed stars by their faster and more varied motions.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='seven-planets';

UPDATE terms SET
  short_definition='Stars treated in traditional astronomy as sharing the slow motion of the stellar sphere, in contrast with the seven wandering planets.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='fixed-stars';

UPDATE terms SET
  short_definition='A classification of fixed stars by apparent brightness, traditionally arranged in successive magnitude classes.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='stellar-magnitude';

UPDATE terms SET
  short_definition='A conventional figure formed by grouping stars into an imagined stellar pattern; distinct from the equal thirty-degree zodiacal signs even where the names overlap.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='constellation';

UPDATE terms SET
  short_definition='The Sun and Moon considered together as the two principal celestial lights.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='luminaries';

UPDATE terms SET
  short_definition='One of the twenty-eight traditional stations or divisions associated with the Moon and used in several branches of astrology, including electional and meteorological doctrine.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='lunar-mansions';

UPDATE terms SET
  short_definition='The increase of the Moon’s visible illuminated portion during the cycle from conjunction toward opposition.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='waxing';

UPDATE terms SET
  short_definition='The decrease of the Moon’s visible illuminated portion during the cycle from opposition toward the following conjunction.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='waning';

UPDATE terms SET
  short_definition='One of four quarter-sections of the celestial sphere or zodiacal cycle, used as a structural astronomical division and, in seasonal doctrine, as a quarter beginning from a tropical point.',
  definition_quality=4,
  status='reviewed',
  entry_type='astronomical',
  editorial_notes='The word quadrant is used in more than one closely related geometrical context. Keep the canonical definition broad and let source interpretations specify seasonal or horizon-based usage.'
WHERE slug='quadrant-of-sphere';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'seven-planets','fixed-stars','stellar-magnitude','constellation','luminaries',
      'lunar-mansions','waxing','waning','quadrant-of-sphere'
    )
  );

-- -----------------------------------------------------------------------------
-- HISTORICAL MEDICAL TIMING: RETAIN ONLY AS A CONTEXTUAL TECHNICAL TERM
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A historical medical-astrology timing doctrine in which specified days of an illness are treated as crisis points, commonly related to the Moon reaching particular angular distances from an earlier lunar position.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical doctrine only. The lexicon records what the sources mean by the term and does not present the method as medical advice or a modern diagnostic tool.'
WHERE slug='critical-days';

UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='critical-days');

-- -----------------------------------------------------------------------------
-- PLANETARY NATURE, PROPERTY AND VARIABLE CLASSIFICATION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The qualitative hot, cold, wet and dry nature attributed to a planet from its traditional action and indication, without implying that the celestial body is literally composed of those terrestrial qualities.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='planetary-nature';

UPDATE terms SET
  short_definition='A planet-specific operative characteristic or power distinguished by Abu Mashar from the planet’s hot/cold/wet/dry nature and used to explain its characteristic fortunate or unfortunate action.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual'
WHERE slug='planetary-property';

UPDATE terms SET
  short_definition='A planet whose manifested quality readily changes according to association and condition rather than remaining simply benefic or malefic; Abu Mashar treats Mercury as the principal example.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical'
WHERE slug='mixed-planet';

UPDATE terms SET
  short_definition='Abu Mashar’s condition in which a planet normally classed as malefic operates in a benefic-like manner because its situation tempers or redirects its usual action, without changing its underlying class.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='in-nature-of-benefics';

UPDATE terms SET
  short_definition='Abu Mashar’s condition in which a planet normally classed as benefic operates in a malefic-like manner because its situation corrupts or redirects its usual action, without changing its underlying class.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='in-nature-of-malefics';

UPDATE terms SET
  short_definition='The classification of a planet as masculine, distinct from the separate classification of zodiacal signs by gender; source authors can modify the planet’s manifested gender by phase or association.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='planetary-masculinity';

UPDATE terms SET
  short_definition='The classification of a planet as feminine, distinct from the separate classification of zodiacal signs by gender; source authors can modify the planet’s manifested gender by phase or association.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='planetary-femininity';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'planetary-nature','planetary-property','mixed-planet','in-nature-of-benefics',
      'in-nature-of-malefics','planetary-masculinity','planetary-femininity'
    )
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'Abu Mashar explicitly distinguishes a planet’s attributed elementary nature from its source-specific operative property.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-property' AND b.slug='planetary-nature';

-- -----------------------------------------------------------------------------
-- MOTION AND APOGEE-PHASE VOCABULARY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Apparent forward motion of a planet through the zodiac, opposite in direction to retrograde motion.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='direct-motion';

UPDATE terms SET
  short_definition='The apparent slowing to temporary stillness at a turning point between direct and retrograde motion; traditional authors distinguish a first and second station according to the direction of the change.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='station';

UPDATE terms SET
  short_definition='Apparent backward motion of a planet through the zodiac relative to its ordinary direct motion.',
  definition_quality=5,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='retrogradation';

UPDATE terms SET
  short_definition='A phase in Abu Mashar’s geocentric planetary model in which a planet is moving toward the apogee region of its eccentric/deferent, used as a modifier of the planet’s attributed qualities.',
  definition_quality=4,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='ascending-in-apogee-orb';

UPDATE terms SET
  short_definition='A phase in Abu Mashar’s geocentric planetary model in which a planet is moving away from the apogee region toward the opposite portion of its eccentric/deferent, used as a modifier of the planet’s attributed qualities.',
  definition_quality=4,
  status='reviewed',
  entry_type='astronomical'
WHERE slug='descending-in-apogee-orb';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'direct-motion','station','retrogradation','ascending-in-apogee-orb','descending-in-apogee-orb'
    )
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-to', 'The apogee-orb phase terminology describes motion relative to the same geocentric apogee/auge framework represented by Bonatti’s Auge.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='ascending-in-apogee-orb' AND b.slug='auge';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-to', 'The apogee-orb phase terminology describes motion relative to the same geocentric apogee/auge framework represented by Bonatti’s Auge.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='descending-in-apogee-orb' AND b.slug='auge';

-- -----------------------------------------------------------------------------
-- REPAIR A SILENT BONATTI EXTRACTION MISS: FERAL / WILD
-- -----------------------------------------------------------------------------

-- The original Tractatus 3 seed attempted to insert this interpretation under slug='wild'.
-- No such canonical term existed, so the SELECT inserted nothing. The later normalization
-- established Feral as the canonical term; restore Bonatti’s actual A-grade evidence here.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Bonatti distinguishes a feral or rustic planet from an ordinary void-of-course planet. A planet is feral when it is alone in a sign and no planet aspects it there; the stricter absence of aspect is therefore part of the condition rather than merely the absence of a new application.',
       'Third Tractate, Part II, Chapters XII-XIII', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='feral' AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Third Tractate, Part II, Chapters XII-XIII'
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.term_id=(SELECT id FROM terms WHERE slug='feral')
  AND i.scope='Third Tractate, Part II, Chapters XII-XIII'
  AND sp.book='Third Tractate'
  AND sp.page_start='307';

-- -----------------------------------------------------------------------------
-- EVIDENCE HYGIENE
-- -----------------------------------------------------------------------------

-- All retained direct interpretations in this pass are true definitions/mechanisms or
-- substantial source explanations. The philosophical framework entries are B even where
-- direct because their value to the lexicon is contextual rather than operational.
UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'sublunary-world','four-elements','fifth-nature','celestial-power','critical-days'
    )
  )
  AND evidence_grade IS NULL;
