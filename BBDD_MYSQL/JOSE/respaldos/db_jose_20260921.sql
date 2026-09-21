-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_jose
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
INSERT INTO `asignaturas` VALUES (1,'LOGICA DE PROGRAMACION','PROGRAMACION'),(2,'MYSQL','BASE DE DATOS'),(3,'POSTGRESQL','BASE DE DATOS'),(4,'HTML','DESARROLLO WEB'),(5,'JAVASCRIPT','DESARROLLO WEB'),(6,'PHP','DESARROLLO WEB'),(7,'PYTHON','PROGRAMACION');
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
  `estudiantes_id` int(10) unsigned NOT NULL,
  `asignaturas_id` int(10) unsigned NOT NULL,
  `periodo_del_curso` int(4) unsigned NOT NULL,
  `nota` int(3) unsigned DEFAULT NULL,
  PRIMARY KEY (`estudiantes_id`,`asignaturas_id`,`periodo_del_curso`),
  KEY `asignaturas_id` (`asignaturas_id`),
  CONSTRAINT `estudiantes_asignaturas_ibfk_1` FOREIGN KEY (`estudiantes_id`) REFERENCES `estudiantes` (`id`) ON UPDATE CASCADE,
  CONSTRAINT `estudiantes_asignaturas_ibfk_2` FOREIGN KEY (`asignaturas_id`) REFERENCES `asignaturas` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estudiantes_asignaturas`
--

LOCK TABLES `estudiantes_asignaturas` WRITE;
/*!40000 ALTER TABLE `estudiantes_asignaturas` DISABLE KEYS */;
INSERT INTO `estudiantes_asignaturas` VALUES (1,1,2025,80),(1,1,2026,100),(1,2,2026,100),(1,4,2025,90),(2,1,2025,90),(2,2,2026,85),(2,4,2025,100),(3,1,2025,95),(3,2,2026,100),(3,4,2025,100);
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
  `correo_electronico` varchar(80) DEFAULT NULL,
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
INSERT INTO `personas` VALUES ('V1234','ANA','VASQUEZ','SANTA FE','av@gmail.com','2224444555666','1960-08-15',66),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','3334444555666','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124444555666','1968-07-16',58),('V3456','LIBIA','COLS','GUARENA','lc@gmail.com','2124444555606','1975-05-20',51);
/*!40000 ALTER TABLE `personas` ENABLE KEYS */;
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
INSERT INTO `personas_con_indice` VALUES (1,'V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','3334444555666','1975-09-10',51),(2,'V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124444555666','1968-07-16',58),(3,'V3456','LIBIA','COLS','GUARENA','lc@gmail.com','2124444555606','1975-05-20',51);
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
INSERT INTO `personas_con_indice_cedula` VALUES ('V3456','LIBIA','COLS','GUARENA','lc@gmail.com','2124444555606','1975-05-20',51),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','3334444555666','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124444555666','1968-07-16',58);
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
INSERT INTO `personas_con_indice_cedula_correo` VALUES ('V3456','LIBIA','COLS','GUARENA','lc@gmail.com','2124444555606','1975-05-20',51),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','3334444555666','1975-09-10',51),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124444555666','1968-07-16',58);
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
) ENGINE=InnoDB AUTO_INCREMENT=67 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos`
--

