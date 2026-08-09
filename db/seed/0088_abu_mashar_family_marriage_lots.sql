-- Public-source corroboration pass: family and marriage lots in Abū Maʿshar Part VIII.
--
-- Upgrade curriculum-discovered entries where the Great Introduction supplies direct
-- formula evidence, and split generic marriage labels into the distinct historical
-- identities actually transmitted by Abū Maʿshar.

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGES
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'857','881','Part VIII','Chapter 4','4.11-4.22',
       'Part VIII, Chapter 4, §§4.11-4.22: lots of brothers, number of brothers, fathers, mothers and children, including transmitted formula variants',
       NULL,
       'Family-lot evidence recovered during post-curriculum corroboration. Public summaries are original paraphrases.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.11-4.22'
  );

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'875','881','Part VIII','Chapter 4','4.31-4.43',
       'Part VIII, Chapter 4, §§4.31-4.43: marriage lots of men and women according to Hermes and Wālīs, general marriage lot, and time-of-marriage lot',
       NULL,
       'Marriage-lot evidence recovered during post-curriculum corroboration. Public summaries are original paraphrases.'
FROM editions e JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.31-4.43'
  );

-- -----------------------------------------------------------------------------
-- UPGRADE EXISTING FAMILY LOTS
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of Brothers',
  short_definition='A traditional lot for brothers and siblings. Abū Maʿshar’s preferred Hermetic formula measures from Saturn to Jupiter in both day and night charts and projects from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.11. He also records a Wālīs variant from Mercury to Jupiter but prefers the Saturn-to-Jupiter formula.'
WHERE slug='lot-of-siblings';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of Brothers','English','source-name','Direct English rendering in Abū Maʿshar Part VIII.' FROM terms WHERE slug='lot-of-siblings';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of Brothers','English','name-variant','Part/Lot wording variant.' FROM terms WHERE slug='lot-of-siblings';

UPDATE terms SET
  short_definition='A distinct traditional lot for the number of brothers or siblings. Abū Maʿshar gives the same day-and-night extraction from Mercury to Saturn, projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar Part VIII.6.6 and catalogued among the third-place lots.'
WHERE slug='lot-of-number-of-siblings';

UPDATE terms SET
  short_definition='A traditional lot for the father. Abū Maʿshar gives a sect-dependent Sun/Saturn formula and substitutes Jupiter for Saturn when Saturn is under the rays.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.14. A Mars/Jupiter fallback is also reported from some authorities but rejected in favor of the Hermetic Jupiter substitution.'
WHERE slug='lot-of-father';

UPDATE terms SET
  short_definition='A traditional lot for the mother, calculated in Abū Maʿshar by day from Venus to the Moon and by night in reverse, projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.70 and repeated in the formula summary.'
WHERE slug='lot-of-mother';

UPDATE terms SET
  short_definition='A traditional lot for children. Abū Maʿshar’s preferred formula is Jupiter to Saturn by day and the reverse by night, projected from the Ascendant; he also records a non-reversing variant from Tawfīl.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.4.22 and repeated at VIII.6.8.'
WHERE slug='lot-of-children';

UPDATE terms SET
  label='Lot of Male Children',
  short_definition='A traditional lot for male children, calculated by Abū Maʿshar in both day and night charts from the Moon to Jupiter and projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.6.8.'
WHERE slug='lot-of-sons';

UPDATE terms SET
  label='Lot of Female Children',
  short_definition='A traditional lot for female children, calculated by Abū Maʿshar in both day and night charts from the Moon to Venus and projected from the Ascendant.',
  definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar VIII.6.8.'
WHERE slug='lot-of-daughters';

