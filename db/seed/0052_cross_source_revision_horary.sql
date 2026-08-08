-- Cross-source editorial revision, pass 6: horary / interrogational vocabulary.
-- Run after 0051_cross_source_revision_lots_subdivisions.sql.
--
-- A question term is retained only when it names a real role, chart condition,
-- question class, timing rule, or reusable procedure. Merely mentioning that questions
-- can be judged is not enough to create a source interpretation.

-- -----------------------------------------------------------------------------
-- PRUNE MENTION-LEVEL ABŪ MAʿSHAR ENTRY
-- -----------------------------------------------------------------------------

-- Part I names questions alongside nativities and annual revolutions but does not define
-- the interrogational method there. Now that al-Bīrūnī and Lilly provide actual question
-- doctrine, the provisional Abū Maʿshar 'Astrological Question' entry fails the A/B test.
DELETE FROM terms WHERE slug='astrological-question';

-- -----------------------------------------------------------------------------
-- ROOTED / RADICAL QUESTION: SAME TECHNICAL FAMILY
-- -----------------------------------------------------------------------------

-- Bonatti's 'rooted' and Lilly's 'radical' question use the same core test: agreement of
-- the lord of the hour with the Ascendant/lord by identity, triplicity or compatible nature.
-- Keep the source wording as aliases rather than two canonical terms.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='radical-question')
WHERE term_id=(SELECT id FROM terms WHERE slug='rooted-question');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Rooted Question', 'English', 'source-translation',
       'Bonatti translation wording for the horary condition later represented by radical/radicality terminology.'
FROM terms WHERE slug='radical-question';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Radical Figure', 'English', 'historical-form',
       'A horary figure considered rooted and fit to receive judgment.'
FROM terms WHERE slug='radical-question';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='rooted-question')
   OR object_term_id=(SELECT id FROM terms WHERE slug='rooted-question');
DELETE FROM terms WHERE slug='rooted-question';

UPDATE terms SET
  short_definition='A horary question whose figure is considered genuinely rooted and fit for judgment. In Bonatti and Lilly the core test is concordance between the lord of the hour and the Ascendant or its ruler by identity, triplicity or compatible planetary nature; additional cautions are source-specific.',
  definition_quality=5,
  status='reviewed'
WHERE slug='radical-question';

-- -----------------------------------------------------------------------------
-- BASIC HORARY ROLES MISSED AS STANDALONE TERMS
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('querent', 'Querent',
   'The person who asks or propounds the horary question and seeks the judgment.',
   'horary astrology', 'reviewed',
   'Lilly defines the term directly in Book I Chapter XX.', 'technical', 5),
  ('quesited', 'Quesited',
   'The person, thing or matter sought or inquired about in a horary question.',
   'horary astrology', 'reviewed',
   'Lilly spells the term Quesited/Questied in the digital text.', 'technical', 5),
  ('significator', 'Significator',
   'A planet or other appointed factor used to represent a person, thing or topic in astrological judgment; in horary, the principal significator is ordinarily the ruler of the house assigned to that person or matter.',
   'signification doctrine', 'reviewed',
   'The definition is broader than horary, but Lilly gives an unusually explicit horary definition in Book I Chapter XX.', 'technical', 5);

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Questied', 'English', 'source-spelling', 'Variant spelling in Lilly’s headings/text.' FROM terms WHERE slug='quesited';

-- Narrow source block because Lilly gives dictionary-like definitions here.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '144', '145', 'Book I', 'Chapter XX',
       'Lilly: definitions of Querent, Quesited and Significator',
       'The Querent is he or she that propounds the question, and desires resolution: the Quesited is he or she, or the thing sought and enquired after.',
       'Short public-domain quotation retained because Lilly’s wording is explicitly lexical and defines two role terms in one sentence.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: definitions of Querent, Quesited and Significator'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly defines the querent as the person who propounds the question and seeks resolution. In ordinary horary judgment the Ascendant and its lord are assigned to the querent, with the Moon serving as a general cosignificator.',
       'Book I, Chapter XX', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='querent' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly defines the quesited as the person, thing or matter sought and inquired after. Its principal horary house is selected from the subject of the question, and the ruler of that house becomes its principal significator.',
       'Book I, Chapter XX', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='quesited' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly defines a significator in horary as the planet ruling the house that signifies the person or thing demanded. The Ascendant ruler signifies the querent, while the ruler of the house appropriate to the matter signifies the quesited.',
       'Book I, Chapter XX', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='significator' AND w.slug='lilly-christian-astrology';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('querent','quesited','significator')
  AND sp.locator_text='Lilly: definitions of Querent, Quesited and Significator';

UPDATE terms SET
  short_definition='A secondary planet or factor that participates in signifying the same person or matter alongside the principal significator.',
  definition_quality=5,
  status='reviewed'
WHERE slug='cosignificator';

-- -----------------------------------------------------------------------------
-- HORARY QUESTION AND ITS ROOT TIME
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Horary / Interrogational Question',
  short_definition='An astrological judgment erected from the time a question is genuinely presented or received, assigning the Ascendant and its ruler to the querent and the relevant house and its ruler to the matter asked about, with the Moon and other source-specific significators also considered.',
  definition_quality=5,
  status='reviewed'
WHERE slug='horary-question';

