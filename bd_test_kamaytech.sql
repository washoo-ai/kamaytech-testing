--
-- PostgreSQL database dump
--

-- Dumped from database version 14.13
-- Dumped by pg_dump version 16.4

-- Started on 2024-08-13 23:23:55

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
-- TOC entry 4 (class 2615 OID 2200)
-- Name: public; Type: SCHEMA; Schema: -; Owner: postgres
--

-- *not* creating schema, since initdb creates it


ALTER SCHEMA public OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 212 (class 1259 OID 16405)
-- Name: cliente; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cliente (
    cli_id integer NOT NULL,
    cli_nombre character varying,
    cli_apellido character varying,
    cli_activo boolean
);


ALTER TABLE public.cliente OWNER TO postgres;

--
-- TOC entry 211 (class 1259 OID 16404)
-- Name: cliente_cli_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cliente_cli_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cliente_cli_id_seq OWNER TO postgres;

--
-- TOC entry 3358 (class 0 OID 0)
-- Dependencies: 211
-- Name: cliente_cli_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cliente_cli_id_seq OWNED BY public.cliente.cli_id;


--
-- TOC entry 216 (class 1259 OID 16423)
-- Name: cpedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cpedidos (
    cpe_id integer NOT NULL,
    cli_id integer,
    cpe_fecha date,
    imp_id integer,
    cpe_subtotal numeric(10,2),
    cpe_impuesto numeric(10,2),
    cpe_total numeric(10,2)
);


ALTER TABLE public.cpedidos OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16422)
-- Name: cpedidos_cpe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cpedidos_cpe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.cpedidos_cpe_id_seq OWNER TO postgres;

--
-- TOC entry 3359 (class 0 OID 0)
-- Dependencies: 215
-- Name: cpedidos_cpe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cpedidos_cpe_id_seq OWNED BY public.cpedidos.cpe_id;


--
-- TOC entry 218 (class 1259 OID 16440)
-- Name: dpedidos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.dpedidos (
    dpe_id integer NOT NULL,
    cpe_id integer,
    pro_id integer,
    dpe_cantidad numeric(10,2),
    dpe_precio numeric(10,2),
    dpe_total numeric(10,2)
);


ALTER TABLE public.dpedidos OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 16439)
-- Name: dpedidos_dpe_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.dpedidos_dpe_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.dpedidos_dpe_id_seq OWNER TO postgres;

--
-- TOC entry 3360 (class 0 OID 0)
-- Dependencies: 217
-- Name: dpedidos_dpe_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.dpedidos_dpe_id_seq OWNED BY public.dpedidos.dpe_id;


--
-- TOC entry 210 (class 1259 OID 16396)
-- Name: impuesto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.impuesto (
    imp_id integer NOT NULL,
    imp_nombre character varying,
    imp_porcentaje character varying,
    imp_activo boolean
);


ALTER TABLE public.impuesto OWNER TO postgres;

--
-- TOC entry 209 (class 1259 OID 16395)
-- Name: impuesto_imp_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.impuesto_imp_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.impuesto_imp_id_seq OWNER TO postgres;

--
-- TOC entry 3361 (class 0 OID 0)
-- Dependencies: 209
-- Name: impuesto_imp_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.impuesto_imp_id_seq OWNED BY public.impuesto.imp_id;


--
-- TOC entry 214 (class 1259 OID 16414)
-- Name: producto; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.producto (
    pro_id integer NOT NULL,
    pro_descripcion character varying,
    pro_precio numeric(10,2),
    pro_activo boolean
);


ALTER TABLE public.producto OWNER TO postgres;

--
-- TOC entry 213 (class 1259 OID 16413)
-- Name: producto_pro_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.producto_pro_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER SEQUENCE public.producto_pro_id_seq OWNER TO postgres;

--
-- TOC entry 3362 (class 0 OID 0)
-- Dependencies: 213
-- Name: producto_pro_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.producto_pro_id_seq OWNED BY public.producto.pro_id;


