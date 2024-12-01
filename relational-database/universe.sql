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

--
-- Name: rotation; Type: TYPE; Schema: public; Owner: freecodecamp
--

CREATE TYPE public.rotation AS ENUM (
    'prograde',
    'retrograde',
    'unknown'
);


ALTER TYPE public.rotation OWNER TO freecodecamp;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    galaxy_type_id integer NOT NULL,
    distance_from_earth_light_years integer,
    distance_from_earth_parsecs numeric(6,4)
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
-- Name: galaxy_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_type (
    galaxy_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text
);


ALTER TABLE public.galaxy_type OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_type_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_type_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_type_galaxy_type_id_seq OWNED BY public.galaxy_type.galaxy_type_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    planet_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_miles integer,
    is_tidal_locked boolean,
    rotation public.rotation
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
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    diameter_in_miles integer,
    has_life boolean,
    is_friendly boolean,
    is_habitable boolean,
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
-- Name: planet_type; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_type (
    planet_type_id integer NOT NULL,
    name character varying NOT NULL,
    description text NOT NULL
);


ALTER TABLE public.planet_type OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_type_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_type_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_type_planet_type_id_seq OWNED BY public.planet_type.planet_type_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    galaxy_id integer NOT NULL,
    name character varying NOT NULL,
    solar_mass integer,
    temperature_in_celcius integer
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
-- Name: galaxy_type galaxy_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type ALTER COLUMN galaxy_type_id SET DEFAULT nextval('public.galaxy_type_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_type planet_type_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type ALTER COLUMN planet_type_id SET DEFAULT nextval('public.planet_type_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 1, 0, 0.0000);
INSERT INTO public.galaxy VALUES (2, 'Canis Major Dwarf Galaxy', 2, 25000, 0.0077);
INSERT INTO public.galaxy VALUES (3, 'Sagittarius Dwarf Irregular Galaxy (SagDIG)', 2, 3400000, 1.1000);
INSERT INTO public.galaxy VALUES (4, 'Large Magellanic Cloud (LMC)', 3, 163000, 0.0500);
INSERT INTO public.galaxy VALUES (5, 'Small Magellanic Cloud (SMC)', 3, 200000, 0.0600);
INSERT INTO public.galaxy VALUES (6, 'Triangulum Galaxy (M33)', 4, 2730000, 0.8400);
INSERT INTO public.galaxy VALUES (7, 'Andromeda Galaxy (M31)', 4, 2500000, 0.7700);


--
-- Data for Name: galaxy_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_type VALUES (1, 'Barred Spiral', 'A spiral galaxy with a central bar-shaped structure composed of stars. Spiral arms extend from the ends of the bar.');
INSERT INTO public.galaxy_type VALUES (2, 'Irregular', 'A galaxy with no defined shape or structure. Often, these galaxies have been distorted by interactions with other galaxies.');
INSERT INTO public.galaxy_type VALUES (3, 'Magellanic Spiral', 'A type of spiral galaxy with a single spiral arm and an off-center nucleus.');
INSERT INTO public.galaxy_type VALUES (4, 'Spiral', 'A galaxy with a flattened disk shape and spiral arms that contain gas, dust, and stars.');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 3, 'Moon', 2159, true, 'prograde');
INSERT INTO public.moon VALUES (2, 4, 'Phobos', 14, true, 'prograde');
INSERT INTO public.moon VALUES (3, 4, 'Deimos', 8, true, 'prograde');
INSERT INTO public.moon VALUES (4, 5, 'Ganymede', 3273, true, 'prograde');
INSERT INTO public.moon VALUES (5, 5, 'Callisto', 2995, true, 'prograde');
INSERT INTO public.moon VALUES (6, 5, 'Io', 2264, true, 'prograde');
INSERT INTO public.moon VALUES (7, 5, 'Europa', 1940, true, 'prograde');
INSERT INTO public.moon VALUES (8, 6, 'Titan', 3200, true, 'prograde');
INSERT INTO public.moon VALUES (9, 6, 'Rhea', 949, true, 'prograde');
INSERT INTO public.moon VALUES (10, 6, 'Iapetus', 914, true, 'prograde');
INSERT INTO public.moon VALUES (11, 6, 'Dione', 698, true, 'prograde');
INSERT INTO public.moon VALUES (12, 6, 'Tethys', 660, true, 'prograde');
INSERT INTO public.moon VALUES (13, 6, 'Enceladus', 310, true, 'prograde');
INSERT INTO public.moon VALUES (14, 7, 'Titania', 981, true, 'retrograde');
INSERT INTO public.moon VALUES (15, 7, 'Oberon', 946, true, 'retrograde');
INSERT INTO public.moon VALUES (16, 7, 'Umbriel', 727, true, 'retrograde');
INSERT INTO public.moon VALUES (17, 7, 'Ariel', 720, true, 'retrograde');
INSERT INTO public.moon VALUES (18, 7, 'Miranda', 293, true, 'retrograde');
INSERT INTO public.moon VALUES (19, 8, 'Triton', 1680, true, 'retrograde');
INSERT INTO public.moon VALUES (20, 8, 'Nereid', 211, false, 'prograde');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 1, 'Mercury', 3032, false, false, false, 1);
INSERT INTO public.planet VALUES (2, 1, 'Venus', 7521, false, false, false, 1);
INSERT INTO public.planet VALUES (3, 1, 'Earth', 7926, true, true, true, 1);
INSERT INTO public.planet VALUES (4, 1, 'Mars', 4220, false, true, true, 1);
INSERT INTO public.planet VALUES (5, 2, 'Jupiter', 88846, false, false, false, 1);
INSERT INTO public.planet VALUES (6, 2, 'Saturn', 74898, false, true, false, 1);
INSERT INTO public.planet VALUES (7, 3, 'Uranus', 31763, false, false, true, 1);
INSERT INTO public.planet VALUES (8, 3, 'Neptune', 30775, false, true, true, 1);
INSERT INTO public.planet VALUES (9, 2, 'HAT-P-32b', 134751, false, true, false, 7);
INSERT INTO public.planet VALUES (10, 4, 'WASP-12b', 123435, false, false, false, 8);
INSERT INTO public.planet VALUES (11, 5, '55 Cancri e', 15925, false, false, true, 9);
INSERT INTO public.planet VALUES (12, 6, 'Gliese 436 b', 30405, false, true, true, 10);


