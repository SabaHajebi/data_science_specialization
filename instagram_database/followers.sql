-- Table: public.followers

-- DROP TABLE IF EXISTS public.followers;

CREATE TABLE IF NOT EXISTS public.followers
(
    id integer NOT NULL DEFAULT nextval('followers_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    leader_id integer NOT NULL,
    follower_id integer NOT NULL,
    CONSTRAINT followers_pkey PRIMARY KEY (id),
    CONSTRAINT followers_leader_id_follower_id_key UNIQUE (leader_id, follower_id),
    CONSTRAINT followers_follower_id_fkey FOREIGN KEY (follower_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT followers_leader_id_fkey FOREIGN KEY (leader_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.followers
    OWNER to postgres;