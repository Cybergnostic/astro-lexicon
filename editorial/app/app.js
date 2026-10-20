const state = {
  terms: [], reviews: null, editorial: null, currentSlug: null,
  activeBatch: 'lots', visibleSlugs: [], savingDecision: false,
};
const $ = (selector) => document.querySelector(selector);
const ui = {
  summary: $('#summary'), batch: $('#batch-picker'), batchSummary: $('#batch-summary'),
  queue: $('#batch-queue'), search: $('#entry-search'), list: $('#entry-list'),
  filter: $('#status-filter'), position: $('#queue-position'),
  prev: $('#prev'), next: $('#next'), openPublic: $('#open-public'),
  preview: $('#preview'), previewTitle: $('#preview-title'),
  title: $('#review-title'), category: $('#entry-category'), badge: $('#editorial-status'),
  finding: $('#finding'), sourceHold: $('#source-hold'), pending: $('#pending-check'),
  reviewer: $('#reviewer-name'), reason: $('#decision-reason'),
  actions: [...document.querySelectorAll('[data-decision]')],
  decisionState: $('#decision-save-state'), log: $('#decision-log'),
  comparison: $('#comparison'), changeCount: $('#change-count'),
  sourceCount: $('#source-count'), checkedSource: $('#checked-source'),
  sourceList: $('#source-list'), sourceDetails: $('#sources-details'),
  target: $('#target'), kind: $('#kind'), text: $('#note-text'),
  image: $('#image-input'), imageCaption: $('#image-caption'),
  imagePreview: $('#pending-image'), addNote: $('#add-note'),
  noteState: $('#save-state'), notes: $('#notes'), noteFilter: $('#note-filter'),
};
const labels = {
  'unreviewed': 'Unreviewed', 'triaged': 'Changes requested / triaged',
  'source-pending': 'Source check needed',
  'revised-awaiting-review': 'Ready for human review',
  'approved': 'Approved', 'no-change-justified': 'Kept as is',
};
function node(tag, className, text) {
  const item = document.createElement(tag);
  if (className) item.className = className;
  if (text !== undefined) item.textContent = String(text);
  return item;
}
function packet() { return state.editorial.entries[state.currentSlug]; }
function ledger() { return state.editorial.ledger[state.currentSlug] || {}; }
function group() { return state.editorial.groups.find((item) => item.id === state.activeBatch); }
function slugs() { return group()?.slugs || []; }
function reviewState(slug) { return state.editorial.ledger[slug]?.review_state || 'unreviewed'; }
function publicUrl(slug) { return 'http://127.0.0.1:4321/terms/' + slug + '/'; }

async function api(url, options = {}) {
  const response = await fetch(url, {
    ...options, headers: { 'content-type': 'application/json', ...(options.headers || {}) },
  });
  let body;
  try { body = await response.json(); }
  catch { throw new Error('Server returned HTTP ' + response.status); }
  if (!response.ok) throw new Error(body.error || 'HTTP ' + response.status);
  return body;
}
function renderSummary() {
  const batch = slugs(), statuses = batch.map(reviewState);
  const signed = statuses.filter((s) => ['approved','no-change-justified'].includes(s)).length;
  const ready = statuses.filter((s) => s === 'revised-awaiting-review').length;
  const held = statuses.filter((s) => s === 'source-pending').length;
  const open = state.reviews.notes.filter((n) => n.status !== 'resolved' && batch.includes(n.slug)).length;
  ui.summary.replaceChildren();
  for (const [count,label] of [[signed+'/'+batch.length,'signed off'],[ready,'ready'],[held,'source holds'],[open,'open notes']]) {
    const span = node('span');
    span.append(node('b','',count),' '+label);
    ui.summary.append(span);
  }
}

function renderQueue({ selectFirst = false } = {}) {
  const query = ui.search.value.trim().toLocaleLowerCase();
  const status = ui.filter.value;
  state.visibleSlugs = slugs().filter((slug) => {
    const entry = state.editorial.entries[slug];
    return (!query || slug.includes(query) || entry.label.toLocaleLowerCase().includes(query))
      && (status === 'all' || reviewState(slug) === status);
  });
  ui.queue.replaceChildren();
  for (const slug of state.visibleSlugs) {
    const b = node('button','queue-entry state-'+reviewState(slug));
    b.type = 'button';
    b.dataset.slug = slug;
    b.setAttribute('aria-current', String(state.currentSlug === slug));
    b.append(node('span','',state.editorial.entries[slug].label));
    b.append(node('small','', ['approved','no-change-justified'].includes(reviewState(slug)) ? '✓'
      : reviewState(slug) === 'source-pending' ? '!' : '·'));
    b.title = labels[reviewState(slug)];
    b.addEventListener('click', () => selectEntry(slug));
    ui.queue.append(b);
  }
  const signed = slugs().filter((s) => ['approved','no-change-justified'].includes(reviewState(s))).length;
  ui.batchSummary.textContent = group().label+' · '+signed+'/'+slugs().length+' signed off · '+state.visibleSlugs.length+' shown';
  if (selectFirst || !state.currentSlug || !slugs().includes(state.currentSlug)) {
    const first = state.visibleSlugs[0] || slugs()[0];
    if (first) selectEntry(first, { updateQueue: false });
  }
  const position = state.visibleSlugs.indexOf(state.currentSlug);
  ui.position.textContent = position < 0 ? '—' : (position+1)+' / '+state.visibleSlugs.length;
  ui.prev.disabled = position <= 0;
  ui.next.disabled = position < 0 || position >= state.visibleSlugs.length-1;
  renderSummary();
}

