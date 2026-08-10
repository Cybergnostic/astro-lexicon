-- Bird's-eye encyclopedia review: predictive terminology and time-lord systems.
--
-- This pass is comparative, not procedural. It first repairs later curriculum seeds that
-- accidentally reintroduced concepts already reconciled under source-backed canonical slugs,
-- then maps the surviving techniques by the kind of temporal structure they use.
--
-- Direct public check added here: Ptolemy, Tetrabiblos IV.10, for the seven ages of life.
-- Other historical claims remain grounded in the existing project corpus.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- RECONCILE LATE DUPLICATE HEADWORDS
-- -----------------------------------------------------------------------------

-- `fardar` was already source-backed and cross-source reconciled before the later
-- curriculum seed created a second `firdaria` term. Preserve useful search forms on the
-- canonical term and remove the duplicate headword.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Firdariyyah','English','transliteration-variant','Alternative transliteration retained from the later curriculum-discovered duplicate.'
FROM terms WHERE slug='fardar';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Firdaria, or fardār, is a medieval planetary time-lord system of unequal major periods. The sequence begins from the sect luminary—Sun by day and Moon by night—and planetary periods are subdivided into successive associations or subperiods. The exact historical form represented here is source-backed by Abū Maʿshar, al-Bīrūnī and Bonatti and must remain distinct from Lilly’s fixed seven-year Alfridary system.',
  'reviewed','Bird’s-eye predictive review. Canonical slug remains `fardar`; later duplicate `firdaria` removed.'
FROM terms WHERE slug='fardar';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'unequal-periods','Unequal periods and subperiod participation',
  'Firdaria assigns different major durations to different planetary rulers. Within a planetary period the other traditional planets participate through a sequence of subperiods or associations. This unequal period structure is one of the main reasons the system should not be merged with every later technique whose name resembles firdaria.',10,'reviewed',NULL
FROM terms WHERE slug='fardar';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-alfridary','Firdaria is not Lilly’s Alfridary',
  'The names are historically related, but the systems preserved in the current corpus are operationally different. Medieval Firdaria uses unequal planetary periods with subperiod participation; Lilly’s Alfridary assigns a fixed seven years to each successive planetary ruler. The encyclopedia therefore keeps them as related but distinct entries.',20,'reviewed',NULL
FROM terms WHERE slug='fardar';

DELETE FROM terms WHERE slug='firdaria';

-- The cross-source revision already established `solar-revolution` as the source-backed
-- natal annual return. The later curriculum seed created a second `solar-return` term.
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Solar Return','English','modern-common-name','Common modern English name for the natal Solar Revolution.'
FROM terms WHERE slug='solar-revolution';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Solar Revolution, commonly called a Solar Return, is the annual figure erected for the Sun’s return to its exact radical zodiacal longitude. It belongs to the wider annual-revolution family and should be distinguished from annual profection, which advances a reference point by a regular zodiacal time scale rather than waiting for an astronomical return.',
  'reviewed','Bird’s-eye predictive review. Canonical source-backed slug remains `solar-revolution`; later duplicate `solar-return` removed.'
FROM terms WHERE slug='solar-revolution';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'solar-vs-lunar','Solar and lunar returns',
  'Both are return/revolution charts defined by recurrence to a natal zodiacal position; the body and timescale differ.',
  '["Feature","Solar Revolution / Return","Lunar Return"]',
  '[["Returning body","Sun","Moon"],["Typical recurrence","Annual","Monthly-scale"],["Canonical family","Annual revolution","Return / revolution chart"],["Key distinction","Exact solar recurrence to radical longitude","Exact lunar recurrence to radical longitude"]]',
  50,'reviewed','Comparison of chart identities only; location conventions and judgment procedures remain source-sensitive.'
FROM terms WHERE slug='solar-revolution';

DELETE FROM terms WHERE slug='solar-return';

-- Likewise, `lord-of-year` was already a source-backed, deliberately broad annual role.
-- The later `lord-of-the-year` term narrowed it to one profectional use and duplicated the
-- public label. Preserve the useful profection relation on the canonical role.
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'can-be-derived-from',
       'In annual profection the ruler of the profected sign can serve as Lord of the Year, but the title has broader source-specific annual uses and must not be reduced to this one derivation.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='lord-of-year' AND b.slug='annual-profection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'role-not-formula','A role whose selection method must be named',
  'Lord of the Year is a chronological office, not one universal calculation. Annual profection can supply a yearly ruler, while annual-revolution traditions can select rulers by other hierarchies. A precise encyclopedia statement therefore names both the planet and the method that granted the annual role.',10,'reviewed',NULL
