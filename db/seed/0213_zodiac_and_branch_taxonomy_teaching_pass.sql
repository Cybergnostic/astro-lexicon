-- Editorial family pass: zodiac reference systems and major astrology branches.
--
-- These are broad taxonomy concepts already present as reviewed terms. This pass adds
-- reader-facing explanations and relations without importing analytical workflows or
-- pretending that all historical authors used the same branch labels.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ZODIAC REFERENCE SYSTEMS
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Tropical Zodiac is a twelve-sign zodiac whose starting point is anchored to the seasonal equinox-and-solstice framework. Zero Aries is defined by the vernal equinox, so the signs remain tied to the seasonal circle even as the stellar background shifts through precession.',
  'reviewed','Taxonomy article; interpretive claims are outside this entry.'
FROM terms WHERE slug='tropical-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'reference-point','Reference point',
  'Its defining reference is seasonal rather than stellar: the equinoctial and solstitial points organize the zodiacal cycle. The term therefore describes how zodiacal longitude is referenced, not a separate set of twelve sign meanings.',10,'reviewed',NULL
FROM terms WHERE slug='tropical-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'precession','Relation to precession',
  'Because the equinoxes move slowly relative to the fixed-star background, tropical sign positions and stellar constellations do not remain permanently aligned. This difference belongs to the reference system itself and should not be confused with a change in the thirty-degree structure of the signs.',20,'reviewed',NULL
FROM terms WHERE slug='tropical-zodiac';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Sidereal Zodiac is a twelve-sign zodiac referenced to a stellar framework rather than fixing zero Aries to the moving vernal equinox. Different sidereal systems can place the zodiacal origin differently, so the general concept should be distinguished from any one ayanamsa or zero-point convention.',
  'reviewed','Reference-system definition only; no single ayanamsa is made canonical.'
FROM terms WHERE slug='sidereal-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'stellar-reference','A stellar reference frame',
  'The defining feature is that zodiacal longitude is tied to a fixed or comparatively fixed stellar reference. The signs remain equal thirty-degree divisions; the difference from the tropical zodiac lies in where the circle is anchored.',10,'reviewed',NULL
FROM terms WHERE slug='sidereal-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'variants','Multiple sidereal zero points',
  'Sidereal traditions do not all use exactly the same zero point. The offset from the tropical zodiac therefore depends on the adopted stellar reference or ayanamsa, which belongs to the individual system rather than to the definition of sidereal zodiac as a whole.',20,'reviewed',NULL
FROM terms WHERE slug='sidereal-zodiac';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Draconic Zodiac is a derived zodiacal coordinate system in which the Moon’s ascending node is set to zero Aries and all other positions are measured relative to that nodal origin. It is therefore a re-referencing of existing zodiacal longitudes rather than a different physical zodiac in the sky.',
  'reviewed','Coordinate-system description only; interpretive applications vary and are not made canonical.'
FROM terms WHERE slug='draconic-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nodal-origin','The ascending node as zero Aries',
  'The system rotates the zodiacal coordinate frame so that the ascending lunar node occupies zero Aries. Every other point is shifted by the same amount, preserving angular relationships while changing the sign and degree labels assigned within the derived frame.',10,'reviewed',NULL
FROM terms WHERE slug='draconic-zodiac';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'derived-frame','A derived coordinate frame',
  'Unlike the tropical and sidereal zodiacs, whose distinction concerns the astronomical reference used for zodiacal longitude, the draconic zodiac is constructed from the nodal position of a particular chart or epoch. It should therefore be understood as a derived coordinate system.',20,'reviewed',NULL
FROM terms WHERE slug='draconic-zodiac';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Tropical and sidereal zodiacs use different reference anchors for the same equal twelve-sign circle.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='tropical-zodiac' AND b.slug='sidereal-zodiac';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Sidereal and tropical zodiacs use different reference anchors for the same equal twelve-sign circle.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='sidereal-zodiac' AND b.slug='tropical-zodiac';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'derived-from','The draconic zodiac re-references zodiacal longitudes to the ascending lunar node.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='draconic-zodiac' AND b.slug='zodiac';

-- -----------------------------------------------------------------------------
-- MAJOR BRANCHES OF ASTROLOGY
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Mundane Astrology is the branch of astrology concerned with collective and public matters rather than one individual nativity or one private question. Historical mundane work includes annual world-year figures, rulers and states, wars, weather, eclipses and larger conjunctional cycles.',
  'reviewed','Broad branch taxonomy; individual mundane techniques remain on their own entries.'
FROM terms WHERE slug='mundane-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','Collective scope',
  'The defining distinction is scale. Mundane judgment addresses regions, communities, political authorities and other collective conditions. A technique used in mundane astrology can have its own precise recognition rule, so the branch should not be reduced to one chart type.',10,'reviewed',NULL
FROM terms WHERE slug='mundane-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Natal Astrology is the branch of astrology concerned with a nativity: the astrological figure of a birth and the life of the native represented by it. Traditional natal doctrine organizes topics through the condition of planets, houses, lots, significators and time techniques appropriate to the birth figure.',
  'reviewed','Branch definition only; no natal judgment workflow imported.'
