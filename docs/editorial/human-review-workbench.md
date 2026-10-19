# Human lexicographic review workbench

The local reviewer UI at http://127.0.0.1:4322/ now reads the **ten-entry calibration, twenty-entry Lots cohort, and five forty-entry cohorts (Foundations, Horary, Dignities, Astronomy and Core)** from their actual canonical slug files, the current SQLite database, and the review-state CSV. It does **not** deploy to the public GitHub Pages website.

## Launch

From the human-review branch:

    git fetch origin
    git switch --track origin/tooling/lexicon-human-review-20261019
    npm run dev

Open a second terminal in the same repository:

    npm run review

This runs the normal generated-data step and builds the before/after review snapshot from ordered SQL migrations and seeds. Open http://127.0.0.1:4322/.

The local Astro site stays at http://127.0.0.1:4321/ and is embedded in an iframe next to the review controls. Both processes should remain running. To stop either use Ctrl+C.

## Navigation

- **Working batch**: switch among the Pilot (10), Lots (20), Foundations (40), Horary (40), Dignities (40) and Astronomy (40).
- **Find an entry**: enter a headword or slug, or pick one from the suggestion list.
- **Review state**: filter within the selected batch.
- **Queue**: click headword chips or the previous/next arrows to proceed in reading order.
- **Live public article**: renders the built current branch on port 4321. The review panel is separate on 4322.
- **Before and proposed**: exact changed short definition, intro and SQL article-section blocks. A removed intro appears as "removed as redundant". Both columns show assembled SQLite content, not an invented AI paraphrase.
- **Historical witnesses**: inspected/reported evidence recorded in the existing database, including source interpretation and citations; the number of recorded witnesses does not imply they were all personally checked in this batch.

The comparison baseline uses the entire corpus **except** ordered editorial correction seeds 0233 through 0246. The proposed side uses the latest complete corpus. This makes the review consistent across all registered batches, and avoids comparing a SQL fragment with a page that might have been modified again in a later seed.

## Record a human decision

Enter your reviewer name once; it is remembered in this local browser. The name is written to each accepted decision.

1. Read the public article and the comparison.
2. Review the prior finding and the recorded sources.
3. If the orange **Outstanding check** is present, verify it, supply a concrete explanation and (for source matters) the exact work/edition/passage, then click **Resolve checked issue**. That action does **not** itself approve the entry; it records the source/verification decision and clears the hold, preserving the original task in the decision history.
4. Click **Approve revised copy** when content changed; **Keep existing entry** when there was no proposed change; **Request changes** for a concrete defect; or **Flag source check** for an unresolved factual question.
5. Always supply a specific explanatory note when requesting changes or a source check.

Approval is blocked by an open recorded check, and marked source-pending entries require explicit resolution. The backend checks these rules independently of the buttons. Every decision uses an optimistic revision token to prevent one old browser tab from silently overwriting a more recent review; refresh if such a conflict is reported.

**Saving a review does not modify astrological content, the canonical SQL seeds, or the public website.** It records your editorial signoff and feedback; subsequent editorial corrections remain separate source-controlled changes.

## Files and persistence

- Human decisions, named signoffs, review comments and timestamps: docs/editorial/lexicographic-ledger.csv. This is a **tracked Git file**. Additional columns review_note, reviewed_by and reviewed_at are introduced on the first saved decision.
- Per-passage suggestions and any attached images: editorial/reviews.json and editorial/review-assets/, preserving the existing workbench notes.
- Generated before/after comparison JSON: .tmp/editorial-review-snapshot.json (ignored build product).
- Two review-only SQLite builds: .tmp/editorial-before.sqlite and .tmp/editorial-after.sqlite (ignored).

Reviews are saved immediately to local disk, but not pushed automatically to GitHub. At the end of a review session you can back them up or submit them with:

    git status
    git add docs/editorial/lexicographic-ledger.csv editorial/reviews.json editorial/review-assets
    git commit -m "Record human editorial decisions and review notes"
    git push

If no notes or images were added, stage only the changed files reported by git status. A Git commit captures the history and makes the decisions available across computers after pushing.

## Validation

    npm run review:check

The check validates JavaScript syntax, CSV quote/newline handling, source-approval gates, stale-review conflict prevention, and recreates both SQLite comparisons. It ensures all 228 unique headwords from the seven cohorts (some terms occur in two batches) are represented, the intentionally unchanged control is unchanged and the historical source summaries are attached.

The GitHub workflow "Human editorial workbench" runs the same check in CI.

## Explicit limits

- The interface reviews **seven curated batches**, not an unreviewed full 468-entry side-by-side diff. Other entries can still be viewed on the public site; new editorial batches need a canonical slug cohort, a manifest entry and (only if justified) a correction seed.
- It is a **review-and-approval tool**, not an in-browser SQL authoring application. Text revisions belong in ordered SQL seeds, reviewed separately.
- Citation lists include historical sources in the corpus, not scanned book pages. Use the user's source PDFs or the citation locators to verify claims; never equate existing citation metadata with primary-source verification.
- After switching branches, rerun the review startup command to regenerate comparisons so they match the checked-out SQL. Do not leave a review process running against a different Git branch's generated data.

## Large batches and dynamic membership

The cohort manifest lives in docs/editorial/review-batches.json. Each batch points to an ordered list of **published canonical slugs**. The importer validates that all terms exist, are public and belong to a bounded list. The current front-end can accommodate up to sixty headwords in one cohort, though forty is the initial editor-reviewed size for source-sensitive material. Specific historical variants may require smaller research subpasses.

Batch 03 is described at docs/editorial/batch-03-scaled-foundations-results.md. Its revised Lunar Mansions entry includes a direct checked witness: al-Bīrūnī §164, 27 Indian stations versus 28 Arabic, and the public definition is now source-scoped.

Batch 04's specific source-check tasks and verified Lilly passages: docs/editorial/batch-04-horary-results.md. A source-pending status means an unresolved historical evidence check, not a software failure; do not resolve it without identifying the checked work and passage.

Batch 05's dignity source checks: docs/editorial/batch-05-dignities-results.md. Batch 06's astronomical source checks: docs/editorial/batch-06-astronomical-results.md. These are source-aware editorial reviews, not bulk approval of all historical claims.

Batch 07's primary text verification and eighteen revised headwords are documented in docs/editorial/batch-07-core-results.md. The twelve zodiac sign entries were not rewritten simply for uniform appearance.
