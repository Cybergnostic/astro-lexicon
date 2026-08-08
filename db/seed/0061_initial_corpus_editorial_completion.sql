-- Final initial-corpus editorial completion pass.
-- Runs after 0060_bonatti_edition_provenance.sql.
--
-- This pass closes the fresh-database audit findings without flattening documented
-- historical ambiguities. It promotes only definitions and direct interpretations
-- that survived the cross-source review, removes one misassigned Bonatti record,
-- supplies missed source interpretations, reviews authored relations, and backfills
-- citation links from each interpretation's recorded scope to the corresponding
-- reviewed source-passage block.

-- -----------------------------------------------------------------------------
-- REMAINING CANONICAL TERMS
-- -----------------------------------------------------------------------------
UPDATE terms SET definition_quality=4, status='reviewed', entry_type='technical'
WHERE slug='ascending-descending-quadrant';

UPDATE terms SET definition_quality=5, status='reviewed', entry_type='technical'
WHERE slug IN ('benefic','malefic','casting-rays','combust-way','oppositional-nativity');

UPDATE terms SET definition_quality=4, status='reviewed', entry_type='technical'
WHERE slug IN ('corruption-of-moon','occidentality','orientality','planetary-joy','planetary-share');

-- One Bonatti interpretation was attached to Orientality even though its content is
-- only a description of northern/southern planetary latitude. Do not certify a
-- mismatched source account merely to satisfy the audit.
DELETE FROM interpretations
WHERE term_id=(SELECT id FROM terms WHERE slug='orientality')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND scope='Third Tractatus, Part II, Chapter II'
  AND summary LIKE 'Bonatti defines northern and southern planetary latitude%';

-- The remaining ungraded interpretations were individually rechecked in the final
-- audit pass. They are direct definitions, recognition rules, or explicit technical
-- explanations and therefore meet evidence grade A.
UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE status='draft'
  AND certainty='direct'
  AND evidence_grade IS NULL;

