-- Bird's-eye terminology pass: establish a source-sensitive Ancient Greek layer.
--
-- Editorial discovery/reference source: HOROI Project glossary (Levente László),
-- https://horoiproject.com/glossary/
--
-- This is deliberately not a modern-Greek translation of the English lexicon. The
-- rows below are historically attested Hellenistic technical forms and planetary
-- names selected because they clarify major families already present in the corpus.
-- Glosses and notes are original editorial summaries; no glossary definitions are copied.

PRAGMA foreign_keys = ON;

WITH data(term_slug,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note) AS (VALUES
  ('sun','Ἥλιος','Ἥλιος','Hēlios',NULL,'name',NULL,'Greek name used for the Sun.'),
  ('moon','Σελήνη','Σελήνη','Selēnē',NULL,'name',NULL,'Greek name used for the Moon.'),
  ('mercury','Ἑρμῆς','Ἑρμῆς','Hermēs',NULL,'name',NULL,'Divine name used for Mercury.'),
  ('mercury','Στίλβων','Στίλβων','Stilbōn','Twinkling','name',NULL,'Planetary/star epithet used for Mercury.'),
  ('venus','Ἀφροδίτη','Ἀφροδίτη','Aphroditē',NULL,'name',NULL,'Divine name used for Venus.'),
  ('venus','Φωσφόρος','Φωσφόρος','Phōsphoros','Light-Bringing','name','The same word can also denote the morning star as an appearance rather than functioning only as a proper planetary name.','Planetary/star epithet associated with Venus.'),
  ('mars','Ἄρης','Ἄρης','Arēs',NULL,'name',NULL,'Divine name used for Mars.'),
  ('mars','Πυρόεις','Πυρόεις','Puroeis','Fiery','name',NULL,'Planetary/star epithet used for Mars.'),
  ('jupiter','Ζεύς','Ζεύς','Zeus',NULL,'name',NULL,'Divine name used for Jupiter.'),
  ('jupiter','Φαέθων','Φαέθων','Phaethōn','Radiant','name',NULL,'Planetary/star epithet used for Jupiter.'),
  ('saturn','Κρόνος','Κρόνος','Kronos',NULL,'name',NULL,'Divine name used for Saturn.'),
  ('saturn','Φαίνων','Φαίνων','Phainōn','Shining','name',NULL,'Planetary/star epithet used for Saturn.'),
  ('domicile','οἶκος','οἶκος','oikos','house / home','lemma','English “house” is potentially confusing because Hellenistic place terminology is a different technical layer.','Historical Greek form behind the domicile concept.'),
  ('exaltation','ὕψωμα','ὕψωμα','hupsōma','height / elevation','lemma',NULL,'Historical Greek form for exaltation.'),
  ('fall','ταπείνωμα','ταπείνωμα','tapeinōma','lowering / depression','lemma',NULL,'Historical Greek form corresponding to fall.'),
  ('fall','κοίλωμα','κοίλωμα','koilōma','hollowing / dejection','lemma','A second historical term for the condition usually rendered fall or depression.','Alternative historical Greek form for fall/depression.'),
  ('triplicity','τρίγωνος','τρίγωνος','trigōnos','three-angled / trigon','lemma','The same Greek word can refer either to trine geometry or to a triplicity; context decides which technical sense is intended.','Important translation ambiguity retained rather than flattened.'),
  ('sect','αἵρεσις','αἵρεσις','hairesis','party / choice','lemma','In astrological contexts this denotes the planetary party or sect; the later theological sense “heresy” is a false friend.','Historical Greek term for sect/party.'),
  ('ascendant','Ὡροσκόπος','Ὡροσκόπος','Hōroskopos','Hour-Marker','lemma','Historically this names the Ascendant and, by extension, its sign or first place; modern “horoscope” is not an adequate one-to-one rendering.','Historical Greek term for the Ascendant.'),
  ('zodiac','ζῳδιακός κύκλος','ζῳδιακός κύκλος','zōidiakos kuklos','zodiacal circle','phrase','The adjective may also appear in shortened form; the technical object is the zodiacal circle/belt divided into signs.','Historical Greek form for the zodiac.'),
  ('zodiac','ζῳδιακός','ζῳδιακός','zōidiakos','zodiacal [circle]','lemma','A shortened form whose noun can be understood from context.','Shortened historical form for the zodiac.'),
  ('face','πρόσωπον','πρόσωπον','prosōpon','face / mask / person','lemma','The ordinary semantic range of the word is wider than the astrological decan association.','Historical Greek form for face.'),
  ('station','στηριγμός','στηριγμός','stērigmos','standing / fixing','lemma','Used for the zero-speed station of the five planets and the corresponding position.','Historical Greek nominal form for planetary station.'),
  ('retrograde-motion','ἀφαίρεσις','ἀφαίρεσις','aphairesis','subtraction','lemma','The Hellenistic technical metaphor is “subtraction”; translating the word literally without context can hide that it denotes retrograde motion.','Historical Greek nominal form used for retrograde motion.')
)
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek',d.form,d.lemma,d.transliteration,d.literal_gloss,d.form_type,d.ambiguity_note,d.editorial_note,'reviewed'
FROM data d
JOIN terms t ON t.slug=d.term_slug;

-- Bounds/terms is especially important but its canonical slug has varied in editorial
-- experiments. Resolve the reviewed headword defensively rather than creating a new term.
INSERT OR IGNORE INTO term_forms
  (term_id,language_code,script,form,lemma,transliteration,literal_gloss,form_type,ambiguity_note,editorial_note,status)
