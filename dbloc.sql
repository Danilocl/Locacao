-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for Win32 (AMD64)
--
-- Host: localhost    Database: dblocacao
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `cadastroeventoexpositor`
--

DROP TABLE IF EXISTS `cadastroeventoexpositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `cadastroeventoexpositor` (
  `Expositor_usuarioId` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`Expositor_usuarioId`,`Evento_idEvento`),
  KEY `fk_Expositor_has_Evento_Evento1_idx` (`Evento_idEvento`),
  KEY `fk_Expositor_has_Evento_Expositor1_idx` (`Expositor_usuarioId`),
  CONSTRAINT `fk_Expositor_has_Evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Expositor_has_Evento_Expositor1` FOREIGN KEY (`Expositor_usuarioId`) REFERENCES `expositor` (`usuarioId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cadastroeventoexpositor`
--

LOCK TABLES `cadastroeventoexpositor` WRITE;
/*!40000 ALTER TABLE `cadastroeventoexpositor` DISABLE KEYS */;
INSERT INTO `cadastroeventoexpositor` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `cadastroeventoexpositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `evento`
--

DROP TABLE IF EXISTS `evento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `evento` (
  `idEvento` int(11) NOT NULL,
  `nomeEvento` varchar(100) NOT NULL,
  `endEvento` varchar(100) NOT NULL,
  PRIMARY KEY (`idEvento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `evento`
--

