-- MariaDB dump 10.18  Distrib 10.5.8-MariaDB, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: SQL2NORMALSTRINGS
-- ------------------------------------------------------
-- Server version	10.5.8-MariaDB-1:10.5.8+maria~focal

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
-- Current Database: `SQL2NORMALSTRINGS`
--

CREATE DATABASE /*!32312 IF NOT EXISTS*/ `SQL2NORMALSTRINGS` /*!40100 DEFAULT CHARACTER SET utf8mb4 */;

USE `SQL2NORMALSTRINGS`;

--
-- Table structure for table `DEPARTMENTS`
--

DROP TABLE IF EXISTS `DEPARTMENTS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `DEPARTMENTS` (
  `num` int(11) NOT NULL,
  `name` varchar(30) NOT NULL,
  `town_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `town_code` (`town_code`),
  CONSTRAINT `DEPARTMENTS_ibfk_1` FOREIGN KEY (`town_code`) REFERENCES `TOWNS` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `DEPARTMENTS`
--

LOCK TABLES `DEPARTMENTS` WRITE;
/*!40000 ALTER TABLE `DEPARTMENTS` DISABLE KEYS */;
INSERT INTO `DEPARTMENTS` VALUES (10,'ACCOUNTING','SVQ'),(20,'RESEARCH','MAD'),(30,'SALES','BCN'),(40,'PRODUCTION','BIO'),(50,'I+D','PMLL');
/*!40000 ALTER TABLE `DEPARTMENTS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `EMPLOYEES`
--

DROP TABLE IF EXISTS `EMPLOYEES`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `EMPLOYEES` (
  `num` int(11) NOT NULL,
  `name` varchar(50) NOT NULL,
  `manager` int(11) DEFAULT NULL,
  `begin_date` date DEFAULT NULL,
  `salary` int(11) DEFAULT NULL,
  `commission` int(11) DEFAULT NULL,
  `dept_num` int(11) DEFAULT NULL,
  `occu_code` varchar(3) DEFAULT NULL,
  PRIMARY KEY (`num`),
  KEY `dept_num` (`dept_num`),
  KEY `manager` (`manager`),
  KEY `occu_code` (`occu_code`),
  CONSTRAINT `EMPLOYEES_ibfk_1` FOREIGN KEY (`dept_num`) REFERENCES `DEPARTMENTS` (`num`),
  CONSTRAINT `EMPLOYEES_ibfk_2` FOREIGN KEY (`manager`) REFERENCES `EMPLOYEES` (`num`),
  CONSTRAINT `EMPLOYEES_ibfk_3` FOREIGN KEY (`occu_code`) REFERENCES `OCCUPATIONS` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `EMPLOYEES`
--

LOCK TABLES `EMPLOYEES` WRITE;
/*!40000 ALTER TABLE `EMPLOYEES` DISABLE KEYS */;
INSERT INTO `EMPLOYEES` VALUES (1000,'PITT   ','BRAD',NULL,'2004-01-01',1040,NULL,20,NULL),(7369,'SANCHEZ','SERGIO',8001,'2010-12-17',1040,NULL,20,'EMP'),(7499,'ARROYO','MARTA',7698,'2010-02-20',1500,390,30,'SAL'),(7521,'SALA','REBECA',7782,'2011-02-22',1625,650,30,'SAL'),(7566,'JIMENEZ','JUAN',1000,'2017-04-02',2900,NULL,20,'MAN'),(7654,'MARTIN','   MONICA',7698,'2017-09-29',1600,1020,30,'SAL'),(7698,'GOMIS','BARTOLOME',1000,'2017-05-01',3005,NULL,30,'MAN'),(7782,'CEREZO','    MARIA',1000,'2010-06-09',2885,NULL,10,'MAN'),(7788,'GILBERTO','JESUS',8000,'2010-11-09',3000,NULL,20,NULL),(7844,'TOVAR','LUIS',7698,'2018-09-08',1350,0,30,'SAL'),(7876,'ALONSO   ','     FERNANDO',7788,'2018-09-23',1430,NULL,20,'EMP'),(7900,'JIMENO','XAVIER',8001,'2017-12-03',1335,NULL,30,'EMP'),(7902,'FERNANDEZ   ','ANA',8000,'2016-12-03',3000,NULL,20,NULL),(7934,'MUNOZ','ANTONIA',8001,'2016-01-23',1690,NULL,10,'EMP'),(8000,'BANDERAS','ANTONIO',1000,'2017-01-09',2885,NULL,20,'MAN'),(8001,'RUIZ','FERNANDA',1000,'2018-06-10',2885,NULL,20,'MAN');
/*!40000 ALTER TABLE `EMPLOYEES` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `OCCUPATIONS`
--

DROP TABLE IF EXISTS `OCCUPATIONS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `OCCUPATIONS` (
  `code` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `OCCUPATIONS`
--

LOCK TABLES `OCCUPATIONS` WRITE;
/*!40000 ALTER TABLE `OCCUPATIONS` DISABLE KEYS */;
INSERT INTO `OCCUPATIONS` VALUES ('ANA','ANALYST'),('EMP','EMPLOYEE'),('MAN','MANAGER'),('PRE','PRESIDENT'),('SAL','SALESMAN');
/*!40000 ALTER TABLE `OCCUPATIONS` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `TOWNS`
--

DROP TABLE IF EXISTS `TOWNS`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `TOWNS` (
  `code` varchar(3) NOT NULL,
  `name` varchar(30) NOT NULL,
  PRIMARY KEY (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `TOWNS`
--

LOCK TABLES `TOWNS` WRITE;
/*!40000 ALTER TABLE `TOWNS` DISABLE KEYS */;
INSERT INTO `TOWNS` VALUES ('BCN','BARCELONA'),('BIO','BILBAO'),('MAD','MADRID'),('SVQ','SEVILLA');
/*!40000 ALTER TABLE `TOWNS` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-04-27 21:28:48
