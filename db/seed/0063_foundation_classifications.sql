-- Foundation enrichment discovered through the private study distillations and
-- verified against the public historical corpus before promotion.
--
-- The private teaching material is NOT a public source and is not reproduced here.
-- It is used only as an editorial checklist for missing basic concepts and links.

-- -----------------------------------------------------------------------------
-- MISSING BASIC SIGN CLASSES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('human-sign', 'Human / Bipedal Sign',
   'A zodiacal sign, or part of a sign, classified through a human or bipedal figure in historical sign taxonomy.',
   'sign quality', 'reviewed',
   'Source traditions do not always assign this class to exactly the same whole signs. Preserve partial-sign and source-specific qualifications rather than flattening them.',
   'technical', 4),
  ('quadruped-sign', 'Quadruped Sign',
   'A zodiacal sign, or part of a sign, classified through the figure or nature of a four-footed animal.',
   'sign quality', 'reviewed',
   'Some sources classify only part of Sagittarius or Capricorn as quadrupedal. Whole-sign relations below are limited to the unambiguous full-sign members.',
   'technical', 5),
  ('powerful-voiced-sign', 'Powerful-Voiced Sign',
   'A sign placed in the strongest class of the historical taxonomy of zodiacal voice.',
   'sign quality', 'reviewed',
   'Part VI distinguishes powerful, moderate/half, weak and voiceless classes. Keep these as historical sign classifications rather than modern personality labels.',
   'technical', 5),
  ('half-voiced-sign', 'Half-Voiced / Moderate-Voiced Sign',
   'A sign placed in the intermediate or half-voiced class of the historical taxonomy of zodiacal voice.',
   'sign quality', 'reviewed',
   'Translation wording varies between moderate voice and half voice.',
   'technical', 5),
  ('weak-voiced-sign', 'Weak-Voiced Sign',
   'A sign placed in the weak-voiced class of the historical taxonomy of zodiacal voice.',
   'sign quality', 'reviewed',
   'A historical technical classification; do not turn it into a generalized psychological claim.',
   'technical', 5),
  ('voiceless-sign', 'Voiceless Sign',
   'A sign placed in the voiceless class of the historical taxonomy of zodiacal voice.',
   'sign quality', 'reviewed',
   'Often rendered mute or voiceless in later terminology. Preserve author-specific use.',
   'technical', 5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Humane Sign', 'English', 'later-form', 'Common later English form for a human sign.' FROM terms WHERE slug='human-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Four-footed Sign', 'English', 'translation-variant', 'Descriptive English equivalent of quadruped sign.' FROM terms WHERE slug='quadruped-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Strong-Voiced Sign', 'English', 'translation-variant', 'Alternative rendering of the strongest voice class.' FROM terms WHERE slug='powerful-voiced-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Moderate-Voiced Sign', 'English', 'translation-variant', 'Alternative rendering of the half-voiced class.' FROM terms WHERE slug='half-voiced-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id, 'Mute Sign', 'English', 'later-form', 'Common later label for the voiceless sign class.' FROM terms WHERE slug='voiceless-sign';

-- al-Biruni §§347-354 were not promoted during the original concept-first pass
-- because most of the material is classificatory. The foundation audit now makes
-- the human/bipedal taxonomy independently useful as a lexicon concept.
INSERT INTO source_passages
  (edition_id,section,locator_text,quote,internal_notes)
SELECT e.id, '347-354',
       'Primary sign qualities; masculine/feminine and diurnal/nocturnal classes; human, quadruped and voice classifications',
       NULL,
       'Foundation follow-up. Use as historical evidence for sign taxonomy; do not universalize Hindu/source-specific partial-sign assignments.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='347-354'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni records a transmitted human or bipedal sign class including Gemini, Virgo and Libra as whole-sign examples, while some additional assignments apply only to portions of Sagittarius and Aquarius. The partial-sign qualifications are therefore part of the doctrine rather than exceptions to be silently discarded.',
       '§§352-353', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='human-sign' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar identifies Aries, Taurus and Leo as full quadruped signs and also assigns the latter half of Sagittarius, and sometimes the first half of Capricorn, to the quadruped class. The doctrine therefore mixes whole-sign and partial-sign classification.',
       'Part VI, Chapter 22, §22.3', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='quadruped-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar places Gemini, Virgo and Libra in the powerful-voiced class.',
       'Part VI, Chapter 18, §18.2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='powerful-voiced-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar places Aries, Taurus, Leo and Sagittarius in an intermediate voice class described as moderate or half-voiced.',
       'Part VI, Chapter 18, §18.2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='half-voiced-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar places Capricorn and Aquarius in the weak-voiced class.',
       'Part VI, Chapter 18, §18.2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='weak-voiced-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar treats Cancer and the other signs of its watery triplicity, Scorpio and Pisces, as lacking voice in this classification.',
       'Part VI, Chapter 18, §§18.2-18.3', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='voiceless-sign' AND w.slug='abu-mashar-great-introduction';

-- Citation for the al-Biruni human-sign interpretation.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='347-354'
WHERE t.slug='human-sign' AND w.slug='al-biruni-tafhim';

-- Citations for the Abū Maʿshar Part VI classification interpretations use the
-- already-ingested Chapters 9-25 source block.
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND sp.book='Part VI' AND sp.chapter='Chapters 9-25'
  AND t.slug IN ('quadruped-sign','powerful-voiced-sign','half-voiced-sign','weak-voiced-sign','voiceless-sign');

-- -----------------------------------------------------------------------------
-- FOUNDATION GRAPH: SIGN CLASSIFICATIONS DISCOVERED AS MISSING NAVIGATION
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    -- Rising-time classes. These are whole-sign classifications in Abū Maʿshar.
    ('aries','crooked-rising-signs','classified-as','Aries belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('taurus','crooked-rising-signs','classified-as','Taurus belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('gemini','crooked-rising-signs','classified-as','Gemini belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('capricorn','crooked-rising-signs','classified-as','Capricorn belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('aquarius','crooked-rising-signs','classified-as','Aquarius belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('pisces','crooked-rising-signs','classified-as','Pisces belongs to the crooked/short-rising half in the Part VI rising-time classification.'),
    ('cancer','straight-rising-signs','classified-as','Cancer belongs to the straight/long-rising half in the Part VI rising-time classification.'),
    ('leo','straight-rising-signs','classified-as','Leo belongs to the straight/long-rising half in the Part VI rising-time classification.'),
    ('virgo','straight-rising-signs','classified-as','Virgo belongs to the straight/long-rising half in the Part VI rising-time classification.'),
    ('libra','straight-rising-signs','classified-as','Libra belongs to the straight/long-rising half in the Part VI rising-time classification.'),
    ('scorpio','straight-rising-signs','classified-as','Scorpio belongs to the straight/long-rising half in the Part VI rising-time classification.'),
    ('sagittarius','straight-rising-signs','classified-as','Sagittarius belongs to the straight/long-rising half in the Part VI rising-time classification.'),

    -- Abū Maʿshar explicitly describes crooked-rising signs as obedient to the straight-rising set.
    ('aries','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),
    ('taurus','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),
    ('gemini','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),
    ('capricorn','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),
    ('aquarius','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),
    ('pisces','obedient-signs','classified-as','In Abū Maʿshar Part VI the crooked-rising signs are described as obedient to the straight-rising signs.'),

    -- Fertility: only whole signs with unambiguous full-sign classification are linked.
    ('cancer','fecund-sign','classified-as','Cancer is explicitly among the signs having many children in Abū Maʿshar Part VI.'),
    ('scorpio','fecund-sign','classified-as','Scorpio is explicitly among the signs having many children in Abū Maʿshar Part VI.'),
    ('pisces','fecund-sign','classified-as','Pisces is explicitly among the signs having many children in Abū Maʿshar Part VI.'),
    ('gemini','barren-sign','classified-as','Gemini is explicitly classified as barren in Abū Maʿshar Part VI.'),
    ('leo','barren-sign','classified-as','Leo is explicitly classified as barren in Abū Maʿshar Part VI.'),
    ('virgo','barren-sign','classified-as','Virgo is explicitly classified as barren in Abū Maʿshar Part VI.'),

    -- Human/bipedal: only the unambiguous whole-sign examples are linked.
    ('gemini','human-sign','classified-as','Al-Biruni records Gemini as a human/bipedal sign.'),
    ('virgo','human-sign','classified-as','Al-Biruni records Virgo as a human/bipedal sign.'),
    ('libra','human-sign','classified-as','Al-Biruni records Libra as a human/bipedal sign.'),

    -- Quadrupeds: only full-sign examples, not the partial Sagittarius/Capricorn cases.
    ('aries','quadruped-sign','classified-as','Aries is a full-sign quadruped example in Abū Maʿshar Part VI.'),
    ('taurus','quadruped-sign','classified-as','Taurus is a full-sign quadruped example in Abū Maʿshar Part VI.'),
    ('leo','quadruped-sign','classified-as','Leo is a full-sign quadruped example in Abū Maʿshar Part VI.'),

    -- Voice classes.
    ('gemini','powerful-voiced-sign','classified-as','Gemini belongs to the powerful-voiced class.'),
    ('virgo','powerful-voiced-sign','classified-as','Virgo belongs to the powerful-voiced class.'),
    ('libra','powerful-voiced-sign','classified-as','Libra belongs to the powerful-voiced class.'),
    ('aries','half-voiced-sign','classified-as','Aries belongs to the moderate/half-voiced class.'),
    ('taurus','half-voiced-sign','classified-as','Taurus belongs to the moderate/half-voiced class.'),
    ('leo','half-voiced-sign','classified-as','Leo belongs to the moderate/half-voiced class.'),
    ('sagittarius','half-voiced-sign','classified-as','Sagittarius belongs to the moderate/half-voiced class.'),
    ('capricorn','weak-voiced-sign','classified-as','Capricorn belongs to the weak-voiced class.'),
    ('aquarius','weak-voiced-sign','classified-as','Aquarius belongs to the weak-voiced class.'),
    ('cancer','voiceless-sign','classified-as','Cancer belongs to the voiceless class.'),
    ('scorpio','voiceless-sign','classified-as','Scorpio belongs to the voiceless class.'),
    ('pisces','voiceless-sign','classified-as','Pisces belongs to the voiceless class.'),

    -- Voice-class ontology.
    ('powerful-voiced-sign','voiced-sign','subtype-of','Powerful-voiced signs form the strongest subdivision of the broader voiced-sign doctrine.'),
    ('half-voiced-sign','voiced-sign','subtype-of','Half-voiced signs form an intermediate subdivision of the broader voiced-sign doctrine.'),
    ('weak-voiced-sign','voiced-sign','subtype-of','Weak-voiced signs form the weakest voiced subdivision before the separate voiceless class.')
)
INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;

-- -----------------------------------------------------------------------------
-- EXALTATION AND FALL: CONNECT INDIVIDUAL PLANETS TO THE NAMED SIGN HUBS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('sun','aries','exalted-in','The Sun is exalted in Aries in the reviewed traditional dignity scheme.'),
    ('moon','taurus','exalted-in','The Moon is exalted in Taurus in the reviewed traditional dignity scheme.'),
    ('jupiter','cancer','exalted-in','Jupiter is exalted in Cancer in the reviewed traditional dignity scheme.'),
    ('mercury','virgo','exalted-in','Mercury is exalted in Virgo in the reviewed traditional dignity scheme.'),
    ('saturn','libra','exalted-in','Saturn is exalted in Libra in the reviewed traditional dignity scheme.'),
    ('mars','capricorn','exalted-in','Mars is exalted in Capricorn in the reviewed traditional dignity scheme.'),
    ('venus','pisces','exalted-in','Venus is exalted in Pisces in the reviewed traditional dignity scheme.'),
    ('sun','libra','falls-in','Libra is opposite the Sun’s exaltation and therefore its fall.'),
    ('moon','scorpio','falls-in','Scorpio is opposite the Moon’s exaltation and therefore its fall.'),
    ('jupiter','capricorn','falls-in','Capricorn is opposite Jupiter’s exaltation and therefore its fall.'),
    ('mercury','pisces','falls-in','Pisces is opposite Mercury’s exaltation and therefore its fall.'),
    ('saturn','aries','falls-in','Aries is opposite Saturn’s exaltation and therefore its fall.'),
    ('mars','cancer','falls-in','Cancer is opposite Mars’s exaltation and therefore its fall.'),
    ('venus','virgo','falls-in','Virgo is opposite Venus’s exaltation and therefore its fall.')
)
INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;

-- Link each planet to the already-reviewed generic dignity concepts as well.
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('sun','exaltation','participates-in','The Sun has a traditional exaltation and corresponding fall.'),
    ('moon','exaltation','participates-in','The Moon has a traditional exaltation and corresponding fall.'),
    ('jupiter','exaltation','participates-in','Jupiter has a traditional exaltation and corresponding fall.'),
    ('mercury','exaltation','participates-in','Mercury has a traditional exaltation and corresponding fall.'),
    ('saturn','exaltation','participates-in','Saturn has a traditional exaltation and corresponding fall.'),
    ('mars','exaltation','participates-in','Mars has a traditional exaltation and corresponding fall.'),
    ('venus','exaltation','participates-in','Venus has a traditional exaltation and corresponding fall.'),
    ('sun','fall','participates-in','The Sun has a traditional fall opposite its exaltation.'),
    ('moon','fall','participates-in','The Moon has a traditional fall opposite its exaltation.'),
    ('jupiter','fall','participates-in','Jupiter has a traditional fall opposite its exaltation.'),
    ('mercury','fall','participates-in','Mercury has a traditional fall opposite its exaltation.'),
    ('saturn','fall','participates-in','Saturn has a traditional fall opposite its exaltation.'),
    ('mars','fall','participates-in','Mars has a traditional fall opposite its exaltation.'),
    ('venus','fall','participates-in','Venus has a traditional fall opposite its exaltation.')
)
INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;

-- -----------------------------------------------------------------------------
-- PLANETARY GENDER: EXISTING HISTORICAL CONCEPTS, MISSING NAMED-PLANET LINKS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('saturn','planetary-masculinity','classified-as','Abū Maʿshar includes Saturn in the masculine planetary class.'),
    ('jupiter','planetary-masculinity','classified-as','Abū Maʿshar includes Jupiter in the masculine planetary class.'),
    ('mars','planetary-masculinity','classified-as','Abū Maʿshar includes Mars in the masculine planetary class.'),
    ('sun','planetary-masculinity','classified-as','Abū Maʿshar includes the Sun in the masculine planetary class.'),
    ('venus','planetary-femininity','classified-as','Abū Maʿshar includes Venus in the feminine planetary class.'),
    ('moon','planetary-femininity','classified-as','Abū Maʿshar includes the Moon in the feminine planetary class.')
)
INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
