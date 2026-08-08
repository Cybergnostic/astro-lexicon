-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Fifth House (children) and Sixth House (servants, small animals,
-- infirmities/diseases and impediments), compiled PDF pp. 1116-1136.
-- Only definition-level or substantively explanatory evidence is retained.
-- Historical medical doctrines are recorded descriptively, not as medical advice or prediction.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('infirmity', 'Infirmity', 'In Bonatti’s medical-astrological vocabulary, a bodily weakness or adverse condition that can arise and then pass away.', 'medical astrology', 'draft', 'Keep distinct from Bonatti’s disease and bodily impediment. This is a historical technical distinction, not modern medical terminology.'),
  ('disease', 'Disease', 'In Bonatti’s medical-astrological vocabulary, a bodily infirmity or adverse condition that arises and does not pass away.', 'medical astrology', 'draft', 'Bonatti explicitly contrasts disease with infirmity by persistence. Historical doctrine only; do not map automatically onto modern diagnoses.'),
  ('bodily-impediment', 'Bodily Impediment', 'A bodily injury or impairment treated as a discrete event rather than a continuing or recurring infirmity.', 'medical astrology', 'draft', 'Bonatti distinguishes impediments from infirmities and disease. The terminology is historical and should not be used as modern clinical classification.'),
  ('infirmity-of-soul', 'Infirmity of the Soul', 'A historical category for disturbances or disordered states of the soul, which Bonatti distinguishes from bodily infirmity and from impediments of the soul.', 'psychological and medical astrology', 'draft', 'Preserve as a medieval philosophical-astrological category. Do not equate with modern psychiatric diagnosis.'),
  ('impediment-of-soul', 'Impediment of the Soul', 'A comparatively persistent excess or deficiency in a quality of the soul, distinguished by Bonatti from more transient emotional disturbances.', 'psychological and medical astrology', 'draft', 'Historical philosophical-astrological category. Translator commentary supplies much of the Aristotelian contextualization; the canonical definition should stay close to Bonatti’s own contrast.')
;

-- FIFTH HOUSE: children and timing by triplicity rulers
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1116', '1121', 'Treatise 9, Part 3', 'Fifth House, Chapters 1-4', 'Fifth House',
       'Children: significators, abundance/scarcity, timing and condition', NULL,
       'Bonatti reviews multiple child-signification rules. The reusable doctrinal item retained here is the serial timing use of triplicity rulers; the large fertility/sterility catalogue is not promoted into many separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the Fifth House doctrine Bonatti applies serial triplicity rulership to the timing of children: in one formulation the first triplicity ruler of Jupiter signifies children in youth, the second in middle age, and the third in old age. This extends the broader practice of assigning successive rulers to successive phases of life.',
       'Treatise 9, Part 3, Fifth House, Ch. 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';

-- SIXTH HOUSE: core terminology
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1124', '1128', 'Treatise 9, Part 3', 'Sixth House, Chapters 3-5', 'Sixth House',
       'Definitions of infirmity, disease and bodily impediment', NULL,
       'Bonatti explicitly distinguishes temporary/recurring infirmity, persistent disease, and one-time bodily impediment. Detailed disease catalogues and body-part correspondences are not promoted.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines an infirmity as an accident or weakness of the body that comes and subsequently goes away. He therefore treats it as distinct from a disease, which persists.',
       'Treatise 9, Part 3, Sixth House, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='infirmity' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines disease by contrast with infirmity: it is a bodily infirmity or accident that arises and does not go away.',
       'Treatise 9, Part 3, Sixth House, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='disease' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Later in the Sixth House Bonatti distinguishes bodily impediments from infirmities: impediments are discrete injuries or impairments whose pains do not endure, whereas infirmities persist or recur; this adds a third category alongside the still more persistent disease defined earlier.',
       'Treatise 9, Part 3, Sixth House, Chs. 3-5', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='bodily-impediment' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1132', '1135', 'Treatise 9, Part 3', 'Sixth House, Chapter 7', 'Sixth House',
       'Infirmities and impediments of the soul', NULL,
       'Historical philosophical/astrological psychology. Explicitly do not equate these medieval categories with modern psychiatric diagnoses. Sex and morality catalogues later in the chapter are not promoted.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes infirmities of the soul from bodily infirmity and from impediments of the soul. He treats some soul-infirmities as fundamental evaluative states that are difficult to change, while other emotional disturbances are more transient and more readily removed.',
       'Treatise 9, Part 3, Sixth House, Ch. 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='infirmity-of-soul' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes impediments of the soul as enduring excesses or deficiencies in qualities that ought to remain in a mean or proper measure. He distinguishes them from more transient emotional disturbances and says they are difficult to remove.',
       'Treatise 9, Part 3, Sixth House, Ch. 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='impediment-of-soul' AND w.slug='bonatti-liber-astronomiae';

-- Citation links for the interpretations created above.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='triplicity-life-division'
  AND i.scope='Treatise 9, Part 3, Fifth House, Ch. 2'
  AND sp.section='Fifth House';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('infirmity','disease','bodily-impediment')
  AND sp.locator_text='Definitions of infirmity, disease and bodily impediment';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('infirmity-of-soul','impediment-of-soul')
  AND sp.locator_text='Infirmities and impediments of the soul';
