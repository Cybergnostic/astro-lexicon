-- Encyclopedia-quality pass: aspect geometry, solar orientation and speed conditions.
--
-- These are reader-facing expansions of already-reviewed canonical terms. Exact orb
-- tables, mean-speed values and source-specific interpretive claims remain attached to
-- individual historical witnesses rather than flattened here.

-- PLANETARY ORB
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A planetary orb is the angular allowance associated with a planet when judging whether an aspectual contact is active. Traditional orb doctrine belongs to the planets as well as to the aspect geometry, which is why two contacts of the same nominal aspect can have different operative limits.',
       'reviewed','Reader-facing explanation; historical orb tables remain source-specific.'
FROM terms WHERE slug='planetary-orb';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-exactness','An aspect need not be exact to operate',
       'Exact or partile contact is the point of perfection, but application can begin before exactness and separation can remain relevant afterward. Orb supplies the permitted range within which the planets are treated as being in effective contact under the system being used.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-orb';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'planet-based','Why the orb is planetary',
       'Historical systems commonly assign different orb values to different planets. The Sun and Moon, for example, are often granted larger orbs than some other planets. This means that a single universal “square orb” or “trine orb” is not sufficient to describe every traditional system.',20,'reviewed',NULL
FROM terms WHERE slug='planetary-orb';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Tables vary by source',
       'Orb values and the method used to combine two planets’ allowances vary across authors and later practice. The encyclopedia therefore records numerical limits with their sources rather than silently imposing one modern default table on the historical material.',30,'reviewed',NULL
FROM terms WHERE slug='planetary-orb';

-- DEXTER
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A dexter aspect is an aspect cast toward the right-hand side in traditional zodiacal aspect geometry. Dexter and sinister describe the direction from which an aspect is cast; they are not synonyms for applying and separating.',
       'reviewed','Reader-facing geometry article; strength claims remain source-specific.'
FROM terms WHERE slug='dexter-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'direction','A directional property of an aspect',
       'The same pair of signs can be related by the same aspect type while the aspect is described as dexter from one side and sinister from the other. The label therefore belongs to the direction in which one planet casts its ray, not to the aspect type itself.',10,'reviewed',NULL
FROM terms WHERE slug='dexter-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-application','Dexter is not applying',
       'Application and separation depend on planetary motion toward or away from perfection. Dexter and sinister depend on zodiacal direction. A dexter aspect can be applying or separating, just as a sinister aspect can be applying or separating.',20,'reviewed',NULL
FROM terms WHERE slug='dexter-aspect';

-- SINISTER
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A sinister aspect is an aspect cast toward the left-hand side in traditional zodiacal aspect geometry. It is the directional counterpart of a dexter aspect and should be distinguished from motion-based conditions such as application and separation.',
       'reviewed','Reader-facing geometry article; historical evaluations of relative force remain source-specific.'
FROM terms WHERE slug='sinister-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired','Paired with dexter',
       'Dexter and sinister describe opposite directions of aspectual casting. Because the description is directional, one should always ask which planet is casting the aspect and toward which side of the zodiacal order the ray is being considered.',10,'reviewed',NULL
FROM terms WHERE slug='sinister-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-good-bad','Not simply good versus bad',
       'The terms are geometrical labels before they are interpretive judgments. Some historical authors distinguish the relative force of dexter and sinister aspects, but those evaluations should be attached to the relevant source rather than turning the pair into a universal good/bad binary.',20,'reviewed',NULL
FROM terms WHERE slug='sinister-aspect';

-- ORIENTAL
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Oriental is a solar-relative phase term describing a planet as positioned on the eastern side of the Sun in the relevant traditional sense. The technical consequences depend on the planet involved, especially because superior and inferior planets do not pass through identical synodic cycles.',
       'reviewed','Keep superior/inferior and Mercury-specific doctrines separate.'
FROM terms WHERE slug='oriental';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sun-relative','Defined relative to the Sun',
       'Oriental and occidental are not absolute east/west labels on a map or in a house. They describe a planet’s relationship to the Sun within its synodic cycle. The same planet changes from one condition to the other as the cycle develops.',10,'reviewed',NULL
FROM terms WHERE slug='oriental';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'planet-class','Meaning depends on planetary class',
       'For superior planets, orientation is tied to phases around conjunction, visibility, station and opposition. Venus and Mercury have different observational limits because they remain near the Sun. Mercury also uses oriental/occidental status in some sect classifications. The word therefore needs context before an interpretation is assigned.',20,'reviewed',NULL
FROM terms WHERE slug='oriental';

-- OCCIDENTAL
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Occidental is the solar-relative counterpart of oriental, describing a planet as positioned on the western side of the Sun in the relevant traditional sense. Its significance depends on the planet’s synodic phase rather than on a single universal interpretation.',
       'reviewed','Reader-facing phase distinction.'
FROM terms WHERE slug='occidental';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired','Part of a changing synodic cycle',
       'A planet does not remain permanently oriental or occidental. These conditions change as the planet and Sun change their relative longitudes. Orientation is therefore a phase condition, comparable in this respect to stationarity, visibility and solar proximity.',10,'reviewed',NULL
FROM terms WHERE slug='occidental';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'context','Do not interpret the label without context',
       'Historical authors can judge an occidental superior planet differently from an occidental Mercury or Venus. The encyclopedia keeps those source- and planet-specific rules attached to their proper contexts instead of treating “occidental” as one fixed personality keyword.',20,'reviewed',NULL
FROM terms WHERE slug='occidental';

-- SWIFT IN MOTION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A planet is swift in motion when its longitudinal motion is faster than the relevant mean or customary speed used for comparison. It is an accidental condition of motion, distinct from whether the planet is direct or retrograde.',
       'reviewed','Mean-speed tables and thresholds remain source-specific.'
FROM terms WHERE slug='swift-in-motion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'relative','Speed is a comparison',
       'Swift does not mean that one planet is literally moving faster than every other planet. Each planet has its own normal range of longitudinal motion. The judgment compares the planet with its own relevant mean or customary speed.',10,'reviewed',NULL
FROM terms WHERE slug='swift-in-motion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-direct','Swift and direct are different conditions',
       'Direct motion describes direction through the zodiac; swiftness describes rate. A direct planet may be slow, and speed changes around stations and retrograde phases. Traditional accidental-condition analysis therefore keeps direction and speed as separate pieces of information.',20,'reviewed',NULL
FROM terms WHERE slug='swift-in-motion';

-- SLOW IN MOTION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'A planet is slow in motion when its longitudinal motion is below the relevant mean or customary speed used for that planet. Slow motion is an accidental condition and should not be confused automatically with retrogradation or stationarity.',
       'reviewed','Mean-speed tables and computational conventions remain source-specific.'
FROM terms WHERE slug='slow-in-motion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'relative','Relative to the planet’s own norm',
       'The Moon and Saturn have radically different ordinary daily motions, so a single degrees-per-day threshold cannot define slowness for every planet. The comparison must be made against the relevant norm for the planet being judged.',10,'reviewed',NULL
FROM terms WHERE slug='slow-in-motion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'cycle','Connection with the synodic cycle',
       'A planet’s speed changes as it moves through its synodic cycle, especially near stations. Slow motion can therefore occur as part of a larger sequence that later leads to stationarity or retrogradation. The terms describe different facts even when they occur close together.',20,'reviewed',NULL
FROM terms WHERE slug='slow-in-motion';
