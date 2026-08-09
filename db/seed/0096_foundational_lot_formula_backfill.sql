-- Formula-coverage backfill for foundational lots with direct Abū Maʿshar evidence.
--
-- Mature calculated-lot articles should expose an explicit section_key='formula' so
-- the public page and the formula-coverage audit use one predictable convention.
-- This does not imply that a formula is universal across all historical traditions.

-- -----------------------------------------------------------------------------
-- LOT OF FORTUNE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
       'Abū Maʿshar: day = Ascendant + Moon - Sun; night = Ascendant + Sun - Moon. In words, measure from the Sun to the Moon by day and from the Moon to the Sun by night, then project that arc from the Ascendant.',
       15,'reviewed',
       'Explicit arithmetic notation added for formula coverage. Other authors or transmitted traditions may preserve variants and should be documented separately.'
FROM terms WHERE slug='lot-of-fortune';

-- -----------------------------------------------------------------------------
-- LOT OF ABSENCE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Absence is Abū Maʿshar’s paired solar counterpart to the Lot of Fortune. It reverses Fortune’s luminary arc and is also called the Lot of the Sun in his discussion, although he records historical disagreement over which luminary names belong to the two lots.',
       'reviewed',
       'Public synthesis from Great Introduction VIII.3.10-3.11. Keep source naming variants visible rather than assuming a single universal modern label.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of the Sun','English','source-name',
       'Abū Maʿshar calls the Lot of Absence the Lot of the Sun in VIII.3.10, while also noting that some astrologers reverse the luminary names.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
       'Abū Maʿshar: day = Ascendant + Sun - Moon; night = Ascendant + Moon - Sun. This is the reverse of his Lot of Fortune formula.',
       10,'reviewed',
       'Directly supported by Great Introduction VIII.3.10.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'name-variants','Name variants',
       'Abū Maʿshar presents this as the Lot of Absence and also as the Lot of the Sun. He explicitly notes that some astrologers swap the luminary names of Fortune and Absence, so “Lot of the Sun” should be treated as source-sensitive terminology rather than a universally unambiguous synonym.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-of-absence';

-- -----------------------------------------------------------------------------
-- LOT OF THE HAYLAJ
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles
  (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of the Haylāǧ is one of Abū Maʿshar’s additional lots outside the seven planetary lots and the lots of the twelve places. It is calculated from the prenatal syzygy and the Moon and is explicitly distinct from the haylāǧ itself.',
       'reviewed',
       'Historical definition only. Do not turn this article into a lifespan-prediction procedure.'
FROM terms WHERE slug='lot-of-the-haylaj';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
       'Abū Maʿshar: if the nativity is conjunctional, use Ascendant + Moon - prenatal conjunction; if it is oppositional, use Ascendant + Moon - prenatal opposition. The relevant prenatal syzygy is the conjunction or opposition preceding the birth.',
       10,'reviewed',
       'Great Introduction VIII.5.2 and formula summary VIII.6.16. Formula stated descriptively without importing later lifespan workflow.'
FROM terms WHERE slug='lot-of-the-haylaj';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Distinct from the haylāǧ',
       'Despite the name, the Lot of the Haylāǧ is a calculated lot and should not be identified with the haylāǧ/apheta itself. Abū Maʿshar treats the lot as a separate movable factor.',
       20,'reviewed',NULL
FROM terms WHERE slug='lot-of-the-haylaj';
