-- Batch 07 directly checked al-Bīrūnī, Book of Instruction, §347 and §§386-401 (Wright 1934).
-- Source-specific paraphrases: no translator notes are misattributed to the historical author.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Jupiter',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Jupiter');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī classes Jupiter as a moderately warm and moist, masculine, diurnal greater benefic; he distinguishes general planetary nature from later conditional testimony.','§386-401 (Batch 07 direct check: Planetary nature, Jupiter)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='jupiter' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Jupiter)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='jupiter' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Jupiter)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Jupiter';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mars',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mars');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī classes Mars as extremely hot and dry, a nocturnal lesser malefic, and masculine while noting an alternative feminine attribution.','§386-401 (Batch 07 direct check: Planetary nature, Mars)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='mars' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Mars)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='mars' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Mars)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mars';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mercury',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mercury');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī attributes moderately cold and dry nature to Mercury and says its expression takes on characteristics of associated planets.','§386-401 (Batch 07 direct check: Planetary nature, Mercury)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='mercury' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Mercury)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='mercury' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Mercury)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Mercury';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Moon',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Moon');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī describes the Moon as cold and moist, feminine and nocturnal, with varying benefic and malefic expressions.','§386-401 (Batch 07 direct check: Planetary nature, Moon)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='moon' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Moon)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='moon' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Moon)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Moon';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Sun',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Sun');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī attributes predominant heat and some dryness to the Sun and describes it as masculine and diurnal.','§386-401 (Batch 07 direct check: Planetary nature, Sun)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='sun' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Sun)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='sun' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Sun)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Sun';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'386-401','Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Venus',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Venus');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī describes Venus as moderately cold and particularly moist, a feminine nocturnal lesser benefic.','§386-401 (Batch 07 direct check: Planetary nature, Venus)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='venus' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Venus)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='venus' AND w.slug='al-biruni-tafhim' AND i.scope='§386-401 (Batch 07 direct check: Planetary nature, Venus)' AND p.locator_text='Batch 07 checked al-Bīrūnī §386-401 — Planetary nature, Venus';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Air, signs, and humoral analogy',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Air, signs, and humoral analogy');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī relates hot and moist signs to the airy elemental nature and to blood within the traditional humoral correspondences.','§347 (Batch 07 direct check: Air, signs, and humoral analogy)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='element-air' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Air, signs, and humoral analogy)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='element-air' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Air, signs, and humoral analogy)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Air, signs, and humoral analogy';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Earth, signs, and humoral analogy',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Earth, signs, and humoral analogy');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī relates cold and dry signs to the earthy elemental nature and to black bile.','§347 (Batch 07 direct check: Earth, signs, and humoral analogy)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='element-earth' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Earth, signs, and humoral analogy)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='element-earth' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Earth, signs, and humoral analogy)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Earth, signs, and humoral analogy';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Fire, signs, and humoral analogy',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Fire, signs, and humoral analogy');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī relates hot and dry signs to the fiery elemental nature and to yellow bile.','§347 (Batch 07 direct check: Fire, signs, and humoral analogy)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='element-fire' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Fire, signs, and humoral analogy)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='element-fire' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Fire, signs, and humoral analogy)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Fire, signs, and humoral analogy';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Water, signs, and humoral analogy',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Water, signs, and humoral analogy');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī relates cold and moist signs to the watery elemental nature and to phlegm, and then notes alternative Indian assignments for individual signs.','§347 (Batch 07 direct check: Water, signs, and humoral analogy)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='element-water' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Water, signs, and humoral analogy)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='element-water' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Water, signs, and humoral analogy)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Water, signs, and humoral analogy';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Sign qualities and variant Indian classifications',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Sign qualities and variant Indian classifications');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī sets out the four primary quality combinations for signs, then reports Indian variations concerning Pisces, Capricorn, Aquarius, Scorpio and Cancer.','§347 (Batch 07 direct check: Sign qualities and variant Indian classifications)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='zodiac-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Sign qualities and variant Indian classifications)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='zodiac-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Sign qualities and variant Indian classifications)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Sign qualities and variant Indian classifications';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,NULL,NULL,'Book of Instruction',NULL,'347','Batch 07 checked al-Bīrūnī §347 — Qualities, elements, and bodily humours',NULL,'Direct inspection of Wright English translation; paraphrase of authorial claim.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=ed.id AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Qualities, elements, and bodily humours');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī relates the four qualitative sign classes to elements and bodily humours, establishing these correspondences as historical natural-philosophical categories.','§347 (Batch 07 direct check: Qualities, elements, and bodily humours)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='temperament' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§347 (Batch 07 direct check: Qualities, elements, and bodily humours)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages p ON p.edition_id=ed.id
WHERE t.slug='temperament' AND w.slug='al-biruni-tafhim' AND i.scope='§347 (Batch 07 direct check: Qualities, elements, and bodily humours)' AND p.locator_text='Batch 07 checked al-Bīrūnī §347 — Qualities, elements, and bodily humours';

