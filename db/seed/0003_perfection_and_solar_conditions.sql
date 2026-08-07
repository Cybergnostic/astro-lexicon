-- Second extraction pass: perfection mechanics and solar/sect conditions.
-- Every interpretation below is based on a directly located passage in the initial corpus.
-- Quotations are intentionally omitted from seed data; the public site should use summaries + locators.

INSERT INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('separation', 'Separation', 'The withdrawal of planets from a conjunction or aspect after contact.', 'planetary motion and aspect doctrine', 'draft', 'Keep distinct from application; exact mechanics are author-specific.'),
  ('prohibition', 'Prohibition', 'Interference by a third planet that prevents or delays an applying configuration from perfecting.', 'perfection and impediment', 'draft', 'Do not automatically merge with prevention/intervention in earlier sources.'),
  ('refranation', 'Refranation', 'Failure of an application because the applying planet turns retrograde before perfection.', 'perfection and impediment', 'draft', 'Lilly spells this Refrenation; al-Bīrūnī describes the same translated technical condition as Refranation.'),
  ('translation-of-light', 'Translation of Light', 'A faster planet separates from one planet and applies to another, carrying the former planet''s influence into the later contact.', 'perfection and mediation', 'draft', 'Reception requirements and practical use should remain author-specific.'),
  ('collection-of-light', 'Collection of Light', 'Two planets separately apply to a third, heavier planet which gathers their influences and can mediate perfection.', 'perfection and mediation', 'draft', 'Lilly explicitly combines collection with reception conditions in the perfection chapter.'),
  ('frustration', 'Frustration', 'An intended conjunction fails because the planet being applied to perfects another conjunction first.', 'perfection and impediment', 'draft', 'Do not use as a generic synonym for every blocked perfection; authors use it more narrowly.'),
  ('void-of-course', 'Void of Course', 'A planet, especially the Moon, has separated from a planet and makes no further application before leaving its sign.', 'planetary motion and aspect doctrine', 'draft', 'Sign-boundary handling differs across authors and later practice.'),
  ('hayz', 'Hayz', 'A condition combining planetary sect, hemisphere and sign gender in a sect-conforming arrangement.', 'sect and accidental condition', 'draft', 'Preserve author-specific requirements rather than replacing with a modern simplified definition.'),
  ('peregrine', 'Peregrine', 'A planet occupying a zodiacal position in which it has no essential dignity.', 'essential dignity and debility', 'draft', 'The definition depends on which dignity scheme the author recognizes.'),
  ('cazimi', 'Cazimi / In the Heart of the Sun', 'An extremely close conjunction with the Sun, distinguished from combustion.', 'solar proximity and accidental condition', 'draft', 'Numerical threshold varies slightly by source and translation.'),
  ('under-the-rays', 'Under the Sun''s Rays', 'Solar proximity wider than combustion in which a planet remains obscured or weakened by the Sun.', 'solar proximity and accidental condition', 'draft', 'Thresholds vary by planet and author.'),
  ('orientality', 'Orientality', 'A planetary phase defined by relation to the Sun, visibility and direction of motion.', 'solar phase and accidental condition', 'draft', 'Superior and inferior planets require separate treatment.'),
  ('occidentality', 'Occidentality', 'A planetary phase defined by relation to the Sun, visibility and direction of motion, contrasted with orientality.', 'solar phase and accidental condition', 'draft', 'Superior and inferior planets require separate treatment.');

INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Refrenation', 'English', 'historical-spelling', 'William Lilly''s spelling in Christian Astrology.' FROM terms WHERE slug='refranation';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Translation of light and nature', 'English', 'historical-form', 'Lilly''s fuller heading.' FROM terms WHERE slug='translation-of-light';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Collection', 'English', 'short-form', 'Lilly''s heading.' FROM terms WHERE slug='collection-of-light';
INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'In the heart of the Sun', 'English', 'synonym', 'Lilly''s English gloss for cazimi.' FROM terms WHERE slug='cazimi';

-- LILLY: SEPARATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '128', '129', 'Book I', 'Ch. XIX', 'Application and separation definitions, original pp. 107-108', NULL,
       'Application is described as drawing near; subsequent judgment repeatedly contrasts application with separation.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly treats separation as the counterpart of application: after contact by conjunction or aspect, the planets move apart. In horary judgment he repeatedly contrasts application, which keeps a matter active, with separation, which tends toward privation or disengagement.',
       'Book I, application/separation doctrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='separation' AND w.slug='lilly-christian-astrology';

-- LILLY: PROHIBITION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '131', '132', 'Book I', 'Ch. XIX', 'Prohibition definition and bodily/aspect forms, original pp. 110-111', NULL,
       'Defines prohibition as third-planet interference before an applying pair perfects; distinguishes bodily and aspectual prohibition.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines prohibition as a third planet interposing its body or aspect before two applying planets can reach their intended perfection. He distinguishes bodily or conjunctional prohibition from prohibition by aspect.',
       'Book I, prohibition', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='lilly-christian-astrology';

