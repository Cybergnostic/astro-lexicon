-- Sixteen directly inspected, individually cited Abū Maʿshar Lots-family witnesses, Part VIII.
-- Brill 2019 bilingual edition; English accounts paraphrased, no long copyrighted translation quotations.
-- Especially note the source-internal Hermes Enemies §4.83 / §6.15 endpoint divergence.
PRAGMA foreign_keys=ON;

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'875','875','Part VIII','4','4.31','Batch 10 directly inspected — hermes-lot-of-marriage-men — Part VIII §4.31',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 875.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — hermes-lot-of-marriage-men — Part VIII §4.31');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Hermes fixed Saturn to Venus in male marriage; Abū Maʿshar reports a reversed nocturnal opinion but prefers the fixed rule.','Part VIII §4.31 (Batch 10 checked passage: hermes-lot-of-marriage-men)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='hermes-lot-of-marriage-men' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.31 (Batch 10 checked passage: hermes-lot-of-marriage-men)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='hermes-lot-of-marriage-men' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.31 (Batch 10 checked passage: hermes-lot-of-marriage-men)' AND sp.locator_text='Batch 10 directly inspected — hermes-lot-of-marriage-men — Part VIII §4.31';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'875','875','Part VIII','4','4.32','Batch 10 directly inspected — walis-lot-of-marriage-men — Part VIII §4.32',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 875.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — walis-lot-of-marriage-men — Part VIII §4.32');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Wālīs'' male marriage Lot is extracted Sun to Venus for both sects, unlike the Hermetic Saturn-to-Venus formulation.','Part VIII §4.32 (Batch 10 checked passage: walis-lot-of-marriage-men)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='walis-lot-of-marriage-men' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.32 (Batch 10 checked passage: walis-lot-of-marriage-men)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='walis-lot-of-marriage-men' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.32 (Batch 10 checked passage: walis-lot-of-marriage-men)' AND sp.locator_text='Batch 10 directly inspected — walis-lot-of-marriage-men — Part VIII §4.32';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'877','877','Part VIII','4','4.36','Batch 10 directly inspected — hermes-lot-of-marriage-women — Part VIII §4.36',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 877.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — hermes-lot-of-marriage-women — Part VIII §4.36');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Hermes'' female marriage Lot uses Venus to Saturn unchanged by sect, unlike his reverse-endpoint male marriage Lot.','Part VIII §4.36 (Batch 10 checked passage: hermes-lot-of-marriage-women)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='hermes-lot-of-marriage-women' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.36 (Batch 10 checked passage: hermes-lot-of-marriage-women)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='hermes-lot-of-marriage-women' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.36 (Batch 10 checked passage: hermes-lot-of-marriage-women)' AND sp.locator_text='Batch 10 directly inspected — hermes-lot-of-marriage-women — Part VIII §4.36';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'877','877','Part VIII','4','4.37','Batch 10 directly inspected — walis-lot-of-marriage-women — Part VIII §4.37',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 877.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — walis-lot-of-marriage-women — Part VIII §4.37');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Wālīs'' female marriage Lot uses Moon to Mars fixed by day and night; some Persians reverse it at night, rejected by Abū Maʿshar.','Part VIII §4.37 (Batch 10 checked passage: walis-lot-of-marriage-women)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='walis-lot-of-marriage-women' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.37 (Batch 10 checked passage: walis-lot-of-marriage-women)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='walis-lot-of-marriage-women' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.37 (Batch 10 checked passage: walis-lot-of-marriage-women)' AND sp.locator_text='Batch 10 directly inspected — walis-lot-of-marriage-women — Part VIII §4.37';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'881','881','Part VIII','4','4.42','Batch 10 directly inspected — hermes-general-lot-of-marriage — Part VIII §4.42',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 881.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — hermes-general-lot-of-marriage — Part VIII §4.42');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The general Hermetic marriage Lot measures Venus to the marriage cardine; translation apparatus reports the western angle and seventh as glosses.','Part VIII §4.42 (Batch 10 checked passage: hermes-general-lot-of-marriage)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='hermes-general-lot-of-marriage' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.42 (Batch 10 checked passage: hermes-general-lot-of-marriage)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='hermes-general-lot-of-marriage' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.42 (Batch 10 checked passage: hermes-general-lot-of-marriage)' AND sp.locator_text='Batch 10 directly inspected — hermes-general-lot-of-marriage — Part VIII §4.42';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'861','861','Part VIII','4','4.14a','Batch 10 directly inspected — lot-of-father — Part VIII §4.14a',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 861.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-father — Part VIII §4.14a');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Father''s Lot starts Sun to Saturn by day, reverses by night and uses Sun to Jupiter if Saturn is under the rays.','Part VIII §4.14a (Batch 10 checked passage: lot-of-father)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-father' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.14a (Batch 10 checked passage: lot-of-father)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-father' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.14a (Batch 10 checked passage: lot-of-father)' AND sp.locator_text='Batch 10 directly inspected — lot-of-father — Part VIII §4.14a';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'861','861','Part VIII','4','4.14b','Batch 10 directly inspected — lot-of-father — Part VIII §4.14b',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 861.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-father — Part VIII §4.14b');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar additionally reports a competing Mars-to-Jupiter rule under Saturn''s rays but rejects it in favour of Hermes'' Sun-to-Jupiter.','Part VIII §4.14b (Batch 10 checked passage: lot-of-father)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-father' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.14b (Batch 10 checked passage: lot-of-father)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-father' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.14b (Batch 10 checked passage: lot-of-father)' AND sp.locator_text='Batch 10 directly inspected — lot-of-father — Part VIII §4.14b';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'901','901','Part VIII','4','4.70','Batch 10 directly inspected — lot-of-mother — Part VIII §4.70',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 901.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-mother — Part VIII §4.70');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Mother''s Lot is Venus to Moon by day with night reversal, included in the tenth-place family because tenth opposes father''s fourth.','Part VIII §4.70 (Batch 10 checked passage: lot-of-mother)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-mother' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.70 (Batch 10 checked passage: lot-of-mother)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-mother' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.70 (Batch 10 checked passage: lot-of-mother)' AND sp.locator_text='Batch 10 directly inspected — lot-of-mother — Part VIII §4.70';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'907','907','Part VIII','4','4.82','Batch 10 directly inspected — lot-of-enemies-ancients — Part VIII §4.82',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 907.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-ancients — Part VIII §4.82');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The enemies Lot attributed to some Ancients runs Saturn to Mars in both day and night charts.','Part VIII §4.82 (Batch 10 checked passage: lot-of-enemies-ancients)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-enemies-ancients' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.82 (Batch 10 checked passage: lot-of-enemies-ancients)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-enemies-ancients' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.82 (Batch 10 checked passage: lot-of-enemies-ancients)' AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-ancients — Part VIII §4.82';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'907','907','Part VIII','4','4.83','Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §4.83',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 907.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §4.83');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The Hermes enemies Lot runs from lord of enemies place to degree of that place, without sect reversal, and is distinct from the Ancients'' fixed Saturn/Mars rule.','Part VIII §4.83 (Batch 10 checked passage: lot-of-enemies-hermes)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-enemies-hermes' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.83 (Batch 10 checked passage: lot-of-enemies-hermes)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-enemies-hermes' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.83 (Batch 10 checked passage: lot-of-enemies-hermes)' AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §4.83';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'931','931','Part VIII','6','6.15','Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §6.15',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 931.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §6.15');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar''s recap describes the endpoint as the ascendant degree instead of the place of enemies, creating a source-level discrepancy with §4.83.','Part VIII §6.15 (Batch 10 checked passage: lot-of-enemies-hermes)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-enemies-hermes' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §6.15 (Batch 10 checked passage: lot-of-enemies-hermes)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-enemies-hermes' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §6.15 (Batch 10 checked passage: lot-of-enemies-hermes)' AND sp.locator_text='Batch 10 directly inspected — lot-of-enemies-hermes — Part VIII §6.15';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'901','901','Part VIII','4','4.71','Batch 10 directly inspected — lot-of-honour — Part VIII §4.71',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 901.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-honour — Part VIII §4.71');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The honour Lot is Fortune to Absence by day, reversed at night; the author compares it with named firmness and Venus lots.','Part VIII §4.71 (Batch 10 checked passage: lot-of-honour)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-honour' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §4.71 (Batch 10 checked passage: lot-of-honour)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-honour' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §4.71 (Batch 10 checked passage: lot-of-honour)' AND sp.locator_text='Batch 10 directly inspected — lot-of-honour — Part VIII §4.71';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'929','929','Part VIII','6','6.13a','Batch 10 directly inspected — lot-of-authority-support-victory — Part VIII §6.13a',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 929.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-authority-support-victory — Part VIII §6.13a');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Authority, support and victory uses Sun to Saturn day and the reverse at night, or Jupiter instead of Saturn under the Sun''s rays.','Part VIII §6.13a (Batch 10 checked passage: lot-of-authority-support-victory)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-authority-support-victory' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §6.13a (Batch 10 checked passage: lot-of-authority-support-victory)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-authority-support-victory' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §6.13a (Batch 10 checked passage: lot-of-authority-support-victory)' AND sp.locator_text='Batch 10 directly inspected — lot-of-authority-support-victory — Part VIII §6.13a';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'927','927','Part VIII','6','6.12a','Batch 10 directly inspected — lot-of-travel — Part VIII §6.12a',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 927.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-travel — Part VIII §6.12a');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The journey Lot projects the arc from ruler of ninth place to the degree of the ninth place, without sect reversal.','Part VIII §6.12a (Batch 10 checked passage: lot-of-travel)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-travel' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §6.12a (Batch 10 checked passage: lot-of-travel)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-travel' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §6.12a (Batch 10 checked passage: lot-of-travel)' AND sp.locator_text='Batch 10 directly inspected — lot-of-travel — Part VIII §6.12a';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'927','927','Part VIII','6','6.12a','Batch 10 directly inspected — lot-of-travel-on-water — Part VIII §6.12a',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 927.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-travel-on-water — Part VIII §6.12a');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Water-travel Lot measures Saturn to 15 degrees of Cancer by day, reversed by night; one textual witness notes a special equality case.','Part VIII §6.12a (Batch 10 checked passage: lot-of-travel-on-water)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-travel-on-water' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §6.12a (Batch 10 checked passage: lot-of-travel-on-water)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-travel-on-water' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §6.12a (Batch 10 checked passage: lot-of-travel-on-water)' AND sp.locator_text='Batch 10 directly inspected — lot-of-travel-on-water — Part VIII §6.12a';

INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT ed.id,'927','927','Part VIII','6','6.12b','Batch 10 directly inspected — lot-of-intelligence-and-depth-of-thought — Part VIII §6.12b',NULL,
'Direct examination of bilingual Part VIII authorial section and available textual variants; printed English p. 927.'
FROM editions ed JOIN works w ON w.id=ed.work_id WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=ed.id AND sp.locator_text='Batch 10 directly inspected — lot-of-intelligence-and-depth-of-thought — Part VIII §6.12b');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'The intelligence and depth-of-thought Lot runs Saturn to Moon by day and reversed by night; the textual apparatus preserves a variant from Moon to Mercury.','Part VIII §6.12b (Batch 10 checked passage: lot-of-intelligence-and-depth-of-thought)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lot-of-intelligence-and-depth-of-thought' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII §6.12b (Batch 10 checked passage: lot-of-intelligence-and-depth-of-thought)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions ed ON ed.work_id=w.id JOIN source_passages sp ON sp.edition_id=ed.id
WHERE t.slug='lot-of-intelligence-and-depth-of-thought' AND w.slug='abu-mashar-great-introduction' AND i.scope='Part VIII §6.12b (Batch 10 checked passage: lot-of-intelligence-and-depth-of-thought)' AND sp.locator_text='Batch 10 directly inspected — lot-of-intelligence-and-depth-of-thought — Part VIII §6.12b';

