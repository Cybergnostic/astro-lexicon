# Batch 06 — Astronomical foundations, coordinates and eclipses

**Stage:** 40 previously unreviewed, published canonical headwords curated for human assessment. 22 now have proposed copy corrections; no entries have been approved by an AI. The changes preserve existing structured geometry/reference tables, historical interpretation streams, aliases and cross-references.

## Verified review statistics

| Measurement | Count |
| --- | ---: |
| New published headwords in this batch | **40** |
| Actual headwords with corrected content | **22** |
| Updated public prose sections | **19** |
| Introductions removed as repetitive or rewritten with source evidence | **10** |
| New directly inspected and individually citation-linked al-Bīrūnī passages | **15** |
| Modified headwords awaiting human signoff without a broader source hold | **13** |
| Entries with source-verification holds (including edited entries) | **12** |
| Entries triaged with existing copy retained | **15** |
| Human approvals recorded by this task | **0** |

## Source inspection and attribution

Primary text: al-Bīrūnī, *Book of Instruction in the Elements of the Art of Astrology*, R. Ramsay Wright translation (1934). The relevant sections were read in the original supplied PDF; the descriptions below are **paraphrases** of the authorial account, not copyrighted translation excerpts.

- **§138:** the equinoctial as the great circle associated with the first/daily celestial movement.
- **§139:** the ecliptic as circle of the signs, inclined to and intersecting the equinoctial.
- **§147:** distinct reference circles for declination and celestial latitude.
- **§148:** longitude of a star with latitude determined through its projection on the ecliptic.
- **§171:** the eccentric solar circle and its nearest and furthest positions, perigee and apogee.
- **§178:** epicycle, a smaller circle carrying the planet.
- **§179:** deferent, the circle traversed by the centre of the epicycle.
- **§180:** equant, the displaced point used for equal angular advance; explicitly described for Venus and the three superior planets in this model.
- **§255:** a lunar eclipse through Earth’s shadow at opposition with sufficiently small lunar latitude.
- **§256:** lunar nodal proximity and the eclipse condition.
- **§257:** partial versus total lunar eclipses.
- **§261:** a solar eclipse as the Moon obscuring the Sun from the observer.
- **§262:** local differences in solar eclipse appearance resulting from the observer's position and lunar parallax.

These yield **15 new passage–headword witness links** across 14 headwords (some passages are cited by more than one headword). The source records use section locators rather than inventing printed-page numbers from PDF indices.

Historical claims are explicitly bounded to al-Bīrūnī. For instance, the equant is not described as an actual second orbit; its geometrical role is distinguished from the eccentric deferent and the moving planet. Similarly, solar-eclipse locality is not confused with the Earth's shadow causing a lunar eclipse.

## What changed in public prose

The appended SQL correction is `db/seed/0243_lexicographic_astronomy_batch06.sql`. **Nineteen actual final SQL article sections** were revised: Altitude, Celestial Longitude, Ecliptic, Equinoctial, Zenith, Declination, Rising Times, First and Second Movement, Epicycle, Deferent, Equant, Eccentric Orbit, Apogee, Perigee, Eclipse, Occultation, Clime, and Semi-Diurnal Arc.

Ten introductions were removed or replaced: Altitude, Ecliptic, Declination, Celestial Longitude, Zenith Distance, Apogee, Perigee, First Movement, Solar Eclipse and Lunar Eclipse. Combined, the revisions affect **22 distinct headwords**.

Important distinctions preserved include observer-dependent altitude/zenith measurements, equatorial versus ecliptic coordinates, rising times by terrestrial latitude, model-specific eccentrics versus modern ellipses, epicycle/deferent/equant roles, and solar versus lunar eclipse geometry.

No new copy was invented for the other 18 entries solely to force a uniform article length.

## Precisely scoped pending-source tasks

Twelve headwords remain on source hold; these are **research questions**, not pipeline errors:

| Headword | What still requires checking |
| --- | --- |
| Rising Times | Historical rise-time tables, terrestrial latitude and the clime convention |
| First Movement | Author-specific first-motion cosmology and its distinction from the observed daily sweep |
| Second Movement | Usage of proper eastward motion and historical exceptions |
| Epicycle | Source-specific geometric models and status of the deferent/epicycle arrangement |
| Equant | Variants between Ptolemaic and later medieval accounts, including model-specific exceptions |
| Eccentric Orbit | Historical eccentric circle versus modern elliptical terminology |
| Apogee | Which circle/reference point defines the maximum, especially versus the epicycle summit |
| Perigee | Closest-point definition in each adopted historical orbital model |
| Saros Cycle | Historical attestation of the *name* and recurrence calculation without retroactive attribution |
| Eclipse Path | Historical eclipse visibility versus modern geographic path of totality |
| Inclined Orbit | Original orbital-plane and node definition in the model under discussion |
| Clime | Original latitude/day-length boundaries and the division convention |

Several of these entries received a verified *al-Bīrūnī* clarification, but **that does not automatically certify every other author or formula**. To approve an entry with an open check, a human reviewer must document its resolution or narrow the claim appropriately.

## CI and human approval

- `docs/editorial/batch-06-astronomical-slugs.txt` lists all 40 previously unreviewed public headwords; `docs/editorial/review-batches.json` registers them in the existing review UI as **Batch 06 · Astronomy, coordinates and eclipses**.
- `db/seed/0244_astronomy_batch06_direct_witnesses.sql` registers 15 source-specific passage records and their linked interpretation/citation records.
- `scripts/check_astronomy_batch06.py` detects missing SQL updates, lost citations, changed published-headword counts, ungrounded automatic approvals and status discrepancies.
- `scripts/build_editorial_review_snapshot.py` excludes the 0243 and 0244 correction seeds from the baseline but includes them in the current assembled copy, producing exact side-by-side differences.
- GitHub Actions regenerates and exports the full 40-entry review packet plus the unchanged earlier cohort packets.
- The local reviewer still requires explicit human decisions and preserves outstanding source checks.

After six cohorts: **190 cohort references, 188 distinct published headwords out of 468 (40.2%) have entered the review pipeline.** *This is pipeline coverage, not completed scholarly extraction or human approval; the remaining 280 are not yet in a review cohort.*

Open the branch, run the public Astro site with `npm run dev`, and in another terminal `npm run review`. Choose Batch 06 in the reviewer at http://127.0.0.1:4322/. Commit/push your signed ledger only when you finish reviewing.

**This draft PR should not be merged into `main` until human approval and CI are complete.**
