-- A-tier editorial completion: Horary / rectification concepts.
--
-- These three entries already have strong canonical definitions and reviewed evidence.
-- The remaining problem is reader-facing synthesis: the database knows the distinctions,
-- but a bare definition does not expose them clearly enough.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ABSCISSOR / DESTROYER / OBSTRUCTOR
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Abscissor, Destroyer and Obstructor are overlapping source names for a planetary role that cuts off, overturns or prevents a promised outcome. The important distinction is that this is a role in judgment rather than one single geometrical mechanism: Bonatti and Lilly can identify the destructive factor in different contexts, while specific impediments such as Prohibition, Frustration and Abscission of Light retain their own recognition rules.',
  'reviewed',
  'Cross-source synthesis of reviewed Bonatti and Lilly evidence. Preserve the role/mechanism distinction.'
FROM terms WHERE slug='abscissor';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='abscissor');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'role-not-geometry','A role, not one fixed geometry',
  'The abscissor is identified by what it does in the judgment: it cuts off or obstructs the promised matter. That function can be realized through different planetary circumstances. For this reason the canonical entry should not be reduced to a single aspect pattern or motion rule.',10,'reviewed',NULL
FROM terms WHERE slug='abscissor';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-language','Different source names for the same broad role',
  'Bonatti’s language of the planet that cuts off and Lilly’s Destroyer, Obstructor and Abscissor belong to the same broad technical role. The aliases preserve those historical forms without pretending that every passage supplies an identical procedure for finding the planet.',20,'reviewed',NULL
FROM terms WHERE slug='abscissor';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-impediments','Distinct from named impediment mechanisms',
  'Prohibition, Frustration and Abscission of Light describe particular ways in which perfection is interrupted. An abscissor can function destructively in a judgment, but the role should not be treated as a synonym for any one of those specific mechanics.',30,'reviewed',NULL
FROM terms WHERE slug='abscissor';

-- -----------------------------------------------------------------------------
-- RADICAL / ROOTED QUESTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Radical or Rooted Question is a horary figure considered genuinely rooted and fit to receive judgment. Bonatti’s “rooted” language and Lilly’s “radical” language belong to the same technical family: both use concordance between the lord of the hour and the Ascendant or its ruler as a principal test, while additional cautions remain source-specific.',
  'reviewed',
  'Cross-source synthesis of reviewed Bonatti and Lilly radicality evidence.'
FROM terms WHERE slug='radical-question';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='radical-question');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'concordance','Concordance of the hour and Ascendant',
  'The shared core test asks whether the lord of the planetary hour agrees with the Ascendant or its ruler. Bonatti and Lilly allow concordance through identity, triplicity or compatible planetary nature. This agreement is treated as evidence that the figure is rooted in the matter presented.',10,'reviewed',NULL
FROM terms WHERE slug='radical-question';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'qualification','A qualification of the horary figure',
  'Radicality is not a separate branch of horary astrology and does not replace the question itself. It qualifies the interrogational figure by asking whether the chart is appropriately rooted for judgment.',20,'reviewed',NULL
FROM terms WHERE slug='radical-question';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-cautions','Additional cautions remain source-specific',
  'Historical authors attach further considerations and cautions to the fitness of a horary figure. Those additional rules should remain in their individual source accounts rather than being turned into one universal checklist under the canonical definition.',30,'reviewed',NULL
FROM terms WHERE slug='radical-question';

-- -----------------------------------------------------------------------------
-- NATAL RECTIFICATION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Natal Rectification is the general task of correcting an uncertain birth time or natal angles by testing an approximate figure with a defined astrological method. It is an umbrella technique rather than one calculation: the reviewed corpus distinguishes Animodar, the Trutine of Hermes and Lilly’s rectification by dated accidents as separate methods of solving the same underlying problem.',
  'reviewed',
  'Umbrella synthesis from reviewed Lilly taxonomy plus the separately sourced historical rectification methods.'
FROM terms WHERE slug='natal-rectification';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='natal-rectification');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'general-problem','The general rectification problem',
  'Rectification begins from uncertainty in the recorded birth time or derived natal angles. A method takes an approximate figure and applies a defined test in order to revise that figure. The stable canonical concept is this corrective task, not any one historical algorithm.',10,'reviewed',NULL
FROM terms WHERE slug='natal-rectification';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinct-methods','Several distinct historical methods',
  'Animodar begins from the prenatal syzygy and an indicator selected there. The Trutine of Hermes tests a traditional relationship between the Moon at birth and a proposed conception figure. Lilly’s rectification by accidents instead compares dated life events with directions. These methods should remain distinct even though they all serve natal rectification.',20,'reviewed',NULL
FROM terms WHERE slug='natal-rectification';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'method-source','Method details belong to their own entries',
  'The encyclopedia therefore uses Natal Rectification as the parent concept and leaves tie-breaking rules, conception relationships, directing details and source preferences on the individual method pages. This prevents one historical procedure from being presented as the definition of rectification itself.',30,'reviewed',NULL
FROM terms WHERE slug='natal-rectification';

-- Explicit composition for the three late-added articles.
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('abscissor','radical-question','natal-rectification'));
INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'editorial-synthesis','Teaching overview',10,'reviewed','A-tier synthesis composition.'
FROM terms WHERE slug IN ('abscissor','radical-question','natal-rectification');
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','A-tier synthesis composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='editorial-synthesis'
  AND ps.term_id IN (SELECT id FROM terms WHERE slug IN ('abscissor','radical-question','natal-rectification'))
  AND s.status IN ('reviewed','published');
