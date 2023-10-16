-- MySQL dump 10.13  Distrib 8.0.34, for Linux (x86_64)
--
-- Host: localhost    Database: pyramidsdatabase
-- ------------------------------------------------------
-- Server version	8.0.34-0ubuntu0.22.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `id` bigint NOT NULL AUTO_INCREMENT,
  `group_id` int NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`),
  CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
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
  `name` varchar(255) NOT NULL,
  `content_type_id` int NOT NULL,
  `codename` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`),
  CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add user',6,'add_user'),(22,'Can change user',6,'change_user'),(23,'Can delete user',6,'delete_user'),(24,'Can view user',6,'view_user'),(25,'Can add blacklisted token',7,'add_blacklistedtoken'),(26,'Can change blacklisted token',7,'change_blacklistedtoken'),(27,'Can delete blacklisted token',7,'delete_blacklistedtoken'),(28,'Can view blacklisted token',7,'view_blacklistedtoken'),(29,'Can add outstanding token',8,'add_outstandingtoken'),(30,'Can change outstanding token',8,'change_outstandingtoken'),(31,'Can delete outstanding token',8,'delete_outstandingtoken'),(32,'Can view outstanding token',8,'view_outstandingtoken'),(33,'Can add post',9,'add_post'),(34,'Can change post',9,'change_post'),(35,'Can delete post',9,'delete_post'),(36,'Can view post',9,'view_post');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
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
  `user_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  KEY `django_admin_log_user_id_c564eba6_fk_user_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_user_user_id` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-10-14 10:08:15.825075','2','amr.3brazek@gmail.com',3,'',6,1),(2,'2023-10-14 10:15:58.954282','3','amr.3brazek@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,1),(3,'2023-10-14 13:55:13.170249','3','amr.3brazek@gmail.com',3,'',6,1),(4,'2023-10-14 14:03:17.868928','4','amr.3brazek@gmail.com',3,'',6,1),(5,'2023-10-14 14:05:47.151086','5','amr.3brazek@gmail.com',3,'',6,1),(6,'2023-10-14 16:24:31.146652','6','amr.3brazek@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,1),(7,'2023-10-14 18:53:08.502732','6','amr.3brazek@gmail.com',3,'',6,1),(8,'2023-10-14 19:04:55.339936','7','amr.3brazek@gmail.com',3,'',6,1),(9,'2023-10-14 19:12:23.869202','8','amr.3brazek@gmail.com',3,'',6,1),(10,'2023-10-16 13:34:57.074337','10','testuser1@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,1),(11,'2023-10-16 13:35:04.115913','11','testuser2@gmail.com',2,'[{\"changed\": {\"fields\": [\"Is active\"]}}]',6,1),(12,'2023-10-16 13:36:22.251702','9','amr.3brazek@gmail.com',3,'',6,1),(13,'2023-10-16 13:47:10.406009','1','Post object (1)',3,'',9,1);
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(9,'post','post'),(5,'sessions','session'),(7,'token_blacklist','blacklistedtoken'),(8,'token_blacklist','outstandingtoken'),(6,'user','user');
/*!40000 ALTER TABLE `django_content_type` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `django_migrations`
--

DROP TABLE IF EXISTS `django_migrations`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `django_migrations` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'user','0001_initial','2023-10-13 22:41:28.915507'),(2,'contenttypes','0001_initial','2023-10-13 22:41:29.106024'),(3,'admin','0001_initial','2023-10-13 22:41:29.518305'),(4,'admin','0002_logentry_remove_auto_add','2023-10-13 22:41:29.567461'),(5,'admin','0003_logentry_add_action_flag_choices','2023-10-13 22:41:29.606009'),(6,'contenttypes','0002_remove_content_type_name','2023-10-13 22:41:29.952906'),(7,'auth','0001_initial','2023-10-13 22:41:30.937453'),(8,'auth','0002_alter_permission_name_max_length','2023-10-13 22:41:31.146563'),(9,'auth','0003_alter_user_email_max_length','2023-10-13 22:41:31.202584'),(10,'auth','0004_alter_user_username_opts','2023-10-13 22:41:31.243661'),(11,'auth','0005_alter_user_last_login_null','2023-10-13 22:41:31.282543'),(12,'auth','0006_require_contenttypes_0002','2023-10-13 22:41:31.298646'),(13,'auth','0007_alter_validators_add_error_messages','2023-10-13 22:41:31.340462'),(14,'auth','0008_alter_user_username_max_length','2023-10-13 22:41:31.381678'),(15,'auth','0009_alter_user_last_name_max_length','2023-10-13 22:41:31.431361'),(16,'auth','0010_alter_group_name_max_length','2023-10-13 22:41:31.523951'),(17,'auth','0011_update_proxy_permissions','2023-10-13 22:41:31.570777'),(18,'auth','0012_alter_user_first_name_max_length','2023-10-13 22:41:31.619906'),(19,'sessions','0001_initial','2023-10-13 22:41:31.726292'),(20,'token_blacklist','0001_initial','2023-10-13 22:41:32.169206'),(21,'token_blacklist','0002_outstandingtoken_jti_hex','2023-10-13 22:41:32.272077'),(22,'token_blacklist','0003_auto_20171017_2007','2023-10-13 22:41:32.350467'),(23,'token_blacklist','0004_auto_20171017_2013','2023-10-13 22:41:32.582757'),(24,'token_blacklist','0005_remove_outstandingtoken_jti','2023-10-13 22:41:32.737189'),(25,'token_blacklist','0006_auto_20171017_2113','2023-10-13 22:41:32.848467'),(26,'token_blacklist','0007_auto_20171017_2214','2023-10-13 22:41:33.402765'),(27,'token_blacklist','0008_migrate_to_bigautofield','2023-10-13 22:41:34.004766'),(28,'token_blacklist','0010_fix_migrate_to_bigautofield','2023-10-13 22:41:34.091211'),(29,'token_blacklist','0011_linearizes_history','2023-10-13 22:41:34.108823'),(30,'token_blacklist','0012_alter_outstandingtoken_user','2023-10-13 22:41:34.158358'),(31,'post','0001_initial','2023-10-14 16:14:24.120192'),(32,'user','0002_remove_user_is_reset','2023-10-14 19:11:45.776061');
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
  `expire_date` datetime(6) NOT NULL,
  PRIMARY KEY (`session_key`),
  KEY `django_session_expire_date_a5c62663` (`expire_date`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
INSERT INTO `django_session` VALUES ('lws48qv4cifezhgwryovgv2hyc4n6twq','.eJxVjMsOwiAQRf-FtSEMj7a4dO83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mzAHH63SKmB9cd0B3rrcnU6rrMUe6KPGiX10b8vBzu30HBXr61VyqTs6jRRaeNyzzkRDEpo4Ej0mQzABivE46KCKc46uRVRmUZSA_i_QH3Djhr:1qsNio:QLM7Ffop8lRZPxH99m5YRWRQPICTh7uNXryRWm90BfA','2023-10-30 13:33:26.812451'),('u0u713h9amlre7vzq9x5ilm59cu0ro4e','.eJxVjMsOwiAQRf-FtSEMj7a4dO83kIEZpGogKe3K-O_apAvd3nPOfYmA21rC1nkJM4mzAHH63SKmB9cd0B3rrcnU6rrMUe6KPGiX10b8vBzu30HBXr61VyqTs6jRRaeNyzzkRDEpo4Ej0mQzABivE46KCKc46uRVRmUZSA_i_QH3Djhr:1qrR1d:TDoFNsoftX2s18FMwxjYZI77wX7SlWs_ETZ14YFK1gs','2023-10-27 22:52:57.433232');
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `post_post`
--

DROP TABLE IF EXISTS `post_post`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `post_post` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `title` varchar(255) DEFAULT NULL,
  `content` longtext,
  `created_at` datetime(6) NOT NULL,
  `updated_at` datetime(6) NOT NULL,
  `author_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  KEY `post_post_author_id_99d134d5_fk_user_user_id` (`author_id`),
  CONSTRAINT `post_post_author_id_99d134d5_fk_user_user_id` FOREIGN KEY (`author_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `post_post`
--

LOCK TABLES `post_post` WRITE;
/*!40000 ALTER TABLE `post_post` DISABLE KEYS */;
INSERT INTO `post_post` VALUES (4,'post1','by user 1','2023-10-16 13:57:16.854745','2023-10-16 13:57:16.854939',10),(5,'post2','by user 1 updated','2023-10-16 13:57:56.652162','2023-10-16 13:58:44.207529',10),(6,'post1','by user 2','2023-10-16 14:01:37.649071','2023-10-16 14:01:37.649166',11);
/*!40000 ALTER TABLE `post_post` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_blacklistedtoken`
--

DROP TABLE IF EXISTS `token_blacklist_blacklistedtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_blacklistedtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `blacklisted_at` datetime(6) NOT NULL,
  `token_id` bigint NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_id` (`token_id`),
  CONSTRAINT `token_blacklist_blacklistedtoken_token_id_3cc7fe56_fk` FOREIGN KEY (`token_id`) REFERENCES `token_blacklist_outstandingtoken` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_blacklistedtoken`
--

LOCK TABLES `token_blacklist_blacklistedtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_blacklistedtoken` VALUES (1,'2023-10-14 09:27:54.497579',5),(2,'2023-10-14 09:29:12.330228',6),(3,'2023-10-14 10:04:17.102721',7),(4,'2023-10-14 11:04:22.928847',13),(5,'2023-10-14 11:05:15.907624',14),(6,'2023-10-14 11:11:57.949261',15),(7,'2023-10-14 11:18:04.072752',16),(8,'2023-10-14 11:19:05.965150',17),(9,'2023-10-14 11:34:14.754666',18),(10,'2023-10-14 11:35:20.117234',19),(11,'2023-10-14 12:15:22.101536',21),(12,'2023-10-14 12:17:13.074034',22),(13,'2023-10-14 16:33:06.113498',23),(14,'2023-10-14 16:38:51.739073',24),(15,'2023-10-14 16:43:34.632770',25),(16,'2023-10-14 16:58:41.403390',26),(17,'2023-10-14 17:04:15.043727',27),(18,'2023-10-14 17:17:09.509015',28),(19,'2023-10-14 17:20:48.707928',29),(20,'2023-10-16 13:56:54.100875',30);
/*!40000 ALTER TABLE `token_blacklist_blacklistedtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `token_blacklist_outstandingtoken`
--

DROP TABLE IF EXISTS `token_blacklist_outstandingtoken`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `token_blacklist_outstandingtoken` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `token` longtext NOT NULL,
  `created_at` datetime(6) DEFAULT NULL,
  `expires_at` datetime(6) NOT NULL,
  `user_id` bigint DEFAULT NULL,
  `jti` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `token_blacklist_outstandingtoken_jti_hex_d9bdf6f7_uniq` (`jti`),
  KEY `token_blacklist_outs_user_id_83bc629a_fk_user_user` (`user_id`),
  CONSTRAINT `token_blacklist_outs_user_id_83bc629a_fk_user_user` FOREIGN KEY (`user_id`) REFERENCES `user_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `token_blacklist_outstandingtoken`
--

LOCK TABLES `token_blacklist_outstandingtoken` WRITE;
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` DISABLE KEYS */;
INSERT INTO `token_blacklist_outstandingtoken` VALUES (1,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MDYxNSwiaWF0IjoxNjk3Mjc0MjE1LCJqdGkiOiI3NTg2OWEyNmE5YmU0MTA5YTkzOWRiYmI2OTIzMzBjNCIsInVzZXJfaWQiOjF9.zdAD5zJdmkxx0aOgwI2fxkJ6hFdLq3XkP2tvGvuo9Uk','2023-10-14 09:03:35.928196','2023-10-15 09:03:35.000000',1,'75869a26a9be4109a939dbbb692330c4'),(2,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MTk1OSwiaWF0IjoxNjk3Mjc1NTU5LCJqdGkiOiJiYWNlNzZmODk2MTg0MzQ5ODU3MjI5YzU5YWNlYTBjZiIsInVzZXJfaWQiOjF9.ZRUB5CeZDVChvUtnRcBr8BWRQW5GXNgIQYKmz96L4Ok','2023-10-14 09:25:59.181378','2023-10-15 09:25:59.000000',1,'bace76f896184349857229c59acea0cf'),(3,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MTk4MywiaWF0IjoxNjk3Mjc1NTgzLCJqdGkiOiIwZDcyMjgxYTkyYTM0Zjc0YjJlNTUzZjJhNzRiYjA2NiIsInVzZXJfaWQiOjF9.q2QE20gnCK4_AYucdgzaoBrIjUzP501OLOy9Zz3mGyk','2023-10-14 09:26:23.062148','2023-10-15 09:26:23.000000',1,'0d72281a92a34f74b2e553f2a74bb066'),(4,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MjAyMywiaWF0IjoxNjk3Mjc1NjIzLCJqdGkiOiI5Y2Q1MDNhYWFkODI0NWZjOTM2MzU3M2VkMDE0MGI5MiIsInVzZXJfaWQiOjF9.yJFsJwK9TVqKZGYYC_l_T8eo6ZZ75E9dHxz9UNKvoyk','2023-10-14 09:27:03.567041','2023-10-15 09:27:03.000000',1,'9cd503aaad8245fc9363573ed0140b92'),(5,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MjA1NywiaWF0IjoxNjk3Mjc1NjU3LCJqdGkiOiJmYWExZmIzNWZlZDU0NDlmOTVlZmNjZjY4YzdkNzdmYSIsInVzZXJfaWQiOjF9.jDFlfczWmAFaTbLbDjChHBQkiaPT-72L4a1J7Y34TXo','2023-10-14 09:27:37.383553','2023-10-15 09:27:37.000000',1,'faa1fb35fed5449f95efccf68c7d77fa'),(6,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2MjEzNywiaWF0IjoxNjk3Mjc1NzM3LCJqdGkiOiI4ZWU1NmE4NjY4Zjc0NWJjOWQ5YmEzZmViZjhhOWEwMSIsInVzZXJfaWQiOjF9.AdHTzZEHdNCxxB0Mm5l8l5Wbjou1dfx_Wkh6dC-6T0Y','2023-10-14 09:28:57.340505','2023-10-15 09:28:57.000000',1,'8ee56a8668f745bc9d9ba3febf8a9a01'),(7,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NDIzNywiaWF0IjoxNjk3Mjc3ODM3LCJqdGkiOiJiZTgzY2QyMzk2Y2I0OWNkYjA5NDI3YjMxY2I3NzFlOCIsInVzZXJfaWQiOjF9.ZPfBCvIrAN9rDsLo3z6RCUjM7hPUshhL33qu5p7Ma5U','2023-10-14 10:03:57.629662','2023-10-15 10:03:57.000000',1,'be83cd2396cb49cdb09427b31cb771e8'),(8,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NTE2OCwiaWF0IjoxNjk3Mjc4NzY4LCJqdGkiOiJkZDc5MmYyYmNjODI0ZjFlODViYWM5ZTY1YjgyMmQ5YSIsInVzZXJfaWQiOjN9.8bIElPdvwHvD_HKDAcizg8zq7XH-77yGvgkMZYY3oDk','2023-10-14 10:19:28.224316','2023-10-15 10:19:28.000000',NULL,'dd792f2bcc824f1e85bac9e65b822d9a'),(9,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NTIwMiwiaWF0IjoxNjk3Mjc4ODAyLCJqdGkiOiI3NDZkOThiNTJlNzQ0YzNmYjNkNWM3NDRkMzMzMzE1YyIsInVzZXJfaWQiOjN9._r_t4oTxJcVTmpaT7CASPLDV79hEbm3Wm5JqDMR5xeM','2023-10-14 10:20:02.151560','2023-10-15 10:20:02.000000',NULL,'746d98b52e744c3fb3d5c744d333315c'),(10,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NTcwNiwiaWF0IjoxNjk3Mjc5MzA2LCJqdGkiOiJhNmMwNmFkZDkyNjY0NzMyYTY4ZTQxYmM4NjYzNTI4MCIsInVzZXJfaWQiOjN9.kUyk0unxEWciVZ4gXd-94peCIUCtqKpmMpvI9Fnp5CQ','2023-10-14 10:28:26.024523','2023-10-15 10:28:26.000000',NULL,'a6c06add92664732a68e41bc86635280'),(11,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NTc4OSwiaWF0IjoxNjk3Mjc5Mzg5LCJqdGkiOiIxYmM1YmY0MWZjYmQ0M2NiOTU0ZGIwODY1ZWY2MTRlZCIsInVzZXJfaWQiOjN9.vlSw2keq0lpns7Jk-l1LDeULWnxbE6-QeE-qtpxupEM','2023-10-14 10:29:49.237398','2023-10-15 10:29:49.000000',NULL,'1bc5bf41fcbd43cb954db0865ef614ed'),(12,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NzU5MCwiaWF0IjoxNjk3MjgxMTkwLCJqdGkiOiJlYmE0ZWZjZDIxMTE0YzhkOGQxZDNkNzkxNWI4ODVkMCIsInVzZXJfaWQiOjN9.zgMwrMarfcMMMXoSyC-wjnoJmkfgajMCDleen3fH6is','2023-10-14 10:59:50.102317','2023-10-15 10:59:50.000000',NULL,'eba4efcd21114c8d8d1d3d7915b885d0'),(13,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2NzgzNCwiaWF0IjoxNjk3MjgxNDM0LCJqdGkiOiI4NTk5Yjk1YjA4ZDI0OTA4OGQzYWQ0MjY1ODFhODJmMiIsInVzZXJfaWQiOjN9.OojGmjzlHrv3TrYa8mFPUALntkfhntNG5vZkax96dwo','2023-10-14 11:03:54.949880','2023-10-15 11:03:54.000000',NULL,'8599b95b08d249088d3ad426581a82f2'),(14,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2Nzg2MiwiaWF0IjoxNjk3MjgxNDYyLCJqdGkiOiJlM2IxYzJhNjg0NzE0MTk3OTU1MTdiM2NkNzM0OTNiOCIsInVzZXJfaWQiOjMsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.MD9ne8-g9STDBoqqJWe_RjF602Uw182frcYykf1WCA0',NULL,'2023-10-15 11:04:22.000000',NULL,'e3b1c2a68471419795517b3cd73493b8'),(15,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2ODI3MCwiaWF0IjoxNjk3MjgxODcwLCJqdGkiOiJhMjAxNWQ1OGE1NTY0ZGIyOWYxMDY2MmYyNjE3Nzc3OCIsInVzZXJfaWQiOjN9.Euw0rwOFAfxbkRQCkVebd0EaNln4kAjfn1UoDGWmIwc','2023-10-14 11:11:10.680812','2023-10-15 11:11:10.000000',NULL,'a2015d58a5564db29f10662f26177778'),(16,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2ODY1NCwiaWF0IjoxNjk3MjgyMjU0LCJqdGkiOiI3NjIzNmQ2OTcwMjY0MGFkODc0MjdkMDY1MDc5OTQzMyIsInVzZXJfaWQiOjN9.z71csDweKAgh0-fqWTblEPQG3EheSjUrThWDHmmddNc','2023-10-14 11:17:34.832491','2023-10-15 11:17:34.000000',NULL,'76236d69702640ad87427d0650799433'),(17,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2ODY4NCwiaWF0IjoxNjk3MjgyMjg0LCJqdGkiOiJiZDk4MzhmYjc3OWE0NDlmYjEzYjVjNWQxOGY3ZmY0OCIsInVzZXJfaWQiOjMsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.RSC24uYZQPWTdznJTnwXHSmghATEDkEwShRnoBdc-u4',NULL,'2023-10-15 11:18:04.000000',NULL,'bd9838fb779a449fb13b5c5d18f7ff48'),(18,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2OTU4MywiaWF0IjoxNjk3MjgzMTgzLCJqdGkiOiI5YTVjZWU5ODg1NGQ0YTA2YjllMjQxNzQ0N2RkMjMxNiIsInVzZXJfaWQiOjN9.G2sDXFOlsG8qJmesGpnUd0K0_oGFNZqW_s_B-rDwiF0','2023-10-14 11:33:03.270759','2023-10-15 11:33:03.000000',NULL,'9a5cee98854d4a06b9e2417447dd2316'),(19,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM2OTY1NCwiaWF0IjoxNjk3MjgzMjU0LCJqdGkiOiI0YzIzZWZiMTViZjQ0NzI4ODliMTk0OGNlMjc5ZWU0ZSIsInVzZXJfaWQiOjMsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.sHOIHEe0LJGtHej1h_8eNslYYbyA0Cul_fnzOtwiPps',NULL,'2023-10-15 11:34:14.000000',NULL,'4c23efb15bf4472889b1948ce279ee4e'),(20,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzI4NTE5MSwiaWF0IjoxNjk3Mjg0ODkxLCJqdGkiOiI5Nzc2MDliMjg1MjU0NmY5OGJlZGI3OWY1YTQwODA2MSIsInVzZXJfaWQiOjN9.mwl__za2p1CMrxZSyiuN_AlYX_UXq_VFqKX3Bkzno5A','2023-10-14 12:01:31.827345','2023-10-14 12:06:31.000000',NULL,'977609b2852546f98bedb79f5a408061'),(21,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM3MjA1NSwiaWF0IjoxNjk3Mjg1NjU1LCJqdGkiOiJkNjU3YmE5NjVkYzk0NzIyYjg2OGZmNjEwYjI5N2QyYiIsInVzZXJfaWQiOjN9.hM7iSpMR-dtQwWcOtC1SK76ZSaGUjDCvIwNfjqU704U','2023-10-14 12:14:15.142828','2023-10-15 12:14:15.000000',NULL,'d657ba965dc94722b868ff610b297d2b'),(22,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM3MjEyMiwiaWF0IjoxNjk3Mjg1NzIyLCJqdGkiOiI2MWRiZTQ4ODk3Y2U0NGYwYmJkNDI0NDc0MmM2NmFiMSIsInVzZXJfaWQiOjMsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.56gjaxhmRqeSMkcgWobnJZSZezUDoCmL8K_bdhgxOYQ',NULL,'2023-10-15 12:15:22.000000',NULL,'61dbe48897ce44f0bbd4244742c66ab1'),(23,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4NzM2NiwiaWF0IjoxNjk3MzAwOTY2LCJqdGkiOiIwODE0MGE4MWRlNTg0ZmYwOWVhZjU1Zjc1OTUzYTA1MSIsInVzZXJfaWQiOjZ9.xJucSm92ZcV9YEggtH1xaD1afBkF4N27oZxxvAYQpWk','2023-10-14 16:29:26.054596','2023-10-15 16:29:26.000000',NULL,'08140a81de584ff09eaf55f75953a051'),(24,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4NzU4NiwiaWF0IjoxNjk3MzAxMTg2LCJqdGkiOiI3ZTRhMmU2NTMyOTk0OTczODJkMTJkNDJmNWNiODVmYSIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.ONcCNZlo7jU4rm3c7Q_j1c0xEZuA8zWcGagTYKYTtuQ',NULL,'2023-10-15 16:33:06.000000',NULL,'7e4a2e653299497382d12d42f5cb85fa'),(25,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4NzkzMSwiaWF0IjoxNjk3MzAxNTMxLCJqdGkiOiIwMmVhM2ZiNGRjN2Q0ZjIxOWQ2NzgxOWJjZWEzYzE1YyIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.DXLhTIkxQowvb6p6wZh7-4GaTssipR4SN2_sFKSyls8',NULL,'2023-10-15 16:38:51.000000',NULL,'02ea3fb4dc7d4f219d67819bcea3c15c'),(26,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4ODIxNCwiaWF0IjoxNjk3MzAxODE0LCJqdGkiOiI3YTJhNzE1MTRlZmY0NDk2YjY3YmNmMjU0NTg4NTUyMiIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.sM32SJtYh4FlFcRzX3TSer8bt6wQd8PIZry9Ug9c8vU',NULL,'2023-10-15 16:43:34.000000',NULL,'7a2a71514eff4496b67bcf2545885522'),(27,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4OTEyMSwiaWF0IjoxNjk3MzAyNzIxLCJqdGkiOiIxZDFiZDU4N2MyYjU0NWU0YWIyNjkyOWNhMTZkYTBmNCIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.u1xzTeBhBoE9TlMcnar1tV-qgaXZqOu4Uh_StHCcUqk',NULL,'2023-10-15 16:58:41.000000',NULL,'1d1bd587c2b545e4ab26929ca16da0f4'),(28,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM4OTQ1NSwiaWF0IjoxNjk3MzAzMDU1LCJqdGkiOiI1ZTgyYzhiODAxZWU0NDBiOWMyZWI0Y2MwZjliYzcxNiIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.elIYinxZ4Fj7SgKxJoUh9sxXFqiOGpSZ8f_7ZcAEnHg',NULL,'2023-10-15 17:04:15.000000',NULL,'5e82c8b801ee440b9c2eb4cc0f9bc716'),(29,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzM5MDIyOSwiaWF0IjoxNjk3MzAzODI5LCJqdGkiOiI1NmNiMWQwYzU4YWQ0NzZhODJiMmMyYmQ3M2ExMTVmZSIsInVzZXJfaWQiOjYsInVzZXJuYW1lIjoiYW1yYWJyYXplazIifQ.4nN0qeoTDuzvwQMoXozXUX6zRsd0CDJWqceEKhKWYVc',NULL,'2023-10-15 17:17:09.000000',NULL,'56cb1d0c58ad476a82b2c2bd73a115fe'),(30,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzU1MDcyMiwiaWF0IjoxNjk3NDY0MzIyLCJqdGkiOiJjMDVkMThlMjZhYjU0ZmY5YmUzYjU4NjQxZmQxZjAyOCIsInVzZXJfaWQiOjEwfQ.WwDevOD9xUwFzpX6QWtS8XeoT-zGSQY_3u556HPICyo','2023-10-16 13:52:02.970681','2023-10-17 13:52:02.000000',10,'c05d18e26ab54ff9be3b58641fd1f028'),(31,'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJ0b2tlbl90eXBlIjoicmVmcmVzaCIsImV4cCI6MTY5NzU1MTIyNywiaWF0IjoxNjk3NDY0ODI3LCJqdGkiOiI3MTkwZjAyMDEwZjQ0YjM0OTk4OGM4OTIyZWEzMjAyNyIsInVzZXJfaWQiOjExfQ.Z4RX6v8_-zpoFYzloDrgfqnmqQmoh4dTa9i6HFzcpT8','2023-10-16 14:00:27.248466','2023-10-17 14:00:27.000000',11,'7190f02010f44b349988c8922ea32027');
/*!40000 ALTER TABLE `token_blacklist_outstandingtoken` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_user`
--

DROP TABLE IF EXISTS `user_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `firstname` varchar(20) NOT NULL,
  `lastname` varchar(20) NOT NULL,
  `username` varchar(20) NOT NULL,
  `email` varchar(90) NOT NULL,
  `date_created` datetime(6) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_user`
--

LOCK TABLES `user_user` WRITE;
/*!40000 ALTER TABLE `user_user` DISABLE KEYS */;
INSERT INTO `user_user` VALUES (1,'pbkdf2_sha256$600000$UzwxGiLt5juRccsDiY0LQd$T7lt61F/+TwKo181R+oHT2Gju2X7IY98bYdEg6+QLhs=','2023-10-16 13:33:26.805350','admin','amrabrazek','amrabrazek','amr@gmail.com','2023-10-13 22:52:10.855272',1,1,1),(10,'pbkdf2_sha256$600000$HxxRpbxmUeK4EDe7KUfHvu$Tbs8yf+wbl7y3gb6/xPg1VoIKCn2on96zuMQYpZFoPw=',NULL,'test','user','user1','testuser1@gmail.com','2023-10-16 13:33:02.623239',1,0,0),(11,'pbkdf2_sha256$600000$l8t6riTGsjan9jXI91EvZn$c3fFesNOdSC6oSPbT5GjhKHk/uzCmda/8Fel5z/V/X8=',NULL,'test','user2','testuser2','testuser2@gmail.com','2023-10-16 13:34:45.110588',1,0,0),(12,'pbkdf2_sha256$600000$koA64SwLLcIPtvtZOsW2R5$egUhCG48hnKI3jfGgJ78mABld9dT3fNHl5Aw4UZiG5E=',NULL,'inactive','user3','testuser3','testuser3@gmail.com','2023-10-16 13:35:33.824224',0,0,0);
/*!40000 ALTER TABLE `user_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-10-16 17:08:00
