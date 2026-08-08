-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 6, On Horary, Part I (substantive text PDF pp. 643-736).
-- Only definition-level or substantively explanatory evidence is retained.
-- House-by-house judgment recipes, repetitive examples, and translator/editor commentary are not promoted into standalone lexicon entries.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('absolute-question', 'Absolute Question', 'A horary question asked about a subject in general rather than about one specified instance, source, person, or circumstance.', 'horary astrology', 'draft', 'Bonatti repeatedly contrasts absolute questions with determinate ones. His examples include asking simply whether one will acquire substance, have children, or be freed from servitude, without specifying a particular source or case.'),
  ('determinate-question', 'Determinate Question', 'A horary question restricted to a particular instance, object, person, source, or circumstance within the broader subject being asked about.', 'horary astrology', 'draft', 'Bonatti contrasts this with an absolute question; for example, asking whether one will be freed from the service of a particular master rather than whether one will ever be freed from servitude.'),
  ('abscissor', 'Abscissor', 'A planet that cuts off or destroys the promised outcome of a matter, preventing perfection or overturning it after it appeared likely to succeed.', 'horary astrology', 'draft', 'Bonatti also extends the term to natal longevity doctrine. Keep this as a source-defined destructive/prohibitive role rather than merging it automatically with every form of prohibition or frustration.'),
  ('universal-question', 'Universal Question', 'A broad horary inquiry whose judgment concerns an extended or general condition rather than only a single narrowly bounded event.', 'horary astrology', 'draft', 'Bonatti speaks of universal questions concerning fortune and distinguishes questions whose scope is perpetual from those limited to a year, month, week, day, or other period. Preserve this as Bonatti-specific usage pending cross-source comparison.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Question Absolute', 'English', 'source-variant', 'A broad, non-specific question in Bonatti\'s horary usage.' FROM terms WHERE slug='absolute-question';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Determined Question', 'English', 'variant', 'Variant English wording for Bonatti\'s determinate question.' FROM terms WHERE slug='determinate-question';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Planet Which Cuts Off', 'English', 'source-phrase', 'Bonatti\'s explanatory wording for the abscissor.' FROM terms WHERE slug='abscissor';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '643', '675', 'Treatise 6: On Horary, Part I', 'Introductory Chapters and First House',
       'Radicality; three principal modes of perfection; graded perfection by aspect and reception; absolute judgment; abscissor or planet which cuts off', NULL,
       'The editor\'s explanatory notes are not attributed to Bonatti. Definitions and mechanisms are taken only from Bonatti\'s translated text.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '676', '702', 'Treatise 6: On Horary, Part I', 'Second through Fourth Houses',
       'Absolute versus specified questions; perfection and prohibition through significators, reception and transfer; derived-house procedure', NULL,
       'Most topical delineations are applications of doctrines already defined elsewhere and are not promoted to separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '703', '736', 'Treatise 6: On Horary, Part I', 'Fifth and Sixth Houses',
       'Absolute questions; medical-house schemes; recent versus old illness; critical days; void-course continuation; determinate versus absolute servant questions', NULL,
       'Medical and servitude chapters were reviewed as historical astrological doctrine. Only reusable technical vocabulary is extracted.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti uses an absolute question for a broad inquiry whose object is not narrowed to a particular source or instance. His examples include asking simply whether one will acquire substance, whether a person will have children, or whether a servant will be freed, without naming a specific source, partner, master, or transaction.',
       'Treatise 6, Part I, Second, Fifth and Sixth House sections', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='absolute-question' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti contrasts the determinate question with the absolute question by restricting the inquiry to a specified case. He illustrates this by distinguishing a general question about release from servitude from the determinate question of whether the querent will be released from the service of the particular master currently holding him.',
       'Treatise 6, Part I, Sixth House, Chapter V', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='determinate-question' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the destructive or prohibiting planet the abscissor, the planet which cuts off. In horary it is identified through the chain of application from the querent\'s significator, the Moon, or the significator of the matter to a badly disposed malefic or another afflicted receiver. Without effective reception, such a planet prevents perfection or destroys the matter after it appeared arranged; an intervening cutting-off of the harmful light can remove the prohibition.',
       'Treatise 6, Part I, First House, Chapter V', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='abscissor' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti refers to universal questions when discussing judgments whose concern can extend over a person\'s general fortune rather than only a single immediate event. He notes that the intended scope may be perpetual or may be delimited to a year, month, week, day, or another period, so the temporal scope of the inquiry forms part of the judgment.',
       'Treatise 6, Part I, First House, introductory doctrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='universal-question' AND w.slug='bonatti-liber-astronomiae';

-- Existing canonical term: Bonatti gives a substantive operational definition of medical critical days.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In illness judgment Bonatti treats the seventh, fourteenth, twenty-first and twenty-eighth days as principal critical checkpoints measured from the Moon\'s place at the question or onset. He derives them by projecting approximately 90, 180, 270 and 360 degrees respectively, then judges improvement or worsening from the Moon\'s condition and planetary contacts at those points.',
       'Treatise 6, Part I, Sixth House, Chapter III', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='critical-days' AND w.slug='bonatti-liber-astronomiae';

-- Link the newly added interpretations to the reviewed source ranges.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('absolute-question','universal-question')
  AND sp.book='Treatise 6: On Horary, Part I'
  AND sp.page_start='643';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug='abscissor'
  AND sp.book='Treatise 6: On Horary, Part I'
  AND sp.page_start='643';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='bonatti-liber-astronomiae'
  AND t.slug IN ('determinate-question','critical-days')
  AND sp.book='Treatise 6: On Horary, Part I'
  AND sp.page_start='703';
