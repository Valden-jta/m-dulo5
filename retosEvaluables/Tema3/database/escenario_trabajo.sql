-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: tema2_workbench
-- ------------------------------------------------------
-- Server version	8.0.41

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
-- Table structure for table `groups`
--

DROP TABLE IF EXISTS `groups`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `groups` (
  `groups_id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `groups`
--

LOCK TABLES `groups` WRITE;
/*!40000 ALTER TABLE `groups` DISABLE KEYS */;
INSERT INTO `groups` VALUES (1,'turno_mañana_1'),(2,'turno_mañana_2'),(3,'turno_mañana_3'),(4,'turno_mañana_4'),(5,'turno_mañana_5'),(6,'turno_tarde_1'),(7,'turno_tarde_2'),(8,'turno_tarde_3'),(9,'turno_tarde_4'),(10,'turno_tarde_5');
/*!40000 ALTER TABLE `groups` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `marks` (
  `mark_id` int NOT NULL AUTO_INCREMENT,
  `student_id` int DEFAULT NULL,
  `subject_id` int DEFAULT NULL,
  `date` date DEFAULT NULL,
  `mark` int DEFAULT NULL,
  PRIMARY KEY (`mark_id`),
  KEY `FK_student_idx` (`student_id`),
  KEY `FK_subject_idx` (`subject_id`),
  CONSTRAINT `FK_student` FOREIGN KEY (`student_id`) REFERENCES `students` (`student_id`),
  CONSTRAINT `FK_subject` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=341 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,1,'2010-06-10',9),(2,1,2,'2010-07-20',7),(3,1,3,'2011-06-12',9),(4,1,4,'2011-07-15',7),(5,1,5,'2012-06-14',9),(6,1,6,'2012-07-18',8),(7,1,7,'2013-06-11',9),(8,1,8,'2013-07-22',8),(9,1,9,'2014-06-13',8),(10,1,10,'2014-07-19',8),(11,1,11,'2015-06-10',9),(12,1,12,'2015-07-20',9),(13,1,13,'2016-06-12',10),(14,1,14,'2016-07-15',8),(15,1,15,'2017-06-14',10),(16,2,1,'2010-06-11',8),(17,2,2,'2010-07-21',6),(18,2,3,'2011-06-13',9),(19,2,4,'2011-07-16',7),(20,2,5,'2012-06-15',8),(21,2,6,'2012-07-19',8),(22,2,7,'2013-06-12',9),(23,2,8,'2013-07-23',8),(24,2,9,'2014-06-14',8),(25,2,10,'2014-07-20',9),(26,2,11,'2015-06-11',9),(27,2,12,'2015-07-21',9),(28,2,13,'2016-06-13',10),(29,2,14,'2016-07-16',8),(30,2,15,'2017-06-15',10),(31,3,1,'2011-06-10',8),(32,3,2,'2011-07-20',7),(33,3,3,'2012-06-12',9),(34,3,4,'2012-07-15',8),(35,3,5,'2013-06-14',9),(36,3,6,'2013-07-18',8),(37,3,7,'2014-06-11',8),(38,3,8,'2014-07-22',9),(39,3,9,'2015-06-13',9),(40,3,10,'2015-07-19',9),(41,3,11,'2016-06-10',9),(42,3,12,'2016-07-20',9),(43,3,13,'2017-06-12',10),(44,3,14,'2017-07-15',8),(45,3,15,'2018-06-14',10),(46,4,1,'2011-06-11',8),(47,4,2,'2011-07-21',6),(48,4,3,'2012-06-13',9),(49,4,4,'2012-07-16',7),(50,4,5,'2013-06-15',8),(51,4,6,'2013-07-19',8),(52,4,7,'2014-06-12',9),(53,4,8,'2014-07-23',8),(54,4,9,'2015-06-14',8),(55,4,10,'2015-07-20',9),(56,4,11,'2016-06-11',9),(57,4,12,'2016-07-21',9),(58,4,13,'2017-06-13',10),(59,4,14,'2017-07-16',8),(60,4,15,'2018-06-15',10),(61,5,1,'2012-06-12',9),(62,5,2,'2012-07-18',8),(63,5,3,'2013-06-10',9),(64,5,4,'2013-07-22',8),(65,5,5,'2014-06-13',8),(66,5,6,'2014-07-19',8),(67,5,7,'2015-06-11',9),(68,5,8,'2015-07-20',9),(69,5,9,'2016-06-12',10),(70,5,10,'2016-07-15',8),(71,5,11,'2017-06-14',10),(72,6,1,'2012-06-11',8),(73,6,2,'2012-07-21',6),(74,6,3,'2013-06-13',9),(75,6,4,'2013-07-16',7),(76,6,5,'2014-06-15',8),(77,6,6,'2014-07-19',8),(78,6,7,'2015-06-12',9),(79,6,8,'2015-07-23',8),(80,6,9,'2016-06-14',8),(81,6,10,'2016-07-20',9),(82,6,11,'2017-06-11',9),(83,6,12,'2017-07-21',9),(84,6,13,'2018-06-13',10),(85,6,14,'2018-07-16',8),(86,6,15,'2019-06-15',10),(87,7,1,'2013-06-10',8),(88,7,2,'2013-07-20',7),(89,7,3,'2014-06-12',9),(90,7,4,'2014-07-15',8),(91,7,5,'2015-06-14',9),(92,7,6,'2015-07-18',8),(93,7,7,'2016-06-11',8),(94,7,8,'2016-07-22',9),(95,7,9,'2017-06-13',9),(96,7,10,'2017-07-19',9),(97,7,11,'2018-06-10',9),(98,7,12,'2018-07-20',9),(99,7,13,'2019-06-12',10),(100,7,14,'2019-07-15',8),(101,7,15,'2020-06-14',10),(102,8,1,'2013-06-11',8),(103,8,2,'2013-07-21',6),(104,8,3,'2014-06-13',9),(105,8,4,'2014-07-16',7),(106,8,5,'2015-06-15',8),(107,8,6,'2015-07-19',8),(108,8,7,'2016-06-12',9),(109,8,8,'2016-07-23',8),(110,8,9,'2017-06-14',8),(111,8,10,'2017-07-20',9),(112,8,11,'2018-06-11',9),(113,8,12,'2018-07-21',9),(114,8,13,'2019-06-13',10),(115,8,14,'2019-07-16',8),(116,8,15,'2020-06-15',10),(117,9,1,'2014-06-10',9),(118,9,2,'2014-07-20',7),(119,9,3,'2015-06-12',9),(120,9,4,'2015-07-15',7),(121,9,5,'2016-06-14',9),(122,9,6,'2016-07-18',8),(123,9,7,'2017-06-11',9),(124,9,8,'2017-07-22',8),(125,9,9,'2018-06-13',8),(126,9,10,'2018-07-19',8),(127,9,11,'2019-06-10',9),(128,9,12,'2019-07-20',9),(129,9,13,'2020-06-12',10),(130,9,14,'2020-07-15',8),(131,9,15,'2021-06-14',10),(132,10,1,'2014-06-11',8),(133,10,2,'2014-07-21',6),(134,10,3,'2015-06-13',9),(135,10,4,'2015-07-16',7),(136,10,5,'2016-06-15',8),(137,10,6,'2016-07-19',8),(138,10,7,'2017-06-12',9),(139,10,8,'2017-07-23',8),(140,10,9,'2018-06-14',8),(141,10,10,'2018-07-20',9),(142,10,11,'2019-06-11',9),(143,10,12,'2019-07-21',9),(144,10,13,'2020-06-13',10),(145,10,14,'2020-07-16',8),(146,10,15,'2021-06-15',10),(147,11,1,'2015-06-10',8),(148,11,2,'2015-07-20',7),(149,11,3,'2016-06-12',9),(150,11,4,'2016-07-15',8),(151,11,5,'2017-06-14',9),(152,11,6,'2017-07-18',8),(153,11,7,'2018-06-11',8),(154,11,8,'2018-07-22',9),(155,11,9,'2019-06-13',9),(156,11,10,'2019-07-19',9),(157,11,11,'2020-06-10',9),(158,11,12,'2020-07-20',9),(159,11,13,'2021-06-12',10),(160,11,14,'2021-07-15',8),(161,11,15,'2022-06-14',10),(162,12,1,'2015-06-11',8),(163,12,2,'2015-07-21',6),(164,12,3,'2016-06-13',9),(165,12,4,'2016-07-16',7),(166,12,5,'2017-06-15',8),(167,12,6,'2017-07-19',8),(168,12,7,'2018-06-12',9),(169,12,8,'2018-07-23',8),(170,12,9,'2019-06-14',8),(171,12,10,'2019-07-20',9),(172,12,11,'2020-06-11',9),(173,12,12,'2020-07-21',9),(174,12,13,'2021-06-13',10),(175,12,14,'2021-07-16',8),(176,12,15,'2022-06-15',10),(177,13,1,'2016-06-10',9),(178,13,2,'2016-07-20',7),(179,13,3,'2017-06-12',9),(180,13,4,'2017-07-15',7),(181,13,5,'2018-06-14',9),(182,13,6,'2018-07-18',8),(183,13,7,'2019-06-11',9),(184,13,8,'2019-07-22',8),(185,13,9,'2020-06-13',8),(186,13,10,'2020-07-19',8),(187,13,11,'2021-06-10',9),(188,13,12,'2021-07-20',9),(189,13,13,'2022-06-12',10),(190,13,14,'2022-07-15',8),(191,13,15,'2023-06-14',10),(192,14,1,'2016-06-11',8),(193,14,2,'2016-07-21',6),(194,14,3,'2017-06-13',9),(195,14,4,'2017-07-16',7),(196,14,5,'2018-06-15',8),(197,14,6,'2018-07-19',8),(198,14,7,'2019-06-12',9),(199,14,8,'2019-07-23',8),(200,14,9,'2020-06-14',8),(201,14,10,'2020-07-20',9),(202,14,11,'2021-06-11',9),(203,14,12,'2021-07-21',9),(204,14,13,'2022-06-13',10),(205,14,14,'2022-07-16',8),(206,14,15,'2023-06-15',10),(207,15,1,'2017-06-10',8),(208,15,2,'2017-07-20',7),(209,15,3,'2018-06-12',9),(210,15,4,'2018-07-15',8),(211,15,5,'2019-06-14',9),(212,15,6,'2019-07-18',8),(213,15,7,'2020-06-11',8),(214,15,8,'2020-07-22',9),(215,15,9,'2021-06-13',9),(216,15,10,'2021-07-19',9),(217,15,11,'2022-06-10',9),(218,15,12,'2022-07-20',9),(219,15,13,'2023-06-12',10),(220,15,14,'2023-07-15',8),(221,15,15,'2024-06-14',10),(222,16,1,'2017-06-11',8),(223,16,2,'2017-07-21',6),(224,16,3,'2018-06-13',9),(225,16,4,'2018-07-16',7),(226,16,5,'2019-06-15',8),(227,16,6,'2019-07-19',8),(228,16,7,'2020-06-12',9),(229,16,8,'2020-07-23',8),(230,16,9,'2021-06-14',8),(231,16,10,'2021-07-20',9),(232,16,11,'2022-06-11',9),(233,16,12,'2022-07-21',9),(234,16,13,'2023-06-13',10),(235,16,14,'2023-07-16',8),(236,16,15,'2024-06-15',10),(237,17,1,'2018-06-10',5),(238,17,2,'2018-07-20',7),(239,17,3,'2019-06-12',7),(240,17,4,'2019-07-15',5),(241,17,5,'2020-06-14',9),(242,17,6,'2020-07-18',7),(243,17,7,'2021-06-11',9),(244,17,8,'2021-07-22',7),(245,17,9,'2022-06-13',5),(246,17,10,'2022-07-19',8),(247,17,11,'2023-06-10',9),(248,17,12,'2023-07-20',8),(249,18,1,'2018-06-11',6),(250,18,2,'2018-07-21',4),(251,18,3,'2019-06-13',8),(252,18,4,'2019-07-16',6),(253,18,5,'2020-06-15',8),(254,18,6,'2020-07-19',6),(255,18,7,'2021-06-12',9),(256,18,8,'2021-07-23',8),(257,18,9,'2022-06-14',7),(258,18,10,'2022-07-20',9),(259,18,11,'2023-06-11',9),(260,18,12,'2023-07-21',7),(261,19,1,'2019-06-10',4),(262,19,2,'2019-07-20',7),(263,19,3,'2020-06-12',7),(264,19,4,'2020-07-15',5),(265,19,5,'2021-06-14',8),(266,19,6,'2021-07-18',7),(267,19,7,'2022-06-11',10),(268,19,8,'2022-07-22',7),(269,19,9,'2023-06-13',5),(270,19,10,'2023-07-19',8),(271,20,1,'2019-06-11',5),(272,20,2,'2019-07-21',5),(273,20,3,'2020-06-13',8),(274,20,4,'2020-07-16',6),(275,20,5,'2021-06-15',9),(276,20,6,'2021-07-19',6),(277,20,7,'2022-06-12',9),(278,20,8,'2022-07-23',8),(279,20,9,'2023-06-14',7),(280,20,10,'2023-07-20',9),(281,21,1,'2020-06-10',7),(282,21,2,'2020-07-20',5),(283,21,3,'2021-06-12',7),(284,21,4,'2021-07-15',5),(285,21,5,'2022-06-14',8),(286,21,6,'2022-07-18',7),(287,21,7,'2023-06-11',9),(288,21,8,'2023-07-22',8),(289,21,9,'2024-06-13',6),(290,21,10,'2024-07-19',8),(291,22,1,'2020-06-11',6),(292,22,2,'2020-07-21',4),(293,22,3,'2021-06-13',8),(294,22,4,'2021-07-16',6),(295,22,5,'2022-06-15',8),(296,22,6,'2022-07-19',6),(297,22,7,'2023-06-12',9),(298,22,8,'2023-07-23',8),(299,22,9,'2024-06-14',7),(300,22,10,'2024-07-20',9),(301,23,1,'2021-06-10',4),(302,23,2,'2021-07-20',4),(303,23,3,'2022-06-12',7),(304,23,4,'2022-07-15',5),(305,23,5,'2023-06-14',7),(306,23,6,'2023-07-18',5),(307,23,7,'2024-06-11',9),(308,23,8,'2024-07-22',6),(309,24,1,'2021-06-11',4),(310,24,2,'2021-07-21',4),(311,24,3,'2022-06-13',7),(312,24,4,'2022-07-16',6),(313,24,5,'2023-06-15',8),(314,24,6,'2023-07-19',5),(315,24,7,'2024-06-12',8),(316,24,8,'2024-07-23',7),(317,25,1,'2022-06-10',4),(318,25,2,'2022-07-20',4),(319,25,3,'2023-06-12',7),(320,25,4,'2023-07-15',4),(321,25,5,'2024-06-14',8),(322,25,6,'2024-07-18',5),(323,26,1,'2022-06-11',4),(324,26,2,'2022-07-21',5),(325,26,3,'2023-06-13',6),(326,26,4,'2023-07-16',5),(327,26,5,'2024-06-15',7),(328,26,6,'2024-07-19',4),(329,27,1,'2023-06-10',4),(330,27,2,'2023-07-20',4),(331,27,3,'2024-06-12',7),(332,27,4,'2024-07-15',5),(333,28,1,'2023-06-11',4),(334,28,2,'2023-07-21',4),(335,28,3,'2024-06-13',7),(336,28,4,'2024-07-16',6),(337,29,1,'2024-06-10',4),(338,29,2,'2024-07-20',4),(339,30,1,'2024-06-12',4),(340,30,2,'2024-07-15',4);
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `students`
--

DROP TABLE IF EXISTS `students`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `students` (
  `student_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  `groups_id` int DEFAULT NULL,
  `entry_year` int DEFAULT NULL,
  PRIMARY KEY (`student_id`),
  KEY `FK_groups_idx` (`groups_id`),
  CONSTRAINT `FK_groups` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`groups_id`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `students`
--

LOCK TABLES `students` WRITE;
/*!40000 ALTER TABLE `students` DISABLE KEYS */;
INSERT INTO `students` VALUES (1,'Andrés','Martínez',1,2010),(2,'Beatriz','Lozano',1,2010),(3,'Cristina','Navarro',1,2011),(4,'Daniel','Ortega',2,2011),(5,'Elena','Ruiz',2,2012),(6,'Fernando','Gómez',2,2012),(7,'Gloria','Sánchez',3,2013),(8,'Hugo','Cástro',3,2013),(9,'Isabel','Romero',3,2014),(10,'Jorge','Jiménez',4,2014),(11,'Carolina','Muñoz',4,2015),(12,'Luis','Domínguez',4,2015),(13,'Marta','Paredes',5,2016),(14,'Nicolás','Reyes',5,2016),(15,'Olga','Blanco',5,2017),(16,'Pablo','Álvarez',6,2017),(17,'Raqúel','Salas',6,2018),(18,'Sergio','Delgado',6,2018),(19,'Tamara','Velasco',7,2019),(20,'Ulises','Gallego',7,2019),(21,'Valeria','Peña',7,2020),(22,'Guillermo','Quintana',8,2020),(23,'Ximena','Fuentes',8,2021),(24,'Yago','Montes',8,2021),(25,'Zaira','Alonso',9,2022),(26,'Álvaro','Medina',9,2022),(27,'Bárbara','Pastor',9,2023),(28,'César','Redondo',10,2023),(29,'Diana','Silva',10,2024),(30,'Esteban','Ramírez',10,2024);
/*!40000 ALTER TABLE `students` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subject_teacher`
--

DROP TABLE IF EXISTS `subject_teacher`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subject_teacher` (
  `subject_teacher_id` int NOT NULL AUTO_INCREMENT,
  `subject_id` int NOT NULL,
  `teacher_id` int NOT NULL,
  `groups_id` int NOT NULL,
  PRIMARY KEY (`subject_teacher_id`),
  KEY `FK_subject_id_idx` (`subject_id`),
  KEY `FK_teacher_id_idx` (`teacher_id`),
  KEY `FK_groups_id_idx` (`groups_id`),
  CONSTRAINT `FK_groups_id` FOREIGN KEY (`groups_id`) REFERENCES `groups` (`groups_id`),
  CONSTRAINT `FK_subject_id` FOREIGN KEY (`subject_id`) REFERENCES `subjects` (`subject_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `FK_teacher_id` FOREIGN KEY (`teacher_id`) REFERENCES `teachers` (`teacher_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subject_teacher`
--

LOCK TABLES `subject_teacher` WRITE;
/*!40000 ALTER TABLE `subject_teacher` DISABLE KEYS */;
INSERT INTO `subject_teacher` VALUES (1,1,1,1),(2,2,1,2),(3,3,2,3),(4,4,3,4),(5,5,4,5),(6,6,5,6),(7,7,6,7),(8,8,7,8),(9,9,8,9),(10,10,9,10),(11,11,10,1),(12,12,1,2),(13,13,2,3),(14,14,3,4),(15,15,4,5);
/*!40000 ALTER TABLE `subject_teacher` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `subjects`
--

DROP TABLE IF EXISTS `subjects`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `subjects` (
  `subject_id` int NOT NULL AUTO_INCREMENT,
  `title` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`subject_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `subjects`
--

LOCK TABLES `subjects` WRITE;
/*!40000 ALTER TABLE `subjects` DISABLE KEYS */;
INSERT INTO `subjects` VALUES (1,'Biología Molecular'),(2,'Genética'),(3,'Ecología'),(4,'Fisiología Animal'),(5,'Fisiología Vegetal'),(6,'Microbiología'),(7,'Zoología'),(8,'Botánica'),(9,'Biotecnología'),(10,'Evolución'),(11,'Bioquímica'),(12,'Inmunología'),(13,'Parasitología'),(14,'Biología Marina'),(15,'Neurobiología');
/*!40000 ALTER TABLE `subjects` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `teachers`
--

DROP TABLE IF EXISTS `teachers`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `teachers` (
  `teacher_id` int NOT NULL AUTO_INCREMENT,
  `first_name` varchar(60) DEFAULT NULL,
  `last_name` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`teacher_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `teachers`
--

LOCK TABLES `teachers` WRITE;
/*!40000 ALTER TABLE `teachers` DISABLE KEYS */;
INSERT INTO `teachers` VALUES (1,'Laura','García'),(2,'Pedro','Rodríguez'),(3,'Carmen','Morales'),(4,'José','Navarro'),(5,'Sara','Ortiz'),(6,'David','Castro'),(7,'Marta','Ruiz'),(8,'Antonio','Vega'),(9,'Isabel','Gil'),(10,'Francisco','Molina');
/*!40000 ALTER TABLE `teachers` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-04 21:32:15
