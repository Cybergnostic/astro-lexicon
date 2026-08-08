-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 5, the 146 Considerations (substantive text PDF pp. 569-615).
-- Only definition-level or substantively explanatory evidence is retained.
-- Repeated aphorisms, long natal catalogues, biographical anecdotes, and mere mentions are not promoted into separate lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('rooted-question', 'Rooted Question', 'A horary question whose chart shows concordance between the Ascendant and the planetary lord of the hour, indicating that the question is genuinely grounded in the querent\'s intention.', 'horary astrology', 'draft', 'Bonatti also treats an Ascendant at the extreme end or beginning of a sign as evidence that the question may not be rooted. Preserve this as Bonatti\'s source-specific radicality doctrine rather than assuming later authors use identical criteria.'),
  ('own-light', 'Own Light', 'A sect-based condition in which a diurnal planet is above the earth by day and below it by night, while a nocturnal planet is above the earth by night and below it by day.', 'planetary condition', 'draft', 'Bonatti explicitly defines this condition in the 47th Consideration. The translator identifies the condition with halb, while Bonatti elsewhere distinguishes “own light” from haym; do not silently collapse these terms.'),
  ('planetary-impediment', 'Planetary Impediment', 'An affliction in which a malefic reaches a significator with its rays within the operative orb, constraining or obstructing what that significator promises until the contact has separated.', 'planetary condition', 'draft', 'Bonatti gives a specific separation threshold and distinguishes actual impediment from residual fear after separation.'),
  ('fixed-star-gift', 'Gift of a Fixed Star', 'An extraordinary elevation, fortune, or distinction attributed to a fixed star, potentially greater in scale than ordinary planetary gifts but usually less durable in human subjects.', 'fixed stars', 'draft', 'Bonatti explains the short duration through a mismatch between the extremely slow timescale of fixed stars and the rapid changeability of human life. This is a source-specific doctrine, not a generic modern rule.'),
  ('participator-of-question', 'Participator of a Question', 'A supplementary planetary ruler derived by projecting measured distances between key significators from the Ascendant, used to modify the principal judgment of a horary question.', 'horary astrology', 'draft', 'Bonatti derives first, second, and third participators in the 146th Consideration and prefers the strongest or repeatedly indicated planet. This is a specialized source procedure.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Radical Question', 'English', 'later-equivalent', 'Common later English wording for a rooted horary question; equivalence should remain source-aware.' FROM terms WHERE slug='rooted-question';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'In Its Own Light', 'English', 'source-phrase', 'Bonatti\'s wording for the sect-based condition defined in Consideration 47.' FROM terms WHERE slug='own-light';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '569', '580', 'Treatise 5: 146 Considerations', 'Considerations 1-23',
       'Rooted questions; sixteen planetary operations; Moon and planetary impediments; reception, void course, own-light context, malefic/benefic modification, planetary impediment', NULL,
       'Dense definitional material. Repetitions of doctrines already established elsewhere are retained only where Bonatti adds operational criteria or boundaries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '581', '598', 'Treatise 5: 146 Considerations', 'Considerations 24-102',
       'Stations and retrogradation; sign-change before perfection; peregrination; own light; solar conditions; angularity; modality; transfer of light; fixed-star helpers and harmers', NULL,
       'Large parts are aphoristic applications rather than standalone definitions. Only reusable technical doctrine is extracted.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '599', '615', 'Treatise 5: 146 Considerations', 'Considerations 103-146',
       'Fixed-star gifts, hierarchy of planetary gifts, fourteen-step judgment method, supplementary participators of a question', NULL,
       'Long natal delineation catalogues and anecdotal examples were reviewed but not converted into weak lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats a question as rooted when the Lord of the Ascendant and the Lord of the planetary hour are the same, or when their signs agree by triplicity or complexion. If this concordance is absent, or the Ascendant lies at the extreme boundary of a sign, he warns that the question may not arise from a genuine settled intention.',
       'Treatise 5, Considerations 7 and 143', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='rooted-question' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines a planet in its own light by sect and hemisphere: a diurnal planet above the earth by day and below it by night, and a nocturnal planet above the earth by night and below it by day. A significator contrary to this condition is weakened. Bonatti elsewhere mentions haym separately, so the two should not be treated as automatically identical.',
       'Treatise 5, Considerations 44, 46-47', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='own-light' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For Bonatti, a significator becomes impeded when a malefic reaches it by ray within the operative orb. He follows Sahl in treating the malefic contact as obstructive, but argues that once the malefic has passed the significator by one minute the actual impediment has ended, although fear or anxiety can remain; by one full degree it is fully safe from the malefic\'s action.',
       'Treatise 5, Considerations 16 and 18', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-impediment' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes fixed-star gifts from planetary gifts by scale and durability. Fixed stars can raise a person suddenly to extraordinary dignity or fortune, but because their motion is vastly slower than the human life cycle, the human subject is poorly proportioned to sustain the impression for long. The same fixed-star influence is more durable in long-lasting collective structures such as cities than in individual people.',
       'Treatise 5, Consideration 141', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-star-gift' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the final Consideration Bonatti derives supplementary participators by measuring zodiacal distances between selected lords, adding the Ascendant degree, and projecting the result from the Ascendant. He constructs three participators and gives greater authority to the strongest one or to a planet repeatedly produced by the calculations; their condition increases or decreases the good or evil shown by the principal judgment.',
       'Treatise 5, Consideration 146', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='participator-of-question' AND w.slug='bonatti-liber-astronomiae';

-- Existing canonical terms receive Bonatti-specific interpretations only where Treatise 5 adds real doctrinal content.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines the Moon as void in course when she is joined to none of the planets by body or aspect. He further distinguishes a feral or uncivilized Moon as void in course while also occupying a place in which she has no dignity, so void course and ferality are not synonymous.',
       'Treatise 5, Considerations 5, 19 and 62', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly treats reception as capable of reducing or even breaking malefic obstruction. In perfection doctrine, a malefic can still perfect a matter if it receives the applying significator, though typically with labor and difficulty; without reception its contact can prevent perfection or corrupt the result.',
       'Treatise 5, Considerations 11, 18, 20, 36 and 39', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explains transfer of light as a mode in which a third planet links significators that are not directly conjoined or aspecting. In horary judgment the matter is then perfected through an intermediary, and the house ruled by the transferring planet describes the kind of person or resource through which the mediation occurs.',
       'Treatise 5, Considerations 4, 98 and 143', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='translation-of-light' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti states that a planet within 16 minutes of the Sun is in the Sun\'s heart and is strengthened rather than weakened. This explicitly distinguishes cazimi from the broader condition of being under the Sun\'s rays.',
       'Treatise 5, Considerations 13 and 53', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines a planet as under the Sun\'s rays when its distance from the Sun is 12 degrees or less but more than 16 minutes. Between more than 12 and less than 15 degrees he describes it as going out from under the rays; the exact phasis and strength rules differ for superior and inferior planets.',
       'Treatise 5, Considerations 52-54', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines peregrination as a planet being in a place where it has none of its own dignities. He explicitly says a peregrine malefic becomes more harmful, while dignity restrains its malice to differing degrees.',
       'Treatise 5, Considerations 6, 40 and 55', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='peregrine' AND w.slug='bonatti-liber-astronomiae';
