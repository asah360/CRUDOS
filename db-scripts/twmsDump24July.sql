CREATE DATABASE  IF NOT EXISTS `twms` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `twms`;
-- MySQL dump 10.13  Distrib 8.0.24, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: twms
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `allocation_inventory_attribute`
--

DROP TABLE IF EXISTS `allocation_inventory_attribute`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_inventory_attribute` (
  `allocation_inventory_attribute_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`allocation_inventory_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_inventory_attribute`
--

LOCK TABLES `allocation_inventory_attribute` WRITE;
/*!40000 ALTER TABLE `allocation_inventory_attribute` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_inventory_attribute` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_method`
--

DROP TABLE IF EXISTS `allocation_method`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_method` (
  `allocation_method_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`allocation_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_method`
--

LOCK TABLES `allocation_method` WRITE;
/*!40000 ALTER TABLE `allocation_method` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_method` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_rule`
--

DROP TABLE IF EXISTS `allocation_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_rule` (
  `allocation_rule_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `included_allocation_zone_list_id` int DEFAULT NULL,
  `excluded_allocation_zone_list_id` int DEFAULT NULL,
  `included_allocation_method_list_id` int DEFAULT NULL,
  `included_allocation_uom_list_id` int DEFAULT NULL,
  `excluded_allocation_uom_list_id` int DEFAULT NULL,
  `included_allocation_inventory_attribute_list_id` int DEFAULT NULL,
  `excluded_allocation_inventory_attribute_list_id` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`allocation_rule_id`),
  KEY `FKs9dralcbhav5gvwiguvnd2w6q` (`included_allocation_method_list_id`),
  KEY `FKkpvnr6vhll2k4esu9m4aqg6ri` (`included_allocation_uom_list_id`),
  KEY `FKnu745bvkc8u5uvshfpibwuqvs` (`excluded_allocation_uom_list_id`),
  KEY `FKa6ybdws51hyt7xs2acgm5g5gi` (`included_allocation_zone_list_id`),
  KEY `FKp2i64hlqjvt82mlbughkc1gtl` (`excluded_allocation_zone_list_id`),
  CONSTRAINT `fk_allocation_rule_allocation_rule_method_list` FOREIGN KEY (`included_allocation_method_list_id`) REFERENCES `allocation_rule_method_list` (`allocation_method_list_id`),
  CONSTRAINT `fk_allocation_rule_allocation_rule_uom_list` FOREIGN KEY (`included_allocation_uom_list_id`) REFERENCES `allocation_rule_uom_list` (`allocation_uom_list_id`),
  CONSTRAINT `fk_allocation_rule_allocation_rule_uom_list_0` FOREIGN KEY (`excluded_allocation_uom_list_id`) REFERENCES `allocation_rule_uom_list` (`allocation_uom_list_id`),
  CONSTRAINT `fk_allocation_rule_allocation_rule_zone_list` FOREIGN KEY (`included_allocation_zone_list_id`) REFERENCES `allocation_rule_zone_list` (`allocation_zone_list_id`),
  CONSTRAINT `fk_allocation_rule_allocation_rule_zone_list_0` FOREIGN KEY (`excluded_allocation_zone_list_id`) REFERENCES `allocation_rule_zone_list` (`allocation_zone_list_id`),
  CONSTRAINT `FKa6ybdws51hyt7xs2acgm5g5gi` FOREIGN KEY (`included_allocation_zone_list_id`) REFERENCES `allocation_rule_zone_list` (`allocation_rule_zone_list_id`),
  CONSTRAINT `FKkpvnr6vhll2k4esu9m4aqg6ri` FOREIGN KEY (`included_allocation_uom_list_id`) REFERENCES `allocation_rule_uom_list` (`allocation_rule_uom_list_id`),
  CONSTRAINT `FKnu745bvkc8u5uvshfpibwuqvs` FOREIGN KEY (`excluded_allocation_uom_list_id`) REFERENCES `allocation_rule_uom_list` (`allocation_rule_uom_list_id`),
  CONSTRAINT `FKp2i64hlqjvt82mlbughkc1gtl` FOREIGN KEY (`excluded_allocation_zone_list_id`) REFERENCES `allocation_rule_zone_list` (`allocation_rule_zone_list_id`),
  CONSTRAINT `FKs9dralcbhav5gvwiguvnd2w6q` FOREIGN KEY (`included_allocation_method_list_id`) REFERENCES `allocation_rule_method_list` (`allocation_rule_method_list_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_rule`
--

LOCK TABLES `allocation_rule` WRITE;
/*!40000 ALTER TABLE `allocation_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_rule_inventory_attribute_list`
--

DROP TABLE IF EXISTS `allocation_rule_inventory_attribute_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_rule_inventory_attribute_list` (
  `allocation_rule_inventory_attribute_list_id` int NOT NULL AUTO_INCREMENT,
  `allocation_inventory_attribute_list_id` int DEFAULT NULL,
  `allocation_inventory_attribute_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`allocation_rule_inventory_attribute_list_id`),
  KEY `idx_allocation_rule_inventory_attribute_list` (`allocation_rule_inventory_attribute_list_id`),
  KEY `FK8ld34gcxkcnee59n84hrieupo` (`allocation_inventory_attribute_id`),
  CONSTRAINT `FK8ld34gcxkcnee59n84hrieupo` FOREIGN KEY (`allocation_inventory_attribute_id`) REFERENCES `allocation_inventory_attribute` (`allocation_inventory_attribute_id`),
  CONSTRAINT `fk_allocation_rule_inv_attr_list_allocation_inv_attr` FOREIGN KEY (`allocation_inventory_attribute_id`) REFERENCES `allocation_inventory_attribute` (`allocation_inventory_attribute_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_rule_inventory_attribute_list`
--

LOCK TABLES `allocation_rule_inventory_attribute_list` WRITE;
/*!40000 ALTER TABLE `allocation_rule_inventory_attribute_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_rule_inventory_attribute_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_rule_method_list`
--

DROP TABLE IF EXISTS `allocation_rule_method_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_rule_method_list` (
  `allocation_rule_method_list_id` int NOT NULL AUTO_INCREMENT,
  `allocation_method_list_id` int DEFAULT NULL,
  `allocation_method_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`allocation_rule_method_list_id`),
  UNIQUE KEY `unq_allocation_rule_method_list_allocation_method_list_id` (`allocation_method_list_id`),
  KEY `FKk5kt6gs6o5b94rvp0mwnb6r45` (`allocation_method_id`),
  CONSTRAINT `fk_allocation_rule_method_list_allocation_method` FOREIGN KEY (`allocation_method_id`) REFERENCES `allocation_method` (`allocation_method_id`),
  CONSTRAINT `FKk5kt6gs6o5b94rvp0mwnb6r45` FOREIGN KEY (`allocation_method_id`) REFERENCES `allocation_method` (`allocation_method_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_rule_method_list`
--

LOCK TABLES `allocation_rule_method_list` WRITE;
/*!40000 ALTER TABLE `allocation_rule_method_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_rule_method_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_rule_uom_list`
--

DROP TABLE IF EXISTS `allocation_rule_uom_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_rule_uom_list` (
  `allocation_rule_uom_list_id` int NOT NULL AUTO_INCREMENT,
  `allocation_uom_list_id` int DEFAULT NULL,
  `allocation_uom_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`allocation_rule_uom_list_id`),
  UNIQUE KEY `unq_allocation_rule_uom_list_allocation_uom_list_id` (`allocation_uom_list_id`),
  KEY `FK983cv6aedsyfgxxylrtukq24s` (`allocation_uom_id`),
  CONSTRAINT `FK983cv6aedsyfgxxylrtukq24s` FOREIGN KEY (`allocation_uom_id`) REFERENCES `allocation_uom` (`allocation_uom_id`),
  CONSTRAINT `fk_allocation_rule_uom_list_allocation_uom` FOREIGN KEY (`allocation_uom_id`) REFERENCES `allocation_uom` (`allocation_uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_rule_uom_list`
--

LOCK TABLES `allocation_rule_uom_list` WRITE;
/*!40000 ALTER TABLE `allocation_rule_uom_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_rule_uom_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_rule_zone_list`
--

DROP TABLE IF EXISTS `allocation_rule_zone_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_rule_zone_list` (
  `allocation_rule_zone_list_id` int NOT NULL AUTO_INCREMENT,
  `allocation_zone_list_id` int DEFAULT NULL,
  `allocation_zone_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`allocation_rule_zone_list_id`),
  UNIQUE KEY `unq_allocation_rule_zone_list_allocation_zone_list_id` (`allocation_zone_list_id`),
  KEY `FK3mie3alh6d4o4tm9bmhkt7eiy` (`allocation_zone_id`),
  CONSTRAINT `FK3mie3alh6d4o4tm9bmhkt7eiy` FOREIGN KEY (`allocation_zone_id`) REFERENCES `allocation_zone` (`allocation_zone_id`),
  CONSTRAINT `fk_allocation_rule_zone_list_allocation_zone` FOREIGN KEY (`allocation_zone_id`) REFERENCES `allocation_zone` (`allocation_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_rule_zone_list`
--

LOCK TABLES `allocation_rule_zone_list` WRITE;
/*!40000 ALTER TABLE `allocation_rule_zone_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_rule_zone_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_uom`
--

DROP TABLE IF EXISTS `allocation_uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_uom` (
  `allocation_uom_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`allocation_uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_uom`
--

LOCK TABLES `allocation_uom` WRITE;
/*!40000 ALTER TABLE `allocation_uom` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocation_zone`
--

DROP TABLE IF EXISTS `allocation_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocation_zone` (
  `allocation_zone_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`allocation_zone_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocation_zone`
--

LOCK TABLES `allocation_zone` WRITE;
/*!40000 ALTER TABLE `allocation_zone` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocation_zone` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment`
--

DROP TABLE IF EXISTS `appointment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `appointment` (
  `appointment_id` int NOT NULL AUTO_INCREMENT,
  `apppointment_code` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `dockdoor_id` int DEFAULT NULL,
  `planned_start_dttm` datetime DEFAULT NULL,
  `planned_end_dttm` datetime DEFAULT NULL,
  `appointment_type` varchar(200) DEFAULT NULL,
  `duration` int DEFAULT NULL,
  `estimated_units` double DEFAULT NULL,
  `truck_id` int DEFAULT NULL,
  PRIMARY KEY (`appointment_id`),
  KEY `FKgc700tinrwisy69mdgx33w2js` (`dockdoor_id`),
  KEY `FKm3sqdh1h4xgm7lblqjcgyccag` (`truck_id`),
  CONSTRAINT `fk_appointment_dock_door` FOREIGN KEY (`dockdoor_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `fk_appointment_truck` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`),
  CONSTRAINT `FKgc700tinrwisy69mdgx33w2js` FOREIGN KEY (`dockdoor_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `FKm3sqdh1h4xgm7lblqjcgyccag` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment`
--

LOCK TABLES `appointment` WRITE;
/*!40000 ALTER TABLE `appointment` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn`
--

DROP TABLE IF EXISTS `asn`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asn` (
  `asn_id` int NOT NULL AUTO_INCREMENT,
  `asn_code` varchar(200) NOT NULL,
  `asn_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `awb_nbr` varchar(200) DEFAULT NULL,
  `asn_requested_dttm` datetime DEFAULT NULL,
  `asn_created_dttm` datetime DEFAULT NULL,
  `asn_receiving_start_dttm` datetime DEFAULT NULL,
  `asn_receiving_end_dttm` datetime DEFAULT NULL,
  `asn_cancelled_dttm` datetime DEFAULT NULL,
  `host_asn_ref_nbr` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `appointment_id` int DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `requested_units` double DEFAULT NULL,
  `shipped_units` double DEFAULT NULL,
  `received_units` double DEFAULT NULL,
  `rejected_units` double DEFAULT NULL,
  `requested_cartons` int DEFAULT NULL,
  `shipped_cartons` int DEFAULT NULL,
  `received_cartons` int DEFAULT NULL,
  `rejected_cartons` int DEFAULT NULL,
  `dock_door_id` int DEFAULT NULL,
  PRIMARY KEY (`asn_id`),
  KEY `FKp80oblkifnx4iet6gfj0j348q` (`appointment_id`),
  KEY `FKa7c96vpww61jn83ujx7cr8v0` (`dock_door_id`),
  KEY `FK8x27fmk4s56kwnqh693em87rp` (`load_id`),
  KEY `FKaew56wf07r7vmulaeftrndm7i` (`vendor_id`),
  CONSTRAINT `FK8x27fmk4s56kwnqh693em87rp` FOREIGN KEY (`load_id`) REFERENCES `loads` (`loads_id`),
  CONSTRAINT `fk_asn_appointment` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`),
  CONSTRAINT `fk_asn_dock_door` FOREIGN KEY (`dock_door_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `fk_asn_loads` FOREIGN KEY (`load_id`) REFERENCES `loads` (`loads_id`),
  CONSTRAINT `fk_asn_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `FKa7c96vpww61jn83ujx7cr8v0` FOREIGN KEY (`dock_door_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `FKaew56wf07r7vmulaeftrndm7i` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `FKp80oblkifnx4iet6gfj0j348q` FOREIGN KEY (`appointment_id`) REFERENCES `appointment` (`appointment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn`
--

LOCK TABLES `asn` WRITE;
/*!40000 ALTER TABLE `asn` DISABLE KEYS */;
INSERT INTO `asn` VALUES (1,'A001','H2H','Created',NULL,'AWB123',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,10,NULL,NULL,NULL,NULL,NULL,NULL,NULL),(2,'A003','B2B','Created',NULL,'AWB122',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,10,5,NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `asn` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `asn_detail`
--

DROP TABLE IF EXISTS `asn_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `asn_detail` (
  `asn_detail_id` int NOT NULL AUTO_INCREMENT,
  `asn_id` int DEFAULT NULL,
  `asn_seq_nbr` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `number_of_packs` int DEFAULT NULL,
  `qty_per_pack` double DEFAULT NULL,
  `number_of_cases` int DEFAULT NULL,
  `qty_per_case` double DEFAULT NULL,
  `lpn_id` int DEFAULT NULL,
  `pallet_id` int DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `host_asn_detail_ref_nbr` varchar(200) DEFAULT NULL,
  `asn_detail_requested_dttm` datetime DEFAULT NULL,
  `asn_detail_created_dttm` datetime DEFAULT NULL,
  `asn_detail_receiving_start_dttm` datetime DEFAULT NULL,
  `asn_detail_receiving_end_dttm` datetime DEFAULT NULL,
  `asn_detail_cancelled_dttm` datetime DEFAULT NULL,
  `requested_units` double DEFAULT NULL,
  `shipped_units` double DEFAULT NULL,
  `received_units` double DEFAULT NULL,
  `rejected_units` double DEFAULT NULL,
  `purchase_order_detail_id` int DEFAULT NULL,
  `order_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`asn_detail_id`),
  KEY `FKd48ympp2l7kru12jhio0oqqi7` (`asn_id`),
  KEY `FK43l84326mrxpnhhy3b70jgdpx` (`item_id`),
  KEY `FKnrt8ejn2w0hedid6scfsgatfo` (`purchase_order_detail_id`),
  CONSTRAINT `FK43l84326mrxpnhhy3b70jgdpx` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_asn_detail_asn` FOREIGN KEY (`asn_id`) REFERENCES `asn` (`asn_id`),
  CONSTRAINT `fk_asn_detail_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_asn_detail_purchase_order_detail` FOREIGN KEY (`purchase_order_detail_id`) REFERENCES `purchase_order_detail` (`purchase_order_detail_id`),
  CONSTRAINT `FKd48ympp2l7kru12jhio0oqqi7` FOREIGN KEY (`asn_id`) REFERENCES `asn` (`asn_id`),
  CONSTRAINT `FKnrt8ejn2w0hedid6scfsgatfo` FOREIGN KEY (`purchase_order_detail_id`) REFERENCES `purchase_order_detail` (`purchase_order_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `asn_detail`
