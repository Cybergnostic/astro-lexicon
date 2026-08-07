-- Sequential extraction of Abū Maʿshar, The Great Introduction to Astrology.
-- Part VII, chapters 1-9. Read in order from PDF pp. 729-831 / translated pp. 715-817.
-- Public-facing summaries are original paraphrases; no long translated passages are stored.

INSERT OR IGNORE INTO terms (slug, label, short_definition, category, status, editorial_notes) VALUES
  ('planetary-domain', 'Planetary Domain / Hayz Condition', 'A condition combining planetary gender, sign gender, day/night, and position above or below the earth, with Mars treated exceptionally.', 'sect condition', 'draft', 'Part VII §1.13 translates ḥayyiz as domain. Keep this source formulation distinct from later simplified hayz/halb terminology.'),
  ('dasturiya', 'Dastūrīya', 'A source-specific condition associated with strong easterliness and the capacity to give the planet’s greatest years.', 'solar condition', 'draft', 'The Part repeatedly links dastūrīya with easterliness and greatest years but does not fully define the term here. Latin witnesses gloss it differently; do not over-normalize.'),
  ('planetary-body-power', 'Power of a Planetary Body', 'The degree-range before and behind a planet within which the source treats its bodily power as operative.', 'orb doctrine', 'draft', 'Part VII Chapter 3 assigns different ranges to Sun, Moon, Saturn/Jupiter, Mars, Venus/Mercury. This is historically related to later orb doctrine but should retain Abū Maʿshar’s wording.'),
  ('solitary-motion', 'Solitary Motion', 'A condition in which a planet separates from an application and makes no further application while remaining in its sign.', 'perfection condition', 'draft', 'Do not automatically equate with void of course; Part VII separately defines wildness and natural application.'),
  ('wild-planet', 'Wild Planet', 'A planet in a sign that is not aspected by any planet at all.', 'perfection condition', 'draft', 'Part VII says this occurs especially with the Moon and then relates it to term-lord application.'),
  ('reflecting-light', 'Reflecting the Light', 'A condition in which an intermediate planet redirects the light or signification of planets that do not directly connect.', 'perfection condition', 'draft', 'Two forms are distinguished in Part VII §5.17.'),
  ('giving-nature', 'Giving Nature', 'An application in which a planet applies to the ruler of one of the dignities it occupies and gives that planet’s nature to it.', 'perfection condition', 'draft', 'Part VII §5.19.'),
  ('giving-power', 'Giving Power', 'An application from a planet situated in one of its own dignities, by which it gives its own power to another planet.', 'perfection condition', 'draft', 'Part VII §5.20.'),
  ('giving-two-natures', 'Giving Two Natures', 'A compound application involving shared dignity or compatible domain/sect conditions, joining two planetary natures.', 'perfection condition', 'draft', 'Part VII §5.21 gives two distinct forms.'),
  ('giving-management', 'Giving Management', 'An application by which one planet hands its management or disposition to another, strengthened by agreement and reception.', 'perfection condition', 'draft', 'Part VII §5.22; Latin witnesses use disposition/consilium.'),
  ('returning-management', 'Returning', 'A condition in which what a planet receives through application is returned because the receiving planet is burnt or retrograde.', 'perfection condition', 'draft', 'Part VII distinguishes returning with soundness from returning with corruption.'),
  ('resistance', 'Resistance', 'A three-planet condition in which retrogradation redirects an intended application away from the originally targeted planet.', 'perfection condition', 'draft', 'Part VII §5.26; translator traditions vary in naming.'),
  ('evasion', 'Evasion', 'A failed application caused when the planet being applied to changes sign before perfection and the application shifts elsewhere.', 'perfection condition', 'draft', 'Part VII §5.27.'),
  ('cutting-light', 'Cutting the Light', 'A family of conditions in which a third planetary action interrupts or diverts an intended application or transfer of light.', 'perfection condition', 'draft', 'Part VII §5.28 gives three forms. Keep distinct from prohibition until cross-author comparison is complete.'),
  ('favour-recompense', 'Favour and Recompense', 'A reciprocal rescue doctrine in which a planet is drawn from a well or fall by another and later repays the assistance under a corresponding condition.', 'perfection condition', 'draft', 'Part VII §5.29. The source also notes that the lord of exaltation may be called lord of favour.'),
  ('besieging', 'Besieging', 'A condition in which a planet or sign is enclosed by malefics or their rays, with benefic intervention capable of releasing the affliction.', 'planetary condition', 'draft', 'Part VII §6.8 distinguishes two forms and also describes benefic besiegement as exceptionally fortunate.'),
  ('corruption-of-moon', 'Corruption of the Moon', 'A list of eleven conditions by which the Moon is considered damaged or corrupted.', 'lunar condition', 'draft', 'Part VII §6.9 preserves a source-specific elevenfold list rather than a single generic affliction rule.'),
  ('casting-rays', 'Casting of Rays', 'A mathematical procedure for projecting planetary aspect rays through right and oblique ascension according to a method attributed to Ptolemy.', 'aspect technique', 'draft', 'The editors note that the attribution to Ptolemy is historically problematic; preserve that as editorial metadata.'),
  ('fardar', 'Fardār', 'A planetary period allocation assigning fixed year lengths to the planets and the lunar nodes.', 'time lord', 'draft', 'Part VII Chapter 8 gives the sequence lengths in summary. This term underlies later firdāriyya/firdaria terminology.'),
  ('planetary-years', 'Planetary Years', 'Sets of greatest, great, middle, and small year-values assigned to each planet.', 'time lord', 'draft', 'Part VII Chapter 8 distinguishes four classes of planetary years.'),
  ('natural-application', 'Natural Application', 'A non-aspecting application based on paired degree relationships in signs agreeing by rising times or daylight length.', 'perfection condition', 'draft', 'Part VII §§5.11-5.12; explicitly used in some nativities and questions and attributed to older Persian, Babylonian and Egyptian traditions.');

INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Domain', 'English', 'translation', 'Translation used in Part VII for ḥayyiz.' FROM terms WHERE slug='planetary-domain';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Firdaria', 'English/Latin tradition', 'later-form', 'Later conventional form related to fardār.' FROM terms WHERE slug='fardar';
INSERT OR IGNORE INTO aliases (term_id, label, language, alias_type, scope_note)
SELECT id, 'Firdāriyya', 'Arabic/Latin tradition', 'later-form', 'Later conventional form related to fardār.' FROM terms WHERE slug='fardar';

-- Ch. 1: conditions in themselves and domain.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '715', '723', 'Part VII', 'Chapter 1', '1.3-1.13',
       'Planetary conditions in themselves: apogee motion, light/size, latitude, motion, calculation, and domain', NULL,
       'Sequential review. Domain/ḥayyiz is defined explicitly in §1.13 with Mars as an exception.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Abū Maʿshar defines a planet’s domain through a compound of planetary gender, sign gender, day/night, and whether the planet is above or below the earth. Masculine planets are above by day and below by night in masculine signs; feminine planets take the reverse pattern in feminine signs, with Mars explicitly treated as an exception. Full conformity strengthens and moderates the planet; complete reversal indicates corruption and lack of moderation.',
       'Part VII, Chapter 1, §1.13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-domain' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The source’s Part VII formulation of ḥayyiz/domain is more specific than a simple diurnal/nocturnal label: it combines planetary gender, sign gender, day/night, and position relative to the horizon, and treats Mars exceptionally. This should remain a source-specific interpretation rather than being silently collapsed into later hayz or halb definitions.',
       'Part VII, Chapter 1, §1.13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='hayz' AND w.slug='abu-mashar-great-introduction';

-- Ch. 2: solar conditions, heart, burning, under rays, eastern/western phases, dasturiya.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '724', '737', 'Part VII', 'Chapter 2', '2.1-2.7',
       'Seventeen superior-planet solar conditions; sixteen inferior-planet and lunar conditions; heart, burning, under rays, easternness/westernness and dastūrīya', NULL,
       'Thresholds differ by planet. Venus receives an explicit visibility exception tied to latitude.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'A planet within about sixteen minutes of exact conjunction with the Sun is described as in the heart and fortunate. The source derives the threshold from roughly half the solar diameter and treats the heart as distinct from ordinary burning.',
       'Part VII, Chapter 2, §2.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cazimi' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Burning is a solar condition immediately outside the heart. The distance at which a planet passes from burning to merely under the rays is planet-specific: Saturn and Jupiter, Mars, Venus/Mercury, and the Moon are not all assigned one universal threshold. Venus also receives a visibility exception when latitude is extreme.',
       'Part VII, Chapter 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='combustion' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Under-the-rays is treated as a distinct solar phase between burning and fuller visibility/easterliness or, on the western side, between visibility and renewed burning. The source gives different thresholds by planet rather than a single universal number.',
       'Part VII, Chapter 2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='under-the-rays' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Dastūrīya is repeatedly associated with a planet’s strong eastern condition and with suitability for giving its greatest years. Abū Maʿshar does not provide a standalone lexical definition here, so the entry remains deliberately cautious and source-bound.',
       'Part VII, Chapter 2, §§2.4-2.6', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='dasturiya' AND w.slug='abu-mashar-great-introduction';

