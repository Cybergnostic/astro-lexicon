-- Reader usefulness pass 03: remove residual lexicon/project voice from otherwise-good entries.
--
-- These are deliberately tiny public-prose edits. They preserve doctrine, distinctions,
-- source attribution, formulas and historical cautions while removing sentences that make
-- the reader-facing article sound like a report about how the encyclopedia stores data.

PRAGMA foreign_keys = ON;

-- Astrology
UPDATE term_article_sections
SET body = 'A central concept in Abū Maʿshar’s account is indication: a celestial condition can signify or point toward a terrestrial condition without being identical to the thing signified. His broader natural philosophy also attributes causal powers to celestial motions, but indication and causal action remain distinct relations. Astrological judgment therefore depends on what celestial conditions indicate, not merely on a claim that every indication is the same thing as a physical cause.'
WHERE term_id=(SELECT id FROM terms WHERE slug='astrology') AND section_key='indication-and-power';

-- Beholding Signs / Signs of Equal Power
UPDATE term_article_sections
SET body = 'Later antiscion terminology uses a different sign-pair table. The shared language of solar symmetry makes the concepts easy to confuse, but Ptolemy’s beholding or equal-power relation is a distinct historical sign relation and should not be collapsed into antiscia.'
WHERE term_id=(SELECT id FROM terms WHERE slug='beholding-signs') AND section_key='not-antiscion';

-- Bicorporeal / Common Sign
UPDATE term_article_sections
SET body = 'Bicorporeal and common are common historical labels; mutable is the later conventional term. They refer to the same fourfold modality class rather than to three different sign groups.'
WHERE term_id=(SELECT id FROM terms WHERE slug='bicorporeal-sign') AND section_key='names';

-- Cazimi
UPDATE term_article_sections
SET body = 'Lilly defines cazimi as being within 17 arcminutes of the Sun, forward or backward. This is Lilly’s stated criterion. Other historical authorities can use slightly different limits, so the numerical threshold should always be tied to the authority being followed.'
WHERE term_id=(SELECT id FROM terms WHERE slug='cazimi') AND section_key='lilly-threshold';

-- Essential Dignity
UPDATE term_article_sections
SET body = 'Essential dignity is not only domicile and exaltation. In Lilly’s Ptolemaic table, every zodiacal degree can be read through several simultaneous rulers: sign or domicile, exaltation where one exists, sect-dependent triplicity, term or bound, and face or decan. Detriment and fall describe corresponding essential debilities. These layers should be kept distinct because they answer different questions about a planet’s standing in the zodiac.'
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity') AND section_key='reference-system';

UPDATE term_article_sections
SET body = 'The unequal planetary divisions called terms or bounds were transmitted in competing tables. The Egyptian table transmitted by Ptolemy and Lilly’s later table presented as Ptolemaic should therefore be identified separately. A degree range is only meaningful when the reader knows which named scheme supplies it.'
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity') AND section_key='term-schemes';

UPDATE term_article_sections
SET body = 'Dorothean and Lilly triplicity rulership should not be treated as one identical scheme. The Dorothean system uses day, night, and participating rulers for each elemental triplicity; Lilly’s table uses a different two-ruler arrangement and assigns Mars to the watery triplicity by both day and night. Any triplicity table should therefore identify the scheme it follows.'
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity') AND section_key='triplicity-scheme-variation';

UPDATE term_article_sections
SET body = 'The five dignity classes are widely shared, but the detailed rulers and weighting systems are not perfectly uniform across every historical author. Terms and triplicity rulers in particular can vary by tradition or table. Historical variants should therefore be identified explicitly rather than combined into a single supposedly universal table.'
WHERE term_id=(SELECT id FROM terms WHERE slug='essential-dignity') AND section_key='tables-and-variants';

-- Exaltation
UPDATE term_article_sections
SET body = 'Historical traditions often preserve both a sign of exaltation and a particular exaltation degree. The exact role given to that degree can vary by author and technique, so sign-wide exaltation and exact-degree doctrines should not automatically be treated as identical rules.'
WHERE term_id=(SELECT id FROM terms WHERE slug='exaltation') AND section_key='degree';

-- Hidden / Subtle Indication
UPDATE term_article_sections
SET body = 'Hidden indication should not be confused with a general power to uncover any concealed fact. The distinction concerns the limits of astrological knowability itself. This is also compatible with al-Bīrūnī’s separate criticism of attempts to infer unspoken thoughts from a chart.'
WHERE term_id=(SELECT id FROM terms WHERE slug='hidden-indication') AND section_key='not-secret-reading';

-- Hyleg
UPDATE term_article_sections
SET body = 'The eligible places, order of preference and treatment of sect differ across authors. Hyleg is therefore best understood as a common technical role within longevity doctrine, while the actual selection criteria must be taken from the author or method being used rather than synthesized into one universal algorithm.'
WHERE term_id=(SELECT id FROM terms WHERE slug='hyleg') AND section_key='variants';

