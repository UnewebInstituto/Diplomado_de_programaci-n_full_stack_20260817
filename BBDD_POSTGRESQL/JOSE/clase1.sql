    --  Contrasena

123456

    --  Crear BBDD
CREATE DATABASE db_jose;

    --  Conexion a la BBDD creada
\c db_jose

    -- Creacion de tablas
CREATE TABLE personas(
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    correo varchar(60),
    telefono varchar(20),
    direccion text
);

    -- Consulta de tabla creada
\d personas;

    -- Insertar registros en la tabla
INSERT INTO personas(cedula, nombre, apellido, correo, telefono, direccion) VALUES
('V1234', 'ANA', 'VASQUEZ', 'AV@GMAIL.COM', '414 1234567', 'SANTA FE');

    -- Consultar esta entrada
SELECT * FROM personas

    -- Consultar las BBDD en el servidor
\l db* -- Lista las BBDD cuyo nombre empiezan por db

    --  Crear tabla con indice primario serial
    -- Serial: integer, auto_increment, unsigned
CREATE TABLE personas_serial(
    id SERIAL,
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    correo varchar(60),
    telefono varchar(20),
    direccion text,
    PRIMARY KEY(id)
);

    -- Listar tablas de una BBDD
\dt

    -- Listar indices asociados a tablas secuenciales
\ds

    -- Listar todas las entidades en la BBDD
\d

    -- Listar vistas contenidas en la BBDD
\dv

INSERT INTO personas_serial(cedula, nombre, apellido, correo, telefono, direccion) VALUES
('V1234', 'ANA', 'VASQUEZ', 'AV@GMAIL.COM', '414 1234567', 'SANTA FE');

    -- Creacion de tablas asociadas
    -- proveedores y productos
CREATE TABLE proveedores(
    id SERIAL,
    nombre varchar(80),
    direccion text,
    telefono varchar(40),
    correo varchar(80),
    PRIMARY KEY (id)
);
CREATE TABLE productos(
    id SERIAL,
    proveedor_id integer,
    nombre varchar(80),
    cantidad integer,
    precio numeric(13,2),
    FOREIGN KEY(proveedor_id) REFERENCES proveedores(id) ON DELETE CASCADE ON UPDATE CASCADE
);

INSERT INTO proveedores(nombre, direccion, telefono, correo) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),
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

    -- Alteracion de una tabla
ALTER TABLE productos RENAME cantidad TO existencias;
ALTER TABLE productos RENAME existencias TO cantidad;

    -- Agregar columnas a una tabla existente
ALTER TABLE personas ADD COLUMN telefono_ofi varchar(40);
ALTER TABLE personas ADD COLUMN telefono_cel varchar(40);

    -- Cambio de tipo de dato en una columna existente
ALTER TABLE personas ALTER COLUMN telefono_cel SET DATA TYPE text;

    -- Eliminar columnas
ALTER TABLE personas DROP COLUMN telefono_cel;
ALTER TABLE personas DROP COLUMN telefono_ofi;
\d personas

    -- Anadir PRIMARY KEY
ALTER TABLE productos ADD PRIMARY KEY (id);

    -- Consulta combinada de tablas
SELECT * FROM proveedores;
SELECT * FROM productos;

SELECT  proveedores.nombre,
        productos.nombre,
        productos.precio,
        productos.cantidad
        FROM proveedores, productos
        WHERE productos.proveedor_id = proveedores.id;

    -- Alias 'A' tablas y nombres de campo
    -- (PostgreSQL puede declarar nombres y aliases con mayus, minus, y espacios)
    -- (Solo dentro de dobles comillas)
SELECT  A.nombre AS "Nombre del Proveedor",
        B.nombre AS "Nombre del Producto",
        B.precio AS "Precio",
        B.cantidad AS "Cantidad en Existencia"
        FROM proveedores AS A, productos AS B
        WHERE B.proveedor_id = A.id;

    -- Creacion de vistas, consultas con aliase declarado en comillas
CREATE VIEW vista_proveedores_productos AS
SELECT  A.nombre AS "Nombre del Proveedor",
        B.nombre AS "Nombre del Producto",
        B.precio AS "Precio",
        B.cantidad AS "Cantidad en Existencia"
        FROM proveedores AS A, productos AS B
        WHERE B.proveedor_id = A.id;

SELECT "Nombre del Producto", "Cantidad en Existencia", "Precio"
FROM vista_proveedores_productos;

    --  INNER JOIN

SELECT  proveedores.nombre AS PROVEEDOR,
        productos.nombre AS PRODUCTO,
        productos.precio,
        productos.cantidad
        FROM proveedores
        INNER JOIN productos
        ON productos.proveedor_id = proveedores.id;

CREATE VIEW vista_inner_join_proveedores_productos AS
SELECT  proveedores.nombre AS PROVEEDOR,
        productos.nombre AS PRODUCTO,
        productos.precio,
        productos.cantidad
        FROM proveedores
        INNER JOIN productos
        ON productos.proveedor_id = proveedores.id;

    -- LEFT JOIN
