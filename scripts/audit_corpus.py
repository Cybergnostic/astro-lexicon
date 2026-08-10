#!/usr/bin/env python3
"""Build and audit the canonical corpus without requiring the sqlite3 CLI."""

from __future__ import annotations

import sqlite3
import sys
from pathlib import Path

ROOT = Path(__file__).resolve().parents[1]
DEFAULT_DB = ROOT / ".tmp/astro-lexicon-audit.sqlite"


def apply_sql_chain(con: sqlite3.Connection, folder: Path, kind: str) -> None:
    files = sorted(folder.glob("*.sql"))
    if not files:
        raise RuntimeError(f"no {kind} SQL files found in {folder}")

    for path in files:
        rel = path.relative_to(ROOT)
        print(f"[{kind}] {path.name}")
        try:
            con.executescript(path.read_text(encoding="utf-8"))
            con.execute("PRAGMA foreign_keys=ON")
        except sqlite3.Error as exc:
            raise RuntimeError(f"failed while applying {rel}: {exc}") from exc


def iter_report_items(path: Path):
    """Yield SQL statements and display-only sqlite3 CLI directives.

    Audit SQL files predate the Python runner and legitimately contain sqlite3 shell
    directives such as `.headers`, `.mode`, and `.print`. Those are commands for the
    sqlite3 CLI, not SQL, so passing them to sqlite3.Connection.execute() raises
    `near ".": syntax error`.

    The Python runner ignores formatting directives and preserves `.print` text as a
    display item so the existing audit reports remain readable.
    """
    buffer: list[str] = []

    for line in path.read_text(encoding="utf-8").splitlines(keepends=True):
        stripped = line.strip()

        if stripped.startswith("."):
            if stripped.startswith(".print"):
                message = stripped[len(".print") :].strip()
                if (
                    len(message) >= 2
                    and message[0] == message[-1]
                    and message[0] in {"'", '"'}
                ):
                    message = message[1:-1]
                yield ("print", message)
            # .headers/.mode/.nullvalue/etc. affect only the sqlite3 shell UI.
            continue

        buffer.append(line)
        sql = "".join(buffer)
        if sqlite3.complete_statement(sql):
            if sql.strip():
                yield ("sql", sql)
            buffer = []

    trailing = "".join(buffer).strip()
    if trailing:
        # Comments alone are harmless; an actual incomplete SQL statement is not.
        non_comment_lines = [
            line for line in trailing.splitlines() if line.strip() and not line.lstrip().startswith("--")
        ]
        if non_comment_lines:
            raise RuntimeError(f"incomplete SQL statement in {path.relative_to(ROOT)}")


def run_report(con: sqlite3.Connection, path: Path) -> None:
    for item_type, value in iter_report_items(path):
        if item_type == "print":
            print(value)
            continue

        cursor = con.execute(value)
        if cursor.description:
            rows = cursor.fetchall()
            for row in rows:
                print("|".join("" if value is None else str(value) for value in row))


def run_blockers(con: sqlite3.Connection, path: Path) -> bool:
    failed = False
    for item_type, value in iter_report_items(path):
        if item_type != "sql":
            continue

        cursor = con.execute(value)
        if not cursor.description:
            continue
        for row in cursor.fetchall():
            if len(row) < 2:
                continue
            check_name, issue_count = str(row[0]), int(row[1])
            if issue_count == 0:
                print(f"PASS {check_name}")
            else:
                print(f"FAIL {check_name}: {issue_count} issue(s)", file=sys.stderr)
                failed = True
    return failed


def main() -> int:
    db_path = Path(sys.argv[1]) if len(sys.argv) > 1 else DEFAULT_DB
    db_path.parent.mkdir(parents=True, exist_ok=True)
    db_path.unlink(missing_ok=True)

    con = sqlite3.connect(db_path)
    try:
        con.execute("PRAGMA foreign_keys=ON")
        apply_sql_chain(con, ROOT / "db/migrations", "migration")
        apply_sql_chain(con, ROOT / "db/seed", "seed")

        print(f"\nDatabase built successfully: {db_path}")
        print("Running editorial audit...\n")

        run_report(con, ROOT / "db/audit/initial_corpus_review.sql")

        print("\n=== LOT FORMULA COVERAGE (NON-BLOCKING) ===")
        run_report(con, ROOT / "db/audit/lot_formula_coverage.sql")

        print("\n=== ARTICLE QUALITY COVERAGE (NON-BLOCKING) ===")
        run_report(con, ROOT / "db/audit/article_quality_coverage.sql")

        print("\n=== BLOCKING INTEGRITY / EDITORIAL CHECKS ===")
        failed = False

        integrity = con.execute("PRAGMA integrity_check").fetchone()[0]
        if integrity == "ok":
            print("PASS sqlite_integrity_check")
        else:
            print(f"FAIL sqlite_integrity_check: {integrity}", file=sys.stderr)
            failed = True

        fk_rows = con.execute("PRAGMA foreign_key_check").fetchall()
        if not fk_rows:
            print("PASS foreign_key_check")
        else:
            print(f"FAIL foreign_key_check: {len(fk_rows)} issue(s)", file=sys.stderr)
            for row in fk_rows[:20]:
                print("  " + "|".join(str(value) for value in row), file=sys.stderr)
            failed = True

        if run_blockers(con, ROOT / "db/audit/initial_corpus_blockers.sql"):
            failed = True

        if failed:
            print("\nCorpus audit failed. Review the detailed audit output above.", file=sys.stderr)
            return 1

        print("\nCorpus audit passed: fresh migrations, full seed chain, integrity checks, and blocking editorial checks are clean.")
        return 0
    except (sqlite3.Error, RuntimeError, ValueError) as exc:
        print(f"error: {exc}", file=sys.stderr)
        return 1
    finally:
        con.close()


if __name__ == "__main__":
    raise SystemExit(main())
