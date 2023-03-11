CREATE DATABASE  IF NOT EXISTS `espeto_de_cats`;
USE `espeto_de_cats`;
-- MySQL dump 10.13  Distrib 8.0.32, for Linux (x86_64)
--
-- Host: localhost    Database: espeto_de_cats
-- ------------------------------------------------------
-- Server version	8.0.32

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
-- Table structure for table `cliente`
--

DROP TABLE IF EXISTS `cliente`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `cliente` (
  `cod` char(3) NOT NULL,
  `nome` varchar(80) NOT NULL,
  `data_nasc` date NOT NULL,
  `telefone` char(9) NOT NULL,
  `status` tinyint DEFAULT '1',
  `uf` char(2) NOT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `cliente`
--

LOCK TABLES `cliente` WRITE;
/*!40000 ALTER TABLE `cliente` DISABLE KEYS */;
INSERT INTO `cliente` VALUES ('330','Camilly Baptista','2000-07-09','123456789',1,'AM',NULL,'44444444',NULL,NULL,NULL),('331','Paulo Cativo','1990-02-19','987654321',1,'RJ',NULL,'14444446',NULL,NULL,NULL),('332','Italo Thiago','2004-04-29','987654321',1,'LS',NULL,'24414445',NULL,NULL,NULL),('333','Emilly Atem','2004-05-24','987654321',1,'TY',NULL,'84444443',NULL,NULL,NULL),('334','Victória Cristina','2004-01-20','987654321',1,'RJ',NULL,'14444446',NULL,NULL,NULL),('335','Yago Feitosa','2013-07-09','123456789',0,'AA','Top de Jk','24414445','Rua de fulano de tal',23,'Rita lee FC');
/*!40000 ALTER TABLE `cliente` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conta_rede_social`
--

DROP TABLE IF EXISTS `conta_rede_social`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `conta_rede_social` (
  `cod` char(3) NOT NULL,
  `login` varchar(40) NOT NULL,
  `senha` varchar(40) NOT NULL,
  `email` varchar(80) NOT NULL,
  `rest_cod` char(3) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_rest_conta` (`rest_cod`),
  CONSTRAINT `fk_rest_conta` FOREIGN KEY (`rest_cod`) REFERENCES `restaurante` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conta_rede_social`
--

LOCK TABLES `conta_rede_social` WRITE;
/*!40000 ALTER TABLE `conta_rede_social` DISABLE KEYS */;
INSERT INTO `conta_rede_social` VALUES ('440','rest_la','naoteconto','naosei@email.com','220'),('441','rest_li','naoteconto2','naosei@email.com','220'),('442','rest_ad','supresa','2naosei4seila@email.com','221'),('443','rest_op','3naoteconto3','3naosei3@email3.com','222');
/*!40000 ALTER TABLE `conta_rede_social` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `delivery`
--

DROP TABLE IF EXISTS `delivery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `delivery` (
  `cod` char(3) NOT NULL,
  `valor` float DEFAULT NULL,
  `data_solic` timestamp NOT NULL,
  `cliente_cod` char(3) DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `fk_cliente_delivery` (`cliente_cod`),
  CONSTRAINT `fk_cliente_delivery` FOREIGN KEY (`cliente_cod`) REFERENCES `cliente` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `delivery`
--

LOCK TABLES `delivery` WRITE;
/*!40000 ALTER TABLE `delivery` DISABLE KEYS */;
INSERT INTO `delivery` VALUES ('660',230,'2016-06-22 23:10:25','330'),('661',100,'2022-07-22 18:11:22','330'),('662',230,'2020-07-12 15:08:11','332');
/*!40000 ALTER TABLE `delivery` ENABLE KEYS */;
UNLOCK TABLES;



--
-- Table structure for table `entrega`
--

DROP TABLE IF EXISTS `entrega`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `entrega` (
  `mtboy_cod` char(3) NOT NULL,
  `mtboy_cnh` char(9) NOT NULL,
  `cliente_cod` char(3) NOT NULL,
  `delivery_cod` char(3) NOT NULL,
  `data_entrega` timestamp NOT NULL,
  PRIMARY KEY (`mtboy_cod`,`mtboy_cnh`,`cliente_cod`,`data_entrega`),
  KEY `fk_cliente_entrega` (`cliente_cod`),
  KEY `fk_delivery_cod` (`delivery_cod`),
  CONSTRAINT `fk_cliente_entrega` FOREIGN KEY (`cliente_cod`) REFERENCES `cliente` (`cod`),
  CONSTRAINT `fk_delivery_cod` FOREIGN KEY (`delivery_cod`) REFERENCES `delivery` (`cod`),
  CONSTRAINT `fk_motoboy_entrega` FOREIGN KEY (`mtboy_cod`, `mtboy_cnh`) REFERENCES `motoboy` (`func_cod`, `cnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `entrega`
--

LOCK TABLES `entrega` WRITE;
/*!40000 ALTER TABLE `entrega` DISABLE KEYS */;
INSERT INTO `entrega` VALUES ('550','123456789','330','660','2022-12-22 13:11:01'),('550','123456789','330','661','2022-12-22 13:11:02'),('553','444444444','332','662','2023-01-14 13:11:02');
/*!40000 ALTER TABLE `entrega` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario`
--

DROP TABLE IF EXISTS `funcionario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario` (
  `cod` char(3) NOT NULL,
  `data_admissao` date NOT NULL,
  `nome` varchar(80) NOT NULL,
  `Fsexo` enum('M','F','O') DEFAULT NULL,
  `data_nasc` date NOT NULL,
  `salario` float NOT NULL,
  `uf` char(2) NOT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  `rest_cod` char(3) DEFAULT NULL,
  `data_inicio_gerencia` date DEFAULT NULL,
  PRIMARY KEY (`cod`),
  KEY `pk_rest_func` (`rest_cod`),
  CONSTRAINT `pk_rest_func` FOREIGN KEY (`rest_cod`) REFERENCES `restaurante` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario`
--

LOCK TABLES `funcionario` WRITE;
/*!40000 ALTER TABLE `funcionario` DISABLE KEYS */;
INSERT INTO `funcionario` VALUES ('550','2022-01-12','Cássia','F','2001-08-20',1600,'AM',NULL,'24414445',NULL,NULL,NULL,NULL,NULL),('551','2019-01-22','Cynthia','F','2002-11-22',2600,'RJ',NULL,'14414475',NULL,NULL,NULL,NULL,NULL),('552','2021-11-16','Italo Thiago','M','2003-12-09',600,'TY',NULL,'24414445',NULL,NULL,NULL,NULL,NULL),('553','2020-01-26','Beatriz','F','2002-02-19',2300,'AM',NULL,'44414449',NULL,NULL,NULL,'220','2021-01-26'),('554','2022-07-25','Hungria','M','2002-02-09',2200,'AM',NULL,'14484449',NULL,NULL,NULL,'220','2023-01-18'),('555','2020-08-30','Guilherme','M','2002-02-19',2300,'AM',NULL,'44414449',NULL,NULL,NULL,'221','2021-08-30'),('556','2023-01-10','Guilherme','M','2002-02-19',2300,'AM',NULL,'44414449',NULL,NULL,NULL,'222','2023-01-11');
/*!40000 ALTER TABLE `funcionario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `funcionario_trabalha_restaurante`
--

DROP TABLE IF EXISTS `funcionario_trabalha_restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `funcionario_trabalha_restaurante` (
  `func_cod` char(3) NOT NULL,
  `rest_cod` char(3) NOT NULL,
  PRIMARY KEY (`func_cod`,`rest_cod`),
  KEY `fk_rest_trabalha` (`rest_cod`),
  CONSTRAINT `fk_func_trabalha` FOREIGN KEY (`func_cod`) REFERENCES `funcionario` (`cod`),
  CONSTRAINT `fk_rest_trabalha` FOREIGN KEY (`rest_cod`) REFERENCES `restaurante` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `funcionario_trabalha_restaurante`
--

LOCK TABLES `funcionario_trabalha_restaurante` WRITE;
/*!40000 ALTER TABLE `funcionario_trabalha_restaurante` DISABLE KEYS */;
INSERT INTO `funcionario_trabalha_restaurante` VALUES ('550','220'),('553','220'),('554','220'),('555','221'),('551','222'),('556','222');
/*!40000 ALTER TABLE `funcionario_trabalha_restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `horario`
--

DROP TABLE IF EXISTS `horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `horario` (
  `cod` char(3) NOT NULL,
  `dia` enum('segunda','terça','quarta','quinta','sexta') DEFAULT NULL,
  `abertura` time NOT NULL,
  `fechamento` time NOT NULL,
  PRIMARY KEY (`cod`),
  CONSTRAINT `ck_horario` CHECK ((`fechamento` > `abertura`))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `horario`
--

LOCK TABLES `horario` WRITE;
/*!40000 ALTER TABLE `horario` DISABLE KEYS */;
INSERT INTO `horario` VALUES ('110','segunda','08:00:23','19:43:22'),('111','segunda','10:30:23','21:43:22'),('112','terça','05:10:13','22:23:52'),('113','quarta','18:00:23','20:10:22'),('114','sexta','10:05:10','18:23:17');
/*!40000 ALTER TABLE `horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `moto`
--

DROP TABLE IF EXISTS `moto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `moto` (
  `num_placa` char(7) NOT NULL,
  `marca` varchar(80) NOT NULL,
  `modelo` varchar(60) NOT NULL,
  `ano` int DEFAULT NULL,
  `cor` varchar(30) DEFAULT NULL,
  `cilindradas` int DEFAULT NULL,
  `mtboy_cod` char(3) DEFAULT NULL,
  `mtboy_cnh` char(9) DEFAULT NULL,
  PRIMARY KEY (`num_placa`),
  KEY `fk_mtboy_moto` (`mtboy_cod`,`mtboy_cnh`),
  CONSTRAINT `fk_mtboy_moto` FOREIGN KEY (`mtboy_cod`, `mtboy_cnh`) REFERENCES `motoboy` (`func_cod`, `cnh`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `moto`
--

LOCK TABLES `moto` WRITE;
/*!40000 ALTER TABLE `moto` DISABLE KEYS */;
INSERT INTO `moto` VALUES ('1234567','KI','OP 6789',2022,'Laranja',10,'550','123456789'),('1234568','KI','OP 6789',2022,'Vermelho',10,'550','123456789'),('5555555','EEEE','ZY 400',2020,'Azul',16,'553','444444444'),('8888888','TUX','ZY 300',2009,'Verde',30,'551','423456786');
/*!40000 ALTER TABLE `moto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `motoboy`
--

DROP TABLE IF EXISTS `motoboy`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `motoboy` (
  `func_cod` char(3) NOT NULL,
  `cnh` char(9) NOT NULL,
  `taxa_entrega` float DEFAULT NULL,
  `avaliacao` int DEFAULT NULL,
  `entrega_noturna` tinyint NOT NULL DEFAULT '1',
  PRIMARY KEY (`func_cod`,`cnh`),
  CONSTRAINT `fk_func_mtboy` FOREIGN KEY (`func_cod`) REFERENCES `funcionario` (`cod`),
  CONSTRAINT `ck_tx` CHECK ((`taxa_entrega` between 0.0 and 1.0))
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `motoboy`
--

LOCK TABLES `motoboy` WRITE;
/*!40000 ALTER TABLE `motoboy` DISABLE KEYS */;
INSERT INTO `motoboy` VALUES ('550','123456789',0.8,23,0),('551','423456786',0.9,18,0),('553','444444444',0.1,10,0);
/*!40000 ALTER TABLE `motoboy` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurante`
--

DROP TABLE IF EXISTS `restaurante`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante` (
  `cod` char(3) NOT NULL,
  `capacidade` int DEFAULT NULL,
  `telefone` char(9) NOT NULL,
  `uf` char(2) NOT NULL,
  `cidade` varchar(80) DEFAULT NULL,
  `cep` varchar(8) NOT NULL,
  `rua` varchar(80) DEFAULT NULL,
  `numero` int DEFAULT NULL,
  `bairro` varchar(80) DEFAULT NULL,
  PRIMARY KEY (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurante`
--

LOCK TABLES `restaurante` WRITE;
/*!40000 ALTER TABLE `restaurante` DISABLE KEYS */;
INSERT INTO `restaurante` VALUES ('220',20,'123456789','AM','Manaus','44444444','Rua de tal',23,'Bairro de tal'),('221',30,'123456789','AM','Manaus','33333333','Rua de tal',23,'Bairro de tal'),('222',0,'223457781','RJ','Rio de Janeiro','44444444','Rua de tal',23,'Bairro de tal');
/*!40000 ALTER TABLE `restaurante` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `restaurante_tem_horario`
--

DROP TABLE IF EXISTS `restaurante_tem_horario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `restaurante_tem_horario` (
  `hr_cod` char(3) NOT NULL,
  `rest_cod` char(3) NOT NULL,
  PRIMARY KEY (`hr_cod`,`rest_cod`),
  KEY `fk_rest_tem` (`rest_cod`),
  CONSTRAINT `fk_hr_tem` FOREIGN KEY (`hr_cod`) REFERENCES `horario` (`cod`),
  CONSTRAINT `fk_rest_tem` FOREIGN KEY (`rest_cod`) REFERENCES `restaurante` (`cod`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `restaurante_tem_horario`
--

LOCK TABLES `restaurante_tem_horario` WRITE;
/*!40000 ALTER TABLE `restaurante_tem_horario` DISABLE KEYS */;
INSERT INTO `restaurante_tem_horario` VALUES ('110','220'),('112','220'),('113','221'),('114','222');
/*!40000 ALTER TABLE `restaurante_tem_horario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping events for database 'espeto_de_cats'
--

--
-- Dumping routines for database 'espeto_de_cats'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2023-02-19 11:05:32
