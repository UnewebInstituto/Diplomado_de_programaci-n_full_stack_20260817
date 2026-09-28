-- Crear una base de datos
CREATE DATABASE db_profesor;

-- Conexión a base de datos postgresql
-- se realiza a través del comando psql
\c db_profesor;

-- Creación de tablas
CREATE TABLE personas(
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    correo varchar(60),
    telefono varchar(20),
    direccion text
);

-- Consulta detalles de la tabla
\d personas;

insert into personas(
    cedula, nombre, apellido,
    correo, telefono, direccion
) values
('V1234', 'ANA' , 'VASQUEZ',
'AV@GMAIL.COM', '414 1234567', 'SANTA FE');

-- Consultar las BBDD en el servidor
\l db* -- Lista las bbdd, cuyo nombre inicia con db

-- Creación de tabla con índice primario serial,
-- que es equivalente a: integer, auto_increment, unsigned

CREATE TABLE personas_serial(
    id serial,
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    correo varchar(60),
    telefono varchar(20),
    direccion text,
    primary key(id)
);

-- Listar tablas de una BBDD
\dt

-- Listar índices asociados a tablas secuenciales
\ds

-- Listar todas la entidades contenidas en la bbdd
\d

-- Listar vistas contenidas en la tabla
\dv

insert into personas_serial(
    cedula, nombre, apellido,
    correo, telefono, direccion
) values
('V1234', 'ANA' , 'VASQUEZ',
'AV@GMAIL.COM', '414 1234567', 'SANTA FE');

-- Creación de tablas asociadas

create table proveedores(
    id serial,
    nombre varchar(80),
    direccion text,
    telefono varchar(40),
    correo_electronico varchar(80),
    primary key(id)
);

create table productos(
    id serial,
    proveedor_id integer,
    nombre varchar(80),
    existencias integer,
    precio numeric(13,2),
    foreign key(proveedor_id) references proveedores(id) on delete cascade on update cascade
);

insert into proveedores(nombre, direccion,
    telefono, correo_electronico) values
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');

insert into productos(proveedor_id, nombre,
    existencias, precio) values 
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

-- Modificación de nombre de campo en una tabla
-- se renombra
alter table productos rename existencias to existencia;

\d personas; -- describe la tabla personas
-- Añadir columnas a una tabla
alter table personas add column telefono_ofi varchar(20);

alter table personas add column telefono_cel varchar(20);

-- Cambio de tipo de dato
alter table personas alter column telefono_cel SET DATA TYPE text; 

-- Eliminar columnas de una tabla
alter table personas drop column telefono_cel;
alter table personas drop column telefono_ofi;

-- Añadir clave primaria en tabla
alter table productos add primary key(id);

-- CONSULTA COMBINADA DE TABLAS
SELECT PROVEEDORES.NOMBRE,
       PRODUCTOS.NOMBRE,
       PRODUCTOS.PRECIO,
       PRODUCTOS.EXISTENCIA
       FROM PROVEEDORES, PRODUCTOS
       WHERE PRODUCTOS.PROVEEDOR_ID = PROVEEDORES.ID;

-- ALIAS A TABLAS Y NOMBRES DE CAMPO
-- POSTGRESQL, PERMITE LA DECLARACIÓN DE NOMBRES DE CAMPOS
-- Y ALIAS QUE INCLUYAN MAYÚSCULAS, MINÚSCULAS Y ESPACIOS
-- EN BLANCO, SI Y SÓLO SI, VAN ENTRE COMILLAS.
SELECT A.NOMBRE AS "Nombre del Proveedor",
       B.NOMBRE AS "Nombre del Producto",
       B.PRECIO AS "Precio",
       B.EXISTENCIA AS "Cantidad en Existencia"
       FROM PROVEEDORES AS A, PRODUCTOS AS B
       WHERE B.PROVEEDOR_ID = A.ID;

-- CREACIÓN DE VISTA A PARTIR DE CONSULTA CON ALIAS
-- DECLARADOS ENTRE COMILLAS DOBLES

