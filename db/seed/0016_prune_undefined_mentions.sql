-- Editorial cleanup: remove source-derived entries that were promoted from mention-level evidence
-- without a sufficiently complete definition.
--
-- Current case: Abū Maʿshar's use of dastūrīya in Part VII.
-- The text associates the term with eastern solar phase, strength, and the giving of greatest years,
-- but does not define the technical condition itself. Under the lexicon's evidence threshold,
-- this is a mention/context signal, not a publishable source interpretation.
--
-- If a later author supplies a complete definition, the term may be re-created from that source.

DELETE FROM citations
WHERE interpretation_id IN (
  SELECT i.id
  FROM interpretations i
  JOIN terms t ON t.id = i.term_id
  JOIN works w ON w.id = i.work_id
  WHERE t.slug = 'dasturiya'
    AND w.slug = 'abu-mashar-great-introduction'
);

DELETE FROM interpretations
WHERE term_id = (SELECT id FROM terms WHERE slug = 'dasturiya')
  AND work_id = (SELECT id FROM works WHERE slug = 'abu-mashar-great-introduction');

DELETE FROM aliases
WHERE term_id = (SELECT id FROM terms WHERE slug = 'dasturiya');

DELETE FROM term_relations
WHERE subject_term_id = (SELECT id FROM terms WHERE slug = 'dasturiya')
   OR object_term_id = (SELECT id FROM terms WHERE slug = 'dasturiya');

DELETE FROM terms
WHERE slug = 'dasturiya'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id = terms.id
  );
