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
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2122222277','info@lg.com'),(7,'MABE','AV. FCO. DE MIRANDA','2123334455','info@mabe.com');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-16 11:12:20
