/*
 Navicat Premium Data Transfer

 Source Server         : mysqldb
 Source Server Type    : MySQL
 Source Server Version : 50723
 Source Host           : localhost:3306
 Source Schema         : graduatequestion

 Target Server Type    : MySQL
 Target Server Version : 50723
 File Encoding         : 65001

 Date: 23/02/2019 15:24:17
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for account
-- ----------------------------
DROP TABLE IF EXISTS `account`;
CREATE TABLE `account`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uid` char(100) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `upwd` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `uname` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of account
-- ----------------------------
INSERT INTO `account` VALUES (1, 'admin', '111', '管理员', 1);
INSERT INTO `account` VALUES (2, 'student', '111', '毕业生(测试)', 0);
INSERT INTO `account` VALUES (3, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for answeritem
-- ----------------------------
DROP TABLE IF EXISTS `answeritem`;
CREATE TABLE `answeritem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionid`(`questionid`) USING BTREE,
  CONSTRAINT `answeritem_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of answeritem
-- ----------------------------
INSERT INTO `answeritem` VALUES (1, '1212', 13);
INSERT INTO `answeritem` VALUES (2, '还不错', 13);

-- ----------------------------
-- Table structure for question
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `type` smallint(6) DEFAULT NULL,
  `paperid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `paperid`(`paperid`) USING BTREE,
  CONSTRAINT `question_ibfk_1` FOREIGN KEY (`paperid`) REFERENCES `testpaper` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 32 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO `question` VALUES (11, '你期望的大学有？', 0, 7);
INSERT INTO `question` VALUES (12, '你喜欢吃什么水果', 1, 7);
INSERT INTO `question` VALUES (13, '说说你对江科大的看法？', 2, 7);
INSERT INTO `question` VALUES (14, '12121', 0, 8);
INSERT INTO `question` VALUES (15, '121212121212', 1, 8);
INSERT INTO `question` VALUES (16, 'FJDKSAFJKAJFDLSAFJLJAFLFAJ;DSJAKL', 2, 8);
INSERT INTO `question` VALUES (17, '1212121', 0, 9);
INSERT INTO `question` VALUES (18, '121212', 1, 9);
INSERT INTO `question` VALUES (19, 'fdsafdsafdsafs', 2, 9);
INSERT INTO `question` VALUES (20, '121', 1, 10);
INSERT INTO `question` VALUES (21, '范德萨范德萨范德萨', 0, 11);
INSERT INTO `question` VALUES (22, '范德萨范德萨范德萨', 0, 12);
INSERT INTO `question` VALUES (23, 'fdsafdsa', 0, 12);
INSERT INTO `question` VALUES (24, '范德萨范德萨范德萨', 0, 13);
INSERT INTO `question` VALUES (25, 'fdsafdsa', 0, 13);
INSERT INTO `question` VALUES (26, '1313', 0, 13);
INSERT INTO `question` VALUES (27, '1323', 1, 14);
INSERT INTO `question` VALUES (28, '1111111111111111', 0, 15);
INSERT INTO `question` VALUES (29, '22', 0, 16);
INSERT INTO `question` VALUES (30, '22', 0, 17);
INSERT INTO `question` VALUES (31, '22', 0, 18);

-- ----------------------------
-- Table structure for quitem
-- ----------------------------
DROP TABLE IF EXISTS `quitem`;
CREATE TABLE `quitem`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` varchar(500) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `counter` int(11) DEFAULT NULL,
  `questionid` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questionid`(`questionid`) USING BTREE,
  CONSTRAINT `quitem_ibfk_1` FOREIGN KEY (`questionid`) REFERENCES `question` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 98 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of quitem
-- ----------------------------
INSERT INTO `quitem` VALUES (33, '东南大学', 1, 0, 11);
INSERT INTO `quitem` VALUES (34, '南京大学', 2, 0, 11);
INSERT INTO `quitem` VALUES (35, '河海大学', 3, 0, 11);
INSERT INTO `quitem` VALUES (36, '南理工', 4, 1, 11);
INSERT INTO `quitem` VALUES (37, '南航', 5, 1, 11);
INSERT INTO `quitem` VALUES (38, '江科大', 6, 0, 11);
INSERT INTO `quitem` VALUES (39, '苹果', 1, 0, 12);
INSERT INTO `quitem` VALUES (40, '香蕉', 2, 0, 12);
INSERT INTO `quitem` VALUES (41, '橘子', 3, 1, 12);
INSERT INTO `quitem` VALUES (42, '橙子', 4, 0, 12);
INSERT INTO `quitem` VALUES (43, '柚子', 5, 0, 12);
INSERT INTO `quitem` VALUES (44, '葡萄', 6, 0, 12);
INSERT INTO `quitem` VALUES (45, '番茄', 7, 0, 12);
INSERT INTO `quitem` VALUES (46, '芒果', 8, 0, 12);
INSERT INTO `quitem` VALUES (47, '火龙果', 9, 1, 12);
INSERT INTO `quitem` VALUES (48, '菠萝', 10, 1, 12);
INSERT INTO `quitem` VALUES (49, '甘蔗', 11, 1, 12);
INSERT INTO `quitem` VALUES (50, '1', 1, 0, 14);
INSERT INTO `quitem` VALUES (51, '2', 2, 0, 14);
INSERT INTO `quitem` VALUES (52, '3', 3, 0, 14);
INSERT INTO `quitem` VALUES (53, 'A', 1, 0, 15);
INSERT INTO `quitem` VALUES (54, 'B', 2, 0, 15);
INSERT INTO `quitem` VALUES (55, 'C', 3, 0, 15);
INSERT INTO `quitem` VALUES (56, 'D', 4, 0, 15);
INSERT INTO `quitem` VALUES (57, 'E', 5, 0, 15);
INSERT INTO `quitem` VALUES (58, 'G', 6, 0, 15);
INSERT INTO `quitem` VALUES (59, '1', 1, 0, 17);
INSERT INTO `quitem` VALUES (60, '2', 2, 0, 17);
INSERT INTO `quitem` VALUES (61, '3', 3, 0, 17);
INSERT INTO `quitem` VALUES (62, '1', 1, 0, 18);
INSERT INTO `quitem` VALUES (63, '2', 2, 0, 18);
INSERT INTO `quitem` VALUES (64, '3', 3, 0, 18);
INSERT INTO `quitem` VALUES (65, '4', 4, 0, 18);
INSERT INTO `quitem` VALUES (66, '1', 1, 0, 20);
INSERT INTO `quitem` VALUES (67, 'fsd', 2, 0, 20);
INSERT INTO `quitem` VALUES (68, 'fds', 3, 0, 20);
INSERT INTO `quitem` VALUES (69, '121', 1, 0, 21);
INSERT INTO `quitem` VALUES (70, 'fdsa', 2, 0, 21);
INSERT INTO `quitem` VALUES (71, 'fss', 3, 0, 21);
INSERT INTO `quitem` VALUES (72, 'sss', 4, 0, 21);
INSERT INTO `quitem` VALUES (73, 'ggg', 5, 0, 21);
INSERT INTO `quitem` VALUES (74, '121', 1, 0, 22);
INSERT INTO `quitem` VALUES (75, 'fdsa', 2, 0, 22);
INSERT INTO `quitem` VALUES (76, 'fss', 3, 0, 22);
INSERT INTO `quitem` VALUES (77, 'sss', 4, 0, 22);
INSERT INTO `quitem` VALUES (78, 'ggg', 5, 0, 22);
INSERT INTO `quitem` VALUES (79, 'fsdafds', 1, 0, 23);
INSERT INTO `quitem` VALUES (80, '1323', 2, 0, 23);
INSERT INTO `quitem` VALUES (81, '453534', 3, 0, 23);
INSERT INTO `quitem` VALUES (82, '121', 1, 0, 24);
INSERT INTO `quitem` VALUES (83, 'fdsa', 2, 0, 24);
INSERT INTO `quitem` VALUES (84, 'fss', 3, 0, 24);
INSERT INTO `quitem` VALUES (85, 'sss', 4, 0, 24);
INSERT INTO `quitem` VALUES (86, 'ggg', 5, 0, 24);
INSERT INTO `quitem` VALUES (87, 'fsdafds', 1, 0, 25);
INSERT INTO `quitem` VALUES (88, '1323', 2, 0, 25);
INSERT INTO `quitem` VALUES (89, '453534', 3, 0, 25);
INSERT INTO `quitem` VALUES (90, '23', 1, 0, 26);
INSERT INTO `quitem` VALUES (91, '2', 2, 0, 26);
INSERT INTO `quitem` VALUES (92, '东南大学', 1, 0, 27);
INSERT INTO `quitem` VALUES (93, '322', 2, 0, 27);
INSERT INTO `quitem` VALUES (94, '11', 1, 0, 28);
INSERT INTO `quitem` VALUES (95, '2', 1, 0, 29);
INSERT INTO `quitem` VALUES (96, '2', 1, 0, 30);
INSERT INTO `quitem` VALUES (97, '2', 1, 0, 31);

-- ----------------------------
-- Table structure for testpaper
-- ----------------------------
DROP TABLE IF EXISTS `testpaper`;
CREATE TABLE `testpaper`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` char(200) CHARACTER SET utf8 COLLATE utf8_general_ci DEFAULT NULL,
  `starttime` datetime(0) DEFAULT NULL,
  `endtime` datetime(0) DEFAULT NULL,
  `suber` int(11) DEFAULT NULL,
  `hastested` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `suber`(`suber`) USING BTREE,
  CONSTRAINT `testpaper_ibfk_1` FOREIGN KEY (`suber`) REFERENCES `account` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 19 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of testpaper
-- ----------------------------
INSERT INTO `testpaper` VALUES (7, '第一份测试试卷', '2019-02-05 00:00:00', '2019-02-28 00:00:00', 1, 2);
INSERT INTO `testpaper` VALUES (8, '这是的哥放假咋使肌肤开始', '2019-02-04 00:00:00', '2019-02-27 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (9, 'fdsafdsa', '2019-02-06 00:00:00', '2019-03-15 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (10, '2121', '2019-02-12 00:00:00', '2019-02-26 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (11, '323232', '2019-02-04 00:00:00', '2019-02-28 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (12, '342424', '2019-02-12 00:00:00', '2019-02-22 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (13, 'fdsafdsa', '2019-02-19 00:00:00', '2019-02-20 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (14, 'fdsgfs', '2019-02-05 00:00:00', '2019-02-27 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (15, 'fdsafds', '2019-01-29 00:00:00', '2019-02-22 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (16, '3333333333333', '2019-02-06 00:00:00', '2019-02-04 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (17, 'rr', '2019-02-04 00:00:00', '2019-02-28 00:00:00', 1, 0);
INSERT INTO `testpaper` VALUES (18, '3232', '2019-02-04 00:00:00', '2019-02-18 00:00:00', 1, 0);

SET FOREIGN_KEY_CHECKS = 1;
