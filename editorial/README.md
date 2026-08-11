# Local Editorial Review Workbench

This directory is deliberately separate from the public Astro frontend.

The public lexicon remains available through the normal development command:

```bash
npm run dev
```

The editorial workbench runs independently:

```bash
npm run review
```

By default:

- public Astro preview: `http://127.0.0.1:4321`
- editorial workbench: `http://127.0.0.1:4322`

For the side-by-side view, run the two commands in separate terminals. The editor embeds the normal public term page in an iframe; it does not modify or decorate the public page.

## What is saved

`editorial/reviews.json` is the canonical review backlog. It stores:

- per-entry review status (`unreviewed`, `reviewed`, `needs-work`)
- each suggestion/comment
- the term slug
- the page section or feature the suggestion targets
- suggestion type (`content`, `structure`, `visual`, `source`, `frontend`, `image`, `other`)
- creation and resolution timestamps
- image-attachment metadata

Resolved suggestions are retained rather than deleted so the editorial history is preserved.

Candidate pictures are copied to:

```text
editorial/review-assets/<term-slug>/
```

PNG, JPEG and WebP files up to 12 MB are accepted. The JSON stores the repository-relative path and the original filename, so an image suggestion remains tied to the relevant comment.

## Git workflow

The editor writes ordinary project files. After a review session, inspect and commit:

```bash
git status
git add editorial/reviews.json editorial/review-assets/
git commit -m "record editorial review notes"
git push
```

Once those files are on GitHub, an assistant working with the repository can read `editorial/reviews.json`, group the open suggestions into coherent implementation batches, inspect the attached assets, make the requested changes, and preserve the review history while marking completed notes resolved.

## Design rule

The editorial workbench is local review tooling only. Nothing under `editorial/` is imported by the public Astro pages, and `npm run build` does not include the review UI or review data in the public site.
