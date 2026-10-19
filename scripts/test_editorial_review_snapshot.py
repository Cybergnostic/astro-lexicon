#!/usr/bin/env python3
"""Smoke checks against the fresh, source-derived editorial comparison snapshot."""
from __future__ import annotations

import json
from pathlib import Path

from build_editorial_review_snapshot import ROOT, OUT

data = json.loads(OUT.read_text(encoding="utf-8"))
assert data["version"] == 1
assert [len(group["slugs"]) for group in data["groups"]] == [10,20,40,40]
assert len(data["entries"]) == 108, "110 cohort references share Fortune and Evasion"
assert all(entry["before"]["definition"] is not None for entry in data["entries"].values())
assert all(entry["proposed"]["definition"] for entry in data["entries"].values())

lot = data["entries"]["lot"]
assert len(lot["changes"]) >= 3, "General Lot must expose changed actual prose"
assert any(change["kind"] == "section" for change in lot["changes"])
saturn = data["entries"]["saturn"]
assert any(change["kind"] == "definition" for change in saturn["changes"])
assert "diurnal" in saturn["proposed"]["definition"].lower()
assert saturn["before"]["definition"] != saturn["proposed"]["definition"]
unchanged = data["entries"]["general-indicators-of-a-lot"]
assert unchanged["changes"] == [], "Control term was never edited"

sons = data["entries"]["lot-of-sons"]
assert any(change["kind"] == "section" for change in sons["changes"])
assert any("Abū Maʿshar" in entry["author"] or "Abu" in entry["author"]
           for entry in sons["witnesses"]), "New source witnesses must be exported"

foundations = data["groups"][2]["slugs"]
assert len(foundations) == 40
proposed_changes = [slug for slug in foundations if data["entries"][slug]["changes"]]
assert len(proposed_changes) == 17, f"Expected 17 distinct editorial revisions, got {proposed_changes}"
assert data["entries"]["medical-astrology"]["before"]["intro"] != data["entries"]["medical-astrology"]["proposed"]["intro"]
assert data["entries"]["ninth-nawbahr"]["changes"] == [], "Specialist source pending headword should not be rewritten prematurely"

assert sum(bool(entry["changes"]) for entry in data["entries"].values()) >= 40
print("Editorial review snapshot OK:",
      len(data["entries"]), "unique headwords;",
      sum(bool(entry["changes"]) for entry in data["entries"].values()),
      "with real before/after differences")
