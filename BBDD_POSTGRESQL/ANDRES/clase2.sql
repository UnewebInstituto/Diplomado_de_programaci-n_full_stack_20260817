 create table rrhh.personas(
 id serial, 
 nombre character varying(40),
 apellido character varying(40),
 fecha_nac date,
 direccion text,
 correo_electronico character varying(80),
 telefono character varying(20)[],
 primary key (id));

INSERT INTO public.personas(
    nombre, apellido, fecha_nac, direccion, correo_electronico, telefono)
	VALUES
	('YOLANDA','TORTOZA','1968-08-15','CATIA LA MAR','YT@GMAIL.COM',ARRAY['4149871234']),
    ('LIBIA','COLS','1970-09-20','GUARENAS','LC@GMAIL.COM',ARRAY['4145551234','2129871234']),
    ('MAIBA','ROMERO','1975-07-16','EL SILENCIO','MR@GMAIL.COM',ARRAY['4128881234','2123456789','2129876534']);

    INSERT INTO public.personas(
	nombre, apellido, fecha_nac, direccion, correo_electronico, telefono)
	VALUES
	('YOLANDA','TORTOZA','1968-08-15','CATIA LA MAR','YT@GMAIL.COM','{"4149871234"}'),
    ('LIBIA','COLS','1970-09-20','GUARENAS','LC@GMAIL.COM','{"4145551234","2129871234"}'),
    ('MAIBA','ROMERO','1975-07-16','EL SILENCIO','MR@GMAIL.COM','{"4128881234","2123456789","2129876534"}');

-- Caso inserción arreglos
(1)
VALUE '{"dato 1","dato 2","dato 3"}'

(2)
VALUE  ARRAY['dato 1','dato 2','dato 3']

-- PARA EFECTOS DE CONSULTA, CUENTA DESDE LA POSICIÓN 1
SELECT nombre as "Nombre",
       apellido as "Apellido",
       telefono[1] as "Teléfono Hab.",
       telefono[2] as "Teléfono Cel.",
       telefono[3] as "Teléfono Ofi." 
       from public.personas;

insert into public.proveedores_1(nombre, direccion,
    telefono, correo_electronico) values
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

insert into public.productos_1(proveedor_id, nombre,
    existencia, precio) values 
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

select public.proveedores_1.nombre as "Proveedor",
		public.productos_1.nombre as "Producto",
		public.productos_1.precio as "Precio",
		public.productos_1.cantidad as "Cantidad",
		from proveedores_1.productos_1
		where productos_1.proveedor_id

INSERT INTO public.alumnos(
	nombre, apellido)
	VALUES ('JOSE', 'MEDINA'),
	('RICARDO','SILVA'),
	('ANDRES','FRANCO');

INSERT INTO public.asignaturas(
	nombre)
	VALUES ('LÓGICA DE PROGRAMACIÓN'),
	('HTML5 NIVEL 1'),
	('HTML5 NIVEL 2'),
	('MYSQL'),
	('POSTGRESQL');

SELECT public.alumnos.nombre as "Nombre",
       public.alumnos.apellido as "Apellido",
	   public.asignaturas.nombre as "Asignatura",
	   public.alumnos_asignaturas_inscripcion.periodo as "Período"
	   from public.alumnos,
	        public.asignaturas,
			public.alumnos_asignaturas_inscripcion
	   where public.alumnos_asignaturas_inscripcion.alumno_id = public.alumnos.id and 
	   	     public.alumnos_asignaturas_inscripcion.asignatura_id = public.asignaturas.id;
	   