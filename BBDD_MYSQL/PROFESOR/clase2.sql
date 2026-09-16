-- Creación de base de datos temporal para prueba 
-- de recuperación de datos en caso de pérdida de
-- la base de datos original.
create database db_profesor_tmp;

create table personas_con_indice(
    id int unsigned auto_increment,
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    direccion text, 
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (id)
);

INSERT INTO personas_con_indice(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51),
('V9012','NELLY','CONTRERAS','LA VEGA', 'nc@gmail.com',
'2124434930','1968-07-16', 58),
('V3456','LIBIA','COLS','GUARENAS', 'lc@gmail.com',
'2123634106','1975-05-20', 51);

-- consulta a través del valor del índice;
select * from personas_con_indice where id = 2;

-- Se intenta ingresar un nuevo registro con un valor de índice que ya existe, lo cual genera un error.
insert into personas_con_indice(id,cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
(2,'V9898','MAGDALUZ','MENDOZA','VALLE ABAJO', 'mm@gmail.com',
'2129871234','1968-01-04', 58);

-- Definción de clave primaria de un campo distinto al índice, en este caso la cédula.
create table personas_con_indice_cedula(
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    direccion text, 
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (cedula)
);

INSERT INTO personas_con_indice_cedula(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51),
('V9012','NELLY','CONTRERAS','LA VEGA', 'nc@gmail.com',
'2124434930','1968-07-16', 58),
('V3456','LIBIA','COLS','GUARENAS', 'lc@gmail.com',
'2123634106','1975-05-20', 51);

-- Ejemplo de error al intentar ingresar un nuevo registro con un valor de cédula que ya existe, lo cual genera un error.

INSERT INTO personas_con_indice_cedula(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51);

-- Definición de clave primaria compuesta por dos campos, en este caso la cédula y el correo electrónico.
create table personas_con_indice_cedula_correo(
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    direccion text, 
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (cedula, correo_electronico)
);

INSERT INTO personas_con_indice_cedula_correo(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51),
('V9012','NELLY','CONTRERAS','LA VEGA', 'nc@gmail.com',
'2124434930','1968-07-16', 58),
('V3456','LIBIA','COLS','GUARENAS', 'lc@gmail.com',
'2123634106','1975-05-20', 51);

-- Casos de Excepción al intentar ingresar un nuevo registro con un valor de cédula y correo electrónico que ya existen, lo cual genera un error.

INSERT INTO personas_con_indice_cedula_correo(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt1@gmail.com',
'2123334455','1975-09-10', 51),
('V56781','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51);

-- Motivo de error, dado que cédula y correo electrónico ya existen en la tabla.
INSERT INTO personas_con_indice_cedula_correo(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51);


-- Creación de tablas con clave foranea, para establecer relaciones entre tablas.
-- Correo electrónico único en la tabla proveedores, para evitar duplicidad de registros.
create table proveedores(
    id int unsigned auto_increment,
    nombre varchar(30), 
    direccion text,
    telefono char(20),  
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

create table productos(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30), 
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
    foreign key (proveedor_id) references proveedores(id)
);

-- Carga de datos en la tabla proveedores.
INSERT INTO proveedores(nombre, direccion, telefono, correo_electronico) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

INSERT INTO productos(proveedor_id, nombre, cantidad, precio) VALUES
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

-- CONSISTENCIA EN EL ALMACENAMIENTO DE DATOS, A TRAVÉS DE LA RELACIÓN ENTRE TABLAS.

-- Se intenta ingresar un nuevo registro en la tabla productos con un valor de proveedor_id que no existe en la tabla proveedores, lo cual genera un error.
-- Proveedor cuyo id = 4 no existe en la tabla proveedores, por lo que se genera un error de integridad referencial.
INSERT INTO productos(proveedor_id, nombre, cantidad, precio) VALUES
(4,'OLLA DE PRESIÓN',10,200.00);

-- Se intenta eliminar un registro de la tabla proveedores que tiene registros relacionados en la tabla productos, lo cual genera un error.
-- Proveedor cuyo id = 1 tiene registros relacionados en la tabla productos, por lo que se genera un error de integridad referencial.
delete from proveedores where id = 1;

-- Se cambia el valor del id en la tabla proveedores.
update proveedores set id = 4 where id = 1;

-- No puede actualizar el valor del id en la tabla proveedores, ya que tiene registros relacionados en la tabla productos, lo cual genera un error de integridad referencial.
update proveedores set id = 5 where id = 1;

create table proveedores_cascade(
    id int unsigned auto_increment,
    nombre varchar(30), 
    direccion text,
    telefono char(20),  
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

create table productos_cascade(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30), 
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
    foreign key (proveedor_id) references proveedores_cascade(id) on delete cascade on update cascade
);

-- Carga de datos en la tabla proveedores.
INSERT INTO proveedores_cascade(nombre, direccion, telefono, correo_electronico) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

INSERT INTO productos_cascade(proveedor_id, nombre, cantidad, precio) VALUES
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

-- Eliminación de un registro de la tabla proveedores_cascade que tiene registros relacionados en la tabla productos_cascade, lo cual genera una eliminación en cascada.
delete from proveedores_cascade where id = 3;

-- Actualización de un registro de la tabla proveedores_cascade que tiene registros relacionados en la tabla productos_cascade, lo cual genera una actualización en cascada.
update proveedores_cascade set id = 4 where id = 2;