-- Ch. 3-4: bodily power and conjunction/mixing.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '738', '761', 'Part VII', 'Chapters 3-4', '3.1-4.22',
       'Cardinal/succedent/cadent conditions; degree-ranges of planetary bodily power; conjunction and qualitative mixture', NULL,
       'Chapter 4 distinguishes bodily conjunction from qualitative mixture and repeatedly ranks the stronger planet as more operative.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'The planetary body is assigned a different degree-range of power before and behind its position: Sun 15°, Moon 12°, Saturn and Jupiter 9°, Mars 8°, Venus and Mercury 7°. Abū Maʿshar then uses these ranges to judge the strength of bodily conjunction and mixture.',
       'Part VII, Chapter 3, §3.2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-body-power' AND w.slug='abu-mashar-great-introduction';

-- Ch. 5: twenty-one aspect/application conditions.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '762', '785', 'Part VII', 'Chapter 5', '5.1-5.31',
       'Twenty-one conditions following aspect, application and separation, including transfer, collection, reflecting light, prohibition, giving, returning, refrenation, resistance, evasion, cutting light, favour/recompense and reception', NULL,
       'Core source for the project’s perfection ontology. Preserve distinctions and do not normalize names across later Latin authors prematurely.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Application occurs when the faster planet moves toward the slower by conjunction or aspect. Bodily application by conjunction is restricted to the same sign; aspectual application is perfected when the faster planet reaches the same degree and minute by the relevant aspect. Abū Maʿshar also develops application in latitude and natural application without ordinary aspect.',
       'Part VII, Chapter 5, §§5.4-5.12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='application' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Solitary motion is defined as separation from an application without making another application for the remainder of the sign. The source treats this separately from wildness, so the two should not be merged.',
       'Part VII, Chapter 5, §5.13', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='solitary-motion' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id,
       'Wildness is the condition of a planet in a sign to which no planet aspects at all. Abū Maʿshar says it occurs especially with the Moon and then treats movement through successive terms as a special kind of application to their rulers.',
       'Part VII, Chapter 5, §5.14', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='wild-planet' AND w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Transfer occurs when a lighter planet carries the nature of a planet from which it separates to another planet to which it applies; the chapter also gives a second form in which a slower intermediate planet performs the transfer.', 'Part VII, Chapter 5, §5.15', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='translation-of-light' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Collection occurs when two or more planets apply to one planet, which collects their light and receives their natures.', 'Part VII, Chapter 5, §5.16', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='collection-of-light' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Reflecting the light is given in two forms: an intermediate planet may redirect the light of planets that do not directly aspect one another to a place it aspects, or it may mediate between significators that do not aspect or are separating.', 'Part VII, Chapter 5, §5.17', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reflecting-light' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Prohibition is defined in both bodily and aspectual forms, where a third planet reaches the intended recipient first and prevents or destroys the original application.', 'Part VII, Chapter 5, §5.18', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='prohibition' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Giving nature occurs when a planet applies to the ruler of the house, exaltation, term, triplicity, or decan in which it stands, thereby giving that ruler’s nature to it.', 'Part VII, Chapter 5, §5.19', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='giving-nature' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Giving power occurs when a planet in one of its own dignities applies to another planet and gives its own power to it.', 'Part VII, Chapter 5, §5.20', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='giving-power' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Giving two natures is either an application in which both planets possess dignity in the relevant sign, or an application between planets in compatible domain/sect conditions.', 'Part VII, Chapter 5, §5.21', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='giving-two-natures' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Giving management is any application in which a planet hands its management to another. Agreement by sextile/trine with reception, or suitable mixture by conjunction, strengthens the giving.', 'Part VII, Chapter 5, §5.22', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='giving-management' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Returning occurs when a burnt or retrograde receiver cannot retain what it received and sends it back to the giver. Abū Maʿshar distinguishes returning with soundness, which can repair a matter, from returning with corruption, which can spoil or prevent it.', 'Part VII, Chapter 5, §§5.23-5.24', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='returning-management' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Refrenation is an intended application aborted when the applying planet retrogrades away before perfection.', 'Part VII, Chapter 5, §5.25', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='refranation' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Resistance is a three-planet redirection in which retrogradation causes an intended application to be intercepted and transferred to another planet.', 'Part VII, Chapter 5, §5.26', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='resistance' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Evasion occurs when the planet being applied to changes sign before perfection, so the original application fails and another application may take its place.', 'Part VII, Chapter 5, §5.27', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='evasion' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Cutting the light is a threefold family of interruptions in which a third planet, sign change, or transferred light diverts the intended connection and prevents the original matter from reaching its expected completion.', 'Part VII, Chapter 5, §5.28', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='cutting-light' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Favour and recompense describes a planet in a well or fall being drawn out by a friendly or dignified planet, with a later corresponding rescue repaying that favour. The lord of exaltation may also be called the lord of favour.', 'Part VII, Chapter 5, §5.29', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='favour-recompense' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Reception is tied to application from a dignity of the receiving planet or the receiver occupying a dignity of the giver. House and exaltation are strongest; reception by a single minor dignity is weaker unless dignities are combined. Reception can also occur by aspect without application, but application is stronger.', 'Part VII, Chapter 5, §§5.30-5.31', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='reception' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Natural application is a non-aspecting doctrine based first on degrees of signs whose rising times correspond and second on signs whose daylight lengths correspond. The source explicitly calls some of these natural opposition and natural sextile applications and attributes the practice to older Persian, Babylonian, and Egyptian books.', 'Part VII, Chapter 5, §§5.11-5.12', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='natural-application' AND w.slug='abu-mashar-great-introduction';

