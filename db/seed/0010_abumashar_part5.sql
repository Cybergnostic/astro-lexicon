-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part V, chapters 1-22. Read in order from PDF pp. 448-553 / original pp. 434-539.
-- Brill 2019 edition. Public-facing summaries are original paraphrases; no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('planetary-share', 'Planetary Share in a Sign', 'A structured participation of a planet in a zodiacal sign, including houses, exaltations, triplicities, terms, decans and other sign-based conditions.', 'dignity framework', 'draft', 'Abū Maʿshar uses shares as an umbrella category. Do not reduce it to essential dignity alone because the list also includes joy, fall, detriment and special degree classes.'),
  ('lot-of-nature-of-planets', 'Lot of the Nature of the Planets', 'A paired lot derived from the luminaries and their houses and used in relation to the planetary houses.', 'lot', 'draft', 'Part V chapter 4 attributes this lot to the Ancients. Preserve the source name; do not equate it with unrelated later lots.'),
  ('exaltation-degree', 'Exaltation Degree', 'A specific degree within a planet’s exaltation sign at which its nature and indication are held to be displayed most strongly.', 'essential dignity', 'draft', 'Part V chapter 7 gives a long rationale for specific exaltation degrees. This is distinct from exaltation as a sign-level dignity.'),
  ('egyptian-terms', 'Egyptian Terms', 'A specific system of unequal planetary bounds in the signs attributed to the people of Egypt.', 'terms system', 'draft', 'Abū Maʿshar explicitly prefers this system and says early astrologers used it in judgments.'),
  ('ptolemaic-terms', 'Ptolemaic Terms', 'A specific system of planetary bounds attributed to Ptolemy.', 'terms system', 'draft', 'Part V chapter 10 gives a full table and chapter 8 discusses Ptolemy’s criticism of other systems.'),
  ('chaldean-terms', 'Chaldean Terms', 'A terms system attributed to the Chaldeans or people of Babylon.', 'terms system', 'draft', 'Abū Maʿshar reports the system historically but omits its table because of disagreement and confusion in the transmitted material.'),
  ('astratu-terms', 'Terms of Asṭraṭū', 'A terms system attributed to Asṭraṭū in which the luminaries also receive shares.', 'terms system', 'draft', 'The authority Asṭraṭū is unidentified in the edition. Unlike the other four systems, this one divides signs among seven planets.'),
  ('indian-terms', 'Indian Terms', 'A terms system in which masculine signs follow one repeating distribution and feminine signs another.', 'terms system', 'draft', 'Abū Maʿshar presents this as one of five known systems but still prefers the Egyptian terms.'),
  ('darijan', 'Darīǧān (Indian Decan)', 'An Indian ten-degree division of a sign corresponding structurally to a decan but using a different rulership scheme.', 'decan system', 'draft', 'The first darīǧān is ruled by the sign lord, the second by the lord of the fifth sign, and the third by the lord of the ninth sign.'),
  ('ninth-nawbahr', 'Ninth / Nawbahar', 'One of nine equal divisions of a sign, each measuring three degrees and twenty minutes, assigned by sign-based rulership.', 'zodiacal subdivision', 'draft', 'The translation gives nawbahr; the chapter explicitly glosses it as a ninth.'),
  ('dodecatemorion', 'Dodecatemorion', 'One of twelve equal two-and-a-half-degree divisions of a sign, each corresponding in sequence to one of the twelve signs.', 'zodiacal subdivision', 'draft', 'Part V chapter 18 also records a separate degree-by-degree sign-nature scheme; keep the two procedures distinct.'),
  ('degree-sign-nature', 'Degree Sign-Nature', 'A degree-by-degree scheme assigning successive zodiacal sign natures to the thirty degrees of each sign.', 'degree doctrine', 'draft', 'The sequence repeats every twelve degrees. Abū Maʿshar attributes many degree judgments using this scheme to Hermes.'),
  ('masculine-feminine-degrees', 'Masculine and Feminine Degrees', 'Specific degrees or degree ranges classified as masculine or feminine independently of the gender classification of the sign as a whole.', 'degree doctrine', 'draft', 'Part V chapter 19 preserves three methods and says agreement of two or three methods is strongest.'),
  ('bright-degree', 'Bright Degree', 'A degree class associated in this source with stronger indications of goodness, beauty, brightness and good fortune.', 'degree quality', 'draft', 'Part of a four-class degree scheme in Part V chapter 20.'),
  ('dusky-degree', 'Dusky Degree', 'A degree class associated with difficulty and adverse indication.', 'degree quality', 'draft', 'The translation and manuscript notes show terminology instability among dusky, shadowy, smoky and dark; preserve that uncertainty.'),
  ('dark-degree', 'Dark / Shadowy Degree', 'A degree class distinguished from bright and empty degrees and associated with a lesser adverse indication in the main translation.', 'degree quality', 'draft', 'Part V chapter 20 has textual/translation ambiguity between dark, dusky, shadowy and smoky labels.'),
  ('empty-degree', 'Empty Degree', 'A degree class called empty, described as an empty cipher or zero, and associated with a lesser adverse indication.', 'degree quality', 'draft', 'Do not confuse the source’s wordplay around zero/yellow noted by the editors with a separate technical doctrine.'),
  ('planetary-well', 'Planetary Well', 'A specific zodiacal degree in which a planet is said to lose splendour and become weak in its indication.', 'degree condition', 'draft', 'The source says the exact lists varied and gives the degrees on which earlier Persian and Egyptian authorities broadly agreed.'),
  ('degrees-increasing-good-fortune', 'Degrees Increasing Good Fortune', 'Specific zodiacal degrees said to amplify fortunate indications when occupied by relevant points such as the Moon, ascendant or Lot of Fortune.', 'degree condition', 'draft', 'The chapter preserves more than one list/tradition and treats these degrees as amplifiers rather than independent guarantees of fortune.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Bounds', 'English', 'modern-translation', 'Common modern English synonym for terms.' FROM terms WHERE slug='terms';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Darijan', 'English transliteration', 'historical-term', 'Simplified transliteration of darīǧān.' FROM terms WHERE slug='darijan';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Nawbahr', 'English transliteration', 'historical-term', 'Source transliteration for the ninth-part doctrine.' FROM terms WHERE slug='ninth-nawbahr';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Ninth', 'English', 'translation', 'Literal structural label used by the translators.' FROM terms WHERE slug='ninth-nawbahr';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Well', 'English', 'source-term', 'Short form for a planetary well degree.' FROM terms WHERE slug='planetary-well';

-- Chapter 1: umbrella doctrine of planetary shares.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '439', '441', 'Part V', 'Chapter 1', '1.3-1.6',
       'Shares of the planets in signs: house, exaltation, triplicity, terms, decans, joy, fall, detriment and special degree classes', NULL,
       'Defines the umbrella framework and explains shares through agreement or opposition between planetary and sign natures and conditions.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar treats planetary participation in signs as a broad system of shares. He explicitly includes house, exaltation, triplicity, terms, decans, joy, fall, detriment, and degrees signifying goodness or badness. The framework is grounded in agreement, opposition, strength, weakness, sect-like conditions, and other relations between planets and signs.',
       'Part V, Chapter 1, §§1.3-1.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-share' AND w.slug='abu-mashar-great-introduction';

-- Chapters 2-4: houses/domiciles, detriment and the lot of planetary nature.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '443', '465', 'Part V', 'Chapters 2-4', '2.1-4.11',
       'Competing explanations for planetary houses; canonical house assignments; detriment; lot of the nature of the planets', NULL,
       'Abū Maʿshar reports and criticizes several rationales, then gives Ptolemaic and Hermetic/Agathodaimon accounts.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The canonical house scheme is stated as Mars in Aries and Scorpio, Venus in Taurus and Libra, Mercury in Gemini and Virgo, Jupiter in Sagittarius and Pisces, Saturn in Capricorn and Aquarius, the Sun in Leo, and the Moon in Cancer. Abū Maʿshar then preserves multiple explanatory traditions for why this order was assigned.',
       'Part V, Chapters 2-4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the house doctrine, the seventh sign from a planet’s house is identified as its detriment, expressing opposition between the planet’s own place and the contrary place.',
       'Part V, Chapter 4, §4.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar reports a paired lot called the lot of the nature of the planets, derived from the degrees of the Sun and Moon and the central degrees of Leo and Cancer. He says the two resulting positions correspond together to the two houses of a planet.',
       'Part V, Chapter 4, §4.11', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-nature-of-planets' AND w.slug='abu-mashar-great-introduction';

-- Chapters 5-7: exaltations, falls and exaltation degrees.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '466', '493', 'Part V', 'Chapters 5-7', '5.1-7.18',
       'Reasons for planetary exaltations and falls; sign-level exaltations; specific exaltation degrees and competing derivations', NULL,
       'Includes Ptolemaic and Hermetic rationales and a long geometrical/visibility argument for exaltation degrees.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar presents several rationales for exaltation signs. In the Ptolemaic account, exaltations are tied to seasonal increase or decrease and planetary nature; the opposite sign is the fall. The Hermetic account also emphasizes increase, decline, planetary order and the strongest part of a sign.',
       'Part V, Chapters 5-7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Fall is consistently treated as the sign opposite a planet’s exaltation in the explanatory schemes of Part V.',
       'Part V, Chapters 5-7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The exaltation degree is the specific position within the exaltation sign at which the planet is said to display its nature and fortunate indication most fully. Abū Maʿshar gives an extended derivation involving the world ascendant, cardines, planetary distance from the Sun, visibility and relative planetary positions.',
       'Part V, Chapter 7, §§7.6-7.18', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation-degree' AND w.slug='abu-mashar-great-introduction';

-- Chapters 8-13: five systems of terms/bounds.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '495', '509', 'Part V', 'Chapters 8-13', '8.1-13.4',
       'Five systems of terms: Egyptian, Ptolemaic, Chaldean, Asṭraṭū and Indian', NULL,
       'Chapter 8 compares the systems; chapters 9-13 give or discuss their distributions. Chaldean terms are intentionally not tabulated because of textual disagreement.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar explicitly knows five systems of terms: Egyptian, Ptolemaic, Chaldean, Asṭraṭū and Indian. Most divide each sign among the five non-luminary planets; Asṭraṭū uniquely includes the Sun and Moon. He says the Egyptian system is the most correct and was widely used by earlier astrologers.',
       'Part V, Chapters 8-13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Egyptian terms divide every sign among the five non-luminary planets in unequal segments. Abū Maʿshar explicitly says this is the system most widely used by earlier learned astrologers and the most correct among the systems he presents.', 'Part V, Chapters 8-9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='egyptian-terms' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Ptolemaic terms are presented as a distinct full table. Abū Maʿshar also reports Ptolemy’s criticism of the Egyptian and Chaldean orders and his appeal to an old damaged book whose author was unknown.', 'Part V, Chapters 8 and 10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ptolemaic-terms' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Chaldean terms are attributed to Babylonian astrologers and are said to vary by triplicity and in some cases by day and night. Abū Maʿshar deliberately omits a table because he regards the transmitted material as confused and lacking ancient agreement.', 'Part V, Chapter 11', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='chaldean-terms' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Asṭraṭū divides each sign among all seven planets rather than only the five non-luminary planets, explicitly giving shares to the Sun and Moon. The planetary order follows the sequence of spheres from the sign lord.', 'Part V, Chapters 8 and 12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astratu-terms' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Indian terms use one repeating distribution for masculine signs and another for feminine signs. Abū Maʿshar records the scheme but concludes again that the Egyptian terms are more correct.', 'Part V, Chapter 13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='indian-terms' AND w.slug='abu-mashar-great-introduction';

-- Chapter 14: triplicity rulers.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '510', '511', 'Part V', 'Chapter 14', '14.1-14.6',
       'Lords of the four triplicities by day, night and participating ruler', NULL,
       'Gives the complete day/night/participating scheme and ties it to planetary gender and ḥayyiz.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Each elemental triplicity has a diurnal ruler, nocturnal ruler and a third participating ruler. Fire: Sun by day, Jupiter by night, Saturn participating; Earth: Venus by day, Moon by night, Mars participating; Air: Saturn by day, Mercury by night, Jupiter participating; Water: Venus by day, Mars by night, Moon participating.',
       'Part V, Chapter 14, §§14.3-14.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-rulers' AND w.slug='abu-mashar-great-introduction';

-- Chapters 15-16: decans/faces and the Indian darīǧān system.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '513', '515', 'Part V', 'Chapters 15-16', '15.1-16.4',
       'Three ten-degree decans per sign; sphere-order rulers; Indian darīǧān alternative', NULL,
       'Separates the common Persian/Babylonian/Egyptian sequence from the Indian sign/fifth/ninth rulership scheme.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A sign is divided into three ten-degree decans. In the Persian, Babylonian and Egyptian scheme, rulers proceed in planetary-sphere order, beginning with Mars for the first decan of Aries and cycling from the Moon back to Saturn.',
       'Part V, Chapter 15', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The Indian darīǧān is structurally a threefold ten-degree division like the decan, but its rulers are determined differently: first by the sign lord, second by the lord of the fifth sign, and third by the lord of the ninth sign. Abū Maʿshar says the preceding non-Indian distribution is more correct.',
       'Part V, Chapter 16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='darijan' AND w.slug='abu-mashar-great-introduction';

-- Chapters 17-18: ninths and dodecatemoria.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '517', '523', 'Part V', 'Chapters 17-18', '17.1-18.4',
       'Ninths/nawbahr; dodecatemoria; degree-by-degree sign-nature sequence', NULL,
       'Chapter 17 presents two ninth-rulership methods and explicitly prefers the first. Chapter 18 distinguishes 2.5-degree dodecatemoria from a separate one-degree sign-nature cycle.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A nawbahr or ninth divides a sign into nine equal parts of three degrees and twenty minutes. In the preferred Indian scheme the nine parts successively take the natures and lords of signs, with the order anchored in the triplicity structure.',
       'Part V, Chapter 17, §§17.1-17.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ninth-nawbahr' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A dodecatemorion is one of twelve equal parts of a sign, each two and a half degrees. The first has the nature of the sign itself, the second of the next sign, and so on through the zodiacal sequence.',
       'Part V, Chapter 18, §18.2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dodecatemorion' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A separate Hermetic scheme assigns each individual degree the nature of a sign in repeating zodiacal order: degree one takes the sign itself, degree two the next sign, through degree twelve, then the sequence begins again at degree thirteen.',
       'Part V, Chapter 18, §§18.3-18.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='degree-sign-nature' AND w.slug='abu-mashar-great-introduction';

-- Chapters 19-22: degree-level classifications.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '525', '539', 'Part V', 'Chapters 19-22', '19.1-22.7',
       'Masculine/feminine degrees; bright/dusky/dark/empty degrees; wells; degrees increasing good fortune', NULL,
       'These are degree-level doctrines distinct from sign-level gender, dignity and planetary classification. Several lists have variant traditions.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Specific degrees are classified as masculine or feminine independently of the sign as a whole. Abū Maʿshar gives three methods and says a place is strongest when two or all three methods agree on its gender.',
       'Part V, Chapter 19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='masculine-feminine-degrees' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Bright degrees form one class in a fourfold degree-quality scheme and are assigned the strongest favourable indication in the main translation.', 'Part V, Chapter 20, §§20.1-20.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='bright-degree' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Dusky degrees belong to the same fourfold degree-quality scheme and are associated with difficulty and adverse indication. The textual tradition varies in the exact labels applied to dusky, shadowy and smoky classes.', 'Part V, Chapter 20, §§20.1-20.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dusky-degree' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Dark or shadowy degrees are distinguished from bright and empty degrees, but the edition notes instability in the terminology. The main translation associates them with a lesser adverse indication than the strongest negative class.', 'Part V, Chapter 20, §§20.1-20.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dark-degree' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Empty degrees are a distinct class described as an empty cipher or zero. In the main translation they carry a relatively weak adverse indication.', 'Part V, Chapter 20, §§20.1-20.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='empty-degree' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planetary well is a specific degree in which the planet loses splendour and becomes weak in indication. The weakening can reduce a benefic’s good or sometimes reduce a malefic’s harm; Abū Maʿshar notes disagreement over the exact degrees and records a Persian-Egyptian consensus list.',
       'Part V, Chapter 21', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-well' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Certain degrees are said to increase an already indicated good fortune when occupied by the Moon, Lot of Fortune or ascendant. The doctrine is explicitly conditional: the surrounding planetary indications must already support the fortunate outcome, and more than one traditional list is preserved.',
       'Part V, Chapter 22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='degrees-increasing-good-fortune' AND w.slug='abu-mashar-great-introduction';

-- Structural relations among systems and subdivisions.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'system-of', 'One of the five term/bounds systems explicitly enumerated by Abū Maʿshar.', 'draft' FROM terms a, terms b WHERE a.slug='egyptian-terms' AND b.slug='terms';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'system-of', 'One of the five term/bounds systems explicitly enumerated by Abū Maʿshar.', 'draft' FROM terms a, terms b WHERE a.slug='ptolemaic-terms' AND b.slug='terms';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'system-of', 'One of the five term/bounds systems explicitly enumerated by Abū Maʿshar.', 'draft' FROM terms a, terms b WHERE a.slug='chaldean-terms' AND b.slug='terms';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'system-of', 'One of the five term/bounds systems explicitly enumerated by Abū Maʿshar.', 'draft' FROM terms a, terms b WHERE a.slug='astratu-terms' AND b.slug='terms';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'system-of', 'One of the five term/bounds systems explicitly enumerated by Abū Maʿshar.', 'draft' FROM terms a, terms b WHERE a.slug='indian-terms' AND b.slug='terms';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'variant-system-of', 'The darīǧān uses the same three ten-degree structure as the decan but a different rulership method.', 'draft' FROM terms a, terms b WHERE a.slug='darijan' AND b.slug='face-decan';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specific-degree-of', 'The exaltation degree is a degree-level refinement of the sign-level exaltation.', 'draft' FROM terms a, terms b WHERE a.slug='exaltation-degree' AND b.slug='exaltation';
