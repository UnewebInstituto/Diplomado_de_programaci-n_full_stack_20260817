--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-10-07 10:26:12

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
-- TOC entry 8 (class 2615 OID 26140)
-- Name: practica01; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA practica01;


ALTER SCHEMA practica01 OWNER TO postgres;

--
-- TOC entry 3580 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA practica01; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA practica01 IS 'Práctica 01, caso Tienda Virtual';


--
-- TOC entry 9 (class 2615 OID 33172)
-- Name: practica02; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA practica02;


ALTER SCHEMA practica02 OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 24598)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 3581 (class 0 OID 0)
-- Dependencies: 7
-- Name: SCHEMA presupuesto; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA presupuesto IS 'Presupuesto';


--
-- TOC entry 6 (class 2615 OID 24596)
-- Name: rrhh; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA rrhh;


ALTER SCHEMA rrhh OWNER TO postgres;

--
-- TOC entry 3582 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA rrhh; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA rrhh IS 'Recursos Humanos';


--
-- TOC entry 953 (class 1247 OID 33174)
-- Name: estatus_nombre; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.estatus_nombre AS ENUM (
    'disponible',
    'en_reparación',
    'ocupado'
);


ALTER TYPE practica02.estatus_nombre OWNER TO postgres;

--
-- TOC entry 956 (class 1247 OID 33182)
-- Name: persona_tipos; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.persona_tipos AS ENUM (
    'profesor',
    'empleado_administrativo'
);


ALTER TYPE practica02.persona_tipos OWNER TO postgres;

--
-- TOC entry 959 (class 1247 OID 33188)
-- Name: reserva_estatus; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.reserva_estatus AS ENUM (
    'abierta',
    'cerrada',
    'cancelada'
);


ALTER TYPE practica02.reserva_estatus OWNER TO postgres;

--
-- TOC entry 950 (class 1247 OID 32818)
-- Name: cargo_empleado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cargo_empleado AS ENUM (
    'OPERADOR(A)',
    'SUPERVISOR(A)',
    'COORDINADOR(A)',
    'ASISTENTE',
    'GERENTE'
);


ALTER TYPE public.cargo_empleado OWNER TO postgres;

--
-- TOC entry 941 (class 1247 OID 26345)
-- Name: contacto; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contacto AS (
	nombre character varying(40),
	apellido character varying(40),
	telefono character varying(15)[],
	correo_electronico character varying(60)
);


