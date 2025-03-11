--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    username character varying(22) NOT NULL,
    game_id integer NOT NULL,
    guesses integer
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_game_id_seq OWNER TO freecodecamp;

--
-- Name: users_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_game_id_seq OWNED BY public.users.game_id;


--
-- Name: users game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN game_id SET DEFAULT nextval('public.users_game_id_seq'::regclass);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES ('Butt', 1, NULL);
INSERT INTO public.users VALUES ('Test', 2, NULL);
INSERT INTO public.users VALUES ('Butt', 3, NULL);
INSERT INTO public.users VALUES ('Butt', 4, NULL);
INSERT INTO public.users VALUES ('Butt', 5, NULL);
INSERT INTO public.users VALUES ('Butt', 6, NULL);
INSERT INTO public.users VALUES ('Butt', 7, NULL);
INSERT INTO public.users VALUES ('Butt', 8, NULL);
INSERT INTO public.users VALUES ('Butt', 9, NULL);
INSERT INTO public.users VALUES ('Butt', 10, NULL);
INSERT INTO public.users VALUES ('Butt', 11, NULL);
INSERT INTO public.users VALUES ('Butt', 12, 3);
INSERT INTO public.users VALUES ('Butt', 13, NULL);
INSERT INTO public.users VALUES ('Butt', 14, 0);
INSERT INTO public.users VALUES ('Butt', 15, 2);
INSERT INTO public.users VALUES ('Butt', 16, 2);


--
-- Name: users_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_game_id_seq', 16, true);


--
-- PostgreSQL database dump complete
--

