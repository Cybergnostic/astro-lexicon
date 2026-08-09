-- Encyclopedia conversion batch: major predictive techniques and time-lord vocabulary.
-- This is a term-level reference pass, not a procedural forecasting manual. It explains
-- what each named technique is, what structure it operates on, and what must remain
-- source-specific.

-- FIRDARIA
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Firdaria is a medieval time-lord system that divides life into successive planetary periods and subperiods. A planet becomes the principal chronological ruler for a span of years, while subperiods introduce a second planetary ruler within the larger period.',
  'reviewed','Technique definition only; detailed judgment rules remain source-specific.'
FROM terms WHERE slug='firdaria';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'structure','Period and subperiod structure',
  'The system assigns major periods to the seven traditional planets and, in some traditions, the lunar nodes. Within a major period, smaller subperiods distribute rulership among additional planets. The exact sequence and treatment of the nodes can vary by tradition and by whether the nativity is diurnal or nocturnal.',10,'reviewed'
FROM terms WHERE slug='firdaria';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'interpretive-scope','What the time lord does',
  'A firdar ruler does not replace the natal chart. It activates the natal condition, rulerships, houses and significations of the planet that holds the period. The technique therefore supplies chronology, while the natal figure supplies the underlying promise and condition.',20,'reviewed'
FROM terms WHERE slug='firdaria';

-- PTOLEMAIC AGES
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Ptolemaic Ages is a life-stage doctrine that assigns successive portions of the human lifespan to the traditional planets in an order associated with the development and decline of bodily and psychological faculties.',
  'reviewed','Historical life-stage doctrine; not a lifespan-prediction procedure.'
FROM terms WHERE slug='ptolemaic-ages';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'sequence','Planetary sequence of life stages',
  'The doctrine proceeds through planetary rulers associated with successive stages of life, beginning with the Moon and continuing through Mercury, Venus, the Sun, Mars, Jupiter and Saturn. The system is descriptive of age-phases rather than a calculation of how long a particular person will live.',10,'reviewed'
FROM terms WHERE slug='ptolemaic-ages';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Distinction from time-lord systems',
  'Ptolemaic Ages should not be confused with firdaria, profections or primary directions. Those techniques assign chart-specific chronological rulers or directed contacts, whereas the ages describe a broad planetary sequence of human development.',20,'reviewed'
FROM terms WHERE slug='ptolemaic-ages';

-- PROFECTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Profection is a time-lord technique that advances a significator or reference point through the zodiac at a regular interval, most commonly one sign per year in annual profections. The sign reached by the profection and its ruler become chronologically important for the period.',
  'reviewed','Defines the named technique without importing a topic-judgment workflow.'
FROM terms WHERE slug='profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'mechanism','Basic mechanism',
  'In the common annual form, the Ascendant or another relevant point advances one whole sign for each completed year of life. Because twelve signs are used, the sequence repeats every twelve years. Other profection intervals and starting points exist and should be attributed to their sources rather than folded into one universal rule.',10,'reviewed'
FROM terms WHERE slug='profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'time-lord','Profected sign and ruler',
  'The sign reached by the profection is the profected sign. Its domicile ruler is commonly treated as a time lord for the period, often called the Lord of the Year in annual work. The ruler’s natal condition remains fundamental; profection identifies activation rather than rewriting the natal chart.',20,'reviewed'
FROM terms WHERE slug='profection';

-- ANNUAL PROFECTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Annual Profection is the yearly form of profection in which the reference point advances one zodiacal sign per year. It is one of the simplest traditional methods for assigning a yearly time lord.',
  'reviewed','Keep annual mechanism distinct from broader profection doctrine.'
FROM terms WHERE slug='annual-profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'cycle','Twelve-year cycle',
  'Advancing one sign per year produces a repeating twelve-year cycle. If the Ascendant is the starting point, the natal first sign is active in the first year, the second sign in the next, and so on until the cycle returns to the first sign.',10,'reviewed'
FROM terms WHERE slug='annual-profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'lord-year','Lord of the Year',
  'The domicile ruler of the profected sign is commonly designated the Lord of the Year. Its natal placement, condition and rulerships are then chronologically emphasized, while additional annual techniques may provide further context.',20,'reviewed'
FROM terms WHERE slug='annual-profection';

-- MONTHLY PROFECTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Monthly Profection is a shorter profection cycle used to subdivide an annual period into successive monthly activations. It applies the same general idea of regular zodiacal advancement at a finer chronological scale.',
  'reviewed','Do not universalize one monthly conversion rule where historical schools differ.'
FROM terms WHERE slug='monthly-profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'relation','Relation to annual profection',
  'Monthly profections operate inside a broader yearly context rather than replacing it. The annual profection establishes the larger time-lord background, while a monthly profection can identify a shorter interval of emphasis.',10,'reviewed'
