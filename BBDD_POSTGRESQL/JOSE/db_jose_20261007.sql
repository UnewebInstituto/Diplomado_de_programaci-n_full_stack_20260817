--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-10-07 10:07:49

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
-- TOC entry 8 (class 2615 OID 25015)
-- Name: a_practica01; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA a_practica01;


ALTER SCHEMA a_practica01 OWNER TO postgres;

--
-- TOC entry 3593 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA a_practica01; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA a_practica01 IS 'Practica 01 para Tienda Virtual';


--
-- TOC entry 9 (class 2615 OID 32857)
-- Name: a_practica02; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA a_practica02;


ALTER SCHEMA a_practica02 OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 24601)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 3594 (class 0 OID 0)
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
-- TOC entry 3595 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA recursos_humanos; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA recursos_humanos IS 'Recursos Humanos';


--
-- TOC entry 962 (class 1247 OID 32880)
-- Name: nombre_estatus; Type: TYPE; Schema: a_practica02; Owner: postgres
--

CREATE TYPE a_practica02.nombre_estatus AS ENUM (
    'DISPONIBLE',
    'REPARACION',
    'OCUPADO'
);


ALTER TYPE a_practica02.nombre_estatus OWNER TO postgres;

--
-- TOC entry 965 (class 1247 OID 32910)
-- Name: personas_tipo; Type: TYPE; Schema: a_practica02; Owner: postgres
--

CREATE TYPE a_practica02.personas_tipo AS ENUM (
    'PROFESOR',
    'EMPLEADO_ADMIN'
);


ALTER TYPE a_practica02.personas_tipo OWNER TO postgres;

--
-- TOC entry 968 (class 1247 OID 32980)
-- Name: reserva_estatus; Type: TYPE; Schema: a_practica02; Owner: postgres
--

CREATE TYPE a_practica02.reserva_estatus AS ENUM (
    'ABIERTA',
    'CERRADA',
    'CANCELADA'
);


ALTER TYPE a_practica02.reserva_estatus OWNER TO postgres;

--
-- TOC entry 959 (class 1247 OID 32783)
-- Name: cargo_empleado; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.cargo_empleado AS ENUM (
    'OPERADOR',
    'SUPERVISOR',
    'COORDINADOR',
    'ASISTENTE',
    'GERENTE'
);


ALTER TYPE public.cargo_empleado OWNER TO postgres;

--
-- TOC entry 950 (class 1247 OID 26339)
-- Name: contacto; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contacto AS (
	nombre character varying(40),
	apellido character varying(40),
	telefono character varying(15)[],
	correo character varying(60)[]
);


ALTER TYPE public.contacto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 253 (class 1259 OID 25744)
-- Name: calificaciones; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.calificaciones (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE a_practica01.calificaciones OWNER TO postgres;

--
-- TOC entry 252 (class 1259 OID 25743)
-- Name: calificaciones_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.calificaciones_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.calificaciones_id_seq OWNER TO postgres;

--
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 252
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.calificaciones_id_seq OWNED BY a_practica01.calificaciones.id;


--
-- TOC entry 254 (class 1259 OID 25752)
-- Name: calificaciones_productos_usuarios; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.calificaciones_productos_usuarios (
    productos_id integer NOT NULL,
    calificaciones_id integer NOT NULL,
    usuarios_id integer NOT NULL
);


ALTER TABLE a_practica01.calificaciones_productos_usuarios OWNER TO postgres;

--
-- TOC entry 238 (class 1259 OID 25678)
-- Name: categorias; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.categorias (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE a_practica01.categorias OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25677)
-- Name: categorias_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.categorias_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.categorias_id_seq OWNER TO postgres;

--
-- TOC entry 3597 (class 0 OID 0)
-- Dependencies: 237
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.categorias_id_seq OWNED BY a_practica01.categorias.id;


--
-- TOC entry 247 (class 1259 OID 25719)
-- Name: etiquetas; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.etiquetas (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE a_practica01.etiquetas OWNER TO postgres;

--
-- TOC entry 246 (class 1259 OID 25718)
-- Name: etiquetas_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.etiquetas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.etiquetas_id_seq OWNER TO postgres;

--
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 246
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.etiquetas_id_seq OWNED BY a_practica01.etiquetas.id;


--
-- TOC entry 242 (class 1259 OID 25696)
-- Name: imagenes; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.imagenes (
    id integer NOT NULL,
    productos_id integer,
    archivo text
);


ALTER TABLE a_practica01.imagenes OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25695)
-- Name: imagenes_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.imagenes_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.imagenes_id_seq OWNER TO postgres;

--
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 241
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.imagenes_id_seq OWNED BY a_practica01.imagenes.id;


--
-- TOC entry 240 (class 1259 OID 25687)
-- Name: productos; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.productos (
    id integer NOT NULL,
    categorias_id integer,
    nombre text,
    precio numeric(13,2),
    cantidad integer,
    descripcion text
);


ALTER TABLE a_practica01.productos OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25704)
-- Name: productos_etiquetas; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.productos_etiquetas (
    productos_id integer NOT NULL,
    etiquetas_id integer NOT NULL
);


