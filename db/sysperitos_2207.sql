/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50724
Source Host           : localhost:3306
Source Database       : sysperitos

Target Server Type    : MYSQL
Target Server Version : 50724
File Encoding         : 65001

Date: 2021-07-22 15:34:05
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for actividades
-- ----------------------------
DROP TABLE IF EXISTS `actividades`;
CREATE TABLE `actividades` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_act` date DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `tipo_act_id` int(11) NOT NULL,
  `ubicacion_id` int(11) NOT NULL,
  `peritajes_id` int(11) NOT NULL,
  `obs_actividad` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`,`tipo_act_id`,`ubicacion_id`,`peritajes_id`),
  KEY `fk_actividades_tipo_act1_idx` (`tipo_act_id`),
  KEY `fk_actividades_ubicacion1_idx` (`ubicacion_id`),
  KEY `fk_actividades_peritajes_idx` (`peritajes_id`),
  CONSTRAINT `fk_actividades_peritajes` FOREIGN KEY (`peritajes_id`) REFERENCES `peritajes` (`id`),
  CONSTRAINT `fk_actividades_tipo_act1` FOREIGN KEY (`tipo_act_id`) REFERENCES `tipo_act` (`id`),
  CONSTRAINT `fk_actividades_ubicacion1` FOREIGN KEY (`ubicacion_id`) REFERENCES `ubicacion` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of actividades
-- ----------------------------
INSERT INTO `actividades` VALUES ('7', '2020-09-23', '1', '2021-07-22 14:45:27', '2021-07-22 14:45:27', '2', '1', '122', '');
INSERT INTO `actividades` VALUES ('8', '2021-07-20', '1', '2021-07-22 14:56:31', '2021-07-22 14:56:31', '5', '1', '278', 'Equipo presenta problemas, se envia a serv. técnico para cambio de pantalla pero estos informan que presneta problemas en placa lógica');

-- ----------------------------
-- Table structure for estados
-- ----------------------------
DROP TABLE IF EXISTS `estados`;
CREATE TABLE `estados` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gls_estado` varchar(45) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of estados
-- ----------------------------
INSERT INTO `estados` VALUES ('1', 'Solicitado', '2021-06-09 21:59:02', '2021-06-09 21:59:02', null);
INSERT INTO `estados` VALUES ('2', 'Vaciado OK', '2021-06-09 21:59:28', '2021-06-09 21:59:28', null);
INSERT INTO `estados` VALUES ('3', 'Análisis de datos', '2021-06-09 21:59:47', '2021-06-09 21:59:47', null);
INSERT INTO `estados` VALUES ('4', 'Cerrado-Informe entregado', '2021-06-09 21:59:55', '2021-06-09 21:59:55', null);
INSERT INTO `estados` VALUES ('5', 'En espera de equipo', '2021-06-09 22:00:04', '2021-06-09 22:00:04', null);
INSERT INTO `estados` VALUES ('6', 'Fallido, equipo bloqueado o en mal estado', '2021-06-09 22:00:28', '2021-06-09 22:00:28', null);

-- ----------------------------
-- Table structure for fiscales
-- ----------------------------
DROP TABLE IF EXISTS `fiscales`;
CREATE TABLE `fiscales` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_fiscal` varchar(60) DEFAULT NULL,
  `rut_fiscal` varchar(12) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=73 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fiscales
