#!/usr/bin/env bash
set -euo pipefail

# Build the entire lexicon database from scratch and run the read-only initial-corpus audit.
# Usage:
#   ./scripts/audit_initial_corpus.sh
#   ./scripts/audit_initial_corpus.sh /tmp/astro-lexicon-audit.sqlite

ROOT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")/.." && pwd)"
DB_PATH="${1:-$ROOT_DIR/.tmp/astro-lexicon-audit.sqlite}"

if ! command -v sqlite3 >/dev/null 2>&1; then
  echo "error: sqlite3 is required" >&2
  exit 127
fi

mkdir -p "$(dirname "$DB_PATH")"
rm -f "$DB_PATH"

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
    if ! sqlite3 -bail "$DB_PATH" < "$file"; then
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

sqlite3 -bail "$DB_PATH" < "$ROOT_DIR/db/audit/initial_corpus_review.sql"
