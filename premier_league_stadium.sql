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
-- Table structure for table `stadium`
--

DROP TABLE IF EXISTS `stadium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `stadium` (
  `stadium_name` varchar(100) NOT NULL,
  `address` varchar(100) DEFAULT NULL,
  `capacity` varchar(100) DEFAULT NULL,
  `record_league_attendance` varchar(100) DEFAULT NULL,
  `building_date` varchar(100) DEFAULT NULL,
  `pitch_size` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`stadium_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `stadium`
--

LOCK TABLES `stadium` WRITE;
/*!40000 ALTER TABLE `stadium` DISABLE KEYS */;
INSERT INTO `stadium` VALUES ('\"\"\"Amex Stadium\"\"\"','\"\"\"American Express Community Stadium Village Way Brighton BN1 9BL\"\"\"','30666','30565','2011','105m x 68m\r'),('\"\"\"Anfield\"\"\"','\"\"\"Anfield Anfield Road Liverpool L4 0TH\"\"\"','53394','53292','1884','101m x 68m\r'),('\"\"\"bet365 Stadium\"\"\"','\"\"\"bet365 Stadium Stanley Matthews Way Stoke-on-Trent ST4 4EG\"\"\"','NULL','29661','1997','105m x 68m\r'),('\"\"\"Bloomfield Road\"\"\"','\"\"\"Seasiders Way Blackpool FY1 6JJ\"\"\"','17338','NULL','1899','102m x 68m\r'),('\"\"\"Boundary Park\"\"\"','\"\"\"Furtherwood Rd Oldham Greater Manchester OL1 2PAA\"\"\"','13512','NULL','1904','101m x 68m \r'),('\"\"\"Bramall Lane\"\"\"','\"\"\"Bramall Lane Sheffield South Yorkshire S2 4SU\"\"\"','32050','NULL','1855','102m x 66m\r'),('\"\"\"Brentford Community Stadium\"\"\"','\"\"\"Brentford Community Stadium Lionel Road South Brentford TW8 0RU\"\"\"','17250','NULL','2020','105m x 68m\r'),('\"\"\"Cardiff City Stadium\"\"\"','\"\"\"Cardiff City Stadium Leckwith Road Cardiff CF11 8AZ\"\"\"','NULL','32321','2009','105m x 68m\r'),('\"\"\"Carrow Road\"\"\"','\"\"\"Carrow Road Norwich NR1 1JE\"\"\"','27359','NULL','1935','104m x 68m\r'),('\"\"\"City Ground\"\"\"','\"\"\"City Ground Nottingham NG2 5FJ\"\"\"','30445','NULL','1898','105m x 71m\r'),('\"\"\"County Ground\"\"\"','\"\"\"NULL\"\"\"','NULL','NULL','NULL','NULL\r'),('\"\"\"Craven Cottage\"\"\"','\"\"\"Stevenage Road London SW6 6HH\"\"\"','19000','NULL','1896','100m x 65m\r'),('\"\"\"DW Stadium\"\"\"','\"\"\"Loire Drive Robin Park Wigan Greater Manchester WN5 0UH\"\"\"','25133','NULL','1999','105m x 68m\r'),('\"\"\"Elland Road\"\"\"','\"\"\"Elland Road Leeds LS11 0ES\"\"\"','37890','NULL','NULL','106m x 69m\r'),('\"\"\"Emirates Stadium\"\"\"','\"\"\"Highbury House 75 Drayton Park London N5 1BU\"\"\"','60260','60161','2006','105m x 68m\r'),('\"\"\"Etihad Stadium\"\"\"','\"\"\"Etihad Stadium Etihad Campus Manchester M11 3FF\"\"\"','55017','54693','2002','105m x 68m\r'),('\"\"\"Ewood Park\"\"\"','\"\"\"Ewood Park Blackburn Lancashire BB2 4JF\"\"\"','31367','NULL','1882','105m x 68m\r'),('\"\"\"Fratton Park\"\"\"','\"\"\"Fratton Park Frogmore Road Portsmouth PO4 8RA\"\"\"','21178','NULL','1898','105m x 67m\r'),('\"\"\"Goodison Park\"\"\"','\"\"\"Goodison Park Goodison Road Liverpool L4 4EL\"\"\"','39221','40552','1892','100.48m x 68m\r'),('\"\"\"Highfield Road\"\"\"','\"\"\"Phoenix Way Foleshill Coventry West Midlands CV6 6GE\"\"\"','32609','NULL','2005','105m x 68m\r'),('\"\"\"Hillsborough\"\"\"','\"\"\"Leppings Ln Sheffield South Yorkshire S6 1SW\"\"\"','39732','NULL','1899','105m x 68m\r'),('\"\"\"John Smith\'s Stadium\"\"\"','\"\"\"The John Smith\'s Stadium Stadium Way Huddersfield HD1 6PX\"\"\"','NULL','24426','1994','106m x 68m\r'),('\"\"\"KCOM Stadium\"\"\"','\"\"\"The KCOM Stadium West Park Hull HU3 6HU\"\"\"','NULL','NULL','2002','105m x 68m\r'),('\"\"\"King Power Stadium\"\"\"','\"\"\"King Power Stadium Filbert Way Leicester LE2 7FL\"\"\"','32273','32242','2002','105m x 68m\r'),('\"\"\"Liberty Stadium\"\"\"','\"\"\"Liberty Stadium Landore Swansea SA1 2FA\"\"\"','NULL','20972','2005','105m x 68m\r'),('\"\"\"Loftus Road\"\"\"','\"\"\"Loftus Road Stadium South Africa Road London W12 7PJ\"\"\"','18439','NULL','1904','102m x 66m\r'),('\"\"\"London Stadium\"\"\"','\"\"\"London Stadium Queen Elizabeth Olympic Park London E20 2ST\"\"\"','60000','59946','2011','105m x 68m\r'),('\"\"\"Madejski Stadium\"\"\"','\"\"\"Bennett Road Reading RG2 0FL\"\"\"','24161','NULL','1998','102m x 70m\r'),('\"\"\"Molineux Stadium\"\"\"','\"\"\"Molineux Stadium Waterloo Rd Wolverhampton WV1 4QR\"\"\"','32050','31322','1889','105m x 68m\r'),('\"\"\"Oakwell\"\"\"','\"\"\"Oakwell Grove Street Barnsley S71 1ET\"\"\"','23009','NULL','1887','100m x 68m\r'),('\"\"\"Old Trafford\"\"\"','\"\"\"Sir Matt Busby Way Old Trafford Manchester M16 0RA\"\"\"','74879','76098','1909','105m x 68m\r'),('\"\"\"Portman Road\"\"\"','\"\"\"Portman Road Ipswich Suffolk IP1 2DA\"\"\"','30311','NULL','1884','102m x 64m\r'),('\"\"\"Pride Park Stadium\"\"\"','\"\"\"Pride Park Stadium Pride Park Derby DE24 8XL\"\"\"','33597','NULL','1997','105m x 68m\r'),('\"\"\"Riverside Stadium\"\"\"','\"\"\"Riverside Stadium Middlesbrough TS3 6RS\"\"\"','33746','NULL','1995','105m x 68m\r'),('\"\"\"Selhurst Park\"\"\"','\"\"\"Selhurst Park Stadium Holmesdale Road London SE25 6PU\"\"\"','25486','30115','1924','101m x 68m\r'),('\"\"\"St. Andrew\'s Trillion Trophy Stadium\"\"\"','\"\"\"St. Andrew\'s Stadium Birmingham B9 4RL\"\"\"','29409','NULL','1906','105m x 68m\r'),('\"\"\"St. James\' Park\"\"\"','\"\"\"St. James\' Park Strawberry Place Newcastle Upon Tyne NE1 4ST\"\"\"','52305','52490','1892','105m x 68m\r'),('\"\"\"St. Mary\'s Stadium\"\"\"','\"\"\"St Mary\'s Stadium Britannia Road Southampton SO14 5FP\"\"\"','32384','32151','2001','105m x 68m\r'),('\"\"\"Stadium of Light\"\"\"','\"\"\"Stadium of Light Sunderland SR5 1SU\"\"\"','NULL','NULL','1997','105m x 68m\r'),('\"\"\"Stamford Bridge\"\"\"','\"\"\"Stamford Bridge Fulham Road London SW6 1HS\"\"\"','40853','42332','1877','103m x 67.5m\r'),('\"\"\"The Hawthorns\"\"\"','\"\"\"The Hawthorns West Bromwich West Midlands B71 4LF\"\"\"','NULL','27751','1900','\r'),('\"\"\"The Valley\"\"\"','\"\"\"Floyd Road Charlton SE7 8BL\"\"\"','27111','NULL','1919','102m x 67m\r'),('\"\"\"Tottenham Hotspur Stadium\"\"\"','\"\"\"Lilywhite House 782 High Road Tottenham London N17 0BX\"\"\"','NULL','NULL','2019','100m x 67m\r'),('\"\"\"Turf Moor\"\"\"','\"\"\"Turf Moor Harry Potts Way Burnley Lancashire BB10 4BX\"\"\"','21944','21870','1883','105m x 68m\r'),('\"\"\"University of Bolton Stadium\"\"\"','\"\"\"Burnden Way Horwich Bolton BL6 6JW\"\"\"','28723','NULL','1997','105m x 68m\r'),('\"\"\"Valley Parade\"\"\"','\"\"\"Bradford West Yorkshire BD8 7DY\"\"\"','25136','NULL','18861','03m x 64m\r'),('\"\"\"Vicarage Road\"\"\"','\"\"\"Vicarage Road Stadium Watford Hertfordshire WD18 0ER\"\"\"','21000','21590','1922','\r'),('\"\"\"Villa Park\"\"\"','\"\"\"Villa Park Trinity Road Birmingham B6 6HE\"\"\"','42682','NULL','1897','105m x 68m\r'),('\"\"\"Vitality Stadium\"\"\"','\"\"\"Vitality Stadium Dean Court Bournemouth BH7 7AF\"\"\"','NULL','11459','1910','105m x 68m\r'),('stadium_name','address','capacity','record_league_attendance','building_date','pitch_size\r');
/*!40000 ALTER TABLE `stadium` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-04-10 23:58:07