function selectEntry(slug, { updateQueue = true, navigate = true } = {}) {
  const record = state.editorial.entries[slug];
  if (!record) return;
  state.currentSlug = slug;
  ui.previewTitle.textContent = record.label;
  ui.title.textContent = record.label;
  ui.category.textContent = (record.category || 'Lexicon')+' · '+slug;
  const href = publicUrl(slug);
  if (ui.preview.src !== href) ui.preview.src = href;
  ui.openPublic.href = href;
  const term = state.terms.find((entry) => entry.slug === slug);
  ui.target.replaceChildren();
  for (const target of term?.targets || [{value:'entry',label:'Whole entry'}]) {
    const opt = node('option','',target.label);
    opt.value = target.value;
    ui.target.append(opt);
  }
  ui.text.value = '';
  ui.image.value = '';
  ui.imageCaption.value = '';
  ui.imagePreview.hidden = true;
  ui.imagePreview.replaceChildren();
  ui.noteState.textContent = '';
  ui.decisionState.textContent = '';
  ui.reason.value = '';
  renderEditorial();
  renderNotes();
  if (navigate) {
    const url = new URL(window.location.href);
    url.searchParams.set('batch',state.activeBatch);
    url.searchParams.set('entry',slug);
    history.replaceState(null,'',url);
  }
  if (updateQueue) renderQueue();
}

function renderEditorial() {
  const record = packet(), row = ledger();
  const held = row.review_state === 'source-pending' || Boolean(row.pending_check?.trim());
  const changed = record.changes.length > 0;
  ui.badge.textContent = labels[row.review_state] || 'Unreviewed';
  ui.badge.dataset.state = row.review_state || 'unreviewed';
  ui.finding.textContent = row.primary_finding || 'Read this entry and judge its content.';
  ui.sourceHold.hidden = !row.pending_check;
  ui.pending.textContent = row.pending_check || '';
  ui.checkedSource.textContent = row.checked_source_locator
    ? 'Recorded source checks: '+row.checked_source_locator
    : 'No prior source check recorded in the audit ledger.';
  ui.log.textContent = row.review_note || 'No human decisions recorded yet.';
  for (const b of ui.actions) {
    const action = b.dataset.decision;
    b.hidden = (action === 'approve' && !changed)
      || (action === 'no_change' && changed)
      || (action === 'resolve_source' && !held);
    b.disabled = state.savingDecision
      || (action === 'approve' && held)
      || (action === 'no_change' && held);
  }
  ui.changeCount.textContent = record.changes.length+' changed block'+(record.changes.length === 1 ? '' : 's');
  ui.comparison.replaceChildren();
  if (!changed) {
    ui.comparison.append(node('p','empty',
      'No proposed copy change in these editorial batches. Inspect the live article and references, then choose Keep existing entry if satisfactory.'));
  } else {
    for (const [idx,section] of record.changes.entries()) {
      const card = node('details','diff-card');
      card.open = idx < 2;
      const summary = node('summary');
      const heading = node('span');
      heading.append(node('small','',section.kind+' · '+section.key));
      heading.append(node('strong','',section.heading));
      if (section.before_heading && section.before_heading !== section.heading)
        heading.append(node('span','old-heading','Earlier heading: '+section.before_heading));
      summary.append(heading,node('span','chevron','⌄'));
      card.append(summary);
      const columns = node('div','diff-columns');
      for (const [title,copy,klass] of [
        ['BEFORE EDITORIAL PASS', section.before || '(no passage)', 'diff-before'],
        ['PROPOSED COPY — CURRENT BRANCH',section.after || '(removed as redundant)','diff-after'],
      ]) {
        const col = node('div',klass);
        col.append(node('h4','',title),node('p','',copy));
        columns.append(col);
      }
      card.append(columns);
      ui.comparison.append(card);
    }
  }
  ui.sourceCount.textContent = record.witnesses.length+' source account'+(record.witnesses.length === 1 ? '' : 's');
  ui.sourceList.replaceChildren();
  if (!record.witnesses.length) {
    ui.sourceList.append(node('p','empty','No historical interpretation attached to this entry.'));
  } else {
    for (const source of record.witnesses) {
      const item = node('article','witness');
      const title = node('h4','',source.author);
      title.append(node('span','',' — '+source.work));
      item.append(title);
      if (source.scope) item.append(node('p','witness-scope',source.scope));
      item.append(node('p','',source.summary));
      item.append(node('p','witness-locator','Recorded passage: '+
        (source.locators.length ? source.locators.join(' · ') : 'NO LINKED PASSAGE — verification required')));
      ui.sourceList.append(item);
    }
  }
}

