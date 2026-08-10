-- Bird's-eye encyclopedia review: Ptolemy's relational sign geometries.
--
-- Primary witness: Tetrabiblos I.14-15 (Robbins translation / LacusCurtius witness).
-- Chapter 14 defines commanding and obeying divisions through equal distance from an
-- equinoctial point and equal ascensional times, distinguishing the summer and winter
-- zodiacal halves. Chapter 15 defines a second, symmetrical relation around the tropical
-- points: signs/parts of equal power that are also said to behold one another.
--
-- These are stored as named sign-pair schemes. They are not ordinary Ptolemaic aspects,
-- and the solstitial relation is not silently collapsed into the later antiscion headword.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('beholding-signs','Beholding Signs / Signs of Equal Power',
   'In Ptolemy, zodiacal signs or parts equally removed from the same solstitial point, giving equal day and night lengths and said to behold one another because they rise and set from corresponding parts of the horizon.',
   'sign relations','reviewed',
   'Ptolemy Tetrabiblos I.15. Preserve this as a named Ptolemaic relation. Its solstitial reflection geometry is closely related to antiscial geometry, but the historical headwords and doctrinal contexts should not be silently merged.',
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
       'Direct structural witness. Public prose is independently paraphrased; pair data is normalized below.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book I' AND sp.chapter='14' AND sp.section='Commanding and obeying signs'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'77','78','Book I','15','Beholding signs and signs of equal power',
       'Tetrabiblos I.15: zodiacal divisions equally removed from a tropical point are said to be of equal power and to behold one another.',
       NULL,
       'Direct structural witness. Public prose is independently paraphrased; pair data is normalized below.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book I' AND sp.chapter='15' AND sp.section='Beholding signs and signs of equal power'
  );

