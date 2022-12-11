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
  `ID_piwa` int NOT NULL AUTO_INCREMENT,
  `nazwa_piwa` varchar(40) NOT NULL DEFAULT 'none',
  `marka` varchar(40) NOT NULL DEFAULT 'none',
  `gatunek` varchar(40) NOT NULL DEFAULT 'none',
  `voltaz` float DEFAULT NULL,
  `IBU` int DEFAULT NULL,
  `srednia_ocen` float DEFAULT NULL,
  `opakowanie` varchar(40) NOT NULL DEFAULT 'none',
  `rodzaj_fermentacji` varchar(40) NOT NULL DEFAULT 'none',
  `piana` varchar(40) NOT NULL DEFAULT 'none',
  `nasycenie_co2` varchar(40) NOT NULL DEFAULT 'none',
  `kraj` varchar(40) NOT NULL DEFAULT 'none',
  `id_skladu` int DEFAULT '1',
  PRIMARY KEY (`ID_piwa`),
  UNIQUE KEY `ID_piwa_UNIQUE` (`ID_piwa`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwa`
--

LOCK TABLES `piwa` WRITE;
/*!40000 ALTER TABLE `piwa` DISABLE KEYS */;
INSERT INTO `piwa` VALUES (1,'Karmelowe','Perła','mocny lagier',7,84,NULL,'plastikowa butelka','dolna','wodnista i biała','lekko gazowane','Brazylia',1),(2,'Ale','Bud Light','pale ale',8,58,NULL,'beczka','górna','wodnista i kremowa','średnio gazowane','Niemcy',1),(3,'Strong','Heineken','ciemny lagier',2,85,NULL,'plastikowa butelka','dolna','gęsta i kremowa','mocno gazowane','Meksyk',1),(4,'Tropical','Budweiser','porter bałtycki',7,107,NULL,'plastikowa butelka','górna','wodnista i biała','średnio gazowane','Hiszpania',1),(5,'Porter','Stella Artois','india pale ale',11,120,NULL,'plastikowa butelka','dolna','gęsta i kremowa','lekko gazowane','Republika Południowej Afryki',1),(6,'Exclusive','Budweiser','koźlak',3,43,NULL,'puszka','górna','gęsta i biała','mocno gazowane','Chiny',1),(7,'Tropical','Stella Artois','jasny lagier',7.5,77,NULL,'plastikowa butelka','górna','wodnista i biała','mocno gazowane','Japonia',1),(8,'Mocne','Żywiec','pszeniczne',3.5,102,NULL,'puszka','dolna','gęsta i kremowa','lekko gazowane','Wielka Brytania',1),(9,'Tropical','Desperados','stout',10,116,NULL,'plastikowa butelka','górna','gęsta i biała','średnio gazowane','Niemcy',1),(10,'IPA','Żubr','mocny lagier',6,58,NULL,'plastikowa butelka','górna','wodnista i kremowa','mocno gazowane','Meksyk',1),(11,'Strong','Heineken','pilzner',9,81,NULL,'beczka','górna','gęsta i biała','średnio gazowane','Polska',1),(12,'Strong','Okocim','stout',4.5,74,NULL,'plastikowa butelka','górna','wodnista i biała','mocno gazowane','Nigeria',1),(13,'Ale','Namysłów','ciemny lager',8,14,NULL,'beczka','dolna','gęsta i biała','mocno gazowane','Japonia',1),(14,'APA','Brahma','marcowe',12,85,NULL,'szklana butelka','górna','gęsta i biała','mocno gazowane','Niemcy',1),(15,'APA','Guinness','koźlak',9,22,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','USA',1),(16,'Chmielowe','Perła','jasny lager',12,26,NULL,'beczka','górna','gęsta i biała','średnio gazowane','Chiny',1),(17,'Miodowe','Okocim','stout',3,26,NULL,'szklana butelka','górna','gęsta i kremowa','mocno gazowane','Nigeria',1),(18,'Tropical','Stella Artois','pilzner',6,27,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','USA',1),(19,'Chmielowe','Żubr','porter bałtycki',5,96,NULL,'puszka','dolna','gęsta i kremowa','mocno gazowane','Wielka Brytania',1),(20,'Tropical','Desperados','pilzner',3.5,107,NULL,'szklana butelka','górna','wodnista i kremowa','lekko gazowane','Niemcy',1),(21,'APA','Tyskie','jasny lager',8,47,NULL,'plastikowa butelka','górna','gęsta i biała','lekko gazowane','Czechy',1),(22,'Export','Harnaś','ciemny lager',7.5,102,NULL,'beczka','dolna','gęsta i kremowa','lekko gazowane','Brazylia',1),(23,'Karmelowe','Perła','porter bałtycki',11,79,NULL,'plastikowa butelka','górna','gęsta i kremowa','średnio gazowane','Hiszpania',1),(24,'Strong','Żubr','mocny lager',0,29,NULL,'beczka','górna','wodnista i kremowa','mocno gazowane','Japonia',1),(25,'Exclusive','Stella Artois','pilzner',10,62,NULL,'plastikowa butelka','górna','gęsta i biała','lekko gazowane','Brazylia',1),(26,'Exclusive','Harnaś','stout',7,54,NULL,'beczka','dolna','wodnista i kremowa','lekko gazowane','Czechy',1),(27,'Export','Budweiser','pilzner',0,55,NULL,'puszka','dolna','gęsta i kremowa','mocno gazowane','Niemcy',1),(28,'Miodowe','Okocim','porter bałtycki',2,84,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','Republika Południowej Afryki',1),(29,'Strong','Perła','koźlak',3,37,NULL,'szklana butelka','dolna','gęsta i kremowa','lekko gazowane','Brazylia',1),(30,'Summer','Corona','stout',5.5,75,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','Niemcy',1),(31,'Strong','Tyskie','marcowe',7.5,118,NULL,'plastikowa butelka','górna','wodnista i kremowa','mocno gazowane','Niemcy',1),(32,'Mocne','Harnaś','porter bałtycki',3,59,NULL,'plastikowa butelka','górna','wodnista i biała','lekko gazowane','Nigeria',1),(33,'Chmielowe','Desperados','pale ale',4,102,NULL,'szklana butelka','dolna','wodnista i kremowa','mocno gazowane','Hiszpania',1),(34,'Strong','Guinness','koźlak',8.5,17,NULL,'szklana butelka','górna','gęsta i biała','lekko gazowane','Hiszpania',1),(35,'Exclusive','Perła','marcowe',3,49,NULL,'beczka','górna','gęsta i biała','średnio gazowane','Japonia',1),(36,'Export','Żubr','mocny lager',5.5,83,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','Polska',1),(37,'Tropical','Corona','marcowe',4,86,NULL,'puszka','dolna','wodnista i kremowa','mocno gazowane','Wielka Brytania',1),(38,'Chmielowe','Budweiser','stout',0,8,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','Meksyk',1),(39,'Ale','Brahma','stout',11,110,NULL,'beczka','górna','wodnista i biała','mocno gazowane','Republika Południowej Afryki',1),(40,'Tropical','Bud Light','koźlak',7,73,NULL,'puszka','górna','wodnista i kremowa','średnio gazowane','Niemcy',1);
/*!40000 ALTER TABLE `piwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `id_składu` int NOT NULL AUTO_INCREMENT,
  `woda` varchar(20) NOT NULL,
  `slod` varchar(20) NOT NULL,
  `dodatki` varchar(300) NOT NULL,
  PRIMARY KEY (`id_składu`),
  UNIQUE KEY `nazwa_piwa_UNIQUE` (`id_składu`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
INSERT INTO `sklad` VALUES (1,'miekka','jeczmienny',''),(2,'twarda','wedzony','persymona'),(3,'miekka','jeczmienny','winogrono,kwiat lotosu,karmel'),(4,'miekka','wedzony','smoczy owoc'),(5,'twarda','karmelowy','ananas,chili'),(6,'twarda','pszeniczny','truskawka,borowka amerykanska'),(7,'miekka','pszeniczny','karmel'),(8,'twarda','zytni','kokos,czekolada'),(9,'twarda','wedzony','ciastko,karmel,brzoskwinia'),(10,'miekka','wedzony','chili'),(11,'miekka','jeczmienny',''),(12,'twarda','karmelowy','kawa,karmel'),(13,'miekka','wedzony','jagoda'),(14,'twarda','pszeniczny','poziomka'),(15,'twarda','wedzony','rum,aloes'),(16,'miekka','wedzony',''),(17,'twarda','zytni','limonka'),(18,'twarda','wedzony','chili,limonka'),(19,'twarda','zytni','kokos,limonka,czekolada'),(20,'miekka','jeczmienny',''),(21,'twarda','pszeniczny','truskawka,gruszka,wanilia'),(22,'twarda','zytni','rum'),(23,'twarda','pszeniczny','miod wielokwiatowy,kwiat lotosu,poziomka'),(24,'twarda','zytni','kawa,smoczy owoc,miod wielokwiatowy'),(25,'twarda','pszeniczny','gruszka,aloes,winogrono'),(26,'twarda','pszeniczny','miod wielokwiatowy,ananas,wanilia'),(27,'miekka','zytni','karmel,wanilia,poziomka'),(28,'miekka','zytni','kawa'),(29,'miekka','pszeniczny','malina,trawa cytrynowa'),(30,'miekka','wedzony','limonka,cytryna,czekolada'),(31,'miekka','zytni','persymona,czekolada'),(32,'miekka','zytni','limonka,karmel,jasmin'),(33,'miekka','palony','smoczy owoc'),(34,'twarda','jeczmienny','miod wielokwiatowy'),(35,'miekka','karmelowy',''),(36,'miekka','karmelowy',''),(37,'miekka','jeczmienny',''),(38,'twarda','karmelowy','gruszka,rum'),(39,'miekka','wedzony','chili,limonka,kokos'),(40,'twarda','palony','poziomka');
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
INSERT INTO `uzytkownicy` VALUES ('admin',20,'admin','admin@gmail.com','admin',0),('test',20,'test','test','unverified',0);
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

-- Dump completed on 2022-12-11 18:33:51
