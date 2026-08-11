const state = {
  terms: [],
  reviews: null,
  currentSlug: null,
  pendingAttachment: null,
};

const $ = (selector) => document.querySelector(selector);
const els = {
  summary: $('#summary'),
  search: $('#entry-search'),
  list: $('#entry-list'),
  prev: $('#prev'),
  next: $('#next'),
  openPublic: $('#open-public'),
  preview: $('#preview'),
  previewTitle: $('#preview-title'),
  reviewTitle: $('#review-title'),
  statusButtons: $('#status-buttons'),
  target: $('#target'),
  kind: $('#kind'),
  text: $('#note-text'),
  image: $('#image-input'),
  imageCaption: $('#image-caption'),
  pendingImage: $('#pending-image'),
  addNote: $('#add-note'),
  saveState: $('#save-state'),
  notes: $('#notes'),
  filter: $('#note-filter'),
};

function uid() {
  return crypto.randomUUID();
}

function currentTerm() {
  return state.terms.find((term) => term.slug === state.currentSlug) || null;
}

function statusFor(slug) {
  return state.reviews.entry_status[slug] || 'unreviewed';
}

function notesFor(slug) {
  return state.reviews.notes
    .filter((note) => note.slug === slug)
    .sort((a, b) => new Date(b.created_at) - new Date(a.created_at));
}

function publicUrl(slug) {
  return `http://127.0.0.1:4321/terms/${slug}/`;
}

async function api(url, options = {}) {
  const response = await fetch(url, {
    ...options,
    headers: {
      'content-type': 'application/json',
      ...(options.headers || {}),
    },
  });
  const payload = await response.json();
  if (!response.ok) throw new Error(payload.error || `Request failed: ${response.status}`);
  return payload;
}

async function saveReviews(message = 'Saved') {
  els.saveState.textContent = 'Saving…';
  try {
    const result = await api('/api/reviews', {
      method: 'PUT',
      body: JSON.stringify(state.reviews),
    });
    state.reviews.updated_at = result.updated_at;
    els.saveState.textContent = `${message} · ${new Date(result.updated_at).toLocaleTimeString()}`;
    renderSummary();
  } catch (error) {
    els.saveState.textContent = `Save failed: ${error.message}`;
  }
}

function renderSummary() {
  const statuses = Object.values(state.reviews.entry_status);
  const reviewed = statuses.filter((status) => status === 'reviewed').length;
  const needsWork = statuses.filter((status) => status === 'needs-work').length;
  const open = state.reviews.notes.filter((note) => note.status !== 'resolved').length;
  els.summary.innerHTML = `
    <span><strong>${reviewed}</strong> reviewed</span>
    <span><strong>${needsWork}</strong> needs work</span>
    <span><strong>${open}</strong> open suggestions</span>
    <span><strong>${state.terms.length}</strong> entries</span>
  `;
}

function setCurrentEntry(slug, { push = true } = {}) {
  const term = state.terms.find((item) => item.slug === slug);
  if (!term) return;
  state.currentSlug = slug;
  els.search.value = term.label;
  els.previewTitle.textContent = term.label;
  els.reviewTitle.textContent = term.label;
  els.preview.src = publicUrl(slug);
  els.openPublic.href = publicUrl(slug);

  els.target.innerHTML = '';
  for (const target of term.targets) {
    const option = document.createElement('option');
    option.value = target.value;
    option.textContent = target.label;
    els.target.append(option);
  }

  if (push) {
    const url = new URL(location.href);
    url.searchParams.set('entry', slug);
    history.replaceState(null, '', url);
  }

  renderStatus();
  renderNotes();
  resetComposer();
}

function renderStatus() {
  const status = statusFor(state.currentSlug);
  for (const button of els.statusButtons.querySelectorAll('button')) {
    button.classList.toggle('active', button.dataset.status === status);
  }
}

function targetLabel(note) {
  const term = currentTerm();
  return term?.targets.find((target) => target.value === note.target)?.label || note.target || 'Whole entry';
}

function renderNotes() {
  const filter = els.filter.value;
  const notes = notesFor(state.currentSlug).filter((note) => {
    if (filter === 'open') return note.status !== 'resolved';
    if (filter === 'resolved') return note.status === 'resolved';
    return true;
  });

  els.notes.innerHTML = '';
  if (!notes.length) {
    els.notes.innerHTML = '<p class="empty">No saved suggestions for this entry.</p>';
    return;
  }

  for (const note of notes) {
    const card = document.createElement('article');
    card.className = `note ${note.status === 'resolved' ? 'resolved' : ''}`;
    const attachments = (note.attachments || []).map((attachment) => `
      <figure class="attachment">
        <a href="/${attachment.path}" target="_blank" rel="noreferrer">
          <img src="/${attachment.path}" alt="${escapeHtml(attachment.caption || attachment.original_name || 'Editorial image suggestion')}" />
        </a>
        <figcaption>${escapeHtml(attachment.caption || attachment.original_name || attachment.path)}</figcaption>
        <code>${escapeHtml(attachment.path)}</code>
      </figure>
    `).join('');
    card.innerHTML = `
      <div class="note-meta">
        <span class="kind">${escapeHtml(note.kind)}</span>
        <span>${escapeHtml(targetLabel(note))}</span>
        <time>${new Date(note.created_at).toLocaleString()}</time>
      </div>
      <p>${escapeHtml(note.text || '(image suggestion)')}</p>
      ${attachments}
      <div class="note-actions">
        <button type="button" data-note-id="${note.id}" data-action="toggle">${note.status === 'resolved' ? 'Reopen' : 'Mark resolved'}</button>
        <span>${note.status === 'resolved' ? 'Resolved' : 'Open'}</span>
      </div>
    `;
    els.notes.append(card);
  }
}

