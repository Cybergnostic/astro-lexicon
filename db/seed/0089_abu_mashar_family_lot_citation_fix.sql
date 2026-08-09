-- Provenance correction for 0088.
--
-- The definitions/formulas are correct, but four interpretations were initially linked
-- to the broad §§4.11-4.22 source block even though their direct formula summaries
-- occur later in Part VIII. Add precise source passages and move those citations.

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'897','901','Part VIII','Chapter 4','4.70',
       'Part VIII, Chapter 4, §4.70: Lot of the Mother',
       NULL,
       'Precise direct source for the mother-lot formula.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.70');

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'921','924','Part VIII','Chapter 6','6.6-6.8',
       'Part VIII, Chapter 6, §§6.6-6.8: formula summary for brothers, number of brothers, children, male children and female children',
       NULL,
       'Precise formula-summary source for the number-of-brothers and offspring-lot formulas.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='6.6-6.8');

-- Remove only the misrouted citations created by 0088 for interpretations whose
-- direct scopes are outside §§4.11-4.22.
DELETE FROM citations
WHERE interpretation_id IN (
  SELECT i.id
  FROM interpretations i
  JOIN terms t ON t.id=i.term_id
  JOIN works w ON w.id=i.work_id
  WHERE w.slug='abu-mashar-great-introduction'
    AND t.slug IN ('lot-of-number-of-siblings','lot-of-mother','lot-of-sons','lot-of-daughters')
    AND i.scope IN (
      'Part VIII, formula summary, §6.6',
      'Part VIII, Chapter 4, §4.70',
      'Part VIII, formula summary, §6.8'
    )
)
AND source_passage_id IN (
  SELECT sp.id FROM source_passages sp
  JOIN editions e ON e.id=sp.edition_id
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='abu-mashar-great-introduction' AND sp.book='Part VIII' AND sp.section='4.11-4.22'
);

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug='lot-of-mother'
  AND i.scope='Part VIII, Chapter 4, §4.70'
  AND sp.book='Part VIII' AND sp.section='4.70';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug IN ('lot-of-number-of-siblings','lot-of-sons','lot-of-daughters')
  AND i.scope IN ('Part VIII, formula summary, §6.6','Part VIII, formula summary, §6.8')
  AND sp.book='Part VIII' AND sp.section='6.6-6.8';
