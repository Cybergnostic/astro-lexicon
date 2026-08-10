-- Bird's-eye reference pass: solar synodic cycles for the traditional planets.
--
-- Mean periods are astronomical reference values (days, rounded for presentation).
-- Mercury/Venus are modeled as inferior-planet cycles; Mars/Jupiter/Saturn as
-- superior-planet cycles; the Moon uses the lunation cycle.  Visibility phases are
-- deliberately described as schematic because heliacal visibility depends on latitude,
-- season, atmospheric conditions and the planet's actual geometry.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'moon-solar-synodic-cycle',m.id,s.id,'lunation',29.53059,
       'Mean new-Moon-to-new-Moon cycle: about 29.53 days.','reviewed',
       'Solar synodic cycle of the Moon; phases are geometric reference points rather than an interpretive forecasting workflow.'
FROM terms m CROSS JOIN terms s WHERE m.slug='moon' AND s.slug='sun';

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'mercury-solar-synodic-cycle',p.id,s.id,'inferior-planet-solar-synodic',115.87721,
       'Mean recurrence relative to the Sun/Earth geometry: about 116 days.','reviewed',
       'Mean period derived from standard orbital periods; phase sequence is schematic and does not impose fixed heliacal visibility thresholds.'
FROM terms p CROSS JOIN terms s WHERE p.slug='mercury' AND s.slug='sun';

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'venus-solar-synodic-cycle',p.id,s.id,'inferior-planet-solar-synodic',583.92273,
       'Mean recurrence relative to the Sun/Earth geometry: about 584 days.','reviewed',
       'NASA/NSSDC gives a mean Venus synodic period of about 583.92 days; exact visibility phases vary with geometry.'
FROM terms p CROSS JOIN terms s WHERE p.slug='venus' AND s.slug='sun';

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'mars-solar-synodic-cycle',p.id,s.id,'superior-planet-solar-synodic',779.93589,
       'Mean recurrence relative to the Sun/Earth geometry: about 780 days.','reviewed',
       'Mean period derived from standard orbital periods; visibility events are approximate observational phases.'
FROM terms p CROSS JOIN terms s WHERE p.slug='mars' AND s.slug='sun';

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'jupiter-solar-synodic-cycle',p.id,s.id,'superior-planet-solar-synodic',398.88404,
       'Mean recurrence relative to the Sun/Earth geometry: about 399 days.','reviewed',
       'NASA/NSSDC gives Jupiter’s synodic period as about 398.88 days.'
FROM terms p CROSS JOIN terms s WHERE p.slug='jupiter' AND s.slug='sun';

INSERT OR IGNORE INTO planetary_cycles
  (slug,planet_term_id,reference_body_term_id,cycle_type,mean_period_days,period_note,status,notes)
SELECT 'saturn-solar-synodic-cycle',p.id,s.id,'superior-planet-solar-synodic',378.09191,
       'Mean recurrence relative to the Sun/Earth geometry: about 378 days.','reviewed',
       'Mean period derived from standard orbital periods; visibility events are approximate observational phases.'
FROM terms p CROSS JOIN terms s WHERE p.slug='saturn' AND s.slug='sun';

-- Moon: one lunation.
WITH phases(key,label,seq,geometry,visibility,motion,note) AS (VALUES
  ('new-moon','New Moon / conjunction',1,'Moon and Sun in geocentric conjunction','Moon normally lost in solar glare','Waxing begins after conjunction','Start/end reference point of the lunation.'),
  ('first-quarter','First quarter',2,'Moon about 90° east of the Sun','Half-illuminated evening Moon','Waxing','Geometric quarter phase.'),
  ('full-moon','Full Moon / opposition',3,'Moon opposite the Sun','Fully illuminated through the night','Waning begins after opposition','Midpoint of the lunation.'),
  ('last-quarter','Last quarter',4,'Moon about 90° west of the Sun','Half-illuminated morning Moon','Waning','Geometric quarter phase.')
)
INSERT OR IGNORE INTO planetary_cycle_phases
  (cycle_id,phase_key,label,sequence_no,geometric_condition,visibility_condition,motion_condition,notes)
SELECT c.id,p.key,p.label,p.seq,p.geometry,p.visibility,p.motion,p.note
FROM phases p JOIN planetary_cycles c ON c.slug='moon-solar-synodic-cycle';

