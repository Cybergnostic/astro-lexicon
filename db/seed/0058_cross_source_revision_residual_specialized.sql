-- Cross-source editorial revision, pass 12: residual specialized vocabulary.
-- Run after 0057_cross_source_revision_foundations_motion.sql.
--
-- This pass revisits the remaining source-specific terms from the natal, medical,
-- house-topic and Lilly aspect material. It also repairs one silent Bonatti evidence miss.

-- -----------------------------------------------------------------------------
-- HOUSE-TOPIC EXTRACTION LABELS: KEEP THE EVIDENCE, NOT AN ARBITRARY PARTIAL SET
-- -----------------------------------------------------------------------------

-- The project already has the canonical Twelve Houses / Places entry. During the Bonatti
-- natal pass, standalone entries were created only for the 7th, 8th and 9th houses and for
-- the 'House of Substance' (2nd), while the other houses were represented under the
-- umbrella term. Keeping only four individual house entries would be an extraction artifact,
-- not a coherent ontology. Move their substantive Bonatti evidence to Twelve Houses / Places.

UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='twelve-places'),
    evidence_grade='B',
    status='reviewed'
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN ('house-of-substance','seventh-house','eighth-house','ninth-house')
);

DELETE FROM aliases
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN ('house-of-substance','seventh-house','eighth-house','ninth-house')
);
DELETE FROM term_relations
WHERE subject_term_id IN (
    SELECT id FROM terms WHERE slug IN ('house-of-substance','seventh-house','eighth-house','ninth-house')
  )
   OR object_term_id IN (
    SELECT id FROM terms WHERE slug IN ('house-of-substance','seventh-house','eighth-house','ninth-house')
  );
DELETE FROM terms WHERE slug IN ('house-of-substance','seventh-house','eighth-house','ninth-house');

-- The moved interpretations preserve Bonatti's traditional topical assignments without
-- pretending that the current corpus contains a deliberately complete set of twelve
-- individual house noun-entries.

-- -----------------------------------------------------------------------------
-- DUPLICATE TRIPLICITY-LIFE TERM
-- -----------------------------------------------------------------------------

-- 'Triplicity Lords of the Life Thirds' and 'Triplicity Division of Life' are the same
-- Bonatti structure: first, second and participating triplicity rulers govern successive
-- earlier, middle and later portions of a topic/life. Normalize the extraction duplicate.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division'),
    evidence_grade='A',
    status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-thirds');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Triplicity Lords of the Life Thirds', 'English', 'editorial-source-form',
       'Earlier extraction label for Bonatti’s serial use of the three triplicity rulers across successive periods.'
FROM terms WHERE slug='triplicity-life-division';

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-thirds');
DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='triplicity-life-thirds')
   OR object_term_id=(SELECT id FROM terms WHERE slug='triplicity-life-thirds');
DELETE FROM terms WHERE slug='triplicity-life-thirds';

-- -----------------------------------------------------------------------------
-- BONATTI NATAL TOPICAL RULERS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Dispositor / Significator of the Soul’s Qualities',
  short_definition='Bonatti’s principal natal ruler for the qualities of the soul, determined from a hierarchy centered on Mercury for rational and intellectual qualities, the sect luminary for sensible and vegetative qualities, the rulers of their places, participating planets and angular testimony.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='The procedure is explicit, but Bonatti’s wording varies between significator, ruler, dispositor and al-mubtazz rather than supplying one invariant noun-label. Keep the mechanism while preserving that terminological looseness.'
WHERE slug='significator-of-the-soul';

UPDATE terms SET
  short_definition='The planet selected in Bonatti’s natal doctrine to signify substance and material acquisition from a hierarchy including the Lot of Fortune, the Part of Substance, the second place and its ruler, Jupiter, relevant triplicity rulers and other supporting testimonies.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti explicitly uses the phrase significator of substance and does not reduce the role to the ruler of the second house alone.'
WHERE slug='significator-of-substance';

UPDATE interpretations SET
  evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id=(SELECT id FROM terms WHERE slug='significator-of-substance');

UPDATE interpretations SET
  evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='significator-of-the-soul');

-- -----------------------------------------------------------------------------
-- BONATTI MEDICAL / PSYCHOLOGICAL VOCABULARY
-- -----------------------------------------------------------------------------

-- These are retained because Bonatti explicitly distinguishes the categories. They are
-- historical astrological-medical/philosophical vocabulary only, not modern diagnoses.
UPDATE terms SET
  label='Infirmity (Bonatti)',
  short_definition='In Bonatti’s historical medical-astrological vocabulary, an accident or weakness of the body that arises and subsequently passes away, distinguished from a disease that does not pass away.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical source distinction only; not a modern medical category or diagnostic rule.'
WHERE slug='infirmity';

UPDATE terms SET
  label='Disease (Bonatti)',
  short_definition='In Bonatti’s historical medical-astrological vocabulary, a bodily infirmity or accident that arises and does not pass away, distinguished from the more temporary category he calls infirmity.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical source distinction only; not a modern medical category or diagnostic rule.'
WHERE slug='disease';

