--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-10-02 11:33:20

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
-- TOC entry 8 (class 2615 OID 25016)
-- Name: practica01; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA practica01;


ALTER SCHEMA practica01 OWNER TO postgres;

--
-- TOC entry 3524 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA practica01; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA practica01 IS 'Práctica 01, caso Tienda Virtual';


--
-- TOC entry 7 (class 2615 OID 24599)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 3525 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA presupuesto; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA presupuesto IS 'Presupuesto';


--
-- TOC entry 6 (class 2615 OID 24595)
-- Name: rrhh; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rrhh;


ALTER SCHEMA rrhh OWNER TO postgres;

--
-- TOC entry 3526 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA rrhh; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA rrhh IS 'Recursos Humanos';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 250 (class 1259 OID 25862)
-- Name: calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.calificaciones (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.calificaciones OWNER TO postgres;

--
-- TOC entry 249 (class 1259 OID 25861)
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.calificaciones_id_seq OWNER TO postgres;

--
-- TOC entry 3527 (class 0 OID 0)
-- Dependencies: 249
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.calificaciones_id_seq OWNED BY practica01.calificaciones.id;


--
-- TOC entry 237 (class 1259 OID 25803)
-- Name: categorias; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.categorias (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE practica01.categorias OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 25802)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3528 (class 0 OID 0)
-- Dependencies: 236
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.categorias_id_seq OWNED BY practica01.categorias.id;


--
-- TOC entry 239 (class 1259 OID 25812)
-- Name: etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.etiquetas (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.etiquetas OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25811)
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.etiquetas_id_seq OWNER TO postgres;

--
-- TOC entry 3529 (class 0 OID 0)
-- Dependencies: 238
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.etiquetas_id_seq OWNED BY practica01.etiquetas.id;


--
-- TOC entry 243 (class 1259 OID 25830)
-- Name: imagenes; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.imagenes (
    id integer NOT NULL,
    producto_id integer,
    archivo text
);


ALTER TABLE practica01.imagenes OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 25829)
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.imagenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 3530 (class 0 OID 0)
-- Dependencies: 242
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.imagenes_id_seq OWNED BY practica01.imagenes.id;


--
-- TOC entry 248 (class 1259 OID 25853)
-- Name: productos; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos (
    id integer NOT NULL,
    categoria_id integer,
    nombre text,
    cantidad integer,
    precio numeric(13,2),
    descripcion text
);


ALTER TABLE practica01.productos OWNER TO postgres;

--
-- TOC entry 251 (class 1259 OID 25870)
-- Name: productos_calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_calificaciones (
    producto_id integer NOT NULL,
    calificacion_id integer NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE practica01.productos_calificaciones OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 26310)
-- Name: producto_mas_caro; Type: VIEW; Schema: practica01; Owner: postgres
--

CREATE VIEW practica01.producto_mas_caro AS
 SELECT a.nombre AS "Nombre del producto",
    a.descripcion AS "Descripción del producto",
    a.precio AS "Precio del producto",
    b.nombre AS "Nombre de la categoría",
    c.calificacion_id AS "Calificación del producto",
    d.descripcion AS "Descripción de la calificación"
   FROM practica01.productos a,
    practica01.categorias b,
    practica01.productos_calificaciones c,
    practica01.calificaciones d
  WHERE ((a.categoria_id = b.id) AND (c.producto_id = a.id) AND (c.calificacion_id = d.id) AND (a.precio = ( SELECT max(productos.precio) AS max
           FROM practica01.productos)));


ALTER TABLE practica01.producto_mas_caro OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 25875)
-- Name: productos_etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_etiquetas (
    producto_id integer NOT NULL,
    etiqueta_id integer NOT NULL
);


ALTER TABLE practica01.productos_etiquetas OWNER TO postgres;

--
-- TOC entry 247 (class 1259 OID 25852)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3531 (class 0 OID 0)
-- Dependencies: 247
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.productos_id_seq OWNED BY practica01.productos.id;


--
-- TOC entry 241 (class 1259 OID 25821)
-- Name: roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.roles (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.roles OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 25820)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3532 (class 0 OID 0)
-- Dependencies: 240
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.roles_id_seq OWNED BY practica01.roles.id;


--
-- TOC entry 245 (class 1259 OID 25839)
-- Name: usuarios; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.usuarios (
    id integer NOT NULL,
    cedula character varying(10),
    nombre character varying(100),
    apellido character varying(100),
    telefono character varying(20)[],
    correo_electronico text
);


