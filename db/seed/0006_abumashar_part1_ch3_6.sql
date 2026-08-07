-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part I, chapters 3-6. Read in order from original pp. 80-175 (PDF pp. 94-189).
-- Brill 2019 edition. Store paraphrases and locators, not extended copyrighted translation.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('fifth-nature', 'Fifth Nature', 'The distinct celestial nature attributed to the spheres and stars, unlike the four mutable sublunary elements.', 'cosmological framework', 'draft', 'Part I chapter 3. Philosophical-cosmological terminology used to explain why celestial bodies do not undergo ordinary elemental generation and corruption.'),
  ('celestial-power', 'Celestial Power', 'The power associated with celestial bodies and their movements by which sublunary bodies are moved, altered, and differentiated.', 'foundational doctrine', 'draft', 'Keep distinct from indication. Abū Maʿshar repeatedly moves between causal power and significatory indication but does not collapse them.'),
  ('coming-to-be-and-passing-away', 'Coming-to-be and Passing-away', 'Generation and corruption in the sublunary world produced through alteration and recombination of the four elements.', 'cosmological framework', 'draft', 'A foundational pair in Part I. Philosophical rather than uniquely astrological, but structurally important to Abū Maʿshar’s causal account.'),
  ('form', 'Form', 'The principle by which an individual belongs to a species and by which the elements are organized into a determinate natural thing.', 'natural philosophy', 'draft', 'Do not confuse with astrological figure/chart. This is Aristotelian natural-philosophical terminology in Part I chapter 4.'),
  ('natural-composition', 'Natural Composition', 'The combination and organization of elemental parts into a single natural individual.', 'natural philosophy', 'draft', 'Part I chapter 4.'),
  ('natured-things', 'Natured Things', 'Animals, plants, and minerals produced from the four elements and organized by form.', 'historical terminology', 'draft', 'Translation term used by Yamamoto/Burnett for Abū Maʿshar’s generated natural individuals. Preserve as historical terminology.'),
  ('universal-indication', 'Universal Indication', 'An indication applying to a genus, species, general condition, or other universal class.', 'doctrine of indication', 'draft', 'Part I chapter 5 explicitly argues from universal indications to individual and particular indications.'),
  ('particular-indication', 'Particular Indication', 'An indication applying to a particular individual, bodily part, quality, condition, or degree-specific matter.', 'doctrine of indication', 'draft', 'Part I chapter 5. The degree of a planet is also said to have a particular indication used for particular matters.'),
  ('contingency', 'Possibility / Contingency', 'The modal condition in which either of two alternatives can occur before the event is actualized.', 'foundational doctrine', 'draft', 'Part I chapter 5 uses Aristotelian arguments for the possible/contingent and connects it to deliberation, choice, and astrological prediction.'),
  ('foreknowledge', 'Foreknowledge', 'Knowledge in advance of future conditions or events, treated as the practical benefit of astrology.', 'predictive doctrine', 'draft', 'The central concept of Part I chapter 6. Abū Maʿshar argues that foreknowledge can permit avoidance, mitigation, preparation, or psychological readiness.'),
  ('world-year-revolution', 'Revolution of the World-Year', 'A revolution used for general or mundane indications affecting a region, city, or population.', 'predictive technique', 'draft', 'Part I §§5.26 and 6.7. Later sections should refine terminology and method.'),
  ('nativity-year-revolution', 'Revolution of the Year of a Nativity', 'An annual return or revolution judged in relation to a nativity for the conditions of a particular year.', 'predictive technique', 'draft', 'Part I §§5.26 and 6.8. Later dedicated material should refine the method and relation to profection/firdār.'),
  ('astrological-question', 'Astrological Question', 'A judgment made from a question concerning a person or matter, used alongside natal and annual techniques.', 'predictive technique', 'draft', 'Part I §6.8 explicitly lists a question about a person’s condition alongside birth and annual revolution as ways to know a particular future discomfort.');

-- Chapter 3: celestial action and the fifth nature.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '80', '91', 'Part I', 'Chapter 3', '3.1-3.9',
       'On the modality of celestial action; fifth nature; action through a medium; celestial power and terrestrial receptivity', NULL,
       'Read sequentially. Key distinction: celestial causal power is not identical with celestial indication.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar reports the philosophical doctrine that the spheres and stars are constituted from a fifth nature, distinct from fire, air, water, and earth, because celestial bodies do not undergo the ordinary elemental processes of alteration, generation, corruption, increase, and decrease.',
       'Part I, Chapter 3, §3.2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fifth-nature' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Celestial power is described as the moving and altering power of the heavenly bodies and their motions. Terrestrial bodies are naturally receptive to this power, and through that relation the elements change, combine, and generate or corrupt natural things.',
       'Part I, Chapter 3, §§3.3-3.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-power' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Coming-to-be and passing-away are the paired processes of generation and corruption in the sublunary world. Abū Maʿshar connects them to elemental alteration resulting from celestial motion, while maintaining divine permission and governance as the ultimate framework.',
       'Part I, Chapter 3, §§3.2-3.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='coming-to-be-and-passing-away' AND w.slug='abu-mashar-great-introduction';

