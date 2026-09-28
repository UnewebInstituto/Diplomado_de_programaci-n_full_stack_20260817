--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-09-28 11:13:06

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
-- TOC entry 214 (class 1259 OID 16412)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    cedula character varying(10),
    nombre character varying(30),
    apellido character varying(30),
    correo character varying(60),
    telefono character varying(20),
    direccion text
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 16441)
-- Name: personas_serial; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas_serial (
    id integer NOT NULL,
    cedula character varying(10),
    nombre character varying(30),
    apellido character varying(30),
    correo character varying(60),
    telefono character varying(20),
    direccion text
);


ALTER TABLE public.personas_serial OWNER TO postgres;

--
-- TOC entry 215 (class 1259 OID 16440)
-- Name: personas_serial_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_serial_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_serial_id_seq OWNER TO postgres;

--
-- TOC entry 3396 (class 0 OID 0)
-- Dependencies: 215
-- Name: personas_serial_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_serial_id_seq OWNED BY public.personas_serial.id;


--
-- TOC entry 220 (class 1259 OID 16496)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    cantidad integer,
    precio numeric(13,2)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 16594)
-- Name: productos_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_1 (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    cantidad integer,
    precio numeric(13,2)
);


ALTER TABLE public.productos_1 OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 16593)
-- Name: productos_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_1_id_seq OWNER TO postgres;

--
-- TOC entry 3397 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 219 (class 1259 OID 16495)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3398 (class 0 OID 0)
-- Dependencies: 219
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 218 (class 1259 OID 16468)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo character varying(80)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 224 (class 1259 OID 16585)
-- Name: proveedores_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores_1 (
    id integer NOT NULL,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo character varying(80)
);


ALTER TABLE public.proveedores_1 OWNER TO postgres;

--
-- TOC entry 223 (class 1259 OID 16584)
-- Name: proveedores_1_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_1_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedores_1_id_seq OWNER TO postgres;

--
-- TOC entry 3399 (class 0 OID 0)
-- Dependencies: 223
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 217 (class 1259 OID 16467)
-- Name: proveedores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.proveedores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.proveedores_id_seq OWNER TO postgres;

--
-- TOC entry 3400 (class 0 OID 0)
-- Dependencies: 217
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 229 (class 1259 OID 16694)
-- Name: vista_full_join_proveedores_productos_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_full_join_proveedores_productos_1 AS
 SELECT a.nombre AS proveedor,
    b.nombre AS producto,
    b.precio,
    b.cantidad
   FROM (public.proveedores_1 a
     LEFT JOIN public.productos_1 b ON ((b.proveedor_id = a.id)))
UNION
 SELECT a.nombre AS proveedor,
    b.nombre AS producto,
    b.precio,
    b.cantidad
   FROM (public.proveedores_1 a
     RIGHT JOIN public.productos_1 b ON ((b.proveedor_id = a.id)));


ALTER TABLE public.vista_full_join_proveedores_productos_1 OWNER TO postgres;

--
-- TOC entry 222 (class 1259 OID 16554)
-- Name: vista_inner_join_proveedores_productos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_inner_join_proveedores_productos AS
 SELECT proveedores.nombre AS proveedor,
    productos.nombre AS producto,
    productos.precio,
    productos.cantidad
   FROM (public.proveedores
     JOIN public.productos ON ((productos.proveedor_id = proveedores.id)));


ALTER TABLE public.vista_inner_join_proveedores_productos OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 16652)
-- Name: vista_left_join_proveedores_productos_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_left_join_proveedores_productos_1 AS
 SELECT a.nombre AS proveedor,
    b.nombre AS producto,
    b.precio,
    b.cantidad
   FROM (public.proveedores_1 a
     LEFT JOIN public.productos_1 b ON ((b.proveedor_id = a.id)));


ALTER TABLE public.vista_left_join_proveedores_productos_1 OWNER TO postgres;

--
-- TOC entry 221 (class 1259 OID 16538)
-- Name: vista_proveedores_productos; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_proveedores_productos AS
 SELECT a.nombre AS "Nombre del Proveedor",
    b.nombre AS "Nombre del Producto",
    b.precio AS "Precio",
    b.cantidad AS "Cantidad en Existencia"
   FROM public.proveedores a,
    public.productos b
  WHERE (b.proveedor_id = a.id);


ALTER TABLE public.vista_proveedores_productos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 16676)
-- Name: vista_right_join_proveedores_productos_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_right_join_proveedores_productos_1 AS
 SELECT a.nombre AS proveedor,
    b.nombre AS producto,
    b.precio,
    b.cantidad
   FROM (public.proveedores_1 a
     RIGHT JOIN public.productos_1 b ON ((b.proveedor_id = a.id)));