CREATE VIEW vista_proveedores_productos AS 
SELECT A.NOMBRE AS "Nombre del Proveedor",
       B.NOMBRE AS "Nombre del Producto",
       B.PRECIO AS "Precio",
       B.EXISTENCIA AS "Cantidad en Existencia"
       FROM PROVEEDORES AS A, PRODUCTOS AS B
       WHERE B.PROVEEDOR_ID = A.ID;

select "Nombre del Producto", "Cantidad en Existencia", "Precio"
from vista_proveedores_productos;

-- INNER JOIN

SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES AS A 
       INNER JOIN PRODUCTOS AS B
       ON B.PROVEEDOR_ID = A.ID;

-- VISTA DEL INNER JOIN
CREATE VIEW VISTA_INNER_JOIN_PROVEEDORES_PRODUCTOS AS 
SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES AS A 
       INNER JOIN PRODUCTOS AS B
       ON B.PROVEEDOR_ID = A.ID;

-- Declaración de tablas proveedores_1 y productos_1 
-- para probar left join, right join y full join
--

create table proveedores_1(
    id serial,
    nombre varchar(80),
    direccion text,
    telefono varchar(40),
    correo_electronico varchar(80),
    primary key(id)
);

create table productos_1(
    id serial,
    proveedor_id integer,
    nombre varchar(80),
    existencias integer,
    precio numeric(13,2),
    primary key(id)
);

insert into proveedores_1(nombre, direccion,
    telefono, correo_electronico) values
('GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),
('LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),
('MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com'),
('ADMIRAL','AV. SAN MARTIN','2127112233','info@admiral.com'),
('CONDESA','AV. BARALT','2128112277','info@condesa.com'),
('WHIRPOOL','AV. VICTORIA','2129334455','info@whirpool.com');

insert into productos_1(proveedor_id, nombre,
    existencias, precio) values 
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
(11,'LICUADORA',12,100.00),
(12,'PLANCHA',12,75.50),
(10,'VENTILADOR',12,50.00),
(11,'HORNO A GAS',6,450.00),
(12,'CAFETERA',12,250.00),
(10,'TOSTADORA',12,80.00);

-- BORRA VISTA
DROP VIEW VISTA_LEFT_JOIN_PROVEEDORES_PRODUCTOS;

ALTER TABLE PRODUCTOS_1 RENAME EXISTENCIAS TO EXISTENCIA;

-- VISTA DEL LEFT JOIN
CREATE VIEW VISTA_LEFT_JOIN_PROVEEDORES_PRODUCTOS AS 
SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES_1 AS A 
       LEFT JOIN PRODUCTOS_1 AS B
       ON B.PROVEEDOR_ID = A.ID;

-- VISTA DEL RIGHT JOIN
CREATE VIEW VISTA_RIGHT_JOIN_PROVEEDORES_PRODUCTOS AS 
SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES_1 AS A 
       RIGHT JOIN PRODUCTOS_1 AS B
       ON B.PROVEEDOR_ID = A.ID;

-- VISTA DEL FULL JOIN
CREATE VIEW VISTA_FULL_JOIN_PROVEEDORES_PRODUCTOS AS 
SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES_1 AS A 
       LEFT JOIN PRODUCTOS_1 AS B
       ON B.PROVEEDOR_ID = A.ID
UNION
SELECT A.NOMBRE AS PROVEEDOR,
       B.NOMBRE AS PRODUCTO,
       B.PRECIO,
       B.EXISTENCIA
       FROM PROVEEDORES_1 AS A 
       RIGHT JOIN PRODUCTOS_1 AS B
       ON B.PROVEEDOR_ID = A.ID;

-- Columnas calculadas
SELECT SUM(campo);
SELECT MIN(campo);
SELECT MAX(campo);
SELECT AVG(campo);
SELECT COUNT(campo); -- Si no hay valor nulo
SELECT COUNT(*); -- Cuenta todas las filas

select sum("Precio") from vista_proveedores_productos;
select sum("Cantidad en Existencia") from vista_proveedores_productos;
SELECT MAX("Precio") from vista_proveedores_productos;
SELECT AVG("Precio") from vista_proveedores_productos;
SELECT ROUND(AVG("Precio"),2) from vista_proveedores_productos;
SELECT MIN("Precio") from vista_proveedores_productos;

-- Ordenamiento (por omisión es ascendente)
select * from vista_proveedores_productos order by "Precio";
select * from vista_proveedores_productos order by "Nombre del Proveedor" asc, "Precio" desc;

-- Ordenamiento descendente
select * from vista_proveedores_productos order by "Precio" desc;

-- Agrupamiento
select distinct "Nombre del Proveedor" from vista_proveedores_productos;

select "Nombre del Proveedor" from vista_proveedores_productos
group by "Nombre del Proveedor";

select "Nombre del Proveedor", 
       round(avg("Precio"),2) as "Precio Promedio", 
       sum("Cantidad en Existencia") as "Cantidad en Existencia"
       from vista_proveedores_productos
       group by "Nombre del Proveedor";

-- CRUD
-- CREATE ...: INSERT
-- READ   ...: SELECT
-- UPDATE ...: UPDATE
-- DELETE ...: DELETE

INSERT INTO personas_serial(cedula, nombre,
    apellido, correo, telefono, direccion)
values
('V5678','YOLANDA','TORTOZA','YT@GMAIL.COM','4149871234','CATIA LA MAR'),
('V9012','LIBIA','COLS','LC@GMAIL.COM','4145551234','GUARENAS'),
('V8765','MAIBA','ROMERO','MR@GMAIL.COM','4128881234','EL SILENCIO');

SELECT * FROM PERSONAS_SERIAL;

UPDATE personas_serial SET DIRECCION = 'GUATIRE'
WHERE CEDULA = 'V9012';

DELETE FROM PERSONAS_SERIAL WHERE CEDULA = 'V1234';


En PostgreSQL, la herramienta estándar y más potente para el respaldo (dump) y la recuperación es **`pg_dump`** para la copia de seguridad y **`psql`** o **`pg_restore`** para la restauración. A diferencia de MySQL (donde a menudo se usa `mysqldump` con texto plano), PostgreSQL ofrece formatos más flexibles y compresión nativa.

Aquí tienes una guía práctica con los comandos esenciales:

---

### 1. Respaldo (Backup)

#### A. Respaldo de una base de datos completa en formato personalizado (Recomendado)

Este formato (`-F c`) comprime el respaldo y permite la restauración selectiva de tablas o esquemas usando `pg_restore`.

```bash
pg_dump -U nombre_usuario -h host -d nombre_bd -F c -b -v -f archivo_respaldo.dump

```

#### B. Respaldo en formato de texto plano (SQL)

Crea un archivo con las sentencias SQL puras (similar a `mysqldump`). Es útil si necesitas leer el contenido o editarlo manualmente.

```bash
pg_dump -U nombre_usuario -h host -d nombre_bd -F p -v -f script_respaldo.sql

```

#### C. Respaldo de *todas* las bases de datos del servidor (Cluster completo)

Utiliza la herramienta `pg_dumpall` para respaldar roles, espacios de nombres y todas las bases de datos:

```bash
pg_dumpall -U postgres -h host -f backup_global_completo.sql

```

---

### 2. Recuperación (Restore)

#### A. Restaurar un respaldo en formato personalizado (`.dump`)

Se realiza utilizando la herramienta `pg_restore`. Es recomendable crear primero la base de datos vacía.

```bash
# Crear la base de datos (si no existe)
createdb -U nombre_usuario -h host nueva_bd

# Restaurar el archivo dump
pg_restore -U nombre_usuario -h host -d nueva_bd -v archivo_respaldo.dump

```

#### B. Restaurar un respaldo en texto plano (`.sql`)

Se utiliza el cliente interactivo `psql`:

```bash
psql -U nombre_usuario -h host -d nombre_bd -f script_respaldo.sql

```

---

### Parámetros comunes muy útiles:

* `-U`: Especifica el usuario de la base de datos.
* `-h`: Indica el host o servidor (ej. `localhost` o una IP).
* `-p`: Puerto (por defecto PostgreSQL usa el `5432`).
* `-v`: Modo *verbose* (muestra en pantalla el progreso detallado).

¿Estás migrando de MySQL a PostgreSQL o necesitas automatizar algún proceso de respaldo en particular?