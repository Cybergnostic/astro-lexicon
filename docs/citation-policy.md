# Citation Policy

## Principle

A reader should be able to trace every important encyclopedia statement back to a specific textual source and edition.

## Bibliographic identity

Keep these separate:
- author;
- work;
- edition;
- translator;
- editor;
- publication details.

A page number without an edition is not a sufficient citation.

## Preferred locator

Where available, store both:
- structural locator: book / tractate / chapter / section / proposition;
- edition locator: printed page number.

This makes references durable across different editions.

Example internal citation record:

```json
{
  "author": "William Lilly",
  "work": "Christian Astrology",
  "edition": "1647 text / identified digital retype",
  "book": "I",
  "chapter": "...",
  "page": 112,
  "locator_text": "..."
}
```

## Quotation policy

Quotations should be:
- brief;
- necessary to establish wording or terminology;
- clearly attributed;
- tied to an exact source locator.

The default encyclopedia pattern is:

1. original summary;
2. source reference;
3. short quotation only where useful.

## Translation notes

When terminology depends on translation, record:
- translated term;
- original-language term if available and verified;
- translator;
- editorial note explaining uncertainty or alternatives.

Never invent an original-language equivalent from memory.

## Citation confidence

Suggested values:
- `direct` — source explicitly states the claim;
- `close_paraphrase` — claim is a conservative paraphrase of the source;
- `editorial_inference` — interpretation derived from multiple passages or context;
- `secondary` — claim comes from editor/translator/scholar rather than the primary author.

Published entries should visibly distinguish inference and secondary interpretation from direct textual evidence when the distinction matters.
