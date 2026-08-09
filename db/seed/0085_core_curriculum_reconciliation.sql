-- Final reconciliation for the 40-lesson core curriculum -> lexicon discovery stage.
--
-- A late gap pass introduced several labels that duplicate older, better sourced
-- canonical identities created during the historical foundation audit. Normalize
-- those labels back onto the existing terms and remove the redundant identities.
-- This seed intentionally does NOT add analytical workflows or course methods.

-- -----------------------------------------------------------------------------
-- PRESERVE USEFUL NEW LABELS AS ALIASES OF THE OLDER CANONICAL TERMS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Quadrupedal Sign','English','name-variant','Normalized from the late curriculum gap pass; canonical identity remains Quadruped Sign.'
FROM terms WHERE slug='quadruped-sign';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Fertile Sign','English','name-variant','Normalized from the late curriculum gap pass; canonical identity remains Fecund Sign.'
FROM terms WHERE slug='fecund-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Fruitful Sign','English','historical-equivalent','Common historical English equivalent of fecund sign.'
FROM terms WHERE slug='fecund-sign';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Sign of Long Ascension','English','singular-form','Singular form of the canonical straight/long-rising sign class.'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs of Long Ascension','English','name-variant','Later descriptive equivalent of straight/long-rising signs.'
FROM terms WHERE slug='straight-rising-signs';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Sign of Short Ascension','English','singular-form','Singular form of the canonical crooked/short-rising sign class.'
FROM terms WHERE slug='crooked-rising-signs';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs of Short Ascension','English','name-variant','Later descriptive equivalent of crooked/short-rising signs.'
FROM terms WHERE slug='crooked-rising-signs';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Obeying Sign','English','singular-form','Singular form of the canonical obedient-sign class.'
FROM terms WHERE slug='obedient-signs';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Obeying Signs','English','name-variant','Common equivalent of obedient signs.'
FROM terms WHERE slug='obedient-signs';

-- Voice taxonomy: retain the historically sourced four-level classes already in
-- the corpus instead of maintaining a parallel generic hierarchy.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Vocal Sign','English','normalized-equivalent','Late curriculum label normalized to the strongest historical voice class.'
FROM terms WHERE slug='powerful-voiced-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Semi-vocal Sign','English','normalized-equivalent','Late curriculum label normalized to the half/moderate-voiced class.'
FROM terms WHERE slug='half-voiced-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Silent Sign','English','normalized-equivalent','Late curriculum label normalized to the weak-voiced class; source wording should control finer distinctions.'
FROM terms WHERE slug='weak-voiced-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Mute Sign','English','later-form','Common later label for the canonical voiceless-sign class.'
FROM terms WHERE slug='voiceless-sign';

-- -----------------------------------------------------------------------------
-- REMOVE REDUNDANT LATE-PASS IDENTITIES
-- Their aliases and relations cascade safely. They have no public historical
-- interpretations; the older canonical terms own the historical evidence.
-- -----------------------------------------------------------------------------
DELETE FROM terms WHERE slug IN (
  'quadrupedal-sign',
  'vocal-sign',
  'semi-vocal-sign',
  'silent-sign',
  'mute-sign',
  'fertile-sign',
  'sign-of-long-ascension',
  'sign-of-short-ascension',
  'obeying-sign'
);

-- `commanding-sign` is retained provisionally because the existing historical
-- ontology contains the obedient class but no directly equivalent canonical
-- commanding identity. It remains queued for public-source corroboration.
