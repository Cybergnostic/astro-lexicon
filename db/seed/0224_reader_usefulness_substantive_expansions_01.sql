-- Reader usefulness Batch B, pass 01: evidence-rich substantive expansions.
--
-- This pass expands entries whose reviewed interpretation/relations layer already contains
-- substantially more doctrine than the public article exposes. It deliberately leaves
-- heuristic-only flags for later human review rather than lengthening every page uniformly.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- CRITICAL DAYS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Critical days are crisis checkpoints in medical astrology measured from the Moon’s place at the beginning of an illness. The doctrine is lunar rather than merely calendrical: the important event is the Moon reaching significant angular distances from its earlier position, where changes in the patient’s condition are judged.',
  'reviewed','Reader usefulness Batch B: expose the reviewed Abū Maʿshar, Bonatti and Lilly doctrine.'
FROM terms WHERE slug='critical-days';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='critical-days');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='critical-days');

INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lunar-measure','The Moon supplies the measure',
  'Abū Maʿshar describes the critical or “known” days through the Moon’s motion and its sextile, quartile and opposition relationships to its earlier place. Bonatti likewise measures the principal checkpoints from the Moon’s place at the question or onset. The calendar-day labels summarize an underlying lunar geometry rather than replacing it.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='critical-days';

INSERT OR REPLACE INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'principal-crises','Principal crisis checkpoints in Bonatti',
  'Bonatti associates the familiar seventh-day sequence with approximate quarter-turns of the Moon from its initial place.',
  '["Checkpoint","Approximate lunar distance from the initial place"]',
  '[["7th day","90°"],["14th day","180°"],["21st day","270°"],["28th day","360° / return to the initial place"]]',
  20,'reviewed','Reader-facing summary of the reviewed Bonatti account.'
FROM terms WHERE slug='critical-days';

INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-correction','Why the nominal day is not always exact',
  'Lilly warns that the Moon does not move at a constant daily speed. The seventh, fourteenth, twenty-first and similar labels therefore should not be treated as automatically exact calendar days. His preferred method follows the Moon’s actual motion from the illness beginning and allows intermediate configurations to mark lesser or indicative changes before a principal crisis.',30,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='critical-days';

-- -----------------------------------------------------------------------------
-- NATIVITY
-- -----------------------------------------------------------------------------
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'complete-beginning','Birth as the complete beginning',
  'Bonatti distinguishes conception from nativity as two beginnings. Conception is an earlier, incomplete beginning; birth is the second and complete beginning from which the native’s postnatal accidents are judged as a whole. This is why the nativity functions as the principal root figure even when prenatal beginnings are also considered.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='nativity'
  AND NOT EXISTS (SELECT 1 FROM term_article_sections s WHERE s.term_id=terms.id AND s.section_key='complete-beginning');

-- -----------------------------------------------------------------------------
-- SIGNIFICATOR OF THE KING
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'In Bonatti’s mundane revolution doctrine, the significator of the king is the planet selected to represent the ruler or highest governing authority. It is not automatically the Sun or the tenth-house ruler: Bonatti uses a hierarchy of tenth-house rulership, exaltation, solar testimony, dignity and fitness to choose the planet that can actually carry the role.',
  'reviewed','Reader usefulness Batch B: explain Bonatti’s selection hierarchy before the worked judgment.'
FROM terms WHERE slug='significator-of-king';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='significator-of-king');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'selection','How the significator is selected',
  'Bonatti begins from the tenth house. He first considers its domicile lord if that planet is fit to signify the ruler, then the exaltation lord, the Sun, the planet holding the greatest dignity in the tenth, and further fallback testimonies when the earlier candidates are unsuitable. The procedure is therefore hierarchical: formal rulership matters, but the planet’s actual condition determines whether it can serve as significator.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='significator-of-king';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'judgment','Selection is only the first step',
  'After the planet is chosen, its condition is judged together with the rest of the revolution. Bonatti’s worked ingress combines the king’s significator with the significator of the common people, house rulers, projected rays, reception, cutting of light and other planetary conditions. The title “significator of the king” names a role inside the judgment, not an isolated prediction rule.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='significator-of-king';

-- -----------------------------------------------------------------------------
-- PLANETARY SHARE IN A SIGN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary share in a sign is Abū Maʿshar’s broad way of describing the many relations through which a planet participates in, agrees with, opposes, strengthens or is weakened within zodiacal territory. It is wider than the later shorthand “essential dignity”: his discussion includes the major dignities, lesser subdivisions and several favourable, adverse or special degree conditions.',
  'reviewed','Reader usefulness Batch B: expose the breadth of Abū Maʿshar’s share framework and Bonatti’s natural/accidental distinction.'
