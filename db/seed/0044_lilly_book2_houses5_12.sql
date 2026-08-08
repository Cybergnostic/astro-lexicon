-- Sequential extraction of William Lilly, Christian Astrology, Book II.
-- Fifth through Twelfth Houses and closing planetary-hour material.
-- Substantive text reviewed sequentially from PDF pp. 245-509.
-- Only definition-level or substantively explanatory evidence is promoted.
-- Medical, sexual, theft-location, imprisonment, witchcraft-remedy, battle and siege recipes
-- were reviewed as historical source material but are not reproduced as operational lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('decumbiture', 'Decumbiture', 'The astrologically recorded beginning of an illness, ideally taken from the time when the sick person first becomes sufficiently ill to take to bed; substitute observation times may be used when that moment is unknown.', 'medical astrology', 'draft', 'Historical medical-astrology term only; not modern medical diagnosis or advice. Lilly gives a hierarchy of acceptable moments when the exact onset is unavailable.'),
  ('medical-crisis', 'Crisis', 'In historical medical astrology, a decisive alteration in an illness understood as a contest between the body’s natural powers and the infirmity, tending toward recovery or further sickness.', 'medical astrology', 'draft', 'Lilly directly defines crisis in Book II. Preserve as historical doctrine only and do not use it as medical advice.'),
  ('planetary-hour', 'Planetary Hour', 'One of the twelve unequal divisions of daylight or of night, assigned successively to the seven planets beginning with the ruler of the weekday at sunrise.', 'time lordship', 'draft', 'Lilly calls these astrological or unequal hours; their clock duration varies seasonally because daylight and night are each divided separately into twelve parts.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Astrological Hour', 'English', 'source-name', 'Lilly’s name for the unequal planetary hour.' FROM terms WHERE slug='planetary-hour';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Unequal Hour', 'English', 'source-name', 'An astrological hour varies in clock length with the season.' FROM terms WHERE slug='planetary-hour';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Decretory Day', 'English', 'source-variant', 'Lilly uses this among the historical names connected with critical days.' FROM terms WHERE slug='critical-days';

-- Fifth and Sixth Houses: children, messengers, sickness, servants and critical days.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '245', '320', 'Book II', 'Fifth and Sixth Houses, Chapters XXXIX-XLVIII',
       'Children and messengers; sickness and decumbiture; historical crisis and critical-day doctrine; servants and small cattle', NULL,
       'Reviewed sequentially. Fertility, diagnosis, prognosis and treatment recipes remain historical source material and are not promoted as actionable guidance.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly treats the proper decumbiture as the moment when the patient first becomes so ill that he or she takes to bed. When that exact moment cannot be known, he allows substitute moments in a hierarchy, especially the first presentation of the patient’s urine for judgment or the physician’s first access to the case. The doctrine belongs to historical medical astrology.',
       'Book II, Sixth House, opening doctrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='decumbiture' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines a crisis as a decisive contest between nature and the infirmity and as a sudden alteration tending either toward recovery or toward further sickness. He connects the term with critical or decretory days. This is recorded as historical medical doctrine, not clinical guidance.',
       'Book II, Sixth House, crisis doctrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='medical-crisis' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly rejects treating the nominal seventh, fourteenth, twenty-first and similar calendar days as automatically exact critical days. He instead measures the Moon’s actual motion from its place at the beginning of the illness, because its daily speed varies. Intermediate lunar configurations can mark lesser or indicative changes, while the principal crisis is tied to the relevant angular distances from the initial lunar place.',
       'Book II, Sixth House, critical-day chapters', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='critical-days' AND w.slug='lilly-christian-astrology';

-- Seventh House: marriage, open enemies, contracts, fugitives, theft, lawsuits and warfare.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '320', '426', 'Book II', 'Seventh House, Chapters XLIX-LXVI',
       'Marriage and partnership; lost things and theft; lawsuits; open enemies; war and siege examples', NULL,
       'Reviewed sequentially. Explicit sexual material and operational theft, combat, siege and war recipes were not promoted. The section is retained chiefly for source-specific technical qualifications and applications of already-defined horary mechanisms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

-- Lilly gives a second, conflicting set of solar-distance thresholds in the Seventh-House aphorisms.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the Seventh-House preliminary aphorisms Lilly gives a narrower under-the-beams threshold of twelve degrees from the Sun. This conflicts with his Book I glossary, where he gives seventeen degrees. The discrepancy is preserved rather than silently harmonized.',
       'Book II, Seventh House, preliminary aphorisms', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the Seventh-House preliminary aphorisms Lilly gives sixteen minutes as the cazimi threshold. This differs slightly from the seventeen-minute threshold stated in his Book I glossary and should be treated as an internal source inconsistency.',
       'Book II, Seventh House, preliminary aphorisms', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology';

-- Eighth through Twelfth Houses.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '427', '496', 'Book II', 'Eighth through Twelfth Houses, Chapters LXVII-XCVI',
       'Eighth-house death and spouse-property questions; ninth-house journeys, religion and dreams; tenth-house office and profession; eleventh-house hope and friends; twelfth-house imprisonment, captives and witchcraft', NULL,
       'Reviewed sequentially. Death, medical, imprisonment, occult-remedy and military material is represented only at a non-actionable historical level. Long topical rule catalogues were not converted into lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

-- Closing Book II: planetary-hour tables and definition.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '497', '509', 'Book II', 'Chapter XCVII and conclusion',
       'Planetary-hour tables; unequal astrological hours; weekday rulers; conclusion of Book II', NULL,
       'Pages 497-504 are mainly tables. Chapter XCVII on pp. 505-508 explains their use and defines the unequal planetary hour. Page 509 closes Book II; p. 510 begins a modern appendix.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly divides the interval from sunrise to sunset into twelve equal daylight portions and the interval from sunset to the next sunrise into twelve equal night portions. Because those two intervals change seasonally, an astrological hour is normally longer or shorter than sixty clock minutes. The first hour after sunrise belongs to the ruler of the weekday, after which rulership follows the repeating planetary sequence.',
       'Book II, Chapter XCVII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-hour' AND w.slug='lilly-christian-astrology';

-- Primary citation links.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('decumbiture','medical-crisis','critical-days')
  AND sp.book='Book II' AND sp.chapter='Fifth and Sixth Houses, Chapters XXXIX-XLVIII';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('under-the-rays','cazimi')
  AND sp.book='Book II' AND sp.chapter='Seventh House, Chapters XLIX-LXVI';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug='planetary-hour'
  AND sp.book='Book II' AND sp.chapter='Chapter XCVII and conclusion';
