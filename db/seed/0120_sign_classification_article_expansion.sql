-- Encyclopedia conversion batch: foundational sign classifications.
-- These pages define repeatable historical classes, not modern personality archetypes.

-- HUMAN SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A human sign is a historical zodiacal classification based on the sign’s figure being human or substantially human. The category is iconographic and technical; it should not be confused with a generic claim that everyone born under such a sign has the same personality.',
  'reviewed','Historical sign taxonomy.'
FROM terms WHERE slug='human-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'classification','What the category describes',
  'Traditional authors use the visible or mythic form of the zodiacal image to group signs into human, quadrupedal and other classes. These classifications can then be used in specific technical contexts, but the classification itself is simply a property assigned to the sign image.',10,'reviewed'
FROM terms WHERE slug='human-sign';

-- QUADRUPED SIGN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A quadruped sign is a sign whose traditional image is a four-footed animal or substantially quadrupedal creature. It belongs to the older iconographic taxonomy of zodiacal figures.',
  'reviewed','Historical sign taxonomy.'
FROM terms WHERE slug='quadruped-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Classification by figure',
  'Quadruped is a classification of the sign image, not an element, modality, polarity or fertility class. A sign can therefore be quadrupedal while simultaneously belonging to an entirely separate triplicity, modality and voice class.',10,'reviewed'
FROM terms WHERE slug='quadruped-sign';

-- FERTILITY
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A fecund or fertile sign is a historical classification in which a sign is assigned comparatively greater fertility or generative symbolism. The classification is part of traditional sign taxonomy and should be kept separate from medical claims about an individual person.',
  'reviewed','Taxonomic definition; no individual fertility prediction.'
FROM terms WHERE slug='fecund-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Scope of the classification',
  'Fecundity is one property among many assigned to signs. It does not replace the condition of planets, houses, rulers or other factors, and a lexicon entry should not turn the category into a standalone prediction about reproductive health or outcome.',10,'reviewed'
FROM terms WHERE slug='fecund-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A barren sign is a historical classification in which a sign is assigned comparatively low fertility or generative symbolism. It is the contrasting class to fecund signs in traditional sign taxonomy.',
  'reviewed','Taxonomic definition; no individual fertility prediction.'
FROM terms WHERE slug='barren-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Scope of the classification',
  'Barren is a technical sign category rather than a medical diagnosis. Historical applications may use it alongside many other testimonies, but the category itself does not justify conclusions about an individual person’s fertility.',10,'reviewed'
FROM terms WHERE slug='barren-sign';

-- VOICE CLASSES
WITH defs(slug,intro,body) AS (
  VALUES
    ('powerful-voiced-sign','A powerful-voiced sign belongs to the historical classification of signs according to the voice attributed to their zodiacal figure. It represents the strongest or fullest voice category in the source taxonomy.','Voice classes are based on the represented creature or figure and form a separate dimension from element, modality, gender, fertility or ascensional class.'),
    ('half-voiced-sign','A half-voiced sign belongs to an intermediate historical voice class: its represented creature is treated as capable of sound, but not with the full articulated or powerful voice assigned to the highest class.','The category should be read as a source taxonomy of zodiacal images, not as a modern psychological label.'),
    ('weak-voiced-sign','A weak-voiced sign belongs to a historical class in which the zodiacal figure is assigned comparatively little or weak voice.','Weak-voiced is distinct from both half-voiced and completely voiceless categories in the normalized lexicon.'),
    ('voiceless-sign','A voiceless sign belongs to the historical class of signs whose represented creatures are treated as lacking voice.','The classification concerns the sign image and should not be conflated with Mercury condition, speech ability or a person’s actual voice.')
)
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,defs.intro,'reviewed','Historical voice taxonomy.'
FROM defs JOIN terms t ON t.slug=defs.slug;

WITH defs(slug,body) AS (
  VALUES
    ('powerful-voiced-sign','Voice classes are based on the represented creature or figure and form a separate dimension from element, modality, gender, fertility or ascensional class.'),
    ('half-voiced-sign','The category should be read as a source taxonomy of zodiacal images, not as a modern psychological label.'),
    ('weak-voiced-sign','Weak-voiced is distinct from both half-voiced and completely voiceless categories in the normalized lexicon.'),
    ('voiceless-sign','The classification concerns the sign image and should not be conflated with Mercury condition, speech ability or a person’s actual voice.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'scope','How to read the category',defs.body,10,'reviewed'
FROM defs JOIN terms t ON t.slug=defs.slug;

-- COMMANDING / OBEDIENT
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Commanding signs belong to a historical paired-sign relation tied to ascensional behavior. In al-Bīrūnī’s account, one member of the pair precedes or commands while its counterpart follows or obeys. The relation should be kept distinct from ordinary zodiacal aspect.',
  'reviewed','Historically corroborated ascensional relation.'
FROM terms WHERE slug='commanding-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Relation to ascensional classes',
  'The commanding/obeying language describes a relation between corresponding signs rather than an intrinsic moral quality of one sign. Its geometry belongs to the wider family of long/short ascension and equal-ascension relationships.',10,'reviewed'
FROM terms WHERE slug='commanding-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Obedient signs are the counterpart to commanding signs in a historical ascensional relation. The terminology describes one sign as following or obeying another according to the relevant rising-time correspondence.',
  'reviewed','Historically corroborated ascensional relation.'
FROM terms WHERE slug='obedient-signs';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'source-variation','Source variation',
  'Historical authors do not use every ascensional pairing term in exactly the same way. The encyclopedia therefore keeps commanding/obedient, equal-ascension and related pairings linked but not automatically collapsed into one universal scheme.',10,'reviewed'
FROM terms WHERE slug='obedient-signs';

-- Compact taxonomy table on Zodiac Sign.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'historical-sign-taxonomies','Additional historical sign taxonomies',
  'These classifications are independent layers. A single sign can belong to one member of several different systems simultaneously.',
  '["System","Example classes","What is being classified"]',
  '[["Figure / form","Human · Quadruped","Traditional zodiacal image"],["Voice","Powerful · Half · Weak · Voiceless","Voice attributed to represented figure"],["Fertility","Fecund · Barren","Generative/fertility symbolism"],["Ascensional relation","Commanding · Obedient","Paired rising-time relation"]]',
  50,'reviewed','Reference table; individual source assignments remain on sign/source pages.'
FROM terms WHERE slug='zodiac-sign';