UPDATE terms SET
  label='Bodily Impediment (Bonatti)',
  short_definition='Bonatti’s historical category for a discrete bodily impairment or injury that occurs as an event and whose pain does not persist in the recurrent or lasting manner of infirmity or disease.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical source distinction only. The public entry should not reproduce Bonatti’s detailed injury catalogues.'
WHERE slug='bodily-impediment';

UPDATE terms SET
  label='Infirmity of the Soul (Bonatti)',
  short_definition='A historical philosophical-astrological category in Bonatti for disordered or immoderate states of the soul, distinguished by him from bodily infirmity and from impediments of the soul.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Do not equate this medieval category with a modern psychiatric diagnosis. Bonatti’s own discussion distinguishes more fundamental and more transient forms.'
WHERE slug='infirmity-of-soul';

UPDATE terms SET
  label='Impediment of the Soul (Bonatti)',
  short_definition='A historical philosophical-astrological category in Bonatti for a comparatively persistent excess or deficiency in qualities or responses of the soul, distinguished from his category of soul-infirmity.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Do not equate this medieval category with a modern psychiatric diagnosis. Translator philosophical reconstruction remains editorial context, not Bonatti doctrine.'
WHERE slug='impediment-of-soul';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('infirmity','disease','bodily-impediment'));

UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('infirmity-of-soul','impediment-of-soul'));

-- -----------------------------------------------------------------------------
-- LILLY: SHORT JOURNEY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Short Journey (Lilly)',
  short_definition='Lilly’s third-house journey category: roughly twenty to forty miles, or more generally far enough from home that the traveller can go and return the same day or by the next day.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='A direct source-specific delimitation of the third-house travel category. Do not universalize Lilly’s mileage to other authors.'
WHERE slug='short-journey';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='short-journey')
  AND work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology');

-- -----------------------------------------------------------------------------
-- LILLY: HISTORICAL MEDICAL-ASTROLOGY TERMS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='The historical medical-astrology root moment of an illness, ideally taken by Lilly from the time the sick person first becomes sufficiently ill to take to bed; when unknown, he allows specified substitute observation times.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical medical astrology only. This entry records Lilly’s timing concept and is not medical advice.'
WHERE slug='decumbiture';

UPDATE terms SET
  label='Crisis (Medical Astrology)',
  short_definition='In Lilly’s historical medical astrology, a decisive or sudden alteration during an illness, understood as a turning point toward improvement or further sickness and associated with the critical-day doctrine.',
  definition_quality=5,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Historical doctrine only; not a modern clinical definition or diagnostic method.'
WHERE slug='medical-crisis';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('decumbiture','medical-crisis'));

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'root-time-for',
       'Lilly measures the historical crisis/critical-day sequence from the illness beginning represented by the decumbiture or its accepted substitute.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='decumbiture' AND b.slug='critical-days';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'associated-with',
       'Lilly treats the crisis as the decisive alteration expressed through the critical-day sequence.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='medical-crisis' AND b.slug='critical-days';

-- -----------------------------------------------------------------------------
-- LILLY: MINOR / "NEW" ASPECTS
-- -----------------------------------------------------------------------------

-- Book I names Kepler’s newer aspects; Book III supplies a complete numerical list used
-- in directions and closes with Lilly’s qualitative grouping. The 108° aspect is called
-- Tredecile in Book I and Sesquiquintile in Book III, so those forms are normalized.
INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('semisextile', 'Semisextile', 'A minor aspect of 30 degrees.', 'aspect', 'reviewed',
   'Lilly lists it among the newer aspects in Book I and again gives its exact distance in Book III.', 'technical', 5);

UPDATE terms SET
  short_definition='A minor aspect of 36 degrees; Lilly groups it qualitatively with the sextile and trine but says the newer aspects operate more weakly.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='semiquintile';

UPDATE terms SET
  short_definition='A minor aspect of 72 degrees; Lilly groups it qualitatively with the sextile and trine but says the newer aspects operate more weakly.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='quintile';

UPDATE terms SET
  short_definition='A minor aspect of 108 degrees; Lilly calls the same angular distance Tredecile in Book I and Sesquiquintile in Book III, and groups it qualitatively with the sextile and trine.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Within Christian Astrology, Tredecile and Sesquiquintile are two names for the same 108° distance.'
WHERE slug='sesquiquintile';

UPDATE terms SET
  short_definition='A minor aspect of 144 degrees; Lilly groups it qualitatively with the sextile and trine but says the newer aspects operate more weakly.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='biquintile';

UPDATE terms SET
  label='Semisquare / Semiquadrate',
  short_definition='A minor aspect of 45 degrees; Lilly uses both semisquare and semiquadrate and treats it as participating in the nature of the square.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='semisquare';

UPDATE terms SET
  short_definition='A minor aspect of 135 degrees; Lilly treats it as participating in the nature of the square.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='sesquiquadrate';

UPDATE terms SET
  short_definition='An aspect of 150 degrees which Lilly explicitly numbers among the newer aspects.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical'
