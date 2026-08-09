-- Public-source corroboration pass: Abū Maʿshar's tenth- and eleventh-place lots.
--
-- The curriculum sweep initially surfaced broad modern labels such as Rank, Authority,
-- Fame/Reputation and Success. Direct review of Part VIII of the Great Introduction
-- shows that Abū Maʿshar preserves several distinct lots in this semantic field.
-- Keep those historical identities separate rather than flattening them into one
-- generic 'career/eminence' formula.

-- -----------------------------------------------------------------------------
-- SOURCE PASSAGE
-- -----------------------------------------------------------------------------
INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'893','903','Part VIII','Chapter 4','4.59-4.74',
       'Part VIII, Chapter 4, §§4.59-4.74: tenth-place lots of high rank, rulership/authority, leaders/rulers, authority-support-victory, sudden rise, chiefs, soldiers, authority/occupation; eleventh-place lots of honour, being loved, well-known/honoured, and success',
       NULL,
       'Definition- and formula-level evidence recovered during the post-curriculum corroboration pass. Public summaries are original paraphrases.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Part VIII' AND sp.section='4.59-4.74'
  );

-- -----------------------------------------------------------------------------
-- EXISTING PROVISIONAL TERMS: RANK / SUCCESS / GENERIC AUTHORITY
-- -----------------------------------------------------------------------------
UPDATE terms SET
  label='Lot / Part of High Rank',
  short_definition='A lot in Abū Maʿshar for the native’s high rank and elevated standing, calculated by day from the Sun to its exaltation degree and by night from the Moon to its exaltation degree, then projected from the Ascendant.',
  category='lots', status='reviewed', definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar, Great Introduction VIII.4.59. Preserve the unusual dual function concerning disputed paternity as source-specific doctrine rather than folding it into the concise definition.'
WHERE slug='lot-of-rank';

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lot of High Rank','English','source-name','Direct English rendering in Abū Maʿshar VIII.4.59.' FROM terms WHERE slug='lot-of-rank';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Part of High Rank','English','name-variant','Part/Lot wording variant.' FROM terms WHERE slug='lot-of-rank';

UPDATE terms SET
  short_definition='A lot in Abū Maʿshar for success and favorable attainment, calculated by day from the Lot of Fortune to Jupiter and by night in reverse, then projected from the Ascendant.',
  category='lots', status='reviewed', definition_quality=5,
  editorial_notes='Directly attested in Abū Maʿshar, Great Introduction VIII.4.74. One Latin witness renders the name differently, so preserve translation variants at source level.'
WHERE slug='lot-of-success';

UPDATE terms SET
  label='Lot / Part of Authority (generic label)',
  short_definition='A generic editorial label for a family of distinct traditional lots concerned with rulership, authority, standing or office; it should not be treated as one universally fixed formula.',
  status='reviewed', definition_quality=4,
  editorial_notes='Abū Maʿshar alone distinguishes several separate authority-related lots in Part VIII. Use the more specific child entries when a historical formula is meant. The earlier course-linked Valens attribution remains a separate source question.'
WHERE slug='lot-of-authority';

-- -----------------------------------------------------------------------------
-- DISTINCT ABŪ MAʿSHAR LOTS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('lot-of-rulership-and-authority','Lot of Rulership and Authority',
   'A lot in Abū Maʿshar for rulership and authority, calculated by day from Mars to the Moon and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.60. Keep distinct from his other authority-related lots.','technical',5),
  ('lot-of-authority-support-victory','Lot of Authority, Support, and Victory',
   'A lot in Abū Maʿshar for authority, support, victory, honour and standing, normally calculated by day from the Sun to Saturn and by night in reverse, with Jupiter substituted for Saturn when Saturn is under the rays.',
   'lots','reviewed','Abū Maʿshar VIII.4.62. The Saturn-under-rays substitution is part of the transmitted formula and should not be omitted.','technical',5),
  ('lot-of-authority-and-occupation','Lot of Authority and Occupation',
   'A lot in Abū Maʿshar concerned with authority, standing and the native’s occupation or craft, calculated both day and night from Saturn to the Moon and projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.66. The source joins authority/status and occupation in one lot; do not split that historical identity without another witness.','technical',5),
  ('lot-of-honour','Lot of Honour',
   'A lot in Abū Maʿshar for honour, exaltedness, dignity and enduring reputation, calculated by day from the Lot of Fortune to the Lot of Absence and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.71. Keep distinct from the following lot of the well-known and honoured.','technical',5),
  ('lot-of-well-known-and-honoured','Lot of the Well-Known and Honoured',
   'A lot in Abū Maʿshar for being well known, honoured and eminent among people, calculated by day from the Lot of Fortune to the Sun and by night in reverse, then projected from the Ascendant.',
   'lots','reviewed','Abū Maʿshar VIII.4.73. The source also associates it with supporting the needs of other people.','technical',5);