ALTER TABLE a_practica01.productos_etiquetas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25686)
-- Name: productos_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.productos_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.productos_id_seq OWNER TO postgres;

--
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 239
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.productos_id_seq OWNED BY a_practica01.productos.id;


--
-- TOC entry 249 (class 1259 OID 25728)
-- Name: roles; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.roles (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE a_practica01.roles OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 25727)
-- Name: roles_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.roles_id_seq OWNER TO postgres;

--
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 248
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.roles_id_seq OWNED BY a_practica01.roles.id;


--
-- TOC entry 245 (class 1259 OID 25710)
-- Name: usuarios; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.usuarios (
    id integer NOT NULL,
    cedula character varying(20),
    nombre character varying(100),
    apellido character varying(100),
    telefono character varying(20)[],
    correo text
);


ALTER TABLE a_practica01.usuarios OWNER TO postgres;

--
-- TOC entry 244 (class 1259 OID 25709)
-- Name: usuarios_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.usuarios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.usuarios_id_seq OWNER TO postgres;

--
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.usuarios_id_seq OWNED BY a_practica01.usuarios.id;


--
-- TOC entry 251 (class 1259 OID 25737)
-- Name: usuarios_roles; Type: TABLE; Schema: a_practica01; Owner: postgres
--

CREATE TABLE a_practica01.usuarios_roles (
    usuarios_id integer NOT NULL,
    roles_id integer NOT NULL
);


ALTER TABLE a_practica01.usuarios_roles OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 25736)
-- Name: usuarios_roles_roles_id_seq; Type: SEQUENCE; Schema: a_practica01; Owner: postgres
--

CREATE SEQUENCE a_practica01.usuarios_roles_roles_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica01.usuarios_roles_roles_id_seq OWNER TO postgres;

--
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 250
-- Name: usuarios_roles_roles_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica01; Owner: postgres
--

ALTER SEQUENCE a_practica01.usuarios_roles_roles_id_seq OWNED BY a_practica01.usuarios_roles.roles_id;


--
-- TOC entry 260 (class 1259 OID 33135)
-- Name: espacios; Type: TABLE; Schema: a_practica02; Owner: postgres
--

CREATE TABLE a_practica02.espacios (
    id integer NOT NULL,
    ubicacion text,
    estatus a_practica02.nombre_estatus
);


ALTER TABLE a_practica02.espacios OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 33134)
-- Name: espacios_id_seq; Type: SEQUENCE; Schema: a_practica02; Owner: postgres
--

CREATE SEQUENCE a_practica02.espacios_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica02.espacios_id_seq OWNER TO postgres;

--
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 259
-- Name: espacios_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica02; Owner: postgres
--

ALTER SEQUENCE a_practica02.espacios_id_seq OWNED BY a_practica02.espacios.id;


--
-- TOC entry 264 (class 1259 OID 33156)
-- Name: persona; Type: TABLE; Schema: a_practica02; Owner: postgres
--

CREATE TABLE a_practica02.persona (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    tipo a_practica02.personas_tipo
);


ALTER TABLE a_practica02.persona OWNER TO postgres;

--
-- TOC entry 263 (class 1259 OID 33155)
-- Name: persona_id_seq; Type: SEQUENCE; Schema: a_practica02; Owner: postgres
--

CREATE SEQUENCE a_practica02.persona_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica02.persona_id_seq OWNER TO postgres;

--
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 263
-- Name: persona_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica02; Owner: postgres
--

