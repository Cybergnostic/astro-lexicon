-- Ontology cleanup: late curriculum identities that duplicate earlier source-backed canonicals.
--
-- These terms were added after the historical reconciliation pass and accidentally recreated
-- concepts that already had canonical, source-backed identities. Preserve source evidence and
-- graph relations before removing the duplicate headwords; keep the richer canonical articles.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- FIRDARIA -> FARDAR
-- -----------------------------------------------------------------------------
-- `fardar` is the source-reconciled identity and already carries Firdaria/Firdārīyah aliases,
-- direct Abū Maʿshar, al-Bīrūnī and Bonatti evidence, and the explicit distinction from Lilly's
-- Alfridary. The later `firdaria` row added no distinct technique.

UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='fardar')
WHERE term_id=(SELECT id FROM terms WHERE slug='firdaria');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT (SELECT id FROM terms WHERE slug='fardar'), object_term_id, relation_type, note, status
FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='firdaria')
  AND object_term_id<>(SELECT id FROM terms WHERE slug='fardar');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT subject_term_id, (SELECT id FROM terms WHERE slug='fardar'), relation_type, note, status
FROM term_relations
WHERE object_term_id=(SELECT id FROM terms WHERE slug='firdaria')
  AND subject_term_id<>(SELECT id FROM terms WHERE slug='fardar');

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='firdaria')
   OR object_term_id=(SELECT id FROM terms WHERE slug='firdaria');
DELETE FROM terms WHERE slug='firdaria';

-- -----------------------------------------------------------------------------
-- SOLAR RETURN -> SOLAR REVOLUTION
-- -----------------------------------------------------------------------------
-- The historical reconciliation already established `solar-revolution` as the canonical natal
-- annual revolution: the exact return of the Sun to its radical longitude. "Solar Return" is
-- therefore retained as an English alias rather than a second public headword.

INSERT OR IGNORE INTO aliases(term_id,label,language,alias_type,scope_note)
SELECT id,'Solar Return','English','modern-name',
       'Common modern English name for the natal solar revolution.'
FROM terms WHERE slug='solar-revolution';

UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='solar-revolution')
WHERE term_id=(SELECT id FROM terms WHERE slug='solar-return');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT (SELECT id FROM terms WHERE slug='solar-revolution'), object_term_id, relation_type, note, status
FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='solar-return')
  AND object_term_id<>(SELECT id FROM terms WHERE slug='solar-revolution');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT subject_term_id, (SELECT id FROM terms WHERE slug='solar-revolution'), relation_type, note, status
FROM term_relations
WHERE object_term_id=(SELECT id FROM terms WHERE slug='solar-return')
  AND subject_term_id<>(SELECT id FROM terms WHERE slug='solar-revolution');

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='solar-return')
   OR object_term_id=(SELECT id FROM terms WHERE slug='solar-return');
DELETE FROM terms WHERE slug='solar-return';

-- -----------------------------------------------------------------------------
-- LORD-OF-THE-YEAR -> LORD-OF-YEAR
-- -----------------------------------------------------------------------------
-- The later curriculum row reduced the title to the ruler of the annual profected sign. The
-- source-backed corpus already separates the generic `lord-of-year` role from Bonatti's more
-- specific profectional `salkhuday`. Keep the generic canonical identity and its source-specific
-- algorithms; do not let the late duplicate flatten that distinction.

UPDATE OR IGNORE interpretations
SET term_id=(SELECT id FROM terms WHERE slug='lord-of-year')
WHERE term_id=(SELECT id FROM terms WHERE slug='lord-of-the-year');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT (SELECT id FROM terms WHERE slug='lord-of-year'), object_term_id, relation_type, note, status
FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='lord-of-the-year')
  AND object_term_id<>(SELECT id FROM terms WHERE slug='lord-of-year');

INSERT OR IGNORE INTO term_relations(subject_term_id,object_term_id,relation_type,note,status)
SELECT subject_term_id, (SELECT id FROM terms WHERE slug='lord-of-year'), relation_type, note, status
FROM term_relations
WHERE object_term_id=(SELECT id FROM terms WHERE slug='lord-of-the-year')
  AND subject_term_id<>(SELECT id FROM terms WHERE slug='lord-of-year');

DELETE FROM term_relations
WHERE subject_term_id=(SELECT id FROM terms WHERE slug='lord-of-the-year')
   OR object_term_id=(SELECT id FROM terms WHERE slug='lord-of-the-year');
DELETE FROM terms WHERE slug='lord-of-the-year';
