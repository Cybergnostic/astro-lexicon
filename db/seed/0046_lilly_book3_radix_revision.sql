-- Editorial correction to Lilly Book III extraction.
-- Lilly treats Radix as the root/original natal figure, not simply as a synonym for the abstract concept of nativity.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('radix', 'Radix', 'The original or root astrological figure from which later predictive operations such as directions, profections, revolutions and transits are referred.', 'chart concept', 'draft', 'Lilly explicitly prefers Radix as the proper term for the root of the nativity. Keep distinct from the broader concept of nativity.');

DELETE FROM aliases
WHERE label='Radix'
  AND term_id=(SELECT id FROM terms WHERE slug='nativity');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Root', 'English', 'source-equivalent', 'Lilly uses root and says Radix is the more proper expression.' FROM terms WHERE slug='radix';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Root of the Nativity', 'English', 'source-phrase', 'The original natal figure, for which Lilly says Radix is the more proper expression.' FROM terms WHERE slug='radix';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly uses Radix for the root or original figure of the nativity. It is the baseline against which directions and the later annual techniques are compared, rather than merely another name for the general subject of nativity.',
       'Book III, directions and annual techniques', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='radix' AND w.slug='lilly-christian-astrology';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug='radix'
  AND sp.book='Book III'
  AND sp.chapter='Natal topics through Chapter CLXV and directional effects';
