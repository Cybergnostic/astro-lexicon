-- Public-source corroboration: Abū Maʿshar's non-luminary planetary lots.
--
-- These are kept as distinct historical identities rather than silently equated with
-- similarly themed lots in other traditions (for example, Lot of Venus != automatically
-- the Paul-of-Alexandria/Hermetic Lot of Eros).

INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 3','3.12-3.16',
       'Part VIII, Chapter 3, §§3.12-3.16: lots of Saturn, Jupiter, Mars, Venus and Mercury',
       NULL,
       'Direct definition/formula evidence for Abū Maʿshar’s planetary lots.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='3.12-3.16');

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-heavy-saturn','Lot of Heavy Saturn',
   'Abū Maʿshar’s planetary lot of Saturn, calculated by day from Saturn to the Lot of Fortune and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.3.12. One Latin witness calls it a lot of delay; preserve witness variation rather than normalizing it away.','technical',5),
  ('lot-of-jupiter-prosperity-assistance','Lot of Jupiter — Prosperity and Assistance',
   'Abū Maʿshar’s planetary lot of Jupiter, calculated by day from the Lot of Absence to Jupiter and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.3.13. Source describes Jupiter as possessor of prosperity and assistance.','technical',5),
  ('lot-of-mars-courage','Lot of Mars — Courage and Boldness',
   'Abū Maʿshar’s planetary lot of Mars, calculated by day from Mars to the Lot of Fortune and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.3.14. Keep distinct from other traditions’ courage lots unless formula identity is demonstrated.','technical',5),
  ('lot-of-venus-love-intimacy','Lot of Venus — Love and Intimacy',
   'Abū Maʿshar’s planetary lot of Venus, calculated by day from the Lot of Fortune to the Lot of Absence and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.3.15. Do not silently merge with the Hermetic/Pauline Lot of Eros; formulas and source identities differ.','technical',5),
  ('lot-of-mercury-means','Lot of Mercury — Means / Lack of Means',
   'Abū Maʿshar’s planetary lot of Mercury, calculated by day from the Lot of Absence to the Lot of Fortune and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Great Introduction VIII.3.16. The source calls Mercury possessor of means while also calling the lot one of poverty and lack of means; preserve this tension as source-specific wording.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Saturn','English','short-source-variant','Short planetary label for Abū Maʿshar’s Heavy Saturn lot.' FROM terms WHERE slug='lot-of-heavy-saturn';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Jupiter','English','short-source-variant','Short planetary label.' FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Courage','English','translation-variant','A concise witness-compatible name for Abū Maʿshar’s Mars lot.' FROM terms WHERE slug='lot-of-mars-courage';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Venus','English','short-source-variant','Short planetary label.' FROM terms WHERE slug='lot-of-venus-love-intimacy';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Love','English','translation-variant','A Latin-witness-compatible rendering of the Venus lot.' FROM terms WHERE slug='lot-of-venus-love-intimacy';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Mercury','English','short-source-variant','Short planetary label.' FROM terms WHERE slug='lot-of-mercury-means';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named planetary lot.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug IN ('lot-of-heavy-saturn','lot-of-jupiter-prosperity-assistance','lot-of-mars-courage','lot-of-venus-love-intimacy','lot-of-mercury-means')
  AND b.slug='lot';

-- Similar theme, distinct historical identity.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both concern love/desire, but they belong to different transmitted formula streams and should not be treated as synonyms without source evidence.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-venus-love-intimacy' AND b.slug='lot-of-eros';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('lot-of-heavy-saturn','Abū Maʿshar defines the lot of Heavy Saturn from Saturn to the Lot of Fortune by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 3, §3.12'),
    ('lot-of-jupiter-prosperity-assistance','Abū Maʿshar defines Jupiter’s lot, called the possessor of prosperity and assistance, from the Lot of Absence to Jupiter by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 3, §3.13'),
    ('lot-of-mars-courage','Abū Maʿshar defines Mars’s lot, the possessor of courage and boldness, from Mars to the Lot of Fortune by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 3, §3.14'),
    ('lot-of-venus-love-intimacy','Abū Maʿshar defines Venus’s lot, the possessor of love and intimacy, from the Lot of Fortune to the Lot of Absence by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 3, §3.15'),
    ('lot-of-mercury-means','Abū Maʿshar defines Mercury’s lot from the Lot of Absence to the Lot of Fortune by day and in reverse by night, projected from the Ascendant, with source wording combining means with poverty/lack of means.','Part VIII, Chapter 3, §3.16')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope);

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug IN ('lot-of-heavy-saturn','lot-of-jupiter-prosperity-assistance','lot-of-mars-courage','lot-of-venus-love-intimacy','lot-of-mercury-means')
  AND sp.book='Part VIII' AND sp.section='3.12-3.16';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Lot of Heavy Saturn is Abū Maʿshar’s Saturnian planetary lot. Its source identity is broader than a single modern keyword and should be kept tied to this formula stream.','reviewed','VIII.3.12.' FROM terms WHERE slug='lot-of-heavy-saturn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Lot of Fortune - Saturn. Night: Ascendant + Saturn - Lot of Fortune.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-heavy-saturn';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar calls Jupiter’s planetary lot the possessor of prosperity and assistance. It belongs to his explicit seven-planet lot system.','reviewed','VIII.3.13.' FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Jupiter - Lot of Absence. Night: Ascendant + Lot of Absence - Jupiter.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-jupiter-prosperity-assistance';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar’s Mars lot is explicitly associated with courage and boldness. Similar names occur in other lot traditions, so formula and source identity matter when comparing them.','reviewed','VIII.3.14.' FROM terms WHERE slug='lot-of-mars-courage';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Lot of Fortune - Mars. Night: Ascendant + Mars - Lot of Fortune.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-mars-courage';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar’s Lot of Venus is the possessor of love and intimacy. It is historically related in theme to Eros/love lots, but its formula is distinct and the lexicon therefore keeps it separate.','reviewed','VIII.3.15; explicit non-equivalence note added for cross-tradition clarity.' FROM terms WHERE slug='lot-of-venus-love-intimacy';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Lot of Absence - Lot of Fortune. Night: Ascendant + Lot of Fortune - Lot of Absence.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-venus-love-intimacy';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Abū Maʿshar’s Mercury lot has unusually ambivalent source wording: Mercury is called possessor of means while the lot is also described as one of poverty and lack of means. The encyclopedia preserves that historical wording rather than forcing it into a single modern keyword.','reviewed','VIII.3.16.' FROM terms WHERE slug='lot-of-mercury-means';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Lot of Fortune - Lot of Absence. Night: Ascendant + Lot of Absence - Lot of Fortune.',10,'reviewed',NULL FROM terms WHERE slug='lot-of-mercury-means';
