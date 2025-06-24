CREATE DATABASE  IF NOT EXISTS `laliga` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `laliga`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: laliga
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `equipo`
--

DROP TABLE IF EXISTS `equipo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `equipo` (
  `idequipo` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `id_estadio` varchar(100) NOT NULL,
  PRIMARY KEY (`idequipo`),
  KEY `fk_estadio_equipo_idx` (`id_estadio`),
  CONSTRAINT `fk_estadio_equipo` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`nombre`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `equipo`
--

LOCK TABLES `equipo` WRITE;
/*!40000 ALTER TABLE `equipo` DISABLE KEYS */;
INSERT INTO `equipo` VALUES (1,'R madrid','Madrid','Santi B'),(2,'Barcelona','Barcelona','Spotify'),(3,'Valencia','Valencia','Mestalla');
/*!40000 ALTER TABLE `equipo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `estadio`
--

DROP TABLE IF EXISTS `estadio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estadio` (
  `nombre` varchar(100) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `capacidad` int NOT NULL,
  PRIMARY KEY (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `estadio`
--

LOCK TABLES `estadio` WRITE;
/*!40000 ALTER TABLE `estadio` DISABLE KEYS */;
INSERT INTO `estadio` VALUES ('Mestalla','Valencia',75000),('Santi B','Madrid',80000),('Spotify','Barcelona',70000);
/*!40000 ALTER TABLE `estadio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juega`
--

DROP TABLE IF EXISTS `juega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juega` (
  `id_jugador` int NOT NULL,
  `id_equipo` int NOT NULL,
  `anio` int NOT NULL,
  `dorsal` int NOT NULL,
  PRIMARY KEY (`id_jugador`,`id_equipo`,`anio`),
  KEY `fk_equipo_juega_idx` (`id_equipo`),
  CONSTRAINT `fk_equipo_juega` FOREIGN KEY (`id_equipo`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `fk_jugadores_juega` FOREIGN KEY (`id_jugador`) REFERENCES `jugadores` (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juega`
--

LOCK TABLES `juega` WRITE;
/*!40000 ALTER TABLE `juega` DISABLE KEYS */;
INSERT INTO `juega` VALUES (1,1,2020,17),(2,3,2018,15),(3,2,2024,8);
/*!40000 ALTER TABLE `juega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `juega_contra`
--

DROP TABLE IF EXISTS `juega_contra`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `juega_contra` (
  `id_local` int NOT NULL,
  `id_visita` int NOT NULL,
  `anio_` int NOT NULL,
  `res_local` int NOT NULL,
  `res_visita` int NOT NULL,
  `id_estadio` varchar(100) NOT NULL,
  PRIMARY KEY (`id_local`,`id_visita`,`anio_`),
  KEY `fk_equipo_juegac_idx` (`id_visita`),
  KEY `fk_juega_juegac_idx` (`anio_`),
  KEY `fk_estadio_juega_contra_idx` (`id_estadio`),
  CONSTRAINT `fk_equipo_juega_contra` FOREIGN KEY (`id_local`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `fk_equipo_juega_contrav` FOREIGN KEY (`id_visita`) REFERENCES `equipo` (`idequipo`),
  CONSTRAINT `fk_estadio_juega_contra` FOREIGN KEY (`id_estadio`) REFERENCES `estadio` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `juega_contra`
--

LOCK TABLES `juega_contra` WRITE;
/*!40000 ALTER TABLE `juega_contra` DISABLE KEYS */;
INSERT INTO `juega_contra` VALUES (1,2,2024,1,2,'Santi B'),(1,3,2024,1,1,'Mestalla'),(3,2,2025,2,2,'Spotify');
/*!40000 ALTER TABLE `juega_contra` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jugadores`
--

DROP TABLE IF EXISTS `jugadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jugadores` (
  `idjugador` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `fecha_nac` varchar(20) NOT NULL,
  PRIMARY KEY (`idjugador`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jugadores`
--

LOCK TABLES `jugadores` WRITE;
/*!40000 ALTER TABLE `jugadores` DISABLE KEYS */;
INSERT INTO `jugadores` VALUES (1,'Pepe','1-1-2000'),(2,'Juan','2-2-1999'),(3,'Pedro','3-3-1990');
/*!40000 ALTER TABLE `jugadores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-25 14:19:49