-- Mercury and Venus: inferior-planet cycle skeleton.
WITH phases(key,label,seq,geometry,visibility,motion,note) AS (VALUES
  ('inferior-conjunction','Inferior conjunction',1,'Planet between Earth and Sun; geocentric conjunction','Normally invisible in solar glare','Typically within the retrograde loop','Cycle anchor for an inferior planet.'),
  ('morning-emergence','Morning emergence',2,'Planet separates westward from the Sun','Emerges as a morning star when elongation/conditions permit','Direct after the post-conjunction station','Heliacal visibility is observational, not a fixed degree threshold.'),
  ('greatest-western-elongation','Greatest western elongation',3,'Maximum apparent angular separation west of the Sun','Prominent before sunrise','Direct','Geometric maximum; actual value varies by orbit.'),
  ('superior-conjunction','Superior conjunction',4,'Sun between Earth and planet; geocentric conjunction','Normally invisible in solar glare','Direct','The planet passes to the far side of the Sun.'),
  ('evening-emergence','Evening emergence',5,'Planet separates eastward from the Sun','Emerges as an evening star when elongation/conditions permit','Direct','Heliacal visibility is observational, not a fixed degree threshold.'),
  ('greatest-eastern-elongation','Greatest eastern elongation',6,'Maximum apparent angular separation east of the Sun','Prominent after sunset','Direct, approaching the retrograde loop','Geometric maximum; actual value varies by orbit.'),
  ('retrograde-return','Retrograde return toward inferior conjunction',7,'Planet turns retrograde and closes on the Sun','Visibility declines toward conjunction','Retrograde','Returns to the inferior conjunction that closes the cycle.')
)
INSERT OR IGNORE INTO planetary_cycle_phases
  (cycle_id,phase_key,label,sequence_no,geometric_condition,visibility_condition,motion_condition,notes)
SELECT c.id,p.key,p.label,p.seq,p.geometry,p.visibility,p.motion,p.note
FROM phases p JOIN planetary_cycles c ON c.slug IN ('mercury-solar-synodic-cycle','venus-solar-synodic-cycle');

-- Mars, Jupiter and Saturn: superior-planet cycle skeleton.
WITH phases(key,label,seq,geometry,visibility,motion,note) AS (VALUES
  ('solar-conjunction','Solar conjunction',1,'Planet aligned with the Sun on the far side of Earth’s line of sight','Normally invisible in solar glare','Direct','Start/end reference point for the superior-planet cycle.'),
  ('morning-emergence','Morning emergence / heliacal rising',2,'Planet separates westward from the Sun','Becomes visible before sunrise when conditions permit','Direct','Visibility timing varies with latitude, season and brightness.'),
  ('first-station','First station',3,'Apparent geocentric motion slows to a standstill','Well separated from the Sun','Stationary, then retrograde','Beginning of the retrograde arc.'),
  ('opposition','Opposition',4,'Planet opposite the Sun in geocentric longitude','Rises near sunset and is visible through much of the night','Retrograde','Central opposition phase of the superior-planet cycle.'),
  ('second-station','Second station',5,'Apparent retrograde motion slows to a standstill','Still well separated from the Sun','Stationary, then direct','End of the retrograde arc.'),
  ('evening-setting','Evening disappearance / heliacal setting',6,'Planet closes eastward toward the Sun','Disappears into evening twilight when conditions cease to permit visibility','Direct','Observational threshold varies rather than occurring at one universal elongation.'),
  ('return-to-conjunction','Return to solar conjunction',7,'Planet again reaches geocentric conjunction with the Sun','Invisible in solar glare','Direct','Closes the synodic cycle.')
)
INSERT OR IGNORE INTO planetary_cycle_phases
  (cycle_id,phase_key,label,sequence_no,geometric_condition,visibility_condition,motion_condition,notes)
SELECT c.id,p.key,p.label,p.seq,p.geometry,p.visibility,p.motion,p.note
FROM phases p JOIN planetary_cycles c ON c.slug IN ('mars-solar-synodic-cycle','jupiter-solar-synodic-cycle','saturn-solar-synodic-cycle');

-- Reader-facing explanation on each affected planetary article.
INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'synodic-cycle','The planet in its solar cycle',
       CASE slug
         WHEN 'moon' THEN 'The Moon is understood observationally through its repeating relationship to the Sun: conjunction or New Moon, waxing quarter, opposition or Full Moon, waning quarter, and return to conjunction. The mean lunation is about 29.53 days.'
         WHEN 'mercury' THEN 'Mercury repeatedly moves through inferior conjunction, morning visibility, greatest western elongation, superior conjunction, evening visibility, greatest eastern elongation and a retrograde return to inferior conjunction. Its mean solar synodic recurrence is about 116 days.'
         WHEN 'venus' THEN 'Venus follows the same broad inferior-planet pattern as Mercury but on a much longer timescale: inferior conjunction, morning-star phase, superior conjunction, evening-star phase, and return through the retrograde loop. Its mean solar synodic recurrence is about 584 days.'
         WHEN 'mars' THEN 'Mars follows the superior-planet synodic pattern: solar conjunction, morning emergence, station retrograde, opposition, station direct, evening disappearance and return to conjunction. The mean cycle is about 780 days.'
         WHEN 'jupiter' THEN 'Jupiter follows the superior-planet synodic pattern: solar conjunction, morning emergence, station retrograde, opposition, station direct, evening disappearance and return to conjunction. The mean cycle is about 399 days.'
         WHEN 'saturn' THEN 'Saturn follows the superior-planet synodic pattern: solar conjunction, morning emergence, station retrograde, opposition, station direct, evening disappearance and return to conjunction. The mean cycle is about 378 days.'
       END,
       45,'reviewed','Bird’s-eye reference addition. Detailed phase records are exported separately; heliacal thresholds are deliberately not universalized.'
FROM terms WHERE slug IN ('moon','mercury','venus','mars','jupiter','saturn');
