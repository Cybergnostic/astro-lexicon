-- Editorial Baseline v1: database-wide Hellenistic Greek terminology completeness.
--
-- This pass adds only high-confidence historical forms with an explicit philological
-- reference. It is not a modern translation layer and does not force Greek equivalents
-- onto medieval/Latin concepts where the correspondence is uncertain.
--
-- Editorial/reference witness: HOROI Project glossary (Levente László),
-- https://horoiproject.com/glossary/

PRAGMA foreign_keys = ON;

-- Repair the earlier retrograde form attachment: the current canonical headword is
-- `retrogradation`, while seed 0156 targeted the older/non-canonical `retrograde-motion`.
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT id,'grc','Greek','ἀφαίρεσις','ἀφαίρεσις','aphairesis','subtraction','lemma',
       'The literal word means subtraction; in Hellenistic planetary-motion vocabulary it denotes retrograde/subtractive motion.',
       'Historical Greek nominal form for retrograde motion.','reviewed'
FROM terms WHERE slug='retrogradation';

-- High-confidence Greek technical forms found in the historical glossary.
WITH data(term_slug,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note) AS (VALUES
  ('benefic','ἀγαθοποιός','ἀγαθοποιός','agathopoios','good-doer','lemma',NULL,'Historical Greek term for the benefic planetary class.'),
  ('malefic','κακοποιός','κακοποιός','kakopoios','evil-doer','lemma',NULL,'Historical Greek term for the malefic planetary class.'),

  ('nativity','γένεσις','γένεσις','genesis','birth / beginning','lemma','The word can also denote a beginning more generally; context determines the natal sense.','Historical Greek term for a birth/nativity and its celestial disposition.'),
  ('nativity','γενέθλιον','γενέθλιον','genethlion','nativity / birthday matter','lemma',NULL,'Alternative Greek natal term explicitly associated with nativity.'),

  ('hyleg','ἐπικρατήτωρ','ἐπικρατήτωρ','epikratētōr','predominator','lemma','A Greek historical equivalent for the life-signifying role; not every later Hyleg selection scheme is thereby made identical.','Historical Greek term corresponding to the Hyleg/predominator role.'),
  ('hyleg','ἀφέτης','ἀφέτης','aphetēs','releaser','lemma','Especially tied to the release/direction context of the life-signifying factor.','Historical Greek form associated with the Hyleg in releasing/directional doctrine.'),
  ('anareta','ἀναιρέτης','ἀναιρέτης','anairetēs','destroyer','lemma',NULL,'Historical Greek term corresponding to the Anareta/destroyer role.'),

  ('profection','παράδοσις καὶ παράληψις','παράδοσις καὶ παράληψις','paradosis kai paralēpsis','transmission and acquisition','phrase','This is the Hellenistic technical phrase corresponding to profection; later profection systems can preserve additional procedural differences.','Historical Greek phrase for profection.'),
  ('distribution','ἐπιμερισμός','ἐπιμερισμός','epimerismos','distribution / allotment','lemma','The term is broader than one single later bound-distribution algorithm.','Historical Greek term for distribution/allotment of periods.'),
  ('direct-motion','πρόσθεσις','πρόσθεσις','prosthesis','addition','lemma','The literal word means addition; in Hellenistic planetary-motion vocabulary it denotes direct/additive motion.','Historical Greek nominal form for direct motion.'),
  ('solar-revolution','ἀντιγένεσις','ἀντιγένεσις','antigenesis','birth-substitute','lemma','The historical term is specifically connected with the solar revolution as a substitute/repetition of the birth figure.','Historical Greek equivalent of the natal solar revolution.'),

  ('sign','ζῴδιον','ζῴδιον','zōidion','depiction / sign','lemma','The word denotes a zodiacal sign and can also carry the literal sense of a depiction.','Historical Greek term for a zodiacal sign.'),
  ('chart','θέμα','θέμα','thema','arrangement / chart','lemma','The ordinary semantic range is broader than the technical astrological chart sense.','Historical Greek term for the celestial arrangement/chart.'),

  ('ascending-node','Ἀναβιβάζων','Ἀναβιβάζων','Anabibazōn','the one causing ascent','lemma','Often appears in the fuller phrase for the ascending lunar bond/node.','Historical Greek name for the ascending lunar node.'),
  ('descending-node','Καταβιβάζων','Καταβιβάζων','Katabibazōn','the one causing descent','lemma','Often appears in the fuller phrase for the descending lunar bond/node.','Historical Greek name for the descending lunar node.'),

  ('under-the-beams','ὕπαυγος','ὕπαυγος','hupaugos','under the rays / beams','lemma','HOROI notes that the Hellenistic category can overlap the broad modern distinction between combustion and under-the-beams terminology; source-specific thresholds remain separate.','Historical Greek form for being under the solar beams.'),
  ('planetary-order','πλανήτης','πλανήτης','planētēs','wanderer','related-term','This is the historical Greek word behind planet, not a Greek name for the ordered cosmological doctrine itself.','Related historical vocabulary for the planetary category; retained here only as terminology context.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',d.form,d.lemma,d.transliteration,d.literal_gloss,d.form_type,d.ambiguity_note,d.editorial_note,'reviewed'
FROM data d
JOIN terms t ON t.slug=d.term_slug;

-- Add preferred English renderings without changing the public canonical headword policy.
WITH renderings(form,rendering,rendering_type,scope_note) AS (VALUES
  ('ἀγαθοποιός','Benefic','preferred','Historical planetary-class term.'),
  ('ἀγαθοποιός','Good-doer','literal','Literal rendering.'),
  ('κακοποιός','Malefic','preferred','Historical planetary-class term.'),
  ('κακοποιός','Evil-doer','literal','Literal rendering.'),
  ('γένεσις','Nativity','preferred','Natal/birth context.'),
  ('γένεσις','Birth','variant','Common literal rendering.'),
  ('γενέθλιον','Nativity','preferred','Natal context.'),
  ('ἐπικρατήτωρ','Hyleg','preferred','Historical role equivalence.'),
  ('ἐπικρατήτωρ','Predominator','literal','Literal/technical rendering.'),
  ('ἀφέτης','Hyleg','preferred','Especially in release/direction context.'),
  ('ἀφέτης','Releaser','literal','Literal/technical rendering.'),
  ('ἀναιρέτης','Anareta','preferred','Historical role equivalence.'),
  ('ἀναιρέτης','Destroyer','literal','Literal rendering.'),
  ('παράδοσις καὶ παράληψις','Profection','preferred','Historical technical equivalence.'),
  ('παράδοσις καὶ παράληψις','Transmission and Acquisition','literal','Literal technical rendering.'),
  ('ἐπιμερισμός','Distribution','preferred','Predictive-period context.'),
  ('πρόσθεσις','Direct Motion','preferred','Technical planetary-motion sense.'),
  ('πρόσθεσις','Addition','literal','Literal historical metaphor.'),
  ('ἀντιγένεσις','Solar Revolution','preferred','Natal annual-return context.'),
  ('ἀντιγένεσις','Birth-substitute','literal','Literal rendering.'),
  ('ζῴδιον','Sign','preferred','Zodiacal sign.'),
  ('θέμα','Chart','preferred','Astrological chart/figure context.'),
  ('Ἀναβιβάζων','Ascending Node','preferred','Lunar node.'),
  ('Καταβιβάζων','Descending Node','preferred','Lunar node.'),
  ('ὕπαυγος','Under the Beams','preferred','Solar-proximity/visibility context.'),
  ('ἀφαίρεσις','Retrogradation','preferred','Technical planetary-motion sense.'),
  ('ἀφαίρεσις','Subtraction','literal','Literal historical metaphor.')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=r.form;

-- Attach the philological reference to all reviewed Greek forms introduced here or repaired
-- here. Existing rows already carrying this attestation are left untouched.
INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify historical Greek form, transliteration and technical scope. Public encyclopedia prose remains independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.status='reviewed'
  AND tf.form IN (
    'ἀφαίρεσις','ἀγαθοποιός','κακοποιός','γένεσις','γενέθλιον','ἐπικρατήτωρ','ἀφέτης','ἀναιρέτης',
    'παράδοσις καὶ παράληψις','ἐπιμερισμός','πρόσθεσις','ἀντιγένεσις','ζῴδιον','θέμα',
    'Ἀναβιβάζων','Καταβιβάζων','ὕπαυγος','πλανήτης'
  )
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
