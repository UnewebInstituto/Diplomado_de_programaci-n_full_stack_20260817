-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_profesor
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `asignaturas`
--

DROP TABLE IF EXISTS `asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `asignaturas` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `area` text DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asignaturas`
--

LOCK TABLES `asignaturas` WRITE;
/*!40000 ALTER TABLE `asignaturas` DISABLE KEYS */;
INSERT INTO `asignaturas` VALUES (1,'L?GICA DE PROGRAMACI?N','PROGRAMACI?N'),(2,'MYSQL','BASES DE DATOS'),(3,'POSTGRESQL','BASES DE DATOS'),(4,'HTML','DESARROLLO WEB'),(5,'JAVASCRIPT','DESARROLLO WEB'),(6,'PHP','DESARROLLO WEB'),(7,'PYTHON','PROGRAMACI?N');
/*!40000 ALTER TABLE `asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes`
--

DROP TABLE IF EXISTS `estudiantes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(40) DEFAULT NULL,
  `apellido` varchar(40) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes`
--

LOCK TABLES `estudiantes` WRITE;
/*!40000 ALTER TABLE `estudiantes` DISABLE KEYS */;
INSERT INTO `estudiantes` VALUES (1,'JOSE','MEDINA'),(2,'RICARDO','SILVA'),(3,'ANDRES','FRANCO');
/*!40000 ALTER TABLE `estudiantes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estudiantes_asignaturas`
--

DROP TABLE IF EXISTS `estudiantes_asignaturas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `estudiantes_asignaturas` (
  `estudiante_id` int(10) unsigned NOT NULL,
  `asignatura_id` int(10) unsigned NOT NULL,
  `periodo_del_curso` int(4) unsigned NOT NULL,
  `nota` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`estudiante_id`,`asignatura_id`,`periodo_del_curso`),
  KEY `asignatura_id` (`asignatura_id`),
  CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiante_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignatura_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes_asignaturas`
--

LOCK TABLES `estudiantes_asignaturas` WRITE;
/*!40000 ALTER TABLE `estudiantes_asignaturas` DISABLE KEYS */;
INSERT INTO `estudiantes_asignaturas` VALUES (1,1,2025,80),(1,1,2026,90),(1,2,2026,100),(1,4,2025,90),(2,1,2025,90),(2,2,2026,85),(2,4,2025,100),(3,1,2025,95),(3,2,2026,100),(3,4,2025,100);
/*!40000 ALTER TABLE `estudiantes_asignaturas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas`
--

DROP TABLE IF EXISTS `personas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES ('V1234','ANA','VASQUEZ','SANTA FE','av@gmail.com','2124445566','1960-08-15',66),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','2123334455','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124434930','1968-07-16',58),('V3456','LIBIA','COLS','GUARENAS','lc@gmail.com','2123634106','1975-05-20',51);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas1`
--

DROP TABLE IF EXISTS `personas1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas1` (
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas1`
--

LOCK TABLES `personas1` WRITE;
/*!40000 ALTER TABLE `personas1` DISABLE KEYS */;
/*!40000 ALTER TABLE `personas1` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_con_indice`
--

DROP TABLE IF EXISTS `personas_con_indice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas_con_indice` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cedula` varchar(10) DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_con_indice`
--

LOCK TABLES `personas_con_indice` WRITE;
/*!40000 ALTER TABLE `personas_con_indice` DISABLE KEYS */;
INSERT INTO `personas_con_indice` VALUES (1,'V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','2123334455','1975-09-10',51),(2,'V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124434930','1968-07-16',58),(3,'V3456','LIBIA','COLS','GUARENAS','lc@gmail.com','2123634106','1975-05-20',51);
/*!40000 ALTER TABLE `personas_con_indice` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_con_indice_cedula`
--

DROP TABLE IF EXISTS `personas_con_indice_cedula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas_con_indice_cedula` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`cedula`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_con_indice_cedula`
--

LOCK TABLES `personas_con_indice_cedula` WRITE;
/*!40000 ALTER TABLE `personas_con_indice_cedula` DISABLE KEYS */;
INSERT INTO `personas_con_indice_cedula` VALUES ('V3456','LIBIA','COLS','GUARENAS','lc@gmail.com','2123634106','1975-05-20',51),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','2123334455','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124434930','1968-07-16',58);
/*!40000 ALTER TABLE `personas_con_indice_cedula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `personas_con_indice_cedula_correo`
--

DROP TABLE IF EXISTS `personas_con_indice_cedula_correo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `personas_con_indice_cedula_correo` (
  `cedula` varchar(10) NOT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `apellido` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `correo_electronico` varchar(80) NOT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`cedula`,`correo_electronico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas_con_indice_cedula_correo`
--

LOCK TABLES `personas_con_indice_cedula_correo` WRITE;
/*!40000 ALTER TABLE `personas_con_indice_cedula_correo` DISABLE KEYS */;
INSERT INTO `personas_con_indice_cedula_correo` VALUES ('V3456','LIBIA','COLS','GUARENAS','lc@gmail.com','2123634106','1975-05-20',51),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt1@gmail.com','2123334455','1975-09-10',51),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','2123334455','1975-09-10',51),('V56781','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','2123334455','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124434930','1968-07-16',58);
/*!40000 ALTER TABLE `personas_con_indice_cedula_correo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos`
--

DROP TABLE IF EXISTS `productos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (1,1,'NEVERA',6,500.25),(2,1,'COCINA',3,300.75),(3,2,'LAVADORA',2,800.50),(7,2,'MICROONDAS',8,150.25),(8,1,'LICUADORA',12,100.00),(9,2,'PLANCHA',12,75.50),(11,1,'HORNO A GAS',6,450.00),(12,2,'CAFETERA',12,250.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_cascade`
--

DROP TABLE IF EXISTS `productos_cascade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_cascade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_cascade_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores_cascade` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_cascade`
--

LOCK TABLES `productos_cascade` WRITE;
/*!40000 ALTER TABLE `productos_cascade` DISABLE KEYS */;
INSERT INTO `productos_cascade` VALUES (1,1,'NEVERA',6,500.25),(2,1,'COCINA',3,300.75),(3,4,'LAVADORA',2,800.50),(7,4,'MICROONDAS',8,150.25),(8,1,'LICUADORA',12,100.00),(9,4,'PLANCHA',12,75.50),(11,1,'HORNO A GAS',6,450.00),(12,4,'CAFETERA',12,250.00);
/*!40000 ALTER TABLE `productos_cascade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_secuencial`
--

DROP TABLE IF EXISTS `productos_secuencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_secuencial` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PROVEEDOR_ID` int(10) unsigned DEFAULT NULL,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `CANTIDAD` int(10) unsigned DEFAULT NULL,
  `PRECIO` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_secuencial`
--

LOCK TABLES `productos_secuencial` WRITE;
/*!40000 ALTER TABLE `productos_secuencial` DISABLE KEYS */;
INSERT INTO `productos_secuencial` VALUES (1,1,'NEVERA',6,500.25),(2,1,'COCINA',3,300.75),(3,2,'LAVADORA',2,800.50),(4,3,'AIRE ACONDICIONADO',4,600.75),(5,3,'TELEVISOR',7,400.00),(6,3,'LAPTOP',5,1200.00),(7,2,'MICROONDAS',8,150.25),(8,1,'LICUADORA',12,100.00),(9,2,'PLANCHA',12,75.50),(10,3,'VENTILADOR',12,50.00),(11,1,'HORNO A GAS',6,450.00),(12,2,'CAFETERA',12,250.00),(13,3,'TOSTADORA',12,80.00),(14,15,'SECADORA',5,300.00),(15,15,'TELEVISOR 4K',3,1200.00),(16,15,'LAVAVAJILLAS',4,700.00),(17,16,'TELEVISOR CURVO',2,1500.00),(18,16,'AURICULARES',10,200.00),(19,16,'TABLET',6,400.00),(20,17,'LAVADORA INDUSTRIAL',1,2500.00),(21,17,'SECADORA INDUSTRIAL',1,2000.00),(22,17,'REFRIGERADOR INDUSTRIAL',1,3000.00);
/*!40000 ALTER TABLE `productos_secuencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores`
--

DROP TABLE IF EXISTS `proveedores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),(4,'PHILIPS','PLAZA VENEZUELA','2125673421','info@philips.com'),(5,'SAMSUNG','BOLEITA NORTES','2129872323','info@samsung.com'),(6,'WHIRLPOOL','LA CALIFORNIA','2124417889','info@whirlpool.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_cascade`
--

DROP TABLE IF EXISTS `proveedores_cascade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores_cascade` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(30) DEFAULT NULL,
  `direccion` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `correo_electronico` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `correo_electronico` (`correo_electronico`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_cascade`
--

LOCK TABLES `proveedores_cascade` WRITE;
/*!40000 ALTER TABLE `proveedores_cascade` DISABLE KEYS */;
INSERT INTO `proveedores_cascade` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(4,'LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com');
/*!40000 ALTER TABLE `proveedores_cascade` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_secuencial`
--

DROP TABLE IF EXISTS `proveedores_secuencial`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores_secuencial` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NOMBRE` varchar(40) DEFAULT NULL,
  `DIRECCION` varchar(100) DEFAULT NULL,
  `TELEFONO` varchar(20) DEFAULT NULL,
  `CORREO_ELECTRONICO` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores_secuencial`
--

LOCK TABLES `proveedores_secuencial` WRITE;
/*!40000 ALTER TABLE `proveedores_secuencial` DISABLE KEYS */;
INSERT INTO `proveedores_secuencial` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com'),(3,'MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com'),(4,'PHILIPS','PLAZA VENEZUELA','2125673421','info@philips.com'),(5,'SAMSUNG','BOLEITA NORTES','2129872323','info@samsung.com'),(6,'WHIRLPOOL','LA CALIFORNIA','2124417889','info@whirlpool.com');
/*!40000 ALTER TABLE `proveedores_secuencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary table structure for view `vista_estudiantes_asignaturas`
--

DROP TABLE IF EXISTS `vista_estudiantes_asignaturas`;
/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_asignaturas`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_estudiantes_asignaturas` AS SELECT
 1 AS `NOMBRE_ESTUDIANTE`,
  1 AS `APELLIDO_ESTUDIANTE`,
  1 AS `NOMBRE_ASIGNATURA`,
  1 AS `PERIODO`,
  1 AS `NOTA` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_full_join_proveedores_productos`
--

DROP TABLE IF EXISTS `vista_full_join_proveedores_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_full_join_proveedores_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_full_join_proveedores_productos` AS SELECT
 1 AS `PROVEEDOR`,
  1 AS `PRODUCTO`,
  1 AS `CANTIDAD`,
  1 AS `PRECIO` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_inner_join_proveedores_productos`
--

DROP TABLE IF EXISTS `vista_inner_join_proveedores_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_inner_join_proveedores_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_inner_join_proveedores_productos` AS SELECT
 1 AS `PROVEEDOR`,
  1 AS `PRODUCTO`,
  1 AS `CANTIDAD`,
  1 AS `PRECIO` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_left_join_proveedores_productos`
--

DROP TABLE IF EXISTS `vista_left_join_proveedores_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_left_join_proveedores_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_left_join_proveedores_productos` AS SELECT
 1 AS `PROVEEDOR`,
  1 AS `PRODUCTO`,
  1 AS `CANTIDAD`,
  1 AS `PRECIO` */;
