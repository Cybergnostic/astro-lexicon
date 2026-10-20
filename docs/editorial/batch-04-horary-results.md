# Batch 04 — Horary, aspects, perfection and impediments

**Editorial status:** 40 public canonical headwords inspected using an assembled SQLite review packet. **15 entries revised, 16 retained for human review, 10 source-pending** (the edited Void of Course entry is also in the held group). These states are not human approvals. All editions and source claims below are bounded to the material directly inspected, not universal claims about every astrological school.

## What “Source checks pending” actually means

It is an **open evidence question**: we have a proposed definition or an attributed historical formula, but the original passage or a competing source has **not yet been checked sufficiently to approve the entire claim**. It is **not** a statement that the entry is wrong, and it is not simply a test or technical error.

In the local review workbench, the open task appears as an orange **Outstanding check**. The **Approve** button is blocked on that entry. A reviewer can inspect the relevant book/edition and exact passage, record what was verified using **Resolve checked issue**, and then separately approve the entry. A partial check (one author but not another) does not clear the remaining task. The original check and resolution statement are preserved in the review ledger.

### Ten specific unresolved checks in this batch

| Headword | Exact unresolved issue |
| --- | --- |
| Abscission of Light | Verify the exact role of a cutting-off planet in Bonatti and whether the useful outcome in Lilly's example belongs in the general definition. |
| Abscissor | Check the use of destroyer/obstructor/abscissor as names for a participant versus a distinct mechanism in the relevant historical judgments. |
| Evasion | Compare the full sign-changing / redirected-application procedure and source-specific exceptions in the Arabic and later accounts. This entry also belongs to Batch 03. |
| Frustration (Bonatti) | Collate Bonatti's translated sequence with Lilly's distinct Frustration; do not merge them because the English word matches. |
| Intervention | Verify al-Bīrūnī's three-planet retrograde mechanics and distinguish Antiochus' intervention by rays. |
| Opening of the Gates | Confirm Bonatti's precise reception condition and distinguish it from the unrelated weather doctrine Opening the Doors. |
| Return of Light | Bonatti uses the translated term for more than one sequence; verify each original passage and the reported link with abscission. |
| Return of Virtue | Check the receiver's debility and conditions for a useful or harmful return across Abū Maʿshar, al-Bīrūnī and Bonatti. |
| Universal Question | Verify how Bonatti distinguishes duration/scope from absolute/determinate question types. |
| Void of Course | **Lilly checked:** Book I pp. 112 and 122; his sign-bound recognition and special sign qualifications are documented. **Still open:** exact earlier / Bonatti variants, including the applicable aspect and sign-bound rules. |

## Directly checked historical material

Direct reading of William Lilly, *Christian Astrology*, Book I in the user-provided 1647 digital retype (printed pages) supports the following **twelve independently linked passage references for eleven headwords**:

| Printed page | Headword / direct checked claim |
| --- | --- |
| 109 | Dexter Aspect: Aries → Aquarius is dexter |
| 109 | Sinister Aspect: Aries → Gemini is sinister; Lilly evaluates dexter as more forceful |
| 109 | Inconjunct: examples of signs that do not behold |
| 110 | Separation: beginning of separation versus leaving the combined half-orbs |
| 110–111 | Prohibition: bodily and aspectual interruption |
| 111 | Refrenation/Refranation: reversal of the applicant before perfection |
| 112–113 | Frustration: Mercury / Mars / Jupiter example |
| 112 | Void of Course: no new application while traversing the sign |
| 122 | Void of Course: Lilly qualifies adverse judgment for Taurus, Cancer, Sagittarius and Pisces |
| 126 | Collection of Light: common third planet and dignities |
| 126–128 | Horary Question: querent, quesited and turned houses |
| 126 | Perfection: translation or collection as indirect means |

The claims are registered in the additional ordered SQL seed \`0240_horary_batch04_lilly_direct_witnesses.sql\` with individual source passage IDs, historical interpretations and citation links. These are **paraphrases**, not reproductions of the digitized historical book.

## Specific editorial modifications

The append-only seed \`0239_lexicographic_horary_batch04.sql\` makes **18 article-section revisions and six concise introduction revisions**, affecting **15 distinct entries**:

- **Collection of Light:** replaces repeated convergence sentences with Lilly's technical qualifiers and a source-scoped reception statement.
- **Dexter / Sinister:** concrete Aries–Aquarius and Aries–Gemini examples, separating directional casting from application, and naming Lilly for the comparative force.
- **Inconjunct:** Lilly's non-beholding sign example rather than generic statements about all geometrical configurations.
- **Frustration / Prohibition / Refranation:** distinct actors and chronological order, with Lilly's explicit examples.
- **Separation:** distinction between beginning separation and clearing the half-orb allowance.
- **Void of Course:** Lilly's source-specific sign-bound definition plus judgment qualifications, leaving other source-stream questions open.
- **Horary Question:** removes public corpus/lexicon process language and focuses on actual participants and houses.
- **Perfection:** differentiates direct perfection from mediation by translation or collection.
- **Configuration / Partile Aspect:** reduces editorial meta-voice and clarifies source-scoped technical identity, without setting unverified numerical tolerances.
- **Station / Swift in Motion:** eliminates restatement and distinguishes speed, direction and station phase.

The remaining 25 headwords are **not automatically rewritten**. Several are already short entries; others contain genuinely important source distinctions requiring more evidence. The intentionally unchanged entries include Absolute Question, Determinate Question, Querent, Quesited, Radicality, and the specialized Bonatti categories. No saved historical formula tables, earlier source accounts, aliases, term relations, or public article identities were overwritten.

## Batch workflow and invariants

- The cohort is fixed in \`docs/editorial/batch-04-horary-slugs.txt\` and registered in \`docs/editorial/review-batches.json\`; both are loaded by the existing human workbench.
- \`docs/editorial/lexicographic-ledger.csv\` contains the actual proposal status and separate, precise research task where a source is pending.
- \`scripts/check_horary_batch04.py\` independently asserts 40 selected public canonical headwords, 18 updated section keys, six changed introductions, 15 truly modified headwords, 12 new cited Lilly interpretations, preserved 468 public entries and no automatic reviewer approvals.
- \`scripts/build_editorial_review_snapshot.py\` compares final assembled SQLite content against the corresponding baseline without the new numbered corrections. The reviewer shows real passages rather than mechanically generated paraphrases.
- The frontend and database check the entire corpus as usual.

**Review remains mandatory.** A passing CI suite proves the data and edit pipeline is consistent, not that every historical statement is scholarly verified.

## Continue

Further editorial batches can remain 40 or grow to 50–60 once human evaluation of the revisions confirms low error/rework rates. Direct primary-source verification is best handled in separately identified 15–25 passage groups, because some cases require checking more than one author for a single headword. Never count an unverified source as a completed extraction just to fill the quota.