CREATE TABLE proveedores_1(
    id SERIAL,
    nombre varchar(80),
    direccion text,
    telefono varchar(40),
    correo varchar(80),
    PRIMARY KEY (id)
);
CREATE TABLE productos_1(
    id SERIAL,
    proveedor_id integer,
    nombre varchar(80),
    cantidad integer,
    precio numeric(13,2),
    PRIMARY KEY(id)
);

INSERT INTO proveedores_1(nombre, direccion, telefono, correo) VALUES
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com'),
('ADMIRAL','AV. SAN MARTIN','2127112233','info@ad.com'),
('CONDESA','AV. BARALT','2128222277','info@con.com'),
('WHIRPOOL','AV. VICTORIA','2129334455','info@wp.com');

INSERT INTO productos_1(proveedor_id, nombre, cantidad, precio) VALUES
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
(3,'TOSTADORA',12,80.00),
(10,'NEVERA',6,500.25),
(11,'COCINA',3,300.75),
(12,'LAVADORA',2,800.50),
(13,'AIRE ACONDICIONADO',4,600.75),
(13,'TELEVISOR',7,400.00),
(13,'LAPTOP',5,1200.00),
(12,'MICROONDAS',8,150.25),
(11,'LICUADORA',12,100.00),
(12,'PLANCHA',12,75.50),
(13,'VENTILADOR',12,50.00),
(11,'HORNO A GAS',6,450.00),
(12,'CAFETERA',12,250.00),
(13,'TOSTADORA',12,80.00);

CREATE VIEW vista_left_join_proveedores_productos_1 AS
SELECT  A.nombre AS PROVEEDOR,
        B.nombre AS PRODUCTO,
        B.precio,
        B.cantidad
        FROM proveedores_1 AS A
        LEFT JOIN productos_1 AS B
        ON B.proveedor_id = A.id;

    -- Borrar vista
DROP VIEW vista_left_join_proveedores_productos_1;

    -- RIGHT JOIN
CREATE VIEW vista_right_join_proveedores_productos_1 AS
SELECT  A.nombre AS PROVEEDOR,
        B.nombre AS PRODUCTO,
        B.precio,
        B.cantidad
        FROM proveedores_1 AS A
        RIGHT JOIN productos_1 AS B
        ON B.proveedor_id = A.id;

    -- FULL JOIN
CREATE VIEW vista_full_join_proveedores_productos_1 AS
SELECT  A.nombre AS PROVEEDOR,
        B.nombre AS PRODUCTO,
        B.precio,
        B.cantidad
        FROM proveedores_1 AS A
        LEFT JOIN productos_1 AS B
        ON B.proveedor_id = A.id
UNION
SELECT  A.nombre AS PROVEEDOR,
        B.nombre AS PRODUCTO,
        B.precio,
        B.cantidad
        FROM proveedores_1 AS A
        RIGHT JOIN productos_1 AS B
        ON B.proveedor_id = A.id;

    -- Columnas calculadas
SELECT SUM(campo);
SELECT MIN(campo);
SELECT MAX(campo);
SELECT AVG(campo);
SELECT COUNT(campo); -- Si no hay valor nulo
SELECT COUNT(*); -- Cuenta todas las filas

SELECT SUM("Precio") FROM vista_proveedores_productos;
SELECT SUM("Cantidad en Existencia") FROM vista_proveedores_productos;

SELECT MAX("Precio") FROM vista_proveedores_productos;
SELECT AVG("Precio") FROM vista_proveedores_productos;
SELECT ROUND(AVG("Precio"),2) FROM vista_proveedores_productos;
SELECT MIN("Precio") FROM vista_proveedores_productos;

    -- Ordenamiento (default ascedente)
SELECT * FROM vista_proveedores_productos ORDER BY "Precio";
SELECT * FROM vista_proveedores_productos ORDER BY "Precio" desc;

SELECT * FROM vista_proveedores_productos ORDER BY "Nombre del Proveedor" asc, "Precio" desc;

    -- Agrupamiento
SELECT DISTINCT "Nombre del Proveedor" FROM vista_proveedores_productos;
SELECT "Nombre del Proveedor" FROM vista_proveedores_productos GROUP BY "Nombre del Proveedor";

SELECT "Nombre del Proveedor",
        ROUND(AVG("Precio"),2) as "Precio Promedio",
        SUM("Cantidad en Existencia") as "Cantidad de Items"
        FROM vista_proveedores_productos
        GROUP BY "Nombre del Proveedor";

    -- CRUD
    -- CREATE (INSERT)
    -- READ (SELECT)
    -- UPDATE (UPDATE)
    -- DELETE (DELETE)

INSERT INTO personas_serial(cedula, nombre, apellido, correo, telefono, direccion) VALUES
('V5678','YOLANDA','TORTOZA','YT@GMAIL.COM','4149871234','CATIA LA MAR'),
('V9012','LIBIA','COLS','LC@GMAIL.COM','4145551234','GUARENAS'),
('V8765','MAIBA','ROMERO','MR@GMAIL.COM','4128881234','EL SILENCIO');

UPDATE personas_serial SET direccion = 'GUATIRE' WHERE cedula = 'V9012';

DELETE FROM personas_serial WHERE cedula = 'V1234';