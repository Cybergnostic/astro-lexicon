-- Bonatti compiled-PDF edition provenance repair.
-- Run after the extraction/revision seeds so existing source_passage rows can be reassigned
-- without rewriting historical seed files.
--
-- The research PDF is a compilation of several separately published English translations.
-- The original 0001_sources.sql represented the whole compilation as one Robert Zoller /
-- Project Hindsight edition. That is correct only for the opening Project Hindsight material
-- and would misattribute Benjamin Dykes and Robert Hand translations if left unchanged.
--
-- This seed changes provenance metadata only. It does not alter any interpretation text.

-- -----------------------------------------------------------------------------
-- BASE / OPENING PROJECT HINDSIGHT EDITION
-- -----------------------------------------------------------------------------

UPDATE editions
SET label='Project Hindsight Latin Track, Part I, Volume VII',
    translator='Robert Zoller',
    editor='Robert Hand',
    publisher='The Golden Hind Press',
    publication_year=1994,
    source_language='Latin',
    target_language='English',
    copyright_note='Copyrighted Project Hindsight translation; do not redistribute source PDF.',
    local_source_key='bonatti-project-hindsight-zoller-1994'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND label='Project Hindsight translation, nine parts';

UPDATE works
SET notes='Initial research source is a compiled PDF containing several distinct English translations/editions. Source passages are reassigned to the correct edition row by this provenance-repair seed.'
WHERE slug='bonatti-liber-astronomiae';

-- -----------------------------------------------------------------------------
-- DISTINCT EDITIONS PRESENT IN THE COMPILED PDF
-- -----------------------------------------------------------------------------

-- Treatises 4, 8.1 and 10: title page states Benjamin N. Dykes, from the 1491 and
-- 1550 Latin editions, Cazimi Press, Minneapolis, 2010.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Bonatti on Mundane Astrology: Treatises 4, 8.1 & 10, Cazimi Press 2010',
       'Benjamin N. Dykes', NULL, 'The Cazimi Press', 2010, 'Minneapolis, Minnesota',
       NULL, 'Latin', 'English',
       'Copyrighted translation/edition; translated from the 1491 and 1550 Latin editions. Do not redistribute source PDF.',
       'bonatti-mundane-dykes-2010'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- Treatise 5: title material names Benjamin N. Dykes and the 1491/1550 Latin editions.
-- The title page prints 2010 while the publisher note dates this reprint January 2012 and
-- says it was excerpted from the 2007 first edition. Record the reprint date and preserve
-- the discrepancy explicitly rather than silently selecting one title-page convention.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Bonatti’s 146 Considerations, Cazimi reprint (publisher note 2012; title page 2010)',
       'Benjamin N. Dykes', NULL, 'The Cazimi Press', 2012, 'Minneapolis, Minnesota',
       NULL, 'Latin', 'English',
       'Copyrighted translation/edition; reprint excerpted from the 2007 first edition. Title page prints 2010; publisher note is January 2012.',
       'bonatti-146-considerations-dykes-2012'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- Treatise 6, Horary Part I: Project Hindsight Latin Track Volume XIII, Robert Hand
-- translator, Robert Schmidt editor; copyright 1996 Robert Hand, Golden Hind Press.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Project Hindsight Latin Track XIII: On Horary, First Part',
       'Robert Hand', 'Robert Schmidt', 'The Golden Hind Press', 1996, 'Berkeley Springs, West Virginia',
       NULL, 'Latin', 'English',
       'Copyright 1996 Robert Hand; copyrighted translation/edition. Do not redistribute source PDF.',
       'bonatti-horary-hand-schmidt-1996'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- Treatise 7: Benjamin N. Dykes, Cazimi Press 2010, from 1491/1550 Latin editions.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Bonatti on Elections: Treatise 7, Cazimi Press 2010',
       'Benjamin N. Dykes', NULL, 'The Cazimi Press', 2010, 'Minneapolis, Minnesota',
       NULL, 'Latin', 'English',
       'Copyrighted translation/edition; translated from the 1491 and 1550 Latin editions. Do not redistribute source PDF.',
       'bonatti-elections-dykes-2010'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- Treatise 8.2: separate Cazimi edition, Benjamin N. Dykes, 2010.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Bonatti on Lots: Treatise 8.2, Cazimi Press 2010',
       'Benjamin N. Dykes', NULL, 'The Cazimi Press', 2010, 'Minneapolis, Minnesota',
       '978-1-934586-11-2', 'Latin', 'English',
       'Copyright 2010 Benjamin N. Dykes; copyrighted translation/edition. Do not redistribute source PDF.',
       'bonatti-lots-dykes-2010'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- Treatise 9: separate Cazimi reprint, Benjamin N. Dykes, October 2010, from the
-- 1491 and 1550 Latin editions.
INSERT OR IGNORE INTO editions
  (work_id, label, translator, editor, publisher, publication_year, publication_place,
   isbn, source_language, target_language, copyright_note, local_source_key)
SELECT id,
       'Bonatti on Nativities: Treatise 9, Cazimi Press 2010',
       'Benjamin N. Dykes', NULL, 'The Cazimi Press', 2010, 'Minneapolis, Minnesota',
       NULL, 'Latin', 'English',
       'Copyrighted translation/edition; reprint excerpted from the 2007 first edition and translated from the 1491 and 1550 Latin editions. Do not redistribute source PDF.',
       'bonatti-nativities-dykes-2010'
FROM works WHERE slug='bonatti-liber-astronomiae';

-- -----------------------------------------------------------------------------
-- REASSIGN EXISTING SOURCE PASSAGES TO THEIR ACTUAL EDITIONS
-- -----------------------------------------------------------------------------

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Bonatti on Mundane Astrology: Treatises 4, 8.1 & 10, Cazimi Press 2010'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND (
    book LIKE 'Treatise 4%'
    OR book LIKE 'Treatise 8.1%'
    OR book LIKE 'Treatise 10%'
  );

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Bonatti’s 146 Considerations, Cazimi reprint (publisher note 2012; title page 2010)'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND book LIKE 'Treatise 5%';

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Project Hindsight Latin Track XIII: On Horary, First Part'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND book LIKE 'Treatise 6%';

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Bonatti on Elections: Treatise 7, Cazimi Press 2010'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND book LIKE 'Treatise 7%';

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Bonatti on Lots: Treatise 8.2, Cazimi Press 2010'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND book LIKE 'Treatise 8.2%';

UPDATE source_passages
SET edition_id=(
  SELECT e.id FROM editions e
  JOIN works w ON w.id=e.work_id
  WHERE w.slug='bonatti-liber-astronomiae'
    AND e.label='Bonatti on Nativities: Treatise 9, Cazimi Press 2010'
)
WHERE edition_id IN (SELECT e.id FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae')
  AND book LIKE 'Treatise 9%';

-- -----------------------------------------------------------------------------
-- PROVENANCE AUDIT GUARD
-- -----------------------------------------------------------------------------

-- This view-like query is intentionally left as a comment for maintainers:
-- SELECT e.label, MIN(CAST(sp.page_start AS INTEGER)), MAX(CAST(sp.page_end AS INTEGER)), COUNT(*)
-- FROM source_passages sp JOIN editions e ON e.id=sp.edition_id
-- JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae'
-- GROUP BY e.id ORDER BY MIN(CAST(sp.page_start AS INTEGER));
--
-- Passages from the opening Project Hindsight/Zoller material remain on the original
-- edition row. Later Treatises are now attributed to the translators actually printed in
-- the compiled source rather than to Zoller by default.
