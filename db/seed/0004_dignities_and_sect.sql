-- Serious extraction pass: core dignity/debility and sect concepts.
-- Source summaries are based on directly located passages in the five-book test corpus.
-- Public text should paraphrase and cite; source PDFs are not redistributed.

INSERT INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('domicile', 'Domicile / House', 'A zodiacal sign assigned as a planet''s own house or principal place of rulership.', 'essential dignity', 'draft', 'Use historical house/domicile terminology carefully; do not confuse zodiacal domicile with mundane house.'),
  ('exaltation', 'Exaltation', 'A sign-based planetary dignity traditionally associated with a particular exaltation sign and, in some authors, a specific degree.', 'essential dignity', 'draft', 'Authors differ on the role of the exaltation degree versus the whole sign.'),
  ('fall', 'Fall / Descension', 'The debility opposite a planet''s exaltation, usually in the seventh sign from it.', 'essential debility', 'draft', 'Track fall, descension/dejection and translation choices separately when sources distinguish them.'),
  ('detriment', 'Detriment', 'The debility of a planet placed in a sign opposite one of its domiciles.', 'essential debility', 'draft', 'Do not merge with fall; both may be discussed as alien or weakened conditions but are structurally distinct.'),
  ('face-decan', 'Face / Decan', 'A ten-degree division of a zodiacal sign assigned to a planetary ruler.', 'sign subdivision and essential dignity', 'draft', 'Keep ordinary decans/faces distinct from alternate Indian darijan/decan systems.'),
  ('sect', 'Sect', 'The division of planets and charts into diurnal and nocturnal conditions, affecting planetary conformity and strength.', 'sect doctrine', 'draft', 'Keep planetary sect, chart sect, halb/own light and hayz as related but non-identical concepts.');

INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'House', 'English', 'historical-form', 'Used for zodiacal domicile in many early English texts; not a mundane house.' FROM terms WHERE slug='domicile';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Descension', 'English', 'translation-variant', 'Bonatti translation uses descension alongside fall.' FROM terms WHERE slug='fall';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Dejection', 'English', 'translation-variant', 'Common English rendering for the condition opposite exaltation.' FROM terms WHERE slug='fall';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Decanate', 'English', 'historical-form', 'Lilly uses Decanate or Face.' FROM terms WHERE slug='face-decan';

-- ABU MASHAR: PLANETARY SHARES / DIGNITIES
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '439', '440', 'Part V', 'Ch. 1', '1.3-1.5', 'Shares of the planets in the signs', NULL,
       'Lists house, exaltation, triplicities, terms, decans, joy, fall and detriment as distinct planetary shares in signs and grounds them in conformity/difference of planetary and sign natures.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar treats the planetary house as one of several distinct shares a planet can possess in the signs, alongside exaltation, triplicity, terms, decans and joy. He explains these shares through agreement or disagreement between planetary and sign natures and conditions.',
       'Part V, Ch. 1, planetary shares in the signs', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar treats exaltation as a distinct planetary share in a sign, separate from house and from the lesser subdivisions. In his wider dignity doctrine, multiple favorable shares can accumulate and strengthen a planet.',
       'Part V, Ch. 1 and Part VII, Ch. 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar lists fall as a distinct adverse planetary condition among the shares of planets in signs, contrasted with favorable conditions such as house and exaltation.',
       'Part V, Ch. 1, planetary shares in the signs', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar lists detriment separately from fall among the adverse planetary conditions in signs, so the two should remain distinct entries in the lexicon.',
       'Part V, Ch. 1, planetary shares in the signs', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='abu-mashar-great-introduction';

-- ABU MASHAR: FACES / DECANS AND SECT
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '515', '516', 'Part V', 'Ch. 16', '16.1-16.4', 'Indian decans (darijan)', NULL,
       'Defines each sign as three ten-degree divisions and gives an Indian rulership scheme tied to sign lords and triplicity structure.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar preserves more than one decan tradition. In his chapter on the Indian darīǧān, each sign is divided into three ten-degree parts; the first is ruled by the sign lord, the second by the lord of the fifth sign, and the third by the lord of the ninth sign. This must not be silently merged with the ordinary face/decan rulership sequence.',
       'Part V, Ch. 16, Indian decans', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='abu-mashar-great-introduction';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '431', '432', 'Part IV', 'Ch. 9', '9.1-9.5', 'Diurnal and nocturnal planets', NULL,
       'Classifies planets as diurnal or nocturnal according to temperateness by day or night; Mercury changes according to phase and planetary contact.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar divides the planets into diurnal and nocturnal groups according to whether their natures are better tempered by day or by night. Saturn, Jupiter and the Sun are diurnal; Mars, Venus and the Moon are nocturnal; Mercury is variable and can become diurnal or nocturnal according to phase and association.',
       'Part IV, Ch. 9, diurnal and nocturnal planets', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sect' AND w.slug='abu-mashar-great-introduction';

