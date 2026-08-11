import http from 'node:http';
import { readFile, writeFile, mkdir, rename, stat } from 'node:fs/promises';
import { extname, join, normalize, relative, resolve } from 'node:path';
import crypto from 'node:crypto';
import { fileURLToPath } from 'node:url';

const ROOT = resolve(fileURLToPath(new URL('..', import.meta.url)));
const APP_ROOT = join(ROOT, 'editorial', 'app');
const REVIEW_FILE = join(ROOT, 'editorial', 'reviews.json');
const ASSET_ROOT = join(ROOT, 'editorial', 'review-assets');
const CORPUS_FILE = join(ROOT, 'src', 'data', 'generated', 'corpus.json');
const HOST = process.env.EDITORIAL_HOST || '127.0.0.1';
const PORT = Number(process.env.EDITORIAL_PORT || 4322);
const MAX_BODY = 16 * 1024 * 1024;
const IMAGE_MIME = new Map([
  ['image/png', '.png'],
  ['image/jpeg', '.jpg'],
  ['image/webp', '.webp'],
]);

await mkdir(ASSET_ROOT, { recursive: true });

function send(res, statusCode, body, contentType = 'application/json; charset=utf-8') {
  res.writeHead(statusCode, {
    'content-type': contentType,
    'cache-control': 'no-store',
    'x-content-type-options': 'nosniff',
  });
  res.end(body);
}

function json(res, statusCode, value) {
  send(res, statusCode, JSON.stringify(value, null, 2));
}

async function readJson(path) {
  return JSON.parse(await readFile(path, 'utf8'));
}

async function readBody(req) {
  const chunks = [];
  let total = 0;
  for await (const chunk of req) {
    total += chunk.length;
    if (total > MAX_BODY) throw new Error('Request body is too large.');
    chunks.push(chunk);
  }
  return Buffer.concat(chunks).toString('utf8');
}

function safeSlug(value) {
  const slug = String(value || '').trim().toLowerCase();
  if (!/^[a-z0-9][a-z0-9-]*$/.test(slug)) throw new Error('Invalid entry slug.');
  return slug;
}

function safeStaticPath(root, pathname) {
  const requested = normalize(pathname).replace(/^([/\\])+/, '');
  const full = resolve(root, requested);
  const rel = relative(root, full);
  if (rel.startsWith('..') || rel === '') return rel === '' ? root : null;
  return full;
}

function contentTypeFor(path) {
  switch (extname(path).toLowerCase()) {
    case '.html': return 'text/html; charset=utf-8';
    case '.css': return 'text/css; charset=utf-8';
    case '.js': return 'text/javascript; charset=utf-8';
    case '.png': return 'image/png';
    case '.jpg': case '.jpeg': return 'image/jpeg';
    case '.webp': return 'image/webp';
    default: return 'application/octet-stream';
  }
}

async function writeReviewsAtomic(payload) {
  if (!payload || payload.version !== 1 || !Array.isArray(payload.notes) || typeof payload.entry_status !== 'object') {
    throw new Error('Invalid review-store payload.');
  }
  payload.updated_at = new Date().toISOString();
  const tmp = `${REVIEW_FILE}.tmp`;
  await writeFile(tmp, `${JSON.stringify(payload, null, 2)}\n`, 'utf8');
  await rename(tmp, REVIEW_FILE);
}

async function termsPayload() {
  const corpus = await readJson(CORPUS_FILE);
  return corpus.terms.map((term) => {
    const targets = [
      { value: 'entry', label: 'Whole entry' },
      { value: 'definition', label: 'Short definition' },
    ];
    if (term.article?.intro) targets.push({ value: 'overview', label: 'Overview' });
    for (const block of term.article?.blocks ?? []) {
      const key = block.section_key || block.table_key || crypto.randomUUID();
      targets.push({ value: `${block.type || 'section'}:${key}`, label: block.heading || key });
    }
    if (term.page_composition?.length) {
      for (const section of term.page_composition) {
        const value = `page:${section.section_key}`;
        if (!targets.some((target) => target.value === value)) {
          targets.push({ value, label: section.heading || section.section_key });
        }
      }
    }
    targets.push(
      { value: 'visual', label: 'Diagram / visual' },
      { value: 'sources', label: 'Sources' },
      { value: 'related', label: 'Related concepts' },
      { value: 'frontend', label: 'Frontend / layout' },
    );
    return {
      slug: term.slug,
      label: term.label,
      category: term.category,
      short_definition: term.short_definition,
      targets,
    };
  });
}

