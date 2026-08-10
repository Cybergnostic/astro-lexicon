-- Bird's-eye encyclopedia review: Ptolemy's relational sign geometries.
--
-- Primary witness: Tetrabiblos I.14-15 (Robbins translation / LacusCurtius witness).
-- Robbins' notes give the sign-level pair sets explicitly. Chapter 14 leaves Aries and
-- Libra unpaired because they are the equinoctial signs from which the symmetry is
-- measured. Chapter 15 leaves Cancer and Capricorn unpaired because they are the
-- tropical/solstitial signs from which that second symmetry is measured.
--
-- These are named source-specific sign-pair schemes, not ordinary aspects and not a
-- substitute for later antiscion / contra-antiscion terminology.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('beholding-signs','Beholding Signs / Signs of Equal Power',
   'In Ptolemy, signs paired at equal distance from the same tropical sign and therefore described as having equal solar day/night conditions and as beholding one another.',
   'sign relations','reviewed',
   'Ptolemy Tetrabiblos I.15. Preserve this as a named Ptolemaic relation. Do not silently merge it with later antiscion terminology, whose sign pairings are different.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs of Equal Power','English','source-rendering','Ptolemy’s paired description in Tetrabiblos I.15.'
FROM terms WHERE slug='beholding-signs';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Signs which Behold Each Other','English','source-rendering','Robbins chapter-heading wording for Tetrabiblos I.15.'
FROM terms WHERE slug='beholding-signs';

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'75','77','Book I','14','Commanding and obeying signs',
       'Tetrabiblos I.14: commanding and obeying zodiacal divisions, defined through equinoctial symmetry and equal ascensional time.',
       NULL,
       'Direct structural witness. Robbins note 80 gives the five sign-level pairs and states that Aries and Libra are excluded.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book I' AND sp.chapter='14' AND sp.section='Commanding and obeying signs'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'77','78','Book I','15','Beholding signs and signs of equal power',
       'Tetrabiblos I.15: zodiacal divisions equally removed from a tropical sign are said to be of equal power and to behold one another.',
       NULL,
       'Direct structural witness. Robbins note 83 gives the five sign-level pairs and states that Cancer and Capricorn are left without mates.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book I' AND sp.chapter='15' AND sp.section='Beholding signs and signs of equal power'
  );

WITH defs(slug,summary,scope) AS (VALUES
  ('commanding-sign',
   'Ptolemy pairs signs at equal distance from an equinoctial sign and calls the summer-side member commanding. Robbins’ note gives Taurus–Pisces, Gemini–Aquarius, Cancer–Capricorn, Leo–Sagittarius and Virgo–Scorpio; Aries and Libra are the unpaired equinoctial signs.',
   'Book I.14: commanding side of equinoctial symmetry'),
  ('obedient-signs',
   'Ptolemy calls the winter-side member of each equinoctially symmetrical pair obeying or obedient. The paired signs have equal ascensional times in his account; Aries and Libra themselves are not paired.',
   'Book I.14: obeying side of equinoctial symmetry'),
  ('beholding-signs',
   'Ptolemy describes a different set of signs equally removed from a tropical sign as being of equal power and as beholding one another. Robbins’ note gives Gemini–Leo, Taurus–Virgo, Aries–Libra, Pisces–Scorpio and Aquarius–Sagittarius; Cancer and Capricorn are left without mates.',
   'Book I.15: beholding and equal-power relation')
)
INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,d.summary,d.scope,'direct','reviewed','A'
FROM defs d JOIN terms t ON t.slug=d.slug CROSS JOIN works w
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=d.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='ptolemy-tetrabiblos'
  AND (
    (t.slug IN ('commanding-sign','obedient-signs') AND sp.book='Book I' AND sp.chapter='14') OR
    (t.slug='beholding-signs' AND sp.book='Book I' AND sp.chapter='15')
  );

INSERT OR REPLACE INTO zodiac_relation_schemes
  (slug,label,relation_kind,work_id,edition_id,geometry_note,notes,status)
