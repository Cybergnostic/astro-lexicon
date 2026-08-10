-- Editorial family pass: planetary qualitative conditions and luminary halves.
--
-- These entries were already reconciled at the canonical-definition level from the
-- reviewed Abū Maʿshar / al-Bīrūnī / Bonatti source corpus. This pass adds concise
-- reader-facing teaching articles without flattening source-specific variants.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- PLANETARY NATURE AND PROPERTY
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Nature is the traditional qualitative description of a planet through combinations of hot, cold, wet and dry. In the source tradition these qualities describe characteristic action and indication; they do not imply that the celestial body is literally composed of the terrestrial elements that bear the same names.',
  'reviewed','Foundational qualitative doctrine from the reviewed Abū Maʿshar and al-Bīrūnī evidence.'
FROM terms WHERE slug='planetary-nature';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'qualities','The four qualitative axes',
  'A planet can be described through a mixture of heat, coldness, moisture and dryness. These qualities help explain broad affinities among planets and their changing expression, but the source authors also insist that actual condition depends on sign, phase, association and other circumstances.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-nature';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-property','Distinct from planetary property',
  'Abū Maʿshar distinguishes a planet’s attributed elementary nature from a separate operative property or power. The lexicon therefore keeps Planetary Nature and Planetary Property as related but non-identical concepts.',20,'reviewed',NULL
FROM terms WHERE slug='planetary-nature';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Property is Abū Maʿshar’s source-specific category for a planet’s characteristic operative power beyond its simple hot, cold, wet and dry nature. It helps explain why two planets with partially similar qualitative mixtures do not necessarily produce the same kind of action.',
  'reviewed','Source-specific foundational doctrine; do not universalize as a later standard technical vocabulary.'
FROM terms WHERE slug='planetary-property';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'operative-character','An operative characteristic',
  'Property belongs to what the planet characteristically does or brings about in the source’s explanatory scheme. It is therefore closer to an operative disposition than to a second list of elemental qualities.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-property';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'nature-distinction','Why nature and property are separate',
  'The distinction prevents every planetary effect from being reduced to the four qualities alone. The source uses nature and property together as different explanatory layers, so they should remain linked without being merged.',20,'reviewed',NULL
FROM terms WHERE slug='planetary-property';

-- -----------------------------------------------------------------------------
-- VARIABLE / CONDITION-DEPENDENT OPERATION
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Mixed Planet is a planet whose manifested quality changes markedly according to association and condition instead of remaining straightforwardly benefic or malefic in every situation. Abū Maʿshar treats Mercury as the clearest example of this variable class.',
  'reviewed','Abū Maʿshar source category; article preserves condition-dependence rather than turning it into a universal planet label.'
FROM terms WHERE slug='mixed-planet';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'association','Condition and association matter',
  'The defining idea is adaptability. A mixed planet can take on a more fortunate or unfortunate expression through the sign it occupies, the planets with which it is configured, and other conditions. The category therefore describes variable manifestation rather than simple neutrality.',10,'reviewed',NULL
FROM terms WHERE slug='mixed-planet';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'In the Nature of the Benefics is Abū Maʿshar’s condition in which a planet normally classed as malefic behaves in a benefic-like way because its situation moderates or redirects its ordinary action. The planet’s underlying class is not erased; the phrase describes how it operates under the particular condition.',
  'reviewed','Source-specific conditional classification.'
FROM terms WHERE slug='in-nature-of-benefics';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'conditional-operation','A conditional mode of operation',
  'The phrase is not a permanent reclassification of the planet. It records that a normally difficult planet can act in a more constructive or benefic-like manner when its circumstances sufficiently temper its ordinary tendency.',10,'reviewed',NULL
FROM terms WHERE slug='in-nature-of-benefics';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'In the Nature of the Malefics is Abū Maʿshar’s condition in which a planet normally classed as benefic behaves in a malefic-like way because its situation corrupts or redirects its ordinary action. The phrase therefore describes conditioned manifestation rather than changing the planet’s fundamental class.',
  'reviewed','Source-specific conditional classification.'
FROM terms WHERE slug='in-nature-of-malefics';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'conditional-operation','A conditional mode of operation',
  'A benefic is not treated as intrinsically malefic merely because this condition is present. The doctrine instead shows that the traditional benefic/malefic classes are modified by actual planetary state and cannot be read as absolute labels detached from condition.',10,'reviewed',NULL
FROM terms WHERE slug='in-nature-of-malefics';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasting-condition','These paired conditions describe opposite reversals of ordinary planetary operation without changing the underlying class.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='in-nature-of-benefics' AND b.slug='in-nature-of-malefics';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasting-condition','These paired conditions describe opposite reversals of ordinary planetary operation without changing the underlying class.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='in-nature-of-malefics' AND b.slug='in-nature-of-benefics';

