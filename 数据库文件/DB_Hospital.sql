/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 80029
 Source Host           : localhost:3306
 Source Schema         : DB_Hospital

 Target Server Type    : MySQL
 Target Server Version : 80029
 File Encoding         : 65001

 Date: 19/11/2023 20:51:27
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for admin_user
-- ----------------------------
DROP TABLE IF EXISTS `admin_user`;
CREATE TABLE `admin_user` (
  `a_id` int NOT NULL COMMENT '主键，管理员id（账号）',
  `a_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '密码',
  `a_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '姓名',
  `a_gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '性别',
  `a_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '证件号码',
  `a_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '手机号',
  `a_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL COMMENT '邮箱',
  PRIMARY KEY (`a_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin_user
-- ----------------------------
BEGIN;
INSERT INTO `admin_user` VALUES (202301, '123456', 'admin', '男', '34000000000000', '13541111111', '123@qq.com');
COMMIT;

-- ----------------------------
-- Table structure for arrange
-- ----------------------------
DROP TABLE IF EXISTS `arrange`;
CREATE TABLE `arrange` (
  `ar_id` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci NOT NULL,
  `ar_time` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_id` int DEFAULT NULL,
  PRIMARY KEY (`ar_id`) USING BTREE,
  KEY `arTOd` (`d_id`) USING BTREE,
  CONSTRAINT `arTOd` FOREIGN KEY (`d_id`) REFERENCES `doctor_user` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of arrange
-- ----------------------------
BEGIN;
INSERT INTO `arrange` VALUES ('10002023-11-19', '2023-11-19', 1000);
INSERT INTO `arrange` VALUES ('10002023-11-20', '2023-11-20', 1000);
INSERT INTO `arrange` VALUES ('10012023-11-19', '2023-11-19', 1001);
INSERT INTO `arrange` VALUES ('10012023-11-20', '2023-11-20', 1001);
INSERT INTO `arrange` VALUES ('10022023-11-19', '2023-11-19', 1002);
INSERT INTO `arrange` VALUES ('10022023-11-20', '2023-11-20', 1002);
INSERT INTO `arrange` VALUES ('10032023-11-19', '2023-11-19', 1003);
INSERT INTO `arrange` VALUES ('10042023-11-19', '2023-11-19', 1004);
INSERT INTO `arrange` VALUES ('10042023-11-20', '2023-11-20', 1004);
INSERT INTO `arrange` VALUES ('10042023-11-21', '2023-11-21', 1004);
INSERT INTO `arrange` VALUES ('10042023-11-23', '2023-11-23', 1004);
INSERT INTO `arrange` VALUES ('10072023-11-19', '2023-11-19', 1007);
INSERT INTO `arrange` VALUES ('10072023-11-20', '2023-11-20', 1007);
INSERT INTO `arrange` VALUES ('10072023-11-23', '2023-11-23', 1007);
INSERT INTO `arrange` VALUES ('10082023-11-19', '2023-11-19', 1008);
INSERT INTO `arrange` VALUES ('10082023-11-20', '2023-11-20', 1008);
INSERT INTO `arrange` VALUES ('10092023-11-19', '2023-11-19', 1009);
INSERT INTO `arrange` VALUES ('10092023-11-20', '2023-11-20', 1009);
COMMIT;

-- ----------------------------
-- Table structure for bed
-- ----------------------------
DROP TABLE IF EXISTS `bed`;
CREATE TABLE `bed` (
  `b_id` int NOT NULL,
  `p_id` int DEFAULT NULL,
  `b_state` int DEFAULT NULL,
  `b_start` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_id` int DEFAULT NULL,
  `b_reason` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `version` int DEFAULT NULL,
  PRIMARY KEY (`b_id`) USING BTREE,
  KEY `bTOp` (`p_id`) USING BTREE,
  KEY `bTOd` (`d_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of bed
-- ----------------------------
BEGIN;
INSERT INTO `bed` VALUES (1, 2000, 1, '2023-11-19', 1000, '病人状况比较糟糕，需要住院3天。照顾下。', NULL);
INSERT INTO `bed` VALUES (2, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (3, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (4, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (5, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (6, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (7, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (8, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (9, -1, 0, NULL, -1, NULL, NULL);
INSERT INTO `bed` VALUES (10, -1, 0, NULL, -1, NULL, NULL);
COMMIT;

-- ----------------------------
-- Table structure for checks
-- ----------------------------
DROP TABLE IF EXISTS `checks`;
CREATE TABLE `checks` (
  `ch_id` int NOT NULL AUTO_INCREMENT,
  `ch_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `ch_price` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`ch_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of checks
-- ----------------------------
BEGIN;
INSERT INTO `checks` VALUES (1, 'B超', 201.00);
INSERT INTO `checks` VALUES (2, 'CT', 435.00);
INSERT INTO `checks` VALUES (3, '核磁共振', 653.00);
INSERT INTO `checks` VALUES (4, 'MRI', 534.00);
INSERT INTO `checks` VALUES (5, '心电图', 634.00);
INSERT INTO `checks` VALUES (6, '彩超', 213.00);
INSERT INTO `checks` VALUES (7, '血常规', 434.00);
INSERT INTO `checks` VALUES (8, '肝功能', 543.00);
INSERT INTO `checks` VALUES (9, '血糖', 434.00);
INSERT INTO `checks` VALUES (10, '甲状腺', 434.00);
INSERT INTO `checks` VALUES (12, '听力', 10.00);
COMMIT;

-- ----------------------------
-- Table structure for doctor_user
-- ----------------------------
DROP TABLE IF EXISTS `doctor_user`;
CREATE TABLE `doctor_user` (
  `d_id` int NOT NULL,
  `d_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_post` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_introduction` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_section` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `d_state` int NOT NULL,
  `d_price` decimal(10,2) DEFAULT NULL,
  `d_people` int DEFAULT NULL,
  `d_star` decimal(10,2) DEFAULT NULL,
  `d_avg_star` decimal(10,2) DEFAULT NULL,
  PRIMARY KEY (`d_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of doctor_user
-- ----------------------------
BEGIN;
INSERT INTO `doctor_user` VALUES (1000, 'e10adc3949ba59abbe56e057f20f883e', '张医生', '女', '18762543671', '352225177380837645', 'zhang@qq.com', '主任医师', '神经内科主任医师', '神经内科', 1, 10.00, 1, 4.00, 4.00);
INSERT INTO `doctor_user` VALUES (1001, 'e10adc3949ba59abbe56e057f20f883e', '王医生', '男', '19872635542', '348882988376153789', 'wang@qq.com', '副主任医师', '神经内科-副主任医师', '神经内科', 0, 5.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1002, 'e10adc3949ba59abbe56e057f20f883e', '李医生', '男', '18627362563', '352224827736281', 'li@gmail.com', '主治医生', '神经内科-主治医生', '神经内科', 1, 20.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1003, 'e10adc3949ba59abbe56e057f20f883e', '赵医生', '男', '18792374621', '348882733628236', 'zhao@163.com', '主任医师', '内分泌科-主任医师', '内分泌科', 1, 10.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1004, 'e10adc3949ba59abbe56e057f20f883e', '马医生', '男', '18562382321', '342223947192347', 'ma@qq.com', '主治医生', '呼吸科-主治医生', '呼吸与危重症医学科', 1, 50.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1005, 'e10adc3949ba59abbe56e057f20f883e', '卞医生', '男', '18676665544', '352229833391837463', 'bian@qq.com', '主任医师', '消化内科-主人医师', '消化内科', 1, 100.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1006, 'e10adc3949ba59abbe56e057f20f883e', '廖医生', '女', '18766623523', '352229378782331', 'liao@qq.com', '副主任医师', '心血管内科医生', '心血管内科', 1, 10.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1007, 'e10adc3949ba59abbe56e057f20f883e', '乌医生', '男', '18723626312', '382227392312132', 'wu@qq.com', '主任医师', '妇科-主任医师', '妇科', 1, 10.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1008, 'e10adc3949ba59abbe56e057f20f883e', '田医生', '女', '19876763231', '348887233210237', 'tian@qq.com', '副主任医师', '手足外科-副主任', '手足外科', 1, 2.00, 0, 0.00, NULL);
INSERT INTO `doctor_user` VALUES (1009, 'e10adc3949ba59abbe56e057f20f883e', '苗医生', '女', '18723776462', '387772372313123', 'miao@163.com', '主治医生', '儿科-主治医生', '儿科', 1, 30.00, 0, 0.00, NULL);
COMMIT;

-- ----------------------------
-- Table structure for drug
-- ----------------------------
DROP TABLE IF EXISTS `drug`;
CREATE TABLE `drug` (
  `dr_id` int NOT NULL AUTO_INCREMENT,
  `dr_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `dr_price` decimal(10,2) DEFAULT NULL,
  `dr_number` int DEFAULT NULL,
  `dr_publisher` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `dr_unit` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`dr_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=101 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of drug
-- ----------------------------
BEGIN;
INSERT INTO `drug` VALUES (1, '青霉素', 23.00, 11, '国家医药局', '袋');
INSERT INTO `drug` VALUES (2, '苯唑西林', 11.00, 28, '国家医药局', '盒');
INSERT INTO `drug` VALUES (3, '氨苄西林', 13.00, 51, '国家医药局', '盒');
INSERT INTO `drug` VALUES (4, '哌拉西林', 2.00, 7, '国家医药局', '盒');
INSERT INTO `drug` VALUES (5, '阿莫西林', 13.00, 20, '国家医药局', '盒');
INSERT INTO `drug` VALUES (6, '头孢唑林', 3.00, 32, '国家医药局', '盒');
INSERT INTO `drug` VALUES (7, '头孢氨苄', 4.00, 43, '国家医药局', '盒');
INSERT INTO `drug` VALUES (8, '头孢呋辛', 8.00, 54, '国家医药局', '盒');
INSERT INTO `drug` VALUES (9, '阿米卡星', 5.00, 54, '国家医药局', '袋');
INSERT INTO `drug` VALUES (10, '庆大霉素', 7.00, 63, '国家医药局', '袋');
INSERT INTO `drug` VALUES (11, '红霉素', 6.00, 75, '国家医药局', '袋');
INSERT INTO `drug` VALUES (12, '阿奇霉素', 54.00, 52, '国家医药局', '袋');
INSERT INTO `drug` VALUES (13, '克林霉素', 65.00, 21, '国家医药局', '袋');
INSERT INTO `drug` VALUES (14, '复方磺胺甲噁唑', 76.00, 54, '国家医药局', '袋');
INSERT INTO `drug` VALUES (15, '诺氟沙星', 65.00, 33, '国家医药局', '袋');
INSERT INTO `drug` VALUES (16, '左氧氟沙星', 76.00, 43, '国家医药局', '袋');
COMMIT;

-- ----------------------------
-- Table structure for orders
-- ----------------------------
DROP TABLE IF EXISTS `orders`;
CREATE TABLE `orders` (
  `o_id` int NOT NULL AUTO_INCREMENT,
  `p_id` int DEFAULT NULL,
  `d_id` int DEFAULT NULL,
  `o_record` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `o_start` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `o_end` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `o_state` int DEFAULT NULL,
  `o_drug` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `o_check` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `o_total_price` decimal(10,2) DEFAULT NULL,
  `o_price_state` int DEFAULT NULL,
  `o_advice` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  PRIMARY KEY (`o_id`) USING BTREE,
  KEY `oTOp` (`p_id`) USING BTREE,
  KEY `0TOd` (`d_id`) USING BTREE,
  CONSTRAINT `0TOd` FOREIGN KEY (`d_id`) REFERENCES `doctor_user` (`d_id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `oTOp` FOREIGN KEY (`p_id`) REFERENCES `patient_user` (`p_id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE=InnoDB AUTO_INCREMENT=211209 DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of orders
-- ----------------------------
BEGIN;
INSERT INTO `orders` VALUES (2137, 2000, 1000, '感冒了，开感冒药。平时多注意休息', '2023-11-19 08:30-09:30', '2023-11-19 19:51:53', 1, '青霉素*23(元)*1 红霉素*6(元)*1 庆大霉素*7(元)*1  药物总价36元 ', 'B超*201(元) CT*435(元) MRI*534(元)  项目总价1170元 ', 0.00, 1, NULL);
INSERT INTO `orders` VALUES (2512, 2000, 1000, NULL, '2023-11-20 09:30-10:30', NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `orders` VALUES (5843, 2000, 1008, NULL, '2023-11-20 10:30-11:30', NULL, 0, NULL, NULL, NULL, 0, NULL);
INSERT INTO `orders` VALUES (6051, 2000, 1000, NULL, '2023-11-19 09:30-10:30', NULL, 0, NULL, NULL, 0.00, 1, NULL);
COMMIT;

-- ----------------------------
-- Table structure for patient_user
-- ----------------------------
DROP TABLE IF EXISTS `patient_user`;
CREATE TABLE `patient_user` (
  `p_id` int NOT NULL,
  `p_password` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_name` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_gender` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_phone` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_card` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_email` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_state` int DEFAULT NULL,
  `p_birthday` varchar(255) CHARACTER SET utf8mb3 COLLATE utf8_general_ci DEFAULT NULL,
  `p_age` int DEFAULT NULL,
  PRIMARY KEY (`p_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of patient_user
-- ----------------------------
BEGIN;
INSERT INTO `patient_user` VALUES (2000, 'e10adc3949ba59abbe56e057f20f883e', '徐先生', '男', '18733223345', '352227655454361762', 'xu@qq.com', 1, '1994-11-27', 29);
INSERT INTO `patient_user` VALUES (2001, 'e10adc3949ba59abbe56e057f20f883e', '曾先生', '男', '18766552374', '356662733625364', 'zeng@qq.com', 1, '2000-11-03', 23);
INSERT INTO `patient_user` VALUES (2002, 'e10adc3949ba59abbe56e057f20f883e', '张女士', '女', '18677662374', '387772633819283', 'zhang@163.com', 1, '1997-11-05', 26);
INSERT INTO `patient_user` VALUES (2003, 'e10adc3949ba59abbe56e057f20f883e', '杨先生', '男', '18766256323', '353329877638231', 'yang@qq.com', 1, '2023-11-26', 0);
INSERT INTO `patient_user` VALUES (2004, 'e10adc3949ba59abbe56e057f20f883e', '马女士', '女', '18766235473', '376662537482735', 'ma@qq.com', 1, '2017-11-06', 6);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
