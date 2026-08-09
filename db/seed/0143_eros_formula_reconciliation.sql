-- Public-source / scholarship reconciliation: Lot of Eros.
--
-- The earlier curriculum-guided seed retained a provisional Venus/Fortune formula.
-- That lead is superseded here. Modern scholarship on the ancient transmission
-- confirms two distinct Eros formula families: one using Daimon/Spirit and Venus,
-- and another using Fortune and Daimon/Spirit. The Paulus/Olympiodorus stream is
-- represented here as Asc + Venus - Spirit by day and reversed by night.
--
-- This pass deliberately does NOT merge Eros with Abū Maʿshar's separate Venus
-- planetary Lot of Love and Intimacy.

PRAGMA foreign_keys = ON;

-- Reuse the already-onboarded modern historian, adding the Eros-specific article.
INSERT OR IGNORE INTO works
  (author_id,slug,title,language,notes,corpus_status)
SELECT id,
       'greenbaum-from-love-to-desire',
       'From Love to Desire: The Lot of Eros in Hellenistic Astrology',
       'English',
       'Modern scholarly article on the history and calculation of the Lot of Eros. DOI 10.24310/mhnh.vi15.15646. Copyrighted article text is not stored in the repository; bibliographic metadata and original paraphrase only.',
       'partial'
FROM authors WHERE slug='dorian-gieseler-greenbaum';

INSERT OR IGNORE INTO editions
  (work_id,label,publisher,publication_year,target_language,copyright_note,local_source_key)
SELECT id,
       'MHNH journal article / public abstract',
       'MHNH: Revista Internacional de Investigación sobre Magia y Astrología Antiguas',
       2015,
       'English',
       'Copyrighted modern scholarship; store bibliographic metadata and original paraphrase only.',
       'greenbaum-from-love-to-desire'
FROM works WHERE slug='greenbaum-from-love-to-desire';

INSERT INTO source_passages
  (edition_id,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,'Abstract / formula-transmission summary',
       'Public abstract: the Lot of Eros has two transmitted formulae, one involving Fortune and Daimon and another involving Daimon and Venus.',
       NULL,
       'Used to establish that Eros has multiple ancient formula streams. No copyrighted article text stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='greenbaum-from-love-to-desire'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Abstract / formula-transmission summary'
  );

-- Correct the canonical identity and explicitly retire the provisional Venus/Fortune lead.
UPDATE terms SET
  short_definition='A Hellenistic calculated lot associated with eros, desire, friendship and voluntary attraction. Ancient transmission preserves more than one formula family, including a Paulus/Olympiodorus Venus-and-Spirit construction and a Fortune-and-Spirit construction in another stream.',
  definition_quality=5,
  editorial_notes='The old curriculum-derived Venus/Fortune formula is superseded and must not be used. Modern scholarship confirms two ancient formula families. Keep the Paulus/Olympiodorus Venus-Spirit stream distinct from the Fortune-Spirit stream and from Abū Maʿshar’s separate Venus planetary Lot of Love and Intimacy.'
WHERE slug='lot-of-eros';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Eros is a Hellenistic calculated point associated with desire, attraction, friendship and voluntary inclination. Its transmission is not represented by one universal formula: ancient sources preserve at least two formula families, so the source used should always be stated.',
  'reviewed','Historical-formula reconciliation completed at family level; direct Paulus translation should still be onboarded when available for line-level primary evidence.'
FROM terms WHERE slug='lot-of-eros';

-- Replace the earlier incorrect provisional section by using the same section key.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula traditions',
  'In the Paulus/Olympiodorus stream, the day formula is Ascendant + Venus - Lot of Spirit, with the order reversed by night. A second ancient stream constructs Eros from the Lots of Fortune and Spirit. Because these are historically distinct transmissions, the encyclopedia records them as variants rather than choosing one formula silently.',10,'reviewed',
  'Supersedes the earlier curriculum-derived Venus/Fortune formula. Exact primary-text line evidence for Paulus remains a future source-onboarding task.'
FROM terms WHERE slug='lot-of-eros';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-venus-lot','Not Abū Maʿshar’s Venus planetary lot',
  'Abū Maʿshar’s planetary Lot of Venus — Love and Intimacy belongs to another transmitted formula system. Similar subject matter does not establish formula identity. The two entries therefore remain related but explicitly non-synonymous.',20,'reviewed',NULL
FROM terms WHERE slug='lot-of-eros';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'eros-formula-streams','Eros formula streams',
  'The formula depends on the historical transmission being followed.',
  '["Stream","Day","Night","Status"]',
  '[["Paulus / Olympiodorus","Asc + Venus - Spirit","Asc + Spirit - Venus","Historically attested stream; primary translation still to be onboarded directly"],["Fortune-Spirit stream","Constructed from Fortune and Spirit","Sect reversal in the transmitted stream","Ancient alternative documented by modern scholarship"]]',
  40,'reviewed','Do not collapse these streams or confuse either with Abū Maʿshar’s Venus planetary lot.'
FROM terms WHERE slug='lot-of-eros';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Greenbaum’s historical study identifies two transmitted calculation traditions for the Lot of Eros: one combining Fortune and Daimon/Spirit and another combining Daimon/Spirit and Venus. This establishes formula plurality as part of the history of the term.',
  'Public abstract: two transmitted Eros formulae',
  'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-eros'
  AND w.slug='greenbaum-from-love-to-desire'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Public abstract: two transmitted Eros formulae'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'secondary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lot-of-eros'
  AND w.slug='greenbaum-from-love-to-desire'
  AND i.scope='Public abstract: two transmitted Eros formulae'
  AND sp.section='Abstract / formula-transmission summary';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Love / Eros','English','research-variant','Useful cross-search wording only; do not infer identity with every historical Lot of Love.'
FROM terms WHERE slug='lot-of-eros';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'must-not-be-confused-with',
  'Both concern love or attraction, but Abū Maʿshar’s Venus planetary lot has a different formula and source identity.',
  'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-eros' AND b.slug='lot-of-venus-love-intimacy';
