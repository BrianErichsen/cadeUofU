-- MariaDB dump 10.19  Distrib 10.5.22-MariaDB, for Linux (x86_64)
--
-- Host: cs-db.eng.utah.edu    Database: Library
-- ------------------------------------------------------
-- Server version	10.11.8-MariaDB-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `CheckedOut`
--

DROP TABLE IF EXISTS `CheckedOut`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `CheckedOut` (
  `CardNum` int(10) unsigned NOT NULL,
  `Serial` int(10) unsigned NOT NULL,
  PRIMARY KEY (`Serial`),
  KEY `CardNum` (`CardNum`),
  CONSTRAINT `CheckedOut_ibfk_1` FOREIGN KEY (`CardNum`) REFERENCES `Patrons` (`CardNum`),
  CONSTRAINT `CheckedOut_ibfk_2` FOREIGN KEY (`Serial`) REFERENCES `Inventory` (`Serial`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `CheckedOut`
--

LOCK TABLES `CheckedOut` WRITE;
/*!40000 ALTER TABLE `CheckedOut` DISABLE KEYS */;
INSERT INTO `CheckedOut` VALUES (1,1001),(1,1004),(4,1005),(4,1006);
/*!40000 ALTER TABLE `CheckedOut` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Inventory`
--

DROP TABLE IF EXISTS `Inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Inventory` (
  `Serial` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ISBN` char(14) NOT NULL,
  PRIMARY KEY (`Serial`),
  KEY `ISBN` (`ISBN`),
  CONSTRAINT `Inventory_ibfk_1` FOREIGN KEY (`ISBN`) REFERENCES `Titles` (`ISBN`)
) ENGINE=InnoDB AUTO_INCREMENT=1011 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Inventory`
--

LOCK TABLES `Inventory` WRITE;
/*!40000 ALTER TABLE `Inventory` DISABLE KEYS */;
INSERT INTO `Inventory` VALUES (1006,'978-0062278791'),(1010,'978-0261102309'),(1004,'978-0394823379'),(1005,'978-0394823379'),(1001,'978-0547928227'),(1002,'978-0547928227'),(1008,'978-0553283686'),(1009,'978-0553283689'),(1003,'978-0679732242');
/*!40000 ALTER TABLE `Inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Patrons`
--

DROP TABLE IF EXISTS `Patrons`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Patrons` (
  `CardNum` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(100) NOT NULL,
  PRIMARY KEY (`CardNum`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Patrons`
--

LOCK TABLES `Patrons` WRITE;
/*!40000 ALTER TABLE `Patrons` DISABLE KEYS */;
INSERT INTO `Patrons` VALUES (1,'Joe'),(2,'Ann'),(3,'Ben'),(4,'Dan');
/*!40000 ALTER TABLE `Patrons` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Phones`
--

DROP TABLE IF EXISTS `Phones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Phones` (
  `CardNum` int(10) unsigned NOT NULL,
  `Phone` char(8) NOT NULL,
  PRIMARY KEY (`CardNum`,`Phone`),
  CONSTRAINT `Phones_ibfk_1` FOREIGN KEY (`CardNum`) REFERENCES `Patrons` (`CardNum`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Phones`
--

LOCK TABLES `Phones` WRITE;
/*!40000 ALTER TABLE `Phones` DISABLE KEYS */;
INSERT INTO `Phones` VALUES (1,'555-5555'),(2,'555-5555'),(2,'666-6666'),(3,'111-1111'),(4,'888-8888'),(4,'999-9999');
/*!40000 ALTER TABLE `Phones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Titles`
--

DROP TABLE IF EXISTS `Titles`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Titles` (
  `ISBN` char(14) NOT NULL,
  `Title` varchar(100) NOT NULL,
  `Author` varchar(100) NOT NULL,
  PRIMARY KEY (`ISBN`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Titles`
--

LOCK TABLES `Titles` WRITE;
/*!40000 ALTER TABLE `Titles` DISABLE KEYS */;
INSERT INTO `Titles` VALUES ('978-0062278791','Profiles in Courage','Kennedy'),('978-0261102309','The Lord of the Rings','Tolkien'),('978-0394823379','The Lorax','Seuss'),('978-0441172719','Dune','Herbert'),('978-0547928227','The Hobbit','Tolkien'),('978-0553283686','Hyperion','Simmons'),('978-0553283689','Endymion','Simmons'),('978-0679732242','The Sound and the Fury','Faulkner');
/*!40000 ALTER TABLE `Titles` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-07-09 16:07:22
[?1049h[22;0;0t[1;24r(B[m[4l[?7h[39;49m[?1h=[?1h=[?1h=[?25l[39;49m(B[m[H[2J(B[0;7m  GNU nano 2.9.8                      New Buffer                                [1;79H(B[m[22;16H(B[0;7m[ Welcome to nano.  For basic help, type Ctrl+G. ](B[m[23d(B[0;7m^G(B[m Get Help  (B[0;7m^O(B[m Write Out (B[0;7m^W(B[m Where Is  (B[0;7m^K(B[m Cut Text  (B[0;7m^J(B[m Justify   (B[0;7m^C(B[m Cur Pos[24d(B[0;7m^X(B[m Exit[14G(B[0;7m^R(B[m Read File (B[0;7m^\(B[m Replace   (B[0;7m^U(B[m Uncut Text(B[0;7m^T(B[m To Spell  (B[0;7m^_(B[m Go To Line[22d[3d[39;49m(B[m[?12l[?25h[?25l[1;71H(B[0;7mModified(B[m[4d[?12l[?25h[?25l[A[?12l[?25h[?25ls[?12l[?25h[?25ld[?12l[?25h[?25lf[?12l[?25h[?25l [?12l[?25h[?25la[?12l[?25h[?25l [?12l[?25h[?25l[22;18H(B[0;7mline 1/2 (50%), col 3/3 (100%), char 2/3 (66%)	](B[m[3;3H[?12l[?25h[24;1H[?1049l[23;0;0t[?1l>[?1049h[22;0;0t[1;12r[?12l[?25h[39;49m]104(B[m[4l[?7h[H[2J(B[0;7m  GNU nano 2.9.8                      New Buffer                      Modified  [3;1H(B[msd[?1h=[?1h=[?1h=[H[2J(B[0;7m  GNU nano 2.9.8                      New Buffer                      Modified  [3;1H(B[msd[11d[1;79H[11d(B[0;7m^G(B[m Get Help  (B[0;7m^O(B[m Write Out (B[0;7m^W(B[m Where Is  (B[0;7m^K(B[m Cut Text  (B[0;7m^J(B[m Justify   (B[0;7m^C(B[m Cur Pos[12d(B[0;7m^X(B[m Exit[14G(B[0;7m^R(B[m Read File (B[0;7m^\(B[m Replace   (B[0;7m^U(B[m Uncut Text(B[0;7m^T(B[m To Spell  (B[0;7m^_(B[m Go To Line[10d[?25l[3dsd[?12l[?25h[?25l[?12l[?25h[?25l[?12l[?25h[?25la[?12l[?25h[?25ls[?12l[?25h[?25ld[?12l[?25h[?25la[?12l[?25h[?25ls[?12l[?25h[?25ld[?12l[?25h[?25l [?12l[?25h[12;1H[?1049l[23;0;0t[?1l>