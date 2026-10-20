-- Historical witness precision for Batch 06: al-Biruni, Book of Instruction §§138-139,147-148,171,178-180,255-257,261-262.
-- Direct source checks used Wright's English translation; content is paraphrased and author/editor statements are not conflated.
-- Claims belong to al-Biruni's historical model, not an assertion that all authors agree.
PRAGMA foreign_keys=ON;

-- equinoctial §138
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'138','Batch 06 primary witness: al-Bīrūnī §138 — Equinoctial as circle of first movement',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §138 — Equinoctial as circle of first movement');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī defines the equinoctial as the great circle midway between the two poles of first or daily celestial motion.','§138 (Batch 06 directly inspected: Equinoctial as circle of first movement)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='equinoctial' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§138 (Batch 06 directly inspected: Equinoctial as circle of first movement)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='equinoctial' AND w.slug='al-biruni-tafhim' AND i.scope='§138 (Batch 06 directly inspected: Equinoctial as circle of first movement)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §138 — Equinoctial as circle of first movement';

-- ecliptic §139
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'139','Batch 06 primary witness: al-Bīrūnī §139 — Ecliptic inclination and equinox intersection',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §139 — Ecliptic inclination and equinox intersection');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes the Sun''s zodiacal circle from the equinoctial, giving their inclination and their two opposite points of intersection.','§139 (Batch 06 directly inspected: Ecliptic inclination and equinox intersection)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='ecliptic' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§139 (Batch 06 directly inspected: Ecliptic inclination and equinox intersection)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='ecliptic' AND w.slug='al-biruni-tafhim' AND i.scope='§139 (Batch 06 directly inspected: Ecliptic inclination and equinox intersection)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §139 — Ecliptic inclination and equinox intersection';

-- declination §147
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'147','Batch 06 primary witness: al-Bīrūnī §147 — Declination measured from equinoctial',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §147 — Declination measured from equinoctial');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī defines declination by angular distance from the equinoctial and separately defines celestial latitude relative to the ecliptic.','§147 (Batch 06 directly inspected: Declination measured from equinoctial)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='declination' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§147 (Batch 06 directly inspected: Declination measured from equinoctial)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='declination' AND w.slug='al-biruni-tafhim' AND i.scope='§147 (Batch 06 directly inspected: Declination measured from equinoctial)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §147 — Declination measured from equinoctial';

-- celestial-longitude §148
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'148','Batch 06 primary witness: al-Bīrūnī §148 — Ecliptic longitude of off-ecliptic star',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §148 — Ecliptic longitude of off-ecliptic star');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī assigns an off-ecliptic body''s longitude to the degree intercepted by its circle of celestial latitude on the ecliptic.','§148 (Batch 06 directly inspected: Ecliptic longitude of off-ecliptic star)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='celestial-longitude' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§148 (Batch 06 directly inspected: Ecliptic longitude of off-ecliptic star)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='celestial-longitude' AND w.slug='al-biruni-tafhim' AND i.scope='§148 (Batch 06 directly inspected: Ecliptic longitude of off-ecliptic star)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §148 — Ecliptic longitude of off-ecliptic star';

-- eccentric-orbit §171
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'171','Batch 06 primary witness: al-Bīrūnī §171 — Sun on eccentric circular orbit',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Sun on eccentric circular orbit');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī represents the solar orbit as a circle displaced from the world''s centre, producing a farthest and nearest point.','§171 (Batch 06 directly inspected: Sun on eccentric circular orbit)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='eccentric-orbit' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§171 (Batch 06 directly inspected: Sun on eccentric circular orbit)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='eccentric-orbit' AND w.slug='al-biruni-tafhim' AND i.scope='§171 (Batch 06 directly inspected: Sun on eccentric circular orbit)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Sun on eccentric circular orbit';

-- apogee §171
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'171','Batch 06 primary witness: al-Bīrūnī §171 — Apogee of the Sun''s eccentric',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Apogee of the Sun''s eccentric');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī names the furthest point of the Sun''s eccentric circle the apogee and explicitly contrasts it with the nearest point.','§171 (Batch 06 directly inspected: Apogee of the Sun''s eccentric)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='apogee' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§171 (Batch 06 directly inspected: Apogee of the Sun''s eccentric)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='apogee' AND w.slug='al-biruni-tafhim' AND i.scope='§171 (Batch 06 directly inspected: Apogee of the Sun''s eccentric)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Apogee of the Sun''s eccentric';

-- perigee §171
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'171','Batch 06 primary witness: al-Bīrūnī §171 — Perigee of the Sun''s eccentric',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Perigee of the Sun''s eccentric');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī identifies the nearest point to Earth of the Sun''s eccentric circular orbit, opposite apogee.','§171 (Batch 06 directly inspected: Perigee of the Sun''s eccentric)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='perigee' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§171 (Batch 06 directly inspected: Perigee of the Sun''s eccentric)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='perigee' AND w.slug='al-biruni-tafhim' AND i.scope='§171 (Batch 06 directly inspected: Perigee of the Sun''s eccentric)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §171 — Perigee of the Sun''s eccentric';

-- epicycle §178
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'178','Batch 06 primary witness: al-Bīrūnī §178 — Planet moving on smaller epicycle circle',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §178 — Planet moving on smaller epicycle circle');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī defines the epicycle as a smaller circle upon which a planet moves, distinct from the orbit carrying its centre.','§178 (Batch 06 directly inspected: Planet moving on smaller epicycle circle)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='epicycle' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§178 (Batch 06 directly inspected: Planet moving on smaller epicycle circle)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='epicycle' AND w.slug='al-biruni-tafhim' AND i.scope='§178 (Batch 06 directly inspected: Planet moving on smaller epicycle circle)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §178 — Planet moving on smaller epicycle circle';

