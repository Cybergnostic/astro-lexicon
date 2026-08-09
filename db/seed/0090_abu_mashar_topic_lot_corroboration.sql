-- Public-source corroboration pass: Abū Maʿshar topic lots outside the family/eminence batches.
--
-- This seed upgrades curriculum-discovered placeholders from direct Part VIII evidence
-- and separates historically distinct lots that had previously been grouped under broad
-- modern labels. It remains a lexicon migration: no chart-analysis workflow is imported.

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGES
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.52-4.58',
       'Part VIII, Chapter 4, §§4.52-4.58: journey, travel on water, piety, intelligence/depth of thought, knowledge/understanding, gossip and truth of rumours',
       NULL,
       'Definition- and formula-level evidence for ninth-place lots.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.52-4.58');

INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.77',
       'Part VIII, Chapter 4, §4.77: Lot of Friends and Brothers',
       NULL,
       'Direct definition and formula for the friends lot.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.77');

INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.82-4.83',
       'Part VIII, Chapter 4, §§4.82-4.83: two Lots of Enemies, one attributed to some Ancients and one to Hermes',
       NULL,
       'Direct evidence that Abū Maʿshar preserves two distinct twelfth-place enemy lots.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.82-4.83');

INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.30',
       'Part VIII, Chapter 4, §4.30: Lot of Captives and Bondage',
       NULL,
       'Direct evidence for the term previously stored under the generic modern label Lot of Imprisonment.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.30');

INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.47',
       'Part VIII, Chapter 4, §4.47: Lot of Death',
       NULL,
       'Historical terminology/formula evidence only. Do not turn this lexicon entry into a lifespan or death-prediction procedure.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.47');

-- -----------------------------------------------------------------------------
-- JOURNEY / PIETY / KNOWLEDGE
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of the Journey',
  short_definition='A ninth-place lot in Abū Maʿshar for journeys, calculated in both day and night charts from the ruler of the ninth place to the degree of the ninth place and projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar, Great Introduction VIII.4.52. The source uses the ruler-to-place pattern without sect reversal.'
WHERE slug='lot-of-travel';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of the Journey','English','source-name','Direct source wording in Abū Maʿshar VIII.4.52.' FROM terms WHERE slug='lot-of-travel';

UPDATE terms SET
  label='Lot / Part of Piety',
  short_definition='A ninth-place lot in Abū Maʿshar associated with piety, calculated by day from the Moon to Mercury and by night in reverse, then projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.54. The curriculum label “Faith” is retained as an English thematic alias rather than treated as the source name.'
WHERE slug='lot-of-faith';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Piety','English','source-name','Direct source wording in Abū Maʿshar VIII.4.54.' FROM terms WHERE slug='lot-of-faith';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Faith','English','thematic-variant','Earlier curriculum-facing English label; source wording is piety.' FROM terms WHERE slug='lot-of-faith';

UPDATE terms SET
  label='Lot / Part of Knowledge and Understanding',
  short_definition='A ninth-place lot in Abū Maʿshar for knowledge and understanding, measured by day from Saturn to Jupiter and by night in reverse, with the resulting arc projected from Mercury rather than from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.56. The non-Ascendant projection from Mercury is essential to this formula.'
WHERE slug='lot-of-knowledge';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Knowledge and Understanding','English','source-name','Direct source wording in Abū Maʿshar VIII.4.56.' FROM terms WHERE slug='lot-of-knowledge';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-travel-on-water','Lot of Travel on Water',
   'A ninth-place lot in Abū Maʿshar specifically for travel by water, calculated by day from Saturn to 15° Cancer and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Directly attested in Abū Maʿshar VIII.4.53. Keep separate from the general Lot of the Journey.','technical',5),
  ('lot-of-intelligence-and-depth-of-thought','Lot of Intelligence and Depth of Thought',
   'A ninth-place lot in Abū Maʿshar associated with intelligence and depth of thought, calculated by day from Saturn to the Moon and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Directly attested in Abū Maʿshar formula summary VIII.6.12b; source wording varies slightly across witnesses.','technical',5);

