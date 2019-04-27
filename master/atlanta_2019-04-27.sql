# ************************************************************
# Sequel Pro SQL dump
# Version 4499
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: localhost (MySQL 5.7.22)
# Database: atlanta
# Generation Time: 2019-04-27 13:08:15 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table ssh_log
# ------------------------------------------------------------

DROP TABLE IF EXISTS `ssh_log`;

CREATE TABLE `ssh_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `node` varchar(255) NOT NULL DEFAULT '',
  `ip` varchar(45) NOT NULL DEFAULT '',
  `status` int(11) NOT NULL,
  `date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `ssh_log` WRITE;
/*!40000 ALTER TABLE `ssh_log` DISABLE KEYS */;

INSERT INTO `ssh_log` (`id`, `node`, `ip`, `status`, `date`)
VALUES
	(1,'nodeABC','192.168.1.1',1,'2019-04-17 00:00:00'),
	(2,'nodeABC','128.199.105.113',0,'2019-04-23 00:00:00'),
	(3,'nodeXYZ','128.199.105.113',1,'2019-04-17 00:00:00'),
	(4,'nodeXYZ','192.168.2.1',0,'2019-05-10 00:00:00'),
	(5,'nodeXYZ','192.168.77.4',0,'2019-09-09 00:00:00'),
	(6,'nodeABC','192.10.0.1',0,'2019-01-01 00:00:00'),
	(7,'nodeCCC','192.168.1.1',1,'2019-04-02 00:00:00'),
	(8,'nodeCCC','192.168.77.4',0,'2019-04-04 00:00:00'),
	(9,'nodeMMM','10.0.0.1',0,'2020-12-01 00:00:00'),
	(10,'nodeMMM','10.0.0.2',1,'2020-12-30 00:00:00'),
	(11,'nodeABC','192.168.0.1',0,'2019-04-28 00:00:00'),
	(12,'nodeABC','127.0.0.1',1,'2019-04-28 00:00:00'),
	(13,'nodeABC','192.168.0.1',0,'2019-04-28 00:00:00'),
	(14,'nodeABC','127.0.0.1',1,'2019-04-28 00:00:00'),
	(15,'nodeABC','10.0.0.10',0,'2019-04-28 00:00:00');

/*!40000 ALTER TABLE `ssh_log` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
