#!/usr/bin/env python3
"""Behavior tests: triage flags are candidates, human signoff is authoritative."""
from __future__ import annotations

import csv
import sqlite3
import tempfile
import unittest
from pathlib import Path

from lexicographic_triage import (
    PUBLIC_VOICE, audit_rows, archetype, load_ledger, possible_intro_overlap,
)


class LexicographicTriageTests(unittest.TestCase):
    def test_overlap_signal_does_not_require_identical_wording(self):
        definition = ("Application is the movement of a faster planet toward the "
                      "exact conjunction or aspect of another planet.")
        intro = ("In a conjunction or aspect, the movement of a faster planet "
                 "toward exact contact is called application.")
        self.assertTrue(possible_intro_overlap(definition, intro))
        self.assertFalse(possible_intro_overlap(definition, ""))

    def test_project_voice_is_narrowly_targeted(self):
        self.assertIsNotNone(PUBLIC_VOICE.search(
            "The encyclopedia preserves this separate rule for later comparison."))
        self.assertIsNone(PUBLIC_VOICE.search(
            "Lilly's rule for mutual reception differs from other accounts."))

    def test_archetype_uses_canonical_slug(self):
        self.assertEqual(archetype("fardar", "Firdaria", "Predictive", True), "technical-method")
        self.assertEqual(archetype("saturn", "Saturn", "Planet", True), "planet-sign")
        self.assertEqual(archetype("reception", "Reception", "Dignity", False), "technical-relation")

    def test_human_signoff_required_for_approval(self):
        with tempfile.TemporaryDirectory() as d:
            path = Path(d) / "ledger.csv"
            with path.open("w", newline="", encoding="utf-8") as f:
                writer = csv.DictWriter(f, fieldnames=["slug", "review_state", "reviewer_signoff"])
                writer.writeheader()
                writer.writerow({"slug": "reception", "review_state": "approved", "reviewer_signoff": ""})
            with self.assertRaisesRegex(ValueError, "human reviewer"):
                load_ledger(path)
            with path.open("w", newline="", encoding="utf-8") as f:
                writer = csv.DictWriter(f, fieldnames=["slug", "review_state", "reviewer_signoff"])
                writer.writeheader()
                writer.writerow({"slug": "reception", "review_state": "triaged", "reviewer_signoff": ""})
            self.assertEqual(load_ledger(path)["reception"]["review_state"], "triaged")

    def test_citations_flag_not_factual_verdict(self):
        con = sqlite3.connect(":memory:")
        con.executescript("""
            CREATE TABLE terms (id INTEGER PRIMARY KEY, slug TEXT, label TEXT,
                                category TEXT, short_definition TEXT, status TEXT);
            CREATE TABLE term_articles (term_id INTEGER, intro TEXT, status TEXT);
            CREATE TABLE term_article_sections (id INTEGER PRIMARY KEY, term_id INTEGER,
                 section_key TEXT, heading TEXT, body TEXT, sort_order INTEGER, status TEXT);
            CREATE TABLE term_article_tables (term_id INTEGER, status TEXT);
            CREATE TABLE interpretations (id INTEGER PRIMARY KEY, term_id INTEGER, work_id INTEGER, status TEXT);
            CREATE TABLE citations (interpretation_id INTEGER, source_passage_id INTEGER);
            CREATE TABLE source_passages (id INTEGER PRIMARY KEY);
            INSERT INTO terms VALUES (1,'test-concept','Test Concept','Technical',
                 'The relation of planets that produces a particular phenomenon.','reviewed');
            INSERT INTO term_articles VALUES(1,'This encyclopedia preserves the concept.','reviewed');
            INSERT INTO interpretations VALUES(1,1,7,'reviewed');
        """)
        record = audit_rows(con, {})[0]
        self.assertEqual(record["review_state"], "unreviewed")
        self.assertIn("project-voice", record["flags"])
        self.assertIn("unlocated-witness", record["flags"])
        self.assertNotIn(record["review_state"], ("approved", "no-change-justified"))
        con.close()


if __name__ == "__main__":
    unittest.main()