LOCK TABLES `evento` WRITE;
/*!40000 ALTER TABLE `evento` DISABLE KEYS */;
INSERT INTO `evento` VALUES (1,'Hashtag','Rua São Salvador 49'),(2,'Bazar Tijucano','Rua São Francisco Xavier');
/*!40000 ALTER TABLE `evento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expoprodutoevento`
--

DROP TABLE IF EXISTS `expoprodutoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expoprodutoevento` (
  `CadastroEventoExpositor_Expositor_usuarioId` int(11) NOT NULL,
  `CadastroEventoExpositor_Evento_idEvento` int(11) NOT NULL,
  `Produto_idProduto` int(11) NOT NULL,
  KEY `fk_ExpoProdutoEvento_CadastroEventoExpositor1_idx` (`CadastroEventoExpositor_Expositor_usuarioId`,`CadastroEventoExpositor_Evento_idEvento`),
  KEY `fk_ExpoProdutoEvento_Produto1_idx` (`Produto_idProduto`),
  CONSTRAINT `fk_ExpoProdutoEvento_CadastroEventoExpositor1` FOREIGN KEY (`CadastroEventoExpositor_Expositor_usuarioId`, `CadastroEventoExpositor_Evento_idEvento`) REFERENCES `cadastroeventoexpositor` (`Expositor_usuarioId`, `Evento_idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_ExpoProdutoEvento_Produto1` FOREIGN KEY (`Produto_idProduto`) REFERENCES `produto` (`idProduto`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expoprodutoevento`
--

LOCK TABLES `expoprodutoevento` WRITE;
/*!40000 ALTER TABLE `expoprodutoevento` DISABLE KEYS */;
INSERT INTO `expoprodutoevento` VALUES (1,1,1),(2,2,2);
/*!40000 ALTER TABLE `expoprodutoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `expositor`
--

DROP TABLE IF EXISTS `expositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `expositor` (
  `usuarioId` int(11) NOT NULL,
  `endExpositor` varchar(100) DEFAULT NULL,
  `lojaFisica` varchar(100) DEFAULT NULL,
  `usuarioNome` varchar(100) NOT NULL,
  `nomeFantasia` varchar(100) DEFAULT NULL,
  `Expositorcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`usuarioId`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `expositor`
--

LOCK TABLES `expositor` WRITE;
/*!40000 ALTER TABLE `expositor` DISABLE KEYS */;
INSERT INTO `expositor` VALUES (1,'Rua Marechal Noruel 173','Rio Branco','KarinCachopa','Kachopa','Karin'),(2,'Rua Das Dores 45','Sao Paulo','MaguintaDeb','Maguinta','Manola');
/*!40000 ALTER TABLE `expositor` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `fabricante`
--

DROP TABLE IF EXISTS `fabricante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `fabricante` (
  `idFabricante` int(11) NOT NULL,
  `nomeFabricante` varchar(45) DEFAULT NULL,
  `Expositor_usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`idFabricante`),
  KEY `fk_Fabricante_Expositor1_idx` (`Expositor_usuarioId`),
  CONSTRAINT `fk_Fabricante_Expositor1` FOREIGN KEY (`Expositor_usuarioId`) REFERENCES `expositor` (`usuarioId`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `fabricante`
--

LOCK TABLES `fabricante` WRITE;
/*!40000 ALTER TABLE `fabricante` DISABLE KEYS */;
INSERT INTO `fabricante` VALUES (1,'Nike',1),(2,'Adidas',2);
/*!40000 ALTER TABLE `fabricante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `linhaproduto`
--

DROP TABLE IF EXISTS `linhaproduto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `linhaproduto` (
  `idLinhaProduto` int(11) NOT NULL,
  `nomeLinhaProduto` varchar(100) DEFAULT NULL,
  `Fabricante_idFabricante` int(11) NOT NULL,
  PRIMARY KEY (`idLinhaProduto`,`Fabricante_idFabricante`),
  KEY `fk_LinhaProduto_Fabricante1_idx` (`Fabricante_idFabricante`),
  CONSTRAINT `fk_LinhaProduto_Fabricante1` FOREIGN KEY (`Fabricante_idFabricante`) REFERENCES `fabricante` (`idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `linhaproduto`
--

LOCK TABLES `linhaproduto` WRITE;
/*!40000 ALTER TABLE `linhaproduto` DISABLE KEYS */;
INSERT INTO `linhaproduto` VALUES (1,'Biquini',1),(2,'Fitness',2);
/*!40000 ALTER TABLE `linhaproduto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `produto`
--

DROP TABLE IF EXISTS `produto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `produto` (
  `idProduto` int(11) NOT NULL,
  `nomeProduto` varchar(45) NOT NULL,
  `precoProduto` double NOT NULL,
  `descricaoProduto` varchar(300) DEFAULT NULL,
  `LinhaProduto_idLinhaProduto` int(11) NOT NULL,
  `LinhaProduto_Fabricante_idFabricante` int(11) NOT NULL,
  PRIMARY KEY (`idProduto`),
  KEY `fk_Produto_LinhaProduto1_idx` (`LinhaProduto_idLinhaProduto`,`LinhaProduto_Fabricante_idFabricante`),
  CONSTRAINT `fk_Produto_LinhaProduto1` FOREIGN KEY (`LinhaProduto_idLinhaProduto`, `LinhaProduto_Fabricante_idFabricante`) REFERENCES `linhaproduto` (`idLinhaProduto`, `Fabricante_idFabricante`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `produto`
--

LOCK TABLES `produto` WRITE;
/*!40000 ALTER TABLE `produto` DISABLE KEYS */;
INSERT INTO `produto` VALUES (1,'Blusa Maricol',126.36,'Calça Strass',1,1),(2,'Saia Porpurina',598.45,'Vestido Lingo',2,2);
/*!40000 ALTER TABLE `produto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `segmento`
--

DROP TABLE IF EXISTS `segmento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `segmento` (
  `idSegmento` int(11) NOT NULL,
  `nomeSegmento` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idSegmento`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `segmento`
--

LOCK TABLES `segmento` WRITE;
/*!40000 ALTER TABLE `segmento` DISABLE KEYS */;
INSERT INTO `segmento` VALUES (1,'Brechó'),(2,'PopPlus');
/*!40000 ALTER TABLE `segmento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposegmentoevento`
--

DROP TABLE IF EXISTS `tiposegmentoevento`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposegmentoevento` (
  `Segmento_idSegmento` int(11) NOT NULL,
  `Evento_idEvento` int(11) NOT NULL,
  PRIMARY KEY (`Segmento_idSegmento`,`Evento_idEvento`),
  KEY `fk_Segmento_has_Evento_Evento1_idx` (`Evento_idEvento`),
  KEY `fk_Segmento_has_Evento_Segmento1_idx` (`Segmento_idSegmento`),
  CONSTRAINT `fk_Segmento_has_Evento_Evento1` FOREIGN KEY (`Evento_idEvento`) REFERENCES `evento` (`idEvento`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Segmento_has_Evento_Segmento1` FOREIGN KEY (`Segmento_idSegmento`) REFERENCES `segmento` (`idSegmento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposegmentoevento`
--

LOCK TABLES `tiposegmentoevento` WRITE;
/*!40000 ALTER TABLE `tiposegmentoevento` DISABLE KEYS */;
INSERT INTO `tiposegmentoevento` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `tiposegmentoevento` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `tiposegmentoexpositor`
--

DROP TABLE IF EXISTS `tiposegmentoexpositor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tiposegmentoexpositor` (
  `Segmento_idSegmento` int(11) NOT NULL,
  `Expositor_usuarioId` int(11) NOT NULL,
  PRIMARY KEY (`Segmento_idSegmento`,`Expositor_usuarioId`),
  KEY `fk_Segmento_has_Expositor_Expositor1_idx` (`Expositor_usuarioId`),
  KEY `fk_Segmento_has_Expositor_Segmento_idx` (`Segmento_idSegmento`),
  CONSTRAINT `fk_Segmento_has_Expositor_Expositor1` FOREIGN KEY (`Expositor_usuarioId`) REFERENCES `expositor` (`usuarioId`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Segmento_has_Expositor_Segmento` FOREIGN KEY (`Segmento_idSegmento`) REFERENCES `segmento` (`idSegmento`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tiposegmentoexpositor`
--

LOCK TABLES `tiposegmentoexpositor` WRITE;
/*!40000 ALTER TABLE `tiposegmentoexpositor` DISABLE KEYS */;
INSERT INTO `tiposegmentoexpositor` VALUES (1,1),(2,2);
/*!40000 ALTER TABLE `tiposegmentoexpositor` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-06-20 19:45:57
