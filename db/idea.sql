/*
Navicat MySQL Data Transfer

Source Server         : lccdb
Source Server Version : 50519
Source Host           : localhost:3306
Source Database       : idea

Target Server Type    : MYSQL
Target Server Version : 50519
File Encoding         : 65001

Date: 2021-04-10 11:02:49
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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

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
INSERT INTO `alitest` VALUES ('33', 'aliServer', '1', '17', '60', '1', '768', '2020-12-31 20:39:32');
INSERT INTO `alitest` VALUES ('34', 'aliServer', '1', '17', '61', '1', '793', '2020-12-31 20:38:07');
INSERT INTO `alitest` VALUES ('35', 'aliServer', '0', '10', '0', '1', '729', '2021-01-01 10:04:40');
INSERT INTO `alitest` VALUES ('36', 'aliServer', '0', '17', '63', '1', '759', '2021-01-01 10:04:45');
INSERT INTO `alitest` VALUES ('37', 'aliServer', '0', '17', '63', '1', '778', '2021-01-01 10:04:50');
INSERT INTO `alitest` VALUES ('38', 'aliServer', '0', '17', '65', '1', '792', '2021-01-01 10:04:55');
INSERT INTO `alitest` VALUES ('39', 'aliServer', '0', '17', '65', '1', '796', '2021-01-01 10:05:00');
INSERT INTO `alitest` VALUES ('40', 'aliServer', '0', '17', '65', '1', '798', '2021-01-01 10:05:05');
INSERT INTO `alitest` VALUES ('41', 'aliServer', '0', '17', '65', '1', '800', '2021-01-01 10:05:10');
INSERT INTO `alitest` VALUES ('42', 'aliServer', '0', '17', '65', '1', '400', '2021-01-01 10:05:15');
INSERT INTO `alitest` VALUES ('43', 'aliServer', '0', '17', '65', '1', '578', '2021-01-01 10:05:20');
INSERT INTO `alitest` VALUES ('44', 'aliServer', '0', '17', '65', '1', '600', '2021-01-01 10:05:25');
INSERT INTO `alitest` VALUES ('45', 'aliServer', '0', '17', '64', '1', '796', '2021-01-01 10:05:30');
INSERT INTO `alitest` VALUES ('46', 'aliServer', '0', '17', '64', '1', '797', '2021-01-01 10:05:35');
INSERT INTO `alitest` VALUES ('47', 'aliServer', '1', '17', '60', '1', '788', '2021-01-01 10:05:40');
INSERT INTO `alitest` VALUES ('48', 'aliServer', '1', '17', '63', '1', '786', '2021-01-01 10:05:45');
INSERT INTO `alitest` VALUES ('49', 'aliServer', '0', '17', '64', '1', '792', '2021-01-01 10:05:50');
INSERT INTO `alitest` VALUES ('50', 'aliServer', '0', '22', '64', '1', '793', '2021-04-06 19:05:55');
INSERT INTO `alitest` VALUES ('51', 'aliServer', '0', '22', '999', '1', '792', '2021-04-06 19:06:00');

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of equipment
-- ----------------------------
INSERT INTO `equipment` VALUES ('1', '设备1', '1', 'aliserver', '1', 'D', '1');
INSERT INTO `equipment` VALUES ('2', '1', null, '设备2', null, 'sa', '1');
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of feedback
-- ----------------------------
INSERT INTO `feedback` VALUES ('1', '传感器数据不准确', 'lcc', '2020-9-25 10:00', '1', '请拨打182', 'lcc', '传感器问题', null);
INSERT INTO `feedback` VALUES ('8', '设备异常', 'D', '2021-04-09 22:09:57', '1', '请拨打18289298006', 'lccsuper', '建议', '18289298006');
INSERT INTO `feedback` VALUES ('9', '接触不良', 'D', '2021-04-09 22:19:51', '1', '重新启动试试', 'lcc2', '2', '2');
INSERT INTO `feedback` VALUES ('10', '开关不灵敏', 'D', '2021-04-09 22:21:38', '1', '请重启或检查网络状况是否良好', 'lcc123', '开关障碍', '18289298006');

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user_info
-- ----------------------------
INSERT INTO `user_info` VALUES ('1', 'lcc', '123456', '海南', '管理员用户', '1', '1', '18289298007');
INSERT INTO `user_info` VALUES ('4', 'lcc4', '12345678', '广东', '管理员用户', '0', '2', '123');
INSERT INTO `user_info` VALUES ('7', 'dsa', 'dasddsad', '福建', '普通用户', '0', '2', null);
INSERT INTO `user_info` VALUES ('10', 'D', '', '福建三明学院', '普通用户', '1', 'aliserver', '18289298007');

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
