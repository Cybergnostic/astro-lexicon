-- Definition-quality pass after completing the sequential review of Abū Maʿshar.
-- Purpose: replace vague glossary-style descriptions with source-grounded definitions
-- that identify the class, mechanism/criterion, and boundary from nearby concepts.
-- This pass does not attempt to create a final cross-author synthesis; later sources
-- may broaden or qualify these canonical definitions.

-- Part I: cosmology, indication, and predictive terminology.
UPDATE terms SET short_definition =
'In Abū Maʿshar’s cosmology, the distinct celestial nature of the spheres and stars, distinguished from fire, air, water and earth because celestial bodies do not undergo ordinary elemental alteration, generation and corruption.'
WHERE slug='fifth-nature';

UPDATE terms SET short_definition =
'The causal power attributed to celestial bodies and their motions by which receptive sublunary bodies and the four elements are moved or altered; distinct from indication, which is the relation by which a celestial condition signifies something.'
WHERE slug='celestial-power';

UPDATE terms SET short_definition =
'The paired processes of generation and corruption in the sublunary world: natural things come into being and pass away through alteration, mixture and recombination of the four elements under celestial action.'
WHERE slug='coming-to-be-and-passing-away';

UPDATE terms SET short_definition =
'In the natural philosophy used by Abū Maʿshar, the organizing principle that makes elemental matter into a determinate kind of natural thing. It is not an astrological chart or figure; he compares form to a craftsman and the elements to the craftsman’s tools.'
WHERE slug='form';

UPDATE terms SET short_definition =
'The organization of elemental parts into one generated natural individual. Abū Maʿshar treats composition together with form and the four elements as necessary for an animal, plant or mineral to exist as the particular thing it is.'
WHERE slug='natural-composition';

UPDATE terms SET short_definition =
'A broad astrological indication applying to a genus, species or general worldly condition rather than to one individual. For example, Abū Maʿshar treats the twelve zodiacal signs as bearers of universal indications because they concern broad classes and seasonal or generative conditions.'
WHERE slug='universal-indication';

UPDATE terms SET short_definition =
'An astrological indication restricted to a particular individual, property, bodily part, condition or exact degree-level matter. It is contrasted with universal indication, which concerns broader classes or general conditions.'
WHERE slug='particular-indication';

UPDATE terms SET short_definition =
'Knowledge of a future condition before it occurs, presented by Abū Maʿshar as the practical fruit of astrological judgment because advance knowledge may allow avoidance, mitigation, preparation or orderly response even when the event itself cannot be prevented.'
WHERE slug='foreknowledge';

UPDATE terms SET short_definition =
'One of the astrological contexts for judging a particular matter from the time associated with a question. Part I names questions alongside nativities and annual revolutions but does not yet supply the full technical rules of interrogational astrology.'
WHERE slug='astrological-question';

-- Part II–III: stellar framework and sign classifications.
UPDATE terms SET short_definition =
'A brightness class assigned to a fixed star according to apparent luminosity. Abū Maʿshar reports six ordinary magnitude classes, from the brightest first magnitude through the sixth, with some additional special descriptors.'
WHERE slug='stellar-magnitude';

UPDATE terms SET short_definition =
'An imagined figure used to organize a group of fixed stars on the stellar sphere. Abū Maʿshar explicitly treats constellational figures as conventional forms constructed in thought rather than literal physical shapes in the heavens.'
WHERE slug='constellation';

UPDATE terms SET short_definition =
'One of the four seasonal quarters of the zodiacal cycle. Each quadrant contains a beginning, middle and end, providing Abū Maʿshar’s rationale for tropical, fixed and bicorporeal signs respectively.'
WHERE slug='quadrant-of-sphere';

UPDATE terms SET short_definition =
'A sign belonging to the alternating masculine series beginning with Aries. Abū Maʿshar treats this as a natural zodiacal classification associated with heat and active power, distinct from an accidental masculine/feminine alternation counted from the ascendant.'
WHERE slug='masculine-sign';