ALTER SEQUENCE a_practica02.persona_id_seq OWNED BY a_practica02.persona.id;


--
-- TOC entry 262 (class 1259 OID 33144)
-- Name: reservas; Type: TABLE; Schema: a_practica02; Owner: postgres
--

CREATE TABLE a_practica02.reservas (
    id integer NOT NULL,
    espacio_id integer,
    persona_id integer,
    evento text,
    inicio_tiempo timestamp without time zone DEFAULT now(),
    final_tiempo timestamp without time zone DEFAULT now(),
    estatus a_practica02.reserva_estatus,
    reserva_tiempo interval GENERATED ALWAYS AS ((final_tiempo - inicio_tiempo)) STORED
);


ALTER TABLE a_practica02.reservas OWNER TO postgres;

--
-- TOC entry 261 (class 1259 OID 33143)
-- Name: reservas_id_seq; Type: SEQUENCE; Schema: a_practica02; Owner: postgres
--

CREATE SEQUENCE a_practica02.reservas_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE a_practica02.reservas_id_seq OWNER TO postgres;

--
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 261
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: a_practica02; Owner: postgres
--

ALTER SEQUENCE a_practica02.reservas_id_seq OWNED BY a_practica02.reservas.id;


--
-- TOC entry 231 (class 1259 OID 24896)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80)
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24895)
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
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 230
-- Name: alumno_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumno_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 234 (class 1259 OID 24909)
-- Name: alumnos_asignaturas_inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos_asignaturas_inscripcion (
    alumnos_id integer NOT NULL,
    asignaturas_id integer NOT NULL,
    periodo smallint NOT NULL
);


ALTER TABLE public.alumnos_asignaturas_inscripcion OWNER TO postgres;

--
-- TOC entry 233 (class 1259 OID 24903)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignaturas (
    id integer NOT NULL,
    nombre character varying(80)
);


ALTER TABLE public.asignaturas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24902)
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
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 232
-- Name: asignaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignaturas_id_seq OWNED BY public.asignaturas.id;


--
-- TOC entry 258 (class 1259 OID 26396)
-- Name: emergencias; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.emergencias (
    trabajadores_id integer NOT NULL,
    persona public.contacto,
    direccion text,
    alergias text,
    notas text
);


ALTER TABLE public.emergencias OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 24615)
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
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.personas IS 'Tabla personas para el ejemplo de PgAdmin';


--
-- TOC entry 218 (class 1259 OID 24614)
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
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- TOC entry 225 (class 1259 OID 24735)
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
-- TOC entry 229 (class 1259 OID 24889)
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
-- TOC entry 228 (class 1259 OID 24888)
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
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 224 (class 1259 OID 24734)
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
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 223 (class 1259 OID 24696)
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
-- TOC entry 227 (class 1259 OID 24880)
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
-- TOC entry 226 (class 1259 OID 24879)
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
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 226
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 222 (class 1259 OID 24695)
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
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 222
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 257 (class 1259 OID 26365)
-- Name: trabajadores; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.trabajadores (
    id integer NOT NULL,
    nombre character varying(40),
    apellido character varying(40),
    fecha_ingreso date,
    cargos public.cargo_empleado,
    bonus numeric(3,2),
    salario numeric(10,2),
    pago_bono numeric(12,2) GENERATED ALWAYS AS ((salario * bonus)) STORED,
    CONSTRAINT chk_bonificacion_rango CHECK (((bonus >= 0.1) AND (bonus <= 0.3)))
);


ALTER TABLE public.trabajadores OWNER TO postgres;

--
-- TOC entry 256 (class 1259 OID 26364)
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
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 256
-- Name: trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajadores_id_seq OWNED BY public.trabajadores.id;


--
-- TOC entry 236 (class 1259 OID 25006)
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
-- TOC entry 235 (class 1259 OID 24968)
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
-- TOC entry 221 (class 1259 OID 24661)
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
-- TOC entry 220 (class 1259 OID 24660)
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
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: recursos_humanos; Owner: postgres
--

ALTER SEQUENCE recursos_humanos.personas_id_seq OWNED BY recursos_humanos.personas.id;


