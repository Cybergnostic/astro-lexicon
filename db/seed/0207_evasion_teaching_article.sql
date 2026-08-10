-- Editorial follow-up: complete the Evasion teaching article.
--
-- Abū Maʿshar and al-Bīrūnī describe the same failed-application mechanism: the intended
-- receiving planet leaves its sign before perfection, after which the applying planet is
-- diverted into another application. The article keeps Evasion distinct from other
-- interruptions such as refranation, prohibition, frustration and retrograde interception.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Evasion is a failed planetary application in which the planet being applied to leaves its sign before the intended contact can perfect. The original applicant then turns toward another application, so the first connection never reaches completion. Abū Maʿshar and al-Bīrūnī preserve the same basic mechanism, making sign change and redirection—not merely delay—the defining features of the condition.',
  'reviewed',
  'Cross-source synthesis of reviewed Abū Maʿshar Part VII and al-Bīrūnī §506.2 evidence.'
FROM terms WHERE slug='evasion';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='evasion');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'failed-application','An application that never perfects',
  'Evasion begins from a genuine application: one planet is moving toward another and a contact is expected. Before exact perfection, however, the receiving planet crosses into the next sign. Because the target has changed its zodiacal place before the applicant reaches it, the original application is broken.',
  10,'reviewed',NULL
FROM terms WHERE slug='evasion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'redirection','The applicant is redirected elsewhere',
  'The sign change alone is only part of the sequence. In the fuller al-Bīrūnī account, after the superior receiver leaves its sign, the inferior applying planet turns toward another planet instead. The original familiarity therefore does not merely perfect late: it is replaced by a different application.',
  20,'reviewed','Reflects al-Bīrūnī §506.2 while remaining consistent with Abū Maʿshar VII.5.27.'
FROM terms WHERE slug='evasion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition-rule','Sign change before perfection is the key recognition rule',
  'The defining event is the intended receiver leaving its sign before the applying planet can complete the joining. That makes Evasion a specific interruption of application rather than a generic label for any contact that fails. The sequence must be read dynamically from planetary motion and sign boundaries.',
  30,'reviewed',NULL
FROM terms WHERE slug='evasion';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-impediments','Distinct from other impediments',
  'Evasion should not be collapsed into refranation, prohibition, frustration or the retrograde three-body conditions represented by Resistance and Intervention. Those doctrines interrupt perfection through different motions or third-planet actions. Evasion is specifically the sign-change-and-redirection failure described by the Arabic-source tradition.',
  40,'reviewed','Preserves the distinctions established in the cross-source perfection reconciliation.'
FROM terms WHERE slug='evasion';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='evasion');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'evasion-doctrine','Failed application by evasion',10,'reviewed',
  'Family-specific composition for the completed Evasion teaching article.'
FROM terms WHERE slug='evasion';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='failed-application' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='failed-application' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Evasion teaching article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='evasion-doctrine'
  AND s.status IN ('reviewed','published');