-- Lilly gives strong method evidence even though his heading simply says Questions rather than
-- using a modern taxonomy label. This is substantive explanation, not a second invented definition.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Lilly’s interrogational method begins by assigning the Ascendant and its lord to the person asking, then selecting the house belonging to the subject of the inquiry and its lord for the quesited. The Moon is a general cosignificator of the querent, and perfection is judged from the relationships among these significators.',
       'Book I, Chapters XX-XXI', 'close_paraphrase', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='horary-question' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I, Chapters XX-XXI'
  );

UPDATE terms SET
  short_definition='The moment used as the root time for erecting a horary figure. Lilly takes it as the moment the astrologer actually receives and understands the question or intention; for a written question, when it is opened and understood rather than merely delivered.',
  definition_quality=5,
  status='reviewed'
WHERE slug='horary-question-time';

-- The existing Book II passage already supports this term; grade it now.
UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='horary-question-time')
  AND work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology');

-- -----------------------------------------------------------------------------
-- BONATTI QUESTION CLASSES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Bonatti’s class of horary question asked about a subject in general without restricting it to a particular person, source, object, transaction or instance.',
  definition_quality=5,
  status='reviewed'
WHERE slug='absolute-question';

UPDATE terms SET
  short_definition='Bonatti’s class of horary question narrowed to a specified person, object, source, transaction or other particular instance within the broader subject.',
  definition_quality=5,
  status='reviewed'
WHERE slug='determinate-question';

UPDATE terms SET
  short_definition='Bonatti’s broad-scope question category concerned with an extended or general condition whose intended duration may be perpetual or explicitly limited to a year, month, week, day or another period.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Related to but not identical with an Absolute Question: absolute/determinate chiefly concerns specificity of the object, while universal usage in this passage emphasizes breadth and temporal scope.'
WHERE slug='universal-question';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('absolute-question','determinate-question','universal-question'))
  AND certainty='direct';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A Bonatti question class defined by asking the subject absolutely rather than about a specified instance.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='absolute-question' AND b.slug='horary-question';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A Bonatti question class restricted to a specified instance or object.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='determinate-question' AND b.slug='horary-question';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-but-overlapping-with', 'Absolute/determinate concerns specificity of the object; Bonatti’s universal usage emphasizes breadth and duration. Do not treat the two labels as synonyms.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='universal-question' AND b.slug='absolute-question';

-- -----------------------------------------------------------------------------
-- SPECIALIZED QUESTION PROCEDURES / ROLES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='Bonatti’s supplementary horary ruler obtained by projecting measured zodiacal distances between selected significators from the Ascendant. He derives several participators and gives greater weight to the strongest or repeatedly indicated planet.',
  definition_quality=5,
  status='reviewed'
WHERE slug='participator-of-question';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='participator-of-question')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct';

UPDATE terms SET
  label='Abscissor / Destroyer / Obstructor',
  short_definition='A destructive or prohibitive planetary role that cuts off a promised outcome or prevents it from reaching perfection. The exact way the abscissor is identified varies with the judgment and should not be reduced to one single impediment geometry.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Bonatti and Lilly use overlapping destroyer/obstructor/abscissor language. Keep the role distinct from the specific mechanisms Prohibition, Frustration and Abscission of Light.'
WHERE slug='abscissor';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Destroyer', 'English', 'source-form', 'Lilly uses destroyer for the hurtful planet that overturns or prevents the matter.' FROM terms WHERE slug='abscissor';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Obstructor', 'English', 'source-form', 'Lilly uses obstructor alongside destroyer and abscissor.' FROM terms WHERE slug='abscissor';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Planet Which Cuts Off', 'English', 'source-phrase', 'Bonatti explanatory phrase for the abscissor.' FROM terms WHERE slug='abscissor';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='abscissor')
  AND certainty='direct';

-- -----------------------------------------------------------------------------
-- BOUNDARY PRACTICE: THOUGHT READING
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A boundary divinatory practice described by al-Bīrūnī as attempting to infer an unstated hidden object or secret thought rather than answering an explicitly presented question.',
  definition_quality=4,
  status='reviewed',
  entry_type='contextual',
  editorial_notes='Retained because al-Bīrūnī explicitly names and discusses the practice while criticizing it as beyond the reliable limits of the art. It is not presented as standard horary doctrine.'
WHERE slug='thought-reading';

UPDATE interpretations SET evidence_grade='B', status='reviewed'
WHERE term_id=(SELECT id FROM terms WHERE slug='thought-reading')
  AND work_id=(SELECT id FROM works WHERE slug='al-biruni-tafhim');

-- -----------------------------------------------------------------------------
-- RELATIONS AND EVIDENCE GRADES
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'qualification-of', 'Radicality describes whether a horary question/figure is considered rooted and fit to receive judgment.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='radical-question' AND b.slug='horary-question';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'timing-rule-for', 'The question time supplies the root moment from which Lilly erects the horary figure.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='horary-question-time' AND b.slug='horary-question';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'role-in', 'The querent is the person who asks the horary question.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='querent' AND b.slug='horary-question';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'role-in', 'The quesited is the person, thing or matter sought in the horary question.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='quesited' AND b.slug='horary-question';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'horary-question','radical-question','querent','quesited','significator','cosignificator',
      'horary-question-time','absolute-question','determinate-question','universal-question',
      'participator-of-question','abscissor'
    )
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'horary-question','radical-question','querent','quesited','significator','cosignificator',
      'horary-question-time','absolute-question','determinate-question','universal-question',
      'participator-of-question','abscissor'
    )
  );
