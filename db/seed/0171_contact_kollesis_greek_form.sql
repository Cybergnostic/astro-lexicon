-- Editorial Baseline v1 terminology correction: Contact (Kollesis).
--
-- The canonical Antiochus entry already preserves Schmidt's English rendering and the
-- transliterated alias Kollesis. This seed adds the historically attested Greek form
-- verified against the HOROI Project glossary without replacing the source-specific
-- three-degree definition stored on the canonical entry.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT id,'grc','Greek','κόλλησις','κόλλησις','kollēsis','adherence / joining','lemma',
       'The historical Greek term can be rendered “adherence”; Schmidt’s Antiochus translation represented in this corpus uses “Contact”. Keep the translation choice source-visible rather than forcing one English rendering everywhere.',
       'Historical Greek technical form for the Antiochus Contact (Kollesis) entry.','reviewed'
FROM terms WHERE slug='contact-kollesis';

WITH renderings(rendering,rendering_type,scope_note) AS (VALUES
  ('Contact','preferred','Rendering used by the Schmidt translation represented in the Antiochus source account.'),
  ('Adherence','variant','Common scholarly rendering of the Hellenistic technical term.'),
  ('Kollesis','variant','Transliterated source term.')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.term_id=(SELECT id FROM terms WHERE slug='contact-kollesis')
                  AND tf.language_code='grc' AND tf.form='κόλλησις';

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference confirming κόλλησις / kollēsis as the Hellenistic technical form; the Antiochus source account remains authoritative for this entry’s specific recognition rule.',
       'reviewed'
FROM term_forms tf
JOIN terms t ON t.id=tf.term_id
WHERE t.slug='contact-kollesis' AND tf.language_code='grc' AND tf.form='κόλλησις';
