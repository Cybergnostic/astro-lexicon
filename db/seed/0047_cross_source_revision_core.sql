-- Cross-source editorial revision, pass 1: core vocabulary and obvious extraction artifacts.
-- Run after db/migrations/0002_editorial_review.sql.
--
-- Principles:
-- 1. A canonical entry must denote a repeatable astrological/astronomical concept or a clearly
--    named historical concept needed to understand astrological doctrine.
-- 2. General natural-philosophical discussion is not promoted merely because it occurs in an
--    astrology book.
-- 3. Mention-only and misfiled source interpretations are removed once stronger evidence exists.
-- 4. Canonical definitions state what a thing IS; effects and applications remain source-specific.
-- 5. Quotes are sparse and short. They are stored only when the source wording itself is useful.

-- -----------------------------------------------------------------------------
-- ENTRY TYPE: distinguish core technical vocabulary from supporting context.
-- -----------------------------------------------------------------------------

UPDATE terms
SET entry_type='contextual'
WHERE slug IN (
  'fifth-nature',
  'celestial-power',
  'indication',
  'universal-indication',
  'particular-indication',
  'obvious-indication',
  'hidden-indication',
  'contingency',
  'foreknowledge',
  'science-of-the-stars',
  'science-of-the-universe',
  'sublunary-world',
  'four-elements'
);

UPDATE terms
SET entry_type='astronomical'
WHERE slug IN (
  'stellar-magnitude',
  'constellation',
  'fixed-stars',
  'quadrant-of-sphere',
  'waxing',
  'waning',
  'direct-motion',
  'station',
  'retrogradation'
);

-- These are general natural-philosophical or natural-history topics rather than useful
-- astrological lexicon entries. Their source passages remain searchable in the corpus.
DELETE FROM terms
WHERE slug IN (
  'form',
  'natural-composition',
  'natured-things',
  'coming-to-be-and-passing-away',
  'ebb-and-flow'
);

-- -----------------------------------------------------------------------------
-- MERGE EARLY PROVISIONAL PHASE LABELS INTO THE STRONGER CANONICAL TERMS.
-- Part I merely mentioned easternness/westernness; later extraction supplied the real
-- orientality/occidentality concepts. Do not retain four canonical entries for two phases.
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Easternness', 'English', 'source-translation',
       'Early Abū Maʿshar translation wording; normalized under Orientality after the dedicated planetary-condition material was reviewed.'
FROM terms WHERE slug='orientality';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Westernness', 'English', 'source-translation',
       'Early Abū Maʿshar translation wording; normalized under Occidentality after the dedicated planetary-condition material was reviewed.'
FROM terms WHERE slug='occidentality';

DELETE FROM terms WHERE slug IN ('easternness','westernness');

-- -----------------------------------------------------------------------------
-- REMOVE WEAK OR MISFILED INTERPRETATIONS.
-- -----------------------------------------------------------------------------

-- Abū Maʿshar Part V chapter 1 merely lists these among planetary shares. Later chapters
-- actually explain the doctrines, so the list occurrences add no independent definition.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction')
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('domicile','exaltation','fall','detriment'))
  AND scope='Part V, Ch. 1, planetary shares in the signs';

-- The Indian darīǧān doctrine belongs under the separate Darijan entry, not under the
-- ordinary Face / Decan entry.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction')
  AND term_id=(SELECT id FROM terms WHERE slug='face-decan')
  AND scope='Part V, Ch. 16, Indian decans';

-- Bonatti's Aym / own-similitude passage was stored as an interpretation of Sect chiefly to
-- warn against conflation. That is editorial cross-reference material, not a definition of Sect.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND term_id=(SELECT id FROM terms WHERE slug='sect')
  AND scope='Second Tractate, own similitude and Aym';

-- These Abū Maʿshar records describe applications/effects of already-defined concepts rather
-- than adding to their definitions.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction')
  AND term_id=(SELECT id FROM terms WHERE slug='waxing')
  AND scope IN ('Part III, Chapter 6, §§6.7-6.9', 'Part III, Chapter 9, §§9.2-9.10');

DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='abu-mashar-great-introduction')
  AND term_id=(SELECT id FROM terms WHERE slug='celestial-power')
  AND scope='Part III, Chapter 3, §§3.4-3.16';

-- -----------------------------------------------------------------------------
-- CANONICAL DEFINITIONS: cross-source wording.
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Application',
  short_definition='A planetary motion relation in which one planet approaches exact conjunction or aspect with another; ordinarily the faster or lighter planet applies to the slower or heavier one, though retrogradation can alter the pattern.',
  definition_quality=5,
  status='reviewed'
WHERE slug='application';