-- Correct and source-anchor article formulas.
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Abū Maʿshar’s preferred formula','Day and night: Ascendant + Jupiter - Saturn. Abū Maʿshar also reports a Wālīs variant, Ascendant + Jupiter - Mercury, but explicitly prefers the Hermetic Saturn-to-Jupiter extraction.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-siblings';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Saturn - Mercury.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-number-of-siblings';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Abū Maʿshar’s formula','Normally: day = Ascendant + Saturn - Sun; night = Ascendant + Sun - Saturn. If Saturn is under the rays, Jupiter replaces Saturn: day = Ascendant + Jupiter - Sun; night = Ascendant + Sun - Jupiter.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-father';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='lot-of-father') AND section_key='fallback';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Moon - Venus. Night: Ascendant + Venus - Moon.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-mother';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Abū Maʿshar’s preferred formula','Day: Ascendant + Saturn - Jupiter. Night: Ascendant + Jupiter - Saturn. Abū Maʿshar also records Tawfīl’s non-reversing Jupiter-to-Saturn extraction, but says the sect-dependent Hermetic form is more correct.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-children';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Jupiter - Moon.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-sons';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Venus - Moon.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-daughters';

-- -----------------------------------------------------------------------------
-- FAMILY SOURCE INTERPRETATIONS
-- -----------------------------------------------------------------------------
WITH defs(slug,summary,scope) AS (
  VALUES
    ('lot-of-siblings','Abū Maʿshar gives the lot of brothers from Saturn to Jupiter in both day and night charts, projected from the Ascendant. He also reports a Wālīs formula from Mercury to Jupiter, but states that the Hermetic Saturn-to-Jupiter formula is correct.','Part VIII, Chapter 4, §4.11'),
    ('lot-of-number-of-siblings','Abū Maʿshar preserves a separate lot of the number of brothers and summarizes its extraction from Mercury to Saturn in both day and night charts, projected from the Ascendant.','Part VIII, formula summary, §6.6'),
    ('lot-of-father','Abū Maʿshar gives the father lot from the Sun to Saturn by day and in reverse by night. If Saturn is under the rays, Jupiter replaces Saturn. He reports but rejects another Mars/Jupiter fallback in favor of the Hermetic form.','Part VIII, Chapter 4, §4.14'),
    ('lot-of-mother','Abū Maʿshar gives the mother lot from Venus to the Moon by day and in reverse by night, projected from the Ascendant.','Part VIII, Chapter 4, §4.70'),
    ('lot-of-children','Abū Maʿshar gives the children lot from Jupiter to Saturn by day and in reverse by night, projected from the Ascendant. He records Tawfīl’s non-reversing variant but says the Hermetic sect-dependent formula is more correct.','Part VIII, Chapter 4, §4.22'),
    ('lot-of-sons','In his formula summary, Abū Maʿshar gives the lot of male children from the Moon to Jupiter in both day and night charts, projected from the Ascendant.','Part VIII, formula summary, §6.8'),
    ('lot-of-daughters','In his formula summary, Abū Maʿshar gives the lot of female children from the Moon to Venus in both day and night charts, projected from the Ascendant.','Part VIII, formula summary, §6.8')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope);

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug IN ('lot-of-siblings','lot-of-number-of-siblings','lot-of-father','lot-of-mother','lot-of-children','lot-of-sons','lot-of-daughters')
  AND sp.book='Part VIII' AND sp.section='4.11-4.22';

-- -----------------------------------------------------------------------------
-- MARRIAGE: TURN THE OLD GENERIC HERMES ENTRY INTO AN UMBRELLA
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Hermes’ Marriage Lots',
  short_definition='An editorial umbrella for several marriage lots attributed to Hermes in Abū Maʿshar, including separate lots for men, women, a general marriage lot, and a lot for the time of marriage.',
  definition_quality=4,
  editorial_notes='Do not treat this umbrella as one formula. Abū Maʿshar preserves distinct Hermetic marriage lots with different constructions.'
WHERE slug='hermes-lot-of-marriage';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Abū Maʿshar preserves several different marriage lots attributed to Hermes. The older generic “Hermes’ Lot of Marriage” entry is therefore retained only as a navigation umbrella; the individual historical formulas have their own entries.',
       'reviewed','Disambiguation umbrella created during direct-source corroboration.'