ALTER TYPE public.contacto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 235 (class 1259 OID 26141)
-- Name: calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.calificaciones (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.calificaciones OWNER TO postgres;

--
-- TOC entry 236 (class 1259 OID 26146)
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
-- TOC entry 3583 (class 0 OID 0)
-- Dependencies: 236
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.calificaciones_id_seq OWNED BY practica01.calificaciones.id;


--
-- TOC entry 237 (class 1259 OID 26147)
-- Name: categorias; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.categorias (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE practica01.categorias OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 26152)
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
-- TOC entry 3584 (class 0 OID 0)
-- Dependencies: 238
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.categorias_id_seq OWNED BY practica01.categorias.id;


--
-- TOC entry 239 (class 1259 OID 26153)
-- Name: etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.etiquetas (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.etiquetas OWNER TO postgres;

--
-- TOC entry 240 (class 1259 OID 26158)
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
-- TOC entry 3585 (class 0 OID 0)
-- Dependencies: 240
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.etiquetas_id_seq OWNED BY practica01.etiquetas.id;


--
-- TOC entry 241 (class 1259 OID 26159)
-- Name: imagenes; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.imagenes (
    id integer NOT NULL,
    producto_id integer,
    archivo text
);


ALTER TABLE practica01.imagenes OWNER TO postgres;

--
-- TOC entry 242 (class 1259 OID 26164)
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
-- TOC entry 3586 (class 0 OID 0)
-- Dependencies: 242
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.imagenes_id_seq OWNED BY practica01.imagenes.id;


--
-- TOC entry 243 (class 1259 OID 26165)
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
-- TOC entry 244 (class 1259 OID 26170)
-- Name: productos_calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_calificaciones (
    producto_id integer NOT NULL,
    calificacion_id integer NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE practica01.productos_calificaciones OWNER TO postgres;

--
-- TOC entry 245 (class 1259 OID 26173)
-- Name: productos_etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_etiquetas (
    producto_id integer NOT NULL,
    etiqueta_id integer NOT NULL
);


ALTER TABLE practica01.productos_etiquetas OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 26176)
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
-- TOC entry 3587 (class 0 OID 0)
-- Dependencies: 246
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.productos_id_seq OWNED BY practica01.productos.id;


--
-- TOC entry 247 (class 1259 OID 26177)
-- Name: roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.roles (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.roles OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 26182)
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
-- TOC entry 3588 (class 0 OID 0)
-- Dependencies: 248
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.roles_id_seq OWNED BY practica01.roles.id;


--
-- TOC entry 249 (class 1259 OID 26183)
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
-- TOC entry 250 (class 1259 OID 26188)
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
-- TOC entry 3589 (class 0 OID 0)
-- Dependencies: 250
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.usuarios_id_seq OWNED BY practica01.usuarios.id;


--
-- TOC entry 251 (class 1259 OID 26189)
-- Name: usuarios_roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.usuarios_roles (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE practica01.usuarios_roles OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 33195)
-- Name: espacios; Type: TABLE; Schema: practica02; Owner: postgres
--

CREATE TABLE practica02.espacios (
    id integer NOT NULL,
    ubicacion text,
    estatus practica02.estatus_nombre
);


ALTER TABLE practica02.espacios OWNER TO postgres;

--
-- TOC entry 257 (class 1259 OID 33200)
-- Name: espacios_id_seq; Type: SEQUENCE; Schema: practica02; Owner: postgres
--

CREATE SEQUENCE practica02.espacios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica02.espacios_id_seq OWNER TO postgres;

--
-- TOC entry 3590 (class 0 OID 0)
-- Dependencies: 257
-- Name: espacios_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.espacios_id_seq OWNED BY practica02.espacios.id;


--
-- TOC entry 258 (class 1259 OID 33201)
-- Name: personas; Type: TABLE; Schema: practica02; Owner: postgres
--

CREATE TABLE practica02.personas (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80),
    tipo practica02.persona_tipos
);


ALTER TABLE practica02.personas OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 33204)
-- Name: personas_id_seq; Type: SEQUENCE; Schema: practica02; Owner: postgres
--

CREATE SEQUENCE practica02.personas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica02.personas_id_seq OWNER TO postgres;

--
-- TOC entry 3591 (class 0 OID 0)
-- Dependencies: 259
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.personas_id_seq OWNED BY practica02.personas.id;


--
-- TOC entry 260 (class 1259 OID 33205)
-- Name: reservas; Type: TABLE; Schema: practica02; Owner: postgres
--

CREATE TABLE practica02.reservas (
    id integer NOT NULL,
    espacio_id integer,
    persona_id integer,
    evento text,
    inicio_fecha_hora timestamp without time zone DEFAULT now(),
    fin_fecha_hora timestamp without time zone DEFAULT now(),
    estatus practica02.reserva_estatus,
    tiempo_reserva interval GENERATED ALWAYS AS ((fin_fecha_hora - inicio_fecha_hora)) STORED
);


ALTER TABLE practica02.reservas OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 33212)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: practica02; Owner: postgres
--

CREATE SEQUENCE practica02.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE practica02.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 3592 (class 0 OID 0)
-- Dependencies: 261
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.reservas_id_seq OWNED BY practica02.reservas.id;


--
-- TOC entry 230 (class 1259 OID 24950)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80)
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24992)
-- Name: alumnos_asignaturas_inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos_asignaturas_inscripcion (
    alumno_id integer NOT NULL,
    asignatura_id integer NOT NULL,
    periodo smallint NOT NULL
);


ALTER TABLE public.alumnos_asignaturas_inscripcion OWNER TO postgres;

--
-- TOC entry 231 (class 1259 OID 24953)
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
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 231
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 232 (class 1259 OID 24957)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignaturas (
    id integer NOT NULL,
    nombre character varying(80)
);


ALTER TABLE public.asignaturas OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24960)
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
-- TOC entry 3594 (class 0 OID 0)
-- Dependencies: 233
-- Name: asignaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignaturas_id_seq OWNED BY public.asignaturas.id;


