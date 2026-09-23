

    -- Create Function
CREATE FUNCTION `cuadrado`(`arg_valor` INT) RETURNS INT NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER RETURN arg_valor*arg_valor;

CREATE DEFINER=`root`@`localhost` FUNCTION `cuadrado`(`arg_valor` INT) RETURNS int(11)
RETURN arg_valor*arg_valor

    -- Call Function
SELECT cuadrado(9);

SET @p0='9'; 
SELECT `cuadrado`(@p0) AS `cuadrado`;

    -- Create Procedure
CREATE PROCEDURE `consulta`(IN `arg_producto` TEXT) NOT DETERMINISTIC CONTAINS SQL SQL SECURITY DEFINER SELECT * FROM productos_secuencial WHERE nombre = arg_producto;

    -- Call Procedure
CALL consulta('cocina');

SET @p0='cocina'; CALL `consulta`(@p0);

    -- Creacion de usuarios
CREATE USER 'jose_1'@'localhost' IDENTIFIED VIA mysql_native_password USING '***';GRANT SELECT ON *.* TO 'jose_1'@'localhost' REQUIRE NONE WITH MAX_QUERIES_PER_HOUR 0 MAX_CONNECTIONS_PER_HOUR 0 MAX_UPDATES_PER_HOUR 0 MAX_USER_CONNECTIONS 0;

    -- Creacion de un disparador
    -- Insert
CREATE TRIGGER `audit_insert` AFTER INSERT ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se registro un ingreso en la tabla personas');
    -- Update
CREATE TRIGGER `audit_update` AFTER UPDATE ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se actualizo un registro en la tabla personas');
    -- Delete
CREATE TRIGGER `audit_delete` AFTER DELETE ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se elimino un registro en la tabla personas');

INSERT INTO personas(cedula, nombre, apellido, direccion, correo_electronico, telefono, fecha_de_nacimiento, edad) VALUES
('V1999', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '+582129876543', '1960-08-15', 66);