INSERT INTO authors (slug, name, historical_layer, notes) VALUES
  ('antiochus-of-athens', 'Antiochus of Athens', 'Late Antique', 'Initial corpus author.'),
  ('abu-mashar', 'Abū Maʿshar', 'Arabic/Persian', 'Initial corpus author.'),
  ('al-biruni', 'al-Bīrūnī', 'Arabic/Persian', 'Initial corpus author.'),
  ('guido-bonatti', 'Guido Bonatti', 'Medieval Latin', 'Initial corpus author.'),
  ('william-lilly', 'William Lilly', 'Renaissance/Early Modern', 'Initial corpus author.');

INSERT INTO works (author_id, slug, title, original_title, language, notes)
SELECT id, 'antiochus-thesaurus', 'The Thesaurus', NULL, 'Greek', 'Project Hindsight English translation used in initial research corpus.' FROM authors WHERE slug='antiochus-of-athens';

INSERT INTO works (author_id, slug, title, original_title, language, notes)
SELECT id, 'abu-mashar-great-introduction', 'The Great Introduction to Astrology', NULL, 'Arabic', 'Arabic original with English translation in initial research corpus.' FROM authors WHERE slug='abu-mashar';

INSERT INTO works (author_id, slug, title, original_title, language, notes)
SELECT id, 'al-biruni-tafhim', 'The Book of Instruction in the Elements of the Art of Astrology', 'Kitāb al-Tafhīm li-Awāʾil Ṣināʿat al-Tanjīm', 'Arabic/Persian', 'R. Ramsay Wright translation used in initial research corpus.' FROM authors WHERE slug='al-biruni';

INSERT INTO works (author_id, slug, title, original_title, language, notes)
SELECT id, 'bonatti-liber-astronomiae', 'Liber Astronomiae', 'Liber Astronomiae', 'Latin', 'Project Hindsight translation used in initial research corpus.' FROM authors WHERE slug='guido-bonatti';

INSERT INTO works (author_id, slug, title, original_title, language, notes)
SELECT id, 'lilly-christian-astrology', 'Christian Astrology', 'Christian Astrology', 'English', 'Three-book 1647 work; digital retype used in initial research corpus.' FROM authors WHERE slug='william-lilly';

INSERT INTO editions (work_id, label, translator, editor, publisher, publication_year, target_language, copyright_note, local_source_key)
SELECT id, 'Project Hindsight, Greek Track II-B', 'Robert Schmidt', 'Robert Hand', 'The Golden Hind Press', 1993, 'English', 'Copyrighted translation/edition; do not redistribute source PDF.', 'antiochus-thesaurus' FROM works WHERE slug='antiochus-thesaurus';

INSERT INTO editions (work_id, label, translator, editor, publisher, publication_year, target_language, copyright_note, local_source_key)
SELECT id, 'Brill 2019, two volumes', 'Keiji Yamamoto; Charles Burnett', 'Keiji Yamamoto; Charles Burnett', 'Brill', 2019, 'English', 'Copyrighted translation/edition; do not redistribute source PDF.', 'abu-mashar-great-introduction' FROM works WHERE slug='abu-mashar-great-introduction';

INSERT INTO editions (work_id, label, translator, publisher, publication_year, target_language, copyright_note, local_source_key)
SELECT id, 'R. Ramsay Wright translation, 1934 reproduction', 'R. Ramsay Wright', 'Luzac & Co.', 1934, 'English', 'Verify rights status of this specific digital reproduction before public quotation beyond short excerpts.', 'al-biruni-tafhim' FROM works WHERE slug='al-biruni-tafhim';

INSERT INTO editions (work_id, label, translator, editor, publisher, publication_year, target_language, copyright_note, local_source_key)
SELECT id, 'Project Hindsight translation, nine parts', 'Robert Zoller', 'Robert Hand', 'The Golden Hind Press', 1994, 'English', 'Copyrighted translation/edition; do not redistribute source PDF.', 'bonatti-liber-astronomiae' FROM works WHERE slug='bonatti-liber-astronomiae';

INSERT INTO editions (work_id, label, translator, editor, publisher, publication_year, target_language, copyright_note, local_source_key)
SELECT id, '1647 text, digital retype', NULL, NULL, NULL, 1647, 'English', 'Original work is historical; provenance and rights of the specific digital retype must be checked separately.', 'lilly-christian-astrology' FROM works WHERE slug='lilly-christian-astrology';
