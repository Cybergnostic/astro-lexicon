-- Encyclopedia-quality pass: application/separation and solar-condition mechanics.
--
-- This pass upgrades high-use terms from short definitions to source-backed teaching
-- entries. Source-specific thresholds and recognition rules remain explicitly scoped
-- to their witnesses rather than being flattened into universal traditional rules.

-- =============================================================================
-- ABU MASHAR: APPLICATION AND SEPARATION
-- =============================================================================

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'765','767','Part VII','Chapter 5','5.4-5.5',
       'Abū Maʿshar Part VII 5.4-5.5: application by conjunction and beginning of separation',
       NULL,
       'Direct mechanics evidence for application and separation. Public article paraphrases the copyrighted Brill translation.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.locator_text='Abū Maʿshar Part VII 5.4-5.5: application by conjunction and beginning of separation'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Abū Maʿshar defines application as a faster or lighter planet moving toward a slower planet. For bodily conjunction he requires both planets to be direct and in the same sign; exact application is completed when they reach the same degree and minute. He then describes separation as beginning once the faster planet has passed the slower one.',
       'Part VII 5.4-5.5: application and separation mechanics',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='application' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VII 5.4-5.5: application and separation mechanics'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'For conjunction, Abū Maʿshar says separation begins when the faster planet has passed the slower planet after exact contact. He also describes a diminishing residual mixture after perfection, showing that separation is a post-perfection condition rather than merely a wide angular distance.',
       'Part VII 5.5: separation after conjunction',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='separation' AND w.slug='abu-mashar-great-introduction'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Part VII 5.5: separation after conjunction'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('application','separation')
  AND w.slug='abu-mashar-great-introduction'
  AND sp.locator_text='Abū Maʿshar Part VII 5.4-5.5: application by conjunction and beginning of separation'
  AND i.scope IN ('Part VII 5.4-5.5: application and separation mechanics','Part VII 5.5: separation after conjunction');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Application is the motion of one planet toward the perfection of an aspect or conjunction with another. The key idea is dynamic rather than merely spatial: the planets must be moving toward exact contact. A pair can therefore be close in longitude without truly applying if their motions are carrying them apart.',
       'reviewed',
       'Source-backed teaching article anchored to Abū Maʿshar Part VII. Keep source-specific orb and sign requirements separate from the general definition.'
FROM terms WHERE slug='application';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanism','The basic mechanism',
       'Application is recognized from real planetary motion. In the simplest case, the faster planet is closing the distance to a slower planet until the aspect or conjunction becomes exact. This is why zodiacal position alone is insufficient: speed, direction and the kind of contact all matter.',
       10,'reviewed',NULL
FROM terms WHERE slug='application';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'abu-mashar','Abū Maʿshar’s conjunction rule',
       'In his account of bodily conjunction, Abū Maʿshar describes a faster planet applying to a slower one while both are direct and in the same sign. Perfection occurs when they reach the same degree and minute. He also discusses a wider period in which their natures begin to mix before exact conjunction; that wider allowance is part of his own mechanics and should not be converted into one universal orb rule for every author.',
       20,'reviewed',
       'Historical rule scoped specifically to Great Introduction VII.5.4.'
FROM terms WHERE slug='application';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-proximity','Application is not the same as proximity',
       'Two planets can be only a few degrees apart and still not be applying if the faster planet has already passed the slower one, if their motions prevent perfection, or if the source’s conditions for that form of contact are not met. Application therefore answers a directional question: is the contact being approached?',
       30,'reviewed',NULL
FROM terms WHERE slug='application';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Separation is the condition after an aspect or conjunction has perfected and the planets are moving away from exact contact. It is therefore historically linked to a completed contact: simply being distant or outside an orb is not enough to call a pair separating.',
       'reviewed',
       'Source-backed teaching article anchored to Abū Maʿshar Part VII.'
FROM terms WHERE slug='separation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'mechanism','After perfection',
       'Separation begins after perfection when the faster planet has passed the exact contact and the distance between the two planets starts to increase. This temporal sequence distinguishes separation from a configuration that never perfected in the first place.',
       10,'reviewed',NULL
FROM terms WHERE slug='separation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'residual-contact','Contact can weaken gradually',
       'Abū Maʿshar does not treat exact perfection as an instantaneous switch from full contact to no relationship at all. In his conjunction discussion, a residual mixing remains after the faster planet has passed, then weakens as the planets move farther apart and cross additional boundaries. This is a useful historical reminder that “separating” describes a phase of contact, not simple absence of contact.',
       20,'reviewed',
       'Paraphrase of Great Introduction VII.5.5 without promoting its detailed body/term allowances into a universal rule.'
FROM terms WHERE slug='separation';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'contrast','Application versus separation',
       'Application approaches perfection; separation follows perfection. The distinction is foundational in horary, natal and predictive judgment because an approaching contact and a receding contact do not describe the same temporal state, even when the planets occupy nearly identical positions.',
       30,'reviewed',NULL
FROM terms WHERE slug='separation';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Application approaches perfection; separation follows it.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='application' AND b.slug='separation';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Separation is the post-perfection counterpart of application.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='separation' AND b.slug='application';

