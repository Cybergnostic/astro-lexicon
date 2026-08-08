-- Guido Bonatti, Liber Astronomiae, Treatise 9, Part 3.
-- Sequential extraction: Twelfth House and concluding predictive chapters, compiled PDF pp. 1191-1221.
-- PDF p. 1222 begins the bibliography, so this completes the substantive Treatise 9 text in this compilation.
-- Only definition-level or substantively explanatory evidence is retained.
-- Long planet-in-sign catalogues and historical prediction examples are reviewed but not promoted wholesale.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('profection', 'Profection', 'An annual advancement in which a natal significator is carried forward by one complete zodiacal sign for each completed solar year, with the same degree retained in the successive sign.', 'time lords and annual techniques', 'draft', 'Bonatti explicitly glosses profection as advancement and distinguishes it from the annual revolution itself. He also allows topic-specific profections from the Sun, Moon, Midheaven, Part of Fortune and topical houses.'),
  ('salkhuday', 'Sālkhudāy', 'The ruler of the sign reached by an annual profection, acting as the profected Lord of the Year and as a helper to the ruler of the annual revolution.', 'time lords and annual techniques', 'draft', 'Keep distinct from a generic Lord of the Year. In Bonatti this is specifically the lord of the profected sign.'),
  ('planetary-elevation', 'Planetary Elevation / Eminence', 'A comparison of two planets in which the one occupying the higher relevant position is treated as prevailing over the other, whether by epicyclic position or by ecliptic latitude.', 'planetary strength', 'draft', 'Bonatti transmits more than one method under eminence/elevation. Do not reduce this automatically to the later aspect doctrine of overcoming.'),
  ('lord-of-orb', 'Lord of the Orb / Circle', 'A yearly ruler obtained by pairing the lord of the relevant natal house or sign with the lord of the corresponding planetary hour in a repeating annual sequence.', 'time lords and annual techniques', 'draft', 'Bonatti follows al-Qabisi and later reports an alternative planet-by-planet sequence. Preserve this separately from profection and firdaria.'),
  ('primary-direction', 'Primary Direction', 'A predictive direction that carries a significator toward another zodiacal place and converts the equatorial arc between them into time, conventionally taking one year for each degree of directional arc.', 'directions', 'draft', 'Bonatti gives different calculations for angles and intermediate places and explicitly distinguishes zodiacal positions from equatorial timing arcs. Historical predictive technique.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Advancement', 'English', 'translation', 'Bonatti explains profectio as an annual advancement through successive signs.' FROM terms WHERE slug='profection';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Lord of the Profection', 'English', 'functional-equivalent', 'The planet ruling the sign reached by the profection.' FROM terms WHERE slug='salkhuday';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Lord of the Circle', 'English', 'translation', 'Alternative translation of Bonatti’s yearly lord of the orb/circle.' FROM terms WHERE slug='lord-of-orb';

-- TWELFTH HOUSE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1191', '1192', 'Treatise 9, Part 3', 'Twelfth House, Chapter 1', 'Twelfth House',
       'Hidden and jealous enemies', NULL,
       'Bonatti explicitly assigns hidden and jealous enemies to the twelfth and compares the twelfth significator with the Ascendant significator. Long planet-by-planet descriptions of enemy types are not promoted.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the natal house doctrine Bonatti assigns hidden and jealous enemies to the twelfth. He judges them through the twelfth and its strongest ruler, Saturn, the Part of Enemies and their relationship with the Ascendant and its significator; this contrasts with the seventh-house treatment of openly opposing enemies.',
       'Treatise 9, Part 3, Twelfth House, Ch. 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

-- The long Chapter 2 planet-in-domicile catalogue, pp. 1192-1202, was reviewed sequentially.
-- It is largely applied natal delineation rather than reusable lexical definition, so no term explosion is created from it.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1192', '1202', 'Treatise 9, Part 3', 'Twelfth House, Chapter 2', 'General house judgments',
       'General method followed by planet-in-domicile delineation catalogue', NULL,
       'Reviewed completely. The opening paragraphs provide a general benefic/malefic condition rule, but most of the section is a large planet-in-sign catalogue and is retained as corpus evidence rather than separate encyclopedia entries.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

-- FIRDARIA
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1202', '1204', 'Treatise 9, Part 3', 'Chapter 3', 'Firdaria',
       'Years of the firdaria and their dispositors', NULL,
       'Direct explanation of firdaria as disposed years. Bonatti gives sect-dependent starting luminary, principal planetary periods, one-seventh subperiod participation, and the nodes.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the firdaria “disposed years”: successive planets govern fixed portions of life, beginning from the sect luminary—Sun by day and Moon by night. Within each principal period the other planets participate successively in one-seventh subdivisions. The planetary condition in the nativity modifies whether its period increases fortunate or adverse indications. Bonatti explicitly distinguishes these periods from the years assigned by the kadkhuda.',
       'Treatise 9, Part 3, Ch. 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='fardar' AND w.slug='bonatti-liber-astronomiae';

-- PLANETARY EMINENCE / ELEVATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1204', '1205', 'Treatise 9, Part 3', 'Chapter 4', 'Planetary eminence',
       'Eminence or transit of one planet over another', NULL,
       'Bonatti transmits an epicyclic comparison and then a stronger latitude-based comparison. The arithmetic details are summarized rather than treated as separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives two ways in which one planet may be elevated over another. In the first, relative ascent or descent on the epicycle determines which planet stands above the other. He then calls the latitude method stronger: a northern planet is above a southern one; among two northern planets the more northern prevails, while among two southern planets the less southern prevails.',
       'Treatise 9, Part 3, Ch. 4', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-elevation' AND w.slug='bonatti-liber-astronomiae';

-- OPENING OF THE DOORS / GATES
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1205', '1206', 'Treatise 9, Part 3', 'Chapter 5', 'Opening of the gates',
       'Reception between planets whose domiciles are opposed', NULL,
       'Bonatti explicitly defines this form by opposed domiciles plus reception of the lighter planet by the heavier. This broadens the project evidence beyond the meteorological context recorded by al-Biruni.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Here Bonatti defines the opening of the gates as a reception between planets whose domiciles stand opposite one another. When the lighter planet joins the heavier and is received in the heavier planet’s domicile, exaltation, or two lesser dignities, the natural hostility is overcome by reception, like an enemy being honored in the host’s own house.',
       'Treatise 9, Part 3, Ch. 5', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='opening-the-doors' AND w.slug='bonatti-liber-astronomiae';

-- AL-BUST / COMBUST AND INCOMBUST HOURS
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1206', '1207', 'Treatise 9, Part 3', 'Chapter 6', 'Al-bust and combust/incombust hours',
       'Twelve-hour post-lunation divisions and repeating combust/incombust cycle', NULL,
       'This section overlaps Treatise 4 but transmits another organization of the twelve-hour planetary cycle. Dangerous historical examples are not reproduced as instructions.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti again transmits the repeating post-lunation sequence of twelve combust hours followed by seventy-two incombust hours. He also reports the name al-bust for a related twelve-hour cycle. This confirms the technical distinction between these hours and ordinary planetary combustion.',
       'Treatise 9, Part 3, Ch. 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='combust-hours' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In this later account, the incombust interval consists of the seventy-two hours following a twelve-hour combust interval, after which another twelve combust hours recur, continuing cyclically until the next lunation.',
       'Treatise 9, Part 3, Ch. 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='incombust-hours' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti transmits another version of the post-lunation duodena/al-bust doctrine: successive twelve-hour blocks are assigned to the planets in order, each divided into three four-hour sections governed by the three triplicity rulers associated with that planet, producing an eighty-four-hour planetary sequence before returning to the Sun. This differs from his earlier presentation and should remain source-specific.',
       'Treatise 9, Part 3, Ch. 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='moon-duodena-hours' AND w.slug='bonatti-liber-astronomiae';

-- PROFECTIONS
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1207', '1211', 'Treatise 9, Part 3', 'Chapters 7-9', 'Profections',
       'Annual profections of nativities and years of the world', NULL,
       'Core definition and operation retained. Bonatti’s nephew example and long historical mundane examples are reviewed but not promoted as terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines profection as an annual advancement through the zodiac: one complete sign is assigned to each completed solar year, while the natal degree within the sign is retained. After twelve signs the sequence returns to the starting sign. He distinguishes the profection from the annual revolution and says it modifies the revolution by strengthening or weakening what the revolution promises.',
       'Treatise 9, Part 3, Chs. 7-8', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='profection' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti allows profections to begin from different natal points according to topic: the Sun for honors, Moon for body and soul, Midheaven for profession, Part of Fortune and second house for wealth, and the appropriate topical house for relatives, partners, friends and other matters. These specialized profections remain subordinate to the natal promise.',
       'Treatise 9, Part 3, Ch. 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='profection' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The salkhuday is the lord of the sign reached by the annual profection. Bonatti treats it as a profected Lord of the Year that assists and modifies the planet ruling the Ascendant of the annual revolution; planets occupying or aspecting the profected place can act as additional co-helpers but are not themselves called the salkhuday.',
       'Treatise 9, Part 3, Chs. 7-8', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='salkhuday' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes mundane profections from natal profections. A natal profection begins from the natal Ascendant and advances one sign per solar year; a mundane profection can instead begin from Aries or from the known inception of a long-lived kingdom, religion or other major institution and is combined with its annual revolutions.',
       'Treatise 9, Part 3, Ch. 9', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='profection' AND w.slug='bonatti-liber-astronomiae';

-- SEVEN DIRECTED SIGNIFICATORS
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1211', '1213', 'Treatise 9, Part 3', 'Chapter 10', 'Directed significators',
       'Seven principal significators and the topics for which they are directed', NULL,
       'Bonatti lists Ascendant, Sun, Moon, Part of Fortune, Midheaven, prenatal conjunction and prenatal opposition. The topical catalogue is retained as a substantial explanation of directional practice.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti identifies seven principal points that may be directed: Ascendant, Sun, Moon, Part of Fortune, Midheaven, prenatal conjunction and prenatal opposition. He assigns them distinct topical roles—personal/body matters, honor, bodily and marital condition, wealth, profession, and broader life indications from the prenatal syzygy—before judging their directed contacts with benefic, malefic or intermediate promittors.',
       'Treatise 9, Part 3, Ch. 10', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='primary-direction' AND w.slug='bonatti-liber-astronomiae';

-- TWELFTH-PARTS / DODECATEMORIA
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1213', '1214', 'Treatise 9, Part 3', 'Chapter 11', 'Twelfth-parts',
       'Twelve equal divisions of each sign', NULL,
       'Bonatti describes each sign as twelve divisions of 2°30′ and assigns them successively to the twelve signs. Translator commentary about alternative calculation is not attributed to Bonatti.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes the twelfth-parts as twelve equal divisions of a sign, each measuring two degrees thirty minutes and corresponding successively to the twelve signs. The sign associated with the occupied twelfth-part and its lord are treated as modifying the original significator.',
       'Treatise 9, Part 3, Ch. 11', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='dodecatemorion' AND w.slug='bonatti-liber-astronomiae';

-- NINTH-PARTS
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1214', '1216', 'Treatise 9, Part 3', 'On the ninth-parts', 'Ninth-parts',
       'Nine equal divisions of a sign and their rulers', NULL,
       'Bonatti gives a direct operational definition. The sequence begins from the movable sign of the relevant triplicity and proceeds through successive zodiacal signs.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides each sign into nine equal ninth-parts of three degrees twenty minutes. The rulership sequence begins from the ruler of the movable sign belonging to the relevant triplicity, then proceeds through the rulers of the successive zodiacal signs. The ruler of the occupied ninth-part modifies the condition of the natal, horary or electional significator being judged.',
       'Treatise 9, Part 3, ninth-parts section', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='ninth-nawbahr' AND w.slug='bonatti-liber-astronomiae';

-- LORD OF THE ORB / CIRCLE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1216', '1219', 'Treatise 9, Part 3', 'Chapters 13-14', 'Lord of the orb',
       'Annual cycle of house rulers and planetary-hour rulers', NULL,
       'Bonatti presents al-Qabisi’s method and an alternative sequence. The detailed fractional additions/subtractions are stored as internal method notes rather than separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For each year Bonatti pairs a natal house or sign ruler with the ruler of the corresponding planetary hour: the first pair governs the first year, the second pair the second, and so on through twelve, after which the remaining hours continue the sequence. These rulers modify the condition of the topic belonging to that house in the corresponding year. He calls each such yearly ruler a Lord of the orb or circle.',
       'Treatise 9, Part 3, Chs. 13-14', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='lord-of-orb' AND w.slug='bonatti-liber-astronomiae';

-- PRIMARY DIRECTION CALCULATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '1219', '1221', 'Treatise 9, Part 3', 'Chapter 15', 'Primary directions',
       'Direction of a significator by right and oblique ascension', NULL,
       'Bonatti gives the angular and intermediate-place calculations, largely following al-Qabisi. Preserve the conceptual distinction between zodiacal positions and equatorial timing arc; arithmetic detail remains source evidence rather than a proliferation of terms.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines directional practice as carrying a chosen significator toward another zodiacal place and measuring the arc between them. For points on the horizon he uses oblique ascensions of the region; for the meridian he uses right ascension; intermediate positions require an interpolation according to distance from the nearest meridian angle. The resulting equatorial arc supplies the timing, conventionally at one year per degree.',
       'Treatise 9, Part 3, Ch. 15', 'direct', 'draft'
FROM terms t CROSS JOIN works w
WHERE t.slug='primary-direction' AND w.slug='bonatti-liber-astronomiae';

-- Citation links for interpretations created in this seed.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Twelfth House, Ch. 1'
  AND sp.locator_text='Hidden and jealous enemies';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 3'
  AND sp.section='Firdaria';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 4'
  AND sp.section='Planetary eminence';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 5'
  AND sp.section='Opening of the gates';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 6'
  AND sp.section='Al-bust and combust/incombust hours';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope IN ('Treatise 9, Part 3, Ch. 7','Treatise 9, Part 3, Chs. 7-8','Treatise 9, Part 3, Chs. 7-9','Treatise 9, Part 3, Ch. 8','Treatise 9, Part 3, Ch. 9')
  AND sp.section='Profections';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 10'
  AND sp.section='Directed significators';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 11'
  AND sp.section='Twelfth-parts';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, ninth-parts section'
  AND sp.section='Ninth-parts';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Chs. 13-14'
  AND sp.section='Lord of the orb';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT id FROM editions WHERE work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 9, Part 3, Ch. 15'
  AND sp.section='Primary directions';