async function saveDecision(action) {
  if (!ui.reviewer.value.trim()) {
    ui.decisionState.textContent = 'Enter your reviewer name first.';
    ui.reviewer.focus();
    return;
  }
  const slug = state.currentSlug;
  const payload = {
    slug, action, reviewer: ui.reviewer.value.trim(),
    reason: ui.reason.value.trim(), revision: ledger().revision,
  };
  state.savingDecision = true;
  renderEditorial();
  ui.decisionState.textContent = 'Saving decision…';
  try {
    const result = await api('/api/decision',{method:'PUT',body:JSON.stringify(payload)});
    state.editorial.ledger[slug] = result.entry;
    try { localStorage.setItem('astro-lexicon-reviewer',payload.reviewer); } catch {}
    ui.reason.value = '';
    renderEditorial();
    renderQueue();
    ui.decisionState.textContent = 'Decision saved to lexicographic-ledger.csv · '+
      new Date(result.entry.reviewed_at).toLocaleTimeString();
  } catch (error) {
    ui.decisionState.textContent = 'Not saved: '+error.message;
  } finally {
    state.savingDecision = false;
    renderEditorial();
  }
}

const notesFor = (slug) => state.reviews.notes.filter((n) => n.slug === slug)
  .sort((a,b) => new Date(b.created_at)-new Date(a.created_at));
function renderNotes() {
  const filter = ui.noteFilter.value;
  const notes = notesFor(state.currentSlug).filter((n) => filter === 'all'
    || (filter === 'open' ? n.status !== 'resolved' : n.status === 'resolved'));
  ui.notes.replaceChildren();
  if (!notes.length) {
    ui.notes.append(node('p','empty','No saved suggestions for this entry.'));
    return;
  }
  for (const note of notes) {
    const card = node('article','note'+(note.status === 'resolved' ? ' resolved' : ''));
    const meta = node('div','note-meta');
    meta.append(node('span','kind',note.kind),node('span','',note.target || 'entry'),
      node('time','',new Date(note.created_at).toLocaleString()));
    card.append(meta,node('p','',note.text || '(image suggestion)'));
    for (const file of note.attachments || []) {
      const figure = node('figure','attachment');
      const a = node('a');
      a.href = '/' + encodeURI(file.path);
      a.target = '_blank';
      a.rel = 'noreferrer';
      const picture = node('img');
      picture.src = a.href;
      picture.alt = file.caption || file.original_name || 'Editorial image';
      a.append(picture);
      figure.append(a,node('figcaption','',file.caption || file.original_name || file.path));
      card.append(figure);
    }
    const bottom = node('div','note-actions');
    const toggle = node('button','',note.status === 'resolved' ? 'Reopen' : 'Mark resolved');
    toggle.dataset.noteId = note.id;
    bottom.append(toggle,node('span','',note.status === 'resolved' ? 'Resolved' : 'Open'));
    card.append(bottom);
    ui.notes.append(card);
  }
}

