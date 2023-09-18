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
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

/*Data for the table `users` */

insert  into `users`(`id`,`nome`,`cpf`,`email`,`whatsapp`,`telefone_secundario`,`endereco`,`estado`,`cidade`,`senha`,`genero`,`createdAt`,`updatedAt`) values 
(1,'User da Silva','66254544008','userdasilva@email.com.br','45999991010','4532232030','Rua teste','Paraná','Cascavel','123','masculino','2023-09-17 20:10:18','2023-09-17 20:10:18'),
(2,'Cadastro Teste 2','13129884955','cadastroteste2@email.com.br','45999991020','4532232050','Rua teste 2','Paraná','Cascavel','111','feminino','2023-09-17 20:12:47','2023-09-17 20:12:47'),
(3,'Cadastro Teste 3','33333333333','teste3@teste.com.br','45999995050','4532231010','Rua teste 3','Paraná','Cascavel','123456','prefiro_nao_dizer','2023-09-17 20:32:46','2023-09-17 20:32:46'),
(4,'Pet Teste','13129884955','cadastroteste@email.com.br','45999991010','4532232030','Rua teste','Paraná','Cascavel','111','feminino','2023-09-18 17:49:16','2023-09-18 17:49:16'),
(5,'teste 56','15137100951','teste55555@teste.com.br','45999995050','4532232050','Rua teste 2','Paraná','Cascavel','555','outros','2023-09-18 17:57:44','2023-09-18 17:57:44'),
(6,'alterado rota','15137100951','teste@teste.com.br','45999991020','4532232030','Rua teste','Paraná','Cascavel','aasas','feminino','2023-09-18 18:03:28','2023-09-18 18:03:28'),
(7,'Cadastro Teste novo','13129884955','teste2@teste.com.br','45999995050','4532232050','Rua teste 2','PR','Cascavel','123','masculino','2023-09-18 18:42:16','2023-09-18 18:42:16');

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
