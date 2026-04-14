CREATE TABLE IF NOT EXISTS "ec_posts" (
  "id" text primary key,
  "slug" text,
  "status" text default 'draft',
  "author_id" text,
  "primary_byline_id" text,
  "created_at" text,
  "updated_at" text,
  "published_at" text,
  "scheduled_at" text,
  "deleted_at" text,
  "version" integer default 1,
  "live_revision_id" text,
  "draft_revision_id" text,
  "locale" text default 'en' not null,
  "translation_group" text,
  "title" TEXT NOT NULL DEFAULT '',
  "featured_image" TEXT,
  "content" JSON,
  "excerpt" TEXT,
  UNIQUE ("slug", "locale")
);

INSERT INTO ec_posts (id,slug,status,published_at,title,content,excerpt) VALUES ('01','building-for-the-long-term','published','2026-04-12T19:08:18.483Z','Building for the Long Term','[{"_type":"block","style":"normal","children":[{"_type":"span","text":"Every few years the industry collectively decides that everything we''ve been doing is wrong. The churn is relentless."}]},{"_type":"block","style":"h2","children":[{"_type":"span","text":"What survives"}]},{"_type":"block","style":"normal","children":[{"_type":"span","text":"Clean data models survive. Clear boundaries between systems survive. Good naming survives."}]}]','The frameworks will change. What survives is the clarity of your thinking.');

INSERT INTO ec_posts (id,slug,status,published_at,title,content,excerpt) VALUES ('02','the-case-for-static','published','2026-04-12T19:08:18.543Z','The Case for Static','[{"_type":"block","style":"normal","children":[{"_type":"span","text":"The web started static, went dynamic, and is now swinging back toward static again."}]},{"_type":"block","style":"h2","children":[{"_type":"span","text":"The performance argument"}]},{"_type":"block","style":"normal","children":[{"_type":"span","text":"A static file served from a CDN is as fast as the web gets. No cold starts, no database queries."}]}]','Static sites are what you get when you take performance seriously.');

INSERT INTO ec_posts (id,slug,status,published_at,title,content,excerpt) VALUES ('03','small-tools-big-impact','published','2026-04-12T19:08:18.714Z','Small Tools, Big Impact','[{"_type":"block","style":"normal","children":[{"_type":"span","text":"There''s a class of software that doesn''t get enough appreciation. The small, sharp tools that solve one problem so well you stop thinking about them."}]},{"_type":"block","style":"h2","children":[{"_type":"span","text":"The Unix philosophy, revisited"}]},{"_type":"block","style":"normal","children":[{"_type":"span","text":"Do one thing well. The advice is old enough to be a cliche, but the best modern tools still follow it."}]}]','The best developer tools do one thing well and get out of your way.');
