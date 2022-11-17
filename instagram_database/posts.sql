-- Table: public.posts

-- DROP TABLE IF EXISTS public.posts;

CREATE TABLE IF NOT EXISTS public.posts
(
    id integer NOT NULL DEFAULT nextval('posts_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    url character varying(200) COLLATE pg_catalog."default" NOT NULL,
    caption character varying(240) COLLATE pg_catalog."default",
    lat real,
    lng real,
    user_id integer NOT NULL,
    CONSTRAINT posts_pkey PRIMARY KEY (id),
    CONSTRAINT posts_user_id_fkey FOREIGN KEY (user_id)
        REFERENCES public.users (id) MATCH SIMPLE
        ON UPDATE NO ACTION
        ON DELETE CASCADE,
    CONSTRAINT posts_lat_check CHECK (lat IS NULL OR lat >= '-90'::integer::double precision AND lat <= 90::double precision),
    CONSTRAINT posts_lng_check CHECK (lng IS NULL OR lng >= '-180'::integer::double precision AND lng <= 180::double precision)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.posts
    OWNER to postgres;