-- Sequential extraction of William Lilly, Christian Astrology, Book I.
-- Digital retype of the 1647 text. Substantive Book I reviewed sequentially from PDF pp. 46-149;
-- PDF pp. 150-151 are a dignity table/title transition into Volume Two.
-- Only definition-level or substantively explanatory evidence is retained.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('partile-aspect', 'Partile Aspect', 'An aspect perfected at the same degree, treated as especially strong because the planets are at the exact zodiacal distance of the aspect.', 'aspect doctrine', 'draft', 'Lilly contrasts partile with platick aspects.'),
  ('platick-aspect', 'Platick Aspect', 'An aspect operating within the combined moieties of the two planets’ orbs rather than at exact degree perfection.', 'aspect doctrine', 'draft', 'Source spelling platick; preserve as an historical form.'),
  ('separation', 'Separation', 'The withdrawal of a faster planet from a conjunction or aspect after exact perfection, remaining operative until it clears the combined moieties of the relevant planetary orbs.', 'application doctrine', 'draft', 'Lilly distinguishes initial separation by minutes from total separation from the rays.'),
  ('antiscion', 'Antiscion', 'A reflected zodiacal degree related by equal distance from the tropical points Cancer and Capricorn.', 'zodiacal relation', 'draft', 'Lilly treats antiscions of benefics as comparable in quality to harmonious aspects.'),
  ('contra-antiscion', 'Contra-antiscion', 'The degree opposite an antiscion, treated by Lilly as analogous in quality to a square or opposition.', 'zodiacal relation', 'draft', 'Keep distinct from antiscion itself.'),
  ('cosignificator', 'Cosignificator', 'A secondary significator that participates in the matter alongside the principal significator.', 'signification doctrine', 'draft', 'Lilly uses the Moon as a general cosignificator of the querent in questions and also uses the word more broadly.'),
  ('almuten-of-figure', 'Almuten of the Figure', 'The planet having the greatest combined essential and accidental strength in the whole chart.', 'rulership and predominance', 'draft', 'Lilly distinguishes the almuten of a particular house from the almuten of the whole figure.'),
  ('radical-question', 'Radical Question', 'A horary question whose figure is considered fit for judgment according to agreement between the lord of the hour and the Ascendant ruler or their natures.', 'horary doctrine', 'draft', 'Lilly gives several cautions before judgment; do not universalize every caution as an absolute rule.'),
  ('derived-house', 'Derived House', 'A house reckoned from another person’s or topic’s significating house by treating that house as a temporary first house.', 'house doctrine', 'draft', 'Lilly explicitly describes this procedure at the end of Book I.'),
  ('accidental-fortitude', 'Accidental Fortitude', 'Strength arising from circumstances such as angularity, direct and swift motion, favorable aspects, solar phase or notable fixed-star contact rather than essential dignity.', 'accidental dignity', 'draft', 'Lilly contrasts accidental with essential fortitude in Chapter XVIII and the fortitude table.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Platick', 'English', 'source-spelling', 'Lilly’s spelling for a platic aspect.' FROM terms WHERE slug='platick-aspect';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Radical Figure', 'English', 'related-form', 'A figure judged capable of receiving horary judgment.' FROM terms WHERE slug='radical-question';

-- Introductory chart structure, house doctrine and technical vocabulary.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '46', '77', 'Book I', 'Chapters I-VII',
       'Planets, signs and aspects; erection of a figure; houses, quadrants, angularity and house significations', NULL,
       'Sequentially reviewed. Mechanical ephemeris instructions are retained only where they define reusable vocabulary.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines the almuten of a particular house as the planet possessing the most dignities in the sign on that house cusp. He separately defines the almuten of the whole figure as the planet most powerful in the chart by the combination of essential and accidental dignity.',
       'Book I, Chapter VI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='almuten-of-figure' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A cosignificator is a secondary planet participating in the same matter as the principal significator. Lilly later makes the Moon a general cosignificator of the querent in questions, while other planets can also assist or hinder the principal significator according to their relation and nature.',
       'Book I, Chapters VI and XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cosignificator' AND w.slug='lilly-christian-astrology';

-- Planetary and sign catalogues, essential dignity and sign subdivisions.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '78', '126', 'Book I', 'Chapters VIII-XVIII',
       'Planetary natures and dignities; signs and their divisions; antiscions; essential and accidental fortitude', NULL,
       'Long catalogues of herbs, animals, diseases, countries and body descriptions were reviewed but not promoted as separate lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines a planet as peregrine when it occupies a degree in which it has no essential dignity by house, exaltation, triplicity, term or face. He explicitly notes that possession of even a term or face prevents the planet from being peregrine.',
       'Book I, Chapters VIII and XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='peregrine' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly treats essential strength as arising from house, exaltation, triplicity, term and face, while accidental strength comes from conditions such as direct and swift motion, angular placement, favorable aspects, freedom from solar affliction and certain fixed-star contacts.',
       'Book I, Chapter XVIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='accidental-fortitude' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'An antiscion is found by reflecting a planet’s degree across the tropical axis so that the two positions are equally distant from the first degrees of Cancer and Capricorn. Lilly treats the reflected point as capable of transmitting planetary influence.',
       'Book I, Chapter XVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='antiscion' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The contra-antiscion is the zodiacal degree opposite the antiscion. Lilly says antiscions of benefics are analogous in quality to sextile or trine, while contra-antiscions are analogous to square or opposition.',
       'Book I, Chapter XVI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='contra-antiscion' AND w.slug='lilly-christian-astrology';

-- Dense technical glossary in Chapter XIX.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '126', '136', 'Book I', 'Chapter XIX',
       'Partile/platic aspects, application, separation, prohibition, refranation, translation, reception, peregrination, void course, frustration, hayz, solar conditions, besiegement and motion', NULL,
       'Core definition block. This source passage should be linked to each retained interpretation below.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A partile aspect is exact by degree: the two planets stand at the precise zodiacal distance required for the aspect. Lilly treats this as especially strong for both favorable and unfavorable indications.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='partile-aspect' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A platick aspect is operative within the combined moieties of the planets’ orbs even though the aspect is not exact by degree. Lilly illustrates this by adding half of each planet’s orb to determine whether the aspect remains effective.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='platick-aspect' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines application as two planets drawing nearer by conjunction or one of the major aspects, ordinarily with the lighter and faster planet applying to the slower and heavier. Retrogradation can reverse or complicate the normal order, and he distinguishes three motion patterns of application.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Separation begins after exact perfection once the faster planet has moved beyond the other by minutes, but Lilly distinguishes this from complete freedom from the other planet’s rays. Total separation is reached only after clearing the sum of the moieties of both planetary orbs.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='separation' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Prohibition occurs when two significators are applying toward perfection but a third, faster planet intervenes by body or aspect before they perfect, thereby hindering or delaying the intended result.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Refrenation is a failure of intended perfection when the applying planet turns retrograde before completing the conjunction or aspect and therefore withdraws from the contact.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Translation of light and nature occurs when a lighter planet separates from one significator and then applies to another heavier planet, carrying the first planet’s virtue or influence to the second. Lilly allows this through conjunction or aspect.',
       'Book I, Chapters XIX and XXI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='translation-of-light' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Reception is a reciprocal relation in which the significators occupy each other’s dignities. Lilly ranks reception by house as strongest but also allows triplicity, term, face or other essential dignity, and says mutual reception can enable perfection where ordinary aspects are difficult or absent.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet is void of course when, after separating from a planet, it makes no further application to another while remaining in the same sign. Lilly notes the Moon as the most common example.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Frustration occurs when a faster planet is trying to join a slower one, but before their conjunction perfects the slower planet joins a third planet first, preventing the original contact from completing as intended.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='frustration' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines hayz as a masculine diurnal planet above the earth by day in a masculine sign, or a feminine nocturnal planet below the earth by night in a feminine sign.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hayz' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For Lilly, combustion requires the planet to be in the same sign as the Sun and within 8°30′ of it. He distinguishes this from the wider condition under the beams and says applying combustion is more afflicting than separating combustion.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calls a planet under the Sun’s beams until it is fully separated from the Sun by seventeen degrees, a wider condition than combustion.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Cazimi or being in the heart of the Sun is defined by Lilly as being within seventeen minutes of the Sun, forward or backward, and is treated as a fortifying condition rather than combustion.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines besieging bodily: a planet is placed between Saturn and Mars. This is narrower than authors who also define besiegement by rays, so the source distinction should remain visible.',
       'Book I, Chapter XIX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='besiegement' AND w.slug='lilly-christian-astrology';

-- Horary radicality, significators, perfection and derived houses.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '142', '149', 'Book I', 'Considerations before Judgment; Chapters XX-XXI',
       'Radicality; querent, quesited and significator; four principal ways of perfection; derived-house procedure', NULL,
       'Book I closes at original p.128 / PDF p.149. The following PDF page is a table/title transition.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calls a question radical or fit for judgment when the lord of the hour agrees with the Ascendant ruler by identity, triplicity, or compatible planetary nature. He adds cautions concerning very early or late degrees, the Moon’s condition and the state of the seventh house, but presents these as considerations before judgment rather than a single universal test.',
       'Book I, Considerations before Judgment', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='radical-question' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines the querent as the person asking the question, the quesited as the person or thing sought, and the significator as the planet ruling the relevant house. The Ascendant and its lord signify the querent, while the house appropriate to the matter and its lord signify the quesited.',
       'Book I, Chapter XX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='horary-question' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly says matters can perfect principally through direct conjunction or aspect of the significators, through translation of light, through collection of light, and in some cases through house placement. He qualifies all of these by dignity, angularity, reception, prohibition and refranation.',
       'Book I, Chapter XXI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='perfection' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Collection occurs when two principal significators do not behold one another but both apply to a heavier planet that receives them in dignity; that third planet gathers both lights and can bring the matter to perfection.',
       'Book I, Chapter XXI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='collection-of-light' AND w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For questions about another person, Lilly treats that person’s significating house as a temporary first house and counts the remaining houses from it. Thus the next house becomes that person’s second, the following their third, and so on around the chart.',
       'Book I, Chapter XXI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='derived-house' AND w.slug='lilly-christian-astrology';

-- Add citations for all Lilly Book I interpretations created above to the most specific supporting passage.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND i.scope='Book I, Chapter XIX'
  AND sp.locator_text LIKE 'Partile/platic aspects%';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND i.scope IN ('Book I, Considerations before Judgment','Book I, Chapter XX','Book I, Chapter XXI')
  AND sp.locator_text LIKE 'Radicality;%';
