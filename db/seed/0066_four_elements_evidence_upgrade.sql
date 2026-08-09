-- Editorial follow-up to 0065: the existing Four Elements / Natures umbrella
-- previously had only B-grade evidence. Al-Biruni §347 directly states the four
-- elemental mixtures, so attach that primary evidence explicitly.

INSERT INTO interpretations
  (term_id,work_id,summary,scope,certainty,status,evidence_grade)
SELECT t.id,w.id,
       'Al-Biruni derives the four elemental natures from paired primary qualities: hot and dry correspond to fire, cold and dry to earth, hot and moist to air, and cold and moist to water.',
       '§347, four elemental mixtures', 'direct', 'reviewed', 'A'
FROM terms t CROSS JOIN works w
WHERE t.slug='four-elements' AND w.slug='al-biruni-tafhim';

INSERT OR IGNORE INTO citations (interpretation_id,source_passage_id,citation_role)
SELECT i.id,sp.id,'support'
FROM interpretations i
JOIN terms t ON t.id=i.term_id
JOIN works iw ON iw.id=i.work_id
JOIN source_passages sp
JOIN editions e ON e.id=sp.edition_id
JOIN works sw ON sw.id=e.work_id
WHERE iw.slug='al-biruni-tafhim'
  AND sw.slug='al-biruni-tafhim'
  AND t.slug='four-elements'
  AND i.scope='§347, four elemental mixtures'
  AND sp.section='347';
