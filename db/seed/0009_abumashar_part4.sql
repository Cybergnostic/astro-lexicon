-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part IV, chapters 1-9. Read in order from PDF pp. 359-447 / original pp. 345-433.
-- Brill 2019 edition; summaries are original paraphrases and no extended translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('planetary-nature', 'Planetary Nature', 'The qualitative nature attributed to a planet from its observed action in the sublunary world, rather than as an elemental composition of the planet itself.', 'planetary doctrine', 'draft', 'Part IV repeatedly distinguishes a planet’s attributed hot/cold/wet/dry nature from its actual celestial substance.'),
  ('planetary-property', 'Planetary Property', 'A planet-specific power or characteristic through which it produces or indicates effects such as good fortune or misfortune.', 'planetary doctrine', 'draft', 'Abū Maʿshar distinguishes property from nature and uses property to explain why a benefic can act badly and a malefic well under some conditions.'),
  ('benefic', 'Benefic Planet', 'A planet whose characteristic action tends toward tempering, generation, life, preservation, or other forms of good fortune.', 'planetary condition', 'draft', 'In Part IV the classification is not treated as an immutable elemental essence; conditions can alter how beneficence appears.'),
  ('malefic', 'Malefic Planet', 'A planet whose characteristic action tends toward excess, corruption, destruction, or other forms of misfortune.', 'planetary condition', 'draft', 'Abū Maʿshar preserves the benefic/malefic distinction but argues its effects depend on conditions and planetary property.'),
  ('mixed-planet', 'Mixed Planet', 'A planet whose effects can readily take on benefic or malefic qualities according to its conditions and associations.', 'planetary condition', 'draft', 'Mercury is the chief example in Part IV.'),
  ('in-nature-of-benefics', 'In the Nature of the Benefics', 'A condition in which a planet normally classed as malefic produces a benefic-like indication without ceasing to belong to its original class.', 'planetary condition', 'draft', 'Part IV chapter 6 explicitly distinguishes becoming benefic-like from actually being reclassified as a benefic.'),
  ('in-nature-of-malefics', 'In the Nature of the Malefics', 'A condition in which a planet normally classed as benefic produces a malefic-like indication without ceasing to belong to its original class.', 'planetary condition', 'draft', 'Paired with “in the nature of the benefics”.'),
  ('ascending-in-apogee-orb', 'Ascending in the Orb of Apogee', 'A phase in a planet’s motion through the orb of its apogee treated as modifying the strength and quality of its attributed nature.', 'planetary phase', 'draft', 'Part IV chapter 7 repeatedly uses ascent/descent in the apogee orb as a modifier of heat, coldness, wetness, and dryness.'),
  ('descending-in-apogee-orb', 'Descending in the Orb of Apogee', 'A phase in a planet’s motion through the orb of its apogee treated as modifying the strength and quality of its attributed nature.', 'planetary phase', 'draft', 'Paired with ascending in the orb of apogee.'),
  ('planetary-masculinity', 'Planetary Masculinity', 'A planetary classification associated especially with heat and active quality, but modifiable by phase and quadrant.', 'planetary classification', 'draft', 'Part IV chapter 8; distinguish from masculine signs.'),
  ('planetary-femininity', 'Planetary Femininity', 'A planetary classification associated especially with wetness and passive quality, but modifiable by phase and quadrant.', 'planetary classification', 'draft', 'Part IV chapter 8; distinguish from feminine signs.'),
  ('diurnal-planet', 'Diurnal Planet', 'A planet whose nature is considered more temperate by day than by night.', 'sect doctrine', 'draft', 'Part IV chapter 9. Saturn, Jupiter and the Sun are diurnal; Mercury is conditional.'),
  ('nocturnal-planet', 'Nocturnal Planet', 'A planet whose nature is considered more temperate by night than by day.', 'sect doctrine', 'draft', 'Part IV chapter 9. Mars, Venus and the Moon are nocturnal; Mercury is conditional.'),
  ('head-of-dragon', 'Head of the Dragon / Ascending Node', 'The ascending lunar node, associated here with rising, leadership, and a measure of good fortune.', 'nodal doctrine', 'draft', 'The translation uses “Head of the ǧawzahar”. Keep the historical wording visible alongside the later conventional name.'),
  ('tail-of-dragon', 'Tail of the Dragon / Descending Node', 'The descending lunar node, associated here with descent and misfortune.', 'nodal doctrine', 'draft', 'Paired with the Head of the Dragon.'),
  ('direct-motion', 'Direct Motion', 'Apparent forward planetary motion, contrasted with station and retrogradation.', 'planetary motion', 'draft', 'Already presupposed earlier; Part IV links it especially with Mercury’s sect-like condition.'),
  ('station', 'Station', 'A planetary condition of apparent stillness marking transition between direct and retrograde motion.', 'planetary motion', 'draft', 'Part IV chapter 7 uses first and second stations in defining changes of planetary nature.'),
  ('retrogradation', 'Retrogradation', 'Apparent backward planetary motion, treated as one of the conditions capable of altering a planet’s action and nature.', 'planetary motion', 'draft', 'Part IV uses retrogradation especially for Mercury and Venus and in the discussion of variable planetary conditions.');

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '345', '367', 'Part IV', 'Chapters 1-3', '1.1-3.5',
       'Planetary natures according to Ptolemy and the common astrologers; critique of deriving planetary nature solely from elemental analogy and colour', NULL,
       'Abū Maʿshar rejects the idea that celestial bodies are literally composed of the four terrestrial qualities while retaining hot/cold/wet/dry language as an attribution from observed action.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes the qualitative natures attributed to planets from the actual substance of celestial bodies. Planets are not literally composed of terrestrial heat, coldness, wetness, and dryness; those qualities are attributed from the action their motions produce in the sublunary world.',
       'Part IV, Chapters 1-3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-nature' AND w.slug='abu-mashar-great-introduction';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '378', '401', 'Part IV', 'Chapters 4-5', '4.7-5.22',
       'Definition of benefic and malefic through agreement/temperateness versus excess; planetary property; ranking and conditional variation of beneficence and maleficence', NULL,
       'This section is central to the ontology: benefic/malefic are stable classifications, but their manifestations are conditional and are explained through planetary property rather than immutable elemental essence.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet is called benefic when the things affected by it receive a complete and harmonious condition from its movement; beneficence is also connected with tempering, generation, life, and preservation. The classification does not prevent a benefic from producing difficult effects under contrary conditions.',
       'Part IV, §§4.7-4.8; 5.2-5.22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='benefic' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet is called malefic when its action produces excess, discord, corruption, or destruction. Saturn and Mars are the principal malefics, but Abū Maʿshar explicitly allows their action to become temperate and benefic-like under suitable conditions.',
       'Part IV, §§4.7-4.8; 5.2-5.22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='malefic' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Planetary property is the characteristic power through which a planet produces or indicates effects. Abū Maʿshar uses this distinction to explain why good fortune and misfortune do not follow mechanically from a planet’s attributed hot, cold, wet, or dry nature.',
       'Part IV, §§5.17-5.22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-property' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Mercury is treated as mixed because it readily takes on the qualities of the planets and signs with which it is associated. It can act as benefic with benefics, malefic with malefics, masculine with masculine planets, feminine with feminine planets, diurnal with diurnal planets, and nocturnal with nocturnal planets.',
       'Part IV, §5.14', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='mixed-planet' AND w.slug='abu-mashar-great-introduction';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '402', '417', 'Part IV', 'Chapter 6', '6.1-6.20',
       'How benefics and malefics change their manifestation; conditions in signs; reception of planetary natures; benefic-like and malefic-like states; nodes', NULL,
       'Do not collapse “in the nature of the benefics/malefics” into literal reclassification. Abū Maʿshar explicitly preserves the underlying class.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'When a malefic is placed in a temperate condition or in a sign where it has a suitable share such as house, exaltation, term, or triplicity, it may act benefically. Abū Maʿshar says such a planet is “in the nature of the benefics” rather than simply becoming a benefic.',
       'Part IV, §§6.2-6.19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='in-nature-of-benefics' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A benefic under corrupting or discordant conditions may produce malefic-like effects. Abū Maʿshar says it is then “in the nature of the malefics”, while the planet remains of the benefic class.',
       'Part IV, §§6.2-6.19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='in-nature-of-malefics' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The Head of the lunar ǧawzahar is associated with ascent in the inclined orb, leadership, and a measure of good fortune. Abū Maʿshar also states that it can under some conditions act like a malefic.',
       'Part IV, §6.20', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='head-of-dragon' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The Tail of the lunar ǧawzahar is associated with descent and misfortune, though Abū Maʿshar allows it under some conditions to act like a benefic.',
       'Part IV, §6.20', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='tail-of-dragon' AND w.slug='abu-mashar-great-introduction';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '418', '425', 'Part IV', 'Chapter 7', '7.1-7.13',
       'Change in planetary nature through ascent/descent in apogee orb, sign and quadrant; superior and inferior planetary phases; stations, direct motion and retrogradation', NULL,
       'Part IV treats hot/cold/wet/dry as dynamic indications whose strength changes with planetary phase and context.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Ascending in the orb of apogee is one of the conditions Abū Maʿshar uses to strengthen or modify a planet’s attributed nature. Its effect differs by planet and by the quality treated as active or passive.',
       'Part IV, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ascending-in-apogee-orb' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Descending in the orb of apogee is paired with ascent as a major modifier of planetary nature. For several planets it shifts the balance between dryness and wetness while the planet’s more stable active quality remains.',
       'Part IV, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='descending-in-apogee-orb' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The first and second stations serve as boundaries in the sequence of planetary phases. For the three superior planets Abū Maʿshar associates the cycle from eastern appearance through the stations, opposition and return under the rays with successive qualitative changes.',
       'Part IV, §§7.11-7.12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='station' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Direct motion is treated as a distinct planetary condition and, for Mercury, is associated with its western phase before conjunction with the Sun and with stronger action than at the beginning of eastern retrogradation.',
       'Part IV, §§7.12; 9.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='direct-motion' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Retrogradation is one of the planetary conditions that modifies planetary action. In Part IV it appears in the phase cycles of Mercury and Venus and in Mercury’s shifting diurnal/nocturnal and benefic/malefic behaviour.',
       'Part IV, §§7.12; 9.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='retrogradation' AND w.slug='abu-mashar-great-introduction';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '426', '433', 'Part IV', 'Chapters 8-9', '8.1-9.7',
       'Masculine and feminine planets; diurnal and nocturnal planets; modification by easternness, westernness and quadrants', NULL,
       'Keep planetary masculinity/femininity separate from sign polarity and planetary diurnal/nocturnal classification separate from diurnal/nocturnal signs.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Jupiter, Mars, the Sun, Saturn, and normally Mercury are assigned masculine indication, while Venus and the Moon are feminine. The classification is not absolute in manifestation: eastern appearance and eastern quadrants tend toward masculinity, western appearance and western quadrants toward femininity.',
       'Part IV, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-masculinity' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Venus and the Moon are assigned feminine indication because wetness is treated as a feminine/passive quality. Yet planetary phase and quadrant can make a normally feminine planet indicate masculinity in particular circumstances.',
       'Part IV, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-femininity' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Saturn, Jupiter, and the Sun are diurnal because their attributed natures are considered more temperate by day. Easternness strengthens diurnal planets and westernness weakens them. Mercury is conditional rather than fixed in the same way.',
       'Part IV, Chapter 9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='diurnal-planet' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Mars, Venus, and the Moon are nocturnal because their attributed natures are considered more temperate or congenial by night. Westernness strengthens nocturnal planets and easternness weakens them. Mercury can become nocturnal when western.',
       'Part IV, Chapter 9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='nocturnal-planet' AND w.slug='abu-mashar-great-introduction';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinguished-from', 'Abū Maʿshar explicitly distinguishes a planet’s attributed nature from the planet-specific property through which good fortune and misfortune are manifested.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-nature' AND b.slug='planetary-property';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'conditional-form-of', 'A malefic may operate in the nature of the benefics under suitable conditions without ceasing to be classed as malefic.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='in-nature-of-benefics' AND b.slug='malefic';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'conditional-form-of', 'A benefic may operate in the nature of the malefics under corrupting conditions without ceasing to be classed as benefic.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='in-nature-of-malefics' AND b.slug='benefic';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'The diurnal/nocturnal classification of planets is one major component of sect doctrine.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='diurnal-planet' AND b.slug='sect';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'The diurnal/nocturnal classification of planets is one major component of sect doctrine.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='nocturnal-planet' AND b.slug='sect';
