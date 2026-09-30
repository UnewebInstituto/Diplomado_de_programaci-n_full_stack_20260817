--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-09-30 11:30:23

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
-- TOC entry 7 (class 2615 OID 24601)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 3417 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA presupuesto; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA presupuesto IS 'Presupuesto';


--
-- TOC entry 6 (class 2615 OID 24594)
-- Name: recursos_humanos; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA recursos_humanos;


ALTER SCHEMA recursos_humanos OWNER TO postgres;

--
-- TOC entry 3418 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA recursos_humanos; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA recursos_humanos IS 'Recursos Humanos';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 229 (class 1259 OID 24896)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80)
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24895)
-- Name: alumno_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumno_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumno_id_seq OWNER TO postgres;

--
-- TOC entry 3419 (class 0 OID 0)
-- Dependencies: 228
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 232 (class 1259 OID 24909)
-- Name: alumnos_asignaturas_inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos_asignaturas_inscripcion (
    alumnos_id integer NOT NULL,
    asignaturas_id integer NOT NULL,
    periodo smallint NOT NULL
);


ALTER TABLE public.alumnos_asignaturas_inscripcion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24903)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignaturas (
    id integer NOT NULL,
    nombre character varying(80)
);


ALTER TABLE public.asignaturas OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24902)
-- Name: asignaturas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.asignaturas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.asignaturas_id_seq OWNER TO postgres;

--
-- TOC entry 3420 (class 0 OID 0)
-- Dependencies: 230
-- Name: asignaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignaturas_id_seq OWNED BY public.asignaturas.id;


--
-- TOC entry 217 (class 1259 OID 24615)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nacimiento date,
    direccion text,
    correo character varying(80),
    telefono character varying(20)[]
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 3421 (class 0 OID 0)
-- Dependencies: 217
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.personas IS 'Tabla personas para el ejemplo de PgAdmin';


--
-- TOC entry 216 (class 1259 OID 24614)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.personas_id_seq OWNER TO postgres;

--
-- TOC entry 3422 (class 0 OID 0)
-- Dependencies: 216
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- TOC entry 223 (class 1259 OID 24735)
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
-- TOC entry 227 (class 1259 OID 24889)
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
-- TOC entry 226 (class 1259 OID 24888)
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
-- TOC entry 3423 (class 0 OID 0)
-- Dependencies: 226
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 222 (class 1259 OID 24734)
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
-- TOC entry 3424 (class 0 OID 0)
-- Dependencies: 222
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 221 (class 1259 OID 24696)
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
-- TOC entry 225 (class 1259 OID 24880)
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
-- TOC entry 224 (class 1259 OID 24879)
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
-- TOC entry 3425 (class 0 OID 0)
-- Dependencies: 224
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 220 (class 1259 OID 24695)
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
-- TOC entry 3426 (class 0 OID 0)
-- Dependencies: 220
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 234 (class 1259 OID 25006)
-- Name: vista_alumnos_asignaturas_periodo; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_alumnos_asignaturas_periodo AS
 SELECT alumnos.nombre AS "NOMBRE",
    alumnos.apellido AS "APELLIDO",
    asignaturas.nombre AS "ASIGNATURA",
    alumnos_asignaturas_inscripcion.periodo AS "PERIODO"
   FROM public.alumnos,
    public.asignaturas,
    public.alumnos_asignaturas_inscripcion
  WHERE ((alumnos_asignaturas_inscripcion.alumnos_id = alumnos.id) AND (alumnos_asignaturas_inscripcion.asignaturas_id = asignaturas.id));


ALTER TABLE public.vista_alumnos_asignaturas_periodo OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24968)
-- Name: vista_proveedores1-productos_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."vista_proveedores1-productos_1" AS
 SELECT proveedores_1.nombre AS "Proveedor",
    productos_1.nombre AS "Producto",
    productos_1.precio AS "Precio",
    productos_1.cantidad AS "Cantidad"
   FROM public.proveedores_1,
    public.productos_1
  WHERE (productos_1.proveedor_id = proveedores_1.id);


ALTER TABLE public."vista_proveedores1-productos_1" OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24661)
-- Name: personas; Type: TABLE; Schema: recursos_humanos; Owner: postgres
--

CREATE TABLE recursos_humanos.personas (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nac date,
    direccion text,
    correo_electronico character varying(80),
    telefono character varying(20)[]
);


ALTER TABLE recursos_humanos.personas OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24660)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: recursos_humanos; Owner: postgres
--

CREATE SEQUENCE recursos_humanos.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE recursos_humanos.personas_id_seq OWNER TO postgres;

--
-- TOC entry 3427 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: recursos_humanos; Owner: postgres
--

ALTER SEQUENCE recursos_humanos.personas_id_seq OWNED BY recursos_humanos.personas.id;


--
-- TOC entry 3228 (class 2604 OID 24899)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- TOC entry 3229 (class 2604 OID 24906)
-- Name: asignaturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN id SET DEFAULT nextval('public.asignaturas_id_seq'::regclass);


