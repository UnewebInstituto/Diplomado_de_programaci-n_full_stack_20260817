-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Servidor: 127.0.0.1
-- Tiempo de generación: 23-09-2026 a las 17:24:40
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
-- Base de datos: `db_andres`
--
CREATE DATABASE IF NOT EXISTS `db_andres` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_andres`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `area` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `area`) VALUES
(1, 'L?GICA DE PROGRAMACI?N', 'PROGRAMACI?N'),
(2, 'MYSQL', 'BASES DE DATOS'),
(3, 'POSTGRESQL', 'BASES DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACI?N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL
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
  `nota` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiante_id`, `asignatura_id`, `periodo_del_curso`, `nota`) VALUES
(1, 1, 2025, 80),
(1, 1, 2026, 90),
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
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL,
  `telefono_hab` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`, `telefono_hab`) VALUES
('V1234', 'Ana', 'Vasquez', 'Santa Fe', 'av@gmail.com', '2124445566', '1960-08-15', 66, NULL),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '4147776655', '1975-09-10', 51, NULL),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58, NULL),
('V3456', 'LIBIA', 'COLS', 'Las Clavellinas, Guarenas', 'lc@gmail.com', '2123634106', '1975-05-20', 51, NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula`
--

CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice_cedula`
--

INSERT INTO `personas_con_indice_cedula` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `personas_con_indice_cedula_correo`
--

INSERT INTO `personas_con_indice_cedula_correo` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt1@gmail.com', '2123334455', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V56781', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00);

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

--
-- Volcado de datos para la tabla `productos_cascade`
--

INSERT INTO `productos_cascade` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 4, 'LAVADORA', 2, 800.50),
(7, 4, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 4, 'PLANCHA', 12, 75.50),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 4, 'CAFETERA', 12, 250.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_secuencial`
--

