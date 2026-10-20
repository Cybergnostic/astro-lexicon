-- Batch 09. Fifteen directly inspected and separately cited Lilly witnesses, Book I pp. 32,109–114 and Book III p.512.
-- Witnesses are paraphrases of the user-provided Christian Astrology; no translated text is quoted.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'32','32','Book I',NULL,NULL,'Batch 09 direct Lilly — biquintile — Book I p.32',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.32. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — biquintile — Book I p.32');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly lists 144° biquintile among recently added aspects attributed to Kepler.','Book I p.32 (Batch 09 direct passage: biquintile)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='biquintile' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.32 (Batch 09 direct passage: biquintile)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='biquintile' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.32 (Batch 09 direct passage: biquintile)' AND sp.locator_text='Batch 09 direct Lilly — biquintile — Book I p.32';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'32','32','Book I',NULL,NULL,'Batch 09 direct Lilly — quincunx — Book I p.32',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.32. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — quincunx — Book I p.32');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly lists 150° quincunx among newer aspects attributed to Kepler, distinguishing this later minor aspect from the older sign relationship.','Book I p.32 (Batch 09 direct passage: quincunx)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='quincunx' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.32 (Batch 09 direct passage: quincunx)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='quincunx' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.32 (Batch 09 direct passage: quincunx)' AND sp.locator_text='Batch 09 direct Lilly — quincunx — Book I p.32';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'32','32','Book I',NULL,NULL,'Batch 09 direct Lilly — quintile — Book I p.32',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.32. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — quintile — Book I p.32');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly gives 72° quintile in his list of newer aspects attributed to Kepler.','Book I p.32 (Batch 09 direct passage: quintile)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='quintile' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.32 (Batch 09 direct passage: quintile)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='quintile' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.32 (Batch 09 direct passage: quintile)' AND sp.locator_text='Batch 09 direct Lilly — quintile — Book I p.32';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'512','512','Book III',NULL,NULL,'Batch 09 direct Lilly — semiquintile — Book III p.512',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.512. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — semiquintile — Book III p.512');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s directions table assigns 36° to semiquintile among the expanded angles.','Book III p.512 (Batch 09 direct passage: semiquintile)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='semiquintile' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III p.512 (Batch 09 direct passage: semiquintile)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='semiquintile' AND w.slug='lilly-christian-astrology' AND i.scope='Book III p.512 (Batch 09 direct passage: semiquintile)' AND sp.locator_text='Batch 09 direct Lilly — semiquintile — Book III p.512';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'32','32','Book I',NULL,NULL,'Batch 09 direct Lilly — semisextile — Book I p.32',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.32. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — semisextile — Book I p.32');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly gives 30° semisextile among the newer angles attributed to Kepler.','Book I p.32 (Batch 09 direct passage: semisextile)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='semisextile' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.32 (Batch 09 direct passage: semisextile)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='semisextile' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.32 (Batch 09 direct passage: semisextile)' AND sp.locator_text='Batch 09 direct Lilly — semisextile — Book I p.32';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'512','512','Book III',NULL,NULL,'Batch 09 direct Lilly — semisquare — Book III p.512',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.512. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — semisquare — Book III p.512');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly names the 45° semiquadrate in his later directions table.','Book III p.512 (Batch 09 direct passage: semisquare)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='semisquare' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III p.512 (Batch 09 direct passage: semisquare)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='semisquare' AND w.slug='lilly-christian-astrology' AND i.scope='Book III p.512 (Batch 09 direct passage: semisquare)' AND sp.locator_text='Batch 09 direct Lilly — semisquare — Book III p.512';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'512','512','Book III',NULL,NULL,'Batch 09 direct Lilly — sesquiquadrate — Book III p.512',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.512. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — sesquiquadrate — Book III p.512');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s table assigns 135° to sesquiquadrate, classified among the newer angular relations.','Book III p.512 (Batch 09 direct passage: sesquiquadrate)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='sesquiquadrate' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III p.512 (Batch 09 direct passage: sesquiquadrate)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='sesquiquadrate' AND w.slug='lilly-christian-astrology' AND i.scope='Book III p.512 (Batch 09 direct passage: sesquiquadrate)' AND sp.locator_text='Batch 09 direct Lilly — sesquiquadrate — Book III p.512';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'512','512','Book III',NULL,NULL,'Batch 09 direct Lilly — sesquiquintile — Book III p.512',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.512. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — sesquiquintile — Book III p.512');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly gives 108° to sesquiquintile in his directions table; Book I calls 108° tredecile.','Book III p.512 (Batch 09 direct passage: sesquiquintile)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='sesquiquintile' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III p.512 (Batch 09 direct passage: sesquiquintile)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='sesquiquintile' AND w.slug='lilly-christian-astrology' AND i.scope='Book III p.512 (Batch 09 direct passage: sesquiquintile)' AND sp.locator_text='Batch 09 direct Lilly — sesquiquintile — Book III p.512';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'113','113','Book I',NULL,NULL,'Batch 09 direct Lilly — cazimi — Book I p.113',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.113. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — cazimi — Book I p.113');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly uses 17 arcminutes as his cazimi threshold and illustrates it with Sun 15°30′ Taurus, Mercury 15°25′ Taurus.','Book I p.113 (Batch 09 direct passage: cazimi)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113 (Batch 09 direct passage: cazimi)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.113 (Batch 09 direct passage: cazimi)' AND sp.locator_text='Batch 09 direct Lilly — cazimi — Book I p.113';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'113','113','Book I',NULL,NULL,'Batch 09 direct Lilly — combustion — Book I p.113',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.113. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — combustion — Book I p.113');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly uses a same-sign 8°30′ solar proximity condition for combustion, acknowledging disagreement over the allowance.','Book I p.113 (Batch 09 direct passage: combustion)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113 (Batch 09 direct passage: combustion)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.113 (Batch 09 direct passage: combustion)' AND sp.locator_text='Batch 09 direct Lilly — combustion — Book I p.113';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'114','114','Book I',NULL,NULL,'Batch 09 direct Lilly — besiegement — Book I p.114',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.114. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — besiegement — Book I p.114');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes Mars at 10° Aries, Venus at 13° Aries and Saturn at 15° Aries as bodily besiegement.','Book I p.114 (Batch 09 direct passage: besiegement)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='besiegement' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.114 (Batch 09 direct passage: besiegement)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='besiegement' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.114 (Batch 09 direct passage: besiegement)' AND sp.locator_text='Batch 09 direct Lilly — besiegement — Book I p.114';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'110','110','Book I',NULL,NULL,'Batch 09 direct Lilly — planetary-orb — Book I p.110',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.110. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — planetary-orb — Book I p.110');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly combines the half-orbs of Saturn and Jupiter to 9° for complete separation from their rays.','Book I p.110 (Batch 09 direct passage: planetary-orb)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='planetary-orb' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.110 (Batch 09 direct passage: planetary-orb)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='planetary-orb' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.110 (Batch 09 direct passage: planetary-orb)' AND sp.locator_text='Batch 09 direct Lilly — planetary-orb — Book I p.110';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'113','113','Book I',NULL,NULL,'Batch 09 direct Lilly — inferior-planet — Book I p.113',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.113. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — inferior-planet — Book I p.113');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly explicitly includes the Moon with Venus and Mercury among the inferior planets in his planetary-order description.','Book I p.113 (Batch 09 direct passage: inferior-planet)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='inferior-planet' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113 (Batch 09 direct passage: inferior-planet)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='inferior-planet' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.113 (Batch 09 direct passage: inferior-planet)' AND sp.locator_text='Batch 09 direct Lilly — inferior-planet — Book I p.113';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'113','113','Book I',NULL,NULL,'Batch 09 direct Lilly — superior-planet — Book I p.113',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.113. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — superior-planet — Book I p.113');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly identifies Saturn, Jupiter and Mars as the three superior planets, above the Sun in the traditional order.','Book I p.113 (Batch 09 direct passage: superior-planet)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='superior-planet' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113 (Batch 09 direct passage: superior-planet)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='superior-planet' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.113 (Batch 09 direct passage: superior-planet)' AND sp.locator_text='Batch 09 direct Lilly — superior-planet — Book I p.113';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'109','109','Book I',NULL,NULL,'Batch 09 direct Lilly — aspect — Book I p.109',NULL,
'Source directly inspected in user-supplied 1647 digital retype; printed p.109. Paraphrased, not quoted.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 09 direct Lilly — aspect — Book I p.109');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly presents dexter and sinister rays for sextile, square, trine and opposition, distinct from bodily conjunction.','Book I p.109 (Batch 09 direct passage: aspect)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='aspect' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.109 (Batch 09 direct passage: aspect)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='aspect' AND w.slug='lilly-christian-astrology' AND i.scope='Book I p.109 (Batch 09 direct passage: aspect)' AND sp.locator_text='Batch 09 direct Lilly — aspect — Book I p.109';

