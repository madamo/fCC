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

DROP DATABASE worldcup;
--
-- Name: worldcup; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE worldcup WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE worldcup OWNER TO freecodecamp;

\connect worldcup

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    year integer NOT NULL,
    round character varying NOT NULL,
    winner_id integer NOT NULL,
    opponent_id integer NOT NULL,
    winner_goals integer NOT NULL,
    opponent_goals integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: teams; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.teams (
    team_id integer NOT NULL,
    name character varying(30) NOT NULL
);


ALTER TABLE public.teams OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.teams_team_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teams_team_id_seq OWNER TO freecodecamp;

--
-- Name: teams_team_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.teams_team_id_seq OWNED BY public.teams.team_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: teams team_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams ALTER COLUMN team_id SET DEFAULT nextval('public.teams_team_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (257, 2018, 'Final', 1, 3, 4, 2);
INSERT INTO public.games VALUES (258, 2018, 'Third Place', 2, 4, 2, 0);
INSERT INTO public.games VALUES (259, 2018, 'Semi-Final', 3, 4, 2, 1);
INSERT INTO public.games VALUES (260, 2018, 'Semi-Final', 1, 2, 1, 0);
INSERT INTO public.games VALUES (261, 2018, 'Quarter-Final', 3, 7, 3, 2);
INSERT INTO public.games VALUES (262, 2018, 'Quarter-Final', 4, 5, 2, 0);
INSERT INTO public.games VALUES (263, 2018, 'Quarter-Final', 2, 6, 2, 1);
INSERT INTO public.games VALUES (264, 2018, 'Quarter-Final', 1, 8, 2, 0);
INSERT INTO public.games VALUES (265, 2018, 'Eighth-Final', 4, 12, 2, 1);
INSERT INTO public.games VALUES (266, 2018, 'Eighth-Final', 5, 14, 1, 0);
INSERT INTO public.games VALUES (267, 2018, 'Eighth-Final', 2, 15, 3, 2);
INSERT INTO public.games VALUES (268, 2018, 'Eighth-Final', 6, 16, 2, 0);
INSERT INTO public.games VALUES (269, 2018, 'Eighth-Final', 3, 17, 2, 1);
INSERT INTO public.games VALUES (270, 2018, 'Eighth-Final', 7, 18, 2, 1);
INSERT INTO public.games VALUES (271, 2018, 'Eighth-Final', 8, 19, 2, 1);
INSERT INTO public.games VALUES (272, 2018, 'Eighth-Final', 1, 11, 4, 3);
INSERT INTO public.games VALUES (273, 2014, 'Final', 9, 11, 1, 0);
INSERT INTO public.games VALUES (274, 2014, 'Third Place', 10, 6, 3, 0);
INSERT INTO public.games VALUES (275, 2014, 'Semi-Final', 11, 10, 1, 0);
INSERT INTO public.games VALUES (276, 2014, 'Semi-Final', 9, 6, 7, 1);
INSERT INTO public.games VALUES (277, 2014, 'Quarter-Final', 10, 13, 1, 0);
INSERT INTO public.games VALUES (278, 2014, 'Quarter-Final', 11, 2, 1, 0);
INSERT INTO public.games VALUES (279, 2014, 'Quarter-Final', 6, 12, 2, 1);
INSERT INTO public.games VALUES (280, 2014, 'Quarter-Final', 9, 1, 1, 0);
INSERT INTO public.games VALUES (281, 2014, 'Eighth-Final', 6, 20, 2, 1);
INSERT INTO public.games VALUES (282, 2014, 'Eighth-Final', 12, 8, 2, 0);
INSERT INTO public.games VALUES (283, 2014, 'Eighth-Final', 1, 21, 2, 0);
INSERT INTO public.games VALUES (284, 2014, 'Eighth-Final', 9, 22, 2, 1);
INSERT INTO public.games VALUES (285, 2014, 'Eighth-Final', 10, 16, 2, 1);
INSERT INTO public.games VALUES (286, 2014, 'Eighth-Final', 13, 23, 2, 1);
INSERT INTO public.games VALUES (287, 2014, 'Eighth-Final', 11, 14, 1, 0);
INSERT INTO public.games VALUES (288, 2014, 'Eighth-Final', 2, 24, 2, 1);


--
-- Data for Name: teams; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.teams VALUES (1, 'France');
INSERT INTO public.teams VALUES (2, 'Belgium');
INSERT INTO public.teams VALUES (3, 'Croatia');
INSERT INTO public.teams VALUES (4, 'England');
INSERT INTO public.teams VALUES (5, 'Sweden');
INSERT INTO public.teams VALUES (6, 'Brazil');
INSERT INTO public.teams VALUES (7, 'Russia');
INSERT INTO public.teams VALUES (8, 'Uruguay');
INSERT INTO public.teams VALUES (9, 'Germany');
INSERT INTO public.teams VALUES (10, 'Netherlands');
INSERT INTO public.teams VALUES (11, 'Argentina');
INSERT INTO public.teams VALUES (12, 'Colombia');
INSERT INTO public.teams VALUES (13, 'Costa Rica');
INSERT INTO public.teams VALUES (14, 'Switzerland');
INSERT INTO public.teams VALUES (15, 'Japan');
INSERT INTO public.teams VALUES (16, 'Mexico');
INSERT INTO public.teams VALUES (17, 'Denmark');
INSERT INTO public.teams VALUES (18, 'Spain');
INSERT INTO public.teams VALUES (19, 'Portugal');
INSERT INTO public.teams VALUES (20, 'Chile');
INSERT INTO public.teams VALUES (21, 'Nigeria');
INSERT INTO public.teams VALUES (22, 'Algeria');
INSERT INTO public.teams VALUES (23, 'Greece');
INSERT INTO public.teams VALUES (24, 'United States');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 288, true);


--
-- Name: teams_team_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.teams_team_id_seq', 24, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: teams teams_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_name_key UNIQUE (name);


--
-- Name: teams teams_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.teams
    ADD CONSTRAINT teams_pkey PRIMARY KEY (team_id);


--
-- Name: games opponent_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT opponent_fk FOREIGN KEY (opponent_id) REFERENCES public.teams(team_id);


--
-- Name: games winner_fk; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT winner_fk FOREIGN KEY (winner_id) REFERENCES public.teams(team_id);


--
-- PostgreSQL database dump complete
--

