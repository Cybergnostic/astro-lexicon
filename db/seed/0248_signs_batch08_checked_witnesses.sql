-- Batch 08: directly read al-Biruni, Book of Instruction, §§352–354 and 377.
-- Each interpretation is source-scoped and cited. No English translation text is quoted.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'377','Batch 08 direct al-Bīrūnī §377: Natural opposites without direct aspect',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Natural opposites without direct aspect');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī reports Abū Maʿshar''s natural opposites between non-aspecting signs linked by course or power, giving concrete sign-pair examples.','§377 (Batch 08 direct witness: Natural opposites without direct aspect)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='natural-opposition' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§377 (Batch 08 direct witness: Natural opposites without direct aspect)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='natural-opposition' AND w.slug='al-biruni-tafhim' AND i.scope='§377 (Batch 08 direct witness: Natural opposites without direct aspect)' AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Natural opposites without direct aspect';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'377','Batch 08 direct al-Bīrūnī §377: Natural sextiles as non-beholding pairs',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Natural sextiles as non-beholding pairs');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes Abū Maʿshar''s natural sextiles, based on non-aspectual sign relations, from ordinary geometric sextiles.','§377 (Batch 08 direct witness: Natural sextiles as non-beholding pairs)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='natural-sextile' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§377 (Batch 08 direct witness: Natural sextiles as non-beholding pairs)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='natural-sextile' AND w.slug='al-biruni-tafhim' AND i.scope='§377 (Batch 08 direct witness: Natural sextiles as non-beholding pairs)' AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Natural sextiles as non-beholding pairs';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'377','Batch 08 direct al-Bīrūnī §377: Rulership agreement distinguished from geometrical correspondence',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Rulership agreement distinguished from geometrical correspondence');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī says Abū Maʿshar also calls signs sharing a presiding planet agreeing in course, distinct from al-Bīrūnī''s equinox and solstice correspondences.','§377 (Batch 08 direct witness: Rulership agreement distinguished from geometrical correspondence)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='signs-agreeing-in-path' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§377 (Batch 08 direct witness: Rulership agreement distinguished from geometrical correspondence)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='signs-agreeing-in-path' AND w.slug='al-biruni-tafhim' AND i.scope='§377 (Batch 08 direct witness: Rulership agreement distinguished from geometrical correspondence)' AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Rulership agreement distinguished from geometrical correspondence';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'377','Batch 08 direct al-Bīrūnī §377: Equal ascensions and complementary daylight',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Equal ascensions and complementary daylight');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī connects signs equidistant from an equinox with corresponding ascensions and reciprocal lengths of day and night, with named sign examples.','§377 (Batch 08 direct witness: Equal ascensions and complementary daylight)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='signs-agreeing-in-power' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§377 (Batch 08 direct witness: Equal ascensions and complementary daylight)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='signs-agreeing-in-power' AND w.slug='al-biruni-tafhim' AND i.scope='§377 (Batch 08 direct witness: Equal ascensions and complementary daylight)' AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Equal ascensions and complementary daylight';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'377','Batch 08 direct al-Bīrūnī §377: Equal ascensions versus solstitial parallel',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Equal ascensions versus solstitial parallel');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes equinoctially mirrored equal-ascension signs from signs corresponding about a solstitial point, and notes varying terminology between books.','§377 (Batch 08 direct witness: Equal ascensions versus solstitial parallel)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='signs-agreeing-in-zone' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§377 (Batch 08 direct witness: Equal ascensions versus solstitial parallel)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='signs-agreeing-in-zone' AND w.slug='al-biruni-tafhim' AND i.scope='§377 (Batch 08 direct witness: Equal ascensions versus solstitial parallel)' AND p.locator_text='Batch 08 direct al-Bīrūnī §377: Equal ascensions versus solstitial parallel';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'353','Batch 08 direct al-Bīrūnī §353: Half-voiced sign examples',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Half-voiced sign examples');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī classes Aries, Taurus and Leo as half-voiced, distinct from his louder, weaker and voiceless figure categories.','§353 (Batch 08 direct witness: Half-voiced sign examples)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='half-voiced-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§353 (Batch 08 direct witness: Half-voiced sign examples)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='half-voiced-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§353 (Batch 08 direct witness: Half-voiced sign examples)' AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Half-voiced sign examples';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'353','Batch 08 direct al-Bīrūnī §353: Loud-voiced human figures',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Loud-voiced human figures');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī describes Gemini, Virgo and Libra as loud-voiced and distinguishes Gemini as capable of speech.','§353 (Batch 08 direct witness: Loud-voiced human figures)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='powerful-voiced-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§353 (Batch 08 direct witness: Loud-voiced human figures)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='powerful-voiced-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§353 (Batch 08 direct witness: Loud-voiced human figures)' AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Loud-voiced human figures';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'353','Batch 08 direct al-Bīrūnī §353: Weak voice in Capricorn and Aquarius',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Weak voice in Capricorn and Aquarius');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī places Capricorn and Aquarius in the weak-voiced sign-image class.','§353 (Batch 08 direct witness: Weak voice in Capricorn and Aquarius)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='weak-voiced-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§353 (Batch 08 direct witness: Weak voice in Capricorn and Aquarius)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='weak-voiced-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§353 (Batch 08 direct witness: Weak voice in Capricorn and Aquarius)' AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Weak voice in Capricorn and Aquarius';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'353','Batch 08 direct al-Bīrūnī §353: Voiceless signs in one witness',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Voiceless signs in one witness');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī names Cancer, Scorpio and Pisces as voiceless under his zodiacal figure taxonomy.','§353 (Batch 08 direct witness: Voiceless signs in one witness)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='voiceless-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§353 (Batch 08 direct witness: Voiceless signs in one witness)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='voiceless-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§353 (Batch 08 direct witness: Voiceless signs in one witness)' AND p.locator_text='Batch 08 direct al-Bīrūnī §353: Voiceless signs in one witness';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'354','Batch 08 direct al-Bīrūnī §354: Small-family versus sterile sign classes',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §354: Small-family versus sterile sign classes');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes signs linked with small families from signs or portions linked more strongly with sterility in a historical sign taxonomy.','§354 (Batch 08 direct witness: Small-family versus sterile sign classes)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='barren-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§354 (Batch 08 direct witness: Small-family versus sterile sign classes)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='barren-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§354 (Batch 08 direct witness: Small-family versus sterile sign classes)' AND p.locator_text='Batch 08 direct al-Bīrūnī §354: Small-family versus sterile sign classes';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'354','Batch 08 direct al-Bīrūnī §354: Large-family symbols and sign portions',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §354: Large-family symbols and sign portions');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī names Cancer, Scorpio, Pisces and the latter portion of Capricorn for large families, while discussing twins and composite sign-symbolism separately.','§354 (Batch 08 direct witness: Large-family symbols and sign portions)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='fecund-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§354 (Batch 08 direct witness: Large-family symbols and sign portions)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='fecund-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§354 (Batch 08 direct witness: Large-family symbols and sign portions)' AND p.locator_text='Batch 08 direct al-Bīrūnī §354: Large-family symbols and sign portions';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'352','Batch 08 direct al-Bīrūnī §352: Human and composite zodiac images',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §352: Human and composite zodiac images');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes human and animal sign figures and reports Indian human/bipedal sign memberships that can involve portions of composite figures.','§352 (Batch 08 direct witness: Human and composite zodiac images)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='human-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§352 (Batch 08 direct witness: Human and composite zodiac images)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='human-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§352 (Batch 08 direct witness: Human and composite zodiac images)' AND p.locator_text='Batch 08 direct al-Bīrūnī §352: Human and composite zodiac images';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'352','Batch 08 direct al-Bīrūnī §352: Four-footed and partial zodiacal figures',NULL,
 'Source author paraphrased from Wright translation inspected in original PDF; exact section is locator; translator footnotes excluded.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 08 direct al-Bīrūnī §352: Four-footed and partial zodiacal figures');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī gives Aries, Taurus and Leo among four-footed figures, with portions of Sagittarius and in some accounts Capricorn also included.','§352 (Batch 08 direct witness: Four-footed and partial zodiacal figures)','direct','reviewed','A' FROM terms t CROSS JOIN works w
WHERE t.slug='quadruped-sign' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS(SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§352 (Batch 08 direct witness: Four-footed and partial zodiacal figures)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='quadruped-sign' AND w.slug='al-biruni-tafhim' AND i.scope='§352 (Batch 08 direct witness: Four-footed and partial zodiacal figures)' AND p.locator_text='Batch 08 direct al-Bīrūnī §352: Four-footed and partial zodiacal figures';

