# Editorial Policy

## Purpose

Astro Lexicon is a source-based encyclopedia. Its job is to document how astrological concepts are defined, distinguished, and used across sources.

It is not a single-author textbook and should not force disagreements into one synthetic doctrine.

The lexicon should also remain recognizably **astrological**. Reading an astrology book does not make every philosophical, medical, meteorological, religious, or ordinary-language concept in that book an astrological lexicon term.

## What belongs in the lexicon

Before asking whether a definition is good, ask whether the proposed entry is genuinely lexical.

A strong canonical entry normally names a repeatable concept that a reader may need to recognize across passages or authors. Typical examples include:

- planetary conditions and phases;
- aspects and perfection/impediment mechanisms;
- dignities, debilities and rulership systems;
- sign, degree and house classifications;
- lots and calculated points;
- rectification, direction, profection, revolution and other predictive techniques;
- named historical doctrines or source-specific technical terms;
- astronomical concepts directly required to understand astrological technique.

Do **not** create or preserve an entry merely because a source discusses:

- a general philosophical concept;
- an ordinary word used non-technically;
- an event or effect predicted by a configuration;
- a topical recipe such as what a placement means for marriage, illness, war, travel, wealth, etc.;
- one item in a long catalogue of correspondences;
- a convenient editorial label invented during extraction when the source itself does not treat the thing as a concept.

The private searchable corpus may contain all of those occurrences. The public lexicon should not.

### Entry types

The database uses `terms.entry_type` to distinguish three editorial roles:

- `technical` — the main astrological lexicon: named astrological doctrines, configurations, classifications and techniques;
- `astronomical` — supporting astronomical vocabulary required to understand traditional astrological texts;
- `contextual` — genuinely named historical concepts useful for understanding an astrologer’s theoretical framework, but not themselves ordinary astrological working terms.

Contextual material should be admitted conservatively and should not dominate the main alphabetical browse.

## Evidence hierarchy

Prefer, in order:
1. the primary astrological text itself;
2. a reliable translation or critical edition;
3. translator/editor notes that clarify terminology;
4. secondary scholarship used explicitly as secondary interpretation.

## Writing rules

- Every substantial historical or doctrinal claim should have a source reference.
- Encyclopedia summaries must be original prose.
- Quotations should be short and used only when wording itself matters.
- Do not silently modernize technical vocabulary.
- Do not infer a technical doctrine from ordinary-language use of a word.
- Do not merge concepts merely because modern translators use the same English word.
- Distinguish author, work, translator, editor, and edition.
- Page references always belong to a specific edition.
- Canonical definitions state **what the concept is**. Predictions, effects and examples belong after the definition unless they are necessary to identify the concept.

## Quote policy

The default number of quotations for an entry is **zero**. A quotation is evidence, not decoration.

Add a short quotation when at least one of the following is true:

- the author gives an unusually compact definition;
- the exact historical wording is itself terminologically important;
- a disagreement between authors is clearer when their wording is visible;
- a translation choice or ambiguous technical term needs to be documented;
- the quotation materially helps a reader recognize the rule better than another paraphrase would.

Do not add a quotation simply because one is available.

For modern copyrighted translations, quotations must remain especially short and selective. Prefer paraphrase plus locator. Public-domain texts may be quoted somewhat more freely in principle, but the site should still use the same sparse editorial style.

Never stitch separate phrases together and present them as one quotation. If the existing `source_passage` covers a very broad range, create a narrower passage for the quotation so that the quoted wording is not misleadingly attached to unrelated interpretations.

As a normal display rule, one short defining quotation per source-specific interpretation is already more than enough. Multiple quotations require a real textual reason.

## Disagreement

When sources disagree, record the disagreement directly.

Preferred structure:
- shared core meaning, if one exists;
- Author A's treatment;
- Author B's treatment;
- historical or terminological distinction;
- unresolved issue, if applicable.

Avoid declaring one formulation the universal traditional doctrine unless the corpus supports it.

A canonical definition may therefore be deliberately broader than one author’s formulation. It should still remain precise enough to identify the concept. Author-specific thresholds, requirements and exceptions belong in source interpretations.

## AI-assisted extraction

Machine-generated records are proposals, not authoritative entries.

Allowed automated tasks:
- candidate-term detection;
- locating repeated terminology;
- extracting bibliographic and page metadata;
- matching known terms against passages;
- proposing aliases and relationships;
- drafting source summaries for review.

Human/editorial review is required for:
- canonical term identity;
- synonym merging;
- doctrinal distinctions;
- historical equivalence;
- final definitions;
- publication status.

During the revision pass, `terms.definition_quality` records the 1–5 quality scale from `definition-standard.md`. `interpretations.evidence_grade` records only retained A- or B-level evidence. C-level mention/context occurrences are deleted from `interpretations` rather than kept as clutter.

## Copyright

Source PDFs are not committed to the repository or distributed through the public site unless their legal status clearly permits it.

For copyrighted editions/translations:
- store bibliographic metadata and locators;
- prefer original summaries;
- use only short quotations where justified;
- do not reconstruct or expose substantial portions of a copyrighted work.

Public-domain status of an ancient or early-modern original does not automatically make a modern translation or edition public domain.
