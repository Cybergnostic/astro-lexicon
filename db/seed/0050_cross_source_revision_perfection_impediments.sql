-- Cross-source editorial revision, pass 4: perfection, mediation and impediment.
-- Run after 0049_cross_source_revision_signs_houses_aspects.sql.
--
-- This pass is intentionally conservative about apparent synonyms. Matching English
-- translation labels are NOT enough for a merge: the planetary mechanism must also match.
-- Conversely, where the mechanism and historical function are clearly the same across
-- translations, provisional duplicate terms are normalized and their old labels retained
-- as aliases.

-- -----------------------------------------------------------------------------
-- CLEAR NORMALIZATIONS
-- -----------------------------------------------------------------------------

-- Bonatti explicitly says Alchabitius calls bodily/aspectual application "Alitifal" or
-- "continuation". This is a historical name for Application, not a separate mechanism.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='application')
WHERE term_id=(SELECT id FROM terms WHERE slug='alitifal');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Alitifal', 'Latinized Arabic', 'historical-form',
       'Bonatti/Alchabitius term for bodily or aspectual application/continuation.'
FROM terms WHERE slug='application';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Continuation', 'English', 'source-translation',
       'Bonatti glosses Alitifal as continuation.'
FROM terms WHERE slug='application';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='alitifal')
   OR object_term_id=(SELECT id FROM terms WHERE slug='alitifal');
DELETE FROM terms WHERE slug='alitifal';

-- Abū Maʿshar's Returning, al-Bīrūnī's radd/Return, and Bonatti's Return of Virtue
-- share the same defining mechanism: the receiving planet is too debilitated (especially
-- retrograde or solar-obscured/combust) to retain what was given and returns it to the donor.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='return-of-virtue')
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN ('return-radd','returning-management')
);

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Return', 'English', 'source-translation',
       'Short translated form used for the same rejected/returned virtue mechanism in Arabic-source material.'
FROM terms WHERE slug='return-of-virtue';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Radd', 'Arabic transliteration', 'historical-form',
       'al-Bīrūnī terminology for the return of what the weakened receiver cannot retain.'
FROM terms WHERE slug='return-of-virtue';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Returning', 'English', 'source-translation',
       'Yamamoto/Burnett rendering in Abū Maʿshar Part VII.'
FROM terms WHERE slug='return-of-virtue';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Return of Disposition', 'English', 'historical-form',
       'Bonatti also speaks of the return of virtue or disposition.'
FROM terms WHERE slug='return-of-virtue';

DELETE FROM term_relations
WHERE subject_term_id IN (SELECT id FROM terms WHERE slug IN ('return-radd','returning-management'))
   OR object_term_id IN (SELECT id FROM terms WHERE slug IN ('return-radd','returning-management'));
DELETE FROM terms WHERE slug IN ('return-radd','returning-management');

-- Abū Maʿshar's "Cutting the Light" and al-Bīrūnī's "Abscission/Cutting off of Light"
-- are the same historical family. The first two forms described by Abū Maʿshar correspond
-- closely to al-Bīrūnī's two explicit methods; Abū Maʿshar preserves a broader third form.
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='abscission-of-light')
WHERE term_id=(SELECT id FROM terms WHERE slug='cutting-light');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Cutting the Light', 'English', 'source-translation',
       'Abū Maʿshar translation label for the abscission/cutting-off family.'
FROM terms WHERE slug='abscission-of-light';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Cutting off the Light', 'English', 'translation-variant',
       'Descriptive translation also used for this family in al-Bīrūnī.'
FROM terms WHERE slug='abscission-of-light';

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='cutting-light')
   OR object_term_id=(SELECT id FROM terms WHERE slug='cutting-light');
DELETE FROM terms WHERE slug='cutting-light';

-- al-Bīrūnī's translated "Prevention" is now sufficiently comparable with the bodily and
-- aspectual Prohibition doctrine in Abū Maʿshar/Bonatti/Lilly to normalize the label as an alias.
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Prevention', 'English', 'source-translation',
       'Ramsay Wright translation label for al-Bīrūnī §506; mechanically within the prohibition family.'
FROM terms WHERE slug='prohibition';

UPDATE interpretations
SET certainty='direct', evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='al-biruni-tafhim')
  AND term_id=(SELECT id FROM terms WHERE slug='prohibition')
  AND summary LIKE 'Al-Bīrūnī describes a translated condition called prevention%';

-- -----------------------------------------------------------------------------
-- SPLIT FALSE FRIENDS: SAME ENGLISH LABEL, DIFFERENT MECHANISM
-- -----------------------------------------------------------------------------

