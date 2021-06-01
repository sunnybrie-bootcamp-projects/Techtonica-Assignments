--
-- PostgreSQL database dump
--

-- Dumped from database version 13.2
-- Dumped by pg_dump version 13.2

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
-- Name: species; Type: TABLE; Schema: public; Owner: tpl5_2021h1
--

CREATE TABLE public.species (
    id integer NOT NULL,
    common_name text,
    scientific_name text,
    approx_num_in_wild integer,
    conservation_status text,
    record_created timestamp without time zone DEFAULT now(),
    wikipedia_url text,
    image_url text
);


ALTER TABLE public.species OWNER TO tpl5_2021h1;

--
-- Name: Species_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl5_2021h1
--

CREATE SEQUENCE public."Species_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."Species_id_seq" OWNER TO tpl5_2021h1;

--
-- Name: Species_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tpl5_2021h1
--

ALTER SEQUENCE public."Species_id_seq" OWNED BY public.species.id;


--
-- Name: individuals; Type: TABLE; Schema: public; Owner: tpl5_2021h1
--

CREATE TABLE public.individuals (
    id integer NOT NULL,
    nickname text,
    species integer,
    record_created timestamp without time zone
);


ALTER TABLE public.individuals OWNER TO tpl5_2021h1;

--
-- Name: individuals_id_seq; Type: SEQUENCE; Schema: public; Owner: tpl5_2021h1
--

CREATE SEQUENCE public.individuals_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.individuals_id_seq OWNER TO tpl5_2021h1;

--
-- Name: individuals_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: tpl5_2021h1
--

ALTER SEQUENCE public.individuals_id_seq OWNED BY public.individuals.id;


--
-- Name: sightings; Type: TABLE; Schema: public; Owner: tpl5_2021h1
--

CREATE TABLE public.sightings (
    date_time timestamp without time zone,
    individual integer,
    location text,
    appeared_healthy boolean,
    sighter_email text,
    record_created timestamp without time zone DEFAULT now(),
    sighting_id integer
);


ALTER TABLE public.sightings OWNER TO tpl5_2021h1;

--
-- Name: individuals id; Type: DEFAULT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.individuals ALTER COLUMN id SET DEFAULT nextval('public.individuals_id_seq'::regclass);


--
-- Name: species id; Type: DEFAULT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.species ALTER COLUMN id SET DEFAULT nextval('public."Species_id_seq"'::regclass);


--
-- Data for Name: individuals; Type: TABLE DATA; Schema: public; Owner: tpl5_2021h1
--

COPY public.individuals (id, nickname, species, record_created) FROM stdin;
6	Terminator	6	2021-03-23 12:24:03.516181
7	Gordo	3	2021-03-23 12:24:03.516181
8	Hubby	4	2021-03-23 12:24:03.516181
9	Senior	8	2021-03-23 12:24:03.516181
10	Boomhauer	6	2021-03-23 12:24:03.516181
11	Bud	6	2021-03-23 12:24:03.516181
12	Bunny	6	2021-03-23 12:24:03.516181
13	Doobie	5	2021-03-23 12:24:03.516181
14	Green Giant	2	2021-03-23 12:24:03.516181
15	Dreamey	8	2021-03-23 12:24:03.516181
16	Lovey	3	2021-03-23 12:24:03.516181
17	Dorito	5	2021-03-23 12:24:03.516181
18	Shuttershy	7	2021-03-23 12:24:03.516181
19	Sherlock	3	2021-03-23 12:24:03.516181
20	Freak	5	2021-03-23 12:24:03.516181
21	Dingo	2	2021-03-23 12:24:03.516181
22	Peep	5	2021-03-23 12:24:03.516181
23	Chief	2	2021-03-23 12:24:03.516181
24	Marshmallow	5	2021-03-23 12:24:03.516181
25	Bellbottoms	6	2021-03-23 12:24:03.516181
26	Dumbledore	3	2021-03-23 12:24:03.516181
27	Figgy	5	2021-03-23 12:24:03.516181
28	Double Double	2	2021-03-23 12:24:03.516181
29	Lulu	8	2021-03-23 12:24:03.516181
30	Blondie	6	2021-03-23 12:24:03.516181
31	Rockette	8	2021-03-23 12:24:03.516181
32	Carrot	3	2021-03-23 12:24:03.516181
33	Hot Pepper	4	2021-03-23 12:24:03.516181
34	Bug	8	2021-03-23 12:24:03.516181
35	Pretty Lady	3	2021-03-23 12:24:03.516181
36	Foxy Mama	6	2021-03-23 12:24:03.516181
37	Filly Fally	5	2021-03-23 12:24:03.516181
38	Bubba	2	2021-03-23 12:24:03.516181
39	Dear	4	2021-03-23 12:24:03.516181
40	Bubblegum	1	2021-03-23 12:24:03.516181
41	Rosie	7	2021-03-23 12:24:03.516181
42	Dolly	4	2021-03-23 12:24:03.516181
43	Cumulus	4	2021-03-23 12:24:03.516181
44	Pork Chop	2	2021-03-23 12:24:03.516181
45	Smiley	1	2021-03-23 12:24:03.516181
46	Amiga	7	2021-03-23 12:24:03.516181
47	Manatee	6	2021-03-23 12:24:03.516181
48	Matey	8	2021-03-23 12:24:03.516181
49	Pinkie	8	2021-03-23 12:24:03.516181
50	Con	4	2021-03-23 12:24:03.516181
51	Skinny Jeans	2	2021-03-23 12:24:03.516181
52	Cotton	6	2021-03-23 12:24:03.516181
53	Cheeto	7	2021-03-23 12:24:03.516181
54	Cindy Lou Who	1	2021-03-23 12:24:03.516181
55	Swiss Miss	7	2021-03-23 12:24:03.516181
\.


--
-- Data for Name: sightings; Type: TABLE DATA; Schema: public; Owner: tpl5_2021h1
--

