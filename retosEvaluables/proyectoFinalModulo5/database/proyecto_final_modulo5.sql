-- MySQL dump 10.13  Distrib 8.0.41, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: proyecto_final_modulo5
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
-- Table structure for table `autores`
--

DROP TABLE IF EXISTS `autores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `autores` (
  `id_autor` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  `apellido` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `fecha_nacimiento` date NOT NULL,
  `fecha_defuncion` date DEFAULT NULL,
  PRIMARY KEY (`id_autor`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `autores`
--

LOCK TABLES `autores` WRITE;
/*!40000 ALTER TABLE `autores` DISABLE KEYS */;
INSERT INTO `autores` VALUES (1,'Elena','Vasquez','España','1955-03-12','2020-07-24'),(2,'Lars','Johansson','Suecia','1968-11-05',NULL),(3,'Mariko','Tanaka','Japòn','1972-09-18',NULL),(4,'Jean-Paul','Dubois','Francia','1950-07-30','2018-02-15'),(5,'Anika','Schmidt','Alemania','1982-04-22',NULL),(6,'Diego','Rivera','México','1957-12-08',NULL),(7,'Sophie','Laurent','Francia','1965-06-19','2022-03-10'),(8,'Yusuf','Al-Mansur','Marruecos','1978-10-31',NULL),(9,'Olga','Petrova','Rusia','1960-02-14',NULL),(10,'Thomas','O\'Connor','Irlanda','1985-08-27',NULL),(11,'Amina','Diop','Senegal','1973-05-09',NULL);
/*!40000 ALTER TABLE `autores` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `colecciones`
--

DROP TABLE IF EXISTS `colecciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `colecciones` (
  `id_coleccion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `id_ubicacion` int NOT NULL,
  PRIMARY KEY (`id_coleccion`),
  KEY `fk_colecciones_ubicacion_idx` (`id_ubicacion`),
  CONSTRAINT `fk_colecciones_ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `colecciones`
--

LOCK TABLES `colecciones` WRITE;
/*!40000 ALTER TABLE `colecciones` DISABLE KEYS */;
INSERT INTO `colecciones` VALUES (1,'Retrospectiva Mariko Tanaka',1),(2,'Abstracción Contemporánea',2),(3,'Nuevas Vanguardias',3),(4,'Itinerante: Minimalismo Global',4),(5,'Colección Dubois - Archivo',5),(6,'Esculturas No Exhibidas',5),(7,'Fondos Documentales',5),(8,'Arte Digital - Reserva',5),(9,'Piezas en Restauración',6),(10,'Donaciones Pendientes',6),(11,'En prestamo externo',7);
/*!40000 ALTER TABLE `colecciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `piezas`
--

DROP TABLE IF EXISTS `piezas`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `piezas` (
  `id_pieza` int NOT NULL AUTO_INCREMENT,
  `titulo` varchar(100) NOT NULL,
  `año` int NOT NULL,
  `descripcion` varchar(300) DEFAULT NULL,
  `id_autor` int NOT NULL,
  `id_coleccion` int NOT NULL,
  `id_soporte` int NOT NULL,
  `id_propietario` int NOT NULL,
  PRIMARY KEY (`id_pieza`),
  KEY `fk_autor_idx` (`id_autor`),
  KEY `fk_piezas_propietario_idx` (`id_propietario`),
  KEY `fk_piezas_soporte_idx` (`id_soporte`),
  KEY `FK_piezas_coleccion_idx` (`id_coleccion`),
  CONSTRAINT `fk_piezas_autor` FOREIGN KEY (`id_autor`) REFERENCES `autores` (`id_autor`),
  CONSTRAINT `FK_piezas_coleccion` FOREIGN KEY (`id_coleccion`) REFERENCES `colecciones` (`id_coleccion`),
  CONSTRAINT `fk_piezas_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`),
  CONSTRAINT `fk_piezas_soporte` FOREIGN KEY (`id_soporte`) REFERENCES `soportes` (`id_soporte`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `piezas`
--

LOCK TABLES `piezas` WRITE;
/*!40000 ALTER TABLE `piezas` DISABLE KEYS */;
INSERT INTO `piezas` VALUES (1,'Ecos del Silencio',2015,'Escultura en mármol blanco que representa formas orgánicas entrelazadas, 120x80x60 cm',3,1,16,1),(2,'Horizonte Fracturado',2008,'Pintura acrílica sobre lienzo, estilo abstracto con predominio de azules y grises, 200x150 cm',2,2,4,1),(3,'Memoria Líquida',2019,'Instalación con pantallas LED y sensores de movimiento, dimensiones variables',5,3,6,1),(4,'Vertigo Urbano',2012,'Fotografía digital impresa en metacrilato, edición 1/5, 100x150 cm',7,11,16,2),(5,'Raíces Aéreas',2005,'Escultura en acero corten, forma arbórea de 3 metros de altura',1,1,2,1),(6,'Dialéctica del Color',2017,'Serie de 5 grabados digitales sobre papel de algodón',10,2,16,1),(7,'Nebulosa 452',2020,'Pieza audiovisual interactiva con proyección holográfica',8,3,7,1),(8,'Siluetas del Tiempo',1999,'Conjunto de 3 figuras en bronce patinado',4,5,16,1),(9,'Códigos Ocultos',2014,'Pintura mixta sobre tabla, incorpora elementos de collage',6,11,16,3),(10,'Resonancia',2011,'Estructura modular en aluminio y vidrio, 250x300 cm',9,2,4,1),(11,'Arquitectura Efímera',2018,'Instalación con materiales biodegradables, cambia con el tiempo',3,1,16,1),(12,'Cartografía Interior',2003,'Serie de 12 dibujos en tinta sobre papel de arroz',2,6,13,1),(13,'Fronteras Invisibles',2016,'Videoarte en loop de 15 minutos, edición 2/3',5,7,11,1),(14,'Materia Prima',2009,'Ensamblaje con objetos encontrados y resina epoxi',7,11,16,6),(15,'Luz Residual',2021,'Fotoluminiscencia sobre panel de cerámica, 80x120 cm',10,9,14,1),(16,'Vértice Cromático',2013,'Pintura óleo sobre lienzo con efectos texturados, 180x120 cm',11,1,16,1),(17,'Equilibrio Precario',2018,'Escultura móvil en acero inoxidable y madera de roble',5,2,5,1),(18,'Ecosistema Digital',2022,'Instalación interactiva con realidad aumentada',8,3,6,1),(19,'Huellas Ancestrales',2007,'Serie de 8 litografías inspiradas en arte rupestre',4,11,16,8),(20,'Transparencias',2015,'Escultura en vidrio soplado y estructura metálica',9,1,2,1),(21,'Caos Ordenado',2010,'Pintura abstracta en acuarela sobre papel, 150x100 cm',2,5,12,1),(22,'Refracciones',2019,'Instalación lumínica con prismas de cristal',10,11,16,7),(23,'Metamorfosis Urbana',2017,'Collage fotográfico sobre madera, 200x150 cm',7,7,11,1),(24,'Geometría Emocional',2014,'Escultura en granito negro, formas angulares',1,8,12,1),(25,'Abstracción Sonora',2020,'Instalación sonora con 12 canales de audio',3,11,16,5),(26,'Vestigios',2001,'Conjunto de 5 piezas cerámicas con improntas',6,10,15,1),(27,'Fluir Constante',2016,'Pintura al óleo con técnica dripping, 180x180 cm',11,2,4,1),(28,'Código Genético',2018,'Escultura en resina translícida con inclusiones',5,11,16,10),(29,'Memoria Colectiva',2012,'Instalación con 200 objetos cotidianos suspendidos',9,4,9,1),(30,'Horizonte Artificial',2023,'Proyección digital 4K con espejos rotativos',10,1,3,1);
/*!40000 ALTER TABLE `piezas` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `prestamos`
--

DROP TABLE IF EXISTS `prestamos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `prestamos` (
  `id_prestamo` int NOT NULL AUTO_INCREMENT,
  `fecha_inicio` date NOT NULL,
  `fecha_fin` date NOT NULL,
  `activo` tinyint DEFAULT NULL,
  `id_pieza` int NOT NULL,
  `id_propietario` int NOT NULL,
  PRIMARY KEY (`id_prestamo`),
  KEY `fk_prestamo_pieza_idx` (`id_pieza`),
  KEY `fk_prestamo_propietario_idx` (`id_propietario`),
  CONSTRAINT `fk_prestamo_pieza` FOREIGN KEY (`id_pieza`) REFERENCES `piezas` (`id_pieza`),
  CONSTRAINT `fk_prestamo_propietario` FOREIGN KEY (`id_propietario`) REFERENCES `propietarios` (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `prestamos`
--

LOCK TABLES `prestamos` WRITE;
/*!40000 ALTER TABLE `prestamos` DISABLE KEYS */;
INSERT INTO `prestamos` VALUES (1,'2023-11-01','2024-05-01',1,4,2),(2,'2023-11-10','2024-05-10',1,9,3),(3,'2023-11-15','2024-05-15',1,19,8),(4,'2023-11-20','2024-05-20',1,25,5),(5,'2023-12-01','2024-06-01',1,28,10),(6,'2023-12-05','2024-06-05',1,14,6),(7,'2023-12-10','2024-06-10',1,22,7),(8,'2023-01-15','2023-07-15',0,5,4),(9,'2022-09-10','2023-03-10',0,12,3),(10,'2023-03-01','2023-09-01',0,15,6),(11,'2021-11-20','2022-05-20',0,8,5),(12,'2023-02-15','2023-08-15',0,7,8),(13,'2022-06-10','2022-12-10',0,3,2),(14,'2023-04-05','2023-10-05',0,2,10),(15,'2021-05-30','2021-11-30',0,1,8),(16,'2022-03-15','2022-09-15',0,10,4),(17,'2023-05-20','2023-11-20',0,11,7),(18,'2020-10-10','2021-04-10',0,6,9),(19,'2023-01-10','2023-07-10',0,13,5),(20,'2022-12-01','2023-06-01',0,16,10),(21,'2021-08-25','2022-02-25',0,17,2),(22,'2023-06-15','2023-12-15',0,18,8),(23,'2019-04-01','2019-10-01',0,20,3),(24,'2020-02-15','2020-08-15',0,21,5),(25,'2023-07-01','2023-12-31',0,23,10),(26,'2022-01-10','2022-07-10',0,24,2),(27,'2021-09-05','2022-03-05',0,26,4),(28,'2023-08-10','2024-02-10',0,27,7),(29,'2020-12-20','2021-06-20',0,29,9),(30,'2023-09-01','2024-03-01',0,30,5);
/*!40000 ALTER TABLE `prestamos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `propietarios`
--

DROP TABLE IF EXISTS `propietarios`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `propietarios` (
  `id_propietario` int NOT NULL AUTO_INCREMENT,
  `propiedad` enum('museo/institucion','particular') NOT NULL,
  `nombre` varchar(60) NOT NULL,
  `nombre_contacto` varchar(45) NOT NULL,
  `apellido_contacto` varchar(45) NOT NULL,
  `email_contacto` varchar(45) NOT NULL,
  `telefono_contacto` varchar(45) NOT NULL,
  `calle` varchar(45) NOT NULL,
  `ciudad` varchar(45) NOT NULL,
  `pais` varchar(45) NOT NULL,
  `codigo_postal` int NOT NULL,
  PRIMARY KEY (`id_propietario`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `propietarios`
--

LOCK TABLES `propietarios` WRITE;
/*!40000 ALTER TABLE `propietarios` DISABLE KEYS */;
INSERT INTO `propietarios` VALUES (1,'museo/institucion','Museo de Arte Contemporáneo Principal','Javier','de la Torre','laura.gonzalez@museoprincipal.com','+34934567890','Calle Principal','Barcelona','España',8001),(2,'museo/institucion','Museo Nacional de Arte Moderno','Carlos','Martínez','carlos.martinez@museoarte.com','+34915678901','Paseo del Arte','Madrid','España',28012),(3,'museo/institucion','Galería ContemporÃ¡nea BCN','Anna','Rovira','anna.rovira@galeriacontemporanea.es','+34932109876','Rambla Cataluña','Barcelona','España',8007),(4,'particular','Colección Privada Goldman','Emma','Goldman','emma.goldman@mail.com','+34654321098','Calle Libertad','Valencia','España',46002),(5,'museo/institucion','Centro Cultural Andaluz','Miguel','HernÃ¡ndez','miguel.hernandez@centrocultural.com','+34914455667','Avenida Cultura','Sevilla','España',41001),(6,'museo/institucion','Fundación Artística Vasca','Ainhoa','Etxebarria','ainhoa.etxebarria@fundacionartistica.org','+34963852741','Calle Creatividad','Bilbao','España',48001),(7,'particular','Colección Privada Monteiro','Carlos','Monteiro','carlos.monteiro@mail.com','+351687654321','Rua das Artes','Lisboa','Portugal',1200),(8,'museo/institucion','Museo Europeo de Arte Moderno','Élodie','Dupont','elodie.dupont@museoeuropeo.eu','+331234567','Rue de l\'Art','París','Francia',75008),(9,'particular','Colección Privada Nakamura','Yuki','Nakamura','nakamura@mail.com','+8134567890','Shinjuku','Tokio','Japón',160002),(10,'museo/institucion','Instituto Mexicano de Arte Moderno','Fernanda','López','fernanda.lopez@institutoarte.com.mx','+5255123456','Paseo Reforma','Ciudad de México','México',6500);
/*!40000 ALTER TABLE `propietarios` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `soportes`
--

DROP TABLE IF EXISTS `soportes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `soportes` (
  `id_soporte` int NOT NULL AUTO_INCREMENT,
  `tipo` enum('expositor','vitrina','muro','estantería','armario','externo') NOT NULL,
  `id_ubicacion` int NOT NULL,
  PRIMARY KEY (`id_soporte`),
  KEY `FK_soportes_ubicacion_idx` (`id_ubicacion`),
  CONSTRAINT `FK_soportes_ubicacion` FOREIGN KEY (`id_ubicacion`) REFERENCES `ubicaciones` (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `soportes`
--

LOCK TABLES `soportes` WRITE;
/*!40000 ALTER TABLE `soportes` DISABLE KEYS */;
INSERT INTO `soportes` VALUES (1,'vitrina',1),(2,'expositor',1),(3,'muro',1),(4,'vitrina',2),(5,'muro',2),(6,'expositor',3),(7,'muro',3),(8,'vitrina',4),(9,'expositor',4),(10,'muro',4),(11,'estantería',6),(12,'armario',5),(13,'estantería',5),(14,'armario',6),(15,'estantería',6),(16,'externo',7);
/*!40000 ALTER TABLE `soportes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `ubicaciones`
--

DROP TABLE IF EXISTS `ubicaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `ubicaciones` (
  `id_ubicacion` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(45) NOT NULL,
  PRIMARY KEY (`id_ubicacion`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `ubicaciones`
--

LOCK TABLES `ubicaciones` WRITE;
/*!40000 ALTER TABLE `ubicaciones` DISABLE KEYS */;
INSERT INTO `ubicaciones` VALUES (1,'sala 1'),(2,'sala 2'),(3,'sala 3'),(4,'patio'),(5,'almacén sótano'),(6,'almacén-taller ático'),(7,'prestamo');
/*!40000 ALTER TABLE `ubicaciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-04-24 22:31:23
