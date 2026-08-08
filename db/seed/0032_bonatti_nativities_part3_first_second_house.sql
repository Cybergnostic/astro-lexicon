-- Sequential extraction of Guido Bonatti, Treatise 9: Nativities.
-- Part 3 opening, First House and Second House (PDF pp. 1047-1101).
-- Only evidence-grade A/B material is retained. Planet-by-planet character catalogues,
-- bodily-description catalogues, and repeated house applications are not promoted wholesale.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('significator-of-the-soul', 'Significator of the Qualities of the Soul', 'The planet chiefly governing the native’s rational and psychological qualities, determined from Mercury, the Moon, the rulers of their places, and the planet prevailing over those testimonies.', 'nativities', 'draft', 'Bonatti distinguishes rational qualities, principally signified through Mercury, from the sensible and vegetative faculties associated with the luminary of the sect; his full procedure combines several testimonies rather than using a single planet mechanically.'),
  ('significator-of-substance', 'Significator of Substance', 'The planet selected to signify the native’s wealth and material prosperity from a hierarchy of relevant lots, the second sign and its ruler, Jupiter, triplicity rulers, and related testimonies.', 'nativities', 'draft', 'Bonatti gives an unusually extended hierarchy. Do not reduce this to “ruler of the second house” alone.'),
  ('house-of-substance', 'House of Substance', 'The second sign from the Ascendant when judging the native’s substance, possessions and material acquisition.', 'houses', 'draft', 'Bonatti explicitly identifies the house of substance as the second sign from the Ascendant in this section; preserve the source’s sign-based wording.'),
  ('triplicity-life-thirds', 'Triplicity Lords of the Life Thirds', 'A timing doctrine in which the first, second and third rulers of a relevant triplicity govern successive first, middle and final thirds of life for the topic being judged.', 'time lords and natal timing', 'draft', 'Bonatti applies the structure to substance and to general condition. The topic determines which triplicity is used; do not universalize one set of rulers to every judgment.');

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1061', '1076', 'Treatise 9: Nativities', 'Part 3, First House, Chapters 1-8',
       'General and particular doctrine of the qualities of the soul: Mercury, sect luminary, rulers of the Moon and Mercury, planetary condition, modality and participation', NULL,
       'The long planet-by-planet character descriptions were reviewed but are not converted into separate lexicon entries. The reusable doctrine is the structure for selecting and modifying the significator of the soul.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1076', '1101', 'Treatise 9: Nativities', 'Part 3, Second House, Chapters 1-13',
       'Hierarchy of significators of substance; second sign as house of substance; timing by triplicity rulers; acquisition by house, planet and condition', NULL,
       'House-by-house and planet-by-planet acquisition catalogues were reviewed as applications. Retained doctrine concerns how the significator of substance is selected and timed.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti begins the judgment of the soul with Mercury for reason and intellect, while the luminary of the sect participates in sensible and vegetative qualities. He then requires six kinds of testimony: the condition of the Moon and Mercury, their signs, the rulers of those signs, planetary conjunctions, the peculiar nature of participating planets, and the angles and their rulers. The planet prevailing over the relevant places can act as the principal dispositor or significator of the soul.',
       'Treatise 9, Part 3, First House, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='significator-of-the-soul' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the judgment of substance Bonatti does not use a single universal significator. He begins with the Part of Fortune and the planet prevailing over its place, then considers the Part of Substance, the second sign and its ruler, Jupiter, the sect luminary, the rulers of relevant triplicities, the ruler of the Moon’s domicile, planets occupying the second, and further fallback testimonies. He explicitly ranks the Part of Fortune, Part of Substance, the second and its lord, and Jupiter among the principal indicators.',
       'Treatise 9, Part 3, Second House, Chapters 1 and 12-13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='significator-of-substance' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly defines the house of substance as the second sign from the Ascendant. In this natal section he repeatedly treats it as a sign-based place whose ruler, occupants, triplicity rulers and aspects contribute to judging wealth and acquisition.',
       'Treatise 9, Part 3, Second House, Chapters 1 and 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='house-of-substance' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For timing substance, Bonatti prefers the triplicity rulers of the house of substance: the first ruler signifies the first third of life, the second the middle third, and the third the final third. A ruler that is strong and fortunate promises greater prosperity in its allotted period; an impeded ruler signifies diminution in that same period. He also preserves a parallel tradition using the triplicity rulers of the sect luminary for general prosperity.',
       'Treatise 9, Part 3, Second House, Chapters 3, 7-10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-life-thirds' AND w.slug='bonatti-liber-astronomiae';

-- Bonatti gives a useful source-level refinement of the existing mubtazz concept.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly uses al-mubtazz in a topic-specific sense: the planet prevailing by dignity and strength over a relevant degree or group of testimonies, such as the places of the Moon and Mercury for character or the Part of Fortune for substance. His procedure shows that the mubtazz may be local to a topic rather than a single universal ruler of the whole nativity.',
       'Treatise 9, Part 3, First and Second Houses', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='mubtazz' AND w.slug='bonatti-liber-astronomiae';

-- Link interpretations to their primary source blocks.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='significator-of-the-soul'
  AND sp.book='Treatise 9: Nativities'
  AND sp.chapter='Part 3, First House, Chapters 1-8'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('significator-of-substance','house-of-substance','triplicity-life-thirds','mubtazz')
  AND sp.book='Treatise 9: Nativities'
  AND sp.chapter='Part 3, Second House, Chapters 1-13'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);
