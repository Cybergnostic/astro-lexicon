-- Editorial Baseline v1: remove unsourced/provisional Lot headwords from the reviewed
-- canonical corpus.
--
-- `lot-of-fame`, `lot-of-reputation`, and `lot-of-exaltation` were explicitly retained by
-- an earlier reconciliation only as editorial navigation labels after direct Abū Maʿshar
-- review found no matching source identities. `lot-of-divorce` remains a curriculum-only
-- formula candidate with no reviewed historical interpretation. None should masquerade as
-- a publication-ready historical headword.
--
-- If a later direct source establishes any of these identities, reintroduce it from that
-- evidence with a source-specific definition/formula rather than reviving the placeholder.

PRAGMA foreign_keys = ON;

DELETE FROM terms
WHERE slug IN (
  'lot-of-fame',
  'lot-of-reputation',
  'lot-of-exaltation',
  'lot-of-divorce'
);
