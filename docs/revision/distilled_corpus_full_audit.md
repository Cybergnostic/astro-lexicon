# Distilled Corpus Full Audit

Audit date: 2026-08-09

## Purpose

Use the completed NA06 Temperament upgrade as the benchmark for deciding whether older lesson-level distillations should be reused, patched, or replaced by fresh raw-source extraction.

## Classification

- **A — reuse + targeted Sol review:** existing distillation is structurally good enough to migrate into the current doctrine workflow; use raw source only for spot-checks or flagged records.
- **B — reuse + targeted source/safety audit:** existing distillation remains the starting point, but sensitive content, catalogue compression, or worked-example compression requires additional source checking before canonical/public use.
- **C — fresh raw re-extraction:** existing distillation is too incomplete or weakly provenanced to reuse safely.

## Result

Excluding NA06, which has already completed the new Terra/Sol benchmark process:

- **31 A**
- **8 B**
- **0 C**
- **39 lessons remaining for migration/review**
- **0 lessons currently scheduled for default full raw re-extraction**

The audit found that the older corpus generally preserves source file, source section, line ranges, verbatim evidence, evidence mode, confidence/generalizability, scope, relations, and review/human flags. Duplicate Library copies should be deduplicated by canonical filename/content/version rather than treated as additional lessons.

## A — reuse + targeted Sol review

1. `natalna_01_02_uvod__distilled.yaml`
2. `natalna_03_triplicitetni_vladari__distilled.yaml`
3. `natalna_04_primarna_motivacija__distilled.yaml`
4. `natalna_05_almuten_figuris__distilled.yaml`
5. `natalna_07_vladar_ponasanja__distilled.yaml`
6. `natalna_08_kvalitet_uma__distilled.yaml`
7. `natalna_11_sreca_i_nesreca__distilled.yaml`
8. `natalna_12_finansije__distilled.yaml`
9. `natalna_13_treca_kuca__distilled.yaml`
10. `natalna_14_cetvrta_kuca__distilled.yaml`
11. `natalna_15_prijatelji_i_neprijatelji__distilled.yaml`
12. `natalna_16_deveta_kuca__distilled.yaml`
13. `natalna_19_profesija__distilled.yaml`
14. `natalna_20_karijera_i_slava__distilled.yaml`
15. `natalna_22_veze_i_brak__distilled.yaml`
16. `natalna_23_ptolemejeva_doba_i_firdarije__distilled.yaml`
17. `natalna_24_primarne_direkcije__distilled.yaml`
18. `natalna_25_profekcije__distilled.yaml`
19. `natalna_26_solarne_revolucije__distilled.yaml`
20. `natalna_27_lunari_i_tranziti__distilled.yaml`
21. `natalna_28_divizije__distilled.yaml`
22. `trad_astro_01_uvod_u_astrologiju__distilled.yaml`
23. `trad_astro_02_zodijacki_znakovi__distilled.yaml`
24. `trad_astro_03_planete__distilled.yaml`
25. `trad_astro_04_esencijalna_dostojanstva__distilled.yaml`
26. `trad_astro_05_slucajna_dostojanstva__distilled.yaml`
27. `trad_astro_06_kuce__distilled.yaml`
28. `trad_astro_08_planete_u_znakovima__distilled.yaml`
29. `trad_astro_09_aspekti_recepcije_stepeni__distilled.yaml`
30. `trad_astro_10_arapske_tacke__distilled.yaml`
31. `trad_astro_12_eklipse__distilled.yaml`

## B — reuse + targeted source/safety audit

1. `natalna_09_fizicki_izgled__distilled.yaml` — body/appearance claims and a high number of existing human-review flags. Keep the distillation; review public suitability and source fidelity selectively.
2. `natalna_10_hajleg_i_alkohoden__distilled.yaml` — lifespan-sensitive material. Existing records are already strongly human-gated; do not re-extract by default.
3. `natalna_17_medicina__distilled.yaml` — medical doctrine. Extraction structure is good, but every claim must remain historically/course scoped and human/safety reviewed before public use.
4. `natalna_18_nesrece_i_smrt__distilled.yaml` — death/violence-sensitive material. Reuse records, but retain strict human/publication gating.
5. `natalna_21_potomstvo__distilled.yaml` — fertility/reproductive material. Reuse records with targeted human/safety review.
6. `natalna_29_vezbe__distilled.yaml` — worked examples were intentionally compressed into reusable synthesis patterns. Spot-check the raw examples to ensure no important procedural step was lost.
7. `trad_astro_07_znacenja_kuca__distilled.yaml` — some sensitive house meanings require targeted review before public presentation, but the extraction itself is reusable.
8. `trad_astro_11_fiksne_zvezde__distilled.yaml` — the large star catalogue was intentionally represented by reusable rules plus selected representative entries. Audit catalogue coverage against the intended encyclopedia scope rather than re-extracting the whole lecture automatically.

## C — fresh raw re-extraction

**None identified.**

A lesson should be moved to C only if later migration reveals a concrete failure such as missing major source sections, unusable provenance, non-atomic records that cannot be safely split, or a procedure whose ordered steps cannot be reconstructed from the existing distillation.

## Evidence from audit

Direct inspection across conceptual, natal-method, topic-specific, prognostic, and general-traditional lessons found consistent line-level provenance and normalized claims. Technique-heavy lessons such as primary directions preserve procedure-oriented structure; general lessons such as aspects/receptions preserve distinctions and tables; sensitive lessons already contain human-review flags rather than silently treating their claims as ordinary doctrine.

The old corpus therefore represents substantial completed work and should be treated as a migration source, not discarded as legacy summaries.

## Migration order

1. Finish NA06 reconciliation and create the verified `NAT.05 — Temperament` doctrine set.
2. Use Temperament as the first encyclopedia/frontend pilot.
3. Migrate **A lessons first**, starting with the highest-value foundational dependencies: signs, planets, essential dignities, accidental dignities, houses, aspects/receptions, natal introduction, triplicity rulers, primary motivation, Almuten Figuris, behavior ruler, and quality of mind.
4. Run targeted Sol review only where the old record's scope, attribution, ambiguity, reconstruction, contradiction, or sensitivity demands it.
5. Process **B lessons** with explicit source/safety audit gates.
6. Escalate a lesson to **C** only on demonstrated coverage/provenance failure.

## Practical consequence

The remaining workload is no longer `39 raw lectures to extract`. It is `39 existing distillations to migrate/review`, with only targeted raw-source reads. This should reduce duplicate work substantially while preserving the higher standard established by NA06.