WITH defs(slug,summary,scope) AS (VALUES
  ('commanding-sign',
   'Ptolemy calls the zodiacal divisions on the summer side of an equinoctial symmetry commanding. Their paired winter-side divisions are equally distant from the same equinoctial point and ascend in equal periods of time.',
   'Book I.14: commanding side of equinoctial symmetry'),
  ('obedient-signs',
   'Ptolemy calls the winter-side members of the equinoctially symmetrical pairs obeying or obedient, contrasting them with the commanding summer-side members.',
   'Book I.14: obeying side of equinoctial symmetry'),
  ('beholding-signs',
   'Ptolemy describes zodiacal divisions equally removed from the same solstitial point as being of equal power because the corresponding solar day/night lengths are equal; he also says the paired divisions behold one another because they rise and set from corresponding parts of the horizon.',
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
       'Pairs are reflected across an equinoctial axis. The northern/summer-side member is commanding and the southern/winter-side member obeying; Ptolemy connects the pairing with equal ascensional times.',
       'Tetrabiblos I.14. Source-specific pair system; do not present as an unlabeled universal sign property.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='ptolemy-tetrabiblos'
ORDER BY e.id LIMIT 1;

INSERT OR REPLACE INTO zodiac_relation_schemes
  (slug,label,relation_kind,work_id,edition_id,geometry_note,notes,status)
SELECT 'ptolemy-beholding-equal-power',
       'Ptolemy: beholding / equal-power signs',
       'solstitial-symmetry',w.id,e.id,
       'Pairs are reflected across a solstitial axis. Ptolemy associates the symmetry with equal lengths of days, nights and seasonal hours and says the paired divisions behold one another.',
       'Tetrabiblos I.15. Closely related to solstitial reflection/antiscial geometry, but retained as Ptolemy’s own named relation.',
       'reviewed'
FROM works w JOIN editions e ON e.work_id=w.id
WHERE w.slug='ptolemy-tetrabiblos'
ORDER BY e.id LIMIT 1;

-- Equinoctial symmetry: northern/summer member commands, southern/winter member obeys.
WITH data(seq,a,b) AS (VALUES
  (1,'aries','pisces'),
  (2,'taurus','aquarius'),
  (3,'gemini','capricorn'),
  (4,'cancer','sagittarius'),
  (5,'leo','scorpio'),
  (6,'virgo','libra')
)
INSERT OR REPLACE INTO zodiac_relation_pairs
  (scheme_id,sign_a_term_id,sign_b_term_id,sign_a_role,sign_b_role,sequence_no,note)
SELECT s.id,a.id,b.id,'commanding','obeying',d.seq,
       'Ptolemaic equinoctial-symmetry pair: summer/northern member commanding, winter/southern member obeying.'
FROM data d
JOIN zodiac_relation_schemes s ON s.slug='ptolemy-commanding-obeying'
JOIN terms a ON a.slug=d.a
JOIN terms b ON b.slug=d.b;

-- Solstitial symmetry: the relation is reciprocal rather than role-asymmetric.
WITH data(seq,a,b) AS (VALUES
  (1,'gemini','cancer'),
  (2,'taurus','leo'),
  (3,'aries','virgo'),
  (4,'libra','pisces'),
  (5,'scorpio','aquarius'),
  (6,'sagittarius','capricorn')
)
INSERT OR REPLACE INTO zodiac_relation_pairs
  (scheme_id,sign_a_term_id,sign_b_term_id,sign_a_role,sign_b_role,sequence_no,note)
SELECT s.id,a.id,b.id,'equal-power / beholding','equal-power / beholding',d.seq,
       'Ptolemaic solstitial-symmetry pair; reciprocal equal-power / beholding relation.'
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
  'Beholding Signs, or Signs of Equal Power, are Ptolemy’s solstitially symmetrical zodiacal pairs. The relation compares positions equally removed from the same tropical point. Ptolemy connects that geometry with equal solar day and night lengths and with corresponding rising and setting positions.',
  'reviewed','Bird’s-eye source-backed article from Tetrabiblos I.15. Do not flatten into ordinary aspect terminology or silently rename as antiscion.'
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry','Solstitial reflection, not an ordinary aspect',
  'The defining relation is symmetry around Cancer or Capricorn, not a fixed angular interval such as sextile, square, trine or opposition. Different pairs can therefore be separated by different zodiacal distances while still sharing the same solstitial reflection principle.',10,'reviewed',NULL
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'antiscion','Relation to antiscial geometry',
  'The same solstitial reflection geometry is closely related to the later technical language of antiscia. The encyclopedia keeps Ptolemy’s “beholding / equal power” terminology visible rather than assuming every historical author used the later Latin headword for the relation.',20,'reviewed',NULL
FROM terms WHERE slug='beholding-signs';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ptolemy-geometry','Ptolemy’s equinoctial geometry',
  'Ptolemy defines commanding and obeying divisions as pairs equally removed from an equinoctial point. The summer or northern member is commanding and the winter or southern member obeying. This gives the relation a precise geometric basis instead of treating “commanding” as a personality keyword.',20,'reviewed',NULL
FROM terms WHERE slug='commanding-sign';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ptolemy-geometry','Ptolemy’s equinoctial geometry',
  'In Ptolemy’s relation, an obeying sign is the winter or southern counterpart of a commanding sign reflected across an equinoctial axis. The pair is described as ascending in equal periods of time. Other authors can frame or name the class differently, so the structured table remains explicitly source-labelled.',20,'reviewed',NULL
FROM terms WHERE slug='obedient-signs';

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('zodiac-relational-symmetries','Zodiac Relational Symmetries',
   'Named sign-to-sign geometries based on equinoctial or solstitial symmetry rather than ordinary aspect distance.',
   'geometry-family',
   'Current normalized pair schemes use Ptolemy I.14-15. Related antiscial terminology remains separately canonical rather than being merged by geometry alone.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('commanding-sign','equinoctial-active-role','Commanding role',10,'Northern/summer member of Ptolemy’s equinoctial pair.'),
  ('obedient-signs','equinoctial-responsive-role','Obeying role',20,'Southern/winter member of Ptolemy’s equinoctial pair.'),
  ('beholding-signs','solstitial-reciprocal-relation','Beholding / equal power',30,'Reciprocal relation of signs reflected around a solstitial axis.'),
  ('antiscion','related-solstitial-reflection','Related reflection terminology',40,'A separate historical headword built on closely related solstitial reflection geometry.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m JOIN concept_families f ON f.slug='zodiac-relational-symmetries'
JOIN terms t ON t.slug=m.term_slug;

WITH rel(a,b,r,n) AS (VALUES
  ('commanding-sign','obedient-signs','paired-with','Opposite roles within Ptolemy’s equinoctial-symmetry pair system.'),
  ('beholding-signs','antiscion','geometrically-related-to','Both use solstitial reflection geometry, but the historical terminology and doctrinal scope are kept separate.'),
  ('beholding-signs','aspect','distinct-from','Ptolemy’s equal-power relation is defined by solstitial symmetry rather than one fixed angular aspect.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT x.id,y.id,r.r,r.n,'reviewed'
FROM rel r JOIN terms x ON x.slug=r.a JOIN terms y ON y.slug=r.b;