FROM terms WHERE slug='hermes-lot-of-marriage';
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='hermes-lot-of-marriage') AND section_key='formula';

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('hermes-lot-of-marriage-men','Hermes’ Lot of Marriage of Men',
   'A marriage lot attributed to Hermes, calculated in Abū Maʿshar in both day and night charts from Saturn to Venus and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.31. He reports a reversed nocturnal variant from some authorities but prefers the non-reversing Hermetic formula.','technical',5),
  ('walis-lot-of-marriage-men','Wālīs’ Lot of Marriage of Men',
   'A marriage lot attributed by Abū Maʿshar to Wālīs (Vettius Valens), calculated in both day and night charts from the Sun to Venus and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.32 explicitly attributes this formula to Wālīs/Valens.','technical',5),
  ('hermes-lot-of-marriage-women','Hermes’ Lot of Marriage of Women',
   'A marriage lot attributed to Hermes, calculated in Abū Maʿshar in both day and night charts from Venus to Saturn and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.36. Distinct from the male formula by reversed planetary order.','technical',5),
  ('walis-lot-of-marriage-women','Wālīs’ Lot of Marriage of Women',
   'A marriage lot attributed by Abū Maʿshar to Wālīs (Vettius Valens), calculated in both day and night charts from the Moon to Mars and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.37. He reports a reversed nocturnal Persian variant but prefers the Wālīs form.','technical',5),
  ('hermes-general-lot-of-marriage','Hermes’ General Lot of Marriage',
   'A general marriage lot attributed to Hermes, measured in Abū Maʿshar from Venus to the degree of the marriage cardine and projected from the Ascendant in both day and night charts.',
   'lots','reviewed','Abū Maʿshar VIII.4.42. One witness glosses the marriage cardine as the western angle/seventh.','technical',5),
  ('hermes-lot-of-time-of-marriage','Hermes’ Lot of the Time of Marriage',
   'A timing-related marriage lot attributed to Hermes, calculated in both day and night charts from the Sun to the Moon and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.43. Kept as a term identity; no predictive workflow is imported.','technical',5);

