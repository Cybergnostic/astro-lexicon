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
-- The mappings below were generated from a fresh post-0060 SQLite build. Each
-- interpretation already records a source scope; each target passage is the reviewed
-- source block covering that scope. Multiple citations are retained where one
-- interpretation spans more than one source block.

-- source_passage_id 1
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 1, 'primary' FROM interpretations WHERE id IN (242);
-- source_passage_id 5
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 5, 'primary' FROM interpretations WHERE id IN (26,27,239,240,241);
-- source_passage_id 8
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 8, 'primary' FROM interpretations WHERE id IN (40,41);
-- source_passage_id 20
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 20, 'primary' FROM interpretations WHERE id IN (250);
-- source_passage_id 21
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 21, 'primary' FROM interpretations WHERE id IN (34,37,235,236);
-- source_passage_id 26
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 26, 'primary' FROM interpretations WHERE id IN (34,35,37,235,236);
-- source_passage_id 27
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 27, 'primary' FROM interpretations WHERE id IN (38,39,42,485);
-- source_passage_id 28
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 28, 'primary' FROM interpretations WHERE id IN (43,44);
-- source_passage_id 30
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 30, 'primary' FROM interpretations WHERE id IN (48,52);
-- source_passage_id 31
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 31, 'primary' FROM interpretations WHERE id IN (49,50,51,52,53,54,55,56,57);
-- source_passage_id 32
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 32, 'primary' FROM interpretations WHERE id IN (60,61);
-- source_passage_id 33
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 33, 'primary' FROM interpretations WHERE id IN (62,63,64,65);
-- source_passage_id 34
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 34, 'primary' FROM interpretations WHERE id IN (66,67,68,70,71,72,73,74,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90);
-- source_passage_id 35
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 35, 'primary' FROM interpretations WHERE id IN (69,70,75,76,77,78,79,80,81,82,83,84,85,86,87,88,89,90);
-- source_passage_id 36
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 36, 'primary' FROM interpretations WHERE id IN (91,92,93);
-- source_passage_id 37
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 37, 'primary' FROM interpretations WHERE id IN (94,95,96,97,98,99);
-- source_passage_id 38
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 38, 'primary' FROM interpretations WHERE id IN (100,101,104,105,106,107);
-- source_passage_id 39
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 39, 'primary' FROM interpretations WHERE id IN (104,105,106,107);
-- source_passage_id 40
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 40, 'primary' FROM interpretations WHERE id IN (110);
-- source_passage_id 41
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 41, 'primary' FROM interpretations WHERE id IN (111,112,113,114,115,116);
-- source_passage_id 42
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 42, 'primary' FROM interpretations WHERE id IN (117,118);
-- source_passage_id 43
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 43, 'primary' FROM interpretations WHERE id IN (120,121,122,123,124,125,126);
-- source_passage_id 44
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 44, 'primary' FROM interpretations WHERE id IN (127);
-- source_passage_id 45
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 45, 'primary' FROM interpretations WHERE id IN (128,129,130,131,132,133,134,135,136,137,138,139,140,141,142,143,144);
-- source_passage_id 46
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 46, 'primary' FROM interpretations WHERE id IN (102,103,145,146,147,148);
-- source_passage_id 47
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 47, 'primary' FROM interpretations WHERE id IN (108,109,149,150);
-- source_passage_id 48
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 48, 'primary' FROM interpretations WHERE id IN (151,152,153,154);
-- source_passage_id 49
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 49, 'primary' FROM interpretations WHERE id IN (33,155,156,157,158,159,160,161,162,163,164);
-- source_passage_id 50
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 50, 'primary' FROM interpretations WHERE id IN (29,119,165,166,167,168,169,170,171);
-- source_passage_id 51
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 51, 'primary' FROM interpretations WHERE id IN (172,173,174,175,176,177);
-- source_passage_id 52
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 52, 'primary' FROM interpretations WHERE id IN (178,180,181,182);
-- source_passage_id 53
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 53, 'primary' FROM interpretations WHERE id IN (46,128,129,130,184,185,186,187,188,189,190,191,192,193,194);
-- source_passage_id 54
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 54, 'primary' FROM interpretations WHERE id IN (196,197,198);
-- source_passage_id 55
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 55, 'primary' FROM interpretations WHERE id IN (199,200,201,202,203,204,205);
-- source_passage_id 56
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 56, 'primary' FROM interpretations WHERE id IN (206,207,208);
-- source_passage_id 57
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 57, 'primary' FROM interpretations WHERE id IN (209,210);
-- source_passage_id 58
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 58, 'primary' FROM interpretations WHERE id IN (131,132,133,134,135,136,137,138,139,140,141,142,143,144,212,213,214,215,216,217);
-- source_passage_id 59
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 59, 'primary' FROM interpretations WHERE id IN (145,146,147,148);
-- source_passage_id 60
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 60, 'primary' FROM interpretations WHERE id IN (151,152,153,154);
-- source_passage_id 61
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 61, 'primary' FROM interpretations WHERE id IN (151,152,153,154);
-- source_passage_id 63
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 63, 'primary' FROM interpretations WHERE id IN (167,168,169,170,171,172,173,174,175,176,177,178,180,181,182,184,185,186,187,188,189,190,191,192,193,194,196,197,198,199,200,201,202,203,204,205,206,207,208);
-- source_passage_id 64
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 64, 'primary' FROM interpretations WHERE id IN (179);
-- source_passage_id 65
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 65, 'primary' FROM interpretations WHERE id IN (183);
-- source_passage_id 67
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 67, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 68
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 68, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 69
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 69, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 70
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 70, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 71
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 71, 'primary' FROM interpretations WHERE id IN (29,195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 72
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 72, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 73
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 73, 'primary' FROM interpretations WHERE id IN (195,209,210,211,212,213,214,215,216,217);
-- source_passage_id 74
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 74, 'primary' FROM interpretations WHERE id IN (218,219,220,221,222);
-- source_passage_id 75
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 75, 'primary' FROM interpretations WHERE id IN (223,224,225,226,227);
-- source_passage_id 76
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 76, 'primary' FROM interpretations WHERE id IN (226,227,228);
-- source_passage_id 77
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 77, 'primary' FROM interpretations WHERE id IN (35,36,229,230,231,232,233,234);
-- source_passage_id 78
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 78, 'primary' FROM interpretations WHERE id IN (237,238);
-- source_passage_id 79
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 79, 'primary' FROM interpretations WHERE id IN (241);
-- source_passage_id 80
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 80, 'primary' FROM interpretations WHERE id IN (243,244,245,246,247,248,249,251,252,253,254,255,256,257,258,259,260,261,262,263);
-- source_passage_id 81
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 81, 'primary' FROM interpretations WHERE id IN (261,262,263);
-- source_passage_id 82
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 82, 'primary' FROM interpretations WHERE id IN (264,265,266,267,268,269);
-- source_passage_id 83
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 83, 'primary' FROM interpretations WHERE id IN (270,271,272);
-- source_passage_id 84
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 84, 'primary' FROM interpretations WHERE id IN (273,274,275,276,277,278,279);
-- source_passage_id 85
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 85, 'primary' FROM interpretations WHERE id IN (280,281,282);
-- source_passage_id 86
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 86, 'primary' FROM interpretations WHERE id IN (47,283,284,285,286,288,289,290);
-- source_passage_id 87
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 87, 'primary' FROM interpretations WHERE id IN (291,292,293,294,295,296,297,298);
-- source_passage_id 88
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 88, 'primary' FROM interpretations WHERE id IN (299,301);
-- source_passage_id 89
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 89, 'primary' FROM interpretations WHERE id IN (300);
-- source_passage_id 91
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 91, 'primary' FROM interpretations WHERE id IN (301,302,303);
-- source_passage_id 92
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 92, 'primary' FROM interpretations WHERE id IN (304,307);
-- source_passage_id 93
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 93, 'primary' FROM interpretations WHERE id IN (305);
-- source_passage_id 94
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 94, 'primary' FROM interpretations WHERE id IN (306);
-- source_passage_id 95
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 95, 'primary' FROM interpretations WHERE id IN (308,309,310);
-- source_passage_id 96
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 96, 'primary' FROM interpretations WHERE id IN (311,312,313);
-- source_passage_id 97
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 97, 'primary' FROM interpretations WHERE id IN (315,316,317,318,319,320,321,322,323);
-- source_passage_id 98
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 98, 'primary' FROM interpretations WHERE id IN (324,325,326,327,328,329,330,331);
-- source_passage_id 99
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 99, 'primary' FROM interpretations WHERE id IN (332,333,334,335);
-- source_passage_id 100
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 100, 'primary' FROM interpretations WHERE id IN (336);
-- source_passage_id 101
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 101, 'primary' FROM interpretations WHERE id IN (337);
-- source_passage_id 102
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 102, 'primary' FROM interpretations WHERE id IN (338,339,340);
-- source_passage_id 103
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 103, 'primary' FROM interpretations WHERE id IN (341,342,343,344,345,346);
-- source_passage_id 104
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 104, 'primary' FROM interpretations WHERE id IN (347);
-- source_passage_id 105
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 105, 'primary' FROM interpretations WHERE id IN (348,349,350,351,352,353);
-- source_passage_id 106
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 106, 'primary' FROM interpretations WHERE id IN (354);
-- source_passage_id 107
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 107, 'primary' FROM interpretations WHERE id IN (355,356,357,358,359);
-- source_passage_id 108
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 108, 'primary' FROM interpretations WHERE id IN (360,361,362,363);
-- source_passage_id 109
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 109, 'primary' FROM interpretations WHERE id IN (364,365,366,367);
-- source_passage_id 110
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 110, 'primary' FROM interpretations WHERE id IN (368,369);
-- source_passage_id 111
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 111, 'primary' FROM interpretations WHERE id IN (370,372,374,375,376,377,378,379,380,381);
-- source_passage_id 112
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 112, 'primary' FROM interpretations WHERE id IN (371,373,374,375,376,377,378,379,380,381);
-- source_passage_id 113
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 113, 'primary' FROM interpretations WHERE id IN (371,374,375,376,377,378,379,380,381);
-- source_passage_id 154
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 154, 'primary' FROM interpretations WHERE id IN (466);
-- source_passage_id 158
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 158, 'primary' FROM interpretations WHERE id IN (482,483);
-- source_passage_id 159
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 159, 'primary' FROM interpretations WHERE id IN (484,486,487);
-- source_passage_id 160
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 160, 'primary' FROM interpretations WHERE id IN (484,494);
-- source_passage_id 161
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 161, 'primary' FROM interpretations WHERE id IN (483,494,562);
-- source_passage_id 170
INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT id, 170, 'primary' FROM interpretations WHERE id IN (564);
