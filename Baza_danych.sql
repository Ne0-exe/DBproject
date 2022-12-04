-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: wyroby_slodowe_projekt
-- ------------------------------------------------------
-- Server version	8.0.31

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
-- Table structure for table `piwa`
--

DROP TABLE IF EXISTS `piwa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piwa` (
  `nazwa_piwa` varchar(20) NOT NULL,
  `marka` varchar(20) NOT NULL,
  `gatunek` varchar(20) NOT NULL,
  `voltaz` float DEFAULT NULL,
  `goryczka` float DEFAULT NULL,
  `srednia_ocen` float DEFAULT NULL,
  `opakowanie` varchar(20) NOT NULL,
  `rodzaj_fermentacji` varchar(20) NOT NULL,
  `chmielowosc` varchar(20) NOT NULL,
  `piana` varchar(20) NOT NULL,
  `nasycenie_co2` varchar(20) NOT NULL,
  `kraj` varchar(20) NOT NULL,
  PRIMARY KEY (`nazwa_piwa`),
  UNIQUE KEY `nazwa_piwa_UNIQUE` (`nazwa_piwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwa`
--

LOCK TABLES `piwa` WRITE;
/*!40000 ALTER TABLE `piwa` DISABLE KEYS */;
INSERT INTO `piwa` VALUES ('aa','perla','aa',2,2,2,'aasd','asd','asd','asd','asd','asd'),('chmielowa','perla','jasne',5,5,4.89,'butelka','brak','mocna','gesta','male','polska'),('cos','perla','sdf',2,2,2,'sagajd','adfh','dafh','adfha','ahfdfh','dafhdah'),('cosdlugiego11','perla','cosdlugiego11',5,5,5,'cosdlugiego11','cosdlugiego11','cosdlugiego11','cosdlugiego11','cosdlugiego11','cosdlugiego11'),('cso1','perla','gsdfag',2,2,2,'dfgah','adfhdas','dfhadh','fdehah','dafhdfah','dfhaddfha'),('export','perla','jasne',4.5,3,4.76,'puszka','brak','slaba','rzadka','duze','polska'),('piate','perla','piec',2,2,2,'dfhgadh','dahda','dafhad','adha','dfhdah','fdha');
/*!40000 ALTER TABLE `piwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `nazwa_piwa` varchar(20) NOT NULL,
  `woda` varchar(20) NOT NULL,
  `slod` varchar(20) NOT NULL,
  `skladniki` varchar(300) NOT NULL,
  PRIMARY KEY (`nazwa_piwa`),
  UNIQUE KEY `nazwa_piwa_UNIQUE` (`nazwa_piwa`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uzytkownicy`
--

DROP TABLE IF EXISTS `uzytkownicy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uzytkownicy` (
  `nazwa_uzytkownika` varchar(20) NOT NULL,
  `wiek` int NOT NULL,
  `haslo` varchar(16) NOT NULL,
  `email` varchar(45) NOT NULL,
  `ranga` varchar(20) DEFAULT 'unverified',
  `licznik` int DEFAULT '0',
  PRIMARY KEY (`nazwa_uzytkownika`),
  UNIQUE KEY `nazwa_uzytkownika_UNIQUE` (`nazwa_uzytkownika`),
  UNIQUE KEY `email_UNIQUE` (`email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES ('a',21,'a','a','verified',0),('admin',20,'admin','admin@gmail.com','admin',0),('q',20,'q','q','unverified',0);
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-04 13:24:37