-- -----------------------------------------------------------------------------
-- FRIENDS
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of Friends and Brothers',
  short_definition='An eleventh-place lot in Abū Maʿshar for friends and brothers, calculated in both day and night charts from the Moon to Mercury and projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.77. The earlier shorter label Lot of Friends is retained as an alias.'
WHERE slug='lot-of-friends';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Friends and Brothers','English','source-name','Direct source wording in Abū Maʿshar VIII.4.77.' FROM terms WHERE slug='lot-of-friends';

-- -----------------------------------------------------------------------------
-- ENEMIES: GENERIC UMBRELLA + DISTINCT HISTORICAL LOTS
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of Enemies (generic label)',
  short_definition='A generic label covering several historically distinct lots concerned with enemies or enmity. Abū Maʿshar preserves at least two different twelfth-place enemy lots, while the planetary/Hermetic lot tradition uses another Saturn-related lot.',
  definition_quality=4,
  editorial_notes='Do not attach one universal formula to this umbrella. Use the source-specific child entries for Abū Maʿshar’s Ancients and Hermes formulas; keep the planetary Saturn/Nemesis stream separate.'
WHERE slug='lot-of-enemies';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-enemies-ancients','Lot of Enemies according to some of the Ancients',
   'A twelfth-place enemy lot in Abū Maʿshar, calculated in both day and night charts from Saturn to Mars and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.82. Preserve separately from the Hermes enemy lot and from planetary/Hermetic Saturn lots.','technical',5),
  ('lot-of-enemies-hermes','Hermes’ Lot of Enemies',
   'A twelfth-place enemy lot in Abū Maʿshar attributed to Hermes, calculated from the ruler of the twelfth place to the degree of the twelfth place and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.83. The later chapter-summary wording should be reconciled carefully if its manuscript reading differs.','technical',5);

-- -----------------------------------------------------------------------------
-- CAPTIVES / BONDAGE
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of Captives and Bondage',
  short_definition='A lot in Abū Maʿshar for captives and bondage, calculated by day from the ruler of the Sun’s sign to the Sun and by night from the ruler of the Moon’s sign to the Moon, then projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.30. Earlier label “Lot of Imprisonment” is retained only as a convenient English alias.'
WHERE slug='lot-of-imprisonment';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Captives and Bondage','English','source-name','Direct source wording in Abū Maʿshar VIII.4.30.' FROM terms WHERE slug='lot-of-imprisonment';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Imprisonment','English','thematic-variant','Earlier generic English label.' FROM terms WHERE slug='lot-of-imprisonment';

-- -----------------------------------------------------------------------------
-- LOT OF DEATH: HISTORICAL TERM ONLY
-- -----------------------------------------------------------------------------
UPDATE terms SET
  short_definition='A historical eighth-place lot in Abū Maʿshar called the Lot of Death. His principal formula combines the Moon, the eighth-place degree and Saturn’s position within its sign; he also records a different Persian formula.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.47. Keep this entry historical/descriptive. Do not expand it into a practical death- or lifespan-prediction workflow.'
WHERE slug='lot-of-death';

-- -----------------------------------------------------------------------------
-- RELATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed' FROM terms a CROSS JOIN terms b
WHERE a.slug IN ('lot-of-travel-on-water','lot-of-intelligence-and-depth-of-thought','lot-of-enemies-ancients','lot-of-enemies-hermes') AND b.slug='lot';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Source-specific form of the broader editorial enemy-lot category.','reviewed' FROM terms a CROSS JOIN terms b
WHERE a.slug IN ('lot-of-enemies-ancients','lot-of-enemies-hermes') AND b.slug='lot-of-enemies';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','A specialized journey lot specifically for water travel.','reviewed' FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-travel-on-water' AND b.slug='lot-of-travel';

