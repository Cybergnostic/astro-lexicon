-- Fourth A-class legacy-distillation migration batch.
-- Enrich existing canonical rulership and condition terms with teaching content.
-- Private study material is used only as a coverage/pedagogy map.

-- -----------------------------------------------------------------------------
-- TRIPLICITY RULERS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Triplicity rulers are the planets assigned to govern each elemental group of three signs. Traditional systems normally distinguish rulership by day and by night and often include a third participating ruler, making triplicity a sect-sensitive form of essential dignity rather than a single ruler attached permanently to each element.',
       'reviewed',
       'Migrated from the audited triplicity-rulers curriculum; exact ruler tables remain source-specific.'
FROM terms WHERE slug='triplicity-rulers';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'day-night','Day and night rulers',
       'The operative triplicity ruler depends on whether the figure is diurnal or nocturnal. This makes sect part of the dignity itself: the same sign can have a different primary triplicity ruler by day than by night. A participating ruler may also share governance in systems that preserve a three-ruler scheme.',
       10,'reviewed',NULL
FROM terms WHERE slug='triplicity-rulers';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Historical tables vary',
       'The general principle of triplicity rulership is widely shared, but the detailed assignments are not perfectly uniform across all authors and traditions. The lexicon therefore treats the table as source-sensitive evidence instead of presenting one later table as if it were historically universal.',
       20,'reviewed',NULL
FROM terms WHERE slug='triplicity-rulers';

-- -----------------------------------------------------------------------------
-- ALMUTEN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'An almuten is the planet that prevails in a particular degree, house or topic by holding the strongest total claim through the relevant dignities or testimonies. It is a comparative ruler: several planets may have some authority, but the almuten is the one that wins the specified calculation.',
       'reviewed',
       'Migrated from the audited Almuten Figuris and rulership curricula; calculation details remain technique-specific.'
FROM terms WHERE slug='almuten';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'comparison','A comparative calculation',
       'Almuten doctrine does not ask only who rules the sign. It compares multiple forms of authority and, depending on the technique, may also compare other testimonies or strengths. The exact weighting system matters, so a result should always be understood relative to the calculation that produced it.',
       10,'reviewed',NULL
FROM terms WHERE slug='almuten';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'topic','Topic-specific by default',
       'An almuten can be calculated for a degree, house cusp, lot or other specific matter. Winning one such calculation does not automatically make the planet the strongest planet in the entire nativity. Whole-chart predominance is a separate and more specialized question.',
       20,'reviewed',NULL
FROM terms WHERE slug='almuten';

-- -----------------------------------------------------------------------------
-- ALMUTEN OF THE FIGURE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Almuten of the Figure is a specialized attempt to identify the planet with the strongest overall claim in the nativity rather than the ruler of one isolated topic. It belongs to the broader almuten family but uses a chart-wide collection of testimonies.',
       'reviewed',
       'Teaching article informed by the audited Almuten Figuris curriculum; differing historical calculation schemes must remain visible.'
FROM terms WHERE slug='almuten-of-figure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-chart-ruler','Not simply the ruler of the Ascendant',
       'The Almuten of the Figure should not be confused automatically with the Ascendant ruler. The Ascendant ruler has a specific office through rulership of the first place, while an Almuten-of-the-Figure calculation compares a wider set of chart testimonies in order to identify overall predominance.',
       10,'reviewed',NULL
FROM terms WHERE slug='almuten-of-figure';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'method-variants','The method must be named',
       'Historical and later traditional authors do not all use exactly the same points, weights or tie-breaking rules. For that reason a result is only meaningful when the calculation method is specified. The encyclopedia should document variants rather than silently blending them into one synthetic formula.',
       20,'reviewed',NULL
FROM terms WHERE slug='almuten-of-figure';

-- -----------------------------------------------------------------------------
-- HALB
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Halb is a positional sect condition linking a planet''s diurnal or nocturnal nature with its position above or below the horizon. It is more specific than simple sect membership and forms one component of the fuller compound condition called hayz.',
       'reviewed',
       'Migrated from the audited sect curriculum.'
FROM terms WHERE slug='halb';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rule','The horizon rule',
       'In the standard medieval definition, a diurnal planet is in halb when it is above the horizon by day or below the horizon by night; a nocturnal planet follows the opposite pattern. The doctrine therefore compares three facts at once: chart sect, planetary sect and horizon position.',
       10,'reviewed',NULL
FROM terms WHERE slug='halb';

-- -----------------------------------------------------------------------------
-- VOID OF COURSE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Void of course describes a planet, most commonly the Moon, after separation from a previous contact when it will make no further effective application during the remainder of its passage through the sign. The doctrine is about the absence of a next connection, not simply about being unaspected at one instant.',
       'reviewed',
       'Migrated from the audited aspect/application curriculum; source-specific orb and application rules remain historical variants.'
FROM terms WHERE slug='void-of-course';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sequence','A sequence condition',
       'The definition depends on motion through time. A planet has separated from one contact and, before leaving the sign, does not proceed to another qualifying application. This is why a static list of current aspects cannot by itself determine whether the condition is present.',
       10,'reviewed',NULL
FROM terms WHERE slug='void-of-course';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-feral','Void of course is not feral',
       'Feral condition is stricter. Void of course concerns the absence of a future application after separation, while feral doctrine concerns a planet passing through a sign without receiving planetary aspects in the required sense. Historical authors may phrase the boundaries differently, but the two ideas should not be collapsed.',
       20,'reviewed',NULL
FROM terms WHERE slug='void-of-course';

-- -----------------------------------------------------------------------------
-- FERAL
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'A feral planet is one that remains unusually isolated from other planets during its passage through a sign. Historical sources also use language such as wildness for this condition. It is a stronger isolation doctrine than ordinary void-of-course terminology.',
       'reviewed',
       'Migrated from the audited configuration curriculum; Wild Planet/Wildness remain source-form aliases.'
FROM terms WHERE slug='feral';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'isolation','Isolation rather than weakness alone',
       'The technical point is the lack of planetary contact, not merely low dignity or low house strength. A feral planet may therefore be strong in some other respect while still operating with unusual independence, lack of mediation or difficulty being integrated into the rest of the planetary configuration.',
       10,'reviewed',NULL
FROM terms WHERE slug='feral';

-- -----------------------------------------------------------------------------
-- BESIEGEMENT
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Besiegement is a condition in which a planet is enclosed between two other planets or between their rays. Traditional sources distinguish different forms of enclosure, especially bodily besiegement and besiegement by aspect, so the recognition rule depends on how the enclosing planets are related to the besieged planet.',
       'reviewed',
       'Migrated from the audited configuration curriculum; source-specific variants remain in historical accounts.'
FROM terms WHERE slug='besiegement';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'benefics-malefics','Who forms the enclosure matters',
       'The condition is interpreted differently depending on the enclosing planets. Enclosure by malefics has a different traditional implication from enclosure by benefics, and mixed enclosures require synthesis. The term therefore names a geometry of planetary containment; the quality of that containment comes from the planets involved.',
       10,'reviewed',NULL
FROM terms WHERE slug='besiegement';
