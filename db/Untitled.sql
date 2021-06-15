-- MySQL dump 10.13  Distrib 8.0.25, for macos11 (x86_64)
--
-- Host: localhost    Database: sysperito
-- ------------------------------------------------------
-- Server version	8.0.25

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `actividades`
--

DROP TABLE IF EXISTS `actividades`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `actividades` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_act` date DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `tipo_act_id` int NOT NULL,
  `ubicacion_id` int NOT NULL,
  `peritajes_id` int NOT NULL,
  `obs_actividad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`tipo_act_id`,`ubicacion_id`,`peritajes_id`),
  KEY `fk_actividades_tipo_act1_idx` (`tipo_act_id`),
  KEY `fk_actividades_ubicacion1_idx` (`ubicacion_id`),
  KEY `fk_actividades_peritajes_idx` (`peritajes_id`),
  CONSTRAINT `fk_actividades_peritajes` FOREIGN KEY (`peritajes_id`) REFERENCES `peritajes` (`id`),
  CONSTRAINT `fk_actividades_tipo_act1` FOREIGN KEY (`tipo_act_id`) REFERENCES `tipo_act` (`id`),
  CONSTRAINT `fk_actividades_ubicacion1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `actividades`
--

LOCK TABLES `actividades` WRITE;
/*!40000 ALTER TABLE `actividades` DISABLE KEYS */;
INSERT INTO `actividades` VALUES (4,'2021-01-01',NULL,'2021-06-11 02:25:34','2021-06-11 02:25:34',2,2,3,NULL),(5,'2021-01-01',NULL,'2021-06-11 02:26:28','2021-06-11 02:26:28',3,2,3,NULL),(6,'2021-01-01',NULL,'2021-06-11 02:26:43','2021-06-11 02:26:43',4,2,3,NULL);
/*!40000 ALTER TABLE `actividades` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estados`
--

DROP TABLE IF EXISTS `estados`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estados` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gls_estado` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estados`
--

LOCK TABLES `estados` WRITE;
/*!40000 ALTER TABLE `estados` DISABLE KEYS */;
INSERT INTO `estados` VALUES (1,'Ingresado','2021-06-10 01:59:02','2021-06-10 01:59:02',NULL),(2,'En espera de aprovacion','2021-06-10 01:59:28','2021-06-10 01:59:28',NULL),(3,'Vaciado OK','2021-06-10 01:59:47','2021-06-10 01:59:47',NULL),(4,'Pendiente Informe','2021-06-10 01:59:55','2021-06-10 01:59:55',NULL),(5,'Informe entregado','2021-06-10 02:00:04','2021-06-10 02:00:04',NULL),(6,'Fallido, equipo bloqueado o en mal estado','2021-06-10 02:00:28','2021-06-10 02:00:28',NULL);
/*!40000 ALTER TABLE `estados` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fiscales`
--

DROP TABLE IF EXISTS `fiscales`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fiscales` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_fiscal` varchar(60) DEFAULT NULL,
  `rut_fiscal` varchar(12) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fiscales`
--

LOCK TABLES `fiscales` WRITE;
/*!40000 ALTER TABLE `fiscales` DISABLE KEYS */;
INSERT INTO `fiscales` VALUES (1,'JUAN GONZALEZ','12345689-0',NULL,'2021-06-10 01:31:25','2021-06-10 01:31:25'),(2,'Fabiola Celis','12576998-0',NULL,'2021-06-10 01:31:42','2021-06-10 01:31:42'),(3,'German Calquin','10576998-0',NULL,'2021-06-10 01:31:57','2021-06-10 01:31:57');
/*!40000 ALTER TABLE `fiscales` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peritajes`
--

