# Batch 09 — Planetary conditions, aspects and solar proximity

**Draft review stage.** Forty newly selected, previously unreviewed public headwords. **Sixteen headwords genuinely revised**, **fifteen direct source witnesses** added, **twenty source holds** retained; none automatically approved.

## Progress (do not conflate with human signoff)

- 40 Batch 09 canonical public entries included in the review manifest.
- 16 actual changed headwords, including 8 canonical short-definition corrections for later minor aspects, 8 existing article-section changes and 3 revised/suppressed redundant article introductions.
- 15 directly inspected, individually citation-linked passages from William Lilly, *Christian Astrology*.
- Editorial dispositions: **20 source-pending**, **4 revised-awaiting-review without a hold**, **16 triaged with original text retained**. Twelve of the improved headwords also have unresolved source holds.
- Corpus remains 468 public entries. No old interpretation rows, stored formula tables, angular classifications, diagrams, term aliases, relations or publication statuses altered.
- No reviewer signoff recorded by the batch-generation work.

Across nine cohorts there are **310 batch references but 308 distinct public headwords** (Lot of Fortune and Evasion appear twice). **308/468 = 65.8% editorial-pipeline coverage**, with 160 entries not yet assigned. This is **not** 308 fully verified historical articles nor a human-approval percentage.

## Directly inspected historical evidence

Lilly, *Christian Astrology*, original 1647 text in the user-provided digital retype:

- **Book I, printed p. 32:** semisextile (30°), quintile (72°), tredecile (108°), biquintile (144°), and quincunx (150°) are identified as newer aspects; Lilly attributes their addition to Kepler. This is evidence of **Lilly's attribution**, not independent proof of Kepler's exact original method.
- **Book I, p. 109:** principal sextile, square, trine and opposition rays, including directional dexter/sinister geometry.
- **Book I, p. 110:** combining planetary half-orbs and the distinction between exact separation and full release from another planet's rays; Lilly's Saturn/Jupiter example totals nine degrees.
- **Book I, pp. 113–114:** combustion as a same-sign proximity state; cazimi at 17 arcminutes with the Sun at 15°30′ and Mercury at 15°25′ Taurus; superior and inferior planetary classes, the latter including the Moon in Lilly's own wording; bodily besiegement by Mars/Venus/Saturn.
- **Book III, printed p. 512:** the fuller direction/speculum table includes semiquintile (36°), semiquadrate (45°), sesquiquintile (108°), sesquiquadrate (135°), and biquintile (144°).

These are paraphrased in fifteen bounded `source_passages` plus linked interpretations and citations, not reproduced as lengthy quotes. Both Book I and Book III page references are the actual **printed** pagination, not PDF indices.

## Actual editorial corrections

`db/seed/0249_lexicographic_conditions_batch09.sql`:

- The eight minor-aspect headwords **Biquintile, Quincunx, Quintile, Semiquintile, Semisextile, Semisquare, Sesquiquadrate, Sesquiquintile** now describe their documented angle and historical status rather than implying that all these are original Hellenistic or medieval aspect relations. In particular, a traditional non-beholding sign relation is not automatically equivalent to a later 150° minor aspect.
- **Aspect** distinguishes the principal ray geometry from bodily conjunction, and both from questions of application, reception, obstruction and perfection.
- **Cazimi** uses Lilly's real Sun/Mercury example, qualifying his numerical threshold by author.
- **Combustion** specifies Lilly's same-sign 8°30′ allowance and records that he acknowledged alternative calculations.
- **Besiegement** uses Lilly's concrete Mars 10° Aries, Venus 13° Aries, Saturn 15° Aries bodily enclosure without imposing it on every ray variant.
- **Planetary Orb** distinguishes beginning separation from leaving the combined half-orbs.
- **Inferior Planet** explicitly records that Lilly includes the Moon alongside Venus and Mercury, rather than assuming his usage matches a narrower technical classification.
- **Superior Planet** records Lilly's Saturn–Jupiter–Mars classification.
- **Affliction** explains why the cause must be stated instead of repeating the umbrella label.

The other twenty-four terms were not all forced into rewritten articles; several already had source-specific definitions, while others would require historical comparisons that remain pending.

## What source-pending means in this cohort

There are **20 open research checks**, detailed individually in `docs/editorial/lexicographic-ledger.csv`: specialist Bonatti doctrines, the original history of newer minor aspects, source-specific combustion and cazimi limits, ray-based besiegement, orb table variants, and historically distinct Combust Way/Via Combusta recognition conditions.

Directly checking Lilly supports his *reported* method; it **does not** settle a separate claim about Kepler, Antiochus, Bonatti, or every earlier author. The review workbench will not allow approval of source-held entries without an explicit documented resolution.

## Files and safeguards

- `docs/editorial/batch-09-conditions-slugs.txt`: 40 canonical entries; `docs/editorial/review-batches.json`: registered ninth cohort.
- `db/seed/0249_lexicographic_conditions_batch09.sql`: eight changed definitions, eight sections, three introductions (sixteen distinct headwords).
- `db/seed/0250_conditions_batch09_checked_lilly.sql`: fifteen precisely linked historical witnesses.
- `scripts/check_conditions_batch09.py`: asserts all changed definitions/sections/intros, witnesses, foreign keys, 468 published terms, exact 40-member cohort and evidence gates.
- `scripts/build_editorial_review_snapshot.py`: actual assembled SQLite before-and-after comparison with correction seeds 0233–0250 omitted from baseline.
- Human review at http://127.0.0.1:4322/, selecting **Batch 09 · Planetary conditions and aspects** after starting both `npm run dev` and `npm run review`.

**All editorial changes are proposals. Do not merge into main without human evaluation; passing automated tests establishes engineering consistency, not completed source criticism.**