-- "Intervention" in Antiochus is defined by a third star casting rays into the intermediate
-- degrees of an application. al-Bīrūnī's Intervention is a different retrograde three-body
-- sequence. They should not share one canonical entry merely because English translators
-- chose the same word.
INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('intervention-by-rays', 'Intervention by Rays (Antiochus)',
   'Antiochus’ source-specific impediment in which a third star casts its rays into the intermediate degrees through which another planetary application is proceeding.',
   'perfection and impediment', 'reviewed',
   'Schmidt translates the source term as Intervention. Kept separate from al-Bīrūnī’s mechanically different Intervention.',
   'technical', 5);

UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='intervention-by-rays'),
    evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='antiochus-thesaurus')
  AND term_id=(SELECT id FROM terms WHERE slug='intervention');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Intervention', 'English', 'source-translation',
       'Schmidt’s English rendering in Antiochus; disambiguated editorially from the Arabic-source mechanism.'
FROM terms WHERE slug='intervention-by-rays';

-- Bonatti and Lilly both use the English translation "Frustration", but their recognition
-- rules are materially different. Lilly's target joins a third planet first; Bonatti's target
-- changes sign and encounters another planet's rays before the original applicant catches it.
INSERT OR IGNORE INTO terms
  (slug, label, short_definition, category, status, editorial_notes, entry_type, definition_quality)
VALUES
  ('frustration-bonatti', 'Frustration (Bonatti)',
   'Bonatti’s source-specific impediment in which the planet being pursued leaves its sign before bodily perfection and, in the next sign, encounters another planet’s rays first, so the original applicant cannot complete the intended conjunction.',
   'perfection and impediment', 'reviewed',
   'Do not merge with Lilly’s Frustration: the same English label covers a materially different sequence.',
   'technical', 5);

UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='frustration-bonatti'),
    evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND term_id=(SELECT id FROM terms WHERE slug='frustration');

-- -----------------------------------------------------------------------------
-- CANONICAL DEFINITIONS: APPLICATION SUBTYPES AND MEDIATION
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A planetary motion relation in which one planet approaches exact conjunction or aspect with another; ordinarily the faster or lighter planet applies to the slower or heavier one, though retrogradation can alter the pattern.',
  definition_quality=5,
  status='reviewed'
WHERE slug='application';

UPDATE terms SET
  short_definition='Antiochus’ strict contact condition in which a faster planet approaches a slower planet within three degrees; a source-specific subtype of application rather than a universal application threshold.',
  definition_quality=5,
  status='reviewed'
WHERE slug='contact-kollesis';

UPDATE terms SET
  short_definition='A non-aspecting form of application in Abū Maʿshar based on corresponding degrees in signs related by equal ascensional behavior or equal daylight power.',
  definition_quality=5,
  status='reviewed'
WHERE slug='natural-application';

UPDATE terms SET
  short_definition='Bonatti’s application or conjunction by planetary latitude rather than ordinary zodiacal longitude, including equal latitude on the same side of the ecliptic and an opposed north-south form.',
  definition_quality=5,
  status='reviewed'
WHERE slug='joining-by-latitude';

UPDATE terms SET
  short_definition='Abū Maʿshar’s mediation in which planets that do not directly connect have their light redirected through another planet, either onward to another zodiacal place or from one principal significator to the other.',
  definition_quality=5,
  status='reviewed'
WHERE slug='reflecting-light';

UPDATE terms SET
  short_definition='An Abū Maʿshar application subtype in which a planet applies to the ruler of one of the dignities it occupies and gives that ruler’s nature to it.',
  definition_quality=5,
  status='reviewed'
WHERE slug='giving-nature';

UPDATE terms SET
  short_definition='An Abū Maʿshar application subtype in which a planet occupying one of its own dignities applies to another planet and gives its own power to the receiver.',
  definition_quality=5,
  status='reviewed'
WHERE slug='giving-power';

UPDATE terms SET
  short_definition='An Abū Maʿshar application subtype in which the two planets share an additional bond: either both possess dignity in the same sign or both conform to the same diurnal/nocturnal domain.',
  definition_quality=5,
  status='reviewed'
WHERE slug='giving-two-natures';

UPDATE terms SET
  short_definition='An Abū Maʿshar application subtype in which one planet hands its management or disposition to another; agreement is strengthened by harmonious aspect, reception or conjunctional mixture.',
  definition_quality=5,
  status='reviewed'
WHERE slug='giving-management';

-- -----------------------------------------------------------------------------
-- RETURN, ABSCISSION AND RELATED INTERRUPTIONS
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Return of Virtue / Return (Radd)',
  short_definition='A condition in which a planet receiving another planet’s virtue, disposition or offered influence cannot retain it because of debility such as retrogradation or solar obscuration and therefore returns it to the donor. The condition of donor and receiver determines whether the return can still be useful.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Normalizes Abū Maʿshar’s Returning, al-Bīrūnī’s radd/Return and Bonatti’s Return of Virtue/Disposition. Keep separate from Bonatti’s Return of Light.'
