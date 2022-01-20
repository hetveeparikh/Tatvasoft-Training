-- MySQL dump 10.13  Distrib 8.0.27, for Win64 (x86_64)
--
-- Host: localhost    Database: helperland-data
-- ------------------------------------------------------
-- Server version	8.0.28

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
-- Table structure for table `address`
--

DROP TABLE IF EXISTS `address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `address` (
  `A_id` int NOT NULL AUTO_INCREMENT,
  `U_id` int NOT NULL,
  `A_streetname` varchar(45) NOT NULL,
  `A_houseno` varchar(45) NOT NULL,
  `A_postalcode` int NOT NULL,
  `A_city` varchar(45) NOT NULL,
  `A_phone` int NOT NULL,
  PRIMARY KEY (`A_id`,`U_id`),
  KEY `adduid_idx` (`U_id`),
  CONSTRAINT `adduid` FOREIGN KEY (`U_id`) REFERENCES `user-table` (`U_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address`
--

LOCK TABLES `address` WRITE;
/*!40000 ALTER TABLE `address` DISABLE KEYS */;
/*!40000 ALTER TABLE `address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `block-customer`
--

DROP TABLE IF EXISTS `block-customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `block-customer` (
  `C_id` int NOT NULL,
  `SP_id` int NOT NULL,
  PRIMARY KEY (`C_id`,`SP_id`),
  KEY `bspid_idx` (`SP_id`),
  CONSTRAINT `bcustid` FOREIGN KEY (`C_id`) REFERENCES `customers` (`C_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `bspid` FOREIGN KEY (`SP_id`) REFERENCES `service-providers` (`SP_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `block-customer`
--

LOCK TABLES `block-customer` WRITE;
/*!40000 ALTER TABLE `block-customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `block-customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customers`
--

DROP TABLE IF EXISTS `customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customers` (
  `C_id` int NOT NULL AUTO_INCREMENT,
  `C_fname` varchar(45) NOT NULL,
  `C_lname` varchar(45) NOT NULL,
  `C_bdate` date NOT NULL,
  `C_phone` int NOT NULL,
  `C_lang` varchar(45) NOT NULL,
  PRIMARY KEY (`C_id`),
  CONSTRAINT `C_id` FOREIGN KEY (`C_id`) REFERENCES `user-table` (`U_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customers`
--

LOCK TABLES `customers` WRITE;
/*!40000 ALTER TABLE `customers` DISABLE KEYS */;
/*!40000 ALTER TABLE `customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ratings`
--

DROP TABLE IF EXISTS `ratings`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ratings` (
  `C_id` int NOT NULL,
  `SP_id` int NOT NULL,
  `S_id` int NOT NULL,
  `Ratings` int DEFAULT NULL,
  `Comments` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`C_id`,`SP_id`,`S_id`),
  KEY `serviceid_idx` (`S_id`),
  KEY `spid_idx` (`SP_id`),
  CONSTRAINT `rcid` FOREIGN KEY (`C_id`) REFERENCES `customers` (`C_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rsid` FOREIGN KEY (`S_id`) REFERENCES `service` (`S_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `rspid` FOREIGN KEY (`SP_id`) REFERENCES `service-providers` (`SP_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ratings`
--

LOCK TABLES `ratings` WRITE;
/*!40000 ALTER TABLE `ratings` DISABLE KEYS */;
/*!40000 ALTER TABLE `ratings` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service`
--

DROP TABLE IF EXISTS `service`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service` (
  `S_id` int NOT NULL AUTO_INCREMENT,
  `C_id` int NOT NULL,
  `SP_id` int NOT NULL,
  `A_id` int NOT NULL,
  `S_date` date NOT NULL,
  `S_starttime` time NOT NULL,
  `S_totaltime` time NOT NULL,
  `Extra_service` varchar(45) DEFAULT NULL,
  `Amount` int NOT NULL,
  `Pet_status` binary(100) NOT NULL,
  `Comments` varchar(45) DEFAULT NULL,
  `S_status` varchar(45) NOT NULL,
  PRIMARY KEY (`S_id`,`SP_id`,`C_id`,`A_id`),
  KEY `C_id_idx` (`C_id`),
  KEY `customerid_idx` (`C_id`),
  KEY `spid_idx` (`SP_id`),
  KEY `addid_idx` (`A_id`),
  CONSTRAINT `addid` FOREIGN KEY (`A_id`) REFERENCES `address` (`A_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `customerid` FOREIGN KEY (`C_id`) REFERENCES `customers` (`C_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `spid` FOREIGN KEY (`SP_id`) REFERENCES `service-providers` (`SP_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service`
--

LOCK TABLES `service` WRITE;
/*!40000 ALTER TABLE `service` DISABLE KEYS */;
/*!40000 ALTER TABLE `service` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `service-providers`
--

DROP TABLE IF EXISTS `service-providers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `service-providers` (
  `SP_id` int NOT NULL AUTO_INCREMENT,
  `SP_fname` varchar(45) NOT NULL,
  `SP_lname` varchar(45) NOT NULL,
  `SP_bdate` date NOT NULL,
  `SP_phone` int NOT NULL,
  `SP_gender` varchar(45) NOT NULL,
  `SP_rating` int NOT NULL,
  `SP_avatar` varchar(45) NOT NULL,
  `SP_status` varchar(45) NOT NULL,
  `SP_nationality` varchar(45) NOT NULL,
  PRIMARY KEY (`SP_id`),
  CONSTRAINT `SP_id` FOREIGN KEY (`SP_id`) REFERENCES `user-table` (`U_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `service-providers`
--

LOCK TABLES `service-providers` WRITE;
/*!40000 ALTER TABLE `service-providers` DISABLE KEYS */;
/*!40000 ALTER TABLE `service-providers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user-table`
--

DROP TABLE IF EXISTS `user-table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user-table` (
  `U_id` int NOT NULL AUTO_INCREMENT,
  `U_email` varchar(100) NOT NULL,
  `U_role` varchar(45) NOT NULL,
  `U_password` varchar(45) NOT NULL,
  PRIMARY KEY (`U_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user-table`
--

LOCK TABLES `user-table` WRITE;
/*!40000 ALTER TABLE `user-table` DISABLE KEYS */;
/*!40000 ALTER TABLE `user-table` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-01-20 19:33:43
