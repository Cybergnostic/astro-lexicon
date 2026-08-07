-- Abū Maʿshar, The Great Introduction, Part VIII — lots.
-- Sequential extraction: all nine chapters reviewed in reading order.
-- Public definitions are paraphrases; long source text is not reproduced.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
('lot', 'Lot', 'A calculated point derived from the distance between two natural indicators and projected from a movable reference point, usually the ascendant.', 'lots', 'draft', 'Abū Maʿshar gives an explicit technical definition in Part VIII Chapter 1.'),
('lot-extraction', 'Lot Extraction', 'The procedure of measuring the distance between two indicators in equal zodiacal degrees and casting that distance from a third, movable indicator.', 'lots', 'draft', 'Keep source-specific formulas and day/night reversals separate from the general method.'),
('planetary-lots', 'Lots of the Seven Planets', 'A class of seven lots, each associated with one of the seven planets and derived according to a specific formula.', 'lots', 'draft', 'Abū Maʿshar treats these as one of three principal classes of authenticated lots.'),
('lots-of-the-twelve-places', 'Lots of the Twelve Places', 'A class of lots grouped by the topics of the twelve places; Abū Maʿshar counts eighty such lots.', 'lots', 'draft', 'Individual lots should not all be promoted automatically to top-level lexicon entries.'),
('lot-of-fortune', 'Lot of Fortune', 'The lunar lot formed from the distance Sun-to-Moon by day and Moon-to-Sun by night, projected from the ascendant.', 'lots', 'draft', 'Abū Maʿshar calls it the foremost and most eminent of the lots and also associates it with the Moon.'),
('lot-of-absence', 'Lot of Absence', 'The solar counterpart to the Lot of Fortune, formed from Moon-to-Sun by day and Sun-to-Moon by night and projected from the ascendant.', 'lots', 'draft', 'Also called the lot of the Sun; translation traditions vary in naming.'),
('lot-of-the-haylaj', 'Lot of the Haylāǧ', 'A lot derived from the prenatal lunation and the Moon, then advanced through signs and degrees in a manner compared with haylāǧ motion.', 'lots', 'draft', 'Do not collapse this into the haylāǧ itself.'),
('general-indicators-of-a-lot', 'General Indicators of a Lot', 'The planets that generally signify a lot through its formula and the place in which the lot falls; a lot can have one, two, or three such indicators.', 'lots', 'draft', 'Part VIII Chapter 8 gives the general interpretive rule.'),
('movable-indicator', 'Movable Indicator', 'The third point used in lot extraction from which the measured distance of the two natural indicators is projected.', 'lots', 'draft', 'Most often the ascendant, but Abū Maʿshar allows another appropriate place or planet.'),
('conjunctional-nativity', 'Conjunctional Nativity', 'A nativity preceded by a conjunction of the luminaries, used as a branching condition in some lot formulas.', 'predictive technique', 'draft', 'Source-specific technical condition used especially in Part VIII.'),
('oppositional-nativity', 'Oppositional Nativity', 'A nativity preceded by an opposition of the luminaries, used as a branching condition in some lot formulas.', 'predictive technique', 'draft', 'Source-specific technical condition used especially in Part VIII.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part', 'English', 'translation_variant', 'Common English rendering for Arabic sahm in later astrological literature.' FROM terms WHERE slug='lot';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Lot of the Moon', 'English', 'source_name', 'Abū Maʿshar explicitly associates the Lot of Fortune with the Moon.' FROM terms WHERE slug='lot-of-fortune';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Ascendant of the Moon', 'English', 'source_name', 'Reported source name for the Lot of Fortune.' FROM terms WHERE slug='lot-of-fortune';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Lot of the Sun', 'English', 'source_name', 'Abū Maʿshar treats the Lot of Absence as the solar lot.' FROM terms WHERE slug='lot-of-absence';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 819, 823, 'Part VIII', 'Chapter 1', '1.4-1.10', 'Original pp. 819-823 / PDF pp. 833-837', NULL,
'Abū Maʿshar explains the rationale and formal structure of lots, including two natural indicators and a third movable indicator.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 825, 831, 'Part VIII', 'Chapter 2', '2.3-2.7', 'Original pp. 825-831 / PDF pp. 839-845', NULL,
'Authenticated lots are classified into seven planetary lots, eighty lots of the twelve places, and ten other lots, totaling ninety-seven.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 835, 841, 'Part VIII', 'Chapter 3', '3.6-3.12', 'Original pp. 835-841 / PDF pp. 849-855', NULL,
'Lot of Fortune and Lot of Absence formulas and their source-specific meanings.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 911, 917, 'Part VIII', 'Chapter 5', '5.2-5.12', 'Original pp. 911-917 / PDF pp. 925-931', NULL,
'Additional lots outside the seven planets and twelve places, including the Lot of the Haylāǧ.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 939, 943, 'Part VIII', 'Chapter 8', '8.2-8.8', 'Original pp. 939-943 / PDF pp. 953-957', NULL,
'General interpretation of lots through one, two, or three indicators, their aspects, condition, benefic/malefic quality, and reception.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, 945, 947, 'Part VIII', 'Chapter 9', '9.2-9.4', 'Original pp. 945-947 / PDF pp. 959-961', NULL,
'Reconstruction of an unknown indicator from the other three known positions in a lot formula.'
FROM editions e JOIN works w ON e.work_id=w.id WHERE w.slug='great-introduction' LIMIT 1;

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'A lot is defined through two natural indicators sharing a signification and a third movable indicator from which their zodiacal distance is cast.', 'Part VIII Chapter 1', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='lot' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The general extraction method measures equal zodiacal degrees between two indicators and projects the interval from the ascendant or another relevant movable point.', 'Part VIII Chapters 1 and 3', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='lot-extraction' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Abū Maʿshar divides authenticated lots into three classes and counts ninety-seven in all: seven planetary, eighty associated with the twelve places, and ten additional lots.', 'Part VIII Chapter 2', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='planetary-lots' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Lot of Fortune is derived from Sun to Moon by day and Moon to Sun by night. Abū Maʿshar treats it as the foremost of the lots and links it with bodily and worldly fortune.', 'Part VIII Chapter 3', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='lot-of-fortune' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Lot of Absence reverses the luminary formula of Fortune and is associated especially with inward, hidden, absent, religious, and soul-related matters.', 'Part VIII Chapter 3', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='lot-of-absence' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Lot of the Haylāǧ is computed from the prenatal conjunction or opposition to the Moon and is then advanced through degrees and signs as a predictive point.', 'Part VIII Chapter 5', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='lot-of-the-haylaj' AND w.slug='great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'A lot may have one, two, or three general indicators depending on its formula and the place in which it falls. The strongest case is when all relevant indicators aspect the lot.', 'Part VIII Chapter 8', 'direct', 'reviewed'
FROM terms t, works w WHERE t.slug='general-indicators-of-a-lot' AND w.slug='great-introduction';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Abū Maʿshar treats Fortune and Absence as paired luminary lots with reversed day/night formulas.', 'reviewed'
FROM terms a, terms b WHERE a.slug='lot-of-fortune' AND b.slug='lot-of-absence';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subclass-of', 'Planetary lots are one of Abū Maʿshar''s three principal classes of lots.', 'reviewed'
FROM terms a, terms b WHERE a.slug='planetary-lots' AND b.slug='lot';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subclass-of', 'Lots of the twelve places are one of Abū Maʿshar''s three principal classes of lots.', 'reviewed'
FROM terms a, terms b WHERE a.slug='lots-of-the-twelve-places' AND b.slug='lot';
