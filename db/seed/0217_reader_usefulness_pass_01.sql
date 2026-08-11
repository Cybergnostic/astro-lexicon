-- Reader usefulness pass 01: concept-first revisions.
--
-- This pass moves public prose away from extraction/project language and toward the
-- reader's primary question: what is the astrological concept, what happens, and how
-- can it be recognized? Source accounts remain available as evidence underneath the
-- teaching explanation.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ABSCISSION OF LIGHT
-- -----------------------------------------------------------------------------
UPDATE terms
SET short_definition = 'A form of interference in which a developing planetary contact is cut off before perfection because another planet takes away or interrupts the light or virtue involved; in Lilly''s explicit example this prevents an approaching harmful conjunction from taking effect.'
WHERE slug='abscission-of-light';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Abscission of Light occurs when a planetary contact is developing toward perfection but another planet intervenes first and cuts off the light or virtue involved. The original contact therefore does not complete in the way it was developing. In Lilly''s explicit example the interrupted contact is harmful, so the abscission removes the approaching malefic effect rather than creating an additional impediment.',
  'reviewed',
  'Reader-usefulness revision: explain the operative event first; retain source-specific detail in source accounts.'
FROM terms WHERE slug='abscission-of-light';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='abscission-of-light');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'what-happens','What happens',
  'The important feature is a contact that is already developing but is intercepted before it perfects. Another planet cuts off the light or virtue involved, so the expected contact is no longer completed in its original form. Abscission is therefore more specific than simply saying that an aspect fails to perfect: the failure is produced by an intervening planetary contact that takes the developing influence away.',10,'reviewed',NULL
FROM terms WHERE slug='abscission-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'example','Simple example',
  'Suppose two significators are moving toward a conjunction that would bring an unwanted result. Before that conjunction perfects, another planet intervenes and cuts off the light or virtue being carried toward the perfection. The first conjunction is therefore prevented from completing as expected. In Lilly''s example this is beneficial because the contact being cut off is with an infortune.',20,'reviewed',NULL
FROM terms WHERE slug='abscission-of-light';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nearby-mechanics','How it differs from nearby mechanics',
  'Prohibition, Frustration and Refrenation can also prevent perfection, but they describe different events. Prohibition involves another planet perfecting an intervening contact first; Frustration occurs when the slower target completes elsewhere first; Refrenation occurs when the applying planet turns retrograde before perfection. Abscission is identified by the cutting off of the developing light or virtue.',30,'reviewed',NULL
FROM terms WHERE slug='abscission-of-light';

-- -----------------------------------------------------------------------------
-- ABSCISSOR / DESTROYER / OBSTRUCTOR
-- -----------------------------------------------------------------------------
UPDATE terms
SET short_definition = 'The planet that acts as the destructive or obstructing factor in a judgment, cutting off, overturning or preventing an expected perfection or promised effect; the title describes a role rather than one fixed aspect pattern.'
WHERE slug='abscissor';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Abscissor, also called the Destroyer or Obstructor, is the planet that functions as the blocking or destructive factor in a judgment. Its defining feature is what it does: it cuts off, overturns or prevents an expected perfection or promised effect. The name therefore identifies a planetary role. The exact configuration by which the planet becomes destructive has to be identified from the particular judgment.',
  'reviewed',
  'Reader-usefulness revision: remove source/project framing and explain the operative role first.'
FROM terms WHERE slug='abscissor';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='abscissor');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition','How to understand the role',
  'Begin with something the chart appears to promise or bring toward perfection. If another planet becomes the factor that blocks, cuts off or overturns that development, that planet is functioning as the Abscissor or Destroyer. The term names the destructive participant in the judgment rather than a single geometrical condition that must always look the same.',10,'reviewed',NULL
FROM terms WHERE slug='abscissor';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'names','Abscissor, Destroyer and Obstructor',
  'These names belong to the same broad idea: a planet that prevents or damages the expected effect. "Abscissor" emphasizes cutting off, "Destroyer" emphasizes undoing the promised result, and "Obstructor" emphasizes blocking it. They should be read as role-names before trying to identify the particular mechanism operating in the chart.',20,'reviewed',NULL
FROM terms WHERE slug='abscissor';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanisms','Role versus mechanism',
  'A specific interruption such as Prohibition, Frustration, Refrenation or Abscission of Light describes how perfection is altered or prevented. Abscissor describes the planet acting destructively in the judgment. A planet may therefore function as an Abscissor through a particular impediment, but the role is not itself a synonym for any one of those mechanics.',30,'reviewed',NULL
FROM terms WHERE slug='abscissor';

-- Recompose the two pages so the revised teaching sections appear in their intended order.
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN ('abscission-of-light','abscissor'));

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'teaching','Understanding the concept',10,'reviewed','Reader usefulness pass 01.'
FROM terms WHERE slug IN ('abscission-of-light','abscissor');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Reader usefulness pass 01.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='teaching'
  AND ps.term_id IN (SELECT id FROM terms WHERE slug IN ('abscission-of-light','abscissor'))
  AND s.status IN ('reviewed','published');
