-- Encyclopedia presentation pass: reception and aspect mechanics.
-- These tables clarify independent dimensions of planetary relationship without
-- converting them into an ordered chart-analysis procedure.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- RECEPTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'reception-types','Reception at a glance',
  'Reception describes one planet receiving another into a dignity it rules. The relationship can be one-way or reciprocal.',
  '["Form","Structure"]',
  '[["One-way reception","Planet A occupies a dignity ruled by Planet B; B receives A"],["Mutual reception","Each planet occupies a dignity ruled by the other, producing reciprocal reception"]]',
  60,'reviewed','Generic structural comparison; which dignities qualify and how strongly they are weighted can be source-sensitive.'
FROM terms WHERE slug='reception';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'reception-vs-aspect','Reception and aspect answer different questions',
  'The two doctrines can occur together, but neither term is simply another name for the other.',
  '["Doctrine","Primary question"]',
  '[["Aspect / configuration","How are the planets geometrically related?"],["Reception","Does one planet occupy a dignity governed by the other?"],["Application / separation","Is the relevant contact forming or moving apart?"]]',
  70,'reviewed','Conceptual distinction only; source-specific synthesis belongs in historical accounts.'
FROM terms WHERE slug='reception';

-- -----------------------------------------------------------------------------
-- APPLICATION / SEPARATION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'application-separation','Application and separation compared',
  'These are temporal/motional states of a contact, not separate aspect geometries.',
  '["State","Basic motion"]',
  '[["Application","The faster/lighter planet is moving toward perfection of the relevant contact"],["Exact / perfection","The defining contact reaches exactness under the rule being used"],["Separation","The faster/lighter planet has passed perfection and the contact is opening"]]',
  60,'reviewed','Generic mechanics. Exact source rules for sign boundaries, moieties and residual mixing remain source-specific.'
FROM terms WHERE slug='application';

-- -----------------------------------------------------------------------------
-- PARTILE / PLATICK / ORB
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'exactness-and-orb','Exactness and orb vocabulary',
  'These terms describe how closely a configuration approaches its exact geometry and whether it falls within the accepted range of contact.',
  '["Term","Basic idea"]',
  '[["Partile","Very close degree-level exactness; historical definitions can be stricter than a generic “close aspect”"],["Platick","A broader aspect/contact operating within the relevant orb or moiety rather than partile exactness"],["Planetary Orb","The range of efficacy traditionally assigned to a planet for judging whether contact can operate"]]',
  60,'reviewed','Do not impose one universal numerical orb table across all authors.'
FROM terms WHERE slug='planetary-orb';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'independent-aspect-dimensions','Independent dimensions of an aspect',
  'A single planetary relationship can be described simultaneously by several different technical vocabularies.',
  '["Dimension","Examples"]',
  '[["Geometry","Conjunction · Sextile · Square · Trine · Opposition"],["Direction of ray","Dexter · Sinister"],["Temporal state","Applying · Exact · Separating"],["Exactness / range","Partile · Platick · Within orb"],["Dignity relationship","Reception · Mutual reception"]]',
  80,'reviewed','Reference map, not an ordered judgment workflow.'
FROM terms WHERE slug='aspect';
