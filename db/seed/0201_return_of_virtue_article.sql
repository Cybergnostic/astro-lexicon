-- Editorial follow-up: complete the Return of Virtue / Return (Radd) teaching article.
--
-- The cross-source reconciliation establishes one shared mechanism across Abū Maʿshar,
-- al-Bīrūnī and Bonatti: a receiver cannot retain what is given because it is debilitated
-- and returns the virtue/disposition to the donor. Keep distinct from Bonatti's broader
-- and internally polysemous Return of Light.

PRAGMA foreign_keys = ON;

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Return of Virtue, also transmitted as Return, Radd, Returning, or Return of Disposition, is a perfection mechanic in which one planet receives another planet’s virtue or offered disposition but is too debilitated to retain it and therefore returns it to the donor. The shared mechanism is attested across Abū Maʿshar, al-Bīrūnī and Bonatti, although the consequences of the return depend on the condition of both planets and should remain source-specific.',
  'reviewed',
  'Cross-source synthesis of the normalized Returning / Radd / Return of Virtue family. Keep distinct from Bonatti’s Return of Light.'
FROM terms WHERE slug='return-of-virtue';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='return-of-virtue');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'receiver-cannot-retain','The receiver cannot retain what is given',
  'The mechanic begins with an offered planetary virtue, disposition or influence moving from one planet to another. Return occurs because the receiving planet is unable to hold what it has received. The sources especially associate that incapacity with serious debility such as retrogradation or solar obscuration, so the defining fact is failed retention rather than the mere existence of an application.',
  10,'reviewed','Stable recognition rule in the cross-source reconciliation.'
FROM terms WHERE slug='return-of-virtue';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'returned-to-donor','The virtue goes back to the donor',
  'When the receiver cannot retain the offered virtue, it is returned to the planet that gave it. This distinguishes Return from a simple lack of contact: something has been offered or transferred within the planetary relationship, but the receiving planet’s condition prevents the transfer from remaining with it.',
  20,'reviewed',NULL
FROM terms WHERE slug='return-of-virtue';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'outcome-depends-on-condition','Return is not one automatic outcome',
  'The canonical term identifies the return mechanism, not one universal judgment of its result. The reviewed sources allow the condition of donor and receiver, including reception or other strength, to change what the return means in practice. Those consequence rules belong with the attributed source accounts rather than in one flattened encyclopedia rule.',
  30,'reviewed','Preserves source-specific consequence logic.'
FROM terms WHERE slug='return-of-virtue';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-return-of-light','Not the same as Return of Light',
  'Bonatti also uses the expression Return of Light for other planetary sequences, including the onward projection of collected light and an interrupted application that he can also describe as an abscission of light. The lexicon therefore keeps Return of Virtue / Radd separate: its stable defining feature is the debilitated receiver giving back what it could not retain.',
  40,'reviewed','Important false-friend distinction established in the cross-source reconciliation.'
FROM terms WHERE slug='return-of-virtue';

DELETE FROM term_page_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='return-of-virtue');

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'return-mechanics','How Return works',10,'reviewed',
  'Family-specific composition for the completed Return of Virtue / Return (Radd) article.'
FROM terms WHERE slug='return-of-virtue';

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.section_key='receiver-cannot-retain' THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.section_key='receiver-cannot-retain' THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the Return of Virtue / Return (Radd) article.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='return-mechanics'
  AND s.status IN ('reviewed','published');
