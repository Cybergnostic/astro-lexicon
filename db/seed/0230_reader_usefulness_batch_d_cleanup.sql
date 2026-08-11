-- Reader usefulness Batch D cleanup.
-- Remove residual project/encyclopedia voice from Planetary Joy after the family pass.

PRAGMA foreign_keys = ON;

-- Earlier seeds used more than one section key while the Planetary Joy article evolved.
-- Replace any surviving project-language section defensively rather than depending on the
-- historical key name.
UPDATE term_article_sections
SET body='The joy assignments presuppose the traditional twelve-place structure and its established topics. Their logic is clearest when read together with the meanings of the places themselves: authors explain the assignments by matching planetary qualities with the topics or character of those places. Joy is therefore a relational doctrine of correspondence rather than merely a detached list of house numbers.',
    editorial_notes='Reader usefulness Batch D cleanup: explain relational logic directly without project-language framing.'
WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-joy')
  AND lower(body) LIKE '%encyclopedia%';
