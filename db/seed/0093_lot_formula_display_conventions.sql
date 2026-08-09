-- Standardize how formulas are presented in the public encyclopedia.
--
-- A formula is a property of a transmitted source/variant, not necessarily of the
-- normalized term in every tradition. Keep day/night reversals and author variants
-- explicit rather than silently flattening them.

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-notation','How lot formulas are written',
       'Lot formulas in this encyclopedia use compact zodiacal notation. “Asc + B - A” means: measure the zodiacal arc from A to B in zodiacal order, then project the same arc from the Ascendant. When a source reverses the factors by sect, separate day and night formulas are shown. When a source uses the same extraction in day and night charts, that is stated explicitly. A formula shown on a source-specific entry belongs to that transmitted tradition and should not be assumed to be universal.',
       5,'reviewed',
       'Editorial convention for the formula sections used throughout the lot corpus.'
FROM terms WHERE slug='lot';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'formula-variants','Formula variants',
       'Different authors can preserve different formulas under similar translated names, and different names can sometimes produce the same degree. The lexicon therefore records formulas together with their source identity. Similar meanings alone are not enough to merge two lots, and identical numerical results do not by themselves prove that two historically named lots are the same concept.',
       15,'reviewed',
       'Cross-source normalization rule made visible to readers.'
FROM terms WHERE slug='lot';
