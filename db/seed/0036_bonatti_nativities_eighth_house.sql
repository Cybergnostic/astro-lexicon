-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Eighth House, compiled PDF pp. 1151-1158.
-- Only definition-level or substantively explanatory evidence is retained.
-- Detailed mortality recipes are not promoted into the public lexicon; the material is preserved only as historical doctrine.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('eighth-house', 'Eighth House', 'In Bonatti’s natal doctrine, the eighth house is principally the house of death.', 'houses', 'draft', 'Keep this as a traditional house meaning. Bonatti’s detailed rules for predicting the manner or timing of death are not part of the public definition.')
;

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT t.id, 'House of Death', 'en', 'source wording', 'Bonatti, Treatise 9, Part 3, Eighth House'
FROM terms t
WHERE t.slug='eighth-house';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1151', '1158', 'Treatise 9, Part 3', 'Eighth House, Chapter 1', 'Eighth House',
       'Eighth house as the house of death and the broader mortality-significator framework', NULL,
       'Bonatti explicitly calls the eighth the house of death, but his judgment is broader than the eighth alone: he also considers the Ascendant and its lord, the hyleg and its directions, the Part of Death, the eighth sign and lord, planets in or aspecting it, triplicity rulers of the fourth, and a sect-dependent eighth-from-the-luminary condition. Detailed lists of causes, violent-death scenarios, injuries, poisons, weapons, animals and similar outcomes are intentionally not promoted into lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly identifies the eighth as the house of death. He does not reduce mortality judgment to the eighth or its ruler alone, but places them within a larger hierarchy of significators that includes the hyleg and its directions, the Part of Death, planets connected with the eighth, and additional supporting testimonies.',
       'Treatise 9, Part 3, Eighth House, Ch. 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='eighth-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='eighth-house'
  AND i.scope='Treatise 9, Part 3, Eighth House, Ch. 1'
  AND sp.locator_text='Eighth house as the house of death and the broader mortality-significator framework';
