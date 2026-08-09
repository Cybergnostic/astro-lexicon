-- Natal-method migration batch.
--
-- This pass uses the audited private curriculum as a pedagogy/coverage map while
-- publishing only original editorial synthesis on canonical terms already present
-- in the historical corpus. Course-specific procedures are not promoted here.

-- -----------------------------------------------------------------------------
-- ALMUTEN OF THE FIGURE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Almuten of the Figure is the planet judged to have the strongest overall claim in a nativity by combining relevant essential and accidental testimonies. It is broader than an almuten calculated for one house, degree or topic: the question is which planet has the greatest predominance in the figure as a whole.',
       'reviewed',
       'Expanded from the audited natal-method curriculum. Detailed scoring variants remain source-specific and are not imported from private course procedure.'
FROM terms WHERE slug='almuten-of-figure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'whole-chart','Whole-chart predominance',
       'An ordinary almuten answers a restricted question: which planet has the greatest dignity or testimony at a particular place or for a particular matter? The Almuten of the Figure instead attempts to identify the planet that predominates across the nativity as a whole. The distinction matters because a planet can dominate one topic without being the strongest planet in the complete figure.',
       10,'reviewed',NULL
FROM terms WHERE slug='almuten-of-figure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'testimonies','Several kinds of testimony are combined',
       'Historical procedures do not reduce the judgment to one placement. Essential dignity establishes a planet''s zodiacal authority, while accidental circumstances describe its ability to act. Different authors assign different weights and may use different contributing factors, so the lexicon keeps source-specific procedures visible instead of presenting one later scoring table as timelessly universal.',
       20,'reviewed',NULL
FROM terms WHERE slug='almuten-of-figure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'interpretive-use','What the result is for',
       'The resulting planet functions as a general predominating significator of the figure. It can help describe the chart''s governing emphasis, but it does not replace the Ascendant ruler, luminaries, temperament, topical rulers or other specialized significators. Traditional natal judgment remains layered rather than collapsing the whole chart into a single planet.',
       30,'reviewed',NULL
FROM terms WHERE slug='almuten-of-figure';

-- -----------------------------------------------------------------------------
-- MERCURY AND THE RATIONAL-MIND LAYER
-- -----------------------------------------------------------------------------
-- Mercury already has a general planet article. Add natal-method sections rather
-- than creating a private-course "quality of mind" term without independent public evidence.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rational-mind','Mercury in judgments of the rational mind',
       'Natal authors commonly use Mercury when judging reasoning, speech, calculation, learning and the organization of information. The useful question is not simply which sign Mercury occupies, but how capable and available Mercury is: dignity, ruler, speed, direction, visibility, house position and close planetary contacts can all modify its expression.',
       30,'reviewed','Public synthesis only; private course wording and its exact interpretive recipe are excluded.'
FROM terms WHERE slug='mercury';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mind-condition','Condition before adjectives',
       'A descriptive list attached to Mercury''s sign is not a complete judgment of intellect. A planet that is swift, direct and free to operate presents differently from the same planet when retrograde, stationary, obscured by the Sun or otherwise impeded. Traditional analysis therefore judges function and capacity from several conditions before turning them into character language.',
       40,'reviewed',NULL
FROM terms WHERE slug='mercury';

-- -----------------------------------------------------------------------------
-- MOON AND THE PERCEPTIVE / HABITUAL LAYER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'perception-habit','The Moon in perception and habitual response',
       'Alongside Mercury, the Moon contributes another layer of natal mental judgment: perception, instinctive response, habit, fluctuation and the way impressions are received and carried forward. Because the Moon changes rapidly by phase, sign and application, its condition is especially useful for describing changing or receptive functions rather than purely abstract reasoning.',
       30,'reviewed','Original synthesis guided by the audited mind curriculum; exact private-course procedure is not published.'
FROM terms WHERE slug='moon';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mercury-and-moon','Mercury and Moon should be synthesized, not substituted',
       'Mercury and the Moon answer different but overlapping questions. Mercury is especially important for rational organization and expression; the Moon is especially important for perception, habit and changing response. A coherent natal judgment compares both instead of declaring one planet to be the whole mind.',
       40,'reviewed',NULL
FROM terms WHERE slug='moon';
