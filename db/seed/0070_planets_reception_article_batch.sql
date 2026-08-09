-- Second A-class legacy-distillation migration batch.
-- Private study distillations are used only as pedagogy/coverage maps. Public prose
-- is original editorial synthesis; source-specific historical claims remain in the
-- canonical interpretations/citations already present in the database.

-- -----------------------------------------------------------------------------
-- RECEPTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Reception describes a relationship in which one planet occupies a zodiacal dignity belonging to another planet. It adds a layer of permission, support or dependence to the bare aspect between planets, because the receiving planet has authority over the place occupied by the other.',
       'reviewed',
       'Migrated from the audited aspects/receptions curriculum as original synthesis.'
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanism','The basic mechanism',
       'A planet receives another when the second planet is placed in one of the first planet''s recognized dignities. The strength and importance of the reception depend on the dignity involved and on the wider condition of both planets. Reception therefore describes a relationship between rulers and places, not merely an emotional affinity between planets.',
       10,'reviewed',NULL
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mutuality','One-way and mutual reception',
       'Reception can operate in one direction, or both planets can receive one another. Mutual reception creates a reciprocal exchange of authority because each planet occupies a dignity of the other. This can materially change how an aspect or configuration is judged, although it does not erase every other weakness or impediment in the chart.',
       20,'reviewed',NULL
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'aspect','Reception and aspect are different questions',
       'An aspect describes geometrical relationship and contact; reception describes dignitary relationship. The two often work together but should not be collapsed. A difficult aspect with reception can behave differently from the same aspect without reception, while reception without an effective contact may not by itself produce the same kind of perfection or event.',
       30,'reviewed',NULL
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'limits','What reception does not do',
       'Reception can provide help, cooperation or mitigation, but it is not a universal cancellation device. Combustion, retrogradation, severe debility, lack of contact and other conditions still matter. Traditional judgment therefore treats reception as one testimony within a larger configuration rather than as an automatic guarantee of a favorable outcome.',
       40,'reviewed',NULL
FROM terms WHERE slug='reception';

-- -----------------------------------------------------------------------------
-- THE SEVEN TRADITIONAL PLANETS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Saturn is the outermost planet of the traditional seven-planet order and is classed as a superior, diurnal malefic with a predominantly cold and dry nature. Its significations repeatedly concern limits, duration, separation, age, scarcity, endurance and things that develop slowly or remain for a long time.',
       'reviewed',
       'Planet article guided by audited planets curriculum; public historical accounts remain source-specific below.'
FROM terms WHERE slug='saturn';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nature','Nature and classification',
       'Saturn belongs to the superior planets and to the diurnal sect. Its extreme coldness and dryness supply the natural-philosophical logic behind many of its traditional significations: contraction, consolidation, delay, preservation, isolation and resistance to change.',10,'reviewed',NULL
FROM terms WHERE slug='saturn';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'condition','Condition changes expression',
       'A planet''s natural significations are not identical with its actual performance in a chart. A well-conditioned Saturn can express discipline, patience, gravity and durability; a badly conditioned Saturn can express obstruction, fear, deprivation or destructive rigidity. The same underlying nature is being expressed under different conditions.',20,'reviewed',NULL
FROM terms WHERE slug='saturn';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Jupiter is the greater benefic of the traditional planetary scheme: a superior, diurnal planet with a moderately hot and moist nature. Its significations center on increase, preservation, justice, faith, counsel, wealth, generosity and forms of social or material expansion.',
       'reviewed',
       'Planet article guided by audited planets curriculum.'
FROM terms WHERE slug='jupiter';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nature','Nature and classification',
       'Jupiter combines heat with moisture in a temperate way and belongs to the diurnal sect. That mixture supports its traditional benefic character: joining, nourishing, increasing and stabilizing rather than cutting apart or drying out.',10,'reviewed',NULL
FROM terms WHERE slug='jupiter';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'condition','Benefic does not mean automatically good',
       'Benefic status describes natural tendency, not guaranteed outcome. A strong and well-placed Jupiter can support growth, judgment and protection, while a corrupted or badly placed Jupiter can exaggerate, overpromise or turn abundance into excess. Essential and accidental condition still determine how effectively its nature is expressed.',20,'reviewed',NULL
