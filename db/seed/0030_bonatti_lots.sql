-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 8, Part 2: Projection of Parts and Their Significations.
-- Substantive text reviewed sequentially: PDF pp. 940-1001; bibliography begins p. 1002.
-- Only evidence-grade A/B material is retained. The many individual house and commodity
-- Part formulae remain searchable in the source corpus and are not promoted automatically.

-- Bonatti's Part of Things to Be is the same luminary counterpart already represented
-- canonically as Abū Maʿshar's Lot of Absence. Preserve Bonatti's own naming as aliases.
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part of Things to Be', 'English', 'source_name',
       'Bonatti’s principal name for the solar counterpart to the Part of Fortune in Treatise 8.2.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part of the Sun', 'English', 'source_name',
       'Bonatti also calls the Part of Things to Be the Part of the Sun.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part of the Moon', 'English', 'source_name',
       'Bonatti calls the Part of Fortune the Part of the Moon.'
FROM terms WHERE slug='lot-of-fortune';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Ascendant of the Moon', 'English', 'source_name',
       'Bonatti reports this as another name for the Part of Fortune.'
FROM terms WHERE slug='lot-of-fortune';

-- Bonatti explicitly allows up to four formal significators of a Part, extending the
-- earlier Abū Maʿshar short definition which mentioned only one to three.
UPDATE terms
SET short_definition='The planets formally involved in a lot through its formula, projection point, and the place where it falls; depending on overlap, a lot may have one, two, three, or four such significators.',
    editorial_notes='Abū Maʿshar gives one to three general indicators; Bonatti Treatise 8.2 Chapter 19 explicitly develops the scheme to one through four by distinguishing the two natural significators, the ruler of the place where the Part falls, and the ruler of the place from which projection begins.'
WHERE slug='general-indicators-of-a-lot';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 940, 949, 'Treatise 8.2: Parts', 'Chapters 1-3',
       'Definition and extraction of Parts; immovable and movable significators; three classes; planetary Parts; Part of Fortune and Part of Things to Be', NULL,
       'Primary theoretical block. Bonatti substantially paraphrases Abū Maʿshar but also elaborates the formal roles of the significators and the act of projection.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 949, 988, 'Treatise 8.2: Parts', 'Chapters 3-16',
       'Parts grouped under the twelve houses and the ten additional Parts of the fifth section; includes the Part of the Hilaj and general rules for their use', NULL,
       'Reviewed sequentially. Most individual formulae are catalogue material and are not promoted as separate lexicon entries under the A/B/C rule.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, 989, 1001, 'Treatise 8.2: Parts', 'Chapters 17-19 and royal Parts',
       'Extraordinary commodity Parts; price versus abundance doctrine; timing and region; number and hierarchy of Part significators; Parts concerning kings and empires', NULL,
       'The commodity formula catalogue was reviewed but not exploded into standalone terms. Chapter 19 contains the strongest reusable interpretive doctrine in this block.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines a Part through two natural significators that share the matter being judged and a third, movable significator from which their zodiacal interval is projected. The first two are called immovable because the measured relationship belongs to them; the third is movable because the ascendant or another relevant projection point changes with the figure.',
       'Treatise 8.2, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The extraction procedure measures the equal-degree longitude between the two natural significators, adds that interval to the ascendant or another appropriate projection point, and locates the Part where the count ends. Bonatti stresses equal zodiacal degrees rather than ascensional degrees and allows the projection point to vary with the subject of the Part.',
       'Treatise 8.2, Chapters 1-3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-extraction' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the projection point the movable significator. It is ordinarily the ascendant, but another house cusp or relevant place may serve when the Part belongs specifically to that matter. Its mobility distinguishes it from the two natural significators whose distance supplies the interval being projected.',
       'Treatise 8.2, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='movable-indicator' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti presents the seven planetary Parts as the first principal class of Parts and gives precedence to the two luminary Parts before the remaining five. Their formulas derive a planetary topic from the relation between the planet and one of the luminary Parts, with the Part of Fortune and the Part of Things to Be supplying the basic luminary framework.',
       'Treatise 8.2, Chapter 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-lots' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the Part of Fortune as the foremost Part. It is projected from Sun to Moon by day and Moon to Sun by night from the ascendant; he calls it the Part of the Moon and the Ascendant of the Moon, and assigns it broad bodily, material, fortunate and reputational significations.',
       'Treatise 8.2, Chapter 2, Part of Fortune', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-fortune' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti names Fortune’s reverse luminary counterpart the Part of Things to Be or Part of the Sun. It is projected Moon-to-Sun by day and Sun-to-Moon by night from the ascendant, and he associates it especially with the soul, religion, intentions, secrets, hidden or absent matters, beginnings and annual revolutions.',
       'Treatise 8.2, Chapter 2, Part of Things to Be', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-absence' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti’s Part of the Hilaj is measured from the prenatal conjunction or opposition to the Moon and projected from the ascendant. He insists that it is distinct from the hilaj itself even though it is directed and profected in a comparable way, and assigns it its own life-related predictive efficacy.',
       'Treatise 8.2, Chapters 4 and 16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-the-haylaj' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes up to four formal significators of a Part: the two planets or points from which its interval is taken, the ruler of the sign in which the Part falls, and the ruler of the place from which projection begins. Overlap among these roles can reduce the effective number to one, two, or three. The ruler of the Part’s domicile is normally the most authoritative, and the Part is stronger when its relevant significators aspect it and are free from impediment.',
       'Treatise 8.2, Chapter 19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='general-indicators-of-a-lot' AND w.slug='bonatti-liber-astronomiae';

-- Link interpretations to the smallest useful primary blocks.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('lot','lot-extraction','movable-indicator','planetary-lots','lot-of-fortune','lot-of-absence')
  AND sp.book='Treatise 8.2: Parts'
  AND sp.chapter='Chapters 1-3'
  AND NOT EXISTS (
    SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id
  );

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='lot-of-the-haylaj'
  AND sp.book='Treatise 8.2: Parts'
  AND sp.chapter='Chapters 3-16'
  AND NOT EXISTS (
    SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id
  );

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='general-indicators-of-a-lot'
  AND sp.book='Treatise 8.2: Parts'
  AND sp.chapter='Chapters 17-19 and royal Parts'
  AND NOT EXISTS (
    SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id
  );