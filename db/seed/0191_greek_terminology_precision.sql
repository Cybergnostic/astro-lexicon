-- Editorial Baseline v1: precision corrections and additional high-confidence Greek forms.
--
-- Historical-form rows must denote the concept itself, not merely related vocabulary.

PRAGMA foreign_keys = ON;

-- `πλανήτης` means a wandering star/planet; it is not a historical form of the abstract
-- doctrine "Planetary Order". Remove the overly broad relationship introduced in 0190.
DELETE FROM term_forms
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-order')
  AND language_code='grc'
  AND form='πλανήτης';

-- Add several additional direct Hellenistic equivalents from the HOROI glossary.
WITH data(term_slug,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note) AS (VALUES
  ('twelve-places','δωδεκάτροπος','δωδεκάτροπος','dōdekatropos','twelve-turning','lemma',NULL,'Historical Greek term for the twelve-place framework.'),
  ('conceptional-beginning','σπορά','σπορά','spora','conception / sowing','lemma','The Greek term can denote conception itself and the associated celestial disposition.','Historical Greek terminology for conception and the conception figure.'),
  ('solar-revolution','ἀποκατάστασις','ἀποκατάστασις','apokatastasis','return / restoration','lemma','This is the broader Hellenistic return/revolution term; the more specifically natal solar-return form ἀντιγένεσις is also retained.','Historical Greek return/revolution vocabulary applicable to a planetary return.'),
  ('lord-of-year','ἐνιαυτοκράτωρ','ἐνιαυτοκράτωρ','eniautokratōr','year-ruler','lemma','The historical Greek year-ruler belongs especially to transmission/profection contexts; later Lord-of-Year algorithms remain source-specific.','Historical Greek term for a ruler of the year.'),
  ('celestial-latitude','πλάτος','πλάτος','platos','breadth','lemma',NULL,'Historical Greek term for ecliptic latitude.'),
  ('celestial-longitude','μῆκος','μῆκος','mēkos','length','lemma',NULL,'Historical Greek term for ecliptic longitude.'),
  ('eclipse','ἔκλειψις','ἔκλειψις','ekleipsis','failing / eclipse','lemma',NULL,'Historical Greek astronomical term for eclipse.'),
  ('fixed-star','ἀπλανής','ἀπλανής','aplanēs','non-wandering','adjective','Often used with star understood; the literal contrast is with wandering stars/planets.','Historical Greek adjective for a fixed/non-wandering star.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',d.form,d.lemma,d.transliteration,d.literal_gloss,d.form_type,d.ambiguity_note,d.editorial_note,'reviewed'
FROM data d
JOIN terms t ON t.slug=d.term_slug;

WITH renderings(form,rendering,rendering_type,scope_note) AS (VALUES
  ('δωδεκάτροπος','Twelve Places','preferred','Historical house/place framework.'),
  ('δωδεκάτροπος','Twelve-turning','literal','Literal rendering.'),
  ('σπορά','Conception','preferred','Conception and its celestial disposition.'),
  ('ἀποκατάστασις','Return / Revolution','preferred','General planetary-return context.'),
  ('ἐνιαυτοκράτωρ','Lord of the Year','preferred','Year-ruler context.'),
  ('ἐνιαυτοκράτωρ','Year-ruler','literal','Literal rendering.'),
  ('πλάτος','Celestial Latitude','preferred','Ecliptic-coordinate context.'),
  ('πλάτος','Breadth','literal','Literal rendering.'),
  ('μῆκος','Celestial Longitude','preferred','Ecliptic-coordinate context.'),
  ('μῆκος','Length','literal','Literal rendering.'),
  ('ἔκλειψις','Eclipse','preferred','Astronomical eclipse.'),
  ('ἀπλανής','Fixed Star','preferred','Non-wandering star context.'),
  ('ἀπλανής','Non-wandering','literal','Literal rendering.')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=r.form;

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify historical Greek form, transliteration and technical scope. Public encyclopedia prose remains independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.status='reviewed'
  AND tf.form IN ('δωδεκάτροπος','σπορά','ἀποκατάστασις','ἐνιαυτοκράτωρ','πλάτος','μῆκος','ἔκλειψις','ἀπλανής')
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