-- -----------------------------------------------------------------------------
-- INTERPRETATIONS + CITATIONS
-- -----------------------------------------------------------------------------
WITH defs(slug,summary,scope,section) AS (
  VALUES
    ('lot-of-travel','Abū Maʿshar defines the Lot of the Journey from the ruler of the ninth place to the degree of the ninth place, projected from the Ascendant, using the same direction by day and night.','Part VIII, Chapter 4, §4.52','4.52-4.58'),
    ('lot-of-travel-on-water','Abū Maʿshar defines a separate Lot of Travel on Water from Saturn to 15° Cancer by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 4, §4.53','4.52-4.58'),
    ('lot-of-faith','Abū Maʿshar calls this the Lot of Piety and extracts it from the Moon to Mercury by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 4, §4.54','4.52-4.58'),
    ('lot-of-intelligence-and-depth-of-thought','Abū Maʿshar lists a distinct ninth-place Lot of Intelligence and Depth of Thought, extracted from Saturn to the Moon by day and in reverse by night, projected from the Ascendant.','Part VIII, ninth-place lots','4.52-4.58'),
    ('lot-of-knowledge','Abū Maʿshar defines the Lot of Knowledge and Understanding from Saturn to Jupiter by day and in reverse by night, unusually projecting the arc from Mercury.','Part VIII, Chapter 4, §4.56','4.52-4.58'),
    ('lot-of-friends','Abū Maʿshar defines the Lot of Friends and Brothers from the Moon to Mercury in both day and night charts, projected from the Ascendant.','Part VIII, Chapter 4, §4.77','4.77'),
    ('lot-of-enemies-ancients','Abū Maʿshar records an enemy lot attributed to some of the Ancients, extracted from Saturn to Mars in both day and night charts and projected from the Ascendant.','Part VIII, Chapter 4, §4.82','4.82-4.83'),
    ('lot-of-enemies-hermes','Abū Maʿshar records a second enemy lot attributed to Hermes, extracted from the ruler of the enemies place to the degree of that place and projected from the Ascendant.','Part VIII, Chapter 4, §4.83','4.82-4.83'),
    ('lot-of-imprisonment','Abū Maʿshar calls this the Lot of Captives and Bondage. By day it is measured from the ruler of the Sun’s sign to the Sun; by night from the ruler of the Moon’s sign to the Moon; it is projected from the Ascendant.','Part VIII, Chapter 4, §4.30','4.30'),
    ('lot-of-death','Abū Maʿshar explicitly preserves a historical Lot of Death in the eighth-place lot catalogue, giving a principal Hermes formula and also reporting a different Persian formula.','Part VIII, Chapter 4, §4.47','4.47')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope);

WITH map(slug,scope,section) AS (
  VALUES
    ('lot-of-travel','Part VIII, Chapter 4, §4.52','4.52-4.58'),
    ('lot-of-travel-on-water','Part VIII, Chapter 4, §4.53','4.52-4.58'),
    ('lot-of-faith','Part VIII, Chapter 4, §4.54','4.52-4.58'),
    ('lot-of-intelligence-and-depth-of-thought','Part VIII, ninth-place lots','4.52-4.58'),
    ('lot-of-knowledge','Part VIII, Chapter 4, §4.56','4.52-4.58'),
    ('lot-of-friends','Part VIII, Chapter 4, §4.77','4.77'),
    ('lot-of-enemies-ancients','Part VIII, Chapter 4, §4.82','4.82-4.83'),
    ('lot-of-enemies-hermes','Part VIII, Chapter 4, §4.83','4.82-4.83'),
    ('lot-of-imprisonment','Part VIII, Chapter 4, §4.30','4.30'),
    ('lot-of-death','Part VIII, Chapter 4, §4.47','4.47')
)
INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM map
JOIN terms t ON t.slug=map.slug
JOIN works w ON w.slug='abu-mashar-great-introduction'
JOIN interpretations i ON i.term_id=t.id AND i.work_id=w.id AND i.scope=map.scope
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section=map.section;