UPDATE terms SET short_definition =
'A sign belonging to the alternating feminine series beginning with Taurus. In Abū Maʿshar this is a natural zodiacal classification paired with the masculine series and distinguished from an accidental house-based alternation from the ascendant.'
WHERE slug='feminine-sign';

UPDATE terms SET short_definition =
'A sign belonging to the alternating diurnal series beginning with Aries. This is a classification of signs—Aries, Gemini, Leo, Libra, Sagittarius and Aquarius in the natural order—not the same doctrine as the sect of planets.'
WHERE slug='diurnal-sign';

UPDATE terms SET short_definition =
'A sign belonging to the alternating nocturnal series beginning with Taurus. This sign classification is paired with the diurnal series and must not be collapsed into planetary sect.'
WHERE slug='nocturnal-sign';

UPDATE terms SET short_definition =
'An indication whose signified condition is sufficiently knowable for practical astrological judgment. Abū Maʿshar contrasts this usable class with subtle or hidden indications whose exact quantity, quality or particularity cannot reliably be determined.'
WHERE slug='obvious-indication';

UPDATE terms SET short_definition =
'A stellar indication acknowledged as real in principle but too subtle, remote or exacting for reliable human judgment. Abū Maʿshar uses this category to limit the practical claims of astrology rather than to deny that such indications exist.'
WHERE slug='hidden-indication';

UPDATE terms SET short_definition =
'In Abū Maʿshar’s medical astrology, a day on which a change in illness is judged from the Moon reaching specified angular relations to its earlier position, especially sextile, quartile and opposition relationships.'
WHERE slug='critical-days';

-- Part IV: planetary nature and classification.
UPDATE terms SET short_definition =
'The characteristic power by which a planet produces or signifies effects that cannot be reduced to its attributed hot, cold, wet or dry quality. Abū Maʿshar uses planetary property to explain why benefics can sometimes act harmfully and malefics beneficially without changing their basic class.'
WHERE slug='planetary-property';

UPDATE terms SET short_definition =
'A planet whose manifested quality readily follows the planets, signs and conditions with which it is associated rather than remaining uniformly benefic, malefic, masculine, feminine, diurnal or nocturnal. Mercury is Abū Maʿshar’s principal example.'
WHERE slug='mixed-planet';

UPDATE terms SET short_definition =
'A condition in which a planet that remains fundamentally malefic acts or signifies in a benefic-like manner because of its condition, mixture or reception. The expression describes its manifested nature, not a permanent reclassification as a benefic.'
WHERE slug='in-nature-of-benefics';

UPDATE terms SET short_definition =
'A condition in which a planet that remains fundamentally benefic acts or signifies in a malefic-like manner because of its condition, mixture or reception. The expression modifies its manifestation rather than changing its underlying class.'
WHERE slug='in-nature-of-malefics';

UPDATE terms SET short_definition =
'A phase in a planet’s motion through the region of its apogee in which it is moving toward the apogee; Abū Maʿshar treats this ascent as one of the conditions that modifies how strongly the planet manifests its attributed hot, cold, wet or dry nature.'
WHERE slug='ascending-in-apogee-orb';

UPDATE terms SET short_definition =
'A phase in a planet’s motion through the region of its apogee in which it is moving away from the apogee; Abū Maʿshar uses this descent, paired with ascent, as a modifier of the planet’s attributed qualitative nature.'
WHERE slug='descending-in-apogee-orb';

UPDATE terms SET short_definition =
'A planetary gender classification associated chiefly with heat and active power, but capable of being strengthened or modified by solar phase, quadrant and association with other planets. It is distinct from the masculine/feminine classification of signs.'
WHERE slug='planetary-masculinity';

UPDATE terms SET short_definition =
'A planetary gender classification associated chiefly with wetness and receptive or passive quality, but modified by phase, quadrant and association. It is distinct from the feminine classification of zodiacal signs.'
WHERE slug='planetary-femininity';

-- Part V: shares, degree doctrines, terms and subdivisions.
UPDATE terms SET short_definition =
'A paired calculated lot attributed to the Ancients, formed from the luminaries and the central degrees of their houses and used to obtain two positions corresponding together to the two houses of a planet. The source-specific construction should not be confused with later unrelated lots of similar name.'
WHERE slug='lot-of-nature-of-planets';