-- LILLY: REFRANATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '132', '132', 'Book I', 'Ch. XIX', 'Refrenation definition, original p. 111', NULL,
       'Applying planet turns retrograde before conjunction and therefore does not perfect it.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calls refranation a form of prohibition in which an applying planet turns retrograde before reaching the intended conjunction, so the promised perfection does not occur.',
       'Book I, refrenation', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='lilly-christian-astrology';

-- LILLY: TRANSLATION OF LIGHT
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '132', '133', 'Book I', 'Ch. XIX', 'Translation of light and nature definition, original pp. 111-112', NULL,
       'A lighter planet separates from a heavier planet and immediately joins another heavier planet, carrying virtue between them; can occur by aspect or conjunction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines translation of light and nature when a lighter, faster planet separates from a heavier planet and immediately joins another heavier planet, thereby carrying the former planet''s virtue to the latter. He allows the mechanism through aspect as well as bodily conjunction.',
       'Book I, translation of light and nature', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='translation-of-light' AND w.slug='lilly-christian-astrology';

-- LILLY: COLLECTION OF LIGHT
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '147', '148', 'Book II', 'Ch. XXI', 'Collection as a mode of perfection, original pp. 126-127', NULL,
       'Two principal significators both aspect a heavier planet; reception is explicitly part of Lilly''s stated condition.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly describes collection as a mode of perfection when two principal significators do not behold one another but both cast aspects to a heavier planet, while both receive that heavier planet in some essential dignity. The heavier planet collects both lights and mediates the result.',
       'Book II, modes of perfection', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='collection-of-light' AND w.slug='lilly-christian-astrology';

-- LILLY: FRUSTRATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '133', '134', 'Book I', 'Ch. XIX', 'Frustration definition, original pp. 112-113', NULL,
       'A swift planet seeks bodily conjunction with a heavier planet, but the heavier planet first joins another.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For Lilly, frustration occurs when a faster planet is moving toward bodily conjunction with a heavier planet, but the heavier planet perfects a conjunction with a third planet first, preventing the original conjunction.',
       'Book I, frustration', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='frustration' AND w.slug='lilly-christian-astrology';

-- LILLY: VOID OF COURSE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '133', '133', 'Book I', 'Ch. XIX', 'Void of course definition, original p. 112', NULL,
       'A planet has separated and does not apply to another during the remainder of its current sign; Lilly notes this especially for the Moon.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly calls a planet void of course when it has separated from a planet and does not make another application during its remaining passage through the sign. He says this is most commonly observed in the Moon.',
       'Book I, void of course', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology';

-- LILLY: HAYZ
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '134', '134', 'Book I', 'Ch. XIX', 'Hayz definition, original p. 113', NULL,
       'Lilly gives separate masculine/diurnal and feminine/nocturnal configurations involving time, hemisphere and sign gender.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines hayz by a sect-conforming combination: a masculine diurnal planet by day above the earth in a masculine sign, or a feminine nocturnal planet by night under the earth in a feminine sign.',
       'Book I, hayz', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hayz' AND w.slug='lilly-christian-astrology';

-- LILLY: PEREGRINE
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '133', '133', 'Book I', 'Ch. XIX', 'Peregrine definition, original p. 112', NULL,
       'No essential dignity in the occupied degree; Lilly explicitly tests house, exaltation, triplicity, term and face.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines a planet as peregrine when it has no essential dignity in the degree it occupies. His examples make clear that house, exaltation, triplicity, term and face all count against peregrination.',
       'Book I, peregrine', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='peregrine' AND w.slug='lilly-christian-astrology';

-- LILLY: CAZIMI AND UNDER THE RAYS
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '134', '134', 'Book I', 'Ch. XIX', 'Combustion / under the Sun beams / cazimi definitions, original p. 113', NULL,
       'Lilly distinguishes combustion, under the beams and cazimi by separate numerical limits.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly places cazimi, or the heart of the Sun, within 17 minutes of the Sun, making it a distinct innermost solar condition rather than an especially severe form of combustion.',
       'Book I, solar proximity conditions', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly says a planet remains under the Sun''s beams until it is fully elongated 17 degrees from the Sun. This broader condition is explicitly distinguished from combustion at the narrower 8°30′ limit.',
       'Book I, solar proximity conditions', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='lilly-christian-astrology';

