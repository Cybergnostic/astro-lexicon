# Definition standard

This document sets the editorial standard for public lexicon definitions.

## Goal

A definition should answer **what the concept is**, not merely what it is associated with. It should be useful to a reader who encounters the term without already knowing the doctrine.

A strong short definition normally contains three things:

1. **Genus** — what kind of thing it is: aspect, dignity, sign classification, predictive technique, calculated point, planetary condition, etc.
2. **Mechanism or criterion** — what configuration, rule, calculation, or distinction makes the thing what it is.
3. **Boundary from neighbouring concepts** — enough information to prevent an easy confusion with a related term.

Where a compact example materially clarifies the rule, include one. Examples should illustrate the source doctrine rather than introduce modern rules not present in the source.

## Evidence threshold

A source mention is **not automatically an interpretation** and is never enough by itself to justify a public lexicon entry.

For each author/source occurrence, classify the evidence before storing it:

- **definition-level** — the source states what the concept is, gives a recognition rule, calculation, structural criterion, or an explanation detailed enough to distinguish it from neighbouring concepts;
- **substantial explanation** — the source may not give a dictionary-style definition, but explains the concept, its mechanism, subtypes, conditions, or an example well enough to add useful source-specific knowledge;
- **mention/context only** — the source names the concept, lists it, attributes effects to it, or uses it without explaining what it is.

Only the first two levels should normally become `interpretations`.

**Mention/context-only evidence should be skipped.** It may remain discoverable in the private full-text/search corpus, but it should not become a source interpretation, should not weaken an existing definition, and should not create a new canonical term merely because the phrase occurs.

If a later source provides a complete definition of a concept that an earlier author merely mentioned, use the later source for the definition and **do not preserve the earlier vague occurrence as a pseudo-definition**. If the earlier occurrence has already been promoted into the database and adds no independent doctrine, delete it.

Likewise, when a strong canonical definition or strong source interpretation already exists, encountering a weaker, vaguer occurrence in another author does **not** require another interpretation. Skip it unless the weaker passage contributes something distinct: a variant rule, historical attribution, disagreement, terminology, exception, subtype, example, or other information worth preserving.

The lexicon is not intended to prove that every author used every term. It is intended to explain concepts from the best available evidence while preserving meaningful differences between sources.

## Source discipline

Definitions are source-based. Do not silently supply a textbook definition from another author or from general astrological knowledge.

If the current source does not define or substantially explain a term, the default action is now **skip**, not “write a provisional vague definition.” A provisional entry is justified only when the source itself provides enough structure to be useful but one technical boundary remains unresolved.

For example, a term repeatedly associated with a solar phase but never itself defined should not be turned into an encyclopedia entry from that source. It can be revisited when another source actually explains it.

## Canonical definition versus source interpretations

The canonical `short_definition` should be based on the strongest evidence currently available in the database. It should not be diluted into the lowest common denominator merely because another author uses the same word vaguely.

Source-specific `interpretations` exist to preserve genuinely informative differences between authors. Add one only when the source contributes substantive knowledge.

As the corpus grows:

- a later, clearer source may improve the canonical definition;
- an earlier strong source interpretation remains if it independently explains the concept;
- an earlier weak or mention-only interpretation should be deleted rather than retained for completeness;
- a new vague mention is skipped when a good definition already exists;
- disagreement is preserved when it is doctrinally real, not manufactured from differences in level of detail.

## Historical disagreement

Do not flatten disagreements between authors, manuscripts, translations, or technical systems into one universal definition.

The canonical `short_definition` should define the concept at the level securely supported by the strongest evidence currently in the database. Source-specific explanations belong in `interpretations`. When only one author has been processed, it is acceptable for the short definition to be explicitly source-specific.

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

## Quality scale

- **5 — Publication-ready:** precise, source-grounded, operational where appropriate, and clearly distinguished from neighbouring terms.
- **4 — Strong draft:** correct and useful, but one historical qualification or example is still missing.
- **3 — Accurate but vague:** broadly right, but a reader could not reliably recognize or distinguish the concept. Keep only temporarily during active extraction if there is already enough source structure to justify the concept.
- **2 — Association rather than definition:** describes effects or context without saying what the concept is. Do not retain as a source interpretation.
- **1 — Misleading:** collapses distinct concepts, asserts unsupported equivalence, or supplies false precision. Delete or correct immediately.

The target for public entries is **4–5**. A 3 is an internal work-in-progress state, not a reason to preserve mention-only material. Levels 1–2 are not acceptable database interpretations.