WHERE slug='quincunx';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Tredecile', 'English', 'Lilly-source-form',
       'Book I name for the 108° aspect called Sesquiquintile in Lilly’s Book III.'
FROM terms WHERE slug='sesquiquintile';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Semiquadrate', 'English', 'Lilly-source-form',
       'Lilly’s Book III name for the 45° aspect also called semisquare in his worked directions.'
FROM terms WHERE slug='semisquare';

-- Narrow source blocks for the exact numerical definitions and Lilly’s qualitative grouping.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '53', '53', 'Book I', 'Introductory aspect list',
       'Lilly: Keplerian newer aspects in Book I', NULL,
       'Lilly lists Semisextile 30°, Quintile 72°, Tredecile 108°, Biquintile 144° and Quincunx 150°. This passage establishes Tredecile as Lilly’s earlier name for the 108° distance.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: Keplerian newer aspects in Book I'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '573', '575', 'Book III', 'Rectification and directional speculum',
       'Lilly: exact degree distances of the new aspects', NULL,
       'Book III gives Semisextile 30°, Semiquintile 36°, Semiquadrate 45°, Quintile 72°, Sesquiquintile 108°, Sesquiquadrate 135° and Biquintile 144°.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: exact degree distances of the new aspects'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '892', '892', 'Book III', 'Closing note',
       'Lilly: qualitative grouping of the new aspects', NULL,
       'Lilly states Quincunx is 150°; the quintile-family aspects participate in sextile/trine nature but more weakly, while Semiquadrate and Sesquiquadrate participate in square nature.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: qualitative grouping of the new aspects'
  );

-- Add the missing Semisextile interpretation.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly lists the semisextile among the newer aspects and defines it as an angular distance of thirty degrees. Book III uses it in the same directional aspect framework as the other new aspects.',
       'Book I p. 53 and Book III pp. 573-575', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='semisextile' AND w.slug='lilly-christian-astrology';

-- Upgrade the already extracted Lilly minor-aspect interpretations and attach the precise
-- numerical source passages. Their existing summaries may be qualitative; the canonical
-- definitions above now carry the exact recognition rule.
UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology')
  AND certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'semisextile','semiquintile','quintile','sesquiquintile','biquintile',
      'semisquare','sesquiquadrate','quincunx'
    )
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('semisextile','semiquintile','quintile','sesquiquintile','biquintile','semisquare','sesquiquadrate')
  AND sp.locator_text='Lilly: exact degree distances of the new aspects';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('quincunx','semiquintile','quintile','sesquiquintile','biquintile','semisquare','sesquiquadrate')
  AND sp.locator_text='Lilly: qualitative grouping of the new aspects';

-- -----------------------------------------------------------------------------
-- BONATTI PLANETARY EMINENCE / ELEVATION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Planetary Eminence / Elevation (Bonatti)',
  short_definition='Bonatti’s transmitted comparison of which of two planets stands above or predominates over the other, determined in one method from relative epicyclic position and in another, which he calls stronger, from their relative ecliptic latitudes.',
  definition_quality=4,
  status='reviewed',
  entry_type='technical',
  editorial_notes='The chapter transmits more than one astronomical test under eminence/elevation. Do not merge this automatically with Hellenistic superior-position or overcoming terminology.'
WHERE slug='planetary-elevation';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-elevation')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- REPAIR BONATTI ELEVENTH-HOUSE TRANSLATION-OF-LIGHT EVIDENCE
-- -----------------------------------------------------------------------------

-- The original 0038 seed tried to attach this evidence to slug='transfer-of-light'. The
-- canonical project term is translation-of-light, so that SELECT silently inserted nothing.
-- Bonatti here extends transfer/translation language across the significators of two
-- nativities; this is useful B-grade evidence, but not a new definition of ordinary horary
-- translation because the significators belong to separate natal figures.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'In his friendship comparison between two nativities, Bonatti extends transfer-of-light language to a third planet transferring light or virtue between the significators of the two figures. He says this can produce a friendship even without direct configuration of the principal significators, though he describes the resulting bond as temporary rather than permanent. This is an extension of the translation concept, not a replacement definition of ordinary single-chart translation of light.',
       'Treatise 9, Part 3, Eleventh House, Ch. 2', 'close_paraphrase', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='translation-of-light' AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Treatise 9, Part 3, Eleventh House, Ch. 2'
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.term_id=(SELECT id FROM terms WHERE slug='translation-of-light')
  AND i.scope='Treatise 9, Part 3, Eleventh House, Ch. 2'
  AND sp.section='Eleventh House';

-- -----------------------------------------------------------------------------
-- GRADE THE MOVED HOUSE EVIDENCE CONSISTENTLY
-- -----------------------------------------------------------------------------

UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='twelve-places')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND scope IN (
    'Treatise 9, Part 3, Second House, Chapters 1 and 8',
    'Treatise 9, Part 3, Seventh House, Chs. 1 and 6-7',
    'Treatise 9, Part 3, Eighth House, Ch. 1',
    'Treatise 9, Part 3, Ninth House, Chs. 1-2',
    'Treatise 9, Part 3, Ninth House, Chs. 3-4'
  );