--
-- TOC entry 3327 (class 2604 OID 25747)
-- Name: calificaciones id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones ALTER COLUMN id SET DEFAULT nextval('a_practica01.calificaciones_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 25681)
-- Name: categorias id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.categorias ALTER COLUMN id SET DEFAULT nextval('a_practica01.categorias_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 25722)
-- Name: etiquetas id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.etiquetas ALTER COLUMN id SET DEFAULT nextval('a_practica01.etiquetas_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 25699)
-- Name: imagenes id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.imagenes ALTER COLUMN id SET DEFAULT nextval('a_practica01.imagenes_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 25690)
-- Name: productos id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos ALTER COLUMN id SET DEFAULT nextval('a_practica01.productos_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 25731)
-- Name: roles id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.roles ALTER COLUMN id SET DEFAULT nextval('a_practica01.roles_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 25713)
-- Name: usuarios id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios ALTER COLUMN id SET DEFAULT nextval('a_practica01.usuarios_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 25740)
-- Name: usuarios_roles roles_id; Type: DEFAULT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios_roles ALTER COLUMN roles_id SET DEFAULT nextval('a_practica01.usuarios_roles_roles_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 33138)
-- Name: espacios id; Type: DEFAULT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.espacios ALTER COLUMN id SET DEFAULT nextval('a_practica02.espacios_id_seq'::regclass);


--
-- TOC entry 3335 (class 2604 OID 33159)
-- Name: persona id; Type: DEFAULT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.persona ALTER COLUMN id SET DEFAULT nextval('a_practica02.persona_id_seq'::regclass);


--
-- TOC entry 3331 (class 2604 OID 33147)
-- Name: reservas id; Type: DEFAULT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.reservas ALTER COLUMN id SET DEFAULT nextval('a_practica02.reservas_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 24899)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumno_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 24906)
-- Name: asignaturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN id SET DEFAULT nextval('public.asignaturas_id_seq'::regclass);


--
-- TOC entry 3312 (class 2604 OID 24618)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 24738)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 24892)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3314 (class 2604 OID 24699)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 24883)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 26368)
-- Name: trabajadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores ALTER COLUMN id SET DEFAULT nextval('public.trabajadores_id_seq'::regclass);


--
-- TOC entry 3313 (class 2604 OID 24664)
-- Name: personas id; Type: DEFAULT; Schema: recursos_humanos; Owner: postgres
--

ALTER TABLE ONLY recursos_humanos.personas ALTER COLUMN id SET DEFAULT nextval('recursos_humanos.personas_id_seq'::regclass);


--
-- TOC entry 3577 (class 0 OID 25744)
-- Dependencies: 253
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.calificaciones (id, descripcion) FROM stdin;
21	Muy Malo
22	Malo
23	Medio
24	Bueno
25	Muy Bueno
\.


--
-- TOC entry 3578 (class 0 OID 25752)
-- Dependencies: 254
-- Data for Name: calificaciones_productos_usuarios; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.calificaciones_productos_usuarios (productos_id, calificaciones_id, usuarios_id) FROM stdin;
7	23	2
8	24	2
9	25	3
\.


--
-- TOC entry 3562 (class 0 OID 25678)
-- Dependencies: 238
-- Data for Name: categorias; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.categorias (id, nombre) FROM stdin;
16	Electronicos
17	Ropa y Accesorios
18	Hogar
\.


--
-- TOC entry 3571 (class 0 OID 25719)
-- Dependencies: 247
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.etiquetas (id, descripcion) FROM stdin;
21	Nuevo
22	Oferta
23	Destacado
24	Envío Gratis
\.


--
-- TOC entry 3566 (class 0 OID 25696)
-- Dependencies: 242
-- Data for Name: imagenes; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.imagenes (id, productos_id, archivo) FROM stdin;
9	7	/imagenes/smartphone_x_1.jpg
10	7	/imagenes/smartphone_x_2.jpg
11	8	/imagenes/camisa_casual_1.jpg
12	9	/imagenes/licuadora_pro_1.jpg
\.


--
-- TOC entry 3564 (class 0 OID 25687)
-- Dependencies: 240
-- Data for Name: productos; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.productos (id, categorias_id, nombre, precio, cantidad, descripcion) FROM stdin;
7	16	Smartphone X	450.00	15	Teléfono inteligente de última generación
8	17	Camisa Casual	25.50	30	Camisa de algodón para caballero
9	18	Licuadora Pro	89.99	10	Licuadora de alta potencia con vaso de vidrio
10	16	Smartwatch Deportivo	85.50	0	Reloj inteligente con monitor de ritmo cardíaco
11	18	Licuadora Vidrio	45.00	0	Licuadora de 3 velocidades
\.


--
-- TOC entry 3567 (class 0 OID 25704)
-- Dependencies: 243
-- Data for Name: productos_etiquetas; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.productos_etiquetas (productos_id, etiquetas_id) FROM stdin;
7	21
7	22
8	23
9	24
\.


--
-- TOC entry 3573 (class 0 OID 25728)
-- Dependencies: 249
-- Data for Name: roles; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.roles (id, descripcion) FROM stdin;
1	Administrador
2	Cliente
3	Vendedor
\.


--
-- TOC entry 3569 (class 0 OID 25710)
-- Dependencies: 245
-- Data for Name: usuarios; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.usuarios (id, cedula, nombre, apellido, telefono, correo) FROM stdin;
1	V12345678	Carlos	Pérez	{04121234567,02125551234}	carlos.perez@email.com
2	V87654321	Ana	Gómez	{04149876543}	ana.gomez@email.com
3	V11223344	Luis	Rodríguez	{04241112233,04162223344}	luis.rodriguez@email.com
\.


--
-- TOC entry 3575 (class 0 OID 25737)
-- Dependencies: 251
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: a_practica01; Owner: postgres
--

COPY a_practica01.usuarios_roles (usuarios_id, roles_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3583 (class 0 OID 33135)
-- Dependencies: 260
-- Data for Name: espacios; Type: TABLE DATA; Schema: a_practica02; Owner: postgres
--

COPY a_practica02.espacios (id, ubicacion, estatus) FROM stdin;
1	Sala de Conferencias A - Torre Este	DISPONIBLE
2	Auditorio Principal - Planta Baja	REPARACION
3	Laboratorio de Computación 1	OCUPADO
4	Cancha de Multiple Uso	DISPONIBLE
\.


--
-- TOC entry 3587 (class 0 OID 33156)
-- Dependencies: 264
-- Data for Name: persona; Type: TABLE DATA; Schema: a_practica02; Owner: postgres
--

COPY a_practica02.persona (id, nombre, apellido, tipo) FROM stdin;
1	Carlos	Pérez	EMPLEADO_ADMIN
2	María	Gómez	PROFESOR
3	Ana	Rodríguez	PROFESOR
\.


--
-- TOC entry 3585 (class 0 OID 33144)
-- Dependencies: 262
-- Data for Name: reservas; Type: TABLE DATA; Schema: a_practica02; Owner: postgres
--

COPY a_practica02.reservas (id, espacio_id, persona_id, evento, inicio_tiempo, final_tiempo, estatus) FROM stdin;
1	4	3	Torneo futbol inter-universidades	2026-10-13 09:00:00	2026-10-13 12:30:00	ABIERTA
2	2	2	Defensa trabajo de grado	2026-10-13 14:00:00	2026-10-13 16:30:00	CANCELADA
3	1	1	Induccion de nuevos estudiantes	2026-10-14 10:00:00	2026-10-14 12:00:00	ABIERTA
\.


--
-- TOC entry 3557 (class 0 OID 24896)
-- Dependencies: 231
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido) FROM stdin;
1	JOSE	MEDINA
2	RICARDO	SILVA
3	ANDRES	FRANCO
\.


--
-- TOC entry 3560 (class 0 OID 24909)
-- Dependencies: 234
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
-- TOC entry 3559 (class 0 OID 24903)
-- Dependencies: 233
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
-- TOC entry 3581 (class 0 OID 26396)
-- Dependencies: 258
-- Data for Name: emergencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencias (trabajadores_id, persona, direccion, alergias, notas) FROM stdin;
1	(MARIA,PEREZ,"{212000001,212000002}","{mperez@trabajo,mperez@personal}")	CHACAITO	PENICILINA	DIABETES TIPO 2
\.


--
-- TOC entry 3545 (class 0 OID 24615)
-- Dependencies: 219
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
-- TOC entry 3551 (class 0 OID 24735)
-- Dependencies: 225
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
-- TOC entry 3555 (class 0 OID 24889)
-- Dependencies: 229
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
-- TOC entry 3549 (class 0 OID 24696)
-- Dependencies: 223
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2122222277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3553 (class 0 OID 24880)
-- Dependencies: 227
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
-- TOC entry 3580 (class 0 OID 26365)
-- Dependencies: 257
-- Data for Name: trabajadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajadores (id, nombre, apellido, fecha_ingreso, cargos, bonus, salario) FROM stdin;
2	YOLANDA	TORTOZA	2001-05-30	COORDINADOR	0.12	1000.00
3	ANA	VASQUEZ	2025-12-15	GERENTE	0.20	400.00
1	NELLY	CONTRERAS	2000-04-15	OPERADOR	0.12	500.00
4	SUSANA	GUERRERO	2025-06-15	OPERADOR	0.15	400.00
\.


--
-- TOC entry 3547 (class 0 OID 24661)
-- Dependencies: 221
-- Data for Name: personas; Type: TABLE DATA; Schema: recursos_humanos; Owner: postgres
--

COPY recursos_humanos.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
\.


--
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 252
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.calificaciones_id_seq', 25, true);


--
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 237
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.categorias_id_seq', 18, true);


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 246
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.etiquetas_id_seq', 24, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 241
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.imagenes_id_seq', 12, true);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 239
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.productos_id_seq', 11, true);


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 248
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.roles_id_seq', 3, true);


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 244
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.usuarios_id_seq', 3, true);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 250
-- Name: usuarios_roles_roles_id_seq; Type: SEQUENCE SET; Schema: a_practica01; Owner: postgres
--

SELECT pg_catalog.setval('a_practica01.usuarios_roles_roles_id_seq', 1, false);


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 259
-- Name: espacios_id_seq; Type: SEQUENCE SET; Schema: a_practica02; Owner: postgres
--

SELECT pg_catalog.setval('a_practica02.espacios_id_seq', 4, true);


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 263
-- Name: persona_id_seq; Type: SEQUENCE SET; Schema: a_practica02; Owner: postgres
--

SELECT pg_catalog.setval('a_practica02.persona_id_seq', 3, true);


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 261
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: a_practica02; Owner: postgres
--

SELECT pg_catalog.setval('a_practica02.reservas_id_seq', 3, true);


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 230
-- Name: alumno_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumno_id_seq', 3, true);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 232
-- Name: asignaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignaturas_id_seq', 5, true);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 6, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 26, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 226
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 6, true);


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 222
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 256
-- Name: trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajadores_id_seq', 4, true);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: recursos_humanos; Owner: postgres
--

SELECT pg_catalog.setval('recursos_humanos.personas_id_seq', 1, false);


--
-- TOC entry 3372 (class 2606 OID 25751)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 25756)
-- Name: calificaciones_productos_usuarios calificaciones_productos_usuarios_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones_productos_usuarios
    ADD CONSTRAINT calificaciones_productos_usuarios_pkey PRIMARY KEY (productos_id, calificaciones_id, usuarios_id);


--
-- TOC entry 3356 (class 2606 OID 25685)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 25726)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 25703)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 25708)
-- Name: productos_etiquetas productos_etiquetas_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_pkey PRIMARY KEY (productos_id, etiquetas_id);


