import { Hono } from "hono";
import { getPosts, getPostBySlug } from "@awesomeem/emdash-render";
import { layout, postCard, postDetail } from "@awesomeem/theme-minimal";

type Bindings = { DB: D1Database };

const app = new Hono<{ Bindings: Bindings }>();

app.get("/", async (c) => {
  const posts = await getPosts(c.env.DB);
  return c.html(layout("Home", posts.map(postCard).join("\n")));
});

app.get("/posts/:slug", async (c) => {
  const post = await getPostBySlug(c.env.DB, c.req.param("slug"));
  if (!post) return c.text("Not found", 404);
  return c.html(layout(post.title, postDetail(post)));
});

export default app;
