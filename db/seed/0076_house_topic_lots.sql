-- Term-only expansion discovered while sweeping the 3rd, 4th and 9th house curricula.
--
-- These are encyclopedia entries for named calculated lots, not instructions for
-- analyzing the corresponding houses. Definitions and formulas are intentionally
-- basic; direct historical source attribution and formula-variant reconciliation
-- can be strengthened in later corpus/web passes.

-- -----------------------------------------------------------------------------
-- LOT OF SIBLINGS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-siblings','Lot / Part of Siblings',
   'A topical calculated lot associated with brothers and sisters, formed in one traditional formula from the Ascendant, Jupiter and Saturn.',
   'lots','reviewed',
   'Curriculum-discovered term. Basic formula retained now; historical witness mapping and transmission variants remain to be expanded.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Siblings','English','translation-variant','English variant of Lot of Siblings.' FROM terms WHERE slug='lot-of-siblings';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-siblings' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Siblings is a calculated point associated with siblings. It belongs to the family of topical lots and should be treated as a named calculated point rather than as a complete method for judging the third house.','reviewed','Basic lexicon article; direct historical-source audit remains open.' FROM terms WHERE slug='lot-of-siblings';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','A commonly transmitted sect-dependent formula is Ascendant + Jupiter - Saturn by day, with Jupiter and Saturn reversed by night.',10,'reviewed','Formula audit pending against direct historical witnesses.' FROM terms WHERE slug='lot-of-siblings';

-- -----------------------------------------------------------------------------
-- LOT OF THE NUMBER OF SIBLINGS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-number-of-siblings','Lot of the Number of Siblings',
   'A topical calculated lot distinguished from the general Lot of Siblings and associated specifically with the number of brothers and sisters.',
   'lots','reviewed',
   'Kept separate from Lot of Siblings because the curriculum preserves a distinct name and formula. Historical naming/alias audit remains open.',
   'technical',3);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','A distinct sibling-related lot with a different formula.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-number-of-siblings' AND b.slug='lot-of-siblings';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-number-of-siblings' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of the Number of Siblings is a separate sibling-related calculated point whose purpose is more specific than the general Lot of Siblings.','reviewed','Basic definition only; historical terminology needs later corroboration.' FROM terms WHERE slug='lot-of-number-of-siblings';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The preserved formula is Ascendant + Saturn - Mercury, without a day/night reversal in the current curriculum record.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-number-of-siblings';

-- -----------------------------------------------------------------------------
-- LOT OF THE FATHER
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-father','Lot / Part of the Father',
   'A topical calculated lot associated with the father, using the Ascendant and solar/Saturnian significators in one traditional formula family.',
   'lots','reviewed',
   'Basic formula plus a combust-Saturn fallback are preserved as variants; direct historical witness mapping remains to be expanded.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of the Father','English','translation-variant','English variant of Lot of the Father.' FROM terms WHERE slug='lot-of-father';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-father' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of the Father is a calculated point associated with the father. Historical traditions preserve more than one formula or fallback condition, so the formula itself should be documented with its source rather than treated as completely uniform.','reviewed','Term-level definition only; no parental-analysis workflow imported.' FROM terms WHERE slug='lot-of-father';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','One sect-dependent formula is Ascendant + Saturn - Sun by day and Ascendant + Sun - Saturn by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-father';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'fallback','Fallback variant','The current curriculum also preserves a fallback when Saturn is combust: Jupiter replaces Saturn, yielding Ascendant + Jupiter - Sun by day and the reverse ordering by night. This should remain a source-specific variant until independently corroborated.',20,'reviewed',NULL FROM terms WHERE slug='lot-of-father';