--
-- TOC entry 3358 (class 2606 OID 25694)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 25735)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 25717)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3370 (class 2606 OID 25742)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (usuarios_id, roles_id);


--
-- TOC entry 3380 (class 2606 OID 33142)
-- Name: espacios espacios_pkey; Type: CONSTRAINT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.espacios
    ADD CONSTRAINT espacios_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 33161)
-- Name: persona persona_pkey; Type: CONSTRAINT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.persona
    ADD CONSTRAINT persona_pkey PRIMARY KEY (id);


--
-- TOC entry 3382 (class 2606 OID 33154)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 24901)
-- Name: alumnos alumno_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumno_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 24913)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_pkey PRIMARY KEY (alumnos_id, asignaturas_id, periodo);


--
-- TOC entry 3352 (class 2606 OID 24908)
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 26402)
-- Name: emergencias emergencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_pkey PRIMARY KEY (trabajadores_id);


--
-- TOC entry 3338 (class 2606 OID 24622)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 24894)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 24740)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 24887)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 24703)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3376 (class 2606 OID 26372)
-- Name: trabajadores trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores
    ADD CONSTRAINT trabajadores_pkey PRIMARY KEY (id);


--
-- TOC entry 3340 (class 2606 OID 24668)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: recursos_humanos; Owner: postgres
--

