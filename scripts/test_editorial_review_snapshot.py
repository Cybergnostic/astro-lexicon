#!/usr/bin/env python3
"""Smoke checks against the fresh, source-derived editorial comparison snapshot."""
from __future__ import annotations

import json
from pathlib import Path

from build_editorial_review_snapshot import ROOT, OUT

data = json.loads(OUT.read_text(encoding="utf-8"))
assert data["version"] == 1
assert [len(group["slugs"]) for group in data["groups"]] == [10,20,40,40,40,40,40,40,40,40,40]
assert len(data["entries"]) == 388, "390 cohort references share Fortune and Evasion"
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

horary = data["groups"][3]["slugs"]
assert len(horary) == 40
revised = [slug for slug in horary if data["entries"][slug]["changes"]]
assert len(revised) == 15, f"Expected 15 genuine horary editorial revisions, got {revised}"
assert any("Lilly" in witness["author"] for witness in data["entries"]["frustration"]["witnesses"])
dignities = data["groups"][4]["slugs"]
assert len(dignities) == 40
revised_dignities = [slug for slug in dignities if data["entries"][slug]["changes"]]
assert len(revised_dignities) == 13, f"Expected 13 real dignity editorial revisions, got {revised_dignities}"
assert data["entries"]["exaltation"]["before"]["sections"] != data["entries"]["exaltation"]["proposed"]["sections"]
assert any("al" in w["author"].lower() or "biruni" in w["author"].lower() for w in data["entries"]["triplicity-rulers"]["witnesses"])
astronomy = data["groups"][5]["slugs"]
assert len(astronomy) == 40
revised_astronomy = [slug for slug in astronomy if data["entries"][slug]["changes"]]
assert len(revised_astronomy) == 22, f"Expected 22 real astronomy editorial revisions, got {revised_astronomy}"
assert data["entries"]["equant"]["before"]["sections"] != data["entries"]["equant"]["proposed"]["sections"]
assert any("Bīrūnī" in w["author"] or "Biruni" in w["author"] for w in data["entries"]["solar-eclipse"]["witnesses"])
core = data["groups"][6]["slugs"]
assert len(core) == 40
revised_core = [slug for slug in core if data["entries"][slug]["changes"]]
assert len(revised_core) == 18, f"Expected 18 genuine core-term revisions: {revised_core}"
assert any(c["kind"] == "definition" for c in data["entries"]["mercury"]["changes"])
assert data["entries"]["element-air"]["before"]["intro"] != data["entries"]["element-air"]["proposed"]["intro"]
assert data["entries"]["aries"]["changes"] == [], "Sign entries with sound classifications should not be homogenized"
signs = data["groups"][7]["slugs"]
assert len(signs) == 40
revised_signs = [slug for slug in signs if data["entries"][slug]["changes"]]
assert len(revised_signs) == 22, f"Expected 22 genuinely revised sign/headword entries: {revised_signs}"
assert any("Bīrūnī" in w["author"] or "Biruni" in w["author"] for w in data["entries"]["natural-sextile"]["witnesses"])
assert data["entries"]["natural-sextile"]["before"]["intro"] != data["entries"]["natural-sextile"]["proposed"]["intro"]
assert data["entries"]["dry-lunar-mansion"]["changes"] == [], "Specialized mansion table should not be mechanically rewritten"
conditions = data["groups"][8]["slugs"]
assert len(conditions) == 40
changed_conditions = [slug for slug in conditions if data["entries"][slug]["changes"]]
assert len(changed_conditions) == 16, f"Batch 09 must show 16 real changes, got {changed_conditions}"
assert any(c["kind"] == "definition" for c in data["entries"]["quincunx"]["changes"])
assert any(c["kind"] == "section" for c in data["entries"]["cazimi"]["changes"])
assert any("Lilly" in w["author"] for w in data["entries"]["sesquiquadrate"]["witnesses"])
assert data["entries"]["dustoria"]["changes"] == [], "Unverified specialist term should remain unchanged"
lots10 = data["groups"][9]["slugs"]
assert len(lots10) == 40
revised_lots10 = [slug for slug in lots10 if data["entries"][slug]["changes"]]
assert len(revised_lots10) == 19, f"Expected 19 real Lots edits, got {revised_lots10}"
assert any("Abū Maʿshar" in w["author"] or "Mashar" in w["work"] for w in data["entries"]["lot-of-enemies-hermes"]["witnesses"])
assert any(c["kind"] == "section" for c in data["entries"]["lot-of-enemies-hermes"]["changes"])
assert data["entries"]["lot-of-imprisonment"]["changes"] == [], "Do not rewrite an already precise source name"
assert sum(bool(entry["changes"]) for entry in data["entries"].values()) >= 164
print("Editorial review snapshot OK:",
      len(data["entries"]), "unique headwords;",
      sum(bool(entry["changes"]) for entry in data["entries"].values()),
      "with real before/after differences")
