-- First extraction pass from the five-source test corpus.
-- Public-facing text should use the interpretation summaries, not reproduce source passages.
-- Source locators refer to the editions seeded in 0001_sources.sql.

INSERT INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('application', 'Application', 'The approach of one planet toward conjunction or aspect with another.', 'planetary motion and aspect doctrine', 'draft', 'Definition must remain source-sensitive; authors differ in mechanics and terminology.'),
  ('reception', 'Reception', 'A relation in which a planet is received through another planet''s dignity; mutual reception occurs when the relation is reciprocal.', 'dignity and aspect doctrine', 'draft', 'Do not flatten simple reception and mutual reception into one rule.'),
  ('terms', 'Terms / Bounds', 'Unequal subdivisions of zodiacal signs assigned to planetary rulers.', 'sign subdivisions and dignities', 'draft', 'Track competing systems separately: Egyptian, Ptolemaic and other historical schemes.'),
  ('triplicity-rulers', 'Triplicity Rulers', 'Planetary rulers assigned to the four elemental triplicities, with rulership varying by sect and tradition.', 'sign rulership and dignities', 'draft', 'Keep sect-based ordering and author-specific variants explicit.'),
  ('combustion', 'Combustion', 'A condition of a planet brought into close proximity with the Sun, distinct from cazimi and the broader condition under the Sun''s rays.', 'solar proximity and accidental condition', 'draft', 'Exact numerical limits vary by author and must be stored per interpretation.');

INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Bounds', 'English', 'synonym', 'Common modern English equivalent of terms.' FROM terms WHERE slug='terms';

INSERT INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Mutual reception', 'English', 'related-form', 'Reciprocal form of reception; not identical to simple reception.' FROM terms WHERE slug='reception';

-- AL-BIRUNI: APPLICATION
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '321', '322', '489', '§489, application and separation', NULL,
       'Defines application/separation through formation and withdrawal of planetary aspects and explains application by relative planetary motion.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī treats application and separation as the formation of, and withdrawal from, conjunction or aspect. In the ordinary direct-motion scheme the lower, faster planet applies to the higher, slower planet; he then gives the planetary order of who can apply to whom.',
       'Planetary application and separation, §489', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='al-biruni-tafhim';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='489'
WHERE t.slug='application' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: RECEPTION
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '330', '331', '507', '§507, reception', NULL,
       'Reception is tied to a planet arriving at a dignity proper to another; reciprocal placement produces mutual reception and richer dignity strengthens it.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī defines reception through a planet entering a dignity belonging to another planet. If the second planet is likewise in a dignity belonging to the first, the reception is mutual. He explicitly says that greater dignity strengthens the reception and that hostile aspects can qualify it.',
       'Reception, §507', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='al-biruni-tafhim';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='507'
WHERE t.slug='reception' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: TERMS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '282', '283', '453', '§453, terms', NULL,
       'Defines terms as unequal sign divisions associated with planets and explicitly distinguishes several historical systems.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī describes the terms as unequal divisions of the signs, each associated with a planet. He reports disagreement among Chaldean, Astaratus and Indian schemes, says professional astrologers use the Egyptian terms, and separately records the terms transmitted by Ptolemy.',
       'Terms and their competing systems, §453', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='al-biruni-tafhim';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='453'
WHERE t.slug='terms' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: TRIPLICITY RULERS
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '276', '277', '445', '§445, lords of the triplicities', NULL,
       'Gives day, night and participating rulers for each triplicity and notes an alternate ordering practice.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī assigns each triplicity a day ruler, a night ruler and a third ruler participating in both sects. He also records an alternate practice that orders all three rulers differently by day and by night rather than treating only one as primary.',
       'Triplicity rulers, §445', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-rulers' AND w.slug='al-biruni-tafhim';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='445'
WHERE t.slug='triplicity-rulers' AND w.slug='al-biruni-tafhim';

-- AL-BIRUNI: COMBUSTION
INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '313', '314', '481', '§481, cazimi/orientality/occidentality and solar proximity', NULL,
       'Distinguishes a very close solar condition, combustion and the wider condition under the rays; numerical thresholds are source-specific.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Bīrūnī distinguishes the closest solar condition from combustion and then from being under the rays. In this translation, a planet beyond the innermost solar condition is called combust until a wider solar distance is reached, after which it remains under the rays until its appropriate visibility distance.',
       'Solar proximity, §481', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combustion' AND w.slug='al-biruni-tafhim';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.section='481'
WHERE t.slug='combustion' AND w.slug='al-biruni-tafhim';

-- LILLY: APPLICATION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '128', '129', 'Book I', 'Ch. XIX', 'Application definition, pp. 107-108 of original pagination', NULL,
       'Defines three forms of application and then gives the general conjunction/aspect definition.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines application as two planets drawing nearer by conjunction or aspect. His ordinary rule is that the lighter/faster planet applies to the heavier/slower one, while retrogradation can reverse or complicate the normal pattern. He separately distinguishes three motion configurations of application.',
       'Book I, application', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='lilly-christian-astrology';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text LIKE 'Application definition%'
WHERE t.slug='application' AND w.slug='lilly-christian-astrology';

-- LILLY: RECEPTION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '133', '133', 'Book I', 'Ch. XIX', 'Reception definition, original p. 112', NULL,
       'Defines mutual reception through each planet being in a dignity of the other; distinguishes house, triplicity, term and face reception.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly presents reception here as a reciprocal relation between two significators occupying each other''s dignities. Reception by house is his strongest form, but he also allows reception through triplicity, term, face or other essential dignity. In judgment he treats mutual reception as capable of helping perfect a matter even where aspects are difficult or absent.',
       'Book I, reception', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='lilly-christian-astrology';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text LIKE 'Reception definition%'
WHERE t.slug='reception' AND w.slug='lilly-christian-astrology';

-- LILLY: TERMS
INSERT INTO source_passages (edition_id, page_start, page_end, book, locator_text, quote, internal_notes)
SELECT e.id, '78', '87', 'Book I', 'Planet descriptions and term tables', NULL,
       'Lilly explicitly attributes the term degrees he uses to Ptolemy and lists them planet by planet.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly uses planetary terms as essential dignities and gives their degree ranges sign by sign in the planetary descriptions. In this text he explicitly attributes the term scheme to Ptolemy.',
       'Book I, planetary dignities and term tables', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='lilly-christian-astrology';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text='Planet descriptions and term tables'
WHERE t.slug='terms' AND w.slug='lilly-christian-astrology';

-- LILLY: COMBUSTION
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '134', '134', 'Book I', 'Ch. XIX', 'Combustion / under the Sun beams / cazimi definitions, original p. 113', NULL,
       'Lilly gives separate numerical limits for combustion, under the beams and cazimi.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='lilly-christian-astrology';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Lilly defines combustion as a planet being in the same sign as the Sun and within 8°30′ of it. He distinguishes this from being under the Sun''s beams, which extends to 17°, and from cazimi, which he places within 17 minutes of the Sun. He also considers applying combustion more afflicting than separating combustion.',
       'Book I, solar proximity conditions', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology';

INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id AND sp.locator_text LIKE 'Combustion / under%'
WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology';

-- Cross-relations discovered in this pass.
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'historically-associated-with', 'Reception is repeatedly described through planetary dignity, so it must remain linked to dignity doctrine while retaining its own entry.', 'draft'
FROM terms a, terms b WHERE a.slug='reception' AND b.slug='terms';
