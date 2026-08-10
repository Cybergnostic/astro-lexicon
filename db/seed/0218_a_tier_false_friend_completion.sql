-- Final A-tier editorial completion: source-specific false friends and ontology distinctions.
--
-- These five entries are not being expanded because they are "short". Each one has an
-- explicit reconciliation warning that a bare definition leaves too easy to misread.
-- The articles therefore stay compact and teach the distinction that justified A-tier status.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- COMBUST WAY: ZODIACAL INTERVAL, NOT SOLAR COMBUSTION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Combust Way is al-Bīrūnī’s zodiacal condition for the interval extending from the latter part of Libra into the first part of Scorpio. He explains its adverse reputation through the falls of the luminaries and the presence of malefic dignities in that region. Despite the English word “combust,” this is not the ordinary solar condition of a planet being obscured by proximity to the Sun.',
  'reviewed',
  'Direct al-Bīrūnī §514 synthesis. The corpus does not currently force an equivalence with the separately retained Via Combusta entry.'
FROM terms WHERE slug='combust-way';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='combust-way');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'zodiacal-region','A zodiacal region',
  'The defining feature is location in a particular part of the zodiac, not angular distance from the Sun. Al-Bīrūnī associates the region with the luminary falls and malefic dignities, which supplies the source’s explanation for its adverse quality.',10,'reviewed',NULL
FROM terms WHERE slug='combust-way';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-combustion','Not ordinary combustion',
  'Solar combustion is a planet–Sun proximity condition. Combust Way is instead a zodiacal interval. The similar English wording should therefore not cause the two entries to be merged or interpreted by the same recognition rule.',20,'reviewed',NULL
FROM terms WHERE slug='combust-way';

-- -----------------------------------------------------------------------------
-- FRUSTRATION (BONATTI): SAME ENGLISH LABEL, DIFFERENT SEQUENCE FROM LILLY
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Frustration (Bonatti) is a source-specific impediment in which the planet being pursued leaves its sign before bodily perfection and, after entering the next sign, encounters another planet’s rays before the original applicant catches it. The English label must not be merged with Lilly’s Frustration, because Lilly describes a materially different sequence.',
  'reviewed',
  'Direct Bonatti evidence separated from Lilly during cross-source perfection reconciliation.'
FROM terms WHERE slug='frustration-bonatti';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='frustration-bonatti');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'bonatti-sequence','Bonatti’s sequence',
  'An intended bodily joining is underway, but the pursued planet changes sign before the applicant can perfect the conjunction. In the new sign the pursued planet meets another planet’s rays first, preventing the original applicant from completing the intended joining.',10,'reviewed',NULL
FROM terms WHERE slug='frustration-bonatti';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-lilly','Not Lilly’s Frustration',
  'Lilly’s Frustration is represented by the separate canonical Frustration entry and centers on the intended target perfecting another conjunction first. Bonatti’s translated label requires the sign-change and ray-interception sequence described above. Shared English terminology is therefore not evidence of identical mechanics.',20,'reviewed',NULL
FROM terms WHERE slug='frustration-bonatti';

-- -----------------------------------------------------------------------------
-- IN ITS OWN LIGHT: BONATTI HAS TWO DIFFERENT "OWN LIGHT" USES
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'In Its Own Light here means Bonatti’s solar-phase use of the expression: a planet has emerged from the Sun’s rays and has not yet joined another planet. Its position relative to the Sun and emergence from the rays place it within the solar/synodic phase sequence, while the absence of a subsequent planetary joining completes this source-specific condition.',
  'reviewed',
  'Bonatti Third Tractatus II.VIII. Keep distinct from his separate Treatise 5 “own light” usage, which belongs to the sect/hemisphere condition normalized under Halb.'
FROM terms WHERE slug='in-own-light';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='in-own-light');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'solar-phase-use','The solar-phase use',
  'This condition occurs after the planet has come out from the Sun’s rays. Solar position is therefore relevant to recognizing the phase, and the phrase belongs to the larger sequence of planetary relations with the Sun rather than to an intrinsic property of the planet.',10,'reviewed',NULL
FROM terms WHERE slug='in-own-light';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'before-new-joining','Before another planetary joining',
  'Bonatti adds a second condition to the solar emergence: the planet has not yet joined another planet. The term therefore names a particular interval after release from the rays and before a new planetary connection.',20,'reviewed',NULL
