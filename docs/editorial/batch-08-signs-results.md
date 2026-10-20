# Batch 08 — Sign relations, qualities, degrees and elections

**Stage:** 40 previously unreviewed published headwords entered the human editorial pipeline. All revisions are proposals awaiting an editor's decision.

## Measured editorial results

| Category | Count |
| --- | ---: |
| New distinct public headwords in reviewer | **40** |
| Headwords genuinely revised | **22** |
| Redundant article introductions removed | **20** |
| Existing source-aware explanatory sections revised | **14** |
| Directly inspected, newly linked al-Bīrūnī witnesses | **13** |
| Source-pending historical questions | **12** |
| Revised-awaiting-review without an open source hold | **18** |
| Other entries triaged / current copy retained | **10** |
| Invented human approvals | **0** |

The work modifies no normalized source formulas, historical tables, aliases, term relationships, earlier interpretations or public publication status.

## Source material actually read

al-Bīrūnī, *Book of Instruction in the Elements of the Art of Astrology*, Wright translation (1934), inspected authorial prose:

- **Sign-image discussion immediately preceding §353 (§352):** partly human versus four-footed images; mixed figures such as Sagittarius and Capricorn require source- and portion-specific interpretation.
- **§353:** loud-voiced Gemini, Virgo and Libra; half-voiced Aries, Taurus and Leo; weak-voiced Capricorn and Aquarius; voiceless Cancer, Scorpio and Pisces. This is al-Bīrūnī's witness, not a claim that Bonatti and Abū Maʿshar transmit identical lists.
- **§354:** large-family signs Cancer, Scorpio and Pisces with the rear part of Capricorn; distinguishes signs associated with small families from stronger sterility descriptions. This is historical symbolism, **not** individual reproductive or medical diagnosis.
- **§377:** equinoctially mirrored signs with reciprocal day/night lengths and equal ascensions; solstitial parallel signs; his report that Abū Maʿshar uses agreement-in-course for signs sharing a planetary ruler, and the named natural sextile/opposition examples. His explicit warning about unstable naming across books is preserved.

Thirteen individually cited interpretation records have been added in `db/seed/0248_signs_batch08_checked_witnesses.sql`, each bound to its subject and exact section. These are paraphrases, not excerpts of the modern translation.

## Actual lexicographic edits

The append-only `db/seed/0247_lexicographic_signs_batch08.sql` removes twenty redundant introductions where the canonical definition and following sections already express the claim. Fourteen sections now add an original-source example or clarify the exact historical mechanism.

Principal corrections:

- **Natural Sextile / Natural Opposition:** distinguish al-Bīrūnī's reported non-aspecting Abū Maʿshar sign pairs from 60° and 180° aspects; provide actual sign-pair examples.
- **Signs Agreeing in Path, Power and Zone:** differentiate shared ruler, complementary daylight and ascensional/parallel geometries; do not make competing source labels into exact universal synonyms.
- **Human / Quadruped signs:** recognize partly human or partly four-footed figures without converting a part-sign witness into an entire sign rule.
- **Powerful-, Half-, Weak- and Voiceless signs:** identify the source's actual sign lists and retain related but separate Bonatti and Abū Maʿshar vocabularies.
- **Barren / Fecund signs:** differentiate historical large-family and small-family classifications from more restricted sterility claims; state these are historical source categories, not modern health assessments.
- **Antiscion / Contra-antiscion, Rising signs, Northern/Southern signs and Election:** remove duplicated summary paragraphs, retaining their individual technical sections and reference information.

The remaining 18 entries were examined in the queue but not forced into an arbitrary rewrite.

## Outstanding historical checks

Twelve entries carry precisely described questions in `docs/editorial/lexicographic-ledger.csv`: co-rising relations; hearing/seeing; agreement in path, power or zone; azemene and gendered degrees; three wet/dry/common lunar-mansion classes; election roots and electional adaptation. The existing citations are preserved but those broader author- and scheme-specific comparisons are not automatically signed off.

An entry may be improved and remain source-pending. The local human workbench requires a recorded source resolution before approval.

## Corpus coverage, reviewer and CI

Batch 08 is registered via `docs/editorial/batch-08-signs-slugs.txt` in `docs/editorial/review-batches.json`. It appears in the existing review UI at http://127.0.0.1:4322/ as **Batch 08 · Zodiacal classes, relationships and elections**.

`scripts/check_signs_batch08.py` rejects silently missed SQL rows, uncited witness records, non-public headwords, unexpected state counts or fabricated signoff. The before/after snapshot compares assembled canonical SQL with correction seeds 0233–0248 withheld from its baseline, so each visible revision is an actual database difference.

There are **270 cohort references** across eight batches with two intentional repeat entries (Lot of Fortune, Evasion): **268 distinct public headwords out of 468 = 57.3% editorial pipeline coverage**. The remaining **200** have not entered a batch. This is NOT 268 historically verified entries and does not imply any human approvals.

**GitHub draft only:** do not merge to main or treat proposals as accepted until an editor explicitly reviews them.
