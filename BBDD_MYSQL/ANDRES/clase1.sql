-- INTERACCIÓN A TRAVÉS DE LA CONSOLA
-- 1) DESDE EL PANEL DE CONTROL DE XAMPP ACCEDER
-- A LA OPCIÓN "Shell". SE MUESTRA ALGO COMO LO
-- QUE SE OBSERVA ABAJO:
Setting environment for using XAMPP for Windows.
PROFESOR@WIN-CMUODTI144V c:\xampp
# mysql -u root -p -- <- COMANDO QUE DEBE ESCRIBIR
                 ^
                 |
                 +-- donde -p es PASSWORD
        ^
        |
        +-- donde -u es USUARIO y root es el 
         -- usuario de MAYOR NIVEL

-- EN ESTE CASO NO TIENE PASSWORD:
Setting environment for using XAMPP for Windows.
PROFESOR@WIN-CMUODTI144V c:\xampp
# mysql -u root -p
Enter password:
Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 8
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>

-- CREACIÓN DE BBDD
CREATE DATABASE db_andres;

-- CONSULTAR LAS BBDD PRESENTES EN EL SERVIDOR
-- (comando propio de mysql)
SHOW DATABASE LIKE '%parte del nombre a buscar%';

--Conexion a la BBDD
USE db_andres;
-- (comando propio de mysql)

--Abortar comando: Se escribe al final del comando \c
show database \c

--Acceder a la ayuda
help
\h

--Salir de la terminal de comandos:
quit

--Creación de tablas

CREATE TABLE nombre(
    nombre_campo tipo_de_dato(longitud_del_campo),
    nombre_campo tipo_de_dato(longitud_del_campo),
    nombre_campo tipo_de_dato(longitud_del_campo),
    ...
)

--Tipo de datos basicos:
char: longitud fija que puede ir de 1 a 255 caracteres,
contenido alfanumerico
varchar: longitud variable, contenido alfanumérico, cuya longitud va 
de 1 a aprox. 32000 caracteres (almacenamiento sólo ocupado por los
datos que se ingresaron),
integer: la declaracion se puede efectuar indicando longitud del entero
o usando los nombres reservados para dicha longitud, por ejemplo:
 * tinyint: Entero de 1 byte, que puede ser con signo
tinyint, su contenido puede ser desde -255 hasta 254
Y sin signo:
tinyint unsigned, su contenido pueder ser desde 0 hasta 255,
* smallint: con signo va desde aprox: -32000 hasta aprox: 32000
smallint unsigned, su contenido puede ser desede 0 hasta aprox. 65000
* int e int unsigned
* bigint y bigint unsigned
float,
numeric,
date,
text: contenido alfanumerico, donde se reserva almacenar de 1 caracter
hasta aproximadamente 32000 caracteres (almacenamiento sólo ocupado 
por los datos que se ingresaron),
otros,

create table personas(
    cedula varchar(10),
    nombre varchar(30),
    apellido varchar(30),
    direccion text,
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned
);

--Visualizar la estructura de una tabla:
describe personas;
-- (comando propio de mysql)

--Operaciones para la actualizacion del contenido
--de una tabla.
insert --Creacion de registros
select --Connsulta
update --Actualizacion
delete --Borrador

--Caso insert
insert into nombre_de_la_tabla(campo1,
campo2, ... , campo n)values
('valor1', 'valor2', ... , 'valor n');

--Por ejemplo
insert into personas(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad)values
('V1234', 'Ana', 'Vasquez', 'Santa Fe', 'av@gmail.com',
'2124445566', '1960-08-15', 66);

--Caso select
select * from personas; -- Visibilidad DE TODAS LAS COLUMNAS EN LA TABLA
select cedula, nombre, apellido from personas; -- Mostrar parte de las
--columnas;

--Carga masiva de varios registros:
insert into personas(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) values
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51),
('V9012','NELLY','CONTRERAS','LA VEGA', 'nc@gmail.com',
'2124434930','1968-07-16', 58),
('V3456','LIBIA','COLS','GUARENA', 'lc@gmail.com',
'2123634106','1975-05-20', 51);

