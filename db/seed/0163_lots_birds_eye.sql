-- Bird's-eye encyclopedia review: Lots / Parts.
--
-- The corpus already contains extensive source-specific formulas and reconciliation work.
-- This pass does not create another formula catalogue. It organizes the family around
-- construction mechanics, source identity, interpretation layers and explicit formula streams.
--
-- Skyscript's historical Parts/Fortune material was used only as an editorial completeness
-- check for common reader confusions around formula reversal and the inherited label
-- "Arabic Parts". Public claims remain grounded in the project's historical corpus.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('lot-mechanics','Lots / Parts: Mechanics and Source Identity',
   'The family connecting the general Lot concept to arc projection, source-specific formula identity, chart-specific indicators and a small set of foundational resolved examples.',
   'mechanics',
   'Bird’s-eye Lots family. Formula identity must remain source-bound: same English name does not prove same historical construction, and similar formulas do not automatically prove identical historical terminology.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('lot','framework','Framework',10,'Umbrella concept for calculated Lots / Parts.'),
  ('lot-extraction','construction','Construction',20,'The arc-measurement and projection operation used to derive a Lot.'),
  ('natural-indicators-of-a-lot','interpretation-layer','Interpretation layer',30,'Planets that signify the Lot’s topic by natural planetary signification.'),
  ('general-indicators-of-a-lot','interpretation-layer','Interpretation layer',40,'Chart-specific indicators arising from the Lot’s actual position, ruler and connections.'),
  ('lot-of-fortune','resolved-stream','Resolved source stream',50,'A major luminary Lot with source-sensitive day/night formula traditions.'),
  ('lot-of-absence','resolved-stream','Resolved source stream',60,'The reverse-luminary / Absence stream represented in the current Abū Maʿshar corpus; naming varies across traditions.'),
  ('lot-of-substance','resolved-stream','Resolved source stream',70,'Bonatti’s source-specific construction relating the Ascendant, second-house degree and its ruler.'),
  ('lot-of-haylaj','resolved-stream','Resolved source stream',80,'A source-specific Lot involving the Ascendant, Moon and prenatal syzygy; distinct from the Hyleg itself.'),
  ('lot-of-eros','variant-sensitive','Variant-sensitive identity',90,'Historically important love/desire Lot whose formula stream requires explicit source attribution and should not be merged with every “Lot of Venus/Love”.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='lot-mechanics'
JOIN terms t ON t.slug=m.term_slug;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('abu-mashar-planetary-lots','Abū Maʿshar’s Non-Luminary Planetary Lots',
   'The five explicitly planetary Lots associated with Saturn, Jupiter, Mars, Venus and Mercury in Great Introduction VIII.3.12–3.16.',
   'historical-system',
   'Source-specific five-lot series. Keep these historical identities separate from same-themed Lots in other streams unless formula and textual identity are demonstrated.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('lot-of-heavy-saturn','planetary-lot','Planetary lot',10,'Abū Maʿshar’s Saturnian planetary Lot.'),
  ('lot-of-jupiter-prosperity-assistance','planetary-lot','Planetary lot',20,'Abū Maʿshar’s Jupiter planetary Lot associated in the source with prosperity and assistance.'),
  ('lot-of-mars-courage','planetary-lot','Planetary lot',30,'Abū Maʿshar’s Mars planetary Lot associated with courage and boldness.'),
  ('lot-of-venus-love-intimacy','planetary-lot','Planetary lot',40,'Abū Maʿshar’s Venus planetary Lot associated with love and intimacy; not silently identical with Eros.'),
  ('lot-of-mercury-means','planetary-lot','Planetary lot',50,'Abū Maʿshar’s Mercury planetary Lot with historically ambivalent wording around means and lack of means.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='abu-mashar-planetary-lots'
JOIN terms t ON t.slug=m.term_slug;

-- -----------------------------------------------------------------------------
-- DEFINITIONS AND FAMILY-LEVEL PEDAGOGY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A Lot, or Part, is a calculated zodiacal point made by measuring a defined arc between chart factors and projecting that arc from the Ascendant or another specified origin. A Lot has no independent physical body; its formula and historical identity are source-specific.',
  editorial_notes='Bird’s-eye Lots review. Keep construction, name, source identity and interpretation as separate layers.'
WHERE slug='lot';

UPDATE terms SET
  short_definition='Lot Extraction is the construction step that measures the zodiacal arc specified by a Lot formula and projects it from the formula’s stated origin, usually the Ascendant, to obtain the Lot’s zodiacal position.',
  editorial_notes='Bird’s-eye Lots review. Definition covers arithmetic mechanics only, not interpretation workflow.'
WHERE slug='lot-extraction';

UPDATE terms SET
  short_definition='Natural Indicators of a Lot are planets or significators connected to the Lot’s subject by their inherent traditional significations, independent of which planet happens to rule the Lot’s calculated degree in a particular chart.',
  editorial_notes='Bird’s-eye Lots review. Natural indication and chart-specific rulership are separate layers.'
WHERE slug='natural-indicators-of-a-lot';

UPDATE terms SET
  short_definition='General Indicators of a Lot are chart-specific factors arising from the Lot’s actual calculated position—especially its ruler and planets connected to its degree—rather than planets that naturally signify the subject in every chart.',
  editorial_notes='Bird’s-eye Lots review. Do not convert this distinction into an ordered analysis checklist.'
WHERE slug='general-indicators-of-a-lot';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'lot-layers','Four layers that should not be collapsed',
  'A historical Lot is identified by more than its English label. The encyclopedia keeps construction, textual identity and interpretation separately attributable.',
  '["Layer","Question","Typical data"]',
  '[["Construction","How is the point calculated?","Origin · A→B arc · day/night reversal · substitutions"],["Historical identity","Which source/work names or transmits this construction?","Author · work · source name · translation variants"],["Canonical relation","Is this the same Lot as a similarly named formula elsewhere?","Same stream · variant · related-but-distinct · unresolved"],["Interpretation","What does the source say the calculated point signifies or how is it related to other indicators?","Source account · natural indicators · chart-specific ruler/connections"]]',
  8,'reviewed','Bird’s-eye teaching table, not a universal method for interpreting Lots.'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'name-not-identity','An English name is not enough to establish identity',
  'Lot traditions are especially vulnerable to false merging because translated names such as Love, Courage, Marriage, Spirit or Substance can recur in different authors. The encyclopedia therefore compares formula, sect reversal, ingredients, substitutions and source context before treating two labels as the same historical Lot. When the evidence is insufficient, separate entries or explicit variant relations are preferable to forced normalization.',35,'reviewed',NULL
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-source','Formula notation is a source record, not a universal definition',
  'The arithmetic notation on an individual Lot page summarizes a formula attested in a particular source stream. It should not silently become the definition of that Lot for every period or author. Where traditions reverse by sect, keep a fixed formula, substitute another significator, or transmit competing constructions, those differences belong in named source accounts and comparison tables.',45,'reviewed',NULL
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'projection-not-body','A calculated point, not a celestial body',
  'Lot extraction produces a zodiacal longitude by symbolic projection. The resulting point does not emit light, possess latitude as an independent object, or move through the sky as a planet does. Any aspects, rulerships or other relations attributed to the Lot are relations to its calculated zodiacal position.',20,'reviewed',NULL
FROM terms WHERE slug='lot-extraction';

-- Make the existing Fortune/Absence pair easier to understand without declaring one naming
-- convention universal across all traditions.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-formula','Formula and naming must travel together',
  'The current page preserves the formula stream attested in the named historical source. Other authors can reverse the luminary arc differently or use different names for related constructions. A reader should therefore cite both the Lot name and the source tradition when formula identity matters.',35,'reviewed',NULL
FROM terms WHERE slug IN ('lot-of-fortune','lot-of-absence');

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('lot','lot-extraction','constructed-by','Lot Extraction names the general arc-projection operation by which a Lot is calculated.'),
  ('lot','natural-indicators-of-a-lot','has-interpretation-layer','Natural indicators connect the Lot’s topic to inherent planetary significations.'),
  ('lot','general-indicators-of-a-lot','has-interpretation-layer','General indicators arise from the Lot’s chart-specific calculated position.'),
  ('natural-indicators-of-a-lot','general-indicators-of-a-lot','distinct-from','Natural planetary topic-signification and chart-specific rulership/connections are different interpretive layers.'),
  ('lot-of-fortune','lot-of-absence','paired-formula-stream','In the current Abū Maʿshar stream the two use reversed luminary arcs; naming and night-use conventions can vary elsewhere.'),
  ('lot-of-venus-love-intimacy','lot-of-eros','related-but-distinct','Both concern love/desire themes, but the current corpus preserves them as different historical formula streams.'),
  ('lot-of-mars-courage','lot','subtype-of','A source-specific named planetary Lot.'),
  ('lot-of-heavy-saturn','lot','subtype-of','A source-specific named planetary Lot.'),
  ('lot-of-jupiter-prosperity-assistance','lot','subtype-of','A source-specific named planetary Lot.'),
  ('lot-of-venus-love-intimacy','lot','subtype-of','A source-specific named planetary Lot.'),
  ('lot-of-mercury-means','lot','subtype-of','A source-specific named planetary Lot.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
