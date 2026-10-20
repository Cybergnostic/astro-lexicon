# Batch 10 — Source-specific Lots and calculated points

**Editorial draft awaiting human review.** This is a 40-entry quality pass, not a claim of 40 completely reconstructed historical formulae.

## Measured scope

| Result | Count |
| --- | ---: |
| Newly selected and uniquely published headwords | **40** |
| Existing introductions actually revised or reduced | **19** |
| Real explanatory section corrections | **3** |
| Distinct headwords with substantive text changes | **19** |
| Newly inspected and individually citation-linked Abū Maʿshar passages | **16** |
| Edited entries without source holds, awaiting human approval | **5** |
| Entries with open source/textual checks (some also revised) | **26** |
| Other entries retained at triage | **9** |
| Automatic human approvals | **0** |

Thirty-six terms belong to the historically differentiated Lots family, while four neighboring calculated/reference topics—Dodecatemorion, Prenatal Syzygy, Luminary of the Time and Head of the Dragon—complete the cohort. Their formulae were deliberately **not** rewritten or blended.

## A significant historical discrepancy discovered

**Hermes' Lot of Enemies** in Abū Maʿshar, *The Great Introduction to Astrology*, Part VIII:

- At **§4.83, printed p. 907**, the measured arc runs from the ruler of the enemies place to the **degree of the enemies place**, projected from the Ascendant.
- At **§6.15, printed p. 931**, the source's summary instead states the measured arc ends at the **degree of the Ascendant**.

Those endpoint descriptions conflict. The published formula and normalized table remain aligned with §4.83; the explanatory section now transparently cites the conflicting §6.15 recapitulation. The entry remains **source-pending** until the Arabic and manuscript/edition readings can be critically checked. Neither reading has been silently corrected or promoted to a universal formula.

The neighboring **Lot of Enemies** generic page also now distinguishes these two passages, the fixed Saturn-to-Mars account of **some of the Ancients** (§4.82), and unrelated Fortune–Saturn traditions. A source name alone cannot be used to merge them.

## Other source-backed corrections

- **Lot of the Father (§4.14a–b, printed p. 861):** records Abū Maʿshar's preferred Sun–Jupiter substitution for Saturn under the rays, and his competing reported Mars–Jupiter alternative which he judges less correct. The existing structured formula stays unchanged.
- **Marriage of Men (Hermes, §4.31, p. 875):** distinguishes fixed Saturn→Venus from a reversed nocturnal variant also reported, but not preferred.
- **Marriage of Men (Wālīs, §4.32, p. 875):** uses fixed Sun→Venus, not Hermes' formula.
- **Marriage of Women (Hermes, §4.36, p. 877):** Venus→Saturn is a fixed construction, opposite in arc direction to the Hermetic male lot.
- **Marriage of Women (Wālīs, §4.37, p. 877):** Moon→Mars stays fixed, while Abū Maʿshar reports a Persian night reversal. Both historical variants remain distinguishable.
- **General Hermes Marriage Lot (§4.42, p. 881):** the author refers to the 'cardine of the wedding'; the textual apparatus glosses it as the western angle in one witness and the seventh in another. This is not silently replaced by a universal modern house-cusp formula.
- **Mother Lot (§4.70, p. 901):** Abū Maʿshar's tenth-place topical filing is contrasted with the father's fourth; the Venus–Moon night reversal is retained.
- **Lot of Honour (§4.71, p. 901):** the author associates it with some other named Lots without requiring us to erase their separate names.
- **Lot of Authority, Support and Victory (§6.13a, p. 929):** its shared Sun–Saturn/Jupiter calculation with the Father Lot does not erase the separate topical identity.
- **Journey and Travel on Water (§6.12a, p. 927):** different endpoints and sect conditions for two ninth-place journeys; the source's water-travel condition at 15° Cancer remains unchanged.

Sixteen separate historical interpretation/source passage links have been appended in `db/seed/0252_lots_batch10_direct_passages.sql`, covering fourteen distinct headwords, including two distinct witnesses for the conflicting Enemies Lot paragraphs and two for the Father Lot.

## Changes, integrity and review

- `docs/editorial/batch-10-lots-slugs.txt` — 40 canonical public headwords not previously assigned to a review cohort.
- `docs/editorial/review-batches.json` — tenth cohort appears as **Batch 10 · Source-specific Lots and calculated points**.
- `db/seed/0251_lexicographic_lots_batch10.sql` — 19 source-bounded introduction changes and 3 actual explanation edits.
- `db/seed/0252_lots_batch10_direct_passages.sql` — 16 individually linked direct historical passage records; source text is paraphrased, not reproduced.
- `docs/editorial/lexicographic-ledger.csv` — source verification question per held entry, including the precise §§4.83/6.15 discrepancy.
- `scripts/check_lots_batch10.py` — rejects missed sections, absent source links, unexpected review states, fewer/more than 468 public entries or invented human signoff.
- The human reviewer compares assembled SQLite before and after corrections, excluding correction seeds 0233–0252 from its baseline, and checks 348 distinct headwords across ten batches.

## Overall progress

**350 cohort assignments representing 348 distinct published headwords out of 468 = 74.4% coverage**. The only repeated cross-batch terms are Lot of Fortune and Evasion. **120 published headwords have not yet entered the review pipeline.**

This is editorial *pipeline coverage*, not historical-source verification or human acceptance. **No editorial decision was recorded on the user's behalf**, and no branch was merged into `main`.

Open the branch, start `npm run dev` and `npm run review` in separate terminals, then select Batch 10 at http://127.0.0.1:4322/.
