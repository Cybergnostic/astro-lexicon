-- First A-class legacy-distillation migration batch.
-- Private study distillations are used as coverage/pedagogy maps only. Public
-- prose is original synthesis and relies on the canonical historical corpus for
-- public evidence and source-specific claims.

-- -----------------------------------------------------------------------------
-- PRIMARY QUALITIES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Hot, cold, moist and dry are the four primary qualities that organize much of traditional astrological natural philosophy. They provide a common language for describing elements, signs, planetary natures and temperament, allowing several different doctrines to be connected through the same qualitative framework.',
       'reviewed',
       'Migrated from the audited foundational curriculum as original editorial synthesis; no private wording retained.'
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-pairs','Two pairs of contraries',
       'The four qualities are arranged as two oppositions: hot against cold, and moist against dry. Historical authors may describe the first pair as active and the second as passive. A thing can therefore be described by one quality from each pair, producing combinations such as hot and dry or cold and moist.',
       10,'reviewed',NULL
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'elements','From qualities to elements',
       'The four elemental natures are built from these combinations. Fire is hot and dry, air hot and moist, water cold and moist, and earth cold and dry. This is why elemental and temperamental classifications can be translated back into qualitative language rather than treated as unrelated lists of keywords.',
       20,'reviewed',NULL
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'astrological-use','How astrology uses the qualities',
       'Traditional astrology attributes qualitative mixtures to signs, planets, seasons and other conditions. The same planet can also acquire modifying testimony from its phase, sect, location or relationships. The qualities therefore function as a comparative vocabulary: they help explain how different factors reinforce, moderate or oppose one another.',
       30,'reviewed',NULL
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-model','A historical technical model',
       'These qualities belong to premodern natural philosophy. On this site they are presented as historical technical concepts used by astrologers, not as modern physical measurements or clinical categories. Their importance lies in understanding the logic of the astrological sources on their own terms.',
       40,'reviewed',NULL
FROM terms WHERE slug='primary-quality';

-- -----------------------------------------------------------------------------
-- SIGN MODALITY / QUADRUPLICITY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Sign modality is the threefold classification of the zodiac according to each sign''s position within a seasonal quarter. The older terminology is tropical or movable, fixed, and bicorporeal; later astrology often calls the same three classes cardinal, fixed, and mutable or common.',
       'reviewed',
       'Migrated from the audited zodiac-sign curriculum; historical terminology remains primary.'
FROM terms WHERE slug='sign-modality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'seasonal-structure','The seasonal structure',
       'Each quarter of the tropical zodiac contains a beginning, a middle and an end. The first sign begins the seasonal change and is tropical or movable; the second stabilizes the quarter and is fixed; the third completes and transitions out of the quarter and is bicorporeal or common. The classification is therefore structural before it is interpretive.',
       10,'reviewed',NULL
FROM terms WHERE slug='sign-modality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'three-classes','The three classes',
       'Aries, Cancer, Libra and Capricorn form the tropical or movable class. Taurus, Leo, Scorpio and Aquarius are fixed. Gemini, Virgo, Sagittarius and Pisces are bicorporeal or common. Each class cuts across the four elemental triplicities, so modality and element describe different dimensions of a sign.',
       20,'reviewed',NULL
FROM terms WHERE slug='sign-modality';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'do-not-collapse','Do not collapse sign classifications',
       'Modality should not be confused with triplicity, masculine or feminine classification, diurnal or nocturnal classification, fertility, voice, human or bestial form, or other traditional sign divisions. A sign belongs to several classifications simultaneously, and each answers a different technical question.',
       30,'reviewed',NULL
FROM terms WHERE slug='sign-modality';

-- -----------------------------------------------------------------------------
-- PLANETARY GENDER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Planetary gender is a traditional technical classification that groups planets as masculine, feminine or variable. It is one of several inherited planetary taxonomies and should be read within that historical framework rather than as a statement about modern social identity.',
       'reviewed',
       'Migrated from the audited planets curriculum; modern social-gender readings are intentionally excluded.'
FROM terms WHERE slug='planetary-gender';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'basic-classification','The basic classification',
       'In the reviewed historical corpus Saturn, Jupiter, Mars and the Sun belong to the masculine class, while Venus and the Moon belong to the feminine class. Mercury is exceptional because its classification can change through association and condition rather than remaining absolutely fixed.',
       10,'reviewed',NULL
FROM terms WHERE slug='planetary-gender';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mercury','Why Mercury is different',
       'Mercury repeatedly occupies a mediating position in traditional planetary classification. Historical authors allow it to take on characteristics from the planets with which it is associated. Its variable gender is therefore part of a broader pattern in which Mercury resists several simple binary classifications.',
       20,'reviewed',NULL
FROM terms WHERE slug='planetary-gender';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-from-sign-gender','Planetary and sign gender are separate doctrines',
       'Zodiacal signs also have a masculine and feminine classification, but that does not make planetary gender and sign gender the same doctrine. A planet retains its own natural classification while occupying a sign that has a separate classification. Traditional interpretation can compare these layers without collapsing them.',
       30,'reviewed',NULL
FROM terms WHERE slug='planetary-gender';

-- -----------------------------------------------------------------------------
-- ESSENTIAL DIGNITY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Essential dignity describes a planet''s standing in the zodiacal place it occupies. It answers a different question from accidental strength: essential dignity concerns rulership, belonging and qualitative fitness, while accidental conditions describe how able a planet is to act in the circumstances of a particular chart.',
       'reviewed',
       'Migrated from the audited essential-dignities curriculum. Detailed table variants remain source-specific.'
FROM terms WHERE slug='essential-dignity';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'five-dignities','The five standard dignities',
       'The standard fivefold scheme consists of domicile, exaltation, triplicity, term and face or decan. They do not all represent the same degree of authority. Domicile gives the most complete kind of zodiacal rulership, while the smaller dignities provide progressively more limited forms of standing within a sign or degree.',
       10,'reviewed',NULL
FROM terms WHERE slug='essential-dignity';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'dignity-and-debility','Dignity and debility',
       'Domicile and exaltation have traditional opposites: detriment or exile stands opposite domicile, and fall stands opposite exaltation. These conditions describe a planet''s relationship to zodiacal places. They should not be translated mechanically into moral categories such as good planet and bad planet.',
       20,'reviewed',NULL
FROM terms WHERE slug='essential-dignity';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'quality-versus-power','Quality is not the same as power',
       'A planet may be essentially dignified yet accidentally weak, or essentially debilitated yet accidentally powerful. For example, zodiacal dignity can describe a planet as acting from a place suited to its nature while cadency, combustion, retrogradation or other accidental conditions restrict its capacity to produce effects. Sound judgment therefore keeps essential quality and accidental power distinct before synthesizing them.',
       30,'reviewed',NULL
FROM terms WHERE slug='essential-dignity';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'tables-and-variants','Tables and historical variants',
       'The five dignity classes are widely shared, but the detailed rulers and weighting systems are not perfectly uniform across every historical author. Terms and triplicity rulers in particular can vary by tradition or table. The lexicon therefore keeps source-specific accounts visible instead of pretending that every historical table is identical.',
       40,'reviewed',NULL
FROM terms WHERE slug='essential-dignity';
