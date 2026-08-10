-- Editorial follow-up: complete the foundational Astrology teaching article.
--
-- Abū Maʿshar explicitly presents astrology as one branch of the broader science of
-- the stars, paired with the astronomical "science of the universe". The article keeps
-- his distinction between celestial indication and causal celestial power visible rather
-- than replacing it with a modern generic definition.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'In Abū Maʿshar’s framework, astrology is the branch of the science of the stars that judges terrestrial conditions from the natures, powers, motions and configurations of celestial bodies and from what those celestial conditions indicate at a specified time. He presents it as a systematic and teachable science, but distinguishes it from the astronomical branch concerned with the structure and motions of the heavens themselves.',
  'reviewed',
  'Foundational synthesis from reviewed Abū Maʿshar Part I evidence and the cross-source editorial reconciliation. Historical conceptual framing is preserved rather than replaced with a modern generic definition.'
FROM terms WHERE slug='astrology';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='astrology');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'science-of-stars','One branch of the science of the stars',
  'Abū Maʿshar divides the broader science concerning the stars into two branches. One studies the celestial spheres, dimensions, motions, planetary order, eclipses and related quantities. The other is astrology: the study of planetary natures and indications and of what those celestial conditions signify for the sublunary world. Astrology is therefore defined within a larger celestial science rather than as an isolated practice.',
  10,'reviewed','Reflects Part I, Chapter 2 and the canonical Science of the Stars relation.'
FROM terms WHERE slug='astrology';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'astronomy-distinction','Astrology is not the astronomical branch',
  'The astronomical branch, which Abū Maʿshar calls the Science of the Universe, establishes the structure and motions of the heavens: spheres, distances, inclinations, planetary order and speed, occultations and eclipses. Astrology uses celestial conditions of this kind as the basis for judgment, but its own subject is their natures and indications. The distinction is methodological as well as terminological.',
  20,'reviewed',NULL
FROM terms WHERE slug='astrology';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'indication-and-power','Indication and causal power are not the same thing',
  'A central concept in Abū Maʿshar’s account is indication: a celestial condition can signify or point toward a terrestrial condition without being identical to the thing signified. His broader natural philosophy also attributes causal powers to celestial motions, but the corpus explicitly preserves these as distinct relations. Astrological judgment therefore depends on what celestial conditions indicate, not merely on a claim that every indication is the same thing as a physical cause.',
  30,'reviewed','Keeps the reviewed distinction between indication and celestial power explicit.'
FROM terms WHERE slug='astrology';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'systematic-judgment','A systematic discipline of judgment',
  'Abū Maʿshar presents astrology as something that can be taught through principles, arguments and ordered study. The astrologer learns the conditions, natures and indications of planets and signs first separately and then in combination. The resulting judgment concerns what those configurations signify for a present or specified future time; it is not simply a catalogue of isolated planetary meanings.',
  40,'reviewed','Reflects Part I, Chapter 1, §§1.7-1.10.'
FROM terms WHERE slug='astrology';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='astrology');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'astrology-foundations','Definition and intellectual framework',10,'reviewed',
  'Family-specific composition for the completed foundational Astrology article.'
FROM terms WHERE slug='astrology';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='science-of-stars' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='science-of-stars' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the foundational Astrology article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='astrology-foundations'
  AND s.status IN ('reviewed','published');
