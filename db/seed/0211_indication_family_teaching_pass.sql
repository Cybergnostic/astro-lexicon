-- Editorial family pass: complete Abū Maʿshar's doctrine of indication as a coherent
-- reader-facing family rather than five disconnected dictionary stubs.
--
-- The canonical corpus already distinguishes two independent axes:
--   * scope: universal vs particular indication;
--   * knowability: obvious/knowable vs hidden/subtle indication.
-- The root concept also remains explicitly distinct from causal celestial power.

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- ROOT ARTICLE: INDICATION
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'Indication is the significatory relation by which a celestial condition points to, or is taken as a sign of, a terrestrial condition. In Abū Maʿshar’s account this relation is central to astrology but is not identical with celestial causation: a planet or configuration can be discussed both in terms of what it signifies and, separately, in terms of the power by which celestial motion alters the lower world.',
  'reviewed',
  'Teaching synthesis from reviewed Abū Maʿshar Part I–II evidence and the cross-source foundational reconciliation.'
FROM terms WHERE slug='indication';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='indication');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'sign-and-signified','The celestial sign and the thing signified',
  'An indication is a relation of signification. The celestial condition is read as pointing toward another condition, event or quality; it is not itself the terrestrial event being judged. This distinction lets the source speak systematically about the conditions of planets and signs and then about what those conditions indicate.',
  10,'reviewed',NULL
FROM terms WHERE slug='indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-identical-cause','Indication is not identical with causal power',
  'Abū Maʿshar discusses celestial power and celestial indication as related but distinct ideas. Causal power concerns the alteration of the elemental or sublunary world; indication concerns the relation by which a celestial state signifies something else. The encyclopedia therefore keeps Celestial Power and Indication as separate concepts rather than treating every astrological signification as a claim of direct physical causation.',
  20,'reviewed',NULL
FROM terms WHERE slug='indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'two-axes','Two ways Abū Maʿshar classifies indications',
  'The source distinguishes indications by more than one criterion. Universal and Particular describe the breadth of what an indication concerns. Obvious and Hidden describe how accessible or reliably knowable the indication is to the astrologer. These are different axes: a narrow indication is not automatically hidden, and a broad indication is not automatically obvious.',
  30,'reviewed',NULL
FROM terms WHERE slug='indication';

INSERT OR REPLACE INTO term_article_tables
  (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'indication-axes','Two axes of indication',
  'Abū Maʿshar’s vocabulary separates the scope of an indication from the question of how knowable it is.',
  '["Axis","Term","What it distinguishes"]',
  '[["Scope","Universal Indication","Broad genera, species, populations or general worldly conditions"],["Scope","Particular Indication","Individuals, bodily parts, exact degrees, specific qualities or other narrow matters"],["Knowability","Obvious Indication","Indications sufficiently evident or knowable for practical judgment"],["Knowability","Hidden / Subtle Indication","Indications acknowledged as possible but too subtle or remote for reliable practical comprehension"]]',
  40,'reviewed',
  'Conceptual table derived from already-reviewed canonical definitions; it does not add a new source taxonomy beyond the two existing source distinctions.'
FROM terms WHERE slug='indication';

-- -----------------------------------------------------------------------------
-- SCOPE AXIS: UNIVERSAL / PARTICULAR
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Universal Indication is an astrological indication whose scope applies broadly—to a genus, species, population, general worldly condition or another wide class—rather than to one narrowly specified individual instance. Abū Maʿshar especially connects this broader scope with the twelve zodiacal signs because of their central role in the structure of the heavens and the changing conditions of the lower world.',
  'reviewed',
  'Source-backed teaching article from Abū Maʿshar Part II, especially the discussion of universal and particular indication.'
FROM terms WHERE slug='universal-indication';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='universal-indication');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','A broad scope of signification',
  'Universal does not mean that every universal indication applies identically to every individual. It describes the level or breadth of the matter being signified: general conditions, classes and wider natural or worldly processes rather than one narrowly delimited case.',
  10,'reviewed',NULL
FROM terms WHERE slug='universal-indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'zodiacal-role','Why the zodiacal signs receive universal scope',
  'In Abū Maʿshar’s argument, the twelve zodiacal signs occupy a privileged structural position because the Sun, seasons, planetary motions and processes of generation and corruption are organized in relation to them. He therefore treats their indications as especially universal in scope.',
  20,'reviewed',NULL
FROM terms WHERE slug='universal-indication';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Particular Indication is an astrological indication restricted to a narrower object or circumstance: an individual, bodily part, exact degree, specific property or another delimited matter. It is the scope-level counterpart of Universal Indication, not a weaker or less legitimate form of indication.',
  'reviewed',
  'Source-backed teaching article from Abū Maʿshar Part II.'
FROM terms WHERE slug='particular-indication';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='particular-indication');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'scope','A narrow or specified scope',
  'Particular indication concerns something more specifically delimited than a broad class or general worldly condition. Abū Maʿshar uses the distinction to separate universal zodiacal signification from more restricted indications associated with narrower stellar, bodily or degree-level particulars.',
  10,'reviewed',NULL