--

LOCK TABLES `asn_detail` WRITE;
/*!40000 ALTER TABLE `asn_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `asn_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `batch`
--

DROP TABLE IF EXISTS `batch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `batch` (
  `batch_id` int NOT NULL AUTO_INCREMENT,
  `batch_code` varchar(100) DEFAULT NULL,
  `mfg_date` datetime DEFAULT NULL,
  `exp_date` datetime DEFAULT NULL,
  `received_date` datetime DEFAULT NULL,
  `shipped_date` datetime DEFAULT NULL,
  PRIMARY KEY (`batch_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `batch`
--

LOCK TABLES `batch` WRITE;
/*!40000 ALTER TABLE `batch` DISABLE KEYS */;
/*!40000 ALTER TABLE `batch` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `billling_address`
--

DROP TABLE IF EXISTS `billling_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `billling_address` (
  `billling_address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `street` varchar(500) DEFAULT NULL,
  `city` varchar(200) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `alternate_phone` varchar(100) DEFAULT NULL,
  `alternate_email` varchar(500) DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '1',
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`billling_address_id`),
  KEY `FKsphbvtx0fq1nb1ay0w3iiuq9u` (`customer_id`),
  CONSTRAINT `fk_billling_address_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FKsphbvtx0fq1nb1ay0w3iiuq9u` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `billling_address`
--

LOCK TABLES `billling_address` WRITE;
/*!40000 ALTER TABLE `billling_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `billling_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carton`
--

DROP TABLE IF EXISTS `carton`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carton` (
  `carton_id` int NOT NULL AUTO_INCREMENT,
  `carton_number` varchar(100) DEFAULT NULL,
  `carton_type` varchar(100) DEFAULT NULL,
  `package_type` varchar(100) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `is_multisku` tinyint(1) DEFAULT NULL,
  `carton_attr_1` varchar(100) DEFAULT NULL,
  `carton_attr_2` varchar(100) DEFAULT NULL,
  `carton_attr_3` varchar(100) DEFAULT NULL,
  `carton_attr_4` varchar(100) DEFAULT NULL,
  `carton_attr_5` varchar(100) DEFAULT NULL,
  `carton_attr_6` varchar(100) DEFAULT NULL,
  `size_type` varchar(100) DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `total_qty` double DEFAULT NULL,
  `allocated_qty` double DEFAULT NULL,
  `available_qty` double DEFAULT NULL,
  `locked_qty` double DEFAULT NULL,
  `parent_lpn_id` int DEFAULT NULL,
  `is_pallet` tinyint(1) DEFAULT '0',
  `is_pack` tinyint(1) DEFAULT NULL,
  `is_case` tinyint(1) DEFAULT NULL,
  `lock_code_id` int DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  PRIMARY KEY (`carton_id`),
  KEY `FKb0b79hsldplge7yjr2yoc4gln` (`location_id`),
  KEY `FKirw8gsdbyio07oirf267kxqa0` (`lock_code_id`),
  KEY `FK4ftvpucqdagfh217f2fg6d9nq` (`uom_id`),
  CONSTRAINT `FK4ftvpucqdagfh217f2fg6d9nq` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`),
  CONSTRAINT `fk_carton_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_carton_lock_code` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`),
  CONSTRAINT `fk_carton_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`),
  CONSTRAINT `FKb0b79hsldplge7yjr2yoc4gln` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FKirw8gsdbyio07oirf267kxqa0` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carton`
--

LOCK TABLES `carton` WRITE;
/*!40000 ALTER TABLE `carton` DISABLE KEYS */;
/*!40000 ALTER TABLE `carton` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carton_detail`
--

DROP TABLE IF EXISTS `carton_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `carton_detail` (
  `carton_detail_id` int NOT NULL AUTO_INCREMENT,
  `carton_id` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `inventory_attr_1` varchar(100) DEFAULT NULL,
  `inventory_attr_2` varchar(100) DEFAULT NULL,
  `inventory_attr_3` varchar(100) DEFAULT NULL,
  `inventory_attr_4` varchar(100) DEFAULT NULL,
  `inventory_attr_5` varchar(100) DEFAULT NULL,
  `inventory_attr_6` varchar(100) DEFAULT NULL,
  `asn_detail_id` int DEFAULT NULL,
  `purchase_order_detail_id` int DEFAULT NULL,
  `order_detail_id` int DEFAULT NULL,
  `putaway_type_id` int DEFAULT NULL,
  `total_qty` double DEFAULT NULL,
  `allocated_qty` double DEFAULT NULL,
  `available_qty` double DEFAULT NULL,
  `locked_qty` double DEFAULT NULL,
  `lock_code_id` int DEFAULT NULL,
  `batch_id` int DEFAULT NULL,
  PRIMARY KEY (`carton_detail_id`),
  KEY `FKem0outt9g90kfha677b414lp9` (`batch_id`),
  KEY `FK4euoovdven8pp04aefwabi4k5` (`carton_id`),
  KEY `FKpeb2206oq293xans4ki5sb9eh` (`lock_code_id`),
  CONSTRAINT `FK4euoovdven8pp04aefwabi4k5` FOREIGN KEY (`carton_id`) REFERENCES `carton` (`carton_id`),
  CONSTRAINT `fk_carton_detail_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `fk_carton_detail_carton` FOREIGN KEY (`carton_id`) REFERENCES `carton` (`carton_id`),
  CONSTRAINT `fk_carton_detail_lock_code` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`),
  CONSTRAINT `FKem0outt9g90kfha677b414lp9` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `FKpeb2206oq293xans4ki5sb9eh` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carton_detail`
--

LOCK TABLES `carton_detail` WRITE;
/*!40000 ALTER TABLE `carton_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `carton_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `company`
--

DROP TABLE IF EXISTS `company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `company` (
  `company_id` int NOT NULL AUTO_INCREMENT,
  `companycode` varchar(20) NOT NULL,
  `parent_company_id` int DEFAULT NULL,
  `companyname` varchar(50) NOT NULL,
  `companytype` varchar(30) DEFAULT NULL,
  `address1` varchar(50) DEFAULT NULL,
  `address2` varchar(50) DEFAULT NULL,
  `city` varchar(30) DEFAULT NULL,
  `street` varchar(50) DEFAULT NULL,
  `zipcode` varchar(20) DEFAULT NULL,
  `state` varchar(30) DEFAULT NULL,
  `country` varchar(30) DEFAULT NULL,
  `contact` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `isparentcompany` tinyint(1) DEFAULT '1',
  `is_enabled` tinyint(1) DEFAULT '1',
  `default_lang_code` varchar(4) DEFAULT 'en',
  `created_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(30) DEFAULT NULL,
  `last_updated_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`company_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `company`
--

LOCK TABLES `company` WRITE;
/*!40000 ALTER TABLE `company` DISABLE KEYS */;
INSERT INTO `company` VALUES (1,'C001',NULL,'TWMS Company','parent','WhiteField','Bengaluru','Bengaluru',NULL,NULL,'KA','India',NULL,NULL,NULL,0,1,NULL,'2021-07-23 14:18:22','2021-07-23 14:18:22','2','1'),(2,'C002',1,'TWMS Child 1 Company','child','WhiteField','Bengaluru','Bengaluru',NULL,NULL,'KA','India',NULL,NULL,NULL,1,1,NULL,'2021-07-23 14:18:22','2021-07-23 14:18:22','2','1'),(3,'C003',1,'TWMS Child 2 Company','child','WhiteField','Bengaluru','Bengaluru',NULL,NULL,'KA','India',NULL,NULL,NULL,1,1,NULL,'2021-07-23 14:18:22','2021-07-23 14:18:22','2','1');
/*!40000 ALTER TABLE `company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `company_page`
--

DROP TABLE IF EXISTS `company_page`;
/*!50001 DROP VIEW IF EXISTS `company_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `company_page` AS SELECT 
 1 AS `companycode`,
 1 AS `parent_company_code`,
 1 AS `companyname`,
 1 AS `companytype`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `city`,
 1 AS `street`,
 1 AS `zipcode`,
 1 AS `state`,
 1 AS `country`,
 1 AS `contact`,
 1 AS `email`,
 1 AS `timezone`,
 1 AS `isparentcompany`,
 1 AS `is_enabled`,
 1 AS `default_lang_code`,
 1 AS `created_dttm`,
 1 AS `last_updated_dttm`,
 1 AS `created_by`,
 1 AS `updated_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `customer`
--

DROP TABLE IF EXISTS `customer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `customer` (
  `customer_id` int NOT NULL AUTO_INCREMENT,
  `customer_code` varchar(200) DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `street` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `zip` varchar(200) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `alternate_phone` varchar(100) DEFAULT NULL,
  `alternate_email` varchar(500) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer`
--

LOCK TABLES `customer` WRITE;
/*!40000 ALTER TABLE `customer` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dock`
--

DROP TABLE IF EXISTS `dock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dock` (
  `dock_id` int NOT NULL AUTO_INCREMENT,
  `dock_code` varchar(100) DEFAULT NULL,
  `dock_type` varchar(45) DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`dock_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dock`
--

LOCK TABLES `dock` WRITE;
/*!40000 ALTER TABLE `dock` DISABLE KEYS */;
/*!40000 ALTER TABLE `dock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dock_door`
--

DROP TABLE IF EXISTS `dock_door`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dock_door` (
  `dock_door_id` int NOT NULL,
  `dock_id` int DEFAULT NULL,
  `dock_door_code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `is_occupied` tinyint(1) DEFAULT '0',
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`dock_door_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dock_door`
--

LOCK TABLES `dock_door` WRITE;
/*!40000 ALTER TABLE `dock_door` DISABLE KEYS */;
/*!40000 ALTER TABLE `dock_door` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facility`
--

DROP TABLE IF EXISTS `facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `facility` (
  `facility_id` int NOT NULL AUTO_INCREMENT,
  `facility_code` varchar(20) NOT NULL,
  `facility_name` varchar(50) NOT NULL,
  `facility_type` varchar(30) DEFAULT NULL,
  `Address1` varchar(50) DEFAULT NULL,
  `Address2` varchar(50) DEFAULT NULL,
  `City` varchar(30) DEFAULT NULL,
  `Street` varchar(50) DEFAULT NULL,
  `ZipCode` varchar(20) DEFAULT NULL,
  `State` varchar(30) DEFAULT NULL,
  `Country` varchar(30) DEFAULT NULL,
  `Contact` varchar(30) DEFAULT NULL,
  `Email` varchar(50) DEFAULT NULL,
  `TimeZone` varchar(30) DEFAULT NULL,
  `Parent_Company_id` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `default_lang_code` varchar(4) DEFAULT 'en',
  `created_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user` varchar(30) DEFAULT NULL,
  `last_updated_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`facility_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facility`
--

LOCK TABLES `facility` WRITE;
/*!40000 ALTER TABLE `facility` DISABLE KEYS */;
INSERT INTO `facility` VALUES (1,'F001','Bengaluru Facility 1','DC','Whitefield FC - address1','WhiteField FC','Bangalore',NULL,NULL,NULL,'IN',NULL,NULL,NULL,1,1,NULL,'2021-07-23 14:28:35','2021-07-23 14:28:35','2',NULL);
/*!40000 ALTER TABLE `facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `facility_page`
--

DROP TABLE IF EXISTS `facility_page`;
/*!50001 DROP VIEW IF EXISTS `facility_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `facility_page` AS SELECT 
 1 AS `facility_code`,
 1 AS `facility_name`,
 1 AS `facility_type`,
 1 AS `address1`,
 1 AS `address2`,
 1 AS `city`,
 1 AS `street`,
 1 AS `zipcode`,
 1 AS `state`,
 1 AS `country`,
 1 AS `contact`,
 1 AS `email`,
 1 AS `timezone`,
 1 AS `companyname`,
 1 AS `is_enabled`,
 1 AS `default_lang_code`,
 1 AS `created_dttm`,
 1 AS `last_updated_dttm`,
 1 AS `created_by`,
 1 AS `updated_by`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `groups_id` int NOT NULL AUTO_INCREMENT,
  `group_name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'SHIPPING'),(2,'OUTBOUND'),(3,'INBOUND'),(4,'ALL');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `groups_permission`
--

DROP TABLE IF EXISTS `groups_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups_permission` (
  `groups_permission_id` int NOT NULL AUTO_INCREMENT,
  `groups_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`groups_permission_id`),
  KEY `fk_groups_permission_groups` (`groups_id`),
  KEY `FKq5xwkpxmmgji5tt5x7feywwqq` (`permission_id`),
  CONSTRAINT `fk_groups_permission_groups` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`groups_id`),
  CONSTRAINT `fk_groups_permission_permission` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`),
  CONSTRAINT `FKq5xwkpxmmgji5tt5x7feywwqq` FOREIGN KEY (`permission_id`) REFERENCES `permission` (`permission_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='A group could be assigned with multiple permissions';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups_permission`
--

LOCK TABLES `groups_permission` WRITE;
/*!40000 ALTER TABLE `groups_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `groups_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imt_action`
--

DROP TABLE IF EXISTS `imt_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imt_action` (
  `imt_action_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(200) DEFAULT NULL,
  `api_object` varchar(500) DEFAULT NULL,
  `version` varchar(100) DEFAULT NULL,
  `need_object` tinyint(1) DEFAULT NULL,
  `need_source` tinyint(1) DEFAULT NULL,
  `need_destination` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`imt_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imt_action`
--

LOCK TABLES `imt_action` WRITE;
/*!40000 ALTER TABLE `imt_action` DISABLE KEYS */;
/*!40000 ALTER TABLE `imt_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imt_action_detail`
--

DROP TABLE IF EXISTS `imt_action_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imt_action_detail` (
  `imt_action_detail_id` int NOT NULL AUTO_INCREMENT,
  `inventory_movement_type_id` int DEFAULT NULL,
  `imt_action_id` int DEFAULT NULL,
  `action_seq` int DEFAULT NULL,
  PRIMARY KEY (`imt_action_detail_id`),
  KEY `FKteovfmypfie5cim3o51883r4b` (`imt_action_id`),
  KEY `FKno2h7118hy59srk86ctjufct0` (`inventory_movement_type_id`),
  CONSTRAINT `fk_imt_action_detail_imt_action` FOREIGN KEY (`imt_action_id`) REFERENCES `imt_action` (`imt_action_id`),
  CONSTRAINT `fk_imt_action_detail_inventory_movement_type` FOREIGN KEY (`inventory_movement_type_id`) REFERENCES `inventory_movement_type` (`inventory_movement_type_id`),
  CONSTRAINT `FKno2h7118hy59srk86ctjufct0` FOREIGN KEY (`inventory_movement_type_id`) REFERENCES `inventory_movement_type` (`inventory_movement_type_id`),
  CONSTRAINT `FKteovfmypfie5cim3o51883r4b` FOREIGN KEY (`imt_action_id`) REFERENCES `imt_action` (`imt_action_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imt_action_detail`
--

LOCK TABLES `imt_action_detail` WRITE;
/*!40000 ALTER TABLE `imt_action_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `imt_action_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imt_destination`
--

DROP TABLE IF EXISTS `imt_destination`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imt_destination` (
  `imt_destination_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imt_destination_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imt_destination`
--

LOCK TABLES `imt_destination` WRITE;
/*!40000 ALTER TABLE `imt_destination` DISABLE KEYS */;
/*!40000 ALTER TABLE `imt_destination` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imt_object`
--

DROP TABLE IF EXISTS `imt_object`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imt_object` (
  `imt_object_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imt_object_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imt_object`
--

LOCK TABLES `imt_object` WRITE;
/*!40000 ALTER TABLE `imt_object` DISABLE KEYS */;
/*!40000 ALTER TABLE `imt_object` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `imt_source`
--

DROP TABLE IF EXISTS `imt_source`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `imt_source` (
  `imt_source_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`imt_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `imt_source`
--

LOCK TABLES `imt_source` WRITE;
/*!40000 ALTER TABLE `imt_source` DISABLE KEYS */;
/*!40000 ALTER TABLE `imt_source` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory`
--

DROP TABLE IF EXISTS `inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory` (
  `inventory_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  `location_id` int DEFAULT NULL,
  `inventory_type` varchar(100) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `total_qty` double DEFAULT NULL,
  `allocated_qty` double DEFAULT NULL,
  `available_qty` double DEFAULT NULL,
  `locked_qty` double DEFAULT NULL,
  `lock_code_id` int DEFAULT NULL,
  PRIMARY KEY (`inventory_id`),
  KEY `FKq4qxohkbpt2t6anovkpmjkxh7` (`location_id`),
  KEY `FKso5frd9htx9txl77du9i5qhmh` (`lock_code_id`),
  CONSTRAINT `fk_inventory_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_inventory_lock_code` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`),
  CONSTRAINT `FKq4qxohkbpt2t6anovkpmjkxh7` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FKso5frd9htx9txl77du9i5qhmh` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory`
--

LOCK TABLES `inventory` WRITE;
/*!40000 ALTER TABLE `inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_detail`
--

DROP TABLE IF EXISTS `inventory_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_detail` (
  `inventory_detail_id` int NOT NULL AUTO_INCREMENT,
  `inventory_id` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `inventory_attr_1` varchar(100) DEFAULT NULL,
  `inventory_attr_2` varchar(100) DEFAULT NULL,
  `inventory_attr_3` varchar(100) DEFAULT NULL,
  `inventory_attr_4` varchar(100) DEFAULT NULL,
  `inventory_attr_5` varchar(100) DEFAULT NULL,
  `inventory_attr_6` varchar(100) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `asn_detail_id` int DEFAULT NULL,
  `purchase_order_detail_id` int DEFAULT NULL,
  `order_detail_id` int DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `allocated_qty` double DEFAULT NULL,
  `available_qty` double DEFAULT NULL,
  `lock_code_id` int DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `batch_id` int DEFAULT NULL,
  PRIMARY KEY (`inventory_detail_id`),
  KEY `FKlkisx1k2m91r1hxen69vtfo4k` (`batch_id`),
  KEY `FK4jd91it5urp60g10jceppcgak` (`inventory_id`),
  KEY `FK4kq503c26yd1q5m9ljgftoci0` (`lock_code_id`),
  KEY `FKq1luo6fjq5ci06p2m6doo9auq` (`uom_id`),
  CONSTRAINT `FK4jd91it5urp60g10jceppcgak` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`),
  CONSTRAINT `FK4kq503c26yd1q5m9ljgftoci0` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`),
  CONSTRAINT `fk_inventory_detail_batch` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `fk_inventory_detail_inventory` FOREIGN KEY (`inventory_id`) REFERENCES `inventory` (`inventory_id`),
  CONSTRAINT `fk_inventory_detail_lock_code` FOREIGN KEY (`lock_code_id`) REFERENCES `lock_code` (`lock_code_id`),
  CONSTRAINT `fk_inventory_detail_uom` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`),
  CONSTRAINT `FKlkisx1k2m91r1hxen69vtfo4k` FOREIGN KEY (`batch_id`) REFERENCES `batch` (`batch_id`),
  CONSTRAINT `FKq1luo6fjq5ci06p2m6doo9auq` FOREIGN KEY (`uom_id`) REFERENCES `uom` (`uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_detail`
--

LOCK TABLES `inventory_detail` WRITE;
/*!40000 ALTER TABLE `inventory_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `inventory_movement_type`
--

DROP TABLE IF EXISTS `inventory_movement_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `inventory_movement_type` (
  `inventory_movement_type_id` int NOT NULL AUTO_INCREMENT,
  `description` varchar(500) DEFAULT NULL,
  `imt_object_id` int DEFAULT NULL,
  `imt_source_id` int DEFAULT NULL,
  `imt_destination_id` int DEFAULT NULL,
  `custom_code` varchar(100) DEFAULT NULL,
  `imt_type` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`inventory_movement_type_id`),
  KEY `FKfk5yqlgv9nyhouov2975env38` (`imt_destination_id`),
  KEY `FKhx7fdnruam4ai8ofrq2o0if91` (`imt_object_id`),
  KEY `FKscwq1fd5km84orasm88yv13ks` (`imt_source_id`),
  CONSTRAINT `fk_inventory_movement_type_imt_destination` FOREIGN KEY (`imt_destination_id`) REFERENCES `imt_destination` (`imt_destination_id`),
  CONSTRAINT `fk_inventory_movement_type_imt_object` FOREIGN KEY (`imt_object_id`) REFERENCES `imt_object` (`imt_object_id`),
  CONSTRAINT `fk_inventory_movement_type_imt_source` FOREIGN KEY (`imt_source_id`) REFERENCES `imt_source` (`imt_source_id`),
  CONSTRAINT `FKfk5yqlgv9nyhouov2975env38` FOREIGN KEY (`imt_destination_id`) REFERENCES `imt_destination` (`imt_destination_id`),
  CONSTRAINT `FKhx7fdnruam4ai8ofrq2o0if91` FOREIGN KEY (`imt_object_id`) REFERENCES `imt_object` (`imt_object_id`),
  CONSTRAINT `FKscwq1fd5km84orasm88yv13ks` FOREIGN KEY (`imt_source_id`) REFERENCES `imt_source` (`imt_source_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `inventory_movement_type`
--

LOCK TABLES `inventory_movement_type` WRITE;
/*!40000 ALTER TABLE `inventory_movement_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `inventory_movement_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_facility`
--

DROP TABLE IF EXISTS `item_facility`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_facility` (
  `item_facility_id` int NOT NULL,
  `item_id` int DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `item_facility_putaway_type_id` int DEFAULT NULL,
  `item_facility_pref_area` varchar(100) DEFAULT NULL,
  `item_facility_pref_aisle` varchar(100) DEFAULT NULL,
  `item_facility_pref_level` varchar(100) DEFAULT NULL,
  `item_facility_pref_position` varchar(100) DEFAULT NULL,
  `item_facility_pref_bin` varchar(100) DEFAULT NULL,
  `item_facility_pref_alloc_zone_id` int DEFAULT NULL,
  `item_facility_pref_pick_zone_id` int DEFAULT NULL,
  `item_facility_pref_drop_zone_id` int DEFAULT NULL,
  `item_facility_pref_putaway_zone_id` int DEFAULT NULL,
  `item_facility_pref_replenishment_zone_id` int DEFAULT NULL,
  `item_facility_pref_picking_rule_id` int DEFAULT NULL,
  `item_facility_pref_putaway_rule_id` int DEFAULT NULL,
  `cust_short_value_1` int DEFAULT NULL,
  `cust_short_value_2` int DEFAULT NULL,
  `cust_short_value_3` int DEFAULT NULL,
  `cust_double_value_1` double DEFAULT NULL,
  `cust_double_value_2` double DEFAULT NULL,
  `cust_double_value_3` double DEFAULT NULL,
  `cust_dttm_value_1` datetime DEFAULT NULL,
  `cust_dttm_value_2` datetime DEFAULT NULL,
  `cust_dttm_value_3` datetime DEFAULT NULL,
  `cust_string_value_1` varchar(200) DEFAULT NULL,
  `cust_string_value_2` varchar(200) DEFAULT NULL,
  `cust_string_value_3` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`item_facility_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_facility`
--

LOCK TABLES `item_facility` WRITE;
/*!40000 ALTER TABLE `item_facility` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_facility` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `item_vendor`
--

DROP TABLE IF EXISTS `item_vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `item_vendor` (
  `item_vendor_id` int NOT NULL AUTO_INCREMENT,
  `item_id` int DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `item_vendor_code` varchar(200) DEFAULT NULL,
  `item_vendor_uom_conversion_id` int DEFAULT NULL,
  PRIMARY KEY (`item_vendor_id`),
  KEY `FKexlvpt7w7l6dqb9g0x6md59x4` (`item_id`),
  KEY `FKpd2k6o4jgp4pmro6aag1h4sbo` (`vendor_id`),
  CONSTRAINT `fk_item_vendor_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_item_vendor_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`),
  CONSTRAINT `FKexlvpt7w7l6dqb9g0x6md59x4` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `FKpd2k6o4jgp4pmro6aag1h4sbo` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `item_vendor`
--

LOCK TABLES `item_vendor` WRITE;
/*!40000 ALTER TABLE `item_vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `item_vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items`
--

DROP TABLE IF EXISTS `items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items` (
  `item_id` int NOT NULL,
  `item_code` varchar(50) NOT NULL,
  `item_barcode` varchar(50) NOT NULL,
  `item_description` varchar(50) DEFAULT NULL,
  `unit_length` int DEFAULT NULL,
  `unit_width` int DEFAULT NULL,
  `unit_height` int DEFAULT NULL,
  `unit_volume` int DEFAULT NULL,
  `unit_weight` int DEFAULT NULL,
  `item_putaway_type_id` int DEFAULT NULL,
  `base_uom_id` int DEFAULT NULL,
  `unit_cost` int DEFAULT NULL,
  `default_uom_conversion_id` int DEFAULT NULL,
  `cost_revision_id` int DEFAULT NULL,
  `item_vendor_code_id` int DEFAULT NULL,
  `item_upc_code` varchar(50) DEFAULT NULL,
  `default_item_category_id` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `company_id` int NOT NULL,
  `default_oblpn_type_id` int DEFAULT NULL,
  `default_iblpn_type_id` int DEFAULT NULL,
  `is_serialized` tinyint(1) DEFAULT '0',
  `serial_controlled_flag` int DEFAULT NULL,
  `is_batch_controlled` tinyint(1) DEFAULT '0',
  `batch_controlled_flag` int DEFAULT NULL,
  `productlife` int DEFAULT NULL,
  `is_sortable` tinyint(1) DEFAULT '0',
  `is_conveyable` tinyint(1) DEFAULT '0',
  `item_type_1` varchar(30) DEFAULT NULL,
  `item_type_2` varchar(30) DEFAULT NULL,
  `item_type_3` varchar(30) DEFAULT NULL,
  `item_type_4` varchar(30) DEFAULT NULL,
  `item_type_5` varchar(30) DEFAULT NULL,
  `invn_attr_1` varchar(30) DEFAULT NULL,
  `invn_attr_1_track_flag` int DEFAULT NULL,
  `invn_attr_2` varchar(30) DEFAULT NULL,
  `invn_attr_2_track_flag` int DEFAULT NULL,
  `invn_attr_3` varchar(30) DEFAULT NULL,
  `invn_attr_3_track_flag` int DEFAULT NULL,
  `invn_attr_4` varchar(30) DEFAULT NULL,
  `invn_attr_4_track_flag` int DEFAULT NULL,
  `invn_attr_5` varchar(30) DEFAULT NULL,
  `invn_attr_5_track_flag` int DEFAULT NULL,
  `invn_attr_6` varchar(30) DEFAULT NULL,
  `invn_attr_6_track_flag` int DEFAULT NULL,
  `invn_attr_7` varchar(30) DEFAULT NULL,
  `invn_attr_7_track_flag` int DEFAULT NULL,
  `invn_attr_8` varchar(30) DEFAULT NULL,
  `invn_attr_8_track_flag` int DEFAULT NULL,
  `invn_attr_9` varchar(30) DEFAULT NULL,
  `invn_attr_9_track_flag` int DEFAULT NULL,
  `invn_attr_10` varchar(30) DEFAULT NULL,
  `invn_attr_10_track_flag` int DEFAULT NULL,
  `cust_short_value_1` int DEFAULT NULL,
  `cust_short_value_2` int DEFAULT NULL,
  `cust_short_value_3` int DEFAULT NULL,
  `cust_short_value_4` int DEFAULT NULL,
  `cust_short_value_5` int DEFAULT NULL,
  `cust_long_value_1` int DEFAULT NULL,
  `cust_long_value_2` int DEFAULT NULL,
  `cust_long_value_3` int DEFAULT NULL,
  `cust_long_value_4` int DEFAULT NULL,
  `cust_long_value_5` int DEFAULT NULL,
  `cust_double_value_1` double(20,2) DEFAULT NULL,
  `cust_double_value_2` double(20,2) DEFAULT NULL,
  `cust_double_value_3` double(20,2) DEFAULT NULL,
  `cust_double_value_4` double(20,2) DEFAULT NULL,
  `cust_double_value_5` double(20,2) DEFAULT NULL,
  `cust_dttm_value_1` timestamp NULL DEFAULT NULL,
  `cust_dttm_value_2` timestamp NULL DEFAULT NULL,
  `cust_dttm_value_3` timestamp NULL DEFAULT NULL,
  `cust_dttm_value_4` timestamp NULL DEFAULT NULL,
  `cust_dttm_value_5` timestamp NULL DEFAULT NULL,
  `cust_string_value_1` varchar(50) DEFAULT NULL,
  `cust_string_value_2` varchar(50) DEFAULT NULL,
  `cust_string_value_3` varchar(50) DEFAULT NULL,
  `cust_string_value_4` varchar(50) DEFAULT NULL,
  `cust_string_value_5` varchar(50) DEFAULT NULL,
  `cust_string_value_6` varchar(50) DEFAULT NULL,
  `cust_string_value_7` varchar(50) DEFAULT NULL,
  `cust_string_value_8` varchar(50) DEFAULT NULL,
  `cust_string_value_9` varchar(50) DEFAULT NULL,
  `cust_string_value_10` varchar(50) DEFAULT NULL,
  `is_flag1_enabled` tinyint(1) DEFAULT NULL,
  `is_flag2_enabled` tinyint(1) DEFAULT NULL,
  `is_flag3_enabled` tinyint(1) DEFAULT NULL,
  `is_flag4_enabled` tinyint(1) DEFAULT NULL,
  `is_flag5_enabled` tinyint(1) DEFAULT NULL,
  `created_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `last_updated_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `created_user_id` int DEFAULT NULL,
  `last_updated_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items`
--

LOCK TABLES `items` WRITE;
/*!40000 ALTER TABLE `items` DISABLE KEYS */;
/*!40000 ALTER TABLE `items` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `literal`
--

DROP TABLE IF EXISTS `literal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `literal` (
  `literal_id` int NOT NULL AUTO_INCREMENT,
  `base_term` varchar(200) DEFAULT NULL,
  `lang_code` varchar(100) DEFAULT 'en',
  `custom_term` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`literal_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `literal`
--

LOCK TABLES `literal` WRITE;
/*!40000 ALTER TABLE `literal` DISABLE KEYS */;
/*!40000 ALTER TABLE `literal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `loads`
--

DROP TABLE IF EXISTS `loads`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `loads` (
  `loads_id` int NOT NULL AUTO_INCREMENT,
  `load_code` int DEFAULT NULL,
  `load_type` varchar(200) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `truck_id` int DEFAULT NULL,
  `awb_nbr` varchar(200) DEFAULT NULL,
  `dock_door_id` int DEFAULT NULL,
  `host_ref_load_number` varchar(200) DEFAULT NULL,
  `ship_via_id` int DEFAULT NULL,
  `total_weight` double DEFAULT NULL,
  `total_volume` double DEFAULT NULL,
  `scheduled_departure_dttm` datetime DEFAULT NULL,
  `scheduled_arrival_dttm` datetime DEFAULT NULL,
  `actual_departure_dttm` datetime DEFAULT NULL,
  `actual_arrival_dttm` datetime DEFAULT NULL,
  `seal_number` varchar(200) DEFAULT NULL,
  `bol_number` varchar(200) DEFAULT NULL,
  `total_number_of_cartons` int DEFAULT NULL,
  `total_number_of_pallets` int DEFAULT NULL,
  `total_number_of_stops` int DEFAULT NULL,
  `next_facility_id` int DEFAULT NULL,
  PRIMARY KEY (`loads_id`),
  KEY `FKc2t5mnf2p0an43c4o84w54dee` (`dock_door_id`),
  KEY `FKjr9rcehcyoorxxtv5yj2pxljx` (`truck_id`),
  CONSTRAINT `fk_loads_dock_door` FOREIGN KEY (`dock_door_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `fk_loads_truck` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`),
  CONSTRAINT `FKc2t5mnf2p0an43c4o84w54dee` FOREIGN KEY (`dock_door_id`) REFERENCES `dock_door` (`dock_door_id`),
  CONSTRAINT `FKjr9rcehcyoorxxtv5yj2pxljx` FOREIGN KEY (`truck_id`) REFERENCES `truck` (`truck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `loads`
--

LOCK TABLES `loads` WRITE;
/*!40000 ALTER TABLE `loads` DISABLE KEYS */;
/*!40000 ALTER TABLE `loads` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `location`
--

DROP TABLE IF EXISTS `location`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `location` (
  `location_id` int NOT NULL AUTO_INCREMENT,
  `location_display_name` varchar(100) NOT NULL,
  `location_barcode` varchar(100) DEFAULT NULL,
  `area` varchar(100) DEFAULT NULL,
  `aisle` varchar(100) DEFAULT NULL,
  `bay` varchar(100) DEFAULT NULL,
  `level` varchar(100) DEFAULT NULL,
  `position` varchar(100) DEFAULT NULL,
  `bin` varchar(100) DEFAULT NULL,
  `alloc_zone_id` int DEFAULT NULL,
  `pick_zone_id` int DEFAULT NULL,
  `drop_zone_id` int DEFAULT NULL,
  `pick_sequence` int DEFAULT NULL,
  `putaway_sequence` int DEFAULT NULL,
  `length` double DEFAULT NULL,
  `width` double DEFAULT NULL,
  `height` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `lwh_uom_id` int DEFAULT NULL,
  `weight` double DEFAULT NULL,
  `weight_uom_id` int DEFAULT NULL,
  `alloc_task_zone_id` int DEFAULT NULL,
  `pick_task_zone_id` int DEFAULT NULL,
  `drop_task_zone_id` int DEFAULT NULL,
  `putaway_task_zone_id` int DEFAULT NULL,
  `replenishment_task_zone_id` int DEFAULT NULL,
  `allow_multi_sku` tinyint(1) DEFAULT NULL,
  `location_type_1_id` int DEFAULT NULL,
  `location_type_2_id` int DEFAULT NULL,
  `location_type_3_id` int DEFAULT NULL,
  `location_type_4_id` int DEFAULT NULL,
  `location_type_5_id` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  `cust_short_value_1` varchar(200) DEFAULT NULL,
  `cust_short_value_2` varchar(200) DEFAULT NULL,
  `cust_short_value_3` varchar(200) DEFAULT NULL,
  `cust_short_value_4` varchar(200) DEFAULT NULL,
  `cust_short_value_5` varchar(200) DEFAULT NULL,
  `cust_dttm_value_1` datetime DEFAULT NULL,
  `cust_dttm_value_2` datetime DEFAULT NULL,
  `cust_dttm_value_3` datetime DEFAULT NULL,
  `cust_string_value_1` varchar(500) DEFAULT NULL,
  `cust_string_value_2` varchar(500) DEFAULT NULL,
  `cust_string_value_3` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`location_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `location`
--

LOCK TABLES `location` WRITE;
/*!40000 ALTER TABLE `location` DISABLE KEYS */;
/*!40000 ALTER TABLE `location` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lock_code`
--

DROP TABLE IF EXISTS `lock_code`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `lock_code` (
  `lock_code_id` int NOT NULL AUTO_INCREMENT,
  `lock_code` varchar(100) DEFAULT NULL,
  `description` varchar(300) DEFAULT NULL,
  `instruction_1` varchar(200) DEFAULT NULL,
  `instruction_2` varchar(200) DEFAULT NULL,
  `instruction_3` varchar(200) DEFAULT NULL,
  `instruction_4` varchar(200) DEFAULT NULL,
  `instruction_5` varchar(200) DEFAULT NULL,
  `on_unloading` tinyint(1) DEFAULT '0',
  `on_receiving` tinyint(1) DEFAULT NULL,
  `on_putaway` tinyint(1) DEFAULT NULL,
  `on_picking` tinyint(1) DEFAULT NULL,
  `on_packing` tinyint(1) DEFAULT NULL,
  `on_sorting` tinyint(1) DEFAULT NULL,
  `on_staging` tinyint(1) DEFAULT NULL,
  `on_shipping` tinyint(1) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT NULL,
  `is_allocatable` tinyint(1) DEFAULT NULL,
  `is_receivable` tinyint(1) DEFAULT NULL,
  `is_movable` tinyint(1) DEFAULT NULL,
  `is_shippable` tinyint(1) DEFAULT NULL,
  `is_deliverable` tinyint(1) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  PRIMARY KEY (`lock_code_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lock_code`
--

LOCK TABLES `lock_code` WRITE;
/*!40000 ALTER TABLE `lock_code` DISABLE KEYS */;
/*!40000 ALTER TABLE `lock_code` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `module`
--

DROP TABLE IF EXISTS `module`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `module` (
  `module_id` int NOT NULL AUTO_INCREMENT,
  `module_name` varchar(100) NOT NULL,
  `parent_module_id` int DEFAULT NULL,
  PRIMARY KEY (`module_id`),
  KEY `module_parent_module_id_module_id_idx` (`parent_module_id`),
  CONSTRAINT `module_parent_module_id_module_id` FOREIGN KEY (`parent_module_id`) REFERENCES `module` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `module`
--

LOCK TABLES `module` WRITE;
/*!40000 ALTER TABLE `module` DISABLE KEYS */;
INSERT INTO `module` VALUES (1,'INBOUND',NULL),(2,'OUTBOUND',NULL),(3,'INVENTORY',NULL),(4,'RECEIVING',1),(5,'PUTAWAY',1),(6,'WAVE MANAGEMENT',2),(7,'PICKING',2),(8,'PACKING',2),(9,'SHIPPING',2),(10,'IB-CONFIGURATIONS',1),(11,'OB-CONFIGURATIONS',2),(12,'INV-CONFIGURATIONS',3),(13,'SETUP',NULL);
/*!40000 ALTER TABLE `module` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `order_detail`
--

DROP TABLE IF EXISTS `order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `order_detail` (
  `order_detail_id` int NOT NULL AUTO_INCREMENT,
  `orders_id` int DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `host_order_detail_ref_nbr` varchar(200) DEFAULT NULL,
  `seq_nbr` varchar(100) DEFAULT NULL,
  `host_seq_nbr` varchar(100) DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `ordered_qty` double DEFAULT NULL,
  `allocated_qty` double DEFAULT NULL,
  `picked_qty` double DEFAULT NULL,
  `packed_qty` double DEFAULT NULL,
  `shipped_qty` double DEFAULT NULL,
  `required_carton_id` int DEFAULT NULL,
  `required_carton_type` varchar(100) DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `req_batch_nbr` varchar(100) DEFAULT NULL,
  `req_carton_attr` varchar(100) DEFAULT NULL,
  `req_pallet_id` int DEFAULT NULL,
  `req_pallet_attr` varchar(100) DEFAULT NULL,
  `req_serial_nbr` varchar(100) DEFAULT NULL,
  `req_vendor_id` int DEFAULT NULL,
  `item_invn_attr_1` varchar(100) DEFAULT NULL,
  `item_invn_attr_2` varchar(100) DEFAULT NULL,
  `item_invn_attr_3` varchar(100) DEFAULT NULL,
  `item_invn_attr_4` varchar(100) DEFAULT NULL,
  `item_invn_attr_5` varchar(100) DEFAULT NULL,
  `item_invn_attr_6` varchar(100) DEFAULT NULL,
  `item_invn_attr_7` varchar(100) DEFAULT NULL,
  `item_invn_attr_8` varchar(100) DEFAULT NULL,
  `item_invn_attr_9` varchar(100) DEFAULT NULL,
  `item_invn_attr_10` varchar(100) DEFAULT NULL,
  `qty` double DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `billing_address_id` int DEFAULT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `ship_via_id` int DEFAULT NULL,
  `carrier_id` int DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `gift_msg` varchar(500) DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `purchase_order_detail_id` int DEFAULT NULL,
  `asn_id` int DEFAULT NULL,
  `asn_detail_id` int DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `is_locked` int DEFAULT NULL,
  `ordered_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `start_ship_date` datetime DEFAULT NULL,
  `stop_ship_date` datetime DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `picking_instruction` varchar(200) DEFAULT NULL,
  `packing_instruction` varchar(200) DEFAULT NULL,
  `shipping_instruction` varchar(200) DEFAULT NULL,
  `delivery_instruction` varchar(200) DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  `picking_location_id` int DEFAULT NULL,
  `packing_location_id` int DEFAULT NULL,
  `sorting_location_id` int DEFAULT NULL,
  `shipping_location_id` int DEFAULT NULL,
  PRIMARY KEY (`order_detail_id`),
  KEY `fk_order_detail_orders` (`orders_id`),
  KEY `fk_order_detail_shipping_address` (`shipping_address_id`),
  KEY `fk_order_detail_purchase_order` (`purchase_order_id`),
  KEY `fk_order_detail_purchase_order_detail` (`purchase_order_detail_id`),
  KEY `fk_order_detail_location_sorting` (`sorting_location_id`),
  KEY `FKbdqp81ss3h4mnj6fsf48skfmv` (`asn_id`),
  KEY `FK4mtf6x2c7w5odicvhy481ype3` (`asn_detail_id`),
  KEY `FK4td81ny96jl323sxiwhxs8530` (`billing_address_id`),
  KEY `FKkefm6js2d9us8ulug8jsy1jnd` (`customer_id`),
  KEY `FKiy5f5mj5mddir4c4rh458w96w` (`item_id`),
  KEY `FKsp8ykny6ra6oe4fparb5k1h18` (`load_id`),
  KEY `FKmm1x7qjsoy7oxl6soejo56u9i` (`shipping_location_id`),
  KEY `FKflxdnm7y87h644t1lyjpu7d55` (`packing_location_id`),
  KEY `FKg28gwvcqc4h71io9o6fwtv5pc` (`picking_location_id`),
  CONSTRAINT `FK4mtf6x2c7w5odicvhy481ype3` FOREIGN KEY (`asn_detail_id`) REFERENCES `asn_detail` (`asn_detail_id`),
  CONSTRAINT `FK4td81ny96jl323sxiwhxs8530` FOREIGN KEY (`billing_address_id`) REFERENCES `billling_address` (`billling_address_id`),
  CONSTRAINT `fk_order_detail_asn` FOREIGN KEY (`asn_id`) REFERENCES `asn` (`asn_id`),
  CONSTRAINT `fk_order_detail_asn_detail` FOREIGN KEY (`asn_detail_id`) REFERENCES `asn_detail` (`asn_detail_id`),
  CONSTRAINT `fk_order_detail_billling_address` FOREIGN KEY (`billing_address_id`) REFERENCES `billling_address` (`billling_address_id`),
  CONSTRAINT `fk_order_detail_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `fk_order_detail_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_order_detail_loads` FOREIGN KEY (`load_id`) REFERENCES `loads` (`loads_id`),
  CONSTRAINT `fk_order_detail_location` FOREIGN KEY (`shipping_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_order_detail_location_packing` FOREIGN KEY (`packing_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_order_detail_location_picking` FOREIGN KEY (`picking_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_order_detail_location_sorting` FOREIGN KEY (`sorting_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `fk_order_detail_orders` FOREIGN KEY (`orders_id`) REFERENCES `orders` (`orders_id`),
  CONSTRAINT `fk_order_detail_purchase_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`purchase_order_id`),
  CONSTRAINT `fk_order_detail_purchase_order_detail` FOREIGN KEY (`purchase_order_detail_id`) REFERENCES `purchase_order_detail` (`purchase_order_detail_id`),
  CONSTRAINT `fk_order_detail_shipping_address` FOREIGN KEY (`shipping_address_id`) REFERENCES `shipping_address` (`shipping_address_id`),
  CONSTRAINT `FKbdqp81ss3h4mnj6fsf48skfmv` FOREIGN KEY (`asn_id`) REFERENCES `asn` (`asn_id`),
  CONSTRAINT `FKflxdnm7y87h644t1lyjpu7d55` FOREIGN KEY (`packing_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FKg28gwvcqc4h71io9o6fwtv5pc` FOREIGN KEY (`picking_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FKiy5f5mj5mddir4c4rh458w96w` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `FKkefm6js2d9us8ulug8jsy1jnd` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`),
  CONSTRAINT `FKmm1x7qjsoy7oxl6soejo56u9i` FOREIGN KEY (`shipping_location_id`) REFERENCES `location` (`location_id`),
  CONSTRAINT `FKsp8ykny6ra6oe4fparb5k1h18` FOREIGN KEY (`load_id`) REFERENCES `loads` (`loads_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `order_detail`
--

LOCK TABLES `order_detail` WRITE;
/*!40000 ALTER TABLE `order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `orders`
--

DROP TABLE IF EXISTS `orders`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `orders` (
  `orders_id` int NOT NULL AUTO_INCREMENT,
  `order_number` varchar(500) DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `host_order_ref_nbr` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `order_type` varchar(100) DEFAULT NULL,
  `destination_facility_id` int DEFAULT NULL,
  `next_facility_id` int DEFAULT NULL,
  `customer_id` int DEFAULT NULL,
  `billing_address_id` int DEFAULT NULL,
  `shipping_address_id` int DEFAULT NULL,
  `ship_via_id` int DEFAULT NULL,
  `carrier_id` int DEFAULT NULL,
  `payment_method` varchar(100) DEFAULT NULL,
  `gift_msg` varchar(1000) DEFAULT NULL,
  `purchase_order_id` int DEFAULT NULL,
  `purchase_order_detail_id` int DEFAULT NULL,
  `asn_id` int DEFAULT NULL,
  `asn_detail_id` int DEFAULT NULL,
  `load_id` int DEFAULT NULL,
  `is_locked` tinyint(1) DEFAULT '0',
  `ordered_date` datetime DEFAULT NULL,
  `created_date` datetime DEFAULT NULL,
  `start_ship_date` datetime DEFAULT NULL,
  `stop_ship_date` datetime DEFAULT NULL,
  `cancelled_date` datetime DEFAULT NULL,
  `picking_instruction` varchar(200) DEFAULT NULL,
  `packing_instruction` varchar(200) DEFAULT NULL,
  `shipping_instruction` varchar(200) DEFAULT NULL,
  `delivery_instruction` varchar(200) DEFAULT NULL,
  `total_items` int NOT NULL,
  `total_qty` double DEFAULT NULL,
  `order_value` double DEFAULT NULL,
  `is_deleted` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`orders_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `orders`
--

LOCK TABLES `orders` WRITE;
/*!40000 ALTER TABLE `orders` DISABLE KEYS */;
/*!40000 ALTER TABLE `orders` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_imt`
--

DROP TABLE IF EXISTS `packing_imt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_imt` (
  `packing_imt_id` int NOT NULL AUTO_INCREMENT,
  `inventory_movement_type_id` int DEFAULT NULL,
  PRIMARY KEY (`packing_imt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_imt`
--

LOCK TABLES `packing_imt` WRITE;
/*!40000 ALTER TABLE `packing_imt` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_imt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_rule`
--

DROP TABLE IF EXISTS `packing_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_rule` (
  `packing_rule_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `packing_imt_list_id` int DEFAULT NULL,
  PRIMARY KEY (`packing_rule_id`),
  UNIQUE KEY `unq_packing_rule_packing_rule_id` (`packing_rule_id`),
  KEY `fk_packing_rule_packing_rule_imt_list` (`packing_imt_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_rule`
--

LOCK TABLES `packing_rule` WRITE;
/*!40000 ALTER TABLE `packing_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `packing_rule_imt_list`
--

DROP TABLE IF EXISTS `packing_rule_imt_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `packing_rule_imt_list` (
  `packing_rule_imt_list_id` int NOT NULL AUTO_INCREMENT,
  `packing_imt_list_id` int DEFAULT NULL,
  `packing_imt_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`packing_rule_imt_list_id`),
  UNIQUE KEY `unq_packing_rule_imt_list_packing_imt_list_id` (`packing_imt_list_id`),
  KEY `fk_packing_rule_imt_list_packing_imt` (`packing_imt_id`),
  CONSTRAINT `fk_packing_rule_imt_list_packing_imt` FOREIGN KEY (`packing_imt_id`) REFERENCES `packing_imt` (`packing_imt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `packing_rule_imt_list`
--

LOCK TABLES `packing_rule_imt_list` WRITE;
/*!40000 ALTER TABLE `packing_rule_imt_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `packing_rule_imt_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page`
--

DROP TABLE IF EXISTS `page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page` (
  `page_id` int NOT NULL AUTO_INCREMENT,
  `page_name` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `created_by` int DEFAULT NULL,
  `updated_at` datetime DEFAULT CURRENT_TIMESTAMP,
  `active` tinyint DEFAULT '1',
  `module_id` int DEFAULT NULL,
  `page_url` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`page_id`),
  KEY `page_module_id_module_module_id_idx` (`module_id`),
  CONSTRAINT `page_module_id_module_module_id` FOREIGN KEY (`module_id`) REFERENCES `module` (`module_id`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='page';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page`
--

LOCK TABLES `page` WRITE;
/*!40000 ALTER TABLE `page` DISABLE KEYS */;
INSERT INTO `page` VALUES (1,'ASN',NULL,1,'2021-07-23 17:25:23',1,1,NULL),(2,'ASN_DETAIL','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(3,'APPOINTMENTs','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(4,'BATCH','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(5,'CARTON','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(6,'CARTON DETAIL','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(7,'COMPANY','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,'company_page'),(8,'CUSTOMERs','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(9,'DOCK','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(10,'DOCK DOORs','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(11,'FACILITY','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,'facility_page'),(12,'GROUPS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(13,'INVENTORY MOVEMENT TYPE','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(14,'INVENTORY','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(15,'INVENTORY DETAIL','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(16,'ITEMS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(17,'LITERAL','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(18,'LOADS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(19,'LOCATIONS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(20,'LOCK CODES','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(21,'OB ORDERS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,2,NULL),(22,'OB ORDER DETAILS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,2,NULL),(23,'PURCHASE ORDERS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(24,'PURCHASE ORDERS DETAILS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(25,'ROLE','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(26,'ROLE GROUPS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(27,'SERIALIZED INVENTORY','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,3,NULL),(28,'TRUCK','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(29,'UOM','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(30,'UOM CONVERSION','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(31,'USERS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,'user_page'),(32,'USER GROUPS','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(33,'USER ROLE','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,13,NULL),(34,'VENDOR','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,1,NULL),(35,'WAVE TEMPLATE','2021-07-23 18:28:30',1,'2021-07-23 18:28:30',1,6,NULL);
/*!40000 ALTER TABLE `page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_action`
--

DROP TABLE IF EXISTS `page_action`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_action` (
  `page_action_id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `action_name` varchar(100) DEFAULT NULL,
  `action_label` varchar(100) DEFAULT NULL,
  `action_url` varchar(100) DEFAULT NULL,
  `param` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`page_action_id`),
  KEY `page_action_page_id_page_page_id_idx` (`page_id`),
  CONSTRAINT `page_action_page_id_page_page_id` FOREIGN KEY (`page_id`) REFERENCES `page` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_action`
--

LOCK TABLES `page_action` WRITE;
/*!40000 ALTER TABLE `page_action` DISABLE KEYS */;
INSERT INTO `page_action` VALUES (8,7,'company_page_read','Read','GET company_page',NULL),(9,7,'company_page_update','Update','PATCH company_page',NULL),(10,7,'company_page_delete','Delete','DELETE company_page',NULL),(11,7,'company_page_create','Add','POST company_page',NULL),(12,11,'facility_page_read','Read','GET facility_page',NULL),(13,11,'facility_page_update','Update','PATCH facility_page',NULL),(14,11,'facility_page_delete','Delete','DELETE facility_page',NULL),(15,11,'facility_page_create','Add','POST facility_page',NULL),(16,31,'user_page_read','Read','GET user_page',NULL),(17,31,'user_page_update','Update','PATCH user_page',NULL),(18,31,'user_page_delete','Delete','DELETE user_page',NULL),(19,31,'user_page_create','Add','POST user_page',NULL);
/*!40000 ALTER TABLE `page_action` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `page_detail`
--

DROP TABLE IF EXISTS `page_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `page_detail` (
  `page_detail_id` int NOT NULL AUTO_INCREMENT,
  `page_id` int NOT NULL,
  `column_name` varchar(100) DEFAULT NULL,
  `is_searchable` tinyint DEFAULT '1',
  `is_sortable` tinyint DEFAULT '1',
  `is_create` tinyint DEFAULT '1',
  `is_mandatory` tinyint DEFAULT '0',
  `countable` tinyint DEFAULT '0',
  `aggregateable` tinyint DEFAULT '0',
  `ref_key` varchar(100) DEFAULT NULL,
  `type` varchar(45) DEFAULT 'Text',
  PRIMARY KEY (`page_detail_id`),
  KEY `page_detail_id_page_id_fk_idx` (`page_id`),
  CONSTRAINT `page_detail_id_page_id_fk` FOREIGN KEY (`page_id`) REFERENCES `page` (`page_id`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `page_detail`
--

LOCK TABLES `page_detail` WRITE;
/*!40000 ALTER TABLE `page_detail` DISABLE KEYS */;
INSERT INTO `page_detail` VALUES (1,7,'Company Code',1,1,1,1,1,0,'company_page.companycode','Text'),(2,7,'Parent Company Code',1,1,1,0,0,0,'company_page.parent_company_code','DropDown'),(3,7,'Company Name',1,1,1,1,0,0,'company_page.companyname','Text'),(4,7,'Company Type',1,1,1,1,0,0,'company_page.companytype','DropDown'),(5,7,'Address 1',1,1,1,0,0,0,'company_page.address1','Text'),(6,7,'Address 2',1,1,1,0,0,0,'company_page.address2','Text'),(7,7,'City',1,1,1,0,0,0,'company_page.city','Text'),(8,7,'Street',1,1,1,0,0,0,'company_page.street','Text'),(9,7,'Zip Code',1,1,1,0,0,0,'company_page.zipcode','Text'),(10,7,'State',1,1,1,0,0,0,'company_page.state','Text'),(11,7,'Country',1,1,1,0,0,0,'company_page.country','Text'),(12,7,'contact',1,1,1,0,0,0,'company_page.contact','Text'),(13,7,'Email',1,1,1,0,0,0,'company_page.email','Text'),(14,7,'Time Zone',1,1,1,0,0,0,'company_page.timezone','Text'),(15,7,'Is Parent Company',1,1,1,0,0,0,'company_page.companycode','Boolean'),(16,7,'Enabled',1,1,1,0,0,0,'company_page.isparentcompany','Boolean'),(17,7,'Default Language',1,1,1,0,0,0,'company_page.default_lang_code','Text'),(18,7,'Created DTTM',1,1,0,0,0,0,'company_page.created_dttm','DTTM'),(19,7,'Updated DTTM',1,1,0,0,0,0,'company_page.updated_dttm','DTTM'),(20,7,'Created By',1,1,0,0,0,0,'company_page.created_by','Text'),(21,7,'Updated By',1,1,0,0,0,0,'company_page.updated_by','Text'),(22,11,'Facility Code',1,1,1,1,1,0,'facility_page.facility_code','Text'),(23,11,'Facility Name',1,1,1,1,0,0,'facility_page.facility_name','Text'),(24,11,'Facility Type',1,1,1,1,0,0,'facility_page.facility_type','DropDown'),(25,11,'Address 1',1,1,1,0,0,0,'facility_page.address1','Text'),(26,11,'Address 2',1,1,1,0,0,0,'facility_page.address2','Text'),(27,11,'City',1,1,1,0,0,0,'facility_page.city','Text'),(28,11,'Street',1,1,1,0,0,0,'facility_page.street','Text'),(29,11,'Zip Code',1,1,1,0,0,0,'facility_page.zipcode','Text'),(30,11,'State',1,1,1,0,0,0,'facility_page.state','Text'),(31,11,'Country',1,1,1,0,0,0,'facility_page.country','Text'),(32,11,'Contact',1,1,1,0,0,0,'facility_page.contact','Text'),(33,11,'Email',1,1,1,0,0,0,'facility_page.email','Text'),(34,11,'TimeZone',1,1,1,0,0,0,'facility_page.timezone','Text'),(35,11,'Company Name',1,1,1,0,0,0,'facility_page.companyname','DropDown'),(36,11,'Enabled',1,1,1,0,0,0,'facility_page.is_enabled','Boolean'),(37,11,'Default Language',1,1,1,0,0,0,'facility_page.default_lang_code','Text'),(38,11,'Created DTTM',1,1,0,0,0,0,'facility_page.created_dttm','DTTM'),(39,11,'Updated DTTM',1,1,0,0,0,0,'facility_page.updated_dttm','DTTM'),(40,11,'Created By',1,1,0,0,0,0,'facility_page.created_by','Text'),(41,11,'Updated By',1,1,0,0,0,0,'facility_page.updated_by','Text'),(42,31,'User Name',1,1,1,1,1,0,'user_page.username','Text'),(43,31,'First Name',1,1,1,1,1,0,'user_page.firstname','Text'),(44,31,'Last Name',1,1,1,0,1,0,'user_page.lastname','Text'),(45,31,'Email',1,1,1,1,1,0,'user_page.email','Text'),(46,31,'Default Group',1,1,1,0,0,0,'user_page.default_group','DropDown'),(47,31,'Time Zone',1,1,1,0,0,0,'user_page.timezone','Text'),(48,31,'Role Name',1,1,1,0,0,0,'user_page.role_name','DropDown'),(49,31,'Created By',1,1,0,0,0,0,'user_page.created_by','Text'),(50,31,'Updated By',1,1,0,0,0,0,'user_page.updated_by','Text'),(51,31,'Created DTTM',1,1,0,0,0,0,'user_page.created_dttm','Text'),(52,31,'Updated DTTM',1,1,0,0,0,0,'user_page.updated_dttm','Text'),(53,31,'Password',0,0,1,0,0,0,'user_page.password','Password'),(54,31,'Validity Period',1,1,1,0,0,0,'user_page.validity_period','Text'),(55,31,'User Type',1,1,1,0,0,0,'user_page.user_type','Text'),(56,31,'Facility Code',1,1,1,0,0,0,'user_page.facility_code','DropDown'),(57,31,'Language',1,1,1,0,0,0,'user_page.lang_code','Text'),(58,31,'Work Area',1,1,1,0,0,0,'user_page.default_workarea_id','Text'),(59,31,'Enabled',1,1,1,0,0,0,'user_page.enabled','Boolean');
/*!40000 ALTER TABLE `page_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `permission`
--

DROP TABLE IF EXISTS `permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `permission` (
  `permission_id` int NOT NULL AUTO_INCREMENT,
  `permission_name` varchar(200) DEFAULT NULL,
  `screen_id` int DEFAULT NULL,
  `can_read` tinyint(1) DEFAULT '1',
  `can_write` tinyint(1) DEFAULT '1',
  `can_delete` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`permission_id`),
  KEY `fk_permission_screen` (`screen_id`),
  CONSTRAINT `fk_permission_screen` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `permission`
--

LOCK TABLES `permission` WRITE;
/*!40000 ALTER TABLE `permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_imt`
--

DROP TABLE IF EXISTS `picking_imt`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picking_imt` (
  `picking_imt_id` int NOT NULL AUTO_INCREMENT,
  `inventory_movement_type_id` int DEFAULT NULL,
  PRIMARY KEY (`picking_imt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_imt`
--

LOCK TABLES `picking_imt` WRITE;
/*!40000 ALTER TABLE `picking_imt` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_imt` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_rule`
--

DROP TABLE IF EXISTS `picking_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picking_rule` (
  `picking_rule_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(100) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `picking_imt_list_id` int DEFAULT NULL,
  PRIMARY KEY (`picking_rule_id`),
  KEY `fk_picking_rule_picking_rule_imt_list` (`picking_imt_list_id`),
  CONSTRAINT `fk_picking_rule_picking_rule_imt_list` FOREIGN KEY (`picking_imt_list_id`) REFERENCES `picking_rule_imt_list` (`picking_imt_list_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_rule`
--

LOCK TABLES `picking_rule` WRITE;
/*!40000 ALTER TABLE `picking_rule` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `picking_rule_imt_list`
--

DROP TABLE IF EXISTS `picking_rule_imt_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `picking_rule_imt_list` (
  `picking_rule_imt_list_id` int NOT NULL AUTO_INCREMENT,
  `picking_imt_list_id` int DEFAULT NULL,
  `picking_imt_id` int DEFAULT NULL,
  `seq_nbr` int DEFAULT NULL,
  PRIMARY KEY (`picking_rule_imt_list_id`),
  UNIQUE KEY `unq_picking_rule_imt_list_picking_imt_list_id` (`picking_imt_list_id`),
  KEY `fk_picking_rule_imt_list_picking_imt` (`picking_imt_id`),
  CONSTRAINT `fk_picking_rule_imt_list_picking_imt` FOREIGN KEY (`picking_imt_id`) REFERENCES `picking_imt` (`picking_imt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `picking_rule_imt_list`
--

LOCK TABLES `picking_rule_imt_list` WRITE;
/*!40000 ALTER TABLE `picking_rule_imt_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `picking_rule_imt_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order`
--

DROP TABLE IF EXISTS `purchase_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order` (
  `purchase_order_id` int NOT NULL AUTO_INCREMENT,
  `po_code` varchar(200) DEFAULT NULL,
  `po_type` varchar(200) DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  `facility_id` int DEFAULT NULL,
  `company_id` int DEFAULT NULL,
  `po_requested_dttm` datetime DEFAULT CURRENT_TIMESTAMP,
  `po_created_dttm` datetime DEFAULT NULL,
  `po_receiving_start_dttm` datetime DEFAULT NULL,
  `po_receiving_end_dttm` datetime DEFAULT NULL,
  `po_cancelled_dttm` datetime DEFAULT NULL,
  `host_po_ref_nbr` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`purchase_order_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order`
--

LOCK TABLES `purchase_order` WRITE;
/*!40000 ALTER TABLE `purchase_order` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `purchase_order_detail`
--

DROP TABLE IF EXISTS `purchase_order_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `purchase_order_detail` (
  `purchase_order_detail_id` int NOT NULL AUTO_INCREMENT,
  `purchase_order_id` int DEFAULT NULL,
  `po_seq_nbr` int DEFAULT NULL,
  `item_id` int DEFAULT NULL,
  `qty` int DEFAULT NULL,
  `uom_id` int DEFAULT NULL,
  `status` varchar(100) DEFAULT NULL,
  `vendor_id` int DEFAULT NULL,
  `ordered_qty` double DEFAULT NULL,
  `received_qty` double DEFAULT NULL,
  `rejected_qty` double DEFAULT NULL,
  `host_po_dtl_ref_nbr` varchar(200) DEFAULT NULL,
  `asn_detail_id` int DEFAULT NULL,
  `order_detail_id` int DEFAULT NULL,
  PRIMARY KEY (`purchase_order_detail_id`),
  KEY `fk_purchase_order_detail_purchase_order` (`purchase_order_id`),
  KEY `fk_purchase_order_detail_items` (`item_id`),
  KEY `fk_purchase_order_detail_asn_detail` (`asn_detail_id`),
  KEY `fk_purchase_order_detail_vendor` (`vendor_id`),
  CONSTRAINT `fk_purchase_order_detail_asn_detail` FOREIGN KEY (`asn_detail_id`) REFERENCES `asn_detail` (`asn_detail_id`),
  CONSTRAINT `fk_purchase_order_detail_items` FOREIGN KEY (`item_id`) REFERENCES `items` (`item_id`),
  CONSTRAINT `fk_purchase_order_detail_purchase_order` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_order` (`purchase_order_id`),
  CONSTRAINT `fk_purchase_order_detail_vendor` FOREIGN KEY (`vendor_id`) REFERENCES `vendor` (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `purchase_order_detail`
--

LOCK TABLES `purchase_order_detail` WRITE;
/*!40000 ALTER TABLE `purchase_order_detail` DISABLE KEYS */;
/*!40000 ALTER TABLE `purchase_order_detail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rf_screen_details`
--

DROP TABLE IF EXISTS `rf_screen_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rf_screen_details` (
  `rf_screen_details_id` int NOT NULL AUTO_INCREMENT,
  `screen_id` int DEFAULT NULL,
  `field_id` int DEFAULT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `field_type` varchar(100) DEFAULT NULL,
  `is_mandatory` tinyint(1) DEFAULT '0',
  `is_validate` tinyint(1) DEFAULT '0',
  `is_repeat` tinyint(1) DEFAULT '1',
  `repeating_fields` varchar(100) DEFAULT NULL,
  `repeatcount` int DEFAULT NULL,
  `page` int DEFAULT NULL,
  `db_update` date DEFAULT NULL,
  PRIMARY KEY (`rf_screen_details_id`),
  KEY `fk_rf_screen_details_screen` (`screen_id`),
  CONSTRAINT `fk_rf_screen_details_screen` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rf_screen_details`
--

LOCK TABLES `rf_screen_details` WRITE;
/*!40000 ALTER TABLE `rf_screen_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `rf_screen_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role`
--

DROP TABLE IF EXISTS `role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role` (
  `role_id` int NOT NULL AUTO_INCREMENT,
  `role_name` varchar(100) NOT NULL,
  PRIMARY KEY (`role_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role`
--

LOCK TABLES `role` WRITE;
/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` VALUES (1,'ADMIN'),(2,'SUPERVISOR'),(3,'MANAGEMENT'),(4,'EMPLOYEE'),(5,'GUEST');
/*!40000 ALTER TABLE `role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_groups`
--

DROP TABLE IF EXISTS `role_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `role_groups` (
  `role_group_id` int NOT NULL AUTO_INCREMENT,
  `role_id` int NOT NULL,
  `groups_id` int NOT NULL,
  PRIMARY KEY (`role_group_id`),
  KEY `fk_role_groups_role` (`role_id`),
  KEY `fk_role_groups_groups` (`groups_id`),
  CONSTRAINT `fk_role_groups_groups` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`groups_id`),
  CONSTRAINT `fk_role_groups_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_groups`
--

LOCK TABLES `role_groups` WRITE;
/*!40000 ALTER TABLE `role_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `screen`
--

DROP TABLE IF EXISTS `screen`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `screen` (
  `screen_id` int NOT NULL AUTO_INCREMENT,
  `screen_name` varchar(200) NOT NULL,
  `screen_type` varchar(100) DEFAULT NULL,
  `parent_screen_id` int DEFAULT NULL,
  `screen_desc` varchar(500) DEFAULT NULL,
  PRIMARY KEY (`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `screen`
--

LOCK TABLES `screen` WRITE;
/*!40000 ALTER TABLE `screen` DISABLE KEYS */;
/*!40000 ALTER TABLE `screen` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `serialized_inventory`
--

DROP TABLE IF EXISTS `serialized_inventory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `serialized_inventory` (
  `serialized_inventory_id` int NOT NULL AUTO_INCREMENT,
  `status` varchar(100) DEFAULT NULL,
  `inventory_detail_id` int DEFAULT NULL,
  `carton_detail_id` int DEFAULT NULL,
  `serial_number_1` varchar(100) DEFAULT NULL,
  `serial_number_2` varchar(100) DEFAULT NULL,
  `serial_number_3` varchar(100) DEFAULT NULL,
  `serial_number_4` varchar(100) DEFAULT NULL,
  `serial_number_5` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`serialized_inventory_id`),
  KEY `fk_serialized_inventory_inventory_detail` (`inventory_detail_id`),
  KEY `fk_serialized_inventory_carton_detail` (`carton_detail_id`),
  CONSTRAINT `fk_serialized_inventory_carton_detail` FOREIGN KEY (`carton_detail_id`) REFERENCES `carton_detail` (`carton_detail_id`),
  CONSTRAINT `fk_serialized_inventory_inventory_detail` FOREIGN KEY (`inventory_detail_id`) REFERENCES `inventory_detail` (`inventory_detail_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `serialized_inventory`
--

LOCK TABLES `serialized_inventory` WRITE;
/*!40000 ALTER TABLE `serialized_inventory` DISABLE KEYS */;
/*!40000 ALTER TABLE `serialized_inventory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `shipping_address`
--

DROP TABLE IF EXISTS `shipping_address`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `shipping_address` (
  `shipping_address_id` int NOT NULL AUTO_INCREMENT,
  `customer_id` int DEFAULT NULL,
  `name` varchar(500) DEFAULT NULL,
  `address1` varchar(500) DEFAULT NULL,
  `address2` varchar(500) DEFAULT NULL,
  `street` varchar(500) DEFAULT NULL,
  `city` varchar(100) DEFAULT NULL,
  `zip` varchar(100) DEFAULT NULL,
  `state` varchar(200) DEFAULT NULL,
  `country` varchar(100) DEFAULT NULL,
  `phone` varchar(100) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `alternate_phone` varchar(100) DEFAULT NULL,
  `alternate_email` varchar(500) DEFAULT NULL,
  `preferred_delivery_time` datetime DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT '1',
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`shipping_address_id`),
  KEY `fk_shipping_address_customer` (`customer_id`),
  CONSTRAINT `fk_shipping_address_customer` FOREIGN KEY (`customer_id`) REFERENCES `customer` (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `shipping_address`
--

LOCK TABLES `shipping_address` WRITE;
/*!40000 ALTER TABLE `shipping_address` DISABLE KEYS */;
/*!40000 ALTER TABLE `shipping_address` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `truck`
--

DROP TABLE IF EXISTS `truck`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `truck` (
  `truck_id` int NOT NULL AUTO_INCREMENT,
  `truck_code` varchar(200) DEFAULT NULL,
  `tractor_id` int DEFAULT NULL,
  `trailer_id` int DEFAULT NULL,
  `status` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`truck_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `truck`
--

LOCK TABLES `truck` WRITE;
/*!40000 ALTER TABLE `truck` DISABLE KEYS */;
/*!40000 ALTER TABLE `truck` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ui_screen_details`
--

DROP TABLE IF EXISTS `ui_screen_details`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ui_screen_details` (
  `ui_screen_details_id` int NOT NULL AUTO_INCREMENT,
  `field_id` int DEFAULT NULL,
  `field_label` varchar(200) DEFAULT NULL,
  `field_value` varchar(200) DEFAULT NULL,
  `field_type` varchar(100) DEFAULT NULL,
  `is_mandatory` tinyint(1) DEFAULT NULL,
  `can_edit` tinyint(1) DEFAULT '1',
  `can_view` tinyint(1) DEFAULT '1',
  `child_screen_id` int DEFAULT NULL,
  `screen_id` int NOT NULL,
  PRIMARY KEY (`ui_screen_details_id`),
  KEY `fk_ui_screen_details_screen` (`child_screen_id`),
  KEY `fk_ui_screen_details_screen_0` (`screen_id`),
  CONSTRAINT `fk_ui_screen_details_screen` FOREIGN KEY (`child_screen_id`) REFERENCES `screen` (`screen_id`),
  CONSTRAINT `fk_ui_screen_details_screen_0` FOREIGN KEY (`screen_id`) REFERENCES `screen` (`screen_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='Details of UI screen';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ui_screen_details`
--

LOCK TABLES `ui_screen_details` WRITE;
/*!40000 ALTER TABLE `ui_screen_details` DISABLE KEYS */;
/*!40000 ALTER TABLE `ui_screen_details` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom`
--

DROP TABLE IF EXISTS `uom`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom` (
  `uom_id` int NOT NULL AUTO_INCREMENT,
  `uom_code` varchar(100) DEFAULT NULL,
  `description` varchar(400) DEFAULT NULL,
  PRIMARY KEY (`uom_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom`
--

LOCK TABLES `uom` WRITE;
/*!40000 ALTER TABLE `uom` DISABLE KEYS */;
INSERT INTO `uom` VALUES (1,'kg','Kilogram'),(3,'gm','grams');
/*!40000 ALTER TABLE `uom` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `uom_conversion`
--

DROP TABLE IF EXISTS `uom_conversion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `uom_conversion` (
  `uom_conversion_id` int NOT NULL AUTO_INCREMENT,
  `from_uom_id` int DEFAULT NULL,
  `to_uom_id` int DEFAULT NULL,
  `conversion_operator` varchar(100) DEFAULT NULL,
  `conversion_factor` double DEFAULT NULL,
  PRIMARY KEY (`uom_conversion_id`),
  KEY `fk_uom_conversion_uom_from` (`from_uom_id`),
  KEY `fk_uom_conversion_uom_to` (`to_uom_id`),
  CONSTRAINT `fk_uom_conversion_uom_from` FOREIGN KEY (`from_uom_id`) REFERENCES `uom` (`uom_id`),
  CONSTRAINT `fk_uom_conversion_uom_to` FOREIGN KEY (`to_uom_id`) REFERENCES `uom` (`uom_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `uom_conversion`
--

LOCK TABLES `uom_conversion` WRITE;
/*!40000 ALTER TABLE `uom_conversion` DISABLE KEYS */;
/*!40000 ALTER TABLE `uom_conversion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user` (
  `user_id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `firstname` varchar(30) NOT NULL,
  `lastname` varchar(30) DEFAULT NULL,
  `email` varchar(50) DEFAULT NULL,
  `default_group_id` int DEFAULT NULL,
  `timezone` varchar(30) DEFAULT NULL,
  `role_id` int DEFAULT NULL,
  `created_by` int DEFAULT NULL,
  `updated_by` int DEFAULT NULL,
  `created_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_dttm` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `password` varchar(100) NOT NULL,
  `validity_period` int DEFAULT NULL,
  `user_type` varchar(30) DEFAULT NULL,
  `default_facility_id` int DEFAULT NULL,
  `default_company_id` int DEFAULT NULL,
  `lang_code` varchar(4) DEFAULT NULL,
  `default_workarea_id` int DEFAULT NULL,
  `enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES (1,'SYSTEM','SYSTEM',NULL,NULL,4,'IST',1,2,NULL,'2021-07-23 11:51:54','2021-07-23 11:51:54','twms',NULL,NULL,NULL,NULL,NULL,NULL,1),(2,'SUPERADMIN','SUPER','ADMIN',NULL,4,'IST',1,2,NULL,'2021-07-23 14:06:00','2021-07-23 14:06:00','twms',NULL,NULL,NULL,NULL,NULL,NULL,1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_groups`
--

DROP TABLE IF EXISTS `user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_groups` (
  `user_groups_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `groups_id` int NOT NULL,
  PRIMARY KEY (`user_groups_id`),
  KEY `fk_user_groups_groups` (`groups_id`),
  CONSTRAINT `fk_user_groups_groups` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`groups_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_groups`
--

LOCK TABLES `user_groups` WRITE;
/*!40000 ALTER TABLE `user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `user_page`
--

DROP TABLE IF EXISTS `user_page`;
/*!50001 DROP VIEW IF EXISTS `user_page`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `user_page` AS SELECT 
 1 AS `username`,
 1 AS `firstname`,
 1 AS `lastname`,
 1 AS `email`,
 1 AS `default_group`,
 1 AS `timezone`,
 1 AS `role_name`,
 1 AS `created_by`,
 1 AS `updated_by`,
 1 AS `created_dttm`,
 1 AS `updated_dttm`,
 1 AS `password`,
 1 AS `validity_period`,
 1 AS `user_type`,
 1 AS `facility_code`,
 1 AS `lang_code`,
 1 AS `default_workarea_id`,
 1 AS `enabled`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `user_role`
--

DROP TABLE IF EXISTS `user_role`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_role` (
  `user_role_id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `role_id` int NOT NULL,
  PRIMARY KEY (`user_role_id`),
  KEY `fk_user_role_role` (`role_id`),
  CONSTRAINT `fk_user_role_role` FOREIGN KEY (`role_id`) REFERENCES `role` (`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role`
--

LOCK TABLES `user_role` WRITE;
/*!40000 ALTER TABLE `user_role` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendor`
--

DROP TABLE IF EXISTS `vendor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendor` (
  `vendor_id` int NOT NULL AUTO_INCREMENT,
  `vendor_name` varchar(100) DEFAULT NULL,
  `vendor_code` varchar(100) DEFAULT NULL,
  `address_line1` varchar(200) DEFAULT NULL,
  `address_line2` varchar(500) DEFAULT NULL,
  `city` varchar(500) DEFAULT NULL,
  `zipcode` varchar(100) DEFAULT NULL,
  `state` varchar(100) DEFAULT NULL,
  `country` varchar(200) DEFAULT NULL,
  `contact` varchar(100) DEFAULT NULL,
  `email` varchar(500) DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`vendor_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendor`
--

LOCK TABLES `vendor` WRITE;
/*!40000 ALTER TABLE `vendor` DISABLE KEYS */;
/*!40000 ALTER TABLE `vendor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wave_template`
--

DROP TABLE IF EXISTS `wave_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wave_template` (
  `wave_template_id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(200) DEFAULT NULL,
  `name` varchar(200) DEFAULT NULL,
  `description` varchar(500) DEFAULT NULL,
  `allocation_rule_id` int DEFAULT NULL,
  `picking_rule_id` int DEFAULT NULL,
  `packing_rule_id` int DEFAULT NULL,
  `cubing_rule_id` int DEFAULT NULL,
  `shipping_rule_id` int DEFAULT NULL,
  `is_enabled` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`wave_template_id`),
  KEY `fk_wave_template_allocation_rule` (`allocation_rule_id`),
  KEY `fk_wave_template_picking_rule` (`picking_rule_id`),
  KEY `fk_wave_template_packing_rule_0` (`packing_rule_id`),
  CONSTRAINT `fk_wave_template_allocation_rule` FOREIGN KEY (`allocation_rule_id`) REFERENCES `allocation_rule` (`allocation_rule_id`),
  CONSTRAINT `fk_wave_template_packing_rule_0` FOREIGN KEY (`packing_rule_id`) REFERENCES `packing_rule` (`packing_rule_id`),
  CONSTRAINT `fk_wave_template_picking_rule` FOREIGN KEY (`picking_rule_id`) REFERENCES `picking_rule` (`picking_rule_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wave_template`
--

LOCK TABLES `wave_template` WRITE;
/*!40000 ALTER TABLE `wave_template` DISABLE KEYS */;
/*!40000 ALTER TABLE `wave_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `company_page`
--

/*!50001 DROP VIEW IF EXISTS `company_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`twms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `company_page` AS select `c`.`companycode` AS `companycode`,`pc`.`companycode` AS `parent_company_code`,`c`.`companyname` AS `companyname`,`c`.`companytype` AS `companytype`,`c`.`address1` AS `address1`,`c`.`address2` AS `address2`,`c`.`city` AS `city`,`c`.`street` AS `street`,`c`.`zipcode` AS `zipcode`,`c`.`state` AS `state`,`c`.`country` AS `country`,`c`.`contact` AS `contact`,`c`.`email` AS `email`,`c`.`timezone` AS `timezone`,`c`.`isparentcompany` AS `isparentcompany`,`c`.`is_enabled` AS `is_enabled`,`c`.`default_lang_code` AS `default_lang_code`,`c`.`created_dttm` AS `created_dttm`,`c`.`last_updated_dttm` AS `last_updated_dttm`,`u1`.`username` AS `created_by`,`u2`.`username` AS `updated_by` from (((`company` `c` join `company` `pc` on((`c`.`company_id` = `pc`.`parent_company_id`))) left join `user` `u1` on((`c`.`created_user` = `u1`.`user_id`))) left join `user` `u2` on((`c`.`last_updated_user` = `u2`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `facility_page`
--

/*!50001 DROP VIEW IF EXISTS `facility_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`twms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `facility_page` AS select `f`.`facility_code` AS `facility_code`,`f`.`facility_name` AS `facility_name`,`f`.`facility_type` AS `facility_type`,`f`.`Address1` AS `address1`,`f`.`Address2` AS `address2`,`f`.`City` AS `city`,`f`.`Street` AS `street`,`f`.`ZipCode` AS `zipcode`,`f`.`State` AS `state`,`f`.`Country` AS `country`,`f`.`Contact` AS `contact`,`f`.`Email` AS `email`,`f`.`TimeZone` AS `timezone`,`c`.`companyname` AS `companyname`,`f`.`is_enabled` AS `is_enabled`,`f`.`default_lang_code` AS `default_lang_code`,`f`.`created_dttm` AS `created_dttm`,`f`.`last_updated_dttm` AS `last_updated_dttm`,`u1`.`username` AS `created_by`,`u2`.`username` AS `updated_by` from (((`facility` `f` left join `company` `c` on((`f`.`Parent_Company_id` = `c`.`company_id`))) left join `user` `u1` on((`f`.`created_user` = `u1`.`user_id`))) left join `user` `u2` on((`f`.`last_updated_user` = `u2`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `user_page`
--

/*!50001 DROP VIEW IF EXISTS `user_page`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`twms`@`%` SQL SECURITY DEFINER */
/*!50001 VIEW `user_page` AS select `u`.`username` AS `username`,`u`.`firstname` AS `firstname`,`u`.`lastname` AS `lastname`,`u`.`email` AS `email`,`g`.`group_name` AS `default_group`,`u`.`timezone` AS `timezone`,`r`.`role_name` AS `role_name`,`u1`.`username` AS `created_by`,`u2`.`username` AS `updated_by`,`u`.`created_dttm` AS `created_dttm`,`u`.`updated_dttm` AS `updated_dttm`,`u`.`password` AS `password`,`u`.`validity_period` AS `validity_period`,`u`.`user_type` AS `user_type`,`f`.`facility_code` AS `facility_code`,`u`.`lang_code` AS `lang_code`,`u`.`default_workarea_id` AS `default_workarea_id`,`u`.`enabled` AS `enabled` from ((((((`user` `u` left join `groups` `g` on((`u`.`default_group_id` = `g`.`groups_id`))) left join `role` `r` on((`u`.`role_id` = `r`.`role_id`))) left join `facility` `f` on((`u`.`default_facility_id` = `f`.`facility_id`))) left join `company` `c` on((`u`.`default_company_id` = `c`.`company_id`))) left join `user` `u1` on((`u`.`created_by` = `u1`.`user_id`))) left join `user` `u2` on((`u`.`updated_by` = `u2`.`user_id`))) */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-07-24 20:57:16