async function saveNotes(message) {
  const result = await api('/api/reviews',{
    method:'PUT',body:JSON.stringify(state.reviews),
  });
  state.reviews.updated_at = result.updated_at;
  ui.noteState.textContent = message+' · '+new Date(result.updated_at).toLocaleTimeString();
  renderSummary();
}
function fileToDataUrl(file) {
  return new Promise((resolve,reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(reader.error);
    reader.readAsDataURL(file);
  });
}
async function addNote() {
  const term = state.terms.find((t) => t.slug === state.currentSlug);
  if (!term) return;
  const content = ui.text.value.trim(), file = ui.image.files?.[0];
  if (!content && !file) { ui.noteState.textContent = 'Write a note or attach a picture first.'; return; }
  ui.addNote.disabled = true;
  ui.noteState.textContent = 'Saving note…';
  try {
    let attachment = null;
    if (file) {
      attachment = await api('/api/upload',{method:'POST',body:JSON.stringify({
        slug:term.slug,original_name:file.name,mime_type:file.type,data:await fileToDataUrl(file),
      })});
      attachment.caption = ui.imageCaption.value.trim();
    }
    state.reviews.notes.push({
      id:crypto.randomUUID(),slug:term.slug,target:ui.target.value || 'entry',
      kind:ui.kind.value,text:content,status:'open',
      created_at:new Date().toISOString(),resolved_at:null,
      attachments:attachment ? [attachment] : [],
    });
    await saveNotes('Suggestion saved');
    renderNotes();
    ui.text.value = '';
    ui.image.value = '';
    ui.imagePreview.hidden = true;
  } catch (error) { ui.noteState.textContent = 'Could not save note: '+error.message; }
  finally { ui.addNote.disabled = false; }
}
function move(delta) {
  const index = state.visibleSlugs.indexOf(state.currentSlug);
  const slug = state.visibleSlugs[index+delta];
  if (slug) selectEntry(slug);
}
ui.batch.addEventListener('change',() => {
  state.activeBatch = ui.batch.value;
  ui.search.value = '';
  ui.filter.value = 'all';
  renderQueue({selectFirst:true});
});
ui.filter.addEventListener('change',() => renderQueue());
ui.search.addEventListener('input',() => renderQueue());
ui.search.addEventListener('change',() => {
  const value = ui.search.value.trim().toLocaleLowerCase();
  const slug = state.editorial.groups.flatMap((g) => g.slugs).find((key) =>
    key === value || state.editorial.entries[key]?.label.toLocaleLowerCase() === value);
  if (!slug) return;
  const owner = state.editorial.groups.find((g) => g.slugs.includes(slug));
  state.activeBatch = owner.id;
  ui.batch.value = owner.id;
  ui.search.value = '';
  ui.filter.value = 'all';
  selectEntry(slug);
});
ui.prev.addEventListener('click',() => move(-1));
ui.next.addEventListener('click',() => move(1));
for (const button of ui.actions)
  button.addEventListener('click',() => saveDecision(button.dataset.decision));
ui.reviewer.addEventListener('change',() => {
  try { localStorage.setItem('astro-lexicon-reviewer',ui.reviewer.value.trim()); } catch {}
});
ui.addNote.addEventListener('click',addNote);
ui.noteFilter.addEventListener('change',renderNotes);
ui.image.addEventListener('change',() => {
  const file = ui.image.files?.[0];
  ui.imagePreview.replaceChildren();
  if (!file) { ui.imagePreview.hidden = true; return; }
  ui.imagePreview.hidden = false;
  const picture = node('img');
  picture.src = URL.createObjectURL(file);
  picture.alt = 'Pending image';
  ui.imagePreview.append(picture,node('span','',file.name));
});
ui.notes.addEventListener('click',async (event) => {
  const button = event.target.closest('button[data-note-id]');
  if (!button) return;
  const note = state.reviews.notes.find((n) => n.id === button.dataset.noteId);
  if (!note) return;
  const previous = note.status;
  note.status = previous === 'resolved' ? 'open' : 'resolved';
  note.resolved_at = note.status === 'resolved' ? new Date().toISOString() : null;
  try { await saveNotes('Note status saved'); renderNotes(); }
  catch (err) {
    note.status = previous;
    ui.noteState.textContent = 'Could not update note: '+err.message;
  }
});

async function init() {
  try {
    [state.terms,state.reviews,state.editorial] = await Promise.all([
      api('/api/terms'),api('/api/reviews'),api('/api/editorial'),
    ]);
    try { ui.reviewer.value = localStorage.getItem('astro-lexicon-reviewer') || ''; } catch {}
    const params = new URL(location.href).searchParams;
    const wanted = params.get('entry'), batch = params.get('batch');
    const owner = state.editorial.groups.find((group) => group.slugs.includes(wanted));
    state.activeBatch = owner?.id ||
      state.editorial.groups.find((group) => group.id === batch)?.id || 'lots';
    for (const group of state.editorial.groups) {
      const option = node('option','',group.label+' ('+group.slugs.length+')');
      option.value = group.id;
      ui.batch.append(option);
    }
    ui.batch.value = state.activeBatch;
    const known = new Set(state.editorial.groups.flatMap((g) => g.slugs));
    for (const term of state.terms.filter((term) => known.has(term.slug))) {
      const option = node('option','',term.label);
      option.label = term.slug;
      ui.list.append(option);
    }
    renderQueue({selectFirst:true});
    if (wanted && state.editorial.entries[wanted]) selectEntry(wanted);
  } catch (error) {
    document.body.replaceChildren();
    const main = node('main','fatal');
    main.append(node('h1','','Review workbench could not start'),
      node('p','',error.message),
      node('p','','Pull the review branch and run npm run review again.'));
    document.body.append(main);
  }
}
init();