CREATE TABLE `productos_secuencial` (
  `ID` int(10) UNSIGNED NOT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  `PROVEEDOR_ID` int(10) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_secuencial`
--

INSERT INTO `productos_secuencial` (`ID`, `NOMBRE`, `CANTIDAD`, `PRECIO`, `PROVEEDOR_ID`) VALUES
(1, '1', 0, 6.00, 500),
(2, '1', 0, 3.00, 301),
(3, '2', 0, 2.00, 801),
(4, '3', 0, 4.00, 601),
(5, '3', 0, 7.00, 400),
(6, '3', 0, 5.00, 1200),
(7, '2', 0, 8.00, 150),
(8, '1', 0, 12.00, 100),
(9, '2', 0, 12.00, 76),
(10, '3', 0, 12.00, 50),
(11, '1', 0, 6.00, 450),
(12, '2', 0, 12.00, 250),
(13, '3', 0, 12.00, 80),
(14, '15', 0, 5.00, 300),
(15, '15', 0, 3.00, 1200),
(16, '15', 0, 4.00, 700),
(17, '16', 0, 2.00, 1500),
(18, '16', 0, 10.00, 200),
(19, '16', 0, 6.00, 400),
(20, '17', 0, 1.00, 2500),
(21, '17', 0, 1.00, 2000),
(22, '17', 0, 1.00, 3000);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_secuenciales`
--

CREATE TABLE `productos_secuenciales` (
  `ID` int(10) UNSIGNED NOT NULL,
  `PROVEEDOR_ID` int(10) UNSIGNED DEFAULT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `CANTIDAD` int(10) UNSIGNED DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_secuenciales`
--

INSERT INTO `productos_secuenciales` (`ID`, `PROVEEDOR_ID`, `NOMBRE`, `CANTIDAD`, `PRECIO`) VALUES
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
(52, 4, 'TOSTADORA', 12, 80.00),
(53, 1, 'NEVERA', 6, 250.50),
(54, 1, 'COCINA', 8, 120.25),
(55, 2, 'LAVADORA', 12, 350.75);

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

--
-- Volcado de datos para la tabla `proveedores_cascade`
--

INSERT INTO `proveedores_cascade` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(4, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com');

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
,`NOTA` int(3) unsigned
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
-- Estructura para la vista `vista_estudiantes_asignaturas`
--
DROP TABLE IF EXISTS `vista_estudiantes_asignaturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estudiantes_asignaturas`  AS SELECT `a`.`nombre` AS `NOMBRE_ESTUDIANTE`, `a`.`apellido` AS `APELLIDO_ESTUDIANTE`, `b`.`nombre` AS `NOMBRE_ASIGNATURA`, `c`.`periodo_del_curso` AS `PERIODO`, `c`.`nota` AS `NOTA` FROM ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) WHERE `a`.`id` = `c`.`estudiante_id` AND `b`.`id` = `c`.`asignatura_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_full_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_full_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_full_join_proveedores_productos`  AS SELECT `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`, `productos_secuenciales`.`NOMBRE` AS `PRODUCTO`, `productos_secuenciales`.`CANTIDAD` AS `CANTIDAD`, `productos_secuenciales`.`PRECIO` AS `PRECIO` FROM (`proveedores_secuencial` left join `productos_secuenciales` on(`proveedores_secuencial`.`ID` = `productos_secuenciales`.`PROVEEDOR_ID`))union select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuenciales`.`NOMBRE` AS `PRODUCTO`,`productos_secuenciales`.`CANTIDAD` AS `CANTIDAD`,`productos_secuenciales`.`PRECIO` AS `PRECIO` from (`productos_secuenciales` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuenciales`.`PROVEEDOR_ID`))  ;

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
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula`
--
ALTER TABLE `personas_con_indice_cedula`
  ADD PRIMARY KEY (`cedula`);

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
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  ADD PRIMARY KEY (`ID`);

--
-- Indices de la tabla `productos_secuenciales`
--
ALTER TABLE `productos_secuenciales`
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
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_secuenciales`
--
ALTER TABLE `productos_secuenciales`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE;

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
--
-- Base de datos: `db_andres_pma`
--
CREATE DATABASE IF NOT EXISTS `db_andres_pma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_andres_pma`;

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
(1, 'se registro el ingreso de un registro en la tabla persona', '2026-09-23 11:00:59');

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
('V1234', 'ANA', 'PEREZ', 'CHACAITO', 'ANA@GMAIL.COM', '0412-1234567', '2007-12-04', 18),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1234', 'ANA', 'PEREZ', 'CHACAITO', 'ANA@GMAIL.COM', '0412-1234567', '2007-12-04', 18),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1234', 'ANA', 'PEREZ', 'CHACAITO', 'ANA@GMAIL.COM', '0412-1234567', '2007-12-04', 18),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5689', 'ANDREA', 'GONZALES', '', '', '0412-1234587', '2007-05-12', 19);

--
-- Disparadores `personas`
--
DELIMITER $$
CREATE TRIGGER `auditoria1` AFTER INSERT ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro el ingreso de un registro en la tabla persona')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria2` AFTER UPDATE ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro la actualizacion de un registro en la tabla persona')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `auditoria3` AFTER DELETE ON `personas` FOR EACH ROW insert into log (operacion) value ('se registro la eliminacion de un registro en la tabla personas')
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
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

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
  ADD KEY `idx_estudiantes_id` (`estudiante_id`),
  ADD KEY `idx_asignatura_id` (`asignatura_id`);

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
  ADD KEY `indice_proveedor_id` (`id`,`proveedor_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `indice_proveedor_id` (`id`,`proveedor_id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `productos_ibfk_2` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD CONSTRAINT `productos_cascade_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores_cascade` (`id`);

--
-- Filtros para la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  ADD CONSTRAINT `productos_varios_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);
--
-- Base de datos: `db_andres_tmp`
--
CREATE DATABASE IF NOT EXISTS `db_andres_tmp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_andres_tmp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL,
  `telefono_hab` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`, `telefono_hab`) VALUES
('V1234', 'Ana', 'Vasquez', 'Santa Fe', 'av@gmail.com', '2124445566', '1960-08-15', 66, NULL),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '4147776655', '1975-09-10', 51, NULL),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58, NULL),
('V3456', 'LIBIA', 'COLS', 'Las Clavellinas, Guarenas', 'lc@gmail.com', '2123634106', '1975-05-20', 51, NULL);
--
-- Base de datos: `db_jose`
--
CREATE DATABASE IF NOT EXISTS `db_jose` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_jose`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `area` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `area`) VALUES
(1, 'LOGICA DE PROGRAMACION', 'PROGRAMACION'),
(2, 'MYSQL', 'BASE DE DATOS'),
(3, 'POSTGRESQL', 'BASE DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACION');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL
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
  `estudiantes_id` int(10) UNSIGNED NOT NULL,
  `asignaturas_id` int(10) UNSIGNED NOT NULL,
  `periodo_del_curso` int(4) UNSIGNED NOT NULL,
  `nota` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiantes_id`, `asignaturas_id`, `periodo_del_curso`, `nota`) VALUES
(1, 1, 2025, 80),
(1, 1, 2026, 100),
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
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2224444555666', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula`
--

CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice_cedula`
--

INSERT INTO `personas_con_indice_cedula` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `personas_con_indice_cedula_correo`
--

INSERT INTO `personas_con_indice_cedula_correo` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58);

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
(28, 1, 'NEVERA', 6, 500.25),
(29, 1, 'COCINA', 3, 300.75),
(30, 2, 'LAVADORA', 2, 800.50),
(34, 2, 'MICROONDAS', 8, 150.25),
(35, 1, 'LICUADORA', 12, 100.00),
(36, 2, 'PLANCHA', 12, 75.50),
(38, 1, 'HORNO A GAS', 6, 450.00),
(39, 2, 'CAFETERA', 12, 250.00),
(54, 1, 'NEVERA', 6, 500.25),
(55, 1, 'COCINA', 3, 300.75),
(56, 2, 'LAVADORA', 2, 800.50),
(57, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(58, 7, 'TELEVISOR', 7, 400.00),
(59, 7, 'LAPTOP', 5, 1200.00),
(60, 2, 'MICROONDAS', 8, 150.25),
(61, 1, 'LICUADORA', 12, 100.00),
(62, 2, 'PLANCHA', 12, 75.50),
(63, 7, 'VENTILADOR', 12, 50.00),
(64, 1, 'HORNO A GAS', 6, 450.00),
(65, 2, 'CAFETERA', 12, 250.00),
(66, 7, 'TOSTADORA', 12, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_cascada`
--

CREATE TABLE `productos_cascada` (
  `id` int(10) UNSIGNED NOT NULL,
  `proveedor_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_cascada`
--

INSERT INTO `productos_cascada` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 4, 'LAVADORA', 2, 800.50),
(20, 4, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 4, 'PLANCHA', 12, 75.50),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 4, 'CAFETERA', 12, 250.00);

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
(2, 4, 'NEVERA', 6, 500.25),
(3, 1, 'COCINA', 3, 300.75),
(4, 5, 'COCINA', 3, 300.75),
(5, 2, 'LAVADORA', 2, 800.50),
(6, 6, 'LAVADORA', 2, 800.50),
(7, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(8, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(9, 3, 'TELEVISOR', 7, 400.00),
(10, 3, 'LAPTOP', 5, 1200.00),
(11, 8, 'LAPTOP', 5, 1200.00),
(12, 2, 'MICROONDAS', 8, 150.25),
(13, 9, 'MICROONDAS', 8, 150.25),
(14, 1, 'LICUADORA', 12, 100.00),
(15, 10, 'LICUADORA', 12, 100.00),
(16, 2, 'PLANCHA', 12, 75.50),
(17, 11, 'PLANCHA', 12, 75.50),
(18, 3, 'VENTILADOR', 12, 50.00),
(19, 12, 'VENTILADOR', 12, 50.00),
(20, 1, 'HORNO A GAS', 6, 450.00),
(21, 2, 'CAFETERA', 12, 250.00),
(22, 13, 'CAFETERA', 12, 250.00),
(23, 3, 'TOSTADORA', 12, 80.00),
(24, 14, 'TOSTADORA', 12, 80.00);

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
(4, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(5, 7, 'TELEVISOR', 7, 400.00),
(6, 7, 'LAPTOP', 5, 1200.00),
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(10, 7, 'VENTILADOR', 12, 50.00),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00),
(13, 7, 'TOSTADORA', 12, 80.00),
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 2, 'LAVADORA', 2, 800.50),
(17, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(18, 7, 'TELEVISOR', 7, 400.00),
(19, 7, 'LAPTOP', 5, 1200.00),
(20, 2, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 2, 'PLANCHA', 12, 75.50),
(23, 7, 'VENTILADOR', 12, 50.00),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 2, 'CAFETERA', 12, 250.00),
(26, 7, 'TOSTADORA', 12, 80.00),
(27, 1, 'NEVERA', 6, 500.25),
(28, 1, 'COCINA', 3, 300.75),
(29, 2, 'LAVADORA', 2, 800.50),
(30, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(31, 7, 'TELEVISOR', 7, 400.00),
(32, 7, 'LAPTOP', 5, 1200.00),
(33, 2, 'MICROONDAS', 8, 150.25),
(34, 1, 'LICUADORA', 12, 100.00),
(35, 2, 'PLANCHA', 12, 75.50),
(36, 7, 'VENTILADOR', 12, 50.00),
(37, 1, 'HORNO A GAS', 6, 450.00),
(38, 2, 'CAFETERA', 12, 250.00),
(39, 7, 'TOSTADORA', 12, 80.00),
(40, 1, 'NEVERA', 6, 500.25),
(41, 1, 'COCINA', 3, 300.75),
(42, 2, 'LAVADORA', 2, 800.50),
(43, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(44, 7, 'TELEVISOR', 7, 400.00),
(45, 7, 'LAPTOP', 5, 1200.00),
(46, 2, 'MICROONDAS', 8, 150.25),
(47, 1, 'LICUADORA', 12, 100.00),
(48, 2, 'PLANCHA', 12, 75.50),
(49, 7, 'VENTILADOR', 12, 50.00),
(50, 1, 'HORNO A GAS', 6, 450.00),
(51, 2, 'CAFETERA', 12, 250.00),
(52, 7, 'TOSTADORA', 12, 80.00),
(53, 1, 'NEVERA', 6, 250.50),
(54, 1, 'COCINA', 8, 120.25),
(55, 2, 'LAVADORA', 12, 350.75);

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
(2, 'LG', 'AV. ROMULO GALLEGOS', '2122222277', 'info@lg.com'),
(7, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com'),
(14, 'PHILIPS', 'PLAZA VENEZUELA', '2125673421', 'info@philips.com'),
(15, 'SAMSUNG', 'BOLEITA NORTES', '2129872323', 'info@samsung.com'),
(16, 'WHIRLPOOL', 'LA CALIFORNIA', '2124417889', 'info@whirlpool.com');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `proveedores_cascada`
--

CREATE TABLE `proveedores_cascada` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `proveedores_cascada`
--

INSERT INTO `proveedores_cascada` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(4, 'LG', 'AV. ROMULO GALLEGOS', '2122222277', 'info@lg.com');

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
(2, 'LG', 'AV. ROMULO GALLEGOS', '2122222277', 'info@lg.com'),
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
,`NOTA` int(3) unsigned
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

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estudiantes_asignaturas`  AS SELECT `a`.`nombre` AS `NOMBRE_ESTUDIANTE`, `a`.`apellido` AS `APELLIDO_ESTUDIANTE`, `b`.`nombre` AS `NOMBRE_ASIGNATURA`, `c`.`periodo_del_curso` AS `PERIODO`, `c`.`nota` AS `NOTA` FROM ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) WHERE `a`.`id` = `c`.`estudiantes_id` AND `b`.`id` = `c`.`asignaturas_id` ;

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
  ADD PRIMARY KEY (`estudiantes_id`,`asignaturas_id`,`periodo_del_curso`),
  ADD KEY `asignaturas_id` (`asignaturas_id`);

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula`
--
ALTER TABLE `personas_con_indice_cedula`
  ADD PRIMARY KEY (`cedula`);

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
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascada`
--
ALTER TABLE `productos_cascada`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

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
-- Indices de la tabla `proveedores_cascada`
--
ALTER TABLE `proveedores_cascada`
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
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;

--
-- AUTO_INCREMENT de la tabla `productos_cascada`
--
ALTER TABLE `productos_cascada`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=183;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascada`
--
ALTER TABLE `proveedores_cascada`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiantes_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos`
--
ALTER TABLE `productos`
  ADD CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);

--
-- Filtros para la tabla `productos_cascada`
--
ALTER TABLE `productos_cascada`
  ADD CONSTRAINT `productos_cascada_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores_cascada` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  ADD CONSTRAINT `productos_varios_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`);
--
-- Base de datos: `db_jose_pma`
--
CREATE DATABASE IF NOT EXISTS `db_jose_pma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_jose_pma`;

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
(1, 'LOGICA DE PROGRAMACION', 'PROGRAMACION'),
(2, 'MYSQL', 'BASE DE DATOS'),
(3, 'POSTGRESQL', 'BASE DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACION');

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
  `estudiantes_id` int(10) UNSIGNED NOT NULL,
  `asignaturas_id` int(10) UNSIGNED NOT NULL,
  `periodo_del_curso` int(4) UNSIGNED NOT NULL,
  `nota` int(2) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiantes_id`, `asignaturas_id`, `periodo_del_curso`, `nota`) VALUES
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
(1, 'Se actualizo un registro en la tabla personas', '2026-09-23 11:00:03'),
(2, 'Se elimino un registro en la tabla personas', '2026-09-23 11:06:42'),
(3, 'Se actualizo un registro en la tabla personas', '2026-09-23 11:07:39'),
(4, 'Se registro un ingreso en la tabla personas', '2026-09-23 11:08:42'),
(5, 'Se registro un ingreso en la tabla personas', '2026-09-23 11:09:26');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
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
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'an@gmail.com', '+582121234567', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234561', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234562', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234563', '1975-05-20', 51),
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'an@gmail.com', '+582121234567', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234561', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234562', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234563', '1975-05-20', 51),
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'an@gmail.com', '+582121234567', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234561', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234562', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234563', '1975-05-20', 51),
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'an@gmail.com', '+582121234567', '1975-09-10', 51),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234568', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234561', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234562', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234563', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234564', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234565', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234566', '1975-05-20', 51),
('V9876', 'SUSANA', 'GUERRERO', 'CARICUAO', 'sg@gmail.com', '+584149876543', '2000-08-15', 20);

--
-- Disparadores `personas`
--
DELIMITER $$
CREATE TRIGGER `audit_delete` AFTER DELETE ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se elimino un registro en la tabla personas')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `audit_insert` AFTER UPDATE ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se registro un ingreso en la tabla personas')
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `audit_update` AFTER INSERT ON `personas` FOR EACH ROW INSERT INTO log(operacion) VALUE ('Se actualizo un registro en la tabla personas')
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) NOT NULL,
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
(1, 'V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'an@gmail.com', '+582121234567', '1975-09-10', 51),
(2, 'V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234568', '1975-05-20', 51),
(3, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234561', '1975-09-10', 51),
(4, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234562', '1968-07-16', 58),
(5, 'V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234563', '1975-05-20', 51),
(6, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '+582121234564', '1975-09-10', 51),
(7, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '+582121234565', '1968-07-16', 58),
(8, 'V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '+582121234566', '1975-05-20', 51);

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
(2, 7, 'NEVERA', 6, 500.25),
(3, 1, 'COCINA', 3, 300.75),
(4, 7, 'COCINA', 3, 300.75),
(5, 2, 'LAVADORA', 2, 800.50),
(6, 7, 'LAVADORA', 2, 800.50),
(7, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(8, 7, 'AIRE ACONDICIONADO', 4, 600.75),
(9, 3, 'TELEVISOR', 7, 400.00),
(10, 3, 'LAPTOP', 5, 1200.00),
(11, 8, 'LAPTOP', 5, 1200.00),
(12, 2, 'MICROONDAS', 8, 150.25),
(13, 9, 'MICROONDAS', 8, 150.25),
(14, 1, 'LICUADORA', 12, 100.00),
(15, 10, 'LICUADORA', 12, 100.00),
(16, 2, 'PLANCHA', 12, 75.50),
(17, 11, 'PLANCHA', 12, 75.50),
(18, 3, 'VENTILADOR', 12, 50.00),
(19, 12, 'VENTILADOR', 12, 50.00),
(20, 1, 'HORNO A GAS', 6, 450.00),
(21, 2, 'CAFETERA', 12, 250.00),
(22, 13, 'CAFETERA', 12, 250.00),
(23, 3, 'TOSTADORA', 12, 80.00),
(24, 14, 'TOSTADORA', 12, 80.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `productos_varios`
--

CREATE TABLE `productos_varios` (
  `id` int(10) UNSIGNED NOT NULL,
  `proveedores_secuencial_id` int(10) UNSIGNED DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) UNSIGNED DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `productos_varios`
--

INSERT INTO `productos_varios` (`id`, `proveedores_secuencial_id`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 2, 'LAVADORA', 2, 800.50),
(4, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(5, 3, 'TELEVISOR', 3, 400.00),
(6, 3, 'LAPTOP', 5, 1200.00),
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(10, 3, 'VENTILADOR', 12, 50.00),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00),
(13, 3, 'TOSTADORA', 12, 80.00),
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 2, 'LAVADORA', 2, 800.50),
(17, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(18, 3, 'TELEVISOR', 3, 400.00),
(19, 3, 'LAPTOP', 5, 1200.00),
(20, 2, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 2, 'PLANCHA', 12, 75.50),
(23, 3, 'VENTILADOR', 12, 50.00),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 2, 'CAFETERA', 12, 250.00),
(26, 3, 'TOSTADORA', 12, 80.00),
(27, 1, 'NEVERA', 6, 500.25),
(28, 1, 'COCINA', 3, 300.75),
(29, 2, 'LAVADORA', 2, 800.50),
(30, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(31, 3, 'TELEVISOR', 3, 400.00),
(32, 3, 'LAPTOP', 5, 1200.00),
(33, 2, 'MICROONDAS', 8, 150.25),
(34, 1, 'LICUADORA', 12, 100.00),
(35, 2, 'PLANCHA', 12, 75.50),
(36, 3, 'VENTILADOR', 12, 50.00),
(37, 1, 'HORNO A GAS', 6, 450.00),
(38, 2, 'CAFETERA', 12, 250.00),
(39, 3, 'TOSTADORA', 12, 80.00),
(40, 1, 'NEVERA', 6, 500.25),
(41, 1, 'COCINA', 3, 300.75),
(42, 2, 'LAVADORA', 2, 800.50),
(43, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(44, 3, 'TELEVISOR', 3, 400.00),
(45, 3, 'LAPTOP', 5, 1200.00),
(46, 2, 'MICROONDAS', 8, 150.25),
(47, 1, 'LICUADORA', 12, 100.00),
(48, 2, 'PLANCHA', 12, 75.50),
(49, 3, 'VENTILADOR', 12, 50.00),
(50, 1, 'HORNO A GAS', 6, 450.00),
(51, 2, 'CAFETERA', 12, 250.00),
(52, 3, 'TOSTADORA', 12, 80.00);

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
(2, 'LG', 'AV. ROMULO GALLEGOS', '2122222277', 'info@lg.com'),
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
-- Estructura para la vista `vista_estudiantes_asignaturas`
--
DROP TABLE IF EXISTS `vista_estudiantes_asignaturas`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_estudiantes_asignaturas`  AS SELECT `a`.`nombre` AS `NOMBRE_ESTUDIANTE`, `a`.`apellido` AS `APELLIDO_ESTUDIANTE`, `b`.`nombre` AS `NOMBRE_ASIGNATURA`, `c`.`periodo_del_curso` AS `PERIODO`, `c`.`nota` AS `NOTA` FROM ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) WHERE `a`.`id` = `c`.`estudiantes_id` AND `b`.`id` = `c`.`asignaturas_id` ;

-- --------------------------------------------------------

--
-- Estructura para la vista `vista_full_join_proveedores_productos`
--
DROP TABLE IF EXISTS `vista_full_join_proveedores_productos`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `vista_full_join_proveedores_productos`  AS SELECT `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`, `productos_secuencial`.`NOMBRE` AS `PRODUCTO`, `productos_secuencial`.`CANTIDAD` AS `CANTIDAD`, `productos_secuencial`.`PRECIO` AS `PRECIO` FROM (`proveedores_secuencial` left join `productos_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`))union select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuencial`.`NOMBRE` AS `PRODUCTO`,`productos_secuencial`.`CANTIDAD` AS `CANTIDAD`,`productos_secuencial`.`PRECIO` AS `PRECIO` from (`productos_secuencial` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`))  ;

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
  ADD PRIMARY KEY (`estudiantes_id`,`asignaturas_id`,`periodo_del_curso`),
  ADD KEY `idx_estudiantes_id` (`estudiantes_id`),
  ADD KEY `idx_asignaturas_id` (`asignaturas_id`);

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
  ADD PRIMARY KEY (`cedula`,`correo_electronico`) USING BTREE;

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
  ADD KEY `proveedores_secuencial_id` (`proveedores_secuencial_id`);

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

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
  MODIFY `id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=53;

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
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiantes_id`) REFERENCES `estudiantes` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Filtros para la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  ADD CONSTRAINT `productos_varios_ibfk_1` FOREIGN KEY (`proveedores_secuencial_id`) REFERENCES `proveedores_secuencial` (`ID`);
--
-- Base de datos: `db_jose_tmp`
--
CREATE DATABASE IF NOT EXISTS `db_jose_tmp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_jose_tmp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2224444555666', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '3334444555666', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124444555666', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENA', 'lc@gmail.com', '2124444555606', '1975-05-20', 51);
--
-- Base de datos: `db_profesor`
--
CREATE DATABASE IF NOT EXISTS `db_profesor` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_profesor`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `area` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `area`) VALUES
(1, 'L?GICA DE PROGRAMACI?N', 'PROGRAMACI?N'),
(2, 'MYSQL', 'BASES DE DATOS'),
(3, 'POSTGRESQL', 'BASES DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACI?N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL
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
  `nota` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiante_id`, `asignatura_id`, `periodo_del_curso`, `nota`) VALUES
(1, 1, 2025, 80),
(1, 1, 2026, 90),
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
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2124445566', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas1`
--

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula`
--

CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice_cedula`
--

INSERT INTO `personas_con_indice_cedula` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `personas_con_indice_cedula_correo`
--

INSERT INTO `personas_con_indice_cedula_correo` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt1@gmail.com', '2123334455', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V56781', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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
(7, 2, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 2, 'PLANCHA', 12, 75.50),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 2, 'CAFETERA', 12, 250.00);

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

--
-- Volcado de datos para la tabla `productos_cascade`
--

INSERT INTO `productos_cascade` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
(1, 1, 'NEVERA', 6, 500.25),
(2, 1, 'COCINA', 3, 300.75),
(3, 4, 'LAVADORA', 2, 800.50),
(7, 4, 'MICROONDAS', 8, 150.25),
(8, 1, 'LICUADORA', 12, 100.00),
(9, 4, 'PLANCHA', 12, 75.50),
(11, 1, 'HORNO A GAS', 6, 450.00),
(12, 4, 'CAFETERA', 12, 250.00);

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
(52, 4, 'TOSTADORA', 12, 80.00),
(53, 1, 'NEVERA', 6, 250.50),
(54, 1, 'COCINA', 8, 120.25),
(55, 2, 'LAVADORA', 12, 350.75);

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

--
-- Volcado de datos para la tabla `proveedores_cascade`
--

INSERT INTO `proveedores_cascade` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(4, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com');

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
,`NOTA` int(3) unsigned
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
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula`
--
ALTER TABLE `personas_con_indice_cedula`
  ADD PRIMARY KEY (`cedula`);

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
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

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
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=56;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE;

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
--
-- Base de datos: `db_profesor_pma`
--
CREATE DATABASE IF NOT EXISTS `db_profesor_pma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_profesor_pma`;

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
--
-- Base de datos: `db_profesor_tmp`
--
CREATE DATABASE IF NOT EXISTS `db_profesor_tmp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_profesor_tmp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2124445566', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas1`
--

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
--
-- Base de datos: `db_ricardo`
--
CREATE DATABASE IF NOT EXISTS `db_ricardo` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ricardo`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `asignaturas`
--

CREATE TABLE `asignaturas` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `area` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `asignaturas`
--

INSERT INTO `asignaturas` (`id`, `nombre`, `area`) VALUES
(1, 'L?GICA DE PROGRAMACI?N', 'PROGRAMACI?N'),
(2, 'MYSQL', 'BASES DE DATOS'),
(3, 'POSTGRESQL', 'BASES DE DATOS'),
(4, 'HTML', 'DESARROLLO WEB'),
(5, 'JAVASCRIPT', 'DESARROLLO WEB'),
(6, 'PHP', 'DESARROLLO WEB'),
(7, 'PYTHON', 'PROGRAMACI?N');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estudiantes`
--

CREATE TABLE `estudiantes` (
  `id` int(10) UNSIGNED NOT NULL,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL
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
  `nota` int(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estudiantes_asignaturas`
--

INSERT INTO `estudiantes_asignaturas` (`estudiante_id`, `asignatura_id`, `periodo_del_curso`, `nota`) VALUES
(1, 1, 2025, 80),
(1, 1, 2026, 90),
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
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2124445566', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '4147776655', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'LAS CLAVELLINAS, GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas1`
--

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula`
--

CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice_cedula`
--

INSERT INTO `personas_con_indice_cedula` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `personas_con_indice_cedula_correo`
--

INSERT INTO `personas_con_indice_cedula_correo` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `productos_cascade`
--

INSERT INTO `productos_cascade` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
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
(157, 1, 'NEVERA', 6, 500.25),
(158, 1, 'COCINA', 3, 300.75),
(159, 2, 'LAVADORA', 2, 800.50),
(160, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(161, 3, 'TELEVISOR', 7, 400.00),
(162, 3, 'LAPTOP', 5, 1200.00),
(163, 2, 'MICROONDAS', 8, 150.25),
(164, 1, 'LICUADORA', 12, 100.00),
(165, 2, 'PLANCHA', 12, 75.50),
(166, 3, 'VENTILADOR', 12, 50.00),
(167, 1, 'HORNO A GAS', 6, 450.00),
(168, 2, 'CAFETERA', 12, 250.00),
(169, 3, 'TOSTADORA', 12, 80.00),
(170, 1, 'NEVERA', 6, 500.25),
(171, 1, 'COCINA', 3, 300.75),
(172, 2, 'LAVADORA', 2, 800.50),
(173, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(174, 3, 'TELEVISOR', 7, 400.00),
(175, 3, 'LAPTOP', 5, 1200.00),
(176, 2, 'MICROONDAS', 8, 150.25),
(177, 1, 'LICUADORA', 12, 100.00),
(178, 2, 'PLANCHA', 12, 75.50),
(179, 3, 'VENTILADOR', 12, 50.00),
(180, 1, 'HORNO A GAS', 6, 450.00),
(181, 2, 'CAFETERA', 12, 250.00),
(182, 3, 'TOSTADORA', 12, 80.00),
(183, 1, 'NEVERA', 6, 500.25),
(184, 1, 'COCINA', 3, 300.75),
(185, 2, 'LAVADORA', 2, 800.50),
(186, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(187, 3, 'TELEVISOR', 7, 400.00),
(188, 3, 'LAPTOP', 5, 1200.00),
(189, 2, 'MICROONDAS', 8, 150.25),
(190, 1, 'LICUADORA', 12, 100.00),
(191, 2, 'PLANCHA', 12, 75.50),
(192, 3, 'VENTILADOR', 12, 50.00),
(193, 1, 'HORNO A GAS', 6, 450.00),
(194, 2, 'CAFETERA', 12, 250.00),
(195, 3, 'TOSTADORA', 12, 80.00),
(196, 1, 'NEVERA', 6, 500.25),
(197, 1, 'COCINA', 3, 300.75),
(198, 2, 'LAVADORA', 2, 800.50),
(199, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(200, 3, 'TELEVISOR', 7, 400.00),
(201, 3, 'LAPTOP', 5, 1200.00),
(202, 2, 'MICROONDAS', 8, 150.25),
(203, 1, 'LICUADORA', 12, 100.00),
(204, 2, 'PLANCHA', 12, 75.50),
(205, 3, 'VENTILADOR', 12, 50.00),
(206, 1, 'HORNO A GAS', 6, 450.00),
(207, 2, 'CAFETERA', 12, 250.00),
(208, 3, 'TOSTADORA', 12, 80.00),
(209, 1, 'NEVERA', 6, 250.50),
(210, 1, 'COCINA', 8, 120.25),
(211, 2, 'LAVADORA', 12, 350.75);

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
(7, 'PHILIPS', 'PLAZA VENEZUELA', '2125673421', 'info@philips.com'),
(8, 'SAMSUNG', 'BOLEITA NORTES', '2129872323', 'info@samsung.com'),
(9, 'WHIRLPOOL', 'LA CALIFORNIA', '2124417889', 'info@whirlpool.com');

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

--
-- Volcado de datos para la tabla `proveedores_cascade`
--

INSERT INTO `proveedores_cascade` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(2, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com'),
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com');

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
,`NOTA` int(3) unsigned
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
  ADD KEY `asignatura_id` (`asignatura_id`);

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula`
--
ALTER TABLE `personas_con_indice_cedula`
  ADD PRIMARY KEY (`cedula`);

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
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  ADD PRIMARY KEY (`id`),
  ADD KEY `proveedor_id` (`proveedor_id`);

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
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `productos_secuencial`
--
ALTER TABLE `productos_secuencial`
  MODIFY `ID` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT de la tabla `productos_varios`
--
ALTER TABLE `productos_varios`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=212;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  ADD CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE;

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
--
-- Base de datos: `db_ricardo_pma`
--
CREATE DATABASE IF NOT EXISTS `db_ricardo_pma` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ricardo_pma`;

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
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'AV@GMAIL.COM', '+5821211234567', '1960-08-15', 66),
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
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

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
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 2, 'LAVADORA', 2, 800.50),
(17, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(18, 3, 'TELEVISOR', 7, 400.00),
(19, 3, 'LAPTOP', 5, 1200.00),
(20, 2, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 2, 'PLANCHA', 12, 75.50),
(23, 3, 'VENTILADOR', 12, 50.00),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 2, 'CAFETERA', 12, 250.00),
(26, 3, 'TOSTADORA', 12, 80.00);

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

--
-- Volcado de datos para la tabla `productos_cascade`
--

INSERT INTO `productos_cascade` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
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
(14, 1, 'NEVERA', 6, 500.25),
(15, 1, 'COCINA', 3, 300.75),
(16, 2, 'LAVADORA', 2, 800.50),
(17, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(18, 3, 'TELEVISOR', 7, 400.00),
(19, 3, 'LAPTOP', 5, 1200.00),
(20, 2, 'MICROONDAS', 8, 150.25),
(21, 1, 'LICUADORA', 12, 100.00),
(22, 2, 'PLANCHA', 12, 75.50),
(23, 3, 'VENTILADOR', 12, 50.00),
(24, 1, 'HORNO A GAS', 6, 450.00),
(25, 2, 'CAFETERA', 12, 250.00),
(26, 3, 'TOSTADORA', 12, 80.00),
(27, 1, 'NEVERA', 6, 500.25),
(28, 1, 'COCINA', 3, 300.75),
(29, 2, 'LAVADORA', 2, 800.50),
(30, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(31, 3, 'TELEVISOR', 7, 400.00),
(32, 3, 'LAPTOP', 5, 1200.00),
(33, 2, 'MICROONDAS', 8, 150.25),
(34, 1, 'LICUADORA', 12, 100.00),
(35, 2, 'PLANCHA', 12, 75.50),
(36, 3, 'VENTILADOR', 12, 50.00),
(37, 1, 'HORNO A GAS', 6, 450.00),
(38, 2, 'CAFETERA', 12, 250.00),
(39, 3, 'TOSTADORA', 12, 80.00),
(40, 1, 'NEVERA', 6, 500.25),
(41, 1, 'COCINA', 3, 300.75),
(42, 2, 'LAVADORA', 2, 800.50),
(43, 3, 'AIRE ACONDICIONADO', 4, 600.75),
(44, 3, 'TELEVISOR', 7, 400.00),
(45, 3, 'LAPTOP', 5, 1200.00),
(46, 2, 'MICROONDAS', 8, 150.25),
(47, 1, 'LICUADORA', 12, 100.00),
(48, 2, 'PLANCHA', 12, 75.50),
(49, 3, 'VENTILADOR', 12, 50.00),
(50, 1, 'HORNO A GAS', 6, 450.00),
(51, 2, 'CAFETERA', 12, 250.00),
(52, 3, 'TOSTADORA', 12, 80.00);

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
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com');

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

--
-- Volcado de datos para la tabla `proveedores_cascade`
--

INSERT INTO `proveedores_cascade` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(2, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com'),
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com');

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

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
--
-- Base de datos: `db_ricardo_tmp`
--
CREATE DATABASE IF NOT EXISTS `db_ricardo_tmp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `db_ricardo_tmp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas`
--

CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas`
--

INSERT INTO `personas` (`cedula`, `nombre`, `apellido`, `direccion`, `email`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V1234', 'ANA', 'VASQUEZ', 'SANTA FE', 'av@gmail.com', '2124445566', '1960-08-15', 66),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas1`
--

CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice`
--

CREATE TABLE `personas_con_indice` (
  `id` int(10) UNSIGNED NOT NULL,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice`
--

INSERT INTO `personas_con_indice` (`id`, `cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
(1, 'V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
(2, 'V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58),
(3, 'V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `personas_con_indice_cedula`
--

CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `personas_con_indice_cedula`
--

INSERT INTO `personas_con_indice_cedula` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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

--
-- Volcado de datos para la tabla `personas_con_indice_cedula_correo`
--

INSERT INTO `personas_con_indice_cedula_correo` (`cedula`, `nombre`, `apellido`, `direccion`, `correo_electronico`, `telefono`, `fecha_de_nacimiento`, `edad`) VALUES
('V3456', 'LIBIA', 'COLS', 'GUARENAS', 'lc@gmail.com', '2123634106', '1975-05-20', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt1@gmail.com', '2123334455', '1975-09-10', 51),
('V5678', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V56781', 'YOLANDA', 'TORTOZA', 'CATIA LA MAR', 'yt@gmail.com', '2123334455', '1975-09-10', 51),
('V9012', 'NELLY', 'CONTRERAS', 'LA VEGA', 'nc@gmail.com', '2124434930', '1968-07-16', 58);

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
(13, 3, 'TOSTADORA', 12, 80.00),
(14, 4, 'OLLA DE PRESI?N', 10, 200.00);

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

--
-- Volcado de datos para la tabla `productos_cascade`
--

INSERT INTO `productos_cascade` (`id`, `proveedor_id`, `nombre`, `cantidad`, `precio`) VALUES
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
(2, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com'),
(3, 'MABE', 'AV. FCO. DE MIRANDA', '2123334455', 'info@mabe.com');

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

--
-- Volcado de datos para la tabla `proveedores_cascade`
--

INSERT INTO `proveedores_cascade` (`id`, `nombre`, `direccion`, `telefono`, `correo_electronico`) VALUES
(1, 'GENERAL ELECTRIC', 'AV. LECUNA', '2121112233', 'info@ge.com'),
(4, 'LG', 'AV. ROMULO GALLEGOS', '2121112277', 'info@lg.com');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `personas_con_indice_cedula`
--
ALTER TABLE `personas_con_indice_cedula`
  ADD PRIMARY KEY (`cedula`);

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
  ADD KEY `proveedor_id` (`proveedor_id`);

--
-- Indices de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
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
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `personas_con_indice`
--
ALTER TABLE `personas_con_indice`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `productos`
--
ALTER TABLE `productos`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT de la tabla `productos_cascade`
--
ALTER TABLE `productos_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT de la tabla `proveedores`
--
ALTER TABLE `proveedores`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `proveedores_cascade`
--
ALTER TABLE `proveedores_cascade`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

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
-- Base de datos: `ejemplos_ajax`
--
CREATE DATABASE IF NOT EXISTS `ejemplos_ajax` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `ejemplos_ajax`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carros`
--

CREATE TABLE `carros` (
  `id_vehiculo` int(11) NOT NULL,
  `marca` varchar(50) NOT NULL,
  `modelo` varchar(50) NOT NULL,
  `anio` int(11) DEFAULT NULL,
  `tipo_carroceria` varchar(50) DEFAULT NULL,
  `precio` decimal(10,2) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `carros`
--

INSERT INTO `carros` (`id_vehiculo`, `marca`, `modelo`, `anio`, `tipo_carroceria`, `precio`) VALUES
(1, 'Toyota', 'Corolla', 2024, 'Sedán', 28500.00),
(2, 'Toyota', 'Corolla', 2023, 'Sedán', 18500.00),
(3, 'Toyota', 'Corolla', 2022, 'Sedán', 12500.00),
(4, 'Toyota', 'Corolla', 2021, 'Sedán', 10000.00),
(5, 'Ford', 'F-150', 2023, 'Camioneta', 55900.00),
(6, 'Honda', 'CR-V', 2024, 'SUV', 32000.00),
(7, 'Chevrolet', 'Spark', 2020, 'Hatchback', 12500.00),
(8, 'BMW', 'Serie 3', 2024, 'Sedán', 45000.00),
(9, 'Mercedes-Benz', 'Clase C', 2023, 'Sedán', 58000.00),
(10, 'Audi', 'Q5', 2024, 'SUV', 48500.00),
(11, 'Jeep', 'Wrangler', 2022, 'Todoterreno', 41000.00),
(12, 'Mazda', 'CX-5', 2023, 'SUV', 29900.00),
(13, 'Hyundai', 'Elantra', 2024, 'Sedán', 23500.00),
(14, 'Kia', 'Sportage', 2023, 'SUV', 27990.00),
(15, 'Nissan', 'Versa', 2021, 'Sedán', 16500.00),
(16, 'Volkswagen', 'Jetta', 2024, 'Sedán', 26000.00),
(17, 'Subaru', 'Outback', 2023, 'Familiar', 33500.00),
(18, 'Tesla', 'Model 3', 2024, 'Sedán', 40990.00),
(19, 'Porsche', '911 Carrera', 2023, 'Deportivo', 120000.00),
(20, 'Volvo', 'XC60', 2024, 'SUV', 47500.00),
(21, 'Ram', '1500', 2024, 'Camioneta', 52000.00),
(22, 'Mitsubishi', 'Montero Sport', 2022, 'SUV', 35000.00),
(23, 'GMC', 'Sierra', 2023, 'Camioneta', 60500.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `estados`
--

CREATE TABLE `estados` (
  `ID_Estado` int(11) NOT NULL,
  `Nombre_Estado` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `estados`
--

INSERT INTO `estados` (`ID_Estado`, `Nombre_Estado`) VALUES
(4, 'Aragua'),
(5, 'Bolívar'),
(3, 'Lara'),
(1, 'Miranda'),
(2, 'Zulia');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `municipios`
--

CREATE TABLE `municipios` (
  `ID_Municipio` int(11) NOT NULL,
  `ID_Estado` int(11) NOT NULL,
  `Nombre_Municipio` varchar(100) NOT NULL,
  `Capital_Municipio` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `municipios`
--

INSERT INTO `municipios` (`ID_Municipio`, `ID_Estado`, `Nombre_Municipio`, `Capital_Municipio`) VALUES
(1001, 1, 'Chacao', 'Chacao'),
(1002, 1, 'Baruta', 'Nuestra Señora del Rosario de Baruta'),
(1003, 1, 'Sucre', 'Petare'),
(1004, 1, 'Guaicaipuro', 'Los Teques'),
(1005, 1, 'Cristóbal Rojas', 'Charallave'),
(2001, 2, 'Maracaibo', 'Maracaibo'),
(2002, 2, 'San Francisco', 'San Francisco'),
(2003, 2, 'Cabimas', 'Cabimas'),
(2004, 2, 'Lagunillas', 'Ciudad Ojeda'),
(2005, 2, 'Miranda', 'Los Puertos de Altagracia'),
(3001, 3, 'Iribarren', 'Barquisimeto'),
(3002, 3, 'Palavecino', 'Cabudare'),
(3003, 3, 'Torres', 'Carora'),
(3004, 3, 'Morán', 'El Tocuyo'),
(3005, 3, 'Jiménez', 'Quíbor'),
(4001, 4, 'Girardot', 'Maracay'),
(4002, 4, 'José Félix Ribas', 'La Victoria'),
(4003, 4, 'Santiago Mariño', 'Turmero'),
(4004, 4, 'Libertador', 'Palo Negro'),
(4005, 4, 'Sucre', 'Cagua'),
(5001, 5, 'Angostura del Orinoco', 'Ciudad Bolívar'),
(5002, 5, 'Caroní', 'Ciudad Guayana'),
(5003, 5, 'Sifontes', 'Tumeremo'),
(5004, 5, 'El Callao', 'El Callao'),
(5005, 5, 'Gran Sabana', 'Santa Elena de Uairén');

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carros`
--
ALTER TABLE `carros`
  ADD PRIMARY KEY (`id_vehiculo`);

--
-- Indices de la tabla `estados`
--
ALTER TABLE `estados`
  ADD PRIMARY KEY (`ID_Estado`),
  ADD UNIQUE KEY `Nombre_Estado` (`Nombre_Estado`);

--
-- Indices de la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD PRIMARY KEY (`ID_Municipio`),
  ADD KEY `ID_Estado` (`ID_Estado`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `carros`
--
ALTER TABLE `carros`
  MODIFY `id_vehiculo` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `municipios`
--
ALTER TABLE `municipios`
  ADD CONSTRAINT `municipios_ibfk_1` FOREIGN KEY (`ID_Estado`) REFERENCES `estados` (`ID_Estado`);
--
-- Base de datos: `phpmyadmin`
--
CREATE DATABASE IF NOT EXISTS `phpmyadmin` DEFAULT CHARACTER SET utf8 COLLATE utf8_bin;
USE `phpmyadmin`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__bookmark`
--

CREATE TABLE `pma__bookmark` (
  `id` int(10) UNSIGNED NOT NULL,
  `dbase` varchar(255) NOT NULL DEFAULT '',
  `user` varchar(255) NOT NULL DEFAULT '',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `query` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Bookmarks';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__central_columns`
--

CREATE TABLE `pma__central_columns` (
  `db_name` varchar(64) NOT NULL,
  `col_name` varchar(64) NOT NULL,
  `col_type` varchar(64) NOT NULL,
  `col_length` text DEFAULT NULL,
  `col_collation` varchar(64) NOT NULL,
  `col_isNull` tinyint(1) NOT NULL,
  `col_extra` varchar(255) DEFAULT '',
  `col_default` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Central list of columns';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__column_info`
--

CREATE TABLE `pma__column_info` (
  `id` int(5) UNSIGNED NOT NULL,
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `column_name` varchar(64) NOT NULL DEFAULT '',
  `comment` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `mimetype` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '',
  `transformation` varchar(255) NOT NULL DEFAULT '',
  `transformation_options` varchar(255) NOT NULL DEFAULT '',
  `input_transformation` varchar(255) NOT NULL DEFAULT '',
  `input_transformation_options` varchar(255) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Column information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__designer_settings`
--

CREATE TABLE `pma__designer_settings` (
  `username` varchar(64) NOT NULL,
  `settings_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Settings related to Designer';

--
-- Volcado de datos para la tabla `pma__designer_settings`
--

INSERT INTO `pma__designer_settings` (`username`, `settings_data`) VALUES
('root', '{\"angular_direct\":\"direct\",\"snap_to_grid\":\"on\",\"relation_lines\":\"true\",\"pin_text\":\"false\",\"full_screen\":\"off\",\"small_big_all\":\">\"}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__export_templates`
--

CREATE TABLE `pma__export_templates` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL,
  `export_type` varchar(10) NOT NULL,
  `template_name` varchar(64) NOT NULL,
  `template_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved export templates';

--
-- Volcado de datos para la tabla `pma__export_templates`
--

INSERT INTO `pma__export_templates` (`id`, `username`, `export_type`, `template_name`, `template_data`) VALUES
(1, 'root', 'server', 'db_jose_pma', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"db_andres\",\"db_andres_pma\",\"db_andres_tmp\",\"db_jose\",\"db_jose_pma\",\"db_jose_tmp\",\"db_profesor\",\"db_profesor_pma\",\"db_profesor_tmp\",\"db_ricardo\",\"db_ricardo_pma\",\"db_ricardo_tmp\",\"ejemplos_ajax\",\"phpmyadmin\",\"prueba\",\"prueba7\",\"pruebacp\",\"shoppingcar\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}'),
(7, 'root', 'server', 'db_jose', '{\"quick_or_custom\":\"quick\",\"what\":\"sql\",\"db_select[]\":[\"db_andres\",\"db_andres_pma\",\"db_andres_tmp\",\"db_jose\",\"db_jose_pma\",\"db_jose_tmp\",\"db_profesor\",\"db_profesor_pma\",\"db_profesor_tmp\",\"db_ricardo\",\"db_ricardo_pma\",\"db_ricardo_tmp\",\"ejemplos_ajax\",\"phpmyadmin\",\"prueba\",\"prueba7\",\"pruebacp\",\"shoppingcar\",\"test\"],\"aliases_new\":\"\",\"output_format\":\"sendit\",\"filename_template\":\"@SERVER@\",\"remember_template\":\"on\",\"charset\":\"utf-8\",\"compression\":\"none\",\"maxsize\":\"\",\"codegen_structure_or_data\":\"data\",\"codegen_format\":\"0\",\"csv_separator\":\",\",\"csv_enclosed\":\"\\\"\",\"csv_escaped\":\"\\\"\",\"csv_terminated\":\"AUTO\",\"csv_null\":\"NULL\",\"csv_columns\":\"something\",\"csv_structure_or_data\":\"data\",\"excel_null\":\"NULL\",\"excel_columns\":\"something\",\"excel_edition\":\"win\",\"excel_structure_or_data\":\"data\",\"json_structure_or_data\":\"data\",\"json_unicode\":\"something\",\"latex_caption\":\"something\",\"latex_structure_or_data\":\"structure_and_data\",\"latex_structure_caption\":\"Estructura de la tabla @TABLE@\",\"latex_structure_continued_caption\":\"Estructura de la tabla @TABLE@ (continúa)\",\"latex_structure_label\":\"tab:@TABLE@-structure\",\"latex_relation\":\"something\",\"latex_comments\":\"something\",\"latex_mime\":\"something\",\"latex_columns\":\"something\",\"latex_data_caption\":\"Contenido de la tabla @TABLE@\",\"latex_data_continued_caption\":\"Contenido de la tabla @TABLE@ (continúa)\",\"latex_data_label\":\"tab:@TABLE@-data\",\"latex_null\":\"\\\\textit{NULL}\",\"mediawiki_structure_or_data\":\"data\",\"mediawiki_caption\":\"something\",\"mediawiki_headers\":\"something\",\"htmlword_structure_or_data\":\"structure_and_data\",\"htmlword_null\":\"NULL\",\"ods_null\":\"NULL\",\"ods_structure_or_data\":\"data\",\"odt_structure_or_data\":\"structure_and_data\",\"odt_relation\":\"something\",\"odt_comments\":\"something\",\"odt_mime\":\"something\",\"odt_columns\":\"something\",\"odt_null\":\"NULL\",\"pdf_report_title\":\"\",\"pdf_structure_or_data\":\"data\",\"phparray_structure_or_data\":\"data\",\"sql_include_comments\":\"something\",\"sql_header_comment\":\"\",\"sql_use_transaction\":\"something\",\"sql_compatibility\":\"NONE\",\"sql_structure_or_data\":\"structure_and_data\",\"sql_create_table\":\"something\",\"sql_auto_increment\":\"something\",\"sql_create_view\":\"something\",\"sql_create_trigger\":\"something\",\"sql_backquotes\":\"something\",\"sql_type\":\"INSERT\",\"sql_insert_syntax\":\"both\",\"sql_max_query_size\":\"50000\",\"sql_hex_for_binary\":\"something\",\"sql_utc_time\":\"something\",\"texytext_structure_or_data\":\"structure_and_data\",\"texytext_null\":\"NULL\",\"yaml_structure_or_data\":\"data\",\"\":null,\"as_separate_files\":null,\"csv_removeCRLF\":null,\"excel_removeCRLF\":null,\"json_pretty_print\":null,\"htmlword_columns\":null,\"ods_columns\":null,\"sql_dates\":null,\"sql_relation\":null,\"sql_mime\":null,\"sql_disable_fk\":null,\"sql_views_as_tables\":null,\"sql_metadata\":null,\"sql_drop_database\":null,\"sql_drop_table\":null,\"sql_if_not_exists\":null,\"sql_simple_view_export\":null,\"sql_view_current_user\":null,\"sql_or_replace_view\":null,\"sql_procedure_function\":null,\"sql_truncate\":null,\"sql_delayed\":null,\"sql_ignore\":null,\"texytext_columns\":null}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__favorite`
--

CREATE TABLE `pma__favorite` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Favorite tables';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__history`
--

CREATE TABLE `pma__history` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db` varchar(64) NOT NULL DEFAULT '',
  `table` varchar(64) NOT NULL DEFAULT '',
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp(),
  `sqlquery` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SQL history for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__navigationhiding`
--

CREATE TABLE `pma__navigationhiding` (
  `username` varchar(64) NOT NULL,
  `item_name` varchar(64) NOT NULL,
  `item_type` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Hidden items of navigation tree';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__pdf_pages`
--

CREATE TABLE `pma__pdf_pages` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `page_nr` int(10) UNSIGNED NOT NULL,
  `page_descr` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='PDF relation pages for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__pdf_pages`
--

INSERT INTO `pma__pdf_pages` (`db_name`, `page_nr`, `page_descr`) VALUES
('db_profesor_pma', 1, 'der_01'),
('db_jose_pma', 2, 'Entidades y relacion'),
('db_andres_pma', 3, 'der01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__recent`
--

CREATE TABLE `pma__recent` (
  `username` varchar(64) NOT NULL,
  `tables` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Recently accessed tables';

--
-- Volcado de datos para la tabla `pma__recent`
--

INSERT INTO `pma__recent` (`username`, `tables`) VALUES
('root', '[{\"db\":\"db_andres_pma\",\"table\":\"personas\"},{\"db\":\"db_profesor_pma\",\"table\":\"estudiantes\"},{\"db\":\"db_jose_pma\",\"table\":\"personas\"},{\"db\":\"db_profesor_pma\",\"table\":\"personas\"},{\"db\":\"db_jose_pma\",\"table\":\"log\"},{\"db\":\"db_jose_pma\",\"table\":\"estudiantes_asignaturas\"},{\"db\":\"db_profesor_pma\",\"table\":\"log\"},{\"db\":\"db_ricardo_pma\",\"table\":\"personas\"},{\"db\":\"db_jose_pma\",\"table\":\"estudiantes\"},{\"db\":\"db_profesor_pma\",\"table\":\"personas_con_indice\"}]');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__relation`
--

CREATE TABLE `pma__relation` (
  `master_db` varchar(64) NOT NULL DEFAULT '',
  `master_table` varchar(64) NOT NULL DEFAULT '',
  `master_field` varchar(64) NOT NULL DEFAULT '',
  `foreign_db` varchar(64) NOT NULL DEFAULT '',
  `foreign_table` varchar(64) NOT NULL DEFAULT '',
  `foreign_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Relation table';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__savedsearches`
--

CREATE TABLE `pma__savedsearches` (
  `id` int(5) UNSIGNED NOT NULL,
  `username` varchar(64) NOT NULL DEFAULT '',
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `search_name` varchar(64) NOT NULL DEFAULT '',
  `search_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Saved searches';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_coords`
--

CREATE TABLE `pma__table_coords` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `pdf_page_number` int(11) NOT NULL DEFAULT 0,
  `x` float UNSIGNED NOT NULL DEFAULT 0,
  `y` float UNSIGNED NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table coordinates for phpMyAdmin PDF output';

--
-- Volcado de datos para la tabla `pma__table_coords`
--

INSERT INTO `pma__table_coords` (`db_name`, `table_name`, `pdf_page_number`, `x`, `y`) VALUES
('db_andres_pma', 'productos_cascade', 3, 550, 150),
('db_andres_pma', 'proveedores_cascade', 3, 130, 140),
('db_jose_pma', 'asignaturas', 2, 40, 410),
('db_jose_pma', 'estudiantes', 2, 40, 310),
('db_jose_pma', 'estudiantes_asignaturas', 2, 260, 310),
('db_jose_pma', 'personas', 2, 10, 700),
('db_jose_pma', 'personas_con_indice', 2, 240, 680),
('db_jose_pma', 'personas_con_indice_cedula_correo', 2, 520, 710),
('db_profesor_pma', 'personas', 1, 150, 210),
('db_profesor_pma', 'personas_con_indice', 1, 490, 330),
('db_profesor_pma', 'personas_con_indice_cedula_correo', 1, 150, 430),
('db_profesor_pma', 'productos', 1, 570, 230),
('db_profesor_pma', 'proveedores', 1, 220, 80);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_info`
--

CREATE TABLE `pma__table_info` (
  `db_name` varchar(64) NOT NULL DEFAULT '',
  `table_name` varchar(64) NOT NULL DEFAULT '',
  `display_field` varchar(64) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Table information for phpMyAdmin';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__table_uiprefs`
--

CREATE TABLE `pma__table_uiprefs` (
  `username` varchar(64) NOT NULL,
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `prefs` text NOT NULL,
  `last_update` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Tables'' UI preferences';

--
-- Volcado de datos para la tabla `pma__table_uiprefs`
--

INSERT INTO `pma__table_uiprefs` (`username`, `db_name`, `table_name`, `prefs`, `last_update`) VALUES
('root', 'db_jose_pma', 'personas', '{\"sorted_col\":\"`personas`.`cedula` ASC\"}', '2026-09-21 14:23:36'),
('root', 'shoppingcar', 'cliente', '{\"CREATE_TIME\":\"2025-09-16 09:04:19\",\"col_order\":[0,1,2,4,3],\"col_visib\":[1,1,1,1,1]}', '2025-09-16 13:06:01');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__tracking`
--

CREATE TABLE `pma__tracking` (
  `db_name` varchar(64) NOT NULL,
  `table_name` varchar(64) NOT NULL,
  `version` int(10) UNSIGNED NOT NULL,
  `date_created` datetime NOT NULL,
  `date_updated` datetime NOT NULL,
  `schema_snapshot` text NOT NULL,
  `schema_sql` text DEFAULT NULL,
  `data_sql` longtext DEFAULT NULL,
  `tracking` set('UPDATE','REPLACE','INSERT','DELETE','TRUNCATE','CREATE DATABASE','ALTER DATABASE','DROP DATABASE','CREATE TABLE','ALTER TABLE','RENAME TABLE','DROP TABLE','CREATE INDEX','DROP INDEX','CREATE VIEW','ALTER VIEW','DROP VIEW') DEFAULT NULL,
  `tracking_active` int(1) UNSIGNED NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Database changes tracking for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__tracking`
--

INSERT INTO `pma__tracking` (`db_name`, `table_name`, `version`, `date_created`, `date_updated`, `schema_snapshot`, `schema_sql`, `data_sql`, `tracking`, `tracking_active`) VALUES
('db_andres_pma', 'personas', 1, '2026-09-23 17:09:58', '2026-09-23 17:09:58', 'a:2:{s:7:\"COLUMNS\";a:8:{i:0;a:8:{s:5:\"Field\";s:6:\"cedula\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"nombre\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"apellido\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:9:\"direccion\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:8:\"telefono\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:19:\"fecha_de_nacimiento\";s:4:\"Type\";s:4:\"date\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:7;a:8:{s:5:\"Field\";s:4:\"edad\";s:4:\"Type\";s:19:\"tinyint(3) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:0:{}}', '# log 2026-09-23 17:09:58 root\nDROP TABLE IF EXISTS `personas`;\n# log 2026-09-23 17:09:58 root\n\nCREATE TABLE `personas` (\n  `cedula` varchar(10) NOT NULL,\n  `nombre` varchar(30) NOT NULL,\n  `apellido` varchar(30) NOT NULL,\n  `direccion` text NOT NULL,\n  `email` text NOT NULL,\n  `telefono` varchar(20) NOT NULL,\n  `fecha_de_nacimiento` date NOT NULL,\n  `edad` tinyint(3) UNSIGNED NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX', 1),
('db_profesor_pma', 'personas', 1, '2026-09-23 17:09:46', '2026-09-23 17:09:46', 'a:2:{s:7:\"COLUMNS\";a:8:{i:0;a:8:{s:5:\"Field\";s:6:\"cedula\";s:4:\"Type\";s:11:\"varchar(10)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:1;a:8:{s:5:\"Field\";s:6:\"nombre\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:2;a:8:{s:5:\"Field\";s:8:\"apellido\";s:4:\"Type\";s:11:\"varchar(30)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:3;a:8:{s:5:\"Field\";s:9:\"direccion\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:4;a:8:{s:5:\"Field\";s:5:\"email\";s:4:\"Type\";s:4:\"text\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:5;a:8:{s:5:\"Field\";s:8:\"telefono\";s:4:\"Type\";s:11:\"varchar(20)\";s:9:\"Collation\";s:18:\"utf8mb4_general_ci\";s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:6;a:8:{s:5:\"Field\";s:19:\"fecha_de_nacimiento\";s:4:\"Type\";s:4:\"date\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}i:7;a:8:{s:5:\"Field\";s:4:\"edad\";s:4:\"Type\";s:19:\"tinyint(3) unsigned\";s:9:\"Collation\";N;s:4:\"Null\";s:2:\"NO\";s:3:\"Key\";s:0:\"\";s:7:\"Default\";N;s:5:\"Extra\";s:0:\"\";s:7:\"Comment\";s:0:\"\";}}s:7:\"INDEXES\";a:0:{}}', '# log 2026-09-23 17:09:46 root\nDROP TABLE IF EXISTS `personas`;\n# log 2026-09-23 17:09:46 root\n\nCREATE TABLE `personas` (\n  `cedula` varchar(10) NOT NULL,\n  `nombre` varchar(30) NOT NULL,\n  `apellido` varchar(30) NOT NULL,\n  `direccion` text NOT NULL,\n  `email` text NOT NULL,\n  `telefono` varchar(20) NOT NULL,\n  `fecha_de_nacimiento` date NOT NULL,\n  `edad` tinyint(3) UNSIGNED NOT NULL\n) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;\n', '\n', 'UPDATE,INSERT,DELETE,TRUNCATE,CREATE TABLE,ALTER TABLE,RENAME TABLE,DROP TABLE,CREATE INDEX,DROP INDEX', 1);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__userconfig`
--

CREATE TABLE `pma__userconfig` (
  `username` varchar(64) NOT NULL,
  `timevalue` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `config_data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User preferences storage for phpMyAdmin';

--
-- Volcado de datos para la tabla `pma__userconfig`
--

INSERT INTO `pma__userconfig` (`username`, `timevalue`, `config_data`) VALUES
('root', '2026-09-23 15:23:53', '{\"Console\\/Mode\":\"collapse\",\"lang\":\"es\",\"ThemeDefault\":\"pmahomme\",\"NavigationWidth\":0}');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__usergroups`
--

CREATE TABLE `pma__usergroups` (
  `usergroup` varchar(64) NOT NULL,
  `tab` varchar(64) NOT NULL,
  `allowed` enum('Y','N') NOT NULL DEFAULT 'N'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='User groups with configured menu items';

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `pma__users`
--

CREATE TABLE `pma__users` (
  `username` varchar(64) NOT NULL,
  `usergroup` varchar(64) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='Users and their assignments to user groups';

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  ADD PRIMARY KEY (`id`);

--
-- Indices de la tabla `pma__central_columns`
--
ALTER TABLE `pma__central_columns`
  ADD PRIMARY KEY (`db_name`,`col_name`);

--
-- Indices de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `db_name` (`db_name`,`table_name`,`column_name`);

--
-- Indices de la tabla `pma__designer_settings`
--
ALTER TABLE `pma__designer_settings`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_user_type_template` (`username`,`export_type`,`template_name`);

--
-- Indices de la tabla `pma__favorite`
--
ALTER TABLE `pma__favorite`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `username` (`username`,`db`,`table`,`timevalue`);

--
-- Indices de la tabla `pma__navigationhiding`
--
ALTER TABLE `pma__navigationhiding`
  ADD PRIMARY KEY (`username`,`item_name`,`item_type`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  ADD PRIMARY KEY (`page_nr`),
  ADD KEY `db_name` (`db_name`);

--
-- Indices de la tabla `pma__recent`
--
ALTER TABLE `pma__recent`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__relation`
--
ALTER TABLE `pma__relation`
  ADD PRIMARY KEY (`master_db`,`master_table`,`master_field`),
  ADD KEY `foreign_field` (`foreign_db`,`foreign_table`);

--
-- Indices de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `u_savedsearches_username_dbname` (`username`,`db_name`,`search_name`);

--
-- Indices de la tabla `pma__table_coords`
--
ALTER TABLE `pma__table_coords`
  ADD PRIMARY KEY (`db_name`,`table_name`,`pdf_page_number`);

--
-- Indices de la tabla `pma__table_info`
--
ALTER TABLE `pma__table_info`
  ADD PRIMARY KEY (`db_name`,`table_name`);

--
-- Indices de la tabla `pma__table_uiprefs`
--
ALTER TABLE `pma__table_uiprefs`
  ADD PRIMARY KEY (`username`,`db_name`,`table_name`);

--
-- Indices de la tabla `pma__tracking`
--
ALTER TABLE `pma__tracking`
  ADD PRIMARY KEY (`db_name`,`table_name`,`version`);

--
-- Indices de la tabla `pma__userconfig`
--
ALTER TABLE `pma__userconfig`
  ADD PRIMARY KEY (`username`);

--
-- Indices de la tabla `pma__usergroups`
--
ALTER TABLE `pma__usergroups`
  ADD PRIMARY KEY (`usergroup`,`tab`,`allowed`);

--
-- Indices de la tabla `pma__users`
--
ALTER TABLE `pma__users`
  ADD PRIMARY KEY (`username`,`usergroup`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `pma__bookmark`
--
ALTER TABLE `pma__bookmark`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__column_info`
--
ALTER TABLE `pma__column_info`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__export_templates`
--
ALTER TABLE `pma__export_templates`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT de la tabla `pma__history`
--
ALTER TABLE `pma__history`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `pma__pdf_pages`
--
ALTER TABLE `pma__pdf_pages`
  MODIFY `page_nr` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `pma__savedsearches`
--
ALTER TABLE `pma__savedsearches`
  MODIFY `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT;
--
-- Base de datos: `prueba`
--
CREATE DATABASE IF NOT EXISTS `prueba` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nu_cliente` int(11) NOT NULL,
  `nb_cliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nu_cliente`, `nb_cliente`) VALUES
(2, 'Ana Gonzalez'),
(1, 'Pedro Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `nu_compra` int(11) NOT NULL,
  `fe_compra` date DEFAULT current_timestamp(),
  `nu_cliente` int(11) NOT NULL,
  `nu_producto` int(11) NOT NULL,
  `ca_producto` smallint(5) UNSIGNED NOT NULL,
  `mo_subtotal` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`nu_compra`, `fe_compra`, `nu_cliente`, `nu_producto`, `ca_producto`, `mo_subtotal`) VALUES
(1, '2025-10-28', 1, 3, 31, 620.00),
(2, '2025-10-28', 2, 3, 47, 940.00),
(3, '2025-10-28', 1, 4, 33, 330.00),
(4, '2025-10-28', 2, 4, 14, 140.00),
(5, '2025-10-28', 1, 2, 63, 945.00),
(6, '2025-10-28', 2, 2, 59, 885.00),
(7, '2025-10-28', 1, 1, 99, 3465.00),
(8, '2025-10-28', 2, 1, 109, 3815.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nu_factura` int(11) NOT NULL,
  `fe_factura` date DEFAULT current_timestamp(),
  `nu_cliente` int(11) NOT NULL,
  `ca_producto` int(11) NOT NULL,
  `mo_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `factura`
--

INSERT INTO `factura` (`nu_factura`, `fe_factura`, `nu_cliente`, `ca_producto`, `mo_total`) VALUES
(3, '2025-10-28', 1, 226, 5360.00),
(4, '2025-10-28', 2, 229, 5780.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `nu_producto` int(11) NOT NULL,
  `nb_producto` varchar(20) NOT NULL,
  `va_precio` decimal(10,2) DEFAULT 0.00,
  `ca_existencia` smallint(5) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`nu_producto`, `nb_producto`, `va_precio`, `ca_existencia`) VALUES
(1, 'Zapatos', 35.00, 50),
(2, 'Pantalon', 15.00, 50),
(3, 'Camisa', 20.00, 50),
(4, 'Gorra', 10.00, 50);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_compra` (
`nu_compra` int(11)
,`fe_compra` date
,`nu_cliente` int(11)
,`nu_producto` int(11)
,`ca_producto` smallint(5) unsigned
,`mo_subtotal` decimal(10,2)
,`nb_cliente` varchar(30)
,`nb_producto` varchar(20)
,`ca_existencia` smallint(5) unsigned
,`va_precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_compra2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_compra2` (
`nu_compra` int(11)
,`fe_compra` date
,`nu_cliente` int(11)
,`nu_producto` int(11)
,`ca_producto` smallint(5) unsigned
,`mo_subtotal` decimal(10,2)
,`fe_compra_latina` varchar(10)
,`nb_cliente` varchar(30)
,`nb_producto` varchar(20)
,`ca_existencia` smallint(5) unsigned
,`va_precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_compra_reporte`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_compra_reporte` (
`nu_compra` int(11)
,`Fecha de Compra` varchar(10)
,`nu_cliente` int(11)
,`nu_producto` int(11)
,`Cantidad` smallint(5) unsigned
,`Subtotal` decimal(10,2)
,`Nombre del Cliente` varchar(30)
,`Nombre del Producto` varchar(20)
,`Existencia` smallint(5) unsigned
,`Precio` decimal(10,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_compra_reporte2`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_compra_reporte2` (
`nu_compra` int(11)
,`Fecha de Compra` varchar(10)
,`nu_cliente` int(11)
,`nu_producto` int(11)
,`Cantidad` smallint(5) unsigned
,`Subtotal` decimal(10,2)
,`Nombre del Cliente` varchar(30)
,`Nombre del Producto` varchar(20)
,`Existencia` smallint(5) unsigned
,`Precio` decimal(10,2)
,`Total` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_crear_factura`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_crear_factura` (
`fe_compra` date
,`nu_cliente` int(11)
,`cantidad` decimal(27,0)
,`total` decimal(32,2)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_compra`
--
DROP TABLE IF EXISTS `view_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compra`  AS SELECT `x`.`nu_compra` AS `nu_compra`, `x`.`fe_compra` AS `fe_compra`, `x`.`nu_cliente` AS `nu_cliente`, `x`.`nu_producto` AS `nu_producto`, `x`.`ca_producto` AS `ca_producto`, `x`.`mo_subtotal` AS `mo_subtotal`, `c`.`nb_cliente` AS `nb_cliente`, `p`.`nb_producto` AS `nb_producto`, `p`.`ca_existencia` AS `ca_existencia`, `p`.`va_precio` AS `va_precio` FROM ((`compra` `x` join `cliente` `c` on(`x`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`x`.`nu_producto` = `p`.`nu_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_compra2`
--
DROP TABLE IF EXISTS `view_compra2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compra2`  AS SELECT `x`.`nu_compra` AS `nu_compra`, `x`.`fe_compra` AS `fe_compra`, `x`.`nu_cliente` AS `nu_cliente`, `x`.`nu_producto` AS `nu_producto`, `x`.`ca_producto` AS `ca_producto`, `x`.`mo_subtotal` AS `mo_subtotal`, date_format(`x`.`fe_compra`,'%d/%m/%Y') AS `fe_compra_latina`, `c`.`nb_cliente` AS `nb_cliente`, `p`.`nb_producto` AS `nb_producto`, `p`.`ca_existencia` AS `ca_existencia`, `p`.`va_precio` AS `va_precio` FROM ((`compra` `x` join `cliente` `c` on(`x`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`x`.`nu_producto` = `p`.`nu_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_compra_reporte`
--
DROP TABLE IF EXISTS `view_compra_reporte`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compra_reporte`  AS SELECT `x`.`nu_compra` AS `nu_compra`, date_format(`x`.`fe_compra`,'%d/%m/%Y') AS `Fecha de Compra`, `x`.`nu_cliente` AS `nu_cliente`, `x`.`nu_producto` AS `nu_producto`, `x`.`ca_producto` AS `Cantidad`, `x`.`mo_subtotal` AS `Subtotal`, `c`.`nb_cliente` AS `Nombre del Cliente`, `p`.`nb_producto` AS `Nombre del Producto`, `p`.`ca_existencia` AS `Existencia`, `p`.`va_precio` AS `Precio` FROM ((`compra` `x` join `cliente` `c` on(`x`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`x`.`nu_producto` = `p`.`nu_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_compra_reporte2`
--
DROP TABLE IF EXISTS `view_compra_reporte2`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compra_reporte2`  AS SELECT `x`.`nu_compra` AS `nu_compra`, date_format(`x`.`fe_compra`,'%d/%m/%Y') AS `Fecha de Compra`, `x`.`nu_cliente` AS `nu_cliente`, `x`.`nu_producto` AS `nu_producto`, `x`.`ca_producto` AS `Cantidad`, `x`.`mo_subtotal` AS `Subtotal`, `c`.`nb_cliente` AS `Nombre del Cliente`, `p`.`nb_producto` AS `Nombre del Producto`, `p`.`ca_existencia` AS `Existencia`, `p`.`va_precio` AS `Precio`, (select sum(`w`.`mo_subtotal`) from `compra` `w` where `w`.`nu_cliente` = `x`.`nu_cliente`) AS `Total` FROM ((`compra` `x` join `cliente` `c` on(`x`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`x`.`nu_producto` = `p`.`nu_producto`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_crear_factura`
--
DROP TABLE IF EXISTS `view_crear_factura`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_crear_factura`  AS SELECT `c`.`fe_compra` AS `fe_compra`, `c`.`nu_cliente` AS `nu_cliente`, sum(`c`.`ca_producto`) AS `cantidad`, sum(`c`.`mo_subtotal`) AS `total` FROM `compra` AS `c` WHERE !exists(select 1 from `factura` `f` where `f`.`fe_factura` = `c`.`fe_compra` AND `f`.`nu_cliente` = `c`.`nu_cliente` limit 1) GROUP BY `c`.`fe_compra`, `c`.`nu_cliente` ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nu_cliente`),
  ADD UNIQUE KEY `nb_cliente` (`nb_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`nu_compra`),
  ADD KEY `nu_cliente` (`nu_cliente`),
  ADD KEY `nu_producto` (`nu_producto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nu_factura`),
  ADD KEY `nu_cliente` (`nu_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`nu_producto`),
  ADD UNIQUE KEY `nb_producto` (`nb_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `nu_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `nu_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nu_factura` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `nu_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`nu_producto`) REFERENCES `producto` (`nu_producto`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`);
--
-- Base de datos: `prueba7`
--
CREATE DATABASE IF NOT EXISTS `prueba7` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `prueba7`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nu_cliente` int(11) NOT NULL,
  `nb_cliente` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nu_cliente`, `nb_cliente`) VALUES
(2, 'Ana Gonzalez'),
(1, 'Pedro Perez');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `nu_compra` int(11) NOT NULL,
  `fe_compra` date DEFAULT current_timestamp(),
  `nu_cliente` int(11) NOT NULL,
  `nu_producto` int(11) NOT NULL,
  `ca_producto` smallint(5) UNSIGNED NOT NULL,
  `mo_subtotal` decimal(10,2) DEFAULT 0.00
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`nu_compra`, `fe_compra`, `nu_cliente`, `nu_producto`, `ca_producto`, `mo_subtotal`) VALUES
(1, '2025-10-28', 1, 3, 36, 720.00),
(2, '2025-10-28', 2, 3, 70, 1400.00),
(3, '2025-10-28', 1, 4, 34, 340.00),
(4, '2025-10-28', 2, 4, 47, 470.00),
(5, '2025-10-28', 1, 2, 24, 360.00),
(6, '2025-10-28', 2, 2, 69, 1035.00),
(7, '2025-10-28', 1, 1, 65, 2275.00),
(8, '2025-10-28', 2, 1, 106, 3710.00);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `factura`
--

CREATE TABLE `factura` (
  `nu_factura` int(11) NOT NULL,
  `fe_factura` date DEFAULT current_timestamp(),
  `nu_cliente` int(11) NOT NULL,
  `ca_producto` int(11) NOT NULL,
  `mo_total` decimal(10,2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `nu_producto` int(11) NOT NULL,
  `nb_producto` varchar(20) NOT NULL,
  `va_precio` decimal(10,2) DEFAULT 0.00,
  `ca_existencia` smallint(5) UNSIGNED DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`nu_producto`, `nb_producto`, `va_precio`, `ca_existencia`) VALUES
(1, 'Zapatos', 35.00, 50),
(2, 'Pantalon', 15.00, 50),
(3, 'Camisa', 20.00, 50),
(4, 'Gorra', 10.00, 50);

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nu_cliente`),
  ADD UNIQUE KEY `nb_cliente` (`nb_cliente`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`nu_compra`),
  ADD KEY `nu_cliente` (`nu_cliente`),
  ADD KEY `nu_producto` (`nu_producto`);

--
-- Indices de la tabla `factura`
--
ALTER TABLE `factura`
  ADD PRIMARY KEY (`nu_factura`),
  ADD KEY `nu_cliente` (`nu_cliente`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`nu_producto`),
  ADD UNIQUE KEY `nb_producto` (`nb_producto`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `nu_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `nu_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT de la tabla `factura`
--
ALTER TABLE `factura`
  MODIFY `nu_factura` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `nu_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`),
  ADD CONSTRAINT `compra_ibfk_2` FOREIGN KEY (`nu_producto`) REFERENCES `producto` (`nu_producto`);

--
-- Filtros para la tabla `factura`
--
ALTER TABLE `factura`
  ADD CONSTRAINT `factura_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`);
--
-- Base de datos: `pruebacp`
--
CREATE DATABASE IF NOT EXISTS `pruebacp` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `pruebacp`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cosas`
--

CREATE TABLE `cosas` (
  `valor` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cosas`
--

INSERT INTO `cosas` (`valor`) VALUES
(6);
--
-- Base de datos: `shoppingcar`
--
CREATE DATABASE IF NOT EXISTS `shoppingcar` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `shoppingcar`;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `carrito`
--

CREATE TABLE `carrito` (
  `nu_cliente` int(11) NOT NULL,
  `nu_producto` int(11) NOT NULL,
  `fe_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `categoria`
--

CREATE TABLE `categoria` (
  `nu_categoria` int(11) NOT NULL,
  `nb_categoria` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `categoria`
--

INSERT INTO `categoria` (`nu_categoria`, `nb_categoria`) VALUES
(4, 'Alimentos'),
(2, 'Electrónicos'),
(3, 'Farmacia'),
(1, 'Juguetes');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `cliente`
--

CREATE TABLE `cliente` (
  `nu_cliente` int(11) NOT NULL,
  `nb_cliente` varchar(50) NOT NULL,
  `nu_cedula` int(11) NOT NULL,
  `co_correo` varchar(35) NOT NULL,
  `co_clave` varchar(35) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `cliente`
--

INSERT INTO `cliente` (`nu_cliente`, `nb_cliente`, `nu_cedula`, `co_correo`, `co_clave`) VALUES
(2, 'Pedro Perez', 1000, 'perez@gmail.com', '123456');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `compra`
--

CREATE TABLE `compra` (
  `nu_compra` int(11) NOT NULL,
  `fe_compra` date NOT NULL,
  `nu_cliente` int(11) NOT NULL,
  `in_despacho` char(1) NOT NULL,
  `fe_despacho` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `compra`
--

INSERT INTO `compra` (`nu_compra`, `fe_compra`, `nu_cliente`, `in_despacho`, `fe_despacho`) VALUES
(1, '2025-09-16', 2, 'C', NULL),
(2, '2025-09-16', 2, 'C', NULL);

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `detalle_compra`
--

CREATE TABLE `detalle_compra` (
  `nu_detalle` int(11) NOT NULL,
  `nu_compra` int(11) NOT NULL,
  `nu_producto` int(11) NOT NULL,
  `ca_producto` int(11) NOT NULL,
  `fe_registro` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `detalle_compra`
--

INSERT INTO `detalle_compra` (`nu_detalle`, `nu_compra`, `nu_producto`, `ca_producto`, `fe_registro`) VALUES
(1, 1, 9, 2, '2025-09-16'),
(2, 1, 13, 6, '2025-09-16'),
(3, 2, 11, 5, '2025-09-16');

-- --------------------------------------------------------

--
-- Estructura de tabla para la tabla `producto`
--

CREATE TABLE `producto` (
  `nu_producto` int(11) NOT NULL,
  `nb_producto` varchar(50) NOT NULL,
  `de_producto` text NOT NULL,
  `va_precio` decimal(10,0) NOT NULL,
  `ca_existencia` int(11) NOT NULL,
  `nb_imagen` varchar(35) NOT NULL,
  `nu_categoria` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Volcado de datos para la tabla `producto`
--

INSERT INTO `producto` (`nu_producto`, `nb_producto`, `de_producto`, `va_precio`, `ca_existencia`, `nb_imagen`, `nu_categoria`) VALUES
(1, 'Ajedrez', 'Juego de mesa', 10, 20, 'sin_imagen.png', 1),
(2, 'Tren eléctrico', 'Pista de juguete para niños', 50, 20, 'tren_juguete.png', 1),
(3, 'Caballito de Madera', 'Mecedor de madera con forma de caballo para infantes', 60, 10, 'caballito.png', 1),
(4, 'Oso de Peluche', 'Oso de Peluche marca Toy', 25, 30, 'peluche.png', 1),
(5, 'Alimento de Perro', 'bolsa de 1kg de perrarina ', 10, 25, 'alimentos-para-mascotas.png', 4),
(6, 'Telefono celular', 'telefono marca xiaomi 8G/', 200, 15, 'celular.png', 2),
(7, 'Botella de Leche', 'botella de leche de marca Parmalat de 500ml', 7, 30, 'botella-de-leche.png', 4),
(8, 'pildoras', 'Medicina para malestar general', 5, 60, 'medicina.png', 3),
(9, 'Bombones de Chocolate', 'caja de 15 bombones de chocolate para regalo', 18, 10, 'bombones.png', 4),
(10, 'vacuna', 'vacuna para la fiebre amarilla', 55, 80, 'vacuna.png', 3),
(11, 'Ponquesitos de Vainilla', 'pack de 3 ponquesitos sabor vainilla ', 6, 17, 'dulces.png', 4),
(12, 'Cosméticos ', 'Maquillaje de mujer ', 25, 253, 'maquillaje.png', 3),
(13, 'Pollo ', '1 pollo entero grande', 15, 22, 'pierna-de-pollo.png', 4),
(14, 'amplificador', 'amplificador marca Sony', 25, 220, 'amplificador.png', 2),
(15, 'Lápiz labial ', 'Lápiz labial de diferentes colores', 7, 100, 'lapiz_labial.png', 3),
(16, 'Vino Tinto Pomar', 'botella de 1lt de vino tinto marca pomar', 17, 14, 'vino.png', 4),
(17, 'Celular', 'Ihpone 16', 1000, 30, 'cellphone.png', 2),
(18, 'tetero', 'botella de leche para bebes ', 30, 75, 'botella-de-leche.png', 3),
(19, 'camara fotografica', 'camara marca Nikkon D300s', 800, 20, 'camara.png', 2),
(20, 'babero ', 'babero para infantes', 90, 200, 'babero.png', 3),
(21, 'Computadora', 'Desktop para casa y negocio', 450, 30, 'computadora.png', 2),
(22, 'Olla de presion', 'Olla para cocina de presion de alta gama', 15, 6, 'olla.png', 4),
(23, 'Consolo games', 'consola para juegos', 90, 15, 'computer_games.png', 2),
(25, 'Perfumes', 'Variedad de perfumes de damas ', 100, 800, 'perfume_dama.png', 3);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_carrito`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_carrito` (
`nu_cliente` int(11)
,`nb_cliente` varchar(50)
,`nu_cedula` int(11)
,`co_correo` varchar(35)
,`co_clave` varchar(35)
,`nu_producto` int(11)
,`nb_producto` varchar(50)
,`de_producto` text
,`va_precio` decimal(10,0)
,`ca_existencia` int(11)
,`nb_imagen` varchar(35)
,`nu_categoria` int(11)
,`nb_categoria` varchar(50)
,`fe_registro` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_compra` (
`nu_compra` int(11)
,`nu_cliente` int(11)
,`fe_compra` date
,`in_despacho` char(1)
,`fe_despacho` date
,`nb_cliente` varchar(50)
,`co_correo` varchar(35)
,`co_clave` varchar(35)
,`nu_cedula` int(11)
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_detalle_compra`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_detalle_compra` (
`nu_detalle` int(11)
,`nu_compra` int(11)
,`fe_compra` date
,`in_despacho` char(1)
,`fe_despacho` date
,`nu_cliente` int(11)
,`nb_cliente` varchar(50)
,`nu_cedula` int(11)
,`co_correo` varchar(35)
,`co_clave` varchar(35)
,`nu_producto` int(11)
,`nb_producto` varchar(50)
,`de_producto` text
,`va_precio` decimal(10,0)
,`ca_existencia` int(11)
,`nb_imagen` varchar(35)
,`nu_categoria` int(11)
,`nb_categoria` varchar(50)
,`ca_producto` int(11)
,`fe_registro` date
);

-- --------------------------------------------------------

--
-- Estructura Stand-in para la vista `view_producto`
-- (Véase abajo para la vista actual)
--
CREATE TABLE `view_producto` (
`nu_producto` int(11)
,`nb_producto` varchar(50)
,`de_producto` text
,`va_precio` decimal(10,0)
,`ca_existencia` int(11)
,`nb_imagen` varchar(35)
,`nu_categoria` int(11)
,`nb_categoria` varchar(50)
);

-- --------------------------------------------------------

--
-- Estructura para la vista `view_carrito`
--
DROP TABLE IF EXISTS `view_carrito`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_carrito`  AS SELECT `c`.`nu_cliente` AS `nu_cliente`, `c`.`nb_cliente` AS `nb_cliente`, `c`.`nu_cedula` AS `nu_cedula`, `c`.`co_correo` AS `co_correo`, `c`.`co_clave` AS `co_clave`, `p`.`nu_producto` AS `nu_producto`, `p`.`nb_producto` AS `nb_producto`, `p`.`de_producto` AS `de_producto`, `p`.`va_precio` AS `va_precio`, `p`.`ca_existencia` AS `ca_existencia`, `p`.`nb_imagen` AS `nb_imagen`, `p`.`nu_categoria` AS `nu_categoria`, `t`.`nb_categoria` AS `nb_categoria`, `x`.`fe_registro` AS `fe_registro` FROM (((`carrito` `x` join `cliente` `c` on(`x`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`x`.`nu_producto` = `p`.`nu_producto`)) join `categoria` `t` on(`p`.`nu_categoria` = `t`.`nu_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_compra`
--
DROP TABLE IF EXISTS `view_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_compra`  AS SELECT `c`.`nu_compra` AS `nu_compra`, `c`.`nu_cliente` AS `nu_cliente`, `c`.`fe_compra` AS `fe_compra`, `c`.`in_despacho` AS `in_despacho`, `c`.`fe_despacho` AS `fe_despacho`, `b`.`nb_cliente` AS `nb_cliente`, `b`.`co_correo` AS `co_correo`, `b`.`co_clave` AS `co_clave`, `b`.`nu_cedula` AS `nu_cedula` FROM (`compra` `c` join `cliente` `b` on(`c`.`nu_cliente` = `b`.`nu_cliente`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_detalle_compra`
--
DROP TABLE IF EXISTS `view_detalle_compra`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_detalle_compra`  AS SELECT `dc`.`nu_detalle` AS `nu_detalle`, `co`.`nu_compra` AS `nu_compra`, `co`.`fe_compra` AS `fe_compra`, `co`.`in_despacho` AS `in_despacho`, `co`.`fe_despacho` AS `fe_despacho`, `c`.`nu_cliente` AS `nu_cliente`, `c`.`nb_cliente` AS `nb_cliente`, `c`.`nu_cedula` AS `nu_cedula`, `c`.`co_correo` AS `co_correo`, `c`.`co_clave` AS `co_clave`, `p`.`nu_producto` AS `nu_producto`, `p`.`nb_producto` AS `nb_producto`, `p`.`de_producto` AS `de_producto`, `p`.`va_precio` AS `va_precio`, `p`.`ca_existencia` AS `ca_existencia`, `p`.`nb_imagen` AS `nb_imagen`, `p`.`nu_categoria` AS `nu_categoria`, `t`.`nb_categoria` AS `nb_categoria`, `dc`.`ca_producto` AS `ca_producto`, `dc`.`fe_registro` AS `fe_registro` FROM ((((`detalle_compra` `dc` join `compra` `co` on(`dc`.`nu_compra` = `co`.`nu_compra`)) join `cliente` `c` on(`co`.`nu_cliente` = `c`.`nu_cliente`)) join `producto` `p` on(`dc`.`nu_producto` = `p`.`nu_producto`)) join `categoria` `t` on(`p`.`nu_categoria` = `t`.`nu_categoria`)) ;

-- --------------------------------------------------------

--
-- Estructura para la vista `view_producto`
--
DROP TABLE IF EXISTS `view_producto`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `view_producto`  AS SELECT `p`.`nu_producto` AS `nu_producto`, `p`.`nb_producto` AS `nb_producto`, `p`.`de_producto` AS `de_producto`, `p`.`va_precio` AS `va_precio`, `p`.`ca_existencia` AS `ca_existencia`, `p`.`nb_imagen` AS `nb_imagen`, `p`.`nu_categoria` AS `nu_categoria`, `c`.`nb_categoria` AS `nb_categoria` FROM (`producto` `p` join `categoria` `c` on(`p`.`nu_categoria` = `c`.`nu_categoria`)) ;

--
-- Índices para tablas volcadas
--

--
-- Indices de la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD PRIMARY KEY (`nu_cliente`,`nu_producto`),
  ADD KEY `nu_producto` (`nu_producto`);

--
-- Indices de la tabla `categoria`
--
ALTER TABLE `categoria`
  ADD PRIMARY KEY (`nu_categoria`),
  ADD UNIQUE KEY `nb_categoria` (`nb_categoria`);

--
-- Indices de la tabla `cliente`
--
ALTER TABLE `cliente`
  ADD PRIMARY KEY (`nu_cliente`),
  ADD UNIQUE KEY `nu_cedula` (`nu_cedula`),
  ADD UNIQUE KEY `co_correo` (`co_correo`);

--
-- Indices de la tabla `compra`
--
ALTER TABLE `compra`
  ADD PRIMARY KEY (`nu_compra`),
  ADD KEY `nu_cliente` (`nu_cliente`);

--
-- Indices de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD PRIMARY KEY (`nu_detalle`),
  ADD UNIQUE KEY `nu_compra` (`nu_compra`,`nu_producto`),
  ADD KEY `nu_producto` (`nu_producto`);

--
-- Indices de la tabla `producto`
--
ALTER TABLE `producto`
  ADD PRIMARY KEY (`nu_producto`),
  ADD UNIQUE KEY `nb_producto` (`nb_producto`,`nu_categoria`),
  ADD KEY `nu_categoria` (`nu_categoria`);

--
-- AUTO_INCREMENT de las tablas volcadas
--

--
-- AUTO_INCREMENT de la tabla `categoria`
--
ALTER TABLE `categoria`
  MODIFY `nu_categoria` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT de la tabla `cliente`
--
ALTER TABLE `cliente`
  MODIFY `nu_cliente` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `compra`
--
ALTER TABLE `compra`
  MODIFY `nu_compra` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT de la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  MODIFY `nu_detalle` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT de la tabla `producto`
--
ALTER TABLE `producto`
  MODIFY `nu_producto` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=26;

--
-- Restricciones para tablas volcadas
--

--
-- Filtros para la tabla `carrito`
--
ALTER TABLE `carrito`
  ADD CONSTRAINT `carrito_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`),
  ADD CONSTRAINT `carrito_ibfk_2` FOREIGN KEY (`nu_producto`) REFERENCES `producto` (`nu_producto`);

--
-- Filtros para la tabla `compra`
--
ALTER TABLE `compra`
  ADD CONSTRAINT `compra_ibfk_1` FOREIGN KEY (`nu_cliente`) REFERENCES `cliente` (`nu_cliente`);

--
-- Filtros para la tabla `detalle_compra`
--
ALTER TABLE `detalle_compra`
  ADD CONSTRAINT `detalle_compra_ibfk_1` FOREIGN KEY (`nu_compra`) REFERENCES `compra` (`nu_compra`),
  ADD CONSTRAINT `detalle_compra_ibfk_2` FOREIGN KEY (`nu_producto`) REFERENCES `producto` (`nu_producto`);

--
-- Filtros para la tabla `producto`
--
ALTER TABLE `producto`
  ADD CONSTRAINT `producto_ibfk_1` FOREIGN KEY (`nu_categoria`) REFERENCES `categoria` (`nu_categoria`);
--
-- Base de datos: `test`
--
CREATE DATABASE IF NOT EXISTS `test` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `test`;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
