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
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'harang','1234','bjh5298@naver.com','010-1234-5678','변지훈','2025-08-14 15:30:46',0,0),(2,'admin','1234','bbb@naver.com','010-1111-1111','관리자','2025-08-19 12:07:29',0,0),(3,'user01','1234','user01@example.com','010-1111-0001','홍길동','2025-08-15 10:00:00',0,0),(4,'user02','1234','user02@example.com','010-1111-0002','김철수','2025-08-16 11:00:00',0,0),(5,'user03','1234','user03@example.com','010-1111-0003','이영희','2025-08-17 12:00:00',0,0),(6,'user04','1234','user04@example.com','010-1111-0004','박민수','2025-08-18 13:00:00',0,0),(7,'user05','1234','user05@example.com','010-1111-0005','최지우','2025-08-19 14:00:00',0,0),(8,'user06','1234','user06@example.com','010-1111-0006','장서윤','2025-08-20 15:00:00',0,0),(9,'user07','1234','user07@example.com','010-1111-0007','한준호','2025-08-21 16:00:00',0,0),(10,'user08','1234','user08@example.com','010-1111-0008','윤아름','2025-08-22 17:00:00',0,0),(11,'user09','1234','user09@example.com','010-1111-0009','강다연','2025-08-23 18:00:00',0,0),(12,'user10','1234','user10@example.com','010-1111-0010','오세훈','2025-08-24 19:00:00',0,0),(13,'user11','1234','user11@example.com','010-1111-0011','서지훈','2025-08-25 10:10:00',0,0),(14,'user12','1234','user12@example.com','010-1111-0012','배소영','2025-08-26 11:20:00',0,0),(15,'user13','1234','user13@example.com','010-1111-0013','정하늘','2025-08-27 12:30:00',0,0),(16,'user14','1234','user14@example.com','010-1111-0014','고은비','2025-08-28 13:40:00',0,0),(17,'user15','1234','user15@example.com','010-1111-0015','문지환','2025-08-29 14:50:00',0,0),(18,'user16','1234','user16@example.com','010-1111-0016','임도윤','2025-08-30 15:00:00',0,0),(19,'user17','1234','user17@example.com','010-1111-0017','심예진','2025-08-31 16:10:00',0,0),(20,'user18','1234','user18@example.com','010-1111-0018','정시우','2025-09-01 17:20:00',0,0),(21,'user19','1234','user19@example.com','010-1111-0019','노서현','2025-09-02 18:30:00',0,0),(22,'user20','1234','user20@example.com','010-1111-0020','이주호','2025-09-03 19:40:00',0,1111);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-05 14:32:46
