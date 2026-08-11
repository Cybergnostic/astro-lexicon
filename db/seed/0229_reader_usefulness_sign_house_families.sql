-- Reader usefulness Batch D, pass 03: sign classifications and houses / places.
--
-- Most entries in these families already have adequate prose. This pass exposes the
-- memberships and repeated structures that readers otherwise have to reconstruct from
-- Related Concepts, and fills the two genuinely thin entries (Voiced Sign and Short Journey).

PRAGMA foreign_keys = ON;

-- -----------------------------------------------------------------------------
-- SIGN-CLASSIFICATION MEMBERSHIPS
-- -----------------------------------------------------------------------------

DELETE FROM term_article_tables
WHERE table_key='sign-class-members'
  AND term_id IN (SELECT id FROM terms WHERE slug IN (
    'barren-sign','diurnal-sign','fecund-sign','feminine-sign','half-voiced-sign',
    'human-sign','masculine-sign','nocturnal-sign','powerful-voiced-sign','quadruped-sign',
    'voiced-sign','voiceless-sign','weak-voiced-sign'
  ));

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Whole-sign members in the reviewed source',
  'Abū Maʿshar explicitly gives Gemini, Leo and Virgo as barren whole-sign examples. He also records qualified or partial participation elsewhere, so this compact list should not be mistaken for every fertility distinction in the source.',
  '["Sign"]','[["Gemini"],["Leo"],["Virgo"]]',910,'reviewed','Batch D: expose whole-sign membership without flattening partial-sign qualifications.'
FROM terms WHERE slug='barren-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Diurnal signs',
  'The series alternates from Aries through every other sign.',
  '["Order","Sign"]','[["1","Aries"],["2","Gemini"],["3","Leo"],["4","Libra"],["5","Sagittarius"],["6","Aquarius"]]',910,'reviewed','Batch D: expose the alternating day-sign series.'
FROM terms WHERE slug='diurnal-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Whole-sign fecund members',
  'Cancer, Scorpio and Pisces are explicit whole-sign examples in Abū Maʿshar. The source also assigns the latter half of Capricorn to the many-children class, so the doctrine is not limited to whole-sign memberships.',
  '["Sign"]','[["Cancer"],["Scorpio"],["Pisces"]]',910,'reviewed','Batch D: expose whole-sign membership while retaining the partial Capricorn qualification.'
FROM terms WHERE slug='fecund-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Feminine signs',
  'The alternating series begins with Taurus.',
  '["Order","Sign"]','[["1","Taurus"],["2","Cancer"],["3","Virgo"],["4","Scorpio"],["5","Capricorn"],["6","Pisces"]]',910,'reviewed','Batch D: expose the alternating feminine series.'
FROM terms WHERE slug='feminine-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Abū Maʿshar’s half-voiced class',
  'This is the intermediate class in Abū Maʿshar’s graded voice taxonomy; Bonatti’s separately translated Half-Voice Sign remains a source-specific analogue rather than an automatic synonym.',
  '["Sign"]','[["Aries"],["Taurus"],["Leo"],["Sagittarius"]]',910,'reviewed','Batch D: expose Abū Maʿshar membership while preserving the Bonatti distinction.'
FROM terms WHERE slug='half-voiced-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Whole-sign human / bipedal examples',
  'al-Bīrūnī gives Gemini, Virgo and Libra as whole-sign examples. His transmitted classification also applies human or bipedal character to portions of composite signs, so partial-sign assignments are intentionally not converted into whole-sign membership here.',
  '["Sign"]','[["Gemini"],["Virgo"],["Libra"]]',910,'reviewed','Batch D: use source-specific whole-sign examples and preserve partial-sign qualifications.'
FROM terms WHERE slug='human-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Masculine signs',
  'The alternating series begins with Aries.',
  '["Order","Sign"]','[["1","Aries"],["2","Gemini"],["3","Leo"],["4","Libra"],["5","Sagittarius"],["6","Aquarius"]]',910,'reviewed','Batch D: expose the alternating masculine series.'
FROM terms WHERE slug='masculine-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Nocturnal signs',
  'The series alternates from Taurus through every other sign.',
  '["Order","Sign"]','[["1","Taurus"],["2","Cancer"],["3","Virgo"],["4","Scorpio"],["5","Capricorn"],["6","Pisces"]]',910,'reviewed','Batch D: expose the alternating night-sign series.'