ALTER TABLE practica01.usuarios OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25838)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: practica01; Owner: postgres
--

CREATE SEQUENCE practica01.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica01.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3533 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.usuarios_id_seq OWNED BY practica01.usuarios.id;


--
-- TOC entry 246 (class 1259 OID 25847)
-- Name: usuarios_roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.usuarios_roles (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE practica01.usuarios_roles OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24796)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80)
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24809)
-- Name: alumnos_asignaturas_inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos_asignaturas_inscripcion (
    alumno_id integer NOT NULL,
    asignatura_id integer NOT NULL,
    periodo smallint NOT NULL
);


ALTER TABLE public.alumnos_asignaturas_inscripcion OWNER TO postgres;

--
-- TOC entry 229 (class 1259 OID 24795)
-- Name: alumnos_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.alumnos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.alumnos_id_seq OWNER TO postgres;

--
-- TOC entry 3534 (class 0 OID 0)
-- Dependencies: 229
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 232 (class 1259 OID 24803)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignaturas (
    id integer NOT NULL,
    nombre character varying(80)
);


ALTER TABLE public.asignaturas OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24802)
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
-- TOC entry 3535 (class 0 OID 0)
-- Dependencies: 231
-- Name: asignaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignaturas_id_seq OWNED BY public.asignaturas.id;


--
-- TOC entry 218 (class 1259 OID 24606)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nac date,
    direccion text,
    correo_electronico character varying(80),
    telefono character varying(20)[]
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 3536 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.personas IS 'Tabla personas para el ejemplo de PgAdmin';


--
-- TOC entry 217 (class 1259 OID 24605)
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
-- TOC entry 3537 (class 0 OID 0)
-- Dependencies: 217
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- TOC entry 224 (class 1259 OID 24723)
-- Name: productos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    existencia integer,
    precio numeric(13,2)
);


ALTER TABLE public.productos OWNER TO postgres;

--
-- TOC entry 228 (class 1259 OID 24789)
-- Name: productos_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.productos_1 (
    id integer NOT NULL,
    proveedor_id integer,
    nombre character varying(80),
    existencia integer,
    precio numeric(13,2)
);


ALTER TABLE public.productos_1 OWNER TO postgres;

--
-- TOC entry 227 (class 1259 OID 24788)
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
-- TOC entry 3538 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 223 (class 1259 OID 24722)
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
-- TOC entry 3539 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 222 (class 1259 OID 24705)
-- Name: proveedores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores (
    id integer NOT NULL,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo_electronico character varying(80)
);


ALTER TABLE public.proveedores OWNER TO postgres;

--
-- TOC entry 226 (class 1259 OID 24780)
-- Name: proveedores_1; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.proveedores_1 (
    id integer NOT NULL,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo_electronico character varying(80)
);


ALTER TABLE public.proveedores_1 OWNER TO postgres;

--
-- TOC entry 225 (class 1259 OID 24779)
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
-- TOC entry 3540 (class 0 OID 0)
-- Dependencies: 225
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 221 (class 1259 OID 24704)
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
-- TOC entry 3541 (class 0 OID 0)
-- Dependencies: 221
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 235 (class 1259 OID 25002)
-- Name: vista_alumnos_asignaturas; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public.vista_alumnos_asignaturas AS
 SELECT alumnos.nombre AS "Nombre",
    alumnos.apellido AS "Apellido",
    asignaturas.nombre AS "Asignatura",
    alumnos_asignaturas_inscripcion.periodo AS "Período"
   FROM public.alumnos,
    public.asignaturas,
    public.alumnos_asignaturas_inscripcion
  WHERE ((alumnos_asignaturas_inscripcion.alumno_id = alumnos.id) AND (alumnos_asignaturas_inscripcion.asignatura_id = asignaturas.id));


ALTER TABLE public.vista_alumnos_asignaturas OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24964)
-- Name: vista_proveedores_1-productos_1; Type: VIEW; Schema: public; Owner: postgres
--

CREATE VIEW public."vista_proveedores_1-productos_1" AS
 SELECT proveedores_1.nombre AS "Proveedor",
    productos_1.nombre AS "Producto",
    productos_1.precio AS "Precio",
    productos_1.existencia AS "Existencia"
   FROM public.proveedores_1,
    public.productos_1
  WHERE (productos_1.proveedor_id = proveedores_1.id);


ALTER TABLE public."vista_proveedores_1-productos_1" OWNER TO postgres;

