-- Table: public.users

-- DROP TABLE IF EXISTS public.users;

CREATE TABLE IF NOT EXISTS public.users
(
    id integer NOT NULL DEFAULT nextval('users_id_seq'::regclass),
    created_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    updated_at timestamp with time zone DEFAULT CURRENT_TIMESTAMP,
    username character varying(30) COLLATE pg_catalog."default" NOT NULL,
    bio character varying(400) COLLATE pg_catalog."default",
    avatar character varying(200) COLLATE pg_catalog."default",
    phone character varying(25) COLLATE pg_catalog."default",
    email character varying(40) COLLATE pg_catalog."default",
    password character varying(50) COLLATE pg_catalog."default",
    status character varying(15) COLLATE pg_catalog."default",
    CONSTRAINT users_pkey PRIMARY KEY (id),
    CONSTRAINT users_check CHECK (COALESCE(phone, email) IS NOT NULL)
)

TABLESPACE pg_default;

ALTER TABLE IF EXISTS public.users
    OWNER to postgres;