# awesomeem demo

Minimal Hono + Cloudflare Workers site that reads content from EmDash's D1 schema and renders it using `@awesomeem/theme-minimal`.

**What this demo shows:** `@awesomeem/emdash-render` + `@awesomeem/theme-minimal` rendering content out of D1 tables (`ec_posts`). It does **not** include EmDash itself — the `seed.sql` hand-rolls the schema EmDash would normally create, plus a handful of sample posts.

## Deploy to your own Cloudflare (free tier)

[![Deploy to Cloudflare](https://deploy.workers.cloudflare.com/button)](https://deploy.workers.cloudflare.com/?url=https://github.com/awesomeem/demo)

After clicking Deploy, Cloudflare will:

1. Fork this repo to your GitHub.
2. Create a Worker on your account.
3. Create a D1 database and wire the `DB` binding.

One manual step post-deploy — populate the database:

```bash
git clone https://github.com/<your-username>/demo
cd demo
npm install
npx wrangler d1 execute awesomeem-demo --remote --file=seed.sql
```

Open your Worker URL. You should see the seed posts rendered.

Free-tier limits (plenty for a demo): 100k requests/day on Workers, 5 GB + 25M row reads/day on D1.

## Run locally

```bash
npm install
npm run seed    # populate local D1
npm run dev     # http://localhost:8788
```

## What's NOT here

- No EmDash admin panel. Content is frozen as seeded. To edit content, see the upstream EmDash project (https://github.com/emdash-cms/emdash) and point it at the same D1.
- No auth, no draft previews — this demo reads only `status='published'`.

## License

MIT.
