--
-- PostgreSQL database dump
--

-- Dumped from database version 15.13
-- Dumped by pg_dump version 15.13

-- Started on 2026-10-07 10:07:32

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
-- TOC entry 3596 (class 0 OID 0)
-- Dependencies: 8
-- Name: SCHEMA practica01; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA practica01 IS 'Práctica 01, caso Tienda Virtual';


--
-- TOC entry 9 (class 2615 OID 32858)
-- Name: practica02; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA practica02;


ALTER SCHEMA practica02 OWNER TO postgres;

--
-- TOC entry 7 (class 2615 OID 24599)
-- Name: presupuesto; Type: SCHEMA; Schema: -; Owner: postgres
--

CREATE SCHEMA presupuesto;


ALTER SCHEMA presupuesto OWNER TO postgres;

--
-- TOC entry 3597 (class 0 OID 0)
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
-- TOC entry 3598 (class 0 OID 0)
-- Dependencies: 6
-- Name: SCHEMA rrhh; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON SCHEMA rrhh IS 'Recursos Humanos';


--
-- TOC entry 965 (class 1247 OID 32865)
-- Name: estatus_nombre; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.estatus_nombre AS ENUM (
    'disponible',
    'en_reparación',
    'ocupado'
);


ALTER TYPE practica02.estatus_nombre OWNER TO postgres;

--
-- TOC entry 968 (class 1247 OID 32905)
-- Name: persona_tipos; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.persona_tipos AS ENUM (
    'profesor',
    'empleado_administrativo'
);


ALTER TYPE practica02.persona_tipos OWNER TO postgres;

--
-- TOC entry 971 (class 1247 OID 32956)
-- Name: reserva_estatus; Type: TYPE; Schema: practica02; Owner: postgres
--

CREATE TYPE practica02.reserva_estatus AS ENUM (
    'abierta',
    'cerrada',
    'cancelada'
);


ALTER TYPE practica02.reserva_estatus OWNER TO postgres;

--
-- TOC entry 962 (class 1247 OID 32794)
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
-- TOC entry 953 (class 1247 OID 26336)
-- Name: contacto; Type: TYPE; Schema: public; Owner: postgres
--

CREATE TYPE public.contacto AS (
	nombre character varying(40),
	apellido character varying(40),
	telefono character varying(15)[],
	correo_electronico character varying(60)[]
);


