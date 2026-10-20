-- Eleven directly checked William Lilly witnesses: Christian Astrology, Book III, printed pp.501–508,708–716,727–728,733–734.
-- Source paraphrases only; independently named editorial entries preserve earlier historical accounts.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'733','733','Book III',NULL,NULL,'Batch 11 checked Lilly — alfridary — p.733',NULL,
'Book III printed page 733 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — alfridary — p.733');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes the Lords of the Alfridary as seven-year rulers, beginning Sun/Venus/Mercury for a day nativity and Moon/Saturn/Jupiter for a night nativity.','Book III pp.733 (Batch 11 checked witness: alfridary)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='alfridary' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.733 (Batch 11 checked witness: alfridary)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='alfridary' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.733 (Batch 11 checked witness: alfridary)' AND sp.locator_text='Batch 11 checked Lilly — alfridary — p.733';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'716','716','Book III',NULL,NULL,'Batch 11 checked Lilly — monthly-profection — p.716',NULL,
'Book III printed page 716 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — monthly-profection — p.716');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly divides the solar year into thirteen equal profectional months and advances one sign at each interval beginning with the annual profected sign.','Book III pp.716 (Batch 11 checked witness: monthly-profection)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='monthly-profection' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.716 (Batch 11 checked witness: monthly-profection)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='monthly-profection' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.716 (Batch 11 checked witness: monthly-profection)' AND sp.locator_text='Batch 11 checked Lilly — monthly-profection — p.716';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'715','716','Book III',NULL,NULL,'Batch 11 checked Lilly — profection — p.715–716',NULL,
'Book III printed page 715–716 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — profection — p.715–716');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes annual profection as a thirty-degree or one-sign progression each solar year, beginning at the exact solar-return moment and repeating through twelve signs.','Book III pp.715–716 (Batch 11 checked witness: profection)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='profection' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.715–716 (Batch 11 checked witness: profection)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='profection' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.715–716 (Batch 11 checked witness: profection)' AND sp.locator_text='Batch 11 checked Lilly — profection — p.715–716';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'727','727','Book III',NULL,NULL,'Batch 11 checked Lilly — lord-of-year — p.727',NULL,
'Book III printed page 727 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — lord-of-year — p.727');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s Pisces 6°37 example gives Jupiter the first portion of a profectional year and Mars the remainder after the point enters Aries.','Book III pp.727 (Batch 11 checked witness: lord-of-year)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='lord-of-year' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.727 (Batch 11 checked witness: lord-of-year)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lord-of-year' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.727 (Batch 11 checked witness: lord-of-year)' AND sp.locator_text='Batch 11 checked Lilly — lord-of-year — p.727';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'728','728','Book III',NULL,NULL,'Batch 11 checked Lilly — lord-of-year — p.728',NULL,
'Book III printed page 728 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — lord-of-year — p.728');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly weighs his profectional Lord of the Year across radix and the annual revolution as well as current profectional condition.','Book III pp.728 (Batch 11 checked witness: lord-of-year)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='lord-of-year' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.728 (Batch 11 checked witness: lord-of-year)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lord-of-year' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.728 (Batch 11 checked witness: lord-of-year)' AND sp.locator_text='Batch 11 checked Lilly — lord-of-year — p.728';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'708','709','Book III',NULL,NULL,'Batch 11 checked Lilly — primary-direction — p.708–709',NULL,
'Book III printed page 708–709 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — primary-direction — p.708–709');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly reports Ptolemaic timing with oblique ascensions for the Ascendant, right ascensions for the Midheaven and degrees of the equator measured in years.','Book III pp.708–709 (Batch 11 checked witness: primary-direction)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='primary-direction' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.708–709 (Batch 11 checked witness: primary-direction)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='primary-direction' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.708–709 (Batch 11 checked witness: primary-direction)' AND sp.locator_text='Batch 11 checked Lilly — primary-direction — p.708–709';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'734','734','Book III',NULL,NULL,'Batch 11 checked Lilly — solar-revolution — p.734',NULL,
'Book III printed page 734 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — solar-revolution — p.734');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly defines the solar revolution as the Sun''s return to its precise radix longitude and demonstrates interpolating the return time from an ephemeris.','Book III pp.734 (Batch 11 checked witness: solar-revolution)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='solar-revolution' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.734 (Batch 11 checked witness: solar-revolution)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='solar-revolution' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.734 (Batch 11 checked witness: solar-revolution)' AND sp.locator_text='Batch 11 checked Lilly — solar-revolution — p.734';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'734','734','Book III',NULL,NULL,'Batch 11 checked Lilly — annual-revolution — p.734',NULL,
'Book III printed page 734 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — annual-revolution — p.734');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly calls the revolution the annual recurrence of the Sun at the specific starting longitude and minute of a nativity or other point.','Book III pp.734 (Batch 11 checked witness: annual-revolution)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='annual-revolution' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.734 (Batch 11 checked witness: annual-revolution)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='annual-revolution' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.734 (Batch 11 checked witness: annual-revolution)' AND sp.locator_text='Batch 11 checked Lilly — annual-revolution — p.734';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'501','502','Book III',NULL,NULL,'Batch 11 checked Lilly — trutine-of-hermes — p.501–502',NULL,
'Book III printed page 501–502 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — trutine-of-hermes — p.501–502');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly associates the Moon at birth with the conception Ascendant and explicitly notes that the method may fail to give exact birth-degree rectification.','Book III pp.501–502 (Batch 11 checked witness: trutine-of-hermes)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='trutine-of-hermes' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.501–502 (Batch 11 checked witness: trutine-of-hermes)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='trutine-of-hermes' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.501–502 (Batch 11 checked witness: trutine-of-hermes)' AND sp.locator_text='Batch 11 checked Lilly — trutine-of-hermes — p.501–502';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'507','508','Book III',NULL,NULL,'Batch 11 checked Lilly — rectification-by-accidents — p.507–508',NULL,
'Book III printed page 507–508 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — rectification-by-accidents — p.507–508');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly prefers adjusting a birth estimate with dated past accidents and directions of the Ascendant/Midheaven to promittors, rejecting some alternative rectification techniques.','Book III pp.507–508 (Batch 11 checked witness: rectification-by-accidents)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='rectification-by-accidents' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.507–508 (Batch 11 checked witness: rectification-by-accidents)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='rectification-by-accidents' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.507–508 (Batch 11 checked witness: rectification-by-accidents)' AND sp.locator_text='Batch 11 checked Lilly — rectification-by-accidents — p.507–508';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'507','507','Book III',NULL,NULL,'Batch 11 checked Lilly — promittor — p.507',NULL,
'Book III printed page 507 checked directly in the historical digital retype; source claim paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 11 checked Lilly — promittor — p.507');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly calls the Ascendant a significator and the planet contacted by body or aspect the promittor within his rectification directions.','Book III pp.507 (Batch 11 checked witness: promittor)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='promittor' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III pp.507 (Batch 11 checked witness: promittor)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='promittor' AND w.slug='lilly-christian-astrology'
AND i.scope='Book III pp.507 (Batch 11 checked witness: promittor)' AND sp.locator_text='Batch 11 checked Lilly — promittor — p.507';

