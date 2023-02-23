--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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
    name character varying(25) NOT NULL,
    description text,
    black_holes integer,
    discovered_by_humans boolean NOT NULL
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(25) NOT NULL,
    radius numeric(8,2) NOT NULL,
    controls_tide boolean NOT NULL,
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
    name character varying(25) NOT NULL,
    radius numeric NOT NULL,
    gaseous boolean NOT NULL,
    star_id integer NOT NULL
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
-- Name: species; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.species (
    species_id integer NOT NULL,
    name character varying(25) NOT NULL,
    description text NOT NULL,
    population integer NOT NULL,
    humanlike boolean,
    planet_id integer
);


ALTER TABLE public.species OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.species_species_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.species_species_id_seq OWNER TO freecodecamp;

--
-- Name: species_species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.species_species_id_seq OWNED BY public.species.species_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(25) NOT NULL,
    color text NOT NULL,
    age integer NOT NULL,
    discoverer_id integer,
    galaxy_id integer NOT NULL
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
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: species species_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species ALTER COLUMN species_id SET DEFAULT nextval('public.species_species_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'galaxy of dreams', 'in this galaxy all your dreams come true', 11, true);
INSERT INTO public.galaxy VALUES (2, 'coolGalaxy123', 'this galaxy is super cool', 0, false);
INSERT INTO public.galaxy VALUES (3, 'galaxy 3', 'I am running out of creativity', 21314, true);
INSERT INTO public.galaxy VALUES (4, 'MilkyWay', 'yeah why not use this', 666, true);
INSERT INTO public.galaxy VALUES (5, 'Amphromorphic', 'This galaxy changes shape and does different this', 22, true);
INSERT INTO public.galaxy VALUES (6, 'Final Desination', 'The last galaxy you will ever visit', 9999999, true);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'asdf', 123.00, true, 1);
INSERT INTO public.moon VALUES (2, 'adfgdf', 12.00, false, 2);
INSERT INTO public.moon VALUES (3, 'galja', 122.00, false, 3);
INSERT INTO public.moon VALUES (4, 'afdsh', 32.00, true, 4);
INSERT INTO public.moon VALUES (5, 'a4sdf', 123.00, true, 1);
INSERT INTO public.moon VALUES (6, 'adfffgdf', 12.00, false, 2);
INSERT INTO public.moon VALUES (7, 'gsdfggalja', 122.00, false, 3);
INSERT INTO public.moon VALUES (8, 'afd42sh', 32.00, true, 4);
INSERT INTO public.moon VALUES (9, 'a36fdf', 123.00, true, 1);
INSERT INTO public.moon VALUES (10, 'adfff6', 12.00, false, 2);
INSERT INTO public.moon VALUES (11, 'gsd4ja', 122.00, false, 3);
INSERT INTO public.moon VALUES (12, 'afddfgsh', 32.00, true, 4);
INSERT INTO public.moon VALUES (13, 'a365f', 123.00, true, 1);
INSERT INTO public.moon VALUES (14, 'adsdfgf6', 12.00, false, 2);
INSERT INTO public.moon VALUES (15, 'gs345a', 122.00, false, 3);
INSERT INTO public.moon VALUES (16, 'adfgfgsh', 32.00, true, 4);
INSERT INTO public.moon VALUES (17, '45gdf5f', 123.00, true, 1);
INSERT INTO public.moon VALUES (18, 'adsdgs6', 12.00, false, 2);
INSERT INTO public.moon VALUES (19, 'gs53a', 122.00, false, 3);
INSERT INTO public.moon VALUES (20, 'adsggsh', 32.00, true, 4);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'planet', 100, false, 1);
INSERT INTO public.planet VALUES (2, 'PLANET1', 123, true, 2);
INSERT INTO public.planet VALUES (3, 'planet2', 321, false, 3);
INSERT INTO public.planet VALUES (4, 'plane321t', 100, false, 1);
INSERT INTO public.planet VALUES (5, 'PLANE123T1', 123, true, 2);
INSERT INTO public.planet VALUES (6, 'plan32et2', 321, false, 3);
INSERT INTO public.planet VALUES (7, 'plasdf321t', 100, false, 1);
INSERT INTO public.planet VALUES (8, 'PLadsf23T1', 123, true, 2);
INSERT INTO public.planet VALUES (9, 'plafet2', 321, false, 3);
INSERT INTO public.planet VALUES (10, 'plasdf3gsfd421t', 100, false, 1);
INSERT INTO public.planet VALUES (11, '4dfgPLadsf23T1', 123, true, 2);
INSERT INTO public.planet VALUES (12, 'p55bglafet2', 321, false, 3);


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.species VALUES (1, 'purple people eaters', 'watch out, they coming for you', 3242, false, 1);
INSERT INTO public.species VALUES (2, 'purple people', 'gonna get eaten', 42, true, 1);
INSERT INTO public.species VALUES (3, 'Moomen', 'space cows in space', 4552, false, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'star 1', 'red', 100, 1, 1);
INSERT INTO public.star VALUES (2, 'stary night', 'blue', 132, 29, 2);
INSERT INTO public.star VALUES (3, 'star star star', 'yellow', 1098, 11, 3);
INSERT INTO public.star VALUES (6, 'star 12', 'red', 100, 311, 1);
INSERT INTO public.star VALUES (7, 'stary night2', 'blue', 132, 22, 2);
INSERT INTO public.star VALUES (8, 'star star starahhh', 'yellow', 1098, 234, 3);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: species_species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.species_species_id_seq', 3, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: galaxy galaxy_description_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_description_key UNIQUE (description);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: species species_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_name_key UNIQUE (name);


--
-- Name: species species_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_pkey PRIMARY KEY (species_id);


--
-- Name: star star_discoverer_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_discoverer_id_key UNIQUE (discoverer_id);


--
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: species species_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT species_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