SELECT 'ptolemy-commanding-obeying',
       'Ptolemy: commanding and obeying signs',
       'equinoctial-symmetry',w.id,e.id,
       'Five sign pairs are measured symmetrically from Aries or Libra. The summer-side member commands and the winter-side member obeys; Aries and Libra themselves are unpaired.',
       'Tetrabiblos I.14 with Robbins note 80. Source-specific pair system; do not present as an unlabeled universal sign property.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='ptolemy-tetrabiblos'
ORDER BY e.id LIMIT 1;

INSERT OR REPLACE INTO zodiac_relation_schemes
  (slug,label,relation_kind,work_id,edition_id,geometry_note,notes,status)
SELECT 'ptolemy-beholding-equal-power',
       'Ptolemy: beholding / equal-power signs',
       'tropical-sign-symmetry',w.id,e.id,
       'Five reciprocal sign pairs are measured symmetrically from Cancer or Capricorn. Cancer and Capricorn themselves are unpaired.',
       'Tetrabiblos I.15 with Robbins note 83. This is Ptolemy’s own sign-level relation and is not the same pair table as later antiscia.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='ptolemy-tetrabiblos'
ORDER BY e.id LIMIT 1;

-- Robbins note 80: commanding member first; Aries and Libra excluded.
WITH data(seq,a,b) AS (VALUES
  (1,'taurus','pisces'),
  (2,'gemini','aquarius'),
  (3,'cancer','capricorn'),
  (4,'leo','sagittarius'),
  (5,'virgo','scorpio')
)
INSERT OR REPLACE INTO zodiac_relation_pairs
  (scheme_id,sign_a_term_id,sign_b_term_id,sign_a_role,sign_b_role,sequence_no,note)
SELECT s.id,a.id,b.id,'commanding','obeying',d.seq,
       'Ptolemaic commanding/obeying sign pair from Robbins note 80.'
FROM data d
JOIN zodiac_relation_schemes s ON s.slug='ptolemy-commanding-obeying'
JOIN terms a ON a.slug=d.a
JOIN terms b ON b.slug=d.b;

-- Robbins note 83: reciprocal equal-power / beholding pairs; Cancer/Capricorn excluded.
WITH data(seq,a,b) AS (VALUES
  (1,'gemini','leo'),
  (2,'taurus','virgo'),
  (3,'aries','libra'),
  (4,'pisces','scorpio'),
  (5,'aquarius','sagittarius')
)
INSERT OR REPLACE INTO zodiac_relation_pairs
  (scheme_id,sign_a_term_id,sign_b_term_id,sign_a_role,sign_b_role,sequence_no,note)
SELECT s.id,a.id,b.id,'equal-power / beholding','equal-power / beholding',d.seq,
       'Ptolemaic beholding/equal-power sign pair from Robbins note 83.'
FROM data d
JOIN zodiac_relation_schemes s ON s.slug='ptolemy-beholding-equal-power'
JOIN terms a ON a.slug=d.a
JOIN terms b ON b.slug=d.b;