FROM terms WHERE slug='planetary-share';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-share');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-share');
INSERT OR REPLACE INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'share-members','What can count as a planetary share',
  'Abū Maʿshar’s catalogue is deliberately broader than the five familiar essential dignities.',
  '["Included relation or condition","Role in the framework"]',
  '[["House / domicile","Major sign rulership"],["Exaltation","Major sign dignity"],["Triplicity","Elemental or triplicity participation"],["Terms / bounds","Unequal degree subdivision"],["Decans / faces","Ten-degree subdivision"],["Joy","Additional favourable participation"],["Fall","Adverse sign relation"],["Detriment","Adverse sign relation"],["Special good or bad degrees","Degree-level favourable or adverse conditions"]]',
  10,'reviewed','Reader-facing enumeration from the reviewed Abū Maʿshar account.'
FROM terms WHERE slug='planetary-share';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'natural-accidental','Do not collapse natural and accidental power',
  'Bonatti later makes a useful distinction between powers that belong to a planet by nature and powers acquired by circumstance. House, exaltation, triplicity, term and face are natural powers in his classification, while joy, strong places, reception and related fortitudes are accidental. The broader idea of planetary participation therefore should not erase the distinction between essential or natural standing and accidental condition.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='planetary-share';

-- -----------------------------------------------------------------------------
-- HERMES’ MARRIAGE LOTS
-- -----------------------------------------------------------------------------
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='hermes-lot-of-marriage');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='hermes-lot-of-marriage');
INSERT OR REPLACE INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'member-lots','The four Hermetic marriage-lot entries',
  'This umbrella exists because Abū Maʿshar transmits several distinct lots attributed to Hermes. Their formulas belong on the individual entries.',
  '["Entry","Function"]',
  '[["Hermes’ Lot of Marriage of Men","Marriage lot specifically transmitted for men"],["Hermes’ Lot of Marriage of Women","Marriage lot specifically transmitted for women"],["Hermes’ General Lot of Marriage","General marriage lot"],["Hermes’ Lot of the Time of Marriage","Timing-related marriage lot"]]',
  10,'reviewed','Reader usefulness Batch B: expose umbrella membership without duplicating formulas.'
FROM terms WHERE slug='hermes-lot-of-marriage';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'navigation-rule','Why the formulas stay separate',
  'The similar names do not make these formulas interchangeable. The umbrella page is a map of the Hermetic marriage-lot family; calculation rules, reversals and source-specific details should be read on the individual lot pages so that distinct historical formulas are not flattened into one generic “marriage lot.”',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='hermes-lot-of-marriage';

-- -----------------------------------------------------------------------------
-- BRIGHT DEGREE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A bright degree is one member of a transmitted catalogue of qualitative zodiacal degrees. In Abū Maʿshar’s fourfold scheme bright degrees carry the strongest favourable indication, alongside dusky, dark and empty classes. The classification is inherited table data rather than a quality derived from a universal geometrical rule.',
  'reviewed','Reader usefulness Batch B: explain the class and its instability across transmitted catalogues.'
FROM terms WHERE slug='bright-degree';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='bright-degree');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'catalogue','A transmitted catalogue, not a universal degree law',
  'Al-Bīrūnī reports bright or luminous, dusky, dark and empty degree classifications but warns that the books do not agree on them. A bright-degree designation should therefore be read as a source-specific catalogue assignment. It tells the reader how a particular tradition classifies that degree; it should not be silently promoted into a single universal degree scheme.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='bright-degree';

-- -----------------------------------------------------------------------------
-- COMBUST / INCOMBUST HOURS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti’s “combust hours” are an electional timing cycle counted from the exact Sun–Moon conjunction. The cycle begins with twelve combust hours, followed by seventy-two incombust hours, and then repeats until the next conjunction. The name is technical and should not be confused with ordinary planetary combustion under the Sun’s beams.',
  'reviewed','Reader usefulness Batch B: expose the post-lunation 12/72-hour cycle.'
FROM terms WHERE slug='combust-hours';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='combust-hours');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='combust-hours');
INSERT OR REPLACE INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'cycle','The repeating post-lunation cycle',
  'The sequence repeats from the conjunction until the next lunation.',
  '["Interval","Length","General character in the transmitted rule"]',
  '[["Combust hours","12 hours","Restricted or adverse interval for beginnings"],["Incombust hours","72 hours","Generally available for beginnings if no other impediment is present"]]',
  10,'reviewed','Reader-facing summary of Bonatti’s repeated 12/72-hour cycle.'
