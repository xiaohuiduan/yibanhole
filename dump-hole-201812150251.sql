-- MySQL dump 10.13  Distrib 8.0.13, for Linux (x86_64)
--
-- Host: localhost    Database: hole
-- ------------------------------------------------------
-- Server version	8.0.13

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8mb4 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `secret`
--

DROP TABLE IF EXISTS `secret`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secret` (
  `secret_id` bigint(20) NOT NULL COMMENT '消息的数据库内的ID，为时间戳',
  `secret_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '消息内容',
  `yiban_id` varchar(8) NOT NULL COMMENT '发布者易班的id',
  `promulgator` varchar(30) NOT NULL COMMENT '发布者的名字',
  `label` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '标签',
  `secret_date` date NOT NULL COMMENT '秘密时间',
  `content_analyse` varchar(100) DEFAULT NULL COMMENT '内容情绪分析',
  PRIMARY KEY (`secret_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret`
--

LOCK TABLES `secret` WRITE;
/*!40000 ALTER TABLE `secret` DISABLE KEYS */;
/*!40000 ALTER TABLE `secret` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_comment`
--

DROP TABLE IF EXISTS `secret_comment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secret_comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment_content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '评论内容',
  `comment_name` varchar(100) NOT NULL COMMENT '评论名字',
  `secret_id` varchar(100) NOT NULL COMMENT '秘密id',
  `comment_date` datetime NOT NULL COMMENT '时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_comment`
--

LOCK TABLES `secret_comment` WRITE;
/*!40000 ALTER TABLE `secret_comment` DISABLE KEYS */;
INSERT INTO `secret_comment` VALUES (4,'N號','易班技术部','1544452465709','2018-12-13 08:38:13'),(5,'额嗯','易班技术部','1544460010090','2018-12-13 09:35:11'),(6,'你好呀','易班技术部','1544460010090','2018-12-13 09:41:39'),(7,'你好呀','易班技术部','1544460010090','2018-12-13 09:42:44'),(8,'你好呀','易班技术部','1544460010090','2018-12-13 09:44:32'),(9,'期望是','易班技术部','1544460010090','2018-12-13 09:44:43'),(10,'sjfl jl','易班技术部','1544460010090','2018-12-13 09:45:59'),(11,'妈耶','易班技术部','1544460010090','2018-12-13 09:47:04');
/*!40000 ALTER TABLE `secret_comment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `secret_like`
--

DROP TABLE IF EXISTS `secret_like`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `secret_like` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'id',
  `secret_id` bigint(20) NOT NULL COMMENT '秘密的id',
  `yiban_id` varchar(8) NOT NULL COMMENT '易班Id',
  PRIMARY KEY (`id`),
  UNIQUE KEY `secret_like_UN` (`secret_id`,`yiban_id`)
) ENGINE=InnoDB AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `secret_like`
--

LOCK TABLES `secret_like` WRITE;
/*!40000 ALTER TABLE `secret_like` DISABLE KEYS */;
INSERT INTO `secret_like` VALUES (56,1544460010090,'16906854'),(62,1544460010090,'16906855'),(58,1544716103301,'16906854'),(64,1544724310626,'16906854');
/*!40000 ALTER TABLE `secret_like` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'hole'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-12-15  2:51:55
