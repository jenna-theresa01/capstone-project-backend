--
-- PostgreSQL database dump
--

-- Dumped from database version 16.1 (Debian 16.1-1.pgdg120+1)
-- Dumped by pg_dump version 16.1 (Debian 16.1-1.pgdg120+1)

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: creature_types; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creature_types (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.creature_types OWNER TO postgres;

--
-- Name: creature_types_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creature_types_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.creature_types_id_seq OWNER TO postgres;

--
-- Name: creature_types_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creature_types_id_seq OWNED BY public.creature_types.id;


--
-- Name: creatures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.creatures (
    id integer NOT NULL,
    name character varying,
    location_id integer,
    image_url character varying,
    shadow_size character varying,
    sell_nook integer,
    creature_type_id integer,
    hemisphere_id integer
);


ALTER TABLE public.creatures OWNER TO postgres;

--
-- Name: creatures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.creatures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.creatures_id_seq OWNER TO postgres;

--
-- Name: creatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.creatures_id_seq OWNED BY public.creatures.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    id integer NOT NULL,
    name character varying,
    date timestamp without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.events_id_seq OWNER TO postgres;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_id_seq OWNED BY public.events.id;


--
-- Name: hemispheres; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hemispheres (
    id integer NOT NULL,
    name character varying,
    month character varying,
    time_of_day character varying
);


ALTER TABLE public.hemispheres OWNER TO postgres;

--
-- Name: hemispheres_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hemispheres_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hemispheres_id_seq OWNER TO postgres;

--
-- Name: hemispheres_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hemispheres_id_seq OWNED BY public.hemispheres.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.locations (
    id integer NOT NULL,
    name character varying
);


ALTER TABLE public.locations OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.locations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.locations_id_seq OWNER TO postgres;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.locations_id_seq OWNED BY public.locations.id;


--
-- Name: tokens; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tokens (
    id integer NOT NULL,
    token_type character varying,
    access_token character varying,
    expires timestamp without time zone
);


ALTER TABLE public.tokens OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tokens_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.tokens_id_seq OWNER TO postgres;

--
-- Name: tokens_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tokens_id_seq OWNED BY public.tokens.id;


--
-- Name: user_caught_creatures; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.user_caught_creatures (
    id integer NOT NULL,
    creature_id integer,
    user_caught_id integer
);


ALTER TABLE public.user_caught_creatures OWNER TO postgres;

--
-- Name: user_caught_creatures_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.user_caught_creatures_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.user_caught_creatures_id_seq OWNER TO postgres;

--
-- Name: user_caught_creatures_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.user_caught_creatures_id_seq OWNED BY public.user_caught_creatures.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    id integer NOT NULL,
    email character varying NOT NULL,
    hashed_password character varying NOT NULL,
    is_active boolean,
    is_superuser boolean,
    username character varying
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.users_id_seq OWNER TO postgres;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_id_seq OWNED BY public.users.id;


--
-- Name: creature_types id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creature_types ALTER COLUMN id SET DEFAULT nextval('public.creature_types_id_seq'::regclass);


--
-- Name: creatures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creatures ALTER COLUMN id SET DEFAULT nextval('public.creatures_id_seq'::regclass);


--
-- Name: events id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN id SET DEFAULT nextval('public.events_id_seq'::regclass);


--
-- Name: hemispheres id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemispheres ALTER COLUMN id SET DEFAULT nextval('public.hemispheres_id_seq'::regclass);


--
-- Name: locations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations ALTER COLUMN id SET DEFAULT nextval('public.locations_id_seq'::regclass);


--
-- Name: tokens id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens ALTER COLUMN id SET DEFAULT nextval('public.tokens_id_seq'::regclass);


--
-- Name: user_caught_creatures id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_caught_creatures ALTER COLUMN id SET DEFAULT nextval('public.user_caught_creatures_id_seq'::regclass);


--
-- Name: users id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN id SET DEFAULT nextval('public.users_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
95bc72b82150
\.


--
-- Data for Name: creature_types; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creature_types (id, name) FROM stdin;
1	Fish
\.


--
-- Data for Name: creatures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.creatures (id, name, location_id, image_url, shadow_size, sell_nook, creature_type_id, hemisphere_id) FROM stdin;
1	Goldfish	1	someurl.com	tiny	500	1	1
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (id, name, date) FROM stdin;
\.


--
-- Data for Name: hemispheres; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hemispheres (id, name, month, time_of_day) FROM stdin;
1	Southern	December	all day
\.


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.locations (id, name) FROM stdin;
1	River
\.


--
-- Data for Name: tokens; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tokens (id, token_type, access_token, expires) FROM stdin;
1	bearer	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDI1OTM3MzUsInN1YiI6IjEifQ.onETQ1n5DmaUicegU_E6F_Ebz4z3IaUGXDwUpQeWRok	2024-01-05 22:42:15.924048
2	bearer	eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE3MDMwMTczODAsInN1YiI6IjIifQ._5PfzSWSRcDoTpQsPOQmOdX9tb-ZOWSxr2PPjcRIgMM	2024-01-10 20:23:00.668671
\.


--
-- Data for Name: user_caught_creatures; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.user_caught_creatures (id, creature_id, user_caught_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (id, email, hashed_password, is_active, is_superuser, username) FROM stdin;
1	jenna@jenna.com	$2b$12$PlWeQGvEi99d2Dj9/WBKWeT9KbwwsGEk/iKvxfIQ5fGw/ACUAWG2O	t	f	jenna
2	jenna@test.com	$2b$12$PaIP9.JEbWYqtxn9P/ctDOSPBh7RJY5D1kLWd9eaE1w2DaaOyu0R2	t	f	jenna@test.com
\.


--
-- Name: creature_types_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creature_types_id_seq', 1, true);


--
-- Name: creatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.creatures_id_seq', 33, true);


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_id_seq', 1, false);


--
-- Name: hemispheres_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hemispheres_id_seq', 1, true);


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.locations_id_seq', 1, true);


--
-- Name: tokens_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tokens_id_seq', 2, true);


--
-- Name: user_caught_creatures_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.user_caught_creatures_id_seq', 1, false);


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_id_seq', 2, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: creature_types creature_types_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creature_types
    ADD CONSTRAINT creature_types_pkey PRIMARY KEY (id);


--
-- Name: creatures creatures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_pkey PRIMARY KEY (id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: hemispheres hemispheres_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hemispheres
    ADD CONSTRAINT hemispheres_pkey PRIMARY KEY (id);


--
-- Name: locations locations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: tokens tokens_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tokens
    ADD CONSTRAINT tokens_pkey PRIMARY KEY (id);


--
-- Name: user_caught_creatures user_caught_creatures_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_caught_creatures
    ADD CONSTRAINT user_caught_creatures_pkey PRIMARY KEY (id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: ix_creature_types_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_creature_types_id ON public.creature_types USING btree (id);


--
-- Name: ix_creatures_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_creatures_id ON public.creatures USING btree (id);


--
-- Name: ix_creatures_name; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_creatures_name ON public.creatures USING btree (name);


--
-- Name: ix_events_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_events_id ON public.events USING btree (id);


--
-- Name: ix_hemispheres_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_hemispheres_id ON public.hemispheres USING btree (id);


--
-- Name: ix_locations_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_locations_id ON public.locations USING btree (id);


--
-- Name: ix_tokens_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_tokens_id ON public.tokens USING btree (id);


--
-- Name: ix_user_caught_creatures_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_user_caught_creatures_id ON public.user_caught_creatures USING btree (id);


--
-- Name: ix_users_email; Type: INDEX; Schema: public; Owner: postgres
--

CREATE UNIQUE INDEX ix_users_email ON public.users USING btree (email);


--
-- Name: ix_users_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_id ON public.users USING btree (id);


--
-- Name: ix_users_username; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX ix_users_username ON public.users USING btree (username);


--
-- Name: creatures creatures_creature_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_creature_type_id_fkey FOREIGN KEY (creature_type_id) REFERENCES public.creature_types(id);


--
-- Name: creatures creatures_hemisphere_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_hemisphere_id_fkey FOREIGN KEY (hemisphere_id) REFERENCES public.hemispheres(id);


--
-- Name: creatures creatures_location_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.creatures
    ADD CONSTRAINT creatures_location_id_fkey FOREIGN KEY (location_id) REFERENCES public.locations(id);


--
-- Name: user_caught_creatures user_caught_creatures_creature_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_caught_creatures
    ADD CONSTRAINT user_caught_creatures_creature_id_fkey FOREIGN KEY (creature_id) REFERENCES public.creatures(id);


--
-- Name: user_caught_creatures user_caught_creatures_user_caught_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.user_caught_creatures
    ADD CONSTRAINT user_caught_creatures_user_caught_id_fkey FOREIGN KEY (user_caught_id) REFERENCES public.users(id);


--
-- PostgreSQL database dump complete
--