-- Ch. 6: fortune, strength, weakness, besiegement, corruption of Moon.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '786', '793', 'Part VII', 'Chapter 6', '6.1-6.9',
       'Good fortune, strength, weakness, misfortune, besieging, and eleven corruptions of the Moon', NULL,
       'Includes source-specific use of ḥalb and domain; do not silently equate all terms with later sect terminology.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Besieging has two forms: enclosure by malefics or their rays before and behind, or malefics/rays occupying the second and twelfth relative signs. Benefic or solar intervention can release the affliction; being besieged by benefics is described as an especially strong good fortune.', 'Part VII, Chapter 6, §6.8', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='besieging' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The corruption of the Moon is an elevenfold source-specific list including eclipse, proximity to the Sun, proximity to opposition, malefic contact, malefic dodecatemoria, contact with the nodes, southern/descending condition, the burnt path, ends of signs, slowness, and the ninth place.', 'Part VII, Chapter 6, §6.9', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='corruption-of-moon' AND w.slug='abu-mashar-great-introduction';

-- Ch. 7-8: casting rays and planetary periods/years.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '794', '801', 'Part VII', 'Chapters 7-8', '7.1-8.3',
       'Casting rays by right/oblique ascension; fardārs; greatest, great, middle and small planetary years', NULL,
       'The editors caution that the ray-casting method is wrongly attributed to Ptolemy. Fardār and planetary-year values are source data.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Casting rays is a mathematical projection procedure using a planet’s quadrant, right ascension, oblique ascension, distance from the cardines, and the angular distances of sextile, quartile, trine, and opposition. The edition notes that Abū Maʿshar’s attribution of this exact procedure to Ptolemy is historically incorrect.', 'Part VII, Chapter 7', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='casting-rays' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'The fardārs are fixed planetary periods given here as Sun 10, Venus 8, Mercury 13, Moon 9, Saturn 11, Jupiter 12, Mars 7, Head 3, and Tail 2 years, totaling 75 years.', 'Part VII, Chapter 8, §8.2', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='fardar' AND w.slug='abu-mashar-great-introduction';
INSERT INTO interpretations (term_id, work_id, summary, scope, certainty, status)
SELECT t.id, w.id, 'Abū Maʿshar distinguishes four classes of planetary years—greatest, great, middle, and small—and assigns separate numerical values to each of the seven planets.', 'Part VII, Chapter 8, §8.3', 'direct', 'draft'
FROM terms t CROSS JOIN works w WHERE t.slug='planetary-years' AND w.slug='abu-mashar-great-introduction';

-- Chapter 9 is primarily a source-specific catalogue of planetary indications.
INSERT INTO source_passages (edition_id, page_start, page_end, book, chapter, section, locator_text, quote, internal_notes)
SELECT e.id, '802', '817', 'Part VII', 'Chapter 9', '9.1-9.10',
       'Proper indications of Saturn, Jupiter, Mars, Sun, Venus, Mercury and Moon', NULL,
       'Large indication catalogue. Stored as source evidence rather than manufacturing a separate lexicon term for every occupation, trait, object or social group.'
FROM editions e JOIN works w ON w.id=e.work_id WHERE w.slug='abu-mashar-great-introduction';

-- Key relations.
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'source-specific-form-of', 'Part VII translates ḥayyiz as domain; preserve its compound definition rather than flattening it into a generic sect label.', 'draft' FROM terms a, terms b WHERE a.slug='planetary-domain' AND b.slug='hayz';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'distinct-from', 'Solitary motion requires no further application after separation; wildness requires no planetary aspect at all.', 'draft' FROM terms a, terms b WHERE a.slug='solitary-motion' AND b.slug='wild-planet';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-to', 'Natural application is the dynamic application doctrine built from the same paired-sign structures called natural opposition.', 'draft' FROM terms a, terms b WHERE a.slug='natural-application' AND b.slug='natural-opposition';
INSERT OR IGNORE INTO term_relations (subject_term_id, object_term_id, relation_type, note, status)
SELECT a.id, b.id, 'related-to', 'Natural application also uses the paired-sign structures called natural sextile.', 'draft' FROM terms a, terms b WHERE a.slug='natural-application' AND b.slug='natural-sextile';