-- Chapter 4: forms, elements, composition, and natured things.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '92', '105', 'Part I', 'Chapter 4', '4.1-4.18',
       'On forms, the four natures/elements, natural composition, natured things, genera/species, and planetary indications for individuals', NULL,
       'This chapter establishes a natural-philosophical vocabulary that underlies later astrological doctrine.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A form is the principle by which an individual belongs to a determinate species and by which the elemental material is directed toward a particular natural organization. Abū Maʿshar compares forms to craftsmen and the elements to their tools.',
       'Part I, Chapter 4, §§4.3-4.12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='form' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Natural composition is the organization of elemental parts into a single individual. Abū Maʿshar treats composition, form, and the four elements as jointly necessary for understanding generated natural things.',
       'Part I, Chapter 4, §§4.3-4.14', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natural-composition' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       '“Natured things” are the individual animals, plants, and minerals generated from the four elements. The translation uses this historical term to distinguish generated products from the underlying “natures” or elements.',
       'Part I, Chapter 4, §§4.3-4.14', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natured-things' AND w.slug='abu-mashar-great-introduction';

-- Chapter 5: universal/particular indication and contingency.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '106', '149', 'Part I', 'Chapter 5', '5.1-5.42',
       'Refutation of ten categories of opponents; universal and particular indication; possibility/contingency; observational and analogical foundations', NULL,
       'Long argumentative chapter. Extraction is limited to concepts that directly structure astrological doctrine or method.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes universal indications concerning elements, genera, species, and general conditions from indications concerning particular individuals. He argues that if celestial configurations indicate universals that are instantiated only in individuals, they also indicate those individuals and their conditions.',
       'Part I, Chapter 5, §§5.4-5.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='universal-indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Particular indication concerns individual persons or things, their bodily parts, qualities, and conditions. Later in the same chapter Abū Maʿshar says that the exact degree of a planet has a particular indication used for particular matters, whereas broader judgments often depend on signs, rulers, dignities, places, and general testimonies.',
       'Part I, Chapter 5, §§5.6 and 5.33', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='particular-indication' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar defends the existence of the possible or contingent against strict necessity. Before an action or event is actualized, alternatives may remain possible; deliberation and choice concern this field of possibility. He then argues that astrology concerns precisely such future possibilities and their eventual actualization.',
       'Part I, Chapter 5, §§5.7-5.21', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='contingency' AND w.slug='abu-mashar-great-introduction';

-- Chapter 6: benefit of foreknowledge and predictive branches.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '150', '175', 'Part I', 'Chapter 6', '6.1-6.22',
       'On the benefit of foreknowledge; avoidance, mitigation, preparation, general and particular prediction', NULL,
       'The chapter treats foreknowledge as practically useful even when an event itself cannot be prevented.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Foreknowledge is the practical fruit of astrology. Abū Maʿshar argues that advance knowledge can allow a person to avoid an event, reduce part of its harm, prepare for a temporary difficulty, arrange affairs before an unavoidable event, or receive future good without being overwhelmed by surprise.',
       'Part I, Chapter 6, §§6.2-6.21', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='foreknowledge' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar refers to revolutions of the world-years as a basis for general predictions affecting a clime, city, or population, including large-scale conditions. This is distinguished from techniques focused on a single nativity.',
       'Part I, §§5.26 and 6.7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='world-year-revolution' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The revolution of the year of a nativity is named as a way of judging a particular person’s condition for a year, alongside the nativity itself and a question. The detailed technique is not yet given in Part I.',
       'Part I, §§5.26 and 6.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='nativity-year-revolution' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A question is explicitly named as one of the astrological contexts from which the future condition of an individual may be judged. Part I does not yet set out the technical rules of interrogational astrology.',
       'Part I, Chapter 6, §6.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='astrological-question' AND w.slug='abu-mashar-great-introduction';

-- Relations established by Part I.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'causes-or-mediates', 'In Abū Maʿshar’s account, celestial power acts upon the four mutable elements of the sublunary world.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='celestial-power' AND b.slug='four-elements';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'occurs-within', 'Generation and corruption characterize the mutable world under the Moon.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='coming-to-be-and-passing-away' AND b.slug='sublunary-world';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contrasts-with', 'The celestial fifth nature is explicitly distinguished from the four sublunary elements/natures.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='fifth-nature' AND b.slug='four-elements';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialization-of', 'Particular indication applies the doctrine of indication to individual and degree-specific matters.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='particular-indication' AND b.slug='indication';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'specialization-of', 'Universal indication applies the doctrine of indication to general classes, genera, species, and conditions.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='universal-indication' AND b.slug='indication';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'practical-fruit-of', 'Part I presents foreknowledge as the practical benefit or fruit sought from astrological judgment.', 'draft'
FROM terms a CROSS JOIN terms b WHERE a.slug='foreknowledge' AND b.slug='astrology';
