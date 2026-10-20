# Lexicographic Batch 02 — Lots and Parts

**Status:** 20-headword review, **19 proposed copy revisions** and **one retained**, awaiting editorial signoff. This batch is based on the lexicographic calibration in `docs/editorial/lexicographic-standard-v1.md`. It is **not** a claim that the full source traditions for these lots have been critically collated.

## Scope and safeguards

- `db/seed/0235_lexicographic_lots_batch_02.sql` clears 16 redundant introductions, rewrites 3 introductions that need distinct historical context, and revises 23 public article-section paragraphs across 19 headwords.
- `db/seed/0236_lots_batch02_direct_source_locators.sql` adds nine independently checked passage records and nine passage-linked source-specific interpretations from Abū Maʿshar. These are new evidence records, not replacements for earlier witnesses.
- **Zero formula table rows, canonical term identities, aliases or term relations were edited.** Distinctions between names, night reversal and competing constructions remain visible.
- `general-indicators-of-a-lot` retained its existing useful source contrast; no rewriting was warranted in this pass.
- `docs/editorial/lexicographic-ledger.csv` tracks per-entry review state; an assistant correction is never the same as human approval.

## Twenty-entry review matrix

| Entry (canonical slug) | Result | Evidence and next check |
| --- | --- | --- |
| lot | Revised public construction, terminology and source-transmission prose; removed duplicated article lead. | Abū Maʿshar VIII.1, al-Bīrūnī §476; check long page layout / comparative tables. |
| hermes-lot-of-time-of-marriage | Replaced project narration with Abū Maʿshar's qualified Jupiter timing testimony, rather than copying the formula twice. | Abū Maʿshar VIII.4.43, p. 881, PDF 895. |
| lot-of-siblings | Explains Hermetic Saturn–Jupiter versus Wālīs Mercury–Jupiter; distinguishes the independent number-of-brothers lot. | Abū Maʿshar VIII.4.11–12, pp. 857–859, PDF 871–873. |
| lot-of-children | Distinguishes general children lot and separate child-specific lots; Hermetic sect reversal versus Tawfīl fixed formula. | Abū Maʿshar VIII.4.22–26, pp. 867–871, PDF 881–885. |
| lot-of-friends | Moon and Mercury rationale and judgment scope replace repeated definition. | Abū Maʿshar VIII.4.77, p. 905, PDF 919. |
| lot-of-rank | Explains why day and night use different luminaries and adds the source's exaltation degrees. | Abū Maʿshar VIII.4.59, p. 893, PDF 907. |
| lot-of-daughters | Documents Tawfīl's night-reversed variant alongside the fixed Hermetic formula. | Abū Maʿshar VIII.4.25, p. 871, PDF 885. No table edited. |
| lot-of-sons | Documents Persian sect-reversed and Tawfīl fixed Moon–Saturn variants alongside the Hermetic Moon–Jupiter form. | Abū Maʿshar VIII.4.24, p. 869, PDF 883. No table edited. |
| lot-of-fortune | Removes internal editorial framing and integrates al-Bīrūnī's report of differing night procedures. | al-Bīrūnī §475, PDF 296–298. **Source-pending** for complete Lilly/Bonatti formula collation. |
| lot-of-substance | Removes redundant lead and “what belongs in this entry” process discussion. | Bonatti witness already in corpus; **source-pending** for direct Bonatti checking before approving the specific rule. |
| lot-of-absence | Clarifies that naming and luminary order need to be read together. | Abū Maʿshar VIII.3; Bonatti separately represented in corpus. |
| lot-of-necessity | Removes duplicative disambiguation intro; short umbrella entry remains enough. | Abū Maʿshar VIII.5.8–9; related entries retain their separate identities. |
| egyptian-lot-of-necessity | Replaces repeat with Egyptian formula context and comparison to Persian construction. | Abū Maʿshar VIII.5.8, p. 915, PDF 929. |
| persian-lot-of-necessity | Clarifies the distinct Love/Familiarity-to-Mercury construction. | Abū Maʿshar VIII.5.9, p. 915, PDF 929. |
| lot-of-eros | Removes redundant intro only. | **Source-pending:** current source is Greenbaum's study; ancient Paulus/Olympiodorus passages still require direct collation. |
| lot-extraction | Replaces repetitive intro with accurate arc-projection mechanism and circle reduction. | Abū Maʿshar VIII.1; Bonatti cited in corpus; preserve non-Ascendant origins. |
| lot-of-the-haylaj | Removes repeated definition and leaves haylāǧ–lot distinction. | Historical works recorded in corpus; check original passages before formula changes. |
| natural-indicators-of-a-lot | Removes introductory paraphrase of full independent definition. | Abū Maʿshar VIII.1 and Bonatti source records. |
| general-indicators-of-a-lot | **Retained without copy edits**: already explains source-specific counted roles, unlike the introductory definition. | Abū Maʿshar VIII.8 / Bonatti source records; precise role counts still deserve direct comparison. |
| planetary-lots | Removes repeated classification lead, adds source-specific observation about Fortune/Absence as ingredients in other planetary lots. | Abū Maʿshar VIII.2–3; Bonatti witness from corpus. |