DROP TABLE IF EXISTS `peritajes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peritajes` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ruc` varchar(12) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nue` varchar(45) DEFAULT NULL,
  `plazo` int DEFAULT NULL,
  `gls_peritaje` varchar(255) DEFAULT NULL,
  `obs_peritaje` varchar(255) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `tipo_peritaje_id` int NOT NULL,
  `fiscales_id` int NOT NULL,
  `peritos_id` int NOT NULL,
  `estados_id` int NOT NULL,
  PRIMARY KEY (`id`,`tipo_peritaje_id`,`fiscales_id`,`peritos_id`,`estados_id`),
  KEY `fk_peritajes_tipo_peritaje1_idx` (`tipo_peritaje_id`),
  KEY `fk_peritajes_fiscales1_idx` (`fiscales_id`),
  KEY `fk_peritajes_peritos1_idx` (`peritos_id`),
  KEY `fk_peritajes_estados_idx` (`estados_id`),
  CONSTRAINT `fk_peritajes_estados` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`),
  CONSTRAINT `fk_peritajes_fiscales1` FOREIGN KEY (`fiscales_id`) REFERENCES `fiscales` (`id`),
  CONSTRAINT `fk_peritajes_peritos1` FOREIGN KEY (`peritos_id`) REFERENCES `peritos` (`id`),
  CONSTRAINT `fk_peritajes_tipo_peritaje1` FOREIGN KEY (`tipo_peritaje_id`) REFERENCES `tipo_peritaje` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peritajes`
--

