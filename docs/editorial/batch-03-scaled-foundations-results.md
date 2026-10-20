# Batch 03 — scalable lexicographic editing without source dilution

**Review status:** 40 selected public headwords, **17 actual editorial revisions**, 13 retained at triage, and 10 with explicit source verification holds. All changed text is a *proposal awaiting human signoff*, not automatic publication.

This cohort applies the existing scholarly editorial standard to indication, celestial vocabulary, zodiac and astrological branches, planetary qualities and specialist historical terms. It tests a practical large batch **without demanding that every term be rewritten**.

## Counts confirmed against the assembled corpus

- **40** distinct headwords, not aliases or draft terms.
- **16** existing article-section prose edits, all anchored to final published section keys.
- **1** medical-astrology article introduction revision (historical context; no modern medical advice).
- **1** additional directly source-verified Lunar Mansions headword definition, section correction, and introduction clarification.
- **1** newly registered al-Bīrūnī source passage and a dedicated citation-linked interpretation.
- **17** headwords with actual before/after differences; **13** retained for review, **10** held for deeper source checks.
- **0** formula rows, existing historical interpretations, source citations, relations, aliases or normalized reference data overwritten.
- **0** automated approvals.

The SQL corrections are append-only:
- db/seed/0237_lexicographic_foundations_batch03.sql — style, definition support and mechanism clarity.
- db/seed/0238_lexicographic_lunar_mansion_source_correction.sql — precise correction of a source-generalization error.

## Source discovery that changed the text

al-Bīrūnī, *Book of Instruction in the Elements of the Art of Astrology*, R. Ramsay Wright translation (1934), **§164, printed p. 81** (uploaded PDF p. 95), contrasts the Moon's **27 stations according to Indian reckoning** with **28 according to the Arabs**. The page image was inspected directly; this is in the author text, not an editor's note.

The prior lexicon headword and article made the twenty-eight-station arrangement sound universal. It is now explicitly defined as a common Arabic system, with the 27-station alternative reported as a sourced historical contrast. The witness is registered in \`source_passages\` and linked to a source-specific \`interpretations\` record. No historical translation text is copied into the site.

The other copy revisions operate on existing reviewed doctrine rather than representing fresh primary-source extraction; their entire cited source streams still need normal human review. In particular, **Orientality, Occidentality, Celestial Latitude, Planetary Day and Planetary Hour**, together with **Ninth Nawbahr, Planetary Well, Almuguea, Evasion and Opening the Doors**, remain on source hold.

Two proposed candidates, \`oriental\` and \`occidental\`, were found by the fresh SQLite audit to be **unpublished** rather than public dictionary headwords. They were excluded before review and replaced with the published **Planetary Day** and **Planetary Hour** entries. No draft pages were promoted to published status.

Four planned section-level edits did not match any final assembled section, because an earlier editorial cleanup had removed those blocks. Rather than add a new template section without evidence, those SQL no-ops were deleted. **Tropical Zodiac**, **Sidereal Zodiac** and **Predictive Astrology** are retained for human review with no artificial copy change; **Medical Astrology** has only its real introduction change.

## Sustainable batch sizes: a risk-adjusted policy

The maximum batch size is not a universal constant. There are three separate workloads:

| Work | Initial throughput target | Quality gate |
| --- | --- | --- |
| Deterministic triage | The full 468-term corpus each run | Zero automatic historical corrections or approvals |
| Lexicographic review / before-after proposals | **40 related headwords per batch**; UI can support 60 after calibration | Distinct slugs; exact original and proposed text; human verdict on each; no silent SQL updates |
| Source extraction and doctrinal reconciliation | Typically **15–25 primary passages per one author/work**, fewer for difficult diagrams or conflicting calculations | Passage-level locator, author/editor distinction, faithful source-scoped interpretation, matched headword and checked structured data |
| High-risk formulas and variant tables | Usually **5–12 concepts per expert-source subpass** | Direct comparison of all relevant author variants and any numerical rules |

Large batches should be **collections of small independently verifiable decisions**. They are not authorizing a single AI instruction to regenerate 40 articles.

We can test **50–60 prose/headword reviews per batch** after human acceptance of two successive batches demonstrates accurate changes and low rework. Conversely, a source-heavy set may justifiably be ten entries even if its source extraction encompasses twenty-five passages.

**Stop or split any batch** if a candidate is unpublished, a source quote is unverified, source disagreements emerge, the final section keys differ from the intended edits, or CI fails. Batch 03 exposed all of these risks in practice: original drafts were removed from the queue, and no-op edits were rolled back before requesting human acceptance.

## Reviewer workbench

The batch is registered in \`docs/editorial/review-batches.json\` and \`docs/editorial/batch-03-foundations-slugs.txt\`. The review interface now uses a manifest, so later batches need a slug file and a manifest entry—not JavaScript UI rewrites.

With the public site on port 4321 and reviewer on port 4322, choose **Batch 03 · Foundations and planetary doctrine**. The interface shows exact before/after differences for all 17 revised entries, full source-witness summaries and existing open checks.

Use **Approve revised copy**, **Keep existing entry**, **Request changes** or **Flag source check** as appropriate. All source/review holds require explicit human resolution before approval, even when the prose itself has been edited. Signed decisions save to \`docs/editorial/lexicographic-ledger.csv\`.

## Release checklist

- [ ] Ordered SQLite rebuild plus \`PRAGMA foreign_key_check\`.
- [ ] Frontend build and complete corpus audit.
- [ ] Programmatic check: exactly 40 public slugs, 16 existing edited section keys, one medical introduction, 17 changed entries, ten evidence holds.
- [ ] Before/after comparison snapshot in human workbench, including al-Bīrūnī §164.
- [ ] Source claims in the high-risk ten not over-generalized; no automatic approvals.
- [ ] Human editorial review before merge.

**This is a quality editorial batch plus one new source-extraction/correction, not a completed full critical edition of forty source entries.**
