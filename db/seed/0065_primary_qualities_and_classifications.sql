-- Foundation pass 2 guided by the private study-corpus checklist but sourced
-- exclusively to historical works already represented in the canonical corpus.
-- No private course wording, attribution, transcript, or quotation is stored here.
--
-- This seed also completes relations intentionally attempted in 0064: the
-- temperament entries could not yet link to individual qualities/elements because
-- those canonical target terms did not exist at that point.

-- -----------------------------------------------------------------------------
-- TERMS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('primary-quality', 'Primary Quality', 'One of the four basic qualitative principles used in traditional natural philosophy and astrology: hot, cold, moist and dry. Al-Biruni presents heat and cold as active qualities and dryness and moisture as passive qualities.', 'natural philosophy', 'reviewed', 'Foundation umbrella. Keep qualitative language distinct from literal modern physical measurement.', 'contextual', 5),
  ('hot', 'Hot', 'The active primary quality opposed to cold. In the elemental scheme, heat combines with dryness as fire and with moisture as air.', 'primary quality', 'reviewed', 'Canonical definition is structural and historical; source-specific psychological or medical extensions belong in interpretations.', 'contextual', 5),
  ('cold', 'Cold', 'The active primary quality opposed to hot. In the elemental scheme, cold combines with dryness as earth and with moisture as water.', 'primary quality', 'reviewed', 'Canonical definition is structural and historical; source-specific psychological or medical extensions belong in interpretations.', 'contextual', 5),
  ('moist', 'Moist', 'The passive primary quality opposed to dry. In the elemental scheme, moisture combines with heat as air and with cold as water.', 'primary quality', 'reviewed', 'Canonical definition is structural and historical; wet/moist translation choices may vary by edition.', 'contextual', 5),
  ('dry', 'Dry', 'The passive primary quality opposed to moist. In the elemental scheme, dryness combines with heat as fire and with cold as earth.', 'primary quality', 'reviewed', 'Canonical definition is structural and historical; source-specific psychological or medical extensions belong in interpretations.', 'contextual', 5),
  ('element-fire', 'Fire', 'The elemental nature formed from the combination of heat and dryness in the traditional four-element scheme.', 'element', 'reviewed', 'Elemental/natural-philosophical category, not a claim about modern chemical composition.', 'contextual', 5),
  ('element-air', 'Air', 'The elemental nature formed from the combination of heat and moisture in the traditional four-element scheme.', 'element', 'reviewed', 'Elemental/natural-philosophical category, not a claim about modern atmospheric composition.', 'contextual', 5),
  ('element-water', 'Water', 'The elemental nature formed from the combination of cold and moisture in the traditional four-element scheme.', 'element', 'reviewed', 'Elemental/natural-philosophical category, not a claim about modern chemical composition.', 'contextual', 5),
  ('element-earth', 'Earth', 'The elemental nature formed from the combination of cold and dryness in the traditional four-element scheme.', 'element', 'reviewed', 'Elemental/natural-philosophical category, not a claim about modern geology or chemistry.', 'contextual', 5),
  ('sign-modality', 'Sign Modality / Quadruplicity', 'The seasonal threefold classification of zodiacal signs into tropical or movable, fixed, and bicorporeal or common classes, corresponding respectively to the first, middle and final sign of each seasonal quarter.', 'sign classification', 'reviewed', 'Umbrella entry. The historical sources use several labels; retain tropical/movable and bicorporeal/common rather than replacing them with later terminology.', 'technical', 5),
  ('planetary-gender', 'Planetary Gender', 'The traditional classification of planets as masculine, feminine or variable in gender, distinct from the separate masculine/feminine classification of zodiacal signs.', 'planetary classification', 'reviewed', 'Historical technical classification. Do not conflate with modern social gender categories.', 'technical', 5),
  ('masculine-planet', 'Masculine Planet', 'A planet belonging to the traditional masculine class. Al-Biruni places Saturn, Jupiter, Mars and the Sun in this class, while Mercury can vary by association.', 'planetary classification', 'reviewed', 'Historical technical category; Saturn receives a special qualification in al-Biruni but remains in the masculine class.', 'technical', 5),
  ('feminine-planet', 'Feminine Planet', 'A planet belonging to the traditional feminine class. Al-Biruni places Venus and the Moon in this class, while Mercury can vary by association.', 'planetary classification', 'reviewed', 'Historical technical category; Mercury is not forced into a stable class.', 'technical', 5),
  ('luminary', 'Luminary', 'One of the two astrological lights, the Sun or the Moon, which traditional authors treat as a pair distinct in important respects from the other five planets.', 'planetary classification', 'reviewed', 'Historical astronomical/astrological class. Preserve the Sun and Moon as individual terms as well as members of this pair.', 'astronomical', 5);

