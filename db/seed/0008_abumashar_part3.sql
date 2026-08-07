-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part III, chapters 1-9. Read in order from PDF pp. 238-357 / original pp. 224-343.
-- Brill 2019 edition; summaries are original paraphrases and no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('seven-planets', 'Seven Planets / Swift-moving Stars', 'Saturn, Jupiter, Mars, the Sun, Venus, Mercury, and the Moon, distinguished from the fixed stars by their faster and more varied motions.', 'planetary framework', 'draft', 'Abū Maʿshar repeatedly calls them the seven stars swift in movement. Preserve the historical wording while presenting the familiar planetary grouping.'),
  ('astrologer', 'Astrologer', 'A person who knows the conditions and indications of the stars and judges what they signify for a present or specified future time.', 'professional terminology', 'draft', 'Part III chapter 2 gives an explicit definition.'),
  ('obvious-indication', 'Obvious Indication', 'A stellar indication whose signified condition can be known and used in astrological judgment.', 'doctrine of indication', 'draft', 'Part III chapter 2 distinguishes useful knowable indications from subtle or hidden indications that exceed practical astrological knowledge.'),
  ('hidden-indication', 'Hidden / Subtle Indication', 'A stellar indication too subtle, remote, or difficult for the astrologer to comprehend reliably.', 'doctrine of indication', 'draft', 'Do not imply that Abū Maʿshar denies such indications; he says they may exist while falling outside what the art can practically know.'),
  ('luminaries', 'Luminaries', 'The Sun and Moon considered together as the two principal lights with especially strong and evident terrestrial indications.', 'planetary framework', 'draft', 'Part III chapter 4 contrasts the two luminaries with the other planets and emphasizes their rays and proximity/size.'),
  ('ebb-and-flow', 'Ebb and Flow of the Tide', 'The recurring advance and retreat of seawater that Abū Maʿshar attributes chiefly to the Moon under specific physical and astronomical conditions.', 'lunar natural indication', 'draft', 'Part III chapters 4-8 give an unusually extended natural-philosophical treatment. Preserve as a historical astrological-natural doctrine, not as a modern scientific claim.'),
  ('critical-days', 'Critical Days', 'Known days in the progress of illness judged from the Moon reaching specified angular relationships to its earlier position.', 'medical astrology', 'draft', 'Part III chapter 9 connects the Moon’s daily motion and aspects to known critical days of patients. Detailed medical doctrine is not developed here.');

-- Chapter 1: seven planets versus fixed stars and general/particular indication.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '224', '231', 'Part III', 'Chapter 1', '1.1-1.8',
       'Why the seven swift-moving planets are used for general indications; contrast with fixed stars', NULL,
       'The seven planets are associated with swift-changing general conditions, while fixed stars are associated with slower and more particular indications.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes the seven planets from the fixed stars by the speed and variety of their motions and conditions. Because the seven change more rapidly through direct motion, station, retrogradation, ascent, descent, easternness, and westernness, he assigns them a broader role in indicating swift-changing general conditions and beginnings of actions.',
       'Part III, Chapter 1, §§1.4-1.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='seven-planets' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Part III sharpens the contrast already introduced in Part II: fixed stars, because of their much slower and more uniform motion, are assigned indications for more particular things that are slow in coming-to-be and passing-away.',
       'Part III, Chapter 1, §§1.5-1.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-stars' AND w.slug='abu-mashar-great-introduction';

-- Chapter 2: explicit definitions and epistemic limits of the art.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '232', '243', 'Part III', 'Chapter 2', '2.1-2.14',
       'Definition of astrology and astrologer; knowable, hidden, and difficult indications; scope and aim of the art', NULL,
       'Important methodological chapter. It explicitly limits practical astrology to indications and signified matters that can be known sufficiently for judgment.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar defines astrology as knowledge of what the powers of stellar motions at a specified time indicate for that time and for a specified future time. He explicitly distinguishes the indication from the event indicated, using ordinary signs such as smoke indicating fire as analogies.',
       'Part III, Chapter 2, §§2.2-2.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrology' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The astrologer is the person who knows the conditions of the stars and their indications and reports, from a specified time, what they signify for that time or for a specified future time.',
       'Part III, Chapter 2, §2.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrologer' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes indications that are sufficiently evident to be known and used in judgment from indications whose signified quantity, quality, or exact particularity cannot practically be determined. The art deliberately works with the knowable class rather than claiming exhaustive access to every stellar indication.',
       'Part III, Chapter 2, §§2.7-2.13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='obvious-indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Some stellar indications are described as subtle, distant, and hidden. Abū Maʿshar does not say that they do not exist; rather, human knowledge may fail to comprehend either the indication itself or the exact quantity and quality of what it signifies, and such matters are not required for the practical art of judgments.',
       'Part III, Chapter 2, §§2.7-2.13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hidden-indication' AND w.slug='abu-mashar-great-introduction';

