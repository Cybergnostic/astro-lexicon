-- Editorial follow-up: complete the Ninth / Nawbahar teaching article.
--
-- Abū Maʿshar and al-Bīrūnī agree on the ninefold 3°20′ geometry and transmit the
-- doctrine as an Indian sign subdivision. The exact rulership sequence belongs to the
-- historical system and should not be silently replaced by a different later navamsa
-- convention or by one locally altered order.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Ninth, or Nawbahar, is an Indian zodiacal subdivision in which each thirty-degree sign is divided into nine equal portions of 3°20′. The nine parts receive sign natures and planetary rulers according to a transmitted sign-based sequence. The geometry is stable across the reviewed Abū Maʿshar and al-Bīrūnī evidence, while the exact rulership order should remain tied to the historical system being cited rather than replaced by a different later convention.',
  'reviewed',
  'Cross-source synthesis of reviewed Abū Maʿshar and al-Bīrūnī evidence. Geometry is canonical; exact rulership sequence remains source-specific.'
FROM terms WHERE slug='ninth-nawbahr';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'ninefold-division','Nine equal parts of a sign',
  'A zodiacal sign contains thirty degrees. Dividing it into nine equal portions produces ninths of 3°20′ each. The term therefore names a true equal subdivision of the sign, comparable structurally to decans or twelfth-parts but using nine parts rather than three or twelve.',
  10,'reviewed',NULL
FROM terms WHERE slug='ninth-nawbahr';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'indian-system','A transmitted Indian subdivision system',
  'Both Abū Maʿshar and al-Bīrūnī present the ninth as an Indian doctrine. The parts are associated with successive sign natures and their rulers, and Abū Maʿshar describes the preferred sequence as anchored in the triplicity structure. The historical identity of the system therefore includes more than merely cutting a sign into nine equal pieces.',
  20,'reviewed','Keep the historical framing while avoiding an unsourced universalized ruler table.'
FROM terms WHERE slug='ninth-nawbahr';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'rulership-variation','Keep the rulership sequence source-specific',
  'Al-Bīrūnī explicitly distinguishes the received Hindu order from an altered local version and prefers the received sequence. Because the corpus preserves that disagreement, the encyclopedia should not present one unattributed ruler sequence as though every historical witness used it identically. Exact assignments belong with the relevant source account or reference table.',
  30,'reviewed','Based on al-Bīrūnī §455 and the cross-source reconciliation.'
FROM terms WHERE slug='ninth-nawbahr';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-subdivisions','Distinct from decans and twelfth-parts',
  'The Ninth belongs to the wider family of sign subdivisions but should not be collapsed into another division. A decan or face divides a sign into three ten-degree parts; a dodecatemorion divides it into twelve parts of 2°30′; the Ninth divides it into nine parts of 3°20′ and carries its own transmitted rulership structure.',
  40,'reviewed',NULL
FROM terms WHERE slug='ninth-nawbahr';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='ninth-nawbahr');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'ninth-structure','Construction and historical system',10,'reviewed',
  'Family-specific composition for the completed Ninth / Nawbahar article.'
FROM terms WHERE slug='ninth-nawbahr';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='ninefold-division' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='ninefold-division' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Ninth / Nawbahar article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='ninth-structure'
  AND s.status IN ('reviewed','published');