SET character_set_client = @saved_cs_client;

--
-- Temporary table structure for view `vista_right_join_proveedores_productos`
--

DROP TABLE IF EXISTS `vista_right_join_proveedores_productos`;
/*!50001 DROP VIEW IF EXISTS `vista_right_join_proveedores_productos`*/;
SET @saved_cs_client     = @@character_set_client;
SET character_set_client = utf8;
/*!50001 CREATE VIEW `vista_right_join_proveedores_productos` AS SELECT
 1 AS `PROVEEDOR`,
  1 AS `PRODUCTO`,
  1 AS `CANTIDAD`,
  1 AS `PRECIO` */;
SET character_set_client = @saved_cs_client;

--
-- Final view structure for view `vista_estudiantes_asignaturas`
--

/*!50001 DROP VIEW IF EXISTS `vista_estudiantes_asignaturas`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_estudiantes_asignaturas` AS select `a`.`nombre` AS `NOMBRE_ESTUDIANTE`,`a`.`apellido` AS `APELLIDO_ESTUDIANTE`,`b`.`nombre` AS `NOMBRE_ASIGNATURA`,`c`.`periodo_del_curso` AS `PERIODO`,`c`.`nota` AS `NOTA` from ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) where `a`.`id` = `c`.`estudiante_id` and `b`.`id` = `c`.`asignatura_id` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_full_join_proveedores_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_full_join_proveedores_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_full_join_proveedores_productos` AS select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuencial`.`NOMBRE` AS `PRODUCTO`,`productos_secuencial`.`CANTIDAD` AS `CANTIDAD`,`productos_secuencial`.`PRECIO` AS `PRECIO` from (`proveedores_secuencial` left join `productos_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`)) union select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuencial`.`NOMBRE` AS `PRODUCTO`,`productos_secuencial`.`CANTIDAD` AS `CANTIDAD`,`productos_secuencial`.`PRECIO` AS `PRECIO` from (`productos_secuencial` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_inner_join_proveedores_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_inner_join_proveedores_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_inner_join_proveedores_productos` AS select `proveedores`.`nombre` AS `PROVEEDOR`,`productos`.`nombre` AS `PRODUCTO`,`productos`.`cantidad` AS `CANTIDAD`,`productos`.`precio` AS `PRECIO` from (`proveedores` join `productos` on(`proveedores`.`id` = `productos`.`proveedor_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_left_join_proveedores_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_left_join_proveedores_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_left_join_proveedores_productos` AS select `proveedores`.`nombre` AS `PROVEEDOR`,`productos`.`nombre` AS `PRODUCTO`,`productos`.`cantidad` AS `CANTIDAD`,`productos`.`precio` AS `PRECIO` from (`proveedores` left join `productos` on(`proveedores`.`id` = `productos`.`proveedor_id`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `vista_right_join_proveedores_productos`
--

/*!50001 DROP VIEW IF EXISTS `vista_right_join_proveedores_productos`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_general_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `vista_right_join_proveedores_productos` AS select `proveedores_secuencial`.`NOMBRE` AS `PROVEEDOR`,`productos_secuencial`.`NOMBRE` AS `PRODUCTO`,`productos_secuencial`.`CANTIDAD` AS `CANTIDAD`,`productos_secuencial`.`PRECIO` AS `PRECIO` from (`productos_secuencial` left join `proveedores_secuencial` on(`proveedores_secuencial`.`ID` = `productos_secuencial`.`PROVEEDOR_ID`)) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-18 11:27:19
