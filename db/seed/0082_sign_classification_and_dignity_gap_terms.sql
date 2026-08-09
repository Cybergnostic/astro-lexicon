-- Gap/deduplication pass over the structured general-astrology curriculum.
-- Keep named historical classifications as lexicon entries; do not turn them into
-- personality claims or analysis workflows.

-- -----------------------------------------------------------------------------
-- SPECIAL SIGN CLASSIFICATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('human-sign','Human Sign',
   'A traditional sign classification for zodiacal signs represented wholly or partly by a human figure.',
   'sign classification','reviewed','Also called humane or biped signs in some sources; exact membership can vary at mixed signs such as Sagittarius.','technical',4),
  ('quadrupedal-sign','Quadrupedal Sign',
   'A traditional sign classification for zodiacal signs represented wholly or partly by four-footed animals.',
   'sign classification','reviewed','Historical classification; mixed signs can be divided by portion in some authorities.','technical',4),
  ('vocal-sign','Vocal Sign',
   'A traditional classification for signs treated as especially associated with voice or articulate sound.',
   'sign classification','reviewed','Membership and terminology vary by author; preserve source-specific tables.','technical',4),
  ('semi-vocal-sign','Semi-vocal Sign',
   'A traditional intermediate classification between vocal and silent or mute signs.',
   'sign classification','provisional','Terminology is translator-dependent and should be expanded from direct historical witnesses.','technical',3),
  ('silent-sign','Silent Sign',
   'A traditional sign classification for signs treated as having little or reduced voice.',
   'sign classification','provisional','Keep distinct from mute signs where a source distinguishes the two categories.','technical',3),
  ('mute-sign','Mute Sign',
   'A traditional sign classification most commonly applied to the water signs because their creatures are voiceless.',
   'sign classification','reviewed','Historical symbolic classification, not a statement about a person’s speech ability.','technical',4),
  ('fertile-sign','Fertile Sign',
   'A traditional classification for signs described as fruitful or fertile, commonly including the water signs.',
   'sign classification','reviewed','Historical astrological vocabulary only; not a medical or fertility assessment. Author-specific memberships should remain visible.','technical',4),
  ('barren-sign','Barren Sign',
   'A traditional classification for signs described as barren or relatively unfruitful.',
   'sign classification','reviewed','Historical astrological vocabulary only; not a medical or fertility assessment. Membership varies by authority.','technical',4),
  ('sign-of-long-ascension','Sign of Long Ascension',
   'A sign that takes a comparatively long time to rise over the eastern horizon at a given terrestrial latitude.',
   'sign classification','reviewed','An astronomical/latitude-dependent classification; northern- and southern-hemisphere assignments reverse.','technical',5),
  ('sign-of-short-ascension','Sign of Short Ascension',
   'A sign that takes a comparatively short time to rise over the eastern horizon at a given terrestrial latitude.',
   'sign classification','reviewed','An astronomical/latitude-dependent classification; northern- and southern-hemisphere assignments reverse.','technical',5),
  ('commanding-sign','Commanding Sign',
   'A traditional relational classification paired with obeying signs, often associated in medieval practice with signs of longer ascension.',
   'sign classification','provisional','The relation between commanding/obeying and ascensional classes should be documented author by author.','technical',3),
  ('obeying-sign','Obeying Sign',
   'A traditional relational classification paired with commanding signs, often associated in medieval practice with signs of shorter ascension.',
   'sign classification','provisional','The relation between commanding/obeying and ascensional classes should be documented author by author.','technical',3);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Humane Sign','English','name-variant','Common English variant.' FROM terms WHERE slug='human-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Biped Sign','English','historical-variant','Often overlaps with human/humane sign classifications.' FROM terms WHERE slug='human-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Four-footed Sign','English','translation-variant','Plain English equivalent of quadrupedal.' FROM terms WHERE slug='quadrupedal-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Fruitful Sign','English','name-variant','Common historical English equivalent.' FROM terms WHERE slug='fertile-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Sterile Sign','English','name-variant','Historical synonym sometimes used for barren signs.' FROM terms WHERE slug='barren-sign';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs of Long Ascension','English','plural-form','Common plural form.' FROM terms WHERE slug='sign-of-long-ascension';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs of Short Ascension','English','plural-form','Common plural form.' FROM terms WHERE slug='sign-of-short-ascension';

