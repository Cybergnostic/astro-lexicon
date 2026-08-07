-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part I, chapters 1-2 only. This pass follows the book in order rather than searching a predetermined term list.
-- Brill 2019 edition; public text should paraphrase and cite locators rather than reproduce copyrighted translation.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('astrology', 'Astrology', 'The science that infers terrestrial conditions and events from the natures, powers, movements, and configurations of the stars.', 'foundational doctrine', 'draft', 'Abū Maʿshar explicitly distinguishes astrology from the astronomical science he calls the science of the universe.'),
  ('science-of-the-universe', 'Science of the Universe', 'Abū Maʿshar’s name for the astronomical science of the spheres, planetary motions, distances, eclipses, and related quantities.', 'historical terminology', 'draft', 'Historical source term in the English translation; functionally astronomy, but preserve Abū Maʿshar’s own conceptual division.'),
  ('science-of-the-stars', 'Science of the Stars', 'The broader science comprising knowledge of celestial motions and the astrological inference drawn from them.', 'foundational doctrine', 'draft', 'In Part I chapter 2 Abū Maʿshar presents two species: the science of the universe and astrology.'),
  ('indication', 'Indication', 'The significatory relation by which a celestial condition points to a terrestrial condition, event, or quality.', 'foundational doctrine', 'draft', 'A pervasive technical concept in Abū Maʿshar. Keep distinct from causal power even when the two are discussed together.'),
  ('sublunary-world', 'Sublunary World', 'The terrestrial realm beneath the sphere of the Moon in which generation, corruption, and elemental change occur.', 'cosmological framework', 'draft', 'The translation uses the phrase “this world which is under the sphere of the Moon”.'),
  ('four-elements', 'Four Elements / Natures', 'Fire, air, water, and earth as the four mutable natures or elements of the sublunary world.', 'cosmological framework', 'draft', 'The translation often renders Arabic technical vocabulary as “natures” and glosses these as the four elements.'),
  ('lunar-mansions', 'Lunar Mansions', 'The twenty-eight divisions or stations associated with the Moon and used for observing terrestrial indications.', 'zodiacal and lunar division', 'draft', 'Part I chapter 2 refers to the Moon’s twenty-eight mansions as an observational basis for weather and other experienced indications.'),
  ('waxing', 'Waxing', 'The increase of the Moon’s light.', 'lunar condition', 'draft', 'Extracted as a distinct lunar condition; pair with waning rather than flattening both into a generic phase term.'),
  ('waning', 'Waning', 'The decrease of the Moon’s light.', 'lunar condition', 'draft', 'Extracted as a distinct lunar condition; pair with waxing.'),
  ('easternness', 'Easternness', 'A planetary condition described by relation to the east and to solar visibility or phase.', 'solar phase and accidental condition', 'draft', 'Abū Maʿshar uses easternness alongside westernness in Part I chapter 2; later parts should refine the technical definition.'),
  ('westernness', 'Westernness', 'A planetary condition described by relation to the west and to solar visibility or phase.', 'solar phase and accidental condition', 'draft', 'Abū Maʿshar uses westernness alongside easternness in Part I chapter 2; later parts should refine the technical definition.');

-- Source block: Part I, chapter 1, the scope and architecture of the work.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '43', '51', 'Part I', 'Chapter 1', '1.1-1.24',
       'The starting-point of the book and the seven headings; scope of the eight parts', NULL,
       'Abū Maʿshar defines the work as an introduction to astrology, distinguishes theoretical from practical classification, and outlines Parts I-VIII.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar presents astrology as a teachable science with principles, causes, arguments, and a systematic order. His stated aim is to explain what a beginner needs, including the conditions, natures, and indications of planets and signs separately and in combination.',
       'Part I, Chapter 1, §§1.7-1.10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrology' AND w.slug='abu-mashar-great-introduction';