## Historical passage evidence

The following newly created passage records are tied to explicitly bounded statements in `interpretations` by a `citations` join; every text synopsis is paraphrased rather than copied from the modern translation.

| Directly checked passage | New linked entry | Key detail |
| --- | --- | --- |
| Abū Maʿshar VIII.4.43, p. 881 | Hermes' time-of-marriage lot | Context-dependent Jupiter timing testimony |
| VIII.4.11, pp. 857–859 | Brothers | Hermes vs Wālīs variants, transmitted through Zādān Farrūkh |
| VIII.4.22, p. 867 | Children | Hermetic reversing vs Tawfīl fixed formula |
| VIII.4.24, p. 869 | Male children | Hermetic, Persian and Tawfīl variants |
| VIII.4.25, p. 871 | Female children | Hermetic vs Tawfīl variants |
| VIII.4.59, p. 893 | High rank | 19° Aries by day; 3° Taurus by night |
| VIII.4.77, p. 905 | Friends | Fixed Moon–Mercury arc and interpretation |
| VIII.5.8, p. 915 | Egyptian Necessity | Mars to the third place |
| VIII.5.9, p. 915 | Persian Necessity | Lot of Love/Familiarity to Mercury |

The direct witness is *The Great Introduction to Astrology*, Brill 2019 edition, two volumes. Reference locators identify **printed pages**; the PDF physical page numbers (which are offset) are merely inspection aids. Sources in the earlier corpus continue to provide further witnesses that were not all reread.

### Editorial exceptions

**Lot of Fortune:** al-Bīrūnī explicitly reports that the Ptolemaic method uses a fixed order and other authors reverse it at night (§475). This supports distinguishing formula streams; it does **not** allow us to overwrite the existing source-specific table for Lilly or Bonatti without opening those editions.

**Lot of Eros:** the current reviewed interpretation relies on a study/abstract concerning Hellenistic formula transmission. Its claim remains in the corpus, but this batch does not relabel it as directly verified ancient material.

**Lot of Substance:** its Bonatti-based formula is unchanged. Removing administrative prose does not establish independent verification of the full Bonatti original.

**Gendered children lots:** their historical headings describe an earlier source's division; they should not be converted into assertions about a real child's sex or reproductive prognosis. The added prose is explicitly framed as an attribution to Abū Maʿshar.


### Bonatti's Part of Substance: a second context requires caution

Direct inspection of the uploaded merged *Liber Astronomiae* located Bonatti's clear Treatise 8.2, chapter 5 account (merged PDF p. 954): the Part of Substance is taken from the lord of the second house to that house's degree, the same by day and night, **projected from the Ascendant**. This supports the formula currently stored for that specific source.

A different passage in the earlier **horary/questions** material (merged PDF pp. 217–219, chapter XIV, *On Finding the Significator of the Thing Sought*) discusses the Part of Substance with a numerical question example. Its presentation starts from the second-house degree, and the example uses Mars even after naming the Sun as stronger significator; the modern translator's footnote flags that peculiarity. The relation of this question-specific presentation to the formal Lots chapter needs critical comparison before declaring a universal Bonatti rule. **Do not rewrite the structured formula from this passage without resolving the context.**

This is a concrete case in which the source-aware audit catches a question that cannot be solved by style normalization alone. The formula remains unchanged and the source-review state remains pending.

## Changes, validation, and acceptance

The generated editorial packets for this PR contain current definitions, reviewed prose sections, the unchanged formula tables and all linked source interpretations.

1. Run `npm run audit:corpus` and `npm run build`.
2. The GitHub Actions Lexicographic triage workflow builds the SQLite corpus, runs five regression tests, and runs `scripts/check_lots_batch02.py`: it must find **19** intro edits, **23** section edits and **nine cited direct source records**; unchanged control headword must remain untouched.
3. Review the complete Astrological Lot page, Fortune and Absence pair, necessity disambiguation links, and Children versus Male/Female Children pages on desktop and mobile; tables should remain legible and scroll safely.
4. Source-pending issues remain unresolved, not blocked by unrelated prose corrections.
5. **Human acceptance required before merge.** The batch is a proposed editorial correction set, not auto-approved.

## Next work

After review, use the same family-based packet mechanism to select a different cohort, but first decide whether more in-depth source collation is necessary for the outstanding Fortune, Substance and Eros cases. Do not apply cosmetic rewrites automatically to the other 448 public entries.
