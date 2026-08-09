-- Encyclopedia-quality pass: core essential-dignity vocabulary.
--
-- These entries explain the canonical terms for readers without flattening historical
-- table variants. They do not introduce a new scoring system or private workflow.

-- DOMICILE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Domicile is the strongest and most complete form of zodiacal rulership in the standard essential-dignity scheme. A planet in its own domicile occupies a sign over which it has primary governance, so the condition describes authority, belonging and qualitative fitness rather than mere visibility or accidental power.',
       'reviewed','Reader-facing expansion of an established canonical dignity.'
FROM terms WHERE slug='domicile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rulership','Rulership of a sign',
       'Each of the seven traditional planets rules one or two zodiacal signs in the classical domicile scheme. Domicile is therefore a relationship between a planet and a sign: the planet is at home in a place assigned to its governance. The term should not be reduced to the modern idea that a planet is simply “comfortable.”',10,'reviewed',NULL
FROM terms WHERE slug='domicile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-power','Dignity is not the same as power',
       'A planet in domicile is essentially dignified, but it can still be accidentally weak through cadency, combustion, retrogradation or other circumstances. Conversely, a planet outside its dignities can be angular and highly capable of acting. Domicile answers the question of zodiacal authority, not the whole question of effectiveness.',20,'reviewed',NULL
FROM terms WHERE slug='domicile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'opposite','Opposite condition: detriment or exile',
       'The sign opposite a planet’s domicile is traditionally its detriment or exile. The pair expresses opposite relations to rulership: domicile is the planet’s own place, while detriment places it in the sign ruled by the planet on the opposite side of the domicile structure.',30,'reviewed',NULL
FROM terms WHERE slug='domicile';

-- EXALTATION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Exaltation is a major essential dignity in which a planet holds an elevated or honored standing in a particular sign. It differs from domicile: the planet does not own the sign, but receives a distinctive dignity there that traditional authors treat as especially important.',
       'reviewed','Reader-facing expansion; exaltation degrees and tables remain source-sensitive.'
FROM terms WHERE slug='exaltation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-from-domicile','Not another domicile',
       'Domicile and exaltation are both major dignities, but they represent different kinds of standing. Domicile is rulership by ownership of the sign; exaltation is an elevated status granted in a sign that is not necessarily the planet’s own. Keeping the two distinct prevents all essential dignity from being treated as one undifferentiated strength score.',10,'reviewed',NULL
FROM terms WHERE slug='exaltation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'degree','Exaltation sign and exaltation degree',
       'Historical traditions often preserve both a sign of exaltation and a particular exaltation degree. The exact role given to that degree can vary by author and technique, so the encyclopedia records source-specific accounts instead of assuming every tradition uses the degree identically.',20,'reviewed',NULL
FROM terms WHERE slug='exaltation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'opposite','Opposite condition: fall',
       'The sign opposite a planet’s exaltation is its fall. This opposition belongs to the essential-dignity structure and should not be confused with accidental weakness such as cadency or retrogradation.',30,'reviewed',NULL
FROM terms WHERE slug='exaltation';

-- DETRIMENT / EXILE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Detriment, also called exile in some traditional vocabulary, is the essential debility of occupying the sign opposite a planet’s domicile. The term describes a difficult relationship to zodiacal rulership: the planet is operating in a sign structurally opposed to its own domain.',
       'reviewed','Keep translation/source variants visible.'
FROM terms WHERE slug='detriment';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'structure','Defined through the domicile axis',
       'Detriment is not assigned independently. It follows from domicile by opposition: once a planet’s domicile is known, the opposite sign supplies its detriment. This makes the concept part of the rulership geometry of the zodiac rather than a free-standing list of negative signs.',10,'reviewed',NULL
FROM terms WHERE slug='detriment';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-powerless','Debility does not mean powerless',
       'A planet in detriment lacks the qualitative support of its own domicile, but it can still be accidentally powerful, strongly configured, received, or central to a topic through house rulership. Essential debility should therefore be distinguished from inability to act.',20,'reviewed',NULL
FROM terms WHERE slug='detriment';

-- FALL
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Fall is the essential debility opposite exaltation. A planet is in fall when it occupies the sign opposite the sign of its exaltation, placing it at the contrary end of the exaltation axis.',
       'reviewed','Reader-facing expansion of established dignity terminology.'
FROM terms WHERE slug='fall';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'structure','Defined through exaltation',
       'Like detriment, fall is relational. It is derived from another dignity: the sign opposite exaltation becomes the sign of fall. The concept therefore belongs to a paired structure, exaltation versus fall, rather than standing alone as a general synonym for weakness.',10,'reviewed',NULL
