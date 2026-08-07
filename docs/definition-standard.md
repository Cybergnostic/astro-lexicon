# Definition standard

This document sets the editorial standard for public lexicon definitions.

## Goal

A definition should answer **what the concept is**, not merely what it is associated with. It should be useful to a reader who encounters the term without already knowing the doctrine.

A strong short definition normally contains three things:

1. **Genus** — what kind of thing it is: aspect, dignity, sign classification, predictive technique, calculated point, planetary condition, etc.
2. **Mechanism or criterion** — what configuration, rule, calculation, or distinction makes the thing what it is.
3. **Boundary from neighbouring concepts** — enough information to prevent an easy confusion with a related term.

Where a compact example materially clarifies the rule, include one. Examples should illustrate the source doctrine rather than introduce modern rules not present in the source.

## Source discipline

Definitions are source-based. If the current source names a term but does not define it sufficiently, the database should say that rather than silently supplying a textbook definition from elsewhere.

Use wording such as:

> A source term associated here with ...; this part of the work does not supply a complete standalone definition, so its exact technical scope remains provisional.

This is preferable to false precision.

## Historical disagreement

Do not flatten disagreements between authors, manuscripts, translations, or technical systems into one universal definition.

The canonical `short_definition` should define the concept at the level securely shared by the evidence currently in the database. Source-specific explanations belong in `interpretations`. When only one author has been processed, it is acceptable for the short definition to be explicitly source-specific.

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
- **3 — Accurate but vague:** broadly right, but a reader could not reliably recognize or distinguish the concept.
- **2 — Association rather than definition:** describes effects or context without saying what the concept is.
- **1 — Misleading:** collapses distinct concepts, asserts unsupported equivalence, or supplies false precision.

The target for public entries is **4–5**. A 3 may remain internally during extraction, but it should not be treated as publication-ready.
