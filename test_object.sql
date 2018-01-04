/*
 Navicat Premium Data Transfer

 Source Server         : Michael
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : test_object

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 04/01/2018 09:11:25
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for lamp_admin
-- ----------------------------
DROP TABLE IF EXISTS `lamp_admin`;
CREATE TABLE `lamp_admin`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '性别：0-女1-男2-保密',
  `userpass` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_admin
-- ----------------------------
INSERT INTO `lamp_admin` VALUES (1, 'admin', '超级管理员', '1', '7fef6171469e80d32c0559f88b377245');
INSERT INTO `lamp_admin` VALUES (2, 'michael', '管理员', '1', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `lamp_admin` VALUES (3, 'lisi', '李四', '0', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `lamp_admin` VALUES (13, 'dsa', 'da', '1', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `lamp_admin` VALUES (16, 'sada', 'dsadsada', '0', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for lamp_category
-- ----------------------------
DROP TABLE IF EXISTS `lamp_category`;
CREATE TABLE `lamp_category`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `pid` int(10) UNSIGNED NOT NULL,
  `path` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sort` int(10) UNSIGNED NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 40 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_category
-- ----------------------------
INSERT INTO `lamp_category` VALUES (3, '音响', 0, '0,', 0);
INSERT INTO `lamp_category` VALUES (14, '箱包', 0, '0,', 0);
INSERT INTO `lamp_category` VALUES (15, '鞋靴', 0, '0,', 0);
INSERT INTO `lamp_category` VALUES (22, '小说', 13, '0,13,', 0);
INSERT INTO `lamp_category` VALUES (24, '杂志', 13, '0,13,', 0);
INSERT INTO `lamp_category` VALUES (25, '服装', 0, '0,', 0);
INSERT INTO `lamp_category` VALUES (26, '图书', 0, '0,', 0);
INSERT INTO `lamp_category` VALUES (28, '男装', 25, '0,25,', 0);
INSERT INTO `lamp_category` VALUES (29, '女装', 25, '0,25,', 0);
INSERT INTO `lamp_category` VALUES (30, '上衣', 28, '0,25,28,', 0);
INSERT INTO `lamp_category` VALUES (31, '下装', 28, '0,25,28,', 0);
INSERT INTO `lamp_category` VALUES (32, '小短裙', 29, '0,25,29,', 0);
INSERT INTO `lamp_category` VALUES (33, '搭短裙', 29, '0,25,29,', 0);
INSERT INTO `lamp_category` VALUES (34, '小说', 26, '0,26,', 0);
INSERT INTO `lamp_category` VALUES (35, '杂志', 26, '0,26,', 0);
INSERT INTO `lamp_category` VALUES (36, '言情', 34, '0,26,34,', 0);
INSERT INTO `lamp_category` VALUES (37, '历史', 34, '0,26,34,', 0);
INSERT INTO `lamp_category` VALUES (38, '故事会', 35, '0,26,35,', 0);
INSERT INTO `lamp_category` VALUES (39, 'sda', 0, '0,', 0);

-- ----------------------------
-- Table structure for lamp_node
-- ----------------------------
DROP TABLE IF EXISTS `lamp_node`;
CREATE TABLE `lamp_node`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `mname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `aname` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) NULL DEFAULT 0,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `name`(`name`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 20 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_node
-- ----------------------------
INSERT INTO `lamp_node` VALUES (1, '浏览用户', 'user', 'index', 1);
INSERT INTO `lamp_node` VALUES (2, '添加用户', 'user', 'add', 1);
INSERT INTO `lamp_node` VALUES (3, '删除用户', 'user', 'delete', 1);
INSERT INTO `lamp_node` VALUES (4, '修改用户', 'user', 'edit', 1);
INSERT INTO `lamp_node` VALUES (5, '浏览角色', 'role', 'index', 1);
INSERT INTO `lamp_node` VALUES (6, '添加角色', 'role', 'add', 1);
INSERT INTO `lamp_node` VALUES (7, '删除角色', 'role', 'delete', 1);
INSERT INTO `lamp_node` VALUES (8, '编辑角色', 'role', 'edit', 1);
INSERT INTO `lamp_node` VALUES (9, '浏览节点', 'node', 'index', 1);
INSERT INTO `lamp_node` VALUES (10, '添加节点', 'node', 'add', 1);
INSERT INTO `lamp_node` VALUES (11, '删除节点', 'node', 'delete', 1);
INSERT INTO `lamp_node` VALUES (12, '修改节点', 'node', 'edit', 1);
INSERT INTO `lamp_node` VALUES (13, '浏览用户分配角色', 'user', 'rolelist', 1);
INSERT INTO `lamp_node` VALUES (14, '更改用户分配角色', 'user', 'saverole', 1);
INSERT INTO `lamp_node` VALUES (15, '浏览角色的操作权限', 'role', 'nodelist', 1);
INSERT INTO `lamp_node` VALUES (16, '修改角色中操作权限', 'role', 'savenode', 1);
INSERT INTO `lamp_node` VALUES (19, '浏览用户分配角色', 'user', 'rolelist', 1);

-- ----------------------------
-- Table structure for lamp_role
-- ----------------------------
DROP TABLE IF EXISTS `lamp_role`;
CREATE TABLE `lamp_role`  (
  `id` smallint(6) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(20) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `status` tinyint(1) UNSIGNED NULL DEFAULT NULL,
  `remark` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `status`(`status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_role
-- ----------------------------
INSERT INTO `lamp_role` VALUES (2, '项目经理', 1, '负责所有项目');
INSERT INTO `lamp_role` VALUES (3, '部门主任', 1, '负责当期部门管理');
INSERT INTO `lamp_role` VALUES (4, '普通员工', 1, '无');
INSERT INTO `lamp_role` VALUES (7, '临时工', 1, '公司员工');
INSERT INTO `lamp_role` VALUES (9, '学员', 1, '为了工作而学习的人员');

-- ----------------------------
-- Table structure for lamp_role_node
-- ----------------------------
DROP TABLE IF EXISTS `lamp_role_node`;
CREATE TABLE `lamp_role_node`  (
  `rid` smallint(6) UNSIGNED NOT NULL,
  `nid` smallint(6) UNSIGNED NOT NULL,
  INDEX `groupId`(`rid`) USING BTREE,
  INDEX `nodeId`(`nid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_role_node
-- ----------------------------
INSERT INTO `lamp_role_node` VALUES (4, 5);
INSERT INTO `lamp_role_node` VALUES (3, 7);
INSERT INTO `lamp_role_node` VALUES (4, 4);
INSERT INTO `lamp_role_node` VALUES (4, 2);
INSERT INTO `lamp_role_node` VALUES (4, 1);
INSERT INTO `lamp_role_node` VALUES (3, 2);
INSERT INTO `lamp_role_node` VALUES (3, 13);
INSERT INTO `lamp_role_node` VALUES (3, 15);
INSERT INTO `lamp_role_node` VALUES (4, 9);
INSERT INTO `lamp_role_node` VALUES (7, 13);
INSERT INTO `lamp_role_node` VALUES (7, 1);
INSERT INTO `lamp_role_node` VALUES (7, 15);
INSERT INTO `lamp_role_node` VALUES (2, 1);
INSERT INTO `lamp_role_node` VALUES (2, 2);
INSERT INTO `lamp_role_node` VALUES (2, 3);
INSERT INTO `lamp_role_node` VALUES (2, 4);
INSERT INTO `lamp_role_node` VALUES (2, 5);
INSERT INTO `lamp_role_node` VALUES (2, 6);
INSERT INTO `lamp_role_node` VALUES (2, 8);
INSERT INTO `lamp_role_node` VALUES (2, 9);
INSERT INTO `lamp_role_node` VALUES (2, 12);
INSERT INTO `lamp_role_node` VALUES (2, 13);
INSERT INTO `lamp_role_node` VALUES (2, 14);
INSERT INTO `lamp_role_node` VALUES (2, 15);
INSERT INTO `lamp_role_node` VALUES (2, 16);

-- ----------------------------
-- Table structure for lamp_user
-- ----------------------------
DROP TABLE IF EXISTS `lamp_user`;
CREATE TABLE `lamp_user`  (
  `id` int(5) UNSIGNED NOT NULL AUTO_INCREMENT,
  `username` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  `sex` enum('0','1','2') CHARACTER SET utf8 COLLATE utf8_unicode_ci NULL DEFAULT '0' COMMENT '性别：0-女1-男2-保密',
  `userpass` char(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `username`(`username`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_user
-- ----------------------------
INSERT INTO `lamp_user` VALUES (1, 'admin', '管理员', '0', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `lamp_user` VALUES (2, 'zhangsan', '张三', '1', 'e10adc3949ba59abbe56e057f20f883e');
INSERT INTO `lamp_user` VALUES (3, 'lisi', '李四', '2', 'e10adc3949ba59abbe56e057f20f883e');

-- ----------------------------
-- Table structure for lamp_user_role
-- ----------------------------
DROP TABLE IF EXISTS `lamp_user_role`;
CREATE TABLE `lamp_user_role`  (
  `rid` mediumint(9) UNSIGNED NULL DEFAULT NULL,
  `uid` int(6) UNSIGNED NOT NULL,
  INDEX `group_id`(`rid`) USING BTREE,
  INDEX `user_id`(`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8 COLLATE = utf8_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of lamp_user_role
-- ----------------------------
INSERT INTO `lamp_user_role` VALUES (3, 5);
INSERT INTO `lamp_user_role` VALUES (2, 1);
INSERT INTO `lamp_user_role` VALUES (4, 4);
INSERT INTO `lamp_user_role` VALUES (3, 1);
INSERT INTO `lamp_user_role` VALUES (7, 5);
INSERT INTO `lamp_user_role` VALUES (7, 2);
INSERT INTO `lamp_user_role` VALUES (4, 3);
INSERT INTO `lamp_user_role` VALUES (7, 3);

SET FOREIGN_KEY_CHECKS = 1;