-- Chapter 3: solar moderation and planetary participation.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '244', '261', 'Part III', 'Chapter 3', '3.1-3.16',
       'The Sun as principal moderator of atmospheric and natural composition, with planetary participation', NULL,
       'The chapter argues for solar and planetary action in seasonal and natural composition; later years differ because planets participate with the Sun.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar assigns the Sun a principal role in moderating atmospheric conditions and natural composition, but explicitly says the planets share with it. The Sun structures the seasonal cycle, while differences from one year to another arise through the varying conjunctions and conditions of the other planets with it.',
       'Part III, Chapter 3, §§3.4-3.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-power' AND w.slug='abu-mashar-great-introduction';

-- Chapters 4-8: luminaries, lunar tides, natural and accidental criteria.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '262', '333', 'Part III', 'Chapters 4-8', '4.1-8.15',
       'Sun and Moon as luminaries; lunar causation of ebb and flow; strength, timing, local variation, and solar/wind modification', NULL,
       'Large historical natural-philosophical digression. Extract the central astrological concepts without turning every maritime condition into a separate lexicon term.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The Sun and Moon are treated as the two luminaries whose terrestrial indications are especially strong and visible. Abū Maʿshar attributes this partly to their size or proximity and partly to their rays, and says they convey planetary natures into the elemental world.',
       'Part III, Chapter 4, §§4.2-4.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='luminaries' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar attributes the flow of the tide chiefly to lunar action on seawater, while the ebb is described as the water returning by its own nature after the lunar impulse reaches its limit. He modifies this basic account by local geography, water density and salinity, winds, lunar phase, lunar distance and latitude, the Sun, and other planetary conditions.',
       'Part III, Chapters 4-8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ebb-and-flow' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Waxing and waning are used as one of several lunar conditions affecting the strength and abundance of tidal flow. Conjunction and opposition are treated as periods of stronger flow, while the two quartiles correspond to weaker flow.',
       'Part III, Chapter 6, §§6.7-6.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='waxing' AND w.slug='abu-mashar-great-introduction';

-- Chapter 9: lunar increase/decrease and critical days.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '334', '343', 'Part III', 'Chapter 9', '9.1-9.11',
       'Moon’s increase and decrease of light in animals, plants, minerals, medicine, and weather; known critical days', NULL,
       'Historical medical and natural claims are preserved as Abū Maʿshar’s doctrine, not endorsed as modern science.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Chapter 9 extends waxing and waning beyond tidal doctrine. Abū Maʿshar associates the Moon’s increasing light and culmination with increased growth, moisture, and bodily or vegetative activity, and its decreasing light with decline or withdrawal. These are historical natural-astrological claims.',
       'Part III, Chapter 9, §§9.2-9.10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='waxing' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In medical astrology Abū Maʿshar calls certain days “known” or critical days. They are judged from the Moon’s daily motion and its reaching specified right/left sextile, quartile, and opposition relationships to its earlier place, and are used to assess changes in a patient’s condition.',
       'Part III, Chapter 9, §9.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='critical-days' AND w.slug='abu-mashar-great-introduction';

-- Relations discovered in Part III.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contrasts-with', 'Abū Maʿshar contrasts the seven swift-moving planets with the slow-moving fixed stars in both motion and scope of indication.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='seven-planets' AND b.slug='fixed-stars';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialization-of', 'Obvious indications are the practically knowable subset of stellar indications used in astrological judgment.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='obvious-indication' AND b.slug='indication';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialization-of', 'Hidden or subtle indications are acknowledged as indications but fall outside what can reliably be comprehended for practical judgment.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='hidden-indication' AND b.slug='indication';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'associated-with', 'Abū Maʿshar treats waxing and waning as important modifying lunar conditions in tidal, medical, vegetative, and mineral indications.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='waxing' AND b.slug='luminaries';
