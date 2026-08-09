-- Encyclopedia conversion pass: primary qualities, elements, sign modality,
-- planetary gender/order and luminaries. These entries already have reviewed
-- historical evidence; this seed converts that evidence into reader-facing
-- reference articles and structured comparison tables.
--
-- Editorial rule: historical natural-philosophical vocabulary is explained as such.
-- It is not presented as modern physics, psychology, medicine or social-gender doctrine.

-- -----------------------------------------------------------------------------
-- PRIMARY QUALITIES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Traditional astrology inherits a four-quality framework from natural philosophy: hot, cold, moist and dry. These qualities describe attributed natures and combinations rather than literal modern measurements. Al-Biruni distinguishes heat and cold as active qualities and moisture and dryness as passive qualities.',
  'reviewed','Synthesis anchored to al-Biruni §347.'
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Two paired oppositions',
  'The four qualities form two oppositions. Hot and cold are opposed active principles; moist and dry are opposed passive principles. The four elements arise from combining one member of each pair, so an element is a qualitative mixture rather than a fifth independent quality.',10,'reviewed'
FROM terms WHERE slug='primary-quality';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'quality-system','The four primary qualities',
  'Al-Biruni’s structural scheme. The table records qualitative relations, not modern physical measurement.',
  '["Quality","Role in al-Biruni","Opposite","Elemental combinations"]',
  '[["Hot","Active","Cold","Fire · Air"],["Cold","Active","Hot","Earth · Water"],["Moist","Passive","Dry","Air · Water"],["Dry","Passive","Moist","Fire · Earth"]]',
  20,'reviewed','Compact natural-philosophy reference table.'
FROM terms WHERE slug='primary-quality';

