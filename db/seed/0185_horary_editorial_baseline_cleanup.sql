-- Editorial Baseline v1: horary / interrogation terminology.
--
-- Keep role vocabulary, historical branch terminology and radicality source-sensitive, while
-- removing public prose that describes the lexicon/editorial process. Compose multi-block
-- entries as coherent articles rather than equal top-level fragments.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- READER-FACING COPY: REMOVE PROJECT / NAVIGATION LANGUAGE
-- -----------------------------------------------------------------------------

UPDATE term_articles
SET intro='Interrogation is historical terminology for an astrological question and for the practice of judging questions astrologically. In modern English, Horary Astrology is the more familiar branch name, while historical scholarship and textual titles also preserve questions, interrogations and interrogational astrology.'
WHERE term_id=(SELECT id FROM terms WHERE slug='interrogation');

UPDATE term_article_sections
SET body='Horary Astrology is the familiar modern English branch label for judging a question from a figure erected for the inquiry. Interrogation is an older and scholarly cross-reference for the same broad question-astrology stream. Their scopes substantially overlap, while individual historical authors can organize the practice differently.'
WHERE term_id=(SELECT id FROM terms WHERE slug='interrogation')
  AND section_key='relation-to-horary';

UPDATE term_article_sections
SET body='Lilly describes a cosignificator as another planet in aspect or conjunction with the principal significator which therefore has some share in signifying the same matter. Other traditional contexts can use co-signification more broadly, so this is best read as Lilly’s particular formulation of the general role.'
WHERE term_id=(SELECT id FROM terms WHERE slug='cosignificator')
  AND section_key='lilly';

UPDATE term_article_sections
SET body='Lilly describes a question as radical when the figure is fit to be judged and gives a correspondence between the Lord of the Hour and the Lord of the Ascendant as one test. His formulation is historically important, but it is one author’s criterion rather than a universal definition of radicality.'
WHERE term_id=(SELECT id FROM terms WHERE slug='radicality')
  AND section_key='lilly';

-- -----------------------------------------------------------------------------
-- REMOVE SMALL REDUNDANCIES
-- -----------------------------------------------------------------------------

-- Querent already defines the asker and directly contrasts it with the quesited in the
-- canonical definition/relations. Keep the concise article intro and avoid repeating the
-- same two-sentence distinction as a separate visible subsection.
DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='querent')
  AND section_key='contrast';

-- The broad Horary Astrology page already receives the structured role vocabulary table.
-- Keep that useful table; role pages themselves should not repeat it.

-- -----------------------------------------------------------------------------
-- EXPLICIT PAGE COMPOSITION FOR THE HORARY VOCABULARY FAMILY
-- -----------------------------------------------------------------------------

DELETE FROM term_page_sections
WHERE term_id IN (SELECT id FROM terms WHERE slug IN (
  'interrogation','querent','quesited','significator','cosignificator','radicality',
  'planetary-hour','lord-of-the-hour','horary-astrology'
));

-- Historical framework entries.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'framework','Historical scope and terminology',10,'reviewed','Editorial Baseline v1 horary composition.'
FROM terms t
WHERE t.slug IN ('interrogation','horary-astrology')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

-- Horary/signification roles.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,'role','Role and scope',10,'reviewed','Editorial Baseline v1 horary composition.'
FROM terms t
WHERE t.slug IN ('querent','quesited','significator','cosignificator')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

-- Radicality and planetary-hour terminology.
INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT t.id,
       CASE WHEN t.slug='radicality' THEN 'radicality-scope' ELSE 'time-ruler' END,
       CASE WHEN t.slug='radicality' THEN 'Radicality in historical practice' ELSE 'Planetary-hour role' END,
       10,'reviewed','Editorial Baseline v1 horary composition.'
FROM terms t
WHERE t.slug IN ('radicality','planetary-hour','lord-of-the-hour')
  AND EXISTS (
    SELECT 1 FROM term_article_sections s WHERE s.term_id=t.id AND s.status IN ('reviewed','published')
    UNION ALL
    SELECT 1 FROM term_article_tables tb WHERE tb.term_id=t.id AND tb.status IN ('reviewed','published')
  );

-- Generic block insertion for the explicit compositions above. First prose block flows as a
-- paragraph; subsequent distinctions become subsections. Tables sit inside the same section.
INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=(SELECT MIN(s2.sort_order) FROM term_article_sections s2 WHERE s2.term_id=s.term_id AND s2.status IN ('reviewed','published'))
            THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Editorial Baseline v1 horary composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.status='reviewed'
  AND ps.section_key IN ('framework','role','radicality-scope','time-ruler')
  AND s.status IN ('reviewed','published');

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-table',tb.table_key,'table',1,100+tb.sort_order,'reviewed','Editorial Baseline v1 horary composition.'
FROM term_page_sections ps
JOIN term_article_tables tb ON tb.term_id=ps.term_id
WHERE ps.status='reviewed'
  AND ps.section_key IN ('framework','role','radicality-scope','time-ruler')
  AND tb.status IN ('reviewed','published');
