--
-- PostgreSQL database dump
--

-- Dumped from database version 16.0
-- Dumped by pg_dump version 16.0

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
-- Name: adonis_schema; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adonis_schema (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    batch integer NOT NULL,
    migration_time timestamp with time zone DEFAULT CURRENT_TIMESTAMP
);


ALTER TABLE public.adonis_schema OWNER TO postgres;

--
-- Name: adonis_schema_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.adonis_schema_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.adonis_schema_id_seq OWNER TO postgres;

--
-- Name: adonis_schema_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.adonis_schema_id_seq OWNED BY public.adonis_schema.id;


--
-- Name: adonis_schema_versions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.adonis_schema_versions (
    version integer NOT NULL
);


ALTER TABLE public.adonis_schema_versions OWNER TO postgres;

--
-- Name: hashes; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.hashes (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hash character varying(255) NOT NULL
);


ALTER TABLE public.hashes OWNER TO postgres;

--
-- Name: hashes_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.hashes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.hashes_id_seq OWNER TO postgres;

--
-- Name: hashes_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.hashes_id_seq OWNED BY public.hashes.id;


--
-- Name: ipaddresses; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ipaddresses (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    hash_id integer NOT NULL,
    ip character varying(255),
    abuse_reputation real,
    geolocation json,
    colour character varying(255),
    pulses json
);


ALTER TABLE public.ipaddresses OWNER TO postgres;

--
-- Name: ipaddresses_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ipaddresses_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.ipaddresses_id_seq OWNER TO postgres;

--
-- Name: ipaddresses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ipaddresses_id_seq OWNED BY public.ipaddresses.id;


--
-- Name: viewcounters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.viewcounters (
    id integer NOT NULL,
    created_at timestamp with time zone,
    updated_at timestamp with time zone,
    count integer
);


ALTER TABLE public.viewcounters OWNER TO postgres;

--
-- Name: viewcounters_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.viewcounters_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.viewcounters_id_seq OWNER TO postgres;

--
-- Name: viewcounters_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.viewcounters_id_seq OWNED BY public.viewcounters.id;


--
-- Name: adonis_schema id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adonis_schema ALTER COLUMN id SET DEFAULT nextval('public.adonis_schema_id_seq'::regclass);


--
-- Name: hashes id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashes ALTER COLUMN id SET DEFAULT nextval('public.hashes_id_seq'::regclass);


--
-- Name: ipaddresses id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaddresses ALTER COLUMN id SET DEFAULT nextval('public.ipaddresses_id_seq'::regclass);


--
-- Name: viewcounters id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewcounters ALTER COLUMN id SET DEFAULT nextval('public.viewcounters_id_seq'::regclass);


--
-- Data for Name: adonis_schema; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adonis_schema (id, name, batch, migration_time) FROM stdin;
7	database/migrations/1694801429381_hashes	1	2023-10-21 13:55:52.419863-04
8	database/migrations/1694801622342_ipaddresses	1	2023-10-21 13:55:52.462198-04
9	database/migrations/1694913565164_viewcounters	1	2023-10-21 13:55:52.484868-04
\.


--
-- Data for Name: adonis_schema_versions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.adonis_schema_versions (version) FROM stdin;
2
\.