--
-- TOC entry 255 (class 1259 OID 26418)
-- Name: emergencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergencias (
    trabajador_id integer NOT NULL,
    persona public.contacto,
    direccion text,
    alergias text,
    notas text
);


ALTER TABLE public.emergencias OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 24602)
-- Name: personas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.personas (
    " id" integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_nac date,
    direccion text,
    correo_electronico character varying(80),
    telefono character varying(20)[]
);


ALTER TABLE public.personas OWNER TO postgres;

--
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 218
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.personas IS 'Tabla Personas para el Ejemplo de PgAdmin';


--
-- TOC entry 219 (class 1259 OID 24623)
-- Name: persona_ id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public."persona_ id_seq"
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."persona_ id_seq" OWNER TO postgres;

--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 219
-- Name: persona_ id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public."persona_ id_seq" OWNED BY public.personas." id";


--
-- TOC entry 224 (class 1259 OID 24767)
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
-- TOC entry 228 (class 1259 OID 24938)
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
-- TOC entry 229 (class 1259 OID 24941)
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
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 225 (class 1259 OID 24770)
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
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 222 (class 1259 OID 24758)
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
-- TOC entry 226 (class 1259 OID 24929)
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
-- TOC entry 227 (class 1259 OID 24934)
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
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 227
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 223 (class 1259 OID 24763)
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
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 223
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 254 (class 1259 OID 26347)
-- Name: trabajadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajadores (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_ingreso date,
    cargo public.cargo_empleado,
    bonificacion numeric(3,2),
    salario numeric(10,2),
    pago_bono numeric(12,2) GENERATED ALWAYS AS ((salario * bonificacion)) STORED,
    CONSTRAINT chk_bonificacion_rango CHECK (((bonificacion >= 0.1) AND (bonificacion <= 0.3)))
);


ALTER TABLE public.trabajadores OWNER TO postgres;

--
-- TOC entry 253 (class 1259 OID 26346)
-- Name: trabajadores_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.trabajadores_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.trabajadores_id_seq OWNER TO postgres;

--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 253
-- Name: trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajadores_id_seq OWNED BY public.trabajadores.id;


--
-- TOC entry 221 (class 1259 OID 24679)
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
-- TOC entry 220 (class 1259 OID 24678)
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
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: rrhh; Owner: postgres
--

ALTER SEQUENCE rrhh.personas_id_seq OWNED BY rrhh.personas.id;


