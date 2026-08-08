-- Correction to 0040_antiochus_thesaurus.sql.
-- The ninth-part procedure was not defined in the Antiochus text reviewed in this edition;
-- it was mistakenly carried over from another source during seed preparation.
-- Remove the unsupported source-specific term and any attached interpretation/citation.

DELETE FROM citations
WHERE interpretation_id IN (
  SELECT i.id FROM interpretations i
  JOIN terms t ON t.id=i.term_id
  JOIN works w ON w.id=i.work_id
  WHERE t.slug='ninth-part-antiochus' AND w.slug='antiochus-thesaurus'
);

DELETE FROM interpretations
WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-part-antiochus')
  AND work_id=(SELECT id FROM works WHERE slug='antiochus-thesaurus');

DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-part-antiochus');
DELETE FROM term_relations WHERE subject_term_id=(SELECT id FROM terms WHERE slug='ninth-part-antiochus') OR object_term_id=(SELECT id FROM terms WHERE slug='ninth-part-antiochus');
DELETE FROM terms WHERE slug='ninth-part-antiochus';
