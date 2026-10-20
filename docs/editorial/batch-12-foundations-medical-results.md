# Batch 12 — Foundational Doctrine, Fixed Stars and Historical Medicine

**Editorial proposal; not human-approved.** This cohort contains forty newly selected, previously unreviewed public entries. It is a dictionary quality pass, not a claim that forty technical systems have received complete primary-source editions.

## Exact scope

| Result | Count |
| --- | ---: |
| New canonical public headwords | 40 |
| Substantively revised entries | **14** |
| Changed canonical definitions | 1 |
| Revised existing prose sections | 10 |
| Revised introductions | 4 |
| New directly inspected, individually linked historical passages | **10** |
| Open, explicitly described source checks | **24** |
| Revised entries awaiting human review without an open source check | 7 |
| Entries retained at triage with no forced rewrite | 9 |
| Artificial human approvals | **0** |

The **24 source-pending entries remain open** even when a specific Lilly or al-Bīrūnī passage has been verified: one author's technical account does not establish all variants. Seven of the fourteen text-revised entries remain on such holds.

## Source verification

Sources inspected directly for this pass, with separate passage-level metadata and linked interpretations in `db/seed/0256_foundations_medical_direct_witnesses.sql`:

- **al-Bīrūnī, *Book of Instruction* §121** — traditional seven-planet sphere order (Moon, Mercury, Venus, Sun, Mars, Jupiter, Saturn), followed by the sphere of fixed stars. Linked independently to Planetary Order and Seven Planets.
- **al-Bīrūnī §157** — fixed stars identified by position and a six-class historical magnitude scheme, not modern physical diameters or calibrated photometric values. Linked to Fixed Star and Stellar Magnitude.
- **William Lilly, *Christian Astrology*, Book II, printed p. 266** — lunar angular separation from an illness-onset place (45°, 90°, 135°) in critical-day judgments; Lilly's preference for the time a patient first took to bed, or the initial medical consultation if unavailable.
- **Lilly, Book II, printed pp. 290–292** — illness crisis defined as a sudden change toward an outcome, and separate treatment of critical and indicative lunar checkpoints. Additional decumbiture onset/consultation alternatives at pp. 290–291.
- **Lilly, Book II, printed p. 268** — bodily correspondence beginning with the head under Aries in his transmitted Hermes-attributed decumbiture account.

The ten witness records cover **eight distinct headwords**. They are bounded paraphrases of inspected historical pages, not copied original-book passages.

The earlier, already-recorded Abū Maʿshar and Bonatti witnesses support other conservative wording changes. **Those earlier interpretations were retained, not falsely presented as newly re-extracted in this batch.**

## Substantive corrections

The append-only SQL seed `db/seed/0255_lexicographic_foundations_medical_batch12.sql` contains **one definition, four introductions and ten existing section corrections** across fourteen distinct headwords.

- **Astrology:** Abū Maʿshar's astronomy/judgment distinction now explicitly preserves Bonatti's occasionally opposite translated usage of *astrology* and *astronomy* rather than mechanically imposing modern English naming on both.
- **Celestial Power and Astral Influence:** distinguishes the causation claimed by different historical philosophers from the separate claim that celestial conditions *indicate* something. The source-specific words remain distinct and are not merged as synonyms.
- **Planetary Order / Seven Planets:** al-Bīrūnī's concentric planetary sequence is described without treating it as the modern physical Solar System.
- **Critical Days:** Lilly's actual Moon-relative checkpoints and variable lunar speed are documented rather than substituting fixed calendar-day counts; this is **historical medical practice**, not a recommendation for managing illness.
- **Decumbiture:** Lilly's taking-to-bed root time is distinguished from illness-first-onset and fallback consultation times. Different source methods remain separately attributable.
- **Medical Crisis:** a more historically precise turning-point definition, explicitly separate from contemporary medical diagnosis.
- **Fixed Star / Stellar Magnitude:** six medieval ordinal magnitude classes are distinguished from quantitative modern photometry and physical stellar size.
- **Melothesia:** Lilly's transmitted Hermes passage is described as one historical zodiac-to-body mapping, not a clinically applicable or universal planetary-organ system.
- **Twelve Places:** the ninth/tenth house example explains topical signification versus accidental positional strength without repeating the same abstract distinction.
- **Testimony and Planetary Gender:** introductory redundancy reduced while maintaining the technical definitions and Mercury's variable class.

No historical formula tables, reference mappings, earlier source interpretations, aliases, canonical term identities, or public entry statuses were changed. Medical claims are historical descriptions, not contemporary health predictions or treatment directions.

## Editorial progress and preservation

- `docs/editorial/batch-12-foundations-slugs.txt` registers forty non-overlapping public headwords.
- `docs/editorial/review-batches.json` adds **Batch 12 · Foundations, stars and historical medicine**.
- `docs/editorial/lexicographic-ledger.csv` preserves all previous decisions and carries 24 detailed source holds for this cohort.
- `scripts/check_foundations_batch12.py` verifies the exact 14 changed entries, ten individually cited source passages, 468 public entries, foreign key integrity and zero invented human approvals.
- `scripts/build_editorial_review_snapshot.py` compares actual SQLite state before/after the numbered editorial seeds, now excluding 0233–0256 from the baseline.
- The reviewer tests exercise twelve cohorts and **428 distinct public headwords**.

**Progress: 430 cohort assignments, representing 428 unique headwords / 468 public entries = 91.5% editorial-pipeline coverage; 40 headwords remain untouched.** The only intentional overlapping cohort assignments are Lot of Fortune and Evasion.

**Review-pipeline coverage is not source-completeness or human editorial approval.** Reviewer work remains at http://127.0.0.1:4322/ via the two-terminal `npm run dev` / `npm run review` workflow. All changes are designed for integration through a real merge commit so detailed source and review history survives.
