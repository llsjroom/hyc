-- MariaDB dump 10.19  Distrib 10.5.11-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: book
-- ------------------------------------------------------
-- Server version	10.5.11-MariaDB

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
-- Table structure for table `baesong`
--

DROP TABLE IF EXISTS `baesong`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `baesong` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `zip` char(5) DEFAULT NULL,
  `juso` varchar(100) DEFAULT NULL,
  `jusoEtc` varchar(100) DEFAULT NULL,
  `phone` char(20) DEFAULT NULL,
  `req` int(11) DEFAULT NULL,
  `gibon` int(11) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `baesong`
--

LOCK TABLES `baesong` WRITE;
/*!40000 ALTER TABLE `baesong` DISABLE KEYS */;
INSERT INTO `baesong` VALUES (1,'harang','11700','경기 의정부시 평화로 443','1104','010-1234-5678',0,1,'변지훈');
/*!40000 ALTER TABLE `baesong` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart`
--

DROP TABLE IF EXISTS `cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pcode` char(20) DEFAULT NULL,
  `su` int(11) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
/*!40000 ALTER TABLE `cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dae`
--

DROP TABLE IF EXISTS `dae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) DEFAULT NULL,
  `code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dae`
--

LOCK TABLES `dae` WRITE;
/*!40000 ALTER TABLE `dae` DISABLE KEYS */;
INSERT INTO `dae` VALUES (1,'소설/문학','A1'),(2,'비소설/교양','B1'),(3,'경제/경영','C1'),(4,'과학/기술','D1');
/*!40000 ALTER TABLE `dae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `gumae`
--

DROP TABLE IF EXISTS `gumae`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `gumae` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `badId` int(11) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `su` int(11) DEFAULT NULL,
  `sudan` int(11) DEFAULT NULL,
  `card` int(11) DEFAULT NULL,
  `halbu` int(11) DEFAULT NULL,
  `bank` int(11) DEFAULT NULL,
  `comm` int(11) DEFAULT NULL,
  `useJuk` int(11) DEFAULT NULL,
  `cprice` int(11) DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `jumuncode` char(12) DEFAULT NULL,
  `review` int(11) DEFAULT 0,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gumae`
--

LOCK TABLES `gumae` WRITE;
/*!40000 ALTER TABLE `gumae` DISABLE KEYS */;
/*!40000 ALTER TABLE `gumae` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inquiry`
--

DROP TABLE IF EXISTS `inquiry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inquiry` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  `ref` int(11) DEFAULT NULL,
  `qna` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
/*!40000 ALTER TABLE `inquiry` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jjim`
--

DROP TABLE IF EXISTS `jjim`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `jjim` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pcode` char(12) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjim`
--

LOCK TABLES `jjim` WRITE;
/*!40000 ALTER TABLE `jjim` DISABLE KEYS */;
/*!40000 ALTER TABLE `jjim` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `member`
--

DROP TABLE IF EXISTS `member`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `member` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) NOT NULL,
  `pwd` char(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `name` char(20) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  `state` int(11) DEFAULT 0,
  `juk` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'harang','1234','bjh5298@naver.com','010-1234-5678','변지훈','2025-08-14 15:30:46',0,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product`
--

DROP TABLE IF EXISTS `product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pcode` char(7) NOT NULL,
  `pimg` varchar(400) NOT NULL,
  `dimg` varchar(100) DEFAULT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `halin` int(11) DEFAULT 0,
  `su` int(11) NOT NULL,
  `baeprice` int(11) DEFAULT NULL,
  `baeday` int(11) DEFAULT NULL,
  `juk` int(11) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  `pansu` int(11) DEFAULT NULL,
  `sales` int(11) DEFAULT NULL,
  `salesDay` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (15,'A101001','a1.jpg,','','꽃',38000,0,1,3300,3,0,'2025-08-13 13:48:58',NULL,NULL,NULL);
/*!40000 ALTER TABLE `product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review`
--

DROP TABLE IF EXISTS `review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `userid` char(20) DEFAULT NULL,
  `pcode` char(20) DEFAULT NULL,
  `gid` int(11) DEFAULT NULL,
  `star` int(11) DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `content` text NOT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
/*!40000 ALTER TABLE `review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `so`
--

DROP TABLE IF EXISTS `so`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `so` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` char(10) DEFAULT NULL,
  `daecode` char(2) DEFAULT NULL,
  `code` char(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `so`
--

LOCK TABLES `so` WRITE;
/*!40000 ALTER TABLE `so` DISABLE KEYS */;
INSERT INTO `so` VALUES (1,'한국소설','A1','01'),(2,'해외소설','A1','02'),(3,'고전문학','A1','03'),(4,'시/에세이','A1','04'),(5,'인문학','B1','01'),(6,'역사','B1','02'),(7,'사회 / 정치','B1','03'),(8,'철학','B1','04'),(9,'경제일반','C1','01'),(10,'마케팅 / 광고','C1','02'),(11,'자기계발','C1','03'),(12,'재테크 / 투자','C1','04'),(13,'자연과학','D1','01'),(14,'공학 / 기술','D1','02'),(15,'컴퓨터 / IT','D1','03');
/*!40000 ALTER TABLE `so` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-08-19  9:39:42
