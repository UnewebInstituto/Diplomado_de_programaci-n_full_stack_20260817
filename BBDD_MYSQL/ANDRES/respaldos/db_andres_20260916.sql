-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_andres
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
  `email` text DEFAULT NULL,
  `telefono` char(20) DEFAULT NULL,
  `fecha_de_nacimiento` date DEFAULT NULL,
  `edad` tinyint(3) unsigned DEFAULT NULL,
  `telefono_hab` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `personas`
--

LOCK TABLES `personas` WRITE;
/*!40000 ALTER TABLE `personas` DISABLE KEYS */;
INSERT INTO `personas` VALUES ('V1234','Ana','Vasquez','Santa Fe','av@gmail.com','2124445566','1960-08-15',66,NULL),('V5678','YOLANDA','TORTOZA','CATIA LA MAR','yt@gmail.com','4147776655','1975-09-10',51,NULL),('V9012','NELLY','CONTRERAS','LA VEGA','nc@gmail.com','2124434930','1968-07-16',58,NULL),('V3456','LIBIA','COLS','Las Clavellinas, Guarenas','lc@gmail.com','2123634106','1975-05-20',51,NULL);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `proveedores`
--

LOCK TABLES `proveedores` WRITE;
/*!40000 ALTER TABLE `proveedores` DISABLE KEYS */;
INSERT INTO `proveedores` VALUES (1,'GENERAL ELECTRIC','AV. LECUNA','2121112233','info@ge.com'),(2,'LG','AV. ROMULO GALLEGOS','2121112277','info@lg.com');
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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-09-16 11:13:01
