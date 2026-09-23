-- FUNCIÓN

CREATE FUNCTION `cuadrado`(`arg_valor` INT) RETURNS INT NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER RETURN arg_valor*arg_valor;

-- 1RA. FORMA DE EJECUCIÓN
SELECT CUADRADO(9);


-- 2DA. FORMA DE EJECUCIÓN
SET @p0='9'; 
SELECT `cuadrado`(@p0) AS `cuadrado`;

-- PROCEDIMIENTO

CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta`(IN `arg_producto` TEXT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM PRODUCTOS WHERE nombre = arg_producto;

-- 1RA. FORMA DE EJECUCIÓN
SET @p0='COCINA';
CALL `consulta`(@p0);

-- 2DA. FORMA DE EJECUCIÓN
CALL consulta('NEVERA');

-- CREACIÓN DE USUARIOS
CREATE USER 'andres'@'localhost' IDENTIFIED VIA mysql_native_password USING '***';
GRANT SELECT ON *.* TO 'andres'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

INSERT INTO personas(cedula, nombre, apellido,
direccion, email, telefono, fecha_de_nacimiento,
edad) VALUES
('V1234','ANA','VASQUEZ','SANTA FE', 'av@gmail.com',
'2124445566','1960-08-15', 66);

DELETE FROM personas WHERE cedula = 'V1234';

UPDATE personas SET nombre = 'ANA MARIA'
WHERE cedula = 'V1234';

-- CONSULTA DE USUARIOS

SELECT User, Host FROM mysql.user;

-- CREACIÓN DE TRIGGER
-- insert
CREATE TRIGGER `auditoria1` AFTER INSERT ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro el ingreso de un registro en la tabla persona');
-- update
CREATE TRIGGER `auditoria2` AFTER UPDATE ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro la actualizacion de un registro en la tabla persona');
-- delete
CREATE TRIGGER `auditoria3` AFTER DELETE ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro la eliminacion de un registro en la tabla personas')

