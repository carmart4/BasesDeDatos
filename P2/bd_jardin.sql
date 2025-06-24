CREATE DATABASE  IF NOT EXISTS `jardin` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `jardin`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: jardin
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
-- Table structure for table `cuida`
--

DROP TABLE IF EXISTS `cuida`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cuida` (
  `idespecie_` int NOT NULL,
  `idjardinero_` int NOT NULL,
  PRIMARY KEY (`idespecie_`,`idjardinero_`),
  KEY `fk_jardinero_cuida_idx` (`idjardinero_`),
  CONSTRAINT `fk_especie_cuida` FOREIGN KEY (`idespecie_`) REFERENCES `especie` (`idespecie`),
  CONSTRAINT `fk_jardinero_cuida` FOREIGN KEY (`idjardinero_`) REFERENCES `jardinero` (`idjardin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cuida`
--

LOCK TABLES `cuida` WRITE;
/*!40000 ALTER TABLE `cuida` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuida` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `especie`
--

DROP TABLE IF EXISTS `especie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `especie` (
  `idespecie` int NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `habitad` varchar(45) NOT NULL,
  `cuidado` varchar(45) NOT NULL,
  PRIMARY KEY (`idespecie`),
  UNIQUE KEY `idespecie_UNIQUE` (`idespecie`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `especie`
--

LOCK TABLES `especie` WRITE;
/*!40000 ALTER TABLE `especie` DISABLE KEYS */;
INSERT INTO `especie` VALUES (1,'margarita','tropical','mucha agua'),(2,'rosa','desertico','poca agua');
/*!40000 ALTER TABLE `especie` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jardinbotanico`
--

DROP TABLE IF EXISTS `jardinbotanico`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jardinbotanico` (
  `idjardinbotanico` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `direccion` varchar(45) NOT NULL,
  `superficie` int NOT NULL,
  PRIMARY KEY (`idjardinbotanico`),
  UNIQUE KEY `idjardinbotanico_UNIQUE` (`idjardinbotanico`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jardinbotanico`
--

LOCK TABLES `jardinbotanico` WRITE;
/*!40000 ALTER TABLE `jardinbotanico` DISABLE KEYS */;
INSERT INTO `jardinbotanico` VALUES (1,'rosas','malilla',2562),(2,'flores maria','burjassot',234);
/*!40000 ALTER TABLE `jardinbotanico` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jardinero`
--

DROP TABLE IF EXISTS `jardinero`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jardinero` (
  `idjardinero` int NOT NULL,
  `dni` varchar(45) NOT NULL,
  `nombre` varchar(45) NOT NULL,
  `especialidad` varchar(45) NOT NULL,
  `idjardin` int NOT NULL,
  PRIMARY KEY (`idjardinero`),
  KEY `fk_jardinbotanico_jardinero_idx` (`idjardin`),
  CONSTRAINT `fk_jardinbotanico_jardinero` FOREIGN KEY (`idjardin`) REFERENCES `jardinbotanico` (`idjardinbotanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jardinero`
--

LOCK TABLES `jardinero` WRITE;
/*!40000 ALTER TABLE `jardinero` DISABLE KEYS */;
INSERT INTO `jardinero` VALUES (1,'263723J','Luis','flores secas',1),(2,'67372637k','Maria','flores tropicales',2);
/*!40000 ALTER TABLE `jardinero` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiene`
--

DROP TABLE IF EXISTS `tiene`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tiene` (
  `idespecie` int NOT NULL,
  `idjardin` int NOT NULL,
  PRIMARY KEY (`idespecie`,`idjardin`),
  KEY `fk_jardinbotanico_tiene_idx` (`idjardin`),
  CONSTRAINT `fk_especie_tiene` FOREIGN KEY (`idespecie`) REFERENCES `especie` (`idespecie`),
  CONSTRAINT `fk_jardinbotanico_tiene` FOREIGN KEY (`idjardin`) REFERENCES `jardinbotanico` (`idjardinbotanico`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiene`
--

LOCK TABLES `tiene` WRITE;
/*!40000 ALTER TABLE `tiene` DISABLE KEYS */;
INSERT INTO `tiene` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `tiene` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-25 14:14:22