COPY public.sightings (date_time, individual, location, appeared_healthy, sighter_email, record_created, sighting_id) FROM stdin;
2020-10-01 00:02:21	7	21°46′S  43°21′W	t	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	54	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	26	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	28	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	39	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	42	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	35	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	42	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2020-10-01 00:02:21	51	21°46′S  43°21′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	109
2019-02-02 18:37:36	32	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	32	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	32	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	35	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	7	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	32	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	45	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	35	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	8	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	32	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	54	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	40	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	38	47°04′N  15°26′E	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2019-02-02 18:37:36	16	47°04′N  15°26′E	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	110
2018-04-15 17:42:07	7	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	43	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	45	Iquique, Chile	f	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	50	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	23	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	43	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	16	Iquique, Chile	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	16	Iquique, Chile	f	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2018-04-15 17:42:07	23	Iquique, Chile	f	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	111
2020-11-08 22:47:21	7	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	16	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	45	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	19	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	21	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	51	27°57′N  82°28′W	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	28	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	7	27°57′N  82°28′W	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	38	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2020-11-08 22:47:21	42	27°57′N  82°28′W	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	112
2019-08-24 10:24:13	14	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	40	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	45	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	19	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	54	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	7	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	35	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	43	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	8	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	16	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	43	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	16	Bissau, Guinea-Bissau	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	51	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	28	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-08-24 10:24:13	42	Bissau, Guinea-Bissau	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	113
2019-10-28 14:44:16	40	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	44	24°47′S  65°25′W	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	54	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	8	24°47′S  65°25′W	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	45	24°47′S  65°25′W	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	42	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	43	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	45	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	32	24°47′S  65°25′W	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	35	24°47′S  65°25′W	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	38	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2019-10-28 14:44:16	14	24°47′S  65°25′W	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	114
2018-10-24 14:25:30	24	Mendoza, Argentina	f	almondsshiver@gmail.com	2021-03-23 16:08:32.445805	115
2018-10-24 14:25:30	24	Mendoza, Argentina	f	almondsshiver@gmail.com	2021-03-23 16:08:32.445805	115
2018-10-24 14:25:30	17	Mendoza, Argentina	f	almondsshiver@gmail.com	2021-03-23 16:08:32.445805	115
2018-10-24 14:25:30	17	Mendoza, Argentina	f	almondsshiver@gmail.com	2021-03-23 16:08:32.445805	115
2020-01-10 18:35:48	13	Puerto Montt, Chile	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2020-01-10 18:35:48	22	Puerto Montt, Chile	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2020-01-10 18:35:48	13	Puerto Montt, Chile	t	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2020-01-10 18:35:48	37	Puerto Montt, Chile	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2020-01-10 18:35:48	20	Puerto Montt, Chile	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2020-01-10 18:35:48	13	Puerto Montt, Chile	t	profiletow@gmail.com	2021-03-23 16:08:32.445805	116
2018-12-01 04:27:04	17	Catania, Italy	f	octopusfan@gmail.com	2021-03-23 16:08:32.445805	117
2018-12-01 04:27:04	24	Catania, Italy	t	octopusfan@gmail.com	2021-03-23 16:08:32.445805	117
2019-01-18 11:23:43	13	41°29′N  81°40′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2019-01-18 11:23:43	37	41°29′N  81°40′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2019-01-18 11:23:43	22	41°29′N  81°40′W	t	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2019-01-18 11:23:43	13	41°29′N  81°40′W	t	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2019-01-18 11:23:43	17	41°29′N  81°40′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2019-01-18 11:23:43	24	41°29′N  81°40′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	118
2020-07-19 06:39:16	22	Latakia, Syria	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	119
2020-07-19 06:39:16	37	Latakia, Syria	f	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	119
2020-05-02 11:05:18	17	Medellín, Colombia	f	fishtax@gmail.com	2021-03-23 16:08:32.445805	120
2020-05-02 11:05:18	37	Medellín, Colombia	f	fishtax@gmail.com	2021-03-23 16:08:32.445805	120
2020-05-02 11:05:18	37	Medellín, Colombia	t	fishtax@gmail.com	2021-03-23 16:08:32.445805	120
2020-05-02 11:05:18	22	Medellín, Colombia	f	fishtax@gmail.com	2021-03-23 16:08:32.445805	120
2020-05-02 11:05:18	20	Medellín, Colombia	t	fishtax@gmail.com	2021-03-23 16:08:32.445805	120
2018-09-23 07:54:40	17	56°57′N  24°06′E	f	genuineunlikely@gmail.com	2021-03-23 16:08:32.445805	121
2018-09-23 07:54:40	20	56°57′N  24°06′E	f	genuineunlikely@gmail.com	2021-03-23 16:08:32.445805	121
2018-09-23 07:54:40	24	56°57′N  24°06′E	t	genuineunlikely@gmail.com	2021-03-23 16:08:32.445805	121
2018-09-11 14:59:58	17	5°25′N  100°19′E	f	offtrouble@gmail.com	2021-03-23 16:08:32.445805	122
2018-09-11 14:59:58	20	5°25′N  100°19′E	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	122
2018-09-11 14:59:58	20	5°25′N  100°19′E	f	offtrouble@gmail.com	2021-03-23 16:08:32.445805	122
2018-09-11 14:59:58	24	5°25′N  100°19′E	f	offtrouble@gmail.com	2021-03-23 16:08:32.445805	122
2018-09-11 14:59:58	24	5°25′N  100°19′E	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	122
2020-04-03 15:54:50	24	Honningsvåg, Norway	t	cheepraft@gmail.com	2021-03-23 16:08:32.445805	123
2020-04-03 15:54:50	17	Honningsvåg, Norway	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	123
2020-04-03 15:54:50	24	Honningsvåg, Norway	t	cheepraft@gmail.com	2021-03-23 16:08:32.445805	123
2020-04-03 15:54:50	17	Honningsvåg, Norway	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	123
2019-11-20 19:04:55	20	48°35′N  7°45′E	f	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	17	48°35′N  7°45′E	f	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	13	48°35′N  7°45′E	t	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	37	48°35′N  7°45′E	f	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	22	48°35′N  7°45′E	f	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	13	48°35′N  7°45′E	f	nepaleseprovision@gmail.com	2021-03-23 16:08:32.445805	124
2019-11-20 19:04:55	17	Teresina, Brazil	t	meinieutility@gmail.com	2021-03-23 16:08:32.445805	125
2018-12-27 19:31:36	24	Bhisho, South Africa	f	railisraeli@gmail.com	2021-03-23 16:08:32.445805	126
2018-12-27 19:31:36	37	Bhisho, South Africa	t	railisraeli@gmail.com	2021-03-23 16:08:32.445805	126
2018-12-27 19:31:36	20	Bhisho, South Africa	f	railisraeli@gmail.com	2021-03-23 16:08:32.445805	126
2019-07-06 06:11:21	13	39°46′N  86°09′W	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	127
2019-07-06 06:11:21	13	39°46′N  86°09′W	f	offtrouble@gmail.com	2021-03-23 16:08:32.445805	127
2018-04-15 17:42:07	13	Tbilisi, Georgia	t	portraitcar@gmail.com	2021-03-23 16:08:32.445805	128
2018-04-15 17:42:07	37	Tbilisi, Georgia	t	portraitcar@gmail.com	2021-03-23 16:08:32.445805	128
2018-04-15 17:42:07	13	Tbilisi, Georgia	t	portraitcar@gmail.com	2021-03-23 16:08:32.445805	128
2018-04-15 17:42:07	37	Tbilisi, Georgia	t	portraitcar@gmail.com	2021-03-23 16:08:32.445805	128
2020-10-31 22:29:01	22	6°48′S  39°17′E	f	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	129
2020-10-31 22:29:01	22	6°48′S  39°17′E	f	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	129
2020-10-31 22:29:01	13	6°48′S  39°17′E	f	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	129
2020-10-31 22:29:01	24	6°48′S  39°17′E	f	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	129
2020-01-10 12:06:39	13	Irkutsk, Russia	f	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	130
2020-01-10 12:06:39	37	Irkutsk, Russia	t	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	130
2020-01-10 12:06:39	22	Irkutsk, Russia	f	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	130
2020-01-10 12:06:39	20	Irkutsk, Russia	f	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	130
2019-07-06 06:11:21	20	Ahmedabad, India	t	collectshark@gmail.com	2021-03-23 16:08:32.445805	131
2019-07-06 06:11:21	22	Ahmedabad, India	t	collectshark@gmail.com	2021-03-23 16:08:32.445805	131
2019-07-06 06:11:21	37	Ahmedabad, India	f	collectshark@gmail.com	2021-03-23 16:08:32.445805	131
2020-02-07 11:01:49	13	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2020-02-07 11:01:49	20	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2020-02-07 11:01:49	13	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2020-02-07 11:01:49	22	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2020-02-07 11:01:49	13	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2020-02-07 11:01:49	17	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	132
2018-04-26 13:56:23	22	6°14′N  75°35′W	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	133
2018-04-26 13:56:23	17	6°14′N  75°35′W	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	133
2018-08-20 15:46:44	20	41°39′N  0°53′W	t	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	134
2018-08-20 15:46:44	17	41°39′N  0°53′W	f	coverallsgrowling@gmail.com	2021-03-23 16:08:32.445805	134
2020-07-12 21:28:37	20	Livingstone, Zambia	f	boyshoemaker@gmail.com	2021-03-23 16:08:32.445805	135
2020-01-14 07:23:16	37	13°31′N  2°06′E	f	birchlawful@gmail.com	2021-03-23 16:08:32.445805	136
2020-01-14 07:23:16	24	13°31′N  2°06′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	136
2020-01-14 07:23:16	13	13°31′N  2°06′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	136
2020-01-14 07:23:16	37	13°31′N  2°06′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	136
2020-01-14 07:23:16	17	13°31′N  2°06′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	136
2018-03-10 19:55:20	20	London, United Kingdom	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	137
2018-03-10 19:55:20	20	London, United Kingdom	t	cheepraft@gmail.com	2021-03-23 16:08:32.445805	137
2018-03-10 19:55:20	22	London, United Kingdom	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	137
2018-03-10 19:55:20	22	London, United Kingdom	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	137
2020-10-01 00:02:21	24	Dammam, Saudi Arabia	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	138
2020-10-01 00:02:21	37	Dammam, Saudi Arabia	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	138
2020-10-01 00:02:21	22	Dammam, Saudi Arabia	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	138
2020-10-01 00:02:21	17	Dammam, Saudi Arabia	t	porkendurable@gmail.com	2021-03-23 16:08:32.445805	138
2020-10-01 00:02:21	22	Dammam, Saudi Arabia	f	porkendurable@gmail.com	2021-03-23 16:08:32.445805	138
2018-01-16 04:29:05	24	19°03′N  98°13′W	t	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	139
2018-01-16 04:29:05	20	19°03′N  98°13′W	f	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	139
2018-01-16 04:29:05	13	19°03′N  98°13′W	t	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	139
2018-01-16 04:29:05	24	19°03′N  98°13′W	f	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	139
2018-01-16 04:29:05	37	19°03′N  98°13′W	f	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	139
2019-10-28 14:44:16	22	60°18′N  25°02′E	f	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	140
2019-10-28 14:44:16	17	60°18′N  25°02′E	f	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	140
2019-10-28 14:44:16	17	60°18′N  25°02′E	f	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	140
2018-10-20 18:58:22	53	Milwaukee, United States	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	141
2018-10-20 18:58:22	53	Milwaukee, United States	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	141
2018-10-20 18:58:22	53	Milwaukee, United States	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	141
2018-10-20 18:58:22	41	Milwaukee, United States	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	141
2018-03-02 10:17:04	53	Chandigarh, India	f	birchlawful@gmail.com	2021-03-23 16:08:32.445805	142
2018-03-02 10:17:04	41	Chandigarh, India	f	birchlawful@gmail.com	2021-03-23 16:08:32.445805	142
2020-05-02 01:52:44	53	Tezpur, India	t	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	143
2020-05-02 01:52:44	55	Tezpur, India	f	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	143
2018-07-09 19:45:39	46	George Town, Malaysia	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	144
2018-07-09 19:45:39	46	George Town, Malaysia	f	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	144
2018-07-09 19:45:39	53	George Town, Malaysia	t	nobodyproblem@gmail.com	2021-03-23 16:08:32.445805	144
2018-03-24 20:35:06	55	60°12′N  24°39′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	145
2018-03-24 20:35:06	41	60°12′N  24°39′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	145
2018-03-24 20:35:06	46	60°12′N  24°39′E	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	145
2018-03-24 20:35:06	53	60°12′N  24°39′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	145
2019-07-27 06:44:35	55	Auckland, New Zealand	t	applyclancy@gmail.com	2021-03-23 16:08:32.445805	146
2019-07-27 06:44:35	46	Auckland, New Zealand	t	applyclancy@gmail.com	2021-03-23 16:08:32.445805	146
2019-07-27 06:44:35	55	Auckland, New Zealand	f	applyclancy@gmail.com	2021-03-23 16:08:32.445805	146
2019-07-27 06:44:35	46	Auckland, New Zealand	f	applyclancy@gmail.com	2021-03-23 16:08:32.445805	146
2019-06-27 02:46:15	53	Kano, Nigeria	f	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	147
2019-06-27 02:46:15	55	Kano, Nigeria	t	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	147
2019-06-27 02:46:15	55	Kano, Nigeria	f	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	147
2019-12-01 04:54:40	53	Darwin, Australia	t	orchestratired@gmail.com	2021-03-23 16:08:32.445805	148
2018-12-30 16:10:59	53	Puebla, Mexico	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	149
2018-12-30 16:10:59	53	Puebla, Mexico	t	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	149
2018-12-30 16:10:59	55	Puebla, Mexico	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	149
2020-09-06 22:46:26	41	39°41′N  141°09′E	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	150
2020-09-06 22:46:26	53	39°41′N  141°09′E	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	150
2020-09-06 22:46:26	55	39°41′N  141°09′E	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	150
2018-09-29 19:07:04	41	Bulawayo, Zimbabwe	t	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	151
2018-08-26 01:03:03	46	Siliguri, India	f	collectshark@gmail.com	2021-03-23 16:08:32.445805	152
2018-06-02 20:28:12	41	0°32′N  101°27′E	t	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	153
2018-06-02 20:28:12	41	0°32′N  101°27′E	f	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	153
2018-06-02 20:28:12	41	0°32′N  101°27′E	f	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	153
2018-06-02 20:28:12	55	0°32′N  101°27′E	f	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	153
2018-06-17 21:34:36	53	20°10′S  28°35′E	t	ellipticalcavities@gmail.com	2021-03-23 16:08:32.445805	154
2018-06-17 21:34:36	41	20°10′S  28°35′E	f	ellipticalcavities@gmail.com	2021-03-23 16:08:32.445805	154
2019-01-18 11:23:43	46	33°31′N  36°18′E	f	axereclusive@gmail.com	2021-03-23 16:08:32.445805	155
2019-01-18 11:23:43	41	33°31′N  36°18′E	t	axereclusive@gmail.com	2021-03-23 16:08:32.445805	155
2019-01-18 11:23:43	41	33°31′N  36°18′E	f	axereclusive@gmail.com	2021-03-23 16:08:32.445805	155
2020-02-17 13:26:51	41	Hangzhou,China	t	applyclancy@gmail.com	2021-03-23 16:08:32.445805	156
2019-10-28 14:44:16	55	Paramaribo, Suriname	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	157
2019-10-28 14:44:16	41	Paramaribo, Suriname	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	157
2018-07-26 15:06:47	55	Nanjing,China	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	158
2018-07-26 15:06:47	53	Nanjing,China	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	158
2018-07-23 07:15:53	41	43°32′S  172°37′E	t	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	159
2018-07-23 07:15:53	55	43°32′S  172°37′E	t	brilliantherd@gmail.com	2021-03-23 16:08:32.445805	159
2019-06-18 12:25:05	46	37°58′N  23°43′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	160
2019-06-18 12:25:05	55	37°58′N  23°43′E	t	birchlawful@gmail.com	2021-03-23 16:08:32.445805	160
2019-03-28 10:48:16	41	31°33′N  74°21′E	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	161
2019-03-28 10:48:16	55	31°33′N  74°21′E	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	161
2018-11-21 09:25:22	55	43°32′S  172°37′E	t	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	162
2018-11-21 09:25:22	55	43°32′S  172°37′E	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	162
2018-11-21 09:25:22	46	43°32′S  172°37′E	t	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	162
2018-11-21 09:25:22	55	43°32′S  172°37′E	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	162
2019-11-23 16:30:47	55	38°03′N  114°30′E	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	163
2019-11-23 16:30:47	41	38°03′N  114°30′E	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	163
2019-11-23 16:30:47	55	38°03′N  114°30′E	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	163
2019-11-23 16:30:47	53	38°03′N  114°30′E	t	multiplywinter@gmail.com	2021-03-23 16:08:32.445805	163
2020-02-17 13:26:51	53	53°12′N  50°08′E	f	achehistoric@gmail.com	2021-03-23 16:08:32.445805	164
2020-01-14 07:23:16	41	Namangan, Uzbekistan	t	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	166
2018-12-27 19:31:36	25	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	11	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	12	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	30	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	30	10°17′N  123°54′E	t	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	6	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	47	10°17′N  123°54′E	t	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2018-12-27 19:31:36	11	10°17′N  123°54′E	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	167
2020-03-20 21:34:14	30	Chennai (Madras), India	t	commonglazier@gmail.com	2021-03-23 16:08:32.445805	168
2020-03-20 21:34:14	10	Chennai (Madras), India	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	168
2020-03-20 21:34:14	47	Chennai (Madras), India	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	168
2020-09-06 22:46:26	6	65°01′N  25°28′E	t	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2020-09-06 22:46:26	47	65°01′N  25°28′E	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2020-09-06 22:46:26	25	65°01′N  25°28′E	t	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2020-09-06 22:46:26	10	65°01′N  25°28′E	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2020-09-06 22:46:26	25	65°01′N  25°28′E	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2020-09-06 22:46:26	12	65°01′N  25°28′E	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	169
2018-09-29 19:07:04	12	Las Vegas, United States	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	47	Las Vegas, United States	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	47	Las Vegas, United States	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	25	Las Vegas, United States	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	6	Las Vegas, United States	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	6	Las Vegas, United States	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-09-29 19:07:04	6	Las Vegas, United States	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	170
2018-05-13 14:37:03	10	26°43′N  88°26′E	f	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	171
2018-05-13 14:37:03	47	26°43′N  88°26′E	f	frontdepressed@gmail.com	2021-03-23 16:08:32.445805	171
2018-10-20 18:58:22	30	Guatemala City, Guatemala	f	meinieutility@gmail.com	2021-03-23 16:08:32.445805	172
2018-10-20 18:58:22	10	Guatemala City, Guatemala	t	meinieutility@gmail.com	2021-03-23 16:08:32.445805	172
2018-10-20 18:58:22	36	Guatemala City, Guatemala	t	meinieutility@gmail.com	2021-03-23 16:08:32.445805	172
2018-10-20 18:58:22	11	Guatemala City, Guatemala	f	meinieutility@gmail.com	2021-03-23 16:08:32.445805	172
2018-10-20 18:58:22	25	Guatemala City, Guatemala	t	meinieutility@gmail.com	2021-03-23 16:08:32.445805	172
2020-02-17 13:26:51	11	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	10	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	10	34°16′N  108°54′E	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	25	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	47	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	25	34°16′N  108°54′E	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	30	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2020-02-17 13:26:51	10	34°16′N  108°54′E	f	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	173
2019-06-06 16:31:10	10	Pekanbaru, Indonesia	t	applyclancy@gmail.com	2021-03-23 16:08:32.445805	174
2019-06-06 16:31:10	36	Pekanbaru, Indonesia	t	applyclancy@gmail.com	2021-03-23 16:08:32.445805	174
2019-06-06 16:31:10	6	Pekanbaru, Indonesia	f	applyclancy@gmail.com	2021-03-23 16:08:32.445805	174
2019-06-06 16:31:10	10	Pekanbaru, Indonesia	f	applyclancy@gmail.com	2021-03-23 16:08:32.445805	174
2019-06-06 16:31:10	36	Pekanbaru, Indonesia	f	applyclancy@gmail.com	2021-03-23 16:08:32.445805	174
2018-08-26 01:03:03	6	Huế, Vietnam	f	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	47	Huế, Vietnam	t	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	11	Huế, Vietnam	t	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	36	Huế, Vietnam	f	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	6	Huế, Vietnam	f	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	6	Huế, Vietnam	f	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	6	Huế, Vietnam	t	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-08-26 01:03:03	12	Huế, Vietnam	f	personuneasiness@gmail.com	2021-03-23 16:08:32.445805	175
2018-09-23 07:54:40	12	Sabha, Libya	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	11	Sabha, Libya	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	11	Sabha, Libya	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	25	Sabha, Libya	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	12	Sabha, Libya	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	25	Sabha, Libya	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-09-23 07:54:40	25	Sabha, Libya	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	176
2018-01-06 07:50:26	11	Milwaukee, United States	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	177
2018-01-06 07:50:26	25	Milwaukee, United States	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	177
2018-01-06 07:50:26	10	Milwaukee, United States	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	177
2020-06-17 11:46:46	12	Multan, Pakistan	t	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	179
2020-06-17 11:46:46	47	Multan, Pakistan	t	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	179
2020-06-17 11:46:46	10	Multan, Pakistan	f	ravecrafting@gmail.com	2021-03-23 16:08:32.445805	179
2020-10-31 22:29:01	12	41°28′S  72°56′W	f	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	181
2018-09-23 10:35:04	11	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	6	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	47	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	47	58°10′N  8°00′E	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	47	58°10′N  8°00′E	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	36	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	11	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2018-09-23 10:35:04	30	58°10′N  8°00′E	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	182
2019-04-27 17:40:55	30	45°17′N  66°05′W	t	commonglazier@gmail.com	2021-03-23 16:08:32.445805	183
2019-04-27 17:40:55	47	45°17′N  66°05′W	t	commonglazier@gmail.com	2021-03-23 16:08:32.445805	183
2019-04-27 17:40:55	10	45°17′N  66°05′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	183
2019-04-27 17:40:55	12	45°17′N  66°05′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	183
2019-04-27 17:40:55	25	45°17′N  66°05′W	f	commonglazier@gmail.com	2021-03-23 16:08:32.445805	183
2019-11-04 19:36:05	30	43°32′S  172°37′E	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	184
2019-11-04 19:36:05	11	43°32′S  172°37′E	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	184
2019-11-04 19:36:05	36	43°32′S  172°37′E	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	184
2019-11-04 19:36:05	36	43°32′S  172°37′E	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	184
2020-07-31 03:42:42	11	Tuktoyaktuk, Canada	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	185
2020-07-31 03:42:42	10	Tuktoyaktuk, Canada	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	185
2020-07-31 03:42:42	12	Tuktoyaktuk, Canada	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	185
2020-07-31 03:42:42	11	Tuktoyaktuk, Canada	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	185
2020-07-31 03:42:42	12	Tuktoyaktuk, Canada	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	185
2019-12-16 18:22:25	11	Tapachula, Mexico	f	delightedasian@gmail.com	2021-03-23 16:08:32.445805	186
2018-06-17 21:34:36	47	14°38′N  121°02′E	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	187
2018-07-23 07:15:53	30	Paramaribo, Suriname	f	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	30	Paramaribo, Suriname	f	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	10	Paramaribo, Suriname	f	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	36	Paramaribo, Suriname	t	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	36	Paramaribo, Suriname	t	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	30	Paramaribo, Suriname	t	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	11	Paramaribo, Suriname	t	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2018-07-23 07:15:53	11	Paramaribo, Suriname	f	ruddydecorate@gmail.com	2021-03-23 16:08:32.445805	188
2019-10-30 20:15:19	10	Niamey, Niger	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	189
2019-10-30 20:15:19	11	Niamey, Niger	f	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	189
2018-04-21 05:27:52	36	33°50′N  132°46′E	t	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	12	33°50′N  132°46′E	t	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	12	33°50′N  132°46′E	f	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	25	33°50′N  132°46′E	f	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	11	33°50′N  132°46′E	t	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	25	33°50′N  132°46′E	t	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2018-04-21 05:27:52	30	33°50′N  132°46′E	f	delightedasian@gmail.com	2021-03-23 16:08:32.445805	191
2019-12-16 18:22:25	11	6°40′N  1°37′W	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	10	6°40′N  1°37′W	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	10	6°40′N  1°37′W	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	47	6°40′N  1°37′W	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	12	6°40′N  1°37′W	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	47	6°40′N  1°37′W	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2019-12-16 18:22:25	25	6°40′N  1°37′W	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	192
2018-04-21 05:27:52	34	51°53′N  176°39′W	f	portraitcar@gmail.com	2021-03-23 16:08:32.445805	193
2019-01-21 07:07:23	9	Little Rock, United States	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	194
2019-01-21 07:07:23	48	Little Rock, United States	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	194
2019-01-21 07:07:23	48	Little Rock, United States	t	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	194
2019-01-21 07:07:23	9	Little Rock, United States	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	194
2019-06-12 11:08:08	31	13°31′N  2°06′E	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	195
2019-06-12 11:08:08	29	13°31′N  2°06′E	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	195
2019-06-12 11:08:08	29	13°31′N  2°06′E	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	195
2019-06-12 11:08:08	48	13°31′N  2°06′E	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	195
2020-09-05 01:50:03	34	Lomé, Togo	t	collectshark@gmail.com	2021-03-23 16:08:32.445805	196
2018-04-26 13:56:23	31	22°15′N  97°52′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2018-04-26 13:56:23	9	22°15′N  97°52′W	t	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2018-04-26 13:56:23	31	22°15′N  97°52′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2018-04-26 13:56:23	9	22°15′N  97°52′W	t	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2018-04-26 13:56:23	34	22°15′N  97°52′W	f	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2018-04-26 13:56:23	29	22°15′N  97°52′W	t	doppingfardage@gmail.com	2021-03-23 16:08:32.445805	197
2020-10-01 00:02:21	29	Hangzhou,China	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	198
2020-10-01 00:02:21	29	Hangzhou,China	t	profiletow@gmail.com	2021-03-23 16:08:32.445805	198
2020-10-01 00:02:21	9	Hangzhou,China	f	profiletow@gmail.com	2021-03-23 16:08:32.445805	198
2019-06-12 16:37:20	29	32°53′S  68°49′W	f	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	199
2019-06-12 16:37:20	48	32°53′S  68°49′W	t	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	199
2019-06-12 16:37:20	29	32°53′S  68°49′W	f	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	199
2019-06-12 16:37:20	29	32°53′S  68°49′W	f	undyingnomination@gmail.com	2021-03-23 16:08:32.445805	199
2019-11-04 19:36:05	15	Gaziantep, Turkey	f	achehistoric@gmail.com	2021-03-23 16:08:32.445805	200
2019-11-04 19:36:05	48	Gaziantep, Turkey	f	achehistoric@gmail.com	2021-03-23 16:08:32.445805	200
2020-05-30 02:20:57	31	40°11′N  44°31′E	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	201
2020-05-30 02:20:57	34	40°11′N  44°31′E	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	201
2020-05-30 02:20:57	15	40°11′N  44°31′E	f	weaponinitiative@gmail.com	2021-03-23 16:08:32.445805	201
2019-11-23 16:30:47	34	Bergen, Norway	f	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	202
2019-11-23 16:30:47	15	Bergen, Norway	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	202
2019-11-23 16:30:47	34	Bergen, Norway	t	chemisespoon@gmail.com	2021-03-23 16:08:32.445805	202
2019-06-12 11:08:08	9	Milwaukee, United States	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	203
2019-06-12 11:08:08	15	Milwaukee, United States	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	203
2019-06-12 11:08:08	29	Milwaukee, United States	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	203
2019-06-12 11:08:08	29	Milwaukee, United States	t	accomplisharctic@gmail.com	2021-03-23 16:08:32.445805	203
2018-11-22 12:17:44	15	51°53′N  176°39′W	t	poachedvisa@gmail.com	2021-03-23 16:08:32.445805	204
2019-09-30 17:56:01	48	41°28′S  72°56′W	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2019-09-30 17:56:01	34	41°28′S  72°56′W	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2019-09-30 17:56:01	48	41°28′S  72°56′W	t	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2019-09-30 17:56:01	29	41°28′S  72°56′W	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2019-09-30 17:56:01	15	41°28′S  72°56′W	f	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2019-09-30 17:56:01	15	41°28′S  72°56′W	t	drinkwhen@gmail.com	2021-03-23 16:08:32.445805	205
2018-02-17 02:14:26	9	San Sebastián, Spain	f	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2018-02-17 02:14:26	29	San Sebastián, Spain	t	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2018-02-17 02:14:26	31	San Sebastián, Spain	f	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2018-02-17 02:14:26	15	San Sebastián, Spain	t	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2018-02-17 02:14:26	29	San Sebastián, Spain	f	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2018-02-17 02:14:26	15	San Sebastián, Spain	t	slobreaction@gmail.com	2021-03-23 16:08:32.445805	206
2019-04-24 02:46:26	9	Mumbai, India	f	sauceinfinite@gmail.com	2021-03-23 16:08:32.445805	207
2019-04-24 02:46:26	48	Mumbai, India	t	sauceinfinite@gmail.com	2021-03-23 16:08:32.445805	207
2019-04-24 02:46:26	9	Mumbai, India	f	sauceinfinite@gmail.com	2021-03-23 16:08:32.445805	207
2018-05-07 01:58:36	48	9°58′S  67°49′W	t	cheepraft@gmail.com	2021-03-23 16:08:32.445805	208
2018-05-07 01:58:36	15	9°58′S  67°49′W	f	cheepraft@gmail.com	2021-03-23 16:08:32.445805	208
2020-03-22 02:14:05	29	63°17′N  18°44′E	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2020-03-22 02:14:05	34	63°17′N  18°44′E	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2020-03-22 02:14:05	31	63°17′N  18°44′E	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2020-03-22 02:14:05	9	63°17′N  18°44′E	t	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2020-03-22 02:14:05	34	63°17′N  18°44′E	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2020-03-22 02:14:05	34	63°17′N  18°44′E	f	visionflannels@gmail.com	2021-03-23 16:08:32.445805	209
2018-06-17 21:34:36	15	Fredericton, Canada	f	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-06-17 21:34:36	9	Fredericton, Canada	f	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-06-17 21:34:36	15	Fredericton, Canada	t	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-06-17 21:34:36	15	Fredericton, Canada	f	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-06-17 21:34:36	34	Fredericton, Canada	f	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-06-17 21:34:36	29	Fredericton, Canada	t	onionscycling@gmail.com	2021-03-23 16:08:32.445805	210
2018-03-24 20:35:06	48	16°26′S  179°22′E	f	collectshark@gmail.com	2021-03-23 16:08:32.445805	211
2018-03-24 20:35:06	29	16°26′S  179°22′E	f	collectshark@gmail.com	2021-03-23 16:08:32.445805	211
2018-03-24 20:35:06	31	16°26′S  179°22′E	t	collectshark@gmail.com	2021-03-23 16:08:32.445805	211
2018-03-24 20:35:06	48	16°26′S  179°22′E	f	collectshark@gmail.com	2021-03-23 16:08:32.445805	211
2019-03-28 10:48:16	34	Nanjing,China	f	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	212
2019-03-28 10:48:16	34	Nanjing,China	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	212
2019-03-28 10:48:16	29	Nanjing,China	t	cobwebevent@gmail.com	2021-03-23 16:08:32.445805	212
2018-12-01 04:27:04	15	Livingstone, Zambia	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	213
2018-12-01 04:27:04	29	Livingstone, Zambia	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	213
2018-12-01 04:27:04	31	Livingstone, Zambia	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	213
2018-12-01 04:27:04	34	Livingstone, Zambia	t	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	213
2018-12-01 04:27:04	9	Livingstone, Zambia	f	kneelabourer@gmail.com	2021-03-23 16:08:32.445805	213
2020-02-05 14:49:08	31	Hagåtña, United States	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	214
2020-02-05 14:49:08	9	Hagåtña, United States	f	tautcanoe@gmail.com	2021-03-23 16:08:32.445805	214
2019-11-24 00:45:39	48	20°40′N  105°16′W	t	yumdoylt@gmail.com	2021-03-23 16:08:32.445805	215
2018-06-17 21:34:36	34	63°50′N  20°16′E	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	216
2018-06-17 21:34:36	29	63°50′N  20°16′E	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	216
2018-06-17 21:34:36	9	63°50′N  20°16′E	f	offtrouble@gmail.com	2021-03-23 16:08:32.445805	216
2018-06-17 21:34:36	29	63°50′N  20°16′E	t	offtrouble@gmail.com	2021-03-23 16:08:32.445805	216
2020-10-31 22:29:01	15	48°23′N  89°15′W	f	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	217
2020-10-31 22:29:01	31	48°23′N  89°15′W	f	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	217
2020-10-31 22:29:01	15	48°23′N  89°15′W	t	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	217
2020-10-31 22:29:01	15	48°23′N  89°15′W	f	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	217
2018-03-02 14:08:57	31	Calgary, Canada	t	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	218
2018-03-02 14:08:57	15	Calgary, Canada	t	evidencerighteous@gmail.com	2021-03-23 16:08:32.445805	218
2020-10-22 05:56:55	16	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	27	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	22	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	40	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	13	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	50	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	11	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	32	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	51	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	33	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	40	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	24	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	38	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	33	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	24	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2018-07-23 07:15:53	8	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	16	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	11	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	52	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	25	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	38	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	27	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	25	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	25	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	45	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	45	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	28	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	39	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	49	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	17	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	36	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	21	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	43	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	13	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	50	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	22	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	54	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	39	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	22	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	40	San Sebastián, Spain	t	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	53	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	12	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2018-07-23 07:15:53	23	San Sebastián, Spain	f	multiplywinter@gmail.com	2021-03-25 16:07:06.792242	3
2020-05-02 11:05:18	40	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	54	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	33	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	18	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	35	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	54	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	45	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	17	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	41	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	53	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	7	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	20	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	19	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	45	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	39	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	11	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	34	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	22	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	15	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	15	Hermosillo, Mexico	f	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	27	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-05-02 11:05:18	12	Hermosillo, Mexico	t	nobodyproblem@gmail.com	2021-03-25 16:07:06.792242	4
2020-01-14 07:23:16	54	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	6	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	21	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	31	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	52	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	33	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	22	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	50	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	47	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	32	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	9	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	27	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	26	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	31	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	54	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	53	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	29	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	51	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	32	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	40	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	23	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	53	Puerto Aisén, Chile	t	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2020-01-14 07:23:16	28	Puerto Aisén, Chile	f	octopusfan@gmail.com	2021-03-25 16:07:06.792242	5
2019-12-06 21:00:47	43	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	23	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	48	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	26	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	39	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	33	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	41	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	49	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	8	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	23	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	31	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	21	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	37	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	41	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	27	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	26	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	11	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	23	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	9	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	12	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	19	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	44	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	54	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	15	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	32	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	6	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	50	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	9	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	8	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	26	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	54	Christchurch, New Zealand	t	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-12-06 21:00:47	48	Christchurch, New Zealand	f	slobreaction@gmail.com	2021-03-25 16:07:06.792242	6
2019-08-08 22:07:15	17	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	16	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	32	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	46	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	16	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	17	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	15	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	26	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	40	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	15	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	15	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	39	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	17	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	31	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	45	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	38	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	46	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	34	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	53	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	43	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	50	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	23	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	15	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	45	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	7	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	24	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	13	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	7	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	23	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	24	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2018-01-13 09:33:55	42	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	14	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	14	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	32	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	50	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	43	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	7	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	42	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	21	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	28	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	39	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	35	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	19	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	26	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	32	Adak, United States	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2018-01-13 09:33:55	16	Adak, United States	t	visionflannels@gmail.com	2021-03-23 16:06:21.113456	1
2019-01-23 16:46:41	14	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	38	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	7	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	40	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	23	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	26	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	8	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	21	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	23	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	14	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	14	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	43	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	38	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	40	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	14	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	16	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	16	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	39	60°23′N  5°20′E	f	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	16	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2019-01-23 16:46:41	8	60°23′N  5°20′E	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	2
2018-01-16 04:29:05	51	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	23	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	43	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	40	6°14′N  75°35′W	t	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	19	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	42	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	7	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	54	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2018-01-16 04:29:05	40	6°14′N  75°35′W	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	3
2020-03-22 02:14:05	42	Mashhad, Iran	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	4
2020-03-22 02:14:05	26	Mashhad, Iran	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	4
2020-03-22 02:14:05	16	Mashhad, Iran	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	4
2020-03-22 02:14:05	50	Mashhad, Iran	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	4
2020-03-22 02:14:05	39	Mashhad, Iran	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	4
2018-03-14 04:45:23	17	60°12′N  24°39′E	t	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	5
2018-03-14 04:45:23	17	60°12′N  24°39′E	f	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	5
2018-03-14 04:45:23	22	60°12′N  24°39′E	t	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	5
2018-03-14 04:45:23	20	60°12′N  24°39′E	f	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	5
2018-03-14 04:45:23	17	60°12′N  24°39′E	f	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	5
2019-10-30 20:15:19	37	Tucson, United States	f	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	7
2019-10-30 20:15:19	22	Tucson, United States	f	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	7
2019-10-30 20:15:19	24	Tucson, United States	t	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	7
2020-06-08 08:19:20	22	35°40′N  138°34′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	8
2020-06-08 08:19:20	17	35°40′N  138°34′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	8
2020-06-08 08:19:20	20	35°40′N  138°34′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	8
2018-08-14 13:58:55	24	22°15′N  97°52′W	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	9
2018-08-14 13:58:55	24	22°15′N  97°52′W	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	9
2018-08-14 13:58:55	37	22°15′N  97°52′W	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	9
2020-06-27 17:45:23	13	Quezon City, Philippines	f	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	10
2020-06-27 17:45:23	13	Quezon City, Philippines	f	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	10
2020-06-27 17:45:23	24	Quezon City, Philippines	f	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	10
2020-06-27 17:45:23	22	Quezon City, Philippines	t	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	10
2018-06-27 03:05:59	13	29°07′S  26°13′E	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2018-06-27 03:05:59	24	29°07′S  26°13′E	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2018-06-27 03:05:59	22	29°07′S  26°13′E	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2018-06-27 03:05:59	22	29°07′S  26°13′E	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2018-06-27 03:05:59	37	29°07′S  26°13′E	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2018-06-27 03:05:59	13	29°07′S  26°13′E	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	11
2019-01-21 18:45:55	20	Dar es Salaam, Tanzania	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	12
2019-01-21 18:45:55	37	Dar es Salaam, Tanzania	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	12
2019-01-21 18:45:55	17	Dar es Salaam, Tanzania	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	12
2020-07-06 18:53:32	37	33°35′N  130°24′E	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	13
2020-07-06 18:53:32	20	33°35′N  130°24′E	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	13
2020-02-11 07:10:44	17	Hermosillo, Mexico	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	14
2020-02-11 07:10:44	37	Hermosillo, Mexico	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	14
2020-02-11 07:10:44	17	Hermosillo, Mexico	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	14
2020-02-11 07:10:44	13	Hermosillo, Mexico	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	14
2019-09-30 17:56:01	37	Riga, Latvia	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	15
2019-09-30 17:56:01	17	Riga, Latvia	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	15
2019-09-30 17:56:01	37	Riga, Latvia	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	15
2019-09-30 17:56:01	24	Riga, Latvia	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	15
2019-09-30 17:56:01	13	Riga, Latvia	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	15
2018-09-23 07:15:13	20	Pietermaritzburg, South Africa	t	cheepraft@gmail.com	2021-03-23 16:06:21.113456	16
2018-09-23 07:15:13	37	Pietermaritzburg, South Africa	t	cheepraft@gmail.com	2021-03-23 16:06:21.113456	16
2018-09-23 07:15:13	20	Pietermaritzburg, South Africa	f	cheepraft@gmail.com	2021-03-23 16:06:21.113456	16
2018-09-23 07:15:13	24	Pietermaritzburg, South Africa	f	cheepraft@gmail.com	2021-03-23 16:06:21.113456	16
2018-09-23 07:15:13	20	Pietermaritzburg, South Africa	t	cheepraft@gmail.com	2021-03-23 16:06:21.113456	16
2019-06-18 12:25:05	22	5°52′N  55°10′W	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	17
2019-06-18 12:25:05	22	5°52′N  55°10′W	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	17
2018-04-21 05:27:52	24	58°10′N  8°00′E	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	18
2020-02-28 16:48:59	17	Hannover, Germany	f	evidencerighteous@gmail.com	2021-03-23 16:06:21.113456	19
2018-06-29 07:47:13	37	45°34′S  72°04′W	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-06-29 07:47:13	22	45°34′S  72°04′W	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-06-29 07:47:13	20	45°34′S  72°04′W	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-06-29 07:47:13	20	45°34′S  72°04′W	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-06-29 07:47:13	17	45°34′S  72°04′W	t	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-06-29 07:47:13	37	45°34′S  72°04′W	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	20
2018-12-30 16:10:59	37	Tromsø, Norway	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	21
2018-12-30 16:10:59	20	Tromsø, Norway	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	21
2018-12-30 16:10:59	22	Tromsø, Norway	f	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	21
2018-12-30 16:10:59	17	Tromsø, Norway	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	21
2020-05-05 03:25:31	22	51°02′N  13°44′E	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	22
2020-05-05 03:25:31	20	51°02′N  13°44′E	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	22
2020-05-05 03:25:31	24	51°02′N  13°44′E	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	22
2020-05-05 03:25:31	22	51°02′N  13°44′E	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	22
2020-05-05 03:25:31	20	51°02′N  13°44′E	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	22
2020-02-07 06:20:36	37	Livingstone, Zambia	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	23
2020-02-07 06:20:36	13	Livingstone, Zambia	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	23
2020-02-07 06:20:36	22	Livingstone, Zambia	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	23
2020-04-03 15:54:50	17	Qaanaaq, Denmark	f	weaponinitiative@gmail.com	2021-03-23 16:06:21.113456	24
2020-04-03 15:54:50	37	Qaanaaq, Denmark	t	weaponinitiative@gmail.com	2021-03-23 16:06:21.113456	24
2018-04-21 05:27:52	37	Yerevan, Armenia	f	weaponinitiative@gmail.com	2021-03-23 16:06:21.113456	25
2019-04-20 14:08:49	20	43°03′N  87°57′W	t	railisraeli@gmail.com	2021-03-23 16:06:21.113456	26
2020-10-01 00:02:21	17	Nuuk (Godthåb), Denmark	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	28
2020-10-01 00:02:21	22	Nuuk (Godthåb), Denmark	t	portraitcar@gmail.com	2021-03-23 16:06:21.113456	28
2020-10-01 00:02:21	24	Nuuk (Godthåb), Denmark	f	portraitcar@gmail.com	2021-03-23 16:06:21.113456	28
2019-06-27 02:46:15	24	Oklahoma City, United States	t	ruddydecorate@gmail.com	2021-03-23 16:06:21.113456	29
2019-06-27 02:46:15	13	Oklahoma City, United States	t	ruddydecorate@gmail.com	2021-03-23 16:06:21.113456	29
2019-03-14 12:44:22	17	Paramaribo, Suriname	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	30
2019-03-14 12:44:22	13	Paramaribo, Suriname	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	30
2019-03-14 12:44:22	37	Paramaribo, Suriname	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	30
2019-03-14 12:44:22	20	Paramaribo, Suriname	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	30
2019-03-14 12:44:22	24	Paramaribo, Suriname	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	30
2020-05-05 03:25:31	53	Nizhny Novgorod, Russia	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	31
2020-04-03 15:54:50	53	41°28′S  72°56′W	f	boyshoemaker@gmail.com	2021-03-23 16:06:21.113456	32
2020-04-03 15:54:50	53	41°28′S  72°56′W	t	boyshoemaker@gmail.com	2021-03-23 16:06:21.113456	32
2018-12-30 16:10:59	41	Hilo, United States	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	33
2018-12-30 16:10:59	46	Hilo, United States	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	33
2019-07-06 06:11:21	46	Adak, United States	f	ruddydecorate@gmail.com	2021-03-23 16:06:21.113456	34
2019-08-18 23:02:46	41	Simferopol, Ukraine	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	35
2019-08-18 23:02:46	41	Simferopol, Ukraine	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	35
2019-08-18 23:02:46	46	Simferopol, Ukraine	f	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	35
2019-08-18 23:02:46	46	Simferopol, Ukraine	t	doppingfardage@gmail.com	2021-03-23 16:06:21.113456	35
2020-10-31 22:29:01	41	25°25′S  49°15′W	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	36
2020-10-31 22:29:01	55	25°25′S  49°15′W	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	36
2020-10-31 22:29:01	46	25°25′S  49°15′W	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	36
2020-10-31 22:29:01	53	25°25′S  49°15′W	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	36
2018-12-01 04:27:04	55	Iquique, Chile	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	38
2018-12-01 04:27:04	46	Iquique, Chile	t	babbleunease@gmail.com	2021-03-23 16:06:21.113456	38
2018-12-01 04:27:04	41	Iquique, Chile	t	babbleunease@gmail.com	2021-03-23 16:06:21.113456	38
2018-12-01 04:27:04	53	Iquique, Chile	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	38
2018-09-23 07:15:13	55	70°59′N  25°59′E	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	39
2018-09-23 07:15:13	46	70°59′N  25°59′E	f	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	39
2018-09-23 07:15:13	53	70°59′N  25°59′E	t	frontdepressed@gmail.com	2021-03-23 16:06:21.113456	39
2018-03-03 10:27:57	55	Aomori, Japan	f	multiplywinter@gmail.com	2021-03-23 16:06:21.113456	40
2018-03-03 10:27:57	53	Aomori, Japan	f	multiplywinter@gmail.com	2021-03-23 16:06:21.113456	40
2018-12-03 13:43:23	55	Pietermaritzburg, South Africa	f	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	41
2018-12-03 13:43:23	53	Pietermaritzburg, South Africa	f	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	41
2018-12-03 13:43:23	41	Pietermaritzburg, South Africa	t	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	41
2018-12-03 13:43:23	53	Pietermaritzburg, South Africa	t	ravecrafting@gmail.com	2021-03-23 16:06:21.113456	41
2018-09-28 21:42:18	53	Kano, Nigeria	f	delightedasian@gmail.com	2021-03-23 16:06:21.113456	42
2018-09-28 21:42:18	46	Kano, Nigeria	f	delightedasian@gmail.com	2021-03-23 16:06:21.113456	42
2018-09-28 21:42:18	53	Kano, Nigeria	t	delightedasian@gmail.com	2021-03-23 16:06:21.113456	42
2018-03-02 10:17:04	41	21°46′S  43°21′W	t	kneelabourer@gmail.com	2021-03-23 16:06:21.113456	43
2018-03-02 10:17:04	53	21°46′S  43°21′W	f	kneelabourer@gmail.com	2021-03-23 16:06:21.113456	43
2018-03-02 10:17:04	53	21°46′S  43°21′W	f	kneelabourer@gmail.com	2021-03-23 16:06:21.113456	43
2018-02-07 11:13:48	41	Barranquilla, Colombia	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	44
2018-02-07 11:13:48	46	Barranquilla, Colombia	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	44
2018-02-07 11:13:48	53	Barranquilla, Colombia	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	44
2020-04-07 15:26:54	53	33°35′N  130°24′E	f	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	45
2020-04-07 15:26:54	55	33°35′N  130°24′E	f	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	45
2018-02-20 17:40:18	41	Yerevan, Armenia	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	46
2018-02-20 17:40:18	53	Yerevan, Armenia	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	46
2019-06-12 11:08:08	46	67°51′N  20°13′E	t	octopusfan@gmail.com	2021-03-23 16:06:21.113456	47
2019-06-12 11:08:08	55	67°51′N  20°13′E	f	octopusfan@gmail.com	2021-03-23 16:06:21.113456	47
2018-11-07 19:49:36	46	69°41′N  18°57′E	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	48
2018-11-07 19:49:36	46	69°41′N  18°57′E	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	48
2018-05-13 14:37:03	55	29°06′N  110°57′W	f	offtrouble@gmail.com	2021-03-23 16:06:21.113456	49
2018-05-13 14:37:03	46	29°06′N  110°57′W	f	offtrouble@gmail.com	2021-03-23 16:06:21.113456	49
2018-05-13 14:37:03	55	29°06′N  110°57′W	t	offtrouble@gmail.com	2021-03-23 16:06:21.113456	49
2018-10-24 14:25:30	55	12°27′S  130°50′E	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	50
2018-10-24 14:25:30	46	12°27′S  130°50′E	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	50
2018-10-24 14:25:30	41	12°27′S  130°50′E	t	babbleunease@gmail.com	2021-03-23 16:06:21.113456	50
2018-10-24 14:25:30	55	12°27′S  130°50′E	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	50
2018-01-16 04:29:05	41	Freetown, Sierra Leone	t	evidencerighteous@gmail.com	2021-03-23 16:06:21.113456	51
2018-01-16 04:29:05	55	Freetown, Sierra Leone	f	evidencerighteous@gmail.com	2021-03-23 16:06:21.113456	51
2019-01-23 16:46:41	46	Pyongyang, North Korea	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	52
2019-01-23 16:46:41	46	Pyongyang, North Korea	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	52
2019-01-23 16:46:41	46	Pyongyang, North Korea	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	52
2019-01-23 16:46:41	41	Pyongyang, North Korea	t	collectshark@gmail.com	2021-03-23 16:06:21.113456	52
2019-12-18 06:17:32	53	Panama City, Panama	f	profiletow@gmail.com	2021-03-23 16:06:21.113456	53
2019-12-18 06:17:32	55	Panama City, Panama	f	profiletow@gmail.com	2021-03-23 16:06:21.113456	53
2019-12-16 18:22:25	55	Río Gallegos, Argentina	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	54
2019-12-16 18:22:25	55	Río Gallegos, Argentina	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	54
2019-12-16 18:22:25	53	Río Gallegos, Argentina	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	54
2019-12-16 18:22:25	55	Río Gallegos, Argentina	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	54
2018-06-27 03:05:59	41	Chandigarh, India	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	55
2018-06-27 03:05:59	53	Chandigarh, India	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	55
2018-06-27 03:05:59	55	Chandigarh, India	f	porkendurable@gmail.com	2021-03-23 16:06:21.113456	55
2018-06-06 09:37:49	53	14°38′N  121°02′E	f	birchlawful@gmail.com	2021-03-23 16:06:21.113456	56
2018-06-06 09:37:49	53	14°38′N  121°02′E	t	birchlawful@gmail.com	2021-03-23 16:06:21.113456	56
2018-06-06 09:37:49	55	14°38′N  121°02′E	t	birchlawful@gmail.com	2021-03-23 16:06:21.113456	56
2018-07-29 11:38:10	36	26°43′N  88°26′E	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	30	26°43′N  88°26′E	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	36	26°43′N  88°26′E	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	30	26°43′N  88°26′E	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	30	26°43′N  88°26′E	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	10	26°43′N  88°26′E	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	12	26°43′N  88°26′E	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2018-07-29 11:38:10	10	26°43′N  88°26′E	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	57
2020-09-03 12:26:56	25	Las Vegas, United States	f	constantambition@gmail.com	2021-03-23 16:06:21.113456	58
2020-09-03 12:26:56	6	Las Vegas, United States	t	constantambition@gmail.com	2021-03-23 16:06:21.113456	58
2020-06-07 07:06:47	6	Nuuk (Godthåb), Denmark	f	cheepraft@gmail.com	2021-03-23 16:06:21.113456	59
2020-06-07 07:06:47	11	Nuuk (Godthåb), Denmark	t	cheepraft@gmail.com	2021-03-23 16:06:21.113456	59
2020-06-07 07:06:47	47	Nuuk (Godthåb), Denmark	t	cheepraft@gmail.com	2021-03-23 16:06:21.113456	59
2020-06-07 07:06:47	36	Nuuk (Godthåb), Denmark	f	cheepraft@gmail.com	2021-03-23 16:06:21.113456	59
2020-06-07 07:06:47	10	Nuuk (Godthåb), Denmark	f	cheepraft@gmail.com	2021-03-23 16:06:21.113456	59
2020-01-10 18:35:48	30	32°53′S  68°49′W	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	60
2020-01-10 18:35:48	30	32°53′S  68°49′W	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	60
2020-01-10 18:35:48	25	32°53′S  68°49′W	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	60
2020-01-10 18:35:48	36	32°53′S  68°49′W	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	60
2020-01-10 18:35:48	47	32°53′S  68°49′W	t	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	60
2018-03-28 23:27:58	47	16°28′N  107°35′E	f	applyclancy@gmail.com	2021-03-23 16:06:21.113456	61
2018-07-26 15:06:47	47	Akureyri, Iceland	t	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	10	Akureyri, Iceland	f	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	11	Akureyri, Iceland	f	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	12	Akureyri, Iceland	f	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	6	Akureyri, Iceland	f	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	10	Akureyri, Iceland	t	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-07-26 15:06:47	36	Akureyri, Iceland	t	sauceinfinite@gmail.com	2021-03-23 16:06:21.113456	62
2018-12-05 21:41:43	47	43°32′S  172°37′E	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	63
2018-12-05 21:41:43	6	43°32′S  172°37′E	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	63
2018-12-05 21:41:43	25	43°32′S  172°37′E	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	63
2019-10-30 03:05:29	12	Fredericton, Canada	f	delightedasian@gmail.com	2021-03-23 16:06:21.113456	64
2019-10-30 03:05:29	30	Fredericton, Canada	f	delightedasian@gmail.com	2021-03-23 16:06:21.113456	64
2019-10-30 03:05:29	47	Fredericton, Canada	t	delightedasian@gmail.com	2021-03-23 16:06:21.113456	64
2018-08-29 09:57:32	10	30°12′N  71°28′E	t	delightedasian@gmail.com	2021-03-23 16:06:21.113456	65
2018-08-29 09:57:32	47	30°12′N  71°28′E	f	delightedasian@gmail.com	2021-03-23 16:06:21.113456	65
2018-08-29 09:57:32	6	30°12′N  71°28′E	t	delightedasian@gmail.com	2021-03-23 16:06:21.113456	65
2018-08-29 09:57:32	30	30°12′N  71°28′E	t	delightedasian@gmail.com	2021-03-23 16:06:21.113456	65
2018-06-17 21:34:36	47	Simferopol, Ukraine	t	achehistoric@gmail.com	2021-03-23 16:06:21.113456	66
2020-10-22 05:56:55	36	Dar es Salaam, Tanzania	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	12	Dar es Salaam, Tanzania	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	30	Dar es Salaam, Tanzania	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	10	Dar es Salaam, Tanzania	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	10	Dar es Salaam, Tanzania	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	47	Dar es Salaam, Tanzania	t	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-10-22 05:56:55	25	Dar es Salaam, Tanzania	f	fishtax@gmail.com	2021-03-23 16:06:21.113456	67
2020-05-28 10:31:16	6	Konya, Turkey	t	accomplisharctic@gmail.com	2021-03-23 16:06:21.113456	68
2019-06-12 16:37:20	6	João Pessoa, Brazil	f	achehistoric@gmail.com	2021-03-23 16:06:21.113456	69
2018-01-13 09:33:55	30	Santa Fe, United States	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	36	Santa Fe, United States	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	25	Santa Fe, United States	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	25	Santa Fe, United States	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	47	Santa Fe, United States	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	6	Santa Fe, United States	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2018-01-13 09:33:55	6	Santa Fe, United States	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	70
2019-08-08 22:07:15	30	Bloemfontein, South Africa	f	kneelabourer@gmail.com	2021-03-23 16:06:21.113456	71
2019-08-08 22:07:15	12	Bloemfontein, South Africa	f	kneelabourer@gmail.com	2021-03-23 16:06:21.113456	71
2019-01-10 02:18:51	47	Oulu, Finland	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	72
2019-01-10 02:18:51	6	Oulu, Finland	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	72
2019-01-10 02:18:51	6	Oulu, Finland	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	72
2019-03-14 12:44:22	10	39°01′N  125°44′E	f	personuneasiness@gmail.com	2021-03-23 16:06:21.113456	73
2019-03-14 12:44:22	25	39°01′N  125°44′E	f	personuneasiness@gmail.com	2021-03-23 16:06:21.113456	73
2019-03-14 12:44:22	11	39°01′N  125°44′E	f	personuneasiness@gmail.com	2021-03-23 16:06:21.113456	73
2020-01-01 23:06:51	47	12°27′S  130°50′E	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-01-01 23:06:51	30	12°27′S  130°50′E	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-01-01 23:06:51	11	12°27′S  130°50′E	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-01-01 23:06:51	36	12°27′S  130°50′E	t	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-01-01 23:06:51	6	12°27′S  130°50′E	t	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-01-01 23:06:51	47	12°27′S  130°50′E	f	collectshark@gmail.com	2021-03-23 16:06:21.113456	74
2020-07-19 06:39:16	25	51°53′N  176°39′W	f	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2020-07-19 06:39:16	36	51°53′N  176°39′W	f	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2020-07-19 06:39:16	36	51°53′N  176°39′W	t	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2020-07-19 06:39:16	30	51°53′N  176°39′W	t	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2020-07-19 06:39:16	10	51°53′N  176°39′W	t	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2020-07-19 06:39:16	36	51°53′N  176°39′W	t	onionscycling@gmail.com	2021-03-23 16:06:21.113456	75
2019-03-14 12:44:22	36	Banjul, Gambia	t	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	10	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	11	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	10	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	10	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	12	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	47	Banjul, Gambia	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-03-14 12:44:22	10	Banjul, Gambia	t	railisraeli@gmail.com	2021-03-23 16:06:21.113456	78
2019-07-27 06:44:35	12	56°20′N  44°00′E	t	genuineunlikely@gmail.com	2021-03-23 16:06:21.113456	79
2019-09-30 17:56:01	25	Chinandega, Nicaragua	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	36	Chinandega, Nicaragua	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	10	Chinandega, Nicaragua	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	12	Chinandega, Nicaragua	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	12	Chinandega, Nicaragua	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	36	Chinandega, Nicaragua	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2019-09-30 17:56:01	36	Chinandega, Nicaragua	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	80
2018-05-22 01:15:58	25	41°29′N  81°40′W	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	81
2018-05-22 01:15:58	11	41°29′N  81°40′W	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	81
2018-05-22 01:15:58	36	41°29′N  81°40′W	f	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	81
2018-05-22 01:15:58	12	41°29′N  81°40′W	t	cobwebevent@gmail.com	2021-03-23 16:06:21.113456	81
2019-06-18 13:19:50	6	Livingstone, Zambia	f	achehistoric@gmail.com	2021-03-23 16:06:21.113456	82
2018-12-30 16:10:59	34	8°29′N  13°14′W	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	83
2018-12-30 16:10:59	29	8°29′N  13°14′W	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	83
2018-12-30 16:10:59	9	8°29′N  13°14′W	t	porkendurable@gmail.com	2021-03-23 16:06:21.113456	83
2020-03-30 12:27:37	48	Brighton and Hove, United Kingdom	f	achehistoric@gmail.com	2021-03-23 16:06:21.113456	85
2020-03-30 12:27:37	9	Brighton and Hove, United Kingdom	f	achehistoric@gmail.com	2021-03-23 16:06:21.113456	85
2020-03-30 12:27:37	29	Brighton and Hove, United Kingdom	f	achehistoric@gmail.com	2021-03-23 16:06:21.113456	85
2018-12-03 13:43:23	48	Arequipa, Peru	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	86
2018-12-03 13:43:23	9	Arequipa, Peru	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	86
2018-12-03 13:43:23	9	Arequipa, Peru	t	commonglazier@gmail.com	2021-03-23 16:06:21.113456	86
2018-12-03 13:43:23	15	Arequipa, Peru	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	86
2018-12-03 13:43:23	34	Arequipa, Peru	f	commonglazier@gmail.com	2021-03-23 16:06:21.113456	86
2018-11-21 09:25:22	29	Konya, Turkey	f	applyclancy@gmail.com	2021-03-23 16:06:21.113456	87
2018-11-21 09:25:22	29	Konya, Turkey	f	applyclancy@gmail.com	2021-03-23 16:06:21.113456	87
2018-11-21 09:25:22	29	Konya, Turkey	t	applyclancy@gmail.com	2021-03-23 16:06:21.113456	87
2018-11-21 09:25:22	48	Konya, Turkey	t	applyclancy@gmail.com	2021-03-23 16:06:21.113456	87
2018-05-07 01:58:36	9	32°03′N  118°46′E	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	88
2018-05-07 01:58:36	31	32°03′N  118°46′E	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	88
2018-05-07 01:58:36	29	32°03′N  118°46′E	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	88
2018-05-07 01:58:36	9	32°03′N  118°46′E	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	88
2018-11-07 19:49:36	34	Boulder, United States	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	90
2018-11-07 19:49:36	9	Boulder, United States	f	railisraeli@gmail.com	2021-03-23 16:06:21.113456	90
2020-06-11 07:35:13	48	Pietermaritzburg, South Africa	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2020-06-11 07:35:13	48	Pietermaritzburg, South Africa	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2020-06-11 07:35:13	31	Pietermaritzburg, South Africa	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2020-06-11 07:35:13	29	Pietermaritzburg, South Africa	f	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2020-06-11 07:35:13	48	Pietermaritzburg, South Africa	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2020-06-11 07:35:13	48	Pietermaritzburg, South Africa	t	slobreaction@gmail.com	2021-03-23 16:06:21.113456	91
2019-06-12 16:37:20	15	Teresina, Brazil	f	visionflannels@gmail.com	2021-03-23 16:06:21.113456	94
2019-10-30 20:15:19	15	Arequipa, Peru	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2019-10-30 20:15:19	34	Arequipa, Peru	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2019-10-30 20:15:19	29	Arequipa, Peru	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2019-10-30 20:15:19	48	Arequipa, Peru	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2019-10-30 20:15:19	29	Arequipa, Peru	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2019-10-30 20:15:19	15	Arequipa, Peru	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	95
2018-09-28 21:42:18	34	38°33′N  121°28′W	f	meinieutility@gmail.com	2021-03-23 16:06:21.113456	96
2018-09-28 21:42:18	9	38°33′N  121°28′W	t	meinieutility@gmail.com	2021-03-23 16:06:21.113456	96
2018-09-28 21:42:18	9	38°33′N  121°28′W	t	meinieutility@gmail.com	2021-03-23 16:06:21.113456	96
2018-07-09 19:45:39	48	33°45′N  84°23′W	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2018-07-09 19:45:39	31	33°45′N  84°23′W	t	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2018-07-09 19:45:39	48	33°45′N  84°23′W	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2018-07-09 19:45:39	9	33°45′N  84°23′W	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2018-07-09 19:45:39	31	33°45′N  84°23′W	f	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2018-07-09 19:45:39	9	33°45′N  84°23′W	t	babbleunease@gmail.com	2021-03-23 16:06:21.113456	98
2020-03-03 09:15:22	9	Horta, Portugal	t	chemisespoon@gmail.com	2021-03-23 16:06:21.113456	99
2019-10-30 03:05:29	29	Rio de Janeiro, Brazil	f	brilliantherd@gmail.com	2021-03-23 16:06:21.113456	100
2019-10-30 03:05:29	9	Rio de Janeiro, Brazil	t	brilliantherd@gmail.com	2021-03-23 16:06:21.113456	100
2019-10-30 03:05:29	15	Rio de Janeiro, Brazil	f	brilliantherd@gmail.com	2021-03-23 16:06:21.113456	100
2019-10-30 03:05:29	31	Rio de Janeiro, Brazil	t	brilliantherd@gmail.com	2021-03-23 16:06:21.113456	100
2019-11-23 16:30:47	29	Mogadishu, Somalia	t	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	101
2019-11-23 16:30:47	9	Mogadishu, Somalia	f	nobodyproblem@gmail.com	2021-03-23 16:06:21.113456	101
2019-02-02 18:37:36	31	13°26′N  16°40′W	f	offtrouble@gmail.com	2021-03-23 16:06:21.113456	103
2019-02-02 18:37:36	34	13°26′N  16°40′W	t	offtrouble@gmail.com	2021-03-23 16:06:21.113456	103
2019-02-02 18:37:36	31	13°26′N  16°40′W	f	offtrouble@gmail.com	2021-03-23 16:06:21.113456	103
2020-03-20 21:34:14	9	Incheon, South Korea	f	almondsshiver@gmail.com	2021-03-23 16:06:21.113456	104
2020-03-20 21:34:14	31	Incheon, South Korea	t	almondsshiver@gmail.com	2021-03-23 16:06:21.113456	104
2019-06-18 13:19:50	31	Tbilisi, Georgia	f	tautcanoe@gmail.com	2021-03-23 16:06:21.113456	105
2019-02-21 15:07:34	34	48°23′N  89°15′W	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2019-02-21 15:07:34	9	48°23′N  89°15′W	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2019-02-21 15:07:34	48	48°23′N  89°15′W	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2019-02-21 15:07:34	9	48°23′N  89°15′W	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2019-02-21 15:07:34	15	48°23′N  89°15′W	f	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2019-02-21 15:07:34	9	48°23′N  89°15′W	t	coverallsgrowling@gmail.com	2021-03-23 16:06:21.113456	106
2018-04-06 06:03:49	48	Livingstone, Zambia	f	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	107
2018-04-06 06:03:49	34	Livingstone, Zambia	t	yumdoylt@gmail.com	2021-03-23 16:06:21.113456	107
2020-05-05 03:25:31	34	26°38′N  92°48′E	f	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2020-05-05 03:25:31	15	26°38′N  92°48′E	f	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2020-05-05 03:25:31	48	26°38′N  92°48′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2020-05-05 03:25:31	15	26°38′N  92°48′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2020-05-05 03:25:31	48	26°38′N  92°48′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2020-05-05 03:25:31	15	26°38′N  92°48′E	t	drinkwhen@gmail.com	2021-03-23 16:06:21.113456	108
2019-08-08 22:07:15	33	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	17	37°47′N  122°25′W	t	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	24	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	19	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2019-08-08 22:07:15	32	37°47′N  122°25′W	f	impulsivealarming@gmail.com	2021-03-25 16:07:06.792242	1
2020-10-22 05:56:55	50	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	6	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	6	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	30	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	12	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	52	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	53	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	21	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	34	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	54	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	26	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	26	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	47	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	48	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	12	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	36	55°57′N  3°11′W	t	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	25	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
2020-10-22 05:56:55	30	55°57′N  3°11′W	f	achehistoric@gmail.com	2021-03-25 16:07:06.792242	2
\.