FROM terms WHERE slug='lord-of-year';

DELETE FROM terms WHERE slug='lord-of-the-year';

-- -----------------------------------------------------------------------------
-- DIRECT PTOLEMY WITNESS FOR THE AGES OF LIFE
-- -----------------------------------------------------------------------------

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'443','449','Book IV','10','Ages of life',
       'Tetrabiblos IV.10: general ages of life assigned successively to Moon, Mercury, Venus, Sun, Mars, Jupiter and Saturn.',
       NULL,
       'Direct public witness checked in the Robbins text as presented by LacusCurtius. The repository stores an original summary and structured age spans, not copied prose.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Ages of life'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
  'Ptolemy assigns the general ages of life in planetary order from the nearest sphere outward: Moon for about the first four years, Mercury for the next ten, Venus for eight, the Sun for nineteen, Mars for fifteen, Jupiter for twelve, and Saturn for the remainder of old age. He treats this as a general life-stage framework before turning to chart-specific temporal divisions.',
  'Tetrabiblos IV.10: general ages of life','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='ptolemaic-ages' AND w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Tetrabiblos IV.10: general ages of life'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='ptolemaic-ages'
  AND w.slug='ptolemy-tetrabiblos'
  AND sp.section='Ages of life';

UPDATE terms SET
  short_definition='Ptolemy’s general seven-stage division of life assigns successive ages to the Moon, Mercury, Venus, Sun, Mars, Jupiter and Saturn, using planetary period numbers before the final Saturnian remainder of life.',
  definition_quality=5,
  editorial_notes='Directly verified against Ptolemy, Tetrabiblos IV.10 during the bird’s-eye predictive review. This is a general life-stage doctrine, not an individual lifespan calculation.'
WHERE slug='ptolemaic-ages';

UPDATE term_article_tables
SET caption='Ptolemy’s general life-stage sequence in Tetrabiblos IV.10. Age notation converts his successive durations into modern inclusive age spans; this is not a prediction of individual lifespan.',
    editorial_notes='Direct Ptolemy witness now attached in seed 0164.'
WHERE term_id=(SELECT id FROM terms WHERE slug='ptolemaic-ages')
  AND table_key='planetary-age-sequence';

