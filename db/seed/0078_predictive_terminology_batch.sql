-- Predictive terminology batch discovered from the private curriculum.
--
-- This seed adds named techniques, sub-techniques, formal roles and technical
-- vocabulary only. It deliberately excludes prognostic judgment workflows,
-- prioritization recipes and cross-cycle synthesis procedures.

-- -----------------------------------------------------------------------------
-- FIRDARIA
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('firdaria','Firdaria',
   'A traditional time-lord system of major planetary periods and subperiods, with different starting sequences for day and night nativities.',
   'prognostics','reviewed',
   'Curriculum-discovered term. Basic definition retained; historical tables and transmission variants should be expanded from direct sources.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Firdariyyah','English','transliteration-variant','Alternative transliteration for firdaria.' FROM terms WHERE slug='firdaria';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'Firdaria is a traditional time-lord technique that divides life into a sequence of major planetary periods. Planetary periods may be subdivided into seven subperiods, while the lunar nodes are treated separately in the preserved scheme.',
       'reviewed','Term-level definition only; no judgment workflow imported.'
FROM terms WHERE slug='firdaria';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'subperiods','Subperiods',
       'Each planetary firdar may be divided into seven subperiods. The first belongs to the ruler of the major period and the remaining subperiods continue through the traditional planetary sequence. The lunar nodes do not receive subperiods in the current scheme.',
       10,'reviewed','Direct historical source comparison remains open.'
FROM terms WHERE slug='firdaria';

-- -----------------------------------------------------------------------------
-- PTOLEMAIC AGES
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('ptolemaic-ages','Ptolemaic Ages',
   'A traditional division of the human lifespan into successive planetary ages, beginning with the Moon and proceeding through the seven planets.',
   'prognostics','reviewed',
   'Basic period structure retained from the curriculum; direct Tetrabiblos citation should be attached during the historical-source pass.',
   'technical',4);
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Ptolemaic Ages divide the human lifespan into a succession of planetary stages. The sequence follows the traditional order from the Moon through Mercury, Venus, Sun, Mars, Jupiter and Saturn, with each planet assigned a characteristic span of life.',
       'reviewed','Encyclopedia definition, not a method of judging the ruler.'
FROM terms WHERE slug='ptolemaic-ages';
INSERT OR REPLACE INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'periods','Planetary age sequence',
       'The preserved table assigns the Moon to ages 0-3, Mercury 4-13, Venus 14-21, the Sun 22-40, Mars 41-55, Jupiter 56-67, and Saturn from age 68 onward.',
       10,'reviewed','Historical table should later be checked directly against Ptolemy and translation conventions.'
FROM terms WHERE slug='ptolemaic-ages';

-- -----------------------------------------------------------------------------
-- PROFECTIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('profection','Profection',
   'A traditional time-lord technique that advances a point or sign through the zodiac at a regular temporal rate.',
   'prognostics','reviewed',
   'General concept; annual and monthly profections are represented separately below.',
   'technical',5),
  ('annual-profection','Annual Profection',
   'A profection scale in which one zodiacal sign corresponds to one year, beginning from the natal Ascendant sign.',
   'prognostics','reviewed',
   'Basic whole-sign form retained; medieval degree- and quadrant-based variants require later source comparison.',
   'technical',5),
  ('monthly-profection','Monthly Profection',
   'A subdivision of profection in which successive signs are assigned to successive months within the profected year.',
   'prognostics','reviewed',
   'Basic term definition; exact starting convention is preserved in the article.',
   'technical',4),
  ('lord-of-the-year','Lord of the Year',
   'The planet serving as the principal annual time lord, commonly the domicile ruler of the sign activated by annual profection.',
   'prognostics','reviewed',
   'The phrase can be used differently across traditions; this entry currently records the profectional sense.',
   'technical',4),
  ('profected-sign','Profected Sign',
   'The zodiacal sign activated by a profection at a particular time scale.',
   'prognostics','reviewed',
   'Structural term discovered while separating profection vocabulary from judgment procedure.',
   'technical',4);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Annual profection is a profection scale.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='annual-profection' AND b.slug='profection';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'subtype-of','Monthly profection is a profection scale.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='monthly-profection' AND b.slug='profection';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','The lord of the year is commonly derived from the annual profected sign.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='lord-of-the-year' AND b.slug='annual-profection';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Profection is a traditional temporal technique in which zodiacal signs or degrees are advanced according to a fixed time scale. Different historical implementations exist, so annual whole-sign profection should not be treated as the only possible form.','reviewed','Term-level history/definition only.' FROM terms WHERE slug='profection';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Annual profection advances one whole zodiacal sign for each year of life. In the whole-sign form, the natal Ascendant sign is active during the first year and each subsequent year advances to the next sign.','reviewed','No annual judgment workflow imported.' FROM terms WHERE slug='annual-profection';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Monthly profection is a smaller-scale profection that advances through the zodiac month by month within an annual profection cycle. The first monthly sign begins from the sign activated for the year in the currently preserved scheme.','reviewed','Term definition only.' FROM terms WHERE slug='monthly-profection';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'In profectional terminology, the Lord of the Year is the domicile ruler of the zodiacal sign activated by the annual profection. Other traditions may use the same English phrase for different annual rulers, so the derivation should always be stated.','reviewed','Scoped explicitly to the profectional usage.' FROM terms WHERE slug='lord-of-the-year';

-- -----------------------------------------------------------------------------
-- PRIMARY DIRECTIONS AND DISTRIBUTIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('primary-direction','Primary Direction',
   'A traditional directing technique based on the primary motion of the celestial sphere, bringing a moving promissor to a fixed significator.',
   'prognostics','reviewed',
   'Basic formal definition from curriculum terminology; historical keys and calculation systems remain for later direct-source review.',
   'technical',5),
  ('directional-significator','Significator in Primary Directions',
   'The fixed point or factor toward which a promissor is directed in a primary direction.',
   'prognostics','reviewed',
   'Scoped to primary-direction terminology so it is not confused with significator in the broader astrological sense.',
   'technical',5),
  ('promissor','Promissor',
   'The planet, aspect, fixed star or other moving factor directed toward a significator in primary directions.',
   'prognostics','reviewed',
   'Formal directing-role term.',
   'technical',5),
  ('distribution','Distribution',
   'A directing-period structure created as a directed significator passes through successive bounds or terms.',
   'prognostics','reviewed',
   'Traditional predictive use of distribution; direct historical terminology should be expanded later.',
   'technical',5),
  ('distributor','Distributor',
   'The ruler of the bound or term through which a directed significator is passing during a distribution.',
   'prognostics','reviewed',
   'Formal role within distributions.',
   'technical',5),
  ('participator','Participator',
   'A planet or aspect that joins a distribution by making a directed contact with the significator during the distributor''s period.',
   'prognostics','reviewed',
   'Also describable as a co-ruler/participant in the period; historical terminology to be checked directly.',
   'technical',4);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'part-of','The significator is one formal role in a primary direction.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='directional-significator' AND b.slug='primary-direction';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'part-of','The promissor is the moving formal role in a primary direction.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='promissor' AND b.slug='primary-direction';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Distribution is a directing-period structure associated with primary directions.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='distribution' AND b.slug='primary-direction';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'part-of','The distributor rules the current bound in a distribution.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='distributor' AND b.slug='distribution';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'part-of','A participator temporarily joins the distributor within a distribution.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='participator' AND b.slug='distribution';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A primary direction is a traditional predictive technique based on the primary rotation of the heavens. In its formal vocabulary a promissor is moved toward a significator; different historical systems then convert the directed arc into time.','reviewed','Calculation keys intentionally deferred to direct historical-source comparison.' FROM terms WHERE slug='primary-direction';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A distribution is a period structure within directing practice in which a significator passes through successive zodiacal bounds or terms. The ruler of the current bound is called the distributor.','reviewed','No judgment procedure imported.' FROM terms WHERE slug='distribution';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'The distributor is the ruler of the zodiacal bound occupied by the directed significator during a distribution. It functions as the principal ruler of that span until the significator enters another bound.','reviewed',NULL FROM terms WHERE slug='distributor';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A participator is a planet or planetary aspect that becomes involved with the directed significator during the period of a distributor. It modifies or shares the period without replacing the distributor as the underlying bound ruler.','reviewed',NULL FROM terms WHERE slug='participator';

-- -----------------------------------------------------------------------------
-- RETURNS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('solar-return','Solar Return',
   'A horoscope cast for the moment the Sun returns to its natal zodiacal position, defining an annual revolution.',
   'prognostics','reviewed',
   'Also called solar revolution. Location conventions vary by tradition and are not fixed by this definition.',
   'technical',5),
  ('lunar-return','Lunar Return',
   'A horoscope cast for the moment the Moon returns to its natal zodiacal position, producing a recurring monthly-scale revolution.',
   'prognostics','reviewed',
   'Also called lunar revolution. Interpretive workflow excluded.',
   'technical',5);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Solar Revolution','English','translation-variant','Alternative name for the same annual return chart.' FROM terms WHERE slug='solar-return';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lunar Revolution','English','translation-variant','Alternative name for the same lunar return chart.' FROM terms WHERE slug='lunar-return';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A solar return, or solar revolution, is the horoscope for the exact return of the Sun to its natal zodiacal position. It marks a repeating annual cycle and is distinct from annual profection, even though the two techniques are often used together in traditional practice.','reviewed','Definition only; course-specific birthplace-location rule deliberately excluded.' FROM terms WHERE slug='solar-return';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'A lunar return, or lunar revolution, is the horoscope for the Moon''s return to its natal zodiacal position. Because the lunar cycle is shorter than the solar year, roughly twelve or thirteen such returns can occur within one solar-return year.','reviewed','Interpretive dependency on the solar return omitted as workflow.' FROM terms WHERE slug='lunar-return';

-- -----------------------------------------------------------------------------
-- SOLAR DIRECTIONS AND DIVISIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('solar-direction','Solar Direction',
   'A directing technique that applies primary-direction-style motion within the scale of a solar-return year.',
   'prognostics','reviewed',
   'Curriculum terminology; direct historical terminology/source audit remains open.',
   'technical',4),
  ('divisions','Divisions',
   'A traditional prognostic technique that divides a solar year into successive planetary periods of specified lengths.',
   'prognostics','reviewed',
   'Curriculum records describe a Hellenistic technique with later variants; direct-source comparison remains open.',
   'technical',4);
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'related-to','Solar directions adapt directing logic to an annual return cycle.','reviewed' FROM terms a CROSS JOIN terms b WHERE a.slug='solar-direction' AND b.slug='primary-direction';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Solar directions apply the logic and vocabulary of directions on the scale of a solar-return year. They retain concepts such as significator, promissor and changes of bounds, but are distinguished from full primary directions by their annual frame.','reviewed','Use and confirmation workflow intentionally excluded.' FROM terms WHERE slug='solar-direction';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Divisions are a traditional predictive technique that partitions a year into successive planetary periods with predetermined lengths. Surviving traditions do not appear completely uniform, so period lengths, starting rulers and ordering variants should be documented by author rather than collapsed into one table.','reviewed','Historical variant details deferred to direct-source audit.' FROM terms WHERE slug='divisions';

-- -----------------------------------------------------------------------------
-- DORYPHORY / SPEAR-BEARING
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('doryphory','Doryphory',
   'A traditional configuration of planetary spear-bearers attending or supporting a luminary, used especially in doctrines of eminence and rank.',
   'configurations','reviewed',
   'Term surfaced in the career/eminence lesson; direct source comparison and variant definitions remain to be expanded.',
   'technical',4);
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Spear-bearing','English','translation-variant','English rendering of doryphory/doryphoria.' FROM terms WHERE slug='doryphory';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Doryphoria','English','transliteration-variant','Alternative transliteration.' FROM terms WHERE slug='doryphory';
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'Doryphory, often translated as spear-bearing, is a traditional configuration in which planets attend or support a luminary in a manner associated by some authors with eminence, authority or elevated rank. Exact requirements vary across authors and should be preserved as historical variants rather than reduced to one universal checklist.','reviewed','Added as terminology only; eminence-analysis workflow not imported.' FROM terms WHERE slug='doryphory';
