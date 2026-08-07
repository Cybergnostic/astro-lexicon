-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part VI, chapters 1-8. Read in order from PDF pp. 554-649 / original pp. 540-635.
-- Brill 2019 edition. Public-facing summaries are original paraphrases; no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('decan-figure', 'Figure Ascending in a Decan', 'A symbolic or stellar figure associated with the rising of a particular decan and used as a carrier of that decan’s proper indications.', 'decan doctrine', 'draft', 'Part VI chapter 1 distinguishes inherited symbolic decan figures from stellar constellations whose positions shift over time. Do not collapse the two.'),
  ('rising-times', 'Rising Times', 'The amount of equatorial or oblique ascension assigned to a sign or degree at a given terrestrial latitude.', 'astronomical framework', 'draft', 'Part VI chapter 2 gives the equatorial and seven-clime rising times and treats them as foundational for later sign relationships.'),
  ('clime', 'Clime', 'A terrestrial latitude band used for astronomical and astrological calculations, especially rising times and length of day.', 'geographical framework', 'draft', 'Part VI chapter 2 gives seven climes, their latitude ranges, representative latitudes and differing planetary attributions.'),
  ('aspect', 'Aspect', 'A geometrically and numerically proportioned angular relation between zodiacal degrees.', 'aspect doctrine', 'draft', 'Abū Maʿshar restricts the principal aspects here to opposition, trine, quartile and sextile, in two directions where applicable.'),
  ('opposition', 'Opposition', 'An aspect formed by a separation of 180 degrees.', 'aspect doctrine', 'draft', 'Part VI chapter 3 treats opposition as the strongest aspect by magnitude and normally as contrary or hostile, while later chapters qualify that rule for some sign relationships.'),
  ('trine', 'Trine', 'An aspect formed by a separation of 120 degrees.', 'aspect doctrine', 'draft', 'Part VI chapter 3 associates trine with agreement and friendship and derives its geometry from a threefold division of the circle.'),
  ('quartile', 'Quartile / Square', 'An aspect formed by a separation of 90 degrees.', 'aspect doctrine', 'draft', 'The source term is quartile. Part VI chapter 7 explicitly notes that some quartiles can indicate agreement rather than hostility.'),
  ('sextile', 'Sextile', 'An aspect formed by a separation of 60 degrees.', 'aspect doctrine', 'draft', 'Part VI chapter 3 associates sextile with agreement and friendship; chapter 6 separately defines a non-aspecting relation called natural sextile.'),
  ('loving-signs', 'Signs that Love Each Other', 'Signs related by trine or sextile and therefore classified as mutually affectionate or concordant.', 'sign relationship', 'draft', 'Part VI chapter 4 uses explicit relational language. Preserve as historical terminology rather than replacing it with a modern compatibility label.'),
  ('hating-signs', 'Signs that Hate Each Other', 'Signs related by quartile and therefore ordinarily classified as mutually discordant.', 'sign relationship', 'draft', 'Part VI chapter 7 qualifies this general rule by identifying quartiles that indicate agreement because of other sign relations.'),
  ('hostile-signs', 'Signs Hostile to Each Other', 'Signs related by opposition and therefore ordinarily classified as mutually hostile.', 'sign relationship', 'draft', 'Part VI chapter 6 qualifies the simple opposition=hostility equation by introducing natural opposition between non-aspecting signs.'),
  ('straight-rising-signs', 'Straight-Rising Signs', 'Signs whose rising times exceed thirty degrees, identified here as Cancer through Sagittarius.', 'sign rising classification', 'draft', 'The classification depends on oblique ascension and is paired with crooked-rising signs.'),
  ('crooked-rising-signs', 'Crooked-Rising Signs', 'Signs whose rising times are less than thirty degrees, identified here as Capricorn through Gemini.', 'sign rising classification', 'draft', 'Part VI chapter 4 says these signs rise as though lying on one side and are obedient to straight-rising signs.'),
  ('obedient-signs', 'Obedient Signs', 'A sign relationship in which crooked-rising signs are said to obey straight-rising signs, with an alternate use tied to equal day-length power.', 'sign relationship', 'draft', 'The text uses obedience in more than one closely related manner. Preserve the ambiguity rather than forcing one later textbook definition.'),
  ('signs-agreeing-in-zone', 'Signs Agreeing in Zone', 'Pairs of signs equally distant from the equatorial zone and corresponding in rising times.', 'sign relationship', 'draft', 'Part VI chapter 5 gives Aries-Pisces, Taurus-Aquarius, Gemini-Capricorn, Cancer-Sagittarius, Leo-Scorpio and Virgo-Libra.'),
  ('signs-agreeing-in-power', 'Signs Agreeing in Power', 'Pairs of signs whose equal daytime hours correspond when the Sun occupies them.', 'sign relationship', 'draft', 'The Persians call such pairs possessing power; the text also connects this relation with obedience.'),
  ('signs-agreeing-in-path', 'Signs Agreeing in Path', 'Pairs of signs sharing the same planetary ruler, plus Cancer and Leo as the paired houses of the luminaries.', 'sign relationship', 'draft', 'This is a source-specific relation distinct from ordinary aspect.'),
  ('natural-opposition', 'Natural Opposition', 'A relation between non-aspecting signs that are distant from one another yet agree by rising times, power or path.', 'sign relationship', 'draft', 'Despite the name, Abū Maʿshar says these pairs can indicate agreement and friendship rather than hostility.'),
  ('natural-sextile', 'Natural Sextile', 'A relation between nearby non-aspecting signs that agree by rising times, power or path.', 'sign relationship', 'draft', 'The main translation says these pairs indicate concord. A Latin translation noted by the editors reverses the effect, so keep source-translation disagreement visible.'),
  ('sign-time-measures', 'Years, Months, Days and Hours of the Signs', 'Methods for converting sign rising times or planetary minor years into time measures assigned to zodiacal signs.', 'time doctrine', 'draft', 'Part VI chapter 8 preserves two procedures rather than one single conversion rule.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Square', 'English', 'later-technical-term', 'Common later English equivalent of quartile.' FROM terms WHERE slug='quartile';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Possessing Power', 'English', 'source-translation', 'Persian designation reported by Abū Maʿshar for signs agreeing in power.' FROM terms WHERE slug='signs-agreeing-in-power';

-- Chapter 1: figures ascending in decans.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '545', '603', 'Part VI', 'Chapter 1', '1.3-1.56',
       'Proper indications of signs and the figures said to ascend in their decans; Persian/Babylonian/Egyptian, Indian and Ptolemaic stellar traditions', NULL,
       'Very long chapter. The lexicon extracts the doctrine of decan figures, not every individual iconographic figure as an independent term.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar treats figures ascending in decans as carriers of proper decan indications. He distinguishes inherited symbolic figures, which are fixed to decans by doctrine, from stellar constellations whose actual ascensions shift over centuries and therefore require correction for precession. He records Persian/Babylonian/Egyptian, Indian and Ptolemaic materials without claiming that the symbolic figures literally exist in the sky in the depicted shapes.',
       'Part VI, Chapter 1, §§1.3-1.56', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='decan-figure' AND w.slug='abu-mashar-great-introduction';

-- Chapter 2: rising times and climes.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '603', '610', 'Part VI', 'Chapter 2', '2.1-2.10',
       'Rising times on the equator and in seven climes; latitude bands, representative latitudes and longest-day lengths', NULL,
       'The chapter attributes different climes to planets according to Persian and Byzantine traditions; those disagreements are source data.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Rising times measure how much of the equator rises with a sign or degree. At the equator Abū Maʿshar gives a symmetric pattern; in the seven climes the values change with latitude. These rising times later become the basis for several non-aspect sign relationships.',
       'Part VI, Chapter 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='rising-times' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A clime is a terrestrial latitude band used to organize rising times and longest-day lengths. Abū Maʿshar gives seven climes and records differing Persian and Byzantine planetary assignments for several of them.',
       'Part VI, Chapter 2, §§2.4-2.10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='clime' AND w.slug='abu-mashar-great-introduction';

-- Chapter 3: aspect doctrine.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '611', '617', 'Part VI', 'Chapter 3', '3.1-3.10',
       'Geometrical and numerical rationale for aspects: opposition, trine, quartile and sextile', NULL,
       'The chapter explicitly rejects merely adding quintile, octavile, nonile or decimile on the basis of division alone because the full set of geometrical/numerical conditions is not met.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'An aspect is a relation of zodiacal degrees grounded in both numerical proportion and geometrical division of the circle. Abū Maʿshar recognizes opposition, two trines, two quartiles and two sextiles, and explicitly argues against generating additional aspects solely because another number divides 360.',
       'Part VI, Chapter 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='aspect' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Opposition is the 180-degree relation. In the ranking given here it is the strongest aspect by magnitude and ordinarily signifies contrariety, though Part VI later identifies special sign relations that qualify the simple hostility rule.', 'Part VI, Chapter 3, §§3.4-3.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='opposition' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Trine is the 120-degree relation produced by dividing the circle into three proportional figures. Abū Maʿshar associates it with agreement and friendship.', 'Part VI, Chapter 3, §§3.4-3.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='trine' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Quartile is the 90-degree relation produced by dividing the circle into four equal proportional figures. It is ordinarily linked with contrariety, but Chapter 7 later lists quartiles whose other sign relations make them concordant.', 'Part VI, Chapters 3 and 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='quartile' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Sextile is the 60-degree relation produced by a sixfold division of the circle. It is associated with agreement and friendship and is distinguished from the separate non-aspecting relation called natural sextile.', 'Part VI, Chapters 3 and 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sextile' AND w.slug='abu-mashar-great-introduction';

-- Chapters 4-7: sign relationships beyond ordinary aspect.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '619', '629', 'Part VI', 'Chapters 4-7', '4.1-7.3',
       'Loving, hating and hostile signs; straight/crooked rising; obedience; agreement in zone, power and path; natural opposition and sextile; concordant quartiles', NULL,
       'These chapters show that Abū Maʿshar does not reduce sign relationship to aspect alone.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs related by trine or sextile are called signs that love each other.', 'Part VI, Chapter 4, §4.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='loving-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs related by quartile are generally called signs that hate each other, although Chapter 7 identifies specific quartiles that become concordant through agreement in rising times, day length or path.', 'Part VI, Chapters 4 and 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hating-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs related by opposition are generally called hostile to one another, but Chapter 6 distinguishes natural opposition between non-aspecting signs that can instead indicate friendship.', 'Part VI, Chapters 4 and 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hostile-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Straight-rising signs have rising times greater than thirty degrees and are identified as Cancer through Sagittarius.', 'Part VI, Chapter 4, §4.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='straight-rising-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Crooked-rising signs have rising times under thirty degrees and are identified as Capricorn through Gemini. The text links them to obedience toward straight-rising signs.', 'Part VI, Chapter 4, §4.7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='crooked-rising-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Obedience first appears as a relation of crooked-rising signs toward straight-rising signs. Abū Maʿshar then notes another usage in which signs agreeing in equal daytime hours are also called obedient or possessing power.', 'Part VI, Chapters 4-5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='obedient-signs' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs agreeing in zone are paired by equal distance from the equatorial zone and corresponding rising times. The degree correspondence runs in reverse order across each pair.', 'Part VI, Chapter 5, §5.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='signs-agreeing-in-zone' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs agreeing in power have corresponding equal daytime hours. Abū Maʿshar reports that Persians call the pairs possessing power and connects this relation with obedience.', 'Part VI, Chapter 5, §5.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='signs-agreeing-in-power' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Signs agreeing in path are paired because they share one planetary ruler. Cancer and Leo are also treated as one path through their status as the houses of the two luminaries.', 'Part VI, Chapter 5, §5.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='signs-agreeing-in-path' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Natural opposition describes distant signs that do not aspect one another but agree in rising times, power or path. Contrary to ordinary opposition, these pairs are said to indicate concord and friendship.', 'Part VI, Chapter 6, §§6.2-6.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natural-opposition' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Natural sextile describes nearby signs that do not aspect one another but agree in rising times, power or path. The main translation says they indicate friendship and concord, while an editorial note records a contrary reading in the Latin translation.', 'Part VI, Chapter 6, §§6.2-6.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natural-sextile' AND w.slug='abu-mashar-great-introduction';

-- Chapter 8: sign-based time measures.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '631', '635', 'Part VI', 'Chapter 8', '8.1-8.3',
       'Years, months, days and hours assigned to signs by rising-time conversion and by the minor years of the sign lord', NULL,
       'The chapter explicitly gives two methods; preserve both.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar gives two ways to derive years, months, days and hours for signs. One converts the rising-time degrees of a sign in a chosen clime into time units; the other derives the sign’s time measures from the minor years of its planetary ruler through further proportional calculation.',
       'Part VI, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sign-time-measures' AND w.slug='abu-mashar-great-introduction';

-- Structural relations.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A specific principal aspect in Abū Maʿshar’s geometrical doctrine.', 'draft' FROM terms a, terms b WHERE a.slug='opposition' AND b.slug='aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A specific principal aspect in Abū Maʿshar’s geometrical doctrine.', 'draft' FROM terms a, terms b WHERE a.slug='trine' AND b.slug='aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A specific principal aspect in Abū Maʿshar’s geometrical doctrine.', 'draft' FROM terms a, terms b WHERE a.slug='quartile' AND b.slug='aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'A specific principal aspect in Abū Maʿshar’s geometrical doctrine.', 'draft' FROM terms a, terms b WHERE a.slug='sextile' AND b.slug='aspect';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'non-aspecting-analogue-of', 'Named natural opposition but explicitly involving signs that do not aspect one another.', 'draft' FROM terms a, terms b WHERE a.slug='natural-opposition' AND b.slug='opposition';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'non-aspecting-analogue-of', 'Named natural sextile but explicitly involving signs that do not aspect one another.', 'draft' FROM terms a, terms b WHERE a.slug='natural-sextile' AND b.slug='sextile';
