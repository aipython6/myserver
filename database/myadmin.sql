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

 Date: 28/02/2022 21:41:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for depts
-- ----------------------------
DROP TABLE IF EXISTS `depts`;
CREATE TABLE `depts`  (
  `dept_id` int(255) NULL DEFAULT NULL,
  `pid` int(255) NULL DEFAULT NULL,
  `sub_count` int(255) NULL DEFAULT NULL,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `dept_sort` int(255) NULL DEFAULT NULL,
  `enabled` int(255) NULL DEFAULT NULL,
  `create_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_by` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `create_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `update_time` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of depts
-- ----------------------------
INSERT INTO `depts` VALUES (2, 7, 1, '财务部', 3, 1, 'admin', 'admin', '2019-03-25 09:15:32.000', '2020-08-02 14:48:47.000');
INSERT INTO `depts` VALUES (5, 7, 0, '运维部', 4, 1, 'admin', 'admin', '2019-03-25 09:20:44.000', '2020-05-17 14:27:27.000');
INSERT INTO `depts` VALUES (6, 8, 0, '测试部', 6, 1, 'admin', 'admin', '2019-03-25 09:52:18.000', '2020-06-08 11:59:21.000');
INSERT INTO `depts` VALUES (7, NULL, 2, '华南分部', 0, 1, 'admin', 'admin', '2019-03-25 11:04:50.000', '2020-06-08 12:08:56.000');
INSERT INTO `depts` VALUES (8, NULL, 2, '华北分部', 1, 1, 'admin', 'admin', '2019-03-25 11:04:53.000', '2020-05-14 12:54:00.000');
INSERT INTO `depts` VALUES (15, 8, 0, 'UI部门', 7, 1, 'admin', 'admin', '2020-05-13 22:56:53.000', '2020-05-14 12:54:13.000');

-- ----------------------------
-- Table structure for jobs
-- ----------------------------
DROP TABLE IF EXISTS `jobs`;
CREATE TABLE `jobs`  (
  `job_id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT '岗位名称',
  `enabled` bit(1) NOT NULL COMMENT '岗位状态',
  `job_sort` int(5) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '创建者',
  `update_by` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL COMMENT '更新者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建日期',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`job_id`) USING BTREE,
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_enabled`(`enabled`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '岗位' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of jobs
-- ----------------------------
INSERT INTO `jobs` VALUES (8, '人事专员', b'1', 3, NULL, NULL, '2019-03-29 14:52:28', NULL);
INSERT INTO `jobs` VALUES (10, '产品经理', b'1', 4, NULL, NULL, '2019-03-29 14:55:51', NULL);
INSERT INTO `jobs` VALUES (11, '全栈开发', b'1', 2, NULL, 'admin', '2019-03-31 13:39:30', '2020-05-05 11:33:43');
INSERT INTO `jobs` VALUES (12, '软件测试', b'1', 5, NULL, 'admin', '2019-03-31 13:39:43', '2020-05-10 19:56:26');

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
  UNIQUE INDEX `uniq_name`(`name`) USING BTREE,
  INDEX `inx_pid`(`pid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统菜单' ROW_FORMAT = COMPACT;

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
INSERT INTO `menus` VALUES (102, 97, 0, 2, '删除', NULL, '', 999, '', '', NULL, 0, 0, 0, 'deployHistory:del', NULL, NULL, '2019-11-17 09:32:48', NULL);
INSERT INTO `menus` VALUES (103, 92, 0, 2, '服务器新增', NULL, '', 999, '', '', NULL, 0, 0, 0, 'serverDeploy:add', NULL, NULL, '2019-11-17 11:08:33', NULL);
INSERT INTO `menus` VALUES (104, 92, 0, 2, '服务器编辑', NULL, '', 999, '', '', NULL, 0, 0, 0, 'serverDeploy:edit', NULL, NULL, '2019-11-17 11:08:57', NULL);
INSERT INTO `menus` VALUES (105, 92, 0, 2, '服务器删除', NULL, '', 999, '', '', NULL, 0, 0, 0, 'serverDeploy:del', NULL, NULL, '2019-11-17 11:09:15', NULL);
INSERT INTO `menus` VALUES (106, 93, 0, 2, '应用新增', NULL, '', 999, '', '', NULL, 0, 0, 0, 'app:add', NULL, NULL, '2019-11-17 11:10:03', NULL);
INSERT INTO `menus` VALUES (107, 93, 0, 2, '应用编辑', NULL, '', 999, '', '', NULL, 0, 0, 0, 'app:edit', NULL, NULL, '2019-11-17 11:10:28', NULL);
INSERT INTO `menus` VALUES (108, 93, 0, 2, '应用删除', NULL, '', 999, '', '', NULL, 0, 0, 0, 'app:del', NULL, NULL, '2019-11-17 11:10:55', NULL);
INSERT INTO `menus` VALUES (109, 94, 0, 2, '部署新增', NULL, '', 999, '', '', NULL, 0, 0, 0, 'deploy:add', NULL, NULL, '2019-11-17 11:11:22', NULL);
INSERT INTO `menus` VALUES (110, 94, 0, 2, '部署编辑', NULL, '', 999, '', '', NULL, 0, 0, 0, 'deploy:edit', NULL, NULL, '2019-11-17 11:11:41', NULL);
INSERT INTO `menus` VALUES (111, 94, 0, 2, '部署删除', NULL, '', 999, '', '', NULL, 0, 0, 0, 'deploy:del', NULL, NULL, '2019-11-17 11:12:01', NULL);
INSERT INTO `menus` VALUES (112, 98, 0, 2, '数据库新增', NULL, '', 999, '', '', NULL, 0, 0, 0, 'database:add', NULL, NULL, '2019-11-17 11:12:43', NULL);
INSERT INTO `menus` VALUES (113, 98, 0, 2, '数据库编辑', NULL, '', 999, '', '', NULL, 0, 0, 0, 'database:edit', NULL, NULL, '2019-11-17 11:12:58', NULL);
INSERT INTO `menus` VALUES (114, 98, 0, 2, '数据库删除', NULL, '', 999, '', '', NULL, 0, 0, 0, 'database:del', NULL, NULL, '2019-11-17 11:13:14', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24', 'admin');
INSERT INTO `roles` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12', 'normal');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of roles_menus
-- ----------------------------
INSERT INTO `roles_menus` VALUES (1, 1, 1);
INSERT INTO `roles_menus` VALUES (2, 1, 2);
INSERT INTO `roles_menus` VALUES (3, 1, 3);
INSERT INTO `roles_menus` VALUES (4, 1, 5);
INSERT INTO `roles_menus` VALUES (5, 1, 6);
INSERT INTO `roles_menus` VALUES (6, 1, 7);
INSERT INTO `roles_menus` VALUES (7, 1, 9);
INSERT INTO `roles_menus` VALUES (8, 1, 10);
INSERT INTO `roles_menus` VALUES (9, 1, 11);
INSERT INTO `roles_menus` VALUES (10, 1, 14);
INSERT INTO `roles_menus` VALUES (11, 1, 15);
INSERT INTO `roles_menus` VALUES (12, 1, 18);
INSERT INTO `roles_menus` VALUES (13, 1, 19);
INSERT INTO `roles_menus` VALUES (14, 1, 21);
INSERT INTO `roles_menus` VALUES (15, 1, 22);
INSERT INTO `roles_menus` VALUES (16, 1, 23);
INSERT INTO `roles_menus` VALUES (17, 1, 24);
INSERT INTO `roles_menus` VALUES (18, 1, 27);
INSERT INTO `roles_menus` VALUES (19, 1, 28);
INSERT INTO `roles_menus` VALUES (20, 1, 30);
INSERT INTO `roles_menus` VALUES (21, 1, 32);
INSERT INTO `roles_menus` VALUES (22, 1, 33);
INSERT INTO `roles_menus` VALUES (23, 1, 34);
INSERT INTO `roles_menus` VALUES (24, 1, 35);
INSERT INTO `roles_menus` VALUES (25, 1, 36);
INSERT INTO `roles_menus` VALUES (26, 1, 37);
INSERT INTO `roles_menus` VALUES (27, 1, 38);
INSERT INTO `roles_menus` VALUES (28, 1, 39);
INSERT INTO `roles_menus` VALUES (29, 1, 41);
INSERT INTO `roles_menus` VALUES (30, 1, 44);
INSERT INTO `roles_menus` VALUES (31, 1, 45);
INSERT INTO `roles_menus` VALUES (32, 1, 46);
INSERT INTO `roles_menus` VALUES (33, 1, 48);
INSERT INTO `roles_menus` VALUES (34, 1, 49);
INSERT INTO `roles_menus` VALUES (35, 1, 50);
INSERT INTO `roles_menus` VALUES (36, 1, 52);
INSERT INTO `roles_menus` VALUES (37, 1, 53);
INSERT INTO `roles_menus` VALUES (38, 1, 54);
INSERT INTO `roles_menus` VALUES (39, 1, 56);
INSERT INTO `roles_menus` VALUES (40, 1, 57);
INSERT INTO `roles_menus` VALUES (41, 1, 58);
INSERT INTO `roles_menus` VALUES (42, 1, 60);
INSERT INTO `roles_menus` VALUES (43, 1, 61);
INSERT INTO `roles_menus` VALUES (44, 1, 62);
INSERT INTO `roles_menus` VALUES (45, 1, 64);
INSERT INTO `roles_menus` VALUES (46, 1, 65);
INSERT INTO `roles_menus` VALUES (47, 1, 66);
INSERT INTO `roles_menus` VALUES (48, 1, 73);
INSERT INTO `roles_menus` VALUES (49, 1, 74);
INSERT INTO `roles_menus` VALUES (50, 1, 75);
INSERT INTO `roles_menus` VALUES (51, 1, 77);
INSERT INTO `roles_menus` VALUES (52, 1, 78);
INSERT INTO `roles_menus` VALUES (53, 1, 79);
INSERT INTO `roles_menus` VALUES (54, 1, 80);
INSERT INTO `roles_menus` VALUES (55, 1, 82);
INSERT INTO `roles_menus` VALUES (56, 1, 83);
INSERT INTO `roles_menus` VALUES (57, 1, 90);
INSERT INTO `roles_menus` VALUES (58, 1, 92);
INSERT INTO `roles_menus` VALUES (59, 1, 93);
INSERT INTO `roles_menus` VALUES (60, 1, 94);
INSERT INTO `roles_menus` VALUES (61, 1, 97);
INSERT INTO `roles_menus` VALUES (62, 1, 98);
INSERT INTO `roles_menus` VALUES (63, 1, 102);
INSERT INTO `roles_menus` VALUES (64, 1, 103);
INSERT INTO `roles_menus` VALUES (65, 1, 104);
INSERT INTO `roles_menus` VALUES (66, 1, 105);
INSERT INTO `roles_menus` VALUES (67, 1, 106);
INSERT INTO `roles_menus` VALUES (68, 1, 107);
INSERT INTO `roles_menus` VALUES (69, 1, 108);
INSERT INTO `roles_menus` VALUES (70, 1, 109);
INSERT INTO `roles_menus` VALUES (71, 1, 110);
INSERT INTO `roles_menus` VALUES (72, 1, 111);
INSERT INTO `roles_menus` VALUES (73, 1, 112);
INSERT INTO `roles_menus` VALUES (74, 1, 113);
INSERT INTO `roles_menus` VALUES (75, 1, 114);
INSERT INTO `roles_menus` VALUES (76, 1, 116);
INSERT INTO `roles_menus` VALUES (77, 1, 120);
INSERT INTO `roles_menus` VALUES (78, 2, 1);
INSERT INTO `roles_menus` VALUES (79, 2, 2);
INSERT INTO `roles_menus` VALUES (80, 2, 6);
INSERT INTO `roles_menus` VALUES (81, 2, 7);
INSERT INTO `roles_menus` VALUES (82, 2, 9);
INSERT INTO `roles_menus` VALUES (83, 2, 10);
INSERT INTO `roles_menus` VALUES (84, 2, 11);
INSERT INTO `roles_menus` VALUES (85, 2, 14);
INSERT INTO `roles_menus` VALUES (86, 2, 15);
INSERT INTO `roles_menus` VALUES (87, 2, 19);
INSERT INTO `roles_menus` VALUES (88, 2, 21);
INSERT INTO `roles_menus` VALUES (89, 2, 22);
INSERT INTO `roles_menus` VALUES (90, 2, 23);
INSERT INTO `roles_menus` VALUES (91, 2, 24);
INSERT INTO `roles_menus` VALUES (92, 2, 27);
INSERT INTO `roles_menus` VALUES (93, 2, 30);
INSERT INTO `roles_menus` VALUES (94, 2, 32);
INSERT INTO `roles_menus` VALUES (95, 2, 33);
INSERT INTO `roles_menus` VALUES (96, 2, 34);
INSERT INTO `roles_menus` VALUES (97, 2, 36);
INSERT INTO `roles_menus` VALUES (98, 2, 80);
INSERT INTO `roles_menus` VALUES (99, 2, 82);
INSERT INTO `roles_menus` VALUES (100, 2, 83);
INSERT INTO `roles_menus` VALUES (101, 2, 116);

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
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '财务部', 2, '10530', '男', '18999998888', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$DUWtP6zaRbQaOtcI1QRzrOzfHJ/npNqOGsnLzo.kgpyEw.3nhh9Uy', 1, 1, 'admin', 'admin', '2022-01-30 20:32:58', '2022-01-30 20:32:58', '2022-01-30 20:32:58');

-- ----------------------------
-- Table structure for users_depts
-- ----------------------------
DROP TABLE IF EXISTS `users_depts`;
CREATE TABLE `users_depts`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `dept_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_depts
-- ----------------------------
INSERT INTO `users_depts` VALUES (1, 1, 2);

-- ----------------------------
-- Table structure for users_roles
-- ----------------------------
DROP TABLE IF EXISTS `users_roles`;
CREATE TABLE `users_roles`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) NULL DEFAULT NULL,
  `role_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of users_roles
-- ----------------------------
INSERT INTO `users_roles` VALUES (1, 1, 1);
INSERT INTO `users_roles` VALUES (2, 1, 2);

-- ----------------------------
-- Table structure for uuid
-- ----------------------------
DROP TABLE IF EXISTS `uuid`;
CREATE TABLE `uuid`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `uuid` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL,
  `code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 23 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of uuid
-- ----------------------------
INSERT INTO `uuid` VALUES (1, '349df446-b131-4db1-b357-5ce0d362744a', '4sgsVN');
INSERT INTO `uuid` VALUES (2, '2a0adc7a-2ee0-4d96-8168-ece807973c76', 'xJnS');
INSERT INTO `uuid` VALUES (3, '984919ca-9ae3-4003-a55e-2a035271821e', 'kmpY');
INSERT INTO `uuid` VALUES (4, '7a07b48e-2676-4d9d-982a-1abdc5acb7d6', 'HqJR');
INSERT INTO `uuid` VALUES (5, 'e4d8cfb0-4d29-464d-9a7d-e767e3e8df6e', 'ruZz');
INSERT INTO `uuid` VALUES (6, 'b6fc5ab9-28a7-4ad7-adea-86274c81a70b', 'xxky');
INSERT INTO `uuid` VALUES (7, 'fb44204b-11b1-4917-83b7-a7a3f288b76a', 't2G3');
INSERT INTO `uuid` VALUES (8, 'dd83cb88-54e9-41a2-ae94-e79274352131', 'QKMW');
INSERT INTO `uuid` VALUES (9, '53eb8d66-5d24-4094-987a-43216535f1d1', 'n5sN');
INSERT INTO `uuid` VALUES (10, '50c610e7-c582-4cf7-a1b4-d165ce973def', 'bZJ9');
INSERT INTO `uuid` VALUES (11, '8bb752e1-6833-4a14-949c-ea418d9b6752', 'DaCH');
INSERT INTO `uuid` VALUES (12, '8401db3f-b73e-4529-aad5-874e53862d76', 'YPP2');
INSERT INTO `uuid` VALUES (13, '4b31ddd6-d989-4f62-a7c8-91ddf6d06d29', 'dKVN');
INSERT INTO `uuid` VALUES (14, '494bc56b-3462-46b2-85da-d5edc9775ccd', '7Le6');
INSERT INTO `uuid` VALUES (15, '262f6079-04cb-4995-a166-404f9dccf282', '5m7k');
INSERT INTO `uuid` VALUES (16, '6abbecbf-e641-4583-8352-0f8a861a1c26', 'eZqs');
INSERT INTO `uuid` VALUES (17, 'bc1f8def-4b75-49d3-a107-37b1061ec9a2', 'nfth');
INSERT INTO `uuid` VALUES (18, '6ad0db0b-4883-46f9-afd4-bbeaab88435c', '3UbE');
INSERT INTO `uuid` VALUES (19, 'b1995734-3746-43f3-aac9-b75301a86f62', 'TbHY');
INSERT INTO `uuid` VALUES (20, 'ef614b90-d504-4a23-9369-fe12431dba23', 'zMpr');
INSERT INTO `uuid` VALUES (21, 'a3beabe6-6778-4aea-bf94-841a4205a815', 'wEpG');
INSERT INTO `uuid` VALUES (22, 'ba1dc55d-7996-46df-93e2-09c222f86782', 'AUuu');

SET FOREIGN_KEY_CHECKS = 1;