ALTER TYPE public.contacto OWNER TO postgres;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- TOC entry 251 (class 1259 OID 25862)
-- Name: calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.calificaciones (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.calificaciones OWNER TO postgres;

--
-- TOC entry 250 (class 1259 OID 25861)
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
-- TOC entry 3599 (class 0 OID 0)
-- Dependencies: 250
-- Name: calificaciones_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.calificaciones_id_seq OWNED BY practica01.calificaciones.id;


--
-- TOC entry 238 (class 1259 OID 25803)
-- Name: categorias; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.categorias (
    id integer NOT NULL,
    nombre text
);


ALTER TABLE practica01.categorias OWNER TO postgres;

--
-- TOC entry 237 (class 1259 OID 25802)
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
-- TOC entry 3600 (class 0 OID 0)
-- Dependencies: 237
-- Name: categorias_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.categorias_id_seq OWNED BY practica01.categorias.id;


--
-- TOC entry 240 (class 1259 OID 25812)
-- Name: etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.etiquetas (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.etiquetas OWNER TO postgres;

--
-- TOC entry 239 (class 1259 OID 25811)
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
-- TOC entry 3601 (class 0 OID 0)
-- Dependencies: 239
-- Name: etiquetas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.etiquetas_id_seq OWNED BY practica01.etiquetas.id;


--
-- TOC entry 244 (class 1259 OID 25830)
-- Name: imagenes; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.imagenes (
    id integer NOT NULL,
    producto_id integer,
    archivo text
);


ALTER TABLE practica01.imagenes OWNER TO postgres;

--
-- TOC entry 243 (class 1259 OID 25829)
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
-- TOC entry 3602 (class 0 OID 0)
-- Dependencies: 243
-- Name: imagenes_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.imagenes_id_seq OWNED BY practica01.imagenes.id;


--
-- TOC entry 249 (class 1259 OID 25853)
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
-- TOC entry 252 (class 1259 OID 25870)
-- Name: productos_calificaciones; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_calificaciones (
    producto_id integer NOT NULL,
    calificacion_id integer NOT NULL,
    usuario_id integer NOT NULL
);


ALTER TABLE practica01.productos_calificaciones OWNER TO postgres;

--
-- TOC entry 254 (class 1259 OID 26310)
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
-- TOC entry 253 (class 1259 OID 25875)
-- Name: productos_etiquetas; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.productos_etiquetas (
    producto_id integer NOT NULL,
    etiqueta_id integer NOT NULL
);


ALTER TABLE practica01.productos_etiquetas OWNER TO postgres;

--
-- TOC entry 248 (class 1259 OID 25852)
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
-- TOC entry 3603 (class 0 OID 0)
-- Dependencies: 248
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.productos_id_seq OWNED BY practica01.productos.id;


--
-- TOC entry 242 (class 1259 OID 25821)
-- Name: roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.roles (
    id integer NOT NULL,
    descripcion text
);


ALTER TABLE practica01.roles OWNER TO postgres;

--
-- TOC entry 241 (class 1259 OID 25820)
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
-- TOC entry 3604 (class 0 OID 0)
-- Dependencies: 241
-- Name: roles_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.roles_id_seq OWNED BY practica01.roles.id;


--
-- TOC entry 246 (class 1259 OID 25839)
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
-- TOC entry 245 (class 1259 OID 25838)
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
-- TOC entry 3605 (class 0 OID 0)
-- Dependencies: 245
-- Name: usuarios_id_seq; Type: SEQUENCE OWNED BY; Schema: practica01; Owner: postgres
--

ALTER SEQUENCE practica01.usuarios_id_seq OWNED BY practica01.usuarios.id;


--
-- TOC entry 247 (class 1259 OID 25847)
-- Name: usuarios_roles; Type: TABLE; Schema: practica01; Owner: postgres
--

CREATE TABLE practica01.usuarios_roles (
    usuario_id integer NOT NULL,
    rol_id integer NOT NULL
);


ALTER TABLE practica01.usuarios_roles OWNER TO postgres;

--
-- TOC entry 260 (class 1259 OID 32998)
-- Name: espacios; Type: TABLE; Schema: practica02; Owner: postgres
--

CREATE TABLE practica02.espacios (
    id integer NOT NULL,
    ubicacion text,
    estatus practica02.estatus_nombre
);


ALTER TABLE practica02.espacios OWNER TO postgres;

--
-- TOC entry 259 (class 1259 OID 32997)
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
-- TOC entry 3606 (class 0 OID 0)
-- Dependencies: 259
-- Name: espacios_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.espacios_id_seq OWNED BY practica02.espacios.id;


--
-- TOC entry 262 (class 1259 OID 33007)
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
-- TOC entry 261 (class 1259 OID 33006)
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
-- TOC entry 3607 (class 0 OID 0)
-- Dependencies: 261
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.personas_id_seq OWNED BY practica02.personas.id;


--
-- TOC entry 264 (class 1259 OID 33014)
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
-- TOC entry 263 (class 1259 OID 33013)
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
-- TOC entry 3608 (class 0 OID 0)
-- Dependencies: 263
-- Name: reservas_id_seq; Type: SEQUENCE OWNED BY; Schema: practica02; Owner: postgres
--

ALTER SEQUENCE practica02.reservas_id_seq OWNED BY practica02.reservas.id;


--
-- TOC entry 231 (class 1259 OID 24796)
-- Name: alumnos; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos (
    id integer NOT NULL,
    nombre character varying(80),
    apellido character varying(80)
);


ALTER TABLE public.alumnos OWNER TO postgres;

--
-- TOC entry 234 (class 1259 OID 24809)
-- Name: alumnos_asignaturas_inscripcion; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alumnos_asignaturas_inscripcion (
    alumno_id integer NOT NULL,
    asignatura_id integer NOT NULL,
    periodo smallint NOT NULL
);


ALTER TABLE public.alumnos_asignaturas_inscripcion OWNER TO postgres;

--
-- TOC entry 230 (class 1259 OID 24795)
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
-- TOC entry 3609 (class 0 OID 0)
-- Dependencies: 230
-- Name: alumnos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.alumnos_id_seq OWNED BY public.alumnos.id;


--
-- TOC entry 233 (class 1259 OID 24803)
-- Name: asignaturas; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.asignaturas (
    id integer NOT NULL,
    nombre character varying(80)
);


ALTER TABLE public.asignaturas OWNER TO postgres;

--
-- TOC entry 232 (class 1259 OID 24802)
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
-- TOC entry 3610 (class 0 OID 0)
-- Dependencies: 232
-- Name: asignaturas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.asignaturas_id_seq OWNED BY public.asignaturas.id;


--
-- TOC entry 258 (class 1259 OID 26382)
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
-- TOC entry 219 (class 1259 OID 24606)
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
-- TOC entry 3611 (class 0 OID 0)
-- Dependencies: 219
-- Name: TABLE personas; Type: COMMENT; Schema: public; Owner: postgres
--

COMMENT ON TABLE public.personas IS 'Tabla personas para el ejemplo de PgAdmin';


--
-- TOC entry 218 (class 1259 OID 24605)
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
-- TOC entry 3612 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.personas_id_seq OWNED BY public.personas.id;


--
-- TOC entry 225 (class 1259 OID 24723)
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
-- TOC entry 229 (class 1259 OID 24789)
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
-- TOC entry 228 (class 1259 OID 24788)
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
-- TOC entry 3613 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_1_id_seq OWNED BY public.productos_1.id;


--
-- TOC entry 224 (class 1259 OID 24722)
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
-- TOC entry 3614 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.productos_id_seq OWNED BY public.productos.id;


--
-- TOC entry 223 (class 1259 OID 24705)
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
-- TOC entry 227 (class 1259 OID 24780)
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
-- TOC entry 226 (class 1259 OID 24779)
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
-- TOC entry 3615 (class 0 OID 0)
-- Dependencies: 226
-- Name: proveedores_1_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_1_id_seq OWNED BY public.proveedores_1.id;


--
-- TOC entry 222 (class 1259 OID 24704)
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
-- TOC entry 3616 (class 0 OID 0)
-- Dependencies: 222
-- Name: proveedores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.proveedores_id_seq OWNED BY public.proveedores.id;


--
-- TOC entry 257 (class 1259 OID 26356)
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
-- TOC entry 256 (class 1259 OID 26355)
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
-- TOC entry 3617 (class 0 OID 0)
-- Dependencies: 256
-- Name: trabajadores_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.trabajadores_id_seq OWNED BY public.trabajadores.id;


--
-- TOC entry 236 (class 1259 OID 25002)
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
-- TOC entry 235 (class 1259 OID 24964)
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
-- TOC entry 221 (class 1259 OID 24652)
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
-- TOC entry 220 (class 1259 OID 24651)
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
-- TOC entry 3618 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE OWNED BY; Schema: rrhh; Owner: postgres
--

ALTER SEQUENCE rrhh.personas_id_seq OWNED BY rrhh.personas.id;


--
-- TOC entry 3329 (class 2604 OID 25865)
-- Name: calificaciones id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones ALTER COLUMN id SET DEFAULT nextval('practica01.calificaciones_id_seq'::regclass);


--
-- TOC entry 3323 (class 2604 OID 25806)
-- Name: categorias id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias ALTER COLUMN id SET DEFAULT nextval('practica01.categorias_id_seq'::regclass);


--
-- TOC entry 3324 (class 2604 OID 25815)
-- Name: etiquetas id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas ALTER COLUMN id SET DEFAULT nextval('practica01.etiquetas_id_seq'::regclass);


--
-- TOC entry 3326 (class 2604 OID 25833)
-- Name: imagenes id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes ALTER COLUMN id SET DEFAULT nextval('practica01.imagenes_id_seq'::regclass);


--
-- TOC entry 3328 (class 2604 OID 25856)
-- Name: productos id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos ALTER COLUMN id SET DEFAULT nextval('practica01.productos_id_seq'::regclass);


--
-- TOC entry 3325 (class 2604 OID 25824)
-- Name: roles id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles ALTER COLUMN id SET DEFAULT nextval('practica01.roles_id_seq'::regclass);


--
-- TOC entry 3327 (class 2604 OID 25842)
-- Name: usuarios id; Type: DEFAULT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios ALTER COLUMN id SET DEFAULT nextval('practica01.usuarios_id_seq'::regclass);


--
-- TOC entry 3332 (class 2604 OID 33001)
-- Name: espacios id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.espacios ALTER COLUMN id SET DEFAULT nextval('practica02.espacios_id_seq'::regclass);


--
-- TOC entry 3333 (class 2604 OID 33010)
-- Name: personas id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.personas ALTER COLUMN id SET DEFAULT nextval('practica02.personas_id_seq'::regclass);


--
-- TOC entry 3334 (class 2604 OID 33017)
-- Name: reservas id; Type: DEFAULT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas ALTER COLUMN id SET DEFAULT nextval('practica02.reservas_id_seq'::regclass);


--
-- TOC entry 3321 (class 2604 OID 24799)
-- Name: alumnos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos ALTER COLUMN id SET DEFAULT nextval('public.alumnos_id_seq'::regclass);


--
-- TOC entry 3322 (class 2604 OID 24806)
-- Name: asignaturas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas ALTER COLUMN id SET DEFAULT nextval('public.asignaturas_id_seq'::regclass);


--
-- TOC entry 3315 (class 2604 OID 24609)
-- Name: personas id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas ALTER COLUMN id SET DEFAULT nextval('public.personas_id_seq'::regclass);


--
-- TOC entry 3318 (class 2604 OID 24726)
-- Name: productos id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos ALTER COLUMN id SET DEFAULT nextval('public.productos_id_seq'::regclass);


--
-- TOC entry 3320 (class 2604 OID 24792)
-- Name: productos_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1 ALTER COLUMN id SET DEFAULT nextval('public.productos_1_id_seq'::regclass);


--
-- TOC entry 3317 (class 2604 OID 24708)
-- Name: proveedores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores ALTER COLUMN id SET DEFAULT nextval('public.proveedores_id_seq'::regclass);


--
-- TOC entry 3319 (class 2604 OID 24783)
-- Name: proveedores_1 id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1 ALTER COLUMN id SET DEFAULT nextval('public.proveedores_1_id_seq'::regclass);


--
-- TOC entry 3330 (class 2604 OID 26359)
-- Name: trabajadores id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores ALTER COLUMN id SET DEFAULT nextval('public.trabajadores_id_seq'::regclass);


--
-- TOC entry 3316 (class 2604 OID 24655)
-- Name: personas id; Type: DEFAULT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas ALTER COLUMN id SET DEFAULT nextval('rrhh.personas_id_seq'::regclass);


--
-- TOC entry 3579 (class 0 OID 25862)
-- Dependencies: 251
-- Data for Name: calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.calificaciones (id, descripcion) FROM stdin;
1	Excelente
2	Bueno
3	Regular
4	Malo
\.


--
-- TOC entry 3566 (class 0 OID 25803)
-- Dependencies: 238
-- Data for Name: categorias; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.categorias (id, nombre) FROM stdin;
1	Electr¢nica
2	Ropa y Accesorios
3	Hogar y Cocina
\.


--
-- TOC entry 3568 (class 0 OID 25812)
-- Dependencies: 240
-- Data for Name: etiquetas; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.etiquetas (id, descripcion) FROM stdin;
1	Nuevo
2	Oferta
3	Destacado
4	Env¡o Gratis
\.


--
-- TOC entry 3572 (class 0 OID 25830)
-- Dependencies: 244
-- Data for Name: imagenes; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.imagenes (id, producto_id, archivo) FROM stdin;
1	1	/imagenes/smartphone_x_1.jpg
2	1	/imagenes/smartphone_x_2.jpg
3	2	/imagenes/camisa_casual_1.jpg
4	3	/imagenes/licuadora_pro_1.jpg
\.


--
-- TOC entry 3577 (class 0 OID 25853)
-- Dependencies: 249
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
-- TOC entry 3580 (class 0 OID 25870)
-- Dependencies: 252
-- Data for Name: productos_calificaciones; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_calificaciones (producto_id, calificacion_id, usuario_id) FROM stdin;
1	1	2
2	2	2
3	1	3
\.


--
-- TOC entry 3581 (class 0 OID 25875)
-- Dependencies: 253
-- Data for Name: productos_etiquetas; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.productos_etiquetas (producto_id, etiqueta_id) FROM stdin;
1	1
1	3
2	2
3	4
\.


--
-- TOC entry 3570 (class 0 OID 25821)
-- Dependencies: 242
-- Data for Name: roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.roles (id, descripcion) FROM stdin;
1	Administrador
2	Cliente
3	Vendedor
\.


--
-- TOC entry 3574 (class 0 OID 25839)
-- Dependencies: 246
-- Data for Name: usuarios; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios (id, cedula, nombre, apellido, telefono, correo_electronico) FROM stdin;
1	V12345678	Carlos	P‚rez	{04121234567,02125551234}	carlos.perez@email.com
2	V87654321	Ana	G¢mez	{04149876543}	ana.gomez@email.com
3	V11223344	Luis	Rodr¡guez	{04241112233,04162223344}	luis.rodriguez@email.com
\.


--
-- TOC entry 3575 (class 0 OID 25847)
-- Dependencies: 247
-- Data for Name: usuarios_roles; Type: TABLE DATA; Schema: practica01; Owner: postgres
--

COPY practica01.usuarios_roles (usuario_id, rol_id) FROM stdin;
1	1
2	2
3	3
\.


--
-- TOC entry 3586 (class 0 OID 32998)
-- Dependencies: 260
-- Data for Name: espacios; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.espacios (id, ubicacion, estatus) FROM stdin;
1	Sala de Conferencias A - Torre Este	disponible
2	Auditorio Principal - Planta Baja	en_reparación
3	Laboratorio de Computación 1	ocupado
4	Cancha de usos múltiples	disponible
\.


--
-- TOC entry 3588 (class 0 OID 33007)
-- Dependencies: 262
-- Data for Name: personas; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.personas (id, nombre, apellido, tipo) FROM stdin;
1	Carlos	Pérez	empleado_administrativo
2	María	Gómez	profesor
3	Ana	Rodríguez	profesor
\.


--
-- TOC entry 3590 (class 0 OID 33014)
-- Dependencies: 264
-- Data for Name: reservas; Type: TABLE DATA; Schema: practica02; Owner: postgres
--

COPY practica02.reservas (id, espacio_id, persona_id, evento, inicio_fecha_hora, fin_fecha_hora, estatus) FROM stdin;
7	4	3	Juego semifinal torneo futbol interuniversidades	2026-10-13 09:00:00	2026-10-13 12:30:00	abierta
8	2	2	Defensa de Trabajo de Grado	2026-10-13 14:00:00	2026-10-13 16:00:00	abierta
9	1	3	Inducci¢n de nuevos estudiantes	2026-10-14 10:00:00	2026-10-14 12:00:00	abierta
\.


--
-- TOC entry 3561 (class 0 OID 24796)
-- Dependencies: 231
-- Data for Name: alumnos; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alumnos (id, nombre, apellido) FROM stdin;
1	JOSE	MEDINA
2	RICARDO	SILVA
3	ANDRES	FRANCO
\.


--
-- TOC entry 3564 (class 0 OID 24809)
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
-- TOC entry 3563 (class 0 OID 24803)
-- Dependencies: 233
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
-- TOC entry 3584 (class 0 OID 26382)
-- Dependencies: 258
-- Data for Name: emergencias; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.emergencias (trabajador_id, persona, direccion, alergias, notas) FROM stdin;
1	(MARIA,PEREZ,"{2129871234,4145678901}","{mperez@trabajo.com,mperez@personal.com}")	CHACAITO	PENICILINA	DIABETES TIPO 2
\.


--
-- TOC entry 3549 (class 0 OID 24606)
-- Dependencies: 219
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
-- TOC entry 3555 (class 0 OID 24723)
-- Dependencies: 225
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
-- TOC entry 3559 (class 0 OID 24789)
-- Dependencies: 229
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
-- TOC entry 3553 (class 0 OID 24705)
-- Dependencies: 223
-- Data for Name: proveedores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3557 (class 0 OID 24780)
-- Dependencies: 227
-- Data for Name: proveedores_1; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.proveedores_1 (id, nombre, direccion, telefono, correo_electronico) FROM stdin;
1	GENERAL ELECTRIC	AV. LECUNA	2121112233	info@ge.com
2	LG	AV. ROMULO GALLEGOS	2121112277	info@lg.com
3	MABE	AV. FCO. DE MIRANDA	2123334455	info@mabe.com
\.


--
-- TOC entry 3583 (class 0 OID 26356)
-- Dependencies: 257
-- Data for Name: trabajadores; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.trabajadores (id, nombre, apellido, fecha_ingreso, cargo, bonificacion, salario) FROM stdin;
2	YOLANDA	TORTOZA	2001-05-30	COORDINADOR(A)	0.12	500.00
4	ANA	VASQUEZ	2025-12-15	GERENTE	0.20	1000.00
1	NELLY	CONTRERAS	2000-04-15	OPERADOR(A)	0.12	400.00
5	SUSANA	GUERRERO	2025-06-15	OPERADOR(A)	0.15	400.00
\.


--
-- TOC entry 3551 (class 0 OID 24652)
-- Dependencies: 221
-- Data for Name: personas; Type: TABLE DATA; Schema: rrhh; Owner: postgres
--

COPY rrhh.personas (id, nombre, apellido, fecha_nac, direccion, correo_electronico, telefono) FROM stdin;
\.


--
-- TOC entry 3619 (class 0 OID 0)
-- Dependencies: 250
-- Name: calificaciones_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.calificaciones_id_seq', 4, true);


--
-- TOC entry 3620 (class 0 OID 0)
-- Dependencies: 237
-- Name: categorias_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.categorias_id_seq', 3, true);


--
-- TOC entry 3621 (class 0 OID 0)
-- Dependencies: 239
-- Name: etiquetas_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.etiquetas_id_seq', 4, true);


--
-- TOC entry 3622 (class 0 OID 0)
-- Dependencies: 243
-- Name: imagenes_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.imagenes_id_seq', 4, true);


--
-- TOC entry 3623 (class 0 OID 0)
-- Dependencies: 248
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.productos_id_seq', 7, true);


--
-- TOC entry 3624 (class 0 OID 0)
-- Dependencies: 241
-- Name: roles_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.roles_id_seq', 3, true);


--
-- TOC entry 3625 (class 0 OID 0)
-- Dependencies: 245
-- Name: usuarios_id_seq; Type: SEQUENCE SET; Schema: practica01; Owner: postgres
--

SELECT pg_catalog.setval('practica01.usuarios_id_seq', 3, true);


--
-- TOC entry 3626 (class 0 OID 0)
-- Dependencies: 259
-- Name: espacios_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.espacios_id_seq', 4, true);


--
-- TOC entry 3627 (class 0 OID 0)
-- Dependencies: 261
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.personas_id_seq', 3, true);


--
-- TOC entry 3628 (class 0 OID 0)
-- Dependencies: 263
-- Name: reservas_id_seq; Type: SEQUENCE SET; Schema: practica02; Owner: postgres
--

SELECT pg_catalog.setval('practica02.reservas_id_seq', 9, true);


--
-- TOC entry 3629 (class 0 OID 0)
-- Dependencies: 230
-- Name: alumnos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.alumnos_id_seq', 3, true);


--
-- TOC entry 3630 (class 0 OID 0)
-- Dependencies: 232
-- Name: asignaturas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.asignaturas_id_seq', 5, true);


--
-- TOC entry 3631 (class 0 OID 0)
-- Dependencies: 218
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.personas_id_seq', 6, true);


--
-- TOC entry 3632 (class 0 OID 0)
-- Dependencies: 228
-- Name: productos_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_1_id_seq', 13, true);


--
-- TOC entry 3633 (class 0 OID 0)
-- Dependencies: 224
-- Name: productos_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.productos_id_seq', 13, true);


--
-- TOC entry 3634 (class 0 OID 0)
-- Dependencies: 226
-- Name: proveedores_1_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_1_id_seq', 3, true);


--
-- TOC entry 3635 (class 0 OID 0)
-- Dependencies: 222
-- Name: proveedores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.proveedores_id_seq', 3, true);


--
-- TOC entry 3636 (class 0 OID 0)
-- Dependencies: 256
-- Name: trabajadores_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.trabajadores_id_seq', 5, true);


--
-- TOC entry 3637 (class 0 OID 0)
-- Dependencies: 220
-- Name: personas_id_seq; Type: SEQUENCE SET; Schema: rrhh; Owner: postgres
--

SELECT pg_catalog.setval('rrhh.personas_id_seq', 1, false);


--
-- TOC entry 3372 (class 2606 OID 25869)
-- Name: calificaciones calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.calificaciones
    ADD CONSTRAINT calificaciones_pkey PRIMARY KEY (id);


--
-- TOC entry 3358 (class 2606 OID 25810)
-- Name: categorias categorias_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.categorias
    ADD CONSTRAINT categorias_pkey PRIMARY KEY (id);


--
-- TOC entry 3360 (class 2606 OID 25819)
-- Name: etiquetas etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.etiquetas
    ADD CONSTRAINT etiquetas_pkey PRIMARY KEY (id);


--
-- TOC entry 3364 (class 2606 OID 25837)
-- Name: imagenes imagenes_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_pkey PRIMARY KEY (id);


--
-- TOC entry 3374 (class 2606 OID 25874)
-- Name: productos_calificaciones productos_calificaciones_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_pkey PRIMARY KEY (producto_id, calificacion_id, usuario_id);


--
-- TOC entry 3376 (class 2606 OID 25879)
-- Name: productos_etiquetas productos_etiquetas_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_pkey PRIMARY KEY (producto_id, etiqueta_id);


--
-- TOC entry 3370 (class 2606 OID 25860)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3362 (class 2606 OID 25828)
-- Name: roles roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (id);


--
-- TOC entry 3366 (class 2606 OID 25846)
-- Name: usuarios usuarios_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios
    ADD CONSTRAINT usuarios_pkey PRIMARY KEY (id);


--
-- TOC entry 3368 (class 2606 OID 25851)
-- Name: usuarios_roles usuarios_roles_pkey; Type: CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_pkey PRIMARY KEY (usuario_id, rol_id);


--
-- TOC entry 3382 (class 2606 OID 33005)
-- Name: espacios espacios_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.espacios
    ADD CONSTRAINT espacios_pkey PRIMARY KEY (id);


--
-- TOC entry 3384 (class 2606 OID 33012)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3386 (class 2606 OID 33023)
-- Name: reservas reservas_pkey; Type: CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_pkey PRIMARY KEY (id);


--
-- TOC entry 3356 (class 2606 OID 24813)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_pkey PRIMARY KEY (alumno_id, asignatura_id, periodo);


--
-- TOC entry 3352 (class 2606 OID 24801)
-- Name: alumnos alumnos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos
    ADD CONSTRAINT alumnos_pkey PRIMARY KEY (id);


--
-- TOC entry 3354 (class 2606 OID 24808)
-- Name: asignaturas asignaturas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.asignaturas
    ADD CONSTRAINT asignaturas_pkey PRIMARY KEY (id);


--
-- TOC entry 3380 (class 2606 OID 26388)
-- Name: emergencias emergencias_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_pkey PRIMARY KEY (trabajador_id);


--
-- TOC entry 3340 (class 2606 OID 24613)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3350 (class 2606 OID 24794)
-- Name: productos_1 productos_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3346 (class 2606 OID 24728)
-- Name: productos productos_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_pkey PRIMARY KEY (id);


--
-- TOC entry 3348 (class 2606 OID 24787)
-- Name: proveedores_1 proveedores_1_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores_1
    ADD CONSTRAINT proveedores_1_pkey PRIMARY KEY (id);


--
-- TOC entry 3344 (class 2606 OID 24712)
-- Name: proveedores proveedores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.proveedores
    ADD CONSTRAINT proveedores_pkey PRIMARY KEY (id);


--
-- TOC entry 3378 (class 2606 OID 26363)
-- Name: trabajadores trabajadores_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.trabajadores
    ADD CONSTRAINT trabajadores_pkey PRIMARY KEY (id);


--
-- TOC entry 3342 (class 2606 OID 24659)
-- Name: personas personas_pkey; Type: CONSTRAINT; Schema: rrhh; Owner: postgres
--

ALTER TABLE ONLY rrhh.personas
    ADD CONSTRAINT personas_pkey PRIMARY KEY (id);


--
-- TOC entry 3391 (class 2606 OID 25880)
-- Name: imagenes imagenes_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.imagenes
    ADD CONSTRAINT imagenes_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3395 (class 2606 OID 25905)
-- Name: productos_calificaciones productos_calificaciones_calificacion_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_calificacion_id_fkey FOREIGN KEY (calificacion_id) REFERENCES practica01.calificaciones(id) NOT VALID;


--
-- TOC entry 3396 (class 2606 OID 25900)
-- Name: productos_calificaciones productos_calificaciones_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3397 (class 2606 OID 25910)
-- Name: productos_calificaciones productos_calificaciones_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_calificaciones
    ADD CONSTRAINT productos_calificaciones_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3394 (class 2606 OID 25895)
-- Name: productos productos_categoria_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos
    ADD CONSTRAINT productos_categoria_id_fkey FOREIGN KEY (categoria_id) REFERENCES practica01.categorias(id) NOT VALID;


--
-- TOC entry 3398 (class 2606 OID 25920)
-- Name: productos_etiquetas productos_etiquetas_etiqueta_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_etiqueta_id_fkey FOREIGN KEY (etiqueta_id) REFERENCES practica01.etiquetas(id) NOT VALID;


--
-- TOC entry 3399 (class 2606 OID 25915)
-- Name: productos_etiquetas productos_etiquetas_producto_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.productos_etiquetas
    ADD CONSTRAINT productos_etiquetas_producto_id_fkey FOREIGN KEY (producto_id) REFERENCES practica01.productos(id) NOT VALID;


--
-- TOC entry 3392 (class 2606 OID 25890)
-- Name: usuarios_roles usuarios_roles_rol_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_rol_id_fkey FOREIGN KEY (rol_id) REFERENCES practica01.roles(id) NOT VALID;


--
-- TOC entry 3393 (class 2606 OID 25885)
-- Name: usuarios_roles usuarios_roles_usuario_id_fkey; Type: FK CONSTRAINT; Schema: practica01; Owner: postgres
--

ALTER TABLE ONLY practica01.usuarios_roles
    ADD CONSTRAINT usuarios_roles_usuario_id_fkey FOREIGN KEY (usuario_id) REFERENCES practica01.usuarios(id) NOT VALID;


--
-- TOC entry 3401 (class 2606 OID 33029)
-- Name: reservas reservas_espacio_id_fkey; Type: FK CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_espacio_id_fkey FOREIGN KEY (espacio_id) REFERENCES practica02.espacios(id) NOT VALID;


--
-- TOC entry 3402 (class 2606 OID 33024)
-- Name: reservas reservas_persona_id_fkey; Type: FK CONSTRAINT; Schema: practica02; Owner: postgres
--

ALTER TABLE ONLY practica02.reservas
    ADD CONSTRAINT reservas_persona_id_fkey FOREIGN KEY (persona_id) REFERENCES practica02.personas(id) NOT VALID;


--
-- TOC entry 3389 (class 2606 OID 24819)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_alumno_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_alumno_id_fkey FOREIGN KEY (alumno_id) REFERENCES public.alumnos(id) NOT VALID;


--
-- TOC entry 3390 (class 2606 OID 24824)
-- Name: alumnos_asignaturas_inscripcion alumnos_asignaturas_inscripcion_asignatura_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alumnos_asignaturas_inscripcion
    ADD CONSTRAINT alumnos_asignaturas_inscripcion_asignatura_id_fkey FOREIGN KEY (asignatura_id) REFERENCES public.asignaturas(id) NOT VALID;


--
-- TOC entry 3400 (class 2606 OID 26408)
-- Name: emergencias emergencias_trabajador_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.emergencias
    ADD CONSTRAINT emergencias_trabajador_id_fkey FOREIGN KEY (trabajador_id) REFERENCES public.trabajadores(id) NOT VALID;


--
-- TOC entry 3388 (class 2606 OID 24814)
-- Name: productos_1 productos_1_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos_1
    ADD CONSTRAINT productos_1_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores_1(id) NOT VALID;


--
-- TOC entry 3387 (class 2606 OID 24729)
-- Name: productos productos_proveedor_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.productos
    ADD CONSTRAINT productos_proveedor_id_fkey FOREIGN KEY (proveedor_id) REFERENCES public.proveedores(id) ON UPDATE CASCADE ON DELETE CASCADE;


-- Completed on 2026-10-07 10:07:32

--
-- PostgreSQL database dump complete
--

