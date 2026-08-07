-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part II, chapters 1-9. Read in order from PDF pp. 190-237 / original pp. 176-223.
-- Brill 2019 edition; summaries are original paraphrases and no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('fixed-stars', 'Fixed Stars', 'The slow-moving stars distinguished from the seven wandering planets and treated as belonging to a single stellar sphere.', 'stellar doctrine', 'draft', 'Abū Maʿshar follows the Ptolemaic catalogue framework and contrasts the fixed stars with the seven planets.'),
  ('stellar-magnitude', 'Stellar Magnitude', 'A classification of fixed stars by apparent brightness.', 'stellar doctrine', 'draft', 'Part II chapter 1 gives six magnitude classes, plus special descriptors for some stars.'),
  ('constellation', 'Constellation', 'A conventional imagined figure formed from groups of stars and used to organize the stellar sphere.', 'stellar doctrine', 'draft', 'Abū Maʿshar explicitly says the 48 constellations are formed in imagination and thought.'),
  ('zodiac', 'Zodiac / Belt of the Signs', 'The central belt of the celestial sphere containing the twelve signs and divided into 360 degrees.', 'zodiacal framework', 'draft', 'The translation calls it the “belt of the sphere of the signs”.'),
  ('zodiac-sign', 'Sign (Zodiacal Sign)', 'One of the twelve equal thirty-degree divisions of the zodiac used for universal astrological indication.', 'zodiacal framework', 'draft', 'Distinguish the equal signs from the pictorial constellations even though Part II also discusses the twelve constellations on the path of the Sun.'),
  ('universal-indication', 'Universal Indication', 'An indication applying broadly across genera, species, or general worldly conditions.', 'foundational doctrine', 'draft', 'Part II contrasts the universal indication of the twelve zodiacal constellations/signs with particular indications of the other constellations.'),
  ('particular-indication', 'Particular Indication', 'An indication restricted to a specific species, individual property, or narrower class of things.', 'foundational doctrine', 'draft', 'Paired with universal indication.'),
  ('triplicity', 'Triplicity', 'A group of three signs sharing one elemental nature: fiery, earthy, airy, or watery.', 'zodiacal doctrine', 'draft', 'Abū Maʿshar often calls each sign within such a group a “triplicity”; retain this editorial note when comparing translations.'),
  ('tropical-sign', 'Tropical Sign', 'A sign beginning a seasonal quadrant, where the Sun’s ingress marks a change from one seasonal nature to another.', 'sign modality', 'draft', 'Equivalent in later terminology to movable/cardinal, but do not silently replace the source term.'),
  ('fixed-sign', 'Fixed Sign', 'The middle sign of a seasonal quadrant, where the nature of the season is established and firm.', 'sign modality', 'draft', 'Part II chapter 6 defines this directly from the seasonal cycle.'),
  ('bicorporeal-sign', 'Bicorporeal Sign', 'The final sign of a seasonal quadrant, mixing the nature of the departing season with that of the approaching season.', 'sign modality', 'draft', 'Later commonly called mutable; preserve the source term bicorporeal.'),
  ('quadrant-of-sphere', 'Quadrant of the Sphere', 'One of four seasonal divisions of the zodiacal circle associated with spring, summer, autumn, and winter.', 'zodiacal framework', 'draft', 'Part II chapter 7 uses quadrants to derive sign number, modalities, and elemental natures.'),
  ('masculine-sign', 'Masculine Sign', 'A sign assigned a masculine nature in the alternating natural order beginning with Aries.', 'sign polarity', 'draft', 'Abū Maʿshar distinguishes the natural alternating order from an accidental order based on houses from the ascendant.'),
  ('feminine-sign', 'Feminine Sign', 'A sign assigned a feminine nature in the alternating natural order beginning with Taurus.', 'sign polarity', 'draft', 'Paired with masculine sign.'),
  ('diurnal-sign', 'Diurnal Sign', 'A sign assigned to the day in the alternating order beginning with Aries.', 'sign sect-like classification', 'draft', 'This is a classification of signs, not the same concept as planetary sect.'),
  ('nocturnal-sign', 'Nocturnal Sign', 'A sign assigned to the night in the alternating order beginning with Taurus.', 'sign sect-like classification', 'draft', 'This is a classification of signs, not the same concept as planetary sect.');

-- Chapter 1: fixed stars, magnitudes, and constellations.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '177', '183', 'Part II', 'Chapter 1', '1.3-1.10',
       'The seven swift stars, 1,022 fixed stars, six magnitudes, and 48 constellations', NULL,
       'Abū Maʿshar distinguishes the seven planets from the fixed stars, reports six brightness classes, and lists northern, zodiacal, and southern constellations.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes seven rapidly moving planets from 1,022 slow-moving stars which he calls fixed stars. The fixed stars are placed in a single sphere and share approximately the same very slow motion.',
       'Part II, Chapter 1, §§1.4-1.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-stars' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The fixed stars are arranged into six classes according to brightness, from the brightest first magnitude down through the sixth. Abū Maʿshar also preserves special descriptive classes for several stars outside the ordinary brightness count.',
       'Part II, Chapter 1, §1.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='stellar-magnitude' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar reports forty-eight constellations: twenty-one north of the Sun’s path, twelve on the path of the Sun, and fifteen south of it. He explicitly states that these figures are formed in imagination and thought rather than being literal physical shapes.',
       'Part II, Chapter 1, §§1.7-1.10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='constellation' AND w.slug='abu-mashar-great-introduction';