-- Stable membership that the curriculum explicitly preserves. Partial-sign cases are
-- left to historical/source-specific interpretations rather than flattened here.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,c.id,'classified-as','Whole-sign membership in the reviewed curriculum.','reviewed'
FROM terms s CROSS JOIN terms c
WHERE s.slug IN ('gemini','virgo','libra','aquarius') AND c.slug='human-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,c.id,'classified-as','Whole-sign membership in the reviewed curriculum.','reviewed'
FROM terms s CROSS JOIN terms c
WHERE s.slug IN ('aries','taurus','leo') AND c.slug='quadrupedal-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,c.id,'classified-as','Water signs are the stable mute-sign group in the reviewed curriculum.','reviewed'
FROM terms s CROSS JOIN terms c
WHERE s.slug IN ('cancer','scorpio','pisces') AND c.slug='mute-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,c.id,'classified-as','Water signs are the stable fertile-sign group in the reviewed curriculum; author-specific additions remain source-level variants.','reviewed'
FROM terms s CROSS JOIN terms c
WHERE s.slug IN ('cancer','scorpio','pisces') AND c.slug='fertile-sign';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,c.id,'classified-as','Stable barren-sign membership in the reviewed curriculum.','reviewed'
FROM terms s CROSS JOIN terms c
WHERE s.slug IN ('gemini','leo','virgo') AND c.slug='barren-sign';

-- -----------------------------------------------------------------------------
-- PLANETARY MORAL/QUALITATIVE CLASSIFICATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('benefic','Benefic',
   'A traditional planetary classification for planets whose natural operation is generally considered constructive or favorable; Jupiter and Venus are the principal benefics.',
   'planetary classification','reviewed','Natural beneficence does not erase contrary accidental condition or context.','technical',5),
  ('malefic','Malefic',
   'A traditional planetary classification for planets whose natural operation is generally considered difficult, destructive or contrary; Saturn and Mars are the principal malefics.',
   'planetary classification','reviewed','Natural maleficence does not erase contrary dignity, sect or contextual mitigation.','technical',5);

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT p.id,c.id,'classified-as','Natural planetary classification.','reviewed'
FROM terms p CROSS JOIN terms c WHERE p.slug IN ('jupiter','venus') AND c.slug='benefic';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT p.id,c.id,'classified-as','Natural planetary classification.','reviewed'
FROM terms p CROSS JOIN terms c WHERE p.slug IN ('saturn','mars') AND c.slug='malefic';

-- -----------------------------------------------------------------------------
-- ESSENTIAL-DIGNITY GAP TERMS / ALIASES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('peregrine','Peregrine',
   'A planet is peregrine when it has none of the recognized essential dignities at the degree it occupies.',
   'essential dignity','reviewed','Peregrine means lacking dignity; it is not itself another positive or negative dignity.','technical',5),
  ('bound','Bound / Term',
   'An unequal subdivision of a zodiacal sign assigned to a planetary ruler, constituting one of the minor essential dignities.',
   'essential dignity','reviewed','Different bound tables exist; Egyptian and Ptolemaic terms should remain distinct variants.','technical',5),
  ('decan','Decan / Face',
   'One of three ten-degree divisions of a zodiacal sign, each assigned a planetary ruler and traditionally counted as a minor essential dignity.',
   'essential dignity','reviewed','Planetary sequences and historical systems should be documented as variants rather than silently merged.','technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Term','English','translation-variant','Common medieval/early modern English label for a bound.' FROM terms WHERE slug='bound';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Face','English','translation-variant','Common medieval/early modern label for a decan.' FROM terms WHERE slug='decan';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Peregrine Planet','English','expanded-form','Expanded descriptive form.' FROM terms WHERE slug='peregrine';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Peregrine is a technical statement about essential dignity: the planet occupies a degree where it possesses none of the recognized dignities used by the tradition being applied. It should therefore be distinguished from fall and detriment, which are specific debilities rather than the simple absence of dignity.',
       'reviewed','Original synthesis from the structured curriculum; historical source expansion still desirable.'
FROM terms WHERE slug='peregrine';
