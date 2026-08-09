-- Public-source reconciliation: similarly named courage/victory/necessity lots in Abū Maʿshar.
--
-- This pass prevents historically distinct formula streams from collapsing merely because
-- later English labels overlap. It keeps the planetary lots separate from the additional
-- non-place lots and splits the two necessity traditions preserved by Abū Maʿshar.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- DIRECT SOURCE PASSAGES
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'843','844','Part VIII','Chapter 3','3.13-3.14',
       'Part VIII, Chapter 3, §§3.13-3.14: Jupiter lot of prosperity/assistance/victory and Mars lot of courage/boldness',
       NULL,
       'Direct evidence clarifying that victory belongs to Jupiter’s planetary lot and courage/boldness to Mars’s planetary lot.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='3.13-3.14'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'913','934','Part VIII','Chapters 5-6','5.4-5.7; 6.16',
       'Part VIII, §§5.4-5.7 and §6.16: chivalry/bravery, courage/violence/combat, place of need, and Egyptian/Persian necessity lots',
       NULL,
       'Direct evidence for additional non-place lots that must remain distinct from the planetary Mars/Jupiter lots.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='5.4-5.7; 6.16'
  );

-- -----------------------------------------------------------------------------
-- JUPITER PLANETARY LOT: make Victory explicit without creating a duplicate lot.
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot of Jupiter — Prosperity, Support and Victory',
  short_definition='Abū Maʿshar’s planetary lot of Jupiter, associated with prosperity, support and victory and calculated by day from the Lot of Absence to Jupiter and by night in reverse, projected from the Ascendant.',
  editorial_notes='Great Introduction VIII.3.13 and VIII.6.3. Victory is part of this source identity; do not create a second generic Lot of Victory for the same formula stream.',
  definition_quality=5
WHERE slug='lot-of-jupiter-prosperity-assistance';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Victory','English','source-derived-short-name','Useful search alias for Abū Maʿshar’s Jupiter lot, whose source name includes prosperity, support and victory; not a separate canonical formula.'
FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Prosperity, Support and Victory','English','translation-variant','Expanded source-compatible English label.'
FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'identity','Victory is part of the Jupiter-lot identity',
  'In Abū Maʿshar’s seven-planet lot system, victory is not a separate generic calculated point alongside this Jupiter lot. The source groups prosperity, support/assistance and victory within the same Jupiterian lot. A short label such as “Lot of Victory” should therefore be treated as an alias for this source-specific identity only when the formula matches.',20,'reviewed',NULL
FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';

-- -----------------------------------------------------------------------------
-- MARS PLANETARY LOT versus distinct additional courage lot.
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot of Mars — Boldness and Courage',
  short_definition='Abū Maʿshar’s planetary lot of Mars, associated with boldness and courage and calculated by day from Mars to the Lot of Fortune and by night in reverse, projected from the Ascendant.',
  editorial_notes='Great Introduction VIII.3.14 and VIII.6.3. Keep distinct from the additional Lot of Courage, Violence and Combat in VIII.5.5/6.16.',
  definition_quality=5
WHERE slug='lot-of-mars-courage';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-other-courage','Not the same as every “Lot of Courage”',
  'Abū Maʿshar also preserves a separate additional lot called the Lot of Courage, Violence and Combat. The two lots have different formula components, so the shared English word courage does not make them synonyms. Formula and source identity must be checked before merging labels.',20,'reviewed',NULL
FROM terms WHERE slug='lot-of-mars-courage';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-courage-violence-combat','Lot of Courage, Violence and Combat',
   'A distinct additional lot in Abū Maʿshar, calculated by day from the Lord of the Ascendant to the Moon and by night in reverse, projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.5.5 and VIII.6.16. Distinct from the planetary Mars lot despite overlapping courage terminology.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Courage','English','short-source-variant','Short form can be ambiguous because Abū Maʿshar also has a Mars planetary lot associated with courage; prefer the expanded canonical label.'
FROM terms WHERE slug='lot-of-courage-violence-combat';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Fierceness','Latin-witness English','witness-variant','One Latin witness renders the lot with a fierceness/feritas label; preserve as a witness variant.'
FROM terms WHERE slug='lot-of-courage-violence-combat';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named additional lot outside the seven-planet and twelve-place groups in Abū Maʿshar.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-courage-violence-combat' AND b.slug='lot';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','The two lots overlap in courage terminology but use different formulas and are distinct source identities.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-courage-violence-combat' AND b.slug='lot-of-mars-courage';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Courage, Violence and Combat is one of Abū Maʿshar’s additional lots outside the seven planetary lots and the lots assigned to the twelve places. Its name overlaps with the courage language of the Mars planetary lot, but its construction is different and it must be indexed separately.',
  'reviewed','Directly source-backed distinction; no violent-event prediction workflow imported.'
