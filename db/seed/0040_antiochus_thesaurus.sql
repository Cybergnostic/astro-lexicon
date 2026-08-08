-- Sequential extraction of Antiochus of Athens, The Thesaurus.
-- Project Hindsight Greek Track II-B, Robert Schmidt trans., Robert Hand ed., 1993.
-- Substantive Antiochus text reviewed sequentially from PDF pp. 13-65; PDF pp. 66-68 are editorial translation conventions.
-- Only definition-level or substantively explanatory material is retained. Long delineation catalogues are not promoted.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('co-rising-relation', 'Co-rising Relation', 'A relation between zodiacal signs based on equal or corresponding ascensional behavior, used as a form of sympathy even where ordinary zodiacal aspect is absent.', 'sign relationship', 'draft', 'Antiochus distinguishes co-rising/equal-power relations from ordinary zodiacal configuration. Preserve the source-specific relation until cross-author normalization.'),
  ('hearing-seeing-relation', 'Hearing and Seeing Relation', 'A directional relation between zodiacal signs based on their ordering around the zodiac, expressed as one sign hearing or seeing another.', 'sign relationship', 'draft', 'Antiochus treats this as a technical inter-sign relation used in natal and electional delineation. Do not reduce it to modern aspect language.'),
  ('looking-ahead', 'Looking Ahead', 'A directional condition in which a preceding star regards the succeeding star by an allowed configuration, following the order opposite the planets’ ordinary zodiacal motion.', 'aspect relation', 'draft', 'Source-specific Hellenistic directional aspect terminology.'),
  ('hurling-of-rays', 'Hurling of Rays', 'A directional aspect doctrine in which a succeeding planet casts its ray toward a preceding planet through an allowed configuration.', 'aspect relation', 'draft', 'Antiochus contrasts this with looking ahead. Later authors may use ray terminology differently.'),
  ('spear-bearing', 'Spear-bearing', 'A protective or attendant configuration in which a star stands in a specified relation to a luminary or another star, with different rules by sect and by solar or lunar reference.', 'planetary configuration', 'draft', 'Antiochus gives several forms. Do not collapse automatically into every later doruphoria/dasturiya usage.'),
  ('position-upon-tenth-place', 'Position upon the Tenth Place', 'A superiority relation in which one configured star occupies the tenth zodiacal place from another.', 'planetary configuration', 'draft', 'Antiochus treats the tenth-from relation as a distinct form of superiority.'),
  ('affliction', 'Affliction', 'A harmful condition produced when a planet is struck by malefic rays, contained, contacted by application, opposed, or ruled from one of the source’s places in which no dealings are made.', 'planetary condition', 'draft', 'This is Antiochus’ compact technical definition, not a generic modern synonym for any difficult placement.'),
  ('places-for-dealings', 'Places for Having Dealings', 'The places from the Ascendant in which planetary dealings are said to occur: the four pivots, the second trigons, and the post-ascensions of the Ascendant and Midheaven.', 'house doctrine', 'draft', 'Source-specific grouping of places. Preserve separately from the ordinary angular/succedent/cadent classification.'),
  ('places-without-dealings', 'Places in Which No Dealings Are Made', 'A source-specific group of places associated with the absence or failure of dealings, contrasted with the places for having dealings.', 'house doctrine', 'draft', 'Antiochus explicitly includes the sixth, third, second, eighth and twelfth in this grouping in the transmitted text.'),
  ('counter-revolution', 'Counter-revolution', 'A condition in which diurnal planets occupy the places of nocturnal planets or nocturnal planets the places of diurnal planets.', 'sect condition', 'draft', 'Antiochus defines this directly and treats it as afflicting.'),
  ('reciprocal-mastership', 'Reciprocal Mastership', 'A reciprocal dignity relation in which each of two planets occupies a place of rulership belonging to the other.', 'reception doctrine', 'draft', 'Antiochus defines this separately. It is historically close to mutual reception but should remain source-visible until editorial normalization.'),
  ('contact-kollesis', 'Contact (Kollesis)', 'The approach of a faster planet to a slower one within three degrees, treated as application in the strictest sense.', 'application doctrine', 'draft', 'Antiochus’ transmitted definition gives a three-degree condition. Keep as a source-specific application subtype rather than replacing the broader canonical Application entry.'),
  ('intervention', 'Intervention', 'Interference in an application when another planet casts its rays into the intermediate degrees through which the application is proceeding.', 'perfection and impediment', 'draft', 'Antiochus defines intervention by the third planet’s ray entering the intervening degrees.'),
  ('surpassing', 'Surpassing', 'A condition in which one planet passes beyond the degree of another, either bodily or by configuration.', 'planetary motion and aspect doctrine', 'draft', 'Source-specific concise definition.'),
  ('bond-of-moon', 'Bond of the Moon', 'A solar-proximity condition of the Moon beginning when it is within fifteen degrees of the Sun and lasting through conjunction until it has separated by the same number of degrees.', 'lunar solar condition', 'draft', 'Antiochus calls the Moon bound in this interval. This is distinct from generic under-the-beams terminology.'),
  ('juxtaposition', 'Juxtaposition', 'A relation in which stars occupy the same boundaries, either bodily or by configuration, or stand upon one another relative to the boundaries of the same star.', 'dignity and aspect doctrine', 'draft', 'The transmitted wording admits more than one interpretation; preserve the ambiguity rather than forcing a later equivalent.'),
  ('containment', 'Containment', 'A configuration in which two planets have one mean planet between them by figure, with that middle planet lying within seven degrees ahead or behind.', 'planetary configuration', 'draft', 'Antiochus’ containment is a specific three-planet aspect pattern and is not generic enclosure.'),
  ('chariot-condition', 'Chariot Condition', 'A condition in which a planet is in its own domicile, exaltation, or bounds, especially when under the Sun’s beams, where the dignity is said to protect or strengthen it.', 'planetary condition', 'draft', 'Antiochus says planets in their own chariots rejoice at these places even under the beams. Compare later chariot terminology carefully.'),
  ('rejoicing-condition', 'Rejoicing Condition', 'A planetary condition in which a star rejoices according to quadrant, solar phase, sect, or related placement appropriate to its nature.', 'planetary condition', 'draft', 'Antiochus gives several source-specific ways planets rejoice. Distinct from the conventional planetary joys by house.'),
  ('ninth-part-antiochus', 'Ninth-part', 'One of nine equal divisions of a sign, each measuring three degrees and twenty minutes, assigned through a sign-rulership sequence beginning from the movable sign of the triplicity.', 'zodiacal subdivision', 'draft', 'This is Antiochus’ transmitted ninth-part procedure in Part II; compare with Arabic nawbahr/navamsa traditions during normalization.'),
  ('twelfth-part', 'Twelfth-part', 'A two-and-a-half-degree subdivision produced by multiplying a position within a sign by twelve and projecting the result through the zodiac.', 'zodiacal subdivision', 'draft', 'Antiochus reports several methods and prefers the multiplication-by-twelve procedure associated with Ptolemy.'),
  ('planetary-recurrence', 'Planetary Recurrence', 'A long period assigned to a planet for the return of its cyclical relation, distinct from its ordinary greatest, middle, least, or final years.', 'time lord and planetary periods', 'draft', 'Antiochus gives very long recurrence values for the seven planets; retain the concept without treating the numerical catalogue as a universal rule.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Reciprocal Rulership', 'English', 'translation-variant', 'Descriptive equivalent of reciprocal mastership.' FROM terms WHERE slug='reciprocal-mastership';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Kollesis', 'Greek transliteration', 'source-term', 'Greek term represented by Schmidt as contact.' FROM terms WHERE slug='contact-kollesis';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Twelfth Parts', 'English', 'variant', 'Plural form used in the source heading.' FROM terms WHERE slug='twelfth-part';

-- PART I: zodiacal classifications, sect, dignities and sign relationships.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '13', '23', 'Part I', 'Prooemium and §§1-9',
       'Tropical, solid and bicorporeal signs; masculine/feminine signs and planets; planetary sect; mixtures; exaltations/depressions; contrarieties; triplicity masters', NULL,
       'Sequentially reviewed from the beginning of Antiochus’ text. Translator/editor footnotes are not attributed to Antiochus.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Antiochus divides the stars by sect for diurnal and nocturnal births. He assigns Saturn, Jupiter and Mars to the Sun’s side and Venus to the Moon’s side, while Mercury changes according to phase; he then explains that planets are strengthened when configured with the members appropriate to their sect and can become more harmful when contrary to it.',
       'Part I, §2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='sect' AND w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Antiochus gives three masters for each trigonal side across the whole 360-degree zodiac and distinguishes their use by day and night. The scheme is explicitly a rulership of triplicities rather than a simple sign-lord list.',
       'Part I, §9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='triplicity-rulers' AND w.slug='antiochus-thesaurus';

-- Decans, bright stars, bounds, ascensions, aspects and non-zodiacal sympathies.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '23', '32', 'Part I', '§§10-18',
       'Decans, co-rising bright stars, Egyptian and Ptolemaic boundaries, zone ascensions, body parts, aspects by zodiac and ascension, sympathy, and twelfth-parts', NULL,
       'Long decan delineation catalogues are reviewed but not promoted. Structural doctrines are retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Antiochus treats the decans as thirty-six ten-degree divisions of the zodiac, three in each sign, with planetary faces associated with them. The source then gives long delineation catalogues which are not treated as separate lexicon entries.',
       'Part I, §10', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='face-decan' AND w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Antiochus says the boundaries are sign subdivisions with specific planetary assignments and discusses both Egyptian and Ptolemaic systems. He emphasizes that the bound containing a planet modifies that planet’s effect according to the bound ruler’s nature.',
       'Part I, §12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='terms' AND w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Beyond ordinary zodiacal configurations, Antiochus recognizes sign relationships based on ascensional correspondence. Signs of equal or related rising behavior can possess sympathy even though they do not form one of the ordinary zodiacal aspects.',
       'Part I, §§15-17', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='co-rising-relation' AND w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Antiochus reports several methods of twelfth-parts and prefers the procedure in which the zodiacal position within a sign is multiplied by twelve and projected through the signs. He treats the resulting subdivision as important in natal delineation.',
       'Part I, §18', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='twelfth-part' AND w.slug='antiochus-thesaurus';

-- Directional aspect vocabulary and configurations.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '33', '40', 'Part I', '§§19-39',
       'Hearing/seeing, looking ahead, hurling of rays, spear-bearing, tenth-place superiority, affliction, dealings, counter-revolution, reciprocal mastership, contact, application, intervention, surpassing, lunar bond and void course', NULL,
       'Dense technical vocabulary block. Definitions are preserved source-by-source instead of normalized prematurely.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus describes a directional relation in which signs are said to hear and see one another according to their ordering. He explicitly uses the relation in judgments concerning travel, dangers and similar topics.', 'Part I, §19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hearing-seeing-relation' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Looking ahead belongs to the preceding planet or sign in relation to the succeeding one and follows a direction opposite the planets’ ordinary zodiacal motion, while still requiring an allowed configuration.', 'Part I, §20', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='looking-ahead' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Hurling of rays is the converse directional relation: a succeeding planet casts its ray back toward a preceding planet through the configured zodiacal relation.', 'Part I, §21', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hurling-of-rays' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus gives several forms of spear-bearing. These include a star in dignity casting rays ahead of a luminary, sect-appropriate planets acting as attendants, certain relations to the Midheaven or Ascendant, and a star attending a luminary when the luminary is angular.', 'Part I, §§23-24', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='spear-bearing' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'A planet has position upon the tenth place when, while configured to another, it occupies the tenth zodiacal place from it. Antiochus treats this as a form of superiority.', 'Part I, §26', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='position-upon-tenth-place' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Affliction is defined through several concrete mechanisms: harmful malefic rays, containment, contact/application, opposition, or rulership from one of the places in which no dealings are made.', 'Part I, §27', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='affliction' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus names the four pivots, the second trigons and the post-ascensions of the Ascendant and Midheaven as places for having dealings.', 'Part I, §28', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='places-for-dealings' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The transmitted text contrasts the dealing places with a group in which no dealings are made, explicitly naming the sixth, third, second, eighth and twelfth in this context.', 'Part I, §27', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='places-without-dealings' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Counter-revolution occurs when diurnal planets occupy the places of nocturnal planets or nocturnal planets those of diurnal planets. Antiochus treats the state as an affliction.', 'Part I, §31', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='counter-revolution' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Reciprocal mastership occurs when each planet is situated in a dignity belonging to the other, for example the exaltation of one corresponding to a house of the other. This is a reciprocal rulership relation.', 'Part I, §32', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reciprocal-mastership' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus’ strict contact occurs when the faster planet approaches the slower and is within three degrees. The section explicitly glosses this as application in the most proper sense.', 'Part I, §34', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='contact-kollesis' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus gives a strict application condition in which the faster planet approaches the slower within three degrees. The broader project entry should retain this as a source-specific threshold rather than replacing other authors’ application rules.', 'Part I, §§34-35', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Intervention occurs when another star casts its rays into the intermediate degrees of an ongoing application, thereby inserting itself into the contact.', 'Part I, §36', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='intervention' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Surpassing occurs whenever one star passes beyond the degree of another either bodily or by configuration.', 'Part I, §37', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='surpassing' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The Moon enters its bond when it comes within fifteen degrees of the Sun; it remains bound through conjunction and is released only after separating by the same distance.', 'Part I, §38', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='bond-of-moon' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus defines void course simply as the Moon not applying to any planet either bodily or by configuration.', 'Part I, §39', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='void-of-course' AND w.slug='antiochus-thesaurus';

-- Further three-planet conditions, strength and solar/sect conditions.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '41', '45', 'Part I', '§§40-46',
       'Juxtaposition, containment, power, chariots, rejoicing, under the beams, and the twelve centers/post-ascensions/declines', NULL,
       'Several definitions here are unusually concise and technical. Ambiguous translator/editor notes are retained only as internal context.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Juxtaposition is said to occur when planets share the same bounds bodily or by configuration, or when one stands upon another relative to the bounds of the same star. The transmitted syntax is ambiguous, so the entry remains broad.', 'Part I, §40', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='juxtaposition' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Containment is a three-planet figure in which two planets have one mean planet between them, the middle body lying within seven degrees ahead or behind.', 'Part I, §41', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='containment' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus says planets in their own chariots are in their own domicile, exaltation or bounds. They rejoice at these places even when under the Sun’s beams, and benefics increase good while malefics may be altered toward benefic action.', 'Part I, §43', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='chariot-condition' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus gives several ways planets rejoice: by eastern or western quadrants according to planet, by position above or below the earth according to sect, and by other conditions appropriate to the planet’s nature.', 'Part I, §44', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='rejoicing-condition' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus treats being under the Sun’s beams as a distinct condition that may occur whether a planet is ahead of or behind the Sun, and says its exact determination belongs to the calculation of planetary phases.', 'Part I, §45', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='antiochus-thesaurus';

-- Lots and planetary periods.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '45', '51', 'Part I', '§§47-53',
       'Significations and effects of lots; planetary final/least years; zone hours; planetary recurrences; stars unconnected with the lights; spear-bearers of the Sun', NULL,
       'The individual lot and character catalogues are reviewed but not promoted wholesale. Time-period structures receive reusable interpretations.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus explicitly treats the Lot of Fortune as a bodily and livelihood significator associated with reputation, matters of the soul, companionship and public standing. This is a source-specific topical range rather than a new formula definition.', 'Part I, §47', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='part-of-fortune' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus preserves several classes of planetary years, including final and least years, alongside much longer recurrence periods. The numerical values are source data; the important structural point is that these are distinct period classes rather than one undifferentiated set of planetary years.', 'Part I, §§49-51', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-years' AND w.slug='antiochus-thesaurus';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus assigns each of the seven planets a very long recurrence period and then describes an immense combined recurrence of the seven wandering stars. These recurrences are conceptually distinct from the planets’ ordinary year allocations.', 'Part I, §51', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-recurrence' AND w.slug='antiochus-thesaurus';

-- PART II: electional and miscellaneous excerpts.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, locator_text, quote, internal_notes)
SELECT e.id, '52', '65', 'Part II', '§§1-9',
       'Moon applications for elections; harmful degrees; medical and character catalogues; planetary hours; lunar particulars; decans; calends; seven planets; winds and twenty-four steps', NULL,
       'Sequentially reviewed. Electional, medical, sexual and character catalogues are not converted into large numbers of lexicon terms; only reusable structural definitions are retained.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'In the electional excerpts Antiochus treats lunar application to conjunction and aspect with the seven planets as a principal timing framework. The individual activity-by-activity prescriptions are applications of the doctrine and are not promoted into separate terms.', 'Part II, §1', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='antiochus-thesaurus';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Antiochus divides each sign into nine equal ninth-parts of 3°20′ and assigns their rulers through a sequence beginning from the movable sign of the relevant triplicity. The resulting ninth-part ruler can support or diminish the principal significator according to its condition.', 'Part II, ninth-parts material transmitted in the excerpt tradition', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='ninth-part-antiochus' AND w.slug='antiochus-thesaurus';

