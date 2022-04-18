-- MySQL dump 10.13  Distrib 8.0.28, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: premier_league
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
-- Table structure for table `club`
--

DROP TABLE IF EXISTS `club`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `club` (
  `club_name` varchar(255) NOT NULL,
  `website` varchar(255) DEFAULT NULL,
  `stadium_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`club_name`),
  KEY `stadium_name_idx` (`stadium_name`),
  CONSTRAINT `stadium_name` FOREIGN KEY (`stadium_name`) REFERENCES `stadium` (`stadium_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `club`
--

LOCK TABLES `club` WRITE;
/*!40000 ALTER TABLE `club` DISABLE KEYS */;
INSERT INTO `club` VALUES ('\"\"\"AFC Bournemouth\"\"\"','http://www.afcb.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Vitality Stadium\"\"\"\r'),('\"\"\"Arsenal\"\"\"','https://www.arsenal.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Emirates Stadium\"\"\"\r'),('\"\"\"Aston Villa\"\"\"','https://www.avfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Villa Park\"\"\"\r'),('\"\"\"Barnsley\"\"\"','NULL','\"\"\"Oakwell\"\"\"\r'),('\"\"\"Birmingham City\"\"\"','NULL','\"\"\"St. Andrew\'s Trillion Trophy Stadium\"\"\"\r'),('\"\"\"Blackburn Rovers\"\"\"','NULL','\"\"\"Ewood Park\"\"\"\r'),('\"\"\"Blackpool\"\"\"','NULL','\"\"\"Bloomfield Road\"\"\"\r'),('\"\"\"Bolton Wanderers\"\"\"','NULL','\"\"\"University of Bolton Stadium\"\"\"\r'),('\"\"\"Bradford City\"\"\"','NULL','\"\"\"Valley Parade\"\"\"\r'),('\"\"\"Brentford\"\"\"','https://www.brentfordfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Brentford Community Stadium\"\"\"\r'),('\"\"\"Brighton and Hove Albion\"\"\"','https://www.brightonandhovealbion.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Amex Stadium\"\"\"\r'),('\"\"\"Burnley\"\"\"','http://www.burnleyfootballclub.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Turf Moor\"\"\"\r'),('\"\"\"Cardiff City\"\"\"','http://www.cardiffcityfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Cardiff City Stadium\"\"\"\r'),('\"\"\"Charlton Athletic\"\"\"','NULL','\"\"\"The Valley\"\"\"\r'),('\"\"\"Chelsea\"\"\"','https://www.chelseafc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Stamford Bridge\"\"\"\r'),('\"\"\"Coventry City\"\"\"','NULL','\"\"\"Highfield Road\"\"\"\r'),('\"\"\"Crystal Palace\"\"\"','http://www.cpfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Selhurst Park\"\"\"\r'),('\"\"\"Derby County\"\"\"','NULL','\"\"\"Pride Park Stadium\"\"\"\r'),('\"\"\"Everton\"\"\"','http://www.evertonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Goodison Park\"\"\"\r'),('\"\"\"Fulham\"\"\"','http://www.fulhamfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Craven Cottage\"\"\"\r'),('\"\"\"Huddersfield Town\"\"\"','https://www.htafc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"John Smith\'s Stadium\"\"\"\r'),('\"\"\"Hull City\"\"\"','http://www.hullcitytigers.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"KCOM Stadium\"\"\"\r'),('\"\"\"Ipswich Town\"\"\"','NULL','\"\"\"Portman Road\"\"\"\r'),('\"\"\"Leeds United\"\"\"','http://www.leedsunited.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Elland Road\"\"\"\r'),('\"\"\"Leicester City\"\"\"','http://www.lcfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"King Power Stadium\"\"\"\r'),('\"\"\"Liverpool\"\"\"','http://www.liverpoolfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Anfield\"\"\"\r'),('\"\"\"Manchester City\"\"\"','http://www.mancity.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Etihad Stadium\"\"\"\r'),('\"\"\"Manchester United\"\"\"','http://www.manutd.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Old Trafford\"\"\"\r'),('\"\"\"Middlesbrough\"\"\"','http://www.mfc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Riverside Stadium\"\"\"\r'),('\"\"\"Newcastle United\"\"\"','http://www.nufc.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"St. James\' Park\"\"\"\r'),('\"\"\"Norwich City\"\"\"','http://www.canaries.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Carrow Road\"\"\"\r'),('\"\"\"Nottingham Forest\"\"\"','NULL','\"\"\"City Ground\"\"\"\r'),('\"\"\"Oldham Athletic\"\"\"','NULL','\"\"\"Boundary Park\"\"\"\r'),('\"\"\"Portsmouth\"\"\"','NULL','\"\"\"Fratton Park\"\"\"\r'),('\"\"\"Queens Park Rangers\"\"\"','NULL','\"\"\"Loftus Road\"\"\"\r'),('\"\"\"Reading\"\"\"','NULL','\"\"\"Madejski Stadium\"\"\"\r'),('\"\"\"Sheffield United\"\"\"','http://www.sufc.co.uk/?utm_source=www.premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Bramall Lane\"\"\"\r'),('\"\"\"Sheffield Wednesday\"\"\"','NULL','\"\"\"Hillsborough\"\"\"\r'),('\"\"\"Southampton\"\"\"','https://www.southamptonfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"St. Mary\'s Stadium\"\"\"\r'),('\"\"\"Stoke City\"\"\"','http://www.stokecityfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"bet365 Stadium\"\"\"\r'),('\"\"\"Sunderland\"\"\"','http://www.safc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Stadium of Light\"\"\"\r'),('\"\"\"Swansea City\"\"\"','http://www.swanseacity.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Liberty Stadium\"\"\"\r'),('\"\"\"Swindon Town\"\"\"','NULL','\"\"\"County Ground\"\"\"\r'),('\"\"\"Tottenham Hotspur\"\"\"','http://www.tottenhamhotspur.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Tottenham Hotspur Stadium\"\"\"\r'),('\"\"\"Watford\"\"\"','https://www.watfordfc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Vicarage Road\"\"\"\r'),('\"\"\"West Bromwich Albion\"\"\"','http://www.wba.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"The Hawthorns\"\"\"\r'),('\"\"\"West Ham United\"\"\"','http://www.whufc.com/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"London Stadium\"\"\"\r'),('\"\"\"Wigan Athletic\"\"\"','NULL','\"\"\"DW Stadium\"\"\"\r'),('\"\"\"Wimbledon\"\"\"','NULL','\"\"\"Selhurst Park\"\"\"\r'),('\"\"\"Wolverhampton Wanderers\"\"\"','http://www.wolves.co.uk/?utm_source=premier-league-website&utm_campaign=website&utm_medium=link','\"\"\"Molineux Stadium\"\"\"\r'),('﻿club_name','website','stadium_name\r');
/*!40000 ALTER TABLE `club` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-10 23:58:08