-- =============================================================================
-- LILLY: COMBUSTION, UNDER THE BEAMS, CAZIMI
-- =============================================================================

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'113','114','Book I',NULL,'Combustion, Under the Sun Beams, Cazimi',
       'Christian Astrology Book I p.113: combustion, under the Sun-beams, and cazimi definitions',
       NULL,
       'Direct definitions and Lilly-specific thresholds. Public prose is paraphrased rather than quoting the retype.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id
      AND sp.locator_text='Christian Astrology Book I p.113: combustion, under the Sun-beams, and cazimi definitions'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines combustion as a planet being in the same sign as the Sun and within 8°30′ of it, excluding the much narrower cazimi condition. He explicitly notes that he uses the Sun’s moiety for this threshold and that other astrologers disagree with him.',
       'Book I p.113: combustion threshold',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='combustion' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113: combustion threshold'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines a planet as under the Sun’s beams until it is 17 degrees away from the Sun. In his scheme this is a broader solar-proximity condition than combustion.',
       'Book I p.113: under the Sun-beams threshold',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='under-the-beams' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113: under the Sun-beams threshold'
  );

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly defines cazimi, or being in the heart of the Sun, as a planet being within 17 arcminutes of the Sun and treats the condition as a fortification rather than combustion.',
       'Book I p.113: cazimi threshold',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='cazimi' AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book I p.113: cazimi threshold'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug IN ('combustion','under-the-beams','cazimi')
  AND w.slug='lilly-christian-astrology'
  AND sp.locator_text='Christian Astrology Book I p.113: combustion, under the Sun-beams, and cazimi definitions'
  AND i.scope IN ('Book I p.113: combustion threshold','Book I p.113: under the Sun-beams threshold','Book I p.113: cazimi threshold');

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Combustion is a traditional condition of severe solar proximity in which a planet is overwhelmed or obscured by the Sun. It belongs to a family of solar conditions that also includes the broader state of being under the beams and the much narrower cazimi condition. Exact numerical boundaries vary by author.',
       'reviewed',
       'Teaching article anchored to Lilly while preserving historical threshold variation.'
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'solar-family','Part of a solar-proximity spectrum',
       'Combustion should not be treated as a synonym for every planet hidden by sunlight. Traditional authors distinguish multiple degrees of solar proximity. Under the beams is normally broader, while cazimi is a special very close condition treated separately from ordinary combustion.',
       10,'reviewed',NULL
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-threshold','Lilly’s threshold',
       'William Lilly uses 8°30′ from the Sun for combustion and additionally requires the planet to be in the same sign as the Sun. He openly notes disagreement about the correct orb calculation. The encyclopedia therefore records 8°30′ as Lilly’s rule, not as a universal number for all traditional astrology.',
       20,'reviewed',
       'Source-specific threshold from Christian Astrology Book I p.113.'
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'direction','Approaching and receding from the Sun',
       'Lilly considers a planet more afflicted when the Sun is moving toward conjunction with it than when the Sun is receding from it. This is a source-specific qualitative distinction layered on top of the basic combustion condition and shows why motion can matter even when the angular distance is the same.',
       30,'reviewed',NULL
FROM terms WHERE slug='combustion';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Under the Beams is a traditional solar-proximity condition in which a planet is obscured or weakened by the Sun’s light while lying outside the narrower combustion zone. Because historical authors use different visibility and orb conventions, the boundary should always be attached to a source rather than assumed to be universal.',
       'reviewed',
       'Teaching article anchored to Lilly’s explicit threshold but written to preserve broader historical variation.'
FROM terms WHERE slug='under-the-beams';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinction','Broader than combustion',
       'In Lilly’s scheme, every ordinarily combust planet is also within the broader solar-beam distance, but a planet can be under the beams without being combust. The terms therefore describe nested levels of solar proximity rather than interchangeable labels.',
       10,'reviewed',NULL
FROM terms WHERE slug='under-the-beams';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-threshold','Lilly’s threshold',
       'Lilly treats a planet as under the Sun’s beams until it is 17° away from the Sun. Other historical traditions use different visibility logic and different angular limits, so 17° belongs specifically to Lilly’s presentation here.',
       20,'reviewed',NULL
FROM terms WHERE slug='under-the-beams';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Cazimi is the condition traditionally described as a planet being “in the heart of the Sun.” It occupies an extremely narrow zone around exact solar conjunction and is treated by Lilly as a fortification, sharply distinguishing it from ordinary combustion despite the even smaller angular distance from the Sun.',
       'reviewed',
       'Teaching article anchored to Lilly’s explicit definition; threshold remains source-specific.'
FROM terms WHERE slug='cazimi';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paradox','Closer to the Sun, but not ordinary combustion',
       'Cazimi illustrates why solar conditions cannot be reduced to a simple rule that “closer is always weaker.” Once a planet enters the very narrow heart-of-the-Sun condition recognized by the source, its status changes categorically rather than merely becoming a more extreme form of combustion.',
       10,'reviewed',NULL
FROM terms WHERE slug='cazimi';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'lilly-threshold','Lilly’s threshold',
       'Lilly defines cazimi as being within 17 arcminutes of the Sun, forward or backward. This value is recorded as Lilly’s own criterion; other authorities and modern reconstructions should be represented as separate variants when they are added to the corpus.',
       20,'reviewed',NULL
FROM terms WHERE slug='cazimi';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Both are solar-proximity conditions; combustion is narrower in Lilly’s scheme.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='combustion' AND b.slug='under-the-beams';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Cazimi is the very narrow heart-of-the-Sun condition, treated differently from ordinary combustion.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='cazimi' AND b.slug='combustion';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Ordinary combustion excludes the special cazimi condition.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='combustion' AND b.slug='cazimi';
