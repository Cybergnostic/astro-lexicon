-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part VI, chapters 9-33. Read in order from PDF pp. 650-727 / original pp. 636-713.
-- Brill 2019 edition. Public-facing summaries are original paraphrases; no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('sign-country-correspondence', 'Sign-Country Correspondence', 'A doctrine assigning countries, regions, landscapes and types of places to zodiacal signs.', 'sign indication', 'draft', 'Part VI chapter 9. Treat as historical geographical astrology, not modern geography.'),
  ('mobile-resting-signs', 'Mobile and Resting Signs', 'A classification in which groups of signs are described as mobile or at rest when their rulers agree with them.', 'sign quality', 'draft', 'Part VI chapter 10. Do not silently equate this with tropical/fixed/bicorporeal modality; it is a distinct doctrine.'),
  ('voiced-sign', 'Voiced Sign', 'A sign classified by its relation to voice and, in this source, to classes or conditions of people.', 'sign quality', 'draft', 'Part VI chapters 11 and 18 distinguish voiced, powerful-voiced, moderate-voiced, weak-voiced and voiceless signs.'),
  ('zodiacal-body-correspondence', 'Zodiacal Body Correspondence', 'The assignment of parts of the human body to the twelve signs.', 'medical astrology', 'draft', 'Part VI chapter 12. Historical doctrine only; not medical guidance.'),
  ('fecund-sign', 'Fecund Sign', 'A sign classified as tending toward many children within the source’s fertility doctrine.', 'sign fertility', 'draft', 'Part VI chapter 16. Historical astrological doctrine.'),
  ('barren-sign', 'Barren Sign', 'A sign classified as tending toward barrenness within the source’s fertility doctrine.', 'sign fertility', 'draft', 'Part VI chapter 16. Historical astrological doctrine.'),
  ('sign-animal-correspondence', 'Sign-Animal Correspondence', 'A doctrine assigning classes of animals to signs according to sign nature and imagery.', 'sign indication', 'draft', 'Part VI chapter 22.'),
  ('sign-plant-correspondence', 'Sign-Plant Correspondence', 'A doctrine assigning trees, plants, seeds and grasses to signs.', 'sign indication', 'draft', 'Part VI chapter 23.'),
  ('sign-water-fire-correspondence', 'Sign Correspondence to Water and Fire', 'A doctrine assigning forms of water and things produced by fire to signs.', 'sign indication', 'draft', 'Part VI chapter 24.'),
  ('sign-direction', 'Direction of a Sign', 'A directional correspondence assigning signs to east, south, west or north and related winds.', 'sign correspondence', 'draft', 'Part VI chapter 25.'),
  ('cardine', 'Cardine', 'One of the four principal places beginning the quadrants of the sphere: ascendant, midheaven, descendant and lower cardine.', 'house framework', 'draft', 'Part VI chapter 26. Historical source term corresponding broadly to an angle.'),
  ('succedent-place', 'Succedent Place', 'The place following a cardine within a quadrant of the sphere.', 'house framework', 'draft', 'Part VI chapter 26.'),
  ('cadent-place', 'Cadent Place', 'The third place in a quadrant, described as falling away from its cardine.', 'house framework', 'draft', 'Part VI chapter 26.'),
  ('twelve-places', 'Twelve Places', 'The twelve divisions of the sphere produced by dividing each of four quadrants into three places.', 'house framework', 'draft', 'Part VI chapter 26. Preserve “places” as source language; do not assume every later house meaning is identical.'),
  ('planetary-joy', 'Planetary Joy', 'A place in which a planet rejoices because the place’s indications correspond to the planet’s own indications.', 'house doctrine', 'draft', 'Part VI chapter 26 gives Mercury 1st, Moon 3rd, Venus 5th, Mars 6th, Sun 9th, Jupiter 11th, Saturn 12th.'),
  ('quadrant-body-spirit', 'Quadrant Body-Spirit Classification', 'A fourfold classification of quadrants as body, spirit, both, or neither according to their position in the sphere.', 'quadrant doctrine', 'draft', 'Part VI chapter 27.'),
  ('quadrant-element-mixture', 'Elemental Mixture of the Cardines', 'The arrangement by which the four cardines from any ascendant fall in signs of the four elemental natures.', 'quadrant doctrine', 'draft', 'Part VI chapter 28.'),
  ('place-colour', 'Colours of the Quadrants and Places', 'A colour correspondence assigned to quadrants and individual places of the sphere.', 'house correspondence', 'draft', 'Part VI chapter 29.'),
  ('ascending-descending-quadrant', 'Ascending and Descending Quadrants', 'A classification of halves or quadrants of the sphere as ascending or descending, with associated length and shortness indications.', 'quadrant doctrine', 'draft', 'Part VI chapter 30.'),
  ('fourfold-natural-correspondence', 'Fourfold Natural Correspondence', 'A system linking the four humoral natures with directions, winds, seasons, groups of signs, quadrants, times of day and ages of life.', 'cosmological correspondence', 'draft', 'Part VI chapter 31.'),
  ('planetary-hour', 'Planetary Hour', 'An hour assigned cyclically to one of the seven planets according to their sphere order.', 'time lordship', 'draft', 'Part VI chapter 33. Historical astrological time-rulership doctrine.'),
  ('day-lord', 'Lord of the Day', 'The planet assigned to rule a weekday, determined from the ruler of its first planetary hour.', 'time lordship', 'draft', 'Part VI chapter 33. Weekday sequence: Sun, Moon, Mars, Mercury, Jupiter, Venus, Saturn.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Angle', 'English', 'modern-equivalent', 'Broad modern equivalent of a cardine; preserve cardine in source-specific discussion.' FROM terms WHERE slug='cardine';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Angular Place', 'English', 'descriptive-alias', 'A place beginning a quadrant.' FROM terms WHERE slug='cardine';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'House', 'English', 'later-equivalent', 'Later common English label for a place, but not always interchangeable in historical discussion.' FROM terms WHERE slug='twelve-places';

-- Chapters 9-25: proper indications and correspondences of signs.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '636', '679', 'Part VI', 'Chapters 9-25', '9.1-25.5',
       'Geographical, social, bodily, fertility, animal, plant, water/fire and directional indications of the signs', NULL,
       'Large catalogue of proper sign indications. Store as source-specific historical doctrine rather than universalized modern meanings.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar assigns countries, regions and characteristic landscapes or built environments to each sign. The catalogue is explicitly geographical and source-historical, with variant readings in the Latin traditions.',
       'Part VI, Chapter 9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-country-correspondence' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'This classification calls Aries, Taurus and Gemini mobile when their rulers agree with them; Cancer, Leo and Virgo resting; Libra, Scorpio and Sagittarius mobile; Capricorn, Aquarius and Pisces resting. This is not presented as the same thing as the earlier tropical/fixed/bicorporeal classification.',
       'Part VI, Chapter 10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='mobile-resting-signs' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar classifies Gemini, Virgo, Libra, Aquarius and the first half of Sagittarius as voiced signs. A later chapter further distinguishes powerful, moderate, weak and voiceless sign classes. These are sign classifications tied to historical doctrines of speech and voice.',
       'Part VI, Chapters 11 and 18', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='voiced-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The twelve signs are assigned successive bodily regions and organs from head downward to the feet. Abū Maʿshar also attaches historical illness correspondences to those regions. This material belongs to medieval medical astrology and is not modern medical guidance.',
       'Part VI, Chapter 12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='zodiacal-body-correspondence' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Cancer, Scorpio, Pisces and the latter half of Capricorn are classified as having many children. The chapter also separately treats twin-bearing and few-child signs.',
       'Part VI, Chapter 16, §§16.1-16.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fecund-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Gemini, Leo and Virgo are explicitly classified as barren signs; the beginning of Taurus, Aquarius and the beginning of Capricorn can also participate in the doctrine according to the source’s distinctions.',
       'Part VI, Chapter 16, §16.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='barren-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar assigns broad animal classes to signs: bird species, quadrupeds, beasts of prey, vermin and aquatic animals. The assignments follow sign nature, imagery and particular decan figures.',
       'Part VI, Chapter 22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-animal-correspondence' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The source assigns tall trees, shorter trees, plants, seeds and grasses to different signs and triplicity members, preserving a botanical correspondence system.',
       'Part VI, Chapter 23', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-plant-correspondence' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Cancer is associated with rain, Scorpio and Aquarius with flowing or river water, Pisces with stagnant water, while Aries, Leo, Scorpio and Aquarius are associated with things produced by fire.',
       'Part VI, Chapter 24', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-water-fire-correspondence' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The signs are grouped by direction: the fiery triplicity is eastern, earthy southern, airy western and watery northern. Within each triplicity one sign is the heart of the direction and the others correspond to adjacent intermediate winds.',
       'Part VI, Chapter 25', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-direction' AND w.slug='abu-mashar-great-introduction';

-- Chapter 26: cardines, quadrants, places and joys.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '680', '695', 'Part VI', 'Chapter 26', '26.1-26.32',
       'Cardines, quadrants, twelve places, place topics, rationales and planetary joys', NULL,
       'Foundational house/place doctrine. The source gives both topical lists and explanatory rationales based on planetary sphere order, place geometry and intrinsic properties.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Each quadrant begins with a cardine. From the ascendant, midheaven, descendant and lower cardine the sphere is divided into four quarters; each quarter is then divided into three places.',
       'Part VI, Chapter 26, §§26.1-26.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cardine' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The place immediately following a cardine is called succedent to the cardine. It is structurally the second place within each quadrant.',
       'Part VI, Chapter 26, §26.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='succedent-place' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The third place in a quadrant is described as cadent from its cardine. Abū Maʿshar later uses cadency and failure to aspect the ascendant when explaining hostile or weakened place significations.',
       'Part VI, Chapter 26, §§26.3 and 26.29-26.30', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cadent-place' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The twelve places arise because each of the four quadrants is divided into three. Abū Maʿshar names and assigns topics to all twelve, then discusses why those topics belong to them. He preserves both planetary-order explanations and the alternative view that each place has its own intrinsic property.',
       'Part VI, Chapter 26, §§26.4-26.31', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='twelve-places' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet rejoices in a place whose indications correspond to its own. Abū Maʿshar gives Mercury in the first, Moon in the third, Venus in the fifth, Mars in the sixth, Sun in the ninth, Jupiter in the eleventh and Saturn in the twelfth.',
       'Part VI, Chapter 26, §26.32', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-joy' AND w.slug='abu-mashar-great-introduction';

-- Chapters 27-31: quadrant and cosmological correspondences.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '697', '705', 'Part VI', 'Chapters 27-31', '27.1-31.6',
       'Body/spirit quadrants, elemental mixture of cardines, colours, ascending/descending quadrants and fourfold natural correspondences', NULL,
       'These are geometrical and cosmological correspondences layered onto the house framework.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The four quadrants are classified as spirit without body, neither spirit nor body, body without spirit, and body with spirit. The distinctions are justified through emergence into light, disappearance, darkness and opposition between quadrants.',
       'Part VI, Chapter 27', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='quadrant-body-spirit' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For any ascendant, the four cardines fall in signs representing the four elemental natures. Abū Maʿshar uses Aries rising as an example: fiery Aries, earthy Capricorn at the midheaven, airy Libra at the descendant and watery Cancer at the lower cardine.',
       'Part VI, Chapter 28', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='quadrant-element-mixture' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar assigns colours both to the four quadrants and to individual places. These colour correspondences are a separate historical layer of place doctrine rather than essential house definitions.',
       'Part VI, Chapter 29', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='place-colour' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The sphere is further divided into ascending and descending halves or quadrants. The chapter also assigns relative length and shortness to opposite halves of the sphere.',
       'Part VI, Chapter 30', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ascending-descending-quadrant' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A fourfold correspondence links blood/hot-wet with east, spring, Aries-Taurus-Gemini, the eastern-upper quadrant, the first quarter of day or night and infancy; yellow bile/hot-dry with south and summer; black bile/cold-dry with west and autumn; phlegm/cold-wet with north and winter. The same fourfold pattern is extended across signs, quadrants, time and ages of life.',
       'Part VI, Chapter 31', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fourfold-natural-correspondence' AND w.slug='abu-mashar-great-introduction';

-- Chapters 32-33: day/night divisions, planetary hours and weekday lords.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '706', '713', 'Part VI', 'Chapters 32-33', '32.1-33.7',
       'Fourfold day/night division, twenty-four hours, planetary hour cycle and lords of weekdays', NULL,
       'Chapter 32 derives twelve daylight/night conditions from the seasonal fourfold model; chapter 33 gives the planetary hour cycle and weekday rulers.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Planetary hours are assigned in repeating order according to the sequence of the planetary spheres. Beginning with the Sun for the first hour of Sunday, the cycle proceeds Venus, Mercury, Moon, Saturn, Jupiter, Mars and repeats through the twenty-four hours.',
       'Part VI, Chapter 33, §§33.1-33.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-hour' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The ruler of a weekday is the planet governing its first planetary hour. Abū Maʿshar gives the sequence Sunday Sun, Monday Moon, Tuesday Mars, Wednesday Mercury, Thursday Jupiter, Friday Venus and Saturday Saturn.',
       'Part VI, Chapter 33, §§33.3-33.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='day-lord' AND w.slug='abu-mashar-great-introduction';

-- Structural relations.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'part-of', 'A cardine begins each quadrant in the twelve-place structure.', 'draft' FROM terms a, terms b WHERE a.slug='cardine' AND b.slug='twelve-places';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'part-of', 'A succedent place is the second place in a quadrant.', 'draft' FROM terms a, terms b WHERE a.slug='succedent-place' AND b.slug='twelve-places';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'part-of', 'A cadent place is the third place in a quadrant.', 'draft' FROM terms a, terms b WHERE a.slug='cadent-place' AND b.slug='twelve-places';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'uses', 'Planetary joy is defined through correspondence between planetary significations and the twelve places.', 'draft' FROM terms a, terms b WHERE a.slug='planetary-joy' AND b.slug='twelve-places';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'determines', 'The first planetary hour determines the lord of the weekday.', 'draft' FROM terms a, terms b WHERE a.slug='planetary-hour' AND b.slug='day-lord';