FROM terms WHERE slug='monthly-profection';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'variants','Historical variants',
  'Premodern authors do not all subdivide the year in exactly the same way. The encyclopedia therefore treats the term as a family of monthly profection procedures and leaves exact conversion rules attached to their historical witnesses.',20,'reviewed'
FROM terms WHERE slug='monthly-profection';

-- PROFECTED SIGN
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Profected Sign is the zodiacal sign reached by a profection at the time under consideration. It provides the current zodiacal place of the profected reference point and identifies the ruler that becomes chronologically active.',
  'reviewed','A result of profection, not a separate forecasting system.'
FROM terms WHERE slug='profected-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'function','Function in the technique',
  'The profected sign identifies which natal sign and house topics are activated at that stage of the cycle. Its domicile ruler is normally the most immediate planetary time lord derived from the profection.',10,'reviewed'
FROM terms WHERE slug='profected-sign';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Sign versus ruler',
  'The profected sign and its ruler are related but not interchangeable. The sign identifies the activated zodiacal place; the ruler is the planet charged with administering that activation according to its natal condition.',20,'reviewed'
FROM terms WHERE slug='profected-sign';

-- LORD OF THE YEAR
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Lord of the Year is a traditional title for the planet given principal chronological authority over a particular year by a specified annual technique. In annual profections it is commonly the ruler of the profected sign.',
  'reviewed','The title can be assigned by different annual systems; always state the method.'
FROM terms WHERE slug='lord-of-year';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'method-dependence','A title, not one universal calculation',
  'Different traditional authors and techniques can use annual rulers in different ways. The phrase Lord of the Year therefore names a role. A complete citation should state how that ruler was obtained rather than assuming every author uses the same procedure.',10,'reviewed'
FROM terms WHERE slug='lord-of-year';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'natal-condition','Natal condition remains operative',
  'Becoming Lord of the Year activates rather than replaces the planet’s natal state. Dignity, house position, sect, aspects and natal rulerships remain the foundation for understanding what the annual activation can express.',20,'reviewed'
FROM terms WHERE slug='lord-of-year';

-- PRIMARY DIRECTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Primary Direction is a predictive technique based on the apparent daily rotation of the celestial sphere. Significant natal points are directed to contacts with other points, and the measured arc is converted into symbolic time.',
  'reviewed','Technique definition only; no operational lifespan or dangerous-event procedure.'
FROM terms WHERE slug='primary-direction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'geometry','Directional geometry',
  'Primary directions use mundane or equatorial relationships generated by the rotation of the sphere rather than simply adding zodiacal longitude. Historical systems differ in their choice of pole, key, latitude treatment and whether directions are mundane or zodiacal.',10,'reviewed'
FROM terms WHERE slug='primary-direction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'roles','Significator and promissor',
  'The directed point receiving a contact is commonly called the significator, while the point whose influence is brought to it is called the promissor. These are technical roles inside the direction and should not be confused with the broader use of significator elsewhere in astrology.',20,'reviewed'
FROM terms WHERE slug='primary-direction';

-- PROMISSOR
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Promissor is the directing factor in primary-direction terminology: the planet, point or ray whose influence is carried by direction toward a significator.',
  'reviewed','Directional role; source-specific direction systems remain separate.'
FROM terms WHERE slug='promissor';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'pair','Promissor and significator',
  'In a primary direction the promissor supplies the directed influence and the significator is the point to which that influence is brought. The same planet can occupy different roles in different directions.',10,'reviewed'
FROM terms WHERE slug='promissor';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','Role-specific terminology',
  'Promissor should not be treated as a permanent property of a planet. It is a role defined by a particular direction, just as a planet may be a significator in one directional contact and a promissor in another.',20,'reviewed'
FROM terms WHERE slug='promissor';

-- DISTRIBUTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Distribution is a directional time-lord procedure in which a directed point moves through successive bounds or terms, making the ruler of the occupied bound the distributor for that interval.',
  'reviewed','Named timing technique; exact keys and directional procedures stay source-specific.'
FROM terms WHERE slug='distribution';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'mechanism','Movement through the bounds',
  'As the directed significator advances, it enters successive planetary bounds. The ruler of each bound governs the corresponding stretch of directed time and is called the distributor.',10,'reviewed'
FROM terms WHERE slug='distribution';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'participation','Distributor and participator',
  'A planet forming an operative aspect or other recognized contact with the directed significator during a distributor’s period may be treated as a participator, modifying the period without replacing the distributor’s basic rulership.',20,'reviewed'
FROM terms WHERE slug='distribution';

-- DISTRIBUTOR
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Distributor is the planet ruling the bound or term through which a directed significator is passing in the technique of distribution. It acts as the principal time lord for that portion of the direction.',
  'reviewed','Role within distributions, not a generic planetary title.'
