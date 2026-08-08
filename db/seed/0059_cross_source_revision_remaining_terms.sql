-- Cross-source editorial revision, pass 13: remaining clearly-defined terms.
-- Run after 0058_cross_source_revision_residual_specialized.sql.
--
-- This is a deliberately small pass. The remaining entries below survived the broader
-- revisions because they are genuine source terms, not extraction headings, but had not
-- yet received publication-level definitions and evidence grading.

-- -----------------------------------------------------------------------------
-- BONATTI: PLANETARY FRIENDSHIP, HOSTILITY, AND OPENING OF THE GATES
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='A relation of concord between planets grounded principally in agreement of nature and secondarily in dignitary or other affinities; Bonatti says agreement in nature is the strongest basis of planetary friendship.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='This is a source-defined planetary relationship, not a generic metaphor for favorable aspect. Bonatti distinguishes friendship from reception: reception can make even ordinarily hostile planets treat one another favorably.'
WHERE slug='planetary-friendship';

UPDATE terms SET
  short_definition='A relation of discord between planets grounded in contrary natures or opposed dignities, tending to make a planet deliver its signification less freely or completely; reception can override the ordinary hostility in a particular encounter.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Bonatti’s hostility doctrine is relational and can be modified by reception. Do not reduce it to maleficence or to hard aspect alone.'
WHERE slug='planetary-hostility';

UPDATE terms SET
  short_definition='Bonatti’s name for the good will and security created when one planet receives another into its domicile, exaltation or other qualifying dignity, thereby setting aside their ordinary hostility as though opening its gates to the guest.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='A specific function of reception in Bonatti. Keep distinct from al-Bīrūnī’s meteorological Opening the Doors, whose recognition rule is unrelated.'
WHERE slug='opening-of-gates';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='bonatti-liber-astronomiae')
  AND certainty='direct'
  AND term_id IN (
    SELECT id FROM terms WHERE slug IN ('planetary-friendship','planetary-hostility','opening-of-gates')
  );

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'modified-by',
       'Bonatti says reception can overcome an otherwise hostile planetary relation and make the receiver treat the other planet with good will.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='planetary-hostility' AND b.slug='reception';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'effect-of',
       'Opening of the Gates is Bonatti’s name for the security and good will produced by qualifying reception despite ordinary planetary hostility.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='opening-of-gates' AND b.slug='reception';

INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'contrasting-relation',
       'Bonatti treats planetary friendship and hostility as contrary relational conditions, while allowing reception to alter the practical outcome of hostility.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='planetary-friendship' AND b.slug='planetary-hostility';

-- -----------------------------------------------------------------------------
-- LILLY: MAGISTRY
-- -----------------------------------------------------------------------------

UPDATE terms SET
  label='Magistry / Profession',
  short_definition='Lilly’s natal term for the principal study, art, action, trade or profession by which a person chiefly conducts life, gains a living, preserves social estimation and spends the principal part of life.',
  definition_quality=5,
  status='reviewed',
  entry_type='technical',
  editorial_notes='Lilly defines Magistry directly before giving rules for whether a profession is shown, what kind it is, and the native’s fortune in it. Preserve the source term rather than replacing it with a modern career concept.'
WHERE slug='magistry';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Exercitation', 'English', 'Lilly-source-form',
       'Lilly’s chapter heading: “Magistry, Exercitation or Profession of the Native.”'
FROM terms WHERE slug='magistry';

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Profession', 'English', 'Lilly-source-equivalent',
       'Lilly explicitly uses profession as an equivalent within his definition of Magistry.'
FROM terms WHERE slug='magistry';

UPDATE interpretations SET evidence_grade='A', status='reviewed'
WHERE work_id=(SELECT id FROM works WHERE slug='lilly-christian-astrology')
  AND term_id=(SELECT id FROM terms WHERE slug='magistry')
  AND certainty='direct';

-- Narrow the citation to the chapter containing Lilly’s actual lexical definition rather
-- than relying only on the large natal-topics source block.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '686', '687', 'Book III', 'Chapter CXLVIII',
       'Lilly: definition of Magistry, Exercitation or Profession', NULL,
       'Lilly explicitly defines the term before giving the subsequent significator rules. No quotation is needed in the public entry; paraphrase and locator are sufficient.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.locator_text='Lilly: definition of Magistry, Exercitation or Profession'
  );

INSERT OR IGNORE INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'primary'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN source_passages sp ON sp.edition_id IN (SELECT e.id FROM editions e WHERE e.work_id=w.id)
WHERE w.slug='lilly-christian-astrology'
  AND i.term_id=(SELECT id FROM terms WHERE slug='magistry')
  AND i.scope='Book III, Chapter CXLVIII'
  AND sp.locator_text='Lilly: definition of Magistry, Exercitation or Profession';