WITH defs(slug,summary,scope) AS (
  VALUES
    ('hermes-lot-of-marriage-men','Abū Maʿshar attributes to Hermes a male marriage lot measured from Saturn to Venus in both day and night charts and projected from the Ascendant. He reports a reversed nocturnal variant from some authorities but says the Hermetic formula is more correct.','Part VIII, Chapter 4, §4.31'),
    ('walis-lot-of-marriage-men','Abū Maʿshar attributes to Wālīs a second male marriage lot measured from the Sun to Venus in both day and night charts and projected from the Ascendant.','Part VIII, Chapter 4, §4.32'),
    ('hermes-lot-of-marriage-women','Abū Maʿshar attributes to Hermes a female marriage lot measured from Venus to Saturn in both day and night charts and projected from the Ascendant.','Part VIII, Chapter 4, §4.36'),
    ('walis-lot-of-marriage-women','Abū Maʿshar attributes to Wālīs a female marriage lot measured from the Moon to Mars in both day and night charts and projected from the Ascendant; a reversed nocturnal Persian variant is reported but not preferred.','Part VIII, Chapter 4, §4.37'),
    ('hermes-general-lot-of-marriage','Abū Maʿshar attributes to Hermes a general lot of marriage measured from Venus to the degree and minute of the marriage cardine and projected from the Ascendant in both day and night charts.','Part VIII, Chapter 4, §4.42'),
    ('hermes-lot-of-time-of-marriage','Abū Maʿshar attributes to Hermes a lot of the time of marriage measured from the Sun to the Moon in both day and night charts and projected from the Ascendant.','Part VIII, Chapter 4, §4.43')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed','A'
FROM defs JOIN terms t ON t.slug=defs.slug CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug IN ('hermes-lot-of-marriage-men','walis-lot-of-marriage-men','hermes-lot-of-marriage-women','walis-lot-of-marriage-women','hermes-general-lot-of-marriage','hermes-lot-of-time-of-marriage')
  AND sp.book='Part VIII' AND sp.section='4.31-4.43';

-- Articles/formulas for the six specific marriage terms.
WITH art(slug,intro,formula) AS (
  VALUES
    ('hermes-lot-of-marriage-men','Hermes’ Lot of Marriage of Men is the male marriage lot Abū Maʿshar presents as the preferred Hermetic formula.','Day and night: Ascendant + Venus - Saturn.'),
    ('walis-lot-of-marriage-men','Wālīs’ Lot of Marriage of Men is a distinct male marriage lot preserved by Abū Maʿshar and attributed to Wālīs/Vettius Valens.','Day and night: Ascendant + Venus - Sun.'),
    ('hermes-lot-of-marriage-women','Hermes’ Lot of Marriage of Women is the female counterpart of the Hermetic marriage-lot pair in Abū Maʿshar.','Day and night: Ascendant + Saturn - Venus.'),
    ('walis-lot-of-marriage-women','Wālīs’ Lot of Marriage of Women is a distinct female marriage lot preserved by Abū Maʿshar and attributed to Wālīs/Vettius Valens.','Day and night: Ascendant + Mars - Moon.'),
    ('hermes-general-lot-of-marriage','Hermes’ General Lot of Marriage is separate from the sex-specific marriage lots and uses Venus together with the marriage cardine.','Day and night: Ascendant + marriage cardine - Venus.'),
    ('hermes-lot-of-time-of-marriage','Hermes’ Lot of the Time of Marriage is a separately named calculated point concerned with marriage timing in the historical source. The lexicon records the term and formula without importing timing instructions.','Day and night: Ascendant + Moon - Sun.')
)
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT t.id,art.intro,'reviewed','Public synthesis anchored directly to Abū Maʿshar Part VIII.'
FROM art JOIN terms t ON t.slug=art.slug;

WITH art(slug,formula) AS (
  VALUES
    ('hermes-lot-of-marriage-men','Day and night: Ascendant + Venus - Saturn.'),
    ('walis-lot-of-marriage-men','Day and night: Ascendant + Venus - Sun.'),
    ('hermes-lot-of-marriage-women','Day and night: Ascendant + Saturn - Venus.'),
    ('walis-lot-of-marriage-women','Day and night: Ascendant + Mars - Moon.'),
    ('hermes-general-lot-of-marriage','Day and night: Ascendant + marriage cardine - Venus.'),
    ('hermes-lot-of-time-of-marriage','Day and night: Ascendant + Moon - Sun.')
)
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT t.id,'formula','Formula',art.formula,10,'reviewed',NULL
FROM art JOIN terms t ON t.slug=art.slug;

WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('hermes-lot-of-marriage-men','hermes-lot-of-marriage','specific-form-of','Male Hermetic marriage lot in Abū Maʿshar.'),
    ('hermes-lot-of-marriage-women','hermes-lot-of-marriage','specific-form-of','Female Hermetic marriage lot in Abū Maʿshar.'),
    ('hermes-general-lot-of-marriage','hermes-lot-of-marriage','specific-form-of','General Hermetic marriage lot in Abū Maʿshar.'),
    ('hermes-lot-of-time-of-marriage','hermes-lot-of-marriage','specific-form-of','Timing-related Hermetic marriage lot in Abū Maʿshar.'),
    ('walis-lot-of-marriage-men','hermes-lot-of-marriage-men','variant-of','Alternative male marriage lot attributed to Wālīs/Valens.'),
    ('walis-lot-of-marriage-women','hermes-lot-of-marriage-women','variant-of','Alternative female marriage lot attributed to Wālīs/Valens.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel JOIN terms s ON s.slug=rel.subject_slug JOIN terms o ON o.slug=rel.object_slug;

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT t.id,l.id,'subtype-of','A named topical lot.','reviewed'
FROM terms t CROSS JOIN terms l
WHERE t.slug IN ('hermes-lot-of-marriage-men','walis-lot-of-marriage-men','hermes-lot-of-marriage-women','walis-lot-of-marriage-women','hermes-general-lot-of-marriage','hermes-lot-of-time-of-marriage')
  AND l.slug='lot';
