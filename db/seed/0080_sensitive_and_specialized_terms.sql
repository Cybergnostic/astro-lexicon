-- Specialized term-only expansion from the audited natal and traditional curriculum.
--
-- This seed intentionally adds vocabulary, aliases, basic definitions and a few
-- preserved formulas. It does NOT import lifespan prediction workflows, medical
-- diagnosis rules, violent-death judgment procedures, or fertility analysis.
-- Sensitive terms are kept descriptive and historical.

-- -----------------------------------------------------------------------------
-- HYLEG / APHETA
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('hyleg','Hyleg',
   'A traditional life-giving or vitality-bearing factor used in historical longevity doctrine; also known in some traditions as the apheta.',
   'traditional-techniques','reviewed',
   'Historical terminology only. Do not present this entry as a modern method for predicting lifespan.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Apheta','Greek/Latin','historical-synonym','Historical synonym or near-equivalent used for the life-giving factor.' FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hajleg','Serbian','transliteration','Serbian transliteration used in the private curriculum.' FROM terms WHERE slug='hyleg';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Hyleg is a historical technical term for the factor treated as life-giving or as carrying the native''s vital principle in traditional longevity doctrine. Different authors preserve different eligibility rules and selection procedures, so the term should be distinguished from any one particular method of finding it.','reviewed','Descriptive historical entry; calculation workflow intentionally excluded.' FROM terms WHERE slug='hyleg';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('hylegical-place','Hylegical Place',
   'A chart place or position considered eligible to host a Hyleg under a particular historical longevity system.',
   'traditional-techniques','reviewed',
   'Eligibility differs by author and school; article should preserve variants rather than normalize one universal list.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hylegical Places','English','plural-form','Plural form.' FROM terms WHERE slug='hylegical-place';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Hylegical places are positions considered eligible for the Hyleg in historical longevity doctrine.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='hylegical-place' AND b.slug='hyleg';

-- -----------------------------------------------------------------------------
-- ALCOCHODEN / ALCOCODEN
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('alcochoden','Alcochoden',
   'A planet selected in some medieval longevity systems as the giver or administrator of years after the Hyleg has been established.',
   'traditional-techniques','reviewed',
   'Historical terminology only. Selection rules and planetary-year calculations are intentionally not imported as a lifespan-prediction workflow.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Alcocoden','English','spelling-variant','Common English spelling variant.' FROM terms WHERE slug='alcochoden';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Alcochoden','English','spelling-variant','Common transliteration variant.' FROM terms WHERE slug='alcochoden';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Alkohoden','Serbian','transliteration','Serbian transliteration used in the private curriculum.' FROM terms WHERE slug='alcochoden';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','The Alcochoden belongs to the same historical longevity doctrine as the Hyleg.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='alcochoden' AND b.slug='hyleg';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Alcochoden is the planet treated in some medieval longevity systems as the giver or administrator of years. Historical authors disagree about its exact qualification rules, including whether it must aspect the Hyleg and how dignity is weighted.','reviewed','No life-expectancy calculation instructions are included.' FROM terms WHERE slug='alcochoden';

-- -----------------------------------------------------------------------------
-- ANARETA
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('anareta','Anareta',
   'A historical longevity term for a destructive or life-ending factor opposed to the life-giving function of the Hyleg.',
   'traditional-techniques','reviewed',
   'Descriptive historical terminology only; no death-prediction procedure is imported.',
   'technical',4);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','The Anareta is traditionally contrasted with the life-giving Hyleg.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='anareta' AND b.slug='hyleg';

-- -----------------------------------------------------------------------------
-- DECUMBITURE
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('decumbiture','Decumbiture',
   'A historical medical-astrology chart erected for the onset or formal observation of an illness, traditionally associated with the time a patient takes to bed or comes under treatment.',
   'medical-astrology','reviewed',
   'Historical astrological terminology, not medical advice or a diagnostic recommendation.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Decumbiture Chart','English','expanded-form','Expanded English label.' FROM terms WHERE slug='decumbiture';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A decumbiture is a historical medical-astrology chart associated with the onset or observation of an actual illness. Older traditions vary in the exact moment used for erection of the chart. The term belongs to the history of astrological medicine and should not be confused with modern medical diagnosis.','reviewed','Keep medical claims historical and non-diagnostic.' FROM terms WHERE slug='decumbiture';

-- -----------------------------------------------------------------------------
-- ALMUGEA
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('almugea','Almugea',
   'A traditional configuration in which a planet stands to a luminary in an angular relationship analogous to the zodiacal relationship between their domiciles.',
   'configurations','reviewed',
   'Basic term definition from the traditional curriculum; direct historical source expansion remains desirable.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Almugia','English/Latin','spelling-variant','Historical spelling/transliteration variant to be source-checked.' FROM terms WHERE slug='almugea';

-- -----------------------------------------------------------------------------
-- ECLIPSE SERIES / SAROS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('saros-cycle','Saros Cycle',
   'An astronomical eclipse cycle in which broadly similar solar or lunar eclipses recur after a characteristic interval.',
   'eclipses','reviewed',
   'Astronomical definition; historical astrological uses can be added separately.',
   'technical',4);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','The Saros is a recurring eclipse series/cycle.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='saros-cycle' AND b.slug='eclipse';

-- -----------------------------------------------------------------------------
-- OFFSPRING LOTS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-children','Lot / Part of Children',
   'A topical calculated lot associated with children or offspring.',
   'lots','reviewed',
   'Basic term and preserved formula only. Fertility prediction and reproductive-health claims are excluded.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Children','English','translation-variant','English variant of Lot of Children.' FROM terms WHERE slug='lot-of-children';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-children' AND b.slug='lot';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved sect-dependent formula is Ascendant + Saturn - Jupiter by day and Ascendant + Jupiter - Saturn by night.',10,'reviewed','Direct historical-source audit pending; no fertility workflow imported.' FROM terms WHERE slug='lot-of-children';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-daughters','Lot / Part of Daughters',
   'A topical calculated lot specifically associated in some traditional sources with daughters.',
   'lots','reviewed',
   'Basic term and preserved formula only; historical naming and transmission still need direct-source review.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Daughters','English','translation-variant','English variant of Lot of Daughters.' FROM terms WHERE slug='lot-of-daughters';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-daughters' AND b.slug='lot';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved sect-dependent formula is Ascendant + Venus - Jupiter by day and Ascendant + Jupiter - Venus by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-daughters';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-sons','Lot / Part of Sons',
   'A topical calculated lot specifically associated in some traditional sources with sons.',
   'lots','reviewed',
   'Basic term and preserved formula only; historical naming and transmission still need direct-source review.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Sons','English','translation-variant','English variant of Lot of Sons.' FROM terms WHERE slug='lot-of-sons';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-sons' AND b.slug='lot';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved sect-dependent formula is Ascendant + Mercury - Jupiter by day and Ascendant + Jupiter - Mercury by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-sons';

-- -----------------------------------------------------------------------------
-- LOT OF DEATH: identity only, no predictive article or workflow.
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-death','Lot / Part of Death',
   'A named topical lot found in historical astrological traditions concerning death and mortality.',
   'lots','provisional',
   'Sensitive historical term. Multiple formulas are transmitted; do not expose as a predictive workflow without direct-source reconciliation and editorial review.',
   'technical',2);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Death','English','translation-variant','English variant of Lot of Death.' FROM terms WHERE slug='lot-of-death';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','provisional' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-death' AND b.slug='lot';
