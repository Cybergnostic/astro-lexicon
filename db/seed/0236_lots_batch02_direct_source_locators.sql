-- Batch 02 source precision: directly checked Arabic/English Great Introduction Part VIII passages.
-- Printed pages refer to Brill 2019 edition, PDF page numbers are not bibliography locators.
-- These reviewed source-specific interpretations do not replace any existing source variants.
PRAGMA foreign_keys=ON;

-- hermes-lot-of-time-of-marriage — VIII.4.43, printed pp. 881
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'881','881','Part VIII','Chapter 4','4.43','Batch 02 direct witness: Great Introduction VIII.4.43 — Hermes'' time-of-marriage lot and its stated condition',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.43 — Hermes'' time-of-marriage lot and its stated condition');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar attributes a fixed Sun-to-Moon marriage-timing lot to Hermes. He applies the Jupiter timing testimony only where the radix already indicates marriage.','Part VIII.4.43 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='hermes-lot-of-time-of-marriage' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.43 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='hermes-lot-of-time-of-marriage' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.43 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.43 — Hermes'' time-of-marriage lot and its stated condition';

-- lot-of-siblings — VIII.4.11, printed pp. 857-859
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'857','859','Part VIII','Chapter 4','4.11','Batch 02 direct witness: Great Introduction VIII.4.11 — Hermes and Wālīs variants of the brothers lot',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.11 — Hermes and Wālīs variants of the brothers lot');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar attributes the fixed Saturn-to-Jupiter lot to Hermes and reports a fixed Mercury-to-Jupiter alternative through Zādān Farrūkh citing Wālīs; he prefers the former.','Part VIII.4.11 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-siblings' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.11 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-siblings' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.11 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.11 — Hermes and Wālīs variants of the brothers lot';

-- lot-of-children — VIII.4.22, printed pp. 867
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'867','867','Part VIII','Chapter 4','4.22','Batch 02 direct witness: Great Introduction VIII.4.22 — General children lot and Tawfīl variant',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.22 — General children lot and Tawfīl variant');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar favors the Hermetic day Jupiter-to-Saturn and reversed night construction; he records Tawfīl''s fixed Jupiter-to-Saturn rule as a competing version.','Part VIII.4.22 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-children' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.22 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-children' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.22 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.22 — General children lot and Tawfīl variant';

-- lot-of-sons — VIII.4.24, printed pp. 869
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'869','869','Part VIII','Chapter 4','4.24','Batch 02 direct witness: Great Introduction VIII.4.24 — Male-children lot: Hermetic, Persian and Tawfīl forms',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.24 — Male-children lot: Hermetic, Persian and Tawfīl forms');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar prefers the Hermetic Moon-to-Jupiter lot unchanged by sect and reports a Persian Moon-to-Saturn sect-reversed version and Tawfīl''s fixed Moon-to-Saturn version.','Part VIII.4.24 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-sons' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.24 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-sons' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.24 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.24 — Male-children lot: Hermetic, Persian and Tawfīl forms';

-- lot-of-daughters — VIII.4.25, printed pp. 871
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'871','871','Part VIII','Chapter 4','4.25','Batch 02 direct witness: Great Introduction VIII.4.25 — Female-children lot: Hermetic and Tawfīl forms',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.25 — Female-children lot: Hermetic and Tawfīl forms');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar favors the fixed Moon-to-Venus lot attributed to Hermes, but also transmits Tawfīl''s Moon-to-Venus day form reversed at night.','Part VIII.4.25 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-daughters' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.25 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-daughters' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.25 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.25 — Female-children lot: Hermetic and Tawfīl forms';

-- lot-of-rank — VIII.4.59, printed pp. 893
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'893','893','Part VIII','Chapter 4','4.59','Batch 02 direct witness: Great Introduction VIII.4.59 — High rank from solar/lunar exaltation degrees',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.59 — High rank from solar/lunar exaltation degrees');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'For the lot of high rank, Abū Maʿshar takes the Sun to 19° Aries by day and the Moon to 3° Taurus by night, each projected from the Ascendant.','Part VIII.4.59 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-rank' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.59 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-rank' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.59 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.59 — High rank from solar/lunar exaltation degrees';

-- lot-of-friends — VIII.4.77, printed pp. 905
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'905','905','Part VIII','Chapter 4','4.77','Batch 02 direct witness: Great Introduction VIII.4.77 — Friends and brothers from Moon to Mercury',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.77 — Friends and brothers from Moon to Mercury');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar gives a fixed Moon-to-Mercury friends-and-brothers lot and distinguishes its broader testimony from the narrower friendship significance of Mercury''s planetary lot.','Part VIII.4.77 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='lot-of-friends' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.4.77 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='lot-of-friends' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.4.77 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.4.77 — Friends and brothers from Moon to Mercury';

-- egyptian-lot-of-necessity — VIII.5.8, printed pp. 915
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'915','915','Part VIII','Chapter 5','5.8','Batch 02 direct witness: Great Introduction VIII.5.8 — Egyptian lot of necessity and delay',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.5.8 — Egyptian lot of necessity and delay');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar gives the Egyptian necessity lot as Mars to the third-place degree by day and night; it is explicitly distinguished from a Persian necessity construction.','Part VIII.5.8 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='egyptian-lot-of-necessity' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.5.8 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='egyptian-lot-of-necessity' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.5.8 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.5.8 — Egyptian lot of necessity and delay';

-- persian-lot-of-necessity — VIII.5.9, printed pp. 915
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'915','915','Part VIII','Chapter 5','5.9','Batch 02 direct witness: Great Introduction VIII.5.9 — Persian lot of necessity and delay',NULL,
  'Directly inspected Brill 2019 text during Lot Batch 02. Public synopsis is paraphrased; no translation quotation reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM source_passages p WHERE p.edition_id=e.id AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.5.9 — Persian lot of necessity and delay');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Abū Maʿshar gives the Persian necessity lot from the lot of love and intimacy to Mercury, unchanged by sect, and considers it alongside the Egyptian necessity lot.','Part VIII.5.9 (Batch 02 direct source verification)','direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='persian-lot-of-necessity' AND w.slug='abu-mashar-great-introduction'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VIII.5.9 (Batch 02 direct source verification)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,p.id,'primary' FROM interpretations i
JOIN terms t ON t.id=i.term_id JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id JOIN source_passages p ON p.edition_id=e.id
WHERE t.slug='persian-lot-of-necessity' AND w.slug='abu-mashar-great-introduction'
AND i.scope='Part VIII.5.9 (Batch 02 direct source verification)' AND p.locator_text='Batch 02 direct witness: Great Introduction VIII.5.9 — Persian lot of necessity and delay';
