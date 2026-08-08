# Frontend generation

The public Astro site is generated from the reviewed SQLite corpus rather than from a hand-maintained preview dataset.

## Local development

```bash
npm install
npm run dev
```

`predev` runs `scripts/generate_frontend_data.py`, which rebuilds a temporary SQLite database from `db/migrations/` and `db/seed/`, checks SQLite integrity and foreign keys, then writes `src/data/generated/corpus.json`.

The generated JSON is ignored by Git. SQL migrations and seeds remain the canonical source of truth.

## Production build

```bash
npm run build
```

`prebuild` regenerates the same canonical frontend dataset before Astro performs static generation.

## Public data policy

The export includes reviewed canonical definitions, aliases, author/work metadata, source locators, evidence grades and reviewed term relations. Source quotations are intentionally not exported to the public frontend dataset.
