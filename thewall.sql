CREATE DATABASE  IF NOT EXISTS `the_wall` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `the_wall`;
-- MySQL dump 10.13  Distrib 5.6.13, for osx10.6 (i386)
--
-- Host: 127.0.0.1    Database: the_wall
-- ------------------------------------------------------
-- Server version	5.5.25

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
-- Table structure for table `comments`
--

DROP TABLE IF EXISTS `comments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `comments` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `comment` longblob,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  `messages_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_comments_users1_idx` (`users_id`),
  KEY `fk_comments_messages1_idx` (`messages_id`),
  CONSTRAINT `fk_comments_messages1` FOREIGN KEY (`messages_id`) REFERENCES `messages` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_comments_users1` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comments`
--

LOCK TABLES `comments` WRITE;
/*!40000 ALTER TABLE `comments` DISABLE KEYS */;
INSERT INTO `comments` VALUES (14,'another short one','2014-03-12 17:55:42','2014-03-12 17:55:42',2,8),(15,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sapien ipsum, consequat et augue a, dapibus elementum odio. Suspendisse porttitor scelerisque massa eu bibendum. Cras tortor velit, fringilla eget turpis nec, hendrerit placerat purus. Nam aliquet orci aliquam imperdiet imperdiet. Nulla ac nulla at urna faucibus venenatis. Proin accumsan, risus placerat mattis aliquet, urna tellus eleifend erat, sit amet imperdiet risus leo non nulla. In hac habitasse platea dictumst. In felis neque, condimentum eu turpis vel, egestas adipiscing ipsum. Pellentesque vel mollis ante, quis interdum purus. Sed tincidunt libero tincidunt mi rhoncus luctus. Nunc luctus dictum semper. Praesent augue ipsum, porta in ultrices porta, congue et arcu. Nam nec tincidunt arcu. In rutrum, tortor eu mattis facilisis, erat felis venenatis dolor, vitae elementum felis sem vitae nunc.','2014-03-12 18:00:07','2014-03-12 18:00:07',14,11),(16,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sapien ipsum, consequat et augue a, dapibus elementum odio. Suspendisse porttitor scelerisque massa eu bibendum. Cras tortor velit, fringilla eget turpis nec, hendrerit placerat purus. Nam aliquet orci aliquam imperdiet imperdiet. Nulla ac nulla at urna faucibus venenatis. Proin accumsan, risus placerat mattis aliquet, urna tellus eleifend erat, sit amet imperdiet risus leo non nulla. In hac habitasse platea dictumst. In felis neque, condimentum eu turpis vel, egestas adipiscing ipsum. Pellentesque vel mollis ante, quis interdum purus. Sed tincidunt libero tincidunt mi rhoncus luctus. Nunc luctus dictum semper. Praesent augue ipsum, porta in ultrices porta, congue et arcu. Nam nec tincidunt arcu. In rutrum, tortor eu mattis facilisis, erat felis venenatis dolor, vitae elementum felis sem vitae nunc.','2014-03-12 18:00:19','2014-03-12 18:00:19',14,11),(17,'let\'s go ','2014-03-12 18:09:14','2014-03-12 18:09:14',14,13),(18,'<h1>are you sure???</h1>','2014-03-12 18:26:30','2014-03-12 18:26:30',14,16),(19,'<h1>are you sure</h1>','2014-03-12 18:26:52','2014-03-12 18:26:52',2,17),(20,'<h1>HELLO TREY </h1>','2014-03-12 18:27:42','2014-03-12 18:27:42',2,17),(21,'i\'d like to just take a minute','2014-03-12 18:32:17','2014-03-12 18:32:17',2,12),(22,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2014-03-12 18:36:51','2014-03-12 18:36:51',2,18),(23,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2014-03-12 18:36:54','2014-03-12 18:36:54',2,18),(24,'It is a long established fact that a reader will be distracted by the readable content of a page when looking at its layout. The point of using Lorem Ipsum is that it has a more-or-less normal distribution of letters, as opposed to using \'Content here, content here\', making it look like readable English. Many desktop publishing packages and web page editors now use Lorem Ipsum as their default model text, and a search for \'lorem ipsum\' will uncover many web sites still in their infancy. Various versions have evolved over the years, sometimes by accident, sometimes on purpose (injected humour and the like).','2014-03-12 18:36:57','2014-03-12 18:36:57',2,18),(25,'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as ','2014-03-12 18:43:59','2014-03-12 18:43:59',2,18),(26,'hold on to your butts','2014-03-12 18:44:08','2014-03-12 18:44:08',2,18),(27,'this is gonna work','2014-03-12 20:11:26','2014-03-12 20:11:26',2,20),(28,'this is gonna work','2014-03-12 20:17:55','2014-03-12 20:17:55',2,20),(29,'i just called ','2014-03-18 08:34:54','2014-03-18 08:34:54',14,20);
/*!40000 ALTER TABLE `comments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `messages`
--

