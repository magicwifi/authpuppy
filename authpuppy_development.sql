-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (i686)
--
-- Host: localhost    Database: authpuppy_development
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `access_nodes`
--

DROP TABLE IF EXISTS `access_nodes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_nodes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `sys_uptime` int(11) DEFAULT NULL,
  `sys_upload` int(11) DEFAULT NULL,
  `sys_memfree` int(11) DEFAULT NULL,
  `remote_addr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  `last_seen` datetime DEFAULT NULL,
  `redirect_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portal_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `configflag` tinyint(1) DEFAULT '0',
  `cmdline` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `time_limit` int(11) DEFAULT NULL,
  `lat` float DEFAULT '32.0266',
  `long` float DEFAULT '118.788',
  `developer` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `cmdflag` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `index_access_nodes_on_mac` (`mac`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_nodes`
--

LOCK TABLES `access_nodes` WRITE;
/*!40000 ALTER TABLE `access_nodes` DISABLE KEYS */;
INSERT INTO `access_nodes` VALUES (3,'huangzhe1','123456789012',NULL,NULL,NULL,NULL,NULL,NULL,'','','2014-03-02 08:39:43','2014-03-16 18:55:48',0,'',NULL,32.0266,118.788,NULL,1),(6,'mercurytest','A8574EFCCBE0',NULL,NULL,NULL,'219.142.69.76',NULL,'2014-05-06 13:58:06','http://218.94.58.242/xweicms/ctwifi/busi/lwcoffee/lwcoffee?apid=29','http://218.94.58.242/xweicms/ctwifi/busi/cqt/cqtwelcome.jsp?apid=30','2014-03-02 10:26:02','2014-05-07 20:50:23',1,'reboot',120,32.0266,118.788,NULL,0),(7,'mercuryI','6CE873FCCAA2',1450,0,102684,'202.102.120.110',122,'2014-03-26 11:00:35','http://218.94.58.242/xweicms/ctwifi/busi/jsccbbank/bymobilelogin.jsp?apid=2','http://218.94.58.242/xweicms/ctwifi/busi/jsccbbank/mobilewelcome.jsp?apid=2','2014-03-03 01:40:58','2014-03-26 11:00:35',0,'240',240,40.0569,116.308,NULL,1),(8,'cloudbox','002293AABBC1',459,1,328772,'58.211.149.45',6227011,'2014-03-04 05:43:49','','','2014-03-03 01:56:12','2014-03-16 18:56:29',0,'reboot',NULL,32.0266,118.788,NULL,1),(9,'leike','000000005182',58851,0,91136,'222.212.244.184',57479,'2014-03-04 01:48:24','','','2014-03-03 08:31:19','2014-03-16 18:56:38',0,NULL,NULL,32.0266,118.788,NULL,1),(10,'leke','048D38264C60',389,0,94040,'202.102.120.110',1394532107,'2014-03-11 18:02:15','http://218.94.58.242/xweicms/ctwifi/busi/jsccbbank/mobilelogin.jsp?apid=2','http://218.94.58.242/xweicms/ctwifi/busi/jsccbbank/mobilewelcome.jsp?apid=2','2014-03-11 17:22:11','2014-03-16 18:56:46',0,NULL,NULL,32.0266,118.788,NULL,1),(29,'xiaowei1','AABBCCDDEEFF',NULL,NULL,NULL,NULL,NULL,NULL,'http://ww.sina.com','http://baidu.com','2014-03-20 23:04:44','2014-03-24 16:22:16',1,'240',NULL,32.0266,118.788,NULL,1),(30,'xiaowei2','112233445566',NULL,NULL,NULL,NULL,NULL,NULL,'baidu.com','http://www.sina.com','2014-03-20 23:04:44','2014-03-20 23:04:44',0,NULL,NULL,32.0266,118.788,NULL,1),(31,'xiaowei3','334455667788',NULL,NULL,NULL,NULL,NULL,NULL,'xxxx','www.sohu.com','2014-03-20 23:04:44','2014-03-20 23:04:44',0,NULL,NULL,32.0266,118.788,NULL,1),(32,'ctbri-open','A8574EFCCBCB',602,0,102832,'219.142.69.75',363,'2014-04-08 13:55:43',NULL,NULL,'2014-04-04 15:03:48','2014-04-08 13:55:43',0,NULL,NULL,32.0266,118.788,NULL,1),(34,'test2','223344556677',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-04-17 22:39:35','2014-04-17 22:39:35',0,NULL,NULL,32.0266,118.788,NULL,1),(37,'test4','223344556678',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'2014-04-17 23:23:50','2014-04-22 18:07:44',1,'wdctl restart',NULL,32.0266,118.788,NULL,1),(38,'ctbri1','A8574EFCCBE1',NULL,NULL,NULL,NULL,NULL,NULL,'http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-login.jsp?apid=29','http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-wel.jsp?apid=29','2014-04-17 23:26:31','2014-04-17 23:26:31',0,NULL,NULL,32.0266,118.788,NULL,1),(39,'ctbri2','6CE873FCCAA3',NULL,NULL,NULL,NULL,NULL,NULL,'http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-login.jsp?apid=29','http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-wel.jsp?apid=29','2014-04-17 23:26:31','2014-04-17 23:26:31',0,NULL,NULL,32.0266,118.788,NULL,1),(59,'netcore','048D38264D08',NULL,NULL,NULL,NULL,NULL,NULL,'http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-login.jsp?apid=29','http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-wel.jsp?apid=29','2014-05-07 23:13:42','2014-05-07 23:13:42',0,NULL,NULL,32.0266,118.788,'xweiuser',NULL),(60,'ctbri6','6CE873FCCAA8',NULL,NULL,NULL,NULL,NULL,NULL,'http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-login.jsp?apid=29','http://218.94.58.242/xweicms/ctwifi/busi/jingchanhe/jingchanhe-wel.jsp?apid=29','2014-05-07 23:13:42','2014-05-07 23:13:42',0,NULL,NULL,32.0266,118.788,'xweiuser',NULL);
/*!40000 ALTER TABLE `access_nodes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `access_nods`
--

DROP TABLE IF EXISTS `access_nods`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `access_nods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `redirect_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portal_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `access_nods`
--

LOCK TABLES `access_nods` WRITE;
/*!40000 ALTER TABLE `access_nods` DISABLE KEYS */;
/*!40000 ALTER TABLE `access_nods` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `admins`
--

DROP TABLE IF EXISTS `admins`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admins` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admins`
--

LOCK TABLES `admins` WRITE;
/*!40000 ALTER TABLE `admins` DISABLE KEYS */;
INSERT INTO `admins` VALUES (1,'admin','$2a$10$f/AQxAuQ9nZrbMBUNrLoZ.RPuWd1y8AaSQAJDZHtd7DPMDbvjBpcu','2014-03-06 15:45:06','2014-03-06 15:45:06','dsfZSReoa_b7kUG1xCc-9w');
/*!40000 ALTER TABLE `admins` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auths`
--

DROP TABLE IF EXISTS `auths`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auths` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `auth_type` varchar(255) COLLATE utf8_unicode_ci DEFAULT 'radius',
  `auth_device` tinyint(1) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_node_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auths`
--

LOCK TABLES `auths` WRITE;
/*!40000 ALTER TABLE `auths` DISABLE KEYS */;
INSERT INTO `auths` VALUES (21,'local',1,'2014-03-17 21:48:48','2014-03-19 22:37:52',1),(31,'radius',0,'2014-03-19 22:45:20','2014-03-25 11:26:14',7),(33,NULL,NULL,'2014-03-25 08:18:56','2014-03-25 08:18:56',33),(34,NULL,NULL,'2014-03-25 08:18:56','2014-03-25 08:18:56',34),(35,NULL,NULL,'2014-03-25 08:18:56','2014-03-25 08:18:56',35),(36,NULL,NULL,'2014-03-25 08:18:56','2014-03-25 08:18:56',36),(37,'radius',0,'2014-03-25 08:25:21','2014-03-25 08:25:21',37),(38,'radius',0,'2014-03-25 08:25:21','2014-03-25 08:25:21',38),(39,'radius',0,'2014-03-25 08:25:21','2014-03-25 08:25:21',39),(40,'radius',0,'2014-03-25 08:25:21','2014-03-25 08:25:21',40),(41,'radius',0,'2014-03-25 08:25:21','2014-03-25 08:25:21',41),(43,'radius',0,'2014-04-04 15:04:56','2014-04-04 15:04:56',32),(44,'local',0,'2014-04-04 16:12:56','2014-05-07 23:19:32',6),(45,'radius',0,'2014-04-17 23:21:51','2014-04-17 23:21:51',NULL),(46,'radius',0,'2014-04-17 23:26:31','2014-04-17 23:26:31',38),(47,'radius',0,'2014-04-17 23:26:31','2014-04-17 23:26:31',39),(48,'radius',0,'2014-04-23 16:13:54','2014-04-23 16:13:54',40),(49,'radius',0,'2014-04-23 16:13:54','2014-04-23 16:13:54',41),(50,'radius',0,'2014-04-23 16:54:09','2014-04-23 16:54:09',42),(51,'radius',0,'2014-04-23 16:54:09','2014-04-23 16:54:09',43),(52,'radius',0,'2014-04-29 18:22:23','2014-04-29 18:22:23',44),(53,'radius',0,'2014-04-29 18:22:23','2014-04-29 18:22:23',45),(54,'radius',0,'2014-05-07 09:23:02','2014-05-07 09:23:02',46),(55,'radius',0,'2014-05-07 09:23:02','2014-05-07 09:23:02',47),(57,'radius',0,'2014-05-07 13:02:53','2014-05-07 13:02:53',49),(58,'radius',0,'2014-05-07 13:02:53','2014-05-07 13:02:53',50),(59,'radius',0,'2014-05-07 13:44:14','2014-05-07 13:44:14',51),(60,'radius',0,'2014-05-07 13:44:14','2014-05-07 13:44:14',52),(61,'radius',0,'2014-05-07 13:48:00','2014-05-07 13:48:00',53),(62,'radius',0,'2014-05-07 13:48:00','2014-05-07 13:48:00',54),(63,'radius',NULL,'2014-05-07 14:16:18','2014-05-07 20:41:49',55),(64,'radius',0,'2014-05-07 14:16:18','2014-05-07 14:16:18',56),(65,'radius',0,'2014-05-07 23:09:15','2014-05-07 23:09:15',57),(66,'radius',0,'2014-05-07 23:09:15','2014-05-07 23:09:15',58),(67,'radius',NULL,'2014-05-07 23:13:42','2014-05-07 23:14:15',59),(68,'radius',0,'2014-05-07 23:13:42','2014-05-07 23:13:42',60);
/*!40000 ALTER TABLE `auths` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `black_macs`
--

DROP TABLE IF EXISTS `black_macs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `black_macs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_node_id` int(11) DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `black_macs`
--

LOCK TABLES `black_macs` WRITE;
/*!40000 ALTER TABLE `black_macs` DISABLE KEYS */;
INSERT INTO `black_macs` VALUES (14,38,'11:22:33:44:55:66','2014-04-24 10:53:11','2014-04-24 10:53:11'),(15,6,'11:22:33:44:55:66','2014-04-24 10:54:07','2014-04-24 10:54:07');
/*!40000 ALTER TABLE `black_macs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `confs`
--

DROP TABLE IF EXISTS `confs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `confs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `checkinterval` int(11) DEFAULT '60',
  `authinterval` int(11) DEFAULT '120',
  `clienttimeout` int(11) DEFAULT '5',
  `httpmaxconn` int(11) DEFAULT '10',
  `access_node_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `confs`
--

LOCK TABLES `confs` WRITE;
/*!40000 ALTER TABLE `confs` DISABLE KEYS */;
INSERT INTO `confs` VALUES (2,60,60,5,5,6,'2014-04-14 18:12:22','2014-04-22 17:16:07'),(3,60,120,5,10,40,'2014-04-23 16:13:54','2014-04-23 16:13:54'),(4,60,120,5,10,41,'2014-04-23 16:13:54','2014-04-23 16:13:54'),(5,60,120,5,10,42,'2014-04-23 16:54:09','2014-04-23 16:54:09'),(6,60,120,5,10,43,'2014-04-23 16:54:09','2014-04-23 16:54:09'),(7,60,120,5,10,44,'2014-04-29 18:22:23','2014-04-29 18:22:23'),(8,60,120,5,10,45,'2014-04-29 18:22:23','2014-04-29 18:22:23'),(9,60,120,5,10,46,'2014-05-07 09:23:02','2014-05-07 09:23:02'),(10,60,120,5,10,47,'2014-05-07 09:23:02','2014-05-07 09:23:02'),(12,60,120,5,10,49,'2014-05-07 13:02:53','2014-05-07 13:02:53'),(13,60,120,5,10,50,'2014-05-07 13:02:53','2014-05-07 13:02:53'),(14,60,120,5,10,51,'2014-05-07 13:44:14','2014-05-07 13:44:14'),(15,60,120,5,10,52,'2014-05-07 13:44:14','2014-05-07 13:44:14'),(16,60,120,5,10,53,'2014-05-07 13:48:00','2014-05-07 13:48:00'),(17,60,120,5,10,54,'2014-05-07 13:48:00','2014-05-07 13:48:00'),(18,60,120,5,10,55,'2014-05-07 14:16:18','2014-05-07 14:16:18'),(19,60,120,5,10,56,'2014-05-07 14:16:18','2014-05-07 14:16:18'),(20,60,120,5,10,57,'2014-05-07 23:09:15','2014-05-07 23:09:15'),(21,60,120,5,10,58,'2014-05-07 23:09:15','2014-05-07 23:09:15'),(22,60,120,5,10,59,'2014-05-07 23:13:42','2014-05-07 23:13:42'),(23,60,120,5,10,60,'2014-05-07 23:13:42','2014-05-07 23:13:42');
/*!40000 ALTER TABLE `confs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `connections` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ipaddr` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `access_mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `used_on` datetime DEFAULT NULL,
  `expired_on` datetime DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `incoming` int(11) DEFAULT '0',
  `outgoing` int(11) DEFAULT '0',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `access_node_id` int(11) DEFAULT NULL,
  `device` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `portal_url` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `phonenum` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=194 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
INSERT INTO `connections` VALUES (45,'nyvK5qd1qo1RbT8Npllxzg','192.168.42.186','A8574EFCCBE0','2014-03-05 08:16:02','2014-03-05 08:17:02','00:26:c7:70:5c:c2',2555023,352133,'2014-03-05 08:16:02','2014-03-05 08:16:54',6,'(windows nt 6.1)','http://zhihu.com/',NULL),(46,'W6AKzSSYCZJhJqKlurff7w','192.168.42.186','A8574EFCCBE0','2014-03-05 08:18:35','2014-03-05 08:19:35','00:26:c7:70:5c:c2',102835,38704,'2014-03-05 08:18:35','2014-03-05 08:18:54',6,'(windows nt 6.1)','http://www.sohu.com/',NULL),(47,'YhSl3AK4dDTdeDyg6NKZbA','192.168.42.186','A8574EFCCBE0','2014-03-05 08:23:30','2014-03-05 08:24:30','00:26:c7:70:5c:c2',43949,15365,'2014-03-05 08:23:30','2014-03-05 08:24:21',6,'(windows nt 6.1)','http://www.hupu.com/',NULL),(48,'stOaTk4CjOp_kHKLbaXNoQ','192.168.42.131','A8574EFCCBE0','2014-03-05 08:33:22','2014-03-05 08:38:22','98:d6:f7:8a:77:03',1060457,138974,'2014-03-05 08:33:22','2014-03-05 08:38:11',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(51,'9XanklaXP1k3PRI9_rXJSg','192.168.42.131','A8574EFCCBE0','2014-03-05 13:24:08','2014-03-05 13:32:47','98:d6:f7:8a:77:03',61681,43688,'2014-03-05 13:24:08','2014-03-05 13:32:47',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(52,'Sp-G_hOwFHhzXpY3X2acBQ','192.168.42.131','A8574EFCCBE0','2014-03-05 13:31:22','2014-03-05 13:36:21','98:d6:f7:8a:77:03',754357,158854,'2014-03-05 13:31:21','2014-03-05 13:36:12',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(53,'rZqEAvQlI9VwSLujyN0Ntw','192.168.42.131','A8574EFCCBE0','2014-03-05 13:41:44','2014-03-05 13:42:29','98:d6:f7:8a:77:03',10890,4824,'2014-03-05 13:41:38','2014-03-05 13:42:29',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(54,'KUWjo93_RVxkcxfFeD3s8A','192.168.42.131','6CE873FCCAA2','2014-03-05 17:02:47','2014-03-05 17:07:47','98:d6:f7:8a:77:03',31871,29509,'2014-03-05 17:02:47','2014-03-05 17:06:00',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://bbs.hupu.com/',NULL),(55,'MWbfdqUqmJixh4i9fCakoA','192.168.42.186','6CE873FCCAA2','2014-03-05 17:05:50','2014-03-05 17:10:50','00:26:c7:70:5c:c2',102047,35167,'2014-03-05 17:05:50','2014-03-05 17:06:01',7,'(windows nt 6.1)','http://www.baidu.com/',NULL),(56,'5rC79c5XzJpwmYzSdovKmw','192.168.42.131','A8574EFCCBE0','2014-03-05 21:04:35','2014-03-05 21:09:35','98:d6:f7:8a:77:03',28910,20973,'2014-03-05 21:04:35','2014-03-05 21:04:51',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(58,'_bgDVSYnWoZw3jugTtNDJA','192.168.42.131','A8574EFCCBE0','2014-03-05 22:14:33','2014-03-05 22:19:33','98:d6:f7:8a:77:03',92934,63272,'2014-03-05 22:14:33','2014-03-05 22:15:49',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','http://www.baidu.com/',NULL),(59,'bXFGy_L3okQeJflBRHfkBw','192.168.42.186','A8574EFCCBE0','2014-03-05 22:15:44','2014-03-05 22:20:44','00:26:c7:70:5c:c2',35609,34162,'2014-03-05 22:15:44','2014-03-05 22:15:49',6,'(windows nt 6.1)','http://www.baidu.com/',NULL),(60,'ETjzNtlZMokmseSxknPnQw','192.168.42.186','6CE873FCCAA2','2014-03-06 11:41:43','2014-03-06 11:46:42','00:26:c7:70:5c:c2',174957,78326,'2014-03-06 11:41:42','2014-03-06 11:42:11',7,'(windows nt 6.1)','http://www.baidu.com/',NULL),(61,'bOoeHgko5w2RipBrlzU0WQ','192.168.42.186','6CE873FCCAA2','2014-03-06 11:44:35','2014-03-06 11:49:34','00:26:c7:70:5c:c2',6329026,975655,'2014-03-06 11:44:34','2014-03-06 11:48:57',7,'(windows nt 6.1)','http://www.baidu.com/',NULL),(62,'a8_LRt6iPZwrDnUOpTgxqQ','192.168.42.186','6CE873FCCAA2','2014-03-06 12:01:31','2014-03-06 12:06:31','00:26:c7:70:5c:c2',98286,56357,'2014-03-06 12:01:31','2014-03-06 12:02:07',7,'(windows nt 6.1)','http://www.baidu.com/',NULL),(63,'nLxEketInnjZbmLmvFSjkA','192.168.42.186','6CE873FCCAA2','2014-03-06 12:04:11','2014-03-06 12:06:50','00:26:c7:70:5c:c2',152035,109915,'2014-03-06 12:04:11','2014-03-06 12:06:50',7,'(windows nt 6.1)','http://sohu.com/',NULL),(68,'l9s2k5n2q5m0cAMvj39Jlg','192.168.42.133','6CE873FCCAA2','2014-03-07 09:57:08','2014-03-07 10:02:08','e0:06:e6:c3:8f:19',3881743,679877,'2014-03-07 09:57:08','2014-03-07 10:02:03',7,'uknown device','null',NULL),(70,'vIt9uqNOQ_Pq0mkkQOfjkw','192.168.42.131','6CE873FCCAA2','2014-03-07 14:36:25','2014-03-07 14:41:20','98:d6:f7:8a:77:03',83920,18829,'2014-03-07 14:36:20','2014-03-07 14:36:42',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(73,'ZIebQAoT7N1FfR8NFdFP7A','192.168.42.131','6CE873FCCAA2','2014-03-07 15:38:39','2014-03-07 15:43:39','98:d6:f7:8a:77:03',10446,5058,'2014-03-07 15:38:39','2014-03-07 15:39:21',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(81,'vNU_nZ1AsvyLarEQMvRZPg','192.168.42.131','6CE873FCCAA2','2014-03-07 18:01:00','2014-03-07 18:04:05','98:d6:f7:8a:77:03',19158,16301,'2014-03-07 18:00:59','2014-03-07 18:04:05',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(82,'JtSIM-Juo_RsvvEYKJRchQ','192.168.42.131','6CE873FCCAA2','2014-03-07 18:03:43','2014-03-07 18:04:40','98:d6:f7:8a:77:03',11043,6003,'2014-03-07 18:03:43','2014-03-07 18:04:40',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(83,'d4WsLvCqBDP5WMO_JNqmcg','192.168.42.131','6CE873FCCAA2','2014-03-11 17:43:15','2014-03-11 17:48:15','98:d6:f7:8a:77:03',38114,28545,'2014-03-11 17:43:15','2014-03-11 17:43:32',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(84,'7_uGtWsxszHx4DJyscZCTg','192.168.42.131','6CE873FCCAA2','2014-03-12 13:26:11','2014-03-12 13:31:11','98:d6:f7:8a:77:03',178972,85059,'2014-03-12 13:26:11','2014-03-12 13:27:44',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(85,'yTtubiUPAv0rNRN4Vx9AQA','192.168.42.131','6CE873FCCAA2','2014-03-12 13:49:27','2014-03-12 13:50:06','98:d6:f7:8a:77:03',64556,35182,'2014-03-12 13:49:27','2014-03-12 13:50:06',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(86,'ss75zAvZ-56XrSM8ii6UBw','192.168.1.2','048D38264CD8','2014-03-12 16:03:07','2014-03-12 16:08:36','00:80:0f:95:04:5a',0,0,'2014-03-12 16:03:07','2014-03-12 16:08:36',11,'(macintosh; intel mac os x 10_9_1)','null',NULL),(87,'KJWWhcil4RMwnzBPVNOpUA','192.168.1.4','048D38264CD8','2014-03-12 16:05:17','2014-03-12 16:10:35','a0:f4:19:89:3c:61',0,0,'2014-03-12 16:05:16','2014-03-12 16:10:35',11,'uknown device','null',NULL),(88,'J5IDI92OQ-13Knc4jlInfQ','192.168.42.131','6CE873FCCAA2','2014-03-12 16:45:39','2014-03-12 16:50:39','98:d6:f7:8a:77:03',63279,51318,'2014-03-12 16:45:39','2014-03-12 16:47:15',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(89,'K5xfL0h2I4vTnlVPYr2ZNg','192.168.42.131','6CE873FCCAA2','2014-03-12 17:32:25','2014-03-12 17:37:24','98:d6:f7:8a:77:03',59538,49049,'2014-03-12 17:32:24','2014-03-12 17:34:47',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(90,'Qoil015CHmeafDdUFOJnvQ','192.168.42.131','6CE873FCCAA2','2014-03-12 17:38:14','2014-03-12 17:43:13','98:d6:f7:8a:77:03',49277,38059,'2014-03-12 17:38:13','2014-03-12 17:42:24',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(91,'K0xSBn13R-3CHx2oKy7g8A','192.168.1.2','048D38264CD8','2014-03-12 17:46:02','2014-03-12 17:51:02','00:80:0f:95:04:5a',0,0,'2014-03-12 17:46:02','2014-03-12 17:47:00',11,'(macintosh; intel mac os x 10_9_1)','null',NULL),(92,'E9nBIFzYo1eDCtPU5f-4iQ','192.168.42.131','A8574EFCCBE0','2014-03-12 21:24:41','2014-03-12 21:29:41','98:d6:f7:8a:77:03',90067,46282,'2014-03-12 21:24:41','2014-03-12 21:25:06',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(93,'zwvHof10VxIf7NytHXKkFQ','192.168.42.186','A8574EFCCBE0','2014-03-12 23:34:24','2014-03-12 23:39:24','00:26:c7:70:5c:c2',406713,1034070,'2014-03-12 23:34:24','2014-03-12 23:38:31',6,'(windows nt 6.1)','null',NULL),(94,'_PJdcCGIi44wxMbFecDbAw','192.168.42.131','6CE873FCCAA2','2014-03-13 09:41:08','2014-03-13 09:46:07','98:d6:f7:8a:77:03',814698,61586,'2014-03-13 09:41:07','2014-03-13 09:41:33',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(95,'EY46cp-MKZPTibRLLx8Ixg','192.168.42.131','6CE873FCCAA2','2014-03-13 10:05:46','2014-03-13 10:06:54','98:d6:f7:8a:77:03',139935,67998,'2014-03-13 10:05:46','2014-03-13 10:06:54',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(96,'u18ommZ8TZp6foRIsVl_-Q','192.168.42.131','6CE873FCCAA2','2014-03-13 10:15:20','2014-03-13 10:16:30','98:d6:f7:8a:77:03',32632,21297,'2014-03-13 10:15:19','2014-03-13 10:16:30',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(97,'vyznhpndpE9Nq0KhPmdb7w','192.168.42.131','6CE873FCCAA2','2014-03-13 10:25:45','2014-03-13 10:27:50','98:d6:f7:8a:77:03',18935,10432,'2014-03-13 10:25:45','2014-03-13 10:27:50',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',NULL),(98,'Ltpl_vwiCKlq_Q5LXPIbwA','192.168.42.186','6CE873FCCAA2','2014-03-13 14:37:44','2014-03-13 14:38:59','00:26:c7:70:5c:c2',105223,53352,'2014-03-13 14:37:43','2014-03-13 14:38:59',7,'(windows nt 6.1)','null','18611976286'),(99,'oI9rXr2AG6IUkiPU0DmLyg','192.168.42.186','6CE873FCCAA2','2014-03-13 15:10:05','2014-03-13 15:15:05','00:26:c7:70:5c:c2',336004,135010,'2014-03-13 15:10:05','2014-03-13 15:13:38',7,'(windows nt 6.1)','null','18611976286'),(100,'gRXF4o8jkisjhA9vozwzWg','192.168.42.186','6CE873FCCAA2','2014-03-13 16:59:00','2014-03-13 17:03:59','00:26:c7:70:5c:c2',436076,207592,'2014-03-13 16:58:59','2014-03-13 17:03:42',7,'(windows nt 6.1)','null','18611976286'),(101,'TtJQBs1vUnbY11Sn3ZcOOQ','192.168.42.245','6CE873FCCAA2','2014-03-13 17:04:40','2014-03-13 17:09:40','a4:17:31:f3:55:83',133802,12563,'2014-03-13 17:04:40','2014-03-13 17:06:42',7,'(windows nt 6.1)','null','18118999603'),(102,'ydtvhx8i8MKvFx4mlcXYCw','192.168.42.186','6CE873FCCAA2','2014-03-13 17:35:43','2014-03-13 17:40:43','00:26:c7:70:5c:c2',89283,38577,'2014-03-13 17:35:43','2014-03-13 17:36:46',7,'(windows nt 6.1)','null','18611976286'),(103,'Vrpnbpj79iQyd2tLRgfE9w','192.168.42.186','6CE873FCCAA2','2014-03-13 17:37:50','2014-03-13 17:42:50','00:26:c7:70:5c:c2',299827,212506,'2014-03-13 17:37:50','2014-03-13 17:42:30',7,'(windows nt 6.1)','null','18611976286'),(104,'rFYUYxLQyGbp_ASmf79NLA','192.168.42.152','6CE873FCCAA2','2014-03-13 18:20:29','2014-03-13 18:25:29','e8:99:c4:99:ab:8e',179460,66701,'2014-03-13 18:20:29','2014-03-13 18:22:35',7,'(linux; u; android 4.1.2; zh-cn; htc-802d/1.11.1401.2)','null','15301588014'),(105,'AsJNnnWjbor2UXyZKJblBA','192.168.42.186','A8574EFCCBE0','2014-03-13 22:49:54','2014-03-13 22:50:45','00:26:c7:70:5c:c2',122624,548334,'2014-03-13 22:49:54','2014-03-13 22:50:45',6,'(windows nt 6.1)','null','18611976286'),(106,'sg6x0PYEhxLpe4F9GR-_Aw','192.168.42.131','6CE873FCCAA2','2014-03-14 16:02:53','2014-03-14 16:04:28','98:d6:f7:8a:77:03',52313,50476,'2014-03-14 16:02:53','2014-03-14 16:04:28',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null','18611976286'),(107,'Zoy2VoSBTHdlxo7KXOUEcg','192.168.42.131','6CE873FCCAA2','2014-03-14 17:07:16','2014-03-14 17:12:15','98:d6:f7:8a:77:03',54291,27253,'2014-03-14 17:07:15','2014-03-14 17:08:19',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null','18611976286'),(108,'7OOp2Z_EW9ZGtP5uVdmIgA','192.168.42.186','6CE873FCCAA2','2014-03-14 17:09:46','2014-03-14 17:12:58','00:26:c7:70:5c:c2',373552,179422,'2014-03-14 17:09:46','2014-03-14 17:12:58',7,'(windows nt 6.1)','null','18611976286'),(109,'IPkXvJGxFrVUj1OJYn6wpA','192.168.42.186','6CE873FCCAA2','2014-03-14 17:17:15','2014-03-14 17:20:14','00:26:c7:70:5c:c2',414418,232094,'2014-03-14 17:17:15','2014-03-14 17:20:14',7,'(windows nt 6.1)','null','18611976286'),(111,'YMTMbe_AL61ND6rv9gobvA','192.168.42.186','6CE873FCCAA2','2014-03-14 17:24:05','2014-03-14 17:29:05','00:26:c7:70:5c:c2',726155,285233,'2014-03-14 17:24:05','2014-03-14 17:28:42',7,'(windows nt 6.1)','null','18611976286'),(113,'EUDSDwrH4iAi-ti6F0S_yw','192.168.42.186','6CE873FCCAA2','2014-03-14 17:31:39','2014-03-14 17:35:32','00:26:c7:70:5c:c2',2015732,450280,'2014-03-14 17:31:39','2014-03-14 17:35:32',7,'(windows nt 6.1)','null','18611976286'),(114,'execk4DgIbS2NFoGA3YsWw','192.168.42.186','6CE873FCCAA2','2014-03-14 17:36:05','2014-03-14 17:37:05','00:26:c7:70:5c:c2',459661,112032,'2014-03-14 17:36:05','2014-03-14 17:36:42',7,'(windows nt 6.1)','null','18611976286'),(115,'ZVd7P1F3vUUans2uIVZX7Q','192.168.42.186','6CE873FCCAA2','2014-03-14 17:38:20','2014-03-14 17:39:20','00:26:c7:70:5c:c2',547481,258521,'2014-03-14 17:38:20','2014-03-14 17:38:42',7,'(windows nt 6.1)','null','18611976286'),(116,'4AirT70Vgf-Cevr2wIsDsg','192.168.42.186','6CE873FCCAA2','2014-03-14 17:40:26','2014-03-14 17:41:26','00:26:c7:70:5c:c2',140592,102921,'2014-03-14 17:40:26','2014-03-14 17:40:42',7,'(windows nt 6.1)','null','18611976286'),(117,'s5tMDa6kQAUvmZsoAtPqVQ','192.168.42.186','6CE873FCCAA2','2014-03-14 17:42:10','2014-03-14 17:43:10','00:26:c7:70:5c:c2',168439,111467,'2014-03-14 17:42:10','2014-03-14 17:42:42',7,'(windows nt 6.1)','null','18611976286'),(118,'4f__zaL66HwUvgzvLEUJMQ','192.168.42.186','6CE873FCCAA2','2014-03-14 17:44:02','2014-03-14 17:45:02','00:26:c7:70:5c:c2',186223,144541,'2014-03-14 17:44:02','2014-03-14 17:44:42',7,'(windows nt 6.1)','null','18611976286'),(123,'PiMcMJ1sjSr1KBpdU7x2vg','192.168.42.186','A8574EFCCBE0','2014-03-17 15:48:57','2014-03-17 15:53:57','00:26:c7:70:5c:c2',655126,686527,'2014-03-17 15:48:57','2014-03-17 15:50:12',6,'(windows nt 6.1)','null','18611976286'),(124,'YVUWBRmuZZlfb-M970gHaw','192.168.42.186','A8574EFCCBE0','2014-03-17 16:08:37','2014-03-17 16:13:37','00:26:c7:70:5c:c2',98622,211835,'2014-03-17 16:08:37','2014-03-17 16:09:21',6,'(windows nt 6.1)','null','18611976286'),(125,'gl_iqzi6R4spOp6gnKRuCw','192.168.42.186','A8574EFCCBE0','2014-03-17 16:55:26','2014-03-17 16:57:13','00:26:c7:70:5c:c2',173172,1188261,'2014-03-17 16:55:25','2014-03-17 16:57:13',6,'(windows nt 6.1)','null','18611976286'),(126,'ncmrmAXUJ4O4QgSZ2Qiq3A','192.168.42.186','A8574EFCCBE0','2014-03-17 17:00:37','2014-03-17 17:16:02','00:26:c7:70:5c:c2',127622,900657,'2014-03-17 17:00:37','2014-03-17 17:16:02',6,'(windows nt 6.1)','null','18611976286'),(127,'3Y6X46M-orlO8ClAxOJOhw','192.168.42.186','A8574EFCCBE0','2014-03-17 17:29:18','2014-03-17 17:32:26','00:26:c7:70:5c:c2',139307,116594,'2014-03-17 17:29:17','2014-03-17 17:32:26',6,'(windows nt 6.1)','null','18611976286'),(128,'3reYcPmscarfYLWOtvfjGQ','192.168.42.186','A8574EFCCBE0','2014-03-17 17:35:27','2014-03-17 17:39:32','00:26:c7:70:5c:c2',343789,129872,'2014-03-17 17:35:27','2014-03-17 17:39:32',6,'(windows nt 6.1)','null','18611976286'),(131,'-2SarCIEhVsaEjETX_CF1w','192.168.42.186','A8574EFCCBE0','2014-03-17 22:53:55','2014-03-17 23:02:48','00:26:c7:70:5c:c2',52247,26106,'2014-03-17 22:53:54','2014-03-17 23:02:48',6,'(windows nt 6.1)','null','18611976286'),(132,'kV7huINPIn9TghoV9Hpg7A','192.168.42.186','6CE873FCCAA2','2014-03-18 10:54:55','2014-03-18 10:55:54','00:26:c7:70:5c:c2',66450,271847,'2014-03-18 10:54:54','2014-03-18 10:55:13',7,'(windows nt 6.1)','null','18611976286'),(133,'yVaLCDfM6P_WpLD4NaSM-Q','192.168.42.186','6CE873FCCAA2','2014-03-18 10:56:34','2014-03-18 10:57:34','00:26:c7:70:5c:c2',284047,6696334,'2014-03-18 10:56:34','2014-03-18 10:57:13',7,'(windows nt 6.1)','null','18611976286'),(135,'Pa3_ZLuwStMEjMR7GRiQVw','192.168.42.186','A8574EFCCBE0','2014-03-18 19:25:26','2014-03-18 20:25:26','00:26:c7:70:5c:c2',3389764,3640086,'2014-03-18 19:25:26','2014-03-18 19:31:29',6,'(windows nt 6.1)','null','18611976286'),(136,'g4tbI1Sn9OMuwvIJio5Wkw','192.168.42.186','A8574EFCCBE0','2014-03-19 17:34:49','2014-03-19 18:34:48','00:26:c7:70:5c:c2',328290,150522,'2014-03-19 17:34:48','2014-03-19 17:37:19',6,'(windows nt 6.1)','null','18611976286'),(137,'eQt-SMUXPpmm49S-mqyuFg','192.168.42.186','A8574EFCCBE0','2014-03-19 23:14:47','2014-03-20 00:14:47','00:26:c7:70:5c:c2',10934772,10548942,'2014-03-19 23:14:47','2014-03-19 23:45:09',6,'(windows nt 6.1)','null','18611976286'),(138,'2MjAWENvJnMH6m-Tt2tUiA','192.168.42.131','A8574EFCCBE0','2014-03-19 23:16:34','2014-03-20 00:16:34','98:d6:f7:8a:77:03',138341,86850,'2014-03-19 23:16:34','2014-03-19 23:45:09',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','null','18611976286'),(140,'xjGt5W6-KQuMDrsVJmknUA','192.168.42.186','A8574EFCCBE0','2014-03-22 17:20:41','2014-03-22 18:20:41','00:26:c7:70:5c:c2',631474,13923662,'2014-03-22 17:20:41','2014-03-22 17:23:52',6,'(windows nt 6.1)','null','18611976286'),(141,'Fr3vmk76VfHdr-atrcIkVg','192.168.42.186','A8574EFCCBE0','2014-03-23 11:38:29','2014-03-23 12:38:28','00:26:c7:70:5c:c2',1333763,1070208,'2014-03-23 11:38:28','2014-03-23 12:04:43',6,'(windows nt 6.1)','null','18611976286'),(142,'_9oPfaNM6TEt4_YnmPwzBg','192.168.42.186','A8574EFCCBE0','2014-03-23 16:50:40','2014-03-23 16:59:35','00:26:c7:70:5c:c2',1331307,2935580,'2014-03-23 16:50:40','2014-03-23 16:59:35',6,'(windows nt 6.1)','null','18611976286'),(143,'gPGT0Dn2zeJIGtXjVdXSUA','192.168.42.186','A8574EFCCBE0','2014-03-23 17:56:51','2014-03-23 18:56:50','00:26:c7:70:5c:c2',219955,141420,'2014-03-23 17:56:50','2014-03-23 18:02:32',6,'(windows nt 6.1)','null','18611976286'),(144,'KN6hLrM-81XL9aYchaBW4Q','192.168.42.131','A8574EFCCBE0','2014-03-23 17:57:35','2014-03-23 18:57:35','98:d6:f7:8a:77:03',69931,51979,'2014-03-23 17:57:35','2014-03-23 18:02:32',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','null','18611976286'),(145,'AFiEnFCf1w2ZfcQed7Tm4A','192.168.42.186','6CE873FCCAA2','2014-03-24 10:13:19','2014-03-24 11:13:14','00:26:c7:70:5c:c2',0,0,'2014-03-24 10:13:14','2014-03-24 10:13:19',7,'(windows nt 6.1)','null','18611976286'),(146,'JcWIzRwisnOuigemkc-iOw','192.168.42.131','6CE873FCCAA2','2014-03-24 10:15:01','2014-03-24 11:15:00','98:d6:f7:8a:77:03',0,0,'2014-03-24 10:15:00','2014-03-24 10:15:01',7,'(linux; android 4.4.2; nexus 4 build/kot49h)','null','18611976286'),(147,'HMM2NzmfDcXOdfV6nLoeIg','192.168.42.186','6CE873FCCAA2','2014-03-24 11:42:05','2014-03-24 12:42:05','00:26:c7:70:5c:c2',0,0,'2014-03-24 11:42:05','2014-03-24 11:42:05',7,'(windows nt 6.1)','null','18611976286'),(148,'z0dxf1oB6dxfNSbiNhK4WA','192.168.42.186','6CE873FCCAA2','2014-03-24 11:42:36','2014-03-24 12:42:35','00:26:c7:70:5c:c2',362067,386991,'2014-03-24 11:42:35','2014-03-24 11:44:23',7,'(windows nt 6.1)','null','18611976286'),(149,'Fadw-y_93AIRt44UbluFJg','192.168.42.186','6CE873FCCAA2','2014-03-24 17:24:08','2014-03-24 17:38:35','00:26:c7:70:5c:c2',615083,149368,'2014-03-24 17:24:08','2014-03-24 17:38:35',7,'(windows nt 6.1)','null','18611976286'),(157,'sUlW6CS9CU2FmMyXpQ4Psw','192.168.42.186','A8574EFCCBE0','2014-03-31 14:57:47','2014-03-31 15:57:46','00:26:c7:70:5c:c2',110746,24509,'2014-03-31 14:57:46','2014-03-31 14:58:13',6,'uknown device',NULL,NULL),(160,'2giFgsAQEbfOrmCcYL15Jg','192.168.42.186','A8574EFCCBE0','2014-03-31 15:02:18','2014-03-31 16:02:17','00:26:c7:70:5c:c2',230069,72392,'2014-03-31 15:02:17','2014-03-31 15:05:35',6,'uknown device',NULL,NULL),(161,'zWyVxVCkiSTtRGArgrWq-Q','192.168.42.186','A8574EFCCBE0','2014-04-04 16:16:57','2014-04-04 17:16:57','00:26:c7:70:5c:c2',336712,79710,'2014-04-04 16:16:57','2014-04-04 16:17:46',6,'(windows nt 6.1)','null',''),(162,'2Nmbvu8he0IpkYhM1dcbvg','192.168.42.186','A8574EFCCBE0','2014-04-08 11:30:35','2014-04-08 12:30:35','00:26:c7:70:5c:c2',233115,56860,'2014-04-08 11:30:35','2014-04-08 11:30:42',6,'(windows nt 6.1)','null',''),(163,'yyv6yHAbscdTEyQZis6Pvg','192.168.42.186','A8574EFCCBE0','2014-04-08 15:39:12','2014-04-08 15:40:35','00:26:c7:70:5c:c2',314835,63098,'2014-04-08 15:39:11','2014-04-08 15:40:35',6,'(windows nt 6.1)','null',''),(164,'iGb--k0Byflq6ErOJA76UA','192.168.42.186','A8574EFCCBE0','2014-04-09 13:33:02','2014-04-09 13:37:29','00:26:c7:70:5c:c2',388157,176548,'2014-04-09 13:32:56','2014-04-09 13:37:29',6,'(windows nt 6.1)','null',''),(165,'vUzPWPTulcuT7AN6l80ejw','192.168.42.186','A8574EFCCBE0','2014-04-11 10:00:25','2014-04-11 10:10:36','00:26:c7:70:5c:c2',454034,128215,'2014-04-11 10:00:24','2014-04-11 10:10:36',6,'(windows nt 6.1)','null',''),(166,'u-LPxOe6NoxpksxYueVrVw','192.168.42.186','A8574EFCCBE0','2014-04-11 15:30:35','2014-04-11 16:30:34','00:26:c7:70:5c:c2',390323,176745,'2014-04-11 15:30:34','2014-04-11 15:35:11',6,'(windows nt 6.1)','null',''),(167,'rhSfCraQ_uSVPmxYfbz4Gw','192.168.42.186','A8574EFCCBE0','2014-04-13 12:15:37','2014-04-13 13:15:36','00:26:c7:70:5c:c2',0,0,'2014-04-13 12:15:36','2014-04-13 12:15:37',6,'(windows nt 6.1)','null',''),(169,'z7UWLGLEkbSv4wwAYVEflg','192.168.42.186','A8574EFCCBE0','2014-04-13 12:16:33','2014-04-13 13:16:33','00:26:c7:70:5c:c2',0,0,'2014-04-13 12:16:33','2014-04-13 12:16:33',6,'(windows nt 6.1)','null',''),(170,'TNzlf53eWCfDKegGRaCibw','192.168.42.186','A8574EFCCBE0','2014-04-13 12:17:25','2014-04-13 13:17:24','00:26:c7:70:5c:c2',0,0,'2014-04-13 12:17:24','2014-04-13 12:17:25',6,'(windows nt 6.1)','null',''),(171,'EiTCX6CRzi85IPr5a-zvrQ','192.168.42.186','A8574EFCCBE0','2014-04-14 12:24:29','2014-04-14 12:28:08','00:26:c7:70:5c:c2',0,0,'2014-04-14 12:24:29','2014-04-14 12:28:08',6,'(windows nt 6.1)','null',''),(173,'kAEKouneYoN5KT9HDdmDww','192.168.42.186','A8574EFCCBE0','2014-04-14 12:25:26','2014-04-14 12:26:02','00:26:c7:70:5c:c2',0,0,'2014-04-14 12:25:25','2014-04-14 12:26:02',6,'(windows nt 6.1)','null',''),(174,'sp9bo4rfuXqgkhGANduTkA','192.168.42.186','A8574EFCCBE0','2014-04-14 12:28:48','2014-04-14 13:28:47','00:26:c7:70:5c:c2',1168131,3084703,'2014-04-14 12:28:47','2014-04-14 12:29:08',6,'(windows nt 6.1)','null',''),(175,'_g5de1MyCJhX79GCltVU0w','192.168.42.186','A8574EFCCBE0','2014-04-14 12:30:36','2014-04-14 13:30:35','00:26:c7:70:5c:c2',4014084,91673698,'2014-04-14 12:30:35','2014-04-14 12:37:22',6,'(windows nt 6.1)','null',''),(176,'b9pyyHzuUCqvrNjiDuhPww','192.168.42.186','A8574EFCCBE0','2014-04-14 15:46:00','2014-04-14 15:46:23','00:26:c7:70:5c:c2',0,0,'2014-04-14 15:46:00','2014-04-14 15:46:23',6,'(windows nt 6.1)','null',''),(177,'AhWk6IACl2AEIE7BjChKsA','192.168.42.186','A8574EFCCBE0','2014-04-14 15:50:42','2014-04-14 16:50:42','00:26:c7:70:5c:c2',0,0,'2014-04-14 15:50:42','2014-04-14 15:50:42',6,'(windows nt 6.1)','null',''),(178,'DXQIdT8Cvp8zY8Wq9eyv8Q','192.168.42.186','A8574EFCCBE0','2014-04-16 22:26:52','2014-04-16 22:58:00','00:26:c7:70:5c:c2',75383,21383,'2014-04-16 22:26:51','2014-04-16 22:58:00',6,'(windows nt 6.1)','null',''),(179,'wsajT4L0UCEsx91xguE9kw','192.168.42.131','A8574EFCCBE0','2014-04-16 23:04:58','2014-04-16 23:08:32','98:d6:f7:8a:77:03',0,0,'2014-04-16 23:04:58','2014-04-16 23:08:32',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',''),(180,'rW0VM-300ny7_BdxbJbfSg','192.168.42.131','A8574EFCCBE0','2014-04-16 23:08:45','2014-04-16 23:10:34','98:d6:f7:8a:77:03',0,0,'2014-04-16 23:08:44','2014-04-16 23:10:34',6,'(linux; android 4.4.2; nexus 4 build/kot49h)','null',''),(181,'cDb4ZnfqUdI244oWd-75Pw','192.168.42.186','A8574EFCCBE0','2014-04-17 10:14:46','2014-04-17 10:48:48','00:26:c7:70:5c:c2',2913337,671221,'2014-04-17 10:14:45','2014-04-17 10:48:48',6,'(windows nt 6.1)','null',''),(182,'Ui4fGJHnTucq_xDZwIhxiw','192.168.42.186','A8574EFCCBE0','2014-04-17 12:47:08','2014-04-17 13:30:44','00:26:c7:70:5c:c2',353223,594448,'2014-04-17 12:47:07','2014-04-17 13:30:44',6,'(windows nt 6.1)','null',''),(183,'wBynHSK66iKO7r-YCGNJkA','192.168.42.186','A8574EFCCBE0','2014-04-17 13:24:38','2014-04-17 13:30:44','00:26:c7:70:5c:c2',1222260,429390,'2014-04-17 13:24:38','2014-04-17 13:30:44',6,'(windows nt 6.1)','null',''),(184,'KLM3Hdd1kFd4HO4j1E3RBw','192.168.42.186','A8574EFCCBE0','2014-04-17 16:36:10','2014-04-17 16:38:36','00:26:c7:70:5c:c2',0,0,'2014-04-17 16:36:10','2014-04-17 16:38:36',6,'(windows nt 6.1)','null',''),(185,'k5CiEQVkIURVFfjBXF2HfA','192.168.42.186','A8574EFCCBE0','2014-04-17 16:39:43','2014-04-17 16:40:00','00:26:c7:70:5c:c2',65932,43612,'2014-04-17 16:39:43','2014-04-17 16:40:00',6,'(windows nt 6.1)','null',''),(186,'3tF4XLbU-GIV4WPOiVJNZQ','192.168.42.186','A8574EFCCBE0','2014-04-17 18:32:47','2014-04-17 19:05:39','00:26:c7:70:5c:c2',228543,75408,'2014-04-17 18:32:47','2014-04-17 19:05:39',6,'(windows nt 6.1)','null',''),(187,'YHE5wHvGi0GA4PPIVHoI0g','192.168.42.186','A8574EFCCBE0','2014-04-22 17:21:01','2014-04-22 17:22:01','00:26:c7:70:5c:c2',1362498,4400351,'2014-04-22 17:21:01','2014-04-22 17:21:50',6,'(windows nt 6.1)','null',''),(188,'AzGE1Wu5MKTbNmkI6_sdcA','192.168.42.186','A8574EFCCBE0','2014-04-22 17:23:39','2014-04-22 17:24:39','00:26:c7:70:5c:c2',84526,862414,'2014-04-22 17:23:39','2014-04-22 17:23:50',6,'(windows nt 6.1)','null',''),(189,'0KwxLhhbyTkN8qZbEoBYfg','192.168.42.186','A8574EFCCBE0','2014-04-22 17:37:27','2014-04-22 17:38:14','00:26:c7:70:5c:c2',724543,1486131,'2014-04-22 17:37:27','2014-04-22 17:38:14',6,'(windows nt 6.1)','null',''),(190,'IMe_eHQXpnGW8uU4gJIOZw','192.168.42.186','A8574EFCCBE0','2014-04-22 17:39:12','2014-04-22 17:40:12','00:26:c7:70:5c:c2',78815,408572,'2014-04-22 17:39:12','2014-04-22 17:40:07',6,'(windows nt 6.1)','null',''),(191,'TY2G2p6lSvYl04j4LJ4jVw','192.168.42.186','A8574EFCCBE0','2014-04-22 17:50:57','2014-04-22 17:51:57','00:26:c7:70:5c:c2',159197,383991,'2014-04-22 17:50:57','2014-04-22 17:51:24',6,'(windows nt 6.1)','null',''),(192,'WMilEELBoJM3Oc9Cio8nmQ','192.168.42.186','A8574EFCCBE0','2014-04-22 17:53:34','2014-04-22 18:53:34','00:26:c7:70:5c:c2',2445728,1159305,'2014-04-22 17:53:34','2014-04-22 17:57:24',6,'(windows nt 6.1)','null',''),(193,'tGosZuouYY-kYw4QUMoZug','192.168.42.180','A8574EFCCBE0','2014-05-06 13:04:00','2014-05-06 14:04:00','b8:e8:56:1d:3d:98',3778681,520229,'2014-05-06 13:04:00','2014-05-06 13:11:59',6,'(macintosh; intel mac os x 10_8_4)','','18611976286');
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `guests`
--

DROP TABLE IF EXISTS `guests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `guests` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_digest` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `guests`
--

LOCK TABLES `guests` WRITE;
/*!40000 ALTER TABLE `guests` DISABLE KEYS */;
INSERT INTO `guests` VALUES (1,'xweiuser','$2a$10$ylpiUODtoE/N/DHjqgC.qu7hsIP6yEfERL6eVo6hWLP3qyRa19Xt.',NULL,'2014-03-20 14:48:17','2014-03-20 14:48:17');
/*!40000 ALTER TABLE `guests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `public_ips`
--

DROP TABLE IF EXISTS `public_ips`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `public_ips` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_node_id` int(11) DEFAULT NULL,
  `publicip` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `public_ips`
--

LOCK TABLES `public_ips` WRITE;
/*!40000 ALTER TABLE `public_ips` DISABLE KEYS */;
INSERT INTO `public_ips` VALUES (12,6,'218.94.58.242','2014-04-22 16:17:53','2014-04-22 16:17:53'),(13,38,'117.34.78.195','2014-04-22 16:19:21','2014-04-22 16:19:21'),(22,6,'117.34.78.195','2014-05-06 13:57:24','2014-05-06 13:57:24');
/*!40000 ALTER TABLE `public_ips` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20140301011256'),('20140302055650'),('20140302063822'),('20140302075125'),('20140302120907'),('20140302133053'),('20140303041815'),('20140303122515'),('20140303132026'),('20140304032538'),('20140304083207'),('20140304090431'),('20140304090632'),('20140304130227'),('20140304153152'),('20140306023833'),('20140306063606'),('20140306065338'),('20140306074153'),('20140306140627'),('20140312082439'),('20140313062911'),('20140315060457'),('20140316102516'),('20140320063945'),('20140320141351'),('20140414083204'),('20140414085709'),('20140414092531'),('20140414100439'),('20140414100625'),('20140414100748'),('20140415045812'),('20140416044131'),('20140416084552'),('20140429094910'),('20140506021133'),('20140506023634');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `statuses`
--

DROP TABLE IF EXISTS `statuses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `statuses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `code` int(11) DEFAULT NULL,
  `message` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `statuses`
--

LOCK TABLES `statuses` WRITE;
/*!40000 ALTER TABLE `statuses` DISABLE KEYS */;
INSERT INTO `statuses` VALUES (1,200,'Success','2014-03-20 22:16:01','2014-03-20 22:16:01');
/*!40000 ALTER TABLE `statuses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trusted_macs`
--

DROP TABLE IF EXISTS `trusted_macs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `trusted_macs` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `access_node_id` int(11) DEFAULT NULL,
  `mac` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trusted_macs`
--

LOCK TABLES `trusted_macs` WRITE;
/*!40000 ALTER TABLE `trusted_macs` DISABLE KEYS */;
INSERT INTO `trusted_macs` VALUES (48,6,'11:22:33:44:55:66','2014-04-24 10:48:14','2014-04-24 10:48:14'),(49,38,'11:22:33:44:55:66','2014-04-24 10:48:43','2014-04-24 10:48:43');
/*!40000 ALTER TABLE `trusted_macs` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-05-08 11:41:41
