#!/usr/bin/env python3
"""Classify every reviewed/public lexicon entry for the reader-usefulness pass.

This is a planning audit, not an automatic rewrite engine. It assigns each entry:
- one primary action bucket;
- an effort estimate (S/M/L);
- one or more defect flags;
- a broad family so related entries can be edited together.

The rules deliberately favor batching and restraint: concise dictionary entries can remain
concise, while repeated family/template defects are surfaced as family work rather than
hundreds of independent rewrites.
"""

from __future__ import annotations

import argparse
import re
import sqlite3
from collections import Counter, defaultdict
from pathlib import Path

from generate_frontend_data import ROOT, build_db

DEFAULT_DB = ROOT / ".tmp/reader-usefulness-triage.sqlite"
DEFAULT_REPORT = ROOT / ".tmp/reader-usefulness-triage.md"

LEXICON_VOICE_RE = re.compile(
    r"\b(?:the corpus|source[- ]backed|source names?|source witnesses?|the project|"
    r"the encyclopedia (?:keeps|preserves|treats|records)|normalized to|canonical identity|"
    r"cross-source|reconciliation|the reviewed corpus)\b",
    re.I,
)
ONTOLOGY_RE = re.compile(
    r"\b(?:do not merge|distinct from|keep distinct|false friend|duplicate|not identical|"
    r"not equivalent|same (?:word|term|label)|different (?:use|usage|sense)|reconcil)\b",
    re.I,
)
SEQUENCE_RE = re.compile(
    r"\b(?:sequence|order|successive|periods?|years?|rulers?|division|subdivision|"
    r"terms?|bounds?|triplicity|faces?|decans?|mansions?|hours?|days?)\b",
    re.I,
)
MECHANIC_RE = re.compile(
    r"\b(?:application|separation|perfection|prohibition|frustration|refranation|refrenation|"
    r"translation|collection|abscission|intervention|evasion|return|reception)\b",
    re.I,
)

SIGN_SLUGS = {
    'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'
}
PLANET_SLUGS = {'sun','moon','mercury','venus','mars','jupiter','saturn'}
VISUAL_SLUGS = {
    'altitude','azimuth','apogee','perigee','celestial-latitude','celestial-longitude',
    'declination','right-ascension','oblique-ascension','ecliptic','celestial-equator',
    'horizon','meridian','ascending-quadrant','descending-quadrant',
    'ascending-and-descending-quadrants','application','separation','antiscia','contra-antiscia',
    'aspect','opposition','trine','square','sextile','conjunction','orientality','occidentality',
}


def scalar(con: sqlite3.Connection, sql: str, params: tuple = ()) -> int:
    row = con.execute(sql, params).fetchone()
    return int(row[0] or 0)


def text_scalar(con: sqlite3.Connection, sql: str, params: tuple = ()) -> str:
    row = con.execute(sql, params).fetchone()
    return (row[0] or '') if row else ''


def infer_family(slug: str, label: str, category: str, text: str) -> str:
    s = slug.casefold()
    c = category.casefold()
    blob = f"{label} {category} {text}".casefold()
    if s in SIGN_SLUGS:
        return 'zodiac signs'
    if s in PLANET_SLUGS:
        return 'planets'
    if 'house' in c or 'place' in c or re.search(r"\b(?:first|second|third|fourth|fifth|sixth|seventh|eighth|ninth|tenth|eleventh|twelfth) (?:house|place)\b", blob):
        return 'houses / places'
    if any(x in c for x in ('dignity','debility')) or any(x in blob for x in ('domicile','exaltation','triplicity','term / bound','face / decan','detriment','fall')):
        return 'dignities / debilities'
    if MECHANIC_RE.search(blob):
        return 'perfection / connection mechanics'
    if 'lot' in c or 'part of ' in blob or s.startswith('lot-') or s.endswith('-lot'):
        return 'lots / parts'
    if any(x in blob for x in ('firdar','firdaria','alfridary','profection','direction','revolution','time lord','time-lord','planetary years')):
        return 'timing / predictive techniques'
    if any(x in blob for x in ('decan','dodecat','twelfth','ninth','nawbahr','darijan','subdivision')):
        return 'zodiac subdivisions'
    if any(x in c for x in ('astronom','celestial coordinate','geometry')) or s in VISUAL_SLUGS:
        return 'astronomy / geometry'
    if 'sign classification' in c or any(x in blob for x in ('fertile sign','barren sign','mute sign','voice sign','bestial sign','human sign','masculine sign','feminine sign')):
        return 'sign qualities / classifications'
    if 'astrology' in c and 'branch' in blob:
        return 'branches / taxonomy'
    return 'other'