async function handleUpload(req, res) {
  const payload = JSON.parse(await readBody(req));
  const slug = safeSlug(payload.slug);
  const mime = String(payload.mime_type || '');
  const extension = IMAGE_MIME.get(mime);
  if (!extension) throw new Error('Only PNG, JPEG, and WebP images are accepted.');
  const raw = String(payload.data || '');
  const match = raw.match(/^data:[^;]+;base64,(.+)$/s);
  if (!match) throw new Error('Invalid image payload.');
  const bytes = Buffer.from(match[1], 'base64');
  if (!bytes.length || bytes.length > 12 * 1024 * 1024) throw new Error('Image must be between 1 byte and 12 MB.');
  const directory = join(ASSET_ROOT, slug);
  await mkdir(directory, { recursive: true });
  const id = crypto.randomUUID();
  const filename = `${Date.now()}-${id.slice(0, 8)}${extension}`;
  const diskPath = join(directory, filename);
  await writeFile(diskPath, bytes);
  const projectPath = relative(ROOT, diskPath).replaceAll('\\', '/');
  json(res, 201, {
    id,
    path: projectPath,
    url: `/review-assets/${slug}/${filename}`,
    original_name: String(payload.original_name || filename),
    mime_type: mime,
    size: bytes.length,
  });
}

async function serveFile(res, path) {
  try {
    const info = await stat(path);
    if (!info.isFile()) return false;
    send(res, 200, await readFile(path), contentTypeFor(path));
    return true;
  } catch {
    return false;
  }
}

async function serveReviewAsset(res, pathname) {
  const clean = pathname
    .replace(/^\/editorial\/review-assets\//, '')
    .replace(/^\/review-assets\//, '');
  const path = safeStaticPath(ASSET_ROOT, clean);
  if (path && await serveFile(res, path)) return true;
  return false;
}

const server = http.createServer(async (req, res) => {
  try {
    const url = new URL(req.url, `http://${req.headers.host || `${HOST}:${PORT}`}`);

    if (req.method === 'GET' && url.pathname === '/api/terms') {
      return json(res, 200, await termsPayload());
    }
    if (req.method === 'GET' && url.pathname === '/api/reviews') {
      return json(res, 200, await readJson(REVIEW_FILE));
    }
    if (req.method === 'PUT' && url.pathname === '/api/reviews') {
      const payload = JSON.parse(await readBody(req));
      await writeReviewsAtomic(payload);
      return json(res, 200, { ok: true, updated_at: payload.updated_at });
    }
    if (req.method === 'POST' && url.pathname === '/api/upload') {
      return await handleUpload(req, res);
    }
    if (req.method === 'GET' && (url.pathname.startsWith('/review-assets/') || url.pathname.startsWith('/editorial/review-assets/'))) {
      if (await serveReviewAsset(res, url.pathname)) return;
      return json(res, 404, { error: 'Image not found.' });
    }

    if (req.method === 'GET') {
      const pathname = url.pathname === '/' ? 'index.html' : url.pathname.slice(1);
      const path = safeStaticPath(APP_ROOT, pathname);
      if (path && await serveFile(res, path)) return;
    }

    json(res, 404, { error: 'Not found.' });
  } catch (error) {
    console.error(error);
    json(res, 400, { error: error instanceof Error ? error.message : String(error) });
  }
});

server.listen(PORT, HOST, () => {
  console.log(`Editorial review workbench: http://${HOST}:${PORT}`);
  console.log('Public preview remains separate. Run `npm run dev` in another terminal for the live entry iframe.');
  console.log(`Review data: ${relative(ROOT, REVIEW_FILE)}`);
  console.log(`Image suggestions: ${relative(ROOT, ASSET_ROOT)}/`);
});