-- -----------------------------------------------------------------------------
-- ALIASES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Prime Quality','English','later-equivalent','Common English variant for primary quality.'
FROM terms WHERE slug='primary-quality';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Quadruplicity','English','later-equivalent','Later umbrella term for the movable/fixed/common sign classification.'
FROM terms WHERE slug='sign-modality';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Male Planet','English','historical-equivalent','Plain English equivalent of masculine planet in historical classification.'
FROM terms WHERE slug='masculine-planet';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Female Planet','English','historical-equivalent','Plain English equivalent of feminine planet in historical classification.'
FROM terms WHERE slug='feminine-planet';

-- -----------------------------------------------------------------------------
-- NEW SOURCE PASSAGE: AL-BIRUNI §347
-- Existing broad passages already cover §§373-380, §§381-401 and §§489-514.
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id, '209', '210', '347',
       '§347, nature of the signs: hot/cold as active qualities, dry/moist as passive qualities, and the four elemental combinations',
       NULL,
       'Primary historical anchor for the four individual qualities and four elemental mixtures. Public summaries are original paraphrases.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS: PRIMARY QUALITIES AND ELEMENTS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni organizes the qualitative nature of signs through four principles: heat and cold as active qualities, and dryness and moisture as passive qualities. Their combinations identify the four elemental natures.',
       '§347, nature of the signs', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='primary-quality' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni treats heat as one of the two active qualitative principles. A hot and dry mixture corresponds to fire, while a hot and moist mixture corresponds to air.',
       '§347, active and passive qualities', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='hot' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni treats cold as one of the two active qualitative principles. A cold and dry mixture corresponds to earth, while a cold and moist mixture corresponds to water.',
       '§347, active and passive qualities', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='cold' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni treats moisture as one of the two passive qualitative principles. Joined to heat it produces the airy mixture; joined to cold it produces the watery mixture.',
       '§347, active and passive qualities', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='moist' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni treats dryness as one of the two passive qualitative principles. Joined to heat it produces the fiery mixture; joined to cold it produces the earthy mixture.',
       '§347, active and passive qualities', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='dry' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In al-Biruni''s elemental correspondence, the hot-and-dry qualitative mixture belongs to fire.',
       '§347, elemental correspondences', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='element-fire' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In al-Biruni''s elemental correspondence, the hot-and-moist qualitative mixture belongs to air.',
       '§347, elemental correspondences', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='element-air' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In al-Biruni''s elemental correspondence, the cold-and-moist qualitative mixture belongs to water.',
       '§347, elemental correspondences', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='element-water' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'In al-Biruni''s elemental correspondence, the cold-and-dry qualitative mixture belongs to earth.',
       '§347, elemental correspondences', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='element-earth' AND w.slug='al-biruni-tafhim';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS: SIGN MODALITY, PLANETARY GENDER, LUMINARIES
-- -----------------------------------------------------------------------------
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni divides each seasonal quarter into a first tropical sign, a second fixed sign and a third bicorporeal sign. The four signs occupying the same seasonal position form three tetragons: tropical, fixed and bicorporeal.',
       '§380, seasonal sign classes and tetragons', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='sign-modality' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni gives a planetary sex classification in which the three superior planets and the Sun are masculine, Venus and the Moon are feminine, and Mercury changes gender through association, while being masculine when considered alone.',
       '§385, planetary sex', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-gender' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni classes Saturn, Jupiter, Mars and the Sun as masculine planets. He records but rejects an alternative opinion that Mars should be feminine; Mercury is variable and therefore does not belong unconditionally to this stable class.',
       '§385, masculine planets', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='masculine-planet' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni classes Venus and the Moon as feminine planets. Mercury can become feminine through association with feminine planets, so it is not placed unconditionally in the stable feminine class.',
       '§385, feminine planets', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='feminine-planet' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni explicitly treats the Sun and Moon together as the two luminaries and distinguishes their conditions of strength and weakness from those of the other planets.',
       '§513, how the Sun and Moon differ from the other planets', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='luminary' AND w.slug='al-biruni-tafhim';

-- -----------------------------------------------------------------------------
-- CITATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim'
  AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('primary-quality','hot','cold','moist','dry','element-fire','element-air','element-water','element-earth')
  AND sp.section='347';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim'
  AND sw.slug='al-biruni-tafhim'
  AND t.slug='sign-modality'
  AND sp.section='373-380';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim'
  AND sw.slug='al-biruni-tafhim'
  AND t.slug IN ('planetary-gender','masculine-planet','feminine-planet')
  AND sp.section='381-401';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim'
  AND sw.slug='al-biruni-tafhim'
  AND t.slug='luminary'
  AND sp.section='489-514';

