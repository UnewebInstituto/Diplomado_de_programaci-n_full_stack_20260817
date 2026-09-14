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
CREATE DATABASE db_profesor;

-- CONSULTAR LAS BBDD PRESENTES EN EL SERVIDOR
-- (comando propio de mysql)
SHOW DATABASE LIKE '%parte del nombre a buscar%';

-- CONEXIÓN A LA BBDD
USE db_profesor;
-- (comando propio de mysql)

-- ABORTAR COMANDO: SE ESCRIBE AL FINAL DEL COMANDO \c
show database \c

-- ACCEDER A LA AYUDA
help
\h

-- SALIR DE LA TERMINAL DE COMANDOS:
quit

-- CREACIÓN DE TABLAS

CREATE TABLE nombre(
    nombre_campo tipo_de_dato(longitud_del_campo),
    nombre_campo tipo_de_dato(longitud_del_campo),
    nombre_campo tipo_de_dato(longitud_del_campo),
    ...
)

-- TIPOS DATOS BÁSICOS:
char: longitud fija que puede ir de 1 a 255 caracteres, 
contenido alfanumerico.
varchar: longitud variable, contenido alfanumérico, cuya longitud va 
de 1 a aprox. 32000 caracteres (almacenamiento sólo ocupado por los
datos que se ingresaron),
integer: la declaración se puede efectuar indicando longitud del entero
o usando los nombres reservados para dicho longitud, por ejemplo:
* tinyint : Entero de longitud 1 byte, que puede ser con signo
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

-- VISUALIZAR LA ESTRUCTURA DE UNA TABLA:
describe personas;
-- (comando propio de mysql)

-- OPERACIONES PARA LA ACTUALIZACIÓN DEL CONTENIDO
-- DE UNA TABLA. 
INSERT  -- CREACIÓN DE REGISTRO
SELECT  -- CONSULTA 
UPDATE  -- ACTUALIZACIÓN 
DELETE  -- BORRADO

-- CASO INSERT
INSERT INTO nombre_de_la_tabla(campo1,
campo2, ... , campo n) VALUES 
('valor1', 'valor2', ... , 'valor n');

-- Por ejemplo:
INSERT INTO personas(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V1234','ANA','VASQUEZ','SANTA FE', 'av@gmail.com',
'2124445566','1960-08-15', 66);

-- CASO SELECT
SELECT * FROM personas; -- VISIBILIDAD DE TODAS LAS COLUMNAS EN LA TABLA
SELECT cedula, nombre, apellido FROM personas; -- MOSTRAR PARTE DE LAS COLUMNAS;

-- CARGA MASIVA DE VARIOS REGISTROS:
INSERT INTO personas(cedula, nombre, apellido,
direccion, correo_electronico, telefono, fecha_de_nacimiento,
edad) VALUES
('V5678','YOLANDA','TORTOZA','CATIA LA MAR', 'yt@gmail.com',
'2123334455','1975-09-10', 51),
('V9012','NELLY','CONTRERAS','LA VEGA', 'nc@gmail.com',
'2124434930','1968-07-16', 58),
('V3456','LIBIA','COLS','GUARENA', 'lc@gmail.com',
'2123634106','1975-05-20', 51);

-- CONSULTA GENERAL DEL CONTENIDO DE LA TABLA
SELECT * FROM personas; -- Ver todas las columnas de la tabla y todos los registros
SELECT nombre, apellido, telefono FROM personas;

-- CONSULTA CONDICIONADA DEL CONTENIDO DE LA TABLA.
-- DEPENDE DE LA CLAUSULA WHERE nombre_del_campo OPERADOR valor
-- DONDE EL OPERADOR RELACIONAL ES: >, >=, <, <=, =, <>
-- DONDE SE TIENEN OPERADORES LÓGICOS: AND, OR, NOT
-- AND
-- P  Q  -> P AND Q
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

SELECT * FROM personas WHERE edad >= 60;
SELECT * FROM personas WHERE telefono = '2124434930';
SELECT * FROM personas WHERE edad <> 51;
SELECT * FROM personas WHERE NOT (edad >= 60);
SELECT * FROM personas 
WHERE direccion = 'SANTA FE' OR direccion = 'LA VEGA';

-- ***********************************************
SELECT * FROM personas 
WHERE NOT (direccion = 'SANTA FE' OR direccion = 'LA VEGA');

-- ES EQUIVALENTE 

SELECT * FROM personas 
WHERE direccion <> 'SANTA FE' AND direccion <> 'LA VEGA';
-- ***********************************************

SELECT * FROM personas WHERE telefono LIKE '%212%';

SELECT * FROM personas WHERE fecha_de_nacimiento LIKE '%1975%';

-- CASO UPDATE: CAMBIAR EL VALOR CONTENIDO DE UN CAMPO}
UPDATE personas SET direccion = 'LAS CLAVELLINAS, GUARENAS'
WHERE CEDULA = 'V3456';
