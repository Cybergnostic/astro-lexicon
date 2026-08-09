-- Encyclopedia conversion batch: fixed-star and eclipse taxonomy.
-- Keep this structural and historical; do not turn taxonomy into event-prediction recipes.

-- FIXED STAR
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A fixed star is a star treated astrologically by its position against the stellar background, as distinct from the visibly wandering planets. Traditional authors identify stars by position, brightness, constellation or named stellar identity and may assign them qualitative planetary analogies.',
  'reviewed','Taxonomy article; star-by-star delineations remain separate.'
FROM terms WHERE slug='fixed-star';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'position','Position and identification',
  'A fixed star is identified by its celestial position rather than by a zodiacal sign rulership scheme. Because precession changes tropical longitude over long periods, historical star positions must be read in the epoch and coordinate framework of the source rather than copied mechanically into a modern chart.',10,'reviewed'
FROM terms WHERE slug='fixed-star';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'brightness','Brightness and magnitude',
  'Historical stellar magnitude describes apparent brightness, not physical size. Lower magnitude numbers correspond to brighter stars in the modern numerical convention; older authors may use ordinal magnitude classes instead.',20,'reviewed'
FROM terms WHERE slug='fixed-star';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'nature','Planetary nature',
  'Traditional texts often describe a star through an analogy with one or two planets, such as a Mars-like or Venus/Jupiter-like nature. This is a qualitative classification of the star’s attributed character, not a claim that the star is literally ruled by those planets.',30,'reviewed'
FROM terms WHERE slug='fixed-star';

-- STELLAR MAGNITUDE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Stellar magnitude is a brightness classification used to compare how bright stars appear from Earth. In astrological source work it helps identify which stars an author considered prominent and can distinguish stars within the same constellation or region of the sky.',
  'reviewed','Astronomical reference concept.'
FROM terms WHERE slug='stellar-magnitude';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scale','How the scale works',
  'The magnitude scale runs in the opposite direction from ordinary counting intuition: brighter stars have smaller numerical magnitudes, while fainter stars have larger values. Historical texts may instead speak of first-, second-, third-magnitude stars and so on.',10,'reviewed'
FROM terms WHERE slug='stellar-magnitude';

-- PLANETARY NATURE OF FIXED STAR
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The planetary nature of a fixed star is a traditional qualitative analogy that describes the star through the characteristic mixture of one or more planets. It is one of the main ways premodern authors classify stellar effects without treating stars as planets.',
  'reviewed','Conceptual definition only; star-specific attributions remain source-specific.'
FROM terms WHERE slug='planetary-nature-of-fixed-star';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'source-variation','Source variation',
  'Different authors can assign different planetary analogies to the same star or stellar group. The encyclopedia therefore keeps star-specific planetary natures attributable to sources rather than pretending every tradition used one universal table.',10,'reviewed'
FROM terms WHERE slug='planetary-nature-of-fixed-star';

-- STAR CLUSTER
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A star cluster is a visible grouping of stars treated as a collective celestial object. Some traditional astrological texts discuss well-known clusters as units rather than reducing them to a single stellar point.',
  'reviewed','Taxonomy only.'
FROM terms WHERE slug='star-cluster';

-- ECLIPTIC PROJECTION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Ecliptic projection is the practice of expressing the position of a star or other celestial object in zodiacal longitude by projecting it onto the ecliptic. It allows non-ecliptic objects such as fixed stars to be compared with zodiacal degrees and planetary longitudes.',
  'reviewed','Astronomical geometry concept.'
FROM terms WHERE slug='ecliptic-projection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'not-conjunction','Projection is not the same as bodily conjunction',
  'Two objects can share or nearly share ecliptic longitude while remaining separated in latitude. A longitude-based projection therefore does not by itself establish an actual visual covering or close three-dimensional conjunction.',10,'reviewed'
FROM terms WHERE slug='ecliptic-projection';

-- FIXED STAR ORB
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A fixed-star orb is an angular allowance used by some astrologers to decide whether a star is close enough to a planet, angle or other point to be treated as operative. Unlike a universal geometric constant, the size of this allowance varies across authors and practices.',
  'reviewed','Do not universalize one orb table.'