-- -----------------------------------------------------------------------------
-- PLANETARY GENDER
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Masculinity is the traditional classification of a planet as masculine. It is a planetary category distinct from the separate masculine/feminine classification of zodiacal signs, and source authors can describe a planet’s manifested gender as modified by phase, position or association.',
  'reviewed','Keep planetary gender separate from sign gender and from modern social-gender meanings.'
FROM terms WHERE slug='planetary-masculinity';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'separate-classification','Planet and sign classifications are separate',
  'A masculine planet can occupy a feminine sign and vice versa. Some compound doctrines, such as hayz or domain conditions, explicitly compare planetary gender with sign gender, which only makes sense if the two classifications remain distinct.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-masculinity';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary Femininity is the traditional classification of a planet as feminine. Like planetary masculinity, it belongs to the historical qualitative system of planetary classification and is separate from the masculine/feminine alternation assigned to zodiacal signs.',
  'reviewed','Keep planetary gender separate from sign gender and from modern social-gender meanings.'
FROM terms WHERE slug='planetary-femininity';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'separate-classification','Planet and sign classifications are separate',
  'Planetary gender can interact with sign gender inside compound conditions without being identical to it. Historical authors may also describe a planet’s manifested gender as changing under particular phases or associations, so source context matters.',10,'reviewed',NULL
FROM terms WHERE slug='planetary-femininity';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired traditional classifications of planetary gender.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-masculinity' AND b.slug='planetary-femininity';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Paired traditional classifications of planetary gender.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-femininity' AND b.slug='planetary-masculinity';

-- -----------------------------------------------------------------------------
-- SOLAR AND LUNAR HALVES OF THE ZODIAC
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Solar Half is the six-sign half of the zodiac from Leo through Capricorn assigned to the Sun in the symmetrical traditional domicile scheme. It is paired with the Lunar Half, which occupies the opposite six-sign arc from Aquarius through Cancer.',
  'reviewed','Symmetrical domicile-framework concept independently supported in the reconciled corpus.'
FROM terms WHERE slug='solar-half';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'domicile-symmetry','Part of the domicile symmetry',
  'The division grows from the luminary domiciles, Leo for the Sun and Cancer for the Moon, with the remaining planetary domiciles distributed outward in mirrored pairs. The Solar Half names one side of that symmetrical arrangement rather than a separate zodiac.',10,'reviewed',NULL
FROM terms WHERE slug='solar-half';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Lunar Half is the six-sign half of the zodiac from Aquarius through Cancer assigned to the Moon in the symmetrical traditional domicile scheme. It forms the complementary half to the Solar Half extending from Leo through Capricorn.',
  'reviewed','Symmetrical domicile-framework concept independently supported in the reconciled corpus.'
FROM terms WHERE slug='lunar-half';

INSERT OR IGNORE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'domicile-symmetry','Part of the domicile symmetry',
  'The division belongs to the same mirrored domicile arrangement that places the luminaries at Leo and Cancer and assigns the remaining planets outward in paired signs. Lunar Half therefore describes structural organization within the domicile scheme.',10,'reviewed',NULL
FROM terms WHERE slug='lunar-half';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'complementary-half','The Solar and Lunar Halves form the two complementary six-sign arcs of the symmetrical domicile framework.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='solar-half' AND b.slug='lunar-half';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'complementary-half','The Lunar and Solar Halves form the two complementary six-sign arcs of the symmetrical domicile framework.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='lunar-half' AND b.slug='solar-half';

-- -----------------------------------------------------------------------------
-- FAMILY RELATIONS AND PAGE COMPOSITION
-- -----------------------------------------------------------------------------

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'distinct-from','Abū Maʿshar distinguishes elemental planetary nature from a separate operative planetary property.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-nature' AND b.slug='planetary-property';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'distinct-from','Planetary property is an operative category distinct from the planet’s hot/cold/wet/dry nature.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='planetary-property' AND b.slug='planetary-nature';

DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'planetary-nature','planetary-property','mixed-planet',
    'in-nature-of-benefics','in-nature-of-malefics',
    'planetary-masculinity','planetary-femininity','solar-half','lunar-half'
  )
);

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'condition-overview','Overview',10,'reviewed','Planetary-condition family composition.'
FROM terms WHERE slug IN (
  'planetary-nature','planetary-property','mixed-planet',
  'in-nature-of-benefics','in-nature-of-malefics',
  'planetary-masculinity','planetary-femininity','solar-half','lunar-half'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Planetary-condition family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='condition-overview'
  AND ps.term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'planetary-nature','planetary-property','mixed-planet',
      'in-nature-of-benefics','in-nature-of-malefics',
      'planetary-masculinity','planetary-femininity','solar-half','lunar-half'
    )
  )
  AND s.status IN ('reviewed','published');
