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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    speed integer,
    description text,
    name character varying(60) NOT NULL,
    galaxy_size real
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_record; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_record (
    galaxy_record_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL,
    star_id integer,
    moon_id integer,
    name character varying(60),
    has_life boolean
);


ALTER TABLE public.galaxy_record OWNER TO freecodecamp;

--
-- Name: galaxy_record_galaxy_record_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_record_galaxy_record_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_record_galaxy_record_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_record_galaxy_record_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_record_galaxy_record_id_seq OWNED BY public.galaxy_record.galaxy_record_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60),
    moon_size integer,
    galaxy_id integer NOT NULL,
    planet_id integer NOT NULL
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    planet_size integer,
    has_moon boolean,
    star_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    galaxy_id integer NOT NULL,
    star_size numeric(30,4),
    has_planet boolean
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_record galaxy_record_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record ALTER COLUMN galaxy_record_id SET DEFAULT nextval('public.galaxy_record_galaxy_record_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 1, 'The Milky Way is a spiral galaxy containing billions of stars, including our Sun, with a dense central bulge and vast rotating arms. It spans about 100,000 light-years across and is home to planets, gas, dust, and a supermassive black hole at its center. Our solar system lies about 27,000 light-years from the galactic center.', 'Milky Way', NULL);
INSERT INTO public.galaxy VALUES (2, 1, 'The closest large spiral galaxy to the Milky Way, about 2.5 million light-years away, and on a collision course with the Milky Way.', 'Andromeda Galaxy', NULL);
INSERT INTO public.galaxy VALUES (3, 360000, 'A smaller spiral galaxy, located 3 million light-years away, known for its well-defined spiral structure.', 'Triangulum Galaxy', NULL);
INSERT INTO public.galaxy VALUES (4, 4, 'A giant elliptical galaxy with a supermassive black hole at its core, located 53 million light-years away.', 'Messier 87', NULL);
INSERT INTO public.galaxy VALUES (5, 4, 'A bright spiral galaxy with a prominent dust lane, located 31 million light-years away.', 'Sombrero Galaxy', NULL);
INSERT INTO public.galaxy VALUES (6, 2, 'A classic spiral galaxy interacting with its companion galaxy, located 23 million light-years away.
', 'Whirlpool Galaxy', NULL);


--
-- Data for Name: galaxy_record; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_record VALUES (1, 1, 1, 1, 1, NULL, NULL);
INSERT INTO public.galaxy_record VALUES (2, 1, 2, 1, 2, NULL, NULL);
INSERT INTO public.galaxy_record VALUES (3, 2, 1, 2, 1, NULL, NULL);
INSERT INTO public.galaxy_record VALUES (4, 2, 2, 2, 2, NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 32, 1, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 234, 2, 4);
INSERT INTO public.moon VALUES (3, 'Ganymede', 345, 1, 1);
INSERT INTO public.moon VALUES (4, 'Callisto', 356, 1, 2);
INSERT INTO public.moon VALUES (5, 'lo', 113, 2, 3);
INSERT INTO public.moon VALUES (6, 'Titan', 345, 2, 3);
INSERT INTO public.moon VALUES (7, 'Enceladus', 4324, 2, 3);
INSERT INTO public.moon VALUES (8, 'Mimas', 2345, 2, 4);
INSERT INTO public.moon VALUES (9, 'Tethys', 1345, 3, 7);
INSERT INTO public.moon VALUES (10, 'Rhea', 234, 1, 2);
INSERT INTO public.moon VALUES (11, 'Dione', 23412, 2, 3);
INSERT INTO public.moon VALUES (12, 'Hyperion', 234, 1, 1);
INSERT INTO public.moon VALUES (13, 'Miranda', 2123, 2, 3);
INSERT INTO public.moon VALUES (14, 'Ariel', 34234, 1, 1);
INSERT INTO public.moon VALUES (15, 'Umbriel', 2578, 1, 2);
INSERT INTO public.moon VALUES (16, 'Titania', 67543, 2, 5);
INSERT INTO public.moon VALUES (17, 'Oberon', 23456, 2, 3);
INSERT INTO public.moon VALUES (18, 'Triton', 5663, 1, 2);
INSERT INTO public.moon VALUES (19, 'Nereid', 345, 3, 4);
INSERT INTO public.moon VALUES (20, 'Charon', 5674, 1, 2);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 12742, true, 1);
INSERT INTO public.planet VALUES (2, 'Jupiter', 1, 139820, true, 1);
INSERT INTO public.planet VALUES (3, 'Mars', 1, 6779, true, 1);
INSERT INTO public.planet VALUES (4, 'Kepler-22b', 1, 2, false, 1);
INSERT INTO public.planet VALUES (5, 'Proxima Centauri B', 1, 1117, false, 1);
INSERT INTO public.planet VALUES (6, 'Trappist-1e', 1, 91, false, 1);
INSERT INTO public.planet VALUES (7, 'PAA-1', 2, 150, false, 2);
INSERT INTO public.planet VALUES (8, 'PAA-2', 2, 130000, true, 2);
INSERT INTO public.planet VALUES (9, 'PAA-3', 2, 80, false, 2);
INSERT INTO public.planet VALUES (10, 'PAA-4', 2, 200, true, 3);
INSERT INTO public.planet VALUES (11, 'PAA-5', 2, 49000, true, 1);
INSERT INTO public.planet VALUES (12, 'PAA-6', 2, 1200, true, 2);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 1, 887.0000, NULL);
INSERT INTO public.star VALUES (2, 'VY Canis Majoris', 1, 1420.0000, NULL);
INSERT INTO public.star VALUES (3, 'Rigel', 1, 78.0000, NULL);
INSERT INTO public.star VALUES (4, 'V1', 2, 50.0000, NULL);
INSERT INTO public.star VALUES (5, 'S Andromedae', 2, 8.0000, NULL);
INSERT INTO public.star VALUES (6, 'Z Andromedae', 2, 160.0000, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_record_galaxy_record_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_record_galaxy_record_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_record galaxy_record_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_pkey PRIMARY KEY (galaxy_record_id);


--
-- Name: galaxy_record galaxy_record_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_unq UNIQUE (galaxy_record_id);


--
-- Name: galaxy galaxy_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_unq UNIQUE (galaxy_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: moon moon_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_unq UNIQUE (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_unq UNIQUE (planet_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_unq; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_unq UNIQUE (star_id);


--
-- Name: galaxy_record galaxy_record_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: galaxy_record galaxy_record_moon_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_moon_id_fkey FOREIGN KEY (moon_id) REFERENCES public.moon(moon_id);


--
-- Name: galaxy_record galaxy_record_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: galaxy_record galaxy_record_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_record
    ADD CONSTRAINT galaxy_record_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: moon moon_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

