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
-- Name: cluster; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.cluster (
    cluster_id integer NOT NULL,
    name character varying(250) NOT NULL,
    galaxy_numbers integer NOT NULL,
    known_constellation character varying(50) NOT NULL
);


ALTER TABLE public.cluster OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.cluster_cluster_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cluster_cluster_id_seq OWNER TO freecodecamp;

--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.cluster_cluster_id_seq OWNED BY public.cluster.cluster_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(250) NOT NULL,
    age_in_bil numeric(5,2),
    stars_in_bil integer,
    planets_in_bil integer,
    cluster_member boolean NOT NULL,
    cluster_id integer
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
    name character varying(250) NOT NULL,
    discovery_date date NOT NULL,
    radius_in_km integer NOT NULL,
    planet_id integer NOT NULL,
    description text
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
    name character varying(250) NOT NULL,
    type text,
    age_in_mil numeric(6,2),
    radius_in_km integer NOT NULL,
    number_of_moon integer NOT NULL,
    is_habitable boolean NOT NULL,
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
    name character varying(250) NOT NULL,
    age_in_mil numeric(6,2),
    number_planets integer NOT NULL,
    radius_in_mil_km numeric(6,2) NOT NULL,
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
-- Name: cluster cluster_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster ALTER COLUMN cluster_id SET DEFAULT nextval('public.cluster_cluster_id_seq'::regclass);


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
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: cluster; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.cluster VALUES (1, 'Virgo', 1500, 'Virgo');
INSERT INTO public.cluster VALUES (2, 'Fornax', 58, 'Fornax');
INSERT INTO public.cluster VALUES (3, 'Coma', 1000, 'Coma Berenices');
INSERT INTO public.cluster VALUES (4, 'Ursa Major', 80, 'Ursa Major');


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13.61, 100, 800, false, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10.01, 1000, 2000, false, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 13.24, 1000, NULL, true, 1);
INSERT INTO public.galaxy VALUES (4, 'Fornax A', 10.00, 200, 1000, true, 2);
INSERT INTO public.galaxy VALUES (5, 'Messier 109', 10.00, 100, 400, true, 4);
INSERT INTO public.galaxy VALUES (6, 'Messier 49', 10.00, 200, 800, true, 1);
INSERT INTO public.galaxy VALUES (7, 'Messier 94', 10.27, 40, 100, false, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', '1877-08-12', 6, 2, 'Composed of rock rich in carbonaceous material, much like C-type asteroids');
INSERT INTO public.moon VALUES (2, 'Phobos', '1877-08-18', 11, 2, 'Carbonaceous C-type asteroids, with spectra, albedo, and density very similar to those of C- or D-type asteroids');
INSERT INTO public.moon VALUES (3, 'Ariel', '1851-10-24', 578, 7, 'Terrestrial satellite with a composition of roughly equal parts water ice and rock, perhaps intermixed with a small amount of frozen methane');
INSERT INTO public.moon VALUES (4, 'Umbriel', '1851-10-24', 584, 7, 'Consists mainly of ice with a substantial fraction of rock, and may be differentiated into a rocky core and an icy mantle');
INSERT INTO public.moon VALUES (5, 'Ganymede', '1610-03-13', 2634, 8, 'Has three main layers: A metallic iron core at its center, a spherical shell of rock (mantle) surrounding the core, and a spherical shell of mostly ice surrounding the rock shell');
INSERT INTO public.moon VALUES (6, 'Callisto', '1610-03-13', 2410, 8, 'Icy surface covered by craters of various shapes and sizes, including bowl-shaped craters and craters with multiple rings');
INSERT INTO public.moon VALUES (7, 'Io', '1610-03-13', 1821, 8, 'Tidal forces generate a tremendous amount of heat within Io, keeping much of its subsurface crust in liquid form');
INSERT INTO public.moon VALUES (8, 'Europa', '1610-03-13', 1560, 8, 'Primarily made of silicate rock and has a water-ice crust and probably an iron-nickel core');
INSERT INTO public.moon VALUES (9, 'Titan', '1656-03-05', 2574, 5, 'The only moon in the solar system with a dense atmosphere, and it''s the only world besides Earth that has standing bodies of liquid, including rivers, lakes and seas, on its surface');
INSERT INTO public.moon VALUES (10, 'Tethys', '1686-04-22', 531, 5, 'The density of Tethys is 0.98 g/cm3, indicating that it is composed almost entirely of water-ice');
INSERT INTO public.moon VALUES (11, 'Dione', '1686-04-22', 561, 5, 'Heavily cratered terrain with craters as large as 62 miles (100 km) across, moderately cratered plains, lightly cratered plains, and fractured areas');
INSERT INTO public.moon VALUES (12, 'Titania', '1787-02-15', 788, 7, 'Composed of equal parts water ice and rocky material, a small amount of frozen methane is probably present as well');
INSERT INTO public.moon VALUES (13, 'Oberon', '1787-02-15', 761, 7, 'Composed of roughly half ice and half rock');
INSERT INTO public.moon VALUES (14, 'Enceladus', '1789-11-12', 252, 5, 'Icy surface and is remarkably smooth in some places, and bright white all over');
INSERT INTO public.moon VALUES (15, 'Mimas', '1789-11-12', 198, 5, 'Its low density suggests that it consists almost entirely of water ice, which is the only substance ever detected');
INSERT INTO public.moon VALUES (16, 'Triton', '1846-11-13', 1353, 6, 'Sparsely cratered surface with smooth volcanic plains, mounds and round pits formed by icy lava flows');
INSERT INTO public.moon VALUES (17, 'Hyperion', '1848-10-07', 135, 5, 'Has a low mean density, suggesting that it may consist primarily of water ice, with an unusually porous interior, resulting in a bizarre, sponge-like appearance');
INSERT INTO public.moon VALUES (18, 'Amalthea', '1892-10-04', 83, 8, 'Irregularly shaped and reddish in color. It is thought to consist of porous water ice with unknown amounts of other materials. Its surface features include large craters and ridges');
INSERT INTO public.moon VALUES (19, 'Phoebe', '1899-03-17', 106, 5, 'Irregular shaped and has a ring along its orbit');
INSERT INTO public.moon VALUES (20, 'Himalia', '1905-01-06', 85, 8, 'Appears grey, like the other members of its group, similar to a C-type asteroid');
INSERT INTO public.moon VALUES (21, 'Elara', '1905-02-27', 43, 8, 'Elara is an irregular prograde moon. This means that it was captured by Jupiter''s pull of gravity and orbits in the same direction as Jupiter''s rotation');
INSERT INTO public.moon VALUES (22, 'Sinope', '1914-09-17', 19, 8, 'Red in color, Sinope''s infrared spectrum is similar to those of D-type asteroids but different from that of Pasiphae');


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Rocky, Terrestrial', 4543.00, 6371, 1, true, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Terrestrial', 4603.00, 3390, 2, false, 1);
INSERT INTO public.planet VALUES (3, 'Mercury', 'Terrestrial', 4503.00, 2440, 0, false, 1);
INSERT INTO public.planet VALUES (4, 'Venus', 'Terrestrial', 4503.00, 6051, 0, false, 1);
INSERT INTO public.planet VALUES (5, 'Saturn', 'Gas giant', 4503.00, 60268, 146, false, 1);
INSERT INTO public.planet VALUES (6, 'Neptune', 'Ice giant', 4503.00, 24622, 16, false, 1);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Ice giant', 4503.00, 25559, 27, false, 1);
INSERT INTO public.planet VALUES (8, 'Jupiter', 'Gas giant', 4603.00, 69911, 95, false, 1);
INSERT INTO public.planet VALUES (9, 'Trappist-1b', 'Rocky', 3000.00, 7141, 0, false, 7);
INSERT INTO public.planet VALUES (10, 'Trappist-1c', 'Terrestrial', 3000.00, 6988, 0, false, 7);
INSERT INTO public.planet VALUES (11, 'Trappist-1d', 'Rocky', 2200.00, 4994, 0, false, 7);
INSERT INTO public.planet VALUES (12, 'Trappist-1e', 'Terrestrial', 3100.00, 84180, 0, false, 7);
INSERT INTO public.planet VALUES (13, 'Keppler-90b', 'Gas giant', NULL, 8346, 14, false, 6);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4600.00, 8, 0.69, 1);
INSERT INTO public.star VALUES (2, '55 Cancri', 4600.00, 5, 8.64, 1);
INSERT INTO public.star VALUES (3, 'Betelgeuse', 10.00, 0, 955.10, 1);
INSERT INTO public.star VALUES (4, 'Antares', 11.01, 0, 883.00, 1);
INSERT INTO public.star VALUES (5, 'Pollux', 724.50, 1, 13.80, 1);
INSERT INTO public.star VALUES (6, 'Kepler-90', 2500.00, 8, 1.05, 1);
INSERT INTO public.star VALUES (7, 'TRAPPIST-1', 7600.00, 7, 0.16, 1);
INSERT INTO public.star VALUES (8, 'HD 10180', 8600.00, 7, 828.00, 1);
INSERT INTO public.star VALUES (9, 'Proxima Centauri', 4853.00, 2, 0.33, 1);


--
-- Name: cluster_cluster_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.cluster_cluster_id_seq', 4, true);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 7, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 22, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: cluster cluster_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_name_key UNIQUE (name);


--
-- Name: cluster cluster_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.cluster
    ADD CONSTRAINT cluster_pkey PRIMARY KEY (cluster_id);


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
-- Name: galaxy galaxy_cluster_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_cluster_id_fkey FOREIGN KEY (cluster_id) REFERENCES public.cluster(cluster_id);


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