-- Source block: Part I, chapter 2, distinction between astronomy and astrology.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '52', '79', 'Part I', 'Chapter 2', '2.1-2.31',
       'On the existence of astrology; two species of the science of the stars', NULL,
       'Defines the science of the universe and astrology, then argues from experienced solar, lunar, planetary, medical, agricultural, and meteorological effects.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar divides the science concerning the stars into two species. The first, which he calls the science of the universe, studies the spheres, their dimensions and motions, planetary order and speed, eclipses, and related astronomical quantities. The second is astrology, which studies planetary natures and indications and what results in the sublunary world from their movements and powers.',
       'Part I, Chapter 2, §§2.2-2.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='science-of-the-stars' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The science of the universe is Abū Maʿshar’s astronomical branch: the quality and quantity of the higher and planetary spheres, their distances and inclinations, the motions of the heavens and planets, planetary order and speed, occultations, and eclipses. He treats this branch as the basis from which astrology is obtained.',
       'Part I, Chapter 2, §§2.2-2.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='science-of-the-universe' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In Chapter 2 Abū Maʿshar defines astrology as knowledge of the nature of every planet and sphere, the properties of their indications, and what arises in the sublunary world from the powers of their movements, especially through changes of the elements and the generated things composed from them.',
       'Part I, Chapter 2, §2.4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrology' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Indication is central to Abū Maʿshar’s account of astrology: celestial motions and conditions signify or point toward terrestrial states and events. He repeatedly distinguishes what a planet indicates from the physical powers by which celestial motions alter the elemental world.',
       'Part I, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar describes the world beneath the lunar sphere as the realm in which fire, air, water, and earth alter, combine, generate living things and minerals, and undergo coming-to-be and passing-away under celestial influence.',
       'Part I, Chapter 2, §§2.4-2.5', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sublunary-world' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The four “natures” are fire, air, water, and earth. Abū Maʿshar treats their changes, mixtures, and relative dominance as the immediate material framework through which celestial motions produce and signify differences in seasons, bodies, plants, animals, and minerals.',
       'Part I, Chapter 2, §§2.4-2.26', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='four-elements' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar refers to the Moon’s twenty-eight mansions as observed stations used by experienced peoples to infer changes in weather and other terrestrial conditions. The passage treats them as part of an empirical tradition of lunar observation.',
       'Part I, Chapter 2, §§2.9 and 2.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='lunar-mansions' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Waxing is the increase of the Moon’s light; Abū Maʿshar associates changes in lunar light and condition with changes observed in animals, plants, minerals, waters, reproduction, and other terrestrial processes.',
       'Part I, Chapter 2, §§2.8-2.9 and 2.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='waxing' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Waning is the decrease of the Moon’s light; Abū Maʿshar treats it together with other changes of lunar condition as relevant to observed terrestrial changes.',
       'Part I, Chapter 2, §§2.8-2.9 and 2.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='waning' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar mentions planetary easternness among conditions tracked by experienced practitioners alongside westernness, lunar mansions, and waxing and waning. The exact technical solar-phase definition is deferred until the dedicated planetary-condition sections later in the work.',
       'Part I, Chapter 2, §2.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='easternness' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar mentions planetary westernness among conditions tracked by experienced practitioners alongside easternness, lunar mansions, and waxing and waning. The exact technical solar-phase definition is deferred until the dedicated planetary-condition sections later in the work.',
       'Part I, Chapter 2, §2.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='westernness' AND w.slug='abu-mashar-great-introduction';

-- Relations discovered in reading order.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subfield-of', 'Abū Maʿshar presents astrology as one of two species of the science concerning the stars.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='astrology' AND b.slug='science-of-the-stars';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subfield-of', 'The science of the universe is the astronomical species paired with astrology.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='science-of-the-universe' AND b.slug='science-of-the-stars';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contains', 'The sublunary world is characterized by the four mutable elements/natures.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='sublunary-world' AND b.slug='four-elements';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Complementary changes in the Moon’s light.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='waxing' AND b.slug='waning';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'paired-with', 'Complementary planetary phase terms; refine when Part VII is reached.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='easternness' AND b.slug='westernness';
