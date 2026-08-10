-- Editorial follow-up: complete the Almuguea / Proper Face teaching article.
--
-- Cross-source reconciliation establishes that Antiochus' Proper Face and Bonatti's
-- Almuguea describe the same luminary-relative domicile-distance structure. The article
-- keeps this distinct from ordinary aspect doctrine and preserves source-specific limits.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Almuguea, also represented in Antiochus as a planet being in its Proper Face, is a face-to-face planetary relation defined by reproducing around a luminary the zodiacal relation between the planet’s domicile and the domicile of that luminary. It is therefore a derived relation based on domicile geometry, not simply another name for an ordinary aspect between the two planets.',
  'reviewed',
  'Cross-source synthesis of reviewed Antiochus and Bonatti evidence. Proper Face and Face-to-face are preserved as historical equivalents.'
FROM terms WHERE slug='almuguea';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='almuguea');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'domicile-distance','The domicile-distance rule',
  'The relation begins from the domiciles rather than from a fixed aspect name. A planet is placed relative to the Sun or Moon at the same zodiacal distance that its own domicile stands from the luminary’s domicile. The configuration thus reproduces a pre-existing relationship in the domicile scheme and transfers that geometry to the actual positions of the planets.',
  10,'reviewed','Reflects the common recognition rule established by Antiochus and Bonatti.'
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'solar-lunar-direction','The solar and lunar forms use different direction',
  'Antiochus specifies the relation directionally: the Proper Face relation to the Sun is taken on the western side, while the corresponding relation to the Moon is taken on the eastern side. Bonatti gives analogous directional rules when explaining Almuguea. The direction is therefore part of the recognition rule rather than an optional descriptive detail.',
  20,'reviewed','Source-scoped directional synthesis; does not generalize beyond the reviewed traditions.'
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'same-structure','Proper Face and Almuguea are the same structure',
  'The two sources use different names but the same underlying construction. Antiochus calls the condition Proper Face; Bonatti calls it Almuguea and glosses it as face-to-face. The cross-source corpus therefore treats these as historical forms of one canonical concept rather than maintaining duplicate entries.',
  30,'reviewed','Directly reflects the cross-source normalization in seed 0056.'
FROM terms WHERE slug='almuguea';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-ordinary-aspect','Not simply an ordinary aspect',
  'Although the resulting angular distance can resemble familiar aspect distances in some cases, Almuguea is recognized by the domicile-distance rule itself. Its meaning comes from reproducing the relation of planetary domiciles to a luminary’s domicile, so it should not be reduced to a generic sextile, square, trine or opposition without checking the actual construction.',
  40,'reviewed','Keeps the reconciled canonical concept distinct from ordinary aspect doctrine.'
FROM terms WHERE slug='almuguea';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='almuguea');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'almuguea-doctrine','Proper Face / Almuguea',10,'reviewed',
  'Family-specific composition for the completed Almuguea teaching article.'
FROM terms WHERE slug='almuguea';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='domicile-distance' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='domicile-distance' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Almuguea teaching article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='almuguea-doctrine'
  AND s.status IN ('reviewed','published');