--
-- TOC entry 220 (class 1259 OID 24652)
-- Name: personas; Type: TABLE; Schema: rrhh; Owner: postgres
--

CREATE TABLE rrhh.personas (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nac date,
    direccion text,
    correo_electronico character varying(80),
    telefono character varying(20)[]
);


ALTER TABLE rrhh.personas OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24651)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: rrhh; Owner: postgres
--

CREATE SEQUENCE rrhh.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rrhh.personas_id_seq OWNER TO postgres;

--
-- TOC entry 3542 (class 0 OID 0)
-- Dependencies: 219
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: rrhh; Owner: postgres
--

ALTER SEQUENCE rrhh.personas_id_seq OWNED BY rrhh.personas.id;


--
-- TOC entry 3288 (class 2604 OID 25865)
-- Name: calificaciones id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones ALTER COLUMN id SET DEFAULT nextval('practica01.calificaciones_id_seq'::regclass);


--
-- TOC entry 3282 (class 2604 OID 25806)
-- Name: categorias id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias ALTER COLUMN id SET DEFAULT nextval('practica01.categorias_id_seq'::regclass);


--
-- TOC entry 3283 (class 2604 OID 25815)
-- Name: etiquetas id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas ALTER COLUMN id SET DEFAULT nextval('practica01.etiquetas_id_seq'::regclass);


--
-- TOC entry 3285 (class 2604 OID 25833)
-- Name: imagenes id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes ALTER COLUMN id SET DEFAULT nextval('practica01.imagenes_id_seq'::regclass);


--
-- TOC entry 3287 (class 2604 OID 25856)
-- Name: productos id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos ALTER COLUMN id SET DEFAULT nextval('practica01.productos_id_seq'::regclass);


--
-- TOC entry 3284 (class 2604 OID 25824)
-- Name: roles id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles ALTER COLUMN id SET DEFAULT nextval('practica01.roles_id_seq'::regclass);


--
-- TOC entry 3286 (class 2604 OID 25842)
-- Name: usuarios id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios ALTER COLUMN id SET DEFAULT nextval('practica01.usuarios_id_seq'::regclass);


--
-- TOC entry 3280 (class 2604 OID 24799)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumnos_id_seq'::regclass);


--
-- TOC entry 3281 (class 2604 OID 24806)
-- Name: asignaturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN id SET DEFAULT nextval('public.asignaturas_id_seq'::regclass);


--
-- TOC entry 3274 (class 2604 OID 24609)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- TOC entry 3277 (class 2604 OID 24726)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3279 (class 2604 OID 24792)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3276 (class 2604 OID 24708)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3278 (class 2604 OID 24783)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3275 (class 2604 OID 24655)
-- Name: personas id; Type: DEFAULT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas ALTER COLUMN id SET DEFAULT nextval('rrhh.personas_id_seq'::regclass);


--
-- TOC entry 3516 (class 0 OID 25862)
-- Dependencies: 250
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.calificaciones (id, descripcion) FROM stdin;
1	Excelente
2	Bueno
3	Regular
4	Malo
\.


--
-- TOC entry 3503 (class 0 OID 25803)
-- Dependencies: 237
-- Data for Name: categorias; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.categorias (id, nombre) FROM stdin;
1	Electr¢nica
2	Ropa y Accesorios
3	Hogar y Cocina
\.


--
-- TOC entry 3505 (class 0 OID 25812)
-- Dependencies: 239
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.etiquetas (id, descripcion) FROM stdin;
1	Nuevo
2	Oferta
3	Destacado
4	Env¡o Gratis
\.


--
-- TOC entry 3509 (class 0 OID 25830)
-- Dependencies: 243
-- Data for Name: imagenes; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.imagenes (id, producto_id, archivo) FROM stdin;
1	1	/imagenes/smartphone_x_1.jpg
2	1	/imagenes/smartphone_x_2.jpg
3	2	/imagenes/camisa_casual_1.jpg
4	3	/imagenes/licuadora_pro_1.jpg
\.


