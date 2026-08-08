-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Tenth and Eleventh Houses, compiled PDF pp. 1169-1191.
-- Only definition-level or substantively explanatory evidence is retained.
-- Long profession, rank, parental-longevity and friendship catalogues are not promoted wholesale.

-- TENTH HOUSE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1169', '1184', 'Treatise 9, Part 3', 'Tenth House, Chapters 1-3', 'Tenth House',
       'Profession, work, office, prosperity/rule, and the mother', NULL,
       'Bonatti gives a hierarchical procedure for selecting professional significators, then treats rank/prosperity and the mother. Translator notes distinguish several Latin occupational words, but those distinctions are not presented by Bonatti as separate technical doctrines.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the natal Tenth House Bonatti assigns profession, work, offices or duties, power/prosperity and rulership to the tenth, and also treats the mother there. For profession he does not rely on the tenth ruler alone: he first prefers planets occupying the Ascendant or Midheaven, then uses weaker angular alternatives, al-mubtazzes, lunar applications, heliacal emergence and other supporting testimonies, preferring the planet that collects several relevant conditions.',
       'Treatise 9, Part 3, Tenth House, Ch. 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly uses an al-mubtazz as a strongest or prevailing topical significator in professional and status judgments. Where several candidates exist, the planet combining the greater relevant dignity or several qualifying testimonies is preferred over a mere domicile ruler.',
       'Treatise 9, Part 3, Tenth House, Chs. 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='almuten' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For honors, rulership and the condition of the native’s work, Bonatti applies the three triplicity rulers of the Sun serially to the first, middle and final thirds of life. Their strength or weakness shows the relative condition of honor and prosperity in each period.',
       'Treatise 9, Part 3, Tenth House, Ch. 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly derives the mother from the tenth because the tenth is the seventh from the fourth, the house assigned to the father. This is a direct application of relative or derived-house reasoning rather than an isolated topical assignment.',
       'Treatise 9, Part 3, Tenth House, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='derived-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In judging the mother’s condition, Bonatti again uses three triplicity rulers serially: the first for the beginning, the second for the middle, and the third for the final part of her life as reckoned from the native’s birth.',
       'Treatise 9, Part 3, Tenth House, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

-- ELEVENTH HOUSE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1184', '1191', 'Treatise 9, Part 3', 'Eleventh House, Chapters 1-2', 'Eleventh House',
       'Friends, good fortune and hope; friendship taxonomy and comparison between nativities', NULL,
       'Bonatti gives a hierarchy of friendship significators and then a synastry-like account of friendship. The large planet-by-planet friend catalogues are not promoted as separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti assigns friends, good fortune and hope to the Eleventh House. His preferred sequence begins with the eleventh and its ruler, then planets in the eleventh, Venus, the Part of Friends and its ruler, and further supporting rulers and the sect luminary; the better-disposed or prevailing planet supplies the principal testimony.',
       'Treatise 9, Part 3, Eleventh House, Ch. 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In comparing two nativities for friendship, Bonatti says that a third planet can transfer light or virtue between the significators of the two charts. If that translating planet is well disposed, friendship may arise even without a direct configuration between the principal significators, though Bonatti describes such friendship as temporary rather than permanent.',
       'Treatise 9, Part 3, Eleventh House, Ch. 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='transfer-of-light' AND w.slug='bonatti-liber-astronomiae';

-- Citation links.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope LIKE 'Treatise 9, Part 3, Tenth House%'
  AND sp.section='Tenth House';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope LIKE 'Treatise 9, Part 3, Eleventh House%'
  AND sp.section='Eleventh House';
