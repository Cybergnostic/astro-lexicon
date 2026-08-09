-- Encyclopedia conversion batch: sign-classification vocabulary.
-- These pages explain stable classification families without flattening source-specific
-- membership disputes into one universal table.

-- ZODIAC SIGN: add a structured overview of the main classification dimensions.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'classification-systems','Major sign-classification systems',
  'Traditional authors classify signs along several independent dimensions. A sign can belong to one class in each system at the same time; these categories should not be treated as synonyms.',
  '["Dimension","Principal classes","What the classification describes"]',
  '[["Triplicity","Fire · Earth · Air · Water","Elemental nature"],["Quadruplicity","Movable · Fixed · Common/Bicorporeal","Seasonal position and mode"],["Polarity","Masculine · Feminine","Alternating zodiacal class"],["Day/night class","Diurnal · Nocturnal","Alternating sign class distinct from planetary sect"],["Ascensional class","Long/Straight · Short/Crooked","Rising duration at the relevant terrestrial latitude"],["Hemisphere","Northern · Southern","Position north or south of the celestial equator in the tropical sign framework"],["Form / voice / fertility","Human, quadruped, voiced, fecund, barren, etc.","Historical descriptive classifications whose membership can vary by source"]]',
  35,'reviewed','Framework table only. Source-variable memberships remain attributable in their own entries.'
FROM terms WHERE slug='zodiac-sign';

-- NORTHERN / SOUTHERN SIGNS
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Northern signs are the six signs occupying the northern half of the tropical zodiac, from Aries through Virgo. The classification is astronomical in basis and refers to the signs'' relation to the celestial equator, not to a symbolic personality polarity.',
  'reviewed','Structural sign-classification article.'
FROM terms WHERE slug='northern-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'membership','Membership',
  'The northern series is Aries, Taurus, Gemini, Cancer, Leo and Virgo. The Sun enters the northern half of the tropical zodiac at the vernal equinox and leaves it at the autumnal equinox.',10,'reviewed'
FROM terms WHERE slug='northern-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','What this does not mean',
  'Northern/southern classification is independent of element, modality, masculine/feminine class and long- or short-ascension status. A sign can therefore be northern while belonging to any of several other classification families.',20,'reviewed'
FROM terms WHERE slug='northern-signs';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Southern signs are the six signs occupying the southern half of the tropical zodiac, from Libra through Pisces. The classification is astronomical in basis and refers to the signs'' relation to the celestial equator.',
  'reviewed','Structural sign-classification article.'
FROM terms WHERE slug='southern-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'membership','Membership',
  'The southern series is Libra, Scorpio, Sagittarius, Capricorn, Aquarius and Pisces. The Sun enters the southern half of the tropical zodiac at the autumnal equinox and returns north at the vernal equinox.',10,'reviewed'
FROM terms WHERE slug='southern-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Independent of other sign classes',
  'Southern does not mean feminine, nocturnal, cold, short-rising or any other separate category. Those classifications have their own rules and must be read independently.',20,'reviewed'
FROM terms WHERE slug='southern-signs';

-- HUMAN / QUADRUPED SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A human sign is a historical sign classification based on the represented form of the zodiacal image. It belongs to the family of morphological sign classifications used by traditional authors alongside animal, quadruped and other image-based categories.',
  'reviewed','Membership and terminology can vary by author; source accounts remain authoritative for specific lists.'
FROM terms WHERE slug='human-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'basis','Basis of the classification',
  'The category derives from whether the sign''s conventional image is wholly or substantially human. Historical texts sometimes connect human form with rationality, speech or human affairs, but those additional meanings should remain source-attributed.',10,'reviewed'
FROM terms WHERE slug='human-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variants','Source variation',
  'The boundary between human, partly human and animal signs is not perfectly uniform across the tradition, especially for composite figures. The encyclopedia therefore records individual source memberships rather than forcing every author into one list.',20,'reviewed'