--
-- TOC entry 3514 (class 0 OID 25853)
-- Dependencies: 248
-- Data for Name: productos; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos (id, categoria_id, nombre, cantidad, precio, descripcion) FROM stdin;
1	1	Smartphone X	15	450.00	Tel‚fono inteligente de £ltima generaci¢n
2	2	Camisa Casual	30	25.50	Camisa de algod¢n para caballero
3	3	Licuadora Pro	10	89.99	Licuadora de alta potencia con vaso de vidrio
4	1	Smartphone Gama Baja (Agotado)	0	120.00	Modelo básico de teléfono inteligente sin stock actual en almacén.
5	1	Smartwatch Deportivo Pro (Sin Stock)	0	85.50	Reloj inteligente con monitor de ritmo cardíaco, pendiente de reabastecimiento.
6	2	Licuadora de 3 Velocidades	0	45.00	Licuadora de vaso de vidrio de 1.5 litros, agotada temporalmente.
7	3	Audífonos Inalámbricos Bluetooth	0	25.00	Audífonos supraaurales con cancelación de ruido pasiva, sin existencias.
\.


--
-- TOC entry 3517 (class 0 OID 25870)
-- Dependencies: 251
-- Data for Name: productos_calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_calificaciones (producto_id, calificacion_id, usuario_id) FROM stdin;
1	1	2
2	2	2
3	1	3
\.


--
-- TOC entry 3518 (class 0 OID 25875)
-- Dependencies: 252
-- Data for Name: productos_etiquetas; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_etiquetas (producto_id, etiqueta_id) FROM stdin;
1	1
1	3
2	2
3	4
\.


--
-- TOC entry 3507 (class 0 OID 25821)
-- Dependencies: 241
-- Data for Name: roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.roles (id, descripcion) FROM stdin;
1	Administrador
2	Cliente
3	Vendedor
\.


--
-- TOC entry 3511 (class 0 OID 25839)
-- Dependencies: 245
-- Data for Name: usuarios; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios (id, cedula, nombre, apellido, telefono, correo_electronico) FROM stdin;
1	V12345678	Carlos	P‚rez	{04121234567,02125551234}	carlos.perez@email.com
2	V87654321	Ana	G¢mez	{04149876543}	ana.gomez@email.com
3	V11223344	Luis	Rodr¡guez	{04241112233,04162223344}	luis.rodriguez@email.com
\.


--
-- TOC entry 3512 (class 0 OID 25847)
-- Dependencies: 246
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios_roles (usuario_id, rol_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3498 (class 0 OID 24796)
-- Dependencies: 230
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido) FROM stdin;
1	JOSE	MEDINA
2	RICARDO	SILVA
3	ANDRES	FRANCO
\.


--
-- TOC entry 3501 (class 0 OID 24809)
-- Dependencies: 233
-- Data for Name: alumnos_asignaturas_inscripcion; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos_asignaturas_inscripcion (alumno_id, asignatura_id, periodo) FROM stdin;
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
-- TOC entry 3500 (class 0 OID 24803)
-- Dependencies: 232
-- Data for Name: asignaturas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.asignaturas (id, nombre) FROM stdin;
1	LÓGICA DE PROGRAMACIÓN
2	HTML5 NIVEL 1
3	HTML5 NIVEL 2
4	MYSQL
5	POSTGRESQL
\.


--
-- TOC entry 3486 (class 0 OID 24606)
-- Dependencies: 218
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
1	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
2	LIBIA	COLS	1970-09-20	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
3	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
4	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
5	LIBIA	COLS	1970-09-20	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
6	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
\.


--
-- TOC entry 3492 (class 0 OID 24723)
-- Dependencies: 224
-- Data for Name: productos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos (id, proveedor_id, nombre, existencia, precio) FROM stdin;
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
-- TOC entry 3496 (class 0 OID 24789)
-- Dependencies: 228
-- Data for Name: productos_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.productos_1 (id, proveedor_id, nombre, existencia, precio) FROM stdin;
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
-- TOC entry 3490 (class 0 OID 24705)
-- Dependencies: 222
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3494 (class 0 OID 24780)
-- Dependencies: 226
-- Data for Name: proveedores_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores_1 (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3488 (class 0 OID 24652)
-- Dependencies: 220
-- Data for Name: personas; Type: TABLE DATA; Schema: rrhh; Owner: postgres
--

COPY rrhh.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
\.


--
-- TOC entry 3543 (class 0 OID 0)
-- Dependencies: 249
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.calificaciones_id_seq', 4, true);


--
-- TOC entry 3544 (class 0 OID 0)
-- Dependencies: 236
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.categorias_id_seq', 3, true);


--
-- TOC entry 3545 (class 0 OID 0)
-- Dependencies: 238
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.etiquetas_id_seq', 4, true);


--
-- TOC entry 3546 (class 0 OID 0)
-- Dependencies: 242
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.imagenes_id_seq', 4, true);


--
-- TOC entry 3547 (class 0 OID 0)
-- Dependencies: 247
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.productos_id_seq', 7, true);


--
-- TOC entry 3548 (class 0 OID 0)
-- Dependencies: 240
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.roles_id_seq', 3, true);


--
-- TOC entry 3549 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.usuarios_id_seq', 3, true);


--
-- TOC entry 3550 (class 0 OID 0)
-- Dependencies: 229
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_id_seq', 3, true);


--
-- TOC entry 3551 (class 0 OID 0)
-- Dependencies: 231
-- Name: asignaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignaturas_id_seq', 5, true);


--
-- TOC entry 3552 (class 0 OID 0)
-- Dependencies: 217
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 6, true);


