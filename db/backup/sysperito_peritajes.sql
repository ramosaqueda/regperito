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
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-06-15 12:42:53