--
-- Data for Name: species; Type: TABLE DATA; Schema: public; Owner: tpl5_2021h1
--

COPY public.species (id, common_name, scientific_name, approx_num_in_wild, conservation_status, record_created, wikipedia_url, image_url) FROM stdin;
1	turquoise-fronted amazon parrot	amazona aestiva	100000	NT	2021-03-23 10:47:31.622108	https://en.wikipedia.org/wiki/Turquoise-fronted_amazon	https://cdn.pixabay.com/photo/2019/07/21/20/17/blue-fronted-amazon-parrot-4353561_960_720.jpg
2	african grey parrot	psittacus erithacus	630000	EN	2021-03-23 10:56:25.703067	https://en.wikipedia.org/wiki/Grey_parrot	https://cdn.pixabay.com/photo/2019/08/01/16/49/african-grey-parrot-4377951_960_720.jpg
3	umbrella cockatoo	cacatua alba	100000	EN	2021-03-23 11:22:09.994057	https://en.wikipedia.org/wiki/White_cockatoo	https://cdn.pixabay.com/photo/2019/12/20/14/32/cockatoo-4708575_960_720.jpg
4	blue-and-gold macaw	ara ararauna	10000	LC	2021-03-23 11:22:09.994057	https://en.wikipedia.org/wiki/Blue-and-yellow_macaw	https://cdn.pixabay.com/photo/2020/05/02/09/11/macaw-5120470_960_720.jpg
5	siberian tiger	panthera tigris tigris	500	EN	2021-03-23 11:22:09.994057	https://en.wikipedia.org/wiki/Siberian_tiger	https://cdn.pixabay.com/photo/2012/11/28/09/50/tiger-67577_960_720.jpg
6	snow leopard	panthera uncia	4500	VU	2021-03-23 11:22:09.994057	https://en.wikipedia.org/wiki/Snow_leopard	https://cdn.pixabay.com/photo/2017/01/16/23/10/snow-leopard-1985510_960_720.jpg
7	kakapo	strigops habroptilus	205	CR	2021-03-23 11:25:31.863145	https://en.wikipedia.org/wiki/Kakapo	https://upload.wikimedia.org/wikipedia/commons/d/d5/Strigops_habroptilus_1-1c.jpg
8	sun bear	helarctos malayanus	1000	VU	2021-03-23 11:29:13.317141	https://en.wikipedia.org/wiki/Sun_bear	https://cdn.pixabay.com/photo/2014/07/08/20/58/sun-bear-387875_960_720.jpg
9	pink fairy armadillo	chlamyphorus truncatus	100	EN	2021-03-23 11:39:10.995154	https://en.wikipedia.org/wiki/Pink_fairy_armadillo	https://i.pinimg.com/236x/e1/2e/a7/e12ea796373898d78ab93395cb81a9e2--nigiri-sushi-armadillo.jpg
\.


--
-- Name: Species_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl5_2021h1
--

SELECT pg_catalog.setval('public."Species_id_seq"', 1, false);


--
-- Name: individuals_id_seq; Type: SEQUENCE SET; Schema: public; Owner: tpl5_2021h1
--

SELECT pg_catalog.setval('public.individuals_id_seq', 55, true);


--
-- Name: species Species_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.species
    ADD CONSTRAINT "Species_pkey" PRIMARY KEY (id);


--
-- Name: individuals individuals_pkey; Type: CONSTRAINT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT individuals_pkey PRIMARY KEY (id);


--
-- Name: sightings individual_id; Type: FK CONSTRAINT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.sightings
    ADD CONSTRAINT individual_id FOREIGN KEY (individual) REFERENCES public.individuals(id);


--
-- Name: individuals species_id; Type: FK CONSTRAINT; Schema: public; Owner: tpl5_2021h1
--

ALTER TABLE ONLY public.individuals
    ADD CONSTRAINT species_id FOREIGN KEY (species) REFERENCES public.species(id);


--
-- PostgreSQL database dump complete
--

