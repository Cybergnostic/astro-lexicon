-- Direct witnesses for Batch 04: William Lilly, Christian Astrology, Book I.
-- Printed pages verified in the user-provided 1647 digital retype, PDF page = printed page + 21 for this range.
-- Paraphrases only; do not commit lengthy source text or pretend manuscript/edition-critical verification.
PRAGMA foreign_keys=ON;

-- dexter-aspect: Lilly, Christian Astrology I, 109
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'109','109','Book I',NULL,NULL,'Batch 04 checked Lilly — dexter-aspect — Dexter aspect: Aries toward Aquarius',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — dexter-aspect — Dexter aspect: Aries toward Aquarius');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly illustrates dexter direction by the sextile cast from Aries to Aquarius, contrary to the succession of signs.','Book I pp. 109 (Batch 04 checked passage: Dexter aspect: Aries toward Aquarius)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='dexter-aspect' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 109 (Batch 04 checked passage: Dexter aspect: Aries toward Aquarius)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='dexter-aspect' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 109 (Batch 04 checked passage: Dexter aspect: Aries toward Aquarius)' AND sp.locator_text='Batch 04 checked Lilly — dexter-aspect — Dexter aspect: Aries toward Aquarius';

-- sinister-aspect: Lilly, Christian Astrology I, 109
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'109','109','Book I',NULL,NULL,'Batch 04 checked Lilly — sinister-aspect — Sinister aspect: Aries toward Gemini',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — sinister-aspect — Sinister aspect: Aries toward Gemini');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly illustrates sinister direction with Aries to Gemini, along the zodiacal succession, and calls the dexter direction more forcible.','Book I pp. 109 (Batch 04 checked passage: Sinister aspect: Aries toward Gemini)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='sinister-aspect' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 109 (Batch 04 checked passage: Sinister aspect: Aries toward Gemini)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='sinister-aspect' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 109 (Batch 04 checked passage: Sinister aspect: Aries toward Gemini)' AND sp.locator_text='Batch 04 checked Lilly — sinister-aspect — Sinister aspect: Aries toward Gemini';

-- inconjunct: Lilly, Christian Astrology I, 109
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'109','109','Book I',NULL,NULL,'Batch 04 checked Lilly — inconjunct — Non-beholding signs',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — inconjunct — Non-beholding signs');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes non-beholding or inconjunct sign relationships, including Aries with Taurus or Scorpio.','Book I pp. 109 (Batch 04 checked passage: Non-beholding signs)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='inconjunct' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 109 (Batch 04 checked passage: Non-beholding signs)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='inconjunct' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 109 (Batch 04 checked passage: Non-beholding signs)' AND sp.locator_text='Batch 04 checked Lilly — inconjunct — Non-beholding signs';

-- separation: Lilly, Christian Astrology I, 110
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'110','110','Book I',NULL,NULL,'Batch 04 checked Lilly — separation — Separation and the allowance of half-orbs',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — separation — Separation and the allowance of half-orbs');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly distinguishes immediate post-perfection separation from complete removal from the other planet''s rays, calculated from the combined half-orbs.','Book I pp. 110 (Batch 04 checked passage: Separation and the allowance of half-orbs)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='separation' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 110 (Batch 04 checked passage: Separation and the allowance of half-orbs)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='separation' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 110 (Batch 04 checked passage: Separation and the allowance of half-orbs)' AND sp.locator_text='Batch 04 checked Lilly — separation — Separation and the allowance of half-orbs';

-- prohibition: Lilly, Christian Astrology I, 110–111
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'110','111','Book I',NULL,NULL,'Batch 04 checked Lilly — prohibition — Bodily and aspectual prohibition',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — prohibition — Bodily and aspectual prohibition');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly distinguishes prohibition by intervening conjunction from prohibition by an intervening aspect before the intended significators complete contact.','Book I pp. 110-111 (Batch 04 checked passage: Bodily and aspectual prohibition)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 110-111 (Batch 04 checked passage: Bodily and aspectual prohibition)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='prohibition' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 110-111 (Batch 04 checked passage: Bodily and aspectual prohibition)' AND sp.locator_text='Batch 04 checked Lilly — prohibition — Bodily and aspectual prohibition';

-- refranation: Lilly, Christian Astrology I, 111
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'111','111','Book I',NULL,NULL,'Batch 04 checked Lilly — refranation — Retrograde withdrawal before conjunction',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — refranation — Retrograde withdrawal before conjunction');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly''s Mars/Saturn example describes the applicant turning retrograde before its intended conjunction can perfect.','Book I pp. 111 (Batch 04 checked passage: Retrograde withdrawal before conjunction)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 111 (Batch 04 checked passage: Retrograde withdrawal before conjunction)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='refranation' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 111 (Batch 04 checked passage: Retrograde withdrawal before conjunction)' AND sp.locator_text='Batch 04 checked Lilly — refranation — Retrograde withdrawal before conjunction';

