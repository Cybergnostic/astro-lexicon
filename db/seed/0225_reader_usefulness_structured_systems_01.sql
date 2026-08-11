-- Reader usefulness Batch C, pass 01: expose high-value structured systems.
--
-- The structure classifier intentionally over-flags entries with dense evidence. This pass
-- only adds tables where order, membership, comparison, or repeated subdivision is central
-- to recognizing the doctrine. Shared visual/reference components remain the preferred
-- structure for dignity and planetary-hour families already rendered elsewhere.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ANNUAL REVOLUTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An annual revolution is a solar-return figure defined by the Sun returning to a specified zodiacal starting degree and minute. Bonatti applies the same circular structure to different subjects: a world-year, a nativity, or another inception. The kind of annual revolution is therefore determined by which original solar position supplies the starting point.',
  'reviewed','Reader usefulness Batch C: distinguish annual-revolution applications by starting figure.'
FROM terms WHERE slug='annual-revolution';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='annual-revolution') AND table_key='annual-revolution-types';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'annual-revolution-types','What can be revolved annually',
  'The common structure is a return of the Sun to the relevant original zodiacal degree and minute; the subject changes with the starting figure.',
  '["Kind","Starting point","Subject"]',
  '[["World-year revolution","The Sun’s ingress into the first minute of Aries","Mundane condition of the coming year"],["Nativity revolution","The Sun’s natal zodiacal degree and minute","The native’s annual return figure"],["Revolution of another inception","The Sun’s position in the original inception","Annual return of that beginning or undertaking"]]',
  10,'reviewed','Reader-facing comparison from Bonatti Treatise 8.1 Preface.'
FROM terms WHERE slug='annual-revolution';

-- -----------------------------------------------------------------------------
-- DIRECTION / PERIOD BY TERM LORDS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti’s direction by term lords moves successively through the planetary bounds beginning from the Ascendant. Each bound lord governs a period whose length corresponds to the number of degrees in that bound, after which rulership passes to the lord of the next bound in zodiacal order.',
  'reviewed','Reader usefulness Batch C: expose the sequential procedure without hard-coding a bound table.'
FROM terms WHERE slug='term-direction';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='term-direction') AND table_key='term-direction-process';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'term-direction-process','How the sequence advances',
  'The exact bound rulers depend on the bound scheme in use; the procedure itself remains sequential.',
  '["Step","Operation"]',
  '[["1","Begin from the Ascendant’s position in its current planetary bound."],["2","Take the ruler of that bound as ruler of the first period."],["3","Assign a period corresponding to the number of degrees in that bound."],["4","Advance to the next bound in zodiacal order and transfer rulership to its lord."],["5","Continue bound by bound through the zodiac."]]',
  10,'reviewed','Reader-facing procedure from Bonatti Second Tractate, Part II, Ch. XVI.'
FROM terms WHERE slug='term-direction';

-- -----------------------------------------------------------------------------
-- JARBAKHTAR / DIVISOR
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Jarbakhtar, or divisor, is Bonatti’s name for the directing framework in which the Ascendant is carried successively through planetary bounds and each bound lord disposes the corresponding period. The term names the directing role or process, while the successive bound rulers provide the changing period lords.',
  'reviewed','Reader usefulness Batch C: separate directed point, subdivision, and period ruler.'
FROM terms WHERE slug='jarbakhtar';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='jarbakhtar') AND table_key='jarbakhtar-roles';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'jarbakhtar-roles','Parts of the jarbakhtar procedure',
  'These roles should not be collapsed into one object: the Ascendant is directed, the bounds divide the route, and their lords govern successive periods.',
  '["Part","Role"]',
  '[["Directed point","The Ascendant is carried through the zodiac."],["Subdivision","Planetary bounds divide the course into successive portions."],["Period ruler","The lord of the occupied bound disposes that period according to its condition."],["Continuation","The process passes from bound to bound for as long as the doctrine is applied."]]',
  10,'reviewed','Reader-facing structure from Bonatti Treatise 9, Part 2, Ch. 6.'
FROM terms WHERE slug='jarbakhtar';

-- -----------------------------------------------------------------------------
-- LORD OF PROFECTION / SALKHUDAY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lord of Profection, called the salkhuday in Bonatti, is the ruler of the sign reached by the annual profection. It functions as a profected Lord of the Year and participates with the annual revolution, while planets occupying or aspecting the profected place may assist without thereby becoming the salkhuday.',
  'reviewed','Reader usefulness Batch C: expose the distinction between the profected ruler and assisting planets.'