UPDATE terms SET short_definition =
'The particular degree within an exaltation sign at which a planet’s exalted nature and fortunate indication are held to be displayed most fully. It is a degree-level doctrine distinct from exaltation as a dignity belonging to the whole sign.'
WHERE slug='exaltation-degree';

UPDATE terms SET short_definition =
'One of three ten-degree divisions in the Indian decan system. Its ruler is determined by trinal sign lordship: the first by the sign lord, the second by the lord of the fifth sign from it, and the third by the lord of the ninth.'
WHERE slug='darijan';

UPDATE terms SET short_definition =
'One of nine equal divisions of a zodiacal sign, each measuring 3°20′. Abū Maʿshar presents the nawbahar or “ninth” as a distinct sign subdivision with its own sequence of rulers, not as another name for a decan or twelfth-part.'
WHERE slug='ninth-nawbahr';

UPDATE terms SET short_definition =
'A degree-level scheme in which the natures of the twelve zodiacal signs are assigned successively to the thirty individual degrees of a sign, repeating after twelve degrees. It is distinct from the 2½° dodecatemoria described immediately before it.'
WHERE slug='degree-sign-nature';

UPDATE terms SET short_definition =
'A transmitted classification of particular degrees or degree ranges as masculine or feminine independently of the sex assigned to the sign as a whole. Abū Maʿshar preserves three methods and treats agreement between methods as the stronger testimony.'
WHERE slug='masculine-feminine-degrees';

UPDATE terms SET short_definition =
'A named class in a transmitted fourfold catalogue of bright, dusky, dark/shadowy and empty degrees. Bright degrees are associated in this source with stronger fortunate, beautiful or luminous indications; the source presents the classification as inherited rather than deriving it from a calculation.'
WHERE slug='bright-degree';

UPDATE terms SET short_definition =
'A named adverse degree class in a transmitted catalogue of degree qualities. The manuscripts and translations are unstable over the labels “dusky”, “dark”, “shadowy” and “smoky”, so the exact boundary between these named classes remains textually uncertain.'
WHERE slug='dusky-degree';

UPDATE terms SET short_definition =
'A named degree class in the transmitted bright/dusky/dark/empty scheme, associated with adverse indication but distinguished in the main translation from the dusky class. Because the textual witnesses vary in the words for dark, shadowy and smoky, its precise label remains provisional.'
WHERE slug='dark-degree';

UPDATE terms SET short_definition =
'A named degree class described as “empty” and compared with an empty cipher or zero. It carries a weaker adverse indication in the transmitted degree catalogue; the source does not derive the class from a separate astronomical calculation.'
WHERE slug='empty-degree';

UPDATE terms SET short_definition =
'A specific zodiacal degree regarded as a “well” for a planet: when the planet occupies one of its listed well degrees, it is said to lose splendour and become weak in indication. Abū Maʿshar records disagreement over the exact degree lists.'
WHERE slug='planetary-well';

UPDATE terms SET short_definition =
'A transmitted set of particular degrees that amplify fortunate indication when occupied by relevant significators such as the Moon, ascendant or Lot of Fortune. They are treated as strengthening testimonies, not as independent guarantees of good fortune.'
WHERE slug='degrees-increasing-good-fortune';

-- Part VI: signs, aspects, places and time rulership.
UPDATE terms SET short_definition =
'A symbolic figure assigned to one of the thirty-six decans and used to express that decan’s proper indications. Abū Maʿshar distinguishes such inherited decan figures from actual stellar constellations, whose rising positions shift over time.'
WHERE slug='decan-figure';

UPDATE terms SET short_definition =
'A relation in which a crooked-rising sign is said to obey a straight-rising sign; Abū Maʿshar also records a closely related use for signs agreeing in equal daytime power. Because the text uses “obedience” in more than one way, the term should not be reduced to a single later textbook formula.'
WHERE slug='obedient-signs';