-- -----------------------------------------------------------------------------
-- NORMALIZED PREDICTIVE FAMILIES
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('time-lord-chronology','Time Lords and Chronological Rulers',
   'Techniques and roles that allocate periods of time to planets or zodiacal rulers, together with related general chronological doctrines that should not be mistaken for one another.',
   'mechanics',
   'Bird’s-eye predictive family. A shared purpose—organizing time—does not imply a shared calculation or historical identity.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('fardar','period-system','Planetary period system',10,'Unequal medieval Firdaria periods beginning from the sect luminary, with subperiod participation.'),
  ('alfridary','period-system','Planetary period system',20,'Lilly’s distinct fixed seven-year planetary sequence.'),
  ('profection','zodiacal-advancement','Zodiacal time-lord system',30,'Regular advancement of a starting point through the zodiac.'),
  ('annual-profection','zodiacal-advancement','Zodiacal time-lord system',40,'Annual scale of profection.'),
  ('monthly-profection','zodiacal-advancement','Zodiacal time-lord system',50,'Shorter profection scale; exact historical subdivision rules remain source-sensitive.'),
  ('profected-sign','result-role','Result / role',60,'The sign reached by a profection, not a separate predictive technique.'),
  ('lord-of-year','result-role','Result / role',70,'Annual planetary ruler whose selection method must be stated.'),
  ('planetary-years','temporal-quantity','Temporal quantities',80,'Assigned planetary year-values used as quantities in several procedures, not a single chronological sequence.'),
  ('ptolemaic-ages','general-age-model','General age model',90,'Ptolemy’s general sequence of human life stages; distinct from chart-specific time-lord assignment.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='time-lord-chronology'
JOIN terms t ON t.slug=m.term_slug;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('directions-distributions','Directions and Distributions',
   'The family of directing techniques that move or carry a significator/promissor relationship through celestial geometry and, in distributions, through successive bounds with distributor and participator roles.',
   'mechanics',
   'Bird’s-eye predictive family. Geometry, time key and historical calculation variants remain source-specific; this map is terminology, not a direction-calculation recipe.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('primary-direction','direction-system','Direction system',10,'Primary-motion directing family.'),
  ('directional-significator','formal-role','Formal role',20,'Receiving or directed factor in a primary direction.'),
  ('promissor','formal-role','Formal role',30,'Factor whose influence is directed toward the significator.'),
  ('distribution','bound-period-system','Bound-period system',40,'Directed significator passes through successive bounds/terms.'),
  ('distributor','distribution-role','Distribution role',50,'Ruler of the bound currently occupied by the directed significator.'),
  ('participator','distribution-role','Distribution role',60,'Secondary planet joining a distributor’s period through a relevant contact.'),
  ('solar-direction','source-audit-open','Source audit open',70,'Curriculum-discovered annual directing term; direct historical terminology/provenance remains unresolved in the current public corpus.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='directions-distributions'
JOIN terms t ON t.slug=m.term_slug;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('revolutions-returns','Revolutions and Return Charts',
   'Figures erected for recurring celestial positions or annual starting points, together with the annual rulers attached to those revolutions in particular historical systems.',
   'mechanics',
   'Bird’s-eye predictive family. An astronomical return/revolution is not the same mechanism as profection or direction, even when techniques are combined in practice.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('revolution-chart','framework','Return-chart framework',10,'Generic return/revolution-chart family.'),
  ('annual-revolution','annual-framework','Annual revolution',20,'General annual solar-recurrence figure; exact starting point depends on the kind of revolution.'),
  ('solar-revolution','annual-framework','Annual revolution',30,'Natal annual revolution: Sun returns to exact radical longitude; commonly Solar Return.'),
  ('world-year-revolution','annual-framework','Annual revolution',40,'Mundane world-year revolution based on the solar Aries ingress.'),
  ('lunar-return','short-return','Shorter return',50,'Moon returns to its natal zodiacal position on a monthly-scale recurrence.'),
  ('lord-of-revolution','annual-role','Revolution role',60,'Planet governing the effective span of a particular revolution in source-specific doctrine.'),
  ('divisions','source-audit-open','Source audit open',70,'Curriculum-discovered annual period technique; direct historical provenance/variants remain unresolved in the current public corpus.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='revolutions-returns'
JOIN terms t ON t.slug=m.term_slug;

-- -----------------------------------------------------------------------------
-- COMPARATIVE PEDAGOGY: SAME PURPOSE, DIFFERENT MECHANISMS
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'predictive-mechanism-comparison','Different ways traditional techniques organize time',
  'These families may be compared, but they should not be blended into one generic “prediction” mechanic.',
  '["Family","What changes with time","Typical output"]',
  '[["Firdaria / Alfridary","Planetary period ruler changes according to a fixed sequence","Major period ruler and, in Firdaria, subperiod participant"],["Profection","A zodiacal reference advances at a regular temporal rate","Profected sign and chronologically active ruler"],["Primary directions / distributions","A directed celestial relationship advances through directional geometry and bounds","Directed contact, distributor and possible participator"],["Revolutions / returns","A celestial body returns to a specified zodiacal position and a new figure is erected","Annual or shorter return/revolution chart"],["Ptolemaic Ages","General human life stage changes according to a planetary sequence","Age-stage ruler; not a chart-specific time lord"]]',
  5,'reviewed','Comparative encyclopedia table only; no ordered forecasting workflow.'
FROM terms WHERE slug='profection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-return','Profection is not a return chart',
  'Profection advances a reference point by a symbolic temporal rate; it does not wait for the Sun, Moon or another body to return astronomically to its natal longitude. A Solar Revolution is therefore a different kind of timing structure even when historical practice compares both techniques for the same year.',30,'reviewed',NULL
FROM terms WHERE slug='profection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-profection','A revolution is based on recurrence, not symbolic zodiacal advancement',
  'A Solar Revolution is defined by the Sun’s actual return to its radical longitude. Annual profection, by contrast, advances through the zodiac according to a regular year-to-sign correspondence. Their coexistence in annual practice does not make them two names for the same technique.',15,'reviewed',NULL
FROM terms WHERE slug='solar-revolution';

UPDATE terms SET
  editorial_notes='Curriculum-discovered terminology. Direct historical terminology and source provenance remain unresolved in the current public corpus; keep visibly marked as source-audit-open and do not treat as source-settled.'
WHERE slug IN ('solar-direction','divisions');