FROM terms WHERE slug='lot-of-courage-violence-combat';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
  'Day: Ascendant + Moon - Lord of the Ascendant. Night: Ascendant + Lord of the Ascendant - Moon.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-courage-violence-combat';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Distinct from the planetary Mars lot',
  'The planetary Mars lot measures between Mars and the Lot of Fortune. This additional lot instead measures between the Lord of the Ascendant and the Moon. Their overlapping names describe related themes, not formula identity.',20,'reviewed','Descriptive comparison only.'
FROM terms WHERE slug='lot-of-courage-violence-combat';

-- -----------------------------------------------------------------------------
-- CHIVALRY / BRAVERY: another distinct courage-adjacent lot.
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-chivalry-bravery','Lot of Chivalry and Bravery',
   'A distinct additional lot in Abū Maʿshar, calculated by day from Saturn to the Moon and by night in reverse, projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.5.4 and VIII.6.16. Keep separate from both Mars’s planetary lot and the Lot of Courage, Violence and Combat.','technical',5);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Chivalry','English','short-source-variant','Short form of Abū Maʿshar’s chivalry/bravery lot.'
FROM terms WHERE slug='lot-of-chivalry-bravery';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named additional lot outside the main planetary/place groups.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-chivalry-bravery' AND b.slug='lot';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Chivalry and Bravery is another courage-adjacent lot preserved by Abū Maʿshar. It has its own Saturn–Moon construction and should not be collapsed into the Mars planetary lot or the separate Lot of Courage, Violence and Combat.',
  'reviewed','Direct source identity only; historical social/martial implications remain in source accounts.'
FROM terms WHERE slug='lot-of-chivalry-bravery';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'formula','Formula','Day: Ascendant + Moon - Saturn. Night: Ascendant + Saturn - Moon.',10,'reviewed'
FROM terms WHERE slug='lot-of-chivalry-bravery';

