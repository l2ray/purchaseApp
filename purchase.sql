-- MySQL dump 10.13  Distrib 5.7.24, for Linux (x86_64)
--
-- Host: localhost    Database: purchase_order
-- ------------------------------------------------------
-- Server version	5.7.24-0ubuntu0.16.04.1

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
-- Table structure for table `currency_types`
--

DROP TABLE IF EXISTS `currency_types`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `currency_types` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `currencyName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `currency` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `status` int(11) DEFAULT NULL,
  `currencyAbbreviation` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `currency_types_currencyname_unique` (`currencyName`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `currency_types`
--

LOCK TABLES `currency_types` WRITE;
/*!40000 ALTER TABLE `currency_types` DISABLE KEYS */;
INSERT INTO `currency_types` VALUES (1,'Gambian Dalasi','D',0,'GMD','2020-07-09 13:44:55','2020-07-09 13:44:55'),(2,'United Kingdom Pound Sterling','£',0,'GBP','2020-07-09 13:44:55','2020-07-09 13:44:55'),(3,'United States Dollar','$',0,'USD','2020-07-09 13:44:55','2020-07-09 13:44:55'),(4,'European Euro','€',0,'EUR','2020-07-09 13:44:55','2020-07-09 13:44:55'),(5,'Canadian Dollar','$',0,'CAD','2020-07-09 13:44:55','2020-07-09 13:44:55'),(6,'Chinese Yuan Renminbi','¥',0,'CNY','2020-07-09 13:44:55','2020-07-09 13:44:55'),(7,'West African CFA','CFA',0,'XOF','2020-07-09 13:44:55','2020-07-09 13:44:55'),(8,'Nigerian Naira','₦',0,'NGN','2020-07-09 13:44:55','2020-07-09 13:44:55');
/*!40000 ALTER TABLE `currency_types` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `departments`
--

DROP TABLE IF EXISTS `departments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `departments` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `department_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `departments`
--

LOCK TABLES `departments` WRITE;
/*!40000 ALTER TABLE `departments` DISABLE KEYS */;
INSERT INTO `departments` VALUES (1,'Admin','2020-06-17 16:11:28','2020-12-21 10:07:44'),(2,'Customer Care','2020-06-28 13:11:30','2020-06-28 13:11:30'),(3,'Finance','2020-07-01 11:08:25','2020-07-01 11:08:25'),(4,'Marketing','2020-07-03 13:08:10','2020-07-06 17:23:35'),(5,'Projects','2020-07-03 13:08:10','2020-07-07 04:11:13'),(6,'Sales','2020-07-03 13:08:10','2020-07-03 13:08:10'),(7,'IT and Billing','2020-07-03 13:08:10','2020-07-03 13:08:10'),(8,'Technical','2020-07-03 13:08:10','2020-07-03 13:08:10');
/*!40000 ALTER TABLE `departments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discounts`
--

DROP TABLE IF EXISTS `discounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discounts` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `discountAmount` decimal(12,2) NOT NULL,
  `requisitionId` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `discounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `failed_jobs`
--

