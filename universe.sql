--
-- PostgreSQL database dump
--

-- Dumped from database version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)
-- Dumped by pg_dump version 12.22 (Ubuntu 12.22-0ubuntu0.20.04.4)

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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_stars integer,
    distance_from_earth numeric(15,2),
    description text,
    is_visible boolean,
    is_active boolean,
    galaxy_code character varying(20),
    galaxy_types_id integer NOT NULL
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
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(100) NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_craters integer,
    mass numeric(12,5),
    description text,
    is_visible boolean,
    has_craters boolean,
    moon_code character varying(20),
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
    name character varying(100) NOT NULL,
    age_in_millions_of_years integer,
    number_of_moons integer,
    mass numeric(15,2),
    description text,
    is_visible boolean,
    has_moons boolean,
    planet_code character varying(20),
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(100) NOT NULL,
    temperature integer,
    age_in_millions_of_years integer,
    mass numeric(15,2),
    description text,
    is_visible boolean,
    has_planets boolean,
    star_code character varying(20),
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
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


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

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 200000, 0.00, 'The galaxy that contains our Solar System.', true, true, 'GAL-001', 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, 1000000, 2537000.00, 'The nearest major galaxy to the Milky Way.', true, true, 'GAL-002', 1);
INSERT INTO public.galaxy VALUES (3, 'Triangulum', 12000, 40000, 2730000.00, 'A spiral galaxy located in the constellation Triangulum.', true, true, 'GAL-003', 1);
INSERT INTO public.galaxy VALUES (4, 'Messier 87', 13000, 1000000, 53500000.00, 'A massive elliptical galaxy located in the Virgo Cluster.', true, true, 'GAL-004', 2);
INSERT INTO public.galaxy VALUES (5, 'Large Magellanic Cloud', 13000, 30000, 163000.00, 'An irregular satellite galaxy of the Milky Way.', true, true, 'GAL-005', 3);
INSERT INTO public.galaxy VALUES (6, 'Small Magellanic Cloud', 13000, 30000, 200000.00, 'An irregular dwarf galaxy near the Milky Way.', true, true, 'GAL-006', 3);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'A galaxy with spiral arms extending from its central region.');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'A galaxy with an oval or spherical shape.');
INSERT INTO public.galaxy_types VALUES (3, 'Irregular', 'A galaxy without a clearly defined structure.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Luna', 4500, 30000, 0.07350, 'The natural satellite of Earth.', true, true, 'MON-001', 1);
INSERT INTO public.moon VALUES (2, 'Phobos', 4500, 100, 0.00001, 'The larger and closer moon of Mars.', true, true, 'MON-002', 2);
INSERT INTO public.moon VALUES (3, 'Deimos', 4500, 50, 0.00000, 'The smaller and more distant moon of Mars.', true, true, 'MON-003', 2);
INSERT INTO public.moon VALUES (4, 'Proxima Alpha', 4800, 120, 0.00120, 'A hypothetical natural satellite of Proxima b.', false, true, 'MON-004', 3);
INSERT INTO public.moon VALUES (5, 'Proxima Beta', 4800, 80, 0.00090, 'A hypothetical natural satellite of Proxima b.', false, true, 'MON-005', 3);
INSERT INTO public.moon VALUES (6, 'Proxima Delta', 4800, 60, 0.00050, 'A hypothetical natural satellite of Proxima d.', false, true, 'MON-006', 4);
INSERT INTO public.moon VALUES (7, 'Sirius Moon A', 242, 200, 0.00200, 'A hypothetical moon orbiting Sirius b.', false, true, 'MON-007', 5);
INSERT INTO public.moon VALUES (8, 'Sirius Moon B', 242, 150, 0.00150, 'Another hypothetical moon orbiting Sirius b.', false, true, 'MON-008', 5);
INSERT INTO public.moon VALUES (9, 'Sirius Moon C', 242, 90, 0.00100, 'A hypothetical moon orbiting Sirius c.', false, true, 'MON-009', 6);
INSERT INTO public.moon VALUES (10, 'Vega Moon A', 455, 110, 0.00180, 'A hypothetical moon orbiting Vega b.', false, true, 'MON-010', 7);
INSERT INTO public.moon VALUES (11, 'Vega Moon B', 455, 75, 0.00120, 'Another hypothetical moon orbiting Vega b.', false, true, 'MON-011', 7);
INSERT INTO public.moon VALUES (12, 'Vega Moon C', 455, 130, 0.00140, 'A hypothetical moon orbiting Vega c.', false, true, 'MON-012', 8);
INSERT INTO public.moon VALUES (13, 'Trappist Moon A', 7600, 400, 0.00300, 'A hypothetical moon orbiting TRAPPIST-1b.', false, true, 'MON-013', 9);
INSERT INTO public.moon VALUES (14, 'Trappist Moon B', 7600, 250, 0.00200, 'Another hypothetical moon orbiting TRAPPIST-1b.', false, true, 'MON-014', 9);
INSERT INTO public.moon VALUES (15, 'Trappist Moon C', 7600, 300, 0.00250, 'A hypothetical moon orbiting TRAPPIST-1c.', false, true, 'MON-015', 10);
INSERT INTO public.moon VALUES (16, 'Trappist Moon D', 7600, 180, 0.00150, 'Another hypothetical moon orbiting TRAPPIST-1c.', false, true, 'MON-016', 10);
INSERT INTO public.moon VALUES (17, 'Kepler Moon A', 2000, 220, 0.00220, 'A hypothetical moon orbiting Kepler-90b.', false, true, 'MON-017', 11);
INSERT INTO public.moon VALUES (18, 'Kepler Moon B', 2000, 190, 0.00190, 'Another hypothetical moon orbiting Kepler-90b.', false, true, 'MON-018', 11);
INSERT INTO public.moon VALUES (19, 'Kepler Moon C', 2000, 170, 0.00170, 'A hypothetical moon orbiting Kepler-90c.', false, true, 'MON-019', 12);
INSERT INTO public.moon VALUES (20, 'Kepler Moon D', 2000, 140, 0.00140, 'Another hypothetical moon orbiting Kepler-90c.', false, true, 'MON-020', 12);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4540, 1, 1.00, 'The only known planet to support life.', true, true, 'PLN-001', 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4500, 2, 0.11, 'A rocky planet known as the Red Planet.', true, true, 'PLN-002', 1);
INSERT INTO public.planet VALUES (3, 'Proxima b', 4800, 0, 1.27, 'An exoplanet orbiting Proxima Centauri.', true, false, 'PLN-003', 2);
INSERT INTO public.planet VALUES (4, 'Proxima d', 4800, 0, 0.26, 'A small exoplanet orbiting Proxima Centauri.', true, false, 'PLN-004', 2);
INSERT INTO public.planet VALUES (5, 'Sirius b', 242, 0, 0.98, 'A compact companion in the Sirius star system.', true, false, 'PLN-005', 3);
INSERT INTO public.planet VALUES (6, 'Sirius c', 242, 0, 2.00, 'A hypothetical planet in the Sirius system.', false, false, 'PLN-006', 3);
INSERT INTO public.planet VALUES (7, 'Vega b', 455, 0, 3.00, 'A hypothetical exoplanet orbiting Vega.', false, false, 'PLN-007', 4);
INSERT INTO public.planet VALUES (8, 'Vega c', 455, 0, 1.50, 'A hypothetical planetary companion of Vega.', false, false, 'PLN-008', 4);
INSERT INTO public.planet VALUES (9, 'TRAPPIST-1b', 7600, 0, 0.85, 'A rocky planet in the TRAPPIST-1 system.', true, false, 'PLN-009', 5);
INSERT INTO public.planet VALUES (10, 'TRAPPIST-1c', 7600, 0, 1.38, 'A rocky exoplanet orbiting TRAPPIST-1.', true, false, 'PLN-010', 5);
INSERT INTO public.planet VALUES (11, 'Kepler-90b', 2000, 0, 2.00, 'An inner planet in the Kepler-90 system.', true, false, 'PLN-011', 6);
INSERT INTO public.planet VALUES (12, 'Kepler-90c', 2000, 0, 1.50, 'A planet orbiting the star Kepler-90.', true, false, 'PLN-012', 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 5778, 4600, 1.00, 'The central star of our Solar System.', true, true, 'STR-001', 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 3042, 4850, 0.12, 'The closest known star to the Sun.', true, true, 'STR-002', 1);
INSERT INTO public.star VALUES (3, 'Sirius', 9940, 242, 2.06, 'The brightest star in the night sky.', true, false, 'STR-003', 1);
INSERT INTO public.star VALUES (4, 'Vega', 9602, 455, 2.14, 'A bright star located in the constellation Lyra.', true, true, 'STR-004', 1);
INSERT INTO public.star VALUES (5, 'TRAPPIST-1', 2566, 7600, 0.09, 'An ultracool red dwarf star with several known planets.', true, true, 'STR-005', 1);
INSERT INTO public.star VALUES (6, 'Kepler-90', 6080, 2000, 1.20, 'A star known for hosting a system of multiple planets.', true, true, 'STR-006', 1);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 3, true);


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
-- Name: galaxy galaxy_galaxy_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_code_key UNIQUE (galaxy_code);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_name_key UNIQUE (name);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_code_key UNIQUE (moon_code);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_code_key UNIQUE (planet_code);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_code_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_code_key UNIQUE (star_code);


--
-- Name: galaxy galaxy_galaxy_type_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_type_id_fkey FOREIGN KEY (galaxy_types_id) REFERENCES public.galaxy_types(galaxy_types_id);


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
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

