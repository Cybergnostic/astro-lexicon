-- Encyclopedia conversion batch: core Lots / Parts reference layer.
-- Formula presentation is explicit and source-sensitive; calculation notation follows the
-- established Asc + B - A convention and does not erase historical variants.

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'concept','What a Lot is',
  'A Lot, or Part, is a calculated zodiacal point derived from the angular distance between two significators and projected from the Ascendant or another defined reference. Lots are not planets and have no independent physical body; their meaning comes from the symbolic relation encoded by the formula.',10,'reviewed'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'notation','Reading the formula notation',
  'In this lexicon, Asc + B − A means: measure the zodiacal arc from A to B and project that arc from the Ascendant. When a source reverses the formula by sect, the day and night versions are displayed separately. When a source keeps one formula for both sects, that is stated explicitly.',20,'reviewed'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'core-lot-examples','Core formula patterns',
  'Examples from historically resolved entries in the current corpus. These are examples of formula structure, not a universal master table for every tradition.',
  '["Lot","Day","Night","Pattern"]',
  '[["Fortune","Asc + Moon − Sun","Asc + Sun − Moon","Sect reversal"],["Absence / Spirit stream","Asc + Sun − Moon","Asc + Moon − Sun","Reverse of Fortune"],["Substance (Bonatti)","Asc + 2nd cusp − lord II","Same","Fixed day/night"],["Haylāǧ","Asc + Moon − prenatal syzygy","Same","Fixed day/night"]]',
  30,'reviewed','Compact teaching table; source-specific entry remains authoritative.'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'source-variation','Why formulas must be source-attributed',
  'The same English label can conceal different historical formulas, and different labels can sometimes be applied to the same formula stream. Formula identity, sect reversal and source attribution therefore matter as much as the translated name.',40,'reviewed'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Lot Extraction is the calculation step by which the zodiacal distance between two designated significators is projected from the Ascendant or another defined origin to produce a Lot. It names the mechanics of deriving the point, not a complete method of interpreting it.',
  'reviewed','Calculation concept only; interpretation workflow excluded.'
FROM terms WHERE slug='lot-extraction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'mechanics','Arc and projection',
  'If a formula is written Asc + B − A, first determine the zodiacal arc from A to B, then add that arc to the Ascendant. The resulting degree is the Lot. Day/night reversal changes which significator is subtracted from which; it does not change the basic projection principle.',10,'reviewed'
FROM terms WHERE slug='lot-extraction';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Natural Indicators of a Lot are planets or significators connected to the subject of a Lot by their inherent astrological nature, independently of who rules the Lot’s zodiacal position in a particular chart.',
  'reviewed','Definition only; topic-analysis workflow excluded.'
FROM terms WHERE slug='natural-indicators-of-a-lot';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Natural versus chart-specific indication',
  'A natural indicator belongs to the topic by planetary nature. A chart-specific ruler or dispositor belongs to the individual Lot because of its actual zodiacal position. The two layers can coincide, but they are conceptually different.',10,'reviewed'
FROM terms WHERE slug='natural-indicators-of-a-lot';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'General Indicators of a Lot are the chart factors used to describe the Lot as an operative point—especially the Lot’s ruler and other planets connected to its degree—rather than the planets that naturally signify its topic in all charts.',
  'reviewed','Definition only; no ordered judgment recipe.'
FROM terms WHERE slug='general-indicators-of-a-lot';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','General versus natural indicators',
  'General indicators arise from the actual chart position and rulership of the Lot. Natural indicators arise from the intrinsic planetary significations of the topic. The distinction prevents a Lot from being reduced either to its formula alone or to a generic topic planet.',10,'reviewed'
FROM terms WHERE slug='general-indicators-of-a-lot';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'formula','Formula',
  'Abū Maʿshar stream with sect reversal.',
  '["Sect","Formula"]',
  '[["Day","Asc + Moon − Sun"],["Night","Asc + Sun − Moon"]]',
  15,'reviewed','Formula displayed in standardized notation.'
FROM terms WHERE slug='lot-of-fortune';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation','Relation to the reverse luminary Lot',
  'In Abū Maʿshar’s presentation, Fortune and the solar/Absence lot form a reversed pair: the same luminary arc is projected in opposite directions according to which Lot is being calculated. Other authors can preserve different naming or night-use conventions, so the source account remains essential.',25,'reviewed'
FROM terms WHERE slug='lot-of-fortune';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'formula-table','Formula',
  'Abū Maʿshar’s reverse-luminary counterpart to Fortune.',
  '["Sect","Formula"]',
  '[["Day","Asc + Sun − Moon"],["Night","Asc + Moon − Sun"]]',
  15,'reviewed','Naming varies in transmission; formula identity is preserved.'
FROM terms WHERE slug='lot-of-absence';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'formula-table','Bonatti formula',
  'Bonatti gives the same construction by day and night.',
  '["Sect","Formula"]',
  '[["Day","Asc + 2nd-house degree − lord of the 2nd"],["Night","Same formula"]]',
  15,'reviewed','Direct Bonatti evidence; do not replace with a generic wealth Lot.'
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'meaning','What the construction encodes',
  'The formula links the Ascendant to the second house and its ruler, making the Lot specifically a calculated relation to substance and material support. It should not be confused with the Lot of Fortune merely because both can appear in financial judgments.',25,'reviewed'
FROM terms WHERE slug='lot-of-substance';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'formula-table','Formula',
  'The prenatal syzygy is the preceding conjunction or opposition of the luminaries according to the nativity’s syzygy type.',
  '["Sect","Formula"]',
  '[["Day","Asc + Moon − prenatal syzygy"],["Night","Same formula"]]',
  15,'reviewed','Historical definition only; no lifespan procedure.'
FROM terms WHERE slug='lot-of-haylaj';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'syzygy','The prenatal syzygy term in the formula',
  'For this construction the relevant syzygy is the preceding conjunction when the nativity belongs to the conjunctional half of the lunation cycle, or the preceding opposition when it belongs to the oppositional half. The Lot remains a calculated point distinct from the Hyleg itself.',25,'reviewed'
FROM terms WHERE slug='lot-of-haylaj';
