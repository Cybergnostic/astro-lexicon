-- Editorial-review metadata added after completion of the initial five-source extraction.
-- These fields separate lexical inclusion from evidence quality without changing the historical seed record.

ALTER TABLE terms ADD COLUMN entry_type TEXT NOT NULL DEFAULT 'technical';
ALTER TABLE terms ADD COLUMN definition_quality INTEGER;

ALTER TABLE interpretations ADD COLUMN evidence_grade TEXT;

-- Editorial conventions (enforced by review rather than CHECK constraints for migration compatibility):
-- terms.entry_type: technical | astronomical | contextual
-- terms.definition_quality: 1-5, following docs/definition-standard.md
-- interpretations.evidence_grade: A | B
-- C-level/mention-only occurrences are deleted rather than retained as interpretations.
