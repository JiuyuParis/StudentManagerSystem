/*
 Navicat Premium Data Transfer

 Source Server         : 本地库
 Source Server Type    : MySQL
 Source Server Version : 50735
 Source Host           : localhost:3306
 Source Schema         : studentmanagesystem

 Target Server Type    : MySQL
 Target Server Version : 50735
 File Encoding         : 65001

 Date: 11/12/2021 16:54:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for classt
-- ----------------------------
DROP TABLE IF EXISTS `classt`;
CREATE TABLE `classt`  (
  `clid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '班级表主键',
  `classN` int(11) NULL DEFAULT NULL COMMENT '所在班级',
  `classNum` int(11) NULL DEFAULT NULL COMMENT '班级人数',
  `classType` varchar(45) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班型',
  PRIMARY KEY (`clid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '班级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of classt
-- ----------------------------
INSERT INTO `classt` VALUES ('1', 1, 41, '普通班');
INSERT INTO `classt` VALUES ('3', 3, 25, '创新实验班');
INSERT INTO `classt` VALUES ('4', 4, 45, '普通班');
INSERT INTO `classt` VALUES ('5', 5, 36, '强化班');
INSERT INTO `classt` VALUES ('6', 6, 46, '预科班');
INSERT INTO `classt` VALUES ('68c84523-4996-4edc-a141-f44b003f2ddb', 10, 23, '创新实验班');
INSERT INTO `classt` VALUES ('7', 7, 42, '普通班');
INSERT INTO `classt` VALUES ('8', 8, 45, '普通班');

-- ----------------------------
-- Table structure for grade
-- ----------------------------
DROP TABLE IF EXISTS `grade`;
CREATE TABLE `grade`  (
  `gid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联表主键',
  `grade` int(11) NULL DEFAULT NULL COMMENT '所在年级',
  `stuCount` int(11) NULL DEFAULT NULL COMMENT '学生人数',
  PRIMARY KEY (`gid`) USING BTREE,
  INDEX `uid`(`grade`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户年级关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade
-- ----------------------------
INSERT INTO `grade` VALUES ('01d93135-7515-4624-bbc7-ae2016b1e29a', 13, 1340);
INSERT INTO `grade` VALUES ('1', 17, 2590);
INSERT INTO `grade` VALUES ('2', 18, 3450);
INSERT INTO `grade` VALUES ('3352a823-7568-433c-8657-34ff6e465bdc', 9, 1430);
INSERT INTO `grade` VALUES ('4', 20, 5643);
INSERT INTO `grade` VALUES ('5a2050a1-c13e-40b7-aa6e-46c2443e0c9a', 8, 1340);
INSERT INTO `grade` VALUES ('6', 16, 2595);
INSERT INTO `grade` VALUES ('7', 15, 2300);
INSERT INTO `grade` VALUES ('7fbe7adf-a759-45c9-be92-7cfd33c95d58', 19, 0);
INSERT INTO `grade` VALUES ('a15dce76-620b-4267-a3ca-eed374dde313', 14, 3405);
INSERT INTO `grade` VALUES ('ae8b7702-e2e2-44e9-8716-0584e39f4d69', 10, 2360);
INSERT INTO `grade` VALUES ('db33dac9-7670-4e09-95e6-61e5cc4690d7', 12, 0);

-- ----------------------------
-- Table structure for grade_classt
-- ----------------------------
DROP TABLE IF EXISTS `grade_classt`;
CREATE TABLE `grade_classt`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联表主键',
  `gid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级表主键',
  `clid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年级班级关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of grade_classt
-- ----------------------------
INSERT INTO `grade_classt` VALUES ('1', '1', '1');
INSERT INTO `grade_classt` VALUES ('2', '1', '2');
INSERT INTO `grade_classt` VALUES ('3', '1', '3');
INSERT INTO `grade_classt` VALUES ('4', '2', '1');
INSERT INTO `grade_classt` VALUES ('5', '2', '2');
INSERT INTO `grade_classt` VALUES ('6', '3', '1');
INSERT INTO `grade_classt` VALUES ('7', '4', '1');

-- ----------------------------
-- Table structure for profession
-- ----------------------------
DROP TABLE IF EXISTS `profession`;
CREATE TABLE `profession`  (
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '主键',
  `pName` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业名称',
  `count` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业人数',
  `createtime` date NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '年级表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profession
-- ----------------------------
INSERT INTO `profession` VALUES ('1', '计算机科学与技术', '234', '2001-12-14');
INSERT INTO `profession` VALUES ('10', '土木工程', '244', '2002-05-04');
INSERT INTO `profession` VALUES ('11', '机械设计制造及其自动化', '540', '1988-11-03');
INSERT INTO `profession` VALUES ('2', '软件工程2', '238', '2000-12-13');
INSERT INTO `profession` VALUES ('3', '通信工程', '137', '1998-11-01');
INSERT INTO `profession` VALUES ('38a242a3-4436-416f-839d-11ff7f4e78bd', '新闻传播', '130', '2020-12-22');
INSERT INTO `profession` VALUES ('4', '材料成型及控制工程', '354', '1987-02-01');
INSERT INTO `profession` VALUES ('5', '金融趋势学', '156', '1997-04-13');
INSERT INTO `profession` VALUES ('6', '会计应用学', '340', '1999-04-23');
INSERT INTO `profession` VALUES ('7', '传媒艺术', '120', '2005-12-01');
INSERT INTO `profession` VALUES ('8', '测绘学', '242', '2000-06-04');
INSERT INTO `profession` VALUES ('9', '应用心理学', '245', '2001-12-06');

-- ----------------------------
-- Table structure for profession_grade
-- ----------------------------
DROP TABLE IF EXISTS `profession_grade`;
CREATE TABLE `profession_grade`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联表主键',
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业表主键',
  `gid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级表主键',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '专业年级关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of profession_grade
-- ----------------------------
INSERT INTO `profession_grade` VALUES ('1', '1', '1');
INSERT INTO `profession_grade` VALUES ('2', '1', '2');
INSERT INTO `profession_grade` VALUES ('3', '1', '3');
INSERT INTO `profession_grade` VALUES ('4', '1', '4');
INSERT INTO `profession_grade` VALUES ('5', '2', '1');
INSERT INTO `profession_grade` VALUES ('6', '2', '2');
INSERT INTO `profession_grade` VALUES ('7', '2', '3');
INSERT INTO `profession_grade` VALUES ('8', '2', '4');

-- ----------------------------
-- Table structure for user_classt
-- ----------------------------
DROP TABLE IF EXISTS `user_classt`;
CREATE TABLE `user_classt`  (
  `id` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '关联表主键',
  `uid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户表主键',
  `clid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '班级表主键',
  `gid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '年级id',
  `pid` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '专业id',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户班级关联表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of user_classt
-- ----------------------------
INSERT INTO `user_classt` VALUES ('1', '110', '1', '1', '1');
INSERT INTO `user_classt` VALUES ('2', '120', '2', '3', '2');
INSERT INTO `user_classt` VALUES ('3', 'admin', '1', '1', '2');
INSERT INTO `user_classt` VALUES ('3647bbb7-cfea-44f3-a0c6-0c5f32a5485d', '999', '1', '1', '1');
INSERT INTO `user_classt` VALUES ('4208e78e-0f21-46f3-a88a-4ffde42766cc', '119', '1', '1', '1');
INSERT INTO `user_classt` VALUES ('c5bf043b-fdfa-4f80-9ed5-c5ce6156b114', '888', '1', '1', '2');
INSERT INTO `user_classt` VALUES ('eadf1d6a-5a80-4970-9e2d-85db092f81af', '111', '1', '1', '1');
INSERT INTO `user_classt` VALUES ('f80068c0-d0d4-49a3-8524-853952568a86', '66', '1', '1', '1');

-- ----------------------------
-- Table structure for userinfo
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo`  (
  `uid` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT '' COMMENT '学号(主键)',
  `password` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `name` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '姓名',
  `sex` varchar(10) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `type` int(11) NULL DEFAULT NULL COMMENT '身份(0老师|1班干部|2学生)',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '用户表' ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('111', '999', '王俊凯', '男', 2);
INSERT INTO `userinfo` VALUES ('admin', '123', '系主任', '男', 0);
INSERT INTO `userinfo` VALUES ('Jiuyu', 'jiuyu', '玖语', '男', 2);

SET FOREIGN_KEY_CHECKS = 1;
