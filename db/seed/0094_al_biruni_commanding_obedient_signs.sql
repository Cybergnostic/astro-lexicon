-- Public-source corroboration: commanding / obedient sign terminology.
--
-- Al-Biruni's own text describes crooked-rising signs as obedient and explains the
-- paired relation by diurnal course: one sign precedes and therefore commands, the
-- other follows and obeys. Wright's bracketed editorial note compares Paulus,
-- Valens, Chaucer and Ptolemy; that comparative note is NOT attributed to al-Biruni.

INSERT INTO source_passages
  (edition_id,page_start,page_end,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'246','246','Signs and their relations','§242',
       '§242, ascending/descending halves; crooked/direct ascension and obedient/commanding relation',
       NULL,
       'Al-Biruni states that crooked signs are called obedient and explains command/obedience by concordance in course. The translator/editor bracket on the same page supplies cross-author comparisons and must not be attributed to al-Biruni.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='§242'
  );

UPDATE terms SET
  short_definition='A sign belonging to the commanding side of a traditional paired-sign relation, in which one sign precedes by diurnal course and the corresponding sign follows or obeys.',
  category='sign classifications',
  status='reviewed',
  definition_quality=5,
  editorial_notes='Directly corroborated in al-Biruni §242 as the counterpart of obedient signs. Exact membership and nomenclature vary across authors and editorial traditions; preserve source-specific tables rather than forcing one universal list.'
WHERE slug='commanding-sign';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Commanding Signs','English','number-variant','Plural form used for the sign class.'
FROM terms WHERE slug='commanding-sign';

WITH defs(slug,summary,scope) AS (
  VALUES
    ('commanding-sign',
     'Al-Biruni explains a paired relation of command and obedience by diurnal course: the sign belonging to the earlier-moving or preceding side commands, while its counterpart follows and obeys. The passage occurs in his discussion of crooked and direct ascension.',
     '§242: commanding/obedient relation by course'),
    ('obedient-signs',
     'Al-Biruni explicitly says that the crooked-rising signs are also called obedient signs, explaining that in paired signs the commanding member precedes by diurnal movement and the obedient member follows.',
     '§242: crooked signs called obedient')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs
JOIN terms t ON t.slug=defs.slug
CROSS JOIN works w
WHERE w.slug='al-biruni-tafhim'
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
WHERE w.slug='al-biruni-tafhim'
  AND t.slug IN ('commanding-sign','obedient-signs')
  AND sp.section='§242';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'paired-with',
       'Commanding and obedient signs form a paired traditional relation; source traditions can differ over the exact membership and nomenclature.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='commanding-sign' AND b.slug='obedient-signs';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Commanding signs belong to a traditional paired-sign classification in which one member of a pair is said to command and the other to obey. The terminology is connected with zodiacal course and ascensional relationships rather than with modern personality descriptions.',
       'reviewed',
       'Public synthesis anchored to al-Biruni §242; membership variants should be added source by source.'
FROM terms WHERE slug='commanding-sign';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'relation','Commanding and obedient',
       'Al-Biruni explains the relation through diurnal course: in a paired relationship one sign precedes and commands, while the other follows and obeys. In the same discussion he calls the crooked-rising signs obedient. Later and earlier authorities do not always present the membership in exactly the same way, so tables should be labelled by source rather than presented as a single timeless list.',
       10,'reviewed',
       'Do not attribute Wright’s bracketed comparative note on Paulus/Valens/Ptolemy directly to al-Biruni.'
FROM terms WHERE slug='commanding-sign';
