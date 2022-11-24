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
-- Table structure for table `pregunta`
--

DROP TABLE IF EXISTS `pregunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pregunta` (
  `idPregunta` int unsigned NOT NULL AUTO_INCREMENT,
  `respuesta` tinyint unsigned NOT NULL,
  `pregunta` varchar(300) NOT NULL,
  `opcion1` varchar(45) DEFAULT NULL,
  `opcion2` varchar(45) DEFAULT NULL,
  `opcion3` varchar(45) DEFAULT NULL,
  `opcion4` varchar(45) DEFAULT NULL,
  `opcion5` varchar(45) DEFAULT NULL,
  `Tema_idTema` tinyint unsigned NOT NULL,
  PRIMARY KEY (`idPregunta`),
  KEY `fk_Pregunta_Tema1_idx` (`Tema_idTema`),
  CONSTRAINT `fk_Pregunta_Tema1` FOREIGN KEY (`Tema_idTema`) REFERENCES `tema` (`idTema`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pregunta`
--

LOCK TABLES `pregunta` WRITE;
/*!40000 ALTER TABLE `pregunta` DISABLE KEYS */;
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
INSERT INTO `tema` VALUES (8,'Deporte'),(9,'Historia'),(10,'Ciencias'),(11,'Arte'),(12,'Geografía'),(13,'Programación'),(14,'Entretenimiento');
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

-- Dump completed on 2022-11-23 20:26:20
