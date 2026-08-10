-- Bird's-eye reference pass: add the missing Thema Mundi / world horoscope.
--
-- Public primary witness: Firmicus Maternus, Mathesis III.1.  The Latin text gives
-- the seven planets and the Ascendant at the 15th degree of their model positions.
-- Treat this as a transmitted cosmological/model horoscope, not as a datable event chart.

PRAGMA foreign_keys = ON;

INSERT OR IGNORE INTO authors
  (slug,name,original_name,historical_layer,notes)
VALUES
  ('firmicus-maternus','Julius Firmicus Maternus','Iulius Firmicus Maternus','Late antique',
   'Fourth-century Latin astrologer and author of the Mathesis. Added during the bird’s-eye pass for the direct Thema Mundi witness.');

INSERT OR IGNORE INTO works
  (author_id,slug,title,original_title,composition_year_start,composition_year_end,language,notes,corpus_status)
SELECT id,'firmicus-mathesis','Mathesis','Matheseos libri VIII',330,360,'Latin',
       'Partial source onboarding: currently used for the direct Thema Mundi witness; the whole work is not yet sequentially indexed.',
       'partial'
FROM authors WHERE slug='firmicus-maternus';

INSERT OR IGNORE INTO editions
  (work_id,label,editor,publisher,publication_year,source_language,target_language,copyright_note,local_source_key)
SELECT id,
       'Kroll–Skutsch Latin text / LacusCurtius transcription',
       'Wilhelm Kroll; Franz Skutsch',
       'B. G. Teubner; online transcription at LacusCurtius',
       1897,'Latin','Latin',
       'Critical Latin edition is public domain; online transcription used as a locator and reading witness.',
       'firmicus-mathesis-lacuscurtius'
FROM works WHERE slug='firmicus-mathesis';

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,NULL,NULL,'Book III','I','Thema mundi','Mathesis III.1',
       'Firmicus gives the Sun at the 15th degree of Leo, Moon at the 15th of Cancer, Saturn at the 15th of Capricorn, Jupiter at the 15th of Sagittarius, Mars at the 15th of Scorpio, Venus at the 15th of Libra, Mercury at the 15th of Virgo, and the horoskopos/Ascendant at the 15th of Cancer.',
       NULL,
       'Direct primary witness summarized from the public-domain Latin text; no modern copyrighted translation stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='firmicus-mathesis'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp WHERE sp.edition_id=e.id AND sp.section='Thema mundi'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('thema-mundi','Thema Mundi',
   'The traditional model or mythical horoscope of the world, preserved in late-antique astrology as a schematic nativity of the cosmos rather than a datable historical birth chart.',
   'foundational cosmology','reviewed',
   'Primary witness currently Firmicus Mathesis III.1. Keep model/cosmological status explicit and avoid treating the configuration as an actual historical event chart.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'World Horoscope','English','translation','Plain-English navigation label for the model horoscope of the cosmos.'
FROM terms WHERE slug='thema-mundi';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Nativity of the World','English','translation','English rendering of the underlying world-nativity idea.'
FROM terms WHERE slug='thema-mundi';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Mundi genitura','Latin','source-phrase','Firmicus uses the Latin world-nativity expression in the discussion introducing the model.'
FROM terms WHERE slug='thema-mundi';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Firmicus presents a transmitted nativity of the world: Cancer rises at the 15th degree with the Moon there; the Sun is at 15 Leo, Mercury at 15 Virgo, Venus at 15 Libra, Mars at 15 Scorpio, Jupiter at 15 Sagittarius and Saturn at 15 Capricorn. The configuration functions as a cosmological/model horoscope in his exposition.',
       'Mathesis III.1: Thema mundi',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='thema-mundi' AND w.slug='firmicus-mathesis'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Mathesis III.1: Thema mundi'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='thema-mundi' AND w.slug='firmicus-mathesis' AND sp.section='Thema mundi';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'The Thema Mundi is the traditional “world chart”: a schematic nativity of the cosmos used to express the internal order of the classical astrological system. In the version preserved by Firmicus Maternus, Cancer rises with the Moon there, the Sun follows in Leo, and Mercury, Venus, Mars, Jupiter and Saturn continue through Virgo, Libra, Scorpio, Sagittarius and Capricorn. Every planet therefore occupies a domicile in an ordered sequence. The value of the figure is conceptual and pedagogical; it should not be mistaken for an ordinary historical horoscope cast for a recoverable moment.',
  'reviewed','Bird’s-eye foundational article. Direct primary witness supplied by Firmicus; later variants can be added as separate source accounts.'
FROM terms WHERE slug='thema-mundi';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'structure','Structure of the model',
  'Firmicus places the Ascendant and Moon at the 15th degree of Cancer, the Sun at 15 Leo, Mercury at 15 Virgo, Venus at 15 Libra, Mars at 15 Scorpio, Jupiter at 15 Sagittarius and Saturn at 15 Capricorn. Read as a sequence, the model walks outward through the visible planetary order while placing each body in one of its traditional domiciles.',10,'reviewed',NULL
FROM terms WHERE slug='thema-mundi';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'model-not-event','A model, not an ordinary event chart',
  'The figure belongs to cosmological and didactic astrology. Its purpose in the textual tradition is to describe an ideal ordering of the world and the planetary domiciles, not to document a historically recoverable instant in which the cosmos was literally born. This distinction matters because the diagram is used to reason about astrological structure rather than to reconstruct an astronomical event.',20,'reviewed',NULL
FROM terms WHERE slug='thema-mundi';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'firmicus-positions','Thema Mundi positions in Firmicus',
  'Firmicus, Mathesis III.1. “15°” preserves the traditional ordinal degree statement in the source account.',
  '["Point / planet","Position","Structural note"]',
  '[["Ascendant","15° Cancer","Same degree as the Moon"],["Moon","15° Cancer","Domicile"],["Sun","15° Leo","Domicile"],["Mercury","15° Virgo","Domicile"],["Venus","15° Libra","Domicile"],["Mars","15° Scorpio","Domicile"],["Jupiter","15° Sagittarius","Domicile"],["Saturn","15° Capricorn","Domicile"]]',
  15,'reviewed','Direct positional reference; no claim that the configuration is an actual historical chart.'
FROM terms WHERE slug='thema-mundi';

INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'illustrates','The Thema Mundi places the seven traditional planets in a sequence of domiciles.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='thema-mundi' AND b.slug='domicile';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'is-model-of','The Thema Mundi is framed as a model nativity of the cosmos.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='thema-mundi' AND b.slug='nativity';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'uses','The model is expressed through the zodiacal signs and their planetary domiciles.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='thema-mundi' AND b.slug='zodiac';