WHERE slug='return-of-virtue';

UPDATE terms SET
  label='Abscission / Cutting of Light',
  short_definition='A family of impediments in which a third planetary action cuts off or redirects an intended application before its expected perfection. Historical sources give more than one geometry, including a third planet retrograding into the sequence or the intended receiver joining another heavier planet first.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Abū Maʿshar’s Cutting the Light and al-Bīrūnī’s Abscission/Cutting off the Light are normalized here. Bonatti uses Abscission in several closely related interruption patterns and sometimes calls one of them Return of Light as well.'
WHERE slug='abscission-of-light';

UPDATE terms SET
  short_definition='A failed application in which the intended receiving planet leaves its sign before perfection, after which the applying planet is diverted to another planet and the original contact never completes.',
  definition_quality=5,
  status='reviewed'
WHERE slug='evasion';

UPDATE terms SET
  short_definition='Abū Maʿshar’s three-planet impediment in which retrogradation causes an intermediate planet to intercept the intended receiver and then become the object of the lighter third planet’s application, redirecting the expected sequence.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Mechanically extremely close to Bonatti’s Contrariety, but retained separately because the source terminology differs and the current corpus does not prove lexical identity.'
WHERE slug='resistance';

UPDATE terms SET
  short_definition='Bonatti’s three-planet impediment in which a planet unexpectedly retrogrades, reaches the intended receiver before another applying planet, and then encounters that applicant, thereby destroying the expected application sequence.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='The mechanism corresponds very closely to Abū Maʿshar’s Resistance. Retained as a source-visible term rather than silently merged.'
WHERE slug='planetary-contrariety';

UPDATE terms SET
  short_definition='al-Bīrūnī’s three-planet impediment in which an intermediate planet retrogrades toward the intended superior receiver and is then met by the original inferior applicant, diverting the original conjunction.',
  definition_quality=5,
  status='reviewed',
  editorial_notes='Kept distinct from Antiochus’ Intervention by Rays, which uses a different recognition rule.'
WHERE slug='intervention';

UPDATE terms SET
  short_definition='Abū Maʿshar’s reciprocal rescue condition in which a planet in a well or fall is drawn out by a friendly or dignified planet and later repays that assistance when the former helper enters an analogous debility.',
  definition_quality=5,
  status='reviewed'
WHERE slug='favour-recompense';

-- -----------------------------------------------------------------------------
-- BONATTI'S POLYSEMOUS "RETURN OF LIGHT"
-- -----------------------------------------------------------------------------

-- The extraction captured only the Chapter XII use. Bonatti actually uses Return of Light in
-- two related but non-identical ways in Chapters XI-XII. Replace the narrow interpretation with
-- two explicit source-specific interpretations rather than forcing one false universal formula.
DELETE FROM interpretations
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND term_id=(SELECT id FROM terms WHERE slug='return-of-light');

UPDATE terms SET
  short_definition='A Bonatti term used in at least two related ways: for a collecting planet that projects gathered light onward to another zodiacal place, and for an interrupted application in which the intended receiver gives back an earlier applicant’s light after a nearer third planet reaches it first. Bonatti also calls the latter configuration an abscission of light.',
  definition_quality=4,
  status='reviewed',
  editorial_notes='Do not collapse Return of Light into Return of Virtue. Bonatti’s own usage is internally broader than a single mechanism.'
WHERE slug='return-of-light';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '323', '324', 'Third Tractatus, Part II', 'Chapter XI',
       'Bonatti: Return of Light as projection of gathered light', NULL,
       'Bonatti calls a third planet a returner of light when it receives the relevant lights and projects them onward to a zodiacal place it aspects. No public quotation selected.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Bonatti: Return of Light as projection of gathered light'
  );

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '324', '325', 'Third Tractatus, Part II', 'Chapter XII',
       'Bonatti: Return of Light and Abscission in an intercepted application', NULL,
       'Bonatti explicitly says the interrupted configuration is called both Return of Light and Abscission of Light. No public quotation selected.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Bonatti: Return of Light and Abscission in an intercepted application'
  );

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'In one use, Bonatti calls a planet a returner of light when multiple planetary lights are gathered into it and it projects those lights onward to a zodiacal place that it aspects.',
       'Third Tractatus, Part II, Chapter XI', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='return-of-light' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'In another use, an intended recipient has begun to receive one applicant’s light but a nearer third planet reaches it first; the recipient gives the earlier light back. Bonatti explicitly calls this same configuration both Return of Light and Abscission of Light.',
       'Third Tractatus, Part II, Chapter XII', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='return-of-light' AND w.slug='bonatti-liber-astronomiae';

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='return-of-light' AND w.slug='bonatti-liber-astronomiae'
  AND ((i.scope='Third Tractatus, Part II, Chapter XI' AND sp.locator_text='Bonatti: Return of Light as projection of gathered light')
    OR (i.scope='Third Tractatus, Part II, Chapter XII' AND sp.locator_text='Bonatti: Return of Light and Abscission in an intercepted application'));

