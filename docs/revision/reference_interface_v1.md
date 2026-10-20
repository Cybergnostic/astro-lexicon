# Astro Lexicon — Reference-first interface v2

Status: **Complete implementation for browser review; unmerged PR #55**.

## Design objective

Treat the site as a dictionary and scholarly source reference, not a marketing homepage, magazine or data-extraction dashboard. The index must be the primary interaction on both the landing page and the A–Z route.

## Implemented

- New navy / blue-gray / copper reference identity, large typographic hierarchy, Source Serif / Newsreader / DM Sans system, visible source-first navigation, accessible skip link.
- Homepage compact reference introduction followed by the real A–Z directory, not a featured-post collection.
- Reusable `LexiconDirectory.astro` on the homepage and `/terms/`; provides client-side full-corpus search (headword, aliases, category, definition), alphabetical letter filtering, subject filtering, contextual counts, paged reveal of 24 items, empty state, mobile subject toggle, direct-link URL filters and keyboard search shortcut (/).
- Sidebars for source authors and primary works, responsive with the main list prioritized on mobile.
- Term pages: clear category and headword, definition in a separate treatment, aliases and source-author count, cross references, restrained body typography, sticky contents rail, mobile contents nav and adjacent headword links.
- Existing generated corpus, specialized components, historical forms, source citations and SQLite seed data remain unchanged.

## Must verify before merge

1. Run `npm run audit:corpus`, `npm run test:generated`, `npm run build` (GitHub workflow also verifies build).
2. Homepage desktop + mobile: source links, layout, top nav, 24-item paging.
3. Search for `reception`, `Animodar`, `firdaria`, and an accented alias; verify case/diacritic-insensitive searches and empty state.
4. Use letter F on `/terms/`; reload and confirm URL hash restores filter. Use `?subject=predictive-techniques` and reload.
5. Verify keyboard / focuses search while not typing.
6. Examine at least one complicated reference page (Reception, a planetary article, a zodiac-sign entry), one short dictionary page, and a page with wide tables.
7. Check browser console and keyboard/tab order. Confirm GitHub Pages deployment base-path links.
8. Review UI with real screenshot and feedback; don't treat successful build as visual approval.

## Content work intentionally separate

The new entry display uses existing prose, preserving provenance. **This branch is not a lexicographic rewrite of 468 entries.** Once design is accepted, pilot an editorial pass on a set of representative headwords, remove redundant explanation and development notes, integrate precise source locators, and only then scale source onboarding. Avoid copying copyrighted modern translation prose.

## Notes

Subject membership currently uses the project's existing `browseSubjects.js` text/keyword classification. A later taxonomy pass should migrate to explicit editorial categories if collisions become visible. Search is static/browser-local, uses no API and does not send queries to a server.
