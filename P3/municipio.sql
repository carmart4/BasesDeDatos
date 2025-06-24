CREATE DATABASE  IF NOT EXISTS `municipio` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `municipio`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: municipio
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
-- Table structure for table `habitante`
--

DROP TABLE IF EXISTS `habitante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `habitante` (
  `IdHabitante` varchar(20) NOT NULL,
  `Nombre` varchar(100) NOT NULL,
  `FechaNac` date NOT NULL,
  `Salario` decimal(2,0) NOT NULL,
  `Genero` varchar(30) DEFAULT NULL,
  `Desempleado` tinyint(1) NOT NULL,
  `IdHogar` int NOT NULL,
  PRIMARY KEY (`IdHabitante`),
  UNIQUE KEY `IdHabitante_UNIQUE` (`IdHabitante`),
  KEY `fk_habitante_Hogar_idx` (`IdHogar`),
  CONSTRAINT `fk_habitante_Hogar` FOREIGN KEY (`IdHogar`) REFERENCES `hogar` (`IdHogar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `habitante`
--

LOCK TABLES `habitante` WRITE;
/*!40000 ALTER TABLE `habitante` DISABLE KEYS */;
INSERT INTO `habitante` VALUES ('A1234567','Marta','2006-02-04',30,'Fem',0,3),('D1209890','Juan','1990-12-31',40,'Mas',0,2),('F7859478','Maria','2004-05-22',20,'Fem',0,2),('Q1089087','Yolanda','1995-07-07',15,'Fem',1,3),('z1033338','Santi','2000-01-01',10,'Mas',0,1);
/*!40000 ALTER TABLE `habitante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hogar`
--

DROP TABLE IF EXISTS `hogar`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hogar` (
  `IdHogar` int NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Poblacion` varchar(50) NOT NULL,
  `CodPostal` varchar(45) NOT NULL,
  PRIMARY KEY (`IdHogar`),
  UNIQUE KEY `IdHogar_UNIQUE` (`IdHogar`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hogar`
--

LOCK TABLES `hogar` WRITE;
/*!40000 ALTER TABLE `hogar` DISABLE KEYS */;
INSERT INTO `hogar` VALUES (1,'Calle Pepe 2','Valencia','46095'),(2,'Calle Gran Vía','Burjassot','46100'),(3,'Calle Juan García','Alicante','40009');
/*!40000 ALTER TABLE `hogar` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `instalacion`
--

DROP TABLE IF EXISTS `instalacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `instalacion` (
  `CodInstal` int NOT NULL AUTO_INCREMENT,
  `NombreInstal` varchar(100) NOT NULL,
  `Direccion` varchar(100) NOT NULL,
  `Poblacion` varchar(50) NOT NULL,
  `CodPostal` varchar(45) NOT NULL,
  `Tipo` varchar(45) NOT NULL,
  `Accesible` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`CodInstal`),
  UNIQUE KEY `CodInstal_UNIQUE` (`CodInstal`),
  UNIQUE KEY `NombreInstal_UNIQUE` (`NombreInstal`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `instalacion`
--

LOCK TABLES `instalacion` WRITE;
/*!40000 ALTER TABLE `instalacion` DISABLE KEYS */;
INSERT INTO `instalacion` VALUES (1,'Polideportivo Burjassot','Vicente Andres Estelles','Burjassot','46109','Deportivo',1),(2,'Hospital las Marias','Calle de Gloria','Valencia','46200','Medico',1),(3,'Colegio Jesus','Calle de los cristianos','Paiporta','45090','Esducacion',0);
/*!40000 ALTER TABLE `instalacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `relacion`
--

DROP TABLE IF EXISTS `relacion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `relacion` (
  `IdRelacion` int NOT NULL AUTO_INCREMENT,
  `CodHabitante` varchar(20) NOT NULL,
  `CodMadre` varchar(20) DEFAULT NULL,
  `CodPadre` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`IdRelacion`),
  UNIQUE KEY `CodHabitante_UNIQUE` (`CodHabitante`),
  KEY `fk_Relacion_habitante2_idx` (`CodMadre`),
  KEY `fk_Relacion_habitante3_idx` (`CodPadre`),
  CONSTRAINT `fk_Relacion_habitante1` FOREIGN KEY (`CodHabitante`) REFERENCES `habitante` (`IdHabitante`),
  CONSTRAINT `fk_Relacion_habitante2` FOREIGN KEY (`CodMadre`) REFERENCES `habitante` (`IdHabitante`),
  CONSTRAINT `fk_Relacion_habitante3` FOREIGN KEY (`CodPadre`) REFERENCES `habitante` (`IdHabitante`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `relacion`
--

LOCK TABLES `relacion` WRITE;
/*!40000 ALTER TABLE `relacion` DISABLE KEYS */;
INSERT INTO `relacion` VALUES (4,'A1234567','Q1089087',NULL),(5,'z1033338',NULL,'D1209890');
/*!40000 ALTER TABLE `relacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `visita`
--

DROP TABLE IF EXISTS `visita`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `visita` (
  `CodHabitante` varchar(20) NOT NULL,
  `CodCentro` int NOT NULL,
  `Fecha` date NOT NULL,
  PRIMARY KEY (`CodCentro`,`CodHabitante`,`Fecha`),
  UNIQUE KEY `Fecha_UNIQUE` (`Fecha`),
  KEY `fk_Usa_Instalacion1_idx` (`CodCentro`),
  KEY `fk_Usa_habitante1` (`CodHabitante`),
  CONSTRAINT `fk_Usa_habitante1` FOREIGN KEY (`CodHabitante`) REFERENCES `habitante` (`IdHabitante`),
  CONSTRAINT `fk_Usa_Instalacion1` FOREIGN KEY (`CodCentro`) REFERENCES `instalacion` (`CodInstal`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `visita`
--

LOCK TABLES `visita` WRITE;
/*!40000 ALTER TABLE `visita` DISABLE KEYS */;
INSERT INTO `visita` VALUES ('Q1089087',2,'2025-01-24'),('F7859478',1,'2025-03-11');
/*!40000 ALTER TABLE `visita` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-03-11 13:21:30