FROM terms WHERE slug='human-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A quadruped sign is a historical morphological class for zodiacal signs represented by four-footed animals or substantially quadrupedal figures. It is distinct from elemental, modal and polarity classifications.',
  'reviewed','Membership can be source-sensitive for composite figures.'
FROM terms WHERE slug='quadruped-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'basis','Image-based classification',
  'Quadruped classification comes from the traditional image assigned to the sign. It belongs to a wider family of form-based categories that also includes human and other animal signs.',10,'reviewed'
FROM terms WHERE slug='quadruped-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not a temperament category',
  'Calling a sign quadruped does not by itself establish its element, modality, fertility, voice or temperament. Those are separate classification systems that may overlap in a particular sign.',20,'reviewed'
FROM terms WHERE slug='quadruped-sign';

-- FECUND / BARREN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A fecund sign is a historical fertility classification applied to signs treated by particular authors as comparatively fruitful or generative. The category belongs to traditional sign taxonomy rather than to modern biological prediction.',
  'reviewed','Keep historical and descriptive; do not convert into fertility prediction guidance.'
FROM terms WHERE slug='fecund-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Historical scope',
  'Fecundity is one of several qualitative sign classes found in premodern texts. Membership and strength of the designation can vary by author, so source accounts should be consulted for the exact list and context.',10,'reviewed'
FROM terms WHERE slug='fecund-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Classification, not a standalone judgment',
  'The label describes a traditional quality attributed to a sign. It is not, by itself, a complete judgment about children, conception or health, and the encyclopedia does not treat it as a predictive medical rule.',20,'reviewed'
FROM terms WHERE slug='fecund-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A barren sign is a historical fertility classification applied to signs treated by particular authors as comparatively unfruitful. It is a traditional taxonomic label rather than a standalone statement about a person''s fertility.',
  'reviewed','Keep historical and descriptive; do not convert into fertility prediction guidance.'
FROM terms WHERE slug='barren-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Historical scope',
  'Barren-sign lists are part of the older qualitative taxonomy of the zodiac. Authors can differ in membership or emphasis, so the exact classification should remain attached to its source witness.',10,'reviewed'
FROM terms WHERE slug='barren-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not a medical diagnosis',
  'The category should not be read as a medical or biological diagnosis. In the lexicon it is documented as historical terminology and compared across sources where evidence permits.',20,'reviewed'
FROM terms WHERE slug='barren-sign';

-- COMMANDING / OBEDIENT
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A commanding sign belongs to one side of a historical paired-sign relation usually contrasted with obedient signs. The relation is connected with ascensional or day-length geometry, but the exact terminology and pairings are not perfectly uniform across authorities.',
  'reviewed','Direct historical corroboration exists; retain source variation explicitly.'
FROM terms WHERE slug='commanding-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Geometric basis',
  'Commanding and obedient terminology belongs to the family of sign relations built from unequal rising times or corresponding day-length conditions rather than from ordinary zodiacal aspect alone.',10,'reviewed'
FROM terms WHERE slug='commanding-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variants','Why sources differ',
  'Medieval and earlier authors do not always attach commanding/obeying language to exactly the same geometric relation. The lexicon therefore keeps the canonical term while preserving each author''s pairing and explanation in the source accounts.',20,'reviewed'
FROM terms WHERE slug='commanding-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Obedient signs are the receiving side of a historical commanding/obeying relation between signs. The concept belongs to ascensional and day-length sign geometry and should not be confused with ordinary aspect, reception or planetary obedience.',
  'reviewed','Source variation is significant and remains visible in historical accounts.'
FROM terms WHERE slug='obedient-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Relation to ascensional classes',
  'In one important medieval stream, crooked- or short-rising signs are said to obey corresponding straight- or long-rising signs. Other authors use closely related obedience language for signs paired by equal daytime power.',10,'reviewed'
FROM terms WHERE slug='obedient-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Do not collapse the traditions',
  'Because the word obedient can describe more than one closely related sign-pairing scheme, the encyclopedia preserves the relation as a term while leaving the exact geometry and membership attributable to each source.',20,'reviewed'
FROM terms WHERE slug='obedient-signs';