FROM terms WHERE slug='combust-hours';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-combustion','Not ordinary planetary combustion',
  'These are named hours in a post-lunation electional sequence. They do not describe a planet being hidden, weakened or burned by proximity to the Sun. The shared word “combust” is historical terminology for two different doctrines and the two entries should remain distinct.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='combust-hours';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Incombust hours are the seventy-two-hour interval that follows each twelve-hour combust interval in Bonatti’s post-lunation cycle. After the seventy-two hours another twelve combust hours begin, and the alternation continues until the next conjunction.',
  'reviewed','Reader usefulness Batch B: pair explicitly with Combust Hours.'
FROM terms WHERE slug='incombust-hours';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='incombust-hours');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'electional-use','Electional use',
  'Bonatti treats the incombust interval as generally suitable for beginning actions, provided another astrological impediment does not intervene. “Incombust” therefore means that the election is outside the twelve-hour restricted interval of this particular cycle; it is not a blanket promise that every chart begun during those seventy-two hours is favourable.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='incombust-hours';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'cycle','Where it sits in the cycle',
  'The repeating unit is eighty-four hours: twelve combust hours plus seventy-two incombust hours. The incombust interval is consequently defined by its place between one combust interval and the next, counted from the preceding Sun–Moon conjunction.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='incombust-hours';

-- -----------------------------------------------------------------------------
-- DUODENA OF THE MOON / LUNAR HOUR CYCLE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti transmits more than one post-lunation hour doctrine under the language of the Moon’s duodena or related al-bust material. Both begin from a lunation and distribute subsequent time among planetary or triplicity rulers, but the two presentations are not identical and should be kept source-specific.',
  'reviewed','Reader usefulness Batch B: expose both reviewed Bonatti versions rather than synthesizing them.'
FROM terms WHERE slug='moon-duodena-hours';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='moon-duodena-hours');
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='moon-duodena-hours');
INSERT OR REPLACE INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'versions','Two reviewed Bonatti presentations',
  'The common principle is time distributed from the lunation; the internal organization differs.',
  '["Bonatti passage","Basic unit","Rulership pattern"]',
  '[["Treatise 4, Chapter 7","Repeated four-hour segments","Successive rulers of the fiery, earthy, airy and watery triplicities"],["Treatise 9, Part 3, Chapter 6","Successive twelve-hour planetary blocks, each divided into three four-hour parts","Planetary sequence, with each block subdivided among three triplicity rulers"]]',
  10,'reviewed','Reader-facing comparison of the two reviewed presentations.'
FROM terms WHERE slug='moon-duodena-hours';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'judgment','How the segments are used',
  'The operative idea is not merely that hours receive names. The Moon’s condition during a segment is considered in relation to the ruler assigned to that segment. Because Bonatti preserves different constructions in different places, the exact sequence must be taken from the version being used rather than reconstructed as one universal table.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='moon-duodena-hours';

-- -----------------------------------------------------------------------------
-- FIFTH NATURE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The fifth nature or fifth essence is the traditional celestial substance assigned to the spheres and stars in contrast with the four elemental natures of the sublunary world. Abū Maʿshar and Bonatti use the distinction to explain why heavenly bodies are not subject to the same generation, corruption and elemental alteration as terrestrial bodies.',
  'reviewed','Reader usefulness Batch B: teach the celestial/sublunary contrast.'
FROM terms WHERE slug='fifth-nature';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='fifth-nature');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'contrast','Why it is called a fifth nature',
  'Fire, air, water and earth account for the mutable bodies of the sublunary world. The celestial spheres and stars are assigned another kind of substance because they are described as exempt from ordinary elemental generation, corruption, increase, decrease and alteration. “Fifth” therefore marks a categorical contrast with the four elements, not an extra element mixed into terrestrial compounds.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='fifth-nature';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'astrological-role','Why the distinction matters to astrology',
  'In this natural-philosophical framework, incorruptible celestial bodies can act upon a changing sublunary world while remaining distinct in kind from it. The doctrine belongs to the cosmological background through which authors such as Abū Maʿshar and Bonatti explain celestial action; it is not itself a chart technique or dignity condition.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='fifth-nature';

-- -----------------------------------------------------------------------------
-- FOREKNOWLEDGE AND CONTINGENCY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Foreknowledge is the practical benefit traditional authors claim for astrological judgment: knowing a future condition in advance can permit preparation, avoidance, mitigation or orderly response. Its value does not depend on the stronger claim that every indicated event is absolutely necessary and unchangeable.',
  'reviewed','Reader usefulness Batch B: expose the practical doctrine in Abū Maʿshar and Bonatti.'