--
-- TOC entry 3185 (class 2604 OID 16408)
-- Name: cliente cli_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente ALTER COLUMN cli_id SET DEFAULT nextval('public.cliente_cli_id_seq'::regclass);


--
-- TOC entry 3187 (class 2604 OID 16426)
-- Name: cpedidos cpe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpedidos ALTER COLUMN cpe_id SET DEFAULT nextval('public.cpedidos_cpe_id_seq'::regclass);


--
-- TOC entry 3188 (class 2604 OID 16443)
-- Name: dpedidos dpe_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dpedidos ALTER COLUMN dpe_id SET DEFAULT nextval('public.dpedidos_dpe_id_seq'::regclass);


--
-- TOC entry 3184 (class 2604 OID 16399)
-- Name: impuesto imp_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuesto ALTER COLUMN imp_id SET DEFAULT nextval('public.impuesto_imp_id_seq'::regclass);


--
-- TOC entry 3186 (class 2604 OID 16417)
-- Name: producto pro_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto ALTER COLUMN pro_id SET DEFAULT nextval('public.producto_pro_id_seq'::regclass);


--
-- TOC entry 3345 (class 0 OID 16405)
-- Dependencies: 212
-- Data for Name: cliente; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cliente (cli_id, cli_nombre, cli_apellido, cli_activo) FROM stdin;
1	CARLOS	LOPEZ	t
2	PEDRO	LITUMA	t
3	ANDY	ESPINEL	t
4	MANUEL	CARCHI	t
5	SAMUEL	PEREZ	t
6	LENIN	GOMEZ	t
7	ERICK	LOPEZ	t
8	BORIS	ALVEAR	t
9	CESAR	SARMIENTO	t
10	SANTIAGO	LITUMA	t
\.


