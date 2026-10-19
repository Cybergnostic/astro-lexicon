# Batch 07 — Traditional Planets, Qualities, Signs and Motion

**Editorial state:** forty previously unreviewed *published canonical headwords* selected from the machine-audited 468-term corpus; no human signoff and no publication to main.

## Measured results

| Metric | Count |
| --- | ---: |
| Public headwords selected | **40** |
| Headwords actually revised | **18** |
| Revised traditional planetary short definitions | **6** |
| Existing explanatory sections substantively revised | **8** |
| Redundant article introductions removed | **8** |
| Directly checked, individually linked historical interpretations | **12** |
| Revised, awaiting editorial signoff (no remaining source hold) | **9** |
| Source-pending (may also contain a revision) | **14** |
| Triaged with existing public copy retained | **17** |
| Automated human approvals | **0** |

The 12 zodiac-sign entries already contain useful element, modality and dignity classification and were **not** forcibly expanded or stylistically homogenized. The four short temperament types also remain concise while their source attributions require verification.

## Actual improvements

In \`db/seed/0245_lexicographic_core_batch07.sql\`:

**Jupiter, Mars, Mercury, Moon, Sun and Venus** now begin with their *traditional astrological identity*, like the earlier Saturn reference entry, instead of leading with a modern physical/planetary classification. Their existing astronomy/observational sections remain. The definitions state the specific benefic, malefic, luminary, sect, planetary nature or conditional Mercury classification actually supported by the source.

**Air, Earth, Fire, Water, Hot, Cold, Dry and Moist** no longer display a separate article lead that simply repeats the canonical definition and the following technical paragraphs. Their distinctions, linked sources, triplicity membership and qualitative combinations remain available.

Eight existing paragraph sections were edited with different aims:

- Jupiter: benefic class versus practical effectiveness; not an unconditional auspicious judgment.
- Mars: one forceful natural quality whose outcome is conditioned by sect, dignity and other factors.
- Mercury: al-Bīrūnī's conditional classification retained without falsely claiming Mercury lacks any natural nature.
- Venus: source-specific cold/moist character, nocturnal sect and conditional expression.
- Temperament: historical medical constitution **is not** a modern clinical or psychological diagnosis.
- Zodiac Sign: multiple simultaneous technical classifications, with al-Bīrūnī's **reported Indian exceptions** kept source-specific.
- Retrogradation: observed longitude reversal versus actual orbital reversal or diurnal rotation.
- Tropical Sign: source-aware movable/seasonal category distinguished from *tropical zodiac*.

No existing sign-specific dignity rows, planetary source-profile tables, astrological formulas, citation streams, relations or technical astronomical cycles were overwritten.

## Historical material directly inspected

al-Bīrūnī, *Book of Instruction in the Elements of the Art of Astrology*, R. Ramsay Wright translation (1934), authorial text:

- **§347:** four sign-quality mixtures; fire/yellow bile, earth/black bile, air/blood, water/phlegm. The author also explicitly describes alternative Indian assignments for some individual signs.
- **§§386–401:** seven traditional planetary natures and indications, including benefic/malefic status, sex and sect. For the six newly revised entries:
  - Jupiter moderately warm/moist, diurnal greater benefic.
  - Mars extremely hot/dry, nocturnal lesser malefic; alternative sex attribution reported.
  - Mercury moderately cold/dry in this author's table, but modified by planets nearby.
  - Moon cold/moist, female/nocturnal, with varying judgmental outcome.
  - Sun predominantly hot/dry, masculine/diurnal.
  - Venus moderately cold/moist, particularly moist, female/nocturnal lesser benefic.

\`db/seed/0246_core_batch07_direct_witnesses.sql\` adds **12 distinct term–passage links** with cited source sections and faithfully bounded interpretation summaries. The new records paraphrase rather than quote the English translation. Existing source witnesses are preserved. Claims verified for al-Bīrūnī are **not automatically certified** for Abū Maʿshar or other authors.

## Open historical source checks

Fourteen selected entries retain evidence holds. These include comparison of the six planets' source-specific nature/dignity traditions; the four standalone humoral types and the broader Temperament method; historical Retrogradation doctrine; the distinction between tropical/movable signs and zodiac framework; and author-specific historical sign categorizations.

An entry can have improved prose **and** a source hold simultaneously. The human review UI blocks approval until the reviewer has checked and recorded the unresolved author, edition or method. The presence of existing citations is not equivalent to re-verifying those passages.

## Quality checks and progress

- All 40 candidate slugs confirmed **published and previously marked unreviewed** in the generated corpus CSV.
- \`docs/editorial/review-batches.json\` now registers the seventh cohort as **Batch 07 · Planets, signs and natural philosophy**.
- \`scripts/check_core_batch07.py\` rejects missing edited SQL rows, missing citation joins, unexpected public-term counts, and invented human signoff. It asserts 6 definitions, 8 sections, 8 removed redundant introductions, 18 distinct edited headwords, 12 direct citation links and 14 explicit source holds.
- \`scripts/build_editorial_review_snapshot.py\` excludes corrective seeds 0233–0246 only from its baseline, displaying **actual assembled before/after text** for all current cohorts.
- The local reviewer is still at **http://127.0.0.1:4322/**, with \`npm run dev\` for the live site and \`npm run review\` for decisions.
- Across seven batches: **230 cohort records, 228 distinct entries (48.7%)** of the **468** public headwords are now present in the editorial-review pipeline; **240** have not entered any cohort. Human-approved entries remain **zero**, distinct from review coverage.

**Do not merge the editorial branch into main or treat revised/source-pending entries as approved without explicit human review.**
