-- Reader usefulness Batch E: ontology and source-distinction review.
--
-- These edits do not normalize historically distinct concepts. They make the public
-- recognition rule clear, preserve source-specific distinctions, remove project-language
-- framing, and expose Firdaria's directly evidenced unequal period structure.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- Existing strong articles: remove project/corpus/encyclopedia voice only.
-- -----------------------------------------------------------------------------

UPDATE term_article_sections
SET body='Al-Bīrūnī presents Opening the Doors inside weather astrology. The configuration is used as one testimony for atmospheric release or change, and he associates different planetary pairings with different kinds of weather. Its attested scope here is therefore meteorological rather than a general rule for every branch of astrology.'
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors') AND section_key='weather-context';

UPDATE term_article_sections
SET body='Within al-Bīrūnī’s account, particular opposed planetary pairs are associated with the opening of rain, storms or winds. Those pairings belong to his meteorological catalogue. The common mechanism is the use of opposed planetary natures or domiciles as a weather testimony; an individual transmitted list should not automatically be turned into a universal table.'
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors') AND section_key='weather-release';

UPDATE term_article_sections
SET body='Bonatti uses a closely similar English phrase for a different mechanism. His Opening of the Gates belongs to reception doctrine: reception overcomes ordinary hostility and allows one planet to welcome another. Because that recognition rule is different from al-Bīrūnī’s meteorological configuration, the two terms remain distinct despite their similar translated names.'
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-the-doors') AND section_key='not-opening-gates';

UPDATE term_article_sections
SET body='In the Paulus/Olympiodorus stream, the day formula is Ascendant + Venus - Lot of Spirit, with the order reversed by night. A second ancient stream constructs Eros from the Lots of Fortune and Spirit. These are historically distinct transmissions, so the formula used should be identified rather than one variant silently treated as universal.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-eros') AND section_key='formula';

UPDATE term_article_sections
SET body='Bonatti’s Astral Influence belongs to the same broad family of celestial causal action on the lower world. The concepts can therefore be compared as historical expressions of celestial causation without assuming that the translated phrases Celestial Power and Astral Influence were one fixed technical term.'
WHERE term_id=(SELECT id FROM terms WHERE slug='celestial-power') AND section_key='bonatti-correspondence';

UPDATE term_articles
SET intro='Natal Rectification is the general task of correcting an uncertain birth time or natal angles by testing an approximate figure with a defined astrological method. It is an umbrella technique rather than one calculation: Animodar, the Trutine of Hermes and rectification by dated accidents are separate historical methods directed toward the same underlying problem.'
WHERE term_id=(SELECT id FROM terms WHERE slug='natal-rectification');

UPDATE term_article_sections
SET body='Rectification begins from uncertainty in the recorded birth time or derived natal angles. A method takes an approximate figure and applies a defined test in order to revise that figure. The stable concept is this corrective task, not any one historical algorithm.'
WHERE term_id=(SELECT id FROM terms WHERE slug='natal-rectification') AND section_key='general-problem';

UPDATE term_article_sections
SET body='Natal Rectification is the parent concept; tie-breaking rules, conception relationships, directing details and source preferences belong to the individual method pages. Keeping those procedures separate prevents one historical method from being presented as the definition of rectification itself.'
WHERE term_id=(SELECT id FROM terms WHERE slug='natal-rectification') AND section_key='method-source';

UPDATE term_article_sections
SET body='Historical descriptions of wild or feral condition depend on the aspect doctrine used by the author. The underlying rule is source-sensitive rather than a generic modern “no aspects” checkbox, so the relevant historical recognition rule should be used when identifying the condition.'
WHERE term_id=(SELECT id FROM terms WHERE slug='feral') AND section_key='source-rules';

UPDATE term_article_sections
SET body='Opening the Doors is a separate meteorological doctrine involving planets opposed by nature or domicile and used as a weather testimony. Similar English wording conceals two unrelated recognition rules, so it should not be treated as another name for Bonatti’s reception doctrine.'
WHERE term_id=(SELECT id FROM terms WHERE slug='opening-of-gates') AND section_key='not-opening-doors';

