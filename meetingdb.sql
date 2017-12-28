/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : meetingdb

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2016-12-22 15:28:55
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for meeting
-- ----------------------------
DROP TABLE IF EXISTS `meeting`;
CREATE TABLE `meeting` (
  `meetingID` bigint(15) NOT NULL,
  `meetingDate` bigint(10) NOT NULL,
  `meetingStartTime` bigint(5) NOT NULL,
  `meetingEndTime` bigint(5) NOT NULL,
  `meetingStarter` varchar(10) NOT NULL,
  `meetingRoom` int(2) NOT NULL,
  `meetingStatus` int(1) NOT NULL,
  `meetingApplyTime` bigint(15) NOT NULL,
  `meetingGuest` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`meetingID`),
  UNIQUE KEY `meetingID_UNIQUE` (`meetingID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meeting
-- ----------------------------
INSERT INTO `meeting` VALUES ('201612211645291', '20161222', '1500', '1600', 'admin', '1', '1', '20161221164529', 'queen & king');
INSERT INTO `meeting` VALUES ('201612211908321', '20161224', '900', '1700', 'admin', '1', '1', '20161221190832', 'everyone');
INSERT INTO `meeting` VALUES ('201612211947541', '20161224', '900', '1800', 'theboss', '10', '1', '20161221194754', 'queen & king');
INSERT INTO `meeting` VALUES ('201612212111501', '20161222', '900', '1000', 'worker3', '3', '1', '20161221211150', '');
INSERT INTO `meeting` VALUES ('201612221348301', '20161222', '900', '1200', 'admin', '1', '1', '20161222134830', '');
INSERT INTO `meeting` VALUES ('201612221351231', '20161222', '1230', '1245', 'admin', '1', '1', '20161222135123', '');
INSERT INTO `meeting` VALUES ('201612221352001', '20161222', '1200', '1230', 'admin', '1', '1', '20161222135200', '');
INSERT INTO `meeting` VALUES ('201612221354511', '20161222', '1300', '1310', 'admin', '1', '1', '20161222135451', '');
INSERT INTO `meeting` VALUES ('201612221355431', '20161222', '1310', '1330', 'admin', '1', '1', '20161222135543', '');

-- ----------------------------
-- Table structure for room
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `roomID` int(10) NOT NULL,
  `roomName` varchar(10) NOT NULL,
  `roomStartTime` int(11) NOT NULL,
  `roomPermission` varchar(10) NOT NULL,
  `roomEndTime` int(11) NOT NULL,
  PRIMARY KEY (`roomID`),
  UNIQUE KEY `roomID_UNIQUE` (`roomID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', '201', '900', 'manager', '1800');
INSERT INTO `room` VALUES ('2', '202', '900', 'manager', '1800');
INSERT INTO `room` VALUES ('3', '203(大)', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('4', '301', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('5', '302', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('6', '303(大)', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('7', '401', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('8', '402', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('9', '501(大)', '900', 'employee', '1800');
INSERT INTO `room` VALUES ('10', '502(大)', '900', 'manager', '1800');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `userid` varchar(8) NOT NULL,
  `username` varchar(8) NOT NULL,
  `userpwd` varchar(20) NOT NULL,
  `usermail` varchar(20) NOT NULL,
  `userposition` varchar(20) NOT NULL,
  PRIMARY KEY (`userid`),
  UNIQUE KEY `userid_UNIQUE` (`userid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('admin', 'admin', '123456', 'root@all.com', 'admin');
INSERT INTO `user` VALUES ('boss1', 'theboss', '123456', 'queen@all.com', 'manager');
INSERT INTO `user` VALUES ('boss2', 'bigboss', '123456', 'king@all.com', 'manager');
INSERT INTO `user` VALUES ('cxm', 'cxm', '123456', 'cxm@all.com', 'employee');
INSERT INTO `user` VALUES ('w1', 'worker1', '123456', 'w1@all.com', 'employee');
INSERT INTO `user` VALUES ('w2', 'worker2', '123456', 'w2@all.com', 'employee');
INSERT INTO `user` VALUES ('w3', 'worker3', '123456', 'w3@all.com', 'employee');
SET FOREIGN_KEY_CHECKS=1;
