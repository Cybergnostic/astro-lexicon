# Lexicographic pilot 01 — ten-entry editorial review

Status: **pilot in progress**. Three entries revised in `db/seed/0233_lexicographic_pilot_01.sql`; seven have targeted review notes and are **not yet approved**. This is deliberately not a claim that all 468 entries have been source-verified or copyedited.

## Purpose and limits

The previous Reader Usefulness Baseline v1 determined that all 468 reviewed terms had an acceptable **conceptual** treatment. This pilot evaluates an additional question: does an entry read like a *scholarly historical dictionary entry*, where the headword and definition are concise, supporting explanations add information rather than duplicate it, and historical differences are attributed where they occur?

**Do not overwrite** existing editorial decisions, source provenance, citation locators, variant formula tables, semantic distinctions or the specialized visual components just to make entries more uniform. Length is not a quality score. The source database remains canonical.

### Editorial gates

1. **Definition** — Is the headword identified immediately, without circular or promotional prose?
2. **Technical accuracy** — Does the mechanism / classification / formula describe the source-attested thing? Preserve variant thresholds and doctrinal boundaries.
3. **Historical citation** — Can a statement naming an author be connected to a named work and exact passage? Distinguish a translation editor's note from the author.
4. **Lexicographic voice** — Remove remarks addressed to the project, extraction work, or database organizational decisions.
5. **Information architecture** — Avoid repeating the short definition in an article introduction and again in the first content section.
6. **Practical recognition** — For a technique, state the required motions, actors, qualifications, or a short verified example.
7. **Relations** — Check aliases, false friends and see-also relations without assuming similar English labels represent identical historical doctrine.

Labels: `ready-for-review` = revised copy awaits acceptance, `verify-source` = specific primary-source check required, `retain` = no substantial copy change currently justified, `needs-layout` = frontend/composition issue rather than missing content. These are human judgments, not algorithmic grades.

## Ten-entry inventory

| Entry (actual slug) | Editorial finding | Action / evidence | Status |
| --- | --- | --- | --- |
| [Reception](../../src/pages/terms/%5Bslug%5D.astro) (`reception`) | Composition already joins mechanism, mutuality and limits; an earlier pass removed one duplicative table. Variation among one-way and reciprocal forms remains historically important. | Read the rendered page and Lilly / Bonatti source accounts before altering established distinctions. Do not reopen the removed table. | **verify-source** |
| **Essential Dignity** (`essential-dignity`) | Already has a reference matrix and explicit separation of dignity classes, bound schemes and triplicity variants; generic truncation would discard real structure. | Review attributions and inspect whether prose duplicates the existing dignity table; preserve Dorothean / Lilly differences. | **retain / verify-source** |
| **Application** (`application`) | Concise headword was followed by an introduction and several paragraphs restating approaching motion. | Removed duplicate intro; tightened mechanics; kept Abū Maʿshar's own direct/same-sign conjunction conditions distinct from general application. Existing source locator: *Great Introduction* VII.5.4–5.5. | **ready-for-review** |
| **Translation of Light** (`translation-of-light`) | Source-valid mechanism repeated in definition, intro, initial section and sequence section; a concrete historical illustration was absent from the public explanatory copy. | Removed duplicated intro; wrote a short mechanism; replaced repetition with Lilly's explicit Mercury–Mars–Saturn example. | **ready-for-review** |
| **Sect** (`sect`) | A classification with genuinely related but distinct concepts (Halb / Hayz). | Compare definition and first section against the structured sect reference and historically used conditions. Keep the family distinction. | **retain / verify-source** |
| **Firdaria** (`fardar`) | **The displayed title and database slug differ.** Previous passes distinguish unequal medieval Firdaria from Lilly's fixed seven-year Alfridary and added a table of major periods. | Check each numerical period, day/night order and node placement against the cited editions before touching the table. No speculative harmonization. | **verify-source** |
| **Annual Profection** (`annual-profection`) | Mechanism and twelve-year cycle already stated; useful distinction between the profected sign and broader Lord-of-Year roles. | Audit whether intro repeats the canonical definition and whether the article needs an attributed recognition example. | **verify-source** |
| **Animodar** (`animodar`) | Correct high-level doctrine presented as a step-by-step mini-lesson and repeated in the introduction. | Removed duplicate intro, tightened stages, preserved author-specific candidate selection, added scoped pointers to Lilly and Bonatti. | **ready-for-review** |
| **Lot / Part of Fortune** (`lot-of-fortune`) | Source-sensitive reversed day/night arithmetic and historical labels; prior pass intentionally moved formula data into normalized tables. | Verify the existing formula table against each named source. Avoid re-adding formula prose or flattening historically distinct variants. | **verify-source** |
| **Saturn** (`saturn`) | Planet article now leads with traditional sect, benefic/malefic and qualities; separate normalized planetary and dignity profiles exist. | Browser QA for repeated astronomy vs tradition details; review attributions rather than expanding for length. | **retain / needs-layout** |

