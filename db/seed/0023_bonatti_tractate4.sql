-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Treatise 4: Conjunctions, PDF pp. 360-368.
-- Only definition-level or substantively explanatory material is retained.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('great-conjunction-cycle', 'Great Conjunction Cycle', 'A hierarchy of Saturn-Jupiter conjunctions distinguished by the scale at which their conjunctions recur through the zodiac and its triplicities.', 'mundane astrology', 'draft', 'Bonatti distinguishes a 960-year return to the beginning of Aries, a 240-year change of triplicity, and ordinary 20-year Saturn-Jupiter conjunctions. Preserve this as Bonatti’s conjunctional framework rather than a universalized modern doctrine.'),
  ('saturn-mars-cancer-conjunction', 'Saturn-Mars Conjunction in Cancer', 'A special mundane conjunction of Saturn and Mars at the beginning or first bound of Cancer, treated by Bonatti as more destructive than their conjunctions elsewhere because Cancer is contrary to both planets’ dignities.', 'mundane astrology', 'draft', 'Source-specific doctrine. Bonatti treats the same conjunction in Capricorn as mitigated by mutual reception.'),
  ('combust-hours', 'Combust Hours', 'A recurring twelve-hour interval beginning from the exact conjunction of the Sun and Moon and recurring after each following seventy-two-hour incombust interval.', 'electional time doctrine', 'draft', 'Bonatti transmits this from earlier authorities under the names Albuim or Albuith. This is not solar combustion of a planet.'),
  ('incombust-hours', 'Incombust Hours', 'A seventy-two-hour interval following twelve combust hours in the post-lunation cycle, during which the prohibition attached to the combust hours is absent unless another impediment intervenes.', 'electional time doctrine', 'draft', 'Defined only within the special Sun-Moon hour cycle of Treatise 4, Chapter 7.'),
  ('moon-duodena-hours', 'Duodena of the Moon', 'A post-lunation sequence of unequal four-hour periods assigned successively to the rulers of the four triplicities, repeated until the next Sun-Moon conjunction.', 'electional time doctrine', 'draft', 'Bonatti identifies this with the “duodena of the Moon” attributed to Ptolemy. Do not confuse it with zodiacal twelfth-parts or dodecatemoria.'),
  ('conjunctional-nativity', 'Conjunctional Nativity', 'A nativity or beginning whose preceding relevant syzygy is the conjunction of the Sun and Moon.', 'syzygy doctrine', 'draft', 'Bonatti uses the conjunctional/preventional distinction in his rectification procedure.'),
  ('preventional-nativity', 'Preventional Nativity', 'A nativity or beginning whose preceding relevant syzygy is the opposition of the Sun and Moon.', 'syzygy doctrine', 'draft', 'Bonatti uses “prevention” for the opposition preceding the nativity or beginning in this rectification context.'),
  ('syzygy-almuten-rectification', 'Syzygy Almuten Rectification', 'A rectification procedure that adjusts an approximate Ascendant to the degree occupied by the planet having the greatest dignity in the degree of the preceding conjunction or opposition.', 'rectification', 'draft', 'Bonatti calls the dominant planet al-mubtazz. Store the procedure; do not assume every later method of rectification is identical.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Albuim', 'Latinized Arabic', 'source-alias', 'Name transmitted by Bonatti for the combust-hour doctrine.' FROM terms WHERE slug='combust-hours';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Albuith', 'Latinized Arabic', 'source-alias', 'Variant name transmitted by Bonatti for the combust-hour doctrine.' FROM terms WHERE slug='combust-hours';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '360', '365', 'Treatise 4', 'Chapters 1-6', 'Hierarchy of mundane conjunctions; Saturn-Jupiter cycles; Saturn-Mars conjunction in Cancer; annual Aries ingress and lunations', NULL,
       'High-level conjunction taxonomy retained. Long timing examples are summarized rather than reproduced.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti ranks six major conjunctional configurations used in mundane judgment. Within the Saturn-Jupiter cycle he distinguishes the greatest return at the beginning of Aries after about 960 years, the shift of their conjunctions into a new triplicity after about 240 years, and the ordinary conjunction occurring about every 20 years. The doctrine is explicitly hierarchical: the rarer conjunctions signify broader and more consequential changes.',
       'Treatise 4, Chapters 1 and 4', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='great-conjunction-cycle' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti singles out the Saturn-Mars conjunction at the beginning or first bound of Cancer as especially harmful because Cancer is contrary to both: it opposes Saturn’s domicile Capricorn and Mars’s exaltation there. He explicitly contrasts this with their conjunction in Capricorn, where mutual reception mitigates their malice.',
       'Treatise 4, Chapter 3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='saturn-mars-cancer-conjunction' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '365', '367', 'Treatise 4', 'Chapter 7', 'Combust and incombust hours after the Sun-Moon conjunction; duodena of the Moon', NULL,
       'Distinct hour-cycle doctrine. The violent examples attached to bad elections are not reproduced; the technical structure is retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Beginning from the exact Sun-Moon conjunction, Bonatti transmits a repeating sequence of 12 combust hours followed by 72 incombust hours, continuing until the next conjunction. The 12 combust hours are themselves divided into three groups of four. This is an electional timing condition and is unrelated to a planet being combust under the Sun’s rays.',
       'Treatise 4, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combust-hours' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The 72 hours following each 12-hour combust interval are called incombust. Bonatti treats them as generally available for beginning actions, provided no other astrological impediment is present.',
       'Treatise 4, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='incombust-hours' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti’s “duodena of the Moon” is a temporal sequence beginning at the lunation. Unequal time is divided into repeated four-hour segments and assigned in order to the rulers of the fiery, earthy, airy and watery triplicities. The Moon’s condition during a segment is judged in relation to the planet ruling that segment.',
       'Treatise 4, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='moon-duodena-hours' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '367', '368', 'Treatise 4', 'Chapter 8', 'Rectification of an uncertain Ascendant using the preceding conjunction or opposition and its al-mubtazz', NULL,
       'Bonatti gives an operational rectification rule. The dominant planet is called al-mubtazz; this passage is stored as a procedure rather than used to manufacture a broader definition of almuten without cross-source review.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti distinguishes beginnings according to whether the relevant preceding syzygy was a conjunction or an opposition of the luminaries. He calls the first conjunctional and uses that distinction as the first step in his Ascendant-rectification procedure.',
       'Treatise 4, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='conjunctional-nativity' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The preventional case is the counterpart to the conjunctional case: the relevant preceding syzygy is the opposition of the Sun and Moon. Bonatti uses the degree of that opposition in the same rectification procedure.',
       'Treatise 4, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='preventional-nativity' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'When the reported birth or inception time is approximate, Bonatti first calculates a provisional Ascendant, determines whether the preceding syzygy was conjunctional or preventional, finds the planet strongest by dignity in the degree of that syzygy, and then adjusts the Ascendant to the degree occupied by that dominant planet. The procedure is explicitly presented as a rectification of an uncertain time.',
       'Treatise 4, Chapter 8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='syzygy-almuten-rectification' AND w.slug='bonatti-liber-astronomiae';
