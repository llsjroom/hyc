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
-- Table structure for table `event`
--

DROP TABLE IF EXISTS `event`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `event` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `cimg` varchar(100) DEFAULT NULL,
  `startday` datetime DEFAULT NULL,
  `endday` datetime DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  `readnum` int(11) DEFAULT 0,
  `file` varchar(255) DEFAULT NULL,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `event`
--

LOCK TABLES `event` WRITE;
/*!40000 ALTER TABLE `event` DISABLE KEYS */;
INSERT INTO `event` VALUES (1,'오닉스트톰2 출간 기념','※ 사은품은 도서정가제 규정에 따라 보유포인트 및 추가결제를 통해 구매하실 수 있으며, 한정수량으로 조기 품절 될 수 있습니다.\r\n업체배송, 해외주문, 나우드림 상품은 사은품 제공 대상에서 제외됩니다.',NULL,NULL,NULL,NULL,0,'1.jpg','2025-08-01 16:38:25'),(2,'<오줌을 참는 기막힌 방법> 출간 이벤트','',NULL,NULL,NULL,NULL,0,'2.jpg','2025-08-04 16:39:53'),(3,'쎄듀 천일문, 베스트셀러 교재 가이드','',NULL,NULL,NULL,NULL,0,'3.png','2025-08-04 16:41:14'),(4,'메가스터디북스 초등 교재 가이드','',NULL,NULL,NULL,NULL,0,'4.jpg','2025-08-04 16:41:57'),(5,'메가스터디북스 중고등 교재 가이드','',NULL,NULL,NULL,NULL,0,'5.jpg','2025-08-07 16:43:08'),(6,'넥서스 JLPT 완간기념 일본어 브랜드전','',NULL,NULL,NULL,NULL,0,'6.jpg','2025-08-12 16:44:21'),(7,'베르나르베르베르 『키메라의땅』 출간 이벤트','',NULL,NULL,NULL,NULL,0,'7.jpg','2025-08-15 16:45:34'),(8,'인생리셋','',NULL,NULL,NULL,NULL,0,'8.png','2025-08-18 16:47:01'),(9,'읽는 영화 원작 기획전','',NULL,NULL,NULL,NULL,0,'9.png','2025-08-21 16:48:06'),(10,'이달의 작가 송세아','',NULL,NULL,NULL,NULL,0,'10.png','2025-08-25 16:49:43'),(11,'똥 탈출기 신간 출간 이벤트!','',NULL,NULL,NULL,NULL,0,'11.jpg','2025-08-27 16:50:52'),(12,'열두살에 부자가 된 키라1 사은 이벤트','',NULL,NULL,NULL,NULL,0,'12.jpg','2025-08-29 16:52:50');
/*!40000 ALTER TABLE `event` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-03 16:43:32