-- -----------------------------------------------------------------------------
-- LOT OF THE MOTHER
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-mother','Lot / Part of the Mother',
   'A topical calculated lot associated with the mother, formed in one preserved formula from the Ascendant, Moon and Venus.',
   'lots','reviewed',
   'Curriculum-discovered term; historical formula and naming audit remains open.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of the Mother','English','translation-variant','English variant of Lot of the Mother.' FROM terms WHERE slug='lot-of-mother';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-mother' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of the Mother is a calculated point associated with the mother. It is kept as a separate named lot rather than folded into general fourth-house doctrine.','reviewed','Basic term definition; direct historical-source audit remains open.' FROM terms WHERE slug='lot-of-mother';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved formula is Ascendant + Moon - Venus by day and Ascendant + Venus - Moon by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-mother';

-- -----------------------------------------------------------------------------
-- LOT OF TRAVEL
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-travel','Lot / Part of Travel',
   'A topical calculated lot associated with journeys or travel, formed in one preserved formula from the Ascendant, ninth-house cusp and ruler of the ninth house.',
   'lots','reviewed',
   'Basic formula retained from the curriculum; historical aliases and variants remain to be audited.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Travel','English','translation-variant','English variant of Lot of Travel.' FROM terms WHERE slug='lot-of-travel';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Pars Peregrinationis','Latin','possible-historical-form','Latin travel-lot terminology; direct source mapping still required.' FROM terms WHERE slug='lot-of-travel';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-travel' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Travel is a calculated point associated with journeys. It is a named topical lot, not a replacement for the ninth house or a complete procedure for judging travel.','reviewed','Term-only migration.' FROM terms WHERE slug='lot-of-travel';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved formula is Ascendant + ninth-house cusp - ruler of the ninth house.',10,'reviewed','Historical formula audit pending.' FROM terms WHERE slug='lot-of-travel';

-- -----------------------------------------------------------------------------
-- LOT OF KNOWLEDGE
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-knowledge','Lot / Part of Knowledge',
   'A topical calculated lot associated with knowledge or intellectual matters, formed in one preserved formula from Mercury, Jupiter and Saturn.',
   'lots','reviewed',
   'Curriculum-discovered named lot. Historical naming and formula witnesses remain to be added.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Knowledge','English','translation-variant','English variant of Lot of Knowledge.' FROM terms WHERE slug='lot-of-knowledge';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-knowledge' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Knowledge is a calculated point associated with knowledge or intellectual matters. Its existence as a named lot is recorded separately from any broader method of judging the ninth house or the mind.','reviewed','Basic lexicon entry; direct historical-source audit pending.' FROM terms WHERE slug='lot-of-knowledge';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The preserved sect-dependent formula is Mercury + Jupiter - Saturn by day and Mercury + Saturn - Jupiter by night.',10,'reviewed','Historical formula audit pending.' FROM terms WHERE slug='lot-of-knowledge';

-- -----------------------------------------------------------------------------
-- LOT OF FAITH
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-faith','Lot / Part of Faith',
   'A topical calculated lot associated with faith or religious matters, formed in one preserved formula from the Ascendant, Mercury and Moon.',
   'lots','reviewed',
   'Curriculum-discovered named lot. Historical naming and formula witnesses remain to be added.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Faith','English','translation-variant','English variant of Lot of Faith.' FROM terms WHERE slug='lot-of-faith';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-faith' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Faith is a calculated point associated with faith or religious matters. It is indexed as a named lot without importing a ninth-house judgment workflow.','reviewed','Basic lexicon entry; direct historical-source audit pending.' FROM terms WHERE slug='lot-of-faith';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The preserved sect-dependent formula is Ascendant + Mercury - Moon by day and Ascendant + Moon - Mercury by night.',10,'reviewed','Historical formula audit pending.' FROM terms WHERE slug='lot-of-faith';

-- -----------------------------------------------------------------------------
-- LOT OF SPIRIT: enrich existing term if present, do not create a duplicate.
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'basic-formula','Basic formula','A widely transmitted sect-dependent formula is Ascendant + Sun - Moon by day and Ascendant + Moon - Sun by night. Source traditions should still be documented individually where their conventions differ.',10,'reviewed','Added during the house-topic lot sweep; no ninth-house workflow imported.' FROM terms WHERE slug='lot-of-spirit';
