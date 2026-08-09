-- Encyclopedia presentation pass: strength and condition vocabularies.
-- These tables clarify dimensions of planetary condition without turning them into
-- a scoring worksheet or ordered chart-analysis procedure.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ACCIDENTAL FORTITUDE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'accidental-condition-dimensions','Common dimensions of accidental condition',
  'Traditional authors weigh these factors differently; this is a vocabulary map, not a universal points table.',
  '["Dimension","Examples","What it describes"]',
  '[["House position","Angular · Succedent · Cadent","Capacity and prominence through place"],["Direction of motion","Direct · Stationary · Retrograde","Current mode of apparent zodiacal motion"],["Speed","Swift · Slow","Rate of motion relative to the planet’s ordinary/mean motion"],["Solar condition","Cazimi · Combust · Under the Beams","Relation to the Sun and visibility"],["Sect conformity","Sect · Halb · Hayz","Fit with day/night environment and related conditions"],["Configuration","Besiegement · Feral · Void of Course","Relational or isolation conditions"]]',
  60,'reviewed','Reference taxonomy only; no numerical scoring or priority sequence.'
FROM terms WHERE slug='accidental-fortitude';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'essential-vs-accidental','Essential dignity and accidental fortitude compared',
  'The two dimensions can combine in any direction and should not be collapsed into one label such as “strong” or “weak.”',
  '["Dimension","Primary question","Examples"]',
  '[["Essential condition","What standing does the planet have in the zodiacal degree it occupies?","Domicile · Exaltation · Triplicity · Bound · Face · Peregrine · Detriment · Fall"],["Accidental condition","How capable is the planet of acting in this particular figure?","House strength · Motion · Speed · Solar condition · Sect · Configuration"]]',
  70,'reviewed','Conceptual distinction; individual doctrines remain separate entries.'
FROM terms WHERE slug='accidental-fortitude';

-- -----------------------------------------------------------------------------
-- HOUSE-STRENGTH FAMILY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'house-strength-sequence','Angular, succedent and cadent compared',
  'This is the broad structural hierarchy represented in the corpus; individual authors can add finer distinctions among particular houses.',
  '["Class","Places","General accidental capacity"]',
  '[["Angular / Cardines","1st · 10th · 7th · 4th","Greatest immediate capacity and prominence"],["Succedent","2nd · 11th · 8th · 5th","Intermediate capacity; follows and sustains the angles"],["Cadent","3rd · 12th · 9th · 6th","Generally reduced direct capacity; falls away from the angles"]]',
  60,'reviewed','Structural comparison only; topical meanings of houses are separate.'
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'strength-not-topic','House class and house topic are different dimensions',
  'A place can be topically important while belonging to a weaker strength class, or structurally powerful while signifying a difficult topic.',
  '["Question","Vocabulary"]',
  '[["What does the place signify?","House/place topical meanings"],["How much accidental capacity does a planet gain there?","Angular · Succedent · Cadent"]]',
  70,'reviewed','Prevents topical and strength classifications from being conflated.'
FROM terms WHERE slug='twelve-places';

-- -----------------------------------------------------------------------------
-- BENEFIC / MALEFIC CLASSIFICATION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'benefic-malefic-classification','Natural benefic and malefic classification',
  'Natural classification does not determine the complete result of a planet in every chart.',
  '["Class","Planets","Qualification"]',
  '[["Greater benefic","Jupiter","Natural benefic classification; condition still matters"],["Lesser benefic","Venus","Natural benefic classification; condition still matters"],["Lesser malefic","Mars","Natural malefic classification; condition still matters"],["Greater malefic","Saturn","Natural malefic classification; condition still matters"]]',
  60,'reviewed','Historical classification table; not a good/bad outcome chart.'
FROM terms WHERE slug='benefic';

-- -----------------------------------------------------------------------------
-- ISOLATION / ENCLOSURE CONDITIONS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'isolation-enclosure','Isolation and enclosure conditions compared',
  'These conditions all concern planetary relationship, but they describe different geometries or sequences.',
  '["Term","Core idea"]',
  '[["Void of Course","After separation, no further qualifying application before leaving the sign under the rule being used"],["Feral / Wild","A stricter condition of remaining without qualifying planetary contact through the sign"],["Besiegement","A planet is enclosed between two planets or their rays according to the historical rule being used"]]',
  60,'reviewed','Definitions and qualifying aspect/orb rules can vary by source.'
FROM terms WHERE slug='void-of-course';