--
-- TOC entry 3311 (class 2604 OID 26192)
-- Name: calificaciones id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones ALTER COLUMN id SET DEFAULT nextval('practica01.calificaciones_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 26193)
-- Name: categorias id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias ALTER COLUMN id SET DEFAULT nextval('practica01.categorias_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 26194)
-- Name: etiquetas id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas ALTER COLUMN id SET DEFAULT nextval('practica01.etiquetas_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 26195)
-- Name: imagenes id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes ALTER COLUMN id SET DEFAULT nextval('practica01.imagenes_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 26196)
-- Name: productos id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos ALTER COLUMN id SET DEFAULT nextval('practica01.productos_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 26197)
-- Name: roles id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles ALTER COLUMN id SET DEFAULT nextval('practica01.roles_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 26198)
-- Name: usuarios id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios ALTER COLUMN id SET DEFAULT nextval('practica01.usuarios_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 33213)
-- Name: espacios id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.espacios ALTER COLUMN id SET DEFAULT nextval('practica02.espacios_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 33214)
-- Name: personas id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.personas ALTER COLUMN id SET DEFAULT nextval('practica02.personas_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 33215)
-- Name: reservas id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas ALTER COLUMN id SET DEFAULT nextval('practica02.reservas_id_seq'::regclass);


--
-- TOC entry 3309 (class 2604 OID 24954)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumnos_id_seq'::regclass);


--
-- TOC entry 3310 (class 2604 OID 24961)
-- Name: asignaturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN id SET DEFAULT nextval('public.asignaturas_id_seq'::regclass);


--
-- TOC entry 3303 (class 2604 OID 24624)
-- Name: personas  id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN " id" SET DEFAULT nextval('public."persona_ id_seq"'::regclass);


--
-- TOC entry 3306 (class 2604 OID 24771)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3308 (class 2604 OID 24942)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3305 (class 2604 OID 24764)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3307 (class 2604 OID 24935)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 26350)
-- Name: trabajadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores ALTER COLUMN id SET DEFAULT nextval('public.trabajadores_id_seq'::regclass);


--
-- TOC entry 3304 (class 2604 OID 24682)
-- Name: personas id; Type: DEFAULT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas ALTER COLUMN id SET DEFAULT nextval('rrhh.personas_id_seq'::regclass);


--
-- TOC entry 3549 (class 0 OID 26141)
-- Dependencies: 235
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.calificaciones (id, descripcion) FROM stdin;
1	Excelente
2	Bueno
3	Regular
4	Malo
\.


--
-- TOC entry 3551 (class 0 OID 26147)
-- Dependencies: 237
-- Data for Name: categorias; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.categorias (id, nombre) FROM stdin;
1	Electr¢nica
2	Ropa y Accesorios
3	Hogar y Cocina
\.


--
-- TOC entry 3553 (class 0 OID 26153)
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
-- TOC entry 3555 (class 0 OID 26159)
-- Dependencies: 241
-- Data for Name: imagenes; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.imagenes (id, producto_id, archivo) FROM stdin;
1	1	/imagenes/smartphone_x_1.jpg
2	1	/imagenes/smartphone_x_2.jpg
3	2	/imagenes/camisa_casual_1.jpg
4	3	/imagenes/licuadora_pro_1.jpg
\.


--
-- TOC entry 3557 (class 0 OID 26165)
-- Dependencies: 243
-- Data for Name: productos; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos (id, categoria_id, nombre, cantidad, precio, descripcion) FROM stdin;
1	1	Smartphone X	15	450.00	Tel‚fono inteligente de £ltima generaci¢n
2	2	Camisa Casual	30	25.50	Camisa de algod¢n para caballero
3	3	Licuadora Pro	10	89.99	Licuadora de alta potencia con vaso de vidrio
\.


--
-- TOC entry 3558 (class 0 OID 26170)
-- Dependencies: 244
-- Data for Name: productos_calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_calificaciones (producto_id, calificacion_id, usuario_id) FROM stdin;
1	1	2
2	2	2
3	1	3
\.


--
-- TOC entry 3559 (class 0 OID 26173)
-- Dependencies: 245
-- Data for Name: productos_etiquetas; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_etiquetas (producto_id, etiqueta_id) FROM stdin;
1	1
1	3
2	2
3	4
\.


--
-- TOC entry 3561 (class 0 OID 26177)
-- Dependencies: 247
-- Data for Name: roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.roles (id, descripcion) FROM stdin;
1	Administrador
2	Cliente
3	Vendedor
\.


--
-- TOC entry 3563 (class 0 OID 26183)
-- Dependencies: 249
-- Data for Name: usuarios; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios (id, cedula, nombre, apellido, telefono, correo_electronico) FROM stdin;
1	V12345678	Carlos	P‚rez	{04121234567,02125551234}	carlos.perez@email.com
2	V87654321	Ana	G¢mez	{04149876543}	ana.gomez@email.com
3	V11223344	Luis	Rodr¡guez	{04241112233,04162223344}	luis.rodriguez@email.com
\.


--
-- TOC entry 3565 (class 0 OID 26189)
-- Dependencies: 251
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios_roles (usuario_id, rol_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3569 (class 0 OID 33195)
-- Dependencies: 256
-- Data for Name: espacios; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.espacios (id, ubicacion, estatus) FROM stdin;
1	Sala de Conferencias A - Torre Este	disponible
2	Auditorio Principal - Planta Baja	en_reparación
3	Laboratorio de Computación 1	ocupado
4	Cancha de usos múltiples	disponible
5	Sala de Conferencias A - Torre Este	disponible
6	Auditorio Principal - Planta Baja	en_reparación
7	Laboratorio de Computación 1	ocupado
8	Cancha de usos múltiples	disponible
\.


--
-- TOC entry 3571 (class 0 OID 33201)
-- Dependencies: 258
-- Data for Name: personas; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.personas (id, nombre, apellido, tipo) FROM stdin;
1	Carlos	Pérez	empleado_administrativo
2	María	Gómez	profesor
3	Ana	Rodríguez	profesor
4	Carlos	Pérez	empleado_administrativo
5	María	Gómez	profesor
6	Ana	Rodríguez	profesor
7	Carlos	P‚rez	empleado_administrativo
8	Mar¡a	G¢mez	profesor
9	Ana	Rodr¡guez	profesor
\.


--
-- TOC entry 3573 (class 0 OID 33205)
-- Dependencies: 260
-- Data for Name: reservas; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.reservas (id, espacio_id, persona_id, evento, inicio_fecha_hora, fin_fecha_hora, estatus) FROM stdin;
4	4	3	Juego semifinal torneo futbol interuniversidades	2026-10-13 09:00:00	2026-10-13 12:30:00	abierta
5	2	2	Defensa de Trabajo de Grado	2026-10-13 14:00:00	2026-10-13 16:00:00	abierta
6	1	3	Inducci¢n de nuevos estudiantes	2026-10-14 10:00:00	2026-10-14 12:00:00	abierta
\.


--
-- TOC entry 3544 (class 0 OID 24950)
-- Dependencies: 230
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido) FROM stdin;
1	JOSE	MEDINA
2	RICARDO	SILVA
3	ANDRES	FRANCO
\.


--
-- TOC entry 3548 (class 0 OID 24992)
-- Dependencies: 234
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
-- TOC entry 3546 (class 0 OID 24957)
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
-- TOC entry 3568 (class 0 OID 26418)
-- Dependencies: 255
-- Data for Name: emergencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencias (trabajador_id, persona, direccion, alergias, notas) FROM stdin;
1	(MARIA,PEREZ,"{2129871234,4145678901}","{mperez@trabajo.com,mperez@personal.com}")	CHACAITO	PENICILINA	DIABETES TIPO 2
\.


--
-- TOC entry 3532 (class 0 OID 24602)
-- Dependencies: 218
-- Data for Name: personas; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.personas (" id", nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
1	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
2	LIBIA	COLS	1970-09-20	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
3	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
4	YOLANDA	TORTOZA	1968-08-15	CATIA LA MAR	YT@GMAIL.COM	{4149871234}
5	LIBIA	COLS	1970-09-20	GUARENAS	LC@GMAIL.COM	{4145551234,2129871234}
6	MAIBA	ROMERO	1975-07-16	EL SILENCIO	MR@GMAIL.COM	{4128881234,2123456789,2129876534}
\.


--
-- TOC entry 3538 (class 0 OID 24767)
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
-- TOC entry 3542 (class 0 OID 24938)
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
-- TOC entry 3536 (class 0 OID 24758)
-- Dependencies: 222
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3540 (class 0 OID 24929)
-- Dependencies: 226
-- Data for Name: proveedores_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores_1 (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3567 (class 0 OID 26347)
-- Dependencies: 254
-- Data for Name: trabajadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajadores (id, nombre, apellido, fecha_ingreso, cargo, bonificacion, salario) FROM stdin;
1	NELLY	CONTRERAS	2000-04-15	\N	0.12	\N
2	YOLANDA	TORTOZA	2001-05-30	COORDINADOR(A)	0.12	\N
4	ANA	VASQUEZ	2025-12-15	GERENTE	0.20	\N
5	SUSANA	GUERRERO	2025-06-15	OPERADOR(A)	0.15	400.00
\.


--
-- TOC entry 3535 (class 0 OID 24679)
-- Dependencies: 221
-- Data for Name: personas; Type: TABLE DATA; Schema: rrhh; Owner: postgres
--

COPY rrhh.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
\.


--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 236
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.calificaciones_id_seq', 4, true);


--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 238
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.categorias_id_seq', 3, true);


--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 240
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.etiquetas_id_seq', 4, true);


--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 242
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.imagenes_id_seq', 4, true);


--
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 246
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.productos_id_seq', 3, true);


--
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 248
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.roles_id_seq', 3, true);


--
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 250
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.usuarios_id_seq', 3, true);


--
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 257
-- Name: espacios_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.espacios_id_seq', 8, true);


--
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 259
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.personas_id_seq', 9, true);


--
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 261
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.reservas_id_seq', 6, true);


--
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 231
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_id_seq', 3, true);


--
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 233
-- Name: asignaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignaturas_id_seq', 5, true);


--
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 219
-- Name: persona_ id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public."persona_ id_seq"', 6, true);


--
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 229
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 13, true);


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 225
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 227
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 3, true);


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 223
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 253
-- Name: trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajadores_id_seq', 5, true);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: rrhh; Owner: postgres
--

SELECT pg_catalog.setval('rrhh.personas_id_seq', 1, false);


--
-- TOC entry 3346 (class 2606 OID 26200)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 26202)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 26204)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3352 (class 2606 OID 26206)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 26208)
-- Name: productos_calificaciones productos_calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_pkey PRIMARY KEY (producto_id, calificacion_id, usuario_id);


--
-- TOC entry 3358 (class 2606 OID 26210)
-- Name: productos_etiquetas productos_etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_pkey PRIMARY KEY (producto_id, etiqueta_id);


--
-- TOC entry 3354 (class 2606 OID 26212)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 26214)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 26216)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 26218)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 3370 (class 2606 OID 33217)
-- Name: espacios espacios_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.espacios
    ADD CONSTRAINT espacios_pkey PRIMARY KEY (id);


--
-- TOC entry 3372 (class 2606 OID 33219)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 33221)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 24996)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_pkey PRIMARY KEY (alumno_id, asignatura_id, periodo);


