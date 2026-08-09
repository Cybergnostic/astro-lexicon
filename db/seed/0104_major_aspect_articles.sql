-- Encyclopedia conversion batch: major aspect types.
-- Converts established canonical geometry into reader-facing articles.
-- Historical source accounts remain separate below each article.

-- CONJUNCTION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A conjunction is the bodily meeting of two planets in the same region of the zodiac. Traditional authors usually discuss it alongside the aspects because it creates direct planetary contact, even though geometrically it is a co-location rather than a ray cast across an angular division of the zodiac.',
  'reviewed','Canonical aspect-family conversion; source-specific orb and perfection rules remain in historical accounts.'
FROM terms WHERE slug='conjunction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Geometry and contact',
  'At exact conjunction two planets occupy the same zodiacal longitude. Before exact contact they may be applying; after exact contact they may be separating. The conjunction therefore has to be read together with real planetary motion rather than from static zodiacal order alone.',10,'reviewed'
FROM terms WHERE slug='conjunction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'quality','No fixed benefic or malefic quality',
  'Unlike the trine, sextile, square and opposition, the conjunction does not have one intrinsic harmonious or contrary character. Its quality depends heavily on the planets involved, their condition, reception, sect and the topic under judgment.',20,'reviewed'
FROM terms WHERE slug='conjunction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'orbs','Exactness and orb',
  'A conjunction can be operative before exact perfection and can remain relevant for a period after separation. Historical authors use different orb conventions, so the encyclopedia keeps numerical limits source-specific rather than imposing one universal table.',30,'reviewed'
FROM terms WHERE slug='conjunction';

-- SEXTILE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A sextile is the traditional aspect formed by a separation of two signs, or approximately sixty degrees. It divides the zodiac into six parts and is conventionally classified as a harmonious or friendly aspect, weaker than the trine but capable of joining planets constructively.',
  'reviewed','Canonical aspect-family conversion.'
FROM terms WHERE slug='sextile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Sixty-degree relationship',
  'The sextile corresponds to one sixth of the zodiacal circle. In sign-based aspect doctrine, signs two places apart form a sextile relation; in degree-based judgment the exactness and orb of the planets refine the contact.',10,'reviewed'
FROM terms WHERE slug='sextile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'quality','Traditional quality',
  'Traditional authors usually treat the sextile as a favorable or cooperative configuration. That general quality does not override the actual condition of the planets: afflicted planets, lack of reception, prohibition or other impediments can materially alter what the contact produces.',20,'reviewed'
FROM terms WHERE slug='sextile';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'mechanics','Application, reception and direction',
  'A sextile can be applying or separating, dexter or sinister, received or unreceived. These are independent technical dimensions and should not be collapsed into the aspect name itself.',30,'reviewed'
FROM terms WHERE slug='sextile';

-- SQUARE / QUARTILE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A square, traditionally also called a quartile, is the aspect formed by a quarter of the zodiacal circle, approximately ninety degrees. It is a contrary or difficult aspect in the traditional scheme, but its actual outcome still depends on the planets, reception, dignity and surrounding configuration.',
  'reviewed','Canonical aspect-family conversion; quartile retained as historical terminology where present.'
FROM terms WHERE slug='square';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Quarter-circle relationship',
  'The square divides the zodiac into four equal parts. In sign-based doctrine, signs three places apart form a square relation; degree-based judgment then determines exactness, application, separation and orb.',10,'reviewed'
FROM terms WHERE slug='square';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'quality','Difficulty is not automatic failure',
  'The square traditionally signifies tension, obstruction or contrary action, but it is not synonymous with impossibility. Reception, strong planetary condition and other testimonies can permit a matter to perfect through a square, while badly conditioned planets can make the same geometry more troublesome.',20,'reviewed'
FROM terms WHERE slug='square';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'name','Square and quartile',
  'Quartile reflects the older language of dividing the circle into quarters. Square is the usual modern English label for the same principal aspect. Source accounts may prefer one term or the other.',30,'reviewed'
FROM terms WHERE slug='square';

-- TRINE
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A trine is the traditional aspect formed by one third of the zodiacal circle, approximately 120 degrees. It links signs of the same elemental triplicity and is conventionally the strongest of the harmonious aspects.',
  'reviewed','Canonical aspect-family conversion.'
FROM terms WHERE slug='trine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','One-third of the circle',
  'The trine divides the zodiac into three equal parts. In sign-based doctrine, signs four places apart form a trine and therefore belong to the same elemental triplicity.',10,'reviewed'
FROM terms WHERE slug='trine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'quality','Traditional harmony',
  'Traditional authors generally regard the trine as a naturally cooperative and facilitating relation. This does not make every trine beneficial in practice: the nature and condition of the planets determine what is being facilitated and how effectively.',20,'reviewed'
FROM terms WHERE slug='trine';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'triplicity','Relation to triplicity',
  'Because trining signs belong to the same elemental triplicity, the geometry is structurally connected with the four elemental groups. Triplicity rulership, however, is a separate dignity doctrine and should not be confused with the trine aspect itself.',30,'reviewed'
FROM terms WHERE slug='trine';

-- OPPOSITION
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An opposition is the aspect formed by half of the zodiacal circle, approximately 180 degrees. The planets face one another across the zodiac, producing the strongest principal contrary aspect in the traditional scheme.',
  'reviewed','Canonical aspect-family conversion.'
FROM terms WHERE slug='opposition';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Half-circle relationship',
  'Opposition divides the zodiac into two equal halves. Opposite signs share the same modality but belong to complementary or contrary positions across the circle.',10,'reviewed'
FROM terms WHERE slug='opposition';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'quality','Contrariety and confrontation',
  'Traditional authors generally associate opposition with separation, confrontation or incompatibility. Yet the geometry alone is not the whole judgment: reception, dignity, sect, application and the planets involved determine how the opposition actually operates.',20,'reviewed'
FROM terms WHERE slug='opposition';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinct','Do not confuse with historical “natural opposition”',
  'Some historical sources use expressions such as natural opposition for special non-aspecting sign relations based on ascensional or daylight correspondences. Those are separate canonical concepts and should not be confused with the ordinary 180-degree aspect.',30,'reviewed'
FROM terms WHERE slug='opposition';
