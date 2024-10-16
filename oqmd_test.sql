CREATE DATABASE  IF NOT EXISTS `oqmd_test` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `oqmd_test`;
-- MySQL dump 10.13  Distrib 8.0.34, for Win64 (x86_64)
--
-- Host: localhost    Database: oqmd_test
-- ------------------------------------------------------
-- Server version	8.0.34

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
-- Table structure for table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `accounts` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `host_id` varchar(63) NOT NULL,
  `username` varchar(255) NOT NULL,
  `run_path` longtext NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `accounts_6340c63c` (`user_id`),
  KEY `accounts_27f00f5d` (`host_id`),
  CONSTRAINT `host_id_refs_name_423a8d77` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`name`),
  CONSTRAINT `user_id_refs_id_871ce8ee` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=187 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `accounts`
--

LOCK TABLES `accounts` WRITE;
/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocations`
--

DROP TABLE IF EXISTS `allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocations` (
  `name` varchar(63) NOT NULL,
  `key` varchar(100) NOT NULL,
  `host_id` varchar(63) NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`name`),
  KEY `allocations_27f00f5d` (`host_id`),
  CONSTRAINT `host_id_refs_name_e06366be` FOREIGN KEY (`host_id`) REFERENCES `hosts` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocations`
--

LOCK TABLES `allocations` WRITE;
/*!40000 ALTER TABLE `allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `allocations_users`
--

DROP TABLE IF EXISTS `allocations_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `allocations_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `allocation_id` varchar(63) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `allocation_id` (`allocation_id`,`user_id`),
  KEY `allocations_users_427ae6a3` (`allocation_id`),
  KEY `allocations_users_6340c63c` (`user_id`),
  CONSTRAINT `allocation_id_refs_name_c168cd43` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`name`),
  CONSTRAINT `user_id_refs_id_bc968769` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `allocations_users`
--

LOCK TABLES `allocations_users` WRITE;
/*!40000 ALTER TABLE `allocations_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `allocations_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `atoms`
--

DROP TABLE IF EXISTS `atoms`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `atoms` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int DEFAULT NULL,
  `site_id` int DEFAULT NULL,
  `element_id` varchar(9) DEFAULT NULL,
  `ox` int DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `fx` double DEFAULT NULL,
  `fy` double DEFAULT NULL,
  `fz` double DEFAULT NULL,
  `magmom` double DEFAULT NULL,
  `charge` double DEFAULT NULL,
  `volume` double DEFAULT NULL,
  `occupancy` double NOT NULL,
  `wyckoff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `atoms_95d4059a` (`structure_id`),
  KEY `atoms_99732b5c` (`site_id`),
  KEY `atoms_00a8885a` (`element_id`),
  KEY `atoms_93c9467c` (`wyckoff_id`),
  CONSTRAINT `element_id_refs_symbol_17f739bb` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `site_id_refs_id_5614a168` FOREIGN KEY (`site_id`) REFERENCES `sites` (`id`),
  CONSTRAINT `structure_id_refs_id_203b48ec` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`),
  CONSTRAINT `wyckoff_id_refs_id_6960b1bb` FOREIGN KEY (`wyckoff_id`) REFERENCES `wyckoffsites` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=111074189 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `atoms`
--

LOCK TABLES `atoms` WRITE;
/*!40000 ALTER TABLE `atoms` DISABLE KEYS */;
INSERT INTO `atoms` VALUES (1037851,81274,18732103,'Ca',NULL,0.500001203963955,0.500001203963955,0.500001203963955,0,0,0,0,6.838,NULL,1,NULL),(1037852,81274,18732104,'O',NULL,0.500001203963955,0,0,0,0,0,0,5.109,NULL,1,NULL),(1037853,81274,18732105,'O',NULL,0,0.500001203963955,0,0,0,0,0,5.259,NULL,1,NULL),(1037854,81274,18732106,'O',NULL,0,0,0.500001203963955,0,0,0,0,5.449,NULL,1,NULL),(1037855,81274,18732107,'Ti',NULL,0,0,0,0,0,0,0,5.359,NULL,1,NULL),(1037861,81276,18732076,'Ca',NULL,0.5,0.5,0.5,0,0,0,0,6.736,NULL,1,NULL),(1037862,81276,18732077,'O',NULL,0.5,0,0,0,0,0,0,5.095,NULL,1,NULL),(1037863,81276,18732078,'O',NULL,0,0.5,0,0,0,0,0,5.25,NULL,1,NULL),(1037864,81276,18732079,'O',NULL,0,0,0.5,0,0,0,0,5.441,NULL,1,NULL),(1037865,81276,18732080,'Ti',NULL,0,0,0,0,0,0,0,4.927,NULL,1,NULL),(1037871,81278,18732094,'Ca',NULL,0.499999937353159,0.499999937353159,0.499999937353159,0,0,0,0,6.688,NULL,1,NULL),(1037872,81278,18732095,'O',NULL,0.499999937353159,0,0,0,0,0,0,4.951,NULL,1,NULL),(1037873,81278,18732096,'O',NULL,0,0.499999937353159,0,0,0,0,0,5.109,NULL,1,NULL),(1037874,81278,18732097,'O',NULL,0,0,0.499999937353159,0,0,0,0,5.3,NULL,1,NULL),(1037875,81278,18732098,'Ti',NULL,0,0,0,0,0,0,0,4.708,NULL,1,NULL);
/*!40000 ALTER TABLE `atoms` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `auth_group`
--

DROP TABLE IF EXISTS `auth_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group` (
  `id` int NOT NULL AUTO_INCREMENT,
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_group_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `group_id` (`group_id`,`permission_id`),
  KEY `auth_group_permissions_5f412f9a` (`group_id`),
  KEY `auth_group_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `group_id_refs_id_f4b32aac` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `permission_id_refs_id_6ba0f519` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
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
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `auth_permission` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `content_type_id` (`content_type_id`,`codename`),
  KEY `auth_permission_37ef4eb4` (`content_type_id`),
  CONSTRAINT `content_type_id_refs_id_d043b34a` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=168 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authors`
--

DROP TABLE IF EXISTS `authors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `authors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `last` varchar(30) DEFAULT NULL,
  `first` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=53822 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authors`
--

LOCK TABLES `authors` WRITE;
/*!40000 ALTER TABLE `authors` DISABLE KEYS */;
/*!40000 ALTER TABLE `authors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculations`
--

DROP TABLE IF EXISTS `calculations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `configuration` varchar(15) DEFAULT NULL,
  `label` varchar(63) NOT NULL,
  `entry_id` int DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `composition_id` varchar(255) DEFAULT NULL,
  `natoms` int DEFAULT NULL,
  `input_id` int DEFAULT NULL,
  `settings` longtext,
  `output_id` int DEFAULT NULL,
  `energy` double DEFAULT NULL,
  `energy_pa` double DEFAULT NULL,
  `magmom` double DEFAULT NULL,
  `magmom_pa` double DEFAULT NULL,
  `dos_id` int DEFAULT NULL,
  `band_gap` double DEFAULT NULL,
  `irreducible_kpoints` double DEFAULT NULL,
  `attempt` int DEFAULT NULL,
  `nsteps` int DEFAULT NULL,
  `converged` tinyint(1) DEFAULT NULL,
  `runtime` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `calculations_d51ecca1` (`configuration`),
  KEY `calculations_e8d920b6` (`entry_id`),
  KEY `calculations_73e78684` (`path`),
  KEY `calculations_2687c130` (`composition_id`),
  KEY `calculations_15e2c79f` (`input_id`),
  KEY `calculations_270b0ccc` (`output_id`),
  KEY `calculations_8c453b14` (`dos_id`),
  CONSTRAINT `composition_id_refs_formula_2003ae95` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `dos_id_refs_id_71f43f1a` FOREIGN KEY (`dos_id`) REFERENCES `dos` (`id`),
  CONSTRAINT `entry_id_refs_id_fd924d28` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `input_id_refs_id_b4549153` FOREIGN KEY (`input_id`) REFERENCES `structures` (`id`),
  CONSTRAINT `output_id_refs_id_b4549153` FOREIGN KEY (`output_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4543277 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculations`
--

LOCK TABLES `calculations` WRITE;
/*!40000 ALTER TABLE `calculations` DISABLE KEYS */;
INSERT INTO `calculations` VALUES (51711,NULL,'coarse_relax',6126,'/home/oqmd/libraries/icsd/31865/coarse_relax','Ca1 O3 Ti1',5,81276,'{\'encut\': 300.0, \'lcharg\': True, \'nbands\': 19, \'ismear\': 0, \'ediff\': 0.0001, \'nsw\': 20, \'nelmin\': 2, \'istart\': 0, \'prec\': \'low\', \'pstress\': 0.0, \'lreal\': False, \'lorbit\': 11, \'epsilon\': 1.0, \'nelm\': 60, \'ibrion\': 2, \'potentials\': [{\'xc\': \'PBE\', \'name\': \'Ca_pv\', \'us\': False, \'paw\': True}, {\'xc\': \'PBE\', \'name\': \'O\', \'us\': False, \'paw\': True}, {\'xc\': \'PBE\', \'name\': \'Ti\', \'us\': False, \'paw\': True}], \'ispin\': 1, \'ldipol\': False, \'lvtot\': False, \'idipol\': 0, \'isif\': 3, \'algo\': \'fast\', \'lwave\': False, \'sigma\': 0.2, \'potim\': 0.5}',81274,-40.25630397,-8.051260794,NULL,NULL,NULL,NULL,NULL,0,4,0,48.1),(51715,NULL,'fine_relax',6126,'/home/oqmd/libraries/icsd/31865/fine_relax','Ca1 O3 Ti1',5,81274,'{\'encut\': 400.0, \'lcharg\': True, \'nbands\': 38, \'ismear\': 0, \'ediff\': 0.0001, \'nsw\': 20, \'nelmin\': 2, \'istart\': 0, \'prec\': \'med\', \'pstress\': 0.0, \'lreal\': False, \'lorbit\': 11, \'epsilon\': 1.0, \'nelm\': 60, \'ibrion\': 1, \'potentials\': [{\'xc\': \'PBE\', \'name\': \'Ca_pv\', \'us\': False, \'paw\': True}, {\'xc\': \'PBE\', \'name\': \'O\', \'us\': False, \'paw\': True}, {\'xc\': \'PBE\', \'name\': \'Ti\', \'us\': False, \'paw\': True}], \'ispin\': 1, \'ldipol\': False, \'lvtot\': False, \'idipol\': 0, \'isif\': 3, \'algo\': \'fast\', \'lwave\': False, \'sigma\': 0.2, \'potim\': 0.5}',81278,-39.51173826,-7.902347652,NULL,NULL,NULL,NULL,NULL,0,5,0,433.07);
/*!40000 ALTER TABLE `calculations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculations_element_set`
--

DROP TABLE IF EXISTS `calculations_element_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculations_element_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `element_id` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calculation_id` (`calculation_id`,`element_id`),
  KEY `calculations_element_set_7ab90288` (`calculation_id`),
  KEY `calculations_element_set_00a8885a` (`element_id`),
  CONSTRAINT `calculation_id_refs_id_f9a7d4fb` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `element_id_refs_symbol_f6a5d654` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=51081491 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculations_element_set`
--

LOCK TABLES `calculations_element_set` WRITE;
/*!40000 ALTER TABLE `calculations_element_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculations_element_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculations_hubbard_set`
--

DROP TABLE IF EXISTS `calculations_hubbard_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculations_hubbard_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `hubbard_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calculation_id` (`calculation_id`,`hubbard_id`),
  KEY `calculations_hubbard_set_7ab90288` (`calculation_id`),
  KEY `calculations_hubbard_set_fe0076ff` (`hubbard_id`),
  CONSTRAINT `calculation_id_refs_id_1b457f8f` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `hubbard_id_refs_id_69d3b2cc` FOREIGN KEY (`hubbard_id`) REFERENCES `hubbards` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5923230 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculations_hubbard_set`
--

LOCK TABLES `calculations_hubbard_set` WRITE;
/*!40000 ALTER TABLE `calculations_hubbard_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculations_hubbard_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculations_meta_data`
--

DROP TABLE IF EXISTS `calculations_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculations_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `metadata_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calculation_id` (`calculation_id`,`metadata_id`),
  KEY `calculations_meta_data_7ab90288` (`calculation_id`),
  KEY `calculations_meta_data_a131f96d` (`metadata_id`),
  CONSTRAINT `calculation_id_refs_id_d913490f` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `metadata_id_refs_id_282def41` FOREIGN KEY (`metadata_id`) REFERENCES `meta_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4231462 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculations_meta_data`
--

LOCK TABLES `calculations_meta_data` WRITE;
/*!40000 ALTER TABLE `calculations_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculations_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `calculations_potential_set`
--

DROP TABLE IF EXISTS `calculations_potential_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `calculations_potential_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `calculation_id` int NOT NULL,
  `potential_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `calculation_id` (`calculation_id`,`potential_id`),
  KEY `calculations_potential_set_7ab90288` (`calculation_id`),
  KEY `calculations_potential_set_821445f4` (`potential_id`),
  CONSTRAINT `calculation_id_refs_id_5498caac` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `potential_id_refs_id_07b35ac6` FOREIGN KEY (`potential_id`) REFERENCES `vasp_potentials` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=51234447 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `calculations_potential_set`
--

LOCK TABLES `calculations_potential_set` WRITE;
/*!40000 ALTER TABLE `calculations_potential_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `calculations_potential_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositions`
--

DROP TABLE IF EXISTS `compositions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositions` (
  `formula` varchar(255) NOT NULL,
  `generic` varchar(255) DEFAULT NULL,
  `ntypes` int DEFAULT NULL,
  `mass` double DEFAULT NULL,
  `meidema` double DEFAULT NULL,
  `structure_id` int DEFAULT NULL,
  `element_list` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`formula`),
  KEY `compositions_95d4059a` (`structure_id`),
  CONSTRAINT `structure_id_refs_id_548f203d` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositions`
--

LOCK TABLES `compositions` WRITE;
/*!40000 ALTER TABLE `compositions` DISABLE KEYS */;
INSERT INTO `compositions` VALUES ('Ca1 O3 Ti1','ABC3',3,NULL,NULL,NULL,'Ca_O_Ti_');
/*!40000 ALTER TABLE `compositions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositions_element_set`
--

DROP TABLE IF EXISTS `compositions_element_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositions_element_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `composition_id` varchar(255) NOT NULL,
  `element_id` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composition_id` (`composition_id`,`element_id`),
  KEY `compositions_element_set_2687c130` (`composition_id`),
  KEY `compositions_element_set_00a8885a` (`element_id`),
  CONSTRAINT `composition_id_refs_formula_7356ccb0` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `element_id_refs_symbol_3dc1dd1c` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=11857102 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositions_element_set`
--

LOCK TABLES `compositions_element_set` WRITE;
/*!40000 ALTER TABLE `compositions_element_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `compositions_element_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `compositions_meta_data`
--

DROP TABLE IF EXISTS `compositions_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `compositions_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `composition_id` varchar(255) NOT NULL,
  `metadata_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `composition_id` (`composition_id`,`metadata_id`),
  KEY `compositions_meta_data_2687c130` (`composition_id`),
  KEY `compositions_meta_data_a131f96d` (`metadata_id`),
  CONSTRAINT `composition_id_refs_formula_a252a8f6` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `metadata_id_refs_id_4f1113a7` FOREIGN KEY (`metadata_id`) REFERENCES `meta_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `compositions_meta_data`
--

LOCK TABLES `compositions_meta_data` WRITE;
/*!40000 ALTER TABLE `compositions_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `compositions_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_admin_log`
--

DROP TABLE IF EXISTS `django_admin_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_admin_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint unsigned NOT NULL,
  `change_message` longtext NOT NULL,
  `content_type_id` int DEFAULT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `djang_content_type_id_697914295151027a_fk_django_content_type_id` (`content_type_id`),
  KEY `django_admin_log_user_id_52fdd58701c5f563_fk_users_id` (`user_id`),
  CONSTRAINT `djang_content_type_id_697914295151027a_fk_django_content_type_id` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_52fdd58701c5f563_fk_users_id` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_content_type`
--

DROP TABLE IF EXISTS `django_content_type`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_content_type` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `app_label` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_migrations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_session`
--

DROP TABLE IF EXISTS `django_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_b7b81f0c` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_site`
--

DROP TABLE IF EXISTS `django_site`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_site` (
  `id` int NOT NULL AUTO_INCREMENT,
  `domain` varchar(100) NOT NULL,
  `name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_site_domain_a2e37b91_uniq` (`domain`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_site`
--

LOCK TABLES `django_site` WRITE;
/*!40000 ALTER TABLE `django_site` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_site` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dos`
--

DROP TABLE IF EXISTS `dos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dos` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int DEFAULT NULL,
  `gap` double DEFAULT NULL,
  `data` longtext,
  `file` varchar(128) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dos_e8d920b6` (`entry_id`),
  CONSTRAINT `entry_id_refs_id_8db2308b` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4336759 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dos`
--

LOCK TABLES `dos` WRITE;
/*!40000 ALTER TABLE `dos` DISABLE KEYS */;
/*!40000 ALTER TABLE `dos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dos_meta_data`
--

DROP TABLE IF EXISTS `dos_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `dos_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `dos_id` int NOT NULL,
  `metadata_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dos_id` (`dos_id`,`metadata_id`),
  KEY `dos_meta_data_8c453b14` (`dos_id`),
  KEY `dos_meta_data_a131f96d` (`metadata_id`),
  CONSTRAINT `dos_id_refs_id_a0756dd6` FOREIGN KEY (`dos_id`) REFERENCES `dos` (`id`),
  CONSTRAINT `metadata_id_refs_id_da2dcf01` FOREIGN KEY (`metadata_id`) REFERENCES `meta_data` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dos_meta_data`
--

LOCK TABLES `dos_meta_data` WRITE;
/*!40000 ALTER TABLE `dos_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `dos_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `elements`
--

DROP TABLE IF EXISTS `elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `elements` (
  `z` int NOT NULL,
  `name` varchar(20) NOT NULL,
  `symbol` varchar(9) NOT NULL,
  `group` int NOT NULL,
  `period` int NOT NULL,
  `mass` double NOT NULL,
  `density` double NOT NULL,
  `volume` double NOT NULL,
  `atomic_radii` int NOT NULL,
  `van_der_waals_radii` int NOT NULL,
  `covalent_radii` int NOT NULL,
  `melt` double NOT NULL,
  `boil` double NOT NULL,
  `specific_heat` double NOT NULL,
  `electronegativity` double NOT NULL,
  `first_ionization_energy` double NOT NULL,
  `s_elec` int NOT NULL,
  `p_elec` int NOT NULL,
  `d_elec` int NOT NULL,
  `f_elec` int NOT NULL,
  `production` double NOT NULL,
  `radioactive` tinyint(1) NOT NULL,
  `scattering_factors` longtext,
  `HHI_P` float DEFAULT '0',
  `HHI_R` float DEFAULT '0',
  PRIMARY KEY (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `elements`
--

LOCK TABLES `elements` WRITE;
/*!40000 ALTER TABLE `elements` DISABLE KEYS */;
INSERT INTO `elements` VALUES (89,'Actinium','Ac',0,7,227,10.0699996948,44.8699989319,195,-1,-1,1323.15002441,3471,0.119999997318,1.10000002384,5.17000007629,2,0,1,0,0.0010000000475,0,'{\'a1\': 35.659698, \'c\': 13.5266, \'b4\': 117.019997, \'a3\': 12.5977, \'a2\': 23.103201, \'a4\': 4.08655, \'b2\': 3.65155, \'b3\': 18.599001, \'b1\': 0.589092}',0,0),(47,'Silver','Ag',11,5,107.867996216,10.5010004044,17.4099998474,160,172,153,1234.15002441,2435,0.234999999404,1.92999994755,7.57620000839,1,0,10,0,0.0750000029802,0,'{\'a1\': 19.2808, \'c\': 5.179, \'b4\': 99.815598, \'a3\': 4.8045, \'a2\': 16.688499, \'a4\': 1.0463, \'b2\': 7.4726, \'b3\': 24.6605, \'b1\': 0.6446}',1200,1400),(13,'Aluminium','Al',13,3,26.9815006256,2.69799995422,16.4799995422,125,-1,118,933.400024414,2792,0.897000014782,1.61000001431,5.98577022552,2,1,0,0,82300,0,'{\'a1\': 6.4202, \'c\': 1.1151, \'b4\': 85.0886, \'a3\': 1.5936, \'a2\': 1.9002, \'a4\': 1.9646, \'b2\': 0.7426, \'b3\': 31.547199, \'b1\': 3.0387}',1600,1000),(95,'Americium','Am',0,7,243,13.6899995804,-1,175,-1,-1,1267.15002441,2880,-1,1.29999995232,5.97380018234,2,0,0,7,8,0,'{\'a1\': 36.670601, \'c\': 13.3592, \'b4\': 102.273003, \'a3\': 17.341499, \'a2\': 24.099199, \'a4\': 3.49331, \'b2\': 3.20647, \'b3\': 14.3136, \'b1\': 0.483629}',0,0),(18,'Argon','Ar',18,3,39.9480018616,0.00178369996138,33.7999992371,71,188,97,83.9599990845,87.3000030518,0.519999980927,0,15.7595996857,2,6,0,0,3.5,0,'{\'a1\': 7.4845, \'c\': 1.4445, \'b4\': 33.392899, \'a3\': 0.6539, \'a2\': 6.7723, \'a4\': 1.6442, \'b2\': 14.8407, \'b3\': 43.8983, \'b1\': 0.9072}',0,0),(33,'Arsenic','As',15,4,74.9216003418,5.77600002289,23.8974990845,115,185,119,1090.16003418,887,0.328999996185,2.18000006676,9.78859996796,2,3,10,0,1.79999995232,0,'{\'a1\': 10.6723, \'c\': 2.531, \'b4\': 47.797199, \'a3\': 3.4313, \'a2\': 6.0701, \'a4\': 4.2779, \'b2\': 0.2647, \'b3\': 12.9479, \'b1\': 2.6345}',3300,4000),(85,'Astatine','At',17,6,210,7,-1,-1,-1,-1,575.150024414,610,-1,2.20000004768,-1,0,0,0,0,0.0010000000475,0,'{\'a1\': 35.316299, \'c\': 13.7108, \'b4\': 45.4715, \'a3\': 9.49887, \'a2\': 19.021099, \'a4\': 7.42518, \'b2\': 3.97458, \'b3\': 11.3824, \'b1\': 0.68587}',0,0),(79,'Gold','Au',11,6,196.966995239,19.281999588,17.7099990845,135,166,144,1337.72998047,3129,0.128999993205,2.53999996185,9.22550010681,1,0,10,14,0.00400000018999,0,'{\'a1\': 16.881901, \'c\': 12.0658, \'b4\': 36.395599, \'a3\': 25.558201, \'a2\': 18.591299, \'a4\': 5.86, \'b2\': 8.6216, \'b3\': 1.4826, \'b1\': 0.4611}',1100,1000),(5,'Boron','B',13,2,10.8109998703,2.33999991417,7.18499994278,85,-1,82,2573.14990234,4200,1.02600002289,2.03999996185,8.2980298996,4,1,0,0,10,0,'{\'a1\': 2.0545, \'c\': -0.1932, \'b4\': 0.1403, \'a3\': 1.0979, \'a2\': 1.3326, \'a4\': 0.7068, \'b2\': 1.021, \'b3\': 60.3498, \'b1\': 23.2185}',2900,2000),(56,'Barium','Ba',2,6,137.32699585,3.59400010109,63.0099983215,215,-1,198,1002.15002441,2170,0.203999996185,0.889999985695,5.21169996262,2,0,0,0,425,0,'{\'a1\': 20.3361, \'c\': 2.7731, \'b4\': 167.201996, \'a3\': 10.888, \'a2\': 19.297001, \'a4\': 2.6959, \'b2\': 0.2756, \'b3\': 20.2073, \'b1\': 3.216}',3000,2300),(4,'Beryllium','Be',2,2,9.01218032837,1.85000002384,7.90999984741,105,-1,90,1560.15002441,2742,1.82500004768,1.57000005245,9.32269954681,4,0,0,0,2.79999995232,0,'{\'a1\': 1.5919, \'c\': 0.0385, \'b4\': 0.542, \'a3\': 0.5391, \'a2\': 1.1278, \'a4\': 0.7029, \'b2\': 1.8623, \'b3\': 103.483002, \'b1\': 43.6427}',8000,4000),(107,'Bohrium','Bh',7,7,264,37,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(83,'Bismuth','Bi',15,6,208.979995728,9.80700016022,36.0900001526,160,-1,146,544.66998291,1837,0.122000001371,2.01999998093,7.28560018539,2,3,10,14,0.00899999961257,0,'{\'a1\': 33.3689, \'c\': 13.5782, \'b4\': 48.0093, \'a3\': 16.5877, \'a2\': 12.951, \'a4\': 6.4692, \'b2\': 2.9238, \'b3\': 8.7937, \'b1\': 0.704}',5300,6000),(97,'Berkelium','Bk',0,7,247,14.7899999619,-1,-1,-1,-1,1259.15002441,983,-1,1.29999995232,6.19789981842,0,0,0,0,0,0,'{\'a1\': 36.788101, \'c\': 13.2754, \'b4\': 86.002998, \'a3\': 17.891899, \'a2\': 24.7736, \'a4\': 4.23284, \'b2\': 3.04619, \'b3\': 12.8946, \'b1\': 0.451018}',0,0),(35,'Bromine','Br',17,4,79.9039993286,3.12199997902,31.5475006104,115,185,114,266.049987793,332,0.474000006914,2.96000003815,11.8137998581,2,5,10,0,2.40000009537,0,'{\'a1\': 17.1789, \'c\': 2.9557, \'b4\': 41.4328, \'a3\': 5.6377, \'a2\': 5.2358, \'a4\': 3.9851, \'b2\': 16.579599, \'b3\': 0.2609, \'b1\': 2.1723}',3300,6900),(6,'Carbon','C',14,2,12.0107002258,2.26699995995,11.7574996948,70,170,77,3948.15991211,4300,0.708999991417,2.54999995232,11.2602996826,4,2,0,0,200,0,'{\'a1\': 2.31, \'c\': 0.2156, \'b4\': 51.651199, \'a3\': 1.5886, \'a2\': 1.02, \'a4\': 0.865, \'b2\': 10.2075, \'b3\': 0.5687, \'b1\': 20.843901}',500,500),(20,'Calcium','Ca',2,4,40.077999115,1.53999996185,39.7599983215,180,-1,174,1112.15002441,1757,0.647000014782,1,6.11316013336,2,0,0,0,41500,0,'{\'a1\': 8.6266, \'c\': 1.3751, \'b4\': 178.436996, \'a3\': 1.5899, \'a2\': 7.3873, \'a4\': 1.0211, \'b2\': 0.6599, \'b3\': 85.748398, \'b1\': 10.4421}',3900,1500),(48,'Cadmium','Cd',12,5,112.411003113,8.68999958038,21.9599990845,155,158,148,594.33001709,1040,0.231999993324,1.69000005722,8.99380016327,2,0,10,0,0.158999994397,0,'{\'a1\': 19.221399, \'c\': 5.0694, \'b4\': 87.482498, \'a3\': 4.461, \'a2\': 17.6444, \'a4\': 1.6029, \'b2\': 6.9089, \'b3\': 24.7008, \'b1\': 0.5946}',1700,1300),(58,'Cerium','Ce',0,6,140.115997314,6.76999998093,37.2000007629,185,-1,-1,1071.15002441,3716,0.192000001669,1.12000000477,5.53870010376,2,0,1,1,66.5,0,'{\'a1\': 21.167101, \'c\': 1.86264, \'b4\': 127.112999, \'a3\': 11.8513, \'a2\': 19.769501, \'a4\': 3.33049, \'b2\': 0.226836, \'b3\': 17.608299, \'b1\': 2.81219}',9500,3100),(98,'Californium','Cf',0,7,251,15.1000003815,-1,-1,-1,-1,1925.15002441,1173,-1,1.29999995232,6.28170013428,0,0,0,0,0,0,'{\'a1\': 36.918499, \'c\': 13.2674, \'b4\': 83.788101, \'a3\': 18.331699, \'a2\': 25.199499, \'a4\': 4.24391, \'b2\': 3.00775, \'b3\': 12.4044, \'b1\': 0.437533}',0,0),(17,'Chlorine','Cl',17,3,35.452999115,0.00321400002576,27.8899993896,100,175,99,172.309997559,239.11000061,0.479000002146,3.16000008583,12.9675998688,2,5,0,0,145,0,'{\'a1\': 11.4604, \'c\': -9.5574, \'b4\': 47.7784, \'a3\': 6.2556, \'a2\': 7.1964, \'a4\': 1.6455, \'b2\': 1.1662, \'b3\': 18.5194, \'b1\': 0.0104}',1500,1500),(96,'Curium','Cm',0,7,247,13.5100002289,-1,-1,-1,-1,1340.15002441,3383,-1,1.29999995232,5.99149990082,0,0,0,0,0,0,'{\'a1\': 36.6488, \'c\': 13.2887, \'b4\': 88.483398, \'a3\': 17.399, \'a2\': 24.409599, \'a4\': 4.21665, \'b2\': 3.08997, \'b3\': 13.4346, \'b1\': 0.465154}',0,0),(112,'Copernicium','Cn',12,7,285,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(27,'Cobalt','Co',9,4,58.9332008362,8.85999965668,10.6649999619,135,163,121,1768.15002441,3200,0.421000003815,1.87999999523,7.63980007172,2,0,7,0,25,0,'{\'a1\': 12.2841, \'c\': 1.0118, \'b4\': 71.169197, \'a3\': 4.0034, \'a2\': 7.3409, \'a4\': 2.3488, \'b2\': 0.2784, \'b3\': 13.5359, \'b1\': 4.2791}',3100,2700),(24,'Chromium','Cr',6,4,51.9961013794,7.15000009537,11.3000001907,140,-1,127,2130.14990234,2944,0.449000000954,1.65999996662,6.76649999619,1,0,5,0,102,0,'{\'a1\': 10.6406, \'c\': 1.1832, \'b4\': 98.739899, \'a3\': 3.324, \'a2\': 7.3537, \'a4\': 1.4922, \'b2\': 0.392, \'b3\': 20.2626, \'b1\': 6.1038}',3100,4100),(55,'Caesium','Cs',1,6,132.904998779,1.87300002575,115.830001831,260,-1,225,301.700012207,944,0.241999998689,0.790000021458,3.8938999176,1,0,0,0,3,0,'{\'a1\': 20.3892, \'c\': 3.3352, \'b4\': 213.904007, \'a3\': 10.662, \'a2\': 19.106199, \'a4\': 1.4953, \'b2\': 0.3107, \'b3\': 24.387899, \'b1\': 3.569}',6000,6000),(29,'Copper','Cu',11,4,63.5460014343,8.96000003815,11.720000267,135,140,138,1357.75,2835,0.384999990463,1.89999997616,7.72637987137,1,0,10,0,60,0,'{\'a1\': 13.338, \'c\': 1.191, \'b4\': 64.812599, \'a3\': 5.6158, \'a2\': 7.1676, \'a4\': 1.6735, \'b2\': 0.247, \'b3\': 11.3966, \'b1\': 3.5828}',1600,1500),(105,'Dubnium','Db',5,7,262,39,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(110,'Darmstadtium','Ds',10,7,271,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(66,'Dysprosium','Dy',0,6,162.5,8.55000019073,31.486700058,175,-1,-1,1680.15002441,2840,0.170000001788,1.22000002861,5.9388999939,2,0,0,10,5.19999980927,0,'{\'a1\': 26.507, \'c\': 4.29728, \'b4\': 111.874001, \'a3\': 14.5596, \'a2\': 17.6383, \'a4\': 2.96577, \'b2\': 0.202172, \'b3\': 12.1899, \'b1\': 2.1802}',9500,3100),(68,'Erbium','Er',0,6,167.259002686,9.06599998474,30.8250007629,175,-1,-1,1795.15002441,3503,0.167999997735,1.24000000954,6.10769987106,2,0,0,12,3.5,0,'{\'a1\': 27.6563, \'c\': 5.92046, \'b4\': 105.703003, \'a3\': 14.9779, \'a2\': 16.428499, \'a4\': 2.98233, \'b2\': 0.223545, \'b3\': 11.3604, \'b1\': 2.07356}',9500,3100),(99,'Einsteinium','Es',0,7,252,13.5,-1,-1,-1,-1,1133.15002441,-1,-1,1.29999995232,6.42000007629,0,0,0,0,0,0,NULL,0,0),(63,'Europium','Eu',0,6,151.964004517,5.24300003052,44.5200004578,185,-1,-1,1095.15002441,1802,0.181999996305,1.20000004768,5.67040014267,2,0,0,7,2,0,'{\'a1\': 24.627399, \'c\': 2.5745, \'b4\': 123.174004, \'a3\': 13.7603, \'a2\': 19.0886, \'a4\': 2.9227, \'b2\': 0.1942, \'b3\': 13.7546, \'b1\': 2.3879}',9500,3100),(9,'Fluorine','F',17,2,18.9983997345,0.00169599999208,19.5699996948,50,147,71,53.6300010681,85.0299987793,0.824000000954,3.98000001907,17.4228000641,4,5,0,0,585,0,'{\'a1\': 3.5392, \'c\': 0.2776, \'b4\': 26.1476, \'a3\': 1.517, \'a2\': 2.6412, \'a4\': 1.0243, \'b2\': 4.2944, \'b3\': 0.2615, \'b1\': 10.2825}',1500,1500),(26,'Iron','Fe',8,4,55.8450012207,7.87400007248,11.1599998474,140,-1,125,1808.15002441,3134,0.449000000954,1.83000004292,7.90240001678,2,0,6,0,56300,0,'{\'a1\': 11.7695, \'c\': 1.0369, \'b4\': 76.880501, \'a3\': 3.5222, \'a2\': 7.3573, \'a4\': 2.3045, \'b2\': 0.3072, \'b3\': 15.3535, \'b1\': 4.7611}',2400,1400),(100,'Fermium','Fm',0,7,257,-1,-1,-1,-1,-1,-1,-1,-1,1.29999995232,6.5,0,0,0,0,0,0,NULL,0,0),(87,'Francium','Fr',1,7,223,1.87000000477,-1,-1,-1,-1,300.149993896,950,-1,0.699999988079,4.07270002365,0,0,0,0,0.0010000000475,0,'{\'a1\': 35.929901, \'c\': 13.7247, \'b4\': 150.645004, \'a3\': 12.1439, \'a2\': 23.054701, \'a4\': 2.11253, \'b2\': 4.17619, \'b3\': 23.1052, \'b1\': 0.646453}',0,0),(31,'Gallium','Ga',13,4,69.7229995728,5.90700006485,20.0300006866,130,187,126,302.910003662,2477,0.370999991894,1.80999994278,5.99930000305,2,1,10,0,19,0,'{\'a1\': 15.2354, \'c\': 1.7189, \'b4\': 61.413502, \'a3\': 4.3591, \'a2\': 6.7006, \'a4\': 2.9623, \'b2\': 0.2412, \'b3\': 10.7805, \'b1\': 3.0669}',5500,1900),(64,'Gadolinium','Gd',0,6,157.25,7.89499998093,32.5299987793,180,-1,-1,1585.15002441,3546,0.236000001431,1.20000004768,6.15010023117,2,0,1,7,6.19999980927,0,'{\'a1\': 25.0709, \'c\': 2.4196, \'b4\': 101.398003, \'a3\': 13.8518, \'a2\': 19.0798, \'a4\': 3.54545, \'b2\': 0.181951, \'b3\': 12.9331, \'b1\': 2.25341}',9500,3100),(32,'Germanium','Ge',14,4,72.6399993896,5.32299995422,23.8400001526,125,-1,122,1211.44995117,3106,0.319999992847,2.00999999046,7.89940023422,2,2,10,0,1.5,0,'{\'a1\': 16.0816, \'c\': 2.1313, \'b4\': 54.762501, \'a3\': 3.7068, \'a2\': 6.3747, \'a4\': 3.683, \'b2\': 0.2516, \'b3\': 11.4468, \'b1\': 2.8509}',5300,1900),(1,'Hydrogen','H',1,1,1.00794005394,0.0000898799989955,9.64875030518,25,120,38,14.1750001907,20.2800006866,14.3039999008,2.20000004768,13.598400116,1,0,0,0,1400,0,'{\'a1\': 0.489918, \'c\': 0.001305, \'b4\': 2.20159, \'a3\': 0.196767, \'a2\': 0.262003, \'a4\': 0.049879, \'b2\': 7.74039, \'b3\': 49.551899, \'b1\': 20.6593}',0,0),(2,'Helium','He',18,1,4.00260019302,0.000178500005859,15.5200004578,31,140,32,-1,4.21999979019,5.19299983978,0,24.5874004364,2,0,0,0,0.00800000037998,0,'{\'a1\': 0.8734, \'c\': 0.0064, \'b4\': 0.9821, \'a3\': 0.3112, \'a2\': 0.6309, \'a4\': 0.178, \'b2\': 3.3568, \'b3\': 22.927601, \'b1\': 9.1037}',3200,3900),(72,'Hafnium','Hf',4,6,178.490005493,13.3100004196,22.3050003052,155,-1,150,2500.14990234,4876,0.143999993801,1.29999995232,6.82506990433,2,0,2,14,3,0,'{\'a1\': 29.143999, \'c\': 8.58154, \'b4\': 72.028999, \'a3\': 14.7586, \'a2\': 15.1726, \'a4\': 4.30013, \'b2\': 9.5999, \'b3\': 0.275116, \'b1\': 1.83262}',3400,2600),(80,'Mercury','Hg',12,6,200.589996338,13.5335998535,32.7167015076,150,155,149,234.429992676,630,0.140000000596,2,10.4375,2,0,10,14,0.0850000008941,0,'{\'a1\': 20.680901, \'c\': 12.6089, \'b4\': 38.3246, \'a3\': 21.657499, \'a2\': 19.0417, \'a4\': 5.9676, \'b2\': 8.4484, \'b3\': 1.5729, \'b1\': 0.545}',5500,3100),(67,'Holmium','Ho',0,6,164.929992676,8.79500007629,31.0333003998,175,-1,-1,1743.15002441,2993,0.165000006557,1.23000001907,6.02150011063,2,0,0,11,1.29999995232,0,'{\'a1\': 26.9049, \'c\': 4.56796, \'b4\': 92.656601, \'a3\': 14.5583, \'a2\': 17.294001, \'a4\': 3.63837, \'b2\': 0.19794, \'b3\': 11.4407, \'b1\': 2.07051}',9500,3100),(108,'Hassium','Hs',8,7,267,41,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(53,'Iodine','I',17,5,126.903999329,4.92999982834,44.0999984741,140,198,133,386.649993896,457.399993896,0.21400000155,2.66000008583,10.4512996674,2,5,10,0,0.449999988079,0,'{\'a1\': 20.1472, \'c\': 4.0712, \'b4\': 66.877602, \'a3\': 7.5138, \'a2\': 18.9949, \'a4\': 2.2735, \'b2\': 0.3814, \'b3\': 27.766001, \'b1\': 4.347}',4900,4800),(49,'Indium','In',13,5,114.818000793,7.30999994278,26.8500003815,155,193,144,429.910003662,2345,0.232999995351,1.77999997139,5.78635978699,2,1,10,0,0.25,0,'{\'a1\': 19.162399, \'c\': 4.9391, \'b4\': 92.802902, \'a3\': 4.2948, \'a2\': 18.559601, \'a4\': 2.0396, \'b2\': 6.3776, \'b3\': 25.849899, \'b1\': 0.5476}',3300,2000),(77,'Iridium','Ir',9,6,192.216995239,22.5599994659,14.4099998474,135,-1,137,2716.14990234,4701,0.130999997258,2.20000004768,8.96700000763,2,0,7,14,0.0010000000475,0,'{\'a1\': 27.304899, \'c\': 11.4722, \'b4\': 45.001099, \'a3\': 15.6115, \'a2\': 16.729601, \'a4\': 5.83377, \'b2\': 8.86553, \'b3\': 0.417916, \'b1\': 1.59279}',5500,9100),(19,'Potassium','K',1,4,39.0983009338,0.861999988556,71.3199996948,220,275,196,336.5,1032,0.757000029087,0.819999992847,4.34066009521,1,0,0,0,20900,0,'{\'a1\': 8.2186, \'c\': 1.4228, \'b4\': 41.684101, \'a3\': 1.0519, \'a2\': 7.4398, \'a4\': 0.8659, \'b2\': 0.7748, \'b3\': 213.186996, \'b1\': 12.7949}',1700,7200),(36,'Krypton','Kr',18,4,83.797996521,0.00373300001957,42.3450012207,88,202,110,115.930000305,119.930000305,0.247999995947,3,13.9996004105,0,0,0,0,0.0010000000475,0,'{\'a1\': 17.355499, \'c\': 2.825, \'b4\': 39.397202, \'a3\': 5.5493, \'a2\': 6.7286, \'a4\': 3.5375, \'b2\': 16.5623, \'b3\': 0.2261, \'b1\': 1.9384}',0,0),(57,'Lanthanum','La',0,6,138.904998779,6.14499998093,36.6800003052,195,-1,169,1193.15002441,3737,0.194999992847,1.10000002384,5.57690000534,2,0,1,0,39,0,'{\'a1\': 20.577999, \'c\': 2.14678, \'b4\': 133.123993, \'a3\': 11.3727, \'a2\': 19.599001, \'a4\': 3.28719, \'b2\': 0.244475, \'b3\': 18.7726, \'b1\': 2.94817}',9500,3100),(3,'Lithium','Li',1,2,6.94099998474,0.533999979496,18.3299999237,145,182,134,453.850006104,1615,3.58200001717,0.980000019073,5.39171981812,3,0,0,0,20,0,'{\'a1\': 1.1282, \'c\': 0.0377, \'b4\': 168.261002, \'a3\': 0.6175, \'a2\': 0.7508, \'a4\': 0.4653, \'b2\': 1.0524, \'b3\': 85.390503, \'b1\': 3.9546}',2900,4200),(103,'Lawrencium','Lr',3,7,262,-1,-1,-1,-1,-1,-1,-1,-1,1.29999995232,4.90000009537,0,0,0,0,0,0,NULL,0,0),(71,'Lutetium','Lu',3,0,174.966995239,9.84000015259,29.3500003815,175,-1,160,1936.15002441,3675,0.153999999166,1.26999998093,5.42589998245,2,0,1,14,0.800000011921,0,'{\'a1\': 28.947599, \'c\': 7.97628, \'b4\': 84.329803, \'a3\': 15.1, \'a2\': 15.2208, \'a4\': 3.71601, \'b2\': 9.98519, \'b3\': 0.261033, \'b1\': 1.90182}',9500,3100),(101,'Mendelevium','Md',0,7,258,-1,-1,-1,-1,-1,-1,-1,-1,1.29999995232,6.57999992371,0,0,0,0,0,0,NULL,0,0),(12,'Magnesium','Mg',2,3,24.3050003052,1.73800003529,22.8950004578,150,173,130,923.150024414,1363,1.02300000191,1.30999994278,7.64624023438,2,0,0,0,23300,0,'{\'a1\': 5.4204, \'c\': 0.8584, \'b4\': 7.1937, \'a3\': 1.2269, \'a2\': 2.1735, \'a4\': 2.3073, \'b2\': 79.261101, \'b3\': 0.3808, \'b1\': 2.8275}',5300,500),(25,'Manganese','Mn',7,4,54.9379997253,7.44000005722,10.6428003311,140,-1,139,1519.15002441,2334,0.479000002146,1.54999995232,7.43402004242,2,0,5,0,950,0,'{\'a1\': 11.2819, \'c\': 1.0896, \'b4\': 83.754303, \'a3\': 3.0193, \'a2\': 7.3573, \'a4\': 2.2441, \'b2\': 0.3432, \'b3\': 17.867399, \'b1\': 5.3409}',1600,1800),(42,'Molybdenum','Mo',6,5,95.9599990845,10.220000267,15.8000001907,145,-1,145,2890.14990234,4912,0.250999987125,2.16000008583,7.09243011475,1,0,5,0,1.20000004768,0,'{\'a1\': 3.7025, \'c\': 4.3875, \'b4\': 61.658401, \'a3\': 12.8876, \'a2\': 17.2356, \'a4\': 3.7429, \'b2\': 1.0958, \'b3\': 11.004, \'b1\': 0.2772}',2400,5300),(109,'Meitnerium','Mt',9,7,268,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(7,'Nitrogen','N',15,2,14.0066995621,0.00125059997663,17.4724998474,65,155,75,63.2900009155,77.3600006104,1.03999996185,3.03999996185,14.5340995789,4,3,0,0,19,0,'{\'a1\': 12.2126, \'c\': -11.529, \'b4\': 0.5826, \'a3\': 2.0125, \'a2\': 3.1322, \'a4\': 1.1663, \'b2\': 9.8933, \'b3\': 28.997499, \'b1\': 0.0057}',1300,500),(11,'Sodium','Na',1,3,22.9897994995,0.971000015736,34.1199989319,180,227,154,371.149993896,1156,1.22800004482,0.930000007153,5.13908004761,1,0,0,0,23600,0,'{\'a1\': 4.7626, \'c\': 0.676, \'b4\': 129.423996, \'a3\': 1.2674, \'a2\': 3.1736, \'a4\': 1.1128, \'b2\': 8.8422, \'b3\': 0.3136, \'b1\': 3.285}',1100,500),(41,'Niobium','Nb',5,5,92.9064025879,8.56999969482,18.2600002289,145,-1,137,2741.14990234,5017,0.264999985695,1.60000002384,6.75885009766,1,0,4,0,20,0,'{\'a1\': 17.614201, \'c\': 3.75591, \'b4\': 69.7957, \'a3\': 4.04183, \'a2\': 12.0144, \'a4\': 3.53346, \'b2\': 11.766, \'b3\': 0.204785, \'b1\': 1.18865}',8500,8800),(60,'Neodymium','Nd',0,6,144.242004395,7.00699996948,35.2599983215,185,-1,-1,1289.15002441,3347,0.189999997616,1.13999998569,5.52500009537,2,0,0,4,41.5,0,'{\'a1\': 22.6845, \'c\': 1.98486, \'b4\': 137.903, \'a3\': 12.774, \'a2\': 19.6847, \'a4\': 2.85137, \'b2\': 0.210628, \'b3\': 15.885, \'b1\': 2.66248}',9500,3100),(10,'Neon','Ne',18,2,20.1797008514,0.000899899983779,16.3199996948,38,154,69,24.702999115,27.0699996948,1.02999997139,0,21.5645999908,0,0,0,0,0.00499999988824,0,'{\'a1\': 3.9553, \'c\': 0.3515, \'b4\': 21.718399, \'a3\': 1.4546, \'a2\': 3.1125, \'a4\': 1.1251, \'b2\': 3.4262, \'b3\': 0.2306, \'b1\': 8.4042}',0,0),(28,'Nickel','Ni',10,4,58.6934013367,8.91199970245,10.720000267,135,-1,126,1726.15002441,3186,0.444000005722,1.90999996662,7.88100004196,2,0,8,0,84,0,'{\'a1\': 12.8376, \'c\': 1.0341, \'b4\': 66.342102, \'a3\': 4.4438, \'a2\': 7.292, \'a4\': 2.38, \'b2\': 0.2565, \'b3\': 12.1763, \'b1\': 3.8785}',1000,1500),(102,'Nobelium','No',0,7,259,-1,-1,-1,-1,-1,-1,-1,-1,1.29999995232,6.65000009537,0,0,0,0,0,0,NULL,0,0),(93,'Neptunium','Np',0,7,237,20.4500007629,18.4587001801,175,-1,-1,913.150024414,4273,-1,1.36000001431,6.26569986343,2,0,1,4,0.0010000000475,0,'{\'a1\': 36.187401, \'c\': 13.3573, \'b4\': 97.490799, \'a3\': 15.6402, \'a2\': 23.596399, \'a4\': 4.1855, \'b2\': 3.25396, \'b3\': 15.3622, \'b1\': 0.511929}',0,0),(8,'Oxygen','O',16,2,15.9994001389,0.00142900005449,9.55875015259,60,152,73,50.5,90.1999969482,0.917999982834,3.44000005722,13.6181001663,4,4,0,0,461000,0,'{\'a1\': 3.0485, \'c\': 0.2508, \'b4\': 32.908901, \'a3\': 1.5463, \'a2\': 2.2868, \'a4\': 0.867, \'b2\': 5.7011, \'b3\': 0.3239, \'b1\': 13.2771}',500,500),(76,'Osmium','Os',8,6,190.229995728,22.6100006104,14.2650003433,130,-1,128,3300.14990234,5285,0.129999995232,2.20000004768,8.43819999695,2,0,6,14,0.00200000009499,0,'{\'a1\': 28.1894, \'c\': 11.0005, \'b4\': 48.1647, \'a3\': 14.9305, \'a2\': 16.155001, \'a4\': 5.67589, \'b2\': 8.97948, \'b3\': 0.382661, \'b1\': 1.62903}',5500,9100),(15,'Phosphorus','P',15,3,30.9738006592,1.82000005245,23.8129005432,100,180,106,317.25,553,0.768999993801,2.19000005722,10.486700058,2,3,0,0,1050,0,'{\'a1\': 6.4345, \'c\': 1.1149, \'b4\': 68.164497, \'a3\': 1.78, \'a2\': 4.1791, \'a4\': 1.4908, \'b2\': 27.157, \'b3\': 0.526, \'b1\': 1.9067}',2000,5100),(91,'Protactinium','Pa',0,7,231.035995483,15.3699998856,24.7399997711,180,-1,-1,1873.15002441,4300,-1,1.5,5.88999986649,2,0,1,2,0.0010000000475,0,'{\'a1\': 35.884701, \'c\': 13.4287, \'b4\': 105.250999, \'a3\': 14.1891, \'a2\': 23.2948, \'a4\': 4.17287, \'b2\': 3.41519, \'b3\': 16.9235, \'b1\': 0.547751}',0,0),(82,'Lead','Pb',14,6,207.199996948,11.3420000076,31.1599998474,180,202,147,600.75,2022,0.128999993205,2.32999992371,7.416659832,2,2,10,14,14,0,'{\'a1\': 31.061701, \'c\': 13.4118, \'b4\': 47.2579, \'a3\': 18.441999, \'a2\': 13.0637, \'a4\': 5.9696, \'b2\': 2.3576, \'b3\': 8.618, \'b1\': 0.6902}',2700,1800),(46,'Palladium','Pd',10,5,106.419998169,12.0200004578,15.1800003052,140,163,131,1825.15002441,3236,0.244000002742,2.20000004768,8.33689975739,0,0,10,0,0.0149999996647,0,'{\'a1\': 19.3319, \'c\': 5.26593, \'b4\': 76.898598, \'a3\': 5.29537, \'a2\': 15.5017, \'a4\': 0.605844, \'b2\': 7.98929, \'b3\': 25.2052, \'b1\': 0.698655}',3200,8000),(61,'Promethium','Pm',0,6,145,7.26000022888,34.4324989319,185,-1,-1,1204.15002441,3273,-1,1.12999999523,5.58199977875,2,0,0,5,0.0010000000475,0,'{\'a1\': 23.3405, \'c\': 2.02876, \'b4\': 132.720993, \'a3\': 13.1235, \'a2\': 19.609501, \'a4\': 2.87516, \'b2\': 0.202088, \'b3\': 15.1009, \'b1\': 2.5627}',9500,3100),(84,'Polonium','Po',16,6,210,9.31999969482,-1,190,-1,-1,527.150024414,1235,-1,2,8.41699981689,2,4,10,14,0.0010000000475,0,'{\'a1\': 34.6726, \'c\': 13.677, \'b4\': 47.004501, \'a3\': 13.1138, \'a2\': 15.4733, \'a4\': 7.0258, \'b2\': 3.55078, \'b3\': 9.55642, \'b1\': 0.700999}',0,0),(59,'Praseodymium','Pr',0,6,140.908004761,6.77299976349,36.2200012207,185,-1,-1,1204.15002441,3793,0.193000003695,1.12999999523,5.47300004959,2,0,0,3,9.19999980927,0,'{\'a1\': 22.044001, \'c\': 2.0583, \'b4\': 143.643997, \'a3\': 12.3856, \'a2\': 19.669701, \'a4\': 2.82428, \'b2\': 0.222087, \'b3\': 16.766899, \'b1\': 2.77393}',9500,3100),(78,'Platinum','Pt',10,6,195.083999634,21.4599990845,15.5399999619,135,175,128,2045.15002441,4098,0.133000001311,2.27999997139,8.95870018005,1,0,9,14,0.00499999988824,0,'{\'a1\': 27.005899, \'c\': 11.6883, \'b4\': 38.610298, \'a3\': 15.7131, \'a2\': 17.763901, \'a4\': 5.7837, \'b2\': 8.81174, \'b3\': 0.424593, \'b1\': 1.51293}',5500,9100),(94,'Plutonium','Pu',0,7,244,19.8400001526,20.7912998199,175,-1,-1,913.150024414,3501,-1,1.27999997139,6.02619981766,2,0,0,6,0.0010000000475,0,'{\'a1\': 36.525398, \'c\': 13.3812, \'b4\': 105.980003, \'a3\': 16.7707, \'a2\': 23.8083, \'a4\': 3.47947, \'b2\': 3.26371, \'b3\': 14.9455, \'b1\': 0.499384}',0,0),(88,'Radium','Ra',2,7,226,5.5,-1,215,-1,-1,973.150024414,2010,-1,0.899999976158,5.27839994431,2,0,0,0,0.0010000000475,0,'{\'a1\': 35.763, \'c\': 13.6211, \'b4\': 142.324997, \'a3\': 12.4739, \'a2\': 22.906401, \'a4\': 3.21097, \'b2\': 3.87135, \'b3\': 19.988701, \'b1\': 0.616341}',0,0),(37,'Rubidium','Rb',1,5,85.4677963257,1.53199994564,89.0999984741,235,-1,211,312.790008545,961,0.363000005484,0.819999992847,4.17713022232,1,0,0,0,90,0,'{\'a1\': 17.1784, \'c\': 3.4873, \'b4\': 164.934006, \'a3\': 5.1399, \'a2\': 9.6435, \'a4\': 1.5292, \'b2\': 17.3151, \'b3\': 0.2748, \'b1\': 1.7888}',6000,6000),(75,'Rhenium','Re',7,6,186.207000732,21.0200004578,14.8699998856,135,-1,159,3453.14990234,5869,0.136999994516,1.89999997616,7.83349990845,2,0,5,14,0.0010000000475,0,'{\'a1\': 28.7621, \'c\': 10.472, \'b4\': 52.086102, \'a3\': 14.5564, \'a2\': 15.7189, \'a4\': 5.44174, \'b2\': 9.09227, \'b3\': 0.3505, \'b1\': 1.67191}',3300,3300),(104,'Rutherfordium','Rf',4,7,261,18.1000003815,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(111,'Roentgenium','Rg',11,7,272,-1,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(45,'Rhodium','Rh',9,5,102.90599823,12.4099998474,13.9899997711,135,-1,135,2239.14990234,3968,0.243000000715,2.27999997139,7.45889997482,1,0,8,0,0.0010000000475,0,'{\'a1\': 19.2957, \'c\': 5.328, \'b4\': 98.606201, \'a3\': 4.73425, \'a2\': 14.3501, \'a4\': 1.28918, \'b2\': 8.21758, \'b3\': 25.874901, \'b1\': 0.751536}',3200,8000),(86,'Radon','Rn',18,6,222,0.00973000004888,-1,120,-1,145,202.149993896,211.300003052,0.0939999967813,2.20000004768,10.7484998703,0,0,0,0,0.0010000000475,0,'{\'a1\': 35.563099, \'c\': 13.6905, \'b4\': 44.247299, \'a3\': 8.0037, \'a2\': 21.281601, \'a4\': 7.4433, \'b2\': 4.0691, \'b3\': 14.0422, \'b1\': 0.6631}',0,0),(44,'Ruthenium','Ru',8,5,101.069999695,12.3699998856,13.7100000381,130,-1,126,2523.14990234,4423,0.238000005484,2.20000004768,7.36049985886,1,0,7,0,0.0010000000475,0,'{\'a1\': 19.267401, \'c\': 5.37874, \'b4\': 94.292801, \'a3\': 4.86337, \'a2\': 12.9182, \'a4\': 1.56756, \'b2\': 8.43467, \'b3\': 24.7997, \'b1\': 0.80852}',3200,8000),(16,'Sulfur','S',16,3,32.0649986267,2.06699991226,28.0034999847,100,180,102,388.510009766,717.799987793,0.709999978542,2.57999992371,10.3599996567,2,4,0,0,350,0,'{\'a1\': 6.9053, \'c\': 0.8669, \'b4\': 56.172001, \'a3\': 1.4379, \'a2\': 5.2034, \'a4\': 1.5863, \'b2\': 22.215099, \'b3\': 0.2536, \'b1\': 1.4679}',700,1000),(51,'Antimony','Sb',15,5,121.760002136,6.68499994278,31.6299991608,145,-1,138,904.049987793,1860,0.207000002265,2.04999995232,8.60840034485,2,3,10,0,0.20000000298,0,'{\'a1\': 19.6418, \'c\': 4.5909, \'b4\': 75.282501, \'a3\': 5.0371, \'a2\': 19.0455, \'a4\': 2.6827, \'b2\': 0.4607, \'b3\': 27.9074, \'b1\': 5.3034}',7900,3400),(21,'Scandium','Sc',3,4,44.9558982849,2.98900008202,23.7450008392,160,-1,144,1812.15002441,3109,0.568000018597,1.36000001431,6.56150007248,2,0,1,0,22,0,'{\'a1\': 9.189, \'c\': 1.3329, \'b4\': 51.3531, \'a3\': 1.6409, \'a2\': 7.3679, \'a4\': 1.468, \'b2\': 0.5729, \'b3\': 136.108002, \'b1\': 9.0213}',5500,4500),(34,'Selenium','Se',16,4,78.9599990845,4.80900001526,27.4433002472,115,190,116,494.149993896,958,0.321000009775,2.54999995232,9.75238037109,2,4,10,0,0.0500000007451,0,'{\'a1\': 17.000601, \'c\': 2.8409, \'b4\': 43.816299, \'a3\': 3.9731, \'a2\': 5.8196, \'a4\': 4.3543, \'b2\': 0.2726, \'b3\': 15.2372, \'b1\': 2.4098}',2200,1900),(106,'Seaborgium','Sg',6,7,266,35,-1,-1,-1,-1,-1,-1,-1,-1,-1,0,0,0,0,0,0,NULL,0,0),(14,'Silicon','Si',14,3,28.0855007172,2.32960009575,20.4099998474,110,210,111,1683.15002441,3538,0.704999983311,1.89999997616,8.15168952942,2,2,0,0,282000,0,'{\'a1\': 6.2915, \'c\': 1.1407, \'b4\': 81.693703, \'a3\': 1.9891, \'a2\': 3.0353, \'a4\': 1.541, \'b2\': 32.333698, \'b3\': 0.6785, \'b1\': 2.4386}',4700,1000),(62,'Samarium','Sm',0,6,150.36000061,7.51999998093,34.0625,185,-1,-1,1345.15002441,2067,0.196999996901,1.16999995708,5.64359998703,2,0,0,6,7.05000019073,0,'{\'a1\': 24.0042, \'c\': 2.20963, \'b4\': 128.007004, \'a3\': 13.4396, \'a2\': 19.4258, \'a4\': 2.89604, \'b2\': 0.196451, \'b3\': 14.3996, \'b1\': 2.47274}',9500,3100),(50,'Tin','Sn',14,5,118.709999084,7.28700017929,36.1500015259,145,217,141,505.209991455,2875,0.228000000119,1.96000003815,7.3439002037,2,2,10,0,2.29999995232,0,'{\'a1\': 19.1889, \'c\': 4.7821, \'b4\': 83.9571, \'a3\': 4.4585, \'a2\': 19.1005, \'a4\': 2.4663, \'b2\': 0.5031, \'b3\': 26.8909, \'b1\': 5.8303}',2600,1600),(38,'Strontium','Sr',2,5,87.6200027466,2.6400001049,53.9399986267,200,-1,192,1042.15002441,1655,0.300999999046,0.949999988079,5.69490003586,2,0,0,0,370,0,'{\'a1\': 17.566299, \'c\': 2.5064, \'b4\': 132.376007, \'a3\': 5.422, \'a2\': 9.8184, \'a4\': 2.6694, \'b2\': 14.0988, \'b3\': 0.1664, \'b1\': 1.5564}',4200,3000),(73,'Tantalum','Ta',5,6,180.947998047,16.6539993286,18.2299995422,145,-1,138,3269.14990234,5731,0.140000000596,1.5,7.54960012436,2,0,3,14,2,0,'{\'a1\': 29.2024, \'c\': 9.24354, \'b4\': 63.364399, \'a3\': 14.5135, \'a2\': 15.2293, \'a4\': 4.76492, \'b2\': 9.37046, \'b3\': 0.295977, \'b1\': 1.77333}',2300,4800),(65,'Terbium','Tb',0,6,158.925003052,8.22900009155,31.9967002869,175,-1,-1,1630.15002441,3503,0.181999996305,1.20000004768,5.86380004883,2,0,0,9,1.20000004768,0,'{\'a1\': 25.8976, \'c\': 3.58924, \'b4\': 115.362, \'a3\': 14.3167, \'a2\': 18.2185, \'a4\': 2.95354, \'b2\': 0.196143, \'b3\': 12.6648, \'b1\': 2.24256}',9500,3100),(43,'Technetium','Tc',7,5,98,11.5,14.5,135,-1,156,2473.14990234,5150,-1,1.89999997616,7.28000020981,2,0,5,0,0.0010000000475,0,'{\'a1\': 19.1301, \'c\': 5.40428, \'b4\': 86.847198, \'a3\': 4.64901, \'a2\': 11.0948, \'a4\': 2.71263, \'b2\': 8.14487, \'b3\': 21.5707, \'b1\': 0.864132}',0,0),(52,'Tellurium','Te',16,5,127.599998474,6.23199987411,34.7200012207,140,206,135,722.799987793,1261,0.202000007033,2.09999990463,9.00959968567,2,4,10,0,0.0010000000475,0,'{\'a1\': 19.964399, \'c\': 4.352, \'b4\': 70.840302, \'a3\': 6.14487, \'a2\': 19.0138, \'a4\': 2.5239, \'b2\': 0.420885, \'b3\': 28.5284, \'b1\': 4.81742}',2900,4900),(90,'Thorium','Th',0,7,232.037994385,11.720000267,32.1500015259,180,-1,-1,2028.15002441,5061,0.112999998033,1.29999995232,6.30670022964,2,0,2,0,9.60000038147,0,'{\'a1\': 35.564499, \'c\': 13.4314, \'b4\': 99.172203, \'a3\': 12.7473, \'a2\': 23.4219, \'a4\': 4.80703, \'b2\': 3.46204, \'b3\': 17.8309, \'b1\': 0.563359}',0,0),(22,'Titanium','Ti',4,4,47.8670005798,4.53999996185,16.7567005157,140,-1,136,1933.15002441,3560,0.523000001907,1.53999996185,6.82810020447,2,0,2,0,5650,0,'{\'a1\': 9.7595, \'c\': 1.2807, \'b4\': 116.105003, \'a3\': 1.6991, \'a2\': 7.3558, \'a4\': 1.9021, \'b2\': 0.5, \'b3\': 35.633801, \'b1\': 7.8508}',1100,1600),(81,'Thallium','Tl',13,6,204.382995605,11.8500003815,31.2800006866,190,196,148,577.150024414,1746,0.128999993205,1.62000000477,6.10820007324,2,1,10,14,0.850000023842,0,'{\'a1\': 27.5446, \'c\': 13.1746, \'b4\': 45.814899, \'a3\': 15.538, \'a2\': 19.1584, \'a4\': 5.52593, \'b2\': 8.70751, \'b3\': 1.96347, \'b1\': 0.65515}',6500,6500),(69,'Thulium','Tm',0,6,168.934005737,9.32100009918,30.3799991608,175,-1,-1,1818.15002441,2223,0.159999996424,1.25,6.18430995941,2,0,0,13,0.519999980927,0,'{\'a1\': 28.1819, \'c\': 6.75621, \'b4\': 102.960999, \'a3\': 15.1542, \'a2\': 15.8851, \'a4\': 2.98706, \'b2\': 0.238849, \'b3\': 10.9975, \'b1\': 2.02859}',9500,3100),(92,'Uranium','U',0,7,238.029006958,18.9500007629,20.0300006866,175,186,-1,1405.15002441,4404,0.115999996662,1.37999999523,6.19404983521,2,0,1,3,2.70000004768,0,'{\'a1\': 36.0228, \'c\': 13.3966, \'b4\': 100.612999, \'a3\': 14.9491, \'a2\': 23.4128, \'a4\': 4.188, \'b2\': 3.3253, \'b3\': 16.092699, \'b1\': 0.5293}',0,0),(23,'Vanadium','V',5,4,50.9415016174,6.11000013351,13.1300001144,135,-1,125,2175.14990234,3680,0.488999992609,1.62999999523,6.74620008469,2,0,3,0,120,0,'{\'a1\': 10.2971, \'c\': 1.2199, \'b4\': 102.477997, \'a3\': 2.0703, \'a2\': 7.3511, \'a4\': 2.0571, \'b2\': 0.4385, \'b3\': 26.893801, \'b1\': 6.8657}',3300,3400),(74,'Tungsten','W',6,6,183.839996338,19.25,16.1399993896,135,-1,146,3680.14990234,5828,0.131999999285,2.3599998951,7.8639998436,2,0,4,14,1.29999995232,0,'{\'a1\': 29.0818, \'c\': 9.8875, \'b4\': 57.056, \'a3\': 14.4327, \'a2\': 15.43, \'a4\': 5.11982, \'b2\': 9.2259, \'b3\': 0.321703, \'b1\': 1.72029}',7000,4300),(54,'Xenon','Xe',18,5,131.292999268,0.00588699989021,58.506,108,216,130,161.449996948,165.029998779,0.158000007272,2.59999990463,12.1297998428,0,0,0,0,0.0010000000475,0,'{\'a1\': 20.293301, \'c\': 3.7118, \'b4\': 64.2658, \'a3\': 8.9767, \'a2\': 19.0298, \'a4\': 1.99, \'b2\': 0.344, \'b3\': 26.4659, \'b1\': 3.9282}',0,0),(39,'Yttrium','Y',3,5,88.9058990479,4.46899986267,32.5400009155,180,-1,162,1799.15002441,3609,0.298000007868,1.22000002861,6.21710014343,2,0,1,0,33,0,'{\'a1\': 17.775999, \'c\': 1.91213, \'b4\': 104.353996, \'a3\': 5.72629, \'a2\': 10.2946, \'a4\': 3.26588, \'b2\': 12.8006, \'b3\': 0.125599, \'b1\': 1.4029}',9800,2600),(70,'Ytterbium','Yb',0,6,173.054000854,6.96500015259,40.2299995422,175,-1,-1,1097.15002441,1469,0.155000001192,1.10000002384,6.25415992737,2,0,0,14,3.20000004768,0,'{\'a1\': 28.664101, \'c\': 7.56672, \'b4\': 100.417, \'a3\': 15.3087, \'a2\': 15.4345, \'a4\': 2.98963, \'b2\': 0.257119, \'b3\': 10.6647, \'b1\': 1.9889}',9500,3100),(30,'Zinc','Zn',12,4,65.3799972534,7.13399982452,14.8249998093,135,139,131,692.880004883,1180,0.388000011444,1.64999997616,9.39420032501,2,0,10,0,70,0,'{\'a1\': 14.0743, \'c\': 1.3041, \'b4\': 58.709702, \'a3\': 5.1652, \'a2\': 7.0318, \'a4\': 2.41, \'b2\': 0.2333, \'b3\': 10.3163, \'b1\': 3.2655}',1600,1900),(40,'Zirconium','Zr',4,5,91.2239990234,6.50600004196,23.3899993896,155,-1,148,2125.14990234,4682,0.277999997139,1.33000004292,6.63390016556,2,0,2,0,165,0,'{\'a1\': 17.876499, \'c\': 2.06929, \'b4\': 87.662697, \'a3\': 5.41732, \'a2\': 10.948, \'a4\': 3.65721, \'b2\': 11.916, \'b3\': 0.117622, \'b1\': 1.27618}',3400,2600);
/*!40000 ALTER TABLE `elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries`
--

DROP TABLE IF EXISTS `entries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries` (
  `id` int NOT NULL AUTO_INCREMENT,
  `path` varchar(255) NOT NULL,
  `label` varchar(20) DEFAULT NULL,
  `duplicate_of_id` int DEFAULT NULL,
  `delta_e` double DEFAULT NULL,
  `stability` double DEFAULT NULL,
  `composition_id` varchar(255) DEFAULT NULL,
  `reference_id` int DEFAULT NULL,
  `prototype_id` varchar(63) DEFAULT NULL,
  `ntypes` int DEFAULT NULL,
  `natoms` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `path` (`path`),
  KEY `entries_1a906e41` (`duplicate_of_id`),
  KEY `entries_2687c130` (`composition_id`),
  KEY `entries_171cbadd` (`reference_id`),
  KEY `entries_0836a46d` (`prototype_id`),
  CONSTRAINT `composition_id_refs_formula_26db5f9a` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `duplicate_of_id_refs_id_7c745d99` FOREIGN KEY (`duplicate_of_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `prototype_id_refs_name_c7f635a9` FOREIGN KEY (`prototype_id`) REFERENCES `prototypes` (`name`),
  CONSTRAINT `reference_id_refs_id_70d129dd` FOREIGN KEY (`reference_id`) REFERENCES `publications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1778002 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries`
--

LOCK TABLES `entries` WRITE;
/*!40000 ALTER TABLE `entries` DISABLE KEYS */;
INSERT INTO `entries` VALUES (6126,'/home/oqmd/libraries/icsd/31865','icsd-31865',6126,-3.31978205998463,NULL,'Ca1 O3 Ti1',4524,'CaTiO3',3,5);
/*!40000 ALTER TABLE `entries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_element_set`
--

DROP TABLE IF EXISTS `entries_element_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_element_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `element_id` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`,`element_id`),
  KEY `entries_element_set_e8d920b6` (`entry_id`),
  KEY `entries_element_set_00a8885a` (`element_id`),
  CONSTRAINT `element_id_refs_symbol_eed5b69b` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `entry_id_refs_id_74299bd4` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5986018 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_element_set`
--

LOCK TABLES `entries_element_set` WRITE;
/*!40000 ALTER TABLE `entries_element_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_element_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_meta_data`
--

DROP TABLE IF EXISTS `entries_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `metadata_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`,`metadata_id`),
  KEY `entries_meta_data_e8d920b6` (`entry_id`),
  KEY `entries_meta_data_a131f96d` (`metadata_id`),
  CONSTRAINT `entry_id_refs_id_96bd6e4d` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `metadata_id_refs_id_fe279d9f` FOREIGN KEY (`metadata_id`) REFERENCES `meta_data` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10110642 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_meta_data`
--

LOCK TABLES `entries_meta_data` WRITE;
/*!40000 ALTER TABLE `entries_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_project_set`
--

DROP TABLE IF EXISTS `entries_project_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_project_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `project_id` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`,`project_id`),
  KEY `entries_project_set_e8d920b6` (`entry_id`),
  KEY `entries_project_set_37952554` (`project_id`),
  CONSTRAINT `entry_id_refs_id_f123f545` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `project_id_refs_name_eac34d02` FOREIGN KEY (`project_id`) REFERENCES `projects` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1926459 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_project_set`
--

LOCK TABLES `entries_project_set` WRITE;
/*!40000 ALTER TABLE `entries_project_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_project_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `entries_species_set`
--

DROP TABLE IF EXISTS `entries_species_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entries_species_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int NOT NULL,
  `species_id` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `entry_id` (`entry_id`,`species_id`),
  KEY `entries_species_set_e8d920b6` (`entry_id`),
  KEY `entries_species_set_e1800d51` (`species_id`),
  CONSTRAINT `entry_id_refs_id_aaa398d2` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `species_id_refs_name_41c67a49` FOREIGN KEY (`species_id`) REFERENCES `species` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1513029 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entries_species_set`
--

LOCK TABLES `entries_species_set` WRITE;
/*!40000 ALTER TABLE `entries_species_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `entries_species_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expt_formation_energies`
--

DROP TABLE IF EXISTS `expt_formation_energies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `expt_formation_energies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `composition_id` varchar(255) DEFAULT NULL,
  `delta_e` double DEFAULT NULL,
  `delta_g` double DEFAULT NULL,
  `source` varchar(127) DEFAULT NULL,
  `dft` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `expt_formation_energies_2687c130` (`composition_id`),
  CONSTRAINT `composition_id_refs_formula_53ad3a38` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`)
) ENGINE=InnoDB AUTO_INCREMENT=6666 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expt_formation_energies`
--

LOCK TABLES `expt_formation_energies` WRITE;
/*!40000 ALTER TABLE `expt_formation_energies` DISABLE KEYS */;
/*!40000 ALTER TABLE `expt_formation_energies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fits`
--

DROP TABLE IF EXISTS `fits`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fits` (
  `name` varchar(255) NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fits`
--

LOCK TABLES `fits` WRITE;
/*!40000 ALTER TABLE `fits` DISABLE KEYS */;
/*!40000 ALTER TABLE `fits` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fits_dft`
--

DROP TABLE IF EXISTS `fits_dft`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fits_dft` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fit_id` varchar(255) NOT NULL,
  `calculation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fit_id` (`fit_id`,`calculation_id`),
  KEY `fits_dft_a433eb25` (`fit_id`),
  KEY `fits_dft_7ab90288` (`calculation_id`),
  CONSTRAINT `calculation_id_refs_id_1d930e1f` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `fit_id_refs_name_5f821af7` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=1732099 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fits_dft`
--

LOCK TABLES `fits_dft` WRITE;
/*!40000 ALTER TABLE `fits_dft` DISABLE KEYS */;
/*!40000 ALTER TABLE `fits_dft` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fits_elements`
--

DROP TABLE IF EXISTS `fits_elements`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fits_elements` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fit_id` varchar(255) NOT NULL,
  `element_id` varchar(9) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fit_id` (`fit_id`,`element_id`),
  KEY `fits_dft_a433eb25` (`fit_id`),
  KEY `fits_dft_7ab90288` (`element_id`)
) ENGINE=InnoDB AUTO_INCREMENT=6723 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fits_elements`
--

LOCK TABLES `fits_elements` WRITE;
/*!40000 ALTER TABLE `fits_elements` DISABLE KEYS */;
/*!40000 ALTER TABLE `fits_elements` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fits_experiments`
--

DROP TABLE IF EXISTS `fits_experiments`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `fits_experiments` (
  `id` int NOT NULL AUTO_INCREMENT,
  `fit_id` varchar(255) NOT NULL,
  `exptformationenergy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `fit_id` (`fit_id`,`exptformationenergy_id`),
  KEY `fits_experiments_a433eb25` (`fit_id`),
  KEY `fits_experiments_4e2d08d1` (`exptformationenergy_id`),
  CONSTRAINT `exptformationenergy_id_refs_id_04a39d9b` FOREIGN KEY (`exptformationenergy_id`) REFERENCES `expt_formation_energies` (`id`),
  CONSTRAINT `fit_id_refs_name_b9725a45` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=113705 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fits_experiments`
--

LOCK TABLES `fits_experiments` WRITE;
/*!40000 ALTER TABLE `fits_experiments` DISABLE KEYS */;
/*!40000 ALTER TABLE `fits_experiments` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation_energies`
--

DROP TABLE IF EXISTS `formation_energies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation_energies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `composition_id` varchar(255) DEFAULT NULL,
  `entry_id` int DEFAULT NULL,
  `calculation_id` int DEFAULT NULL,
  `description` varchar(20) DEFAULT NULL,
  `fit_id` varchar(255) DEFAULT NULL,
  `stability` double DEFAULT NULL,
  `delta_e` double DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `formation_energies_2687c130` (`composition_id`),
  KEY `formation_energies_e8d920b6` (`entry_id`),
  KEY `formation_energies_7ab90288` (`calculation_id`),
  KEY `formation_energies_a433eb25` (`fit_id`),
  CONSTRAINT `calculation_id_refs_id_aa80bd49` FOREIGN KEY (`calculation_id`) REFERENCES `calculations` (`id`),
  CONSTRAINT `composition_id_refs_formula_09c6e912` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `entry_id_refs_id_d1c3b231` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `fit_id_refs_name_a1979eda` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=6060326 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation_energies`
--

LOCK TABLES `formation_energies` WRITE;
/*!40000 ALTER TABLE `formation_energies` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation_energies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `formation_energies_equilibrium`
--

DROP TABLE IF EXISTS `formation_energies_equilibrium`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `formation_energies_equilibrium` (
  `id` int NOT NULL AUTO_INCREMENT,
  `from_formationenergy_id` int NOT NULL,
  `to_formationenergy_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `from_formationenergy_id` (`from_formationenergy_id`,`to_formationenergy_id`),
  KEY `formation_energies_equilibrium_9055fea7` (`from_formationenergy_id`),
  KEY `formation_energies_equilibrium_923546a0` (`to_formationenergy_id`),
  CONSTRAINT `from_formationenergy_id_refs_id_0d1617f3` FOREIGN KEY (`from_formationenergy_id`) REFERENCES `formation_energies` (`id`),
  CONSTRAINT `to_formationenergy_id_refs_id_0d1617f3` FOREIGN KEY (`to_formationenergy_id`) REFERENCES `formation_energies` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `formation_energies_equilibrium`
--

LOCK TABLES `formation_energies_equilibrium` WRITE;
/*!40000 ALTER TABLE `formation_energies_equilibrium` DISABLE KEYS */;
/*!40000 ALTER TABLE `formation_energies_equilibrium` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_analytics`
--

DROP TABLE IF EXISTS `google_analytics_analytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `google_analytics_analytics` (
  `id` int NOT NULL AUTO_INCREMENT,
  `site_id` int NOT NULL,
  `analytics_code` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `google_analytics_analytics_99732b5c` (`site_id`),
  CONSTRAINT `site_id_refs_id_96eae1d7` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_analytics`
--

LOCK TABLES `google_analytics_analytics` WRITE;
/*!40000 ALTER TABLE `google_analytics_analytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_analytics_analytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `google_analytics_googleanalytics`
--

DROP TABLE IF EXISTS `google_analytics_googleanalytics`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `google_analytics_googleanalytics` (
  `site_id` int NOT NULL,
  `web_property_id` varchar(15) NOT NULL,
  PRIMARY KEY (`site_id`),
  CONSTRAINT `site_id_refs_id_c4e577db` FOREIGN KEY (`site_id`) REFERENCES `django_site` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `google_analytics_googleanalytics`
--

LOCK TABLES `google_analytics_googleanalytics` WRITE;
/*!40000 ALTER TABLE `google_analytics_googleanalytics` DISABLE KEYS */;
/*!40000 ALTER TABLE `google_analytics_googleanalytics` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hosts`
--

DROP TABLE IF EXISTS `hosts`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hosts` (
  `name` varchar(63) NOT NULL,
  `ip_address` char(15) DEFAULT NULL,
  `hostname` varchar(255) NOT NULL,
  `binaries` longtext NOT NULL,
  `ppn` int NOT NULL,
  `nodes` int NOT NULL,
  `walltime` int NOT NULL,
  `sub_script` varchar(120) NOT NULL,
  `sub_text` longtext NOT NULL,
  `check_queue` varchar(180) NOT NULL,
  `checked_time` datetime NOT NULL,
  `running` longtext NOT NULL,
  `state` int NOT NULL,
  `utilization` int DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hosts`
--

LOCK TABLES `hosts` WRITE;
/*!40000 ALTER TABLE `hosts` DISABLE KEYS */;
/*!40000 ALTER TABLE `hosts` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubbard_corrections`
--

DROP TABLE IF EXISTS `hubbard_corrections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hubbard_corrections` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` varchar(9) NOT NULL,
  `value` double NOT NULL,
  `fit_id` varchar(255) DEFAULT NULL,
  `hubbard_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `hubbard_corrections_00a8885a` (`element_id`),
  KEY `hubbard_corrections_a433eb25` (`fit_id`),
  CONSTRAINT `element_id_refs_symbol_c0af3ee3` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `fit_id_refs_name_1ddaf49f` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=398 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubbard_corrections`
--

LOCK TABLES `hubbard_corrections` WRITE;
/*!40000 ALTER TABLE `hubbard_corrections` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubbard_corrections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `hubbards`
--

DROP TABLE IF EXISTS `hubbards`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `hubbards` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` varchar(9) NOT NULL,
  `convention` varchar(20) NOT NULL,
  `ox` double DEFAULT NULL,
  `ligand_id` varchar(9) DEFAULT NULL,
  `u` double NOT NULL,
  `l` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `hubbards_00a8885a` (`element_id`),
  KEY `hubbards_7be0c58b` (`ligand_id`),
  CONSTRAINT `element_id_refs_symbol_abe8c1cb` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `ligand_id_refs_symbol_abe8c1cb` FOREIGN KEY (`ligand_id`) REFERENCES `elements` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=207 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `hubbards`
--

LOCK TABLES `hubbards` WRITE;
/*!40000 ALTER TABLE `hubbards` DISABLE KEYS */;
/*!40000 ALTER TABLE `hubbards` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `jobs`
--

DROP TABLE IF EXISTS `jobs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `jobs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `qid` int NOT NULL,
  `walltime` datetime NOT NULL,
  `path` varchar(200) NOT NULL,
  `run_path` varchar(200) NOT NULL,
  `ncpus` int NOT NULL,
  `created` datetime NOT NULL,
  `finished` datetime DEFAULT NULL,
  `state` int NOT NULL,
  `task_id` int NOT NULL,
  `entry_id` int NOT NULL,
  `account_id` int NOT NULL,
  `allocation_id` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `jobs_ef96c3b8` (`task_id`),
  KEY `jobs_e8d920b6` (`entry_id`),
  KEY `jobs_93025c2f` (`account_id`),
  KEY `jobs_427ae6a3` (`allocation_id`),
  CONSTRAINT `account_id_refs_id_4f6c9c2d` FOREIGN KEY (`account_id`) REFERENCES `accounts` (`id`),
  CONSTRAINT `allocation_id_refs_name_a63733e0` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`name`),
  CONSTRAINT `entry_id_refs_id_7436599e` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `task_id_refs_id_8e2f14be` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3266266 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `jobs`
--

LOCK TABLES `jobs` WRITE;
/*!40000 ALTER TABLE `jobs` DISABLE KEYS */;
/*!40000 ALTER TABLE `jobs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `journals`
--

DROP TABLE IF EXISTS `journals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `journals` (
  `id` int NOT NULL AUTO_INCREMENT,
  `code` varchar(10) DEFAULT NULL,
  `name` longtext,
  PRIMARY KEY (`id`),
  UNIQUE KEY `code` (`code`)
) ENGINE=InnoDB AUTO_INCREMENT=1482 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `journals`
--

LOCK TABLES `journals` WRITE;
/*!40000 ALTER TABLE `journals` DISABLE KEYS */;
INSERT INTO `journals` VALUES (184,'NOGTAO','Norsk Geologisk Tidsskrift');
/*!40000 ALTER TABLE `journals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `keyword`
--

DROP TABLE IF EXISTS `keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `keyword` (
  `id` int NOT NULL AUTO_INCREMENT,
  `keyword` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci DEFAULT NULL,
  PRIMARY KEY (`id` DESC) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `keyword`
--

LOCK TABLES `keyword` WRITE;
/*!40000 ALTER TABLE `keyword` DISABLE KEYS */;
/*!40000 ALTER TABLE `keyword` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `meta_data`
--

DROP TABLE IF EXISTS `meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `type` varchar(15) NOT NULL,
  `value` text,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=84237 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `meta_data`
--

LOCK TABLES `meta_data` WRITE;
/*!40000 ALTER TABLE `meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `operations`
--

DROP TABLE IF EXISTS `operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `operations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `rotation_id` int NOT NULL,
  `translation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `operations_359b5574` (`rotation_id`),
  KEY `operations_92be99ab` (`translation_id`),
  CONSTRAINT `rotation_id_refs_id_f107b660` FOREIGN KEY (`rotation_id`) REFERENCES `rotations` (`id`),
  CONSTRAINT `translation_id_refs_id_a3d535f8` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=931299 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `operations`
--

LOCK TABLES `operations` WRITE;
/*!40000 ALTER TABLE `operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pktable`
--

DROP TABLE IF EXISTS `pktable`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pktable` (
  `id` int NOT NULL AUTO_INCREMENT,
  `p_id` int NOT NULL,
  `k_id` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10547 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pktable`
--

LOCK TABLES `pktable` WRITE;
/*!40000 ALTER TABLE `pktable` DISABLE KEYS */;
/*!40000 ALTER TABLE `pktable` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects`
--

DROP TABLE IF EXISTS `projects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects` (
  `name` varchar(63) NOT NULL,
  `priority` int NOT NULL,
  `state` int NOT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects`
--

LOCK TABLES `projects` WRITE;
/*!40000 ALTER TABLE `projects` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_allocations`
--

DROP TABLE IF EXISTS `projects_allocations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_allocations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` varchar(63) NOT NULL,
  `allocation_id` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`allocation_id`),
  KEY `projects_allocations_37952554` (`project_id`),
  KEY `projects_allocations_427ae6a3` (`allocation_id`),
  CONSTRAINT `allocation_id_refs_name_40a6915a` FOREIGN KEY (`allocation_id`) REFERENCES `allocations` (`name`),
  CONSTRAINT `project_id_refs_name_4ad0e998` FOREIGN KEY (`project_id`) REFERENCES `projects` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=11236 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_allocations`
--

LOCK TABLES `projects_allocations` WRITE;
/*!40000 ALTER TABLE `projects_allocations` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_allocations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `projects_users`
--

DROP TABLE IF EXISTS `projects_users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `projects_users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `project_id` varchar(63) NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `project_id` (`project_id`,`user_id`),
  KEY `projects_users_37952554` (`project_id`),
  KEY `projects_users_6340c63c` (`user_id`),
  CONSTRAINT `project_id_refs_name_04440906` FOREIGN KEY (`project_id`) REFERENCES `projects` (`name`),
  CONSTRAINT `user_id_refs_id_6fdf9928` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3750 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `projects_users`
--

LOCK TABLES `projects_users` WRITE;
/*!40000 ALTER TABLE `projects_users` DISABLE KEYS */;
/*!40000 ALTER TABLE `projects_users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prototypes`
--

DROP TABLE IF EXISTS `prototypes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prototypes` (
  `name` varchar(63) NOT NULL,
  `structure_id` int DEFAULT NULL,
  `composition_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `prototypes_95d4059a` (`structure_id`),
  KEY `prototypes_2687c130` (`composition_id`),
  CONSTRAINT `composition_id_refs_formula_4cbde6d3` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `structure_id_refs_id_8545c5c6` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prototypes`
--

LOCK TABLES `prototypes` WRITE;
/*!40000 ALTER TABLE `prototypes` DISABLE KEYS */;
INSERT INTO `prototypes` VALUES ('CaTiO3',NULL,NULL);
/*!40000 ALTER TABLE `prototypes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications`
--

DROP TABLE IF EXISTS `publications`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications` (
  `id` int NOT NULL AUTO_INCREMENT,
  `journal_id` int DEFAULT NULL,
  `title` longtext,
  `page_first` int DEFAULT NULL,
  `page_last` int DEFAULT NULL,
  `year` int DEFAULT NULL,
  `volume` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `publications_b050c2da` (`journal_id`),
  CONSTRAINT `journal_id_refs_id_6a231cce` FOREIGN KEY (`journal_id`) REFERENCES `journals` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=221221 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications`
--

LOCK TABLES `publications` WRITE;
/*!40000 ALTER TABLE `publications` DISABLE KEYS */;
INSERT INTO `publications` VALUES (4524,184,'Die Kristallstruktur von Perowskit und verwandter Verbindungen',NULL,NULL,1925,8);
/*!40000 ALTER TABLE `publications` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `publications_author_set`
--

DROP TABLE IF EXISTS `publications_author_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `publications_author_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `reference_id` int NOT NULL,
  `author_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `reference_id` (`reference_id`,`author_id`),
  KEY `publications_author_set_171cbadd` (`reference_id`),
  KEY `publications_author_set_e969df21` (`author_id`),
  CONSTRAINT `author_id_refs_id_4e2c9783` FOREIGN KEY (`author_id`) REFERENCES `authors` (`id`),
  CONSTRAINT `reference_id_refs_id_218304dd` FOREIGN KEY (`reference_id`) REFERENCES `publications` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=804662 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `publications_author_set`
--

LOCK TABLES `publications_author_set` WRITE;
/*!40000 ALTER TABLE `publications_author_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `publications_author_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `reference_energies`
--

DROP TABLE IF EXISTS `reference_energies`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `reference_energies` (
  `id` int NOT NULL AUTO_INCREMENT,
  `element_id` varchar(9) NOT NULL,
  `value` double NOT NULL,
  `fit_id` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `reference_energies_00a8885a` (`element_id`),
  KEY `reference_energies_a433eb25` (`fit_id`),
  CONSTRAINT `element_id_refs_symbol_54e7fff0` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `fit_id_refs_name_355ca9b5` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=5514 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `reference_energies`
--

LOCK TABLES `reference_energies` WRITE;
/*!40000 ALTER TABLE `reference_energies` DISABLE KEYS */;
/*!40000 ALTER TABLE `reference_energies` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `rotations`
--

DROP TABLE IF EXISTS `rotations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `rotations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `a11` double NOT NULL,
  `a12` double NOT NULL,
  `a13` double NOT NULL,
  `a21` double NOT NULL,
  `a22` double NOT NULL,
  `a23` double NOT NULL,
  `a31` double NOT NULL,
  `a32` double NOT NULL,
  `a33` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=620 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `rotations`
--

LOCK TABLES `rotations` WRITE;
/*!40000 ALTER TABLE `rotations` DISABLE KEYS */;
/*!40000 ALTER TABLE `rotations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sites`
--

DROP TABLE IF EXISTS `sites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int DEFAULT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `wyckoff_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `sites_95d4059a` (`structure_id`),
  KEY `sites_93c9467c` (`wyckoff_id`)
) ENGINE=InnoDB AUTO_INCREMENT=128001046 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sites`
--

LOCK TABLES `sites` WRITE;
/*!40000 ALTER TABLE `sites` DISABLE KEYS */;
INSERT INTO `sites` VALUES (18732076,81276,0.5,0.5,0.5,1628),(18732077,81276,0.5,0,0,1630),(18732078,81276,0,0.5,0,1630),(18732079,81276,0,0,0.5,1630),(18732080,81276,0,0,0,1626),(18732094,81278,0.499999937353159,0.499999937353159,0.499999937353159,1628),(18732095,81278,0.499999937353159,0,0,1630),(18732096,81278,0,0.499999937353159,0,1630),(18732097,81278,0,0,0.499999937353159,1630),(18732098,81278,0,0,0,1626),(18732103,81274,0.500001203963955,0.500001203963955,0.500001203963955,1628),(18732104,81274,0.500001203963955,0,0,1630),(18732105,81274,0,0.500001203963955,0,1630),(18732106,81274,0,0,0.500001203963955,1630),(18732107,81274,0,0,0,1626);
/*!40000 ALTER TABLE `sites` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spacegroups`
--

DROP TABLE IF EXISTS `spacegroups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spacegroups` (
  `number` int NOT NULL,
  `hm` varchar(30) DEFAULT NULL,
  `hall` varchar(30) DEFAULT NULL,
  `pearson` varchar(30) NOT NULL,
  `schoenflies` varchar(30) NOT NULL,
  `lattice_system` varchar(20) NOT NULL,
  `centrosymmetric` tinyint(1) NOT NULL,
  PRIMARY KEY (`number`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spacegroups`
--

LOCK TABLES `spacegroups` WRITE;
/*!40000 ALTER TABLE `spacegroups` DISABLE KEYS */;
INSERT INTO `spacegroups` VALUES (1,'P1','P 1','','C1^1','Triclinic',0),(2,'P-1','-P 1','','Ci^1','Triclinic',0),(3,'P2','P 2y','','C2^1','Monoclinic',0),(4,'P21','P 2yb','','C2^2','Monoclinic',0),(5,'C2','C 2y','','C2^3','Monoclinic',0),(6,'Pm','P -2y','','Cs^1','Monoclinic',0),(7,'Pc','P -2yc','','Cs^2','Monoclinic',0),(8,'Cm','C -2y','','Cs^3','Monoclinic',0),(9,'Cc','C -2yc','','Cs^4','Monoclinic',0),(10,'P2/m','-P 2y','','C2h^1','Monoclinic',0),(11,'P21/m','-P 2yb','','C2h^2','Monoclinic',0),(12,'C2/m','-C 2y','','C2h^3','Monoclinic',0),(13,'P2/c','-P 2yc','','C2h^4','Monoclinic',0),(14,'P21/c','-P 2ybc','','C2h^5','Monoclinic',0),(15,'C2/c','-C 2yc','','C2h^6','Monoclinic',0),(16,'P222','P 2 2','','D2^1','Orthorhombic',0),(17,'P2221','P 2c 2','','D2^2','Orthorhombic',0),(18,'P21212','P 2 2ab','','D2^3','Orthorhombic',0),(19,'P212121','P 2ac 2ab','','D2^4','Orthorhombic',0),(20,'C2221','C 2c 2','','D2^5','Orthorhombic',0),(21,'C222','C 2 2','','D2^6','Orthorhombic',0),(22,'F222','F 2 2','','D2^7','Orthorhombic',0),(23,'I222','I 2 2','','D2^8','Orthorhombic',0),(24,'I212121','I 2b 2c','','D2^9','Orthorhombic',0),(25,'Pmm2','P 2 -2','','C2v^1','Orthorhombic',0),(26,'Pmc21','P 2c -2','','C2v^2','Orthorhombic',0),(27,'Pcc2','P 2 -2c','','C2v^3','Orthorhombic',0),(28,'Pma2','P 2 -2a','','C2v^4','Orthorhombic',0),(29,'Pca21','P 2c -2ac','','C2v^5','Orthorhombic',0),(30,'Pnc2','P 2 -2bc','','C2v^6','Orthorhombic',0),(31,'Pmn21','P 2ac -2','','C2v^7','Orthorhombic',0),(32,'Pba2','P 2 -2ab','','C2v^8','Orthorhombic',0),(33,'Pna21','P 2c -2n','','C2v^9','Orthorhombic',0),(34,'Pnn2','P 2 -2n','','C2v^10','Orthorhombic',0),(35,'Cmm2','C 2 -2','','C2v^11','Orthorhombic',0),(36,'Cmc21','C 2c -2','','C2v^12','Orthorhombic',0),(37,'Ccc2','C 2 -2c','','C2v^13','Orthorhombic',0),(38,'Amm2','A 2 -2','','C2v^14','Orthorhombic',0),(39,'Abm2','A 2 -2c','','C2v^15','Orthorhombic',0),(40,'Ama2','A 2 -2a','','C2v^16','Orthorhombic',0),(41,'Aba2','A 2 -2ac','','C2v^17','Orthorhombic',0),(42,'Fmm2','F 2 -2','','C2v^18','Orthorhombic',0),(43,'Fdd2','F 2 -2d','','C2v^19','Orthorhombic',0),(44,'Imm2','I 2 -2','','C2v^20','Orthorhombic',0),(45,'Iba2','I 2 -2c','','C2v^21','Orthorhombic',0),(46,'Ima2','I 2 -2a','','C2v^22','Orthorhombic',0),(47,'Pmmm','-P 2 2','','D2h^1','Orthorhombic',0),(48,'Pnnn','P 2 2 -1n','','D2h^2','Orthorhombic',0),(49,'Pccm','-P 2 2c','','D2h^3','Orthorhombic',0),(50,'Pban','P 2 2 -1ab','','D2h^4','Orthorhombic',0),(51,'Pmma','-P 2a 2a','','D2h^5','Orthorhombic',0),(52,'Pnna','-P 2a 2bc','','D2h^6','Orthorhombic',0),(53,'Pmna','-P 2ac 2','','D2h^7','Orthorhombic',0),(54,'Pcca','-P 2a 2ac','','D2h^8','Orthorhombic',0),(55,'Pbam','-P 2 2ab','','D2h^9','Orthorhombic',0),(56,'Pccn','-P 2ab 2ac','','D2h^10','Orthorhombic',0),(57,'Pbcm','-P 2c 2b','','D2h^11','Orthorhombic',0),(58,'Pnnm','-P 2 2n','','D2h^12','Orthorhombic',0),(59,'Pmmn','P 2 2ab -1ab','','D2h^13','Orthorhombic',0),(60,'Pbcn','-P 2n 2ab','','D2h^14','Orthorhombic',0),(61,'Pbca','-P 2ac 2ab','','D2h^15','Orthorhombic',0),(62,'Pnma','-P 2ac 2n','','D2h^16','Orthorhombic',0),(63,'Cmcm','-C 2c 2','','D2h^17','Orthorhombic',0),(64,'Cmca','-C 2bc 2','','D2h^18','Orthorhombic',0),(65,'Cmmm','-C 2 2','','D2h^19','Orthorhombic',0),(66,'Cccm','-C 2 2c','','D2h^20','Orthorhombic',0),(67,'Cmma','-C 2b 2','','D2h^21','Orthorhombic',0),(68,'Ccca','C 2 2 -1bc','','D2h^22','Orthorhombic',0),(69,'Fmmm','-F 2 2','','D2h^23','Orthorhombic',0),(70,'Fddd','F 2 2 -1d','','D2h^24','Orthorhombic',0),(71,'Immm','-I 2 2','','D2h^25','Orthorhombic',0),(72,'Ibam','-I 2 2c','','D2h^26','Orthorhombic',0),(73,'Ibca','-I 2b 2c','','D2h^27','Orthorhombic',0),(74,'Imma','-I 2b 2','','D2h^28','Orthorhombic',0),(75,'P4','P 4','','C4^1','Tetragonal',0),(76,'P41','P 4w','','C4^2','Tetragonal',0),(77,'P42','P 4c','','C4^3','Tetragonal',0),(78,'P43','P 4cw','','C4^4','Tetragonal',0),(79,'I4','I 4','','C4^5','Tetragonal',0),(80,'I41','I 4bw','','C4^6','Tetragonal',0),(81,'P-4','P -4','','S4^1','Tetragonal',0),(82,'I-4','I -4','','S4^2','Tetragonal',0),(83,'P4/m','-P 4','','C4h^1','Tetragonal',0),(84,'P42/m','-P 4c','','C4h^2','Tetragonal',0),(85,'P4/n','P 4ab -1ab','','C4h^3','Tetragonal',0),(86,'P42/n','P 4n -1n','','C4h^4','Tetragonal',0),(87,'I4/m','-I 4','','C4h^5','Tetragonal',0),(88,'I41/a','I 4bw -1bw','','C4h^6','Tetragonal',0),(89,'P422','P 4 2','','D4^1','Tetragonal',0),(90,'P4212','P 4ab 2ab','','D4^2','Tetragonal',0),(91,'P4122','P 4w 2c','','D4^3','Tetragonal',0),(92,'P41212','P 4abw 2nw','','D4^4','Tetragonal',0),(93,'P4222','P 4c 2','','D4^5','Tetragonal',0),(94,'P42212','P 4n 2n','','D4^6','Tetragonal',0),(95,'P4322','P 4cw 2c','','D4^7','Tetragonal',0),(96,'P43212','P 4nw 2abw','','D4^8','Tetragonal',0),(97,'I422','I 4 2','','D4^9','Tetragonal',0),(98,'I4122','I 4bw 2bw','','D4^10','Tetragonal',0),(99,'P4mm','P 4 -2','','C4v^1','Tetragonal',0),(100,'P4bm','P 4 -2ab','','C4v^2','Tetragonal',0),(101,'P42cm','P 4c -2c','','C4v^3','Tetragonal',0),(102,'P42nm','P 4n -2n','','C4v^4','Tetragonal',0),(103,'P4cc','P 4 -2c','','C4v^5','Tetragonal',0),(104,'P4nc','P 4 -2n','','C4v^6','Tetragonal',0),(105,'P42mc','P 4c -2','','C4v^7','Tetragonal',0),(106,'P42bc','P 4c -2ab','','C4v^8','Tetragonal',0),(107,'I4mm','I 4 -2','','C4v^9','Tetragonal',0),(108,'I4cm','I 4 -2c','','C4v^10','Tetragonal',0),(109,'I41md','I 4bw -2','','C4v^11','Tetragonal',0),(110,'I41cd','I 4bw -2c','','C4v^12','Tetragonal',0),(111,'P-42m','P -4 2','','D2d^1','Tetragonal',0),(112,'P-42c','P -4 2c','','D2d^2','Tetragonal',0),(113,'P-421m','P -4 2ab','','D2d^3','Tetragonal',0),(114,'P-421c','P -4 2n','','D2d^4','Tetragonal',0),(115,'P-4m2','P -4 -2','','D2d^5','Tetragonal',0),(116,'P-4c2','P -4 -2c','','D2d^6','Tetragonal',0),(117,'P-4b2','P -4 -2ab','','D2d^7','Tetragonal',0),(118,'P-4n2','P -4 -2n','','D2d^8','Tetragonal',0),(119,'I-4m2','I -4 -2','','D2d^9','Tetragonal',0),(120,'I-4c2','I -4 -2c','','D2d^10','Tetragonal',0),(121,'I-42m','I -4 2','','D2d^11','Tetragonal',0),(122,'I-42d','I -4 2bw','','D2d^12','Tetragonal',0),(123,'P4/mmm','-P 4 2','','D4h^1','Tetragonal',0),(124,'P4/mcc','-P 4 2c','','D4h^2','Tetragonal',0),(125,'P4/nbm','P 4 2 -1ab','','D4h^3','Tetragonal',0),(126,'P4/nnc','P 4 2 -1n','','D4h^4','Tetragonal',0),(127,'P4/mbm','-P 4 2ab','','D4h^5','Tetragonal',0),(128,'P4/mnc','-P 4 2n','','D4h^6','Tetragonal',0),(129,'P4/nmm','P 4ab 2ab -1ab','','D4h^7','Tetragonal',0),(130,'P4/ncc','P 4ab 2n -1ab','','D4h^8','Tetragonal',0),(131,'P42/mmc','-P 4c 2','','D4h^9','Tetragonal',0),(132,'P42/mcm','-P 4c 2c','','D4h^10','Tetragonal',0),(133,'P42/nbc','P 4n 2c -1n','','D4h^11','Tetragonal',0),(134,'P42/nnm','P 4n 2 -1n','','D4h^12','Tetragonal',0),(135,'P42/mbc','-P 4c 2ab','','D4h^13','Tetragonal',0),(136,'P42/mnm','-P 4n 2n','','D4h^14','Tetragonal',0),(137,'P42/nmc','P 4n 2n -1n','','D4h^15','Tetragonal',0),(138,'P42/ncm','P 4n 2ab -1n','','D4h^16','Tetragonal',0),(139,'I4/mmm','-I 4 2','','D4h^17','Tetragonal',0),(140,'I4/mcm','-I 4 2c','','D4h^18','Tetragonal',0),(141,'I41/amd','I 4bw 2bw -1bw','','D4h^19','Tetragonal',0),(142,'I41/acd','I 4bw 2aw -1bw','','D4h^20','Tetragonal',0),(143,'P3','P 3','','C3^1','Hexagonal',0),(144,'P31','P 31','','C3^2','Hexagonal',0),(145,'P32','P 32','','C3^3','Hexagonal',0),(146,'R3','R 3','','C3^4','Hexagonal',0),(147,'P-3','-P 3','','C3i^1','Hexagonal',0),(148,'R-3','-R 3','','C3i^2','Hexagonal',0),(149,'P312','P 3 2','','D3^1','Hexagonal',0),(150,'P321','P 3 2\"','','D3^2','Hexagonal',0),(151,'P3112','P 31 2c (0 0 1)','','D3^3','Hexagonal',0),(152,'P3121','P 31 2\"','','D3^4','Hexagonal',0),(153,'P3212','P 32 2c (0 0 -1)','','D3^5','Hexagonal',0),(154,'P3221','P 32 2\"','','D3^6','Hexagonal',0),(155,'R32','R 3 2\"','','D3^7','Hexagonal',0),(156,'P3m1','P 3 -2\"','','C3v^1','Hexagonal',0),(157,'P31m','P 3 -2','','C3v^2','Hexagonal',0),(158,'P3c1','P 3 -2\"c','','C3v^3','Hexagonal',0),(159,'P31c','P 3 -2c','','C3v^4','Hexagonal',0),(160,'R3m','R 3 -2\"','','C3v^5','Hexagonal',0),(161,'R3c','R 3 -2\"c','','C3v^6','Hexagonal',0),(162,'P-31m','-P 3 2','','D3d^1','Hexagonal',0),(163,'P-31c','-P 3 2c','','D3d^2','Hexagonal',0),(164,'P-3m1','-P 3 2\"','','D3d^3','Hexagonal',0),(165,'P-3c1','-P 3 2\"c','','D3d^4','Hexagonal',0),(166,'R-3m','-R 3 2\"','','D3d^5','Hexagonal',0),(167,'R-3c','-R 3 2\"c','','D3d^6','Hexagonal',0),(168,'P6','P 6','','C6^1','Hexagonal',0),(169,'P61','P 61','','C6^2','Hexagonal',0),(170,'P65','P 65','','C6^3','Hexagonal',0),(171,'P62','P 62','','C6^4','Hexagonal',0),(172,'P64','P 64','','C6^5','Hexagonal',0),(173,'P63','P 6c','','C6^6','Hexagonal',0),(174,'P-6','P -6','','C3h^1','Hexagonal',0),(175,'P6/m','-P 6','','C6h^1','Hexagonal',0),(176,'P63/m','-P 6c','','C6h^3','Hexagonal',0),(177,'P622','P 6 2','','D6^1','Hexagonal',0),(178,'P6122','P 61 2 (0 0 -1)','','D6^2','Hexagonal',0),(179,'P6522','P 65 2 (0 0 1)','','D6^3','Hexagonal',0),(180,'P6222','P 62 2c (0 0 1)','','D6^4','Hexagonal',0),(181,'P6422','P 64 2c (0 0 -1)','','D6^5','Hexagonal',0),(182,'P6322','P 6c 2c','','D6^6','Hexagonal',0),(183,'P6mm','P 6 -2','','C6v^1','Hexagonal',0),(184,'P6cc','P 6 -2c','','C6v^2','Hexagonal',0),(185,'P63cm','P 6c -2','','C6v^3','Hexagonal',0),(186,'P63mc','P 6c -2c','','C6v^4','Hexagonal',0),(187,'P-6m2','P -6 2','','D3h^1','Hexagonal',0),(188,'P-6c2','P -6c 2','','D3h^2','Hexagonal',0),(189,'P-62m','P -6 -2','','D3h^3','Hexagonal',0),(190,'P-62c','P -6c -2c','','D3h^4','Hexagonal',0),(191,'P6/mmm','-P 6 2','','D6h^1','Hexagonal',0),(192,'P6/mcc','-P 6 2c','','D6h^2','Hexagonal',0),(193,'P63/mcm','-P 6c 2','','D6h^3','Hexagonal',0),(194,'P63/mmc','-P 6c 2c','','D6h^4','Hexagonal',0),(195,'P23','P 2 2 3','','T^1','Cubic',0),(196,'F23','F 2 2 3','','T^3','Cubic',0),(197,'I23','I 2 2 3','','T^3','Cubic',0),(198,'P213','P 2ac 2ab 3','','T^4','Cubic',0),(199,'I213','I 2b 2c 3','','T^5','Cubic',0),(200,'Pm-3','-P 2 2 3','','Th^1','Cubic',0),(201,'Pn-3','P 2 2 3 -1n','','Th^2','Cubic',0),(202,'Fm-3','-F 2 2 3','','Th^3','Cubic',0),(203,'Fd-3','F 2 2 3 -1d','','Th^4','Cubic',0),(204,'Im-3','-I 2 2 3','','Th^5','Cubic',0),(205,'Pa-3','-P 2ac 2ab 3','','Th^6','Cubic',0),(206,'Ia-3','-I 2b 2c 3','','Th^7','Cubic',0),(207,'P432','P 4 2 3','','O^1','Cubic',0),(208,'P4232','P 4n 2 3','','O^2','Cubic',0),(209,'F432','F 4 2 3','','O^3','Cubic',0),(210,'F4132','F 4d 2 3','','O^4','Cubic',0),(211,'I432','I 4 2 3','','O^5','Cubic',0),(212,'P4332','P 4acd 2ab 3','','O^6','Cubic',0),(213,'P4132','P 4bd 2ab 3','','O^7','Cubic',0),(214,'I4132','I 4bd 2c 3','','O^8','Cubic',0),(215,'P-43m','P -4 2 3','','Td^1','Cubic',0),(216,'F-43m','F -4 2 3','','Td^2','Cubic',0),(217,'I-43m','I -4 2 3','','Td^3','Cubic',0),(218,'P-43n','P -4n 2 3','','Td^4','Cubic',0),(219,'F-43c','F -4c 2 3','','Td^5','Cubic',0),(220,'I-43d','I -4bd 2c 3','','Td^6','Cubic',0),(221,'Pm-3m','-P 4 2 3','','Oh^1','Cubic',0),(222,'Pn-3n','P 4 2 3 -1n','','Oh^2','Cubic',0),(223,'Pm-3n','-P 4n 2 3','','Oh^3','Cubic',0),(224,'Pn-3m','P 4n 2 3 -1n','','Oh^4','Cubic',0),(225,'Fm-3m','-F 4 2 3','','Oh^5','Cubic',0),(226,'Fm-3c','-F 4c 2 3','','Oh^6','Cubic',0),(227,'Fd-3m','F 4d 2 3 -1d','','Oh^7','Cubic',0),(228,'Fd-3c','F 4d 2 3 -1cd','','Oh^8','Cubic',0),(229,'Im-3m','-I 4 2 3','','Oh^9','Cubic',0),(230,'Ia-3d','-I 4bd 2c 3','','Oh^10','Cubic',0);
/*!40000 ALTER TABLE `spacegroups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spacegroups_centering_vectors`
--

DROP TABLE IF EXISTS `spacegroups_centering_vectors`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spacegroups_centering_vectors` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spacegroup_id` int NOT NULL,
  `translation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spacegroup_id` (`spacegroup_id`,`translation_id`),
  KEY `spacegroups_centering_vectors_15137c52` (`spacegroup_id`),
  KEY `spacegroups_centering_vectors_92be99ab` (`translation_id`),
  CONSTRAINT `spacegroup_id_refs_number_ed89d240` FOREIGN KEY (`spacegroup_id`) REFERENCES `spacegroups` (`number`),
  CONSTRAINT `translation_id_refs_id_14dcd295` FOREIGN KEY (`translation_id`) REFERENCES `translations` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=351 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spacegroups_centering_vectors`
--

LOCK TABLES `spacegroups_centering_vectors` WRITE;
/*!40000 ALTER TABLE `spacegroups_centering_vectors` DISABLE KEYS */;
/*!40000 ALTER TABLE `spacegroups_centering_vectors` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `spacegroups_operations`
--

DROP TABLE IF EXISTS `spacegroups_operations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `spacegroups_operations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spacegroup_id` int NOT NULL,
  `operation_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `spacegroup_id` (`spacegroup_id`,`operation_id`),
  KEY `spacegroups_operations_15137c52` (`spacegroup_id`),
  KEY `spacegroups_operations_ba874c5c` (`operation_id`),
  CONSTRAINT `operation_id_refs_id_6017a271` FOREIGN KEY (`operation_id`) REFERENCES `operations` (`id`),
  CONSTRAINT `spacegroup_id_refs_number_caa05a5d` FOREIGN KEY (`spacegroup_id`) REFERENCES `spacegroups` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=2610 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `spacegroups_operations`
--

LOCK TABLES `spacegroups_operations` WRITE;
/*!40000 ALTER TABLE `spacegroups_operations` DISABLE KEYS */;
/*!40000 ALTER TABLE `spacegroups_operations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `species`
--

DROP TABLE IF EXISTS `species`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `species` (
  `name` varchar(8) NOT NULL,
  `element_id` varchar(9) DEFAULT NULL,
  `ox` double DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `species_00a8885a` (`element_id`),
  CONSTRAINT `element_id_refs_symbol_9a37629b` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `species`
--

LOCK TABLES `species` WRITE;
/*!40000 ALTER TABLE `species` DISABLE KEYS */;
/*!40000 ALTER TABLE `species` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures`
--

DROP TABLE IF EXISTS `structures`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures` (
  `id` int NOT NULL AUTO_INCREMENT,
  `entry_id` int DEFAULT NULL,
  `reference_id` int DEFAULT NULL,
  `label` varchar(63) DEFAULT '',
  `prototype_id` varchar(63) DEFAULT NULL,
  `measured` tinyint(1) NOT NULL,
  `composition_id` varchar(255) DEFAULT NULL,
  `natoms` int DEFAULT NULL,
  `nsites` int DEFAULT NULL,
  `ntypes` int DEFAULT NULL,
  `x1` double NOT NULL,
  `x2` double NOT NULL,
  `x3` double NOT NULL,
  `y1` double NOT NULL,
  `y2` double NOT NULL,
  `y3` double NOT NULL,
  `z1` double NOT NULL,
  `z2` double NOT NULL,
  `z3` double NOT NULL,
  `sxx` double NOT NULL,
  `syy` double NOT NULL,
  `szz` double NOT NULL,
  `sxy` double NOT NULL,
  `syz` double NOT NULL,
  `szx` double NOT NULL,
  `spacegroup_id` int DEFAULT NULL,
  `energy` double DEFAULT NULL,
  `energy_pa` double DEFAULT NULL,
  `magmom` double DEFAULT NULL,
  `magmom_pa` double DEFAULT NULL,
  `delta_e` double DEFAULT NULL,
  `meta_stability` double DEFAULT NULL,
  `fit_id` varchar(255) DEFAULT NULL,
  `volume` float DEFAULT NULL,
  `volume_pa` float DEFAULT NULL,
  `coords` longtext,
  PRIMARY KEY (`id`),
  KEY `structures_e8d920b6` (`entry_id`),
  KEY `structures_171cbadd` (`reference_id`),
  KEY `structures_0836a46d` (`prototype_id`),
  KEY `structures_2687c130` (`composition_id`),
  KEY `structures_15137c52` (`spacegroup_id`),
  KEY `structures_a433eb25` (`fit_id`),
  CONSTRAINT `composition_id_refs_formula_ea1e2f53` FOREIGN KEY (`composition_id`) REFERENCES `compositions` (`formula`),
  CONSTRAINT `entry_id_refs_id_36a6ac50` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`),
  CONSTRAINT `fit_id_refs_name_5b6c6456` FOREIGN KEY (`fit_id`) REFERENCES `fits` (`name`),
  CONSTRAINT `prototype_id_refs_name_4cc9e0aa` FOREIGN KEY (`prototype_id`) REFERENCES `prototypes` (`name`),
  CONSTRAINT `reference_id_refs_id_38aa1d20` FOREIGN KEY (`reference_id`) REFERENCES `publications` (`id`),
  CONSTRAINT `spacegroup_id_refs_number_4e213048` FOREIGN KEY (`spacegroup_id`) REFERENCES `spacegroups` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=8457959 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures`
--

LOCK TABLES `structures` WRITE;
/*!40000 ALTER TABLE `structures` DISABLE KEYS */;
INSERT INTO `structures` VALUES (81274,6126,NULL,'coarse_relax',NULL,0,'Ca1 O3 Ti1',5,5,3,3.720211042,0,0,0,3.720211042,0,0,0,3.720211042,-0.13578,-0.13578,-0.13578,0,0,0,221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,51.4876,10.2975,NULL),(81276,6126,NULL,'initialize',NULL,0,'Ca1 O3 Ti1',5,5,3,3.795,0,0,0,3.795,0,0,0,3.795,-8.00509,-8.00509,-8.00509,0,0,0,221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,54.6557,10.9311,NULL),(81278,6126,NULL,'fine_relax',NULL,0,'Ca1 O3 Ti1',5,5,3,3.838980481,0,0,0,3.838980481,0,0,0,3.838980481,0.02323,0.02323,0.02323,0,0,0,221,NULL,NULL,NULL,NULL,NULL,NULL,NULL,56.578,11.3156,NULL);
/*!40000 ALTER TABLE `structures` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures_element_set`
--

DROP TABLE IF EXISTS `structures_element_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures_element_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int NOT NULL,
  `element_id` varchar(9) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `structure_id` (`structure_id`,`element_id`),
  KEY `structures_element_set_95d4059a` (`structure_id`),
  KEY `structures_element_set_00a8885a` (`element_id`),
  CONSTRAINT `element_id_refs_symbol_ca907208` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`),
  CONSTRAINT `structure_id_refs_id_132ac5ac` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115171295 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures_element_set`
--

LOCK TABLES `structures_element_set` WRITE;
/*!40000 ALTER TABLE `structures_element_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures_element_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures_meta_data`
--

DROP TABLE IF EXISTS `structures_meta_data`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures_meta_data` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int NOT NULL,
  `metadata_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `structure_id` (`structure_id`,`metadata_id`),
  KEY `structures_meta_data_95d4059a` (`structure_id`),
  KEY `structures_meta_data_a131f96d` (`metadata_id`),
  CONSTRAINT `metadata_id_refs_id_d66597a3` FOREIGN KEY (`metadata_id`) REFERENCES `meta_data` (`id`),
  CONSTRAINT `structure_id_refs_id_815f1968` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures_meta_data`
--

LOCK TABLES `structures_meta_data` WRITE;
/*!40000 ALTER TABLE `structures_meta_data` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures_meta_data` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `structures_species_set`
--

DROP TABLE IF EXISTS `structures_species_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `structures_species_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `structure_id` int NOT NULL,
  `species_id` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `structure_id` (`structure_id`,`species_id`),
  KEY `structures_species_set_95d4059a` (`structure_id`),
  KEY `structures_species_set_e1800d51` (`species_id`),
  CONSTRAINT `species_id_refs_name_3d32d142` FOREIGN KEY (`species_id`) REFERENCES `species` (`name`),
  CONSTRAINT `structure_id_refs_id_a248e517` FOREIGN KEY (`structure_id`) REFERENCES `structures` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=115194569 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `structures_species_set`
--

LOCK TABLES `structures_species_set` WRITE;
/*!40000 ALTER TABLE `structures_species_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `structures_species_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks`
--

DROP TABLE IF EXISTS `tasks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks` (
  `id` int NOT NULL AUTO_INCREMENT,
  `module` varchar(60) NOT NULL,
  `kwargs` longtext NOT NULL,
  `state` int NOT NULL,
  `priority` int NOT NULL,
  `created` datetime NOT NULL,
  `finished` datetime DEFAULT NULL,
  `entry_id` int NOT NULL,
  PRIMARY KEY (`id`),
  KEY `tasks_e8d920b6` (`entry_id`),
  CONSTRAINT `entry_id_refs_id_71ea3c08` FOREIGN KEY (`entry_id`) REFERENCES `entries` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1665062 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks`
--

LOCK TABLES `tasks` WRITE;
/*!40000 ALTER TABLE `tasks` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tasks_project_set`
--

DROP TABLE IF EXISTS `tasks_project_set`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tasks_project_set` (
  `id` int NOT NULL AUTO_INCREMENT,
  `task_id` int NOT NULL,
  `project_id` varchar(63) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `task_id` (`task_id`,`project_id`),
  KEY `tasks_project_set_ef96c3b8` (`task_id`),
  KEY `tasks_project_set_37952554` (`project_id`),
  CONSTRAINT `project_id_refs_name_9e2ebc75` FOREIGN KEY (`project_id`) REFERENCES `projects` (`name`),
  CONSTRAINT `task_id_refs_id_908bba1e` FOREIGN KEY (`task_id`) REFERENCES `tasks` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8596674 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tasks_project_set`
--

LOCK TABLES `tasks_project_set` WRITE;
/*!40000 ALTER TABLE `tasks_project_set` DISABLE KEYS */;
/*!40000 ALTER TABLE `tasks_project_set` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `translations`
--

DROP TABLE IF EXISTS `translations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `translations` (
  `id` int NOT NULL AUTO_INCREMENT,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=516077 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `translations`
--

LOCK TABLES `translations` WRITE;
/*!40000 ALTER TABLE `translations` DISABLE KEYS */;
/*!40000 ALTER TABLE `translations` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users` (
  `id` int NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(30) NOT NULL,
  `first_name` varchar(30) NOT NULL,
  `last_name` varchar(30) NOT NULL,
  `email` varchar(75) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=83 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_groups`
--

DROP TABLE IF EXISTS `users_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_groups` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`group_id`),
  KEY `users_groups_6340c63c` (`user_id`),
  KEY `users_groups_5f412f9a` (`group_id`),
  CONSTRAINT `group_id_refs_id_e06c3832` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `user_id_refs_id_1217de52` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_groups`
--

LOCK TABLES `users_groups` WRITE;
/*!40000 ALTER TABLE `users_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users_user_permissions`
--

DROP TABLE IF EXISTS `users_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `users_user_permissions` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`,`permission_id`),
  KEY `users_user_permissions_6340c63c` (`user_id`),
  KEY `users_user_permissions_83d7f98b` (`permission_id`),
  CONSTRAINT `permission_id_refs_id_98f3dbf4` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `user_id_refs_id_1b5f933e` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users_user_permissions`
--

LOCK TABLES `users_user_permissions` WRITE;
/*!40000 ALTER TABLE `users_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `users_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vasp_potentials`
--

DROP TABLE IF EXISTS `vasp_potentials`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vasp_potentials` (
  `id` int NOT NULL AUTO_INCREMENT,
  `potcar` longtext NOT NULL,
  `element_id` varchar(9) NOT NULL,
  `name` varchar(10) NOT NULL,
  `xc` varchar(3) NOT NULL,
  `gw` tinyint(1) NOT NULL,
  `paw` tinyint(1) NOT NULL,
  `us` tinyint(1) NOT NULL,
  `enmax` double NOT NULL,
  `enmin` double NOT NULL,
  `date` varchar(20) NOT NULL,
  `electrons` longtext,
  PRIMARY KEY (`id`),
  KEY `vasp_potentials_00a8885a` (`element_id`),
  CONSTRAINT `element_id_refs_symbol_e1882ed7` FOREIGN KEY (`element_id`) REFERENCES `elements` (`symbol`)
) ENGINE=InnoDB AUTO_INCREMENT=1379 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vasp_potentials`
--

LOCK TABLES `vasp_potentials` WRITE;
/*!40000 ALTER TABLE `vasp_potentials` DISABLE KEYS */;
/*!40000 ALTER TABLE `vasp_potentials` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `wyckoffsites`
--

DROP TABLE IF EXISTS `wyckoffsites`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `wyckoffsites` (
  `id` int NOT NULL AUTO_INCREMENT,
  `spacegroup_id` int NOT NULL,
  `symbol` varchar(1) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `multiplicity` int DEFAULT NULL,
  `x` varchar(8) NOT NULL,
  `y` varchar(8) NOT NULL,
  `z` varchar(8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `wyckoffsites_15137c52` (`spacegroup_id`),
  CONSTRAINT `spacegroup_id_refs_number_32d37b81` FOREIGN KEY (`spacegroup_id`) REFERENCES `spacegroups` (`number`)
) ENGINE=InnoDB AUTO_INCREMENT=1732 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `wyckoffsites`
--

LOCK TABLES `wyckoffsites` WRITE;
/*!40000 ALTER TABLE `wyckoffsites` DISABLE KEYS */;
/*!40000 ALTER TABLE `wyckoffsites` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-10-16 10:37:20
