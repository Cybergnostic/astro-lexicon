-- Sequential extraction of al-Biruni, The Book of Instruction in the Elements of the Art of Astrology.
-- Astrology §§461-530: houses/lots, solar conditions, application mechanics, dignity conditions,
-- divisions of judicial astrology, nativities, elections and questions.
-- Only definition-level or substantively explanatory evidence is retained; long catalogues are not promoted.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('part-of-fortune', 'Part of Fortune', 'A calculated zodiacal point derived from the relative positions of the Sun, Moon and Ascendant.', 'lots', 'draft', 'Preserve source-specific day/night formulas and disagreements; do not impose one universal formula.'),
  ('lot', 'Astrological Lot', 'A calculated zodiacal point obtained by measuring an arc between two significators and projecting that distance from a third point.', 'lots', 'draft', 'Al-Biruni records a very large and unstable family of lots; individual lists should not automatically become separate canonical terms.'),
  ('halb', 'Halb', 'A sect condition in which a diurnal planet is above the horizon by day and below it by night, while a nocturnal planet is above by night and below by day.', 'sect and accidental condition', 'draft', 'Keep distinct from hayz. Al-Biruni explicitly states that hayz includes additional sign-gender conformity.'),
  ('mubtazz', 'Mubtazz / Almuten', 'The planet that prevails by possessing the strongest accumulation of relevant dignities or testimonies.', 'rulership and predominance', 'draft', 'Historical forms and later Latin almuten terminology should be tracked as aliases, not silently substituted.'),
  ('planetary-joy', 'Planetary Joy', 'A condition in which a planet occupies a place or circumstance especially congenial to it and is thereby strengthened.', 'accidental dignity', 'draft', 'Al-Biruni uses joy broadly for several congenial conditions but identifies preferred houses as the best-known form.'),
  ('besiegement', 'Besiegement', 'A condition in which a planet is enclosed between two other planets or between their rays.', 'accidental condition', 'draft', 'Al-Biruni distinguishes bodily besiegement and besiegement by rays; benefic or malefic enclosure changes the quality.'),
  ('feral', 'Feral in Course', 'A planet passes through a sign without any other planet forming an aspect with it from entry to exit.', 'planetary motion and aspect doctrine', 'draft', 'Distinct from void of course; al-Biruni explicitly makes the feral condition broader and rarer.'),
  ('return-radd', 'Return (Radd)', 'Failure of an offered planetary influence because the receiving planet is too weak to retain or accept it.', 'perfection and impediment', 'draft', 'Do not merge automatically with later translation or rejection terminology; al-Biruni uses radd in more than one context and warns of ambiguity.'),
  ('evasion', 'Evasion', 'Failure of an intended application because the receiving planet leaves the sign before perfection and the applying planet turns to another.', 'perfection and impediment', 'draft', 'Source-specific impediment in al-Biruni §506.'),
  ('intervention', 'Intervention', 'Interference in an intended application by an intermediate planet whose motion causes the original contact not to perfect as intended.', 'perfection and impediment', 'draft', 'Keep distinct from prevention/prohibition and abscission of light until cross-source comparison is complete.'),
  ('abscission-of-light', 'Abscission of Light', 'A form of interference in which an intermediate or higher planet redirects the sequence of application and cuts off the intended contact.', 'perfection and impediment', 'draft', 'Al-Biruni gives more than one form; do not collapse into generic prohibition.'),
  ('opening-the-doors', 'Opening the Doors', 'A configuration of planets with opposed natures or opposed domiciles used especially in weather judgment.', 'weather astrology', 'draft', 'Context is explicitly meteorological in al-Biruni; avoid universalizing it beyond that use without other sources.'),
  ('combust-way', 'Combust Way', 'The zodiacal interval from the last part of Libra through the first part of Scorpio treated as especially adverse to the luminaries.', 'zodiacal condition', 'draft', 'This is distinct from a planet being combust by solar proximity.'),
  ('lord-of-year', 'Lord of the Year', 'A planet selected to govern or signify a year according to a specified annual figure and hierarchy of candidates.', 'time lords and annual techniques', 'draft', 'Al-Biruni records multiple traditions; do not collapse Salkhuda with every later dominus anni procedure.'),
  ('hyleg', 'Hyleg', 'A selected aphetic significator used in determining the potential span and direction of life.', 'longevity doctrine', 'draft', 'Historical longevity doctrine; preserve technical source framing rather than modern reinterpretation.'),
  ('kadkhuda', 'Kadkhuda / Alcocoden', 'The planet selected through dignity in relation to the hyleg and used to assign the potential length of life.', 'longevity doctrine', 'draft', 'Keep distinct from hyleg and from general almuten/mubtazz.'),
  ('election', 'Election', 'The selection of a suitable future time for an undertaking by arranging the chart so that relevant significators are strengthened and harms avoided.', 'electional astrology', 'draft', 'Al-Biruni treats election as the fourth division of judicial astrology.'),
  ('horary-question', 'Horary Question', 'A judgment erected from the time a querent presents a question, using the Ascendant, its lord, the Moon and the relevant house significators.', 'horary astrology', 'draft', 'Keep linked to but distinct from the broader historical term astrological question.'),
  ('thought-reading', 'Thought Reading', 'Attempts to infer an unspoken hidden object or secret thought from a chart rather than from an explicitly stated question.', 'divination boundary', 'draft', 'Al-Biruni treats this as a disreputable boundary practice and warns against it; preserve that source judgment.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Almuten', 'Latin/English', 'historical-form', 'Later Latinized form associated with the Arabic-Persian mubtazz tradition.' FROM terms WHERE slug='mubtazz';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Alcocoden', 'Latin/English', 'historical-form', 'Latinized form of kadkhuda in medieval astrological literature.' FROM terms WHERE slug='kadkhuda';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Apheta', 'Greek/Latin', 'historical-form', 'Technical equivalent used in longevity doctrine for the hyleg/aphetic significator.' FROM terms WHERE slug='hyleg';

-- HOUSES AND LOTS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '292', '299', '461-476', 'House indications, Part of Fortune and general doctrine of lots', NULL,
       '§461 gives natal and horary house topics; §§475-476 define the Part of Fortune and the general three-point construction of lots. Long lists of individual lots are not promoted.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines the Part of Fortune as a zodiacal point whose distance from the Ascendant corresponds to the angular distance between the luminaries. He reports Ptolemy as using one formula without reversal, while other astrologers reverse the luminaries for nocturnal nativities.',
       '§475', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='part-of-fortune' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For al-Biruni, the general construction of a lot uses three points: a beginning, an end, and a casting point. The arc between the first two is projected from the third. He emphasizes that traditions reverse the first two points in some nocturnal formulas and that the number of transmitted lots had proliferated enormously.',
       '§476', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lot' AND w.slug='al-biruni-tafhim';

-- SOLAR CONDITION REFINEMENTS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '313', '319', '481-486', 'Cazimi, combustion, under the rays, orientality and occidentality', NULL,
       'Detailed source-specific thresholds and separate treatment of superior and inferior planets. The main existing entries should receive this evidence rather than duplicate terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni places the innermost solar condition at less than about sixteen minutes from conjunction with the Sun and explicitly distinguishes it from combustion. His treatment is phase-sensitive and separates the superior planets from Venus and Mercury.',
       '§481', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni distinguishes combustion from the wider condition under the rays and gives planet-specific visibility limits. His discussion makes clear that the numerical boundary is not universal across all planets or phases.',
       '§§481-484', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Orientality and occidentality are not simple east/west labels in al-Biruni. Their meaning depends on whether a planet is superior or inferior, whether it is direct or retrograde, and where it stands in its synodic cycle relative to the Sun.',
       '§§481-486', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='orientality' AND w.slug='al-biruni-tafhim';

-- APPLICATION, DIGNITY AND ACCIDENTAL CONDITIONS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '321', '334', '489-514', 'Application, dignity, hayz/halb, joy, besiegement, ferality, impediments, translation and planetary strength', NULL,
       'Dense technical block. Existing entries such as application, reception, translation, collection, refranation and void of course are refined; genuinely distinct source terms receive new entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines application and separation through the formation and withdrawal of conjunction or aspect. In the ordinary direct-motion scheme the lower and faster planet applies to the higher and slower one. He also records disagreement over how far before exact perfection application should be considered operative.',
       '§§489-490', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni distinguishes halb from hayz. Halb requires a diurnal planet to be above the earth by day and below it at night, or a nocturnal planet above by night and below by day. Hayz adds conformity between the planet''s sex and the sex of the occupied sign; therefore every hayz includes halb, but not every halb is hayz.',
       '§496', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='halb' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni explicitly states that hayz is the more comprehensive condition because it contains the hemisphere/sect requirement of halb and additionally requires a male planet in a male sign or a female planet in a female sign. Mars is treated specially because it is male but nocturnal.',
       '§496', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hayz' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The mubtazz is the planet that gains mastery through preponderance of dignities or testimonies. Al-Biruni distinguishes an absolute form based on general strength from a limited form referred to a particular house topic, and later applies the term to the planet predominating at aphetic points in a nativity.',
       '§495 and §523', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='mubtazz' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni uses joy for several kinds of congenial planetary condition: appropriate sign subdivisions, halb or hayz, suitable directions or quadrants, recovery from solar affliction, and especially the traditional houses preferred by each planet. The house-based form is identified as the best-known use.',
       '§498', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-joy' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Besiegement can be bodily, when a planet lies between two others by sign or degree, or by rays, when aspects from planets before and behind enclose it. Enclosure by two malefics is extremely harmful, while enclosure by two benefics is extremely favorable.',
       '§500', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='besiegement' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni calls a planet feral when no other planet aspects it at any point from its entry into a sign until its exit. He distinguishes this from void of course, which concerns the absence of a further conjunction/application within the sign after separation.',
       '§§504-505', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='feral' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines void of course as a planet traversing a sign without entering a new conjunction while in that sign, despite possible aspects. He immediately contrasts this with the stricter feral condition in which no planet aspects it during the entire sign passage.',
       '§§504-505', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Return occurs when the superior receiving planet is weakened, for example by retrogradation or solar obscuration, and cannot retain what the applying planet offers. Reception or strong house position can alter the outcome, so return is not treated as mechanically fatal in every case.',
       '§506.1', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='return-radd' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Evasion occurs when an inferior planet is applying to a superior planet, but before perfection the superior leaves its sign and the inferior applies to another planet instead, so the original familiarity never completes.',
       '§506.2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='evasion' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Intervention occurs when an intermediate planet enters the sequence between the original applying and receiving planets so that the intended conjunction is diverted before it can perfect.',
       '§506.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='intervention' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni gives two forms of abscission of light, both involving a third planet redirecting the chain of application so that an intended contact is cut off or postponed. He treats this separately from intervention, refranation and prevention.',
       '§506.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='abscission-of-light' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni describes collection when two planets separately apply to a superior planet that gathers their light. He allows this collected light to substitute for direct conjunction even where the applying planets are themselves inconjunct.',
       '§510', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='collection-of-light' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni gives several forms of translation: an inferior planet may carry the light of an intermediate planet to a superior one, or separate from one planet and join another, thereby transferring the prior influence. He warns that related terminology in the books can be ambiguous.',
       '§510', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='translation-of-light' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Opening the doors is a weather-astrology configuration involving planets whose natures or domiciles stand in opposition. Al-Biruni associates different planetary pairs with rain, storms or winds and explicitly explains that the operative opposition is qualitative or domiciliary rather than simply zodiacal opposition.',
       '§511', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='opening-the-doors' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The combust way is the interval from the latter part of Libra through the first part of Scorpio. Al-Biruni explains its adverse reputation through the falls of the luminaries and the presence of malefic dignities in this region, making it a zodiacal condition distinct from ordinary solar combustion.',
       '§514', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combust-way' AND w.slug='al-biruni-tafhim';

-- DIVISIONS OF JUDICIAL ASTROLOGY, NATIVITIES, ELECTIONS AND QUESTIONS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '335', '351', '515-530', 'Divisions of judicial astrology; world-years; nativities; elections; questions; boundary with thought-reading', NULL,
       'Methodological conclusion of the book. Stores only coherent technical doctrines and al-Biruni''s explicit boundary judgments.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'At world-year anniversaries al-Biruni calls the Salkhuda the lord of the year: first preference goes to a planet on the Ascendant or an angle with dignity in its degree; if none qualifies, a succedent candidate is considered, then a planet not inconjunct to the Ascendant or its lord. He separately records a Hindu succession by planetary days.',
       '§520', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-year' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In longevity doctrine al-Biruni describes the hyleg as the aphetic significator chosen from a restricted set of places including the luminary appropriate to the time, the Ascendant, the Part of Fortune and the preceding lunation. Directions for life are taken from the hyleg.',
       '§§521-523', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hyleg' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'After the hyleg is established, the kadkhuda is the planet strongest by dignity among those related to it. Its angular, succedent or cadent condition determines whether its assigned planetary number is interpreted as a greater, intermediate or lesser allowance of life, subject to additions and deductions.',
       '§522', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='kadkhuda' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni treats elections as the fourth division of judicial astrology. The method is to choose a beginning that places malefics and their rays away from the angles while strengthening the Ascendant and its lord, the Moon and its lord, and the significator of the intended business through benefic support and mutual aspect.',
       '§527', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='election' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For a question, al-Biruni uses the moment of the querent''s statement as a beginning analogous to a nativity. The Ascendant, its lord, the Moon and the planet from which the Moon separates signify the querent, while the relevant house and the planet to which the Moon next applies help signify the matter asked about.',
       '§528', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='horary-question' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni places attempts to divine an unstated hidden object or secret thought at the disreputable edge of the art. In his conclusion he warns that practices which pass beyond astrology''s proper limits into unsupported particulars expose both practitioner and discipline to ridicule.',
       '§§515 and 530', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='thought-reading' AND w.slug='al-biruni-tafhim';

INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'more-specific-than', 'Al-Biruni states that hayz contains the condition of halb plus additional sign-gender conformity.', 'draft'
FROM terms a, terms b WHERE a.slug='hayz' AND b.slug='halb';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'Al-Biruni explicitly distinguishes feral passage through a sign from ordinary void-of-course doctrine.', 'draft'
FROM terms a, terms b WHERE a.slug='feral' AND b.slug='void-of-course';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'The combust way is a zodiacal interval; combustion is a condition of proximity to the Sun.', 'draft'
FROM terms a, terms b WHERE a.slug='combust-way' AND b.slug='combustion';