-- -----------------------------------------------------------------------------
-- MISSED SOURCE INTERPRETATIONS
-- -----------------------------------------------------------------------------
INSERT INTO interpretations
  (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Abū Maʿshar distinguishes a class of eighty authenticated lots organized under the topics of the twelve astrological places, separate from the seven planetary lots and the ten additional lots.',
       'Part VIII, Chapter 2', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lots-of-the-twelve-places'
  AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lots-of-the-twelve-places'
  AND w.slug='abu-mashar-great-introduction'
  AND i.scope='Part VIII, Chapter 2'
  AND sp.book='Part VIII'
  AND sp.chapter='Chapter 2';

INSERT INTO interpretations
  (term_id, work_id, summary, scope, certainty, status, evidence_grade)
SELECT t.id, w.id,
       'Bonatti distinguishes a beginning as oppositional when the relevant preceding syzygy was an opposition of the luminaries, contrasting it with a conjunctional beginning and using the distinction in his Ascendant-rectification procedure.',
       'Treatise 4, Chapter 8', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='oppositional-nativity'
  AND w.slug='bonatti-liber-astronomiae'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='oppositional-nativity'
  AND w.slug='bonatti-liber-astronomiae'
  AND i.scope='Treatise 4, Chapter 8'
  AND sp.book='Treatise 4'
  AND sp.chapter='Chapter 8';

-- -----------------------------------------------------------------------------
-- RELATION REVIEW
-- -----------------------------------------------------------------------------
-- These relations were authored during the extraction/revision passes with explicit
-- relation types and editorial notes. With both endpoint terms now reviewed, the
-- remaining draft relations are promoted as part of the final cross-source pass.
UPDATE term_relations SET status='reviewed' WHERE status='draft';

-- -----------------------------------------------------------------------------
-- CITATION BACKFILL
-- -----------------------------------------------------------------------------
-- This mapping was generated and validated from a fresh post-0060 SQLite build.
-- Each pair is (interpretation_id, source_passage_id). The interpretation's recorded
-- scope was matched to the reviewed passage block that contains that chapter/section.
-- Multiple rows are intentional when an interpretation spans more than one block.
CREATE TEMP TABLE _citation_backfill (
  interpretation_id INTEGER NOT NULL,
  source_passage_id INTEGER NOT NULL,
  PRIMARY KEY (interpretation_id, source_passage_id)
);

INSERT INTO _citation_backfill (interpretation_id, source_passage_id) VALUES
  (26,5), (27,5), (29,50), (29,71), (33,49), (34,26), (35,26), (35,77),
  (36,77), (37,26), (38,27), (39,27), (40,8), (41,8), (42,27), (43,28),
  (44,28), (46,53), (47,86), (48,30), (49,31), (50,31), (51,31), (52,30),
  (52,31), (53,31), (54,31), (55,31), (56,31), (57,31), (60,32), (61,32),
  (66,34), (67,34), (68,34), (69,35), (70,34), (70,35), (71,34), (71,35),
  (73,36), (74,36), (75,36), (76,37), (77,37), (78,37), (79,37), (80,37),
  (80,38), (81,38), (82,38), (83,38), (84,38), (85,39), (86,39), (87,39),
  (88,39), (89,40), (90,40), (91,41), (92,41), (93,41), (94,41), (96,43),
  (100,44), (101,45), (102,46), (103,46), (104,46), (105,46), (106,47), (107,47),
  (108,47), (109,47), (110,48), (111,48), (112,48), (113,25), (113,48), (114,25),
  (114,48), (115,49), (116,49), (117,49), (118,49), (119,50), (120,51), (121,51),
  (122,51), (123,52), (124,52), (125,52), (126,53), (127,53), (128,53), (129,53),
  (130,53), (131,53), (132,54), (133,55), (134,55), (135,56), (136,56), (137,56),
  (138,57), (139,57), (140,57), (141,57), (142,57), (143,57), (144,57), (145,58),
  (146,59), (147,59), (148,60), (149,60), (150,60), (151,60), (151,61), (152,60),
  (152,61), (156,61), (157,61), (158,61), (159,61), (160,61), (161,61), (162,61),
  (163,61), (166,63), (167,63), (169,63), (170,63), (175,64), (176,64), (177,64),
  (178,64), (179,64), (183,65), (185,66), (186,66), (187,67), (189,68), (190,68),
  (191,68), (194,70), (195,70), (196,70), (197,70), (198,70), (199,70), (200,70),
  (201,70), (202,70), (203,70), (204,70), (205,70), (206,70), (207,70), (208,70),
  (209,70), (210,70), (211,70), (212,70), (213,71), (214,71), (215,72), (216,72),
  (217,72), (218,74), (219,74), (220,74), (221,74), (222,74), (223,75), (224,75),
  (225,75), (226,75), (226,76), (227,75), (227,76), (228,76), (229,77), (230,77),
  (231,77), (232,77), (233,77), (234,77), (235,77), (236,77), (237,78), (238,78),
  (239,5), (240,5), (240,79), (241,5), (241,79), (242,1), (242,80), (243,80),
  (244,80), (245,80), (245,188), (246,80), (247,80), (248,80), (249,80), (250,20),
  (251,20), (252,20), (253,20), (254,80), (255,80), (256,80), (257,80), (261,81),
  (262,81), (263,81), (264,82), (265,82), (266,82), (267,82), (268,82), (269,82),
  (270,83), (271,83), (272,83), (273,84), (274,84), (275,84), (276,84), (277,84),
  (278,84), (279,84), (280,85), (281,85), (282,85), (283,86), (284,86), (285,86),
  (286,86), (288,86), (289,86), (290,86), (291,87), (292,87), (293,87), (294,87),
  (295,87), (296,87), (297,87), (298,88), (299,88), (300,88), (300,91), (301,88),
  (301,91), (302,89), (303,89), (304,91), (305,91), (306,91), (307,92), (308,93),
  (309,94), (310,95), (311,95), (312,95), (313,96), (315,97), (316,97), (317,97),
  (318,97), (319,97), (320,97), (321,97), (322,97), (323,97), (325,98), (326,98),
  (327,98), (328,98), (329,98), (330,98), (331,99), (332,99), (333,99), (334,99),
  (335,100), (337,101), (338,101), (339,101), (340,102), (341,102), (342,102), (343,103),
  (344,103), (345,103), (346,103), (347,103), (347,104), (348,103), (349,104), (350,105),
  (351,105), (352,105), (353,105), (354,106), (355,107), (356,107), (357,107), (358,107),
  (359,107), (361,108), (362,108), (363,108), (365,108), (366,109), (367,109), (368,109),
  (369,109), (370,110), (371,110), (372,111), (372,113), (373,112), (374,111), (376,113),
  (377,111), (377,112), (378,111), (378,112), (379,111), (379,112), (379,113), (380,111),
  (380,112), (381,112), (382,111), (382,112), (466,154), (482,158), (483,158), (483,161),
  (484,159), (484,160), (485,27), (486,159), (487,159), (494,160), (494,161), (562,161),
  (564,170), (568,77), (569,77), (570,98);

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT b.interpretation_id, b.source_passage_id, 'primary'
FROM _citation_backfill b
JOIN interpretations i ON i.id=b.interpretation_id
JOIN source_passages sp ON sp.id=b.source_passage_id;

DROP TABLE _citation_backfill;
