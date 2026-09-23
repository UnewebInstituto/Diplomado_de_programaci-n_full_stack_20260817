-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2026 a las 17:12:58
-- Versión del servidor: 10.4.32-MariaDB
-- Versión de PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Base de datos: `db_profesor_pma`
--

DELIMITER $$
--
-- Procedimientos
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `consulta` (IN `arg_producto` TEXT)   SELECT * FROM PRODUCTOS WHERE nombre = arg_producto$$

--
-- Funciones
--
CREATE DEFINER=`root`@`localhost` FUNCTION `cuadrado` (`arg_valor` INT) RETURNS INT(11)  RETURN arg_valor*arg_valor$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `area` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `area`) VALUES
(1, 'LÓGICA DE PROGRAMACIÓN', 'PROGRAMACIÓN'),
(2, 'MYSQL', 'BASES DE DATOS'),
(3, 'POSTGRESQL', 'BASES DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACIÓN');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) NOT NULL,
  `apellido` varchar(40) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes`
--

INSERT INTO `estudiantes` (`id`, `nombre`, `apellido`) VALUES
(1, 'JOSE', 'MEDINA'),
(2, 'RICARDO', 'SILVA'),
(3, 'ANDRES', 'FRANCO');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes_asignaturas`
--

CREATE TABLE `estudiantes_asignaturas` (
  `estudiante_id` int(10) UNSIGNED NOT NULL,
  `asignatura_id` int(10) UNSIGNED NOT NULL,
  `periodo_del_curso` int(4) UNSIGNED NOT NULL,
  `nota` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiante_id`, `asignatura_id`, `periodo_del_curso`, `nota`) VALUES
(1, 1, 2025, 80),
(1, 2, 2026, 100),
(1, 4, 2025, 90),
(2, 1, 2025, 90),
(2, 2, 2026, 85),
(2, 4, 2025, 100),
(3, 1, 2025, 95),
(3, 2, 2026, 100),
(3, 4, 2025, 100);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `log`
--

CREATE TABLE `log` (
  `id` int(11) NOT NULL,
  `operacion` text NOT NULL,
  `fecha_hora` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `log`
--

INSERT INTO `log` (`id`, `operacion`, `fecha_hora`) VALUES
(1, 'Se registró el ingreso de un registro en la tabla personas', '2026-09-23 11:04:05'),
(2, 'Se registró la eliminación de un registro en la tabla personas', '2026-09-23 11:05:34'),
(3, 'Se registró la actualización de un registro en la tabla personas', '2026-09-23 11:07:23'),
(4, 'Se registró la actualización de un registro en la tabla personas', '2026-09-23 11:07:23'),
(5, 'Se registró la actualización de un registro en la tabla personas', '2026-09-23 11:07:23');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` text NOT NULL,
  `email` text NOT NULL,
  `telefono` varchar(20) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `edad` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1111', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1111', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1111', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

--
-- Disparadores `personas`
--
DELIMITER $$
CREATE TRIGGER `auditoria1` AFTER INSERT ON `personas` FOR EACH ROW INSERT INTO log(operacion) value ('Se registró el ingreso de un registro en la tabla personas')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria2` AFTER UPDATE ON `personas` FOR EACH ROW INSERT INTO log(operacion) value ('Se registró la actualización de un registro en la tabla personas')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria3` AFTER DELETE ON `personas` FOR EACH ROW INSERT INTO log(operacion) value ('Se registró la eliminación de un registro en la tabla personas')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(11) NOT NULL,
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) NOT NULL,
  `apellido` varchar(30) NOT NULL,
  `direccion` text NOT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `telefono` char(20) NOT NULL,
  `fecha_de_nacimiento` date NOT NULL,
  `edad` tinyint(3) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'TERRAZAS DEL AVILA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
(4, 'V9876', 'SUSANA', 'GUERRERO', 'CARICUAO', 'sg@gmail.com', '+584141230987', '2000-09-15', 26);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula_correo`
--

CREATE TABLE `personas_con_indice_cedula_correo` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos`
--