ALTER TABLE ONLY recursos_humanos.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3394 (class 2606 OID 25792)
-- Name: calificaciones_productos_usuarios calificaciones_productos_usuarios_calificaciones_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones_productos_usuarios
    ADD CONSTRAINT calificaciones_productos_usuarios_calificaciones_id_fkey FOREIGN KEY (calificaciones_id) REFERENCES a_practica01.calificaciones(id) NOT VALID;


--
-- TOC entry 3395 (class 2606 OID 25787)
-- Name: calificaciones_productos_usuarios calificaciones_productos_usuarios_productos_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones_productos_usuarios
    ADD CONSTRAINT calificaciones_productos_usuarios_productos_id_fkey FOREIGN KEY (productos_id) REFERENCES a_practica01.productos(id) NOT VALID;


--
-- TOC entry 3396 (class 2606 OID 25797)
-- Name: calificaciones_productos_usuarios calificaciones_productos_usuarios_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.calificaciones_productos_usuarios
    ADD CONSTRAINT calificaciones_productos_usuarios_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES a_practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3389 (class 2606 OID 25762)
-- Name: imagenes imagenes_productos_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.imagenes
    ADD CONSTRAINT imagenes_productos_id_fkey FOREIGN KEY (productos_id) REFERENCES a_practica01.productos(id) NOT VALID;


