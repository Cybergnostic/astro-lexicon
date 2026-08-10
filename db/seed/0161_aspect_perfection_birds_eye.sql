-- Bird's-eye encyclopedia review: aspect geometry, application, perfection and denial.
--
-- This seed uses the generic concept-family layer added in migration 0010. It does not
-- replace the detailed source taxonomy already reconciled in earlier seeds. Its purpose is
-- to let a reader see the hierarchy before encountering author-specific variants.
--
-- Editorial completeness was compared with Skyscript's annotated Lilly overview and its
-- historical review of denial of perfection. Public prose below is original synthesis;
-- historical recognition rules remain in the existing primary-source interpretations.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('aspect-perfection-mechanics','Aspect, Application and Perfection',
   'The family connecting zodiacal geometry to changing planetary contact, accomplishment of a matter, indirect mediation and named interruptions of an expected contact.',
   'mechanics',
   'Bird’s-eye family. Keep geometrical aspect, motion toward contact, horary perfection and source-specific interruption mechanisms conceptually separate.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('aspect','geometry','Geometry',10,'Defines a recognized angular or configurational relationship; geometry exists independently of whether contact is applying or separating.'),
  ('planetary-orb','geometry','Geometry',20,'Defines an allowed range of effective contact in source-sensitive orb systems.'),
  ('partile-aspect','geometry','Exactness / closeness',30,'A close degree-level aspect class; not itself the horary outcome called Perfection.'),
  ('platick-aspect','geometry','Exactness / closeness',40,'A broader operative aspect within the relevant allowance.'),
  ('application','motion','Motion phase',50,'Describes movement toward exact contact.'),
  ('separation','motion','Motion phase',60,'Describes movement away after a contact has perfected.'),
  ('perfection','outcome','Outcome concept',70,'Horary accomplishment of the matter; broader than exact aspect perfection.'),
  ('translation-of-light','mediation','Indirect perfection',80,'A third planet transfers light/virtue from one principal planet toward another.'),
  ('collection-of-light','mediation','Indirect perfection',90,'A third planet receives or gathers the applications/light of two planets that do not perfect directly with one another.'),
  ('reception','modifier','Relational modifier',100,'Dignitary relationship can modify the quality or effectiveness of contact but is not the aspect geometry itself.'),
  ('prohibition','interruption','Interruption / denial',110,'A third contact intervenes before an expected perfection; exact mechanism is source-sensitive.'),
  ('frustration','interruption','Interruption / denial',120,'Lilly’s frustration: the intended receiver perfects another contact before the original applicant reaches it.'),
  ('refrenation','interruption','Interruption / denial',130,'The applying planet turns retrograde before completing the expected contact.'),
  ('abscission-of-light','interruption','Interruption / redirection',140,'A historical family in which another planetary action cuts off or redirects the expected application.'),
  ('evasion','interruption','Interruption / denial',150,'An expected application fails after the intended receiver leaves its sign and the sequence is redirected.'),
  ('return-of-virtue','interruption','Return / rejection',160,'The receiver cannot retain what was given and returns the virtue/disposition to the donor.'),
  ('resistance','interruption','Three-planet interruption',170,'Abū Maʿshar’s retrograde three-planet interruption mechanism.'),
  ('planetary-contrariety','interruption','Three-planet interruption',180,'Bonatti’s closely corresponding but separately preserved three-planet mechanism.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='aspect-perfection-mechanics'
JOIN terms t ON t.slug=m.term_slug;

-- -----------------------------------------------------------------------------
-- READER-FACING HEADWORDS: MAKE THE LEVEL OF THE TERM IMMEDIATE
-- -----------------------------------------------------------------------------

UPDATE terms SET
  short_definition='An aspect is a recognized geometrical relationship between zodiacal positions. It describes the structure of contact; application, separation, reception and horary perfection are additional conditions layered onto that geometry.',
  editorial_notes='Bird’s-eye aspect-family review. Geometry is stated before interpretation or perfection mechanics.'
WHERE slug='aspect';

UPDATE terms SET
  short_definition='Application is the motion of a planet toward exact conjunction or aspect with another planet. It describes an approaching contact, not by itself the broader horary outcome called Perfection.',
  editorial_notes='Bird’s-eye aspect-family review. Source-specific requirements for particular application types remain in source accounts.'
WHERE slug='application';

UPDATE terms SET
  short_definition='Separation is the post-contact phase in which planets move away after an aspect or conjunction has reached exactness; it presupposes a contact that has already perfected rather than one that never formed.',
  editorial_notes='Bird’s-eye aspect-family review.'
WHERE slug='separation';

UPDATE terms SET
  short_definition='Perfection is the traditional horary outcome in which the matter signified reaches accomplishment or conclusion. It can arise through more than one planetary mechanic and is not simply another name for an exact aspect.',
  editorial_notes='Bird’s-eye aspect-family review. Lilly Chapter XXI is the current direct public witness for the umbrella outcome term.'
WHERE slug='perfection';

UPDATE terms SET
  short_definition='Translation of Light is a mediation in which a faster planet separates from contact with one planet and then applies to another, carrying the earlier planet’s light or virtue into the new contact so two principals can be connected indirectly.',
  editorial_notes='Bird’s-eye mediation definition. Preserve source-specific orb, reception and dignity requirements in attributed accounts rather than universalizing them.'
WHERE slug='translation-of-light';

UPDATE terms SET
  short_definition='Collection of Light is a mediation in which two planets apply to a third planet that receives or gathers their light, allowing the third planet to connect principals that do not perfect directly with one another.',
  editorial_notes='Bird’s-eye mediation definition. Additional historical requirements concerning weight, dignity or reception remain source-specific.'
WHERE slug='collection-of-light';

UPDATE terms SET
  short_definition='Prohibition is a family of interruption mechanics in which another planetary contact intervenes before an expected application reaches perfection. The exact three-planet sequence must be read from the historical source being used.',
  editorial_notes='Bird’s-eye interruption definition. Do not flatten source variants into a single modern diagram.'
WHERE slug='prohibition';

UPDATE terms SET
  short_definition='Frustration in Lilly is the interruption in which the planet being applied to perfects a conjunction with another planet before the original applicant reaches it, defeating the expected contact.',
  editorial_notes='Bird’s-eye definition scoped to the canonical Lilly Frustration entry. Keep Bonatti’s distinct `frustration-bonatti` separate.'
WHERE slug='frustration';

UPDATE terms SET
  short_definition='Refrenation is an interrupted application in which the applying planet turns retrograde before the expected conjunction or aspect reaches perfection.',
  editorial_notes='Bird’s-eye interruption definition.'
WHERE slug='refrenation';

-- -----------------------------------------------------------------------------
-- SYSTEM-LEVEL TEACHING
-- -----------------------------------------------------------------------------

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'mechanics-layers','From geometry to outcome',
  'The layers answer different questions. A chart can contain an aspect without an applying contact, an application without eventual perfection, or perfection produced indirectly through mediation.',
  '["Layer","Core terms","Question answered"]',
  '[["Geometry","Aspect · orb · partile · platick","Is there a recognized contact geometry and how close is it?"],["Motion phase","Application · Separation","Is the contact approaching exactness or moving away after it?"],["Outcome","Perfection","Does the signified matter reach accomplishment in the source’s horary vocabulary?"],["Mediation","Translation · Collection","Can an intermediary connect planets that do not complete the matter directly?"],["Relational modifier","Reception","What dignitary relationship exists between the planets involved?"],["Interruption / denial","Prohibition · Frustration · Refrenation · Abscission and related source terms","What changes or prevents the expected route to completion?"]]',
  5,'reviewed','Bird’s-eye teaching table. It is a conceptual map, not an ordered horary judgment checklist.'
FROM terms WHERE slug='perfection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'geometry-first','Geometry and perfection are different levels',
  'An aspect establishes a geometrical relationship. Application adds motion toward exact contact. Perfection in horary adds an outcome claim about the matter represented by the significators. Keeping those levels separate prevents a common category error: an aspect can exist without applying, and an applying aspect can be interrupted before the matter perfects.',5,'reviewed',NULL
FROM terms WHERE slug='aspect';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'direct-indirect','Direct and mediated connection',
  'A matter does not have to be represented by one direct application between the two principal planets in order for historical authors to discuss perfection. Translation and Collection of Light are separate mediation structures. They should therefore be learned after ordinary application, not collapsed into the definition of an aspect itself.',25,'reviewed',NULL
FROM terms WHERE slug='application';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Translation of Light is an indirect-contact structure. A faster intermediary planet carries a previous contact forward by separating from one planet and then applying to another. The doctrine belongs to the mechanics of mediation: the two principal planets need not complete a direct application with each other for the intermediary to connect them in the historical framework.',
  'reviewed','Bird’s-eye mediation article; recognition details remain source-attributed.'
FROM terms WHERE slug='translation-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sequence','A carried sequence rather than a static triangle',
  'The defining idea is temporal: the intermediary has a separating relation to one planet and an applying relation to the other. A static picture showing three planets in aspect is not sufficient unless the required sequence of motion is present under the source’s rules.',10,'reviewed',NULL
FROM terms WHERE slug='translation-of-light';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Collection of Light is a different form of mediation. Instead of one faster planet carrying a prior contact from one principal to another, two planets direct their applications toward a third planet, which gathers or receives their light and thereby supplies a point of connection between them.',
  'reviewed','Bird’s-eye mediation article; source-specific conditions remain attributable.'
FROM terms WHERE slug='collection-of-light';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'contrast-translation','Collection is not Translation',
  'Translation uses one intermediary moving from a separating contact into an applying contact. Collection has two planets applying toward a third receiver. Both can mediate a matter, but their motion diagrams are different and the terms should not be used interchangeably.',10,'reviewed',NULL
FROM terms WHERE slug='collection-of-light';

-- Make the main interruption pages self-locating within the family without reproducing a
-- procedural decision tree.
WITH data(slug,heading,body,seq) AS (VALUES
  ('prohibition','Where it sits in the mechanics family','Prohibition belongs after an application has been identified but before expected perfection is assumed. Another contact intervenes in the developing sequence. Historical sources vary in the exact geometry, so the source account is part of the definition rather than an optional footnote.',5),
  ('frustration','A specific failed sequence','Lilly’s Frustration is not merely any disappointing outcome. It names a particular planetary sequence in which the intended receiver completes another conjunction first. Bonatti’s translated Frustration uses a different recognition rule and remains a separate entry.',5),
  ('refrenation','Reversal before completion','Refrenation is motion-based: the applicant reverses direction before completing the expected contact. It therefore connects the perfection family directly to station and retrogradation terminology.',5),
  ('abscission-of-light','A source-variable interruption family','Abscission or cutting of light belongs to the interruption layer, but its exact geometry varies across the preserved authors. The canonical entry therefore names the shared family while the source accounts preserve the individual mechanisms.',5)
)
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT t.id,'family-position',d.heading,d.body,d.seq,'reviewed',NULL
FROM data d JOIN terms t ON t.slug=d.slug;

-- -----------------------------------------------------------------------------
-- CROSS-LINKS THAT EXPRESS THE LAYERING
-- -----------------------------------------------------------------------------

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('aspect','application','can-enter-phase','An aspectual geometry can be applying when planetary motion is approaching exact contact.'),
  ('aspect','separation','can-enter-phase','An aspectual geometry can be separating after exact contact.'),
  ('aspect','perfection','distinct-from','Aspect is geometry; horary Perfection is accomplishment of the signified matter.'),
  ('application','perfection','can-lead-to','An application can participate in direct perfection if it completes under the relevant source conditions.'),
  ('application','translation-of-light','prerequisite-concept-for','Translation of Light depends on separating and applying motion.'),
  ('application','collection-of-light','prerequisite-concept-for','Collection of Light depends on applications toward a collecting planet.'),
  ('translation-of-light','perfection','can-mediate','Translation can mediate a route to perfection in Lilly’s terminology.'),
  ('collection-of-light','perfection','can-mediate','Collection can mediate a route to perfection in Lilly’s terminology.'),
  ('translation-of-light','collection-of-light','distinct-from','Translation carries a contact sequentially through one intermediary; Collection gathers two applications into a receiver.'),
  ('refrenation','retrogradation','depends-on-motion','Refrenation occurs because the applying planet turns retrograde before expected completion.'),
  ('frustration','frustration-bonatti','distinct-from','The same English label is preserved for two materially different source mechanisms.'),
  ('abscission-of-light','prohibition','related-interruption','Both belong to the historical family of interruption/denial mechanics but their recognition rules are not interchangeable.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
