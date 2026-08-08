-- Sequential extraction of William Lilly, Christian Astrology, Book II.
-- Reviewed sequentially from PDF pp. 152-244: First through Fourth House questions.
-- Only definition-level or substantively explanatory evidence is retained.
-- Long judgment catalogues, worked examples, medical/death recipes and topical lists remain searchable but are not promoted wholesale.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('horary-question-time', 'Time of the Horary Question', 'The moment accepted as the root time for erecting a horary figure, defined by Lilly as the moment the astrologer actually receives and understands the querent’s question or intention.', 'horary doctrine', 'draft', 'Lilly rejects simply using the querent’s arrival or first greeting. For a letter, he uses the moment he opens it and understands the request; for his own question, the moment his mind becomes genuinely engaged with the matter.'),
  ('short-journey', 'Short Journey', 'A journey treated as belonging to the third house, defined by Lilly as roughly twenty to forty miles or far enough to go and return the same day or the next.', 'house doctrine', 'draft', 'A source-specific practical definition of the third-house journey category. Do not universalize the mileage across all authors.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Receiving the Question', 'English', 'source-phrase', 'Lilly’s discussion concerns the proper time of receiving a horary question.' FROM terms WHERE slug='horary-question-time';

-- FIRST HOUSE: general horary practice, Part of Fortune, radical examples, ships, question timing.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 152, 189, 'Book II', 'Chapters XXII-XXVI',
       'First House questions; Part of Fortune; modes of judgment; ships; proper time of receiving a question', NULL,
       'Reviewed sequentially. Death and medical claims are retained only as historical context and are not promoted as operational public guidance.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calculates the Part of Fortune from the Sun-to-Moon distance added to the Ascendant and explicitly says he uses the same procedure by day and by night. He notes that some reverse the luminaries at night, but says the practitioners of his day follow the unreversed method. This differs materially from authors who reverse the formula by sect.',
       'Book II, Chapter XXIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-fortune' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly takes the true time of a horary question to be the moment when the querent actually states the request and the astrologer understands the intention, not merely the time of arrival or greeting. For a written question, he uses the moment he opens and understands it; for a question concerning himself, he allows the moment his own mind becomes seriously engaged with the matter, provided he judges without partiality.',
       'Book II, end of Chapter XXVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='horary-question-time' AND w.slug='lilly-christian-astrology';

-- SECOND HOUSE: substance, perfection, impediment and the destructive planet.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 190, 210, 'Book II', 'Chapters XXVII-XXVIII',
       'Second House questions concerning substance; sources of wealth; timing; impediment; destroyer/abscissor; continuity of substance', NULL,
       'The many house-by-house sources of income are applications rather than separate lexical entries. Lilly’s general doctrine of the impeding planet is retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calls the planet that prevents an otherwise promising matter a hurtful planet, destroyer, obstructor or abscissor. He identifies it through the chain of application from the querent’s significator, the Moon, or the significator of the matter, and treats peregrination, retrogradation, combustion, cadency, fall or detriment as conditions that can make such a planet destructive. Reception can rescue the matter in some configurations, while an effective cutting-off of the harmful light can remove the prohibition.',
       'Book II, Chapter XXVIII, planet impeding the matter', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='abscissor' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In Book II Lilly repeatedly treats reception as a modifier of perfection rather than a simple yes-or-no dignity relation. An afflicted receiver may fail to perfect the matter, while reception through a well-disposed planet can permit perfection even through difficult aspects; by contrast, favorable applying sextiles or trines can perfect without reception when the receiving planet is sound.',
       'Book II, Chapters XXVII-XXVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='lilly-christian-astrology';

-- THIRD HOUSE: derived houses, reports and short journeys.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 210, 225, 'Book II', 'Chapters XXIX-XXXI',
       'Third House questions concerning siblings, absent persons, reports, counsel and short journeys; explicit derived-house procedure', NULL,
       'Worked war-rumour examples are reviewed as historical applications, not promoted as political or predictive rules.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly restates derived-house doctrine as a general key to judging absent relatives and other persons: the house naturally signifying the person becomes that person’s temporary first house, and the following houses become that person’s second, third, fourth, and so on. He explicitly says the method can be varied for fathers, children, servants and other quesited persons.',
       'Book II, Third House, absent brother', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='derived-house' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines a short journey as approximately twenty, thirty or forty miles, or more generally a distance from which the traveller can go and return in the same day or by the next day. He assigns this category to the third house.',
       'Book II, Third House, short journeys', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='short-journey' AND w.slug='lilly-christian-astrology';

-- FOURTH HOUSE: property, land, houses and the end of the matter.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 225, 244, 'Book II', 'Chapters XXXII-XXXVIII',
       'Fourth House questions concerning hidden or misplaced things, land and houses, buying and leasing, inheritance, removal, waterworks and hidden treasure', NULL,
       'Most material is topical application. The structurally reusable house assignments and perfection mechanisms are already represented elsewhere.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

-- Link interpretations to the reviewed source blocks.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('lot-of-fortune','horary-question-time')
  AND sp.book='Book II' AND sp.page_start=152
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('abscissor','reception')
  AND sp.book='Book II' AND sp.page_start=190
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('derived-house','short-journey')
  AND sp.book='Book II' AND sp.page_start=210
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);
