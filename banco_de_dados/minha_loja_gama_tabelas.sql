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
-- Table structure for table `cidadeestado`
--

DROP TABLE IF EXISTS `cidadeestado`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cidadeestado` (
  `idCidadeestado` int NOT NULL AUTO_INCREMENT,
  `cidadeCidadeEstado` varchar(100) NOT NULL,
  `estadoCidadeEstado` varchar(100) NOT NULL,
  PRIMARY KEY (`idCidadeestado`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `clientes`
--

DROP TABLE IF EXISTS `clientes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `clientes` (
  `idCliente` int NOT NULL AUTO_INCREMENT,
  `nomeCliente` varchar(140) NOT NULL,
  `whatsappCliente` bigint NOT NULL,
  `senhaCliente` varchar(60) NOT NULL,
  `emailCliente` varchar(60) NOT NULL,
  PRIMARY KEY (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `departamentos`
--

DROP TABLE IF EXISTS `departamentos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `departamentos` (
  `idDepartamento` int NOT NULL AUTO_INCREMENT,
  `nomeDepartamento` varchar(100) NOT NULL,
  PRIMARY KEY (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `enderecos`
--

DROP TABLE IF EXISTS `enderecos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `enderecos` (
  `idEndereco` int NOT NULL AUTO_INCREMENT,
  `tipoEndereco` varchar(45) NOT NULL,
  `tipoLogradouroEndereco` varchar(45) NOT NULL,
  `logradouroEndereco` varchar(255) NOT NULL,
  `numeroEndereco` varchar(45) NOT NULL,
  `complementoEndereco` varchar(140) NOT NULL,
  `cepEndereco` bigint NOT NULL,
  `bairroEndereco` varchar(45) NOT NULL,
  `cidadeestadoEndereco_CidadeEstado` int NOT NULL,
  `clienteEndereco_Cliente` int NOT NULL,
  PRIMARY KEY (`idEndereco`),
  KEY `cidadeestadoEndereco_CidadeEstado_idx` (`cidadeestadoEndereco_CidadeEstado`),
  KEY `fk_clienteEndereco_Cliente_idx` (`clienteEndereco_Cliente`),
  CONSTRAINT `fk_cidadeestadoEndereco_CidadeEstado` FOREIGN KEY (`cidadeestadoEndereco_CidadeEstado`) REFERENCES `cidadeestado` (`idCidadeestado`),
  CONSTRAINT `fk_clienteEndereco_Cliente` FOREIGN KEY (`clienteEndereco_Cliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `estoque`
--

DROP TABLE IF EXISTS `estoque`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `estoque` (
  `idEstoque` int NOT NULL AUTO_INCREMENT,
  `qtdEstoque` int NOT NULL,
  `produtoEstoque_Produto` int NOT NULL,
  PRIMARY KEY (`idEstoque`),
  KEY `fk_idEstoque_Produto_idx` (`produtoEstoque_Produto`),
  CONSTRAINT `fk_produtoEstoque_Produto` FOREIGN KEY (`produtoEstoque_Produto`) REFERENCES `produtos` (`idProduto`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `pedidos`
--

DROP TABLE IF EXISTS `pedidos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `pedidos` (
  `idPedido` int NOT NULL AUTO_INCREMENT,
  `codPedido` bigint NOT NULL,
  `dataPedido` datetime NOT NULL,
  `statusPedido` set('Novo pedido','Cancelado','Aguardando pagamento','Pagamento autorizado','Pagamento negado','Em separação','Em transporte','Entregue') NOT NULL,
  `clientePedido_Cliente` int NOT NULL,
  PRIMARY KEY (`idPedido`,`codPedido`),
  KEY `fk_clientePedido_Cliente_idx` (`clientePedido_Cliente`),
  CONSTRAINT `fk_clientePedido_Cliente` FOREIGN KEY (`clientePedido_Cliente`) REFERENCES `clientes` (`idCliente`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtos`
--

DROP TABLE IF EXISTS `produtos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtos` (
  `idProduto` int NOT NULL AUTO_INCREMENT,
  `codProduto` int NOT NULL,
  `nomeProduto` varchar(140) NOT NULL,
  `precoProduto` float NOT NULL,
  `disponívelProduto` set('Sim','Não') NOT NULL,
  `emDestaqueProduto` set('Sim','Não') NOT NULL,
  `descricaoProduto` varchar(1000) NOT NULL,
  `departamentoProduto_Departamento` int NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_departamentoProduto_Departamento_idx` (`departamentoProduto_Departamento`),
  CONSTRAINT `fk_departamentoProduto_Departamento` FOREIGN KEY (`departamentoProduto_Departamento`) REFERENCES `departamentos` (`idDepartamento`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `produtospedido`
--

DROP TABLE IF EXISTS `produtospedido`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `produtospedido` (
  `idProdutoPedido` int NOT NULL AUTO_INCREMENT,
  `precoUnitarioProdutoPedido` float NOT NULL,
  `valorTotalProdutoPedido` float NOT NULL,
  `descricaoProdutoPedido` varchar(255) NOT NULL,
  `qtdProdutoPedido` int NOT NULL,
  `idProdutoPedido_Pedido` int NOT NULL,
  PRIMARY KEY (`idProdutoPedido`),
  KEY `fk_idProdutoPedido_Pedido_idx` (`idProdutoPedido_Pedido`),
  CONSTRAINT `fk_idProdutoPedido_Pedido` FOREIGN KEY (`idProdutoPedido_Pedido`) REFERENCES `pedidos` (`idPedido`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2021-05-23 20:38:27