LOCK TABLES `peritajes` WRITE;
/*!40000 ALTER TABLE `peritajes` DISABLE KEYS */;
INSERT INTO `peritajes` VALUES (1,'ruc2','2019-11-10','3sadas',30,'PRUEBAS DE PERIATEJE asd','ESTA ES LA OBSERVACIONasdsasad5',1,'2021-06-15 00:37:27','2021-06-15 02:28:33',4,1,1,1),(3,'21001333-5','2020-12-10','12312',30,'PRUEBAS DE PERIATEJE','ESTA ES LA OBSERVACION',NULL,'2021-06-11 01:44:20','2021-06-11 01:44:20',1,1,1,1),(4,'20001333-7','2020-12-10','12312/1212',30,'PRUEBAS DE PERIATEJE2','ESTA ES LA OBSERVACION2',NULL,'2021-06-11 01:44:49','2021-06-11 01:44:49',2,1,1,1),(5,'19013233-7','2019-12-10','3222/122212',30,'PRUEBAS DE PERIATEJE 3','ESTA ES LA OBSERVACION 3',NULL,'2021-06-11 01:45:28','2021-06-11 01:45:28',4,1,1,1),(6,'12013233-7','2019-11-10','3sadas',30,'PRUEBAS DE PERIATEJE 5','ESTA ES LA OBSERVACION5',NULL,'2021-06-11 02:36:49','2021-06-11 02:36:49',4,1,1,1),(7,'12013233-0','2019-11-10','3sadas',30,'PRUEBAS DE PERIATEJE asd','ESTA ES LA OBSERVACIONasdsasad5',NULL,'2021-06-13 01:11:44','2021-06-13 01:11:44',4,1,1,1),(8,'121212','2021-06-13','1212',21,'asdsadsa','sadsadsa',1,'2021-06-13 01:37:34','2021-06-13 01:37:34',1,2,1,1),(9,'12345678-1','2021-06-13','2121',21,'Esta es un observación de la cosa .','esta es a observación de la cosa ojalá salga',1,'2021-06-13 02:06:04','2021-06-13 02:06:04',1,2,1,1),(10,'1-9','2021-06-14','212',21,'asdasd','asdsadas',1,'2021-06-14 01:43:28','2021-06-14 01:43:28',1,3,1,1),(11,'212121213','2021-06-14','1212',6,'Vamos a escribir esto como corresponde','este es una prueba de sistema',1,'2021-06-14 01:56:07','2021-06-15 02:21:41',1,2,1,1),(12,'19022022-3','2021-06-14','12312',4,'rlasdas','adsdas',1,'2021-06-14 02:46:04','2021-06-14 02:46:04',1,1,1,1),(13,'21001256-1','2021-06-14','1212',32,'asdasdasdasdasdasdasd','pruebas 2',1,'2021-06-14 03:02:13','2021-06-14 03:02:13',1,3,1,1),(14,'2100172042-K','2021-06-14','6149193',30,'Solicita vaciado teléfono LG . Color dorado, bloqueado por patrón ','',1,'2021-06-14 20:12:51','2021-06-14 20:12:51',1,2,1,1);
/*!40000 ALTER TABLE `peritajes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `peritos`
--

DROP TABLE IF EXISTS `peritos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `peritos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre_perito` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `peritos`
--

LOCK TABLES `peritos` WRITE;
/*!40000 ALTER TABLE `peritos` DISABLE KEYS */;
INSERT INTO `peritos` VALUES (1,'RAFAEL RAMOS','RRAMOS@MINPUBLICO.CL',NULL,NULL,NULL),(2,'FERNANDO HERRERA','FHERRERA@MINPUBLICO.CL',NULL,'2021-06-14 20:43:01','2021-06-14 20:43:01');
/*!40000 ALTER TABLE `peritos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solicitud`
--

DROP TABLE IF EXISTS `solicitud`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `solicitud` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fecha_sol` date DEFAULT NULL,
  `id_tipoper` int DEFAULT NULL,
  `formalizada` tinyint DEFAULT NULL,
  `gls_solicituf` varchar(255) DEFAULT NULL,
  `id_estado` int DEFAULT NULL,
  `solicitudcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_act`
--

DROP TABLE IF EXISTS `tipo_act`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_act` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gls_tipoact` varchar(45) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_act`
--

LOCK TABLES `tipo_act` WRITE;
/*!40000 ALTER TABLE `tipo_act` DISABLE KEYS */;
INSERT INTO `tipo_act` VALUES (1,'Solicitud de Peritaje',NULL,NULL,NULL),(2,'Vaciado telefonico',NULL,NULL,NULL),(3,'Adqusici Forense',NULL,NULL,NULL),(4,'Analisis de infromacion',NULL,NULL,NULL);
/*!40000 ALTER TABLE `tipo_act` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_peritaje`
--

DROP TABLE IF EXISTS `tipo_peritaje`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tipo_peritaje` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gls_tipo` varchar(45) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_peritaje`
--

LOCK TABLES `tipo_peritaje` WRITE;
/*!40000 ALTER TABLE `tipo_peritaje` DISABLE KEYS */;
INSERT INTO `tipo_peritaje` VALUES (1,'Vaciado Telefónico','2021-06-10 02:18:52','2021-06-10 02:18:52',NULL),(2,'Adquisición Forense Equipo de Computo','2021-06-10 02:19:12','2021-06-10 02:19:12',NULL),(3,'Adquisición Forense Almacenamiento','2021-06-10 02:19:24','2021-06-10 02:19:24',NULL),(4,'Adquisición Forense DVR/NVR','2021-06-10 02:19:31','2021-06-10 02:19:31',NULL),(5,'GeoReferenciación tráfico telefónico','2021-06-10 02:19:54','2021-06-10 02:19:54',NULL);
/*!40000 ALTER TABLE `tipo_peritaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicacion`
--

DROP TABLE IF EXISTS `ubicacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicacion` (
  `id` int NOT NULL AUTO_INCREMENT,
  `gls_ubicacion` varchar(60) DEFAULT NULL,
  `estado` tinyint DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicacion`
--

LOCK TABLES `ubicacion` WRITE;
/*!40000 ALTER TABLE `ubicacion` DISABLE KEYS */;
INSERT INTO `ubicacion` VALUES (1,'Laboratorio Caja 1',NULL,NULL,NULL),(2,'Laboratorio caja 2',NULL,NULL,NULL),(3,'Laboratorio caja 3',NULL,NULL,NULL);
/*!40000 ALTER TABLE `ubicacion` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 12:43:37
