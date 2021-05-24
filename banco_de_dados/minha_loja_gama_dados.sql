-- MySQL dump 10.13  Distrib 8.0.20, for Win64 (x86_64)
--
-- Host: localhost    Database: minha_loja_gama
-- ------------------------------------------------------
-- Server version	8.0.20

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
-- Dumping data for table `cidadeestado`
--

LOCK TABLES `cidadeestado` WRITE;
/*!40000 ALTER TABLE `cidadeestado` DISABLE KEYS */;
INSERT INTO `cidadeestado` VALUES (1,'Rio de Janeiro','RJ'),(2,'Cabo Frio','RJ'),(3,'Santo André','SP'),(4,'São Paulo','SP'),(5,'Belém','PR');
/*!40000 ALTER TABLE `cidadeestado` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `clientes`
--

LOCK TABLES `clientes` WRITE;
/*!40000 ALTER TABLE `clientes` DISABLE KEYS */;
INSERT INTO `clientes` VALUES (1,'Maria',212121212,'Maria123','maria@gmail.com'),(2,'Jose',222222222,'Jose123','jose@gmail.com'),(3,'Carlos',232323232,'Carlos123','carlos@gmail.com'),(4,'Joao',242424242,'Joao123','joao@gmail.com');
/*!40000 ALTER TABLE `clientes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `departamentos`
--

LOCK TABLES `departamentos` WRITE;
/*!40000 ALTER TABLE `departamentos` DISABLE KEYS */;
INSERT INTO `departamentos` VALUES (1,'Celulares Smartphones'),(2,'Cosméticos'),(3,'Papelaria'),(4,'Computadores');
/*!40000 ALTER TABLE `departamentos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `enderecos`
--

LOCK TABLES `enderecos` WRITE;
/*!40000 ALTER TABLE `enderecos` DISABLE KEYS */;
INSERT INTO `enderecos` VALUES (1,'Casa','Rua','Ari Toledo','25','Casa 1',2277730,'Rocha Miranda',1,2),(2,'Comercial','Avenida','das Américas','5500','Prédio B',2525267,'Barra da Tijuca',1,4),(3,'Casa','Avenida','Fontoura','750','-',5675678,'Serra',3,1),(4,'Comercial','Rua','Tristao Claro','40','Cond. Parque',7807804,'Tijuca',2,3),(5,'Comercial','Estrada','Claro Neves','89045','Claro Neves',4536789,'Pechincha',4,2);
/*!40000 ALTER TABLE `enderecos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `estoque`
--

LOCK TABLES `estoque` WRITE;
/*!40000 ALTER TABLE `estoque` DISABLE KEYS */;
INSERT INTO `estoque` VALUES (1,50,1),(2,20,2),(3,120,3),(4,2000,4),(5,0,5),(6,30,6);
/*!40000 ALTER TABLE `estoque` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `pedidos`
--

LOCK TABLES `pedidos` WRITE;
/*!40000 ALTER TABLE `pedidos` DISABLE KEYS */;
INSERT INTO `pedidos` VALUES (1,76854521,'2021-05-15 00:00:00','Cancelado',1),(2,32547689,'2021-05-16 00:00:00','Aguardando pagamento',3),(3,23135153,'2021-05-16 00:00:00','Em transporte',2),(4,34242347,'2021-05-17 00:00:00','Entregue',4),(5,36856789,'2021-05-18 00:00:00','Pagamento negado',4),(6,42345235,'2021-05-18 00:00:00','Novo pedido',1),(7,95743346,'2021-05-20 00:00:00','Em transporte',2),(8,89642352,'2021-05-20 00:00:00','Em transporte',3),(9,31345268,'2021-05-21 00:00:00','Entregue',4);
/*!40000 ALTER TABLE `pedidos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtos`
--

LOCK TABLES `produtos` WRITE;
/*!40000 ALTER TABLE `produtos` DISABLE KEYS */;
INSERT INTO `produtos` VALUES (1,334167,'Samsung S21',3500,'Sim','Sim','Samsung S21 novo',1),(2,456758,'Motorola G7',2000,'Sim','Não','Motorola G7 Nova geração',1),(3,89786,'Sabonete de rosto Natura',19.99,'Sim','Não','Sabonete de rosto Natura para melhorar sua pele',2),(4,564579,'Caneta Bic',0.8,'Sim','Não','Caneta Bic Azul, preta e verde',3),(5,778912,'Borracha Faber Castell',0.5,'Não','Não','Borracha Faber Castell diversas cores',3),(6,423320,'Notebook Lenovo i5',2500,'Sim','Sim','Notebook Lenovo de ultima geração com melhor processador',4);
/*!40000 ALTER TABLE `produtos` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping data for table `produtospedido`
--

LOCK TABLES `produtospedido` WRITE;
/*!40000 ALTER TABLE `produtospedido` DISABLE KEYS */;
INSERT INTO `produtospedido` VALUES (1,3500,3500,'Samsung S21',1,1),(2,2000,4000,'Motorola G7',2,2),(3,14.99,29.98,'Sabonete de rosto Natura',2,3),(4,0.8,16,'Caneta Bic',20,4),(5,2500,5000,'Notebook Lenovo',2,6);
/*!40000 ALTER TABLE `produtospedido` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 20:36:38
