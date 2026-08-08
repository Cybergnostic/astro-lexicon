-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 8.1, Revolutions of the Years of the World, Preface and Chapters 1-74 (PDF pp. 369-440).
-- Only definition-level or substantively explanatory evidence is retained.
-- Long mundane catalogues (planet-in-sign, region, population, weather, disease, commodity and event lists) were reviewed but are not exploded into lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('annual-revolution', 'Annual Revolution', 'A chart and judgment based on the Sun returning to the same zodiacal degree and minute from which a year is reckoned.', 'prognostic technique', 'draft', 'Bonatti uses revolution broadly for the Sun returning to a specified starting point. The starting point differs for a world-year revolution, a nativity, or another inception.'),
  ('world-year-revolution', 'Revolution of the Year of the World', 'An annual mundane revolution cast for the Sun\'s entrance into the first minute of Aries and judged for the condition of the coming year.', 'mundane astrology', 'draft', 'Bonatti explicitly distinguishes this from the annual revolution of a nativity or other inception.'),
  ('nativity-year-revolution', 'Revolution of the Year of a Nativity', 'An annual revolution measured from the Sun\'s exact zodiacal position at birth until its return to the same point.', 'prognostic technique', 'draft', 'This is Bonatti\'s explicit definition in Treatise 8.1; it corresponds structurally to what later literature commonly calls a solar return, but that synonym should be normalized only with cross-source evidence.'),
  ('lord-of-year', 'Lord of the Year', 'The principal planetary ruler selected for an annual revolution by a hierarchy of rulership, angularity, dignity, condition and fallback criteria.', 'mundane and annual rulership', 'draft', 'Bonatti gives an unusually elaborate selection procedure. Do not reduce this to simply the ruler of the Ascendant.'),
  ('lord-of-revolution', 'Lord of the Revolution', 'The ruler governing the effective span of a particular revolution, which may cover a whole year, half-year, or quarter-year depending on the sign rising at the Aries ingress.', 'mundane and annual rulership', 'draft', 'Bonatti explicitly says every Lord of the Year is a Lord of the Revolution, but not every Lord of the Revolution governs the whole year.'),
  ('significator-of-king', 'Significator of the King', 'The planet selected in a mundane revolution to represent the king, ruler, or highest governing authority of the region being judged.', 'mundane astrology', 'draft', 'Bonatti gives a ranked selection procedure centered on the tenth house, its rulers, the Sun, dignity and condition. It is a technical significator, not simply the natural signification of the Sun.'),
  ('clime', 'Clime', 'One of seven traditional geographical latitude divisions of the inhabited world, each associated in Bonatti\'s mundane doctrine with one of the seven planets.', 'mundane geography', 'draft', 'Historical astronomical-geographical framework. It should not be treated as a modern political or cultural geography.'),
  ('luminary-of-time', 'Luminary of the Time', 'The luminary having temporal authority in a judgment: the Sun by day and the Moon by night.', 'sect and rulership', 'draft', 'Bonatti repeatedly describes this as the luminary “whose authority it is.” This definition is retained because the day/night criterion is explicit and operational.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Revolution of the Year', 'English', 'source-phrase', 'Bonatti\'s general phrase for an annual solar revolution.' FROM terms WHERE slug='annual-revolution';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Luminary Whose Authority It Is', 'English', 'source-phrase', 'Recurring wording in the Dykes translation.' FROM terms WHERE slug='luminary-of-time';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '369', '380', 'Treatise 8.1: Revolutions of the Years of the World', 'Preface-Chapter 3',
       'Definition of annual revolutions; selection of the Lord of the Year and significator of the king; social significators', NULL,
       'High-value procedural material. Population-group catalogues are contextual and are not promoted into separate technical terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines a revolution of a year as the Sun\'s circular course from a specific degree and minute until its return to that same point. The same structure can be applied to the world-year, a nativity, or another inception.',
       'Treatise 8.1, Preface', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='annual-revolution' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The revolution of the year of the world begins at the Sun\'s entrance into the first minute of Aries and runs until the Sun returns to the same point. Bonatti uses it to judge the general condition of the coming year for a region.',
       'Treatise 8.1, Preface', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='world-year-revolution' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For a nativity, Bonatti defines the annual revolution from the exact minute occupied by the Sun at birth until the Sun again returns to that same zodiacal point.',
       'Treatise 8.1, Preface', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='nativity-year-revolution' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti does not identify the Lord of the Year automatically with the ruler of the ingress Ascendant. He first tests the domicile lord of the Ascendant for condition and angular proximity, then proceeds through exaltation, the luminary of the time, bound and triplicity rulers, and if necessary through a ranked sequence of houses and further fallback testimonies. A retrograde or combust candidate is normally disqualified.',
       'Treatise 8.1, Chapter 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-year' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The luminary of temporal authority is the Sun in a diurnal revolution and the Moon in a nocturnal revolution. Bonatti repeatedly uses this luminary as one of the testimonies in selecting annual rulers and other significators.',
       'Treatise 8.1, Chapters 1 and 9-10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='luminary-of-time' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti selects the significator of the king through a hierarchy centered on the tenth house: first its domicile lord if fit, then its exaltation lord, the Sun, the planet with the greatest dignity in the tenth, and additional fallback testimonies. The selected planet is then judged for the condition of the ruler or highest authority.',
       'Treatise 8.1, Chapter 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='significator-of-king' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '381', '397', 'Treatise 8.1: Revolutions of the Years of the World', 'Chapters 3-13',
       'General mundane delineation, geographical divisions, climes, house rulers, ingress luminaries and exaltation degrees', NULL,
       'Long regional and event catalogues are retained only as source context. The reusable technical framework is extracted.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti divides the inhabited world into seven climes associated successively with Saturn, Jupiter, Mars, the Sun, Venus, Mercury and the Moon. In mundane judgment the planet associated with a clime has special authority there, while other planetary, sign and bound rulerships can participate.',
       'Treatise 8.1, Chapters 6-8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='clime' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the benefic or malefic character of planets as natural but not absolute in outcome. A naturally malefic planet can signify accidental good when free, strong and suitably related; a benefic can signify accidental evil when badly impeded or corrupted by another planet.',
       'Treatise 8.1, Chapter 55', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='benefic' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats maleficence as a natural planetary quality whose concrete operation is modified by condition, reception and aspect. A malefic that is free and well disposed can participate in good; when itself impeded or joined to another afflicted malefic it intensifies impediment.',
       'Treatise 8.1, Chapter 55', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='malefic' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '398', '440', 'Treatise 8.1: Revolutions of the Years of the World', 'Chapters 14-74',
       'King and populace, journeys, reception and disposition, duration of revolutions, clime judgment, planetary configurations and Saturn catalogues', NULL,
       'Sequentially reviewed through Chapter 74. Most of Chapters 55-74 are concrete mundane delineations rather than definitions and therefore are not promoted into separate lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explicitly distinguishes the Lord of the Year from the Lord of a shorter revolution. If a fixed sign rises at the Aries ingress, one revolution governs the whole year. If a common sign rises, the chart is renewed at the Libra ingress and each ruler governs a half-year. If a movable sign rises, the chart is renewed at Cancer, Libra and Capricorn, giving four quarterly Lords of the Revolution. Thus every Lord of the Year is a Lord of a Revolution, but a quarterly or half-year Lord is not necessarily Lord of the whole year.',
       'Treatise 8.1, Chapter 24', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-revolution' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In mundane revolutions, reception and the committing of disposition are used relationally: the significator that receives another can alter how willingly or effectively the represented parties cooperate. Bonatti applies this directly to the relation between ruler and subjects rather than treating reception as a generic score alone.',
       'Treatise 8.1, Chapter 20', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='bonatti-liber-astronomiae';