FROM terms WHERE slug='salkhuday';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='salkhuday') AND table_key='salkhuday-roles';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'salkhuday-roles','What makes the salkhuday distinct',
  'The annual profection supplies the office; other planets can participate without receiving the title.',
  '["Factor","Function"]',
  '[["Profected sign","The sign reached by the annual profection."],["Ruler of the profected sign","The salkhuday or profected Lord of the Year."],["Annual-revolution ruler","A separate annual ruler with which the salkhuday participates."],["Planets in or aspecting the profected place","Additional helpers or modifiers; not automatically the salkhuday."]]',
  10,'reviewed','Reader-facing distinction from Bonatti Treatise 9, Part 3, Chs. 7–8.'
FROM terms WHERE slug='salkhuday';

-- -----------------------------------------------------------------------------
-- LORD OF THE DAY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lord of the Day is the planet that rules the first planetary hour after sunrise and therefore gives its name and rulership to that weekday. The familiar weekday order is a consequence of the continuously repeating planetary-hour sequence rather than an independent list.',
  'reviewed','Reader usefulness Batch C: expose the weekday sequence directly.'
FROM terms WHERE slug='day-lord';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='day-lord') AND table_key='weekday-lords';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'weekday-lords','Weekday rulers',
  'The ruler of the first planetary hour after sunrise is the Lord of that day.',
  '["Day","Lord"]',
  '[["Sunday","Sun"],["Monday","Moon"],["Tuesday","Mars"],["Wednesday","Mercury"],["Thursday","Jupiter"],["Friday","Venus"],["Saturday","Saturn"]]',
  10,'reviewed','Reader-facing sequence from Abū Maʿshar Part VI, Ch. 33.'
FROM terms WHERE slug='day-lord';

-- -----------------------------------------------------------------------------
-- LORD OF THE REVOLUTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti distinguishes the ruler of an individual revolution from the Lord of the whole Year. At the Aries ingress, the modality of the Ascendant determines whether one figure governs the year or whether the revolution is renewed at later cardinal ingresses, creating half-year or quarterly rulers.',
  'reviewed','Reader usefulness Batch C: expose Bonatti’s fixed/common/movable renewal structure.'
FROM terms WHERE slug='lord-of-revolution';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-revolution') AND table_key='revolution-span';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'revolution-span','How long a revolution ruler governs in Bonatti',
  'The modality of the Aries-ingress Ascendant determines whether later ingress figures renew the revolution.',
  '["Aries-ingress Ascendant","Renewal pattern","Effective span of each revolution"]',
  '[["Fixed sign","No additional seasonal renewal","Whole year"],["Common / bicorporeal sign","Renew at the Libra ingress","Half-year"],["Movable / tropical sign","Renew at Cancer, Libra and Capricorn ingresses","Quarter-year"]]',
  10,'reviewed','Reader-facing structure from Bonatti Treatise 8.1, Ch. 24.'
FROM terms WHERE slug='lord-of-revolution';

-- -----------------------------------------------------------------------------
-- LORD OF THE YEAR
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-year') AND table_key='lord-year-methods';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'lord-year-methods','Different ways a Lord of the Year is selected',
  'The title names an annual office; the selection procedure depends on the technique and author.',
  '["Context","Selection principle"]',
  '[["al-Bīrūnī — world-year","Prefer a qualified planet on the Ascendant or an angle with dignity; then consider succedent and further eligible candidates."],["Bonatti — mundane revolution","Test the Ascendant domicile lord first, then proceed through exaltation, luminary of the time, bound, triplicity and further fallback testimonies while rejecting seriously impeded candidates."],["Lilly — annual profection","The ruler of the sign reached by the profected Ascendant is Lord of the Year; the year can be divided between two rulers when the profection spans two signs."]]',
  30,'reviewed','Reader-facing source comparison from reviewed interpretations.'
FROM terms WHERE slug='lord-of-year';

-- -----------------------------------------------------------------------------
-- DARĪǦĀN / INDIAN DECAN
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='darijan') AND table_key='darijan-parts';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'darijan-parts','The three darīǧāns of a sign',
  'Each portion is ten degrees; what distinguishes the Indian system is the ruler-selection rule.',
  '["Part of sign","Degree span","Ruler"]',
  '[["First","0°–10°","Ruler of the sign itself"],["Second","10°–20°","Ruler of the fifth sign from it"],["Third","20°–30°","Ruler of the ninth sign from it"]]',
  25,'reviewed','Reader-facing structure from Abū Maʿshar and al-Bīrūnī.'
FROM terms WHERE slug='darijan';
UPDATE term_article_sections
SET body='Darīǧān should not be treated as merely another spelling of face or decan. The two systems divide a sign into the same number of equal parts, but they assign planetary rulers differently. Darīǧān is therefore a variant decan system rather than the same ruler scheme under another name.'
WHERE term_id=(SELECT id FROM terms WHERE slug='darijan') AND section_key='variant-decan-system';