--
-- Data for Name: hashes; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.hashes (id, created_at, updated_at, hash) FROM stdin;
1	2023-10-21 14:00:15.857-04	2023-10-21 14:00:15.858-04	21b398fc6eb675701e059d6d57b8a2923cf28e897e1973c67940b2b78400d3cd
2	2023-10-21 14:36:35.254-04	2023-10-21 14:36:35.254-04	eee7d05a5e19ec44e398b9446808d00350e4527d95dfc4bb3e18ae78e0e310a3
3	2023-10-21 14:36:48.518-04	2023-10-21 14:36:48.518-04	d8e885dae12354b2d2850361a6d3c64d4faa7da412330eb4c29856dcdef3e88d
4	2023-10-21 14:37:37.533-04	2023-10-21 14:37:37.533-04	75878356f2e131cefb8aeb07e777fcc110475f8c92417fcade97e207a94ac372
5	2023-10-21 14:38:25.159-04	2023-10-21 14:38:25.159-04	f678e448cc031b7a7ac534e1e50b627ab3f6ae11f83f5c603ca2844d1c735b79
6	2023-10-21 14:39:35.021-04	2023-10-21 14:39:35.021-04	129fc7deea5ab9985c016ed6882e2c5c1f4ef971580862b68fafb0cfe387ee47
7	2023-10-21 14:40:19.04-04	2023-10-21 14:40:19.04-04	88994d9d4c1eecc9aa1be9338d3c8c2f4af84d994e9a4603803cfdc14429ea22
8	2023-10-21 14:41:00.296-04	2023-10-21 14:41:00.296-04	bdb89a48813d653020c80002b9993bf9e499200860f7158b4d252daa12cbb1db
9	2023-10-21 14:42:25.455-04	2023-10-21 14:42:25.455-04	eff2206213e940dfd2a870d50307649a3c9b9b38b15d8510ab6eb6063bbbaa57
10	2023-10-21 14:47:13.519-04	2023-10-21 14:47:13.519-04	8c08df336c91910b120bd67cc460d4518d856359625600483a01907afb0ccc2f
11	2023-10-21 14:47:52.742-04	2023-10-21 14:47:52.742-04	8abf6d62b56c191efa6573e515744eb1056f6d6dbd4ba456c939bb3f2aa539be
12	2023-10-21 14:51:13.412-04	2023-10-21 14:51:13.412-04	b49be737db3f966f29dab25706bd74353a737d5ab8376fdc4f3e35b97ceab208
13	2023-10-21 15:01:46.597-04	2023-10-21 15:01:46.597-04	0305bf3c2b749e19bd38259c682af8104caffb9e44e2995e5029281b9c899227
14	2023-10-21 15:03:19.263-04	2023-10-21 15:03:19.263-04	6ddd7270bb982f9b85b4c1d52a80000426b67e2c264b3cc5ecf5a43d9fb96996
15	2023-10-21 15:04:47.2-04	2023-10-21 15:04:47.2-04	1f7274b1da7f1fb048cffa3e761cc4acc7cffc4d66ba82d1bfd603549b815a5d
16	2023-10-21 15:07:20.889-04	2023-10-21 15:07:20.889-04	7b69cb6bf6a15e5c5c62d9b1f9af26a70264c805d894229f730a9df64e91b668
17	2023-10-21 15:28:31.224-04	2023-10-21 15:28:31.224-04	97bb6f30d2fe5546a810da356e41652d1bccfe2130cf77dec36b9ee17c19259d
18	2023-10-21 17:12:00.792-04	2023-10-21 17:12:00.793-04	564b0cb8a13964bc87dff7d5fb34b7d7dccf92ea2f89d3b9bb84fb13d5a2850c
19	2023-10-21 17:13:11.635-04	2023-10-21 17:13:11.635-04	696aaa0a2d06804fd98c3b16ae704eb779ddc833a6782fd289716dcf7fda35c8
20	2023-10-21 17:14:10.006-04	2023-10-21 17:14:10.006-04	936585d565116a8520c0bce7813cd99571f49ce0e5af8f88d554f46906deafec
21	2023-10-21 17:14:39.294-04	2023-10-21 17:14:39.294-04	fcaf673bbb728e44c052c2aa7c65c4cd61914dde88e26b72f4adae65d0aad360
22	2023-10-21 17:14:57.396-04	2023-10-21 17:14:57.396-04	173c13df79cbf1828e3ad521deb287e51a9b5969d65a26ca8fe7f39809c5d86a
23	2023-10-21 17:15:30.531-04	2023-10-21 17:15:30.531-04	7721b998cea6f21d723d73b315cca9941a812af0cac228f1eb697c7c3ee08207
24	2023-10-21 17:17:52.433-04	2023-10-21 17:17:52.433-04	e9b98c6c1c0aeeaadd6d4edc245d975dfca0aa34555951a84335221b9eb86863
25	2023-10-21 17:19:12.807-04	2023-10-21 17:19:12.807-04	5716244ce0f3bbae24b79db810e80cd5001b320e6608a838284b22889143ca66
26	2023-10-21 17:19:29.591-04	2023-10-21 17:19:29.591-04	4a4f89b2b9cf10b5113df4fb206e4ae9993e6d3de5e6cb997eb623a0d3b97900
27	2023-10-21 17:20:06.073-04	2023-10-21 17:20:06.073-04	015de283d33b7b246204fad78eaede87ab7939aaa34f035d59569aec3606747d
28	2023-10-21 17:26:43.99-04	2023-10-21 17:26:43.99-04	2f5370312110028e933cdcb12b331523010b79293fc924ec3ff316ffcafdef23
29	2023-10-21 17:27:26.527-04	2023-10-21 17:27:26.527-04	43344abdef5e0471f32554e0cd3af99dff313a2b6ce78aa0aab637211606ccf2
30	2023-10-21 17:27:33.568-04	2023-10-21 17:27:33.568-04	2e6f6602926ed48888a54e51672e75c77257767dfead4f0c3d8279bd04b89ba3
31	2023-10-21 17:27:33.926-04	2023-10-21 17:27:33.926-04	05c0453f8d82ccd0d41cba4ee0f72217eb2dc6d054714d65686aed053b05da6e
32	2023-10-21 17:27:36.072-04	2023-10-21 17:27:36.072-04	602ead0967a4b2ec579eaa089bd865bab131fe095ffa29da852f94adbb4548ab
33	2023-10-21 17:27:36.781-04	2023-10-21 17:27:36.781-04	1f86c31172987b55306aa3bf8dcfdf1791f2ca2731343556ab7c37f30106beb5
34	2023-10-21 17:27:38.233-04	2023-10-21 17:27:38.233-04	da2ff5f36ba27ad16babb9cad934ed067dc3cf532c38561335da1f064ae7a551
35	2023-10-21 17:27:38.661-04	2023-10-21 17:27:38.661-04	82053ac2dbe642b680aedf33610786c76e0f93946edb7d84addb7f46de5349dd
36	2023-10-21 17:27:40.989-04	2023-10-21 17:27:40.989-04	281fb080962f4f2016c8e4097f2ce2cd9ee7d0b066a7951409095150d55bc763
37	2023-10-21 17:27:42.223-04	2023-10-21 17:27:42.223-04	e3114192d93850cfcb2b2344da6b5dd4569a7a865fa4e038594b603f4de3cc92
38	2023-10-21 17:27:43.56-04	2023-10-21 17:27:43.56-04	b152fd85aa66038ebc17230039fa9425b82789cf5dc670516d2a32fb56f9b631
39	2023-10-21 17:27:50.607-04	2023-10-21 17:27:50.607-04	6b96f6652af99c513bbe89a4c5e61e2729aa1f67ce0c0c3d0ca28d2959dcd82c
40	2023-10-21 17:28:01.408-04	2023-10-21 17:28:01.408-04	dea1a541d370799777391cfb2cf661e96390bfc98308b4b83f14acfddee4c75b
41	2023-10-21 17:28:02.607-04	2023-10-21 17:28:02.607-04	84ef2a0c4a530be1aecad44326446853d4a083a90f3a48fc4954f4a2460671d6
42	2023-10-21 17:28:03.019-04	2023-10-21 17:28:03.019-04	065c379a33ef1539e8a68fd4b7638fe8a30ec19fc128642ed0c68539656374b9
43	2023-10-21 17:28:03.72-04	2023-10-21 17:28:03.72-04	5950bc250aea30acdbd275a5c615555bff8401d295d80feae8dedbb8b1957402
44	2023-10-21 17:31:11.931-04	2023-10-21 17:31:11.931-04	18d009129c238cfbcdf4ac537589cccc49a2c6ac63e2109cb34be28befe02096
45	2023-10-21 17:31:13.951-04	2023-10-21 17:31:13.951-04	d2bdbe121774d186eaab95260beb2f8c5dc831464f1456cb57a7ce4a6239b8fc
46	2023-10-21 17:31:37.391-04	2023-10-21 17:31:37.391-04	adf75f99537c3667becfae9b1dd508da9865a29ce590d914d3da500831c5c9f3
47	2023-10-21 17:31:39.809-04	2023-10-21 17:31:39.809-04	c7550dc220b264239f7250607d6af8a0123107be4c377a3c94e5f8e63984b17d
48	2023-10-21 17:31:41.011-04	2023-10-21 17:31:41.011-04	0f99677095ca8199a4988003afe3eb753de31f6137225ff3c90bbe6ecc9c2dbc
49	2023-10-21 17:31:42.054-04	2023-10-21 17:31:42.054-04	2d3770870c1b3116a047d960707cbf07de97957908ec82ca6e3b6519ca1ede85
50	2023-10-21 17:31:44.62-04	2023-10-21 17:31:44.62-04	7c7d8541766ddad17d9735ed7183d3d7e3433ea580258ed89f465fc8e91d3b82
51	2023-10-21 17:31:51.159-04	2023-10-21 17:31:51.159-04	7400b059554139fce9e9cc51c9320dd4abd4496db894ab763206b0d154a7d247
52	2023-10-21 17:32:14.387-04	2023-10-21 17:32:14.387-04	a67a342f31da4fcad0b866e9a73b535aa3d7c88cd58e457adf99e2a931b27282
53	2023-10-21 17:32:18.306-04	2023-10-21 17:32:18.306-04	dd39c64eae91e0b4cefac8a2ed66f5ca8bf6a0445830253d1325fab4d5c820c1
54	2023-10-21 17:32:18.491-04	2023-10-21 17:32:18.491-04	e7c81b5ba0cbf288bfbe3a24dcf8be9dfac0a4f2f69dda1d66111fedbffe6add
55	2023-10-21 17:32:19.423-04	2023-10-21 17:32:19.423-04	4ca03271d581294aa258c1ec3a84028470ecf87f5e9be222fc839e0f85bc4818
56	2023-10-21 17:32:20.294-04	2023-10-21 17:32:20.294-04	b7a1cb6937d81aa3c74fbcf0fcc473703140717b14cbdfb7147e0b15b1088984
57	2023-10-21 17:32:20.662-04	2023-10-21 17:32:20.662-04	c12c6dd22bbdf170dffd8278facbb834c692c8f5b319e863097869fe94541ba5
58	2023-10-21 17:32:21.148-04	2023-10-21 17:32:21.148-04	5b4be17def4fde4af18348d3cd7563d059071182af25415d867f67641a44c645
59	2023-10-21 17:32:23.301-04	2023-10-21 17:32:23.301-04	3e2d564ac5064fd8f534c7c15f729f0088e3f1d25bf2f04070b6753a25fa1f1c
60	2023-10-21 17:32:24.386-04	2023-10-21 17:32:24.386-04	0a4cc7f02c09e2538412683168e408534442d21f35a5903b4220cd844be146b4
61	2023-10-21 17:33:36.596-04	2023-10-21 17:33:36.596-04	4a3fbcc93475d769df2715d990dfed1151cd70e403f0474a9762ee82d75d1cdf
\.


