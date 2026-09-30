
create table personas(


)


id               | integer                 |              | not null | nextval('personas_id_seq'::regclass)
 nombre           | character varying(40)   |              |          |
 apellido         | character varying(40)   |              |          |
 fecha_nacimiento | date                    |              |          |
 direccion        | text                    |              |          |
 correo           | character varying(80)   |              |          |
 telefono         | character varying(20)[] |              |          |

  create table personas(
 id serial, 
 nombre character varying(40),
 apellido character varying(40),
 fecha_nac date,
 direccion text,
 correo_electronico character varying(80),
 telefono character varying(20)[],
 primary key (id));

 INSERT INTO public.personas(nombre, apellido, fecha_nacimiento, direccion, correo, telefono) VALUES
	('YOLANDA','TORTOZA','1968-08-15','CATIA LA MAR','YT@GMAIL.COM',ARRAY['4149871234']),
    ('LIBIA','COLS','1978-09-28','GUARENAS','LC@GMAIL.COM',ARRAY['4145551234','2129871234']),
    ('MAIBA','ROMERO','1975-07-16','EL SILENCIO' ,'MR@GMAIL.COM',ARRAY['4128881234','2123456789','2129876534']);

 INSERT INTO public.personas(nombre, apellido, fecha_nacimiento, direccion, correo, telefono) VALUES
	('YOLANDA','TORTOZA','1968-08-15','CATIA LA MAR','YT@GMAIL.COM','{"4149871234"}'),
    ('LIBIA','COLS','1978-09-28','GUARENAS','LC@GMAIL.COM','{"4145551234","2129871234"}'),
    ('MAIBA','ROMERO','1975-07-16','EL SILENCIO' ,'MR@GMAIL.COM','{"4128881234","2123456789","2129876534"}');

    --Consultando ARRAYs de una tabla 
SELECT telefono[1], telefono[2], telefono[3] FROM public.personas;

SELECT  nombre AS "NOMBRE",
        apellido AS "APELLIDO",
        telefono[1] AS "TELF", 
        telefono[2] AS "TELF CASA", 
        telefono[3] AS "TELF OFICINA"
        FROM public.personas;

-- ███ CREATED WITH POSTGRESQL ███
CREATE TABLE public.proveedores
(
    id serial,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo character varying(80),
    PRIMARY KEY (id)
);

ALTER TABLE IF EXISTS public.proveedores
    OWNER to postgres;

CREATE TABLE public.productos
(
    id serial,
    proveedor_id integer,
    nombre character varying(80),
    cantidad integer,
    precio numeric(13, 2),
    PRIMARY KEY (id),
    FOREIGN KEY (proveedor_id)
        REFERENCES public.proveedores (id) MATCH SIMPLE
        ON UPDATE CASCADE
        ON DELETE CASCADE
        NOT VALID
);

ALTER TABLE IF EXISTS public.productos
    OWNER to postgres;
-- ███                         ███


-- ███ CREATED WITH POSTGRESQL ███
BEGIN;
CREATE TABLE IF NOT EXISTS public.proveedores_1
(
    id serial,
    nombre character varying(80),
    direccion text,
    telefono character varying(40),
    correo character varying(80),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.productos_1
(
    id serial,
    proveedor_id integer,
    nombre character varying(80),
    cantidad integer,
    precio numeric(13, 2),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.alumno
(
    id serial,
    nombre character varying(80),
    apellido character varying(80),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.asignaturas
(
    id serial,
    nombre character varying(80),
    PRIMARY KEY (id)
);

CREATE TABLE IF NOT EXISTS public.alumnos_asignaturas_inscripcion
(
    alumno_id integer,
    asignatura_id integer,
    periodo smallint,
    PRIMARY KEY (alumno_id, asignatura_id, periodo)
);

ALTER TABLE IF EXISTS public.productos_1
    ADD FOREIGN KEY (proveedor_id)
    REFERENCES public.proveedores_1 (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.alumnos_asignaturas_inscripcion
    ADD FOREIGN KEY (alumno_id)
    REFERENCES public.alumno (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;


ALTER TABLE IF EXISTS public.alumnos_asignaturas_inscripcion
    ADD FOREIGN KEY (asignatura_id)
    REFERENCES public.asignaturas (id) MATCH SIMPLE
    ON UPDATE NO ACTION
    ON DELETE NO ACTION
    NOT VALID;

END;
-- ███                         ███

INSERT INTO public.proveedores_1(nombre, direccion, telefono, correo) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

INSERT INTO public.productos_1(proveedor_id, nombre, cantidad, precio) VALUES
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(3,'AIRE ACONDICIONADO',4,600.75),
(3,'TELEVISOR',7,400.00),
(3,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(3,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(3,'TOSTADORA',12,80.00);

-- ███ CREATED WITH POSTGRESQL ███
CREATE VIEW public."vista_proveedores1-productos_1"
 AS
SELECT public.proveedores_1.nombre AS "Proveedor",
		public.productos_1.nombre AS "Producto",
		public.productos_1.precio AS "Precio",
		public.productos_1.cantidad AS "Cantidad"
		FROM public.proveedores_1, public.productos_1
		WHERE public.productos_1.proveedor_id = public.proveedores_1.id;

ALTER TABLE public."vista_proveedores1-productos_1"
    OWNER TO postgres;
-- ███                         ███

INSERT INTO public.alumnos_asignaturas_inscripcion(
	alumno_id, asignatura_id, periodo)
	VALUES
(1, 2, 2026),
(1, 3, 2026),
(1, 1, 2026),
(2, 2, 2026),
(2, 3, 2026),
(2, 4, 2026),
(3, 1, 2026),
(3, 4, 2026),
(3, 5, 2026);

SELECT 	public.alumnos.nombre AS "NOMBRE",
		public.alumnos.apellido AS "APELLIDO",
		public.asignaturas.nombre AS "ASIGNATURA",
		public.alumnos_asignaturas_inscripcion.periodo AS "PERIODO"
		FROM public.alumnos, public.asignaturas, 
		public.alumnos_asignaturas_inscripcion
		WHERE public.alumnos_asignaturas_inscripcion.alumnos_id = 
		public.alumnos.id
		AND public.alumnos_asignaturas_inscripcion.asignaturas_id = 
		public.asignaturas.id;