-- AL-BIRUNI: DIGNITY ORDER AND DEBILITIES
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '324', '325', '493-494', 'Testimony/dignity and order of dignities', NULL,
       'Distinguishes favorable dignity from peregrination, detriment and fall; gives an explicit hierarchy of house, exaltation, term, triplicity and face.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī treats lordship of the house as the highest of the listed sign-based dignities in §494, followed by exaltation, term, triplicity and face.',
       '§§493-494, testimony and dignity', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī ranks exaltation immediately below house lordship in his stated order of dignities and separately notes disagreement over whether exaltation is tied chiefly to a degree, an interval around it, or the whole sign.',
       '§§443-444 and §494', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī says the signs and degrees opposite the exaltations are places of dejection or fall in which a planet''s condition deteriorates.',
       '§443, exaltation and opposite dejection', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In al-Bīrūnī''s dignity discussion, detriment is an adverse condition distinct from fall: when a planet is in detriment or fall, the alien or unfavorable condition is intensified beyond simple peregrination.',
       '§493, testimony and dignity', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='al-biruni-tafhim';

-- LILLY: ESSENTIAL DIGNITIES
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '122', '124', 'Book I', 'Ch. XVIII', 'Essential dignities: house, exaltation, triplicity, term and face', NULL,
       'Assigns numerical values to essential dignities and gives interpretive descriptions for each condition.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly gives a planet in its own house five essential dignities, his highest ordinary score in the table, and describes the condition as analogous to being master of one''s own house and estate unless accidental afflictions intervene.',
       'Book I, Ch. XVIII, essential dignities', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly gives exaltation four essential dignities and applies that dignity through the sign, not only at the exact exaltation degree.',
       'Book I, Ch. XVIII, exaltation', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly uses fall as the debility corresponding to exaltation and lists each planet''s fall opposite its exaltation in the planetary descriptions and dignity table.',
       'Book I, planetary descriptions and dignity table', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly uses detriment for the sign opposite a planet''s house and treats it as a major essential debility distinct from fall.',
       'Book I, planetary descriptions and dignity table', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly treats face, decanate and decan as equivalent terminology in this context. A planet in its own face receives one essential dignity and is therefore not peregrine, though Lilly considers this a weak form of dignity.',
       'Book I, Ch. XVIII, face/decanate', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='lilly-christian-astrology';

-- BONATTI: EXALTATION/FALL, TRIPLICITY CONTEXT AND HAYZ/SECT-RELATED CONDITION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '66', '69', 'Second Tractate', 'Chs. VIII-X', 'Exaltations and falls/descensions of the planets', NULL,
       'Gives exaltation signs and degrees and states that the seventh sign from exaltation is the fall/descension; distinguishes fall language from other debility language.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti, citing Albumasar and Alchabitius, gives the traditional exaltation signs and specific exaltation degrees for the planets. His discussion preserves the exaltation degree explicitly rather than treating the doctrine as only sign-based.',
       'Second Tractate, Chs. VIII-IX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti states that each planet''s fall or descension is in the seventh sign from its exaltation, giving the standard oppositions sign by sign. The translation also notes that fall and descension are not always perfectly interchangeable terms.',
       'Second Tractate, Ch. X, fall/descension', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '106', '107', 'Second Tractate', NULL, 'Own similitude / Aym (hayz-related fortitude)', NULL,
       'Describes conformity of masculine/diurnal and feminine/nocturnal planets with sign gender and states that Aym gives additional fortitude. Editorial notes identify this as hayz-related but distinguish it from other sect conditions.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes a planet as stronger when its diurnal/nocturnal and masculine/feminine condition conforms to its surroundings, and separately names Aym as a fortitude. Because the translation''s editorial notes distinguish this material from other sect-related conditions, the lexicon should not collapse Bonatti''s Aym, own similitude, halb and later hayz terminology into a single rule.',
       'Second Tractate, own similitude and Aym', 'close_paraphrase', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sect' AND w.slug='bonatti-liber-astronomiae';

-- ADD INTERPRETATIONS TO EXISTING TERMS FROM SERIOUS PASS
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar says there are at least five historical systems of terms: Egyptian, Ptolemaic, Chaldean, Asṭraṭū and Indian. The systems differ even over whether the luminaries participate, so the lexicon must model each scheme separately rather than store one anonymous table of bounds.',
       'Part V, Ch. 8, differences among term systems', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives sect-dependent triplicity rulers in the Arabic/Dorothean form: a day ruler, a night ruler, and a participating ruler for each elemental triplicity.',
       'Second Tractate, Ch. XI, four triplicities', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-rulers' AND w.slug='bonatti-liber-astronomiae';

-- RELATIONS
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'opposite-condition', 'Fall is structurally defined from exaltation by opposition in several sources.', 'draft' FROM terms a, terms b WHERE a.slug='fall' AND b.slug='exaltation';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'opposite-condition', 'Detriment is structurally opposite domicile.', 'draft' FROM terms a, terms b WHERE a.slug='detriment' AND b.slug='domicile';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-but-distinct', 'Hayz is sect-related but has additional conditions; do not equate it with sect alone.', 'draft' FROM terms a, terms b WHERE a.slug='hayz' AND b.slug='sect';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subdivision-related', 'Face/decan and terms/bounds are both sign subdivisions but use different division systems and rulership schemes.', 'draft' FROM terms a, terms b WHERE a.slug='face-decan' AND b.slug='terms';