-- CITE every interpretation above by its nearest supporting source-passage block.
INSERT INTO citations (interpretation_id, source_passage_id, citation_role)
SELECT i.id, sp.id, 'support'
FROM interpretations i
JOIN works w ON w.id=i.work_id
JOIN terms t ON t.id=i.term_id
JOIN editions e ON e.work_id=w.id
JOIN source_passages sp ON sp.edition_id=e.id
WHERE w.slug='antiochus-thesaurus'
  AND (
    (i.scope IN ('Part I, §2','Part I, §9') AND sp.locator_text LIKE 'Tropical,%') OR
    (i.scope IN ('Part I, §10','Part I, §12','Part I, §§15-17','Part I, §18') AND sp.locator_text LIKE 'Decans,%') OR
    (i.scope IN ('Part I, §19','Part I, §20','Part I, §21','Part I, §§23-24','Part I, §26','Part I, §27','Part I, §28','Part I, §31','Part I, §32','Part I, §34','Part I, §§34-35','Part I, §36','Part I, §37','Part I, §38','Part I, §39') AND sp.locator_text LIKE 'Hearing/seeing,%') OR
    (i.scope IN ('Part I, §40','Part I, §41','Part I, §43','Part I, §44','Part I, §45') AND sp.locator_text LIKE 'Juxtaposition,%') OR
    (i.scope IN ('Part I, §47','Part I, §§49-51','Part I, §51') AND sp.locator_text LIKE 'Significations and effects of lots%') OR
    (i.scope IN ('Part II, §1','Part II, ninth-parts material transmitted in the excerpt tradition') AND sp.locator_text LIKE 'Moon applications for elections%')
  );

-- Keep the source-specific reciprocal-mastership term linked to the broader reception ontology.
INSERT INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'historically-associated-with', 'Antiochus’ reciprocal mastership is a reciprocal dignity exchange closely related to later mutual-reception doctrine, but the source terminology is retained until cross-author normalization.', 'draft'
FROM terms a, terms b WHERE a.slug='reciprocal-mastership' AND b.slug='reception';
