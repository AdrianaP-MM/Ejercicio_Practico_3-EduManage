-- MariaDB dump 10.19  Distrib 10.4.28-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: db_edumanage
-- ------------------------------------------------------
-- Server version	10.4.28-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `tb_alumnos`
--

DROP TABLE IF EXISTS `tb_alumnos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_alumnos` (
  `id_alumno` varchar(36) NOT NULL,
  `carnet_alumno` varchar(10) NOT NULL,
  `nombre_alumno` varchar(50) NOT NULL,
  `apellido_alumno` varchar(50) NOT NULL,
  `edad_alumno` int(11) NOT NULL,
  PRIMARY KEY (`id_alumno`),
  UNIQUE KEY `unique_carnet` (`carnet_alumno`),
  CONSTRAINT `check_edad` CHECK (`edad_alumno` > 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_alumnos`
--

LOCK TABLES `tb_alumnos` WRITE;
/*!40000 ALTER TABLE `tb_alumnos` DISABLE KEYS */;
INSERT INTO `tb_alumnos` VALUES ('69a841ff-d69f-11ee-aff8-a8a159550ae4','1234567890','Adriana Paola','Mejia Mendez',18),('69a88dca-d69f-11ee-aff8-a8a159550ae4','123','Juan','Pérez',20),('69a8ed78-d69f-11ee-aff8-a8a159550ae4','456','María','González',19),('69a92225-d69f-11ee-aff8-a8a159550ae4','789','Carlos','Martínez',18),('69a95dc3-d69f-11ee-aff8-a8a159550ae4','987','Laura','López',17),('69a99c79-d69f-11ee-aff8-a8a159550ae4','654','Pedro','Sánchez',20),('69a9e4c5-d69f-11ee-aff8-a8a159550ae4','321','Ana','Ramírez',20),('69aa1d0d-d69f-11ee-aff8-a8a159550ae4','147','Diego','Hernández',16),('69ad705e-d69f-11ee-aff8-a8a159550ae4','258','Sofía','Díaz',15),('69adb198-d69f-11ee-aff8-a8a159550ae4','369','Javier','Torres',17),('69adea8a-d69f-11ee-aff8-a8a159550ae4','963','Elena','Fernández',19),('69ae1b17-d69f-11ee-aff8-a8a159550ae4','852','Miguel','Ruiz',18),('69ae4b6b-d69f-11ee-aff8-a8a159550ae4','741','Lucía','García',19),('69ae7ba9-d69f-11ee-aff8-a8a159550ae4','159','Pablo','Moreno',20),('69aeb38a-d69f-11ee-aff8-a8a159550ae4','753','Carmen','Álvarez',15);
/*!40000 ALTER TABLE `tb_alumnos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_calificaciones`
--

DROP TABLE IF EXISTS `tb_calificaciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_calificaciones` (
  `id_calificacion` varchar(36) NOT NULL,
  `id_inscripcion` varchar(36) DEFAULT NULL,
  `calificacion_final` decimal(5,2) DEFAULT NULL,
  `fecha_calificacion` date DEFAULT curdate(),
  PRIMARY KEY (`id_calificacion`),
  KEY `fk_inscripcion_calificacion` (`id_inscripcion`),
  CONSTRAINT `fk_inscripcion_calificacion` FOREIGN KEY (`id_inscripcion`) REFERENCES `tb_inscripciones` (`id_inscripcion`),
  CONSTRAINT `check_calificacion_final` CHECK (`calificacion_final` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_calificaciones`
--

LOCK TABLES `tb_calificaciones` WRITE;
/*!40000 ALTER TABLE `tb_calificaciones` DISABLE KEYS */;
INSERT INTO `tb_calificaciones` VALUES ('26a1644d-d6a1-11ee-aff8-a8a159550ae4',NULL,8.00,'2023-03-03'),('26a1e705-d6a1-11ee-aff8-a8a159550ae4',NULL,6.00,'2023-03-03'),('26a22933-d6a1-11ee-aff8-a8a159550ae4',NULL,5.00,'2023-03-03'),('26a2617c-d6a1-11ee-aff8-a8a159550ae4',NULL,7.00,'2023-03-03'),('26a29521-d6a1-11ee-aff8-a8a159550ae4',NULL,8.00,'2023-03-03'),('26a2cef1-d6a1-11ee-aff8-a8a159550ae4',NULL,6.00,'2023-03-03'),('26a30a9f-d6a1-11ee-aff8-a8a159550ae4',NULL,10.00,'2023-03-03'),('26a34418-d6a1-11ee-aff8-a8a159550ae4',NULL,4.00,'2023-03-03'),('26a37ec4-d6a1-11ee-aff8-a8a159550ae4',NULL,9.00,'2023-03-03'),('26a3b5b8-d6a1-11ee-aff8-a8a159550ae4',NULL,7.00,'2023-03-03'),('26a41bae-d6a1-11ee-aff8-a8a159550ae4',NULL,6.00,'2023-03-03'),('26a45476-d6a1-11ee-aff8-a8a159550ae4',NULL,7.00,'2023-03-03'),('26a48b50-d6a1-11ee-aff8-a8a159550ae4',NULL,4.00,'2023-03-03'),('26a4c0bb-d6a1-11ee-aff8-a8a159550ae4',NULL,7.00,'2023-03-03'),('bc1062f2-d6a0-11ee-aff8-a8a159550ae4',NULL,9.00,'2023-03-03');
/*!40000 ALTER TABLE `tb_calificaciones` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_inscripciones`
--

DROP TABLE IF EXISTS `tb_inscripciones`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_inscripciones` (
  `id_inscripcion` varchar(36) NOT NULL,
  `id_alumno` varchar(36) DEFAULT NULL,
  `id_materia` varchar(36) DEFAULT NULL,
  `fecha_inscripcion` date NOT NULL DEFAULT curdate(),
  `estado` enum('Activo','Inactivo') NOT NULL,
  PRIMARY KEY (`id_inscripcion`),
  KEY `fk_alumnos_inscripciones` (`id_alumno`),
  KEY `fk_materia_inscripciones` (`id_materia`),
  CONSTRAINT `fk_alumnos_inscripciones` FOREIGN KEY (`id_alumno`) REFERENCES `tb_alumnos` (`id_alumno`),
  CONSTRAINT `fk_materia_inscripciones` FOREIGN KEY (`id_materia`) REFERENCES `tb_materias` (`id_materia`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_inscripciones`
--

LOCK TABLES `tb_inscripciones` WRITE;
/*!40000 ALTER TABLE `tb_inscripciones` DISABLE KEYS */;
INSERT INTO `tb_inscripciones` VALUES ('7a51e776-d69f-11ee-aff8-a8a159550ae4',NULL,'7481a7f9-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a52432f-d69f-11ee-aff8-a8a159550ae4',NULL,'74814c93-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a552dea-d69f-11ee-aff8-a8a159550ae4',NULL,'748208aa-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo'),('7a5581b8-d69f-11ee-aff8-a8a159550ae4',NULL,'748251cd-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a55cae6-d69f-11ee-aff8-a8a159550ae4',NULL,'74829dfb-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a560cb1-d69f-11ee-aff8-a8a159550ae4',NULL,'7482e809-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a565c4c-d69f-11ee-aff8-a8a159550ae4',NULL,'74832d01-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo'),('7a569f8c-d69f-11ee-aff8-a8a159550ae4',NULL,'74836bb1-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo'),('7a56e5c0-d69f-11ee-aff8-a8a159550ae4',NULL,'7483a9c8-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a572ea1-d69f-11ee-aff8-a8a159550ae4',NULL,'7483e813-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a5770d2-d69f-11ee-aff8-a8a159550ae4',NULL,'74842570-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo'),('7a57c939-d69f-11ee-aff8-a8a159550ae4',NULL,'74846340-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a580dd6-d69f-11ee-aff8-a8a159550ae4',NULL,'7484a0aa-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo'),('7a5850d9-d69f-11ee-aff8-a8a159550ae4',NULL,'7484db62-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Activo'),('7a588b91-d69f-11ee-aff8-a8a159550ae4',NULL,'74851d23-d69f-11ee-aff8-a8a159550ae4','2023-03-03','Inactivo');
/*!40000 ALTER TABLE `tb_inscripciones` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_general_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`root`@`localhost`*/ /*!50003 TRIGGER actualizar_cupos_materia
BEFORE INSERT ON tb_inscripciones
FOR EACH ROW
BEGIN
    UPDATE tb_materias
    SET cupos_materia = cupos_materia - 1
    WHERE id_materia = NEW.id_materia;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `tb_materias`
--

DROP TABLE IF EXISTS `tb_materias`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_materias` (
  `id_materia` varchar(36) NOT NULL,
  `nombre_materia` varchar(100) NOT NULL,
  `grupo_materia` int(11) NOT NULL,
  `id_profesor` varchar(36) DEFAULT NULL,
  `cupos_materia` int(11) NOT NULL,
  PRIMARY KEY (`id_materia`),
  UNIQUE KEY `unique_nombre_materia` (`nombre_materia`),
  KEY `fk_profesor_materia` (`id_profesor`),
  CONSTRAINT `fk_profesor_materia` FOREIGN KEY (`id_profesor`) REFERENCES `tb_profesores` (`id_profesor`),
  CONSTRAINT `check_grupo` CHECK (`grupo_materia` > 0),
  CONSTRAINT `check_cupos` CHECK (`cupos_materia` >= 0)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_materias`
--

LOCK TABLES `tb_materias` WRITE;
/*!40000 ALTER TABLE `tb_materias` DISABLE KEYS */;
INSERT INTO `tb_materias` VALUES ('74814c93-d69f-11ee-aff8-a8a159550ae4','Matematicas',1,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',4),('7481a7f9-d69f-11ee-aff8-a8a159550ae4','Lenguaje',2,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',9),('748208aa-d69f-11ee-aff8-a8a159550ae4','Ciencias',3,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',7),('748251cd-d69f-11ee-aff8-a8a159550ae4','Sociales',4,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',8),('74829dfb-d69f-11ee-aff8-a8a159550ae4','Ingles',5,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',69),('7482e809-d69f-11ee-aff8-a8a159550ae4','Quimica',6,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',19),('74832d01-d69f-11ee-aff8-a8a159550ae4','Algebra',7,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',5),('74836bb1-d69f-11ee-aff8-a8a159550ae4','Biologia',8,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',39),('7483a9c8-d69f-11ee-aff8-a8a159550ae4','Espanol',9,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',29),('7483e813-d69f-11ee-aff8-a8a159550ae4','Psicologia',10,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',34),('74842570-d69f-11ee-aff8-a8a159550ae4','Pastoral',11,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',19),('74846340-d69f-11ee-aff8-a8a159550ae4','Artes plasticas',12,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',39),('7484a0aa-d69f-11ee-aff8-a8a159550ae4','Artistica',13,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',79),('7484db62-d69f-11ee-aff8-a8a159550ae4','Caligrafia',14,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',59),('74851d23-d69f-11ee-aff8-a8a159550ae4','Ortografia',15,'6e3cd70b-d69f-11ee-aff8-a8a159550ae4',39);
/*!40000 ALTER TABLE `tb_materias` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tb_profesores`
--

DROP TABLE IF EXISTS `tb_profesores`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tb_profesores` (
  `id_profesor` varchar(36) NOT NULL,
  `nombre_profesor` varchar(100) NOT NULL,
  `apellido_profesor` varchar(100) NOT NULL,
  `correo_electronico_profesor` varchar(100) NOT NULL,
  PRIMARY KEY (`id_profesor`),
  UNIQUE KEY `unique_correo` (`correo_electronico_profesor`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tb_profesores`
--

LOCK TABLES `tb_profesores` WRITE;
/*!40000 ALTER TABLE `tb_profesores` DISABLE KEYS */;
INSERT INTO `tb_profesores` VALUES ('6e3cd70b-d69f-11ee-aff8-a8a159550ae4','Jackeline','Melanie','melanie@gmail.com'),('6e3d28f7-d69f-11ee-aff8-a8a159550ae4','Juan','López','juan.lopez@gmail.com'),('6e3d6843-d69f-11ee-aff8-a8a159550ae4','Maria','Gonzalez','maria.gonzalez@gmail.com'),('6e3da919-d69f-11ee-aff8-a8a159550ae4','Carlos','Martinez','carlos.martinez@gmail.com'),('6e3e0f09-d69f-11ee-aff8-a8a159550ae4','Laura','Sanchez','laura.sanchez@gmail.com'),('6e3e83e3-d69f-11ee-aff8-a8a159550ae4','Pedro','Ramirez','pedro.ramirez@gmail.com'),('6e3ee46e-d69f-11ee-aff8-a8a159550ae4','Ana','Hernandez','ana.hernandez@gmail.com'),('6e3f3813-d69f-11ee-aff8-a8a159550ae4','Diego','Diaz','diego.diaz@gmail.com'),('6e3f7c36-d69f-11ee-aff8-a8a159550ae4','Sofía','Torres','sofia.torres@gmail.com'),('6e3fbcdd-d69f-11ee-aff8-a8a159550ae4','Javier','Fernandez','javier.fernandez@gmail.com'),('6e40105c-d69f-11ee-aff8-a8a159550ae4','Elena','Ruiz','elena.ruiz@gmail.com'),('6e406f23-d69f-11ee-aff8-a8a159550ae4','Miguel','Garcia','miguel.garcia@gmail.com'),('6e40b3ab-d69f-11ee-aff8-a8a159550ae4','Lucia','Moreno','lucia.moreno@gmail.com'),('6e40f243-d69f-11ee-aff8-a8a159550ae4','Pablo','Alvarez','pablo.alvarez@gmail.com'),('6e441137-d69f-11ee-aff8-a8a159550ae4','Carmen','Martin','carmen.martin@gmail.com');
/*!40000 ALTER TABLE `tb_profesores` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-02-28 19:43:46
