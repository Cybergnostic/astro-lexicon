-- Bird's-eye terminology pass: Ancient Greek names of the zodiac and twelve signs.
--
-- Editorial/reference source: HOROI Project glossary (Levente László).
-- This adds historically attested Greek technical forms only. It is not a translation of
-- the English site into modern Greek, and the English prose below is original editorial
-- metadata rather than copied glossary definitions.

PRAGMA foreign_keys = ON;

WITH data(term_slug,form,transliteration,literal_gloss,editorial_note) AS (VALUES
  ('zodiac-sign','ζῴδιον','zōidion','figure / image','Historical Greek technical noun for one zodiacal sign or twelfth-part.'),
  ('aries','Κριός','Krios','Ram','Historical Greek name of Aries.'),
  ('taurus','Ταῦρος','Tauros','Bull','Historical Greek name of Taurus.'),
  ('gemini','Δίδυμοι','Didumoi','Twins','Historical Greek name of Gemini.'),
  ('cancer','Καρκίνος','Karkinos','Crab','Historical Greek name of Cancer.'),
  ('leo','Λέων','Leōn','Lion','Historical Greek name of Leo.'),
  ('virgo','Παρθένος','Parthenos','Maiden','Historical Greek name of Virgo.'),
  ('libra','Ζυγός','Zugos','Balance / yoke','Historical Greek name of Libra.'),
  ('scorpio','Σκορπίος','Skorpios','Scorpion','Historical Greek name of Scorpio.'),
  ('sagittarius','Τοξότης','Toxotēs','Archer','Historical Greek name of Sagittarius.'),
  ('capricorn','Αἰγόκερως','Aigokerōs','Goat-horned','Historical Greek name of Capricorn.'),
  ('aquarius','Ὑδροχόος','Hudrochoos','Water-pourer','Historical Greek name of Aquarius.'),
  ('pisces','Ἰχθύες','Ichthues','Fishes','Historical Greek name of Pisces.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',d.form,d.form,d.transliteration,d.literal_gloss,
       CASE WHEN d.term_slug='zodiac-sign' THEN 'lemma' ELSE 'name' END,
       CASE WHEN d.term_slug='zodiac-sign' THEN 'The word can denote an image or figure in ordinary Greek; in astrological context it denotes a zodiacal sign/twelfth-part and should not be reduced to the modern English word “animal.”' ELSE NULL END,
       d.editorial_note,'reviewed'
FROM data d JOIN terms t ON t.slug=d.term_slug;

WITH data(form,english_name) AS (VALUES
  ('ζῴδιον','Zodiac sign'),
  ('Κριός','Aries'),('Ταῦρος','Taurus'),('Δίδυμοι','Gemini'),('Καρκίνος','Cancer'),
  ('Λέων','Leo'),('Παρθένος','Virgo'),('Ζυγός','Libra'),('Σκορπίος','Scorpio'),
  ('Τοξότης','Sagittarius'),('Αἰγόκερως','Capricorn'),('Ὑδροχόος','Aquarius'),('Ἰχθύες','Pisces')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,d.english_name,'preferred','Canonical English rendering in the lexicon.'
FROM data d
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=d.form;

-- Literal/name glosses are retained as secondary renderings so a reader can distinguish
-- translation of the word from the canonical English zodiacal name.
WITH data(form,literal_rendering) AS (VALUES
  ('ζῴδιον','Figure / image'),
  ('Κριός','Ram'),('Ταῦρος','Bull'),('Δίδυμοι','Twins'),('Καρκίνος','Crab'),
  ('Λέων','Lion'),('Παρθένος','Maiden'),('Ζυγός','Balance / yoke'),('Σκορπίος','Scorpion'),
  ('Τοξότης','Archer'),('Αἰγόκερως','Goat-horned'),('Ὑδροχόος','Water-pourer'),('Ἰχθύες','Fishes')
)
INSERT OR IGNORE INTO term_form_renderings
  (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,d.literal_rendering,'literal','Literal or name-gloss layer; not a replacement headword.'
FROM data d
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=d.form;

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek zodiac terminology',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify the historical Greek form and transliteration; public lexicon wording is independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.form IN ('ζῴδιον','Κριός','Ταῦρος','Δίδυμοι','Καρκίνος','Λέων','Παρθένος','Ζυγός','Σκορπίος','Τοξότης','Αἰγόκερως','Ὑδροχόος','Ἰχθύες')
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
