-- Editorial Baseline follow-up: complete the Lilly connection/interference teaching pages.
--
-- These terms already have direct A-grade source evidence. Earlier editorial passes left a
-- mixture of one-section articles, a canonical Refrenation/Refranation merge, and several
-- generations of page composition. This late seed deliberately replaces only the synthesized
-- teaching layer for this family. Interpretations, citations, aliases and source passages are
-- untouched.

PRAGMA foreign_keys = ON;

-- Rebuild the synthesized article layer from the final canonical terms rather than trying
-- to append to historical section keys from earlier seeds.
DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms
  WHERE slug IN ('translation-of-light','collection-of-light','prohibition','frustration','refranation')
);

DELETE FROM term_article_sections
WHERE term_id IN (
  SELECT id FROM terms
  WHERE slug IN ('translation-of-light','collection-of-light','prohibition','frustration','refranation')
);

-- =============================================================================
-- TRANSLATION OF LIGHT
-- =============================================================================

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Translation of Light is a form of mediation in which a faster planet separates from one planet and then applies to another, carrying the earlier contact forward. Its defining feature is the sequence of motion, not merely the existence of a three-planet configuration.',
  'reviewed','Editorial completion based on the existing direct Lilly source account; source-specific reception and orb requirements remain attributed.'
FROM terms WHERE slug='translation-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'core-mechanics','Core mechanics',
  'The translating planet makes the connection through two successive contacts. It separates from the first planet and then moves into conjunction or aspect with the second. The faster intermediary therefore links two planets that are not themselves completing the relevant contact directly.',
  10,'reviewed','Synthesized from the reviewed Lilly interpretation.'
FROM terms WHERE slug='translation-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sequence','Separation comes before the new application',
  'Translation is sequential. The translating planet has already been in contact with one planet, separates from it, and then moves into application with the second. This distinguishes translation from a simple case in which one intermediary happens to aspect two planets at the same time: the prior separation is part of the recognition rule.',
  20,'reviewed','Directly follows Lilly’s Book I description of a swift/light planet separating from one body and then joining or aspecting another.'
FROM terms WHERE slug='translation-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'translation-vs-collection','Translation versus Collection',
  'Translation uses one faster intermediary moving from the first planet toward the second. Collection has the opposite geometry: two planets apply separately toward one slower collecting planet. Both can connect planets that do not perfect directly with each other, but they do so by different motions and should not be treated as interchangeable names.',
  30,'reviewed',NULL
FROM terms WHERE slug='translation-of-light';

-- =============================================================================
-- COLLECTION OF LIGHT
-- =============================================================================

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Collection of Light is a form of mediation in which two planets apply separately to a third, slower or otherwise qualifying planet that gathers their applications. It should be distinguished from Translation, where one intermediary moves sequentially from one principal planet to another.',
  'reviewed','Editorial completion based on the existing direct Lilly source account; source-specific qualification rules remain attributed.'
FROM terms WHERE slug='collection-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'core-mechanics','Core mechanics',
  'Two separate applications converge on one slower or more ponderous third planet. That third planet is the common target of the contacts and gathers the two lights rather than moving from one principal planet to the other.',
  10,'reviewed','Synthesized from the reviewed Lilly interpretation.'
FROM terms WHERE slug='collection-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'convergence','Two applications converge on one planet',
  'The collecting planet is the common target of two separate applications. It does not shuttle from one planet to the other. The defining geometry is convergence: the two relevant planets each direct their application toward the slower third planet, which gathers both contacts.',
  20,'reviewed',NULL
FROM terms WHERE slug='collection-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-reception','Lilly’s reception condition is source-specific',
  'In the Book II formulation stored in this corpus, Lilly also specifies reception by essential dignity in the collecting configuration. That condition belongs to Lilly’s account and should remain attached to him; the canonical definition identifies the shared mechanics without silently turning one witness’s additional requirement into a universal rule.',
  30,'reviewed','Scoped to Christian Astrology Book II p. 126.'
FROM terms WHERE slug='collection-of-light';

-- =============================================================================
-- PROHIBITION
-- =============================================================================

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Prohibition is an interference mechanic in which two planets are applying toward perfection, but a third planet completes an intervening conjunction or aspect before their intended contact can finish. Lilly distinguishes bodily or conjunctional prohibition from prohibition by aspect.',
  'reviewed','Editorial completion of the existing direct Lilly terminology article.'
FROM terms WHERE slug='prohibition';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'forms','Bodily and aspectual forms',
  'Lilly distinguishes an intervention by bodily conjunction from an intervention by aspect. In either form the third planet reaches the relevant contact before the original application is completed, so the shared principle is interruption by an earlier perfection.',
  10,'reviewed','Synthesized from the reviewed Lilly interpretation.'
FROM terms WHERE slug='prohibition';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'timing','The intervening contact perfects first',
  'Prohibition depends on order in time. The original planets are moving toward their own perfection, but the third planet completes the relevant conjunction or aspect before that expected contact can occur. Without that earlier intervening perfection, the geometry is not the prohibition Lilly is describing.',
  20,'reviewed',NULL
