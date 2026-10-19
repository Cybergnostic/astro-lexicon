-- Batch 03 direct source correction. Al-Biruni, Kitab al-Tafhim, R. Ramsay Wright ed. (1934), §164, printed p. 81.
-- Inspected both PDF text and page image (uploaded PDF p. 95).
-- This distinction matters: the earlier headword's unqualified "twenty-eight"
-- could falsely imply that every historical mansion system used 28 stations.
-- No existing mansion lists, formulae, relations or source interpretations are deleted.
PRAGMA foreign_keys=ON;

UPDATE terms SET
 short_definition='Lunar mansions are named stations along the Moon''s path among the fixed stars. The Arabic system commonly has twenty-eight stations, while al-Bīrūnī also records a twenty-seven-station reckoning attributed to Indian authorities.',
 editorial_notes='Lexicographic Batch 03: direct comparison with al-Bīrūnī §164 corrects unqualified universal mansion count.'
WHERE slug='lunar-mansions';

UPDATE term_articles SET
 intro='Lunar mansions form a positional system associated with the Moon''s nightly course among the stars. In §164 of the Book of Instruction, al-Bīrūnī distinguishes the twenty-eight mansions he attributes to the Arabs from twenty-seven stations ascribed to the Indians; named stars and system boundaries depend on the tradition being described.',
 editorial_notes='Lexicographic Batch 03: direct-source count variant, al-Bīrūnī §164, printed p. 81.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lunar-mansions');

UPDATE term_article_sections SET
 heading='Lunar stations and the number of mansions',
 body='The count is source-dependent. Al-Bīrūnī (§164) describes the Moon''s nightly stations relative to fixed stars and contrasts twenty-seven stations attributed to Indians with twenty-eight attributed to Arabs. The Arabic twenty-eight-station arrangement is common in later lunar-mansion practice, but it should not stand for every historical reckoning. Boundaries, star names and applications must be taken from the particular tradition under discussion.',
 editorial_notes='Lexicographic Batch 03: reviewed expression; source-specific differences and reference data preserved.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lunar-mansions') AND section_key='twenty-eight';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'81','81',NULL,NULL,'164','§164 — lunar mansion counts (27 Indian; 28 Arab)',NULL,
 'Directly inspected translation and corresponding page image; PDF page 95, printed p. 81. Historical count attributed to the author, not inferred from a table.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (
 SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id
 AND sp.locator_text='§164 — lunar mansion counts (27 Indian; 28 Arab)'
);

INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
 'Al-Bīrūnī describes lunar mansions as stations along the Moon''s stellar course, specifying twenty-seven stations according to Indian reckoning and twenty-eight according to Arab reckoning.',
 '§164 (Batch 03 direct verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lunar-mansions' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (
 SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id
 AND i.scope='§164 (Batch 03 direct verification)'
);

INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lunar-mansions' AND w.slug='al-biruni-tafhim'
AND i.scope='§164 (Batch 03 direct verification)'
AND sp.locator_text='§164 — lunar mansion counts (27 Indian; 28 Arab)';
