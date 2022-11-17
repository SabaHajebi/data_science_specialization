-- Table: public.hashtags_posts

-- DROP TABLE IF EXISTS public.hashtags_posts;

CREATE TABLE IF NOT EXISTS public.hashtags_posts
(
    id integer NOT NULL DEFAULT nextval('hashtags_posts_id_seq'::regclass),
    hashtag_id integer NOT NULL,
    post_id integer NOT NULL,
    CONSTRAINT hashtags_posts_pkey PRIMARY KEY (id),
    CONSTRAINT hashtags_posts_hashtag_id_post_id_key UNIQUE (hashtag_id, post_id),
    CONSTRAINT hashtags_posts_hashtag_id_fkey FOREIGN KEY (hashtag_id)
        REFERENCES public.hashtags (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT hashtags_posts_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES public.posts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hashtags_posts
    OWNER to postgres;