UPDATE term_articles
SET intro='Firdaria, or fardār, is a medieval planetary time-lord system of unequal major periods. The sequence begins from the sect luminary—Sun by day and Moon by night—and each planetary period is subdivided into successive associations or subperiods. Abū Maʿshar, al-Bīrūnī and Bonatti attest this medieval form, which is technically distinct from Lilly’s fixed seven-year Alfridary system.'
WHERE term_id=(SELECT id FROM terms WHERE slug='fardar');

-- -----------------------------------------------------------------------------
-- Thin ontology entries: teach the concept and the exact distinction in public prose.
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'','reviewed','Reader usefulness Batch E ontology clarification.' FROM terms WHERE slug IN (
  'universal-question','exaltation-degree','bond-of-moon','dustoria','lunar-dichotomy',
  'planetary-elevation','rejoicing-condition','trutine-of-hermes'
);

UPDATE term_articles
SET intro='A Universal Question is Bonatti’s broad-scope question category for an inquiry whose judgment extends over a general condition or a stated span of time. He allows the intended duration to be perpetual or limited to a year, month, week, day or another period. This is related to, but not identical with, the Absolute/Determinate distinction: the latter chiefly concerns how specifically the object of inquiry is defined, while universal usage here emphasizes breadth and duration.'
WHERE term_id=(SELECT id FROM terms WHERE slug='universal-question');

UPDATE term_articles
SET intro='An Exaltation Degree is the specific degree traditionally associated with a planet inside its exaltation sign. It is a refinement of exaltation, not a separate dignity replacing the sign-level doctrine. Abū Maʿshar treats the exact degree as a point at which the planet’s exaltation indication is especially complete and gives an extended astronomical-cosmological rationale for the traditional degrees.'
WHERE term_id=(SELECT id FROM terms WHERE slug='exaltation-degree');

UPDATE term_articles
SET intro='The Bond of the Moon is Antiochus’ name for a specifically lunar solar-proximity condition. The Moon enters the bond within fifteen degrees of the Sun, remains bound through conjunction, and is released only after separating by the same distance. Its numerical resemblance to later under-the-beams rules should not erase the source-specific lunar term and its symmetrical entry-and-release definition.'
WHERE term_id=(SELECT id FROM terms WHERE slug='bond-of-moon');

UPDATE term_articles
SET intro='Dustoria is Bonatti’s transmitted compound condition, attributed through Alchabitius, built from hayz or similitude but requiring further solar, lunar or angular relationships. Bonatti gives overlapping formulations, including a stronger relation of dextration or security. Dustoria therefore belongs beside Hayz and Own Similitude, but it is not simply another name for either one.'
WHERE term_id=(SELECT id FROM terms WHERE slug='dustoria');

UPDATE term_articles
SET intro='A Lunar Dichotomy is one of Bonatti’s four principal divisions of the lunar month, each roughly seven days long: conjunction to the first seven-day point, then to opposition, then to the third seven-day point, and finally to the next conjunction. He uses these divisions as checkpoints for changes in the air. The term should remain distinct from other lunar subdivisions such as duodena or al-bust.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lunar-dichotomy');

UPDATE term_articles
SET intro='Planetary Eminence or Elevation in Bonatti is a comparison of which of two planets stands above or predominates over the other. He transmits more than one astronomical test: relative position on the epicycle, and a latitude-based method that he calls stronger. This is a source-specific comparison and should not automatically be identified with other doctrines of superiority, overcoming or elevation.'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-elevation');

UPDATE term_articles
SET intro='Rejoicing Condition is Antiochus’ broader doctrine of planets rejoicing when their placement suits their nature—for example by eastern or western quadrant, by position above or below the earth according to sect, or by related appropriate conditions. It is distinct from the familiar planetary joys by house, which assign each planet to a particular place of the chart.'
WHERE term_id=(SELECT id FROM terms WHERE slug='rejoicing-condition');

UPDATE term_articles
SET intro='The Trutine or Scrutiny of Hermes is a natal rectification method using the traditional relationship between the Moon at birth and a proposed conception figure to test the natal Ascendant. Lilly presents it as a distinct method from Animodar and treats it as potentially useful for identifying the rising sign, while expressing less confidence in it for exact rectification.'
WHERE term_id=(SELECT id FROM terms WHERE slug='trutine-of-hermes');

