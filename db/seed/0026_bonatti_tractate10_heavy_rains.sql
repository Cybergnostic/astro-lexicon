-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 10: Heavy Rains (PDF pp. 504-527), reviewed completely.
-- Only definition-level or substantively explanatory evidence is retained.
-- Long weather recipes, mansion-name catalogues, observational signs and repeated forecast combinations were reviewed but not exploded into lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('convertible-planet', 'Convertible Planet', 'A planet whose operative quality changes toward the nature of the planet to which it applies; in Bonatti''s meteorological doctrine Mercury and the Moon are the principal convertible planets.', 'planetary condition', 'draft', 'Bonatti contrasts naturally benefic and malefic planets with the Sun as temperate and Mercury and the Moon as convertible. Preserve this as a source-defined operational category rather than a universal doctrine without cross-source confirmation.'),
  ('wet-lunar-mansion', 'Wet Lunar Mansion', 'One of the lunar mansions classified as naturally favoring moisture and rain in meteorological judgment.', 'lunar mansion doctrine', 'draft', 'Bonatti gives a named list of nine wet mansions and further distinguishes stronger and weaker rain-producing mansions. The individual catalogue is retained in the source, not promoted to separate lexicon terms.'),
  ('dry-lunar-mansion', 'Dry Lunar Mansion', 'One of the lunar mansions classified as naturally reducing or opposing moisture and rain in meteorological judgment.', 'lunar mansion doctrine', 'draft', 'Bonatti gives six dry mansions. This is a functional meteorological classification, not a general definition of the mansion in all branches of astrology.'),
  ('common-lunar-mansion', 'Common Lunar Mansion', 'A lunar mansion class whose meteorological quality is intermediate rather than inherently wet or dry, so judgment depends more heavily on the Moon''s application and the condition of the planets involved.', 'lunar mansion doctrine', 'draft', 'Bonatti also calls these temperate mansions. Some incline more toward fortune or misfortune, but the core meteorological distinction is that they are neither simply wet nor dry.'),
  ('lunar-dichotomy', 'Lunar Dichotomy', 'One of four approximately seven-day divisions of the lunar month measured from one conjunction of the luminaries to the next, used as principal checkpoints in weather judgment.', 'lunar phase doctrine', 'draft', 'Bonatti divides the month into four dichotomies: conjunction to about day 7, to the opposition around day 14, to about day 21, and then to the next conjunction. Keep distinct from other lunar-month divisions such as duodena and al-bust.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Temperate Lunar Mansion', 'English', 'source-phrase', 'Bonatti uses temperate and common for the intermediate meteorological class.' FROM terms WHERE slug='common-lunar-mansion';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '504', '519', 'Treatise 10: Heavy Rains', 'Preface and main meteorological doctrine',
       'Planetary weather qualities, lunar mansions, wet/dry/common mansion classes, lunar applications and weather timing', NULL,
       'The full mansion-name lists and numerous forecast combinations were reviewed. Only reusable technical categories and explicit mechanisms are extracted.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In meteorological judgment Bonatti calls Jupiter and Venus naturally benefic, Saturn and Mars naturally malefic, the Sun common or temperate, and Mercury and the Moon convertible. By convertible he means that Mercury and the Moon take on the nature of the planet to which they apply, whether benefic or malefic.',
       'Treatise 10, opening doctrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='convertible-planet' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides the twenty-eight lunar mansions meteorologically into wet, dry and temperate/common classes. A conjunction of the luminaries in a wet mansion and wet sign, followed by the Moon applying in compatible wet conditions, strongly increases the testimony for rain.',
       'Treatise 10, lunar-mansion classification', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='wet-lunar-mansion' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti identifies six lunar mansions as dry. When the principal lunation and subsequent lunar applications occur in dry mansions and dry signs, the testimony for rain is sharply reduced and may be cancelled altogether unless another strong moisture-producing factor intervenes.',
       'Treatise 10, lunar-mansion classification', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dry-lunar-mansion' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The remaining mansions are temperate or common rather than simply wet or dry. In them Bonatti directs the astrologer to judge the weather chiefly from the nature and condition of the planet to which the Moon applies.',
       'Treatise 10, lunar-mansion classification', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='common-lunar-mansion' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '519', '527', 'Treatise 10: Heavy Rains', 'Lunar-month divisions and concluding weather rules',
       'Four lunar dichotomies, secondary weather checkpoints, lunar-phase figures, observational weather signs and monthly rain judgment', NULL,
       'Observational signs such as halos, rainbows, clouds and shooting stars are treated as weather lore rather than multiplied into technical lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides the lunar month into four principal dichotomies of roughly seven days each: conjunction to the first quarter period, then to the opposition, then to the third seven-day point, and finally to the following conjunction. These are among the principal temporal checkpoints used to judge changes in the air.',
       'Treatise 10, section on the four dichotomies', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lunar-dichotomy' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For weather timing Bonatti gives a sign-quality rule: the distance to the relevant lunar application or aspect is converted into days when the action comes from fixed signs and into hours from common or movable signs, with movable signs acting more quickly. Lunar speed and increase of light can hasten the result.',
       'Treatise 10, section on timing showers, rains and winds', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-sign' AND w.slug='bonatti-liber-astronomiae';
