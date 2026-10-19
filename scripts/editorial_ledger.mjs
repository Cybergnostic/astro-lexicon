import { readFile, writeFile, rename } from 'node:fs/promises';
import { createHash } from 'node:crypto';

export const VALID_STATES = new Set([
  'unreviewed', 'triaged', 'source-pending', 'revised-awaiting-review',
  'approved', 'no-change-justified',
]);
export const ACTIONS = new Set([
  'approve', 'request_changes', 'needs_source', 'resolve_source', 'no_change',
]);

export function parseCsv(source) {
  const lines = [];
  let row = [];
  let field = '';
  let quoted = false;
  for (let i = 0; i < source.length; i += 1) {
    const ch = source[i];
    if (quoted) {
      if (ch === '"' && source[i + 1] === '"') { field += '"'; i += 1; }
      else if (ch === '"') quoted = false;
      else field += ch;
    } else if (ch === '"') quoted = true;
    else if (ch === ',') { row.push(field); field = ''; }
    else if (ch === '\n') {
      row.push(field);
      if (row.some((cell) => cell !== '')) lines.push(row);
      row = [];
      field = '';
    } else if (ch !== '\r') field += ch;
  }
  if (quoted) throw new Error('Unterminated quoted CSV field.');
  if (field || row.length) { row.push(field); lines.push(row); }
  if (!lines.length) throw new Error('Empty editorial ledger.');
  const [headers, ...values] = lines;
  if (new Set(headers).size !== headers.length || !headers.includes('slug')) {
    throw new Error('Invalid ledger CSV headers.');
  }
  return {
    headers,
    rows: values.map((cells, i) => {
      if (cells.length !== headers.length) {
        throw new Error('Invalid CSV width at record ' + (i + 2));
      }
      return Object.fromEntries(headers.map((header, j) => [header, cells[j]]));
    }),
  };
}

export function stringifyCsv(headers, rows) {
  return [headers, ...rows.map((row) => headers.map((key) => row[key] ?? ''))]
    .map((row) => row.map((cell) => '"' + String(cell).replaceAll('"', '""') + '"').join(','))
    .join('\n') + '\n';
}

export function revisionToken(row) {
  return createHash('sha256').update(JSON.stringify(row)).digest('hex');
}

export function publicLedger(rows) {
  return rows.map((row) => ({ ...row, revision: revisionToken(row) }));
}

const limitedText = (value, limit, name) => {
  const s = String(value ?? '').trim();
  if (s.length > limit) throw new Error(name + ' is too long.');
  return s;
};

export function decide(row, input, { changed = false } = {}) {
  if (!row) throw new Error('Entry missing from editorial ledger.');
  if (!input || !ACTIONS.has(input.action)) throw new Error('Unknown review decision.');
  if (input.revision !== revisionToken(row)) {
    const err = new Error('The entry changed since you opened it. Reload the review before saving.');
    err.statusCode = 409;
    throw err;
  }
  const reviewer = limitedText(input.reviewer, 120, 'Reviewer');
  const reason = limitedText(input.reason, 4000, 'Review note');
  if (!reviewer) throw new Error('Enter your reviewer name to save a decision.');
  const next = { ...row };
  if (input.action === 'approve') {
    if (row.review_state === 'source-pending') {
      throw new Error('This entry has an unresolved source check. Resolve it with a passage reference first.');
    }
    if (!changed) {
      throw new Error('There is no proposed copy change. Use “Keep as is” instead.');
    }
    next.review_state = 'approved';
  } else if (input.action === 'no_change') {
    if (changed) throw new Error('This entry contains proposed edits; approve or request changes instead.');
    if (row.review_state === 'source-pending') {
      throw new Error('Source verification is still open on this entry.');
    }
    next.review_state = 'no-change-justified';
  } else if (input.action === 'request_changes') {
    if (!reason) throw new Error('Describe what should change.');
    next.review_state = 'triaged';
  } else if (input.action === 'needs_source') {
    if (!reason) throw new Error('Describe which source or passage needs verification.');
    next.review_state = 'source-pending';
    next.pending_check = [row.pending_check, reason].filter(Boolean).join(' | ');
  } else if (input.action === 'resolve_source') {
    if (row.review_state !== 'source-pending') throw new Error('No open source hold to resolve.');
    if (reason.length < 12) throw new Error('Record the checked edition and passage in your source-resolution note.');
    next.review_state = changed ? 'revised-awaiting-review' : 'triaged';
    // The old pending text is preserved in review_note as part of the audit trail.
    next.pending_check = '';
  }
  const stamp = new Date().toISOString();
  const detail = [
    stamp + ' | ' + reviewer + ' | ' + input.action,
    reason ? 'Comment: ' + reason : '',
    input.action === 'resolve_source' ? 'Previous source hold: ' + (row.pending_check || '(none)') : '',
  ].filter(Boolean).join(' | ');
  next.review_note = [row.review_note, detail].filter(Boolean).join('\n');
  next.reviewed_by = reviewer;
  next.reviewed_at = stamp;
  next.reviewer_signoff = (next.review_state === 'approved' || next.review_state === 'no-change-justified')
    ? reviewer + ' | ' + stamp : '';
  if (!VALID_STATES.has(next.review_state)) throw new Error('Invalid resulting review state.');
  return next;
}

export async function loadLedger(file) {
  const parsed = parseCsv(await readFile(file, 'utf8'));
  const seen = new Set();
  for (const row of parsed.rows) {
    if (seen.has(row.slug)) throw new Error('Duplicate ledger slug: ' + row.slug);
    if (!VALID_STATES.has(row.review_state)) throw new Error('Invalid ledger state: ' + row.slug);
    seen.add(row.slug);
  }
  return parsed;
}

export async function saveLedger(file, headers, rows) {
  const extra = ['review_note', 'reviewed_by', 'reviewed_at'];
  const allHeaders = [...headers, ...extra.filter((field) => !headers.includes(field))];
  const temp = file + '.tmp';
  await writeFile(temp, stringifyCsv(allHeaders, rows), 'utf8');
  await rename(temp, file);
}