FROM terms WHERE slug='foreknowledge';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='foreknowledge');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'uses','What advance knowledge is for',
  'Abū Maʿshar lists several practical uses: an event may sometimes be avoided, part of its harm reduced, a temporary difficulty prepared for, affairs arranged before something unavoidable, or future good received without disruptive surprise. Bonatti makes the same general argument across matters such as weather, scarcity and personal affairs. Prediction is therefore presented as useful precisely because a person can respond to what is known.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='foreknowledge';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-necessity','Foreknowledge is not the same as strict necessity',
  'The usefulness argument presupposes a distinction between indication and an absolutely fixed outcome. Some future conditions may be difficult or unavoidable, yet preparation can still change how they are encountered; other contingent matters may allow avoidance or mitigation. The doctrine therefore connects directly with traditional discussions of possibility and contingency.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='foreknowledge';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Possibility or contingency is the middle field between what must occur and what cannot occur. A contingent event can become actual, but it need not do so. Abū Maʿshar and Bonatti place astrological judgment primarily in this field of future possibilities, where deliberation, choice and changing circumstances remain meaningful.',
  'reviewed','Reader usefulness Batch B: clarify the necessary/possible/impossible framework.'
FROM terms WHERE slug='contingency';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='contingency');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'threefold','Necessary, possible and impossible',
  'The conceptual contrast is threefold. The necessary cannot fail to occur; the impossible cannot become actual; the possible or contingent can become actual but is not compelled to do so. Deliberation belongs to the possible because more than one outcome can remain open before the event is realized.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='contingency';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'astrology','Why contingency matters to astrology',
  'Both Abū Maʿshar and Bonatti use contingency to answer a philosophical objection to astrology: prediction need not mean that all future events are necessary. Astrological judgment can concern conditions that are genuinely possible and may later be actualized, while human deliberation and response still operate within that field.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='contingency';

-- -----------------------------------------------------------------------------
-- LUNAR NODES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Head of the Dragon is the ascending lunar node, where the Moon crosses the ecliptic from south to north. Traditional authors also give the node astrological meanings: Abū Maʿshar associates it with ascent and increase, while Bonatti treats its most characteristic operation as amplification of the matters it joins.',
  'reviewed','Reader usefulness Batch B: join the astronomical identity to the reviewed traditional doctrine.'
FROM terms WHERE slug='head-of-dragon';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='head-of-dragon');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'amplification','Increase rather than simple beneficence',
  'Bonatti’s rule is more precise than calling the Head simply fortunate. In a house or conjunction it increases the signification already present: with benefics it increases good, while with malefics it can increase evil. Abū Maʿshar likewise allows the Head to act adversely under some conditions. The node is therefore better recognized through increase or amplification than through an unconditional benefic label.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='head-of-dragon';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry','Ascending node',
  'Astronomically, the Head is an intersection rather than a material planet: it is the point where the Moon’s inclined path crosses the ecliptic northward. That ascending geometry underlies the traditional name “Head of the Dragon” and should be kept distinct from the interpretive meanings later attached to the point.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='head-of-dragon';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Tail of the Dragon is the descending lunar node, where the Moon crosses the ecliptic from north to south. Traditional accounts commonly associate it with descent or diminution, but its practical meaning is not exhausted by the simple label “malefic.”',
  'reviewed','Reader usefulness Batch B: join the astronomical identity to the reviewed traditional doctrine.'
FROM terms WHERE slug='tail-of-dragon';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='tail-of-dragon');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'diminution','Diminution can reduce good or bad',
  'Bonatti treats the Tail primarily as diminishing or removing the signification of the house in which it falls. Because the underlying matter can itself be fortunate or unfortunate, diminution can reduce either good or evil. Abū Maʿshar also allows the Tail under some circumstances to act like a benefic. The operative idea is therefore decrease, not an unconditional rule that the Tail always produces harm.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='tail-of-dragon';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry','Descending node',
  'Astronomically, the Tail is the intersection where the Moon crosses the ecliptic southward. Like the Head, it is a geometrical point rather than a material planet; its traditional astrological meanings are interpretations attached to that nodal position.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='tail-of-dragon';

-- -----------------------------------------------------------------------------
-- PLANETARY MASCULINITY
-- -----------------------------------------------------------------------------
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'conditional-expression','Masculinity can be modified by phase and position',
  'Abū Maʿshar gives Jupiter, Mars, the Sun, Saturn and normally Mercury masculine indication, but he also describes eastern appearance and eastern quadrants as tending toward masculinity and western appearance and western quadrants toward femininity. Planetary gender is therefore a base classification whose expression can be modified by other conditions; it should not be reduced to a single permanent label detached from phase and position.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='planetary-masculinity'
  AND NOT EXISTS (SELECT 1 FROM term_article_sections s WHERE s.term_id=terms.id AND s.section_key='conditional-expression');