-- frustration: Lilly, Christian Astrology I, 112–113
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'112','113','Book I',NULL,NULL,'Batch 04 checked Lilly — frustration — Mercury Mars Jupiter frustration example',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — frustration — Mercury Mars Jupiter frustration example');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Mercury applies to Mars in Aries but Mars joins Jupiter first; Lilly calls the original conjunction frustrated.','Book I pp. 112-113 (Batch 04 checked passage: Mercury Mars Jupiter frustration example)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='frustration' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 112-113 (Batch 04 checked passage: Mercury Mars Jupiter frustration example)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='frustration' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 112-113 (Batch 04 checked passage: Mercury Mars Jupiter frustration example)' AND sp.locator_text='Batch 04 checked Lilly — frustration — Mercury Mars Jupiter frustration example';

-- void-of-course: Lilly, Christian Astrology I, 112
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'112','112','Book I',NULL,NULL,'Batch 04 checked Lilly — void-of-course — No new application during current sign',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — void-of-course — No new application during current sign');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly calls a planet void of course when it has separated and does not apply to another during the rest of its passage through the sign.','Book I pp. 112 (Batch 04 checked passage: No new application during current sign)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 112 (Batch 04 checked passage: No new application during current sign)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 112 (Batch 04 checked passage: No new application during current sign)' AND sp.locator_text='Batch 04 checked Lilly — void-of-course — No new application during current sign';

-- void-of-course: Lilly, Christian Astrology I, 122
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'122','122','Book I',NULL,NULL,'Batch 04 checked Lilly — void-of-course — Judgment qualified in four signs',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — void-of-course — Judgment qualified in four signs');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'In considerations before judgment, Lilly qualifies the unfavorable interpretation of the void-of-course Moon in Taurus, Cancer, Sagittarius and Pisces.','Book I pp. 122 (Batch 04 checked passage: Judgment qualified in four signs)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 122 (Batch 04 checked passage: Judgment qualified in four signs)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='void-of-course' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 122 (Batch 04 checked passage: Judgment qualified in four signs)' AND sp.locator_text='Batch 04 checked Lilly — void-of-course — Judgment qualified in four signs';

-- collection-of-light: Lilly, Christian Astrology I, 126
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'126','126','Book I',NULL,NULL,'Batch 04 checked Lilly — collection-of-light — Two significators reach one collecting planet',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — collection-of-light — Two significators reach one collecting planet');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes two principal significators applying toward a weightier third planet and includes a reception requirement by essential dignity in his collection rule.','Book I pp. 126 (Batch 04 checked passage: Two significators reach one collecting planet)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='collection-of-light' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 126 (Batch 04 checked passage: Two significators reach one collecting planet)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='collection-of-light' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 126 (Batch 04 checked passage: Two significators reach one collecting planet)' AND sp.locator_text='Batch 04 checked Lilly — collection-of-light — Two significators reach one collecting planet';

-- horary-question: Lilly, Christian Astrology I, 126–128
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'126','128','Book I',NULL,NULL,'Batch 04 checked Lilly — horary-question — Horary significators and turned houses',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — horary-question — Horary significators and turned houses');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly assigns the querent to the Ascendant and its lord and uses topical and turned houses to represent the quesited and connected topics.','Book I pp. 126-128 (Batch 04 checked passage: Horary significators and turned houses)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='horary-question' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 126-128 (Batch 04 checked passage: Horary significators and turned houses)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='horary-question' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 126-128 (Batch 04 checked passage: Horary significators and turned houses)' AND sp.locator_text='Batch 04 checked Lilly — horary-question — Horary significators and turned houses';

-- perfection: Lilly, Christian Astrology I, 126
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'126','126','Book I',NULL,NULL,'Batch 04 checked Lilly — perfection — Perfection by translation and collection',NULL,
  'Checked the historical English text in the user-supplied digital retype; descriptions are paraphrases rather than quotes.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 04 checked Lilly — perfection — Perfection by translation and collection');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Lilly describes perfection through translation or collection of light even where principal significators cannot perfect directly.','Book I pp. 126 (Batch 04 checked passage: Perfection by translation and collection)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='perfection' AND w.slug='lilly-christian-astrology'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I pp. 126 (Batch 04 checked passage: Perfection by translation and collection)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='perfection' AND w.slug='lilly-christian-astrology'
AND i.scope='Book I pp. 126 (Batch 04 checked passage: Perfection by translation and collection)' AND sp.locator_text='Batch 04 checked Lilly — perfection — Perfection by translation and collection';