FROM terms WHERE slug='in-own-light';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-halb','Not Bonatti’s other “own light” usage',
  'Elsewhere Bonatti uses similar translated wording for a sect-and-hemisphere condition. That separate usage has been normalized under Halb. The identical English phrase therefore represents two different source meanings and should not be used to merge the concepts.',30,'reviewed',NULL
FROM terms WHERE slug='in-own-light';

-- -----------------------------------------------------------------------------
-- INTERVENTION: AL-BIRUNI MECHANISM, NOT ANTIOCHUS' INTERVENTION BY RAYS
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Intervention is al-Bīrūnī’s three-planet impediment in which an intermediate planet retrogrades toward the intended superior receiver and is then met by the original inferior applicant, diverting the conjunction that had originally been expected. It is kept distinct from Antiochus’ Intervention by Rays, whose recognition rule is geometrically different.',
  'reviewed',
  'Source-specific al-Bīrūnī mechanism preserved after cross-source false-friend reconciliation.'
FROM terms WHERE slug='intervention';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='intervention');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'three-planet-sequence','The three-planet sequence',
  'The original inferior planet is moving toward a superior receiver. An intermediate planet retrogrades toward that receiver and becomes involved in the sequence; the original applicant then meets the intermediate planet instead, so the intended conjunction is diverted.',10,'reviewed',NULL
FROM terms WHERE slug='intervention';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-rays','Not Antiochus’ Intervention by Rays',
  'Antiochus uses the translated word Intervention for a different condition in which a third star casts rays into the intermediate degrees of an application. That doctrine is represented separately as Intervention by Rays. The shared English label does not make the mechanisms equivalent.',20,'reviewed',NULL
FROM terms WHERE slug='intervention';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'impediment-family','One specific impediment among several',
  'Intervention belongs to the broader family of failed or diverted applications, but it is not a generic synonym for Prohibition, Abscission of Light, Frustration or other named interruptions. Each entry retains its own sequence of motions and contacts.',30,'reviewed',NULL
FROM terms WHERE slug='intervention';

-- -----------------------------------------------------------------------------
-- OPENING OF THE GATES: RECEPTION, NOT AL-BIRUNI WEATHER DOCTRINE
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Opening of the Gates is Bonatti’s reception doctrine for the good will and security created when one planet receives another into a qualifying dignity, allowing reception to overcome their ordinary hostility as though the receiving planet had opened its house to a guest. It is unrelated in mechanism to al-Bīrūnī’s meteorological Opening the Doors.',
  'reviewed',
  'Direct Bonatti reception doctrine. Keep separate from al-Bīrūnī’s weather term despite the similar English translation.'
FROM terms WHERE slug='opening-of-gates';

DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='opening-of-gates');
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'reception-over-hostility','Reception overcomes ordinary hostility',
  'Bonatti distinguishes the ordinary friendship or hostility of planets from what happens in a particular encounter. Qualifying reception can make an otherwise hostile receiver accept the other planet with security and good will; this effect is what he calls Opening of the Gates.',10,'reviewed',NULL
FROM terms WHERE slug='opening-of-gates';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'house-metaphor','The opened-house metaphor',
  'The expression describes the receiving planet metaphorically opening its house to the guest because the guest occupies one of the receiver’s qualifying dignities. The technical basis is reception, not a literal gate, aspect type or weather configuration.',20,'reviewed',NULL
FROM terms WHERE slug='opening-of-gates';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-opening-doors','Not al-Bīrūnī’s Opening the Doors',
  'Opening the Doors is a separate meteorological doctrine involving planets opposed by nature or domicile and used as a weather testimony. Similar English wording conceals two unrelated recognition rules, so the encyclopedia keeps the entries explicitly separate.',30,'reviewed',NULL
FROM terms WHERE slug='opening-of-gates';

-- Explicit composition for all final A-tier entries.
DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'combust-way','frustration-bonatti','in-own-light','intervention','opening-of-gates'
  )
);

INSERT INTO term_page_sections (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'source-distinction','Source distinction',10,'reviewed','Final A-tier false-friend composition.'
FROM terms WHERE slug IN (
  'combust-way','frustration-bonatti','in-own-light','intervention','opening-of-gates'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed','Final A-tier false-friend composition.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='source-distinction'
  AND ps.term_id IN (
    SELECT id FROM terms WHERE slug IN (
      'combust-way','frustration-bonatti','in-own-light','intervention','opening-of-gates'
    )
  )
  AND s.status IN ('reviewed','published');
