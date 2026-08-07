# Extraction research log

This file records what has actually been checked against the source corpus. It is not a publication page.

## Pass 1 — core technical terms

Status: in progress.

Initial test terms:

- Application
- Reception
- Terms / Bounds
- Triplicity Rulers
- Combustion

### Al-Bīrūnī

Checked directly in *The Book of Instruction in the Elements of the Art of Astrology*:

- §445 — triplicity rulers. The text gives day, night and participating rulers, and also notes an alternate ordering practice.
- §453 — terms. The text defines them as unequal sign divisions assigned to planets and distinguishes Egyptian, Ptolemaic and other historical systems.
- §481 — conditions relative to the Sun. The text separates the innermost solar condition, combustion and the broader state under the rays.
- §489 — application and separation. The text defines them through the formation and withdrawal of conjunction/aspect and explains the ordinary faster/lower-to-slower/higher application model.
- §507 — reception. The text connects reception to the dignities of another planet and distinguishes mutual reception.

These five items have been entered into `db/seed/0002_core_terms.sql` as source-grounded draft interpretations.

### William Lilly

Checked directly in *Christian Astrology*, Book I:

- Application — PDF pp. 128–129 / original pp. 107–108. Lilly gives three motion configurations and then a general definition through planets drawing nearer by conjunction or aspect.
- Reception — PDF p. 133 / original p. 112. Lilly describes reciprocal dignity and explicitly allows house, triplicity, term and face reception.
- Terms — planetary descriptions and dignity tables, including PDF pp. 78 onward. Lilly attributes the term degrees he uses to Ptolemy.
- Combustion — PDF p. 134 / original p. 113. Lilly distinguishes combustion, under the beams and cazimi and gives separate numerical limits.

These have also been entered into `db/seed/0002_core_terms.sql`.

### Abū Maʿshar

Initial verification completed, but not yet seeded as interpretations:

- Part V opens by treating house, exaltation, triplicities, terms, decans, joy, fall and detriment as distinct planetary shares in the signs.
- Part V separately treats multiple systems of terms and multiple decan traditions.
- His treatment confirms that the database must preserve competing systems rather than collapse them into a single modern dignity table.

Next pass should obtain precise locators for the five test terms before inserting author-specific interpretations.

### Guido Bonatti

Initial verification completed, but not yet seeded as interpretations:

- The *Liber Astronomiae* gives explicit sect-dependent triplicity rulers.
- It discusses different rankings and uses of term rulers versus triplicity rulers.
- Its solar-proximity material distinguishes stages around combustion and emergence from the Sun's rays.
- Reception requires careful handling because the translation/editorial material surveys several historical definitions; direct Bonatti passages must be separated from Robert Hand's editorial discussion before database insertion.

### Antiochus of Athens

The uploaded *Thesaurus* is image-only in the current corpus parser. Its table of contents clearly contains dedicated sections on application, intervention, surpassing, bodily joining, juxtaposition, containment and related configuration doctrine, but the body text must be read from page images or transcribed before direct interpretations are seeded.

Do not infer Antiochus's definitions from later authors merely because the terminology overlaps.

## Editorial findings from Pass 1

- `Reception` cannot be represented simply as modern mutual reception. Al-Bīrūnī and Lilly already show different framing and scope.
- `Terms / Bounds` needs a parent concept plus historically distinct systems. The Egyptian and Ptolemaic schemes must not be merged into one anonymous table.
- `Combustion`, `under the rays`, and `cazimi` should be separate concepts linked by a broader solar-proximity category. Exact thresholds belong to author-specific interpretations.
- `Application` needs both a conceptual definition and author-specific motion rules.
- Triplicity rulership needs enough structure to represent day ruler, night ruler, participating ruler and alternate ordering traditions.

## Pass 2 — perfection mechanics and solar/sect conditions

Added to `db/seed/0003_perfection_and_solar_conditions.sql`:

- Separation
- Prohibition
- Refranation
- Translation of Light
- Collection of Light
- Frustration
- Void of Course
- Hayz
- Peregrine
- Cazimi / In the Heart of the Sun
- Under the Sun's Rays
- Orientality
- Occidentality

### William Lilly — directly checked

- Prohibition — PDF pp. 131–132 / original pp. 110–111. A third planet interposes its body or aspect before an applying pair perfects; Lilly distinguishes bodily and aspectual prohibition.
- Refrenation — PDF p. 132 / original p. 111. The applying planet turns retrograde before reaching conjunction.
- Translation of light and nature — PDF pp. 132–133 / original pp. 111–112. A lighter planet separates from a heavier one and immediately joins another heavier planet, carrying virtue between them; Lilly allows aspect as well as conjunction.
- Void of course — PDF p. 133 / original p. 112. A planet has separated and makes no further application during its remaining passage through the sign; Lilly notes this especially for the Moon.
- Frustration — PDF pp. 133–134 / original pp. 112–113. The heavier planet being applied to joins another planet first.
- Hayz — PDF p. 134 / original p. 113. Lilly combines sect, hemisphere and sign gender.
- Peregrine — PDF p. 133 / original p. 112. Absence of house, exaltation, triplicity, term or face dignity in the occupied degree.
- Cazimi and under the Sun's beams — PDF p. 134 / original p. 113. Lilly gives separate limits: cazimi within 17 minutes, combustion within 8°30′, under the beams to 17°.
- Translation and collection as modes of perfection — PDF pp. 147–148 / original pp. 126–127. Collection requires two principal significators to cast aspects to a heavier planet which they receive in essential dignity.

### Al-Bīrūnī — directly checked

- §493–494 — peregrination and dignity. Absence of a favourable/dignified position is peregrine; detriment or fall adds further adversity. The following section ranks house, exaltation, term, triplicity and face.
- §481 and surrounding solar-phase discussion — innermost solar condition, combustion, under the rays, orientality and occidentality are distinct phases; visibility limits differ by planet.
- Immediately before §507 — refranation occurs when the applying inferior planet turns retrograde before conjunction. The same sequence also describes a translated condition called prevention in which a third planet intervenes before the intended conjunction.

The al-Bīrūnī `prevention` material is currently attached cautiously to the draft `prohibition` concept with `close_paraphrase` certainty. This is a deliberate provisional mapping, not an assertion that the two historical terms are perfectly identical.

## Editorial findings from Pass 2

- `Frustration` must not become a generic label for every failed perfection. Lilly gives it a narrow mechanism.
- `Prohibition`, `prevention`, `intervention`, and `abscission/cutting off the light` need a comparative pass before aliases are assigned.
- `Translation of Light` and `Collection of Light` deserve separate entries; both are modes of mediation/perfection but operate differently.
- `Cazimi`, `Combustion`, and `Under the Rays` now form a linked solar-proximity family rather than one flattened condition.
- `Orientality` and `Occidentality` cannot be represented by a single simplistic east/west rule because al-Bīrūnī explicitly treats superior and inferior planets differently.
- `Hayz` belongs under sect/accidental condition and should not be collapsed into sect itself.

## Next extraction pass

1. Extract direct Bonatti text for reception/perfection mechanics, carefully excluding Robert Hand's introductory/editorial summaries.
2. Read Antiochus's relevant page images and create manually verified source records.
3. Extract Abū Maʿshar's dignity/sect material with exact part/chapter/page locators.
4. Add domicile, exaltation, fall, detriment, face/decan, joy and sect as individual entries.
5. Decide whether prevention/intervention/prohibition require separate canonical concepts or a broader parent concept with historically specific children.
6. Connect the frontend term index to these seed records once the content set reaches roughly 25–30 stable draft concepts.
