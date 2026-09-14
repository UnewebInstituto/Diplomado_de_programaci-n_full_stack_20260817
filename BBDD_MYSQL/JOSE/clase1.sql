-- Interaccion a traves de la consola

/*

    1) Desde el panel de control de XAMPP
    opcion "Shell", se muestra lo siguiente

*/

Setting environment for using XAMPP for Windows.
PC1@WIN-CMUODTI144V c:\xampp
# mysql -u root -p -- Comando a escribir
                -- Password █ no hay passqord
        -- Usuario █ root es admin

>ENTER

Welcome to the MariaDB monitor.  Commands end with ; or \g.
Your MariaDB connection id is 9
Server version: 10.4.32-MariaDB mariadb.org binary distribution

Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.

Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.

MariaDB [(none)]>

███████████████████

-- Creacion de BBDD
CREATE DATABASE db_jose;

-- Para consultar las BBDD presentes en el servidor
SHOW DATABASE LIKE '%parte del nombre a buscar%';

-- Conexion, entrar a la BBDD
USE db_jose;

-- Abortar (Hide) un commando despues de ejecutarce
SHOW DATABASE \c -- or CLEAR

-- Acceder Ayuda
help
\h

-- Salir de una base de datos
quit

-- Crear tablas
CREATE TABLE nombre(
    nombre_campo tipo_de_campo(longitud_del_campo),
    nombre_campo tipo_de_campo(longitud_del_campo),
    nombre_campo tipo_de_campo(longitud_del_campo),
    . . .
)

-- Tipos de datos basicos
char,
    -- █ longitud fija - 1 a 255 caracteres - contenido alfanumerico - 
varchar,
    -- █ longitud variable - contenido alfanumerico - cuya longtd va de 1 a 32000 caracteres - almacenamiento solo ocupado por los datos que se ingresan
integer,
    -- █ puede tener signo MINUS, o ser unsigned. Se puede declarar indicando la longitud del entero, o usando los nombres reservados para la longitud. Ejemplo:
tinyint,
        -- █ Entero longitud 1 byte - puede tener signo MINUS, contenido es -255 a 254 - puede ser unsigned, contenido de 0 a 255
smallint,
        -- █ con signo MINUS, va desde -32000 a 32000 - unsigned, contenido de 0 a 65000
bigint,

float,
numeric,
date,
text,
    -- █ no se establece longitud - contenido alfanumerico - reserva almacenar de 1 a 32000 caracteres
-- (...) Otros

CREATE TABLE personas(
    cedula varchar (10),
    nombre varchar (30),
    apellido varchar (30),
    direccion text,
    correo_electronico varchar(80),
    telefono char(20),
    fecha_de_nacimiento date,
    edad tinyint unsigned
);

-- Visualizar la estructura de la tabla
DESCRIBE PERSONAS;

-- Actualizar el contenido de una tabla
INSERT
    -- █ Creacion de registro
SELECT
    -- █ Consulta
UPDATE
    -- █ Actualizacion
DELETE
    -- █ Borrado

    -- INSERT expanded
INSERT INTO nombre_de_la_tabla(campo1,campo2, ..., campo n) VALUES
('valor1', 'valor2', ..., 'valor n');

    -- INSERT ejemplo
INSERT INTO personas(cedula, nombre, apellido, direccion, correo_electronico, telefono, fecha_de_nacimiento, edad) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2224444555666', '1960-08-15', 66);

    -- INSERT carga masiva de varios registro
INSERT INTO personas(cedula, nombre, apellido, direccion, correo_electronico, telefono, fecha_de_nacimiento, edad) VALUES
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51);

    -- SELECT expanded
SELECT * FROM personas; -- Visualizar todas las columnas en tabla
SELECT cedula, nombre, apellido FROM personas; -- Visualizacion parcial
SELECT * FROM personas WHERE edad >= 60; -- Condicionada para administrar datos especificos
    -- █ Operadores relacionales: =, <, <=, >, >=, <>(diferente)
    -- █ Operadores logicos: AND, OR, NOT
    /*
        █ AND
        X Y -> X AND Y
        V V       V
        V F       F
        F F       F
        █ OR
        X Y -> X OR Y
        V V      V
        V F      V
        F F      F
        █ NOT
        X -> NOT X
        V        F
        F        V
    */
SELECT * FROM personas WHERE NOT (edad >= 60);
SELECT * FROM personas WHERE direccion <> 'SANTA FE' AND direccion <> 'LA VEGA';

    -- UPDATE expanded
UPDATE personas SET direccion = 'LAS CLAVELLINAS, GUARENAS' WHERE CEDULA = 'V3456';
UPDATE personas SET edad = 22; -- toda la columna se actualiza

    -- DELETE expanded
DELETE FROM personas WHERE cedula = 'V1234'; -- DELETE condicionado
TRUNCATE nombre_de_la_tabla; -- Full wipe
DELETE FROM nombre_de_la_tabla; -- Partial wipe

-- Modificar la estructura contenido de una tabla

show tables; -- Revela los nombres de tablas disponibles

-- Cambiar el nombre de una tabla
\h ALTER TABLE
ALTER TABLE personas RENAME TO contactos;
-- Accede a la tabla
DESCRIBE personas;
SHOW CREATE TABLE personas;

ALTER TABLE personas CHANGE correo_electronico email varchar(80); -- Cambiar nombre de un campo
ALTER TABLE personas MODIFY correo_electronico text; -- Cambiar tipo de dato
ALTER TABLE personas ADD COLUMN telefono_cel text -- Add una columna (campo) a la tabla, al final
ALTER TABLE personas ADD COLUMN telefono_hab text AFTER edad; -- AFTER edad
ALTER TABLE personas ADD COLUMN telefono_ofi text FIRST; -- First

-- Borrar una columna
ALTER TABLE personas DROP COLUMN telefono_cel;
ALTER TABLE personas DROP COLUMN telefono_hab;
ALTER TABLE personas DROP COLUMN telefono_ofi;

-- Eliminar tabla
DROP TABLE personas;

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci