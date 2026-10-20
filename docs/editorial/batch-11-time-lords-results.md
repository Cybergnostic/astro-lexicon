# Batch 11 — Time Lords, Profections, Directions and Revolutions

**Draft editorial work awaiting human review.** Forty previously unreviewed public canonical headwords. Thirteen headwords have actual revised copy, eleven directly inspected and linked historical passages have been added, and twenty-three source checks remain open. No human approvals were simulated or applied.

## Exact counts

| Outcome | Count |
| --- | ---: |
| Newly allocated canonical headwords | 40 |
| Truly revised headwords | 13 |
| Source-backed definition changes | 3 |
| Existing sections revised | 11 |
| Article introduction revisions | 3 |
| New passage-level interpretations and citations | 11 |
| Entries remaining on source hold | 23 |
| Revised entries available for human review with no source hold | 6 |
| Remaining triaged entries (no compelled rewrite) | 11 |

Changes are append-only SQL migrations `0253_lexicographic_timelords_batch11.sql` and `0254_timelords_batch11_lilly_sources.sql`. Previous references, tables, historical variant formulas and existing source interpretations remain unchanged.

## Directly checked source observations

William Lilly, *Christian Astrology*, Book III (original printed pagination, inspected in the available digital historical text):

- **Printed pp. 501–502:** Lilly relates the Moon at nativity to the conception Ascendant in the *Trutine of Hermes* and explicitly acknowledges that the rule may fail to rectify to an exact degree. It is separate from Animodar.
- **Printed pp. 507–508:** Rectification by Accidents uses reliably dated past life events to judge the fitting directions of Ascendant and Midheaven to promittors. Lilly names the directed angle the significator and the contacted planet the promittor.
- **Printed pp. 708–709:** Primary Directions use oblique ascensions for the Ascendant and right ascensions for Midheaven in Lilly's discussion of Ptolemy's time key. His subsequent presentation includes alternative measures (Maginus and Naibod).
- **Printed pp. 715–716:** Annual profections advance by one sign (thirty degrees) per solar year beginning with the Sun's return to its radix place. Lilly subdivides the year into **thirteen equal profectional months**, not twelve calendar months.
- **Printed pp. 727–728:** Lilly's Lord of the Year is principally tied to the profectional sign. His worked example begins with Jupiter as Lord of the Year in Pisces, followed by Mars when the point reaches Aries, and weighs both radix and revolution conditions.
- **Printed p. 733:** Lilly's **Alfridary** gives seven-year planetary spans starting Sun–Venus–Mercury by day and Moon–Saturn–Jupiter by night. The source uses the term Alfridary; it is not evidence that the historically distinct Firdaria sequence has septennial major periods.
- **Printed p. 734:** A Solar Revolution is erected at the Sun's exact return to its natal zodiacal longitude, not at symbolic profectional sign boundaries.

Eleven interpretation records individually link these located pages to the relevant ten terms, with two independent passages for the Lord of the Year. This is **direct source checking**, but it does not exhaust other authors' historical variants.

## Substantive editorial corrections

- **Primary Direction and Promittor:** align the short definitions with the established significator/promittor roles. A primary direction requires explicit directed geometry and a time conversion; a promittor is a role, not a permanent category.
- **Monthly Profection:** replaces vague calendar-month language with Lilly's distinct thirteen equal intervals and their source-specific scope.
- **Profection:** states Lilly's exact thirty-degree annual movement, the anniversary tied to the Sun's return, and twelve-sign repetition.
- **Lord of the Year:** adds the actual partial-year Jupiter/Mars example and compares radix, annual return and profectional conditions without treating every annual selection procedure as identical.
- **Alfridary:** distinguishes Lilly's septennial sequence from the Firdaria system of periods/subperiods, preserving the existing day and night sequence tables.
- **Solar/Annual Revolution:** differentiates astronomical return to a source-selected solar longitude from symbolic temporal advancement.
- **Trutine of Hermes:** records Lilly's empirical reservation and its distinction from Animodar; no calculated birth-time formulas were changed.
- **Rectification by Accidents:** explicitly records Lilly's dated-event and primary-direction role test, rather than treating every modern rectification technique as ancient.
- **Alcochoden:** removes project-facing explanatory language and presents the historical year-giver doctrine alongside Lilly's reservations, not as a method for predicting longevity.
- **Planetary Years:** replaces a self-referential explanation with a historical distinction between a number scheme and a time-lord sequence.
- **Foreknowledge:** situates the usefulness of preparation inside Abū Maʿshar's original philosophical argument rather than guaranteeing perfect prediction.

Headwords with complex or insufficiently collated evidence (Hyleg, Alcochoden, Alfridary, Primary Directions, Jarbaḵtar, Ptolemaic Ages, planetary years and others) keep explicit source checks. None is auto-approved.

## Integrity and progress

- `docs/editorial/batch-11-time-lords-slugs.txt`: 40 published distinct slugs not previously reviewed.
- `docs/editorial/lexicographic-ledger.csv`: 23 source-pending, 6 revised awaiting human review and 11 triaged.
- `docs/editorial/review-batches.json`: register **Batch 11 · Time lords and predictive techniques**.
- `scripts/check_timelords_batch11.py`: assert exactly 3 definitions, 11 sections, 3 introductions affecting 13 unique entries, 11 independently citation-linked Lilly accounts, unchanged 468 public entries and zero fake approvals.
- `scripts/build_editorial_review_snapshot.py`: compare final SQLite with numbered editorial correction seeds 0233–0254 excluded from baseline, so the workbench displays real before/after text.
- Reviewer smoke test: 11 cohorts containing **390 review assignments / 388 distinct entries** because Fortune and Evasion occur twice.
- **388 of 468 headwords (82.9%) in editorial pipeline, 80 not yet entered.** This is not equivalent to approval or fully verified historical extraction.

The underlying historical source and review-note records remain versioned and human approval stays separate. All work can be reviewed through the local interface at http://127.0.0.1:4322/ while `npm run dev` and `npm run review` are running.