UPDATE terms SET
  label='Separation',
  short_definition='The condition after exact conjunction or aspect when two planets are moving apart. Authors may distinguish the moment separation begins from the later point at which the planets are wholly clear of one another’s operative orbs.',
  definition_quality=5,
  status='reviewed'
WHERE slug='separation';

UPDATE terms SET
  label='Reception',
  short_definition='A dignity relation in which a planet is placed in a dignity belonging to another planet. Some authors use reception broadly for this one-way relation, while others emphasize or define the reciprocal form now called mutual reception.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Do not flatten simple reception and mutual reception. Al-Bīrūnī explicitly defines one-way reception and then mutual reception; Lilly’s compact Book I definition is reciprocal.'
WHERE slug='reception';

UPDATE terms SET
  short_definition='Unequal subdivisions of a zodiacal sign assigned to planetary rulers. Different historical systems distribute the bounds differently, including Egyptian and Ptolemaic schemes.',
  definition_quality=5,
  status='reviewed'
WHERE slug='terms';

UPDATE terms SET
  short_definition='A relation in which a third planet intervenes before an intended application can perfect, preventing or delaying the original perfection. The exact forms and terminology differ between authors.',
  definition_quality=5,
  status='reviewed'
WHERE slug='prohibition';

UPDATE terms SET
  short_definition='Failure of an application because the applying planet turns retrograde before reaching the intended conjunction or aspect.',
  definition_quality=5,
  status='reviewed'
WHERE slug='refranation';

UPDATE terms SET
  short_definition='A mediation in which a faster planet separates from one significator and then applies to another, carrying the first planet’s light or disposition into the second contact.',
  definition_quality=5,
  status='reviewed'
WHERE slug='translation-of-light';

UPDATE terms SET
  short_definition='A mediation in which two significators separately apply to a third, slower or heavier planet, which gathers their lights and can bring the matter together. Additional reception requirements are source-specific.',
  definition_quality=5,
  status='reviewed'
WHERE slug='collection-of-light';

UPDATE terms SET
  short_definition='A failed intended conjunction in which the planet being applied to perfects a conjunction with another planet first, so the original conjunction does not occur.',
  definition_quality=5,
  status='reviewed'
WHERE slug='frustration';

UPDATE terms SET
  short_definition='A condition in which a planet, especially the Moon, has separated from a previous contact and makes no further application before leaving its current sign.',
  definition_quality=5,
  status='reviewed'
WHERE slug='void-of-course';

UPDATE terms SET
  short_definition='A planet occupying a degree in which it possesses none of the essential dignities recognized by the system being used.',
  definition_quality=5,
  status='reviewed'
WHERE slug='peregrine';

UPDATE terms SET
  short_definition='A solar-proximity condition in which a planet is close enough to the Sun to be treated as overwhelmed or impaired, but is outside the innermost cazimi condition. The numerical limit varies by author.',
  definition_quality=5,
  status='reviewed'
WHERE slug='combustion';

UPDATE terms SET
  label='Cazimi / In the Heart of the Sun',
  short_definition='The innermost solar-proximity condition, when a planet is extremely closely conjunct the Sun and is distinguished from ordinary combustion. Historical sources differ slightly over the exact minute threshold.',
  definition_quality=5,
  status='reviewed'
WHERE slug='cazimi';

UPDATE terms SET
  short_definition='A broad solar-obscuration condition in which a planet lies within the Sun’s rays but outside the narrower combustion limit. The boundary varies by author and, in some traditions, by planet.',
  definition_quality=5,
  status='reviewed'
WHERE slug='under-the-rays';

UPDATE terms SET
  short_definition='A compound sect condition in which a planet conforms to the day or night, its position above or below the horizon, and normally the gender of the sign. Exact requirements and related terminology vary between authors.',
  definition_quality=4
WHERE slug='hayz';

UPDATE terms SET
  short_definition='A planetary solar phase associated with being eastern of the Sun or emerging in the eastern phase. The exact criterion differs for superior and inferior planets and must be read source-specifically.',
  definition_quality=4
WHERE slug='orientality';

UPDATE terms SET
  short_definition='A planetary solar phase associated with being western of the Sun or entering the western phase. The exact criterion differs for superior and inferior planets and must be read source-specifically.',
  definition_quality=4
WHERE slug='occidentality';

UPDATE terms SET
  label='Head of the Dragon / Ascending Node',
  short_definition='The ascending lunar node: the intersection at which the Moon crosses the ecliptic from south to north.',
  definition_quality=5,
  status='reviewed'
WHERE slug='head-of-dragon';

