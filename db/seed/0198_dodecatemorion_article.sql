-- Editorial follow-up: complete the Dodecatemorion / Twelfth-part teaching article.
--
-- The corpus has already reconciled Abū Maʿshar, Antiochus and al-Bīrūnī under one
-- canonical twelvefold subdivision. This seed explains the geometry and historical
-- equivalence while keeping it distinct from the separate degree-by-degree sign-nature
-- scheme also preserved in Abū Maʿshar.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Dodecatemorion, or Twelfth-part, divides each zodiacal sign into twelve equal portions of 2°30′. The first twelfth corresponds to the sign itself, the second to the next sign, and the sequence continues through all twelve signs. Historical sources express the same construction either as twelve equal subdivisions inside the sign or by multiplying the planet’s position within the sign by twelve and projecting the result through the zodiac.',
  'reviewed',
  'Cross-source synthesis of the reviewed Abū Maʿshar, Antiochus and al-Bīrūnī evidence. Keep distinct from the separate degree sign-nature scheme.'
FROM terms WHERE slug='dodecatemorion';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='dodecatemorion');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'twelvefold-division','Twelve equal parts of one sign',
  'A sign contains thirty degrees, so dividing it into twelve equal portions gives twelve twelfths of 2°30′ each. The twelfths are ordered zodiacally: the first carries the correspondence of the sign being subdivided, the second the following sign, and so on until all twelve signs have been represented.',
  10,'reviewed',NULL
FROM terms WHERE slug='dodecatemorion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'equivalent-construction','The multiplication-by-twelve construction',
  'The same relationship can be expressed arithmetically. Take the position within the current sign and multiply it by twelve; the resulting zodiacal distance locates the corresponding twelfth-part. This is not a different doctrine from the equal 2°30′ subdivision but another way of constructing the same twelvefold mapping.',
  20,'reviewed','The cross-source reconciliation explicitly treats the subdivision and multiplication procedure as equivalent.'
FROM terms WHERE slug='dodecatemorion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-names','Dodecatemorion and Twelfth-part are historical equivalents',
  'The corpus preserves several names for the same construction. Dodecatemorion is the canonical headword, while Twelfth-part and Twelfths are retained as historical equivalents from other source traditions. Keeping those names together prevents the same twelvefold technique from being mistaken for several different subdivisions.',
  30,'reviewed',NULL
FROM terms WHERE slug='dodecatemorion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-degree-sign-nature','Not the degree-by-degree sign-nature scheme',
  'Abū Maʿshar preserves another Hermetic procedure in which individual degrees receive sign natures in a repeating twelve-degree sequence. That is a different structure. Dodecatemoria divide the whole thirty-degree sign into twelve equal 2°30′ parts; the degree sign-nature scheme assigns a sign correspondence to each successive whole degree and repeats after twelve degrees.',
  40,'reviewed','Important distinction already explicit in the source extraction.'
FROM terms WHERE slug='dodecatemorion';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='dodecatemorion');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'twelfth-part-structure','Construction and distinctions',10,'reviewed',
  'Family-specific composition for the completed Dodecatemorion / Twelfth-part article.'
FROM terms WHERE slug='dodecatemorion';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='twelvefold-division' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='twelvefold-division' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Dodecatemorion / Twelfth-part article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='twelfth-part-structure'
  AND s.status IN ('reviewed','published');