FROM terms WHERE slug='nocturnal-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Powerful-voiced signs',
  'These are the strongest-voice members in Abū Maʿshar’s graded taxonomy.',
  '["Sign"]','[["Gemini"],["Virgo"],["Libra"]]',910,'reviewed','Batch D: expose powerful-voice membership.'
FROM terms WHERE slug='powerful-voiced-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Whole-sign quadruped examples',
  'Abū Maʿshar gives Aries, Taurus and Leo as whole-sign quadruped examples. The latter half of Sagittarius, and in some transmitted distinctions the first half of Capricorn, also participate as partial-sign cases.',
  '["Sign"]','[["Aries"],["Taurus"],["Leo"]]',910,'reviewed','Batch D: expose whole-sign quadruped members without flattening composite-sign portions.'
FROM terms WHERE slug='quadruped-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Voiced signs in Abū Maʿshar',
  'The source gives four whole signs plus the first half of Sagittarius. Its later graded voice taxonomy should be read alongside, not substituted for, this broader voiced category.',
  '["Membership","Sign or portion"]','[["Whole sign","Gemini"],["Whole sign","Virgo"],["Whole sign","Libra"],["Whole sign","Aquarius"],["Partial sign","First half of Sagittarius"]]',910,'reviewed','Batch D: expose the broad voiced-sign membership and preserve the Sagittarius qualification.'
FROM terms WHERE slug='voiced-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Voiceless signs',
  'Bonatti and Abū Maʿshar both place the watery triplicity in the voiceless class in the reviewed evidence.',
  '["Sign"]','[["Cancer"],["Scorpio"],["Pisces"]]',910,'reviewed','Batch D: expose the stable reviewed voiceless membership.'
FROM terms WHERE slug='voiceless-sign';

INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'sign-class-members','Weak-voiced signs',
  'These form the weakest voiced subdivision in Abū Maʿshar’s graded taxonomy before the separate voiceless class.',
  '["Sign"]','[["Capricorn"],["Aquarius"]]',910,'reviewed','Batch D: expose weak-voice membership.'
FROM terms WHERE slug='weak-voiced-sign';

-- Modality is a family-of-classes rather than a membership label, so show all three tetragons.
DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='sign-modality') AND table_key='modality-tetragons';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'modality-tetragons','The three modality tetragons',
  'Each seasonal quarter begins with a tropical/movable sign, continues with a fixed sign, and closes with a bicorporeal/common sign.',
  '["Class","Seasonal position","Signs"]',
  '[["Tropical / movable","Beginning of quarter","Aries · Cancer · Libra · Capricorn"],["Fixed","Middle of quarter","Taurus · Leo · Scorpio · Aquarius"],["Bicorporeal / common","Closing of quarter","Gemini · Virgo · Sagittarius · Pisces"]]',
  910,'reviewed','Batch D: expose modality as three repeating seasonal tetragons.'
FROM terms WHERE slug='sign-modality';

-- Voiced Sign was the genuinely thin umbrella entry in this family.
INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'','reviewed','Reader usefulness Batch D: sign-classification family.' FROM terms WHERE slug='voiced-sign';
UPDATE term_articles
SET intro='Voiced Sign is a historical umbrella category for zodiacal figures associated with speech or voice. In Abū Maʿshar the broad voiced group includes Gemini, Virgo, Libra, Aquarius and the first half of Sagittarius; elsewhere he further grades voice into powerful, half/moderate, weak and voiceless classes. The broad category and the graded subcategories therefore belong to the same doctrinal family without being interchangeable labels.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: explain the umbrella voice doctrine before its subtypes.'
WHERE term_id=(SELECT id FROM terms WHERE slug='voiced-sign');
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='voiced-sign') AND section_key='voice-family';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'voice-family','Broad class and graded subtypes',
  'The broad voiced-sign list identifies signs or sign portions associated with voice. The powerful-, half/moderate- and weak-voiced entries describe graded classes within related source doctrine, while the voiceless class marks the contrasting absence of voice. These labels should be compared source by source rather than treated as one universal modern scale.',
  910,'reviewed','Batch D: orient the reader within the voice-class family.'