FROM terms WHERE slug='fixed-star-orb';

-- ECLIPSE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An eclipse is an astronomical alignment in which one luminary is obscured because the Sun, Earth and Moon align closely enough near the lunar nodes. Solar and lunar eclipses are different geometries and should be distinguished before any historical astrological interpretation is considered.',
  'reviewed','Astronomical/taxonomic entry.'
FROM terms WHERE slug='eclipse';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'node-condition','Why eclipses occur near the nodes',
  'A new or full moon does not produce an eclipse every month because the Moon’s orbit is inclined to the ecliptic. Eclipses require the lunation to occur sufficiently near one of the lunar nodes, where the orbital planes intersect.',10,'reviewed'
FROM terms WHERE slug='eclipse';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'eclipse-types','Main eclipse types',
  'The names describe different astronomical geometries. “Total” and “partial” can apply to both solar and lunar eclipses, while “annular” is a solar-eclipse type.',
  '["Type","Geometry","What is obscured"]',
  '[["Solar eclipse","Moon passes between Earth and Sun","Sun as seen from part of Earth"],["Lunar eclipse","Earth lies between Sun and Moon","Moon enters Earth’s shadow"],["Total solar","Apparent lunar disk fully covers the Sun from a narrow path","Solar disk"],["Partial solar","Moon covers only part of the Sun","Part of solar disk"],["Annular solar","Moon is too small in apparent diameter to cover the Sun fully","Central Sun covered, bright ring remains"],["Total lunar","Moon passes fully into Earth’s umbral shadow","Full lunar disk darkened"],["Partial lunar","Only part of Moon enters the umbra","Part of lunar disk darkened"]]',
  20,'reviewed','Reference table for astronomical taxonomy.'
FROM terms WHERE slug='eclipse';

-- SUBTYPES
WITH defs(slug,intro) AS (
  VALUES
    ('solar-eclipse','A solar eclipse occurs when the Moon passes between Earth and the Sun close enough to a lunar node for the Moon to obscure some or all of the solar disk from a region of Earth.'),
    ('lunar-eclipse','A lunar eclipse occurs at full moon when the Moon passes through Earth’s shadow near a lunar node. Unlike a solar eclipse, it is visible from the entire night side of Earth where the Moon is above the horizon.'),
    ('total-eclipse','A total eclipse is an eclipse in which the relevant disk is completely obscured within the geometry of the event: the Sun by the Moon in a total solar eclipse, or the Moon by Earth’s umbral shadow in a total lunar eclipse.'),
    ('partial-eclipse','A partial eclipse is an eclipse in which only part of the relevant luminary is obscured.'),
    ('annular-eclipse','An annular eclipse is a solar eclipse in which the Moon passes centrally across the Sun but has a smaller apparent diameter, leaving a visible ring of the solar disk around it.')
)
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,defs.intro,'reviewed','Astronomical subtype article.'
FROM defs JOIN terms t ON t.slug=defs.slug;

-- OCCULTATION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An occultation is an actual apparent covering of one celestial body by another along the observer’s line of sight. It is therefore stricter than a simple conjunction in zodiacal longitude.',
  'reviewed','Astronomical geometry distinction.'
FROM terms WHERE slug='occultation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'conjunction-distinction','Occultation versus conjunction',
  'A conjunction can be defined by longitude even when the bodies are separated in latitude. An occultation requires the apparent disks or positions to overlap from the observer’s viewpoint, so every occultation involves close apparent alignment but not every conjunction is an occultation.',10,'reviewed'
FROM terms WHERE slug='occultation';

-- ECLIPSE PATH
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The eclipse path is the geographic track across Earth from which a solar eclipse is seen in a particular phase, especially the narrow path of totality or annularity. It is a terrestrial visibility geometry, not a zodiacal aspect.',
  'reviewed','Astronomical/geographic concept.'
FROM terms WHERE slug='eclipse-path';
