-- Encyclopedia conversion batch: house/place structure.
-- Stable structural doctrine is synthesized here; topical judgment workflows remain in source accounts.

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The twelve houses, or places, divide an astrological figure into twelve sectors used to organize planetary position and topics. Across the historical corpus they are also grouped by angular relation into four angles, four succedents and four cadents. This structural grouping concerns position and strength; the detailed topics assigned to each house remain historically layered and source-attributed.',
  'reviewed','Structural overview only; do not convert house-by-house judgment recipes into article procedure.'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Structural organization',
  'The four angles are the first, tenth, seventh and fourth places. Each angle begins a quadrant. The following place is succedent and the next is cadent, producing four repeating three-place sequences around the figure. This is why the second, fifth, eighth and eleventh are succedent, while the third, sixth, ninth and twelfth are cadent.',10,'reviewed'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'strength','House position and accidental strength',
  'Angular, succedent and cadent position is one of the principal accidental-condition frameworks. Angularity generally increases a planet’s ability to act, succedency gives an intermediate condition, and cadency tends to reduce immediate effectiveness. This positional strength is distinct from essential dignity: a planet can be essentially dignified yet cadent, or essentially debilitated yet angular.',30,'reviewed'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'house-structure','The twelve-place structural sequence',
  'The table shows angular class only. Topical meanings are not reduced to this classification.',
  '["Place","Structural class","Relation to the preceding angle"]',
  '[["1st","Angle / Cardine","Angle"],["2nd","Succedent","Follows 1st"],["3rd","Cadent","Falls away before 4th"],["4th","Angle / Cardine","Angle"],["5th","Succedent","Follows 4th"],["6th","Cadent","Falls away before 7th"],["7th","Angle / Cardine","Angle"],["8th","Succedent","Follows 7th"],["9th","Cadent","Falls away before 10th"],["10th","Angle / Cardine","Angle"],["11th","Succedent","Follows 10th"],["12th","Cadent","Falls away before 1st"]]',
  20,'reviewed','Reference structure; source-specific house topics remain elsewhere.'
FROM terms WHERE slug='twelve-places';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An angle, or cardine, is one of the four principal pivots of a figure: the first, tenth, seventh and fourth places. These positions anchor the house quadrants and are ordinarily treated as the strongest house positions for planetary action.',
  'reviewed','Structural article.'
FROM terms WHERE slug='cardine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four angles',
  'The first place is the eastern angle or Ascendant, the tenth the upper or culminating angle, the seventh the western angle, and the fourth the lower angle. Their different topics are not interchangeable, but structurally all four are pivots.',10,'reviewed'
FROM terms WHERE slug='cardine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'strength','Why angularity matters',
  'Angular position is an accidental condition describing a planet’s capacity to manifest or act in the figure. It should not be confused with essential dignity, planetary nature, sect or topical suitability.',20,'reviewed'
FROM terms WHERE slug='cardine';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A succedent house or place immediately follows an angle within one of the four house quadrants. The second, fifth, eighth and eleventh places are succedent and are generally treated as intermediate in positional strength between angles and cadents.',
  'reviewed','Structural article.'
FROM terms WHERE slug='succedent-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four succedent places',
  'The succedent places are 2, 5, 8 and 11. Each follows one of the four angles: the second follows the first, the fifth follows the fourth, the eighth follows the seventh, and the eleventh follows the tenth.',10,'reviewed'
FROM terms WHERE slug='succedent-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'strength','Intermediate positional strength',
  'Succedency preserves more positional effectiveness than cadency but ordinarily less than angularity. This is a general structural comparison rather than a complete interpretation of any particular house.',20,'reviewed'
FROM terms WHERE slug='succedent-place';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A cadent house or place falls away from an angle in the repeating three-place structure of the house quadrants. The third, sixth, ninth and twelfth places are cadent and are generally associated with reduced immediate capacity to act, though individual cadent houses can remain highly important for their own topics.',
  'reviewed','Structural article; topical exceptions preserved.'
FROM terms WHERE slug='cadent-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'members','The four cadent places',
  'The cadent places are 3, 6, 9 and 12. They complete each three-place sequence before the next angle is reached.',10,'reviewed'
FROM terms WHERE slug='cadent-place';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Cadency is not topical insignificance',
  'Cadency describes positional strength, not whether a topic matters. The ninth house, for example, remains the primary place for its own topics even though it is cadent. Structural weakness and topical relevance are separate questions.',20,'reviewed'
FROM terms WHERE slug='cadent-place';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A derived house is a house counted from another house that temporarily serves as the first place for a person or topic. The technique preserves the ordinary sequence of houses but changes the reference point.',
  'reviewed','Definition-level mechanics only; source-specific derived-house judgment recipes remain in source accounts.'
FROM terms WHERE slug='derived-house';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'mechanics','How derivation works',
  'If a house signifies the person or matter being examined, that house can be treated as the temporary first house for the derived sequence. The next house becomes that person’s second, the following house their third, and so on around the figure.',10,'reviewed'
FROM terms WHERE slug='derived-house';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','A change of reference, not a new zodiac',
  'Derived houses do not alter the zodiac, planetary positions or original house numbering. They are a relational counting device layered onto the same figure.',20,'reviewed'
FROM terms WHERE slug='derived-house';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Places for Dealings is a source-specific Antiochan classification of houses in which planetary dealings or interactions are said to occur. It is not a universal synonym for angular or strong houses and should remain tied to the historical source that defines it.',
  'reviewed','Source-specific classification.'
FROM terms WHERE slug='places-for-dealings';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','A source-specific house grouping',
  'The classification groups selected pivots and other places according to Antiochus’ doctrine of dealings. Because its membership does not simply reproduce the angle–succedent–cadent hierarchy, it should be read as an additional historical classification rather than merged with ordinary house strength.',10,'reviewed'
FROM terms WHERE slug='places-for-dealings';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Places without Dealings is Antiochus’ contrasting class for places in which the relevant planetary dealings are said not to occur. Its meaning depends on the paired concept Places for Dealings and belongs to that source-specific house taxonomy.',
  'reviewed','Source-specific classification.'
FROM terms WHERE slug='places-without-dealings';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','Relation to Places for Dealings',
  'The two terms form a historical contrast within one authorial system. They should not be generalized into a universal good-house/bad-house distinction or substituted for the standard angular, succedent and cadent classes.',10,'reviewed'
FROM terms WHERE slug='places-without-dealings';
