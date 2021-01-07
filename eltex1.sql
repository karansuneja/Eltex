-- MySQL dump 10.13  Distrib 5.7.29, for Linux (x86_64)
--
-- Host: localhost    Database: eltex1
-- ------------------------------------------------------
-- Server version	5.7.29-0ubuntu0.18.04.1

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
-- Table structure for table `accounts_user`
--

DROP TABLE IF EXISTS `accounts_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `status` varchar(250) NOT NULL,
  `logined` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user`
--

LOCK TABLES `accounts_user` WRITE;
/*!40000 ALTER TABLE `accounts_user` DISABLE KEYS */;
INSERT INTO `accounts_user` VALUES (1,'john@123','7418529630','johncena@gmail.com','qwertyuiop','active',1),(2,'qwerty','7894561230','karansuneja1298@gmail.com','qwertyuiop','active',0);
/*!40000 ALTER TABLE `accounts_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `accounts_user_details`
--

DROP TABLE IF EXISTS `accounts_user_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `accounts_user_details` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `f_name` varchar(250) NOT NULL,
  `l_name` varchar(250) NOT NULL,
  `address` varchar(250) NOT NULL,
  `country` varchar(250) NOT NULL,
  `state` varchar(250) NOT NULL,
  `city` varchar(250) NOT NULL,
  `landmark` varchar(250) NOT NULL,
  `alternate_phone` varchar(250) NOT NULL,
  `user_id` int(11) NOT NULL,
  `pin` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_user_details_user_id_db5224c7_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `accounts_user_details_user_id_db5224c7_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts_user_details`
--

LOCK TABLES `accounts_user_details` WRITE;
/*!40000 ALTER TABLE `accounts_user_details` DISABLE KEYS */;
INSERT INTO `accounts_user_details` VALUES (1,'john','cena','A45','India','Delhi','Delhi','near','9582852425',1,'110051'),(2,'qwerty','sdfg','a45','india','delhi','delhi','awsedf','7894561230',2,'NULL');
/*!40000 ALTER TABLE `accounts_user_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(150) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group`
--

LOCK TABLES `auth_group` WRITE;
/*!40000 ALTER TABLE `auth_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group_permissions`
--

DROP TABLE IF EXISTS `auth_group_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_group_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_group_permissions`
--

LOCK TABLES `auth_group_permissions` WRITE;
/*!40000 ALTER TABLE `auth_group_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_group_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_permission`
--

DROP TABLE IF EXISTS `auth_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=89 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add user',4,'add_user'),(14,'Can change user',4,'change_user'),(15,'Can delete user',4,'delete_user'),(16,'Can view user',4,'view_user'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add contact',7,'add_contact'),(26,'Can change contact',7,'change_contact'),(27,'Can delete contact',7,'delete_contact'),(28,'Can view contact',7,'view_contact'),(29,'Can add seller',8,'add_seller'),(30,'Can change seller',8,'change_seller'),(31,'Can delete seller',8,'delete_seller'),(32,'Can view seller',8,'view_seller'),(33,'Can add product',9,'add_product'),(34,'Can change product',9,'change_product'),(35,'Can delete product',9,'delete_product'),(36,'Can view product',9,'view_product'),(37,'Can add mobile',10,'add_mobile'),(38,'Can change mobile',10,'change_mobile'),(39,'Can delete mobile',10,'delete_mobile'),(40,'Can view mobile',10,'view_mobile'),(41,'Can add laptop',11,'add_laptop'),(42,'Can change laptop',11,'change_laptop'),(43,'Can delete laptop',11,'delete_laptop'),(44,'Can view laptop',11,'view_laptop'),(45,'Can add watch',12,'add_watch'),(46,'Can change watch',12,'change_watch'),(47,'Can delete watch',12,'delete_watch'),(48,'Can view watch',12,'view_watch'),(49,'Can add tv',13,'add_tv'),(50,'Can change tv',13,'change_tv'),(51,'Can delete tv',13,'delete_tv'),(52,'Can view tv',13,'view_tv'),(53,'Can add user',14,'add_user'),(54,'Can change user',14,'change_user'),(55,'Can delete user',14,'delete_user'),(56,'Can view user',14,'view_user'),(57,'Can add user_details',15,'add_user_details'),(58,'Can change user_details',15,'change_user_details'),(59,'Can delete user_details',15,'delete_user_details'),(60,'Can view user_details',15,'view_user_details'),(61,'Can add cart',16,'add_cart'),(62,'Can change cart',16,'change_cart'),(63,'Can delete cart',16,'delete_cart'),(64,'Can view cart',16,'view_cart'),(65,'Can add order',17,'add_order'),(66,'Can change order',17,'change_order'),(67,'Can delete order',17,'delete_order'),(68,'Can view order',17,'view_order'),(69,'Can add compare',18,'add_compare'),(70,'Can change compare',18,'change_compare'),(71,'Can delete compare',18,'delete_compare'),(72,'Can view compare',18,'view_compare'),(73,'Can add orders',19,'add_orders'),(74,'Can change orders',19,'change_orders'),(75,'Can delete orders',19,'delete_orders'),(76,'Can view orders',19,'view_orders'),(77,'Can add orders',20,'add_orders'),(78,'Can change orders',20,'change_orders'),(79,'Can delete orders',20,'delete_orders'),(80,'Can view orders',20,'view_orders'),(81,'Can add payement',21,'add_payement'),(82,'Can change payement',21,'change_payement'),(83,'Can delete payement',21,'delete_payement'),(84,'Can view payement',21,'view_payement'),(85,'Can add review',22,'add_review'),(86,'Can change review',22,'change_review'),(87,'Can delete review',22,'delete_review'),(88,'Can view review',22,'view_review');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user`
--

DROP TABLE IF EXISTS `auth_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user`
--

LOCK TABLES `auth_user` WRITE;
/*!40000 ALTER TABLE `auth_user` DISABLE KEYS */;
INSERT INTO `auth_user` VALUES (1,'pbkdf2_sha256$180000$gLCz6N0lb7og$QFJR8cvmQGmSVF7MUR8+/pUfaOuSvfBUS1VkZGAUe5I=','2020-03-24 06:41:38.025982',1,'karan','','','',1,1,'2020-02-19 07:07:14.985325');
/*!40000 ALTER TABLE `auth_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_groups`
--

DROP TABLE IF EXISTS `auth_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`),
  CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_groups`
--

LOCK TABLES `auth_user_groups` WRITE;
/*!40000 ALTER TABLE `auth_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_user_user_permissions`
--

DROP TABLE IF EXISTS `auth_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_user_user_permissions`
--

LOCK TABLES `auth_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `auth_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `cart_cart`
--

DROP TABLE IF EXISTS `cart_cart`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cart_cart` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `cart_cart_product_id_b5f94649_fk_product_product_id` (`product_id`),
  CONSTRAINT `cart_cart_product_id_b5f94649_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cart_cart`
--

LOCK TABLES `cart_cart` WRITE;
/*!40000 ALTER TABLE `cart_cart` DISABLE KEYS */;
INSERT INTO `cart_cart` VALUES (1,'john@123',11),(2,'john@123',8);
/*!40000 ALTER TABLE `cart_cart` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compare_compare`
--

DROP TABLE IF EXISTS `compare_compare`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `compare_compare` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(250) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `compare_compare_product_id_9ef929e1_fk_product_product_id` (`product_id`),
  CONSTRAINT `compare_compare_product_id_9ef929e1_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compare_compare`
--

LOCK TABLES `compare_compare` WRITE;
/*!40000 ALTER TABLE `compare_compare` DISABLE KEYS */;
INSERT INTO `compare_compare` VALUES (3,'john@123',11);
/*!40000 ALTER TABLE `compare_compare` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2020-02-19 07:35:57.926782','1','admin',1,'[{\"added\": {}}]',8,1),(2,'2020-02-19 07:38:39.460162','1','Realme 5s',1,'[{\"added\": {}}]',9,1),(3,'2020-02-19 07:41:08.951728','1','Realme 5s',1,'[{\"added\": {}}]',10,1),(4,'2020-02-19 07:44:07.543037','2','Realme C2',1,'[{\"added\": {}}]',9,1),(5,'2020-02-19 07:46:58.700528','2','Realme C2',1,'[{\"added\": {}}]',10,1),(6,'2020-02-19 07:50:55.327032','3','Samsung Galaxy A10s',1,'[{\"added\": {}}]',9,1),(7,'2020-02-19 07:52:48.506285','3','Samsung Galaxy A10s',1,'[{\"added\": {}}]',10,1),(8,'2020-02-19 07:56:03.293678','4','Lenovo Idealpad S145',1,'[{\"added\": {}}]',9,1),(9,'2020-02-19 07:58:01.458900','1','Laptop object (1)',1,'[{\"added\": {}}]',11,1),(10,'2020-02-19 08:00:14.233275','5','Lenovo Idealpad 130',1,'[{\"added\": {}}]',9,1),(11,'2020-02-19 08:16:56.273121','2','Laptop object (2)',1,'[{\"added\": {}}]',11,1),(12,'2020-02-19 08:18:56.236323','6','Dell G3 Series',1,'[{\"added\": {}}]',9,1),(13,'2020-02-19 08:20:39.536823','3','Laptop object (3)',1,'[{\"added\": {}}]',11,1),(14,'2020-02-19 08:23:19.062430','7','Sony Bravia W662F',1,'[{\"added\": {}}]',9,1),(15,'2020-02-19 08:25:11.234080','1','Sony Bravia W662F',1,'[{\"added\": {}}]',13,1),(16,'2020-02-19 08:26:51.104658','8','Sony Bravia R252F',1,'[{\"added\": {}}]',9,1),(17,'2020-02-19 08:29:06.060972','2','Sony Bravia R252F',1,'[{\"added\": {}}]',13,1),(18,'2020-02-19 08:31:17.952785','9','Mi LED Smart TV 4X',1,'[{\"added\": {}}]',9,1),(19,'2020-02-19 08:32:32.760679','3','Mi LED Smart TV 4X',1,'[{\"added\": {}}]',13,1),(20,'2020-02-19 08:36:34.771121','10','Noise Colorfit Pro',1,'[{\"added\": {}}]',9,1),(21,'2020-02-19 08:37:54.207815','1','Noise Colorfit Pro',1,'[{\"added\": {}}]',12,1),(22,'2020-02-19 08:39:33.631323','11','Noise ColorFit Pro 2',1,'[{\"added\": {}}]',9,1),(23,'2020-02-19 08:41:02.694170','2','Noise ColorFit Pro 2',1,'[{\"added\": {}}]',12,1),(24,'2020-02-19 08:41:55.662868','11','Noise ColorFit Pro 2',2,'[{\"changed\": {\"fields\": [\"Is exclusive\"]}}]',9,1),(25,'2020-02-19 08:41:55.668977','8','Sony Bravia R252F',2,'[{\"changed\": {\"fields\": [\"Is exclusive\"]}}]',9,1),(26,'2020-02-19 08:41:55.676038','6','Dell G3 Series',2,'[{\"changed\": {\"fields\": [\"Is exclusive\"]}}]',9,1),(27,'2020-02-19 08:41:55.680527','4','Lenovo Idealpad S145',2,'[{\"changed\": {\"fields\": [\"Is exclusive\"]}}]',9,1),(28,'2020-02-19 08:41:55.686362','2','Realme C2',2,'[{\"changed\": {\"fields\": [\"Is exclusive\"]}}]',9,1),(29,'2020-03-13 18:08:20.754218','1','Realme 5s',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',9,1),(30,'2020-03-13 18:08:44.446302','1','Realme 5s',2,'[{\"changed\": {\"fields\": [\"Price\"]}}]',10,1),(31,'2020-03-14 06:53:06.812298','2','Realme C2',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(32,'2020-03-14 06:53:20.868928','1','Realme 5s',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(33,'2020-03-14 06:53:32.780720','3','Samsung Galaxy A10s',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(34,'2020-03-14 06:53:46.572483','4','Lenovo Idealpad S145',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(35,'2020-03-14 06:55:43.545596','5','Lenovo Idealpad 130',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(36,'2020-03-14 06:55:58.030025','6','Dell G3 Series',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(37,'2020-03-14 06:56:11.745963','7','Sony Bravia W662F',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(38,'2020-03-14 06:56:25.086708','8','Sony Bravia R252F',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(39,'2020-03-14 06:56:43.641600','10','Noise Colorfit Pro',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(40,'2020-03-14 06:56:53.519861','11','Noise ColorFit Pro 2',2,'[{\"changed\": {\"fields\": [\"Brand\"]}}]',9,1),(41,'2020-03-19 20:22:46.652838','19320202020401','Payement object (19320202020401)',2,'[{\"changed\": {\"fields\": [\"Products\", \"Date\"]}}]',21,1),(42,'2020-03-24 13:14:45.110115','27','Review object (27)',3,'',22,1),(43,'2020-03-24 13:14:45.115236','26','Review object (26)',3,'',22,1),(44,'2020-03-24 13:14:45.117338','25','Review object (25)',3,'',22,1),(45,'2020-03-24 13:14:45.119087','24','Review object (24)',3,'',22,1),(46,'2020-03-24 13:14:45.120718','23','Review object (23)',3,'',22,1),(47,'2020-03-24 13:14:45.123591','22','Review object (22)',3,'',22,1),(48,'2020-03-24 13:14:45.125281','21','Review object (21)',3,'',22,1),(49,'2020-03-24 13:14:45.128828','20','Review object (20)',3,'',22,1),(50,'2020-03-24 13:14:45.131049','19','Review object (19)',3,'',22,1),(51,'2020-03-24 13:14:45.132346','18','Review object (18)',3,'',22,1),(52,'2020-03-24 13:14:45.134445','17','Review object (17)',3,'',22,1),(53,'2020-03-24 13:14:45.136023','16','Review object (16)',3,'',22,1),(54,'2020-03-24 13:14:45.137258','15','Review object (15)',3,'',22,1),(55,'2020-03-24 13:14:45.139394','14','Review object (14)',3,'',22,1),(56,'2020-03-24 13:14:45.140969','13','Review object (13)',3,'',22,1),(57,'2020-03-24 13:14:45.142756','12','Review object (12)',3,'',22,1),(58,'2020-03-24 13:14:45.144141','11','Review object (11)',3,'',22,1),(59,'2020-03-24 13:14:45.145646','10','Review object (10)',3,'',22,1),(60,'2020-03-24 13:14:45.147770','9','Review object (9)',3,'',22,1),(61,'2020-03-24 13:14:45.149489','8','Review object (8)',3,'',22,1),(62,'2020-03-24 13:14:45.151980','7','Review object (7)',3,'',22,1),(63,'2020-03-24 13:14:45.153559','6','Review object (6)',3,'',22,1),(64,'2020-03-24 13:14:45.155506','5','Review object (5)',3,'',22,1),(65,'2020-03-24 13:14:45.156777','4','Review object (4)',3,'',22,1),(66,'2020-03-24 13:14:45.158415','3','Review object (3)',3,'',22,1),(67,'2020-03-24 13:14:45.159856','2','Review object (2)',3,'',22,1),(68,'2020-03-24 13:14:45.161220','1','Review object (1)',3,'',22,1);
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (14,'accounts','user'),(15,'accounts','user_details'),(1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'auth','user'),(16,'cart','cart'),(17,'checkout','order'),(19,'checkout','orders'),(18,'compare','compare'),(5,'contenttypes','contenttype'),(7,'home','contact'),(20,'order','orders'),(21,'order','payement'),(11,'product','laptop'),(10,'product','mobile'),(9,'product','product'),(13,'product','tv'),(12,'product','watch'),(22,'review','review'),(8,'seller','seller'),(6,'sessions','session');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'accounts','0001_initial','2020-02-19 07:05:36.245652'),(2,'accounts','0002_auto_20191029_1356','2020-02-19 07:05:36.300167'),(3,'accounts','0003_auto_20191030_1703','2020-02-19 07:05:36.376670'),(4,'accounts','0004_user_logined','2020-02-19 07:05:36.433725'),(5,'accounts','0005_auto_20191107_0240','2020-02-19 07:05:36.487895'),(6,'accounts','0006_user_details_pin','2020-02-19 07:05:36.522192'),(7,'accounts','0007_auto_20191129_0845','2020-02-19 07:05:36.532966'),(8,'contenttypes','0001_initial','2020-02-19 07:05:36.569214'),(9,'auth','0001_initial','2020-02-19 07:05:36.710957'),(10,'admin','0001_initial','2020-02-19 07:05:37.045310'),(11,'admin','0002_logentry_remove_auto_add','2020-02-19 07:05:37.110152'),(12,'admin','0003_logentry_add_action_flag_choices','2020-02-19 07:05:37.125537'),(13,'contenttypes','0002_remove_content_type_name','2020-02-19 07:05:37.188370'),(14,'auth','0002_alter_permission_name_max_length','2020-02-19 07:05:37.201286'),(15,'auth','0003_alter_user_email_max_length','2020-02-19 07:05:37.218100'),(16,'auth','0004_alter_user_username_opts','2020-02-19 07:05:37.230115'),(17,'auth','0005_alter_user_last_login_null','2020-02-19 07:05:37.260672'),(18,'auth','0006_require_contenttypes_0002','2020-02-19 07:05:37.264085'),(19,'auth','0007_alter_validators_add_error_messages','2020-02-19 07:05:37.284653'),(20,'auth','0008_alter_user_username_max_length','2020-02-19 07:05:37.303098'),(21,'auth','0009_alter_user_last_name_max_length','2020-02-19 07:05:37.318595'),(22,'auth','0010_alter_group_name_max_length','2020-02-19 07:05:37.332661'),(23,'auth','0011_update_proxy_permissions','2020-02-19 07:05:37.349175'),(24,'seller','0001_initial','2020-02-19 07:05:37.369278'),(25,'seller','0002_delete_seller','2020-02-19 07:05:37.378065'),(26,'seller','0003_seller','2020-02-19 07:05:37.398005'),(27,'seller','0004_delete_seller','2020-02-19 07:05:37.406522'),(28,'seller','0005_seller','2020-02-19 07:05:37.427549'),(29,'product','0001_initial','2020-02-19 07:05:37.465762'),(30,'product','0002_mobile','2020-02-19 07:05:37.728317'),(31,'product','0003_product_is_special','2020-02-19 07:05:37.803563'),(32,'product','0004_auto_20191012_0152','2020-02-19 07:05:37.819206'),(33,'product','0005_product_is_done','2020-02-19 07:05:37.857810'),(34,'product','0006_laptop_tv','2020-02-19 07:05:37.937425'),(35,'product','0007_watch','2020-02-19 07:05:38.040820'),(36,'product','0008_auto_20191024_0101','2020-02-19 07:05:38.127021'),(37,'product','0009_auto_20191024_0124','2020-02-19 07:05:38.175343'),(38,'product','0010_tv_watch','2020-02-19 07:05:38.240848'),(39,'cart','0001_initial','2020-02-19 07:05:38.322119'),(40,'checkout','0001_initial','2020-02-19 07:05:38.374664'),(41,'checkout','0002_order_orderon','2020-02-19 07:05:38.489105'),(42,'compare','0001_initial','2020-02-19 07:05:38.526935'),(43,'home','0001_initial','2020-02-19 07:05:38.579578'),(44,'product','0011_auto_20200202_1755','2020-02-19 07:05:38.598434'),(45,'product','0012_auto_20200205_1430','2020-02-19 07:05:38.685165'),(46,'product','0013_auto_20200205_1433','2020-02-19 07:05:38.768881'),(47,'seller','0006_remove_seller_unique_id','2020-02-19 07:05:38.795617'),(48,'sessions','0001_initial','2020-02-19 07:05:38.816304'),(49,'product','0014_product_brand','2020-03-14 06:47:52.890939'),(50,'product','0015_auto_20200314_0654','2020-03-14 06:54:11.872365'),(51,'order','0001_initial','2020-03-19 08:42:50.898560'),(52,'order','0002_payement','2020-03-19 17:22:51.811232'),(53,'order','0003_auto_20200319_1928','2020-03-19 19:28:50.158177'),(54,'order','0004_auto_20200319_1938','2020-03-19 19:38:47.696570'),(55,'order','0005_auto_20200319_1959','2020-03-19 19:59:54.490466'),(56,'review','0001_initial','2020-03-24 08:28:27.822802');
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('1t2i7vq294dtx5e60wptv7ke0llndda7','MTgwZjAwZmQ4OTRlODJiMWQyYTUwZDZhMmJmZWU0MmRkZjEwMDU2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMDViOGQyYzJkODRjY2M0MGMwOWMzOWFkYjUwZjgxOWNlZGFjZTdjIn0=','2020-03-26 04:26:09.032403'),('3iqtot8p070jlcig69iln4pcsko1s6f1','MTgwZjAwZmQ4OTRlODJiMWQyYTUwZDZhMmJmZWU0MmRkZjEwMDU2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMDViOGQyYzJkODRjY2M0MGMwOWMzOWFkYjUwZjgxOWNlZGFjZTdjIn0=','2020-03-04 07:07:30.620814'),('c8bgj07cvg5tnal2y1mm6r59ql7bfcn4','MTgwZjAwZmQ4OTRlODJiMWQyYTUwZDZhMmJmZWU0MmRkZjEwMDU2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMDViOGQyYzJkODRjY2M0MGMwOWMzOWFkYjUwZjgxOWNlZGFjZTdjIn0=','2020-03-05 05:29:56.264455'),('x8vf4fadns6mpvcdyxjlak2qmtmytdln','MTgwZjAwZmQ4OTRlODJiMWQyYTUwZDZhMmJmZWU0MmRkZjEwMDU2NDp7Il9hdXRoX3VzZXJfaWQiOiIxIiwiX2F1dGhfdXNlcl9iYWNrZW5kIjoiZGphbmdvLmNvbnRyaWIuYXV0aC5iYWNrZW5kcy5Nb2RlbEJhY2tlbmQiLCJfYXV0aF91c2VyX2hhc2giOiJmMDViOGQyYzJkODRjY2M0MGMwOWMzOWFkYjUwZjgxOWNlZGFjZTdjIn0=','2020-04-07 06:41:38.096797');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `home_contact`
--

DROP TABLE IF EXISTS `home_contact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `home_contact` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `email` varchar(250) NOT NULL,
  `phone` varchar(250) NOT NULL,
  `message` longtext NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `home_contact`
--

LOCK TABLES `home_contact` WRITE;
/*!40000 ALTER TABLE `home_contact` DISABLE KEYS */;
/*!40000 ALTER TABLE `home_contact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_orders`
--

DROP TABLE IF EXISTS `order_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_orders` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `price` int(11) NOT NULL,
  `orderon` datetime(6) NOT NULL,
  `delivered` tinyint(1) NOT NULL,
  `product_id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `payement_id` varchar(250) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_orders_product_id_9583b1fb_fk_product_product_id` (`product_id`),
  KEY `order_orders_user_id_cb83615f_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `order_orders_product_id_9583b1fb_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`),
  CONSTRAINT `order_orders_user_id_cb83615f_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_orders`
--

LOCK TABLES `order_orders` WRITE;
/*!40000 ALTER TABLE `order_orders` DISABLE KEYS */;
INSERT INTO `order_orders` VALUES (1,7499,'2020-03-19 08:51:08.238951',0,2,1,'COD'),(2,33999,'2020-03-19 08:59:26.779435',0,8,1,'COD'),(3,22990,'2020-03-19 09:13:44.598984',0,5,1,'COD'),(4,22990,'2020-03-19 11:00:06.697819',0,5,1,'COD'),(5,99,'2020-03-19 16:42:14.906767',0,1,1,'COD'),(6,7499,'2020-03-19 19:41:48.041189',0,2,1,'19320201'),(7,33999,'2020-03-19 20:01:04.528277',0,8,1,'19320202000511'),(8,2449,'2020-03-19 20:01:04.535108',0,10,1,'19320202000511'),(9,56990,'2020-03-19 20:07:43.506362',0,6,1,'COD'),(10,99,'2020-03-19 20:07:43.512459',0,1,1,'COD'),(11,24999,'2020-03-19 20:20:54.943133',0,9,1,'19320202020401'),(12,2449,'2020-03-19 20:20:54.949630',0,10,1,'19320202020401');
/*!40000 ALTER TABLE `order_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_payement`
--

DROP TABLE IF EXISTS `order_payement`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `order_payement` (
  `id` varchar(250) NOT NULL,
  `products` varchar(250) NOT NULL,
  `amount` int(11) NOT NULL,
  `status` varchar(250) NOT NULL,
  `date` datetime(6) NOT NULL,
  `user_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_payement_user_id_133eec1b_fk_accounts_user_id` (`user_id`),
  CONSTRAINT `order_payement_user_id_133eec1b_fk_accounts_user_id` FOREIGN KEY (`user_id`) REFERENCES `accounts_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_payement`
--

LOCK TABLES `order_payement` WRITE;
/*!40000 ALTER TABLE `order_payement` DISABLE KEYS */;
INSERT INTO `order_payement` VALUES ('19320201',' 8,10,',36448,'Fail','2020-03-19 19:48:09.495541',1),('19320202000511',' 8,10,',36448,'Success','2020-03-19 20:00:51.662914',1),('19320202003491',' 6,',56990,'Fail','2020-03-19 20:03:49.865990',1),('19320202004421',' 6,',56990,'Fail','2020-03-19 20:04:42.948482',1),('19320202020401','9,10,',27448,'Success','2020-03-20 20:20:40.000000',1);
/*!40000 ALTER TABLE `order_payement` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_laptop`
--

DROP TABLE IF EXISTS `product_laptop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_laptop` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `ssd` varchar(200) NOT NULL,
  `ram` varchar(200) NOT NULL,
  `hdd` varchar(200) NOT NULL,
  `graphic_card` varchar(200) NOT NULL,
  `processor` varchar(200) NOT NULL,
  `graphic_memory` varchar(200) NOT NULL,
  `warranty` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_laptop_product_id_f99301a9_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_laptop_product_id_f99301a9_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_laptop`
--

LOCK TABLES `product_laptop` WRITE;
/*!40000 ALTER TABLE `product_laptop` DISABLE KEYS */;
INSERT INTO `product_laptop` VALUES (1,'Lenovo Idealpad S145','Lenovo','256GB','8GB DDR4','1TB','Intel integrated UHD 620','Intel Core i5 Processor(8th Gen)','NA','1 year',42990,4),(2,'Lenovo Idealpad 130','Lenovo','NA','4GB DDR4','1TB','Intel integrated UHD 620','Intel Core i3 Processor(7th Gen)','NA','1 year',22990,5),(3,'Dell G3 Series','Dell','128 GB','8GB DDR4','1TB','NVIDIA Geforce GTX 1050','Intel Core i5 Processor(8th Gen)','4GB','1 year',56990,6);
/*!40000 ALTER TABLE `product_laptop` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_mobile`
--

DROP TABLE IF EXISTS `product_mobile`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_mobile` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `display` varchar(200) NOT NULL,
  `rear_camera` varchar(200) NOT NULL,
  `front_camera` varchar(200) NOT NULL,
  `processor` varchar(200) NOT NULL,
  `and_ver` varchar(200) NOT NULL,
  `battery` varchar(200) NOT NULL,
  `warranty` varchar(200) NOT NULL,
  `ram` varchar(200) NOT NULL,
  `rom` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_mobile_product_id_dc111aa2_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_mobile_product_id_dc111aa2_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_mobile`
--

LOCK TABLES `product_mobile` WRITE;
/*!40000 ALTER TABLE `product_mobile` DISABLE KEYS */;
INSERT INTO `product_mobile` VALUES (1,'Realme 5s','Realme','16.51 cm HD+','48MP+8MP+2MP+2MP','13MP','Qualcomm Snapdragon 665','Pie 9','5000 mah','1 year','4 GB','64 GB',99,1),(2,'Realme C2','Realme','15.49 cm HD+','13MP+2MP','5MP','MediaTek P22','Pie 9','4000mah','1 year','3GB','32GB',7499,2),(3,'Samsung Galaxy A10s','Samsung','15.79cm HD+','13MP+2MP','8MP','MediaTek MT6762','Pie 9','4000mah','1 year','3GB','32GB',9499,3);
/*!40000 ALTER TABLE `product_mobile` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_product`
--

DROP TABLE IF EXISTS `product_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `title` varchar(100) NOT NULL,
  `price` int(11) NOT NULL,
  `rating` int(11) NOT NULL,
  `category` varchar(50) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `photo_1` varchar(100) NOT NULL,
  `photo_2` varchar(100) NOT NULL,
  `photo_3` varchar(100) NOT NULL,
  `photo_4` varchar(100) NOT NULL,
  `photo_5` varchar(100) NOT NULL,
  `photo_6` varchar(100) NOT NULL,
  `stock` int(11) NOT NULL,
  `launch_date` datetime(6) NOT NULL,
  `seller_id` int(11) NOT NULL,
  `is_exclusive` tinyint(1) NOT NULL,
  `is_done` tinyint(1) NOT NULL,
  `brand` varchar(200) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_product_seller_id_7f1925e5_fk_seller_seller_id` (`seller_id`),
  CONSTRAINT `product_product_seller_id_7f1925e5_fk_seller_seller_id` FOREIGN KEY (`seller_id`) REFERENCES `seller_seller` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_product`
--

LOCK TABLES `product_product` WRITE;
/*!40000 ALTER TABLE `product_product` DISABLE KEYS */;
INSERT INTO `product_product` VALUES (1,'Realme 5s','realme 5s 4-64 GB pie9',99,4,'mobile','photos/20/02/19/1573716410896.jpg','photos/20/02/19/1573716415014.jpg','photos/20/02/19/1575124572725.jpg','','','','',5,'2020-02-19 07:36:17.000000',1,0,1,'realme'),(2,'Realme C2','reakme c2 3-32GB pie 9',7499,4,'mobile','photos/20/02/19/1555919985942.jpg','photos/20/02/19/1555919997977.jpg','photos/20/02/19/1574924048089.jpg','','','','',6,'2020-02-19 07:41:18.000000',1,1,1,'realme'),(3,'Samsung Galaxy A10s','ga;laxy A10s 3-32GB pie9',9499,3,'mobile','photos/20/02/19/81O4w9rCd0L._SL1500_.jpg','photos/20/02/19/81gW7GKJuAL._SL1500_.jpg','photos/20/02/19/71Og2LCpruL._SL1500_.jpg','','','','',7,'2020-02-19 07:48:58.000000',1,0,1,'samsung'),(4,'Lenovo Idealpad S145','Idealpad S145 8GB-1TB i5',42990,5,'laptop','photos/20/02/19/81EoCoV-8tL._SL1500_.jpg','photos/20/02/19/61PwNaSyZEL._SL1000_.jpg','photos/20/02/19/61f5fOek6hL._SL1000_.jpg','photos/20/02/19/61QGPQMPvUL._SL1000_.jpg','photos/20/02/19/61owsNMdClL._SL1000_.jpg','photos/20/02/19/71Hd4bx9KL._SL1500_.jpg','',6,'2020-02-19 07:53:32.000000',1,1,1,'lenovo'),(5,'Lenovo Idealpad 130','Idealpad 130 4GB-1TB i3',22990,3,'laptop','photos/20/02/19/51QZ2l2YLcL._SL1060_.jpg','photos/20/02/19/51yQoeWz30L._SL1060_.jpg','photos/20/02/19/313P84TWS0L.jpg','photos/20/02/19/41TysBExML._SL1060_.jpg','photos/20/02/19/51bASpP7oL._SL1060_.jpg','','',10,'2020-02-19 07:58:04.000000',1,0,1,'lenovo'),(6,'Dell G3 Series','G3 Series 8GB 1TB i5',56990,5,'laptop','photos/20/02/19/61UMLC5MDWL._SL1000_.jpg','photos/20/02/19/617WCBNkurL._SL1000_.jpg','photos/20/02/19/71LooCR43JL._SL1500_.jpg','photos/20/02/19/51bnvf80N9L._SL1000_.jpg','photos/20/02/19/51QFRhCeOL._SL1000_.jpg','photos/20/02/19/51uTmAuoeL._SL1000_.jpg','photos/20/02/19/61tvvIF29kL._SL1000_.jpg',12,'2020-02-19 08:17:07.000000',1,1,1,'Dell'),(7,'Sony Bravia W662F','bravia 125.7cm led',52999,3,'tv','photos/20/02/19/810YZAjVVL._SL1500_.jpg','photos/20/02/19/811PGAxfwsL._SL1500_.jpg','photos/20/02/19/81ClhnI7TYL._SL1500_.jpg','photos/20/02/19/81TSEIdY37L._SL1500_.jpg','photos/20/02/19/811ltnjEfgL._SL1500_.jpg','','',13,'2020-02-19 08:21:11.000000',1,0,1,'Sony'),(8,'Sony Bravia R252F','bravia 101.6 cm led',33999,3,'tv','photos/20/02/19/71mBfgzTfRL._SL1278_.jpg','photos/20/02/19/71KdG2smKGL._SL1500_.jpg','photos/20/02/19/61Ipb1Z6vsL._SL1500_.jpg','photos/20/02/19/71ovpA0WzPL._SL1500_.jpg','photos/20/02/19/71XASW0ihQL._SL1500_.jpg','photos/20/02/19/71yIORFgGDL._SL1500_.jpg','',15,'2020-02-19 08:25:14.000000',1,1,1,'Sony'),(9,'Mi LED Smart TV 4X','Mi led 108 cm smart tv',24999,3,'tv','photos/20/02/19/81ulud8aUaL._SL1500_.jpg','photos/20/02/19/71Ei9aRSCwL._SL1500_.jpg','photos/20/02/19/61GCzzG1BOL._SL1500_.jpg','photos/20/02/19/71j6YmizQuL._SL1500_.jpg','','','',3,'2020-02-19 08:29:17.000000',1,0,1,'mi'),(10,'Noise Colorfit Pro','noise fit rectangle',2449,2,'watch','photos/20/02/19/61qlbu6yWuL._SL1500_.jpg','photos/20/02/19/6134ba1wXL._SL1500_.jpg','photos/20/02/19/61f8H1vXm6L._SL1500_.jpg','photos/20/02/19/61ps4ALb3VL._SL1500_.jpg','','','',4,'2020-02-19 08:34:23.000000',1,0,1,'Noise'),(11,'Noise ColorFit Pro 2','noise fit rectangle',3499,5,'watch','photos/20/02/19/61cwbCFVYYL._SL1500_.jpg','photos/20/02/19/61KuTFGOx9L._SL1500_.jpg','photos/20/02/19/61onKW6HYZL._SL1500_.jpg','photos/20/02/19/61TfhXLqbxL._SL1500_.jpg','photos/20/02/19/71M2cxQRnXL._SL1500_.jpg','photos/20/02/19/610vAgROxbL._SL1500_.jpg','',11,'2020-02-19 08:37:58.000000',1,1,1,'Noise');
/*!40000 ALTER TABLE `product_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_tv`
--

DROP TABLE IF EXISTS `product_tv`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_tv` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `dimensions` varchar(200) NOT NULL,
  `display` varchar(200) NOT NULL,
  `hdmi` int(11) NOT NULL,
  `usb` int(11) NOT NULL,
  `sound_output` varchar(200) NOT NULL,
  `smart_tv` tinyint(1) NOT NULL,
  `build_in_wifi` tinyint(1) NOT NULL,
  `youtube_support` tinyint(1) NOT NULL,
  `netflix_support` tinyint(1) NOT NULL,
  `refresh_rate` varchar(200) NOT NULL,
  `tv_type` varchar(200) NOT NULL,
  `warranty` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_tv_product_id_4b447e2e_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_tv_product_id_4b447e2e_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_tv`
--

LOCK TABLES `product_tv` WRITE;
/*!40000 ALTER TABLE `product_tv` DISABLE KEYS */;
INSERT INTO `product_tv` VALUES (1,'Sony Bravia W662F','Sony','1130 mm x 660 mm x 68 mm','125.7cm',4,4,'10 W',1,1,1,1,'50 Hz','LED','1 year',52999,7),(2,'Sony Bravia R252F','Sony','916 mm x 73 mm','101.6cm',4,2,'20 W',0,0,0,0,'50 Hz','LED','1 year',33999,8),(3,'Mi LED Smart TV 4X','Mi','97 cm x 569 mm x 8.5 cm','108cm',6,4,'20 W',1,1,1,1,'60 Hz','LED','1 year',24999,9);
/*!40000 ALTER TABLE `product_tv` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_watch`
--

DROP TABLE IF EXISTS `product_watch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_watch` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `brand` varchar(200) NOT NULL,
  `dial_shape` varchar(200) NOT NULL,
  `water_resistance` tinyint(1) NOT NULL,
  `strap_material` varchar(200) NOT NULL,
  `dimensions` varchar(200) NOT NULL,
  `charge_time` varchar(200) NOT NULL,
  `battery_life` varchar(200) NOT NULL,
  `call_function` varchar(200) NOT NULL,
  `wifi` tinyint(1) NOT NULL,
  `gps` tinyint(1) NOT NULL,
  `sensor` varchar(200) NOT NULL,
  `price` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `product_watch_product_id_8945975e_fk_product_product_id` (`product_id`),
  CONSTRAINT `product_watch_product_id_8945975e_fk_product_product_id` FOREIGN KEY (`product_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_watch`
--

LOCK TABLES `product_watch` WRITE;
/*!40000 ALTER TABLE `product_watch` DISABLE KEYS */;
INSERT INTO `product_watch` VALUES (1,'Noise Colorfit Pro','Noise','Rectangle',1,'Silicon','240x240 pixel','2 hour','3 days','No',0,0,'Continious Heart Rate,Oxygen level and Sleep Monitor',2449,10),(2,'Noise ColorFit Pro 2','Noise','Rectangle',1,'Synthetic','240x240 pixel','2 hour','Upto 10 days','No',0,0,'Menstrual Cycle Tracking,Heart Rate Monitor,Smart Notifications',3499,11);
/*!40000 ALTER TABLE `product_watch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `review_review`
--

DROP TABLE IF EXISTS `review_review`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `review_review` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) NOT NULL,
  `rating` int(11) NOT NULL,
  `message` varchar(250) NOT NULL,
  `date` datetime(6) NOT NULL,
  `product_id_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `review_review_product_id_id_4b7b7d25_fk_product_product_id` (`product_id_id`),
  CONSTRAINT `review_review_product_id_id_4b7b7d25_fk_product_product_id` FOREIGN KEY (`product_id_id`) REFERENCES `product_product` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `review_review`
--

LOCK TABLES `review_review` WRITE;
/*!40000 ALTER TABLE `review_review` DISABLE KEYS */;
INSERT INTO `review_review` VALUES (28,'Rahul',4,'its great','2020-03-24 13:15:45.902565',7),(29,'abhinav',2,'smart tv features hangs','2020-03-24 20:59:45.086960',7),(30,'Ajay',4,'fabulous smart phone','2020-03-24 21:00:33.821776',2),(31,'Dharmesh',5,'its good ,all the functions works properly','2020-03-24 22:04:20.580995',7);
/*!40000 ALTER TABLE `review_review` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `seller_seller`
--

DROP TABLE IF EXISTS `seller_seller`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `seller_seller` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(200) NOT NULL,
  `photo` varchar(100) NOT NULL,
  `phone` varchar(10) NOT NULL,
  `email` varchar(50) NOT NULL,
  `country` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `address` longtext NOT NULL,
  `joindate` datetime(6) NOT NULL,
  `seller_of_the_month` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `seller_seller`
--

LOCK TABLES `seller_seller` WRITE;
/*!40000 ALTER TABLE `seller_seller` DISABLE KEYS */;
INSERT INTO `seller_seller` VALUES (1,'admin','seller/20/02/19/IMG-20190623-WA0002.jpeg','9582852425','karansuneja1298@gmail.com','India','Delhi','100/5','2020-02-19 07:34:21.000000',0);
/*!40000 ALTER TABLE `seller_seller` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-03-26 10:38:51
