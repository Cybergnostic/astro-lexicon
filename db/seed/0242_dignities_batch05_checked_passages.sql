-- Batch 05: exact inspected al-Biruni §§443,445 and Lilly Book I pp.103,112-113 witnesses.
-- Modern English editions are paraphrased; nothing quoted into the public lexicon.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'443','Batch 05 directly checked — exaltation extent contested',NULL,
'Inspected section in Wright translation; uploaded PDF pages 275–276; exact section supersedes unreliable OCR page header.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — exaltation extent contested');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī reports divergent historical opinions on whether exaltation belongs near a privileged degree, extends from the beginning of its sign to that degree, or embraces the whole sign.','§443 (Batch 05 direct witness: exaltation extent contested)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§443 (Batch 05 direct witness: exaltation extent contested)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='exaltation' AND w.slug='al-biruni-tafhim' AND i.scope='§443 (Batch 05 direct witness: exaltation extent contested)' AND p.locator_text='Batch 05 directly checked — exaltation extent contested';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'443','Batch 05 directly checked — exaltation degree and sign',NULL,
'Inspected section in Wright translation; uploaded PDF pages 275–276; exact section supersedes unreliable OCR page header.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — exaltation degree and sign');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes an exaltation sign from the named degree and reports several differing accounts of how far the dignity extends.','§443 (Batch 05 direct witness: exaltation degree and sign)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation-degree' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§443 (Batch 05 direct witness: exaltation degree and sign)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='exaltation-degree' AND w.slug='al-biruni-tafhim' AND i.scope='§443 (Batch 05 direct witness: exaltation degree and sign)' AND p.locator_text='Batch 05 directly checked — exaltation degree and sign';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'445','Batch 05 directly checked — triplicity day night participating',NULL,
'Inspected section in Wright translation; uploaded PDF pages 275–276; exact section supersedes unreliable OCR page header.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — triplicity day night participating');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī gives day, night and participating rulers of the four triplicities and additionally reports an interpretation using all three in ranked order.','§445 (Batch 05 direct witness: triplicity day night participating)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-rulers' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§445 (Batch 05 direct witness: triplicity day night participating)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='triplicity-rulers' AND w.slug='al-biruni-tafhim' AND i.scope='§445 (Batch 05 direct witness: triplicity day night participating)' AND p.locator_text='Batch 05 directly checked — triplicity day night participating';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'103','103','Book I',NULL,NULL,'Batch 05 directly checked — face as anti-peregrine dignity',NULL,
'Inspected Christian Astrology Book I text, printed p.103.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — face as anti-peregrine dignity');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly treats face/decan as a minor essential dignity that prevents a planet in its own face from being classed peregrine.','Book I p.103 (Batch 05 direct witness: face as anti-peregrine dignity)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.103 (Batch 05 direct witness: face as anti-peregrine dignity)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='face-decan' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.103 (Batch 05 direct witness: face as anti-peregrine dignity)' AND p.locator_text='Batch 05 directly checked — face as anti-peregrine dignity';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'112','112','Book I',NULL,NULL,'Batch 05 directly checked — Saturn in Aries peregrine example',NULL,
'Inspected Christian Astrology Book I text, printed p.112.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — Saturn in Aries peregrine example');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s Saturn in 10° Aries example is peregrine, whereas later Aries degrees within Saturn''s term are not peregrine for Saturn.','Book I p.112 (Batch 05 direct witness: Saturn in Aries peregrine example)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='peregrine' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.112 (Batch 05 direct witness: Saturn in Aries peregrine example)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='peregrine' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.112 (Batch 05 direct witness: Saturn in Aries peregrine example)' AND p.locator_text='Batch 05 directly checked — Saturn in Aries peregrine example';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'113','113','Book I',NULL,NULL,'Batch 05 directly checked — compound hayz conditions',NULL,
'Inspected Christian Astrology Book I text, printed p.113.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 05 directly checked — compound hayz conditions');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly defines hayz with sect, horizon placement and gender agreement of planet and sign in coordinated day/night circumstances.','Book I p.113 (Batch 05 direct witness: compound hayz conditions)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='hayz' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113 (Batch 05 direct witness: compound hayz conditions)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='hayz' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.113 (Batch 05 direct witness: compound hayz conditions)' AND p.locator_text='Batch 05 directly checked — compound hayz conditions';

