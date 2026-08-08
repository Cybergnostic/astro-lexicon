-- Sequential extraction of Guido Bonatti, Liber Astronomiae.
-- Second Tractate, Part III (PDF pp. 152-220).
-- Only definition-level or substantively explanatory evidence is retained.
-- The editorial appendix beginning on PDF p. 221 is not Bonatti and is not attributed to him.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('derived-house', 'Derived House', 'A house obtained by treating another house as a temporary first house and counting from it, so that relationships and topics belonging to another person or matter can be judged from the corresponding relative house.', 'house doctrine', 'draft', 'Bonatti does not use the modern English label “derived house,” but explicitly applies the method throughout his house doctrine. Canonical label is editorial for a clearly defined technique.'),
  ('almuten', 'Almuten', 'The planet having the greatest total of relevant dignities or fortitudes in the place signifying a matter, and therefore chosen as the principal significator of that matter even when it is not the domicile ruler.', 'significator doctrine', 'draft', 'Bonatti gives the Latinized form Almutes and glosses it as “the victor.” Do not reduce this to simple sign rulership.'),
  ('own-similitude', 'Own Similitude', 'An accidental planetary fortitude in which a diurnal planet is above the earth by day or below it by night, a nocturnal planet is above the earth by night or below it by day, and the planet also agrees in gender with the sign it occupies.', 'planetary condition', 'draft', 'Bonatti associates this with the term Aym. Preserve it independently from hayz until cross-source comparison establishes the historical relationship.'),
  ('first-motion', 'First Motion', 'The daily motion of the firmament from east toward west, carrying the celestial sphere around the earth.', 'astronomical motion', 'draft', 'Bonatti contrasts it with the planets’ own zodiacal motion.'),
  ('second-motion', 'Second Motion', 'The planets’ own motion through the zodiac from west toward east, contrary to the daily first motion except during apparent retrogradation.', 'astronomical motion', 'draft', 'Bonatti uses this distinction while explaining the order in which the houses are numbered.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Almutes', 'Latinized Arabic', 'source-form', 'Bonatti’s form; he explains it as “the victor.”' FROM terms WHERE slug='almuten';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Victor', 'English', 'translation', 'Bonatti’s explanatory gloss for Almutes.' FROM terms WHERE slug='almuten';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Aym', 'Latinized Arabic', 'source-form', 'Bonatti’s name for the accidental fortitude he describes as being in one’s own similitude.' FROM terms WHERE slug='own-similitude';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '152', '158', 'Second Tractate, Part III', 'Chs. I-IV',
       'House division, quadrants, ascending/descending halves, angular, succedent and cadent houses', NULL,
       'Bonatti distinguishes the twelve houses from zodiacal signs and gives explicit structural and strength classifications.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti describes the twelve houses as divisions beginning from the Ascendant and produced from the horizon and meridian framework. He distinguishes these houses from signs and says each quadrant is divided into three parts. He also transmits a rule that five degrees already past a house boundary are still reckoned to that house.',
       'Second Tractate, Part III, Ch. I', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the first, tenth, seventh and fourth houses angles and treats them as the strongest places. His general order among the angles is first, tenth, seventh, fourth, although the tenth takes precedence in matters of rank, office and public authority.',
       'Second Tractate, Part III, Ch. IV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cardine' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The second, fifth, eighth and eleventh are succedent because they follow the angles and move toward them by the daily motion. Bonatti treats them as intermediate in strength between angles and cadents, while assigning the eleventh exceptional strength in matters of hope and fortune.',
       'Second Tractate, Part III, Chs. IV and VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='succedent-place' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The third, sixth, ninth and twelfth are cadent because they fall away from the angles. Bonatti generally treats cadency as weakness and failure to bring matters firmly to completion, while making explicit exceptions for the ninth in religion and the third relative to the weakest houses.',
       'Second Tractate, Part III, Chs. IV and VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cadent-place' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '158', '181', 'Second Tractate, Part III', 'Ch. V',
       'Significations of the twelve houses and systematic use of relative or derived houses', NULL,
       'The chapter is extensive. Core house doctrine and the method of deriving houses are summarized rather than reproducing long topical catalogues.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti gives extensive significations for all twelve houses and repeatedly derives secondary meanings by counting a house relative to another: for example, the first may signify the second from the twelfth, the third from the eleventh, and so forth. He explicitly states that each house can function as its own first and therefore possesses its own second through twelfth houses.',
       'Second Tractate, Part III, Ch. V', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='derived-house' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti’s twelve-house doctrine is both topical and relational. The first concerns life, body and beginnings; the second substance and acquisitions; the third siblings, close relations, short journeys and forms of religion; the fourth fathers, land, immovable property, hidden things and endings; the fifth children and delights; the sixth infirmities, servants and lesser animals; the seventh spouses, opponents, contracts and disputes; the eighth death and inheritances from the dead; the ninth religion, wisdom and long journeys; the tenth rule, profession, office and mothers; the eleventh fortune, hope and friends; the twelfth hidden enemies, confinement, sorrow and large animals. These are source-specific medieval significations and should not be silently modernized.',
       'Second Tractate, Part III, Ch. V', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '181', '205', 'Second Tractate, Part III', 'Ch. VI',
       'House lords placed in other houses and practical determination of house significations', NULL,
       'Very long applied catalogue. It is retained as evidence for the technique, but individual combinations are not promoted into separate lexicon terms.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '206', '210', 'Second Tractate, Part III', 'Chs. VII-VIII',
       'House numbering and comparative strength of the twelve houses', NULL,
       'High-value structural doctrine; the source gives a detailed comparative ranking rather than only angular/succedent/cadent categories.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti explains the conventional numbering of houses as following the planets’ zodiacal or second motion rather than the daily rotation of the firmament. The houses are therefore numbered from the Ascendant toward the second, third and fourth, contrary to the first motion.',
       'Second Tractate, Part III, Ch. VII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='second-motion' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti calls the daily east-to-west rotation of the firmament the first motion. He contrasts it with the planets’ ordinary west-to-east progress through the zodiac and treats retrogradation as an accidental departure from their normal second motion.',
       'Second Tractate, Part III, Ch. VII and Ch. IX', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='first-motion' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti’s comparative house ranking is more specific than a simple angular/succedent/cadent division. He ranks the first above the tenth, tenth above seventh, seventh above fourth, then eleventh, fifth, ninth and third; the second and eighth are weaker, while the sixth and twelfth are the weakest and most adverse. The proper topic of a house can override this general ranking for that topic.',
       'Second Tractate, Part III, Ch. VIII', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='twelve-places' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '211', '212', 'Second Tractate, Part III', 'Chs. IX-XI',
       'Planetary motion, house colours and planetary joys', NULL,
       'Colour correspondences are not promoted to a separate term. Planetary joy receives a substantive interpretation.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti defines joy as an accidental power a planet has in a particular house because the house’s significations correspond to the planet’s own nature. He gives Mercury in the first, Moon in the third, Venus in the fifth, Mars in the sixth, Sun in the ninth, Jupiter in the eleventh and Saturn in the twelfth, explaining each by that correspondence.',
       'Second Tractate, Part III, Ch. XI', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-joy' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '213', '219', 'Second Tractate, Part III', 'Chs. XII-XIV',
       'Angular, succedent and cadent outcomes; house lords; selection of the strongest significator or Almutes', NULL,
       'Bonatti explicitly distinguishes the domicile lord from the planet with the greatest relevant dignity total.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'For a matter belonging to a house, Bonatti says the domicile ruler is not automatically its effective significator. The planet with the greatest number of relevant fortitudes in the house is Almutes, “the victor,” and is preferred as principal significator. His worked example gives the Sun seven points in the second-house degree versus Mars six, so the Sun becomes significator even though Mars rules Aries.',
       'Second Tractate, Part III, Ch. XIV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='almuten' AND w.slug='bonatti-liber-astronomiae';

INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '219', '220', 'Second Tractate, Part III', 'Ch. XV',
       'Accidental powers and the planetary condition called own similitude or Aym', NULL,
       'Bonatti’s own definition is retained. Robert Hand’s identification of Aym with hayz is editorial commentary and is not treated as Bonatti’s statement.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='bonatti-liber-astronomiae';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Bonatti says a planet is in its own similitude when its sect and position relative to the horizon agree—diurnal above the earth by day or below by night, nocturnal above by night or below by day—and when a masculine planet occupies a masculine sign or a feminine planet a feminine sign. He calls this Aym and treats it as a modest accidental fortitude that enables a significator to perfect its matter more effectively.',
       'Second Tractate, Part III, Ch. XV', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='own-similitude' AND w.slug='bonatti-liber-astronomiae';
