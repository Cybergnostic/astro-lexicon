-- Public-source onboarding: Significator of Manners.
--
-- The private curriculum used a ruler-of-behavior/manners label. Lilly provides a
-- direct public historical witness with the more precise phrase "Significator of
-- Manners" in Christian Astrology, Book III, Chapter CVII. Canonicalize the source
-- term rather than publishing the course label as if it were the historical name.

INSERT INTO source_passages
  (edition_id,page_start,page_end,book,chapter,section,locator_text,quote,internal_notes)
SELECT e.id,'533','536','Book III','Chapter CVII','Manners of the Native',
       'Book III, Chapter CVII, Of the Manners of the Native or Child; rules concerning the Significator of Manners',
       NULL,
       'Direct terminology and recognition evidence. Public prose is paraphrased; no long quotation is stored.'
FROM editions e
JOIN works w ON w.id=e.work_id
WHERE w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM source_passages sp
    WHERE sp.edition_id=e.id AND sp.book='Book III' AND sp.chapter='Chapter CVII' AND sp.section='Manners of the Native'
  );

INSERT OR IGNORE INTO terms
  (slug,label,short_definition,category,status,editorial_notes,entry_type,definition_quality)
VALUES
  ('significator-of-manners','Significator of Manners',
   'A planet or planets assigned in traditional natal astrology to signify the native’s manners, disposition and characteristic mode of conduct.',
   'natal terminology','reviewed',
   'Directly attested in William Lilly, Christian Astrology, Book III, Chapter CVII. Keep the role distinct from temperament and from a generic chart ruler. Course-specific selection workflows are not imported.',
   'technical',5);

INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Significator of Manners','English','source-name','Lilly’s explicit terminology in Christian Astrology, Chapter CVII.'
FROM terms WHERE slug='significator-of-manners';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Lord of Manners','English','later-variant','Common later/traditional shorthand; Lilly’s direct wording here is Significator of Manners.'
FROM terms WHERE slug='significator-of-manners';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Ruler of Manners','English','later-variant','Searchable wording for the same functional role; source naming should be preserved where known.'
FROM terms WHERE slug='significator-of-manners';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Ruler of Behavior','English','course-crosswalk','Private-course crosswalk only; not claimed as Lilly’s historical wording.'
FROM terms WHERE slug='significator-of-manners';
INSERT OR IGNORE INTO aliases (term_id,label,language,alias_type,scope_note)
SELECT id,'Ruler of Behaviour','English','course-crosswalk','British-spelling crosswalk; not claimed as source wording.'
FROM terms WHERE slug='significator-of-manners';

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Lilly uses the technical role “Significator of Manners” for the planet or planets that signify the native’s manners. He first gives priority to a planet occupying the Ascendant, allows other planets with dignity in its place to participate, and elsewhere in the chapter uses contacts with Mercury and the Moon, the Ascendant lord and essential dignity as fallback ways of identifying the significator.',
       'Book III, Chapter CVII: Significator of Manners',
       'direct','reviewed','A'
FROM terms t CROSS JOIN works w
WHERE t.slug='significator-of-manners'
  AND w.slug='lilly-christian-astrology'
  AND NOT EXISTS (
    SELECT 1 FROM interpretations i
    WHERE i.term_id=t.id AND i.work_id=w.id AND i.scope='Book III, Chapter CVII: Significator of Manners'
  );

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'primary'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works w ON w.id=i.work_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE t.slug='significator-of-manners'
  AND w.slug='lilly-christian-astrology'
  AND i.scope='Book III, Chapter CVII: Significator of Manners'
  AND sp.book='Book III' AND sp.chapter='Chapter CVII' AND sp.section='Manners of the Native';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
       'The Significator of Manners is a traditional natal role assigned to the planet or planets that most directly describe the native’s manners and disposition. William Lilly uses this wording explicitly. It is not simply another name for the Ascendant ruler, and it is not identical with temperament: temperament describes constitutional mixture, while the significator of manners is a planetary significating role.',
       'reviewed',
       'Public synthesis anchored to Lilly Chapter CVII. The article defines the role without turning the page into a full natal-analysis workflow.'
FROM terms WHERE slug='significator-of-manners';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition','How Lilly identifies it',
       'Lilly gives first importance to planets occupying the Ascendant. If none is there, he considers planets connected with the Moon or Mercury, then the Ascendant ruler and, in further fallback cases, planets strongly connected with or dignified in the places of the Moon and Mercury. More than one planet can participate. These are source-specific recognition rules for Lilly’s treatment, not a universal scoring recipe for every traditional author.',
       10,'reviewed',
       'Condensed recognition criteria only; detailed procedural sequencing remains source-specific rather than being elevated into a general workflow.'
FROM terms WHERE slug='significator-of-manners';

INSERT OR REPLACE INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'distinctions','Distinctions',
       'Do not automatically equate the Significator of Manners with the ruler of the Ascendant, the Lord of the Geniture, the Almuten of the Figure, or the temperament. These can overlap in a particular chart, but they are different technical roles or judgments.',
       20,'reviewed',NULL
FROM terms WHERE slug='significator-of-manners';
