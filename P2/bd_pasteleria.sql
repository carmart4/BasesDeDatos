CREATE DATABASE  IF NOT EXISTS `pasteleria` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `pasteleria`;
-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: localhost    Database: pasteleria
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
-- Table structure for table `pasteleria`
--

DROP TABLE IF EXISTS `pasteleria`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pasteleria` (
  `idpasteleria` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `cod_postal` varchar(20) NOT NULL,
  `direccion` varchar(50) NOT NULL,
  `telefono` varchar(12) DEFAULT NULL,
  `correo` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idpasteleria`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pasteleria`
--

LOCK TABLES `pasteleria` WRITE;
/*!40000 ALTER TABLE `pasteleria` DISABLE KEYS */;
INSERT INTO `pasteleria` VALUES (1,'pasteleria dulce','25126','calle jesús 5','5154845',NULL),(2,'pasteleria salada','46100','avenida vicent andrés estellés','5411874','francisco45@gmail.com'),(3,'el pepe','69523','calle del puerto','8569123',NULL);
/*!40000 ALTER TABLE `pasteleria` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `producto`
--

DROP TABLE IF EXISTS `producto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `producto` (
  `idproducto` int NOT NULL AUTO_INCREMENT,
  `coste` decimal(10,0) NOT NULL,
  `nombre` varchar(20) NOT NULL,
  `ingredientes` varchar(20) NOT NULL,
  `pvp` decimal(10,0) NOT NULL,
  PRIMARY KEY (`idproducto`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `producto`
--

LOCK TABLES `producto` WRITE;
/*!40000 ALTER TABLE `producto` DISABLE KEYS */;
INSERT INTO `producto` VALUES (3,11,'tarta','harina',15),(4,28,'big tarta','chocolate',31),(5,4,'empanadilla','carne',5);
/*!40000 ALTER TABLE `producto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trabajadores`
--

DROP TABLE IF EXISTS `trabajadores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trabajadores` (
  `nss` int NOT NULL,
  `nombre` varchar(100) NOT NULL,
  `DNI` varchar(45) NOT NULL,
  `idpasteleria` int NOT NULL,
  `sueldo` varchar(45) NOT NULL,
  `telefono` varchar(45) DEFAULT NULL,
  `fecha_nacimiento` varchar(15) NOT NULL,
  PRIMARY KEY (`nss`),
  UNIQUE KEY `DNI_UNIQUE` (`DNI`),
  KEY `fk_trabajadores_pasteleria_idx` (`idpasteleria`),
  CONSTRAINT `fk_trabajadores_pasteleria` FOREIGN KEY (`idpasteleria`) REFERENCES `pasteleria` (`idpasteleria`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trabajadores`
--

LOCK TABLES `trabajadores` WRITE;
/*!40000 ALTER TABLE `trabajadores` DISABLE KEYS */;
INSERT INTO `trabajadores` VALUES (927633,'María','56942347J',1,'1100','659782346','\"1990-01-01\"'),(1239656,'Eduardo','52369874L',2,'600','546982314','\"2000-12-31\"');
/*!40000 ALTER TABLE `trabajadores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `venden`
--

DROP TABLE IF EXISTS `venden`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `venden` (
  `stock` int NOT NULL,
  `id_past` int NOT NULL,
  `codproducto` int NOT NULL,
  PRIMARY KEY (`id_past`,`codproducto`),
  KEY `fk_producto_venden_idx` (`codproducto`),
  CONSTRAINT `fk_pasteleria_venden` FOREIGN KEY (`id_past`) REFERENCES `pasteleria` (`idpasteleria`),
  CONSTRAINT `fk_producto_venden` FOREIGN KEY (`codproducto`) REFERENCES `producto` (`idproducto`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `venden`
--

LOCK TABLES `venden` WRITE;
/*!40000 ALTER TABLE `venden` DISABLE KEYS */;
INSERT INTO `venden` VALUES (15,1,3),(3,2,4),(8,3,5);
/*!40000 ALTER TABLE `venden` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-02-25 13:04:20
