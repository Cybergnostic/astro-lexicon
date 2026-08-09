-- Foundation pass guided by the private study-corpus checklist but sourced publicly
-- to historical works already in the canonical corpus.
-- No private course wording, attribution, transcript, or quotation is stored here.

-- -----------------------------------------------------------------------------
-- TERMS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('temperament', 'Temperament / Complexion', 'A traditional synthesis of bodily constitution from the relative predominance and mixture of the four primary qualities: hot, cold, moist and dry.', 'temperament doctrine', 'reviewed', 'Foundation entry. Keep historical complexion/constitutional doctrine distinct from a complete theory of personality or character.', 'contextual', 5),
  ('sanguine-temperament', 'Sanguine Temperament', 'The temperament formed by the predominance or combination of heat and moisture.', 'temperament doctrine', 'reviewed', 'Historical temperamental class; do not turn its later character descriptions into the canonical definition.', 'contextual', 5),
  ('choleric-temperament', 'Choleric Temperament', 'The temperament formed by the predominance or combination of heat and dryness.', 'temperament doctrine', 'reviewed', 'Historical temperamental class; do not turn its later character descriptions into the canonical definition.', 'contextual', 5),
  ('melancholic-temperament', 'Melancholic Temperament', 'The temperament formed by the predominance or combination of coldness and dryness.', 'temperament doctrine', 'reviewed', 'Historical temperamental class; do not turn its later character descriptions into the canonical definition.', 'contextual', 5),
  ('phlegmatic-temperament', 'Phlegmatic Temperament', 'The temperament formed by the predominance or combination of coldness and moisture.', 'temperament doctrine', 'reviewed', 'Historical temperamental class; do not turn its later character descriptions into the canonical definition.', 'contextual', 5),
  ('superior-planet', 'Superior Planet', 'A planet belonging to the traditional class beyond the Sun in planetary order, represented by Saturn, Jupiter and Mars and distinguished by a synodic cycle capable of reaching opposition to the Sun.', 'planetary order', 'reviewed', 'Historical astronomical/astrological classification. Do not confuse superior with qualitative superiority or greater dignity.', 'astronomical', 5),
  ('inferior-planet', 'Inferior Planet', 'A planet belonging to the traditional class inside the Sun in planetary order, represented by Venus and Mercury and characterized by remaining within a limited elongation from the Sun.', 'planetary order', 'reviewed', 'Historical astronomical/astrological classification. Al-Biruni discusses the Moon as lower than the Sun but explicitly treats it separately from the two ordinary inferior planets.', 'astronomical', 5),
  ('essential-dignity', 'Essential Dignity', 'A zodiacal dignity held through domicile, exaltation, triplicity, term or face, giving a planet a recognized form of rulership or standing in the sign or degree it occupies.', 'dignity framework', 'reviewed', 'Umbrella entry for the five standard dignity classes explicitly enumerated by Lilly. Source traditions can differ over tables, rulers and relative weighting.', 'technical', 5);

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGES
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id, '532', '533', 'Book III', 'Chapter CVI', 'Complexion or Temperament of the Body',
       'Four principal temperaments; their hot/cold/moist/dry combinations; significators and method of collecting qualitative testimonies',
       NULL,
       'Primary historical anchor for the foundation temperament entries. Public summaries are original paraphrases.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology';

INSERT INTO source_passages
  (edition_id,page_start,page_end,section,locator_text,quote,internal_notes)
SELECT e.id, NULL, NULL, '152',
       'Superior and inferior planets; relation to the Sun and differences in their synodic cycles',
       NULL,
       'Al-Biruni explicitly names Saturn, Jupiter and Mars as superior and Venus and Mercury as the ordinary inferior planets; the Moon is discussed separately.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim';

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,section,locator_text,quote,internal_notes)
SELECT e.id, '101', '103', 'Book I', 'Essential dignities',
       'House, exaltation, triplicity, term and face as the recognized essential dignities of a planet',
       NULL,
       'Primary historical anchor for the umbrella term Essential Dignity. Lilly also notes disagreement among traditions over dignity tables.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly presents temperament or complexion as a synthesis of the four primary qualities in the body. He identifies four principal temperaments and judges them by collecting and comparing hot, cold, moist and dry testimonies from relevant significators rather than from one placement alone.',
       'Book III, Chapter CVI, pp. 532-533', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines the sanguine temperament as the combination in which heat and moisture predominate.',
       'Book III, Chapter CVI, p. 532', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='sanguine-temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines the choleric temperament as the combination in which heat and dryness predominate.',
       'Book III, Chapter CVI, pp. 532-533', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='choleric-temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines the melancholic temperament as the combination in which coldness and dryness predominate.',
       'Book III, Chapter CVI, pp. 532-533', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='melancholic-temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines the phlegmatic temperament as the combination in which coldness and moisture predominate.',
       'Book III, Chapter CVI, pp. 532-533', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='phlegmatic-temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'For the practical judgment of complexion, Lilly examines the ascendant and its ruler, planets in or closely affecting the ascendant, the Moon and planets affecting her, the seasonal quarter represented by the Sun, and the lord of the geniture. Their qualitative testimonies are collected and compared before the final temperamental mixture is assigned.',
       'Book III, Chapter CVI, method of judging complexion', 'direct', 'reviewed', 'B'