--
-- TOC entry 3222 (class 2604 OID 24618)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- TOC entry 3225 (class 2604 OID 24738)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3227 (class 2604 OID 24892)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3224 (class 2604 OID 24699)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3226 (class 2604 OID 24883)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3223 (class 2604 OID 24664)
-- Name: personas id; Type: DEFAULT; Schema: recursos_humanos; Owner: postgres
--

ALTER TABLE ONLY recursos_humanos.personas ALTER COLUMN id SET DEFAULT nextval('recursos_humanos.personas_id_seq'::regclass);


--
-- TOC entry 3408 (class 0 OID 24896)
-- Dependencies: 229
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido) FROM stdin;
1	JOSE	MEDINA
2	RICARDO	SILVA
3	ANDRES	FRANCO
\.


--
-- TOC entry 3411 (class 0 OID 24909)
-- Dependencies: 232
-- Data for Name: alumnos_asignaturas_inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos_asignaturas_inscripcion (alumnos_id, asignaturas_id, periodo) FROM stdin;
1	2	2026
1	3	2026
1	1	2026
2	2	2026
2	3	2026
2	4	2026
3	1	2026
3	4	2026
3	5	2026
\.


--
-- TOC entry 3410 (class 0 OID 24903)
-- Dependencies: 231
-- Data for Name: asignaturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asignaturas (id, nombre) FROM stdin;
1	LOGICA DE PROGRAMACION
2	HTML5 NIVEL 1
4	MYSQL
5	POSTGRESQL
3	HTML5 NIVEL 2
\.


--
-- TOC entry 3396 (class 0 OID 24615)
-- Dependencies: 217
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (id, nombre, apellido, fecha_nacimiento, direccion, correo, telefono) FROM stdin;
1	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
2	LIBIA	COLS	1978-09-28	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
3	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
4	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
5	LIBIA	COLS	1978-09-28	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
6	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
\.


--
-- TOC entry 3402 (class 0 OID 24735)
-- Dependencies: 223
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
-- TOC entry 3406 (class 0 OID 24889)
-- Dependencies: 227
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
14	1	NEVERA	6	500.25
15	1	COCINA	3	300.75
16	2	LAVADORA	2	800.50
17	3	AIRE ACONDICIONADO	4	600.75
18	3	TELEVISOR	7	400.00
19	3	LAPTOP	5	1200.00
20	2	MICROONDAS	8	150.25
21	1	LICUADORA	12	100.00
22	2	PLANCHA	12	75.50
23	3	VENTILADOR	12	50.00
24	1	HORNO A GAS	6	450.00
25	2	CAFETERA	12	250.00
26	3	TOSTADORA	12	80.00
\.


--
-- TOC entry 3400 (class 0 OID 24696)
-- Dependencies: 221
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3404 (class 0 OID 24880)
-- Dependencies: 225
-- Data for Name: proveedores_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores_1 (id, nombre, direccion, telefono, correo) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
4	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
5	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
6	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3398 (class 0 OID 24661)
-- Dependencies: 219
-- Data for Name: personas; Type: TABLE DATA; Schema: recursos_humanos; Owner: postgres
--

COPY recursos_humanos.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
\.


--
-- TOC entry 3428 (class 0 OID 0)
-- Dependencies: 228
-- Name: alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_id_seq', 3, true);


--
-- TOC entry 3429 (class 0 OID 0)
-- Dependencies: 230
-- Name: asignaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignaturas_id_seq', 5, true);


--
-- TOC entry 3430 (class 0 OID 0)
-- Dependencies: 216
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 6, true);


--
-- TOC entry 3431 (class 0 OID 0)
-- Dependencies: 226
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 26, true);


--
-- TOC entry 3432 (class 0 OID 0)
-- Dependencies: 222
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3433 (class 0 OID 0)
-- Dependencies: 224
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 6, true);


--
-- TOC entry 3434 (class 0 OID 0)
-- Dependencies: 220
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3435 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: recursos_humanos; Owner: postgres
--

SELECT pg_catalog.setval('recursos_humanos.personas_id_seq', 1, false);


--
-- TOC entry 3243 (class 2606 OID 24901)
-- Name: alumnos alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- TOC entry 3247 (class 2606 OID 24913)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_pkey PRIMARY KEY (alumnos_id, asignaturas_id, periodo);


--
-- TOC entry 3245 (class 2606 OID 24908)
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3231 (class 2606 OID 24622)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3241 (class 2606 OID 24894)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3237 (class 2606 OID 24740)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3239 (class 2606 OID 24887)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3235 (class 2606 OID 24703)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3233 (class 2606 OID 24668)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: recursos_humanos; Owner: postgres
--

ALTER TABLE ONLY recursos_humanos.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3249 (class 2606 OID 24919)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_alumno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_alumno_id_fkey FOREIGN KEY (alumnos_id) REFERENCES public.alumnos(id) NOT VALID;


--
-- TOC entry 3250 (class 2606 OID 24924)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_asignatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_asignatura_id_fkey FOREIGN KEY (asignaturas_id) REFERENCES public.asignaturas(id) NOT VALID;


--
-- TOC entry 3248 (class 2606 OID 24741)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-09-30 11:30:23

--
-- PostgreSQL database dump complete
--

