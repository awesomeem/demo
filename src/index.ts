import { Hono } from "hono";
import { getPosts, getPostBySlug } from "@awesomeem/emdash-render";
import { layout, postCard, postDetail } from "@awesomeem/theme-minimal";

type Bindings = { DB: D1Database };

const app = new Hono<{ Bindings: Bindings }>();

const EMPTY_STATE = `<p style="color:#666;text-align:center;padding:2rem 0">
No posts yet. Seed the database: <code>npm run seed:remote</code>.
</p>`;

app.get("/", async (c) => {
  const posts = await getPosts(c.env.DB);
  const body = posts.length ? posts.map(postCard).join("\n") : EMPTY_STATE;
  return c.html(layout("Home", body));
});

app.get("/posts/:slug", async (c) => {
  const slug = c.req.param("slug");
  if (!slug) return c.notFound();
  const post = await getPostBySlug(c.env.DB, slug);
  if (!post) return c.text("Not found", 404);
  return c.html(layout(post.title, postDetail(post)));
});

export default app;