function escapeHtml(value) {
  return String(value ?? '')
    .replaceAll('&', '&amp;')
    .replaceAll('<', '&lt;')
    .replaceAll('>', '&gt;')
    .replaceAll('"', '&quot;')
    .replaceAll("'", '&#039;');
}

function resetComposer() {
  els.text.value = '';
  els.image.value = '';
  els.imageCaption.value = '';
  state.pendingAttachment = null;
  els.pendingImage.hidden = true;
  els.pendingImage.innerHTML = '';
}

async function uploadSelectedImage() {
  const file = els.image.files?.[0];
  if (!file) return null;
  els.saveState.textContent = 'Saving image…';
  const data = await fileToDataUrl(file);
  const uploaded = await api('/api/upload', {
    method: 'POST',
    body: JSON.stringify({
      slug: state.currentSlug,
      original_name: file.name,
      mime_type: file.type,
      data,
    }),
  });
  uploaded.caption = els.imageCaption.value.trim();
  return uploaded;
}

function fileToDataUrl(file) {
  return new Promise((resolve, reject) => {
    const reader = new FileReader();
    reader.onload = () => resolve(reader.result);
    reader.onerror = () => reject(reader.error);
    reader.readAsDataURL(file);
  });
}

async function addNote() {
  const term = currentTerm();
  if (!term) return;
  const text = els.text.value.trim();
  if (!text && !els.image.files?.[0]) {
    els.saveState.textContent = 'Write a suggestion or attach a picture first.';
    return;
  }

  els.addNote.disabled = true;
  try {
    const attachment = await uploadSelectedImage();
    state.reviews.notes.push({
      id: uid(),
      slug: term.slug,
      target: els.target.value || 'entry',
      kind: els.kind.value,
      text,
      status: 'open',
      created_at: new Date().toISOString(),
      resolved_at: null,
      attachments: attachment ? [attachment] : [],
    });
    if (statusFor(term.slug) === 'unreviewed') state.reviews.entry_status[term.slug] = 'needs-work';
    await saveReviews('Suggestion saved');
    renderStatus();
    renderNotes();
    resetComposer();
  } catch (error) {
    els.saveState.textContent = `Could not save: ${error.message}`;
  } finally {
    els.addNote.disabled = false;
  }
}

function moveEntry(delta) {
  const index = state.terms.findIndex((term) => term.slug === state.currentSlug);
  if (index < 0) return;
  const next = Math.min(state.terms.length - 1, Math.max(0, index + delta));
  setCurrentEntry(state.terms[next].slug);
}

els.statusButtons.addEventListener('click', async (event) => {
  const button = event.target.closest('button[data-status]');
  if (!button || !state.currentSlug) return;
  state.reviews.entry_status[state.currentSlug] = button.dataset.status;
  renderStatus();
  await saveReviews('Status saved');
});

els.addNote.addEventListener('click', addNote);
els.prev.addEventListener('click', () => moveEntry(-1));
els.next.addEventListener('click', () => moveEntry(1));
els.filter.addEventListener('change', renderNotes);

els.search.addEventListener('change', () => {
  const query = els.search.value.trim().toLowerCase();
  const exact = state.terms.find((term) => term.label.toLowerCase() === query || term.slug === query);
  const partial = state.terms.find((term) => term.label.toLowerCase().includes(query));
  if (exact || partial) setCurrentEntry((exact || partial).slug);
});

els.image.addEventListener('change', () => {
  const file = els.image.files?.[0];
  if (!file) {
    els.pendingImage.hidden = true;
    return;
  }
  const url = URL.createObjectURL(file);
  els.pendingImage.hidden = false;
  els.pendingImage.innerHTML = `<img src="${url}" alt="Pending image suggestion" /><span>${escapeHtml(file.name)}</span>`;
});

els.notes.addEventListener('click', async (event) => {
  const button = event.target.closest('button[data-note-id]');
  if (!button) return;
  const note = state.reviews.notes.find((item) => item.id === button.dataset.noteId);
  if (!note) return;
  if (note.status === 'resolved') {
    note.status = 'open';
    note.resolved_at = null;
  } else {
    note.status = 'resolved';
    note.resolved_at = new Date().toISOString();
  }
  await saveReviews(note.status === 'resolved' ? 'Suggestion resolved' : 'Suggestion reopened');
  renderNotes();
});

async function init() {
  try {
    [state.terms, state.reviews] = await Promise.all([
      api('/api/terms'),
      api('/api/reviews'),
    ]);
    state.terms.sort((a, b) => a.label.localeCompare(b.label));
    for (const term of state.terms) {
      const option = document.createElement('option');
      option.value = term.label;
      option.label = term.slug;
      els.list.append(option);
    }
    renderSummary();
    const requested = new URL(location.href).searchParams.get('entry');
    const initial = state.terms.find((term) => term.slug === requested) || state.terms[0];
    if (initial) setCurrentEntry(initial.slug, { push: Boolean(requested) });
  } catch (error) {
    document.body.innerHTML = `<main class="fatal"><h1>Editorial workbench could not start</h1><p>${escapeHtml(error.message)}</p><p>Run <code>npm run generate:data</code> and try again.</p></main>`;
  }
}

init();
