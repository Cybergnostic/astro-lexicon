-- Encyclopedia-quality pass: sect, motion, and house-strength families.
--
-- Earlier teaching seeds established correct concise articles for these terms, but
-- several remain intro-only or one-section entries. This pass adds distinctions and
-- connective explanations without turning them into chart-analysis workflows.

-- =============================================================================
-- SECT FAMILY
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'planetary-membership','Planetary sect membership',
       'Traditional planets are themselves classified as belonging naturally to the diurnal or nocturnal sect, while the chart establishes whether the current figure is a day or night figure. The practical doctrine compares the planet’s natural affiliation with the chart environment rather than treating “diurnal” and “nocturnal” as isolated keywords.',
       20,'reviewed',NULL
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'condition-not-dignity','Sect is contextual condition, not essential dignity',
       'Sect does not change which planet owns a sign, exaltation, triplicity, term or face. It describes contextual fitness within a day or night figure. A planet can therefore be essentially dignified yet out of sect, or essentially debilitated while operating within its proper sect. These testimonies answer different questions and should remain separate.',
       30,'reviewed',NULL
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'halb-hayz','Sect, halb and hayz',
       'Sect is the broad doctrine. Halb adds the appropriate relationship between planetary sect, chart sect and position above or below the horizon. Hayz is a fuller compound conformity that also incorporates sign-gender agreement in the medieval formulation represented in this corpus. A planet can therefore be in sect without satisfying the stricter conditions of halb or hayz.',
       40,'reviewed',NULL
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'why-compound','Why hayz is a compound condition',
       'Hayz combines several kinds of congruence rather than naming one simple placement. The planet must fit the day-or-night environment and the relevant horizon condition, and in the medieval definition used here its gender must also agree with the gender of the sign. This makes hayz a stronger statement of contextual conformity than simple sect membership.',
       20,'reviewed',NULL
FROM terms WHERE slug='hayz';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-essential','Hayz does not replace dignity',
       'Hayz is an accidental or contextual condition. It does not give a planet domicile, exaltation or another essential dignity, nor does it erase essential debility. A planet can be in hayz while weak in some other respect, just as a dignified planet can fail the conditions for hayz.',
       30,'reviewed',NULL
FROM terms WHERE slug='hayz';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-from-hayz','Halb is narrower than hayz',
       'Halb concerns the day-or-night and horizon relationship. Hayz includes that kind of sect conformity but adds another requirement concerning the planet’s gender and the sign it occupies. Treating the two words as synonyms erases a useful technical distinction preserved in medieval astrology.',
       20,'reviewed',NULL
FROM terms WHERE slug='halb';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'context','A relational condition',
       'Whether a planet is in halb cannot be read from the planet alone. The same planet above the horizon can satisfy or fail the condition depending on whether the figure is diurnal or nocturnal and whether the planet belongs to the corresponding sect. Halb is therefore inherently relational.',
       30,'reviewed',NULL
FROM terms WHERE slug='halb';

-- =============================================================================
-- PLANETARY MOTION FAMILY
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'astronomical-basis','Apparent motion, not physical reversal',
       'Retrogradation is apparent geocentric motion. The planet does not literally reverse its path through space; from the observational framework of the traditional horoscope it temporarily moves backward in zodiacal longitude. The astrological condition is built on that observed reversal.',
       20,'reviewed',NULL
FROM terms WHERE slug='retrogradation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-automatic','A debility is not a complete judgment',
       'Traditional authors commonly count retrogradation as an accidental impairment, but the label does not by itself determine the entire outcome of a planet. Essential dignity, house strength, sect, reception, solar condition and the topic being judged still matter. Retrograde therefore belongs in a condition profile rather than functioning as a standalone verdict.',
       30,'reviewed',NULL
FROM terms WHERE slug='retrogradation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'cycle','Stations belong to the retrograde cycle',
       'A station occurs at a transition: first when a planet slows to the turning point before retrograde motion, and later when it slows again before resuming direct motion. The station is therefore not an unrelated third kind of motion but the boundary phase between direct and retrograde states.',
       20,'reviewed',NULL
FROM terms WHERE slug='station';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'first-second','First and second station are not interchangeable',
       'A planet stationing before retrogradation is entering a different phase from one stationing before direct motion. Historical authors can assign different implications to these transitions. A precise entry or chart description should therefore state which station is meant whenever the distinction matters.',
       30,'reviewed',NULL
FROM terms WHERE slug='station';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ordinary-course','The ordinary apparent course',
       'Direct motion is the ordinary forward movement of a planet through zodiacal longitude. It is the reference state against which retrogradation and stationarity are recognized. Calling a planet direct therefore describes its current mode of motion, not a guarantee that every other condition of the planet is strong or favorable.',
       10,'reviewed',NULL
FROM terms WHERE slug='direct-motion';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'speed-separate','Direction and speed are separate conditions',
       'A planet can be direct while moving slowly or swiftly. Direction tells whether zodiacal longitude is increasing or decreasing; speed compares the rate of that motion with an expected or mean rate. Traditional strength tables often track both because they describe different features of planetary motion.',
       20,'reviewed',NULL
FROM terms WHERE slug='direct-motion';

-- =============================================================================
-- HOUSE-STRENGTH FAMILY
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'four-angles','The four pivots',
       'The Ascendant, Midheaven, Descendant and lower meridian form the four principal pivots of the figure and correspond to the first, tenth, seventh and fourth places in the house-strength scheme represented here. Their importance is structural: they anchor the chart and give planets occupying them pronounced accidental capacity.',
       20,'reviewed',NULL
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'quality-neutral','Power is quality-neutral',
       'Angularity amplifies capacity rather than moral quality. A benefic, malefic, dignified or debilitated planet can all be angular. The angle tells us that the planet can act strongly; the planet’s nature and condition tell us what kind of action that strength is likely to support.',
       30,'reviewed',NULL
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'between-angle-cadent','Intermediate in the strength sequence',
       'A succedent place follows an angle and precedes the next cadent place in the repeating structural sequence. Its planets generally have less immediate force than angular planets but more stability and capacity than cadent planets. “Intermediate” describes accidental strength, not the importance of the topic signified by the house.',
       10,'reviewed',NULL
FROM terms WHERE slug='succedent-place';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sustain','Succedent does not mean inactive',
       'Succedent planets are not powerless. Their traditional position between angular immediacy and cadent weakness often makes them capable of sustaining or developing a matter even when they do not act with the same immediacy as planets on the angles. Other dignities and conditions can strengthen or weaken that capacity further.',
       20,'reviewed',NULL
FROM terms WHERE slug='succedent-place';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'falling-away','Why the name cadent matters',
       'Cadent places are described as falling away from the angles. Their reduced accidental strength belongs to this structural relationship to the pivots of the chart. The term therefore describes position in the house sequence rather than a blanket statement that every topic associated with a cadent house is unimportant.',
       20,'reviewed',NULL
FROM terms WHERE slug='cadent-place';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'compare','Angle, succedent, cadent',
       'The three labels form one comparative vocabulary of accidental power: angular is strongest, succedent intermediate and cadent generally weakest. They should be read together as a structural hierarchy and then combined with essential dignity, motion, sect, solar condition and the planet’s topical responsibilities.',
       30,'reviewed',NULL
FROM terms WHERE slug='cadent-place';
