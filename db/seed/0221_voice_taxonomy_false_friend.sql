-- B/C ontology sanity sweep: clarify two source-specific voice classes whose English
-- labels are deceptively similar.
--
-- Bonatti's Half-Voice Sign is defined iconographically through animals that bleat,
-- low or roar. Abū Maʿshar's Half-Voiced / Moderate-Voiced Sign belongs to a four-level
-- graded voice taxonomy. The source concepts overlap in subject matter but are not merged
-- merely because English translators use forms of "half voice" for both.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- BONATTI: HALF-VOICE SIGN
-- -----------------------------------------------------------------------------
UPDATE terms SET
  editorial_notes='Bonatti-specific iconographic voice class: animal figures that bleat, low or roar, contrasted with rational/beautiful-voice and voiceless signs. Keep distinct from Abū Maʿshar’s separately sourced Half-Voiced / Moderate-Voiced class; similar English wording does not by itself establish identical membership or taxonomy.'
WHERE slug='half-voice-sign';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Bonatti’s Half-Voice Sign is an iconographic sign class based on the kind of sound attributed to the animal represented by the zodiacal figure. He distinguishes animals that bleat, low or roar from rational or more fully voiced figures and from creatures treated as entirely voiceless. The translated phrase resembles Abū Maʿshar’s Half-Voiced / Moderate-Voiced class, but the two source taxonomies should not be assumed identical from the English wording alone.',
  'reviewed',
  'Reader-facing false-friend clarification from Bonatti, Second Tractate, Part II, Ch. XX.'
FROM terms WHERE slug='half-voice-sign';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='half-voice-sign');

INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'bonatti-class','Bonatti’s classification',
  'The defining criterion is the represented animal’s kind of voice. Bonatti places bleating, lowing or roaring creatures in an intermediate category and contrasts them with rational or more fully voiced figures on one side and animals regarded as voiceless on the other. The category is therefore part of his sign-image taxonomy rather than a universal four-level scale abstracted from all authors.',10,'reviewed',NULL
FROM terms WHERE slug='half-voice-sign';

INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-abu-mashar','Not automatically Abū Maʿshar’s half-voiced class',
  'Abū Maʿshar separately organizes signs into powerful-, half/moderate-, weak- and voiceless classes. Because the translated labels overlap, the two entries are historically related, but source-specific membership and classification logic should control any comparison. The encyclopedia therefore preserves both headwords instead of merging them by English resemblance.',20,'reviewed',NULL
FROM terms WHERE slug='half-voice-sign';

-- -----------------------------------------------------------------------------
-- ABŪ MAʿSHAR: HALF-/MODERATE-VOICED SIGN
-- -----------------------------------------------------------------------------
UPDATE terms SET
  editorial_notes='Abū Maʿshar’s intermediate class within a four-level voice taxonomy: powerful, half/moderate, weak and voiceless. Keep distinct from Bonatti’s source-specific Half-Voice Sign, whose recognition is framed iconographically through bleating, lowing or roaring animals.'
WHERE slug='half-voiced-sign';

UPDATE term_articles SET
  intro='A half-voiced or moderate-voiced sign belongs to Abū Maʿshar’s intermediate class within a four-level taxonomy of zodiacal voice. In his scheme it stands below the powerful-voiced class and above the weak-voiced and voiceless classes. Bonatti also uses a translated “half-voice” label, but his iconographic classification is retained separately rather than silently equated with this graded scheme.',
  editorial_notes='Abū Maʿshar voice taxonomy with Bonatti false-friend clarification.'
WHERE term_id=(SELECT id FROM terms WHERE slug='half-voiced-sign');

UPDATE term_article_sections SET
  heading='How to read Abū Maʿshar’s class',
  body='Abū Maʿshar assigns Aries, Taurus, Leo and Sagittarius to the intermediate half- or moderate-voiced class. It is one level in his explicit sequence of powerful, half/moderate, weak and voiceless signs. Bonatti’s similarly translated Half-Voice Sign belongs to a different source presentation and should be compared author by author rather than treated as an automatic synonym.'
WHERE term_id=(SELECT id FROM terms WHERE slug='half-voiced-sign')
  AND section_key='scope';

-- Reader-facing relationship: similar historical subject, deliberately not synonymy.
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'source-specific-analogue',
       'Both terms classify zodiacal figures by voice and can be translated with “half voice,” but Bonatti’s animal-sound criterion and Abū Maʿshar’s four-level voice taxonomy remain source-specific and are not merged solely on English wording.',
       'reviewed'
FROM terms a CROSS JOIN terms b
WHERE a.slug='half-voice-sign' AND b.slug='half-voiced-sign';

-- Explicit late-seed composition for the new Bonatti article.
DELETE FROM term_page_sections WHERE term_id=(SELECT id FROM terms WHERE slug='half-voice-sign');

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'source-distinction','Source distinction',10,'reviewed','Bonatti/Abū Maʿshar voice-taxonomy false-friend clarification.'
FROM terms WHERE slug='half-voice-sign';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Bonatti/Abū Maʿshar voice-taxonomy false-friend clarification.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.term_id=(SELECT id FROM terms WHERE slug='half-voice-sign')
  AND ps.section_key='source-distinction'
  AND s.status IN ('reviewed','published');
