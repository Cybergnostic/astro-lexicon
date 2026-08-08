-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Seventh House, compiled PDF pp. 1136-1151.
-- Only definition-level or substantively explanatory evidence is retained.
-- Detailed sexual, marital, enemy and biographical catalogues are treated as applications rather than standalone lexicon terms.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('seventh-house', 'Seventh House', 'In Bonatti’s natal doctrine, the seventh house principally signifies marriage, partners or participants, and enemies who oppose the native openly.', 'houses', 'draft', 'Traditional topical meaning from Treatise 9. Keep distinct from later modern extensions of the seventh house.')
;

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1136', '1151', 'Treatise 9, Part 3', 'Seventh House, Chapters 1-7', 'Seventh House',
       'Marriage, partnership and openly opposing enemies', NULL,
       'Bonatti opens the section by assigning marriage, partners and openly opposing enemies to the seventh. The long sexual and marital catalogues were reviewed but are not promoted into separate terms. The partnership chapters add a structured native/partner/beginning/end framework.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the seventh as the principal natal place for marriage, partners or participators, and enemies who oppose the native openly. In judging a partnership he assigns the Ascendant and its lord to the native, the seventh and its lord to the partner, the tenth and its lord to the condition or course of the partnership, and the fourth and its lord to its end.',
       'Treatise 9, Part 3, Seventh House, Chs. 1 and 6-7', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='seventh-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='seventh-house'
  AND i.scope='Treatise 9, Part 3, Seventh House, Chs. 1 and 6-7'
  AND sp.section='Seventh House';