FROM terms WHERE slug='voiced-sign';

-- -----------------------------------------------------------------------------
-- HOUSES / PLACES: SHARED STRUCTURE AND TWO THIN LOOKUP ENTRIES
-- -----------------------------------------------------------------------------

DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='twelve-places') AND table_key='twelve-place-overview';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'twelve-place-overview','The twelve places at a glance',
  'The structural class is general; the topic column summarizes Bonatti’s medieval house significations from the reviewed evidence and is not meant to erase variation among authors.',
  '["Place","Structural class","Selected traditional topics"]',
  '[["1st","Angle","Life · body · beginnings"],["2nd","Succedent","Substance · acquisitions"],["3rd","Cadent","Siblings · close relations · short journeys · religion"],["4th","Angle","Fathers · land and immovable property · hidden things · endings"],["5th","Succedent","Children · delights"],["6th","Cadent","Infirmities · servants · lesser animals"],["7th","Angle","Spouses and partners · open opponents · contracts · disputes"],["8th","Succedent","Death · inheritances from the dead"],["9th","Cadent","Religion · wisdom · long journeys"],["10th","Angle","Rule · profession · office · mothers"],["11th","Succedent","Good fortune · hope · friends"],["12th","Cadent","Hidden enemies · confinement · sorrow · large animals"]]',
  910,'reviewed','Batch D: expose the house family as one twelve-place reference while retaining source attribution.'
FROM terms WHERE slug='twelve-places';

DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='planetary-joy') AND table_key='house-joys';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'house-joys','Traditional planetary joys by house',
  'The house-based joy sequence is the best-known form in the reviewed tradition and is attested in Abū Maʿshar, al-Bīrūnī and Bonatti.',
  '["Planet","House of joy"]',
  '[["Mercury","1st"],["Moon","3rd"],["Venus","5th"],["Mars","6th"],["Sun","9th"],["Jupiter","11th"],["Saturn","12th"]]',
  910,'reviewed','Batch D: expose the seven house joys directly.'
FROM terms WHERE slug='planetary-joy';

DELETE FROM term_article_tables WHERE term_id=(SELECT id FROM terms WHERE slug='places-without-dealings') AND table_key='no-dealings-members';
INSERT INTO term_article_tables (term_id,table_key,heading,caption,columns_json,rows_json,sort_order,status,editorial_notes)
SELECT id,'no-dealings-members','Places explicitly named in the transmitted contrast',
  'Antiochus explicitly names these places in the no-dealings group in the reviewed passage. This source-specific grouping should not be substituted for the ordinary cadent-house class.',
  '["Place"]','[["6th"],["3rd"],["2nd"],["8th"],["12th"]]',910,'reviewed','Batch D: expose Antiochus’ explicit no-dealings membership.'
FROM terms WHERE slug='places-without-dealings';

INSERT OR IGNORE INTO term_articles (term_id,intro,status,editorial_notes)
SELECT id,'','reviewed','Reader usefulness Batch D: houses / places family.' FROM terms WHERE slug='short-journey';
UPDATE term_articles
SET intro='Short Journey is William Lilly’s third-house category for travel close enough to home that the traveller can ordinarily go and return quickly. His practical rule is roughly twenty to forty miles, or more generally a journey allowing return the same day or by the next day.',
    status='reviewed', editorial_notes='Reader usefulness Batch D: turn the isolated definition into a usable house-family entry.'
WHERE term_id=(SELECT id FROM terms WHERE slug='short-journey');
DELETE FROM term_article_sections WHERE term_id=(SELECT id FROM terms WHERE slug='short-journey') AND section_key='recognition-rule';
INSERT INTO term_article_sections (term_id,section_key,heading,body,sort_order,status,editorial_notes)
SELECT id,'recognition-rule','How Lilly distinguishes the category',
  'The mileage examples are practical rather than a universal geometrical boundary. The more general recognition rule is travel of a scale that permits a quick return, contrasted with the longer journeys assigned elsewhere in the house doctrine.',
  910,'reviewed','Batch D: explain the operative recognition rule rather than repeat the mileage only.'
FROM terms WHERE slug='short-journey';