--
-- TOC entry 3349 (class 0 OID 16423)
-- Dependencies: 216
-- Data for Name: cpedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cpedidos (cpe_id, cli_id, cpe_fecha, imp_id, cpe_subtotal, cpe_impuesto, cpe_total) FROM stdin;
25	3	2024-07-01	1	5249.30	787.40	6036.70
19	2	2024-08-01	1	4427.96	664.19	5092.15
33	4	2024-08-01	1	375.18	56.28	431.46
12	1	2024-08-01	1	782.13	117.32	899.45
42	5	2024-08-01	1	236.66	35.50	272.16
6	1	2024-04-01	1	0.00	0.00	\N
40	5	2024-08-01	1	2665.28	399.79	3065.07
62	8	2024-08-07	1	4133.33	620.00	4753.33
43	5	2024-08-01	1	293.57	44.04	337.61
61	8	2024-08-07	1	2466.66	370.00	2836.66
58	8	2024-08-07	1	151.00	22.65	173.65
60	8	2024-08-06	1	652.40	97.86	750.26
63	8	2024-08-07	1	1957.20	293.58	2250.78
37	5	2024-07-01	1	2297.09	344.56	2641.65
35	5	2024-07-01	1	282.62	42.39	325.01
32	4	2024-08-01	1	385.04	57.76	442.80
48	6	2024-07-01	1	139.35	20.90	160.25
49	6	2024-07-01	1	61.29	9.19	70.48
50	6	2024-07-01	1	380.58	57.09	437.67
41	5	2024-08-01	1	2978.16	446.72	3424.88
18	2	2024-07-01	1	17988.77	2698.32	20687.09
53	6	2024-07-01	1	291.75	43.76	335.51
59	8	2024-08-06	1	175.05	26.26	201.31
39	5	2024-08-01	1	665.07	99.76	764.83
10	1	2024-07-01	1	47839.29	7175.89	55015.18
57	8	2024-08-08	1	149.98	22.50	172.48
55	8	2024-08-02	1	61.29	9.19	70.48
31	4	2024-08-01	1	644.60	96.69	741.29
36	5	2024-07-01	1	1874.33	281.15	2155.48
56	8	2024-08-05	1	380.58	57.09	437.67
52	6	2024-07-01	1	226.50	33.98	260.48
11	1	2024-07-01	1	7117.19	1067.58	8184.77
38	5	2024-08-01	1	443.76	66.56	510.32
51	6	2024-07-01	1	299.96	44.99	344.95
26	3	2024-08-01	1	9835.19	1475.28	11310.47
28	4	2024-02-01	1	1395.00	209.25	1604.25
29	4	2024-02-01	1	1454.02	218.10	1672.12
30	4	2024-02-01	1	1060.46	159.07	1219.53
16	2	2024-04-01	1	23803.42	3570.51	27373.93
45	6	2024-01-01	1	577.56	86.63	664.19
4	1	2024-02-01	1	6786.26	1017.94	7804.20
24	3	2024-04-01	1	14962.29	2244.34	17206.63
46	6	2024-01-01	1	705.00	105.75	810.75
21	3	2024-02-01	1	16660.49	2499.07	19159.56
22	3	2024-04-01	1	4073.85	611.08	4684.93
7	1	2024-04-01	1	16497.66	2474.65	18972.31
5	1	2024-02-01	1	13883.52	2082.53	15966.05
17	2	2024-04-01	1	24809.35	3721.40	28530.75
23	3	2024-04-01	1	4175.36	626.30	4801.66
3	1	2024-01-01	1	1354.91	203.24	1558.15
47	6	2024-01-01	1	1115.70	167.36	1283.06
1	1	2024-01-01	1	5118.51	767.78	5886.29
13	2	2024-01-01	1	4727.33	709.10	5436.43
9	1	2024-05-01	1	34072.58	5110.89	39183.47
2	1	2024-01-01	1	7126.24	1068.94	8195.18
27	4	2024-01-01	1	371.02	55.65	426.67
15	2	2024-04-01	1	1616.78	242.52	1859.30
20	3	2024-01-01	1	11655.85	1748.38	13404.23
44	6	2024-01-01	1	644.60	96.69	741.29
14	2	2024-02-01	1	1014.93	152.24	1167.17
34	5	2024-01-01	1	421.87	63.28	485.15
8	1	2024-04-01	1	18231.59	2734.74	20966.33
54	8	2024-08-01	1	782.88	117.43	900.31
\.


