/*
Navicat MySQL Data Transfer

Source Server         : aliMysql
Source Server Version : 50519
Source Host           : 106.15.204.66:3306
Source Database       : idea

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2021-05-15 18:42:37
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for alitest
-- ----------------------------
DROP TABLE IF EXISTS `alitest`;
CREATE TABLE `alitest` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `deviceName` varchar(255) DEFAULT NULL,
  `ledSwitch` tinyint(255) DEFAULT NULL,
  `wd` varchar(255) DEFAULT NULL,
  `hum` varchar(255) DEFAULT NULL,
  `fanSwitch` tinyint(255) DEFAULT NULL,
  `smoke` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2324 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of alitest
-- ----------------------------
INSERT INTO `alitest` VALUES ('1', 'aliServer', '0', '16', '0', '1', '765', '2020-12-31 00:31:37');
INSERT INTO `alitest` VALUES ('2', 'aliServer', '0', '16', '56', '1', '772', '2020-12-31 02:31:41');
INSERT INTO `alitest` VALUES ('3', 'aliServer', '0', '17', '56', '1', '775', '2020-12-31 04:31:46');
INSERT INTO `alitest` VALUES ('4', 'aliServer', '0', '14', '57', '1', '776', '2020-12-31 06:31:51');
INSERT INTO `alitest` VALUES ('5', 'aliServer', '0', '15', '57', '1', '777', '2020-12-31 08:31:56');
INSERT INTO `alitest` VALUES ('6', 'aliServer', '0', '20', '57', '1', '776', '2020-12-31 10:32:01');
INSERT INTO `alitest` VALUES ('7', 'aliServer', '0', '28', '57', '1', '776', '2020-12-31 12:32:06');
INSERT INTO `alitest` VALUES ('8', 'aliServer', '0', '28', '57', '1', '775', '2020-12-31 14:32:11');
INSERT INTO `alitest` VALUES ('9', 'aliServer', '0', '28', '57', '1', '774', '2020-12-31 16:32:16');
INSERT INTO `alitest` VALUES ('10', 'aliServer', '0', '26', '57', '1', '774', '2020-12-31 18:32:21');
INSERT INTO `alitest` VALUES ('11', 'aliServer', '1', '22', '57', '1', '773', '2020-12-31 20:32:26');
INSERT INTO `alitest` VALUES ('12', 'aliServer', '0', '22', '61', '1', '795', '2020-12-31 22:38:17');
INSERT INTO `alitest` VALUES ('13', 'aliServer', '0', '22', '61', '1', '795', '2020-12-31 24:38:22');
INSERT INTO `alitest` VALUES ('14', 'aliServer', '0', '17', '61', '1', '797', '2020-12-31 20:38:27');
INSERT INTO `alitest` VALUES ('15', 'aliServer', '0', '17', '61', '1', '795', '2020-12-31 20:38:32');
INSERT INTO `alitest` VALUES ('16', 'aliServer', '0', '17', '61', '1', '792', '2020-12-31 20:38:37');
INSERT INTO `alitest` VALUES ('17', 'aliServer', '0', '17', '61', '1', '788', '2020-12-31 20:38:42');
INSERT INTO `alitest` VALUES ('18', 'aliServer', '0', '17', '61', '1', '787', '2020-12-31 20:38:47');
INSERT INTO `alitest` VALUES ('19', 'aliServer', '0', '17', '61', '1', '786', '2020-12-31 20:38:52');
INSERT INTO `alitest` VALUES ('20', 'aliServer', '1', '17', '61', '1', '780', '2020-12-31 20:38:57');
INSERT INTO `alitest` VALUES ('21', 'aliServer', '0', '0', '0', '1', '732', '2020-12-31 20:37:42');
INSERT INTO `alitest` VALUES ('22', 'aliServer', '1', '17', '61', '1', '780', '2020-12-31 20:39:02');
INSERT INTO `alitest` VALUES ('23', 'aliServer', '1', '17', '61', '1', '776', '2020-12-31 20:39:07');
INSERT INTO `alitest` VALUES ('24', 'aliServer', '1', '17', '61', '1', '773', '2020-12-31 20:39:12');
INSERT INTO `alitest` VALUES ('25', 'aliServer', '1', '17', '61', '1', '771', '2020-12-31 20:39:17');
INSERT INTO `alitest` VALUES ('26', 'aliServer', '0', '17', '60', '1', '778', '2020-12-31 20:37:52');
INSERT INTO `alitest` VALUES ('27', 'aliServer', '1', '17', '61', '1', '770', '2020-12-31 20:39:22');
INSERT INTO `alitest` VALUES ('28', 'aliServer', '0', '17', '59', '1', '760', '2020-12-31 20:37:47');
INSERT INTO `alitest` VALUES ('29', 'aliServer', '0', '17', '61', '1', '788', '2020-12-31 20:37:57');
INSERT INTO `alitest` VALUES ('30', 'aliServer', '1', '17', '60', '1', '768', '2020-12-31 20:39:27');
INSERT INTO `alitest` VALUES ('31', 'aliServer', '0', '17', '61', '1', '795', '2020-12-31 20:38:02');
INSERT INTO `alitest` VALUES ('32', 'aliServer', '0', '17', '61', '1', '796', '2020-12-31 20:38:12');
INSERT INTO `alitest` VALUES ('1356', 'aliServer', '0', '28', '85', '0', '792', '2021-04-27 20:39:42');
INSERT INTO `alitest` VALUES ('1357', 'aliServer', '0', '28', '91', '0', '793', '2021-04-27 20:39:47');
INSERT INTO `alitest` VALUES ('1358', 'aliServer', '0', '0', '0', '0', '681', '2021-04-27 20:44:35');
INSERT INTO `alitest` VALUES ('1359', 'aliServer', '0', '26', '82', '0', '717', '2021-04-27 20:44:40');
INSERT INTO `alitest` VALUES ('1730', 'aliServer', '0', '27', '95', '0', '702', '2021-04-28 13:15:40');
INSERT INTO `alitest` VALUES ('1731', 'aliServer', '0', '27', '95', '0', '715', '2021-04-28 13:15:45');
INSERT INTO `alitest` VALUES ('1732', 'aliServer', '0', '26', '95', '0', '714', '2021-04-28 13:15:50');
INSERT INTO `alitest` VALUES ('1733', 'aliServer', '0', '26', '95', '0', '712', '2021-04-28 13:15:55');
INSERT INTO `alitest` VALUES ('1734', 'aliServer', '0', '26', '95', '0', '712', '2021-04-28 13:16:00');
INSERT INTO `alitest` VALUES ('1735', 'aliServer', '0', '26', '95', '0', '710', '2021-04-28 13:16:05');
INSERT INTO `alitest` VALUES ('1736', 'aliServer', '0', '26', '95', '0', '712', '2021-04-28 13:16:10');
INSERT INTO `alitest` VALUES ('1737', 'aliServer', '0', '26', '95', '0', '712', '2021-04-28 13:16:15');
INSERT INTO `alitest` VALUES ('1738', 'aliServer', '0', '26', '95', '0', '712', '2021-04-28 13:16:20');
INSERT INTO `alitest` VALUES ('1739', 'aliServer', '0', '26', '95', '0', '711', '2021-04-28 13:16:25');
INSERT INTO `alitest` VALUES ('1740', 'aliServer', '0', '26', '91', '0', '710', '2021-04-28 13:16:30');
INSERT INTO `alitest` VALUES ('1741', 'aliServer', '0', '26', '81', '0', '709', '2021-04-28 13:16:35');
INSERT INTO `alitest` VALUES ('1742', 'aliServer', '0', '26', '75', '0', '709', '2021-04-28 13:16:40');
INSERT INTO `alitest` VALUES ('1743', 'aliServer', '0', '26', '71', '0', '705', '2021-04-28 13:16:45');
INSERT INTO `alitest` VALUES ('1744', 'aliServer', '0', '26', '69', '0', '705', '2021-04-28 13:16:50');
INSERT INTO `alitest` VALUES ('1745', 'aliServer', '0', '26', '67', '0', '704', '2021-04-28 13:16:55');
INSERT INTO `alitest` VALUES ('1746', 'aliServer', '0', '26', '66', '0', '703', '2021-04-28 13:17:00');
INSERT INTO `alitest` VALUES ('1747', 'aliServer', '0', '26', '66', '0', '702', '2021-04-28 13:17:05');
INSERT INTO `alitest` VALUES ('1748', 'aliServer', '0', '26', '65', '0', '702', '2021-04-28 13:17:10');
INSERT INTO `alitest` VALUES ('1749', 'aliServer', '0', '26', '64', '0', '700', '2021-04-28 13:17:15');
INSERT INTO `alitest` VALUES ('1750', 'aliServer', '0', '26', '64', '0', '702', '2021-04-28 13:17:20');
INSERT INTO `alitest` VALUES ('1751', 'aliServer', '0', '26', '64', '0', '700', '2021-04-28 13:17:25');
INSERT INTO `alitest` VALUES ('1752', 'aliServer', '0', '26', '63', '0', '698', '2021-04-28 13:17:30');
INSERT INTO `alitest` VALUES ('1753', 'aliServer', '0', '26', '63', '0', '692', '2021-04-28 13:17:35');
INSERT INTO `alitest` VALUES ('1754', 'aliServer', '0', '25', '62', '0', '696', '2021-04-28 13:17:40');
INSERT INTO `alitest` VALUES ('1755', 'aliServer', '0', '25', '62', '0', '696', '2021-04-28 13:17:45');
INSERT INTO `alitest` VALUES ('1756', 'aliServer', '0', '25', '62', '0', '694', '2021-04-28 13:17:50');
INSERT INTO `alitest` VALUES ('1757', 'aliServer', '0', '25', '62', '0', '693', '2021-04-28 13:17:55');
INSERT INTO `alitest` VALUES ('1758', 'aliServer', '0', '25', '62', '0', '693', '2021-04-28 13:18:00');
INSERT INTO `alitest` VALUES ('1759', 'aliServer', '0', '25', '62', '0', '692', '2021-04-28 13:18:05');
INSERT INTO `alitest` VALUES ('1760', 'aliServer', '0', '25', '62', '0', '691', '2021-04-28 13:18:10');
INSERT INTO `alitest` VALUES ('1761', 'aliServer', '0', '25', '62', '0', '689', '2021-04-28 13:18:15');
INSERT INTO `alitest` VALUES ('1762', 'aliServer', '0', '25', '62', '0', '691', '2021-04-28 13:18:20');
INSERT INTO `alitest` VALUES ('1763', 'aliServer', '0', '25', '62', '0', '690', '2021-04-28 13:18:25');
INSERT INTO `alitest` VALUES ('1764', 'aliServer', '0', '25', '62', '0', '690', '2021-04-28 13:18:30');
INSERT INTO `alitest` VALUES ('1765', 'aliServer', '0', '25', '62', '0', '689', '2021-04-28 13:18:35');
INSERT INTO `alitest` VALUES ('1766', 'aliServer', '0', '25', '61', '0', '689', '2021-04-28 13:18:40');
INSERT INTO `alitest` VALUES ('1767', 'aliServer', '0', '25', '61', '0', '687', '2021-04-28 13:18:45');
INSERT INTO `alitest` VALUES ('1768', 'aliServer', '0', '25', '61', '0', '687', '2021-04-28 13:18:50');
INSERT INTO `alitest` VALUES ('1769', 'aliServer', '0', '25', '61', '0', '686', '2021-04-28 13:18:55');
INSERT INTO `alitest` VALUES ('1770', 'aliServer', '0', '25', '62', '0', '686', '2021-04-28 13:19:00');
INSERT INTO `alitest` VALUES ('1771', 'aliServer', '0', '25', '61', '0', '685', '2021-04-28 13:19:05');
INSERT INTO `alitest` VALUES ('1772', 'aliServer', '0', '25', '61', '0', '685', '2021-04-28 13:19:10');
INSERT INTO `alitest` VALUES ('1773', 'aliServer', '0', '25', '61', '0', '684', '2021-04-28 13:19:15');
INSERT INTO `alitest` VALUES ('1774', 'aliServer', '0', '25', '61', '0', '682', '2021-04-28 13:19:20');
INSERT INTO `alitest` VALUES ('1775', 'aliServer', '0', '25', '61', '0', '682', '2021-04-28 13:19:25');
INSERT INTO `alitest` VALUES ('1776', 'aliServer', '0', '25', '61', '0', '681', '2021-04-28 13:19:30');
INSERT INTO `alitest` VALUES ('1777', 'aliServer', '0', '25', '62', '0', '681', '2021-04-28 13:19:35');
INSERT INTO `alitest` VALUES ('1778', 'aliServer', '0', '25', '62', '0', '681', '2021-04-28 13:19:40');
INSERT INTO `alitest` VALUES ('1779', 'aliServer', '0', '25', '62', '0', '680', '2021-04-28 13:19:45');
INSERT INTO `alitest` VALUES ('1780', 'aliServer', '0', '25', '61', '0', '680', '2021-04-28 13:19:50');
INSERT INTO `alitest` VALUES ('1781', 'aliServer', '0', '28', '60', '0', '679', '2021-04-28 13:19:55');
INSERT INTO `alitest` VALUES ('1782', 'aliServer', '0', '0', '0', '0', '685', '2021-05-05 18:52:25');
INSERT INTO `alitest` VALUES ('1783', 'aliServer', '0', '25', '69', '0', '686', '2021-05-05 18:52:29');
INSERT INTO `alitest` VALUES ('1784', 'aliServer', '0', '27', '61', '0', '676', '2021-05-05 18:52:34');
INSERT INTO `alitest` VALUES ('1785', 'aliServer', '0', '27', '61', '0', '685', '2021-05-05 18:52:39');
INSERT INTO `alitest` VALUES ('1786', 'aliServer', '0', '27', '61', '0', '685', '2021-05-05 18:52:44');
INSERT INTO `alitest` VALUES ('1787', 'aliServer', '0', '27', '61', '0', '684', '2021-05-05 18:52:49');
INSERT INTO `alitest` VALUES ('1788', 'aliServer', '0', '27', '61', '0', '684', '2021-05-05 18:52:54');
INSERT INTO `alitest` VALUES ('1789', 'aliServer', '0', '27', '61', '0', '682', '2021-05-05 18:52:59');
INSERT INTO `alitest` VALUES ('1790', 'aliServer', '0', '27', '61', '0', '685', '2021-05-05 18:53:04');
INSERT INTO `alitest` VALUES ('1791', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:53:09');
INSERT INTO `alitest` VALUES ('1792', 'aliServer', '0', '27', '60', '0', '677', '2021-05-05 18:53:14');
INSERT INTO `alitest` VALUES ('1793', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:53:19');
INSERT INTO `alitest` VALUES ('1794', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:53:24');
INSERT INTO `alitest` VALUES ('1795', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:53:29');
INSERT INTO `alitest` VALUES ('1796', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:53:34');
INSERT INTO `alitest` VALUES ('1797', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:53:39');
INSERT INTO `alitest` VALUES ('1798', 'aliServer', '0', '27', '60', '0', '685', '2021-05-05 18:53:44');
INSERT INTO `alitest` VALUES ('1799', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:53:49');
INSERT INTO `alitest` VALUES ('1800', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:53:54');
INSERT INTO `alitest` VALUES ('1801', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:53:59');
INSERT INTO `alitest` VALUES ('1802', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:54:04');
INSERT INTO `alitest` VALUES ('1803', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:54:09');
INSERT INTO `alitest` VALUES ('1804', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:54:14');
INSERT INTO `alitest` VALUES ('1805', 'aliServer', '0', '27', '60', '0', '684', '2021-05-05 18:54:19');
INSERT INTO `alitest` VALUES ('1806', 'aliServer', '0', '27', '60', '0', '685', '2021-05-05 18:54:24');
INSERT INTO `alitest` VALUES ('1807', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:54:29');
INSERT INTO `alitest` VALUES ('1808', 'aliServer', '0', '27', '60', '0', '681', '2021-05-05 18:54:34');
INSERT INTO `alitest` VALUES ('1809', 'aliServer', '0', '27', '60', '0', '682', '2021-05-05 18:54:39');
INSERT INTO `alitest` VALUES ('1810', 'aliServer', '0', '27', '60', '0', '681', '2021-05-05 18:54:44');
INSERT INTO `alitest` VALUES ('1811', 'aliServer', '0', '27', '59', '0', '681', '2021-05-05 18:54:49');
INSERT INTO `alitest` VALUES ('1812', 'aliServer', '0', '27', '59', '0', '681', '2021-05-05 18:54:54');
INSERT INTO `alitest` VALUES ('1813', 'aliServer', '0', '27', '59', '0', '681', '2021-05-05 18:54:59');
INSERT INTO `alitest` VALUES ('1814', 'aliServer', '0', '26', '59', '0', '680', '2021-05-05 18:55:04');
INSERT INTO `alitest` VALUES ('1815', 'aliServer', '0', '26', '59', '0', '680', '2021-05-05 18:55:09');
INSERT INTO `alitest` VALUES ('1816', 'aliServer', '0', '27', '60', '0', '680', '2021-05-05 18:55:14');
INSERT INTO `alitest` VALUES ('1817', 'aliServer', '0', '27', '60', '0', '680', '2021-05-05 18:55:19');
INSERT INTO `alitest` VALUES ('1818', 'aliServer', '0', '27', '60', '0', '681', '2021-05-05 18:55:24');
INSERT INTO `alitest` VALUES ('1819', 'aliServer', '0', '27', '60', '0', '679', '2021-05-05 18:55:29');
INSERT INTO `alitest` VALUES ('1820', 'aliServer', '0', '27', '60', '0', '679', '2021-05-05 18:55:34');
INSERT INTO `alitest` VALUES ('1821', 'aliServer', '0', '26', '60', '0', '680', '2021-05-05 18:55:39');
INSERT INTO `alitest` VALUES ('1822', 'aliServer', '0', '26', '60', '0', '679', '2021-05-05 18:55:44');
INSERT INTO `alitest` VALUES ('1823', 'aliServer', '0', '26', '60', '0', '680', '2021-05-05 18:55:49');
INSERT INTO `alitest` VALUES ('1824', 'aliServer', '0', '26', '60', '0', '679', '2021-05-05 18:55:54');
INSERT INTO `alitest` VALUES ('1825', 'aliServer', '0', '26', '60', '0', '678', '2021-05-05 18:55:59');
INSERT INTO `alitest` VALUES ('1826', 'aliServer', '0', '26', '60', '0', '678', '2021-05-05 18:56:04');
INSERT INTO `alitest` VALUES ('1827', 'aliServer', '0', '26', '60', '0', '678', '2021-05-05 18:56:09');
INSERT INTO `alitest` VALUES ('1828', 'aliServer', '0', '26', '60', '0', '678', '2021-05-05 18:56:14');
INSERT INTO `alitest` VALUES ('1829', 'aliServer', '0', '26', '60', '0', '679', '2021-05-05 18:56:19');
INSERT INTO `alitest` VALUES ('1830', 'aliServer', '0', '26', '60', '0', '676', '2021-05-05 18:56:24');
INSERT INTO `alitest` VALUES ('1831', 'aliServer', '0', '26', '60', '0', '677', '2021-05-05 18:56:29');
INSERT INTO `alitest` VALUES ('1832', 'aliServer', '0', '26', '60', '0', '676', '2021-05-05 18:56:35');
INSERT INTO `alitest` VALUES ('1833', 'aliServer', '0', '26', '60', '0', '677', '2021-05-05 18:56:39');
INSERT INTO `alitest` VALUES ('1834', 'aliServer', '0', '26', '60', '0', '676', '2021-05-05 18:56:44');
INSERT INTO `alitest` VALUES ('1835', 'aliServer', '0', '26', '60', '0', '676', '2021-05-05 18:56:49');
INSERT INTO `alitest` VALUES ('1836', 'aliServer', '0', '26', '60', '0', '675', '2021-05-05 18:56:54');
INSERT INTO `alitest` VALUES ('1837', 'aliServer', '0', '26', '60', '0', '675', '2021-05-05 18:56:59');
INSERT INTO `alitest` VALUES ('1838', 'aliServer', '0', '26', '60', '0', '676', '2021-05-05 18:57:04');
INSERT INTO `alitest` VALUES ('1839', 'aliServer', '0', '26', '60', '0', '675', '2021-05-05 18:57:09');
INSERT INTO `alitest` VALUES ('1840', 'aliServer', '0', '26', '60', '0', '674', '2021-05-05 18:57:14');
INSERT INTO `alitest` VALUES ('1841', 'aliServer', '0', '26', '60', '0', '674', '2021-05-05 18:57:19');
INSERT INTO `alitest` VALUES ('1842', 'aliServer', '0', '26', '60', '0', '674', '2021-05-05 18:57:24');
INSERT INTO `alitest` VALUES ('1843', 'aliServer', '0', '26', '60', '0', '673', '2021-05-05 18:57:29');
INSERT INTO `alitest` VALUES ('1844', 'aliServer', '0', '26', '60', '0', '673', '2021-05-05 18:57:34');
INSERT INTO `alitest` VALUES ('1845', 'aliServer', '0', '26', '60', '0', '673', '2021-05-05 18:57:39');
INSERT INTO `alitest` VALUES ('1846', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:57:44');
INSERT INTO `alitest` VALUES ('1847', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:57:49');
INSERT INTO `alitest` VALUES ('1848', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:57:54');
INSERT INTO `alitest` VALUES ('1849', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:57:59');
INSERT INTO `alitest` VALUES ('1850', 'aliServer', '0', '26', '60', '0', '673', '2021-05-05 18:58:04');
INSERT INTO `alitest` VALUES ('1851', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:58:09');
INSERT INTO `alitest` VALUES ('1852', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:58:14');
INSERT INTO `alitest` VALUES ('1853', 'aliServer', '0', '26', '60', '0', '672', '2021-05-05 18:58:19');
INSERT INTO `alitest` VALUES ('1854', 'aliServer', '0', '26', '60', '0', '670', '2021-05-05 18:58:24');
INSERT INTO `alitest` VALUES ('1855', 'aliServer', '0', '26', '61', '0', '670', '2021-05-05 18:58:29');
INSERT INTO `alitest` VALUES ('1856', 'aliServer', '0', '26', '60', '0', '669', '2021-05-05 18:58:34');
INSERT INTO `alitest` VALUES ('1857', 'aliServer', '0', '26', '60', '0', '673', '2021-05-05 18:58:39');
INSERT INTO `alitest` VALUES ('1858', 'aliServer', '0', '26', '60', '0', '670', '2021-05-05 18:58:44');
INSERT INTO `alitest` VALUES ('1859', 'aliServer', '0', '26', '60', '0', '669', '2021-05-05 18:58:49');
INSERT INTO `alitest` VALUES ('1860', 'aliServer', '0', '26', '60', '0', '670', '2021-05-05 18:58:54');
INSERT INTO `alitest` VALUES ('1861', 'aliServer', '0', '26', '60', '0', '669', '2021-05-05 18:58:59');
INSERT INTO `alitest` VALUES ('1862', 'aliServer', '0', '26', '60', '0', '668', '2021-05-05 18:59:04');
INSERT INTO `alitest` VALUES ('1863', 'aliServer', '0', '26', '60', '0', '668', '2021-05-05 18:59:09');
INSERT INTO `alitest` VALUES ('1864', 'aliServer', '0', '26', '60', '0', '668', '2021-05-05 18:59:14');
INSERT INTO `alitest` VALUES ('1865', 'aliServer', '0', '26', '60', '0', '668', '2021-05-05 18:59:19');
INSERT INTO `alitest` VALUES ('1866', 'aliServer', '0', '26', '60', '0', '668', '2021-05-05 18:59:24');
INSERT INTO `alitest` VALUES ('1867', 'aliServer', '0', '26', '60', '0', '667', '2021-05-05 18:59:29');
INSERT INTO `alitest` VALUES ('1868', 'aliServer', '0', '26', '60', '0', '667', '2021-05-05 18:59:34');
INSERT INTO `alitest` VALUES ('1869', 'aliServer', '0', '26', '60', '0', '666', '2021-05-05 18:59:39');
INSERT INTO `alitest` VALUES ('1870', 'aliServer', '0', '26', '60', '0', '667', '2021-05-05 18:59:44');
INSERT INTO `alitest` VALUES ('1871', 'aliServer', '0', '26', '60', '0', '667', '2021-05-05 18:59:49');
INSERT INTO `alitest` VALUES ('1872', 'aliServer', '0', '26', '60', '0', '667', '2021-05-05 18:59:54');
INSERT INTO `alitest` VALUES ('1873', 'aliServer', '0', '26', '60', '0', '666', '2021-05-05 18:59:59');
INSERT INTO `alitest` VALUES ('1874', 'aliServer', '0', '26', '60', '0', '666', '2021-05-05 19:00:04');
INSERT INTO `alitest` VALUES ('1875', 'aliServer', '0', '26', '60', '0', '666', '2021-05-05 19:00:09');
INSERT INTO `alitest` VALUES ('1876', 'aliServer', '0', '26', '59', '0', '666', '2021-05-05 19:00:14');
INSERT INTO `alitest` VALUES ('1877', 'aliServer', '0', '26', '59', '0', '665', '2021-05-05 19:00:19');
INSERT INTO `alitest` VALUES ('1878', 'aliServer', '0', '26', '60', '0', '665', '2021-05-05 19:00:24');
INSERT INTO `alitest` VALUES ('1879', 'aliServer', '0', '26', '60', '0', '665', '2021-05-05 19:00:29');
INSERT INTO `alitest` VALUES ('1880', 'aliServer', '0', '26', '59', '0', '665', '2021-05-05 19:00:34');
INSERT INTO `alitest` VALUES ('1881', 'aliServer', '0', '26', '59', '0', '666', '2021-05-05 19:00:39');
INSERT INTO `alitest` VALUES ('1882', 'aliServer', '0', '26', '60', '0', '664', '2021-05-05 19:00:44');
INSERT INTO `alitest` VALUES ('1883', 'aliServer', '0', '26', '60', '0', '665', '2021-05-05 19:00:49');
INSERT INTO `alitest` VALUES ('1884', 'aliServer', '0', '26', '59', '0', '664', '2021-05-05 19:00:54');
INSERT INTO `alitest` VALUES ('1885', 'aliServer', '0', '26', '59', '0', '664', '2021-05-05 19:00:59');
INSERT INTO `alitest` VALUES ('1886', 'aliServer', '0', '26', '59', '0', '665', '2021-05-05 19:01:04');
INSERT INTO `alitest` VALUES ('1887', 'aliServer', '0', '26', '59', '0', '663', '2021-05-05 19:01:09');
INSERT INTO `alitest` VALUES ('1888', 'aliServer', '0', '26', '59', '0', '662', '2021-05-05 19:01:14');
INSERT INTO `alitest` VALUES ('1889', 'aliServer', '0', '26', '59', '0', '662', '2021-05-05 19:01:19');
INSERT INTO `alitest` VALUES ('1890', 'aliServer', '0', '26', '59', '0', '662', '2021-05-05 19:01:24');
INSERT INTO `alitest` VALUES ('1891', 'aliServer', '0', '26', '59', '0', '662', '2021-05-05 19:01:29');
INSERT INTO `alitest` VALUES ('1892', 'aliServer', '0', '26', '59', '0', '662', '2021-05-05 19:01:34');
INSERT INTO `alitest` VALUES ('1893', 'aliServer', '0', '26', '59', '0', '663', '2021-05-05 19:01:39');
INSERT INTO `alitest` VALUES ('1894', 'aliServer', '0', '26', '60', '0', '662', '2021-05-05 19:01:44');
INSERT INTO `alitest` VALUES ('1895', 'aliServer', '0', '27', '60', '0', '661', '2021-05-05 19:01:49');
INSERT INTO `alitest` VALUES ('1896', 'aliServer', '0', '27', '60', '0', '661', '2021-05-05 19:01:54');
INSERT INTO `alitest` VALUES ('1897', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:01:59');
INSERT INTO `alitest` VALUES ('1898', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:02:04');
INSERT INTO `alitest` VALUES ('1899', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:02:09');
INSERT INTO `alitest` VALUES ('1900', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:02:14');
INSERT INTO `alitest` VALUES ('1901', 'aliServer', '0', '27', '59', '0', '658', '2021-05-05 19:02:19');
INSERT INTO `alitest` VALUES ('1902', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:02:24');
INSERT INTO `alitest` VALUES ('1903', 'aliServer', '0', '27', '60', '0', '660', '2021-05-05 19:02:29');
INSERT INTO `alitest` VALUES ('1904', 'aliServer', '0', '27', '60', '0', '660', '2021-05-05 19:02:34');
INSERT INTO `alitest` VALUES ('1905', 'aliServer', '0', '27', '59', '0', '658', '2021-05-05 19:02:39');
INSERT INTO `alitest` VALUES ('1906', 'aliServer', '0', '27', '59', '0', '658', '2021-05-05 19:02:44');
INSERT INTO `alitest` VALUES ('1907', 'aliServer', '0', '27', '59', '0', '658', '2021-05-05 19:02:49');
INSERT INTO `alitest` VALUES ('1908', 'aliServer', '0', '27', '59', '0', '661', '2021-05-05 19:02:54');
INSERT INTO `alitest` VALUES ('1909', 'aliServer', '0', '27', '59', '0', '657', '2021-05-05 19:02:59');
INSERT INTO `alitest` VALUES ('1910', 'aliServer', '0', '27', '59', '0', '657', '2021-05-05 19:03:04');
INSERT INTO `alitest` VALUES ('1911', 'aliServer', '0', '27', '59', '0', '658', '2021-05-05 19:03:09');
INSERT INTO `alitest` VALUES ('1912', 'aliServer', '0', '27', '59', '0', '656', '2021-05-05 19:03:14');
INSERT INTO `alitest` VALUES ('1913', 'aliServer', '0', '27', '59', '0', '655', '2021-05-05 19:03:19');
INSERT INTO `alitest` VALUES ('1914', 'aliServer', '0', '27', '59', '0', '656', '2021-05-05 19:03:24');
INSERT INTO `alitest` VALUES ('1915', 'aliServer', '0', '27', '59', '0', '655', '2021-05-05 19:03:29');
INSERT INTO `alitest` VALUES ('1916', 'aliServer', '0', '27', '59', '0', '654', '2021-05-05 19:03:34');
INSERT INTO `alitest` VALUES ('1917', 'aliServer', '0', '27', '59', '0', '654', '2021-05-05 19:03:39');
INSERT INTO `alitest` VALUES ('1918', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 19:03:44');
INSERT INTO `alitest` VALUES ('1919', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 19:03:49');
INSERT INTO `alitest` VALUES ('1920', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 19:03:54');
INSERT INTO `alitest` VALUES ('1921', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 19:03:59');
INSERT INTO `alitest` VALUES ('1922', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 19:04:04');
INSERT INTO `alitest` VALUES ('1923', 'aliServer', '0', '27', '59', '0', '650', '2021-05-05 19:04:09');
INSERT INTO `alitest` VALUES ('1924', 'aliServer', '0', '27', '59', '0', '652', '2021-05-05 19:04:14');
INSERT INTO `alitest` VALUES ('1925', 'aliServer', '0', '27', '59', '0', '652', '2021-05-05 19:04:19');
INSERT INTO `alitest` VALUES ('1926', 'aliServer', '0', '27', '59', '0', '651', '2021-05-05 19:04:24');
INSERT INTO `alitest` VALUES ('1927', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:29');
INSERT INTO `alitest` VALUES ('1928', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:34');
INSERT INTO `alitest` VALUES ('1929', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:39');
INSERT INTO `alitest` VALUES ('1930', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:44');
INSERT INTO `alitest` VALUES ('1931', 'aliServer', '0', '27', '59', '0', '648', '2021-05-05 19:04:49');
INSERT INTO `alitest` VALUES ('1932', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:54');
INSERT INTO `alitest` VALUES ('1933', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:04:59');
INSERT INTO `alitest` VALUES ('1934', 'aliServer', '0', '27', '59', '0', '650', '2021-05-05 19:05:04');
INSERT INTO `alitest` VALUES ('1935', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:05:09');
INSERT INTO `alitest` VALUES ('1936', 'aliServer', '0', '27', '58', '0', '648', '2021-05-05 19:05:14');
INSERT INTO `alitest` VALUES ('1937', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:05:19');
INSERT INTO `alitest` VALUES ('1938', 'aliServer', '0', '27', '59', '0', '649', '2021-05-05 19:05:24');
INSERT INTO `alitest` VALUES ('1939', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:29');
INSERT INTO `alitest` VALUES ('1940', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:34');
INSERT INTO `alitest` VALUES ('1941', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:39');
INSERT INTO `alitest` VALUES ('1942', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:44');
INSERT INTO `alitest` VALUES ('1943', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:49');
INSERT INTO `alitest` VALUES ('1944', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:05:54');
INSERT INTO `alitest` VALUES ('1945', 'aliServer', '0', '27', '59', '0', '645', '2021-05-05 19:05:59');
INSERT INTO `alitest` VALUES ('1946', 'aliServer', '0', '27', '59', '0', '646', '2021-05-05 19:06:04');
INSERT INTO `alitest` VALUES ('1947', 'aliServer', '0', '27', '59', '0', '645', '2021-05-05 19:06:09');
INSERT INTO `alitest` VALUES ('1948', 'aliServer', '0', '27', '59', '0', '645', '2021-05-05 19:06:14');
INSERT INTO `alitest` VALUES ('1949', 'aliServer', '0', '27', '59', '0', '645', '2021-05-05 19:06:19');
INSERT INTO `alitest` VALUES ('1950', 'aliServer', '0', '27', '59', '0', '645', '2021-05-05 19:06:24');
INSERT INTO `alitest` VALUES ('1951', 'aliServer', '0', '27', '58', '0', '645', '2021-05-05 19:06:29');
INSERT INTO `alitest` VALUES ('1952', 'aliServer', '0', '27', '58', '0', '645', '2021-05-05 19:06:34');
INSERT INTO `alitest` VALUES ('1953', 'aliServer', '0', '27', '58', '0', '645', '2021-05-05 19:06:39');
INSERT INTO `alitest` VALUES ('1954', 'aliServer', '0', '27', '58', '0', '645', '2021-05-05 19:06:44');
INSERT INTO `alitest` VALUES ('1955', 'aliServer', '0', '27', '58', '0', '644', '2021-05-05 19:06:49');
INSERT INTO `alitest` VALUES ('1956', 'aliServer', '0', '27', '58', '0', '644', '2021-05-05 19:06:54');
INSERT INTO `alitest` VALUES ('1957', 'aliServer', '0', '27', '58', '0', '644', '2021-05-05 19:06:59');
INSERT INTO `alitest` VALUES ('1958', 'aliServer', '0', '27', '58', '0', '645', '2021-05-05 19:07:04');
INSERT INTO `alitest` VALUES ('1959', 'aliServer', '0', '27', '58', '0', '643', '2021-05-05 19:07:09');
INSERT INTO `alitest` VALUES ('1960', 'aliServer', '0', '27', '59', '0', '642', '2021-05-05 19:07:14');
INSERT INTO `alitest` VALUES ('1961', 'aliServer', '0', '27', '59', '0', '642', '2021-05-05 19:07:19');
INSERT INTO `alitest` VALUES ('1962', 'aliServer', '0', '27', '59', '0', '642', '2021-05-05 19:07:24');
INSERT INTO `alitest` VALUES ('1963', 'aliServer', '0', '27', '59', '0', '641', '2021-05-05 19:07:29');
INSERT INTO `alitest` VALUES ('1964', 'aliServer', '0', '27', '59', '0', '640', '2021-05-05 19:07:34');
INSERT INTO `alitest` VALUES ('1965', 'aliServer', '0', '27', '59', '0', '640', '2021-05-05 19:07:39');
INSERT INTO `alitest` VALUES ('1966', 'aliServer', '0', '27', '58', '0', '639', '2021-05-05 19:07:44');
INSERT INTO `alitest` VALUES ('1967', 'aliServer', '0', '27', '58', '0', '639', '2021-05-05 19:07:49');
INSERT INTO `alitest` VALUES ('1968', 'aliServer', '0', '27', '58', '0', '636', '2021-05-05 19:07:54');
INSERT INTO `alitest` VALUES ('1969', 'aliServer', '0', '27', '58', '0', '636', '2021-05-05 19:07:59');
INSERT INTO `alitest` VALUES ('1970', 'aliServer', '0', '27', '58', '0', '633', '2021-05-05 19:08:04');
INSERT INTO `alitest` VALUES ('1971', 'aliServer', '0', '27', '58', '0', '629', '2021-05-05 19:08:09');
INSERT INTO `alitest` VALUES ('1972', 'aliServer', '0', '27', '58', '0', '629', '2021-05-05 19:08:14');
INSERT INTO `alitest` VALUES ('1973', 'aliServer', '0', '27', '58', '0', '625', '2021-05-05 19:08:19');
INSERT INTO `alitest` VALUES ('1974', 'aliServer', '0', '27', '58', '0', '620', '2021-05-05 19:08:24');
INSERT INTO `alitest` VALUES ('1975', 'aliServer', '0', '0', '0', '0', '641', '2021-05-05 19:27:17');
INSERT INTO `alitest` VALUES ('1976', 'aliServer', '0', '27', '58', '0', '672', '2021-05-05 19:27:22');
INSERT INTO `alitest` VALUES ('1977', 'aliServer', '0', '27', '58', '0', '691', '2021-05-05 19:27:27');
INSERT INTO `alitest` VALUES ('1978', 'aliServer', '0', '27', '57', '0', '709', '2021-05-05 19:27:32');
INSERT INTO `alitest` VALUES ('1979', 'aliServer', '0', '27', '57', '0', '716', '2021-05-05 19:27:37');
INSERT INTO `alitest` VALUES ('1980', 'aliServer', '0', '27', '57', '0', '722', '2021-05-05 19:27:42');
INSERT INTO `alitest` VALUES ('1981', 'aliServer', '0', '27', '57', '0', '727', '2021-05-05 19:27:47');
INSERT INTO `alitest` VALUES ('1982', 'aliServer', '0', '27', '57', '0', '728', '2021-05-05 19:27:52');
INSERT INTO `alitest` VALUES ('1983', 'aliServer', '0', '27', '58', '0', '732', '2021-05-05 19:27:57');
INSERT INTO `alitest` VALUES ('1984', 'aliServer', '0', '27', '58', '0', '732', '2021-05-05 19:28:02');
INSERT INTO `alitest` VALUES ('1985', 'aliServer', '0', '27', '58', '0', '735', '2021-05-05 19:28:07');
INSERT INTO `alitest` VALUES ('1986', 'aliServer', '0', '27', '57', '0', '734', '2021-05-05 19:28:12');
INSERT INTO `alitest` VALUES ('1987', 'aliServer', '0', '27', '57', '0', '735', '2021-05-05 19:28:17');
INSERT INTO `alitest` VALUES ('1988', 'aliServer', '0', '27', '57', '0', '728', '2021-05-05 19:28:22');
INSERT INTO `alitest` VALUES ('1989', 'aliServer', '0', '27', '58', '0', '729', '2021-05-05 19:28:29');
INSERT INTO `alitest` VALUES ('1990', 'aliServer', '0', '27', '57', '0', '730', '2021-05-05 19:28:32');
INSERT INTO `alitest` VALUES ('1991', 'aliServer', '0', '27', '58', '0', '730', '2021-05-05 19:28:37');
INSERT INTO `alitest` VALUES ('1992', 'aliServer', '0', '27', '58', '0', '729', '2021-05-05 19:28:42');
INSERT INTO `alitest` VALUES ('1993', 'aliServer', '0', '27', '58', '0', '729', '2021-05-05 19:28:47');
INSERT INTO `alitest` VALUES ('1994', 'aliServer', '0', '27', '57', '0', '729', '2021-05-05 19:28:52');
INSERT INTO `alitest` VALUES ('1995', 'aliServer', '0', '27', '57', '0', '729', '2021-05-05 19:28:57');
INSERT INTO `alitest` VALUES ('1996', 'aliServer', '0', '27', '57', '0', '729', '2021-05-05 19:29:02');
INSERT INTO `alitest` VALUES ('1997', 'aliServer', '0', '0', '0', '0', '653', '2021-05-05 20:11:32');
INSERT INTO `alitest` VALUES ('1998', 'aliServer', '0', '26', '62', '0', '680', '2021-05-05 20:11:37');
INSERT INTO `alitest` VALUES ('1999', 'aliServer', '0', '26', '62', '0', '700', '2021-05-05 20:11:42');
INSERT INTO `alitest` VALUES ('2000', 'aliServer', '0', '26', '61', '0', '714', '2021-05-05 20:11:47');
INSERT INTO `alitest` VALUES ('2001', 'aliServer', '0', '26', '61', '0', '722', '2021-05-05 20:11:52');
INSERT INTO `alitest` VALUES ('2002', 'aliServer', '0', '26', '61', '0', '728', '2021-05-05 20:11:57');
INSERT INTO `alitest` VALUES ('2003', 'aliServer', '0', '26', '72', '0', '737', '2021-05-05 20:12:02');
INSERT INTO `alitest` VALUES ('2004', 'aliServer', '0', '26', '92', '0', '735', '2021-05-05 20:12:07');
INSERT INTO `alitest` VALUES ('2005', 'aliServer', '0', '27', '95', '0', '748', '2021-05-05 20:12:12');
INSERT INTO `alitest` VALUES ('2006', 'aliServer', '0', '27', '87', '0', '748', '2021-05-05 20:12:17');
INSERT INTO `alitest` VALUES ('2007', 'aliServer', '0', '27', '76', '0', '748', '2021-05-05 20:12:22');
INSERT INTO `alitest` VALUES ('2008', 'aliServer', '0', '27', '69', '0', '747', '2021-05-05 20:12:27');
INSERT INTO `alitest` VALUES ('2009', 'aliServer', '0', '27', '65', '1', '736', '2021-05-05 20:12:32');
INSERT INTO `alitest` VALUES ('2010', 'aliServer', '0', '27', '63', '0', '746', '2021-05-05 20:12:37');
INSERT INTO `alitest` VALUES ('2011', 'aliServer', '0', '27', '61', '0', '746', '2021-05-05 20:12:42');
INSERT INTO `alitest` VALUES ('2012', 'aliServer', '0', '27', '59', '0', '746', '2021-05-05 20:12:47');
INSERT INTO `alitest` VALUES ('2013', 'aliServer', '0', '27', '59', '0', '745', '2021-05-05 20:12:52');
INSERT INTO `alitest` VALUES ('2014', 'aliServer', '0', '27', '58', '0', '745', '2021-05-05 20:12:57');
INSERT INTO `alitest` VALUES ('2015', 'aliServer', '0', '27', '58', '1', '732', '2021-05-05 20:13:02');
INSERT INTO `alitest` VALUES ('2016', 'aliServer', '0', '27', '58', '1', '732', '2021-05-05 20:13:07');
INSERT INTO `alitest` VALUES ('2017', 'aliServer', '0', '27', '58', '1', '732', '2021-05-05 20:13:12');
INSERT INTO `alitest` VALUES ('2018', 'aliServer', '0', '27', '57', '1', '730', '2021-05-05 20:13:17');
INSERT INTO `alitest` VALUES ('2019', 'aliServer', '0', '27', '57', '1', '729', '2021-05-05 20:13:22');
INSERT INTO `alitest` VALUES ('2020', 'aliServer', '0', '27', '58', '1', '729', '2021-05-05 20:13:27');
INSERT INTO `alitest` VALUES ('2021', 'aliServer', '0', '27', '58', '1', '729', '2021-05-05 20:13:32');
INSERT INTO `alitest` VALUES ('2022', 'aliServer', '1', '27', '58', '0', '737', '2021-05-05 20:13:37');
INSERT INTO `alitest` VALUES ('2023', 'aliServer', '0', '27', '58', '1', '727', '2021-05-05 20:13:42');
INSERT INTO `alitest` VALUES ('2024', 'aliServer', '0', '27', '58', '1', '726', '2021-05-05 20:13:47');
INSERT INTO `alitest` VALUES ('2025', 'aliServer', '0', '27', '58', '1', '725', '2021-05-05 20:13:52');
INSERT INTO `alitest` VALUES ('2026', 'aliServer', '0', '27', '59', '1', '648', '2021-05-05 20:13:57');
INSERT INTO `alitest` VALUES ('2027', 'aliServer', '0', '27', '60', '1', '657', '2021-05-05 20:14:02');
INSERT INTO `alitest` VALUES ('2028', 'aliServer', '0', '27', '59', '0', '680', '2021-05-05 20:14:07');
INSERT INTO `alitest` VALUES ('2029', 'aliServer', '0', '27', '59', '1', '655', '2021-05-05 20:14:12');
INSERT INTO `alitest` VALUES ('2030', 'aliServer', '0', '27', '58', '0', '715', '2021-05-05 20:14:17');
INSERT INTO `alitest` VALUES ('2031', 'aliServer', '0', '27', '57', '0', '714', '2021-05-05 20:14:22');
INSERT INTO `alitest` VALUES ('2032', 'aliServer', '0', '27', '58', '0', '718', '2021-05-05 20:14:27');
INSERT INTO `alitest` VALUES ('2033', 'aliServer', '0', '27', '58', '0', '722', '2021-05-05 20:14:32');
INSERT INTO `alitest` VALUES ('2034', 'aliServer', '0', '27', '58', '0', '736', '2021-05-05 20:14:37');
INSERT INTO `alitest` VALUES ('2035', 'aliServer', '0', '27', '59', '0', '680', '2021-05-05 20:14:42');
INSERT INTO `alitest` VALUES ('2036', 'aliServer', '0', '27', '59', '0', '686', '2021-05-05 20:14:47');
INSERT INTO `alitest` VALUES ('2037', 'aliServer', '0', '27', '59', '0', '708', '2021-05-05 20:14:52');
INSERT INTO `alitest` VALUES ('2038', 'aliServer', '0', '27', '59', '0', '681', '2021-05-05 20:14:57');
INSERT INTO `alitest` VALUES ('2039', 'aliServer', '0', '27', '59', '0', '685', '2021-05-05 20:15:02');
INSERT INTO `alitest` VALUES ('2040', 'aliServer', '0', '27', '59', '0', '657', '2021-05-05 20:15:07');
INSERT INTO `alitest` VALUES ('2041', 'aliServer', '0', '27', '59', '0', '657', '2021-05-05 20:15:12');
INSERT INTO `alitest` VALUES ('2042', 'aliServer', '0', '27', '58', '0', '655', '2021-05-05 20:15:17');
INSERT INTO `alitest` VALUES ('2043', 'aliServer', '0', '27', '58', '0', '656', '2021-05-05 20:15:22');
INSERT INTO `alitest` VALUES ('2044', 'aliServer', '0', '27', '58', '0', '655', '2021-05-05 20:15:27');
INSERT INTO `alitest` VALUES ('2045', 'aliServer', '0', '27', '58', '0', '655', '2021-05-05 20:15:32');
INSERT INTO `alitest` VALUES ('2046', 'aliServer', '0', '27', '58', '0', '655', '2021-05-05 20:15:37');
INSERT INTO `alitest` VALUES ('2047', 'aliServer', '0', '27', '58', '0', '654', '2021-05-05 20:15:42');
INSERT INTO `alitest` VALUES ('2048', 'aliServer', '0', '27', '58', '0', '667', '2021-05-05 20:15:47');
INSERT INTO `alitest` VALUES ('2049', 'aliServer', '0', '27', '58', '0', '653', '2021-05-05 20:15:52');
INSERT INTO `alitest` VALUES ('2050', 'aliServer', '0', '27', '59', '0', '653', '2021-05-05 20:15:57');
INSERT INTO `alitest` VALUES ('2051', 'aliServer', '0', '27', '58', '0', '681', '2021-05-05 20:16:02');
INSERT INTO `alitest` VALUES ('2052', 'aliServer', '0', '27', '58', '0', '685', '2021-05-05 20:16:07');
INSERT INTO `alitest` VALUES ('2053', 'aliServer', '0', '27', '58', '0', '682', '2021-05-05 20:16:12');
INSERT INTO `alitest` VALUES ('2054', 'aliServer', '0', '27', '58', '0', '681', '2021-05-05 20:16:17');
INSERT INTO `alitest` VALUES ('2055', 'aliServer', '0', '27', '58', '0', '694', '2021-05-05 20:16:22');
INSERT INTO `alitest` VALUES ('2056', 'aliServer', '0', '27', '58', '0', '694', '2021-05-05 20:16:27');
INSERT INTO `alitest` VALUES ('2057', 'aliServer', '0', '27', '58', '0', '627', '2021-05-05 20:16:33');
INSERT INTO `alitest` VALUES ('2058', 'aliServer', '0', '27', '58', '0', '613', '2021-05-05 20:16:37');
INSERT INTO `alitest` VALUES ('2059', 'aliServer', '0', '27', '59', '0', '578', '2021-05-05 20:16:42');
INSERT INTO `alitest` VALUES ('2060', 'aliServer', '0', '27', '59', '0', '648', '2021-05-05 20:16:58');
INSERT INTO `alitest` VALUES ('2061', 'aliServer', '0', '27', '59', '0', '675', '2021-05-05 20:16:58');
INSERT INTO `alitest` VALUES ('2062', 'aliServer', '0', '27', '58', '0', '672', '2021-05-05 20:16:58');
INSERT INTO `alitest` VALUES ('2063', 'aliServer', '0', '0', '0', '0', '561', '2021-05-05 20:18:31');
INSERT INTO `alitest` VALUES ('2064', 'aliServer', '0', '27', '60', '0', '586', '2021-05-05 20:18:36');
INSERT INTO `alitest` VALUES ('2065', 'aliServer', '0', '27', '60', '1', '598', '2021-05-05 20:18:41');
INSERT INTO `alitest` VALUES ('2066', 'aliServer', '0', '27', '60', '1', '399', '2021-05-05 20:18:46');
INSERT INTO `alitest` VALUES ('2067', 'aliServer', '0', '27', '59', '0', '596', '2021-05-05 20:18:51');
INSERT INTO `alitest` VALUES ('2068', 'aliServer', '0', '27', '61', '0', '608', '2021-05-05 20:18:56');
INSERT INTO `alitest` VALUES ('2069', 'aliServer', '0', '27', '58', '0', '667', '2021-05-05 20:19:01');
INSERT INTO `alitest` VALUES ('2070', 'aliServer', '0', '27', '57', '0', '686', '2021-05-05 20:19:06');
INSERT INTO `alitest` VALUES ('2071', 'aliServer', '0', '27', '57', '1', '475', '2021-05-05 20:19:11');
INSERT INTO `alitest` VALUES ('2072', 'aliServer', '1', '27', '58', '0', '685', '2021-05-05 20:19:16');
INSERT INTO `alitest` VALUES ('2073', 'aliServer', '0', '27', '58', '0', '709', '2021-05-05 20:19:21');
INSERT INTO `alitest` VALUES ('2074', 'aliServer', '0', '27', '57', '0', '717', '2021-05-05 20:19:26');
INSERT INTO `alitest` VALUES ('2075', 'aliServer', '0', '27', '57', '0', '727', '2021-05-05 20:19:31');
INSERT INTO `alitest` VALUES ('2076', 'aliServer', '0', '27', '57', '0', '730', '2021-05-05 20:19:36');
INSERT INTO `alitest` VALUES ('2077', 'aliServer', '0', '27', '57', '0', '735', '2021-05-05 20:19:41');
INSERT INTO `alitest` VALUES ('2078', 'aliServer', '0', '27', '59', '0', '739', '2021-05-05 20:19:46');
INSERT INTO `alitest` VALUES ('2079', 'aliServer', '0', '27', '58', '0', '745', '2021-05-05 20:19:51');
INSERT INTO `alitest` VALUES ('2080', 'aliServer', '0', '27', '58', '0', '757', '2021-05-05 20:19:56');
INSERT INTO `alitest` VALUES ('2081', 'aliServer', '0', '27', '57', '0', '763', '2021-05-05 20:20:01');
INSERT INTO `alitest` VALUES ('2082', 'aliServer', '0', '27', '57', '0', '762', '2021-05-05 20:20:06');
INSERT INTO `alitest` VALUES ('2083', 'aliServer', '0', '27', '57', '0', '759', '2021-05-05 20:20:11');
INSERT INTO `alitest` VALUES ('2084', 'aliServer', '0', '27', '57', '0', '759', '2021-05-05 20:20:16');
INSERT INTO `alitest` VALUES ('2085', 'aliServer', '0', '27', '58', '0', '771', '2021-05-05 20:20:21');
INSERT INTO `alitest` VALUES ('2086', 'aliServer', '0', '27', '59', '0', '801', '2021-05-05 20:20:26');
INSERT INTO `alitest` VALUES ('2087', 'aliServer', '0', '27', '59', '0', '811', '2021-05-05 20:20:31');
INSERT INTO `alitest` VALUES ('2088', 'aliServer', '0', '27', '58', '0', '806', '2021-05-05 20:20:36');
INSERT INTO `alitest` VALUES ('2089', 'aliServer', '0', '27', '58', '0', '801', '2021-05-05 20:20:41');
INSERT INTO `alitest` VALUES ('2090', 'aliServer', '0', '27', '57', '0', '792', '2021-05-05 20:20:46');
INSERT INTO `alitest` VALUES ('2091', 'aliServer', '0', '27', '57', '0', '794', '2021-05-05 20:20:51');
INSERT INTO `alitest` VALUES ('2092', 'aliServer', '0', '27', '57', '0', '792', '2021-05-05 20:20:56');
INSERT INTO `alitest` VALUES ('2093', 'aliServer', '0', '27', '57', '0', '785', '2021-05-05 20:21:01');
INSERT INTO `alitest` VALUES ('2094', 'aliServer', '0', '27', '56', '0', '782', '2021-05-05 20:21:06');
INSERT INTO `alitest` VALUES ('2095', 'aliServer', '0', '27', '56', '0', '780', '2021-05-05 20:21:11');
INSERT INTO `alitest` VALUES ('2096', 'aliServer', '0', '27', '56', '0', '778', '2021-05-05 20:21:16');
INSERT INTO `alitest` VALUES ('2097', 'aliServer', '0', '27', '56', '0', '778', '2021-05-05 20:21:21');
INSERT INTO `alitest` VALUES ('2098', 'aliServer', '0', '27', '56', '0', '776', '2021-05-05 20:21:26');
INSERT INTO `alitest` VALUES ('2099', 'aliServer', '0', '27', '56', '0', '776', '2021-05-05 20:21:31');
INSERT INTO `alitest` VALUES ('2100', 'aliServer', '0', '27', '56', '0', '775', '2021-05-05 20:21:36');
INSERT INTO `alitest` VALUES ('2101', 'aliServer', '0', '27', '56', '0', '774', '2021-05-05 20:21:41');
INSERT INTO `alitest` VALUES ('2102', 'aliServer', '0', '27', '56', '0', '773', '2021-05-05 20:21:46');
INSERT INTO `alitest` VALUES ('2103', 'aliServer', '0', '27', '56', '0', '773', '2021-05-05 20:21:51');
INSERT INTO `alitest` VALUES ('2104', 'aliServer', '0', '27', '57', '0', '772', '2021-05-05 20:21:56');
INSERT INTO `alitest` VALUES ('2105', 'aliServer', '0', '27', '56', '0', '773', '2021-05-05 20:22:01');
INSERT INTO `alitest` VALUES ('2106', 'aliServer', '0', '27', '56', '0', '772', '2021-05-05 20:22:06');
INSERT INTO `alitest` VALUES ('2107', 'aliServer', '0', '27', '56', '0', '772', '2021-05-05 20:22:11');
INSERT INTO `alitest` VALUES ('2108', 'aliServer', '0', '27', '56', '0', '771', '2021-05-05 20:22:16');
INSERT INTO `alitest` VALUES ('2109', 'aliServer', '0', '27', '56', '0', '770', '2021-05-05 20:22:21');
INSERT INTO `alitest` VALUES ('2110', 'aliServer', '0', '27', '55', '0', '773', '2021-05-05 20:22:26');
INSERT INTO `alitest` VALUES ('2111', 'aliServer', '0', '27', '56', '0', '769', '2021-05-05 20:22:31');
INSERT INTO `alitest` VALUES ('2112', 'aliServer', '0', '27', '55', '0', '769', '2021-05-05 20:22:36');
INSERT INTO `alitest` VALUES ('2113', 'aliServer', '0', '27', '55', '0', '769', '2021-05-05 20:22:41');
INSERT INTO `alitest` VALUES ('2114', 'aliServer', '0', '27', '55', '0', '768', '2021-05-05 20:22:46');
INSERT INTO `alitest` VALUES ('2115', 'aliServer', '0', '27', '55', '0', '768', '2021-05-05 20:22:51');
INSERT INTO `alitest` VALUES ('2116', 'aliServer', '0', '27', '55', '0', '769', '2021-05-05 20:22:56');
INSERT INTO `alitest` VALUES ('2117', 'aliServer', '0', '27', '55', '0', '768', '2021-05-05 20:23:01');
INSERT INTO `alitest` VALUES ('2118', 'aliServer', '0', '27', '55', '0', '766', '2021-05-05 20:23:06');
INSERT INTO `alitest` VALUES ('2119', 'aliServer', '0', '27', '55', '0', '766', '2021-05-05 20:23:11');
INSERT INTO `alitest` VALUES ('2120', 'aliServer', '0', '27', '56', '0', '765', '2021-05-05 20:23:16');
INSERT INTO `alitest` VALUES ('2121', 'aliServer', '0', '27', '55', '0', '765', '2021-05-05 20:23:21');
INSERT INTO `alitest` VALUES ('2122', 'aliServer', '0', '27', '55', '0', '765', '2021-05-05 20:23:26');
INSERT INTO `alitest` VALUES ('2123', 'aliServer', '0', '27', '55', '0', '765', '2021-05-05 20:23:31');
INSERT INTO `alitest` VALUES ('2124', 'aliServer', '0', '27', '55', '0', '765', '2021-05-05 20:23:36');
INSERT INTO `alitest` VALUES ('2125', 'aliServer', '0', '27', '55', '0', '764', '2021-05-05 20:23:41');
INSERT INTO `alitest` VALUES ('2126', 'aliServer', '0', '27', '55', '0', '765', '2021-05-05 20:23:46');
INSERT INTO `alitest` VALUES ('2127', 'aliServer', '0', '27', '55', '0', '764', '2021-05-05 20:23:51');
INSERT INTO `alitest` VALUES ('2128', 'aliServer', '0', '27', '55', '0', '763', '2021-05-05 20:23:56');
INSERT INTO `alitest` VALUES ('2129', 'aliServer', '0', '27', '55', '0', '763', '2021-05-05 20:24:01');
INSERT INTO `alitest` VALUES ('2130', 'aliServer', '0', '27', '55', '0', '763', '2021-05-05 20:24:06');
INSERT INTO `alitest` VALUES ('2131', 'aliServer', '0', '27', '55', '0', '762', '2021-05-05 20:24:11');
INSERT INTO `alitest` VALUES ('2132', 'aliServer', '0', '27', '55', '0', '762', '2021-05-05 20:24:16');
INSERT INTO `alitest` VALUES ('2133', 'aliServer', '0', '27', '55', '0', '761', '2021-05-05 20:24:21');
INSERT INTO `alitest` VALUES ('2134', 'aliServer', '0', '27', '55', '0', '762', '2021-05-05 20:24:26');
INSERT INTO `alitest` VALUES ('2135', 'aliServer', '0', '27', '55', '0', '761', '2021-05-05 20:24:31');
INSERT INTO `alitest` VALUES ('2136', 'aliServer', '0', '27', '55', '0', '760', '2021-05-05 20:24:36');
INSERT INTO `alitest` VALUES ('2137', 'aliServer', '0', '27', '55', '0', '760', '2021-05-05 20:24:41');
INSERT INTO `alitest` VALUES ('2138', 'aliServer', '0', '27', '55', '0', '760', '2021-05-05 20:24:46');
INSERT INTO `alitest` VALUES ('2139', 'aliServer', '0', '27', '55', '0', '760', '2021-05-05 20:24:51');
INSERT INTO `alitest` VALUES ('2140', 'aliServer', '0', '27', '55', '0', '759', '2021-05-05 20:24:58');
INSERT INTO `alitest` VALUES ('2141', 'aliServer', '0', '27', '55', '0', '759', '2021-05-05 20:25:01');
INSERT INTO `alitest` VALUES ('2142', 'aliServer', '0', '27', '55', '0', '758', '2021-05-05 20:25:06');
INSERT INTO `alitest` VALUES ('2143', 'aliServer', '0', '27', '55', '0', '760', '2021-05-05 20:25:11');
INSERT INTO `alitest` VALUES ('2144', 'aliServer', '0', '27', '55', '0', '758', '2021-05-05 20:25:16');
INSERT INTO `alitest` VALUES ('2145', 'aliServer', '0', '27', '55', '0', '758', '2021-05-05 20:25:21');
INSERT INTO `alitest` VALUES ('2146', 'aliServer', '0', '27', '55', '0', '757', '2021-05-05 20:25:26');
INSERT INTO `alitest` VALUES ('2147', 'aliServer', '0', '27', '55', '0', '758', '2021-05-05 20:25:31');
INSERT INTO `alitest` VALUES ('2148', 'aliServer', '0', '27', '55', '0', '756', '2021-05-05 20:25:36');
INSERT INTO `alitest` VALUES ('2149', 'aliServer', '0', '27', '55', '0', '757', '2021-05-05 20:25:41');
INSERT INTO `alitest` VALUES ('2150', 'aliServer', '0', '27', '55', '0', '756', '2021-05-05 20:25:46');
INSERT INTO `alitest` VALUES ('2151', 'aliServer', '0', '27', '55', '0', '756', '2021-05-05 20:25:51');
INSERT INTO `alitest` VALUES ('2152', 'aliServer', '0', '27', '55', '0', '756', '2021-05-05 20:25:56');
INSERT INTO `alitest` VALUES ('2153', 'aliServer', '0', '27', '55', '0', '756', '2021-05-05 20:26:01');
INSERT INTO `alitest` VALUES ('2154', 'aliServer', '0', '27', '55', '0', '754', '2021-05-05 20:26:06');
INSERT INTO `alitest` VALUES ('2155', 'aliServer', '0', '27', '55', '0', '754', '2021-05-05 20:26:11');
INSERT INTO `alitest` VALUES ('2156', 'aliServer', '0', '27', '56', '0', '754', '2021-05-05 20:26:16');
INSERT INTO `alitest` VALUES ('2157', 'aliServer', '0', '27', '55', '0', '754', '2021-05-05 20:26:21');
INSERT INTO `alitest` VALUES ('2158', 'aliServer', '0', '27', '56', '0', '753', '2021-05-05 20:26:26');
INSERT INTO `alitest` VALUES ('2159', 'aliServer', '0', '27', '55', '0', '752', '2021-05-05 20:26:31');
INSERT INTO `alitest` VALUES ('2160', 'aliServer', '0', '27', '56', '0', '751', '2021-05-05 20:26:36');
INSERT INTO `alitest` VALUES ('2161', 'aliServer', '0', '27', '55', '0', '750', '2021-05-05 20:26:41');
INSERT INTO `alitest` VALUES ('2162', 'aliServer', '0', '27', '55', '0', '752', '2021-05-05 20:26:46');
INSERT INTO `alitest` VALUES ('2163', 'aliServer', '0', '27', '55', '0', '750', '2021-05-05 20:26:51');
INSERT INTO `alitest` VALUES ('2164', 'aliServer', '0', '27', '55', '0', '750', '2021-05-05 20:26:56');
INSERT INTO `alitest` VALUES ('2165', 'aliServer', '0', '27', '55', '0', '749', '2021-05-05 20:27:01');
INSERT INTO `alitest` VALUES ('2166', 'aliServer', '0', '27', '55', '0', '749', '2021-05-05 20:27:06');
INSERT INTO `alitest` VALUES ('2167', 'aliServer', '0', '27', '55', '0', '749', '2021-05-05 20:27:11');
INSERT INTO `alitest` VALUES ('2168', 'aliServer', '0', '27', '55', '0', '749', '2021-05-05 20:27:16');
INSERT INTO `alitest` VALUES ('2169', 'aliServer', '0', '27', '55', '0', '748', '2021-05-05 20:27:21');
INSERT INTO `alitest` VALUES ('2170', 'aliServer', '0', '27', '55', '0', '748', '2021-05-05 20:27:26');
INSERT INTO `alitest` VALUES ('2171', 'aliServer', '0', '27', '55', '0', '748', '2021-05-05 20:27:31');
INSERT INTO `alitest` VALUES ('2172', 'aliServer', '0', '27', '55', '0', '748', '2021-05-05 20:27:36');
INSERT INTO `alitest` VALUES ('2173', 'aliServer', '0', '27', '55', '0', '748', '2021-05-05 20:27:41');
INSERT INTO `alitest` VALUES ('2174', 'aliServer', '0', '27', '55', '0', '747', '2021-05-05 20:27:46');
INSERT INTO `alitest` VALUES ('2175', 'aliServer', '0', '27', '55', '0', '747', '2021-05-05 20:27:51');
INSERT INTO `alitest` VALUES ('2176', 'aliServer', '0', '27', '55', '0', '746', '2021-05-05 20:27:56');
INSERT INTO `alitest` VALUES ('2177', 'aliServer', '0', '27', '55', '0', '747', '2021-05-05 20:28:01');
INSERT INTO `alitest` VALUES ('2178', 'aliServer', '0', '27', '56', '0', '746', '2021-05-05 20:28:06');
INSERT INTO `alitest` VALUES ('2179', 'aliServer', '0', '27', '55', '0', '746', '2021-05-05 20:28:11');
INSERT INTO `alitest` VALUES ('2180', 'aliServer', '0', '27', '55', '0', '746', '2021-05-05 20:28:16');
INSERT INTO `alitest` VALUES ('2181', 'aliServer', '0', '27', '55', '0', '745', '2021-05-05 20:28:21');
INSERT INTO `alitest` VALUES ('2182', 'aliServer', '0', '27', '55', '0', '745', '2021-05-05 20:28:26');
INSERT INTO `alitest` VALUES ('2183', 'aliServer', '0', '27', '56', '0', '745', '2021-05-05 20:28:31');
INSERT INTO `alitest` VALUES ('2184', 'aliServer', '0', '27', '55', '0', '744', '2021-05-05 20:28:36');
INSERT INTO `alitest` VALUES ('2185', 'aliServer', '0', '27', '55', '0', '744', '2021-05-05 20:28:41');
INSERT INTO `alitest` VALUES ('2186', 'aliServer', '0', '27', '55', '0', '742', '2021-05-05 20:28:46');
INSERT INTO `alitest` VALUES ('2187', 'aliServer', '0', '27', '56', '0', '742', '2021-05-05 20:28:51');
INSERT INTO `alitest` VALUES ('2188', 'aliServer', '0', '27', '55', '0', '740', '2021-05-05 20:28:56');
INSERT INTO `alitest` VALUES ('2189', 'aliServer', '0', '27', '55', '0', '741', '2021-05-05 20:29:01');
INSERT INTO `alitest` VALUES ('2190', 'aliServer', '0', '27', '55', '0', '741', '2021-05-05 20:29:06');
INSERT INTO `alitest` VALUES ('2191', 'aliServer', '0', '27', '55', '0', '740', '2021-05-05 20:29:11');
INSERT INTO `alitest` VALUES ('2192', 'aliServer', '0', '27', '55', '0', '740', '2021-05-05 20:29:16');
INSERT INTO `alitest` VALUES ('2193', 'aliServer', '0', '27', '55', '0', '746', '2021-05-05 20:29:21');
INSERT INTO `alitest` VALUES ('2194', 'aliServer', '0', '27', '59', '0', '728', '2021-05-05 20:29:26');
INSERT INTO `alitest` VALUES ('2195', 'aliServer', '0', '27', '59', '0', '726', '2021-05-05 20:29:31');
INSERT INTO `alitest` VALUES ('2196', 'aliServer', '0', '27', '58', '0', '727', '2021-05-05 20:29:36');
INSERT INTO `alitest` VALUES ('2197', 'aliServer', '0', '27', '58', '0', '726', '2021-05-05 20:29:41');
INSERT INTO `alitest` VALUES ('2198', 'aliServer', '0', '27', '57', '0', '724', '2021-05-05 20:29:46');
INSERT INTO `alitest` VALUES ('2199', 'aliServer', '0', '27', '57', '0', '725', '2021-05-05 20:29:51');
INSERT INTO `alitest` VALUES ('2200', 'aliServer', '0', '27', '56', '0', '723', '2021-05-05 20:29:56');
INSERT INTO `alitest` VALUES ('2201', 'aliServer', '0', '27', '56', '0', '720', '2021-05-05 20:30:01');
INSERT INTO `alitest` VALUES ('2202', 'aliServer', '0', '27', '56', '0', '720', '2021-05-05 20:30:06');
INSERT INTO `alitest` VALUES ('2203', 'aliServer', '0', '27', '56', '0', '720', '2021-05-05 20:30:11');
INSERT INTO `alitest` VALUES ('2204', 'aliServer', '0', '27', '56', '0', '720', '2021-05-05 20:30:16');
INSERT INTO `alitest` VALUES ('2205', 'aliServer', '0', '27', '56', '0', '720', '2021-05-05 20:30:21');
INSERT INTO `alitest` VALUES ('2206', 'aliServer', '0', '27', '56', '0', '721', '2021-05-05 20:30:26');
INSERT INTO `alitest` VALUES ('2207', 'aliServer', '0', '27', '56', '0', '716', '2021-05-05 20:30:31');
INSERT INTO `alitest` VALUES ('2208', 'aliServer', '0', '27', '56', '0', '716', '2021-05-05 20:30:36');
INSERT INTO `alitest` VALUES ('2209', 'aliServer', '0', '27', '55', '0', '715', '2021-05-05 20:30:41');
INSERT INTO `alitest` VALUES ('2210', 'aliServer', '0', '27', '56', '0', '715', '2021-05-05 20:30:46');
INSERT INTO `alitest` VALUES ('2211', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:30:51');
INSERT INTO `alitest` VALUES ('2212', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:30:56');
INSERT INTO `alitest` VALUES ('2213', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:31:01');
INSERT INTO `alitest` VALUES ('2214', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:31:06');
INSERT INTO `alitest` VALUES ('2215', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:31:11');
INSERT INTO `alitest` VALUES ('2216', 'aliServer', '0', '27', '56', '0', '712', '2021-05-05 20:31:16');
INSERT INTO `alitest` VALUES ('2217', 'aliServer', '0', '27', '56', '0', '713', '2021-05-05 20:31:21');
INSERT INTO `alitest` VALUES ('2218', 'aliServer', '0', '27', '56', '0', '712', '2021-05-05 20:31:26');
INSERT INTO `alitest` VALUES ('2219', 'aliServer', '0', '27', '56', '0', '712', '2021-05-05 20:31:31');
INSERT INTO `alitest` VALUES ('2220', 'aliServer', '0', '27', '56', '0', '712', '2021-05-05 20:31:36');
INSERT INTO `alitest` VALUES ('2221', 'aliServer', '0', '27', '56', '0', '714', '2021-05-05 20:31:41');
INSERT INTO `alitest` VALUES ('2222', 'aliServer', '0', '27', '56', '0', '711', '2021-05-05 20:31:46');
INSERT INTO `alitest` VALUES ('2223', 'aliServer', '0', '27', '56', '0', '712', '2021-05-05 20:31:51');
INSERT INTO `alitest` VALUES ('2224', 'aliServer', '0', '27', '56', '0', '711', '2021-05-05 20:31:56');
INSERT INTO `alitest` VALUES ('2225', 'aliServer', '0', '27', '56', '0', '711', '2021-05-05 20:32:01');
INSERT INTO `alitest` VALUES ('2226', 'aliServer', '0', '27', '56', '0', '710', '2021-05-05 20:32:06');
INSERT INTO `alitest` VALUES ('2227', 'aliServer', '0', '27', '56', '0', '710', '2021-05-05 20:32:11');
INSERT INTO `alitest` VALUES ('2228', 'aliServer', '0', '27', '56', '0', '710', '2021-05-05 20:32:16');
INSERT INTO `alitest` VALUES ('2229', 'aliServer', '0', '27', '56', '0', '709', '2021-05-05 20:32:21');
INSERT INTO `alitest` VALUES ('2230', 'aliServer', '0', '27', '56', '0', '709', '2021-05-05 20:32:26');
INSERT INTO `alitest` VALUES ('2231', 'aliServer', '0', '27', '56', '0', '709', '2021-05-05 20:32:31');
INSERT INTO `alitest` VALUES ('2232', 'aliServer', '0', '27', '56', '0', '709', '2021-05-05 20:32:37');
INSERT INTO `alitest` VALUES ('2233', 'aliServer', '0', '27', '56', '0', '708', '2021-05-05 20:32:41');
INSERT INTO `alitest` VALUES ('2234', 'aliServer', '0', '27', '56', '0', '708', '2021-05-05 20:32:46');
INSERT INTO `alitest` VALUES ('2235', 'aliServer', '0', '27', '56', '0', '708', '2021-05-05 20:32:51');
INSERT INTO `alitest` VALUES ('2236', 'aliServer', '0', '27', '56', '0', '708', '2021-05-05 20:32:56');
INSERT INTO `alitest` VALUES ('2237', 'aliServer', '0', '27', '56', '0', '706', '2021-05-05 20:33:01');
INSERT INTO `alitest` VALUES ('2238', 'aliServer', '0', '27', '56', '0', '706', '2021-05-05 20:33:06');
INSERT INTO `alitest` VALUES ('2239', 'aliServer', '0', '27', '56', '0', '706', '2021-05-05 20:33:11');
INSERT INTO `alitest` VALUES ('2240', 'aliServer', '0', '27', '56', '0', '705', '2021-05-05 20:33:16');
INSERT INTO `alitest` VALUES ('2241', 'aliServer', '0', '27', '56', '0', '705', '2021-05-05 20:33:21');
INSERT INTO `alitest` VALUES ('2242', 'aliServer', '0', '27', '56', '0', '705', '2021-05-05 20:33:26');
INSERT INTO `alitest` VALUES ('2243', 'aliServer', '0', '27', '56', '0', '703', '2021-05-05 20:33:31');
INSERT INTO `alitest` VALUES ('2244', 'aliServer', '0', '27', '56', '0', '702', '2021-05-05 20:33:36');
INSERT INTO `alitest` VALUES ('2245', 'aliServer', '0', '27', '56', '0', '702', '2021-05-05 20:33:41');
INSERT INTO `alitest` VALUES ('2246', 'aliServer', '0', '27', '56', '0', '700', '2021-05-05 20:33:46');
INSERT INTO `alitest` VALUES ('2247', 'aliServer', '0', '27', '56', '0', '698', '2021-05-05 20:33:51');
INSERT INTO `alitest` VALUES ('2248', 'aliServer', '0', '27', '56', '0', '701', '2021-05-05 20:33:56');
INSERT INTO `alitest` VALUES ('2249', 'aliServer', '0', '27', '56', '0', '698', '2021-05-05 20:34:01');
INSERT INTO `alitest` VALUES ('2250', 'aliServer', '0', '27', '56', '0', '697', '2021-05-05 20:34:06');
INSERT INTO `alitest` VALUES ('2251', 'aliServer', '0', '27', '56', '0', '698', '2021-05-05 20:34:11');
INSERT INTO `alitest` VALUES ('2252', 'aliServer', '0', '27', '56', '0', '700', '2021-05-05 20:34:16');
INSERT INTO `alitest` VALUES ('2253', 'aliServer', '0', '27', '56', '0', '699', '2021-05-05 20:34:21');
INSERT INTO `alitest` VALUES ('2254', 'aliServer', '0', '27', '56', '0', '696', '2021-05-05 20:34:26');
INSERT INTO `alitest` VALUES ('2255', 'aliServer', '0', '27', '56', '0', '696', '2021-05-05 20:34:31');
INSERT INTO `alitest` VALUES ('2256', 'aliServer', '0', '27', '57', '0', '694', '2021-05-05 20:34:36');
INSERT INTO `alitest` VALUES ('2257', 'aliServer', '0', '27', '57', '0', '694', '2021-05-05 20:34:41');
INSERT INTO `alitest` VALUES ('2258', 'aliServer', '0', '27', '57', '0', '696', '2021-05-05 20:34:46');
INSERT INTO `alitest` VALUES ('2259', 'aliServer', '0', '27', '57', '0', '694', '2021-05-05 20:34:51');
INSERT INTO `alitest` VALUES ('2260', 'aliServer', '0', '27', '57', '0', '694', '2021-05-05 20:34:56');
INSERT INTO `alitest` VALUES ('2261', 'aliServer', '0', '27', '57', '0', '694', '2021-05-05 20:35:01');
INSERT INTO `alitest` VALUES ('2262', 'aliServer', '0', '27', '57', '0', '693', '2021-05-05 20:35:06');
INSERT INTO `alitest` VALUES ('2263', 'aliServer', '0', '27', '57', '0', '693', '2021-05-05 20:35:11');
INSERT INTO `alitest` VALUES ('2264', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:35:16');
INSERT INTO `alitest` VALUES ('2265', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:35:21');
INSERT INTO `alitest` VALUES ('2266', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:35:26');
INSERT INTO `alitest` VALUES ('2267', 'aliServer', '0', '27', '56', '0', '693', '2021-05-05 20:35:31');
INSERT INTO `alitest` VALUES ('2268', 'aliServer', '0', '27', '57', '0', '693', '2021-05-05 20:35:36');
INSERT INTO `alitest` VALUES ('2269', 'aliServer', '0', '27', '56', '0', '692', '2021-05-05 20:35:41');
INSERT INTO `alitest` VALUES ('2270', 'aliServer', '0', '27', '56', '0', '694', '2021-05-05 20:35:46');
INSERT INTO `alitest` VALUES ('2271', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:35:51');
INSERT INTO `alitest` VALUES ('2272', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:35:56');
INSERT INTO `alitest` VALUES ('2273', 'aliServer', '0', '27', '56', '0', '692', '2021-05-05 20:36:01');
INSERT INTO `alitest` VALUES ('2274', 'aliServer', '0', '27', '57', '0', '692', '2021-05-05 20:36:06');
INSERT INTO `alitest` VALUES ('2275', 'aliServer', '0', '27', '56', '0', '691', '2021-05-05 20:36:11');
INSERT INTO `alitest` VALUES ('2276', 'aliServer', '0', '27', '57', '0', '691', '2021-05-05 20:36:16');
INSERT INTO `alitest` VALUES ('2277', 'aliServer', '0', '27', '56', '0', '694', '2021-05-05 20:36:21');
INSERT INTO `alitest` VALUES ('2278', 'aliServer', '0', '27', '56', '0', '691', '2021-05-05 20:36:26');
INSERT INTO `alitest` VALUES ('2279', 'aliServer', '0', '27', '56', '0', '691', '2021-05-05 20:36:31');
INSERT INTO `alitest` VALUES ('2280', 'aliServer', '0', '27', '56', '0', '691', '2021-05-05 20:36:36');
INSERT INTO `alitest` VALUES ('2281', 'aliServer', '0', '27', '57', '0', '691', '2021-05-05 20:36:41');
INSERT INTO `alitest` VALUES ('2282', 'aliServer', '0', '27', '57', '0', '691', '2021-05-05 20:36:46');
INSERT INTO `alitest` VALUES ('2283', 'aliServer', '0', '27', '57', '0', '690', '2021-05-05 20:36:51');
INSERT INTO `alitest` VALUES ('2284', 'aliServer', '0', '27', '57', '0', '690', '2021-05-05 20:36:56');
INSERT INTO `alitest` VALUES ('2285', 'aliServer', '0', '27', '57', '0', '690', '2021-05-05 20:37:01');
INSERT INTO `alitest` VALUES ('2286', 'aliServer', '0', '27', '57', '0', '690', '2021-05-05 20:37:06');
INSERT INTO `alitest` VALUES ('2287', 'aliServer', '0', '27', '58', '0', '690', '2021-05-05 20:37:11');
INSERT INTO `alitest` VALUES ('2288', 'aliServer', '0', '27', '58', '0', '691', '2021-05-05 20:37:16');
INSERT INTO `alitest` VALUES ('2289', 'aliServer', '0', '27', '58', '0', '690', '2021-05-05 20:37:21');
INSERT INTO `alitest` VALUES ('2290', 'aliServer', '0', '27', '58', '0', '681', '2021-05-05 20:37:26');
INSERT INTO `alitest` VALUES ('2291', 'aliServer', '0', '27', '58', '0', '681', '2021-05-05 20:37:31');
INSERT INTO `alitest` VALUES ('2292', 'aliServer', '0', '27', '58', '0', '682', '2021-05-05 20:37:36');
INSERT INTO `alitest` VALUES ('2293', 'aliServer', '0', '27', '58', '0', '680', '2021-05-05 20:37:41');
INSERT INTO `alitest` VALUES ('2294', 'aliServer', '0', '27', '57', '0', '679', '2021-05-05 20:37:46');
INSERT INTO `alitest` VALUES ('2295', 'aliServer', '0', '27', '57', '0', '678', '2021-05-05 20:37:51');
INSERT INTO `alitest` VALUES ('2296', 'aliServer', '0', '27', '57', '0', '678', '2021-05-05 20:37:56');
INSERT INTO `alitest` VALUES ('2297', 'aliServer', '0', '27', '57', '0', '676', '2021-05-05 20:38:01');
INSERT INTO `alitest` VALUES ('2298', 'aliServer', '0', '27', '57', '0', '676', '2021-05-05 20:38:06');
INSERT INTO `alitest` VALUES ('2299', 'aliServer', '0', '27', '57', '0', '675', '2021-05-05 20:38:11');
INSERT INTO `alitest` VALUES ('2300', 'aliServer', '0', '27', '57', '0', '675', '2021-05-05 20:38:16');
INSERT INTO `alitest` VALUES ('2301', 'aliServer', '0', '27', '57', '0', '670', '2021-05-05 20:38:21');
INSERT INTO `alitest` VALUES ('2302', 'aliServer', '0', '27', '57', '0', '666', '2021-05-05 20:38:26');
INSERT INTO `alitest` VALUES ('2303', 'aliServer', '0', '27', '57', '0', '663', '2021-05-05 20:38:31');
INSERT INTO `alitest` VALUES ('2304', 'aliServer', '0', '27', '57', '0', '664', '2021-05-05 20:38:36');
INSERT INTO `alitest` VALUES ('2305', 'aliServer', '0', '27', '57', '0', '663', '2021-05-05 20:38:41');
INSERT INTO `alitest` VALUES ('2306', 'aliServer', '0', '27', '57', '0', '663', '2021-05-05 20:38:46');
INSERT INTO `alitest` VALUES ('2307', 'aliServer', '0', '27', '57', '0', '662', '2021-05-05 20:38:51');
INSERT INTO `alitest` VALUES ('2308', 'aliServer', '0', '27', '57', '0', '660', '2021-05-05 20:38:56');
INSERT INTO `alitest` VALUES ('2309', 'aliServer', '0', '27', '57', '0', '660', '2021-05-05 20:39:01');
INSERT INTO `alitest` VALUES ('2310', 'aliServer', '0', '27', '57', '0', '661', '2021-05-05 20:39:06');
INSERT INTO `alitest` VALUES ('2311', 'aliServer', '0', '27', '57', '0', '658', '2021-05-05 20:39:11');
INSERT INTO `alitest` VALUES ('2312', 'aliServer', '0', '27', '57', '0', '655', '2021-05-05 20:39:16');
INSERT INTO `alitest` VALUES ('2313', 'aliServer', '0', '27', '57', '0', '657', '2021-05-05 20:39:21');
INSERT INTO `alitest` VALUES ('2314', 'aliServer', '0', '27', '56', '0', '654', '2021-05-05 20:39:26');
INSERT INTO `alitest` VALUES ('2315', 'aliServer', '0', '27', '56', '0', '654', '2021-05-05 20:39:31');
INSERT INTO `alitest` VALUES ('2316', 'aliServer', '0', '27', '56', '0', '654', '2021-05-05 20:39:36');
INSERT INTO `alitest` VALUES ('2317', 'aliServer', '0', '27', '56', '0', '653', '2021-05-05 20:39:41');
INSERT INTO `alitest` VALUES ('2318', 'aliServer', '0', '27', '56', '0', '654', '2021-05-05 20:39:46');
INSERT INTO `alitest` VALUES ('2319', 'aliServer', '0', '27', '56', '0', '646', '2021-05-05 20:39:51');
INSERT INTO `alitest` VALUES ('2320', 'aliServer', '0', '27', '56', '0', '653', '2021-05-05 20:39:56');
INSERT INTO `alitest` VALUES ('2321', 'aliServer', '0', '27', '56', '0', '653', '2021-05-05 20:40:01');
INSERT INTO `alitest` VALUES ('2322', 'aliServer', '0', '27', '56', '0', '650', '2021-05-05 20:40:06');
INSERT INTO `alitest` VALUES ('2323', 'aliServer', '0', '27', '56', '0', '651', '2021-05-05 20:40:11');

-- ----------------------------
-- Table structure for equipment
-- ----------------------------
DROP TABLE IF EXISTS `equipment`;
CREATE TABLE `equipment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `productKey` varchar(255) DEFAULT NULL,
  `productSecret` varchar(255) DEFAULT NULL,
  `eqName` varchar(255) DEFAULT NULL,
  `deviceSecret` varchar(255) DEFAULT NULL,
  `userName` varchar(255) DEFAULT NULL,
  `state` tinyint(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '设备1', 'productSecret', 'aliserver', 'deviceSecret', 'Poison.', '1');
INSERT INTO `equipment` VALUES ('2', '1', null, '设备2', null, '', '0');
INSERT INTO `equipment` VALUES ('3', null, null, '3', null, null, '0');

-- ----------------------------
-- Table structure for eq_data
-- ----------------------------
DROP TABLE IF EXISTS `eq_data`;
CREATE TABLE `eq_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `eqName` varchar(255) DEFAULT NULL,
  `wd` varchar(255) DEFAULT NULL,
  `ph` varchar(255) DEFAULT NULL,
  `zl` varchar(255) DEFAULT NULL,
  `gz` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of eq_data
-- ----------------------------
INSERT INTO `eq_data` VALUES ('1', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 0:00');
INSERT INTO `eq_data` VALUES ('2', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 2:00');
INSERT INTO `eq_data` VALUES ('3', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 4:00');
INSERT INTO `eq_data` VALUES ('4', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 6:00');
INSERT INTO `eq_data` VALUES ('5', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 8:00');
INSERT INTO `eq_data` VALUES ('6', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 10:00');
INSERT INTO `eq_data` VALUES ('7', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 12:00');
INSERT INTO `eq_data` VALUES ('8', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 14:00');
INSERT INTO `eq_data` VALUES ('9', '设备1', '36', '6.5', '39kg', '500', '2020-10-06 16:00');
INSERT INTO `eq_data` VALUES ('10', '设备1', '36', '3', '', '', '2020-10-05 18:00');
INSERT INTO `eq_data` VALUES ('11', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 20:00');
INSERT INTO `eq_data` VALUES ('12', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 22:00');
INSERT INTO `eq_data` VALUES ('13', '设备1', '36', '6.5', '39kg', '500', '2020-10-05 24:00');
INSERT INTO `eq_data` VALUES ('14', '设备1', '36', '6.5', '39kg', '500', '2021-10-05 13:00');
INSERT INTO `eq_data` VALUES ('15', '设备1', '36', '6.5', '39kg', '500', '2021-10-05 13:00');
INSERT INTO `eq_data` VALUES ('16', '设备1', '36', '6.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('17', '设备1', '36', '6.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('18', '设备1', '36', '6.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('19', '设备1', '36', '6.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('20', '设备1', '36', '7.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('21', '设备1', '36', '8.5', '39kg', '500', null);
INSERT INTO `eq_data` VALUES ('22', '设备2', '36', '8.2', '39kg', '400', null);

-- ----------------------------
-- Table structure for feedback
-- ----------------------------
DROP TABLE IF EXISTS `feedback`;
CREATE TABLE `feedback` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `time` varchar(255) DEFAULT NULL,
  `state` tinyint(1) DEFAULT NULL,
  `fbcontent` varchar(255) DEFAULT NULL,
  `admin` varchar(255) DEFAULT NULL,
  `fbtype` varchar(255) DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '传感器数据不准确', 'lcc', '2020-9-25 10:00', '1', '请拨打182', 'lcc', '传感器问题', null);
INSERT INTO `feedback` VALUES ('16', '123', 'D', '2021-05-15 13:54:41', '1', '12', '312', '功能障碍', '21');

-- ----------------------------
-- Table structure for mainmenu
-- ----------------------------
DROP TABLE IF EXISTS `mainmenu`;
CREATE TABLE `mainmenu` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mainmenu
-- ----------------------------
INSERT INTO `mainmenu` VALUES ('100', '用户管理', '/admin');
INSERT INTO `mainmenu` VALUES ('200', '设备管理', '/user');
INSERT INTO `mainmenu` VALUES ('300', '反馈信息', '/feedback');

-- ----------------------------
-- Table structure for submenu
-- ----------------------------
DROP TABLE IF EXISTS `submenu`;
CREATE TABLE `submenu` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `path` varchar(255) DEFAULT NULL,
  `mid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `id` (`mid`),
  CONSTRAINT `id` FOREIGN KEY (`mid`) REFERENCES `mainmenu` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of submenu
-- ----------------------------
INSERT INTO `submenu` VALUES ('101', '用户列表', '/user', '100');
INSERT INTO `submenu` VALUES ('201', '添加设备', '/equipmentAdd', '200');
INSERT INTO `submenu` VALUES ('202', '设备信息', '/equipment', '200');
INSERT INTO `submenu` VALUES ('301', '用户反馈', '/feedback', '300');

-- ----------------------------
-- Table structure for user_info
-- ----------------------------
DROP TABLE IF EXISTS `user_info`;
CREATE TABLE `user_info` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) CHARACTER SET utf8mb4 DEFAULT NULL,
  `password` varchar(255) DEFAULT '',
  `address` varchar(255) DEFAULT NULL,
  `role` varchar(255) DEFAULT NULL,
  `state` tinyint(255) DEFAULT NULL,
  `eqName` varchar(255) DEFAULT NULL,
  `contacts` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'lcc', '123456', '海南', '管理员用户', '1', '1', '18289298006');
INSERT INTO `user_info` VALUES ('4', 'lcc4', '12345678', '广东', '管理员用户', '0', '2', '123');
INSERT INTO `user_info` VALUES ('10', 'D', '', '福建三明学院', '普通用户', '0', 'aliserver', '18289298006');
INSERT INTO `user_info` VALUES ('13', 'Change', '', '1', '普通用户', '0', '1', '1');
INSERT INTO `user_info` VALUES ('14', 'Poison.', '', null, '普通用户', '1', 'aliserver', null);

-- ----------------------------
-- Table structure for wx_switch
-- ----------------------------
DROP TABLE IF EXISTS `wx_switch`;
CREATE TABLE `wx_switch` (
  `id` int(255) NOT NULL AUTO_INCREMENT,
  `switchWd` tinyint(255) DEFAULT NULL,
  `switchZl` tinyint(255) DEFAULT NULL,
  `switchGz` tinyint(255) DEFAULT NULL,
  `eqName` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of wx_switch
-- ----------------------------
INSERT INTO `wx_switch` VALUES ('1', '0', '33', '28', '设备1');