-- -----------------------------------------------------------------------------
-- NECESSITY: umbrella + Egyptian and Persian formula streams.
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-necessity','Lots of Necessity',
   'An editorial umbrella for distinct necessity lots preserved by Abū Maʿshar, including Egyptian and Persian formula streams.',
   'lots','reviewed','Navigation/disambiguation umbrella. Do not assign one universal formula to the label.','technical',4),
  ('egyptian-lot-of-necessity','Egyptian Lot of Necessity and Delay',
   'A necessity lot attributed by Abū Maʿshar to the Egyptians, calculated in both day and night charts from Mars to the degree of the third place / place of brothers and projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.6.16; source calls it the lot of necessity and delay of what one needs according to the Egyptians.','technical',5),
  ('persian-lot-of-necessity','Persian Lot of Necessity and Delay',
   'A necessity lot attributed by Abū Maʿshar to the Persians, calculated in both day and night charts from the Lot of Familiarity and Love to Mercury and projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.6.16; distinct from the Egyptian necessity formula.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Necessity','English','short-name','Ambiguous umbrella label; use source-specific child entries for formulas.'
FROM terms WHERE slug='lot-of-necessity';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Egyptian Lot of Necessity','English','short-source-variant','Short source-specific label.'
FROM terms WHERE slug='egyptian-lot-of-necessity';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Persian Lot of Necessity','English','short-source-variant','Short source-specific label.'
FROM terms WHERE slug='persian-lot-of-necessity';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT child.id,parent.id,'subtype-of','A source-specific necessity lot.','reviewed'
FROM terms child CROSS JOIN terms parent
WHERE child.slug IN ('egyptian-lot-of-necessity','persian-lot-of-necessity')
  AND parent.slug='lot-of-necessity';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','An umbrella family of named lots.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='lot-of-necessity' AND b.slug='lot';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Abū Maʿshar preserves more than one Lot of Necessity. The generic label is therefore used here only as a disambiguation umbrella: the Egyptian and Persian streams have different constructions and their own entries.',
  'reviewed','No generic formula intentionally assigned.'
FROM terms WHERE slug='lot-of-necessity';
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'necessity-variants','Necessity lots in Abū Maʿshar',
  'Two source-specific formula streams are preserved and should not be merged.',
  '["Tradition","Formula (day and night)"]',
  '[["Egyptian","Asc + degree of the third place / place of brothers - Mars"],["Persian","Asc + Mercury - Lot of Familiarity and Love"]]',
  20,'reviewed','Formula notation follows the project convention Asc + B - A.'
FROM terms WHERE slug='lot-of-necessity';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Egyptian Lot of Necessity and Delay is one of the additional lots summarized by Abū Maʿshar. It uses the same construction by day and night and is explicitly distinguished from a separate Persian necessity lot.',
  'reviewed','Direct source formula; historical interpretation remains source-specific.'
FROM terms WHERE slug='egyptian-lot-of-necessity';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'formula','Formula','Day and night: Ascendant + degree of the third place / place of brothers - Mars.',10,'reviewed'
FROM terms WHERE slug='egyptian-lot-of-necessity';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Persian Lot of Necessity and Delay is the second necessity stream preserved by Abū Maʿshar. Its formula uses the Lot of Familiarity and Love together with Mercury and does not reverse by sect.',
  'reviewed','Direct source formula; preserve source-specific naming.'
FROM terms WHERE slug='persian-lot-of-necessity';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'formula','Formula','Day and night: Ascendant + Mercury - Lot of Familiarity and Love.',10,'reviewed'
FROM terms WHERE slug='persian-lot-of-necessity';

-- -----------------------------------------------------------------------------
-- SOURCE INTERPRETATIONS / CITATIONS
-- -----------------------------------------------------------------------------
WITH defs(slug,summary,scope,section_key) AS (
  VALUES
    ('lot-of-jupiter-prosperity-assistance','Abū Maʿshar’s Jupiter lot explicitly signifies prosperity, support/assistance and victory; the formula is taken by day from the Lot of Absence to Jupiter and by night in reverse.','Part VIII, Chapter 3, §3.13','3.13-3.14'),
    ('lot-of-mars-courage','Abū Maʿshar’s planetary Mars lot is the possessor of courage and boldness, taken by day from Mars to the Lot of Fortune and by night in reverse.','Part VIII, Chapter 3, §3.14','3.13-3.14'),
    ('lot-of-chivalry-bravery','Abū Maʿshar preserves a separate Lot of Chivalry and Bravery, taken by day from Saturn to the Moon and by night in reverse.','Part VIII, Chapter 5, §5.4','5.4-5.7; 6.16'),
    ('lot-of-courage-violence-combat','Abū Maʿshar preserves a distinct Lot of Courage, Violence and Combat, taken by day from the Lord of the Ascendant to the Moon and by night in reverse.','Part VIII, Chapter 5, §5.5','5.4-5.7; 6.16'),
    ('egyptian-lot-of-necessity','In his summary, Abū Maʿshar gives the Egyptian Lot of Necessity and Delay in both day and night charts from Mars to the degree of the place of brothers, projected from the Ascendant.','Part VIII, Chapter 6, §6.16','5.4-5.7; 6.16'),
    ('persian-lot-of-necessity','In his summary, Abū Maʿshar gives the Persian Lot of Necessity and Delay in both day and night charts from the Lot of Familiarity and Love to Mercury, projected from the Ascendant.','Part VIII, Chapter 6, §6.16','5.4-5.7; 6.16')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND (
    (t.slug IN ('lot-of-jupiter-prosperity-assistance','lot-of-mars-courage') AND sp.section='3.13-3.14')
    OR
    (t.slug IN ('lot-of-chivalry-bravery','lot-of-courage-violence-combat','egyptian-lot-of-necessity','persian-lot-of-necessity') AND sp.section='5.4-5.7; 6.16')
  );

-- Reader-facing disambiguation table on the general Lot page.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'courage-victory-necessity-disambiguation','Similar English labels, different historical lots',
  'Shared themes or translation words do not establish formula identity.',
  '["Entry","Source identity","Formula core"]',
  '[["Jupiter — Prosperity, Support and Victory","Planetary lot","Absence → Jupiter; reverses by sect"],["Mars — Boldness and Courage","Planetary lot","Mars → Fortune; reverses by sect"],["Chivalry and Bravery","Additional lot","Saturn → Moon; reverses by sect"],["Courage, Violence and Combat","Additional lot","Lord Ascendant → Moon; reverses by sect"],["Egyptian Necessity","Additional lot","Mars → third-place degree; same day/night"],["Persian Necessity","Additional lot","Familiarity/Love → Mercury; same day/night"]]',
  95,'reviewed','Disambiguation/reference table only.'
FROM terms WHERE slug='lot';