WITH q(slug,intro,system_text,use_text) AS (
  VALUES
    ('hot',
     'Hot is one of the four primary qualities and the active principle opposed to cold. In the elemental scheme it combines with dryness to form fire and with moisture to form air.',
     'Heat belongs to the active pair of primary qualities. Its technical meaning is relational: it is opposed to cold and combines with either passive quality to produce two elemental natures.',
     'Astrological sources use heat when classifying signs, planets, elements and temperaments. The word therefore describes an attributed traditional nature; it should not be read as a literal temperature measurement or as a complete psychological interpretation.'),
    ('cold',
     'Cold is one of the four primary qualities and the active principle opposed to hot. It combines with dryness to form earth and with moisture to form water.',
     'Cold belongs to the active pair of primary qualities. Its place in the system is defined both by opposition to heat and by the two elemental mixtures produced when it joins dryness or moisture.',
     'Traditional texts use coldness in classifications of planets, signs, elements and temperaments. These are historical qualitative attributions rather than literal measurements of physical temperature.'),
    ('moist',
     'Moist, also translated as wet, is one of the four primary qualities and the passive principle opposed to dry. It combines with heat as air and with cold as water.',
     'Moisture belongs to the passive pair of primary qualities. Together with dryness it supplies the second axis of the elemental system, combining with either heat or cold.',
     'Astrological sources use moisture in planetary, zodiacal, elemental and temperamental classifications. Translation may alternate between moist and wet; the underlying technical relation remains the same.'),
    ('dry',
     'Dry is one of the four primary qualities and the passive principle opposed to moist. It combines with heat as fire and with cold as earth.',
     'Dryness belongs to the passive pair of primary qualities. Its technical role is defined by opposition to moisture and by its combinations with the two active qualities.',
     'Traditional sources use dryness when describing elemental, zodiacal, planetary and temperamental natures. The category is historical and relational rather than a literal modern physical measurement.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,q.intro,'reviewed','Public synthesis from reviewed quality evidence.'
FROM q JOIN terms t ON t.slug=q.slug;

WITH q(slug,system_text,use_text) AS (
  VALUES
    ('hot','Heat belongs to the active pair of primary qualities. Its technical meaning is relational: it is opposed to cold and combines with either passive quality to produce two elemental natures.','Astrological sources use heat when classifying signs, planets, elements and temperaments. The word therefore describes an attributed traditional nature; it should not be read as a literal temperature measurement or as a complete psychological interpretation.'),
    ('cold','Cold belongs to the active pair of primary qualities. Its place in the system is defined both by opposition to heat and by the two elemental mixtures produced when it joins dryness or moisture.','Traditional texts use coldness in classifications of planets, signs, elements and temperaments. These are historical qualitative attributions rather than literal measurements of physical temperature.'),
    ('moist','Moisture belongs to the passive pair of primary qualities. Together with dryness it supplies the second axis of the elemental system, combining with either heat or cold.','Astrological sources use moisture in planetary, zodiacal, elemental and temperamental classifications. Translation may alternate between moist and wet; the underlying technical relation remains the same.'),
    ('dry','Dryness belongs to the passive pair of primary qualities. Its technical role is defined by opposition to moisture and by its combinations with the two active qualities.','Traditional sources use dryness when describing elemental, zodiacal, planetary and temperamental natures. The category is historical and relational rather than a literal modern physical measurement.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'system','Place in the quality system',q.system_text,10,'reviewed'
FROM q JOIN terms t ON t.slug=q.slug;

WITH q(slug,use_text) AS (
  VALUES
    ('hot','Astrological sources use heat when classifying signs, planets, elements and temperaments. The word therefore describes an attributed traditional nature; it should not be read as a literal temperature measurement or as a complete psychological interpretation.'),
    ('cold','Traditional texts use coldness in classifications of planets, signs, elements and temperaments. These are historical qualitative attributions rather than literal measurements of physical temperature.'),
    ('moist','Astrological sources use moisture in planetary, zodiacal, elemental and temperamental classifications. Translation may alternate between moist and wet; the underlying technical relation remains the same.'),
    ('dry','Traditional sources use dryness when describing elemental, zodiacal, planetary and temperamental natures. The category is historical and relational rather than a literal modern physical measurement.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'astrological-use','Astrological use',q.use_text,20,'reviewed'
FROM q JOIN terms t ON t.slug=q.slug;

-- -----------------------------------------------------------------------------
-- FOUR ELEMENTS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The four elements or elemental natures are fire, air, water and earth. In the traditional qualitative scheme each element is defined by one active and one passive primary quality, and the same fourfold structure underlies the elemental triplicities of the zodiac.',
  'reviewed','Synthesis from reviewed al-Biruni and Abu Mashar evidence.'
FROM terms WHERE slug='four-elements';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'element-system','The four elemental natures',
  'Qualitative mixtures and their corresponding zodiacal triplicities.',
  '["Element","Primary qualities","Zodiacal triplicity"]',
  '[["Fire","Hot · Dry","Aries · Leo · Sagittarius"],["Air","Hot · Moist","Gemini · Libra · Aquarius"],["Water","Cold · Moist","Cancer · Scorpio · Pisces"],["Earth","Cold · Dry","Taurus · Virgo · Capricorn"]]',
  10,'reviewed','Reference structure, not a modern material-science table.'
FROM terms WHERE slug='four-elements';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'astrological-role','From natural philosophy to zodiacal triplicity',
  'Traditional astrology applies the elemental scheme to zodiacal signs and planetary or temperamental descriptions. The elemental label names a shared qualitative nature; it does not mean that a sign or planet is literally made of the corresponding physical substance.',20,'reviewed'
FROM terms WHERE slug='four-elements';

WITH e(slug,intro,qualities,triplicity) AS (
  VALUES
    ('element-fire','Fire is the hot-and-dry elemental nature in the traditional four-element scheme. Zodiacally it supplies the common nature of Aries, Leo and Sagittarius.','Fire combines heat with dryness. This distinguishes it from air, which shares heat but is moist, and from earth, which shares dryness but is cold.','Aries, Leo and Sagittarius form the fiery triplicity. Their membership is a structural elemental classification and does not by itself constitute a complete interpretation of any individual sign.'),
    ('element-air','Air is the hot-and-moist elemental nature in the traditional four-element scheme. Zodiacally it supplies the common nature of Gemini, Libra and Aquarius.','Air combines heat with moisture. It therefore shares heat with fire and moisture with water while remaining a distinct qualitative mixture.','Gemini, Libra and Aquarius form the airy triplicity. The classification expresses their common elemental nature rather than a modern personality type.'),
    ('element-water','Water is the cold-and-moist elemental nature in the traditional four-element scheme. Zodiacally it supplies the common nature of Cancer, Scorpio and Pisces.','Water combines cold with moisture. It shares coldness with earth and moisture with air while remaining its own elemental mixture.','Cancer, Scorpio and Pisces form the watery triplicity. Historical texts can add further classifications to these signs independently of their elemental membership.'),
    ('element-earth','Earth is the cold-and-dry elemental nature in the traditional four-element scheme. Zodiacally it supplies the common nature of Taurus, Virgo and Capricorn.','Earth combines cold with dryness. It shares coldness with water and dryness with fire while remaining a distinct elemental nature.','Taurus, Virgo and Capricorn form the earthy triplicity. Element is one classification among several and should not be treated as a complete sign delineation.')
)
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,e.intro,'reviewed','Element article synthesized from reviewed historical evidence.'
FROM e JOIN terms t ON t.slug=e.slug;

WITH e(slug,qualities,triplicity) AS (
  VALUES
    ('element-fire','Fire combines heat with dryness. This distinguishes it from air, which shares heat but is moist, and from earth, which shares dryness but is cold.','Aries, Leo and Sagittarius form the fiery triplicity. Their membership is a structural elemental classification and does not by itself constitute a complete interpretation of any individual sign.'),
    ('element-air','Air combines heat with moisture. It therefore shares heat with fire and moisture with water while remaining a distinct qualitative mixture.','Gemini, Libra and Aquarius form the airy triplicity. The classification expresses their common elemental nature rather than a modern personality type.'),
    ('element-water','Water combines cold with moisture. It shares coldness with earth and moisture with air while remaining its own elemental mixture.','Cancer, Scorpio and Pisces form the watery triplicity. Historical texts can add further classifications to these signs independently of their elemental membership.'),
    ('element-earth','Earth combines cold with dryness. It shares coldness with water and dryness with fire while remaining a distinct elemental nature.','Taurus, Virgo and Capricorn form the earthy triplicity. Element is one classification among several and should not be treated as a complete sign delineation.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'qualities','Qualitative composition',e.qualities,10,'reviewed'
FROM e JOIN terms t ON t.slug=e.slug;

WITH e(slug,triplicity) AS (
  VALUES
    ('element-fire','Aries, Leo and Sagittarius form the fiery triplicity. Their membership is a structural elemental classification and does not by itself constitute a complete interpretation of any individual sign.'),
    ('element-air','Gemini, Libra and Aquarius form the airy triplicity. The classification expresses their common elemental nature rather than a modern personality type.'),
    ('element-water','Cancer, Scorpio and Pisces form the watery triplicity. Historical texts can add further classifications to these signs independently of their elemental membership.'),
    ('element-earth','Taurus, Virgo and Capricorn form the earthy triplicity. Element is one classification among several and should not be treated as a complete sign delineation.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT t.id,'triplicity','Zodiacal triplicity',e.triplicity,20,'reviewed'
FROM e JOIN terms t ON t.slug=e.slug;

-- Temperament already has a developed article; add only the reference table.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'temperament-mixtures','The four principal temperamental mixtures',
  'Qualitative and elemental correspondences only. Later character descriptions are not treated as definitions of the temperaments.',
  '["Temperament","Primary qualities","Elemental correspondence"]',
  '[["Sanguine","Hot · Moist","Air"],["Choleric","Hot · Dry","Fire"],["Melancholic","Cold · Dry","Earth"],["Phlegmatic","Cold · Moist","Water"]]',
  15,'reviewed','Reference table added without replacing the existing temperament article.'
FROM terms WHERE slug='temperament';

-- -----------------------------------------------------------------------------
-- SIGN MODALITY / QUADRUPLICITY
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Sign modality is the threefold seasonal classification of the zodiac into tropical or movable, fixed, and bicorporeal or common signs. Each class contains one sign from each seasonal quarter, producing three groups of four signs.',
  'reviewed','Anchored to al-Biruni §380 and reviewed zodiac framework.'
FROM terms WHERE slug='sign-modality';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'modality-classes','The three modality classes',
  'Historical and later English labels are shown together without replacing the source terminology.',
  '["Class","Seasonal position","Signs","Common later label"]',
  '[["Tropical / Movable","Beginning","Aries · Cancer · Libra · Capricorn","Cardinal"],["Fixed","Middle","Taurus · Leo · Scorpio · Aquarius","Fixed"],["Bicorporeal / Common","Ending","Gemini · Virgo · Sagittarius · Pisces","Mutable"]]',
  10,'reviewed','Seasonal structural table.'
FROM terms WHERE slug='sign-modality';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'independent-axis','An independent sign classification',
  'Modality does not replace element, polarity, diurnal/nocturnal class, voice, fertility or ascensional classification. A sign belongs simultaneously to several taxonomies, so “movable,” “fiery,” “masculine” and “long-rising,” for example, describe different dimensions of the same sign.',20,'reviewed'
FROM terms WHERE slug='sign-modality';

-- -----------------------------------------------------------------------------
-- PLANETARY GENDER
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Planetary gender is a historical technical classification of planets as masculine, feminine or variable by association. It is separate from the masculine/feminine classification of zodiacal signs and should not be mapped directly onto modern social-gender categories.',
  'reviewed','Anchored to al-Biruni §385.'
FROM terms WHERE slug='planetary-gender';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-gender-classes','Planetary gender classes',
  'Al-Biruni’s classification. Mercury is intentionally shown separately because association can alter its class.',
  '["Class","Planets","Qualification"]',
  '[["Masculine","Saturn · Jupiter · Mars · Sun","Stable class in al-Biruni’s account"],["Feminine","Venus · Moon","Stable class in al-Biruni’s account"],["Variable","Mercury","Changes through association; masculine when considered alone in this source"]]',
  10,'reviewed','Historical classification table.'
FROM terms WHERE slug='planetary-gender';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct-from-sign-gender','Planetary versus zodiacal gender',
  'A masculine planet is not the same concept as a masculine sign. Planetary gender classifies the planets themselves; sign polarity classifies alternating zodiacal signs. A planet can therefore occupy a sign whose gender classification differs from its own.',20,'reviewed'
FROM terms WHERE slug='planetary-gender';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A masculine planet belongs to the historical masculine planetary class. In al-Biruni’s account Saturn, Jupiter, Mars and the Sun belong to this class, while Mercury can participate conditionally rather than being fixed in it.',
  'reviewed','Historical classification only.'
FROM terms WHERE slug='masculine-planet';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Stable members and Mercury',
  'Saturn, Jupiter, Mars and the Sun form the stable masculine group in al-Biruni’s classification. Mercury is exceptional because its gender can change through association, so it should not be silently added to the stable list.',10,'reviewed'
FROM terms WHERE slug='masculine-planet';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A feminine planet belongs to the historical feminine planetary class. Al-Biruni places Venus and the Moon in this class, while Mercury can become feminine through association.',
  'reviewed','Historical classification only.'
FROM terms WHERE slug='feminine-planet';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Stable members and Mercury',
  'Venus and the Moon form the stable feminine group in al-Biruni’s classification. Mercury remains conditional and can acquire a feminine classification through association rather than belonging permanently to the class.',10,'reviewed'
FROM terms WHERE slug='feminine-planet';

-- -----------------------------------------------------------------------------
-- SUPERIOR / INFERIOR PLANETS AND LUMINARIES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The superior planets are Saturn, Jupiter and Mars. In the traditional geocentric ordering they lie beyond the Sun and, unlike Venus and Mercury, can reach opposition to it during their synodic cycles. “Superior” describes astronomical order, not greater dignity or moral value.',
  'reviewed','Anchored to al-Biruni §152.'
FROM terms WHERE slug='superior-planet';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Members and synodic distinction',
  'Saturn, Jupiter and Mars form the superior group. Their solar elongation is not confined to the limited range of Venus and Mercury, and their retrograde cycles can center on opposition to the Sun.',10,'reviewed'
FROM terms WHERE slug='superior-planet';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The ordinary inferior planets are Venus and Mercury. In the traditional planetary order they lie inside the Sun and remain within limited elongation from it. Al-Biruni discusses the Moon as lower than the Sun but explicitly treats it separately from this ordinary two-planet class.',
  'reviewed','Anchored to al-Biruni §152.'
FROM terms WHERE slug='inferior-planet';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','Venus and Mercury',
  'Venus and Mercury form the ordinary inferior-planet class. Their proximity to the Sun is built into their astronomical cycle, which is why oriental/occidental phase, visibility and stations require somewhat different handling from the three superior planets.',10,'reviewed'
FROM terms WHERE slug='inferior-planet';

-- A compact comparison belongs on both class pages.
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'planetary-order','Superior and inferior planets',
  'Traditional solar-order distinction. The luminaries are not simply folded into the two ordinary planetary classes.',
  '["Class","Members","Solar-cycle distinction"]',
  '[["Superior","Saturn · Jupiter · Mars","Can reach opposition to the Sun"],["Inferior","Venus · Mercury","Remain within limited elongation from the Sun"],["Luminaries","Sun · Moon","Separate paired class"]]',
  20,'reviewed','Same reference table appears on both superior and inferior class pages.'
FROM terms WHERE slug IN ('superior-planet','inferior-planet');

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Luminary is the traditional collective name for the Sun and Moon, the two lights. They belong to the seven traditional planets in astrological usage but also form a distinct pair with special roles in sect, visibility, phases, lots and many timing doctrines.',
  'reviewed','Anchored to al-Biruni §513 and existing reviewed luminary relations.'
FROM terms WHERE slug='luminary';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'luminaries','The two luminaries',
  'Their paired status is fundamental, but their individual properties remain distinct.',
  '["Luminary","Sect","Domicile","Exaltation"]',
  '[["Sun","Diurnal","Leo","Aries"],["Moon","Nocturnal","Cancer","Taurus"]]',
  10,'reviewed','Compact cross-reference to already reviewed sect and dignity doctrine.'
FROM terms WHERE slug='luminary';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'special-role','Why the luminaries form a separate pair',
  'The Sun determines whether a chart is diurnal or nocturnal by its position relative to the horizon, while the Moon is the principal nocturnal light and the fastest body in the traditional seven-planet scheme. Their relation to one another also structures lunar phase and the two principal luminary lots, Fortune and Absence/Spirit-related formula streams.',20,'reviewed'
FROM terms WHERE slug='luminary';
