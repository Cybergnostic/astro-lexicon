#!/usr/bin/env bash
set -euo pipefail

# Build the entire lexicon database from scratch, print the editorial audit,
# and fail if any blocking integrity/editorial check is non-zero.
# This is the canonical pre-publication database gate for the growing corpus.
# Usage:
#   ./scripts/audit_corpus.sh
#   ./scripts/audit_corpus.sh /tmp/astro-lexicon-audit.sqlite

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DB_PATH="${1:-$ROOT_DIR/.tmp/astro-lexicon-audit.sqlite}"

if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "error: sqlite3 is required" >&2
  exit 127
fi

mkdir -p "$(dirname "$DB_PATH")"
rm -f "$DB_PATH"

sqlite() {
  sqlite3 -bail -cmd 'PRAGMA foreign_keys = ON;' "$@"
}

apply_dir() {
  local dir="$1"
  local kind="$2"
  local file

  shopt -s nullglob
  local files=("$dir"/*.sql)
  shopt -u nullglob

  if ((${#files[@]} == 0)); then
    echo "error: no $kind SQL files found in $dir" >&2
    exit 1
  fi

  for file in "${files[@]}"; do
    echo "[$kind] $(basename "$file")"
    if ! sqlite "$DB_PATH" < "$file"; then
      echo "error: failed while applying $file" >&2
      exit 1
    fi
  done
}

apply_dir "$ROOT_DIR/db/migrations" "migration"
apply_dir "$ROOT_DIR/db/seed" "seed"

echo
echo "Database built successfully: $DB_PATH"
echo "Running editorial audit..."
echo

# These SQL filenames predate the generalized audit entrypoint; their queries are
# corpus-wide and contain no fixed five-source counts.
sqlite "$DB_PATH" < "$ROOT_DIR/db/audit/initial_corpus_review.sql"

echo
echo "=== BLOCKING INTEGRITY / EDITORIAL CHECKS ==="

failed=0

integrity_result="$(sqlite -noheader "$DB_PATH" 'PRAGMA integrity_check;')"
if [[ "$integrity_result" == "ok" ]]; then
  echo "PASS sqlite_integrity_check"
else
  echo "FAIL sqlite_integrity_check: $integrity_result" >&2
  failed=1
fi

foreign_key_details="$(sqlite -noheader -separator '|' "$DB_PATH" 'PRAGMA foreign_key_check;')"
if [[ -z "$foreign_key_details" ]]; then
  echo "PASS foreign_key_check"
else
  foreign_key_issues="$(printf '%s\n' "$foreign_key_details" | sed '/^$/d' | wc -l | tr -d ' ')"
  echo "FAIL foreign_key_check: $foreign_key_issues issue(s)" >&2
  printf '%s\n' "$foreign_key_details" | sed 's/^/  /' >&2
  failed=1
fi

while IFS='|' read -r check_name issue_count; do
  [[ -z "$check_name" ]] && continue
  if [[ "$issue_count" == "0" ]]; then
    echo "PASS $check_name"
  else
    echo "FAIL $check_name: $issue_count issue(s)" >&2
    failed=1
  fi
done < <(
  sqlite -noheader -separator '|' "$DB_PATH" \
    < "$ROOT_DIR/db/audit/initial_corpus_blockers.sql"
)

if ((failed)); then
  echo >&2
  echo "Corpus audit failed. Review the detailed audit output above." >&2
  exit 1
fi

echo
echo "Corpus audit passed: fresh migrations, full seed chain, integrity checks, and blocking editorial checks are clean."