-- Bonatti's Chapter XVIII is strong direct evidence for Abscission itself and should not be
-- represented only through the broad extraction block.
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Bonatti gives two explicit abscission mechanisms: a third planet can retrograde into the sequence and reach the intended receiver first, or the intended receiver can itself join a still heavier third planet before the original applicant reaches it. In both cases the expected light/application is cut off.',
       'Third Tractatus, Part II, Chapter XVIII', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='abscission-of-light' AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Third Tractatus, Part II, Chapter XVIII'
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='abscission-of-light' AND w.slug='bonatti-liber-astronomiae'
  AND i.scope='Third Tractatus, Part II, Chapter XVIII'
  AND sp.locator_text='Transfer of nature, return and abscission of light, prohibition, donation of virtue/reception, return of virtue, refranation, contrariety, frustration and abscission';

-- -----------------------------------------------------------------------------
-- RELATIONS: MAKE THE TAXONOMY EXPLICIT WITHOUT OVER-MERGING
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Antiochus treats contact/kollesis as a strict close-range form of application.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='contact-kollesis' AND b.slug='application';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Abū Maʿshar defines natural application as an application without ordinary aspect based on special sign correspondences.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='natural-application' AND b.slug='application';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Bonatti treats joining by latitude as an application/conjunction measured through latitude rather than ordinary longitude.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='joining-by-latitude' AND b.slug='application';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Abū Maʿshar presents Giving Nature as one of the named forms following application.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='giving-nature' AND b.slug='application';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Abū Maʿshar presents Giving Power as one of the named forms following application.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='giving-power' AND b.slug='application';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Abū Maʿshar presents Giving Two Natures as one of the named forms following application.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='giving-two-natures' AND b.slug='application';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'subtype-of', 'Abū Maʿshar presents Giving Management as one of the named forms following application.', 'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='giving-management' AND b.slug='application';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'mechanically-corresponds-to',
       'The three-planet retrograde sequence is nearly identical in Abū Maʿshar’s Resistance and Bonatti’s Contrariety; terminology is preserved separately pending stronger lexical evidence.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='resistance' AND b.slug='planetary-contrariety';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'overlaps-with',
       'Bonatti explicitly calls one interrupted-application configuration both Return of Light and Abscission of Light, while also using Return of Light elsewhere for projection of gathered light.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='return-of-light' AND b.slug='abscission-of-light';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from',
       'The same English translation label masks different mechanisms: Antiochus uses rays cast into intermediate degrees; al-Bīrūnī uses a retrograde intermediate planet.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='intervention-by-rays' AND b.slug='intervention';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from',
       'Bonatti’s translated Frustration requires sign change and interception by another planet’s rays; Lilly’s Frustration is the target perfecting another conjunction first.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='frustration-bonatti' AND b.slug='frustration';

-- Two superficially similar English names must remain separate: Bonatti's Opening of the
-- Gates is a reception/friendship doctrine; al-Bīrūnī's Opening the Doors is meteorological.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from',
       'Bonatti’s Opening of the Gates describes reception overcoming hostility; al-Bīrūnī’s Opening the Doors is a weather configuration of planets with opposed natures/domiciles.',
       'reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='opening-of-gates' AND b.slug='opening-the-doors';

-- -----------------------------------------------------------------------------
-- EVIDENCE GRADES
-- -----------------------------------------------------------------------------

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'application','contact-kollesis','natural-application','joining-by-latitude',
      'reflecting-light','giving-nature','giving-power','giving-two-natures','giving-management',
      'return-of-virtue','return-of-light','abscission-of-light','evasion','resistance',
      'planetary-contrariety','intervention','intervention-by-rays','favour-recompense',
      'frustration','frustration-bonatti','prohibition'
    )
  );

UPDATE interpretations
SET evidence_grade='B', status='reviewed'
WHERE certainty IN ('close_paraphrase','editorial_inference')
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'application','contact-kollesis','natural-application','joining-by-latitude',
      'reflecting-light','giving-nature','giving-power','giving-two-natures','giving-management',
      'return-of-virtue','return-of-light','abscission-of-light','evasion','resistance',
      'planetary-contrariety','intervention','intervention-by-rays','favour-recompense',
      'frustration','frustration-bonatti','prohibition'
    )
  );

-- No new public quotations are added in this batch. The key evidence comes mainly from
-- modern translations, and paraphrase + precise locator is sufficient for these definitions.
