/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50732
 Source Host           : localhost:3306
 Source Schema         : myadmin

 Target Server Type    : MySQL
 Target Server Version : 50732
 File Encoding         : 65001

 Date: 06/05/2022 23:13:33
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for datadetails
-- ----------------------------
DROP TABLE IF EXISTS `datadetails`;
CREATE TABLE `datadetails`  (
  `data_id` bigint(11) NOT NULL AUTO_INCREMENT,
  `pid` bigint(11) NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `has_detail` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `detail_type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `sql` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enabled` int(2) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_at` datetime(0) NULL DEFAULT NULL,
  `update_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`data_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 401 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of datadetails
-- ----------------------------
INSERT INTO `datadetails` VALUES (1, 1, '每日门诊人次', '/data/q/t1/1', NULL, '是', '[\'科室\']', '[{sql:\'SELECT COUNT(1) FROM REG.REG_RECORD WHERE STATUS=0 AND pay_status>=1 AND is_delete=\'N\' AND DEPT_ID NOT IN (\'9356\',\'9280\',\'186\',\'209124358651539456\') AND\nreg_date BETWEEN TO_DATE(\'${start_date}\', \'yyyy-mm-dd hh24:mi:ss\') AND TO_DATE(\'${end_date}\', \'yyyy-mm-dd hh24:mi:ss\')\',group_by:\'\'},{sql:\'SELECT COUNT(1) FROM REG.REG_RECORD WHERE STATUS=0 AND pay_status>=1 AND is_delete=\'N\' AND DEPT_ID NOT IN (\'9356\',\'9280\',\'186\',\'209124358651539456\') AND\nreg_date BETWEEN TO_DATE(\'${start_date}\', \'yyyy-mm-dd hh24:mi:ss\') AND TO_DATE(\'${end_date}\', \'yyyy-mm-dd hh24:mi:ss\')\'},group_by:\'dept_name\']', 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (2, 1, '每周门诊人次', '/data/q/t1/2', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (3, 1, '每月门诊人次', '/data/q/t1/3', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (4, 1, '每年门诊人次', '/data/q/t1/4', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (5, 1, '每日急诊人次', '/data/q/t1/5', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (6, 1, '每周急诊人次', '/data/q/t1/6', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (7, 1, '每月急诊人次', '/data/q/t1/7', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (8, 1, '每年急诊人次', '/data/q/t1/8', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (9, 1, '专家门诊人次', '/data/q/t1/9', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (10, 1, '门诊预约人次', '/data/q/t1/10', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (11, 1, '按医生类别汇总门急诊人次', '/data/q/t1/11', NULL, '是', '[\'医生类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (12, 1, '每日衡阳市内外门急诊人次(运管部专用)', '/data/q/t1/12', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (13, 1, '每月衡阳市内外门急诊人次(运管部专用)', '/data/q/t1/13', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (14, 1, '每年衡阳市内外门急诊人次(运管部专用)', '/data/q/t1/14', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (15, 1, '每日门急诊人次按地域汇总(省市区)', '/data/q/t1/15', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (16, 1, '每月门急诊人次按地域汇总(省市区)', '/data/q/t1/16', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (17, 1, '每年门急诊人次按地域汇总(省市区)', '/data/q/t1/17', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (18, 1, '每月门诊患者诊断名称', '/data/q/t1/18', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (19, 1, '每年门患者诊诊断名称', '/data/q/t1/19', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (20, 1, '每月门诊患者年龄段', '/data/q/t1/20', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (21, 1, '每年门诊患者年龄段', '/data/q/t1/21', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (22, 1, '每月门诊患者性别', '/data/q/t1/22', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (23, 1, '每年门诊患者性别', '/data/q/t1/23', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (24, 2, '每日入院人数', '/data/q/t2/1', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (25, 2, '每月入院人数', '/data/q/t2/2', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (26, 2, '每年入院人数', '/data/q/t2/3', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (27, 2, '每日出院人数', '/data/q/t2/4', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (28, 2, '每月出院人数', '/data/q/t2/5', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (29, 2, '每年出院人数', '/data/q/t2/6', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (30, 2, '每月死亡人数', '/data/q/t2/7', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (31, 2, '每年死亡人数', '/data/q/t2/8', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (32, 2, '每月实际开放总床日数', '/data/q/t2/9', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (33, 2, '每年实际开放总床日数', '/data/q/t2/10', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (34, 2, '每月实际占用总床日数', '/data/q/t2/11', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (35, 2, '每年实际占用总床日数', '/data/q/t2/12', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (36, 2, '每月出院者占用总床日数', '/data/q/t2/13', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (37, 2, '每年出院者占用总床日数', '/data/q/t2/14', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (38, 2, '每月病床使用率', '/data/q/t2/15', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (39, 2, '每年病床使用率', '/data/q/t2/16', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (40, 2, '每月病床周转次数', '/data/q/t2/17', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (41, 2, '每年病床周转次数', '/data/q/t2/18', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (42, 2, '每月平均住院日', '/data/q/t2/19', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (43, 2, '每年平均住院日', '/data/q/t2/20', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (44, 2, '每月期末实有病床数', '/data/q/t2/21', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (45, 2, '每年期末实有病床数', '/data/q/t2/22', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (46, 2, '每月手术量', '/data/q/t2/23', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (47, 2, '每年手术量', '/data/q/t2/24', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (48, 2, '每月A型病例', '/data/q/t2/25', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (49, 2, '每年A型病例', '/data/q/t2/26', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (50, 2, '每月B型病例', '/data/q/t2/27', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (51, 2, '每年B型病例', '/data/q/t2/28', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (52, 2, '每月C型病例', '/data/q/t2/29', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (53, 2, '每年C型病例', '/data/q/t2/30', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (54, 2, '每月D型病例', '/data/q/t2/31', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (55, 2, '每年D型病例', '/data/q/t2/32', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (56, 2, '每月CD型病例', '/data/q/t2/33', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (57, 2, '每年CD型病例', '/data/q/t2/34', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (58, 2, '每月CD型病例占比', '/data/q/t2/35', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (59, 2, '每年CD型病例占比', '/data/q/t2/36', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (60, 2, '每月一级手术例数', '/data/q/t2/37', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (61, 2, '每年一级手术例数', '/data/q/t2/38', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (62, 2, '每月二级手术例数', '/data/q/t2/39', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (63, 2, '每年二级手术例数', '/data/q/t2/40', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (64, 2, '每月三级手术例数', '/data/q/t2/41', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (65, 2, '每年三级手术例数', '/data/q/t2/42', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (66, 2, '每月四级手术例数', '/data/q/t2/43', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (67, 2, '每年四级手术例数', '/data/q/t2/44', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (68, 2, '每月三四级手术例数', '/data/q/t2/45', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (69, 2, '每年三四级手术例数', '/data/q/t2/46', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (70, 2, '每月三四级手术例数占比', '/data/q/t2/47', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (71, 2, '每年三四级手术例数占比', '/data/q/t2/48', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (72, 2, '每月衡阳市内外入院人数(运管部专用)', '/data/q/t2/49', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (73, 2, '每年衡阳市内外入院人数(运管部专用)', '/data/q/t2/50', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (74, 2, '每月入院人数按地域汇总(省市区)', '/data/q/t2/51', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (75, 2, '每年入院人数按地域汇总(省市区)', '/data/q/t2/52', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (76, 2, '各科室实有床位数', '/data/q/t2/53', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (77, 3, '每日入院人数', '/data/q/t3/1', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (78, 3, '每月入院人数', '/data/q/t3/2', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (79, 3, '每年入院人数', '/data/q/t3/3', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (80, 3, '每日出院人数', '/data/q/t3/4', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (81, 3, '每月出院人数', '/data/q/t3/5', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (82, 3, '每年出院人数', '/data/q/t3/6', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (83, 3, '每日在院人数', '/data/q/t3/7', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (84, 3, '每日衡阳市内外出院人数(运管部专用)', '/data/q/t3/8', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (85, 3, '每月衡阳市内外出院人数(运管部专用)', '/data/q/t3/9', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (86, 3, '每年衡阳市内外出院人数(运管部专用)', '/data/q/t3/10', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (87, 3, '每日衡阳市内外出院人数(运管部专用)', '/data/q/t3/11', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (88, 3, '每月衡阳市内外出院人数(运管部专用)', '/data/q/t3/12', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (89, 3, '每年衡阳市内外出院人数(运管部专用)', '/data/q/t3/13', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (90, 3, '每日入院人数按地域汇总(省市区)', '/data/q/t3/14', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (91, 3, '每月入院人数按地域汇总(省市区)', '/data/q/t3/15', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (92, 3, '每年入院人数按地域汇总(省市区)', '/data/q/t3/16', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (93, 3, '每日出院人数按地域汇总(省市区)', '/data/q/t3/17', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (94, 3, '每月出院人数按地域汇总(省市区)', '/data/q/t3/18', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (95, 3, '每年出院人数按地域汇总(省市区)', '/data/q/t3/19', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (96, 3, '每月入院患者年龄段', '/data/q/t3/20', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (97, 3, '每年入院患者年龄段', '/data/q/t3/21', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (98, 3, '每月入院患者性别', '/data/q/t3/22', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (99, 3, '每年入院患者性别', '/data/q/t3/23', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (100, 3, '每月出院患者年龄段', '/data/q/t3/24', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (101, 3, '每年出院患者年龄段', '/data/q/t3/25', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (102, 3, '每月出院患者性别', '/data/q/t3/26', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (103, 3, '每年出院患者性别', '/data/q/t3/27', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (104, 4, '每月门急诊费用', '/data/q/t4/1', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (105, 4, '每年门急诊费用', '/data/q/t4/2', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (106, 4, '每月住院费用', '/data/q/t4/3', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (107, 4, '每年住院费用', '/data/q/t4/4', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (108, 4, '每月全院费用', '/data/q/t4/5', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (109, 4, '每年全院费用', '/data/q/t4/6', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (110, 4, '每月医疗活动收入合计', '/data/q/t4/7', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (111, 4, '每年医疗活动收入合计', '/data/q/t4/8', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (112, 4, '每月医疗活动支出', '/data/q/t4/9', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (113, 4, '每年医疗活动支出', '/data/q/t4/10', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (114, 4, '每月业务活动费用', '/data/q/t4/11', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (115, 4, '每年业务活动费用', '/data/q/t4/12', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (116, 4, '每月单位管理费用', '/data/q/t4/13', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (117, 4, '每年单位管理费用', '/data/q/t4/14', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (118, 4, '每月人员经费', '/data/q/t4/15', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (119, 4, '每年人员经费', '/data/q/t4/16', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (120, 4, '每月卫生材料费支出', '/data/q/t4/17', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (121, 4, '每年卫生材料费支出', '/data/q/t4/18', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (122, 4, '每月药品费用支出', '/data/q/t4/19', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (123, 4, '每年药品费用支出', '/data/q/t4/20', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (124, 4, '月度流动资产总额', '/data/q/t4/21', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (125, 4, '年度流动资产总额', '/data/q/t4/22', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (126, 4, '月度非流动资产总额', '/data/q/t4/23', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (127, 4, '年度非流动资产总额', '/data/q/t4/24', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (128, 4, '月度长期借款', '/data/q/t4/25', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (129, 4, '年度长期借款', '/data/q/t4/26', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (130, 4, '月度负债合计', '/data/q/t4/27', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (131, 4, '年度负债合计', '/data/q/t4/28', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (132, 4, '每月全院收入分类汇总', '/data/q/t4/29', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (133, 4, '每年全院收入分类汇总', '/data/q/t4/30', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (134, 4, '每月药占比', '/data/q/t4/31', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (135, 4, '每年药占比', '/data/q/t4/32', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (136, 4, '每月耗占比', '/data/q/t4/33', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (137, 4, '每年耗占比', '/data/q/t4/34', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (138, 4, '每月门诊人均费用', '/data/q/t4/35', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (139, 4, '每年门诊人均费用', '/data/q/t4/36', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (140, 4, '每月门诊人均费用增长比例', '/data/q/t4/37', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (141, 4, '每年门诊人均费用增长比例', '/data/q/t4/38', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (142, 4, '每月住院人均费用', '/data/q/t4/39', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (143, 4, '每年住院人均费用', '/data/q/t4/40', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (144, 4, '每月住院人均费用增长比例', '/data/q/t4/41', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (145, 4, '每年住院人均费用增长比例', '/data/q/t4/42', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (146, 4, '每月住院人均费用 ', '/data/q/t4/43', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (147, 4, '每年住院人均费用', '/data/q/t4/44', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (148, 4, '每月门诊医疗服务收入', '/data/q/t4/45', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (149, 4, '每年门诊医疗服务收入', '/data/q/t4/46', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (150, 4, '每月门诊医疗有效收入', '/data/q/t4/47', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (151, 4, '每年门诊医疗有效收入', '/data/q/t4/48', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (152, 4, '每月门诊医疗服务收入占比', '/data/q/t4/49', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (153, 4, '每年门诊医疗服务收入占比', '/data/q/t4/50', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (154, 4, '每月门诊医疗有效收入占比', '/data/q/t4/51', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (155, 4, '每年门诊医疗有效收入占比', '/data/q/t4/52', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (156, 4, '每月住院医疗服务收入', '/data/q/t4/53', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (157, 4, '每年住院医疗服务收入', '/data/q/t4/54', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (158, 4, '每月住院医疗有效收入', '/data/q/t4/55', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (159, 4, '每年住院医疗有效收入', '/data/q/t4/56', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (160, 4, '每月住院医疗服务收入占比', '/data/q/t4/57', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (161, 4, '每年住院医疗服务收入占比', '/data/q/t4/58', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (162, 4, '每月住院医疗有效收入占比', '/data/q/t4/59', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (163, 4, '每年住院医疗有效收入占比', '/data/q/t4/60', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (164, 4, '每月全院医疗服务收入', '/data/q/t4/61', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (165, 4, '每年全院医疗服务收入', '/data/q/t4/62', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (166, 4, '每月全院医疗有效收入', '/data/q/t4/63', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (167, 4, '每年全院医疗有效收入', '/data/q/t4/64', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (168, 4, '每月全院医疗服务收入占比', '/data/q/t4/65', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (169, 4, '每年全院医疗服务收入占比', '/data/q/t4/66', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (170, 4, '每月全院医疗有效收入占比', '/data/q/t4/67', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (171, 4, '每年全院医疗有效收入占比', '/data/q/t4/68', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (172, 4, '每月门诊收入占比', '/data/q/t4/69', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (173, 4, '每年门诊收入占比', '/data/q/t4/70', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (174, 4, '每月住院收入占比', '/data/q/t4/71', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (175, 4, '每年住院收入占比', '/data/q/t4/72', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (176, 4, '每月全院耗材收入占比', '/data/q/t4/73', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (177, 4, '每年全院耗材收入占比', '/data/q/t4/74', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (178, 4, '每月全院药品收入占比', '/data/q/t4/75', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (179, 4, '每年全院药品收入占比', '/data/q/t4/76', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (180, 4, '每月百元收入的耗材消耗', '/data/q/t4/77', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (181, 4, '每年百元收入的耗材消耗', '/data/q/t4/78', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (182, 4, '每月百元医疗收入的耗材消耗', '/data/q/t4/79', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (183, 4, '每年百元医疗收入的耗材消耗', '/data/q/t4/80', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (184, 4, '每月百元医疗收入的医疗支出', '/data/q/t4/81', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (185, 4, '每年百元医疗收入的医疗支出', '/data/q/t4/82', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (186, 4, '每月百元医疗收入消耗的卫生材料', '/data/q/t4/83', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (187, 4, '每年百元医疗收入消耗的卫生材料', '/data/q/t4/84', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (188, 4, '资产负债率', '/data/q/t4/85', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (189, 4, '基本建设、设备购置长期负债占总资产的比例', '/data/q/t4/86', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (190, 4, '每月全院手术收入占比', '/data/q/t4/87', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (191, 4, '每年全院手术收入占比', '/data/q/t4/88', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (192, 5, '每日门急诊费用', '/data/q/t5/1', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (193, 5, '每周门急诊费用', '/data/q/t5/2', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (194, 5, '每月门急诊费用', '/data/q/t5/3', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (195, 5, '每年门急诊费用', '/data/q/t5/4', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (196, 5, '每日住院费用', '/data/q/t5/5', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (197, 5, '每周住院费用', '/data/q/t5/6', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (198, 5, '每月住院费用', '/data/q/t5/7', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (199, 5, '每年住院费用', '/data/q/t5/8', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (200, 5, '每日全院费用', '/data/q/t5/9', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (201, 5, '每周全院费用', '/data/q/t5/10', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (202, 5, '每月全院费用', '/data/q/t5/11', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (203, 5, '每年全院费用', '/data/q/t5/12', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (204, 5, '每日门急诊人均费用', '/data/q/t5/13', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (205, 5, '每周门急诊人均费用', '/data/q/t5/14', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (206, 5, '每月门急诊人均费用', '/data/q/t5/15', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (207, 5, '每年门急诊人均费用', '/data/q/t5/16', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (208, 5, '每日门急诊人均费用增长比例', '/data/q/t5/17', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (209, 5, '每周门急诊人均费用增长比例', '/data/q/t5/18', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (210, 5, '每月门急诊人均费用增长比例', '/data/q/t5/19', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (211, 5, '每年门急诊人均费用增长比例', '/data/q/t5/20', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (212, 5, '每日住院人均费用', '/data/q/t5/21', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (213, 5, '每周住院人均费用', '/data/q/t5/22', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (214, 5, '每月住院人均费用', '/data/q/t5/23', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (215, 5, '每年住院人均费用', '/data/q/t5/24', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (216, 5, '每日住院人均费用增长比例', '/data/q/t5/25', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (217, 5, '每周住院人均费用增长比例', '/data/q/t5/26', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (218, 5, '每月住院人均费用增长比例', '/data/q/t5/27', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (219, 5, '每年住院人均费用增长比例', '/data/q/t5/28', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (220, 5, '每月门诊医疗服务收入', '/data/q/t5/29', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (221, 5, '每年门诊医疗服务收入', '/data/q/t5/30', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (222, 5, '每月门诊医疗有效收入', '/data/q/t5/31', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (223, 5, '每年门诊医疗有效收入', '/data/q/t5/32', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (224, 5, '每月门诊医疗服务收入占比', '/data/q/t5/33', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (225, 5, '每年门诊医疗服务收入占比', '/data/q/t5/34', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (226, 5, '每月门诊医疗有效收入占比', '/data/q/t5/35', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (227, 5, '每年门诊医疗有效收入占比', '/data/q/t5/36', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (228, 5, '每月住院医疗服务收入', '/data/q/t5/37', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (229, 5, '每年住院医疗服务收入', '/data/q/t5/38', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (230, 5, '每月住院医疗有效收入', '/data/q/t5/39', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (231, 5, '每年住院医疗有效收入', '/data/q/t5/40', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (232, 5, '每月住院医疗服务收入占比', '/data/q/t5/41', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (233, 5, '每年住院医疗服务收入占比', '/data/q/t5/42', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (234, 5, '每月住院医疗有效收入占比', '/data/q/t5/43', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (235, 5, '每年住院医疗有效收入占比', '/data/q/t5/44', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (236, 5, '每月全院医疗服务收入', '/data/q/t5/45', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (237, 5, '每年全院医疗服务收入', '/data/q/t5/46', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (238, 5, '每月全院医疗有效收入', '/data/q/t5/47', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (239, 5, '每年全院医疗有效收入', '/data/q/t5/48', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (240, 5, '每月全院医疗服务收入占比', '/data/q/t5/49', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (241, 5, '每年全院医疗服务收入占比', '/data/q/t5/50', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (242, 5, '每月全院医疗有效收入占比', '/data/q/t5/51', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (243, 5, '每年全院医疗有效收入占比', '/data/q/t5/52', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (244, 5, '每月门诊收入占比', '/data/q/t5/53', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (245, 5, '每年门诊收入占比', '/data/q/t5/54', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (246, 5, '每月住院收入占比', '/data/q/t5/55', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (247, 5, '每年住院收入占比', '/data/q/t5/56', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (248, 5, '每月全院耗材收入占比', '/data/q/t5/57', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (249, 5, '每年全院耗材收入占比', '/data/q/t5/58', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (250, 5, '每月全院药品收入占比', '/data/q/t5/59', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (251, 5, '每年全院药品收入占比', '/data/q/t5/60', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (252, 5, '每日门急诊药占比', '/data/q/t5/61', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (253, 5, '每周门急诊药占比', '/data/q/t5/62', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (254, 5, '每月门急诊药占比', '/data/q/t5/63', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (255, 5, '每年门急诊药占比', '/data/q/t5/64', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (256, 5, '每日门急诊耗占比', '/data/q/t5/65', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (257, 5, '每周门急诊耗占比', '/data/q/t5/66', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (258, 5, '每月门急诊耗占比', '/data/q/t5/67', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (259, 5, '每年门急诊耗占比', '/data/q/t5/68', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (260, 5, '每日住院药占比', '/data/q/t5/69', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (261, 5, '每周住院药占比', '/data/q/t5/70', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (262, 5, '每月住院药占比', '/data/q/t5/71', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (263, 5, '每年住院药占比', '/data/q/t5/72', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (264, 5, '每日住院耗占比', '/data/q/t5/73', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (265, 5, '每周住院耗占比', '/data/q/t5/74', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (266, 5, '每月住院耗占比', '/data/q/t5/75', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (267, 5, '每年住院耗占比', '/data/q/t5/76', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (268, 5, '每日门急诊人均费用按地域汇总(省市区)', '/data/q/t5/77', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (269, 5, '每月门急诊人均费用按地域汇总(省市区)', '/data/q/t5/78', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (270, 5, '每年门急诊人均费用按地域汇总(省市区)', '/data/q/t5/79', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (271, 5, '每日住院人均费用按地域汇总(省市区)', '/data/q/t5/80', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (272, 5, '每月住院人均费用按地域汇总(省市区)', '/data/q/t5/81', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (273, 5, '每年住院人均费用按地域汇总(省市区)', '/data/q/t5/82', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (274, 5, '门诊国家谈判品种', '/data/q/t5/83', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (275, 5, '住院国家谈判品种', '/data/q/t5/84', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (276, 5, '门诊月度收费项目费用', '/data/q/t5/85', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (277, 5, '门诊年度收费项目费用', '/data/q/t5/86', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (278, 5, '住院月度收费项目费用', '/data/q/t5/87', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (279, 5, '住院年度收费项目费用', '/data/q/t5/88', NULL, '是', '[\'科室\' \'费用类别\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (280, 5, '门诊月度按药品项目查询', '/data/q/t5/89', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (281, 5, '门诊年度按药品项目查询', '/data/q/t5/90', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (282, 5, '住院月度按药品项目查询', '/data/q/t5/91', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (283, 5, '住院年度按药品项目查询', '/data/q/t5/92', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (284, 5, '门诊月度按耗材项目查询', '/data/q/t5/93', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (285, 5, '门诊年度按耗材项目查询', '/data/q/t5/94', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (286, 5, '住院月度按耗材项目查询', '/data/q/t5/95', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (287, 5, '住院年度按耗材项目查询', '/data/q/t5/96', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (288, 5, '收费项目之门诊心电图', '/data/q/t5/97', '几个特殊的收费项目查询', '是', '[\'收费项目\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (289, 5, '收费项目之住院心电图', '/data/q/t5/98', NULL, '是', '[\'收费项目\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (290, 5, '收费项目之门诊心电图', '/data/q/t5/99', NULL, '是', '[\'收费项目\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (291, 5, '收费项目之住院心电图', '/data/q/t5/100', NULL, '是', '[\'收费项目\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (292, 5, '心电图室费用', '/data/q/t5/101', '特殊科室的查询', '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (293, 5, '胃镜室费用', '/data/q/t5/102', '特殊科室的查询,包含胆道内镜中心,胃镜室,肠镜室', '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (294, 5, '运管部每日病人数量和费用', '/data/q/t5/103', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (295, 6, '全院在职职工总人数', '/data/q/t6/1', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (296, 6, '卫生技术人员人数', '/data/q/t6/2', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (297, 6, '医师人数', '/data/q/t6/3', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (298, 6, '中医医师人数', '/data/q/t6/4', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (299, 6, '西医医师人数', '/data/q/t6/5', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (300, 6, '护理人数', '/data/q/t6/6', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (301, 6, '技师人数', '/data/q/t6/7', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (302, 6, '药师人数', '/data/q/t6/8', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (303, 6, '检验师人数', '/data/q/t6/9', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (304, 6, '主任检验师人数', '/data/q/t6/10', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (305, 6, '副主任检验师人数', '/data/q/t6/11', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (306, 6, '主管检验师人数', '/data/q/t6/12', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (307, 6, '影像技师', '/data/q/t6/13', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (308, 6, '口腔技术人员人数', '/data/q/t6/14', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (309, 6, '其他卫生技术人员人数', '/data/q/t6/15', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (310, 6, '管理人员人数', '/data/q/t6/16', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (311, 6, '工勤技能人员人数', '/data/q/t6/17', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (312, 6, '财会人员人数', '/data/q/t6/18', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (313, 6, '其他技术人员人数', '/data/q/t6/19', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (314, 6, '会计师人数人数', '/data/q/t6/20', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (315, 6, '主任医师人数', '/data/q/t6/21', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (316, 6, '副主任医师人数', '/data/q/t6/22', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (317, 6, '主治医师人数', '/data/q/t6/23', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (318, 6, '主任护师人数', '/data/q/t6/24', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (319, 6, '副主任护师人数', '/data/q/t6/25', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (320, 6, '主管护师人数', '/data/q/t6/26', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (321, 6, '助产士', '/data/q/t6/27', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (322, 6, '主任技师人数', '/data/q/t6/28', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (323, 6, '副主任技师人数', '/data/q/t6/29', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (324, 6, '技士人数', '/data/q/t6/30', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (325, 6, '主任药师人数', '/data/q/t6/31', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (326, 6, '副主任药师人数', '/data/q/t6/32', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (327, 6, '药师人数', '/data/q/t6/33', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (328, 6, '教授人数', '/data/q/t6/34', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (329, 6, '副教授人数', '/data/q/t6/35', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (330, 6, '高级职称人数', '/data/q/t6/36', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (331, 6, '中级职称人数', '/data/q/t6/37', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (332, 6, '初级职称人数', '/data/q/t6/38', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (333, 6, '技术人员学历结构', '/data/q/t6/39', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (334, 6, '技术人员年龄结构', '/data/q/t6/40', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (335, 6, '离休人数', '/data/q/t6/41', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (336, 6, '退休人数', '/data/q/t6/42', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (337, 6, '年内流入人数', '/data/q/t6/43', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (338, 6, '年内流出人数', '/data/q/t6/44', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (339, 6, '取得母婴保健技术服务资质的人员', '/data/q/t6/45', '数据来自医务部', '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (340, 6, '助理医师人数', '/data/q/t6/46', '数据来自医务部', '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (341, 7, '全院在职职工总人数', '/data/q/t7/1', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (342, 7, '卫生技术人员人数', '/data/q/t7/2', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (343, 7, '医师人数', '/data/q/t7/3', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (344, 7, '中医医师人数', '/data/q/t7/4', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (345, 7, '西医医师人数', '/data/q/t7/5', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (346, 7, '护理人数', '/data/q/t7/6', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (347, 7, '技师人数', '/data/q/t7/7', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (348, 7, '药师人数', '/data/q/t7/8', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (349, 7, '检验师人数', '/data/q/t7/9', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (350, 7, '主任检验师人数', '/data/q/t7/10', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (351, 7, '副主任检验师人数', '/data/q/t7/11', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (352, 7, '主管检验师人数', '/data/q/t7/12', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (353, 7, '影像技师', '/data/q/t7/13', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (354, 7, '口腔技术人员人数', '/data/q/t7/14', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (355, 7, '其他卫生技术人员人数', '/data/q/t7/15', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (356, 7, '管理人员人数', '/data/q/t7/16', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (357, 7, '工勤技能人员人数', '/data/q/t7/17', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (358, 7, '财会人员人数', '/data/q/t7/18', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (359, 7, '其他技术人员人数', '/data/q/t7/19', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (360, 7, '会计师人数人数', '/data/q/t7/20', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (361, 7, '主任医师人数', '/data/q/t7/21', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (362, 7, '副主任医师人数', '/data/q/t7/22', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (363, 7, '主治医师人数', '/data/q/t7/23', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (364, 7, '主任护师人数', '/data/q/t7/24', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (365, 7, '副主任护师人数', '/data/q/t7/25', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (366, 7, '主管护师人数', '/data/q/t7/26', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (367, 7, '助产士', '/data/q/t7/27', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (368, 7, '主任技师人数', '/data/q/t7/28', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (369, 7, '副主任技师人数', '/data/q/t7/29', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (370, 7, '技士人数', '/data/q/t7/30', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (371, 7, '主任药师人数', '/data/q/t7/31', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (372, 7, '副主任药师人数', '/data/q/t7/32', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (373, 7, '药师人数', '/data/q/t7/33', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (374, 7, '教授人数', '/data/q/t7/34', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (375, 7, '副教授人数', '/data/q/t7/35', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (376, 7, '高级职称人数', '/data/q/t7/36', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (377, 7, '中级职称人数', '/data/q/t7/37', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (378, 7, '初级职称人数', '/data/q/t7/38', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (379, 7, '技术人员学历结构', '/data/q/t7/39', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (380, 7, '技术人员年龄结构', '/data/q/t7/40', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (381, 8, '国家自然科学基金项目数量', '/data/q/t8/1', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (382, 8, '湖南省自然科学基金项目数量', '/data/q/t8/2', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (383, 8, '科技奖项获得数', '/data/q/t8/3', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (384, 9, '年度进修人数', '/data/q/t9/1', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (385, 9, '进度规培人数', '/data/q/t9/2', NULL, '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (386, 10, '出院人数', '/data/q/t10/1', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (387, 10, '出院患者次均费用', '/data/q/t10/2', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (388, 10, '出院患者药占比', '/data/q/t10/3', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (389, 10, '出院患者耗占比', '/data/q/t10/4', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (390, 10, '出院患者医疗有效收入', '/data/q/t10/5', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (391, 10, '出院患者医疗服务收入', '/data/q/t10/6', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (392, 10, '每月住院患者诊断名称', '/data/q/t10/7', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (393, 10, '每年住院患者诊断名称', '/data/q/t10/8', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (394, 10, '每月住院患者手术名称', '/data/q/t10/9', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (395, 10, '每年住院患者手术名称', '/data/q/t10/10', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (396, 10, '出院患者按地域汇总', '/data/q/t10/11', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (397, 10, '出院患者年龄段', '/data/q/t10/12', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (398, 10, '出院患者性别', '/data/q/t10/13', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (399, 10, '机器人手术例数', '/data/q/t10/14', NULL, '是', '[\'科室\']', NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');
INSERT INTO `datadetails` VALUES (400, 11, '核酸检测人数', '/data/q/t11/1', '按分类汇总', '否', NULL, NULL, 1, '10530', NULL, '2022-03-22 11:08:26', '2022-03-22 11:08:26');

-- ----------------------------
-- Table structure for datatypes
-- ----------------------------
DROP TABLE IF EXISTS `datatypes`;
CREATE TABLE `datatypes`  (
  `pid` bigint(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `from` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `enabled` int(2) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `create_at` datetime(0) NULL DEFAULT NULL,
  `update_at` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of datatypes
-- ----------------------------
INSERT INTO `datatypes` VALUES (1, 'HIS门诊数据', 'HIS', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (2, '病案住院数据', '病案室', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (3, 'HIS住院数据', 'HIS', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (4, '财务费用数据', '财务部', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (5, 'HIS费用数据', 'HIS', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (6, 'HRP数据', 'HRP', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (7, '人资数据', '人力资源部', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (8, '科研数据', '科研部', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (9, '教培数据', '教育培训部', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (10, '住院数据', '病案首页', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);
INSERT INTO `datatypes` VALUES (11, '核酸检测', '东华检测', 1, '10530', NULL, '2022-03-22 11:08:26', NULL);

-- ----------------------------
-- Table structure for depts
-- ----------------------------
DROP TABLE IF EXISTS `depts`;
CREATE TABLE `depts`  (
  `dept_id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(255) NULL DEFAULT NULL,
  `sub_count` int(255) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_sort` int(255) NULL DEFAULT NULL,
  `enabled` int(255) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of depts
-- ----------------------------
INSERT INTO `depts` VALUES (2, 7, 1, '财务部', 3, 1, 'admin', 'admin', '2019-03-25 09:15:32.000', '2020-08-02 14:48:47.000');
INSERT INTO `depts` VALUES (5, 7, 0, '人力资源部', 4, 1, 'admin', 'admin', '2019-03-25 09:20:44.000', '2020-05-17 14:27:27.000');
INSERT INTO `depts` VALUES (6, 8, 0, '院务工作部', 6, 1, 'admin', 'admin', '2019-03-25 09:52:18.000', '2020-06-08 11:59:21.000');
INSERT INTO `depts` VALUES (7, NULL, 2, '华南分部', 0, 1, 'admin', 'admin', '2019-03-25 11:04:50.000', '2020-06-08 12:08:56.000');
INSERT INTO `depts` VALUES (8, NULL, 2, '华北分部', 1, 1, 'admin', 'admin', '2019-03-25 11:04:53.000', '2020-05-14 12:54:00.000');
INSERT INTO `depts` VALUES (9, 8, 0, '审计科', 6, 1, NULL, NULL, '2022-05-03 19:35:16', NULL);
INSERT INTO `depts` VALUES (10, 8, 0, '党务工作部', 7, 1, NULL, NULL, '2022-05-03 19:37:12', NULL);

-- ----------------------------
-- Table structure for dict
-- ----------------------------
DROP TABLE IF EXISTS `dict`;
CREATE TABLE `dict`  (
  `dict_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典名称',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 'user_status', '用户状态', '10530', NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict` VALUES (4, 'dept_status', '部门状态', '10530', NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict` VALUES (5, 'job_status', '岗位状态', '10530', NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict` VALUES (8, 'data_status', '数据管理', '10530', NULL, '2022-05-05 22:35:07', NULL);

-- ----------------------------
-- Table structure for dict_detail
-- ----------------------------
DROP TABLE IF EXISTS `dict_detail`;
CREATE TABLE `dict_detail`  (
  `detail_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dict_id` bigint(11) NULL DEFAULT NULL COMMENT '字典id',
  `label` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典标签',
  `value` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '字典值',
  `dict_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`detail_id`) USING BTREE,
  INDEX `FK5tpkputc6d9nboxojdbgnpmyb`(`dict_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dict_detail
-- ----------------------------
INSERT INTO `dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict_detail` VALUES (10, 8, '启用', 'true', 1, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` int(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 14 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (8, '人事专员', 1, 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `jobs` VALUES (10, '产品经理', 1, 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `jobs` VALUES (11, '全栈开发', 1, 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `jobs` VALUES (13, '软件测试', 1, 5, '10530', '10530', '2022-05-06 22:45:11', '2022-05-06 22:45:11');

-- ----------------------------
-- Table structure for logs
-- ----------------------------
DROP TABLE IF EXISTS `logs`;
CREATE TABLE `logs`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `req_username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '发起请求的用户名',
  `req_url` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '请求后端的url路径',
  `origin` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '来自哪个IP的请求',
  `browser` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '浏览器类型',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '请求时间',
  `user_agent` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT 'user_agent',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 28 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of logs
-- ----------------------------
INSERT INTO `logs` VALUES (5, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (6, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (7, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (8, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:40', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (9, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:41', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (10, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (11, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (12, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:44', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (13, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:45:45', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (14, '10530', '/api/logs/user', '::1', NULL, '2022-03-20 14:47:14', 'PostmanRuntime/7.26.8');
INSERT INTO `logs` VALUES (15, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:48:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (16, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:48:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (17, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:48:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (18, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:49:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (19, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:49:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (20, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:49:58', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (21, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:49:59', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (22, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:50:00', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (23, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:50:37', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (24, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:51:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (25, '10530', '/api/menus/build?username=10530&user_id=1', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:51:14', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (26, '10530', '/auth/info?username=10530', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:51:15', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');
INSERT INTO `logs` VALUES (27, '10530', '/api/logs/user?page=0&size=10&sort=id%2Cdesc', '::ffff:127.0.0.1', '\" Not A;Brand\";v=\"99\", \"Chromium\";v=\"99\", \"Google Chrome\";v=\"99\"', '2022-03-20 14:51:16', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/99.0.4844.74 Safari/537.36');

-- ----------------------------
-- Table structure for menus
-- ----------------------------
DROP TABLE IF EXISTS `menus`;
CREATE TABLE `menus`  (
  `menu_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `pid` bigint(20) NULL DEFAULT NULL COMMENT '上级菜单ID',
  `sub_count` int(5) NULL DEFAULT 0 COMMENT '子菜单数目',
  `type` int(11) NULL DEFAULT NULL COMMENT '菜单类型',
  `title` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '菜单标题',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件名称',
  `component` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '组件',
  `menu_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `icon` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '图标',
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '链接地址',
  `redirect` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '重定向',
  `i_frame` int(1) NULL DEFAULT NULL COMMENT '是否外链',
  `cache` int(1) NULL DEFAULT 0 COMMENT '缓存',
  `hidden` int(1) NULL DEFAULT 0 COMMENT '隐藏',
  `permission` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`menu_id`) USING BTREE,
  UNIQUE INDEX `uniq_title`(`title`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 142 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of menus
-- ----------------------------
INSERT INTO `menus` VALUES (1, NULL, 7, 0, '系统管理', NULL, 'Layout', 1, 'system', 'system', '/system/user', 0, 0, 0, NULL, NULL, NULL, '2018-12-18 15:11:29', NULL);
INSERT INTO `menus` VALUES (2, 1, 3, 1, '用户管理', 'User', 'system/user/index', 2, 'peoples', 'user', NULL, 0, 0, 0, 'user:list', NULL, NULL, '2018-12-18 15:14:44', NULL);
INSERT INTO `menus` VALUES (3, 1, 3, 1, '角色管理', 'Role', 'system/role/index', 3, 'role', 'role', NULL, 0, 0, 0, 'roles:list', NULL, NULL, '2018-12-18 15:16:07', NULL);
INSERT INTO `menus` VALUES (5, 1, 3, 1, '菜单管理', 'Menu', 'system/menu/index', 5, 'menu', 'menu', NULL, 0, 0, 0, 'menu:list', NULL, NULL, '2018-12-18 15:17:28', NULL);
INSERT INTO `menus` VALUES (10, NULL, 5, 0, '组件管理', NULL, 'Layout', 50, 'zujian', 'components', '/zujian/icon', 0, 0, 0, NULL, NULL, NULL, '2018-12-19 13:38:16', NULL);
INSERT INTO `menus` VALUES (11, 10, 0, 1, '图标库', 'Icons', 'components/icons/index', 51, 'icon', 'icon', NULL, 0, 0, 0, NULL, NULL, NULL, '2018-12-19 13:38:49', NULL);
INSERT INTO `menus` VALUES (15, 10, 0, 1, '富文本', 'Editor', 'components/Editor', 52, 'fwb', 'tinymce', NULL, 0, 0, 0, NULL, NULL, NULL, '2018-12-27 11:58:25', NULL);
INSERT INTO `menus` VALUES (33, 10, 0, 1, 'Markdown', 'Markdown', 'components/MarkDown', 53, 'markdown', 'markdown', NULL, 0, 0, 0, NULL, NULL, NULL, '2019-03-08 13:46:44', NULL);
INSERT INTO `menus` VALUES (34, 10, 0, 1, 'Yaml编辑器', 'YamlEdit', 'components/YamlEdit', 54, 'dev', 'yaml', NULL, 0, 0, 0, NULL, NULL, NULL, '2019-03-08 15:49:40', NULL);
INSERT INTO `menus` VALUES (35, 1, 3, 1, '部门管理', 'Dept', 'system/dept/index', 6, 'dept', 'dept', NULL, 0, 0, 0, 'dept:list', NULL, NULL, '2019-03-25 09:46:00', NULL);
INSERT INTO `menus` VALUES (37, 1, 3, 1, '岗位管理', 'Job', 'system/job/index', 7, 'Steve-Jobs', 'job', NULL, 0, 0, 0, 'job:list', NULL, NULL, '2019-03-29 13:51:18', NULL);
INSERT INTO `menus` VALUES (39, 1, 3, 1, '字典管理', 'Dict', 'system/dict/index', 8, 'dictionary', 'dict', NULL, 0, 0, 0, 'dict:list', NULL, NULL, '2019-04-10 11:49:04', NULL);
INSERT INTO `menus` VALUES (44, 2, 0, 2, '用户新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'user:add', NULL, NULL, '2019-10-29 10:59:46', NULL);
INSERT INTO `menus` VALUES (45, 2, 0, 2, '用户编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'user:edit', NULL, NULL, '2019-10-29 11:00:08', NULL);
INSERT INTO `menus` VALUES (46, 2, 0, 2, '用户删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'user:del', NULL, NULL, '2019-10-29 11:00:23', NULL);
INSERT INTO `menus` VALUES (48, 3, 0, 2, '角色创建', NULL, '', 2, '', '', NULL, 0, 0, 0, 'roles:add', NULL, NULL, '2019-10-29 12:45:34', NULL);
INSERT INTO `menus` VALUES (49, 3, 0, 2, '角色修改', NULL, '', 3, '', '', NULL, 0, 0, 0, 'roles:edit', NULL, NULL, '2019-10-29 12:46:16', NULL);
INSERT INTO `menus` VALUES (50, 3, 0, 2, '角色删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'roles:del', NULL, NULL, '2019-10-29 12:46:51', NULL);
INSERT INTO `menus` VALUES (52, 5, 0, 2, '菜单新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'menu:add', NULL, NULL, '2019-10-29 12:55:07', NULL);
INSERT INTO `menus` VALUES (53, 5, 0, 2, '菜单编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'menu:edit', NULL, NULL, '2019-10-29 12:55:40', NULL);
INSERT INTO `menus` VALUES (54, 5, 0, 2, '菜单删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'menu:del', NULL, NULL, '2019-10-29 12:56:00', NULL);
INSERT INTO `menus` VALUES (56, 35, 0, 2, '部门新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'dept:add', NULL, NULL, '2019-10-29 12:57:09', NULL);
INSERT INTO `menus` VALUES (57, 35, 0, 2, '部门编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'dept:edit', NULL, NULL, '2019-10-29 12:57:27', NULL);
INSERT INTO `menus` VALUES (58, 35, 0, 2, '部门删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'dept:del', NULL, NULL, '2019-10-29 12:57:41', NULL);
INSERT INTO `menus` VALUES (60, 37, 0, 2, '岗位新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'job:add', NULL, NULL, '2019-10-29 12:58:27', NULL);
INSERT INTO `menus` VALUES (61, 37, 0, 2, '岗位编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'job:edit', NULL, NULL, '2019-10-29 12:58:45', NULL);
INSERT INTO `menus` VALUES (62, 37, 0, 2, '岗位删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'job:del', NULL, NULL, '2019-10-29 12:59:04', NULL);
INSERT INTO `menus` VALUES (64, 39, 0, 2, '字典新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'dict:add', NULL, NULL, '2019-10-29 13:00:17', NULL);
INSERT INTO `menus` VALUES (65, 39, 0, 2, '字典编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'dict:edit', NULL, NULL, '2019-10-29 13:00:42', NULL);
INSERT INTO `menus` VALUES (66, 39, 0, 2, '字典删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'dict:del', NULL, NULL, '2019-10-29 13:00:59', NULL);
INSERT INTO `menus` VALUES (73, 28, 0, 2, '任务新增', NULL, '', 2, '', '', NULL, 0, 0, 0, 'timing:add', NULL, NULL, '2019-10-29 13:07:28', NULL);
INSERT INTO `menus` VALUES (74, 28, 0, 2, '任务编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'timing:edit', NULL, NULL, '2019-10-29 13:07:41', NULL);
INSERT INTO `menus` VALUES (75, 28, 0, 2, '任务删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'timing:del', NULL, NULL, '2019-10-29 13:07:54', NULL);
INSERT INTO `menus` VALUES (77, 18, 0, 2, '上传文件', NULL, '', 2, '', '', NULL, 0, 0, 0, 'storage:add', NULL, NULL, '2019-10-29 13:09:09', NULL);
INSERT INTO `menus` VALUES (78, 18, 0, 2, '文件编辑', NULL, '', 3, '', '', NULL, 0, 0, 0, 'storage:edit', NULL, NULL, '2019-10-29 13:09:22', NULL);
INSERT INTO `menus` VALUES (79, 18, 0, 2, '文件删除', NULL, '', 4, '', '', NULL, 0, 0, 0, 'storage:del', NULL, NULL, '2019-10-29 13:09:34', NULL);
INSERT INTO `menus` VALUES (83, 10, 0, 1, '图表库', 'Echarts', 'components/Echarts', 50, 'chart', 'echarts', NULL, 0, 1, 0, '', NULL, NULL, '2019-11-21 09:04:32', NULL);
INSERT INTO `menus` VALUES (134, 0, 0, 0, '数据中心', '', 'Layout', 999, 'app', 'data', '/data/home', 0, 0, 0, 'null', NULL, NULL, '2022-04-12 16:49:26', '2022-04-12 16:50:10');
INSERT INTO `menus` VALUES (135, 134, 0, 1, '数据管理', 'Home', 'data/data/index', 999, 'edit', 'home', NULL, 0, 0, 0, NULL, NULL, NULL, '2022-04-12 16:51:33', NULL);
INSERT INTO `menus` VALUES (136, 134, 0, 1, '权限管理', 'Permission', 'data/permission/index', 999, 'permission', 'permission', NULL, 0, 0, 0, NULL, NULL, NULL, '2022-04-12 16:55:35', NULL);
INSERT INTO `menus` VALUES (137, 134, 0, 1, '数据链接', 'Chain', 'data/chain/index', 1000, 'link', 'chain', NULL, 0, 0, 0, NULL, NULL, NULL, '2022-04-12 17:04:56', NULL);
INSERT INTO `menus` VALUES (139, NULL, 0, 0, '人资数据', NULL, 'Layout', 999, 'peoples', 'hr', '/hr/home', 0, 0, 0, NULL, NULL, NULL, '2022-04-12 17:13:38', NULL);
INSERT INTO `menus` VALUES (140, 139, 0, 1, '首页', 'Home', 'hr/index', 999, 'edit', 'home', NULL, 0, 0, 0, NULL, NULL, NULL, '2022-04-12 17:14:55', NULL);
INSERT INTO `menus` VALUES (141, 139, 0, 1, '人员管理', 'Manager', 'hr/manager/index', 999, 'user1', 'manager', NULL, 0, 0, 0, NULL, NULL, NULL, '2022-04-12 17:16:40', NULL);

-- ----------------------------
-- Table structure for reports
-- ----------------------------
DROP TABLE IF EXISTS `reports`;
CREATE TABLE `reports`  (
  `id` int(11) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `frequency` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  `description` text CHARACTER SET utf8 COLLATE utf8_general_ci NULL,
  `enabled` int(2) NULL DEFAULT NULL,
  `create_at` datetime(0) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of reports
-- ----------------------------
INSERT INTO `reports` VALUES (1, '每日报表', '每日', '每日报送的基本数据报表', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (2, '每月报表', '每月', NULL, 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (3, '每季度报表', '每季度', NULL, 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (4, '每年报表', '每年', NULL, 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (5, '2022年省级试点医院医药收入构成监测月报表', '每月', '医改报表', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (6, '公立医院综合改革真抓实干成效明显督查激励工作推进情况月报表', '每月', '医改报表，按月度累加', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (7, '核心指标', '每周', '周君主任专用每周核心指标的报表', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (8, '财务核心指标', '每月', '财务每月核心指标报表', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (9, '医务部考核数据指标', '每月', '目前是八个指标,合理用药/临床路径管理入径率/综合评价/平均住院日/手术占比/D型病例占比/出院人次', 1, '2022-03-22 11:16:58', '10530');
INSERT INTO `reports` VALUES (10, '病案室月度门诊相关数据', '每月', '包括核酸检测人数/中医就诊人数/网上预约人数/门急诊人次等', 1, '2022-03-22 11:16:58', '10530');

-- ----------------------------
-- Table structure for roles
-- ----------------------------
DROP TABLE IF EXISTS `roles`;
CREATE TABLE `roles`  (
  `role_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '名称',
  `level` int(255) NULL DEFAULT NULL COMMENT '角色级别',
  `description` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '描述',
  `data_scope` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '数据权限',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `type` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '角色的英文名称',
  PRIMARY KEY (`role_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `role_name_index`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24', 'admin');
INSERT INTO `roles` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12', 'normal');
INSERT INTO `roles` VALUES (3, '新闻管理', 3, '新闻管理', '自定义', '10530', '10530', '2018-11-23 13:09:06', '2022-03-06 16:45:45', 'newsEdit');
INSERT INTO `roles` VALUES (4, '人员管理', 3, '人力资源部对全院人员信息进行管理的角色', '自定义', '10530', '10530', NULL, '2022-04-14 17:23:44', 'hrEdit');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1831 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES (422, 2, 1);
INSERT INTO `roles_menus` VALUES (423, 2, 6);
INSERT INTO `roles_menus` VALUES (424, 2, 7);
INSERT INTO `roles_menus` VALUES (425, 2, 9);
INSERT INTO `roles_menus` VALUES (426, 2, 10);
INSERT INTO `roles_menus` VALUES (427, 2, 11);
INSERT INTO `roles_menus` VALUES (428, 2, 14);
INSERT INTO `roles_menus` VALUES (429, 2, 15);
INSERT INTO `roles_menus` VALUES (430, 2, 19);
INSERT INTO `roles_menus` VALUES (431, 2, 21);
INSERT INTO `roles_menus` VALUES (432, 2, 22);
INSERT INTO `roles_menus` VALUES (433, 2, 23);
INSERT INTO `roles_menus` VALUES (434, 2, 24);
INSERT INTO `roles_menus` VALUES (435, 2, 27);
INSERT INTO `roles_menus` VALUES (436, 2, 30);
INSERT INTO `roles_menus` VALUES (437, 2, 32);
INSERT INTO `roles_menus` VALUES (438, 2, 33);
INSERT INTO `roles_menus` VALUES (439, 2, 34);
INSERT INTO `roles_menus` VALUES (440, 2, 36);
INSERT INTO `roles_menus` VALUES (441, 2, 80);
INSERT INTO `roles_menus` VALUES (442, 2, 82);
INSERT INTO `roles_menus` VALUES (443, 2, 83);
INSERT INTO `roles_menus` VALUES (444, 2, 116);
INSERT INTO `roles_menus` VALUES (1729, 1, 1);
INSERT INTO `roles_menus` VALUES (1730, 1, 2);
INSERT INTO `roles_menus` VALUES (1731, 1, 3);
INSERT INTO `roles_menus` VALUES (1732, 1, 5);
INSERT INTO `roles_menus` VALUES (1733, 1, 6);
INSERT INTO `roles_menus` VALUES (1734, 1, 7);
INSERT INTO `roles_menus` VALUES (1735, 1, 9);
INSERT INTO `roles_menus` VALUES (1736, 1, 10);
INSERT INTO `roles_menus` VALUES (1737, 1, 11);
INSERT INTO `roles_menus` VALUES (1738, 1, 14);
INSERT INTO `roles_menus` VALUES (1739, 1, 15);
INSERT INTO `roles_menus` VALUES (1740, 1, 18);
INSERT INTO `roles_menus` VALUES (1741, 1, 19);
INSERT INTO `roles_menus` VALUES (1742, 1, 21);
INSERT INTO `roles_menus` VALUES (1743, 1, 22);
INSERT INTO `roles_menus` VALUES (1744, 1, 23);
INSERT INTO `roles_menus` VALUES (1745, 1, 24);
INSERT INTO `roles_menus` VALUES (1746, 1, 27);
INSERT INTO `roles_menus` VALUES (1747, 1, 28);
INSERT INTO `roles_menus` VALUES (1748, 1, 30);
INSERT INTO `roles_menus` VALUES (1749, 1, 32);
INSERT INTO `roles_menus` VALUES (1750, 1, 33);
INSERT INTO `roles_menus` VALUES (1751, 1, 34);
INSERT INTO `roles_menus` VALUES (1752, 1, 35);
INSERT INTO `roles_menus` VALUES (1753, 1, 36);
INSERT INTO `roles_menus` VALUES (1754, 1, 37);
INSERT INTO `roles_menus` VALUES (1755, 1, 38);
INSERT INTO `roles_menus` VALUES (1756, 1, 39);
INSERT INTO `roles_menus` VALUES (1757, 1, 41);
INSERT INTO `roles_menus` VALUES (1758, 1, 44);
INSERT INTO `roles_menus` VALUES (1759, 1, 45);
INSERT INTO `roles_menus` VALUES (1760, 1, 46);
INSERT INTO `roles_menus` VALUES (1761, 1, 48);
INSERT INTO `roles_menus` VALUES (1762, 1, 49);
INSERT INTO `roles_menus` VALUES (1763, 1, 50);
INSERT INTO `roles_menus` VALUES (1764, 1, 52);
INSERT INTO `roles_menus` VALUES (1765, 1, 53);
INSERT INTO `roles_menus` VALUES (1766, 1, 54);
INSERT INTO `roles_menus` VALUES (1767, 1, 56);
INSERT INTO `roles_menus` VALUES (1768, 1, 57);
INSERT INTO `roles_menus` VALUES (1769, 1, 58);
INSERT INTO `roles_menus` VALUES (1770, 1, 60);
INSERT INTO `roles_menus` VALUES (1771, 1, 61);
INSERT INTO `roles_menus` VALUES (1772, 1, 62);
INSERT INTO `roles_menus` VALUES (1773, 1, 64);
INSERT INTO `roles_menus` VALUES (1774, 1, 65);
INSERT INTO `roles_menus` VALUES (1775, 1, 66);
INSERT INTO `roles_menus` VALUES (1776, 1, 73);
INSERT INTO `roles_menus` VALUES (1777, 1, 74);
INSERT INTO `roles_menus` VALUES (1778, 1, 75);
INSERT INTO `roles_menus` VALUES (1779, 1, 77);
INSERT INTO `roles_menus` VALUES (1780, 1, 78);
INSERT INTO `roles_menus` VALUES (1781, 1, 79);
INSERT INTO `roles_menus` VALUES (1782, 1, 80);
INSERT INTO `roles_menus` VALUES (1783, 1, 82);
INSERT INTO `roles_menus` VALUES (1784, 1, 83);
INSERT INTO `roles_menus` VALUES (1785, 1, 90);
INSERT INTO `roles_menus` VALUES (1786, 1, 92);
INSERT INTO `roles_menus` VALUES (1787, 1, 93);
INSERT INTO `roles_menus` VALUES (1788, 1, 94);
INSERT INTO `roles_menus` VALUES (1789, 1, 97);
INSERT INTO `roles_menus` VALUES (1790, 1, 98);
INSERT INTO `roles_menus` VALUES (1791, 1, 102);
INSERT INTO `roles_menus` VALUES (1792, 1, 103);
INSERT INTO `roles_menus` VALUES (1793, 1, 104);
INSERT INTO `roles_menus` VALUES (1794, 1, 105);
INSERT INTO `roles_menus` VALUES (1795, 1, 106);
INSERT INTO `roles_menus` VALUES (1796, 1, 107);
INSERT INTO `roles_menus` VALUES (1797, 1, 108);
INSERT INTO `roles_menus` VALUES (1798, 1, 109);
INSERT INTO `roles_menus` VALUES (1799, 1, 110);
INSERT INTO `roles_menus` VALUES (1800, 1, 111);
INSERT INTO `roles_menus` VALUES (1801, 1, 112);
INSERT INTO `roles_menus` VALUES (1802, 1, 113);
INSERT INTO `roles_menus` VALUES (1803, 1, 114);
INSERT INTO `roles_menus` VALUES (1804, 1, 116);
INSERT INTO `roles_menus` VALUES (1805, 1, 120);
INSERT INTO `roles_menus` VALUES (1806, 1, 115);
INSERT INTO `roles_menus` VALUES (1807, 1, 117);
INSERT INTO `roles_menus` VALUES (1808, 1, 118);
INSERT INTO `roles_menus` VALUES (1809, 1, 119);
INSERT INTO `roles_menus` VALUES (1810, 1, 121);
INSERT INTO `roles_menus` VALUES (1811, 1, 122);
INSERT INTO `roles_menus` VALUES (1812, 1, 123);
INSERT INTO `roles_menus` VALUES (1813, 1, 127);
INSERT INTO `roles_menus` VALUES (1814, 1, 124);
INSERT INTO `roles_menus` VALUES (1815, 1, 129);
INSERT INTO `roles_menus` VALUES (1816, 1, 128);
INSERT INTO `roles_menus` VALUES (1817, 1, 131);
INSERT INTO `roles_menus` VALUES (1818, 1, 130);
INSERT INTO `roles_menus` VALUES (1819, 1, 133);
INSERT INTO `roles_menus` VALUES (1820, 1, 132);
INSERT INTO `roles_menus` VALUES (1821, 1, 134);
INSERT INTO `roles_menus` VALUES (1822, 1, 135);
INSERT INTO `roles_menus` VALUES (1823, 1, 136);
INSERT INTO `roles_menus` VALUES (1824, 1, 137);
INSERT INTO `roles_menus` VALUES (1825, 1, 140);
INSERT INTO `roles_menus` VALUES (1826, 1, 141);
INSERT INTO `roles_menus` VALUES (1827, 1, 139);
INSERT INTO `roles_menus` VALUES (1828, 4, 140);
INSERT INTO `roles_menus` VALUES (1829, 4, 141);
INSERT INTO `roles_menus` VALUES (1830, 4, 139);

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `user_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `dept_name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '部门名称',
  `dept_id` int(11) NULL DEFAULT NULL COMMENT '部门id',
  `username` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '用户名',
  `gender` varchar(2) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '性别',
  `phone` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '手机号码',
  `nickName` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `avatar_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `avatar_path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '头像真实路径',
  `password` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '密码',
  `is_admin` int(1) NULL DEFAULT 0 COMMENT '是否为admin账号',
  `enabled` int(1) NULL DEFAULT NULL COMMENT '状态：1启用、0禁用',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `pwd_reset_time` datetime(0) NULL DEFAULT NULL COMMENT '修改密码的时间',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE,
  UNIQUE INDEX `uniq_username`(`username`) USING BTREE,
  INDEX `FK5rwmryny6jthaaxkogownknqp`(`dept_name`) USING BTREE,
  INDEX `FKpq2dhypk2qgt68nauh2by22jb`(`avatar_name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '财务部', 2, '10530', '女', '18999998877', '泡泡龙666', '用户头像', 'http://localhost:8000/images/avatar/28cccc29-cc07-49c4-ae44-5cf9a736fcb4.png', '$2a$10$UdwbD6amnW1fUFixQjzSu.7WbOFy3zVJPoDB1xnZuQs.nAcASjGO2', 1, 1, 'admin', 'admin', '2022-01-30 20:32:58', '2022-01-30 20:32:58', '2022-03-20 12:44:01');
INSERT INTO `users` VALUES (2, '财务部', 2, '10531', '男', '18999998888', '潇潇懂', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$7H805QbW0ZPr8OSnvuP11.69idunc3oRoOU1QBusz/oQHltE0iPoS', 0, 1, 'admin', 'admin', '2022-03-03 15:17:45', '2022-03-03 15:17:45', '2022-03-04 16:40:16');
INSERT INTO `users` VALUES (11, '院务工作部', 6, '10533', '男', '18999998888', '小桃子666', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$7biIcHDCjruH6b6/5VfyIONN8wM6EDuOKwG136OPx5Z7FfcGXMF9m', 0, 1, 'admin', 'admin', '2022-03-03 17:39:23', '2022-03-03 17:39:23', '2022-03-04 16:52:33');
INSERT INTO `users` VALUES (13, '财务部', 2, '10536', '男', '15263986398', '非常yyds', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$r7OgWRygJ/pcdFpLTPtP6OYO4GfHj5Hv5hKXbQGFl3Iy9JqKwWwrq', 0, 1, 'admin', 'admin', '2022-03-05 13:15:30', '2022-03-05 13:15:30', '2022-03-05 16:11:29');
INSERT INTO `users` VALUES (15, '财务部', 2, '10541', '男', '15896325896', '躺平侠', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$ILKQ5oaPk8qw37uUGdkQeeHfPE1lYStpqxZmStzYmw3NClgM6vlZC', 0, 1, 'admin', 'admin', '2022-03-05 13:34:46', '2022-03-05 13:34:46', '2022-03-05 13:34:46');

-- ----------------------------
-- Table structure for users_datas
-- ----------------------------
DROP TABLE IF EXISTS `users_datas`;
CREATE TABLE `users_datas`  (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(11) NULL DEFAULT NULL,
  `data_id` bigint(11) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_datas
-- ----------------------------

-- ----------------------------
-- Table structure for users_depts
-- ----------------------------
DROP TABLE IF EXISTS `users_depts`;
CREATE TABLE `users_depts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_depts
-- ----------------------------
INSERT INTO `users_depts` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for users_jobs
-- ----------------------------
DROP TABLE IF EXISTS `users_jobs`;
CREATE TABLE `users_jobs`  (
  `user_id` int(20) NOT NULL COMMENT '用户ID',
  `job_id` int(20) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `job_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_jobs
-- ----------------------------
INSERT INTO `users_jobs` VALUES (1, 11);
INSERT INTO `users_jobs` VALUES (2, 8);
INSERT INTO `users_jobs` VALUES (11, 8);
INSERT INTO `users_jobs` VALUES (13, 8);
INSERT INTO `users_jobs` VALUES (15, 8);

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 1, 1);
INSERT INTO `users_roles` VALUES (2, 2, 2);
INSERT INTO `users_roles` VALUES (6, 11, 2);
INSERT INTO `users_roles` VALUES (20, 13, 2);
INSERT INTO `users_roles` VALUES (22, 15, 2);

-- ----------------------------
-- Table structure for uuid
-- ----------------------------
DROP TABLE IF EXISTS `uuid`;
CREATE TABLE `uuid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` datetime(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 77 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of uuid
-- ----------------------------
INSERT INTO `uuid` VALUES (71, 'f93fed7c-6bb1-4da1-9637-2ae958b5fedc', 'kQMb', '2022-05-03 17:47:39');
INSERT INTO `uuid` VALUES (72, '3bb80a60-ac7a-4a17-93fe-75f2414dbf60', 'XBCR', '2022-05-05 19:19:56');
INSERT INTO `uuid` VALUES (73, '076c5dca-9a2f-448e-a085-53ad00cce2da', 'QTYf', '2022-05-05 22:11:06');
INSERT INTO `uuid` VALUES (74, '62279437-40e9-457e-8465-ab0d26df2f03', '8jHv', '2022-05-06 22:20:21');
INSERT INTO `uuid` VALUES (75, 'c7a9003f-cc05-4472-8425-d7e5b196882e', 'gzsD', '2022-05-06 22:20:21');
INSERT INTO `uuid` VALUES (76, '1ab9e6e1-d157-4c01-9318-4712471a4175', 'NrmT', '2022-05-06 23:06:22');

SET FOREIGN_KEY_CHECKS = 1;
