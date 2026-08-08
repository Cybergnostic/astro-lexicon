-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Third Tractatus, Parts I-II (PDF pp. 245-343), reviewed completely.
-- Only definition-level or substantively explanatory evidence is retained.
-- Long planetary catalogues, physiognomic lists, medical lists, regional lists and mere mentions are not exploded into lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('planetary-orb', 'Planetary Orb', 'A planet-specific angular reach extending before and after the planet, used to judge when its light or influence can engage another planet.', 'aspect and application doctrine', 'draft', 'Bonatti gives planet-specific values and explicitly says the orb extends before and after. Preserve source-specific values and do not force a single later orb doctrine onto all authors.'),
  ('planetary-rearing-period', 'Planetary Rearing Period', 'A sequence of life periods in which the seven planets successively govern fixed spans of years, beginning with the Moon and proceeding through Mercury, Venus, Sun, Mars, Jupiter and Saturn.', 'chronocrator doctrine', 'draft', 'Bonatti calls these years of rearing or nurture. His Venus value is textually suspect; retain the source reading with an editorial warning rather than silently correcting it.'),
  ('auge', 'Auge', 'The point of a planet\'s eccentric or deferent that is most remote from the Earth; movement toward or away from it changes the planet\'s apparent size, light and speed.', 'astronomical condition', 'draft', 'Latinized Arabic awj. Bonatti explicitly distinguishes the auge of the eccentric from the farther point of the epicycle.'),
  ('almuguea', 'Almuguea', 'A face-to-face planetary configuration defined by reproducing the zodiacal distance between the domiciles of the planets involved, with directional rules depending on which planet is the reference.', 'planetary relationship', 'draft', 'Bonatti attributes the doctrine to Ptolemy. It is not ordinary aspect doctrine and should not be normalized to one modern term without further evidence.'),
  ('alitifal', 'Alitifal', 'Bonatti\'s term, from Alchabitius, for continuation by bodily or aspectual application: a swifter planet moves toward a more ponderous planet and seeks completion of their joining.', 'application doctrine', 'draft', 'Bonatti gives both bodily and aspectual forms and discusses competing thresholds for when the joining begins.'),
  ('in-own-light', 'In Its Own Light', 'A condition in which a planet has emerged from the Sun\'s rays and has not yet joined another planet.', 'solar phase condition', 'draft', 'Bonatti uses this phrase after describing the solar phase cycle. Do not equate automatically with similarly translated sect terminology in other sources.'),
  ('joining-by-latitude', 'Joining by Latitude', 'An application or conjunction judged by planetary latitude rather than zodiacal longitude, including equal latitude on the same side of the ecliptic and an opposed north-south form.', 'application doctrine', 'draft', 'Bonatti treats this as significant especially in major judgments, though he notes many practitioners neglected it.'),
  ('dustoria', 'Dustoria', 'A compound planetary condition in which sect, gender, solar or lunar orientation and angular relationships combine to place a planet in a particularly secure or appropriate state.', 'planetary condition', 'draft', 'Bonatti explicitly links Dustoria with Hayz and similitude but then gives additional conditions. Keep Dustoria, Hayz and Aym/similitude related but not automatically identical.'),
  ('return-of-light', 'Return of Light', 'An interruption in which a third planet reaches the intended recipient first and the recipient gives back the earlier planet\'s light rather than completing the original joining.', 'perfection and impediment', 'draft', 'Bonatti closely connects this with abscission of light. Preserve his specific mechanism rather than collapsing it into every later use of reflection or cutting light.'),
  ('return-of-virtue', 'Return of Virtue', 'A condition in which a planet that has received another planet\'s virtue cannot retain it because of debility such as retrogradation or combustion and therefore gives it back to the donor.', 'reception and perfection', 'draft', 'Bonatti distinguishes useful and harmful returns according to the angular or cadent strength of the planets involved.'),
  ('planetary-contrariety', 'Contrariety', 'An impediment in which a planet unexpectedly retrogrades into and redirects an intended sequence of applications, preventing the expected planet from perfecting its joining.', 'perfection and impediment', 'draft', 'Bonatti treats Contrariety as distinct from refranation, frustration and prohibition.'),
  ('opening-of-gates', 'Opening of the Gates', 'Bonatti\'s name for the good will created when reception overcomes ordinary planetary hostility, as though the receiving planet opens its house to the other planet.', 'reception doctrine', 'draft', 'Defined at the end of the chapter on planetary friendships and hostilities.'),
  ('planetary-friendship', 'Planetary Friendship', 'A relationship of concord between planets based primarily on agreement in nature and secondarily on dignity or other affinities, affecting how freely a planet delivers its promised effects.', 'planetary relationship', 'draft', 'Bonatti gives both a catalogue of friendships and an explanatory principle; the principle is retained, not the catalogue as separate entries.'),
  ('planetary-hostility', 'Planetary Hostility', 'A relationship of discord between planets arising from contrary natures or opposed domiciles and exaltations, tending to make the delivery of signification less free or complete unless reception intervenes.', 'planetary relationship', 'draft', 'Bonatti says reception can override ordinary hostility and produce an opening of the gates.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Awj', 'Arabic transliteration', 'historical-language', 'Source of the Latinized form auge.' FROM terms WHERE slug='auge';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Continuation', 'English', 'translation', 'Bonatti glosses Alitifal as continuation.' FROM terms WHERE slug='alitifal';

-- Part I: planetary natures and general cycles.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '245', '299', 'Third Tractatus, Part I', 'Chapters I-XII',
       'Planetary natures, mixtures, orbs, planetary years, planetary rearing periods, lunar phases and forms', NULL,
       'Large catalogues of planetary proper indications were reviewed but not promoted into dozens of independent terms. Retain only reusable technical doctrines.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives each planet an orb extending before and after its body. The values stated here are Saturn 9°, Jupiter 9°, Mars 8°, Sun 15°, Venus 7°, Mercury 7° and Moon 12°. He later uses the interaction of planetary orbs to discuss when an application begins.',
       'Third Tractatus, Part I, Chapters I-VII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-orb' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes a repeating sequence of planetary nurture or rearing periods: Moon 4 years, Mercury 10, Venus 7 in the transmitted text, Sun 19, Mars 15, Jupiter 12 and Saturn 30; after Saturn the sequence returns to the Moon. The condition of each ruler colors its period.',
       'Third Tractatus, Part I, Chapter X', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-rearing-period' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeats the planetary-hour sequence from the ruler of the first hour and adds a separate classification in which odd-numbered day or night hours are masculine and even-numbered hours feminine.',
       'Third Tractatus, Part I, Chapter XI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-hour' AND w.slug='bonatti-liber-astronomiae';

-- Part II: conditions of planets in themselves.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '300', '306', 'Third Tractatus, Part II', 'Chapters I-II',
       'Auge, apparent magnitude and light, direct/retrograde/stationary motion, increase and decrease of course, planetary latitude', NULL,
       'Bonatti distinguishes astronomical mechanisms carefully. Translator diagrams and explanatory notes are not treated as Bonatti.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The auge is the most remote point of a planet\'s eccentric or deferent from the Earth. Bonatti explicitly rejects locating the auge on the epicycle: the epicycle itself travels around the eccentric and may therefore be at the auge, its opposition, or between them.',
       'Third Tractatus, Part II, Chapter I', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='auge' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines northern and southern planetary latitude by passage across the intersection of the planet\'s eccentric with the path of the Sun, then divides each half-cycle into ascending and descending phases.',
       'Third Tractatus, Part II, Chapter II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='orientality' AND w.slug='bonatti-liber-astronomiae';

-- Mutual planetary conditions: Almuguea, application, solar phase and latitude.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '307', '321', 'Third Tractatus, Part II', 'Chapters III-X',
       'Almuguea, Alitifal/application, solar orientality and occidentality, Dustoria/Hayz, combustion and heart of the Sun, joining by latitude, void course and feral condition', NULL,
       'High-value technical definitions. Preserve source-specific thresholds and terminology rather than normalizing them to later practice.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Almuguea is a “face-to-face” configuration. For the Sun, Bonatti calculates it by placing another planet at the same zodiacal separation from the Sun as that planet\'s domicile stands from Leo; he then gives analogous directional rules for the Moon and other planets.',
       'Third Tractatus, Part II, Chapter III', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='almuguea' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Alchabitius\' Alitifal is bodily or aspectual application. The swifter or lighter planet applies to the slower or more ponderous one. Bonatti distinguishes exact completion from the earlier stage in which the planets\' rays or orbs have begun to engage.',
       'Third Tractatus, Part II, Chapter IV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='alitifal' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives an extended phase doctrine for superior and inferior planets relative to the Sun, distinguishing strong and weak oriental and occidental phases, retrograde phases, combustion and emergence from the rays. These labels are phase-specific rather than a simple east/west visibility binary.',
       'Third Tractatus, Part II, Chapters V-VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='orientality' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives an extended phase doctrine for superior and inferior planets relative to the Sun, distinguishing strong and weak oriental and occidental phases, retrograde phases, combustion and emergence from the rays.',
       'Third Tractatus, Part II, Chapters V-VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='occidentality' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines Dustoria through a cluster of conditions involving Hayz or similitude: correspondence of planetary gender with sign gender, sect position above or below the horizon, solar or lunar orientation, and in one formulation angular relationships to a luminary. Because the chapter contains overlapping formulations, Dustoria should not be flattened into a single later definition of hayz.',
       'Third Tractatus, Part II, Chapter VII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dustoria' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti accepts the “heart of the Sun” condition only when a planet is within 16 minutes of the Sun in both longitude and latitude. If the longitude is within that limit but the latitude exceeds it, he still treats the planet as combust rather than strengthened.',
       'Third Tractatus, Part II, Chapter VII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'After a planet has emerged from the Sun\'s rays and before it joins another planet, Bonatti says it is “in its own light.” He uses this as a solar-phase condition, distinct here from the broader similitude/Hayz discussion.',
       'Third Tractatus, Part II, Chapter VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='in-own-light' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes conjunction or application by latitude from ordinary longitude application. Equal latitude on the same side of the ecliptic forms one kind, while an opposed north-south relationship forms another; he argues that this should not be neglected in major judgments.',
       'Third Tractatus, Part II, Chapter IX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='joining-by-latitude' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls a planet void in course after it has separated from a completed joining and makes no new joining, or even seeks none, until another application begins. He immediately distinguishes this from the feral or rustic condition.',
       'Third Tractatus, Part II, Chapter X', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet is feral or rustic when it is alone in a sign and no other planet aspects that sign. Bonatti treats this as a severe impediment and explicitly presents it separately from void course.',
       'Third Tractatus, Part II, Chapter X', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='wild' AND w.slug='bonatti-liber-astronomiae';

-- Transfer, impediments, reception and return.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '322', '336', 'Third Tractatus, Part II', 'Chapters XI-XVIII',
       'Transfer of nature, return and abscission of light, prohibition, donation of virtue/reception, return of virtue, refranation, contrariety, frustration and abscission', NULL,
       'Bonatti gives unusually explicit operational distinctions between multiple mechanisms that interrupt or redirect perfection.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes transfer of nature when a swift planet separates from a slower planet and applies to another, carrying the first planet\'s nature onward. He argues that dignity and reception are relevant to whether the nature can truly be entrusted and transferred, and he also gives a chained form through an intermediate planet.',
       'Third Tractatus, Part II, Chapter XI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='transfer' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Return of Light occurs when an intended recipient begins to receive one planet\'s light but another planet reaches it first; the recipient then gives back the earlier light. Bonatti treats the same configuration as an abscission because the original perfection is cut off.',
       'Third Tractatus, Part II, Chapter XII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='return-of-light' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives two principal forms of prohibition: an intervening planet perfects bodily conjunction with the target before the original applicant, or a closer aspectual applicant overrides another application. Bodily conjunction normally outranks an otherwise equal aspectual application.',
       'Third Tractatus, Part II, Chapter XIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Reception is the donation of disposition, nature and virtue from a dignity lord to a planet joined to it. Bonatti treats domicile and exaltation as sufficient for a strong reception; among the lesser dignities he normally requires two together, such as bound plus triplicity. He preserves a broader formulation from Alchabitius without silently resolving the difference.',
       'Third Tractatus, Part II, reception section following Chapter XIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'If the receiving planet is retrograde or combust, Bonatti says it may be unable to retain the donated virtue and gives it back to the donor. The result is useful when the relevant planets are angular or succedent and destructive when weakness or cadency prevents either planet from retaining and acting with the virtue.',
       'Third Tractatus, Part II, Chapter XIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='return-of-virtue' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Refranation occurs when an applying planet turns retrograde before completing its conjunction or aspect, so the intended perfection fails. Bonatti compares it to reins restraining a horse and gives Alchabitius\' name Alicichae.',
       'Third Tractatus, Part II, Chapter XV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Contrariety is a three-planet interruption in which a planet that would ordinarily move away instead retrogrades into the target first and then into the original applicant, destroying the expected sequence of perfection.',
       'Third Tractatus, Part II, Chapter XVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-contrariety' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti\'s frustration occurs when the planet being pursued leaves the sign before bodily perfection and encounters the rays of another planet in the next sign first. The new application takes precedence and the original applicant is frustrated.',
       'Third Tractatus, Part II, Chapter XVII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='frustration' AND w.slug='bonatti-liber-astronomiae';

-- Strength, besiegement, friendship and hostility.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '336', '343', 'Third Tractatus, Part II', 'Chapters XIX-XXIII',
       'Fortification and debility, besiegement, planetary friendship and hostility, opening of the gates', NULL,
       'Summary chapters consolidate earlier doctrine; only definitions that add independent value are stored.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines good besiegement when a planet lies between two benefics or their rays, separating from one and applying to the other; bad besiegement is the corresponding enclosure between two malefics or their rays. He extends the same idea to signs and says a close benefic aspect can dissolve an evil besiegement.',
       'Third Tractatus, Part II, Chapter XXI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='besieging' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes natural planetary friendship and hostility. Friendship is strongest when planets agree in nature; hostility can arise from contrary natures or opposed domiciles and exaltations. These relationships affect how readily a planet gives what it signifies.',
       'Third Tractatus, Part II, Chapters XXII-XXIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-friendship' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Planetary hostility makes a promised effect less freely or completely delivered, but Bonatti says reception can suspend ordinary hostility when the hostile planet is received in the other planet\'s dignity.',
       'Third Tractatus, Part II, Chapter XXII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-hostility' AND w.slug='bonatti-liber-astronomiae';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'When reception overcomes hostility, Bonatti calls the resulting welcome the “opening of the gates”: the receiving planet treats the other as a guest admitted safely into its house.',
       'Third Tractatus, Part II, Chapter XXII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='opening-of-gates' AND w.slug='bonatti-liber-astronomiae';
