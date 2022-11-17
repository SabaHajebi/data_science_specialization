-- Table: public.hashtags

-- DROP TABLE IF EXISTS public.hashtags;

CREATE TABLE IF NOT EXISTS public.hashtags
(
    id integer NOT NULL DEFAULT nextval('hashtags_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    title character varying(20) COLLATE pg_catalog."default" NOT NULL,
    CONSTRAINT hashtags_pkey PRIMARY KEY (id),
    CONSTRAINT hashtags_title_key UNIQUE (title)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.hashtags
    OWNER to postgres;