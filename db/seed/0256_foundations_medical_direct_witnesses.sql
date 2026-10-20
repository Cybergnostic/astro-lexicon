-- Batch 12: ten directly checked al-Bīrūnī and Lilly historical passages with term-specific citations.
-- al-Bīrūnī Book of Instruction §§121,157 (Wright translation); Lilly Christian Astrology Book II pp. 266,268,290–292.
-- Each witness paraphrases a specific historical author's claim; these medical doctrines do not supply present-day clinical advice.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'121','Batch 12 checked planetary-order: Book of Instruction §121',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked planetary-order: Book of Instruction §121');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī numbers seven moving planetary spheres Moon, Mercury, Venus, Sun, Mars, Jupiter, Saturn, with the fixed-star sphere above them.','Book of Instruction §121 (Batch 12 directly checked: planetary-order)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-order' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book of Instruction §121 (Batch 12 directly checked: planetary-order)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='planetary-order' AND w.slug='al-biruni-tafhim'
AND i.scope='Book of Instruction §121 (Batch 12 directly checked: planetary-order)' AND sp.locator_text='Batch 12 checked planetary-order: Book of Instruction §121';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'121','Batch 12 checked seven-planets: Book of Instruction §121',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked seven-planets: Book of Instruction §121');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī explicitly orders the seven moving planetary lights in concentric spheres and sets the fixed-star sphere beyond the planetary series.','Book of Instruction §121 (Batch 12 directly checked: seven-planets)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='seven-planets' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book of Instruction §121 (Batch 12 directly checked: seven-planets)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='seven-planets' AND w.slug='al-biruni-tafhim'
AND i.scope='Book of Instruction §121 (Batch 12 directly checked: seven-planets)' AND sp.locator_text='Batch 12 checked seven-planets: Book of Instruction §121';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'157','Batch 12 checked fixed-star: Book of Instruction §157',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked fixed-star: Book of Instruction §157');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī discusses fixed-star identification by celestial longitude and latitude and divides visible catalogue entries into successive magnitude classes.','Book of Instruction §157 (Batch 12 directly checked: fixed-star)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='fixed-star' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book of Instruction §157 (Batch 12 directly checked: fixed-star)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='fixed-star' AND w.slug='al-biruni-tafhim'
AND i.scope='Book of Instruction §157 (Batch 12 directly checked: fixed-star)' AND sp.locator_text='Batch 12 checked fixed-star: Book of Instruction §157';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'157','Batch 12 checked stellar-magnitude: Book of Instruction §157',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked stellar-magnitude: Book of Instruction §157');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī describes a six-class ordinal stellar magnitude catalogue; it is a premodern observational classification, not a modern calibrated logarithmic photometric scale.','Book of Instruction §157 (Batch 12 directly checked: stellar-magnitude)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='stellar-magnitude' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book of Instruction §157 (Batch 12 directly checked: stellar-magnitude)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='stellar-magnitude' AND w.slug='al-biruni-tafhim'
AND i.scope='Book of Instruction §157 (Batch 12 directly checked: stellar-magnitude)' AND sp.locator_text='Batch 12 checked stellar-magnitude: Book of Instruction §157';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'266','266','Book II',NULL,NULL,'Batch 12 checked critical-days: Book II pp.266',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked critical-days: Book II pp.266');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly evaluates medical critical checkpoints by the Moon separating 45, 90 or 135 degrees from its illness-start place and by subsequent planetary aspects.','Book II pp.266 (Batch 12 directly checked: critical-days)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='critical-days' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.266 (Batch 12 directly checked: critical-days)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='critical-days' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.266 (Batch 12 directly checked: critical-days)' AND sp.locator_text='Batch 12 checked critical-days: Book II pp.266';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'290','292','Book II',NULL,NULL,'Batch 12 checked critical-days: Book II pp.290-292',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked critical-days: Book II pp.290-292');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly distinguishes a sudden medical crisis from the series of critical and indicative lunar checkpoints, using the patient''s onset time and successive angular separations.','Book II pp.290-292 (Batch 12 directly checked: critical-days)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='critical-days' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.290-292 (Batch 12 directly checked: critical-days)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='critical-days' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.290-292 (Batch 12 directly checked: critical-days)' AND sp.locator_text='Batch 12 checked critical-days: Book II pp.290-292';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'266','266','Book II',NULL,NULL,'Batch 12 checked decumbiture: Book II pp.266',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked decumbiture: Book II pp.266');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly prefers the corrected Moon''s place when the sick patient first took to bed and permits the physician''s first consultation hour if onset time is unavailable.','Book II pp.266 (Batch 12 directly checked: decumbiture)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='decumbiture' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.266 (Batch 12 directly checked: decumbiture)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='decumbiture' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.266 (Batch 12 directly checked: decumbiture)' AND sp.locator_text='Batch 12 checked decumbiture: Book II pp.266';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'290','291','Book II',NULL,NULL,'Batch 12 checked decumbiture: Book II pp.290-291',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked decumbiture: Book II pp.290-291');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly separately describes the illness-first-invasion moment as primary for critical-day assessment and offers times of presentation to the physician as lower-confidence fallbacks.','Book II pp.290-291 (Batch 12 directly checked: decumbiture)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='decumbiture' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.290-291 (Batch 12 directly checked: decumbiture)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='decumbiture' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.290-291 (Batch 12 directly checked: decumbiture)' AND sp.locator_text='Batch 12 checked decumbiture: Book II pp.290-291';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'290','291','Book II',NULL,NULL,'Batch 12 checked medical-crisis: Book II pp.290-291',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked medical-crisis: Book II pp.290-291');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly defines the historical crisis as a sudden change in illness which his medical doctrine read as a move toward improvement or worsening.','Book II pp.290-291 (Batch 12 directly checked: medical-crisis)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='medical-crisis' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.290-291 (Batch 12 directly checked: medical-crisis)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='medical-crisis' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.290-291 (Batch 12 directly checked: medical-crisis)' AND sp.locator_text='Batch 12 checked medical-crisis: Book II pp.290-291';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'268','268','Book II',NULL,NULL,'Batch 12 checked melothesia: Book II pp.268',NULL,
'Inspected historical translation and matching page/section. Technical claim paraphrased; preserve source provenance, and do not generalize to all authors.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 12 checked melothesia: Book II pp.268');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s text attributed to Hermes on decumbiture relates the twelve signs to regions of the body, beginning with the head under Aries.','Book II pp.268 (Batch 12 directly checked: melothesia)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='melothesia' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book II pp.268 (Batch 12 directly checked: melothesia)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id
JOIN source_passages sp ON sp.edition_id=ed.id WHERE t.slug='melothesia' AND w.slug='lilly-christian-astrology'
AND i.scope='Book II pp.268 (Batch 12 directly checked: melothesia)' AND sp.locator_text='Batch 12 checked melothesia: Book II pp.268';

