-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 7, Elections (substantive text PDF pp. 749-899).
-- Only evidence-grade A/B material is retained. Particular election recipes,
-- correspondence catalogues, medical procedures, war procedures, and mere mentions
-- remain in the source corpus rather than being promoted into weak lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('election', 'Election', 'The deliberate choice of a fitting time to begin an intended action so that the celestial condition at the inception supports the action and reduces contrary indications.', 'electional astrology', 'draft', 'Bonatti explicitly distinguishes choosing a favorable beginning from causing the action itself: the election assists an intended act rather than creating it.'),
  ('root-of-election', 'Root of an Election', 'The prior astrological foundation, principally a nativity or a horary question, against which an election is judged and to which the elected beginning should be made congruent.', 'electional astrology', 'draft', 'Bonatti prefers elections rooted in a nativity or question, but allows an election without either when necessity requires it; such an election is less securely grounded.'),
  ('electional-adaptation', 'Electional Adaptation', 'The deliberate strengthening, freeing from impediment, and appropriate placement of a sign, planet, or significator so that it is fit for the purpose of an election.', 'electional astrology', 'draft', 'Bonatti distinguishes adapting signs from adapting planets and repeatedly states that not every factor can be perfected at once; the astrologer should adapt the most important factors that can actually be adapted.'),
  ('inception', 'Inception', 'The operative beginning of an undertaking: the first intrinsic act by which the intended work itself begins, rather than an earlier preparation for it.', 'electional astrology', 'draft', 'Bonatti treats the exact inception as the moment to which the election belongs. For a building, for example, the relevant beginning is the first act of construction rather than preliminary planning.'),
  ('electional-timing', 'Electional Timing', 'The estimation of speed, delay, duration, or completion of an elected matter from the motion and condition of significators, the nature of signs and houses, and the distance between applying significators.', 'electional astrology', 'draft', 'Bonatti makes timing relative to the natural scale of the matter: the same degree count may signify hours, days, months, or years depending on what is being judged.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Electional Astrology', 'English', 'related-usage', 'Modern umbrella expression for the practice in which Bonatti defines an election as the deliberate selection of a beginning.' FROM terms WHERE slug='election';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '749', '803', 'Treatise 7: Elections', 'Part 1, general doctrine',
       'Definition and purpose of elections; roots of elections; adaptation of signs and planets; operative inception; hierarchy of significators; durability and timing; fixed, common, and movable signs', NULL,
       'Primary general-theory block. Particular examples are not promoted unless they add reusable technical doctrine.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '804', '851', 'Treatise 7: Elections', 'Part 2, houses 1-6',
       'Particular elections organized by the first through sixth houses', NULL,
       'Reviewed sequentially. Most material consists of specific election recipes rather than independent lexicon definitions.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '852', '899', 'Treatise 7: Elections', 'Part 2, houses 7-12',
       'Particular elections organized by the seventh through twelfth houses; bibliography begins on PDF p. 900', NULL,
       'Reviewed sequentially through the end of Bonatti’s substantive Treatise 7 text. Medical, military, pursuit, and other highly specific recipes are retained only in the source corpus.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines an election as a deliberate choice made after counsel and desire for a favorable outcome: the astrologer selects a fitting beginning for an action that the inceptor already intends to perform. He explicitly denies that the election itself produces the thing; rather, it helps the inceptor avoid an unsuitable time and choose a beginning more favorable to the intended action.',
       'Treatise 7, Part 1, opening chapters', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='election' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly calls the nativity or a properly grounded horary question the root from which an election should be judged. The elected chart should agree with and strengthen what the root permits. He nevertheless allows elections when neither nativity nor question is available, while treating them as less secure than elections grounded in a known root.',
       'Treatise 7, Part 1, roots and elections from nativities or questions', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='root-of-election' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'To adapt an election, Bonatti strengthens and makes fortunate the significators that support the intended matter, frees them from relevant impediments, places them in suitable signs and places, and when the purpose requires it weakens contrary significators. He distinguishes the adaptation of a sign from that of a planet and repeatedly warns that a perfect adaptation of every factor is normally impossible, so priority must be given to the principal significators.',
       'Treatise 7, Part 1, adaptation of signs, planets, and contrary significators', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='electional-adaptation' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti locates an election at the true inception of the work: the first act that belongs intrinsically to the undertaking itself. Preparatory acts do not constitute the elected beginning. The inception must therefore correspond to the kind of result sought and to the natural capacity of the matter to receive that result.',
       'Treatise 7, Part 1, doctrine of the beginning or inception', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='inception' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti judges speed and delay by combining several testimonies: faster or slower planetary motion, directness or retrogradation, modality, straight or crooked ascension, element, angularity, hemisphere and quarter, and the zodiacal distance between significators. Degrees between applying significators are converted into hours, days, months, or years according to the natural timescale of the matter rather than by a single universal conversion.',
       'Treatise 7, Part 1, Chapters 16-17', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='electional-timing' AND w.slug='bonatti-liber-astronomiae';

-- Link the retained interpretations to the general-theory source passage.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('election','root-of-election','electional-adaptation','inception','electional-timing')
  AND sp.book='Treatise 7: Elections'
  AND sp.chapter='Part 1, general doctrine'
  AND NOT EXISTS (
    SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id
  );
