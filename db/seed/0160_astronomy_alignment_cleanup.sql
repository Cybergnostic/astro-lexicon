-- Bird's-eye astronomy cleanup: projection, occultation, eclipses and fixed-star nature.
--
-- This follows the coordinate/motion review in 0159. No new predictive workflow is added.
-- The goal is to connect already-existing astronomical terms and repair one older article
-- seed that targeted a non-canonical fixed-star-nature slug.

PRAGMA foreign_keys = ON;

UPDATE terms SET
  short_definition='Ecliptic projection expresses a celestial object by its longitude on the ecliptic so it can be compared with zodiacal positions; it does not erase the object’s separate latitude or guarantee a true visual conjunction.',
  editorial_notes='Bird’s-eye coordinate review. Longitude projection is one coordinate operation; distinguish it from actual apparent overlap or occultation.'
WHERE slug='ecliptic-projection';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Ecliptic projection reduces a celestial position to its longitude along the ecliptic so that a star or other off-ecliptic body can be compared directly with zodiacal degrees. This is useful for longitude-based astrological contacts, but it is deliberately a projection: the object’s latitude remains a separate coordinate.',
  'reviewed','Bird’s-eye coordinate integration.'
FROM terms WHERE slug='ecliptic-projection';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'longitude-latitude','Projected longitude does not remove latitude',
  'Two objects can have the same projected ecliptic longitude while lying north and south of one another. Equality of longitude can therefore define a zodiacal conjunction without producing an occultation. Actual apparent overlap requires the sky positions to coincide closely in both dimensions from the observer’s line of sight.',10,'reviewed',NULL
FROM terms WHERE slug='ecliptic-projection';

UPDATE terms SET
  short_definition='An occultation occurs when one celestial body actually passes in front of and hides another from the observer, requiring apparent line-of-sight overlap rather than only equal projected longitude.',
  editorial_notes='Bird’s-eye geometry review. Distinguish actual apparent overlap from longitude-only conjunction.'
WHERE slug='occultation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'coordinate-requirement','Why latitude matters',
  'A longitude conjunction supplies only the along-ecliptic coordinate. If the two bodies are separated enough in latitude, they pass above and below one another rather than overlap. Occultation is therefore a direct example of why longitude and latitude must remain separate astronomical quantities.',20,'reviewed',NULL
FROM terms WHERE slug='occultation';

-- The general eclipse article already contains the correct basic taxonomy. Add a bridge to
-- the coordinate system rather than duplicating its existing subtype table.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'orbital-plane','Eclipses require more than a new or full Moon',
  'The Sun, Earth and Moon must align closely enough in three-dimensional geometry. Because the Moon’s orbit is inclined to the ecliptic, most new and full moons pass above or below exact eclipse alignment. The eclipse family therefore connects lunation phase with orbital-plane crossings rather than following from zodiacal longitude alone.',15,'reviewed',
  'Modern geometry checked against NASA eclipse education material; node terminology remains source-specific elsewhere in the corpus.'
FROM terms WHERE slug='eclipse';

-- Repair an older silent no-op: seed 0119 targeted `planetary-nature-of-fixed-star`, while
-- the canonical taxonomy slug created in 0083 is `fixed-star-nature`.
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The planetary nature of a fixed star is a traditional qualitative analogy that describes a star through one or more planetary natures. It classifies attributed stellar character; it does not make the star a planet or imply that every authority assigns the same analogy.',
  'reviewed','Bird’s-eye repair of the fixed-star nature article using the canonical `fixed-star-nature` slug.'
FROM terms WHERE slug='fixed-star-nature';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'source-variation','Planetary analogies are source-specific',
  'Historical authorities can assign different planetary analogies to the same star or stellar group. The encyclopedia should therefore preserve the attribution with its source instead of turning one table of star natures into an unlabelled universal system.',10,'reviewed',NULL
FROM terms WHERE slug='fixed-star-nature';

WITH rel(subject_slug,object_slug,relation_type,note) AS (VALUES
  ('ecliptic-projection','ecliptic','projects-onto','Ecliptic projection expresses a celestial position on the ecliptic reference circle.'),
  ('ecliptic-projection','celestial-longitude','produces-coordinate','The projection supplies an ecliptic-longitude value for comparison with zodiacal degrees.'),
  ('ecliptic-projection','celestial-latitude','does-not-replace','Projection to longitude does not eliminate the object’s separate ecliptic latitude.'),
  ('ecliptic-projection','occultation','distinct-from','Equal projected longitude does not by itself produce actual apparent overlap.'),
  ('occultation','celestial-longitude','requires-close-coordinate','An occultation requires close apparent alignment in longitude.'),
  ('occultation','celestial-latitude','requires-close-coordinate','An occultation also requires sufficiently close north–south apparent position.'),
  ('eclipse','solar-eclipse','has-subtype','Solar eclipse is one main eclipse geometry.'),
  ('eclipse','lunar-eclipse','has-subtype','Lunar eclipse is one main eclipse geometry.'),
  ('solar-eclipse','sun','involves','A solar eclipse obscures the Sun from part of Earth.'),
  ('solar-eclipse','moon','involves','The Moon passes between Earth and Sun in a solar eclipse.'),
  ('lunar-eclipse','moon','involves','A lunar eclipse darkens the Moon as it enters Earth’s shadow.'),
  ('fixed-star-nature','fixed-star','classifies','Planetary nature is a traditional qualitative classification applied to fixed stars.'),
  ('fixed-star-nature','planetary-nature','uses-analogy-with','Fixed-star nature uses an analogy with attributed planetary natures rather than literal planetary identity.')
)
INSERT OR IGNORE INTO term_relations
  (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,r.relation_type,r.note,'reviewed'
FROM rel r
JOIN terms s ON s.slug=r.subject_slug
JOIN terms o ON o.slug=r.object_slug;