DROP TABLE IF EXISTS `messages`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `messages` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` longtext,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `users_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_messages_users_idx` (`users_id`),
  CONSTRAINT `fk_messages_users` FOREIGN KEY (`users_id`) REFERENCES `users` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `messages`
--

LOCK TABLES `messages` WRITE;
/*!40000 ALTER TABLE `messages` DISABLE KEYS */;
INSERT INTO `messages` VALUES (5,'The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. ','2014-03-12 17:48:04','2014-03-12 17:48:04',14),(6,'hello ','2014-03-12 17:55:00','2014-03-12 17:55:00',2),(7,'testing it again ','2014-03-12 17:55:09','2014-03-12 17:55:09',2),(8,'fasdf asd fa ','2014-03-12 17:55:32','2014-03-12 17:55:32',2),(9,'another one','2014-03-12 17:55:56','2014-03-12 17:55:56',2),(10,'hello','2014-03-12 17:59:44','2014-03-12 17:59:44',14),(11,'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nam sapien ipsum, consequat et augue a, dapibus elementum odio. Suspendisse porttitor scelerisque massa eu bibendum. Cras tortor velit, fringilla eget turpis nec, hendrerit placerat purus. Nam aliquet orci aliquam imperdiet imperdiet. Nulla ac nulla at urna faucibus venenatis. Proin accumsan, risus placerat mattis aliquet, urna tellus eleifend erat, sit amet imperdiet risus leo non nulla. In hac habitasse platea dictumst. In felis neque, condimentum eu turpis vel, egestas adipiscing ipsum. Pellentesque vel mollis ante, quis interdum purus. Sed tincidunt libero tincidunt mi rhoncus luctus. Nunc luctus dictum semper. Praesent augue ipsum, porta in ultrices porta, congue et arcu. Nam nec tincidunt arcu. In rutrum, tortor eu mattis facilisis, erat felis venenatis dolor, vitae elementum felis sem vitae nunc.','2014-03-12 17:59:48','2014-03-12 17:59:48',14),(12,'The path of the righteous man is beset on all sides by the iniquities of the selfish and the tyranny of evil men. Blessed is he who, in the name of charity and good will, shepherds the weak through the valley of darkness, for he is truly his brothers keeper and the finder of lost children. And I will strike down upon thee with great vengeance and furious anger those who would attempt to poison and destroy My brothers. And you will know My name is the Lord when I lay My vengeance upon thee.','2014-03-12 18:01:38','2014-03-12 18:01:38',14),(13,'this shit\'s banana\'s ','2014-03-12 18:06:50','2014-03-12 18:06:50',14),(14,'<h1>what\'s up suckas</h1>','2014-03-12 18:10:48','2014-03-12 18:10:48',14),(15,'<h1> ARE YOU SUREEEEE????</h1>','2014-03-12 18:14:47','2014-03-12 18:14:47',14),(16,'\" \'); DELETE FROM users;\"','2014-03-12 18:15:41','2014-03-12 18:15:41',14),(17,'\" \'); DROP TABLE users;\"','2014-03-12 18:16:03','2014-03-12 18:16:03',14),(18,'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.','2014-03-12 18:36:13','2014-03-12 18:36:13',2),(19,'hjhgkjh','2014-03-12 19:13:53','2014-03-12 19:13:53',2),(20,'hello again','2014-03-12 19:14:24','2014-03-12 19:14:24',14);
/*!40000 ALTER TABLE `messages` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (2,'breaking','bad','f5k5uyJ4PAw6Q','2014-03-11 14:05:57','2014-03-11 14:05:57','breaking@bad.com'),(4,'Greg','Tennant','d80idozZVCLxU','2014-03-11 14:48:20','2014-03-11 14:48:20','greg@tennant.com'),(5,'john','doe','349llcoXeKnJc','2014-03-11 16:57:31','2014-03-11 16:57:31','john@doe.com'),(6,'jon','robb','56Xh0RAeByXi.','2014-03-11 17:19:49','2014-03-11 17:19:49','jon@robb.com'),(7,'ben','jamin','b2sfluv5673CE','2014-03-11 17:22:22','2014-03-11 17:22:22','ben@jamin.com'),(8,'dan','theman','f7sAyswiHLceA','2014-03-11 17:24:31','2014-03-11 17:24:31','dan@theman.com'),(9,'testing','moretesting','050o6La.i0hjQ','2014-03-12 09:43:13','2014-03-12 09:43:13','testing@moretesting.com'),(14,'jackie','pincock','4eXmS0IYWZZTQ','2014-03-12 13:31:40','2014-03-12 13:31:40','jackie@pincock.com'),(40,'Trey','Villa','468D5tEL898DQ','2014-03-21 23:11:12','2014-03-21 23:11:12','trey@villa.com'),(41,'Trey','Villa','27jmPjBIHyvKY','2014-03-21 23:11:45','2014-03-21 23:11:45','trey@villa.com');
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2014-04-03 17:25:39
