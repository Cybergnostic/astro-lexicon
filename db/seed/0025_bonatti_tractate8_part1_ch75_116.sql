-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 8.1, Revolutions of the Years of the World, Chapters 75-116 (PDF pp. 441-502; p. 503 is blank).
-- Only definition-level or substantively explanatory evidence is retained.
-- Long planet-in-sign/house catalogues, individual fixed-star lists, regional predictions, examples and mere mentions are reviewed but not exploded into lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('fixed-star-conjunction', 'Fixed-Star Conjunction', 'A conjunction in which a planet, house cusp, or other significator occupies the same zodiacal degree as a fixed star; in Bonatti, the effect intensifies as the conjunction approaches exact degree-and-minute coincidence.', 'fixed-star doctrine', 'draft', 'Bonatti applies this in revolutions, nativities and questions. His listed stellar longitudes are epoch-dependent historical data and should not be presented as timeless positions.'),
  ('malefic-fixed-star', 'Malefic Fixed Star', 'A fixed star classified as naturally harmful in judgment, whose conjunction with a significator or angle is taken to add impediment according to the star\'s nature and the place involved.', 'fixed-star doctrine', 'draft', 'This is a source classification, not an absolute modern claim. Bonatti gives a catalogue of stars and planetary natures, but the catalogue itself is not promoted into separate lexicon entries.'),
  ('benefic-fixed-star', 'Benefic Fixed Star', 'A fixed star classified as naturally fortunate in judgment, whose conjunction with a significator or angle is taken to strengthen or improve the signification according to its nature and place.', 'fixed-star doctrine', 'draft', 'Bonatti explicitly contrasts these with unfortunate fixed stars. Individual historical coordinates are not normalized as permanent stellar positions.'),
  ('comet-judgment', 'Comet Judgment', 'A mundane method of interpreting a comet from its form, color, sign and place of first appearance, direction or tail, planetary resemblance, and whether it appears toward the east or west.', 'mundane astrology', 'draft', 'Bonatti transmits a ninefold comet classification. The reusable doctrine is the interpretive method; the long catalogue of predicted events is not promoted into separate entries.'),
  ('eclipse-duration-rule', 'Eclipse Duration Rule', 'A timing rule that converts the observed duration of an eclipse into the expected duration of its mundane effects, using different time scales for solar and lunar eclipses.', 'mundane astrology', 'draft', 'Bonatti states one year of effect for each hour of a solar eclipse and one month for each hour of a lunar eclipse. Preserve this as a historical rule rather than a modern astronomical claim.');

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '441', '470', 'Treatise 8.1: Revolutions of the Years of the World', 'Chapters 75-103',
       'Planetary house/sign catalogues; Mercury and Moon; Head and Tail of the Dragon; transition to comets', NULL,
       'The long delineation catalogues were reviewed sequentially. Only reusable technical doctrine is extracted; individual mundane predictions are source context.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly applies the same general rule to planets in mundane revolutions: natural signification is modified by condition, house, sign, reception, and benefic or malefic testimony. He explicitly warns that a naturally malefic planet can signify accidental good when well disposed, while a benefic can be corrupted when badly impeded.',
       'Treatise 8.1, Chapters 75-102', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='benefic' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the Head of the Dragon as increasing the signification of the house in which it falls: joined to benefics it increases good, while joined to malefics it increases evil. The rule is therefore one of amplification rather than simple beneficence.',
       'Treatise 8.1, Chapter 105', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='head-of-dragon' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the Tail of the Dragon primarily as diminishing or removing the signification of the house in which it falls. Because the underlying house matter can itself be good or bad, diminution may reduce either fortune or misfortune.',
       'Treatise 8.1, Chapter 106', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='tail-of-dragon' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '471', '487', 'Treatise 8.1: Revolutions of the Years of the World', 'Chapters 104-110',
       'Comets; Head and Tail in the houses; unfortunate and fortunate fixed stars and their conjunctions', NULL,
       'Individual star coordinates are historical and epoch-dependent. They were reviewed but are not stored as timeless catalogue entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti judges a fixed-star conjunction by exact zodiacal coincidence. A star on the same degree as a significator or angle is operative, and the closer the conjunction approaches exact minute coincidence, the stronger he considers the effect.',
       'Treatise 8.1, Chapters 107-110', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fixed-star-conjunction' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti groups certain fixed stars as unfortunate and assigns them planetary natures. When one is exactly joined to the Lord of the Year, another significator, or an angle, it adds impediment according to the place and the star\'s attributed nature. Benefic testimony can mitigate this according to its own strength.',
       'Treatise 8.1, Chapters 107-108', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='malefic-fixed-star' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti likewise lists fortunate fixed stars whose exact conjunction with an angle, Lord of the Year, or other significator strengthens the corresponding good. Jupiter or the Head of the Dragon can increase their fortunate action, while Saturn or the Tail can diminish it.',
       'Treatise 8.1, Chapters 109-110', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='benefic-fixed-star' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For comets, Bonatti transmits nine types and judges them from visible form and color, the sign and direction of appearance, planetary resemblance, and the direction of the tail or rays. Eastern appearance is treated as producing a faster manifestation than western appearance.',
       'Treatise 8.1, Chapters 103-104', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='comet-judgment' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '488', '502', 'Treatise 8.1: Revolutions of the Years of the World', 'Chapters 111-116',
       'Context-sensitive judgment; impeded lords of Ascendant and Midheaven; severe annual accidents; eclipses; worked ingress example', NULL,
       'The worked ingress is an example of method rather than a source for new terms. Al-mubtazz is mentioned but not sufficiently defined here, so no entry is created.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti emphasizes that the Lord of the Ascendant of the revolution participates even when another planet is Lord of the Year. Its impediment is interpreted through the angle or house in which the impediment occurs and through the nature of the sign and planet involved.',
       'Treatise 8.1, Chapter 112', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lord-of-year' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In annual judgment Bonatti treats strong reception by an unimpeded planet as capable of cancelling or substantially breaking an otherwise harmful testimony. This is a repeated practical function of reception, not merely a statement of dignity.',
       'Treatise 8.1, Chapters 112-116', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'When an eclipse occurs within the year, Bonatti says the ordinary annual judgment must be reconsidered through the eclipse figure, especially the eclipsed sign and its lord, the eclipse Ascendant, the Lord of the Year, and the significator of the king.',
       'Treatise 8.1, Chapter 115', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='world-year-revolution' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives a duration conversion for mundane eclipse effects: each hour of a lunar eclipse corresponds to one month of effect, while each hour of a solar eclipse corresponds to one year. He then times manifestations through the eclipse chart and subsequent solar or lunar motion.',
       'Treatise 8.1, Chapter 115', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='eclipse-duration-rule' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti closes the treatise with a worked ingress showing how the significator of the king, the significator of the common people, house rulers, projected rays, reception, cutting of light, and planetary condition are combined rather than judged as isolated testimonies.',
       'Treatise 8.1, Chapter 116', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='significator-of-king' AND w.slug='bonatti-liber-astronomiae';