SELECT t.id,'grc','Greek','ὅριον','ὅριον','horion','boundary / limit','lemma',
       'Normally encountered in the plural for the consecutive planetary degree segments; English “bound” and Latin-derived “term” name the same historical layer only when the scheme and context agree.',
       'Historical Greek form for a planetary bound/term.','reviewed'
FROM terms t
WHERE t.id=(
  SELECT id FROM terms
  WHERE slug IN ('bound','bounds','term','terms','terms-bounds')
     OR lower(label) IN ('bound','bounds','term','terms','terms / bounds','terms and bounds')
  ORDER BY CASE slug
    WHEN 'bounds' THEN 0 WHEN 'bound' THEN 1 WHEN 'terms-bounds' THEN 2 WHEN 'terms' THEN 3 WHEN 'term' THEN 4 ELSE 5 END,id
  LIMIT 1
);

WITH renderings(form,rendering,rendering_type,scope_note) AS (VALUES
  ('Ἥλιος','Sun','preferred',NULL),
  ('Σελήνη','Moon','preferred',NULL),
  ('Ἑρμῆς','Mercury','preferred','Planetary name in astrological context.'),
  ('Στίλβων','Mercury','preferred','Alternative planetary/star name.'),('Στίλβων','Twinkling Star','literal','Literal value of the epithet in planetary naming.'),
  ('Ἀφροδίτη','Venus','preferred','Planetary name in astrological context.'),
  ('Φωσφόρος','Venus','preferred','Planetary/star epithet in the relevant context.'),('Φωσφόρος','Light-Bringing Star','literal','Literal value of the epithet.'),
  ('Ἄρης','Mars','preferred','Planetary name in astrological context.'),
  ('Πυρόεις','Mars','preferred','Alternative planetary/star name.'),('Πυρόεις','Fiery Star','literal','Literal value of the epithet.'),
  ('Ζεύς','Jupiter','preferred','Planetary name in astrological context.'),
  ('Φαέθων','Jupiter','preferred','Alternative planetary/star name.'),('Φαέθων','Radiant Star','literal','Literal value of the epithet.'),
  ('Κρόνος','Saturn','preferred','Planetary name in astrological context.'),
  ('Φαίνων','Saturn','preferred','Alternative planetary/star name.'),('Φαίνων','Shining Star','literal','Literal value of the epithet.'),
  ('οἶκος','Domicile','preferred','Use this rendering when the word denotes a planet’s zodiacal home.'),('οἶκος','House','variant','Literal/common rendering; do not confuse automatically with the twelve topical places.'),
  ('ὕψωμα','Exaltation','preferred',NULL),('ὕψωμα','Elevation','literal',NULL),
  ('ταπείνωμα','Fall','preferred',NULL),('ταπείνωμα','Depression','variant','A closer historical rendering used in scholarship.'),
  ('κοίλωμα','Fall','preferred',NULL),('κοίλωμα','Dejection','variant',NULL),
  ('τρίγωνος','Triplicity','preferred','When the word denotes one of the four zodiacal trigons.'),('τρίγωνος','Trine','variant','When the word denotes aspect/configuration geometry.'),
  ('αἵρεσις','Sect','preferred','Established astrological English rendering.'),('αἵρεσις','Party','variant','Makes the group/affiliation sense explicit.'),('αἵρεσις','Heresy','false-friend','A later semantic association, not the intended astrological technical sense.'),
  ('Ὡροσκόπος','Ascendant','preferred',NULL),('Ὡροσκόπος','Hour-Marker','literal','Literalizing rendering useful for historical texts.'),('Ὡροσκόπος','Horoscope','false-friend','Modern horoscope is much broader than this Hellenistic technical term.'),
  ('ζῳδιακός κύκλος','Zodiac','preferred',NULL),('ζῳδιακός κύκλος','Zodiacal circle','literal',NULL),
  ('ζῳδιακός','Zodiac','preferred','Shortened nominal use.'),
  ('πρόσωπον','Face','preferred','Astrological decan association.'),
  ('στηριγμός','Station','preferred','Planetary zero-speed station.'),
  ('ἀφαίρεσις','Retrograde motion','preferred','Technical astrological sense.'),('ἀφαίρεσις','Subtraction','literal','Literal historical metaphor.'),
  ('ὅριον','Bound','preferred','Preferred Hellenistic rendering.'),('ὅριον','Term','variant','Traditional Latin-derived English rendering.')
)
INSERT OR IGNORE INTO term_form_renderings (term_form_id,rendering,rendering_type,scope_note)
SELECT tf.id,r.rendering,r.rendering_type,r.scope_note
FROM renderings r
JOIN term_forms tf ON tf.language_code='grc' AND tf.form=r.form;

INSERT OR IGNORE INTO term_form_attestations
  (term_form_id,source_kind,tradition_scope,external_source_label,external_source_url,source_note,status)
SELECT tf.id,'reference','Hellenistic Greek technical vocabulary',
       'HOROI Project glossary','https://horoiproject.com/glossary/',
       'Philological reference used to verify the historical Greek form, transliteration and technical scope; public lexicon prose is independently written.',
       'reviewed'
FROM term_forms tf
WHERE tf.language_code='grc'
  AND tf.status='reviewed'
  AND NOT EXISTS (
    SELECT 1 FROM term_form_attestations a
    WHERE a.term_form_id=tf.id AND a.external_source_label='HOROI Project glossary'
  );
