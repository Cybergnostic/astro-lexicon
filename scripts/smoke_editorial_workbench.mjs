#!/usr/bin/env node
// HTTP integration test against isolated, throwaway review stores.
// Never edits a real user's ledger or notes.
import assert from 'node:assert/strict';
import { spawn } from 'node:child_process';
import { cp, mkdtemp, readFile, rm } from 'node:fs/promises';
import { tmpdir } from 'node:os';
import { resolve, join } from 'node:path';
import { setTimeout as wait } from 'node:timers/promises';

const root = resolve(import.meta.dirname, '..');
const temp = await mkdtemp(join(tmpdir(), 'astro-review-http-'));
const csv = join(temp,'ledger.csv');
const notes = join(temp,'reviews.json');
const port = 44000 + Math.floor(Math.random()*15000);
const origin = 'http://127.0.0.1:' + port;
await cp(join(root,'docs/editorial/lexicographic-ledger.csv'),csv);
await cp(join(root,'editorial/reviews.json'),notes);
const server = spawn(process.execPath,['scripts/editorial_review_server.mjs'],{
  cwd:root,
  env:{...process.env,EDITORIAL_HOST:'127.0.0.1',EDITORIAL_PORT:String(port),
    EDITORIAL_LEDGER_FILE:csv,EDITORIAL_REVIEW_FILE:notes},
  stdio:['ignore','pipe','pipe'],
});
let output = '';
server.stderr.on('data',chunk => {output += chunk.toString();});
server.stdout.on('data',chunk => {output += chunk.toString();});

async function request(path, method='GET', body=null) {
  const response = await fetch(origin + path,{
    method,
    headers: {'content-type':'application/json'},
    ...(body ? {body:JSON.stringify(body)} : {}),
  });
  return {status:response.status, data:await response.json()};
}

try {
  let ready = false;
  for (let i=0;i<90;i++) {
    if (server.exitCode !== null) throw new Error('Workbench process exited: '+output);
    try { const reply = await request('/api/editorial'); if (reply.status === 200) {ready=true;break;} }
    catch {}
    await wait(160);
  }
  assert.equal(ready,true,'Workbench failed to start: '+output);
  const editorial = (await request('/api/editorial')).data;
  assert.equal(Object.keys(editorial.entries).length,348);
  assert.equal(editorial.groups[1].slugs.length,20);
  assert.equal(editorial.groups[2].slugs.length,40);
  assert.equal(editorial.groups[3].slugs.length,40);
  assert.equal(editorial.groups[4].slugs.length,40);
  assert.equal(editorial.groups[5].slugs.length,40);
  assert.equal(editorial.groups[6].slugs.length,40);
  assert.equal(editorial.groups[7].slugs.length,40);
  assert.equal(editorial.groups[8].slugs.length,40);
  assert.equal(editorial.groups[9].slugs.length,40);
  const before = editorial.ledger['lot-of-sons'];
  assert.ok(before.revision);
  assert.ok(before.pending_check);
  assert.ok(editorial.entries['lot-of-sons'].changes.length);
  const source = await request('/api/decision','PUT',{
    slug:'lot-of-sons',action:'resolve_source',revision:before.revision,
    reviewer:'Integration Test',reason:'Verified Great Introduction VIII.4.24 p.869 in the inspected edition.',
  });
  assert.equal(source.status,200,JSON.stringify(source.data));
  assert.equal(source.data.entry.pending_check,'');
  const stale = await request('/api/decision','PUT',{
    slug:'lot-of-sons',action:'approve',revision:before.revision,
    reviewer:'Integration Test',
  });
  assert.equal(stale.status,409,'Stale approval must not overwrite human review.');
  const approval = await request('/api/decision','PUT',{
    slug:'lot-of-sons',action:'approve',revision:source.data.entry.revision,
    reviewer:'Integration Test',reason:'The verified alternatives are accurately attributed.',
  });
  assert.equal(approval.status,200,JSON.stringify(approval.data));
  assert.equal(approval.data.entry.review_state,'approved');
  assert.match(await readFile(csv,'utf8'),/Integration Test/);
  const unchanged = await request('/api/decision','PUT',{
    slug:'general-indicators-of-a-lot',action:'approve',
    revision:editorial.ledger['general-indicators-of-a-lot'].revision,
    reviewer:'Integration Test',
  });
  assert.equal(unchanged.status,400);
  const retained = await request('/api/reviews');
  assert.equal(retained.status,200);
  assert.ok(Array.isArray(retained.data.notes));
  console.log('HTTP review smoke passed: 348 comparisons, source resolution, signed approval, stale-save protection and preserved notes.');
} finally {
  server.kill('SIGTERM');
  await wait(200);
  await rm(temp,{recursive:true,force:true});
}
