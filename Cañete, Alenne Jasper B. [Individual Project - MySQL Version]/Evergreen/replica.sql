-- MySQL dump 10.13  Distrib 8.0.32, for Win64 (x86_64)
--
-- Host: localhost    Database: evergreen
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `admin_interface_theme`
--

DROP TABLE IF EXISTS `admin_interface_theme`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `admin_interface_theme` (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `active` tinyint(1) NOT NULL,
  `title` varchar(50) NOT NULL,
  `title_visible` tinyint(1) NOT NULL,
  `logo` varchar(100) NOT NULL,
  `logo_visible` tinyint(1) NOT NULL,
  `css_header_background_color` varchar(10) NOT NULL,
  `title_color` varchar(10) NOT NULL,
  `css_header_text_color` varchar(10) NOT NULL,
  `css_header_link_color` varchar(10) NOT NULL,
  `css_header_link_hover_color` varchar(10) NOT NULL,
  `css_module_background_color` varchar(10) NOT NULL,
  `css_module_text_color` varchar(10) NOT NULL,
  `css_module_link_color` varchar(10) NOT NULL,
  `css_module_link_hover_color` varchar(10) NOT NULL,
  `css_module_rounded_corners` tinyint(1) NOT NULL,
  `css_generic_link_color` varchar(10) NOT NULL,
  `css_generic_link_hover_color` varchar(10) NOT NULL,
  `css_save_button_background_color` varchar(10) NOT NULL,
  `css_save_button_background_hover_color` varchar(10) NOT NULL,
  `css_save_button_text_color` varchar(10) NOT NULL,
  `css_delete_button_background_color` varchar(10) NOT NULL,
  `css_delete_button_background_hover_color` varchar(10) NOT NULL,
  `css_delete_button_text_color` varchar(10) NOT NULL,
  `list_filter_dropdown` tinyint(1) NOT NULL,
  `related_modal_active` tinyint(1) NOT NULL,
  `related_modal_background_color` varchar(10) NOT NULL,
  `related_modal_rounded_corners` tinyint(1) NOT NULL,
  `logo_color` varchar(10) NOT NULL,
  `recent_actions_visible` tinyint(1) NOT NULL,
  `favicon` varchar(100) NOT NULL,
  `related_modal_background_opacity` varchar(5) NOT NULL,
  `env_name` varchar(50) NOT NULL,
  `env_visible_in_header` tinyint(1) NOT NULL,
  `env_color` varchar(10) NOT NULL,
  `env_visible_in_favicon` tinyint(1) NOT NULL,
  `related_modal_close_button_visible` tinyint(1) NOT NULL,
  `language_chooser_active` tinyint(1) NOT NULL,
  `language_chooser_display` varchar(10) NOT NULL,
  `list_filter_sticky` tinyint(1) NOT NULL,
  `form_pagination_sticky` tinyint(1) NOT NULL,
  `form_submit_sticky` tinyint(1) NOT NULL,
  `css_module_background_selected_color` varchar(10) NOT NULL,
  `css_module_link_selected_color` varchar(10) NOT NULL,
  `logo_max_height` smallint unsigned NOT NULL,
  `logo_max_width` smallint unsigned NOT NULL,
  `foldable_apps` tinyint(1) NOT NULL,
  `language_chooser_control` varchar(20) NOT NULL,
  `list_filter_highlight` tinyint(1) NOT NULL,
  `list_filter_removal_links` tinyint(1) NOT NULL,
  `show_fieldsets_as_tabs` tinyint(1) NOT NULL,
  `show_inlines_as_tabs` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `admin_interface_theme_name_30bda70f_uniq` (`name`),
  CONSTRAINT `admin_interface_theme_chk_1` CHECK ((`logo_max_height` >= 0)),
  CONSTRAINT `admin_interface_theme_chk_2` CHECK ((`logo_max_width` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin_interface_theme`
--

LOCK TABLES `admin_interface_theme` WRITE;
/*!40000 ALTER TABLE `admin_interface_theme` DISABLE KEYS */;
INSERT INTO `admin_interface_theme` VALUES (1,'Evergreen\'s Theme',1,'Evergreen\'s Emporium Repository',1,'admin-interface/logo/crest.png',1,'#8A0C0C','#FFE27C','#FFFFFF','#FFFFFF','#FFE27C','#2E8B57','#FFFFFF','#FFFFFF','#FFE27C',1,'#2E8B57','#16432A','#2E8B57','#16432A','#FFFFFF','#8A0C0C','#781E1E','#FFFFFF',1,1,'#2E8B57',1,'#FFE27C',0,'admin-interface/favicon/crest.ico','0.5','Evergreen\'s Emporium Environment',1,'#2E8B57',1,1,1,'code',1,0,0,'#FFE27C','#FFE27C',100,400,1,'default-select',1,0,0,0);
/*!40000 ALTER TABLE `admin_interface_theme` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `auth_permission`
--

LOCK TABLES `auth_permission` WRITE;
/*!40000 ALTER TABLE `auth_permission` DISABLE KEYS */;
INSERT INTO `auth_permission` VALUES (1,'Can add Theme',1,'add_theme'),(2,'Can change Theme',1,'change_theme'),(3,'Can delete Theme',1,'delete_theme'),(4,'Can view Theme',1,'view_theme'),(5,'Can add log entry',2,'add_logentry'),(6,'Can change log entry',2,'change_logentry'),(7,'Can delete log entry',2,'delete_logentry'),(8,'Can view log entry',2,'view_logentry'),(9,'Can add permission',3,'add_permission'),(10,'Can change permission',3,'change_permission'),(11,'Can delete permission',3,'delete_permission'),(12,'Can view permission',3,'view_permission'),(13,'Can add group',4,'add_group'),(14,'Can change group',4,'change_group'),(15,'Can delete group',4,'delete_group'),(16,'Can view group',4,'view_group'),(17,'Can add content type',5,'add_contenttype'),(18,'Can change content type',5,'change_contenttype'),(19,'Can delete content type',5,'delete_contenttype'),(20,'Can view content type',5,'view_contenttype'),(21,'Can add session',6,'add_session'),(22,'Can change session',6,'change_session'),(23,'Can delete session',6,'delete_session'),(24,'Can view session',6,'view_session'),(25,'Can add Report',7,'add_report'),(26,'Can change Report',7,'change_report'),(27,'Can delete Report',7,'delete_report'),(28,'Can view Report',7,'view_report'),(29,'Can add Transaction',8,'add_transaction'),(30,'Can change Transaction',8,'change_transaction'),(31,'Can delete Transaction',8,'delete_transaction'),(32,'Can view Transaction',8,'view_transaction'),(33,'Can add User',9,'add_user'),(34,'Can change User',9,'change_user'),(35,'Can delete User',9,'delete_user'),(36,'Can view User',9,'view_user'),(37,'Can add Delivery',10,'add_delivery'),(38,'Can change Delivery',10,'change_delivery'),(39,'Can delete Delivery',10,'delete_delivery'),(40,'Can view Delivery',10,'view_delivery'),(41,'Can add Item',11,'add_item'),(42,'Can change Item',11,'change_item'),(43,'Can delete Item',11,'delete_item'),(44,'Can view Item',11,'view_item'),(45,'Can add Persona',12,'add_persona'),(46,'Can change Persona',12,'change_persona'),(47,'Can delete Persona',12,'delete_persona'),(48,'Can view Persona',12,'view_persona'),(49,'Can add Purchase',13,'add_purchase'),(50,'Can change Purchase',13,'change_purchase'),(51,'Can delete Purchase',13,'delete_purchase'),(52,'Can view Purchase',13,'view_purchase'),(53,'Can add Order',14,'add_order'),(54,'Can change Order',14,'change_order'),(55,'Can delete Order',14,'delete_order'),(56,'Can view Order',14,'view_order');
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
  KEY `django_admin_log_user_id_c564eba6_fk_emporium_user_id` (`user_id`),
  CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  CONSTRAINT `django_admin_log_user_id_c564eba6_fk_emporium_user_id` FOREIGN KEY (`user_id`) REFERENCES `emporium_user` (`id`),
  CONSTRAINT `django_admin_log_chk_1` CHECK ((`action_flag` >= 0))
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_admin_log`
--

LOCK TABLES `django_admin_log` WRITE;
/*!40000 ALTER TABLE `django_admin_log` DISABLE KEYS */;
INSERT INTO `django_admin_log` VALUES (1,'2023-03-18 07:02:32.938215','1','Evergreen\'s Theme',2,'[{\"changed\": {\"fields\": [\"Name\", \"Name\", \"Color\", \"Logo\", \"Color\", \"Favicon\", \"Title\", \"Color\", \"Background color\", \"Text color\", \"Link hover color\", \"Background color\", \"Background selected color\", \"Link selected color\", \"Link hover color\", \"Link color\", \"Link hover color\", \"Background color\", \"Background hover color\", \"Background color\", \"Background hover color\", \"Background color\", \"Background opacity\", \"Visible\"]}}]',1,1),(2,'2023-03-18 07:02:50.959412','1','Evergreen // user assigned upon the repository!',1,'[{\"added\": {}}]',12,1),(3,'2023-03-18 07:05:11.312936','1','Lemon // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1),(4,'2023-03-18 07:05:40.891853','2','Philodendron // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1),(5,'2023-03-18 07:06:13.821538','3','Peony // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1),(6,'2023-03-18 07:06:49.578504','4','Cactus // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1),(7,'2023-03-18 07:07:29.860165','5','Magnolia // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1),(8,'2023-03-18 07:07:56.643305','6','Hydrangea // marketed upon the emporium!',1,'[{\"added\": {}}]',11,1);
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
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_content_type`
--

LOCK TABLES `django_content_type` WRITE;
/*!40000 ALTER TABLE `django_content_type` DISABLE KEYS */;
INSERT INTO `django_content_type` VALUES (2,'admin','logentry'),(1,'admin_interface','theme'),(4,'auth','group'),(3,'auth','permission'),(5,'contenttypes','contenttype'),(10,'emporium','delivery'),(11,'emporium','item'),(14,'emporium','order'),(12,'emporium','persona'),(13,'emporium','purchase'),(7,'emporium','report'),(8,'emporium','transaction'),(9,'emporium','user'),(6,'sessions','session');
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
) ENGINE=InnoDB AUTO_INCREMENT=48 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `django_migrations`
--

LOCK TABLES `django_migrations` WRITE;
/*!40000 ALTER TABLE `django_migrations` DISABLE KEYS */;
INSERT INTO `django_migrations` VALUES (1,'contenttypes','0001_initial','2023-03-18 06:56:40.162423'),(2,'contenttypes','0002_remove_content_type_name','2023-03-18 06:56:40.256153'),(3,'auth','0001_initial','2023-03-18 06:56:40.584612'),(4,'auth','0002_alter_permission_name_max_length','2023-03-18 06:56:40.647096'),(5,'auth','0003_alter_user_email_max_length','2023-03-18 06:56:40.662718'),(6,'auth','0004_alter_user_username_opts','2023-03-18 06:56:40.662718'),(7,'auth','0005_alter_user_last_login_null','2023-03-18 06:56:40.678369'),(8,'auth','0006_require_contenttypes_0002','2023-03-18 06:56:40.693960'),(9,'auth','0007_alter_validators_add_error_messages','2023-03-18 06:56:40.693960'),(10,'auth','0008_alter_user_username_max_length','2023-03-18 06:56:40.709587'),(11,'auth','0009_alter_user_last_name_max_length','2023-03-18 06:56:40.725319'),(12,'auth','0010_alter_group_name_max_length','2023-03-18 06:56:40.756447'),(13,'auth','0011_update_proxy_permissions','2023-03-18 06:56:40.772247'),(14,'auth','0012_alter_user_first_name_max_length','2023-03-18 06:56:40.787897'),(15,'emporium','0001_initial','2023-03-18 06:56:41.773296'),(16,'admin','0001_initial','2023-03-18 06:56:41.913835'),(17,'admin','0002_logentry_remove_auto_add','2023-03-18 06:56:41.929487'),(18,'admin','0003_logentry_add_action_flag_choices','2023-03-18 06:56:41.945077'),(19,'admin_interface','0001_initial','2023-03-18 06:56:41.976320'),(20,'admin_interface','0002_add_related_modal','2023-03-18 06:56:42.117022'),(21,'admin_interface','0003_add_logo_color','2023-03-18 06:56:42.163775'),(22,'admin_interface','0004_rename_title_color','2023-03-18 06:56:42.179399'),(23,'admin_interface','0005_add_recent_actions_visible','2023-03-18 06:56:42.241881'),(24,'admin_interface','0006_bytes_to_str','2023-03-18 06:56:42.319994'),(25,'admin_interface','0007_add_favicon','2023-03-18 06:56:42.366857'),(26,'admin_interface','0008_change_related_modal_background_opacity_type','2023-03-18 06:56:42.429371'),(27,'admin_interface','0009_add_enviroment','2023-03-18 06:56:42.499670'),(28,'admin_interface','0010_add_localization','2023-03-18 06:56:42.530885'),(29,'admin_interface','0011_add_environment_options','2023-03-18 06:56:42.687205'),(30,'admin_interface','0012_update_verbose_names','2023-03-18 06:56:42.702716'),(31,'admin_interface','0013_add_related_modal_close_button','2023-03-18 06:56:42.749580'),(32,'admin_interface','0014_name_unique','2023-03-18 06:56:42.780852'),(33,'admin_interface','0015_add_language_chooser_active','2023-03-18 06:56:42.827690'),(34,'admin_interface','0016_add_language_chooser_display','2023-03-18 06:56:42.874551'),(35,'admin_interface','0017_change_list_filter_dropdown','2023-03-18 06:56:42.874551'),(36,'admin_interface','0018_theme_list_filter_sticky','2023-03-18 06:56:42.921419'),(37,'admin_interface','0019_add_form_sticky','2023-03-18 06:56:43.015174'),(38,'admin_interface','0020_module_selected_colors','2023-03-18 06:56:43.112384'),(39,'admin_interface','0021_file_extension_validator','2023-03-18 06:56:43.128066'),(40,'admin_interface','0022_add_logo_max_width_and_height','2023-03-18 06:56:43.315506'),(41,'admin_interface','0023_theme_foldable_apps','2023-03-18 06:56:43.377954'),(42,'admin_interface','0024_remove_theme_css','2023-03-18 06:56:43.406817'),(43,'admin_interface','0025_theme_language_chooser_control','2023-03-18 06:56:43.469346'),(44,'admin_interface','0026_theme_list_filter_highlight','2023-03-18 06:56:43.531857'),(45,'admin_interface','0027_theme_list_filter_removal_links','2023-03-18 06:56:43.594279'),(46,'admin_interface','0028_theme_show_fieldsets_as_tabs_and_more','2023-03-18 06:56:43.703635'),(47,'sessions','0001_initial','2023-03-18 06:56:43.781731');
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
/*!40000 ALTER TABLE `django_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_delivery`
--

DROP TABLE IF EXISTS `emporium_delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_delivery` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `phone_number` varchar(11) DEFAULT NULL,
  `purok_name` varchar(50) DEFAULT NULL,
  `barangay_name` varchar(50) DEFAULT NULL,
  `municipality_name` varchar(50) DEFAULT NULL,
  `delivery_date` date NOT NULL,
  `persona_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emporium_delivery_persona_id_62a2b991_fk_emporium_persona_id` (`persona_id`),
  KEY `emporium_delivery_purchase_id_98264ec9_fk_emporium_purchase_id` (`purchase_id`),
  KEY `emporium_de_phone_n_ca7270_idx` (`phone_number`),
  CONSTRAINT `emporium_delivery_persona_id_62a2b991_fk_emporium_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `emporium_persona` (`id`),
  CONSTRAINT `emporium_delivery_purchase_id_98264ec9_fk_emporium_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `emporium_purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_delivery`
--

LOCK TABLES `emporium_delivery` WRITE;
/*!40000 ALTER TABLE `emporium_delivery` DISABLE KEYS */;
INSERT INTO `emporium_delivery` VALUES (1,'0987654321','Lotus','San Isidro','General Santos','2023-03-21',2,1);
/*!40000 ALTER TABLE `emporium_delivery` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_item`
--

DROP TABLE IF EXISTS `emporium_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_item` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `item_name` varchar(125) DEFAULT NULL,
  `item_description` longtext,
  `item_price` decimal(5,2) NOT NULL,
  `item_quantity` int DEFAULT NULL,
  `item_image` varchar(100) DEFAULT NULL,
  `item_catalogue` varchar(125) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emporium_it_item_na_a6175a_idx` (`item_name`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_item`
--

LOCK TABLES `emporium_item` WRITE;
/*!40000 ALTER TABLE `emporium_item` DISABLE KEYS */;
INSERT INTO `emporium_item` VALUES (1,'Lemon','Lemon is an associate of a certain species within a small evergreen tree in the flowering plant family Rutaceae, native to Asia, primarily the northeast of India, the north of Myanmar, and China.\r\n\r\nThe ellipsoidal yellow fruit of the lemon is used for culinary and non-culinary purposes throughout the world, primarily for its juice, which has both culinary and cleaning uses. \r\n\r\nThe pulp and rind of the melon are also used in cooking and baking. The distinctive sour taste of lemon juice makes it a key ingredient in drinks and foods such as lemonade and lemon meringue pie.',100.00,99,'lemon.jpg','outdoors'),(2,'Philodendron','Philodendron is a large genus of flowering plants in the family Araceae. Taxonomically, the genus of Philodendron is still poorly known, with many undescribed species.\r\n\r\nThe name of the plant is derived from the following Greek words that mean love, affection, and tree. The generic name, Philodendron, is often used as the English name.\r\n\r\nPhilodendron has an extremely diverse array of growth methods. The habits of growth can be epiphytic, hemiepiphytic, or rarely terrestrial. Other of its varieties can show a combination of these growth habits.',115.00,100,'philodendron.jpg','indoors'),(3,'Peony','Peony is a flowering plant in the genus called Paeonia, the only genus in the family of Paeoniaceae. Peonies are native to Asia, Europe, and the west of North America. \r\n\r\nThe plant has compound, deeply lobed leaves, and large, often fragrant flowers, wherein colors range from purple and pink to red, white, or yellow, blooming only over a short season.\r\n\r\nPeonies are popular garden plants in temperate regions. Herbaceous peonies are also sold as cut flowers on a large scale, although generally only available in late spring and early summer.',109.00,100,'peony.jpg','indoors'),(4,'Cactus','Cactus are members of the family called Cactaceae. The word is derived from an ancient Greek word, originally used by Theophrastus for a spiny plant whose identity is now not certain.\r\n\r\nCactus occur in a wide range of shapes and sizes. Although some species live in quite humid environments, most of them live in habitats subject to at least some drought. \r\n\r\nCactus have a variety of uses. Many species of this particular plant are used as decorative, others are grown for fodder or forage, and others are for food, mainly, its fruit.',106.00,100,'cactus.jpg','outdoors'),(5,'Magnolia','Magnolia is a large genus of flowering plant species in the subfamily Magnolioideae of the family Magnoliaceae. It is anointed after the French botanist named Pierre Magnol.\r\n\r\nMagnolia is an ancient genus. Appearing before the bees evolved, the flowers of the said plant are theorized to have evolved to encourage pollination by beetles. \r\n\r\nThe natural range of Magnolia species is within the east and southeast of Asia, the northeast, center as well as south of America, and the west of Indies.',103.00,100,'magnolia.jpg','outdoors'),(6,'Hydrangea','Hydrangea is a genus of flowering plants native to Asia and the Americas. By far, its greatest species diversity is within the east of Asia, notably in China, Korea, and Japan.\r\n\r\nHydrangea is derived from a Greek word that means water vessel, in reference to the shape of its seed capsules. The earlier name, Hortensia, is a Latinised version of the French given name Hortense.\r\n\r\nMost of the Hydrangea are shrubs, but some are small trees, and others are lianas. Furthermore, the plant can be either deciduous or evergreen, though the widely cultivated temperate species are all deciduous.',112.00,100,'hydrangea.jpg','indoors');
/*!40000 ALTER TABLE `emporium_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_order`
--

DROP TABLE IF EXISTS `emporium_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_order` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `purchase_amount` int DEFAULT NULL,
  `purchase_date` datetime(6) NOT NULL,
  `item_id` bigint DEFAULT NULL,
  `purchase_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emporium_order_item_id_f7cada88_fk_emporium_item_id` (`item_id`),
  KEY `emporium_order_purchase_id_ed428665_fk_emporium_purchase_id` (`purchase_id`),
  CONSTRAINT `emporium_order_item_id_f7cada88_fk_emporium_item_id` FOREIGN KEY (`item_id`) REFERENCES `emporium_item` (`id`),
  CONSTRAINT `emporium_order_purchase_id_ed428665_fk_emporium_purchase_id` FOREIGN KEY (`purchase_id`) REFERENCES `emporium_purchase` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_order`
--

LOCK TABLES `emporium_order` WRITE;
/*!40000 ALTER TABLE `emporium_order` DISABLE KEYS */;
INSERT INTO `emporium_order` VALUES (1,1,'2023-03-18 14:58:40.150503',1,1);
/*!40000 ALTER TABLE `emporium_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emporium_order_view`
--

DROP TABLE IF EXISTS `emporium_order_view`;
/*!50001 DROP VIEW IF EXISTS `emporium_order_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emporium_order_view` AS SELECT 
 1 AS `id`,
 1 AS `purchase_amount`,
 1 AS `purchase_date`,
 1 AS `item_id`,
 1 AS `purchase_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emporium_persona`
--

DROP TABLE IF EXISTS `emporium_persona`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_persona` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_name` varchar(125) DEFAULT NULL,
  `first_name` varchar(65) DEFAULT NULL,
  `last_name` varchar(65) DEFAULT NULL,
  `electronic_mail` varchar(65) DEFAULT NULL,
  `user_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `user_id` (`user_id`),
  KEY `emporium_pe_user_na_4c4f6c_idx` (`user_name`),
  CONSTRAINT `emporium_persona_user_id_ae739585_fk_emporium_user_id` FOREIGN KEY (`user_id`) REFERENCES `emporium_user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_persona`
--

LOCK TABLES `emporium_persona` WRITE;
/*!40000 ALTER TABLE `emporium_persona` DISABLE KEYS */;
INSERT INTO `emporium_persona` VALUES (1,'Evergreen',NULL,NULL,'evergreen.postcard@gmail.com',1),(2,'Jasper','Alenne Jasper','Cañete','alennejasper@gmail.com',2),(3,'Lucy','Lucy','Heartfilia','customer.lucy.heartfilia@gmail.com',3);
/*!40000 ALTER TABLE `emporium_persona` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_purchase`
--

DROP TABLE IF EXISTS `emporium_purchase`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_purchase` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `order_date` datetime(6) NOT NULL,
  `order_completion` tinyint(1) DEFAULT NULL,
  `order_voucher` varchar(20) DEFAULT NULL,
  `order_status` varchar(20) DEFAULT NULL,
  `persona_id` bigint DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `emporium_purchase_persona_id_5e2f342f_fk_emporium_persona_id` (`persona_id`),
  CONSTRAINT `emporium_purchase_persona_id_5e2f342f_fk_emporium_persona_id` FOREIGN KEY (`persona_id`) REFERENCES `emporium_persona` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_purchase`
--

LOCK TABLES `emporium_purchase` WRITE;
/*!40000 ALTER TABLE `emporium_purchase` DISABLE KEYS */;
INSERT INTO `emporium_purchase` VALUES (1,'2023-03-18 14:58:40.150503',1,'1679123331.347085','Processed',2),(2,'2023-03-18 14:58:40.150503',0,'1679122720.150503','Processed',2);
/*!40000 ALTER TABLE `emporium_purchase` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Temporary view structure for view `emporium_purchase_view`
--

DROP TABLE IF EXISTS `emporium_purchase_view`;
/*!50001 DROP VIEW IF EXISTS `emporium_purchase_view`*/;
SET @saved_cs_client     = @@character_set_client;
/*!50503 SET character_set_client = utf8mb4 */;
/*!50001 CREATE VIEW `emporium_purchase_view` AS SELECT 
 1 AS `id`,
 1 AS `order_date`,
 1 AS `order_completion`,
 1 AS `order_voucher`,
 1 AS `order_status`,
 1 AS `persona_id`*/;
SET character_set_client = @saved_cs_client;

--
-- Table structure for table `emporium_user`
--

DROP TABLE IF EXISTS `emporium_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_user` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL,
  `is_customer` tinyint(1) NOT NULL,
  `is_analyst` tinyint(1) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_user`
--

LOCK TABLES `emporium_user` WRITE;
/*!40000 ALTER TABLE `emporium_user` DISABLE KEYS */;
INSERT INTO `emporium_user` VALUES (1,'pbkdf2_sha256$390000$ctnGIlevQDGCHsx1GJ3ohH$GmwovpR4Q9VIP9ZzbZwH8a+MRRFxjh/ASF9QB1maDUg=','2023-03-18 06:59:11.829877',1,'Evergreen','','','evergreen.postcard@gmail.com',1,1,'2023-03-18 06:58:02.707601',0,0),(2,'pbkdf2_sha256$390000$Eiofr0ODYyXJmPRVI7qxek$uXueqaNx6JBGq/Zd4t4Yt2lAQ+TiiqaTjlsYsN7uzHM=','2023-03-18 07:08:36.789006',0,'Jasper','Alenne Jasper','Cañete','alennejasper@gmail.com',0,1,'2023-03-18 07:08:27.405001',1,0),(3,'pbkdf2_sha256$390000$ZLEu3y763J4FXHvtNb0Acs$XxEg4SP2KLjsGCAjTO5Tw7ULa/nqlKxEs00affS/R20=','2023-03-18 07:10:05.824117',0,'Lucy','Lucy','Heartfilia','customer.lucy.heartfilia@gmail.com',0,1,'2023-03-18 07:09:48.295550',0,1);
/*!40000 ALTER TABLE `emporium_user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_user_groups`
--

DROP TABLE IF EXISTS `emporium_user_groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_user_groups` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `group_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emporium_user_groups_user_id_group_id_60912225_uniq` (`user_id`,`group_id`),
  KEY `emporium_user_groups_group_id_2871082c_fk_auth_group_id` (`group_id`),
  CONSTRAINT `emporium_user_groups_group_id_2871082c_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  CONSTRAINT `emporium_user_groups_user_id_4318836c_fk_emporium_user_id` FOREIGN KEY (`user_id`) REFERENCES `emporium_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_user_groups`
--

LOCK TABLES `emporium_user_groups` WRITE;
/*!40000 ALTER TABLE `emporium_user_groups` DISABLE KEYS */;
/*!40000 ALTER TABLE `emporium_user_groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `emporium_user_user_permissions`
--

DROP TABLE IF EXISTS `emporium_user_user_permissions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `emporium_user_user_permissions` (
  `id` bigint NOT NULL AUTO_INCREMENT,
  `user_id` bigint NOT NULL,
  `permission_id` int NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `emporium_user_user_permi_user_id_permission_id_676d8d7d_uniq` (`user_id`,`permission_id`),
  KEY `emporium_user_user_p_permission_id_d7674f79_fk_auth_perm` (`permission_id`),
  CONSTRAINT `emporium_user_user_p_permission_id_d7674f79_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  CONSTRAINT `emporium_user_user_p_user_id_625371fb_fk_emporium_` FOREIGN KEY (`user_id`) REFERENCES `emporium_user` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `emporium_user_user_permissions`
--

LOCK TABLES `emporium_user_user_permissions` WRITE;
/*!40000 ALTER TABLE `emporium_user_user_permissions` DISABLE KEYS */;
/*!40000 ALTER TABLE `emporium_user_user_permissions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Final view structure for view `emporium_order_view`
--

/*!50001 DROP VIEW IF EXISTS `emporium_order_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emporium_order_view` AS select `emporium_order`.`id` AS `id`,`emporium_order`.`purchase_amount` AS `purchase_amount`,`emporium_order`.`purchase_date` AS `purchase_date`,`emporium_order`.`item_id` AS `item_id`,`emporium_order`.`purchase_id` AS `purchase_id` from `emporium_order` */;
/*!50001 SET character_set_client      = @saved_cs_client */;
/*!50001 SET character_set_results     = @saved_cs_results */;
/*!50001 SET collation_connection      = @saved_col_connection */;

--
-- Final view structure for view `emporium_purchase_view`
--

/*!50001 DROP VIEW IF EXISTS `emporium_purchase_view`*/;
/*!50001 SET @saved_cs_client          = @@character_set_client */;
/*!50001 SET @saved_cs_results         = @@character_set_results */;
/*!50001 SET @saved_col_connection     = @@collation_connection */;
/*!50001 SET character_set_client      = utf8mb4 */;
/*!50001 SET character_set_results     = utf8mb4 */;
/*!50001 SET collation_connection      = utf8mb4_0900_ai_ci */;
/*!50001 CREATE ALGORITHM=UNDEFINED */
/*!50013 DEFINER=`root`@`localhost` SQL SECURITY DEFINER */
/*!50001 VIEW `emporium_purchase_view` AS select `emporium_purchase`.`id` AS `id`,`emporium_purchase`.`order_date` AS `order_date`,`emporium_purchase`.`order_completion` AS `order_completion`,`emporium_purchase`.`order_voucher` AS `order_voucher`,`emporium_purchase`.`order_status` AS `order_status`,`emporium_purchase`.`persona_id` AS `persona_id` from `emporium_purchase` */;
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

-- Dump completed on 2023-03-18 15:20:32
