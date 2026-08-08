-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 9, Nativities: Preface, Part 1, and Part 2 (PDF pp. 1018-1047).
-- Only evidence-grade A/B material is retained. Detailed longevity recipes and
-- catalogue-like physical/moral descriptions remain in the source corpus unless
-- they define a reusable technical concept.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('nativity', 'Nativity', 'The astrological figure of birth, treated as the complete beginning from which the native’s postnatal life and its accidents are judged.', 'natal astrology', 'draft', 'Bonatti sharply distinguishes the nativity from the earlier conceptional beginning and treats birth as the more complete and certain beginning.'),
  ('conceptional-beginning', 'Conceptional Beginning', 'The earlier and incomplete beginning marked by conception, used for judging the development of the conceived child up to birth rather than the native’s whole later life.', 'natal astrology', 'draft', 'Bonatti calls this the first beginning and limits its scope to gestation; preserve the source distinction from the nativity.'),
  ('animodar', 'Animodar', 'A rectification indicator derived from the prenatal conjunction or opposition and its strongest relevant ruler, used to correct an uncertain natal Ascendant.', 'rectification', 'draft', 'Bonatti gives a detailed version of the medieval an-namudar procedure. Keep the historical term distinct from generic rectification.'),
  ('natal-rectification', 'Natal Rectification', 'The correction of an uncertain birth time or Ascendant by comparing an approximate natal figure with a source-defined astrological indicator.', 'rectification', 'draft', 'Bonatti’s principal procedure here is the animodar method based on the prenatal syzygy and the angular distance of its ruling planet.'),
  ('almudabit', 'Almudabit', 'The planet strongest by accumulated dignity among the principal life and nourishment significators in an early-life judgment.', 'rulership and predominance', 'draft', 'Bonatti uses the Latinized almudebit/almudabit as a specialized governor selected from several nourishment significators; do not automatically merge with every use of mubtazz.'),
  ('jarbakhtar', 'Jarbakhtar', 'The divisor used in directing the Ascendant through the planetary bounds, with each successive bound lord disposing a period of the native’s life.', 'primary directions', 'draft', 'Bonatti identifies the directed Ascendant/divisor with the Arabic-Persian jarbakhtar tradition. Keep distinct from the general term divisor until cross-source normalization is complete.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'An-namudar', 'Arabic/Persian', 'historical-form', 'Historical form behind Bonatti’s Latinized Animodar.' FROM terms WHERE slug='animodar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Almudebit', 'Latin', 'spelling-variant', 'Bonatti’s printed Latin form in this passage.' FROM terms WHERE slug='almudabit';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Algebutar', 'Latin', 'historical-form', 'Latinized form used by Bonatti for jarbakhtar.' FROM terms WHERE slug='jarbakhtar';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1018', '1022', 'Treatise 9: Nativities', 'Preface and Part 1, Chapters 1-3',
       'Two beginnings: conception as an incomplete prenatal beginning and nativity as the complete postnatal beginning', NULL,
       'Bonatti explicitly distinguishes the scope and ontological status of conception and birth. Translator philosophical reconstruction is not attributed to Bonatti.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1023', '1025', 'Treatise 9: Nativities', 'Part 1, Chapter 4',
       'Unknown ascending degree and the Animodar rectification procedure', NULL,
       'Bonatti defines the natal Ascendant in his own birth-moment convention and gives a prenatal-syzygy method for correcting an uncertain degree.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1025', '1028', 'Treatise 9: Nativities', 'Part 1, Chapters 5-6',
       'Division of natal topics, gestational timing, and four species of nativities', NULL,
       'Reviewed sequentially. The detailed gestational timing and early-life categories are preserved in the source corpus but not promoted into multiple public terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '1028', '1047', 'Treatise 9: Nativities', 'Part 2, Chapters 1-6',
       'Four species, hyleg and kadkhuda, year-giving doctrine, primary directions, and the jarbakhtar/divisor through the bounds', NULL,
       'Dense longevity and primary-direction material. Only reusable technical definitions are promoted; numerical prediction recipes remain source evidence rather than standalone lexicon entries.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti treats the nativity as the second and complete beginning: unlike conception, it comprehends the native’s postnatal accidents as a whole. He regards the birth figure as more certain, effective, and complete than earlier prenatal beginnings.',
       'Treatise 9, Part 1, Chapters 1-3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='nativity' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The first beginning is conception, which Bonatti treats as an incomplete beginning whose astrological scope extends through gestation to birth. At birth its disposition expires and the nativity becomes the governing beginning for the native’s later life.',
       'Treatise 9, Part 1, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='conceptional-beginning' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For an uncertain natal Ascendant, Bonatti uses the prenatal conjunction or opposition, selects the most competent ruler of that degree by dignity and testimony, then compares that planet’s degree with the nearest angle and reconstructs the natal angles from it. This is his detailed form of the Animodar procedure.',
       'Treatise 9, Part 1, Chapter 4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='animodar' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti presents rectification as a correction of an initially uncertain birth time and Ascendant. His preferred method starts from the nearest prenatal syzygy, determines its ruling planet, and uses that planet’s degree and angular relation to revise the natal figure.',
       'Treatise 9, Part 1, Chapter 4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natal-rectification' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In the judgment of the second species of nativities, Bonatti calls the planet strongest by the multitude of dignities among the principal nourishment and life significators the almudabit. It functions as the dominant governor for that particular early-life judgment.',
       'Treatise 9, Part 2, Chapter 1', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='almudabit' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines the hyleg as the root or formal significator of life. He selects it from a hierarchy of candidates—including the luminaries, Ascendant, Part of Fortune, and prenatal syzygy—subject to placement and aspect from dignity rulers.',
       'Treatise 9, Part 2, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hyleg' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The kadkhuda is the planet that supplies the years once the hyleg has been established. Bonatti selects it from rulers having dignity in and aspect to the hyleg, preferring greater dignity and stronger accidental condition; he explicitly says the hyleg gives life formally and the kadkhuda effectively.',
       'Treatise 9, Part 2, Chapters 1-2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='kadkhuda' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the Ascendant directed successively through the planetary bounds the jarbakhtar or divisor. Each bound lord disposes the corresponding period according to its condition, and the sequence continues bound by bound for as long as the native’s life lasts.',
       'Treatise 9, Part 2, Chapter 6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='jarbakhtar' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='bonatti-liber-astronomiae'
  AND sp.book='Treatise 9: Nativities'
  AND (
    (t.slug IN ('nativity','conceptional-beginning') AND sp.chapter='Preface and Part 1, Chapters 1-3') OR
    (t.slug IN ('animodar','natal-rectification') AND sp.chapter='Part 1, Chapter 4') OR
    (t.slug IN ('almudabit','hyleg','kadkhuda','jarbakhtar') AND sp.chapter='Part 2, Chapters 1-6')
  )
  AND NOT EXISTS (
    SELECT 1 FROM citations c WHERE c.interpretation_id=i.id AND c.source_passage_id=sp.id
  );