-- Katarchic Astrology
UPDATE term_article_sections
SET body = 'The narrowest use of katarchic can resemble inceptional or electional astrology, but modern scholarship can use it more broadly for elections, event interpretation, interrogations and decumbitures. Electional astrology, questions, event or inception charts, and decumbiture remain distinct practices even when a modern scholar groups them under the broader heading katarchic.'
WHERE term_id=(SELECT id FROM terms WHERE slug='katarchic-astrology') AND section_key='scope';

UPDATE term_article_sections
SET body = 'A modern umbrella term should not be retrojected as though every ancient or medieval astrologer used the same category. Historical sources should instead be read according to the way they themselves organize elections, questions, beginnings and related practices; “katarchic” is a later scholarly cross-reference across those practices.'
WHERE term_id=(SELECT id FROM terms WHERE slug='katarchic-astrology') AND section_key='historical-caution';

-- Lot of Mercury — Means / Lack of Means
UPDATE term_articles
SET intro = 'Abū Maʿshar’s Mercury lot has unusually ambivalent wording: Mercury is called possessor of means while the lot is also described as one of poverty and lack of means. Both expressions belong to the transmitted account, so the lot should not be reduced to a single modern keyword.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-mercury-means');

-- Lots of the Seven Planets
UPDATE term_article_sections
SET body = 'Planetary lots in different authors can carry similar names or topics without sharing the same formula or historical identity. Abū Maʿshar’s individual planetary lots must therefore be distinguished by formula and transmission—for example, his Venus lot is not automatically identical with every Lot of Eros or love lot found elsewhere. Similar subject matter alone does not establish that two lots are the same.'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-lots') AND section_key='historical-identity';

-- Lunar Mansions
UPDATE term_article_sections
SET body = 'The mansion system follows the Moon through twenty-eight successive stations. It is therefore a lunar positional framework rather than another twelve-sign zodiac. Historical traditions can differ in boundaries, names and applications, so any detailed mansion table should identify the tradition or authority it follows.'
WHERE term_id=(SELECT id FROM terms WHERE slug='lunar-mansions') AND section_key='twenty-eight';

-- Peregrine
UPDATE term_article_sections
SET body = 'A planet can be specifically debilitated by fall or detriment, while peregrine describes lack of essential dignity. Historical authors can weigh these conditions differently, so they should remain technically distinct rather than being collapsed into one generic category of weakness.'
WHERE term_id=(SELECT id FROM terms WHERE slug='peregrine') AND section_key='not-same-as-debility';

-- Planetary Well / Puteal Degree
UPDATE term_articles
SET intro = 'A Planetary Well, also called a Puteal or Deep Degree in the Bonatti tradition, is a specified zodiacal degree in which a planet or significator is treated as weakened or impeded. The doctrine belongs to inherited degree catalogues rather than to a single geometrical calculation. Abū Maʿshar and al-Bīrūnī both preserve transmitted lists, and the exact degrees can differ between authorities.'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-well');

UPDATE term_article_sections
SET body = 'The sources preserve catalogues of well or pit degrees received from earlier authorities. Abū Maʿshar explicitly records disagreement and a Persian-Egyptian consensus list; al-Bīrūnī likewise presents the wells as specified degrees rather than the output of a universal formula. Exact degree lists should therefore always be identified with the authority that transmits them.'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-well') AND section_key='transmitted-lists';

-- Sign (Zodiacal Sign)
UPDATE term_article_sections
SET body = 'A sign is not defined by one keyword. Element, modality, masculine or feminine class, ascensional class, voice or form classifications, and planetary dignities answer different technical questions. One sign can participate in several of these systems at once without the classifications becoming interchangeable.'
WHERE term_id=(SELECT id FROM terms WHERE slug='zodiac-sign') AND section_key='multiple-classes';

-- Triplicity Division of Life
UPDATE term_article_sections
SET body = 'Bonatti applies the same three-ruler logic to several topics. In substance, the rulers describe prosperity across successive periods; in the Fifth House they time children in youth, middle age and old age; in the Ninth they distinguish periods for religion or long journeys; and in the Tenth they divide honors and prosperity across life. He also uses serial triplicity rulers for siblings and for the beginning, middle and end of the mother’s life. These examples show a reusable timing structure rather than one single topic-specific technique.'
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division') AND section_key='topical-applications';

UPDATE term_article_sections
SET body = 'The doctrine establishes an ordered division into earlier, middle and later portions, but it should not be converted automatically into one fixed age table. The reviewed historical applications use relative life phases and topic-specific divisions. Exact numerical boundaries belong only where a particular source actually supplies them.'
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division') AND section_key='not-fixed-ages';
