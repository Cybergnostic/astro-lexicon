-- Third A-class legacy-distillation migration batch.
-- This pass enriches existing canonical terms rather than reproducing course chapters.
-- Private study distillations are used as pedagogy/coverage maps only; public prose is
-- original synthesis and source-specific claims remain in reviewed interpretations.

-- -----------------------------------------------------------------------------
-- ASPECT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'An aspect is a geometrical relationship between zodiacal positions. In traditional astrology the main aspect structure is built from opposition, trine, square and sextile, while conjunction is treated alongside them whenever planets come together or separate in practice.',
       'reviewed',
       'Migrated from the audited aspects/receptions curriculum as original synthesis.'
FROM terms WHERE slug='aspect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry','Geometry before interpretation',
       'The aspect itself describes angular relationship. Opposition divides the circle in two, trine in three, square in four and sextile in six. Their interpretive qualities are historically connected to these divisions, but the first question is always whether the required geometry is actually present.',
       10,'reviewed',NULL
FROM terms WHERE slug='aspect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'contact','Aspect is not the whole configuration',
       'Two planets can form the same aspect while producing very different results. Application or separation, reception, dignity, sect, planetary nature, house position and interference from other planets all modify the configuration. An aspect should therefore be treated as the structural contact, not as a complete judgment by itself.',
       20,'reviewed',NULL
FROM terms WHERE slug='aspect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'partile-platick','Exact and within orb',
       'Historical authors distinguish very close or partile aspects from wider aspects operating within an allowed orb. Exactness generally intensifies contact, but an aspect can be effective before exact perfection and remain relevant for a period after separation. The permitted distance depends on the author and the aspect doctrine being used.',
       30,'reviewed',NULL
FROM terms WHERE slug='aspect';

-- -----------------------------------------------------------------------------
-- TWELVE HOUSES / PLACES AND HOUSE STRENGTH
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The twelve houses or places divide a chart into twelve fields used both for topical signification and for judging a planet''s capacity to act. Traditional astrology therefore asks two separate questions about a house: what topic does this place signify, and how strong is a planet located there?',
       'reviewed',
       'Migrated from the audited houses curriculum; topical meanings remain distributed across individual house/topic entries.'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'three-orders','Angles, succedents and cadents',
       'Structurally the twelve places form four repeating groups. Each quadrant begins with an angle, continues with a succedent and ends with a cadent. This sequence creates a hierarchy of accidental strength that is distinct from the topical meaning of the individual house.',
       10,'reviewed',NULL
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'topic-power','Topic and power must be separated',
       'A house may be important for a particular topic while still being a weak place for planetary action. Conversely, an angular planet can be very capable of producing effects even when the topic it signifies is difficult. Traditional synthesis becomes much clearer when topical signification and accidental power are judged separately before being combined.',
       20,'reviewed',NULL
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'An angle or cardine is one of the four pivots of the chart: the first, tenth, seventh and fourth houses. Angularity gives a planet strong accidental power because the planet occupies one of the principal places around which the figure is organized.',
       'reviewed',
       'House-strength teaching article derived from the audited houses and accidental-dignities curricula.'
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'power','Why angularity matters',
       'Angular planets are ordinarily more capable of acting, becoming visible and producing their significations decisively. Angularity does not tell us whether those significations are good or bad; it tells us that the planet has considerable capacity to make its condition effective.',
       10,'reviewed',NULL
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'A succedent place follows an angle and occupies an intermediate position in the traditional hierarchy of house strength. Succedent planets generally have more capacity to sustain or develop their significations than cadent planets, but less immediate power than planets on the angles.',
       'reviewed',
       'House-strength teaching article.'
FROM terms WHERE slug='succedent-place';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'A cadent place falls away from an angle. Cadency generally reduces a planet''s accidental power and its ability to act directly or bring matters to completion, even though individual cadent houses can remain highly important for the topics they signify.',
       'reviewed',
       'House-strength teaching article; topical exceptions are kept distinct from the general power rule.'
FROM terms WHERE slug='cadent-place';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-absence','Weak power is not absence',
       'Cadency does not mean that a planet disappears from the chart or has no meaning. It means that the planet is generally less able to impose or complete its significations. A cadent planet can still be qualitatively dignified, closely configured with important significators, or central to a topic through rulership.',
       10,'reviewed',NULL
FROM terms WHERE slug='cadent-place';