FROM terms t CROSS JOIN works w
WHERE t.slug='temperament' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni names Saturn, Jupiter and Mars as the three superior planets. He explains the distinction through their relation to the Sun: unlike the inferior planets they can attain very large solar distances and reach opposition during the middle of their retrograde cycle.',
       '§152, superior and inferior planets', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='superior-planet' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni identifies Venus and Mercury as the ordinary inferior planets and contrasts their solar-limited synodic motion with that of Saturn, Jupiter and Mars. He notes that the Moon is also lower than the Sun but should not simply be counted with Venus and Mercury in this class.',
       '§152, superior and inferior planets', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='inferior-planet' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly explicitly says that a planet has essential dignity when it is in its own house, exaltation, triplicity, term or face. He treats these five classes as cumulative forms of essential strength while also noting historical disagreement over the detailed dignity tables.',
       'Book I, essential dignities, pp. 101-103', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='essential-dignity' AND w.slug='lilly-christian-astrology';

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
WHERE iw.slug='lilly-christian-astrology'
  AND sw.slug='lilly-christian-astrology'
  AND t.slug IN ('temperament','sanguine-temperament','choleric-temperament','melancholic-temperament','phlegmatic-temperament')
  AND sp.section='Complexion or Temperament of the Body';

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
  AND t.slug IN ('superior-planet','inferior-planet')
  AND sp.section='152';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='lilly-christian-astrology'
  AND sw.slug='lilly-christian-astrology'
  AND t.slug='essential-dignity'
  AND sp.section='Essential dignities';

-- -----------------------------------------------------------------------------
-- RELATIONS
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('temperament','sanguine-temperament','has-type','One of the four principal temperamental mixtures in Lilly.'),
    ('temperament','choleric-temperament','has-type','One of the four principal temperamental mixtures in Lilly.'),
    ('temperament','melancholic-temperament','has-type','One of the four principal temperamental mixtures in Lilly.'),
    ('temperament','phlegmatic-temperament','has-type','One of the four principal temperamental mixtures in Lilly.'),
    ('sanguine-temperament','hot','has-quality','Sanguine temperament combines heat and moisture.'),
    ('sanguine-temperament','moist','has-quality','Sanguine temperament combines heat and moisture.'),
    ('sanguine-temperament','element-air','corresponds-to-element','The airy triplicity carries the hot-and-moist mixture in Lilly.'),
    ('choleric-temperament','hot','has-quality','Choleric temperament combines heat and dryness.'),
    ('choleric-temperament','dry','has-quality','Choleric temperament combines heat and dryness.'),
    ('choleric-temperament','element-fire','corresponds-to-element','The fiery triplicity carries the hot-and-dry mixture in Lilly.'),
    ('melancholic-temperament','cold','has-quality','Melancholic temperament combines coldness and dryness.'),
    ('melancholic-temperament','dry','has-quality','Melancholic temperament combines coldness and dryness.'),
    ('melancholic-temperament','element-earth','corresponds-to-element','The earthy triplicity carries the cold-and-dry mixture in Lilly.'),
    ('phlegmatic-temperament','cold','has-quality','Phlegmatic temperament combines coldness and moisture.'),
    ('phlegmatic-temperament','moist','has-quality','Phlegmatic temperament combines coldness and moisture.'),
    ('phlegmatic-temperament','element-water','corresponds-to-element','The watery triplicity carries the cold-and-moist mixture in Lilly.'),
    ('saturn','superior-planet','classified-as','Saturn belongs to the traditional superior planetary class.'),
    ('jupiter','superior-planet','classified-as','Jupiter belongs to the traditional superior planetary class.'),
    ('mars','superior-planet','classified-as','Mars belongs to the traditional superior planetary class.'),
    ('venus','inferior-planet','classified-as','Venus belongs to the traditional inferior planetary class.'),
    ('mercury','inferior-planet','classified-as','Mercury belongs to the traditional inferior planetary class.'),
    ('essential-dignity','domicile','has-type','Domicile or house is one of the five essential dignity classes enumerated by Lilly.'),
    ('essential-dignity','exaltation','has-type','Exaltation is one of the five essential dignity classes enumerated by Lilly.'),
    ('essential-dignity','triplicity','has-type','Triplicity rulership is one of the five essential dignity classes enumerated by Lilly.'),
    ('essential-dignity','terms','has-type','Term or bound rulership is one of the five essential dignity classes enumerated by Lilly.'),
    ('essential-dignity','face-decan','has-type','Face or decan rulership is one of the five essential dignity classes enumerated by Lilly.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