DROP TABLE IF EXISTS `failed_jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `failed_jobs` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `failed_jobs`
--

LOCK TABLES `failed_jobs` WRITE;
/*!40000 ALTER TABLE `failed_jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `failed_jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `g_r_n_s`
--

DROP TABLE IF EXISTS `g_r_n_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `g_r_n_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `grnNo` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poId` bigint(20) unsigned DEFAULT NULL,
  `supplierId` bigint(20) unsigned DEFAULT NULL,
  `reqId` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `g_r_n_s_poid_foreign` (`poId`),
  KEY `g_r_n_s_supplierid_foreign` (`supplierId`),
  KEY `g_r_n_s_reqid_foreign` (`reqId`),
  CONSTRAINT `g_r_n_s_poid_foreign` FOREIGN KEY (`poId`) REFERENCES `p_o_s` (`id`) ON DELETE CASCADE,
  CONSTRAINT `g_r_n_s_reqid_foreign` FOREIGN KEY (`reqId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `g_r_n_s_supplierid_foreign` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `g_r_n_s`
--

LOCK TABLES `g_r_n_s` WRITE;
/*!40000 ALTER TABLE `g_r_n_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `g_r_n_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `h_o_d_s`
--

DROP TABLE IF EXISTS `h_o_d_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `h_o_d_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `uniqueDep` (`departmentId`),
  CONSTRAINT `h_o_d_s_departmentid_foreign` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `h_o_d_s`
--

LOCK TABLES `h_o_d_s` WRITE;
/*!40000 ALTER TABLE `h_o_d_s` DISABLE KEYS */;
INSERT INTO `h_o_d_s` VALUES (1,'Oumie Ceesay',1,'2020-06-17 16:27:36','2020-06-17 16:27:36'),(2,'Anam Jah Jobe',2,'2020-06-26 09:39:19','2020-06-26 09:39:19'),(3,'Nayan Bhatt',3,'2020-07-01 11:09:12','2020-07-01 11:09:12'),(4,'Amie Ceesay',4,'2020-07-03 13:28:16','2020-07-03 13:28:16'),(5,'Nene Jah',5,'2020-07-03 13:28:16','2020-07-03 13:28:16'),(6,'Augustine Jatta',6,'2020-07-03 14:31:37','2020-07-03 14:31:37'),(7,'Lamin Yaffa',7,'2020-07-03 14:31:37','2020-07-03 14:31:37'),(8,'Ahamat Jah',8,'2020-07-03 14:31:37','2020-07-03 14:31:37');
/*!40000 ALTER TABLE `h_o_d_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justify_reason_requisions`
--

DROP TABLE IF EXISTS `justify_reason_requisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justify_reason_requisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `officerId` int(11) NOT NULL,
  `Product_Id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actionBy` int(2) NOT NULL,
  `userId` int(2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_reason_requisions`
--

LOCK TABLES `justify_reason_requisions` WRITE;
/*!40000 ALTER TABLE `justify_reason_requisions` DISABLE KEYS */;
/*!40000 ALTER TABLE `justify_reason_requisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `justify_rejections`
--

DROP TABLE IF EXISTS `justify_rejections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `justify_rejections` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reason` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `officerId` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `actionBy` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_rejections`
--

LOCK TABLES `justify_rejections` WRITE;
/*!40000 ALTER TABLE `justify_rejections` DISABLE KEYS */;
/*!40000 ALTER TABLE `justify_rejections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `migrations`
--

DROP TABLE IF EXISTS `migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2020_06_16_162141_create_suppliers_table',2),(4,'2020_06_16_162231_create_departments_table',3),(5,'2020_06_16_162214_create_h_o_d_s_table',4),(6,'2020_06_16_162107_create_officer_requicisions_table',5),(7,'2020_06_16_162252_create_requisition_orders_table',6),(8,'2020_06_16_162158_create_product_orders_table',7),(9,'2020_06_16_162001_create_p_o_s_table',8),(10,'2020_06_17_123105_create_g_r_n_s_table',9),(11,'2020_06_30_084228_create_pending_requests_table',10),(12,'2020_06_30_084444_create_pending_requisition_requests_table',10),(15,'2020_07_09_120216_create_currency_types_table',11),(16,'2020_07_10_093448_create_discounts_table',12),(17,'2020_07_16_143015_create_sub_deps_table',13),(18,'2020_07_20_084342_create_justify_rejections_table',14),(19,'2020_07_20_164849_create_justify_reason_requisions_table',15);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `officer_requicisions`
--

DROP TABLE IF EXISTS `officer_requicisions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `officer_requicisions` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `departmentId` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `subDep` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `officer_requicisions_departmentid_foreign` (`departmentId`),
  CONSTRAINT `officer_requicisions_departmentid_foreign` FOREIGN KEY (`departmentId`) REFERENCES `departments` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer_requicisions`
--

LOCK TABLES `officer_requicisions` WRITE;
/*!40000 ALTER TABLE `officer_requicisions` DISABLE KEYS */;
INSERT INTO `officer_requicisions` VALUES (7,'Bakary Camara',1,'2020-07-01 11:23:35','2020-07-01 11:23:35',1),(9,'Buba Sabally',1,'2020-07-17 11:14:33','2020-07-17 11:14:33',9),(10,'Nayan Bhatt',2,NULL,NULL,10),(11,'Oumie Ceesay',1,'2020-07-23 09:20:22','2020-07-23 09:20:22',9),(12,'Anam Jah Jobe',2,'2020-07-23 09:32:25','2020-07-23 09:32:25',2),(13,'Augustine Jatta',6,'2020-07-23 09:36:26','2020-07-23 09:36:26',13),(14,'Lamin Yaffa',7,'2020-07-23 09:38:19','2020-07-23 09:38:19',12),(15,'Ahamat Jah',8,'2020-07-23 09:40:08','2020-07-23 09:40:08',1),(16,'Lamin O. Touray',8,'2020-07-24 13:16:26','2020-07-24 13:16:26',1),(17,'Sohna Bittaye',1,'2020-07-27 08:35:17','2020-07-27 08:35:17',9);
/*!40000 ALTER TABLE `officer_requicisions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `p_o_s`
--

DROP TABLE IF EXISTS `p_o_s`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `p_o_s` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `poNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `poDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `supplierId` bigint(20) unsigned DEFAULT NULL,
  `reqOrderId` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `p_o_s_supplierid_foreign` (`supplierId`),
  KEY `p_o_s_reqorderid_foreign` (`reqOrderId`),
  CONSTRAINT `p_o_s_reqorderid_foreign` FOREIGN KEY (`reqOrderId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE,
  CONSTRAINT `p_o_s_supplierid_foreign` FOREIGN KEY (`supplierId`) REFERENCES `suppliers` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `p_o_s`
--

LOCK TABLES `p_o_s` WRITE;
/*!40000 ALTER TABLE `p_o_s` DISABLE KEYS */;
/*!40000 ALTER TABLE `p_o_s` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_requests`
--

DROP TABLE IF EXISTS `pending_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productName` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productDescription` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `productQuantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `requisitionId` int(11) DEFAULT NULL,
  `hrApprovedStatus` int(2) NOT NULL,
  `hodApproveStatus` int(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_requests`
--

LOCK TABLES `pending_requests` WRITE;
/*!40000 ALTER TABLE `pending_requests` DISABLE KEYS */;
INSERT INTO `pending_requests` VALUES (7,'10 mm² Green/Yellow Single Core Cable','10 mm² Green/Yellow Single Core Cable',3,'2020-07-24 10:03:46','2020-07-24 10:03:46',5,1,1),(8,'100A Double Pole Breaker','100A Double Pole Breaker',5,'2020-09-14 16:14:48','2020-09-14 16:14:48',6,1,1),(9,'100A Double Pole Breaker','100A Double Pole Breaker',5,'2020-09-14 16:33:45','2020-09-14 16:33:45',7,1,1),(10,'100A Bushbar Chamber','100A Bushbar Chamber',34,'2020-09-14 16:34:26','2020-09-14 16:34:26',8,1,1),(11,'100A Bushbar Chamber','100A Bushbar Chamber',2,'2020-09-14 16:47:17','2020-09-14 16:47:17',9,1,1),(12,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.','1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',2,'2020-09-18 09:27:46','2020-09-18 09:27:46',10,1,1),(13,'Letter Size Envelopes','Letter Size Envelopes',1,'2020-10-15 09:37:04','2020-10-15 09:37:04',12,1,1),(14,'60A 48V solar Charge Conntroller','60A 48V solar Charge Conntroller',1,'2020-10-15 09:46:42','2020-10-15 09:46:42',13,1,1),(15,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.','1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',1,'2020-10-15 09:46:42','2020-10-15 09:46:42',13,1,1),(16,'100A Fuse Cut Out','100A Fuse Cut Out',2,'2020-12-21 12:57:39','2020-12-21 12:57:39',14,1,1),(17,'100A Fuse Cut Out','100A Fuse Cut Out',2,'2020-12-21 13:00:19','2020-12-21 13:00:19',15,1,1),(18,'10 mm² Green/Yellow Single Core Cable','10 mm² Green/Yellow Single Core Cable',23,'2020-12-21 13:01:45','2020-12-21 13:01:45',16,1,1),(19,'100A Fuse Cut Out','100A Fuse Cut Out',23,'2020-12-21 13:05:51','2020-12-21 13:05:51',17,1,1),(20,'100A Fuse Cut Out','100A Fuse Cut Out',23,'2020-12-21 13:08:13','2020-12-21 13:08:13',18,1,1),(21,'100A Bushbar Chamber','100A Bushbar Chamber',23,'2020-12-21 13:11:34','2020-12-21 13:11:34',19,1,1),(22,'100A 1Phase + N Fase Cut Out','100A 1Phase + N Fase Cut Out',23,'2020-12-21 13:14:48','2020-12-21 13:14:48',20,1,1),(23,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.','1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',3,'2020-12-21 13:23:37','2020-12-21 13:23:37',21,1,1);
/*!40000 ALTER TABLE `pending_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pending_requisition_requests`
--

DROP TABLE IF EXISTS `pending_requisition_requests`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `pending_requisition_requests` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `hod_id` bigint(20) unsigned DEFAULT NULL,
  `dep_id` bigint(20) unsigned DEFAULT NULL,
  `officer_id` bigint(20) unsigned DEFAULT NULL,
  `reqDate` datetime NOT NULL,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `hodApproved` int(11) NOT NULL,
  `hrApproved` int(11) NOT NULL,
  `delivered` int(11) NOT NULL,
  `lpoNo` varchar(111) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_requisition_requests`
--

LOCK TABLES `pending_requisition_requests` WRITE;
/*!40000 ALTER TABLE `pending_requisition_requests` DISABLE KEYS */;
INSERT INTO `pending_requisition_requests` VALUES (5,1,1,9,'2020-07-24 10:03:46','Test sdfsd',1,1,0,'0000000005','2020-07-24 10:03:46','2020-07-24 10:05:15'),(6,8,8,16,'2020-09-14 16:14:48','tewrwe',0,0,0,'0000000006','2020-09-14 16:14:48','2020-09-14 16:14:48'),(7,8,8,16,'2020-09-14 16:33:45','tewrwe',0,0,0,'0000000007','2020-09-14 16:33:45','2020-09-14 16:33:45'),(8,8,8,16,'2020-09-14 16:34:26','ytt',0,0,0,'0000000008','2020-09-14 16:34:26','2020-09-14 16:34:26'),(9,8,8,16,'2020-09-14 16:47:17','test ppp',1,0,0,'0000000009','2020-09-14 16:47:17','2020-09-14 16:49:07'),(10,1,1,7,'2020-09-18 09:27:46','sdfsdw',0,0,0,'0000000010','2020-09-18 09:27:46','2020-09-18 09:27:46'),(11,1,1,7,'2020-10-13 10:55:54','Replacement for Admin\'s printer',0,0,0,'0000000011','2020-10-13 10:55:54','2020-10-13 10:55:54'),(12,1,1,17,'2020-10-15 09:37:04','For official use',0,0,0,'0000000012','2020-10-15 09:37:04','2020-10-15 09:37:04'),(13,1,1,17,'2020-10-15 09:46:42','For official use',0,0,0,'0000000013','2020-10-15 09:46:42','2020-10-15 09:46:42'),(14,8,8,16,'2020-12-21 12:57:39','This is just a test...',0,0,0,'0000000014','2020-12-21 12:57:39','2020-12-21 12:57:39'),(15,8,8,16,'2020-12-21 13:00:19','This is just a test...',0,0,0,'0000000015','2020-12-21 13:00:19','2020-12-21 13:00:19'),(16,8,8,16,'2020-12-21 13:01:45','Test123 2020/12/21',0,0,0,'0000000016','2020-12-21 13:01:45','2020-12-21 13:01:45'),(17,8,8,16,'2020-12-21 13:05:51','sfsdr 2020/12/21',0,0,0,'0000000017','2020-12-21 13:05:51','2020-12-21 13:05:51'),(18,8,8,16,'2020-12-21 13:08:13','sfsdr 2020/12/21',0,0,0,'0000000018','2020-12-21 13:08:13','2020-12-21 13:08:13'),(19,8,8,16,'2020-12-21 13:11:34','Test PUrpose...',0,0,0,'0000000019','2020-12-21 13:11:34','2020-12-21 13:11:34'),(20,8,8,16,'2020-12-21 13:14:48','sdfsd',0,0,0,'0000000020','2020-12-21 13:14:48','2020-12-21 13:14:48'),(21,8,8,16,'2020-12-21 13:23:37','werw',0,0,0,'0000000021','2020-12-21 13:23:37','2020-12-21 13:23:37');
/*!40000 ALTER TABLE `pending_requisition_requests` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `product_orders`
--

DROP TABLE IF EXISTS `product_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `product_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `quantity` int(11) NOT NULL,
  `description` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit_price` decimal(7,2) NOT NULL,
  `total_price` decimal(15,2) NOT NULL,
  `requisitionId` bigint(20) unsigned DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_orders_requisitionid_foreign` (`requisitionId`),
  CONSTRAINT `product_orders_requisitionid_foreign` FOREIGN KEY (`requisitionId`) REFERENCES `requisition_orders` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (82,3,'10 mm² Green/Yellow Single Core Cable',2500.00,7500.00,76,'2020-07-24 10:05:15','2020-07-24 10:05:15'),(83,3,'100A 1Phase + N Fase Cut Out',456.00,1368.00,77,'2020-09-14 14:49:18','2020-09-14 14:49:18'),(84,45,'10 Way Distrubution Box',5.00,225.00,77,'2020-09-14 14:49:18','2020-09-14 14:49:18'),(85,2,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',545.00,1090.00,78,'2020-09-14 14:50:31','2020-09-14 14:50:31'),(86,3,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',345.00,1035.00,79,'2020-09-14 15:50:08','2020-09-14 15:50:08'),(87,2,'100A Double Pole Breaker',345.00,690.00,80,'2020-09-14 16:11:21','2020-09-14 16:11:21');
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `requisition_orders`
--

DROP TABLE IF EXISTS `requisition_orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `requisition_orders` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `reqNo` varchar(111) COLLATE utf8mb4_unicode_ci NOT NULL,
  `hod_id` bigint(20) unsigned DEFAULT NULL,
  `dep_id` bigint(20) unsigned DEFAULT NULL,
  `officer_id` bigint(20) unsigned DEFAULT NULL,
  `reqDate` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `purpose` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `hodApproved` int(11) NOT NULL,
  `hrApproved` int(11) NOT NULL,
  `delivered` int(11) NOT NULL,
  `poStatus` int(2) NOT NULL,
  `supplier` int(5) NOT NULL,
  `poNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `supplierId` bigint(20) NOT NULL,
  `vatApplicable` int(1) NOT NULL,
  `currencyId` int(2) NOT NULL,
  `discountApplicable` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `requisition_orders_hod_id_foreign` (`hod_id`),
  KEY `requisition_orders_dep_id_foreign` (`dep_id`),
  KEY `requisition_orders_officer_id_foreign` (`officer_id`),
  CONSTRAINT `requisition_orders_dep_id_foreign` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requisition_orders_hod_id_foreign` FOREIGN KEY (`hod_id`) REFERENCES `h_o_d_s` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requisition_orders_officer_id_foreign` FOREIGN KEY (`officer_id`) REFERENCES `officer_requicisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition_orders`
--

LOCK TABLES `requisition_orders` WRITE;
/*!40000 ALTER TABLE `requisition_orders` DISABLE KEYS */;
INSERT INTO `requisition_orders` VALUES (76,'0000000001',1,1,9,'2020-07-24 10:05:15','Test sdfsd','2020-07-23 16:30:34','2020-07-24 10:05:15',1,1,0,1,2,'QC2020/0001',2,0,2,0),(77,'0000000002',2,2,12,'2020-09-14 16:30:34','Test puroosd','2020-09-14 16:30:34','2020-09-14 14:49:18',1,1,0,1,2,'QC2020/0002',1,1,2,0),(78,'0000000003',2,2,12,'2020-09-14 16:30:34','popo','2020-09-14 16:30:34','2020-09-14 14:50:31',1,1,0,1,1,'QC2020/0003',1,0,2,0),(79,'0000000004',2,2,12,'2020-09-14 16:30:34','Test ppp','2020-09-14 16:30:34','2020-09-14 15:50:08',1,1,0,1,1,'QC2020/0004',1,1,1,0),(80,'0000000005',2,2,12,'2020-09-15 16:30:34','tes test','2020-09-15 16:30:34','2020-09-14 16:11:21',1,1,0,1,1,'QC2020/2020',1,1,2,0);
/*!40000 ALTER TABLE `requisition_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_deps`
--

DROP TABLE IF EXISTS `sub_deps`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_deps` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `depId` int(11) NOT NULL,
  `subDepName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subervisorId` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_deps`
--

LOCK TABLES `sub_deps` WRITE;
/*!40000 ALTER TABLE `sub_deps` DISABLE KEYS */;
INSERT INTO `sub_deps` VALUES (1,8,'SWAT',1,NULL,NULL),(2,2,'Front Desk',NULL,'2020-07-16 15:21:36','2020-07-16 15:21:36'),(3,2,'Care Center',NULL,'2020-07-16 15:21:55','2020-07-16 15:21:55'),(4,2,'Call Center',NULL,'2020-07-16 15:22:23','2020-07-16 15:22:23'),(5,8,'NOC / IN',NULL,'2020-07-16 15:23:12','2020-07-16 15:23:12'),(6,8,'TRANSMISSION',NULL,'2020-07-16 15:23:26','2020-07-16 15:23:26'),(7,8,'ISP',NULL,'2020-07-16 15:23:42','2020-07-16 15:23:42'),(8,8,'OPTIMISATION / RF',NULL,'2020-07-16 15:23:55','2020-07-16 15:23:55'),(9,1,'ADMIN / HR',NULL,'2020-07-16 15:24:59','2020-07-16 15:24:59'),(10,3,'FINANCE & REVENUE ASSURANCE',NULL,'2020-07-16 15:25:28','2020-07-16 15:25:28'),(11,3,'DEPT COLLECTION',NULL,'2020-07-16 15:25:43','2020-07-16 15:25:43'),(12,7,'IT & BILLING',NULL,'2020-07-16 15:25:56','2020-07-16 15:25:56'),(13,6,'SALES',NULL,'2020-07-16 15:26:07','2020-07-16 15:26:07'),(14,4,'MARKETING',NULL,'2020-07-16 15:26:28','2020-07-16 15:26:28');
/*!40000 ALTER TABLE `sub_deps` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `suppliers`
--

DROP TABLE IF EXISTS `suppliers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `suppliers` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `contact` int(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'MP Trading','Lamin Village','2020-06-18 15:10:23','2020-06-18 15:10:23',4379681),(2,'Unique Solutions','31A Kairaba Avenue','2020-07-07 08:23:48','2020-07-07 08:23:48',5378200),(3,'Supplier 123','Supplier 123 Address','2020-10-13 12:53:40','2020-12-21 10:10:32',4472897);
/*!40000 ALTER TABLE `suppliers` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `users` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `uId` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  `department` int(11) NOT NULL,
  `uPassword` varchar(233) COLLATE utf8mb4_unicode_ci NOT NULL,
  `subDep` int(2) NOT NULL,
  `hasChangedPassword` int(2) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Bakary Camara','bakary.camara@qcell.gm',NULL,'1234',NULL,'2020-07-01 11:23:35','2020-07-27 11:04:09',7,3,1,'1234',9,1),(8,'Buba Sabally','buba.sabally@qcell.gm',NULL,'1234',NULL,'2020-07-17 11:14:33','2020-10-15 15:59:59',9,1,1,'1234',9,1),(9,'Oumie Ceesay','oumie.ceesay@qcell.gm',NULL,'1234',NULL,'2020-07-23 09:20:22','2020-09-17 09:21:29',11,2,1,'1234',9,1),(10,'Anam Jah Jobe','anam.jah@qcell.gm',NULL,'123',NULL,'2020-07-23 09:32:25','2020-07-23 09:32:25',12,2,2,'123',2,0),(11,'Augustine Jatta','augustine.jatta@qcell.gm',NULL,'123',NULL,'2020-07-23 09:36:26','2020-07-23 09:36:26',13,2,6,'123',13,0),(12,'Lamin Yaffa','lamin.yaffa@qcell.gm',NULL,'123',NULL,'2020-07-23 09:38:20','2020-07-23 09:38:20',14,2,7,'123',12,0),(13,'Ahamat Jah','ahamat.jah@qcell.gm',NULL,'1234',NULL,'2020-07-23 09:40:08','2020-09-14 16:48:50',15,2,8,'1234',1,1),(14,'Lamin O. Touray','lamin.touray1@qcell.gm',NULL,'123',NULL,'2020-07-24 13:16:26','2020-09-14 16:14:21',16,1,8,'123',1,1),(15,'Sohna Bittaye','sohna.bittaye@qcell.gm',NULL,'123',NULL,'2020-07-27 08:35:17','2020-08-17 09:32:54',17,3,1,'123',9,1);
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

-- Dump completed on 2020-12-21 13:28:46