FROM terms WHERE slug='particular-indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-hidden','Particular does not mean hidden',
  'The Universal/Particular distinction concerns scope, whereas Obvious/Hidden concerns knowability. A particular indication can still be sufficiently evident for practical judgment; the two classifications answer different questions.',
  20,'reviewed',NULL
FROM terms WHERE slug='particular-indication';

-- -----------------------------------------------------------------------------
-- KNOWABILITY AXIS: OBVIOUS / HIDDEN
-- -----------------------------------------------------------------------------
INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'An Obvious Indication is an indication treated by Abū Maʿshar as sufficiently evident or knowable to be used in practical astrological judgment. The term belongs to an epistemic distinction: it concerns whether the significatory relation can be grasped reliably enough for practice, not whether its subject is broad or narrow.',
  'reviewed',
  'Source-bound epistemic category from the reviewed foundational doctrine.'
FROM terms WHERE slug='obvious-indication';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='obvious-indication');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'practical-knowledge','Usable in practical judgment',
  'The point of the category is practical knowability. An obvious indication is one whose relation can be apprehended with enough clarity to support judgment. The label therefore marks a limit of astrological knowledge rather than a claim that every indicated outcome is visually obvious or certain.',
  10,'reviewed',NULL
FROM terms WHERE slug='obvious-indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'paired-category','Paired with hidden or subtle indication',
  'Obvious and Hidden describe opposite sides of the source’s knowability distinction. The contrast leaves room for celestial indications that may exist in principle while remaining too subtle for dependable human interpretation.',
  20,'reviewed',NULL
FROM terms WHERE slug='obvious-indication';

INSERT OR REPLACE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,
  'A Hidden or Subtle Indication is an indication whose exact signification is treated as possible in principle but too remote, fine-grained or difficult for reliable practical comprehension. Abū Maʿshar uses this category to mark a limit on what an astrologer can reasonably claim to know from celestial signs.',
  'reviewed',
  'Source-bound epistemic category; wording remains deliberately cautious and does not expand hidden indication into clairvoyance or thought-reading.'
FROM terms WHERE slug='hidden-indication';

DELETE FROM term_article_sections
WHERE term_id=(SELECT id FROM terms WHERE slug='hidden-indication');

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'limit','A limit of reliable interpretation',
  'The category acknowledges that the celestial order may contain finer significatory relations than practical astrology can confidently distinguish. Hidden indication therefore functions as an epistemic boundary: possible signification is not the same thing as demonstrable or usable knowledge.',
  10,'reviewed',NULL
FROM terms WHERE slug='hidden-indication';

INSERT INTO term_article_sections
  (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'not-secret-reading','Not a license for secret-thought reading',
  'Hidden indication should not be confused with a general power to uncover any concealed fact. The source distinction concerns the limits of astrological knowability itself. Elsewhere the corpus separately records al-Bīrūnī’s criticism of attempts to infer unspoken thoughts from a chart.',
  20,'reviewed','Cross-reference conceptually consistent with the separate Thought Reading boundary entry; no equivalence asserted.'
FROM terms WHERE slug='hidden-indication';

-- -----------------------------------------------------------------------------
-- FAMILY RELATIONS
-- -----------------------------------------------------------------------------
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Universal and Particular distinguish broad versus narrow scope of indication.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='universal-indication' AND b.slug='particular-indication';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Particular and Universal distinguish narrow versus broad scope of indication.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='particular-indication' AND b.slug='universal-indication';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Obvious and Hidden distinguish practically knowable from subtle or unreliable indication.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='obvious-indication' AND b.slug='hidden-indication';
INSERT OR IGNORE INTO term_relations (subject_term_id,object_term_id,relation_type,note,status)
SELECT a.id,b.id,'contrasts-with','Hidden and Obvious distinguish subtle or unreliable from practically knowable indication.','reviewed'
FROM terms a CROSS JOIN terms b WHERE a.slug='hidden-indication' AND b.slug='obvious-indication';

-- -----------------------------------------------------------------------------
-- FAMILY-SPECIFIC PAGE COMPOSITION
-- -----------------------------------------------------------------------------
DELETE FROM term_page_sections
WHERE term_id IN (
  SELECT id FROM terms WHERE slug IN (
    'indication','universal-indication','particular-indication','obvious-indication','hidden-indication'
  )
);

INSERT INTO term_page_sections
  (term_id,section_key,heading,sort_order,status,editorial_notes)
SELECT id,'indication-doctrine','Doctrine of indication',10,'reviewed',
  'Family-specific composition for Abū Maʿshar’s indication vocabulary.'
FROM terms WHERE slug IN (
  'indication','universal-indication','particular-indication','obvious-indication','hidden-indication'
);

INSERT INTO term_page_blocks
  (page_section_id,source_kind,source_key,presentation_role,show_heading,sort_order,status,editorial_notes)
SELECT ps.id,'article-section',s.section_key,
       CASE WHEN s.sort_order=10 THEN 'paragraph' ELSE 'subsection' END,
       CASE WHEN s.sort_order=10 THEN 0 ELSE 1 END,
       s.sort_order,'reviewed',
       'Family-specific composition for the doctrine of indication.'
FROM term_page_sections ps
JOIN term_article_sections s ON s.term_id=ps.term_id
WHERE ps.section_key='indication-doctrine'
  AND s.status IN ('reviewed','published');
