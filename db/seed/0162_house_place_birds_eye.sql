-- Bird's-eye encyclopedia review: houses / places as a coherent structural family.
--
-- The existing house articles already explain angle-succedent-cadent structure well. This
-- pass uses the generic concept-family layer to distinguish positional structure, accidental
-- strength, relational counting and source-specific house taxonomies without creating a
-- house-judgment workflow.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO concept_families
  (slug,label,description,family_type,editorial_note,status)
VALUES
  ('houses-places-structure','Houses and Places',
   'The structural doctrine of the twelve places: the repeating angle–succedent–cadent sequence, its relation to accidental planetary capacity, derived-house counting, and additional source-specific classifications.',
   'taxonomy',
   'Bird’s-eye house family. Positional strength and topical signification answer different questions and must remain separate.',
   'reviewed');

WITH members(term_slug,role_key,role_label,seq,note) AS (VALUES
  ('twelve-places','framework','Framework',10,'Umbrella structure for the twelve house/place sectors.'),
  ('cardine','strength-class','Positional class',20,'Angles/cardines anchor the four quadrants and carry the strongest positional capacity.'),
  ('succedent-place','strength-class','Positional class',30,'Succedent places follow the angles and occupy the intermediate structural class.'),
  ('cadent-place','strength-class','Positional class',40,'Cadent places fall away before the next angle and form the weakest general positional class.'),
  ('derived-house','relational-counting','Relational counting',50,'Changes the reference house for a person/topic while preserving the same chart and house sequence.'),
  ('places-for-dealings','historical-class','Source-specific classification',60,'Antiochus’ additional house grouping; not a synonym for angularity.'),
  ('places-without-dealings','historical-class','Source-specific classification',70,'The contrasting Antiochan class paired with Places for Dealings.')
)
INSERT OR REPLACE INTO concept_family_members
  (family_id,term_id,role_key,role_label,sequence_no,note,status)
SELECT f.id,t.id,m.role_key,m.role_label,m.seq,m.note,'reviewed'
FROM members m
JOIN concept_families f ON f.slug='houses-places-structure'
JOIN terms t ON t.slug=m.term_slug;

UPDATE terms SET
  short_definition='The Twelve Places are the twelve sectors of an astrological figure used to organize planetary position and topical signification. Their structural angle–succedent–cadent classes describe positional capacity and should not be confused with the topics assigned to the individual houses.',
  editorial_notes='Bird’s-eye house-family review. Keep structural strength, topical meaning and house-system calculation conceptually distinct.'
WHERE slug='twelve-places';

UPDATE terms SET
  short_definition='A Cardine or angle is one of the four principal pivots of the figure—the 1st, 10th, 7th and 4th places—and belongs to the strongest general class of house position for planetary action.',
  editorial_notes='Bird’s-eye house-family review. Angularity describes accidental capacity rather than essential dignity or moral quality.'
WHERE slug='cardine';

UPDATE terms SET
  short_definition='A succedent place is one of the 2nd, 5th, 8th or 11th houses, each following an angle in the repeating house structure and generally occupying an intermediate position in accidental strength.',
  editorial_notes='Bird’s-eye house-family review.'
WHERE slug='succedent-place';

UPDATE terms SET
  short_definition='A cadent place is one of the 3rd, 6th, 9th or 12th houses, each falling away before the next angle and generally carrying less immediate accidental capacity than angular or succedent positions.',
  editorial_notes='Bird’s-eye house-family review. Cadency is not the same as topical unimportance.'
WHERE slug='cadent-place';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'structure-vs-topic','Two questions a house answers',
  'The same house participates in both layers. Structural class does not replace topical meaning, and topical importance does not erase positional class.',
  '["Layer","Examples","Question answered"]',
  '[["Structural position","Angle · Succedent · Cadent","How much immediate accidental capacity does a planet gain from its place in the figure?"],["Topical signification","The historically assigned matters of the 1st–12th places","What kinds of persons, things or matters does this place signify in the source/tradition?"]]',
  25,'reviewed','Bird’s-eye distinction; not a house delineation checklist.'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-topic','Strength class is not a topic list',
  'Calling a house angular, succedent or cadent says where it stands relative to the chart’s pivots. It does not tell us which life topic the house signifies. The ninth place remains the ninth place for its own topics even though it is cadent; the tenth remains angular while also carrying its own historically assigned topics. The two layers must be combined rather than substituted for one another.',35,'reviewed',NULL
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'reference-shift','Derived houses shift the counting origin, not the chart',
  'Derived-house doctrine does not create a second set of physical houses. It temporarily treats the house of another person or topic as a new counting origin, then counts onward through the existing sequence. Planetary positions, zodiacal signs and the original house framework remain unchanged.',30,'reviewed',NULL
FROM terms WHERE slug='derived-house';

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('twelve-places','cardine','contains-class','Four of the twelve places are angles/cardines.'),
  ('twelve-places','succedent-place','contains-class','Four of the twelve places are succedent.'),
  ('twelve-places','cadent-place','contains-class','Four of the twelve places are cadent.'),
  ('cardine','succedent-place','precedes-structurally','Each succedent follows an angle in the repeating three-place sequence.'),
  ('succedent-place','cadent-place','precedes-structurally','Each cadent follows a succedent before the next angle.'),
  ('derived-house','twelve-places','recounts-within','Derived-house technique changes the counting origin within the same twelve-place framework.'),
  ('places-for-dealings','places-without-dealings','paired-with','The two Antiochan classifications form a source-specific contrast.'),
  ('places-for-dealings','cardine','distinct-from','Places for Dealings do not simply reproduce the ordinary angular class.'),
  ('places-without-dealings','cadent-place','distinct-from','Places without Dealings should not be treated as a synonym for cadent places.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
