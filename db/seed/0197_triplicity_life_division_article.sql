-- Editorial follow-up: complete the Triplicity Division of Life teaching article.
--
-- The reviewed Bonatti corpus uses the three triplicity rulers serially across several
-- natal topics. The stable doctrine is the first/second/third ruler sequence; the
-- relevant triplicity itself depends on the topic being judged. This seed synthesizes
-- that pattern without turning any one topical implementation into a universal rule.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Triplicity Division of Life is a natal timing doctrine in which the three rulers of a relevant triplicity are assigned in sequence to successive portions of life. In Bonatti, the first ruler governs the earlier portion, the second the middle portion, and the third or participating ruler the later portion. The important qualification is that the relevant triplicity depends on the topic under judgment rather than one fixed set of three planets governing every subject.',
  'reviewed',
  'Cross-topic synthesis of reviewed Bonatti evidence. Preserve topic-specific choice of triplicity and avoid turning the doctrine into one universal ruler sequence.'
FROM terms WHERE slug='triplicity-life-division';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'serial-rulers','Three rulers used in sequence',
  'The basic structure is serial. The first ruler of the selected triplicity signifies the first or earlier portion, the second ruler the middle portion, and the third ruler the final or later portion. The condition of each ruler then describes the relative condition of the topic during the period assigned to it.',
  10,'reviewed','Stable pattern repeated across Bonatti’s natal house doctrine.'
FROM terms WHERE slug='triplicity-life-division';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'topic-selects-triplicity','The topic determines which triplicity is relevant',
  'Bonatti does not apply one universal set of triplicity rulers to every matter. For substance he can use the triplicity rulers connected with the house of substance, while another tradition he preserves uses the sect luminary for general prosperity. For honors he uses the Sun’s triplicity rulers, and other topics can select their triplicity from another relevant significator or place. The serial structure is stable; the starting triplicity is contextual.',
  20,'reviewed','Synthesizes the Second House and Tenth House applications without privileging one as universal.'
FROM terms WHERE slug='triplicity-life-division';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'topical-applications','The same sequence can organize different topics',
  'The corpus preserves several Bonatti applications of the same three-ruler logic. In substance, the rulers describe prosperity across successive periods; in the Fifth House they time children in youth, middle age and old age; in the Ninth they distinguish periods for religion or long journeys; and in the Tenth they divide honors and prosperity across life. Bonatti also uses serial triplicity rulers for siblings and for the beginning, middle and end of the mother’s life. These examples show a reusable timing structure rather than one single topic-specific technique.',
  30,'reviewed','Examples are drawn only from reviewed Bonatti interpretations already present in the corpus.'
FROM terms WHERE slug='triplicity-life-division';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-fixed-ages','Not a universal table of exact ages',
  'The doctrine establishes an ordered division into earlier, middle and later portions, but the encyclopedia should not silently convert those portions into one fixed modern age table. The reviewed source accounts use relative life phases and topic-specific applications. Exact numerical boundaries, where a source supplies them, belong with that source rather than in the canonical definition.',
  40,'reviewed','Prevents false precision not supported uniformly by the reviewed corpus.'
FROM terms WHERE slug='triplicity-life-division';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='triplicity-life-division');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'triplicity-life-timing','How the life division works',10,'reviewed',
  'Family-specific composition for the completed Triplicity Division of Life article.'
FROM terms WHERE slug='triplicity-life-division';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='serial-rulers' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='serial-rulers' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Triplicity Division of Life article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='triplicity-life-timing'
  AND s.status IN ('reviewed','published');
