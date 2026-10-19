# Batch 05 — Dignities, Sect and Places

**Stage:** proposed editorial work awaiting human review, not published or signed off.

## Precisely measured scope

- **40 distinct published canonical headwords**, assembled from SQLite.
- **13 entries actually revised**, through **14 existing section-level corrections**. All other entries remain unchanged at the database level.
- **6 additional directly checked historical witnesses** with precise section/page locators, interpretation records and citation links.
- **14 source-pending** entries requiring additional primary-source collation, **7** revised entries ready for human editorial review, **19** triaged entries with their existing text retained. Six entries have both new prose and a source hold; the hold is not automatically cleared by a partial source check.
- **No formula table, dignity grid, alias, diagram source, existing source interpretation or ontology entry rewritten.**
- **No automatic human approvals**.

This is one 40-headword *editorial* batch. It does not claim that 40 historical rules were fully extracted from original books.

## Actual edits in `db/seed/0241_lexicographic_dignities_batch05.sql`

| Headword | Specific editing outcome |
| --- | --- |
| Accidental Fortitude | Removes project-facing justifications and scopes Lilly's weighing of incidental conditions. |
| Derived House | Replaces a duplicated statement about changing the counting origin with the seventh/eighth-house example. |
| Exaltation | Adds al-Bīrūnī's competing interpretations of the exaltation degree and its reach through a sign. |
| Exaltation Degree | Explains why a degree list alone does not settle the extent of exaltation. |
| Face / Decan | Documents Lilly's own-face exception to peregrination without changing face-ruler lists. |
| Halb | Makes the combined chart-sect, planetary-sect and horizon conditions intelligible. |
| Hayz | Adds Lilly's concrete compound day/night, horizon and sign-gender recognition rule. |
| Peregrine | Adds Lilly's Saturn-in-Aries example and clarifies the role of the adopted term table. |
| Triplicity Rulers | Replaces repetitive source disclaimers with al-Bīrūnī's named triplicity rulers and his alternative co-rulership ordering. |
| Sign Modality | Replaces a duplicate taxonomy warning with a concrete sign carrying multiple independent classifications. |
| Lord of the Geniture | Clarifies its identity relative to the Significator of Manners and Almuten of the Figure. |
| Planetary Joy | Replaces another general justification with the Sun's ninth-house joy and Moon's third-house joy. |
| Dispositor | Gives Mercury in Aries as a definite example of disposition by domicile, independent of aspect. |

## Firsthand source verification

Passages inspected in the user-provided library and registered through `db/seed/0242_dignities_batch05_checked_passages.sql`:

1. **al-Bīrūnī, *Book of Instruction*, §443**, attached to Exaltation: competing sign/degree scope interpretations.
2. **al-Bīrūnī, §443**, attached to Exaltation Degree: point-degree versus sign-wide exaltation.
3. **al-Bīrūnī, §445**, attached to Triplicity Rulers: diurnal, nocturnal and participating planetary rulers; alternative application of all three.
4. **Lilly, *Christian Astrology*, I, printed p. 103**, attached to Face / Decan: even face can prevent peregrination.
5. **Lilly, I, printed p. 112**, attached to Peregrine: Saturn at 10° Aries versus the degrees of its own bound/term.
6. **Lilly, I, printed p. 113**, attached to Hayz: sign gender and horizon alongside chart and planetary sect.

These are passage-bounded paraphrases, not a critical edition of all variants or a claim that every other source in the database was reread.

## Unresolved source checks, not failed software tests

The following **14 entries remain source-pending**:

Almuten; Almuten of the Figure; Chaldean Terms; Egyptian Terms; Indian Terms; Ptolemaic Terms; Face / Decan; Halb; Hayz; Peregrine; Triplicity; Triplicity Rulers; Planetary Share in a Sign; Lord of the Geniture.

Each has an explicit task in `docs/editorial/lexicographic-ledger.csv`. For instance, al-Bīrūnī's §445 verifies a scheme of participating triplicity rulers, but it does not automatically certify every alternative Dorothean or Ptolemaic source table; Lilly's Hayz explanation is not a universal attestation of every medieval Halb formulation.

## Quality and progress

The full corpus still contains **468** reviewed/published headwords. Across Batches 01–05 there are **150 cohort references representing 148 unique headwords** (Lot of Fortune and Evasion occur twice). Thus **148 / 468 = 31.6% of the corpus is represented in the editorial-review pipeline**. This is **coverage**, not completed historical source verification or human acceptance. No human signoffs are recorded in the ledger.

For Batch 05, automatic gates assert:

- all 40 canonical entries and their exact reviewer-batch membership;
- precisely 14 real section edits affecting 13 headwords;
- six citation-linked direct historical passage records;
- unchanged 468-entry public corpus and no foreign-key violations;
- 7 revised entries ready, 14 source-pending, 19 retained at triage, and zero invented human approvals;
- a baseline-vs-proposed reviewer snapshot with 148 distinct headwords across five cohorts, including all 13 genuine Batch 05 changes.

Review via `npm run dev` and `npm run review`, then choose **Batch 05 · Dignities, sect and places** at http://127.0.0.1:4322/.

**No merges to main; human decisions remain separate from these candidate editorial revisions.**