--
-- TOC entry 3351 (class 0 OID 16440)
-- Dependencies: 218
-- Data for Name: dpedidos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.dpedidos (dpe_id, cpe_id, pro_id, dpe_cantidad, dpe_precio, dpe_total) FROM stdin;
1	1	1	1.00	125.06	125.06
2	1	2	1.00	91.85	91.85
3	1	3	1.00	54.47	54.47
4	1	4	2.00	219.14	438.28
5	1	5	3.00	63.48	190.44
6	1	6	5.00	469.75	2348.75
7	1	7	6.00	311.61	1869.66
8	2	12	1.00	76.97	76.97
9	2	13	1.00	294.05	294.05
10	2	14	1.00	411.11	411.11
11	2	15	2.00	286.39	572.78
12	2	16	3.00	450.23	1350.69
13	2	17	5.00	276.78	1383.90
14	2	18	6.00	236.66	1419.96
15	2	19	2.00	293.57	587.14
16	2	20	2.00	322.30	644.60
17	2	21	2.00	192.52	385.04
18	3	12	1.00	76.97	76.97
19	3	13	1.00	294.05	294.05
20	3	14	1.00	411.11	411.11
21	3	15	2.00	286.39	572.78
22	4	16	3.00	450.23	1350.69
23	4	17	5.00	276.78	1383.90
24	4	18	6.00	236.66	1419.96
25	4	19	2.00	293.57	587.14
26	4	20	2.00	322.30	644.60
27	4	21	2.00	192.52	385.04
28	4	1	3.00	125.06	375.18
29	4	2	4.00	91.85	367.40
30	4	3	5.00	54.47	272.35
31	5	4	6.00	219.14	1314.84
32	5	5	7.00	63.48	444.36
33	5	6	8.00	469.75	3758.00
34	5	7	9.00	311.61	2804.49
35	5	8	10.00	139.27	1392.70
36	5	9	11.00	266.79	2934.69
37	5	10	12.00	102.87	1234.44
38	7	11	13.00	340.89	4431.57
39	7	12	14.00	76.97	1077.58
40	7	13	15.00	294.05	4410.75
41	7	14	16.00	411.11	6577.76
42	8	15	17.00	286.39	4868.63
43	8	16	18.00	450.23	8104.14
44	8	17	19.00	276.78	5258.82
45	9	18	20.00	236.66	4733.20
46	9	19	21.00	293.57	6164.97
47	9	20	22.00	322.30	7090.60
48	9	21	23.00	192.52	4427.96
49	9	22	24.00	141.00	3384.00
50	9	23	25.00	185.95	4648.75
51	9	24	26.00	139.35	3623.10
67	13	15	2.00	286.39	572.78
68	13	16	3.00	450.23	1350.69
69	13	17	5.00	276.78	1383.90
70	13	18	6.00	236.66	1419.96
71	15	19	2.00	293.57	587.14
72	15	20	2.00	322.30	644.60
73	15	21	2.00	192.52	385.04
74	14	1	3.00	125.06	375.18
75	14	2	4.00	91.85	367.40
76	14	3	5.00	54.47	272.35
77	16	4	6.00	219.14	1314.84
78	16	5	7.00	63.48	444.36
79	16	6	8.00	469.75	3758.00
80	16	7	9.00	311.61	2804.49
81	16	8	10.00	139.27	1392.70
82	16	9	11.00	266.79	2934.69
83	16	10	12.00	102.87	1234.44
84	16	11	13.00	340.89	4431.57
85	16	12	14.00	76.97	1077.58
86	16	13	15.00	294.05	4410.75
87	17	14	16.00	411.11	6577.76
88	17	15	17.00	286.39	4868.63
89	17	16	18.00	450.23	8104.14
90	17	17	19.00	276.78	5258.82
95	20	22	24.00	141.00	3384.00
96	20	23	25.00	185.95	4648.75
97	20	24	26.00	139.35	3623.10
98	21	25	27.00	61.29	1654.83
99	21	26	28.00	380.58	10656.24
100	21	27	29.00	149.98	4349.42
101	22	28	30.00	75.50	2265.00
102	22	29	31.00	58.35	1808.85
103	23	30	32.00	130.48	4175.36
104	24	25	33.00	61.29	2022.57
105	24	26	34.00	380.58	12939.72
110	27	12	1.00	76.97	76.97
111	27	13	1.00	294.05	294.05
121	34	2	4.00	91.85	367.40
122	34	3	1.00	54.47	54.47
112	28	14	2.00	411.11	411.11
113	28	15	2.00	286.39	572.78
114	29	16	2.00	450.23	1350.69
115	29	17	2.00	276.78	1383.90
116	30	18	2.00	236.66	1419.96
117	30	19	2.00	293.57	587.14
139	44	20	2.00	322.30	644.60
140	45	21	3.00	192.52	577.56
141	46	22	5.00	141.00	705.00
142	47	23	6.00	185.95	1115.70
52	10	25	27.00	61.29	1903.05
53	10	26	28.00	380.58	12254.68
54	10	27	29.00	149.98	5001.83
55	10	28	30.00	75.50	2604.75
56	10	29	31.00	58.35	2080.18
57	10	30	32.00	130.48	4801.66
58	10	25	33.00	61.29	2325.96
59	10	26	34.00	380.58	14880.68
60	10	27	35.00	149.98	6036.70
61	10	28	36.00	75.50	3125.70
62	11	29	37.00	58.35	2482.79
63	11	30	38.00	130.48	5701.98
64	12	12	1.00	76.97	88.52
65	12	13	1.00	294.05	338.16
66	12	14	1.00	411.11	472.78
91	18	18	20.00	236.66	5443.18
92	18	19	21.00	293.57	7089.72
93	18	20	22.00	322.30	8154.19
94	19	21	23.00	192.52	5092.15
106	25	27	35.00	149.98	6036.70
107	26	28	36.00	75.50	3125.70
108	26	29	37.00	58.35	2482.79
109	26	30	38.00	130.48	5701.98
118	31	20	2.00	322.30	741.29
119	32	21	2.00	192.52	442.80
120	33	1	3.00	125.06	431.46
123	35	4	1.00	219.14	252.01
124	35	5	1.00	63.48	73.00
125	36	6	2.00	469.75	1080.43
126	36	7	3.00	311.61	1075.05
127	37	8	5.00	139.27	800.80
128	37	9	6.00	266.79	1840.85
129	38	10	1.00	102.87	118.30
130	38	11	1.00	340.89	392.02
131	39	12	1.00	76.97	88.52
132	39	13	2.00	294.05	676.32
133	40	14	3.00	411.11	1418.33
134	40	15	5.00	286.39	1646.74
135	41	16	6.00	450.23	3106.59
136	41	17	1.00	276.78	318.30
137	42	18	1.00	236.66	272.16
138	43	19	1.00	293.57	337.61
143	48	24	1.00	139.35	160.25
144	49	25	1.00	61.29	70.48
145	50	26	1.00	380.58	437.67
146	51	27	2.00	149.98	344.95
147	52	28	3.00	75.50	260.48
148	53	29	5.00	58.35	335.51
149	54	30	6.00	130.48	900.31
150	55	25	1.00	61.29	70.48
151	56	26	1.00	380.58	437.67
152	57	27	1.00	149.98	172.48
153	58	28	2.00	75.50	173.65
154	59	29	3.00	58.35	201.31
155	60	30	5.00	130.48	750.26
156	61	14	6.00	411.11	2836.66
157	62	15	5.00	286.39	1646.74
158	62	16	6.00	450.23	3106.59
159	63	30	7.00	130.48	1050.36
160	63	30	8.00	130.48	1200.42
\.


