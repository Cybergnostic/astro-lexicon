-- Provenance cleanup for lot entries that remain lexically useful but are not yet
-- directly corroborated from a public historical witness in the current source pass.
-- Do not promote provisional formulas into the same visual authority as resolved lots.

UPDATE terms SET
  definition_quality=3,
  editorial_notes='Named lot retained from the curriculum-guided discovery layer. The currently stored Venus/Jupiter formula remains provisional until a direct public historical witness is identified. Do not present it as universally canonical.'
WHERE slug='lot-of-divorce';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot or Part of Divorce is retained as a historically plausible named relationship lot because it appears in the study corpus, but its current formula has not yet been directly reconciled against a public historical witness. The entry therefore records the identity cautiously rather than presenting the provisional calculation as settled doctrine.',
  'reviewed','Public-source reconciliation still open; formula remains provisional.'
FROM terms WHERE slug='lot-of-divorce';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-status','Source status',
  'The currently stored sect-dependent Venus/Jupiter construction is a curriculum-derived lead, not yet a directly corroborated public-source formula. It should be treated as a research candidate until a historical witness establishes the naming and calculation together.',20,'reviewed','Explicit uncertainty marker.'
FROM terms WHERE slug='lot-of-divorce';

UPDATE terms SET
  definition_quality=3,
  editorial_notes='Named Eros lot retained from curriculum-guided discovery. Do not equate automatically with Abū Maʿshar’s distinct Venus planetary lot of Love and Intimacy. Direct Pauline/Hermetic source-family corroboration remains open.'
WHERE slug='lot-of-eros';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lot of Eros is retained as a distinct historical-research identity for a lot associated with eros, desire or attraction. The current corpus also contains Abū Maʿshar’s separate Venus planetary lot of Love and Intimacy, whose formula is different; the two are therefore not treated as synonyms.',
  'reviewed','Direct public-source reconciliation for the Eros formula remains open.'
FROM terms WHERE slug='lot-of-eros';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-status','Source status',
  'The currently stored Venus/Fortune construction is retained as a provisional research lead. A direct source in the relevant Pauline or Hermetic transmission is still needed before the formula can be promoted to the same status as the directly corroborated Abū Maʿshar lots.',20,'reviewed','Explicit uncertainty marker.'
FROM terms WHERE slug='lot-of-eros';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'must-not-be-confused-with',
  'Both concern love or desire, but the current corpus preserves different formula streams and only the Abū Maʿshar Venus lot is directly corroborated here.',
  'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lot-of-eros' AND b.slug='lot-of-venus-love-intimacy';
