-- Foundational role vocabulary from Lilly.
--
-- These entries define named roles only. House-assignment and judgment procedures remain
-- outside the lexicon article layer except where needed to explain the term itself.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'49','49','Book I',NULL,'Significator, Querent, Quesited, Cosignificator',
       'Book I, p. 49: Lilly defines the significator of the querent or thing quesited and explains the cosignificator as an additional planet participating with the principal significator.',
       NULL,
       'Direct terminology witness. Definition-level evidence only.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Significator, Querent, Quesited, Cosignificator'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('querent','Querent','The person who asks an astrological question, especially in horary astrology.','horary terminology','reviewed','Directly attested in Lilly. This is a role label, not a method page.','technical',5),
  ('quesited','Quesited','The person, thing, or matter asked about in a horary question.','horary terminology','reviewed','Directly attested in Lilly. Also historically encountered as the thing quesited.','technical',5),
  ('cosignificator','Cosignificator','An additional significator that participates in signifying the same person, thing, or matter as a principal significator.','signification','reviewed','Lilly spells the term Cosignificator/Consignificator in different contexts; keep generic concept distinct from any one assignment rule.','technical',5),
  ('significator','Significator','A planet, point, or other chart factor assigned to signify a person, thing, topic, or role in an astrological judgment.','signification','reviewed','Broad canonical definition. Includes, but is not limited to, the technical directional use of significator.','technical',5);

-- If Significator already existed from the predictive terminology pass, broaden the
-- canonical entry rather than creating a second directional-only identity.
UPDATE terms SET
  label='Significator',
  short_definition='A planet, point, or other chart factor assigned to signify a person, thing, topic, or role in an astrological judgment.',
  category='signification',
  status='reviewed',
  definition_quality=5,
  editorial_notes='Broad canonical definition. Primary-direction significator is a specialized use of this general role; keep that use in article sections/relations rather than as the whole definition.'
WHERE slug='significator';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Interrogant','English/Latin-derived','historical-variant','Historical/technical alternative for the person asking; do not assume every author uses it identically.' FROM terms WHERE slug='querent';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Thing Quesited','English','source-phrase','Lilly’s phrasing for the matter asked about.' FROM terms WHERE slug='quesited';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Co-significator','English','spelling-variant','Hyphenated modern spelling.' FROM terms WHERE slug='cosignificator';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Consignificator','English','historical-spelling-variant','Historical spelling encountered in Lilly’s index and later passages.' FROM terms WHERE slug='cosignificator';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Principal Significator','English','role-variant','The primary significator when several factors participate in signification.' FROM terms WHERE slug='significator';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('querent','Lilly uses Querent for the person asking the question and identifies the Lord of the Ascendant as the significator of the querent in his introductory horary terminology.','Book I p. 49: querent/significator terminology'),
    ('quesited','Lilly uses the thing quesited for the person, thing, or matter demanded in the question, whose principal significator is taken from the relevant house.','Book I p. 49: quesited terminology'),
    ('significator','Lilly defines the significator in horary as the planet standing for the querent or the thing demanded, ordinarily through rulership of the relevant sign/house.','Book I p. 49: significator definition'),
    ('cosignificator','Lilly defines a cosignificator as another planet participating with the principal significator and therefore having some share in the same signification.','Book I p. 49: cosignificator definition')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND t.slug IN ('querent','quesited','significator','cosignificator')
  AND sp.section='Significator, Querent, Quesited, Cosignificator';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Querent is the person who asks an astrological question. The word is primarily associated with horary astrology, where it distinguishes the asker from the person, object, or matter being asked about.','reviewed','Role definition only.' FROM terms WHERE slug='querent';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'contrast','Querent and quesited','The querent is the asker. The quesited is the person, thing, or matter asked about. Keeping the two labels distinct prevents ambiguity when a question involves several people or topics.',10,'reviewed',NULL FROM terms WHERE slug='querent';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The Quesited is the person, object, event, or matter about which a horary question is asked. It is the counterpart to the Querent, who asks the question.','reviewed','Role definition only.' FROM terms WHERE slug='quesited';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','A role, not necessarily a person','Although the word often refers to another person in relationship questions, the quesited can equally be a job, property, journey, lost object, or any other matter that the question concerns.',10,'reviewed',NULL FROM terms WHERE slug='quesited';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A Significator is a chart factor used to stand for something else: a person, object, topic, office, event, or other role relevant to the judgment. The exact assignment depends on the branch and technique. The term therefore names a function in interpretation rather than one fixed planet.','reviewed','Broad canonical article; technique-specific assignments belong in their own entries.' FROM terms WHERE slug='significator';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'horary','In horary','Lilly uses significator for the planet representing the querent or the thing quesited, normally through rulership of the relevant house. This is one historically important use of the broader concept.',10,'reviewed',NULL FROM terms WHERE slug='significator';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'directions','In primary directions','In primary directions, “significator” is also used in a specialized technical sense for the directed point or body whose movement/relationship is measured against a promissor. That directional meaning is a specialized use, not the entire definition of the word.',20,'reviewed',NULL FROM terms WHERE slug='significator';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A Cosignificator is an additional factor that shares in the signification already carried by a principal significator. It supplements the primary representative rather than replacing the concept of a principal significator altogether.','reviewed','Direct Lilly terminology; assignment rules remain source-specific.' FROM terms WHERE slug='cosignificator';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly','Lilly’s definition','Lilly describes a cosignificator as another planet in aspect or conjunction with the principal significator which therefore has some share in signifying the same matter. Other traditional contexts can use co-signification more broadly, so the encyclopedia keeps the general role distinct from this one formulation.',10,'reviewed',NULL FROM terms WHERE slug='cosignificator';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'counterpart-of','The querent asks; the quesited is what or whom the question concerns.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='querent' AND b.slug='quesited';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-or-role-of','A cosignificator is an additional participant in signification alongside a principal significator.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='cosignificator' AND b.slug='significator';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'role-vocabulary','Basic role vocabulary',
  'These terms name roles; they do not themselves prescribe a complete method of assignment.',
  '["Term","What it names"]',
  '[["Querent","The person asking the question"],["Quesited","The person, thing, or matter asked about"],["Significator","A chart factor assigned to represent a role or topic"],["Cosignificator","An additional factor sharing in that signification"]]',
  50,'reviewed','Lilly-grounded introductory vocabulary.'
FROM terms WHERE slug='horary-astrology';
