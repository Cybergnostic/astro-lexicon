# Definition standard

This document sets the editorial standard for public lexicon definitions.

## Goal

A definition should answer **what the concept is**, not merely what it is associated with. It should be useful to a reader who encounters the term without already knowing the doctrine.

A strong short definition normally contains three things:

1. **Genus** — what kind of thing it is: aspect, dignity, sign classification, predictive technique, calculated point, planetary condition, etc.
2. **Mechanism or criterion** — what configuration, rule, calculation, or distinction makes the thing what it is.
3. **Boundary from neighbouring concepts** — enough information to prevent an easy confusion with a related term.

Where a compact example materially clarifies the rule, include one. Examples should illustrate the source doctrine rather than introduce modern rules not present in the source.

## Lexicality gate

Definition quality is the **second** question. The first is whether the proposed entry belongs in an astrological lexicon at all.

Before retaining a term, ask:

1. Is this a named or clearly delimited concept rather than a sentence topic?
2. Can the reader recognize another instance of it after reading the definition?
3. Does it belong to astrological technique/doctrine, necessary astronomical vocabulary, or genuinely useful historical astrological context?
4. Would the entry still make sense outside the one example or prediction from which it was extracted?

If the answer is no, do not rescue it with a polished definition. Delete it from the public ontology and leave the occurrence in the searchable corpus.

Examples of things that usually **fail** the lexicality gate:

- general Aristotelian or theological concepts discussed only as background;
- natural phenomena used as examples of celestial influence;
- house-by-house, planet-by-planet or sign-by-sign predictive recipes;
- one predicted event such as a type of illness, journey, enemy, spouse, profession or death;
- catalogue entries whose only content is an attributed effect;
- editorial labels invented to summarize a paragraph when the source itself supplies no stable concept.

A source-specific historical term may still pass even if it is rare, provided the source actually defines or structurally explains it.

## Entry type

During revision, `terms.entry_type` records the role of a surviving entry:

- `technical` — astrological doctrine, configuration, classification or technique;
- `astronomical` — supporting astronomical vocabulary necessary for reading astrological texts;
- `contextual` — a named historical concept useful for understanding an astrologer’s theoretical framework but not itself a normal working term of astrology.

Entry type is not a quality score. A contextual entry can be perfectly defined, while a technical entry can still have a bad definition.

## Evidence threshold

A source mention is **not automatically an interpretation** and is never enough by itself to justify a public lexicon entry.

For each author/source occurrence, classify the evidence before storing it:

- **A — definition-level** — the source states what the concept is, gives a recognition rule, calculation, structural criterion, or an explanation detailed enough to distinguish it from neighbouring concepts;
- **B — substantial explanation** — the source may not give a dictionary-style definition, but explains the concept, its mechanism, subtypes, conditions, historical variant, disagreement or example well enough to add useful source-specific knowledge;
- **C — mention/context only** — the source names the concept, lists it, attributes effects to it, or uses it without explaining what it is.

Only A and B belong in `interpretations`.

**C-level evidence should be deleted or skipped.** It may remain discoverable in the private full-text/search corpus, but it should not become a source interpretation, should not weaken an existing definition, and should not create a new canonical term merely because the phrase occurs.

If a later source provides a complete definition of a concept that an earlier author merely mentioned, use the later source for the definition and **do not preserve the earlier vague occurrence as a pseudo-definition**. If the earlier occurrence has already been promoted into the database and adds no independent doctrine, delete it.

Likewise, when a strong canonical definition or strong source interpretation already exists, encountering a weaker, vaguer occurrence in another author does **not** require another interpretation. Skip it unless the passage contributes something distinct: a variant rule, historical attribution, disagreement, terminology, exception, subtype, example, or other information worth preserving.

The lexicon is not intended to prove that every author used every term. It is intended to explain concepts from the best available evidence while preserving meaningful differences between sources.

## Source discipline

Definitions are source-based. Do not silently supply a textbook definition from another author or from general astrological knowledge.

If the current source does not define or substantially explain a term, the default action is now **skip**, not “write a provisional vague definition.” A provisional entry is justified only when the source itself provides enough structure to be useful but one technical boundary remains unresolved.

For example, a term repeatedly associated with a solar phase but never itself defined should not be turned into an encyclopedia entry from that source. It can be revisited when another source actually explains it.

## Canonical definition versus source interpretations

The canonical `short_definition` should be based on the strongest evidence currently available in the database. It should not be diluted into the lowest common denominator merely because another author uses the same word vaguely.

The canonical definition should contain only the shared identity of the concept when sources genuinely differ. Numerical thresholds, reception requirements, sect conditions, timing conventions and similar author-specific details belong in source interpretations unless they are stable across the corpus.