ALTER TABLE public.vista_right_join_proveedores_productos_1 OWNER TO postgres;

--
-- TOC entry 3217 (class 2604 OID 16444)
-- Name: personas_serial id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas_serial ALTER COLUMN id SET DEFAULT nextval('public.personas_serial_id_seq'::regclass);


--
-- TOC entry 3219 (class 2604 OID 16499)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3221 (class 2604 OID 16597)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3218 (class 2604 OID 16471)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3220 (class 2604 OID 16588)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3380 (class 0 OID 16412)
-- Dependencies: 214
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (cedula, nombre, apellido, correo, telefono, direccion) FROM stdin;
V1234	ANA	VASQUEZ	AV@GMAIL.COM	414 1234567	SANTA FE
\.


--
-- TOC entry 3382 (class 0 OID 16441)
-- Dependencies: 216
-- Data for Name: personas_serial; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas_serial (id, cedula, nombre, apellido, correo, telefono, direccion) FROM stdin;
2	V5678	YOLANDA	TORTOZA	YT@GMAIL.COM	4149871234	CATIA LA MAR
4	V8765	MAIBA	ROMERO	MR@GMAIL.COM	4128881234	EL SILENCIO
3	V9012	LIBIA	COLS	LC@GMAIL.COM	4145551234	GUATIRE
\.


--
-- TOC entry 3386 (class 0 OID 16496)
-- Dependencies: 220
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, proveedor_id, nombre, cantidad, precio) FROM stdin;
1	1	NEVERA	6	500.25
2	1	COCINA	3	300.75
3	2	LAVADORA	2	800.50
4	3	AIRE ACONDICIONADO	4	600.75
5	3	TELEVISOR	7	400.00
6	3	LAPTOP	5	1200.00
7	2	MICROONDAS	8	150.25
8	1	LICUADORA	12	100.00
9	2	PLANCHA	12	75.50
10	3	VENTILADOR	12	50.00
11	1	HORNO A GAS	6	450.00
12	2	CAFETERA	12	250.00
13	3	TOSTADORA	12	80.00
\.


--
-- TOC entry 3390 (class 0 OID 16594)
-- Dependencies: 226
-- Data for Name: productos_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_1 (id, proveedor_id, nombre, cantidad, precio) FROM stdin;
1	1	NEVERA	6	500.25
2	1	COCINA	3	300.75
3	2	LAVADORA	2	800.50
4	3	AIRE ACONDICIONADO	4	600.75
5	3	TELEVISOR	7	400.00
6	3	LAPTOP	5	1200.00
7	2	MICROONDAS	8	150.25
8	1	LICUADORA	12	100.00
9	2	PLANCHA	12	75.50
10	3	VENTILADOR	12	50.00
11	1	HORNO A GAS	6	450.00
12	2	CAFETERA	12	250.00
13	3	TOSTADORA	12	80.00
14	10	NEVERA	6	500.25
15	11	COCINA	3	300.75
16	12	LAVADORA	2	800.50
17	13	AIRE ACONDICIONADO	4	600.75
18	13	TELEVISOR	7	400.00
19	13	LAPTOP	5	1200.00
20	12	MICROONDAS	8	150.25
21	11	LICUADORA	12	100.00
22	12	PLANCHA	12	75.50
23	13	VENTILADOR	12	50.00
24	11	HORNO A GAS	6	450.00
25	12	CAFETERA	12	250.00
26	13	TOSTADORA	12	80.00
\.


--
-- TOC entry 3384 (class 0 OID 16468)
-- Dependencies: 218
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3388 (class 0 OID 16585)
-- Dependencies: 224
-- Data for Name: proveedores_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores_1 (id, nombre, direccion, telefono, correo) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
4	ADMIRAL	AV. SAN MARTIN	2127112233	info@ad.com
5	CONDESA	AV. BARALT	2128222277	info@con.com
6	WHIRPOOL	AV. VICTORIA	2129334455	info@wp.com
\.


--
-- TOC entry 3401 (class 0 OID 0)
-- Dependencies: 215
-- Name: personas_serial_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_serial_id_seq', 4, true);


--
-- TOC entry 3402 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 26, true);


--
-- TOC entry 3403 (class 0 OID 0)
-- Dependencies: 219
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3404 (class 0 OID 0)
-- Dependencies: 223
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 6, true);


--
-- TOC entry 3405 (class 0 OID 0)
-- Dependencies: 217
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3223 (class 2606 OID 16448)
-- Name: personas_serial personas_serial_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas_serial
    ADD CONSTRAINT personas_serial_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 16599)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3227 (class 2606 OID 16565)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3229 (class 2606 OID 16592)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3225 (class 2606 OID 16475)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3232 (class 2606 OID 16500)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-09-28 11:13:10

--
-- PostgreSQL database dump complete
--

