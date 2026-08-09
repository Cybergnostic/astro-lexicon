-- Basic lexicon entries for named eminence/career lots surfaced by the curriculum.
--
-- The current distillation preserves the names as a formula set but not enough
-- formula detail to publish the formulas safely here. These entries therefore
-- establish canonical term identities only; direct historical source/formula
-- mapping is intentionally deferred.

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-reputation','Lot / Part of Reputation',
   'A topical calculated lot associated with reputation, public standing or renown.',
   'lots','reviewed','Curriculum-discovered named lot; formula and historical aliases require direct-source audit.','technical',3),
  ('lot-of-rank','Lot / Part of Rank',
   'A topical calculated lot associated with rank, station or social elevation.',
   'lots','reviewed','Curriculum-discovered named lot; formula and historical aliases require direct-source audit.','technical',3),
  ('lot-of-authority','Lot / Part of Authority',
   'A topical calculated lot associated with authority, command or the exercise of power.',
   'lots','reviewed','Curriculum-discovered named lot; the course distinguishes a Valens-associated authority lot, but direct witness mapping remains open.','technical',3),
  ('lot-of-exaltation','Lot / Part of Exaltation',
   'A topical calculated lot associated with exaltation, elevation or advancement.',
   'lots','reviewed','Curriculum-discovered named lot; formula and source lineage require direct-source audit.','technical',3),
  ('lot-of-success','Lot / Part of Success',
   'A topical calculated lot associated with success, accomplishment or favorable attainment.',
   'lots','reviewed','Curriculum-discovered named lot; formula and historical naming require direct-source audit.','technical',3),
  ('lot-of-fame','Lot / Part of Fame',
   'A topical calculated lot associated with fame, renown or public visibility.',
   'lots','reviewed','Curriculum-discovered named lot; the course distinguishes an Abū Maʿshar-associated fame lot, but direct witness mapping remains open.','technical',3);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Reputation','English','translation-variant','English variant of Lot of Reputation.' FROM terms WHERE slug='lot-of-reputation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Rank','English','translation-variant','English variant of Lot of Rank.' FROM terms WHERE slug='lot-of-rank';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Authority','English','translation-variant','English variant of Lot of Authority.' FROM terms WHERE slug='lot-of-authority';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Exaltation','English','translation-variant','English variant of Lot of Exaltation.' FROM terms WHERE slug='lot-of-exaltation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Success','English','translation-variant','English variant of Lot of Success.' FROM terms WHERE slug='lot-of-success';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Fame','English','translation-variant','English variant of Lot of Fame.' FROM terms WHERE slug='lot-of-fame';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-reputation' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-rank' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-authority' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-exaltation' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-success' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-fame' AND b.slug='lot';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Reputation is a named topical lot associated with public reputation or standing. Its historical formula and naming variants remain to be attached from direct witnesses.','reviewed','Basic placeholder-quality encyclopedia entry, intentionally source-open.' FROM terms WHERE slug='lot-of-reputation';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Rank is a named topical lot associated with social rank or elevation. It is indexed separately from general career doctrine because it is a distinct calculated point.','reviewed','Formula audit pending.' FROM terms WHERE slug='lot-of-rank';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Authority is a named topical lot associated with authority and command. The current curriculum links one authority lot to Valens, but the direct historical witness and exact formula still need to be mapped.','reviewed','Attribution deliberately provisional.' FROM terms WHERE slug='lot-of-authority';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Exaltation is a named topical lot associated with elevation or advancement. It is preserved here as a distinct calculated point pending direct formula and source comparison.','reviewed','Formula audit pending.' FROM terms WHERE slug='lot-of-exaltation';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Success is a named topical lot associated with success or favorable attainment. The current corpus establishes the term but not yet a sufficiently sourced public formula.','reviewed','Formula audit pending.' FROM terms WHERE slug='lot-of-success';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot or Part of Fame is a named topical lot associated with fame or public renown. The current curriculum associates one fame lot with Abū Maʿshar, but the precise historical source and formula remain to be attached directly.','reviewed','Attribution and formula deliberately provisional.' FROM terms WHERE slug='lot-of-fame';
