-- MySQL dump 10.13  Distrib 9.1.0, for Win64 (x86_64)
--
-- Host: localhost    Database: bd_desarrollo
-- ------------------------------------------------------
-- Server version	9.1.0

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `cuit` varchar(20) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES (1,'Juan Perez','20234567891','juan@ejemplo.com','Calle Falsa 123',-34.603722,-58.381592),(2,'María Gomez','20123456782','maria@ejemplo.com','Av. Siempre Viva 742',-34.6083,-58.3712),(3,'Pedro Martinez','20345678903','pedro@ejemplo.com','Pavón 5621',-34.61,-58.38),(4,'Ana Lopez','20456789014','ana@ejemplo.com','Bv. Las Grevileas 3480',-34.615,-58.37),(5,'Carlos Jimenez','20567890125','carlos@ejemplo.com','San Lorenzo 1580',-34.62,-58.39),(6,'Laura Fernandez','20678901236','laura@ejemplo.com','Av. Belgrano 2345',-34.625,-58.365),(7,'Ricardo Sánchez','20789012347','ricardo@ejemplo.com','Calle Alsina 456',-34.63,-58.375),(8,'Lucía Herrera','20890123458','lucia@ejemplo.com','Av. Corrientes 900',-34.635,-58.385),(9,'Francisco Yeroncich','12345678901','francisco.yeron12@gmail.com','Ayacucho 633',NULL,NULL),(10,'ClienteActual',NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `itempedido`
--

DROP TABLE IF EXISTS `itempedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `itempedido` (
  `codigo` int NOT NULL AUTO_INCREMENT,
  `id_pedido` int DEFAULT NULL,
  `id_item` int DEFAULT NULL,
  PRIMARY KEY (`codigo`),
  KEY `fk_pedido` (`id_pedido`),
  KEY `fk_itemMenu` (`id_item`),
  CONSTRAINT `fk_itemMenu` FOREIGN KEY (`id_item`) REFERENCES `items_menu` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pedido` FOREIGN KEY (`id_pedido`) REFERENCES `pedido` (`id_pedido`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `itempedido`
--

LOCK TABLES `itempedido` WRITE;
/*!40000 ALTER TABLE `itempedido` DISABLE KEYS */;
INSERT INTO `itempedido` VALUES (1,1,1),(2,1,17),(3,1,15),(4,1,31),(5,2,2),(6,2,18),(7,2,14),(8,2,30),(9,3,3),(10,3,19),(11,3,13),(12,3,29),(13,4,4),(14,4,20),(15,4,12),(16,4,28),(17,5,5),(18,5,21),(19,5,11),(20,5,27),(21,6,6),(22,6,22),(23,6,10),(24,6,26),(25,7,7),(26,7,23),(27,7,9),(28,7,25),(29,8,8),(30,8,24),(31,8,16),(32,8,32),(33,9,4),(34,9,5),(35,9,6),(36,9,7),(37,9,8),(38,9,9),(39,9,10),(40,9,11),(41,9,12),(42,9,13),(43,9,14),(44,9,15),(45,9,16),(46,9,17);
/*!40000 ALTER TABLE `itempedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `items_menu`
--

DROP TABLE IF EXISTS `items_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `items_menu` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(100) NOT NULL,
  `categoria` enum('COMIDA','BEBIDA') NOT NULL,
  `descripcion` varchar(255) DEFAULT NULL,
  `precio` decimal(10,2) NOT NULL,
  `graduacion_alcoholica` decimal(4,2) DEFAULT '0.00',
  `es_gaseosa` tinyint(1) DEFAULT '0',
  `volumen` double DEFAULT '0',
  `peso` double DEFAULT '0',
  `calorias` int DEFAULT '0',
  `apto_vegetariano` tinyint(1) DEFAULT '0',
  `apto_celiaco` tinyint(1) DEFAULT '0',
  `vendedor_id` int DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `fk_vendedor` (`vendedor_id`),
  CONSTRAINT `fk_vendedor` FOREIGN KEY (`vendedor_id`) REFERENCES `vendedor` (`id`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `items_menu`
--

LOCK TABLES `items_menu` WRITE;
/*!40000 ALTER TABLE `items_menu` DISABLE KEYS */;
INSERT INTO `items_menu` VALUES (1,'Agua Mineral','BEBIDA','Descripción',1200.00,0.00,0,500,NULL,NULL,1,1,1),(2,'Jugo de Pomelo','BEBIDA','Descripción',1800.00,0.00,1,610,NULL,NULL,1,1,2),(3,'Whisky','BEBIDA','Descripción',20000.00,55.00,0,920,NULL,NULL,1,1,3),(4,'Cerveza negra','BEBIDA','Descripción',700.00,7.50,0,250,NULL,NULL,1,1,4),(5,'Fernet','BEBIDA','Descripción',12000.00,45.00,0,750,NULL,NULL,1,1,5),(6,'Coca Cola','BEBIDA','Descripción',850.00,0.00,1,600,NULL,NULL,1,1,6),(7,'Ron Blanco','BEBIDA','Descripción',15000.00,40.00,0,700,NULL,NULL,1,1,7),(8,'Limonada Casera','BEBIDA','Descripción',1200.00,0.00,0,500,NULL,NULL,1,1,8),(9,'Cerveza IPA','BEBIDA','Descripción',950.00,5.00,0,473,NULL,NULL,1,1,7),(10,'Gaseosa de Naranja','BEBIDA','Descripción',700.00,0.00,1,500,NULL,NULL,1,1,6),(11,'Gin Tonic','BEBIDA','Descripción',18000.00,37.50,0,750,NULL,NULL,1,1,5),(12,'Sidra Espumante','BEBIDA','Descripción',2200.00,4.50,0,750,NULL,NULL,1,1,4),(13,'Agua Tónica','BEBIDA','Descripción',900.00,0.00,1,350,NULL,NULL,1,1,3),(14,'Vino Malbec','BEBIDA','Descripción',25000.00,13.50,0,750,NULL,NULL,1,1,2),(15,'Vodka','BEBIDA','Descripción',18000.00,40.00,0,700,NULL,NULL,1,1,1),(16,'Ron con Coca','BEBIDA','Descripción',9000.00,35.00,1,500,NULL,NULL,1,1,8),(17,'Pizza Napolitana','COMIDA','Descripción',10500.00,NULL,NULL,NULL,2000,1899,1,0,1),(18,'Sorrentinos de 4 quesos','COMIDA','Descripción',9350.00,NULL,NULL,NULL,750,1500,1,0,2),(19,'Matambre a la pizza','COMIDA','Descripción',12150.00,NULL,NULL,NULL,1200,1050,0,1,3),(20,'Sushi','COMIDA','Descripción',12000.00,NULL,NULL,NULL,500,850,0,0,4),(21,'Helado de Dulce de Leche','COMIDA','Descripción',5700.00,NULL,NULL,NULL,1000,2400,1,0,5),(22,'Lasaña de Espinaca','COMIDA','Descripción',8500.00,NULL,NULL,NULL,800,950,1,0,6),(23,'Bife de Chorizo con Papas','COMIDA','Descripción',18500.00,NULL,NULL,NULL,1500,1200,0,1,7),(24,'Ensalada César','COMIDA','Descripción',5000.00,NULL,NULL,NULL,400,600,1,1,8),(25,'Risotto de Hongos','COMIDA','Descripción',11000.00,NULL,NULL,NULL,650,850,1,0,7),(26,'Pollo al Champiñón','COMIDA','Descripción',12750.00,NULL,NULL,NULL,900,1050,0,1,6),(27,'Tarta de Verduras','COMIDA','Descripción',6000.00,NULL,NULL,NULL,700,750,1,0,5),(28,'Empanadas de Carne','COMIDA','Descripción',4000.00,NULL,NULL,NULL,500,650,0,0,4),(29,'Hamburguesa Vegana','COMIDA','Descripción',9500.00,NULL,NULL,NULL,450,800,1,1,3),(30,'Papas Fritas con Cheddar','COMIDA','Descripción',3700.00,NULL,NULL,NULL,300,500,1,0,2),(31,'Brownie con Helado','COMIDA','Descripción',5700.00,NULL,NULL,NULL,250,1200,1,0,1),(32,'Chinchulines a la mostaza','COMIDA','Descripción',8000.00,NULL,NULL,NULL,1450,1400,0,1,8);
/*!40000 ALTER TABLE `items_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pago`
--

DROP TABLE IF EXISTS `pago`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pago` (
  `id_pago` int NOT NULL AUTO_INCREMENT,
  `fechaPago` datetime NOT NULL,
  `cuit` varchar(255) DEFAULT NULL,
  `cbu` varchar(255) DEFAULT NULL,
  `alias` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id_pago`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pago`
--

LOCK TABLES `pago` WRITE;
/*!40000 ALTER TABLE `pago` DISABLE KEYS */;
INSERT INTO `pago` VALUES (1,'2024-11-01 10:30:00',NULL,NULL,'alias-personal'),(2,'2024-11-02 14:15:00',NULL,NULL,'alias-negocio'),(3,'2024-11-03 09:45:00',NULL,NULL,'alias-cuenta-familiar'),(4,'2024-11-04 16:20:00',NULL,NULL,'alias-ahorro'),(5,'2024-11-05 11:50:00','20-12345678-9','0123456789012345678901',NULL),(6,'2024-11-06 13:35:00','23-87654321-4','9876543210987654321098',NULL),(7,'2024-11-07 08:10:00','30-11223344-5','1111222233334444555566',NULL),(8,'2024-11-08 17:25:00','27-99887766-0','2222333344445555666677',NULL),(9,'2024-12-13 14:59:45',NULL,NULL,NULL);
/*!40000 ALTER TABLE `pago` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pedido`
--

DROP TABLE IF EXISTS `pedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedido` (
  `id_pedido` int NOT NULL AUTO_INCREMENT,
  `id_cliente` int DEFAULT NULL,
  `id_pago` int DEFAULT NULL,
  `total` double NOT NULL,
  `estado` enum('RECIBIDO','EN_ENVIO','ENTREGADO') NOT NULL,
  PRIMARY KEY (`id_pedido`),
  KEY `fk_cliente` (`id_cliente`),
  KEY `fk_pago` (`id_pago`),
  CONSTRAINT `fk_cliente` FOREIGN KEY (`id_cliente`) REFERENCES `cliente` (`id`) ON DELETE SET NULL,
  CONSTRAINT `fk_pago` FOREIGN KEY (`id_pago`) REFERENCES `pago` (`id_pago`) ON DELETE SET NULL
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pedido`
--

LOCK TABLES `pedido` WRITE;
/*!40000 ALTER TABLE `pedido` DISABLE KEYS */;
INSERT INTO `pedido` VALUES (1,1,1,36108,'RECIBIDO'),(2,2,2,40647,'RECIBIDO'),(3,3,3,43401,'RECIBIDO'),(4,4,4,19278,'RECIBIDO'),(5,5,5,42534,'RECIBIDO'),(6,6,6,23256,'RECIBIDO'),(7,7,7,46359,'RECIBIDO'),(8,8,8,23664,'RECIBIDO'),(9,10,9,115000,'RECIBIDO');
/*!40000 ALTER TABLE `pedido` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `vendedor`
--

DROP TABLE IF EXISTS `vendedor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `vendedor` (
  `id` int NOT NULL AUTO_INCREMENT,
  `nombre` varchar(255) DEFAULT NULL,
  `direccion` varchar(255) DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `lng` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `vendedor`
--

LOCK TABLES `vendedor` WRITE;
/*!40000 ALTER TABLE `vendedor` DISABLE KEYS */;
INSERT INTO `vendedor` VALUES (1,'La Dominga','Javier de la Rosa 101',-34.603722,-58.381592),(2,'El Nacional','Ituzaingó 1090',-34.61,-58.37),(3,'Paprika','San Martin 1707',-34.615,-58.36),(4,'Bilbao Amarras','Calle 1º de Enero 27',-34.62,-58.35),(5,'Dr. Jekyll','Marcial Candioti 3414',-34.625,-58.34),(6,'La Cabaña','Av. Libertador 5900',-34.63,-58.33),(7,'El Almacén','Calle Florida 102',-34.635,-58.32),(8,'La Terraza','Belgrano 2001',-34.64,-58.31);
/*!40000 ALTER TABLE `vendedor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-12-16  3:39:23