FROM terms WHERE slug='prohibition';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'prohibition-vs-frustration','Prohibition versus Frustration',
  'Both conditions interrupt an expected perfection, but the mechanism differs. In Prohibition a third planet interposes its own contact first. In Frustration the slower planet that was being approached perfects with another planet before the faster applicant reaches it. The result can look similar while the planetary sequence is different.',
  30,'reviewed',NULL
FROM terms WHERE slug='prohibition';

-- =============================================================================
-- FRUSTRATION
-- =============================================================================

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Frustration is an interference mechanic in which a faster planet applies to a slower one, but the slower target completes a conjunction with another planet first. The expected first contact is therefore prevented from reaching the perfection it was approaching.',
  'reviewed','Editorial completion of the existing direct Lilly terminology article.'
FROM terms WHERE slug='frustration';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'core-mechanics','Core mechanics',
  'The faster planet is genuinely applying, but the slower planet it approaches reaches another conjunction before that application can complete. The interruption therefore comes from the target completing elsewhere first rather than from the applicant reversing its own motion.',
  10,'reviewed','Synthesized from Lilly Book I pp. 112-113.'
FROM terms WHERE slug='frustration';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'target-acts-first','The slower target completes elsewhere',
  'The distinctive feature of Frustration is that the slower target of the original application does not merely receive an intervening ray: it reaches conjunction with another planet first. The expected applicant is therefore left without the perfection it was approaching.',
  20,'reviewed','Paraphrases Lilly Book I pp. 112-113.'
FROM terms WHERE slug='frustration';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'frustration-vs-refranation','Frustration versus Refrenation / Refranation',
  'Frustration is caused by the slower target completing another contact first. Refrenation or Refranation is caused by the applying planet itself changing motion and turning retrograde before perfection. Both prevent an expected completion, but one depends on the target’s other contact and the other on the applicant’s reversal.',
  30,'reviewed',NULL
FROM terms WHERE slug='frustration';

-- =============================================================================
-- REFRENATION / REFRANATION (canonical slug: refranation)
-- =============================================================================

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Refrenation or Refranation is an interrupted application caused by reversal of motion: the applying planet turns retrograde before the intended conjunction or aspect reaches perfection and therefore withdraws from the contact it had been approaching.',
  'reviewed','Canonical spelling family was merged in Editorial Baseline v1; article synthesized from the preserved direct source accounts.'
FROM terms WHERE slug='refranation';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'core-mechanics','Core mechanics',
  'The planet is first applying toward a real perfection. Before that contact becomes exact, the applicant changes direction and turns retrograde, so the distance begins to open again rather than close. The interruption is produced by the applicant’s own reversal.',
  10,'reviewed','Preserves the merged Refrenation/Refranation doctrine.'
FROM terms WHERE slug='refranation';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'application-precedes-reversal','Application is already under way',
  'Refrenation presupposes an application that is genuinely approaching perfection. A planet that was never applying in the first place is therefore not an example of this condition merely because it is retrograde.',
  20,'reviewed',NULL
FROM terms WHERE slug='refranation';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'refranation-vs-third-planet','Different from third-planet interference',
  'No third planet is required for Refrenation or Refranation. The interruption comes from the applicant’s own reversal of motion. This separates it from Prohibition and Frustration, where another planetary contact changes which perfection occurs first.',
  30,'reviewed',NULL
FROM terms WHERE slug='refranation';

-- =============================================================================
-- EXPLICIT READER-FACING COMPOSITION
-- =============================================================================

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'mechanics-and-distinctions','Mechanics and distinctions',10,'reviewed',
  'Family-specific composition for completed Lilly connection/interference articles.'
FROM terms
WHERE slug IN ('translation-of-light','collection-of-light','prohibition','frustration','refranation');

WITH ordered(term_slug,source_key,show_heading,sort_order) AS (
  VALUES
    ('translation-of-light','core-mechanics',0,10),
    ('translation-of-light','sequence',1,20),
    ('translation-of-light','translation-vs-collection',1,30),
    ('collection-of-light','core-mechanics',0,10),
    ('collection-of-light','convergence',1,20),
    ('collection-of-light','lilly-reception',1,30),
    ('prohibition','forms',0,10),
    ('prohibition','timing',1,20),
    ('prohibition','prohibition-vs-frustration',1,30),
    ('frustration','core-mechanics',0,10),
    ('frustration','target-acts-first',1,20),
    ('frustration','frustration-vs-refranation',1,30),
    ('refranation','core-mechanics',0,10),
    ('refranation','application-precedes-reversal',1,20),
    ('refranation','refranation-vs-third-planet',1,30)
)
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',o.source_key,
  CASE WHEN o.show_heading=0 THEN 'paragraph' ELSE 'subsection' END,
  o.show_heading,o.sort_order,'reviewed',
  'Family-specific composition for completed Lilly connection/interference article.'
FROM ordered o
JOIN terms t ON t.slug=o.term_slug
JOIN term_page_sections ps
  ON ps.term_id=t.id AND ps.section_key='mechanics-and-distinctions';
