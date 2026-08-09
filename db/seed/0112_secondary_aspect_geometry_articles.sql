-- Encyclopedia conversion batch: secondary aspect geometry and contact classes.

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A partile aspect is an aspect in which the two bodies occupy the same numerical degree within their respective signs, producing a closer degree-level correspondence than a broader sign-based or orb-based contact.',
  'reviewed','Preserve source-specific exactness rules in historical accounts.'
FROM terms WHERE slug='partile-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'recognition','Degree-level correspondence',
  'Partile describes closeness by degree: for example, planets at 12° of signs that form an aspect are partile because they share the same degree number. The term therefore concerns exactness within the aspect relationship rather than the type of aspect itself.',10,'reviewed'
FROM terms WHERE slug='partile-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','Partile versus platick',
  'Partile contact is conventionally contrasted with platick contact, where the planets are within the operative allowance of an aspect without sharing the same degree number. Historical authors can differ in how strictly they use these labels.',20,'reviewed'
FROM terms WHERE slug='partile-aspect';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A platick aspect is a broader operative aspect in which planets are within the accepted orb or allowance of contact without forming the closer same-degree correspondence called partile.',
  'reviewed','Do not universalize one orb table across authors.'
FROM terms WHERE slug='platick-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'recognition','Operative contact within allowance',
  'Platick contact depends on the accepted orb or moiety system of the tradition or author being used. It therefore cannot be reduced to one universal number of degrees for every planet and every source.',10,'reviewed'
FROM terms WHERE slug='platick-aspect';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','Platick versus partile',
  'Both terms can describe the same basic aspect type. The distinction concerns closeness: partile is the tighter degree-level correspondence, while platick covers the wider operative contact.',20,'reviewed'
FROM terms WHERE slug='platick-aspect';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An antiscion is the reflected zodiacal point of a position across the solstitial axis. Two positions related by antiscia have complementary distances from the Cancer–Capricorn solstitial line and were treated by traditional authors as possessing a hidden or reflected correspondence.',
  'reviewed','Geometric definition first; interpretive force remains source-specific.'
FROM terms WHERE slug='antiscion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Reflection across the solstitial axis',
  'The antiscion of a zodiacal degree is found by reflecting it across the 0° Cancer–0° Capricorn axis. The resulting pair shares a complementary solar-light relation in the tropical zodiac. This is a reflection relation, not one of the ordinary Ptolemaic aspects.',10,'reviewed'
FROM terms WHERE slug='antiscion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Antiscion and ordinary aspect',
  'A pair can be connected by antiscion even when it does not form an ordinary sextile, square, trine or opposition. The relation therefore belongs to a separate geometric system and should not be renamed as an aspect merely because some authors assign it operative force.',20,'reviewed'
FROM terms WHERE slug='antiscion';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A contra-antiscion is the point opposite an antiscion, producing a reflected relation across the equinoctial rather than the ordinary direct zodiacal opposition framework. It is the complementary counterpart to the antiscion relation.',
  'reviewed','Keep geometry distinct from source-specific delineation.'
FROM terms WHERE slug='contra-antiscion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Relation to the antiscion point',
  'After locating the antiscion of a degree, its zodiacal opposite is the contra-antiscion. This gives a second reflected point tied to the same solstitial geometry.',10,'reviewed'
FROM terms WHERE slug='contra-antiscion';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'contrast','Antiscion versus contra-antiscion',
  'The two terms form a paired reflection system. They should not be collapsed into ordinary conjunction and opposition because their defining logic comes from reflected zodiacal position rather than direct angular distance alone.',20,'reviewed'
FROM terms WHERE slug='contra-antiscion';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Inconjunct describes zodiacal positions that do not behold one another through the principal whole-sign aspect relations. In traditional sign geometry the term is closely associated with aversion: the signs lack one of the standard configured relationships used for seeing or witnessing.',
  'reviewed','Do not replace historical aversion doctrine with the later 150° minor-aspect concept alone.'
FROM terms WHERE slug='inconjunct';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Absence of a principal sign configuration',
  'The traditional concept is broader than the later habit of treating “quincunx” as simply a 150° aspect. Whole signs that are adjacent or five signs apart can be inconjunct because they do not form sextile, square, trine or opposition by sign.',10,'reviewed'
FROM terms WHERE slug='inconjunct';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'aversion','Relation to aversion',
  'Historical authors often describe inconjunct signs as not seeing or not beholding one another. This language belongs to the visual geometry of traditional aspect doctrine and helps explain why inconjunct is not merely another minor aspect of the same class as sextile or trine.',20,'reviewed'
FROM terms WHERE slug='inconjunct';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Configuration is a broad traditional term for a geometrical relationship or arrangement between planets, signs or points. Depending on the author it can include ordinary aspects, conjunctional relations and other structured forms of zodiacal correspondence.',
  'reviewed','Broad umbrella term; preserve author-specific scope.'
FROM terms WHERE slug='configuration';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Broader than one exact aspect',
  'Configuration should not automatically be translated as a single exact aspect. In historical texts it can function as a general category for bodies placed in a recognized geometrical relation, with the exact included relations determined by the source.',10,'reviewed'
FROM terms WHERE slug='configuration';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'reading','Read the source context',
  'Because the word is broad, its value in the lexicon is partly disambiguating: when an author says planets are configured, the surrounding passage must establish whether this means a specific aspect, a sign relation, bodily conjunction or another recognized geometry.',20,'reviewed'
FROM terms WHERE slug='configuration';