LOCK TABLES `productos` WRITE;
/*!40000 ALTER TABLE `productos` DISABLE KEYS */;
INSERT INTO `productos` VALUES (28,1,'NEVERA',6,500.25),(29,1,'COCINA',3,300.75),(30,2,'LAVADORA',2,800.50),(34,2,'MICROONDAS',8,150.25),(35,1,'LICUADORA',12,100.00),(36,2,'PLANCHA',12,75.50),(38,1,'HORNO A GAS',6,450.00),(39,2,'CAFETERA',12,250.00),(54,1,'NEVERA',6,500.25),(55,1,'COCINA',3,300.75),(56,2,'LAVADORA',2,800.50),(57,7,'AIRE ACONDICIONADO',4,600.75),(58,7,'TELEVISOR',7,400.00),(59,7,'LAPTOP',5,1200.00),(60,2,'MICROONDAS',8,150.25),(61,1,'LICUADORA',12,100.00),(62,2,'PLANCHA',12,75.50),(63,7,'VENTILADOR',12,50.00),(64,1,'HORNO A GAS',6,450.00),(65,2,'CAFETERA',12,250.00),(66,7,'TOSTADORA',12,80.00);
/*!40000 ALTER TABLE `productos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_cascada`
--

DROP TABLE IF EXISTS `productos_cascada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_cascada` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_cascada_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores_cascada` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_cascada`
--

LOCK TABLES `productos_cascada` WRITE;
/*!40000 ALTER TABLE `productos_cascada` DISABLE KEYS */;
INSERT INTO `productos_cascada` VALUES (14,1,'NEVERA',6,500.25),(15,1,'COCINA',3,300.75),(16,4,'LAVADORA',2,800.50),(20,4,'MICROONDAS',8,150.25),(21,1,'LICUADORA',12,100.00),(22,4,'PLANCHA',12,75.50),(24,1,'HORNO A GAS',6,450.00),(25,4,'CAFETERA',12,250.00);
/*!40000 ALTER TABLE `productos_cascada` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_secuencial`
--

LOCK TABLES `productos_secuencial` WRITE;
/*!40000 ALTER TABLE `productos_secuencial` DISABLE KEYS */;
INSERT INTO `productos_secuencial` VALUES (1,1,'NEVERA',6,500.25),(2,4,'NEVERA',6,500.25),(3,1,'COCINA',3,300.75),(4,5,'COCINA',3,300.75),(5,2,'LAVADORA',2,800.50),(6,6,'LAVADORA',2,800.50),(7,3,'AIRE ACONDICIONADO',4,600.75),(8,7,'AIRE ACONDICIONADO',4,600.75),(9,3,'TELEVISOR',7,400.00),(10,3,'LAPTOP',5,1200.00),(11,8,'LAPTOP',5,1200.00),(12,2,'MICROONDAS',8,150.25),(13,9,'MICROONDAS',8,150.25),(14,1,'LICUADORA',12,100.00),(15,10,'LICUADORA',12,100.00),(16,2,'PLANCHA',12,75.50),(17,11,'PLANCHA',12,75.50),(18,3,'VENTILADOR',12,50.00),(19,12,'VENTILADOR',12,50.00),(20,1,'HORNO A GAS',6,450.00),(21,2,'CAFETERA',12,250.00),(22,13,'CAFETERA',12,250.00),(23,3,'TOSTADORA',12,80.00),(24,14,'TOSTADORA',12,80.00);
/*!40000 ALTER TABLE `productos_secuencial` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `productos_varios`
--

DROP TABLE IF EXISTS `productos_varios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `productos_varios` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `proveedor_id` int(10) unsigned DEFAULT NULL,
  `nombre` varchar(30) DEFAULT NULL,
  `cantidad` int(10) unsigned DEFAULT NULL,
  `precio` decimal(13,2) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `proveedor_id` (`proveedor_id`),
  CONSTRAINT `productos_varios_ibfk_1` FOREIGN KEY (`proveedor_id`) REFERENCES `proveedores` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `productos_varios`
--

LOCK TABLES `productos_varios` WRITE;
/*!40000 ALTER TABLE `productos_varios` DISABLE KEYS */;
INSERT INTO `productos_varios` VALUES (1,1,'NEVERA',6,500.25),(2,1,'COCINA',3,300.75),(3,2,'LAVADORA',2,800.50),(4,7,'AIRE ACONDICIONADO',4,600.75),(5,7,'TELEVISOR',7,400.00),(6,7,'LAPTOP',5,1200.00),(7,2,'MICROONDAS',8,150.25),(8,1,'LICUADORA',12,100.00),(9,2,'PLANCHA',12,75.50),(10,7,'VENTILADOR',12,50.00),(11,1,'HORNO A GAS',6,450.00),(12,2,'CAFETERA',12,250.00),(13,7,'TOSTADORA',12,80.00),(14,1,'NEVERA',6,500.25),(15,1,'COCINA',3,300.75),(16,2,'LAVADORA',2,800.50),(17,7,'AIRE ACONDICIONADO',4,600.75),(18,7,'TELEVISOR',7,400.00),(19,7,'LAPTOP',5,1200.00),(20,2,'MICROONDAS',8,150.25),(21,1,'LICUADORA',12,100.00),(22,2,'PLANCHA',12,75.50),(23,7,'VENTILADOR',12,50.00),(24,1,'HORNO A GAS',6,450.00),(25,2,'CAFETERA',12,250.00),(26,7,'TOSTADORA',12,80.00),(27,1,'NEVERA',6,500.25),(28,1,'COCINA',3,300.75),(29,2,'LAVADORA',2,800.50),(30,7,'AIRE ACONDICIONADO',4,600.75),(31,7,'TELEVISOR',7,400.00),(32,7,'LAPTOP',5,1200.00),(33,2,'MICROONDAS',8,150.25),(34,1,'LICUADORA',12,100.00),(35,2,'PLANCHA',12,75.50),(36,7,'VENTILADOR',12,50.00),(37,1,'HORNO A GAS',6,450.00),(38,2,'CAFETERA',12,250.00),(39,7,'TOSTADORA',12,80.00),(40,1,'NEVERA',6,500.25),(41,1,'COCINA',3,300.75),(42,2,'LAVADORA',2,800.50),(43,7,'AIRE ACONDICIONADO',4,600.75),(44,7,'TELEVISOR',7,400.00),(45,7,'LAPTOP',5,1200.00),(46,2,'MICROONDAS',8,150.25),(47,1,'LICUADORA',12,100.00),(48,2,'PLANCHA',12,75.50),(49,7,'VENTILADOR',12,50.00),(50,1,'HORNO A GAS',6,450.00),(51,2,'CAFETERA',12,250.00),(52,7,'TOSTADORA',12,80.00),(53,1,'NEVERA',6,250.50),(54,1,'COCINA',8,120.25),(55,2,'LAVADORA',12,350.75);
/*!40000 ALTER TABLE `productos_varios` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),(7,'MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com'),(14,'PHILIPS','PLAZA VENEZUELA','2125673421','info@philips.com'),(15,'SAMSUNG','BOLEITA NORTES','2129872323','info@samsung.com'),(16,'WHIRLPOOL','LA CALIFORNIA','2124417889','info@whirlpool.com');
/*!40000 ALTER TABLE `proveedores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `proveedores_cascada`
--

DROP TABLE IF EXISTS `proveedores_cascada`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `proveedores_cascada` (
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
-- Dumping data for table `proveedores_cascada`
--

LOCK TABLES `proveedores_cascada` WRITE;
/*!40000 ALTER TABLE `proveedores_cascada` DISABLE KEYS */;
INSERT INTO `proveedores_cascada` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(4,'LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com');
/*!40000 ALTER TABLE `proveedores_cascada` ENABLE KEYS */;
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
INSERT INTO `proveedores_secuencial` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),(3,'MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com'),(4,'PHILIPS','PLAZA VENEZUELA','2125673421','info@philips.com'),(5,'SAMSUNG','BOLEITA NORTES','2129872323','info@samsung.com'),(6,'WHIRLPOOL','LA CALIFORNIA','2124417889','info@whirlpool.com');
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
/*!50001 VIEW `vista_estudiantes_asignaturas` AS select `a`.`nombre` AS `NOMBRE_ESTUDIANTE`,`a`.`apellido` AS `APELLIDO_ESTUDIANTE`,`b`.`nombre` AS `NOMBRE_ASIGNATURA`,`c`.`periodo_del_curso` AS `PERIODO`,`c`.`nota` AS `NOTA` from ((`estudiantes` `a` join `asignaturas` `b`) join `estudiantes_asignaturas` `c`) where `a`.`id` = `c`.`estudiantes_id` and `b`.`id` = `c`.`asignaturas_id` */;
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

-- Dump completed on 2026-09-21 11:21:26