-- -----------------------------------------------------------------------------
-- ACCIDENTAL FORTITUDE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Accidental fortitude describes strength supplied by a planet''s circumstances in a particular figure rather than by its essential dignity in the zodiac. It concerns practical capacity: how freely, visibly and effectively the planet can operate here and now.',
       'reviewed',
       'Migrated from the audited accidental-dignities curriculum; individual conditions remain separate canonical terms.'
FROM terms WHERE slug='accidental-fortitude';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'examples','Typical sources of accidental strength and weakness',
       'House position, motion, speed, visibility, sect conformity, solar condition and planetary configurations can all contribute to accidental strength or weakness. The exact scoring systems vary between authors, so the lexicon preserves the individual conditions instead of pretending there is one universal numerical table.',
       10,'reviewed',NULL
FROM terms WHERE slug='accidental-fortitude';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'essential-distinction','Essential quality and accidental capacity',
       'Essential dignity and accidental fortitude answer different questions. A planet can be of good essential quality yet lack the circumstances needed to act effectively, or it can be accidentally powerful while essentially debilitated. Traditional judgment needs both dimensions before deciding what the planet is likely to produce.',
       20,'reviewed',NULL
FROM terms WHERE slug='accidental-fortitude';

-- -----------------------------------------------------------------------------
-- PLANETARY MOTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Retrogradation is the apparent backward motion of a planet through the zodiac. In traditional judgment it is not merely an astronomical label: it is commonly treated as an accidental weakening or irregularity because the planet is moving contrary to its ordinary direct course.',
       'reviewed',
       'Migrated from the audited accidental-condition and planetary-motion coverage.'
FROM terms WHERE slug='retrogradation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'meaning','What retrogradation changes',
       'Retrogradation can signify reversal, return, interruption, reconsideration or difficulty proceeding in a straightforward sequence. Its precise effect depends on the planet, topic and surrounding testimonies. It should not be treated as a universal modern keyword that overrides the rest of the chart.',
       10,'reviewed',NULL
FROM terms WHERE slug='retrogradation';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'A station is the apparent pause at the turning point between direct and retrograde motion. Because a stationary planet is changing its mode of motion, traditional authors often treat stationarity as a distinct condition rather than simply calling the planet direct or retrograde.',
       'reviewed',
       'Migrated from the audited planetary-motion curriculum.'
FROM terms WHERE slug='station';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-stations','Two turning points',
       'A planet can station before turning retrograde and station again before returning to direct motion. The two stations therefore belong to different phases of the cycle. A careful judgment notes which transition is occurring instead of treating every stationary planet as the same condition.',
       10,'reviewed',NULL
FROM terms WHERE slug='station';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Direct motion is the planet''s ordinary apparent forward motion through the zodiac, contrasted with retrogradation and the stationary turning points between them. In accidental-strength doctrine, direct motion is normally the regular or unimpeded state.',
       'reviewed',
       'Migrated from the audited planetary-motion curriculum.'
FROM terms WHERE slug='direct-motion';

-- -----------------------------------------------------------------------------
-- SECT / HAYZ
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Sect divides charts and planets into diurnal and nocturnal conditions. It is a contextual doctrine: the same planet can operate differently depending on whether the chart is by day or by night and whether the planet is placed in circumstances appropriate to its own sect.',
       'reviewed',
       'Migrated from the audited planetary-condition curriculum; source-specific membership differences remain in historical accounts.'
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'chart-first','Begin with the chart sect',
       'The first question is whether the figure is diurnal or nocturnal. Planetary sect membership is then judged against that chart context. Sect is therefore not a free-standing personality label attached to a planet; it describes whether the planet is operating within the day or night environment to which it belongs.',
       10,'reviewed',NULL
FROM terms WHERE slug='sect';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Hayz is a compound condition of sect conformity. In the reviewed medieval sources it combines the planet''s appropriate day-or-night relationship to the horizon with conformity between the planet''s gender and the gender of the sign it occupies.',
       'reviewed',
       'Migrated from the audited sect curriculum; historical terminology and Mars exceptions remain source-specific.'
FROM terms WHERE slug='hayz';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'compound','More than simple sect membership',
       'A planet does not enter hayz merely by belonging to the correct sect. Hayz adds further positional conditions. This is why it should be distinguished from the broader doctrine of sect and from halb, which represents the horizon/day-night conformity component without the additional sign-gender requirement.',
       10,'reviewed',NULL
FROM terms WHERE slug='hayz';
