-- Foundational interpretive vocabulary: natural/accidental signification, testimony,
-- fortitude and debility.
--
-- These entries define recurring historical terms. They do not import a scoring,
-- weighting, or chart-analysis procedure.

PRAGMA foreign_keys = ON;

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'9','10','Book I',NULL,'Natural and accidental signification',
       'Book I, introductory counsel: Lilly says the astrologer must understand what a significator signifies naturally and what it signifies accidentally.',
       NULL,
       'Direct terminology witness. No method sequence imported beyond the lexical distinction.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Natural and accidental signification'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'122','136','Book II',NULL,'Fortitudes and debilities',
       'Book II, pp. 122-136: Lilly repeatedly distinguishes strength, fortitude and debility, including essential and accidental fortitudes and debilities.',
       NULL,
       'Direct vocabulary witness for fortitude/debility as umbrella evaluative terms. His numerical table is source-specific and is not generalized as a universal scoring system.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Fortitudes and debilities'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'155','262','Book II',NULL,'Testimony in judgment',
       'Book II: Lilly repeatedly calls individual astrological indications testimonies and warns in several contexts against relying on a single testimony.',
       NULL,
       'Terminology witness only. No testimony-counting procedure is imported.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Testimony in judgment'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('natural-significator','Natural Significator',
   'A planet or other factor that signifies a person, topic, quality, or class of things by its inherent traditional nature rather than solely through a temporary chart-specific assignment.',
   'signification','reviewed',
   'Lilly directly calls Jupiter the natural significator of substance and distinguishes natural from accidental signification. Do not turn natural significators into automatic house rulers or primary chart significators.',
   'technical',5),
  ('accidental-signification','Accidental Signification',
   'A signification a planet or other factor acquires from its contingent role in a particular chart, such as rulership of a relevant house or assignment as a significator.',
   'signification','reviewed',
   'Based on Lilly’s explicit distinction between what a significator signifies naturally and accidentally. This is not the same distinction as essential versus accidental dignity.',
   'technical',5),
  ('testimony','Testimony',
   'An individual astrological indication or piece of chart evidence that bears on a judgment, often considered together with other agreeing or conflicting testimonies.',
   'judgment terminology','reviewed',
   'Lilly repeatedly uses testimony in this technical evidentiary sense. Define the term without publishing a universal weighting/counting scheme.',
   'technical',5),
  ('fortitude','Fortitude',
   'A traditional umbrella term for a planet’s strength or empowering conditions, whether essential or accidental in the terminology of a particular author.',
   'planetary condition','reviewed',
   'Lilly explicitly uses Essential and Accidental Fortitudes. Keep separate from any one numerical score table.',
   'technical',5),
  ('debility','Debility',
   'A traditional umbrella term for a planet’s weakening or impairing conditions, whether essential or accidental in the terminology of a particular author.',
   'planetary condition','reviewed',
   'Lilly explicitly uses Essential and Accidental Debilities. Do not collapse debility into detriment/fall alone.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Natural Signification','English','related-form','The underlying natural signifying role rather than the object carrying it.'
FROM terms WHERE slug='natural-significator';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Accidental Significator','English','usage-variant','A factor serving as significator by chart-specific assignment; the canonical entry emphasizes the broader concept of accidental signification.'
FROM terms WHERE slug='accidental-signification';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Fortitude and Debility','English','paired-phrase','Common paired vocabulary for strength and weakness in traditional sources.'
FROM terms WHERE slug='fortitude';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('natural-significator','Lilly distinguishes what a significator signifies naturally from what it signifies accidentally and elsewhere explicitly calls Jupiter a natural significator of substance.','Book I introduction; Book II substance judgment'),
    ('accidental-signification','Lilly explicitly instructs the astrologer to distinguish what a significator signifies naturally from what it signifies accidentally, directly attesting the conceptual distinction.','Book I introduction: natural and accidental signification'),
    ('testimony','Lilly repeatedly uses testimony for a single astrological indication and in several judgments cautions against relying upon only one testimony, showing that testimonies are evidentiary components rather than synonymous with the final judgment.','Book II: recurring technical use of testimony'),
    ('fortitude','Lilly repeatedly speaks of planetary fortitudes and distinguishes essential from accidental fortitudes; the word functions as an umbrella for strengthening conditions.','Book II, pp. 122-136: fortitudes'),
    ('debility','Lilly repeatedly speaks of planetary debilities and distinguishes essential from accidental debilities; the word functions as an umbrella for weakening conditions.','Book II, pp. 122-136: debilities')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs
JOIN terms t ON t.slug=defs.slug
CROSS JOIN works w
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='lilly-christian-astrology'
  AND (
    (t.slug IN ('natural-significator','accidental-signification') AND sp.section='Natural and accidental signification') OR
    (t.slug='testimony' AND sp.section='Testimony in judgment') OR
    (t.slug IN ('fortitude','debility') AND sp.section='Fortitudes and debilities')
  );

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Natural Significator represents a topic because that topic belongs to the planet’s inherited traditional significations, not because the planet happens to rule the relevant house in one particular chart. Natural signification and chart-specific assignment can overlap, but they are different reasons for a planet to signify something.',
  'reviewed','Foundational signification article.'
FROM terms WHERE slug='natural-significator';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'natural-accidental','Natural and accidental roles',
  'A planet can signify something naturally and also acquire an accidental role from the chart. For example, a planet may have an inherited natural association with a topic while another planet becomes the principal significator because it rules the house assigned to that matter. The two kinds of signification should therefore not be collapsed.',10,'reviewed',NULL
FROM terms WHERE slug='natural-significator';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Accidental Signification is the role a factor acquires from the particular structure of a chart. A planet may signify a person or matter because it rules the relevant house, occupies a relevant place, or has been assigned a technical role, even when that topic is not among its broad natural significations.',
  'reviewed','Keep distinct from accidental dignity/fortitude.'
FROM terms WHERE slug='accidental-signification';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-dignity','Not accidental dignity',
  'Accidental signification answers what a planet represents in this chart. Accidental dignity or fortitude answers how strongly or effectively it is situated to act. The shared word accidental refers to chart-contingent circumstances, but the concepts answer different questions.',10,'reviewed',NULL
FROM terms WHERE slug='accidental-signification';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Testimony is one piece of astrological evidence bearing on a judgment. Traditional authors can accumulate, compare, reinforce, qualify, or contradict testimonies; the testimony is therefore smaller than the final judgment and should not be treated as a conclusion by itself.',
  'reviewed','No universal testimony-counting or weighting algorithm imported.'
FROM terms WHERE slug='testimony';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'evidence','An evidentiary unit',
  'Lilly commonly calls a placement, aspect, condition or other relevant indication a testimony. Several testimonies may point in the same direction, while others may conflict. Historical authors differ in how such evidence is prioritized, so “testimony” names the evidence itself rather than a fixed scoring rule.',10,'reviewed',NULL
FROM terms WHERE slug='testimony';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Fortitude is a traditional umbrella term for planetary strength. Lilly explicitly distinguishes Essential Fortitudes from Accidental Fortitudes, allowing the word to cover both intrinsic zodiacal dignity and strengthening circumstances of placement, motion, visibility or related conditions.',
  'reviewed','Umbrella term; source-specific scoring not universalized.'
FROM terms WHERE slug='fortitude';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Debility is a traditional umbrella term for planetary weakness or impairment. It can include essential debilities such as detriment, fall or peregrine condition in a given author’s framework, and accidental debilities such as unfavorable placement, motion or solar condition.',
  'reviewed','Umbrella term; not reducible to detriment/fall.'
FROM terms WHERE slug='debility';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'fortitude-debility-map','Fortitude and debility as umbrella terms',
  'The categories are conceptual; exact lists and scoring can vary by author.',
  '["Dimension","Strength term","Weakness term","Examples"]',
  '[["Essential condition","Essential fortitude","Essential debility","Domicile/exaltation versus detriment/fall; peregrine belongs to debility in Lilly’s table"],["Accidental condition","Accidental fortitude","Accidental debility","Angular/cadent placement, direct/retrograde motion, speed, solar condition and other circumstances"]]',
  20,'reviewed','Reference structure only; not a scoring table.'
FROM terms WHERE slug='fortitude';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Natural signification and accidental signification are different grounds for assigning meaning.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='natural-significator' AND b.slug='accidental-signification';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'broader-than','Fortitude is the umbrella concept under which accidental fortitude is one family of strengthening conditions.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='fortitude' AND b.slug='accidental-fortitude';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Essential dignity contributes to essential fortitude but is not identical with the whole concept of planetary strength.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='fortitude' AND b.slug='essential-dignity';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Fortitude and debility are the paired umbrella terms for strengthening and weakening conditions.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='fortitude' AND b.slug='debility';
