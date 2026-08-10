-- Editorial Baseline v1: twelve zodiac signs.
--
-- Stable coordinate/classification facts now belong to zodiac_sign_profiles and planetary
-- dignity relations to DignityConnections. Older sign articles repeated those facts in
-- prose and added generic "reading the source accounts" sections. Remove that duplication,
-- keep a concise explanatory intro, and compose only genuinely additional article material.

PRAGMA foreign_keys = ON;

WITH intros(slug,intro) AS (VALUES
  ('aries','In the tropical zodiac Aries opens the quarter beginning at the March equinox. Its position at the start of that quarter explains its movable classification; its other traditional sign classes and dignity relations are shown in the reference data on this entry.'),
  ('taurus','Taurus occupies the middle of the quarter that begins at the March equinox. Its fixed classification reflects that middle position, while its other traditional sign classes and dignity relations are shown in the reference data on this entry.'),
  ('gemini','Gemini closes the quarter that begins at the March equinox. Its bicorporeal or common classification belongs to that transitional position at the end of the quarter.'),
  ('cancer','Cancer opens the quarter beginning at the June solstice. Its movable classification reflects that seasonal turning point, while its other sign classes and dignity relations form separate traditional layers.'),
  ('leo','Leo occupies the middle of the quarter beginning at the June solstice. Its fixed classification belongs to that middle position in the seasonal structure of the tropical zodiac.'),
  ('virgo','Virgo closes the quarter beginning at the June solstice. Its bicorporeal or common classification reflects its position at the transition toward the September equinox.'),
  ('libra','Libra opens the quarter beginning at the September equinox. Its movable classification belongs to that equinoctial turning point; historical authors also place Libra within several additional relational systems between signs.'),
  ('scorpio','Scorpio occupies the middle of the quarter beginning at the September equinox. Its fixed classification belongs to that middle position in the seasonal structure of the tropical zodiac.'),
  ('sagittarius','Sagittarius closes the quarter beginning at the September equinox. Its bicorporeal or common classification reflects its transitional position before the December solstice.'),
  ('capricorn','Capricorn opens the quarter beginning at the December solstice. Its movable classification belongs to that solstitial turning point, with other sign classes and dignity relations forming separate traditional layers.'),
  ('aquarius','Aquarius occupies the middle of the quarter beginning at the December solstice. Its fixed classification belongs to that middle position in the seasonal structure of the tropical zodiac.'),
  ('pisces','Pisces closes the quarter beginning at the December solstice and completes the tropical zodiac before the return to the March equinox. Its bicorporeal or common classification reflects that transitional position.')
)
UPDATE term_articles
SET intro=(SELECT i.intro FROM intros i JOIN terms t ON t.slug=i.slug WHERE t.id=term_articles.term_id),
    editorial_notes='Editorial Baseline v1 zodiac-family cleanup: stable sign facts live in structured profile/dignity data; article prose is limited to explanation not duplicated reference values.'
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'
));

-- The normalized sign profile already owns element, modality, polarity, day/night class,
-- coordinate interval and quarter position. The data-driven dignity component owns domicile,
-- exaltation, detriment, fall and other scheme assignments.
DELETE FROM term_article_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'
))
AND section_key IN ('structure','dignities','sources');

-- Replace earlier page composition for signs, if any.
DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'
));

-- Only create a public article section when substantive prose or a surviving sign-specific
-- table remains after the structured facts and generic source-reading copy are removed.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'additional-doctrine','Additional traditional structure',10,'reviewed',
       'Editorial Baseline v1 zodiac-family composition.'
FROM terms t
WHERE t.slug IN (
  'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'
)
AND (
  EXISTS (
    SELECT 1 FROM term_article_sections s
    WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
  )
  OR EXISTS (
    SELECT 1 FROM term_article_tables tb
    WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  )
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(
         SELECT MIN(s2.sort_order) FROM term_article_sections s2
         WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')
       ) THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(
         SELECT MIN(s2.sort_order) FROM term_article_sections s2
         WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published')
       ) THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 zodiac-family composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='additional-doctrine'
  AND s.status IN ('reviewed','published');

-- Any surviving sign-specific comparison table belongs after the surviving prose rather
-- than becoming another top-level section.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed',
       'Editorial Baseline v1 zodiac-family composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.section_key='additional-doctrine'
  AND tb.status IN ('reviewed','published');