--
-- TOC entry 3388 (class 2606 OID 25757)
-- Name: productos productos_categorias_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos
    ADD CONSTRAINT productos_categorias_id_fkey FOREIGN KEY (categorias_id) REFERENCES a_practica01.categorias(id) NOT VALID;


--
-- TOC entry 3390 (class 2606 OID 25772)
-- Name: productos_etiquetas productos_etiquetas_etiquetas_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_etiquetas_id_fkey FOREIGN KEY (etiquetas_id) REFERENCES a_practica01.etiquetas(id) NOT VALID;


--
-- TOC entry 3391 (class 2606 OID 25767)
-- Name: productos_etiquetas productos_etiquetas_productos_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_productos_id_fkey FOREIGN KEY (productos_id) REFERENCES a_practica01.productos(id) NOT VALID;


--
-- TOC entry 3392 (class 2606 OID 25782)
-- Name: usuarios_roles usuarios_roles_roles_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_roles_id_fkey FOREIGN KEY (roles_id) REFERENCES a_practica01.roles(id) NOT VALID;


--
-- TOC entry 3393 (class 2606 OID 25777)
-- Name: usuarios_roles usuarios_roles_usuarios_id_fkey; Type: FK CONSTRAINT; Schema: a_practica01; Owner: postgres
--

ALTER TABLE ONLY a_practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_usuarios_id_fkey FOREIGN KEY (usuarios_id) REFERENCES a_practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3398 (class 2606 OID 33162)
-- Name: reservas reservas_espacio_id_fkey; Type: FK CONSTRAINT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.reservas
    ADD CONSTRAINT reservas_espacio_id_fkey FOREIGN KEY (espacio_id) REFERENCES a_practica02.espacios(id) NOT VALID;


--
-- TOC entry 3399 (class 2606 OID 33167)
-- Name: reservas reservas_persona_id_fkey; Type: FK CONSTRAINT; Schema: a_practica02; Owner: postgres
--

ALTER TABLE ONLY a_practica02.reservas
    ADD CONSTRAINT reservas_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES a_practica02.persona(id) NOT VALID;


--
-- TOC entry 3386 (class 2606 OID 24919)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_alumno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_alumno_id_fkey FOREIGN KEY (alumnos_id) REFERENCES public.alumnos(id) NOT VALID;


--
-- TOC entry 3387 (class 2606 OID 24924)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_asignatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_asignatura_id_fkey FOREIGN KEY (asignaturas_id) REFERENCES public.asignaturas(id) NOT VALID;


--
-- TOC entry 3397 (class 2606 OID 26403)
-- Name: emergencias emergencias_trabajadores_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_trabajadores_id_fkey FOREIGN KEY (trabajadores_id) REFERENCES public.trabajadores(id);


--
-- TOC entry 3385 (class 2606 OID 24741)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-07 10:07:49

--
-- PostgreSQL database dump complete
--

