import { defineConfig } from 'astro/config';
import cloudflare from '@astrojs/cloudflare';

const isGitHubPages = process.env.GITHUB_PAGES === 'true';

export default defineConfig({
  adapter: cloudflare(),
  output: 'static',
  site: isGitHubPages ? 'https://cybergnostic.github.io' : undefined,
  base: isGitHubPages ? '/astro-lexicon' : undefined
});
