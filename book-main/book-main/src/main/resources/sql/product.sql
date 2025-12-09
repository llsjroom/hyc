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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart`
--

LOCK TABLES `cart` WRITE;
/*!40000 ALTER TABLE `cart` DISABLE KEYS */;
INSERT INTO `cart` VALUES (6,'admin','A101004',1,'2025-08-21 17:15:45'),(9,'harang','A101001',5,'2025-08-22 12:04:56'),(10,'harang','B102035',1,'2025-08-22 13:05:28');
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
  `baeId` int(11) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `gumae`
--

LOCK TABLES `gumae` WRITE;
/*!40000 ALTER TABLE `gumae` DISABLE KEYS */;
INSERT INTO `gumae` VALUES (1,'harang',1,'A101001',1,2,0,0,0,0,0,14365,5,'j20250820001',1,'2025-08-20 16:18:24'),(2,'harang',1,'A101001',5,2,0,0,0,0,0,538625,0,'j20250822001',0,'2025-08-22 13:05:38'),(3,'harang',1,'B102035',1,2,0,0,0,0,0,538625,1,'j20250822001',0,'2025-08-22 13:05:38');
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inquiry`
--

LOCK TABLES `inquiry` WRITE;
/*!40000 ALTER TABLE `inquiry` DISABLE KEYS */;
INSERT INTO `inquiry` VALUES (1,'harang','재밌나요?','A102048','2025-08-27 17:40:42',1,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jjim`
--

LOCK TABLES `jjim` WRITE;
/*!40000 ALTER TABLE `jjim` DISABLE KEYS */;
INSERT INTO `jjim` VALUES (1,'harang','A101001','2025-08-22 12:11:12'),(3,'harang','B102035','2025-08-22 13:05:26');
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `member`
--

LOCK TABLES `member` WRITE;
/*!40000 ALTER TABLE `member` DISABLE KEYS */;
INSERT INTO `member` VALUES (1,'harang','1234','bjh5298@naver.com','010-1234-5678','변지훈','2025-08-14 15:30:46',0,0),(2,'admin','1234','bbb@naver.com','010-1111-1111','관리자','2025-08-19 12:07:29',0,0);
/*!40000 ALTER TABLE `member` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `notice`
--

DROP TABLE IF EXISTS `notice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `notice` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(200) DEFAULT NULL,
  `content` text DEFAULT NULL,
  `file` varchar(255) DEFAULT NULL,
  `readnum` int(11) DEFAULT 0,
  `writeday` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,' Book# 오픈!!','안녕하세요,\r\nBook#이 오픈했습니다.\r\n많이 축하해주세요!','3868276.jpg,Book#.txt',1,'2025-08-19 17:01:46');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
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
  `etc` varchar(200) DEFAULT NULL,
  `review` int(11) DEFAULT 0,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product`
--

LOCK TABLES `product` WRITE;
/*!40000 ALTER TABLE `product` DISABLE KEYS */;
INSERT INTO `product` VALUES (37,'A101001','가시고기1.PNG','가시고기소개.PNG','가시고기',16500,10,2,1000,2,10,'2025-08-20 14:11:14',NULL,NULL,NULL,NULL,6),(38,'A101002','강하고아름다운할머니가되고싶어1.PNG','강하고아름다운할머니가되고싶어소개.PNG','강하고 아름다운 할머니가 되고싶어',19000,10,2,1000,2,10,'2025-08-20 14:19:41',NULL,NULL,NULL,NULL,0),(39,'A101003','거기내가가면안돼요1.PNG','거기내가가면안돼요소개.PNG','거기 내가 가면 안돼요?',15500,10,2,1000,2,10,'2025-08-20 14:22:36',NULL,NULL,NULL,NULL,0),(40,'A101004','고래1.PNG','고래소개.PNG','고래',18000,5,3,1000,2,10,'2025-08-20 14:23:52',NULL,NULL,NULL,NULL,0),(41,'A101005','고래눈이내리다1.PNG','고래눈이내리다소개.PNG','고래눈이 내리다',15000,5,2,1000,2,10,'2025-08-20 14:25:40',NULL,NULL,NULL,NULL,0),(42,'A101006','고향1.PNG','고향소개.PNG','고향',16000,5,2,1000,2,10,'2025-08-20 14:26:36',NULL,NULL,NULL,NULL,0),(43,'A101007','과잉무지개1.PNG','과잉무지개소개.PNG','과잉 무지개',20000,10,2,1000,2,10,'2025-08-20 14:27:28',NULL,NULL,NULL,NULL,0),(44,'A101008','구의증명1.PNG','구의증명소개.PNG','구의증명',18500,10,3,1000,1,10,'2025-08-20 14:28:14',NULL,NULL,NULL,NULL,0),(45,'A101009','그개와혁명1.PNG','그개와혁명소개.PNG','그 개와 혁명',22000,15,4,1000,1,10,'2025-08-20 14:29:05',NULL,NULL,NULL,NULL,0),(46,'A101010','그래도춤을추세요1.PNG','그래도춤을추세요소개.PNG','그래도 춤을 추세요',24000,10,5,0,1,10,'2025-08-20 14:30:30',NULL,NULL,NULL,NULL,0),(47,'A101011','그산이정말거기있을까1.PNG','그산이정말거기있을까소개.PNG','그 산이 정말 거기 있을까',9900,0,5,1000,1,0,'2025-08-20 14:31:17',NULL,NULL,NULL,NULL,0),(48,'A101012','급류1.PNG','급류소개.PNG','급류',25000,10,10,1000,1,10,'2025-08-20 14:32:24',NULL,NULL,NULL,NULL,0),(49,'A101013','급류특별판1.PNG','급류특별판소개.PNG','급류[특별판]',27000,10,10,1000,1,10,'2025-08-20 14:33:11',NULL,NULL,NULL,NULL,0),(50,'A101014','나는 소망한다 내게금지된것을1.PNG','나는 소망한다 내게금지된것을 소개.PNG','나는 소망한다 내게 금지된것을',30000,10,3,1000,1,10,'2025-08-20 14:33:47',NULL,NULL,NULL,NULL,0),(51,'A101015','나의완벽한무인도1.PNG','나의완벽한무인도소개.PNG','나는 완벽한 무인도',16500,10,5,1000,1,10,'2025-08-20 14:34:25',NULL,NULL,NULL,NULL,0),(52,'A101016','낙천1.PNG','낙천소개.PNG','낙천',18000,5,3,1000,1,10,'2025-08-20 14:35:06',NULL,NULL,NULL,NULL,0),(53,'A101017','난장이가쏘아올린작은공1.PNG','난장이가쏘아올린작은공소개.PNG','난장이가 쏘아 올린 작은공',22000,10,2,1000,1,10,'2025-08-20 14:35:49',NULL,NULL,NULL,NULL,0),(54,'A101018','날씨가좋으면찾아가겠어요1.PNG','날씨가좋으면찾아가겠어요소개.PNG','날씨가 좋으면 찾아 가겠어요',20000,6,10,1000,1,10,'2025-08-20 14:36:50',NULL,NULL,NULL,NULL,0),(55,'A101019','내가되는꿈1.PNG','내가되는꿈소개.PNG','내가 되는 꿈',19000,10,3,1000,1,10,'2025-08-20 14:37:31',NULL,NULL,NULL,NULL,0),(56,'A101020','눈맞추는소설1.PNG','눈맞추는소설소개.PNG','눈 맞추는 소설',10000,0,3,0,1,0,'2025-08-20 14:38:30',NULL,NULL,NULL,NULL,0),(57,'A101021','다시몸으로1.PNG','다시몸으로소개.PNG','다시 몸으로',18000,5,3,1000,1,10,'2025-08-20 14:39:07',NULL,NULL,NULL,NULL,0),(58,'A101022','단한사람1.PNG','단한사람소개.PNG','단 한사람',20000,10,3,1000,1,10,'2025-08-20 14:39:40',NULL,NULL,NULL,NULL,0),(59,'A101023','대온실수리보고서1.PNG','대온실수리보고서소개.PNG','대온실 수리 보고서',18000,10,5,1000,1,10,'2025-08-20 14:40:46',NULL,NULL,NULL,NULL,0),(60,'A101024','돌비공포라디오더레드1.PNG','돌비공포라디오더레드소개.PNG','돌비 공포라디오 더 레드',25000,5,5,1000,1,10,'2025-08-20 14:41:39',NULL,NULL,NULL,NULL,0),(61,'A101025','돌이킬수있는1.PNG','돌이킬수있는소개.PNG','돌이킬수 있는',15000,5,2,1000,1,10,'2025-08-20 14:42:18',NULL,NULL,NULL,NULL,0),(62,'A101026','두고1.PNG','두고소개.PNG','두고',14000,5,5,1000,1,10,'2025-08-20 14:42:53',NULL,NULL,NULL,NULL,0),(63,'A101027','두사람의인터내셔널1.PNG','두사람의인터내셔널소개.PNG','두사람의 인터내셔널',26000,10,5,1000,1,10,'2025-08-20 14:43:31',NULL,NULL,NULL,NULL,0),(64,'A101028','매듭의끝1.PNG','매듭의끝소개.PNG','매듭의 끝',30000,10,5,1000,1,10,'2025-08-20 14:44:00',NULL,NULL,NULL,NULL,0),(65,'A101029','명랑1.PNG','명랑소개.PNG','명랑',34000,10,5,1000,1,10,'2025-08-20 14:44:37',NULL,NULL,NULL,NULL,0),(66,'A101030','모순1.PNG','모순소개.PNG','모순',28000,10,2,1000,1,10,'2025-08-20 14:45:15',NULL,NULL,NULL,NULL,0),(67,'A101031','바깥은여름1.PNG','바깥은여름소개.PNG','바깥은 여름',16000,10,5,1000,1,10,'2025-08-20 14:46:15',NULL,NULL,NULL,NULL,0),(68,'A101032','밝은밤1.PNG','밝음밤소개.PNG','밝은 밤',18000,10,10,1000,1,10,'2025-08-20 14:46:45',NULL,NULL,NULL,NULL,0),(69,'A101033','밤에찾아오는구원자1.PNG','밤에찾아오는구원자소개.PNG','밤에 찾아오는 구원자',20000,10,6,1000,1,10,'2025-08-20 14:47:15',NULL,NULL,NULL,NULL,0),(70,'A101034','범도1.PNG','범도소개.PNG','범도',24000,10,5,1000,1,10,'2025-08-20 14:48:01',NULL,NULL,NULL,NULL,0),(71,'A101035','범도2 1.PNG','범도2 소개.PNG','범도2',24000,10,5,1000,1,10,'2025-08-20 14:49:56',NULL,NULL,NULL,NULL,0),(72,'A101036','복미영팬클럽흥망사1.PNG','복미영팬클럽흥망사소개.PNG','복미영 팬클럽 흥망사',25000,10,5,1000,1,10,'2025-08-20 14:50:44',NULL,NULL,NULL,NULL,0),(73,'A101037','봄밤의모든것1.PNG','봄밤의모든것소개.PNG','봄밤의 모든것',20000,10,5,1000,1,10,'2025-08-20 14:51:22',NULL,NULL,NULL,NULL,0),(74,'A101038','불편한편의점1.PNG','불편한편의점소개.PNG','불편한 편의점',19000,10,1,1000,1,10,'2025-08-20 14:52:10',NULL,NULL,NULL,NULL,0),(75,'A101039','비눗방울폼1.PNG','비눗방울폼소개.PNG','비눗방울 폼',18000,10,2,1000,1,10,'2025-08-20 14:52:44',NULL,NULL,NULL,NULL,0),(76,'A101040','비행운1.PNG','비행운소개.PNG','비행운',15000,5,5,1000,1,10,'2025-08-20 14:53:20',NULL,NULL,NULL,NULL,0),(77,'A101041','빛을걷으면빛1.PNG','빛을걷으면빛소개.PNG','빛을 걷으면 빛',23000,10,5,1000,1,10,'2025-08-20 14:53:58',NULL,NULL,NULL,NULL,0),(78,'A101042','사랑과결함1.PNG','사랑과결함소개.PNG','사랑과 결함',19000,10,6,1000,1,10,'2025-08-20 14:54:34',NULL,NULL,NULL,NULL,0),(79,'A101043','사랑은하트모양이아니야1.PNG','사랑은하트모양이아니야소개.PNG','사랑은 하트 모양이 아니야',26000,10,5,1000,1,10,'2025-08-20 14:55:10',NULL,NULL,NULL,NULL,0),(80,'A101044','사서함110호의우편물1.PNG','사서함110호의우편물소개.PNG','사서함 110호의 우편물',20000,10,1,1000,1,10,'2025-08-20 15:04:51',NULL,NULL,NULL,NULL,0),(81,'A101045','상아1.PNG','상아소개.PNG','상아',18000,10,1,1000,1,10,'2025-08-20 15:06:54',NULL,NULL,NULL,NULL,0),(82,'A101046','소년1.PNG','소년소개.PNG','소년',20000,10,5,1000,1,10,'2025-08-20 15:28:16',NULL,NULL,NULL,NULL,0),(83,'A101047','소설가구보씨의일일1.PNG','소설가구보씨의일일소개.PNG','소설가 구보씨의 일일',20000,10,10,1000,1,10,'2025-08-20 15:31:00',NULL,NULL,NULL,NULL,0),(84,'A101048','소설가소판독의낙서견문록1.PNG','소설가소판독의낙서견문록소개.PNG','소설가 소판독의 낙서 견문록',25000,10,5,1000,1,10,'2025-08-20 15:31:53',NULL,NULL,NULL,NULL,0),(85,'A101049','소설보다봄1.PNG','소설보다봄소개.PNG','소설보다 봄',26000,10,5,1000,1,10,'2025-08-20 15:32:30',NULL,NULL,NULL,NULL,0),(86,'A101050','소설보다여름1.PNG','소설보다여름소개.PNG','소설보다 여름',25000,10,6,1000,1,10,'2025-08-20 15:33:12',NULL,NULL,NULL,NULL,0),(87,'A101051','스파클1.PNG','스파클소개.PNG','스파클',22000,10,4,1000,1,10,'2025-08-20 15:33:59',NULL,NULL,NULL,NULL,0),(88,'A101052','슬픔1.PNG','슬픔소개.PNG','슬픔',20000,10,5,1000,1,10,'2025-08-20 15:34:49',NULL,NULL,NULL,NULL,0),(89,'A101053','아가미1.PNG','아가미소개.PNG','아가미',22500,10,5,1000,1,10,'2025-08-20 15:35:35',NULL,NULL,NULL,NULL,0),(90,'A101054','아몬드1.PNG','아몬드소개.PNG','아몬드',23000,10,6,1000,1,10,'2025-08-20 15:36:47',NULL,NULL,NULL,NULL,0),(91,'A101055','안녕1.PNG','안녕소개.PNG','안녕',25000,10,10,100,1,10,'2025-08-20 15:37:30',NULL,NULL,NULL,NULL,0),(92,'A101056','야만과신화1.PNG','야만과신화소개.PNG','야만과 신화',20000,10,6,1000,1,10,'2025-08-20 15:38:26',NULL,NULL,NULL,NULL,0),(93,'A101057','어짜피세상은멸망할텐데1.PNG','어짜피세상은멸망할텐데소개.PNG','어짜피 세상은 멸망할텐데',30000,10,10,1000,1,10,'2025-08-20 15:39:13',NULL,NULL,NULL,NULL,0),(94,'A101058','언젠간 우리가 같은별을바라본다면1.PNG','언젠간 우리가 같은별을바라본다면소개.PNG','언젠간 우리가 같은 별을 바라본다면',35000,10,2,1000,1,10,'2025-08-20 15:39:52',NULL,NULL,NULL,NULL,0),(95,'A101059','얼룩진여름1.PNG','얼룩진여름소개.PNG','얼룩진 여름',22000,10,3,1000,1,10,'2025-08-20 15:40:40',NULL,NULL,NULL,NULL,0),(96,'A101060','여름1.PNG','여름소개.PNG','여름',30000,10,5,1000,1,10,'2025-08-20 15:41:15',NULL,NULL,NULL,NULL,0),(97,'A101061','여름에더좋은소설1.PNG','여름에더좋은소설소개.PNG','여름에 더 좋은 소설',22000,10,6,1000,1,10,'2025-08-20 15:41:55',NULL,NULL,NULL,NULL,0),(98,'A101062','여름은고작계절1.PNG','여름은고작계절소개.PNG','여름은 고작 계절',24000,10,2,1000,1,10,'2025-08-20 15:42:31',NULL,NULL,NULL,NULL,0),(99,'A101063','예술에관한살인적농담1.PNG','예술에관한살인적농담소개.PNG','예술에 관한 살인적 농담',40000,10,1,1000,1,10,'2025-08-20 15:43:13',NULL,NULL,NULL,NULL,0),(100,'A101064','우리가빛의속도로갈수없다면1.PNG','우리가빛의속도로갈수없다면소개.PNG','우리가 빛의 속도로 갈 수 없다면',22500,10,6,1000,1,10,'2025-08-20 15:44:05',NULL,NULL,NULL,NULL,0),(101,'A101065','이중하나는거짓말1.PNG','이중하나는거짓말소개.PNG','이 중 하나는 거짓말',21000,10,6,1000,1,10,'2025-08-20 15:44:50',NULL,NULL,NULL,NULL,0),(102,'A101066','이효석문학상 수상작품집1.PNG','이효석문학상 수상작품집소개.PNG','이효석 문학상 수상 작품집',18700,10,6,1000,1,10,'2025-08-20 15:45:35',NULL,NULL,NULL,NULL,0),(103,'A101067','인어사냥1.PNG','인어사냥소개.PNG','인어사냥',22000,10,5,1000,1,10,'2025-08-20 16:02:20',NULL,NULL,NULL,NULL,0),(104,'A104001','100세할머니약국1.PNG','100세할머니약국소개.PNG','100세 할머니약국',13000,0,2,0,1,0,'2025-08-20 16:19:25',NULL,NULL,NULL,NULL,0),(105,'A101068','일억번째여름1.PNG','일억번째여름소개.PNG','일억번째 여름',18000,5,10,1000,1,10,'2025-08-21 10:00:38',NULL,NULL,NULL,NULL,0),(106,'A101069','자몽1.PNG','자몽소개.PNG','자몽',20000,10,10,1000,2,10,'2025-08-21 10:02:58',NULL,NULL,NULL,NULL,0),(107,'A101070','작별1.PNG','작별소개.PNG','작별',22000,10,10,1000,3,10,'2025-08-21 10:03:48',NULL,NULL,NULL,NULL,0),(108,'A101071','적산가옥의유령1.PNG','적산가옥의유령소개.PNG','적산 가옥의 유령',25000,10,10,1000,3,10,'2025-08-21 10:04:55',NULL,NULL,NULL,NULL,0),(109,'A101072','전지적독자시점2파트2 1.PNG','전지적독자시점2파트2소개.PNG','전지적 독자시점2 part2',30000,10,10,1000,4,10,'2025-08-21 10:06:33',NULL,NULL,NULL,NULL,0),(110,'A101073','전지적독자시점파트1 1.PNG','전지적독자시점파트1소개.PNG','전지적 독자 시점1  part1',30000,10,10,1000,4,10,'2025-08-21 10:07:41',NULL,NULL,NULL,NULL,0),(111,'A101074','전지적독자시점파트2 1.PNG','전지적독자시점파트2소개.PNG','전지적  독자시점1 part2',30000,10,10,1000,4,10,'2025-08-21 10:09:20',NULL,NULL,NULL,NULL,0),(112,'A101075','전지적독자시점파트31.PNG','전지적독자시점파트3소개.PNG','전지적 독자시점1 part3',30000,10,10,1000,4,10,'2025-08-21 10:10:30',NULL,NULL,NULL,NULL,0),(113,'A101076','전지적독자시점파트4 1.PNG','전지적독자시점파트4소개.PNG','전지적 독자시점1 part4',30000,10,10,1000,4,10,'2025-08-21 10:11:40',NULL,NULL,NULL,NULL,0),(114,'A101077','전지적독자시점파트5 1.PNG','전지적독자시점파트5소개.PNG','전지적 독자시점1 part5',30000,10,10,1000,4,10,'2025-08-21 10:13:01',NULL,NULL,NULL,NULL,0),(115,'A101078','전지적독자시점파트6 1.PNG','전지적독자시점파트6소개.PNG','전지적 독자시점1 part6',30000,10,10,1000,4,10,'2025-08-21 10:22:14',NULL,NULL,NULL,NULL,0),(116,'A101079','전지적독자시점파트7 1.PNG','전지적독자시점파트7소개.PNG','전지적 독자시점1 part7',30000,10,10,1000,4,10,'2025-08-21 10:22:53',NULL,NULL,NULL,NULL,0),(117,'A101080','전지적독자시점파트8 1.PNG','전지적독자시점파트8소개.PNG','전지적 독자시점1 part8',30000,10,10,1000,4,10,'2025-08-21 10:23:38',NULL,NULL,NULL,NULL,0),(118,'A101081','젊은작가1.PNG','젊은작가 소개.PNG','젊은작가',20000,10,10,1000,4,10,'2025-08-21 10:24:17',NULL,NULL,NULL,NULL,0),(119,'A101082','젊음1.PNG','젊음소개.PNG','젊음',22000,10,10,1000,4,10,'2025-08-21 10:24:57',NULL,NULL,NULL,NULL,0),(120,'A101083','종의기원1.PNG','종의기원소개.PNG','종의기원',26000,10,10,1000,4,10,'2025-08-21 10:25:42',NULL,NULL,NULL,NULL,0),(121,'A101084','지구끝의온실1.PNG','지구끝의온실소개.PNG','지구끝의 온실',18000,10,10,1000,4,10,'2025-08-21 10:26:20',NULL,NULL,NULL,NULL,0),(122,'A101085','채식1.PNG','채식소개.PNG','채식',25000,10,10,1000,4,10,'2025-08-21 10:26:51',NULL,NULL,NULL,NULL,0),(123,'A101086','천개의파랑1.PNG','천개의파랑소개.PNG','천개의 파랑',24000,10,10,1000,4,10,'2025-08-21 10:27:31',NULL,NULL,NULL,NULL,0),(124,'A101087','치유의빛1.PNG','치유의빛소개.PNG','치유의빛',24500,10,10,1000,4,10,'2025-08-21 10:28:05',NULL,NULL,NULL,NULL,0),(125,'A101088','치즈1.PNG','치즈소개.PNG','치즈',19500,10,10,1000,4,10,'2025-08-21 10:38:56',NULL,NULL,NULL,NULL,0),(126,'A101089','칵테일러브좀비1.PNG','칵테일러브좀비소개.PNG','칵테일,러브,좀비',25500,10,10,1000,4,10,'2025-08-21 10:39:40',NULL,NULL,NULL,NULL,0),(127,'A101090','토막난우주를안고서1.PNG','토막난우주를안고서소개.PNG','토막난 우주를 안고서',32000,10,10,1000,4,10,'2025-08-21 10:40:15',NULL,NULL,NULL,NULL,0),(128,'A101091','파과1.PNG','파과소개.PNG','파과',23000,10,10,1000,4,10,'2025-08-21 10:41:09',NULL,NULL,NULL,NULL,0),(129,'A101092','판탈롱나팔바지이야기1.PNG','판탈롱나팔바지이야기소개.PNG','판탈롱 나팔바지이야기',21000,10,10,1000,4,10,'2025-08-21 10:42:56',NULL,NULL,NULL,NULL,0),(130,'A101093','하얼빈1.PNG','하얼빈소개.PNG','하얼빈',40000,10,10,1000,4,10,'2025-08-21 10:43:27',NULL,NULL,NULL,NULL,0),(131,'A101094','홍학의자리1.PNG','홍학의자리소개.PNG','홍학의자리',19500,10,10,1000,4,10,'2025-08-21 10:44:48',NULL,NULL,NULL,NULL,0),(132,'A101095','환상서점2 1.PNG','환상서정2소개.PNG','환상서점2',24000,10,10,1000,4,10,'2025-08-21 10:47:16',NULL,NULL,NULL,NULL,0),(133,'A101096','회색인간1.PNG','회색인간소개.PNG','회색인간',19500,10,10,1000,4,10,'2025-08-21 10:49:33',NULL,NULL,NULL,NULL,0),(134,'A101097','희랍어시간1.PNG','희랍어소개.PNG','희랍어 시간',27000,10,10,1000,4,10,'2025-08-21 10:50:14',NULL,NULL,NULL,NULL,0),(135,'A101098','희망1.PNG','희망소개.PNG','희망',33000,10,10,1000,4,10,'2025-08-21 10:51:24',NULL,NULL,NULL,NULL,0),(136,'A101099','흰1.PNG','흰소개.PNG','흰',20000,10,10,1000,4,10,'2025-08-21 10:51:51',NULL,NULL,NULL,NULL,0),(137,'A102001','8월의고쇼그라운드1.PNG','8월의고쇼그라운드소개.PNG','8월의 고쇼그라운드',35000,10,10,1000,1,10,'2025-08-21 11:07:33',NULL,NULL,NULL,NULL,0),(138,'A102002','가공범1.PNG','가공범소개.PNG','가공범',22000,10,10,1000,1,10,'2025-08-21 11:36:43',NULL,NULL,NULL,NULL,0),(139,'A102003','가라앉는프랜시스1.PNG','가라앉는프랜시스소개.PNG','가라앉는 프랜시스',22000,10,10,1000,1,10,'2025-08-21 11:37:17',NULL,NULL,NULL,NULL,0),(140,'A102004','고백1.PNG','고백소개.PNG','고백',22000,10,10,1000,1,10,'2025-08-21 11:37:42',NULL,NULL,NULL,NULL,0),(141,'A102005','고양이서점복두당1.PNG','고양이서점복두당소개.PNG','고양이서점 복두당',22000,10,10,1000,1,10,'2025-08-21 11:38:17',NULL,NULL,NULL,NULL,0),(142,'A102006','귀신저택1.PNG','귀신저택소개.PNG','귀신저택',30000,10,10,1000,1,10,'2025-08-21 11:50:06',NULL,NULL,NULL,NULL,0),(143,'A102007','금각사1.PNG','금각사소개.PNG','금각사',16000,10,10,1000,1,10,'2025-08-21 11:56:51',NULL,NULL,NULL,NULL,0),(144,'A102008','긴키지방의어느장소에대하여1.PNG','긴키지방의어느장소에대하여소개.PNG','긴키지방의 어느 장소에대하여',25000,10,10,1000,1,10,'2025-08-21 11:57:32',NULL,NULL,NULL,NULL,0),(145,'A102009','나미야잡화점의기적1.PNG','나미야잡화점의기적소개.PNG','나미야  잡화점의 기적',22000,10,10,1000,1,10,'2025-08-21 11:58:09',NULL,NULL,NULL,NULL,0),(146,'A102010','나와너의365일1.PNG','나와너의365일소개.PNG','나와 너의 365일',20000,10,10,1000,1,10,'2025-08-21 11:58:40',NULL,NULL,NULL,NULL,0),(147,'A102011','내시체를찾아주세요1.PNG','내시체를찾아주세요소개.PNG','내 시체를 찾아주세요',24000,10,10,1000,1,10,'2025-08-21 11:59:09',NULL,NULL,NULL,NULL,0),(148,'A102012','노르웨이의숲1.PNG','노르웨이의숲소개.PNG','노르웨이의 숲',24000,10,10,1000,1,10,'2025-08-21 11:59:38',NULL,NULL,NULL,NULL,0),(149,'A102013','녹나무의여신1.PNG','녹나무의여신소개.PNG','녹나무의 여신',26000,10,10,1000,1,10,'2025-08-21 12:00:08',NULL,NULL,NULL,NULL,0),(150,'A102014','당신이누군가를죽였다1.PNG','당신이누군가를죽였다소개.PNG','당신이 누군가를 죽였다',30000,10,10,1000,1,10,'2025-08-21 12:00:34',NULL,NULL,NULL,NULL,0),(151,'A102015','마음1.PNG','마음소개.PNG','마음',26000,10,10,1000,1,10,'2025-08-21 12:01:00',NULL,NULL,NULL,NULL,0),(152,'A102016','만년1.PNG','만년소개.PNG','만년',32000,10,10,1000,1,10,'2025-08-21 12:01:25',NULL,NULL,NULL,NULL,0),(153,'A102017','말하고싶은비밀1.PNG','말하고싶은비밀소개.PNG','말하고싶은 비밀',35000,10,10,1000,1,10,'2025-08-21 12:02:03',NULL,NULL,NULL,NULL,0),(154,'A102018','말하고싶은비밀vol2 1.PNG','말하고싶은비밀vol2소개.PNG','말하고싶은 비밀 vol2',35000,10,10,1000,1,10,'2025-08-21 12:02:35',NULL,NULL,NULL,NULL,0),(155,'A102019','목숨을팝니다1.PNG','목숨을팝니다소개.PNG','목숨을 팝니다',35500,10,10,1000,1,10,'2025-08-21 12:03:07',NULL,NULL,NULL,NULL,0),(156,'A102020','바다가들리는편의점1.PNG','바다가들리는편의점소개.PNG','바다가 들리는 편의점',42000,10,10,1000,1,10,'2025-08-21 12:03:49',NULL,NULL,NULL,NULL,0),(157,'A102021','바다가들리는편의점4 1.PNG','바다가들리는편의점4소개.PNG','바다가 들리는 편의점4',42000,10,10,1000,1,10,'2025-08-21 12:04:28',NULL,NULL,NULL,NULL,0),(158,'A102022','살육에이르는병1.PNG','살육에이르는병소개.PNG','살육에 이르는 병',38000,10,10,1000,1,10,'2025-08-21 12:07:11',NULL,NULL,NULL,NULL,0),(159,'A102023','설국1.PNG','설국소개.PNG','설국',42000,10,10,1000,1,10,'2025-08-21 12:07:49',NULL,NULL,NULL,NULL,0),(160,'A102024','세뇌살인1.PNG','세뇌살인소개.PNG','세뇌살인',35000,10,10,1000,1,10,'2025-08-21 12:08:25',NULL,NULL,NULL,NULL,0),(161,'A102025','세상의마지막기차역1.PNG','세상의마지막기차역소개.PNG','세상의 마지막 기차역',33000,10,10,1000,1,10,'2025-08-21 12:09:00',NULL,NULL,NULL,NULL,0),(162,'A102026','소년농성1.PNG','소년농성소개.PNG','소년농성',34000,10,10,1000,1,10,'2025-08-21 12:09:30',NULL,NULL,NULL,NULL,0),(163,'A102027','악의1.PNG','악의소개.PNG','악의',50000,10,10,1000,1,10,'2025-08-21 12:16:38',NULL,NULL,NULL,NULL,0),(164,'A102028','에도괴담걸작선1.PNG','에도괴담걸작선소개.PNG','에도괴담 걸작선',48000,10,10,1000,1,10,'2025-08-21 12:17:18',NULL,NULL,NULL,NULL,0),(165,'A102029','엘리스죽이기1.PNG','엘리스죽이기소개.PNG','엘리스 죽이기',28000,10,10,1000,1,10,'2025-08-21 12:31:10',NULL,NULL,NULL,NULL,0),(166,'A102030','여기는모든새벽의앞1.PNG','여기는모든새벽의앞소개.PNG','여기는 모든 새벽의 앞',26500,10,10,1000,1,10,'2025-08-21 12:32:53',NULL,NULL,NULL,NULL,0),(167,'A102031','여름은오래그곳에남아1.PNG','여름은오래그곳에남아소개.PNG','여름은 오래 그 곳에 남아',36500,10,10,1000,1,10,'2025-08-21 12:33:39',NULL,NULL,NULL,NULL,0),(168,'A102032','연쇄살인마개구리남자1.PNG','연쇄살인마개구리남자소개.PNG','연쇄 살인마 개구리 남자',56000,10,10,1000,1,10,'2025-08-21 12:34:15',NULL,NULL,NULL,NULL,0),(169,'A102033','오늘밤세계에서이눈물이사라진다해도1.PNG','오늘밤세계에서이눈물이사라진다해도소개.PNG','오늘밤 세계에서 이 눈물이 사라진다해도',39000,10,10,1000,1,10,'2025-08-21 12:35:07',NULL,NULL,NULL,NULL,0),(170,'A102034','오늘밤세계에서이사랑이사라진다해도1.PNG','오늘밤세계에서이사랑이사라진다해도소개.PNG','오늘밤 세계에서 이 사랑이 사라진다해도',39000,10,10,1000,1,10,'2025-08-21 12:35:45',NULL,NULL,NULL,NULL,0),(171,'A102035','용의자x의헌신1.PNG','용의자x의헌신소개.PNG','용의자 X의 헌신',37000,10,10,1000,1,10,'2025-08-21 12:36:18',NULL,NULL,NULL,NULL,0),(172,'A102036','우중괴담1.PNG','우중괴담소개.PNG','우중괴담',38500,10,10,1000,1,10,'2025-08-21 12:36:45',NULL,NULL,NULL,NULL,0),(173,'A102037','이메르의거미1.PNG','이메르의거미소개.PNG','이메르의 거미',26500,10,10,1000,1,10,'2025-08-21 12:37:41',NULL,NULL,NULL,NULL,0),(174,'A102038','이별하는방법을가르쳐줘1.PNG','이별하는방법을가르쳐줘소개.PNG','이별하는 방법을 가르쳐줘',30000,10,10,1000,1,10,'2025-08-21 12:38:16',NULL,NULL,NULL,NULL,0),(175,'A102039','이상한집2 1.PNG','이상한집2소개.PNG','이상한집2',26000,10,10,1000,1,10,'2025-08-21 12:38:50',NULL,NULL,NULL,NULL,0),(176,'A102040','이웃집너스에이드1.PNG','이웃집너스에이드소개.PNG','이웃집 너스에이드',38000,10,10,1000,1,10,'2025-08-21 12:39:23',NULL,NULL,NULL,NULL,0),(177,'A102041','인간실격1.PNG','인간실격소개.PNG','인간실격',50000,10,10,1000,1,10,'2025-08-21 12:39:52',NULL,NULL,NULL,NULL,0),(178,'A102042','입에대한앙케이트1.PNG','입에대한앙케이트소개.PNG','입에 대한 앙케이트',34000,10,10,1000,1,10,'2025-08-21 12:40:23',NULL,NULL,NULL,NULL,0),(179,'A102043','장미와나이프1.PNG','장미와나이프소개.PNG','장미와 나이프',24000,10,10,1000,1,10,'2025-08-21 12:40:49',NULL,NULL,NULL,NULL,0),(180,'A102044','전원범인하지만피해자게다가탐정1.PNG','전원범인하지만피해자게다가탐정소개.PNG','전원이 범인 하지만 피해자 게다가 탐정',50000,10,10,1000,1,10,'2025-08-21 12:41:24',NULL,NULL,NULL,NULL,0),(181,'A102045','죽은자에게입이있다1.PNG','죽은자에게입이있다소개.PNG','죽은자에게 입이 있다',48000,10,10,1000,1,10,'2025-08-21 12:41:55',NULL,NULL,NULL,NULL,0),(182,'A102046','지구별인간1.PNG','지구별인간소개.PNG','지구 별 인간',36000,10,10,1000,1,10,'2025-08-21 12:42:29',NULL,NULL,NULL,NULL,0),(183,'A102047','지뢰글리코1.PNG','지뢰글리코소개.PNG','지뢰 글리코',30000,10,10,1000,1,10,'2025-08-21 12:42:55',NULL,NULL,NULL,NULL,0),(184,'A102048','초판본인간실격1.PNG','초판본인간실격소개.PNG','[초판본]인간실격',80000,10,10,1000,1,10,'2025-08-21 12:43:28',NULL,NULL,NULL,NULL,0),(185,'A102049','침묵의퍼레이드1.PNG','침묵의퍼레이드소개.PNG','침묵의 퍼레이드',25000,10,10,1000,1,10,'2025-08-21 12:43:55',NULL,NULL,NULL,NULL,0),(186,'A102050','패자의고백1.PNG','패자의고백소개.PNG','패자의 고백',30000,10,10,1000,1,10,'2025-08-21 12:44:20',NULL,NULL,NULL,NULL,0),(187,'A102051','헌등사1.PNG','헌등사소개.PNG','헌등사',26000,10,10,1000,1,10,'2025-08-21 12:44:51',NULL,NULL,NULL,NULL,0),(188,'A104002','각성1.PNG','','각성',22000,10,10,1000,1,10,'2025-08-21 12:47:40',NULL,NULL,NULL,NULL,0),(189,'A104003','결혼여름1.PNG','결혼여름소개.PNG','결혼여름',26000,10,10,1000,1,10,'2025-08-21 12:48:19',NULL,NULL,NULL,NULL,0),(190,'A104004','나는북경택배기사입니다1.PNG','나는북경택배기사입니다소개.PNG','나는 북경 택배기사입니다',30000,10,10,1000,1,10,'2025-08-21 12:49:00',NULL,NULL,NULL,NULL,0),(191,'A104005','너를아끼며살아라1.PNG','너를아끼며살아라소개.PNG','너를 아끼며 살아라',34000,10,10,1000,1,10,'2025-08-21 12:50:13',NULL,NULL,NULL,NULL,0),(192,'A104006','너에게들려주는꿋꿋한말1.PNG','너에게들려주는꿋꿋한말소개.PNG','너에게 들려주는 꿋꿋한 말',19000,10,10,1000,1,10,'2025-08-21 12:51:24',NULL,NULL,NULL,NULL,0),(193,'A104007','네가있어서1.PNG','네가있어서소개.PNG','네가 있어서',8000,10,10,1000,1,10,'2025-08-21 12:51:52',NULL,NULL,NULL,NULL,0),(194,'A104008','다정한사람이이긴다1.PNG','다정한사람이이긴다소개.PNG','다정한 사람이 이긴다',12000,10,10,1000,1,10,'2025-08-21 12:52:27',NULL,NULL,NULL,NULL,0),(195,'A104009','단식존엄사1.PNG','단식존엄사소개.PNG','단식 존엄사',26000,10,10,1000,1,10,'2025-08-21 12:53:50',NULL,NULL,NULL,NULL,0),(196,'A104010','단한번의삶1.PNG','단한번의삶소개.PNG','단 한번의 삶',30000,10,10,1000,1,10,'2025-08-21 12:54:31',NULL,NULL,NULL,NULL,0),(197,'B101001','달리기를말할때내가하고싶은이야기1.PNG','달리기를말할때내가하고싶은이야기소개.PNG','달리기를 말할때 내가 하고싶은 이야기',25000,10,10,1000,1,10,'2025-08-21 12:56:13',NULL,NULL,NULL,NULL,0),(198,'B101002','더좋은문장을쓰고싶은당신을위한필사책1.PNG','더좋은문장을쓰고싶은당신을위한필사책소개.PNG','더 좋은 문장을쓰고싶은 당신을 위한 필사책',30000,10,10,1000,1,10,'2025-08-21 12:56:59',NULL,NULL,NULL,NULL,0),(199,'B101003','료의생각없는생각1.PNG','료의생각없는생각소개.PNG','료의 생각없는 생각',27000,10,10,1000,1,10,'2025-08-21 12:57:28',NULL,NULL,NULL,NULL,0),(200,'B101004','물고기는존재하지않는다1.PNG','물고기는존재하지않는다소개.PNG','물고기는 존재하지않는다',48000,10,10,1000,1,10,'2025-08-21 12:58:54',NULL,NULL,NULL,NULL,0),(201,'B104001','미묘한메모의묘미1.PNG','미묘한메모의묘미소개.PNG','미묘한메모의 묘미',32000,10,10,1000,1,10,'2025-08-21 12:59:27',NULL,NULL,NULL,NULL,0),(202,'B104002','보이저1.PNG','보이저소개.PNG','보이저',26000,10,10,1000,1,10,'2025-08-21 13:00:19',NULL,NULL,NULL,NULL,0),(203,'B101005','불안1.PNG','불안소개.PNG','불안',25000,10,10,1000,1,10,'2025-08-21 13:01:45',NULL,NULL,NULL,NULL,0),(204,'B104003','불안의서1.PNG','불안의서소개.PNG','볼안의 서',31000,10,10,1000,1,10,'2025-08-21 13:02:11',NULL,NULL,NULL,NULL,0),(205,'B104004','붙잡지않는삶1.PNG','붙잡지않는삶소개.PNG','붙잡지않는 삶',33000,10,10,1000,1,10,'2025-08-21 13:03:26',NULL,NULL,NULL,NULL,0),(206,'B104005','빛과실1.PNG','빛과실소개.PNG','빛과실',22000,10,10,1000,1,10,'2025-08-21 13:03:56',NULL,NULL,NULL,NULL,0),(207,'B103001','사운딩1.PNG','사운딩소개.PNG','사운딩',25000,10,10,1000,1,10,'2025-08-21 13:04:42',NULL,NULL,NULL,NULL,0),(208,'B104006','살아갈날들을위한괴테의시1.PNG','살아갈날들을위한괴테의시소개.PNG','살아갈날들을 위한 괴테의 시',50000,10,10,1000,1,10,'2025-08-21 13:05:16',NULL,NULL,NULL,NULL,0),(209,'B101006','상실1.PNG','상실소개.PNG','상실',36000,10,10,1000,1,10,'2025-08-21 13:05:55',NULL,NULL,NULL,NULL,0),(210,'B101007','소년과두더지와여우와말1.PNG','소년과두더지와여우와말소개.PNG','소년과 두더지와 여우와 말',33000,10,10,1000,1,10,'2025-08-21 13:07:59',NULL,NULL,NULL,NULL,0),(211,'B101008','숨결이바람이될때1.PNG','숨결이바람이될때소개.PNG','숨결이 바람이될때',32500,10,10,1000,1,10,'2025-08-21 13:08:34',NULL,NULL,NULL,NULL,0),(212,'B104007','시쓰기안내서1.PNG','시쓰기안내서소개.PNG','시 쓰기 안내서',16000,10,10,1000,1,10,'2025-08-21 13:09:19',NULL,NULL,NULL,NULL,0),(213,'B102001','시지프신화1.PNG','시지프신화소개.PNG','시지프신화 ',36000,10,10,1000,1,10,'2025-08-21 13:59:53',NULL,NULL,NULL,NULL,0),(214,'B101009','안네의일기1.PNG','안네의일기소개.PNG','안네의 일기',39000,10,10,1000,1,10,'2025-08-21 14:01:41',NULL,NULL,NULL,NULL,0),(215,'B102002','어떤동사의멸종1.PNG','어떤동사의멸종소개.PNG','어떤 동사의 멸종',23000,10,10,1000,1,10,'2025-08-21 14:02:36',NULL,NULL,NULL,NULL,0),(216,'B101010','어른의행복은조용하다1.PNG','어른의행복은조용하다소개.PNG','어른의 행복은 조용하다',24000,10,10,1000,1,10,'2025-08-21 14:03:19',NULL,NULL,NULL,NULL,0),(217,'B101011','여름어사전1.PNG','여름어사전소개.PNG','여름어사전',25000,10,10,1000,1,10,'2025-08-21 14:06:15',NULL,NULL,NULL,NULL,0),(218,'B101012','여자에관하여1.PNG','여자에관하여소개.PNG','여자에 관하여',22500,10,10,1000,1,10,'2025-08-21 14:06:50',NULL,NULL,NULL,NULL,0),(219,'B101013','열심히살아도불안한사람들1.PNG','열심히살아도불안한사람들소개.PNG','열심히 살아도 불안한 사람들',24000,10,10,1000,1,10,'2025-08-21 14:07:27',NULL,NULL,NULL,NULL,0),(220,'B101014','영혼없는작가1.PNG','영혼없는작가소개.PNG','영혼없는 작가',26500,10,10,1000,1,10,'2025-08-21 14:08:13',NULL,NULL,NULL,NULL,0),(221,'B101015','요한씨돌용현1.PNG','요한씨돌용현소개.PNG','요한 씨돌 용현',12500,10,10,1000,1,10,'2025-08-21 14:08:59',NULL,NULL,NULL,NULL,0),(222,'B101016','욕구들1.PNG','욕구들소개.PNG','욕구들',22500,10,10,1000,1,10,'2025-08-21 14:09:29',NULL,NULL,NULL,NULL,0),(223,'B101017','우리낙원에서만나자1.PNG','우리낙원에서만나자소개.PNG','우리 낙원에서 만나자',28800,10,10,1000,1,10,'2025-08-21 14:10:07',NULL,NULL,NULL,NULL,0),(224,'B104008','월든1.PNG','월든소개.PNG','월든',29600,10,10,1000,1,10,'2025-08-21 14:10:39',NULL,NULL,NULL,NULL,0),(225,'B103002','이다의도시관찰일기1.PNG','이다의도시관찰일기소개.PNG','이다의 도시관찰 일기',31000,10,10,1000,1,10,'2025-08-21 14:21:06',NULL,NULL,NULL,NULL,0),(226,'B104009','이렇게말하면행운이올거야1.PNG','이렇게말하면행운이올거야소개.PNG','이렇게 말하면 행운이올거야',35000,10,10,1000,1,10,'2025-08-21 14:21:56',NULL,NULL,NULL,NULL,0),(227,'B104010','이세돌인생의수일기1.PNG','이세돌인생의수읽기소개.PNG','이세돌 인생의수 읽기',44000,10,10,1000,1,10,'2025-08-21 14:22:31',NULL,NULL,NULL,NULL,0),(228,'B104011','인생을바꾸는이메일쓰기1.PNG','인생을바꾸는이메일쓰기소개.PNG','인생을 바꾸는 이메일쓰기',33000,10,10,1000,1,10,'2025-08-21 14:23:14',NULL,NULL,NULL,NULL,0),(229,'B104012','잊으면편해1.PNG','잊으면편해소개.PNG','잊으면 편해',29000,10,10,1000,1,10,'2025-08-21 14:23:48',NULL,NULL,NULL,NULL,0),(230,'B104013','자유로운생활1.PNG','자유로운생활소개.PNG','자유로운 생화',36000,10,10,1000,1,10,'2025-08-21 14:24:28',NULL,NULL,NULL,NULL,0),(231,'B101018','작은일기1.PNG','작은일기소개.PNG','작은일기',24000,10,10,1000,1,10,'2025-08-21 14:25:01',NULL,NULL,NULL,NULL,0),(232,'B104014','장미1.PNG','장미소개.PNG','장미',25000,10,10,1000,1,10,'2025-08-21 14:25:33',NULL,NULL,NULL,NULL,0),(233,'B101019','제철행복1.PNG','제철행복소개.PNG','제철행복',24000,10,10,1000,1,10,'2025-08-21 14:26:12',NULL,NULL,NULL,NULL,0),(234,'B101020','좋은사람도감1.PNG','좋은사람도감소개.PNG','좋은사람 도감',32000,10,10,1000,1,10,'2025-08-21 14:26:43',NULL,NULL,NULL,NULL,0),(235,'B103003','하와이딜리버리1.PNG','하와이딜리버리소개.PNG','하와이 딜리버리',40000,10,10,1000,1,10,'2025-08-21 14:27:19',NULL,NULL,NULL,NULL,0),(236,'B101021','행복할거야이래도되나싶을정도로1.PNG','행복할거야이래도되나싶을정도로소개.PNG','행복할거야 이래도 되나 싶을정도로',42000,10,10,1000,1,10,'2025-08-21 14:27:55',NULL,NULL,NULL,NULL,0),(237,'B101022','혐오와즐거움에관하여1.PNG','혐오와즐거움에관하여소개.PNG','혐오와 즐거움에 관하여',32000,10,10,1000,1,10,'2025-08-21 14:28:26',NULL,NULL,NULL,NULL,0),(238,'B102003','거대한후퇴1.PNG','거대한후퇴소개.PNG','거대한 후퇴',20000,10,10,1000,1,10,'2025-08-22 11:22:38',NULL,NULL,NULL,NULL,0),(239,'B102004','기억서사1.PNG','기억서사소개.PNG','기억서사',24000,10,10,1000,1,10,'2025-08-22 11:25:18',NULL,NULL,NULL,NULL,0),(240,'B102005','뉴라이트비판1.PNG','뉴라이트비판소개.PNG','뉴라이트 비판',26000,10,10,1000,1,10,'2025-08-22 11:25:51',NULL,NULL,NULL,NULL,0),(242,'B102007','도서관의역사1.PNG','도서관의역사소개.PNG','도서관의 역사',30000,10,10,1000,1,10,'2025-08-22 11:27:02',NULL,NULL,NULL,NULL,0),(244,'B102008','로마제국쇠망사1.PNG','로마제국쇠망사소개.PNG','로마제국쇠망사',26000,10,10,1000,1,10,'2025-08-22 11:34:33',NULL,NULL,NULL,NULL,0),(245,'B102009','만들어진서양1.PNG','만들어진서양소개.PNG','만들어진서양',30000,10,10,1000,1,10,'2025-08-22 11:35:14',NULL,NULL,NULL,NULL,0),(246,'B102010','만들어진전통1.PNG','만들어진전통소개.PNG','만들어진전통',30000,10,10,1000,1,10,'2025-08-22 11:36:32',NULL,NULL,NULL,NULL,0),(247,'B102011','무지의역사1.PNG','무지의역사소개.PNG','무지의 역사',25000,10,10,1000,1,10,'2025-08-22 11:37:02',NULL,NULL,NULL,NULL,0),(248,'B102012','버섯중독1.PNG','버섯중독소개.PNG','버섯중독',23000,10,10,1000,1,10,'2025-08-22 11:39:57',NULL,NULL,NULL,NULL,0),(249,'B102013','복종할자유1.PNG','복종할자유소개.PNG','복종 할 자유',22000,10,10,1000,1,10,'2025-08-22 11:40:29',NULL,NULL,NULL,NULL,0),(250,'B102014','봉건사회1.PNG','봉건사회소개.PNG','봉건사회',30000,10,10,1000,1,10,'2025-08-22 11:40:53',NULL,NULL,NULL,NULL,0),(251,'B102015','생각의역사1.PNG','생각의역사소개.PNG','생각의 역사',33000,10,10,1000,1,10,'2025-08-22 12:23:35',NULL,NULL,NULL,NULL,0),(252,'B102016','소비의역사1.PNG','소비의역사소개.PNG','소비의역사',10000,10,10,1000,1,10,'2025-08-22 12:28:13',NULL,NULL,NULL,NULL,0),(253,'B102017','아카이브취향1.PNG','아카이브취향소개.PNG','아카이브 취향',33000,10,10,1000,1,10,'2025-08-22 12:28:40',NULL,NULL,NULL,NULL,0),(254,'B102018','역사1.PNG','역사소개.PNG','역사',22000,10,10,1000,1,10,'2025-08-22 12:29:25',NULL,NULL,NULL,NULL,0),(255,'B102019','역사교육강의1.PNG','역사교육강의소개.PNG','역사교육 강의',26000,10,10,1000,1,10,'2025-08-22 12:30:05',NULL,NULL,NULL,NULL,0),(256,'B102020','역사교육첫걸음1.PNG','역사교육첫걸음소개.PNG','역사교육 첫걸음',35000,10,10,1000,1,10,'2025-08-22 12:30:31',NULL,NULL,NULL,NULL,0),(257,'B102021','역사란무엇인가1.PNG','역사란무엇인가소개.PNG','역사란 무엇인가',26000,10,10,1000,1,10,'2025-08-22 12:30:58',NULL,NULL,NULL,NULL,0),(258,'B102022','역사론1.PNG','역사론소개.PNG','역사론',29000,10,10,1000,1,10,'2025-08-22 12:31:28',NULL,NULL,NULL,NULL,0),(259,'B102023','역사서설1.PNG','역사서설소개.PNG','역사서설',36000,10,10,1000,1,10,'2025-08-22 12:31:53',NULL,NULL,NULL,NULL,0),(260,'B102024','역사와책임1.PNG','역사와책임소개.PNG','역사와 책임',41000,10,10,1000,1,10,'2025-08-22 12:32:53',NULL,NULL,NULL,NULL,0),(261,'B102025','역사의시선1.PNG','역사의시선소개.PNG','역사의 시선',42000,10,10,1000,1,10,'2025-08-22 12:34:03',NULL,NULL,NULL,NULL,0),(263,'B102027','역사의쓸모1.PNG','역사의쓸모소개.PNG','역사의 쓸모',25000,10,10,1000,1,10,'2025-08-22 12:34:59',NULL,NULL,NULL,NULL,0),(264,'B102028','역사의역사1.PNG','역사의역사소개.PNG','역사의 역사',24000,10,10,1000,1,10,'2025-08-22 12:35:26',NULL,NULL,NULL,NULL,0),(265,'B102029','오월의사회과학1.PNG','오월의사회과학소개.PNG','오월의 사회과학',32000,10,10,1000,1,10,'2025-08-22 12:35:54',NULL,NULL,NULL,NULL,0),(266,'B102030','위대한패배자1.PNG','위대한패배자소개.PNG','위대한 패배자',70000,10,10,1000,1,10,'2025-08-22 12:36:22',NULL,NULL,NULL,NULL,0),(267,'B102031','유럽의국경사1.PNG','유럽의국경사소개.PNG','유럽의 국경사',25000,10,10,1000,1,10,'2025-08-22 12:36:52',NULL,NULL,NULL,NULL,0),(268,'B102032','이상한패배1.PNG','이상한패배소개.PNG','이상한패배',32000,10,10,1000,1,10,'2025-08-22 12:37:14',NULL,NULL,NULL,NULL,0),(269,'B102033','쟁점한일사1.PNG','쟁점한일사소개.PNG','쟁점 한일사',56000,10,10,1000,1,10,'2025-08-22 12:37:40',NULL,NULL,NULL,NULL,0),(270,'B102034','존재의기원1.PNG','존재의기원소개.PNG','존재의 기원',20000,10,10,1000,1,10,'2025-08-22 12:38:10',NULL,NULL,NULL,NULL,0),(271,'B102035','짱깨주의의탄생1.PNG','짱깨주의의탄생소개.PNG','짱깨주의의 탄생',250000,10,10,1000,1,10,'2025-08-22 12:38:36',NULL,NULL,NULL,NULL,0),(272,'B102036','탈구된중국1.PNG','탈구된중국소개.PNG','탈구된 중국',20000,10,10,1000,1,10,'2025-08-22 12:39:07',NULL,NULL,NULL,NULL,0),(273,'B102037','미국 흑인의 역사1.PNG','미국 흑인의 역사소개.PNG','미국 흑인의 역사',50000,10,10,1000,1,10,'2025-08-22 12:42:56',NULL,NULL,NULL,NULL,0),(274,'B102038','체 게바라 평전1.PNG','체 게바라 평전소개.PNG','체 게바라 평전',80000,10,10,1000,1,10,'2025-08-22 12:43:24',NULL,NULL,NULL,NULL,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review`
--

LOCK TABLES `review` WRITE;
/*!40000 ALTER TABLE `review` DISABLE KEYS */;
INSERT INTO `review` VALUES (1,'harang','A101001',1,0,'good','good','2025-08-21 11:25:23'),(2,'harang','A101001',1,0,'good','good','2025-08-21 11:28:14'),(3,'harang','A101001',1,NULL,'good','good','2025-08-21 11:29:32'),(4,'harang','A101001',1,NULL,'good','good\r\n','2025-08-21 11:29:38'),(5,'harang','A101001',1,NULL,'good','good','2025-08-21 11:30:11'),(6,'harang','A101001',1,NULL,'good','good','2025-08-21 11:34:44');
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

-- Dump completed on 2025-09-03  9:28:23
