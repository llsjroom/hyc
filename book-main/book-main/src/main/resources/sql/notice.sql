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
  `writeday` date DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `notice`
--

LOCK TABLES `notice` WRITE;
/*!40000 ALTER TABLE `notice` DISABLE KEYS */;
INSERT INTO `notice` VALUES (1,' Book# 오픈!!','안녕하세요,\r\nBook#이 오픈했습니다.\r\n많이 축하해주세요!','3868276.jpg,Book#.txt',0,'2025-08-19'),(2,'배송품질보증제도 안내','1. \'배송품질보증제\'란 무엇인가요?\r\n\r\n주문하신 도서의 출고에서 도착에 이르는 각 단계의 정확한 배송기일을 미리 알려드리고, 이를 지키지 못했을 경우, 구체적인 기준에 따라서 사이버머니를 보상 적립해드리는 인터넷교보문고의 고객만족 서비스입니다.\r\n(단, 주문시 인터넷 교보문고의 회원이신 경우에만 보상금을 적립받을 수 있습니다.)\r\n\r\n\r\n2. 배송품질보증은 언제 받을 수 있나요?\r\n\r\n- 안내된 수령가능일보다 늦게 배송된 경우\r\n- 배송된 도서의 상태가 불량한 경우\r\n- 주문내역과 다른 도서를 배송한 경우\r\n\r\n위에 안내된 세 가지 사유가 중복하여 발생한 경우 해당 사유만큼 중복 적립해드립니다.\r\n\r\n\r\n3. 배송품질보증제가 적용되지 않는 경우도 있나요?\r\n\r\n다음에 해당하는 경우에는 배송지연 보상금이 적립되지 않사오니, 널리 이해해주십시오.\r\n- 품절, 절판 등의 사유로 인하여 도서 수급이 불가함을 고객님께 미리 알려드린 경우\r\n- 명절 , 자연재해 등의 사정으로 인한 배송기일 지연을 미리 공지한 경우\r\n- 배송지가 해외 및 도서, 산간 지역인 경우\r\n\r\n\r\n4. 보상 적립금은 어떻게 받을 수 있나요?\r\n\r\n- 수령가능일보다 배송이 지연된 경우, 고객만족센터로 연락해 주십시오.\r\n- 고객만족센터에서 배송결과 조회를 통해 적용 대상으로 확인한 경우, 즉시 사이버머니 2,000원을 적립해드립니다.','',0,'2025-08-20'),(3,'문화 상품권(해피머니) 사용 중지 안내','안녕하세요.\r\n\r\nBook#입니다. \r\n\r\n \r\n\r\nBook#을 이용하시는 고객 여러분께 감사드리며,\r\n\r\n제휴 상품권 서비스 점검으로 인하여 아래와 같이 서비스가 중단됨을 안내 드립니다.\r\n\r\n \r\n\r\n○ 중단 일시 : 2025.07.24(수) 부터\r\n\r\n○ 중단 내용 : \r\n\r\n- 해피머니 결제 서비스 이용 중단\r\n\r\n- 해피머니를 이용한 교보캐시 및 교보이캐시 충전/조회 서비스 이용 중단\r\n\r\n \r\n\r\n이용에 불편을 드려 죄송합니다.\r\n\r\n\r\n감사합니다.','',2,'2025-08-20'),(7,'배송라운지 서비스 종료 안내','안녕하세요.\r\n\r\nBook#에서 주문 후 2일 이상 배송이 늦어지는 주문에 대해\r\nsam 무제한 3일 이용권과 e캐시를 제공하던 배송라운지 서비스가\r\n10월 사이트 리뉴얼 오픈 시 종료될 예정입니다.\r\n\r\n▶ 종료 일정 : 2022년 10월 8일까지 제공\r\n\r\n서비스 종료(2022년 10월 8일) 이전에 등록 한 sam 이용권과 다운로드 받은 도서는\r\n유효기간 동안 정상적으로 이용이 가능하니 참고해 주세요.\r\n\r\nBook#를 애용해 주셔서 감사합니다.','',0,'2025-09-03'),(8,'11pay 결제 서비스 계약 종료 안내','안녕하세요. \r\n\r\n언제나 Book#을 사랑해주시는 고객님께 진심으로 감사드리며,\r\n11pay 결제 서비스가 계약 종료 됨에 따라 11pay 결제수단 사용이 불가하게 되어 안내 드립니다.\r\n\r\n------------------------------------------------------------------------\r\n\r\n○서비스 종료 내용\r\n  - 11pay 결제수단 \r\n\r\n○서비스 종료 일자\r\n  - 2024년 10월 1일(화)부터\r\n\r\n------------------------------------------------------------------------\r\n\r\nBook#에서는 앞으로도 더 좋은 서비스를 제공해 드리기 위해 최선을 다하겠습니다.\r\n서비스 종료로 불편을 드린 점 깊이 양해의 말씀 드립니다.\r\n\r\n감사합니다.','',0,'2025-09-03'),(9,'신한 SOL페이 멤버십 서비스 종료','안녕하세요. \r\n\r\n언제나 Book#를 사랑해주시는 고객님께 진심으로 감사드리며,\r\n신한 SOL페이 멤버십 연동 서비스가 계약 종료 됨에 따라 신한 SOL페이 멤버십 서비스 사용이 불가하게 되어 안내 드립니다.\r\n\r\n------------------------------------------------------------------------\r\n\r\n○서비스 종료 내용\r\n  - 신한 SOL페이 멤버십 연동 서비스\r\n\r\n○서비스 종료 일자\r\n  - 2024년 10월 1일(화)부터\r\n\r\n------------------------------------------------------------------------\r\n\r\nBook#에서는 앞으로도 더 좋은 서비스를 제공해 드리기 위해 최선을 다하겠습니다.\r\n\r\n서비스 종료로 불편을 드린 점 깊이 양해의 말씀 드립니다.\r\n\r\n감사합니다.','',0,'2025-09-03'),(10,'마일리지 통합포인트 전환 안내','안녕하세요.\r\n\r\n2025년 2월 3일부터 고객님께서 보유하고 계신 마일리지가 통합포인트로 일괄 전환됨을 안내드립니다.​\r\n\r\n통합포인트 전환 후에도 고객님의 혜택은 그대로 유지되며,​\r\n별도의 전환 절차 없이 온라인과 매장 어디에서나 바로 사용할 수 있습니다.​\r\n\r\n\r\n마일리지 → 통합포인트 전환 정보​\r\nㆍ전환 예정일 : 2025년 2월 3일​\r\nㆍ전환 예정금액 : 보유하신 마일리지 전액​\r\nㆍ유효기간 : 2026년 2월 28일까지​\r\n\r\n※ ‘전환 예정금액’은 실제 금액과 차이가 발생할 수 있습니다.​\r\n\r\n\r\n안내사항​\r\n∙ \'마일리지\'는 2012년 10월까지 적립된 포인트입니다.​\r\n∙ \'통합포인트\'는 2012년 11월부터 적립/사용 중인 포인트입니다.​\r\n∙ 마일리지에서 통합포인트로 전환되는 비율은 1:1로 동일한 가치입니다.​\r\n∙ 마일리지가 통합포인트로 전환되기 7일 전에는 온라인과 매장에서 마일리지 사용이 불가합니다.​\r\n (사용 불가 기간: 2025.01.27~2025.02.02)​\r\n∙ 이후, 기존 마일리지로 결제한 상품을 반품하는 경우, 마일리지가 아닌 통합포인트로 재적립됩니다.​\r\n​\r\n\r\n감사합니다.','',0,'2025-09-03'),(11,'기프트카드 지급보증보험 가입에 대한 고지','안녕하세요. 꿈을 키우는 세상 교보문고 입니다.\r\n\r\n \r\n\r\n교보문고 기프트카드 서비스를 이용해 주시는 고객님께 감사드립니다. \r\n\r\n전자상거래 등에서의 소비자 보호에 관한 법률 시행규칙(약칭 :전자상거래법 시행규칙)의 제6조 2항에 의거하여,\r\n\r\n아래와 같이 교보문고 기프트카드에 대한 지급 보증보험 가입내용을 고지합니다. \r\n\r\n교보문고 기프트카드 이용에 참고 바랍니다. \r\n\r\n \r\n\r\n교보문고는 고객님의 소비자권리 보호를 위해 최선을 다하고 있으며,\r\n\r\n앞으로도 더욱 좋은 서비스를 위해 노력하겠습니다.\r\n\r\n감사합니다.','기프트카드 보험증권.jpg.TXT',0,'2025-09-03'),(12,'미국행 해외 배송 안내','안녕하세요.\r\n\r\n2025년 8월 29일(미국 현지 기준)부터 기존의 $800 미만 소액면세 제도(de minimis)가 폐지됩니다. \r\n(8월 27일 출고분까지만 소액면세 제도 적용)\r\n \r\n따라서 모든 물품은 정식 통관 대상이 되며, 세금(관세/Duty)이 발생할 수 있습니다. \r\n책의 기본 세율은 0% 이나, 한국산 물품에는 상호관세 15%가 적용됩니다.  \r\n(예: 10만원 상당의 책의 경우 약 15,000원 관세 발생)\r\n\r\n◆ 달라지는 점\r\n 1. 모든 물품 정식 통관\r\n 2. 수령인의 이메일 주소 입력 필수\r\n\r\n원활한 통관 및 배송을 위해 반드시 수령인의 이메일 주소 정보를 입력해 주시길 바랍니다. \r\n\r\n감사합니다.','',0,'2025-09-03');
/*!40000 ALTER TABLE `notice` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-09-03 16:58:49
