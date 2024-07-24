--
-- PostgreSQL database dump
--

-- Dumped from database version 16.3
-- Dumped by pg_dump version 16.3

-- Started on 2024-07-24 23:40:10

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
-- TOC entry 2 (class 3079 OID 16384)
-- Name: adminpack; Type: EXTENSION; Schema: -; Owner: -
--

CREATE EXTENSION IF NOT EXISTS adminpack WITH SCHEMA pg_catalog;


--
-- TOC entry 4936 (class 0 OID 0)
-- Dependencies: 2
-- Name: EXTENSION adminpack; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION adminpack IS 'administrative functions for PostgreSQL';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 233 (class 1259 OID 16511)
-- Name: bucket_values; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.bucket_values (
    id integer NOT NULL,
    key character varying NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.bucket_values OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 16510)
-- Name: bucket_values_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.bucket_values_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.bucket_values_id_seq OWNER TO postgres;

--
-- TOC entry 4937 (class 0 OID 0)
-- Dependencies: 232
-- Name: bucket_values_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.bucket_values_id_seq OWNED BY public.bucket_values.id;


--
-- TOC entry 217 (class 1259 OID 16399)
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16398)
-- Name: client_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.client_id_seq OWNER TO postgres;

--
-- TOC entry 4938 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.client_id_seq OWNED BY public.client.id;


--
-- TOC entry 235 (class 1259 OID 16522)
-- Name: clients; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.clients (
    id integer NOT NULL,
    client_name character varying(50) NOT NULL,
    username character varying(50) NOT NULL,
    password character varying(50) NOT NULL,
    site_name json NOT NULL,
    greenhouse_name json NOT NULL
);


ALTER TABLE public.clients OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 16521)
-- Name: clients_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.clients_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.clients_id_seq OWNER TO postgres;

--
-- TOC entry 4939 (class 0 OID 0)
-- Dependencies: 234
-- Name: clients_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.clients_id_seq OWNED BY public.clients.id;


--
-- TOC entry 237 (class 1259 OID 16531)
-- Name: cycle; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cycle (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date bigint NOT NULL,
    "startDate" bigint NOT NULL,
    "observationPending" boolean,
    "comparedTo" character varying(50) NOT NULL
);


ALTER TABLE public.cycle OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 16546)
-- Name: cycle-info; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public."cycle-info" (
    id integer NOT NULL,
    name character varying(50) NOT NULL,
    date bigint NOT NULL,
    "startDate" bigint NOT NULL,
    "observationPending" boolean,
    "comparedTo" character varying(50),
    client_name character varying,
    site character varying,
    greenhouse character varying
);


ALTER TABLE public."cycle-info" OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 16545)
-- Name: cycle-info_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."cycle-info_id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public."cycle-info_id_seq" OWNER TO postgres;

--
-- TOC entry 4940 (class 0 OID 0)
-- Dependencies: 238
-- Name: cycle-info_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."cycle-info_id_seq" OWNED BY public."cycle-info".id;


--
-- TOC entry 236 (class 1259 OID 16530)
-- Name: cycle_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cycle_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cycle_id_seq OWNER TO postgres;

--
-- TOC entry 4941 (class 0 OID 0)
-- Dependencies: 236
-- Name: cycle_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cycle_id_seq OWNED BY public.cycle.id;


--
-- TOC entry 229 (class 1259 OID 16464)
-- Name: disease_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.disease_data (
    id integer NOT NULL,
    location character varying(50) NOT NULL,
    crop character varying(50) NOT NULL,
    disease character varying(50) NOT NULL,
    temp_range double precision[],
    humid_range double precision[],
    ec_range double precision[],
    ph_range double precision[]
);


ALTER TABLE public.disease_data OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16463)
-- Name: disease_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.disease_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.disease_data_id_seq OWNER TO postgres;

--
-- TOC entry 4942 (class 0 OID 0)
-- Dependencies: 228
-- Name: disease_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.disease_data_id_seq OWNED BY public.disease_data.id;


--
-- TOC entry 223 (class 1259 OID 16430)
-- Name: env_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.env_data (
    id integer NOT NULL,
    greenhouse_id integer NOT NULL,
    item_id integer NOT NULL,
    date date NOT NULL,
    "time" time without time zone NOT NULL,
    json_data json NOT NULL,
    client_name character varying(50),
    site character varying(50)
);


ALTER TABLE public.env_data OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16429)
-- Name: env_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.env_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.env_data_id_seq OWNER TO postgres;

--
-- TOC entry 4943 (class 0 OID 0)
-- Dependencies: 222
-- Name: env_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.env_data_id_seq OWNED BY public.env_data.id;


--
-- TOC entry 219 (class 1259 OID 16406)
-- Name: farm; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.farm (
    id integer NOT NULL,
    client_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.farm OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 16405)
-- Name: farm_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.farm_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.farm_id_seq OWNER TO postgres;

--
-- TOC entry 4944 (class 0 OID 0)
-- Dependencies: 218
-- Name: farm_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.farm_id_seq OWNED BY public.farm.id;


--
-- TOC entry 225 (class 1259 OID 16444)
-- Name: feedback; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.feedback (
    id integer NOT NULL,
    client_name character varying(255),
    selected_cycle character varying(255),
    selected_greenhouse character varying(255),
    selected_grid character varying(255),
    selected_site character varying(255),
    message text,
    "fileName" text
);


ALTER TABLE public.feedback OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16443)
-- Name: feedback_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.feedback_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.feedback_id_seq OWNER TO postgres;

--
-- TOC entry 4945 (class 0 OID 0)
-- Dependencies: 224
-- Name: feedback_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.feedback_id_seq OWNED BY public.feedback.id;


--
-- TOC entry 221 (class 1259 OID 16418)
-- Name: greenhouse; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.greenhouse (
    id integer NOT NULL,
    farm_id integer NOT NULL,
    name character varying(50) NOT NULL
);


ALTER TABLE public.greenhouse OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 16417)
-- Name: greenhouse_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.greenhouse_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.greenhouse_id_seq OWNER TO postgres;

--
-- TOC entry 4946 (class 0 OID 0)
-- Dependencies: 220
-- Name: greenhouse_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.greenhouse_id_seq OWNED BY public.greenhouse.id;


--
-- TOC entry 245 (class 1259 OID 16633)
-- Name: grid_analysis; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_analysis (
    id integer NOT NULL,
    client_name character varying(255),
    selected_greenhouse character varying(255),
    selected_site character varying(255),
    selected_cycle character varying(255),
    json_data json NOT NULL
);


ALTER TABLE public.grid_analysis OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 16632)
-- Name: grid_analysis_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grid_analysis_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grid_analysis_id_seq OWNER TO postgres;

--
-- TOC entry 4947 (class 0 OID 0)
-- Dependencies: 244
-- Name: grid_analysis_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grid_analysis_id_seq OWNED BY public.grid_analysis.id;


--
-- TOC entry 243 (class 1259 OID 16575)
-- Name: grid_data; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.grid_data (
    id integer NOT NULL,
    client_name character varying(255),
    selected_greenhouse character varying(255),
    selected_site character varying(255),
    grid_format json NOT NULL
);


ALTER TABLE public.grid_data OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 16574)
-- Name: grid_data_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.grid_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.grid_data_id_seq OWNER TO postgres;

--
-- TOC entry 4948 (class 0 OID 0)
-- Dependencies: 242
-- Name: grid_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.grid_data_id_seq OWNED BY public.grid_data.id;


--
-- TOC entry 231 (class 1259 OID 16473)
-- Name: key_value_pair; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.key_value_pair (
    id integer NOT NULL,
    key1 integer NOT NULL,
    key2 integer NOT NULL,
    value character varying NOT NULL
);


ALTER TABLE public.key_value_pair OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 16472)
-- Name: key_value_pair_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.key_value_pair_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.key_value_pair_id_seq OWNER TO postgres;

--
-- TOC entry 4949 (class 0 OID 0)
-- Dependencies: 230
-- Name: key_value_pair_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.key_value_pair_id_seq OWNED BY public.key_value_pair.id;


--
-- TOC entry 241 (class 1259 OID 16556)
-- Name: observations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.observations (
    id integer NOT NULL,
    client_name character varying(50) NOT NULL,
    site character varying(50) NOT NULL,
    greenhouse character varying(50) NOT NULL,
    cycle_name character varying(50) NOT NULL,
    delta_t_id integer NOT NULL,
    observation character varying(500),
    hypothesis character varying(500),
    solutions character varying(500)
);


ALTER TABLE public.observations OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 16555)
-- Name: observations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.observations_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.observations_id_seq OWNER TO postgres;

--
-- TOC entry 4950 (class 0 OID 0)
-- Dependencies: 240
-- Name: observations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.observations_id_seq OWNED BY public.observations.id;


--
-- TOC entry 227 (class 1259 OID 16453)
-- Name: sensor_ranges; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sensor_ranges (
    id integer NOT NULL,
    client text,
    greenhouse text,
    site text,
    temp_optimal text,
    humidity_risky text,
    ec_risky text,
    ph_risky text
);


ALTER TABLE public.sensor_ranges OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16452)
-- Name: sensor_ranges_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sensor_ranges_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.sensor_ranges_id_seq OWNER TO postgres;

--
-- TOC entry 4951 (class 0 OID 0)
-- Dependencies: 226
-- Name: sensor_ranges_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sensor_ranges_id_seq OWNED BY public.sensor_ranges.id;


--
-- TOC entry 4713 (class 2604 OID 16514)
-- Name: bucket_values id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bucket_values ALTER COLUMN id SET DEFAULT nextval('public.bucket_values_id_seq'::regclass);


--
-- TOC entry 4705 (class 2604 OID 16402)
-- Name: client id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client ALTER COLUMN id SET DEFAULT nextval('public.client_id_seq'::regclass);


--
-- TOC entry 4714 (class 2604 OID 16525)
-- Name: clients id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients ALTER COLUMN id SET DEFAULT nextval('public.clients_id_seq'::regclass);


--
-- TOC entry 4715 (class 2604 OID 16534)
-- Name: cycle id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle ALTER COLUMN id SET DEFAULT nextval('public.cycle_id_seq'::regclass);


--
-- TOC entry 4716 (class 2604 OID 16549)
-- Name: cycle-info id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cycle-info" ALTER COLUMN id SET DEFAULT nextval('public."cycle-info_id_seq"'::regclass);


--
-- TOC entry 4711 (class 2604 OID 16467)
-- Name: disease_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease_data ALTER COLUMN id SET DEFAULT nextval('public.disease_data_id_seq'::regclass);


--
-- TOC entry 4708 (class 2604 OID 16433)
-- Name: env_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.env_data ALTER COLUMN id SET DEFAULT nextval('public.env_data_id_seq'::regclass);


--
-- TOC entry 4706 (class 2604 OID 16409)
-- Name: farm id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm ALTER COLUMN id SET DEFAULT nextval('public.farm_id_seq'::regclass);


--
-- TOC entry 4709 (class 2604 OID 16447)
-- Name: feedback id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback ALTER COLUMN id SET DEFAULT nextval('public.feedback_id_seq'::regclass);


--
-- TOC entry 4707 (class 2604 OID 16421)
-- Name: greenhouse id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greenhouse ALTER COLUMN id SET DEFAULT nextval('public.greenhouse_id_seq'::regclass);


--
-- TOC entry 4719 (class 2604 OID 16636)
-- Name: grid_analysis id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_analysis ALTER COLUMN id SET DEFAULT nextval('public.grid_analysis_id_seq'::regclass);


--
-- TOC entry 4718 (class 2604 OID 16578)
-- Name: grid_data id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_data ALTER COLUMN id SET DEFAULT nextval('public.grid_data_id_seq'::regclass);


--
-- TOC entry 4712 (class 2604 OID 16476)
-- Name: key_value_pair id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value_pair ALTER COLUMN id SET DEFAULT nextval('public.key_value_pair_id_seq'::regclass);


--
-- TOC entry 4717 (class 2604 OID 16559)
-- Name: observations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations ALTER COLUMN id SET DEFAULT nextval('public.observations_id_seq'::regclass);


--
-- TOC entry 4710 (class 2604 OID 16456)
-- Name: sensor_ranges id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_ranges ALTER COLUMN id SET DEFAULT nextval('public.sensor_ranges_id_seq'::regclass);


--
-- TOC entry 4918 (class 0 OID 16511)
-- Dependencies: 233
-- Data for Name: bucket_values; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.bucket_values (id, key, value) FROM stdin;
1	(0,1)	too easy
2	(1,2)	easy
3	(2,4)	moderate
4	(4,10)	hard
5	(10,15)	very hard
6	(15,inf)	extremea
\.


--
-- TOC entry 4902 (class 0 OID 16399)
-- Dependencies: 217
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.client (id, name) FROM stdin;
1	nutrifresh
\.


--
-- TOC entry 4920 (class 0 OID 16522)
-- Dependencies: 235
-- Data for Name: clients; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.clients (id, client_name, username, password, site_name, greenhouse_name) FROM stdin;
1	nutrifresh	nutrifresh	1234	["farm1"]	[{"greenhouse1": "Unit 4 Part A", "greenhouse5": "Unit 1 GH 5", "unit1_greenhouse1": "Unit 1 GH 1"}]
2	demo_client	demo_client	4321	["farm1"]	[{"greenhouse1": "Unit 1 GH 1"}]
\.


--
-- TOC entry 4922 (class 0 OID 16531)
-- Dependencies: 237
-- Data for Name: cycle; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cycle (id, name, date, "startDate", "observationPending", "comparedTo") FROM stdin;
\.


