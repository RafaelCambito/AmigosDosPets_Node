/*
SQLyog Community v13.1.1 (64 bit)
MySQL - 5.7.36 : Database - amigosdospets
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`amigosdospets` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci */;

USE `amigosdospets`;

/*Table structure for table `petencontrado` */

DROP TABLE IF EXISTS `petencontrado`;

CREATE TABLE `petencontrado` (
  `id_pet` int(11) NOT NULL AUTO_INCREMENT,
  `especie_encontrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `data_encontrado` date NOT NULL,
  `cidade_encontrado` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `local_encontrado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `detalhes_encontrado` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_encontrado` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `situacao_encontrado` varchar(1) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id_pet`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `petencontrado` */

insert  into `petencontrado`(`id_pet`,`especie_encontrado`,`user_id`,`data_encontrado`,`cidade_encontrado`,`local_encontrado`,`detalhes_encontrado`,`foto_encontrado`,`situacao_encontrado`) values 
(1,'Cão',8,'2023-11-05','Cascavel','Bairro Floresta','Teste ','image/1699236544852.jpg','S');

/*Table structure for table `pets` */

DROP TABLE IF EXISTS `pets`;

CREATE TABLE `pets` (
  `id_pet` int(11) NOT NULL AUTO_INCREMENT,
  `nome_pet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) NOT NULL,
  `especie_pet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `sexo_pet` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `idade_pet` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `porte_pet` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `foto_pet` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sobre_pet` text COLLATE utf8mb4_unicode_ci,
  `data_criacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `data_atualizacao` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `disponivel_doacao` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `perdido` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id_pet`),
  KEY `user_id` (`user_id`),
  CONSTRAINT `pets_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `pets` */

insert  into `pets`(`id_pet`,`nome_pet`,`user_id`,`especie_pet`,`sexo_pet`,`idade_pet`,`porte_pet`,`foto_pet`,`sobre_pet`,`data_criacao`,`data_atualizacao`,`disponivel_doacao`,`perdido`) values 
(2,'Bob',8,'cachorro','macho','filhote','pequeno','image/cachorro.jpg','teste','2023-09-24 00:17:53','2023-11-05 19:37:28','S','N'),
(3,'Cat',8,'gato','femea','filhote','pequeno','image/gato2.jpg','Teste cadastro cat','2023-09-24 23:39:11','2023-11-05 19:37:38','S','N'),
(4,'gatinho',8,'gato','macho','filhote','pequeno','image/gato.jpg','Teste cadastro cat2','2023-09-24 23:49:04','2023-11-05 19:37:42','S','N'),
(17,'Marley',8,'cachorro','macho','filhote','pequeno','image/cachorro2.jpg','Marley','2023-09-26 00:11:05','2023-11-05 19:37:46','S','N'),
(18,'Stalone',8,'cachorro','macho','adulto','grande','image/1698722920957.jpg','Stalone','2023-09-26 00:11:48','2023-11-05 19:34:49','S','N'),
(19,'Caramelo',8,'cachorro','macho','adulto','medio','image/1698722920957.jpg','Caramelo','2023-09-26 00:13:32','2023-11-05 19:34:49','S','N'),
(21,'Salsicha',8,'cachorro','macho','adulto','pequeno','image/1698722920957.jpg','Salsicha','2023-09-26 23:41:09','2023-11-05 19:34:50','S','N'),
(22,'Spike',8,'cachorro','macho','filhote','pequeno','image/1698722920957.jpg','Spike','2023-09-26 23:42:41','2023-11-05 19:34:50','N','S'),
(23,'Teste pet perdido',8,'gato','femea','adulto','pequeno','image/1698722920957.jpg','Perdido na rua ABC, bairro XYZ, por volta das 19:00 horas do dia 27-09-2023.','2023-09-27 18:03:12','2023-11-05 19:34:51','N','S'),
(24,'gato',8,'gato','femea','idoso','pequeno','image/1698722920957.jpg','dfsdfs','2023-10-31 00:28:40','2023-10-31 00:28:40','S','N');

/*Table structure for table `sessions` */

DROP TABLE IF EXISTS `sessions`;

CREATE TABLE `sessions` (
  `session_id` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `expires` int(11) unsigned NOT NULL,
  `data` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin,
  PRIMARY KEY (`session_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `sessions` */

insert  into `sessions`(`session_id`,`expires`,`data`) values 
('-gBjV7xus2X728KeUTaLINr3Q59IZrI_',1699309287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('PWrW26sWFLV28Rt3GneIQGl2uI9afCCb',1699309287,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"}}'),
('W-FF45QJzIa1yl-evf5xck91TgO1u5Yb',1699323270,'{\"cookie\":{\"originalMaxAge\":null,\"expires\":null,\"httpOnly\":true,\"path\":\"/\"},\"user_id\":8,\"successMessage\":\"Cadastro do pet encontrado realizado com sucesso!\"}');

/*Table structure for table `users` */

DROP TABLE IF EXISTS `users`;

CREATE TABLE `users` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nome` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cpf` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `whatsapp` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `telefone_secundario` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `endereco` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `estado` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cidade` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `senha` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `genero` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`nome`,`cpf`,`email`,`whatsapp`,`telefone_secundario`,`endereco`,`estado`,`cidade`,`senha`,`genero`,`createdAt`,`updatedAt`) values 
(1,'User da Silva','66254544008','userdasilva@email.com.br','45999991010','4532232030','Rua teste','Paraná','Cascavel','123','masculino','2023-09-17 20:10:18','2023-09-17 20:10:18'),
(8,'Cadastro Teste','13129884955','teste2@teste.com.br','45999991010','4532232030','Rua teste','PR','Cascavel','1111','masculino','2023-09-21 12:03:55','2023-09-21 12:03:55'),
(9,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'0000-00-00 00:00:00','0000-00-00 00:00:00');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
