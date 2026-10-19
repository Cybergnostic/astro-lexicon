import { test } from 'node:test';
import assert from 'node:assert/strict';
import { mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { join } from 'node:path';
import {
  parseCsv, stringifyCsv, revisionToken, decide, saveLedger, loadLedger,
} from './editorial_ledger.mjs';

const sample = {
  slug: 'lot-of-sons',
  review_state: 'revised-awaiting-review',
  pending_check: 'Check the alternate formula in Great Introduction VIII.4.24.',
  reviewer_signoff: '',
  review_note: '',
};

test('multiline review notes and non-ASCII citations survive CSV round trip', () => {
  const headers = ['slug', 'review_state', 'review_note', 'pending_check'];
  const rows = [{...sample,review_note:'al-Bīrūnī wrote "nocturnal"\nChecked two editions.'}];
  const result = parseCsv(stringifyCsv(headers,rows));
  assert.deepEqual(result.rows,rows.map((r) => Object.fromEntries(headers.map((h) => [h,r[h] || '']))));
});

test('approve requires recorded resolution of pending source check', () => {
  assert.throws(() => decide(sample,{
    action:'approve',reviewer:'Reviewer',reason:'okay',revision:revisionToken(sample),
  },{changed:true}),/Resolve the outstanding/);
});

test('resolve hold records prior task and requires meaningful evidence', () => {
  assert.throws(() => decide(sample,{
    action:'resolve_source',reviewer:'Reviewer',reason:'yes',revision:revisionToken(sample),
  },{changed:true}),/Explain what you verified/);
  const next = decide(sample,{
    action:'resolve_source',reviewer:'Reviewer',
    reason:'Verified Brill Great Introduction VIII.4.24, printed p. 869',
    revision:revisionToken(sample),
  },{changed:true});
  assert.equal(next.review_state,'revised-awaiting-review');
  assert.equal(next.pending_check,'');
  assert.match(next.review_note,/Previous source hold/);
  const approved = decide(next,{
    action:'approve',reviewer:'Reviewer',reason:'Clear and attributed',
    revision:revisionToken(next),
  },{changed:true});
  assert.equal(approved.review_state,'approved');
  assert.match(approved.reviewer_signoff,/Reviewer/);
  assert.match(approved.review_note,/Verified Brill/);
  assert.match(approved.review_note,/approve/);
});

test('no-change decision refuses a revised entry and requires signoff', () => {
  const clear = {...sample,pending_check:'',review_state:'triaged'};
  assert.throws(() => decide(clear,{
    action:'no_change',reviewer:'',revision:revisionToken(clear),
  },{changed:false}),/Enter your reviewer name/);
  assert.throws(() => decide(clear,{
    action:'no_change',reviewer:'Reviewer',revision:revisionToken(clear),
  },{changed:true}),/contains proposed edits/);
  assert.equal(decide(clear,{
    action:'no_change',reviewer:'Reviewer',reason:'Already sufficiently precise.',
    revision:revisionToken(clear),
  },{changed:false}).review_state,'no-change-justified');
});

test('stale revision does not overwrite a saved decision', () => {
  const clear = {...sample,pending_check:''};
  assert.throws(() => decide(clear,{
    action:'approve',reviewer:'Reviewer',revision:'old-revision-token',
  },{changed:true}),/changed since/);
});

test('request-changes requires an explanatory note', () => {
  const clear = {...sample,pending_check:''};
  assert.throws(() => decide(clear,{
    action:'request_changes',reviewer:'Reviewer',reason:'',revision:revisionToken(clear),
  },{changed:true}),/Describe what should change/);
});

test('CSV is persisted atomically with signoff and review chronology', async () => {
  const dir = await mkdtemp(join(tmpdir(),'astro-ledger-'));
  const target = join(dir,'ledger.csv');
  try {
    const headers = ['slug','review_state','pending_check','reviewer_signoff'];
    const updated = decide({...sample,pending_check:''},{
      action:'approve',reviewer:'Human Editor',revision:revisionToken({...sample,pending_check:''}),
    },{changed:true});
    await saveLedger(target,headers,[updated]);
    const parsed = await loadLedger(target);
    assert.equal(parsed.rows[0].review_state,'approved');
    assert.equal(parsed.rows[0].reviewed_by,'Human Editor');
    assert.match(parsed.rows[0].reviewed_at,/^\d{4}-/);
    assert.ok(!(await readFile(target,'utf8')).includes('undefined'));
  } finally { await rm(dir,{recursive:true,force:true}); }
});

test('first saved decision must not invalidate an unrelated ledger revision', () => {
  const old = {...sample,slug:'other-entry',pending_check:'',review_state:'triaged'};
  const expanded = {...old,review_note:'',reviewed_by:'',reviewed_at:''};
  assert.equal(revisionToken(old),revisionToken(expanded));
});
