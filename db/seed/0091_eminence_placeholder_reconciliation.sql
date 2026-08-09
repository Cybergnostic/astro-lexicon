-- Reconcile broad curriculum labels in the fame/reputation/exaltation semantic field
-- against the more precise historical lot identities recovered from Abū Maʿshar.
--
-- Direct review of Great Introduction Part VIII does not support treating “Lot of Fame”,
-- “Lot of Reputation”, or “Lot of Exaltation” as unique Abū Maʿshar source names.
-- Keep them as editorial navigation labels for now, and point to the historically
-- attested lots of Honour, Well-Known-and-Honoured, High Rank, and Praised-and-Commended.

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGE FOR PRAISED / COMMENDED
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'Part VIII','Chapter 4','4.81',
       'Part VIII, Chapter 4, §4.81: Lot of the Praised and Commended',
       NULL,
       'Direct source for an additional eleventh-place reputation/praise lot.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.81');

-- -----------------------------------------------------------------------------
-- HISTORICAL LOT: PRAISED AND COMMENDED
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-praised-and-commended','Lot of the Praised and Commended',
   'An eleventh-place lot in Abū Maʿshar concerned with praise and commendation, calculated by day from Jupiter to Venus and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Directly attested in Abū Maʿshar, Great Introduction VIII.4.81. Keep distinct from Honour and Well-Known-and-Honoured.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Praise and Commendation','English','translation-variant','Concise English rendering of the source name.'
FROM terms WHERE slug='lot-of-praised-and-commended';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','A named topical lot.','reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-praised-and-commended' AND b.slug='lot';

INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar defines the Lot of the Praised and Commended from Jupiter to Venus by day and in reverse by night, projected from the Ascendant. He associates it with praise or blame received for one’s deeds.',
       'Part VIII, Chapter 4, §4.81','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-praised-and-commended' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII, Chapter 4, §4.81');

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lot-of-praised-and-commended'
  AND w.slug='abu-mashar-great-introduction'
  AND i.scope='Part VIII, Chapter 4, §4.81'
  AND sp.book='Part VIII' AND sp.section='4.81';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of the Praised and Commended is one of Abū Maʿshar’s eleventh-place lots. It concerns praise and commendation and is separate from his Lot of Honour and Lot of the Well-Known and Honoured.',
       'reviewed','Public synthesis anchored to Great Introduction VIII.4.81.'
FROM terms WHERE slug='lot-of-praised-and-commended';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Venus - Jupiter. Night: Ascendant + Jupiter - Venus.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-praised-and-commended';

-- -----------------------------------------------------------------------------
-- GENERIC PLACEHOLDERS BECOME DISAMBIGUATION / NAVIGATION TERMS
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of Fame (generic label)',
  short_definition='An editorial umbrella for historical lots concerned with fame, public recognition, honour or praise. Direct witnesses should be cited under their source-specific names rather than assuming a single universal “Lot of Fame” formula.',
  definition_quality=3,
  editorial_notes='No exact “Lot of Fame” source name was found in the current Abū Maʿshar direct pass. Related source-specific entries include High Rank, Honour, Well-Known-and-Honoured, and Praised-and-Commended. Keep provisional until another historical source establishes a distinct fame lot.'
WHERE slug='lot-of-fame';

UPDATE terms SET
  label='Lot / Part of Reputation (generic label)',
  short_definition='An editorial umbrella for historical lots concerned with reputation, public standing, honour or commendation. It is not yet tied to one unique historical formula.',
  definition_quality=3,
  editorial_notes='No exact “Lot of Reputation” source name was found in the current Abū Maʿshar direct pass. Use source-specific entries such as Honour, Well-Known-and-Honoured, and Praised-and-Commended where appropriate.'
WHERE slug='lot-of-reputation';

UPDATE terms SET
  label='Lot / Part of Exaltation (generic label)',
  short_definition='A provisional editorial label for lots concerned with elevation or exalted standing. In Abū Maʿshar, those meanings occur under more specific lots such as High Rank and Honour rather than under a unique Lot of Exaltation source name.',
  definition_quality=2,
  editorial_notes='No exact “Lot of Exaltation” source name was found in the current Abū Maʿshar direct pass. Preserve as a search/navigation placeholder pending other historical witnesses.'
WHERE slug='lot-of-exaltation';

-- Remove any formula sections accidentally attached later to these umbrellas; source-specific
-- formulas belong on the precise historical entries.
DELETE FROM term_article_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('lot-of-fame','lot-of-reputation','lot-of-exaltation'))
  AND section_key LIKE 'formula%';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       '“Lot of Fame” is currently an editorial navigation label rather than a single historically verified formula in this lexicon. Historical sources distinguish several different calculated points for high rank, honour, public recognition and praise. Use those source-specific entries when possible.',
       'reviewed','Disambiguation article; provisional as a standalone historical identity.'
FROM terms WHERE slug='lot-of-fame';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       '“Lot of Reputation” is currently an editorial navigation label. The historical corpus distinguishes more precise lots for honour, being well known and honoured, and being praised and commended rather than one universal reputation formula.',
       'reviewed','Disambiguation article; provisional as a standalone historical identity.'
FROM terms WHERE slug='lot-of-reputation';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       '“Lot of Exaltation” remains a provisional editorial label. In the current direct source pass, meanings of elevation and exalted standing belong chiefly to the Lot of High Rank and Lot of Honour, not to a uniquely named Abū Maʿshar Lot of Exaltation.',
       'reviewed','Disambiguation article pending other historical witnesses.'
FROM terms WHERE slug='lot-of-exaltation';

-- -----------------------------------------------------------------------------
-- RELATIONS FROM GENERIC LABELS TO PRECISE HISTORICAL ENTRIES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT g.id,s.id,'related-to','A source-specific historical lot in the same fame/reputation semantic field.','reviewed'
FROM terms g CROSS JOIN terms s
WHERE g.slug='lot-of-fame'
  AND s.slug IN ('lot-of-rank','lot-of-honour','lot-of-well-known-and-honoured','lot-of-praised-and-commended');

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT g.id,s.id,'related-to','A source-specific historical lot in the same reputation/public-standing semantic field.','reviewed'
FROM terms g CROSS JOIN terms s
WHERE g.slug='lot-of-reputation'
  AND s.slug IN ('lot-of-honour','lot-of-well-known-and-honoured','lot-of-praised-and-commended');

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT g.id,s.id,'related-to','A source-specific historical lot carrying elevation or exalted-standing meanings.','reviewed'
FROM terms g CROSS JOIN terms s
WHERE g.slug='lot-of-exaltation'
  AND s.slug IN ('lot-of-rank','lot-of-honour');