FROM terms WHERE slug='distributor';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'selection','How the distributor is selected',
  'The distributor is determined by the bound occupied by the directed significator. When the significator crosses into the next bound, rulership passes to the ruler of that new bound.',10,'reviewed'
FROM terms WHERE slug='distributor';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'condition','Reading the ruler',
  'The distributor’s natal condition and significations provide the underlying quality of its period. Other contacts can participate in the period, but they do not erase the distinction between distributor and participator.',20,'reviewed'
FROM terms WHERE slug='distributor';

-- PARTICIPATOR
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Participator is a secondary planet that joins or modifies a period governed by a distributor through a relevant directed contact. It participates in the period without becoming the bound ruler itself.',
  'reviewed','Directional role within distribution doctrine.'
FROM terms WHERE slug='participator';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'role','Secondary participation',
  'The participator adds its nature and natal significations to a period whose main chronological ruler is the distributor. This creates a layered time-lord structure rather than a replacement of one ruler by another.',10,'reviewed'
FROM terms WHERE slug='participator';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Not the distributor',
  'The distributor is selected from the bound occupied by the directed significator; the participator is introduced through an additional contact. Keeping those roles separate prevents a common collapse of two different pieces of directional terminology.',20,'reviewed'
FROM terms WHERE slug='participator';

-- SOLAR RETURN
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Solar Return or Solar Revolution is a chart erected for the moment when the Sun returns to its natal zodiacal longitude, usually near the native’s birthday. It describes a yearly period and is traditionally read in relation to the natal figure rather than as an independent nativity.',
  'reviewed','Annual chart definition; detailed synthesis procedure remains source-specific.'
FROM terms WHERE slug='solar-return';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'moment','The return moment',
  'The chart is calculated for the exact recurrence of the natal solar longitude, not merely for the civil birthday. Because the return moment can occur before or after the calendar birth time, the chart must be calculated astronomically.',10,'reviewed'
FROM terms WHERE slug='solar-return';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'context','Annual chart in natal context',
  'Traditional authors commonly compare the revolution with the natal chart and other annual rulers. The return therefore supplies an annual configuration, while natal promise and time-lord activation provide the larger context.',20,'reviewed'
FROM terms WHERE slug='solar-return';

-- LUNAR RETURN
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Lunar Return or Lunar Revolution is a chart erected for the moment when the Moon returns to its natal zodiacal longitude. It provides a shorter recurring cycle than the solar return and is generally interpreted within a broader annual context.',
  'reviewed','Monthly-scale return chart; do not treat as independent from annual/natal context.'
FROM terms WHERE slug='lunar-return';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'cycle','Recurring lunar cycle',
  'Because the Moon completes the zodiac in roughly a month, lunar returns recur much more frequently than solar returns. The exact interval varies because the Moon’s motion is not uniform.',10,'reviewed'
FROM terms WHERE slug='lunar-return';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'hierarchy','Place in the predictive hierarchy',
  'A lunar return is usually subordinate to longer-term indicators such as the natal chart, annual time lords and the solar return. It can refine timing or describe shorter-lived configurations without replacing those larger frameworks.',20,'reviewed'
FROM terms WHERE slug='lunar-return';

-- SOLAR DIRECTION
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Solar Direction is a symbolic directing method in which chart positions are advanced according to the Sun’s motion or an annual solar arc. Historical methods using this name are not completely uniform and should be distinguished from primary directions.',
  'reviewed','Umbrella entry pending fuller source-by-source reconciliation of variants.'
FROM terms WHERE slug='solar-direction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'principle','Solar arc principle',
  'The common idea is to use a solar measure to advance one or more natal positions symbolically through the zodiac. The specific arc, key and points directed depend on the author or school.',10,'reviewed'
FROM terms WHERE slug='solar-direction';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'distinction','Distinction from primary direction',
  'Primary directions arise from the rotation of the celestial sphere and use directional geometry; solar directions use a solar-derived symbolic arc. The two techniques can both be called directions but should not be conflated.',20,'reviewed'
FROM terms WHERE slug='solar-direction';

-- DIVISIONS
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Divisions is a historical predictive label for techniques that subdivide a larger period or motion into smaller chronological units. The exact procedure varies by source, so the term is best treated as a technique family rather than one universally standardized calculation.',
  'reviewed','Historical mapping remains source-sensitive.'
FROM terms WHERE slug='divisions';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'scope','A family rather than one formula',
  'Authors can use division procedures to break annual or directional periods into smaller intervals. Because the mathematical basis and starting points differ, a definition of Divisions should identify the common chronological idea without erasing the individual methods.',10,'reviewed'
FROM terms WHERE slug='divisions';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status)
SELECT id,'source-variation','Keep source variants separate',
  'Where a historical author specifies a particular division scheme, that procedure should be attached to the author’s source account. The canonical entry functions as a navigational family page rather than a synthetic recipe.',20,'reviewed'
FROM terms WHERE slug='divisions';