-- AL-BIRUNI: REFRANATION AND PROHIBITION/PREVENTION
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '329', '331', '506-507', 'Interference with conjunctions immediately before §507 reception', NULL,
       'Lists forms of interference including refranation and prevention; terminology in the English translation must not be silently equated with Lilly.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī describes refranation when an inferior planet tends toward conjunction with a superior planet but turns retrograde before completion, thereby frustrating the familiarity.',
       'Interference with planetary conjunctions, immediately before §507', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī describes a translated condition called prevention in which a third planet lies between an inferior and superior planet and enters conjunction first. This resembles later prohibition doctrine, but the entry remains separate at the terminology level until the traditions are compared more fully.',
       'Interference with planetary conjunctions, immediately before §507', 'close_paraphrase', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: PEREGRINE
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '324', '325', '493-494', '§493 testimony/dignity and §494 order of precedence', NULL,
       'Defines absence of favourable/dignified position as peregrine and distinguishes detriment/fall as additional adverse conditions.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī says that when a planet is not in a favourable position carrying dignity it is peregrine; detriment or fall adds further calamity to that alien condition. The following section orders house, exaltation, term, triplicity and face as dignities.',
       'Dignity and peregrination, §§493-494', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='peregrine' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: CAZIMI, UNDER THE RAYS, ORIENTALITY, OCCIDENTALITY
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '313', '315', '481', '§481 solar phases: samim/cazimi, combustion, under the rays, orientality and occidentality', NULL,
       'Defines several successive solar phases; thresholds differ by planet for emergence from the rays.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'In §481 al-Bīrūnī gives an innermost solar condition at less than roughly sixteen minutes from the Sun, rendered in the edition as samīm and corresponding to the condition later called cazimi. It is explicitly distinguished from the following combust phase.',
       'Solar phases, §481', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī distinguishes being under the rays from combustion. After the combust limit is passed, a planet remains under the rays until reaching a visibility distance that varies by planet.',
       'Solar phases, §481', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī treats orientality as a solar phase tied to emergence and increasing separation from the Sun, but he distinguishes the behavior of superior and inferior planets rather than giving one universal positional rule.',
       'Solar phases and visibility, §481 and surrounding discussion', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='orientality' AND w.slug='al-biruni-tafhim';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī treats occidentality as the complementary solar phase associated with a planet''s changing distance, visibility and motion relative to the Sun. He explicitly notes that occidentality is more weakening for the inferior planets in some phases than for the superior planets.',
       'Solar phases and visibility, §481 and surrounding discussion', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='occidentality' AND w.slug='al-biruni-tafhim';

-- CITATIONS: attach interpretations to the source passages above by unique locator patterns.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology' AND (
  (t.slug='separation' AND sp.locator_text LIKE 'Application and separation definitions%') OR
  (t.slug='prohibition' AND sp.locator_text LIKE 'Prohibition definition%') OR
  (t.slug='refranation' AND sp.locator_text LIKE 'Refrenation definition%') OR
  (t.slug='translation-of-light' AND sp.locator_text LIKE 'Translation of light and nature%') OR
  (t.slug='collection-of-light' AND sp.locator_text LIKE 'Collection as a mode%') OR
  (t.slug='frustration' AND sp.locator_text LIKE 'Frustration definition%') OR
  (t.slug='void-of-course' AND sp.locator_text LIKE 'Void of course definition%') OR
  (t.slug='hayz' AND sp.locator_text LIKE 'Hayz definition%') OR
  (t.slug='peregrine' AND sp.locator_text LIKE 'Peregrine definition%') OR
  (t.slug IN ('cazimi','under-the-rays') AND sp.locator_text LIKE 'Combustion / under%')
);

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='al-biruni-tafhim' AND (
  (t.slug IN ('refranation','prohibition') AND sp.section='506-507') OR
  (t.slug='peregrine' AND sp.section='493-494') OR
  (t.slug IN ('cazimi','under-the-rays','orientality','occidentality') AND sp.section='481')
);

-- RELATIONS discovered in this pass.
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'opposes-process', 'Separation is the motion counterpart to application.', 'draft' FROM terms a, terms b WHERE a.slug='separation' AND b.slug='application';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'impedes', 'Prohibition is one way an intended application/perfection can be blocked.', 'draft' FROM terms a, terms b WHERE a.slug='prohibition' AND b.slug='application';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'impedes', 'Refranation blocks an application when the applying planet turns retrograde.', 'draft' FROM terms a, terms b WHERE a.slug='refranation' AND b.slug='application';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'mode-of-perfection', 'Translation of light can perfect a matter by mediation between significators.', 'draft' FROM terms a, terms b WHERE a.slug='translation-of-light' AND b.slug='application';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'mode-of-perfection', 'Collection of light can perfect a matter through a third, heavier planet.', 'draft' FROM terms a, terms b WHERE a.slug='collection-of-light' AND b.slug='application';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'nested-solar-condition', 'Cazimi is the innermost solar condition and must remain distinct from combustion.', 'draft' FROM terms a, terms b WHERE a.slug='cazimi' AND b.slug='combustion';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'broader-solar-condition', 'Under the rays is broader than combustion in Lilly and al-Bīrūnī.', 'draft' FROM terms a, terms b WHERE a.slug='under-the-rays' AND b.slug='combustion';
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contrasting-phase', 'Orientality and occidentality are complementary but planet-type-dependent solar phases.', 'draft' FROM terms a, terms b WHERE a.slug='orientality' AND b.slug='occidentality';
