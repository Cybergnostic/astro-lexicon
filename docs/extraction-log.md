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

## Next extraction pass

1. Add `cazimi` and `under-the-rays` as separate terms.
2. Add `separation`, `prohibition/prevention`, `refranation`, `translation of light`, and `collection of light`.
3. Extract direct Bonatti passages for the above rather than relying on editorial essays.
4. Read Antiochus's relevant page images and create manually verified source records.
5. Revisit the schema if a historical doctrine cannot be represented without forcing it into modern terminology.
