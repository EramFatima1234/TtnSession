-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: eram
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `Customers`
--

DROP TABLE IF EXISTS `Customers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Customers` (
  `cnum` int(11) NOT NULL,
  `cname` char(10) NOT NULL,
  `city` char(10) DEFAULT NULL,
  `rating` int(11) DEFAULT NULL,
  PRIMARY KEY (`cnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Customers`
--

LOCK TABLES `Customers` WRITE;
/*!40000 ALTER TABLE `Customers` DISABLE KEYS */;
INSERT INTO `Customers` VALUES (1,'Sahil','kashmir',1),(2,'Sadaf','delhi',2),(3,'Eram','delhi',4),(4,'Sakura','Japan',1);
/*!40000 ALTER TABLE `Customers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Salespeople`
--

DROP TABLE IF EXISTS `Salespeople`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Salespeople` (
  `snum` int(11) NOT NULL,
  `sname` char(10) NOT NULL,
  `city` char(10) DEFAULT NULL,
  `comm` float(10,2) DEFAULT NULL,
  PRIMARY KEY (`snum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Salespeople`
--

LOCK TABLES `Salespeople` WRITE;
/*!40000 ALTER TABLE `Salespeople` DISABLE KEYS */;
INSERT INTO `Salespeople` VALUES (1,'SHOP1','Delhi',0.50),(2,'SHOP2','Goa',0.75),(3,'SHOP3','Noida',0.35);
/*!40000 ALTER TABLE `Salespeople` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `onum` int(11) NOT NULL,
  `amt` decimal(10,0) DEFAULT NULL,
  `odate` date NOT NULL,
  `cnum` int(11) NOT NULL,
  `snum` int(11) NOT NULL,
  PRIMARY KEY (`onum`),
  UNIQUE KEY `cnum` (`cnum`,`snum`),
  KEY `snum` (`snum`),
  KEY `MyIndex` (`onum`,`amt`,`odate`,`cnum`),
  CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`snum`) REFERENCES `Salespeople` (`snum`),
  CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`cnum`) REFERENCES `Customers` (`cnum`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1200,'2020-02-05',1,3),(2,1100,'2020-02-06',2,1),(3,950,'2020-02-03',3,2),(4,100,'2020-02-01',1,2),(5,110,'2020-02-03',2,3),(6,900,'2020-02-05',3,3);
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `id` int(6) unsigned NOT NULL AUTO_INCREMENT,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) NOT NULL,
  `email` varchar(20) DEFAULT NULL,
  `course` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `ind` (`course`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES (1,'Eram','Fatima','erum3011@gmail.com','MCA'),(2,'Sadaf','Fatima','sadaf@gmail.com','MCA'),(3,'Nahid','Fatima','nahid@gmail.com','MCA'),(4,'Sadeqa','Nawab','sadeqa@gmail.com','MSC'),(5,'Aiman','Anees','aiman@gmail.com','MBA');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-02-06 13:22:11