INSERT OR REPLACE INTO term_zodiac_relation_schemes (term_id,scheme_id,relation_role,note)
SELECT t.id,s.id,'commanding-concept','Canonical commanding-sign concept for this named relation.'
FROM terms t CROSS JOIN zodiac_relation_schemes s
WHERE t.slug='commanding-sign' AND s.slug='ptolemy-commanding-obeying';
INSERT OR REPLACE INTO term_zodiac_relation_schemes (term_id,scheme_id,relation_role,note)
SELECT t.id,s.id,'obeying-concept','Canonical obedient-sign concept for this named relation.'
FROM terms t CROSS JOIN zodiac_relation_schemes s
WHERE t.slug='obedient-signs' AND s.slug='ptolemy-commanding-obeying';
INSERT OR REPLACE INTO term_zodiac_relation_schemes (term_id,scheme_id,relation_role,note)
SELECT t.id,s.id,'relation-concept','Canonical beholding/equal-power concept for this named relation.'
FROM terms t CROSS JOIN zodiac_relation_schemes s
WHERE t.slug='beholding-signs' AND s.slug='ptolemy-beholding-equal-power';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Beholding Signs, or Signs of Equal Power, are Ptolemy’s reciprocal sign pairs measured at equal distance from one of the tropical signs. Ptolemy connects the relation with equal solar day and night conditions and with corresponding rising and setting positions. Cancer and Capricorn, the tropical signs from which the relation is measured, are left without mates in Robbins’ note.',
  'reviewed','Bird’s-eye source-backed article from Tetrabiblos I.15. Do not flatten into ordinary aspect terminology or silently rename as antiscion.'
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry','A sign symmetry, not an ordinary aspect',
  'The defining relation is equal distance from Cancer or Capricorn as tropical signs, not one fixed angular interval such as sextile, square, trine or opposition. Ptolemy’s five pairs are Gemini–Leo, Taurus–Virgo, Aries–Libra, Pisces–Scorpio and Aquarius–Sagittarius.',10,'reviewed',NULL
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-antiscion','Do not collapse it into antiscia',
  'Later antiscion terminology uses a different sign-pair table. The shared language of solar symmetry makes the concepts easy to confuse, but the encyclopedia preserves Ptolemy’s beholding/equal-power relation under its own historical identity.',20,'reviewed',NULL
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ptolemy-geometry','Ptolemy’s equinoctial geometry',
  'Ptolemy’s sign-level commanding/obeying scheme uses five pairs measured from the equinoctial signs: Taurus–Pisces, Gemini–Aquarius, Cancer–Capricorn, Leo–Sagittarius and Virgo–Scorpio. The first member commands and the second obeys; Aries and Libra are left out because they are the equinoctial signs from which the pairing begins.',20,'reviewed',NULL
FROM terms WHERE slug='commanding-sign';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ptolemy-geometry','Ptolemy’s equinoctial geometry',
  'In Ptolemy’s five sign-level pairs the winter-side member obeys the corresponding summer-side member. Aries and Libra themselves are not members of a pair in Robbins’ note because they form the equinoctial reference points.',20,'reviewed',NULL
FROM terms WHERE slug='obedient-signs';

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('zodiac-relational-symmetries','Zodiac Relational Symmetries',
   'Ptolemy’s named sign-to-sign geometries based on equinoctial or tropical-sign symmetry rather than ordinary aspect distance.',
   'mechanics',
   'Current normalized pair schemes use Ptolemy I.14-15 and Robbins’ explicit sign-pair notes. Antiscia remain separate because their sign-level pair table differs.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('commanding-sign','equinoctial-commanding-role','Commanding role',10,'Summer-side member of Ptolemy’s five equinoctial pairs.'),
  ('obedient-signs','equinoctial-obeying-role','Obeying role',20,'Winter-side member of Ptolemy’s five equinoctial pairs.'),
  ('beholding-signs','tropical-reciprocal-relation','Beholding / equal power',30,'Reciprocal relation in Ptolemy’s five tropical-sign-symmetry pairs.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m JOIN concept_families f ON f.slug='zodiac-relational-symmetries'
JOIN terms t ON t.slug=m.term_slug;

WITH rel(a,b,r,n) AS (VALUES
  ('commanding-sign','obedient-signs','paired-with','Opposite roles within Ptolemy’s equinoctial-symmetry pair system.'),
  ('beholding-signs','aspect','distinct-from','Ptolemy’s equal-power relation is a named sign symmetry rather than one fixed angular aspect.'),
  ('beholding-signs','antiscion','distinct-from','Ptolemy’s sign-level equal-power pairs differ from the later antiscion pair table and are preserved separately.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT x.id,y.id,r.r,r.n,'reviewed'
FROM rel r JOIN terms x ON x.slug=r.a JOIN terms y ON y.slug=r.b;