-- -----------------------------------------------------------------------------
-- ARTICLE LAYER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar’s Lot of the Journey is a named calculated point for journeys. Its formula belongs to the common family in which the ruler of a topical place is measured to that place itself, and the distance is projected from the Ascendant.','reviewed','Anchored to Great Introduction VIII.4.52.' FROM terms WHERE slug='lot-of-travel';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + ninth-place degree - ruler of the ninth place.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-travel';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Piety is a ninth-place lot in Abū Maʿshar. The earlier English label “Lot of Faith” points to the same broad semantic field, but “piety” is the closer wording of this direct witness.','reviewed','Anchored to VIII.4.54.' FROM terms WHERE slug='lot-of-faith';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Mercury - Moon. Night: Ascendant + Moon - Mercury.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-faith';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar’s Lot of Knowledge and Understanding combines Saturn, Jupiter and Mercury. Unlike most topical lots in this group, the measured arc is projected from Mercury rather than from the Ascendant.','reviewed','Anchored to VIII.4.56.' FROM terms WHERE slug='lot-of-knowledge';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Mercury + Jupiter - Saturn. Night: Mercury + Saturn - Jupiter.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-knowledge';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Friends and Brothers is an eleventh-place lot in Abū Maʿshar. He derives it from the Moon and Mercury and uses the same direction of extraction in day and night charts.','reviewed','Anchored to VIII.4.77.' FROM terms WHERE slug='lot-of-friends';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Mercury - Moon.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-friends';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'“Lot of Enemies” is best treated as an umbrella label unless the source is specified. Abū Maʿshar explicitly preserves two different twelfth-place enemy lots, while other lot traditions contain still other enemy or Saturn-related calculated points.','reviewed','Disambiguating umbrella; no universal formula.' FROM terms WHERE slug='lot-of-enemies';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar records this twelfth-place enemy lot as a formula used by some of the Ancients. It is distinct from the enemy lot he attributes to Hermes.','reviewed','Anchored to VIII.4.82.' FROM terms WHERE slug='lot-of-enemies-ancients';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Mars - Saturn.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-enemies-ancients';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar attributes this second twelfth-place enemy lot to Hermes. It belongs to the ruler-and-place family of lots and should not be conflated with the Saturn–Mars enemy lot.','reviewed','Anchored to VIII.4.83.' FROM terms WHERE slug='lot-of-enemies-hermes';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + twelfth-place degree - ruler of the twelfth place.',10,'reviewed','The chapter-summary witness should be compared if its wording differs.' FROM terms WHERE slug='lot-of-enemies-hermes';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Captives and Bondage is Abū Maʿshar’s source-specific name for a calculated point concerned with captivity and bondage. “Lot of Imprisonment” is a convenient modern English alias, not the wording of this witness.','reviewed','Anchored to VIII.4.30.' FROM terms WHERE slug='lot-of-imprisonment';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Sun - ruler of the Sun’s sign. Night: Ascendant + Moon - ruler of the Moon’s sign.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-imprisonment';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Death is a historical eighth-place calculated point explicitly transmitted by Abū Maʿshar. The lexicon records the term and its historical formula family without presenting it as a modern factual method for predicting death or lifespan.','reviewed','Historical/descriptive scope only.' FROM terms WHERE slug='lot-of-death';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-family','Historical formula family','Abū Maʿshar’s principal account measures from the Moon to the eighth-place degree using right ascension, then incorporates Saturn’s position within its sign and projects from the beginning of Saturn’s sign. He also records a different Persian Mars–Saturn formula. These should remain source-specific variants.',10,'reviewed','No predictive workflow.' FROM terms WHERE slug='lot-of-death';