--Consulta general del contenido de la tabla
select * from personas; --Ver todas las columnas de la tabla y todos los
--registros
select nombre, apellido, telefono from personas;

--Consulta condicionada del contenido de la tabla:
--Depende de la clausula where nombre_del_campo operador valor
--donde el operador es: >, >=, <, <=, =, <>
--donde se tiene operadores logicos:and, or, not
--and
-- P  Q  -> P and Q
-- V  V        V
-- V  F        F
-- F  V        F
-- F  F        F
-- OR
-- P  Q  -> P OR Q
-- V  V        V
-- V  F        V
-- F  V        V
-- F  F        F
-- NOT
-- P -> NOT P
-- V      F
-- F      V
select * from personas where edad >= 60;
select * from personas where telefono = '2124434930';
select * from personas where edad <> 51;
select * from personas where not (edad >= 60);
select * from personas 
where direccion = 'Santa Fe' or direccion = 'La Vega';

-- **********************************************************
SELECT * FROM personas 
WHERE NOT (direccion = 'Santa Fe' or direccion = 'La Vega');

--Es equivalente
SELECT * FROM personas 
WHERE direccion <> 'SANTA FE' AND direccion <> 'LA VEGA';
-- **********************************************************

select * from personas where telefono like '%212%';

SELECT * FROM personas WHERE fecha_de_nacimiento LIKE '%1975%';

-- Caso update: Consister en cambiar el valor contenido de un campo}
update personas set direccion = 'Las Clavellinas, Guarenas'
where cedula = 'V3456';

update personas set telefono = '4147776655'
where cedula = 'V5678';

--Este comando actualiza la edad en todos los registros a 22, 
--dado que no hay condicion
update personas set edad = 22;

UPDATE personas SET edad = 66 WHERE cedula = 'V1234';
UPDATE personas SET edad = 51 WHERE cedula = 'V5678';
UPDATE personas SET edad = 58 WHERE cedula = 'V9012';
UPDATE personas SET edad = 51 WHERE cedula = 'V3456';

--Caso Delete
--borrado condicionado:
DELETE FROM personas WHERE cedula = 'V1234';

--Borrado Total
--
--1ra.) Truncate nombre_de_la_tabla:
--Se reinicia el valor del índice (declarado auto_ increment)
--de la tabla.
--
--2da.) Delete from nombre_de_la_tabla:
-- Se mantiene el valor del índice (declarado auto_increment)
-- de la tabla.

DELETE FROM personas;
truncate personas;

--
--Modificar la estructura de una tabla
--

--Ver las tablas contenidas en la BBDD:
show tables;
--Comando propio de mysql

--Cambiar nombre de tabla:
--(es buena practica que el nombre de tabla sea en plural)
ALTER TABLE personas RENAME TO contactos;

--Consultar la estructura de la tabla:
Describe personas;
--Comando propio de mysql
-- O

show create table personas;
--Comando propio de mysql

--Cambiar en la tabla personas el campo 
--correo_electronico por email, conservando
--el mismo tipo de dato 
alter table personas CHANGE correo_electronico email varchar(80);

-- CAMBIAR EN LA TABLA personas el campo 
-- correo_electronico por email, cambiando
-- el tipo de dato
ALTER TABLE personas MODIFY email text;

-- AÑADIR UNA COLUMNA (CAMPO) EN LA TABLA:
-- por omisión la columna va al final
ALTER TABLE personas ADD COLUMN telefono_cel text;

alter table personas add column telefono_hab text after edad;

alter table personas add COLUMN telefono_ofi text first;

--Borrar columna de la tabla:
ALTER TABLE personas DROP COLUMN telefono_cel;
ALTER TABLE personas DROP COLUMN telefono_hab;
ALTER TABLE personas DROP COLUMN telefono_ofi;

--Eliminar una tabla
drop table personas;

--Copiado del show create table personas

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci

