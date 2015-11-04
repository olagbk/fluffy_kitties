-- MySQL dump 10.13  Distrib 5.5.44, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: fluffy_kitties
-- ------------------------------------------------------
-- Server version	5.5.44-0+deb8u1

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
-- Table structure for table `addresses`
--

DROP TABLE IF EXISTS `addresses`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `addresses` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `surname` varchar(255) DEFAULT NULL,
  `street` varchar(255) DEFAULT NULL,
  `number` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `postcode` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `addresses`
--

LOCK TABLES `addresses` WRITE;
/*!40000 ALTER TABLE `addresses` DISABLE KEYS */;
INSERT INTO `addresses` VALUES (24,'Hieronim ','Adelean','Carrer de Mallorca','055','Barcelona','0880','Spain',1,'2015-10-11 21:21:15','2015-10-11 21:21:15'),(25,'Nie ','Wiem','Avinguda d\'Alfons XIII','66','Santa Coloma de Gramenet','08880','Spain',1,'2015-10-11 21:21:46','2015-10-11 21:21:46');
/*!40000 ALTER TABLE `addresses` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_items`
--

DROP TABLE IF EXISTS `inventory_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `inventory_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `item_id` int(11) DEFAULT NULL,
  `order_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=49 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_items`
--

LOCK TABLES `inventory_items` WRITE;
/*!40000 ALTER TABLE `inventory_items` DISABLE KEYS */;
INSERT INTO `inventory_items` VALUES (1,1,NULL),(2,2,NULL),(3,2,NULL),(4,3,23),(5,3,NULL),(6,3,NULL),(7,4,NULL),(8,4,NULL),(9,4,NULL),(10,4,NULL),(11,5,NULL),(12,5,NULL),(13,5,NULL),(14,5,NULL),(15,5,NULL),(16,6,NULL),(17,6,NULL),(18,6,NULL),(19,6,NULL),(20,6,NULL),(21,6,NULL),(22,7,NULL),(23,7,NULL),(24,7,NULL),(25,7,NULL),(26,7,NULL),(27,7,NULL),(28,7,NULL),(29,8,24),(30,8,0),(31,8,0),(32,8,25),(33,8,NULL),(34,8,NULL),(35,8,NULL),(36,8,NULL),(37,9,NULL),(38,9,NULL),(39,9,NULL),(40,9,NULL),(41,9,NULL),(42,9,NULL),(43,9,NULL),(44,9,NULL),(45,9,NULL),(46,11,NULL),(47,12,NULL),(48,12,NULL);
/*!40000 ALTER TABLE `inventory_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `category` varchar(255) DEFAULT NULL,
  `photo` varchar(255) DEFAULT NULL,
  `price` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `inventory` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
INSERT INTO `items` VALUES (1,'Motherfucking Jaguar','African','jaguar.jpg',1899.99,'2015-09-24 14:48:00','2015-10-11 22:22:16',1),(2,'Chewbacca','Alien','chewbacca.jpg',589.99,'2015-09-24 14:48:00','2015-09-24 14:48:00',2),(3,'The Pug Kitty','American','pug.jpg',15.99,'2015-09-24 14:48:00','2015-10-11 22:29:23',2),(4,'Samuel L. Jackson','American','samuel.jpg',58.99,'2015-09-24 14:48:00','2015-09-24 14:48:00',4),(5,'Buddhist Kitty','Asian','buddhist.jpg',90,'2015-09-24 14:48:00','2015-09-24 14:48:00',5),(6,'Rabbit Kitty','Asian','rabbit.jpg',13,'2015-09-24 14:48:00','2015-09-24 14:48:00',6),(7,'Very Friendly Kitty','Asian','friendly.jpg',26.99,'2015-09-24 14:48:00','2015-09-24 14:48:00',7),(8,'Australian Mist','Australian','mist.jpg',70,'2015-09-24 14:48:00','2015-10-11 22:32:13',6),(9,'David Cameron\'s Cat','European','larry.jpg',999.9,'2015-09-24 14:48:00','2015-09-24 14:48:00',9),(10,'Surprised French Kitty','European','french.jpg',37,'2015-09-24 14:48:00','2015-09-24 14:48:00',0);
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `login_tokens`
--

DROP TABLE IF EXISTS `login_tokens`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `login_tokens` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `token` varchar(255) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `login_tokens`
--

LOCK TABLES `login_tokens` WRITE;
/*!40000 ALTER TABLE `login_tokens` DISABLE KEYS */;
INSERT INTO `login_tokens` VALUES (1,'$2a$10$DM4jmNJNZHIQ8Zv8FuoRie2CG8pHDT/A7wCi1Cnt9sSYyZw7Xyf12',1,'2015-10-01 16:42:22','2015-10-01 16:42:22'),(2,'$2a$10$EynPLUksWLyFY4VL0uA0b.SdLX8B9Hu0mA2gNa7oQJ8Ahk2.4zSZO',6,'2015-10-01 16:54:30','2015-10-01 16:54:30'),(3,'$2a$10$U9fW2LmPCuElIFWZIQ2W4eldw0GMayD3niLaRuCQMBkMG8tyM0iz2',1,'2015-10-01 16:55:17','2015-10-01 16:55:17'),(4,'$2a$10$WsfGStps62wuy3QnUNLDxOvTlvOwFbHH86.wfQs0cS.U4bXbmQAtC',1,'2015-10-01 16:56:11','2015-10-01 16:56:11'),(5,'$2a$10$oDbdzX5fLcsbxQ4WjWmygunhpu/bq9zQT1NMb/1yOmzzCLwg0dN7q',1,'2015-10-01 16:56:40','2015-10-01 16:56:40'),(6,'$2a$10$Phl3eEIkfeCVr3J5ygO0feYRogMnDJEpGjCgH9uXonj2sdCFRuPO.',1,'2015-10-01 16:57:00','2015-10-01 16:57:00'),(7,'$2a$10$JDpMoKFDjxwAgWONbHZnoeTjcbuSAVSmv0w154LEeHpGOEbI1S0xu',1,'2015-10-01 16:57:19','2015-10-01 16:57:19'),(8,'$2a$10$Xuq94y/kBrisPoIMvwQ3I.8li5jsMZSLbESQUeiYMj0prdYlv9fa.',1,'2015-10-01 16:57:41','2015-10-01 16:57:41'),(9,'$2a$10$ddxLDFoign6Pt.Si0vWGk..cCHTREM/cwc/EQJQttVPzRB8Zjsooi',1,'2015-10-01 16:58:21','2015-10-01 16:58:21'),(10,'$2a$10$hemF7Lq2i/pNEz4VH1caIOqU96tOm8B1t98iH.CK.4AyPwfH5IAve',1,'2015-10-01 16:58:27','2015-10-01 16:58:27'),(11,'$2a$10$sLwx8NSwTCxpLvfR.m27V.AxApUx4OU.HzRuS7y72z4vdlXhTmxDG',1,'2015-10-01 16:59:48','2015-10-01 16:59:48'),(12,'$2a$10$uWEUuSwY0q8xIb4o9WpZ2ed.9uR4cqoAxvZD2bcg6GoP.3ldrjhk2',1,'2015-10-01 19:05:46','2015-10-01 19:05:46'),(13,'$2a$10$r43OgI0emvSszqgJomwko.xr6Ujspqvh6ocxYtTaKzT1JKequkYuq',1,'2015-10-01 19:07:30','2015-10-01 19:07:30'),(14,'$2a$10$SqVmHo7C9rVZd/eItm/uaOAjYMYOwj2RhMuKUk3CyMOoaEdXugGXK',1,'2015-10-01 19:07:42','2015-10-01 19:07:42'),(15,'$2a$10$QWl/txUlxW7erYmIXBSLDOEtLzyyKGJuUNE9XGj0gLgFckKcU3m62',1,'2015-10-01 19:08:03','2015-10-01 19:08:03'),(16,'$2a$10$Q1LscgQaPDi2.UWJsrPhtu43kW3QQlCF8tnPOp6pAsBSeBKiZwCg.',1,'2015-10-01 19:08:18','2015-10-01 19:08:18'),(17,'$2a$10$Aj9Fq2lIyYtTbYAbCx2pUOA0PlpbCvFRS1RjFvTvd1rWblFlzR0FG',1,'2015-10-01 19:11:04','2015-10-01 19:11:04'),(18,'$2a$10$4OkZ1h/beozN8e4l895aB.x1D1v4ftzy5rqjHPRCGxydwTgfIgeoS',1,'2015-10-01 19:11:28','2015-10-01 19:11:28'),(19,'$2a$10$so62VWg1f9W.TZdcuyCyu.neZqiKF.f0W9yH.1uQ6VYDxwEMBpeC6',1,'2015-10-01 19:29:25','2015-10-01 19:29:25'),(20,'$2a$10$BI0GHYED0IwUUfDBV99Lw.mob5Nn2HN66V2LiAT9ig3C.Rmgpe3xG',1,'2015-10-01 19:38:42','2015-10-01 19:38:42'),(21,'$2a$10$1lIT7PpVlj2E1vGuAI9GUuRUAbRSFsIGElrejIEHIiKFSigoUQhpy',1,'2015-10-01 20:01:17','2015-10-01 20:01:17'),(22,'$2a$10$2lW/m3lda1OWOhIURJ4EsePIRD08aV4JKNgXdXKqqXUg2QM2SofBG',1,'2015-10-01 20:01:56','2015-10-01 20:01:56'),(23,'$2a$10$UHOyE5LseTQQGIxfaagk4uf0qsrHBf6QN2SvdMK9BP4tTpLDbZqeW',1,'2015-10-01 20:03:47','2015-10-01 20:03:47'),(24,'$2a$10$O/2eOk8X3cCibdNVJn9dMexEoojOAyuUJzF9/nYM.5uNdLwbXJoNW',1,'2015-10-01 20:05:15','2015-10-01 20:05:15'),(25,'$2a$10$I1/tDBHzr1gw9uujVkDypuBoereqDwVtKrT/HuxiXbTrAZ0P0ZRbq',1,'2015-10-01 20:08:20','2015-10-01 20:08:20'),(26,'$2a$10$TjyyHlQ/F9aHSdrdu4w8wuXfy8hqXNxXmvhh4NsGQeZ4i90uSpvJe',1,'2015-10-01 20:08:53','2015-10-01 20:08:53'),(27,'$2a$10$db3gaL6R4cPcCGK7gclqxOuczqCaohtwCTaRNjE9MSzh/ey2GF3P.',1,'2015-10-01 20:11:19','2015-10-01 20:11:19'),(28,'$2a$10$yaXbSFG3IWcI6/S3ScJrwuXZrRk0c4TPtsUKDMaAD6wvubl.jPipS',1,'2015-10-01 20:13:41','2015-10-01 20:13:41'),(29,'$2a$10$w/OzqSk3U06xnDbHs5HarewXufULl1dqb9bR9QTiGy5JCdTrAecKa',1,'2015-10-01 20:33:53','2015-10-01 20:33:53'),(30,'$2a$10$sEd/JweUX3nk/r6yxjxPo.D.dYIecGbD9NYJ4Q0.TlBMiC0qA7wGS',1,'2015-10-06 11:22:03','2015-10-06 11:22:03'),(31,'$2a$10$NVkWCfsoGgedtyHbirR26u1zD/bMShwkrda.oRgBIKhNHE4U1MRu.',1,'2015-10-06 16:59:40','2015-10-06 16:59:40'),(32,'$2a$10$EW/R3Y3f7p8A3iOTPizFquxvbww6mPYL93rSsgOJ61JWTP6iOVnre',1,'2015-10-06 17:03:05','2015-10-06 17:03:05'),(33,'$2a$10$MYe1XIhcqPOHf5v0aOCpNukRy.2ciWzgCEZDmQ.yugclJ8F17q6fW',1,'2015-10-07 18:48:32','2015-10-07 18:48:32'),(34,'$2a$10$O4eIM3lkctXhK5rl2h8k/.gsdn3fVJKm2Fy3PJk5ayvx/OejlMyj.',1,'2015-10-07 18:48:41','2015-10-07 18:48:41'),(35,'$2a$10$k281IpO24aY9t6gKacxajegujDt3X6oV7ghd/wxD3ZgzcwrTxd/86',1,'2015-10-07 18:49:10','2015-10-07 18:49:10'),(36,'$2a$10$SZv/6EoT4kJuNw6a9Sii.uOC/wM6hCg0bGBMSxafPcFctSkwr7v7S',1,'2015-10-09 18:17:41','2015-10-09 18:17:41'),(37,'$2a$10$kR1wxiej3PSmTYxzD4y/Qe9B58nPGYATg5YEsOe9O4HPrbQclbfC.',1,'2015-10-09 18:19:05','2015-10-09 18:19:05'),(38,'$2a$10$MCVUYQCr4JPVwieCZ5LDzO2H3kd605XPAlBpUDPHU/2Y/7LQ5YjU6',1,'2015-10-09 18:20:47','2015-10-09 18:20:47'),(39,'$2a$10$N5S3aKY7a5LzfZL4khdc.ehT236PUDKG5CZ6FCsd4qvBfa0.Gorgu',1,'2015-10-09 21:40:38','2015-10-09 21:40:38'),(40,'$2a$10$HlGn7GcZJtOmgsP/wWtWKu3ejky6BDwxPrTSPQ8HS2sZzdsaFukry',1,'2015-10-10 12:59:35','2015-10-10 12:59:35'),(41,'$2a$10$JfbdQ5enG.r77Bl1pBGsB..4dQtXxxCGOhy8jR9g1zgQvZvu0fDse',4,'2015-10-11 17:36:03','2015-10-11 17:36:03'),(42,'$2a$10$URx7Y.ugwQa9tpAbkU5Wy.DBr0MfMvS5597J847vvleBkccv8jv5O',4,'2015-10-11 17:36:24','2015-10-11 17:36:24'),(43,'$2a$10$cPeXmvpJQi0GqwM7gZbLUejarFiHA3fnVct7bVuhBrNVDgWa.2PfO',4,'2015-10-11 17:39:38','2015-10-11 17:39:38'),(44,'$2a$10$ih71m5/6oTcjjWrw0XVs8Oh44Va0JPJ29wPNQGipz6rrkMF54Dlpi',1,'2015-10-11 19:31:01','2015-10-11 19:31:01'),(45,'$2a$10$3MRWIPOAUviojowa/tcet.jAzlWVjy30u3sWLiUS4.NK7N0Q6Jvwi',1,'2015-10-11 20:55:33','2015-10-11 20:55:33');
/*!40000 ALTER TABLE `login_tokens` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_items`
--

DROP TABLE IF EXISTS `order_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_items` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `item_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_items`
--

LOCK TABLES `order_items` WRITE;
/*!40000 ALTER TABLE `order_items` DISABLE KEYS */;
INSERT INTO `order_items` VALUES (1,4,NULL),(2,4,NULL),(3,5,NULL),(4,5,NULL),(5,6,NULL),(6,6,NULL),(7,7,NULL),(8,7,NULL),(9,8,NULL),(10,16,NULL),(11,16,NULL),(12,17,NULL),(13,18,NULL),(14,19,NULL),(15,20,NULL),(16,21,NULL),(17,22,NULL),(18,23,NULL),(19,24,8),(20,25,8);
/*!40000 ALTER TABLE `order_items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `total` float DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
INSERT INTO `orders` VALUES (1,1,12,96.99,'2015-10-09 19:50:42','2015-10-09 19:50:42'),(2,1,12,96.99,'2015-10-09 19:55:56','2015-10-09 19:55:56'),(3,1,12,96.99,'2015-10-09 20:05:35','2015-10-09 20:05:35'),(4,1,12,96.99,'2015-10-09 20:38:56','2015-10-09 20:38:56'),(5,1,12,96.99,'2015-10-09 20:41:25','2015-10-09 20:41:25'),(6,1,12,96.99,'2015-10-09 20:42:12','2015-10-09 20:42:12'),(7,1,12,96.99,'2015-10-09 20:45:17','2015-10-09 20:45:17'),(8,1,14,90,'2015-10-10 14:21:51','2015-10-10 14:21:51'),(9,1,15,180,'2015-10-10 14:34:11','2015-10-10 14:34:11'),(10,1,15,180,'2015-10-10 14:36:42','2015-10-10 14:36:42'),(11,1,15,180,'2015-10-10 14:37:21','2015-10-10 14:37:21'),(12,1,15,180,'2015-10-10 14:38:02','2015-10-10 14:38:02'),(13,1,15,180,'2015-10-10 14:38:45','2015-10-10 14:38:45'),(14,1,15,180,'2015-10-10 14:38:49','2015-10-10 14:38:49'),(15,1,15,180,'2015-10-10 14:39:09','2015-10-10 14:39:09'),(16,1,15,180,'2015-10-10 14:41:31','2015-10-10 14:41:31'),(17,1,14,999.9,'2015-10-11 17:29:14','2015-10-11 17:29:14'),(18,1,13,1899.99,'2015-10-11 17:34:27','2015-10-11 17:34:27'),(19,1,13,1899.99,'2015-10-11 17:37:32','2015-10-11 17:37:32'),(20,1,25,1899.99,'2015-10-11 22:17:55','2015-10-11 22:17:55'),(21,1,25,1899.99,'2015-10-11 22:20:32','2015-10-11 22:20:32'),(22,1,25,1899.99,'2015-10-11 22:22:16','2015-10-11 22:22:16'),(23,1,25,15.99,'2015-10-11 22:26:40','2015-10-11 22:26:40'),(24,1,25,70,'2015-10-11 22:30:24','2015-10-11 22:30:24'),(25,1,25,70,'2015-10-11 22:32:13','2015-10-11 22:32:13');
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `schema_migrations`
--

DROP TABLE IF EXISTS `schema_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schema_migrations` (
  `version` varchar(255) NOT NULL,
  UNIQUE KEY `unique_schema_migrations` (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `schema_migrations`
--

LOCK TABLES `schema_migrations` WRITE;
/*!40000 ALTER TABLE `schema_migrations` DISABLE KEYS */;
INSERT INTO `schema_migrations` VALUES ('20150918133526'),('20150918134609'),('20150930143054'),('20150930144155'),('20151008180846'),('20151008181748'),('20151008205122'),('20151010155845'),('20151010161048');
/*!40000 ALTER TABLE `schema_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password_digest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (1,'2015-10-01 16:21:14','2015-10-01 16:21:14','Ola','Gbk','ola','$2a$10$0uO7AwD06zwIr9HNCJiFM.MS46ecE6lJpdHIzyJ0KqV6ySTEMdLvW'),(2,'2015-10-01 16:22:25','2015-10-01 16:22:25','Ola','ola','ola','$2a$10$hJ6kDSJe08tvHoeKzNUYQ.c2dX.ZGbCWGmE2bU9dTs8aayLd1qrx2'),(3,'2015-10-01 16:29:49','2015-10-01 16:29:49','Ola','Gbk','ola','$2a$10$qj.N4uPG/4X5FRcg4s.fXOUhcEKI2jGF/P5VSugfXHEB2ulsxPpZO'),(4,'2015-10-01 16:41:33','2015-10-01 16:41:33','ola','gbk','ola@ola','$2a$10$yOpioou.DkIWRYhaFYEu1ODnQw8zLqAKNJDxM87p2mpdiv0SYFOPu'),(5,'2015-10-01 16:42:22','2015-10-01 16:42:22','f','f','ola','$2a$10$4Yi2AgLDpwgAn/X7oxwqNOpeFUAuFmLwxVNEuoyF2gZgpF8aTF4UW'),(6,'2015-10-01 16:54:30','2015-10-01 16:54:30','ola','f','olaf','$2a$10$YFwockECZ/okN2DNJUUa5.oWzo/o4H/Y/L1Hq5XPRhYvDEKGPgJ22'),(7,'2015-10-01 16:55:17','2015-10-01 16:55:17','ola','ola','ola','$2a$10$xlln.7tuRUkKUfwbNy/PvOOeF1PVOEXhZDXOQYBzIo/OGM1LjFZRe'),(8,'2015-10-01 16:56:11','2015-10-01 16:56:11','ola','ola','ola','$2a$10$u6vp5r5C0BeL.wHuQWE3cuOuv8nUbgXWriqLZQm7114DRw0.sAjCW'),(9,'2015-10-01 16:56:39','2015-10-01 16:56:39','p','p','ola','$2a$10$20bc8vtctbBiKkzLnvt9uOHZBdHVwBTN5r3Aa3H0Fb8yuYh7AsWpy'),(10,'2015-10-01 16:57:00','2015-10-01 16:57:00','p','p','ola','$2a$10$rax.KZvZaCx0a5QIp35Wj..6ShkGK1OyPVVDsJQy1rP9xzZJWOFwC'),(11,'2015-10-01 16:57:19','2015-10-01 16:57:19','p','p','ola','$2a$10$ZM1DhATVFABt50ujjYVpsO08eN0dnJMqb.Am6LO3XAawWc2knqGd6'),(12,'2015-10-01 16:57:41','2015-10-01 16:57:41','a','a','ola','$2a$10$8ae08KvmNe/gapzgDuy49OHqLV8TEcyWsuGnGrqrjVUrTUykMcUZ6'),(13,'2015-10-01 16:58:21','2015-10-01 16:58:21','ola','ola','ola','$2a$10$s4mABFOO21lWlxZb6wFi9OeoQ4/QqMR6qe9fL9goCu4zFPOYuwJxG'),(14,'2015-10-01 16:58:27','2015-10-01 16:58:27','ola','ola','ola','$2a$10$AXyX6VJP7iadbJj9S.5z8.Znt5QErvK6x02ylGgWClRMehvb.xemG'),(15,'2015-10-01 16:59:48','2015-10-01 16:59:48','kk','kk','ola','$2a$10$aVzi7Q9Z2P7yxzoTUxXFWOE7MldtCJqhQ2428BoWysmtNACMHaKSS'),(16,'2015-10-01 19:05:45','2015-10-01 19:05:45','ola','ola','ola','$2a$10$1jDx.KzY5J5VOyuQP37glOo6jufbFoydWTAEFmfFUKj71SeTj3Ijq'),(17,'2015-10-01 19:07:30','2015-10-01 19:07:30','ola','ola','ola','$2a$10$mhD3jyTChTcM0aB.wMwA/uKarUpnv49V0zCDrBY8RLuxEhMUBWd1m'),(18,'2015-10-01 19:07:42','2015-10-01 19:07:42','','','ola','$2a$10$LS7AfbqzubPBnPi.fsEfIOqNH8imxtZqDL0NLs7DhgY5hmfwy6R7q'),(19,'2015-10-01 19:08:03','2015-10-01 19:08:03','','','ola','$2a$10$2wc.pWVv1qkzaZXKUxpUheFrle2eE00yzdNfn806OAmuqyIGgnDLC'),(20,'2015-10-01 19:08:17','2015-10-01 19:08:17','','','ola','$2a$10$OxmRDZnJu40M/WqWobo7X.LFV93Y9VMXOMynnyGuRm.QJJtKRsbwO'),(21,'2015-10-01 19:11:04','2015-10-01 19:11:04','','','ola','$2a$10$hy.3ukIF6/Skg0389ELVSebNQR.DSGENJLpZn4ncOKPmu7QzWa.ia'),(22,'2015-10-01 19:11:28','2015-10-01 19:11:28','','','ola','$2a$10$nQUh.twdm8wlTIy5M557deXt9/hG4Erui8.LBBLVTj2mM2t3DgQYG'),(23,'2015-10-06 17:03:04','2015-10-06 17:03:04','Holla','Haa','ola','$2a$10$uQL5YeNAzSDbiq0.KLAGGeTcCN7ZuL263HOegPG.BDwDWaPBFIijy');
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

-- Dump completed on 2015-10-12 15:12:45
