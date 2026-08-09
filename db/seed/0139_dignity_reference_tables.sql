-- Encyclopedia presentation pass: dignity/debility reference tables.
-- These blocks clarify relations among canonical terms without imposing one historical
-- scoring table or flattening source-specific bound/triplicity variants.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ESSENTIAL DIGNITY OVERVIEW
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'dignity-debility-relations','Major dignity and debility relations',
  'These labels describe different kinds of zodiacal standing; they should not be collapsed into one generic strong/weak scale.',
  '["Term","Defined by","Paired / related concept"]',
  '[["Domicile","Planet rules the sign","Detriment / exile is the opposite sign"],["Exaltation","Planet has elevated dignity in the sign","Fall is the opposite sign"],["Triplicity","Sect-sensitive rulership of an elemental triplicity","Historical ruler tables vary"],["Bound / Term","Planet rules the degree-range under the bound table in use","Unequal subdivision; table-dependent"],["Face / Decan","Planet rules the ten-degree face/decan","Equal 10° subdivision"],["Peregrine","Planet has none of its own recognized essential dignities at the degree","Absence of dignity, not another planet’s term/face"]]',
  65,'reviewed','Structural map only; no universal numerical weighting.'
FROM terms WHERE slug='essential-dignity';

-- -----------------------------------------------------------------------------
-- DOMICILE / DETRIMENT AND EXALTATION / FALL
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'paired-axes','Paired dignity axes',
  'Detriment derives from the sign opposite domicile; fall derives from the sign opposite exaltation.',
  '["Axis","Dignity","Opposite condition"]',
  '[["Domicile axis","Domicile","Detriment / Exile"],["Exaltation axis","Exaltation","Fall"]]',
  60,'reviewed','Conceptual relation only; detailed sign assignments are available in the dignity tables elsewhere on the page/site.'
FROM terms WHERE slug='detriment';

-- -----------------------------------------------------------------------------
-- BOUND / TERM AND FACE / DECAN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'bound-face-comparison','Bound and face compared',
  'Both can supply minor essential dignity, but their geometry and ruler systems are different.',
  '["Feature","Bound / Term","Face / Decan"]',
  '[["Subdivision size","Unequal degree ranges","Three equal 10° divisions per sign"],["Rulers","Five non-luminary planets in the standard bound systems","Planetary face/decan sequence"],["Historical variation","Multiple bound tables circulate","Face/decan ruler traditions can also vary by historical context"],["Effect on peregrine status","Own bound counts as essential dignity","Own face counts as essential dignity"]]',
  60,'reviewed','Do not substitute this comparison for a source-specific bound or decan table.'
FROM terms WHERE slug='bound-term';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'face-bound-comparison','Face and bound compared',
  'Face/decan and bound/term are different minor-dignity systems.',
  '["Feature","Face / Decan","Bound / Term"]',
  '[["Subdivision size","10° each","Unequal"],["Number within a sign","Three faces","Several bounds of varying length"],["Dignity test","Planet must rule the face it occupies","Planet must rule the bound it occupies"]]',
  60,'reviewed','Reference comparison only.'
FROM terms WHERE slug='face-decan';

-- -----------------------------------------------------------------------------
-- PEREGRINE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'peregrine-recognition','What prevents peregrine status?',
  'A planet is not peregrine if it possesses any recognized essential dignity of its own at the degree under the scheme being used.',
  '["Own dignity present?","Peregrine?"]',
  '[["Domicile","No"],["Exaltation","No"],["Triplicity","No"],["Own Bound / Term","No"],["Own Face / Decan","No"],["None of the above","Yes, subject to the historical dignity scheme being used"]]',
  60,'reviewed','Preserves the corrected definition: another planet’s bound or face does not dignify the occupying planet.'
FROM terms WHERE slug='peregrine';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'debility-distinction','Peregrine, detriment and fall compared',
  'All can describe difficult essential condition, but they are technically different.',
  '["Term","Definition"]',
  '[["Peregrine","No recognized essential dignity of its own at the degree"],["Detriment / Exile","Occupies the sign opposite its domicile"],["Fall","Occupies the sign opposite its exaltation"]]',
  70,'reviewed','Technical distinction only; historical authors can weigh these states differently.'
FROM terms WHERE slug='peregrine';