--
-- TOC entry 3343 (class 0 OID 16396)
-- Dependencies: 210
-- Data for Name: impuesto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.impuesto (imp_id, imp_nombre, imp_porcentaje, imp_activo) FROM stdin;
1	15% VENTAS	15	t
2	12% VENTAS	12	t
\.


--
-- TOC entry 3347 (class 0 OID 16414)
-- Dependencies: 214
-- Data for Name: producto; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.producto (pro_id, pro_descripcion, pro_precio, pro_activo) FROM stdin;
1	TECLADO MECANICO	125.06	t
2	RATON INALAMBRICO	91.85	t
3	MONITOR LED 24	54.47	t
4	SSD 500GB	219.14	t
5	MEMORIA RAM 16GB	63.48	t
6	PROCESADOR INTEL I5	469.75	t
7	PLACA BASE ATX	311.61	t
8	FUENTE DE ALIMENTACION 650W	139.27	t
9	CAJA PARA PC	266.79	t
10	VENTILADOR PARA CPU	102.87	t
11	DISCO DURO EXTERNO 1TB	340.89	t
12	CAMARA WEB HD	76.97	t
13	ALTAVOCES PARA PC	294.05	t
14	MICROFONO USB	411.11	t
15	IMPRESORA MULTIFUNCION	286.39	t
16	ROUTER WIFI	450.23	t
17	TARJETA GRAFICA GTX 1660	276.78	t
18	TECLADO ERGONOMICO	236.66	t
19	SILLA GAMING	293.57	t
20	PANTALLA TACTIL 15	322.30	t
21	HUB USB 30	192.52	t
22	CARGADOR PORTATIL	141.00	t
23	SOPORTE PARA MONITOR	185.95	t
24	ALFOMBRILLA PARA RATON	139.35	t
25	CABLE HDMI 20	61.29	t
26	ADAPTADOR USBC	380.58	t
27	PENDRIVE 64GB	149.98	t
28	TARJETA DE SONIDO EXTERNA	75.50	t
29	MOCHILA PARA LAPTOP	58.35	t
30	LECTOR DE TARJETAS SD	130.48	t
\.


