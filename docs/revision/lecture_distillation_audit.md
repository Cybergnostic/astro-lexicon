# Legacy Lecture Distillation Audit

Purpose: avoid duplicate raw extraction work by testing the existing 40-lesson distilled corpus against the NA06 gold-standard workflow.

## Classification

- **A — reuse + targeted Sol review**: existing distillation is sufficiently atomic, provenance-preserving and source-scoped to migrate into the current doctrine workflow without fresh raw extraction. Raw source is revisited only for flagged/ambiguous records or spot-checks.
- **B — reuse + source patching/heavier review**: existing distillation is structurally useful, but sensitivity, ambiguity, catalog compression, examples, or technique complexity requires targeted raw-source checking before canonical/public use.
- **C — fresh Terra extraction required**: coverage/provenance is too weak or compressed to trust. No lesson is assigned C merely because it uses an older schema.

## Corpus baseline

The existing meta-framework identifies 40 lesson-level distilled sources: 28 natal/prognostic lessons and 12 foundational traditional-astrology lessons. NA06 Temperament has now completed full Terra extraction and mandatory Sol review and is the benchmark. The remaining 39 should be audited before any raw re-extraction is attempted.

Duplicate Library copies are not separate lessons and must be deduplicated by filename/content/version before migration.

## Audited sample

| Lesson | Records | Class | Decision |
|---|---:|:---:|---|
| `natalna_01_02_uvod__distilled.yaml` | 60 | A | Good atomic claims, explicit source priority, line-level evidence, confidence/generalizability and scope. Reuse. |
| `natalna_03_triplicitetni_vladari__distilled.yaml` | 40 | A | Procedure and distinctions are already atomized with exact evidence and provenance. Reuse. |
| `natalna_19_profesija__distilled.yaml` | 17 | A | Separates core material, historical addenda and transcript qualifications; sensitive material is explicitly flagged. Reuse. |
| `natalna_24_primarne_direkcije__distilled.yaml` | 16 | A | Technique-heavy material preserves cycle level, procedure fields, source evidence and confirmation logic. Reuse with targeted Sol review of methodological variants. |
| `natalna_22_veze_i_brak__distilled.yaml` | 18 | A | Core rules and sex-specific traditional rules are atomic and provenance-preserving. Reuse; public synthesis should distinguish historical doctrine from editorial language. |
| `trad_astro_09_aspekti_recepcije_stepeni__distilled.yaml` | 25 | A | Foundational definitions/distinctions are clean, atomic and line-cited. Reuse. |
| `trad_astro_11_fiksne_zvezde__distilled.yaml` | 16 | A/B | Structural extraction is good; large catalogues were intentionally compressed into reusable rules plus selected entries. Reuse core doctrine, but spot-check catalogue coverage before deciding whether additional star entries are needed for lexicon completeness. |
| `natalna_17_medicina__distilled.yaml` | 17 | B | Structurally good, with sensitive flags already present. Do not re-extract wholesale; run heavy Sol/human review and keep health claims historical/course-scoped unless independently suitable for public use. |
| `natalna_18_nesrece_i_smrt__distilled.yaml` | 11 | B | Structurally good but inherently sensitive. Reuse records for historical/doctrinal coverage; require heavy review before any public interpretive layer. |

## Initial conclusion

The older distillation work is substantially better than a summary-only corpus. The sampled files preserve exact evidence, line provenance, source-role priorities, scope, confidence/generalizability and review flags. **No sampled lesson currently justifies full raw re-extraction.**

The default workflow for the remaining corpus is therefore:

1. locate the canonical distilled file and deduplicate Library copies;
2. audit schema/provenance/coverage and classify A/B/C;
3. migrate A records into the current doctrine model and Sol-review only mandatory/flagged records;
4. for B lessons, reuse the distillation but patch specific gaps against raw source;
5. perform fresh Terra extraction only for C lessons;
6. preserve old stable source-record IDs as provenance aliases during migration rather than discarding them.

## Next queue

Continue the audit across all remaining distilled lessons, prioritizing:

1. `natalna_04_primarna_motivacija__distilled.yaml`
2. `natalna_05_almuten_figuris__distilled.yaml`
3. `natalna_07_vladar_ponasanja__distilled.yaml`
4. `natalna_08_kvalitet_uma__distilled.yaml`
5. `natalna_09_fizicki_izgled__distilled.yaml`
6. `natalna_10_hajleg_i_alkohoden__distilled.yaml`
7. `natalna_11_sreca_i_nesreca__distilled.yaml`
8. `natalna_12_finansije__distilled.yaml`

Do not begin mass raw-lecture extraction while usable distilled records exist.