--
-- TOC entry 3340 (class 2606 OID 24956)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 24963)
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 26424)
-- Name: emergencias emergencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_pkey PRIMARY KEY (trabajador_id);


--
-- TOC entry 3328 (class 2606 OID 24631)
-- Name: personas persona_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT persona_pkey PRIMARY KEY (" id");


--
-- TOC entry 3338 (class 2606 OID 24944)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3334 (class 2606 OID 24773)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3336 (class 2606 OID 24937)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3332 (class 2606 OID 24766)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 26354)
-- Name: trabajadores trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores
    ADD CONSTRAINT trabajadores_pkey PRIMARY KEY (id);


--
-- TOC entry 3330 (class 2606 OID 24686)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 26219)
-- Name: imagenes imagenes_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3380 (class 2606 OID 26224)
-- Name: productos_calificaciones productos_calificaciones_calificacion_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_calificacion_id_fkey FOREIGN KEY (calificacion_id) REFERENCES practica01.calificaciones(id) NOT VALID;


--
-- TOC entry 3381 (class 2606 OID 26229)
-- Name: productos_calificaciones productos_calificaciones_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3382 (class 2606 OID 26234)
-- Name: productos_calificaciones productos_calificaciones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3379 (class 2606 OID 26239)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES practica01.categorias(id) NOT VALID;


