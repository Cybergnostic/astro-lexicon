-- Encyclopedia conversion batch: specialized historical vocabulary.
-- These entries explain historically important named concepts without turning sensitive
-- medical or longevity doctrines into operational prediction procedures.

-- HYLEG / APHETA
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Hyleg, also called Apheta in Greek-derived terminology, is the principal life-giving significator in several Hellenistic, Arabic and medieval longevity doctrines. Historical authors select it from a restricted group of eligible points and places, but their exact qualification rules are not uniform.',
  'reviewed','Historical doctrine only; no lifespan calculation or predictive procedure is provided.'
FROM terms WHERE slug='hyleg';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'role','Technical role',
  'The Hyleg is not simply a planet with good condition. It is a role assigned within a specific longevity doctrine to a qualifying luminary, Ascendant-related point, lot or other eligible significator depending on the author. The historical purpose is to identify a life-bearing point whose condition can then be considered in further doctrine.',10,'reviewed'
FROM terms WHERE slug='hyleg';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variants','Different historical selection rules',
  'The eligible places, order of preference and treatment of sect differ across authors. For that reason the encyclopedia preserves Hyleg as a canonical term while keeping each author’s selection criteria in separate source accounts rather than synthesizing one universal algorithm.',20,'reviewed'
FROM terms WHERE slug='hyleg';

-- HYLEGICAL PLACE
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Hylegical Place is a zodiacal or mundane region considered eligible for the placement of a potential Hyleg in historical longevity doctrine. The exact set of eligible places differs among authors and traditions.',
  'reviewed','Historical spatial qualification only; not an operational longevity guide.'
FROM terms WHERE slug='hylegical-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'function','Why the place matters',
  'In Hyleg doctrine a candidate significator may need to occupy one of a restricted set of places before it can qualify. The place requirement therefore acts as a gate in the historical selection process rather than as an independent prediction.',10,'reviewed'
FROM terms WHERE slug='hylegical-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variation','Source variation',
  'Different authorities define the eligible regions differently and can disagree about borderline cases. A source-specific list should therefore be read as that author’s doctrine, not as a universal astronomical property of the chart.',20,'reviewed'
FROM terms WHERE slug='hylegical-place';

-- ALCOCHODEN
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Alcochoden, also spelled Alcocoden, is the planet assigned a secondary role in medieval longevity doctrine after the Hyleg has been established. It is selected through a relationship of essential dignity and testimony to the Hyleg in source-specific procedures.',
  'reviewed','Historical identity only; numerical lifespan procedures are intentionally excluded.'
FROM terms WHERE slug='alcochoden';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation','Relation to the Hyleg',
  'The Alcochoden is conceptually dependent on the Hyleg: it is not chosen in isolation. Historical authors look for a planet with an appropriate dignity or relation to the Hyleg and then evaluate its condition within the specific doctrine they follow.',10,'reviewed'
FROM terms WHERE slug='alcochoden';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'limits','Why the encyclopedia stops at definition',
  'Premodern texts attach numerical year schemes and additional modifying rules to the Alcochoden. Those procedures belong to historical longevity practice and are not reproduced here as an operational prediction method; the entry documents the term, role and textual variation.',20,'reviewed'
FROM terms WHERE slug='alcochoden';

-- ANARETA
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Anareta is a historical technical label for a destructive or life-opposing significator in some longevity and direction doctrines. Its precise identification depends on the author and should not be reduced to a single planet or fixed natal placement.',
  'reviewed','Descriptive historical terminology only; no death-prediction method.'
FROM terms WHERE slug='anareta';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'role','Role in historical doctrine',
  'The term describes an adversarial role within a particular system of life significators and directions. A planet is not permanently an anareta by nature; the role arises from the specific doctrinal relationship being considered.',10,'reviewed'
FROM terms WHERE slug='anareta';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variation','Source-specific recognition',
  'Authors differ in what qualifies a destructive significator and in how the term interacts with Hylegical or directional doctrine. The encyclopedia therefore records those differences historically rather than offering a unified predictive rule.',20,'reviewed'