-- deferent §179
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'179','Batch 06 primary witness: al-Bīrūnī §179 — Deferent carries epicycle centre',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §179 — Deferent carries epicycle centre');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī says the centre of an epicycle travels along the deferent, whose centre can differ from that of the world.','§179 (Batch 06 directly inspected: Deferent carries epicycle centre)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='deferent' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§179 (Batch 06 directly inspected: Deferent carries epicycle centre)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='deferent' AND w.slug='al-biruni-tafhim' AND i.scope='§179 (Batch 06 directly inspected: Deferent carries epicycle centre)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §179 — Deferent carries epicycle centre';

-- equant §180
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'180','Batch 06 primary witness: al-Bīrūnī §180 — Equant and rate of angular motion',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §180 — Equant and rate of angular motion');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī describes the equant as the displaced point from which equal angular advance is computed, separate from the centre of the deferent.','§180 (Batch 06 directly inspected: Equant and rate of angular motion)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='equant' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§180 (Batch 06 directly inspected: Equant and rate of angular motion)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='equant' AND w.slug='al-biruni-tafhim' AND i.scope='§180 (Batch 06 directly inspected: Equant and rate of angular motion)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §180 — Equant and rate of angular motion';

-- lunar-eclipse §255
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'255','Batch 06 primary witness: al-Bīrūnī §255 — Earth shadow and lunar opposition',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §255 — Earth shadow and lunar opposition');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī explains lunar eclipses by the full Moon entering Earth''s shadow when its latitude is sufficiently small.','§255 (Batch 06 directly inspected: Earth shadow and lunar opposition)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='lunar-eclipse' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§255 (Batch 06 directly inspected: Earth shadow and lunar opposition)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='lunar-eclipse' AND w.slug='al-biruni-tafhim' AND i.scope='§255 (Batch 06 directly inspected: Earth shadow and lunar opposition)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §255 — Earth shadow and lunar opposition';

-- eclipse §256
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'256','Batch 06 primary witness: al-Bīrūnī §256 — Lunar nodes and eclipse latitude',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §256 — Lunar nodes and eclipse latitude');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī links the possibility of a lunar eclipse at opposition to proximity to one of the Moon''s orbital nodes.','§256 (Batch 06 directly inspected: Lunar nodes and eclipse latitude)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='eclipse' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§256 (Batch 06 directly inspected: Lunar nodes and eclipse latitude)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='eclipse' AND w.slug='al-biruni-tafhim' AND i.scope='§256 (Batch 06 directly inspected: Lunar nodes and eclipse latitude)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §256 — Lunar nodes and eclipse latitude';

-- solar-eclipse §261
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'261','Batch 06 primary witness: al-Bīrūnī §261 — Moon interposes and obscures solar disk',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §261 — Moon interposes and obscures solar disk');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī explains a solar eclipse as the Moon interposing between observer and Sun near conjunction.','§261 (Batch 06 directly inspected: Moon interposes and obscures solar disk)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='solar-eclipse' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§261 (Batch 06 directly inspected: Moon interposes and obscures solar disk)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='solar-eclipse' AND w.slug='al-biruni-tafhim' AND i.scope='§261 (Batch 06 directly inspected: Moon interposes and obscures solar disk)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §261 — Moon interposes and obscures solar disk';

-- solar-eclipse §262
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'262','Batch 06 primary witness: al-Bīrūnī §262 — Solar eclipse varies by observer location',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §262 — Solar eclipse varies by observer location');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes the local appearance of a solar eclipse according to viewpoint and lunar parallax.','§262 (Batch 06 directly inspected: Solar eclipse varies by observer location)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='solar-eclipse' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§262 (Batch 06 directly inspected: Solar eclipse varies by observer location)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='solar-eclipse' AND w.slug='al-biruni-tafhim' AND i.scope='§262 (Batch 06 directly inspected: Solar eclipse varies by observer location)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §262 — Solar eclipse varies by observer location';

-- partial-eclipse §257
INSERT INTO source_passages(edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book of Instruction',NULL,'257','Batch 06 primary witness: al-Bīrūnī §257 — Lunar totality and partial obscuration',NULL,
  'Directly inspected Wright translation at the indicated section; paraphrased claim, no long reproduction.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §257 — Lunar totality and partial obscuration');
INSERT INTO interpretations(term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,'Al-Bīrūnī distinguishes partial and total lunar eclipse and notes differing stages in totality.','§257 (Batch 06 directly inspected: Lunar totality and partial obscuration)','direct','reviewed','A'
FROM terms t CROSS JOIN works w WHERE t.slug='partial-eclipse' AND w.slug='al-biruni-tafhim'
AND NOT EXISTS (SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='§257 (Batch 06 directly inspected: Lunar totality and partial obscuration)');
INSERT OR IGNORE INTO citations(interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary' FROM interpretations i JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id JOIN editions e ON e.work_id=w.id JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='partial-eclipse' AND w.slug='al-biruni-tafhim' AND i.scope='§257 (Batch 06 directly inspected: Lunar totality and partial obscuration)' AND sp.locator_text='Batch 06 primary witness: al-Bīrūnī §257 — Lunar totality and partial obscuration';