--
-- TOC entry 3363 (class 0 OID 0)
-- Dependencies: 211
-- Name: cliente_cli_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cliente_cli_id_seq', 1, false);


--
-- TOC entry 3364 (class 0 OID 0)
-- Dependencies: 215
-- Name: cpedidos_cpe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cpedidos_cpe_id_seq', 1, false);


--
-- TOC entry 3365 (class 0 OID 0)
-- Dependencies: 217
-- Name: dpedidos_dpe_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.dpedidos_dpe_id_seq', 1, false);


--
-- TOC entry 3366 (class 0 OID 0)
-- Dependencies: 209
-- Name: impuesto_imp_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.impuesto_imp_id_seq', 1, false);


--
-- TOC entry 3367 (class 0 OID 0)
-- Dependencies: 213
-- Name: producto_pro_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.producto_pro_id_seq', 1, false);


--
-- TOC entry 3192 (class 2606 OID 16412)
-- Name: cliente cliente_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cliente
    ADD CONSTRAINT cliente_pkey PRIMARY KEY (cli_id);


--
-- TOC entry 3196 (class 2606 OID 16428)
-- Name: cpedidos cpedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpedidos
    ADD CONSTRAINT cpedidos_pkey PRIMARY KEY (cpe_id);


--
-- TOC entry 3198 (class 2606 OID 16445)
-- Name: dpedidos dpedidos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dpedidos
    ADD CONSTRAINT dpedidos_pkey PRIMARY KEY (dpe_id);


--
-- TOC entry 3190 (class 2606 OID 16403)
-- Name: impuesto impuesto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.impuesto
    ADD CONSTRAINT impuesto_pkey PRIMARY KEY (imp_id);


--
-- TOC entry 3194 (class 2606 OID 16421)
-- Name: producto producto_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.producto
    ADD CONSTRAINT producto_pkey PRIMARY KEY (pro_id);


--
-- TOC entry 3199 (class 2606 OID 16429)
-- Name: cpedidos cpedidos_cli_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpedidos
    ADD CONSTRAINT cpedidos_cli_id_fkey FOREIGN KEY (cli_id) REFERENCES public.cliente(cli_id);


--
-- TOC entry 3200 (class 2606 OID 16434)
-- Name: cpedidos cpedidos_imp_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cpedidos
    ADD CONSTRAINT cpedidos_imp_id_fkey FOREIGN KEY (imp_id) REFERENCES public.impuesto(imp_id);


--
-- TOC entry 3201 (class 2606 OID 16446)
-- Name: dpedidos dpedidos_cpe_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dpedidos
    ADD CONSTRAINT dpedidos_cpe_id_fkey FOREIGN KEY (cpe_id) REFERENCES public.cpedidos(cpe_id);


--
-- TOC entry 3202 (class 2606 OID 16451)
-- Name: dpedidos dpedidos_pro_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.dpedidos
    ADD CONSTRAINT dpedidos_pro_id_fkey FOREIGN KEY (pro_id) REFERENCES public.producto(pro_id);


--
-- TOC entry 3357 (class 0 OID 0)
-- Dependencies: 4
-- Name: SCHEMA public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE USAGE ON SCHEMA public FROM PUBLIC;
GRANT ALL ON SCHEMA public TO PUBLIC;


-- Completed on 2024-08-13 23:23:55

--
-- PostgreSQL database dump complete
--

