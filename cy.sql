/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50013
Source Host           : localhost:3306
Source Database       : cy

Target Server Type    : MYSQL
Target Server Version : 50013
File Encoding         : 65001

Date: 2017-05-03 20:47:01
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `article`
-- ----------------------------
DROP TABLE IF EXISTS `article`;
CREATE TABLE `article` (
  `arid` varchar(10) NOT NULL,
  `canumber` varchar(2) NOT NULL,
  `arnumber` varchar(2) NOT NULL,
  `artitle` varchar(500) NOT NULL,
  `arcontent` varchar(3000) NOT NULL,
  `aruser` varchar(20) NOT NULL,
  `artime` varchar(30) NOT NULL,
  `arstate` varchar(2) NOT NULL,
  `clicks` int(11) default NULL,
  PRIMARY KEY  (`arid`),
  KEY `canumber` (`canumber`),
  CONSTRAINT `FK_canumber` FOREIGN KEY (`canumber`) REFERENCES `catalog` (`canumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of article
-- ----------------------------
INSERT INTO `article` VALUES ('1', '3', '1', 'yjz', '666', 'yyy', '2017-03-08', '1', '500');
INSERT INTO `article` VALUES ('11', '4', '11', '11', '<p>1111</p>', '1', '1', '0', '0');
INSERT INTO `article` VALUES ('123', '4', '12', '测试图片', '<p><img src=\"images/1493693236376092712.jpg\" title=\"1493693236376092712.jpg\" alt=\"b113856e274d6f9b42303a150b00c411.jpg\"/></p>', '陈洋', '今天', '1', '0');
INSERT INTO `article` VALUES ('2', '1', '2', '6789上市', '6789集团上市', '叶剑忠', '2017-04-10', '1', '23');
INSERT INTO `article` VALUES ('22', '4', '11', '11', '<p>11<br/></p>', '11', '11', '1', '0');
INSERT INTO `article` VALUES ('23', '2', '23', '陈洋666', '<p><strong>今天快乐！！！</strong></p>', '陈洋', '11', '1', '0');
INSERT INTO `article` VALUES ('3', '2', '3', 'yejianzhong', 'www', 'yjz', '2017-03-08', '1', '23');
INSERT INTO `article` VALUES ('4', '4', '4', '6789创造世界记录', '6789集团666', '叶剑忠', '2017-04-10', '1', '345');
INSERT INTO `article` VALUES ('5', '5', '5', 'fdfsf', 'dwfad', 'dfasf', 'fdsfs', '1', '25698');
INSERT INTO `article` VALUES ('6', '6', '6', 'ewrqrqw', 'rewqrfdsaf', 'fdsaf', 'erwqrwqf', '1', '13211315');

-- ----------------------------
-- Table structure for `catalog`
-- ----------------------------
DROP TABLE IF EXISTS `catalog`;
CREATE TABLE `catalog` (
  `caid` int(11) NOT NULL auto_increment,
  `caname` varchar(10) NOT NULL,
  `canumber` varchar(2) NOT NULL,
  `castate` varchar(2) NOT NULL,
  PRIMARY KEY  (`caid`),
  KEY `canumber` (`canumber`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of catalog
-- ----------------------------
INSERT INTO `catalog` VALUES ('1', '叶剑忠', '4', '1');
INSERT INTO `catalog` VALUES ('2', 'yyy', '2', '1');
INSERT INTO `catalog` VALUES ('3', 'yjz', '3', '0');
INSERT INTO `catalog` VALUES ('4', 'cy', '1', '1');
INSERT INTO `catalog` VALUES ('5', 'oy', '5', '1');
INSERT INTO `catalog` VALUES ('6', 'fdasf', '6', '1');
INSERT INTO `catalog` VALUES ('7', '娱乐', '7', '1');

-- ----------------------------
-- Table structure for `images`
-- ----------------------------
DROP TABLE IF EXISTS `images`;
CREATE TABLE `images` (
  `imid` int(11) NOT NULL auto_increment,
  `imtitle` varchar(30) default NULL,
  `imname` varchar(30) NOT NULL,
  `imdate` varchar(30) NOT NULL,
  `imstate` varchar(2) NOT NULL,
  PRIMARY KEY  (`imid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of images
-- ----------------------------

-- ----------------------------
-- Table structure for `manager`
-- ----------------------------
DROP TABLE IF EXISTS `manager`;
CREATE TABLE `manager` (
  `managerid` int(11) NOT NULL auto_increment,
  `managername` varchar(20) NOT NULL,
  `passwd` varchar(15) NOT NULL,
  `mstate` varchar(2) NOT NULL,
  PRIMARY KEY  (`managerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of manager
-- ----------------------------
INSERT INTO `manager` VALUES ('11', '叶剑忠', '1996', '1');
INSERT INTO `manager` VALUES ('12', '陈洋', '1997', '1');
INSERT INTO `manager` VALUES ('13', '薛灵巧', '1997', '1');
