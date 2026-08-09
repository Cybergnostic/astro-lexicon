-- Term-level addition discovered during the finance curriculum sweep.
--
-- This seed adds only the named lot and its formula family. It does not import
-- a financial-analysis workflow. The term is historically attested outside the
-- private course, but formula transmission is not yet fully reconciled across
-- sources, so the article preserves that uncertainty explicitly.

INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('lot-of-substance', 'Lot / Part of Substance',
   'A traditional calculated lot associated with substance, possessions or material resources, formed from the Ascendant, the second-house cusp and the ruler of the second house in one widely attested medieval formula family.',
   'lots', 'reviewed',
   'Existence and Latin name Pars Substantiae are independently attested. A common formula is Ascendant + second-house cusp - ruler of the second house; some later traditions transmit reversed or entirely different formulas, so source-by-source reconciliation remains open.',
   'technical', 4);

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Part of Substance', 'English', 'translation-variant',
       'English rendering of Pars Substantiae.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Pars Substantiae', 'Latin', 'historical-form',
       'Latin name attested for the lot associated with substance or possessions.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR IGNORE INTO term_relations
  (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of',
       'The Lot of Substance is one named member of the broader family of calculated lots.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-substance' AND b.slug='lot';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot or Part of Substance (Latin Pars Substantiae) is a calculated point concerned with material substance, possessions or resources. It belongs to the large family of topical lots rather than functioning as a planet, house or general significator in its own right.',
       'reviewed',
       'Basic lexicon entry added before full historical-source onboarding. Formula variants must be revisited source by source.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula',
       'One well-attested medieval formula family measures from the ruler of the second house to the second-house cusp and projects that distance from the Ascendant. In compact notation this is Ascendant + second-house cusp - ruler of the second house.',
       10,'reviewed',
       'Treat as a formula family rather than the final universal formula until the historical witnesses are ingested directly.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Formula variants and transmission',
       'The name is more stable than the formula across later sources. Some traditions reverse the two second-house factors in nocturnal charts, while other later references attach the same Latin name to a different planetary formula. These variants should remain visible rather than being silently normalized into one rule.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','What belongs in this entry',
       'This entry defines the named calculated point, its formula family and historical variants. Lists of financial significators, priorities for judging wealth, and step-by-step natal finance procedures belong outside the lexicon and are intentionally not imported here.',
       30,'reviewed',NULL
FROM terms WHERE slug='lot-of-substance';