-- -----------------------------------------------------------------------------
-- RELATIONS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('primary-quality','hot','has-type','Heat is one of the four primary qualities.'),
    ('primary-quality','cold','has-type','Cold is one of the four primary qualities.'),
    ('primary-quality','moist','has-type','Moisture is one of the four primary qualities.'),
    ('primary-quality','dry','has-type','Dryness is one of the four primary qualities.'),
    ('hot','cold','opposed-to','Heat and cold form the active qualitative opposition in al-Biruni.'),
    ('cold','hot','opposed-to','Cold and heat form the active qualitative opposition in al-Biruni.'),
    ('moist','dry','opposed-to','Moisture and dryness form the passive qualitative opposition in al-Biruni.'),
    ('dry','moist','opposed-to','Dryness and moisture form the passive qualitative opposition in al-Biruni.'),
    ('four-elements','element-fire','has-type','Fire is one of the four elemental natures.'),
    ('four-elements','element-air','has-type','Air is one of the four elemental natures.'),
    ('four-elements','element-water','has-type','Water is one of the four elemental natures.'),
    ('four-elements','element-earth','has-type','Earth is one of the four elemental natures.'),
    ('element-fire','hot','has-quality','Fire is the hot-and-dry elemental mixture.'),
    ('element-fire','dry','has-quality','Fire is the hot-and-dry elemental mixture.'),
    ('element-air','hot','has-quality','Air is the hot-and-moist elemental mixture.'),
    ('element-air','moist','has-quality','Air is the hot-and-moist elemental mixture.'),
    ('element-water','cold','has-quality','Water is the cold-and-moist elemental mixture.'),
    ('element-water','moist','has-quality','Water is the cold-and-moist elemental mixture.'),
    ('element-earth','cold','has-quality','Earth is the cold-and-dry elemental mixture.'),
    ('element-earth','dry','has-quality','Earth is the cold-and-dry elemental mixture.'),
    ('planetary-nature','primary-quality','uses-framework','Planetary natures are expressed through combinations and degrees of the primary qualities.'),
    ('sanguine-temperament','hot','has-quality','Sanguine temperament combines heat and moisture.'),
    ('sanguine-temperament','moist','has-quality','Sanguine temperament combines heat and moisture.'),
    ('sanguine-temperament','element-air','corresponds-to-element','The hot-and-moist mixture corresponds to air.'),
    ('choleric-temperament','hot','has-quality','Choleric temperament combines heat and dryness.'),
    ('choleric-temperament','dry','has-quality','Choleric temperament combines heat and dryness.'),
    ('choleric-temperament','element-fire','corresponds-to-element','The hot-and-dry mixture corresponds to fire.'),
    ('melancholic-temperament','cold','has-quality','Melancholic temperament combines coldness and dryness.'),
    ('melancholic-temperament','dry','has-quality','Melancholic temperament combines coldness and dryness.'),
    ('melancholic-temperament','element-earth','corresponds-to-element','The cold-and-dry mixture corresponds to earth.'),
    ('phlegmatic-temperament','cold','has-quality','Phlegmatic temperament combines coldness and moisture.'),
    ('phlegmatic-temperament','moist','has-quality','Phlegmatic temperament combines coldness and moisture.'),
    ('phlegmatic-temperament','element-water','corresponds-to-element','The cold-and-moist mixture corresponds to water.'),
    ('sign-modality','tropical-sign','has-type','Tropical or movable signs occupy the first position of each seasonal quarter.'),
    ('sign-modality','fixed-sign','has-type','Fixed signs occupy the middle position of each seasonal quarter.'),
    ('sign-modality','bicorporeal-sign','has-type','Bicorporeal or common signs occupy the final position of each seasonal quarter.'),
    ('planetary-gender','masculine-planet','has-type','Masculine is one stable planetary gender class.'),
    ('planetary-gender','feminine-planet','has-type','Feminine is one stable planetary gender class.'),
    ('saturn','masculine-planet','classified-as','Al-Biruni classes Saturn among the masculine planets, with a special qualification concerning generation.'),
    ('jupiter','masculine-planet','classified-as','Al-Biruni classes Jupiter as masculine.'),
    ('mars','masculine-planet','classified-as','Al-Biruni classes Mars as masculine and rejects the alternative feminine classification.'),
    ('sun','masculine-planet','classified-as','Al-Biruni classes the Sun as masculine.'),
    ('venus','feminine-planet','classified-as','Al-Biruni classes Venus as feminine.'),
    ('moon','feminine-planet','classified-as','Al-Biruni classes the Moon as feminine.'),
    ('mercury','planetary-gender','variable-by-association','Al-Biruni describes Mercury as changing gender through association rather than belonging unconditionally to one stable class.'),
    ('sun','luminary','classified-as','The Sun is one of the two luminaries.'),
    ('moon','luminary','classified-as','The Moon is one of the two luminaries.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