--
-- TOC entry 4924 (class 0 OID 16546)
-- Dependencies: 239
-- Data for Name: cycle-info; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public."cycle-info" (id, name, date, "startDate", "observationPending", "comparedTo", client_name, site, greenhouse) FROM stdin;
7	cycle207	1720828800	1720828800	t	\N	nutrifresh	farm1	1
8	cycle206	1720742400	1720742400	t	\N	nutrifresh	farm1	1
9	cycle205	1720656000	1720656000	f	cycle203	nutrifresh	farm1	1
10	cycle204	1720569600	1720569600	f	cycle202	nutrifresh	farm1	1
11	cycle203	1720483200	1720483200	f	cycle201	nutrifresh	farm1	1
12	cycle202	1720396800	1720396800	f	cycle200	nutrifresh	farm1	1
13	cycle201	1720310400	1720310400	f	cycle199	nutrifresh	farm1	1
14	cycle200	1720224000	1720224000	f	cycle198	nutrifresh	farm1	1
15	cycle199	1720137600	1720137600	f	cycle197	nutrifresh	farm1	1
16	cycle198	1720051200	1720051200	f	cycle196	nutrifresh	farm1	1
17	cycle197	1719964800	1719964800	f	cycle195	nutrifresh	farm1	1
18	cycle196	1719878400	1719878400	f	cycle194	nutrifresh	farm1	1
19	cycle195	1719792000	1719792000	f	cycle193	nutrifresh	farm1	1
20	cycle194	1719705600	1719705600	f	cycle192	nutrifresh	farm1	1
21	cycle193	1719619200	1719619200	f	cycle189	nutrifresh	farm1	1
22	cycle192	1719532800	1719532800	f	cycle190	nutrifresh	farm1	1
23	cycle191	1719446400	1719446400	t	\N	nutrifresh	farm1	1
24	cycle190	1719360000	1719360000	f	cycle188	nutrifresh	farm1	1
25	cycle189	1719273600	1719273600	f	cycle185	nutrifresh	farm1	1
26	cycle188	1719187200	1719187200	f	cycle184	nutrifresh	farm1	1
27	cycle187	1719100800	1719100800	f	cycle183	nutrifresh	farm1	1
28	cycle186	1719014400	1719014400	f	cycle182	nutrifresh	farm1	1
29	cycle185	1718928000	1718928000	f	cycle181	nutrifresh	farm1	1
30	cycle184	1718841600	1718841600	f	cycle180	nutrifresh	farm1	1
31	cycle183	1718755200	1718755200	f	cycle179	nutrifresh	farm1	1
32	cycle182	1718668800	1718668800	f	cycle178	nutrifresh	farm1	1
33	cycle181	1718582400	1718582400	f	cycle180	nutrifresh	farm1	1
34	cycle180	1718496000	1718496000	f	cycle179	nutrifresh	farm1	1
35	cycle179	1718409600	1718409600	f	cycle178	nutrifresh	farm1	1
36	cycle178	1718323200	1718323200	f	cycle177	nutrifresh	farm1	1
37	cycle177	1718236800	1718236800	f	cycle176	nutrifresh	farm1	1
38	cycle176	1718150400	1718150400	f	cycle175	nutrifresh	farm1	1
39	cycle175	1718064000	1718064000	f	cycle174	nutrifresh	farm1	1
40	cycle174	1717977600	1717977600	f	cycle173	nutrifresh	farm1	1
41	cycle173	1717891200	1717891200	f	cycle172	nutrifresh	farm1	1
42	cycle172	1717804800	1717804800	f	cycle171	nutrifresh	farm1	1
43	cycle171	1717718400	1717718400	f	cycle170	nutrifresh	farm1	1
44	cycle170	1717632000	1717632000	f	cycle169	nutrifresh	farm1	1
45	cycle169	1717545600	1717545600	f	cycle168	nutrifresh	farm1	1
46	cycle168	1717459200	1717459200	f	cycle167	nutrifresh	farm1	1
47	cycle167	1717372800	1717372800	f	cycle166	nutrifresh	farm1	1
48	cycle166	1717286400	1717286400	f	cycle163	nutrifresh	farm1	1
49	cycle165	1717200000	1717200000	t	\N	nutrifresh	farm1	1
50	cycle164	1717113600	1717113600	t	\N	nutrifresh	farm1	1
51	cycle163	1717027200	1717027200	f	cycle162	nutrifresh	farm1	1
52	cycle162	1716940800	1716940800	f	cycle161	nutrifresh	farm1	1
53	cycle161	1716854400	1716854400	f	cycle160	nutrifresh	farm1	1
54	cycle160	1716768000	1716768000	f	cycle159	nutrifresh	farm1	1
55	cycle159	1716681600	1716681600	f	cycle158	nutrifresh	farm1	1
56	cycle158	1716595200	1716595200	f	cycle157	nutrifresh	farm1	1
57	cycle157	1716508800	1716508800	f	cycle156	nutrifresh	farm1	1
58	cycle156	1716422400	1716422400	f	cycle154	nutrifresh	farm1	1
59	cycle155	1716336000	1716336000	f	cycle152	nutrifresh	farm1	1
60	cycle154	1716249600	1716249600	f	\N	nutrifresh	farm1	1
61	cycle153	1716163200	1716163200	f	cycle151	nutrifresh	farm1	1
62	cycle152	1716076800	1716076800	f	cycle150	nutrifresh	farm1	1
63	cycle151	1715990400	1715990400	f	cycle149	nutrifresh	farm1	1
64	cycle150	1715904000	1715904000	f	cycle148	nutrifresh	farm1	1
65	cycle149	1715817600	1715817600	f	cycle147	nutrifresh	farm1	1
66	cycle148	1715731200	1715731200	f	cycle144	nutrifresh	farm1	1
67	cycle147	1715644800	1715644800	f	cycle145	nutrifresh	farm1	1
68	cycle146	1715558400	1715558400	t	\N	nutrifresh	farm1	1
69	cycle145	1715472000	1715472000	f	cycle138	nutrifresh	farm1	1
70	cycle144	1715385600	1715385600	f	cycle139	nutrifresh	farm1	1
71	cycle143	1715299200	1715299200	t	\N	nutrifresh	farm1	1
72	cycle142	1715212800	1715212800	t	\N	nutrifresh	farm1	1
73	cycle141	1715126400	1715126400	t	\N	nutrifresh	farm1	1
74	cycle140	1715040000	1715040000	t	\N	nutrifresh	farm1	1
75	cycle139	1714953600	1714953600	f	cycle137	nutrifresh	farm1	1
76	cycle138	1714867200	1714867200	f	cycle136	nutrifresh	farm1	1
77	cycle137	1714780800	1714780800	f	cycle135	nutrifresh	farm1	1
78	cycle136	1714694400	1714694400	f	cycle133	nutrifresh	farm1	1
79	cycle135	1714608000	1714608000	f	cycle132	nutrifresh	farm1	1
80	cycle134	1714521600	1714521600	t	\N	nutrifresh	farm1	1
81	cycle133	1714435200	1714435200	f	cycle131	nutrifresh	farm1	1
82	cycle132	1714348800	1714348800	f	cycle130	nutrifresh	farm1	1
83	cycle131	1714262400	1714262400	f	cycle129	nutrifresh	farm1	1
84	cycle130	1714176000	1714176000	f	cycle128	nutrifresh	farm1	1
85	cycle129	1714089600	1714089600	f	cycle127	nutrifresh	farm1	1
86	cycle128	1714003200	1714003200	f	cycle126	nutrifresh	farm1	1
87	cycle127	1713916800	1713916800	f	cycle125	nutrifresh	farm1	1
88	cycle126	1713830400	1713830400	f	cycle124	nutrifresh	farm1	1
89	cycle125	1713744000	1713744000	f	cycle123	nutrifresh	farm1	1
90	cycle124	1713657600	1713657600	f	cycle122	nutrifresh	farm1	1
91	cycle123	1713571200	1713571200	f	cycle120	nutrifresh	farm1	1
92	cycle122	1713484800	1713484800	f	cycle119	nutrifresh	farm1	1
93	cycle121	1713378600	1713378600	t	\N	nutrifresh	farm1	1
94	cycle120	1713312000	1713312000	f	cycle118	nutrifresh	farm1	1
95	cycle119	1713205800	1713205800	f	cycle117	nutrifresh	farm1	1
96	cycle118	1713142740	1713142740	f	cycle114	nutrifresh	farm1	1
97	cycle117	1713033000	1713033000	f	\N	nutrifresh	farm1	1
98	cycle116	1712950500	1712950500	f	\N	nutrifresh	farm1	1
99	cycle115	1712897940	1712897940	f	\N	nutrifresh	farm1	1
100	cycle114	1712817480	1712817480	f	\N	nutrifresh	farm1	1
101	cycle113	1712731020	1712731020	t	\N	nutrifresh	farm1	1
102	cycle112	1712670120	1712670120	t	\N	nutrifresh	farm1	1
103	cycle111	1712514600	1712514600	t	\N	nutrifresh	farm1	1
104	cycle110	1712428200	1712428200	t	\N	nutrifresh	farm1	1
105	cycle109	1712341800	1712341800	f	cycle105	nutrifresh	farm1	1
106	cycle108	1712255400	1712255400	f	cycle104	nutrifresh	farm1	1
107	cycle107	1712169000	1712169000	f	cycle103	nutrifresh	farm1	1
108	cycle106	1712082600	1712082600	f	cycle102	nutrifresh	farm1	1
109	cycle105	1711996200	1711996200	f	cycle101	nutrifresh	farm1	1
110	cycle104	1711909800	1711909800	f	cycle100	nutrifresh	farm1	1
111	cycle103	1711823400	1711823400	f	cycle99	nutrifresh	farm1	1
112	cycle102	1711737000	1711737000	f	cycle98	nutrifresh	farm1	1
113	cycle101	1711650600	1711650600	f	\N	nutrifresh	farm1	1
114	cycle100	1711564200	1711564200	f	\N	nutrifresh	farm1	1
115	cycle99	1711477800	1711477800	f	\N	nutrifresh	farm1	1
116	cycle98	1711391400	1711391400	f	\N	nutrifresh	farm1	1
117	cycle97	1711305000	1711305000	t	\N	nutrifresh	farm1	1
118	cycle96	1711218600	1711218600	t	\N	nutrifresh	farm1	1
119	cycle95	1711132200	1711132200	t	\N	nutrifresh	farm1	1
120	cycle94	1711045800	1711045800	t	\N	nutrifresh	farm1	1
121	cycle93	1710959400	1710959400	t	\N	nutrifresh	farm1	1
122	cycle92	1710873000	1710873000	f	cycle88	nutrifresh	farm1	1
123	cycle91	1710786600	1710786600	f	cycle87	nutrifresh	farm1	1
124	cycle90	1710700200	1710700200	f	cycle86	nutrifresh	farm1	1
125	cycle89	1710613800	1710613800	f	cycle84	nutrifresh	farm1	1
126	cycle88	1710527400	1710527400	f	cycle85	nutrifresh	farm1	1
127	cycle87	1710441000	1710441000	f	cycle83	nutrifresh	farm1	1
128	cycle86	1710354600	1710354600	f	cycle82	nutrifresh	farm1	1
129	cycle85	1710268200	1710268200	f	cycle81	nutrifresh	farm1	1
130	cycle84	1710181800	1710181800	f	cycle80	nutrifresh	farm1	1
131	cycle83	1710095400	1710095400	f	cycle79	nutrifresh	farm1	1
132	cycle82	1710009000	1710009000	f	cycle78	nutrifresh	farm1	1
133	cycle81	1709922600	1709922600	f	cycle77	nutrifresh	farm1	1
134	cycle80	1709836200	1709836200	f	cycle76	nutrifresh	farm1	1
135	cycle79	1709749800	1709749800	f	cycle75	nutrifresh	farm1	1
136	cycle78	1709663400	1709663400	f	cycle74	nutrifresh	farm1	1
137	cycle77	1709577000	1709577000	f	cycle73	nutrifresh	farm1	1
138	cycle76	1709490600	1709490600	f	cycle72	nutrifresh	farm1	1
139	cycle75	1709404200	1709404200	f	cycle71	nutrifresh	farm1	1
140	cycle74	1709317800	1709317800	f	cycle70	nutrifresh	farm1	1
141	cycle73	1709231400	1709231400	f	cycle69	nutrifresh	farm1	1
142	cycle72	1709145000	1709145000	f	cycle68	nutrifresh	farm1	1
143	cycle71	1709058600	1709058600	f	cycle67	nutrifresh	farm1	1
144	cycle70	1708972200	1708972200	f	cycle66	nutrifresh	farm1	1
145	cycle69	1708885800	1708885800	f	cycle65	nutrifresh	farm1	1
146	cycle68	1708799400	1708799400	f	cycle64	nutrifresh	farm1	1
147	cycle67	1708713000	1708713000	f	cycle63	nutrifresh	farm1	1
148	cycle66	1708626600	1708626600	f	cycle62	nutrifresh	farm1	1
149	cycle65	1708540200	1708540200	f	cycle61	nutrifresh	farm1	1
150	cycle64	1708453800	1708453800	f	cycle60	nutrifresh	farm1	1
151	cycle63	1708367400	1708367400	f	cycle59	nutrifresh	farm1	1
152	cycle62	1708281000	1708281000	f	cycle58	nutrifresh	farm1	1
153	cycle61	1708194600	1708194600	f	cycle57	nutrifresh	farm1	1
154	cycle60	1708108200	1708108200	f	cycle56	nutrifresh	farm1	1
155	cycle59	1708021800	1708021800	f	cycle55	nutrifresh	farm1	1
156	cycle58	1707935400	1707935400	f	cycle54	nutrifresh	farm1	1
157	cycle57	1707849000	1707849000	f	cycle53	nutrifresh	farm1	1
158	cycle56	1707762600	1707762600	f	cycle52	nutrifresh	farm1	1
159	cycle55	1707676200	1707676200	f	cycle51	nutrifresh	farm1	1
160	cycle54	1707589800	1707589800	f	cycle50	nutrifresh	farm1	1
161	cycle53	1707503400	1707503400	f	cycle49	nutrifresh	farm1	1
162	cycle52	1707417000	1707417000	f	cycle48	nutrifresh	farm1	1
163	cycle51	1707330600	1707330600	f	cycle47	nutrifresh	farm1	1
164	cycle50	1707244200	1707244200	f	cycle46	nutrifresh	farm1	1
165	cycle49	1707157800	1707157800	f	cycle45	nutrifresh	farm1	1
166	cycle48	1707071400	1707071400	f	cycle44	nutrifresh	farm1	1
167	cycle47	1706985000	1706985000	f	cycle43	nutrifresh	farm1	1
168	cycle46	1706898600	1706898600	f	\N	nutrifresh	farm1	1
169	cycle45	1706812200	1706812200	f	\N	nutrifresh	farm1	1
170	cycle44	1706725800	1706725800	f	cycle42	nutrifresh	farm1	1
171	cycle43	1706639400	1706639400	f	cycle41	nutrifresh	farm1	1
172	cycle42	1706553000	1706553000	f	cycle40	nutrifresh	farm1	1
173	cycle41	1706466600	1706466600	f	cycle39	nutrifresh	farm1	1
174	cycle40	1706380200	1706380200	f	cycle38	nutrifresh	farm1	1
175	cycle39	1706293800	1706293800	f	cycle37	nutrifresh	farm1	1
176	cycle38	1706207400	1706207400	f	cycle36	nutrifresh	farm1	1
177	cycle37	1706121000	1706121000	f	cycle35	nutrifresh	farm1	1
178	cycle36	1706034600	1706034600	f	cycle32	nutrifresh	farm1	1
179	cycle35	1705948200	1705948200	f	cycle31	nutrifresh	farm1	1
180	cycle34	1705861800	1705861800	f	cycle30	nutrifresh	farm1	1
181	cycle33	1705775400	1705775400	f	cycle29	nutrifresh	farm1	1
182	cycle32	1705689000	1705689000	f	cycle28	nutrifresh	farm1	1
183	cycle31	1705602600	1705602600	f	cycle27	nutrifresh	farm1	1
184	cycle30	1705516200	1705516200	f	cycle25	nutrifresh	farm1	1
185	cycle29	1705429800	1705429800	f	cycle26	nutrifresh	farm1	1
186	cycle28	1705343400	1705343400	f	cycle24	nutrifresh	farm1	1
187	cycle27	1705170600	1705170600	f	cycle23	nutrifresh	farm1	1
188	cycle26	1705084200	1705084200	f	cycle21	nutrifresh	farm1	1
189	cycle25	1704997800	1704997800	f	cycle22	nutrifresh	farm1	1
190	cycle24	1704911400	1704911400	f	cycle20	nutrifresh	farm1	1
191	cycle23	1704825000	1704825000	f	cycle19	nutrifresh	farm1	1
192	cycle22	1704738600	1704738600	f	cycle18	nutrifresh	farm1	1
193	cycle21	1704652200	1704652200	f	cycle17	nutrifresh	farm1	1
194	cycle20	1704565800	1704565800	f	cycle16	nutrifresh	farm1	1
195	cycle19	1704479400	1704479400	f	cycle15	nutrifresh	farm1	1
196	cycle18	1704393000	1704393000	f	\N	nutrifresh	farm1	1
197	cycle17	1704306600	1704306600	f	\N	nutrifresh	farm1	1
198	cycle16	1704220200	1704220200	f	\N	nutrifresh	farm1	1
199	cycle15	1704133800	1704133800	f	\N	nutrifresh	farm1	1
200	cycle14	1703788200	1703788200	f	\N	nutrifresh	farm1	1
201	cycle13	1703615400	1703615400	f	\N	nutrifresh	farm1	1
202	cycle12	1703529000	1703529000	f	\N	nutrifresh	farm1	1
203	cycle11	1703442600	1703442600	f	\N	nutrifresh	farm1	1
204	cycle10	1703183400	1703183400	f	\N	nutrifresh	farm1	1
205	cycle9	1703097000	1703097000	f	cycle8	nutrifresh	farm1	1
206	cycle8	1702665000	1702665000	f	\N	nutrifresh	farm1	1
207	cycle7	1702578600	1702578600	f	cycle5	nutrifresh	farm1	1
208	cycle6	1702492200	1702492200	f	cycle4	nutrifresh	farm1	1
209	cycle5	1702405800	1702405800	f	cycle3	nutrifresh	farm1	1
210	cycle4	1702024839	1702024839	f	cycle2	nutrifresh	farm1	1
211	cycle3	1701938439	1701938439	f	cycle1	nutrifresh	farm1	1
212	cycle2	1701884683	1701884680	f	\N	nutrifresh	farm1	1
213	cycle1	1701333639	1701333639	f	\N	nutrifresh	farm1	1
\.


--
-- TOC entry 4914 (class 0 OID 16464)
-- Dependencies: 229
-- Data for Name: disease_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.disease_data (id, location, crop, disease, temp_range, humid_range, ec_range, ph_range) FROM stdin;
1	India	BellPepper	Powdery Mildew	{18,25}	{75,100}	{1,2.5}	{5.5,7.5}
2	India	BellPepper	Powder	{18,25}	{75,100}	{1,2.5}	{5.5,7.5}
5	nutrifreshfarm1greenhouse1	Tomato	Leaf Minor	{22,40}	{60,80}	{}	{}
7	nutrifreshfarm1greenhouse1	Tomato	Blight Late	{30,100}	{80,100}	{}	{}
9	nutrifreshfarm1greenhouse1	Tomato	Calcium Def	{18,40}	{0,50}	{1.2,5.5}	{5.5,7.5}
10	nutrifreshfarm1greenhouse1	Tomato	Magnesium Def	{}	{}	{1.2,5.5}	{5.5,7.5}
11	nutrifreshfarm1greenhouse1	Tomato	Iron Def	{}	{}	{1.2,5.5}	{5.5,7.5}
12	nutrifreshfarm1greenhouse1	Tomato	Phosphorus Def	{18,40}	{0,60}	{1.2,5.5}	{5.5,7.5}
13	nutrifreshfarm1greenhouse1	Tomato	Potassium Def	{18,40}	{0,60}	{1.2,5.5}	{5.5,7.5}
14	nutrifreshfarm1greenhouse1	Tomato	Shoot Borer	{20,35}	{70,100}	{}	{}
15	nutrifreshfarm1greenhouse1	Tomato	Whitefly	{16,33}	{60,90}	{}	{}
16	nutrifreshfarm1greenhouse5	BellPepper	Thrips	{18,40}	{0,60}	{}	{}
17	nutrifreshfarm1greenhouse5	BellPepper	Powdery Mildew	{25,75}	{0,100}	{}	{}
18	nutrifreshfarm1greenhouse5	BellPepper	Magnesium Def	{0,18}	{}	{1.2,3.5}	{5.5,7.5}
19	nutrifreshfarm1greenhouse5	BellPepper	Mites	{18,35}	{60,80}	{}	{}
20	nutrifreshfarm1greenhouse5	BellPepper	Whitefly	{16,33}	{60,95}	{}	{}
21	nutrifreshfarm1greenhouse5	BellPepper	Aphids	{16,33}	{60,95}	{}	{}
3	nutrifreshfarm1greenhouse1	Tomato	Tuta	{22,37}	{60,80}	{}	{}
6	nutrifreshfarm1greenhouse1	Tomato	Blight Early	{20,40}	{0,75}	{}	{}
8	nutrifreshfarm1greenhouse1	Tomato	Bacterial Leaf Spot	{20,35}	{75,100}	{}	{}
\.


