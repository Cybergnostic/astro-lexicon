-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Second Tractate, Part II, through Chapter XXVIII (PDF pp. 85-152).
-- Only definition-level or substantively explanatory evidence is retained.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('northern-signs', 'Northern Signs', 'The six signs from Aries through Virgo, defined by their position on the northern side of the celestial equator.', 'zodiacal classification', 'draft', 'Bonatti defines this astronomically, not by elemental or mundane symbolism.'),
  ('southern-signs', 'Southern Signs', 'The six signs from Libra through Pisces, defined by their position on the southern side of the celestial equator.', 'zodiacal classification', 'draft', 'Bonatti defines this astronomically, not by elemental or mundane symbolism.'),
  ('direct-ascension-signs', 'Signs of Direct Ascension', 'The six signs Cancer through Sagittarius, which Bonatti describes as taking longer to rise than their opposite signs.', 'rising-time doctrine', 'draft', 'Equivalent to long-ascension signs in this source; preserve Bonatti’s terminology.'),
  ('crooked-ascension-signs', 'Signs of Crooked Ascension', 'The six signs Capricorn through Gemini, which Bonatti describes as taking less time to rise than their opposite signs.', 'rising-time doctrine', 'draft', 'Equivalent to short-ascension signs in this source; preserve Bonatti’s terminology.'),
  ('harmonious-in-journeys', 'Harmonious in Journeys', 'A non-aspect sign relationship between pairs equidistant from the beginning of Aries, treated as sharing a correspondence in their path.', 'sign relationships', 'draft', 'Bonatti attributes this terminology to Alchabitius; compare with Abū Maʿshar’s agreement in path and al-Bīrūnī’s related correspondences without assuming identity.'),
  ('solar-half', 'Solar Half of the Zodiac', 'The half of the zodiac from Leo through Capricorn, assigned by Bonatti to the Sun as a special six-sign domain.', 'zodiacal division', 'draft', 'Bonatti links this to a luminary-specific fortitude analogous to term dignity; keep source-specific.'),
  ('lunar-half', 'Lunar Half of the Zodiac', 'The half of the zodiac from Aquarius through Cancer, assigned by Bonatti to the Moon as a special six-sign domain.', 'zodiacal division', 'draft', 'Bonatti links this to a luminary-specific fortitude analogous to term dignity; keep source-specific.'),
  ('term-direction', 'Direction by Term Lords', 'A period system in which successive term rulers govern spans of life corresponding to the number of degrees in their terms, beginning from the Ascendant.', 'chronocrator and direction doctrine', 'draft', 'Bonatti distinguishes this from his triplicity-lord division of life and later promises a fuller treatment of primary direction.'),
  ('triplicity-life-division', 'Triplicity Division of Life', 'A division of the life into three successive portions governed by the three rulers of the Ascendant’s triplicity.', 'chronocrator doctrine', 'draft', 'Bonatti applies the first, second and participating triplicity rulers to the first, middle and final thirds of life.'),
  ('rational-sign', 'Rational Sign', 'A sign whose image is human or substantially human, used as a testimony for rationality and speech.', 'zodiacal classification', 'draft', 'Bonatti includes Gemini, Virgo, Libra, Aquarius and the first half of Sagittarius.'),
  ('half-voice-sign', 'Half-Voice Sign', 'A sign formed from the image of an animal that bleats, lows or roars, treated as an intermediate category between voiced and voiceless signs.', 'zodiacal classification', 'draft', 'Bonatti explicitly contrasts these with rational/beautiful-voice and voiceless signs.'),
  ('voiceless-sign', 'Voiceless Sign', 'A sign formed from the image of an animal without a voice, used as a testimony for restricted speech.', 'zodiacal classification', 'draft', 'Bonatti gives Cancer, Scorpio and Pisces.'),
  ('via-combusta', 'Via Combusta', 'A specific zodiacal interval extending from the middle of Libra to the middle of Scorpio.', 'zodiacal condition', 'draft', 'Bonatti defines the interval directly but gives no fuller mechanism in this passage; do not add later doctrine without source support.'),
  ('azemene-degree', 'Azemene Degree', 'A transmitted degree class associated with an enduring bodily debility regarded as inseparable from the native’s constitution.', 'degree doctrine', 'draft', 'Historical medical doctrine only; do not present as modern medicine. Bonatti gives a table of specific degrees.'),
  ('equal-power-degrees', 'Degrees of Equal Power', 'Paired degrees situated at equal distances from the beginnings of movable signs and treated as sharing the same strength or virtue.', 'degree and sign relation doctrine', 'draft', 'Bonatti’s numerical examples are textually inconsistent; retain the geometric principle rather than overconfident tables.');

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '85', '89', 'Second Tractate, Part II', 'Chs. I-II', 'Zodiac divisions, northern/southern signs, direct/crooked ascension, obedience, harmonious journeys, solar/lunar halves', NULL,
       'Definition-level material on sign divisions and non-aspect correspondences. Translator notes are not attributed to Bonatti.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides the zodiac into northern signs, Aries through Virgo, and southern signs, Libra through Pisces, according to which side of the celestial equator they occupy.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='northern-signs' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides the zodiac into northern signs, Aries through Virgo, and southern signs, Libra through Pisces, according to which side of the celestial equator they occupy.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='southern-signs' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Cancer through Sagittarius are signs of direct ascension because they require more than the idealized two equal hours to rise; their opposites, Capricorn through Gemini, are signs of crooked ascension because they rise in less time.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='direct-ascension-signs' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Capricorn through Gemini are signs of crooked ascension because they rise in less time than their opposite direct-ascension signs. Bonatti links these pairs to obedience according to equal distance from Cancer.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='crooked-ascension-signs' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti, following Alchabitius, calls pairs equidistant from the beginning of Aries “harmonious in journeys”: Aries-Pisces, Taurus-Aquarius, Gemini-Capricorn, Cancer-Sagittarius, Leo-Scorpio and Virgo-Libra.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='harmonious-in-journeys' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls Leo through Capricorn the Sun’s half of the zodiac and says the Sun has throughout it a special fortitude comparable to the term dignity of the five non-luminary planets.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='solar-half' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls Aquarius through Cancer the Moon’s half of the zodiac and says the Moon has throughout it a special fortitude comparable to the term dignity of the five non-luminary planets.',
       'Second Tractate, Part II, Ch. II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lunar-half' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '90', '102', 'Second Tractate, Part II', 'Chs. III-X', 'Planetary order, essential/accidental powers, domiciles, detriments, exaltations and falls', NULL,
       'Substantial doctrine on dignity categories and derivations; long sign-by-sign rationale is summarized rather than duplicated as separate concepts.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly separates powers by nature from powers by accident. House, exaltation, triplicity, term and face are natural powers; joy, strong houses or places, reception and related fortitudes are accidental.',
       'Second Tractate, Part II, Ch. IV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-share' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats a planet’s detriment as the sign opposite its domicile. In the same section he uses “fall” loosely for detriment, but later distinguishes true fall or descension as the sign opposite exaltation; the terminology must therefore be normalized cautiously.',
       'Second Tractate, Part II, Chs. VII and X', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives the standard exaltation signs and degrees and explains fall or descension as the opposite sign and degree from exaltation. He explicitly distinguishes this from detriment despite using overlapping Latin vocabulary elsewhere.',
       'Second Tractate, Part II, Chs. VIII-X', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fall' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '113', '130', 'Second Tractate, Part II continued', 'Chs. XI-XIX', 'Triplicities, modalities, aspects, terms, life divisions, faces and dignity fortitudes', NULL,
       'High-value technical definitions. Catalogue tables are retained as source data but not exploded into independent lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines a triplicity as three signs agreeing in one nature and one complexion. He gives the four elemental triplicities together with their day, night and participating rulers.',
       'Second Tractate, Part II, Ch. XI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explains movable, fixed and common signs through the seasons: movable signs initiate a change of seasonal condition, fixed signs establish it, and common signs share the ending of one season with the beginning of the next.',
       'Second Tractate, Part II, Ch. XII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='tropical-sign' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines sextile, square, trine and opposition geometrically as 60°, 90°, 120° and 180°. He characterizes sextile as middling friendship, square as middling enmity, trine as perfect friendship and opposition as ultimate enmity, deriving these qualities from the domicile relationships of Venus, Mars, Jupiter and Saturn to the luminary houses.',
       'Second Tractate, Part II, Ch. XIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='aspect' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines terms as bounded degree-sections assigned to the five non-luminary planets. A planet within its own term has a specific fortitude, and the term acts like a boundary separating one planet’s virtue from another’s.',
       'Second Tractate, Part II, Ch. XIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti applies the three rulers of the Ascendant’s triplicity to three successive portions of life: the first ruler governs the first third, the second the middle third and the third ruler the final third, with the quality of each period judged from the condition of its ruler.',
       'Second Tractate, Part II, Ch. XV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-life-division' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In Bonatti’s “direction by term lords,” the ruler of each successive term beginning from the Ascendant governs as many years as there are degrees in that term; the sequence continues term by term through the zodiac.',
       'Second Tractate, Part II, Ch. XVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='term-direction' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines each face as a ten-degree third of a sign and gives the continuous Chaldean planetary sequence beginning with Mars in the first face of Aries.',
       'Second Tractate, Part II, Chs. XVII-XVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Following Alchabitius, Bonatti assigns five points of fortitude to domicile, four to exaltation, three to triplicity, two to term and one to face. He presents this as a comparative measure of authority in a sign, while also preserving context-specific disagreements about whether term or triplicity should take precedence.',
       'Second Tractate, Part II, Ch. XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '131', '152', 'Second Tractate, Part II continued', 'Chs. XX-XXVIII', 'Sign classes, via combusta, bodily correspondences, degree classes, puteal and azemene degrees, equal-power degrees', NULL,
       'Only stable technical classifications are promoted. Long body-part, region and degree tables remain source data rather than separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls Gemini, Virgo, Libra, Aquarius and the first half of Sagittarius rational because their images are human or partly human; he uses this classification as a testimony concerning speech and rational expression.',
       'Second Tractate, Part II, Ch. XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='rational-sign' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes “half-voice” signs, represented by bleating, lowing or roaring animals, from signs entirely lacking voice. He treats the former as indicating restricted speech and the latter as a stronger testimony toward voicelessness when relevant significators are impaired.',
       'Second Tractate, Part II, Ch. XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='half-voice-sign' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls Cancer, Scorpio and Pisces signs lacking voice because their animal images are regarded as voiceless, and uses the classification as a testimony in judgments concerning speech.',
       'Second Tractate, Part II, Ch. XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='voiceless-sign' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines the via combusta as the zodiacal region extending from the middle of Libra to the middle of Scorpio. This passage names and bounds the interval but does not independently explain a full doctrine of its effects.',
       'Second Tractate, Part II, Ch. XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='via-combusta' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes puteal or deep degrees as fixed degree positions that place a significator “in a pit”: a condition of impediment in which the native or querent reaches completion more slowly and with greater difficulty.',
       'Second Tractate, Part II, Ch. XXV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-well' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines azemene as an enduring bodily debility regarded as inseparable from the native’s constitution and associates specified zodiacal degrees with this condition. This is preserved strictly as historical astrological doctrine, not medical fact.',
       'Second Tractate, Part II, Ch. XXVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='azemene-degree' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls paired degrees of equal power when they stand at equal distances from the beginnings of movable signs and therefore are said to possess equal strength in what they signify. His numerical examples are textually inconsistent, so the geometric principle is more secure than the transmitted particulars.',
       'Second Tractate, Part II, Ch. XXVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='equal-power-degrees' AND w.slug='bonatti-liber-astronomiae';
