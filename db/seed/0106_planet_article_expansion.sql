-- Encyclopedia conversion batch: deepen the seven traditional planet articles.
-- Existing intros/nature sections are retained; this seed adds structural sections that
-- make the pages comparable in depth to the newly converted zodiac entries.

-- SATURN
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Sect and planetary class',
  'Saturn belongs to the diurnal sect and is traditionally classed as a malefic. Sect modifies how its extreme cold and dryness are expressed: Saturn is generally more moderated in a day chart and more contrary to the prevailing environment in a night chart. Malefic classification describes natural tendency, not an automatic verdict on every Saturn placement.',20,'reviewed'
FROM terms WHERE slug='saturn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domiciles and exaltation',
  'Saturn rules Capricorn and Aquarius and is exalted in Libra in the standard traditional dignity scheme. Cancer and Leo are its detriments, opposite its domiciles, while Aries is its fall, opposite Libra. Smaller dignities such as triplicity, term and face depend on the relevant sign and degree.',30,'reviewed'
FROM terms WHERE slug='saturn';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'condition-layers','Natural nature versus chart condition',
  'Saturn’s natural classification is only one layer. Essential dignity, angularity, motion, speed, solar phase, sect conformity, reception and aspects can strengthen, weaken or redirect its action. A traditional judgment therefore does not read the word malefic as a complete interpretation.',40,'reviewed'
FROM terms WHERE slug='saturn';

-- JUPITER
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Sect and planetary class',
  'Jupiter belongs to the diurnal sect and is traditionally the greater benefic. Its moderately hot and moist nature is associated with increase, joining and preservation. Benefic classification indicates a natural tendency to support or improve, but the actual result depends on Jupiter’s condition and the matter it signifies.',20,'reviewed'
FROM terms WHERE slug='jupiter';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domiciles and exaltation',
  'Jupiter rules Sagittarius and Pisces and is exalted in Cancer. Gemini and Virgo are its detriments, opposite its domiciles, while Capricorn is its fall. Triplicity, term and face add smaller degree- and sect-sensitive dignities.',30,'reviewed'
FROM terms WHERE slug='jupiter';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'condition-layers','Benefic nature and effective power',
  'A dignified and accidentally strong Jupiter can express its preserving and expansive nature with considerable effectiveness. A cadent, retrograde, combust or otherwise impeded Jupiter may remain naturally benefic while lacking the power or freedom to produce the expected benefit fully.',40,'reviewed'
FROM terms WHERE slug='jupiter';

-- MARS
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Sect and planetary class',
  'Mars belongs to the nocturnal sect and is traditionally the lesser malefic. Its extreme heat and dryness produce separation, cutting, urgency and conflict, but the nocturnal environment is considered more congenial to that nature than the diurnal one. Sect therefore moderates rather than abolishes Mars’s natural character.',20,'reviewed'
FROM terms WHERE slug='mars';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domiciles and exaltation',
  'Mars rules Aries and Scorpio and is exalted in Capricorn. Libra and Taurus are its detriments, opposite its domiciles, while Cancer is its fall. Smaller dignities vary by sign, degree and sect-sensitive table.',30,'reviewed'
FROM terms WHERE slug='mars';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'condition-layers','Constructive and destructive expressions',
  'The same hot, dry and separating nature can signify courage, decisive action and skilled cutting when well directed, or violence, rupture and excessive conflict when corrupted. Traditional interpretation explains the difference through dignity, sect, house strength, reception, aspects and other conditions rather than by inventing two unrelated Mars archetypes.',40,'reviewed'
FROM terms WHERE slug='mars';

-- SUN
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','The principal diurnal luminary',
  'The Sun defines the sect of the chart by its position relative to the horizon: above the horizon produces a day chart and below the horizon a night chart. It is itself the principal diurnal luminary and supplies the reference point for many planetary phase and visibility conditions.',20,'reviewed'
FROM terms WHERE slug='sun';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domicile and exaltation',
  'The Sun has a single domicile, Leo, and is exalted in Aries. Aquarius is its detriment and Libra its fall. Unlike the five planets with two domiciles, each luminary rules one sign.',30,'reviewed'
FROM terms WHERE slug='sun';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'solar-relations','The Sun as a condition-maker',
  'A planet’s angular distance and phase relative to the Sun can create major accidental conditions such as oriental or occidental phase, under-the-beams status, combustion and cazimi. The Sun therefore functions both as a significator in its own right and as a reference body that changes the condition of other planets.',40,'reviewed'
FROM terms WHERE slug='sun';

-- VENUS
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Sect and planetary class',
  'Venus belongs to the nocturnal sect and is traditionally the lesser benefic. Its cold and moist nature is associated with joining, attraction, pleasure, agreement and generation. As with Jupiter, benefic status describes a natural tendency rather than a guaranteed favorable result.',20,'reviewed'
FROM terms WHERE slug='venus';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domiciles and exaltation',
  'Venus rules Taurus and Libra and is exalted in Pisces. Scorpio and Aries are its detriments, while Virgo is its fall. Triplicity, term and face can supply additional smaller dignities according to sign, sect and degree.',30,'reviewed'
FROM terms WHERE slug='venus';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'phase','Venus and the Sun',
  'As an inferior planet Venus never travels very far from the Sun. Its eastern or western appearance, visibility, stations and proximity to the Sun therefore form an important part of its accidental condition and should be read separately from its essential dignity.',40,'reviewed'
FROM terms WHERE slug='venus';

-- MERCURY
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','Variable sect and classification',
  'Mercury is exceptional because several traditional classifications change with condition. Its relation to the Sun can affect whether it participates in the diurnal or nocturnal sect, and its associations with other planets can modify qualities such as gender or benefic/malefic tendency. Variability is therefore part of Mercury’s technical definition.',30,'reviewed'
FROM terms WHERE slug='mercury';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domiciles and exaltation',
  'Mercury rules Gemini and Virgo and is also exalted in Virgo in the standard medieval scheme. Sagittarius and Pisces are its detriments, while Pisces is its fall. Smaller dignities further distinguish individual degrees.',40,'reviewed'
FROM terms WHERE slug='mercury';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'phase-motion','Phase, speed and motion',
  'Because Mercury remains close to the Sun and changes speed and direction rapidly, oriental or occidental phase, visibility, stations, retrogradation and speed are especially important to its condition. These factors can materially modify the operation of Mercury’s significations without changing its basic identity as Mercury.',50,'reviewed'
FROM terms WHERE slug='mercury';

-- MOON
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sect','The principal nocturnal luminary',
  'The Moon belongs to the nocturnal sect and is the principal night luminary. Because it is the fastest traditional planet, its changing contacts often provide a sequence through which a matter develops, especially in horary and electional practice.',30,'reviewed'
FROM terms WHERE slug='moon';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'dignities','Domicile and exaltation',
  'The Moon has a single domicile, Cancer, and is exalted in Taurus. Capricorn is its detriment and Scorpio its fall. As with the Sun, the Moon rules one sign rather than two.',40,'reviewed'
FROM terms WHERE slug='moon';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sequence','Application, separation and lunar sequence',
  'The Moon’s speed makes application and separation especially visible in its cycle. Traditional judgment often distinguishes the contact from which the Moon has separated from the next planet to which it applies, so lunar interpretation frequently concerns sequence and transfer rather than a static list of aspects.',50,'reviewed'
FROM terms WHERE slug='moon';
