-- Encyclopedia-quality pass: benefic/malefic classification and isolation/enclosure conditions.
--
-- These pages distinguish natural planetary classification from actual chart condition,
-- and distinguish several frequently conflated aspect/configuration states.

-- BENEFIC
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Benefic is the traditional classification given primarily to Jupiter and Venus because their natural qualities are considered more conducive to preservation, increase, union and favorable outcomes. The label describes a planet’s natural tendency; it does not guarantee that every result produced by that planet will be beneficial.',
       'reviewed','Classification article. Keep natural nature distinct from accidental condition.'
FROM terms WHERE slug='benefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-benefics','The greater and lesser benefic',
       'Jupiter is traditionally called the greater benefic and Venus the lesser benefic. Their beneficence is grounded in the inherited qualitative model of their natures, not in a modern rule that they simply make whatever they touch “good.”',10,'reviewed',NULL
FROM terms WHERE slug='benefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'condition','A benefic can be badly conditioned',
       'Essential debility, cadency, combustion, retrogradation, contrary sect and difficult configurations can limit or distort a benefic planet’s ability to produce its more constructive significations. Natural classification and actual chart condition therefore have to be judged separately.',20,'reviewed',NULL
FROM terms WHERE slug='benefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sect','Sect modifies beneficence',
       'Jupiter belongs to the diurnal sect and Venus to the nocturnal sect. Traditional sect doctrine therefore provides an additional context for judging how naturally each benefic operates in a day or night figure.',30,'reviewed',NULL
FROM terms WHERE slug='benefic';

-- MALEFIC
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Malefic is the traditional classification given primarily to Saturn and Mars because their natural qualities are associated with separation, deprivation, excess, damage or other difficult effects. Like benefic, malefic names a natural tendency rather than a complete verdict on every chart placement.',
       'reviewed','Classification article; avoid moralizing planets as simply evil.'
FROM terms WHERE slug='malefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-malefics','Saturn and Mars',
       'Saturn and Mars are the two principal malefics of the traditional seven-planet scheme. Their difficult tendencies arise differently: Saturn through coldness, dryness, contraction and deprivation, Mars through heat, dryness, cutting and excess force.',10,'reviewed',NULL
FROM terms WHERE slug='malefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-evil','Malefic does not mean morally evil',
       'A malefic can signify necessary restraint, endurance, courage, decisive action or other constructive effects when well placed and properly directed. The technical classification describes the planet’s natural mode of producing effects; dignity, sect, house, reception and configuration determine how that nature is expressed in a particular chart.',20,'reviewed',NULL
FROM terms WHERE slug='malefic';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sect','Sect moderates the malefics',
       'Saturn belongs to the diurnal sect and Mars to the nocturnal sect. One purpose of sect doctrine is to distinguish circumstances in which a malefic is more moderated from those in which its extreme qualities are less contained.',30,'reviewed',NULL
FROM terms WHERE slug='malefic';

-- VOID OF COURSE
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'motion','Why motion matters',
       'Void of course cannot be determined from a static aspect list alone. The planet’s actual sequence of separation and future application has to be considered. A planet may currently appear isolated yet still be moving toward a qualifying contact before leaving the sign.',30,'reviewed',NULL
FROM terms WHERE slug='void-of-course';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Definitions vary historically',
       'Authors can differ over which aspects, orbs, sign boundaries and planetary contacts qualify for the condition. The lexicon therefore treats “void of course” as a historical technical family with source-specific recognition rules rather than imposing one modern software definition on every text.',40,'reviewed',NULL
FROM terms WHERE slug='void-of-course';

-- FERAL
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-void','Stricter than ordinary void of course',
       'Void of course normally describes the absence of a next qualifying application after separation. Feral condition describes a more thorough lack of planetary contact during the passage through the sign. A planet can therefore be void of course without satisfying the stronger feral condition.',20,'reviewed',NULL
FROM terms WHERE slug='feral';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-rules','Recognition is source-sensitive',
       'Historical descriptions of wild or feral condition depend on the aspect doctrine used by the author. The encyclopedia preserves those recognition rules with their sources rather than defining ferality by a generic modern “no aspects” checkbox.',30,'reviewed',NULL
FROM terms WHERE slug='feral';

-- BESIEGEMENT
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'forms','Bodily and ray-based enclosure',
       'Besiegement can be described through bodily placement between planets or through enclosure between their aspectual rays. Those forms should be distinguished because a planet can be geometrically enclosed without the enclosing planets standing immediately beside it by longitude.',20,'reviewed',NULL
FROM terms WHERE slug='besiegement';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-simple-aspect','More specific than receiving two aspects',
       'A planet is not besieged merely because two other planets aspect it. The enclosing relationships must satisfy the historical recognition rule for containment. This makes besiegement a configuration pattern, not simply an aspect count.',30,'reviewed',NULL
FROM terms WHERE slug='besiegement';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-variants','Source variants matter',
       'Different authors can set different conditions for bodily enclosure, ray enclosure, intervening planets and permissible distances. Those details belong to the source account; the canonical article explains the shared idea without erasing the variants.',40,'reviewed',NULL
FROM terms WHERE slug='besiegement';
