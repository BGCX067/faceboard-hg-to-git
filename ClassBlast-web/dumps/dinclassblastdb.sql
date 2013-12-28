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
-- Dumping data for table `apunte`
--

USE classblastdb;

LOCK TABLES `apunte` WRITE;
/*!40000 ALTER TABLE `apunte` DISABLE KEYS */;
/*!40000 ALTER TABLE `apunte` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `archivo`
--

LOCK TABLES `archivo` WRITE;
/*!40000 ALTER TABLE `archivo` DISABLE KEYS */;
/*!40000 ALTER TABLE `archivo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
INSERT INTO `comentario` values (NULL,33,'sss','2013-12-28 07:08:04',8,1),(NULL,1,'mi comentario 3','2013-12-28 07:56:23',8,1),(NULL,1,'Esto hay que implementarlo bien','2013-12-28 08:36:08',8,6),(NULL,2,'qyqy','2013-12-28 08:44:53',8,7);
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `conversacion`
--

LOCK TABLES `conversacion` WRITE;
/*!40000 ALTER TABLE `conversacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `conversacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `cuaderno`
--

LOCK TABLES `cuaderno` WRITE;
/*!40000 ALTER TABLE `cuaderno` DISABLE KEYS */;
/*!40000 ALTER TABLE `cuaderno` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grupo`
--

LOCK TABLES `grupo` WRITE;
/*!40000 ALTER TABLE `grupo` DISABLE KEYS */;
INSERT INTO `grupo` values (NULL,1,2,1,'2013-12-28 06:20:18','Grupo para hacer pruebas','Grupo de prueba 1','Por empezar'),(NULL,1,1,2,'2013-12-28 10:25:15','grupo2','grupo2','Por empezar');
/*!40000 ALTER TABLE `grupo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `grupo_mesaredonda`
--

LOCK TABLES `grupo_mesaredonda` WRITE;
/*!40000 ALTER TABLE `grupo_mesaredonda` DISABLE KEYS */;
/*!40000 ALTER TABLE `grupo_mesaredonda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mensaje`
--

LOCK TABLES `mensaje` WRITE;
/*!40000 ALTER TABLE `mensaje` DISABLE KEYS */;
/*!40000 ALTER TABLE `mensaje` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `mesaredonda`
--

LOCK TABLES `mesaredonda` WRITE;
/*!40000 ALTER TABLE `mesaredonda` DISABLE KEYS */;
/*!40000 ALTER TABLE `mesaredonda` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `notificacion`
--

LOCK TABLES `notificacion` WRITE;
/*!40000 ALTER TABLE `notificacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `notificacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `parche`
--

LOCK TABLES `parche` WRITE;
/*!40000 ALTER TABLE `parche` DISABLE KEYS */;
INSERT INTO `parche` values (NULL,1,'descripción del parche 1','parche 1','Abierto','2013-12-28 06:23:25'),(NULL,1,'descripción del parche 2','parche 2','Cerrado','2013-12-28 09:33:32'),(NULL,1,'descripción del parche 3','parche3','Abierto','2013-12-28 09:34:00');
/*!40000 ALTER TABLE `parche` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `participacion`
--

LOCK TABLES `participacion` WRITE;
/*!40000 ALTER TABLE `participacion` DISABLE KEYS */;
/*!40000 ALTER TABLE `participacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `publicacion`
--

LOCK TABLES `publicacion` WRITE;
/*!40000 ALTER TABLE `publicacion` DISABLE KEYS */;
INSERT INTO `publicacion` values (NULL,9,NULL,1,'publicación 1 lista para mostrar y ahora editada :)','2013-12-28 06:20:47',8),(NULL,1,NULL,NULL,'w','2013-12-28 06:29:19',8),(NULL,0,NULL,1,'Mi segunda publicación','2013-12-28 08:34:05',8),(NULL,0,NULL,1,'Mi tercera publicación','2013-12-28 08:34:15',8),(NULL,0,NULL,1,'Mi cuarta publicación','2013-12-28 08:34:26',8),(NULL,0,NULL,1,'Esta es una publicación que tiene mucho texto. Por favor tener en cuenta que debe haber el espacio suficiente para albergarlo completamente sin que ocurra ningún tipo de desbordamiento.','2013-12-28 08:35:37',8),(NULL,6,1,NULL,'wwwx','2013-12-28 08:44:31',8);
/*!40000 ALTER TABLE `publicacion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `rol`
--

LOCK TABLES `rol` WRITE;
/*!40000 ALTER TABLE `rol` DISABLE KEYS */;
INSERT INTO `rol` values (NULL,0,NULL,NULL,NULL,8,3),(NULL,0,NULL,1,NULL,8,4),(NULL,0,1,NULL,NULL,8,8),(NULL,0,2,NULL,NULL,8,8),(NULL,0,3,NULL,NULL,8,8),(NULL,0,NULL,2,NULL,8,4),(NULL,0,NULL,NULL,NULL,9,3);
/*!40000 ALTER TABLE `rol` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `seccion`
--

LOCK TABLES `seccion` WRITE;
/*!40000 ALTER TABLE `seccion` DISABLE KEYS */;
INSERT INTO `seccion` values (NULL,1,NULL,1,'seccion-linked-to-group'),(NULL,1,NULL,2,'seccion-linked-to-group');
/*!40000 ALTER TABLE `seccion` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `solicitud`
--

LOCK TABLES `solicitud` WRITE;
/*!40000 ALTER TABLE `solicitud` DISABLE KEYS */;
/*!40000 ALTER TABLE `solicitud` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tag`
--

LOCK TABLES `tag` WRITE;
/*!40000 ALTER TABLE `tag` DISABLE KEYS */;
INSERT INTO `tag` values (NULL,0,1,NULL,'miparche'),(NULL,0,2,NULL,'parche2'),(NULL,0,3,NULL,'parche');
/*!40000 ALTER TABLE `tag` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tarea`
--

LOCK TABLES `tarea` WRITE;
/*!40000 ALTER TABLE `tarea` DISABLE KEYS */;
/*!40000 ALTER TABLE `tarea` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `tema`
--

LOCK TABLES `tema` WRITE;
/*!40000 ALTER TABLE `tema` DISABLE KEYS */;
/*!40000 ALTER TABLE `tema` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` values (NULL,5,'alxvilbol@gmail.com','c08ac56ae1145566f2ce54cbbea35fa3','Alexander','Villamil','root_user','2013-12-28 06:18:41'),(NULL,0,'davellaneda@gmail.com','c08ac56ae1145566f2ce54cbbea35fa3','Diego','Avellaneda','root2','2013-12-28 11:16:02');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_community_list`
--

LOCK TABLES `user_community_list` WRITE;
/*!40000 ALTER TABLE `user_community_list` DISABLE KEYS */;
INSERT INTO `user_community_list` values (1,1),(1,2),(1,3);
/*!40000 ALTER TABLE `user_community_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_group_list`
--

LOCK TABLES `user_group_list` WRITE;
/*!40000 ALTER TABLE `user_group_list` DISABLE KEYS */;
INSERT INTO `user_group_list` values (1,1),(1,2);
/*!40000 ALTER TABLE `user_group_list` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `user_meeting_list`
--

LOCK TABLES `user_meeting_list` WRITE;
/*!40000 ALTER TABLE `user_meeting_list` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_meeting_list` ENABLE KEYS */;
UNLOCK TABLES;

-- Dump completed on 2013-12-28 15:02:18