--
-- Data for Name: planet_type; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_type VALUES (1, 'Terrestrial', 'Rocky planets like Earth, Mercury, Venus, and Mars.');
INSERT INTO public.planet_type VALUES (2, 'Gas Giant', 'Large planets mostly made of gas, like Jupiter and Saturn.');
INSERT INTO public.planet_type VALUES (3, 'Ice Giant', 'Large planets mostly made of ices (water, methane, ammonia), like Uranus and Neptune.');
INSERT INTO public.planet_type VALUES (4, 'Hot Jupiter', 'Similar in size and composition to Jupiter, but they orbit extremely close to their stars. This proximity results in incredibly high surface temperatures, often reaching thousands of degrees.');
INSERT INTO public.planet_type VALUES (5, 'Super-Earth', 'These are planets that are larger and more massive than Earth, but smaller than ice giants like Uranus or Neptune. They can be made of gas, rock, or a combination of both.');
INSERT INTO public.planet_type VALUES (6, 'Neptune-like', 'Similar in size and composition to our own Neptune. They are likely to have a thick atmosphere composed mostly of hydrogen and helium, with a possible rocky core.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 1, 'Sun', 1, 5500);
INSERT INTO public.star VALUES (2, 2, 'Z Canis Majoris', 25, 25000);
INSERT INTO public.star VALUES (3, 3, 'Variable V5006 Sagittarii', 1, 4500);
INSERT INTO public.star VALUES (4, 4, 'R136a1', 215, 46000);
INSERT INTO public.star VALUES (5, 5, 'HD 5980', 150, 40000);
INSERT INTO public.star VALUES (6, 6, 'Variable C', 10, 3500);
INSERT INTO public.star VALUES (7, 1, 'HAT-P-32', 1, 6160);
INSERT INTO public.star VALUES (8, 1, 'WASP-12', 1, 6300);
INSERT INTO public.star VALUES (9, 1, '55 Cancri', 1, 5170);
INSERT INTO public.star VALUES (10, 1, 'Gliese 436', 0, 3316);
INSERT INTO public.star VALUES (11, 1, 'GSC 02620-00648', 1, 5626);
INSERT INTO public.star VALUES (12, 1, 'Kepler-10', 1, 5627);
INSERT INTO public.star VALUES (13, 1, 'WASP-17', 1, 6550);
INSERT INTO public.star VALUES (14, 1, 'HD 189733', 1, 4875);
INSERT INTO public.star VALUES (15, 1, 'GJ 1214', 0, 3026);
INSERT INTO public.star VALUES (16, 1, 'HAT-P-11', 1, 4780);
INSERT INTO public.star VALUES (17, 1, 'Kepler-9', 1, 5777);
INSERT INTO public.star VALUES (18, 1, 'WASP-79', 2, 6600);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: galaxy_type_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_type_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: planet_type_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_type_planet_type_id_seq', 6, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 18, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_type galaxy_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_name_key UNIQUE (name);


--
-- Name: galaxy_type galaxy_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_type
    ADD CONSTRAINT galaxy_type_pkey PRIMARY KEY (galaxy_type_id);


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
-- Name: planet_type planet_type_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_name_key UNIQUE (name);


--
-- Name: planet_type planet_type_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_type
    ADD CONSTRAINT planet_type_pkey PRIMARY KEY (planet_type_id);


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
-- Name: galaxy fk_galaxy_galaxy_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT fk_galaxy_galaxy_type FOREIGN KEY (galaxy_type_id) REFERENCES public.galaxy_type(galaxy_type_id);


--
-- Name: moon fk_moon_planet; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT fk_moon_planet FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet fk_planet_planet_type; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_planet_type FOREIGN KEY (planet_type_id) REFERENCES public.planet_type(planet_type_id);


--
-- Name: planet fk_planet_star; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT fk_planet_star FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star fk_star_galaxy; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT fk_star_galaxy FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--

