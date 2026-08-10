-- Editorial follow-up: complete the Lots of the Seven Planets teaching article.
--
-- Abū Maʿshar and Bonatti both preserve the seven planetary lots as a principal class
-- inside the broader lot system. The article explains the class structure and its luminary
-- framework without silently identifying individual planetary lots with similarly named
-- lots from other historical traditions.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lots of the Seven Planets are a principal historical class of astrological lots associated with the Sun, Moon and five non-luminary planets. Abū Maʿshar distinguishes this group from the lots of the twelve places and from an additional class of ten lots, while Bonatti likewise presents the seven planetary parts as the first principal class of Parts. The group is therefore a structural family within lot doctrine rather than a generic label for any lot that happens to mention a planet.',
  'reviewed',
  'Cross-source synthesis of reviewed Abū Maʿshar Part VIII and Bonatti Treatise 8.2 evidence. Individual formulas remain attached to their specific lot entries.'
FROM terms WHERE slug='planetary-lots';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-lots');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'principal-class','One of the principal classes of lots',
  'Abū Maʿshar organizes the authenticated lots into three broad classes: seven planetary lots, eighty lots associated with the twelve places, and ten additional lots. Bonatti transmits the same basic hierarchy and begins his treatment of Parts with the seven planetary group. This classification is part of the historical architecture of lot doctrine and should not be replaced by a modern thematic grouping.',
  10,'reviewed','Reflects Abū Maʿshar VIII.2 and Bonatti Treatise 8.2, Chapter 2.'
FROM terms WHERE slug='planetary-lots';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'luminary-foundation','The luminary lots form the foundation',
  'Bonatti gives precedence to the two luminary parts: the Part of Fortune, which he also calls the Part of the Moon, and its reversed solar counterpart, the Part of Things to Be or Part of the Sun. The remaining five planetary parts are then situated within a system that repeatedly uses these luminary lots as reference points in their constructions.',
  20,'reviewed','Source-specific Bonatti terminology; canonical entries are Lot of Fortune and Lot of Absence.'
FROM terms WHERE slug='planetary-lots';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'seven-members','Seven planetary identities, not one formula',
  'The class contains distinct lots associated with each of the seven traditional planets. Their formulas are not produced by one universal substitution rule: each lot has its own transmitted construction and source-specific topical wording. The family entry therefore explains the system as a whole, while the individual lot entries preserve the actual formulas and historical names.',
  30,'reviewed',NULL
FROM terms WHERE slug='planetary-lots';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-identity','Similar themes do not prove identical lots across traditions',
  'Planetary lots in different authors can carry similar names or topics without sharing the same formula or historical identity. The corpus therefore keeps Abū Maʿshar’s individual planetary lots tied to their own formula stream—for example, his Venus lot is not automatically merged with every Lot of Eros or love lot found elsewhere. Formula identity and source transmission must be demonstrated before two named lots are treated as the same concept.',
  40,'reviewed','Preserves the non-equivalence policy established for the individual planetary-lot entries.'
FROM terms WHERE slug='planetary-lots';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-lots');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'planetary-lots-doctrine','Lots of the Seven Planets',10,'reviewed',
  'Family-specific composition for the completed planetary-lots teaching article.'
FROM terms WHERE slug='planetary-lots';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='principal-class' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='principal-class' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Lots of the Seven Planets article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='planetary-lots-doctrine'
  AND s.status IN ('reviewed','published');
