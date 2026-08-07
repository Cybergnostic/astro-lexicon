-- Sequential extraction of al-Biruni, The Book of Instruction in the Elements of the Art of Astrology.
-- Astrology §§347-460: signs, aspects, planetary nature, planetary periods, dignities and sign subdivisions.
-- Only definition-level or substantively explanatory evidence is retained; mere mentions/catalogue repetition are skipped.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('inconjunct', 'Inconjunct Signs', 'Signs which neither conjoin nor form one of the recognized sextile, quartile, trine or opposition relationships with each other.', 'aspect doctrine', 'draft', 'Al-Biruni explicitly treats the 2nd, 6th, 8th and 12th signs from a sign as outside its seven aspecting signs.'),
  ('planetary-orb', 'Planetary Orb', 'A planet-specific distance around a planet within which its influence is treated as operative in application to conjunction or aspect.', 'orb doctrine', 'draft', 'Al-Biruni §436 gives unequal orb values by planet. Preserve source-specific numerical systems in interpretations rather than in the canonical definition.');

INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '242', '248', '373-380', 'Aspects, inconjunct signs, non-aspect sign relations, triplicities and seasonal modalities', NULL,
       'Definition-level treatment of the four principal aspects, inconjunct signs, equipollence/course relations, triplicities, and tropical/fixed/bicorporeal signs.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines the ordinary zodiacal aspects by equal-degree separation: sextile at 60 degrees, quartile at 90 degrees, trine at 120 degrees and opposition at 180 degrees. Together with conjunction these form the recognized configurations; the remaining four sign relationships are inconjunct.',
       '§§373-375', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='aspect' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For a given sign, the second, sixth, eighth and twelfth signs are inconjunct because they fall outside conjunction, sextile, quartile, trine and opposition. Al-Biruni contrasts this lack of aspect with other non-aspect relations that can nevertheless create agreement between signs.',
       '§§373-377', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='inconjunct' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni distinguishes two non-aspect correspondences: signs equidistant from an equinoctial point have complementary day and night lengths and equal ascensions, while signs equidistant from a solstice share a parallel and equal day and night lengths. He notes that terminology for these relations varies between books and discusses Abu Mashar''s natural sextiles and natural opposites as applications of them.',
       '§377', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natural-sextile' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines a triplicity as three signs sharing the same pair of elemental qualities and therefore the same elemental nature: fiery, earthy, airy or watery. Their geometrical positions form a trine relationship in the zodiac.',
       '§379', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Within each seasonal group of three signs, the first is tropical because it marks the turning into a new season, the second fixed because the season is established there, and the third bicorporeal. Al-Biruni therefore grounds the three modalities in the structure of the seasonal quadrants.',
       '§380', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='tropical-sign' AND w.slug='al-biruni-tafhim';

INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '248', '257', '381-401', 'Planetary natures, beneficence/maleficence, sex and sect', NULL,
       'Substantial doctrinal discussion. Catalogues of colours, smells and similar correspondences are not promoted as separate terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni assigns each planet a characteristic mixture of hot, cold, wet and dry qualities but immediately emphasizes that planetary indications change with sign, other planets, fixed stars, solar phase and distance from the Earth. Mercury is especially variable through association, and the Moon changes with its phase relative to the Sun.',
       '§§381 and 387', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-nature' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni explains benefic and malefic classification through moderation or extremity of a planet''s elementary qualities: planets whose two qualities are extreme are malefic, those whose qualities are moderate benefic, while unequal mixtures can become benefic or malefic according to condition. He identifies Saturn and Mars as the principal malefics and Jupiter and Venus as the principal benefics.',
       '§382', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='benefic' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Saturn, Jupiter and the Sun are diurnal; Mars, Venus and the Moon nocturnal; Mercury changes according to sign or association. Al-Biruni adds that a planet is strengthened when operating in conformity with its own day or night class.',
       '§386', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sect' AND w.slug='al-biruni-tafhim';

INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '256', '272', '394-439', 'Planetary years, firdaria, planetary orbs and period association', NULL,
       'Only the technical period/orb doctrines are retained; long catalogues of planetary correspondences are skipped.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni describes firdaria as successive periods of life ruled by planetary chronocrators. A diurnal nativity begins with the Sun and a nocturnal nativity with the Moon; each major period is then divided into seven equal subperiods in which the period ruler is successively joined by the other planets.',
       '§395 and §§438-439', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fardar' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni records four classes of planetary years: least, mean, great and greatest. He says the greatest are chiefly used for large cycles, while contemporary astrologers use the first three in longevity judgments and may interpret the resulting units flexibly as years, months, weeks, days or hours rather than literally as years.',
       '§394 and §§436-439', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-years' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'An orb is the planet-specific distance within which a planet''s influence can reach another in an applying conjunction or aspect. Al-Biruni gives different orb sizes for the seven planets rather than one universal allowance.',
       '§436', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-orb' AND w.slug='al-biruni-tafhim';

INSERT INTO source_passages (edition_id, page_start, page_end, section, locator_text, quote, internal_notes)
SELECT e.id, '273', '288', '440-459', 'Domiciles, exaltations, triplicity rulers, faces/decanates, terms, ninths, twelfths and degree classes', NULL,
       'Definition-level and disagreement-rich dignity/subdivision material. Mere tables are not duplicated as separate concepts.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni derives the domicile scheme symmetrically around the luminary houses: Leo belongs to the Sun, Cancer to the Moon, and the remaining planets receive paired signs outward in planetary order. He separately records a preferred domicile for each non-luminary planet.',
       '§§440-441', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='domicile' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni defines detriment as the sign opposite a planet''s domicile. He notes that the Hindus recognize domiciles but not this technical category under the same concept.',
       '§442', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='detriment' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni records exaltation as a sign-level dignity traditionally associated with a particular degree but explicitly reports disagreement over whether its force belongs to the exact degree, a range around it, the interval from the beginning of the sign to that degree, or the entire sign. The opposite position is the fall or dejection.',
       '§§443-444', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='exaltation' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The Hindu darijan divides every sign into three ten-degree parts but assigns their rulers differently from the ordinary faces: the sign lord rules the first, the lord of the fifth sign the second, and the lord of the ninth sign the third.',
       '§451', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='darijan' AND w.slug='al-biruni-tafhim';

-- §453 terms already has a substantive al-Biruni interpretation in the core seed; do not duplicate it.

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni describes the Hindu ninth as one ninth of a sign, measuring 3°20′. The rulers are the rulers of the corresponding signs, and specific ninths in tropical, fixed and bicorporeal signs receive a special Hindu designation. He explicitly prefers the received Hindu order over a locally altered version.',
       '§455', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ninth-nawbahr' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Each sign can be divided into twelve equal parts of 2°30′. The first twelfth is ruled by the sign''s own ruler and the remaining twelfths by the rulers of successive signs. Al-Biruni notes agreement between Greek and Hindu practice on this procedure.',
       '§456', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dodecatemorion' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni treats bright, luminous, dusky, dark and empty degrees as transmitted catalogue classes rather than a coherent derived system. He explicitly says no two books agree on the scheme, so the classifications should be preserved as unstable historical data rather than universal degree qualities.',
       '§458', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='bright-degree' AND w.slug='al-biruni-tafhim';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Al-Biruni describes planetary wells or pits as specified degrees in which a planet is weakened so that its capacity to produce either fortunate or unfortunate effects is reduced. He presents the lists as transmitted degree doctrine rather than a universal geometrical rule.',
       '§459', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-well' AND w.slug='al-biruni-tafhim';
