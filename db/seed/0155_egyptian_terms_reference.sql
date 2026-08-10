-- Bird's-eye reference pass: add the Egyptian terms/bounds as a separate historical scheme.
--
-- Primary witness: Ptolemy, Tetrabiblos I.21 (Robbins ed./trans., p. 97 in the
-- LacusCurtius presentation), where Ptolemy gives the terms "according to the Egyptians"
-- as the generally accepted ancient table before discussing another scheme.
--
-- Values below normalize the transmitted segment lengths into half-open degree ranges
-- [start,end). This scheme is intentionally separate from Lilly's table "according to
-- Ptolemy" and must never be presented as though either table were simply "the terms".

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO authors
  (slug,name,original_name,historical_layer,notes)
VALUES
  ('claudius-ptolemy','Claudius Ptolemy','Κλαύδιος Πτολεμαῖος','Hellenistic / Roman Egypt',
   'Second-century Alexandrian mathematical author. Added as a partial public witness for the Egyptian terms transmitted in Tetrabiblos Book I.');

INSERT OR IGNORE INTO works
  (author_id,slug,title,original_title,composition_year_start,composition_year_end,language,notes,corpus_status)
SELECT id,'ptolemy-tetrabiblos','Tetrabiblos','Ἀποτελεσματικά',120,180,'Greek',
       'Partial source onboarding for bird’s-eye reference work. Current use is limited to directly verified passages such as the Egyptian terms; this is not yet a sequential extraction of the whole work.',
       'partial'
FROM authors WHERE slug='claudius-ptolemy';

INSERT OR IGNORE INTO editions
  (work_id,label,translator,editor,publisher,publication_year,publication_place,source_language,target_language,copyright_note,local_source_key)
SELECT id,
       'F. E. Robbins English translation / LacusCurtius digital presentation',
       'F. E. Robbins',NULL,'Harvard University Press / William Heinemann',1940,'Cambridge, MA / London','Greek','English',
       'Used as a locator and reading witness. No modern prose is reproduced; normalized table values are stored as reference data.',
       'ptolemy-tetrabiblos-robbins-lacuscurtius'
FROM works WHERE slug='ptolemy-tetrabiblos';

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'97','99','Book I','21','Terms according to the Egyptians',
       'Tetrabiblos I.21, table introduced as the terms most generally accepted on the authority of ancient tradition and headed “Terms according to the Egyptians.”',
       NULL,
       'Direct table witness. The repository stores normalized degree ranges, not a facsimile or copied translation.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='ptolemy-tetrabiblos'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.section='Terms according to the Egyptians'
  );

INSERT OR IGNORE INTO reference_schemes
  (slug,label,domain,work_id,edition_id,status,notes)
SELECT 'ptolemy-egyptian-terms',
       'Egyptian terms — transmitted by Ptolemy',
       'essential-dignity',
       w.id,e.id,'reviewed',
       'Ancient Egyptian bound/term table transmitted in Tetrabiblos I.21. This is a separate scheme from Ptolemy’s alternative table and from Lilly’s later table presented “according to Ptolemy.”'
FROM works w
JOIN editions e ON e.work_id=w.id
WHERE w.slug='ptolemy-tetrabiblos'
ORDER BY e.id
LIMIT 1;

-- Egyptian terms/bounds as transmitted by Ptolemy. Each sign contains five unequal
-- segments ruled by the five non-luminary planets. Endpoints mark transfer boundaries.
WITH data(sign_slug,planet_slug,d0,d1,seq) AS (VALUES
  ('aries','jupiter',0,6,1),('aries','venus',6,12,2),('aries','mercury',12,20,3),('aries','mars',20,25,4),('aries','saturn',25,30,5),
  ('taurus','venus',0,8,1),('taurus','mercury',8,14,2),('taurus','jupiter',14,22,3),('taurus','saturn',22,27,4),('taurus','mars',27,30,5),
  ('gemini','mercury',0,6,1),('gemini','jupiter',6,12,2),('gemini','venus',12,17,3),('gemini','mars',17,24,4),('gemini','saturn',24,30,5),
  ('cancer','mars',0,7,1),('cancer','venus',7,13,2),('cancer','mercury',13,19,3),('cancer','jupiter',19,26,4),('cancer','saturn',26,30,5),
  ('leo','jupiter',0,6,1),('leo','venus',6,11,2),('leo','saturn',11,18,3),('leo','mercury',18,24,4),('leo','mars',24,30,5),
  ('virgo','mercury',0,7,1),('virgo','venus',7,17,2),('virgo','jupiter',17,21,3),('virgo','mars',21,28,4),('virgo','saturn',28,30,5),
  ('libra','saturn',0,6,1),('libra','mercury',6,14,2),('libra','jupiter',14,21,3),('libra','venus',21,28,4),('libra','mars',28,30,5),
  ('scorpio','mars',0,7,1),('scorpio','venus',7,11,2),('scorpio','mercury',11,19,3),('scorpio','jupiter',19,24,4),('scorpio','saturn',24,30,5),
  ('sagittarius','jupiter',0,12,1),('sagittarius','venus',12,17,2),('sagittarius','mercury',17,21,3),('sagittarius','saturn',21,26,4),('sagittarius','mars',26,30,5),
  ('capricorn','mercury',0,7,1),('capricorn','jupiter',7,14,2),('capricorn','venus',14,22,3),('capricorn','saturn',22,26,4),('capricorn','mars',26,30,5),
  ('aquarius','mercury',0,7,1),('aquarius','venus',7,13,2),('aquarius','jupiter',13,20,3),('aquarius','mars',20,25,4),('aquarius','saturn',25,30,5),
  ('pisces','venus',0,12,1),('pisces','jupiter',12,16,2),('pisces','mercury',16,19,3),('pisces','mars',19,28,4),('pisces','saturn',28,30,5)
)
INSERT OR IGNORE INTO zodiac_reference_assignments
  (scheme_id,sign_term_id,planet_term_id,assignment_type,sect_condition,degree_start,degree_end,sequence_no,note)
SELECT rs.id,s.id,p.id,'term','any',d.d0,d.d1,d.seq,
       'Egyptian terms as transmitted by Ptolemy, Tetrabiblos I.21.'
FROM data d
JOIN reference_schemes rs ON rs.slug='ptolemy-egyptian-terms'
JOIN terms s ON s.slug=d.sign_slug
JOIN terms p ON p.slug=d.planet_slug;

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'term-schemes','Terms and bounds exist in more than one historical scheme',
       'The unequal planetary divisions called terms or bounds were transmitted in competing tables. The structured reference layer therefore keeps the Egyptian table transmitted by Ptolemy separate from Lilly’s later table presented as Ptolemaic. A reader should always be able to see which named scheme supplies a degree range rather than being shown an unlabeled universal table.',
       6,'reviewed','Bird’s-eye pass: make scheme plurality explicit before presenting degree data.'
FROM terms WHERE slug='essential-dignity';
