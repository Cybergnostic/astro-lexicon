-- Editorial follow-up: complete the Planetary Well / Puteal Degree teaching article.
--
-- The reviewed corpus treats wells/pits/puteal degrees as inherited degree lists in which
-- a planet or significator is weakened. The degree catalogues vary by authority; the
-- canonical article therefore explains the condition without inventing one universal list.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Planetary Well, also called a Puteal or Deep Degree in the Bonatti tradition, is a specified zodiacal degree in which a planet or significator is treated as weakened or impeded. The doctrine belongs to inherited degree catalogues rather than to a single geometrical calculation: Abū Maʿshar and al-Bīrūnī both preserve transmitted lists, and the corpus explicitly records disagreement between authorities over the exact degrees.',
  'reviewed',
  'Cross-source synthesis of reviewed Abū Maʿshar, al-Bīrūnī and Bonatti terminology. Exact degree lists remain source-specific.'
FROM terms WHERE slug='planetary-well';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-well');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'degree-condition','A condition attached to particular degrees',
  'A planetary well is not a whole-sign dignity or debility. It is attached to particular degrees within the zodiac. When the relevant planet or significator occupies one of those transmitted degrees, the source treats its capacity to produce its indications as reduced or impeded.',
  10,'reviewed',NULL
FROM terms WHERE slug='planetary-well';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'weakening-not-simple-maleficence','Weakening does not mean simply “more malefic”',
  'The core effect is loss of strength. Abū Maʿshar notes that this can diminish a benefic planet’s ability to produce good, but can also diminish the harmful force of a malefic. The condition therefore describes impaired capacity rather than a universal increase in badness.',
  20,'reviewed','Directly reflects the reviewed Abū Maʿshar interpretation.'
FROM terms WHERE slug='planetary-well';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'transmitted-lists','The degree lists are transmitted, not derived',
  'The sources preserve catalogues of well or pit degrees received from earlier authorities. Abū Maʿshar explicitly records disagreement and a Persian-Egyptian consensus list; al-Bīrūnī likewise presents the wells as specified degrees rather than the output of a universal formula. The encyclopedia should therefore attach exact numbers to their source instead of silently publishing one master list.',
  30,'reviewed','Prevents false universalization of unstable catalogue data.'
FROM terms WHERE slug='planetary-well';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-names','Well, pit, puteal and deep degree',
  'Different translations and traditions use related imagery for the same degree-condition family. The canonical entry keeps Planetary Well as the main label while preserving Well, Puteal Degree and Deep Degree as historical or translation variants. These names refer to the weakening degree condition, not to separate astronomical structures.',
  40,'reviewed',NULL
FROM terms WHERE slug='planetary-well';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-well');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'well-doctrine','Degree condition and transmission',10,'reviewed',
  'Family-specific composition for the completed Planetary Well / Puteal Degree article.'
FROM terms WHERE slug='planetary-well';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='degree-condition' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='degree-condition' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Planetary Well / Puteal Degree article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='well-doctrine'
  AND s.status IN ('reviewed','published');
