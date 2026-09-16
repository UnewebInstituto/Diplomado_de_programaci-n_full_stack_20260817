CREATE TABLE personas_con_indice(
    id int unsigned auto_increment,
    cedula varchar (10),
    nombre varchar (30),
    apellido varchar (30),
    direccion text,
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (id)
);

INSERT INTO personas_con_indice(cedula, nombre, apellido, direccion, correo_electronico, telefono, fecha_de_nacimiento, edad) VALUES
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51);

    -- SELECT a traves del indice

SELECT * FROM personas_con_indice WHERE id = 2;

    -- INSERT ERROR cuando se introduce un nuevo dato, pero el ID es identico a un ID pre-existente

INSERT INTO personas_con_indice(id, cedula, nombre, apellido, direccion, correo_electronico, telefono, fecha_de_nacimiento, edad) VALUES
(2, 'V6666', 'MAGDALUZ', 'MENDOZA', 'VALLE ABAJO', 'mm@gmail.com', '212334844444', '1968-01-04', 58);

    -- Clave primaria en un campo distinto
CREATE TABLE personas_con_indice_cedula(
    cedula varchar (10),
    nombre varchar (30),
    apellido varchar (30),
    direccion text,
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (cedula)
);
    -- Clave primaria es la cedula + correo
CREATE TABLE personas_con_indice_cedula_correo(
    cedula varchar (10),
    nombre varchar (30),
    apellido varchar (30),
    direccion text,
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned,
    primary key (cedula, correo_electronico)
);

    -- Tablas con claves foranea (FOREIGN KEY)

Create Table proveedores(
    id int unsigned auto_increment,
    nombre varchar(30),
    direccion text,
    telefono char(20),
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

Create Table productos(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30),
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
    foreign key (proveedor_id) references proveedores(id)
);

    -- FOREIGN KEY hace referencia a otra tabla.

INSERT INTO proveedores(nombre, direccion, telefono, correo_electronico) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

INSERT INTO productos(proveedor_id, nombre, cantidad, precio) VALUES
(1,'NEVERA',6,500.25),
(1,'COCINA',3,300.75),
(2,'LAVADORA',2,800.50),
(7,'AIRE ACONDICIONADO',4,600.75),
(7,'TELEVISOR',7,400.00),
(7,'LAPTOP',5,1200.00),
(2,'MICROONDAS',8,150.25),
(1,'LICUADORA',12,100.00),
(2,'PLANCHA',12,75.50),
(7,'VENTILADOR',12,50.00),
(1,'HORNO A GAS',6,450.00),
(2,'CAFETERA',12,250.00),
(7,'TOSTADORA',12,80.00);

    -- Consistencia en el almacenamiento de informacion a traves de la relacion entre tablas.
    -- Proveedor 4 no existe, entonces, produce una falla.

INSERT INTO productos(proveedor_id, nombre, cantidad, precio) VALUES
(4,'OLLA DE PRESION',10,200.00);

    -- Proveedor 1 tiene multiples referencias a si mismo en otra tabla. No se puede eliminar.
DELETE FROM proveedores WHERE id = 1;

DELETE FROM productos WHERE proveedor_id = 3;

SELECT * FROM productos;

    -- Cascade Delete


Create Table proveedores_cascada(
    id int unsigned auto_increment,
    nombre varchar(30),
    direccion text,
    telefono char(20),
    correo_electronico varchar(80),
    primary key (id),
    unique (correo_electronico)
);

Create Table productos_cascada(
    id int unsigned auto_increment,
    proveedor_id int unsigned,
    nombre varchar(30),
    cantidad int unsigned,
    precio numeric(13,2),
    primary key (id),
    foreign key (proveedor_id) references proveedores_cascada(id) on delete cascade on update cascade
);

    -- On Delete Cascade - On Update Cascade

INSERT INTO proveedores_cascada(nombre, direccion, telefono, correo_electronico) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

INSERT INTO productos_cascada(proveedor_id, nombre, cantidad, precio) VALUES
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

    -- Proveedor 3 tiene multiples referencias a si mismo en otra tabla.
    -- On Delete Cascade permite la eliminacion de una tabla, y los hijos ID en otra.
DELETE FROM proveedores_cascada WHERE id = 3;

    -- Proveedor 2 se actualiza a 4. Los hijos en otras tablas tambien se actualizan.
UPDATE proveedores_cascada SET id = 4 WHERE id = 2;

