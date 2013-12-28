-- MySQL dump 10.13  Distrib 5.5.34, for debian-linux-gnu (x86_64)
--
-- Host: localhost    Database: classblastdb
-- ------------------------------------------------------
-- Server version	5.5.34-0ubuntu0.12.04.1

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
-- Table structure for table `carrera`
--

USE classblastdb;

DROP TABLE IF EXISTS `carrera`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `career_name` varchar(255) NOT NULL,
  `faculty_id` bigint(20) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK210AD176322C8D96` (`faculty_id`),
  CONSTRAINT `FK210AD176322C8D96` FOREIGN KEY (`faculty_id`) REFERENCES `facultad` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera`
--

LOCK TABLES `carrera` WRITE;
/*!40000 ALTER TABLE `carrera` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `carrera_course_list`
--

DROP TABLE IF EXISTS `carrera_course_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `carrera_course_list` (
  `carrera_id` bigint(20) NOT NULL,
  `curso_id` bigint(20) NOT NULL,
  PRIMARY KEY (`carrera_id`,`curso_id`),
  KEY `FKA0B410F9E0F65C12` (`curso_id`),
  KEY `FKA0B410F98066DFD2` (`carrera_id`),
  CONSTRAINT `FKA0B410F98066DFD2` FOREIGN KEY (`carrera_id`) REFERENCES `carrera` (`id`),
  CONSTRAINT `FKA0B410F9E0F65C12` FOREIGN KEY (`curso_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `carrera_course_list`
--

LOCK TABLES `carrera_course_list` WRITE;
/*!40000 ALTER TABLE `carrera_course_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `carrera_course_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `course_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (1,0,'Ingeniería de software 2'),(2,0,'Teoría de la computación'),(3,0,'Fundamentos de matemáticas'),(4,0,'Sistemas inteligentes');
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_facultad`
--

DROP TABLE IF EXISTS `curso_facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_facultad` (
  `curso_faculty_list_id` bigint(20) DEFAULT NULL,
  `facultad_id` bigint(20) DEFAULT NULL,
  KEY `FKBA43CFDB5DBBD052` (`curso_faculty_list_id`),
  KEY `FKBA43CFDB66B3FBE2` (`facultad_id`),
  CONSTRAINT `FKBA43CFDB66B3FBE2` FOREIGN KEY (`facultad_id`) REFERENCES `facultad` (`id`),
  CONSTRAINT `FKBA43CFDB5DBBD052` FOREIGN KEY (`curso_faculty_list_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_facultad`
--

LOCK TABLES `curso_facultad` WRITE;
/*!40000 ALTER TABLE `curso_facultad` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso_semestre`
--

DROP TABLE IF EXISTS `curso_semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `curso_semestre` (
  `curso_semester_list_id` bigint(20) DEFAULT NULL,
  `semestre_id` bigint(20) DEFAULT NULL,
  KEY `FKE47E3301329EC20C` (`curso_semester_list_id`),
  KEY `FKE47E3301B1866222` (`semestre_id`),
  CONSTRAINT `FKE47E3301B1866222` FOREIGN KEY (`semestre_id`) REFERENCES `semestre` (`id`),
  CONSTRAINT `FKE47E3301329EC20C` FOREIGN KEY (`curso_semester_list_id`) REFERENCES `curso` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso_semestre`
--

LOCK TABLES `curso_semestre` WRITE;
/*!40000 ALTER TABLE `curso_semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `curso_semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `facultad`
--

DROP TABLE IF EXISTS `facultad`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `facultad` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `faculty_name` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `facultad`
--

LOCK TABLES `facultad` WRITE;
/*!40000 ALTER TABLE `facultad` DISABLE KEYS */;
/*!40000 ALTER TABLE `facultad` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegio`
--

DROP TABLE IF EXISTS `privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegio` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `privilege_description` varchar(255) NOT NULL,
  `privilege_value` bit(1) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio`
--

LOCK TABLES `privilegio` WRITE;
/*!40000 ALTER TABLE `privilegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `privilegio_rol`
--

DROP TABLE IF EXISTS `privilegio_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `privilegio_rol` (
  `privilegio_rol_list_id` bigint(20) DEFAULT NULL,
  `rol_id` bigint(20) DEFAULT NULL,
  KEY `FK8D950C6AF8750132` (`rol_id`),
  KEY `FK8D950C6A5E7B4509` (`privilegio_rol_list_id`),
  CONSTRAINT `FK8D950C6A5E7B4509` FOREIGN KEY (`privilegio_rol_list_id`) REFERENCES `privilegio` (`id`),
  CONSTRAINT `FK8D950C6AF8750132` FOREIGN KEY (`rol_id`) REFERENCES `rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `privilegio_rol`
--

LOCK TABLES `privilegio_rol` WRITE;
/*!40000 ALTER TABLE `privilegio_rol` DISABLE KEYS */;
/*!40000 ALTER TABLE `privilegio_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semestre`
--

DROP TABLE IF EXISTS `semestre`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semestre` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `period` int(11) NOT NULL,
  `year` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semestre`
--

LOCK TABLES `semestre` WRITE;
/*!40000 ALTER TABLE `semestre` DISABLE KEYS */;
/*!40000 ALTER TABLE `semestre` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_rol`
--

DROP TABLE IF EXISTS `tipo_rol`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_rol` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `version` bigint(20) NOT NULL,
  `rol_description` varchar(255) NOT NULL,
  `rol_type` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_rol`
--

LOCK TABLES `tipo_rol` WRITE;
/*!40000 ALTER TABLE `tipo_rol` DISABLE KEYS */;
INSERT INTO `tipo_rol` VALUES (1,0,'Administrador de sitio','Administrador'),(2,0,'docente','Docente'),(3,0,'estudiante','Estudiante'),(4,0,'Administrador de grupo','AdministradorGrupo'),(5,0,'Monitor de grupo','MonitorGrupo'),(6,0,'Estudiante de grupo','EstudianteGrupo'),(7,0,'Asistente de grupo','AsistenteGrupo'),(8,0,'Administrador de parche','AdministradorParche'),(9,0,'Monitor de parche','MonitorParche'),(10,0,'Estudiante de parche','EstudianteParche'),(11,0,'Asistente de parche','AsistenteParche'),(12,0,'Creador de mesa','CreadorMesa'),(13,0,'Participante de mesa','ParticipanteMesa');
/*!40000 ALTER TABLE `tipo_rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tipo_rol_privilegio`
--

DROP TABLE IF EXISTS `tipo_rol_privilegio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tipo_rol_privilegio` (
  `tipo_rol_privilege_list_id` bigint(20) DEFAULT NULL,
  `privilegio_id` bigint(20) DEFAULT NULL,
  KEY `FK5ECE6135F40FEF66` (`tipo_rol_privilege_list_id`),
  KEY `FK5ECE6135AEAE82A2` (`privilegio_id`),
  CONSTRAINT `FK5ECE6135AEAE82A2` FOREIGN KEY (`privilegio_id`) REFERENCES `privilegio` (`id`),
  CONSTRAINT `FK5ECE6135F40FEF66` FOREIGN KEY (`tipo_rol_privilege_list_id`) REFERENCES `tipo_rol` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tipo_rol_privilegio`
--

LOCK TABLES `tipo_rol_privilegio` WRITE;
/*!40000 ALTER TABLE `tipo_rol_privilegio` DISABLE KEYS */;
/*!40000 ALTER TABLE `tipo_rol_privilegio` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-12-28 15:02:54
