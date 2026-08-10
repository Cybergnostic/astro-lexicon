-- Editorial Baseline v1: historical Greek forms for core aspect mechanics.
--
-- Philological reference: HOROI Project glossary. These rows preserve Hellenistic Greek
-- vocabulary without claiming that every later medieval/Latin technical category has a
-- perfect one-to-one Greek noun equivalent.

PRAGMA foreign_keys = ON;

WITH data(term_slug,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note) AS (VALUES
  ('aspect','ἀκτίς','ἀκτίς','aktis','ray','lemma',
   'Greek aspect vocabulary is broader than one noun: historical texts also use several verbs of seeing, witnessing and regarding. This form records the ray/aspect concept rather than flattening the whole vocabulary.',
   'HOROI records aktis as the Hellenistic equivalent of an astrological ray/aspect.'),
  ('application','συναφή','συναφή','synaphē','contact / joining','lemma',
   'HOROI renders this as contact and identifies it with the Hellenistic application concept. Do not confuse it with kollēsis, a stricter adherence/conjunction-in-course term preserved separately under Contact (Kollesis).',
   'Historical Greek form for the general application/contact concept.'),
  ('separation','ἀπόρροια','ἀπόρροια','aporrhoia','flowing away / effluence','lemma',
   'The historical metaphor is flowing away after contact; the technical English rendering is separation.',
   'Historical Greek nominal form for separation.'),
  ('reception','ὑποδέχομαι','ὑποδέχομαι','hupodechomai','receive / welcome','lemma',
   'This is a verbal historical form: for a planet to have another planet in one of its own signs or degrees. It should not be presented as proof that one Greek noun maps exactly onto all later Latin/medieval reception doctrine.',
   'Historical Greek verb expressing the act underlying planetary reception.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',d.form,d.lemma,d.transliteration,d.literal_gloss,d.form_type,d.ambiguity_note,d.editorial_note,'reviewed'
FROM data d JOIN terms t ON t.slug=d.term_slug;

WITH renderings(form,rendering,rendering_type,scope_note) AS (VALUES
  ('ἀκτίς','Aspect','preferred','Technical astrological rendering in the ray/aspect context.'),
  ('ἀκτίς','Ray','literal','Literal and historically useful rendering.'),
  ('συναφή','Application','preferred','Hellenistic contact/application concept.'),
  ('συναφή','Contact','variant','Literal/philological rendering; distinguish from the stricter canonical Contact (Kollesis) entry.'),
  ('ἀπόρροια','Separation','preferred','Technical astrological rendering.'),
  ('ἀπόρροια','Effluence','literal','Literalizing historical rendering.'),
  ('ὑποδέχομαι','Receive','preferred','Verbal form underlying the planetary reception relation.'),
  ('ὑποδέχομαι','Reception','variant','Conceptual English rendering when the verb describes one planet receiving another into its dignities.')
)
INSERT OR IGNORE INTO term_form_renderings (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=r.form;

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used for the historical Greek form, transliteration and technical scope; encyclopedia prose is independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.form IN ('ἀκτίς','συναφή','ἀπόρροια','ὑποδέχομαι')
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
