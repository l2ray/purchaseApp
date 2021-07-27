-- MySQL dump 10.13  Distrib 5.7.34, for Linux (x86_64)
--
-- Host: localhost    Database: ppp
-- ------------------------------------------------------
-- Server version	5.7.34-0ubuntu0.18.04.1

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
INSERT INTO `currency_types` VALUES (1,'Gambian Dalasi','D',0,'GMD','2021-01-05 16:17:59','2021-01-05 16:17:59'),(2,'United Kingdom Pound Sterling','£',0,'GBP','2021-01-05 16:17:59','2021-01-05 16:17:59'),(3,'United States Dollar','$',0,'USD','2021-01-05 16:17:59','2021-01-05 16:17:59'),(4,'European Euro','€',0,'EUR','2021-01-05 16:17:59','2021-01-05 16:17:59'),(5,'Canadian Dollar','$',0,'CAD','2021-01-05 16:17:59','2021-01-05 16:17:59'),(6,'Chinese Yuan Renminbi','¥',0,'CNY','2021-01-05 16:17:59','2021-01-05 16:17:59'),(7,'West African CFA','CFA',0,'XOF','2021-01-05 16:17:59','2021-01-05 16:17:59'),(8,'Nigerian Naira','₦',0,'NGN','2021-01-05 16:17:59','2021-01-05 16:17:59');
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
INSERT INTO `departments` VALUES (1,'rgrtert','2020-06-17 16:11:28','2021-07-22 15:12:35'),(2,'Customer Care','2020-06-28 13:11:30','2020-06-28 13:11:30'),(3,'Finance','2020-07-01 11:08:25','2020-07-01 11:08:25'),(4,'Marketing','2020-07-03 13:08:10','2020-07-06 17:23:35'),(5,'Projects','2020-07-03 13:08:10','2020-07-07 04:11:13'),(6,'Sales','2020-07-03 13:08:10','2020-07-03 13:08:10'),(7,'IT and Billing','2020-07-03 13:08:10','2020-07-03 13:08:10'),(8,'Technical','2020-07-03 13:08:10','2020-07-03 13:08:10');
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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discounts`
--

LOCK TABLES `discounts` WRITE;
/*!40000 ALTER TABLE `discounts` DISABLE KEYS */;
INSERT INTO `discounts` VALUES (1,1340.00,108,'2021-01-14 09:56:56','2021-01-14 09:56:56'),(2,1340.00,109,'2021-01-14 10:08:15','2021-01-14 10:08:15'),(3,1340.00,110,'2021-01-14 10:08:52','2021-01-14 10:08:52'),(4,1340.00,111,'2021-01-14 10:12:00','2021-01-14 10:12:00'),(5,100.00,131,'2021-06-23 11:05:53','2021-06-23 11:05:53'),(6,100000.00,147,'2021-06-29 09:48:51','2021-06-29 09:48:51'),(7,50000.00,148,'2021-06-29 10:03:44','2021-06-29 10:03:44'),(8,435.00,157,'2021-07-22 15:10:03','2021-07-22 15:10:03');
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_reason_requisions`
--

LOCK TABLES `justify_reason_requisions` WRITE;
/*!40000 ALTER TABLE `justify_reason_requisions` DISABLE KEYS */;
INSERT INTO `justify_reason_requisions` VALUES (1,'I am not accepting this request Sorry. ',15,46,'2021-01-13 13:49:51','2021-01-13 13:49:51',1,16),(2,'NOt iMportant for now and expensive',20,59,'2021-06-23 10:53:23','2021-06-23 10:53:23',1,16),(3,'NO funds yet.',20,66,'2021-06-23 11:28:06','2021-06-23 11:28:06',2,16);
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `justify_rejections`
--

LOCK TABLES `justify_rejections` WRITE;
/*!40000 ALTER TABLE `justify_rejections` DISABLE KEYS */;
INSERT INTO `justify_rejections` VALUES (1,'89',11,31,'2021-01-14 11:05:18','2021-01-14 11:05:18',1),(2,'This Phone is expensive',11,34,'2021-01-14 11:05:53','2021-01-14 11:05:53',1),(3,'Nope.. xyz reason.',15,58,'2021-06-22 12:45:25','2021-06-22 12:45:25',1);
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `migrations`
--

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;
INSERT INTO `migrations` VALUES (1,'2014_10_12_000000_create_users_table',1),(2,'2019_08_19_000000_create_failed_jobs_table',1),(3,'2020_06_16_162141_create_suppliers_table',2),(4,'2020_06_16_162231_create_departments_table',3),(5,'2020_06_16_162214_create_h_o_d_s_table',4),(6,'2020_06_16_162107_create_officer_requicisions_table',5),(7,'2020_06_16_162252_create_requisition_orders_table',6),(8,'2020_06_16_162158_create_product_orders_table',7),(9,'2020_06_16_162001_create_p_o_s_table',8),(10,'2020_06_17_123105_create_g_r_n_s_table',9),(11,'2020_06_30_084228_create_pending_requests_table',10),(12,'2020_06_30_084444_create_pending_requisition_requests_table',10),(15,'2020_07_09_120216_create_currency_types_table',11),(16,'2020_07_10_093448_create_discounts_table',12),(17,'2020_07_16_143015_create_sub_deps_table',13),(18,'2020_07_20_084342_create_justify_rejections_table',14),(19,'2020_07_20_164849_create_justify_reason_requisions_table',15),(20,'2021_01_05_133108_create_new_products_table',16),(21,'2021_06_26_151419_create_repos_table',17);
/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `new_products`
--

DROP TABLE IF EXISTS `new_products`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `new_products` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `productName` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1137 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `new_products`
--