UPDATE terms SET short_definition =
'A non-aspecting sign relation called an “opposition” because the signs are relatively distant yet agree through equal rising times, equal daytime power or shared planetary path. Unlike ordinary 180° opposition, Abū Maʿshar says this relation can signify friendship and agreement.'
WHERE slug='natural-opposition';

UPDATE terms SET short_definition =
'A non-aspecting relation between relatively nearby signs that nevertheless agree through rising times, daytime power or planetary path. The main translation treats it as concordant; an alternative Latin witness reverses the effect, so the historical disagreement must remain visible.'
WHERE slug='natural-sextile';

UPDATE terms SET short_definition =
'A source-specific classification dividing signs into mobile and resting groups according to whether their rulers agree with them. It is a separate doctrine from tropical, fixed and bicorporeal modality and should not be used as a synonym for those classes.'
WHERE slug='mobile-resting-signs';

UPDATE terms SET short_definition =
'A sign classified within a historical doctrine of speech and voice. Abū Maʿshar names Gemini, Virgo, Libra, Aquarius and the first half of Sagittarius as voiced and elsewhere distinguishes powerful-, moderate-, weak- and voiceless classes.'
WHERE slug='voiced-sign';

UPDATE terms SET short_definition =
'One of the four principal points that begins a quadrant of the local sphere: ascendant, midheaven, descendant or lower cardine. Each cardine is followed by a succedent place and then a cadent place.'
WHERE slug='cardine';

UPDATE terms SET short_definition =
'The second place within one of the four quadrants of the local sphere, immediately following its cardine. “Succedent” therefore describes structural position in a quadrant rather than a topical meaning by itself.'
WHERE slug='succedent-place';

UPDATE terms SET short_definition =
'The third place within one of the four quadrants of the local sphere, described as falling away from its cardine. Cadency is thus a structural relation to an angle, later used by Abū Maʿshar in explaining weakness or lack of testimony.'
WHERE slug='cadent-place';

UPDATE terms SET short_definition =
'The twelve astrological places produced by dividing each of the four quadrants of the local sphere into a cardine, a succedent and a cadent place. Abū Maʿshar assigns topics to them and also discusses geometrical and planetary rationales for those topics.'
WHERE slug='twelve-places';

UPDATE terms SET short_definition =
'A specific astrological place in which a planet is said to rejoice because the place’s topics correspond to that planet’s own indications. For example, Abū Maʿshar gives Mercury joy in the first place, Venus in the fifth and Jupiter in the eleventh.'
WHERE slug='planetary-joy';

UPDATE terms SET short_definition =
'An unequal temporal hour ruled by one of the seven planets in a repeating sequence. The first hour of a day is ruled by that day’s planet, after which rulership follows the order of the planetary spheres and continues without resetting at sunset.'
WHERE slug='planetary-hour';

UPDATE terms SET short_definition =
'The planet ruling a weekday because it rules the first planetary hour of that day. Continuing the seven-planet hourly sequence through twenty-four hours produces the weekday order Sun, Moon, Mars, Mercury, Jupiter, Venus and Saturn.'
WHERE slug='day-lord';

-- Part VII: planetary conditions and perfection doctrine.
UPDATE terms SET short_definition =
'Abū Maʿshar’s “domain” (ḥayyiz): a compound condition combining planetary gender, sign gender, day or night, and position above or below the horizon, with Mars treated as an exception. Full conformity strengthens the planet; reversal of the pattern corrupts or weakens it.'
WHERE slug='planetary-domain';

UPDATE terms SET short_definition =
'A source term associated in Part VII with the eastern solar phase, planetary strength and the capacity to give the planet’s greatest years. The chapter repeatedly uses dastūrīya but does not provide a complete standalone definition, so its exact technical scope remains provisional.'
WHERE slug='dasturiya';

UPDATE terms SET short_definition =
'A form of mediation in which planets that do not directly connect have their light redirected through another planet. Abū Maʿshar gives two forms: a mediating planet can project the combined light to another place, or a planet moving between the lord of the ascendant and lord of the matter can reflect the light of one to the other.'
WHERE slug='reflecting-light';

UPDATE terms SET short_definition =
'An application in which the applying and receiving planets are linked by a second shared condition. Abū Maʿshar gives two forms: both planets have dignity in the same sign—for example Venus applying to Jupiter from Pisces—or both conform to the same diurnal or nocturnal domain.'
WHERE slug='giving-two-natures';

UPDATE terms SET short_definition =
'An application in which one planet hands its management or disposition to another. Sextile or trine with reception makes the transfer harmonious, and conjunction can do so through mixture; without those agreements the management is still transferred but without concord.'
WHERE slug='giving-management';

UPDATE terms SET short_definition =
'A three-planet redirection of application caused by retrogradation: a lighter planet that had been moving toward a heavier planet reverses and becomes the new recipient of the application of an even lighter third planet, so the original connection is displaced.'
WHERE slug='resistance';

UPDATE terms SET short_definition =
'A failed application in which the planet being applied to changes sign before perfection; after the change another planet is closer and receives the application instead, so the original application is aborted.'
WHERE slug='evasion';

UPDATE terms SET short_definition =
'A family of three interruptions in which an intended application or transfer is diverted away from the planet or lord of the matter. Depending on the form, a third planet intervenes by retrogradation/conjunction, the intended receiver turns toward another heavier planet first, or the light is transferred to someone other than the lord of the matter.'
WHERE slug='cutting-light';

UPDATE terms SET short_definition =
'A reciprocal rescue condition: a planet in its well or fall is drawn out of that debility through application to a friendly or dignified planet; if the helper later falls into a well or fall and receives equivalent help in return, the second act is the recompense for the first favour.'
WHERE slug='favour-recompense';

UPDATE terms SET short_definition =
'A condition in which a planet or sign is enclosed between malefics or their rays so that the enclosed significator is strongly afflicted. Abū Maʿshar also recognizes release by benefic intervention and describes enclosure by benefics as an exceptionally fortunate counterpart.'
WHERE slug='besieging';

UPDATE terms SET short_definition =
'Abū Maʿshar’s source-specific list of eleven conditions by which the Moon is judged corrupted or damaged. It is a catalogue of distinct lunar afflictions rather than one single configuration, so the individual conditions must be consulted when the doctrine is applied.'
WHERE slug='corruption-of-moon';

UPDATE terms SET short_definition =
'A mathematical technique for projecting the zodiacal degree reached by an aspect ray using right or oblique ascension rather than treating an aspect only as a whole-sign relation. Abū Maʿshar attributes the procedure to Ptolemy, though the edition notes historical problems with that attribution.'
WHERE slug='casting-rays';

UPDATE terms SET short_definition =
'A time-lord system that assigns successive fixed periods of years to the seven planets and lunar nodes. In Abū Maʿshar’s sequence the periods total seventy-five years; later traditions commonly call the system firdaria or firdāriyya.'
WHERE slug='fardar';

UPDATE terms SET short_definition =
'Four traditional sets of lifespan or period values assigned to each planet—greatest, great, middle and small years—used as numerical measures in astrological timing and strength doctrines. The classes are distinct values rather than one single “planetary year”.'
WHERE slug='planetary-years';

UPDATE terms SET short_definition =
'A non-aspecting application based on corresponding degrees in signs that agree by rising times or by length of daylight. It allows two significators to be treated as naturally applying even when no ordinary conjunction or aspect joins them.'
WHERE slug='natural-application';

-- Part VIII: lots. Most definitions were already operational; sharpen the two nativity conditions.
UPDATE terms SET short_definition =
'A nativity occurring after the most recent conjunction of the Sun and Moon. Abū Maʿshar uses this prenatal-lunation condition as a branch in formulas such as the Lot of the Haylāǧ, where the preceding conjunction is used as an indicator.'
WHERE slug='conjunctional-nativity';

UPDATE terms SET short_definition =
'A nativity occurring after the most recent opposition of the Sun and Moon. In formulas that branch by prenatal lunation, Abū Maʿshar uses the preceding opposition where a conjunctional nativity would use the preceding conjunction.'
WHERE slug='oppositional-nativity';
