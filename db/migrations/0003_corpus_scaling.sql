-- Corpus lifecycle metadata for scaling beyond the initial fully indexed works.
-- A work may be present in the bibliography before extraction is complete.

ALTER TABLE works
  ADD COLUMN corpus_status TEXT NOT NULL DEFAULT 'indexed'
  CHECK(corpus_status IN ('indexed','partial','bibliographic'));

CREATE INDEX idx_works_corpus_status ON works(corpus_status);