## Before / after excerpts

### Application

**Before (article introduction)**: “Application describes planetary motion toward exact contact. It is a temporal condition layered onto aspect or conjunction geometry…”

**After**: The introductory repeat is removed; the existing concise `short_definition` remains the definition. The explanatory prose begins: “A configuration is applying when planetary movement reduces the distance to the exact conjunction or aspect.”

The rest explains Abū Maʿshar's **specific** conjunction conditions and distinguishes motion toward exactness from guaranteed perfection. Attribution of the direct-and-same-sign rule is not generalized to all authors.

### Translation of Light

**Before**: The introduction and first two sections each explained a faster planet separating from one body and applying to another, without a concrete historical example.

**After**: The canonical `short_definition` is retained; prose clarifies the sequence and then presents Lilly's example: Mars at 15° Aries, Mercury at 16° Aries, Saturn at 20° Aries. Mercury separates from Mars and applies to Saturn. The example is explicitly attributed to *Christian Astrology*, Book I, original printed p. 111 (uploaded PDF p. 132).

The final distinction explains **Collection of Light** through *two* planets applying to *one* third planet, instead of repeating the same contrast three times.

### Animodar

**Before**: “Animodar … is a natal rectification method that begins from the prenatal conjunction or opposition of the luminaries…” followed by separate sections repeatedly introducing the syzygy, dignity indicator and angles.

**After**: The canonical `short_definition` supplies the lead. The four short sections add historical content: which lunation degree matters, how the planetary indicator is chosen, how the angles enter the correction and what alternative methods Lilly discusses. They **do not** imply a universal ranking algorithm.

The reference to Lilly's preference for rectification by events is traceable to *Christian Astrology*, Book III, ch. 99, original printed pp. 505–506 (uploaded PDF pp. 567–568).

## Direct source spot checks completed

- **William Lilly, *Christian Astrology*, Book I, original printed p. 111**, uploaded three-volume PDF p. 132: direct explanation and numeric Mercury–Mars–Saturn example of Translation of Light. Original spelling is **not** copied into public entry prose.
- **William Lilly, *Christian Astrology*, Book III, ch. 99, original printed pp. 505–506**, uploaded PDF pp. 567–568: Animodar, selection by dignity at prenatal syzygy and angular adjustment; Lilly's stated comparison with rectification by accidents.
- **Guido Bonatti, *Liber Astronomiae*, natal rectification discussion**, merged PDF pp. 1023–1024: prenatal conjunction/opposition, dignity rulers and additional testimony, comparison with angles. **Important:** the note explicitly identifying the technique with *an-namūdār* on PDF p. 1024 is an **editorial footnote**, not Bonatti's own designation. The entry must not misattribute that footnote to Bonatti.
- **Abū Maʿshar, *The Great Introduction to Astrology*, VII.5.4–5.5**: source claims for Application are carried from the existing reviewed interpretation and locator in seed `0098_core_mechanics_article_quality.sql`. **The Brill edition itself was not re-opened in this pilot**; full verification is pending.

## Validation & signoff checklist

- [ ] Fresh SQLite seed replay succeeds, including new `0233` seed.
- [ ] `npm run audit:corpus` succeeds.
- [ ] `npm run test:generated` and `npm run build` succeed.
- [ ] Open the revised entry pages in browser; inspect TOC, source accounts, and relation labels.
- [ ] Confirm removal of article intros does not hide references, diagrams, or page composition blocks.
- [ ] Human editorial signoff on each revised entry. Three are **proposed**, not automatically approved.
- [ ] Continue historical source audit of seven remaining sample entries before marking this ten-entry pilot complete.

## Next steps once accepted

1. Finish the seven outstanding checks (especially Firdaria period tables and Lot of Fortune formula streams).
2. Establish when to retain a short definition only, a definition with a short explanation, or a long source-sensitive article.
3. Triage the full 468-entry corpus under **these different criteria**, recording concrete defects; do not blindly expand or shorten all entries.
4. Make batch-sized edits through new ordered SQL seeds; keep versions and before/after examples.
5. Only then begin new book extraction. New historical evidence can trigger a targeted amendment even to an entry previously approved.

No original SQL seeds are rewritten; `0233` is an additive correction layer. No fabricated sources or unverified historical numbers are introduced.
