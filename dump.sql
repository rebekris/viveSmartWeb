-- MySQL dump 10.13  Distrib 5.5.33, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: ruteben_dbvivesmart
-- ------------------------------------------------------
-- Server version	5.5.33-1

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
-- Table structure for table `dm_area`
--

DROP TABLE IF EXISTS `dm_area`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_area` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  `dm_page_view_id` bigint(20) DEFAULT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  KEY `dm_page_view_id_idx` (`dm_page_view_id`),
  CONSTRAINT `dm_area_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_area_dm_page_view_id_dm_page_view_id` FOREIGN KEY (`dm_page_view_id`) REFERENCES `dm_page_view` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_area`
--

LOCK TABLES `dm_area` WRITE;
/*!40000 ALTER TABLE `dm_area` DISABLE KEYS */;
INSERT INTO `dm_area` VALUES (1,NULL,2,'1'),(2,NULL,3,'1');
/*!40000 ALTER TABLE `dm_area` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_auto_seo`
--

DROP TABLE IF EXISTS `dm_auto_seo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_auto_seo` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmAutoSeoModuleAction_idx` (`module`,`action`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_auto_seo`
--

LOCK TABLES `dm_auto_seo` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_auto_seo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_auto_seo_translation`
--

DROP TABLE IF EXISTS `dm_auto_seo_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_auto_seo_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `strip_words` text COLLATE utf8_unicode_ci,
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_auto_seo_translation_id_dm_auto_seo_id` FOREIGN KEY (`id`) REFERENCES `dm_auto_seo` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_auto_seo_translation`
--

LOCK TABLES `dm_auto_seo_translation` WRITE;
/*!40000 ALTER TABLE `dm_auto_seo_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_auto_seo_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_behavior`
--

DROP TABLE IF EXISTS `dm_behavior`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_behavior` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_behavior_key` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dm_behavior_attached_to` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dm_behavior_attached_to_selector` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dm_page_id` bigint(20) DEFAULT NULL,
  `dm_area_id` bigint(20) DEFAULT NULL,
  `dm_zone_id` bigint(20) DEFAULT NULL,
  `dm_widget_id` bigint(20) DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_page_id_idx` (`dm_page_id`),
  KEY `dm_area_id_idx` (`dm_area_id`),
  KEY `dm_zone_id_idx` (`dm_zone_id`),
  KEY `dm_widget_id_idx` (`dm_widget_id`),
  CONSTRAINT `dm_behavior_dm_area_id_dm_area_id` FOREIGN KEY (`dm_area_id`) REFERENCES `dm_area` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_behavior_dm_page_id_dm_page_id` FOREIGN KEY (`dm_page_id`) REFERENCES `dm_page` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_behavior_dm_widget_id_dm_widget_id` FOREIGN KEY (`dm_widget_id`) REFERENCES `dm_widget` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_behavior_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_behavior`
--

LOCK TABLES `dm_behavior` WRITE;
/*!40000 ALTER TABLE `dm_behavior` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_behavior` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_behavior_translation`
--

DROP TABLE IF EXISTS `dm_behavior_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_behavior_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `dm_behavior_enabled` tinyint(1) NOT NULL DEFAULT '1',
  `dm_behavior_value` text COLLATE utf8_unicode_ci,
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_behavior_translation_id_dm_behavior_id` FOREIGN KEY (`id`) REFERENCES `dm_behavior` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_behavior_translation`
--

LOCK TABLES `dm_behavior_translation` WRITE;
/*!40000 ALTER TABLE `dm_behavior_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_behavior_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_bit_ly_url`
--

DROP TABLE IF EXISTS `dm_bit_ly_url`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_bit_ly_url` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `short` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `expanded` text COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `short` (`short`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_bit_ly_url`
--

LOCK TABLES `dm_bit_ly_url` WRITE;
/*!40000 ALTER TABLE `dm_bit_ly_url` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_bit_ly_url` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_catalogue`
--

DROP TABLE IF EXISTS `dm_catalogue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_catalogue` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `source_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  `target_lang` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_catalogue`
--

LOCK TABLES `dm_catalogue` WRITE;
/*!40000 ALTER TABLE `dm_catalogue` DISABLE KEYS */;
INSERT INTO `dm_catalogue` VALUES (1,'messages.es','en','es'),(2,'dm.es','en','es');
/*!40000 ALTER TABLE `dm_catalogue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_error`
--

DROP TABLE IF EXISTS `dm_error`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_error` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `php_class` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `module` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci DEFAULT NULL,
  `uri` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `env` varchar(63) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_error`
--

LOCK TABLES `dm_error` WRITE;
/*!40000 ALTER TABLE `dm_error` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_error` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_group`
--

DROP TABLE IF EXISTS `dm_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_group`
--

LOCK TABLES `dm_group` WRITE;
/*!40000 ALTER TABLE `dm_group` DISABLE KEYS */;
INSERT INTO `dm_group` VALUES (1,'developer','Able to read and update source code','2017-04-03 16:42:41','2017-04-03 16:42:41'),(2,'seo','Seo knowledge','2017-04-03 16:42:41','2017-04-03 16:42:41'),(3,'integrator','Integrator','2017-04-03 16:42:41','2017-04-03 16:42:41'),(4,'webmaster 1','Webmaster level 1','2017-04-03 16:42:41','2017-04-03 16:42:41'),(5,'writer','Writer','2017-04-03 16:42:41','2017-04-03 16:42:41'),(6,'front_editor','Can fast edit front widgets','2017-04-03 16:42:42','2017-04-03 16:42:42');
/*!40000 ALTER TABLE `dm_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_group_permission`
--

DROP TABLE IF EXISTS `dm_group_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_group_permission` (
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_group_id`,`dm_permission_id`),
  KEY `dm_group_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_group_permission_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_group_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_group_permission`
--

LOCK TABLES `dm_group_permission` WRITE;
/*!40000 ALTER TABLE `dm_group_permission` DISABLE KEYS */;
INSERT INTO `dm_group_permission` VALUES (1,1),(2,2),(3,2),(4,2),(5,2),(3,5),(3,9),(4,9),(5,9),(3,10),(3,11),(3,12),(3,13),(3,14),(3,15),(6,16),(6,17),(6,18),(6,19),(6,20),(6,21),(6,22),(3,23),(3,24),(3,25),(2,26),(3,26),(4,26),(5,26),(3,27),(4,27),(5,27),(3,28),(2,30),(3,30),(4,30),(5,30),(2,31),(3,31),(4,31),(3,32),(4,32),(2,33),(3,33),(4,33),(2,34),(3,34),(4,34),(5,34),(3,35),(3,36),(2,37),(2,38),(2,39),(2,41),(2,42),(2,43),(2,44),(2,45),(4,47),(2,48),(3,48),(4,48),(5,48),(2,49),(3,49),(4,49),(5,49),(2,54),(3,54),(4,54),(3,55),(4,55),(3,56),(3,60),(3,61),(3,62),(3,63),(3,64);
/*!40000 ALTER TABLE `dm_group_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_layout`
--

DROP TABLE IF EXISTS `dm_layout`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_layout` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `template` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'page',
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_layout`
--

LOCK TABLES `dm_layout` WRITE;
/*!40000 ALTER TABLE `dm_layout` DISABLE KEYS */;
INSERT INTO `dm_layout` VALUES (1,'Global','page','global');
/*!40000 ALTER TABLE `dm_layout` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_lock`
--

DROP TABLE IF EXISTS `dm_lock`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_lock` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NOT NULL,
  `user_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `time` bigint(20) NOT NULL,
  `app` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `url` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `culture` varchar(15) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmLockIndex_idx` (`user_id`,`module`,`action`,`record_id`),
  KEY `user_id_idx` (`user_id`),
  CONSTRAINT `dm_lock_user_id_dm_user_id` FOREIGN KEY (`user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_lock`
--

LOCK TABLES `dm_lock` WRITE;
/*!40000 ALTER TABLE `dm_lock` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_lock` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_mail_template`
--

DROP TABLE IF EXISTS `dm_mail_template`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_mail_template` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `vars` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_mail_template`
--

LOCK TABLES `dm_mail_template` WRITE;
/*!40000 ALTER TABLE `dm_mail_template` DISABLE KEYS */;
INSERT INTO `dm_mail_template` VALUES (1,'dm_user_forgot_password','username, email, step2_url','2017-04-03 16:42:45','2017-04-03 16:42:45');
/*!40000 ALTER TABLE `dm_mail_template` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_mail_template_translation`
--

DROP TABLE IF EXISTS `dm_mail_template_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_mail_template_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` text COLLATE utf8_unicode_ci,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `list_unsuscribe` text COLLATE utf8_unicode_ci,
  `is_html` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_mail_template_translation_id_dm_mail_template_id` FOREIGN KEY (`id`) REFERENCES `dm_mail_template` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_mail_template_translation`
--

LOCK TABLES `dm_mail_template_translation` WRITE;
/*!40000 ALTER TABLE `dm_mail_template_translation` DISABLE KEYS */;
INSERT INTO `dm_mail_template_translation` VALUES (1,'Sent to a user that requests a new password','Vive smart: change your password','Hello %username%\nYou can choose a new password at %step2_url%','webmaster@domain.com','%email%',NULL,NULL,NULL,NULL,NULL,0,1,'es');
/*!40000 ALTER TABLE `dm_mail_template_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_media`
--

DROP TABLE IF EXISTS `dm_media`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_media` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_media_folder_id` bigint(20) NOT NULL,
  `file` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `mime` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `size` int(10) unsigned DEFAULT NULL,
  `dimensions` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `folderFile_idx` (`dm_media_folder_id`,`file`),
  KEY `dm_media_folder_id_idx` (`dm_media_folder_id`),
  CONSTRAINT `dm_media_dm_media_folder_id_dm_media_folder_id` FOREIGN KEY (`dm_media_folder_id`) REFERENCES `dm_media_folder` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media`
--

LOCK TABLES `dm_media` WRITE;
/*!40000 ALTER TABLE `dm_media` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_media` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_media_folder`
--

DROP TABLE IF EXISTS `dm_media_folder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_media_folder` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `rel_path` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `rel_path` (`rel_path`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media_folder`
--

LOCK TABLES `dm_media_folder` WRITE;
/*!40000 ALTER TABLE `dm_media_folder` DISABLE KEYS */;
INSERT INTO `dm_media_folder` VALUES (1,'',1,4,0),(2,'assets',2,3,1);
/*!40000 ALTER TABLE `dm_media_folder` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_media_translation`
--

DROP TABLE IF EXISTS `dm_media_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_media_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `legend` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `author` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `license` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lang` varchar(2) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_media_translation_id_dm_media_id` FOREIGN KEY (`id`) REFERENCES `dm_media` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_media_translation`
--

LOCK TABLES `dm_media_translation` WRITE;
/*!40000 ALTER TABLE `dm_media_translation` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_media_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page`
--

DROP TABLE IF EXISTS `dm_page`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `record_id` bigint(20) unsigned NOT NULL DEFAULT '0',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `lft` int(11) DEFAULT NULL,
  `rgt` int(11) DEFAULT NULL,
  `level` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `recordModuleAction_idx` (`module`,`action`,`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page`
--

LOCK TABLES `dm_page` WRITE;
/*!40000 ALTER TABLE `dm_page` DISABLE KEYS */;
INSERT INTO `dm_page` VALUES (1,'main','root',0,NULL,1,6,0),(2,'main','error404',0,NULL,4,5,1),(3,'main','signin',0,NULL,2,3,1);
/*!40000 ALTER TABLE `dm_page` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page_translation`
--

DROP TABLE IF EXISTS `dm_page_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `slug` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `h1` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `keywords` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `auto_mod` varchar(6) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'snthdk',
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_secure` tinyint(1) NOT NULL DEFAULT '0',
  `is_indexable` tinyint(1) NOT NULL DEFAULT '1',
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_page_translation_id_dm_page_id` FOREIGN KEY (`id`) REFERENCES `dm_page` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page_translation`
--

LOCK TABLES `dm_page_translation` WRITE;
/*!40000 ALTER TABLE `dm_page_translation` DISABLE KEYS */;
INSERT INTO `dm_page_translation` VALUES (1,'','Home','Home',NULL,NULL,NULL,'snthdk',1,0,1,'es'),(2,'error404.html','Page not found','Page not found',NULL,NULL,NULL,'snthdk',1,0,1,'es'),(3,'security/signin.html','Signin','Signin',NULL,NULL,NULL,'snthdk',1,0,1,'es');
/*!40000 ALTER TABLE `dm_page_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_page_view`
--

DROP TABLE IF EXISTS `dm_page_view`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_page_view` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `dm_layout_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `dmPageViewModuleAction_idx` (`module`,`action`),
  KEY `dm_layout_id_idx` (`dm_layout_id`),
  CONSTRAINT `dm_page_view_dm_layout_id_dm_layout_id` FOREIGN KEY (`dm_layout_id`) REFERENCES `dm_layout` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_page_view`
--

LOCK TABLES `dm_page_view` WRITE;
/*!40000 ALTER TABLE `dm_page_view` DISABLE KEYS */;
INSERT INTO `dm_page_view` VALUES (1,'main','root',1),(2,'main','error404',1),(3,'main','signin',1);
/*!40000 ALTER TABLE `dm_page_view` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_permission`
--

DROP TABLE IF EXISTS `dm_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `description` text COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_permission`
--

LOCK TABLES `dm_permission` WRITE;
/*!40000 ALTER TABLE `dm_permission` DISABLE KEYS */;
INSERT INTO `dm_permission` VALUES (1,'system','System administrator','2017-04-03 16:42:41','2017-04-03 16:42:41'),(2,'admin','Log into administration','2017-04-03 16:42:41','2017-04-03 16:42:41'),(3,'clear_cache','Clear the cache','2017-04-03 16:42:41','2017-04-03 16:42:41'),(4,'log','Manage logs','2017-04-03 16:42:41','2017-04-03 16:42:41'),(5,'code_editor','Use admin and front code editors','2017-04-03 16:42:41','2017-04-03 16:42:41'),(6,'security_user','Manage security users','2017-04-03 16:42:41','2017-04-03 16:42:41'),(7,'security_permission','Manage security permissions','2017-04-03 16:42:41','2017-04-03 16:42:41'),(8,'security_group','Manage security groups','2017-04-03 16:42:41','2017-04-03 16:42:41'),(9,'content','CRUD dynamic content in admin','2017-04-03 16:42:41','2017-04-03 16:42:41'),(10,'zone_add','Add zones','2017-04-03 16:42:41','2017-04-03 16:42:41'),(11,'zone_edit','Edit zones','2017-04-03 16:42:41','2017-04-03 16:42:41'),(12,'zone_delete','Delete zones','2017-04-03 16:42:41','2017-04-03 16:42:41'),(13,'widget_add','Add widgets','2017-04-03 16:42:41','2017-04-03 16:42:41'),(14,'widget_edit','Edit widgets','2017-04-03 16:42:41','2017-04-03 16:42:41'),(15,'widget_delete','Delete widgets','2017-04-03 16:42:41','2017-04-03 16:42:41'),(16,'widget_edit_fast','Can fast edit widgets','2017-04-03 16:42:41','2017-04-03 16:42:41'),(17,'widget_edit_fast_record','Fast edit widget record','2017-04-03 16:42:41','2017-04-03 16:42:41'),(18,'widget_edit_fast_content_title','Fast edit widget content title','2017-04-03 16:42:41','2017-04-03 16:42:41'),(19,'widget_edit_fast_content_link','Fast edit widget content link','2017-04-03 16:42:41','2017-04-03 16:42:41'),(20,'widget_edit_fast_content_image','Fast edit widget content image','2017-04-03 16:42:41','2017-04-03 16:42:41'),(21,'widget_edit_fast_content_text','Fast edit widget content text','2017-04-03 16:42:41','2017-04-03 16:42:41'),(22,'widget_edit_fast_navigation_menu','Fast edit widget navigation menu','2017-04-03 16:42:41','2017-04-03 16:42:41'),(23,'page_add','Add pages','2017-04-03 16:42:41','2017-04-03 16:42:41'),(24,'page_edit','Edit pages','2017-04-03 16:42:41','2017-04-03 16:42:41'),(25,'page_delete','Delete pages','2017-04-03 16:42:41','2017-04-03 16:42:41'),(26,'page_bar_admin','See page bar in admin','2017-04-03 16:42:41','2017-04-03 16:42:41'),(27,'media_bar_admin','See media bar in admin','2017-04-03 16:42:41','2017-04-03 16:42:41'),(28,'media_library','Use media library in admin','2017-04-03 16:42:41','2017-04-03 16:42:41'),(29,'media_ignore_whitelist','Upload media with any filetype','2017-04-03 16:42:41','2017-04-03 16:42:41'),(30,'tool_bar_admin','See toolbar in admin','2017-04-03 16:42:41','2017-04-03 16:42:41'),(31,'page_bar_front','See page bar in front','2017-04-03 16:42:41','2017-04-03 16:42:41'),(32,'media_bar_front','See media bar in front','2017-04-03 16:42:41','2017-04-03 16:42:41'),(33,'tool_bar_front','See toolbar in front','2017-04-03 16:42:41','2017-04-03 16:42:41'),(34,'site_view','See non-public website and inactive pages','2017-04-03 16:42:41','2017-04-03 16:42:41'),(35,'loremize','Create automatic random content','2017-04-03 16:42:41','2017-04-03 16:42:41'),(36,'export_table','Export table contents','2017-04-03 16:42:41','2017-04-03 16:42:41'),(37,'sitemap','Regenerate sitemap','2017-04-03 16:42:41','2017-04-03 16:42:41'),(38,'automatic_metas','Configure automatic pages metas','2017-04-03 16:42:41','2017-04-03 16:42:41'),(39,'manual_metas','Configure manually pages metas','2017-04-03 16:42:41','2017-04-03 16:42:41'),(40,'manage_pages','Move and sort pages','2017-04-03 16:42:41','2017-04-03 16:42:41'),(41,'url_redirection','Configure url redirections','2017-04-03 16:42:41','2017-04-03 16:42:41'),(42,'use_google_analytics','Use google analytics','2017-04-03 16:42:41','2017-04-03 16:42:41'),(43,'google_analytics','Configure google analytics','2017-04-03 16:42:41','2017-04-03 16:42:41'),(44,'use_google_webmaster_tools','Use google webmaster tools','2017-04-03 16:42:41','2017-04-03 16:42:41'),(45,'google_webmaster_tools','Configure google webmaster tools','2017-04-03 16:42:41','2017-04-03 16:42:41'),(46,'xiti','Configure Xiti','2017-04-03 16:42:41','2017-04-03 16:42:41'),(47,'search_engine','Manage internal search engine','2017-04-03 16:42:41','2017-04-03 16:42:41'),(48,'see_log','See the logs','2017-04-03 16:42:41','2017-04-03 16:42:41'),(49,'see_chart','See the charts','2017-04-03 16:42:41','2017-04-03 16:42:41'),(50,'see_diagrams','See the developer diagrams','2017-04-03 16:42:41','2017-04-03 16:42:41'),(51,'see_server','See the server infos','2017-04-03 16:42:41','2017-04-03 16:42:41'),(52,'see_request','See the requests window','2017-04-03 16:42:41','2017-04-03 16:42:41'),(53,'see_event','See the events window','2017-04-03 16:42:41','2017-04-03 16:42:41'),(54,'config_panel','Use the configuration panel','2017-04-03 16:42:41','2017-04-03 16:42:41'),(55,'translation','Use the translation interface','2017-04-03 16:42:41','2017-04-03 16:42:41'),(56,'layout','Use the layout interface','2017-04-03 16:42:41','2017-04-03 16:42:41'),(57,'sent_mail','See mails sent by server','2017-04-03 16:42:41','2017-04-03 16:42:41'),(58,'mail_template','Configure mail templates','2017-04-03 16:42:41','2017-04-03 16:42:41'),(59,'error_log','See error log','2017-04-03 16:42:41','2017-04-03 16:42:41'),(60,'interface_settings','Manage interface settings like default image resize method','2017-04-03 16:42:41','2017-04-03 16:42:41'),(61,'behavior_add','Add behaviors to page elements','2017-04-03 16:42:41','2017-04-03 16:42:41'),(62,'behavior_edit','Edit settings of the behaviors','2017-04-03 16:42:41','2017-04-03 16:42:41'),(63,'behavior_delete','Delete attached behaviors','2017-04-03 16:42:41','2017-04-03 16:42:41'),(64,'behavior_sort','Sort the sequence of the behaviors','2017-04-03 16:42:41','2017-04-03 16:42:41');
/*!40000 ALTER TABLE `dm_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission`
--

DROP TABLE IF EXISTS `dm_record_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `secure_module` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secure_action` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secure_model` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `secure_record` bigint(20) NOT NULL,
  `description` text COLLATE utf8_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission`
--

LOCK TABLES `dm_record_permission` WRITE;
/*!40000 ALTER TABLE `dm_record_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission_association`
--

DROP TABLE IF EXISTS `dm_record_permission_association`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission_association` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_secure_action` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dm_secure_module` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `dm_secure_model` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission_association`
--

LOCK TABLES `dm_record_permission_association` WRITE;
/*!40000 ALTER TABLE `dm_record_permission_association` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission_association` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission_association_group`
--

DROP TABLE IF EXISTS `dm_record_permission_association_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission_association_group` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_group_id` bigint(20) NOT NULL,
  `dm_record_permission_association_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_record_permission_association_id_idx` (`dm_record_permission_association_id`),
  KEY `dm_group_id_idx` (`dm_group_id`),
  CONSTRAINT `dddi` FOREIGN KEY (`dm_record_permission_association_id`) REFERENCES `dm_record_permission_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_record_permission_association_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission_association_group`
--

LOCK TABLES `dm_record_permission_association_group` WRITE;
/*!40000 ALTER TABLE `dm_record_permission_association_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission_association_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission_association_user`
--

DROP TABLE IF EXISTS `dm_record_permission_association_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission_association_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_user_id` bigint(20) NOT NULL,
  `dm_record_permission_association_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_record_permission_association_id_idx` (`dm_record_permission_association_id`),
  KEY `dm_user_id_idx` (`dm_user_id`),
  CONSTRAINT `dddi_2` FOREIGN KEY (`dm_record_permission_association_id`) REFERENCES `dm_record_permission_association` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_record_permission_association_user_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission_association_user`
--

LOCK TABLES `dm_record_permission_association_user` WRITE;
/*!40000 ALTER TABLE `dm_record_permission_association_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission_association_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission_group`
--

DROP TABLE IF EXISTS `dm_record_permission_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission_group` (
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_record_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_group_id`,`dm_record_permission_id`),
  KEY `dddi_4` (`dm_record_permission_id`),
  CONSTRAINT `dddi_4` FOREIGN KEY (`dm_record_permission_id`) REFERENCES `dm_record_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_record_permission_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission_group`
--

LOCK TABLES `dm_record_permission_group` WRITE;
/*!40000 ALTER TABLE `dm_record_permission_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_record_permission_user`
--

DROP TABLE IF EXISTS `dm_record_permission_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_record_permission_user` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_record_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_record_permission_id`),
  KEY `dddi_6` (`dm_record_permission_id`),
  CONSTRAINT `dddi_6` FOREIGN KEY (`dm_record_permission_id`) REFERENCES `dm_record_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_record_permission_user_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_record_permission_user`
--

LOCK TABLES `dm_record_permission_user` WRITE;
/*!40000 ALTER TABLE `dm_record_permission_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_record_permission_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_redirect`
--

DROP TABLE IF EXISTS `dm_redirect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_redirect` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `source` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `dest` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `source` (`source`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_redirect`
--

LOCK TABLES `dm_redirect` WRITE;
/*!40000 ALTER TABLE `dm_redirect` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_redirect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_remember_key`
--

DROP TABLE IF EXISTS `dm_remember_key`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_remember_key` (
  `dm_user_id` bigint(20) DEFAULT NULL,
  `remember_key` varchar(32) COLLATE utf8_unicode_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`ip_address`),
  KEY `dm_user_id_idx` (`dm_user_id`),
  CONSTRAINT `dm_remember_key_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_remember_key`
--

LOCK TABLES `dm_remember_key` WRITE;
/*!40000 ALTER TABLE `dm_remember_key` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_remember_key` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_sent_mail`
--

DROP TABLE IF EXISTS `dm_sent_mail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_sent_mail` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_mail_template_id` bigint(20) DEFAULT NULL,
  `subject` text COLLATE utf8_unicode_ci NOT NULL,
  `body` longtext COLLATE utf8_unicode_ci NOT NULL,
  `from_email` text COLLATE utf8_unicode_ci NOT NULL,
  `to_email` text COLLATE utf8_unicode_ci,
  `cc_email` text COLLATE utf8_unicode_ci,
  `bcc_email` text COLLATE utf8_unicode_ci,
  `reply_to_email` text COLLATE utf8_unicode_ci,
  `sender_email` text COLLATE utf8_unicode_ci,
  `strategy` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `transport` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `culture` varchar(16) COLLATE utf8_unicode_ci DEFAULT NULL,
  `debug_string` longtext COLLATE utf8_unicode_ci,
  `created_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_mail_template_id_idx` (`dm_mail_template_id`),
  CONSTRAINT `dm_sent_mail_dm_mail_template_id_dm_mail_template_id` FOREIGN KEY (`dm_mail_template_id`) REFERENCES `dm_mail_template` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_sent_mail`
--

LOCK TABLES `dm_sent_mail` WRITE;
/*!40000 ALTER TABLE `dm_sent_mail` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_sent_mail` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_setting`
--

DROP TABLE IF EXISTS `dm_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_setting` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `type` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'text',
  `params` text COLLATE utf8_unicode_ci,
  `group_name` varchar(255) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  `credentials` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_setting`
--

LOCK TABLES `dm_setting` WRITE;
/*!40000 ALTER TABLE `dm_setting` DISABLE KEYS */;
INSERT INTO `dm_setting` VALUES (1,'site_name','text',NULL,'site',NULL),(2,'site_active','boolean',NULL,'site',NULL),(3,'site_indexable','boolean',NULL,'site',NULL),(4,'site_working_copy','boolean',NULL,'site',NULL),(5,'ga_key','text',NULL,'tracking','google_analytics'),(6,'ga_demographics','boolean',NULL,'tracking','google_analytics'),(7,'ga_token','text',NULL,'internal','google_analytics'),(8,'gwt_key','text',NULL,'tracking','google_webmaster_tools'),(9,'xiti_code','textarea',NULL,'tracking','xiti'),(10,'search_stop_words','textarea',NULL,'search engine','search_engine'),(11,'base_urls','textarea',NULL,'internal','system'),(12,'image_resize_method','select','fit=Fit scale=Scale inflate=Inflate top=Top right=Right left=Left bottom=Bottom center=Center','interface','interface_settings'),(13,'image_resize_quality','number',NULL,'interface','interface_settings'),(14,'link_external_blank','boolean',NULL,'interface','interface_settings'),(15,'link_current_span','boolean',NULL,'interface','interface_settings'),(16,'link_use_page_title','boolean',NULL,'interface','interface_settings'),(17,'title_prefix','text',NULL,'seo','manual_metas'),(18,'title_suffix','text',NULL,'seo','manual_metas'),(19,'smart_404','boolean',NULL,'seo','url_redirection'),(20,'colorbox_use_theme','boolean',NULL,'Colorbox',NULL),(21,'colorbox_theme','select','theme1=Theme 1 theme2=Theme 2 theme3=Theme 3 theme4=Theme 4 theme5=Theme 5','Colorbox',NULL),(22,'enable_livereload','boolean',NULL,'Dev Tools',NULL),(23,'livereload_url','text',NULL,'Dev Tools',NULL),(24,'map_icon','text',NULL,'Map',NULL);
/*!40000 ALTER TABLE `dm_setting` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_setting_translation`
--

DROP TABLE IF EXISTS `dm_setting_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_setting_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `description` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `value` text COLLATE utf8_unicode_ci,
  `default_value` text COLLATE utf8_unicode_ci,
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_setting_translation_id_dm_setting_id` FOREIGN KEY (`id`) REFERENCES `dm_setting` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_setting_translation`
--

LOCK TABLES `dm_setting_translation` WRITE;
/*!40000 ALTER TABLE `dm_setting_translation` DISABLE KEYS */;
INSERT INTO `dm_setting_translation` VALUES (1,'The site name','Vive smart','Vive smart','es'),(2,'Is the site ready for visitors ?','1','1','es'),(3,'Is the site ready for search engine crawlers ?','1','1','es'),(4,'Is this site the current working copy ?','1','1','es'),(5,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )',NULL,'','es'),(6,'Enable Demographic tracking in GA code',NULL,'','es'),(7,'Auth token gor Google Analytics, computed from password',NULL,'','es'),(8,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )',NULL,'','es'),(9,'The xiti html code',NULL,'','es'),(10,'Words to exclude from searches (e.g. the, a, to )',NULL,'','es'),(11,'Diem base urls for different applications/environments/cultures',NULL,'','es'),(12,'Default method when an image needs to be resized','center','center','es'),(13,'Jpeg default quality when generating thumbnails','95','95','es'),(14,'Links to other domain get automatically a _blank target',NULL,'0','es'),(15,'Links to current page are changed from <a> to <span>','1','1','es'),(16,'Add an automatic title on link based on the target page title','1','1','es'),(17,'Append something at the beginning of all pages title',NULL,'','es'),(18,'Append something at the end of all pages title',' | Vive smart',' | Vive smart','es'),(19,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','1','1','es'),(20,'Use a predefined colorbox theme','1','1','es'),(21,NULL,'theme1','theme1','es'),(22,'Use livereload while developping.','1','1','es'),(23,'Url to livereload script','//localhost:35729/livereload.js','//localhost:35729/livereload.js','es'),(24,'Map Icon',NULL,'','es');
/*!40000 ALTER TABLE `dm_setting_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_trans_unit`
--

DROP TABLE IF EXISTS `dm_trans_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_trans_unit` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_catalogue_id` bigint(20) NOT NULL,
  `source` text COLLATE utf8_unicode_ci NOT NULL,
  `target` text COLLATE utf8_unicode_ci NOT NULL,
  `meta` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_catalogue_id_idx` (`dm_catalogue_id`),
  CONSTRAINT `dm_trans_unit_dm_catalogue_id_dm_catalogue_id` FOREIGN KEY (`dm_catalogue_id`) REFERENCES `dm_catalogue` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=521 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_trans_unit`
--

LOCK TABLES `dm_trans_unit` WRITE;
/*!40000 ALTER TABLE `dm_trans_unit` DISABLE KEYS */;
INSERT INTO `dm_trans_unit` VALUES (1,2,'Open','Abrir',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(2,2,'Delete','Borrar',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(3,2,'Add','Añadir',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(4,2,'Add a %1%','Añadir un %1%',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(5,2,'Cancel','Cancelar',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(6,2,'Are you sure?','¿Está seguro?',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(7,2,'Unassociated','No Asociado',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(8,2,'Associated','Asociado',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(9,2,'Forgot your password?','¿Olvidó su contraseña?',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(10,2,'yes','sí',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(11,2,'no','no',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(12,2,'yes or no','sí o no',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(13,2,'Next','Siguiente',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(14,2,'Previous','Anterior',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(15,2,'First','Primero',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(16,2,'Last','Último',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(17,2,'Is active','Está activo',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(18,2,'Is active:','Está activo:',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(19,2,'Updated at','Actualizado el',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(20,2,'Updated at:','Actualizado el:',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(21,2,'Created at','Creado el',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(22,2,'Created at:','Creado el:',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(23,2,'Created by','Creado por',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(24,2,'Updated by','Actualizado por',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(25,2,'Query','Consulta',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(26,2,'Image alt','Texto de Imagen',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(27,2,'Image alt:','Texto de Imagen:',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(28,2,'Your modifications have been saved','Las modificaciones han sido guardadas',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(29,2,'Required','Requerido',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(30,2,'Content','Contenido',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(31,2,'Home','Inicio',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(32,2,'Tools','Herramientas',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(33,2,'System','Sistema',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(34,2,'Update project','Actualizar proyecto',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(35,2,'Project successfully updated','Proyecto actualizado correctamente',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(36,2,'Search','Búsqueda',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(37,2,'Search in %1%','Buscar en %1%',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(38,2,'Cancel search','Cancelar la búsqueda',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(39,2,'Active search','Búsqueda activa',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(40,2,'is empty','está vacído',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(41,2,'from','desde',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(42,2,'to','hasta',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(43,2,'[0] no result|[1] 1 result|(1,+Inf] %1% results','[0] ningún resultado | [1] 1 resultado | (1,+Inf] %1% de resultados',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(44,2,'Choose an action','Elegir una acción',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(45,2,'Edit','Editar',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(46,2,'New','Nuevo',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(47,2,'You must at least select one item.','Debe elegir por lo menos un elemento.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(48,2,'Filter','Filtro',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(49,2,'Reset','Resetear',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(50,2,'Add a','Añadir uno',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(51,2,'The item was updated successfully.','El elemento se ha actualizado con éxito.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(52,2,'The item has not been saved due to some errors.','El elemento no se ha guardado debido a algunos errores.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(53,2,'Invalid.','Inválido.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(54,2,'Required.','Obligatorio.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(55,2,'The item was updated successfully. You can add another one below.','El elemento se ha actualizado con éxito. Puede agregar otro debajo.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(56,2,'Translation','Traducción',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(57,2,'Sentences','Frases',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(58,2,'Loremize','Loremizar',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(59,2,'does not match the date format','no coincide con el formato de fecha',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(60,2,'The date must be before','La fecha debe ser anterior a',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(61,2,'The date must be after','La fecha debe ser posterior a',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(62,2,'[0]no element|[1]1 element|(1,+Inf]%1% elements','[0] no hay ningún elemento | [1] 1 elemento | (1,+Inf] %1% elementos',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(63,2,'You must select an action to execute on the selected items.','Debe seleccionar una acción a ejecutar con los elementos seleccionados.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(64,2,'No result','Ningún resultado',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(65,2,'The selected items have been deleted successfully.','Los elementos seleccionados se han eliminado con éxito.',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(66,2,'The selected items have been modified successfully','Los elementos seleccionados se han modificado con éxito',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(67,2,'A problem occurs when modifying the selected items','Han ocurrido problema(s) al  modificar los elementos seleccionados',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(68,2,'Root','Raíz',NULL,'2017-04-03 16:42:44','2017-04-03 16:42:44'),(69,2,'Page not found','Página no encontrada',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(70,2,'Media library','Librería de Medias',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(71,2,'UML Model Diagram','Diagrama de modelos UML',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(72,2,'The item was deleted successfully.','El elemento fue eliminado con éxito.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(73,2,'element','elemento',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(74,2,'elements','elementos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(75,2,'Add a folder here','Añadir una carpeta aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(76,2,'Import from a zip','Importar desde un archivo ZIP',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(77,2,'Add some files here','Añadir archivos aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(78,2,'Add a file here','Añadir archivo aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(79,2,'Clear cache','Borrar la caché',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(80,2,'Clear media cache','Borrar caché de media',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(81,2,'Name','Nombre',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(82,2,'Rename this folder','Cambiar el nombre de esta carpeta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(83,2,'Move this folder','Mover esta carpeta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(84,2,'Delete this folder','Eliminar esta carpeta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(85,2,'Already exists in this folder','Ya existe en esta carpeta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(86,2,'This is a bad name','Nombre incorrecto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(87,2,'File','Archivo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(88,2,'Thumbnails can not be created in %1%','No se pueden crear thumbnails en %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(89,2,'Folder %1% is not writable','La carpeta %1% no tiene permisos de escritura',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(90,2,'File %1% is not writable','El archivo %1% no tiene permisos de escritura',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(91,2,'This folder is not writable','Esta carpeta no tiene permisos de escritura',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(92,2,'This file is not writable','Este archivo no tiene permisos de escritura',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(93,2,'Size','Tamaño',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(94,2,'Legend','Leyenda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(95,2,'Author','Autor',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(96,2,'License','Licencia',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(97,2,'Validate','Validar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(98,2,'Save','Guardar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(99,2,'Save and Add','Guardar y añadir',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(100,2,'Save and Next','Guardar y Siguiente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(101,2,'Save and Back to list','Guardar y volver a la lista',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(102,2,'Save modifications','Guardar modificaciones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(103,2,'Delete this file','Eliminar este archivo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(104,2,'Close','Cerrar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(105,2,'Delete this %1%','Eliminar este %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(106,2,'Delete this page','Borrar esta página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(107,2,'Active','Activo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(108,2,'Referers','Referentes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(109,2,'Administration login','Login de administración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(110,2,'Login','Iniciar sesión',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(111,2,'Username','Nombre de usuario',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(112,2,'Password','Contraseña',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(113,2,'Password (again)','Contraseña (otra vez)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(114,2,'Remember','Recordar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(115,2,'The username and/or password is invalid.','El nombre de usuario y/o la contraseña no es válida.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(116,2,'Profiles','Perfiles',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(117,2,'Profile','Perfil',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(118,2,'User','Usuario',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(119,2,'Users','Usuarios',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(120,2,'Metas','Metas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(121,2,'Automatic Page','Página automática',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(122,2,'Automatic Pages','Páginas automática',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(123,2,'Site tree','Árbol de la web',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(124,2,'Some SEO improvements should be applied','Se deberían aplicar algunas mejoras SEO',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(125,2,'Some page have the same url','Algunas páginas tienen la misma URL',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(126,2,'Click here to see them','Haga clic aquí para verlos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(127,2,'Seo improvements','Mejoras Seo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(128,2,'Duplicated %1%','Duplicado %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(129,2,'Automatic page','Página automática',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(130,2,'Manual page','Página manual',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(131,2,'Modify object','Modificar objeto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(132,2,'Configure automatic seo for %1% pages','Configurar seo automático para %1% páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(133,2,'View page on website','Ver página en el sitio web',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(134,2,'Edit image','Editar imagen',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(135,2,'Loading...','Cargando ...',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(136,2,'Preview','Previsualización',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(137,2,'Back to list','Volver a la lista',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(138,2,'Back to %1% list','Volver a la lista %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(139,2,'The form submission cannot be processed. It probably means that you have uploaded a file that is too big.','El envío del formulario no puede ser procesado. Probablemente significa que ha subido un archivo que es demasiado grande.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(140,2,'A problem occurs when deleting the selected items.','Se produce un problema al eliminar los elementos seleccionados.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(141,2,'elements per page','elementos por página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(142,2,'Sort','Ordenar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(143,2,'Sort %1%','Ordenar %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(144,2,'Sort %1% for %2%','Ordenar %1% para %2%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(145,2,'Drag & drop elements, then','Arrastre y suelte los elementos, ahí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(146,2,'A problem occured when sorting the items','Ocurrió un problema al ordenar los elementos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(147,2,'The items have been sorted successfully','Los ítemes han sido ordenados con éxito',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(148,2,'Add a zone','Agregar a la zona',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(149,2,'Add a widget','Añadir un widget',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(150,2,'Go to site','Ir al sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(151,2,'You don\'t have the required permission to access this page.','Usted no tiene el permiso necesario para acceder a esta página.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(152,2,'Edit this zone','Editar esta zona',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(153,2,'Delete this zone','Eliminar esta zona',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(154,2,'CSS class','Clase CSS',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(155,2,'Width','Ancho',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(156,2,'Height','Alto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(157,2,'Edit this %1%','Editar %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(158,2,'Delete this widget','Eliminar este widget',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(159,2,'Title','Título',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(160,2,'Link','Vínculo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(161,2,'Text','Texto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(162,2,'Advanced','Avanzado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(163,2,'Bread crumb','Bread crumb',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(164,2,'Search form','Formulario de búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(165,2,'Search results','Resultados de la búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(166,2,'Go to content','Ir al contenido',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(167,2,'New widget','Nuevo widget',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(168,2,'Use media','Usar medio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(169,2,'Or upload a file','O suba un archivo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(170,2,'Drag & drop a media here','Arrastre y suelte un medio aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(171,2,'Media','Medio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(172,2,'You must use a media or upload a file','Debe utilizar un medio o cargar un archivo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(173,2,'Try','Intentar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(174,2,'Change file','Cambiar el archivo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(175,2,'Method','Método',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(176,2,'Center','Centro',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(177,2,'Scale','Escala',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(178,2,'Inflate','Inflar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(179,2,'Fit','Ajustar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(180,2,'Save and close','Guardar y cerrar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(181,2,'This size is not valid.','Este tamaño no es válida.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(182,2,'This color is not valid.','Este color no es válido.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(183,2,'Per page','Por página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(184,2,'First page','Primera página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(185,2,'Previous page','Página Anterior',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(186,2,'Next page','Página siguiente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(187,2,'Last page','Última página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(188,2,'Top','Superior',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(189,2,'Bottom','Inferior',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(190,2,'View','Ver',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(191,2,'Order by','Ordenar por',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(192,2,'Random','Aleatoriamente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(193,2,'automatic','automático',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(194,2,'Add new page','Añadir página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(195,2,'Seo','Seo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(196,2,'Integration','Integración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(197,2,'Edit page','Editar página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(198,2,'Logout','Cerrar sesión',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(199,2,'Export in %1%','Exportar en %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(200,2,'Available','Disponible',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(201,2,'Requires authentication','Requiere autentificación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(202,2,'Search engine crawlers','Rastreadores de motores de búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(203,2,'Show page structure','Mostrar página (sale de modo de edición)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(204,2,'Generate sitemap','Generar el mapa del sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(205,2,'Links','Enlaces',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(206,2,'Act on selection','Actuar al seleccionar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(207,2,'Activate','Activar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(208,2,'Deactivate','Desactivar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(209,2,'Remove','Eliminar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(210,2,'Sorry, but you can not access administration with your current browser','Lo sentimos, pero no se puede acceder a la administración con su navegador actual',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(211,2,'Select all','Seleccionar todos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(212,2,'Unselect all','Deseleccionar todos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(213,2,'Configuration panel','Panel de configuración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(214,2,'This is not a valid hexadecimal color','Este no es un color hexadecimal válido',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(215,2,'%1% - %2% of %3%',' %1% - %2% en %3%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(216,2,'Display','Mostrar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(217,2,'User logged in','Usuario conectado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(218,2,'User logged out','Usuario se desconectó',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(219,2,'Cache cleared','Cache vaciado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(220,2,'This Week','Esta Semana',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(221,2,'This Year','Este Año',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(222,2,'Activity','Actividad',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(223,2,'Server','Servidor',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(224,2,'Browser','Navegador',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(225,2,'Browsers','Navegadores',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(226,2,'Location','Ubicación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(227,2,'Events','Eventos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(228,2,'Requests','Petición',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(229,2,'Subject','Sujeto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(230,2,'Expanded view','Vista expandida',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(231,2,'Show','Mostrar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(232,2,'Gallery','Galería',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(233,2,'Edit medias','Editar medios',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(234,2,'Remove this media','Eliminar este medio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(235,2,'Preferences','Preferencias',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(236,2,'Mail templates','Plantillas de correo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(237,2,'Layouts','Diseños',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(238,2,'Zone','Zona',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(239,2,'Navigation','Navegación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(240,2,'Configuration','Configuración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(241,2,'Chart','Gráfico',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(242,2,'Log','Registro',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(243,2,'Monitoring','Monitoreo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(244,2,'Manage index','Manejar índice',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(245,2,'Search engine','Motor de búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(246,2,'Google analytics','Google analytics',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(247,2,'Google webmaster tools','Herramientas para webmasters de Google',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(248,2,'Services','Servicios',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(249,2,'Sitemap','Mapa del sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(250,2,'Url Redirections','Redirecciones Url',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(251,2,'Redirections','Redirecciones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(252,2,'Settings','Configuraciones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(253,2,'Sent mails','Correos electronicos enviados',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(254,2,'Errors','Errores',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(255,2,'Permissions','Permisos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(256,2,'Groups','Grupos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(257,2,'Security','Seguridad',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(258,2,'See diagrams','Ver diagramas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(259,2,'Code Editor','Editor de código',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(260,2,'Diem Console','Consola Diem',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(261,2,'Dev','Desarrollo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(262,2,'Exception','Excepción',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(263,2,'Cache','Caché',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(264,2,'This chart is not available.','Este gráfico no está disponible.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(265,2,'Dm gallery','Galería Diem',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(266,2,'Email','Correo electrónico',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(267,2,'Last login','Última entrada',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(268,2,'Visible','Visible',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(269,2,'External services','Servicios externos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(270,2,'Interface','Interfaz',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(271,2,'Site','Sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(272,2,'Tracking','Rastreo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(273,2,'Right','Derecho',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(274,2,'Left','Izquierdo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(275,2,'Image resize method','Método para redimensionar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(276,2,'Default method when an image needs to be resized','Método por defecto cuando una imagen necesita ser redimensionada',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(277,2,'Image resize quality','Calidad de imagen al redimensionar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(278,2,'Jpeg default quality when generating thumbnails','Calidad Jpeg  por defecto al generar thumbnails',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(279,2,'Link external blank','Enlace externo en blanco',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(280,2,'Links to other domain get automatically a _blank target','Enlaces a otro dominio automáticamente reciben un blanco _blank',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(281,2,'Link current span','Enlace a span actual',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(282,2,'Links to current page are changed from <a> to <span>','Enlaces a la página actual se cambian de <a> a <span>',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(283,2,'Link use page title','Enlace usa título de página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(284,2,'Add an automatic title on link based on the target page title','Agregar título automático a enlace basado en el título de la página de destino',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(285,2,'Search stop words','Stop words de la búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(286,2,'Words to exclude from searches (e.g. the, a, to )','Palabras para excluir de las búsquedas (por ejemplo, la, a, de)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(287,2,'Title prefix','Prefijo Título',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(288,2,'Append something at the beginning of all pages title','Añadir algo al principio de todos los títulos de páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(289,2,'Title suffix','Sufijo de título',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(290,2,'Append something at the end of all pages title','Añadir algo al final de todos los títulos de páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(291,2,'Smart 404','404 inteligente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(292,2,'When a page is not found, user is redirect to a similar page. The internal search index is used to find the best page for requested url.','Cuando no se encuentre una página, el usuario es redireccionado a una página similar. Se usa el índice de búsqueda interno para encontrar la página más adecuada para la url pedida.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(293,2,'Site name','Nombre del sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(294,2,'The site name','El nombre del sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(295,2,'Site active','Site activo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(296,2,'Is the site ready for visitors ?','¿Está listo el site para los visitantes?',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(297,2,'Site indexable','Site indexable',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(298,2,'Is the site ready for search engine crawlers ?','¿Está listo el site para los rastreadores de motores de búsqueda?',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(299,2,'Site working copy','Copia de trabajo del site',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(300,2,'Is this site the current working copy ?','¿Es este site la copia de trabajo actual?',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(301,2,'Ga key','Clave Ga',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(302,2,'The google analytics key without javascript stuff ( e.g. UA-9876614-1 )','La clave de Google Analytics sin javascript (por ejemplo, UA-9876614-1)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(303,2,'Gwt key','Clave Gwt',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(304,2,'The google webmaster tools filename without google and .html ( e.g. a913b555ba9b4f13 )','El nombre de archivo de las herramientas para webmasters de Google sin Google y. Html (por ejemplo, a913b555ba9b4f13)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(305,2,'Xiti code','Código Xiti',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(306,2,'The xiti html code','El código html xiti',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(307,2,'Ga email','Correo electrónico Ga',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(308,2,'Required to display google analytics data into Diem','Necesario para mostrar los datos en Google Analytics de Diem',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(309,2,'Ga password','Contraseña Ga',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(310,2,'Diem mail support is <strong>-NOT-</strong> completed. Please use the symfony 1.4 mail service instead','El soporte para correo electrónico de DIEM <strong>no está terminado</strong>. Por favor use el servicio de correo de Symfony 1.4',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(311,2,'Duplicate','Duplicado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(312,2,'Source','Fuente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(313,2,'Target','Meta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(314,2,'Dm catalogue','Catálogo de Dm',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(315,2,'Meta','Meta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(316,2,'Menu','Menú',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(317,2,'Internal search engine','Motor de búsqueda interno',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(318,2,'Reload index','Actualizar índice',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(319,2,'Configure Google Analytics','Configurar Google Analytics',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(320,2,'Configure Google Webmaster Tools','Configurar Google Webmaster Tools',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(321,2,'Position','Posición',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(322,2,'Urls','URL',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(323,2,'Old url','Url antigua',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(324,2,'New url','Nueva url',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(325,2,'Group','Grupo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(326,2,'Value','Valor',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(327,2,'Credentials','Credenciales',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(328,2,'Class','Clase',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(329,2,'Module','Módulo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(330,2,'Action','Acción',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(331,2,'Uri','URI',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(332,2,'Env','Desarrollo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(333,2,'Super admin','Super Administrador',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(334,2,'The admin code editor is <strong>-NOT-</strong> completed yet an may not work','El editor de código de administración <strong>no</strong> está completado todavía y puede no funcionar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(335,2,'List','Lista',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(336,2,'Form','Formulario',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(337,2,'Administration','Administración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(338,2,'text','texto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(339,2,'Index state','Índice de estado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(340,2,'Index maintenance','Mantenimiento del índice',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(341,2,'Search completed in %1% ms','Búsqueda efectuada en %1% ms',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(342,2,'No results','No hay resultados',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(343,2,'Edit template code','Modificar el código de plantilla',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(344,2,'Edit component code','Código de componente Edit',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(345,2,'Drag & Drop a media here','Arastre y suelte un medio aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(346,2,'Add a link to the text title','Añadir un vínculo al título del texto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(347,2,'Add a link to the text media','Añadir un enlace al medio del texto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(348,2,'Drag & Drop a page or enter an url','Arrastrar y suelte una página o introducir una dirección url',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(349,2,'Drag & drop a page here from the PAGES panel, or write an url','Arrastre y suelte una página aquí desde el panel de páginas, o escribir una dirección url',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(350,2,'Title position','Posición del título',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(351,2,'Outside','Exterior',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(352,2,'Inside','Interior',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(353,2,'JPG quality','Calidad JPG',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(354,2,'Dimensions','Dimensiones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(355,2,'Leave empty to use default quality','Dejar vacío para usar calidad por defecto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(356,2,'Separator','Separador',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(357,2,'Include current page','Incluir la página actual',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(358,2,'This CSS class is applied to the body tag','Esta clase CSS se aplica a la etiqueta body',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(359,2,'Revision history of %1%','Historia de revisiones de %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(360,2,'Revision history','Historia de revisiones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(361,2,'Field','Campo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(362,2,'Difference','Diferencia',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(363,2,'No revision for %1% with culture \"%2%\"','No hay revisión para %1% con la cultura \"%2%\"',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(364,2,'Body','Cuerpo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(365,2,'Others','Otros',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(366,2,'Description','Descripción',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(367,2,'Vars','Vars',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(368,2,'From email','De correo electrónico',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(369,2,'To email','Para correo electrónico',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(370,2,'Updating project','Actualizando el proyecto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(371,2,'Cache clearing','Vaciar la caché',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(372,2,'Page synchronization','Sincronización de páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(373,2,'SEO synchronization','Sincronización de SEO',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(374,2,'Interface regeneration','Regeneración de la interfaz',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(375,2,'Something went wrong when updating project','Algo salió mal al actualizar el proyecto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(376,2,'Send reports','Enviar informes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(377,2,'Receive reports','Recibir los informes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(378,2,'Open Google Analytics page','Abrir página de Google Analytics',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(379,2,'Open Google Webmaster Tools page','Abrir página de Herramientas para webmasters de Google',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(380,2,'Revert to revision %1%','Revertir a la revisión %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(381,2,'%1% has been reverted to version %2%',' %1% se ha revuelto a la versión %2%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(382,2,'To enable it, provide a google analytics access','Para habilitarlo debe tener acceso a Google Analytics',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(383,2,'This chart is currently not available','Este gráfico no está disponible',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(384,2,'Generate %1% random %2%','Generar %1% aleatorios %2%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(385,2,'Options','Opciones',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(386,2,'Drag & Drop an image here','Arrastre y suelte una imagen aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(387,2,'\"%value%\" is not a valid link.','\"%value%\" no es un enlace válido.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(388,2,'\"%value%\" is not a valid directory name.','\"%value%\" no es un directorio válido.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(389,2,'History','Historial',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(390,2,'Set up a cron to update the search index','Configurar cron para actualizar los índices de búsqueda',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(391,2,'Set up a cron to update the sitemap','Configurar cron para actualizar el mapa del sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(392,2,'Most UNIX and GNU/Linux systems allows for task planning through a mechanism known as cron. The cron checks a configuration file (a crontab) for commands to run at a certain time.','La mayoría de sistemas UNIX y GNU/Linux permiten planificar tareas mediante un mecanismo llamado cron. Cron examina un fichero de configuración (una crontab) en busca de comandos a ejecutar cada cierto tiempo.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(393,2,'For more information on the crontab configuration file format, type man 5 crontab in a terminal.','Para más información sobre la configuración de crontab, escriba \"man 5 contab\" en una terminal',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(394,2,'Open %1% and add the line:','Abrir %1% y adicionar la línea',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(395,2,'Cut','Cortar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(396,2,'Copy','Copiar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(397,2,'Paste','Pegar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(398,2,'Drag & drop links here from the left PAGE panel','Arrastre y suelte los enlaces desde el panel izquierdo \"Página\"',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(399,2,'Click to edit, drag to sort','Clic para editar, arrastrar para ordenar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(400,2,'Code generation','Generación de código',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(401,2,'%user% is browsing this page, you should not modify it now.','%user% está navegando en está página, no debería modificarla en este instante.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(402,2,'or create an external link','o cree un enlance externo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(403,2,'Back to the parent folder','Atrás (carpeta padre)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(404,2,'Website','Sitio Web',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(405,2,'Message','Mensaje',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(406,2,'Signin','Iniciar sesión',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(407,2,'Signout','Cerrar sesión',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(408,2,'Back to admin','Atrás (administración)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(409,2,'Back to site','Atrás (sitio)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(410,2,'Invalid mime type (%mime_type%).','',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(411,2,'Download','Descargar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(412,2,'Move to','Mover a',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(413,2,'[1] And one more...|(1,+Inf] And %1% more...','[1] Y uno más ...|[1,+Inf] y %1% más...',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(414,2,'Go to admin','Ir a la administración',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(415,2,'Search for a widget','Buscar componente (widget)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(416,2,'Sort by %field%','Ordenar por %field%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(417,2,'contextual','Contextual',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(418,2,'Accepts pages and urls','Aceptar páginas y URLs',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(419,2,'Accepts medias and urls','Aceptar medias y URLs',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(420,2,'Accepts pages, medias and urls','Aceptar paginas, medias y URLs',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(421,2,'Drag pages around to move and sort them.','Arrastre las páginas para ordenarlas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(422,2,'Manage metas','Administrar metas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(423,2,'Reorder pages','Reordenar páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(424,2,'Manage pages','Administrar páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(425,2,'Click to edit','Clic para editar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(426,2,'Click any value in the table to modify it.','Clic en cualquier valor de la tabla para modificarlo',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(427,2,'Choose columns to display in the table.','Selecciona una columna para mostrar en la tabla',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(428,2,'Groups & Permissions','Grupos y Permisos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(429,2,'File %file% does not exist','El fichero %file% no existe',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(430,2,'File %file% can not be deleted because a record needs it','El fichero %file% no puede ser eliminado porque es usado por un registro',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(431,2,'Add widgets','Adicionar contenidos (Widgets)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(432,2,'Back to %1%','Atrás hasta %1%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(433,2,'Revision %number%','Revisión %number%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(434,2,'My account','Mi cuenta',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(435,2,'The two passwords must be the same.','Las dos contraseñas deben coincidir',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(436,2,'Connected','Conectado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(437,2,'If you set a href, a link will be inserted into the title','Si escribe un HREF se inserta un vínculo dentro del título',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(438,2,'Template','Plantillas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(439,2,'Areas','Áreas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(440,2,'Nb pages','Páginas Nb',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(441,2,'Manage XML sitemap','Administrar Mapa del Sitio (XML)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(442,2,'Pages','Páginas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(443,2,'Automatic SEO','SEO Automático',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(444,2,'Not connected','No conectado',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(445,2,'Keywords','Palabras clave',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(446,2,'Secure','Seguro',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(447,2,'Indexable','Indexable',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(448,2,'Select columns','Seleccionar columnas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(449,2,'Successfully loremized','Aleatorizado satisfactoriamente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(450,2,'This file is writable','Este fichero se puede escribir',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(451,2,'Loading','Cargando',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(452,2,'Image','Imagen',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(453,2,'Results','Resultados',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(454,2,'Desc','Desc',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(455,2,'Publication','Publicación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(456,2,'Layout','Decorador',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(457,2,'Parent','Padre',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(458,2,'Slug','Slug',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(459,2,'Controllers','Controlador',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(460,2,'Templates','Plantilla',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(461,2,'Stylesheets','Estilos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(462,2,'Presentation','Presentación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(463,2,'Send','Enviar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(464,2,'No module to manage.','No hay módulos para administrar',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(465,2,'Variables you can use here:','Variables que pueden ser usadas aquí',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(466,2,'1. Edit meta generation rules','1. Editar reglas de generación de metas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(467,2,'Preview modifications without applying changes to the site','Previsualizar modificaciones sin aplicar los cambios en el sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(468,2,'Save modifications and apply changes to the site','Salvar modificaciones y aplicar los cambios en el sitio',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(469,2,'2. Preview generated metas','Previsualizar METAS generados',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(470,2,'The page url, without domain name. Must be unique. If the slug does not start with a \'/\', the parent slug is added.','La dirección de la página (URL) sin el nombre de dominio. Debe ser única. Si el slug no comienza con \'/\', se añade el slug del padre.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(471,2,'The page title, without prefix nor suffix. Should be unique.','El título de la página, sin prefijos o sufijos. Debe ser único.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(472,2,'The page name, used by links to this page. Should be unique.','El nombre de la pagina, usado en los enlaces a la misma. Debe ser único.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(473,2,'Assign first header here or let it blank to let the designer choose it. Should be unique.','Asigne la cabecera principal aquí o déjelo en blanco para dejar al diseñador escoger. Debe ser único.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(474,2,'The page description meta, frequently displayed in search engines result page.','Las etiquetas meta de descripción de la página, mostradas frecuentemente en los resultados de búsqueda.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(475,2,'Provides additional meta informations to the page. Also used by Diem internal search engine.','Proporciona información META adicional para la página. Usado también por Diem para el buscador interno.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(476,2,'Requests per minute','Peticiones por minuto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(477,2,'Errors per minute','Errores por minuto',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(478,2,'Latency in ms','Latencia en milisegundos(ms)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(479,2,'Memory used in %','Memoria usada en porcetaje(%)',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(480,2,'Pages per month','Páginas por mes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(481,2,'Visitors per month','Visitantes por mes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(482,2,'Visitors','Visitantes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(483,2,'Bounce rate','Calificación',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(484,2,'No results for \"%1%\"','No hay resultados para \"%1%\"',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(485,2,'Results %1% to %2% of %3%','Resultados %1% a %2% de %3%',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(486,2,'Items','Elementos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(487,2,'Save this %1% to access to the gallery','Guarde este %1% para acceder a la galería',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(488,2,'UL CSS class','Clase CSS UL',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(489,2,'LI CSS class','Clase CSS LI',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(490,2,'Ascendant','Ascendente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(491,2,'Descendant','Descendente',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(492,2,'Version','Versión',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(493,2,'The widget can not be rendered because its type does not exist anymore.','Este componente (widget) no puede ser representado porque no existe',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(494,2,'Link to this page:','Enlace a esta página',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(495,2,'Sentence','Frase',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(496,2,'The item was created successfully.','El elemento fue creado correctamente.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(497,2,'The item was created successfully. You can add another one below.','El elemento fue creado correctamente. Puede agregar otro abajo.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(498,2,'Heading 2','Encabezado 2',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(499,2,'Heading 3','Encabezado 3',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(500,2,'Heading 4','Encabezado 4',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(501,2,'Heading 5','Encabezado 5',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(502,2,'Bold','Negrita',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(503,2,'Italic','Cursiva',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(504,2,'Bulleted List','Lista de puntos',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(505,2,'Numeric List','Lista numerada',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(506,2,'Enlarge the editor','Ampliar el editor',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(507,2,'Permission','Permiso',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(508,2,'Nb sent mails','Núm. de correos enviados',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(509,2,'Advanced search','Búsqueda avanzada',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(510,2,'Today','Hoy',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(511,2,'Past %number% days','Últimos %number% días ',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(512,2,'This month','Este mes',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(513,2,'This year','Este año',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(514,2,'Pages per week','Páginas por semana',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(515,2,'Visitors per week','Visitantes a la semana',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(516,2,'Show extended options','Mostrar opciones extendidas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(517,2,'Hide extended options','Ocultar opciones extendidas',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(518,2,'Records','Récords',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(519,2,'Record','Récord',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45'),(520,2,'Enable Demographic tracking in GA code','Habilita el tracking demografico en GA.',NULL,'2017-04-03 16:42:45','2017-04-03 16:42:45');
/*!40000 ALTER TABLE `dm_trans_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user`
--

DROP TABLE IF EXISTS `dm_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `algorithm` varchar(128) COLLATE utf8_unicode_ci NOT NULL DEFAULT 'sha1',
  `salt` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `password` varchar(128) COLLATE utf8_unicode_ci DEFAULT NULL,
  `is_active` tinyint(1) DEFAULT '1',
  `is_super_admin` tinyint(1) DEFAULT '0',
  `last_login` datetime DEFAULT NULL,
  `forgot_password_code` varchar(12) COLLATE utf8_unicode_ci DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `forgot_password_code` (`forgot_password_code`),
  KEY `is_active_idx_idx` (`is_active`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user`
--

LOCK TABLES `dm_user` WRITE;
/*!40000 ALTER TABLE `dm_user` DISABLE KEYS */;
INSERT INTO `dm_user` VALUES (1,'admin','admin@viveSmart.com','sha1','0f3b363f4257ed5c39bf33bd9c36622f','aae0796888568b418c1bca2ea54a6c130219aab7',1,1,NULL,NULL,'2017-04-03 16:42:42','2017-04-03 16:42:42');
/*!40000 ALTER TABLE `dm_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_group`
--

DROP TABLE IF EXISTS `dm_user_group`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user_group` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_group_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_group_id`),
  KEY `dm_user_group_dm_group_id_dm_group_id` (`dm_group_id`),
  CONSTRAINT `dm_user_group_dm_group_id_dm_group_id` FOREIGN KEY (`dm_group_id`) REFERENCES `dm_group` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_group_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_group`
--

LOCK TABLES `dm_user_group` WRITE;
/*!40000 ALTER TABLE `dm_user_group` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_user_group` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_user_permission`
--

DROP TABLE IF EXISTS `dm_user_permission`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_user_permission` (
  `dm_user_id` bigint(20) NOT NULL DEFAULT '0',
  `dm_permission_id` bigint(20) NOT NULL DEFAULT '0',
  PRIMARY KEY (`dm_user_id`,`dm_permission_id`),
  KEY `dm_user_permission_dm_permission_id_dm_permission_id` (`dm_permission_id`),
  CONSTRAINT `dm_user_permission_dm_permission_id_dm_permission_id` FOREIGN KEY (`dm_permission_id`) REFERENCES `dm_permission` (`id`) ON DELETE CASCADE,
  CONSTRAINT `dm_user_permission_dm_user_id_dm_user_id` FOREIGN KEY (`dm_user_id`) REFERENCES `dm_user` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_user_permission`
--

LOCK TABLES `dm_user_permission` WRITE;
/*!40000 ALTER TABLE `dm_user_permission` DISABLE KEYS */;
/*!40000 ALTER TABLE `dm_user_permission` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_widget`
--

DROP TABLE IF EXISTS `dm_widget`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_widget` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_zone_id` bigint(20) NOT NULL,
  `module` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `action` varchar(127) COLLATE utf8_unicode_ci NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  `updated_at` datetime NOT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_zone_id_idx` (`dm_zone_id`),
  CONSTRAINT `dm_widget_dm_zone_id_dm_zone_id` FOREIGN KEY (`dm_zone_id`) REFERENCES `dm_zone` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_widget`
--

LOCK TABLES `dm_widget` WRITE;
/*!40000 ALTER TABLE `dm_widget` DISABLE KEYS */;
INSERT INTO `dm_widget` VALUES (1,1,'dmWidgetContent','title',NULL,-1,'2017-04-03 16:42:43'),(2,2,'dmUser','signin',NULL,-2,'2017-04-03 16:42:44');
/*!40000 ALTER TABLE `dm_widget` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_widget_translation`
--

DROP TABLE IF EXISTS `dm_widget_translation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_widget_translation` (
  `id` bigint(20) NOT NULL DEFAULT '0',
  `value` text COLLATE utf8_unicode_ci,
  `lang` varchar(7) COLLATE utf8_unicode_ci NOT NULL DEFAULT '',
  PRIMARY KEY (`id`,`lang`),
  CONSTRAINT `dm_widget_translation_id_dm_widget_id` FOREIGN KEY (`id`) REFERENCES `dm_widget` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_widget_translation`
--

LOCK TABLES `dm_widget_translation` WRITE;
/*!40000 ALTER TABLE `dm_widget_translation` DISABLE KEYS */;
INSERT INTO `dm_widget_translation` VALUES (1,'{\"text\":\"Page not found\",\"tag\":\"h1\"}','es'),(2,'[]','es');
/*!40000 ALTER TABLE `dm_widget_translation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dm_zone`
--

DROP TABLE IF EXISTS `dm_zone`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dm_zone` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `dm_area_id` bigint(20) NOT NULL,
  `css_class` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `width` varchar(15) COLLATE utf8_unicode_ci DEFAULT NULL,
  `position` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `dm_area_id_idx` (`dm_area_id`),
  CONSTRAINT `dm_zone_dm_area_id_dm_area_id` FOREIGN KEY (`dm_area_id`) REFERENCES `dm_area` (`id`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dm_zone`
--

LOCK TABLES `dm_zone` WRITE;
/*!40000 ALTER TABLE `dm_zone` DISABLE KEYS */;
INSERT INTO `dm_zone` VALUES (1,1,NULL,NULL,-1),(2,2,NULL,NULL,-2);
/*!40000 ALTER TABLE `dm_zone` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-03 16:47:05