--
-- TOC entry 3553 (class 0 OID 0)
-- Dependencies: 227
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 13, true);


--
-- TOC entry 3554 (class 0 OID 0)
-- Dependencies: 223
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3555 (class 0 OID 0)
-- Dependencies: 225
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 3, true);


--
-- TOC entry 3556 (class 0 OID 0)
-- Dependencies: 221
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3557 (class 0 OID 0)
-- Dependencies: 219
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: rrhh; Owner: postgres
--

SELECT pg_catalog.setval('rrhh.personas_id_seq', 1, false);


--
-- TOC entry 3322 (class 2606 OID 25869)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3308 (class 2606 OID 25810)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3310 (class 2606 OID 25819)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3314 (class 2606 OID 25837)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 3324 (class 2606 OID 25874)
-- Name: productos_calificaciones productos_calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_pkey PRIMARY KEY (producto_id, calificacion_id, usuario_id);


--
-- TOC entry 3326 (class 2606 OID 25879)
-- Name: productos_etiquetas productos_etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_pkey PRIMARY KEY (producto_id, etiqueta_id);


--
-- TOC entry 3320 (class 2606 OID 25860)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3312 (class 2606 OID 25828)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3316 (class 2606 OID 25846)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3318 (class 2606 OID 25851)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 3306 (class 2606 OID 24813)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_pkey PRIMARY KEY (alumno_id, asignatura_id, periodo);


--
-- TOC entry 3302 (class 2606 OID 24801)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- TOC entry 3304 (class 2606 OID 24808)
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3290 (class 2606 OID 24613)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3300 (class 2606 OID 24794)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3296 (class 2606 OID 24728)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3298 (class 2606 OID 24787)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3294 (class 2606 OID 24712)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3292 (class 2606 OID 24659)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3331 (class 2606 OID 25880)
-- Name: imagenes imagenes_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3335 (class 2606 OID 25905)
-- Name: productos_calificaciones productos_calificaciones_calificacion_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_calificacion_id_fkey FOREIGN KEY (calificacion_id) REFERENCES practica01.calificaciones(id) NOT VALID;


--
-- TOC entry 3336 (class 2606 OID 25900)
-- Name: productos_calificaciones productos_calificaciones_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3337 (class 2606 OID 25910)
-- Name: productos_calificaciones productos_calificaciones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3334 (class 2606 OID 25895)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES practica01.categorias(id) NOT VALID;


--
-- TOC entry 3338 (class 2606 OID 25920)
-- Name: productos_etiquetas productos_etiquetas_etiqueta_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_etiqueta_id_fkey FOREIGN KEY (etiqueta_id) REFERENCES practica01.etiquetas(id) NOT VALID;


--
-- TOC entry 3339 (class 2606 OID 25915)
-- Name: productos_etiquetas productos_etiquetas_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3332 (class 2606 OID 25890)
-- Name: usuarios_roles usuarios_roles_rol_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES practica01.roles(id) NOT VALID;


--
-- TOC entry 3333 (class 2606 OID 25885)
-- Name: usuarios_roles usuarios_roles_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3329 (class 2606 OID 24819)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_alumno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_alumno_id_fkey FOREIGN KEY (alumno_id) REFERENCES public.alumnos(id) NOT VALID;


--
-- TOC entry 3330 (class 2606 OID 24824)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_asignatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_asignatura_id_fkey FOREIGN KEY (asignatura_id) REFERENCES public.asignaturas(id) NOT VALID;


--
-- TOC entry 3328 (class 2606 OID 24814)
-- Name: productos_1 productos_1_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores_1(id) NOT VALID;


--
-- TOC entry 3327 (class 2606 OID 24729)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-02 11:33:21

--
-- PostgreSQL database dump complete
--