-- -----------------------------------------------------------------------------
-- SOURCE INTERPRETATIONS
-- -----------------------------------------------------------------------------
WITH defs(slug,summary,scope,grade) AS (
  VALUES
    ('lot-of-rank',
     'Abū Maʿshar calls this the lot of the native’s high rank. By day it is measured from the Sun to the Sun’s exaltation degree, 19° Aries; by night from the Moon to the Moon’s exaltation degree, 3° Taurus; the arc is then projected from the Ascendant. He associates it with high rank and exalted standing, while also giving it a separate use in questions of disputed paternity.',
     'Part VIII, Chapter 4, §4.59', 'A'),
    ('lot-of-rulership-and-authority',
     'Abū Maʿshar defines the lot of rulership and authority as the arc from Mars to the Moon by day and the reverse by night, projected from the Ascendant. In favorable condition he associates it with rulership, proximity to rulers and having one’s words accepted by them.',
     'Part VIII, Chapter 4, §4.60', 'A'),
    ('lot-of-authority-support-victory',
     'Abū Maʿshar defines a distinct lot of authority, support and victory from the Sun to Saturn by day and the reverse by night. If Saturn is under the rays, Jupiter replaces Saturn. The lot is associated with authority, honour, power, standing and victory.',
     'Part VIII, Chapter 4, §4.62', 'A'),
    ('lot-of-authority-and-occupation',
     'Abū Maʿshar defines another distinct lot joining authority with occupation. It is measured from Saturn to the Moon in both day and night charts and projected from the Ascendant, and it signifies authority, honour, standing and the work or craft the native performs.',
     'Part VIII, Chapter 4, §4.66', 'A'),
    ('lot-of-honour',
     'Abū Maʿshar derives the lot of honour from the Lot of Fortune and the Lot of Absence, reversing the direction by sect and projecting from the Ascendant. He associates it with honour, exaltedness, nobility, praise, dignity and a reputation that endures.',
     'Part VIII, Chapter 4, §4.71', 'A'),
    ('lot-of-well-known-and-honoured',
     'Abū Maʿshar defines the lot of the well-known and honoured among people from the Lot of Fortune to the Sun by day and in reverse by night, projected from the Ascendant. He associates it with eminence, honour and public recognition.',
     'Part VIII, Chapter 4, §4.73', 'A'),
    ('lot-of-success',
     'Abū Maʿshar defines the lot of success from the Lot of Fortune to Jupiter by day and in reverse by night, projected from the Ascendant. He associates it with successful attainment of needs and aims.',
     'Part VIII, Chapter 4, §4.74', 'A')
)
INSERT INTO interpretations (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,defs.summary,defs.scope,'direct','reviewed',defs.grade
FROM defs
JOIN terms t ON t.slug=defs.slug
CROSS JOIN works w
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope=defs.scope
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='abu-mashar-great-introduction'
  AND t.slug IN (
    'lot-of-rank','lot-of-rulership-and-authority','lot-of-authority-support-victory',
    'lot-of-authority-and-occupation','lot-of-honour','lot-of-well-known-and-honoured',
    'lot-of-success'
  )
  AND sp.book='Part VIII' AND sp.section='4.59-4.74';

-- -----------------------------------------------------------------------------
-- ARTICLE LAYER
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Abū Maʿshar’s Lot of High Rank is a calculated point for elevated social standing. It is unusual because the two sect formulas do not merely reverse the same pair of factors: the day formula uses the Sun and its exaltation degree, while the night formula uses the Moon and its exaltation degree.',
       'reviewed','Public synthesis anchored directly to Great Introduction VIII.4.59.'
FROM terms WHERE slug='lot-of-rank';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
       'Day: Ascendant + 19° Aries - Sun. Night: Ascendant + 3° Taurus - Moon. These are the exaltation degrees given in Abū Maʿshar’s text for the Sun and Moon respectively.',
       10,'reviewed',NULL
FROM terms WHERE slug='lot-of-rank';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The generic label “Lot of Authority” is potentially misleading because historical authors can preserve several different lots concerned with authority, rulership, status or office. Abū Maʿshar alone distinguishes multiple authority-related lots with different formulas. Use the specific entries whenever the source identity is known.',
       'reviewed','Converted from a provisional single-formula placeholder into a disambiguating umbrella.'
FROM terms WHERE slug='lot-of-authority';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Rulership and Authority is one of Abū Maʿshar’s tenth-place lots. It is a distinct calculated point rather than a generic synonym for every authority-related lot.',
       'reviewed','Public synthesis from VIII.4.60.'
FROM terms WHERE slug='lot-of-rulership-and-authority';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Moon - Mars. Night: Ascendant + Mars - Moon.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-rulership-and-authority';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Abū Maʿshar’s Lot of Authority, Support, and Victory is another distinct tenth-place lot, associated in the source with authority, honour, power, standing and overcoming opposition.',
       'reviewed','Public synthesis from VIII.4.62.'
FROM terms WHERE slug='lot-of-authority-support-victory';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
       'Normally: day = Ascendant + Saturn - Sun; night = Ascendant + Sun - Saturn. If Saturn is under the rays, Abū Maʿshar substitutes Jupiter for Saturn: day = Ascendant + Jupiter - Sun; night = Ascendant + Sun - Jupiter.',
       10,'reviewed',NULL
FROM terms WHERE slug='lot-of-authority-support-victory';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Authority and Occupation combines questions of status with the kind of work or craft performed. Abū Maʿshar transmits the same direction of extraction in day and night charts.',
       'reviewed','Public synthesis from VIII.4.66.'
FROM terms WHERE slug='lot-of-authority-and-occupation';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day and night: Ascendant + Moon - Saturn.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-authority-and-occupation';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Honour is an eleventh-place lot in Abū Maʿshar, constructed from two other lots rather than directly from planets. The source connects it with honour, exaltedness, dignity, praise and durable reputation.',
       'reviewed','Public synthesis from VIII.4.71.'
FROM terms WHERE slug='lot-of-honour';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Lot of Absence - Lot of Fortune. Night: Ascendant + Lot of Fortune - Lot of Absence.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-honour';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of the Well-Known and Honoured is a separate eleventh-place lot in Abū Maʿshar. It concerns public recognition and eminence and should not be collapsed automatically into later labels such as Lot of Fame or Lot of Reputation.',
       'reviewed','Public synthesis from VIII.4.73.'
FROM terms WHERE slug='lot-of-well-known-and-honoured';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Sun - Lot of Fortune. Night: Ascendant + Lot of Fortune - Sun.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-well-known-and-honoured';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Lot of Success is an eleventh-place lot in Abū Maʿshar concerned with successful attainment of aims and needs.',
       'reviewed','Public synthesis anchored directly to Great Introduction VIII.4.74.'
FROM terms WHERE slug='lot-of-success';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula','Formula','Day: Ascendant + Jupiter - Lot of Fortune. Night: Ascendant + Lot of Fortune - Jupiter.',10,'reviewed',NULL
FROM terms WHERE slug='lot-of-success';

-- -----------------------------------------------------------------------------
-- RELATIONS / DISAMBIGUATION
-- -----------------------------------------------------------------------------
WITH rel(subject_slug,object_slug,relation_type,note) AS (
  VALUES
    ('lot-of-rulership-and-authority','lot','subtype-of','A named topical lot in Abū Maʿshar.'),
    ('lot-of-authority-support-victory','lot','subtype-of','A named topical lot in Abū Maʿshar.'),
    ('lot-of-authority-and-occupation','lot','subtype-of','A named topical lot in Abū Maʿshar.'),
    ('lot-of-honour','lot','subtype-of','A named topical lot in Abū Maʿshar.'),
    ('lot-of-well-known-and-honoured','lot','subtype-of','A named topical lot in Abū Maʿshar.'),
    ('lot-of-authority','lot-of-rulership-and-authority','has-specific-form','One historically explicit Abū Maʿshar authority lot.'),
    ('lot-of-authority','lot-of-authority-support-victory','has-specific-form','A second historically explicit Abū Maʿshar authority lot.'),
    ('lot-of-authority','lot-of-authority-and-occupation','has-specific-form','A third historically explicit Abū Maʿshar authority lot.'),
    ('lot-of-well-known-and-honoured','lot-of-reputation','related-to','Semantically close to later reputation terminology, but exact historical equivalence is not yet established.'),
    ('lot-of-well-known-and-honoured','lot-of-fame','related-to','Semantically close to later fame terminology, but exact historical equivalence is not yet established.'),
    ('lot-of-honour','lot-of-exaltation','related-to','Abū Maʿshar explicitly associates the Lot of Honour with honour and exaltedness, but this does not by itself prove identity with a separately transmitted Lot of Exaltation.')
)
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT s.id,o.id,rel.relation_type,rel.note,'reviewed'
FROM rel
JOIN terms s ON s.slug=rel.subject_slug
JOIN terms o ON o.slug=rel.object_slug;
