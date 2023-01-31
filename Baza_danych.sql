-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: projektdb.chit4dyq2s1j.us-east-1.rds.amazonaws.com    Database: projektDB
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
SET @MYSQLDUMP_TEMP_LOG_BIN = @@SESSION.SQL_LOG_BIN;
SET @@SESSION.SQL_LOG_BIN= 0;

--
-- GTID state at the beginning of the backup 
--

SET @@GLOBAL.GTID_PURGED=/*!80000 '+'*/ '';

--
-- Table structure for table `kolejka`
--

DROP TABLE IF EXISTS `kolejka`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kolejka` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_opinii` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_id_opnii_idx` (`id_opinii`),
  CONSTRAINT `fk_id_opnii` FOREIGN KEY (`id_opinii`) REFERENCES `opinie` (`ID_opinii`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kolejka`
--

LOCK TABLES `kolejka` WRITE;
/*!40000 ALTER TABLE `kolejka` DISABLE KEYS */;
INSERT INTO `kolejka` VALUES (4,4),(5,5),(7,7),(12,12),(13,13),(17,17),(18,18),(19,19),(20,20),(22,22),(23,23),(25,25),(30,30),(31,31),(32,32),(33,33),(34,34);
/*!40000 ALTER TABLE `kolejka` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `odrzucone`
--

DROP TABLE IF EXISTS `odrzucone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `odrzucone` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_opinii` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_id_opinii_idx` (`id_opinii`),
  KEY `fk_opinia_idx` (`id_opinii`),
  CONSTRAINT `fk_opinia` FOREIGN KEY (`id_opinii`) REFERENCES `opinie` (`ID_opinii`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `odrzucone`
--

LOCK TABLES `odrzucone` WRITE;
/*!40000 ALTER TABLE `odrzucone` DISABLE KEYS */;
INSERT INTO `odrzucone` VALUES (1,35),(2,36);
/*!40000 ALTER TABLE `odrzucone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `opinie`
--

DROP TABLE IF EXISTS `opinie`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `opinie` (
  `ID_opinii` int NOT NULL AUTO_INCREMENT,
  `ocena` int NOT NULL,
  `opinia` varchar(256) DEFAULT NULL,
  `ID_piwa` int NOT NULL,
  `nazwa_uzytkownika` varchar(45) NOT NULL,
  `id_statusu` int NOT NULL,
  `feedback` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`ID_opinii`),
  UNIQUE KEY `ID_opinii_UNIQUE` (`ID_opinii`),
  KEY `fk_id_statusu_idx` (`id_statusu`),
  KEY `fk_uzytkownik_idx` (`nazwa_uzytkownika`),
  KEY `fk_piwo_idx` (`ID_piwa`),
  CONSTRAINT `fk_id_statusu` FOREIGN KEY (`id_statusu`) REFERENCES `status_opinii` (`id`),
  CONSTRAINT `fk_piwo` FOREIGN KEY (`ID_piwa`) REFERENCES `piwa` (`ID_piwa`),
  CONSTRAINT `fk_uzytkownik` FOREIGN KEY (`nazwa_uzytkownika`) REFERENCES `uzytkownicy` (`nazwa_uzytkownika`) ON DELETE RESTRICT ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `opinie`
--

LOCK TABLES `opinie` WRITE;
/*!40000 ALTER TABLE `opinie` DISABLE KEYS */;
INSERT INTO `opinie` VALUES (1,5,'No tak średnio bym powiedział.',1,'maciek',2,NULL),(2,9,'Luz bajera',2,'maciek',2,NULL),(3,1,'Szczoch',3,'maciek',2,NULL),(4,6,'Ściek, ale tani.',4,'maciek',1,NULL),(5,10,'Boski, niczym Kustosz',10,'maciek',1,NULL),(6,8,'Gitara',2,'test',2,NULL),(7,10,'giiiiit',199,'mateuszN',1,NULL),(8,6,'całkiem niezłe',56,'mateuszN',2,NULL),(9,8,'bardzo dobre, czyć chmielowość',78,'mateuszN',2,NULL),(10,3,'słabe',99,'mateuszN',2,NULL),(11,2,'nie polecam',101,'mateuszN',2,NULL),(12,9,'dobre',121,'mateuszN',1,NULL),(13,3,'Piłem gorsze',36,'maciek',1,NULL),(14,8,'całkiem całkiem',1,'mateuszN',2,NULL),(15,5,'piłem lepsze',2,'mateuszN',2,NULL),(16,10,'moje ulubione',3,'mateuszN',2,NULL),(17,5,'Kwintesencja średniości',190,'maciek',1,NULL),(18,7,'Nie ma tak, że dobre czy niedobre...',18,'maciek',1,NULL),(19,9,'pina ma idealną konsystencje',5,'mateuszN',1,NULL),(20,4,'nie pić na trzezwo!',23,'maciek',1,NULL),(21,5,'w miare',54,'test',2,NULL),(22,10,'smakuje najlepiej na wyspie',10,'adrian',1,NULL),(23,5,'w sam raz na piątaka',5,'adrian',1,NULL),(24,6,'git',150,'adrian',2,NULL),(25,5,'nawet ok',73,'adrian',1,NULL),(26,1,'tragiczne',2,'adrian',2,NULL),(27,1,'niedobre',69,'mateuszN',2,NULL),(28,8,'najlepsze schłodzone',166,'mateuszN',2,NULL),(29,4,'średniawa',144,'mateuszN',1,NULL),(30,3,'slabe',57,'test',1,NULL),(31,8,'Bardzo dobre',13,'test',1,NULL),(32,1,'okropne',121,'test',1,NULL),(33,9,'najlepsze',35,'test',1,NULL),(34,7,'spoko',5,'test',1,NULL),(35,1,'dffdgd',6,'mateuszN',3,'opinia niezgodna z regulaminem'),(36,10,'sdgfgdfhd',8,'mateuszN',3,'opinia niezgodna z regulaminem');
/*!40000 ALTER TABLE `opinie` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `opinie_AFTER_INSERT` AFTER INSERT ON `opinie` FOR EACH ROW BEGIN
IF NEW.id_statusu = 1 THEN
	INSERT INTO kolejka (id_opinii) VALUES (NEW.ID_opinii);
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `opinie_BEFORE_UPDATE` BEFORE UPDATE ON `opinie` FOR EACH ROW BEGIN
IF NEW.id_statusu = 2 THEN
    DELETE FROM top10_ocena;
    INSERT INTO top10_ocena (ID_piwa) SELECT ID_piwa FROM piwa ORDER BY srednia_ocen DESC LIMIT 10;
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `opinie_AFTER_UPDATE` AFTER UPDATE ON `opinie` FOR EACH ROW BEGIN
DECLARE avg_value FLOAT;
IF NEW.id_statusu = 2 THEN
	UPDATE uzytkownicy SET licznik = licznik + 1 WHERE nazwa_uzytkownika = NEW.nazwa_uzytkownika; 
    INSERT INTO zaakceptowane (id_opinii) VALUES (NEW.ID_opinii);
    DELETE FROM kolejka WHERE id_opinii = NEW.ID_opinii;
    SET avg_value = (SELECT avg(ocena) FROM opinie WHERE ID_piwa = NEW.ID_piwa AND id_statusu = 2);
    UPDATE piwa SET srednia_ocen = avg_value WHERE ID_piwa = NEW.ID_piwa; 
END IF;
IF NEW.id_statusu = 3 THEN
	INSERT INTO odrzucone (id_opinii) VALUES (NEW.ID_opinii);
    DELETE FROM kolejka WHERE id_opinii = NEW.ID_opinii;
END IF;   
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

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
  UNIQUE KEY `ID_piwa_UNIQUE` (`ID_piwa`),
  KEY `fk_id_skladu_idx` (`id_skladu`),
  CONSTRAINT `fk_id_skladu` FOREIGN KEY (`id_skladu`) REFERENCES `sklad` (`id_skladu`)
) ENGINE=InnoDB AUTO_INCREMENT=201 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piwa`
--

LOCK TABLES `piwa` WRITE;
/*!40000 ALTER TABLE `piwa` DISABLE KEYS */;
INSERT INTO `piwa` VALUES (1,'Summer','Coors Light','india pale ale',8,65,6.5,'beczka','górna','gęsta i kremowa','lekko gazowane','Japonia',12),(2,'Ale','Żywiec','mocny lager',12,21,5.75,'puszka','dolna','wodnista i kremowa','lekko gazowane','Brazylia',42),(3,'IPA','Bud Light','mocny lager',5,59,5.5,'szklana butelka','dolna','gęsta i biała','lekko gazowane','RPA',17),(4,'APA','Coors Light','jasny lager',8,29,NULL,'beczka','dolna','wodnista i kremowa','średnio gazowane','Hiszpania',20),(5,'APA','Okocim','koźlak',7,87,NULL,'puszka','dolna','gęsta i biała','lekko gazowane','Wielka Brytania',23),(6,'Tropical','Namysłów','ciemny lager',4.5,18,NULL,'beczka','dolna','gęsta i biała','mocno gazowane','RPA',16),(7,'Tropical','Okocim','pszeniczne',0,42,NULL,'puszka','dolna','wodnista i kremowa','średnio gazowane','Czechy',32),(8,'IPA','Bud Light','marcowe',4.5,45,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','Hiszpania',36),(9,'IPA','Heineken','ciemny lager',5.5,121,NULL,'puszka','dolna','gęsta i biała','mocno gazowane','Polska',17),(10,'Miodowe','Bud Light','marcowe',3,71,NULL,'szklana butelka','dolna','gęsta i biała','średnio gazowane','Meksyk',4),(11,'Mocne','Coors Light','marcowe',7,48,NULL,'plastikowa butelka','dolna','wodnista i kremowa','lekko gazowane','Nigeria',46),(12,'Export','Guinness','stout',2,109,NULL,'beczka','dolna','gęsta i biała','średnio gazowane','RPA',7),(13,'APA','Stella Artois','porter bałtycki',4,82,NULL,'plastikowa butelka','dolna','wodnista i kremowa','lekko gazowane','Meksyk',2),(14,'Ale','Desperados','mocny lager',4.5,60,NULL,'beczka','górna','wodnista i biała','średnio gazowane','Wielka Brytania',40),(15,'APA','Stella Artois','pszeniczne',10,97,NULL,'szklana butelka','górna','gęsta i kremowa','mocno gazowane','Hiszpania',18),(16,'Chmielowe','Desperados','india pale ale',10,113,NULL,'beczka','dolna','gęsta i kremowa','średnio gazowane','Hiszpania',9),(17,'APA','Coors Light','marcowe',5,84,NULL,'puszka','dolna','wodnista i kremowa','lekko gazowane','Japonia',24),(18,'Tropical','Brahma','pszeniczne',0,37,NULL,'plastikowa butelka','dolna','wodnista i biała','lekko gazowane','Hiszpania',18),(19,'Strong','Corona','mocny lager',10,119,NULL,'szklana butelka','dolna','gęsta i kremowa','średnio gazowane','USA',16),(20,'Strong','Harnaś','india pale ale',12,48,NULL,'beczka','górna','wodnista i kremowa','lekko gazowane','RPA',7),(21,'Export','Brahma','koźlak',7.5,29,NULL,'plastikowa butelka','dolna','wodnista i biała','średnio gazowane','Czechy',45),(22,'Ale','Brahma','pszeniczne',4.5,118,NULL,'beczka','górna','gęsta i biała','mocno gazowane','Hiszpania',35),(23,'Chmielowe','Lech','stout',7.5,52,NULL,'beczka','dolna','gęsta i kremowa','mocno gazowane','Chiny',26),(24,'APA','Guinness','stout',0,43,NULL,'plastikowa butelka','dolna','gęsta i biała','lekko gazowane','RPA',27),(25,'Porter','Budweiser','mocny lager',5,52,NULL,'szklana butelka','dolna','gęsta i kremowa','mocno gazowane','Nigeria',31),(26,'Tropical','Okocim','pszeniczne',10,97,NULL,'szklana butelka','górna','wodnista i biała','średnio gazowane','Polska',37),(27,'IPA','Perła','stout',7,21,NULL,'puszka','dolna','wodnista i kremowa','mocno gazowane','Hiszpania',49),(28,'Miodowe','Tyskie','marcowe',3.5,68,NULL,'plastikowa butelka','górna','gęsta i kremowa','mocno gazowane','Hiszpania',32),(29,'IPA','Namysłów','india pale ale',5.5,90,NULL,'szklana butelka','dolna','wodnista i biała','mocno gazowane','Meksyk',28),(30,'Export','Stella Artois','pszeniczne',4.5,24,NULL,'puszka','górna','gęsta i kremowa','średnio gazowane','RPA',31),(31,'Miodowe','Stella Artois','pilzner',10,62,NULL,'puszka','dolna','wodnista i biała','średnio gazowane','Wielka Brytania',47),(32,'Porter','Brahma','stout',7.5,32,NULL,'plastikowa butelka','dolna','gęsta i kremowa','średnio gazowane','Czechy',17),(33,'Karmelowe','Tyskie','india pale ale',9,51,NULL,'szklana butelka','dolna','wodnista i biała','lekko gazowane','Polska',3),(34,'Porter','Desperados','marcowe',2,82,NULL,'puszka','górna','wodnista i kremowa','średnio gazowane','Wielka Brytania',2),(35,'Miodowe','Lech','koźlak',9,30,NULL,'szklana butelka','górna','gęsta i kremowa','mocno gazowane','Polska',35),(36,'Exclusive','Żubr','ciemny lager',3.5,103,NULL,'plastikowa butelka','dolna','gęsta i biała','średnio gazowane','Brazylia',33),(37,'Miodowe','Coors Light','koźlak',3,63,NULL,'puszka','górna','gęsta i biała','lekko gazowane','Chiny',27),(38,'APA','Budweiser','marcowe',8,17,NULL,'puszka','górna','wodnista i biała','mocno gazowane','Polska',17),(39,'Strong','Desperados','jasny lager',11,23,NULL,'beczka','górna','gęsta i kremowa','lekko gazowane','Meksyk',20),(40,'Strong','Corona','marcowe',4.5,35,NULL,'plastikowa butelka','górna','wodnista i kremowa','mocno gazowane','Hiszpania',19),(41,'Miodowe','Stella Artois','mocny lager',7,12,NULL,'szklana butelka','górna','wodnista i biała','lekko gazowane','Czechy',7),(42,'Mocne','Perła','koźlak',3.5,44,NULL,'szklana butelka','dolna','gęsta i biała','mocno gazowane','Brazylia',7),(43,'Summer','Bud Light','pale ale',8.5,27,NULL,'beczka','górna','wodnista i kremowa','mocno gazowane','Hiszpania',24),(44,'Ale','Budweiser','porter bałtycki',5.5,53,NULL,'plastikowa butelka','dolna','wodnista i biała','średnio gazowane','Brazylia',18),(45,'Strong','Coors Light','koźlak',5,32,NULL,'beczka','górna','gęsta i kremowa','mocno gazowane','Japonia',33),(46,'Miodowe','Tyskie','koźlak',5,112,NULL,'plastikowa butelka','dolna','gęsta i biała','średnio gazowane','Brazylia',14),(47,'Strong','Bud Light','porter bałtycki',5.5,86,NULL,'plastikowa butelka','górna','gęsta i kremowa','lekko gazowane','Wielka Brytania',41),(48,'Ale','Żywiec','marcowe',3,116,NULL,'szklana butelka','dolna','wodnista i biała','mocno gazowane','Meksyk',14),(49,'Strong','Heineken','jasny lager',2,48,NULL,'puszka','dolna','wodnista i kremowa','lekko gazowane','Polska',50),(50,'Export','Perła','jasny lager',12,66,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','Czechy',35),(51,'Ale','Coors Light','mocny lager',3,47,NULL,'szklana butelka','dolna','wodnista i biała','mocno gazowane','Meksyk',36),(52,'Ale','Coors Light','marcowe',3.5,116,NULL,'beczka','górna','wodnista i kremowa','mocno gazowane','Nigeria',6),(53,'Tropical','Harnaś','porter bałtycki',12,92,NULL,'szklana butelka','dolna','gęsta i kremowa','średnio gazowane','RPA',27),(54,'Exclusive','Guinness','porter bałtycki',5,121,5,'puszka','górna','wodnista i kremowa','mocno gazowane','Meksyk',10),(55,'Export','Żywiec','pilzner',6,95,NULL,'szklana butelka','dolna','gęsta i kremowa','mocno gazowane','Japonia',48),(56,'Export','Perła','koźlak',11,58,6,'plastikowa butelka','dolna','wodnista i biała','średnio gazowane','Polska',38),(57,'IPA','Stella Artois','porter bałtycki',3,31,NULL,'puszka','dolna','gęsta i kremowa','średnio gazowane','Hiszpania',26),(58,'Ale','Lech','stout',8.5,115,NULL,'beczka','dolna','gęsta i biała','mocno gazowane','RPA',38),(59,'Mocne','Okocim','ciemny lager',2,78,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','USA',41),(60,'Summer','Namysłów','india pale ale',3.5,65,NULL,'plastikowa butelka','górna','wodnista i kremowa','średnio gazowane','Meksyk',14),(61,'IPA','Perła','stout',5.5,117,NULL,'szklana butelka','dolna','wodnista i biała','średnio gazowane','Chiny',16),(62,'Chmielowe','Skol','marcowe',5,77,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','Niemcy',35),(63,'IPA','Stella Artois','stout',5,44,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','USA',28),(64,'Strong','Guinness','marcowe',5.5,33,NULL,'beczka','górna','wodnista i biała','średnio gazowane','Nigeria',1),(65,'Karmelowe','Corona','pszeniczne',4.5,99,NULL,'plastikowa butelka','dolna','gęsta i biała','mocno gazowane','Niemcy',42),(66,'Tropical','Tyskie','marcowe',7,35,NULL,'beczka','dolna','gęsta i kremowa','mocno gazowane','Czechy',30),(67,'Mocne','Żubr','pilzner',5.5,27,NULL,'plastikowa butelka','górna','wodnista i biała','lekko gazowane','Czechy',27),(68,'APA','Desperados','porter bałtycki',3.5,33,NULL,'szklana butelka','górna','gęsta i biała','średnio gazowane','Brazylia',14),(69,'Karmelowe','Żywiec','pale ale',7.5,9,1,'puszka','dolna','wodnista i kremowa','lekko gazowane','Wielka Brytania',12),(70,'Export','Żubr','pszeniczne',2,102,NULL,'puszka','górna','gęsta i kremowa','mocno gazowane','Czechy',49),(71,'Strong','Desperados','india pale ale',3,68,NULL,'plastikowa butelka','górna','gęsta i biała','mocno gazowane','Wielka Brytania',6),(72,'IPA','Stella Artois','pale ale',11,51,NULL,'puszka','dolna','gęsta i kremowa','mocno gazowane','Wielka Brytania',26),(73,'Ale','Harnaś','mocny lager',3,63,NULL,'puszka','górna','wodnista i kremowa','średnio gazowane','Brazylia',43),(74,'Porter','Perła','pilzner',6,112,NULL,'beczka','dolna','gęsta i kremowa','mocno gazowane','Niemcy',18),(75,'Tropical','Brahma','pilzner',12,119,NULL,'plastikowa butelka','górna','wodnista i biała','mocno gazowane','Brazylia',43),(76,'Miodowe','Namysłów','marcowe',5,12,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','Meksyk',49),(77,'Exclusive','Guinness','stout',3,32,NULL,'szklana butelka','dolna','wodnista i biała','lekko gazowane','USA',22),(78,'Strong','Heineken','porter bałtycki',6,32,8,'puszka','dolna','gęsta i kremowa','mocno gazowane','Niemcy',11),(79,'Miodowe','Corona','mocny lager',8,55,NULL,'puszka','dolna','wodnista i biała','mocno gazowane','Nigeria',31),(80,'IPA','Żubr','porter bałtycki',9,87,NULL,'szklana butelka','dolna','wodnista i kremowa','mocno gazowane','RPA',8),(81,'APA','Perła','koźlak',8.5,24,NULL,'plastikowa butelka','dolna','gęsta i biała','lekko gazowane','Niemcy',26),(82,'Strong','Heineken','pszeniczne',5,114,NULL,'puszka','górna','gęsta i kremowa','średnio gazowane','RPA',40),(83,'Summer','Namysłów','porter bałtycki',10,92,NULL,'beczka','dolna','gęsta i kremowa','lekko gazowane','Czechy',46),(84,'Mocne','Coors Light','mocny lager',8.5,48,NULL,'puszka','dolna','wodnista i kremowa','średnio gazowane','USA',50),(85,'Miodowe','Okocim','ciemny lager',8,116,NULL,'plastikowa butelka','górna','gęsta i biała','mocno gazowane','Wielka Brytania',41),(86,'APA','Namysłów','pszeniczne',7.5,70,NULL,'puszka','dolna','wodnista i kremowa','średnio gazowane','Brazylia',38),(87,'Chmielowe','Budweiser','india pale ale',4,56,NULL,'beczka','dolna','wodnista i biała','średnio gazowane','Meksyk',8),(88,'Porter','Bud Light','pale ale',5.5,112,NULL,'puszka','górna','gęsta i kremowa','średnio gazowane','RPA',17),(89,'Strong','Stella Artois','pale ale',10,45,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','Chiny',27),(90,'Export','Stella Artois','mocny lager',8.5,80,NULL,'plastikowa butelka','dolna','wodnista i biała','mocno gazowane','Hiszpania',41),(91,'Chmielowe','Heineken','jasny lager',5,96,NULL,'plastikowa butelka','górna','gęsta i kremowa','mocno gazowane','RPA',26),(92,'Chmielowe','Corona','pale ale',3.5,94,NULL,'puszka','dolna','gęsta i biała','mocno gazowane','Brazylia',50),(93,'Summer','Coors Light','mocny lager',4.5,93,NULL,'plastikowa butelka','dolna','gęsta i kremowa','średnio gazowane','Japonia',46),(94,'Export','Brahma','koźlak',8.5,55,NULL,'puszka','dolna','gęsta i kremowa','mocno gazowane','Japonia',29),(95,'Strong','Tyskie','stout',4,60,NULL,'szklana butelka','dolna','wodnista i kremowa','mocno gazowane','Czechy',26),(96,'IPA','Żywiec','porter bałtycki',3.5,28,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','Chiny',24),(97,'Strong','Żubr','pale ale',6,58,NULL,'beczka','górna','gęsta i kremowa','lekko gazowane','Hiszpania',25),(98,'Porter','Skol','koźlak',7.5,111,NULL,'plastikowa butelka','dolna','gęsta i kremowa','mocno gazowane','Hiszpania',22),(99,'Ale','Tyskie','pilzner',10,45,3,'puszka','dolna','gęsta i kremowa','mocno gazowane','Hiszpania',24),(100,'Mocne','Perła','marcowe',2,113,NULL,'plastikowa butelka','górna','wodnista i kremowa','lekko gazowane','Meksyk',5),(101,'Porter','Skol','jasny lager',7,46,2,'puszka','górna','wodnista i kremowa','mocno gazowane','Brazylia',8),(102,'Tropical','Stella Artois','pszeniczne',6,41,NULL,'puszka','dolna','wodnista i kremowa','lekko gazowane','Meksyk',3),(103,'Chmielowe','Lech','marcowe',0,35,NULL,'szklana butelka','dolna','wodnista i kremowa','średnio gazowane','Polska',22),(104,'IPA','Stella Artois','mocny lager',3,97,NULL,'szklana butelka','górna','gęsta i kremowa','mocno gazowane','Czechy',3),(105,'Karmelowe','Lech','koźlak',5,109,NULL,'puszka','górna','wodnista i biała','średnio gazowane','Niemcy',49),(106,'Exclusive','Lech','porter bałtycki',3.5,98,NULL,'plastikowa butelka','dolna','wodnista i biała','średnio gazowane','Meksyk',2),(107,'Tropical','Stella Artois','marcowe',7.5,25,NULL,'beczka','górna','gęsta i biała','mocno gazowane','Niemcy',27),(108,'Miodowe','Namysłów','pilzner',4.5,73,NULL,'puszka','górna','gęsta i kremowa','lekko gazowane','Meksyk',41),(109,'Chmielowe','Skol','pale ale',7.5,120,NULL,'beczka','górna','gęsta i kremowa','lekko gazowane','RPA',25),(110,'Summer','Żywiec','stout',6,91,NULL,'beczka','dolna','gęsta i biała','mocno gazowane','Wielka Brytania',39),(111,'APA','Budweiser','ciemny lager',3.5,35,NULL,'puszka','górna','wodnista i biała','mocno gazowane','Chiny',10),(112,'Porter','Skol','india pale ale',0,114,NULL,'puszka','dolna','wodnista i biała','mocno gazowane','Hiszpania',37),(113,'APA','Harnaś','ciemny lager',4,94,NULL,'puszka','dolna','wodnista i kremowa','mocno gazowane','Czechy',14),(114,'Ale','Lech','pilzner',3.5,37,NULL,'beczka','dolna','wodnista i kremowa','lekko gazowane','Wielka Brytania',48),(115,'Miodowe','Tyskie','stout',5.5,62,NULL,'plastikowa butelka','dolna','wodnista i kremowa','średnio gazowane','Wielka Brytania',3),(116,'Miodowe','Namysłów','marcowe',5,102,NULL,'puszka','górna','gęsta i kremowa','średnio gazowane','Czechy',38),(117,'Tropical','Skol','mocny lager',0,84,NULL,'beczka','dolna','gęsta i kremowa','średnio gazowane','Brazylia',38),(118,'Porter','Harnaś','stout',11,70,NULL,'plastikowa butelka','górna','gęsta i kremowa','mocno gazowane','Meksyk',11),(119,'Porter','Budweiser','porter bałtycki',7,9,NULL,'beczka','górna','gęsta i biała','średnio gazowane','Nigeria',32),(120,'Miodowe','Brahma','pszeniczne',3.5,40,NULL,'plastikowa butelka','górna','wodnista i biała','średnio gazowane','Hiszpania',14),(121,'Porter','Guinness','pale ale',4.5,90,NULL,'puszka','górna','gęsta i kremowa','średnio gazowane','Wielka Brytania',2),(122,'Chmielowe','Żubr','porter bałtycki',8.5,11,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','USA',12),(123,'Porter','Skol','pale ale',9,82,NULL,'puszka','dolna','gęsta i kremowa','lekko gazowane','Czechy',16),(124,'IPA','Guinness','ciemny lager',3,15,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','USA',34),(125,'Karmelowe','Desperados','pszeniczne',12,20,NULL,'szklana butelka','dolna','wodnista i biała','średnio gazowane','Wielka Brytania',49),(126,'Strong','Brahma','ciemny lager',8.5,107,NULL,'beczka','górna','wodnista i biała','mocno gazowane','Brazylia',50),(127,'Export','Bud Light','stout',5.5,35,NULL,'puszka','górna','wodnista i kremowa','średnio gazowane','Czechy',5),(128,'Summer','Budweiser','pilzner',6,118,NULL,'beczka','górna','gęsta i kremowa','mocno gazowane','Niemcy',44),(129,'Exclusive','Namysłów','pale ale',5,38,NULL,'puszka','dolna','wodnista i biała','średnio gazowane','Japonia',33),(130,'Summer','Namysłów','pale ale',2,78,NULL,'plastikowa butelka','dolna','wodnista i biała','średnio gazowane','RPA',22),(131,'Summer','Budweiser','stout',7.5,35,NULL,'beczka','dolna','gęsta i kremowa','lekko gazowane','Polska',22),(132,'Mocne','Żywiec','mocny lager',7,55,NULL,'szklana butelka','dolna','gęsta i kremowa','mocno gazowane','RPA',32),(133,'Strong','Brahma','jasny lager',10,71,NULL,'puszka','górna','gęsta i kremowa','lekko gazowane','Wielka Brytania',29),(134,'Karmelowe','Stella Artois','marcowe',2,71,NULL,'beczka','górna','wodnista i kremowa','mocno gazowane','RPA',25),(135,'Karmelowe','Okocim','porter bałtycki',5.5,111,NULL,'beczka','dolna','wodnista i kremowa','mocno gazowane','Chiny',23),(136,'Export','Namysłów','mocny lager',12,102,NULL,'beczka','dolna','gęsta i kremowa','mocno gazowane','Meksyk',17),(137,'Exclusive','Żywiec','stout',0,43,NULL,'beczka','dolna','wodnista i biała','średnio gazowane','Niemcy',44),(138,'IPA','Okocim','india pale ale',5,41,NULL,'szklana butelka','dolna','wodnista i kremowa','lekko gazowane','Brazylia',13),(139,'APA','Bud Light','koźlak',7,96,NULL,'puszka','dolna','wodnista i kremowa','mocno gazowane','Wielka Brytania',33),(140,'Karmelowe','Brahma','pszeniczne',8,67,NULL,'puszka','dolna','gęsta i biała','lekko gazowane','Meksyk',3),(141,'Miodowe','Guinness','mocny lager',5.5,20,NULL,'beczka','dolna','wodnista i biała','lekko gazowane','USA',7),(142,'Miodowe','Lech','mocny lager',3.5,29,NULL,'plastikowa butelka','górna','wodnista i biała','średnio gazowane','Niemcy',45),(143,'Mocne','Harnaś','pale ale',2,113,NULL,'puszka','górna','wodnista i kremowa','średnio gazowane','Nigeria',1),(144,'APA','Okocim','pale ale',4.5,42,4,'puszka','dolna','wodnista i biała','lekko gazowane','Brazylia',20),(145,'IPA','Żubr','koźlak',11,78,NULL,'beczka','górna','wodnista i biała','lekko gazowane','Chiny',5),(146,'Porter','Budweiser','koźlak',8.5,22,NULL,'plastikowa butelka','górna','wodnista i biała','średnio gazowane','USA',19),(147,'Chmielowe','Heineken','ciemny lager',3,106,NULL,'puszka','górna','wodnista i kremowa','mocno gazowane','RPA',23),(148,'Exclusive','Lech','stout',12,30,NULL,'plastikowa butelka','górna','gęsta i kremowa','średnio gazowane','Wielka Brytania',42),(149,'APA','Stella Artois','koźlak',3.5,56,NULL,'plastikowa butelka','dolna','gęsta i biała','mocno gazowane','Japonia',9),(150,'Tropical','Guinness','pilzner',7.5,104,6,'plastikowa butelka','górna','gęsta i kremowa','mocno gazowane','Nigeria',5),(151,'Summer','Stella Artois','stout',7.5,47,NULL,'plastikowa butelka','górna','wodnista i kremowa','mocno gazowane','Japonia',10),(152,'Summer','Budweiser','marcowe',3.5,49,NULL,'beczka','dolna','wodnista i biała','średnio gazowane','Japonia',12),(153,'Tropical','Coors Light','mocny lager',4,39,NULL,'beczka','dolna','gęsta i biała','lekko gazowane','Hiszpania',21),(154,'Export','Lech','marcowe',3,52,NULL,'puszka','górna','wodnista i kremowa','lekko gazowane','Wielka Brytania',50),(155,'APA','Żywiec','marcowe',4,119,NULL,'beczka','górna','wodnista i kremowa','lekko gazowane','Meksyk',45),(156,'Miodowe','Budweiser','stout',0,60,NULL,'plastikowa butelka','dolna','wodnista i biała','mocno gazowane','Niemcy',31),(157,'IPA','Okocim','pale ale',7.5,107,NULL,'szklana butelka','dolna','wodnista i biała','średnio gazowane','USA',47),(158,'Miodowe','Desperados','marcowe',4,83,NULL,'puszka','dolna','wodnista i biała','mocno gazowane','Meksyk',21),(159,'Summer','Perła','pale ale',0,23,NULL,'puszka','dolna','wodnista i biała','mocno gazowane','Meksyk',28),(160,'Exclusive','Coors Light','porter bałtycki',2,69,NULL,'szklana butelka','dolna','gęsta i kremowa','średnio gazowane','Brazylia',5),(161,'Strong','Budweiser','jasny lager',8,42,NULL,'puszka','dolna','wodnista i biała','średnio gazowane','Niemcy',35),(162,'Mocne','Okocim','jasny lager',3,19,NULL,'szklana butelka','dolna','wodnista i biała','lekko gazowane','Niemcy',7),(163,'Miodowe','Lech','koźlak',5.5,80,NULL,'szklana butelka','górna','wodnista i kremowa','lekko gazowane','Czechy',9),(164,'Chmielowe','Guinness','jasny lager',3.5,10,NULL,'puszka','dolna','gęsta i biała','lekko gazowane','Niemcy',16),(165,'Ale','Desperados','pale ale',0,87,NULL,'szklana butelka','dolna','gęsta i biała','średnio gazowane','Brazylia',3),(166,'Tropical','Żywiec','marcowe',5,11,8,'plastikowa butelka','górna','wodnista i biała','średnio gazowane','Czechy',1),(167,'Mocne','Coors Light','stout',7.5,8,NULL,'puszka','dolna','wodnista i kremowa','średnio gazowane','Polska',8),(168,'Chmielowe','Stella Artois','pszeniczne',11,54,NULL,'beczka','górna','gęsta i biała','średnio gazowane','Niemcy',35),(169,'Export','Skol','pilzner',0,15,NULL,'puszka','dolna','gęsta i biała','lekko gazowane','Czechy',12),(170,'Summer','Skol','koźlak',3,21,NULL,'puszka','dolna','gęsta i kremowa','mocno gazowane','Niemcy',1),(171,'Chmielowe','Desperados','pale ale',4.5,104,NULL,'plastikowa butelka','dolna','wodnista i biała','mocno gazowane','Chiny',49),(172,'Mocne','Coors Light','porter bałtycki',8.5,87,NULL,'szklana butelka','górna','wodnista i biała','średnio gazowane','Nigeria',37),(173,'APA','Żubr','india pale ale',4,87,NULL,'puszka','górna','wodnista i biała','mocno gazowane','Brazylia',40),(174,'Chmielowe','Desperados','koźlak',10,113,NULL,'szklana butelka','górna','gęsta i biała','średnio gazowane','Wielka Brytania',38),(175,'Mocne','Lech','pale ale',10,100,NULL,'plastikowa butelka','dolna','gęsta i biała','średnio gazowane','Hiszpania',44),(176,'Summer','Guinness','koźlak',7,60,NULL,'puszka','dolna','wodnista i biała','lekko gazowane','Wielka Brytania',10),(177,'IPA','Desperados','stout',3,73,NULL,'plastikowa butelka','górna','wodnista i kremowa','lekko gazowane','USA',50),(178,'Exclusive','Lech','porter bałtycki',9,102,NULL,'beczka','górna','wodnista i biała','lekko gazowane','Japonia',23),(179,'APA','Perła','koźlak',11,73,NULL,'plastikowa butelka','dolna','gęsta i biała','średnio gazowane','RPA',6),(180,'APA','Desperados','pilzner',0,112,NULL,'szklana butelka','dolna','gęsta i kremowa','średnio gazowane','RPA',34),(181,'Summer','Corona','pale ale',4,83,NULL,'beczka','dolna','wodnista i kremowa','lekko gazowane','Polska',1),(182,'Mocne','Skol','mocny lager',9,91,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','USA',8),(183,'Karmelowe','Namysłów','pale ale',8.5,98,NULL,'plastikowa butelka','dolna','gęsta i kremowa','mocno gazowane','Polska',4),(184,'Chmielowe','Żywiec','pszeniczne',7.5,90,NULL,'szklana butelka','dolna','gęsta i biała','lekko gazowane','Polska',30),(185,'Miodowe','Harnaś','porter bałtycki',3.5,36,NULL,'puszka','dolna','wodnista i kremowa','lekko gazowane','Chiny',15),(186,'Tropical','Lech','pszeniczne',11,100,NULL,'plastikowa butelka','górna','gęsta i kremowa','mocno gazowane','Meksyk',29),(187,'Export','Żubr','koźlak',4.5,23,NULL,'plastikowa butelka','górna','gęsta i kremowa','lekko gazowane','Chiny',6),(188,'Strong','Perła','jasny lager',5,66,NULL,'puszka','górna','gęsta i biała','lekko gazowane','Hiszpania',31),(189,'Ale','Corona','pale ale',6,121,NULL,'beczka','górna','gęsta i biała','lekko gazowane','USA',43),(190,'Exclusive','Okocim','jasny lager',5.5,91,NULL,'szklana butelka','dolna','gęsta i kremowa','mocno gazowane','Brazylia',32),(191,'IPA','Brahma','stout',3,41,NULL,'beczka','górna','gęsta i kremowa','mocno gazowane','RPA',18),(192,'Strong','Budweiser','pszeniczne',12,118,NULL,'beczka','dolna','wodnista i biała','mocno gazowane','USA',19),(193,'Exclusive','Desperados','mocny lager',7,80,NULL,'plastikowa butelka','dolna','wodnista i kremowa','mocno gazowane','Japonia',39),(194,'Miodowe','Stella Artois','koźlak',3.5,112,NULL,'szklana butelka','dolna','wodnista i biała','mocno gazowane','Polska',4),(195,'Export','Żywiec','ciemny lager',7.5,90,NULL,'puszka','dolna','wodnista i kremowa','lekko gazowane','Polska',38),(196,'Miodowe','Corona','pilzner',2,65,NULL,'puszka','dolna','wodnista i biała','mocno gazowane','Chiny',2),(197,'Export','Tyskie','marcowe',5.5,44,NULL,'beczka','dolna','wodnista i biała','średnio gazowane','RPA',26),(198,'Miodowe','Coors Light','pszeniczne',10,38,NULL,'beczka','dolna','wodnista i kremowa','lekko gazowane','Meksyk',2),(199,'Export','Żywiec','pszeniczne',8,89,NULL,'puszka','górna','wodnista i kremowa','lekko gazowane','Brazylia',17),(200,'Mocne','Żywiec','porter bałtycki',2,31,NULL,'szklana butelka','górna','wodnista i kremowa','mocno gazowane','Hiszpania',19);
/*!40000 ALTER TABLE `piwa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `id` int NOT NULL,
  `rola` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'unverified'),(2,'verified'),(3,'admin');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sklad`
--

DROP TABLE IF EXISTS `sklad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sklad` (
  `id_skladu` int NOT NULL AUTO_INCREMENT,
  `woda` varchar(20) NOT NULL,
  `slod` varchar(20) NOT NULL,
  `dodatki` varchar(300) NOT NULL,
  PRIMARY KEY (`id_skladu`),
  UNIQUE KEY `nazwa_piwa_UNIQUE` (`id_skladu`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sklad`
--

LOCK TABLES `sklad` WRITE;
/*!40000 ALTER TABLE `sklad` DISABLE KEYS */;
INSERT INTO `sklad` VALUES (1,'miekka','zytni','kawa,kokos'),(2,'miekka','jeczmienny','karmel,kwiat lotosu,smoczy owoc'),(3,'twarda','zytni','czekolada'),(4,'miekka','jeczmienny','brzoskwinia,limonka,miod wielokwiatowy'),(5,'miekka','palony','grejpfrut,trawa cytrynowa'),(6,'twarda','wedzony',''),(7,'twarda','karmelowy','jagoda,jasmin,karmel'),(8,'miekka','zytni',''),(9,'twarda','palony','karmel,truskawka'),(10,'miekka','pszeniczny',''),(11,'miekka','pszeniczny','chili'),(12,'miekka','pszeniczny','winogrono'),(13,'twarda','jeczmienny',''),(14,'miekka','karmelowy',''),(15,'miekka','wedzony',''),(16,'twarda','wedzony',''),(17,'twarda','karmelowy','persymona'),(18,'miekka','zytni','ananas,malina'),(19,'miekka','wedzony',''),(20,'twarda','jeczmienny','aloes'),(21,'twarda','pszeniczny','ciastko,trawa cytrynowa'),(22,'miekka','jeczmienny',''),(23,'twarda','pszeniczny','trawa cytrynowa,truskawka'),(24,'miekka','zytni',''),(25,'twarda','wedzony','ciastko,smoczy owoc'),(26,'miekka','karmelowy','gruszka,smoczy owoc,wanilia'),(27,'miekka','jeczmienny',''),(28,'miekka','karmelowy','kawa,miod wielokwiatowy,winogrono'),(29,'twarda','pszeniczny','malina'),(30,'twarda','palony','kwiat lotosu'),(31,'miekka','wedzony','kwiat lotosu,rum,trawa cytrynowa'),(32,'miekka','wedzony','borowka amerykanska'),(33,'miekka','wedzony','cytryna,gruszka,rum'),(34,'miekka','karmelowy','jasmin,kawa,rum'),(35,'miekka','palony',''),(36,'miekka','karmelowy',''),(37,'twarda','zytni','cytryna,czekolada'),(38,'twarda','wedzony',''),(39,'twarda','zytni','aloes,trawa cytrynowa'),(40,'twarda','karmelowy','chili,kwiat lotosu'),(41,'miekka','karmelowy','gruszka'),(42,'miekka','zytni',''),(43,'miekka','jeczmienny',''),(44,'twarda','jeczmienny','brzoskwinia,kokos,rum'),(45,'miekka','zytni','kokos'),(46,'twarda','jeczmienny','kawa,persymona,truskawka'),(47,'miekka','wedzony','gruszka'),(48,'miekka','jeczmienny','grejpfrut,gruszka,malina'),(49,'twarda','palony','cytryna'),(50,'twarda','karmelowy',''),(51,'twarda','karmelowy','ciastko,kokos,trawa cytrynowa'),(52,'miekka','palony',''),(53,'miekka','karmelowy','kokos,smoczy owoc,wanilia'),(54,'twarda','karmelowy',''),(55,'twarda','palony','aloes,borowka amerykanska'),(56,'miekka','karmelowy','gruszka'),(57,'miekka','zytni','limonka,miod wielokwiatowy'),(58,'twarda','zytni','aloes,kokos'),(59,'twarda','zytni','malina'),(60,'miekka','wedzony','ciastko,poziomka'),(61,'miekka','pszeniczny','cytryna,kawa'),(62,'miekka','jeczmienny',''),(63,'twarda','jeczmienny','miod wielokwiatowy'),(64,'twarda','karmelowy','brzoskwinia,czekolada,rum'),(65,'twarda','karmelowy','brzoskwinia,kwiat lotosu,limonka'),(66,'twarda','jeczmienny','aloes,wanilia'),(67,'miekka','pszeniczny','cytryna,truskawka,wanilia');
/*!40000 ALTER TABLE `sklad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `status_opinii`
--

DROP TABLE IF EXISTS `status_opinii`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `status_opinii` (
  `id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(45) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `status_opinii`
--

LOCK TABLES `status_opinii` WRITE;
/*!40000 ALTER TABLE `status_opinii` DISABLE KEYS */;
INSERT INTO `status_opinii` VALUES (1,'w kolejce'),(2,'zaakceptowana'),(3,'odrzucona'),(4,'modyfikowana');
/*!40000 ALTER TABLE `status_opinii` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `top10_ocena`
--

DROP TABLE IF EXISTS `top10_ocena`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `top10_ocena` (
  `id` int NOT NULL AUTO_INCREMENT,
  `ID_piwa` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_id_piwa_idx` (`ID_piwa`),
  CONSTRAINT `fk_id_piwa` FOREIGN KEY (`ID_piwa`) REFERENCES `piwa` (`ID_piwa`)
) ENGINE=InnoDB AUTO_INCREMENT=256 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `top10_ocena`
--

LOCK TABLES `top10_ocena` WRITE;
/*!40000 ALTER TABLE `top10_ocena` DISABLE KEYS */;
INSERT INTO `top10_ocena` VALUES (243,1),(246,2),(247,3),(248,54),(245,56),(242,78),(250,99),(249,144),(244,150),(241,166);
/*!40000 ALTER TABLE `top10_ocena` ENABLE KEYS */;
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
  `id_roli` int NOT NULL,
  `licznik` int DEFAULT '0',
  PRIMARY KEY (`nazwa_uzytkownika`),
  UNIQUE KEY `email_UNIQUE` (`email`),
  UNIQUE KEY `nazwa_uzytkownika_UNIQUE` (`nazwa_uzytkownika`),
  KEY `fk_id_roli_idx` (`id_roli`),
  CONSTRAINT `fk_id_roli` FOREIGN KEY (`id_roli`) REFERENCES `role` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uzytkownicy`
--

LOCK TABLES `uzytkownicy` WRITE;
/*!40000 ALTER TABLE `uzytkownicy` DISABLE KEYS */;
INSERT INTO `uzytkownicy` VALUES ('admin',30,'admin','admin@mail.com',3,0),('adrian',22,'adrian','adrian@mail.com',1,2),('maciek',21,'maciek','maciek',1,3),('mateuszN',21,'maslo','mati@o2.pl',1,9),('test',21,'test','test',1,2);
/*!40000 ALTER TABLE `uzytkownicy` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`%`*/ /*!50003 TRIGGER `uzytkownicy_BEFORE_UPDATE` BEFORE UPDATE ON `uzytkownicy` FOR EACH ROW BEGIN
IF NEW.licznik >= 10 THEN
	SET NEW.id_roli = 2;    
END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `zaakceptowane`
--

DROP TABLE IF EXISTS `zaakceptowane`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `zaakceptowane` (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_opinii` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `fk_id_opinii_idx` (`id_opinii`),
  CONSTRAINT `fk_id_opinii` FOREIGN KEY (`id_opinii`) REFERENCES `opinie` (`ID_opinii`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `zaakceptowane`
--

LOCK TABLES `zaakceptowane` WRITE;
/*!40000 ALTER TABLE `zaakceptowane` DISABLE KEYS */;
INSERT INTO `zaakceptowane` VALUES (2,1),(4,2),(6,3),(8,6),(12,8),(15,9),(14,10),(13,11),(3,14),(5,15),(7,16),(11,21),(10,24),(16,26),(18,27),(9,28),(17,29);
/*!40000 ALTER TABLE `zaakceptowane` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'projektDB'
--

--
-- Dumping routines for database 'projektDB'
--
SET @@SESSION.SQL_LOG_BIN = @MYSQLDUMP_TEMP_LOG_BIN;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-01-31  9:18:06