LOCK TABLES `new_products` WRITE;
/*!40000 ALTER TABLE `new_products` DISABLE KEYS */;
INSERT INTO `new_products` VALUES (1,'\"10 Way Distrubution Box \"','2021-01-05 16:18:06','2021-01-05 16:18:06'),(2,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.','2021-01-05 16:18:06','2021-01-05 16:18:06'),(3,'1.2m x 16mm Diameter Copper Ground/Earth Rod','2021-01-05 16:18:06','2021-01-05 16:18:06'),(4,'1.5 mm² Black Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(5,'1.5 mm² Green/Yellow single core cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(6,'1.5 mm² Red Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(7,'1.5\" Wood screw 10mm2','2021-01-05 16:18:06','2021-01-05 16:18:06'),(8,'1.5mm² Three Core PVC Insulated PVC Sheathed Flexible Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(9,'½\" Galvanized Pipe','2021-01-05 16:18:06','2021-01-05 16:18:06'),(10,'1+1 INSTALLATION KIT-SLIM ROW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(11,'10 KVA Stabilizer','2021-01-05 16:18:06','2021-01-05 16:18:06'),(12,'10 mm² Black Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(13,'10 mm² Green/Yellow Single Core Cable\r\n\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(14,'10 mm² Red Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(15,'10 Way Distrubution Box\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(16,'10.0M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD  YELLOW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(17,'100A 1Phase + N Fase Cut Out','2021-01-05 16:18:06','2021-01-05 16:18:06'),(18,'100A Bushbar Chamber','2021-01-05 16:18:06','2021-01-05 16:18:06'),(19,'100A Double Pole Breaker','2021-01-05 16:18:06','2021-01-05 16:18:06'),(20,'100A Fuse Cut Out','2021-01-05 16:18:06','2021-01-05 16:18:06'),(21,'100A Three Phase Busbar Chamber','2021-01-05 16:18:06','2021-01-05 16:18:06'),(22,'10A Legrand Fuse; 10mm x 38mm','2021-01-05 16:18:06','2021-01-05 16:18:06'),(23,'10GB-LR,SFP+1310nm,20km SFP Refurbished','2021-01-05 16:18:06','2021-01-05 16:18:06'),(24,'1½\" WoodScrew\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(25,'110mm Clips','2021-01-05 16:18:06','2021-01-05 16:18:06'),(26,'110mm Elbow (PVC)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(27,'110mm PVC Rigid Pipe','2021-01-05 16:18:06','2021-01-05 16:18:06'),(28,'12 Core Singlemode OS2 LOOSE TUBE Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(29,'12 Way Distribution Box','2021-01-05 16:18:06','2021-01-05 16:18:06'),(30,'12*GE+8*10GE/GE Service Processing Board','2021-01-05 16:18:06','2021-01-05 16:18:06'),(31,'120 pcs 20cm Length','2021-01-05 16:18:06','2021-01-05 16:18:06'),(32,'120-16 Copper Cable Lug','2021-01-05 16:18:06','2021-01-05 16:18:06'),(33,'12Gb/s SAS10K','2021-01-05 16:18:06','2021-01-05 16:18:06'),(34,'12V 100AH Deep cycle Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(35,'12V 150AH Deep cycle Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(36,'12V 165Ah AGM Deep Cycle Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(37,'12V 190Ah Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(38,'12V 200AH Deep Cycle Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(39,'12V 210Ah Battery (Pure Lead-HighTemp)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(40,'12V 220Ah Battery (ODYSSEY)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(41,'12V 250Ah  Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(42,'12V 260AH Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(43,'12V 300Ah Deep Cycle Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(44,'12V 330Ah Battery (Relion Rev-8D Sla)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(45,'12V 88AH Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(46,'12V 95Ah Battery','2021-01-05 16:18:06','2021-01-05 16:18:06'),(47,'12VDC/96A Battery charger','2021-01-05 16:18:06','2021-01-05 16:18:06'),(48,'1500L Fuel Tanks','2021-01-05 16:18:06','2021-01-05 16:18:06'),(49,'15W40 Engine Oil','2021-01-05 16:18:06','2021-01-05 16:18:06'),(50,'16 Amps Single Pole Circuit Breaker','2021-01-05 16:18:06','2021-01-05 16:18:06'),(51,'16 mm² Black Single Core Rigid PVC Insulated Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(52,'16 mm² Green/Yellow Single Core Rigid PVC Insulated Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(53,'16 mm² Red Single Core Rigid PVC Insulated Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(54,'16-8mm² Cable Lugs','2021-01-05 16:18:06','2021-01-05 16:18:06'),(55,'16MM THREE PHASE ARMOURED CABLE-45M','2021-01-05 16:18:06','2021-01-05 16:18:06'),(56,'16mm x 25mm Trunking','2021-01-05 16:18:06','2021-01-05 16:18:06'),(57,'1800MHz Antenna','2021-01-05 16:18:06','2021-01-05 16:18:06'),(58,'1800MHZ GSM ANTENNAS\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(59,'1m x 1m x 1mm Copper Plate','2021-01-05 16:18:06','2021-01-05 16:18:06'),(60,'1meter foiled Twist(CAT5) Extra Lan','2021-01-05 16:18:06','2021-01-05 16:18:06'),(61,'1P10-CBL-16E1-OE-3M','2021-01-05 16:18:06','2021-01-05 16:18:06'),(62,'2-WAY WILKINSON SPLITTER (TICWS-2)\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(63,'2.4m x 16mm Diameter Copper Ground/Earth Rod','2021-01-05 16:18:06','2021-01-05 16:18:06'),(64,'2.5 mm² Green/Yellow Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(65,'2.5 mm² Red Single Core Cable\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(66,'2.5 mm² Three Core PVC Sheathed PVC Insulated Flexible Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(67,'2.5KVA Inverter 48VDC/220vac/50hz','2021-01-05 16:18:06','2021-01-05 16:18:06'),(68,'2.5mm 2 Core Flexible cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(69,'20M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD  YELLOW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(70,'20mm Coupling\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(71,'20mm Saddle Clips\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(72,'20mm Tee Circle box','2021-01-05 16:18:06','2021-01-05 16:18:06'),(73,'24 CORE SINGLEMODE OS2 G657A1 LOOSE TUBE CABLE, LSZH, ECA, EXT','2021-01-05 16:18:06','2021-01-05 16:18:06'),(74,'240-14 Copper Cable Lug','2021-01-05 16:18:06','2021-01-05 16:18:06'),(75,'240W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(76,'240w Solar Panel Large','2021-01-05 16:18:06','2021-01-05 16:18:06'),(77,'240w Solar Panel Small','2021-01-05 16:18:06','2021-01-05 16:18:06'),(78,'245W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(79,'24V 400W Solar Paenl','2021-01-05 16:18:06','2021-01-05 16:18:06'),(80,'24v POE INJECTOR\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(81,'2500L Fuel Tanks','2021-01-05 16:18:06','2021-01-05 16:18:06'),(82,'250W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(83,'250W 24V Solar Panel (Damaged)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(84,'250W 24V Solar Panels (Small)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(85,'25mm Bending Spring\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(86,'25mm Coupling\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(87,'25mm Flexible PVC Pipe','2021-01-05 16:18:06','2021-01-05 16:18:06'),(88,'25mm x 38mm PVC Trunking\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(89,'25mm2 Conduit Pipe','2021-01-05 16:18:06','2021-01-05 16:18:06'),(90,'260W Solar Panels','2021-01-05 16:18:06','2021-01-05 16:18:06'),(91,'265W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(92,'2B PENCILS WITHOUT ERASER\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(93,'2ft Flourescent tubes\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(94,'2m Thunderbolt cables','2021-01-05 16:18:06','2021-01-05 16:18:06'),(95,'2m Thunderbolt cables','2021-01-05 16:18:06','2021-01-05 16:18:06'),(96,'2meter foiled Twist(CAT5) Extra Lan','2021-01-05 16:18:06','2021-01-05 16:18:06'),(97,'3 WAY SPLITTER\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(98,'3-WAY WILKINSON SPLITTER (TICWS-3)\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(99,'3.0M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD YELLOW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(100,'3.5KVA, 48V DC, 220VAC, 50Hz Inverter','2021-01-05 16:18:06','2021-01-05 16:18:06'),(101,'¾\" Galvanized Elbow','2021-01-05 16:18:06','2021-01-05 16:18:06'),(102,'¾\" Galvanized Female Nipple','2021-01-05 16:18:06','2021-01-05 16:18:06'),(103,'¾\" Galvanized Male Nipple','2021-01-05 16:18:06','2021-01-05 16:18:06'),(104,'¾\" Galvanized Pipe','2021-01-05 16:18:06','2021-01-05 16:18:06'),(105,'¾\" Galvanized Tee','2021-01-05 16:18:06','2021-01-05 16:18:06'),(106,'¾\" Galvanized Union','2021-01-05 16:18:06','2021-01-05 16:18:06'),(107,'¾\" Stop Valve','2021-01-05 16:18:06','2021-01-05 16:18:06'),(108,'¾\" to ½\" Galvanized Female Reducer','2021-01-05 16:18:06','2021-01-05 16:18:06'),(109,'¾\" to ½\" Galvanized Male Reducer','2021-01-05 16:18:06','2021-01-05 16:18:06'),(110,'3000PRO POWER SUPPLY\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(111,'3000W, 48V Power Inverter 230AC, 50Hz, 30A','2021-01-05 16:18:06','2021-01-05 16:18:06'),(112,'300W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(113,'305W Solar Panels','2021-01-05 16:18:06','2021-01-05 16:18:06'),(114,'30M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD  YELLOW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(115,'315W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(116,'32 Manual changeover Switch','2021-01-05 16:18:06','2021-01-05 16:18:06'),(117,'320W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(118,'320W 24V Solar Panel (Damaged)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(119,'32A Legrand Fuse; 10mm x38mm','2021-01-05 16:18:06','2021-01-05 16:18:06'),(120,'32xE1/T1 Electrical Interface Switching Board(120 Ohm)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(121,'335W, 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(122,'345W, 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(123,'345W, 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(124,'35 * 16mm  Trunking\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(125,'355W 24V Solar Panel','2021-01-05 16:18:06','2021-01-05 16:18:06'),(126,'35mm² Bare Rigid Stranded Copper Cable for connecting Ground/Earth (in metres)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(127,'35mm² Copper Cable Lug','2021-01-05 16:18:06','2021-01-05 16:18:06'),(128,'35mm² Copper Split Bolt','2021-01-05 16:18:06','2021-01-05 16:18:06'),(129,'380V/415V 3P+N+PE 5PIN PLUG','2021-01-05 16:18:06','2021-01-05 16:18:06'),(130,'380V/415V 3P+N+PE 5PIN SOCKET','2021-01-05 16:18:06','2021-01-05 16:18:06'),(131,'3G Antenna Dual','2021-01-05 16:18:06','2021-01-05 16:18:06'),(132,'3G Dongle E153','2021-01-05 16:18:06','2021-01-05 16:18:06'),(133,'3G MIFI ROUTER','2021-01-05 16:18:06','2021-01-05 16:18:06'),(134,'3G Router old stock\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(135,'3G USB DONGLE(TECHNICAL IN)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(136,'3PINCHARGER','2021-01-05 16:18:06','2021-01-05 16:18:06'),(137,'4-Way Distribution Box','2021-01-05 16:18:06','2021-01-05 16:18:06'),(138,'4-WAY WILKINSON SPLITTER (TICWS-4)\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(139,'4000L Fuel Tanks','2021-01-05 16:18:06','2021-01-05 16:18:06'),(140,'40A Four Pole Contactor (LC1DT40M7)-KCL.0018.400.0.00','2021-01-05 16:18:06','2021-01-05 16:18:06'),(141,'48 CORE SINGLEMODE OS2 G657A1 MULTI-LOOSE TUBE CABLE, LSZH, ECA, EXT','2021-01-05 16:18:06','2021-01-05 16:18:06'),(142,'48V 60A MPPT Solar Charge Controller','2021-01-05 16:18:06','2021-01-05 16:18:06'),(143,'4A; Clear Glass Fuse; 5mm x 20mm','2021-01-05 16:18:06','2021-01-05 16:18:06'),(144,'4G DATACARD 8372H-153(Wingle)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(145,'4G Datacard Without WIFI(E3372)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(146,'4G ROUTER CPE B311S-20','2021-01-05 16:18:06','2021-01-05 16:18:06'),(147,'4G ROUTER E5577Fs-932','2021-01-05 16:18:06','2021-01-05 16:18:06'),(148,'4GB Server Memory (DDR3L)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(149,'4KVA 24VDC 240VAC INVERTER','2021-01-05 16:18:06','2021-01-05 16:18:06'),(150,'4M Mini BNC to BNC cables Customs','2021-01-05 16:18:06','2021-01-05 16:18:06'),(151,'4M Mini BNC to BNC cables Customs','2021-01-05 16:18:06','2021-01-05 16:18:06'),(152,'4m-CPE-4000-ST-1D-IV WIFI 3.4 \r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(153,'4mm² Three Core Flexible Cable','2021-01-05 16:18:06','2021-01-05 16:18:06'),(154,'4OAContactor 220V 50/60HZ','2021-01-05 16:18:06','2021-01-05 16:18:06'),(155,'4U RACK\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(156,'4xSTM-16 Optical Interface Board(S-16.1,LC)','2021-01-05 16:18:06','2021-01-05 16:18:06'),(157,'5.0M LC-LC OS2 DUPLEX FIBRE OPTIC PATCH LEAD  YELLOW','2021-01-05 16:18:06','2021-01-05 16:18:06'),(158,'50 Amps Double Pole Circuit Breaker\r\n','2021-01-05 16:18:06','2021-01-05 16:18:06'),(159,'50 pin connector for DD1 tally','2021-01-05 16:18:06','2021-01-05 16:18:06'),(160,'50 pin connector for DD1 tally','2021-01-05 16:18:06','2021-01-05 16:18:06'),(161,'50 pin connector for DD10 tally','2021-01-05 16:18:06','2021-01-05 16:18:06'),(162,'50 pin connector for DD10 tally','2021-01-05 16:18:07','2021-01-05 16:18:07'),(163,'500mm x 500mm x 1mm Copper Plate','2021-01-05 16:18:07','2021-01-05 16:18:07'),(164,'50m 3 Legged Angular Steel Tower (243.6 ton)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(165,'50mm Knauf Acoustic Roll (15.6m2)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(166,'50mm Knauf Acoustic Roll (15.6m2)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(167,'50mm x 50mm PVC Trunking\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(168,'5320 MITEL IP PHONE','2021-01-05 16:18:07','2021-01-05 16:18:07'),(169,'5A Double Pole Breaker with Cover','2021-01-05 16:18:07','2021-01-05 16:18:07'),(170,'5A; 5mm x 20mm Clear Glass Fuse for Photosensor Switch\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(171,'5Meter Foiled Twist','2021-01-05 16:18:07','2021-01-05 16:18:07'),(172,'6 Amps Single Pole Circuit Breaker','2021-01-05 16:18:07','2021-01-05 16:18:07'),(173,'6 Way Distribution Box/Board Single Phase','2021-01-05 16:18:07','2021-01-05 16:18:07'),(174,'6-8 Cable Lug Metalic','2021-01-05 16:18:07','2021-01-05 16:18:07'),(175,'6-8 Cable Lug Yellow','2021-01-05 16:18:07','2021-01-05 16:18:07'),(176,'60A 48V solar Charge Conntroller','2021-01-05 16:18:07','2021-01-05 16:18:07'),(177,'63A 4-Pole Circuit Breaker','2021-01-05 16:18:07','2021-01-05 16:18:07'),(178,'63A Double Pole Breaker','2021-01-05 16:18:07','2021-01-05 16:18:07'),(179,'63A Phase & Neutral Cut-out Fuse','2021-01-05 16:18:07','2021-01-05 16:18:07'),(180,'63xE1 Service Processing Board','2021-01-05 16:18:07','2021-01-05 16:18:07'),(181,'6A Double Pole Circuit Breaker','2021-01-05 16:18:07','2021-01-05 16:18:07'),(182,'6A; Legrand Fuse; 10mm x 38mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(183,'6U RACK\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(184,'7.5KVA GENERATOR','2021-01-05 16:18:07','2021-01-05 16:18:07'),(185,'70mm² Bare Rigid Stranded Copper cable(in meters)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(186,'70mm² Copper Cable Lug','2021-01-05 16:18:07','2021-01-05 16:18:07'),(187,'70mm² Insulated Rigid Stranded Copper Cable (in metres)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(188,'75MM * 50mm  Trunking','2021-01-05 16:18:07','2021-01-05 16:18:07'),(189,'75mm x 75mm  Cable Trunking','2021-01-05 16:18:07','2021-01-05 16:18:07'),(190,'75mm x 75mm  PVC Trunking','2021-01-05 16:18:07','2021-01-05 16:18:07'),(191,'8-55v DC to DC step down Converter','2021-01-05 16:18:07','2021-01-05 16:18:07'),(192,'8A Legrand Fuse; 10mm x 38mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(193,'8D-FB COAX CABLE\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(194,'8mm² Screw','2021-01-05 16:18:07','2021-01-05 16:18:07'),(195,'8mm² Wall Plug','2021-01-05 16:18:07','2021-01-05 16:18:07'),(196,'8PORT GIGABIT EASY SMART SWITCH 4PORT PEO\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(197,'9-DX-Lc-Sc-15yw','2021-01-05 16:18:07','2021-01-05 16:18:07'),(198,'900 DOWNTILT KIT\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(199,'95-12 Copper Cable Lug','2021-01-05 16:18:07','2021-01-05 16:18:07'),(200,'A4 Paper','2021-01-05 16:18:07','2021-01-05 16:18:07'),(201,'A4 Size Envelopes','2021-01-05 16:18:07','2021-01-05 16:18:07'),(202,'A5 Envelops','2021-01-05 16:18:07','2021-01-05 16:18:07'),(203,'Aarlogic (Alternative)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(204,'AC Switch\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(205,'Acrylic Polyurethane Coating','2021-01-05 16:18:07','2021-01-05 16:18:07'),(206,'Active Cooling Optical Module,null,null,null,dkba0.485.2365,WD2XTEC05000SP','2021-01-05 16:18:07','2021-01-05 16:18:07'),(207,'ACTIVE DI BOX','2021-01-05 16:18:07','2021-01-05 16:18:07'),(208,'ACTIVE DI BOX','2021-01-05 16:18:07','2021-01-05 16:18:07'),(209,'ADAPTER 11G\r\n\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(210,'Air Cleaner Element - 02.542.05.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(211,'Air Cleaning Element -D8.319.03.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(212,'Air Filter 100KVA','2021-01-05 16:18:07','2021-01-05 16:18:07'),(213,'Air Filter 7.5KVA','2021-01-05 16:18:07','2021-01-05 16:18:07'),(214,'AIR FILTER ELEMENT 200KVA','2021-01-05 16:18:07','2021-01-05 16:18:07'),(215,'Air Filter Element- D8.319.03.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(216,'Air Freshner','2021-01-05 16:18:07','2021-01-05 16:18:07'),(217,'Airless Diary 2020 Orange','2021-01-05 16:18:07','2021-01-05 16:18:07'),(218,'Airmax 12DBi 2GH DUALOMNI\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(219,'Airmax 13DBi 5GH DUALOMNI','2021-01-05 16:18:07','2021-01-05 16:18:07'),(220,'AIRMAX 18DBI SECTOR ANNTENA\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(221,'AISG CABLE\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(222,'Alternator 12V\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(223,'Alternator: 12V 35A - 46.390.01.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(224,'Angular Lampholder\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(225,'ANT,BS 3.3-3\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(226,'Antenna 900','2021-01-05 16:18:07','2021-01-05 16:18:07'),(227,'Antenna Am2-11W-CIRC-CR','2021-01-05 16:18:07','2021-01-05 16:18:07'),(228,'Antenna Am3-11W-CIRC-CR','2021-01-05 16:18:07','2021-01-05 16:18:07'),(229,'Antenna Am4-11W-CR','2021-01-05 16:18:07','2021-01-05 16:18:07'),(230,'Anti Vibration maint(90c\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(231,'Anti-Vibration Mounts - D1.314.02.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(232,'APM 30 POWER MODULE\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(233,'APM 30 Rectifier','2021-01-05 16:18:07','2021-01-05 16:18:07'),(234,'APM TP48','2021-01-05 16:18:07','2021-01-05 16:18:07'),(235,'APM30H verB','2021-01-05 16:18:07','2021-01-05 16:18:07'),(236,'APM30H verD','2021-01-05 16:18:07','2021-01-05 16:18:07'),(237,'APM5930(AC) Cabinet(Ver.A,220VAC,DBS5900)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(238,'ASA-5585-S20X-K9','2021-01-05 16:18:07','2021-01-05 16:18:07'),(239,'Audino cases Plastic','2021-01-05 16:18:07','2021-01-05 16:18:07'),(240,'Audino cases Plastic','2021-01-05 16:18:07','2021-01-05 16:18:07'),(241,'AUX Board','2021-01-05 16:18:07','2021-01-05 16:18:07'),(242,'Aux Contact Block for DG Contactor 1N0+INC','2021-01-05 16:18:07','2021-01-05 16:18:07'),(243,'Aviation Lamp Holder-Single\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(244,'AVR\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(245,'AVR- 2H.811.32.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(246,'AVR-SX460 (with installation tool)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(247,'AX-55 Fan Belts - D2.164.02..0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(248,'Axel Macrotel TBU','2021-01-05 16:18:07','2021-01-05 16:18:07'),(249,'Axel Macrotel TBU','2021-01-05 16:18:07','2021-01-05 16:18:07'),(250,'BA2 Board','2021-01-05 16:18:07','2021-01-05 16:18:07'),(251,'Ball Bearing\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(252,'BALLOON','2021-01-05 16:18:07','2021-01-05 16:18:07'),(253,'Banjo Bolt - M14X1.5','2021-01-05 16:18:07','2021-01-05 16:18:07'),(254,'Banjo Bolt - M8x1.25','2021-01-05 16:18:07','2021-01-05 16:18:07'),(255,'Banjo Bolt with strainer (2 443 456 900)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(256,'Batteries for Panasonic CF-52','2021-01-05 16:18:07','2021-01-05 16:18:07'),(257,'Batteries High Capacity & Charger','2021-01-05 16:18:07','2021-01-05 16:18:07'),(258,'Batteries High Capacity & Charger','2021-01-05 16:18:07','2021-01-05 16:18:07'),(259,'Battery','2021-01-05 16:18:07','2021-01-05 16:18:07'),(260,'Battery Cabinets','2021-01-05 16:18:07','2021-01-05 16:18:07'),(261,'Battery Charge Lamp; 12V; 2W; Screw Type','2021-01-05 16:18:07','2021-01-05 16:18:07'),(262,'Battery Charger 10A 12VDC - 02.872.18.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(263,'Battery Charger; 12V;6A; with Trickle & Boost','2021-01-05 16:18:07','2021-01-05 16:18:07'),(264,'Battery Charging Alternator; 12V (EA16 Engine)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(265,'Battery Room Door','2021-01-05 16:18:07','2021-01-05 16:18:07'),(266,'Battery Terminal\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(267,'BBC5200T Cabinet (Ver.A,-48VDC)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(268,'BBU 48VDC Power Cable -5m','2021-01-05 16:18:07','2021-01-05 16:18:07'),(269,'BBU Fan 3910','2021-01-05 16:18:07','2021-01-05 16:18:07'),(270,'Beacon (Aviation) Light- Photo Sensor Switches with BC','2021-01-05 16:18:07','2021-01-05 16:18:07'),(271,'Beacon (Aviation) Light- Small type','2021-01-05 16:18:07','2021-01-05 16:18:07'),(272,'Belt (AVX 10 1500) - 02.1266.01.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(273,'Black and 1 Yellow Cartridges','2021-01-05 16:18:07','2021-01-05 16:18:07'),(274,'Black Electrical Tape','2021-01-05 16:18:07','2021-01-05 16:18:07'),(275,'Black Installation Tape','2021-01-05 16:18:07','2021-01-05 16:18:07'),(276,'Black Magic studio','2021-01-05 16:18:07','2021-01-05 16:18:07'),(277,'Black Magic studio','2021-01-05 16:18:07','2021-01-05 16:18:07'),(278,'Blackmagic designer Mini converter-ANALOG TO SDI','2021-01-05 16:18:07','2021-01-05 16:18:07'),(279,'Blackmagic designer Mini converter-ANALOG TO SDI','2021-01-05 16:18:07','2021-01-05 16:18:07'),(280,'Blackmagic designer Mini converter-HDMI TO SDI6G','2021-01-05 16:18:07','2021-01-05 16:18:07'),(281,'Blackmagic designer Mini converter-HDMI TO SDI6G','2021-01-05 16:18:07','2021-01-05 16:18:07'),(282,'Blower Assembly- D4.023.30.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(283,'BM ULTRA STUDIO MINI RECORDER','2021-01-05 16:18:07','2021-01-05 16:18:07'),(284,'BM ULTRA STUDIO MINI RECORDER','2021-01-05 16:18:07','2021-01-05 16:18:07'),(285,'Bmax -4M-GPS\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(286,'BMAX CPE 7000','2021-01-05 16:18:07','2021-01-05 16:18:07'),(287,'BMD Decklink 2 Duo','2021-01-05 16:18:07','2021-01-05 16:18:07'),(288,'BMD Decklink 2 Duo','2021-01-05 16:18:07','2021-01-05 16:18:07'),(289,'BMD Decklink Quad 2','2021-01-05 16:18:07','2021-01-05 16:18:07'),(290,'BMD Decklink Quad 2','2021-01-05 16:18:07','2021-01-05 16:18:07'),(291,'BMD Extreme decklink 4k12','2021-01-05 16:18:07','2021-01-05 16:18:07'),(292,'BMD Extreme decklink 4k12','2021-01-05 16:18:07','2021-01-05 16:18:07'),(293,'BMD Mini converter SDI','2021-01-05 16:18:07','2021-01-05 16:18:07'),(294,'BMD Mini converter SDI','2021-01-05 16:18:07','2021-01-05 16:18:07'),(295,'BOLTS AND NUT (10mm) \r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(296,'Bracket','2021-01-05 16:18:07','2021-01-05 16:18:07'),(297,'Brackets','2021-01-05 16:18:07','2021-01-05 16:18:07'),(298,'Brackets viewfinder LDK 500','2021-01-05 16:18:07','2021-01-05 16:18:07'),(299,'Brackets viewfinder LDK 500','2021-01-05 16:18:07','2021-01-05 16:18:07'),(300,'BTS APM 30 HVD','2021-01-05 16:18:07','2021-01-05 16:18:07'),(301,'BTS Power slots','2021-01-05 16:18:07','2021-01-05 16:18:07'),(302,'Bucket\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(303,'Burglar Proof For BTS','2021-01-05 16:18:07','2021-01-05 16:18:07'),(304,'C3850-NM-2-10G','2021-01-05 16:18:07','2021-01-05 16:18:07'),(305,'Cable Clips\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(306,'CABLE EXTRALINK CAT5','2021-01-05 16:18:07','2021-01-05 16:18:07'),(307,'Cable Fixing Clamp,6 Runs(2x3 stacks),C Type Bracket,for Optical Cable + 3.3/4/6/8.3mm^2 RRU Power Cable','2021-01-05 16:18:07','2021-01-05 16:18:07'),(308,'CABLE TIES','2021-01-05 16:18:07','2021-01-05 16:18:07'),(309,'CABLE TIES 150MM','2021-01-05 16:18:07','2021-01-05 16:18:07'),(310,'CABLE TIES 300MM','2021-01-05 16:18:07','2021-01-05 16:18:07'),(311,'Cable Ties Large','2021-01-05 16:18:07','2021-01-05 16:18:07'),(312,'Cable Ties Medium','2021-01-05 16:18:07','2021-01-05 16:18:07'),(313,'CABLE UBIQUITI-Carrier','2021-01-05 16:18:07','2021-01-05 16:18:07'),(314,'CABLE UBIQUITI-TC-PR0','2021-01-05 16:18:07','2021-01-05 16:18:07'),(315,'Calculator','2021-01-05 16:18:07','2021-01-05 16:18:07'),(316,'Camera Plates','2021-01-05 16:18:07','2021-01-05 16:18:07'),(317,'Camera Plates','2021-01-05 16:18:07','2021-01-05 16:18:07'),(318,'Camshaft Assembly-D4.302.30.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(319,'Car Sticker(glossy Transparent)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(320,'Car Sticker(white,glossy)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(321,'Caretaker Room Door','2021-01-05 16:18:07','2021-01-05 16:18:07'),(322,'Caretaker Room Window','2021-01-05 16:18:07','2021-01-05 16:18:07'),(323,'CBL-BB/50','2021-01-05 16:18:07','2021-01-05 16:18:07'),(324,'CBL.BB/10\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(325,'Celenit 25mm Acoustic boards 0.6 x 1.2m','2021-01-05 16:18:07','2021-01-05 16:18:07'),(326,'Celenit 25mm Acoustic boards 0.6 x 1.2m','2021-01-05 16:18:07','2021-01-05 16:18:07'),(327,'Cello Tapes','2021-01-05 16:18:07','2021-01-05 16:18:07'),(328,'Central Monitor Unit Spare Part','2021-01-05 16:18:07','2021-01-05 16:18:07'),(329,'CERAGON INSTATALLATION KIT\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(330,'Ceragon Microwave 11G AM3','2021-01-05 16:18:07','2021-01-05 16:18:07'),(331,'Chassis OSN580','2021-01-05 16:18:07','2021-01-05 16:18:07'),(332,'Circuit Breaker compartment','2021-01-05 16:18:07','2021-01-05 16:18:07'),(333,'Cisco 4500X-16SFP+ W/dual ac + enterprise licence','2021-01-05 16:18:07','2021-01-05 16:18:07'),(334,'Cisco SG 550GX-24F-K9-New','2021-01-05 16:18:07','2021-01-05 16:18:07'),(335,'Cisco SG 550X-48-K9-New','2021-01-05 16:18:07','2021-01-05 16:18:07'),(336,'Clamps 3 in 1','2021-01-05 16:18:07','2021-01-05 16:18:07'),(337,'Clamps 3 in 1','2021-01-05 16:18:07','2021-01-05 16:18:07'),(338,'Clamps with Plug 110mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(339,'Clear Glass Fuse; 6.3A; 25mm x 5mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(340,'CLOUD ROUTER SWITCH 112-8G WIT 4PORT\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(341,'CMP.XT-BS-3.X','2021-01-05 16:18:07','2021-01-05 16:18:07'),(342,'COMPACT ATTACHED ANTENNA','2021-01-05 16:18:07','2021-01-05 16:18:07'),(343,'COMPACT POWER CABLE 50M','2021-01-05 16:18:07','2021-01-05 16:18:07'),(344,'Compartment Cover of Double Pole Breaker','2021-01-05 16:18:07','2021-01-05 16:18:07'),(345,'Connecting Rod Assembly','2021-01-05 16:18:07','2021-01-05 16:18:07'),(346,'Connecting Rod Large end bearings in pairs- D3.030.02.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(347,'Connecting Rod Small end Bushing - D3.030.03.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(348,'CONNECTORS','2021-01-05 16:18:07','2021-01-05 16:18:07'),(349,'Contactor 40A; 4-Pole; 230V','2021-01-05 16:18:07','2021-01-05 16:18:07'),(350,'Controller Unit','2021-01-05 16:18:07','2021-01-05 16:18:07'),(351,'Copper Busbar (20cm x 4cm x5mm)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(352,'Copper Lightning Arrestor Rod (80cm x 2cm diameter) with base','2021-01-05 16:18:07','2021-01-05 16:18:07'),(353,'Copper split bolt for 70mm² cable','2021-01-05 16:18:07','2021-01-05 16:18:07'),(354,'Copper Washer; 14mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(355,'Copper Washer; 8mm','2021-01-05 16:18:07','2021-01-05 16:18:07'),(356,'COVER RRU\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(357,'CPE 7000 3GHZ WIMAX/LTE','2021-01-05 16:18:07','2021-01-05 16:18:07'),(358,'CPE Outdoor LTE','2021-01-05 16:18:07','2021-01-05 16:18:07'),(359,'CPE-CABLE-UK\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(360,'CPE-IDU-NGV 4D2V\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(361,'CPE7000 POE 1D','2021-01-05 16:18:07','2021-01-05 16:18:07'),(362,'CRANKSHAFT END BEARING IN PAIRS','2021-01-05 16:18:07','2021-01-05 16:18:07'),(363,'CUP(BIG)\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(364,'CUP(SMALL)\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(365,'Custom Diaries Orange','2021-01-05 16:18:07','2021-01-05 16:18:07'),(366,'CXLLN\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(367,'Cylinder Head Assembly Complete- D7.303.20.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(368,'Cylinder Head Cover Gasket','2021-01-05 16:18:07','2021-01-05 16:18:07'),(369,'Cylinder Liner Optimised FINS-EAF8 - D7.317.01.0.00','2021-01-05 16:18:07','2021-01-05 16:18:07'),(370,'D12S Board','2021-01-05 16:18:07','2021-01-05 16:18:07'),(371,'DAHL IN TOUCH 1 (Defective Battery)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(372,'DAHL IN TOUCH P','2021-01-05 16:18:07','2021-01-05 16:18:07'),(373,'DAHL INTOUCH 1','2021-01-05 16:18:07','2021-01-05 16:18:07'),(374,'DAHL INTRO','2021-01-05 16:18:07','2021-01-05 16:18:07'),(375,'Data Cables','2021-01-05 16:18:07','2021-01-05 16:18:07'),(376,'Data Cables','2021-01-05 16:18:07','2021-01-05 16:18:07'),(377,'Data Sim card(Mobile broadband)','2021-01-05 16:18:07','2021-01-05 16:18:07'),(378,'DB15-RJ45-10\r\n','2021-01-05 16:18:07','2021-01-05 16:18:07'),(379,'DBS Antenna Feeder Installation Auxiliary Kit Per Sector,General Area','2021-01-05 16:18:07','2021-01-05 16:18:07'),(380,'DBS Cable Suite Label','2021-01-05 16:18:07','2021-01-05 16:18:07'),(381,'DBS5900 Base','2021-01-05 16:18:07','2021-01-05 16:18:07'),(382,'DC Power Distribution Unit','2021-01-05 16:18:07','2021-01-05 16:18:07'),(383,'DC Power Distribution Unit Spare Part','2021-01-05 16:18:07','2021-01-05 16:18:07'),(384,'DCDU-03 B','2021-01-05 16:18:07','2021-01-05 16:18:07'),(385,'DCDU-12 B','2021-01-05 16:18:07','2021-01-05 16:18:07'),(386,'DD1 Vision Mixer','2021-01-05 16:18:07','2021-01-05 16:18:07'),(387,'DD1 Vision Mixer','2021-01-05 16:18:07','2021-01-05 16:18:07'),(388,'DD10 Vision mixer','2021-01-05 16:18:07','2021-01-05 16:18:07'),(389,'DD10 Vision mixer','2021-01-05 16:18:08','2021-01-05 16:18:08'),(390,'DDF Frame','2021-01-05 16:18:08','2021-01-05 16:18:08'),(391,'Dell PowerConnect 3448P - Refurbished','2021-01-05 16:18:08','2021-01-05 16:18:08'),(392,'DESK PHONE Holder\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(393,'DESK PHONE KG933-B','2021-01-05 16:18:08','2021-01-05 16:18:08'),(394,'Desktop PC Tower intel core i7 Eight Core Processor i7-9700K (3.6GHz) 12MB Cache 16GB Corsair VENGEANCE DDR4 2666MHz (2 x 8GB) ITB','2021-01-05 16:18:08','2021-01-05 16:18:08'),(395,'Desktop PC Tower intel core i7 Eight Core Processor i7-9700K (3.6GHz) 12MB Cache 16GB Corsair VENGEANCE DDR4 2666MHz (2 x 8GB) ITB','2021-01-05 16:18:08','2021-01-05 16:18:08'),(396,'DG Starter','2021-01-05 16:18:08','2021-01-05 16:18:08'),(397,'Diary','2021-01-05 16:18:08','2021-01-05 16:18:08'),(398,'Directional Antenna,2MX-1695-2690-33-20i-M-R,4*4.3-10 Female,Downtilt kit packed separately','2021-01-05 16:18:08','2021-01-05 16:18:08'),(399,'Directional Antenna,DXXXX-690-960/690-960/1695-2690/1695-2690-65/65/65/65-16i/16i/18i/18i-M/M/M/M-R,8*4.3-10 Female,Downtilt kit packed separately','2021-01-05 16:18:08','2021-01-05 16:18:08'),(400,'DISC CONNECTION MODULE\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(401,'DISC CPU MEMORY\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(402,'Distilled Water - 12litre Per Box','2021-01-05 16:18:08','2021-01-05 16:18:08'),(403,'DKBA8.807.0202,Outdoor label,cBTS3612,55*20*0.5,GE 8B35,T0.5','2021-01-05 16:18:08','2021-01-05 16:18:08'),(404,'DM-CPE-7000PRO-ID','2021-01-05 16:18:08','2021-01-05 16:18:08'),(405,'Double Gang One Way Switch\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(406,'Double Gang Socket\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(407,'Double Gang Surface Box\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(408,'Double Surface Box','2021-01-05 16:18:08','2021-01-05 16:18:08'),(409,'Downtilt Kit-D','2021-01-05 16:18:08','2021-01-05 16:18:08'),(410,'DPUb Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(411,'DPUe (3052799) Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(412,'DUAL ANTENNA\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(413,'Dual Antenna 900/2100M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(414,'DX ODU','2021-01-05 16:18:08','2021-01-05 16:18:08'),(415,'E1 Cable - Ceregon','2021-01-05 16:18:08','2021-01-05 16:18:08'),(416,'E1 Cable (1200HM)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(417,'EA16 G1 with AMF Panel 15KVA/1EB Service AMF Panel Set Closed Type Including 300Ltrs Ext Tank Including Hybrid Controller for 48VDC System','2021-01-05 16:18:08','2021-01-05 16:18:08'),(418,'Earth Bar','2021-01-05 16:18:08','2021-01-05 16:18:08'),(419,'EFSO Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(420,'EGS4 Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(421,'EGT2\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(422,'Eight (8) Way Single Phase Distribution Box / Consumer Unit\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(423,'EIUa Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(424,'Electical interface Boards','2021-01-05 16:18:08','2021-01-05 16:18:08'),(425,'Electrical Insulation Putty Tape','2021-01-05 16:18:08','2021-01-05 16:18:08'),(426,'ELECTRICAL INTERFACE MODULE\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(427,'ELECTRICAL TAPE\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(428,'Enclosed Bulkhead Light Fitting\r\n\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(429,'Engine Safety unit 12/24V\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(430,'Engine Starter 7.5KVA - 45.389.01.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(431,'Engine Temperature Switch','2021-01-05 16:18:08','2021-01-05 16:18:08'),(432,'ENVELOP(A4  with window)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(433,'ENVELOP(A4  without window)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(434,'ENVELOP(Letter size with window)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(435,'ENVELOP(Letter size without window)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(436,'EpoxyZinc Phosphate Primer','2021-01-05 16:18:08','2021-01-05 16:18:08'),(437,'EPU05A-11 Spare Part','2021-01-05 16:18:08','2021-01-05 16:18:08'),(438,'EPU05A-12 Spare Part','2021-01-05 16:18:08','2021-01-05 16:18:08'),(439,'EPW30-48A -(2130608)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(440,'Ethernet Cables','2021-01-05 16:18:08','2021-01-05 16:18:08'),(441,'Ethernet SURGE PROTECTOR \r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(442,'Exhaust fan frame\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(443,'Exhaust Valve (FINISH)-EAF8 -D7.312.01.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(444,'Expansion Bellow -232MM - D4.122.02.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(445,'Expansion Bolt 6M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(446,'Expansion Bolt 8mm2','2021-01-05 16:18:08','2021-01-05 16:18:08'),(447,'EXPANSION ENCLOSURE','2021-01-05 16:18:08','2021-01-05 16:18:08'),(448,'Extension Ladder','2021-01-05 16:18:08','2021-01-05 16:18:08'),(449,'Extractor Fan','2021-01-05 16:18:08','2021-01-05 16:18:08'),(450,'Face Mask per box(2100)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(451,'FAN\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(452,'Fan Belt (V-Belt) 200KVA','2021-01-05 16:18:08','2021-01-05 16:18:08'),(453,'Fan Belt 200KVA\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(454,'Fan Belt V- Belt (NO part)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(455,'Fan Belt V-Balt (A*55)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(456,'Fan Belt V-Balt (A*56)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(457,'FAN BOX\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(458,'FAN02A/G Unit','2021-01-05 16:18:08','2021-01-05 16:18:08'),(459,'FG2a Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(460,'Fibre cable 100M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(461,'Fibre Cable 30M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(462,'Fibre cable 50M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(463,'Fibre cable 70M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(464,'FIBRE CABLE LC SC 15M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(465,'Fibre Cables 60M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(466,'Fibre Cables 80m','2021-01-05 16:18:08','2021-01-05 16:18:08'),(467,'Fibre Clamps','2021-01-05 16:18:08','2021-01-05 16:18:08'),(468,'Fibre Enclosure Nenco','2021-01-05 16:18:08','2021-01-05 16:18:08'),(469,'FIBRE LC FC 20M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(470,'FIBRE LC LC 15M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(471,'Fibre Lc Sc single mode','2021-01-05 16:18:08','2021-01-05 16:18:08'),(472,'FIBRE MULTI MODE 20M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(473,'Fibre Power Clams','2021-01-05 16:18:08','2021-01-05 16:18:08'),(474,'Fibre RRU 70m','2021-01-05 16:18:08','2021-01-05 16:18:08'),(475,'FIBRE SC SC 15M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(476,'FIBRE SINGLE MODE 20M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(477,'FIBRE SINGLE MODE 3M\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(478,'Fiter clams','2021-01-05 16:18:08','2021-01-05 16:18:08'),(479,'Fixed Antenna\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(480,'Flags 2.5meters(Without Stand)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(481,'Flags 3.1meters','2021-01-05 16:18:08','2021-01-05 16:18:08'),(482,'Flags 5meters','2021-01-05 16:18:08','2021-01-05 16:18:08'),(483,'Flash and wall plugs\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(484,'Flat Files','2021-01-05 16:18:08','2021-01-05 16:18:08'),(485,'FLEX Pipe','2021-01-05 16:18:08','2021-01-05 16:18:08'),(486,'FLEXIBLE PIPE 20MM','2021-01-05 16:18:08','2021-01-05 16:18:08'),(487,'Flourescent light Starter\r\n\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(488,'FOOTBALL JERSEY NEW','2021-01-05 16:18:08','2021-01-05 16:18:08'),(489,'FOOTBALL JERSEY SET','2021-01-05 16:18:08','2021-01-05 16:18:08'),(490,'Forsthoff PVC Welder','2021-01-05 16:18:08','2021-01-05 16:18:08'),(491,'FSL LED 8W LIGHTS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(492,'FSL LED 8W LIGHTS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(493,'FTP 0.5meter 1GBT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(494,'FTP 1meter 1GBT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(495,'FTP 2meter 1GBT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(496,'FTP 3meter 1GBT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(497,'FTP 5Meter 1GBT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(498,'FUEL FEED PUMP','2021-01-05 16:18:08','2021-01-05 16:18:08'),(499,'Fuel Feed Pump-D4.119.02.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(500,'Fuel Filter','2021-01-05 16:18:08','2021-01-05 16:18:08'),(501,'Fuel filter 200KVA\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(502,'fuel filter 200KVA\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(503,'Fuel Filter Element - 03.922.42.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(504,'Fuel Filter Element - AV2-34.032.03.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(505,'Fuel Filters 400KVA\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(506,'Fuel Guage 12V DC','2021-01-05 16:18:08','2021-01-05 16:18:08'),(507,'Fuel Injection Pump for EA16 (8.111.02.0.00)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(508,'fuel pipe \r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(509,'fuel pipe (filterto to fuel\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(510,'Fuel Pipe Combined Fuel Filter to Fuel FeedPump','2021-01-05 16:18:08','2021-01-05 16:18:08'),(511,'Fuel pipe Combined Fuel Pumps to Fuel Filter- DC.305.02.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(512,'Fuel pipe Connecting Feed Pump to Base Tank- D8.308.09.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(513,'Fuel Pipe Connecting Fuel Filter to Base Tank- D8.308.09.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(514,'Fuel Pipe Connecting Injectors to Base Tank (Overflow pipe Inject to Tank)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(515,'FUEL PUMP RACK ADJUSTMENT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(516,'FUEL PUMP WITH OVERLOAD SHAPPER','2021-01-05 16:18:08','2021-01-05 16:18:08'),(517,'Fuel pump with overload stopper -D8.111.01.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(518,'FUEL TANK 300L','2021-01-05 16:18:08','2021-01-05 16:18:08'),(519,'Fuels pipes\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(520,'GALAXY TAB3 116','2021-01-05 16:18:08','2021-01-05 16:18:08'),(521,'Galvanized steel bracket with galvanized steel bolts, washers, and nuts for the lightning arrestor rod','2021-01-05 16:18:08','2021-01-05 16:18:08'),(522,'Gasket Glue','2021-01-05 16:18:08','2021-01-05 16:18:08'),(523,'GCU 10KVA - 02.026.18.0.PR','2021-01-05 16:18:08','2021-01-05 16:18:08'),(524,'GCUa Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(525,'Gear Pump, DM20/DA20, RR With STL Ext Gear & Rel. Valve','2021-01-05 16:18:08','2021-01-05 16:18:08'),(526,'GENERATOR CONTROL UNIT','2021-01-05 16:18:08','2021-01-05 16:18:08'),(527,'Generator Room Door','2021-01-05 16:18:08','2021-01-05 16:18:08'),(528,'GOUC Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(529,'Governor Push Rod (F.W.E)-11.037.03.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(530,'Governor Spring (1500 & 1800RPM)-10.018.02.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(531,'GPS Antenna\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(532,'GPS-CBL-5M','2021-01-05 16:18:08','2021-01-05 16:18:08'),(533,'Grass  Valley RY 1912','2021-01-05 16:18:08','2021-01-05 16:18:08'),(534,'Grass  Valley RY 1912','2021-01-05 16:18:08','2021-01-05 16:18:08'),(535,'Grass  Valley RY 1943','2021-01-05 16:18:08','2021-01-05 16:18:08'),(536,'Grass  Valley RY 1943','2021-01-05 16:18:08','2021-01-05 16:18:08'),(537,'Grass  Valley Tripodmadapters','2021-01-05 16:18:08','2021-01-05 16:18:08'),(538,'Grass  Valley Tripodmadapters','2021-01-05 16:18:08','2021-01-05 16:18:08'),(539,'Grass Valley DD1 switcher complete','2021-01-05 16:18:08','2021-01-05 16:18:08'),(540,'Grass Valley DD1 switcher complete','2021-01-05 16:18:08','2021-01-05 16:18:08'),(541,'Grass Valley LDK 500 Camera Body only','2021-01-05 16:18:08','2021-01-05 16:18:08'),(542,'Grass Valley LDK 500 Camera Body only','2021-01-05 16:18:08','2021-01-05 16:18:08'),(543,'Grass Valley LDK 500 Camera chains Camera (Body only) CCU RCP/OCP','2021-01-05 16:18:08','2021-01-05 16:18:08'),(544,'Grass Valley LDK 500 Camera chains Camera (Body only) CCU RCP/OCP','2021-01-05 16:18:08','2021-01-05 16:18:08'),(545,'Grass Valley RY1217','2021-01-05 16:18:08','2021-01-05 16:18:08'),(546,'Grass Valley RY1217','2021-01-05 16:18:08','2021-01-05 16:18:08'),(547,'Grass valley Tripod Plates','2021-01-05 16:18:08','2021-01-05 16:18:08'),(548,'Grass valley Tripod Plates','2021-01-05 16:18:08','2021-01-05 16:18:08'),(549,'Grinding Paste\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(550,'Ground/Earth Enhancing materials (in bags)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(551,'Ground/Earth Rod Clamp for 70mm²','2021-01-05 16:18:08','2021-01-05 16:18:08'),(552,'Ground/Earth Rod Coupling','2021-01-05 16:18:08','2021-01-05 16:18:08'),(553,'GROUNDING BAR\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(554,'GROUNDING CABLE 16MM\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(555,'GROUNDING CABLE 25MM\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(556,'GRRU 1800 Low Capacity RRU','2021-01-05 16:18:08','2021-01-05 16:18:08'),(557,'GSCC Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(558,'GTMUb1 (03030LMP) Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(559,'Hacksaw Blade\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(560,'Harris HD12 Multiviwer Used','2021-01-05 16:18:08','2021-01-05 16:18:08'),(561,'Harris HD12 Multiviwer Used','2021-01-05 16:18:08','2021-01-05 16:18:08'),(562,'Hassis HD12 Multiviwer used','2021-01-05 16:18:08','2021-01-05 16:18:08'),(563,'Headsheet','2021-01-05 16:18:08','2021-01-05 16:18:08'),(564,'Heater Unit Spare Part','2021-01-05 16:18:08','2021-01-05 16:18:08'),(565,'Highlighter (Multi-Colour)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(566,'HP ODU\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(567,'HP Scanner assembly Q3938-37901','2021-01-05 16:18:08','2021-01-05 16:18:08'),(568,'HR-SR04 Sensor','2021-01-05 16:18:08','2021-01-05 16:18:08'),(569,'HRSS1150-900','2021-01-05 16:18:08','2021-01-05 16:18:08'),(570,'HUAWEI E1\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(571,'Huawei PSU','2021-01-05 16:18:08','2021-01-05 16:18:08'),(572,'Huawei Rectifier Refurbished (R4850G2)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(573,'Huawei S5731-H24T4XC','2021-01-05 16:18:08','2021-01-05 16:18:08'),(574,'HUNS3 Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(575,'HW INSTALLATION KIT\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(576,'IDU 2.2M DC Cable','2021-01-05 16:18:08','2021-01-05 16:18:08'),(577,'IDU IP10','2021-01-05 16:18:08','2021-01-05 16:18:08'),(578,'IDU IP20','2021-01-05 16:18:08','2021-01-05 16:18:08'),(579,'IDU Power cable','2021-01-05 16:18:08','2021-01-05 16:18:08'),(580,'IDU-ODU-CBL-RFU=305m(Transmission Cable)','2021-01-05 16:18:08','2021-01-05 16:18:08'),(581,'IFIB Board','2021-01-05 16:18:08','2021-01-05 16:18:08'),(582,'INDOOR CASE CAT50\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(583,'INDOOR OMNI CEILING ANTENNA(TICIA-3)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(584,'INDOOR PANEL ANTENNA (TICIA-8)\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(585,'Injector Assl ye With\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(586,'Inlet Valve-EAF8 -D7.311.01.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(587,'Installation Kits','2021-01-05 16:18:08','2021-01-05 16:18:08'),(588,'Insulating Adhesive Tape,19mm*0.13mm*10m,White,Color Coding,PVC','2021-01-05 16:18:08','2021-01-05 16:18:08'),(589,'INTERNET CABLE\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(590,'IP-20C-High Power-11-500-1W6-H-ESS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(591,'IP-20C-High Power-11-500-1W6-L-ESS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(592,'IP-20C-High Power-11-500-7W13-H-ESS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(593,'IP-20C-High Power-11-500-7W13-L-ESS','2021-01-05 16:18:08','2021-01-05 16:18:08'),(594,'IP-20G-M2-E6-T16-2DC+SM','2021-01-05 16:18:08','2021-01-05 16:18:08'),(595,'IP10-G(R3)Eth,16EI,Tslt syncU,XPIC','2021-01-05 16:18:08','2021-01-05 16:18:08'),(596,'IP105(R3)-16EI-SLT-SU','2021-01-05 16:18:08','2021-01-05 16:18:08'),(597,'IP20 POWER Cable','2021-01-05 16:18:08','2021-01-05 16:18:08'),(598,'IP20GX\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(599,'IP20N\r\n','2021-01-05 16:18:08','2021-01-05 16:18:08'),(600,'Joint For Push Rod Tube Support- 12.005.11.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(601,'Joint Gear Cover & Gear Cover Plate (SPPL-SS/KO/1176)-11.014.04.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(602,'Joint: Rocker Cover EAF8 7EA1 - D7.304.04.0.00','2021-01-05 16:18:08','2021-01-05 16:18:08'),(603,'JUMPER 20MM','2021-01-05 16:18:09','2021-01-05 16:18:09'),(604,'JUMPERS','2021-01-05 16:18:09','2021-01-05 16:18:09'),(605,'KG640 Controller Unit - 02.026.18.0.PR','2021-01-05 16:18:09','2021-01-05 16:18:09'),(606,'Kirloskar Green AVR (Model: TAVR-10/TAVR-20/TAVR-14) - 2H.811.32.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(607,'L.O. Pipe Assembly','2021-01-05 16:18:09','2021-01-05 16:18:09'),(608,'Landing Cards','2021-01-05 16:18:09','2021-01-05 16:18:09'),(609,'Landyard With Metal','2021-01-05 16:18:09','2021-01-05 16:18:09'),(610,'Large End Bearing','2021-01-05 16:18:09','2021-01-05 16:18:09'),(611,'Large End Bearing','2021-01-05 16:18:09','2021-01-05 16:18:09'),(612,'LC PIG/SM-1M','2021-01-05 16:18:09','2021-01-05 16:18:09'),(613,'LC-FC 30M (STRAIGHT END FINISH)\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(614,'LC-LC, 10M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(615,'LC-LC, 10M (Straight End Finish)- Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(616,'LC-LC, 20M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(617,'LC-LC, 20M (Straight End Finish)- Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(618,'LC-LC, 30M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(619,'LC-LC, 30M (Straight End Finish)- Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(620,'LC-SC 30M (Straight End Finish) - Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(621,'LC-SC, 10M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(622,'LC-SC, 10M (Straight End Finish)- Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(623,'LC-SC, 20M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(624,'LC-SC, 20M (Straight End Finish)- Single-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(625,'LC-SC, 30M (Straight End Finish)- Multi-mode','2021-01-05 16:18:09','2021-01-05 16:18:09'),(626,'LCLC FIBRE','2021-01-05 16:18:09','2021-01-05 16:18:09'),(627,'LED 7w screw type energy \r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(628,'LED Flood light 30w\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(629,'LED Flood Light 50w','2021-01-05 16:18:09','2021-01-05 16:18:09'),(630,'Lemo 4M Connectors for LDK 500 Camera','2021-01-05 16:18:09','2021-01-05 16:18:09'),(631,'Lemo 4M Connectors for LDK 500 Camera','2021-01-05 16:18:09','2021-01-05 16:18:09'),(632,'Lemo Connector','2021-01-05 16:18:09','2021-01-05 16:18:09'),(633,'Lemo Connector','2021-01-05 16:18:09','2021-01-05 16:18:09'),(634,'Lenses as above TBC','2021-01-05 16:18:09','2021-01-05 16:18:09'),(635,'Lenses as above TBC','2021-01-05 16:18:09','2021-01-05 16:18:09'),(636,'Letter Size Envelopes','2021-01-05 16:18:09','2021-01-05 16:18:09'),(637,'Lever Arch Folders','2021-01-05 16:18:09','2021-01-05 16:18:09'),(638,'LIC Board IP20','2021-01-05 16:18:09','2021-01-05 16:18:09'),(639,'Light Energy Bulbs, Pin type (8W)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(640,'Light Energy Bulbs, Screw Type (11W)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(641,'Light Energy Bulbs, Screw Type (8W)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(642,'Log/Quire Book','2021-01-05 16:18:09','2021-01-05 16:18:09'),(643,'Lot of Profiles C shape 2808m of Montante 1008m of Canal','2021-01-05 16:18:09','2021-01-05 16:18:09'),(644,'Lot of Profiles C shape 2808m of Montante 1008m of Canal','2021-01-05 16:18:09','2021-01-05 16:18:09'),(645,'LUB oil filter ELEMENT\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(646,'Lub oil Filter Element- 03.040.19.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(647,'Lube Oil Filter 7.5KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(648,'Lube Oil Filter Assembly','2021-01-05 16:18:09','2021-01-05 16:18:09'),(649,'Lube Oil Pressure Sendor - 2H.092.11.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(650,'LZ-HZ ODU','2021-01-05 16:18:09','2021-01-05 16:18:09'),(651,'MAIN ENCLOSURE\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(652,'Main Gate','2021-01-05 16:18:09','2021-01-05 16:18:09'),(653,'Mains Sensor for Auto START & Auto STOP of DG Set','2021-01-05 16:18:09','2021-01-05 16:18:09'),(654,'Manual ChangeOver Switch\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(655,'Markers','2021-01-05 16:18:09','2021-01-05 16:18:09'),(656,'MBTS DBS Cable Suite Label','2021-01-05 16:18:09','2021-01-05 16:18:09'),(657,'MI3040 Tally Box','2021-01-05 16:18:09','2021-01-05 16:18:09'),(658,'MI3040 Tally Box','2021-01-05 16:18:09','2021-01-05 16:18:09'),(659,'Microwave 1.8 8G','2021-01-05 16:18:09','2021-01-05 16:18:09'),(660,'Microwave AM3 8G','2021-01-05 16:18:09','2021-01-05 16:18:09'),(661,'Microwave AM4 8G','2021-01-05 16:18:09','2021-01-05 16:18:09'),(662,'MIFI ROUTER (ZTEMF927U)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(663,'MIKROTIK CLOUD 112-8G-4S-IN','2021-01-05 16:18:09','2021-01-05 16:18:09'),(664,'MIKROTIK CLOUD SMART SWITCH','2021-01-05 16:18:09','2021-01-05 16:18:09'),(665,'Mikrotik RB450G\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(666,'MIKROTIK S-31DLC20D','2021-01-05 16:18:09','2021-01-05 16:18:09'),(667,'Mitel 5212','2021-01-05 16:18:09','2021-01-05 16:18:09'),(668,'Mitel 5312','2021-01-05 16:18:09','2021-01-05 16:18:09'),(669,'Mitel 5330','2021-01-05 16:18:09','2021-01-05 16:18:09'),(670,'Mitel 5448 Programmable Key Module','2021-01-05 16:18:09','2021-01-05 16:18:09'),(671,'Motor Starter 12 V RR','2021-01-05 16:18:09','2021-01-05 16:18:09'),(672,'MOURIT FRAME\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(673,'MPE Site Materials Kit,Feeder Color  Coding Material Kit,Purple/Orange/Green Color  Coding Material Kit','2021-01-05 16:18:09','2021-01-05 16:18:09'),(674,'MPE Site Materials Kit,Site Auxiliary Material Kit,For BBU5900','2021-01-05 16:18:09','2021-01-05 16:18:09'),(675,'MRRU2G (1800MHz) BYE','2021-01-05 16:18:09','2021-01-05 16:18:09'),(676,'MRRU2G (900MHz)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(677,'MSC Rack','2021-01-05 16:18:09','2021-01-05 16:18:09'),(678,'MULTI FRAME\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(679,'N-MALE CONNECTOR FOR 8D-FB COAX CABLE\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(680,'Nail & Seal Cartridge','2021-01-05 16:18:09','2021-01-05 16:18:09'),(681,'Nano station M3 Airmax','2021-01-05 16:18:09','2021-01-05 16:18:09'),(682,'Nano station M5 Airmax(used)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(683,'Nano station M5Airmax(CODE LOCOM5)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(684,'NanoStation M2','2021-01-05 16:18:09','2021-01-05 16:18:09'),(685,'NanoStation M5','2021-01-05 16:18:09','2021-01-05 16:18:09'),(686,'NBNC75BDD6X BNC rear TWIST UHD Cable','2021-01-05 16:18:09','2021-01-05 16:18:09'),(687,'NBNC75BDD6X BNC rear TWIST UHD Cable','2021-01-05 16:18:09','2021-01-05 16:18:09'),(688,'Nexus 3048 tp-1ge','2021-01-05 16:18:09','2021-01-05 16:18:09'),(689,'Note Books','2021-01-05 16:18:09','2021-01-05 16:18:09'),(690,'O Panel,10GE optical interface,ZTE','2021-01-05 16:18:09','2021-01-05 16:18:09'),(691,'O Ring For Push Rod Tube (VITON)- 12.005.05.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(692,'OCB PO1\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(693,'OCB Pole','2021-01-05 16:18:09','2021-01-05 16:18:09'),(694,'ODF Rack','2021-01-05 16:18:09','2021-01-05 16:18:09'),(695,'ODU 11G DX11 TH','2021-01-05 16:18:09','2021-01-05 16:18:09'),(696,'ODU 11G DX11 TL','2021-01-05 16:18:09','2021-01-05 16:18:09'),(697,'ODU 11G DX12 TH','2021-01-05 16:18:09','2021-01-05 16:18:09'),(698,'ODU 11G DX12 TL','2021-01-05 16:18:09','2021-01-05 16:18:09'),(699,'ODU 11G DX13 TH','2021-01-05 16:18:09','2021-01-05 16:18:09'),(700,'ODU 11G DX13 TL','2021-01-05 16:18:09','2021-01-05 16:18:09'),(701,'ODU 11G DX14 TH','2021-01-05 16:18:09','2021-01-05 16:18:09'),(702,'ODU 11G DX14 TL','2021-01-05 16:18:09','2021-01-05 16:18:09'),(703,'ODU Ceregon 8G','2021-01-05 16:18:09','2021-01-05 16:18:09'),(704,'ODU LLGH\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(705,'Oil  Pressure Gauge','2021-01-05 16:18:09','2021-01-05 16:18:09'),(706,'Oil Feed Pipe-D8.306.10.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(707,'Oil Filter 20KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(708,'OIL FILTER ELEMENT','2021-01-05 16:18:09','2021-01-05 16:18:09'),(709,'Oil Filter Element- 03.040.19.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(710,'Oil filters 100KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(711,'oil Filters 200KVA\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(712,'Oil filters 400KVA\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(713,'Oil Pressor Sensor Switch 7.5KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(714,'Oil Pressure Switch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(715,'Oil Seal GE (SR +RR) (CR Part No. PP 70405)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(716,'OIL SEAL PART NO 10030.05.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(717,'Oil Temperature Sensor','2021-01-05 16:18:09','2021-01-05 16:18:09'),(718,'OIXG2 Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(719,'OMNI DIRECTIONAL EXTERNAL ANTENNA(TICOE-5)\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(720,'OMU\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(721,'ON/OFF DC Switch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(722,'Optical Cable Parts,DLC/PC,DLC/PC,Multi-mode,50m,2 cores,0.03m/0.34m,GYFJH-2A1a(OM2),7.0mm,2mm,LSZH,Armored branch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(723,'Optical Cable Parts,DLC/PC,DLC/PC,Multi-mode,60m,2 cores,0.03m/0.34m,GYFJH-2A1a(OM2),7.0mm,2mm,LSZH,Armored branch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(724,'Optical Cable Parts,DLC/PC,DLC/PC,Multi-mode,70m,2 cores,0.03m/0.34m,GYFJH-2A1a(OM2),7.0mm,2mm,LSZH,Armored branch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(725,'OPTICAL DISTRIBUTION FRAME\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(726,'OPTICAL FIBRE 80M\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(727,'Optical transceiver,SFP+,1310nm,10.3125Gb/s,-8.2~0.5dBm,-14.4dBm,LC,SM,10km','2021-01-05 16:18:09','2021-01-05 16:18:09'),(728,'Optical Transceiver,SFP+,850nm,6.144G,-9dBm,-1dBm,-11.1dBm,LC,MMF ,0.12km','2021-01-05 16:18:09','2021-01-05 16:18:09'),(729,'OSN racks BTS 3900','2021-01-05 16:18:09','2021-01-05 16:18:09'),(730,'OSN1500 SSN3SL 16A','2021-01-05 16:18:09','2021-01-05 16:18:09'),(731,'OSN1500B Chassis','2021-01-05 16:18:09','2021-01-05 16:18:09'),(732,'OUTDOOR BROADBAND OMNI ANTENNA (TICODA-5\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(733,'Outdoor Cable (Twist Pair Lan)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(734,'P.V.C CLIPS\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(735,'Packet Enhanced Assembly Classis (5U, DC, with Fiber Storage)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(736,'Pad Locks','2021-01-05 16:18:09','2021-01-05 16:18:09'),(737,'Panasonic Toughbook CF-53-i5 4310-8GB-256GB 14\" Grade B Used','2021-01-05 16:18:09','2021-01-05 16:18:09'),(738,'Paper Clips','2021-01-05 16:18:09','2021-01-05 16:18:09'),(739,'Passive injector\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(740,'PD1 Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(741,'PDU CONTROL UNIT\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(742,'PEUa Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(743,'PH1 BOARD\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(744,'PICOSTATION M2 HP\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(745,'PIGITAIL CABLE N-MALE','2021-01-05 16:18:09','2021-01-05 16:18:09'),(746,'Pin Type Angle Batten Lampholder\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(747,'Pin Type Straight Batten Lampholder\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(748,'Pipe Dope (Putty)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(749,'Piston Assembly- D5.303.20.0.00','2021-01-05 16:18:09','2021-01-05 16:18:09'),(750,'Piston Rings\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(751,'Piston Rings set','2021-01-05 16:18:09','2021-01-05 16:18:09'),(752,'PIUB Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(753,'PLASTIC BAG A3\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(754,'PLASTIC BAG A4\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(755,'Plastic Busbar insulators to isolate lightning arrestor from tower','2021-01-05 16:18:09','2021-01-05 16:18:09'),(756,'Plumbing (Thread) Fiber','2021-01-05 16:18:09','2021-01-05 16:18:09'),(757,'PMU\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(758,'PMU APM30','2021-01-05 16:18:09','2021-01-05 16:18:09'),(759,'PO1\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(760,'Pocket Files','2021-01-05 16:18:09','2021-01-05 16:18:09'),(761,'Pole 1 inch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(762,'POLE 1.5inch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(763,'Polo Uniform','2021-01-05 16:18:09','2021-01-05 16:18:09'),(764,'POP UP DRAIN ASSEMBLY FOR PEDESTAL SINKS','2021-01-05 16:18:09','2021-01-05 16:18:09'),(765,'POP UP DRAIN ASSEMBLY FOR PEDESTAL SINKS','2021-01-05 16:18:09','2021-01-05 16:18:09'),(766,'Post Paid plans and Bundles Flyers','2021-01-05 16:18:09','2021-01-05 16:18:09'),(767,'POUC Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(768,'POWER CABLE 100M','2021-01-05 16:18:09','2021-01-05 16:18:09'),(769,'Power Cable 2.5 SQ mm 100 yards','2021-01-05 16:18:09','2021-01-05 16:18:09'),(770,'POWER CABLE 2X16AWG','2021-01-05 16:18:09','2021-01-05 16:18:09'),(771,'Power Cable Ground Clip Installation Auxiliary,General Area','2021-01-05 16:18:09','2021-01-05 16:18:09'),(772,'Power Cable,450V/750V,60227 IEC 02(RV),16mm^2,Blue,85A,CCC,CE (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(773,'Power Cable,450V/750V,60227 IEC 02(RV),16mm^2,Yellow/Green,85A,CCC,CE (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(774,'Power Cable,450V/750V,H07Z-K UL3386,4mm^2,Black,45A,LSZH Cable,VDE,UL (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(775,'Power Cable,450V/750V,H07Z-K UL3386,4mm^2,Blue,45A,LSZH Cable,VDE,UL (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(776,'Power Cable,600V,UL2586,2x12AWG,Black(2Cores:Blue,Black),D,Shielding Outdoor Cable,UL (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(777,'Power Cable,600V,UL3436,70mm^2,2/0AWG,Black,Super Flexible cable','2021-01-05 16:18:09','2021-01-05 16:18:09'),(778,'Power Cable,600V,UL3436,70mm^2,2/0AWG,Red,Super Flexible cable','2021-01-05 16:18:09','2021-01-05 16:18:09'),(779,'Power Cable,600V/1000V,ZA-RVV,35mm^2,Blue,138A,Single-core Double Insulation,CE (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(780,'Power Cable,600V/1000V,ZA-RVV,35mm^2,Brown,138A,Single-core Double Insulation,CE (Unit:meter)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(781,'Power Clamps','2021-01-05 16:18:09','2021-01-05 16:18:09'),(782,'Power Distribution Unit Spare Part','2021-01-05 16:18:09','2021-01-05 16:18:09'),(783,'Power Interface Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(784,'Power Interface Board TNF5PIU OSN580','2021-01-05 16:18:09','2021-01-05 16:18:09'),(785,'POWER MODULE\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(786,'Power Module APM 200','2021-01-05 16:18:09','2021-01-05 16:18:09'),(787,'Power Monitor Interface Spare Part','2021-01-05 16:18:09','2021-01-05 16:18:09'),(788,'Power SPD,60KA,1500V,150VAC~255VAC,Terminal connection,Guideway Mounting','2021-01-05 16:18:09','2021-01-05 16:18:09'),(789,'Power SPD,60KA,2000V,150VAC~385VAC,Terminal connection,Guideway Mounting','2021-01-05 16:18:09','2021-01-05 16:18:09'),(790,'POWERCALES','2021-01-05 16:18:09','2021-01-05 16:18:09'),(791,'PQ1 Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(792,'Premiere office Chairs','2021-01-05 16:18:09','2021-01-05 16:18:09'),(793,'Prepaid Mobile Broadband Flyers','2021-01-05 16:18:09','2021-01-05 16:18:09'),(794,'primary element \r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(795,'primary element for 6m 3A\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(796,'Primary Fuel filters 100KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(797,'Primary Fuel filters 200KVA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(798,'Print head cleaning fluid	\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(799,'Printer Head cleaning Fluid','2021-01-05 16:18:09','2021-01-05 16:18:09'),(800,'Processing Controller Unit(1*Intel E5 2620','2021-01-05 16:18:09','2021-01-05 16:18:09'),(801,'ProST\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(802,'pRRU5923 for Multi-Mode (900M+1800M+2100M+2600M)-inner antenna Spare Part','2021-01-05 16:18:09','2021-01-05 16:18:09'),(803,'PSM-BB\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(804,'PSXCA Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(805,'Punch','2021-01-05 16:18:09','2021-01-05 16:18:09'),(806,'PVC Elbow 45mm','2021-01-05 16:18:09','2021-01-05 16:18:09'),(807,'PVC Elbow 90mm','2021-01-05 16:18:09','2021-01-05 16:18:09'),(808,'PVC ELECTRICAL TAPE\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(809,'PVC Glue','2021-01-05 16:18:09','2021-01-05 16:18:09'),(810,'PVC PIPE\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(811,'PVC Pipe 110mm','2021-01-05 16:18:09','2021-01-05 16:18:09'),(812,'PVC Pipe 50mm','2021-01-05 16:18:09','2021-01-05 16:18:09'),(813,'PXC Board','2021-01-05 16:18:09','2021-01-05 16:18:09'),(814,'QCELL BEACH UMBRELLA','2021-01-05 16:18:09','2021-01-05 16:18:09'),(815,'QCELL BEACH UMBRELLA NEW','2021-01-05 16:18:09','2021-01-05 16:18:09'),(816,'QCELL CAPS\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(817,'QCELL CAPS NEW','2021-01-05 16:18:09','2021-01-05 16:18:09'),(818,'QCELL COFFEE MUG','2021-01-05 16:18:09','2021-01-05 16:18:09'),(819,'QCELL FOOTBALL','2021-01-05 16:18:09','2021-01-05 16:18:09'),(820,'QCELL GOLF UMBRELLA\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(821,'QCELL KEY HOLDERS','2021-01-05 16:18:09','2021-01-05 16:18:09'),(822,'QCELL KEY HOLDERS NEW','2021-01-05 16:18:09','2021-01-05 16:18:09'),(823,'QCELL PEN','2021-01-05 16:18:09','2021-01-05 16:18:09'),(824,'QCELL POLO-LACOST NEW','2021-01-05 16:18:09','2021-01-05 16:18:09'),(825,'QCELL POLO-SHIRT Normal','2021-01-05 16:18:09','2021-01-05 16:18:09'),(826,'Qcell T-Shirt Round neck New','2021-01-05 16:18:09','2021-01-05 16:18:09'),(827,'QCELL-T-SHIRT Old(ROUND)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(828,'QCITY PEN','2021-01-05 16:18:09','2021-01-05 16:18:09'),(829,'Qmoney Cap','2021-01-05 16:18:09','2021-01-05 16:18:09'),(830,'Qmoney Fliers','2021-01-05 16:18:09','2021-01-05 16:18:09'),(831,'QMONEY KEY HOLDER','2021-01-05 16:18:09','2021-01-05 16:18:09'),(832,'Qmoney Pen','2021-01-05 16:18:09','2021-01-05 16:18:09'),(833,'Qmoney Polo T-Shirt','2021-01-05 16:18:09','2021-01-05 16:18:09'),(834,'Qmoney Round neck T-Shirt','2021-01-05 16:18:09','2021-01-05 16:18:09'),(835,'Qmoney T-Shirt','2021-01-05 16:18:09','2021-01-05 16:18:09'),(836,'Qmoney Tariff Stickers','2021-01-05 16:18:09','2021-01-05 16:18:09'),(837,'QODOO 45 FLIERS\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(838,'QPOWER D195','2021-01-05 16:18:09','2021-01-05 16:18:09'),(839,'QPOWER D295','2021-01-05 16:18:09','2021-01-05 16:18:09'),(840,'QPOWER D35','2021-01-05 16:18:09','2021-01-05 16:18:09'),(841,'QPOWER D395','2021-01-05 16:18:09','2021-01-05 16:18:09'),(842,'QPOWER D495','2021-01-05 16:18:09','2021-01-05 16:18:09'),(843,'QPOWER D55','2021-01-05 16:18:09','2021-01-05 16:18:09'),(844,'QPOWER D95','2021-01-05 16:18:09','2021-01-05 16:18:09'),(845,'QTV PEN','2021-01-05 16:18:09','2021-01-05 16:18:09'),(846,'QTV PEN','2021-01-05 16:18:09','2021-01-05 16:18:09'),(847,'QUEUE BARRIERS(3METER LONG BAND)','2021-01-05 16:18:09','2021-01-05 16:18:09'),(848,'R.Toe\r\n','2021-01-05 16:18:09','2021-01-05 16:18:09'),(849,'R4850G2 1U 3000W Rectifier (wireless only ) Spare part','2021-01-05 16:18:09','2021-01-05 16:18:09'),(850,'R4875G1-4000W High Efficiency Rectifier','2021-01-05 16:18:09','2021-01-05 16:18:09'),(851,'RACK SERVER DL380','2021-01-05 16:18:09','2021-01-05 16:18:09'),(852,'Radio Frequency Cable,3m,4.3-10SM,COAX50-8.7/3.55,4.3-10SM,1/2 Inch Superflexible Jumper','2021-01-05 16:18:09','2021-01-05 16:18:09'),(853,'Radio Frequency Cable,3m,DIN50SM-II,COAX50-8.7/3.55,4.3-10SM,1/2 Inch Superflexible Jumper','2021-01-05 16:18:09','2021-01-05 16:18:09'),(854,'RAM 8GB','2021-01-05 16:18:09','2021-01-05 16:18:09'),(855,'Rasberyy Pi Model B+ c/w 8Gb Micro SD','2021-01-05 16:18:10','2021-01-05 16:18:10'),(856,'Raspberyy Pi Cases Black','2021-01-05 16:18:10','2021-01-05 16:18:10'),(857,'Rechargeable Battery, VRLA Battery(Gel, Front Terminal), 48V, 90Ah, 12V Monobloc, 110mm(W)*394mm(D)*285mm(H), 4 PCS, Leoch FTG12-90','2021-01-05 16:18:10','2021-01-05 16:18:10'),(858,'RECTIFIER\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(859,'Rectifier Modules TP48','2021-01-05 16:18:10','2021-01-05 16:18:10'),(860,'Red Insulation Tape','2021-01-05 16:18:10','2021-01-05 16:18:10'),(861,'Ret Cable','2021-01-05 16:18:10','2021-01-05 16:18:10'),(862,'Ret Cables','2021-01-05 16:18:10','2021-01-05 16:18:10'),(863,'RF Cable,3m,DIN50SM-II,COAX50-8.7/3.55,DIN50SM-II,1/2 Inch Superflexible Jumper','2021-01-05 16:18:10','2021-01-05 16:18:10'),(864,'RFU-C 8-GHz TL 8-119A-1W3-TL','2021-01-05 16:18:10','2021-01-05 16:18:10'),(865,'RFU-C OMT KIT\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(866,'RFU-CX-8-GHz-TH','2021-01-05 16:18:10','2021-01-05 16:18:10'),(867,'RMC\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(868,'Rocker Cover (FINISH)-EAF8 -D7.304.01.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(869,'Rocker Support Sub Assembly-EAF8 -D7.306.40.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(870,'ROCKET DISK 30DBI ANTENNA\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(871,'Rocket Disk 3G 26dbi','2021-01-05 16:18:10','2021-01-05 16:18:10'),(872,'ROCKET M3 AIRMAX\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(873,'ROCKET M5 AIRMAX\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(874,'Roll of 1.50metre stickers ','2021-01-05 16:18:10','2021-01-05 16:18:10'),(875,'RRU 1800\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(876,'RRU 3G\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(877,'RRU 4G New','2021-01-05 16:18:10','2021-01-05 16:18:10'),(878,'RRU 900\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(879,'RRU3268 for LTE 800MHz(2*60W)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(880,'RRU3826 (2100MHz) KKQ','2021-01-05 16:18:10','2021-01-05 16:18:10'),(881,'RRU3839 (2100MHz) BDR','2021-01-05 16:18:10','2021-01-05 16:18:10'),(882,'RRU3839 (2100MHz) TQF','2021-01-05 16:18:10','2021-01-05 16:18:10'),(883,'RRU3839 2100MHZ','2021-01-05 16:18:10','2021-01-05 16:18:10'),(884,'RRU3959 (2100MHz) LFH','2021-01-05 16:18:10','2021-01-05 16:18:10'),(885,'RRU3959, (TX1805-1880MHz/RX1710-1785MHz,','2021-01-05 16:18:10','2021-01-05 16:18:10'),(886,'RRU5309 for LTE 800MHz(2*60W)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(887,'RRU5309 for LTE 800MHz(2*60W)Spare part','2021-01-05 16:18:10','2021-01-05 16:18:10'),(888,'RRU5909 for Multi-mode 1800MHz (2*60W)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(889,'RRU5909 for Multi-mode 1800MHz (2*60W)Spare Part','2021-01-05 16:18:10','2021-01-05 16:18:10'),(890,'RRU5909 for Multi-Mode 2100MHz(2*60W)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(891,'RRU5909 for Multi-Mode 2100MHz(2*60W)Spare Part','2021-01-05 16:18:10','2021-01-05 16:18:10'),(892,'RRU5909 for Multi-Mode 900MHz(2*60W) Spare part','2021-01-05 16:18:10','2021-01-05 16:18:10'),(893,'RTN IDU','2021-01-05 16:18:10','2021-01-05 16:18:10'),(894,'Rubber Bush (Bottom)-12.005.08.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(895,'rulers','2021-01-05 16:18:10','2021-01-05 16:18:10'),(896,'Sachtler 200 Tripods with fluid head','2021-01-05 16:18:10','2021-01-05 16:18:10'),(897,'Sachtler 200 Tripods with fluid head','2021-01-05 16:18:10','2021-01-05 16:18:10'),(898,'Saddle Clip 25mm2','2021-01-05 16:18:10','2021-01-05 16:18:10'),(899,'SAMSUNG A015','2021-01-05 16:18:10','2021-01-05 16:18:10'),(900,'SAMSUNG A115 32GB 2GB RAM','2021-01-05 16:18:10','2021-01-05 16:18:10'),(901,'SAMSUNG A2 CORE 8GB','2021-01-05 16:18:10','2021-01-05 16:18:10'),(902,'SAMSUNG A21S','2021-01-05 16:18:10','2021-01-05 16:18:10'),(903,'SAMSUNG A3 CORE','2021-01-05 16:18:10','2021-01-05 16:18:10'),(904,'SAMSUNG A31','2021-01-05 16:18:10','2021-01-05 16:18:10'),(905,'SAMSUNG A51','2021-01-05 16:18:10','2021-01-05 16:18:10'),(906,'SAMSUNG A715 128GB 6GB RAM','2021-01-05 16:18:10','2021-01-05 16:18:10'),(907,'SAMSUNG E222','2021-01-05 16:18:10','2021-01-05 16:18:10'),(908,'SAMSUNG M11','2021-01-05 16:18:10','2021-01-05 16:18:10'),(909,'Samsung Mobile Dual Sim Phone GT-E1207','2021-01-05 16:18:10','2021-01-05 16:18:10'),(910,'Samung A01','2021-01-05 16:18:10','2021-01-05 16:18:10'),(911,'SC PIG/SM-1M','2021-01-05 16:18:10','2021-01-05 16:18:10'),(912,'Scissors','2021-01-05 16:18:10','2021-01-05 16:18:10'),(913,'SCRACTH CARD D300','2021-01-05 16:18:10','2021-01-05 16:18:10'),(914,'Scrapper','2021-01-05 16:18:10','2021-01-05 16:18:10'),(915,'SCRATCH CARD D100','2021-01-05 16:18:10','2021-01-05 16:18:10'),(916,'SCRATCH CARD D200','2021-01-05 16:18:10','2021-01-05 16:18:10'),(917,'SCRATCH CARD D25','2021-01-05 16:18:10','2021-01-05 16:18:10'),(918,'SCRATCH CARD D50','2021-01-05 16:18:10','2021-01-05 16:18:10'),(919,'Screw\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(920,'SCUa BOARD','2021-01-05 16:18:10','2021-01-05 16:18:10'),(921,'SDA-1 TYPE 11-\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(922,'Seagate Enterprise drives','2021-01-05 16:18:10','2021-01-05 16:18:10'),(923,'Seagate ST100000NM','2021-01-05 16:18:10','2021-01-05 16:18:10'),(924,'Secondary Element\r\n \r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(925,'Secondary fuel filter 100KVA','2021-01-05 16:18:10','2021-01-05 16:18:10'),(926,'Secondary Fuel Filter 200KVA','2021-01-05 16:18:10','2021-01-05 16:18:10'),(927,'Seiko certificated Ink COLOR C	\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(928,'Seiko certificated ink COLOR K	\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(929,'Seiko certificated Ink COLOR M	\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(930,'Seiko certificated Ink COLOR Y	\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(931,'Sennheiser EW122P-G4 Set','2021-01-05 16:18:10','2021-01-05 16:18:10'),(932,'Sennheiser EW122P-G4 Set','2021-01-05 16:18:10','2021-01-05 16:18:10'),(933,'Sennheiser HD 280 Pro head phones','2021-01-05 16:18:10','2021-01-05 16:18:10'),(934,'Sennheiser HD 280 Pro head phones','2021-01-05 16:18:10','2021-01-05 16:18:10'),(935,'Sennheiser MMD 835-','2021-01-05 16:18:10','2021-01-05 16:18:10'),(936,'Sennheiser MMD 835-','2021-01-05 16:18:10','2021-01-05 16:18:10'),(937,'Sennheiser NE2-II','2021-01-05 16:18:10','2021-01-05 16:18:10'),(938,'Sennheiser NE2-II','2021-01-05 16:18:10','2021-01-05 16:18:10'),(939,'Sensor Unit: Elec Temp Gauge - 46.085.02.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(940,'Sensor-Door Magnetic Switch-NO','2021-01-05 16:18:10','2021-01-05 16:18:10'),(941,'Server NF 6810M5-12XT-E','2021-01-05 16:18:10','2021-01-05 16:18:10'),(942,'Service Outlet Unit Spare Part','2021-01-05 16:18:10','2021-01-05 16:18:10'),(943,'Service Pole','2021-01-05 16:18:10','2021-01-05 16:18:10'),(944,'SFP -125M-2/67G-D1-120KM-SM-eSFP','2021-01-05 16:18:10','2021-01-05 16:18:10'),(945,'SFP -2.5G,1550nm,STM16,2-3dBm-30dBm,LC,sm,80km','2021-01-05 16:18:10','2021-01-05 16:18:10'),(946,'SFP 1G Ethernet 100m@CAT5 RJ45','2021-01-05 16:18:10','2021-01-05 16:18:10'),(947,'SFP 1G Ethernet 1G FC','2021-01-05 16:18:10','2021-01-05 16:18:10'),(948,'SFP Module 6 GIGA 3-4G','2021-01-05 16:18:10','2021-01-05 16:18:10'),(949,'SfP Modules','2021-01-05 16:18:10','2021-01-05 16:18:10'),(950,'SFP- Low Speed Transceiver,1310nm,1.25Gb/s,-9dBm,-3dBm,-19dBm,LC(-40~85),10km','2021-01-05 16:18:10','2021-01-05 16:18:10'),(951,'SFP- Optical Transceiver,1310nm,STM1,-15-8dBm,-31','2021-01-05 16:18:10','2021-01-05 16:18:10'),(952,'SFP+10G Multrirate 0.6-11.3GBPS','2021-01-05 16:18:10','2021-01-05 16:18:10'),(953,'SFP+10G/1G/100M Ethernet','2021-01-05 16:18:10','2021-01-05 16:18:10'),(954,'Shielded Twisted Pair 550MHz 4x2x23 AWG (Solid) Copper 1000ft Black Direct Burial Get Outdoor Cable','2021-01-05 16:18:10','2021-01-05 16:18:10'),(955,'Signal Cable,AISG Communication cable,5m,D9M+D9(PS)(W),CC4P0.5PB(S),RC8SF(S)-I','2021-01-05 16:18:10','2021-01-05 16:18:10'),(956,'Signal Processing unit','2021-01-05 16:18:10','2021-01-05 16:18:10'),(957,'SILICON COVER','2021-01-05 16:18:10','2021-01-05 16:18:10'),(958,'Silicon Gun','2021-01-05 16:18:10','2021-01-05 16:18:10'),(959,'Single Cable,1.2m,H4(2.5),3*22UL3385B,Sensor33010116','2021-01-05 16:18:10','2021-01-05 16:18:10'),(960,'Single Gang One Way Switch\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(961,'Single Gang Surface Box\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(962,'Slave Meter\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(963,'SLD4 Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(964,'SLD4A Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(965,'SLPH','2021-01-05 16:18:10','2021-01-05 16:18:10'),(966,'SLPU\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(967,'SLQ Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(968,'Smart 40G Line Service Processing Board (SH, Tx-7dBm 2.3dBm,Rx-13.7dBm, LC, with 20G License)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(969,'Solar Panel Frames','2021-01-05 16:18:10','2021-01-05 16:18:10'),(970,'Sony PXW-Z190 Camera','2021-01-05 16:18:10','2021-01-05 16:18:10'),(971,'Sony PXW-Z190 Camera','2021-01-05 16:18:10','2021-01-05 16:18:10'),(972,'Sony PXW-Z190 Cameras','2021-01-05 16:18:10','2021-01-05 16:18:10'),(973,'Sony PXW-Z190 Cameras','2021-01-05 16:18:10','2021-01-05 16:18:10'),(974,'SPA12 phone adapter','2021-01-05 16:18:10','2021-01-05 16:18:10'),(975,'SPA12 phone adapter','2021-01-05 16:18:10','2021-01-05 16:18:10'),(976,'Special Numbers 5 series(Voice No)','2021-01-05 16:18:10','2021-01-05 16:18:10'),(977,'spin on filler for Lubrk\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(978,'Spinon Lube Oil Filter - 04.270.01.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(979,'SPLICE PANEL-1U 24','2021-01-05 16:18:10','2021-01-05 16:18:10'),(980,'SPLICE PANEL-1U 36','2021-01-05 16:18:10','2021-01-05 16:18:10'),(981,'SPLICE PANEL-1U 48','2021-01-05 16:18:10','2021-01-05 16:18:10'),(982,'Splice Protectors 45mm','2021-01-05 16:18:10','2021-01-05 16:18:10'),(983,'Spliters','2021-01-05 16:18:10','2021-01-05 16:18:10'),(984,'SPUa Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(985,'SPUB (3052781) Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(986,'SSP Modules','2021-01-05 16:18:10','2021-01-05 16:18:10'),(987,'SSR1PCXLL110','2021-01-05 16:18:10','2021-01-05 16:18:10'),(988,'SSR1SLQ103, 4xSTM-1 Optical Interface Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(989,'SSR2AUX, System Auxiliary Interface Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(990,'SSRD0PCXL115 STM-1 Master 20GTime Division Multiplex(S1.1,LC','2021-01-05 16:18:10','2021-01-05 16:18:10'),(991,'Stainless Steel bolts, washers, nuts, and locknuts for plastic insulators','2021-01-05 16:18:10','2021-01-05 16:18:10'),(992,'Staple Pin','2021-01-05 16:18:10','2021-01-05 16:18:10'),(993,'Stapler','2021-01-05 16:18:10','2021-01-05 16:18:10'),(994,'Starter 12V - 02.410.01.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(995,'Starter Ring - 34.043.02.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(996,'Steel Cylinder Head Gasket -D7.003.06.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(997,'Stick on Pad','2021-01-05 16:18:10','2021-01-05 16:18:10'),(998,'STICKER ROLL150','2021-01-05 16:18:10','2021-01-05 16:18:10'),(999,'Stop Solenoid Assembly- D8.108.20.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1000,'Straight Batten Lampholder\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1001,'SUBRACK BLOCK HOLDER\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1002,'SWItch TL-SF1008P\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1003,'Synolgy 8gb Ram','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1004,'Synology RS3618XS 12 SLOT NAS','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1005,'Tape\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1006,'TARRIF POSTER BRANDING\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1007,'TAVR20','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1008,'TCC CARD IP10\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1009,'TELTONKA WR P100\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1010,'Temp switch - 06.087.02.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1011,'Temperature Sensor- D8.066.01.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1012,'Temperature sensor,NTC,Cable Length of 2m,2PIN white terminal','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1013,'Ten(10) way single phase distribution box/consumer unit','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1014,'Tents 2*3','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1015,'Tents 4*4','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1016,'TERMINATION KIT (OCB)\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1017,'Thermos tarter\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1018,'Thermostat Kit','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1019,'TIC 20N Repeater','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1020,'Tilting Gears 1800','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1021,'Tilting Gears 900','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1022,'TNC Antenna\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1023,'TNC-Angled-Male-Connector-RG8','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1024,'TNUa Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1025,'Toilet Roll','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1026,'Top Cylinder gasket 100KVA\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1027,'Top cylinder gasket 400KVA\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1028,'TPLINK 300MBPS','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1029,'Transmission Cable','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1030,'Transmission cable connector','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1031,'Triax Cable with Lemo connectors','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1032,'Triax Cable with Lemo connectors','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1033,'Tripods Satchler 20p','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1034,'Tripods Satchler 20p','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1035,'TRUNKLING','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1036,'Tuscan Diary 2020 Orange','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1037,'Two Way Three Pole Three Position Selector Switch -02.874.13.0.00','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1038,'Two Way Two Pole Three Position Selector Switch','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1039,'UBBP Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1040,'UBBpd6 Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1041,'Ubiquiti RJ45 PLUG CAT5E FTP','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1042,'UBIQUITI UNIFI AC\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1043,'UBIQUITI UniFi AC Lite','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1044,'Ubiquity Bullet2\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1045,'Ubrib Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1046,'UCXe Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1047,'UEIP\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1048,'UEIP WCDMA\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1049,'UEIU Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1050,'UELP Board','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1051,'UK PLUG FOR CPE WITH 2PINS\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1052,'UK PLUG FOR CPE WITH 3PINS\r\n','2021-01-05 16:18:10','2021-01-05 16:18:10'),(1053,'UMPT','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1054,'UMPTb1 Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1055,'UNIFI 3PACK\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1056,'UNIFI OUTDOOR','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1057,'Universal Baseband Processing Unit e4','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1058,'Universal Belts','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1059,'UOIA\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1060,'UPEU Power Supply','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1061,'UPEUd Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1062,'UPWR\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1063,'USB C to HDMI adapter','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1064,'USB C to HDMI adapter','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1065,'Used 2015 IMAC 27\"17 32GB','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1066,'UTP 0.5Meter Twist Pair','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1067,'UTP 1Meter Twist Pair','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1068,'UTP 2Meter Twist Pair','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1069,'UTRP Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1070,'V- Belt (A*-54)\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1071,'V-Belt (AX-55) - 2.164.02.0.00','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1072,'V-Belt (AX-56) - D8.714..03.0.00','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1073,'Valve Seal','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1074,'VEE Belt AX - D8.714.03.0.00','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1075,'Viewfinder sets for LDK 500','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1076,'Viewfinder sets for LDK 500','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1077,'Vinyl, 3.2m wide, thickness 440g, face dull white and back black, 50meter per roll,100 rolls.	\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1078,'Vinyl,1.6m wide,30 rolls.	\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1079,'Vinyl,2.8m wide, thickness 440g, face dull white and back black, 50meter per roll, 30 rolls.	\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1080,'VMR 1P (Voltage Monitoring Relay); Model No. PR-15','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1081,'Voice Simcard (EMPTY)','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1082,'Voice Simcard Number 3series','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1083,'Wall Mount Double lockable box(Shell) 380x325x70','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1084,'Washer For Rubber Ring- 12.005.07.0.00','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1085,'Washing Basin\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1086,'Water Hose (Hose pipe)','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1087,'Water Pump','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1088,'Water Separator','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1089,'WBBP Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1090,'WD40','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1091,'White Board Makers','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1092,'WHITE DC POWER CABLE 304MM2\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1093,'WIDE BAND  DIRECTIONAL ANTENNA (TICDA-10)\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1094,'Wipll broadband wireless\r\n\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1095,'WIRELESS ROUTER TL-840','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1096,'Wireless Router TL-WR841N','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1097,'WMPT Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1098,'Woven Fabric Bag Large (A3)- Orange Color\r\n','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1099,'Woven Fabric Bag Small A4- Orange Color','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1100,'WS-C3850-12-S','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1101,'WS-C3850-24T-S','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1102,'WS-C3850-48T-E','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1103,'WSMU Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1104,'WTM 4818 MULTI-BAND ANTENNA 17.7-19 GHZ, 71-76/81-86 GHZ','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1105,'Xero Toner Staple Pack','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1106,'Xero versalink 500 sheet finisher(2set)','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1107,'XFP/SFP+TRANSCEIVER SFP','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1108,'XPUb Board','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1109,'Yamaha UC 10-FLXUC500','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1110,'ZXCTN6150','2021-01-05 16:18:11','2021-01-05 16:18:11'),(1111,'Vga to Hdmi','2021-01-05 16:57:31','2021-01-05 16:57:31'),(1112,'Test Product 2','2021-01-05 16:57:59','2021-01-05 16:57:59'),(1113,'Telephone Set','2021-01-06 13:48:12','2021-01-06 13:48:12'),(1114,'kkyy aa bb','2021-01-06 13:51:06','2021-01-06 13:51:06'),(1115,'24 port Cisco Switch','2021-01-06 13:51:06','2021-01-06 13:51:06'),(1116,'Dell Laptop Charger','2021-01-07 09:18:09','2021-01-07 09:18:09'),(1117,'1.5 mm² Red Single Core Cable','2021-01-07 09:18:09','2021-01-07 09:18:09'),(1118,'10 mm² Green/Yellow Single Core Cable','2021-01-07 09:22:56','2021-01-07 09:22:56'),(1119,'10 mm² Black Single Core Cable','2021-01-11 09:21:58','2021-01-11 09:21:58'),(1120,'10 Way Distrubution Box','2021-01-11 09:21:58','2021-01-11 09:21:58'),(1121,'3','2021-01-11 16:50:10','2021-01-11 16:50:10'),(1122,'vga To DVI','2021-01-13 12:33:29','2021-01-13 12:33:29'),(1123,'RJ45 connector','2021-01-14 09:42:14','2021-01-14 09:42:14'),(1124,'Samsung j7 Pro','2021-01-14 11:00:13','2021-01-14 11:00:13'),(1125,'tttt','2021-01-14 11:18:05','2021-01-14 11:18:05'),(1126,'tree','2021-01-14 11:54:52','2021-01-14 11:54:52'),(1127,'10 mm² Red Single Core Cable','2021-01-14 12:03:01','2021-01-14 12:03:01'),(1128,'cable','2021-03-02 10:39:41','2021-03-02 10:39:41'),(1129,'aaabbb','2021-03-02 11:07:17','2021-03-02 11:07:17'),(1130,'sssaaabbbkkk','2021-03-02 11:13:34','2021-03-02 11:13:34'),(1131,'se','2021-03-02 12:12:11','2021-03-02 12:12:11'),(1132,'ew','2021-06-22 12:08:02','2021-06-22 12:08:02'),(1133,'fdfg','2021-06-22 12:17:16','2021-06-22 12:17:16'),(1134,'tttttttttttttttttxxxxxxxxxxxx','2021-06-22 12:17:56','2021-06-22 12:17:56'),(1135,'yyyyyyyyyyyyyyybbbbbbbbbbkkkkkkkkk','2021-06-22 12:17:57','2021-06-22 12:17:57'),(1136,'rerear axel','2021-06-22 12:42:38','2021-06-22 12:42:38');
/*!40000 ALTER TABLE `new_products` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `officer_requicisions`
--

LOCK TABLES `officer_requicisions` WRITE;
/*!40000 ALTER TABLE `officer_requicisions` DISABLE KEYS */;
INSERT INTO `officer_requicisions` VALUES (7,'Bakary Camara',1,'2020-07-01 11:23:35','2020-07-01 11:23:35',1),(9,'Buba Sabally',1,'2020-07-17 11:14:33','2020-07-17 11:14:33',9),(10,'Nayan Bhatt',2,NULL,NULL,10),(11,'Oumie Ceesay',1,'2020-07-23 09:20:22','2020-07-23 09:20:22',9),(12,'Anam Jah Jobe',2,'2020-07-23 09:32:25','2020-07-23 09:32:25',2),(13,'Augustine Jatta',6,'2020-07-23 09:36:26','2020-07-23 09:36:26',13),(14,'Lamin Yaffa',7,'2020-07-23 09:38:19','2020-07-23 09:38:19',12),(15,'Ahamat Jah',8,'2020-07-23 09:40:08','2020-07-23 09:40:08',1),(16,'Lamin O. Touray',8,'2020-07-24 13:16:26','2020-07-24 13:16:26',1),(17,'Sohna Bittaye',1,'2020-07-27 08:35:17','2020-07-27 08:35:17',9),(18,'Salieu Sallah',8,'2020-12-24 13:23:37','2020-12-24 13:23:37',1),(19,'Lamin Njie',1,'2021-01-05 09:26:05','2021-01-05 09:26:05',9),(20,'Fatou Njie',8,'2021-01-29 10:03:31','2021-01-29 10:03:31',1),(21,'Seedy Sanneh',1,'2021-07-27 19:25:33','2021-07-27 19:25:33',9);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_requests`
--

LOCK TABLES `pending_requests` WRITE;
/*!40000 ALTER TABLE `pending_requests` DISABLE KEYS */;
INSERT INTO `pending_requests` VALUES (1,'10A Legrand Fuse; 10mm x 38mm','10A Legrand Fuse; 10mm x 38mm',2,'2021-06-28 12:21:01','2021-06-28 12:21:01',1,1,1),(2,'DDF Frame','DDF Frame',32,'2021-06-28 12:21:01','2021-07-22 15:07:38',4,1,1),(3,'24 CORE SINGLEMODE OS2 G657A1 LOOSE TUBE CABLE LSZH ECA EXT','24 CORE SINGLEMODE OS2 G657A1 LOOSE TUBE CABLE LSZH ECA EXT',23,'2021-06-28 22:37:04','2021-07-22 14:32:04',12,1,1),(4,'1.5mm² Three Core PVC Insulated PVC Sheathed Flexible Cable','1.5mm² Three Core PVC Insulated PVC Sheathed Flexible Cable',43,'2021-06-28 22:37:04','2021-07-22 14:32:08',13,1,1),(5,'1.5\" Wood screw 10mm2','1.5\" Wood screw 10mm2',2,'2021-06-28 22:37:04','2021-06-28 22:37:04',5,1,1),(6,'Banjo Bolt - M14X1.5','Banjo Bolt - M14X1.5',43,'2021-06-28 22:37:04','2021-06-28 22:37:04',5,1,1),(7,'RJ45 connector','RJ45 connector',1000,'2021-06-29 10:40:28','2021-07-22 14:36:17',14,1,1),(8,'DESK PHONE KG933-B','DESK PHONE KG933-B',1000,'2021-06-29 10:40:28','2021-07-22 14:36:17',14,1,1),(9,'Connecting Rod Assembly','Connecting Rod Assembly',5000,'2021-06-29 10:40:28','2021-07-22 14:36:17',14,1,1),(10,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.','1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',2,'2021-07-22 13:57:06','2021-07-22 15:07:33',15,1,1);
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
  `approvedBy` int(2) NOT NULL DEFAULT '0',
  `hodToActOn` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pending_requisition_requests`
--

LOCK TABLES `pending_requisition_requests` WRITE;
/*!40000 ALTER TABLE `pending_requisition_requests` DISABLE KEYS */;
INSERT INTO `pending_requisition_requests` VALUES (1,8,8,16,'2021-06-28 12:21:01','Test Purpose 111...',1,1,0,'0000000001','2021-06-28 12:21:01','2021-06-28 20:00:45',15,0),(2,8,8,16,'2021-06-28 12:21:01','Test Purpose...',1,1,0,'0000000002','2021-06-28 15:14:57','2021-06-28 15:14:57',15,0),(3,8,8,16,'2021-06-28 12:21:01','Test Purpose...111',1,1,0,'0000000003','2021-06-28 15:16:23','2021-06-28 15:16:23',15,0),(4,8,8,16,'2021-06-28 12:21:01','Test Purpose...222',1,0,0,'0000000004','2021-06-28 17:37:44','2021-07-22 15:07:38',15,0),(5,8,8,16,'2021-06-28 22:37:04','Final Demo...',1,1,0,'0000000005','2021-06-28 22:37:04','2021-06-29 10:12:38',15,0),(12,8,8,16,'2021-06-28 22:37:04','Final Demo...',1,0,0,'0000000006','2021-06-29 00:22:14','2021-07-22 14:32:04',15,0),(13,8,8,16,'2021-06-28 22:37:04','Final Demo...',1,1,0,'0000000007','2021-06-29 09:48:51','2021-07-22 15:10:03',15,0),(14,8,8,16,'2021-06-29 10:40:28','A Project for Qcell SL',1,1,0,'0000000008','2021-06-29 10:40:28','2021-07-22 15:08:29',15,0),(15,8,8,16,'2021-07-22 13:57:06','ddd',1,0,0,'0000000009','2021-07-22 13:57:06','2021-07-22 15:07:33',15,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `product_orders`
--

LOCK TABLES `product_orders` WRITE;
/*!40000 ALTER TABLE `product_orders` DISABLE KEYS */;
INSERT INTO `product_orders` VALUES (8,2,'10A Legrand Fuse; 10mm x 38mm',233.00,466.00,145,'2021-06-28 20:00:45','2021-06-28 20:00:45'),(19,2,'1 Black Imaging Drum, 1 Cyan Imaging Drum, 1 Yellow Imaging Drum, and  1 Magenta Imaging Drum.',345.00,690.00,154,'2021-07-22 14:27:35','2021-07-22 14:27:35'),(21,1000,'RJ45 connector',434.00,434000.00,156,'2021-07-22 15:08:29','2021-07-22 15:08:29'),(22,1000,'DESK PHONE KG933-B',454.00,454000.00,156,'2021-07-22 15:08:29','2021-07-22 15:08:29'),(23,1000,'Connecting Rod Assembly',12.00,12000.00,156,'2021-07-22 15:08:29','2021-07-22 15:08:29'),(24,43,'1.5mm² Three Core PVC Insulated PVC Sheathed Flexible Cable',124.00,5332.00,157,'2021-07-22 15:10:03','2021-07-22 15:10:03');
/*!40000 ALTER TABLE `product_orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `repos`
--

DROP TABLE IF EXISTS `repos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `repos` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `poNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `lpoNumber` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `repos`
--

LOCK TABLES `repos` WRITE;
/*!40000 ALTER TABLE `repos` DISABLE KEYS */;
INSERT INTO `repos` VALUES (1,'QC2021/0006','0000000010','2021-07-22 14:28:26','2021-07-22 14:28:26'),(2,'QC2021/0006','0000000010','2021-07-22 14:30:54','2021-07-22 14:30:54'),(4,'QC2021/0006','0000000010','2021-07-22 14:31:51','2021-07-22 14:31:51'),(6,'QC2021/0002','0000000006','2021-07-22 14:32:04','2021-07-22 14:32:04'),(9,'QC2021/0006','0000000010','2021-07-22 14:37:34','2021-07-22 14:37:34'),(10,'QC2021/0006','0000000010','2021-07-22 15:07:29','2021-07-22 15:07:29'),(11,'QC2021/0005','0000000009','2021-07-22 15:07:33','2021-07-22 15:07:33'),(12,'QC2021/0001','0000000004','2021-07-22 15:07:38','2021-07-22 15:07:38');
/*!40000 ALTER TABLE `repos` ENABLE KEYS */;
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
  `reqNotes` text COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`),
  KEY `requisition_orders_hod_id_foreign` (`hod_id`),
  KEY `requisition_orders_dep_id_foreign` (`dep_id`),
  KEY `requisition_orders_officer_id_foreign` (`officer_id`),
  CONSTRAINT `requisition_orders_dep_id_foreign` FOREIGN KEY (`dep_id`) REFERENCES `departments` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requisition_orders_hod_id_foreign` FOREIGN KEY (`hod_id`) REFERENCES `h_o_d_s` (`id`) ON DELETE CASCADE,
  CONSTRAINT `requisition_orders_officer_id_foreign` FOREIGN KEY (`officer_id`) REFERENCES `officer_requicisions` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=158 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `requisition_orders`
--

LOCK TABLES `requisition_orders` WRITE;
/*!40000 ALTER TABLE `requisition_orders` DISABLE KEYS */;
INSERT INTO `requisition_orders` VALUES (145,'0000000001',8,8,16,'2021-06-28 20:00:45','Test Purpose 111...','2021-06-28 16:30:34','2021-06-28 20:00:45',1,1,0,1,1,'QC2021/0001',1,1,1,0,NULL),(154,'0000000010',8,8,16,'2021-07-22 14:27:35','ddd','2021-07-22 16:30:34','2021-07-22 14:27:35',1,1,0,1,1,'QC2021/0006',1,1,1,0,NULL),(156,'0000000008',8,8,16,'2021-07-22 15:08:29','A Project for Qcell SL','2021-07-22 16:30:34','2021-07-22 15:08:29',1,1,0,1,1,'QC2021/0004',1,1,1,0,'sdfsdfwefefs\r\nsdfsfwerwe\r\nsdferwe'),(157,'0000000007',8,8,16,'2021-07-22 15:10:03','Final Demo...','2021-07-14 16:30:34','2021-07-22 15:10:03',1,1,0,1,1,'QC2021/0003',1,1,1,1,'Total Before Discount => DNaN : Total After  Discount => DNaNTe');
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `suppliers`
--

LOCK TABLES `suppliers` WRITE;
/*!40000 ALTER TABLE `suppliers` DISABLE KEYS */;
INSERT INTO `suppliers` VALUES (1,'MP Trading Co. Ltd.','Kairaba Avenue','2020-06-18 15:10:23','2020-12-30 17:00:05',4390100),(2,'Unique Solutions','31A Kairaba Avenue','2020-07-07 08:23:48','2020-07-07 08:23:48',5378200),(3,'Supplier 123','Supplier 123 Address','2020-10-13 12:53:40','2020-12-21 10:10:32',4472897),(4,'General Engineering','Manjai','2020-12-30 16:44:21','2020-12-30 16:44:21',4461353),(5,'Gambia Electrical Ltd.','Kairaba Avenue','2020-12-30 16:53:52','2020-12-30 16:53:52',4227335),(6,'Autofix Enterprise','Old Jeshwang','2020-12-30 16:55:26','2020-12-30 17:01:50',3772001),(7,'Solar Enterprise','Kairaba Avenue','2020-12-30 16:56:12','2020-12-30 16:56:12',3409400),(8,'Prime Stationery Ltd.','Kairaba Avenue','2020-12-30 16:58:54','2020-12-30 16:58:54',4396611),(9,'Sonko Jileng Enterprise','Banjul','2020-12-30 16:59:52','2020-12-30 16:59:52',4226940),(10,'QuantumNET Limited','Bertil Harding Highway','2020-12-30 17:04:10','2020-12-30 17:04:10',3333217),(11,'Swe-Gam Co. Ltd.','Kanifing Industrial Area','2020-12-30 17:06:02','2020-12-30 17:06:02',4373829),(12,'Janko Trading','Sayerr Jobe Avenue, Serrekunda','2020-12-30 17:08:23','2020-12-30 17:08:23',4370084),(13,'J-Mart','Kairaba Avenue','2020-12-30 17:09:40','2020-12-30 17:09:40',4370317),(14,'HM Enterprise','Kairaba Avenue','2020-12-30 17:20:24','2020-12-30 17:20:24',4377649);
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
  `authToAct` int(2) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  UNIQUE KEY `users_email_unique` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES (6,'Bakary Camara','bakary.camara@qcell.gm',NULL,'123',NULL,'2020-07-01 11:23:35','2021-06-23 11:01:27',7,3,1,'123',9,0,0),(8,'Buba Sabally','buba.sabally@qcell.gm',NULL,'123',NULL,'2020-07-17 11:14:33','2021-01-14 10:58:42',9,1,1,'123',9,0,0),(9,'Oumie Ceesay','oumie.ceesay@qcell.gm',NULL,'123',NULL,'2020-07-23 09:20:22','2021-01-05 09:37:50',11,2,1,'123',9,0,0),(10,'Anam Jah Jobe','anam.jah@qcell.gm',NULL,'123',NULL,'2020-07-23 09:32:25','2020-07-23 09:32:25',12,2,2,'123',2,0,0),(11,'Augustine Jatta','augustine.jatta@qcell.gm',NULL,'123',NULL,'2020-07-23 09:36:26','2020-07-23 09:36:26',13,2,6,'123',13,0,0),(12,'Lamin Yaffa','lamin.yaffa@qcell.gm',NULL,'123',NULL,'2020-07-23 09:38:20','2020-07-23 09:38:20',14,2,7,'123',12,0,0),(13,'Ahamat Jah','ahmat.jah@qcell.gm',NULL,'123',NULL,'2020-07-23 09:40:08','2021-01-07 09:27:31',15,2,8,'123',1,0,0),(14,'user123','user.user@qcell.gm',NULL,'123',NULL,'2020-07-24 13:16:26','2021-01-05 16:24:59',16,1,8,'123',1,0,0),(15,'Sohna Bittaye','sohna.bittaye@qcell.gm',NULL,'123',NULL,'2020-07-27 08:35:17','2020-08-17 09:32:54',17,3,1,'123',9,0,0),(16,'Salieu Sallah','salieu.sallah@qcell.gm',NULL,'123',NULL,'2020-12-24 13:23:37','2021-01-29 10:23:13',18,1,8,'123',1,0,0),(18,'Fatou Njie','lamino2ray@gmail.com',NULL,'123',NULL,'2021-01-29 10:03:31','2021-01-29 10:05:32',20,1,8,'123',1,0,1),(19,'Seedy Sanneh','seedy.sanneh@qcell.gm',NULL,'123',NULL,'2021-07-27 19:25:33','2021-07-27 19:25:33',21,1,1,'123',9,0,0);
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

-- Dump completed on 2021-07-27 19:29:32