FROM terms WHERE slug='jupiter';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Mars is a superior, nocturnal malefic whose traditional nature is strongly hot and dry. Its significations arise from division, heat, force, cutting, conflict, urgency and decisive action, but the same nature can produce courage and effective action when well directed.',
       'reviewed',
       'Planet article guided by audited planets curriculum.'
FROM terms WHERE slug='mars';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'constructive-destructive','One nature, different outcomes',
       'Traditional interpretation does not require two different Marses for courage and violence. Both arise from the same hot, dry, separating and forceful nature. Dignity, sect, house position, aspects and reception help determine whether that force becomes disciplined initiative or destructive conflict.',10,'reviewed',NULL
FROM terms WHERE slug='mars';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Sun is the greater luminary and the center of the traditional planetary order. It is diurnal, predominantly hot and dry, and signifies visibility, authority, honor, rank, vitality, centrality and the capacity to illuminate or command.',
       'reviewed',
       'Planet article guided by audited planets curriculum.'
FROM terms WHERE slug='sun';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'centrality','Visibility and centrality',
       'Many solar significations follow from the Sun''s role as the principal source of visible light. What is solar tends toward prominence, recognition, command, distinction and things placed at the center of attention. This same overwhelming light also explains why planets too close to the Sun can become hidden or weakened.',10,'reviewed',NULL
FROM terms WHERE slug='sun';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Venus is the lesser benefic and a nocturnal planet with a predominantly cold and moist nature. Its traditional significations concern attraction, union, pleasure, beauty, affection, adornment, art, agreement and the things through which people are drawn together.',
       'reviewed',
       'Planet article guided by audited planets curriculum.'
FROM terms WHERE slug='venus';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'joining','A joining planet',
       'Moisture is traditionally associated with joining and adaptability, which helps explain Venusian significations of bonding, harmony and pleasure. As with every planet, condition matters: the same appetite for union and enjoyment can be graceful and constructive or excessive and poorly governed.',10,'reviewed',NULL
FROM terms WHERE slug='venus';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'Mercury is the most variable of the seven traditional planets. It signifies language, calculation, learning, trade, interpretation, craft, messages and the transmission of information, while several of its classifications can change according to phase, association and planetary company.',
       'reviewed',
       'Planet article guided by audited planets and quality-of-mind curricula.'
FROM terms WHERE slug='mercury';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variability','Why Mercury changes so easily',
       'Traditional sources repeatedly treat Mercury as adaptable rather than fixed. Its gender, sect affiliation and qualitative expression can shift according to its relation to the Sun and to other planets. This variability is not an exception to Mercury''s nature; it is one of the main features of that nature.',10,'reviewed',NULL
FROM terms WHERE slug='mercury';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mind','Mercury and rational thought',
       'In natal doctrine Mercury is a principal significator of rational thought, speech and the capacity to organize information. Its speed, direction, visibility, sign, ruler and participating planets can modify how those functions operate, so interpretation should not be reduced to Mercury''s zodiac sign alone.',20,'reviewed',NULL
FROM terms WHERE slug='mercury';

INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Moon is the lesser luminary and the fastest of the traditional planets. It is nocturnal, generally cold and moist, and signifies bodily life, perception, habit, change, movement, generation, crowds and the transmission of celestial influence into rapidly changing earthly circumstances.',
       'reviewed',
       'Planet article guided by audited planets, temperament and quality-of-mind curricula.'
FROM terms WHERE slug='moon';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'change','Movement and change',
       'The Moon changes sign, phase and relationship more rapidly than the other traditional planets. This makes motion, fluctuation, sequence and transfer central to lunar symbolism. In many techniques the Moon describes how a matter develops from one contact to the next rather than only what the matter is.',10,'reviewed',NULL
FROM terms WHERE slug='moon';
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'phase','Phase matters',
       'The Moon''s condition cannot be separated from its relation to the Sun. Waxing and waning, visibility, conjunction, opposition and intermediate phases alter how traditional authors describe its qualities and strength. Lunar phase is therefore a technical condition, not merely a decorative label.',20,'reviewed',NULL
FROM terms WHERE slug='moon';
