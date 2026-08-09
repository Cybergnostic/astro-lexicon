-- Public-source expansion: Lilly on Hyleg, Hylegical Places, Alcochoden and Anareta.
--
-- This pass strengthens historical terminology and source provenance only. It does not
-- publish a lifespan-calculation procedure or operational death-prediction workflow.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'527','530','Book III','Chapter CIV','Hyleg, Hylegical Places, Anareta, Alcochodon',
       'Book III, Chapter CIV, pp. 527-530: Lilly defines Hyleg/Apheta, names Hylegical places, discusses the Anareta/Intersector and describes the Alcochodon.',
       NULL,
       'Historical terminology witness. Sensitive operational longevity/death rules are not reproduced in the public article layer.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book III' AND sp.chapter='Chapter CIV'
      AND sp.section='Hyleg, Hylegical Places, Anareta, Alcochodon'
  );

-- HYLEG
UPDATE terms SET
  short_definition='A historical life-giving or prorogating factor in traditional longevity doctrine, called Hyleg, Hylech or Apheta by Lilly and treated by him as a planet or place of heaven used in judging the state of life.',
  definition_quality=5,
  editorial_notes='Direct Lilly witness added from Christian Astrology III.CIV. Historical/descriptive only; no lifespan-prediction workflow.'
WHERE slug='hyleg';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hylech','English historical spelling','source-spelling','Lilly’s spelling variant in Christian Astrology Book III, Chapter CIV.'
FROM terms WHERE slug='hyleg';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Prorogator','English/Latin technical','source-related-term','Lilly uses prorogator for the life-significating role in the same doctrine; related historical role rather than a guaranteed exact synonym in all authors.'
FROM terms WHERE slug='hyleg';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-terminology','Lilly’s terminology',
  'William Lilly heads his discussion “Of the Prorogator of Life, called Hylech, or Hyleg, or Apheta.” He describes the Hyleg as a planet or place of heaven used in the historical doctrine for judging life or its state. The terminology is therefore broader than a single planet-name and belongs to a specific premodern longevity framework.',40,'reviewed','Historical description only; selection/calculation procedure intentionally omitted.'
FROM terms WHERE slug='hyleg';

-- HYLEGICAL PLACE
UPDATE terms SET
  short_definition='A place considered eligible to host or serve as the Hyleg/Apheta within a historical longevity system; Lilly explicitly uses the expressions Hylegiacal and Aphetical places.',
  definition_quality=5,
  editorial_notes='Direct Lilly terminology from Christian Astrology III.CIV. Eligibility lists remain source-specific and are not presented as a modern lifespan method.'
WHERE slug='hylegical-place';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Aphetical Place','English historical','source-variant','Lilly uses Aphetical place in the same chapter for a place fit to host the Apheta/Hyleg.'
FROM terms WHERE slug='hylegical-place';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Hylegiacal Place','English historical spelling','source-spelling','Lilly’s spelling form in Christian Astrology.'
FROM terms WHERE slug='hylegical-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-variation','Eligibility is source-specific',
  'Historical authors do not all use identical eligibility rules for Hylegical places. Lilly supplies one explicit list inside his own Hyleg doctrine, but the encyclopedia treats that as Lilly’s system rather than a universal definition. The term itself means a place accepted as fit for the Hyleg under the rules being used.',20,'reviewed','No source list reproduced as an operational longevity checklist.'
FROM terms WHERE slug='hylegical-place';

-- ANARETA
UPDATE terms SET
  short_definition='A historical term for the killing, destroying or intersicient factor in longevity doctrine, contrasted with the life-significating Hyleg/Apheta.',
  definition_quality=5,
  editorial_notes='Direct Lilly witness added. Descriptive historical terminology only; no death-prediction workflow.'
WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Intersector','English/Latin technical','source-variant','Lilly gives Intersector as a more technical name alongside Anareta.'
FROM terms WHERE slug='anareta';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Intersicient Planet','English historical','source-variant','Lilly’s wording for the destructive/killing factor in the same doctrine.'
FROM terms WHERE slug='anareta';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-skepticism','Lilly records the doctrine but questions it',
  'Lilly reports the older terminology of Anareta, Intersicient Planet and Intersector, but explicitly says he is not satisfied about how properly to identify the factor. That reservation is historically important: the existence of the term does not imply that every traditional author treated its selection as settled.',20,'reviewed','No destructive-event criteria reproduced.'
FROM terms WHERE slug='anareta';

-- ALCOCHODEN
UPDATE terms SET
  short_definition='A planet called the Alcochodon or giver of years in medieval longevity doctrine, selected in relation to the Hyleg according to source-specific rules.',
  definition_quality=5,
  editorial_notes='Direct Lilly witness added from III.CIV. Historical/descriptive only; no planetary-year or lifespan calculation procedure.'
WHERE slug='alcochoden';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Alcochodon','English historical spelling','source-spelling','Lilly’s spelling in Christian Astrology.'
FROM terms WHERE slug='alcochoden';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Giver of Years','English translation','source-gloss','Lilly glosses the Alcochodon as giver of years.'
FROM terms WHERE slug='alcochoden';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-account','Lilly’s account and reservation',
  'Lilly describes the Alcochodon as a planet chosen in relation to the Hyleg and glosses it as the “giver of years.” He then states that he is no more satisfied with the Alcochodon doctrine than with the Hyleg or Anareta and hoped to test it further from experience. The encyclopedia therefore records the concept and its historical role without treating the doctrine as settled or operational.',30,'reviewed','No years table or lifespan procedure included.'
FROM terms WHERE slug='alcochoden';

-- SOURCE INTERPRETATIONS
WITH defs(slug,summary,scope) AS (
  VALUES
    ('hyleg','Lilly calls the prorogator of life Hylech, Hyleg or Apheta and describes it as a planet or place of heaven used within historical longevity doctrine.','Book III, Chapter CIV, pp. 527-528: Hyleg / Apheta'),
    ('hylegical-place','Lilly explicitly uses Hylegiacal and Aphetical place terminology for positions accepted as fit for the Hyleg under his rules.','Book III, Chapter CIV, pp. 527-529: Hylegical places'),
    ('anareta','Lilly records Anareta together with Intersicient Planet and Intersector as names for the destructive factor in longevity doctrine, while expressing doubt about identifying it correctly.','Book III, Chapter CIV, pp. 529-530: Anareta / Intersector'),
    ('alcochoden','Lilly describes the Alcochodon as the giver of years in relation to the Hyleg, but explicitly expresses dissatisfaction with the doctrine and proposes further empirical examination.','Book III, Chapter CIV, pp. 529-530: Alcochodon')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='lilly-christian-astrology'
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
WHERE t.slug IN ('hyleg','hylegical-place','anareta','alcochoden')
  AND w.slug='lilly-christian-astrology'
  AND sp.book='Book III' AND sp.chapter='Chapter CIV'
  AND sp.section='Hyleg, Hylegical Places, Anareta, Alcochodon';

-- Compact terminology map, without operational criteria.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'longevity-terminology','Historical longevity terminology at a glance',
  'A terminology map only; the underlying lifespan-selection procedures are intentionally not reproduced.',
  '["Term","Historical role"]',
  '[["Hyleg / Apheta","Life-significating or prorogating factor"],["Hylegical / Aphetical Place","Position eligible to host the Hyleg under a given system"],["Alcochoden / Alcochodon","Planetary giver/administrator of years in some medieval systems"],["Anareta / Intersector","Destructive or intersicient factor contrasted with the Hyleg"]]',
  60,'reviewed','Descriptive reference table only.'
FROM terms WHERE slug='hyleg';