def load_rows(con: sqlite3.Connection) -> list[dict]:
    out: list[dict] = []
    for t in con.execute(
        """SELECT id,slug,label,short_definition,category,entry_type,definition_quality,editorial_notes
           FROM terms
           WHERE status IN ('reviewed','published')
           ORDER BY label COLLATE NOCASE"""
    ):
        term_id, slug, label, definition, category, entry_type, quality, notes = t
        intro = text_scalar(con, "SELECT intro FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        section_text = text_scalar(con, "SELECT COALESCE(group_concat(heading || ' ' || body, ' '),'') FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        public_text = ' '.join(x for x in (definition or '', intro, section_text) if x)
        sections = scalar(con, "SELECT COUNT(*) FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        tables = scalar(con, "SELECT COUNT(*) FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        interpretations = scalar(con, "SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        works = scalar(con, "SELECT COUNT(DISTINCT work_id) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')", (term_id,))
        grade_a = scalar(con, "SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published') AND evidence_grade='A'", (term_id,))
        aliases = scalar(con, "SELECT COUNT(*) FROM aliases WHERE term_id=?", (term_id,))
        relations = scalar(con, "SELECT COUNT(*) FROM term_relations WHERE status IN ('reviewed','published') AND (subject_term_id=? OR object_term_id=?)", (term_id, term_id))
        family = infer_family(slug, label, category or '', public_text)
        out.append({'id': term_id, 'slug': slug, 'label': label, 'definition': definition or '', 'category': category or '', 'entry_type': entry_type or '', 'quality': int(quality or 0), 'notes': notes or '', 'intro': intro, 'public_text': public_text, 'sections': sections, 'tables': tables, 'blocks': sections + tables, 'interpretations': interpretations, 'works': works, 'grade_a': grade_a, 'aliases': aliases, 'relations': relations, 'family': family})
    return out


def classify(r: dict) -> dict:
    flags: list[str] = []
    blob = f"{r['public_text']} {r['notes']}"
    has_article = bool(r['intro'])
    ontology = bool(ONTOLOGY_RE.search(r['notes']))
    lexicon_voice = bool(LEXICON_VOICE_RE.search(r['public_text']))
    visual = r['slug'] in VISUAL_SLUGS or (r['family'] == 'astronomy / geometry' and r['relations'] >= 1)
    sequence = bool(SEQUENCE_RE.search(blob))
    if lexicon_voice: flags.append('lexicon-voice')
    if ontology: flags.append('ontology')
    if visual: flags.append('visual')
    if sequence and r['tables'] == 0 and r['family'] in {'timing / predictive techniques','zodiac subdivisions','dignities / debilities'}: flags.append('structure')
    if r['quality'] <= 3: flags.append('definition')
    if not has_article and (r['interpretations'] >= 2 or r['relations'] >= 5 or r['grade_a'] >= 2): flags.append('depth')
    if has_article and r['blocks'] <= 1 and (r['interpretations'] >= 3 or r['relations'] >= 5): flags.append('depth')
    if r['family'] in {'zodiac signs','planets','houses / places','sign qualities / classifications'}: flags.append('family')
    if r['family'] == 'zodiac signs': flags.extend(['priority','coverage'])
    if MECHANIC_RE.search(blob) and has_article and r['blocks'] < 2: flags.append('example')
    flags = list(dict.fromkeys(flags))
    if r['family'] in {'zodiac signs','planets','houses / places','sign qualities / classifications'}:
        action = 'family-fix'
    elif ontology and (not has_article or lexicon_voice or r['quality'] <= 3):
        action = 'ontology-review'
    elif visual and (not has_article or r['blocks'] <= 1):
        action = 'visual / explanation'
    elif 'structure' in flags:
        action = 'structure / table'
    elif 'depth' in flags or 'definition' in flags:
        action = 'needs-expansion'
    elif lexicon_voice or 'example' in flags:
        action = 'tiny-fix'
    elif not has_article and r['quality'] >= 4 and r['interpretations'] <= 1 and r['relations'] <= 3 and not ontology:
        action = 'dictionary-enough'
    else:
        action = 'ok-as-is'
    effort = 'S' if action in {'dictionary-enough','ok-as-is','tiny-fix'} else ('M' if action in {'needs-expansion','structure / table','family-fix'} else 'L')
    if action == 'family-fix' and r['family'] in {'zodiac signs','planets','houses / places'}: effort = 'L'
    if action == 'visual / explanation': effort = 'L'
    r = dict(r); r.update(action=action, effort=effort, flags=flags); return r


def render(rows: list[dict]) -> str:
    action_counts = Counter(r['action'] for r in rows); effort_counts = Counter(r['effort'] for r in rows); family_counts = Counter(r['family'] for r in rows)
    lines = ['# Reader-usefulness corpus inventory','', 'Generated from the canonical SQLite build. This is a planning classification, not a quality score or an instruction to rewrite every flagged entry.','', '## Summary','']
    for action in ('ok-as-is','dictionary-enough','tiny-fix','needs-expansion','structure / table','family-fix','ontology-review','visual / explanation'): lines.append(f"- **{action}:** {action_counts[action]}")
    lines += ['', f"- **S effort:** {effort_counts['S']}", f"- **M effort:** {effort_counts['M']}", f"- **L effort:** {effort_counts['L']}", f"- **Total:** {len(rows)}", '', '## Families', '']
    for family, count in sorted(family_counts.items(), key=lambda x: (-x[1], x[0])): lines.append(f"- **{family}:** {count}")
    for action in ('family-fix','ontology-review','visual / explanation','structure / table','needs-expansion','tiny-fix','ok-as-is','dictionary-enough'):
        group = [r for r in rows if r['action'] == action]; lines += ['', f"## {action} ({len(group)})", '']; by_family: dict[str, list[dict]] = defaultdict(list)
        for r in group: by_family[r['family']].append(r)
        for family in sorted(by_family):
            lines += [f"### {family}",'']
            for r in sorted(by_family[family], key=lambda x: x['label'].casefold()):
                flags = ', '.join(r['flags']) if r['flags'] else 'none'; lines.append(f"- **{r['label']}** (`{r['slug']}`) — effort **{r['effort']}**; flags: {flags}; evidence {r['interpretations']}/{r['works']} works; blocks {r['blocks']}; relations {r['relations']}.")
            lines.append('')
    return '\n'.join(lines)


def main() -> None:
    parser = argparse.ArgumentParser(); parser.add_argument('--db', type=Path, default=DEFAULT_DB); parser.add_argument('--report', type=Path, default=DEFAULT_REPORT); args = parser.parse_args()
    args.db.parent.mkdir(parents=True, exist_ok=True); args.report.parent.mkdir(parents=True, exist_ok=True); build_db(args.db); con = sqlite3.connect(args.db)
    try: rows = [classify(r) for r in load_rows(con)]
    finally: con.close()
    args.report.write_text(render(rows), encoding='utf-8'); actions = Counter(r['action'] for r in rows); efforts = Counter(r['effort'] for r in rows)
    print('READER TRIAGE|' + '|'.join([f"total={len(rows)}", *[f"{k}={actions[k]}" for k in ('ok-as-is','dictionary-enough','tiny-fix','needs-expansion','structure / table','family-fix','ontology-review','visual / explanation')], f"S={efforts['S']}", f"M={efforts['M']}", f"L={efforts['L']}" ]))
    print('READER TRIAGE FAMILIES')
    for family, count in sorted(Counter(r['family'] for r in rows).items(), key=lambda x: (-x[1], x[0])): print(f"FAMILY|{family}|{count}")
    print('READER TRIAGE ACTION LIST')
    for r in sorted(rows, key=lambda x: (x['action'], x['family'], x['label'].casefold())): print(f"ENTRY|{r['action']}|{r['effort']}|{r['family']}|{r['slug']}|{r['label']}|{','.join(r['flags'])}")
    print(f"Report: {args.report}")

if __name__ == '__main__': main()
