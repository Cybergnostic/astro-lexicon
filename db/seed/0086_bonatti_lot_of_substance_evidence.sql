-- Public-source corroboration follow-up: Lot / Part of Substance.
--
-- The curriculum sweep surfaced this term provisionally, but Bonatti -- already one
-- of the five fully indexed historical works -- explicitly defines the Part of
-- Substance in his chapter on the Parts of the second house. Promote that missed
-- historical evidence into the canonical corpus.

INSERT INTO source_passages
  (edition_id,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Chapter 5','Parts of the 2nd house',
       'Chapter 5, On the Parts of the 2nd house, and on their extraction and their significations: first Part, the Part of Substance',
       NULL,
       'Missed definition-level evidence recovered during the post-curriculum public-source corroboration pass. Public summary is original paraphrase.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.chapter='Chapter 5'
      AND sp.section='Parts of the 2nd house'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Bonatti calls the first lot of the second house the Part of Substance. He measures from the lord of the second-house sign to the degree of the second house and projects that arc from the Ascendant, explicitly stating the same extraction for day and night. He associates the lot with sustenance, material substance and wealth.',
       'Chapter 5, Parts of the second house: Part of Substance',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-substance'
  AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
      AND i.scope='Chapter 5, Parts of the second house: Part of Substance'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lot-of-substance'
  AND w.slug='bonatti-liber-astronomiae'
  AND i.scope='Chapter 5, Parts of the second house: Part of Substance'
  AND sp.chapter='Chapter 5'
  AND sp.section='Parts of the 2nd house';

UPDATE terms SET
  short_definition='A traditional calculated lot associated with substance, sustenance and material resources. In Bonatti it is projected from the Ascendant by measuring from the lord of the second house to the degree of the second house.',
  definition_quality=5,
  editorial_notes='Bonatti explicitly attests the term and gives the same extraction by day and night. Other transmitted formula variants should remain source-specific rather than being silently normalized.'
WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Bonatti''s formula',
       'Bonatti defines the Part of Substance as the arc from the ruler of the second house to the degree or cusp of the second house, projected from the Ascendant. In compact notation: Ascendant + second-house degree - ruler of the second house. He explicitly gives this extraction for both day and night.',
       10,'reviewed','Now anchored to Bonatti, Chapter 5 on the Parts of the second house.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Formula variants and transmission',
       'Bonatti transmits a non-reversing day/night formula. Other later sources and modern compilations sometimes reverse the second-house factors by sect or attach the same Latin name to a different formula. Those should be documented as separate source variants rather than replacing Bonatti''s explicitly attested rule.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-of-substance';
