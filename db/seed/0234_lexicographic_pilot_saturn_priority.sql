-- Lexicographic pilot 02: Saturn. Traditional identity before modern astronomy.
-- Evidence spot-check: al-Biruni, Book of Instruction §§396–401.
-- Preserve all planet_profiles, chart assignments, reference tables, interpretations,
-- diagrams and source citations. Only reader-facing priority/prose is affected.
PRAGMA foreign_keys = ON;

UPDATE terms SET
  short_definition='Saturn is the greater malefic of the diurnal sect in traditional astrology, assigned a cold and dry nature. It rules Capricorn and Aquarius and is exalted in Libra.',
  editorial_notes='Lexicographic pilot: the headword leads with traditional astrological identity. Modern astronomical classification remains in its later article section.'
WHERE slug='saturn';

UPDATE term_articles SET
  intro='Saturn signifies old age, endurance, duration, restraint, scarcity and separation. In traditional judgment these significations may describe preservation and steadfastness or deprivation and obstruction, according to the planet''s condition and role in the chart.',
  editorial_notes='Lexicographic pilot: article adds significations and judgment context instead of repeating the canonical definition.'
WHERE term_id=(SELECT id FROM terms WHERE slug='saturn');

UPDATE term_article_sections SET
  heading='Nature and significations',
  body='Saturn''s attributed coldness and dryness provide a natural-philosophical account of contraction, consolidation, delay and resistance to change. The same underlying qualities can indicate durability or difficulty: their judgment depends on dignity, configuration and the matter signified.',
  editorial_notes='Lexicographic pilot: expanded traditional nature without repeating the headword classification.'
WHERE term_id=(SELECT id FROM terms WHERE slug='saturn') AND section_key='nature';

UPDATE term_article_sections SET
  heading='Sect and condition',
  body='As a diurnal malefic, Saturn is traditionally moderated by a day figure and can be more contrary to the prevailing conditions in a night figure. This is a contextual consideration rather than an automatic prediction: its dignities, strength and involvement in the topic must still be judged.',
  editorial_notes='Lexicographic pilot: source-conscious contextual sect explanation without a duplicated identity sentence.'
WHERE term_id=(SELECT id FROM terms WHERE slug='saturn') AND section_key='sect';