--
-- TOC entry 3383 (class 2606 OID 26244)
-- Name: productos_etiquetas productos_etiquetas_etiqueta_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_etiqueta_id_fkey FOREIGN KEY (etiqueta_id) REFERENCES practica01.etiquetas(id) NOT VALID;


--
-- TOC entry 3384 (class 2606 OID 26249)
-- Name: productos_etiquetas productos_etiquetas_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3385 (class 2606 OID 26254)
-- Name: usuarios_roles usuarios_roles_rol_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES practica01.roles(id) NOT VALID;


--
-- TOC entry 3386 (class 2606 OID 26259)
-- Name: usuarios_roles usuarios_roles_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3388 (class 2606 OID 33222)
-- Name: reservas reservas_espacio_id_fkey; Type: FK CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_espacio_id_fkey FOREIGN KEY (espacio_id) REFERENCES practica02.espacios(id) NOT VALID;


--
-- TOC entry 3389 (class 2606 OID 33227)
-- Name: reservas reservas_persona_id_fkey; Type: FK CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES practica02.personas(id) NOT VALID;


--
-- TOC entry 3387 (class 2606 OID 26425)
-- Name: emergencias emergencias_trabajador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_trabajador_id_fkey FOREIGN KEY (trabajador_id) REFERENCES public.trabajadores(id);


--
-- TOC entry 3376 (class 2606 OID 24945)
-- Name: productos_1 productos_1_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores_1(id) NOT VALID;


--
-- TOC entry 3377 (class 2606 OID 24997)
-- Name: productos_1 productos_1_proveedor_id_fkey1; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_proveedor_id_fkey1 FOREIGN KEY (proveedor_id) REFERENCES public.proveedores_1(id) NOT VALID;


--
-- TOC entry 3375 (class 2606 OID 24774)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-07 10:26:12

--
-- PostgreSQL database dump complete
--