-- -----------------------------------------------------------------------------
-- SEVEN TRADITIONAL PLANETS
-- -----------------------------------------------------------------------------
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='seven-planets');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'wandering-lights','Why these seven form one astrological class',
  'Traditional astrology groups the Sun and Moon with Mercury, Venus, Mars, Jupiter and Saturn because all seven are moving celestial significators. Their changing positions distinguish them from the fixed stars and allow them to participate in rulership, sect, planetary days and hours, motion states and many other chart doctrines as one coherent planetary set.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='seven-planets';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'fixed-stars','The seven planets versus the fixed stars',
  'Abū Maʿshar emphasizes the greater speed and variety of the seven planets’ motions and conditions. Direct motion, station, retrogradation, ascent, descent, easternness and westernness change much more rapidly than the background of fixed stars. He therefore gives the seven a broad role in signifying swift-changing general conditions and beginnings of actions.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='seven-planets';

-- -----------------------------------------------------------------------------
-- RETURN OF LIGHT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti uses “Return of Light” in two related but not identical ways. In one, a planet gathers several lights and then projects them onward to another zodiacal place. In another, an intended receiver gives back an earlier applicant’s light after a nearer third planet reaches it first; Bonatti also calls this interrupted-application configuration an abscission of light.',
  'reviewed','Reader usefulness Batch B: expose both direct Bonatti uses instead of forcing one normalized definition.'
FROM terms WHERE slug='return-of-light';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='return-of-light');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'projection','Use 1: gathered light projected onward',
  'A planet can receive or collect the lights of several planets and then cast those gathered lights toward another place that it aspects. In this use, “returner of light” describes the onward transmission of light after collection; the emphasis is on what the collecting planet does with the lights it has received.',10,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='return-of-light';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'interruption','Use 2: an earlier light is given back',
  'Bonatti also describes an intended recipient that has begun to receive one applicant’s light but is reached first by a nearer third planet. The recipient then gives the earlier applicant’s light back. Bonatti explicitly applies both the name Return of Light and the name Abscission of Light to this configuration, so the overlap is historical and should be shown rather than artificially removed.',20,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='return-of-light';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition','How to recognize which sense is meant',
  'If the passage is about one planet gathering several lights and projecting them elsewhere, the first sense is intended. If the passage is about an application being intercepted so that an earlier light is returned, the second sense is intended. The surrounding planetary mechanics therefore determine which Bonatti use of the term is in play.',30,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug='return-of-light';

-- -----------------------------------------------------------------------------
-- PAGE COMPOSITION FOR NEW MATERIAL
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE section_key='reader-usefulness-b'
  AND term_id IN (SELECT id FROM terms WHERE slug IN (
    'critical-days','nativity','significator-of-king','planetary-share','hermes-lot-of-marriage',
    'bright-degree','combust-hours','incombust-hours','moon-duodena-hours','fifth-nature',
    'foreknowledge','contingency','head-of-dragon','tail-of-dragon','planetary-masculinity',
    'seven-planets','return-of-light'
  ));

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'reader-usefulness-b','Understanding the concept',80,'reviewed','Reader usefulness Batch B.'
FROM terms WHERE slug IN (
  'critical-days','nativity','significator-of-king','planetary-share','hermes-lot-of-marriage',
  'bright-degree','combust-hours','incombust-hours','moon-duodena-hours','fifth-nature',
  'foreknowledge','contingency','head-of-dragon','tail-of-dragon','planetary-masculinity',
  'seven-planets','return-of-light'
);

-- Add Batch-B article sections to the new reader-facing section.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Reader usefulness Batch B.'
FROM term_page_sections ps
JOIN terms t ON t.id=ps.term_id
JOIN term_article_sections s ON s.term_id=t.id
WHERE ps.section_key='reader-usefulness-b'
  AND s.status IN ('reviewed','published')
  AND s.editorial_notes='Reader usefulness Batch B.';

-- Add Batch-B tables to the same section before later explanatory sections where applicable.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,tb.sort_order,'reviewed','Reader usefulness Batch B.'
FROM term_page_sections ps
JOIN terms t ON t.id=ps.term_id
JOIN term_article_tables tb ON tb.term_id=t.id
WHERE ps.section_key='reader-usefulness-b'
  AND tb.status IN ('reviewed','published')
  AND tb.editorial_notes LIKE 'Reader%Batch B%';
