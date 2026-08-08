-- Sequential extraction of William Lilly, Christian Astrology, Book III: Nativities.
-- Lilly's Book III begins at PDF p. 550; the worked nativity closes on p. 892.
-- Supporting authorial apparatus continues through p. 910, where Lilly prints Finis.
-- Only definition-level or substantively explanatory evidence is promoted.
-- Long natal catalogues, medical/fertility rules, violent-death recipes and annual worked predictions
-- were reviewed as historical source material but are not reproduced as operational lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('trutine-of-hermes', 'Trutine of Hermes', 'A rectification procedure that relates the Moon at birth to a proposed conception figure in order to test or adjust the natal ascendant.', 'rectification', 'draft', 'Lilly also calls it the Scrutiny of Hermes. He regards it as useful for narrowing the ascendant but not sufficiently exact by itself.'),
  ('animodar', 'Animodar', 'A rectification procedure that uses the degree of the preceding lunation and the planet having the greatest essential dignity there to adjust the principal natal angles.', 'rectification', 'draft', 'Lilly describes Animodar but explicitly prefers rectification by dated accidents.'),
  ('rectification-by-accidents', 'Rectification by Accidents', 'Rectification of a nativity by comparing dated life events with directions of the principal natal points until the proposed birth time agrees with the observed accidents.', 'rectification', 'draft', 'Lilly presents this as his preferred and most certain rectification method.'),
  ('promittor', 'Promittor', 'In direction, the planet, aspect, point or other target encountered by the directed significator; it indicates the quality or causal character of the promised event.', 'predictive technique', 'draft', 'Book III gives a direct technical definition in the context of rectification and directions.'),
  ('hyleg', 'Hyleg', 'The aphetic planet or place whose direction is used in traditional longevity doctrine to judge the state or continuation of life.', 'natal technique', 'draft', 'Lilly gives the traditional doctrine but repeatedly expresses dissatisfaction with the certainty of the received rules.'),
  ('anareta', 'Anareta', 'The destroying or interficient planet in traditional longevity doctrine, treated as the principal afflicter capable of terminating the life-signifying direction.', 'natal technique', 'draft', 'Historical longevity doctrine only. Lilly gives competing rules for identifying it and is openly skeptical of their certainty.'),
  ('alcochodon', 'Alcochodon', 'In traditional longevity doctrine, the planet having the strongest essential dignity in the Hylegic place and a qualifying aspect to the Hyleg, used as a giver of years.', 'natal technique', 'draft', 'Historical longevity doctrine only. Lilly records the method but states that he is not fully satisfied with it.'),
  ('lord-of-geniture', 'Lord of the Geniture', 'The planet judged strongest in the whole nativity by the combined weight of essential and accidental dignity, with a secondary strong planet participating in the judgment.', 'natal technique', 'draft', 'This is Lilly\'s preferred definition after noting competing older definitions.'),
  ('magistry', 'Magistry', 'The study, art, trade, profession or principal occupation by which a person chiefly conducts life, gains a living and maintains worldly estimation.', 'natal topic', 'draft', 'Lilly directly defines Magistry in his profession chapter.'),
  ('primary-direction', 'Direction', 'A predictive technique that moves a significator toward a promittor in order to measure when a natal promise is expected to become active.', 'predictive technique', 'draft', 'Lilly distinguishes the natal judgment of what is promised from direction as the measurement of when it is expected.'),
  ('profection', 'Profection', 'A regular progression of significators through the zodiac in sign order; in annual profection one whole sign, or thirty degrees, is allotted to each solar year.', 'time lordship', 'draft', 'Lilly explicitly says profection and progression are the same in this context and distinguishes annual, monthly and daily forms.'),
  ('solar-revolution', 'Solar Revolution', 'The annual return of the Sun to the exact zodiacal degree and minute it occupied in the radix.', 'predictive technique', 'draft', 'Lilly also calls it an annual conversion and judges it by comparison with the radix.'),
  ('transit', 'Transit', 'The passage of a planet over, or by aspect to, natal house cusps, planets, nodes, Part of Fortune or other radical places, observed for shorter-term activation.', 'predictive technique', 'draft', 'Lilly defines transit operationally from an ephemeris after treating directions, profections and revolutions.'),
  ('alfridary', 'Alfridary', 'A sequence of seven-year planetary periods in which successive planets govern septennial portions of life, with a different starting ruler for day and night births.', 'time lordship', 'draft', 'Lilly calls these the Lords of the Septennial Years or Lords of the Alfridary; preserve as his source-specific doctrine rather than automatically merging it with other period systems.'),
  ('quincunx', 'Quincunx', 'An aspect of 150 degrees.', 'aspect', 'draft', 'Lilly explicitly calls quincunx a new aspect in his closing note.'),
  ('semiquintile', 'Semiquintile', 'A minor aspect which Lilly groups by nature with the sextile and trine, though weaker in operation.', 'aspect', 'draft', 'Lilly defines its qualitative family at the close of Book III.'),
  ('quintile', 'Quintile', 'A minor aspect which Lilly groups by nature with the sextile and trine, though weaker in operation.', 'aspect', 'draft', 'Lilly defines its qualitative family at the close of Book III.'),
  ('sesquiquintile', 'Sesquiquintile', 'A minor aspect which Lilly groups by nature with the sextile and trine, though weaker in operation.', 'aspect', 'draft', 'Lilly defines its qualitative family at the close of Book III.'),
  ('biquintile', 'Biquintile', 'A minor aspect which Lilly groups by nature with the sextile and trine, though weaker in operation.', 'aspect', 'draft', 'Lilly defines its qualitative family at the close of Book III.'),
  ('semisquare', 'Semisquare', 'A minor hard aspect which Lilly says participates in the nature of the square.', 'aspect', 'draft', 'Lilly gives this qualitative definition in his closing note.'),
  ('sesquiquadrate', 'Sesquiquadrate', 'A minor hard aspect which Lilly says participates in the nature of the square.', 'aspect', 'draft', 'Lilly gives this qualitative definition in his closing note.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Scrutiny of Hermes', 'English', 'source-name', 'Lilly uses this name for the Trutine of Hermes.' FROM terms WHERE slug='trutine-of-hermes';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Apheta', 'Greek/Latinized', 'source-equivalent', 'Lilly uses Hyleg, Hylech and Apheta for the life-signifying place or planet.' FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Hylech', 'English/Latinized', 'source-variant', 'Lilly spelling.' FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Interficient Planet', 'English', 'source-name', 'Lilly name for the Anareta.' FROM terms WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Intersector', 'English', 'source-name', 'Lilly name for the Anareta.' FROM terms WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Destroying Planet', 'English', 'source-name', 'Descriptive Lilly equivalent for the Anareta.' FROM terms WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Giver of Years', 'English', 'source-equivalent', 'Lilly describes the Alcochodon by this function.' FROM terms WHERE slug='alcochodon';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Progression', 'English', 'source-equivalent', 'In Lilly\'s profection chapter, profection and progression are stated to be the same.' FROM terms WHERE slug='profection';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Annual Conversion', 'English', 'source-name', 'Lilly synonym for the annual solar revolution.' FROM terms WHERE slug='solar-revolution';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Chronocrator', 'Greek/Latinized', 'source-equivalent', 'Lilly states that the Lord of the Year and Chronocrator are the same.' FROM terms WHERE slug='lord-of-year';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Chroneverator', 'English/Latinized', 'source-variant', 'Lilly variant printed beside Chronocrator.' FROM terms WHERE slug='lord-of-year';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Lord of the Alfridary', 'English', 'source-name', 'Ruler of one of Lilly\'s septennial Alfridary periods.' FROM terms WHERE slug='alfridary';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Radix', 'Latin', 'source-name', 'Lilly says Radix is the more proper expression for the root of the nativity.' FROM terms WHERE slug='nativity';

-- Rectification and principal natal rulers.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '550', '613', 'Book III', 'Opening through Chapters CIII-CXIII',
       'Nativity setup; Trutine of Hermes; Animodar; rectification by accidents; significator and promittor; Hyleg, Anareta, Alcochodon; Lord of the Geniture; temperament and first-house natal doctrine', NULL,
       'Reviewed sequentially. Lilly explicitly prefers rectification by accidents and voices reservations about received longevity doctrine.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly presents the Trutine or Scrutiny of Hermes as a rectification method connecting the Moon at birth with a proposed conception figure. He regards it as capable of helping determine the ascending sign, but not as sufficiently reliable for exact rectification.', 'Book III, rectification opening', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='trutine-of-hermes' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Animodar rectifies by the degree of the preceding lunation and by the planet holding the greatest essential dignity there, whose relation to the angles supplies the correction. Lilly treats it as less certain than rectification by observed accidents.', 'Book III, rectification opening', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='animodar' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly calls rectification by accidents the most certain of the methods he presents. Dated events are compared with appropriate primary directions, and the proposed birth time is adjusted until the directed angles or other principal places agree with the observed chronology.', 'Book III, rectification by accidents', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='rectification-by-accidents' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'In Lilly\'s directional terminology the point being moved is the significator, while the planet, aspect or point toward which it is directed is the promittor. The promittor characterizes the event or cause manifested when the direction perfects.', 'Book III, rectification by accidents and directions', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='promittor' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly equates Hyleg, Hylech and Apheta in the traditional doctrine of a life-signifying planet or place whose directions are examined for the state of life. He reports the received selection hierarchy but explicitly says he is not satisfied with the certainty of the doctrine.', 'Book III, Chapter CIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hyleg' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly records Anareta, Interficient Planet, Intersector and Destroying Planet as names for the principal destructive planet in traditional longevity doctrine. He reports several competing candidates and does not treat the received identification rules as fully certain.', 'Book III, Chapter CIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='anareta' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Alcochodon is the planet with the strongest essential dignity in the Hylegic place that also has a qualifying aspect to the Hyleg, and is traditionally used as a giver of years. Lilly records the rule but states that he is not fully satisfied with the doctrine.', 'Book III, Chapter CIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='alcochodon' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'After noting different ancient definitions, Lilly prefers to call that planet Lord of the Geniture which has the greatest combined essential and accidental strength in the entire figure and is best situated; another exceptionally strong planet may participate with it.', 'Book III, Chapter CV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-geniture' AND w.slug='lilly-christian-astrology';

-- Natal topical chapters through profession and the beginning of directions.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '614', '776', 'Book III', 'Natal topics through Chapter CLXV and directional effects',
       'Riches, relatives, parents, disease, marriage, children, journeys, religion, honour, profession, friends and enemies; historical imprisonment/death doctrine; theory and effects of directions', NULL,
       'Reviewed sequentially. Large topical, medical, fertility, sexual, imprisonment and violent-death catalogues remain corpus material rather than operational lexicon entries. The technical definitions of Magistry and Direction are retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly defines Magistry broadly as the study, delight, art, action, trade or profession by which the native principally lives, gains a livelihood, preserves estimation and spends the greater part of life. His following rules attempt to identify its principal planetary significator.', 'Book III, Chapter CXLVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='magistry' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'For Lilly, direction is the art of determining when a significator will meet a promittor. The radix first shows what is generally promised; direction measures when that promise is expected to become active, down to years and smaller time units.', 'Book III, directions opening', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='primary-direction' AND w.slug='lilly-christian-astrology';

-- Profections, revolutions and transits.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '777', '803', 'Book III', 'Chapters CLXVI-CLXXIV',
       'Annual, monthly and daily profections; Lord of the Year and Alfridary; solar revolutions; planetary returns; transits', NULL,
       'Reviewed sequentially. Worked tables and day-by-day predictive recipes are supporting apparatus; direct definitions and relations among techniques are retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly says profection and progression are the same here: an orderly movement of significators through the succession of signs. Annual profection advances one whole sign or thirty degrees per solar year and repeats every twelve years; he also mentions monthly and daily forms.', 'Book III, Chapter CLXVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='profection' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly uses annual profections chiefly to narrow the timing of primary directions. A direction is most forceful when the annual profections of its significator and promittor concur with it, while contrary profections and transits can weaken, obscure or defer the manifestation.', 'Book III, Chapter CLXVII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='profection' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'In Lilly\'s profectional practice the Lord of the Year is the ruler of the sign reached by the profected ascendant. When the profected ascendant spans portions governed by two signs in the year, he divides the year between the two rulers. He also explicitly equates Lord of the Year with Chronocrator.', 'Book III, Chapters CLXVII-CLXVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-year' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly describes the Lords of the Alfridary as successive seven-year planetary rulers. In a day nativity the sequence begins with the Sun and then Venus and Mercury; in a night nativity it begins with the Moon and then Saturn and Jupiter, continuing through the planetary order.', 'Book III, end of profections', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='alfridary' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly defines a revolution or annual conversion as the return of the Sun to the exact zodiacal degree and minute occupied in the radix. Judgment depends on comparing the revolution with the natal figure rather than reading it in isolation.', 'Book III, Chapter CLXXII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='solar-revolution' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly defines transits by following the planets in an ephemeris as they pass over natal house cusps or radical planets, nodes and Part of Fortune, and as they form aspects to those radical places. He uses them as shorter-term modifiers and activators alongside directions, profections and revolutions.', 'Book III, Chapter CLXXIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='transit' AND w.slug='lilly-christian-astrology';

-- Worked nativity and closing definitions.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '804', '893', 'Book III', 'Chapters CLXXV-CLXXXV and closing note',
       'Extended worked nativity; directions, revolutions and profections combined; closing definitions of several minor aspects; Book III conclusion', NULL,
       'Reviewed sequentially. The long worked forecast is retained as methodological evidence rather than fragmented into hundreds of interpretations. Lilly closes the main Book III work on p. 892; p. 893 supplies supporting circles of position.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'In the worked nativity Lilly repeatedly combines directions with revolutions, profections and transits rather than treating any one predictive layer as sufficient by itself. He allows supportive testimony to mitigate or strengthen what a direction promises.', 'Book III, worked nativity', 'close_paraphrase', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='primary-direction' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly states that the exact number of years of life cannot be set positively by human power and must be submitted to God, even while he records traditional longevity techniques. This caution limits how his Hyleg and Anareta doctrine should be represented.', 'Book III, worked nativity conclusion', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hyleg' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly defines the quincunx as a 150-degree aspect and calls it a new aspect.', 'Book III, closing note', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='quincunx' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly groups the semiquintile, quintile, sesquiquintile and biquintile with the nature of sextile and trine, while saying that they do not operate as strongly.', 'Book III, closing note', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug IN ('semiquintile','quintile','sesquiquintile','biquintile') AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Lilly says the semisquare and sesquiquadrate participate in the nature of the square.', 'Book III, closing note', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug IN ('semisquare','sesquiquadrate') AND w.slug='lilly-christian-astrology';

-- Final authorial apparatus: city table, bibliography and Lilly's Finis.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '894', '910', 'Book III', 'Closing apparatus',
       'English city coordinates; Lilly\'s catalogue of astrological authors; final remarks and Finis', NULL,
       'Reviewed sequentially for terminology and provenance. The bibliography is not converted into term records. Lilly prints Finis on PDF p. 910.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

-- Primary citation links by logical source block.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('trutine-of-hermes','animodar','rectification-by-accidents','promittor','hyleg','anareta','alcochodon','lord-of-geniture')
  AND sp.book='Book III' AND sp.chapter='Opening through Chapters CIII-CXIII';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('magistry','primary-direction')
  AND sp.book='Book III' AND sp.chapter='Natal topics through Chapter CLXV and directional effects';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('profection','lord-of-year','alfridary','solar-revolution','transit')
  AND sp.book='Book III' AND sp.chapter='Chapters CLXVI-CLXXIV';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('primary-direction','hyleg','quincunx','semiquintile','quintile','sesquiquintile','biquintile','semisquare','sesquiquadrate')
  AND sp.book='Book III' AND sp.chapter='Chapters CLXXV-CLXXXV and closing note';