-- Chapters 2-4: zodiac, signs, indication, elements, and triplicities.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '184', '203', 'Part II', 'Chapters 2-4', '2.1-4.8',
       'Why the twelve zodiacal constellations/signs carry universal indication; division into 360 degrees; derivation of twelve signs and elemental triplicities', NULL,
       'Contains the universal/particular indication distinction, definition of the zodiacal belt, elemental sequence, and derivation of fiery, earthy, airy, and watery triplicities.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The central belt containing the twelve signs is divided into 360 degrees, each sign receiving 30 degrees. Degrees are further divided sexagesimally into minutes, seconds, thirds, and smaller parts.',
       'Part II, Chapter 2, §2.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='zodiac' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar treats the twelve signs as the principal zodiacal places to which the other constellations and both swift and slow stars are related. Their role is universal rather than merely particular, and each sign occupies thirty degrees of the zodiacal belt.',
       'Part II, Chapter 2, §§2.2-2.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='zodiac-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A universal indication applies broadly to many things or to general conditions of the world. Abū Maʿshar assigns this kind of indication especially to the twelve zodiacal constellations/signs because of their centrality to the Sun, seasons, planets, and generation and corruption.',
       'Part II, Chapter 2, §§2.3-2.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='universal-indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A particular indication belongs to a narrower object, species, individual, or property. Abū Maʿshar contrasts this with the universal indication of the twelve zodiacal constellations/signs and assigns particular indication especially to the other constellations.',
       'Part II, Chapter 2, §2.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='particular-indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The twelve signs are arranged into four elemental groups of three: Aries-Leo-Sagittarius fiery, Taurus-Virgo-Capricorn earthy, Gemini-Libra-Aquarius airy, and Cancer-Scorpio-Pisces watery. Abū Maʿshar derives their agreement from common elemental nature.',
       'Part II, Chapter 3, §§3.5-3.9; Chapter 7, §§7.4-7.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity' AND w.slug='abu-mashar-great-introduction';

-- Chapters 5-7: Aries as beginning, modalities, and quadrants.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '204', '219', 'Part II', 'Chapters 5-7', '5.1-7.7',
       'Why Aries begins the signs; seasonal quadrants; tropical, fixed, and bicorporeal signs; Hermes/Agathodaimon account', NULL,
       'The three modalities are defined through beginning, middle, and end of seasonal quadrants. Chapter 7 repeats and philosophically derives the system.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A tropical sign begins one of the four seasonal quadrants and marks a change from one seasonal nature to another: Aries, Cancer, Libra, and Capricorn.',
       'Part II, Chapter 6, §§6.2-6.3; Chapter 7, §7.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='tropical-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A fixed sign is the middle sign of a seasonal quadrant, where the season’s nature is established or made firm: Taurus, Leo, Scorpio, and Aquarius.',
       'Part II, Chapter 6, §§6.2-6.3; Chapter 7, §7.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A bicorporeal sign is the final sign of a seasonal quadrant. Its earlier portion resembles the departing season and its later portion the approaching one: Gemini, Virgo, Sagittarius, and Pisces.',
       'Part II, Chapter 6, §§6.2-6.3; Chapter 7, §7.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='bicorporeal-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar divides the annual zodiacal cycle into four quadrants corresponding to spring, summer, autumn, and winter. Each quadrant contains a beginning, middle, and end and thus supplies the conceptual basis for the three sign modalities.',
       'Part II, Chapters 5-7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='quadrant-of-sphere' AND w.slug='abu-mashar-great-introduction';

-- Chapters 8-9: masculine/feminine and diurnal/nocturnal signs.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '220', '223', 'Part II', 'Chapters 8-9', '8.1-9.4',
       'Masculine/feminine signs and diurnal/nocturnal signs', NULL,
       'Abū Maʿshar gives an alternating natural order and contrasts it with alternative accidental schemes.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the natural order Aries is masculine, Taurus feminine, and the signs alternate thereafter. Abū Maʿshar grounds masculinity in heat and active power and distinguishes this natural classification from an accidental house-based alternation from the ascendant.',
       'Part II, Chapter 8, §§8.2-8.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='masculine-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the natural alternating order Taurus is feminine, followed by Cancer, Virgo, Scorpio, Capricorn, and Pisces. Abū Maʿshar treats this natural classification as more stable than an accidental alternation counted from the ascendant.',
       'Part II, Chapter 8, §§8.2-8.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='feminine-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Aries is diurnal and the signs alternate day and night thereafter, making Gemini, Leo, Libra, Sagittarius, and Aquarius diurnal as well. Abū Maʿshar connects this order with the heat of day and the alternating sequence of masculine and feminine signs.',
       'Part II, Chapter 9, §§9.2-9.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='diurnal-sign' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Taurus is nocturnal and the signs alternate thereafter, making Cancer, Virgo, Scorpio, Capricorn, and Pisces nocturnal. Abū Maʿshar rejects an alternative four-plus-four-plus-four scheme as inconsistent with the natural order.',
       'Part II, Chapter 9, §§9.2-9.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='nocturnal-sign' AND w.slug='abu-mashar-great-introduction';

-- Relations discovered in Part II.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contains', 'The zodiacal belt contains the twelve equal zodiacal signs.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='zodiac' AND b.slug='zodiac-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Universal and particular indication are contrasted throughout Part II chapter 2.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='universal-indication' AND b.slug='particular-indication';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Masculine and feminine signs form an alternating natural classification.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='masculine-sign' AND b.slug='feminine-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Diurnal and nocturnal signs form an alternating classification distinct from planetary sect.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='diurnal-sign' AND b.slug='nocturnal-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'basis-for', 'Triplicity groups are the elemental basis later used to assign triplicity rulers.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='triplicity' AND b.slug='triplicity-rulers';
