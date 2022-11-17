-- Table: public.photo_tags

-- DROP TABLE IF EXISTS public.photo_tags;

CREATE TABLE IF NOT EXISTS public.photo_tags
(
    id integer NOT NULL DEFAULT nextval('photo_tags_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    user_id integer NOT NULL,
    post_id integer NOT NULL,
    x integer NOT NULL,
    y integer NOT NULL,
    CONSTRAINT photo_tags_pkey PRIMARY KEY (id),
    CONSTRAINT photo_tags_user_id_post_id_key UNIQUE (user_id, post_id),
    CONSTRAINT photo_tags_post_id_fkey FOREIGN KEY (post_id)
        REFERENCES public.posts (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT photo_tags_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.photo_tags
    OWNER to postgres;