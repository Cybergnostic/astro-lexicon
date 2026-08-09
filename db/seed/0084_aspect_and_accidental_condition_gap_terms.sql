-- Final foundational gap pass for aspect mechanics and accidental/synodic conditions.
-- INSERT OR IGNORE is intentional: several of these concepts may already have been
-- promoted from the historical corpus; this seed fills missing identities without
-- replacing richer reviewed definitions.

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('application','Application',
   'The condition in which two planets are moving toward the perfection of an aspect or conjunction.',
   'aspect mechanics','reviewed','Recognition depends on real planetary motion, not merely zodiacal order.','technical',5),
  ('separation','Separation',
   'The condition after an aspect or conjunction has perfected, while the relevant planets are moving away from exact contact.',
   'aspect mechanics','reviewed','Distinguish true separation from a pair that is simply outside orb and never perfected the contact.','technical',5),
  ('configuration','Configuration',
   'A geometric relationship or aspectual arrangement between planets, signs or points; in traditional texts the word can be broader than a single exact bodily contact.',
   'aspect mechanics','reviewed','Scope varies by source; preserve author-specific usage.','technical',4),
  ('planetary-orb','Planetary Orb',
   'The traditional sphere of angular allowance assigned to a planet for judging whether an aspectual contact is operative.',
   'aspect mechanics','reviewed','Orb systems differ historically; do not flatten all authors to one table.','technical',5),
  ('dexter-aspect','Dexter Aspect',
   'An aspect cast to the right-hand side in traditional aspect geometry, conventionally contrasted with a sinister aspect.',
   'aspect mechanics','reviewed','Historical accounts often treat dexter aspects as stronger; exact geometric description should be source-linked.','technical',4),
  ('sinister-aspect','Sinister Aspect',
   'An aspect cast to the left-hand side in traditional aspect geometry, conventionally contrasted with a dexter aspect.',
   'aspect mechanics','reviewed','Historical accounts often distinguish its force from dexter aspects; source-specific rules remain separate.','technical',4),
  ('cazimi','Cazimi',
   'A traditional solar condition in which a planet is extremely close to the Sun and described as being in the heart of the Sun.',
   'solar condition','reviewed','Exact angular thresholds vary among authorities and should be stored as source-specific variants.','technical',5),
  ('combustion','Combustion',
   'A traditional solar debility in which a planet lies very close to the Sun and is overwhelmed by its rays, outside the narrower cazimi condition.',
   'solar condition','reviewed','Exact thresholds differ by source and sometimes by planet.','technical',5),
  ('under-the-beams','Under the Beams',
   'A traditional solar condition in which a planet is hidden or weakened by proximity to the Sun but lies outside the narrower combustion range.',
   'solar condition','reviewed','Thresholds vary across traditions; preserve source-specific values.','technical',5),
  ('oriental','Oriental',
   'A relational solar-phase term describing a planet as east of the Sun in the relevant traditional sense.',
   'planetary phase','reviewed','The practical meaning differs for superior planets, inferior planets and Mercury’s sect classification; avoid a single interpretive rule.','technical',4),
  ('occidental','Occidental',
   'A relational solar-phase term describing a planet as west of the Sun in the relevant traditional sense.',
   'planetary phase','reviewed','The practical meaning differs by planetary class and context.','technical',4),
  ('swift-in-motion','Swift in Motion',
   'A condition in which a planet is moving faster in longitude than its relevant mean or customary speed.',
   'planetary motion','reviewed','Historical mean-speed tables and computational conventions can differ.','technical',4),
  ('slow-in-motion','Slow in Motion',
   'A condition in which a planet is moving more slowly in longitude than its relevant mean or customary speed.',
   'planetary motion','reviewed','Historical mean-speed tables and computational conventions can differ.','technical',4);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Applying','English','grammatical-variant','Adjectival/participle form.' FROM terms WHERE slug='application';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Separating','English','grammatical-variant','Adjectival/participle form.' FROM terms WHERE slug='separation';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Dexter','English/Latin','short-form','Short form when aspect context is clear.' FROM terms WHERE slug='dexter-aspect';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Sinister','English/Latin','short-form','Short form when aspect context is clear.' FROM terms WHERE slug='sinister-aspect';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'In the Heart of the Sun','English','translation-variant','Traditional explanatory phrase for cazimi.' FROM terms WHERE slug='cazimi';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Combust','English','grammatical-variant','Adjectival form of combustion.' FROM terms WHERE slug='combustion';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Under Beams','English','name-variant','Shortened form.' FROM terms WHERE slug='under-the-beams';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Eastern','English','translation-variant','Contextual equivalent of oriental in solar-phase language.' FROM terms WHERE slug='oriental';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Western','English','translation-variant','Contextual equivalent of occidental in solar-phase language.' FROM terms WHERE slug='occidental';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired aspect-direction terms.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='dexter-aspect' AND b.slug='sinister-aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired aspect-direction terms.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='sinister-aspect' AND b.slug='dexter-aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired solar-orientation terms.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='oriental' AND b.slug='occidental';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired solar-orientation terms.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='occidental' AND b.slug='oriental';