--
-- Data for Name: ipaddresses; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ipaddresses (id, created_at, updated_at, hash_id, ip, abuse_reputation, geolocation, colour, pulses) FROM stdin;
1	2023-10-21 14:00:15.867-04	2023-10-21 14:00:15.867-04	1	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
2	2023-10-21 14:00:15.874-04	2023-10-21 14:00:15.874-04	1	131.107.255.255	0	{"lat":47.6422,"lon":-122.137}	green	["dns.msftncsi.com/\\t131.107.255.255"]
3	2023-10-21 14:00:15.878-04	2023-10-21 14:00:15.878-04	1	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
4	2023-10-21 14:00:15.88-04	2023-10-21 14:00:15.88-04	1	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
5	2023-10-21 14:00:15.882-04	2023-10-21 14:00:15.882-04	1	20.99.184.37	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
6	2023-10-21 14:00:15.885-04	2023-10-21 14:00:15.885-04	1	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
7	2023-10-21 14:00:15.888-04	2023-10-21 14:00:15.888-04	1	23.216.147.76	0	{"lat":47.6034,"lon":-122.3414}	green	["366 archivos malicios | conexiones con IP:23.216.147.76","SOC2022ALL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","ニューロスカイ - neurosky.jp - xmr pool","elgato stream deck"]
8	2023-10-21 14:00:15.89-04	2023-10-21 14:00:15.89-04	1	31.41.244.27	1	{"lat":59.8481,"lon":30.3224}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023"]
9	2023-10-21 14:37:37.535-04	2023-10-21 14:37:37.535-04	4	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
10	2023-10-21 14:37:37.537-04	2023-10-21 14:37:37.537-04	4	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
11	2023-10-21 14:37:37.541-04	2023-10-21 14:37:37.541-04	4	20.22.113.133	0	{"lat":36.677696,"lon":-78.37471}	green	["pegasustools com - vt collection"]
12	2023-10-21 14:37:37.544-04	2023-10-21 14:37:37.544-04	4	20.69.140.28	0	{"lat":47.233,"lon":-119.852}	green	["quick look at 104.192.108.192 and UoA","quick look at UoA","quick look at vk.com","Qakbot. Again. Today. Pulled from own device. Quasar RAT, Malvertizing","Tracking and Botnet campaign"]
13	2023-10-21 14:37:37.546-04	2023-10-21 14:37:37.546-04	4	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
14	2023-10-21 14:37:37.548-04	2023-10-21 14:37:37.548-04	4	23.216.147.76	0	{"lat":47.6034,"lon":-122.3414}	green	["366 archivos malicios | conexiones con IP:23.216.147.76","SOC2022ALL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","ニューロスカイ - neurosky.jp - xmr pool","elgato stream deck"]
15	2023-10-21 14:38:25.161-04	2023-10-21 14:38:25.161-04	5	193.109.85.80	36	{"lat":43.1592,"lon":44.1588}	orange	[]
16	2023-10-21 14:38:25.163-04	2023-10-21 14:38:25.163-04	5	8.8.8.8	0	{"lat":39.03,"lon":-77.5}	green	["IoCs from ThreatConnect","wikiworm","dump.pcap/application/vnd.tcpdump.pcap  0.0.0.0","minor cookie & dns elements within exploit chain self-repair.morzilla.org","8.8.8.8"]
17	2023-10-21 14:39:35.023-04	2023-10-21 14:39:35.023-04	6	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
18	2023-10-21 14:39:35.025-04	2023-10-21 14:39:35.025-04	6	108.177.119.101	0	{"lat":37.422,"lon":-122.084}	green	[]
19	2023-10-21 14:39:35.026-04	2023-10-21 14:39:35.026-04	6	108.177.119.94	0	{"lat":37.422,"lon":-122.084}	green	["note.html","note.html","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Compromise source"]
20	2023-10-21 14:39:35.029-04	2023-10-21 14:39:35.029-04	6	108.177.126.139	0	{"lat":37.422,"lon":-122.084}	green	["Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Remote Access Related |  APK attack targets independent artists","Apple iTunes| Malicious site | Anonyization | Siphoning | Trojan Downloader","quick look at vk.com"]
21	2023-10-21 14:39:35.03-04	2023-10-21 14:39:35.03-04	6	108.177.126.94	0	{"lat":37.422,"lon":-122.084}	green	["Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","ET | Installer | iOS hijacker | Trick Click","Apple iOS hijacker |  ET | Installer | Trick Click | Enhanced research","Compromise source"]
22	2023-10-21 14:39:35.032-04	2023-10-21 14:39:35.032-04	6	142.250.145.113	0	{"lat":32.6256,"lon":-97.3632}	green	[]
23	2023-10-21 14:39:35.034-04	2023-10-21 14:39:35.034-04	6	144.76.136.153	0	{"lat":51.1507,"lon":7.0572}	green	["bt wholesale - DHL -  AWS - Miara Dropper +"]
24	2023-10-21 14:39:35.035-04	2023-10-21 14:39:35.035-04	6	157.240.201.15	0	{"lat":52.3759,"lon":4.8975}	green	[]
25	2023-10-21 14:39:35.037-04	2023-10-21 14:39:35.037-04	6	157.240.201.35	0	{"lat":52.3759,"lon":4.8975}	green	["IG exploit"]
26	2023-10-21 14:39:35.039-04	2023-10-21 14:39:35.039-04	6	171.22.28.239	0	{"lat":54.705,"lon":20.5105}	green	[]
27	2023-10-21 14:40:19.042-04	2023-10-21 14:40:19.042-04	7	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
28	2023-10-21 14:40:19.043-04	2023-10-21 14:40:19.043-04	7	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
29	2023-10-21 14:40:19.045-04	2023-10-21 14:40:19.045-04	7	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
30	2023-10-21 14:41:00.297-04	2023-10-21 14:41:00.297-04	8	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
31	2023-10-21 14:41:00.299-04	2023-10-21 14:41:00.299-04	8	172.245.244.118	4	{"lat":42.3562,"lon":-71.0631}	orange	[]
32	2023-10-21 14:42:25.457-04	2023-10-21 14:42:25.457-04	9	5.42.92.211	1	{"lat":59.3287,"lon":18.0717}	orange	["ACTIVIDAD MALICIOSA | Relacionada con AMADEY 27-09-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023"]
33	2023-10-21 14:42:25.458-04	2023-10-21 14:42:25.458-04	9	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
34	2023-10-21 14:47:13.521-04	2023-10-21 14:47:13.521-04	10	104.26.12.31	0	{"lat":43.6532,"lon":-79.3832}	green	[]
35	2023-10-21 14:47:13.522-04	2023-10-21 14:47:13.522-04	10	104.26.13.31	0	{"lat":37.7803,"lon":-122.39}	green	["SSH Attacker"]
36	2023-10-21 14:47:13.523-04	2023-10-21 14:47:13.523-04	10	171.22.28.213	3	{"lat":54.705,"lon":20.5105}	orange	["URLHaus data - 05-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Amadey 18-10-2023"]
37	2023-10-21 14:47:13.525-04	2023-10-21 14:47:13.525-04	10	172.67.75.172	0	{"lat":37.7803,"lon":-122.39}	green	["SSH Attacker"]
38	2023-10-21 14:47:13.527-04	2023-10-21 14:47:13.527-04	10	185.216.70.222	3	{"lat":39.0814,"lon":-77.6443}	orange	["URLHaus data - 07-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023","URLHaus data - 17-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023"]
39	2023-10-21 14:47:13.528-04	2023-10-21 14:47:13.528-04	10	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
40	2023-10-21 14:47:13.53-04	2023-10-21 14:47:13.53-04	10	20.99.184.37	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
41	2023-10-21 14:47:13.532-04	2023-10-21 14:47:13.532-04	10	23.216.147.61	0	{"lat":47.6034,"lon":-122.3414}	green	["Brontok","ACTIVIDAD MALICIOSA | Relacionada con CyberGate 21-10-2023"]
42	2023-10-21 14:47:13.534-04	2023-10-21 14:47:13.534-04	10	239.255.255.250	0	{}	green	["Strings from pcap (dump_2.pcap) http://sebastiansabene.net/cgi-sys/suspendedpage.cgi","Pool's Closed","recallsfschoolboard.org","Centergate.com","www.centergate.com"]
43	2023-10-21 14:47:13.535-04	2023-10-21 14:47:13.535-04	10	5.42.65.80	4	{"lat":34.0522,"lon":-118.244}	orange	["Malware Command and Control IPs","URLHaus Malicious URL Blocklist 2023-09-24","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 27-09-2023","URLHaus data - 29-09-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
44	2023-10-21 14:47:52.744-04	2023-10-21 14:47:52.744-04	11	146.19.191.253	24	{"lat":50.1109,"lon":8.68213}	orange	["IP Addresses Logged by the Rosethorn PotNet","Honeypot Visitors (TCP/23) - 2023-10-15"]
45	2023-10-21 14:47:52.746-04	2023-10-21 14:47:52.746-04	11	8.8.8.8	0	{"lat":39.03,"lon":-77.5}	green	["IoCs from ThreatConnect","wikiworm","dump.pcap/application/vnd.tcpdump.pcap  0.0.0.0","minor cookie & dns elements within exploit chain self-repair.morzilla.org","8.8.8.8"]
46	2023-10-21 14:51:13.413-04	2023-10-21 14:51:13.413-04	12	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
47	2023-10-21 14:51:13.415-04	2023-10-21 14:51:13.415-04	12	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
48	2023-10-21 14:51:13.416-04	2023-10-21 14:51:13.416-04	12	20.99.184.37	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
49	2023-10-21 15:01:46.599-04	2023-10-21 15:01:46.6-04	13	142.251.143.109	0	{"lat":45.0703,"lon":7.68686}	green	["quick look at UoA","Phishing - bam-cell.cell.nr-data.net","Network capture | Gather Victim Network Information | C2"]
50	2023-10-21 15:01:46.601-04	2023-10-21 15:01:46.601-04	13	142.251.143.110	0	{"lat":45.0703,"lon":7.68686}	green	["Packed.VMProt/ Packed.VMProtect Apple|  iOS | Mac attack techapply.com","Packed.VMProt/ Packed.VMProtect Apple|  iOS | Mac attack techapply.com","ET | Installer | iOS hijacker | Trick Click","Apple iOS hijacker |  ET | Installer | Trick Click | Enhanced research","quick look at vk.com"]
51	2023-10-21 15:01:46.603-04	2023-10-21 15:01:46.603-04	13	142.251.143.142	0	{"lat":45.0703,"lon":7.68686}	green	["Packed.VMProt/ Packed.VMProtect Apple|  iOS | Mac attack techapply.com","Packed.VMProt/ Packed.VMProtect Apple|  iOS | Mac attack techapply.com","Phishing - bam-cell.cell.nr-data.net","quick look at vk.com","Network capture | Gather Victim Network Information | C2"]
52	2023-10-21 15:01:46.605-04	2023-10-21 15:01:46.605-04	13	142.251.143.163	0	{"lat":45.0703,"lon":7.68686}	green	["quick look at UoA","Phishing - bam-cell.cell.nr-data.net","quick look at vk.com","Fitbit app link IoC's","Fitbit app link IoC's"]
53	2023-10-21 15:01:46.607-04	2023-10-21 15:01:46.607-04	13	142.251.143.170	0	{"lat":45.0703,"lon":7.68686}	green	["Phishing - bam-cell.cell.nr-data.net","quick look at vk.com","Network capture | Gather Victim Network Information | C2"]
54	2023-10-21 15:01:46.608-04	2023-10-21 15:01:46.608-04	13	142.251.143.195	0	{"lat":45.0703,"lon":7.68686}	green	["Phishing - bam-cell.cell.nr-data.net","Fitbit app link IoC's","Fitbit app link IoC's","Network capture | Gather Victim Network Information | C2"]
55	2023-10-21 15:01:46.61-04	2023-10-21 15:01:46.61-04	13	142.251.143.196	0	{"lat":45.0703,"lon":7.68686}	green	["Qakbot attacks. As strong as before?","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests"]
56	2023-10-21 15:01:46.611-04	2023-10-21 15:01:46.611-04	13	157.240.196.35	0	{"lat":43.2951,"lon":5.3861}	green	[]
57	2023-10-21 15:01:46.613-04	2023-10-21 15:01:46.613-04	13	157.240.203.2	0	{"lat":45.5016,"lon":9.034}	green	[]
58	2023-10-21 15:01:46.615-04	2023-10-21 15:01:46.615-04	13	157.240.203.35	0	{"lat":45.5016,"lon":9.034}	green	[]
59	2023-10-21 15:03:19.268-04	2023-10-21 15:03:19.268-04	14	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
151	2023-10-21 17:31:41.012-04	2023-10-21 17:31:41.012-04	48	192.168.0.4	0	{}	green	[]
60	2023-10-21 15:03:19.271-04	2023-10-21 15:03:19.271-04	14	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
61	2023-10-21 15:03:19.273-04	2023-10-21 15:03:19.273-04	14	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
62	2023-10-21 15:03:19.275-04	2023-10-21 15:03:19.275-04	14	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
63	2023-10-21 15:04:47.203-04	2023-10-21 15:04:47.203-04	15	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
64	2023-10-21 15:04:47.204-04	2023-10-21 15:04:47.205-04	15	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
65	2023-10-21 15:04:47.209-04	2023-10-21 15:04:47.209-04	15	20.99.184.37	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
66	2023-10-21 15:04:47.211-04	2023-10-21 15:04:47.211-04	15	78.47.171.102	0	{"lat":50.475,"lon":12.365}	green	[]
67	2023-10-21 15:07:20.893-04	2023-10-21 15:07:20.893-04	16	217.32.184.17	0	{"lat":51.5074,"lon":-0.127758}	green	[]
68	2023-10-21 15:07:20.895-04	2023-10-21 15:07:20.895-04	16	8.8.8.8	0	{"lat":39.03,"lon":-77.5}	green	["IoCs from ThreatConnect","wikiworm","dump.pcap/application/vnd.tcpdump.pcap  0.0.0.0","minor cookie & dns elements within exploit chain self-repair.morzilla.org","8.8.8.8"]
69	2023-10-21 15:28:31.231-04	2023-10-21 15:28:31.231-04	17	192.168.0.1	0	{}	green	[]
70	2023-10-21 15:28:31.237-04	2023-10-21 15:28:31.237-04	17	192.187.111.221	0	{"lat":39.1374,"lon":-94.5786}	green	["DNS Monitoring abnormalities for bt-wifi.co.uk **cc - Simda Backdoor - 213.121.46.136 ** scanning ip"]
71	2023-10-21 15:28:31.24-04	2023-10-21 15:28:31.241-04	17	31.184.253.197	0	{"lat":59.9417,"lon":30.3096}	green	[]
72	2023-10-21 15:28:31.243-04	2023-10-21 15:28:31.244-04	17	63.141.242.44	0	{"lat":39.1484,"lon":-94.5686}	green	[]
73	2023-10-21 15:28:31.247-04	2023-10-21 15:28:31.247-04	17	81.17.18.195	0	{"lat":47.3934,"lon":8.5163}	green	["IOCs - 2022511143","IOCs - 20225201339","Hidden Users |Injection| Milum Botnet | Tulach Malware | Emotet","Hidden Users |Injection| Milum Botnet | Tulach Malware | Emotet"]
74	2023-10-21 15:28:31.25-04	2023-10-21 15:28:31.25-04	17	81.17.29.147	2	{"lat":47.3934,"lon":8.5163}	orange	[]
75	2023-10-21 17:12:00.799-04	2023-10-21 17:12:00.799-04	18	13.107.21.200	1	{"lat":45.5017,"lon":-73.5673}	orange	[]
76	2023-10-21 17:12:00.802-04	2023-10-21 17:12:00.802-04	18	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
77	2023-10-21 17:12:00.806-04	2023-10-21 17:12:00.806-04	18	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
78	2023-10-21 17:12:00.81-04	2023-10-21 17:12:00.81-04	18	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
79	2023-10-21 17:12:00.813-04	2023-10-21 17:12:00.813-04	18	204.79.197.200	0	{"lat":45.5017,"lon":-73.5673}	green	["aug 2018 twitter facebook & actionfraud.police.uk","crowd.in and www.bing.com 8wks on","IP ADDRESS: 52.144.44.142 - HOSTNAME: static1.mfbcdn.net - EXPIRES: Mon, 20 Jan 2020 05:40:05 GMT - ETAG: \\"2501-59c7e7a95c000-gzip #5","bingo  -  https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct","204.79.197.200 - URL that my IPhone 11 Pro sends data too"]
80	2023-10-21 17:12:00.816-04	2023-10-21 17:12:00.816-04	18	23.216.147.64	0	{"lat":47.6034,"lon":-122.3414}	green	["228 archivos maliciosos | Comunicación con ip: 208.91.199.225 // 20.82.210.154 // 23.216.147.64","SOC2022ALL","MSWINSCK.OCX - Ohhh Alexa pls call CN -  c2 Conficker","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck"]
81	2023-10-21 17:12:00.82-04	2023-10-21 17:12:00.82-04	18	85.209.11.85	1	{"lat":55.7483,"lon":37.6171}	orange	[]
82	2023-10-21 17:13:11.637-04	2023-10-21 17:13:11.637-04	19	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
83	2023-10-21 17:13:11.64-04	2023-10-21 17:13:11.64-04	19	163.123.143.8	0	{"lat":52.364,"lon":4.8913}	green	["ETIC Cybersecurity 2023-08-23 Port Scan","IOCs - 20231081416 - ANIA Threat Feeds - IP Segment 2","Suspicious IPs detected in honeypot"]
84	2023-10-21 17:13:11.641-04	2023-10-21 17:13:11.641-04	19	192.168.0.37	0	{}	green	[]
85	2023-10-21 17:13:11.643-04	2023-10-21 17:13:11.643-04	19	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
86	2023-10-21 17:13:11.644-04	2023-10-21 17:13:11.644-04	19	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
87	2023-10-21 17:13:11.646-04	2023-10-21 17:13:11.646-04	19	23.216.147.64	0	{"lat":47.6034,"lon":-122.3414}	green	["228 archivos maliciosos | Comunicación con ip: 208.91.199.225 // 20.82.210.154 // 23.216.147.64","SOC2022ALL","MSWINSCK.OCX - Ohhh Alexa pls call CN -  c2 Conficker","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck"]
88	2023-10-21 17:14:10.008-04	2023-10-21 17:14:10.008-04	20	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
89	2023-10-21 17:14:10.01-04	2023-10-21 17:14:10.01-04	20	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
90	2023-10-21 17:14:10.012-04	2023-10-21 17:14:10.012-04	20	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
91	2023-10-21 17:14:39.295-04	2023-10-21 17:14:39.295-04	21	103.77.240.208	100	{"lat":21.0278,"lon":105.834}	red	["IP Addresses Logged by the Rosethorn PotNet","Honeypot Visitors (TCP/80) - 2023-10-16","URLHaus data - 17-10-2023","Honeypot Visitors (TCP/80) - 2023-10-17","ACTIVIDAD MALICIOSA | Relacionada con Mirai 18-10-2023"]
92	2023-10-21 17:15:30.533-04	2023-10-21 17:15:30.533-04	23	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
93	2023-10-21 17:15:30.535-04	2023-10-21 17:15:30.535-04	23	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
94	2023-10-21 17:15:30.537-04	2023-10-21 17:15:30.537-04	23	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
95	2023-10-21 17:15:30.541-04	2023-10-21 17:15:30.541-04	23	20.22.113.133	0	{"lat":36.677696,"lon":-78.37471}	green	["pegasustools com - vt collection"]
96	2023-10-21 17:17:52.434-04	2023-10-21 17:17:52.434-04	24	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
97	2023-10-21 17:17:52.436-04	2023-10-21 17:17:52.436-04	24	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
98	2023-10-21 17:17:52.437-04	2023-10-21 17:17:52.437-04	24	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
99	2023-10-21 17:17:52.44-04	2023-10-21 17:17:52.44-04	24	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
100	2023-10-21 17:19:12.809-04	2023-10-21 17:19:12.809-04	25	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
101	2023-10-21 17:20:06.085-04	2023-10-21 17:20:06.085-04	27	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
102	2023-10-21 17:20:06.087-04	2023-10-21 17:20:06.087-04	27	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
103	2023-10-21 17:20:06.091-04	2023-10-21 17:20:06.091-04	27	194.147.140.194	0	{"lat":57.1453,"lon":-2.0945}	green	[]
104	2023-10-21 17:20:06.094-04	2023-10-21 17:20:06.094-04	27	20.96.52.198	0	{"lat":36.677696,"lon":-78.37471}	green	["quick look at vk.com"]
105	2023-10-21 17:20:06.098-04	2023-10-21 17:20:06.098-04	27	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
106	2023-10-21 17:20:06.1-04	2023-10-21 17:20:06.1-04	27	23.216.147.64	0	{"lat":47.6034,"lon":-122.3414}	green	["228 archivos maliciosos | Comunicación con ip: 208.91.199.225 // 20.82.210.154 // 23.216.147.64","SOC2022ALL","MSWINSCK.OCX - Ohhh Alexa pls call CN -  c2 Conficker","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck"]
107	2023-10-21 17:20:06.103-04	2023-10-21 17:20:06.103-04	27	23.54.18.67	0	{"lat":47.6034,"lon":-122.3414}	green	[]
108	2023-10-21 17:26:43.992-04	2023-10-21 17:26:43.992-04	28	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
109	2023-10-21 17:26:43.993-04	2023-10-21 17:26:43.993-04	28	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
110	2023-10-21 17:26:43.995-04	2023-10-21 17:26:43.995-04	28	20.22.113.133	0	{"lat":36.677696,"lon":-78.37471}	green	["pegasustools com - vt collection"]
111	2023-10-21 17:26:43.997-04	2023-10-21 17:26:43.997-04	28	20.99.133.109	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","ニューロスカイ - neurosky.jp - xmr pool","elgato stream deck","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
112	2023-10-21 17:28:01.41-04	2023-10-21 17:28:01.41-04	40	104.21.11.69	0	{"lat":43.6532,"lon":-79.3832}	green	[]
113	2023-10-21 17:28:01.413-04	2023-10-21 17:28:01.413-04	40	129.176.1.88	0	{"lat":44.0227,"lon":-92.4668}	green	[]
114	2023-10-21 17:28:01.415-04	2023-10-21 17:28:01.415-04	40	172.67.148.74	0	{"lat":43.6532,"lon":-79.3832}	green	[]
115	2023-10-21 17:28:01.416-04	2023-10-21 17:28:01.416-04	40	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
116	2023-10-21 17:28:01.418-04	2023-10-21 17:28:01.418-04	40	52.162.245.23	0	{"lat":41.8819,"lon":-87.6278}	green	[]
117	2023-10-21 17:28:02.609-04	2023-10-21 17:28:02.609-04	41	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
118	2023-10-21 17:28:02.61-04	2023-10-21 17:28:02.61-04	41	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
119	2023-10-21 17:28:02.612-04	2023-10-21 17:28:02.612-04	41	20.99.184.37	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
120	2023-10-21 17:28:02.613-04	2023-10-21 17:28:02.613-04	41	20.99.185.48	0	{"lat":47.233,"lon":-119.852}	green	["WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits","Play Ransomware"]
121	2023-10-21 17:28:02.615-04	2023-10-21 17:28:02.615-04	41	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
122	2023-10-21 17:28:02.616-04	2023-10-21 17:28:02.616-04	41	23.216.147.61	0	{"lat":47.6034,"lon":-122.3414}	green	["Brontok","ACTIVIDAD MALICIOSA | Relacionada con CyberGate 21-10-2023"]
123	2023-10-21 17:28:02.617-04	2023-10-21 17:28:02.617-04	41	23.216.147.76	0	{"lat":47.6034,"lon":-122.3414}	green	["366 archivos malicios | conexiones con IP:23.216.147.76","SOC2022ALL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","ニューロスカイ - neurosky.jp - xmr pool","elgato stream deck"]
124	2023-10-21 17:28:03.02-04	2023-10-21 17:28:03.02-04	42	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
125	2023-10-21 17:28:03.022-04	2023-10-21 17:28:03.022-04	42	129.176.1.87	0	{"lat":44.0227,"lon":-92.4668}	green	[]
126	2023-10-21 17:28:03.023-04	2023-10-21 17:28:03.023-04	42	129.176.1.88	0	{"lat":44.0227,"lon":-92.4668}	green	[]
127	2023-10-21 17:28:03.721-04	2023-10-21 17:28:03.721-04	43	104.117.233.215	0	{"lat":47.6034,"lon":-122.3414}	green	[]
128	2023-10-21 17:28:03.723-04	2023-10-21 17:28:03.723-04	43	104.26.13.31	0	{"lat":37.7803,"lon":-122.39}	green	["SSH Attacker"]
129	2023-10-21 17:28:03.724-04	2023-10-21 17:28:03.724-04	43	108.177.126.113	0	{"lat":37.422,"lon":-122.084}	green	["Remote Access Related |  APK attack targets independent artists","Apple iTunes| Malicious site | Anonyization | Siphoning | Trojan Downloader","quick look at vk.com"]
130	2023-10-21 17:28:03.725-04	2023-10-21 17:28:03.725-04	43	108.177.126.147	0	{"lat":37.422,"lon":-122.084}	green	["Search Engines • Portals • Search Engines • Mobile Communications • searchengines","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests"]
131	2023-10-21 17:28:03.727-04	2023-10-21 17:28:03.727-04	43	108.177.126.94	0	{"lat":37.422,"lon":-122.084}	green	["Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","ET | Installer | iOS hijacker | Trick Click","Apple iOS hijacker |  ET | Installer | Trick Click | Enhanced research","Compromise source"]
132	2023-10-21 17:28:03.728-04	2023-10-21 17:28:03.728-04	43	108.177.126.95	0	{"lat":37.422,"lon":-122.084}	green	["Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","quick look at 79.12.165.51"]
133	2023-10-21 17:28:03.729-04	2023-10-21 17:28:03.729-04	43	140.82.121.4	2	{"lat":50.1188,"lon":8.6843}	orange	["IOCs - 2022111350","IOCs - 20221291350","IOCs - 20222121432","IOCs - 20223111352","IOCs - 2022511143"]
134	2023-10-21 17:28:03.731-04	2023-10-21 17:28:03.731-04	43	142.250.217.110	0	{"lat":47.6062,"lon":-122.332}	green	["NORAD TRACKING (by scamcheck) 2023-06-14","NORAD TRACKING (by scamcheck) 2023-06-14","iplocal=0.0.0.0&cache=1 Comcast (by dorkingbeauty4) 2023-09-05","quick look at vk.com","CVE-2013-2465"]
135	2023-10-21 17:28:03.733-04	2023-10-21 17:28:03.733-04	43	142.250.217.78	0	{"lat":47.6062,"lon":-122.332}	green	["elgato stream deck","iplocal=0.0.0.0&cache=1 Comcast (by dorkingbeauty4) 2023-09-05","quick look at vk.com"]
136	2023-10-21 17:28:03.735-04	2023-10-21 17:28:03.735-04	43	142.250.69.195	0	{"lat":47.6062,"lon":-122.332}	green	["elgato stream deck","Ireland Netsky | Relay Router | Misc Attack on LTL Fright Outage"]
137	2023-10-21 17:31:13.953-04	2023-10-21 17:31:13.953-04	45	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
138	2023-10-21 17:31:13.955-04	2023-10-21 17:31:13.955-04	45	13.107.21.200	1	{"lat":45.5017,"lon":-73.5673}	orange	[]
139	2023-10-21 17:31:13.956-04	2023-10-21 17:31:13.956-04	45	163.5.112.199	0	{"lat":47.3983,"lon":0.7037}	green	[]
140	2023-10-21 17:31:13.958-04	2023-10-21 17:31:13.958-04	45	192.168.0.58	0	{}	green	[]
141	2023-10-21 17:31:13.96-04	2023-10-21 17:31:13.96-04	45	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
142	2023-10-21 17:31:13.962-04	2023-10-21 17:31:13.962-04	45	20.99.133.109	0	{"lat":47.233,"lon":-119.852}	green	["those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","ニューロスカイ - neurosky.jp - xmr pool","elgato stream deck","mask.studio.dan.com.goo-redirects.intercom.simontok.62..pdf","https://surveyheart.com/form/619fb5dc68ff1721fc915f81"]
143	2023-10-21 17:31:13.963-04	2023-10-21 17:31:13.963-04	45	204.79.197.200	0	{"lat":45.5017,"lon":-73.5673}	green	["aug 2018 twitter facebook & actionfraud.police.uk","crowd.in and www.bing.com 8wks on","IP ADDRESS: 52.144.44.142 - HOSTNAME: static1.mfbcdn.net - EXPIRES: Mon, 20 Jan 2020 05:40:05 GMT - ETAG: \\"2501-59c7e7a95c000-gzip #5","bingo  -  https://report-uri.cloudflare.com/cdn-cgi/beacon/expect-ct","204.79.197.200 - URL that my IPhone 11 Pro sends data too"]
144	2023-10-21 17:31:13.965-04	2023-10-21 17:31:13.965-04	45	206.108.0.131	0	{"lat":43.6492,"lon":-79.3912}	green	["IOCs - 20231081437 - ANIA Threat Feeds - IP Segment 7"]
145	2023-10-21 17:31:39.811-04	2023-10-21 17:31:39.811-04	47	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
146	2023-10-21 17:31:39.813-04	2023-10-21 17:31:39.813-04	47	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
147	2023-10-21 17:31:39.814-04	2023-10-21 17:31:39.814-04	47	193.161.193.99	1	{"lat":59.9423,"lon":30.2156}	orange	["IOCs - 2022111350","510 archivos maliciosos | comunicación con ip: 193.161.193.99","288 archivos maliciosos | comunicación con ip:193.161.193.99","IOCs - 20221291350","IOCs - 20222121432"]
148	2023-10-21 17:31:39.816-04	2023-10-21 17:31:39.816-04	47	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
149	2023-10-21 17:31:39.817-04	2023-10-21 17:31:39.817-04	47	23.54.18.74	0	{"lat":47.6034,"lon":-122.3414}	green	[]
150	2023-10-21 17:31:39.819-04	2023-10-21 17:31:39.819-04	47	8.8.8.8	0	{"lat":39.03,"lon":-77.5}	green	["IoCs from ThreatConnect","wikiworm","dump.pcap/application/vnd.tcpdump.pcap  0.0.0.0","minor cookie & dns elements within exploit chain self-repair.morzilla.org","8.8.8.8"]
152	2023-10-21 17:31:41.014-04	2023-10-21 17:31:41.014-04	48	192.229.211.108	0	{"lat":40.7128,"lon":-74.006}	green	["those ip's JL","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck","ACTIVIDAD MALICIOSA | Relacionada con NoName057(16) 22-04-2023","ACTIVIDAD MALICIOSA | Relacionada con Zaraza Bot 23-04-2023"]
153	2023-10-21 17:31:41.015-04	2023-10-21 17:31:41.015-04	48	20.99.186.246	0	{"lat":47.233,"lon":-119.852}	green	["pegasustools com - vt collection","WordPress Website Redirect Exploit","Malvertizing •  Phishing • Malware • malicious name tagging","Remcos • Communication Device exploit • C2","IoCs • Exploits"]
154	2023-10-21 17:31:41.017-04	2023-10-21 17:31:41.017-04	48	23.216.147.64	0	{"lat":47.6034,"lon":-122.3414}	green	["228 archivos maliciosos | Comunicación con ip: 208.91.199.225 // 20.82.210.154 // 23.216.147.64","SOC2022ALL","MSWINSCK.OCX - Ohhh Alexa pls call CN -  c2 Conficker","those ip's JL v2 all suggested ioc's - Data you got 😜🤷‍♀️","elgato stream deck"]
155	2023-10-21 17:31:41.02-04	2023-10-21 17:31:41.02-04	48	5.42.65.101	0	{"lat":34.0522,"lon":-118.244}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","IOC202310090007"]
156	2023-10-21 17:31:42.056-04	2023-10-21 17:31:42.056-04	49	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
157	2023-10-21 17:31:42.057-04	2023-10-21 17:31:42.057-04	49	104.20.67.143	0	{"lat":43.6532,"lon":-79.3832}	green	["COM Hijacking For Persistence With Suspicious Locations","Qakbot | Info Stealer | Sourced:  Part-RU"]
158	2023-10-21 17:31:42.059-04	2023-10-21 17:31:42.059-04	49	104.20.68.143	0	{"lat":43.6532,"lon":-79.3832}	green	["COM Hijacking For Persistence With Suspicious Locations","Qakbot | Info Stealer | Sourced:  Part-RU","Malicious ip"]
159	2023-10-21 17:31:42.06-04	2023-10-21 17:31:42.06-04	49	172.67.34.170	0	{"lat":43.6532,"lon":-79.3832}	green	["Qakbot | Info Stealer | Sourced:  Part-RU"]
160	2023-10-21 17:31:42.061-04	2023-10-21 17:31:42.061-04	49	192.229.221.95	0	{"lat":48.8566,"lon":2.35222}	green	["LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","LCIA:HoneyNet:April 2023","LCIA:HoneyNet:April 2023","LCIA_test"]
161	2023-10-21 17:31:42.063-04	2023-10-21 17:31:42.063-04	49	20.190.160.14	0	{"lat":52.3667,"lon":4.9}	green	["ChromeDriver.exe","Remote Access attack | Agent Tesla | C2 | BatLoader | C2 | Dridex"]
162	2023-10-21 17:31:42.064-04	2023-10-21 17:31:42.064-04	49	20.190.160.17	0	{"lat":52.3667,"lon":4.9}	green	["ChromeDriver.exe","Remote Access attack | Agent Tesla | C2 | BatLoader | C2 | Dridex"]
163	2023-10-21 17:31:42.065-04	2023-10-21 17:31:42.065-04	49	20.190.160.20	0	{"lat":52.3667,"lon":4.9}	green	[]
164	2023-10-21 17:31:42.067-04	2023-10-21 17:31:42.067-04	49	20.190.160.22	0	{"lat":52.3667,"lon":4.9}	green	["ChromeDriver.exe","Remote Access attack | Agent Tesla | C2 | BatLoader | C2 | Dridex"]
165	2023-10-21 17:31:42.068-04	2023-10-21 17:31:42.068-04	49	20.96.52.198	0	{"lat":36.677696,"lon":-78.37471}	green	["quick look at vk.com"]
166	2023-10-21 17:32:14.388-04	2023-10-21 17:32:14.388-04	52	103.77.240.208	100	{"lat":21.0278,"lon":105.834}	red	["IP Addresses Logged by the Rosethorn PotNet","Honeypot Visitors (TCP/80) - 2023-10-16","URLHaus data - 17-10-2023","Honeypot Visitors (TCP/80) - 2023-10-17","ACTIVIDAD MALICIOSA | Relacionada con Mirai 18-10-2023"]
167	2023-10-21 17:32:18.493-04	2023-10-21 17:32:18.493-04	54	104.117.233.215	0	{"lat":47.6034,"lon":-122.3414}	green	[]
168	2023-10-21 17:32:18.495-04	2023-10-21 17:32:18.495-04	54	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
169	2023-10-21 17:32:18.497-04	2023-10-21 17:32:18.497-04	54	104.26.12.31	0	{"lat":43.6532,"lon":-79.3832}	green	[]
170	2023-10-21 17:32:18.498-04	2023-10-21 17:32:18.498-04	54	108.177.119.100	0	{"lat":37.422,"lon":-122.084}	green	["Compromise source"]
171	2023-10-21 17:32:18.5-04	2023-10-21 17:32:18.5-04	54	108.177.119.101	0	{"lat":37.422,"lon":-122.084}	green	[]
172	2023-10-21 17:32:18.502-04	2023-10-21 17:32:18.502-04	54	108.177.119.94	0	{"lat":37.422,"lon":-122.084}	green	["note.html","note.html","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Compromise source"]
173	2023-10-21 17:32:18.503-04	2023-10-21 17:32:18.503-04	54	108.177.119.95	0	{"lat":37.422,"lon":-122.084}	green	["Ireland Netsky | Relay Router | Misc Attack on LTL Fright Outage","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Remote Access Related |  APK attack targets independent artists","Apple iTunes| Malicious site | Anonyization | Siphoning | Trojan Downloader"]
174	2023-10-21 17:32:18.505-04	2023-10-21 17:32:18.505-04	54	108.177.126.105	0	{"lat":37.422,"lon":-122.084}	green	["Search Engines • Portals • Search Engines • Mobile Communications • searchengines","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests"]
175	2023-10-21 17:32:18.506-04	2023-10-21 17:32:18.506-04	54	108.177.126.147	0	{"lat":37.422,"lon":-122.084}	green	["Search Engines • Portals • Search Engines • Mobile Communications • searchengines","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests"]
176	2023-10-21 17:32:18.508-04	2023-10-21 17:32:18.509-04	54	108.177.126.94	0	{"lat":37.422,"lon":-122.084}	green	["Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","Blackshades  | Remote attacks | Malicious Google Search | DNS Requests","ET | Installer | iOS hijacker | Trick Click","Apple iOS hijacker |  ET | Installer | Trick Click | Enhanced research","Compromise source"]
177	2023-10-21 17:32:19.424-04	2023-10-21 17:32:19.424-04	55	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
178	2023-10-21 17:32:19.426-04	2023-10-21 17:32:19.426-04	55	104.198.2.251	0	{"lat":45.5945,"lon":-121.1786}	green	[]
179	2023-10-21 17:32:19.427-04	2023-10-21 17:32:19.427-04	55	131.107.255.255	0	{"lat":47.6422,"lon":-122.137}	green	["dns.msftncsi.com/\\t131.107.255.255"]
180	2023-10-21 17:32:19.428-04	2023-10-21 17:32:19.428-04	55	34.143.166.163	0	{"lat":1.3048,"lon":103.8622}	green	[]
181	2023-10-21 17:32:19.43-04	2023-10-21 17:32:19.43-04	55	34.168.225.46	0	{"lat":45.5945,"lon":-121.1786}	green	[]
182	2023-10-21 17:32:19.432-04	2023-10-21 17:32:19.432-04	55	34.94.245.237	0	{"lat":34.0522,"lon":-118.2436}	green	[]
183	2023-10-21 17:32:19.434-04	2023-10-21 17:32:19.434-04	55	91.215.85.17	0	{"lat":55.7558,"lon":37.6173}	green	["Malware Command and Control IPs"]
184	2023-10-21 17:32:20.296-04	2023-10-21 17:32:20.296-04	56	104.18.15.101	0	{"lat":37.7803,"lon":-122.39}	green	["Remcos • Communication Device exploit • C2","Remcos • Communication Device exploit • C2","Communication Device exploit","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign"]
185	2023-10-21 17:32:20.299-04	2023-10-21 17:32:20.299-04	56	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
186	2023-10-21 17:32:20.301-04	2023-10-21 17:32:20.301-04	56	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
187	2023-10-21 17:32:20.303-04	2023-10-21 17:32:20.303-04	56	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
188	2023-10-21 17:32:21.151-04	2023-10-21 17:32:21.151-04	58	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
189	2023-10-21 17:32:21.153-04	2023-10-21 17:32:21.153-04	58	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
190	2023-10-21 17:32:21.154-04	2023-10-21 17:32:21.154-04	58	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
191	2023-10-21 17:32:21.156-04	2023-10-21 17:32:21.156-04	58	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
192	2023-10-21 17:32:23.303-04	2023-10-21 17:32:23.303-04	59	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
193	2023-10-21 17:32:23.304-04	2023-10-21 17:32:23.304-04	59	5.42.92.88	0	{"lat":59.3287,"lon":18.0717}	green	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con Smoke loader 18-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Lumma Stealer 18-10-2023","CVE-2014-0514"]
194	2023-10-21 17:32:23.306-04	2023-10-21 17:32:23.306-04	59	77.91.124.1	2	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","LCIA:HoneyNet:2023","LCIA:HoneyNet:2023","IP Addresses Logged by the Rosethorn PotNet","LCIA:HoneyNet:April 2023"]
195	2023-10-21 17:32:23.307-04	2023-10-21 17:32:23.307-04	59	77.91.124.55	33	{"lat":60.1719,"lon":24.9347}	orange	["Malware Command and Control IPs","ACTIVIDAD MALICIOSA | Relacionada con RedLine Stealer 03-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Smoke Loader 09-10-2023","ACTIVIDAD MALICIOSA | Relacionada con AMADEY 10-10-2023","ACTIVIDAD MALICIOSA | Relacionada con Healer 14-10-2023"]
196	2023-10-21 17:32:24.388-04	2023-10-21 17:32:24.388-04	60	104.117.233.215	0	{"lat":47.6034,"lon":-122.3414}	green	[]
197	2023-10-21 17:32:24.389-04	2023-10-21 17:32:24.389-04	60	104.18.14.101	0	{"lat":43.6532,"lon":-79.3832}	green	["Investigation of Distribution Vectors and Threat Network Infrastructure","BLOG | cloak-and-dagger | Page 4 of 8","Tracking and Botnet campaign","Tracker and Botnet campaign  - Canto XXVI","Tracker and Botnet campaign  - Canto XXVI"]
198	2023-10-21 17:32:24.391-04	2023-10-21 17:32:24.391-04	60	13.107.21.200	1	{"lat":45.5017,"lon":-73.5673}	orange	[]
199	2023-10-21 17:32:24.393-04	2023-10-21 17:32:24.393-04	60	142.250.217.106	0	{"lat":47.6062,"lon":-122.332}	green	[]
200	2023-10-21 17:32:24.394-04	2023-10-21 17:32:24.394-04	60	142.250.217.109	0	{"lat":47.6062,"lon":-122.332}	green	[]
201	2023-10-21 17:32:24.396-04	2023-10-21 17:32:24.396-04	60	142.250.217.110	0	{"lat":47.6062,"lon":-122.332}	green	["NORAD TRACKING (by scamcheck) 2023-06-14","NORAD TRACKING (by scamcheck) 2023-06-14","iplocal=0.0.0.0&cache=1 Comcast (by dorkingbeauty4) 2023-09-05","quick look at vk.com","CVE-2013-2465"]
202	2023-10-21 17:32:24.397-04	2023-10-21 17:32:24.397-04	60	142.250.217.78	0	{"lat":47.6062,"lon":-122.332}	green	["elgato stream deck","iplocal=0.0.0.0&cache=1 Comcast (by dorkingbeauty4) 2023-09-05","quick look at vk.com"]
203	2023-10-21 17:32:24.399-04	2023-10-21 17:32:24.399-04	60	142.250.69.206	0	{"lat":47.6062,"lon":-122.332}	green	["iplocal=0.0.0.0&cache=1 Comcast (by dorkingbeauty4) 2023-09-05","quick look at vk.com"]
204	2023-10-21 17:32:24.4-04	2023-10-21 17:32:24.4-04	60	142.251.211.238	0	{"lat":47.1443,"lon":-122.2545}	green	["quick look at 104.192.108.192 and UoA","quick look at UoA","quick look at vk.com"]
205	2023-10-21 17:32:24.402-04	2023-10-21 17:32:24.402-04	60	142.251.215.238	0	{"lat":47.1443,"lon":-122.2545}	green	["NORAD TRACKING (by scamcheck) 2023-06-14","NORAD TRACKING (by scamcheck) 2023-06-14","quick look at vk.com"]
\.


--
-- Data for Name: viewcounters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.viewcounters (id, created_at, updated_at, count) FROM stdin;
1	\N	\N	509
\.


--
-- Name: adonis_schema_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.adonis_schema_id_seq', 9, true);


--
-- Name: hashes_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.hashes_id_seq', 61, true);


--
-- Name: ipaddresses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ipaddresses_id_seq', 205, true);


--
-- Name: viewcounters_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.viewcounters_id_seq', 1, true);


--
-- Name: adonis_schema adonis_schema_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.adonis_schema
    ADD CONSTRAINT adonis_schema_pkey PRIMARY KEY (id);


--
-- Name: hashes hashes_hash_unique; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashes
    ADD CONSTRAINT hashes_hash_unique UNIQUE (hash);


--
-- Name: hashes hashes_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.hashes
    ADD CONSTRAINT hashes_pkey PRIMARY KEY (id);


--
-- Name: ipaddresses ipaddresses_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaddresses
    ADD CONSTRAINT ipaddresses_pkey PRIMARY KEY (id);


--
-- Name: viewcounters viewcounters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.viewcounters
    ADD CONSTRAINT viewcounters_pkey PRIMARY KEY (id);


--
-- Name: ipaddresses ipaddresses_hash_id_foreign; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ipaddresses
    ADD CONSTRAINT ipaddresses_hash_id_foreign FOREIGN KEY (hash_id) REFERENCES public.hashes(id);


--
-- PostgreSQL database dump complete
--

