-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 9, Part 3: Third House (siblings) and Fourth House (parents), PDF pp. 1101-1116.
-- Only evidence-grade A/B material is retained. Long predictive catalogues and disputed
-- translator reconstructions remain in the source corpus rather than being promoted.

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1101', '1108', 'Treatise 9: Nativities', 'Part 3, Third House',
       'Sibling doctrine: third sign, Part of Siblings, Mars, triplicity rulers, sibling sequence and condition', NULL,
       'Reviewed sequentially through the end of the Third House. Numerical sibling-counting and mortality recipes are retained only as source evidence unless they add reusable doctrine.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1108', '1116', 'Treatise 9: Nativities', 'Part 3, Fourth House',
       'Parental doctrine: fourth sign, Parts of Father and Mother, sect-dependent parental significators, directions, parental hyleg and kadkhuda', NULL,
       'Reviewed sequentially through the end of the Fourth House. Death-prediction procedures are treated as historical doctrine and are not promoted into separate operational entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

-- Bonatti gives a substantial topical use of triplicity rulership in the sibling doctrine.
-- This does not redefine triplicity itself; it extends the already-recorded temporal/topical
-- sequencing of the first, second and third rulers.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the sibling doctrine Bonatti uses the three rulers of the triplicity in a serial topical order: the first ruler signifies elder siblings, the second those in the middle, and the third younger siblings. Their respective condition describes the prosperity or adversity of the corresponding group. This is a topical application of the broader medieval practice of assigning successive phases or strata to the three triplicity rulers.',
       'Treatise 9, Part 3, Third House, Chapters 2 and 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

-- Bonatti extends the hyleg/kadkhuda framework analogically to the parents.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti applies hyleg doctrine beyond the native himself when judging a parent from the child''s nativity. For the father he tests sect-appropriate parental significators, the Part of the Father and the fourth-house degree as possible hyleg candidates, requiring suitable placement and testimony from dignity rulers before using the selected point as the root of the historical longevity judgment.',
       'Treatise 9, Part 3, Fourth House, Chapters 1 and 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='hyleg' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the parental longevity procedure Bonatti calls the qualified dignity ruler of the selected parental hyleg the al-kadukhadah, extending the same giver-of-years relationship used in the native''s own longevity doctrine. The exact candidate hierarchy varies with sect and with whether the Sun, Saturn, the parental Part or the parental house degree qualifies.',
       'Treatise 9, Part 3, Fourth House, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='kadkhuda' AND w.slug='bonatti-liber-astronomiae';

-- Source citations.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='triplicity-life-division'
  AND sp.book='Treatise 9: Nativities'
  AND sp.chapter='Part 3, Third House'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('hyleg','kadkhuda')
  AND sp.book='Treatise 9: Nativities'
  AND sp.chapter='Part 3, Fourth House'
  AND NOT EXISTS (SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id);
