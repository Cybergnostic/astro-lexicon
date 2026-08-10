-- Editorial family pass: reconcile orientality / occidentality and repair a misfiled
-- Bonatti latitude interpretation.
--
-- The corpus had three related problems:
--   1. one Bonatti latitude interpretation was attached to Orientality even though it
--      describes north/south ecliptic latitude rather than solar phase;
--   2. later gap-filling created duplicate Oriental / Occidental headwords beside the
--      already source-backed Orientality / Occidentality entries;
--   3. the surviving source-backed entries had no reader-facing teaching article.
--
-- This pass fixes the ontology first, then publishes the paired solar-phase family without
-- reducing the historical doctrine to a simple east-of-Sun / west-of-Sun binary.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- REPAIR THE MISFILED BONATTI LATITUDE EVIDENCE
-- -----------------------------------------------------------------------------
UPDATE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='celestial-latitude'),
    summary='Bonatti describes planetary latitude as motion north or south of the Sun’s path/ecliptic, with the planet crossing the relevant intersection and passing through ascending and descending portions of its latitude cycle.',
    scope='Third Tractatus, Part II, Chapter II: planetary latitude',
    status='reviewed',
    evidence_grade='A'
WHERE term_id=(SELECT id FROM terms WHERE slug='orientality')
  AND work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND scope='Third Tractatus, Part II, Chapter II';

-- -----------------------------------------------------------------------------
-- NORMALIZE DUPLICATE ADJECTIVAL HEADWORDS INTO THE SOURCE-BACKED NOUN ENTRIES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Oriental','English','grammatical-variant',
       'Adjectival form of Orientality in traditional solar-phase language.'
FROM terms WHERE slug='orientality';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Eastern','English','translation-variant',
       'Contextual translation used for the oriental/eastern solar-phase condition.'
FROM terms WHERE slug='orientality';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Occidental','English','grammatical-variant',
       'Adjectival form of Occidentality in traditional solar-phase language.'
FROM terms WHERE slug='occidentality';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Western','English','translation-variant',
       'Contextual translation used for the occidental/western solar-phase condition.'
FROM terms WHERE slug='occidentality';

-- Preserve any additional aliases created on the duplicate gap-fill entries.
UPDATE OR IGNORE aliases
SET term_id=(SELECT id FROM terms WHERE slug='orientality')
WHERE term_id=(SELECT id FROM terms WHERE slug='oriental');
DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='oriental');

UPDATE OR IGNORE aliases
SET term_id=(SELECT id FROM terms WHERE slug='occidentality')
WHERE term_id=(SELECT id FROM terms WHERE slug='occidental');
DELETE FROM aliases WHERE term_id=(SELECT id FROM terms WHERE slug='occidental');

-- Move any relation endpoints to the canonical pair, then remove duplicate leftovers.
UPDATE OR IGNORE term_relations
SET subject_term_id=(SELECT id FROM terms WHERE slug='orientality')
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='oriental');
UPDATE OR IGNORE term_relations
SET object_term_id=(SELECT id FROM terms WHERE slug='orientality')
WHERE object_term_id=(SELECT id FROM terms WHERE slug='oriental');
UPDATE OR IGNORE term_relations
SET subject_term_id=(SELECT id FROM terms WHERE slug='occidentality')
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='occidental');
UPDATE OR IGNORE term_relations
SET object_term_id=(SELECT id FROM terms WHERE slug='occidentality')
WHERE object_term_id=(SELECT id FROM terms WHERE slug='occidental');
DELETE FROM term_relations
WHERE subject_term_id IN (SELECT id FROM terms WHERE slug IN ('oriental','occidental'))
   OR object_term_id IN (SELECT id FROM terms WHERE slug IN ('oriental','occidental'));

DELETE FROM terms WHERE slug IN ('oriental','occidental');

-- -----------------------------------------------------------------------------
-- CANONICAL DEFINITIONS AND RELATIONS
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Orientality / Oriental',
  short_definition='A traditional solar-phase condition describing a planet in an oriental phase relative to the Sun. Its recognition depends on planetary class, direction of motion and position within the synodic cycle, so it cannot be reduced to a simple generic rule of being east of the Sun.',
  category='solar phase and accidental condition',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Source-backed by al-Bīrūnī and Bonatti. Both distinguish superior and inferior planets and treat orientality as a phase-sensitive condition. Do not flatten the doctrine into one east/west longitude test.'
WHERE slug='orientality';

UPDATE terms SET
  label='Occidentality / Occidental',
  short_definition='A traditional solar-phase condition describing a planet in an occidental phase relative to the Sun. Its recognition depends on planetary class, direction of motion and synodic phase, and is therefore more specific than a simple generic rule of being west of the Sun.',
  category='solar phase and accidental condition',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Paired with Orientality. Bonatti explicitly distinguishes strong and weak oriental and occidental phases within the solar cycle; source-specific thresholds and phase rules remain attached to source accounts.'
