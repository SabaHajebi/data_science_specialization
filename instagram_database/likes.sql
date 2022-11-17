-- Table: public.likes

-- DROP TABLE IF EXISTS public.likes;

CREATE TABLE IF NOT EXISTS public.likes
(
    id integer NOT NULL DEFAULT nextval('likes_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer NOT NULL,
    post_id integer,
    comment_id integer,
    CONSTRAINT likes_pkey PRIMARY KEY (id),
    CONSTRAINT likes_user_id_post_id_comment_id_key UNIQUE (user_id, post_id, comment_id),
    CONSTRAINT likes_comment_id_fkey FOREIGN KEY (comment_id)
        REFERENCES public.comments (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT likes_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES public.posts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT likes_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT likes_check CHECK ((COALESCE(post_id::boolean::integer, 0) + COALESCE(comment_id::boolean::integer, 0)) = 1)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.likes
    OWNER to postgres;