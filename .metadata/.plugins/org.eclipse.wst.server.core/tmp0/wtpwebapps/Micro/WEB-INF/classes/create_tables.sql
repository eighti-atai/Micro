-- MySQL dump 10.13  Distrib 5.7.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: micro
-- ------------------------------------------------------
-- Server version	5.5.5-10.1.19-MariaDB

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
-- Table structure for table `address_tab`
--

DROP TABLE IF EXISTS `address_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `address_tab` (
  `address_id` int(12) NOT NULL AUTO_INCREMENT,
  `street` varchar(100) NOT NULL,
  `city` varchar(100) NOT NULL,
  `country` varchar(100) DEFAULT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`address_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `address_tab`
--

LOCK TABLES `address_tab` WRITE;
/*!40000 ALTER TABLE `address_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `address_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `appointment_tab`
--

DROP TABLE IF EXISTS `appointment_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `appointment_tab` (
  `appointment_id` int(11) NOT NULL,
  `patient_id` int(11) NOT NULL,
  `appointment_date` date NOT NULL,
  `appointment_time` time NOT NULL,
  `appointment_end_time` time DEFAULT NULL,
  `doctor` bigint(20) NOT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`appointment_id`,`patient_id`),
  KEY `patient_idFK` (`patient_id`),
  KEY `user_idFK_idx` (`doctor`),
  CONSTRAINT `patient_idFK` FOREIGN KEY (`patient_id`) REFERENCES `patient_tab` (`patient_id`),
  CONSTRAINT `user_idFK` FOREIGN KEY (`doctor`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `appointment_tab`
--

LOCK TABLES `appointment_tab` WRITE;
/*!40000 ALTER TABLE `appointment_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `appointment_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `attend_patient_tab`
--

DROP TABLE IF EXISTS `attend_patient_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attend_patient_tab` (
  `attend_patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `start_time` varchar(10) NOT NULL,
  `doctor` bigint(20) NOT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`attend_patient_id`,`patient_id`),
  KEY `patient_idAPTFK_idx` (`patient_id`),
  KEY `user_idAPTFK_idx` (`doctor`),
  CONSTRAINT `patient_idAPTFK` FOREIGN KEY (`patient_id`) REFERENCES `patient_tab` (`patient_id`),
  CONSTRAINT `user_idAPTFK` FOREIGN KEY (`doctor`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attend_patient_tab`
--

LOCK TABLES `attend_patient_tab` WRITE;
/*!40000 ALTER TABLE `attend_patient_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `attend_patient_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `customer_tab`
--

DROP TABLE IF EXISTS `customer_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `customer_tab` (
  `customer_id` varchar(5) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `nic` varchar(15) DEFAULT NULL,
  `address_id` int(12) DEFAULT NULL,
  `phone_no_1` varchar(15) DEFAULT NULL,
  `phone_no_2` varchar(15) DEFAULT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`customer_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `customer_tab`
--

LOCK TABLES `customer_tab` WRITE;
/*!40000 ALTER TABLE `customer_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `customer_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `main_treatment_type_tab`
--

DROP TABLE IF EXISTS `main_treatment_type_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `main_treatment_type_tab` (
  `mtt_id` varchar(20) NOT NULL,
  `mtt_name` varchar(100) DEFAULT NULL,
  `mtt_description` varchar(1000) DEFAULT NULL,
  `objid` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`mtt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `main_treatment_type_tab`
--

LOCK TABLES `main_treatment_type_tab` WRITE;
/*!40000 ALTER TABLE `main_treatment_type_tab` DISABLE KEYS */;
INSERT INTO `main_treatment_type_tab` VALUES ('1','1','1','com.atai.micro.module.trment.model.MainTreatmentType@5073368d'),('AAAA','aaaaa','eeeeeee','com.atai.micro.module.trment.model.MainTreatmentType@6542ca0a');
/*!40000 ALTER TABLE `main_treatment_type_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `patient_tab`
--

DROP TABLE IF EXISTS `patient_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `patient_tab` (
  `patient_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_name` varchar(200) NOT NULL,
  `patient_address` varchar(1000) DEFAULT NULL,
  `patient_id_no` varchar(10) DEFAULT NULL,
  `patient_birth_date` date DEFAULT NULL,
  `patient_contact_no` varchar(10) DEFAULT NULL,
  `patient_gender` varchar(6) DEFAULT NULL,
  `objid` varchar(20000) DEFAULT NULL,
  PRIMARY KEY (`patient_id`)
) ENGINE=InnoDB AUTO_INCREMENT=197 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `patient_tab`
--

LOCK TABLES `patient_tab` WRITE;
/*!40000 ALTER TABLE `patient_tab` DISABLE KEYS */;
INSERT INTO `patient_tab` VALUES (195,'a','','','2017-01-23','','','com.atai.micro.module.enterp.model.Patient@435eefc9'),(196,'b','','',NULL,'','','com.atai.micro.module.enterp.model.Patient@76bd7216');
/*!40000 ALTER TABLE `patient_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `payment_tab`
--

DROP TABLE IF EXISTS `payment_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `payment_tab` (
  `payment_no` int(20) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `treatment_id` int(11) NOT NULL,
  `payment_date` date NOT NULL,
  `payment_type` varchar(10) NOT NULL,
  `payment_method` varchar(10) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `cheque_no` varchar(20) DEFAULT NULL,
  `cheque_exp_date` date DEFAULT NULL,
  `cheque_bank` varchar(20) DEFAULT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`payment_no`,`patient_id`,`treatment_id`),
  KEY `patient_idPFK_idx` (`patient_id`),
  KEY `treatment_idPFK_idx` (`treatment_id`),
  CONSTRAINT `patient_idPFK` FOREIGN KEY (`patient_id`) REFERENCES `patient_tab` (`patient_id`),
  CONSTRAINT `treatment_idPFK` FOREIGN KEY (`treatment_id`) REFERENCES `treatment_tab` (`treatment_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `payment_tab`
--

LOCK TABLES `payment_tab` WRITE;
/*!40000 ALTER TABLE `payment_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `payment_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `role_tab`
--

DROP TABLE IF EXISTS `role_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `role_tab` (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`role_id`),
  UNIQUE KEY `role_name` (`role_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `role_tab`
--

LOCK TABLES `role_tab` WRITE;
/*!40000 ALTER TABLE `role_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `role_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sub_treatment_type_tab`
--

DROP TABLE IF EXISTS `sub_treatment_type_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sub_treatment_type_tab` (
  `stt_id` varchar(20) NOT NULL,
  `mtt_id` varchar(20) NOT NULL,
  `stt_name` varchar(100) DEFAULT NULL,
  `stt_amount` decimal(10,2) NOT NULL,
  `objid` varchar(1000) NOT NULL,
  PRIMARY KEY (`stt_id`,`mtt_id`),
  KEY `mtt_idFK` (`mtt_id`),
  CONSTRAINT `mtt_idFK` FOREIGN KEY (`mtt_id`) REFERENCES `main_treatment_type_tab` (`mtt_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sub_treatment_type_tab`
--

LOCK TABLES `sub_treatment_type_tab` WRITE;
/*!40000 ALTER TABLE `sub_treatment_type_tab` DISABLE KEYS */;
INSERT INTO `sub_treatment_type_tab` VALUES ('1','1','1',100000.00,'com.atai.micro.module.trment.model.SubTreatmentType@17f8aaed');
/*!40000 ALTER TABLE `sub_treatment_type_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `treatment_tab`
--

DROP TABLE IF EXISTS `treatment_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `treatment_tab` (
  `treatment_id` int(11) NOT NULL AUTO_INCREMENT,
  `patient_id` int(11) NOT NULL,
  `treatment_main_type` varchar(20) NOT NULL,
  `treatment_sub_type` varchar(20) NOT NULL,
  `treatment_desc` varchar(2000) DEFAULT NULL,
  `treatment_image` longblob,
  `treatment_amount` decimal(10,2) DEFAULT NULL,
  `treatment_discount` decimal(10,2) DEFAULT NULL,
  `treatment_total` decimal(10,2) DEFAULT NULL,
  `treatment_paid` decimal(10,2) DEFAULT NULL,
  `treatment_stat` varchar(20) DEFAULT NULL,
  `treatment_paid_stat` varchar(20) DEFAULT NULL,
  `treatment_date` date DEFAULT NULL,
  `treatment_doctor` bigint(20) DEFAULT NULL,
  `objid` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`treatment_id`,`patient_id`),
  KEY `patient_idTTFK_idx` (`patient_id`),
  KEY `mtt_idTTFK_idx` (`treatment_main_type`),
  KEY `stt_idTTFK_idx` (`treatment_sub_type`),
  KEY `user_idTTFK_idx` (`treatment_doctor`),
  CONSTRAINT `mtt_idTTFK` FOREIGN KEY (`treatment_main_type`) REFERENCES `main_treatment_type_tab` (`mtt_id`),
  CONSTRAINT `patient_idTTFK` FOREIGN KEY (`patient_id`) REFERENCES `patient_tab` (`patient_id`),
  CONSTRAINT `stt_idTTFK` FOREIGN KEY (`treatment_sub_type`) REFERENCES `sub_treatment_type_tab` (`stt_id`),
  CONSTRAINT `user_idTTFK` FOREIGN KEY (`treatment_doctor`) REFERENCES `user_tab` (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `treatment_tab`
--

LOCK TABLES `treatment_tab` WRITE;
/*!40000 ALTER TABLE `treatment_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `treatment_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_role_tab`
--

DROP TABLE IF EXISTS `user_role_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_role_tab` (
  `user_id` bigint(20) NOT NULL,
  `role_id` bigint(20) NOT NULL,
  PRIMARY KEY (`user_id`,`role_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_role_tab`
--

LOCK TABLES `user_role_tab` WRITE;
/*!40000 ALTER TABLE `user_role_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_role_tab` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_tab`
--

DROP TABLE IF EXISTS `user_tab`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_tab` (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `password` varchar(100) NOT NULL,
  `state` varchar(30) NOT NULL,
  PRIMARY KEY (`user_id`),
  UNIQUE KEY `user_name` (`user_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_tab`
--

LOCK TABLES `user_tab` WRITE;
/*!40000 ALTER TABLE `user_tab` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_tab` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-02-03 16:27:06