-- -----------------------------------------------------------------------------
-- DEGREE SIGN-NATURE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Degree Sign-Nature is a Hermetic degree-level scheme transmitted by Abū Maʿshar. The individual degrees of each sign receive the natures of the twelve signs in zodiacal order: the first degree takes the nature of the sign itself, the second the next sign, and so on through the twelfth, after which the sequence repeats from the thirteenth degree.',
  'reviewed','Reader usefulness Batch C: expose the repeating twelve-degree sequence.'
FROM terms WHERE slug='degree-sign-nature';
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='degree-sign-nature') AND table_key='degree-sign-cycle';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'degree-sign-cycle','The repeating twelve-degree cycle',
  '“Starting sign” means the sign whose thirty degrees are being subdivided. Degree 13 repeats the correspondence of degree 1, degree 14 that of degree 2, and so on.',
  '["Degree in the cycle","Assigned sign-nature relative to the starting sign"]',
  '[["1","Starting sign"],["2","Next sign"],["3","2 signs after starting sign"],["4","3 signs after starting sign"],["5","4 signs after starting sign"],["6","5 signs after starting sign"],["7","6 signs after starting sign"],["8","7 signs after starting sign"],["9","8 signs after starting sign"],["10","9 signs after starting sign"],["11","10 signs after starting sign"],["12","11 signs after starting sign"]]',
  10,'reviewed','Reader-facing structure from Abū Maʿshar Part V, Ch. 18.'
FROM terms WHERE slug='degree-sign-nature';

-- -----------------------------------------------------------------------------
-- DODECATEMORION / TWELFTH-PART
-- -----------------------------------------------------------------------------
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='dodecatemorion') AND table_key='twelfth-parts';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'twelfth-parts','The twelve equal twelfth-parts',
  'The correspondence advances one zodiacal sign for each 2°30′ portion. The first portion corresponds to the sign being subdivided.',
  '["Twelfth","Degree span within sign","Relative sign correspondence"]',
  '[["1","0°00′–2°30′","Starting sign"],["2","2°30′–5°00′","Next sign"],["3","5°00′–7°30′","2 signs after starting sign"],["4","7°30′–10°00′","3 signs after starting sign"],["5","10°00′–12°30′","4 signs after starting sign"],["6","12°30′–15°00′","5 signs after starting sign"],["7","15°00′–17°30′","6 signs after starting sign"],["8","17°30′–20°00′","7 signs after starting sign"],["9","20°00′–22°30′","8 signs after starting sign"],["10","22°30′–25°00′","9 signs after starting sign"],["11","25°00′–27°30′","10 signs after starting sign"],["12","27°30′–30°00′","11 signs after starting sign"]]',
  25,'reviewed','Reader-facing generic twelfth-part structure from reviewed sources.'
FROM terms WHERE slug='dodecatemorion';
UPDATE term_article_sections
SET body='Dodecatemorion, Twelfth-part and Twelfths are historical names for the same twelvefold construction in the sources reviewed here. Keeping the names together prevents one technique from being mistaken for several different subdivisions.'
WHERE term_id=(SELECT id FROM terms WHERE slug='dodecatemorion') AND section_key='historical-names';

-- -----------------------------------------------------------------------------
-- PAGE COMPOSITION FOR NEW TABLES
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE section_key='reader-structure-c'
  AND term_id IN (SELECT id FROM terms WHERE slug IN (
    'annual-revolution','term-direction','jarbakhtar','salkhuday','day-lord',
    'lord-of-revolution','lord-of-year','darijan','degree-sign-nature','dodecatemorion'
  ));

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'reader-structure-c','Reference structure',85,'reviewed','Reader usefulness Batch C.'
FROM terms WHERE slug IN (
  'annual-revolution','term-direction','jarbakhtar','salkhuday','day-lord',
  'lord-of-revolution','lord-of-year','darijan','degree-sign-nature','dodecatemorion'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,tb.sort_order,'reviewed','Reader usefulness Batch C.'
FROM term_page_sections ps
JOIN terms t ON t.id=ps.term_id
JOIN term_article_tables tb ON tb.term_id=t.id
WHERE ps.section_key='reader-structure-c'
  AND tb.table_key IN (
    'annual-revolution-types','term-direction-process','jarbakhtar-roles','salkhuday-roles',
    'weekday-lords','revolution-span','lord-year-methods','darijan-parts',
    'degree-sign-cycle','twelfth-parts'
  )
  AND tb.status IN ('reviewed','published');
