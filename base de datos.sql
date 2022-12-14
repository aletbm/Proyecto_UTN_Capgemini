CREATE DATABASE  IF NOT EXISTS `tp` /*!40100 DEFAULT CHARACTER SET utf8mb3 */ /*!80016 DEFAULT ENCRYPTION='N' */;
USE `tp`;
-- MySQL dump 10.13  Distrib 8.0.31, for Win64 (x86_64)
--
-- Host: localhost    Database: tp
-- ------------------------------------------------------
-- Server version	8.0.31

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add log entry',1,'add_logentry'),(2,'Can change log entry',1,'change_logentry'),(3,'Can delete log entry',1,'delete_logentry'),(4,'Can view log entry',1,'view_logentry'),(5,'Can add permission',2,'add_permission'),(6,'Can change permission',2,'change_permission'),(7,'Can delete permission',2,'delete_permission'),(8,'Can view permission',2,'view_permission'),(9,'Can add group',3,'add_group'),(10,'Can change group',3,'change_group'),(11,'Can delete group',3,'delete_group'),(12,'Can view group',3,'view_group'),(13,'Can add content type',4,'add_contenttype'),(14,'Can change content type',4,'change_contenttype'),(15,'Can delete content type',4,'delete_contenttype'),(16,'Can view content type',4,'view_contenttype'),(17,'Can add session',5,'add_session'),(18,'Can change session',5,'change_session'),(19,'Can delete session',5,'delete_session'),(20,'Can view session',5,'view_session'),(21,'Can add pregunta',6,'add_pregunta'),(22,'Can change pregunta',6,'change_pregunta'),(23,'Can delete pregunta',6,'delete_pregunta'),(24,'Can view pregunta',6,'view_pregunta'),(25,'Can add tema',7,'add_tema'),(26,'Can change tema',7,'change_tema'),(27,'Can delete tema',7,'delete_tema'),(28,'Can view tema',7,'view_tema'),(29,'Can add countries',8,'add_countries'),(30,'Can change countries',8,'change_countries'),(31,'Can delete countries',8,'delete_countries'),(32,'Can view countries',8,'view_countries'),(33,'Can add custom user',9,'add_customuser'),(34,'Can change custom user',9,'change_customuser'),(35,'Can delete custom user',9,'delete_customuser'),(36,'Can view custom user',9,'view_customuser');
/*!40000 ALTER TABLE `auth_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `countries` (
  `idCountries` smallint unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ISO` char(2) NOT NULL,
  PRIMARY KEY (`idCountries`),
  UNIQUE KEY `nombre_UNIQUE` (`name`),
  UNIQUE KEY `ISO_UNIQUE` (`ISO`)
) ENGINE=InnoDB AUTO_INCREMENT=457 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (229,'Afghanistan','AF'),(230,'Albania','AL'),(231,'Algeria','DZ'),(232,'American Samoa','AS'),(233,'Andorra','AD'),(234,'Angola','AO'),(235,'Anguilla','AI'),(236,'Antarctica','AQ'),(237,'Antigua and Barbuda','AG'),(238,'Argentina','AR'),(239,'Armenia','AM'),(240,'Aruba','AW'),(241,'Australia','AU'),(242,'Austria','AT'),(243,'Azerbaijan','AZ'),(244,'Bahamas','BS'),(245,'Bahrain','BH'),(246,'Bangladesh','BD'),(247,'Barbados','BB'),(248,'Belarus','BY'),(249,'Belgium','BE'),(250,'Belize','BZ'),(251,'Benin','BJ'),(252,'Bermuda','BM'),(253,'Bhutan','BT'),(254,'Bosnia and Herzegovina','BA'),(255,'Botswana','BW'),(256,'Bouvet Island','BV'),(257,'Brazil','BR'),(258,'British Indian Ocean Territory','IO'),(259,'Brunei Darussalam','BN'),(260,'Bulgaria','BG'),(261,'Burkina Faso','BF'),(262,'Burundi','BI'),(263,'Cambodia','KH'),(264,'Cameroon','CM'),(265,'Canada','CA'),(266,'Cape Verde','CV'),(267,'Cayman Islands','KY'),(268,'Central African Republic','CF'),(269,'Chad','TD'),(270,'Chile','CL'),(271,'China','CN'),(272,'Christmas Island','CX'),(273,'Cocos (Keeling) Islands','CC'),(274,'Colombia','CO'),(275,'Comoros','KM'),(276,'Congo','CG'),(277,'Cook Islands','CK'),(278,'Costa Rica','CR'),(279,'Croatia','HR'),(280,'Cuba','CU'),(281,'Cyprus','CY'),(282,'Czech Republic','CZ'),(283,'Denmark','DK'),(284,'Djibouti','DJ'),(285,'Dominica','DM'),(286,'Dominican Republic','DO'),(287,'Ecuador','EC'),(288,'Egypt','EG'),(289,'El Salvador','SV'),(290,'Equatorial Guinea','GQ'),(291,'Eritrea','ER'),(292,'Estonia','EE'),(293,'Ethiopia','ET'),(294,'Falkland Islands (Malvinas)','FK'),(295,'Faroe Islands','FO'),(296,'Fiji','FJ'),(297,'Finland','FI'),(298,'France','FR'),(299,'French Guiana','GF'),(300,'French Polynesia','PF'),(301,'French Southern Territories','TF'),(302,'Gabon','GA'),(303,'Gambia','GM'),(304,'Georgia','GE'),(305,'Germany','DE'),(306,'Ghana','GH'),(307,'Gibraltar','GI'),(308,'Greece','GR'),(309,'Greenland','GL'),(310,'Grenada','GD'),(311,'Guadeloupe','GP'),(312,'Guam','GU'),(313,'Guatemala','GT'),(314,'Guernsey','GG'),(315,'Guinea','GN'),(316,'Guinea-Bissau','GW'),(317,'Guyana','GY'),(318,'Haiti','HT'),(319,'Heard Island and McDonald Islands','HM'),(320,'Holy See (Vatican City State)','VA'),(321,'Honduras','HN'),(322,'Hong Kong','HK'),(323,'Hungary','HU'),(324,'Iceland','IS'),(325,'India','IN'),(326,'Indonesia','ID'),(327,'Iraq','IQ'),(328,'Ireland','IE'),(329,'Isle of Man','IM'),(330,'Israel','IL'),(331,'Italy','IT'),(332,'Jamaica','JM'),(333,'Japan','JP'),(334,'Jersey','JE'),(335,'Jordan','JO'),(336,'Kazakhstan','KZ'),(337,'Kenya','KE'),(338,'Kiribati','KI'),(339,'Kuwait','KW'),(340,'Kyrgyzstan','KG'),(341,'Lao Peoples Democratic Republic','LA'),(342,'Latvia','LV'),(343,'Lebanon','LB'),(344,'Lesotho','LS'),(345,'Liberia','LR'),(346,'Libya','LY'),(347,'Liechtenstein','LI'),(348,'Lithuania','LT'),(349,'Luxembourg','LU'),(350,'Macao','MO'),(351,'Madagascar','MG'),(352,'Malawi','MW'),(353,'Malaysia','MY'),(354,'Maldives','MV'),(355,'Mali','ML'),(356,'Malta','MT'),(357,'Marshall Islands','MH'),(358,'Martinique','MQ'),(359,'Mauritania','MR'),(360,'Mauritius','MU'),(361,'Mayotte','YT'),(362,'Mexico','MX'),(363,'Monaco','MC'),(364,'Mongolia','MN'),(365,'Montenegro','ME'),(366,'Montserrat','MS'),(367,'Morocco','MA'),(368,'Mozambique','MZ'),(369,'Myanmar','MM'),(370,'Namibia','NA'),(371,'Nauru','NR'),(372,'Nepal','NP'),(373,'Netherlands','NL'),(374,'New Caledonia','NC'),(375,'New Zealand','NZ'),(376,'Nicaragua','NI'),(377,'Niger','NE'),(378,'Nigeria','NG'),(379,'Niue','NU'),(380,'Norfolk Island','NF'),(381,'Northern Mariana Islands','MP'),(382,'Norway','NO'),(383,'Oman','OM'),(384,'Pakistan','PK'),(385,'Palau','PW'),(386,'Panama','PA'),(387,'Papua New Guinea','PG'),(388,'Paraguay','PY'),(389,'Peru','PE'),(390,'Philippines','PH'),(391,'Pitcairn','PN'),(392,'Poland','PL'),(393,'Portugal','PT'),(394,'Puerto Rico','PR'),(395,'Qatar','QA'),(396,'Romania','RO'),(397,'Russian Federation','RU'),(398,'Rwanda','RW'),(399,'Saint Kitts and Nevis','KN'),(400,'Saint Lucia','LC'),(401,'Saint Martin (French part)','MF'),(402,'Saint Pierre and Miquelon','PM'),(403,'Saint Vincent and the Grenadines','VC'),(404,'Samoa','WS'),(405,'San Marino','SM'),(406,'Sao Tome and Principe','ST'),(407,'Saudi Arabia','SA'),(408,'Senegal','SN'),(409,'Serbia','RS'),(410,'Seychelles','SC'),(411,'Sierra Leone','SL'),(412,'Singapore','SG'),(413,'Sint Maarten (Dutch part)','SX'),(414,'Slovakia','SK'),(415,'Slovenia','SI'),(416,'Solomon Islands','SB'),(417,'Somalia','SO'),(418,'South Africa','ZA'),(419,'South Georgia and the South Sandwich Islands','GS'),(420,'South Sudan','SS'),(421,'Spain','ES'),(422,'Sri Lanka','LK'),(423,'Sudan','SD'),(424,'Suriname','SR'),(425,'Svalbard and Jan Mayen','SJ'),(426,'Swaziland','SZ'),(427,'Sweden','SE'),(428,'Switzerland','CH'),(429,'Syrian Arab Republic','SY'),(430,'Tajikistan','TJ'),(431,'Thailand','TH'),(432,'Timor-Leste','TL'),(433,'Togo','TG'),(434,'Tokelau','TK'),(435,'Tonga','TO'),(436,'Trinidad and Tobago','TT'),(437,'Tunisia','TN'),(438,'Turkey','TR'),(439,'Turkmenistan','TM'),(440,'Turks and Caicos Islands','TC'),(441,'Tuvalu','TV'),(442,'Uganda','UG'),(443,'Ukraine','UA'),(444,'United Arab Emirates','AE'),(445,'United Kingdom','GB'),(446,'United States','US'),(447,'United States Minor Outlying Islands','UM'),(448,'Uruguay','UY'),(449,'Uzbekistan','UZ'),(450,'Vanuatu','VU'),(451,'Viet Nam','VN'),(452,'Wallis and Futuna','WF'),(453,'Western Sahara','EH'),(454,'Yemen','YE'),(455,'Zambia','ZM'),(456,'Zimbabwe','ZW');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_countries`
--

DROP TABLE IF EXISTS `custom_user_countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_countries` (
  `idCountries` smallint NOT NULL AUTO_INCREMENT,
  `name` varchar(45) NOT NULL,
  `ISO` varchar(2) NOT NULL,
  PRIMARY KEY (`idCountries`),
  UNIQUE KEY `name` (`name`),
  UNIQUE KEY `ISO` (`ISO`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_countries`
--

LOCK TABLES `custom_user_countries` WRITE;
/*!40000 ALTER TABLE `custom_user_countries` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_customuser`
--

DROP TABLE IF EXISTS `custom_user_customuser`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_customuser` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `nombre` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `country` int NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `is_admin` tinyint(1) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `nombre` (`nombre`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_customuser`
--

LOCK TABLES `custom_user_customuser` WRITE;
/*!40000 ALTER TABLE `custom_user_customuser` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_customuser` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_customuser_groups`
--

DROP TABLE IF EXISTS `custom_user_customuser_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_customuser_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_customuser_g_customuser_id_group_id_56311c69_uniq` (`customuser_id`,`group_id`),
  KEY `custom_user_customuser_groups_group_id_bdb860ae_fk_auth_group_id` (`group_id`),
  CONSTRAINT `custom_user_customus_customuser_id_39e4b4a7_fk_custom_us` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user_customuser` (`id`),
  CONSTRAINT `custom_user_customuser_groups_group_id_bdb860ae_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_customuser_groups`
--

LOCK TABLES `custom_user_customuser_groups` WRITE;
/*!40000 ALTER TABLE `custom_user_customuser_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_customuser_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `custom_user_customuser_user_permissions`
--

DROP TABLE IF EXISTS `custom_user_customuser_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `custom_user_customuser_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `customuser_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `custom_user_customuser_u_customuser_id_permission_797be134_uniq` (`customuser_id`,`permission_id`),
  KEY `custom_user_customus_permission_id_7d0938cd_fk_auth_perm` (`permission_id`),
  CONSTRAINT `custom_user_customus_customuser_id_e46769ac_fk_custom_us` FOREIGN KEY (`customuser_id`) REFERENCES `custom_user_customuser` (`id`),
  CONSTRAINT `custom_user_customus_permission_id_7d0938cd_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `custom_user_customuser_user_permissions`
--

LOCK TABLES `custom_user_customuser_user_permissions` WRITE;
/*!40000 ALTER TABLE `custom_user_customuser_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `custom_user_customuser_user_permissions` ENABLE KEYS */;
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
  KEY `django_admin_log_user_id_c564eba6_fk_custom_user_customuser_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_custom_user_customuser_id` FOREIGN KEY (`user_id`) REFERENCES `custom_user_customuser` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
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
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (1,'admin','logentry'),(3,'auth','group'),(2,'auth','permission'),(4,'contenttypes','contenttype'),(8,'custom_user','countries'),(9,'custom_user','customuser'),(6,'home','pregunta'),(7,'home','tema'),(5,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2022-12-02 15:17:46.820324'),(2,'contenttypes','0002_remove_content_type_name','2022-12-02 15:17:46.987936'),(3,'auth','0001_initial','2022-12-02 15:17:49.551761'),(4,'auth','0002_alter_permission_name_max_length','2022-12-02 15:17:50.416050'),(5,'auth','0003_alter_user_email_max_length','2022-12-02 15:17:50.448380'),(6,'auth','0004_alter_user_username_opts','2022-12-02 15:17:50.470349'),(7,'auth','0005_alter_user_last_login_null','2022-12-02 15:17:50.514931'),(8,'auth','0006_require_contenttypes_0002','2022-12-02 15:17:50.545197'),(9,'auth','0007_alter_validators_add_error_messages','2022-12-02 15:17:50.586652'),(10,'auth','0008_alter_user_username_max_length','2022-12-02 15:17:50.637778'),(11,'auth','0009_alter_user_last_name_max_length','2022-12-02 15:17:50.674804'),(12,'auth','0010_alter_group_name_max_length','2022-12-02 15:17:50.863010'),(13,'auth','0011_update_proxy_permissions','2022-12-02 15:17:50.887548'),(14,'auth','0012_alter_user_first_name_max_length','2022-12-02 15:17:50.914099'),(15,'custom_user','0001_initial','2022-12-02 15:17:52.001826'),(16,'admin','0001_initial','2022-12-02 15:17:52.443269'),(17,'admin','0002_logentry_remove_auto_add','2022-12-02 15:17:52.466840'),(18,'admin','0003_logentry_add_action_flag_choices','2022-12-02 15:17:52.496942'),(19,'home','0001_initial','2022-12-02 15:17:52.521462'),(20,'sessions','0001_initial','2022-12-02 15:17:52.670115');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_session`
--

LOCK TABLES `django_session` WRITE;
/*!40000 ALTER TABLE `django_session` DISABLE KEYS */;
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `idPregunta` int unsigned NOT NULL AUTO_INCREMENT,
  `respuesta` tinyint unsigned NOT NULL,
  `pregunta` varchar(300) NOT NULL,
  `opcion1` varchar(100) DEFAULT NULL,
  `opcion2` varchar(100) DEFAULT NULL,
  `opcion3` varchar(100) DEFAULT NULL,
  `opcion4` varchar(100) DEFAULT NULL,
  `opcion5` varchar(100) DEFAULT NULL,
  `Tema_idTema` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fk_Pregunta_Tema1_idx` (`Tema_idTema`),
  CONSTRAINT `fk_Pregunta_Tema1` FOREIGN KEY (`Tema_idTema`) REFERENCES `tema` (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=208 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
INSERT INTO `pregunta` VALUES (1,3,'??Qui??n ostenta el t??tulo de haber tenido el mandato m??s corto de la historia de los presidentes de Estados Unidos?','Abraham Lincoln','George Washington','Henry Harrison','John F. Kennedy','Barack Obama',9),(2,3,'??Qu?? l??der tribal luch?? contra la ocupaci??n romana de Gran Breta??a (Britania)?','T??cito','Prasutagus','Boudica','Ariovistus','nan',9),(3,4,'??Con qu?? nombre se conoce el esc??ndalo que oblig?? al presidente estadounidense Richard Nixon a dimitir?','Vietnam','Powergate','NixonProcess','Watergate','nan',9),(4,1,'??Qu?? esposas de Enrique VIII fueron decapitadas?','Ana Bolena y Catherine Howard','Ana de Cl??veris y Ana Bolena','Ana Bolena y Catalina de Arag??n','Catalina Howard y Catalina Parr','nan',9),(5,4,'??Qu?? emperador romano legaliz?? el cristianismo y puso fin a la persecuci??n de los cristianos?','Ner??n','Adriano','Trajano','Constantino','nan',9),(6,1,'??Cu??ntas personas murieron durante el Gran Incendio de Londres de 1666 seg??n los registros?','6','60','600','6000','60000',9),(7,2,'??Qu?? hito inform??tico de 1969 cambiar??a radicalmente el curso de la historia de la humanidad?','El primer ordenador personal','Internet','El primer router wi-fi','El primer iPod','nan',9),(8,4,'??Qui??n fue el primer Presidente de Estados Unidos?','Abraham Lincoln','Thomas Jefferson','Andrew Jackson','George Washington','nan',9),(9,2,'??Por qu?? es significativo el Poema de Gilgamesh?','Es el primer documento escrito sobre la adopci??n del monote??smo en el Medio Oriente','Es la primera obra ??pica que hace referencia a la inmortalidad y la percepci??n humana del alma','Fue un libro de estrategia militar de 500 p??ginas que sirvi?? en la antigua Mesopotamia','El tratado m??s antiguo que existe sobre el Inframundo.','nan',9),(10,1,'??Cu??l es el nombre de la famosa batalla donde Napole??n Bonaparte fue derrotado?','La batalla de Waterloo','La batalla del ??lamo','La batalla de Stalingrado','La batalla de Hastings','nan',9),(11,3,'??A trav??s de qu?? r??o africano se alz?? el antiguo Egipto?','Amazonas','Tigris','Nilo','??ufrates','nan',9),(12,2,'El vomitorium era una sala especial presente en las fiestas romanas donde los comensales pod??an ir y vomitar para dejar espacio en el est??mago para m??s comida.','VERDADERO','FALSO','nan','nan','nan',9),(13,1,'??A qu?? fil??sofo griego se atribuye la famosa obra ???La Rep??blica????','Plat??n','S??crates','Arist??teles','Ptolomeo','nan',9),(14,3,'??Qu?? facci??n dirigi?? MaoZedong durante la guerra civil China?','Confederados','Protestantes','Comunistas','Nacionalistas','nan',9),(15,4,'??En qu?? a??o se disolvi?? la Uni??n Sovi??tica?','En 1981','En 1987','En 1989','En 1991','nan',9),(16,3,'??Qu?? cient??fico es considerado el Padre de la Bomba At??mica?','Jonas Salk','Albert Einstein','Robert Oppenheimer','Le?? Szil??rd','nan',9),(17,2,'??Qu?? civilizaci??n prehisp??nica ador?? al dios Kukulk??n?','Incas','Mayas','Griegos','Inuit','nan',9),(18,1,'??Es cierto que el primer Premio Nobel fue otorgado en el a??o 1901?','VERDADERO','FALSO','nan','nan','nan',9),(19,3,'El descontento social era patente. ??Seg??n Hitler qui??nes eran los culpables de la miserable situaci??n de Alemania?','Los jud??os','Los comunistas','Ambos','nan','nan',9),(20,2,'Aunque tradicionalmente se les ha llamado aztecas, el nombre aut??ctono de este pueblo era otro. ??Sabes cu??l?','Mayas','Mexicas','Incas','nan','nan',9),(21,1,'??Cu??l era el idioma que hablaban los aztecas?','N??huatl','Quechua','Aymara','nan','nan',9),(22,2,'El t??rmino Renacimiento fue acu??ado por???','Leonardo da Vinci','Giorgio Vasari','William Shakespeare','nan','nan',9),(23,1,'Al Renacimiento pertenecen algunos de los artistas m??s conocidos de la historia. ??Sabr??as decir cu??l de estos NO era renacentista?','Artemisia Gentileschi','Leonardo da Vinci','Tiziano','nan','nan',9),(24,2,'Uno de los primeros campos en que se desarroll?? el Renacimiento fue la literatura. ??Qui??n es conocido como ???el sumo poeta????','Virgilio','Dante Alighieri','Lord Byron','nan','nan',9),(25,1,'En el a??o 323 a.C. una enfermedad acab?? con la vida del conquistador del mayor imperio visto hasta entonces. ??Qui??n era?','Alejandro Magno','Le??nidas','Julio C??sar','nan','nan',9),(26,2,'De la leyenda de R??mulo y Remo proviene tambi??n el animal tot??mico de Roma. ??Sabes cu??l era?','Una hiena','Una loba','Una perra','nan','nan',9),(27,3,'El primer fara??n que orden?? construir una pir??mide en Egipto fue???','Rams??s II','Keops','Djoser','nan','nan',9),(28,2,'El fara??n que ostenta el r??cord de construcci??n de pir??mides es...','Sesostris III','Esnofru','Kefr??n','nan','nan',9),(29,1,'La Gran Pir??mide de Keops es la pir??mide m??s alta de Egipto. ??Sabes d??nde se encuentra?','Gizeh','Abusir','Saqqara','nan','nan',9),(30,2,'??Cu??ntos Km de distancia mide una marat??n?','41.85 km','42.16 km','43.77 km','43.45 km','nan',8),(31,1,'??Cu??les son los cinco colores del anillo de los Juegos Ol??mpicos?','Azul, rojo, amarillo, verde y negro','Azul, rojo, amarillo, verde y violeta','??ndigo, rojo, morado, verde y negro','Azul, rojo, amarillo, naranja y verde','nan',8),(32,3,'??Cu??ntas veces Michael Jordan gan?? campeonatos para los Chicago Bulls?','5','7','6','4','nan',8),(33,3,'??Qu?? deporte tiene un equipo llamado foil?','Polo','Golf','Esgrima','Boxeo','nan',8),(34,2,'??Por qu?? deporte son conocidos los Cachorros de Chicago y los Medias Rojas de Boston?','Baloncesto','B??isbol','Tenis','V??leibol','nan',8),(35,1,'??Qu?? deporte de los Juegos Ol??mpicos implica pliegues y picas?','Nataci??n','Esgrima','Bolos','Polo','nan',8),(36,2,'??Manny Pacquiao es un boxeador legendario de qu?? pa??s?','Corea','Filipinas','China','M??xico','nan',8),(37,1,'??C??mo se llama Tyson Fury?','Rey gitano','Maestro boxeador','Pacman','Pu??o Nacional','nan',8),(38,2,'??Cu??nto dura un round t??pico de boxeo para hombres?','2 minutos','3 minutos','4 minutos','5 minutos','nan',8),(39,1,'??Cu??ntos puntos vale un tiro libre en baloncesto?','1 punto','2 puntos','3 puntos','4 puntos','nan',8),(40,3,'??Cu??l es el ???Rey de los Deportes????','Baloncesto','B??isbol','F??tbol','Hockey sobre hielo','nan',8),(41,1,'??Cada cu??ntos a??os se realizan los Juegos Ol??mpicos?','Cada 4 a??os','Cada 3 a??os','Cada 2 a??os','Todos los a??os','nan',8),(42,3,'??Qu?? parte de tu cuerpo no debe tocar el bal??n en el f??tbol?','Cabeza','Pierna','Mano','Espalda','nan',8),(43,3,'??Cu??l de los siguientes deportes no usa una pelota?','Golf','Tenis','Hockey','Polo','nan',8),(44,2,'??Cu??ntos jugadores hay en un equipo de b??isbol?','10','9','8','7','nan',8),(45,3,'??Cu??l es el significado de NBA?','Administraci??n Nacional de Canasta','Administraci??n Nacional de Baloncesto','Asociaci??n Nacional de Basquetbol','Administraci??n Nacional de Canasta','nan',8),(46,1,'En baloncesto, el jugador que trae la pelota al otro lado de la cancha y corre la ofensiva se llama ???','Base','Alero','Delantero','Pivot','nan',8),(47,1,'??C??mo llamas a la cancha de f??tbol?','Terreno de juego','Corte','Campo','Bol','nan',8),(48,3,'??Cu??ntos rounds hay en un solo juego de boxeo profesional?','5','8','12','15','nan',8),(49,1,'??En el boxeo, TKO significa?','Noqueo t??cnico','Expulsi??n t??cnica','Krankout T??cnico','Imitaci??n t??cnica','nan',8),(50,3,'Es el ??nico deporte en el que los competidores corren hacia la meta, pero nunca la cruzan. ??Qu?? es?','Atletismo','Lanzamiento de jabalina','Nataci??n','Carrera de 800 metros','nan',8),(51,3,'??Cu??l era el nombre del primer caballo ganador en la carrera de caballos Grand National en 1839?','Afortunado','Campe??n','Loter??a','Jugador','nan',8),(52,3,'??C??mo llamas a tres strikes consecutivos en un juego de bolos?','Amor','Falta','Pavo','Orinal','nan',8),(53,1,'??Qu?? equipo de la NBA tiene la racha ganadora m??s larga?','LA Lakers','Los Toros de Chicago','Guerreros del Estado Dorado','Caballeros de Cleveland','nan',8),(54,2,'??Qui??n es el mejor boxeador de todos los tiempos?','Manny Pacquiao','Muhammad Al??','Floyd Mayweather','Mike Tyson','nan',8),(55,3,'??Qui??n tiene m??s goles en el f??tbol?','Lionel Messi','Zlatan Ibrahimovic','Cristiano Ronaldo','Pel??','nan',8),(56,3,'??En qu?? pa??s se disput?? la Copa Mundial de F??tbol del a??o 2006?','Rusia','Brasil','Alemania','Sud??frica','nan',8),(57,4,'??Qu?? tipo de competici??n es el Giro de Italia?','Una carrera automovil??stica','Una competencia de atletismo','Un torneo de golf','Una competici??n de ciclismo','nan',8),(58,1,'??A cu??l trofeo de f??tbol se le conoce popularmente como ???La Orejona????','Al trofeo de la UEFA Champions League','Al trofeo de la Liga Espa??ola de F??tbol','Al trofeo de la Copa Mundial de F??tbol','nan','nan',8),(59,2,'El jugador con m??s puntos anotados en la historia de la NBA es???','Michael Jordan','Kareem Abdul-Jabbar','Kobe Bryant','LeBron James','nan',8),(60,1,'\"No es tan dif??cil hacer dinero cuando es solo hacer dinero lo que se pretende\". ??A qu?? pel??cula corresponde esta frase?','Ciudadano Kane','El color del dinero','El lobo de Wall Street','Tarde de perros','nan',14),(61,3,'Los dinosaurios se pusieron de moda gracias a esta pel??cula.','En busca del valle encantado','King Kong','Parque Jur??sico','Godzilla','nan',14),(62,3,'El modelo T-800 conforma uno de los robots m??s famosos de la historia de la ciencia ficci??n. Aparece en...','Yo, Robot','Cortocircuito','Terminator','Robocop','nan',14),(63,4,'Si te hablamos de la pel??cula de zombis por excelencia dir??as que es???','Re-animator','Braindead','28 d??as despu??s','La noche de los muertos vivientes','nan',14),(64,2,'Un anillo para gobernarlos a todos. Un anillo para encontrarlos, para atraerlos a todos y atarlos en las tinieblas. ??A qu?? famosa pel??cula nos referimos?','El laberinto del Fauno','El Se??or de los Anillos','La Torre Oscura','El misterio del anillo','nan',14),(65,2,'??Cu??l es la frase m??s famosa del personaje de Darth Vader?','???Me ha fallado por ??ltima vez, almirante???','\"Su falta de fe me resulta perturbadora???','???Ese nombre ya no significa nada para m?????','???No conoces el poder del lado oscuro???','nan',14),(66,1,'??Cu??l era el apellido original de Luke en Star Wars Episodio IV antes de ser bautizado como Skywalker?','Starkiller','Organa','Dameron','Skyfort','nan',14),(67,3,'??C??mo se llama el planeta de origen del maestro Yoda?','Hoth','Tatooine','Dagobah','Naboo','nan',14),(68,4,'Uno de estos robots no pertenece a la saga de Star Wars. ??Cu??l?','BB-8','C-3PO','D-0','T-800','nan',14),(69,2,'??Cu??l fue la primera grabaci??n de Rock and Roll?','Una canci??n de Elvis Presley','Una canci??n de Chuck Berry','Una canci??n de Little Richard','Una canci??n de Bill Haley','nan',14),(70,1,'??Cu??l de los siguientes cantantes pronunci?? la frase \"Prefiero que me odien por lo que soy a que me admiren por lo que nunca ser??\"?','Kurt Cobain','Jim Morrison','John Lennon','Freddie Mercury','nan',14),(71,3,'??Cu??l de estas canciones no es del grupo inmortal Queen?','Dont Stop me now','Tie your mother down','Where are we now?','These are the days of our lives','nan',14),(72,4,'Con cu??l de estos juegos no aprender??as nada de historia','Age of Empires','Ryse: Son of Rome','Commandos','Soul Blade','nan',14),(73,1,'??Hay alg??n juego en el que el m??tico personaje de Mario sea el villano en vez del h??roe?','S??','No','nan','nan','nan',14),(74,4,'??Qu?? significa el nombre de Kratos?','Dios','Venganza','Guerra','Fuerza','nan',14),(75,3,'El 4 de febrero de 2004 se fund?? una de las redes sociales m??s punteras hoy d??a. Es???','Instagram','Twitter','Facebook','nan','nan',14),(76,1,'??Recuerdas c??mo se llaman las barritas de chocolate que aparecen en varios cap??tulos de ???Lost????','Apollo','Oceanic','Jumbo','nan','nan',14),(77,1,'??Qui??n es el creador de la serie Black Mirror?','Charlie Brooker','Laura Christensen','Derek Simons','nan','nan',14),(78,2,'??En qu?? temporada el personaje de Will de ???Stranger Things??? es pose??do por ???el desuellamentes????','Uno','Dos','Tres','nan','nan',14),(79,2,'??Por qu?? estaba Fox Mulder de \"Expediente X??? obsesionado con extraterrestres y secuestros alien??genas?','Ten??a visiones acerca de que estaba destinado a comunicarse con una especie alien??gena','Fue testigo de c??mo su hermana fue secuestrada por extraterrestres cuando era ni??o.','Su padre fue asesinado por un escuadr??n de la muerte extraterrestre en la Guerra de Corea.','nan','nan',14),(80,1,'??En qu?? a??o muri?? Bob Marley?','1981','1986','1991','2003','nan',14),(81,4,'??Cu??l es el nombre de la \"herramienta\" necesaria para jugar al billar?','Palo','Snooker','Bubingo','Taco','nan',14),(82,4,'??Cu??l es la pel??cula que m??s Oscars ha ganado en la historia?','Titanic','El se??or de los anillos: el retorno del Rey','Ben Hur','Todas las anteriores','Titanic y El se??or de los anillos: el retorno del Rey',14),(83,3,'??En qu?? pel??cula de la Saga de Star Wars la princesa Leia empieza a usar la fuerza?','Episodio V','Episodio VII','Episodio VI','Episodio IV','Episodio III',14),(84,3,'??En qu?? pel??cula sacrifican un conejo por celos?','Retrato de una obsesi??n','Una propuesta indecente','Bajos instintos','Atracci??n fatal','??tame',14),(85,1,'Primera banda famosa de Charly Garc??a','Ser?? Gir??n','La m??quina de hacer p??jaros','Sui Generis','nan','nan',14),(86,1,'Canci??n que fue compuesta por The Beatles y grabada primero por The Rolling Stones','I wanna be your man','Rock and roll music','Bad boy','nan','nan',14),(87,3,'??Cu??l de estos no es un disco de Led Zeppelin?','In Through The Out Door','Coda','Signals','nan','nan',14),(88,2,'??En qu?? a??o se form?? Nirvana?','1990','1987','1989','nan','nan',14),(89,3,'Completa el tema de Soda Stereo: ???Pero ese ruido blanco??????','Como podremos sobrevivir','Es una alarma en mis ojos','Es una alarma en mis o??dos','nan','nan',14),(90,2,'Albert Einstein fue el cient??fico que formul?? la ley de gravitaci??n universal','Verdadero','Falso','nan','nan','nan',10),(91,4,'??A cual elemento qu??mico pertenece el s??mbolo \"Na\"?','Potasio','Cloro','Magnesio','Sodio','nan',10),(92,3,'??Cu??l es el punto de ebullici??n del agua?','50 ??C','80 ??C','100 ??C','137 ??C','235 ??C',10),(93,1,'??Cu??l es la velocidad de la luz?','300.000 Km/s','100.000 Km/s','1.000 Km/s','3.000 Km/s','5.000 Km/s',10),(94,1,'Los virus son generalmente m??s peque??os que las bacterias','Verdadero','Falso','nan','nan','nan',10),(95,5,'??Cada cu??ntos a??os se puede ver a simple vista el cometa Halley?','23 a??os','10 a??os','150 a??os','100 a??os','75 a??os',10),(96,2,'??C??mo se llama la capa m??s externa de nuestro planeta?','Hidr??sfera','Atm??sfera','Lit??sfera','Cri??sfera','nan',10),(97,1,'??Qu?? contiene el n??cleo de una c??lula?','ADN','Mitocondrias','Ribosomas','Citoplasma','nan',10),(98,3,'??Cu??l es el sat??lite natural de la Tierra?','El sol','Marte','La luna','J??piter','Neptuno',10),(99,4,'??Cu??l de estas NO es una parte del intestino delgado?','Duodeno','Yeyuno','??leon','Recto','nan',10),(100,3,'??Cu??ntos cromosomas tiene una c??lula humana?','13 pares','53 pares','23 pares','100 pares','90 pares',10),(101,1,'Una papa tiene m??s cromosomas que un humano','Verdadero','Falso','nan','nan','nan',10),(102,2,'??C??mo se llama la estructura celular encargada de producir energ??a?','Ribosoma','Mitocondria','Lisosoma','Peroxisoma','ADN',10),(103,2,'??En cu??l capa de la Tierra se encuentran las placas tect??nicas?','Atm??sfera','Lit??sfera','Cri??sfera','Hidr??sfera','nan',10),(104,2,'??C??mo se llama el pigmento verde de las plantas?','Tallo','Clorofila','Caroteno','Yodo','Polifenol',10),(105,2,'??Cu??l es el elemento m??s abundante en el universo conocido?','Helio','Hidr??geno','Carbono','Azufre','Ox??geno',10),(106,5,'??Cu??l de estos fil??sofos griegos introdujo el t??rmino de \"??tomos\"?','Pit??goras','Plat??n','S??crates','Arist??teles','Dem??crito',10),(107,3,'??Qu?? animal utiliz?? Schr??dinger para crear su famosa paradoja?','Un perro','Una rata','Un gato','Una liebre','Un pez',10),(108,3,'??En qu?? a??o se utiliz?? la primera vacuna de la historia?','1320','1993','1796','1216','1568',10),(109,1,'??Cu??l es la unidad fundamental de las prote??nas?','Amino??cidos','Vitaminas','L??pidos','Minerales','Carbohidratos',10),(110,3,'??Cu??l es la unidad de medida de la presi??n?','Kilogramo','Metro','Pascal','Newton','A??os luz',10),(111,2,'??D??nde naci?? Isaac Newton?','Finlandia','Inglaterra','Francia','Alemania','Rusia',10),(112,2,'??Cu??l era el nombre de la misi??n encargada de llevar por primera vez al hombre a la luna?','Apolo','Apolo 11','Andr??meda 6','Centauro','Andr??meda 4',10),(113,5,'??Cu??l es el planeta m??s grande del sistema solar?','Marte','Saturno','Neptuno','Mercurio','J??piter',10),(114,2,'??Cu??l es el animal m??s grande del mundo?','Elefante','Ballena azul','Tibur??n blanco','Jirafa','Le??n',10),(115,3,'??C??mo se llama el pigmento oscuro que le da color a la piel?','Melatonina','Clorofila','Melanina','Caroteno','Vimentina',10),(116,2,'??De qu?? sustancia est??n compuestas las u??as?','Melatonina','Queratina','Marfil','Vimentina','Caroteno',10),(117,3,'??De qu?? sustancia est??n compuestos los colmillos de un elefante?','Melatonina','Queratina','Marfil','Vimentina','Melanina',10),(118,1,'??Cu??l es el s??mbolo qu??mico del oro?','Au','O','H','Or','Ag',10),(119,4,'??Cu??l rama de la qu??mica estudia los procesos qu??micos que tienen lugar en los seres vivos?','Qu??mica org??nica','Qu??mica inorg??nica','Biolog??a','Qu??mica industrial','Bioqu??mica',10),(120,4,'??Qu?? es Zelandia?','Una ciudad islandesa','Un parque tem??tico','Un pa??s del hemisferio norte','Un continente','nan',12),(121,4,'El punto m??s profundo de la fosa de las Marianas est?? exactamente a...','11.144 metros de profundidad','11.054 metros de profundidad','11.044 metros de profundidad','11.034 metros de profundidad','nan',12),(122,1,'??Cu??l es el pa??s de los 1.000 lagos?','Finlandia','Estados Unidos','Canad??','Brasil','nan',12),(123,3,'??D??nde est?? la regi??n m??s pobre del mundo?','En Zimbabue','En Honduras','En Sahel','En Nepal','nan',12),(124,2,'El r??o m??s largo de Europa es...','El Tajo','El Volga','El T??mesis','El Ebro','nan',12),(125,1,'??D??nde est??n las ruinas de Esparta?','En Grecia','En Francia','En Italia','En Turqu??a','nan',12),(126,4,'??Sabes cu??l es la ciudad m??s antigua del mundo?','Luxor','Ur','Biblos','Jeric??','nan',12),(127,4,'??C??mo se llama la l??nea imaginaria que pasa por el centro del Polo Norte y del Polo Sur?','Primer eje','Eje central','Meridiano global primario','Primer meridiano','nan',12),(128,1,'Dodoma es capital de...','Tanzania','Nairobi','Kinsasa','Uagadug??','nan',12),(129,3,'??Qu?? pa??ses ba??a el mar Muerto?','Egipto, Sud??n y Eritrea','Rusia, Ir??n y Azerbaiy??n','Israel, Jordania y Palestina','Grecia y Turqu??a','nan',12),(130,3,'??Con qu?? pa??ses limita Argentina?','Uruguay, Chile, Paraguay y Ecuador','Chile, Brasil, Uruguay, Paraguay, Oc??ano Atl??ntico','Chile, Bolivia, Paraguay, Brasil, Uruguay','Ninguna de las anteriores','nan',12),(131,2,'??En qu?? continente se encuentra Argentina?','Am??rica del Norte','Am??rica del Sur','Europa','	Asia','nan',12),(132,3,'Por cu??ntas provincias est?? compuesta la Argentina?','24','23','23 m??s la Ciudad Aut??noma de Buenos Aires','Ninguna es correcta','nan',12),(133,3,'Capital de Argentina','Argentina','La Plata','Buenos Aires','Mar del Plata','nan',12),(134,2,'??En qu?? hemisferio se encuentra Argentina?','Oriental','Occidental','nan','nan','nan',12),(135,3,'Guatemala es:','Un pa??s','Una ciudad','Ambas son ciertas','nan','nan',12),(136,3,'??Cu??l es el pico m??s alto de Espa??a?','Mulhac??n','Veleta','Teide','nan','nan',12),(137,2,'??D??nde y cu??l es el lago m??s profundo del mundo?','Tanganica, Tanzania','Baikal, Rusia','Malaui, Mozambique y Malaui','nan','nan',12),(138,3,'??Qu?? pa??s comparte frontera con Hait???','El Salvador','Puerto Rico','Rep??blica Dominicana','nan','nan',12),(139,3,'??Entre qu?? territorios se encuentra el estrecho Bering?','Canad?? y EE. UU','Marruecos y Espa??a','Rusia y Alaska','nan','nan',12),(140,2,'??D??nde se encuentra el Museo del Prado?','Mil??n, Italia','Madrid, Espa??a','Par??s, Francia','nan','nan',12),(141,1,'El ??nico mar del mundo sin costas es:','Mar de los Sargazos','Mar de Albor??n','Mar Muerto','nan','nan',12),(142,1,'La capital de Armenia es:','Erev??n','Grozni','Tiflis','nan','nan',12),(143,1,'La Ciudad Eterna es:','Roma','Atenas','Mil??n','nan','nan',12),(144,1,'Francia es el pa??s:','M??s grande de la Uni??n Europea','M??s peque??o de Europa','Ninguna de las anteriores','nan','nan',12),(145,2,'El T??mesis es un r??o de:','Grecia','Reino Unido','Portugal','nan','nan',12),(146,1,'El Cairo, capital de:','Egipto','Arabia Saudita','Brasil','nan','nan',12),(147,1,'Los colores de la bandera de Noruega son:','Rojo, azul, blanco','Rojo, verde, amarillo','Celeste, blanco, celeste','nan','nan',12),(148,2,'Templo Expiatorio de la Sagrada Familia se encuentra en:','Madrid','Barcelona','Sevilla','nan','nan',12),(149,1,'??Cu??ntas cuerdas suele tener un bajo el??ctrico?','Cuatro','Seis','Ocho','Cinco','Ninguna de las anteriores',11),(150,2,'??Cu??l de estos pintores hace pinturas con forma geom??tricas? ','Dali','Picasso','Van Gogh','Kahlo','Ninguna de las anteriores',11),(151,3,'??Con qu?? cualidad describir??as a Tom Sawyer?','Ordenado','Responsable','Travieso','Curioso','Ninguna de las anteriores',11),(152,1,'??A qu?? familia de instrumentos pertenece la guitarra, el viol??n y el bajo?','Cuerdas','Viento','Percusion','nan','nan',11),(153,1,'??Cu??ntos dedos tiene por lo general un personaje de caricatura?','Cuatro','Cinco','Seis','Tres','Ninguna de las anteriores',11),(154,4,'??Qu?? nota musical hay entre re y fa?','Sol','Fa','Do','Mi','Ninguna de las anteriores',11),(155,3,'??Qu?? parte del cuerpo se cort?? Vicent Van Gogh? ','Dedo','Mano','Oreja','Pierna','Ninguna de las anteriores',11),(156,4,'??Qui??n pint?? la obra mundialmente conocida con el nombre de \"Mona Lisa\" o \"Gioconda\"?','Monet','Picasso','Dali','Da Vinci','Ninguna de las anteriores',11),(157,2,'??Qu?? ten??a Salvador Dal?? de caracter??stico?','La sonrisa','El bigote','Las cejas','La nariz','Ninguna de las anteriores',11),(158,1,'??Qui??n es el autor de la obra: Viaje al centro de la Tierra?','Julio Verne','Edgar Alan Poe','Oscar Wilde','George Orwell','Ninguna de las anteriores',11),(159,3,'??D??nde se encontraba el cuadro \"El Grito\"? ','Inglaterra','Espa??a','Francia','Italia','Ninguna de las anteriores',11),(160,2,'??A qu?? ciudad vasca dedic?? un cuadro Pablo Picasso?','Barcelona','Guernica','Madrid','Galicia','Ninguna de las anteriores',11),(161,3,'??Qu?? importante pieza de arte fue robada y guardada debajo de una cama hasta que se devolvi?? al Museo Louvre? ','La noche estrellada','Guernica','Mona Lisa','El Grito','Ninguna de las anteriores',11),(162,1,'??Cu??l de estos artistas se destac?? por su estilo impresionista?','Monet','Da Vinci','Picasso','Van Gogh','Ninguna de las anteriores',11),(163,2,'??Cu??l es la tesitura m??s alta de voz masculina?','Tenor','Contratenor','Soprano','Bajo','Ninguna de las anteriores',11),(164,4,'??Cu??l es el estilo de la catedral de Burgos?','Neoclasico','Mudejar','Barroco','Gotico','Ninguna de las anteriores',11),(165,1,'??En qu?? pa??s naci?? el escritor Jorge Lu??s Borges?','Argentina','Uruguay','Brasil','Mexico','Ninguna de las anteriores',11),(166,3,'??De qu?? pa??s es la caricatura \"Condorito\"? ','Argentina','Uruguay','Chile','Brasil','Ninguna de las anteriores',11),(167,3,'??A qu?? corriente pertenece Garcilaso de la Vega?','Postmodernismo','Romantico','Renacimiento','Barroco','Ninguna de las anteriores',11),(168,4,'??Cu??ntos \"gritos\" pint?? Munch?','Uno','Dos','Tres','Cuatro','Ninguna de las anteriores',11),(169,2,'??Qui??n de estos artistas pint?? \"Los relojes derretidos\"?','Van Gogh','Dali','Picasso','Rembrandt','Ninguna de las anteriores',11),(170,3,'??De qu?? nacionalidad era Leonardo Da Vinci? ','Espa??ol','Ingles','Italiano','Polaco','Ninguna de las anteriores',11),(171,1,'??Cu??l es la ciudad europea sede del prestigioso Teatro Negro? ','Praga','Madrid','Munich','Londres','Ninguna de las anteriores',11),(172,5,'??Cu??l es el nombre de Picasso? ','Martin','Pedro','Lucas','Tomas','Ninguna de las anteriores',11),(173,1,'Harry Potter fue escrita por... ','JK Rowling','George Orwell','Oscar Wilde','Julio Cortazar','Ninguna de las anteriores',11),(174,2,'??C??mo es Ob??lix?','Alto','Gordo','Enano','Flaco','Ninguna de las anteriores',11),(175,1,'??Qui??n es el autor de \"Las Cuatro Estaciones\"? ','Vivaldi','Mozart','Beethoven','Bach','Ninguna de las anteriores',11),(176,3,'??C??mo se llama al conjunto de 5 l??neas y 4 espacios que se usa para componer m??sica?','Anagrama','Crusigrama','Pentagrama','Musigrama','Ninguna de las anteriores',11),(177,3,'??Cu??l compositor de m??sica cl??sica quedo sordo?','Vivaldi','Mozart','Beethoven','Bach','Ninguna de las anteriores',11),(178,4,'??En qu?? a??o se suicid?? Van Gogh?','1950','1920','1850','1890','Ninguna de las anteriores',11),(179,3,'En JS. ??Qu?? conseguimos con la l??nea de c??digo event.preventDefault?','Lanza un evento llamado preventDefault.','Ejecutar un m??todo que habr?? que definir y se llamar?? preventDefault','Desasignar la respuesta por defecto de un evento.','Ninguna de las tres anteriores es correcta','nan',13),(180,2,'En JS. function calculo(x) { return (!x); } .??Que devolver??a la funci??n si la invoco como calculo(undefined)?','\"undefined\"','true','false','undefined','nan',13),(181,3,'En JS. ??C??mo cargar??amos una librer??a Javascript dentro de una p??gina web?','<link href=\"/js/milibreria.js\" rel=\"script\" type=\"text/javascript\"/>','<a href=\"/js/milibreria.js\">Libreria</a>','<script type=\"text/javascript\" src=\"/js/milibreria.js\"></script>','Ninguna de las anteriores respuestas es v??lida','nan',13),(182,1,'En JS. ??Para el sirve el m??todo toFixed()?','Convierte una cadena en un n??mero con tantos decimales como le indiquemos en el par??metro','Mezcla dos cadenas que se le pasan como par??metro','Nos permite sumar n??meros que contengan decimales','Sirve para mezclar una cadena con un n??mero. Ambos valores se le pasan como par??metro','nan',13),(183,1,'??La diferencia entre un ciclo for y un ciclo while es que el while se ejecuta en base a una condici??n, mientras que el for lo hace en base a una secuencia?','Verdadero','Falso','nan','nan','nan',13),(184,2,'??Una caracter??stica del ciclo while es que no conocemos con anticipaci??n el n??mero de iteraciones?','Falso','Verdadero','nan','nan','nan',13),(185,1,'??Es posible tener un ciclo infinito sobre un for en Python?','Falso','Verdadero','nan','nan','nan',13),(186,4,'??Cu??l de estos tipos de datos es mutable en Python ','bool','decimal','float','Ninguno de los anteriores','nan',13),(187,1,'??Los strings en Python son inmutables?','Verdadero','Falso','nan','nan','nan',13),(188,1,'En Python las listas son mutables.','Verdadero','Falso','nan','nan','nan',13),(189,4,'??Cu??l de estos tipos de datos es inmutable en Python?','diccionarios','bytearrays','sets','Ninguno de los anteriores','nan',13),(190,2,'El lenguaje COBOL no exist??a en los a??os 70','Verdadero','Falso','nan','nan','nan',13),(191,1,'Miranda es un lenguaje de programaci??n','Verdadero','Falso','nan','nan','nan',13),(192,2,'El lenguaje Fortran fue originalmente desarrollado por Apple','Verdadero','Falso','nan','nan','nan',13),(193,2,'El lenguaje Java exist??a ya en los a??os 60','Verdadero','Falso','nan','nan','nan',13),(194,3,'??Cu??l de estas dos respuestas es un lenguaje de programaci??n?','C','J','Ambos son lenguajes de programaci??n','nan','nan',13),(195,1,'Uno de estos dos lenguajes es orientado a objetos. ??Cual?','Java','C++','Ambos lo son','nan','nan',13),(196,1,'Modula-2 y Pascal fueron creados por la misma persona','Verdadero','Falso','nan','nan','nan',13),(197,2,'??Cu??l de estas frases es verdadera si hablamos del lenguaje Ada?','No es un lenguaje orientado a objetos','Se suele utilizar en aplicaciones de defensa, seguridad, aeron??utica, etc.','Ambas son correctas','nan','nan',13),(198,1,'BASIC se dise???? en los a??os 70','Verdadero','Falso','nan','nan','nan',13),(199,3,'??Cu??l de estos no es un lenguaje de programaci??n?','JCL','Limbo','MS-DOS','nan','nan',13),(200,2,'El lenguaje C es un lenguaje de programaci??n orientado a objetos','Verdadero','Falso','nan','nan','nan',13),(201,2,'JavaScript ya exist??a en los a??os 80','Verdadero','Falso','nan','nan','nan',13),(202,5,'El nombre del lenguaje de programaci??n Julia es debido a...','...la creadora del lenguaje','...la esposa del creador del lenguaje','...un matem??tico franc??s','...una matem??tica francesa','...a que parec??a un nombre bonito',13),(203,2,'??En qu?? etiqueta HTML podemos escribir c??digo JavaScript?','<javascript>','<script>','<js>','nan','nan',13),(204,3,'??Qu?? salida tendr?? el siguiente c??digo JavaScript?\nlet num = \"2\" + 2;\nconsole.log(num);','2','3','22','nan','nan',13),(205,1,'??Que extension tiene una clase Java?','.java','.class','.hex','Ninguna de las anteriores.','nan',13),(206,2,'??Java es open source?','Verdadero','Falso','nan','nan','nan',13),(207,2,'??J2ME es un lenguaje de programacion?','Verdadero','Falso','nan','nan','nan',13);
/*!40000 ALTER TABLE `pregunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `puntuacionmax`
--

DROP TABLE IF EXISTS `puntuacionmax`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `puntuacionmax` (
  `idPuntuacion` int NOT NULL AUTO_INCREMENT,
  `puntuacion` tinyint unsigned NOT NULL,
  `fecha` date NOT NULL,
  `Tema_idTema` tinyint unsigned NOT NULL,
  `Usuario_idUsuario` int unsigned NOT NULL,
  PRIMARY KEY (`idPuntuacion`),
  KEY `fk_PuntuacionMax_Tema1_idx` (`Tema_idTema`),
  KEY `fk_PuntuacionMax_Usuario1_idx` (`Usuario_idUsuario`),
  CONSTRAINT `fk_PuntuacionMax_Tema1` FOREIGN KEY (`Tema_idTema`) REFERENCES `tema` (`idTema`),
  CONSTRAINT `fk_PuntuacionMax_Usuario1` FOREIGN KEY (`Usuario_idUsuario`) REFERENCES `usuario` (`idUsuario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `puntuacionmax`
--

LOCK TABLES `puntuacionmax` WRITE;
/*!40000 ALTER TABLE `puntuacionmax` DISABLE KEYS */;
/*!40000 ALTER TABLE `puntuacionmax` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tema`
--

DROP TABLE IF EXISTS `tema`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `tema` (
  `idTema` tinyint unsigned NOT NULL AUTO_INCREMENT,
  `Tema` varchar(45) NOT NULL,
  PRIMARY KEY (`idTema`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
INSERT INTO `tema` VALUES (8,'Deporte'),(9,'Historia'),(10,'Ciencias'),(11,'Arte'),(12,'Geograf??a'),(13,'Programaci??n'),(14,'Entretenimiento');
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `usuario` (
  `idUsuario` int unsigned NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `contrasenia` varchar(45) NOT NULL,
  `countries_idCountries` smallint unsigned DEFAULT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `fk_usuario_countries1_idx` (`countries_idCountries`),
  CONSTRAINT `fk_usuario_countries1` FOREIGN KEY (`countries_idCountries`) REFERENCES `countries` (`idCountries`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2022-12-02 12:23:22
