-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: escenario_trabajo
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
-- Table structure for table `direccion`
--

DROP TABLE IF EXISTS `direccion`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `direccion` (
  `direccion_id` int NOT NULL AUTO_INCREMENT,
  `calle` varchar(100) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `ciudad` varchar(60) DEFAULT NULL,
  `codigo_postal` int DEFAULT NULL,
  `pais` varchar(60) DEFAULT NULL,
  PRIMARY KEY (`direccion_id`)
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `direccion`
--

LOCK TABLES `direccion` WRITE;
/*!40000 ALTER TABLE `direccion` DISABLE KEYS */;
INSERT INTO `direccion` VALUES (1,'Avenida Gran Vía',1,'Madrid',28013,'España'),(2,'Calle Alcalá',45,'Madrid',28014,'España'),(3,'Calle Serrano',23,'Madrid',28001,'España'),(4,'Paseo de Gracia',12,'Barcelona',8007,'España'),(5,'La Rambla',5,'Barcelona',8002,'España'),(6,'Calle Balmes',34,'Barcelona',8006,'España'),(7,'Avenida Diagonal',78,'Barcelona',8019,'España'),(8,'Calle Larios',10,'Málaga',29005,'España'),(9,'Paseo del Parque',3,'Málaga',29016,'España'),(10,'Calle Marqués de Larios',15,'Málaga',29015,'España'),(11,'Calle Colón',22,'Valencia',46004,'España'),(12,'Avenida del Puerto',8,'Valencia',46023,'España'),(13,'Calle Caballeros',19,'Valencia',46001,'España'),(14,'Calle Sierpes',7,'Sevilla',41004,'España'),(15,'Avenida de la Constitución',11,'Sevilla',41001,'España'),(16,'Calle Betis',9,'Sevilla',41010,'España'),(17,'Calle Mayor',4,'Zaragoza',50001,'España'),(18,'Paseo de la Independencia',6,'Zaragoza',50004,'España'),(19,'Calle Alfonso I',13,'Zaragoza',50003,'España'),(20,'Calle Uría',2,'Oviedo',33003,'España'),(21,'Calle Gascona',14,'Oviedo',33001,'España'),(22,'Calle Corrida',18,'Gijón',33206,'España'),(23,'Calle San Bernardo',20,'Salamanca',37002,'España'),(24,'Calle Toro',25,'Salamanca',37001,'España'),(25,'Calle Laurel',30,'Logroño',26001,'España'),(26,'Avenida Gran Vía',16,'Bilbao',48001,'España'),(27,'Calle Ercilla',21,'Bilbao',48009,'España'),(28,'Travesía Estafeta',27,'Pamplona',31001,'España'),(29,'Calle Mayor',33,'Pamplona',31001,'España'),(30,'Calle Real',40,'A Coruña',15003,'España'),(31,'Calle del Príncipe',50,'Vigo',36202,'España'),(32,'Calle Urzáiz',60,'Vigo',36201,'España'),(33,'Calle del Castillo',70,'Santa Cruz de Tenerife',38003,'España'),(34,'Calle Triana',80,'Las Palmas',35002,'España'),(35,'Calle Mayor',90,'Santander',39001,'España'),(36,'Calle del Carmen',100,'Santander',39002,'España'),(37,'Calle Ancha',110,'Cádiz',11001,'España'),(38,'Calle Larga',120,'Jerez de la Frontera',11403,'España'),(39,'Calle Nueva',130,'Granada',18009,'España'),(40,'Paseo del Prado',140,'Madrid',28014,'España');
/*!40000 ALTER TABLE `direccion` ENABLE KEYS */;
UNLOCK TABLES;

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
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
INSERT INTO `marks` VALUES (1,1,1,'2013-06-10',8),(2,1,2,'2014-09-15',7),(3,1,3,'2015-06-12',9),(4,2,4,'2010-09-16',6),(5,2,5,'2011-06-11',10),(6,2,6,'2012-09-17',4),(7,3,7,'2016-06-13',8),(8,3,8,'2016-09-18',7),(9,3,9,'2012-06-14',9),(10,4,10,'2013-09-19',6),(11,4,1,'2014-06-10',7),(12,4,2,'2018-09-15',8),(13,5,3,'2018-06-11',9),(14,5,4,'2018-09-16',6),(15,5,5,'2019-06-12',10),(16,6,6,'2019-09-17',5),(17,6,7,'2019-06-13',8),(18,6,8,'2020-09-18',3),(19,7,9,'2020-06-14',9),(20,7,10,'2020-09-19',6),(21,7,1,'2021-06-10',7),(22,8,2,'2021-09-15',8),(23,8,3,'2021-06-11',9),(24,8,4,'2022-09-16',6),(25,9,5,'2022-06-12',10),(26,9,6,'2022-09-17',5),(27,9,7,'2023-06-13',8),(28,10,8,'2023-09-18',7),(29,10,9,'2023-06-14',9),(30,10,10,'2024-09-19',6),(31,11,1,'2024-06-10',7),(32,11,2,'2024-09-15',8),(33,11,3,'2024-06-11',9),(34,12,4,'2023-09-16',6),(35,12,5,'2023-06-12',10),(36,12,6,'2023-09-17',3),(37,13,7,'2022-06-13',4),(38,13,8,'2022-09-18',7),(39,13,9,'2022-06-14',9),(40,14,10,'2021-09-19',6),(41,14,1,'2021-06-10',7),(42,14,2,'2021-09-15',8),(43,15,3,'2020-06-11',9),(44,15,4,'2020-09-16',6),(45,15,5,'2020-06-12',10),(46,16,6,'2019-09-17',5),(47,16,7,'2019-06-13',4),(48,16,8,'2019-09-18',7),(49,17,9,'2018-06-14',9),(50,17,10,'2018-09-19',6),(51,17,1,'2018-06-10',7),(52,18,2,'2017-09-15',8),(53,18,3,'2017-06-11',9),(54,18,4,'2017-09-16',6),(55,19,5,'2016-06-12',10),(56,19,6,'2016-09-17',2),(57,19,7,'2016-06-13',8),(58,20,8,'2015-09-18',7),(59,20,9,'2015-06-14',9),(60,20,10,'2015-09-19',6);
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
INSERT INTO `students` VALUES (1,'Andrés','Martínez',1),(2,'Beatriz','Lozano',1),(3,'Cristina','Navarro',1),(4,'Daniel','Ortega',2),(5,'Elena','Ruiz',2),(6,'Fernando','Gómez',2),(7,'Gloria','Sánchez',3),(8,'Hugo','Cástro',3),(9,'Isabel','Romero',3),(10,'Jorge','Jiménez',4),(11,'Carolina','Muñoz',4),(12,'Luis','Domínguez',4),(13,'Marta','Paredes',5),(14,'Nicolás','Reyes',5),(15,'Olga','Blanco',5),(16,'Pablo','Álvarez',6),(17,'Raqúel','Salas',6),(18,'Sergio','Delgado',6),(19,'Tamara','Velasco',7),(20,'Ulises','Gallego',7),(21,'Valeria','Peña',7),(22,'Guillermo','Quintana',8),(23,'Ximena','Fuentes',8),(24,'Yago','Montes',8),(25,'Zaira','Alonso',9),(26,'Álvaro','Medina',9),(27,'Bárbara','Pastor',9),(28,'César','Redondo',10),(29,'Diana','Silva',10),(30,'Esteban','Ramírez',10);
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

-- Dump completed on 2025-04-04  9:59:03
