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

 Date: 06/03/2022 22:50:09
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
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of depts
-- ----------------------------
INSERT INTO `depts` VALUES (2, 7, 1, '财务部', 3, 1, 'admin', 'admin', '2019-03-25 09:15:32.000', '2020-08-02 14:48:47.000');
INSERT INTO `depts` VALUES (5, 7, 0, '人力资源部', 4, 1, 'admin', 'admin', '2019-03-25 09:20:44.000', '2020-05-17 14:27:27.000');
INSERT INTO `depts` VALUES (6, 8, 0, '院务工作部', 6, 1, 'admin', 'admin', '2019-03-25 09:52:18.000', '2020-06-08 11:59:21.000');
INSERT INTO `depts` VALUES (7, NULL, 2, '华南分部', 0, 1, 'admin', 'admin', '2019-03-25 11:04:50.000', '2020-06-08 12:08:56.000');
INSERT INTO `depts` VALUES (8, NULL, 2, '华北分部', 1, 1, 'admin', 'admin', '2019-03-25 11:04:53.000', '2020-05-14 12:54:00.000');
INSERT INTO `depts` VALUES (15, 8, 0, 'UI部门', 7, 1, 'admin', 'admin', '2020-05-13 22:56:53.000', '2020-05-14 12:54:13.000');

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
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dict
-- ----------------------------
INSERT INTO `dict` VALUES (1, 'user_status', '用户状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict` VALUES (4, 'dept_status', '部门状态', NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict` VALUES (5, 'job_status', '岗位状态', NULL, NULL, '2019-10-27 20:31:36', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '数据字典详情' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of dict_detail
-- ----------------------------
INSERT INTO `dict_detail` VALUES (1, 1, '激活', 'true', 1, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict_detail` VALUES (2, 1, '禁用', 'false', 2, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (3, 4, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (4, 4, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);
INSERT INTO `dict_detail` VALUES (5, 5, '启用', 'true', 1, NULL, NULL, NULL, NULL);
INSERT INTO `dict_detail` VALUES (6, 5, '停用', 'false', 2, NULL, NULL, '2019-10-27 20:31:36', NULL);

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
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '角色表' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of roles
-- ----------------------------
INSERT INTO `roles` VALUES (1, '超级管理员', 1, '-', '全部', NULL, 'admin', '2018-11-23 11:04:37', '2020-08-06 16:10:24', 'admin');
INSERT INTO `roles` VALUES (2, '普通用户', 2, '-', '本级', NULL, 'admin', '2018-11-23 13:09:06', '2020-09-05 10:45:12', 'normal');
INSERT INTO `roles` VALUES (3, '新闻管理', 3, '新闻管理', '自定义', '10530', '10530', '2018-11-23 13:09:06', '2022-03-06 16:45:45', 'newsEdit');

-- ----------------------------
-- Table structure for roles_menus
-- ----------------------------
DROP TABLE IF EXISTS `roles_menus`;
CREATE TABLE `roles_menus`  (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `role_id` bigint(20) NULL DEFAULT NULL,
  `menu_id` bigint(20) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 497 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
INSERT INTO `roles_menus` VALUES (445, 2, 1);
INSERT INTO `roles_menus` VALUES (446, 2, 6);
INSERT INTO `roles_menus` VALUES (447, 2, 7);
INSERT INTO `roles_menus` VALUES (448, 2, 9);
INSERT INTO `roles_menus` VALUES (449, 2, 10);
INSERT INTO `roles_menus` VALUES (450, 2, 11);
INSERT INTO `roles_menus` VALUES (451, 2, 14);
INSERT INTO `roles_menus` VALUES (452, 2, 15);
INSERT INTO `roles_menus` VALUES (453, 2, 19);
INSERT INTO `roles_menus` VALUES (454, 2, 21);
INSERT INTO `roles_menus` VALUES (455, 2, 22);
INSERT INTO `roles_menus` VALUES (456, 2, 23);
INSERT INTO `roles_menus` VALUES (457, 2, 24);
INSERT INTO `roles_menus` VALUES (458, 2, 27);
INSERT INTO `roles_menus` VALUES (459, 2, 30);
INSERT INTO `roles_menus` VALUES (460, 2, 32);
INSERT INTO `roles_menus` VALUES (461, 2, 33);
INSERT INTO `roles_menus` VALUES (462, 2, 34);
INSERT INTO `roles_menus` VALUES (463, 2, 36);
INSERT INTO `roles_menus` VALUES (464, 2, 80);
INSERT INTO `roles_menus` VALUES (465, 2, 82);
INSERT INTO `roles_menus` VALUES (466, 2, 83);
INSERT INTO `roles_menus` VALUES (467, 2, 116);
INSERT INTO `roles_menus` VALUES (468, 2, 1);
INSERT INTO `roles_menus` VALUES (469, 2, 6);
INSERT INTO `roles_menus` VALUES (470, 2, 7);
INSERT INTO `roles_menus` VALUES (471, 2, 9);
INSERT INTO `roles_menus` VALUES (472, 2, 10);
INSERT INTO `roles_menus` VALUES (473, 2, 11);
INSERT INTO `roles_menus` VALUES (474, 2, 14);
INSERT INTO `roles_menus` VALUES (475, 2, 15);
INSERT INTO `roles_menus` VALUES (476, 2, 19);
INSERT INTO `roles_menus` VALUES (477, 2, 21);
INSERT INTO `roles_menus` VALUES (478, 2, 22);
INSERT INTO `roles_menus` VALUES (479, 2, 23);
INSERT INTO `roles_menus` VALUES (480, 2, 24);
INSERT INTO `roles_menus` VALUES (481, 2, 27);
INSERT INTO `roles_menus` VALUES (482, 2, 30);
INSERT INTO `roles_menus` VALUES (483, 2, 32);
INSERT INTO `roles_menus` VALUES (484, 2, 33);
INSERT INTO `roles_menus` VALUES (485, 2, 34);
INSERT INTO `roles_menus` VALUES (486, 2, 36);
INSERT INTO `roles_menus` VALUES (487, 2, 80);
INSERT INTO `roles_menus` VALUES (488, 2, 82);
INSERT INTO `roles_menus` VALUES (489, 2, 83);
INSERT INTO `roles_menus` VALUES (490, 2, 116);
INSERT INTO `roles_menus` VALUES (491, 2, 64);
INSERT INTO `roles_menus` VALUES (492, 2, 65);
INSERT INTO `roles_menus` VALUES (493, 2, 66);
INSERT INTO `roles_menus` VALUES (494, 2, 39);
INSERT INTO `roles_menus` VALUES (495, 3, 83);
INSERT INTO `roles_menus` VALUES (496, 3, 10);

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
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci COMMENT = '系统用户' ROW_FORMAT = COMPACT;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, '财务部', 2, '10530', '男', '18999998888', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$DUWtP6zaRbQaOtcI1QRzrOzfHJ/npNqOGsnLzo.kgpyEw.3nhh9Uy', 1, 1, 'admin', 'admin', '2022-01-30 20:32:58', '2022-01-30 20:32:58', '2022-03-04 16:52:50');
INSERT INTO `users` VALUES (2, '财务部', 2, '10531', '男', '18999998888', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$7H805QbW0ZPr8OSnvuP11.69idunc3oRoOU1QBusz/oQHltE0iPoS', 0, 1, 'admin', 'admin', '2022-03-03 15:17:45', '2022-03-03 15:17:45', '2022-03-04 16:40:16');
INSERT INTO `users` VALUES (11, '院务工作部', 6, '10533', '男', '18999998888', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$7biIcHDCjruH6b6/5VfyIONN8wM6EDuOKwG136OPx5Z7FfcGXMF9m', 0, 1, 'admin', 'admin', '2022-03-03 17:39:23', '2022-03-03 17:39:23', '2022-03-04 16:52:33');
INSERT INTO `users` VALUES (13, '财务部', 2, '10536', '男', '15263986398', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$r7OgWRygJ/pcdFpLTPtP6OYO4GfHj5Hv5hKXbQGFl3Iy9JqKwWwrq', 0, 1, 'admin', 'admin', '2022-03-05 13:15:30', '2022-03-05 13:15:30', '2022-03-05 16:11:29');
INSERT INTO `users` VALUES (15, '财务部', 2, '10541', '男', '15896325896', '用户头像', 'http://localhost:8000/images/avatar/default.png', '$2a$10$ILKQ5oaPk8qw37uUGdkQeeHfPE1lYStpqxZmStzYmw3NClgM6vlZC', 0, 1, 'admin', 'admin', '2022-03-05 13:34:46', '2022-03-05 13:34:46', '2022-03-05 13:34:46');

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
) ENGINE = InnoDB AUTO_INCREMENT = 24 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

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
) ENGINE = InnoDB AUTO_INCREMENT = 44 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of uuid
-- ----------------------------
INSERT INTO `uuid` VALUES (28, '8274d2c4-db23-4f3f-820f-81e8042319f1', 'nTph', '2022-03-03 14:55:27');
INSERT INTO `uuid` VALUES (29, '3f48a7c6-73a7-416e-82d2-dd9dd894206a', '7apT', '2022-03-03 21:35:26');
INSERT INTO `uuid` VALUES (30, '3f45164b-75b0-469b-90c6-f3558dbdda86', 'aFPx', '2022-03-03 21:35:26');
INSERT INTO `uuid` VALUES (31, 'e7674301-0ab0-4dcd-81c8-3d76fc88cad5', 'Ckba', '2022-03-04 08:27:26');
INSERT INTO `uuid` VALUES (32, '62f5bad5-b5af-4661-a20b-5570b38d336f', 'gGqp', '2022-03-04 21:20:10');
INSERT INTO `uuid` VALUES (33, 'd6926c35-66e6-4e9d-b2f6-b980d916197d', 'ensM', '2022-03-05 11:54:20');
INSERT INTO `uuid` VALUES (34, 'b637f9f4-0955-4577-825d-7b04e7196f88', 'wrrc', '2022-03-05 11:54:20');
INSERT INTO `uuid` VALUES (35, '23ffa2fe-71c7-433b-aabc-fc4dbd4396ea', 'bcCB', '2022-03-05 11:54:20');
INSERT INTO `uuid` VALUES (36, '31ce8517-5250-4150-a431-dc674d0f18ff', '35tX', '2022-03-05 11:58:32');
INSERT INTO `uuid` VALUES (37, 'f7e51ebb-9ee1-43b1-b4eb-ef162eb8c599', 'vqxm', '2022-03-05 12:00:30');
INSERT INTO `uuid` VALUES (38, 'e6b85615-6fb1-4305-b2b3-e180cb49fa2d', 'Es5m', '2022-03-05 12:28:06');
INSERT INTO `uuid` VALUES (39, '7d3e970b-ec08-48f9-a8f8-aca1d2e6d869', '8U4Z', '2022-03-05 14:11:04');
INSERT INTO `uuid` VALUES (40, 'b3fb86bd-895e-4627-8ac0-ee664ef6e196', 'zDxn', '2022-03-05 16:00:31');
INSERT INTO `uuid` VALUES (41, 'd40bfd51-6c2a-46bb-aba4-3541260ca119', '4GEz', '2022-03-05 16:06:30');
INSERT INTO `uuid` VALUES (42, 'fb7d1b82-1cc4-449e-8184-29bfdda64067', 'GjQH', '2022-03-05 16:36:21');
INSERT INTO `uuid` VALUES (43, '54e287fa-22aa-4246-a4d8-4b137bb3be5c', 'ew4G', '2022-03-05 16:36:21');

SET FOREIGN_KEY_CHECKS = 1;