UPDATE terms SET
  label='Tail of the Dragon / Descending Node',
  short_definition='The descending lunar node: the intersection at which the Moon crosses the ecliptic from north to south.',
  definition_quality=5,
  status='reviewed'
WHERE slug='tail-of-dragon';

UPDATE terms SET
  short_definition='A regular progression of significators through the zodiac. In annual profection one whole sign, or thirty degrees, is allotted to each solar year, repeating every twelve years.',
  definition_quality=5,
  status='reviewed'
WHERE slug='profection';

UPDATE terms SET
  short_definition='The annual return of the Sun to the exact zodiacal degree and minute it occupied in the natal radix, judged in comparison with the natal figure.',
  definition_quality=5,
  status='reviewed'
WHERE slug='solar-revolution';

UPDATE terms SET
  short_definition='The passage of a planet over, or by aspect to, natal cusps, planets, nodes, lots or other radical positions, used as a shorter-term timing or activation technique.',
  definition_quality=5,
  status='reviewed'
WHERE slug='transit';

UPDATE terms SET
  short_definition='A predictive technique that moves a natal significator toward a promittor and converts the resulting arc into time, in order to judge when a natal promise is expected to become active.',
  definition_quality=5,
  status='reviewed'
WHERE slug='primary-direction';

-- A node is defined by geometry, not by the effects attributed to it.
-- A canonical definition should therefore not build benefic/malefic judgments into the identity.

-- -----------------------------------------------------------------------------
-- EVIDENCE GRADES FOR THE FIRST REVIEWED CORE.
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'application','separation','reception','terms','prohibition','refranation',
      'translation-of-light','collection-of-light','frustration','void-of-course',
      'peregrine','combustion','cazimi','under-the-rays','profection',
      'solar-revolution','transit','primary-direction'
    )
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'application','separation','reception','terms','prohibition','refranation',
      'translation-of-light','collection-of-light','frustration','void-of-course',
      'peregrine','combustion','cazimi','under-the-rays','profection',
      'solar-revolution','transit','primary-direction'
    )
  );

-- -----------------------------------------------------------------------------
-- SELECTIVE SHORT QUOTES.
-- Lilly is quoted here because the 1647 text itself is public-domain and his wording is unusually
-- compact. Modern translations elsewhere in the corpus will receive only occasional short quotes.
-- -----------------------------------------------------------------------------

UPDATE source_passages
SET quote='It is when two Planets are drawing neer together either by Conjunction or Aspect.'
WHERE edition_id IN (
  SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology'
)
  AND locator_text='Application definition, pp. 107-108 of original pagination';

UPDATE source_passages
SET quote='Reception is when two Planets that are significators in any Question or matter, are in each others dignity.'
WHERE edition_id IN (
  SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology'
)
  AND locator_text='Reception definition, original p. 112';

UPDATE source_passages
SET quote='A Planet is then said to be Peregrine, when he is in the degrees of any Sign wherein he hath no essentiall dignity.'
WHERE edition_id IN (
  SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology'
)
  AND locator_text='Peregrine definition, original p. 112';

UPDATE source_passages
SET quote='A Planet is voyd of course, when he is seperated from a Planet, nor doth forthwith, during his being in that Sign, apply to any other.'
WHERE edition_id IN (
  SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology'
)
  AND locator_text='Void of course definition, original p. 112';

-- Narrow quotation passages for Book III, so a quote is not misleadingly attached to the whole
-- 27-page predictive-technique block.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '777', '778', 'Book III', 'Chapter CLXVI',
       'Definition of annual profection',
       'Profection and Progression are all one',
       'Short public-domain quotation selected during cross-source revision.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Definition of annual profection'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '796', '796', 'Book III', 'Chapter CLXXII',
       'Definition of solar revolution',
       'a Revolution or annuall Conversion is no other then the returne of the Sun',
       'Short public-domain quotation selected during cross-source revision.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Definition of solar revolution'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '892', '892', 'Book III', 'Closing note',
       'Quincunx definition',
       'Quincunx, a new aspect, consisting of 150 degrees',
       'Short public-domain quotation selected during cross-source revision.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Quincunx definition'
  );

-- Link the narrow quote passages to their relevant interpretations.
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'definition-quote'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text='Definition of annual profection'
WHERE t.slug='profection' AND w.slug='lilly-christian-astrology' AND i.scope='Book III, Chapter CLXVI';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'definition-quote'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text='Definition of solar revolution'
WHERE t.slug='solar-revolution' AND w.slug='lilly-christian-astrology' AND i.scope='Book III, Chapter CLXXII';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'definition-quote'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text='Quincunx definition'
WHERE t.slug='quincunx' AND w.slug='lilly-christian-astrology' AND i.scope='Book III, closing note';