CREATE TABLE `productos` (
  `id` int(10) UNSIGNED NOT NULL,
  `proveedor_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos`
--

INSERT INTO `productos` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 2, 'LAVADORA', 2, 800.50),
(4, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(5, 3, 'TELEVISOR', 7, 400.00),
(6, 3, 'LAPTOP', 5, 1200.00),
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(10, 3, 'VENTILADOR', 12, 50.00),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00),
(13, 3, 'TOSTADORA', 12, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_cascade`
--

CREATE TABLE `productos_cascade` (
  `id` int(10) UNSIGNED NOT NULL,
  `proveedor_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_secuencial`
--

CREATE TABLE `productos_secuencial` (
  `ID` int(10) UNSIGNED NOT NULL,
  `PROVEEDOR_ID` int(10) UNSIGNED DEFAULT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_secuencial`
--

INSERT INTO `productos_secuencial` (`ID`, `PROVEEDOR_ID`, `NOMBRE`, `CANTIDAD`, `PRECIO`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 2, 'LAVADORA', 2, 800.50),
(4, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(5, 3, 'TELEVISOR', 7, 400.00),
(6, 3, 'LAPTOP', 5, 1200.00),
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(10, 3, 'VENTILADOR', 12, 50.00),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00),
(13, 3, 'TOSTADORA', 12, 80.00),
(14, 15, 'SECADORA', 5, 300.00),
(15, 15, 'TELEVISOR 4K', 3, 1200.00),
(16, 15, 'LAVAVAJILLAS', 4, 700.00),
(17, 16, 'TELEVISOR CURVO', 2, 1500.00),
(18, 16, 'AURICULARES', 10, 200.00),
(19, 16, 'TABLET', 6, 400.00),
(20, 17, 'LAVADORA INDUSTRIAL', 1, 2500.00),
(21, 17, 'SECADORA INDUSTRIAL', 1, 2000.00),
(22, 17, 'REFRIGERADOR INDUSTRIAL', 1, 3000.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_varios`
--

CREATE TABLE `productos_varios` (
  `id` int(10) UNSIGNED NOT NULL,
  `proveedor_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_varios`
--

INSERT INTO `productos_varios` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 2, 'LAVADORA', 2, 800.50),
(4, 4, 'AIRE ACONDICIONADO', 4, 600.75),
(5, 4, 'TELEVISOR', 7, 400.00),
(6, 4, 'LAPTOP', 5, 1200.00),
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(10, 4, 'VENTILADOR', 12, 50.00),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00),
(13, 4, 'TOSTADORA', 12, 80.00),
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 2, 'LAVADORA', 2, 800.50),
(17, 4, 'AIRE ACONDICIONADO', 4, 600.75),
(18, 4, 'TELEVISOR', 7, 400.00),
(19, 4, 'LAPTOP', 5, 1200.00),
(20, 2, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 2, 'PLANCHA', 12, 75.50),
(23, 4, 'VENTILADOR', 12, 50.00),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 2, 'CAFETERA', 12, 250.00),
(26, 4, 'TOSTADORA', 12, 80.00),
(27, 1, 'NEVERA', 6, 500.25),
(28, 1, 'COCINA', 3, 300.75),
(29, 2, 'LAVADORA', 2, 800.50),
(30, 4, 'AIRE ACONDICIONADO', 4, 600.75),
(31, 4, 'TELEVISOR', 7, 400.00),
(32, 4, 'LAPTOP', 5, 1200.00),
(33, 2, 'MICROONDAS', 8, 150.25),
(34, 1, 'LICUADORA', 12, 100.00),
(35, 2, 'PLANCHA', 12, 75.50),
(36, 4, 'VENTILADOR', 12, 50.00),
(37, 1, 'HORNO A GAS', 6, 450.00),
(38, 2, 'CAFETERA', 12, 250.00),
(39, 4, 'TOSTADORA', 12, 80.00),
(40, 1, 'NEVERA', 6, 500.25),
(41, 1, 'COCINA', 3, 300.75),
(42, 2, 'LAVADORA', 2, 800.50),
(43, 4, 'AIRE ACONDICIONADO', 4, 600.75),
(44, 4, 'TELEVISOR', 7, 400.00),
(45, 4, 'LAPTOP', 5, 1200.00),
(46, 2, 'MICROONDAS', 8, 150.25),
(47, 1, 'LICUADORA', 12, 100.00),
(48, 2, 'PLANCHA', 12, 75.50),
(49, 4, 'VENTILADOR', 12, 50.00),
(50, 1, 'HORNO A GAS', 6, 450.00),
(51, 2, 'CAFETERA', 12, 250.00),
(52, 4, 'TOSTADORA', 12, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores`
--

CREATE TABLE `proveedores` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores`
--

INSERT INTO `proveedores` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(2, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com'),
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com'),
(4, 'PHILIPS', 'PLAZA VENEZUELA', '2125673421', 'info@philips.com'),
(5, 'SAMSUNG', 'BOLEITA NORTES', '2129872323', 'info@samsung.com'),
(6, 'WHIRLPOOL', 'LA CALIFORNIA', '2124417889', 'info@whirlpool.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_cascade`
--

CREATE TABLE `proveedores_cascade` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_secuencial`
--

CREATE TABLE `proveedores_secuencial` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores_secuencial`
--

INSERT INTO `proveedores_secuencial` (`ID`, `NOMBRE`, `DIRECCION`, `TELEFONO`, `CORREO_ELECTRONICO`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(2, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com'),
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com'),
(4, 'PHILIPS', 'PLAZA VENEZUELA', '2125673421', 'info@philips.com'),
(5, 'SAMSUNG', 'BOLEITA NORTES', '2129872323', 'info@samsung.com'),
(6, 'WHIRLPOOL', 'LA CALIFORNIA', '2124417889', 'info@whirlpool.com');

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_estudiantes_asignaturas`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_estudiantes_asignaturas` (
`NOMBRE_ESTUDIANTE` varchar(40)
,`APELLIDO_ESTUDIANTE` varchar(40)
,`NOMBRE_ASIGNATURA` varchar(40)
,`PERIODO` int(4) unsigned
,`NOTA` int(2) unsigned
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_full_join_proveedores_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_full_join_proveedores_productos` (
`PROVEEDOR` varchar(40)
,`PRODUCTO` varchar(40)
,`CANTIDAD` int(10) unsigned
,`PRECIO` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_inner_join_proveedores_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_inner_join_proveedores_productos` (
`PROVEEDOR` varchar(30)
,`PRODUCTO` varchar(30)
,`CANTIDAD` int(10) unsigned
,`PRECIO` decimal(13,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_left_join_proveedores_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_left_join_proveedores_productos` (
`PROVEEDOR` varchar(30)
,`PRODUCTO` varchar(30)
,`CANTIDAD` int(10) unsigned
,`PRECIO` decimal(13,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `vista_right_join_proveedores_productos`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `vista_right_join_proveedores_productos` (
`PROVEEDOR` varchar(40)
,`PRODUCTO` varchar(40)
,`CANTIDAD` int(10) unsigned
,`PRECIO` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_estudiantes_asignaturas`
--
DROP TABLE IF EXISTS `vista_estudiantes_asignaturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estudiantes_asignaturas`  AS SELECT `a`.`nombre` AS `NOMBRE_ESTUDIANTE`, `a`.`apellido` AS `APELLIDO_ESTUDIANTE`, `b`.`nombre` AS `NOMBRE_ASIGNATURA`, `c`.`periodo_del_curso` AS `PERIODO`, `c`.`nota` AS `NOTA` FROM ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) WHERE `a`.`id` = `c`.`estudiante_id` AND `b`.`id` = `c`.`asignatura_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_full_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_full_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_full_join_proveedores_productos`  AS SELECT `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`, `productos_secuencial`.`NOMBRE` AS `PRODUCTO`, `productos_secuencial`.`CANTIDAD` AS `CANTIDAD`, `productos_secuencial`.`PRECIO` AS `PRECIO` FROM (`proveedores_secuencial` left join `productos_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`))union select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuencial`.`NOMBRE` AS `PRODUCTO`,`productos_secuencial`.`CANTIDAD` AS `CANTIDAD`,`productos_secuencial`.`PRECIO` AS `PRECIO` from (`productos_secuencial` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`))  ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_inner_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_inner_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_inner_join_proveedores_productos`  AS SELECT `proveedores`.`nombre` AS `PROVEEDOR`, `productos`.`nombre` AS `PRODUCTO`, `productos`.`cantidad` AS `CANTIDAD`, `productos`.`precio` AS `PRECIO` FROM (`proveedores` join `productos` on(`proveedores`.`id` = `productos`.`proveedor_id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_left_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_left_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_left_join_proveedores_productos`  AS SELECT `proveedores`.`nombre` AS `PROVEEDOR`, `productos`.`nombre` AS `PRODUCTO`, `productos`.`cantidad` AS `CANTIDAD`, `productos`.`precio` AS `PRECIO` FROM (`proveedores` left join `productos` on(`proveedores`.`id` = `productos`.`proveedor_id`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_right_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_right_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_right_join_proveedores_productos`  AS SELECT `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`, `productos_secuencial`.`NOMBRE` AS `PRODUCTO`, `productos_secuencial`.`CANTIDAD` AS `CANTIDAD`, `productos_secuencial`.`PRECIO` AS `PRECIO` FROM (`productos_secuencial` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `estudiantes_asignaturas`
--
ALTER TABLE `estudiantes_asignaturas`
  ADD PRIMARY KEY (`estudiante_id`,`asignatura_id`,`periodo_del_curso`),
  ADD KEY `IDX_ESTUDIANTE_ID` (`estudiante_id`),
  ADD KEY `IDX_ASIGNATURA_ID` (`asignatura_id`);

--
-- Indices de la tabla `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula_correo`
--
ALTER TABLE `personas_con_indice_cedula_correo`
  ADD PRIMARY KEY (`cedula`,`correo_electronico`);

--
-- Indices de la tabla `productos`
--
ALTER TABLE `productos`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indice_proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indice_proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- Indices de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `correo_electronico` (`correo_electronico`);

--
-- Indices de la tabla `proveedores_secuencial`
--
ALTER TABLE `proveedores_secuencial`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `asignaturas`
--
ALTER TABLE `asignaturas`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `estudiantes`
--
ALTER TABLE `estudiantes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `log`
--
ALTER TABLE `log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `proveedores_secuencial`
--
ALTER TABLE `proveedores_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `estudiantes_asignaturas`
--
ALTER TABLE `estudiantes_asignaturas`
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD CONSTRAINT `productos_cascade_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores_cascade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  ADD CONSTRAINT `productos_varios_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
