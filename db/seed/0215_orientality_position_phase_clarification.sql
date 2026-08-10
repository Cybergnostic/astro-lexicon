-- Editorial clarification: Orientality / Occidentality.
--
-- Position relative to the Sun remains relevant to recognizing oriental/occidental
-- conditions. What must not be flattened into a bare east/west rule is the phase:
-- the traditional condition is read within the planet's synodic cycle, with the
-- detailed recognition differing by planetary class and motion.

PRAGMA foreign_keys = ON;

UPDATE terms SET
  short_definition='A traditional solar-phase condition in which a planet occupies the relevant oriental position relative to the Sun within its synodic cycle. Solar position is part of the recognition rule, while the phase also depends on planetary class, direction of motion and place within the cycle.',
  editorial_notes='Source-backed by al-Bīrūnī and Bonatti. Position relative to the Sun is relevant, but orientality is a synodic phase rather than a bare generic east/west label; superior and inferior planets require different phase-sensitive treatment.'
WHERE slug='orientality';

UPDATE terms SET
  short_definition='A traditional solar-phase condition in which a planet occupies the relevant occidental position relative to the Sun within its synodic cycle. Solar position is part of the recognition rule, while the phase also depends on planetary class, direction of motion and place within the cycle.',
  editorial_notes='Paired with Orientality. Position relative to the Sun is relevant, but occidentality is a synodic phase rather than a bare generic east/west label; source-specific phase rules and thresholds remain attached to source accounts.'
WHERE slug='occidentality';

UPDATE term_articles SET
  intro='Orientality is a solar-phase condition describing a planet in the relevant oriental position relative to the Sun within its synodic cycle. Position relative to the Sun is therefore genuinely part of the condition, but it does not by itself define the whole phase: al-Bīrūnī and Bonatti also distinguish planetary class, motion and place within the synodic sequence.'
WHERE term_id=(SELECT id FROM terms WHERE slug='orientality');

UPDATE term_article_sections SET
  heading='Solar position inside a synodic phase',
  body='Traditional oriental/occidental language does refer to the planet’s position relative to the Sun. The caution is that this positional relation must be interpreted inside the synodic cycle rather than used as a context-free east/west label. Visibility, direct or retrograde motion and the different cycles of superior and inferior planets determine what phase that position represents.'
WHERE term_id=(SELECT id FROM terms WHERE slug='orientality')
  AND section_key='phase-not-direction';

UPDATE term_articles SET
  intro='Occidentality is the paired solar-phase condition in which a planet occupies the relevant occidental position relative to the Sun within its synodic cycle. Solar position remains part of the recognition rule, while the full phase also depends on planetary class, motion and place within the cycle.'
WHERE term_id=(SELECT id FROM terms WHERE slug='occidentality');

UPDATE term_article_sections SET
  heading='Solar position inside a synodic phase',
  body='The occidental condition includes a positional relationship to the Sun, but that position has to be read as one stage of the planet’s synodic cycle. Bonatti distinguishes stronger and weaker occidental phases and places them within a larger sequence involving direct motion, retrogradation, solar obscuration and emergence from the rays.'
WHERE term_id=(SELECT id FROM terms WHERE slug='occidentality')
  AND section_key='not-simple-west';