Source-specific `interpretations` exist to preserve genuinely informative differences between authors. Add one only when the source contributes substantive knowledge.

As the corpus grows:

- a later, clearer source may improve the canonical definition;
- an earlier strong source interpretation remains if it independently explains the concept;
- an earlier weak or mention-only interpretation should be deleted rather than retained for completeness;
- a new vague mention is skipped when a good definition already exists;
- disagreement is preserved when it is doctrinally real, not manufactured from differences in level of detail.

## Definition versus effect

A frequent extraction error is to define a configuration by what an author says it predicts.

Bad pattern:

> Head of the Dragon — a point that brings good fortune, leadership and increase.

That describes attributed effects, not identity.

Better:

> Head of the Dragon / Ascending Node — the lunar node at which the Moon crosses the ecliptic from south to north.

The author’s benefic, malefic or topical judgments can then be stated in the source interpretation.

The same rule applies to houses, lots, directions, fixed stars, aspects and degree classes. First identify the thing. Then describe what a source does with it.

## Historical disagreement

Do not flatten disagreements between authors, manuscripts, translations, or technical systems into one universal definition.

The canonical `short_definition` should define the concept at the level securely supported by the strongest evidence currently in the database. Source-specific explanations belong in `interpretations`. When only one author has been processed, it is acceptable for the short definition to be explicitly source-specific.

A disagreement is worth preserving when the difference changes recognition or use of the concept: for example, a different numerical solar threshold, a different reception requirement, a different terms system, or a different relationship between two named techniques.

Differences that merely reflect one author being more verbose than another are not disagreements.

## Synonyms, aliases and near-equivalents

Merge two labels only when the evidence supports identity of the underlying concept.

Use an alias when:

- the same author or tradition explicitly gives two names for the same thing;
- a translation variant clearly names the same rule;
- historical spelling differs without doctrinal difference.

Use a relation rather than an alias when:

- two concepts overlap but one is broader or narrower;
- later terminology resembles an earlier term but exact equivalence is uncertain;
- translators use the same English word for historically distinct source terms;
- two authors impose materially different recognition rules.

Do not maintain separate canonical entries merely because an early extraction used a vague provisional English label and a later source supplied the established technical term. Merge the provisional label into the stronger term when identity is clear.

## Quotations

Definitions should not become quote collections.

The default is paraphrase plus citation. Add a short quotation only when the exact wording materially helps establish the definition, historical terminology, translation, or disagreement.

A quotation should normally be attached to a narrowly located `source_passage`, not to a broad chapter block containing many unrelated doctrines. Never stitch non-contiguous phrases into one quote.

For copyrighted modern translations, use quotations especially sparingly. A public-domain source does not need to be quoted merely because it can be.

## Examples

Examples are useful when a configuration is hard to understand verbally.

Good:

> Giving Two Natures — An application in which the applying and receiving planets are linked by a second shared condition, either both having dignity in the same sign or both conforming to the same diurnal/nocturnal domain. Abū Maʿshar's example is Venus applying to Jupiter from Pisces, where both have dignity.

Bad:

> Giving Two Natures — A compound application involving compatible conditions.

The first tells the reader how to recognize the condition; the second merely gestures at it.

## Degree doctrines and catalogues

Some historical categories are intrinsic classifications rather than procedures. In those cases, do not invent a mechanism. Define the class, state how the source distinguishes it, and explicitly record textual uncertainty where necessary.

For example, bright/dusky/dark/empty degrees are named classes in a transmitted degree catalogue. The definition should not imply that the source derives them from a calculation if it does not.

A catalogue can justify the existence of a **class**, but normally not a separate public entry for every listed effect or degree unless those items themselves have named technical status.

## Quality scale

`terms.definition_quality` records the current canonical-definition quality:

- **5 — Publication-ready:** precise, source-grounded, operational where appropriate, clearly distinguished from neighbouring terms, and based on a concept that passes the lexicality gate.
- **4 — Strong draft:** correct and useful, but one historical qualification, cross-source boundary or example is still missing.
- **3 — Accurate but vague:** broadly right, but a reader could not reliably recognize or distinguish the concept. Keep only temporarily during active extraction if there is already enough source structure to justify the concept.
- **2 — Association rather than definition:** describes effects or context without saying what the concept is. Do not retain as a source interpretation.
- **1 — Misleading:** collapses distinct concepts, asserts unsupported equivalence, or supplies false precision. Delete or correct immediately.

The target for public entries is **4–5**. A 3 is an internal work-in-progress state, not a reason to preserve mention-only material. Levels 1–2 are not acceptable database interpretations.
