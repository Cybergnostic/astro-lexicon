-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- First Tractate (PDF pp. 33-69) and Second Tractate, Part I (PDF pp. 70-84).
-- Only definition-level or substantively explanatory evidence is retained. Mere mentions, polemical repetitions, and catalogues are skipped.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('judicial-astrology', 'Judicial Astrology', 'The practical branch of astrology concerned with judging terrestrial matters from celestial configurations, especially times, places, signs, planetary positions and their effects.', 'astrological discipline', 'draft', 'Bonatti’s terminology is unstable in modern terms: he sometimes calls the contemplative mathematical branch astrology and the practical/judicial branch astronomy. Preserve this source-specific usage in interpretations.'),
  ('astral-influence', 'Astral Influence', 'The causal action attributed to celestial motions and configurations whereby the elemental world is altered and terrestrial generation, corruption and other natural changes occur.', 'natural philosophy of astrology', 'draft', 'Keep distinct from mere symbolic indication. Authors differ on how causal action and signification are related.');

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '33', '69', 'First Tractate', 'Chs. I-XIV', 'Utility, nature and scientific status of astrology', NULL,
       'Bonatti develops a natural-philosophical account of celestial causation, defines astronomy/astrology in several ways, treats contingent possibility, and argues for the practical value of foreknowledge.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti repeatedly defines the science of the stars through knowledge of celestial motions and their significations. His terminology is not identical with modern usage: in one formal division he calls the contemplative mathematical study of celestial magnitudes and motions astrology, while the practical art that judges terrestrial affairs from celestial configurations is astronomy. Elsewhere he also uses astrology more broadly for the whole science. The lexicon should therefore preserve the doctrinal distinction without forcing a modern terminological consistency onto the text.',
       'First Tractate, especially Chs. XI-XIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrology' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines the practical or judicial branch as the art that responds to proposed questions and judges from the positions and natures of planets and signs. He says judgment depends on the understanding of times, places, signs, planetary positions and their effects, with the aim of knowing terrestrial matters in the past, present and future.',
       'First Tractate, Chs. XI-XII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='judicial-astrology' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti states that celestial bodies are not composed of the four corruptible elements but of a fifth essence. Because this celestial substance is incorruptible and not subject to elemental alteration, the heavenly bodies remain distinct in kind from the sublunary bodies on which they act.',
       'First Tractate, Ch. I', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fifth-nature' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explains astral influence as a natural causal chain: celestial motions alter the elemental qualities of the sublunary world; the elements then mix, separate and change, producing generation, corruption and other terrestrial alterations. He therefore treats celestial action as mediated through the four elements rather than as direct personal governance of individual beings.',
       'First Tractate, Chs. II and V-VI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astral-influence' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti places the possible or contingent between the necessary and the impossible. A possible event is one that can become actual but need not do so; he argues that astrological judgment concerns precisely such contingent matters rather than only what must happen or cannot happen.',
       'First Tractate, Ch. VII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='contingency' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti argues that foreknowledge is useful because a known future condition can be prepared for, avoided, or at least mitigated. His examples range from weather and shortages to personal affairs; the doctrinal point is that prediction has practical value even when the underlying celestial indication is not simply erased.',
       'First Tractate, Ch. IX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='foreknowledge' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '70', '84', 'Second Tractate, Part I', 'Chs. I-VII', 'Twelve signs, four elements, triplicities and the ordering of the zodiac', NULL,
       'Bonatti grounds the twelve-sign structure in four elemental natures expressed through three stages or modes, and explains the elemental triplicities as groups of three signs acting on the same element.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines the zodiac as twelve equal signs and links the number twelve to four elemental natures expressed through three stages: beginning, middle and end. In his natural-philosophical explanation the signs are celestial and incorruptible, while their revolutions act upon the four sublunary elements.',
       'Second Tractate, Part I, Ch. I', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='zodiac-sign' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes the four elements by the paired qualities hot, cold, wet and dry, while also assigning each element a proper dominant quality. As pure elements they are simple; when mixed with one another they exhibit compound qualities: fire hot and dry, air hot and wet, water cold and wet, earth cold and dry.',
       'Second Tractate, Part I, Ch. III', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='four-elements' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats each elemental triplicity as three signs of one elemental nature acting on the same element in three different modes corresponding broadly to beginning, middle and end. Thus the fiery, earthy, airy and watery signs form four groups of three, with the three signs of each group differing in how they further generation, conservation, corruption or destruction.',
       'Second Tractate, Part I, Chs. I-II', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity' AND w.slug='bonatti-liber-astronomiae';