-- Add one compact recognition section to each thin entry so the distinction is not left
-- only in editorial metadata.
DELETE FROM term_article_sections WHERE section_key='ontology-distinction' AND term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'universal-question','exaltation-degree','bond-of-moon','dustoria','lunar-dichotomy',
    'planetary-elevation','rejoicing-condition','trutine-of-hermes'
  )
);

INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ontology-distinction','Recognition and distinction',
  CASE slug
    WHEN 'universal-question' THEN 'Recognize the term by the breadth and intended duration of the inquiry. A question may concern a general condition over a long or explicitly delimited period without thereby becoming identical to Bonatti’s Absolute Question category.'
    WHEN 'exaltation-degree' THEN 'The recognition rule is degree-level: the doctrine names a particular degree within an already established exaltation sign. Sign-level exaltation and the exact exaltation degree should therefore be read together but not collapsed into one datum.'
    WHEN 'bond-of-moon' THEN 'The condition is specifically lunar and symmetrical around conjunction: within 15° while approaching the Sun, through conjunction, and until the Moon has separated beyond 15°. The historical name and rule belong to Antiochus’ lunar doctrine.'
    WHEN 'dustoria' THEN 'Hayz or similitude supplies part of the condition, but Dustoria adds further orientation or configuration requirements. A planet satisfying hayz alone should not automatically be labelled Dustoria.'
    WHEN 'lunar-dichotomy' THEN 'The four-part rhythm is temporal rather than a zodiacal subdivision: it divides one lunation into roughly seven-day stages used as weather checkpoints.'
    WHEN 'planetary-elevation' THEN 'Bonatti’s comparison is astronomical: either epicyclic position or relative ecliptic latitude determines which planet is above the other. Other traditions using “elevation” for different superiority doctrines need separate recognition rules.'
    WHEN 'rejoicing-condition' THEN 'Antiochus’ rejoicing is a family of planet-appropriate positional conditions. Planetary Joy by house is one different historical doctrine and should not be substituted for this broader set of rejoicing conditions.'
    WHEN 'trutine-of-hermes' THEN 'The method is recognized by the birth-Moon/conception-figure relationship. Animodar also belongs to natal rectification but begins from a different prenatal-syzygy procedure, so the methods should remain separate.'
  END,
  910,'reviewed','Batch E: make the ontology distinction reader-facing.'
FROM terms WHERE slug IN (
  'universal-question','exaltation-degree','bond-of-moon','dustoria','lunar-dichotomy',
  'planetary-elevation','rejoicing-condition','trutine-of-hermes'
);

-- -----------------------------------------------------------------------------
-- Firdaria: exact directly evidenced major periods and sect-dependent order.
-- -----------------------------------------------------------------------------

DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='fardar') AND table_key='firdaria-major-periods';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'firdaria-major-periods','Major Firdaria periods',
  'Abū Maʿshar gives the fixed period lengths; al-Bīrūnī and Bonatti attest the sect-dependent starting rule and successive planetary participation. The seven planetary periods total 70 years, followed by the Head and Tail periods for a complete 75-year cycle.',
  '["Day-nativity order","Night-nativity order","Length"]',
  '[["Sun","Moon","10 years for Sun · 9 years for Moon"],["Venus","Saturn","8 years for Venus · 11 years for Saturn"],["Mercury","Jupiter","13 years for Mercury · 12 years for Jupiter"],["Moon","Mars","9 years for Moon · 7 years for Mars"],["Saturn","Sun","11 years for Saturn · 10 years for Sun"],["Jupiter","Venus","12 years for Jupiter · 8 years for Venus"],["Mars","Mercury","7 years for Mars · 13 years for Mercury"],["Head of the Dragon","Head of the Dragon","3 years"],["Tail of the Dragon","Tail of the Dragon","2 years"]]',
  910,'reviewed','Batch E: expose exact source-attested Firdaria major durations and the day/night starting sequence.'
FROM terms WHERE slug='fardar';