-- ----------------------------
INSERT INTO `fiscales` VALUES ('1', 'CABALLERO  VILLAGRAN CAROLINA', '12646152-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('2', 'ROHDE HERBERT ', '10575088-9', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('3', 'CELIS  CORRALES FABIOLA JANET', '12621000-0', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('4', 'CESPEDES  ILLANES RODRIGO ARTURO', '12668317-0', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('5', 'PEREZ  TORRES MARCIAL OLEGARIO', '11937356-5', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('6', 'NICOREANU RODRIGO NICOLÁS', '12159093-K', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('7', 'TORREJON SILVA JUAN PABLO', '8329989-4', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('8', 'VENEGAS BASUALTO CLAUDIO', '10274333-4', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('9', 'SCHUSTER  JARAMILLO WALLY LORRIE', '13113066-K', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('10', 'VIDAL  MERCADO CARLOS ANTONIO', '11828249-3', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('11', 'STAGNO  ABUD GIANNI FRANCO', '12722687-3', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('12', 'CORREA  MORALES CLAUDIO', '14441802-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('13', 'VILLALOBOS SQUELLA ANDRES JUAN', '13225036-7', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('14', 'AGUILERA PONCE JUAN PABLO', '15048344-1', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('15', 'VALDIVIA DELGADO ROCIO LOURDES', '13746170-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('16', 'ROJAS  MALUENDA JAIME ALONSO', '10854572-0', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('17', 'GOMEZ OSORIO CAROL', '15017342-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('18', 'PAULO DUARTE', '13240030-K', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('19', 'WEISSER HITSCHFELD YOCELYN', '15272424-1', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('23', 'CAROLINA GOYA PIZARRO', '15514547-1', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('24', 'CALQUÍN MEZA GERMAN ', '14260720-4', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('26', 'CAMPOS PATRICIA ', '12803331-9', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('28', 'SOTO MOLINA RICARDO', '15053111-K', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('29', 'SALINAS SALINAS FREDDY', '12611243-2', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('30', 'ROJAS GATICA JAIME ', '16449752-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('31', 'CLAUDIO ROJAS', '12219801-4', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('32', 'RAFAEL RAMOS AQUEDA', '12576972-1', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('33', 'GALLARDO ANGEL RENÁN', '15035890-6', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('34', 'GALVEZ  KELLY ANDRES HUMBERTO', '12446034-4', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('35', 'fiscal CS 2', 'cs2', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('36', 'CARLOS PATRICIO JIMENEZ VILLALOBOS', '12806233-5', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('39', 'SHERTZER BARAONA NICOLAS', '16559537-8', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('41', 'SALINAS  ESPINOZA RICARDO MIGUEL', '10542380-2', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('44', 'GOMEZ DEL PINO RODRIGO ALFREDO', '12721909-5', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('56', 'FISCAL CS 1', 'CS 1', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('60', 'PAULO DUARTE LOPEZ', '13240030-K', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('61', 'FISCAL CS 3', 'CS3', '2', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('66', 'CARTES CHAPARRO MAURICIO ', '13147268-4', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('67', 'YAÑEZ  MUÑOZ EDUARDO', '13177333-1', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('69', 'ACEVEDO ACEVEDO ANA CAROLINA', '12613085-6', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('70', 'CUADRA SEPULVEDA TATIANA', '11160168-2', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('71', 'VEGA CORTES ADRIAN', '12447062-5', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');
INSERT INTO `fiscales` VALUES ('72', 'GONZALEZ TOBAR JUAN ', '13762074-K', '1', '2019-10-09 15:56:27', '2019-10-09 15:56:27');

-- ----------------------------
-- Table structure for peritajes
-- ----------------------------
DROP TABLE IF EXISTS `peritajes`;
CREATE TABLE `peritajes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ruc` varchar(12) DEFAULT NULL,
  `fecha` date DEFAULT NULL,
  `nue` varchar(255) DEFAULT NULL,
  `plazo` int(11) DEFAULT NULL,
  `gls_peritaje` text,
  `obs_peritaje` varchar(255) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `tipo_peritaje_id` int(11) NOT NULL,
  `fiscales_id` int(11) NOT NULL,
  `peritos_id` int(11) NOT NULL,
  `estados_id` int(11) NOT NULL,
  PRIMARY KEY (`id`,`tipo_peritaje_id`,`fiscales_id`,`peritos_id`,`estados_id`),
  KEY `fk_peritajes_tipo_peritaje1_idx` (`tipo_peritaje_id`),
  KEY `fk_peritajes_fiscales1_idx` (`fiscales_id`),
  KEY `fk_peritajes_peritos1_idx` (`peritos_id`),
  KEY `fk_peritajes_estados_idx` (`estados_id`),
  CONSTRAINT `fk_peritajes_estados` FOREIGN KEY (`estados_id`) REFERENCES `estados` (`id`),
  CONSTRAINT `fk_peritajes_fiscales1` FOREIGN KEY (`fiscales_id`) REFERENCES `fiscales` (`id`),
  CONSTRAINT `fk_peritajes_peritos1` FOREIGN KEY (`peritos_id`) REFERENCES `peritos` (`id`),
  CONSTRAINT `fk_peritajes_tipo_peritaje1` FOREIGN KEY (`tipo_peritaje_id`) REFERENCES `tipo_peritaje` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=283 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of peritajes
-- ----------------------------
INSERT INTO `peritajes` VALUES ('83', '1601069586-8', '2016-01-01', '', '30', 'Solicita peritaje de llamados entrantes y salientes.', '', '1', '2019-09-09 18:26:01', '2020-03-09 00:00:00', '1', '3', '2', '4');
INSERT INTO `peritajes` VALUES ('84', '1601160002-K', '2017-09-01', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-09 19:21:59', '2019-09-11 20:17:15', '1', '3', '2', '4');
INSERT INTO `peritajes` VALUES ('85', '1600722014-K', '2017-02-26', '', '60', 'Se vaciaron 3 teléfonos celulares.', '', '1', '2019-09-09 19:31:34', '2019-09-11 20:16:55', '1', '8', '2', '4');
INSERT INTO `peritajes` VALUES ('86', '1601154468-5', '2017-02-26', '', '60', 'Se vaciaron 6 teléfonos celulares.', '', '1', '2019-09-09 19:37:41', '2019-09-11 20:24:42', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('87', '1601154468-5', '2017-04-04', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-09 19:43:40', '2019-09-11 20:10:22', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('88', '1600548347-K', '2017-04-04', '', '60', '6 teléfonos pendientes de periciar', '', '1', '2019-09-09 20:48:31', '2019-09-11 19:49:23', '1', '5', '2', '1');
INSERT INTO `peritajes` VALUES ('89', '1700145769-1', '2017-04-04', '', '60', 'Se vaciaron 3 teléfonos celulares.', '', '1', '2019-09-09 20:51:36', '2019-09-11 20:11:35', '1', '7', '2', '4');
INSERT INTO `peritajes` VALUES ('90', '1600943875-4', '2017-04-04', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-09 21:11:03', '2019-09-11 20:10:51', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('91', '1700256337-1', '2017-01-02', '', '60', '1 teléfono en poder de la víctima', '', '1', '2019-09-11 19:59:04', '2019-09-11 19:59:04', '1', '5', '2', '1');
INSERT INTO `peritajes` VALUES ('92', '1500478991-9', '2017-01-02', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-11 20:05:17', '2019-09-11 20:05:17', '1', '41', '2', '4');
INSERT INTO `peritajes` VALUES ('93', '1700345655-2', '2017-01-02', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-11 20:08:43', '2019-09-11 20:15:22', '1', '36', '1', '4');
INSERT INTO `peritajes` VALUES ('94', '1600943875-4', '2017-01-02', '', '60', 'Se vació un teléfono celular y pericia computador.', '', '1', '2019-09-11 20:37:04', '2019-09-11 20:37:04', '1', '1', '1', '4');
INSERT INTO `peritajes` VALUES ('95', '1700523910-9', '2017-01-02', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-11 20:39:10', '2019-09-11 20:39:10', '1', '1', '1', '1');
INSERT INTO `peritajes` VALUES ('96', '1700253218-2', '2017-01-02', '', '60', 'Pericia a computadores (Proyecto Ana Frank del Sename)', '', '1', '2019-09-11 20:42:01', '2019-09-11 20:42:01', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('97', '1700253218-2', '2017-01-02', '', '60', 'Pericia a computador imputado, (relacionado a proyecto Ana Frank del Sename)', '', '1', '2019-09-11 20:44:06', '2019-09-11 20:44:06', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('98', '1700253218-2', '2017-01-02', 'NUE 4341051 / RUE 3122479-9', '60', 'Se pericia un computador  (proyecto Ana Frank del Sename)', '', '1', '2019-09-12 13:46:07', '2019-09-12 15:28:41', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('99', '1700253218-2', '2018-01-02', '', '60', 'Pendrive Proyecto Ana Frank del Sename.', '', '1', '2019-09-12 15:26:38', '2019-09-12 15:26:38', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('100', '1700253218-2', '2017-01-02', '', '60', 'Pericia a Disco duro Poyecto Ana Frank del Sename', '', '1', '2019-09-12 15:32:40', '2019-09-12 15:32:40', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('101', '1700253218-2', '2017-01-02', '', '60', 'Pericia a computadores proyecto Ana Frank del Sename', '', '1', '2019-09-12 20:16:04', '2019-09-12 20:16:04', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('102', '1700253218-2', '2017-01-02', '', '60', 'Pericia a computadores proyecto Ana Frank del Sename', '', '1', '2019-09-12 20:17:53', '2019-09-12 20:17:53', '1', '5', '1', '4');
INSERT INTO `peritajes` VALUES ('103', '1700591842-1', '2017-01-02', '', '60', 'Se vació un teléfono celular.', '', '1', '2019-09-12 21:00:51', '2019-09-12 21:00:51', '1', '67', '2', '4');
INSERT INTO `peritajes` VALUES ('104', '1900269168-2', '2019-09-03', '', '30', 'Junto con saludarte, adjunto solicitud de pericia en causa Ruc 1900269168-2 y actas voluntarias. \nEs un microtráfico, y estimo necesario rescatar una conversación por redes sociales ofreciendo droga, por cada imputado, para probar participación e ilícito.\nMuchas gracias.', '', '1', '2019-09-23 19:43:18', '2019-09-23 19:43:18', '1', '6', '1', '1');
INSERT INTO `peritajes` VALUES ('105', '1900997833-2', '2019-09-23', '5925783', '30', 'Solicita Vaciado en causa ABUSO SEX. S/CONTACTO CORP. MENOR 14 ART 366 QUAT. INC 1 Y 2 , Profesor Colegio RUKALAF, Las compañias', '', '1', '2019-09-23 19:45:51', '2019-10-09 16:28:24', '1', '6', '1', '2');
INSERT INTO `peritajes` VALUES ('106', '1900335441-8', '2019-09-09', '', '60', 'Realizar examen pericial a teléfono celular de la víctima y entregado voluntariamente por la denunciante, correspondiente a un teléfono celular marca Huawei, modelo CAM-203, color dorado con pantalla trizada y sin contraseña de acceso. Indagar mensajería WS, existencia de archivos, fotografías, videos, conversaciones, imágenes, contactos, investigar al contacto llamado “Tito”, recuperar conversaciones y envío de imágenes y/o videos de fecha 31-12-2018 y que digan relación con temas de índole sexual.\r\n          Indagar aplicación ANIME AMINO, el grupo de nombre ANIME FNAFHS, donde estaría registrado el imputado identificado como “Tito” cuyo nombre real sería “Gustavo” y quien sería el que solicitó video a víctima el 31-12-2018.', '', '1', '2019-09-23 19:47:42', '2021-02-04 00:00:00', '1', '3', '1', '2');
INSERT INTO `peritajes` VALUES ('107', '1700770798-3', '2017-01-02', '2562119', '60', 'Vaciado un teléfono celular', '', '1', '2019-09-27 19:36:38', '2019-09-27 19:36:38', '1', '5', '2', '1');
INSERT INTO `peritajes` VALUES ('108', '1500478991-9', '2017-01-02', '2146085', '60', 'Vaciado de un teléfono celular', '', '1', '2019-09-27 19:39:27', '2019-09-27 19:39:27', '1', '41', '1', '4');
INSERT INTO `peritajes` VALUES ('109', '1710013581-7', '2017-01-02', '4346143', '60', 'Vaciado un teléfono celular', '', '1', '2019-09-27 19:41:29', '2019-09-27 19:41:29', '1', '1', '1', '4');
INSERT INTO `peritajes` VALUES ('110', '1700764316-0', '2017-01-02', '5050162 -  5050165', '60', 'Vaciado de teléfonos celulares', '', '1', '2019-09-27 19:44:16', '2019-09-27 19:44:16', '1', '67', '1', '4');
INSERT INTO `peritajes` VALUES ('111', '1700965100-4', '2017-01-02', '3232332-4  /  3230525-3', '60', 'Vaciado de 3 equipos  celulares', '', '1', '2019-09-27 19:46:53', '2019-09-27 19:46:53', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('112', '1700278036-4', '2017-01-02', '', '60', 'Vaciado de teléfono celular', '', '1', '2019-09-27 19:48:42', '2019-09-27 19:48:42', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('113', '1700605759-4', '2017-01-02', '4485018', '60', '', '', '1', '2019-09-27 19:51:11', '2019-09-27 19:51:11', '1', '1', '1', '4');
INSERT INTO `peritajes` VALUES ('114', '1700462912-4', '2017-01-02', '', '60', '', '', '1', '2019-09-27 19:52:52', '2019-09-27 19:52:52', '1', '24', '1', '4');
INSERT INTO `peritajes` VALUES ('115', '1701209066-8', '2018-01-02', '3177105', '60', 'Vaciado equipo telefónico', '', '1', '2019-09-27 19:55:15', '2019-09-27 19:55:15', '1', '23', '2', '4');
INSERT INTO `peritajes` VALUES ('116', '1701239238-9', '2018-01-02', '2562175', '60', 'Vaciado de equipo telefónico', '', '1', '2019-09-27 19:56:48', '2019-09-27 19:56:48', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('117', '1900283135-2', '2019-10-02', '5925770', '30', 'Con fecha 13/03/2019 doña Romina Aguilera Peralta, rut 18.177.716-8 denuncia que el día 09 de marzo su madre doña Mónica Peralta Trujillo se encontró un teléfono celular en un colectivo de la línea 29 y al revisarlo para poder devolverlo revisa los mensajes de whatsapp y se puede percatar que habían conversaciones de abusos sexuales realizados a menores de edad y ahí se percata que la dueña del teléfono sería una mujer quien contaba que estaba abusando sexualmente de su sobrino y que el sujeto con el cual conversaba de nombre “Raúl” le confesaba que también había abusado de unas sobrinas y que tenía muchas ganas de abusar sexualmente de otra sobrina, lo que deseaba concretar en los próximos días.\nLa denunciante declara que las conversaciones que pudo leer la mujer dueña del teléfono le contaba que ya había llegado la hora de acostarse a dormir con un sobrino y que estaba esperando que éste último se durmiera y le mandaba fotos del niñito mientras estaba acostado en la cama y ella decía que estaba esperando la madrugada para abusar de él y ahí Raúl le contestaba diciendo que tenía que esperar hasta que su sobrino estuviera bien dormido para empezar a realizar el acto. A las 2 o 3 horas de la mañana, ella le contaba todo lo que hacía el niñito, Raúl le preguntaba si lo había masturbado y ella le contestaba que sí, y mucho y Raúl le preguntaba textualmente: se le paro? Y ella le decía que sí y él replicaba preguntando cuanto tiempo había durado la masturbación y que si le había gustado al niñito e incluso si se lo había chupado y ella respondía sacándole fotos al niñito. La denunciante acompaña fotografías de pantallazos de las conversaciones de whatsapp que logró obtener del teléfono.\n\nPor lo tanto, atendido el tenor de los mensajes denunciados y que se requiere con urgencia determinar qué niños estarían siendo abusados sexualmente se solicita esta pericia con carácter de urgente.', '', '1', '2019-10-02 14:06:25', '2019-10-07 16:08:02', '1', '1', '2', '4');
INSERT INTO `peritajes` VALUES ('119', '1900857204-9', '2019-10-09', '5926212', '30', 'Causa Formalizada. por Homicidio\n MANIFESTANDO QUE SU HERMANO VLADIMIR ENRIQUE ROJAS CASTILLO, HABÍA SIDO TRASLADADO POR SU MADRE Y SU PAREJA (LA DE GÉNESIS) HASTA EL CUARTEL DE LA P.D.I OVALLE PARA ENTREGARLO COMO AUTOR DEL DELITO. \nTELEFONO LG Y SAMSUNG, AMBOS CON PATRON DE BLOQUEO', '', '1', '2019-10-09 15:34:53', '2019-10-09 15:35:16', '1', '2', '1', '1');
INSERT INTO `peritajes` VALUES ('120', '1900244188-0', '2019-09-30', '1910006', '30', 'iphone negro con pin de bloqueo \r\n\"Con fecha 02/03/2019 la victima don Felipe Pasten Muñoz, rut 18.758.615-1 se encontraba compartiendo con amigos en el bar de nombre “Bronx” ubicado en calle Cienfuegos N° 696, La Serena y al momento de salir del local se ve envuelto en una riña con desconocidos, dónde uno de ellos lo apuñala causando trauma abdominal penetrante y trauma toráxico por arma blanca, dándose a la fuga del lugar, momento en el cual al imputado se le cae su teléfono celular el cual es entregado a carabineros\".', '', '1', '2019-10-09 15:51:34', '2020-09-04 00:00:00', '1', '4', '1', '6');
INSERT INTO `peritajes` VALUES ('121', '1100308068-6', '2019-08-01', '2172195', '30', '01 TELEFONO bLACKbERRY, MODELO CURVE\n01 TELEFONO bLACKbERRY, MODELO 9620\n01 TELEFONO bLACKbERRY, MODELO 8120\n01 TELEFONO SAMSUNG GT-19505', '', '1', '2019-10-09 15:59:16', '2019-10-09 15:59:16', '1', '71', '1', '2');
INSERT INTO `peritajes` VALUES ('122', '1900997833-2', '2019-09-16', '5925783', '30', 'Abuso sexual menor de 14 años, telefoono HUAWEI Negro DRA-LX3. NUE 5925783, Imputado Jose Ariel Salinas Martinez.\r\nhttp://opalix:8080/desa/safito_old/resultado_get.php?ruc=1900997833-2', '', '1', '2019-10-09 16:04:25', '2021-02-04 00:00:00', '1', '6', '1', '2');
INSERT INTO `peritajes` VALUES ('123', '1900571709-7', '2019-11-30', '5926709', '30', 'obstruccion a la justicia\r\nTelefono Huawei Dorado con blanco, entrega voluntaria. Solicitado por Cristian Arcos.', '', '1', '2019-10-09 16:10:52', '2020-06-12 00:00:00', '1', '18', '1', '1');
INSERT INTO `peritajes` VALUES ('124', '1900558518-2', '2019-09-22', '3653811', '30', 'MicroTrafico.', '', '1', '2019-10-09 16:24:06', '2021-02-04 00:00:00', '1', '66', '1', '4');
INSERT INTO `peritajes` VALUES ('125', '1900400713-4', '2019-10-09', '1669716', '60', 'PRODUCCION DE MATERIAL PORNOGRAFICO , telefono samsung modelo s7,INCAUTADO A IMPUTADO BENITO MORALES VICENCIO.\r\nENVIADO POR CRISTIAN GUZMAN\r\n\r\nVaciado fue comunicado mediante correo electronico del dia martes 07-04-2020 9:31 a Carol Gómez Osorio <cgomezo@minpublico.cl>', '', '1', '2019-10-09 18:05:40', '2020-09-04 00:00:00', '1', '15', '1', '4');
INSERT INTO `peritajes` VALUES ('126', '1900504455-6', '2019-10-02', '596221-5926222-59626223', '60', 'solicita revision de 2 telefonos celulares  SAMSUNG   Y 1 HUAWEI (ANTERIORMENTE REVISADOS POR FERNANDO HERRERA)', '', '1', '2019-10-09 18:41:03', '2021-02-04 00:00:00', '1', '29', '1', '2');
INSERT INTO `peritajes` VALUES ('127', '1900954354-9', '2019-09-27', '3653095', '60', 'Recptacion, causa SACFI,  1 celular marca motorola azul y un celular pantalla trizada marca samsung.\r\nSe realiza intento con Mobiledit y UFED sin resultados por bloqueo de patrón/pin.\r\n\r\nTermina por simplificado, queda para retiro', '', '1', '2019-10-09 18:59:48', '2021-06-30 00:00:00', '1', '16', '1', '6');
INSERT INTO `peritajes` VALUES ('128', '1900641816-6', '2019-10-09', '5926272', '30', 'HOMICIDIO,  17657621-9	CARLOS ANDRES BALDOVINO BELLO	CALLE INDEPENDENCIA No. 0135, ILLAPEL		14/09/1999, \r\nSe solicita el vaciado del telefono para  obtener Whatsapp, registro de llamados.', '', '1', '2019-10-11 14:50:07', '2021-02-04 00:00:00', '1', '13', '1', '6');
INSERT INTO `peritajes` VALUES ('129', '1901084968-6', '2019-10-10', '5926874', '30', 'Solicita vaciado.\nEN RELACIÓN A LA DENUNCIA POR PRESUNTA DESGRACIA QUE VENGO A REALIZAR EN FAVOR DE MI PAREJA MANUEL RICARDO PÉREZ GUTIERREZ, DEBO SEÑALAR LO SIGUIENTE\': EL DÍA 23.AGO.019, SIENDO LAS 18:00 HORAS, MI PAREJA SALIÓ DE LA CASA PARA REALIZAR UN VIAJE A LA CIUDAD DE CALAMA, JUNTO A DOS CONOCIDOS DE ÉL, UNO DE NOMBRE WALTERID EDUARDO NÚÑEZ SALAS, CÉDULA DE IDENTIDAD N\' 12.941.985-7 Y EL OTRO DE NOMBRE JUAN CARLOS, DESCONOZCO SUS APELLIDOS. LO ANTERIOR CON FINALIDAD DE VIAJAR PARA ARGENTINA, PARA IR A REPARAR UN VEHÍCULO DE PROPIEDAD DE JUAN CARLOS, EL CUAL SE ENCONTRABA AVERIADO EN EL MENCIONADO PAis-', '', '1', '2019-10-11 14:57:11', '2019-10-11 14:57:11', '1', '12', '1', '1');
INSERT INTO `peritajes` VALUES ('130', '1901084968-6', '2019-11-04', '5926874', '30', 'Vaciado de equipo telefónico', '', '1', '2019-11-07 15:17:39', '2019-11-07 15:17:39', '1', '12', '2', '2');
INSERT INTO `peritajes` VALUES ('131', '1900943146-5', '2019-10-24', '5926870', '30', 'Reeemplazo panrtalla y vaciado equipo LG-K8 353744084103098', '', '1', '2019-11-07 16:22:10', '2019-11-07 16:22:10', '1', '3', '2', '2');
INSERT INTO `peritajes` VALUES ('132', '1901088519-4', '2019-11-18', '1670964/1687400/1670965', '30', 'VACIADO DE 3 CELULARES WOM FUN7  PANTALLA QUEBRADA , SAMSUNG, SONY XPERIA', '', '1', '2019-11-19 15:58:55', '2021-02-04 00:00:00', '1', '16', '1', '6');
INSERT INTO `peritajes` VALUES ('133', '1901088519-4', '2019-10-30', '5216647', '30', 'Junto con saludar en la presente investigación por el delito de porte de elementos destinados a cometer robos, en contexto del foco investigativo gatos 2019, se formalizó la investigación en contra de los imputados EDISON EDUARDO SANTANR ESTAY, CARLOS FERNANDO ROJAS CISTERNAS e IGNACIO ANTONIO ARDILES VERGARA quienes a bordo del vehículo PPU: HGDP.96 portaban diversas herramientas y elementos usadas comúnmente para cometer robos y especialmente los seguros y candados de los camiones  y semirremolques en la ruta.  \n\nSucede que dicho vehículo pertenece a PABLO VALDIVIESO VASQUEZ, quien en la Fiscalía y ante el suscrito, declaró conocer a SANTANDER ESTAY  solo en virtud de arrendarle a este dicho vehículo para que lo trabajara en BEAT pero desconociendo sus andanzas, para corroborar la veracidad de sus dichos autorizó expresamente a que se revise el contenido de su teléfono celular y aplicaciones que este contenga, donde tendría respaldo de conversaciones sostenidas con el blanco, fotografías, etc, lo anterior es muy importante por que SANTANDER ESTAY y los otros dos coimputados son blancos activos como una banda que opera en la ruta 5 robando carga de camiones, y esperamos con la información que se pueda obtener del análisis del teléfono, encontrar insumos útiles en la persecución de esa banda como por ejemplo los teléfonos  de SANTANDER ESTAY.', '', '1', '2019-11-30 13:53:37', '2019-11-30 13:53:37', '1', '30', '2', '2');
INSERT INTO `peritajes` VALUES ('134', '1900783209-8', '2019-12-04', '5926871', '30', 'LESIONES CON ARMA  	/Solicita Vaciado Equipo  P20Lite', '', '1', '2019-12-04 12:30:21', '2020-09-04 00:00:00', '1', '28', '1', '6');
INSERT INTO `peritajes` VALUES ('135', '1901289646-0', '2019-11-30', '5925401', '30', 'Incendio y Daños,el incendio y robo acaecido el 26/11/2019, en el Hotel Costa Real se solicita la extracción de Vídeos de cámaras de seguridad de DVR  Sin Marca, Gris de 16 Canales.', '', '1', '2019-12-04 12:37:17', '2019-12-04 12:37:17', '1', '67', '1', '2');
INSERT INTO `peritajes` VALUES ('136', '1901248790-0', '2019-11-30', '5926910 / 5925399', '30', 'A solicitud del Fiscal Regional, se recepciona 2 DVR  para realizar adquisición  de archivos de grabación cámaras de seguridad,  DVR de SEremi de desarrollo social y DVR Compin La Serena.Incendio y Daños,el incendio y robo acaecido el 26/11/2019,', '', '1', '2019-12-04 12:57:46', '2019-12-04 12:57:46', '1', '67', '1', '2');
INSERT INTO `peritajes` VALUES ('137', '1901289646-0', '2019-11-29', '5925401', '30', 'Incendio y Daños,el incendio y robo acaecido el 26/11/2019, en el  SEREMI  de educación, se solicita la extracción de Vídeos de cámaras de seguridad de DVR Sin Marca, Gris de 16 Canales', '', '1', '2019-12-04 13:01:08', '2019-12-04 13:01:08', '1', '67', '1', '2');
INSERT INTO `peritajes` VALUES ('138', '1900839785-9', '2019-10-31', '5926742', '30', 'Se solicita realizar Vaciado Celular', '', '1', '2019-12-04 13:06:30', '2019-12-04 13:06:30', '1', '29', '1', '1');
INSERT INTO `peritajes` VALUES ('139', '1901275713-4', '2019-12-04', '1918241', '30', 'En el contexto de crisis social, específicamente en las instalaciones del la Seremia de Desasarrollo Social y Supermecado Acuenta de las compañías y Cajero de Banco Estado. , solicita el vaciado de 2 Teléfonos celulares  (huawei Blanco y Samsung Color negro)\r\n\r\ninforme entregado mediante email el día martes 07-01-2020 14:30', '', '1', '2019-12-04 13:14:33', '2021-02-04 00:00:00', '1', '34', '1', '4');
INSERT INTO `peritajes` VALUES ('141', '1910064065-4', '2019-12-16', '---', '30', 'RUC 1910064065-4, por apremios ilegítimos, requiero vaciar el celular, marca  Iphone, número 9-63053554,  de la víctima María Ignacia Fredes Ardiles, diligencia que solicité  la llevara a cabo Fernando Herrera, quien ya tiene en su poder el celular, atendido que la víctima pasara por él, en un rato más.', '', '1', '2019-12-17 14:05:29', '2019-12-17 14:05:29', '1', '1', '2', '2');
INSERT INTO `peritajes` VALUES ('142', '1801293805-1', '2019-03-01', '', '30', 'Junto con saludar,solicito, “Pericia  Informática Forense” mediante la cual se extraiga información y contenido del teléfono celular marca Alcatel modelo One Touch Pixi, que tiene 02 IMEI: 357018066127896 y 357018066127912, y su chip WOM n° 89560900000 159774577.\r\nHago presente que el Juzgado de Garantía con fecha 06.02.2019 autorizó dicha diligencia. \r\nPara dichos fines, por favor contactarse con custodia.', '', '1', '2020-01-07 21:46:35', '2021-02-04 00:00:00', '1', '12', '1', '6');
INSERT INTO `peritajes` VALUES ('143', '1900142246-7', '2019-06-12', '', '30', 'Se solicita la revision de computadores, camara y telefono celular', '', '1', '2020-01-07 21:48:57', '2020-01-07 21:48:57', '1', '26', '1', '2');
INSERT INTO `peritajes` VALUES ('144', '1900857204-9', '2019-10-13', '', '30', 'Solicita vaciado de las llamadas entrantes y salientes del teléfono de la referida victima fallecida del día 11 de Agosto de 2019 y del imputado formalizado, Vladimir Enrique Rojas Castillo, Cedula de Identidad N° 14.523.753-K, en ambos casos desde el día 01 de Julio hasta el mismo día 11 de Agosto de 2019, así como también los WhatsApp entrantes y salientes de los días señalados y de cualquier otra forma de comunicación desde los aparatos telefónicos señalados ya sea entre si y/o con otras personas.', '', '1', '2020-01-07 21:50:45', '2020-01-07 21:50:45', '1', '2', '1', '2');
INSERT INTO `peritajes` VALUES ('145', '1900807988-1', '2020-01-07', '', '30', 'Solicita vaciado telefónico\r\nSM-G318 (MT', '', '1', '2020-01-07 21:54:38', '2021-02-04 00:00:00', '1', '14', '1', '2');
INSERT INTO `peritajes` VALUES ('146', '1800486941-5', '2019-10-02', '', '30', 'En causa RUC 1800486941-5, solicitamos aprobar la realización de pericia a los equipos indicados de acuerdo a la solicitud adjunta.\nAtenta a tus comentarios.\nLady Dubo Sunkel', '', '1', '2020-01-07 22:00:24', '2020-01-07 22:00:24', '1', '71', '1', '2');
INSERT INTO `peritajes` VALUES ('147', '1910034747-7', '2019-08-26', '', '30', '1.	Efectuar un peritaje telefónico con el aparato celular aportado por la madre de la víctima y que se encuentra en custodia de esta fiscalía correspondiente a un teléfono celular marca Samsung, para obtener desde aquel equipo todas las imágenes de contenido sexual que digan relación con menores de edad.', '', '1', '2020-01-07 22:05:25', '2020-01-07 22:05:25', '1', '3', '1', '2');
INSERT INTO `peritajes` VALUES ('149', '1910054143-5', '2019-11-12', '2172069', '30', 'Solicita extraer información de tarjetas camaras gopro y camara fotografica Testigo Waldo Correa', '', '1', '2020-01-07 22:17:32', '2020-01-07 22:17:32', '1', '24', '1', '2');
INSERT INTO `peritajes` VALUES ('150', '1901045248-4', '2019-10-06', '', '30', 'Telefono LDN-LX3 Chip Wom.\r\nCierre Invst- Abreviado', '', '1', '2020-01-07 22:19:08', '2021-02-04 00:00:00', '1', '44', '1', '2');
INSERT INTO `peritajes` VALUES ('151', '1810055471-9', '2019-12-16', '2146004', '10', 'vaciado forense de dos computadores del  MINVU', '', '1', '2020-01-08 11:47:49', '2020-01-08 11:47:49', '1', '5', '2', '2');
INSERT INTO `peritajes` VALUES ('152', '1800369146-9', '2019-01-03', 'No Aplica', '30', 'solicitamos periciar tráficos de llamados del imputado Cristian Ojeda, a fin de vincularlo geográficamente con las respectivas antenas de celular, a los sitios del suceso indicados en tráficos', '', '1', '2020-01-08 12:28:53', '2020-01-08 12:28:53', '1', '67', '2', '4');
INSERT INTO `peritajes` VALUES ('153', '1801231060-5', '2020-01-08', '', '30', 'Con fecha  28.05.19,  el J de G de La Serena autorizó la diligencia de tráfico de llamado de los 2 celulares solicitados en la presentación referida (vaciados de contenido ya autorizado con antelación por el imputado Roberto Concha García y judicialmente por el otro imputado Dixon Villanueva Riveros con fecha de 17.05.19 y tráfico de llamados, referente a esta presentación, de ayer 28.05.19), conforme correo que anteriormente te había enviado para informarte la posibilidad de realizar dicha pericia y la que fue evaluada positivamente por ti en  la respuesta enviada. Ahora, sólo nos restaría que nuestro amigo y colega Fernando Herrera en su fecha programada a la FN pueda llevar los celulares incautados parea realizar la pericia respectiva', '', '1', '2020-01-08 12:51:40', '2020-01-08 12:51:40', '1', '34', '2', '4');
INSERT INTO `peritajes` VALUES ('154', '1910056776-0', '2020-01-10', '3864366/5216664/5216665/5216666', '30', 'solicita vaciado de 4 telefonos celulares, de carabineros, se entrega patron desdesbloqueo', '', '1', '2020-01-24 14:45:12', '2020-09-04 00:00:00', '1', '15', '1', '4');
INSERT INTO `peritajes` VALUES ('155', '1800173601-5', '2018-01-02', '5050839', '60', 'Vaciado a 1 teléfono celular', '', '1', '2020-02-14 12:44:45', '2020-02-14 12:44:45', '1', '4', '2', '4');
INSERT INTO `peritajes` VALUES ('156', '1700508894-1', '2017-01-02', '2168681', null, 'Vaciado de 1  equipo telefónico', '', '1', '2020-02-14 12:49:40', '2020-02-14 12:49:40', '1', '11', '1', '4');
INSERT INTO `peritajes` VALUES ('157', '1700272452-9', '2018-01-02', '', '60', 'Vaciado de Pendrive', '', '1', '2020-02-14 14:35:16', '2020-02-14 14:35:16', '1', '13', '1', '4');
INSERT INTO `peritajes` VALUES ('158', '1700465638-5', '2018-01-02', '4341062', '60', 'Revisión de acceso a Servidor', '', '1', '2020-02-18 14:11:17', '2020-02-18 14:11:17', '1', '71', '1', '4');
INSERT INTO `peritajes` VALUES ('160', '1601236128-2', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-18 14:23:40', '2020-02-18 14:23:40', '1', '26', '2', '4');
INSERT INTO `peritajes` VALUES ('161', '1501045409-0', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico.', '', '1', '2020-02-18 14:28:17', '2020-02-18 14:28:17', '1', '41', '1', '4');
INSERT INTO `peritajes` VALUES ('162', '1800160228-0', '2018-01-02', '2562178', '60', 'Vaciado de 1 equipo telefónico.', '', '1', '2020-02-18 14:50:27', '2020-02-18 14:50:27', '1', '29', '2', '4');
INSERT INTO `peritajes` VALUES ('163', '1800312735-0', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico.', '', '1', '2020-02-18 14:56:44', '2020-02-18 14:56:44', '1', '28', '1', '4');
INSERT INTO `peritajes` VALUES ('164', '1800550855-6', '2018-01-02', '5050757', '60', 'Vaciado de 1 equipo telefónico.', '', '1', '2020-02-18 14:59:37', '2020-02-18 14:59:37', '1', '29', '2', '4');
INSERT INTO `peritajes` VALUES ('165', '1800393080-3', '2018-01-02', '1667103', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-19 13:49:23', '2020-02-19 13:49:23', '1', '26', '2', '4');
INSERT INTO `peritajes` VALUES ('166', '180056837-8', '2018-01-02', '5050832', '60', 'Vaciado a 1 equipo telefónico', '', '1', '2020-02-19 13:55:53', '2021-02-04 00:00:00', '1', '2', '1', '4');
INSERT INTO `peritajes` VALUES ('167', '1800377564-6', '2018-01-02', '3121746', '60', 'Vaciado a 1 equipo telefónico', '', '1', '2020-02-19 14:02:02', '2020-02-19 14:02:02', '1', '71', '1', '4');
INSERT INTO `peritajes` VALUES ('168', '1800633442-K', '2018-01-02', '', '60', 'Vaciado a 1 equipo telefónico', '', '1', '2020-02-19 19:14:21', '2020-02-19 19:14:21', '1', '71', '1', '4');
INSERT INTO `peritajes` VALUES ('169', '1800633442-K', '2018-01-02', '', '60', 'Vaciado de 1 equipo celular', '', '1', '2020-02-20 12:54:42', '2020-02-20 12:54:42', '1', '71', '1', '4');
INSERT INTO `peritajes` VALUES ('170', '1800438039-4', '2018-01-02', '5079515', '60', 'Vaciado a 1 equipo telefónico', '', '1', '2020-02-20 12:59:57', '2020-09-04 00:00:00', '1', '41', '1', '4');
INSERT INTO `peritajes` VALUES ('171', '1800626671-8', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-24 19:18:08', '2020-02-24 19:18:08', '1', '29', '2', '4');
INSERT INTO `peritajes` VALUES ('172', '180173601-5', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-24 19:19:31', '2020-02-24 19:19:31', '1', '4', '2', '4');
INSERT INTO `peritajes` VALUES ('173', '1800549627-2', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-24 20:21:06', '2020-02-24 20:21:06', '1', '28', '1', '4');
INSERT INTO `peritajes` VALUES ('174', '1800674595-0', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-25 13:35:19', '2020-02-25 13:35:19', '1', '69', '2', '4');
INSERT INTO `peritajes` VALUES ('175', '1800160837-8', '2018-01-02', '5050832', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-25 14:56:34', '2020-09-04 00:00:00', '1', '2', '1', '4');
INSERT INTO `peritajes` VALUES ('176', '1800670671-8', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-25 14:58:14', '2020-02-25 14:58:14', '1', '39', '2', '4');
INSERT INTO `peritajes` VALUES ('177', '1700178613-K', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-25 15:00:32', '2020-02-25 15:00:32', '1', '34', '2', '4');
INSERT INTO `peritajes` VALUES ('178', '1701191260-5', '2018-01-02', '2562167', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-25 15:57:38', '2020-02-25 15:57:38', '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('179', '1800852454-4', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-27 12:39:36', '2020-02-27 12:39:36', '1', '11', '1', '4');
INSERT INTO `peritajes` VALUES ('180', '1700888726-8', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-27 12:41:46', '2020-02-27 12:41:46', '1', '71', '1', '4');
INSERT INTO `peritajes` VALUES ('181', '1701208463-3', '2018-01-02', '', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-02-27 12:43:22', '2020-02-27 12:43:22', '1', '39', '1', '4');
INSERT INTO `peritajes` VALUES ('182', '1800787532-7', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico. Se aplica DNP', '', '1', '2020-02-27 13:15:43', '2021-02-04 00:00:00', '1', '69', '1', '4');
INSERT INTO `peritajes` VALUES ('183', '1800693407-9', '2018-01-02', '', '60', 'Vaciado a 1 teléfono celular', '', '1', '2020-02-27 13:22:37', '2021-02-04 00:00:00', '1', '17', '1', '4');
INSERT INTO `peritajes` VALUES ('184', '1800922533-8', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-27 15:28:19', '2020-02-27 15:28:19', '1', '29', '1', '4');
INSERT INTO `peritajes` VALUES ('185', '1800944601-6', '2018-01-02', '', '60', 'Vaciado de  3 equipos telefónicos', '', '1', '2020-02-27 15:30:55', '2020-02-27 15:30:55', '1', '1', '2', '4');
INSERT INTO `peritajes` VALUES ('186', '1810005584-4', '2019-01-02', '1929735', '60', 'Vaciado de 1 equipo telefónico\r\n, se solicita la revisión de un teléfono celular, para vaciado y revisión de redes sociales. El teléfono es de una persona fallecida y el padre es quien entregó voluntariamente el equipo para su revisión. \r\nLa víctima fue atropellada en Tongoy y la familia estima puede haber sido un homicidio. La idea es recabar cualquier información que diga relación con esta última hipótesis. (por ejemplo, algún mensaje de whatsapp previo a su muerte -06-01-2018-, etc).', '', '1', '2020-02-27 15:58:05', '2020-09-04 00:00:00', '1', '6', '1', '4');
INSERT INTO `peritajes` VALUES ('187', '1801241075-8', '2019-01-02', '3121648', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-27 15:59:56', '2020-02-27 15:59:56', '1', '10', '1', '4');
INSERT INTO `peritajes` VALUES ('188', '1800944601-6', '2018-01-02', '', '60', 'Vaciado de 3 equipos telefónicos', '', '1', '2020-02-27 21:16:42', '2020-02-27 21:16:42', '1', '1', '2', '4');
INSERT INTO `peritajes` VALUES ('189', '1800965490-5', '2018-01-02', '4562061', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-27 21:18:06', '2020-02-27 21:18:06', '1', '1', '2', '4');
INSERT INTO `peritajes` VALUES ('190', '1700888726-8', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-02-27 21:20:18', '2020-02-27 21:20:18', '1', '12', '1', '4');
INSERT INTO `peritajes` VALUES ('191', '1701208463-3', '2018-01-02', '', '60', 'Vaciado de 1 equipo telefónico, 2 tarjetas sim', '', '1', '2020-02-27 21:22:35', '2020-02-27 21:22:35', '1', '39', '2', '4');
INSERT INTO `peritajes` VALUES ('192', '1901289646-0', '2020-02-20', 'N-A', null, 'En relación a la causa RUC N° 1901289646-0, que lleva a cabo la Fiscalía de Análisis Criminal por los delitos de robo e incendio del Hotel Costa Real de La Serena, por el presente correo adjunto solicitud con formulario correspondiente, para efectos se pueda realizar una pericia a fin de georreferenciar teléfonos conforme a tráfico de llamados y datos que hemos obtenido mediante resolución judicial.', '', '1', '2020-03-02 13:33:44', '2020-03-02 13:33:44', '1', '39', '2', '3');
INSERT INTO `peritajes` VALUES ('194', '1900895563-0', '2020-08-03', '597261', '30', 'Solicita Vaciado de 3 equipos celulares: SM-j200M Color NEgro, Simcard Claro. SM700M, SM710MN Color Negro y  SMA20 Carcasa Rosada', '', '1', '2020-03-13 00:00:00', '2020-06-12 00:00:00', '1', '29', '1', '1');
INSERT INTO `peritajes` VALUES ('195', '1900943146-5', '2019-09-13', '2172193', '30', 'Telofono  Own Fun, entregado por Genderarmeria-.', '', '1', '2020-03-13 00:00:00', '2020-09-04 00:00:00', '1', '1', '1', '2');
INSERT INTO `peritajes` VALUES ('196', '1901308739-6', '2019-12-30', '5927142', '30', 'Solicita vaciado de 3 celulares (2 huawei y 1 samsung) \r\nEquipos con pantalla dañada, se solicita cambio de pantalla de estos equipos.', '', '1', '2020-03-13 00:00:00', '2020-09-04 00:00:00', '1', '11', '1', '6');
INSERT INTO `peritajes` VALUES ('197', '1901165049-2', '2019-12-30', '4561689', '30', 'Solicita Vaciado, causa desordenes públicos.', '', '1', '2020-03-13 00:00:00', '2021-02-04 00:00:00', '1', '12', '1', '2');
INSERT INTO `peritajes` VALUES ('198', '2000019392-6', '2020-03-02', '5925806', '30', 'Solicita vaciado telefono', '', '1', '2020-03-13 00:00:00', '2020-09-04 00:00:00', '1', '29', '1', '2');
INSERT INTO `peritajes` VALUES ('199', '1901360908-2', '2020-04-02', '5216268', '30', 'Buenas noches en causa RUC 1901360908-2 se solicita vaciado de teléfono respecto de imputado menor de edad que comete el delito de violación respecto de su hermanastro menor de edad y que graba dicha situación, se cuenta con autorización judicial para el vaciado respectivo y la causa no se encuentra judicializada, se adjunta autorización judicial y formato de solicitud de pericia. \r\nEn particular se solicita obtener el video de la violación y otros videos respecto de la misma víctima  o material pornográfico respecto de menores de edad que puedan estar contenidos en el teléfono\r\n', '', '1', '2020-04-02 00:00:00', '2021-02-04 00:00:00', '1', '26', '1', '2');
INSERT INTO `peritajes` VALUES ('200', '1800369146-9', '2019-01-02', '', '60', 'Georeferenciar  tráfico de llamadas', '', '1', '2020-04-08 22:55:47', '2020-04-08 22:55:47', '1', '67', '2', '4');
INSERT INTO `peritajes` VALUES ('201', '1801231060-5', '2019-01-02', '5202661', '60', 'Vaciado de 2 teléfonos celulares', '', '1', '2020-04-08 23:06:37', '2020-04-08 23:06:37', '1', '28', '2', '1');
INSERT INTO `peritajes` VALUES ('202', '1800723535-2', '2019-01-02', '5079381', '60', 'Vaciado de 1 teléfonos celular', '', '1', '2020-04-08 23:10:38', '2020-04-08 23:10:38', '1', '5', '2', '1');
INSERT INTO `peritajes` VALUES ('203', '1701191260-5', '2019-01-02', '2562167', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-04-08 23:14:47', '2020-04-08 23:14:47', '1', '24', '2', '4');
INSERT INTO `peritajes` VALUES ('204', '1800526938-1', '2019-01-02', '1929734', '60', 'Vaciado de 1 teléfono celular', '', '1', '2020-04-08 23:19:22', '2020-04-08 23:19:22', '1', '11', '2', '2');
INSERT INTO `peritajes` VALUES ('205', '1801125018-8', '2019-01-02', '5202704', '60', 'Vaciado de 3 equipos telefónicos', '', '1', '2020-04-08 23:25:00', '2020-04-08 23:25:00', '1', '26', '2', '2');
INSERT INTO `peritajes` VALUES ('206', '1901269863-4', '2020-03-16', '305987234-5987137', '30', 'Se solicita Vaciado de 4 telefonos celulares.\r\nHuawei Honor Azul Bloqueado por PIN Claro\r\nSamsung SM-J810 Chip Entel BLoqueado con patron.\r\nSamsung SM‑N9600, dañado, no enciende\r\nGalaxy J4\r\n\r\n', '', '1', '2020-04-13 00:00:00', '2020-09-04 00:00:00', '1', '39', '1', '3');
INSERT INTO `peritajes` VALUES ('207', '1800411287-K', '2019-01-02', '1676246', '60', 'Vaciado a 1 equipo telefónico', '', '1', '2020-04-13 22:04:55', '2020-04-13 22:04:55', '1', '39', '2', '2');
INSERT INTO `peritajes` VALUES ('208', '1900170238-9', '2019-01-02', '1929737', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-13 22:10:44', '2020-04-13 22:10:44', '1', '11', '2', '1');
INSERT INTO `peritajes` VALUES ('209', '1900223339-0', '2019-01-02', '5208008', '60', '', '', '1', '2020-04-13 22:14:40', '2020-04-13 22:14:40', '1', '6', '2', '1');
INSERT INTO `peritajes` VALUES ('210', '1600548347-K', '2019-01-02', '4340691 - 4340693 - 4340694', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-13 22:25:31', '2020-04-13 22:25:31', '1', '4', '2', '1');
INSERT INTO `peritajes` VALUES ('211', '1900142246-7', '2019-01-02', '1929298', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-13 22:28:28', '2020-04-13 22:28:28', '1', '26', '2', '1');
INSERT INTO `peritajes` VALUES ('212', '1801173658-7', '2019-01-02', '5925886 - 5925885', '60', 'Vaciado de 1 equipo telefónico y 2 equipos telefónicos.', '', '1', '2020-04-14 22:16:42', '2020-04-14 22:16:42', '1', '67', '2', '2');
INSERT INTO `peritajes` VALUES ('213', '1801231060-5', '2019-01-02', '5925876', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-14 22:19:31', '2020-04-14 22:19:31', '1', '34', '2', '1');
INSERT INTO `peritajes` VALUES ('214', '1900361873-3', '2019-01-02', '2237353  -  2237354', '60', 'Vaciado de 1 equipo telefónico y 2 equipos telefónicos', '', '1', '2020-04-14 22:22:19', '2020-04-14 22:22:19', '1', '34', '2', '1');
INSERT INTO `peritajes` VALUES ('215', '1701208463-3', '2018-01-02', '', '60', 'Vaciado de 2 tarjetas Sim y  1 equipo telefónico', '', '1', '2020-04-14 22:26:14', '2020-04-14 22:26:14', '1', '39', '2', '4');
INSERT INTO `peritajes` VALUES ('216', '1900474361-2', '2018-01-02', '5079727', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-14 22:31:18', '2020-04-14 22:31:18', '1', '5', '2', '2');
INSERT INTO `peritajes` VALUES ('217', '1900142246-7', '2019-01-02', '', '60', 'Adquisición Forense, computador y cámara fotográfica', '', '1', '2020-04-14 22:38:16', '2020-04-14 22:38:16', '1', '26', '1', '1');
INSERT INTO `peritajes` VALUES ('218', '1900558518-2', '2019-01-02', '', '60', 'Vaciado de 1 equipo telefónico', '', '1', '2020-04-14 22:46:22', '2020-04-14 22:46:22', '1', '12', '2', '1');
INSERT INTO `peritajes` VALUES ('219', '2000448776-2', '2020-05-08', '', '30', 'TELEFONO MARCA SAMGUNG MODELO A30, BLOQUEADO CON PATRON', '', '1', '2020-05-08 00:00:00', '2020-09-04 00:00:00', '1', '72', '1', '6');
INSERT INTO `peritajes` VALUES ('220', '2000168409-5', '2020-05-08', '1670241', '30', 'solicita vaciado telefono marca huawei, color  dorado, con funda con ilustración de auto.\r\ntelefono roto', '', '1', '2020-05-08 00:00:00', '2020-09-04 00:00:00', '1', '18', '1', '6');
INSERT INTO `peritajes` VALUES ('221', '2000497343-8', '2020-05-29', '6132992', '30', 'Estimados Srs. UGI Fiscalía Regional IV Región. Junto con saludarlos, en causa por los delitos de tráfico de drogas y posesión de armas de fuego RUC 2000497343-8, se solicita respaldo digital forense de la siguiente evidencia:\r\nEn audiencia de fecha 26.05.2020, el Sr. Juez de Garantía de Coquimbo, autorizó el vaciado del  teléfono móvil marca Huawei color negro, contenedor del número interceptado N° 940327220, incautado el día 25.05.2020 al imputado Espinosa Milla,  NUE 6132988. UGI de Fiscalía Regional de Coquimbo,  vaciará su contenido, respaldando todo su contenido. ', '', '1', '2020-05-29 00:00:00', '2020-09-04 00:00:00', '1', '10', '1', '2');
INSERT INTO `peritajes` VALUES ('222', '1901398712-5', '2020-06-01', '5216269', '30', '    Junto con saludar, se solicita realizar pericia a la evidencia consistente en un teléfono celular marca Samsung, color azul, empresa Entel, NUE 5216269, esta evidencia se encuentra en custodia en la Fiscalía Local. La autorización para realizar estas pericias fue otorgada por la madre de la víctima Gabriela Patricia Córdova Egaña, según consta en carpeta de investigación, en la cual además en sobre cerrado está la contraseña del teléfono.  ', '', '1', '2020-06-08 00:00:00', '2020-09-04 00:00:00', '1', '26', '1', '2');
INSERT INTO `peritajes` VALUES ('223', '1910065197-4', '2020-02-01', '5927131-1670204', '30', 'en investigación RUC 1910065197-4, seguida por Homicidio en la Fiscalía Local de Combarbalá y relativa a la víctima fallecida, don Felipe Ignacio Gómez Gómez, Cedula de Identidad N. 19.780.620-6, solicito por favor puedas coordinar una pericia destinada a establecer un vaciado de los llamadas, WhatsApp, mensajes de Facebook messenger entrantes y salientes, y de cualquier otra forma de comunicación desde los aparatos telefónicos de la víctima e imputado formalizado, ya sea entre si y/o con otras personas, desde el 11 de junio 2019, hasta el 11 de diciembre de 2019.\r\nAdjunto además resolución judicial emanada del Juzgado de Garantía de Combarbalá, de fecha 03 de enero de 2020, que autoriza el vaciado de los teléfonos referidos y formulario requerido para realizar  el vaciado telefónico. \r\n', '', '1', '2020-06-14 00:00:00', null, '1', '60', '2', '1');
INSERT INTO `peritajes` VALUES ('224', '1901342867-3', '2020-06-19', '5216270', '30', 'Solicita Vaciado equipo celular  MArca Motorola\r\n\r\nSe informa a Fiscal el día viernes 19-06-2020 14:11', '', '1', '2020-06-19 00:00:00', '2020-09-04 00:00:00', '1', '26', '1', '4');
INSERT INTO `peritajes` VALUES ('225', '2000465649-1', '2020-05-13', '6132449', '30', '-	02 celulares negros, marca “SANSUNG”, modelos GALAXI A-20 y A-30. N.U.E. 6132449.\r\n-	01 celular negro, marca “NOKIA”, modelo “ZEISS”. Evidencia entregada por el imputado José Luis ZAMBRA ROBLES, el 08.MAY.020. N.U.E 6132451. \r\n', '', '1', '2020-07-06 00:00:00', '2020-09-04 00:00:00', '1', '10', '1', '2');
INSERT INTO `peritajes` VALUES ('226', '2000304840-4', '2020-03-22', '6132969', '30', 'Estimados señores UGI Fiscalía Regional IV Región, junto con saludarlos en causa de la referencia por el delito de violación de secreto, vengo en solicitar se practique pericia de respaldo digital forense (especialmente WhatsApp y mensajería de texto) de la información contenida en  teléfono celular marca  Huawei, modelo P20, asociado al número 993276413, ', '', '1', '2020-07-06 00:00:00', null, '1', '10', '1', '2');
INSERT INTO `peritajes` VALUES ('227', '2000727595-2', '2020-08-06', '', '15', 'Solicita Vaciado de  4 Equipos celulares', '', '1', '2020-07-23 00:00:00', '2021-01-08 00:00:00', '1', '72', '1', '2');
INSERT INTO `peritajes` VALUES ('228', '1900781480-4', '2020-08-10', '5927355', '30', 'Solicita Vaciado de equipos.\r\nIMAC macbook air, iphone', '', '1', '2020-07-23 00:00:00', '2020-09-24 00:00:00', '1', '29', '1', '1');
INSERT INTO `peritajes` VALUES ('229', '2000408723-3', '2020-06-19', '5987157', '30', 'Solcita Vaciado de equipo y georreferenciación \r\nCelualr marca Samsung Modelo SM G975F', '', '1', '2020-08-12 00:00:00', '2021-02-04 00:00:00', '1', '66', '1', '2');
INSERT INTO `peritajes` VALUES ('230', '2000179815-5', '2020-05-15', '5925817', '60', 'Solicita vaciado de equipo\r\nSamsubg  sm-G532 Carcaza negra dura.\r\nHuawei LX3A', '', '1', '2020-08-12 00:00:00', '2020-09-04 00:00:00', '1', '3', '1', '4');
INSERT INTO `peritajes` VALUES ('231', '1901201569-3', '2020-07-01', '--', '20', 'se requiere es fijar las posiciones de los imputados el día 22 de octubre de 2019, especialmente en horario alrededor de las 15:45 horas, en cuanto a su ubicación  interesa saber si se sitúa entre el domicilio de estos en calle Anita Lizana, Parte Alta, Coquimbo, y el sitio del suceso correspondiente a la entrada trasera de Comercial\r\nLiquimax, entrada que se ubicada en calle Pinto, entre calle Borgoño y calle Garriga, Coquimbo. Además, el flujo de comunicaciones entre ellos que hubiese quedado registrado en los tráficos de llamados.\r\n', '', '1', '2020-08-26 00:00:00', '2020-08-26 00:00:00', '1', '67', '2', '4');
INSERT INTO `peritajes` VALUES ('232', '1901137605-6', '2020-08-14', '', '20', 'Solicita realizar mejora en sección de audio de vídeo grabado con celular.', '', '1', '2020-08-27 00:00:00', '2020-08-27 00:00:00', '1', '14', '1', '3');
INSERT INTO `peritajes` VALUES ('233', '1801257982-5', '2020-01-06', '5206342', '30', 'Solicita vaciado tlefonico, telefono LG con carcaza  de color negro gris, con figura de Bart Simpson. El teléfono ingreso en junio a nuestra unidad, después de una serie de correo en el cual se solicitaba a custodia', '', '1', '2020-09-04 00:00:00', '2021-04-13 00:00:00', '1', '1', '1', '6');
INSERT INTO `peritajes` VALUES ('234', '1901050159-0', '2020-09-04', '5925409', '30', 'Teléfono celular marca Huawei P30lite', '', '1', '2020-09-04 00:00:00', '2021-04-13 00:00:00', '1', '29', '1', '2');
INSERT INTO `peritajes` VALUES ('235', '1801217257-1', '2019-09-06', '5925587/5925588/5925589', '30', 'Iphone SE, Samsung s8 y iphone 8', '', '1', '2020-09-04 00:00:00', '2021-02-04 00:00:00', '1', '44', '1', '4');
INSERT INTO `peritajes` VALUES ('236', '2000166476-0', '2020-09-04', '5927262', '30', 'Teléfono marca Iphone 7, con carcaza negra. Blooqueado por pin', '', '1', '2020-09-04 00:00:00', '2020-09-04 00:00:00', '1', '29', '1', '6');
INSERT INTO `peritajes` VALUES ('237', '1901257114-6', '2020-07-29', '3652442', '30', 'Fiscal Regional solicita vaciado equipo Samsung  Colon negro, propiedad de imputado Antonio Carvajal', '', '1', '2020-09-04 00:00:00', null, '1', '6', '1', '2');
INSERT INTO `peritajes` VALUES ('238', '1901313494-7', '2020-07-01', '2145270-4902970', '15', '         En la causa señalada es necesario el vaciado e informe de 2 teléfonos incautados en un procedimiento por porte de artefactos incendiarios , hay 2 imputados en PP. El problema es que el plazo vence el 04 de enero del 2020 y ya solicite aumento de plazo , estaba pendiente informe de Laborar pericia química y los teléfonos .\r\n\r\nOS7 de Carabineros me señala que le vaciado y pericia de los teléfonos ellos no lo pueden hacer ya que  los teléfonos es un Iphone 6 y el otro es un Motorola y su software U.F.E.D. es antiguo y no podría realizar la pericia respecto de esos teléfonos.\r\n\r\nLa solicitud es Urgente ya que es poco probable que me amplíen el plazo y de ampliarlo no será por más de 10 o 15 días a lo sumo .(Los teléfonos están en la custodia de la Fiscalía Local de la Serena\r\n\r\n\r\nLo relevante es descubrir si hay filmaciones de los imputados del día de los hechos o en esa semana en que aparezcan manipulando bombas molotov  y la relación que existiría entre ambos imputados, como contactos y mensajería waths app del día los hechos o de dos días anteriores a la fecha y horas del ilícito que fue el 04/12/2019 a las 20:00 horas.\r\n', '', '1', '2020-09-04 00:00:00', '2021-02-04 00:00:00', '1', '7', '1', '4');
INSERT INTO `peritajes` VALUES ('239', '1700605759-4', '2020-02-04', '', '30', '', '', '1', '2020-09-04 00:00:00', null, '1', '13', '1', '4');
INSERT INTO `peritajes` VALUES ('240', '1900574736-0', '2019-10-28', '3656995', '30', 'Srta. Gabriela buen día, me dirijo a usted a fin de adjuntar solicitud de adquisición digital forense, Causa RUC 1900574736-0, a fin de que se extraiga información y contenido del teléfono celular marca Apple, modelo Iphone, color gris con carcasa de color rojo, sin chip, IMEI 355784074553546.\r\n', '', '1', '2020-09-04 00:00:00', '2021-04-12 00:00:00', '1', '12', '1', '6');
INSERT INTO `peritajes` VALUES ('241', '1710044210-8', '2020-09-04', '1929857', '30', 'Estimada Gabriela, la causa en referencia fue consultada con asesoría jurídica para no perseverar. La petición fue hecha por Francisca, pero encomendada por mi parte ( lo había conversado también con GMM). \r\n\r\nSe informa a fiscal 03-10-2019 que no se puede acceder a telegono por pin de acceso', '', '1', '2020-09-04 00:00:00', '2020-09-04 00:00:00', '1', '66', '1', '4');
INSERT INTO `peritajes` VALUES ('242', '200473459-K', '2020-07-30', '6132486', '20', 'Extraer la información de términos específicos  tales como coordinación para robos, uso de armas de fuego, repartos de dinero, prestamos de dinero, quitadas de drogas, disparos por encargo, además de  fotografías, videos, audios mensajes  y conversaciones vía WhatsApp en donde se refieran a dichos  términos.', '', '1', '2020-09-07 00:00:00', null, '1', '5', '2', '4');
INSERT INTO `peritajes` VALUES ('243', '2000203746-8', '2020-08-20', '5987137', '30', 'Solicitud de pericia de analisis de información digital forense, investigacion RUC 2000203746-8 de la Fiscalia Local de Ovalle.', '', '1', '2020-09-09 00:00:00', '2020-09-09 00:00:00', '1', '2', '1', '4');
INSERT INTO `peritajes` VALUES ('244', '2000408723-3', '2020-05-31', '', '90', 'Generar una pericia de georreferencia comparativa entre el recorrido del camión y el recorrido de la tobillera, en día, horario y lugar respectivos.', '', '1', '2020-09-10 00:00:00', '2020-09-10 00:00:00', '1', '66', '2', '1');
INSERT INTO `peritajes` VALUES ('245', '2000686343-5', '2020-08-27', '4563641 - 2951659 ', '30', 'Estimada Gabriela, junto con saludar, quería por favor solicitar de manera excepcional el vaciado de teléfonos incautados en la presente investigación seguida en contra de los imputados LUIS ARDILES ROJAS y BRAYAN BENAVIDES RODRIGUEZ, formalizados en contexto de foco armas Limari por los delitos de homicidio frustrado, porte de arma de fuego prohibida y municiones, y el primero además por tráfico de droga.  La incautación se hizo en virtud de autorización judicial que se acompaña y además los imputados autorizaron el vaciado, sin perjuicio que respecto del imputado BENAVIDES en la resolución que autoriza la incautación también se autorizó acceder al contenido de dicho aparato celular.\r\n\r\nLos teléfonos son: \r\na)	LG modelo K50s NUE 2951659 CLAVE 2511   del imputado ARDILES ROJAS\r\nb)	Galaxy Core 2 NUE 4563641 SIN CLAVE del imputado BENAVIDES RODRIGUEZ\r\n', '', '1', '2020-09-21 00:00:00', null, '1', '30', '1', '1');
INSERT INTO `peritajes` VALUES ('246', '2000956984-8', '2020-10-09', '6133240-6133241', '30', 'Vaciado Telefono,\r\nsamsung SM-A505G (2020-10-08 15h43m10s)\r\nsamsung SM-J415G (2020-10-09 10h42m23s)', '', '1', '2020-10-09 00:00:00', null, '1', '5', '1', '2');
INSERT INTO `peritajes` VALUES ('247', '2000951988-3', '2020-10-01', '6132702', '10', 'Solcita vaciado de tres telefonos celulares', '', '1', '2020-10-22 00:00:00', null, '1', '19', '1', '1');
INSERT INTO `peritajes` VALUES ('249', '2000769660-5', '2020-10-19', '6132675', '20', 'Solicita  vaciado telefónico, Teléfono Samsung j8', '', '1', '2020-10-22 00:00:00', '2021-02-04 00:00:00', '1', '29', '1', '2');
INSERT INTO `peritajes` VALUES ('250', '2000853843-4', '2020-11-09', '', '30', 'Solicita informe relacionado con teléfonos asociados a la causa RUC  1901269863-4, en la cual se realizó AFD y se encontraron hallazgos que permiten abrir otra causa por oficio, relacionada a un Funcionario de Carabineros.', '', '1', '2020-11-04 00:00:00', null, '1', '30', '1', '3');
INSERT INTO `peritajes` VALUES ('251', '2001057256-9', '2020-11-06', '6148962', '30', 'Solicita vaciado y búsqueda de información. \"Nico, Nicolás, Amenazas.\"', '', '1', '2020-11-05 00:00:00', '2021-02-04 00:00:00', '1', '11', '1', '2');
INSERT INTO `peritajes` VALUES ('252', '2000432103-1', '2020-11-13', '618404', '30', 'Solicita adquisición forense de equipo celular marca LG, modelo LG-x230', '', '1', '2020-11-13 00:00:00', '2021-02-04 00:00:00', '1', '6', '1', '2');
INSERT INTO `peritajes` VALUES ('253', '2000771329-1', '2020-09-04', '', '30', 'Solicita información Vaciado Telefonico. Por foco Armas Limarí.  causa RUC 1901269863-4 que dirige Nicolás se procedió al vaciado de 4 teléfonos incautados, lo que fue hecho por Rafa Ramos, como se me ha dado a conocer y lo que motivó la apertura de la presente investigación de oficio en el foco Armas Limarí,  entre la información que se ha podido obtener del vaciado de uno de estos teléfonos  ', '', '1', '2020-11-25 00:00:00', null, '1', '30', '1', '3');
INSERT INTO `peritajes` VALUES ('254', '2001198282-5', '2020-12-01', '', '30', 'Solicita adquisición forense videos DVR', '', '1', '2020-12-14 00:00:00', '2021-07-13 00:00:00', '1', '19', '1', '4');
INSERT INTO `peritajes` VALUES ('255', '2000977600-2', '2020-12-16', '6148866', '30', 'Solicita vaciado de dos equipos celulares:\r\nHuawei DRA-LX3 Color negro.\r\nMotorola Color plata Pantalla trizada', '', '1', '2020-12-16 00:00:00', '2021-05-04 00:00:00', '1', '41', '1', '2');
INSERT INTO `peritajes` VALUES ('256', '2001107838-K', '2020-12-28', '2250552', '30', 'SOLICITA VACAIDO TELEFONICO 2 TELEFONOS: HUAWEI MATE 20 LITE\r\nY HUAWEI L23, AMBOS BLOQUEADOS', '', '1', '2020-12-28 00:00:00', null, '1', '44', '1', '1');
INSERT INTO `peritajes` VALUES ('257', '2000817853-5', '2020-12-28', '6133292', '30', 'Solicita adquisición forense, telefono Samsung IMEI 357078105202720\r\nmodelo SM - A107M', '', '1', '2020-12-28 00:00:00', '2021-01-08 00:00:00', '1', '39', '1', '2');
INSERT INTO `peritajes` VALUES ('258', '2001057267-4', '2020-12-28', '6148444 - 6148427', '30', 'Solicita vaciado de 7 celulares:\r\n2 telefonos own analogos.\r\n2 teléfonos iphone, uno destruido.\r\n1 telefono LG\r\n1 telefono Huawei y5', '', '1', '2020-12-28 00:00:00', '2021-01-08 00:00:00', '1', '10', '1', '6');
INSERT INTO `peritajes` VALUES ('259', '1910042116-2', '2019-10-03', '--', '30', 'pericia de georreferencia comparativa entre el recorrido del camión y el recorrido de la tobillera, en día, horario y lugar respectivos', '', '1', '2021-01-05 00:00:00', null, '1', '67', '2', '4');
INSERT INTO `peritajes` VALUES ('260', '2000859719-8', '2020-10-08', '3652973', '30', 'Junto con saludar, se solicita realizar pericia a la evidencia consistente en un teléfono celular, marca Samsung, color lila, con carcaza de silicona perlado (NUE 3652973). La autorización para realizar esta pericia fue otorgada por el Juzgado de Garantía de La Serena, con fecha 2 de octubre de 2020. Cabe señalar que esta causa está formalizada y con plazo de investigación pendiente. Adjunto formulario respectivo y copia del acta donde consta que se otorgó autorización judicial.   \r\n\r\nCausa con Cierre de investigación, se despacha a custodia.', '', '1', '2021-01-08 00:00:00', '2021-02-04 00:00:00', '1', '26', '1', '6');
INSERT INTO `peritajes` VALUES ('261', '2000424767-2', '2020-06-08', '6132374', '30', 'Junto con saludarla, le escribo para solicitar autorización extraordinaria para la realización de un peritaje telefónico forense en la causa de la REF. seguida por el femicidio cometido en contra de doña Yulisa Cerda (Q. E. P. D.)', '', '1', '2021-01-08 00:00:00', null, '1', '4', '1', '6');
INSERT INTO `peritajes` VALUES ('262', '2000606881-3', '2021-01-08', '6132530', '30', 'Solicita vaciado telefónico e informe de geo referenciación.', '', '1', '2021-01-08 00:00:00', '2021-05-03 00:00:00', '1', '1', '1', '2');
INSERT INTO `peritajes` VALUES ('263', '1901220980-3', '2020-04-07', '5926742', '30', 'Solicita Vaciado Teléfono ZTE Blade, pantalla quebrada.', '', '1', '2021-02-04 00:00:00', '2021-02-04 00:00:00', '1', '29', '1', '6');
INSERT INTO `peritajes` VALUES ('264', '170044210-8', '2019-02-09', '1929857', '30', 'Solicita Vaciado Iphone 6', '', '1', '2021-02-04 00:00:00', null, '1', '66', '1', '6');
INSERT INTO `peritajes` VALUES ('265', '1800836916-6', '2019-02-09', '1930299', '30', 'Solicita vaciado equipo SAMSUNG  SM-J710MN\r\n', '', '1', '2021-02-04 00:00:00', null, '1', '15', '1', '4');
INSERT INTO `peritajes` VALUES ('266', '2100002249-4', '2021-03-04', '3651121', '30', 'Solicita vaciado Samsung, modelo SM-J701M', '', '1', '2021-03-04 00:00:00', null, '1', '6', '1', '6');
INSERT INTO `peritajes` VALUES ('267', '2001202171-3', '2021-03-05', '2470257/2470260', '30', 'Solicita adquisición forense de dos equipos celulares, OWN NEGRO modelo f1313 y motorola color azul, entel ', '', '1', '2021-03-05 00:00:00', null, '1', '44', '1', '2');
INSERT INTO `peritajes` VALUES ('268', '2100221488-9', '2021-03-17', '6181290', '30', 'Solcita extracción información teléfono celular marca Huawei, modelo IMEI.info: P30 Lite (MAR-LX3A) 867511044198461', '', '1', '2021-04-12 00:00:00', '2021-05-03 00:00:00', '1', '1', '1', '6');
INSERT INTO `peritajes` VALUES ('269', '2001103918-K', '2021-04-07', '2146024', '30', 'Solicita adquisición forense equipo celular Marca Samsung , con tarjeta microSD 8GB , SIMCARD Movistar N° 895602700005578672.  Rojo, con carcaza con ilustración de Bart Simposon.', '', '1', '2021-04-12 00:00:00', null, '1', '26', '1', '6');
INSERT INTO `peritajes` VALUES ('270', '2000581452-K', '2020-06-10', '6132522', '30', 'Solicita extracción información telefono celular marca Huawei Modelo PSmrat, IMAI 865842031465734  -865842031465741 doble sim.', '', '1', '2021-04-12 00:00:00', null, '1', '24', '1', '2');
INSERT INTO `peritajes` VALUES ('271', '2001004516-K', '2021-04-13', '6149168', '30', 'realizar vaciado de teléfono incautado en RUC 2001004516-K, por cuanto BIRO de PDI realizó una revisión preliminar del teléfono sin poder rescatar toda la información y, especialmente la de ciertas fotografías en las cuales aparecen armas de fuego prohibidas, y tampoco pudo rescatar agenda telefónica ni llamadas, solo sacar fotografías al contenido. Así por ej., aparecen las siguientes imágenes:', '', '1', '2021-04-13 00:00:00', null, '1', '29', '1', '1');
INSERT INTO `peritajes` VALUES ('272', '2100202094-4', '2021-04-22', '6149083', '30', 'RUC 2100202094-4, con el fin de solamente identificar el propietario del teléfono y el No. celular del dispositivo. Se adjunta solicitud en PDF y autorización judicial. El teléfono se encuentra en custodia de esta fiscalía en NUE   6149083. \r\nSolicita Lucas Rivera', '', '1', '2021-04-22 00:00:00', '2021-04-22 00:00:00', '1', '1', '1', '2');
INSERT INTO `peritajes` VALUES ('273', '2000779166-7', '2021-04-27', '2995482', '30', 'Junto con saludar, solicito autorizar la realización de pericia de vaciado telefónico, conforme la información que se obtenga podría permitir esclarecer delito y participación del robo en lugar no habitado del artículo 442 N° 1 del Código Penal, acaecido el 27/07/2020, aproximadamente a las 05:50 horas, en Tabaquería Deluxe, ubicada en calle Regimiento Arica N° 6001, La Serena, sitio del suceso en el cual se incautó la especie, consistente en un teléfono celular, marca ZTE, color azul, rotulado como E-1, NUE 2995482, actualmente en custodia de la Fiscalía Local. ', '', '1', '2021-04-27 00:00:00', '2021-06-08 00:00:00', '1', '67', '1', '2');
INSERT INTO `peritajes` VALUES ('274', '2000948375-7', '2021-04-22', '6180979', '30', '                                     1.- Teléfono celular, marca Samsung, color rojo, IMEI 358242/10/46296716. La autorización para revisión la otorgó voluntariamente la madre de la víctima\r\n                                     2.- Teléfono celular, marca Huawei, color negro, modelo JKMLx3. La autorización para revisión la otorgó el Tribunal de Garantía en audiencia de fecha 12 de febrero de 2021. \r\n                                     3.- Notebook, marca Hacer, color negro, SNID 43500401876. La autorización para revisión la otorgó el Tribunal de Garantía en audiencia de fecha 12 de febrero de 2021. \r\n', '', '1', '2021-05-03 00:00:00', null, '1', '26', '1', '2');
INSERT INTO `peritajes` VALUES ('275', '2100000701-0', '2021-04-22', '3082101', '30', 'Junto con saludar, adjunto solicitud de pericia.\r\nLa urgencia radica en que está formalizada la causa (sábado 02/01/2021), y el Magistrado Carlos Jorquera autorizó en audiencia el vaciado de los celulares de los imputados (02), otorgando un plazo de 07 días, para el caso que la defensa solicite devolución de los mismos y el Tribunal accede (porque al estar incautados, nosotros claramente nos vamos a oponer a la devolución). Por otro lado, me es necesario saber los números telefónicos de cada uno de los aparatos, para requerir a las Compañías tráfico de llamadas.\r\nAtte.,\r\n', '', '1', '2021-05-03 00:00:00', null, '1', '6', '1', '2');
INSERT INTO `peritajes` VALUES ('276', '2001269956-6', '2021-04-22', '6181321', '30', '                                     Junto con saludar, por instrucción de FR, en oficio N° 1398, de fecha 27 de abril de 2021, se solicita realizar pericia a la evidencia consistente en un teléfono celular, marca Sony, modelo Xperia, gabinete color negro, ingresado a custodia de esta Fiscalía Local. La autorización para revisión la otorgó voluntariamente el imputado ante personal de Brisexme.    \r\n                                      Adjunto formulario respectivo, copia de la autorización y Oficio N° 1398, que instruye esta diligencia.   \r\n                                      Hago presente que la presente causa está formalizada, con plazo de investigación vencido, aunque se fijó audiencia de reformalización y prórroga del plazo de investigación para el día 5 de mayo de 2021 \r\n\r\n                                     Saluda atentamente, \r\n', '', '1', '2021-05-06 00:00:00', null, '1', '26', '1', '2');
INSERT INTO `peritajes` VALUES ('277', '2100274261-3', '2021-04-01', '6148550', '2', 'causa RUC 2100274261-3 por microtráfico de cocaína; solicito vaciar el celular del imputado, obtener pantallazos de las conversaciones de whatsapp, mensajes u otro  que den cuenta de conversaciones entre el imputado y algún comprador de droga. La evidencia se encuentra en custodia (Funcionarios de Briant La Serena hizo entrega de la evidencia en custodia). El vaciado fue autorizado por el propio imputado, mediante acta y luego, ratificado en audiencia de control de la detención. ', '', '1', '2021-05-17 00:00:00', null, '1', '1', '1', '2');
INSERT INTO `peritajes` VALUES ('278', '2001133927-2', '2021-05-25', '6149234', '30', 'Solicita vaciado equipo Iphone 6, (equipo  con pantalla fracturada, no enciende)', '', '1', '2021-05-27 00:00:00', null, '1', '30', '1', '6');
INSERT INTO `peritajes` VALUES ('279', '2100172042-K', '2021-06-01', '6149193', '30', 'Solicita vaciado teléfono LG . Color dorado, bloqueado por patrón ', '', '1', '2021-06-01 00:00:00', null, '1', '34', '1', '2');
INSERT INTO `peritajes` VALUES ('280', '2000634928-6', '2021-06-23', '6149194', '30', 'Junto con saludar, solicito por favor aprobar pericia de extracción de teléfono celular incautado al imputado preso Álvaro Valencia Reyes, formalizado por desórdenes y robo en el Hotel Costa Real, acaecido durante el estallido social.', '', '1', '2021-06-24 00:00:00', null, '1', '67', '1', '2');
INSERT INTO `peritajes` VALUES ('281', '2100437251-1', '2021-07-05', '4905576/4905574/4905581', '30', 'Solicita adquisición forense 4 equipos celulares. \r\nSamsung  SM-A025M  IMEI 355201891587235 \r\nSamsung SM-A315G IMEI 356998471041140\r\nMotorola XT1542 IMEI 358968064659564 (SIN SIMCARD)\r\nZTE BLASDE 3 IMEI 863748044024792\r\nHUAWEI LX3 IMEI 867264033350665\r\n\r\n', '', '1', '2021-07-02 00:00:00', null, '1', '34', '1', '2');
INSERT INTO `peritajes` VALUES ('282', '2001221023-0', '2021-06-01', ' 2239564-2239563', '30', 'solicita vaciado telefonico, celular samsungm, pantalla rota color azul. y telefon samsung A11 color negro-.', '', '1', '2021-07-13 00:00:00', '2021-07-13 00:00:00', '1', '39', '1', '1');

-- ----------------------------
-- Table structure for peritajes_has_estados
-- ----------------------------
DROP TABLE IF EXISTS `peritajes_has_estados`;
CREATE TABLE `peritajes_has_estados` (
  `EstadoId` int(11) NOT NULL,
  `PeritajeId` int(11) NOT NULL,
  `createdAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  `updatedAt` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`EstadoId`,`PeritajeId`),
  KEY `fk_estados_has_peritajes_peritajes1_idx` (`PeritajeId`),
  KEY `fk_estados_has_peritajes_estados1_idx` (`EstadoId`),
  CONSTRAINT `fk_estados_has_peritajes_estados1` FOREIGN KEY (`EstadoId`) REFERENCES `estados` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_estados_has_peritajes_peritajes1` FOREIGN KEY (`PeritajeId`) REFERENCES `peritajes` (`id`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of peritajes_has_estados
-- ----------------------------

-- ----------------------------
-- Table structure for peritos
-- ----------------------------
DROP TABLE IF EXISTS `peritos`;
CREATE TABLE `peritos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `nombre_perito` varchar(60) DEFAULT NULL,
  `email` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of peritos
-- ----------------------------
INSERT INTO `peritos` VALUES ('1', 'RAFAEL RAMOS', 'RRAMOS@MINPUBLICO.CL', null, '2021-07-22 12:08:41', '2021-07-22 12:08:43');
INSERT INTO `peritos` VALUES ('2', 'FERNANDO HERRERA', 'FHERRERA@MINPUBLICO.CL', null, '2021-06-14 16:43:01', '2021-06-14 16:43:01');

-- ----------------------------
-- Table structure for solicitud
-- ----------------------------
DROP TABLE IF EXISTS `solicitud`;
CREATE TABLE `solicitud` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fecha_sol` date DEFAULT NULL,
  `id_tipoper` int(11) DEFAULT NULL,
  `formalizada` tinyint(4) DEFAULT NULL,
  `gls_solicituf` varchar(255) DEFAULT NULL,
  `id_estado` int(11) DEFAULT NULL,
  `solicitudcol` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of solicitud
-- ----------------------------

-- ----------------------------
-- Table structure for tipo_act
-- ----------------------------
DROP TABLE IF EXISTS `tipo_act`;
CREATE TABLE `tipo_act` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gls_tipoact` varchar(45) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_act
-- ----------------------------
INSERT INTO `tipo_act` VALUES ('1', 'Solicitud de Peritaje', null, null, null);
INSERT INTO `tipo_act` VALUES ('2', 'Vaciado telefonico', null, null, null);
INSERT INTO `tipo_act` VALUES ('3', 'Adqusici Forense', null, null, null);
INSERT INTO `tipo_act` VALUES ('4', 'Analisis de infromación', null, null, null);
INSERT INTO `tipo_act` VALUES ('5', 'Envio a Serv. Técnico', null, null, null);

-- ----------------------------
-- Table structure for tipo_peritaje
-- ----------------------------
DROP TABLE IF EXISTS `tipo_peritaje`;
CREATE TABLE `tipo_peritaje` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gls_tipo` varchar(45) DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tipo_peritaje
-- ----------------------------
INSERT INTO `tipo_peritaje` VALUES ('1', 'Vaciado Telefónico', '2021-06-09 22:18:52', '2021-06-09 22:18:52', null);
INSERT INTO `tipo_peritaje` VALUES ('2', 'Adquisición Forense Equipo de Computo', '2021-06-09 22:19:12', '2021-06-09 22:19:12', null);
INSERT INTO `tipo_peritaje` VALUES ('3', 'Adquisición Forense Almacenamiento', '2021-06-09 22:19:24', '2021-06-09 22:19:24', null);
INSERT INTO `tipo_peritaje` VALUES ('4', 'Adquisición Forense DVR/NVR', '2021-06-09 22:19:31', '2021-06-09 22:19:31', null);
INSERT INTO `tipo_peritaje` VALUES ('5', 'GeoReferenciación tráfico telefónico', '2021-06-09 22:19:54', '2021-06-09 22:19:54', null);

-- ----------------------------
-- Table structure for ubicacion
-- ----------------------------
DROP TABLE IF EXISTS `ubicacion`;
CREATE TABLE `ubicacion` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `gls_ubicacion` varchar(60) DEFAULT NULL,
  `estado` tinyint(4) DEFAULT NULL,
  `createdAt` timestamp NULL DEFAULT NULL,
  `updatedAt` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of ubicacion
-- ----------------------------
INSERT INTO `ubicacion` VALUES ('1', 'Laboratorio Caja 1', null, null, null);
INSERT INTO `ubicacion` VALUES ('2', 'Laboratorio caja 2', null, null, null);
INSERT INTO `ubicacion` VALUES ('3', 'Laboratorio caja 3', null, null, null);
SET FOREIGN_KEY_CHECKS=1;
