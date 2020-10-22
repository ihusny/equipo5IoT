-- MySQL dump 10.13  Distrib 8.0.21, for macos10.15 (x86_64)
--
-- Host: localhost    Database: iot
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alertas`
--

DROP TABLE IF EXISTS `alertas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `alertas` (
  `cuando` date DEFAULT NULL,
  `mensaje` varchar(30) DEFAULT NULL,
  `resuelto` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `alertas`
--

LOCK TABLES `alertas` WRITE;
/*!40000 ALTER TABLE `alertas` DISABLE KEYS */;
/*!40000 ALTER TABLE `alertas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `camaras`
--

DROP TABLE IF EXISTS `camaras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `camaras` (
  `id_camara` int NOT NULL,
  PRIMARY KEY (`id_camara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `camaras`
--

LOCK TABLES `camaras` WRITE;
/*!40000 ALTER TABLE `camaras` DISABLE KEYS */;
/*!40000 ALTER TABLE `camaras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `candado`
--

DROP TABLE IF EXISTS `candado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `candado` (
  `id_candado` int NOT NULL,
  `bateria` int DEFAULT NULL,
  `abierto` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_candado`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `candado`
--

LOCK TABLES `candado` WRITE;
/*!40000 ALTER TABLE `candado` DISABLE KEYS */;
/*!40000 ALTER TABLE `candado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_accesos`
--

DROP TABLE IF EXISTS `control_accesos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_accesos` (
  `id_candado` int DEFAULT NULL,
  `id_persona` int DEFAULT NULL,
  `entra` tinyint(1) DEFAULT NULL,
  `codigo` int DEFAULT NULL,
  `tiempo` int DEFAULT NULL,
  UNIQUE KEY `codigo` (`codigo`),
  KEY `id_candado` (`id_candado`),
  KEY `id_persona` (`id_persona`),
  CONSTRAINT `control_accesos_ibfk_1` FOREIGN KEY (`id_candado`) REFERENCES `candado` (`id_candado`),
  CONSTRAINT `control_accesos_ibfk_2` FOREIGN KEY (`id_persona`) REFERENCES `persona` (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_accesos`
--

LOCK TABLES `control_accesos` WRITE;
/*!40000 ALTER TABLE `control_accesos` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_accesos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_camaras`
--

DROP TABLE IF EXISTS `control_camaras`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_camaras` (
  `id_cuarto` int DEFAULT NULL,
  `id_camara` int DEFAULT NULL,
  `movimiento` tinyint(1) DEFAULT NULL,
  `alerta` tinyint(1) DEFAULT NULL,
  KEY `id_cuarto` (`id_cuarto`),
  KEY `id_camara` (`id_camara`),
  CONSTRAINT `control_camaras_ibfk_1` FOREIGN KEY (`id_cuarto`) REFERENCES `cuarto` (`id_cuarto`),
  CONSTRAINT `control_camaras_ibfk_2` FOREIGN KEY (`id_camara`) REFERENCES `camaras` (`id_camara`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_camaras`
--

LOCK TABLES `control_camaras` WRITE;
/*!40000 ALTER TABLE `control_camaras` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_camaras` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_cuartos`
--

DROP TABLE IF EXISTS `control_cuartos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_cuartos` (
  `id_candado` int DEFAULT NULL,
  `id_cuarto` int DEFAULT NULL,
  KEY `id_candado` (`id_candado`),
  KEY `id_cuarto` (`id_cuarto`),
  CONSTRAINT `control_cuartos_ibfk_1` FOREIGN KEY (`id_candado`) REFERENCES `candado` (`id_candado`),
  CONSTRAINT `control_cuartos_ibfk_2` FOREIGN KEY (`id_cuarto`) REFERENCES `cuarto` (`id_cuarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_cuartos`
--

LOCK TABLES `control_cuartos` WRITE;
/*!40000 ALTER TABLE `control_cuartos` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_cuartos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_luces`
--

DROP TABLE IF EXISTS `control_luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_luces` (
  `id_luz` int DEFAULT NULL,
  `id_cuarto` int DEFAULT NULL,
  `cronometro` int DEFAULT NULL,
  `intensidad` int DEFAULT NULL,
  KEY `id_cuarto` (`id_cuarto`),
  KEY `id_luz` (`id_luz`),
  CONSTRAINT `control_luces_ibfk_1` FOREIGN KEY (`id_cuarto`) REFERENCES `cuarto` (`id_cuarto`),
  CONSTRAINT `control_luces_ibfk_2` FOREIGN KEY (`id_luz`) REFERENCES `luces` (`id_luz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_luces`
--

LOCK TABLES `control_luces` WRITE;
/*!40000 ALTER TABLE `control_luces` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `control_temperatura`
--

DROP TABLE IF EXISTS `control_temperatura`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `control_temperatura` (
  `id_sensor` int DEFAULT NULL,
  `id_cuarto` int DEFAULT NULL,
  KEY `id_cuarto` (`id_cuarto`),
  KEY `id_sensor` (`id_sensor`),
  CONSTRAINT `control_temperatura_ibfk_1` FOREIGN KEY (`id_cuarto`) REFERENCES `cuarto` (`id_cuarto`),
  CONSTRAINT `control_temperatura_ibfk_2` FOREIGN KEY (`id_sensor`) REFERENCES `termostato` (`id_sensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `control_temperatura`
--

LOCK TABLES `control_temperatura` WRITE;
/*!40000 ALTER TABLE `control_temperatura` DISABLE KEYS */;
/*!40000 ALTER TABLE `control_temperatura` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cuarto`
--

DROP TABLE IF EXISTS `cuarto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuarto` (
  `id_cuarto` int NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_cuarto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuarto`
--

LOCK TABLES `cuarto` WRITE;
/*!40000 ALTER TABLE `cuarto` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuarto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `luces`
--

DROP TABLE IF EXISTS `luces`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `luces` (
  `id_luz` int NOT NULL,
  `prendido` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id_luz`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `luces`
--

LOCK TABLES `luces` WRITE;
/*!40000 ALTER TABLE `luces` DISABLE KEYS */;
/*!40000 ALTER TABLE `luces` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `persona`
--

DROP TABLE IF EXISTS `persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `persona` (
  `id_persona` int NOT NULL,
  `nombre` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`id_persona`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `persona`
--

LOCK TABLES `persona` WRITE;
/*!40000 ALTER TABLE `persona` DISABLE KEYS */;
/*!40000 ALTER TABLE `persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `termostato`
--

DROP TABLE IF EXISTS `termostato`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `termostato` (
  `id_sensor` int NOT NULL,
  `estado` int DEFAULT NULL,
  PRIMARY KEY (`id_sensor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `termostato`
--

LOCK TABLES `termostato` WRITE;
/*!40000 ALTER TABLE `termostato` DISABLE KEYS */;
/*!40000 ALTER TABLE `termostato` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-10-15 12:48:27
