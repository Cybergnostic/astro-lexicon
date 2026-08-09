-- Term-only expansion discovered in friends/enemies and relationships curricula.
-- No chart-analysis workflows are imported here.

-- -----------------------------------------------------------------------------
-- LOT OF FRIENDS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-friends','Lot / Part of Friends',
   'A topical calculated lot associated with friends or friendship, formed in one preserved formula from the Ascendant, Mercury and Moon.',
   'lots','reviewed',
   'Curriculum-discovered named lot. Basic formula retained; direct historical-source audit remains open.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Friends','English','translation-variant','English variant of Lot of Friends.' FROM terms WHERE slug='lot-of-friends';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-friends' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Friends is a calculated point associated with friendship. It is indexed here as a named topical lot rather than as a method for judging the eleventh house.','reviewed','Basic lexicon entry; historical naming and formula witnesses remain to be expanded.' FROM terms WHERE slug='lot-of-friends';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved formula is Ascendant + Mercury - Moon, without a day/night reversal in the curriculum record.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-friends';

-- -----------------------------------------------------------------------------
-- LOT OF ENEMIES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-enemies','Lot / Part of Enemies',
   'A topical calculated lot associated with enemies or enmity. More than one formula is preserved in the current material.',
   'lots','reviewed',
   'Formula family retained provisionally; direct historical-source reconciliation remains open.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Enemies','English','translation-variant','English variant of Lot of Enemies.' FROM terms WHERE slug='lot-of-enemies';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-enemies' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Enemies is a calculated point associated with enmity or hidden opposition. The current material preserves more than one formula, so the term is kept distinct from any single calculation rule.','reviewed','Term-only migration; formula transmission needs later source audit.' FROM terms WHERE slug='lot-of-enemies';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-1','Sect-dependent formula','One preserved formula is Ascendant + Lot of Fortune - Saturn by day and Ascendant + Saturn - Lot of Fortune by night.',10,'reviewed','Historical formula audit pending.' FROM terms WHERE slug='lot-of-enemies';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-2','Alternative fixed formula','An alternative fixed formula in the current material is Ascendant + twelfth-house cusp - ruler of the twelfth house. This is retained as a distinct variant rather than silently merged with the Fortune/Saturn formula.',20,'reviewed','Historical formula audit pending.' FROM terms WHERE slug='lot-of-enemies';

-- -----------------------------------------------------------------------------
-- LOT OF IMPRISONMENT
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-imprisonment','Lot / Part of Imprisonment',
   'A topical calculated lot associated with imprisonment or confinement, using the sect light and the ruler of that luminary in one preserved formula.',
   'lots','reviewed',
   'Basic definition only; direct historical-source mapping remains open.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Imprisonment','English','translation-variant','English variant of Lot of Imprisonment.' FROM terms WHERE slug='lot-of-imprisonment';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Prison','English','translation-variant','Short English variant.' FROM terms WHERE slug='lot-of-imprisonment';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-imprisonment' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Imprisonment is a calculated point associated with confinement or imprisonment. It is preserved as a named lot, not as a complete method of judging twelfth-house matters.','reviewed','Basic lexicon article.' FROM terms WHERE slug='lot-of-imprisonment';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved formula is Ascendant + Sun - ruler of the Sun by day and Ascendant + Moon - ruler of the Moon by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-imprisonment';

-- -----------------------------------------------------------------------------
-- HERMES LOT OF MARRIAGE
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('hermes-lot-of-marriage','Hermes’ Lot / Part of Marriage',
   'A topical marriage lot attributed in the current tradition to Hermes, calculated from the Ascendant, Venus and Saturn with the order reversed according to the native’s sex.',
   'lots','reviewed',
   'The Hermes attribution and formula should be checked against direct historical witnesses in a later source pass.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hermes’ Part of Marriage','English','translation-variant','English variant of Hermes’ Lot of Marriage.' FROM terms WHERE slug='hermes-lot-of-marriage';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Marriage','English','generic-variant','Generic English label for this preserved Hermes formula.' FROM terms WHERE slug='hermes-lot-of-marriage';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='hermes-lot-of-marriage' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Hermes’ Lot or Part of Marriage is a calculated point associated with marriage. The current formula is sex-dependent rather than sect-dependent, which should be preserved as part of this particular transmitted version.','reviewed','Term-only migration; attribution/formula audit pending.' FROM terms WHERE slug='hermes-lot-of-marriage';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','For men, the preserved formula is Ascendant + Venus - Saturn; for women, Ascendant + Saturn - Venus.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='hermes-lot-of-marriage';

-- -----------------------------------------------------------------------------
-- LOT OF DIVORCE
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-divorce','Lot / Part of Divorce',
   'A topical calculated lot associated with divorce or separation, formed in one preserved sect-dependent formula from the Ascendant, Venus and Jupiter.',
   'lots','reviewed',
   'Basic formula retained provisionally; historical witnesses and naming variants remain to be audited.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Divorce','English','translation-variant','English variant of Lot of Divorce.' FROM terms WHERE slug='lot-of-divorce';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-divorce' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Divorce is a calculated point associated with separation or divorce. It is kept as a named lot rather than as a prediction or workflow for relationship judgment.','reviewed','Basic lexicon entry.' FROM terms WHERE slug='lot-of-divorce';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved formula is Ascendant + Venus - Jupiter by day and Ascendant + Jupiter - Venus by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-divorce';

-- -----------------------------------------------------------------------------
-- LOT OF EROS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-eros','Lot of Eros',
   'A topical calculated lot associated in one traditional stream with eros, desire or attraction, formed in the current formula from the Ascendant, Venus and the Lot of Fortune.',
   'lots','reviewed',
   'Do not assume this is identical with every Hellenistic or later lot translated as Eros/Love; direct source-family reconciliation remains open.',
   'technical',3);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Eros','English','translation-variant','English variant of Lot of Eros.' FROM terms WHERE slug='lot-of-eros';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-eros' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Eros is a calculated point associated with eros, desire or attraction in the current transmitted formula. Historical texts use related love/eros terminology in more than one way, so this entry should remain source-sensitive as the corpus expands.','reviewed','Basic lexicon article; later cross-source reconciliation needed.' FROM terms WHERE slug='lot-of-eros';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Basic formula','The currently preserved sect-dependent formula is Ascendant + Venus - Lot of Fortune by day and Ascendant + Lot of Fortune - Venus by night.',10,'reviewed','Direct historical-source audit pending.' FROM terms WHERE slug='lot-of-eros';