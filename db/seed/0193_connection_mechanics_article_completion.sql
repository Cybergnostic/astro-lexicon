-- Editorial Baseline follow-up: complete the Lilly connection/interference teaching pages.
--
-- These terms already have direct A-grade Lilly evidence and concise canonical articles.
-- This pass adds reader-facing distinctions that are already supported by the stored
-- source accounts, then defines explicit page composition so the new blocks cannot be
-- stored without being rendered.

PRAGMA foreign_keys = ON;

-- =============================================================================
-- TRANSLATION OF LIGHT
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sequence','Separation comes before the new application',
  'Translation is sequential. The translating planet has already been in contact with one planet, separates from it, and then moves into application with the second. This distinguishes translation from a simple case in which one intermediary happens to aspect two planets at the same time: the prior separation is part of the recognition rule.',
  20,'reviewed','Directly follows Lilly’s Book I description of a swift/light planet separating from one body and then joining or aspecting another.'
FROM terms WHERE slug='translation-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'translation-vs-collection','Translation versus Collection',
  'Translation uses one faster intermediary moving from the first planet toward the second. Collection has the opposite geometry: two planets apply separately toward one slower collecting planet. Both can connect planets that do not perfect directly with each other, but they do so by different motions and should not be treated as interchangeable names.',
  30,'reviewed',NULL
FROM terms WHERE slug='translation-of-light';

-- =============================================================================
-- COLLECTION OF LIGHT
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'convergence','Two applications converge on one planet',
  'The collecting planet is the common target of two separate applications. It does not shuttle from one planet to the other. The defining geometry is convergence: the two relevant planets each direct their application toward the slower third planet, which gathers both contacts.',
  20,'reviewed',NULL
FROM terms WHERE slug='collection-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-reception','Lilly’s reception condition is source-specific',
  'In the Book II formulation stored in this corpus, Lilly also specifies reception by essential dignity in the collecting configuration. That condition belongs to Lilly’s account and should remain attached to him; the canonical definition identifies the shared mechanics without silently turning one witness’s additional requirement into a universal rule.',
  30,'reviewed','Scoped to Christian Astrology Book II p. 126.'
FROM terms WHERE slug='collection-of-light';

-- =============================================================================
-- PROHIBITION
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'timing','The intervening contact perfects first',
  'Prohibition depends on order in time. The original planets are moving toward their own perfection, but the third planet completes the relevant conjunction or aspect before that expected contact can occur. Without that earlier intervening perfection, the geometry is not the prohibition Lilly is describing.',
  20,'reviewed',NULL
FROM terms WHERE slug='prohibition';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'prohibition-vs-frustration','Prohibition versus Frustration',
  'Both conditions interrupt an expected perfection, but the mechanism differs. In Prohibition a third planet interposes its own contact first. In Frustration the slower planet that was being approached perfects with another planet before the faster applicant reaches it. The result can look similar while the planetary sequence is different.',
  30,'reviewed',NULL
FROM terms WHERE slug='prohibition';

-- =============================================================================
-- FRUSTRATION
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'target-acts-first','The slower target completes elsewhere',
  'The distinctive feature of Frustration is that the slower target of the original application does not merely receive an intervening ray: it reaches conjunction with another planet first. The expected applicant is therefore left without the perfection it was approaching.',
  20,'reviewed','Paraphrases Lilly Book I pp. 112-113.'
FROM terms WHERE slug='frustration';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'frustration-vs-refrenation','Frustration versus Refrenation',
  'Frustration is caused by the slower target completing another contact first. Refrenation is caused by the applying planet itself changing motion and turning retrograde before perfection. Both prevent an expected completion, but one depends on the target’s other contact and the other on the applicant’s reversal.',
  30,'reviewed',NULL
FROM terms WHERE slug='frustration';

-- =============================================================================
-- REFRENATION
-- =============================================================================

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'application-precedes-reversal','Application is already under way',
  'Refrenation presupposes an application that is genuinely approaching perfection. The condition arises when that applying planet reverses direction before the promised contact becomes exact. A planet that was never applying in the first place is therefore not an example of refrenation merely because it is retrograde.',
  20,'reviewed',NULL
FROM terms WHERE slug='refrenation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'refrenation-vs-prohibition','Refrenation versus third-planet interference',
  'No third planet is required for Refrenation. The interruption comes from the applicant’s own reversal of motion. This separates it from Prohibition and Frustration, where another planetary contact changes which perfection occurs first.',
  30,'reviewed',NULL
FROM terms WHERE slug='refrenation';

-- =============================================================================
-- EXPLICIT READER-FACING COMPOSITION
-- =============================================================================

-- These articles had only one stored section when the corpus-wide default composition
-- seed ran, so they did not receive a page-composition record at that stage. Define the
-- composition here after the new sections exist.
INSERT OR IGNORE INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'mechanics-and-distinctions','Mechanics and distinctions',10,'reviewed',
  'Family-specific composition for the completed Lilly connection/interference articles.'
FROM terms
WHERE slug IN ('translation-of-light','collection-of-light','prohibition','frustration','refrenation');

WITH desired(term_slug,source_key,role,show_heading,sort_order) AS (
  VALUES
    ('translation-of-light','mechanics','paragraph',0,10),
    ('translation-of-light','sequence','subsection',1,20),
    ('translation-of-light','translation-vs-collection','subsection',1,30),
    ('collection-of-light','mechanics','paragraph',0,10),
    ('collection-of-light','convergence','subsection',1,20),
    ('collection-of-light','lilly-reception','subsection',1,30),
    ('prohibition','forms','paragraph',0,10),
    ('prohibition','timing','subsection',1,20),
    ('prohibition','prohibition-vs-frustration','subsection',1,30),
    ('frustration','distinction','paragraph',0,10),
    ('frustration','target-acts-first','subsection',1,20),
    ('frustration','frustration-vs-refrenation','subsection',1,30),
    ('refrenation','distinction','paragraph',0,10),
    ('refrenation','application-precedes-reversal','subsection',1,20),
    ('refrenation','refrenation-vs-prohibition','subsection',1,30)
)
INSERT OR REPLACE INTO term_page_blocks
  (id,page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT existing.id,ps.id,'article-section',d.source_key,d.role,d.show_heading,d.sort_order,'reviewed',
  'Family-specific composition for completed Lilly connection/interference article.'
FROM desired d
JOIN terms t ON t.slug=d.term_slug
JOIN term_page_sections ps ON ps.term_id=t.id AND ps.section_key='mechanics-and-distinctions'
LEFT JOIN term_page_blocks existing
  ON existing.page_section_id=ps.id
 AND existing.source_kind='article-section'
 AND existing.source_key=d.source_key;
