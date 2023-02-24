/*
 Navicat Premium Data Transfer

 Source Server         : zty
 Source Server Type    : MySQL
 Source Server Version : 80028
 Source Host           : localhost:3306
 Source Schema         : tutor

 Target Server Type    : MySQL
 Target Server Version : 80028
 File Encoding         : 65001

 Date: 24/02/2023 10:37:18
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (12, 'sys_user', '用户信息表', NULL, NULL, 'SysUser', 'crud', 'com.zty.core', 'core', 'manager', '管理员信息', 'zty', '0', '/', '{}', 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int(0) NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 125 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (106, '12', 'user_id', '用户ID', 'bigint', 'Long', 'userId', '1', '1', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 1, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (107, '12', 'dept_id', '职级ID', 'bigint', 'Long', 'deptId', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', 'sys_dept_name', 2, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (108, '12', 'user_name', '用户账号', 'varchar(30)', 'String', 'userName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 3, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (109, '12', 'nick_name', '用户昵称', 'varchar(30)', 'String', 'nickName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 4, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (110, '12', 'user_type', '用户类型（00系统用户）', 'varchar(2)', 'String', 'userType', '0', '0', NULL, '0', '0', '0', '0', 'EQ', 'select', '', 5, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (111, '12', 'email', '用户邮箱', 'varchar(50)', 'String', 'email', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 6, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (112, '12', 'phonenumber', '手机号码', 'varchar(11)', 'String', 'phonenumber', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 7, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (113, '12', 'sex', '用户性别（0男 1女 2未知）', 'char(1)', 'String', 'sex', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'select', 'sys_user_sex', 8, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (114, '12', 'avatar', '头像地址', 'varchar(100)', 'String', 'avatar', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'imageUpload', '', 9, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (115, '12', 'password', '密码', 'varchar(100)', 'String', 'password', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 10, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (116, '12', 'status', '帐号状态（0正常 1停用）', 'char(1)', 'String', 'status', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'radio', 'sys_normal_disable', 11, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (117, '12', 'del_flag', '删除标志（0代表存在 2代表删除）', 'char(1)', 'String', 'delFlag', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', 'sys_delete_status', 12, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (118, '12', 'login_ip', '最后登录IP', 'varchar(128)', 'String', 'loginIp', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'input', '', 13, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (119, '12', 'login_date', '最后登录时间', 'datetime', 'Date', 'loginDate', '0', '0', NULL, '1', '1', '1', '1', 'EQ', 'datetime', '', 14, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (120, '12', 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'input', '', 15, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (121, '12', 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', NULL, '1', NULL, NULL, NULL, 'EQ', 'datetime', '', 16, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (122, '12', 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'input', '', 17, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (123, '12', 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', NULL, '1', '1', NULL, NULL, 'EQ', 'datetime', '', 18, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');
INSERT INTO `gen_table_column` VALUES (124, '12', 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', NULL, '1', '1', '1', NULL, 'EQ', 'textarea', '', 19, 'admin', '2023-02-22 10:58:18', '', '2023-02-22 11:59:05');

-- ----------------------------
-- Table structure for qrtz_blob_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_blob_triggers`;
CREATE TABLE `qrtz_blob_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_blob_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_blob_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_calendars
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_calendars`;
CREATE TABLE `qrtz_calendars`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_calendars
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_cron_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_cron_triggers`;
CREATE TABLE `qrtz_cron_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_cron_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_cron_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_fired_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_fired_triggers`;
CREATE TABLE `qrtz_fired_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint(0) NOT NULL COMMENT '触发的时间',
  `sched_time` bigint(0) NOT NULL COMMENT '定时器制定的时间',
  `priority` int(0) NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_fired_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_job_details
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_job_details`;
CREATE TABLE `qrtz_job_details`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_job_details
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_locks
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_locks`;
CREATE TABLE `qrtz_locks`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_locks
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_paused_trigger_grps
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_paused_trigger_grps`;
CREATE TABLE `qrtz_paused_trigger_grps`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_paused_trigger_grps
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_scheduler_state
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_scheduler_state`;
CREATE TABLE `qrtz_scheduler_state`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint(0) NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint(0) NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_scheduler_state
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simple_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simple_triggers`;
CREATE TABLE `qrtz_simple_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint(0) NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint(0) NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint(0) NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simple_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simple_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_simprop_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_simprop_triggers`;
CREATE TABLE `qrtz_simprop_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int(0) NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint(0) NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `qrtz_simprop_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `qrtz_triggers` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_simprop_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for qrtz_triggers
-- ----------------------------
DROP TABLE IF EXISTS `qrtz_triggers`;
CREATE TABLE `qrtz_triggers`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint(0) NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int(0) NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint(0) NOT NULL COMMENT '开始时间',
  `end_time` bigint(0) NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint(0) NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name`, `job_name`, `job_group`) USING BTREE,
  CONSTRAINT `qrtz_triggers_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `qrtz_job_details` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of qrtz_triggers
-- ----------------------------

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-26 10:15:15', '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2022-12-23 15:41:47', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2022-12-23 15:41:47', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-26 10:44:55', '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'true', 'Y', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-26 10:44:45', '是否开启注册用户功能（true开启，false关闭）');

-- ----------------------------
-- Table structure for sys_deposit_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_deposit_detail`;
CREATE TABLE `sys_deposit_detail`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户押金操作信息表ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `amount` decimal(10, 2) NOT NULL COMMENT '操作押金金额数量',
  `balance` decimal(10, 2) NOT NULL COMMENT '押金余额',
  `action` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '操作状态（0代表存钱 1代表取钱）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 29 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户押金操作信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_deposit_detail
-- ----------------------------
INSERT INTO `sys_deposit_detail` VALUES (13, 1, 1000.00, 1000.00, '0', '2023-02-17 15:41:06');
INSERT INTO `sys_deposit_detail` VALUES (14, 2, 800.00, 800.00, '0', '2023-02-17 15:42:11');
INSERT INTO `sys_deposit_detail` VALUES (15, 1, 100.00, 1100.00, '0', '2023-02-17 16:26:15');
INSERT INTO `sys_deposit_detail` VALUES (16, 1, 500.00, 600.00, '1', '2023-02-17 16:26:44');
INSERT INTO `sys_deposit_detail` VALUES (17, 1, 200.00, 800.00, '0', '2023-02-17 16:26:56');
INSERT INTO `sys_deposit_detail` VALUES (18, 1, 200.00, 1000.00, '0', '2023-02-17 16:27:26');
INSERT INTO `sys_deposit_detail` VALUES (19, 2, 200.00, 1000.00, '0', '2023-02-17 16:29:36');
INSERT INTO `sys_deposit_detail` VALUES (23, 100, 100.00, 100.00, '0', '2023-02-17 16:44:48');
INSERT INTO `sys_deposit_detail` VALUES (24, 100, 20.00, 80.00, '1', '2023-02-17 19:04:49');
INSERT INTO `sys_deposit_detail` VALUES (25, 1, 200.00, 1200.00, '0', '2023-02-20 14:44:34');
INSERT INTO `sys_deposit_detail` VALUES (26, 100, 820.00, 900.00, '0', '2023-02-20 15:30:19');
INSERT INTO `sys_deposit_detail` VALUES (27, 112, 800.00, 800.00, '0', '2023-02-20 16:08:33');
INSERT INTO `sys_deposit_detail` VALUES (28, 111, 1000.00, 1000.00, '0', '2023-02-20 16:09:00');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '职级id',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父职级id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职级名称',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '职级状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '职级表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '小学', 0, '小张', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-23 15:41:46', '', NULL);
INSERT INTO `sys_dept` VALUES (101, 0, '0', '初中', 1, '小张', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-23 15:41:46', '', NULL);
INSERT INTO `sys_dept` VALUES (102, 0, '0', '高中', 2, '小张', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2022-12-23 15:41:46', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int(0) NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-28 19:36:30', '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', 'success', 'N', '0', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-28 19:36:45', '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', 'info', 'N', '0', 'admin', '2022-12-23 15:41:47', 'admin', '2022-12-28 19:36:58', '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认演示', 'DEFAULT', 'sys_job_group', '', 'info', 'Y', '0', 'admin', '2022-12-23 15:41:47', 'admin', '2023-02-23 17:49:10', '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统自定义', 'SYSTEM', 'sys_job_group', '', 'info', 'N', '0', 'admin', '2022-12-23 15:41:47', 'admin', '2023-02-23 17:49:31', '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 0, '老师上门', '0', 'sys_teach_way', '', 'primary', 'N', '0', 'admin', '2022-12-25 16:42:41', 'admin', '2022-12-25 16:43:32', '老师上门字典');
INSERT INTO `sys_dict_data` VALUES (101, 1, '学生上门', '1', 'sys_teach_way', NULL, 'primary', 'N', '0', 'admin', '2022-12-25 16:44:00', '', NULL, '学生上门字典');
INSERT INTO `sys_dict_data` VALUES (102, 2, '线上辅导', '2', 'sys_teach_way', NULL, 'primary', 'N', '0', 'admin', '2022-12-25 16:44:31', '', NULL, '线上辅导字典');
INSERT INTO `sys_dict_data` VALUES (103, 0, '未认证', '0', 'sys_auth_status', NULL, 'danger', 'N', '0', 'admin', '2022-12-25 16:46:42', '', NULL, '未认证字典');
INSERT INTO `sys_dict_data` VALUES (104, 1, '已认证', '1', 'sys_auth_status', NULL, 'success', 'N', '0', 'admin', '2022-12-25 16:47:04', 'admin', '2022-12-25 16:47:12', '已认证字典');
INSERT INTO `sys_dict_data` VALUES (105, 0, '存在', '0', 'sys_delete_status', NULL, 'success', 'N', '0', 'admin', '2022-12-25 16:54:04', '', NULL, '存在字典');
INSERT INTO `sys_dict_data` VALUES (106, 1, '删除', '2', 'sys_delete_status', NULL, 'warning', 'N', '0', 'admin', '2022-12-25 16:54:23', '', NULL, '删除字典');
INSERT INTO `sys_dict_data` VALUES (107, 0, '小学', '100', 'sys_dept_name', NULL, 'warning', 'N', '0', 'admin', '2023-01-08 11:44:31', 'admin', '2023-01-17 12:02:54', NULL);
INSERT INTO `sys_dict_data` VALUES (108, 1, '初中', '101', 'sys_dept_name', NULL, 'warning', 'N', '0', 'admin', '2023-01-08 11:44:42', 'admin', '2023-01-17 12:02:59', NULL);
INSERT INTO `sys_dict_data` VALUES (109, 2, '高中', '102', 'sys_dept_name', NULL, 'warning', 'N', '0', 'admin', '2023-01-08 11:44:53', 'admin', '2023-01-10 17:48:54', NULL);
INSERT INTO `sys_dict_data` VALUES (110, 0, '语文', '1', 'sys_post_list', NULL, 'default', 'N', '0', 'admin', '2023-01-10 11:22:54', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (111, 1, '数学', '2', 'sys_post_list', NULL, 'default', 'N', '0', 'admin', '2023-01-10 11:23:06', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (112, 2, '英语', '3', 'sys_post_list', NULL, 'default', 'N', '0', 'admin', '2023-01-10 11:23:16', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (113, 0, '面议', '0', 'sys_salary_dict', '', 'info', 'N', '0', 'admin', '2023-01-17 10:49:42', 'admin', '2023-01-17 11:30:38', NULL);
INSERT INTO `sys_dict_data` VALUES (114, 1, '50~100/h', '1', 'sys_salary_dict', NULL, 'info', 'N', '0', 'admin', '2023-01-17 10:53:20', 'admin', '2023-01-17 11:59:34', NULL);
INSERT INTO `sys_dict_data` VALUES (115, 2, '100~150/h', '2', 'sys_salary_dict', NULL, 'info', 'N', '0', 'admin', '2023-01-17 10:53:42', 'admin', '2023-01-17 11:59:42', NULL);
INSERT INTO `sys_dict_data` VALUES (116, 3, '150~200/h', '3', 'sys_salary_dict', NULL, 'info', 'N', '0', 'admin', '2023-01-17 10:54:15', 'admin', '2023-01-17 11:59:48', NULL);
INSERT INTO `sys_dict_data` VALUES (117, 4, '200+/h', '4', 'sys_salary_dict', NULL, 'info', 'N', '0', 'admin', '2023-01-17 10:54:35', 'admin', '2023-01-17 11:59:54', NULL);
INSERT INTO `sys_dict_data` VALUES (118, 1, '已读', '1', 'sys_user_leave', NULL, 'success', 'N', '0', 'admin', '2023-02-13 12:20:16', 'admin', '2023-02-13 12:20:42', NULL);
INSERT INTO `sys_dict_data` VALUES (119, 0, '未读', '0', 'sys_user_leave', NULL, 'info', 'N', '0', 'admin', '2023-02-13 12:20:32', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (120, 0, '正常', '0', 'sys_deposit_status', NULL, 'success', 'N', '0', 'admin', '2023-02-16 13:15:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (121, 0, '冻结', '1', 'sys_deposit_status', NULL, 'danger', 'N', '0', 'admin', '2023-02-16 13:15:37', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (122, 0, '存入', '0', 'deposit_action_status', NULL, 'primary', 'N', '0', 'admin', '2023-02-16 13:17:08', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (123, 0, '取出', '1', 'deposit_action_status', NULL, 'warning', 'N', '0', 'admin', '2023-02-16 13:17:20', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (126, 0, '初始', '0', 'sys_order_status', NULL, 'info', 'N', '0', 'admin', '2023-02-16 13:21:47', 'admin', '2023-02-16 13:23:30', NULL);
INSERT INTO `sys_dict_data` VALUES (127, 1, '确认', '1', 'sys_order_status', NULL, 'primary', 'N', '0', 'admin', '2023-02-16 13:22:08', 'admin', '2023-02-17 17:07:44', NULL);
INSERT INTO `sys_dict_data` VALUES (128, 2, '取消', '2', 'sys_order_status', NULL, 'warning', 'N', '0', 'admin', '2023-02-16 13:22:23', 'admin', '2023-02-17 17:07:51', NULL);
INSERT INTO `sys_dict_data` VALUES (129, 3, '完成', '3', 'sys_order_status', NULL, 'success', 'N', '0', 'admin', '2023-02-16 13:22:38', 'admin', '2023-02-17 17:07:57', NULL);
INSERT INTO `sys_dict_data` VALUES (130, 4, '维权中', '4', 'sys_order_status', NULL, 'danger', 'N', '0', 'admin', '2023-02-16 13:23:14', 'admin', '2023-02-20 19:37:19', NULL);
INSERT INTO `sys_dict_data` VALUES (131, 0, '大学生', '0', 'sys_order_start', NULL, 'primary', 'N', '0', 'admin', '2023-02-20 19:49:06', 'admin', '2023-02-21 11:06:29', NULL);
INSERT INTO `sys_dict_data` VALUES (132, 1, '家长(学员)', '1', 'sys_order_start', NULL, 'success', 'N', '0', 'admin', '2023-02-20 19:49:25', 'admin', '2023-02-21 11:06:34', NULL);
INSERT INTO `sys_dict_data` VALUES (133, 2, '管理员', '2', 'sys_order_start', NULL, 'warning', 'N', '0', 'admin', '2023-02-20 19:51:51', 'admin', '2023-02-21 11:06:40', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 112 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2022-12-23 15:41:47', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '授课方式', 'sys_teach_way', '0', 'admin', '2022-12-25 16:40:51', 'admin', '2022-12-25 16:46:02', '授课方式字典列表');
INSERT INTO `sys_dict_type` VALUES (101, '认证状态', 'sys_auth_status', '0', 'admin', '2022-12-25 16:45:45', '', NULL, '认证状态字典列表');
INSERT INTO `sys_dict_type` VALUES (102, '删除标志', 'sys_delete_status', '0', 'admin', '2022-12-25 16:53:23', '', NULL, '删除标志字典列表');
INSERT INTO `sys_dict_type` VALUES (103, '职级名称', 'sys_dept_name', '0', 'admin', '2023-01-08 11:43:59', 'admin', '2023-01-08 12:27:47', '职级名称');
INSERT INTO `sys_dict_type` VALUES (104, '岗位字典', 'sys_post_list', '0', 'admin', '2023-01-10 11:22:18', '', NULL, '岗位');
INSERT INTO `sys_dict_type` VALUES (105, '薪资字典', 'sys_salary_dict', '0', 'admin', '2023-01-17 10:49:10', '', NULL, '薪资');
INSERT INTO `sys_dict_type` VALUES (106, '留言读取状态', 'sys_user_leave', '0', 'admin', '2023-02-13 12:19:23', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (107, '押金状态', 'sys_deposit_status', '0', 'admin', '2023-02-16 13:14:28', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (108, '押金操作状态', 'deposit_action_status', '0', 'admin', '2023-02-16 13:16:33', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (110, '下单状态', 'sys_order_status', '0', 'admin', '2023-02-16 13:20:44', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (111, '订单发起方', 'sys_order_start', '0', 'admin', '2023-02-20 19:48:38', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2022-12-23 15:41:47', 'admin', '2023-02-23 17:47:40', '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2022-12-23 15:41:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2022-12-23 15:41:47', '', NULL, '');
INSERT INTO `sys_job` VALUES (100, '定时删除操作日志', 'SYSTEM', 'ryTask.periodClearOperLogs', '0 0 12 * * ?', '3', '0', '0', 'admin', '2023-02-23 18:18:53', 'admin', '2023-02-23 18:27:59', '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime(0) NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 642 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-23 15:47:32');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-24 10:44:48');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-24 10:44:52');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 10:44:57');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 15:19:36');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 16:28:24');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-24 16:47:20');
INSERT INTO `sys_logininfor` VALUES (107, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 16:47:34');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 16:48:06');
INSERT INTO `sys_logininfor` VALUES (109, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 16:48:28');
INSERT INTO `sys_logininfor` VALUES (110, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-24 16:49:55');
INSERT INTO `sys_logininfor` VALUES (111, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 16:50:06');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-24 16:56:59');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-24 17:01:33');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-24 17:01:38');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 10:09:19');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 10:11:36');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 14:37:30');
INSERT INTO `sys_logininfor` VALUES (118, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 15:16:32');
INSERT INTO `sys_logininfor` VALUES (119, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 16:24:24');
INSERT INTO `sys_logininfor` VALUES (120, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 20:06:48');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-25 20:29:21');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:10:48');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:12:55');
INSERT INTO `sys_logininfor` VALUES (124, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:13:27');
INSERT INTO `sys_logininfor` VALUES (125, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:15:38');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:15:47');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:15:51');
INSERT INTO `sys_logininfor` VALUES (128, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:16:15');
INSERT INTO `sys_logininfor` VALUES (129, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:42:12');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:42:27');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:42:36');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:43:00');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:43:13');
INSERT INTO `sys_logininfor` VALUES (134, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:43:40');
INSERT INTO `sys_logininfor` VALUES (135, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:43:44');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:45:02');
INSERT INTO `sys_logininfor` VALUES (137, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2022-12-26 10:45:23');
INSERT INTO `sys_logininfor` VALUES (138, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:45:32');
INSERT INTO `sys_logininfor` VALUES (139, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-26 10:45:32');
INSERT INTO `sys_logininfor` VALUES (140, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:45:44');
INSERT INTO `sys_logininfor` VALUES (141, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:47:20');
INSERT INTO `sys_logininfor` VALUES (142, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:47:28');
INSERT INTO `sys_logininfor` VALUES (143, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-26 10:47:28');
INSERT INTO `sys_logininfor` VALUES (144, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:47:34');
INSERT INTO `sys_logininfor` VALUES (145, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:47:40');
INSERT INTO `sys_logininfor` VALUES (146, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-26 10:48:26');
INSERT INTO `sys_logininfor` VALUES (147, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:48:26');
INSERT INTO `sys_logininfor` VALUES (148, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:48:32');
INSERT INTO `sys_logininfor` VALUES (149, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:48:35');
INSERT INTO `sys_logininfor` VALUES (150, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:48:39');
INSERT INTO `sys_logininfor` VALUES (151, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-26 10:48:39');
INSERT INTO `sys_logininfor` VALUES (152, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2022-12-26 10:48:54');
INSERT INTO `sys_logininfor` VALUES (153, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:48:54');
INSERT INTO `sys_logininfor` VALUES (154, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:49:24');
INSERT INTO `sys_logininfor` VALUES (155, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误2次', '2022-12-26 10:49:24');
INSERT INTO `sys_logininfor` VALUES (156, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:49:29');
INSERT INTO `sys_logininfor` VALUES (157, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误3次', '2022-12-26 10:50:33');
INSERT INTO `sys_logininfor` VALUES (158, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:50:33');
INSERT INTO `sys_logininfor` VALUES (159, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-26 10:52:39');
INSERT INTO `sys_logininfor` VALUES (160, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:52:45');
INSERT INTO `sys_logininfor` VALUES (161, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误4次', '2022-12-26 10:52:45');
INSERT INTO `sys_logininfor` VALUES (162, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次', '2022-12-26 10:53:54');
INSERT INTO `sys_logininfor` VALUES (163, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2022-12-26 10:53:54');
INSERT INTO `sys_logininfor` VALUES (164, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:53:57');
INSERT INTO `sys_logininfor` VALUES (165, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:54:04');
INSERT INTO `sys_logininfor` VALUES (166, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:54:04');
INSERT INTO `sys_logininfor` VALUES (167, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:54:42');
INSERT INTO `sys_logininfor` VALUES (168, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:55:28');
INSERT INTO `sys_logininfor` VALUES (169, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:55:43');
INSERT INTO `sys_logininfor` VALUES (170, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:55:51');
INSERT INTO `sys_logininfor` VALUES (171, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 10:57:31');
INSERT INTO `sys_logininfor` VALUES (172, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:58:01');
INSERT INTO `sys_logininfor` VALUES (173, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:58:01');
INSERT INTO `sys_logininfor` VALUES (174, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:58:11');
INSERT INTO `sys_logininfor` VALUES (175, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2022-12-26 10:58:11');
INSERT INTO `sys_logininfor` VALUES (176, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-26 10:59:44');
INSERT INTO `sys_logininfor` VALUES (177, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 10:59:52');
INSERT INTO `sys_logininfor` VALUES (178, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 11:01:19');
INSERT INTO `sys_logininfor` VALUES (179, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 11:01:27');
INSERT INTO `sys_logininfor` VALUES (180, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 11:01:57');
INSERT INTO `sys_logininfor` VALUES (181, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 11:02:08');
INSERT INTO `sys_logininfor` VALUES (182, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-26 11:04:40');
INSERT INTO `sys_logininfor` VALUES (183, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 11:04:55');
INSERT INTO `sys_logininfor` VALUES (184, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 15:14:10');
INSERT INTO `sys_logininfor` VALUES (185, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 16:01:07');
INSERT INTO `sys_logininfor` VALUES (186, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-26 17:15:34');
INSERT INTO `sys_logininfor` VALUES (187, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-28 10:23:02');
INSERT INTO `sys_logininfor` VALUES (188, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 10:23:06');
INSERT INTO `sys_logininfor` VALUES (189, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 11:20:41');
INSERT INTO `sys_logininfor` VALUES (190, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 15:17:06');
INSERT INTO `sys_logininfor` VALUES (191, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-28 16:57:46');
INSERT INTO `sys_logininfor` VALUES (192, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 16:57:52');
INSERT INTO `sys_logininfor` VALUES (193, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-28 17:30:16');
INSERT INTO `sys_logininfor` VALUES (194, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 17:30:20');
INSERT INTO `sys_logininfor` VALUES (195, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-28 17:31:11');
INSERT INTO `sys_logininfor` VALUES (196, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 17:31:31');
INSERT INTO `sys_logininfor` VALUES (197, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2022-12-28 17:32:56');
INSERT INTO `sys_logininfor` VALUES (198, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 17:33:02');
INSERT INTO `sys_logininfor` VALUES (199, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 17:43:14');
INSERT INTO `sys_logininfor` VALUES (200, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-28 19:34:07');
INSERT INTO `sys_logininfor` VALUES (201, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 10:16:09');
INSERT INTO `sys_logininfor` VALUES (202, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 11:12:34');
INSERT INTO `sys_logininfor` VALUES (203, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 12:13:59');
INSERT INTO `sys_logininfor` VALUES (204, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 15:18:36');
INSERT INTO `sys_logininfor` VALUES (205, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-29 16:28:32');
INSERT INTO `sys_logininfor` VALUES (206, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 16:28:36');
INSERT INTO `sys_logininfor` VALUES (207, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2022-12-29 17:26:01');
INSERT INTO `sys_logininfor` VALUES (208, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 17:26:04');
INSERT INTO `sys_logininfor` VALUES (209, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 19:25:05');
INSERT INTO `sys_logininfor` VALUES (210, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2022-12-29 19:36:20');
INSERT INTO `sys_logininfor` VALUES (211, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2022-12-29 19:36:30');
INSERT INTO `sys_logininfor` VALUES (212, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 10:39:25');
INSERT INTO `sys_logininfor` VALUES (213, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:11:14');
INSERT INTO `sys_logininfor` VALUES (214, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-08 11:25:49');
INSERT INTO `sys_logininfor` VALUES (215, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:25:57');
INSERT INTO `sys_logininfor` VALUES (216, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:26:38');
INSERT INTO `sys_logininfor` VALUES (217, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-08 11:32:04');
INSERT INTO `sys_logininfor` VALUES (218, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:32:08');
INSERT INTO `sys_logininfor` VALUES (219, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:43:28');
INSERT INTO `sys_logininfor` VALUES (220, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-08 11:48:16');
INSERT INTO `sys_logininfor` VALUES (221, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:48:19');
INSERT INTO `sys_logininfor` VALUES (222, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-01-08 11:54:29');
INSERT INTO `sys_logininfor` VALUES (223, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:54:34');
INSERT INTO `sys_logininfor` VALUES (224, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-08 11:54:52');
INSERT INTO `sys_logininfor` VALUES (225, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 11:55:00');
INSERT INTO `sys_logininfor` VALUES (226, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 12:00:23');
INSERT INTO `sys_logininfor` VALUES (227, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 12:22:18');
INSERT INTO `sys_logininfor` VALUES (228, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-08 13:45:11');
INSERT INTO `sys_logininfor` VALUES (229, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 10:55:03');
INSERT INTO `sys_logininfor` VALUES (230, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-09 11:15:19');
INSERT INTO `sys_logininfor` VALUES (231, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 11:18:10');
INSERT INTO `sys_logininfor` VALUES (232, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-09 11:21:41');
INSERT INTO `sys_logininfor` VALUES (233, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 11:22:01');
INSERT INTO `sys_logininfor` VALUES (234, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-09 11:27:13');
INSERT INTO `sys_logininfor` VALUES (235, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 12:30:02');
INSERT INTO `sys_logininfor` VALUES (236, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 14:29:44');
INSERT INTO `sys_logininfor` VALUES (237, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-09 17:34:58');
INSERT INTO `sys_logininfor` VALUES (238, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-09 17:35:06');
INSERT INTO `sys_logininfor` VALUES (239, '111', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-09 17:43:37');
INSERT INTO `sys_logininfor` VALUES (240, '111111', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-09 17:46:00');
INSERT INTO `sys_logininfor` VALUES (241, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-10 09:57:18');
INSERT INTO `sys_logininfor` VALUES (242, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 09:57:23');
INSERT INTO `sys_logininfor` VALUES (243, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-10 10:04:40');
INSERT INTO `sys_logininfor` VALUES (244, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 10:58:33');
INSERT INTO `sys_logininfor` VALUES (245, '11111', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-10 11:08:47');
INSERT INTO `sys_logininfor` VALUES (246, 'test1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-10 12:38:15');
INSERT INTO `sys_logininfor` VALUES (247, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 12:42:18');
INSERT INTO `sys_logininfor` VALUES (248, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-10 12:46:37');
INSERT INTO `sys_logininfor` VALUES (249, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-10 12:51:06');
INSERT INTO `sys_logininfor` VALUES (250, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 12:51:54');
INSERT INTO `sys_logininfor` VALUES (251, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-10 12:54:08');
INSERT INTO `sys_logininfor` VALUES (252, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 12:54:16');
INSERT INTO `sys_logininfor` VALUES (253, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-10 12:58:11');
INSERT INTO `sys_logininfor` VALUES (254, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 12:58:16');
INSERT INTO `sys_logininfor` VALUES (255, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 12:59:48');
INSERT INTO `sys_logininfor` VALUES (256, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 15:29:10');
INSERT INTO `sys_logininfor` VALUES (257, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-10 17:37:01');
INSERT INTO `sys_logininfor` VALUES (258, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 10:21:20');
INSERT INTO `sys_logininfor` VALUES (259, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 11:23:38');
INSERT INTO `sys_logininfor` VALUES (260, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 12:18:42');
INSERT INTO `sys_logininfor` VALUES (261, 's3', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-17 12:36:35');
INSERT INTO `sys_logininfor` VALUES (262, 'p3', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-01-17 12:37:38');
INSERT INTO `sys_logininfor` VALUES (263, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 12:37:46');
INSERT INTO `sys_logininfor` VALUES (264, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 12:39:32');
INSERT INTO `sys_logininfor` VALUES (265, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 12:40:50');
INSERT INTO `sys_logininfor` VALUES (266, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-17 12:42:00');
INSERT INTO `sys_logininfor` VALUES (267, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-17 12:42:21');
INSERT INTO `sys_logininfor` VALUES (268, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 11:21:30');
INSERT INTO `sys_logininfor` VALUES (269, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 12:23:47');
INSERT INTO `sys_logininfor` VALUES (270, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 16:20:22');
INSERT INTO `sys_logininfor` VALUES (271, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 17:09:59');
INSERT INTO `sys_logininfor` VALUES (272, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 17:20:55');
INSERT INTO `sys_logininfor` VALUES (273, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:21:20');
INSERT INTO `sys_logininfor` VALUES (274, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:34:34');
INSERT INTO `sys_logininfor` VALUES (275, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:34:41');
INSERT INTO `sys_logininfor` VALUES (276, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:36:06');
INSERT INTO `sys_logininfor` VALUES (277, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:36:53');
INSERT INTO `sys_logininfor` VALUES (278, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:36:56');
INSERT INTO `sys_logininfor` VALUES (279, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:39:11');
INSERT INTO `sys_logininfor` VALUES (280, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:39:14');
INSERT INTO `sys_logininfor` VALUES (281, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:40:54');
INSERT INTO `sys_logininfor` VALUES (282, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:40:58');
INSERT INTO `sys_logininfor` VALUES (283, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:41:50');
INSERT INTO `sys_logininfor` VALUES (284, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:41:54');
INSERT INTO `sys_logininfor` VALUES (285, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 18:44:24');
INSERT INTO `sys_logininfor` VALUES (286, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 18:44:27');
INSERT INTO `sys_logininfor` VALUES (287, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 19:39:01');
INSERT INTO `sys_logininfor` VALUES (288, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-01-24 20:22:22');
INSERT INTO `sys_logininfor` VALUES (289, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 20:22:25');
INSERT INTO `sys_logininfor` VALUES (290, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 20:44:12');
INSERT INTO `sys_logininfor` VALUES (291, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 21:20:00');
INSERT INTO `sys_logininfor` VALUES (292, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 21:24:53');
INSERT INTO `sys_logininfor` VALUES (293, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 21:25:47');
INSERT INTO `sys_logininfor` VALUES (294, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-24 21:26:08');
INSERT INTO `sys_logininfor` VALUES (295, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 21:26:16');
INSERT INTO `sys_logininfor` VALUES (296, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-24 21:27:20');
INSERT INTO `sys_logininfor` VALUES (297, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 09:54:47');
INSERT INTO `sys_logininfor` VALUES (298, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 10:40:39');
INSERT INTO `sys_logininfor` VALUES (299, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-25 10:52:20');
INSERT INTO `sys_logininfor` VALUES (300, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 10:52:28');
INSERT INTO `sys_logininfor` VALUES (301, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 10:55:32');
INSERT INTO `sys_logininfor` VALUES (302, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 10:55:46');
INSERT INTO `sys_logininfor` VALUES (303, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-01-25 11:02:54');
INSERT INTO `sys_logininfor` VALUES (304, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-01-25 11:03:01');
INSERT INTO `sys_logininfor` VALUES (305, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-03 19:47:32');
INSERT INTO `sys_logininfor` VALUES (306, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 19:47:37');
INSERT INTO `sys_logininfor` VALUES (307, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-03 21:05:43');
INSERT INTO `sys_logininfor` VALUES (308, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-04 10:10:28');
INSERT INTO `sys_logininfor` VALUES (309, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 10:10:32');
INSERT INTO `sys_logininfor` VALUES (310, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 10:55:04');
INSERT INTO `sys_logininfor` VALUES (311, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 12:02:28');
INSERT INTO `sys_logininfor` VALUES (312, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 12:05:12');
INSERT INTO `sys_logininfor` VALUES (313, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 12:05:20');
INSERT INTO `sys_logininfor` VALUES (314, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 15:30:33');
INSERT INTO `sys_logininfor` VALUES (315, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 15:51:53');
INSERT INTO `sys_logininfor` VALUES (316, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 15:52:03');
INSERT INTO `sys_logininfor` VALUES (317, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-04 16:07:34');
INSERT INTO `sys_logininfor` VALUES (318, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-04 16:10:45');
INSERT INTO `sys_logininfor` VALUES (319, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 16:10:48');
INSERT INTO `sys_logininfor` VALUES (320, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 16:23:38');
INSERT INTO `sys_logininfor` VALUES (321, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 16:39:02');
INSERT INTO `sys_logininfor` VALUES (322, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 16:43:19');
INSERT INTO `sys_logininfor` VALUES (323, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 16:43:26');
INSERT INTO `sys_logininfor` VALUES (324, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 16:53:22');
INSERT INTO `sys_logininfor` VALUES (325, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 17:35:24');
INSERT INTO `sys_logininfor` VALUES (326, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 18:30:55');
INSERT INTO `sys_logininfor` VALUES (327, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 19:04:23');
INSERT INTO `sys_logininfor` VALUES (328, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 20:04:18');
INSERT INTO `sys_logininfor` VALUES (329, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 20:05:49');
INSERT INTO `sys_logininfor` VALUES (330, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:07:53');
INSERT INTO `sys_logininfor` VALUES (331, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-04 21:16:58');
INSERT INTO `sys_logininfor` VALUES (332, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:17:02');
INSERT INTO `sys_logininfor` VALUES (333, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-04 21:24:05');
INSERT INTO `sys_logininfor` VALUES (334, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-04 21:24:15');
INSERT INTO `sys_logininfor` VALUES (335, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 10:19:38');
INSERT INTO `sys_logininfor` VALUES (336, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-05 10:19:43');
INSERT INTO `sys_logininfor` VALUES (337, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 10:20:00');
INSERT INTO `sys_logininfor` VALUES (338, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 15:08:34');
INSERT INTO `sys_logininfor` VALUES (339, 'test', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-05 15:09:48');
INSERT INTO `sys_logininfor` VALUES (340, 'test', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-05 15:09:51');
INSERT INTO `sys_logininfor` VALUES (341, 'test', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '登录用户：test 不存在', '2023-02-05 15:09:57');
INSERT INTO `sys_logininfor` VALUES (342, 'test1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 15:10:39');
INSERT INTO `sys_logininfor` VALUES (343, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 16:45:27');
INSERT INTO `sys_logininfor` VALUES (344, 'test1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 17:25:57');
INSERT INTO `sys_logininfor` VALUES (345, 'test1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-05 17:27:22');
INSERT INTO `sys_logininfor` VALUES (346, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 17:27:29');
INSERT INTO `sys_logininfor` VALUES (347, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-05 17:27:43');
INSERT INTO `sys_logininfor` VALUES (348, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 17:27:50');
INSERT INTO `sys_logininfor` VALUES (349, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-05 17:31:03');
INSERT INTO `sys_logininfor` VALUES (350, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-06 11:23:57');
INSERT INTO `sys_logininfor` VALUES (351, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 11:24:00');
INSERT INTO `sys_logininfor` VALUES (352, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 11:24:13');
INSERT INTO `sys_logininfor` VALUES (353, 's4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-02-06 11:28:04');
INSERT INTO `sys_logininfor` VALUES (354, 's5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-02-06 11:29:02');
INSERT INTO `sys_logininfor` VALUES (355, 'p4', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-02-06 11:32:07');
INSERT INTO `sys_logininfor` VALUES (356, 'p5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-02-06 11:32:47');
INSERT INTO `sys_logininfor` VALUES (357, 'p6', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '注册成功', '2023-02-06 11:33:26');
INSERT INTO `sys_logininfor` VALUES (358, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 11:33:30');
INSERT INTO `sys_logininfor` VALUES (359, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 11:39:44');
INSERT INTO `sys_logininfor` VALUES (360, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 12:17:34');
INSERT INTO `sys_logininfor` VALUES (361, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 12:32:14');
INSERT INTO `sys_logininfor` VALUES (362, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 12:33:52');
INSERT INTO `sys_logininfor` VALUES (363, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 12:34:00');
INSERT INTO `sys_logininfor` VALUES (364, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 12:43:41');
INSERT INTO `sys_logininfor` VALUES (365, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 12:43:49');
INSERT INTO `sys_logininfor` VALUES (366, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 13:12:03');
INSERT INTO `sys_logininfor` VALUES (367, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 13:38:08');
INSERT INTO `sys_logininfor` VALUES (368, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 16:26:08');
INSERT INTO `sys_logininfor` VALUES (369, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 17:21:22');
INSERT INTO `sys_logininfor` VALUES (370, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-06 17:21:31');
INSERT INTO `sys_logininfor` VALUES (371, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 17:21:34');
INSERT INTO `sys_logininfor` VALUES (372, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-06 19:30:04');
INSERT INTO `sys_logininfor` VALUES (373, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 19:30:07');
INSERT INTO `sys_logininfor` VALUES (374, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-06 19:30:20');
INSERT INTO `sys_logininfor` VALUES (375, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 19:30:23');
INSERT INTO `sys_logininfor` VALUES (376, 's1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-06 19:49:56');
INSERT INTO `sys_logininfor` VALUES (377, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 19:50:05');
INSERT INTO `sys_logininfor` VALUES (378, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 19:58:35');
INSERT INTO `sys_logininfor` VALUES (379, 'p1', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:29:41');
INSERT INTO `sys_logininfor` VALUES (380, 's5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:42:01');
INSERT INTO `sys_logininfor` VALUES (381, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-06 20:43:35');
INSERT INTO `sys_logininfor` VALUES (382, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 10:41:52');
INSERT INTO `sys_logininfor` VALUES (383, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 11:30:59');
INSERT INTO `sys_logininfor` VALUES (384, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 11:43:22');
INSERT INTO `sys_logininfor` VALUES (385, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 15:38:29');
INSERT INTO `sys_logininfor` VALUES (386, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:00:01');
INSERT INTO `sys_logininfor` VALUES (387, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:02:00');
INSERT INTO `sys_logininfor` VALUES (388, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:02:06');
INSERT INTO `sys_logininfor` VALUES (389, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:26:37');
INSERT INTO `sys_logininfor` VALUES (390, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:26:44');
INSERT INTO `sys_logininfor` VALUES (391, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:35:08');
INSERT INTO `sys_logininfor` VALUES (392, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:35:14');
INSERT INTO `sys_logininfor` VALUES (393, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:37:35');
INSERT INTO `sys_logininfor` VALUES (394, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:37:42');
INSERT INTO `sys_logininfor` VALUES (395, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:37:46');
INSERT INTO `sys_logininfor` VALUES (396, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:37:52');
INSERT INTO `sys_logininfor` VALUES (397, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:41:26');
INSERT INTO `sys_logininfor` VALUES (398, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:41:33');
INSERT INTO `sys_logininfor` VALUES (399, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 16:41:51');
INSERT INTO `sys_logininfor` VALUES (400, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 16:41:57');
INSERT INTO `sys_logininfor` VALUES (401, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 17:15:41');
INSERT INTO `sys_logininfor` VALUES (402, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 17:28:12');
INSERT INTO `sys_logininfor` VALUES (403, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-07 17:48:56');
INSERT INTO `sys_logininfor` VALUES (404, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 17:48:59');
INSERT INTO `sys_logininfor` VALUES (405, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 18:28:49');
INSERT INTO `sys_logininfor` VALUES (406, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 20:29:00');
INSERT INTO `sys_logininfor` VALUES (407, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 20:36:25');
INSERT INTO `sys_logininfor` VALUES (408, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 20:41:46');
INSERT INTO `sys_logininfor` VALUES (409, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 20:48:32');
INSERT INTO `sys_logininfor` VALUES (410, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:09:36');
INSERT INTO `sys_logininfor` VALUES (411, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:31:32');
INSERT INTO `sys_logininfor` VALUES (412, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:36:35');
INSERT INTO `sys_logininfor` VALUES (413, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 21:47:38');
INSERT INTO `sys_logininfor` VALUES (414, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 22:02:41');
INSERT INTO `sys_logininfor` VALUES (415, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:02:50');
INSERT INTO `sys_logininfor` VALUES (416, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:14:17');
INSERT INTO `sys_logininfor` VALUES (417, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:36:57');
INSERT INTO `sys_logininfor` VALUES (418, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 22:37:13');
INSERT INTO `sys_logininfor` VALUES (419, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:37:21');
INSERT INTO `sys_logininfor` VALUES (420, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-07 22:53:09');
INSERT INTO `sys_logininfor` VALUES (421, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-07 22:53:16');
INSERT INTO `sys_logininfor` VALUES (422, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-08 10:52:28');
INSERT INTO `sys_logininfor` VALUES (423, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-08 11:21:49');
INSERT INTO `sys_logininfor` VALUES (424, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 11:21:53');
INSERT INTO `sys_logininfor` VALUES (425, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 11:22:16');
INSERT INTO `sys_logininfor` VALUES (426, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 11:56:01');
INSERT INTO `sys_logininfor` VALUES (427, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 11:59:29');
INSERT INTO `sys_logininfor` VALUES (428, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-08 12:13:49');
INSERT INTO `sys_logininfor` VALUES (429, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 12:13:56');
INSERT INTO `sys_logininfor` VALUES (430, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-08 12:16:22');
INSERT INTO `sys_logininfor` VALUES (431, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-08 12:16:29');
INSERT INTO `sys_logininfor` VALUES (432, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '密码输入错误1次', '2023-02-12 15:11:38');
INSERT INTO `sys_logininfor` VALUES (433, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-12 15:11:38');
INSERT INTO `sys_logininfor` VALUES (434, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 15:11:44');
INSERT INTO `sys_logininfor` VALUES (435, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-12 15:46:17');
INSERT INTO `sys_logininfor` VALUES (436, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 09:55:01');
INSERT INTO `sys_logininfor` VALUES (437, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-13 10:06:56');
INSERT INTO `sys_logininfor` VALUES (438, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 10:07:01');
INSERT INTO `sys_logininfor` VALUES (439, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:11:03');
INSERT INTO `sys_logininfor` VALUES (440, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 10:49:31');
INSERT INTO `sys_logininfor` VALUES (441, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 11:16:01');
INSERT INTO `sys_logininfor` VALUES (442, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-13 11:17:02');
INSERT INTO `sys_logininfor` VALUES (443, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 11:17:10');
INSERT INTO `sys_logininfor` VALUES (444, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-13 11:32:40');
INSERT INTO `sys_logininfor` VALUES (445, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 11:32:47');
INSERT INTO `sys_logininfor` VALUES (446, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 11:45:30');
INSERT INTO `sys_logininfor` VALUES (447, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-02-13 12:13:13');
INSERT INTO `sys_logininfor` VALUES (448, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 12:13:16');
INSERT INTO `sys_logininfor` VALUES (449, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 14:02:19');
INSERT INTO `sys_logininfor` VALUES (450, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 14:22:06');
INSERT INTO `sys_logininfor` VALUES (451, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-13 15:00:47');
INSERT INTO `sys_logininfor` VALUES (452, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 15:00:53');
INSERT INTO `sys_logininfor` VALUES (453, 'p5', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 15:04:34');
INSERT INTO `sys_logininfor` VALUES (454, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 15:04:54');
INSERT INTO `sys_logininfor` VALUES (455, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 15:51:52');
INSERT INTO `sys_logininfor` VALUES (456, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 16:05:20');
INSERT INTO `sys_logininfor` VALUES (457, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-13 16:06:19');
INSERT INTO `sys_logininfor` VALUES (458, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-13 16:06:26');
INSERT INTO `sys_logininfor` VALUES (459, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-13 16:06:52');
INSERT INTO `sys_logininfor` VALUES (460, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-16 10:02:15');
INSERT INTO `sys_logininfor` VALUES (461, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 10:02:20');
INSERT INTO `sys_logininfor` VALUES (462, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 10:50:13');
INSERT INTO `sys_logininfor` VALUES (463, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 13:10:28');
INSERT INTO `sys_logininfor` VALUES (464, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 13:49:43');
INSERT INTO `sys_logininfor` VALUES (465, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 16:14:46');
INSERT INTO `sys_logininfor` VALUES (466, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-16 16:15:30');
INSERT INTO `sys_logininfor` VALUES (467, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 17:17:55');
INSERT INTO `sys_logininfor` VALUES (468, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-16 17:20:45');
INSERT INTO `sys_logininfor` VALUES (469, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 17:20:49');
INSERT INTO `sys_logininfor` VALUES (470, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 18:36:11');
INSERT INTO `sys_logininfor` VALUES (471, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-16 19:47:20');
INSERT INTO `sys_logininfor` VALUES (472, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 09:29:18');
INSERT INTO `sys_logininfor` VALUES (473, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 14:20:45');
INSERT INTO `sys_logininfor` VALUES (474, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-17 14:39:52');
INSERT INTO `sys_logininfor` VALUES (475, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 14:40:00');
INSERT INTO `sys_logininfor` VALUES (476, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 15:03:51');
INSERT INTO `sys_logininfor` VALUES (477, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-17 15:24:15');
INSERT INTO `sys_logininfor` VALUES (478, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-17 15:24:15');
INSERT INTO `sys_logininfor` VALUES (479, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:25:00');
INSERT INTO `sys_logininfor` VALUES (480, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 15:25:04');
INSERT INTO `sys_logininfor` VALUES (481, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-17 15:25:10');
INSERT INTO `sys_logininfor` VALUES (482, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-17 15:25:10');
INSERT INTO `sys_logininfor` VALUES (483, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-17 15:25:14');
INSERT INTO `sys_logininfor` VALUES (484, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 15:25:19');
INSERT INTO `sys_logininfor` VALUES (485, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 16:14:56');
INSERT INTO `sys_logininfor` VALUES (486, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 16:28:43');
INSERT INTO `sys_logininfor` VALUES (487, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-17 16:31:45');
INSERT INTO `sys_logininfor` VALUES (488, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 16:31:54');
INSERT INTO `sys_logininfor` VALUES (489, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-17 17:25:54');
INSERT INTO `sys_logininfor` VALUES (490, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 17:26:00');
INSERT INTO `sys_logininfor` VALUES (491, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-17 18:53:47');
INSERT INTO `sys_logininfor` VALUES (492, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 14:41:22');
INSERT INTO `sys_logininfor` VALUES (493, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 15:28:02');
INSERT INTO `sys_logininfor` VALUES (494, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 15:29:41');
INSERT INTO `sys_logininfor` VALUES (495, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 15:29:44');
INSERT INTO `sys_logininfor` VALUES (496, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 15:31:04');
INSERT INTO `sys_logininfor` VALUES (497, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 15:31:11');
INSERT INTO `sys_logininfor` VALUES (498, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 15:31:27');
INSERT INTO `sys_logininfor` VALUES (499, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 15:43:09');
INSERT INTO `sys_logininfor` VALUES (500, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 15:43:11');
INSERT INTO `sys_logininfor` VALUES (501, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 16:07:26');
INSERT INTO `sys_logininfor` VALUES (502, 's1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 16:08:21');
INSERT INTO `sys_logininfor` VALUES (503, 's1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 16:08:42');
INSERT INTO `sys_logininfor` VALUES (504, 'p1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 16:08:48');
INSERT INTO `sys_logininfor` VALUES (505, 'p1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 16:10:27');
INSERT INTO `sys_logininfor` VALUES (506, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 16:10:35');
INSERT INTO `sys_logininfor` VALUES (507, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 16:47:50');
INSERT INTO `sys_logininfor` VALUES (508, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 16:48:13');
INSERT INTO `sys_logininfor` VALUES (509, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-20 17:09:16');
INSERT INTO `sys_logininfor` VALUES (510, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 17:09:22');
INSERT INTO `sys_logininfor` VALUES (511, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 17:39:02');
INSERT INTO `sys_logininfor` VALUES (512, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 18:26:13');
INSERT INTO `sys_logininfor` VALUES (513, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-02-20 18:27:48');
INSERT INTO `sys_logininfor` VALUES (514, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 18:27:52');
INSERT INTO `sys_logininfor` VALUES (515, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 18:48:24');
INSERT INTO `sys_logininfor` VALUES (516, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 18:50:17');
INSERT INTO `sys_logininfor` VALUES (517, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-20 18:56:24');
INSERT INTO `sys_logininfor` VALUES (518, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 18:56:32');
INSERT INTO `sys_logininfor` VALUES (519, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 19:24:42');
INSERT INTO `sys_logininfor` VALUES (520, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-20 19:24:44');
INSERT INTO `sys_logininfor` VALUES (521, 'fmj', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-20 19:36:51');
INSERT INTO `sys_logininfor` VALUES (522, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-20 19:37:00');
INSERT INTO `sys_logininfor` VALUES (523, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 09:56:58');
INSERT INTO `sys_logininfor` VALUES (524, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 10:23:47');
INSERT INTO `sys_logininfor` VALUES (525, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 10:24:45');
INSERT INTO `sys_logininfor` VALUES (526, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 10:24:53');
INSERT INTO `sys_logininfor` VALUES (527, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 10:46:49');
INSERT INTO `sys_logininfor` VALUES (528, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 10:46:52');
INSERT INTO `sys_logininfor` VALUES (529, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 11:04:49');
INSERT INTO `sys_logininfor` VALUES (530, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 11:04:55');
INSERT INTO `sys_logininfor` VALUES (531, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 11:12:11');
INSERT INTO `sys_logininfor` VALUES (532, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 11:12:37');
INSERT INTO `sys_logininfor` VALUES (533, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 11:12:41');
INSERT INTO `sys_logininfor` VALUES (534, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 11:48:10');
INSERT INTO `sys_logininfor` VALUES (535, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 15:41:48');
INSERT INTO `sys_logininfor` VALUES (536, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 15:43:47');
INSERT INTO `sys_logininfor` VALUES (537, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 15:43:55');
INSERT INTO `sys_logininfor` VALUES (538, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:44:10');
INSERT INTO `sys_logininfor` VALUES (539, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-21 15:45:28');
INSERT INTO `sys_logininfor` VALUES (540, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 15:45:33');
INSERT INTO `sys_logininfor` VALUES (541, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 15:52:12');
INSERT INTO `sys_logininfor` VALUES (542, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 15:52:16');
INSERT INTO `sys_logininfor` VALUES (543, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 16:02:01');
INSERT INTO `sys_logininfor` VALUES (544, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 16:02:04');
INSERT INTO `sys_logininfor` VALUES (545, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 16:36:38');
INSERT INTO `sys_logininfor` VALUES (546, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 16:37:02');
INSERT INTO `sys_logininfor` VALUES (547, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 16:50:13');
INSERT INTO `sys_logininfor` VALUES (548, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 16:50:19');
INSERT INTO `sys_logininfor` VALUES (549, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 17:36:58');
INSERT INTO `sys_logininfor` VALUES (550, 'admin', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-21 18:20:17');
INSERT INTO `sys_logininfor` VALUES (551, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-21 18:20:25');
INSERT INTO `sys_logininfor` VALUES (552, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 18:25:46');
INSERT INTO `sys_logininfor` VALUES (553, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-21 18:42:23');
INSERT INTO `sys_logininfor` VALUES (554, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 10:33:25');
INSERT INTO `sys_logininfor` VALUES (555, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-22 10:34:41');
INSERT INTO `sys_logininfor` VALUES (556, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 10:34:45');
INSERT INTO `sys_logininfor` VALUES (557, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-22 10:43:36');
INSERT INTO `sys_logininfor` VALUES (558, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 10:43:44');
INSERT INTO `sys_logininfor` VALUES (559, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-22 10:45:55');
INSERT INTO `sys_logininfor` VALUES (560, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 10:46:00');
INSERT INTO `sys_logininfor` VALUES (561, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 11:31:33');
INSERT INTO `sys_logininfor` VALUES (562, 'm1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-22 11:57:04');
INSERT INTO `sys_logininfor` VALUES (563, 'm1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 11:57:04');
INSERT INTO `sys_logininfor` VALUES (564, 'm1', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 12:10:42');
INSERT INTO `sys_logininfor` VALUES (565, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 12:11:44');
INSERT INTO `sys_logininfor` VALUES (566, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-22 12:16:31');
INSERT INTO `sys_logininfor` VALUES (567, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 12:16:35');
INSERT INTO `sys_logininfor` VALUES (568, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-22 15:14:02');
INSERT INTO `sys_logininfor` VALUES (569, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 15:14:05');
INSERT INTO `sys_logininfor` VALUES (570, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-22 16:15:12');
INSERT INTO `sys_logininfor` VALUES (571, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 16:15:16');
INSERT INTO `sys_logininfor` VALUES (572, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-22 16:45:54');
INSERT INTO `sys_logininfor` VALUES (573, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 16:45:58');
INSERT INTO `sys_logininfor` VALUES (574, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-22 17:18:57');
INSERT INTO `sys_logininfor` VALUES (575, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 17:19:00');
INSERT INTO `sys_logininfor` VALUES (576, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 18:21:56');
INSERT INTO `sys_logininfor` VALUES (577, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:26:21');
INSERT INTO `sys_logininfor` VALUES (578, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-22 18:26:21');
INSERT INTO `sys_logininfor` VALUES (579, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:26:36');
INSERT INTO `sys_logininfor` VALUES (580, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误2次', '2023-02-22 18:26:36');
INSERT INTO `sys_logininfor` VALUES (581, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-02-22 18:31:13');
INSERT INTO `sys_logininfor` VALUES (582, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误3次', '2023-02-22 18:31:16');
INSERT INTO `sys_logininfor` VALUES (583, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:31:16');
INSERT INTO `sys_logininfor` VALUES (584, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:31:23');
INSERT INTO `sys_logininfor` VALUES (585, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误4次', '2023-02-22 18:31:23');
INSERT INTO `sys_logininfor` VALUES (586, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-22 18:32:06');
INSERT INTO `sys_logininfor` VALUES (587, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:32:10');
INSERT INTO `sys_logininfor` VALUES (588, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次', '2023-02-22 18:32:10');
INSERT INTO `sys_logininfor` VALUES (589, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-22 18:33:22');
INSERT INTO `sys_logininfor` VALUES (590, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-02-22 18:33:25');
INSERT INTO `sys_logininfor` VALUES (591, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误5次，帐户锁定10分钟', '2023-02-22 18:33:25');
INSERT INTO `sys_logininfor` VALUES (592, 'p8', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '用户不存在/密码错误', '2023-02-22 18:33:34');
INSERT INTO `sys_logininfor` VALUES (593, 'p8', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '密码输入错误1次', '2023-02-22 18:33:34');
INSERT INTO `sys_logininfor` VALUES (594, 'p8', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码已失效', '2023-02-22 18:36:20');
INSERT INTO `sys_logininfor` VALUES (595, 'p8', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 18:36:24');
INSERT INTO `sys_logininfor` VALUES (596, 'p8', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 18:40:44');
INSERT INTO `sys_logininfor` VALUES (597, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 18:40:50');
INSERT INTO `sys_logininfor` VALUES (598, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 18:43:56');
INSERT INTO `sys_logininfor` VALUES (599, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 18:44:01');
INSERT INTO `sys_logininfor` VALUES (600, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 18:47:34');
INSERT INTO `sys_logininfor` VALUES (601, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-22 18:47:39');
INSERT INTO `sys_logininfor` VALUES (602, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 18:47:45');
INSERT INTO `sys_logininfor` VALUES (603, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 18:58:47');
INSERT INTO `sys_logininfor` VALUES (604, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 18:58:56');
INSERT INTO `sys_logininfor` VALUES (605, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 19:00:29');
INSERT INTO `sys_logininfor` VALUES (606, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 19:00:36');
INSERT INTO `sys_logininfor` VALUES (607, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 19:06:58');
INSERT INTO `sys_logininfor` VALUES (608, 'p9', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-02-22 19:35:59');
INSERT INTO `sys_logininfor` VALUES (609, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 19:36:34');
INSERT INTO `sys_logininfor` VALUES (610, 's7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '注册成功', '2023-02-22 19:41:04');
INSERT INTO `sys_logininfor` VALUES (611, 's7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 19:41:15');
INSERT INTO `sys_logininfor` VALUES (612, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 20:53:35');
INSERT INTO `sys_logininfor` VALUES (613, 's7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 20:53:48');
INSERT INTO `sys_logininfor` VALUES (614, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-22 21:53:38');
INSERT INTO `sys_logininfor` VALUES (615, 's7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-22 22:19:39');
INSERT INTO `sys_logininfor` VALUES (616, 's7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-22 22:23:59');
INSERT INTO `sys_logininfor` VALUES (617, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 09:35:04');
INSERT INTO `sys_logininfor` VALUES (618, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 09:45:05');
INSERT INTO `sys_logininfor` VALUES (619, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 09:47:58');
INSERT INTO `sys_logininfor` VALUES (620, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 09:48:02');
INSERT INTO `sys_logininfor` VALUES (621, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 09:48:07');
INSERT INTO `sys_logininfor` VALUES (622, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 09:48:15');
INSERT INTO `sys_logininfor` VALUES (623, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 10:20:37');
INSERT INTO `sys_logininfor` VALUES (624, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 10:22:18');
INSERT INTO `sys_logininfor` VALUES (625, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 15:40:45');
INSERT INTO `sys_logininfor` VALUES (626, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 15:45:35');
INSERT INTO `sys_logininfor` VALUES (627, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '1', '验证码错误', '2023-02-23 16:49:53');
INSERT INTO `sys_logininfor` VALUES (628, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 16:49:56');
INSERT INTO `sys_logininfor` VALUES (629, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 17:15:09');
INSERT INTO `sys_logininfor` VALUES (630, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 17:15:20');
INSERT INTO `sys_logininfor` VALUES (631, 'p7', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 17:16:23');
INSERT INTO `sys_logininfor` VALUES (632, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 17:16:35');
INSERT INTO `sys_logininfor` VALUES (633, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码已失效', '2023-02-23 17:17:46');
INSERT INTO `sys_logininfor` VALUES (634, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 17:17:49');
INSERT INTO `sys_logininfor` VALUES (635, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 17:22:01');
INSERT INTO `sys_logininfor` VALUES (636, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 17:22:04');
INSERT INTO `sys_logininfor` VALUES (637, 'zty', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '退出成功', '2023-02-23 17:43:36');
INSERT INTO `sys_logininfor` VALUES (638, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 17:43:43');
INSERT INTO `sys_logininfor` VALUES (639, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 17:43:57');
INSERT INTO `sys_logininfor` VALUES (640, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '1', '验证码错误', '2023-02-23 17:44:51');
INSERT INTO `sys_logininfor` VALUES (641, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 17:44:54');
INSERT INTO `sys_logininfor` VALUES (642, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 18:17:58');
INSERT INTO `sys_logininfor` VALUES (643, 'fmj', '127.0.0.1', '内网IP', 'Chrome 11', 'Windows 10', '0', '登录成功', '2023-02-23 18:29:28');
INSERT INTO `sys_logininfor` VALUES (644, 'admin', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '退出成功', '2023-02-23 18:40:13');
INSERT INTO `sys_logininfor` VALUES (645, 'zty', '127.0.0.1', '内网IP', 'Chrome 10', 'Windows 10', '0', '登录成功', '2023-02-23 18:40:19');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint(0) NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int(0) NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int(0) NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int(0) NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2061 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 5, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:25:57', '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 6, 'monitor', NULL, '', 1, 0, 'M', '0', '0', '', 'monitor', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:26:03', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 7, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:26:09', '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '小张博客', 0, 8, 'blog', 'blog/index', '', 1, 0, 'C', '0', '0', '', 'guide', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:26:13', '小张官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-21 11:10:33', '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-21 11:10:41', '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2022-12-23 15:41:46', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '职级管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-21 11:10:48', '职级管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-21 11:10:54', '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2022-12-23 15:41:46', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2022-12-23 15:41:46', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 0, 3, 'notice', 'system/notice/index', '', 1, 1, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:25:37', '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2022-12-23 15:41:46', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2022-12-23 15:41:46', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2022-12-23 15:41:46', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2022-12-23 15:41:46', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2022-12-23 15:41:46', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2022-12-23 15:41:46', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2022-12-23 15:41:46', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2022-12-23 15:41:46', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2022-12-23 15:41:46', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2022-12-23 15:41:46', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2022-12-23 15:41:46', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2022-12-23 15:41:46', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '职级查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '职级新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '职级修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '职级删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2001, '家教信息系统', 0, 0, 'test', NULL, NULL, 1, 0, 'M', '0', '0', '', 'tutor', 'admin', '2022-12-24 10:55:28', 'admin', '2023-02-22 10:50:26', '');
INSERT INTO `sys_menu` VALUES (2032, '学生信息', 2001, 1, 'student', 'core/student/index', NULL, 1, 1, 'C', '0', '0', 'core:student:list', 'student', 'admin', '2022-12-25 20:45:00', 'admin', '2023-02-21 11:48:30', '学生信息菜单');
INSERT INTO `sys_menu` VALUES (2033, '学生信息查询', 2032, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:student:query', '#', 'admin', '2022-12-25 20:45:00', 'admin', '2022-12-28 19:50:01', '');
INSERT INTO `sys_menu` VALUES (2034, '学生信息新增', 2032, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:student:add', '#', 'admin', '2022-12-25 20:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '学生信息修改', 2032, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:student:edit', '#', 'admin', '2022-12-25 20:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '学生信息删除', 2032, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:student:remove', '#', 'admin', '2022-12-25 20:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '学生信息导出', 2032, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:student:export', '#', 'admin', '2022-12-25 20:45:00', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '学员信息', 2001, 1, 'parent', 'core/parent/index', NULL, 1, 1, 'C', '0', '0', 'core:parent:list', 'parent', 'admin', '2022-12-25 20:47:31', 'admin', '2023-02-21 11:48:44', '家长信息菜单');
INSERT INTO `sys_menu` VALUES (2039, '学员信息查询', 2038, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:parent:query', '#', 'admin', '2022-12-25 20:47:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2040, '学员信息新增', 2038, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:parent:add', '#', 'admin', '2022-12-25 20:47:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '学员信息修改', 2038, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:parent:edit', '#', 'admin', '2022-12-25 20:47:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '学员信息删除', 2038, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:parent:remove', '#', 'admin', '2022-12-25 20:47:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '学员信息导出', 2038, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:parent:export', '#', 'admin', '2022-12-25 20:47:31', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '喜欢列表', 2001, 2, 'like', 'core/like/index', NULL, 1, 1, 'C', '0', '0', '', 'love-red', 'admin', '2023-02-07 11:00:49', 'admin', '2023-02-21 11:21:16', '');
INSERT INTO `sys_menu` VALUES (2045, '粉丝列表', 2001, 3, 'fans', 'core/fans/index', NULL, 1, 1, 'C', '0', '0', '', 'love-white', 'admin', '2023-02-07 16:09:17', 'admin', '2023-02-21 11:21:08', '');
INSERT INTO `sys_menu` VALUES (2046, '收藏列表', 2001, 4, 'collect', 'core/collect/index', NULL, 1, 1, 'C', '0', '0', NULL, 'star', 'admin', '2023-02-07 17:16:59', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2047, '我的留言', 0, 2, 'leave', NULL, NULL, 1, 0, 'M', '0', '0', '', 'message', 'admin', '2023-02-13 10:20:44', 'admin', '2023-02-23 17:25:29', '');
INSERT INTO `sys_menu` VALUES (2048, '发出留言', 2047, 0, 'send', 'core/leave/send', NULL, 1, 1, 'C', '0', '0', '', 'send', 'admin', '2023-02-13 10:24:34', 'admin', '2023-02-21 11:30:09', '');
INSERT INTO `sys_menu` VALUES (2049, '接收留言', 2047, 1, 'received', 'core/leave/received', NULL, 1, 1, 'C', '0', '0', '', 'receive', 'admin', '2023-02-13 10:25:30', 'admin', '2023-02-21 11:31:18', '');
INSERT INTO `sys_menu` VALUES (2050, '押金信息', 2053, 0, 'deposit', 'core/deposit/index', NULL, 1, 1, 'C', '0', '0', '', 'deposit', 'admin', '2023-02-16 14:04:47', 'admin', '2023-02-21 11:53:30', '');
INSERT INTO `sys_menu` VALUES (2051, '押金明细', 2053, 0, 'depositDetail', 'core/depositDetail/index', NULL, 1, 1, 'C', '0', '0', '', 'deposit_detail', 'admin', '2023-02-16 14:05:37', 'admin', '2023-02-21 11:53:37', '');
INSERT INTO `sys_menu` VALUES (2052, '在线下单', 2053, 2, 'order', 'core/order/index', NULL, 1, 1, 'C', '0', '0', '', 'order', 'admin', '2023-02-16 14:06:25', 'admin', '2023-02-21 11:53:48', '');
INSERT INTO `sys_menu` VALUES (2053, '家教下单系统', 0, 1, 'deal', NULL, NULL, 1, 0, 'M', '0', '0', '', 'salary', 'admin', '2023-02-16 14:07:51', 'admin', '2023-02-21 16:01:09', '');
INSERT INTO `sys_menu` VALUES (2055, '管理员系统', 0, 4, 'manager', 'core/manager/index', NULL, 1, 1, 'C', '0', '0', 'core:manager:list', 'logininfor', 'admin', '2023-02-22 11:32:43', 'admin', '2023-02-23 17:25:50', '管理员信息菜单');
INSERT INTO `sys_menu` VALUES (2056, '管理员信息查询', 2055, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:manager:query', '#', 'admin', '2023-02-22 11:32:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2057, '管理员信息新增', 2055, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:manager:add', '#', 'admin', '2023-02-22 11:32:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2058, '管理员信息修改', 2055, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:manager:edit', '#', 'admin', '2023-02-22 11:32:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2059, '管理员信息删除', 2055, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:manager:remove', '#', 'admin', '2023-02-22 11:32:43', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2060, '管理员信息导出', 2055, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'core:manager:export', '#', 'admin', '2023-02-22 11:32:43', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int(0) NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 13 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2023-02-21 小张家教平台准备上线啦~', '2', 0x3C703EE58786E5A487E4B88AE7BABFE595A67E3C2F703E, '0', 'admin', '2022-12-23 15:41:47', 'admin', '2023-02-21 16:37:17', '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int(0) NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int(0) NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '职级名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int(0) NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime(0) NULL DEFAULT NULL COMMENT '操作时间',
  PRIMARY KEY (`oper_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1242 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (1248, '定时任务', 2, 'com.zty.quartz.controller.SysJobController.changeStatus()', 'PUT', 1, 'admin', NULL, '/monitor/job/changeStatus', '127.0.0.1', '内网IP', '{\"jobId\":100,\"misfirePolicy\":\"0\",\"params\":{},\"status\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:24:47');
INSERT INTO `sys_oper_log` VALUES (1249, '定时任务', 2, 'com.zty.quartz.controller.SysJobController.edit()', 'PUT', 1, 'admin', NULL, '/monitor/job', '127.0.0.1', '内网IP', '{\"concurrent\":\"0\",\"createBy\":\"admin\",\"createTime\":\"2023-02-23 18:18:53\",\"cronExpression\":\"0 0 12 * * ?\",\"invokeTarget\":\"ryTask.periodClearOperLogs\",\"jobGroup\":\"SYSTEM\",\"jobId\":100,\"jobName\":\"定时删除操作日志\",\"misfirePolicy\":\"3\",\"nextValidTime\":\"2023-02-24 12:00:00\",\"params\":{},\"remark\":\"\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:27:59');
INSERT INTO `sys_oper_log` VALUES (1250, '调度日志', 9, 'com.zty.quartz.controller.SysJobLogController.clean()', 'DELETE', 1, 'admin', NULL, '/monitor/jobLog/clean', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:28:06');
INSERT INTO `sys_oper_log` VALUES (1251, '角色管理', 2, 'com.zty.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', NULL, '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2022-12-23 15:41:46\",\"dataScope\":\"1\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":false,\"menuIds\":[2001,2038,2053,107,2055,2033,2035,2039,2041,2044,2045,2046,2051,2052,2047,2048,2049,1035,2056,2060,4],\"params\":{},\"remark\":\"家长\",\"roleId\":4,\"roleKey\":\"parent\",\"roleName\":\"学员\",\"roleSort\":4,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:37:05');
INSERT INTO `sys_oper_log` VALUES (1252, '用户收藏关联', 1, 'com.zty.core.controller.common.SysUserCollectController.add()', 'POST', 1, 'fmj', NULL, '/core/collect', '127.0.0.1', '内网IP', '{\"collectId\":1,\"userId\":100}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:37:34');
INSERT INTO `sys_oper_log` VALUES (1253, '用户点赞关联', 3, 'com.zty.core.controller.common.SysUserLikeController.remove()', 'DELETE', 1, 'fmj', NULL, '/core/like/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:37:52');
INSERT INTO `sys_oper_log` VALUES (1254, '用户收藏关联', 3, 'com.zty.core.controller.common.SysUserCollectController.remove()', 'DELETE', 1, 'fmj', NULL, '/core/collect/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:37:53');
INSERT INTO `sys_oper_log` VALUES (1255, '用户点赞关联', 3, 'com.zty.core.controller.common.SysUserLikeController.remove()', 'DELETE', 1, 'admin', NULL, '/core/like/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:14');
INSERT INTO `sys_oper_log` VALUES (1256, '用户收藏关联', 3, 'com.zty.core.controller.common.SysUserCollectController.remove()', 'DELETE', 1, 'admin', NULL, '/core/collect/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:15');
INSERT INTO `sys_oper_log` VALUES (1257, '用户点赞关联', 3, 'com.zty.core.controller.common.SysUserLikeController.remove()', 'DELETE', 1, 'admin', NULL, '/core/like/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:18');
INSERT INTO `sys_oper_log` VALUES (1258, '用户收藏关联', 3, 'com.zty.core.controller.common.SysUserCollectController.remove()', 'DELETE', 1, 'admin', NULL, '/core/collect/', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:19');
INSERT INTO `sys_oper_log` VALUES (1259, '用户点赞关联', 1, 'com.zty.core.controller.common.SysUserLikeController.add()', 'POST', 1, 'admin', NULL, '/core/like', '127.0.0.1', '内网IP', '{\"likeId\":100,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:24');
INSERT INTO `sys_oper_log` VALUES (1260, '用户收藏关联', 1, 'com.zty.core.controller.common.SysUserCollectController.add()', 'POST', 1, 'admin', NULL, '/core/collect', '127.0.0.1', '内网IP', '{\"collectId\":100,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:24');
INSERT INTO `sys_oper_log` VALUES (1261, '用户点赞关联', 1, 'com.zty.core.controller.common.SysUserLikeController.add()', 'POST', 1, 'admin', NULL, '/core/like', '127.0.0.1', '内网IP', '{\"likeId\":111,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:30');
INSERT INTO `sys_oper_log` VALUES (1262, '用户收藏关联', 1, 'com.zty.core.controller.common.SysUserCollectController.add()', 'POST', 1, 'admin', NULL, '/core/collect', '127.0.0.1', '内网IP', '{\"collectId\":111,\"userId\":1}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2023-02-23 18:38:30');

-- ----------------------------
-- Table structure for sys_parent
-- ----------------------------
DROP TABLE IF EXISTS `sys_parent`;
CREATE TABLE `sys_parent`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '学员家教信息ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学员所在地址',
  `background` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学员详细背景',
  `salary_reward` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '薪资报酬',
  `auth_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '认证状态（0代表未认证 1表示已认证）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `parent_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 115 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学员家教信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_parent
-- ----------------------------
INSERT INTO `sys_parent` VALUES (103, 100, '河南省-南阳市-社旗县', '111111', '3', '1', NULL, NULL, '2023-02-23 17:10:08', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (107, 111, '四川省-乐山市-犍为县', '2', '0', '1', NULL, 'p1', '2023-02-23 17:19:19', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (108, 114, '四川省-成都市-新都区', '····', '4', '0', NULL, 'p3', '2023-02-22 17:53:08', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (109, 117, '四川省-成都市-新都区', '222', '2', '0', NULL, 'p4', '2023-02-22 17:53:25', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (110, 118, '四川省-成都市-新都区', '122', '0', '0', NULL, 'p5', '2023-02-22 17:53:41', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (111, 119, '四川省-成都市-双流区', '1', '4', '0', NULL, 'p6', '2023-02-22 22:12:22', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (112, 121, '四川省-成都市-双流区', '111', '1', '0', NULL, NULL, '2023-02-23 17:16:20', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (113, 125, '四川省-成都市-双流区', '1', '1', '0', NULL, NULL, '2023-02-22 18:43:10', NULL, NULL, NULL);
INSERT INTO `sys_parent` VALUES (114, 126, '四川省-成都市-新都区', '111', '1', '0', NULL, 'p9', '2023-02-22 19:37:38', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int(0) NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'chinese', '语文', 1, '0', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'math', '数学', 2, '0', 'admin', '2022-12-23 15:41:46', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'english', '英语', 3, '0', 'admin', '2022-12-23 15:41:46', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int(0) NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本职级数据权限 4：本职级及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '职级树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 101 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2022-12-23 15:41:46', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '管理员', 'manager', 2, '1', 1, 1, '0', '0', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-22 12:15:18', '管理员console.log(\"111\")');
INSERT INTO `sys_role` VALUES (3, '学生', 'student', 3, '1', 0, 1, '0', '0', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 17:21:27', '学生');
INSERT INTO `sys_role` VALUES (4, '学员', 'parent', 4, '1', 0, 1, '0', '0', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 18:37:05', '家长');

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  `menu_id` bigint(0) NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
INSERT INTO `sys_role_menu` VALUES (2, 1);
INSERT INTO `sys_role_menu` VALUES (2, 2);
INSERT INTO `sys_role_menu` VALUES (2, 3);
INSERT INTO `sys_role_menu` VALUES (2, 4);
INSERT INTO `sys_role_menu` VALUES (2, 100);
INSERT INTO `sys_role_menu` VALUES (2, 101);
INSERT INTO `sys_role_menu` VALUES (2, 102);
INSERT INTO `sys_role_menu` VALUES (2, 103);
INSERT INTO `sys_role_menu` VALUES (2, 104);
INSERT INTO `sys_role_menu` VALUES (2, 105);
INSERT INTO `sys_role_menu` VALUES (2, 106);
INSERT INTO `sys_role_menu` VALUES (2, 107);
INSERT INTO `sys_role_menu` VALUES (2, 108);
INSERT INTO `sys_role_menu` VALUES (2, 109);
INSERT INTO `sys_role_menu` VALUES (2, 110);
INSERT INTO `sys_role_menu` VALUES (2, 111);
INSERT INTO `sys_role_menu` VALUES (2, 112);
INSERT INTO `sys_role_menu` VALUES (2, 113);
INSERT INTO `sys_role_menu` VALUES (2, 114);
INSERT INTO `sys_role_menu` VALUES (2, 115);
INSERT INTO `sys_role_menu` VALUES (2, 116);
INSERT INTO `sys_role_menu` VALUES (2, 117);
INSERT INTO `sys_role_menu` VALUES (2, 500);
INSERT INTO `sys_role_menu` VALUES (2, 501);
INSERT INTO `sys_role_menu` VALUES (2, 1000);
INSERT INTO `sys_role_menu` VALUES (2, 1001);
INSERT INTO `sys_role_menu` VALUES (2, 1002);
INSERT INTO `sys_role_menu` VALUES (2, 1003);
INSERT INTO `sys_role_menu` VALUES (2, 1004);
INSERT INTO `sys_role_menu` VALUES (2, 1005);
INSERT INTO `sys_role_menu` VALUES (2, 1006);
INSERT INTO `sys_role_menu` VALUES (2, 1007);
INSERT INTO `sys_role_menu` VALUES (2, 1008);
INSERT INTO `sys_role_menu` VALUES (2, 1009);
INSERT INTO `sys_role_menu` VALUES (2, 1010);
INSERT INTO `sys_role_menu` VALUES (2, 1011);
INSERT INTO `sys_role_menu` VALUES (2, 1012);
INSERT INTO `sys_role_menu` VALUES (2, 1013);
INSERT INTO `sys_role_menu` VALUES (2, 1014);
INSERT INTO `sys_role_menu` VALUES (2, 1015);
INSERT INTO `sys_role_menu` VALUES (2, 1016);
INSERT INTO `sys_role_menu` VALUES (2, 1017);
INSERT INTO `sys_role_menu` VALUES (2, 1018);
INSERT INTO `sys_role_menu` VALUES (2, 1019);
INSERT INTO `sys_role_menu` VALUES (2, 1020);
INSERT INTO `sys_role_menu` VALUES (2, 1021);
INSERT INTO `sys_role_menu` VALUES (2, 1022);
INSERT INTO `sys_role_menu` VALUES (2, 1023);
INSERT INTO `sys_role_menu` VALUES (2, 1024);
INSERT INTO `sys_role_menu` VALUES (2, 1025);
INSERT INTO `sys_role_menu` VALUES (2, 1026);
INSERT INTO `sys_role_menu` VALUES (2, 1027);
INSERT INTO `sys_role_menu` VALUES (2, 1028);
INSERT INTO `sys_role_menu` VALUES (2, 1029);
INSERT INTO `sys_role_menu` VALUES (2, 1030);
INSERT INTO `sys_role_menu` VALUES (2, 1031);
INSERT INTO `sys_role_menu` VALUES (2, 1032);
INSERT INTO `sys_role_menu` VALUES (2, 1033);
INSERT INTO `sys_role_menu` VALUES (2, 1034);
INSERT INTO `sys_role_menu` VALUES (2, 1035);
INSERT INTO `sys_role_menu` VALUES (2, 1036);
INSERT INTO `sys_role_menu` VALUES (2, 1037);
INSERT INTO `sys_role_menu` VALUES (2, 1038);
INSERT INTO `sys_role_menu` VALUES (2, 1039);
INSERT INTO `sys_role_menu` VALUES (2, 1040);
INSERT INTO `sys_role_menu` VALUES (2, 1041);
INSERT INTO `sys_role_menu` VALUES (2, 1042);
INSERT INTO `sys_role_menu` VALUES (2, 1043);
INSERT INTO `sys_role_menu` VALUES (2, 1044);
INSERT INTO `sys_role_menu` VALUES (2, 1045);
INSERT INTO `sys_role_menu` VALUES (2, 1046);
INSERT INTO `sys_role_menu` VALUES (2, 1047);
INSERT INTO `sys_role_menu` VALUES (2, 1048);
INSERT INTO `sys_role_menu` VALUES (2, 1049);
INSERT INTO `sys_role_menu` VALUES (2, 1050);
INSERT INTO `sys_role_menu` VALUES (2, 1051);
INSERT INTO `sys_role_menu` VALUES (2, 1052);
INSERT INTO `sys_role_menu` VALUES (2, 1053);
INSERT INTO `sys_role_menu` VALUES (2, 1054);
INSERT INTO `sys_role_menu` VALUES (2, 1055);
INSERT INTO `sys_role_menu` VALUES (2, 1056);
INSERT INTO `sys_role_menu` VALUES (2, 1057);
INSERT INTO `sys_role_menu` VALUES (2, 1058);
INSERT INTO `sys_role_menu` VALUES (2, 1059);
INSERT INTO `sys_role_menu` VALUES (2, 1060);
INSERT INTO `sys_role_menu` VALUES (2, 2001);
INSERT INTO `sys_role_menu` VALUES (2, 2032);
INSERT INTO `sys_role_menu` VALUES (2, 2033);
INSERT INTO `sys_role_menu` VALUES (2, 2034);
INSERT INTO `sys_role_menu` VALUES (2, 2035);
INSERT INTO `sys_role_menu` VALUES (2, 2036);
INSERT INTO `sys_role_menu` VALUES (2, 2037);
INSERT INTO `sys_role_menu` VALUES (2, 2038);
INSERT INTO `sys_role_menu` VALUES (2, 2039);
INSERT INTO `sys_role_menu` VALUES (2, 2040);
INSERT INTO `sys_role_menu` VALUES (2, 2041);
INSERT INTO `sys_role_menu` VALUES (2, 2042);
INSERT INTO `sys_role_menu` VALUES (2, 2043);
INSERT INTO `sys_role_menu` VALUES (2, 2044);
INSERT INTO `sys_role_menu` VALUES (2, 2045);
INSERT INTO `sys_role_menu` VALUES (2, 2046);
INSERT INTO `sys_role_menu` VALUES (2, 2047);
INSERT INTO `sys_role_menu` VALUES (2, 2048);
INSERT INTO `sys_role_menu` VALUES (2, 2049);
INSERT INTO `sys_role_menu` VALUES (2, 2050);
INSERT INTO `sys_role_menu` VALUES (2, 2051);
INSERT INTO `sys_role_menu` VALUES (2, 2052);
INSERT INTO `sys_role_menu` VALUES (2, 2053);
INSERT INTO `sys_role_menu` VALUES (2, 2055);
INSERT INTO `sys_role_menu` VALUES (2, 2056);
INSERT INTO `sys_role_menu` VALUES (2, 2060);
INSERT INTO `sys_role_menu` VALUES (3, 4);
INSERT INTO `sys_role_menu` VALUES (3, 107);
INSERT INTO `sys_role_menu` VALUES (3, 1035);
INSERT INTO `sys_role_menu` VALUES (3, 2001);
INSERT INTO `sys_role_menu` VALUES (3, 2033);
INSERT INTO `sys_role_menu` VALUES (3, 2035);
INSERT INTO `sys_role_menu` VALUES (3, 2038);
INSERT INTO `sys_role_menu` VALUES (3, 2039);
INSERT INTO `sys_role_menu` VALUES (3, 2043);
INSERT INTO `sys_role_menu` VALUES (3, 2044);
INSERT INTO `sys_role_menu` VALUES (3, 2045);
INSERT INTO `sys_role_menu` VALUES (3, 2046);
INSERT INTO `sys_role_menu` VALUES (3, 2047);
INSERT INTO `sys_role_menu` VALUES (3, 2048);
INSERT INTO `sys_role_menu` VALUES (3, 2049);
INSERT INTO `sys_role_menu` VALUES (3, 2051);
INSERT INTO `sys_role_menu` VALUES (3, 2052);
INSERT INTO `sys_role_menu` VALUES (3, 2053);
INSERT INTO `sys_role_menu` VALUES (3, 2055);
INSERT INTO `sys_role_menu` VALUES (3, 2056);
INSERT INTO `sys_role_menu` VALUES (3, 2060);
INSERT INTO `sys_role_menu` VALUES (4, 4);
INSERT INTO `sys_role_menu` VALUES (4, 107);
INSERT INTO `sys_role_menu` VALUES (4, 1035);
INSERT INTO `sys_role_menu` VALUES (4, 2001);
INSERT INTO `sys_role_menu` VALUES (4, 2033);
INSERT INTO `sys_role_menu` VALUES (4, 2035);
INSERT INTO `sys_role_menu` VALUES (4, 2038);
INSERT INTO `sys_role_menu` VALUES (4, 2039);
INSERT INTO `sys_role_menu` VALUES (4, 2041);
INSERT INTO `sys_role_menu` VALUES (4, 2044);
INSERT INTO `sys_role_menu` VALUES (4, 2045);
INSERT INTO `sys_role_menu` VALUES (4, 2046);
INSERT INTO `sys_role_menu` VALUES (4, 2047);
INSERT INTO `sys_role_menu` VALUES (4, 2048);
INSERT INTO `sys_role_menu` VALUES (4, 2049);
INSERT INTO `sys_role_menu` VALUES (4, 2051);
INSERT INTO `sys_role_menu` VALUES (4, 2052);
INSERT INTO `sys_role_menu` VALUES (4, 2053);
INSERT INTO `sys_role_menu` VALUES (4, 2055);
INSERT INTO `sys_role_menu` VALUES (4, 2056);
INSERT INTO `sys_role_menu` VALUES (4, 2060);

-- ----------------------------
-- Table structure for sys_student
-- ----------------------------
DROP TABLE IF EXISTS `sys_student`;
CREATE TABLE `sys_student`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '学生家教信息ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `location` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '学生所在地址',
  `university` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '所在高校',
  `major` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '专业',
  `background` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '学生详细背景',
  `teach_way` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '授课方式（0老师上门 1学生上门 2线上辅导）',
  `salary_expect` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '薪资期望',
  `auth_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '认证状态（0代表未认证 1表示已认证）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `student_id`(`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 121 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '学生家教信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_student
-- ----------------------------
INSERT INTO `sys_student` VALUES (108, 2, '四川省-成都市-新都区', '石油大学', '计算机', '77777', '1', '1', '1', NULL, NULL, '2023-02-23 17:17:23', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (114, 110, '四川省-成都市-新都区', '北京大学', '教育学', '1', '1', '0', '0', NULL, 'test1', '2023-02-23 17:18:39', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (115, 112, '安徽省-淮南市-谢家集区', '青海电信', '语文', '3', '2', '0', '1', NULL, 's1', '2023-02-22 17:44:44', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (116, 113, '北京市-北京市-大兴区', '清华大学', '自动化', '。。。', '1', '3', '0', NULL, 's3', '2023-02-22 22:26:00', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (117, 115, '河南省-信阳市-平桥区', '西南石油大学', '软件工程', '2', '0', '1', '0', NULL, 's4', '2023-02-22 17:45:49', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (118, 116, '山西省-阳泉市-郊区', '西南石油大学', '计算机', '123', '0', '2', '1', NULL, 's5', '2023-02-22 17:45:13', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (119, 124, '四川省-成都市-新都区', '西南石油大学', '软件工程', '1111', '1', '3', '0', NULL, NULL, '2023-02-22 18:42:45', NULL, NULL, NULL);
INSERT INTO `sys_student` VALUES (120, 127, '河北省-石家庄市-井陉矿区', '西南石油大学', '软件工程', '11', '0', '1', '0', NULL, 's7', '2023-02-22 22:23:17', NULL, NULL, NULL);

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint(0) NULL DEFAULT NULL COMMENT '职级ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime(0) NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 128 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 101, 'admin', '超级管理员', '00', '1113@qq.com', '17888888888', '0', '/profile/avatar/2023/02/07/blob_20230207114334A001.png', '$2a$10$MfCHxZI0OsCmWsXenye3xuHYdEV/G7ueHivZNt1P/OQCEmjmyEwDi', '0', '0', '127.0.0.1', '2023-02-23 18:17:59', 'admin', '2022-12-23 15:41:46', '', '2023-02-23 18:17:58', '1111111111');
INSERT INTO `sys_user` VALUES (2, 100, 'zty', '小张~', '00', 'z@qq.com', '13458838248', '0', '/profile/upload/2022/12/28/newUser_20221228193920A001.jpg', '$2a$10$/oC6txykcSjOXsXQ4HpiJucCSN9esefigccU0PX2gAM5YxfwY1Hbi', '0', '0', '127.0.0.1', '2023-02-23 18:40:20', 'admin', '2022-12-23 15:41:46', 'admin', '2023-02-23 18:40:19', '111112');
INSERT INTO `sys_user` VALUES (100, 100, 'fmj', '小冯', '00', 'fmj@zzz.com', '13060013573', '1', '/profile/upload/2022/12/29/2_20221229181125A001.jpg', '$2a$10$LiOt4aGRxwnUyKNJdN8Bq.DNTQ7nGpBVXZIviBlrQH5X7CFdNTK5G', '0', '0', '127.0.0.1', '2023-02-23 18:29:28', '', '2022-12-26 10:45:23', 'admin', '2023-02-23 18:29:28', '123');
INSERT INTO `sys_user` VALUES (110, 101, 'test1', 'test1', '00', '', '', '0', '/profile/upload/2023/02/05/newUser_20230205111848A001.jpg', '$2a$10$NDtATfLgSaVmwUKCUuKE6OkD2AvOwTwaLDvAerjRgh/sdq3is97/G', '0', '0', '127.0.0.1', '2023-02-05 17:25:57', '', '2023-01-10 12:38:15', 'admin', '2023-02-23 17:18:39', NULL);
INSERT INTO `sys_user` VALUES (111, 102, 'p1', 'p1', '00', '111@qq.com', '15688596523', '0', '/profile/upload/2023/01/10/3_20230110124552A001.jpg', '$2a$10$jJZBqrOx901JOWRCX9aWLOghWGNl/E3FI0chTdVwbd/j3onwYu.1u', '0', '0', '127.0.0.1', '2023-02-20 16:08:49', '', '2023-01-10 12:46:37', 'admin', '2023-02-23 17:19:19', NULL);
INSERT INTO `sys_user` VALUES (112, 101, 's1', 's1', '00', 'zty@qq.com', '13458865986', '1', '/profile/upload/2023/01/10/beautiful_20230110125023A001.png', '$2a$10$SsGgBM1bgTC5Vk/0M6JQC.gHAIZIWNGOT81O/gp.70O3CfjGVTe5y', '0', '0', '127.0.0.1', '2023-02-20 16:08:22', '', '2023-01-10 12:51:05', '', '2023-02-22 17:44:44', NULL);
INSERT INTO `sys_user` VALUES (113, 102, 's3', 's3', '00', '', '', '1', '/profile/upload/2023/01/17/newUser_20230117123535A001.jpg', '$2a$10$8/XSyoHquheWv6q/4I7gJ.ZPi0jJxUEj4Lmv518uB6kZdz3x8rg12', '0', '0', '', NULL, '', '2023-01-17 12:36:35', 'admin', '2023-02-22 22:26:00', NULL);
INSERT INTO `sys_user` VALUES (114, 101, 'p3', 'p3', '00', '', '', '0', '/profile/upload/2023/01/17/newUser_20230117123644A002.jpg', '$2a$10$e5vIwvL.t6LGspxEcojaZeLHtQa7qz3jZkY32lGVDYIfUg2oCRFDm', '0', '0', '', NULL, '', '2023-01-17 12:37:38', '', '2023-02-22 17:53:08', NULL);
INSERT INTO `sys_user` VALUES (115, 100, 's4', 's4', '00', '', '', '0', '/profile/upload/2023/02/06/newUser_20230206113352A005.jpg', '$2a$10$cwbBHhvfeJTKITQ0NTQY5OCUj4JfI/ttBC/SLyIp2vO4KMN9pMAqC', '0', '0', '', NULL, '', '2023-02-06 11:28:04', '', '2023-02-22 17:45:49', NULL);
INSERT INTO `sys_user` VALUES (116, 102, 's5', 's5', '00', 'z@qq.com', '120', '1', '/profile/upload/2023/02/06/newUser_20230206112826A001.jpg', '$2a$10$9Lrtokf.oGTCmg7Zpy9eNuzOu8rpScTsxIPytMS7OfRQsb1Q1eT/G', '0', '0', '127.0.0.1', '2023-02-06 20:42:02', '', '2023-02-06 11:29:02', '', '2023-02-22 17:45:13', NULL);
INSERT INTO `sys_user` VALUES (117, 101, 'p4', 'p4', '00', '', '', '0', '/profile/upload/2023/02/06/newUser_20230206112912A002.jpg', '$2a$10$Qb0q0WlKtOsmz/6dyxKbquDHQvFhEfreyERoEOy9jgYtir77/f6Vm', '0', '0', '', NULL, '', '2023-02-06 11:32:07', '', '2023-02-22 17:53:25', NULL);
INSERT INTO `sys_user` VALUES (118, 102, 'p5', 'p5', '00', '', '', '1', '/profile/upload/2023/02/06/newUser_20230206113214A003.jpg', '$2a$10$7NGp04CutccyYGOn6jz1W.XDeDZdDcyiPdC3wgLhoeNUj3dVt1vre', '0', '0', '127.0.0.1', '2023-02-13 15:04:34', '', '2023-02-06 11:32:47', '', '2023-02-22 17:53:41', NULL);
INSERT INTO `sys_user` VALUES (119, 102, 'p6', 'p6', '00', '', '', '1', '/profile/upload/2023/02/06/newUser_20230206113255A004.jpg', '$2a$10$K1Rko9f199KQiEvggpseG.hjVfCXx7DSYkMa.uQhyPuI2SwvSQHJK', '0', '0', '', NULL, '', '2023-02-06 11:33:26', '', '2023-02-22 22:12:22', NULL);
INSERT INTO `sys_user` VALUES (120, NULL, 'm1', 'm1', '00', 'zzzz@163.com', '13458869584', '0', '/profile/upload/2023/02/22/newUser_20230222115401A001.jpg', '$2a$10$.5.bjVc/kO2yApLbIF.5oevzghLwegVxecbeBfmIrj70PCrZgZUTK', '0', '0', '127.0.0.1', '2023-02-22 12:10:42', '', '2023-02-22 11:54:05', '', '2023-02-22 12:10:42', '123');
INSERT INTO `sys_user` VALUES (121, 101, 'p7', 'p7', '00', 'zzz@163.com', '13458896524', '1', '/profile/upload/2023/02/22/newUser_20230222180252A002.jpg', '$2a$10$R9u5Onv17mVXmhzpq57Wk.jqVgC51m1eSpomfY9fn3jsDmuSrXxkK', '0', '0', '127.0.0.1', '2023-02-23 17:15:20', '', '2023-02-22 18:03:28', 'admin', '2023-02-23 17:16:20', '0');
INSERT INTO `sys_user` VALUES (122, NULL, 'm2', 'm2', '00', 'zzzz@111.com', '15422653254', '1', '/profile/upload/2023/02/22/newUser_20230222181230A003.jpg', '$2a$10$5fmd45kawpl74uvgdxNEfOFnkhqsuZOzU5xdFbNIkDn8IxwqcOiUW', '0', '0', '', NULL, '', '2023-02-22 18:12:33', 'admin', '2023-02-22 18:35:57', '111');
INSERT INTO `sys_user` VALUES (123, NULL, 'm3', 'm3', '00', 'qqq@163.com', '13542687546', '1', '/profile/upload/2023/02/22/newUser_20230222182230A001.jpg', '$2a$10$oKA77u3G.UeH91YZtVGMWemp94kIZPU852tdEULAdfcdCQ2g50cmq', '0', '0', '', NULL, '', '2023-02-22 18:22:34', 'admin', '2023-02-22 18:36:04', '111');
INSERT INTO `sys_user` VALUES (124, 102, 's6', 's6', '00', '555@163.com', '1235475698', '1', '/profile/upload/2023/02/22/newUser_20230222182330A002.jpg', '$2a$10$bR0Yclz8/vO4Zfvt/Yy51.9ml.onVuuIn/MM5lU1RW3T9/4aBIgiq', '0', '0', '', NULL, '', '2023-02-22 18:24:04', 'admin', '2023-02-22 18:42:45', '11');
INSERT INTO `sys_user` VALUES (125, 101, 'p8', 'p8', '00', '', '', '0', '/profile/upload/2023/02/22/newUser_20230222182525A003.jpg', '$2a$10$aFJvCi9Obna/1ZPzQ6wgp.O4jbZkbg9P3rusYn9V6LUW3.afBT2P6', '0', '0', '127.0.0.1', '2023-02-22 18:36:24', '', '2023-02-22 18:25:48', 'admin', '2023-02-22 18:43:10', '1');
INSERT INTO `sys_user` VALUES (126, 100, 'p9', 'p9', '00', 'zty@qq.com', '13435698546', '0', '/profile/upload/2023/02/22/newUser_20230222193414A005.jpg', '$2a$10$z1m9xngiUPVQHTAto5ju7eLaSxxGI7lVG5i/BKC/XF8IR1jHeH8OS', '0', '0', '', NULL, '', '2023-02-22 19:35:59', '', '2023-02-22 19:37:38', NULL);
INSERT INTO `sys_user` VALUES (127, 101, 's7', 's7', '00', 'zty@qq.com', '13652469854', '1', '/profile/upload/2023/02/22/newUser_20230222193952A006.jpg', '$2a$10$GFibE/LULO9x1/Wu6NeB.OljLC7cFHuwi.LqnZepSKhejYv2oUWQK', '0', '0', '127.0.0.1', '2023-02-22 22:19:39', '', '2023-02-22 19:41:04', '', '2023-02-22 22:23:17', NULL);

-- ----------------------------
-- Table structure for sys_user_collect
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_collect`;
CREATE TABLE `sys_user_collect`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `collect_id` bigint(0) NOT NULL COMMENT '点赞用户id',
  PRIMARY KEY (`user_id`, `collect_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户收藏关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_collect
-- ----------------------------
INSERT INTO `sys_user_collect` VALUES (1, 2);
INSERT INTO `sys_user_collect` VALUES (1, 100);
INSERT INTO `sys_user_collect` VALUES (1, 110);
INSERT INTO `sys_user_collect` VALUES (1, 111);
INSERT INTO `sys_user_collect` VALUES (1, 112);
INSERT INTO `sys_user_collect` VALUES (1, 114);
INSERT INTO `sys_user_collect` VALUES (2, 100);
INSERT INTO `sys_user_collect` VALUES (2, 118);
INSERT INTO `sys_user_collect` VALUES (100, 2);

-- ----------------------------
-- Table structure for sys_user_deposit
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_deposit`;
CREATE TABLE `sys_user_deposit`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户押金信息表ID',
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `balance` decimal(10, 2) NOT NULL COMMENT '押金余额',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '' COMMENT '交易密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '余额状态（0代表可用 1代表冻结）',
  `update_time` datetime(0) NULL DEFAULT NULL COMMENT '最近操作时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户押金信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_deposit
-- ----------------------------
INSERT INTO `sys_user_deposit` VALUES (4, 1, 1200.00, '$2a$10$HWVf8HUA2685xssPrYhdt.5uldxEYHnhP6uBMZsa6A95eZfg2jBiS', '0', '2023-02-20 15:28:10');
INSERT INTO `sys_user_deposit` VALUES (5, 2, 1000.00, '$2a$10$.4enmk6hvb0gK3yJ/XdKXetuEqrLlAZ6VqQ/7zvHo0VzYL6fpObBq', '1', '2023-02-21 10:24:24');
INSERT INTO `sys_user_deposit` VALUES (7, 100, 900.00, '$2a$10$0eZ3tab/9dABy93U.oSvkOD2LPehqCMnzoYyoRm/FohdzO823BBYy', '1', '2023-02-21 10:24:28');
INSERT INTO `sys_user_deposit` VALUES (8, 112, 800.00, '$2a$10$FQn7vb0uloBAN2umxixHVebkYU2lBcnoUtYlNNownJGSUCEHLjXUq', '0', '2023-02-21 10:24:31');
INSERT INTO `sys_user_deposit` VALUES (9, 111, 1000.00, '$2a$10$RKG4nOGbz3bnJes5jrMKeOPJmy5mQP6lLF5h0lpIVPzCpRjPbf9Va', '0', '2023-02-21 10:24:34');

-- ----------------------------
-- Table structure for sys_user_leave
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_leave`;
CREATE TABLE `sys_user_leave`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '留言信息表ID',
  `send_id` bigint(0) NOT NULL COMMENT '留言用户ID',
  `send_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '留言用户账户名',
  `received_id` bigint(0) NOT NULL COMMENT '被留言用户id',
  `received_username` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '被留言用户账户名',
  `context` longblob NULL COMMENT '留言内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '读取状态（0代表未读 2代表已读）',
  `create_time` datetime(0) NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户留言信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_leave
-- ----------------------------
INSERT INTO `sys_user_leave` VALUES (2, 1, 'admin', 111, 'p1', 0x3C703EE9A29DE9B985E9B985E9B9853C2F703E, '0', '2023-02-13 11:07:03');
INSERT INTO `sys_user_leave` VALUES (3, 1, 'admin', 116, 's5', 0x3C703E31313232323C2F703E, '0', '2023-02-13 11:12:43');
INSERT INTO `sys_user_leave` VALUES (4, 1, 'admin', 100, 'fmj', 0x3C703E32323232323233333C2F703E, '1', '2023-02-13 11:13:12');
INSERT INTO `sys_user_leave` VALUES (5, 2, 'zty', 100, 'fmj', 0x3C68313E35353535353C7370616E207374796C653D22636F6C6F723A20726762283233302C20302C2030293B223E3536353636353C2F7370616E3E3C2F68313E, '1', '2023-02-13 11:16:48');
INSERT INTO `sys_user_leave` VALUES (8, 1, 'admin', 114, 'p3', 0x3C703EE78FADE5B9B2E983A83C2F703E, '0', '2023-02-13 11:28:21');
INSERT INTO `sys_user_leave` VALUES (10, 2, 'zty', 118, 'p5', 0x3C703E3C7370616E207374796C653D22636F6C6F723A20726762283235352C203139342C20313032293B223EE79A84E68890E5A4A7563C2F7370616E3E3C696D67207372633D222F6465762D6170692F70726F66696C652F75706C6F61642F323032332F30322F31332F6E6577557365725F3230323330323133313534303339413030322E6A7067223E3C2F703E, '1', '2023-02-13 11:33:33');
INSERT INTO `sys_user_leave` VALUES (12, 1, 'admin', 112, 's1', 0x3C68313E31323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323232323C2F68313E, '0', '2023-02-13 11:56:48');
INSERT INTO `sys_user_leave` VALUES (13, 100, 'fmj', 2, 'zty', 0x3C703E3132333C2F703E, '1', '2023-02-13 15:02:07');
INSERT INTO `sys_user_leave` VALUES (15, 1, 'admin', 2, 'zty', 0x3C703EE59388E59388E593883C2F703E, '0', '2023-02-21 16:50:45');
INSERT INTO `sys_user_leave` VALUES (16, 1, 'admin', 2, 'zty', 0x3C703EE4BDA0E5A5BDE59180EFBC81EFBC81EFBC81EFBC813C2F703E, '1', '2023-02-21 16:50:53');

-- ----------------------------
-- Table structure for sys_user_like
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_like`;
CREATE TABLE `sys_user_like`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `like_id` bigint(0) NOT NULL COMMENT '点赞用户id',
  PRIMARY KEY (`user_id`, `like_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户点赞关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_like
-- ----------------------------
INSERT INTO `sys_user_like` VALUES (1, 100);
INSERT INTO `sys_user_like` VALUES (1, 111);
INSERT INTO `sys_user_like` VALUES (1, 116);
INSERT INTO `sys_user_like` VALUES (1, 126);
INSERT INTO `sys_user_like` VALUES (2, 100);
INSERT INTO `sys_user_like` VALUES (2, 114);
INSERT INTO `sys_user_like` VALUES (2, 118);
INSERT INTO `sys_user_like` VALUES (100, 2);
INSERT INTO `sys_user_like` VALUES (100, 112);

-- ----------------------------
-- Table structure for sys_user_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_order`;
CREATE TABLE `sys_user_order`  (
  `id` bigint(0) NOT NULL AUTO_INCREMENT COMMENT '用户下单信息表ID',
  `student_id` bigint(0) NOT NULL COMMENT '大学生用户ID',
  `parent_id` bigint(0) NOT NULL COMMENT '家长（学员）用户ID',
  `student_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单大学生方状态（0代表初始 1代表确认 2代表取消 3代表完成 4代表违约中）',
  `parent_status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单学员方状态（0代表初始 1代表确认 2代表取消 3代表完成 4代表违约中）',
  `amount` decimal(10, 2) NOT NULL COMMENT '订单金额',
  `promise` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '订单双方约定',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT '0' COMMENT '订单总状态（0代表初始 1代表确认 2代表取消 3代表完成 4代表违约中）',
  `order_time` datetime(0) NULL DEFAULT NULL COMMENT '下单时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 8 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户下单信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_order
-- ----------------------------
INSERT INTO `sys_user_order` VALUES (6, 2, 100, '0', '0', 400.00, '00', '0', '2023-02-20 17:10:30');
INSERT INTO `sys_user_order` VALUES (7, 112, 111, '0', '0', 100.00, '1', '2', '2023-02-20 18:34:40');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `post_id` bigint(0) NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);
INSERT INTO `sys_user_post` VALUES (1, 2);
INSERT INTO `sys_user_post` VALUES (2, 1);
INSERT INTO `sys_user_post` VALUES (2, 3);
INSERT INTO `sys_user_post` VALUES (100, 1);
INSERT INTO `sys_user_post` VALUES (100, 2);
INSERT INTO `sys_user_post` VALUES (110, 1);
INSERT INTO `sys_user_post` VALUES (110, 2);
INSERT INTO `sys_user_post` VALUES (111, 2);
INSERT INTO `sys_user_post` VALUES (112, 2);
INSERT INTO `sys_user_post` VALUES (112, 3);
INSERT INTO `sys_user_post` VALUES (113, 3);
INSERT INTO `sys_user_post` VALUES (114, 3);
INSERT INTO `sys_user_post` VALUES (115, 1);
INSERT INTO `sys_user_post` VALUES (116, 2);
INSERT INTO `sys_user_post` VALUES (116, 3);
INSERT INTO `sys_user_post` VALUES (117, 2);
INSERT INTO `sys_user_post` VALUES (117, 3);
INSERT INTO `sys_user_post` VALUES (118, 2);
INSERT INTO `sys_user_post` VALUES (119, 3);
INSERT INTO `sys_user_post` VALUES (121, 1);
INSERT INTO `sys_user_post` VALUES (121, 2);
INSERT INTO `sys_user_post` VALUES (124, 1);
INSERT INTO `sys_user_post` VALUES (124, 2);
INSERT INTO `sys_user_post` VALUES (125, 1);
INSERT INTO `sys_user_post` VALUES (125, 3);
INSERT INTO `sys_user_post` VALUES (126, 1);
INSERT INTO `sys_user_post` VALUES (126, 3);
INSERT INTO `sys_user_post` VALUES (127, 1);
INSERT INTO `sys_user_post` VALUES (127, 3);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint(0) NOT NULL COMMENT '用户ID',
  `role_id` bigint(0) NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 3);
INSERT INTO `sys_user_role` VALUES (100, 4);
INSERT INTO `sys_user_role` VALUES (110, 3);
INSERT INTO `sys_user_role` VALUES (111, 4);
INSERT INTO `sys_user_role` VALUES (112, 3);
INSERT INTO `sys_user_role` VALUES (113, 3);
INSERT INTO `sys_user_role` VALUES (114, 4);
INSERT INTO `sys_user_role` VALUES (115, 3);
INSERT INTO `sys_user_role` VALUES (116, 3);
INSERT INTO `sys_user_role` VALUES (117, 4);
INSERT INTO `sys_user_role` VALUES (118, 4);
INSERT INTO `sys_user_role` VALUES (119, 4);
INSERT INTO `sys_user_role` VALUES (120, 2);
INSERT INTO `sys_user_role` VALUES (121, 4);
INSERT INTO `sys_user_role` VALUES (122, 2);
INSERT INTO `sys_user_role` VALUES (123, 2);
INSERT INTO `sys_user_role` VALUES (124, 3);
INSERT INTO `sys_user_role` VALUES (125, 4);
INSERT INTO `sys_user_role` VALUES (126, 4);
INSERT INTO `sys_user_role` VALUES (127, 3);

SET FOREIGN_KEY_CHECKS = 1;