FROM terms WHERE slug='fall';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Fall, detriment and peregrine are different',
       'Fall is not the same as detriment, and neither is the same as peregrine condition. Fall is defined by opposition to exaltation; detriment by opposition to domicile; peregrine describes the absence of recognized essential dignity. A planet can therefore be debilitated in a specific way rather than merely “weak.”',20,'reviewed',NULL
FROM terms WHERE slug='fall';

-- PEREGRINE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A peregrine planet is one that possesses none of the recognized essential dignities at the degree it occupies. The condition is defined by absence of dignity, not by being in another planet’s term or face and not simply by lacking domicile or exaltation.',
       'reviewed','Preserves the corrected curriculum distinction: any recognized major or minor essential dignity prevents peregrine status.'
FROM terms WHERE slug='peregrine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition','How peregrine status is recognized',
       'The relevant dignity scheme must be checked at the planet’s degree. If the planet has domicile, exaltation, triplicity, its own bound or term, or its own face or decan under the scheme being used, it is not peregrine. Peregrine therefore does not mean merely “not in domicile.”',10,'reviewed',NULL
FROM terms WHERE slug='peregrine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'other-planets-dignities','Another planet’s dignity does not help',
       'Every zodiacal degree belongs to somebody’s term and face, but peregrine status asks whether the planet itself possesses dignity there. Mercury standing in Saturn’s term, for example, does not gain Mercury an essential dignity merely because the degree has a term ruler.',20,'reviewed',NULL
FROM terms WHERE slug='peregrine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-same-as-debility','Not identical with fall or detriment',
       'A planet can be specifically debilitated by fall or detriment, while peregrine describes lack of essential dignity. Historical authors can weigh these conditions differently, so the encyclopedia preserves the technical distinction rather than collapsing them into one generic weakness label.',30,'reviewed',NULL
FROM terms WHERE slug='peregrine';

-- BOUND / TERM
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A bound or term is an unequal subdivision of a zodiacal sign assigned to one of the five non-luminary planets. A planet occupying its own bound possesses a minor essential dignity at that degree.',
       'reviewed','Historical bound tables vary; do not flatten Egyptian and Ptolemaic-type schemes.'
FROM terms WHERE slug='bound-term';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'unequal','Unequal subdivisions',
       'Bounds are not twelve equal slices or decans. Each sign is divided into several unequal degree ranges, and each range has a planetary ruler. The exact sequence and lengths depend on the historical table being used.',10,'reviewed',NULL
FROM terms WHERE slug='bound-term';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'dignity','A minor essential dignity',
       'When a planet occupies the part of a sign assigned to itself, it has dignity by bound or term. This is sufficient to distinguish it from peregrine condition even though term dignity is more limited than domicile or exaltation.',20,'reviewed',NULL
FROM terms WHERE slug='bound-term';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Historical tables',
       'Several bound systems circulated historically. The encyclopedia therefore treats a statement such as “planet X is in its own term” as dependent on the term table used by the source or practitioner, rather than presenting one table as the only traditional system.',30,'reviewed',NULL
FROM terms WHERE slug='bound-term';

-- FACE / DECAN
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Face or decan is the dignity associated with the three equal ten-degree divisions of each zodiacal sign. In the standard essential-dignity hierarchy, ruling the face occupied by a planet gives a minor but genuine essential dignity.',
       'reviewed','Keep face/decan terminology and possible source distinctions visible.'
FROM terms WHERE slug='face-decan';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'three-parts','Three ten-degree divisions',
       'Every sign contains three decans or faces: 0–10°, 10–20°, and 20–30°. A planetary sequence assigns a ruler to each division. Unlike bounds, the divisions are equal in size.',10,'reviewed',NULL
FROM terms WHERE slug='face-decan';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'minor-dignity','A real but limited dignity',
       'Face is normally the smallest of the standard five essential dignities. Nevertheless, a planet in its own face is not peregrine under a scheme that recognizes face as essential dignity. The small weight of the dignity should not be confused with its absence.',20,'reviewed',NULL
FROM terms WHERE slug='face-decan';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-bound','Face and bound are different subdivisions',
       'Face divides every sign into three equal ten-degree portions, while bounds divide signs into unequal planetary territories. Both can provide minor dignity, but their geometry, rulers and historical tables are distinct.',30,'reviewed',NULL
FROM terms WHERE slug='face-decan';
