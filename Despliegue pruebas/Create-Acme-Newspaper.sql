start transaction;
create database `Acme-Newspaper`;

use `Acme-Newspaper`;

create user 'acme-user'@'%' identified by password '*4F10007AADA9EE3DBB2CC36575DFC6F4FDE27577';
create user 'acme-manager'@'%' identified by password '*FDB8CD304EB2317D10C95D797A4BD7492560F55F';

grant select, insert, update, delete 
	on `Acme-Newspaper`.* to 'acme-user'@'%';
grant select, insert, update, delete, create, drop, references, index, alter, 
        create temporary tables, lock tables, create view, create routine, 
        alter routine, execute, trigger, show view
    on `Acme-Newspaper`.* to 'acme-manager'@'%';
-- MySQL dump 10.13  Distrib 5.5.29, for Win64 (x86)
--
-- Host: localhost    Database: Acme-Newspaper
-- ------------------------------------------------------
-- Server version	5.5.29

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_gfgqmtp2f9i5wsojt33xm0uth` (`userAccount_id`),
  CONSTRAINT `FK_gfgqmtp2f9i5wsojt33xm0uth` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES (73,0,'adminaddress','admin@gmail.com','admin','681331066','admsur',64);
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article`
--

DROP TABLE IF EXISTS `article`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `finalMode` bit(1) NOT NULL,
  `marked` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_s748l8rcgwjfy7m2pny5q9ff4` (`creator_id`),
  KEY `FK_pftm848lf5hu8sd0vghfs605l` (`newspaper_id`),
  CONSTRAINT `FK_pftm848lf5hu8sd0vghfs605l` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_s748l8rcgwjfy7m2pny5q9ff4` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article`
--

LOCK TABLES `article` WRITE;
/*!40000 ALTER TABLE `article` DISABLE KEYS */;
INSERT INTO `article` VALUES (106,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article1',74,95),(107,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article2',74,95),(108,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article3',74,95),(109,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article4',74,95),(110,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article5',74,95),(111,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article6',75,95),(112,0,'This is the body of the article','','\0','2017-02-24 23:00:00','This is the summary of the article','article7',75,95),(113,0,'This is the body of the article','','\0','2017-02-23 23:00:00','This is the summary of the article','article8',75,96),(114,0,'This is the body of the article','','\0','2017-02-22 23:00:00','This is the summary of the article','article9',74,97),(115,0,'This is the body of the article','','\0','2017-02-21 23:00:00','This is the summary of the article','article10',75,98),(116,0,'This is the body of the article','','\0','2017-02-20 23:00:00','This is the summary of the article','article11',74,100),(117,0,'sex ','','','2017-02-20 23:00:00','This is the summary of the article','article12',76,101),(118,0,'This is the body of the article','\0','\0',NULL,'This is the summary of the article','article13',76,94),(119,0,'This is the body of the article','\0','\0',NULL,'This is the summary of the article','article14',76,102);
/*!40000 ALTER TABLE `article` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `article_pictureurls`
--

DROP TABLE IF EXISTS `article_pictureurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `article_pictureurls` (
  `Article_id` int(11) NOT NULL,
  `pictureUrls` varchar(255) DEFAULT NULL,
  KEY `FK_ss3kw69vpgtib45uv6scfcxbd` (`Article_id`),
  CONSTRAINT `FK_ss3kw69vpgtib45uv6scfcxbd` FOREIGN KEY (`Article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `article_pictureurls`
--

LOCK TABLES `article_pictureurls` WRITE;
/*!40000 ALTER TABLE `article_pictureurls` DISABLE KEYS */;
INSERT INTO `article_pictureurls` VALUES (106,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg');
/*!40000 ALTER TABLE `article_pictureurls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `chirp`
--

DROP TABLE IF EXISTS `chirp`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `chirp` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `marked` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `UK_b7jkym7bhws5bb135mdt6kblo` (`marked`),
  KEY `UK_raeiqpusi8b6g4cltekeo03x2` (`creator_id`),
  CONSTRAINT `FK_raeiqpusi8b6g4cltekeo03x2` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `chirp`
--

LOCK TABLES `chirp` WRITE;
/*!40000 ALTER TABLE `chirp` DISABLE KEYS */;
INSERT INTO `chirp` VALUES (86,0,'desc1','\0','2017-03-20 16:12:00','title1',74),(87,0,'viagra','','2017-04-20 16:12:00','title2',74),(88,0,'desc3','\0','2017-03-10 16:12:00','title3',74),(89,0,'desc4','\0','2017-03-10 16:42:00','title4',74),(90,0,'desc5','\0','2017-03-22 16:12:00','title5',74),(91,0,'desc6','\0','2017-08-20 16:12:00','title6',74),(92,0,'desc7','\0','2017-06-20 16:12:00','title7',75),(93,0,'desc8','\0','2018-03-20 16:12:00','title8',76);
/*!40000 ALTER TABLE `chirp` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_pwmktpkay2yx7v00mrwmuscl8` (`userAccount_id`),
  CONSTRAINT `FK_pwmktpkay2yx7v00mrwmuscl8` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
INSERT INTO `customer` VALUES (78,0,'customer1address','customer1@gmail.com','customer1','689361076','customer1sur',69),(79,0,'customer2address','customer2@gmail.com','customer2','689361077','customer2sur',70),(80,0,'customer3address','customer3@gmail.com','customer3','689362076','customer3sur',71),(81,0,'customer4address','customer4@gmail.com','customer4','689352076','customer4sur',72);
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup`
--

DROP TABLE IF EXISTS `followup`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `body` varchar(255) DEFAULT NULL,
  `marked` bit(1) NOT NULL,
  `moment` datetime DEFAULT NULL,
  `summary` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `article_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_aer0q20rslre6418yqlfwmeek` (`article_id`),
  CONSTRAINT `FK_aer0q20rslre6418yqlfwmeek` FOREIGN KEY (`article_id`) REFERENCES `article` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup`
--

LOCK TABLES `followup` WRITE;
/*!40000 ALTER TABLE `followup` DISABLE KEYS */;
INSERT INTO `followup` VALUES (120,0,'This is the body of the followup','\0','2017-05-27 23:00:00','This is the summary of the followup','followUp2',106),(121,0,'This is the body of the followup','\0','2017-03-29 23:00:00','This is the summary of the followup','followUp3',106),(122,0,'This is the body of the followup','\0','2017-02-28 23:00:00','This is the summary of the followup','followUp4',106),(123,0,'This is the body of the followup','\0','2017-04-27 23:00:00','This is the summary of the followup','followUp5',106),(124,0,'This is the body of the followup','\0','2017-03-27 23:00:00','This is the summary of the followup','followUp6',106),(125,0,'This is the body of the followup','\0','2017-02-27 23:10:00','This is the summary of the followup','followUp6',106),(126,0,'This is the body of the followup','\0','2017-02-27 23:10:00','This is the summary of the followup','followUp8',107);
/*!40000 ALTER TABLE `followup` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `followup_pictureurls`
--

DROP TABLE IF EXISTS `followup_pictureurls`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `followup_pictureurls` (
  `FollowUp_id` int(11) NOT NULL,
  `pictureUrls` varchar(255) DEFAULT NULL,
  KEY `FK_fo9xpiowwmo0v1ssj1oh1v6rr` (`FollowUp_id`),
  CONSTRAINT `FK_fo9xpiowwmo0v1ssj1oh1v6rr` FOREIGN KEY (`FollowUp_id`) REFERENCES `followup` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `followup_pictureurls`
--

LOCK TABLES `followup_pictureurls` WRITE;
/*!40000 ALTER TABLE `followup_pictureurls` DISABLE KEYS */;
INSERT INTO `followup_pictureurls` VALUES (120,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(121,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(122,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(123,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(124,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(125,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(126,'https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg'),(126,'https://static.boredpanda.com/blog/wp-content/uuuploads/landscape-photography/landscape-photography-15.jpg');
/*!40000 ALTER TABLE `followup_pictureurls` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hibernate_sequences`
--

DROP TABLE IF EXISTS `hibernate_sequences`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `hibernate_sequences` (
  `sequence_name` varchar(255) DEFAULT NULL,
  `sequence_next_hi_value` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hibernate_sequences`
--

LOCK TABLES `hibernate_sequences` WRITE;
/*!40000 ALTER TABLE `hibernate_sequences` DISABLE KEYS */;
INSERT INTO `hibernate_sequences` VALUES ('DomainEntity',1);
/*!40000 ALTER TABLE `hibernate_sequences` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `newspaper`
--

DROP TABLE IF EXISTS `newspaper`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `newspaper` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `free` bit(1) NOT NULL,
  `marked` bit(1) NOT NULL,
  `pictureUrl` varchar(255) DEFAULT NULL,
  `price` double NOT NULL,
  `publicationDate` datetime DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL,
  `creator_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_3hrwdnoln1lunfhkqt25u89q1` (`creator_id`),
  CONSTRAINT `FK_3hrwdnoln1lunfhkqt25u89q1` FOREIGN KEY (`creator_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `newspaper`
--

LOCK TABLES `newspaper` WRITE;
/*!40000 ALTER TABLE `newspaper` DISABLE KEYS */;
INSERT INTO `newspaper` VALUES (94,0,'This is newspaper1','','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',0,NULL,'newspaper1',74),(95,0,'This is newspaper2','','\0',NULL,0,'2017-02-24 23:00:00','newspaper2',74),(96,0,'This is newspaper3','','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',0,'2017-02-23 23:00:00','newspaper3',74),(97,0,'This is newspaper4','','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',0,'2017-02-22 23:00:00','newspaper4',74),(98,0,'This is newspaper5','','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',0,'2017-02-21 23:00:00','newspaper5',74),(99,0,'This is newspaper6','\0','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',26,NULL,'newspaper6',74),(100,0,'This is newspaper7','\0','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',20,'2017-02-20 23:00:00','newspaper7',75),(101,0,'Sex','\0','','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',20,'2017-02-20 23:00:00','newspaper8',76),(102,0,'This is newspaper9','','\0','https://upload.wikimedia.org/wikipedia/commons/thumb/8/80/Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg/250px-Central_park_manhattan_2_New_York_photo_D_Ramey_Logan.jpg',0,'2017-02-20 23:00:00','newspape9',74);
/*!40000 ALTER TABLE `newspaper` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subscription`
--

DROP TABLE IF EXISTS `subscription`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `subscription` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `brandName` varchar(255) DEFAULT NULL,
  `cvv` int(11) NOT NULL,
  `expMonth` int(11) NOT NULL,
  `expYear` int(11) NOT NULL,
  `holderName` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `customer_id` int(11) NOT NULL,
  `newspaper_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_2i5w4btb7x3r6d2jsd213aqct` (`customer_id`),
  KEY `FK_b3d3q413vlktogdjnnus3ep9e` (`newspaper_id`),
  CONSTRAINT `FK_b3d3q413vlktogdjnnus3ep9e` FOREIGN KEY (`newspaper_id`) REFERENCES `newspaper` (`id`),
  CONSTRAINT `FK_2i5w4btb7x3r6d2jsd213aqct` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subscription`
--

LOCK TABLES `subscription` WRITE;
/*!40000 ALTER TABLE `subscription` DISABLE KEYS */;
INSERT INTO `subscription` VALUES (103,0,'brand1',156,10,18,'customer1','5521054892890001',78,100),(104,0,'brand1',156,10,18,'customer1','5521054892890001',78,101),(105,0,'brand1',136,10,20,'customer2','4916524284571696',79,101);
/*!40000 ALTER TABLE `subscription` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tabooword`
--

DROP TABLE IF EXISTS `tabooword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tabooword` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `word` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_2rdxb3r8yoobpv3vxdh2e4ftp` (`word`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tabooword`
--

LOCK TABLES `tabooword` WRITE;
/*!40000 ALTER TABLE `tabooword` DISABLE KEYS */;
INSERT INTO `tabooword` VALUES (82,0,'viagra'),(83,0,'sex'),(84,0,'sexo'),(85,0,'cialis');
/*!40000 ALTER TABLE `tabooword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `name` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `userAccount_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_o6s94d43co03sx067ili5760c` (`userAccount_id`),
  CONSTRAINT `FK_o6s94d43co03sx067ili5760c` FOREIGN KEY (`userAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (74,0,'user1address','user1@gmail.com','user1','681331076','user1sur',65),(75,0,'user2address','user2@gmail.com','user2','681331076','user2sur',66),(76,0,NULL,'use3@gmail.com','user3',NULL,'user3sur',67),(77,0,'user4address','user4@gmail.com','user4','681361076','user4sur',68);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_user` (
  `followers_id` int(11) NOT NULL,
  `following_id` int(11) NOT NULL,
  KEY `FK_c1h4hh6d78lf7t6jkqn3yoi4l` (`following_id`),
  KEY `FK_ipxcfus1p41qgn9xbfhg2aa0r` (`followers_id`),
  CONSTRAINT `FK_ipxcfus1p41qgn9xbfhg2aa0r` FOREIGN KEY (`followers_id`) REFERENCES `user` (`id`),
  CONSTRAINT `FK_c1h4hh6d78lf7t6jkqn3yoi4l` FOREIGN KEY (`following_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (74,75),(75,74),(76,74);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount`
--

DROP TABLE IF EXISTS `useraccount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount` (
  `id` int(11) NOT NULL,
  `version` int(11) NOT NULL,
  `password` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `UK_csivo9yqa08nrbkog71ycilh5` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount`
--

LOCK TABLES `useraccount` WRITE;
/*!40000 ALTER TABLE `useraccount` DISABLE KEYS */;
INSERT INTO `useraccount` VALUES (64,0,'21232f297a57a5a743894a0e4a801fc3','admin'),(65,0,'24c9e15e52afc47c225b757e7bee1f9d','user1'),(66,0,'7e58d63b60197ceb55a1c487989a3720','user2'),(67,0,'92877af70a45fd6a2ed7fe81e1236b78','user3'),(68,0,'3f02ebe3d7929b091e3d8ccfde2f3bc6','user4'),(69,0,'ffbc4675f864e0e9aab8bdf7a0437010','customer1'),(70,0,'5ce4d191fd14ac85a1469fb8c29b7a7b','customer2'),(71,0,'033f7f6121501ae98285ad77f216d5e7','customer3'),(72,0,'55feb130be438e686ad6a80d12dd8f44','customer4');
/*!40000 ALTER TABLE `useraccount` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `useraccount_authorities`
--

DROP TABLE IF EXISTS `useraccount_authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `useraccount_authorities` (
  `UserAccount_id` int(11) NOT NULL,
  `authority` varchar(255) DEFAULT NULL,
  KEY `FK_b63ua47r0u1m7ccc9lte2ui4r` (`UserAccount_id`),
  CONSTRAINT `FK_b63ua47r0u1m7ccc9lte2ui4r` FOREIGN KEY (`UserAccount_id`) REFERENCES `useraccount` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `useraccount_authorities`
--

LOCK TABLES `useraccount_authorities` WRITE;
/*!40000 ALTER TABLE `useraccount_authorities` DISABLE KEYS */;
INSERT INTO `useraccount_authorities` VALUES (64,'ADMIN'),(65,'USER'),(66,'USER'),(67,'USER'),(68,'USER'),(69,'CUSTOMER'),(70,'CUSTOMER'),(71,'CUSTOMER'),(72,'CUSTOMER');
/*!40000 ALTER TABLE `useraccount_authorities` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-04-09  0:16:39
commit;