FROM terms WHERE slug='anareta';

-- DECUMBITURE
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Decumbiture is a branch of traditional medical astrology in which a chart is erected for the beginning of an illness, the time a person takes to bed, or another source-defined onset moment. Historical authors use such charts to organize medical judgment.',
  'reviewed','Historical medical-astrology term; not medical advice or diagnosis.'
FROM terms WHERE slug='decumbiture';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'moment','The problem of the starting moment',
  'The word is often associated with lying down because illness charts could be erected for the time the patient took to bed, but historical practice also uses other onset moments. The correct root time is therefore source-dependent rather than inherent in the English word alone.',10,'reviewed'
FROM terms WHERE slug='decumbiture';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Historical medical context',
  'Decumbiture belongs to premodern medical astrology and should be studied as historical doctrine. Modern health questions require medical assessment rather than astrological diagnosis, and the encyclopedia does not turn these texts into contemporary clinical instructions.',20,'reviewed'
FROM terms WHERE slug='decumbiture';

-- ALMUGEA
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Almugea is a traditional planetary relation in which two planets occupy signs or positions that reproduce the same zodiacal relationship as their own domiciles. It is therefore a form of analogical familiarity based on planetary houses and aspect geometry.',
  'reviewed','Historical relation; preserve source-specific spelling and strength claims.'
FROM terms WHERE slug='almugea';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'principle','Analogy to planetary domiciles',
  'The relation is recognized by comparing the zodiacal relation between two planets with the relation between signs they rule. When those patterns correspond, the planets are said to stand in almugea or a related familiar configuration.',10,'reviewed'
FROM terms WHERE slug='almugea';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not ordinary reception',
  'Almugea is not the same thing as reception. Reception depends on one planet occupying a dignity of another; almugea depends on an analogy between the planets’ current relation and the relation of their domiciles.',20,'reviewed'
FROM terms WHERE slug='almugea';

-- DORYPHORY
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Doryphory, literally spear-bearing or attendance, is a traditional configuration in which planets act as attendants or guards around a luminary or another eminent significator. Historical authors use several recognition schemes, especially in doctrines of rank and eminence.',
  'reviewed','Canonical concept; exact attendance criteria remain source-specific.'
FROM terms WHERE slug='doryphory';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'image','Spear-bearing and attendance',
  'The metaphor is courtly or military: planets positioned appropriately around a principal luminary act like attendants accompanying a ruler. The term therefore describes a relational pattern rather than the intrinsic nature of any one planet.',10,'reviewed'
FROM terms WHERE slug='doryphory';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variants','Different attendance rules',
  'Sources differ over which planets may attend, whether oriental or occidental position matters, how close the attendants must be, and what dignity or phase conditions are required. These variants should remain attributed rather than collapsed into one checklist.',20,'reviewed'
FROM terms WHERE slug='doryphory';

-- SAROS CYCLE
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Saros Cycle is an astronomical eclipse recurrence cycle of about eighteen years, after which the geometry of the Sun, Moon and lunar nodes returns closely enough for a similar eclipse to occur. Successive eclipses in a Saros series occur at different terrestrial longitudes and latitudes.',
  'reviewed','Astronomical recurrence concept; not an interpretive eclipse doctrine.'
FROM terms WHERE slug='saros-cycle';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'astronomy','Why eclipses recur',
  'The cycle arises from the near-commensurability of the synodic month, draconic month and anomalistic month. After one Saros these lunar cycles return to a similar relationship, reproducing broadly similar eclipse geometry.',10,'reviewed'
FROM terms WHERE slug='saros-cycle';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'series','Saros series',
  'A Saros is not a single repeating eclipse over the same place. Each recurrence belongs to a longer series whose path shifts across the Earth. The astronomical cycle should therefore be distinguished from astrological claims attached to individual eclipses or eclipse families.',20,'reviewed'
FROM terms WHERE slug='saros-cycle';
