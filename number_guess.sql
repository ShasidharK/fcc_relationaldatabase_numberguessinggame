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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    user_id integer,
    guesses integer NOT NULL
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
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (250, 73, 571);
INSERT INTO public.games VALUES (251, 73, 666);
INSERT INTO public.games VALUES (252, 74, 98);
INSERT INTO public.games VALUES (253, 74, 497);
INSERT INTO public.games VALUES (254, 73, 323);
INSERT INTO public.games VALUES (255, 73, 641);
INSERT INTO public.games VALUES (256, 73, 627);
INSERT INTO public.games VALUES (257, 75, 401);
INSERT INTO public.games VALUES (258, 75, 738);
INSERT INTO public.games VALUES (259, 76, 621);
INSERT INTO public.games VALUES (260, 76, 831);
INSERT INTO public.games VALUES (261, 75, 524);
INSERT INTO public.games VALUES (262, 75, 630);
INSERT INTO public.games VALUES (263, 75, 975);
INSERT INTO public.games VALUES (264, 77, 230);
INSERT INTO public.games VALUES (265, 77, 33);
INSERT INTO public.games VALUES (266, 78, 290);
INSERT INTO public.games VALUES (267, 78, 497);
INSERT INTO public.games VALUES (268, 77, 20);
INSERT INTO public.games VALUES (269, 77, 567);
INSERT INTO public.games VALUES (270, 77, 787);
INSERT INTO public.games VALUES (271, 79, 80);
INSERT INTO public.games VALUES (272, 79, 466);
INSERT INTO public.games VALUES (273, 80, 582);
INSERT INTO public.games VALUES (274, 80, 493);
INSERT INTO public.games VALUES (275, 79, 907);
INSERT INTO public.games VALUES (276, 79, 173);
INSERT INTO public.games VALUES (277, 79, 301);
INSERT INTO public.games VALUES (278, 81, 361);
INSERT INTO public.games VALUES (279, 81, 605);
INSERT INTO public.games VALUES (280, 82, 250);
INSERT INTO public.games VALUES (281, 82, 522);
INSERT INTO public.games VALUES (282, 81, 526);
INSERT INTO public.games VALUES (283, 81, 144);
INSERT INTO public.games VALUES (284, 81, 551);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (73, 'user_1749735952231');
INSERT INTO public.users VALUES (74, 'user_1749735952230');
INSERT INTO public.users VALUES (75, 'user_1749736637667');
INSERT INTO public.users VALUES (76, 'user_1749736637666');
INSERT INTO public.users VALUES (77, 'user_1749736908456');
INSERT INTO public.users VALUES (78, 'user_1749736908455');
INSERT INTO public.users VALUES (79, 'user_1749737071109');
INSERT INTO public.users VALUES (80, 'user_1749737071108');
INSERT INTO public.users VALUES (81, 'user_1749737695804');
INSERT INTO public.users VALUES (82, 'user_1749737695803');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 284, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 82, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