WHERE slug='occidentality';

UPDATE interpretations
SET evidence_grade='A', status='reviewed'
WHERE certainty='direct'
  AND term_id IN (SELECT id FROM terms WHERE slug IN ('orientality','occidentality'));

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with',
       'Orientality and Occidentality are paired solar-phase conditions; their exact recognition is phase- and planet-class-sensitive.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='orientality' AND b.slug='occidentality';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with',
       'Occidentality and Orientality are paired solar-phase conditions; their exact recognition is phase- and planet-class-sensitive.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='occidentality' AND b.slug='orientality';

-- -----------------------------------------------------------------------------
-- ORIENTALITY TEACHING ARTICLE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Orientality is a solar-phase condition describing a planet in an oriental relationship to the Sun. In traditional sources this is not merely a statement that the planet lies “east of the Sun.” Al-Bīrūnī and Bonatti both make the condition depend on the planet’s place in its synodic cycle, and they distinguish the behavior of superior planets from that of Venus and Mercury.',
  'reviewed',
  'Cross-source synthesis of reviewed al-Bīrūnī §§481–486 and Bonatti Third Tractatus II.V–VIII evidence after removal of a misfiled latitude interpretation.'
FROM terms WHERE slug='orientality';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='orientality');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'phase-not-direction','A phase condition, not a bare compass label',
  'Traditional oriental/occidental language belongs to planetary solar-phase doctrine. The relevant question is where the planet stands in its cycle with the Sun, including visibility, direct or retrograde motion and whether the planet is superior or inferior. A simple comparison of two longitudes is therefore not enough to reproduce the historical rule.',
  10,'reviewed',NULL
FROM terms WHERE slug='orientality';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'planetary-classes','Superior and inferior planets are treated differently',
  'Al-Bīrūnī explicitly warns that orientality and occidentality must be read differently for superior and inferior planets. Bonatti likewise gives an extended phase sequence rather than one universal east/west definition. The encyclopedia therefore keeps detailed thresholds and phase boundaries attached to individual source accounts instead of converting them into a single timeless rule.',
  20,'reviewed',NULL
FROM terms WHERE slug='orientality';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'solar-family','Part of a larger solar-condition family',
  'Orientality belongs to the same broad solar-condition framework as emergence from the rays, combustion, being under the beams and other visibility phases. These conditions describe different positions in the planet–Sun cycle and should not be treated as interchangeable labels.',
  30,'reviewed',NULL
FROM terms WHERE slug='orientality';

-- -----------------------------------------------------------------------------
-- OCCIDENTALITY TEACHING ARTICLE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Occidentality is the paired solar-phase condition opposite Orientality. It describes an occidental relationship to the Sun within a planet’s synodic cycle, but the historical rule is phase-sensitive: superior and inferior planets do not pass through the solar cycle in the same way, and source authors distinguish stronger and weaker occidental phases.',
  'reviewed',
  'Teaching synthesis centered on reviewed Bonatti solar-phase evidence and the paired al-Bīrūnī orientality/occidentality discussion.'
FROM terms WHERE slug='occidentality';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='occidentality');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired-phase','The counterpart of Orientality',
  'Orientality and Occidentality form a paired vocabulary for the planet’s changing relationship with the Sun. The terms describe portions of a synodic sequence rather than two permanent planetary properties. A planet changes from one phase family to another as its motion and solar relationship change.',
  10,'reviewed',NULL
FROM terms WHERE slug='occidentality';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-simple-west','Not simply “west of the Sun”',
  'Bonatti distinguishes strong and weak occidental phases and places them within a larger sequence involving direct motion, retrogradation, solar obscuration and emergence from the rays. For that reason, “western” is a useful translation label but not a sufficient recognition rule by itself.',
  20,'reviewed',NULL
FROM terms WHERE slug='occidentality';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-variation','Keep exact phase rules source-specific',
  'Historical authors organize solar visibility and phase boundaries with different thresholds and terminology. The stable encyclopedia-level concept is the phase relationship itself; exact angular limits and special cases belong to the relevant source account.',
  30,'reviewed',NULL
FROM terms WHERE slug='occidentality';

-- -----------------------------------------------------------------------------
-- FAMILY-SPECIFIC PAGE COMPOSITION
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('orientality','occidentality'));

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'solar-phase-doctrine','Solar-phase doctrine',10,'reviewed',
  'Family-specific composition for the reconciled oriental/occidental solar-phase entries.'
FROM terms WHERE slug IN ('orientality','occidentality');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for reconciled solar-phase doctrine.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='solar-phase-doctrine'
  AND s.status IN ('reviewed','published');
