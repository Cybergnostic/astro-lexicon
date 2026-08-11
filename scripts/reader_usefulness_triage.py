#!/usr/bin/env python3
"""Classify every reviewed/public lexicon entry for the reader-usefulness pass.

This is a planning audit, not an automatic rewrite engine. It assigns each entry:
- one primary action bucket;
- an effort estimate (S/M/L);
- one or more defect flags;
- a broad family so related entries can be edited together.

The rules deliberately favor batching and restraint: concise dictionary entries can remain
concise, while repeated family/template defects are surfaced only while that family batch
is still open. Completed family, structure and visual work is allowed to fall back into the
ordinary per-entry rules so the inventory remains a list of unresolved work rather than
historical tags.
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
    r"cross-source|reconciliation|the reviewed corpus)\b", re.I)
ONTOLOGY_RE = re.compile(
    r"\b(?:do not merge|distinct from|keep distinct|false friend|duplicate|not identical|"
    r"not equivalent|same (?:word|term|label)|different (?:use|usage|sense)|reconcil)\b", re.I)
SEQUENCE_RE = re.compile(
    r"\b(?:sequence|order|successive|periods?|years?|rulers?|division|subdivision|"
    r"terms?|bounds?|triplicity|faces?|decans?|mansions?|hours?|days?)\b", re.I)
MECHANIC_RE = re.compile(
    r"\b(?:application|separation|perfection|prohibition|frustration|refranation|refrenation|"
    r"translation|collection|abscission|intervention|evasion|return|reception)\b", re.I)

SIGN_SLUGS = {'aries','taurus','gemini','cancer','leo','virgo','libra','scorpio','sagittarius','capricorn','aquarius','pisces'}
PLANET_SLUGS = {'sun','moon','mercury','venus','mars','jupiter','saturn'}
VISUAL_SLUGS = {
    'altitude','azimuth','apogee','perigee','auge','celestial-latitude','celestial-longitude',
    'declination','right-ascension','oblique-ascension','ecliptic','equinoctial','ecliptic-projection',
    'horizon','meridian','zenith','nadir','semi-diurnal-arc','geocentric-model','rising-times',
    'ascending-descending-quadrant','quadrant-of-sphere','application','separation','antiscion','contra-antiscion',
    'aspect','opposition','trine','quartile','sextile','conjunction','orientality','occidentality',
}
# Batch F routes every currently reviewed visual candidate through AstronomyMechanics.
# Conjunction is retained as a future visual candidate because that entry is not currently
# part of the reviewed/public 468-entry inventory and is not yet routed on the term page.
VISUAL_SERVED_SLUGS = VISUAL_SLUGS - {'conjunction'}

# These entries looked table-shaped to the first heuristic because their prose contains words
# such as rulers, years, decans or sequence. Human review showed that the useful structure is
# already supplied by a shared component, by explicit prose, or is not actually tabular.
STRUCTURE_SERVED_SLUGS = {
    'detriment','domicile','face-decan','triplicity',
    'anareta','planetary-hour','world-year-revolution',
    'decan-figure','inconjunct',
}

# A shared visual can carry much of the recognition burden for a spatial/motion entry even
# when the generic article itself has only one prose block. First/Second Movement and Solar
# Eclipse were already routed through pre-existing motion/eclipse visual families before the
# 33-candidate Batch F list was assembled. Masculine Planet is deliberately concise; the
# broader conditional doctrine lives under Planetary Masculinity.
DEPTH_SERVED_SLUGS = VISUAL_SERVED_SLUGS | {
    'first-movement','second-movement','solar-eclipse','masculine-planet'
}


def scalar(con: sqlite3.Connection, sql: str, params: tuple = ()) -> int:
    row = con.execute(sql, params).fetchone(); return int(row[0] or 0)

def text_scalar(con: sqlite3.Connection, sql: str, params: tuple = ()) -> str:
    row = con.execute(sql, params).fetchone(); return (row[0] or '') if row else ''


def infer_family(slug: str, label: str, category: str) -> str:
    s, l, c = slug.casefold(), label.casefold(), category.casefold()
    base = f"{l} {c}"
    if s in SIGN_SLUGS: return 'zodiac signs'
    if s in PLANET_SLUGS: return 'planets'
    if 'lot' in c or s == 'lot' or s.startswith('lot-') or s.endswith('-lot') or l.startswith('lot ') or l.startswith('lot /') or l.startswith('lots '): return 'lots / parts'
    if 'house' in c or 'place' in c or s in {'twelve-places','cardine','cadent-place','succedent-place','derived-house'}: return 'houses / places'
    if 'sign classification' in c or any(x in l for x in ('barren sign','fecund sign','feminine sign','masculine sign','human / bipedal sign','quadruped sign','voiced sign','voiceless sign','half-voice sign','half-voiced','weak-voiced','powerful-voiced','diurnal sign','nocturnal sign')): return 'sign qualities / classifications'
    if any(x in c for x in ('dignity','debility')) or s in {'domicile','exaltation','exaltation-degree','fall','detriment','triplicity','triplicity-rulers','terms','face-decan','peregrine','essential-dignity','accidental-fortitude','fortitude','planetary-share'}: return 'dignities / debilities'
    if s in VISUAL_SLUGS or any(x in c for x in ('astronom','celestial coordinate','geometry')): return 'astronomy / geometry'
    if MECHANIC_RE.search(base) or s in {'abscission-of-light','abscissor','feral','void-of-course','besiegement','planetary-orb','partile-aspect','platick-aspect','dexter-aspect','sinister-aspect'}: return 'perfection / connection mechanics'
    if any(x in base for x in ('firdar','alfridary','profection','direction','revolution','time lord','time-lord','planetary years','jarbakhtar','anareta','promittor')): return 'timing / predictive techniques'
    if any(x in base for x in ('decan','dodecat','twelfth-part','ninth / naw','darīǧān','subdivision')) or s in {'degree-sign-nature','decan-figure','inconjunct'}: return 'zodiac subdivisions'
    if 'astrology' in c or l.endswith(' astrology'): return 'branches / taxonomy'
    return 'other'


def load_rows(con: sqlite3.Connection) -> list[dict]:
    out=[]
    for t in con.execute("""SELECT id,slug,label,short_definition,category,entry_type,definition_quality,editorial_notes FROM terms WHERE status IN ('reviewed','published') ORDER BY label COLLATE NOCASE"""):
        term_id, slug, label, definition, category, entry_type, quality, notes = t
        intro=text_scalar(con,"SELECT intro FROM term_articles WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        section_text=text_scalar(con,"SELECT COALESCE(group_concat(heading || ' ' || body, ' '),'') FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        public_text=' '.join(x for x in (definition or '',intro,section_text) if x)
        sections=scalar(con,"SELECT COUNT(*) FROM term_article_sections WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        tables=scalar(con,"SELECT COUNT(*) FROM term_article_tables WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        interpretations=scalar(con,"SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        works=scalar(con,"SELECT COUNT(DISTINCT work_id) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published')",(term_id,))
        grade_a=scalar(con,"SELECT COUNT(*) FROM interpretations WHERE term_id=? AND status IN ('reviewed','published') AND evidence_grade='A'",(term_id,))
        aliases=scalar(con,"SELECT COUNT(*) FROM aliases WHERE term_id=?",(term_id,))
        relations=scalar(con,"SELECT COUNT(*) FROM term_relations WHERE status IN ('reviewed','published') AND (subject_term_id=? OR object_term_id=?)",(term_id,term_id))
        out.append({'id':term_id,'slug':slug,'label':label,'definition':definition or '','category':category or '','entry_type':entry_type or '','quality':int(quality or 0),'notes':notes or '','intro':intro,'public_text':public_text,'sections':sections,'tables':tables,'blocks':sections+tables,'interpretations':interpretations,'works':works,'grade_a':grade_a,'aliases':aliases,'relations':relations,'family':infer_family(slug,label,category or '')})
    return out


def classify(r: dict) -> dict:
    flags=[]; blob=f"{r['public_text']} {r['notes']}"; has_article=bool(r['intro']); ontology=bool(ONTOLOGY_RE.search(r['notes'])); lexicon_voice=bool(LEXICON_VOICE_RE.search(r['public_text'])); visual=r['slug'] in VISUAL_SLUGS and r['slug'] not in VISUAL_SERVED_SLUGS; sequence=bool(SEQUENCE_RE.search(blob))
    if lexicon_voice: flags.append('lexicon-voice')
    if ontology: flags.append('ontology')
    if visual: flags.append('visual')
    if sequence and r['tables']==0 and r['family'] in {'timing / predictive techniques','zodiac subdivisions','dignities / debilities'} and r['slug'] not in STRUCTURE_SERVED_SLUGS: flags.append('structure')
    if r['quality']<=3: flags.append('definition')
    if not has_article and r['slug'] not in DEPTH_SERVED_SLUGS and (r['interpretations']>=2 or r['relations']>=5 or r['grade_a']>=2): flags.append('depth')
    # Sign pages and shared visual/membership components carry structured recognition outside
    # generic article blocks, so low block count alone is not evidence of insufficient depth.
    if has_article and r['blocks']<=1 and (r['interpretations']>=3 or r['relations']>=5) and r['slug'] not in SIGN_SLUGS and r['slug'] not in DEPTH_SERVED_SLUGS: flags.append('depth')
    if MECHANIC_RE.search(f"{r['label']} {r['category']}") and has_article and r['blocks']<2: flags.append('example')
    flags=list(dict.fromkeys(flags))

    if visual: action='visual / explanation'
    elif ontology and (not has_article or lexicon_voice or r['quality']<=3): action='ontology-review'
    elif 'structure' in flags: action='structure / table'
    elif 'depth' in flags or 'definition' in flags: action='needs-expansion'
    elif lexicon_voice or 'example' in flags: action='tiny-fix'
    elif not has_article and r['quality']>=4 and r['interpretations']<=1 and r['relations']<=3 and not ontology: action='dictionary-enough'
    else: action='ok-as-is'

    effort='S' if action in {'dictionary-enough','ok-as-is','tiny-fix'} else ('M' if action in {'needs-expansion','structure / table'} else 'L')
    if action=='visual / explanation': effort='L'
    rr=dict(r); rr.update(action=action,effort=effort,flags=flags); return rr


def render(rows: list[dict]) -> str:
    action_counts=Counter(r['action'] for r in rows); effort_counts=Counter(r['effort'] for r in rows); family_counts=Counter(r['family'] for r in rows)
    lines=['# Reader-usefulness corpus inventory','', 'Generated from the canonical SQLite build. This is a planning classification, not a quality score or an instruction to rewrite every flagged entry.','', '## Summary','']
    for action in ('ok-as-is','dictionary-enough','tiny-fix','needs-expansion','structure / table','family-fix','ontology-review','visual / explanation'): lines.append(f"- **{action}:** {action_counts[action]}")
    lines += ['',f"- **S effort:** {effort_counts['S']}",f"- **M effort:** {effort_counts['M']}",f"- **L effort:** {effort_counts['L']}",f"- **Total:** {len(rows)}",'','## Families','']
    for family,count in sorted(family_counts.items(),key=lambda x:(-x[1],x[0])): lines.append(f"- **{family}:** {count}")
    for action in ('family-fix','ontology-review','visual / explanation','structure / table','needs-expansion','tiny-fix','ok-as-is','dictionary-enough'):
        group=[r for r in rows if r['action']==action]; lines += ['',f"## {action} ({len(group)})",'']; by_family=defaultdict(list)
        for r in group: by_family[r['family']].append(r)
        for family in sorted(by_family):
            lines += [f"### {family}",'']
            for r in sorted(by_family[family],key=lambda x:x['label'].casefold()):
                flags=', '.join(r['flags']) if r['flags'] else 'none'; lines.append(f"- **{r['label']}** (`{r['slug']}`) — effort **{r['effort']}**; flags: {flags}; evidence {r['interpretations']}/{r['works']} works; blocks {r['blocks']}; relations {r['relations']}.")
            lines.append('')
    return '\n'.join(lines)


def main() -> None:
    parser=argparse.ArgumentParser(); parser.add_argument('--db',type=Path,default=DEFAULT_DB); parser.add_argument('--report',type=Path,default=DEFAULT_REPORT); args=parser.parse_args(); args.db.parent.mkdir(parents=True,exist_ok=True); args.report.parent.mkdir(parents=True,exist_ok=True); build_db(args.db); con=sqlite3.connect(args.db)
    try: rows=[classify(r) for r in load_rows(con)]
    finally: con.close()
    args.report.write_text(render(rows),encoding='utf-8'); actions=Counter(r['action'] for r in rows); efforts=Counter(r['effort'] for r in rows)
    print('READER TRIAGE|'+'|'.join([f"total={len(rows)}",*[f"{k}={actions[k]}" for k in ('ok-as-is','dictionary-enough','tiny-fix','needs-expansion','structure / table','family-fix','ontology-review','visual / explanation')],f"S={efforts['S']}",f"M={efforts['M']}",f"L={efforts['L']}" ]))
    print('READER TRIAGE FAMILIES')
    for family,count in sorted(Counter(r['family'] for r in rows).items(),key=lambda x:(-x[1],x[0])): print(f"FAMILY|{family}|{count}")
    print('READER TRIAGE ACTION LIST')
    for r in sorted(rows,key=lambda x:(x['action'],x['family'],x['label'].casefold())): print(f"ENTRY|{r['action']}|{r['effort']}|{r['family']}|{r['slug']}|{r['label']}|{','.join(r['flags'])}")
    print(f"Report: {args.report}")

if __name__=='__main__': main()