FROM terms WHERE slug='natal-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nativity','The nativity as its root figure',
  'Natal astrology begins from the birth figure itself. Later predictive techniques may activate or time natal significations, but those techniques do not replace the nativity as the foundational chart of the branch.',10,'reviewed',NULL
FROM terms WHERE slug='natal-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Horary Astrology is the branch of astrology that judges a specific question from the figure erected for the relevant questioning moment. Its defining object is an interrogational problem rather than a birth or a deliberately selected future beginning.',
  'reviewed','Branch taxonomy linked to the canonical Horary Question entry.'
FROM terms WHERE slug='horary-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'question-root','A question rather than a birth or election',
  'The chart is rooted in a concrete question and its relevant moment. The querent, quesited and significators belong to the judgment of that question, which distinguishes horary practice from natal and electional branches even when they share general doctrines such as dignity, reception and application.',10,'reviewed',NULL
FROM terms WHERE slug='horary-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Electional Astrology is the branch concerned with selecting a suitable future inception for an intended action. Rather than asking what an already-given chart signifies, the astrologer compares possible beginnings and chooses a time whose relevant significators better support the work to be undertaken.',
  'reviewed','Branch definition; detailed electional adaptation rules remain source-specific.'
FROM terms WHERE slug='electional-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'chosen-inception','The chosen inception',
  'An election concerns a beginning that can still be selected. This distinguishes it from horary, where the question supplies the root moment, and from natal astrology, where the birth has already occurred. Historical authors can additionally require agreement with a prior natal or interrogational root.',10,'reviewed',NULL
FROM terms WHERE slug='electional-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Predictive Astrology is a broad modern taxonomy label for traditional techniques that organize or time developments through cycles, periods, directions, profections, revolutions and related procedures. It is not one single historical technique and should not be treated as though all predictive methods share one mechanism.',
  'reviewed','Broad taxonomy only; techniques retain separate historical identities.'
FROM terms WHERE slug='predictive-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'umbrella','An umbrella, not a single technique',
  'Firdaria, profections, directions and return charts can all be used predictively, but they operate through different structures and historical vocabularies. The branch label groups their purpose without collapsing their methods.',10,'reviewed',NULL
FROM terms WHERE slug='predictive-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Medical Astrology is the historical branch in which astrological doctrine was applied to bodily condition, illness, temperament and medical timing within premodern medicine. The lexicon records this historical vocabulary without presenting astrological methods as modern diagnosis or treatment.',
  'reviewed','Historical taxonomy only; not medical advice.'
FROM terms WHERE slug='medical-astrology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'historical-context','A historical medical framework',
  'Terms such as melothesia, decumbiture and critical days belong to historical astrological medicine and must be read in that context. Their presence in the lexicon documents the source tradition rather than validating them as contemporary clinical methods.',10,'reviewed',NULL
FROM terms WHERE slug='medical-astrology';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Astrometeorology is the branch of mundane astrology concerned with weather and atmospheric conditions through celestial cycles, lunations, planetary configurations and other testimonies. Historical authors preserve distinct weather vocabularies that should remain source-specific rather than be compressed into one universal forecasting recipe.',
  'reviewed','Historical branch taxonomy; no weather-prediction workflow imported.'
FROM terms WHERE slug='astrometeorology';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mundane-subbranch','A subbranch of mundane astrology',
  'Its subject is collective atmospheric condition rather than a private nativity or question. Concepts such as Opening the Doors, wet and dry lunar mansions, and convertible planets belong to particular historical weather systems within this wider branch.',10,'reviewed',NULL
FROM terms WHERE slug='astrometeorology';

-- Branch relations.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Astrometeorology is a weather-focused branch of mundane astrology.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='astrometeorology' AND b.slug='mundane-astrology';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses-root-concept','Horary astrology is organized around the interrogational figure represented by the Horary Question entry.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='horary-astrology' AND b.slug='horary-question';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses-root-concept','Electional astrology is organized around the deliberate selection represented by the Election entry.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='electional-astrology' AND b.slug='election';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses-root-concept','Natal astrology is organized around the birth figure represented by the Nativity entry.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='natal-astrology' AND b.slug='nativity';

-- -----------------------------------------------------------------------------
-- SHARED PAGE COMPOSITION FOR THIS FAMILY PASS
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'tropical-zodiac','sidereal-zodiac','draconic-zodiac',
    'mundane-astrology','natal-astrology','horary-astrology','electional-astrology',
    'predictive-astrology','medical-astrology','astrometeorology'
  )
);

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'taxonomy-overview','Overview',10,'reviewed','Family-batch page composition.'
FROM terms WHERE slug IN (
  'tropical-zodiac','sidereal-zodiac','draconic-zodiac',
  'mundane-astrology','natal-astrology','horary-astrology','electional-astrology',
  'predictive-astrology','medical-astrology','astrometeorology'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Family-batch page composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='taxonomy-overview'
  AND ps.term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'tropical-zodiac','sidereal-zodiac','draconic-zodiac',
      'mundane-astrology','natal-astrology','horary-astrology','electional-astrology',
      'predictive-astrology','medical-astrology','astrometeorology'
    )
  )
  AND s.status IN ('reviewed','published');