--
-- TOC entry 4908 (class 0 OID 16430)
-- Dependencies: 223
-- Data for Name: env_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.env_data (id, greenhouse_id, item_id, date, "time", json_data, client_name, site) FROM stdin;
3	1	175	2024-06-18	01:06:00	{"date": 1718668800, "day": "Tuesday", "drain_water_ec_zone_1&2": 1.4, "drain_water_ec_zone_3_": 2.3, "drain_water_ec_zone_4": 2.4, "drain_water_ph_zone_1&2": 7.6, "drain_water_ph_zone_3_": 7.4, "drain_water_ph_zone_4": 7.4, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.1, "humidity": 74.14, "temperature_dry": 33.0, "temperature_wet": 29.0, "time": "01:06", "item_id": 175}	nutrifresh	farm1
4	1	174	2024-06-17	01:06:00	{"date": 1718582400, "day": "Monday", "drain_water_ec_zone_1&2": 1.2, "drain_water_ec_zone_3_": 2.1, "drain_water_ec_zone_4": 2.1, "drain_water_ph_zone_1&2": 7.2, "drain_water_ph_zone_3_": 7.0, "drain_water_ph_zone_4": 7.2, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.1, "fertigation_ph_zone_3&4": 6.0, "humidity": 71.89, "temperature_dry": 34.5, "temperature_wet": 30.0, "time": "01:06", "item_id": 174}	nutrifresh	farm1
5	1	173	2024-06-16	01:04:00	{"date": 1718496000, "day": "Sunday", "drain_water_ec_zone_1&2": 1.6, "drain_water_ec_zone_3_": 2.2, "drain_water_ec_zone_4": 2.5, "drain_water_ph_zone_1&2": 6.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 73.22, "temperature_dry": 31.0, "temperature_wet": 27.0, "time": "01:04", "item_id": 173}	nutrifresh	farm1
6	1	172	2024-06-15	00:00:00	{"date": 1718409600, "day": "Saturday", "drain_water_ec_zone_1&2": 1.8, "drain_water_ec_zone_3_": 2.3, "drain_water_ec_zone_4": 2.5, "drain_water_ph_zone_1&2": 6.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 74.14, "temperature_dry": 33.0, "temperature_wet": 29.0, "time": "-", "item_id": 172}	nutrifresh	farm1
7	1	171	2024-06-14	00:00:00	{"date": 1718323200, "day": "Friday", "drain_water_ec_zone_1&2": 1.6, "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 2.5, "drain_water_ph_zone_1&2": 7.7, "drain_water_ph_zone_3_": 7.3, "drain_water_ph_zone_4": 7.1, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 71.19, "temperature_dry": 33.0, "temperature_wet": 28.5, "time": "-", "item_id": 171}	nutrifresh	farm1
8	1	170	2024-06-13	00:00:00	{"date": 1718236800, "day": "Thursday", "drain_water_ec_zone_1&2": 2.0, "drain_water_ec_zone_3_": 2.6, "drain_water_ec_zone_4": 1.9, "drain_water_ph_zone_1&2": 6.2, "drain_water_ph_zone_3_": 6.7, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 79.89, "temperature_dry": 32.0, "temperature_wet": 29.0, "time": "-", "item_id": 170}	nutrifresh	farm1
9	1	169	2024-06-12	00:00:00	{"date": 1718150400, "day": "Wednesday", "drain_water_ec_zone_1&2": 2.1, "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 1.7, "drain_water_ph_zone_1&2": 6.3, "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 76.13, "temperature_dry": 30.5, "temperature_wet": 27.0, "time": "-", "item_id": 169}	nutrifresh	farm1
10	1	168	2024-06-11	00:00:00	{"date": 1718064000, "day": "Tuesday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": 2.4, "drain_water_ec_zone_4": 1.5, "drain_water_ph_zone_1&2": 6.4, "drain_water_ph_zone_3_": 6.7, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 78.76, "temperature_dry": 29.0, "temperature_wet": 26.0, "time": "-", "item_id": 168}	nutrifresh	farm1
11	1	167	2024-06-10	00:00:00	{"date": 1717977600, "day": "Monday", "drain_water_ec_zone_1&2": 2.0, "drain_water_ec_zone_3_": 2.1, "drain_water_ec_zone_4": 1.4, "drain_water_ph_zone_1&2": 6.2, "drain_water_ph_zone_3_": 6.7, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 70.43, "temperature_dry": 31.5, "temperature_wet": 27.0, "time": "-", "item_id": 167}	nutrifresh	farm1
12	1	166	2024-06-09	00:00:00	{"date": 1717891200, "day": "Sunday", "drain_water_ec_zone_1&2": 1.2, "drain_water_ec_zone_3_": 1.3, "drain_water_ec_zone_4": 1.9, "drain_water_ph_zone_1&2": 6.6, "drain_water_ph_zone_3_": 7.3, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 78.76, "temperature_dry": 29.0, "temperature_wet": 26.0, "time": "-", "item_id": 166}	nutrifresh	farm1
13	1	165	2024-06-08	00:00:00	{"date": 1717804800, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.2, "drain_water_ec_zone_4": 2.3, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 73.22, "temperature_dry": 31.0, "temperature_wet": 27.0, "time": "-", "item_id": 165}	nutrifresh	farm1
14	1	164	2024-06-07	00:00:00	{"date": 1717718400, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 2.4, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.1, "fertigation_ph_zone_3&4": 6.1, "humidity": 79.15, "temperature_dry": 30.0, "temperature_wet": 27.0, "time": "-", "item_id": 164}	nutrifresh	farm1
15	1	163	2024-06-06	00:00:00	{"date": 1717632000, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 74.14, "temperature_dry": 33.0, "temperature_wet": 29.0, "time": "-", "item_id": 163}	nutrifresh	farm1
16	1	162	2024-06-05	00:00:00	{"date": 1717545600, "day": "Wednesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.3, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 73.69, "temperature_dry": 32.0, "temperature_wet": 28.0, "time": "-", "item_id": 162}	nutrifresh	farm1
17	1	161	2024-06-04	00:00:00	{"date": 1717459200, "day": "Tuesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.6, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.3, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 79.89, "temperature_dry": 32.0, "temperature_wet": 29.0, "time": "-", "item_id": 161}	nutrifresh	farm1
198	3	193	2024-04-10	00:00:00	{"date": 1712707200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": null, "greenhouse_part": null, "item_id": 193}	nutrifresh	farm1
18	1	160	2024-06-03	00:00:00	{"date": 1717372800, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.8, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": 1.8, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 76.76, "temperature_dry": 32.0, "temperature_wet": 28.5, "time": "-", "item_id": 160}	nutrifresh	farm1
19	1	159	2024-06-02	00:00:00	{"date": 1717286400, "day": "Sunday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.7, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.3, "drain_water_ph_zone_4": 6.7, "fertigation_ec_zone_1&2": 1.5, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 67.74, "temperature_dry": 32.0, "temperature_wet": 27.0, "time": "-", "item_id": 159}	nutrifresh	farm1
20	1	158	2024-06-01	00:00:00	{"date": 1717200000, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 1.5, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 65.15, "temperature_dry": 32.5, "temperature_wet": 27.0, "time": "-", "item_id": 158}	nutrifresh	farm1
21	1	157	2024-05-31	00:00:00	{"date": 1717113600, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.1, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.3, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 1.5, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 73.69, "temperature_dry": 32.0, "temperature_wet": 28.0, "time": "-", "item_id": 157}	nutrifresh	farm1
22	1	156	2024-05-30	00:00:00	{"date": 1717027200, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.7, "fertigation_ec_zone_1&2": 1.5, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 62.66, "temperature_dry": 33.0, "temperature_wet": 27.0, "time": "-", "item_id": 156}	nutrifresh	farm1
23	1	155	2024-05-29	00:00:00	{"date": 1716940800, "day": "Wednesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": 1.5, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 67.16, "temperature_dry": 31.0, "temperature_wet": 26.0, "time": "-", "item_id": 155}	nutrifresh	farm1
24	1	154	2024-05-28	00:00:00	{"date": 1716854400, "day": "Tuesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.1, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 61.33, "temperature_dry": 31.0, "temperature_wet": 25.0, "time": "-", "item_id": 154}	nutrifresh	farm1
25	1	153	2024-05-27	00:00:00	{"date": 1716768000, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 71.67, "temperature_dry": 28.0, "temperature_wet": 24.0, "time": "-", "item_id": 153}	nutrifresh	farm1
26	1	152	2024-05-26	00:00:00	{"date": 1716681600, "day": "Sunday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 63.28, "temperature_dry": 34.0, "temperature_wet": 28.0, "time": "-", "item_id": 152}	nutrifresh	farm1
27	1	151	2024-05-25	00:00:00	{"date": 1716595200, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 2.6, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 62.66, "temperature_dry": 33.0, "temperature_wet": 27.0, "time": "-", "item_id": 151}	nutrifresh	farm1
28	1	150	2024-05-24	00:00:00	{"date": 1716508800, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.2, "drain_water_ec_zone_4": 2.4, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 53.6, "temperature_dry": 35.0, "temperature_wet": 27.0, "time": "-", "item_id": 150}	nutrifresh	farm1
29	1	149	2024-05-23	00:00:00	{"date": 1716422400, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.1, "drain_water_ec_zone_4": 2.6, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 50.32, "temperature_dry": 32.0, "temperature_wet": 23.0, "time": "-", "item_id": 149}	nutrifresh	farm1
30	1	148	2024-05-22	00:00:00	{"date": 1716336000, "day": "Wednesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.3, "drain_water_ec_zone_4": 2.5, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": 1.2, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.0, "humidity": 59.29, "temperature_dry": 36.0, "temperature_wet": 29.0, "time": "-", "item_id": 148}	nutrifresh	farm1
31	1	147	2024-05-21	00:00:00	{"date": 1716249600, "ec_-_input part A": "-", "ec_-_input part B": "-", "ec_-drain part A": "-", "ec_-drain part B": "-", "greenhouse_part": "-", "humidity": 57.12, "ph_-_input part A": "-", "ph_-_input part B": "-", "ph_-drain part A": "-", "ph_-drain part B": "-", "temperature_dry": 36.5, "temperature_wet": 29.0, "time": "-", "item_id": 147, "day": "Tuesday", "drain_water_ec_zone_3_": 2.4, "drain_water_ec_zone_4": 2.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_3&4": 6.0, "fertigation_ec_zone_1&2": 1.2, "fertigation_ph_zone_1&2": 6.0}	nutrifresh	farm1
196	3	195	2024-04-10	00:00:00	{"date": 1712707200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 195}	nutrifresh	farm1
199	3	192	2024-04-10	00:00:00	{"date": 1712707200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.81, "ph_-_bed": 7.32, "temperature_dry": 36.0, "temperature_wet": 24.0, "humidity": 61.0, "greenhouse_part": null, "item_id": 192}	nutrifresh	farm1
32	1	146	2024-05-20	00:00:00	{"date": 1716163200, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 3.0, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.0, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 55.03, "temperature_dry": 37.0, "temperature_wet": 29.0, "time": "-", "item_id": 146}	nutrifresh	farm1
33	1	145	2024-05-19	00:00:00	{"date": 1716076800, "day": "Sunday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.2, "drain_water_ec_zone_4": 2.4, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 59.29, "temperature_dry": 36.0, "temperature_wet": 29.0, "time": "-", "item_id": 145}	nutrifresh	farm1
34	1	144	2024-05-18	00:00:00	{"date": 1715990400, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 2.7, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.8, "drain_water_ph_zone_4": 6.7, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 55.03, "temperature_dry": 37.0, "temperature_wet": 29.0, "time": "-", "item_id": 144}	nutrifresh	farm1
35	1	143	2024-05-17	00:00:00	{"date": 1715904000, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 3.0, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 57.12, "temperature_dry": 36.5, "temperature_wet": 29.0, "time": "-", "item_id": 143}	nutrifresh	farm1
36	1	142	2024-05-16	00:00:00	{"date": 1715817600, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.3, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.0, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 58.96, "temperature_dry": 35.5, "temperature_wet": 28.5, "time": "-", "item_id": 142}	nutrifresh	farm1
37	1	141	2024-05-15	00:00:00	{"date": 1715731200, "day": "Wednesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.2, "drain_water_ph_zone_4": 6.7, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 58.96, "temperature_dry": 35.5, "temperature_wet": 28.5, "time": "-", "item_id": 141}	nutrifresh	farm1
38	1	140	2024-05-14	00:00:00	{"date": 1715644800, "day": "Tuesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.4, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 56.1, "temperature_dry": 35.0, "temperature_wet": 27.5, "time": "-", "item_id": 140}	nutrifresh	farm1
39	1	139	2024-05-13	00:00:00	{"date": 1715558400, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 68.29, "temperature_dry": 33.0, "temperature_wet": 28.0, "time": "-", "item_id": 139}	nutrifresh	farm1
40	1	138	2024-05-12	00:00:00	{"date": 1715472000, "day": "Sunday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.9, "drain_water_ec_zone_4": 2.7, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.1, "drain_water_ph_zone_4": 6.0, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 74.98, "temperature_dry": 28.0, "temperature_wet": 24.5, "time": "-", "item_id": 138}	nutrifresh	farm1
41	1	137	2024-05-11	00:00:00	{"date": 1715385600, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.8, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.2, "drain_water_ph_zone_4": 6.3, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 85.57, "temperature_dry": 29.0, "temperature_wet": 27.0, "time": "-", "item_id": 137}	nutrifresh	farm1
42	1	136	2024-05-10	00:00:00	{"date": 1715299200, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.7, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.3, "drain_water_ph_zone_4": 6.3, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 48.07, "temperature_dry": 37.0, "temperature_wet": 27.5, "time": "-", "item_id": 136}	nutrifresh	farm1
43	1	135	2024-05-09	00:00:00	{"date": 1715212800, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.8, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 50.34, "temperature_dry": 37.0, "temperature_wet": 28.0, "time": "-", "item_id": 135}	nutrifresh	farm1
44	1	134	2024-05-08	00:00:00	{"date": 1715126400, "day": "Wednesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.7, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 38.27, "temperature_dry": 38.0, "temperature_wet": 26.0, "time": "-", "item_id": 134}	nutrifresh	farm1
45	1	133	2024-05-07	00:00:00	{"date": 1715040000, "day": "Tuesday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 2.9, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 37.33, "temperature_dry": 37.0, "temperature_wet": 25.0, "time": "-", "item_id": 133}	nutrifresh	farm1
46	1	132	2024-05-06	00:00:00	{"date": 1714953600, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.0, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 33.32, "temperature_dry": 37.0, "temperature_wet": 24.0, "time": "-", "item_id": 132}	nutrifresh	farm1
231	3	160	2024-04-01	00:00:00	{"date": 1711929600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 160}	nutrifresh	farm1
47	1	131	2024-05-05	00:00:00	{"date": 1714867200, "day": "Sunday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.4, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 25.66, "temperature_dry": 38.5, "temperature_wet": 23.0, "time": "-", "item_id": 131}	nutrifresh	farm1
48	1	130	2024-05-04	00:00:00	{"date": 1714780800, "day": "Saturday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.0, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.5, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 29.47, "temperature_dry": 37.0, "temperature_wet": 23.0, "time": "-", "item_id": 130}	nutrifresh	farm1
49	1	129	2024-05-03	00:00:00	{"date": 1714694400, "day": "Friday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.2, "drain_water_ec_zone_4": 3.1, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 27.94, "temperature_dry": 39.0, "temperature_wet": 24.0, "time": "-", "item_id": 129}	nutrifresh	farm1
50	1	128	2024-05-02	00:00:00	{"date": 1714608000, "day": "Thursday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": 3.5, "drain_water_ec_zone_4": 3.3, "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.6, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 29.21, "temperature_dry": 38.5, "temperature_wet": 24.0, "time": "-", "item_id": 128}	nutrifresh	farm1
51	1	127	2024-05-01	00:00:00	{"item_id": 127, "date": 1714521600, "day": "Wednesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.5, "temperature_dry": 39.0, "temperature_wet": 24.0, "humidity": 27.94}	nutrifresh	farm1
52	1	126	2024-04-30	00:00:00	{"item_id": 126, "date": 1714435200, "day": "Tuesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.6, "temperature_dry": 37.0, "temperature_wet": 24.0, "humidity": 33.32}	nutrifresh	farm1
53	1	125	2024-04-29	00:00:00	{"item_id": 125, "date": 1714348800, "day": "Monday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": 4.2, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 37.0, "temperature_wet": 23.0, "humidity": 29.47}	nutrifresh	farm1
54	1	124	2024-04-28	00:00:00	{"item_id": 124, "date": 1714262400, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.3, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.6, "temperature_dry": 39.0, "temperature_wet": 24.0, "humidity": 27.94}	nutrifresh	farm1
55	1	123	2024-04-27	00:00:00	{"item_id": 123, "date": 1714176000, "day": "Saturday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.2, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.8, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
56	1	122	2024-04-26	00:00:00	{"item_id": 122, "date": 1714089600, "day": "Friday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.2, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.4, "temperature_dry": 37, "temperature_wet": 29.0, "humidity": 55.0}	nutrifresh	farm1
57	1	121	2024-04-25	00:00:00	{"item_id": 121, "date": 1714003200, "day": "Thursday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.3, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 38, "temperature_wet": 29.0, "humidity": 51.1}	nutrifresh	farm1
58	1	120	2024-04-24	00:00:00	{"item_id": 120, "date": 1713916800, "day": "Wednesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.4, "temperature_dry": 37.5, "temperature_wet": 29.0, "humidity": 53.0}	nutrifresh	farm1
59	1	119	2024-04-23	00:00:00	{"item_id": 119, "date": 1713830400, "day": "Tuesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.5, "temperature_dry": 37, "temperature_wet": 29.0, "humidity": 55.0}	nutrifresh	farm1
60	1	118	2024-04-22	00:00:00	{"item_id": 118, "date": 1713744000, "day": "Monday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 2.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.0, "drain_water_ph_zone_4": 6.5, "temperature_dry": 35, "temperature_wet": 27.0, "humidity": 53.6}	nutrifresh	farm1
61	1	117	2024-04-21	00:00:00	{"item_id": 117, "date": 1713657600, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.7, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
64	1	114	2024-04-18	00:00:00	{"item_id": 114, "date": 1713398400, "day": "Thursday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.0, "drain_water_ec_zone_4": 4.3, "drain_water_ph_zone_4": 6.5, "temperature_dry": 38, "temperature_wet": 29.5, "humidity": 53.4}	nutrifresh	farm1
232	3	159	2024-04-01	00:00:00	{"date": 1711929600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": null, "greenhouse_part": null, "item_id": 159}	nutrifresh	farm1
62	1	116	2024-04-20	00:00:00	{"item_id": 116, "date": 1713571200, "day": "Saturday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.5, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 37, "temperature_wet": 29.5, "humidity": 57.4}	nutrifresh	farm1
63	1	115	2024-04-19	00:00:00	{"item_id": 115, "date": 1713484800, "day": "Friday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.0, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.5, "drain_water_ph_zone_4": 6.4, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
65	1	113	2024-04-17	00:00:00	{"item_id": 113, "date": 1713312000, "day": "Wednesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.2, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 35, "temperature_wet": 28.5, "humidity": 61.2}	nutrifresh	farm1
66	1	112	2024-04-16	00:00:00	{"item_id": 112, "date": 1713225600, "day": "Tuesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.2, "fertigation_ph_zone_3&4": 6.4, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.6, "temperature_dry": 38, "temperature_wet": 29.0, "humidity": 51.5}	nutrifresh	farm1
67	1	111	2024-04-15	00:00:00	{"item_id": 111, "date": 1713139200, "day": "Monday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.2, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.5, "temperature_dry": 38, "temperature_wet": 29.0, "humidity": 51.5}	nutrifresh	farm1
68	1	110	2024-04-14	00:00:00	{"item_id": 110, "date": 1713052800, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.4, "temperature_dry": 38, "temperature_wet": 29.5, "humidity": 53.4}	nutrifresh	farm1
69	1	109	2024-04-13	00:00:00	{"item_id": 109, "date": 1712966400, "day": "Saturday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": 2.2, "fertigation_ph_zone_3&4": 6.2, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.2, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.2, "temperature_dry": 38.5, "temperature_wet": 29.5, "humidity": 51.4}	nutrifresh	farm1
70	1	108	2024-04-12	00:00:00	{"item_id": 108, "date": 1712880000, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.1, "drain_water_ph_zone_1&2": 5.2, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 5.2, "drain_water_ec_zone_4": 4.6, "drain_water_ph_zone_4": 6.2, "temperature_dry": 38, "temperature_wet": 30.0, "humidity": 55.7}	nutrifresh	farm1
71	1	107	2024-04-11	00:00:00	{"item_id": 107, "date": 1712793600, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 5.0, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 5.1, "drain_water_ph_zone_4": 6.5, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
72	1	106	2024-04-10	00:00:00	{"item_id": 106, "date": 1712707200, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 37, "temperature_wet": 29.8, "humidity": 57.4}	nutrifresh	farm1
73	1	105	2024-01-09	00:00:00	{"item_id": 105, "date": 1704758400, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
74	1	104	2024-04-08	00:00:00	{"item_id": 104, "date": 1712534400, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.8, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.6, "temperature_dry": 38, "temperature_wet": 29.5, "humidity": 53.4}	nutrifresh	farm1
401	1	175	2024-06-18	01:06:00	{"greenhouse_id": 1, "client_name": "nutrifresh", "site": "farm1", "date": 1718668800, "day": "Tuesday", "drain_water_ec_zone_1&2": 1.4, "drain_water_ec_zone_3_": 2.3, "drain_water_ec_zone_4": 2.4, "drain_water_ph_zone_1&2": 7.6, "drain_water_ph_zone_3_": 7.4, "drain_water_ph_zone_4": 7.4, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 6.1, "humidity": 74.14, "temperature_dry": 33.0, "temperature_wet": 29.0, "time": "01:06", "item_id": 175}	nutrifresh	farm1
75	1	103	2024-04-07	00:00:00	{"item_id": 103, "date": 1712448000, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.4, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.8, "drain_water_ph_zone_4": 6.4, "temperature_dry": 37, "temperature_wet": 29.5, "humidity": 57.4}	nutrifresh	farm1
76	1	102	2024-04-06	00:00:00	{"item_id": 102, "date": 1712361600, "day": "Saturday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.5, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.4, "temperature_dry": 38, "temperature_wet": 29.5, "humidity": 53.4}	nutrifresh	farm1
77	1	101	2024-04-05	00:00:00	{"item_id": 101, "date": 1712275200, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.0, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.2, "drain_water_ph_zone_3_": 5.8, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_4": 6.2, "temperature_dry": 37, "temperature_wet": 29.0, "humidity": 55.0}	nutrifresh	farm1
79	1	99	2024-04-03	00:00:00	{"item_id": 99, "date": 1712102400, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 2.9, "drain_water_ph_zone_3_": 6.1, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 5.9, "temperature_dry": 37.5, "temperature_wet": 29.5, "humidity": 55.4}	nutrifresh	farm1
80	1	98	2024-04-02	00:00:00	{"item_id": 98, "date": 1712016000, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.4, "temperature_dry": 36, "temperature_wet": 29.5, "humidity": 61.8}	nutrifresh	farm1
81	1	97	2024-04-01	00:00:00	{"item_id": 97, "date": 1711929600, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.4, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.3, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.3, "temperature_dry": 34, "temperature_wet": 28.0, "humidity": 63.3}	nutrifresh	farm1
82	1	96	2024-03-31	00:00:00	{"item_id": 96, "date": 1711843200, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 2.2, "drain_water_ph_zone_1&2": 5.3, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 2.4, "drain_water_ph_zone_3_": 5.8, "drain_water_ec_zone_4": 2.3, "drain_water_ph_zone_4": 5.7, "temperature_dry": 34.5, "temperature_wet": 28.5, "humidity": 63.6}	nutrifresh	farm1
83	1	95	2024-03-30	00:00:00	{"item_id": 95, "date": 1711756800, "day": "Saturday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.3, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.5, "temperature_dry": 35, "temperature_wet": 28.5, "humidity": 61.2}	nutrifresh	farm1
84	1	94	2024-03-29	00:00:00	{"item_id": 94, "date": 1711670400, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 33, "temperature_wet": 27.0, "humidity": 62.7}	nutrifresh	farm1
85	1	93	2024-03-28	00:00:00	{"item_id": 93, "date": 1711584000, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.6, "drain_water_ph_zone_1&2": 6.1, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.2, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.2, "temperature_dry": 34.5, "temperature_wet": 27.5, "humidity": 60.6}	nutrifresh	farm1
86	1	92	2024-03-27	00:00:00	{"item_id": 92, "date": 1711497600, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.7, "drain_water_ph_zone_1&2": 6.1, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.5, "temperature_dry": 34, "temperature_wet": 28.0, "humidity": 63.3}	nutrifresh	farm1
87	1	91	2024-03-26	00:00:00	{"item_id": 91, "date": 1711411200, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.7, "drain_water_ph_zone_3_": 6.2, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.2, "temperature_dry": 33.5, "temperature_wet": 27.0, "humidity": 60.3}	nutrifresh	farm1
88	1	90	2024-03-25	00:00:00	{"item_id": 90, "date": 1711324800, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 5.9, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.7, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.2, "temperature_dry": 33.5, "temperature_wet": 27.0, "humidity": 60.3}	nutrifresh	farm1
89	1	89	2024-03-24	00:00:00	{"item_id": 89, "date": 1711238400, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 1.4, "drain_water_ph_zone_1&2": 6.1, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 2.2, "drain_water_ph_zone_3_": 6.1, "drain_water_ec_zone_4": 2.2, "drain_water_ph_zone_4": 6.1, "temperature_dry": 33, "temperature_wet": 27.0, "humidity": 62.7}	nutrifresh	farm1
90	1	88	2024-03-23	00:00:00	{"item_id": 88, "date": 1711152000, "day": "Saturday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 34, "temperature_wet": 27.5, "humidity": 60.6}	nutrifresh	farm1
91	1	87	2024-03-22	00:00:00	{"item_id": 87, "date": 1711065600, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 3.3, "drain_water_ph_zone_4": 6.6, "temperature_dry": 33, "temperature_wet": 27.0, "humidity": 62.6}	nutrifresh	farm1
92	1	86	2024-03-21	00:00:00	{"item_id": 86, "date": 1710979200, "day": "Thursday.", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 33, "temperature_wet": 27.5, "humidity": 65.4}	nutrifresh	farm1
93	1	85	2024-03-20	00:00:00	{"item_id": 85, "date": 1710892800, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.4, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 32, "temperature_wet": 26.5, "humidity": 64.8}	nutrifresh	farm1
94	1	84	2024-03-19	00:00:00	{"item_id": 84, "date": 1710806400, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.0, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.5, "temperature_dry": 32, "temperature_wet": 26.0, "humidity": 62.0}	nutrifresh	farm1
95	1	83	2024-03-18	00:00:00	{"item_id": 83, "date": 1710720000, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31.5, "temperature_wet": 26.0, "humidity": 64.5}	nutrifresh	farm1
96	1	82	2024-03-17	00:00:00	{"item_id": 82, "date": 1710633600, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 2.3, "drain_water_ph_zone_1&2": 5.7, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.1, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 1.2, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31.5, "temperature_wet": 25.5, "humidity": 61.7}	nutrifresh	farm1
97	1	81	2024-03-16	00:00:00	{"item_id": 81, "date": 1710547200, "day": "Saturday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.4, "drain_water_ph_zone_4": 6.5, "temperature_dry": 32.5, "temperature_wet": 26.5, "humidity": 62.3}	nutrifresh	farm1
98	1	80	2024-03-15	00:00:00	{"item_id": 80, "date": 1710460800, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.6, "temperature_dry": 33.5, "temperature_wet": 27.5, "humidity": 63.0}	nutrifresh	farm1
99	1	79	2024-03-14	00:00:00	{"item_id": 79, "date": 1710374400, "day": "Thursday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 33, "temperature_wet": 27.0, "humidity": 62.7}	nutrifresh	farm1
100	1	78	2024-03-13	00:00:00	{"item_id": 78, "date": 1710288000, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.3, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31.5, "temperature_wet": 25.5, "humidity": 61.7}	nutrifresh	farm1
101	1	77	2024-03-12	00:00:00	{"item_id": 77, "date": 1710201600, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.0, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.5, "temperature_dry": 31.5, "temperature_wet": 25.5, "humidity": 61.7}	nutrifresh	farm1
102	1	76	2024-03-11	00:00:00	{"item_id": 76, "date": 1710115200, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31.5, "temperature_wet": 26.0, "humidity": 64.5}	nutrifresh	farm1
103	1	75	2024-03-10	00:00:00	{"item_id": 75, "date": 1710028800, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.1, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.3, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31, "temperature_wet": 25.0, "humidity": 61.3}	nutrifresh	farm1
104	1	74	2024-03-09	00:00:00	{"item_id": 74, "date": 1709942400, "day": "Saturday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.4, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31, "temperature_wet": 25.0, "humidity": 61.3}	nutrifresh	farm1
105	1	73	2024-03-08	00:00:00	{"item_id": 73, "date": 1709856000, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.0, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.4, "drain_water_ph_zone_4": 6.5, "temperature_dry": "31,5", "temperature_wet": 25.5, "humidity": 61.7}	nutrifresh	farm1
106	1	72	2024-03-07	00:00:00	{"item_id": 72, "date": 1709769600, "day": "Thursday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 31, "temperature_wet": 25.0, "humidity": 61.3}	nutrifresh	farm1
107	1	71	2024-03-06	00:00:00	{"item_id": 71, "date": 1709683200, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.5, "temperature_dry": 30, "temperature_wet": 25.0, "humidity": 66.6}	nutrifresh	farm1
108	1	70	2024-03-05	00:00:00	{"item_id": 70, "date": 1709596800, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.5, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.4, "temperature_dry": 31, "temperature_wet": 25.5, "humidity": 64.2}	nutrifresh	farm1
109	1	69	2024-03-04	00:00:00	{"item_id": 69, "date": 1709510400, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.4, "temperature_dry": 30, "temperature_wet": 25.0, "humidity": 66.6}	nutrifresh	farm1
110	1	68	2024-03-03	00:00:00	{"item_id": 68, "date": 1709424000, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": null, "drain_water_ph_zone_3_": null, "drain_water_ec_zone_4": null, "drain_water_ph_zone_4": null, "temperature_dry": 31.5, "temperature_wet": 26.0, "humidity": 64.5}	nutrifresh	farm1
111	1	67	2024-03-02	00:00:00	{"item_id": 67, "date": 1709337600, "day": "Saturday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 31.5, "temperature_wet": 25.5, "humidity": 61.7}	nutrifresh	farm1
112	1	66	2024-03-01	00:00:00	{"item_id": 66, "date": 1709251200, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 31, "temperature_wet": 25.5, "humidity": 64.2}	nutrifresh	farm1
113	1	65	2024-02-29	00:00:00	{"item_id": 65, "date": 1709164800, "day": "Thursday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.6, "temperature_dry": 31.5, "temperature_wet": 26.0, "humidity": 64.5}	nutrifresh	farm1
114	1	64	2024-02-28	00:00:00	{"item_id": 64, "date": 1709078400, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.5, "temperature_dry": 31, "temperature_wet": 25.5, "humidity": 64.2}	nutrifresh	farm1
115	1	63	2024-02-27	00:00:00	{"item_id": 63, "date": 1708992000, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.5, "temperature_dry": 30, "temperature_wet": 25.0, "humidity": 66.6}	nutrifresh	farm1
116	1	62	2024-02-26	00:00:00	{"item_id": 62, "date": 1708905600, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.6, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.5, "temperature_dry": 30, "temperature_wet": 25.5, "humidity": 69.6}	nutrifresh	farm1
117	1	61	2024-02-25	00:00:00	{"item_id": 61, "date": 1708819200, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.7, "temperature_dry": 31, "temperature_wet": 25.0, "humidity": 61.3}	nutrifresh	farm1
118	1	60	2024-02-24	00:00:00	{"item_id": 60, "date": 1708732800, "day": "Saturday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.5, "temperature_dry": 29, "temperature_wet": 24.0, "humidity": 65.9}	nutrifresh	farm1
119	1	59	2024-02-23	00:00:00	{"item_id": 59, "date": 1708646400, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.0, "drain_water_ph_zone_1&2": 6.0, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 3.9, "drain_water_ph_zone_4": 6.8, "temperature_dry": 30, "temperature_wet": 24.5, "humidity": 63.5}	nutrifresh	farm1
120	1	58	2024-02-22	00:00:00	{"item_id": 58, "date": 1708560000, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 29, "temperature_wet": 23.5, "humidity": 62.9}	nutrifresh	farm1
121	1	57	2024-02-21	00:00:00	{"item_id": 57, "date": 1708473600, "day": "Wednesday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.5, "temperature_dry": 29, "temperature_wet": 24.0, "humidity": 65.9}	nutrifresh	farm1
122	1	56	2024-02-20	00:00:00	{"item_id": 56, "date": 1708387200, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.3, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 2.1, "drain_water_ph_zone_4": 6.4, "temperature_dry": 30, "temperature_wet": 24.5, "humidity": 63.5}	nutrifresh	farm1
123	1	55	2024-02-19	00:00:00	{"item_id": 55, "date": 1708300800, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.3, "drain_water_ec_zone_4": 2.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 29, "temperature_wet": 23.5, "humidity": 62.9}	nutrifresh	farm1
124	1	54	2024-02-18	00:00:00	{"item_id": 54, "date": 1708214400, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 3.4, "drain_water_ph_zone_1&2": 6.9, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.7, "temperature_dry": 30, "temperature_wet": 25.5, "humidity": 69.6}	nutrifresh	farm1
125	1	53	2024-02-17	00:00:00	{"item_id": 53, "date": 1708128000, "day": "Saturday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.9, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.7, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.9, "temperature_dry": 30, "temperature_wet": 24.5, "humidity": 63.5}	nutrifresh	farm1
126	1	52	2024-02-16	00:00:00	{"item_id": 52, "date": 1708041600, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.1, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.9, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.7, "temperature_dry": 30, "temperature_wet": 24.5, "humidity": 63.5}	nutrifresh	farm1
127	1	51	2024-02-15	00:00:00	{"item_id": 51, "date": 1707955200, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 2.8, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.0, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.0, "drain_water_ph_zone_4": 6.8, "temperature_dry": 29.5, "temperature_wet": 24.5, "humidity": 66.2}	nutrifresh	farm1
128	1	50	2024-02-14	00:00:00	{"item_id": 50, "date": 1707868800, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.4, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 22.5, "humidity": 62.1}	nutrifresh	farm1
129	1	49	2024-02-13	00:00:00	{"item_id": 49, "date": 1707782400, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 30, "temperature_wet": 25.0, "humidity": 66.6}	nutrifresh	farm1
130	1	48	2024-02-12	00:00:00	{"item_id": 48, "date": 1707696000, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.7, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.5, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
131	1	47	2024-02-11	00:00:00	{"item_id": 47, "date": 1707609600, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 3.6, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.0, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.9, "temperature_dry": 29.5, "temperature_wet": 23.5, "humidity": 60.2}	nutrifresh	farm1
132	1	46	2024-02-10	00:00:00	{"item_id": 46, "date": 1707523200, "day": "Saturday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.7, "temperature_dry": 30, "temperature_wet": 24.5, "humidity": 63.5}	nutrifresh	farm1
133	1	45	2024-02-09	00:00:00	{"item_id": 45, "date": 1707436800, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.1, "drain_water_ph_zone_4": 6.7, "temperature_dry": 30, "temperature_wet": 25.5, "humidity": 69.6}	nutrifresh	farm1
134	1	44	2024-02-08	00:00:00	{"item_id": 44, "date": 1707350400, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.7, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.5, "temperature_dry": 29, "temperature_wet": 25.0, "humidity": 72.2}	nutrifresh	farm1
135	1	43	2024-02-07	00:00:00	{"item_id": 43, "date": 1707264000, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.4, "temperature_dry": 29.5, "temperature_wet": 26.0, "humidity": 75.7}	nutrifresh	farm1
136	1	42	2024-02-06	00:00:00	{"item_id": 42, "date": 1707177600, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 30, "temperature_wet": 25.0, "humidity": 66.6}	nutrifresh	farm1
137	1	41	2024-02-05	00:00:00	{"item_id": 41, "date": 1707091200, "day": "Monday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.8, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.2, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.4, "temperature_dry": 29.5, "temperature_wet": 24.5, "humidity": 66.2}	nutrifresh	farm1
138	1	40	2024-02-04	00:00:00	{"item_id": 40, "date": 1707004800, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.9, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.9, "temperature_dry": 29, "temperature_wet": 25.0, "humidity": 78.3}	nutrifresh	farm1
139	1	39	2024-02-03	00:00:00	{"item_id": 39, "date": 1706918400, "day": "Saturday ", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.9, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.9, "temperature_dry": 28.5, "temperature_wet": 23.5, "humidity": 65.6}	nutrifresh	farm1
140	1	38	2024-02-02	00:00:00	{"item_id": 38, "date": 1706832000, "day": "Friday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.2, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.2, "drain_water_ec_zone_3_": 4.7, "drain_water_ph_zone_3_": 6.2, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 22.5, "humidity": 62.1}	nutrifresh	farm1
141	1	37	2024-02-01	00:00:00	{"item_id": 37, "date": 1706745600, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.2, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.2, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 3.1, "drain_water_ph_zone_4": 6.9, "temperature_dry": 27, "temperature_wet": 22.0, "humidity": 64.5}	nutrifresh	farm1
142	1	36	2024-01-31	00:00:00	{"item_id": 36, "date": 1706659200, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.1, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.9, "temperature_dry": 27.5, "temperature_wet": 22.5, "humidity": 64.9}	nutrifresh	farm1
143	1	35	2024-01-30	00:00:00	{"item_id": 35, "date": 1706572800, "day": "Tuesday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.2, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.2, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 3.1, "drain_water_ph_zone_4": 6.9, "temperature_dry": 27.5, "temperature_wet": 23.0, "humidity": 68.1}	nutrifresh	farm1
144	1	34	2024-01-29	00:00:00	{"item_id": 34, "date": 1706486400, "day": "Monday", "fertigation_ec_zone_1&2": 2.5, "fertigation_ph_zone_1&2": 6.2, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 28.5, "temperature_wet": 23.5, "humidity": 65.6}	nutrifresh	farm1
145	1	33	2024-01-28	00:00:00	{"item_id": 33, "date": 1706400000, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.2, "drain_water_ph_zone_3_": 6.9, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.8, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
146	1	32	2024-01-27	00:00:00	{"item_id": 32, "date": 1706313600, "day": "Saturday ", "fertigation_ec_zone_1&2": 2.5, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
147	1	31	2024-01-26	00:00:00	{"item_id": 31, "date": 1706227200, "day": "Friday", "fertigation_ec_zone_1&2": 2.5, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 23.5, "humidity": 68.4}	nutrifresh	farm1
148	1	30	2024-01-25	00:00:00	{"item_id": 30, "date": 1706140800, "day": "Thursday", "fertigation_ec_zone_1&2": 2.5, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.2, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.6, "temperature_dry": 26.5, "temperature_wet": 21.5, "humidity": 64.2}	nutrifresh	farm1
149	1	29	2024-01-24	00:00:00	{"item_id": 29, "date": 1706054400, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.5, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.7, "temperature_dry": 26, "temperature_wet": 21.0, "humidity": 63.8}	nutrifresh	farm1
150	1	28	2024-01-23	00:00:00	{"item_id": 28, "date": 1705968000, "day": "Tuesday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.6, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.8, "temperature_dry": 27.5, "temperature_wet": 23.5, "humidity": 71.4}	nutrifresh	farm1
151	1	27	2024-01-22	00:00:00	{"item_id": 27, "date": 1705881600, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 5.9, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.8, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
152	1	26	2024-01-21	00:00:00	{"item_id": 26, "date": 1705795200, "day": "sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.6, "temperature_dry": 29, "temperature_wet": 25.0, "humidity": 72.2}	nutrifresh	farm1
153	1	25	2024-01-20	00:00:00	{"item_id": 25, "date": 1705708800, "day": "saturday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.3, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.5, "temperature_dry": 27.5, "temperature_wet": 22.5, "humidity": 64.9}	nutrifresh	farm1
154	1	24	2024-01-19	00:00:00	{"item_id": 24, "date": 1705622400, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.3, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.2, "drain_water_ph_zone_4": 6.1, "temperature_dry": 29, "temperature_wet": 24.0, "humidity": 65.9}	nutrifresh	farm1
155	1	23	2024-01-18	00:00:00	{"item_id": 23, "date": 1705536000, "day": "Thursday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.2, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.7, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.6, "drain_water_ph_zone_4": 6.5, "temperature_dry": 29, "temperature_wet": 23.5, "humidity": 62.9}	nutrifresh	farm1
156	1	22	2024-01-17	00:00:00	{"item_id": 22, "date": 1705449600, "day": "wednesday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.6, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 4.6, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.7, "drain_water_ph_zone_4": 6.6, "temperature_dry": 28, "temperature_wet": 24.0, "humidity": 71.7}	nutrifresh	farm1
157	1	21	2024-01-16	00:00:00	{"item_id": 21, "date": 1705363200, "day": "Tuesday", "fertigation_ec_zone_1&2": 0.6, "fertigation_ph_zone_1&2": 6.9, "drain_water_ec_zone_1&2": 4.5, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.6, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.6, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
158	1	20	2024-01-15	00:00:00	{"item_id": 20, "date": 1705276800, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.4, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.3, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 4.3, "drain_water_ph_zone_4": 6.6, "temperature_dry": 29.5, "temperature_wet": 24.0, "humidity": 63.2}	nutrifresh	farm1
159	1	19	2024-01-14	00:00:00	{"item_id": 19, "date": 1705190400, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": null, "drain_water_ph_zone_3_": null, "drain_water_ec_zone_4": null, "drain_water_ph_zone_4": null, "temperature_dry": 27.5, "temperature_wet": 22.5, "humidity": 64.9}	nutrifresh	farm1
160	1	18	2024-01-12	00:00:00	{"item_id": 18, "date": 1705017600, "day": "Friday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 4.1, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.7, "temperature_dry": 29.5, "temperature_wet": 24.5, "humidity": 66.2}	nutrifresh	farm1
161	1	17	2024-01-11	00:00:00	{"item_id": 17, "date": 1704931200, "day": "Thursday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.4, "drain_water_ec_zone_4": 4.0, "drain_water_ph_zone_4": 6.5, "temperature_dry": 29, "temperature_wet": 25.0, "humidity": 72.2}	nutrifresh	farm1
162	1	16	2024-01-10	00:00:00	{"item_id": 16, "date": 1704844800, "day": "Wednesday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.2, "temperature_dry": 29, "temperature_wet": 24.0, "humidity": 65.9}	nutrifresh	farm1
163	1	14	2024-01-08	00:00:00	{"item_id": 14, "date": 1704672000, "day": "Monday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.4, "drain_water_ph_zone_4": 6.5, "temperature_dry": 27, "temperature_wet": 22.0, "humidity": 64.5}	nutrifresh	farm1
164	1	13	2024-01-07	00:00:00	{"item_id": 13, "date": 1704585600, "day": "Sunday ", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": 3.3, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.3, "drain_water_ph_zone_4": 6.7, "temperature_dry": 28, "temperature_wet": 24.0, "humidity": 71.7}	nutrifresh	farm1
165	1	12	2024-01-06	00:00:00	{"item_id": 12, "date": 1704499200, "day": "Saturday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 38.0, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.7, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.6, "temperature_dry": 27, "temperature_wet": 23.0, "humidity": 71.1}	nutrifresh	farm1
166	1	11	2024-01-05	00:00:00	{"item_id": 11, "date": 1704412800, "day": "Friday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.6, "fertigation_ph_zone_3&4": 60.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 3.8, "drain_water_ph_zone_4": 6.7, "temperature_dry": 26, "temperature_wet": 22.5, "humidity": 73.9}	nutrifresh	farm1
167	1	10	2024-01-04	00:00:00	{"item_id": 10, "date": 1704326400, "day": "Thursday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.3, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.8, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.7, "drain_water_ph_zone_4": 6.6, "temperature_dry": 27.5, "temperature_wet": 23.5, "humidity": 71.4}	nutrifresh	farm1
168	1	9	2024-01-03	00:00:00	{"item_id": 9, "date": 1704240000, "day": "Wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.7, "drain_water_ph_zone_1&2": 6.7, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.2, "drain_water_ph_zone_3_": 6.8, "drain_water_ec_zone_4": 4.3, "drain_water_ph_zone_4": 6.8, "temperature_dry": 27, "temperature_wet": 23.0, "humidity": 71.1}	nutrifresh	farm1
176	1	1	2023-12-26	00:00:00	{"item_id": 1, "date": 1703548800, "day": "Tuesday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.1, "drain_water_ec_zone_1&2": 3.7, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 5.8, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.3, "drain_water_ph_zone_4": 6.6, "temperature_dry": null, "temperature_wet": null, "humidity": null}	nutrifresh	farm1
169	1	8	2024-01-02	00:00:00	{"item_id": 8, "date": 1704153600, "day": "Tuesday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.1, "drain_water_ec_zone_1&2": 3.5, "drain_water_ph_zone_1&2": 6.8, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.3, "drain_water_ph_zone_3_": 6.7, "drain_water_ec_zone_4": 4.1, "drain_water_ph_zone_4": 6.2, "temperature_dry": 27.5, "temperature_wet": 23.0, "humidity": 68.1}	nutrifresh	farm1
170	1	7	2024-01-01	00:00:00	{"item_id": 7, "date": 1704067200, "day": "Monday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.1, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.4, "drain_water_ph_zone_3_": 6.6, "drain_water_ec_zone_4": 3.5, "drain_water_ph_zone_4": 6.6, "temperature_dry": 27.5, "temperature_wet": 23.0, "humidity": 68.1}	nutrifresh	farm1
171	1	6	2023-12-31	00:00:00	{"item_id": 6, "date": 1703980800, "day": "Sunday", "fertigation_ec_zone_1&2": null, "fertigation_ph_zone_1&2": null, "drain_water_ec_zone_1&2": null, "drain_water_ph_zone_1&2": null, "fertigation_ec_zone_3&4": null, "fertigation_ph_zone_3&4": null, "drain_water_ec_zone_3_": null, "drain_water_ph_zone_3_": null, "drain_water_ec_zone_4": null, "drain_water_ph_zone_4": null, "temperature_dry": 27, "temperature_wet": 22.5, "humidity": 68.8}	nutrifresh	farm1
172	1	5	2023-12-30	00:00:00	{"item_id": 5, "date": 1703894400, "day": "saturday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.1, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 4.1, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.6, "temperature_dry": 27.5, "temperature_wet": 22.5, "humidity": 64.9}	nutrifresh	farm1
173	1	4	2023-12-29	00:00:00	{"item_id": 4, "date": 1703808000, "day": "Friday ", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 4.2, "drain_water_ph_zone_4": 6.6, "temperature_dry": 27, "temperature_wet": 22.0, "humidity": 64.5}	nutrifresh	farm1
174	1	3	2023-12-28	00:00:00	{"item_id": 3, "date": 1703721600, "day": "Thursday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.8, "drain_water_ph_zone_1&2": 6.6, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.6, "temperature_dry": 26.5, "temperature_wet": 21.5, "humidity": 64.2}	nutrifresh	farm1
175	1	2	2023-12-27	00:00:00	{"item_id": 2, "date": 1703635200, "day": "wednesday", "fertigation_ec_zone_1&2": 2.6, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.9, "drain_water_ph_zone_1&2": 6.5, "fertigation_ec_zone_3&4": 2.5, "fertigation_ph_zone_3&4": 5.9, "drain_water_ec_zone_3_": 3.9, "drain_water_ph_zone_3_": 6.5, "drain_water_ec_zone_4": 3.6, "drain_water_ph_zone_4": 6.6, "temperature_dry": 28, "temperature_wet": 23.0, "humidity": 65.2}	nutrifresh	farm1
233	3	158	2024-04-01	00:00:00	{"date": 1711929600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 22.0, "humidity": null, "greenhouse_part": null, "item_id": 158}	nutrifresh	farm1
178	1	182	2024-06-25	15:54:00	{"date": 1719273600, "day": "Tuesday", "drain_water_ec_zone_1&2": 1.7, "drain_water_ec_zone_3_": 2.8, "drain_water_ec_zone_4": 2.9, "drain_water_ph_zone_1&2": 7.7, "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.5, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 70.69, "temperature_dry": 32.0, "temperature_wet": 27.5, "time": "15:54", "item_id": 182}	nutrifresh	farm1
180	1	180	2024-06-23	09:44:00	{"date": 1719100800, "day": "Sunday", "drain_water_ec_zone_1&2": 2.7, "drain_water_ec_zone_3_": 2.5, "drain_water_ec_zone_4": 2.2, "drain_water_ph_zone_1&2": 6.8, "drain_water_ph_zone_3_": 7.1, "drain_water_ph_zone_4": 7.1, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 88.4, "temperature_dry": 26.0, "temperature_wet": 24.5, "time": "09:44", "item_id": 180}	nutrifresh	farm1
181	1	179	2024-06-22	09:42:00	{"date": 1719014400, "day": "Saturday", "drain_water_ec_zone_1&2": 1.7, "drain_water_ec_zone_3_": 1.9, "drain_water_ec_zone_4": 2.1, "drain_water_ph_zone_1&2": 7.4, "drain_water_ph_zone_3_": 6.9, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 79.15, "temperature_dry": 30.0, "temperature_wet": 27.0, "time": "09:42", "item_id": 179}	nutrifresh	farm1
402	1	174	2024-06-17	01:06:00	{"greenhouse_id": 1, "client_name": "nutrifresh", "site": "farm1", "date": 1718582400, "day": "Monday", "drain_water_ec_zone_1&2": 1.2, "drain_water_ec_zone_3_": 2.1, "drain_water_ec_zone_4": 2.1, "drain_water_ph_zone_1&2": 7.2, "drain_water_ph_zone_3_": 7.0, "drain_water_ph_zone_4": 7.2, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.1, "fertigation_ph_zone_3&4": 6.0, "humidity": 71.89, "temperature_dry": 34.5, "temperature_wet": 30.0, "time": "01:06", "item_id": 174}	nutrifresh	farm1
182	1	178	2024-06-21	11:27:00	{"date": 1718928000, "day": "Friday", "drain_water_ec_zone_1&2": 1.5, "drain_water_ec_zone_3_": 1.8, "drain_water_ec_zone_4": 1.9, "drain_water_ph_zone_1&2": 7.2, "drain_water_ph_zone_3_": 6.8, "drain_water_ph_zone_4": 6.4, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 76.56, "temperature_dry": 31.5, "temperature_wet": 28.0, "time": "11:27", "item_id": 178}	nutrifresh	farm1
190	3	201	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": "A even", "item_id": 201}	nutrifresh	farm1
183	1	185	2024-06-28	11:17:00	{"date": 1719532800, "day": "Friday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": 2.7, "drain_water_ec_zone_4": 2.3, "drain_water_ph_zone_1&2": 7.4, "drain_water_ph_zone_3_": 7.0, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 85.29, "temperature_dry": 28.0, "temperature_wet": 26.0, "time": "11:17", "item_id": 185}	nutrifresh	farm1
184	1	184	2024-06-27	15:54:00	{"date": 1719446400, "day": "Thursday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": 2.7, "drain_water_ec_zone_4": 2.3, "drain_water_ph_zone_1&2": 6.9, "drain_water_ph_zone_3_": 6.4, "drain_water_ph_zone_4": 6.7, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 73.69, "temperature_dry": 32.0, "temperature_wet": 28.0, "time": "15:54", "item_id": 184}	nutrifresh	farm1
177	1	183	2024-06-26	15:54:00	{"date": 1719360000, "day": "Wednesday", "drain_water_ec_zone_1&2": 1.9, "drain_water_ec_zone_3_": 2.6, "drain_water_ec_zone_4": 2.2, "drain_water_ph_zone_1&2": 7.8, "drain_water_ph_zone_3_": 7.3, "drain_water_ph_zone_4": 7.2, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 74.14, "temperature_dry": 33.0, "temperature_wet": 29.0, "time": "15:54", "item_id": 183}	nutrifresh	farm1
179	1	181	2024-06-24	15:54:00	{"date": 1719187200, "day": "Monday", "drain_water_ec_zone_1&2": 1.8, "drain_water_ec_zone_3_": 2.7, "drain_water_ec_zone_4": 1.6, "drain_water_ph_zone_1&2": 5.9, "drain_water_ph_zone_3_": 6.9, "drain_water_ph_zone_4": 7.8, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 68.29, "temperature_dry": 33.0, "temperature_wet": 28.0, "time": "15:54", "item_id": 181}	nutrifresh	farm1
191	3	200	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 200}	nutrifresh	farm1
185	3	207	2024-06-15	15:03:00	{"date": 1718409600, "ec_-_input": 2.5, "ec_-bed": 2.5, "greenhouse_part": "A even", "humidity": 48.15, "ph_-_bed": 7.0, "ph_-_input": 7.0, "temperature_dry": 40.0, "temperature_wet": 30.0, "time": "15:03", "item_id": 207}	nutrifresh	farm1
186	3	206	2024-06-15	16:02:00	{"date": 1718409600, "ec_-_input": 2.2, "ec_-bed": 2.5, "greenhouse_part": "A odd", "humidity": 54.12, "ph_-_bed": 7.0, "ph_-_input": 5.0, "temperature_dry": 50.0, "temperature_wet": 40.0, "time": "16:02", "item_id": 206}	nutrifresh	farm1
187	3	204	2024-04-12	07:27:00	{"date": 1712880000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": "-", "item_id": 204, "time": "07:27"}	nutrifresh	farm1
188	3	203	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": "-", "item_id": 203}	nutrifresh	farm1
189	3	202	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 202}	nutrifresh	farm1
192	3	199	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 251.0, "temperature_wet": 22.0, "humidity": -0.3, "greenhouse_part": null, "item_id": 199}	nutrifresh	farm1
193	3	198	2024-04-13	05:34:00	{"date": 1712966400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 35.0, "temperature_wet": 24.0, "humidity": null, "greenhouse_part": "-", "item_id": 198, "time": "05:34"}	nutrifresh	farm1
194	3	197	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.1, "ph_-_bed": 7.17, "temperature_dry": 343.0, "temperature_wet": 23.0, "humidity": -0.12, "greenhouse_part": null, "item_id": 197}	nutrifresh	farm1
195	3	196	2024-04-11	00:00:00	{"date": 1712793600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.67, "ph_-_bed": 6.94, "temperature_dry": 25.0, "temperature_wet": 20.0, "humidity": null, "greenhouse_part": "B odd", "item_id": 196}	nutrifresh	farm1
200	3	191	2024-04-10	00:00:00	{"date": 1712707200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 7.42, "ph_-_bed": 7.17, "temperature_dry": 27.0, "temperature_wet": 21.0, "humidity": 61.0, "greenhouse_part": "B even", "item_id": 191}	nutrifresh	farm1
201	3	190	2024-04-09	00:00:00	{"date": 1712620800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 190}	nutrifresh	farm1
202	3	189	2024-04-09	00:00:00	{"date": 1712620800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 189}	nutrifresh	farm1
203	3	188	2024-04-09	00:00:00	{"date": 1712620800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": 39.0, "greenhouse_part": null, "item_id": 188}	nutrifresh	farm1
204	3	187	2024-04-09	00:00:00	{"date": 1712620800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.89, "ph_-_bed": 7.06, "temperature_dry": 35.0, "temperature_wet": 24.0, "humidity": 39.63, "greenhouse_part": null, "item_id": 187}	nutrifresh	farm1
205	3	186	2024-04-09	00:00:00	{"date": 1712620800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.63, "ph_-_bed": 6.86, "temperature_dry": 26.0, "temperature_wet": 22.0, "humidity": 64.0, "greenhouse_part": "A odd", "item_id": 186}	nutrifresh	farm1
206	3	185	2024-04-08	00:00:00	{"date": 1712534400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 185}	nutrifresh	farm1
207	3	184	2024-04-08	00:00:00	{"date": 1712534400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 184}	nutrifresh	farm1
208	3	183	2024-04-08	00:00:00	{"date": 1712534400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": 39.0, "greenhouse_part": null, "item_id": 183}	nutrifresh	farm1
209	3	182	2024-04-08	00:00:00	{"date": 1712534400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": 39.0, "greenhouse_part": null, "item_id": 182}	nutrifresh	farm1
210	3	181	2024-04-08	00:00:00	{"date": 1712534400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.38, "ph_-_bed": 6.36, "temperature_dry": 27.0, "temperature_wet": 21.0, "humidity": 61.0, "greenhouse_part": "A even", "item_id": 181}	nutrifresh	farm1
211	3	180	2024-04-05	00:00:00	{"date": 1712275200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 180}	nutrifresh	farm1
212	3	179	2024-04-05	00:00:00	{"date": 1712275200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 179}	nutrifresh	farm1
213	3	178	2024-04-05	00:00:00	{"date": 1712275200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 178}	nutrifresh	farm1
214	3	177	2024-04-05	00:00:00	{"date": 1712275200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.1, "ph_-_bed": 6.65, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 177}	nutrifresh	farm1
215	3	176	2024-04-05	00:00:00	{"date": 1712275200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.84, "ph_-_bed": 6.58, "temperature_dry": 24.0, "temperature_wet": 19.0, "humidity": 62.0, "greenhouse_part": null, "item_id": 176}	nutrifresh	farm1
216	3	175	2024-04-04	00:00:00	{"date": 1712188800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 175}	nutrifresh	farm1
217	3	174	2024-04-04	00:00:00	{"date": 1712188800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 174}	nutrifresh	farm1
218	3	173	2024-04-04	00:00:00	{"date": 1712188800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": 39.0, "greenhouse_part": null, "item_id": 173}	nutrifresh	farm1
219	3	172	2024-04-04	00:00:00	{"date": 1712188800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 172}	nutrifresh	farm1
220	3	171	2024-04-04	00:00:00	{"date": 1712188800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 5.83, "ph_-_bed": 6.64, "temperature_dry": 23.0, "temperature_wet": 18.0, "humidity": 60.0, "greenhouse_part": "A odd", "item_id": 171}	nutrifresh	farm1
221	3	170	2024-04-03	00:00:00	{"date": 1712102400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 170}	nutrifresh	farm1
222	3	169	2024-04-03	00:00:00	{"date": 1712102400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 169}	nutrifresh	farm1
223	3	168	2024-04-03	00:00:00	{"date": 1712102400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 168}	nutrifresh	farm1
224	3	167	2024-04-03	00:00:00	{"date": 1712102400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 167}	nutrifresh	farm1
225	3	166	2024-04-03	00:00:00	{"date": 1712102400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 572.0, "ph_-_bed": 6.68, "temperature_dry": 26.0, "temperature_wet": 22.0, "humidity": 64.0, "greenhouse_part": "A even", "item_id": 166}	nutrifresh	farm1
226	3	165	2024-04-02	00:00:00	{"date": 1712016000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 165}	nutrifresh	farm1
227	3	164	2024-04-02	00:00:00	{"date": 1712016000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 23.0, "humidity": 49.0, "greenhouse_part": null, "item_id": 164}	nutrifresh	farm1
228	3	163	2024-04-02	00:00:00	{"date": 1712016000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 22.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 163}	nutrifresh	farm1
229	3	162	2024-04-02	00:00:00	{"date": 1712016000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.82, "ph_-_bed": 5.82, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 162}	nutrifresh	farm1
230	3	161	2024-04-02	00:00:00	{"date": 1712016000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.31, "ph_-_bed": 5.85, "temperature_dry": 23.0, "temperature_wet": 19.0, "humidity": 67.0, "greenhouse_part": "A odd", "item_id": 161}	nutrifresh	farm1
234	3	157	2024-04-01	00:00:00	{"date": 1711929600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 24.0, "humidity": null, "greenhouse_part": null, "item_id": 157}	nutrifresh	farm1
235	3	156	2024-04-01	00:00:00	{"date": 1711929600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 26.0, "temperature_wet": 23.0, "humidity": null, "greenhouse_part": "A even", "item_id": 156}	nutrifresh	farm1
236	3	155	2024-03-31	00:00:00	{"date": 1711843200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 155}	nutrifresh	farm1
237	3	154	2024-03-31	00:00:00	{"date": 1711843200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": 45.0, "greenhouse_part": null, "item_id": 154}	nutrifresh	farm1
238	3	153	2024-03-31	00:00:00	{"date": 1711843200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 153}	nutrifresh	farm1
239	3	152	2024-03-31	00:00:00	{"date": 1711843200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 24.0, "humidity": 47.0, "greenhouse_part": null, "item_id": 152}	nutrifresh	farm1
240	3	151	2024-03-31	00:00:00	{"date": 1711843200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.06, "ph_-_bed": 6.34, "temperature_dry": 27.0, "temperature_wet": 21.5, "humidity": 61.4, "greenhouse_part": null, "item_id": 151}	nutrifresh	farm1
241	3	150	2024-03-30	00:00:00	{"date": 1711756800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 150}	nutrifresh	farm1
242	3	149	2024-03-30	00:00:00	{"date": 1711756800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 49.0, "greenhouse_part": null, "item_id": 149}	nutrifresh	farm1
243	3	148	2024-03-30	00:00:00	{"date": 1711756800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 148}	nutrifresh	farm1
244	3	147	2024-03-30	00:00:00	{"date": 1711756800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 49.0, "greenhouse_part": null, "item_id": 147}	nutrifresh	farm1
245	3	146	2024-03-30	00:00:00	{"date": 1711756800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.06, "ph_-_bed": 6.34, "temperature_dry": 27.0, "temperature_wet": 22.0, "humidity": 64.0, "greenhouse_part": null, "item_id": 146}	nutrifresh	farm1
246	3	145	2024-03-29	00:00:00	{"date": 1711670400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 145}	nutrifresh	farm1
247	3	144	2024-03-29	00:00:00	{"date": 1711670400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 22.0, "humidity": 59.0, "greenhouse_part": null, "item_id": 144}	nutrifresh	farm1
248	3	143	2024-03-29	00:00:00	{"date": 1711670400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": 45.0, "greenhouse_part": null, "item_id": 143}	nutrifresh	farm1
249	3	142	2024-03-29	00:00:00	{"date": 1711670400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.38, "ph_-_bed": 6.27, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 142}	nutrifresh	farm1
250	3	141	2024-03-29	00:00:00	{"date": 1711670400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 5.93, "ph_-_bed": 6.29, "temperature_dry": 25.0, "temperature_wet": 19.0, "humidity": 69.0, "greenhouse_part": null, "item_id": 141}	nutrifresh	farm1
251	3	140	2024-03-28	00:00:00	{"date": 1711584000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 140}	nutrifresh	farm1
252	3	139	2024-03-28	00:00:00	{"date": 1711584000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 21.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 139}	nutrifresh	farm1
253	3	138	2024-03-28	00:00:00	{"date": 1711584000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 21.5, "humidity": 35.0, "greenhouse_part": null, "item_id": 138}	nutrifresh	farm1
254	3	137	2024-03-28	00:00:00	{"date": 1711584000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.26, "ph_-_bed": 6.31, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 137}	nutrifresh	farm1
255	3	136	2024-03-28	00:00:00	{"date": 1711584000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 5.58, "ph_-_bed": 6.32, "temperature_dry": 23.0, "temperature_wet": 18.0, "humidity": 61.2, "greenhouse_part": null, "item_id": 136}	nutrifresh	farm1
256	3	135	2024-03-27	00:00:00	{"date": 1711497600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 135}	nutrifresh	farm1
257	3	134	2024-03-27	00:00:00	{"date": 1711497600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": 45.0, "greenhouse_part": null, "item_id": 134}	nutrifresh	farm1
258	3	133	2024-03-27	00:00:00	{"date": 1711497600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 133}	nutrifresh	farm1
259	3	132	2024-03-27	00:00:00	{"date": 1711497600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 5.96, "ph_-_bed": 6.23, "temperature_dry": 33.0, "temperature_wet": 24.0, "humidity": 47.0, "greenhouse_part": null, "item_id": 132}	nutrifresh	farm1
260	3	131	2024-03-27	00:00:00	{"date": 1711497600, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.28, "ph_-_bed": 6.38, "temperature_dry": 27.0, "temperature_wet": 21.5, "humidity": 61.4, "greenhouse_part": null, "item_id": 131}	nutrifresh	farm1
261	3	130	2024-03-26	00:00:00	{"date": 1711411200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 130}	nutrifresh	farm1
262	3	129	2024-03-26	00:00:00	{"date": 1711411200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 49.0, "greenhouse_part": null, "item_id": 129}	nutrifresh	farm1
263	3	128	2024-03-26	00:00:00	{"date": 1711411200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 128}	nutrifresh	farm1
264	3	127	2024-03-26	00:00:00	{"date": 1711411200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 127}	nutrifresh	farm1
265	3	126	2024-03-26	00:00:00	{"date": 1711411200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 24.0, "temperature_wet": 19.0, "humidity": 62.0, "greenhouse_part": null, "item_id": 126}	nutrifresh	farm1
266	3	125	2024-03-25	00:00:00	{"date": 1711324800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 125}	nutrifresh	farm1
267	3	124	2024-03-25	00:00:00	{"date": 1711324800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 23.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 124}	nutrifresh	farm1
268	3	123	2024-03-25	00:00:00	{"date": 1711324800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 123}	nutrifresh	farm1
269	3	122	2024-03-25	00:00:00	{"date": 1711324800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.36, "ph_-_bed": 6.32, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": 45.0, "greenhouse_part": null, "item_id": 122}	nutrifresh	farm1
270	3	121	2024-03-25	00:00:00	{"date": 1711324800, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": 6.22, "ph_-_bed": 6.19, "temperature_dry": 24.0, "temperature_wet": 19.0, "humidity": 62.0, "greenhouse_part": null, "item_id": 121}	nutrifresh	farm1
271	3	120	2024-03-24	00:00:00	{"date": 1711238400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 120}	nutrifresh	farm1
272	3	119	2024-03-24	00:00:00	{"date": 1711238400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 119}	nutrifresh	farm1
273	3	118	2024-03-24	00:00:00	{"date": 1711238400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 118}	nutrifresh	farm1
274	3	117	2024-03-24	00:00:00	{"date": 1711238400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 117}	nutrifresh	farm1
275	3	116	2024-03-24	00:00:00	{"date": 1711238400, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 116}	nutrifresh	farm1
276	3	115	2024-03-23	00:00:00	{"date": 1711152000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 115}	nutrifresh	farm1
277	3	114	2024-03-23	00:00:00	{"date": 1711152000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 21.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 114}	nutrifresh	farm1
278	3	113	2024-03-23	00:00:00	{"date": 1711152000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 21.5, "humidity": 35.0, "greenhouse_part": null, "item_id": 113}	nutrifresh	farm1
279	3	112	2024-03-23	00:00:00	{"date": 1711152000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 112}	nutrifresh	farm1
280	3	111	2024-03-23	00:00:00	{"date": 1711152000, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 23.0, "temperature_wet": 18.0, "humidity": 61.2, "greenhouse_part": null, "item_id": 111}	nutrifresh	farm1
281	3	110	2024-03-22	00:00:00	{"date": 1711065600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 110}	nutrifresh	farm1
282	3	109	2024-03-22	00:00:00	{"date": 1711065600, "ec_-_input": 3.04, "ph_-_input": 5.83, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 109}	nutrifresh	farm1
283	3	108	2024-03-22	00:00:00	{"date": 1711065600, "ec_-_input": 2.86, "ph_-_input": 5.84, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 108}	nutrifresh	farm1
284	3	107	2024-03-22	00:00:00	{"date": 1711065600, "ec_-_input": 2.93, "ph_-_input": 5.63, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 24.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 107}	nutrifresh	farm1
285	3	106	2024-03-22	00:00:00	{"date": 1711065600, "ec_-_input": 2.86, "ph_-_input": 5.65, "ec_-bed": 6.34, "ph_-_bed": 6.65, "temperature_dry": 23.0, "temperature_wet": 18.0, "humidity": 61.0, "greenhouse_part": null, "item_id": 106}	nutrifresh	farm1
286	3	105	2024-03-21	00:00:00	{"date": 1710979200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 105}	nutrifresh	farm1
287	3	104	2024-03-21	00:00:00	{"date": 1710979200, "ec_-_input": 3.04, "ph_-_input": 5.34, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 21.0, "humidity": null, "greenhouse_part": null, "item_id": 104}	nutrifresh	farm1
288	3	103	2024-03-21	00:00:00	{"date": 1710979200, "ec_-_input": 2.96, "ph_-_input": 5.91, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": null, "greenhouse_part": null, "item_id": 103}	nutrifresh	farm1
289	3	102	2024-03-21	00:00:00	{"date": 1710979200, "ec_-_input": 2.93, "ph_-_input": 5.65, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": null, "greenhouse_part": null, "item_id": 102}	nutrifresh	farm1
290	3	101	2024-03-21	00:00:00	{"date": 1710979200, "ec_-_input": 2.89, "ph_-_input": 5.86, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 25.0, "temperature_wet": 20.0, "humidity": null, "greenhouse_part": null, "item_id": 101}	nutrifresh	farm1
291	3	100	2024-03-20	00:00:00	{"date": 1710892800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 100}	nutrifresh	farm1
292	3	99	2024-03-20	00:00:00	{"date": 1710892800, "ec_-_input": 2.87, "ph_-_input": 5.65, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 54.0, "humidity": null, "greenhouse_part": null, "item_id": 99}	nutrifresh	farm1
293	3	98	2024-03-20	00:00:00	{"date": 1710892800, "ec_-_input": 3.04, "ph_-_input": 5.78, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 42.0, "humidity": null, "greenhouse_part": null, "item_id": 98}	nutrifresh	farm1
294	3	97	2024-03-20	00:00:00	{"date": 1710892800, "ec_-_input": 2.91, "ph_-_input": 5.63, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 46.0, "humidity": null, "greenhouse_part": null, "item_id": 97}	nutrifresh	farm1
295	3	96	2024-03-20	00:00:00	{"date": 1710892800, "ec_-_input": 2.88, "ph_-_input": 5.84, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 24.0, "temperature_wet": 62.0, "humidity": null, "greenhouse_part": null, "item_id": 96}	nutrifresh	farm1
296	3	95	2024-03-19	00:00:00	{"date": 1710806400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 95}	nutrifresh	farm1
297	3	94	2024-03-19	00:00:00	{"date": 1710806400, "ec_-_input": 3.04, "ph_-_input": 5.54, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 23.0, "humidity": 59.0, "greenhouse_part": null, "item_id": 94}	nutrifresh	farm1
298	3	93	2024-03-19	00:00:00	{"date": 1710806400, "ec_-_input": 3.06, "ph_-_input": 5.51, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 24.0, "humidity": 51.0, "greenhouse_part": null, "item_id": 93}	nutrifresh	farm1
299	3	92	2024-03-19	00:00:00	{"date": 1710806400, "ec_-_input": 2.85, "ph_-_input": 5.56, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 42.0, "greenhouse_part": null, "item_id": 92}	nutrifresh	farm1
300	3	91	2024-03-19	00:00:00	{"date": 1710806400, "ec_-_input": 2.84, "ph_-_input": 5.63, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 18.0, "humidity": 67.7, "greenhouse_part": null, "item_id": 91}	nutrifresh	farm1
301	3	90	2024-03-18	00:00:00	{"date": 1710720000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 90}	nutrifresh	farm1
302	3	89	2024-03-18	00:00:00	{"date": 1710720000, "ec_-_input": 2.5, "ph_-_input": 5.83, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 23.0, "humidity": 59.0, "greenhouse_part": null, "item_id": 89}	nutrifresh	farm1
303	3	88	2024-03-18	00:00:00	{"date": 1710720000, "ec_-_input": 2.64, "ph_-_input": 5.85, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 88}	nutrifresh	farm1
304	3	87	2024-03-18	00:00:00	{"date": 1710720000, "ec_-_input": 2.89, "ph_-_input": 5.86, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 42.0, "greenhouse_part": null, "item_id": 87}	nutrifresh	farm1
305	3	86	2024-03-18	00:00:00	{"date": 1710720000, "ec_-_input": 2.72, "ph_-_input": 5.96, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 18.0, "humidity": 67.0, "greenhouse_part": null, "item_id": 86}	nutrifresh	farm1
306	3	85	2024-03-17	00:00:00	{"date": 1710633600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 85}	nutrifresh	farm1
307	3	84	2024-03-17	00:00:00	{"date": 1710633600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 23.0, "humidity": 59.0, "greenhouse_part": null, "item_id": 84}	nutrifresh	farm1
308	3	83	2024-03-17	00:00:00	{"date": 1710633600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 83}	nutrifresh	farm1
309	3	82	2024-03-17	00:00:00	{"date": 1710633600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 19.0, "humidity": 45.0, "greenhouse_part": null, "item_id": 82}	nutrifresh	farm1
310	3	81	2024-03-17	00:00:00	{"date": 1710633600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 20.0, "temperature_wet": 17.0, "humidity": 74.0, "greenhouse_part": null, "item_id": 81}	nutrifresh	farm1
311	3	80	2024-03-16	00:00:00	{"date": 1710547200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 80}	nutrifresh	farm1
312	3	79	2024-03-16	00:00:00	{"date": 1710547200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 79}	nutrifresh	farm1
313	3	78	2024-03-16	00:00:00	{"date": 1710547200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 78}	nutrifresh	farm1
314	3	77	2024-03-16	00:00:00	{"date": 1710547200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 77}	nutrifresh	farm1
315	3	76	2024-03-16	00:00:00	{"date": 1710547200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 76}	nutrifresh	farm1
316	3	75	2024-03-15	00:00:00	{"date": 1710460800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 75}	nutrifresh	farm1
317	3	74	2024-03-15	00:00:00	{"date": 1710460800, "ec_-_input": 2.79, "ph_-_input": 5.69, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 23.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 74}	nutrifresh	farm1
318	3	73	2024-03-15	00:00:00	{"date": 1710460800, "ec_-_input": 2.84, "ph_-_input": 5.67, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 22.0, "humidity": 37.0, "greenhouse_part": null, "item_id": 73}	nutrifresh	farm1
319	3	72	2024-03-15	00:00:00	{"date": 1710460800, "ec_-_input": 2.93, "ph_-_input": 5.63, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 26.0, "temperature_wet": 19.0, "humidity": 51.0, "greenhouse_part": null, "item_id": 72}	nutrifresh	farm1
320	3	71	2024-03-15	00:00:00	{"date": 1710460800, "ec_-_input": 2.83, "ph_-_input": 5.82, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 21.0, "temperature_wet": 16.5, "humidity": 63.0, "greenhouse_part": null, "item_id": 71}	nutrifresh	farm1
321	3	70	2024-03-14	00:00:00	{"date": 1710374400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 70}	nutrifresh	farm1
322	3	69	2024-03-14	00:00:00	{"date": 1710374400, "ec_-_input": 3.33, "ph_-_input": 6.55, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 49.0, "greenhouse_part": null, "item_id": 69}	nutrifresh	farm1
323	3	68	2024-03-14	00:00:00	{"date": 1710374400, "ec_-_input": 2.79, "ph_-_input": "5.6.", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 68}	nutrifresh	farm1
324	3	67	2024-03-14	00:00:00	{"date": 1710374400, "ec_-_input": 2.81, "ph_-_input": 5.61, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 20.0, "humidity": 47.0, "greenhouse_part": null, "item_id": 67}	nutrifresh	farm1
325	3	66	2024-03-14	00:00:00	{"date": 1710374400, "ec_-_input": 2.98, "ph_-_input": 5.52, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 20.0, "temperature_wet": 16.5, "humidity": 70.0, "greenhouse_part": null, "item_id": 66}	nutrifresh	farm1
326	3	65	2024-03-13	00:00:00	{"date": 1710288000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 65}	nutrifresh	farm1
327	3	64	2024-03-13	00:00:00	{"date": 1710288000, "ec_-_input": 2.82, "ph_-_input": 5.92, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 23.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 64}	nutrifresh	farm1
328	3	63	2024-03-13	00:00:00	{"date": 1710288000, "ec_-_input": 2.87, "ph_-_input": 5.82, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 37.0, "temperature_wet": 26.5, "humidity": 41.0, "greenhouse_part": null, "item_id": 63}	nutrifresh	farm1
329	3	62	2024-03-13	00:00:00	{"date": 1710288000, "ec_-_input": 3.01, "ph_-_input": 6.18, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 19.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 62}	nutrifresh	farm1
330	3	61	2024-03-13	00:00:00	{"date": 1710288000, "ec_-_input": 2.97, "ph_-_input": 5.93, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 17.0, "humidity": 60.0, "greenhouse_part": null, "item_id": 61}	nutrifresh	farm1
331	3	60	2024-03-12	00:00:00	{"date": 1710201600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 60}	nutrifresh	farm1
332	3	59	2024-03-12	00:00:00	{"date": 1710201600, "ec_-_input": 3.06, "ph_-_input": 5.69, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 21.0, "humidity": 44.0, "greenhouse_part": null, "item_id": 59}	nutrifresh	farm1
333	3	58	2024-03-12	00:00:00	{"date": 1710201600, "ec_-_input": 3.5, "ph_-_input": 5.78, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 58}	nutrifresh	farm1
334	3	57	2024-03-12	00:00:00	{"date": 1710201600, "ec_-_input": 3.05, "ph_-_input": 5.71, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 26.0, "temperature_wet": 19.5, "humidity": 54.0, "greenhouse_part": null, "item_id": 57}	nutrifresh	farm1
335	3	56	2024-03-12	00:00:00	{"date": 1710201600, "ec_-_input": 3.07, "ph_-_input": 5.83, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 17.0, "humidity": 60.0, "greenhouse_part": null, "item_id": 56}	nutrifresh	farm1
336	3	55	2024-03-11	00:00:00	{"date": 1710115200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 55}	nutrifresh	farm1
337	3	54	2024-03-11	00:00:00	{"date": 1710115200, "ec_-_input": 3.02, "ph_-_input": 6.11, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 23.0, "humidity": 65.0, "greenhouse_part": null, "item_id": 54}	nutrifresh	farm1
338	3	53	2024-03-11	00:00:00	{"date": 1710115200, "ec_-_input": 2.89, "ph_-_input": 6.03, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 53}	nutrifresh	farm1
339	3	52	2024-03-11	00:00:00	{"date": 1710115200, "ec_-_input": 2.86, "ph_-_input": 6.14, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 52}	nutrifresh	farm1
340	3	51	2024-03-11	00:00:00	{"date": 1710115200, "ec_-_input": 2.91, "ph_-_input": 5.89, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 21.0, "temperature_wet": 18.0, "humidity": 74.0, "greenhouse_part": null, "item_id": 51}	nutrifresh	farm1
341	3	50	2024-03-10	00:00:00	{"date": 1710028800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 50}	nutrifresh	farm1
342	3	49	2024-03-10	00:00:00	{"date": 1710028800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 49}	nutrifresh	farm1
343	3	48	2024-03-10	00:00:00	{"date": 1710028800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 48}	nutrifresh	farm1
344	3	47	2024-03-10	00:00:00	{"date": 1710028800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 47}	nutrifresh	farm1
345	3	46	2024-03-10	00:00:00	{"date": 1710028800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 46}	nutrifresh	farm1
346	3	45	2024-03-09	00:00:00	{"date": 1709942400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 45}	nutrifresh	farm1
347	3	44	2024-03-09	00:00:00	{"date": 1709942400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 44}	nutrifresh	farm1
348	3	43	2024-03-09	00:00:00	{"date": 1709942400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 43}	nutrifresh	farm1
349	3	42	2024-03-09	00:00:00	{"date": 1709942400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 42}	nutrifresh	farm1
350	3	41	2024-03-09	00:00:00	{"date": 1709942400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 41}	nutrifresh	farm1
351	3	40	2024-03-08	00:00:00	{"date": 1709856000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 22.0, "humidity": 54.0, "greenhouse_part": null, "item_id": 40}	nutrifresh	farm1
352	3	39	2024-03-08	00:00:00	{"date": 1709856000, "ec_-_input": 2.88, "ph_-_input": 6.22, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 25.0, "humidity": 42.0, "greenhouse_part": null, "item_id": 39}	nutrifresh	farm1
353	3	38	2024-03-08	00:00:00	{"date": 1709856000, "ec_-_input": 2.83, "ph_-_input": 6.26, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 24.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 38}	nutrifresh	farm1
354	3	37	2024-03-08	00:00:00	{"date": 1709856000, "ec_-_input": 2.91, "ph_-_input": 6.7, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 24.0, "temperature_wet": 16.0, "humidity": 74.0, "greenhouse_part": null, "item_id": 37}	nutrifresh	farm1
355	3	36	2024-03-08	00:00:00	{"date": 1709856000, "ec_-_input": 2.56, "ph_-_input": 6.24, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 36}	nutrifresh	farm1
356	3	35	2024-03-07	00:00:00	{"date": 1709769600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 21.0, "humidity": 53.0, "greenhouse_part": null, "item_id": 35}	nutrifresh	farm1
357	3	34	2024-03-07	00:00:00	{"date": 1709769600, "ec_-_input": 2.43, "ph_-_input": 6.22, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 19.0, "humidity": 30.0, "greenhouse_part": null, "item_id": 34}	nutrifresh	farm1
358	3	33	2024-03-07	00:00:00	{"date": 1709769600, "ec_-_input": 2.44, "ph_-_input": 6.26, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 22.0, "humidity": 41.0, "greenhouse_part": null, "item_id": 33}	nutrifresh	farm1
359	3	32	2024-03-07	00:00:00	{"date": 1709769600, "ec_-_input": 2.32, "ph_-_input": 6.27, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 19.0, "temperature_wet": 15.0, "humidity": 65.0, "greenhouse_part": null, "item_id": 32}	nutrifresh	farm1
360	3	31	2024-03-07	00:00:00	{"date": 1709769600, "ec_-_input": 2.39, "ph_-_input": 6.24, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 31}	nutrifresh	farm1
1	1	177	2024-06-20	12:58:00	{"date": 1718841600, "day": "Thursday", "drain_water_ec_zone_1&2": 1.8, "drain_water_ec_zone_3_": 2.7, "drain_water_ec_zone_4": 2.1, "drain_water_ph_zone_1&2": 6.9, "drain_water_ph_zone_3_": 7.2, "drain_water_ph_zone_4": 7.1, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": 6.0, "humidity": 71.19, "temperature_dry": 33.0, "temperature_wet": 28.5, "time": "12:58", "item_id": 177}	nutrifresh	farm1
389	3	2	2024-03-01	00:00:00	{"date": 1709251200, "ec_-_input": 2.97, "ph_-_input": 5.94, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 2}	nutrifresh	farm1
2	1	176	2024-06-19	12:03:00	{"date": 1718755200, "day": "Wednesday", "drain_water_ec_zone_1&2": 1.7, "drain_water_ec_zone_3_": 2.4, "drain_water_ec_zone_4": 2.0, "drain_water_ph_zone_1&2": 7.0, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": 7.0, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.8, "fertigation_ph_zone_1&2": 6.1, "fertigation_ph_zone_3&4": 6.0, "humidity": 73.69, "temperature_dry": 32.0, "temperature_wet": 28.0, "time": "12:03", "item_id": 176}	nutrifresh	farm1
197	3	194	2024-04-10	00:00:00	{"date": 1712707200, "ec_-_input": "-", "ph_-_input": "-", "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": null, "greenhouse_part": null, "item_id": 194}	nutrifresh	farm1
390	3	1	2024-03-01	00:00:00	{"date": 1709251200, "ec_-_input": 2.98, "ph_-_input": 6.23, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 18.5, "humidity": 71.0, "greenhouse_part": null, "item_id": 1}	nutrifresh	farm1
361	3	30	2024-03-06	00:00:00	{"date": 1709683200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 30}	nutrifresh	farm1
362	3	29	2024-03-06	00:00:00	{"date": 1709683200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 28.0, "temperature_wet": 20.5, "humidity": 50.0, "greenhouse_part": null, "item_id": 29}	nutrifresh	farm1
363	3	28	2024-03-06	00:00:00	{"date": 1709683200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 30.0, "temperature_wet": 20.0, "humidity": 40.0, "greenhouse_part": null, "item_id": 28}	nutrifresh	farm1
364	3	27	2024-03-06	00:00:00	{"date": 1709683200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 23.0, "humidity": 46.0, "greenhouse_part": null, "item_id": 27}	nutrifresh	farm1
403	1	173	2024-06-16	01:04:00	{"greenhouse_id": 1, "client_name": "nutrifresh", "site": "farm1", "date": 1718496000, "day": "Sunday", "drain_water_ec_zone_1&2": 1.6, "drain_water_ec_zone_3_": 2.2, "drain_water_ec_zone_4": 2.5, "drain_water_ph_zone_1&2": 6.5, "drain_water_ph_zone_3_": 6.6, "drain_water_ph_zone_4": 6.8, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 73.22, "temperature_dry": 31.0, "temperature_wet": 27.0, "time": "01:04", "item_id": 173}	nutrifresh	farm1
365	3	26	2024-03-06	00:00:00	{"date": 1709683200, "ec_-_input": 2.93, "ph_-_input": 6.58, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 26}	nutrifresh	farm1
366	3	25	2024-03-05	00:00:00	{"date": 1709596800, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 25}	nutrifresh	farm1
367	3	24	2024-03-05	00:00:00	{"date": 1709596800, "ec_-_input": 2.84, "ph_-_input": 6.32, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 24}	nutrifresh	farm1
368	3	23	2024-03-05	00:00:00	{"date": 1709596800, "ec_-_input": 2.96, "ph_-_input": 6.18, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 29.0, "temperature_wet": 19.0, "humidity": 57.0, "greenhouse_part": null, "item_id": 23}	nutrifresh	farm1
369	3	22	2024-03-05	00:00:00	{"date": 1709596800, "ec_-_input": 2.93, "ph_-_input": 6.2, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 23.0, "humidity": 42.0, "greenhouse_part": null, "item_id": 22}	nutrifresh	farm1
370	3	21	2024-03-05	00:00:00	{"date": 1709596800, "ec_-_input": 2.89, "ph_-_input": 6.38, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 18.0, "temperature_wet": 15.0, "humidity": 72.0, "greenhouse_part": null, "item_id": 21}	nutrifresh	farm1
371	3	20	2024-03-04	00:00:00	{"date": 1709510400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 20}	nutrifresh	farm1
372	3	19	2024-03-04	00:00:00	{"date": 1709510400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 19}	nutrifresh	farm1
373	3	18	2024-03-04	00:00:00	{"date": 1709510400, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 21.0, "humidity": 40.0, "greenhouse_part": null, "item_id": 18}	nutrifresh	farm1
374	3	17	2024-03-04	00:00:00	{"date": 1709510400, "ec_-_input": 2.13, "ph_-_input": 6.33, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 21.0, "humidity": 30.0, "greenhouse_part": null, "item_id": 17}	nutrifresh	farm1
375	3	16	2024-03-04	00:00:00	{"date": 1709510400, "ec_-_input": 2.15, "ph_-_input": 6, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 16}	nutrifresh	farm1
404	1	196	2024-07-23	11:38:00	{"client_name": "-", "date": 1721692800, "day": "-", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "greenhouse_id": "-", "humidity": "-", "site": "-", "temperature_dry": "-", "temperature_wet": "-", "time": "11:38", "item_id": 196}	nutrifresh	farm1
376	3	15	2024-03-03	00:00:00	{"date": 1709424000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 27.0, "temperature_wet": 20.0, "humidity": 52.2, "greenhouse_part": null, "item_id": 15}	nutrifresh	farm1
377	3	14	2024-03-03	00:00:00	{"date": 1709424000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 32.0, "temperature_wet": 26.0, "humidity": 62.0, "greenhouse_part": null, "item_id": 14}	nutrifresh	farm1
378	3	13	2024-03-03	00:00:00	{"date": 1709424000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 34.0, "temperature_wet": 26.0, "humidity": 52.8, "greenhouse_part": null, "item_id": 13}	nutrifresh	farm1
379	3	12	2024-03-03	00:00:00	{"date": 1709424000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 12}	nutrifresh	farm1
380	3	11	2024-03-03	00:00:00	{"date": 1709424000, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 11}	nutrifresh	farm1
381	3	10	2024-03-02	00:00:00	{"date": 1709337600, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 10}	nutrifresh	farm1
382	3	9	2024-03-02	00:00:00	{"date": 1709337600, "ec_-_input": 2.8, "ph_-_input": 6.38, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 27.5, "temperature_wet": 21.0, "humidity": 55.0, "greenhouse_part": null, "item_id": 9}	nutrifresh	farm1
383	3	8	2024-03-02	00:00:00	{"date": 1709337600, "ec_-_input": 2.91, "ph_-_input": 6.38, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 31.0, "temperature_wet": 20.0, "humidity": 35.0, "greenhouse_part": null, "item_id": 8}	nutrifresh	farm1
384	3	7	2024-03-02	00:00:00	{"date": 1709337600, "ec_-_input": 2.85, "ph_-_input": 6.34, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 33.0, "temperature_wet": 26.5, "humidity": 57.0, "greenhouse_part": null, "item_id": 7}	nutrifresh	farm1
385	3	6	2024-03-02	00:00:00	{"date": 1709337600, "ec_-_input": 2.73, "ph_-_input": 6.43, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": 22.0, "temperature_wet": 18.5, "humidity": 71.5, "greenhouse_part": null, "item_id": 6}	nutrifresh	farm1
386	3	5	2024-03-01	00:00:00	{"date": 1709251200, "ec_-_input": null, "ph_-_input": null, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 5}	nutrifresh	farm1
387	3	4	2024-03-01	00:00:00	{"date": 1709251200, "ec_-_input": 3.12, "ph_-_input": 6.23, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 4}	nutrifresh	farm1
388	3	3	2024-03-01	00:00:00	{"date": 1709251200, "ec_-_input": 3.01, "ph_-_input": 5.81, "ec_-bed": null, "ph_-_bed": null, "temperature_dry": null, "temperature_wet": null, "humidity": null, "greenhouse_part": null, "item_id": 3}	nutrifresh	farm1
394	1	190	2024-07-03	17:33:00	{"date": 1719964800, "day": "Wednesday", "drain_water_ec_zone_1&2": 2.0, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": 0.7, "drain_water_ph_zone_1&2": 7.9, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": 7.5, "fertigation_ec_zone_1&2": 2.2, "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": 5.8, "fertigation_ph_zone_3&4": "-", "humidity": 73.22, "temperature_dry": 31.0, "temperature_wet": 27.0, "time": "17:33", "item_id": 190}	nutrifresh	farm1
395	1	189	2024-07-02	17:31:00	{"date": 1719878400, "day": "Tuesday", "drain_water_ec_zone_1&2": 2.0, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": 1.0, "drain_water_ph_zone_1&2": 7.6, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": 7.4, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 5.9, "humidity": 78.76, "temperature_dry": 29.0, "temperature_wet": 26.0, "time": "17:31", "item_id": 189}	nutrifresh	farm1
396	1	188	2024-07-01	17:31:00	{"date": 1719792000, "day": "Monday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": 2.4, "drain_water_ec_zone_4": 1.1, "drain_water_ph_zone_1&2": 7.7, "drain_water_ph_zone_3_": 6.9, "drain_water_ph_zone_4": 7.3, "fertigation_ec_zone_1&2": 2.0, "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": 6.0, "fertigation_ph_zone_3&4": 5.9, "humidity": 79.15, "temperature_dry": 30.0, "temperature_wet": 27.0, "time": "17:31", "item_id": 188}	nutrifresh	farm1
397	1	187	2024-06-30	17:29:00	{"date": 1719705600, "day": "Sunday", "drain_water_ec_zone_1&2": 2.3, "drain_water_ec_zone_3_": 1.8, "drain_water_ec_zone_4": 1.7, "drain_water_ph_zone_1&2": 7.4, "drain_water_ph_zone_3_": 7.0, "drain_water_ph_zone_4": 7.0, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 82.13, "temperature_dry": 29.0, "temperature_wet": 26.5, "time": "17:29", "item_id": 187}	nutrifresh	farm1
398	1	186	2024-06-29	20:21:00	{"date": 1719619200, "day": "Saturday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": 2.3, "drain_water_ec_zone_4": 2.6, "drain_water_ph_zone_1&2": 7.2, "drain_water_ph_zone_3_": 6.8, "drain_water_ph_zone_4": 6.9, "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": 1.9, "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": 6.0, "humidity": 47.76, "temperature_dry": 23.0, "temperature_wet": 16.0, "time": "20:21", "item_id": 186}	nutrifresh	farm1
399	1	195	2024-07-08	15:39:00	{"date": 1720396800, "day": "Monday", "drain_water_ec_zone_1&2": "-", "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": "-", "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 78.76, "temperature_dry": 29.0, "temperature_wet": 26.0, "time": "15:39", "item_id": 195}	nutrifresh	farm1
400	1	194	2024-07-07	17:12:00	{"date": 1720310400, "day": "Sunday", "drain_water_ec_zone_1&2": 2.1, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": 6.9, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": "-", "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": "-", "fertigation_ph_zone_3&4": "-", "humidity": 73.69, "temperature_dry": 32.0, "temperature_wet": 28.0, "time": "17:12", "item_id": 194}	nutrifresh	farm1
78	1	100	2024-04-04	00:00:00	{"item_id": 100, "date": 1712188800, "day": "Thursday", "fertigation_ec_zone_1&2": 2.4, "fertigation_ph_zone_1&2": 6.0, "drain_water_ec_zone_1&2": 3.2, "drain_water_ph_zone_1&2": 5.9, "fertigation_ec_zone_3&4": 2.4, "fertigation_ph_zone_3&4": 6.0, "drain_water_ec_zone_3_": 2.8, "drain_water_ph_zone_3_": 6.0, "drain_water_ec_zone_4": 3.1, "drain_water_ph_zone_4": 6.1, "temperature_dry": 37.5, "temperature_wet": 29.9, "humidity": 57.3}	nutrifresh	farm1
391	1	193	2024-07-06	17:12:00	{"date": 1720224000, "day": "Saturday", "drain_water_ec_zone_1&2": 2.2, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": 7.3, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": 2.2, "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": "-", "humidity": 84.99, "temperature_dry": 27.0, "temperature_wet": 25.0, "time": "17:12", "item_id": 193}	nutrifresh	farm1
392	1	192	2024-07-05	17:33:00	{"date": 1720137600, "day": "Friday", "drain_water_ec_zone_1&2": 1.9, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": 7.4, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": 2.2, "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": 5.9, "fertigation_ph_zone_3&4": "-", "humidity": 78.76, "temperature_dry": 29.0, "temperature_wet": 26.0, "time": "17:33", "item_id": 192}	nutrifresh	farm1
393	1	191	2024-07-04	17:33:00	{"date": 1720051200, "day": "Thursday", "drain_water_ec_zone_1&2": 2.4, "drain_water_ec_zone_3_": "-", "drain_water_ec_zone_4": "-", "drain_water_ph_zone_1&2": 7.5, "drain_water_ph_zone_3_": "-", "drain_water_ph_zone_4": "-", "fertigation_ec_zone_1&2": 2.2, "fertigation_ec_zone_3&4": "-", "fertigation_ph_zone_1&2": 5.8, "fertigation_ph_zone_3&4": "-", "humidity": 79.53, "temperature_dry": 31.0, "temperature_wet": 28.0, "time": "17:33", "item_id": 191}	nutrifresh	farm1
\.


--
-- TOC entry 4904 (class 0 OID 16406)
-- Dependencies: 219
-- Data for Name: farm; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.farm (id, client_id, name) FROM stdin;
1	1	farm1
2	1	farm2
\.


--
-- TOC entry 4910 (class 0 OID 16444)
-- Dependencies: 225
-- Data for Name: feedback; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.feedback (id, client_name, selected_cycle, selected_greenhouse, selected_grid, selected_site, message, "fileName") FROM stdin;
20	nutrifresh	cycle172	Unit 4 Part A	S1E1	farm1	sefes	PXL_20240608_100057948
21	John Doe	Spring 2024	Greenhouse A	Grid 1	Site 1	Great performance in the latest cycle.	report_spring2024.pdf
22	nutrifresh	cycle182	greenhouse1	S1D2	farm1	jio	PXL_20240618_113935986
\.


--
-- TOC entry 4906 (class 0 OID 16418)
-- Dependencies: 221
-- Data for Name: greenhouse; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.greenhouse (id, farm_id, name) FROM stdin;
1	1	greenhouse1
2	2	greenhouse5
3	1	greenhouse5
\.


--
-- TOC entry 4930 (class 0 OID 16633)
-- Dependencies: 245
-- Data for Name: grid_analysis; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grid_analysis (id, client_name, selected_greenhouse, selected_site, selected_cycle, json_data) FROM stdin;
\.


--
-- TOC entry 4928 (class 0 OID 16575)
-- Dependencies: 243
-- Data for Name: grid_data; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.grid_data (id, client_name, selected_greenhouse, selected_site, grid_format) FROM stdin;
1	nutrifresh	greenhouse1	farm1	[[{"label":"S1-M4","value":"S1M4"},{"label":"","value":null}],[{"label":"S1-M3","value":"S1M3"},{"label":"","value":null}],[{"label":"S1-M2","value":"S1M2"},{"label":"","value":null}],[{"label":"S1-M1","value":"S1M1"},{"label":"","value":null}],[{"label":"S1-L4","value":"S1L4"},{"label":"S3-L4","value":"L4"}],[{"label":"S1-L3","value":"S1L3"},{"label":"S3-L3","value":"L3"}],[{"label":"S1-L2","value":"S1L2"},{"label":"S3-L2","value":"L2"}],[{"label":"S1-L1","value":"S1L1"},{"label":"S3-L1","value":"L1"}],[{"label":"S1-K4","value":"S1K4"},{"label":"S3-K4","value":"K4"}],[{"label":"S1-K3","value":"S1K3"},{"label":"S3-K3","value":"K3"}],[{"label":"S1-K2","value":"S1K2"},{"label":"S3-K2","value":"K2"}],[{"label":"S1-K1","value":"S1K1"},{"label":"S3-K1","value":"K1"}],[{"label":"S1-J4","value":"S1J4"},{"label":"S3-J4","value":"J4"}],[{"label":"S1-J3","value":"S1J3"},{"label":"S3-J3","value":"J3"}],[{"label":"S1-J2","value":"S1J2"},{"label":"S3-J2","value":"J2"}],[{"label":"S1-J1","value":"S1J1"},{"label":"S3-J1","value":"J1"}],[{"label":"S1-I4","value":"S1I4"},{"label":"S3-I4","value":"I4"}],[{"label":"S1-I3","value":"S1I3"},{"label":"S3-I3","value":"I3"}],[{"label":"S1-I2","value":"S1I2"},{"label":"S3-I2","value":"I2"}],[{"label":"S1-I1","value":"S1I1"},{"label":"S3-I1","value":"I1"}],[{"label":"S1-H4","value":"S1H4"},{"label":"S3-H4","value":"H4"}],[{"label":"S1-H3","value":"S1H3"},{"label":"S3-H3","value":"H3"}],[{"label":"S1-H2","value":"S1H2"},{"label":"S3-H2","value":"H2"}],[{"label":"S1-H1","value":"S1H1"},{"label":"S3-H1","value":"H1"}],[{"label":"S1-G4","value":"S1G4"},{"label":"S3-G4","value":"G4"}],[{"label":"S1-G3","value":"S1G3"},{"label":"S3-G3","value":"G3"}],[{"label":"S1-G2","value":"S1G2"},{"label":"S3-G2","value":"G2"}],[{"label":"S1-G1","value":"S1G1"},{"label":"S3-G1","value":"G1"}],[{"label":"S1-F4","value":"S1F4"},{"label":"S2-F4","value":"F4"}],[{"label":"S1-F3","value":"S1F3"},{"label":"S2-F3","value":"F3"}],[{"label":"S1-F2","value":"S1F2"},{"label":"S2-F2","value":"F2"}],[{"label":"S1-F1","value":"S1F1"},{"label":"S2-F1","value":"F1"}],[{"label":"S1-E4","value":"S1E4"},{"label":"S2-E4","value":"E4"}],[{"label":"S1-E3","value":"S1E3"},{"label":"S2-E3","value":"E3"}],[{"label":"S1-E2","value":"S1E2"},{"label":"S2-E2","value":"E2"}],[{"label":"S1-E1","value":"S1E1"},{"label":"S2-E1","value":"E1"}],[{"label":"S1-D4","value":"S1D4"},{"label":"S2-D4","value":"D4"}],[{"label":"S1-D3","value":"S1D3"},{"label":"S2-D3","value":"D3"}],[{"label":"S1-D2","value":"S1D2"},{"label":"S2-D2","value":"D2"}],[{"label":"S1-D1","value":"S1D1"},{"label":"S2-D1","value":"D1"}],[{"label":"S1-C4","value":"S1C4"},{"label":"S2-C4","value":"C4"}],[{"label":"S1-C3","value":"S1C3"},{"label":"S2-C3","value":"C3"}],[{"label":"S1-C2","value":"S1C2"},{"label":"S2-C2","value":"C2"}],[{"label":"S1-C1","value":"S1C1"},{"label":"S2-C1","value":"C1"}],[{"label":"S1-B4","value":"S1B4"},{"label":"S2-B4","value":"B4"}],[{"label":"S1-B3","value":"S1B3"},{"label":"S2-B3","value":"B3"}],[{"label":"S1-B2","value":"S1B2"},{"label":"S2-B2","value":"B2"}],[{"label":"S1-B1","value":"S1B1"},{"label":"S2-B1","value":"B1"}],[{"label":"S1-A4","value":"S1A4"},{"label":"S2-A4","value":"A4"}],[{"label":"S1-A3","value":"S1A3"},{"label":"S2-A3","value":"A3"}],[{"label":"S1-A2","value":"S1A2"},{"label":"S2-A2","value":"A2"}],[{"label":"S1-A1","value":"S1A1"},{"label":"S2-A1","value":"A1"}]]
\.


--
-- TOC entry 4916 (class 0 OID 16473)
-- Dependencies: 231
-- Data for Name: key_value_pair; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.key_value_pair (id, key1, key2, value) FROM stdin;
\.


--
-- TOC entry 4926 (class 0 OID 16556)
-- Dependencies: 241
-- Data for Name: observations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.observations (id, client_name, site, greenhouse, cycle_name, delta_t_id, observation, hypothesis, solutions) FROM stdin;
1	nutrifresh	farm1	greenhouse1	cycle182	0	We observed easy increase in leaf damage in the grids S1-J4.\n\nWe observed that Temperature is 8.5 greater than optimal (Temperature dry: 34.50), Humidity is optimal (Humidity: 71.89), Ec is optimal (Fertigation ec zone 1 and 2: 2.00, Fertigation ec zone 3 and 4: 1.80), Ph is optimal (Fertigation ph zone 1 and 2: 6.10, Fertigation ph zone 3 and 4: 6.00).\n\nBased on the above observation, no disease is identified.		Testing Heree Real
\.


--
-- TOC entry 4912 (class 0 OID 16453)
-- Dependencies: 227
-- Data for Name: sensor_ranges; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sensor_ranges (id, client, greenhouse, site, temp_optimal, humidity_risky, ec_risky, ph_risky) FROM stdin;
5	nutrafresh	greenhouse4	farm2	(22,24)	(75,800)	(2.5,3.5)	(5.8,6.3)
24	\N	\N	\N	(22,21)	(705,8000)	(2.5,3.5)	(5767.8,6.93)
30	nutrifresh	greenhouse5	farm1	(22,28)	(75,80)	(2.5,3.5)	(5.8,6.2)
32	nutrifresh	greenhouse1	farm1	(22,26)	(75,80)	(2.5,3.5)	(5.8,6.2)
\.


--
-- TOC entry 4952 (class 0 OID 0)
-- Dependencies: 232
-- Name: bucket_values_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.bucket_values_id_seq', 4, true);


--
-- TOC entry 4953 (class 0 OID 0)
-- Dependencies: 216
-- Name: client_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.client_id_seq', 1, true);


--
-- TOC entry 4954 (class 0 OID 0)
-- Dependencies: 234
-- Name: clients_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.clients_id_seq', 3, true);


--
-- TOC entry 4955 (class 0 OID 0)
-- Dependencies: 238
-- Name: cycle-info_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."cycle-info_id_seq"', 215, true);


--
-- TOC entry 4956 (class 0 OID 0)
-- Dependencies: 236
-- Name: cycle_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cycle_id_seq', 1, false);


--
-- TOC entry 4957 (class 0 OID 0)
-- Dependencies: 228
-- Name: disease_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.disease_data_id_seq', 23, true);


--
-- TOC entry 4958 (class 0 OID 0)
-- Dependencies: 222
-- Name: env_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.env_data_id_seq', 404, true);


--
-- TOC entry 4959 (class 0 OID 0)
-- Dependencies: 218
-- Name: farm_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.farm_id_seq', 2, true);


--
-- TOC entry 4960 (class 0 OID 0)
-- Dependencies: 224
-- Name: feedback_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.feedback_id_seq', 22, true);


--
-- TOC entry 4961 (class 0 OID 0)
-- Dependencies: 220
-- Name: greenhouse_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.greenhouse_id_seq', 3, true);


--
-- TOC entry 4962 (class 0 OID 0)
-- Dependencies: 244
-- Name: grid_analysis_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grid_analysis_id_seq', 1, false);


--
-- TOC entry 4963 (class 0 OID 0)
-- Dependencies: 242
-- Name: grid_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.grid_data_id_seq', 1, true);


--
-- TOC entry 4964 (class 0 OID 0)
-- Dependencies: 230
-- Name: key_value_pair_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.key_value_pair_id_seq', 1, false);


--
-- TOC entry 4965 (class 0 OID 0)
-- Dependencies: 240
-- Name: observations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.observations_id_seq', 1, true);


--
-- TOC entry 4966 (class 0 OID 0)
-- Dependencies: 226
-- Name: sensor_ranges_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sensor_ranges_id_seq', 32, true);


--
-- TOC entry 4739 (class 2606 OID 16520)
-- Name: bucket_values bucket_values_key_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bucket_values
    ADD CONSTRAINT bucket_values_key_key UNIQUE (key);


--
-- TOC entry 4741 (class 2606 OID 16518)
-- Name: bucket_values bucket_values_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.bucket_values
    ADD CONSTRAINT bucket_values_pkey PRIMARY KEY (id);


--
-- TOC entry 4721 (class 2606 OID 16404)
-- Name: client client_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pkey PRIMARY KEY (id);


--
-- TOC entry 4743 (class 2606 OID 16529)
-- Name: clients clients_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.clients
    ADD CONSTRAINT clients_pkey PRIMARY KEY (id);


--
-- TOC entry 4747 (class 2606 OID 16551)
-- Name: cycle-info cycle-info_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public."cycle-info"
    ADD CONSTRAINT "cycle-info_pkey" PRIMARY KEY (id);


--
-- TOC entry 4745 (class 2606 OID 16536)
-- Name: cycle cycle_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cycle
    ADD CONSTRAINT cycle_pkey PRIMARY KEY (id);


--
-- TOC entry 4733 (class 2606 OID 16471)
-- Name: disease_data disease_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.disease_data
    ADD CONSTRAINT disease_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4727 (class 2606 OID 16437)
-- Name: env_data env_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.env_data
    ADD CONSTRAINT env_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4723 (class 2606 OID 16411)
-- Name: farm farm_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm
    ADD CONSTRAINT farm_pkey PRIMARY KEY (id);


--
-- TOC entry 4729 (class 2606 OID 16451)
-- Name: feedback feedback_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.feedback
    ADD CONSTRAINT feedback_pkey PRIMARY KEY (id);


--
-- TOC entry 4725 (class 2606 OID 16423)
-- Name: greenhouse greenhouse_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greenhouse
    ADD CONSTRAINT greenhouse_pkey PRIMARY KEY (id);


--
-- TOC entry 4754 (class 2606 OID 16640)
-- Name: grid_analysis grid_analysis_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_analysis
    ADD CONSTRAINT grid_analysis_pkey PRIMARY KEY (id);


--
-- TOC entry 4752 (class 2606 OID 16582)
-- Name: grid_data grid_data_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.grid_data
    ADD CONSTRAINT grid_data_pkey PRIMARY KEY (id);


--
-- TOC entry 4735 (class 2606 OID 16480)
-- Name: key_value_pair key_value_pair_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value_pair
    ADD CONSTRAINT key_value_pair_pkey PRIMARY KEY (id);


--
-- TOC entry 4750 (class 2606 OID 16563)
-- Name: observations observations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.observations
    ADD CONSTRAINT observations_pkey PRIMARY KEY (id);


--
-- TOC entry 4731 (class 2606 OID 16458)
-- Name: sensor_ranges sensor_ranges_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sensor_ranges
    ADD CONSTRAINT sensor_ranges_pkey PRIMARY KEY (id);


--
-- TOC entry 4737 (class 2606 OID 16482)
-- Name: key_value_pair unique_keys; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.key_value_pair
    ADD CONSTRAINT unique_keys UNIQUE (key1, key2);


--
-- TOC entry 4748 (class 1259 OID 16552)
-- Name: ix_cycle-info_id; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX "ix_cycle-info_id" ON public."cycle-info" USING btree (id);


--
-- TOC entry 4757 (class 2606 OID 16438)
-- Name: env_data env_data_greenhouse_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.env_data
    ADD CONSTRAINT env_data_greenhouse_id_fkey FOREIGN KEY (greenhouse_id) REFERENCES public.greenhouse(id);


--
-- TOC entry 4755 (class 2606 OID 16412)
-- Name: farm farm_client_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.farm
    ADD CONSTRAINT farm_client_id_fkey FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- TOC entry 4756 (class 2606 OID 16424)
-- Name: greenhouse greenhouse_farm_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.greenhouse
    ADD CONSTRAINT greenhouse_farm_id_fkey FOREIGN KEY (farm_id) REFERENCES public.farm(id);


-- Completed on 2024-07-24 23:40:12

--
-- PostgreSQL database dump complete
--

