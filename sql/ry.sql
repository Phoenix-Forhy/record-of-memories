/*
 Navicat Premium Data Transfer

 Source Server         : 第一个sql
 Source Server Type    : MySQL
 Source Server Version : 80033
 Source Host           : 10.10.10.4:3306
 Source Schema         : ry

 Target Server Type    : MySQL
 Target Server Version : 80033
 File Encoding         : 65001

 Date: 27/03/2024 12:03:24
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for QRTZ_BLOB_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_BLOB_TRIGGERS`;
CREATE TABLE `QRTZ_BLOB_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `blob_data` blob NULL COMMENT '存放持久化Trigger对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_BLOB_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Blob类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_BLOB_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CALENDARS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CALENDARS`;
CREATE TABLE `QRTZ_CALENDARS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '日历名称',
  `calendar` blob NOT NULL COMMENT '存放持久化calendar对象',
  PRIMARY KEY (`sched_name`, `calendar_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '日历信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CALENDARS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_CRON_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_CRON_TRIGGERS`;
CREATE TABLE `QRTZ_CRON_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `cron_expression` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'cron表达式',
  `time_zone_id` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '时区',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_CRON_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = 'Cron类型的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_CRON_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_FIRED_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_FIRED_TRIGGERS`;
CREATE TABLE `QRTZ_FIRED_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `entry_id` varchar(95) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例id',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度器实例名',
  `fired_time` bigint NOT NULL COMMENT '触发的时间',
  `sched_time` bigint NOT NULL COMMENT '定时器制定的时间',
  `priority` int NOT NULL COMMENT '优先级',
  `state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '任务组名',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否并发',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否接受恢复执行',
  PRIMARY KEY (`sched_name`, `entry_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '已触发的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_FIRED_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_JOB_DETAILS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_JOB_DETAILS`;
CREATE TABLE `QRTZ_JOB_DETAILS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `job_class_name` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '执行任务类名称',
  `is_durable` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否持久化',
  `is_nonconcurrent` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否并发',
  `is_update_data` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否更新数据',
  `requests_recovery` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '是否接受恢复执行',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '任务详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_JOB_DETAILS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_LOCKS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_LOCKS`;
CREATE TABLE `QRTZ_LOCKS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `lock_name` varchar(40) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '悲观锁名称',
  PRIMARY KEY (`sched_name`, `lock_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '存储的悲观锁信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_LOCKS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_PAUSED_TRIGGER_GRPS`;
CREATE TABLE `QRTZ_PAUSED_TRIGGER_GRPS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  PRIMARY KEY (`sched_name`, `trigger_group`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '暂停的触发器表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_PAUSED_TRIGGER_GRPS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SCHEDULER_STATE
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SCHEDULER_STATE`;
CREATE TABLE `QRTZ_SCHEDULER_STATE`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `instance_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '实例名称',
  `last_checkin_time` bigint NOT NULL COMMENT '上次检查时间',
  `checkin_interval` bigint NOT NULL COMMENT '检查间隔时间',
  PRIMARY KEY (`sched_name`, `instance_name`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '调度器状态表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SCHEDULER_STATE
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPLE_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPLE_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPLE_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `repeat_count` bigint NOT NULL COMMENT '重复的次数统计',
  `repeat_interval` bigint NOT NULL COMMENT '重复的间隔时间',
  `times_triggered` bigint NOT NULL COMMENT '已经触发的次数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPLE_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '简单触发器的信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPLE_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_SIMPROP_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_SIMPROP_TRIGGERS`;
CREATE TABLE `QRTZ_SIMPROP_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_name的外键',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_triggers表trigger_group的外键',
  `str_prop_1` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第一个参数',
  `str_prop_2` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第二个参数',
  `str_prop_3` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'String类型的trigger的第三个参数',
  `int_prop_1` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第一个参数',
  `int_prop_2` int NULL DEFAULT NULL COMMENT 'int类型的trigger的第二个参数',
  `long_prop_1` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第一个参数',
  `long_prop_2` bigint NULL DEFAULT NULL COMMENT 'long类型的trigger的第二个参数',
  `dec_prop_1` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第一个参数',
  `dec_prop_2` decimal(13, 4) NULL DEFAULT NULL COMMENT 'decimal类型的trigger的第二个参数',
  `bool_prop_1` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第一个参数',
  `bool_prop_2` varchar(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'Boolean类型的trigger的第二个参数',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  CONSTRAINT `QRTZ_SIMPROP_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `trigger_name`, `trigger_group`) REFERENCES `QRTZ_TRIGGERS` (`sched_name`, `trigger_name`, `trigger_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '同步机制的行锁表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_SIMPROP_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for QRTZ_TRIGGERS
-- ----------------------------
DROP TABLE IF EXISTS `QRTZ_TRIGGERS`;
CREATE TABLE `QRTZ_TRIGGERS`  (
  `sched_name` varchar(120) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调度名称',
  `trigger_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的名字',
  `trigger_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器所属组的名字',
  `job_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_name的外键',
  `job_group` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT 'qrtz_job_details表job_group的外键',
  `description` varchar(250) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '相关介绍',
  `next_fire_time` bigint NULL DEFAULT NULL COMMENT '上一次触发时间（毫秒）',
  `prev_fire_time` bigint NULL DEFAULT NULL COMMENT '下一次触发时间（默认为-1表示不触发）',
  `priority` int NULL DEFAULT NULL COMMENT '优先级',
  `trigger_state` varchar(16) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器状态',
  `trigger_type` varchar(8) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '触发器的类型',
  `start_time` bigint NOT NULL COMMENT '开始时间',
  `end_time` bigint NULL DEFAULT NULL COMMENT '结束时间',
  `calendar_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日程表名称',
  `misfire_instr` smallint NULL DEFAULT NULL COMMENT '补偿执行的策略',
  `job_data` blob NULL COMMENT '存放持久化job对象',
  PRIMARY KEY (`sched_name`, `trigger_name`, `trigger_group`) USING BTREE,
  INDEX `sched_name`(`sched_name` ASC, `job_name` ASC, `job_group` ASC) USING BTREE,
  CONSTRAINT `QRTZ_TRIGGERS_ibfk_1` FOREIGN KEY (`sched_name`, `job_name`, `job_group`) REFERENCES `QRTZ_JOB_DETAILS` (`sched_name`, `job_name`, `job_group`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '触发器详细信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of QRTZ_TRIGGERS
-- ----------------------------

-- ----------------------------
-- Table structure for gen_table
-- ----------------------------
DROP TABLE IF EXISTS `gen_table`;
CREATE TABLE `gen_table`  (
  `table_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表名称',
  `table_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '表描述',
  `sub_table_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '关联子表的表名',
  `sub_table_fk_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '子表关联的外键名',
  `class_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '实体类名称',
  `tpl_category` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'crud' COMMENT '使用的模板（crud单表操作 tree树表操作）',
  `tpl_web_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '前端模板类型（element-ui模版 element-plus模版）',
  `package_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成包路径',
  `module_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成模块名',
  `business_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成业务名',
  `function_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能名',
  `function_author` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '生成功能作者',
  `gen_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '生成代码方式（0zip压缩包 1自定义路径）',
  `gen_path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '/' COMMENT '生成路径（不填默认项目路径）',
  `options` varchar(1000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '其它生成选项',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`table_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table
-- ----------------------------
INSERT INTO `gen_table` VALUES (5, 'recollections', '回忆录表', NULL, NULL, 'Recollections', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'recollections', '回忆录', '栖凰', '0', '/', '{\"parentMenuId\":2032}', 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56', NULL);
INSERT INTO `gen_table` VALUES (6, 'memory', '回忆表', NULL, NULL, 'Memory', 'crud', 'element-ui', 'com.ruoyi.system', 'system', 'memory', '回忆', '栖凰', '0', '/', '{\"parentMenuId\":2032}', 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10', NULL);

-- ----------------------------
-- Table structure for gen_table_column
-- ----------------------------
DROP TABLE IF EXISTS `gen_table_column`;
CREATE TABLE `gen_table_column`  (
  `column_id` bigint NOT NULL AUTO_INCREMENT COMMENT '编号',
  `table_id` bigint NULL DEFAULT NULL COMMENT '归属表编号',
  `column_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列名称',
  `column_comment` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列描述',
  `column_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '列类型',
  `java_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA类型',
  `java_field` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT 'JAVA字段名',
  `is_pk` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否主键（1是）',
  `is_increment` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否自增（1是）',
  `is_required` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否必填（1是）',
  `is_insert` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否为插入字段（1是）',
  `is_edit` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否编辑字段（1是）',
  `is_list` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否列表字段（1是）',
  `is_query` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '是否查询字段（1是）',
  `query_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'EQ' COMMENT '查询方式（等于、不等于、大于、小于、范围）',
  `html_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '显示类型（文本框、文本域、下拉框、复选框、单选框、日期控件）',
  `dict_type` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `sort` int NULL DEFAULT NULL COMMENT '排序',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`column_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 16 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '代码生成业务表字段' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of gen_table_column
-- ----------------------------
INSERT INTO `gen_table_column` VALUES (17, 5, 'recollection_id', '回忆录id', 'bigint', 'Long', 'recollectionId', '1', '1', '0', '0', NULL, '1', '0', 'EQ', 'input', '', 1, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (18, 5, 'recollection_name', '回忆录名称', 'varchar(64)', 'String', 'recollectionName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (19, 5, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '1', '1', NULL, '1', NULL, 'EQ', 'select', 'we', 3, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (20, 5, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', NULL, 'EQ', 'datetime', '', 4, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (21, 5, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '0', '0', NULL, 'EQ', 'input', '', 5, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (22, 5, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', '0', NULL, 'EQ', 'datetime', '', 6, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (23, 5, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'textarea', '', 7, 'admin', '2024-03-26 14:07:41', '', '2024-03-26 15:02:56');
INSERT INTO `gen_table_column` VALUES (24, 6, 'memory_id', '回忆id', 'bigint', 'Long', 'memoryId', '1', '1', '0', '0', NULL, '1', NULL, 'EQ', 'input', '', 1, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (25, 6, 'memory_name', '回忆名', 'varchar(64)', 'String', 'memoryName', '0', '0', '1', '1', '1', '1', '1', 'LIKE', 'input', '', 2, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (26, 6, 'memory_img', '回忆图片', 'varchar(128)', 'String', 'memoryImg', '0', '0', '0', '1', '1', '1', '0', 'EQ', 'imageUpload', '', 3, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (27, 6, 'memory_time', '持续时间', 'time', 'Date', 'memoryTime', '0', '0', '0', '1', '1', '1', '1', 'BETWEEN', 'datetime', '', 4, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (28, 6, 'recollection_id', '回忆录id', 'bigint', 'Long', 'recollectionId', '0', '0', '1', '1', '1', '1', '1', 'EQ', 'select', '', 5, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (29, 6, 'create_by', '创建者', 'varchar(64)', 'String', 'createBy', '0', '0', '0', '1', '1', '1', '1', 'EQ', 'input', 'we', 6, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (30, 6, 'create_time', '创建时间', 'datetime', 'Date', 'createTime', '0', '0', '0', '0', NULL, '1', '1', 'BETWEEN', 'datetime', '', 7, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (31, 6, 'update_by', '更新者', 'varchar(64)', 'String', 'updateBy', '0', '0', '0', '0', '1', '1', '0', 'EQ', 'select', 'we', 8, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (32, 6, 'update_time', '更新时间', 'datetime', 'Date', 'updateTime', '0', '0', '0', '0', '0', NULL, NULL, 'EQ', 'datetime', '', 9, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');
INSERT INTO `gen_table_column` VALUES (33, 6, 'remark', '备注', 'varchar(500)', 'String', 'remark', '0', '0', '0', '1', '1', '1', '1', 'LIKE', 'textarea', '', 10, 'admin', '2024-03-26 15:51:01', '', '2024-03-26 15:55:10');

-- ----------------------------
-- Table structure for memory
-- ----------------------------
DROP TABLE IF EXISTS `memory`;
CREATE TABLE `memory`  (
  `memory_id` bigint NOT NULL AUTO_INCREMENT COMMENT '回忆id',
  `memory_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '回忆名',
  `memory_img` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '回忆图片',
  `memory_time` time NULL DEFAULT NULL COMMENT '持续时间',
  `recollection_id` bigint NULL DEFAULT NULL COMMENT '回忆录id',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`memory_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1001 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回忆表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of memory
-- ----------------------------
INSERT INTO `memory` VALUES (1000, '25号晚', '/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg', '11:59:53', 200, '0', '2024-03-26 17:34:43', '', '2024-03-26 18:37:49', '今晚聊了下被表白的情感经历，尝试了一下不断电话，事实证明只要亮着屏幕就不会挂，但是26号中午还是一不小心中断了，遗憾没能到12小时，更遗憾没能坚持到清言回家');

-- ----------------------------
-- Table structure for recollections
-- ----------------------------
DROP TABLE IF EXISTS `recollections`;
CREATE TABLE `recollections`  (
  `recollection_id` bigint NOT NULL AUTO_INCREMENT COMMENT '回忆录id',
  `recollection_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '回忆录名称',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`recollection_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '回忆录表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of recollections
-- ----------------------------
INSERT INTO `recollections` VALUES (200, '微信通话', '0', '2024-03-26 15:15:33', '', '2024-03-26 15:50:38', NULL);
INSERT INTO `recollections` VALUES (201, '光遇', '0', '2024-03-26 15:50:48', '', NULL, NULL);

-- ----------------------------
-- Table structure for sys_config
-- ----------------------------
DROP TABLE IF EXISTS `sys_config`;
CREATE TABLE `sys_config`  (
  `config_id` int NOT NULL AUTO_INCREMENT COMMENT '参数主键',
  `config_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数名称',
  `config_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键名',
  `config_value` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '参数键值',
  `config_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '系统内置（Y是 N否）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`config_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '参数配置表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_config
-- ----------------------------
INSERT INTO `sys_config` VALUES (1, '主框架页-默认皮肤样式名称', 'sys.index.skinName', 'skin-blue', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '蓝色 skin-blue、绿色 skin-green、紫色 skin-purple、红色 skin-red、黄色 skin-yellow');
INSERT INTO `sys_config` VALUES (2, '用户管理-账号初始密码', 'sys.user.initPassword', '123456', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '初始化密码 123456');
INSERT INTO `sys_config` VALUES (3, '主框架页-侧边栏主题', 'sys.index.sideTheme', 'theme-dark', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '深色主题theme-dark，浅色主题theme-light');
INSERT INTO `sys_config` VALUES (4, '账号自助-验证码开关', 'sys.account.captchaEnabled', 'true', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '是否开启验证码功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (5, '账号自助-是否开启用户注册功能', 'sys.account.registerUser', 'false', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '是否开启注册用户功能（true开启，false关闭）');
INSERT INTO `sys_config` VALUES (6, '用户登录-黑名单列表', 'sys.login.blackIPList', '', 'Y', 'admin', '2024-03-20 09:39:53', '', NULL, '设置登录IP黑名单限制，多个匹配项以;分隔，支持匹配（*通配、网段）');

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept`  (
  `dept_id` bigint NOT NULL AUTO_INCREMENT COMMENT '部门id',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父部门id',
  `ancestors` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '祖级列表',
  `dept_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `leader` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '负责人',
  `phone` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '联系电话',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '邮箱',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '部门状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`dept_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 200 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '部门表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES (100, 0, '0', '世界美好收集委员会', 0, '栖凰凰', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 16:47:37');
INSERT INTO `sys_dept` VALUES (101, 100, '0,100', '流光忆庭', 1, '清言', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 16:50:39');
INSERT INTO `sys_dept` VALUES (102, 100, '0,100', '长沙分公司', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (103, 101, '0,100,101', '忆质收集部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 16:51:08');
INSERT INTO `sys_dept` VALUES (104, 101, '0,100,101', '市场部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (105, 101, '0,100,101', '测试部门', 3, '若依', '15888888888', 'ry@qq.com', '0', '0', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (106, 101, '0,100,101', '财务部门', 4, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (107, 101, '0,100,101', '运维部门', 5, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (108, 102, '0,100,102', '市场部门', 1, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (109, 102, '0,100,102', '财务部门', 2, '若依', '15888888888', 'ry@qq.com', '0', '2', 'admin', '2024-03-20 09:39:53', '', NULL);
INSERT INTO `sys_dept` VALUES (200, 100, '0,100', '流光忆庭', 1, '栖凰', NULL, NULL, '0', '2', 'admin', '2024-03-26 16:47:11', '', NULL);
INSERT INTO `sys_dept` VALUES (201, 100, '0,100', '为往圣继绝学', 1, NULL, NULL, NULL, '0', '0', 'admin', '2024-03-26 16:51:45', '', NULL);

-- ----------------------------
-- Table structure for sys_dict_data
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_data`;
CREATE TABLE `sys_dict_data`  (
  `dict_code` bigint NOT NULL AUTO_INCREMENT COMMENT '字典编码',
  `dict_sort` int NULL DEFAULT 0 COMMENT '字典排序',
  `dict_label` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典标签',
  `dict_value` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典键值',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `css_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '样式属性（其他样式扩展）',
  `list_class` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '表格回显样式',
  `is_default` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT 'N' COMMENT '是否默认（Y是 N否）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_code`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 103 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_data
-- ----------------------------
INSERT INTO `sys_dict_data` VALUES (1, 1, '男', '0', 'sys_user_sex', '', '', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '性别男');
INSERT INTO `sys_dict_data` VALUES (2, 2, '女', '1', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '性别女');
INSERT INTO `sys_dict_data` VALUES (3, 3, '未知', '2', 'sys_user_sex', '', '', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '性别未知');
INSERT INTO `sys_dict_data` VALUES (4, 1, '显示', '0', 'sys_show_hide', '', 'primary', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '显示菜单');
INSERT INTO `sys_dict_data` VALUES (5, 2, '隐藏', '1', 'sys_show_hide', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '隐藏菜单');
INSERT INTO `sys_dict_data` VALUES (6, 1, '正常', '0', 'sys_normal_disable', '', 'primary', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (7, 2, '停用', '1', 'sys_normal_disable', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (8, 1, '正常', '0', 'sys_job_status', '', 'primary', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (9, 2, '暂停', '1', 'sys_job_status', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (10, 1, '默认', 'DEFAULT', 'sys_job_group', '', '', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '默认分组');
INSERT INTO `sys_dict_data` VALUES (11, 2, '系统', 'SYSTEM', 'sys_job_group', '', '', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '系统分组');
INSERT INTO `sys_dict_data` VALUES (12, 1, '是', 'Y', 'sys_yes_no', '', 'primary', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '系统默认是');
INSERT INTO `sys_dict_data` VALUES (13, 2, '否', 'N', 'sys_yes_no', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '系统默认否');
INSERT INTO `sys_dict_data` VALUES (14, 1, '通知', '1', 'sys_notice_type', '', 'warning', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '通知');
INSERT INTO `sys_dict_data` VALUES (15, 2, '公告', '2', 'sys_notice_type', '', 'success', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '公告');
INSERT INTO `sys_dict_data` VALUES (16, 1, '正常', '0', 'sys_notice_status', '', 'primary', 'Y', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (17, 2, '关闭', '1', 'sys_notice_status', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '关闭状态');
INSERT INTO `sys_dict_data` VALUES (18, 99, '其他', '0', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '其他操作');
INSERT INTO `sys_dict_data` VALUES (19, 1, '新增', '1', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '新增操作');
INSERT INTO `sys_dict_data` VALUES (20, 2, '修改', '2', 'sys_oper_type', '', 'info', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '修改操作');
INSERT INTO `sys_dict_data` VALUES (21, 3, '删除', '3', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '删除操作');
INSERT INTO `sys_dict_data` VALUES (22, 4, '授权', '4', 'sys_oper_type', '', 'primary', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '授权操作');
INSERT INTO `sys_dict_data` VALUES (23, 5, '导出', '5', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '导出操作');
INSERT INTO `sys_dict_data` VALUES (24, 6, '导入', '6', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '导入操作');
INSERT INTO `sys_dict_data` VALUES (25, 7, '强退', '7', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '强退操作');
INSERT INTO `sys_dict_data` VALUES (26, 8, '生成代码', '8', 'sys_oper_type', '', 'warning', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '生成操作');
INSERT INTO `sys_dict_data` VALUES (27, 9, '清空数据', '9', 'sys_oper_type', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '清空操作');
INSERT INTO `sys_dict_data` VALUES (28, 1, '成功', '0', 'sys_common_status', '', 'primary', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '正常状态');
INSERT INTO `sys_dict_data` VALUES (29, 2, '失败', '1', 'sys_common_status', '', 'danger', 'N', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '停用状态');
INSERT INTO `sys_dict_data` VALUES (100, 1, '开朗', '1', 'temperament', NULL, 'default', 'N', '0', 'admin', '2024-03-20 13:48:18', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (101, 2, '内向', '2', 'temperament', NULL, 'default', 'N', '0', 'admin', '2024-03-20 13:48:28', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (102, 1, 'IndianRed', '#CD5C5C', 'color', NULL, 'default', 'N', '0', 'admin', '2024-03-22 13:52:12', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (103, 0, '清言', '1', 'we', NULL, 'success', 'N', '0', 'admin', '2024-03-26 14:12:15', '', NULL, NULL);
INSERT INTO `sys_dict_data` VALUES (104, 1, '栖凰', '0', 'we', NULL, 'primary', 'N', '0', 'admin', '2024-03-26 14:12:30', 'admin', '2024-03-26 14:12:52', NULL);

-- ----------------------------
-- Table structure for sys_dict_type
-- ----------------------------
DROP TABLE IF EXISTS `sys_dict_type`;
CREATE TABLE `sys_dict_type`  (
  `dict_id` bigint NOT NULL AUTO_INCREMENT COMMENT '字典主键',
  `dict_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典名称',
  `dict_type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '字典类型',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`dict_id`) USING BTREE,
  UNIQUE INDEX `dict_type`(`dict_type` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 102 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '字典类型表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_dict_type
-- ----------------------------
INSERT INTO `sys_dict_type` VALUES (1, '用户性别', 'sys_user_sex', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '用户性别列表');
INSERT INTO `sys_dict_type` VALUES (2, '菜单状态', 'sys_show_hide', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '菜单状态列表');
INSERT INTO `sys_dict_type` VALUES (3, '系统开关', 'sys_normal_disable', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '系统开关列表');
INSERT INTO `sys_dict_type` VALUES (4, '任务状态', 'sys_job_status', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '任务状态列表');
INSERT INTO `sys_dict_type` VALUES (5, '任务分组', 'sys_job_group', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '任务分组列表');
INSERT INTO `sys_dict_type` VALUES (6, '系统是否', 'sys_yes_no', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '系统是否列表');
INSERT INTO `sys_dict_type` VALUES (7, '通知类型', 'sys_notice_type', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '通知类型列表');
INSERT INTO `sys_dict_type` VALUES (8, '通知状态', 'sys_notice_status', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '通知状态列表');
INSERT INTO `sys_dict_type` VALUES (9, '操作类型', 'sys_oper_type', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '操作类型列表');
INSERT INTO `sys_dict_type` VALUES (10, '系统状态', 'sys_common_status', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '登录状态列表');
INSERT INTO `sys_dict_type` VALUES (100, '性格', 'temperament', '0', 'admin', '2024-03-20 13:48:00', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (101, '颜色', 'color', '0', 'admin', '2024-03-22 13:51:41', '', NULL, NULL);
INSERT INTO `sys_dict_type` VALUES (102, '我们', 'we', '0', 'admin', '2024-03-26 14:11:19', '', NULL, '缘不知何起，不知何往');

-- ----------------------------
-- Table structure for sys_job
-- ----------------------------
DROP TABLE IF EXISTS `sys_job`;
CREATE TABLE `sys_job`  (
  `job_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '' COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'DEFAULT' COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `cron_expression` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT 'cron执行表达式',
  `misfire_policy` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '3' COMMENT '计划执行错误策略（1立即执行 2执行一次 3放弃执行）',
  `concurrent` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '是否并发执行（0允许 1禁止）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '状态（0正常 1暂停）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`job_id`, `job_name`, `job_group`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job
-- ----------------------------
INSERT INTO `sys_job` VALUES (1, '系统默认（无参）', 'DEFAULT', 'ryTask.ryNoParams', '0/10 * * * * ?', '3', '1', '1', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (2, '系统默认（有参）', 'DEFAULT', 'ryTask.ryParams(\'ry\')', '0/15 * * * * ?', '3', '1', '1', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_job` VALUES (3, '系统默认（多参）', 'DEFAULT', 'ryTask.ryMultipleParams(\'ry\', true, 2000L, 316.50D, 100)', '0/20 * * * * ?', '3', '1', '1', 'admin', '2024-03-20 09:39:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_job_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_job_log`;
CREATE TABLE `sys_job_log`  (
  `job_log_id` bigint NOT NULL AUTO_INCREMENT COMMENT '任务日志ID',
  `job_name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务名称',
  `job_group` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '任务组名',
  `invoke_target` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '调用目标字符串',
  `job_message` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '日志信息',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '执行状态（0正常 1失败）',
  `exception_info` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '异常信息',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  PRIMARY KEY (`job_log_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '定时任务调度日志表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_job_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_logininfor
-- ----------------------------
DROP TABLE IF EXISTS `sys_logininfor`;
CREATE TABLE `sys_logininfor`  (
  `info_id` bigint NOT NULL AUTO_INCREMENT COMMENT '访问ID',
  `user_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户账号',
  `ipaddr` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录IP地址',
  `login_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '登录地点',
  `browser` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '浏览器类型',
  `os` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作系统',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '登录状态（0成功 1失败）',
  `msg` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '提示消息',
  `login_time` datetime NULL DEFAULT NULL COMMENT '访问时间',
  PRIMARY KEY (`info_id`) USING BTREE,
  INDEX `idx_sys_logininfor_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_logininfor_lt`(`login_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 114 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '系统访问记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_logininfor
-- ----------------------------
INSERT INTO `sys_logininfor` VALUES (100, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 10:29:42');
INSERT INTO `sys_logininfor` VALUES (101, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-20 11:17:35');
INSERT INTO `sys_logininfor` VALUES (102, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 11:17:41');
INSERT INTO `sys_logininfor` VALUES (103, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 14:44:27');
INSERT INTO `sys_logininfor` VALUES (104, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 15:18:54');
INSERT INTO `sys_logininfor` VALUES (105, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-20 16:40:43');
INSERT INTO `sys_logininfor` VALUES (106, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 16:40:54');
INSERT INTO `sys_logininfor` VALUES (107, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-20 16:42:42');
INSERT INTO `sys_logininfor` VALUES (108, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码错误', '2024-03-20 16:42:45');
INSERT INTO `sys_logininfor` VALUES (109, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 16:42:49');
INSERT INTO `sys_logininfor` VALUES (110, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-20 18:00:31');
INSERT INTO `sys_logininfor` VALUES (111, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-20 18:00:35');
INSERT INTO `sys_logininfor` VALUES (112, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-22 12:54:41');
INSERT INTO `sys_logininfor` VALUES (113, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-22 13:51:13');
INSERT INTO `sys_logininfor` VALUES (114, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '1', '验证码已失效', '2024-03-26 13:51:52');
INSERT INTO `sys_logininfor` VALUES (115, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 13:51:57');
INSERT INTO `sys_logininfor` VALUES (116, 'admin', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 14:26:39');
INSERT INTO `sys_logininfor` VALUES (117, 'admin', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 14:55:32');
INSERT INTO `sys_logininfor` VALUES (118, 'ry', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-26 14:55:48');
INSERT INTO `sys_logininfor` VALUES (119, 'ry', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 14:56:45');
INSERT INTO `sys_logininfor` VALUES (120, 'ry', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 14:57:40');
INSERT INTO `sys_logininfor` VALUES (121, 'admin', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 14:57:45');
INSERT INTO `sys_logininfor` VALUES (122, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 16:43:07');
INSERT INTO `sys_logininfor` VALUES (123, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 16:43:53');
INSERT INTO `sys_logininfor` VALUES (124, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 16:45:13');
INSERT INTO `sys_logininfor` VALUES (125, 'ry', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 16:45:19');
INSERT INTO `sys_logininfor` VALUES (126, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 16:45:23');
INSERT INTO `sys_logininfor` VALUES (127, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 16:57:10');
INSERT INTO `sys_logininfor` VALUES (128, 'qingyan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 16:57:20');
INSERT INTO `sys_logininfor` VALUES (129, 'qingyan', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 16:58:53');
INSERT INTO `sys_logininfor` VALUES (130, 'admin', '127.0.0.1', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 16:58:59');
INSERT INTO `sys_logininfor` VALUES (131, 'admin', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-26 17:43:27');
INSERT INTO `sys_logininfor` VALUES (132, 'admin', '10.0.236.10', '内网IP', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 17:43:35');
INSERT INTO `sys_logininfor` VALUES (133, 'admin', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '1', '用户不存在/密码错误', '2024-03-26 19:39:28');
INSERT INTO `sys_logininfor` VALUES (134, 'qingyan', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 19:39:38');
INSERT INTO `sys_logininfor` VALUES (135, 'qingyan', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 19:40:17');
INSERT INTO `sys_logininfor` VALUES (136, 'admin', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 19:40:29');
INSERT INTO `sys_logininfor` VALUES (137, 'admin', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '退出成功', '2024-03-26 19:41:58');
INSERT INTO `sys_logininfor` VALUES (138, 'qingyan', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 19:42:05');
INSERT INTO `sys_logininfor` VALUES (139, 'qingyan', '123.185.110.81', 'XX XX', 'Chrome 12', 'Windows 10', '0', '登录成功', '2024-03-26 19:45:23');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu`  (
  `menu_id` bigint NOT NULL AUTO_INCREMENT COMMENT '菜单ID',
  `menu_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '菜单名称',
  `parent_id` bigint NULL DEFAULT 0 COMMENT '父菜单ID',
  `order_num` int NULL DEFAULT 0 COMMENT '显示顺序',
  `path` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '路由地址',
  `component` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '组件路径',
  `query` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '路由参数',
  `is_frame` int NULL DEFAULT 1 COMMENT '是否为外链（0是 1否）',
  `is_cache` int NULL DEFAULT 0 COMMENT '是否缓存（0缓存 1不缓存）',
  `menu_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '菜单类型（M目录 C菜单 F按钮）',
  `visible` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0显示 1隐藏）',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '菜单状态（0正常 1停用）',
  `perms` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '权限标识',
  `icon` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '#' COMMENT '菜单图标',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`menu_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2032 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '菜单权限表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES (1, '系统管理', 0, 1, 'system', NULL, '', 1, 0, 'M', '0', '0', '', 'system', 'admin', '2024-03-20 09:39:53', '', NULL, '系统管理目录');
INSERT INTO `sys_menu` VALUES (2, '系统监控', 0, 2, 'monitor', NULL, '', 1, 0, 'M', '1', '0', '', 'monitor', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 14:24:14', '系统监控目录');
INSERT INTO `sys_menu` VALUES (3, '系统工具', 0, 3, 'tool', NULL, '', 1, 0, 'M', '0', '0', '', 'tool', 'admin', '2024-03-20 09:39:53', '', NULL, '系统工具目录');
INSERT INTO `sys_menu` VALUES (4, '若依官网', 0, 4, 'http://ruoyi.vip', NULL, '', 0, 0, 'M', '1', '0', '', 'guide', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 14:24:38', '若依官网地址');
INSERT INTO `sys_menu` VALUES (100, '用户管理', 1, 1, 'user', 'system/user/index', '', 1, 0, 'C', '0', '0', 'system:user:list', 'user', 'admin', '2024-03-20 09:39:53', '', NULL, '用户管理菜单');
INSERT INTO `sys_menu` VALUES (101, '角色管理', 1, 2, 'role', 'system/role/index', '', 1, 0, 'C', '0', '0', 'system:role:list', 'peoples', 'admin', '2024-03-20 09:39:53', '', NULL, '角色管理菜单');
INSERT INTO `sys_menu` VALUES (102, '菜单管理', 1, 3, 'menu', 'system/menu/index', '', 1, 0, 'C', '0', '0', 'system:menu:list', 'tree-table', 'admin', '2024-03-20 09:39:53', '', NULL, '菜单管理菜单');
INSERT INTO `sys_menu` VALUES (103, '部门管理', 1, 4, 'dept', 'system/dept/index', '', 1, 0, 'C', '0', '0', 'system:dept:list', 'tree', 'admin', '2024-03-20 09:39:53', '', NULL, '部门管理菜单');
INSERT INTO `sys_menu` VALUES (104, '岗位管理', 1, 5, 'post', 'system/post/index', '', 1, 0, 'C', '0', '0', 'system:post:list', 'post', 'admin', '2024-03-20 09:39:53', '', NULL, '岗位管理菜单');
INSERT INTO `sys_menu` VALUES (105, '字典管理', 1, 6, 'dict', 'system/dict/index', '', 1, 0, 'C', '0', '0', 'system:dict:list', 'dict', 'admin', '2024-03-20 09:39:53', '', NULL, '字典管理菜单');
INSERT INTO `sys_menu` VALUES (106, '参数设置', 1, 7, 'config', 'system/config/index', '', 1, 0, 'C', '0', '0', 'system:config:list', 'edit', 'admin', '2024-03-20 09:39:53', '', NULL, '参数设置菜单');
INSERT INTO `sys_menu` VALUES (107, '通知公告', 1, 8, 'notice', 'system/notice/index', '', 1, 0, 'C', '0', '0', 'system:notice:list', 'message', 'admin', '2024-03-20 09:39:53', '', NULL, '通知公告菜单');
INSERT INTO `sys_menu` VALUES (108, '日志管理', 1, 9, 'log', '', '', 1, 0, 'M', '0', '0', '', 'log', 'admin', '2024-03-20 09:39:53', '', NULL, '日志管理菜单');
INSERT INTO `sys_menu` VALUES (109, '在线用户', 2, 1, 'online', 'monitor/online/index', '', 1, 0, 'C', '0', '0', 'monitor:online:list', 'online', 'admin', '2024-03-20 09:39:53', '', NULL, '在线用户菜单');
INSERT INTO `sys_menu` VALUES (110, '定时任务', 2, 2, 'job', 'monitor/job/index', '', 1, 0, 'C', '0', '0', 'monitor:job:list', 'job', 'admin', '2024-03-20 09:39:53', '', NULL, '定时任务菜单');
INSERT INTO `sys_menu` VALUES (111, '数据监控', 2, 3, 'druid', 'monitor/druid/index', '', 1, 0, 'C', '0', '0', 'monitor:druid:list', 'druid', 'admin', '2024-03-20 09:39:53', '', NULL, '数据监控菜单');
INSERT INTO `sys_menu` VALUES (112, '服务监控', 2, 4, 'server', 'monitor/server/index', '', 1, 0, 'C', '0', '0', 'monitor:server:list', 'server', 'admin', '2024-03-20 09:39:53', '', NULL, '服务监控菜单');
INSERT INTO `sys_menu` VALUES (113, '缓存监控', 2, 5, 'cache', 'monitor/cache/index', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis', 'admin', '2024-03-20 09:39:53', '', NULL, '缓存监控菜单');
INSERT INTO `sys_menu` VALUES (114, '缓存列表', 2, 6, 'cacheList', 'monitor/cache/list', '', 1, 0, 'C', '0', '0', 'monitor:cache:list', 'redis-list', 'admin', '2024-03-20 09:39:53', '', NULL, '缓存列表菜单');
INSERT INTO `sys_menu` VALUES (115, '表单构建', 3, 1, 'build', 'tool/build/index', '', 1, 0, 'C', '0', '0', 'tool:build:list', 'build', 'admin', '2024-03-20 09:39:53', '', NULL, '表单构建菜单');
INSERT INTO `sys_menu` VALUES (116, '代码生成', 3, 2, 'gen', 'tool/gen/index', '', 1, 0, 'C', '0', '0', 'tool:gen:list', 'code', 'admin', '2024-03-20 09:39:53', '', NULL, '代码生成菜单');
INSERT INTO `sys_menu` VALUES (117, '系统接口', 3, 3, 'swagger', 'tool/swagger/index', '', 1, 0, 'C', '0', '0', 'tool:swagger:list', 'swagger', 'admin', '2024-03-20 09:39:53', '', NULL, '系统接口菜单');
INSERT INTO `sys_menu` VALUES (500, '操作日志', 108, 1, 'operlog', 'monitor/operlog/index', '', 1, 0, 'C', '0', '0', 'monitor:operlog:list', 'form', 'admin', '2024-03-20 09:39:53', '', NULL, '操作日志菜单');
INSERT INTO `sys_menu` VALUES (501, '登录日志', 108, 2, 'logininfor', 'monitor/logininfor/index', '', 1, 0, 'C', '0', '0', 'monitor:logininfor:list', 'logininfor', 'admin', '2024-03-20 09:39:53', '', NULL, '登录日志菜单');
INSERT INTO `sys_menu` VALUES (1000, '用户查询', 100, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:user:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1001, '用户新增', 100, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:user:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1002, '用户修改', 100, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:user:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1003, '用户删除', 100, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:user:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1004, '用户导出', 100, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:user:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1005, '用户导入', 100, 6, '', '', '', 1, 0, 'F', '0', '0', 'system:user:import', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1006, '重置密码', 100, 7, '', '', '', 1, 0, 'F', '0', '0', 'system:user:resetPwd', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1007, '角色查询', 101, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:role:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1008, '角色新增', 101, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:role:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1009, '角色修改', 101, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:role:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1010, '角色删除', 101, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:role:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1011, '角色导出', 101, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:role:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1012, '菜单查询', 102, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1013, '菜单新增', 102, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1014, '菜单修改', 102, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1015, '菜单删除', 102, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:menu:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1016, '部门查询', 103, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1017, '部门新增', 103, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1018, '部门修改', 103, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1019, '部门删除', 103, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:dept:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1020, '岗位查询', 104, 1, '', '', '', 1, 0, 'F', '0', '0', 'system:post:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1021, '岗位新增', 104, 2, '', '', '', 1, 0, 'F', '0', '0', 'system:post:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1022, '岗位修改', 104, 3, '', '', '', 1, 0, 'F', '0', '0', 'system:post:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1023, '岗位删除', 104, 4, '', '', '', 1, 0, 'F', '0', '0', 'system:post:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1024, '岗位导出', 104, 5, '', '', '', 1, 0, 'F', '0', '0', 'system:post:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1025, '字典查询', 105, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1026, '字典新增', 105, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1027, '字典修改', 105, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1028, '字典删除', 105, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1029, '字典导出', 105, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:dict:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1030, '参数查询', 106, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1031, '参数新增', 106, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1032, '参数修改', 106, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1033, '参数删除', 106, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1034, '参数导出', 106, 5, '#', '', '', 1, 0, 'F', '0', '0', 'system:config:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1035, '公告查询', 107, 1, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1036, '公告新增', 107, 2, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1037, '公告修改', 107, 3, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1038, '公告删除', 107, 4, '#', '', '', 1, 0, 'F', '0', '0', 'system:notice:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1039, '操作查询', 500, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1040, '操作删除', 500, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1041, '日志导出', 500, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:operlog:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1042, '登录查询', 501, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1043, '登录删除', 501, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1044, '日志导出', 501, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1045, '账户解锁', 501, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:logininfor:unlock', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1046, '在线查询', 109, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1047, '批量强退', 109, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:batchLogout', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1048, '单条强退', 109, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:online:forceLogout', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1049, '任务查询', 110, 1, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1050, '任务新增', 110, 2, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:add', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1051, '任务修改', 110, 3, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1052, '任务删除', 110, 4, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1053, '状态修改', 110, 5, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:changeStatus', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1054, '任务导出', 110, 6, '#', '', '', 1, 0, 'F', '0', '0', 'monitor:job:export', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1055, '生成查询', 116, 1, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:query', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1056, '生成修改', 116, 2, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:edit', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1057, '生成删除', 116, 3, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:remove', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1058, '导入代码', 116, 4, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:import', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1059, '预览代码', 116, 5, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:preview', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (1060, '生成代码', 116, 6, '#', '', '', 1, 0, 'F', '0', '0', 'tool:gen:code', '#', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2000, '测试模块', 0, 5, 'test', NULL, NULL, 1, 0, 'M', '1', '0', '', 'chart', 'admin', '2024-03-20 10:43:21', 'admin', '2024-03-26 14:24:23', '');
INSERT INTO `sys_menu` VALUES (2001, '职位', 2000, 1, 'position', 'system/position/index', NULL, 1, 0, 'C', '0', '0', 'system:position:list', 'color', 'admin', '2024-03-20 10:58:10', 'admin', '2024-03-20 10:59:17', 'position菜单');
INSERT INTO `sys_menu` VALUES (2002, 'position查询', 2001, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:position:query', '#', 'admin', '2024-03-20 10:58:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2003, 'position新增', 2001, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:position:add', '#', 'admin', '2024-03-20 10:58:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2004, 'position修改', 2001, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:position:edit', '#', 'admin', '2024-03-20 10:58:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2005, 'position删除', 2001, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:position:remove', '#', 'admin', '2024-03-20 10:58:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2006, 'position导出', 2001, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:position:export', '#', 'admin', '2024-03-20 10:58:10', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2013, '部门', 2000, 2, 'department', 'system/department/index', NULL, 1, 0, 'C', '0', '0', 'system:department:list', 'education', 'admin', '2024-03-20 11:08:18', 'admin', '2024-03-20 11:09:31', 'department菜单');
INSERT INTO `sys_menu` VALUES (2014, 'department查询', 2013, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:department:query', '#', 'admin', '2024-03-20 11:08:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2015, 'department新增', 2013, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:department:add', '#', 'admin', '2024-03-20 11:08:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2016, 'department修改', 2013, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:department:edit', '#', 'admin', '2024-03-20 11:08:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2017, 'department删除', 2013, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:department:remove', '#', 'admin', '2024-03-20 11:08:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2018, 'department导出', 2013, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:department:export', '#', 'admin', '2024-03-20 11:08:18', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2019, '员工', 2000, 3, 'employee', 'system/employee/index', NULL, 1, 0, 'C', '0', '0', 'system:employee:list', 'people', 'admin', '2024-03-20 14:01:07', 'admin', '2024-03-20 14:02:13', 'employee菜单');
INSERT INTO `sys_menu` VALUES (2020, 'employee查询', 2019, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employee:query', '#', 'admin', '2024-03-20 14:01:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2021, 'employee新增', 2019, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employee:add', '#', 'admin', '2024-03-20 14:01:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2022, 'employee修改', 2019, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employee:edit', '#', 'admin', '2024-03-20 14:01:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2023, 'employee删除', 2019, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employee:remove', '#', 'admin', '2024-03-20 14:01:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2024, 'employee导出', 2019, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:employee:export', '#', 'admin', '2024-03-20 14:01:07', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2025, '标签', 2001, 1, 'tab', 'system/tab/index', NULL, 1, 0, 'C', '0', '0', 'system:tab:list', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '标签菜单');
INSERT INTO `sys_menu` VALUES (2026, '标签查询', 2025, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:tab:query', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2027, '标签新增', 2025, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:tab:add', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2028, '标签修改', 2025, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:tab:edit', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2029, '标签删除', 2025, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:tab:remove', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2030, '标签导出', 2025, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:tab:export', '#', 'admin', '2024-03-22 12:55:04', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2031, '标签', 2000, 2, 'tab', 'system/tab/index', NULL, 1, 0, 'C', '0', '0', NULL, '404', 'admin', '2024-03-22 12:59:53', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2032, 'OurStoryBegin', 0, 0, 'ourstorybegin', NULL, NULL, 1, 0, 'M', '0', '0', NULL, 'star', 'admin', '2024-03-26 14:23:50', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2033, '回忆录', 2032, 1, 'recollections', 'system/recollections/index', NULL, 1, 0, 'C', '0', '0', 'system:recollections:list', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '回忆录菜单');
INSERT INTO `sys_menu` VALUES (2034, '回忆录查询', 2033, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:recollections:query', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2035, '回忆录新增', 2033, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:recollections:add', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2036, '回忆录修改', 2033, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:recollections:edit', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2037, '回忆录删除', 2033, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:recollections:remove', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2038, '回忆录导出', 2033, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:recollections:export', '#', 'admin', '2024-03-26 15:03:49', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2039, '回忆', 2032, 1, 'memory', 'system/memory/index', NULL, 1, 0, 'C', '0', '0', 'system:memory:list', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '回忆菜单');
INSERT INTO `sys_menu` VALUES (2040, '回忆查询', 2039, 1, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:memory:query', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2041, '回忆新增', 2039, 2, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:memory:add', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2042, '回忆修改', 2039, 3, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:memory:edit', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2043, '回忆删除', 2039, 4, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:memory:remove', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '');
INSERT INTO `sys_menu` VALUES (2044, '回忆导出', 2039, 5, '#', '', NULL, 1, 0, 'F', '0', '0', 'system:memory:export', '#', 'admin', '2024-03-26 17:00:02', '', NULL, '');

-- ----------------------------
-- Table structure for sys_notice
-- ----------------------------
DROP TABLE IF EXISTS `sys_notice`;
CREATE TABLE `sys_notice`  (
  `notice_id` int NOT NULL AUTO_INCREMENT COMMENT '公告ID',
  `notice_title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告标题',
  `notice_type` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '公告类型（1通知 2公告）',
  `notice_content` longblob NULL COMMENT '公告内容',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '公告状态（0正常 1关闭）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`notice_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '通知公告表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_notice
-- ----------------------------
INSERT INTO `sys_notice` VALUES (1, '温馨提醒：2018-07-01 若依新版本发布啦', '2', 0xE696B0E78988E69CACE58685E5AEB9, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '管理员');
INSERT INTO `sys_notice` VALUES (2, '维护通知：2018-07-01 若依系统凌晨维护', '1', 0xE7BBB4E68AA4E58685E5AEB9, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '管理员');

-- ----------------------------
-- Table structure for sys_oper_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_oper_log`;
CREATE TABLE `sys_oper_log`  (
  `oper_id` bigint NOT NULL AUTO_INCREMENT COMMENT '日志主键',
  `title` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '模块标题',
  `business_type` int NULL DEFAULT 0 COMMENT '业务类型（0其它 1新增 2修改 3删除）',
  `method` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '方法名称',
  `request_method` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求方式',
  `operator_type` int NULL DEFAULT 0 COMMENT '操作类别（0其它 1后台用户 2手机端用户）',
  `oper_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作人员',
  `dept_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '部门名称',
  `oper_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求URL',
  `oper_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '主机地址',
  `oper_location` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '操作地点',
  `oper_param` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '请求参数',
  `json_result` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '返回参数',
  `status` int NULL DEFAULT 0 COMMENT '操作状态（0正常 1异常）',
  `error_msg` varchar(2000) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '错误消息',
  `oper_time` datetime NULL DEFAULT NULL COMMENT '操作时间',
  `cost_time` bigint NULL DEFAULT 0 COMMENT '消耗时间',
  PRIMARY KEY (`oper_id`) USING BTREE,
  INDEX `idx_sys_oper_log_bt`(`business_type` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_s`(`status` ASC) USING BTREE,
  INDEX `idx_sys_oper_log_ot`(`oper_time` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 167 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '操作日志记录' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_oper_log
-- ----------------------------
INSERT INTO `sys_oper_log` VALUES (100, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":true,\"params\":{},\"status\":\"1\",\"userId\":1}', NULL, 1, '不允许操作超级管理员用户', '2024-03-20 10:30:10', 17);
INSERT INTO `sys_oper_log` VALUES (101, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '127.0.0.1', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"1\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 10:30:15', 23);
INSERT INTO `sys_oper_log` VALUES (102, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"测试模块\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"test\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 10:43:21', 24);
INSERT INTO `sys_oper_log` VALUES (103, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_position\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 10:46:56', 121);
INSERT INTO `sys_oper_log` VALUES (104, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"position\",\"className\":\"Position\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"职位主键\",\"columnId\":1,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 10:46:56\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"职位名称\",\"columnId\":2,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 10:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Salary\",\"columnComment\":\"职位工资\",\"columnId\":3,\"columnName\":\"salary\",\"columnType\":\"double(10,2)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 10:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"salary\",\"javaType\":\"BigDecimal\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"BETWEEN\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":1,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Departmentid\",\"columnComment\":\"部门外键\",\"columnId\":4,\"columnName\":\"departmentid\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 10:46:56\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaFiel', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 10:51:44', 87);
INSERT INTO `sys_oper_log` VALUES (105, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_position\"}', NULL, 0, NULL, '2024-03-20 10:56:45', 52);
INSERT INTO `sys_oper_log` VALUES (106, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/position/index\",\"createTime\":\"2024-03-20 10:58:10\",\"icon\":\"color\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2001,\"menuName\":\"职位\",\"menuType\":\"C\",\"orderNum\":1,\"params\":{},\"parentId\":2000,\"path\":\"position\",\"perms\":\"system:position:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 10:59:17', 13);
INSERT INTO `sys_oper_log` VALUES (107, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_department\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:01:36', 40);
INSERT INTO `sys_oper_log` VALUES (108, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"TDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门主键\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":6,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"xihuanghuang\",\"functionName\":\"department\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{}\",\"packageName\":\"com.ruoyi.system\",\"params\":{},\"sub\":false,\"tableComment\":\"这是我建立的部门表\",\"tableId\":2,\"tableName\":\"部门表\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:02:40', 36);
INSERT INTO `sys_oper_log` VALUES (109, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"部门表\"}', NULL, 0, NULL, '2024-03-20 11:02:47', 86);
INSERT INTO `sys_oper_log` VALUES (110, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_department\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:07:06', 35);
INSERT INTO `sys_oper_log` VALUES (111, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:07:14', 19);
INSERT INTO `sys_oper_log` VALUES (112, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"TDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门主键\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-20 11:02:40\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":6,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-20 11:02:40\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"xihuanghuang\",\"functionName\":\"department\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":2000}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":2000},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"这是我建立的部门表\",\"tableId\":2,\"tableName\":\"部门表\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:07:21', 21);
INSERT INTO `sys_oper_log` VALUES (113, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"部门表\"}', NULL, 0, NULL, '2024-03-20 11:07:47', 70);
INSERT INTO `sys_oper_log` VALUES (114, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/department/index\",\"createTime\":\"2024-03-20 11:08:18\",\"icon\":\"#\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"department\",\"perms\":\"system:department:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:09:05', 20);
INSERT INTO `sys_oper_log` VALUES (115, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/department/index\",\"createTime\":\"2024-03-20 11:08:18\",\"icon\":\"education\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2013,\"menuName\":\"部门\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"department\",\"perms\":\"system:department:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:09:31', 18);
INSERT INTO `sys_oper_log` VALUES (116, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"department\",\"className\":\"TDepartment\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"部门主键\",\"columnId\":5,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-20 11:07:21\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"部门名称\",\"columnId\":6,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 11:01:36\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":2,\"updateBy\":\"\",\"updateTime\":\"2024-03-20 11:07:21\",\"usableColumn\":false}],\"crud\":true,\"functionAuthor\":\"xihuanghuang\",\"functionName\":\"department\",\"genPath\":\"/\",\"genType\":\"0\",\"moduleName\":\"system\",\"options\":\"{\\\"parentMenuId\\\":\\\"2000\\\"}\",\"packageName\":\"com.ruoyi.system\",\"params\":{\"parentMenuId\":\"2000\"},\"parentMenuId\":\"2000\",\"sub\":false,\"tableComment\":\"这是我建立的部门表\",\"tableId\":2,\"tableName\":\"t_department\",\"tplCategory\":\"crud\",\"tplWebType\":\"element-ui\",\"tree\":false}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:19:00', 86);
INSERT INTO `sys_oper_log` VALUES (117, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.synchDb()', 'GET', 1, 'admin', '研发部门', '/tool/gen/synchDb/t_department', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:19:21', 52);
INSERT INTO `sys_oper_log` VALUES (118, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_department\"}', NULL, 0, NULL, '2024-03-20 11:19:38', 536);
INSERT INTO `sys_oper_log` VALUES (119, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [E:\\worksapce\\IdeaProjects\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\TDepartmentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TDepartmentMapper.deleteTDepartmentByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_department where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2024-03-20 11:24:18', 53);
INSERT INTO `sys_oper_log` VALUES (120, 'department', 1, 'com.ruoyi.web.controller.system.TDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":3,\"name\":\"姐姐就看见很快就会尽快\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:28:58', 41);
INSERT INTO `sys_oper_log` VALUES (121, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/3', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:29:03', 34);
INSERT INTO `sys_oper_log` VALUES (122, 'department', 1, 'com.ruoyi.web.controller.system.TDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":4,\"name\":\"后明年 \",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:29:16', 12);
INSERT INTO `sys_oper_log` VALUES (123, 'department', 2, 'com.ruoyi.web.controller.system.TDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":4,\"name\":\"的\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:29:57', 12);
INSERT INTO `sys_oper_log` VALUES (124, 'department', 2, 'com.ruoyi.web.controller.system.TDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":4,\"name\":\"的大幅上涨发啥分\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:30:03', 13);
INSERT INTO `sys_oper_log` VALUES (125, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:30:10', 9);
INSERT INTO `sys_oper_log` VALUES (126, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":6,\"name\":\"弱开发\",\"params\":{},\"salary\":22}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 11:57:02', 52);
INSERT INTO `sys_oper_log` VALUES (127, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":7,\"name\":\"笨蛋测试\",\"params\":{},\"salary\":33}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 12:10:49', 12);
INSERT INTO `sys_oper_log` VALUES (128, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":7,\"name\":\"笨蛋开发\",\"params\":{},\"salary\":333}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 12:11:00', 17);
INSERT INTO `sys_oper_log` VALUES (129, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":8,\"name\":\"聪明开发\",\"params\":{},\"salary\":2333}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:10:38', 48);
INSERT INTO `sys_oper_log` VALUES (130, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":8,\"name\":\"聪明的测试\",\"params\":{},\"salary\":2334}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:10:54', 18);
INSERT INTO `sys_oper_log` VALUES (131, 'position', 5, 'com.ruoyi.web.controller.system.PositionController.export()', 'POST', 1, 'admin', '研发部门', '/system/position/export', '127.0.0.1', '内网IP', '{\"departmentid\":\"1\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-03-20 13:15:15', 1311);
INSERT INTO `sys_oper_log` VALUES (132, 'department', 1, 'com.ruoyi.web.controller.system.TDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":5,\"name\":\"娱乐部门\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:29:31', 15);
INSERT INTO `sys_oper_log` VALUES (133, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/5', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:29:35', 18);
INSERT INTO `sys_oper_log` VALUES (134, 'department', 2, 'com.ruoyi.web.controller.system.TDepartmentController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":2,\"name\":\"测试的部\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:29:40', 21);
INSERT INTO `sys_oper_log` VALUES (135, 'department', 5, 'com.ruoyi.web.controller.system.TDepartmentController.export()', 'POST', 1, 'admin', '研发部门', '/system/department/export', '127.0.0.1', '内网IP', '{\"name\":\"测试\",\"pageSize\":\"10\",\"pageNum\":\"1\"}', NULL, 0, NULL, '2024-03-20 13:29:50', 145);
INSERT INTO `sys_oper_log` VALUES (136, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":9,\"name\":\"我的\",\"params\":{},\"salary\":222}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:00', 8);
INSERT INTO `sys_oper_log` VALUES (137, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":10,\"name\":\"我的第二个\",\"params\":{},\"salary\":222}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:14', 13);
INSERT INTO `sys_oper_log` VALUES (138, 'position', 1, 'com.ruoyi.web.controller.system.PositionController.add()', 'POST', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":11,\"name\":\"为了分页\",\"params\":{},\"salary\":111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:21', 13);
INSERT INTO `sys_oper_log` VALUES (139, 'position', 3, 'com.ruoyi.web.controller.system.PositionController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/position/9,10', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:29', 15);
INSERT INTO `sys_oper_log` VALUES (140, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":11,\"name\":\"为了分页的都\",\"params\":{},\"salary\":111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:37', 12);
INSERT INTO `sys_oper_log` VALUES (141, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":11,\"name\":\"为了分页的都\",\"params\":{},\"salary\":11123}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:30:42', 10);
INSERT INTO `sys_oper_log` VALUES (142, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"性格\",\"dictType\":\"temperament\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:48:00', 72);
INSERT INTO `sys_oper_log` VALUES (143, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"开朗\",\"dictSort\":1,\"dictType\":\"temperament\",\"dictValue\":\"1\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:48:18', 38);
INSERT INTO `sys_oper_log` VALUES (144, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"内向\",\"dictSort\":2,\"dictType\":\"temperament\",\"dictValue\":\"2\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:48:28', 18);
INSERT INTO `sys_oper_log` VALUES (145, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"t_employee\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:58:19', 194);
INSERT INTO `sys_oper_log` VALUES (146, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"employee\",\"className\":\"TEmployee\",\"columns\":[{\"capJavaField\":\"Id\",\"columnComment\":\"员工主键\",\"columnId\":9,\"columnName\":\"id\",\"columnType\":\"int\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 13:58:19\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isPk\":\"1\",\"isQuery\":\"1\",\"isRequired\":\"0\",\"javaField\":\"id\",\"javaType\":\"Long\",\"list\":false,\"params\":{},\"pk\":true,\"query\":true,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Name\",\"columnComment\":\"员工姓名\",\"columnId\":10,\"columnName\":\"name\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 13:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"name\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Sex\",\"columnComment\":\"员工性别\",\"columnId\":11,\"columnName\":\"sex\",\"columnType\":\"varchar(10)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 13:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"sex\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":false,\"tableId\":4,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"Photo\",\"columnComment\":\"员工照片\",\"columnId\":12,\"columnName\":\"photo\",\"columnType\":\"varchar(255)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 13:58:19\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"photo\",\"javaTyp', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 13:59:35', 81);
INSERT INTO `sys_oper_log` VALUES (147, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"t_employee\"}', NULL, 0, NULL, '2024-03-20 13:59:38', 683);
INSERT INTO `sys_oper_log` VALUES (148, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/employee/index\",\"createTime\":\"2024-03-20 14:01:07\",\"icon\":\"people\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2019,\"menuName\":\"员工\",\"menuType\":\"C\",\"orderNum\":3,\"params\":{},\"parentId\":2000,\"path\":\"employee\",\"perms\":\"system:employee:list\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 14:02:13', 40);
INSERT INTO `sys_oper_log` VALUES (149, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":1,\"name\":\"初级开发\",\"params\":{},\"salary\":5000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 15:31:02', 20);
INSERT INTO `sys_oper_log` VALUES (150, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":1,\"id\":1,\"name\":\"初级开发\",\"params\":{},\"salary\":5000}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 15:31:06', 9);
INSERT INTO `sys_oper_log` VALUES (151, 'position', 2, 'com.ruoyi.web.controller.system.PositionController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/position', '127.0.0.1', '内网IP', '{\"departmentid\":2,\"id\":11,\"name\":\"哇哈哈\",\"params\":{},\"salary\":111}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 15:31:18', 12);
INSERT INTO `sys_oper_log` VALUES (152, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/2', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [E:\\worksapce\\IdeaProjects\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\TDepartmentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TDepartmentMapper.deleteTDepartmentByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_department where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2024-03-20 15:50:05', 12);
INSERT INTO `sys_oper_log` VALUES (153, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [E:\\worksapce\\IdeaProjects\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\TDepartmentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TDepartmentMapper.deleteTDepartmentByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_department where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2024-03-20 15:54:19', 46184);
INSERT INTO `sys_oper_log` VALUES (154, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/1', '127.0.0.1', '内网IP', '{}', NULL, 1, '\r\n### Error updating database.  Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\r\n### The error may exist in file [E:\\worksapce\\IdeaProjects\\RuoYi-Vue-master\\RuoYi-Vue-master\\ruoyi-system\\target\\classes\\mapper\\system\\TDepartmentMapper.xml]\r\n### The error may involve com.ruoyi.system.mapper.TDepartmentMapper.deleteTDepartmentByIds-Inline\r\n### The error occurred while setting parameters\r\n### SQL: delete from t_department where id in           (               ?          )\r\n### Cause: java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)\n; Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT); nested exception is java.sql.SQLIntegrityConstraintViolationException: Cannot delete or update a parent row: a foreign key constraint fails (`ry`.`t_position`, CONSTRAINT `dept_posi__fk` FOREIGN KEY (`departmentid`) REFERENCES `t_department` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT)', '2024-03-20 15:54:28', 5);
INSERT INTO `sys_oper_log` VALUES (155, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在外键依赖，无法删除\",\"code\":500}', 0, NULL, '2024-03-20 15:57:37', 83);
INSERT INTO `sys_oper_log` VALUES (156, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在外键依赖，无法删除\",\"code\":500}', 0, NULL, '2024-03-20 15:57:43', 20);
INSERT INTO `sys_oper_log` VALUES (157, 'department', 1, 'com.ruoyi.web.controller.system.TDepartmentController.add()', 'POST', 1, 'admin', '研发部门', '/system/department', '127.0.0.1', '内网IP', '{\"id\":6,\"name\":\"试试\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 16:04:48', 43);
INSERT INTO `sys_oper_log` VALUES (158, 'department', 3, 'com.ruoyi.web.controller.system.TDepartmentController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/department/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"删除成功\",\"code\":200}', 0, NULL, '2024-03-20 16:04:50', 26);
INSERT INTO `sys_oper_log` VALUES (159, 'employee', 1, 'com.ruoyi.web.controller.system.TEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"id\":6,\"name\":\"喜欢和\",\"params\":{},\"positionid\":2,\"school\":\"大专\",\"sex\":\"男\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 18:01:02', 41);
INSERT INTO `sys_oper_log` VALUES (160, 'employee', 1, 'com.ruoyi.web.controller.system.TEmployeeController.add()', 'POST', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"birthday\":\"2024-03-14\",\"id\":7,\"name\":\"栖凰凰\",\"params\":{},\"positionid\":2,\"school\":\"大专\",\"sex\":\"女\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 18:01:18', 16);
INSERT INTO `sys_oper_log` VALUES (161, 'employee', 2, 'com.ruoyi.web.controller.system.TEmployeeController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/employee', '127.0.0.1', '内网IP', '{\"birthday\":\"2024-03-05\",\"id\":6,\"name\":\"喜欢和\",\"params\":{},\"positionid\":2,\"school\":\"大专\",\"sex\":\"男\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 18:01:24', 12);
INSERT INTO `sys_oper_log` VALUES (162, 'employee', 3, 'com.ruoyi.web.controller.system.TEmployeeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/employee/6', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-20 18:01:40', 27);
INSERT INTO `sys_oper_log` VALUES (163, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"component\":\"system/tab/index\",\"createBy\":\"admin\",\"icon\":\"404\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"标签\",\"menuType\":\"C\",\"orderNum\":2,\"params\":{},\"parentId\":2000,\"path\":\"tab\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-22 12:59:53', 68);
INSERT INTO `sys_oper_log` VALUES (164, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"颜色\",\"dictType\":\"color\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-22 13:51:41', 27);
INSERT INTO `sys_oper_log` VALUES (165, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"IndianRed\",\"dictSort\":1,\"dictType\":\"color\",\"dictValue\":\"#CD5C5C\",\"listClass\":\"default\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-22 13:52:12', 16);
INSERT INTO `sys_oper_log` VALUES (166, '标签', 1, 'com.ruoyi.web.controller.system.TabController.add()', 'POST', 1, 'admin', '研发部门', '/system/tab', '127.0.0.1', '内网IP', '{\"backgroundColor\":\"#CD5C5C\",\"params\":{},\"tabId\":1,\"tabName\":\"水淹车\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-22 13:52:29', 19);
INSERT INTO `sys_oper_log` VALUES (167, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/1', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:07:32', 64);
INSERT INTO `sys_oper_log` VALUES (168, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/2', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:07:34', 26);
INSERT INTO `sys_oper_log` VALUES (169, '代码生成', 3, 'com.ruoyi.generator.controller.GenController.remove()', 'DELETE', 1, 'admin', '研发部门', '/tool/gen/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:07:35', 34);
INSERT INTO `sys_oper_log` VALUES (170, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '127.0.0.1', '内网IP', '{\"tables\":\"recollections\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:07:41', 73);
INSERT INTO `sys_oper_log` VALUES (171, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"recollections\",\"className\":\"Recollections\",\"columns\":[{\"capJavaField\":\"RecollectionId\",\"columnComment\":\"回忆录id\",\"columnId\":17,\"columnName\":\"recollection_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"recollectionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"RecollectionName\",\"columnComment\":\"回忆录名称\",\"columnId\":18,\"columnName\":\"recollection_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recollectionName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":19,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"temperament\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":20,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":false,\"isIncrement\":\"0', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:10:32', 48);
INSERT INTO `sys_oper_log` VALUES (172, '字典类型', 1, 'com.ruoyi.web.controller.system.SysDictTypeController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/type', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"dictName\":\"我们\",\"dictType\":\"we\",\"params\":{},\"remark\":\"缘不知何起，不知何往\",\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:11:19', 17);
INSERT INTO `sys_oper_log` VALUES (173, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/101', '127.0.0.1', '内网IP', '{}', NULL, 1, '颜色已分配,不能删除', '2024-03-26 14:11:42', 26);
INSERT INTO `sys_oper_log` VALUES (174, '字典类型', 3, 'com.ruoyi.web.controller.system.SysDictTypeController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dict/type/100', '127.0.0.1', '内网IP', '{}', NULL, 1, '性格已分配,不能删除', '2024-03-26 14:11:44', 8);
INSERT INTO `sys_oper_log` VALUES (175, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"清言\",\"dictSort\":0,\"dictType\":\"we\",\"dictValue\":\"1\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:15', 17);
INSERT INTO `sys_oper_log` VALUES (176, '字典数据', 1, 'com.ruoyi.web.controller.system.SysDictDataController.add()', 'POST', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"default\":false,\"dictLabel\":\"栖凰\",\"dictSort\":1,\"dictType\":\"we\",\"dictValue\":\"0\",\"listClass\":\"success\",\"params\":{},\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:30', 15);
INSERT INTO `sys_oper_log` VALUES (177, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:12:30\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"栖凰\",\"dictSort\":1,\"dictType\":\"we\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"info\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:38', 20);
INSERT INTO `sys_oper_log` VALUES (178, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:12:30\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"栖凰\",\"dictSort\":1,\"dictType\":\"we\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"danger\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:43', 35);
INSERT INTO `sys_oper_log` VALUES (179, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:12:30\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"栖凰\",\"dictSort\":1,\"dictType\":\"we\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"warning\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:47', 19);
INSERT INTO `sys_oper_log` VALUES (180, '字典数据', 2, 'com.ruoyi.web.controller.system.SysDictDataController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dict/data', '127.0.0.1', '内网IP', '{\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:12:30\",\"default\":false,\"dictCode\":104,\"dictLabel\":\"栖凰\",\"dictSort\":1,\"dictType\":\"we\",\"dictValue\":\"0\",\"isDefault\":\"N\",\"listClass\":\"primary\",\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:12:52', 14);
INSERT INTO `sys_oper_log` VALUES (181, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '127.0.0.1', '内网IP', '{\"businessName\":\"recollections\",\"className\":\"Recollections\",\"columns\":[{\"capJavaField\":\"RecollectionId\",\"columnComment\":\"回忆录id\",\"columnId\":17,\"columnName\":\"recollection_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"recollectionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:10:32\",\"usableColumn\":false},{\"capJavaField\":\"RecollectionName\",\"columnComment\":\"回忆录名称\",\"columnId\":18,\"columnName\":\"recollection_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recollectionName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:10:32\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":19,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"we\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:10:32\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":20,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"d', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:22:24', 56);
INSERT INTO `sys_oper_log` VALUES (182, '菜单管理', 1, 'com.ruoyi.web.controller.system.SysMenuController.add()', 'POST', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createBy\":\"admin\",\"icon\":\"star\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuName\":\"OurStoryBegin\",\"menuType\":\"M\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"path\":\"ourstorybegin\",\"status\":\"0\",\"visible\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:23:50', 19);
INSERT INTO `sys_oper_log` VALUES (183, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-20 09:39:53\",\"icon\":\"monitor\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2,\"menuName\":\"系统监控\",\"menuType\":\"M\",\"orderNum\":2,\"params\":{},\"parentId\":0,\"path\":\"monitor\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:14', 12);
INSERT INTO `sys_oper_log` VALUES (184, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-20 10:43:21\",\"icon\":\"chart\",\"isCache\":\"0\",\"isFrame\":\"1\",\"menuId\":2000,\"menuName\":\"测试模块\",\"menuType\":\"M\",\"orderNum\":5,\"params\":{},\"parentId\":0,\"path\":\"test\",\"perms\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:23', 15);
INSERT INTO `sys_oper_log` VALUES (185, '菜单管理', 3, 'com.ruoyi.web.controller.system.SysMenuController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/menu/4', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"菜单已分配,不允许删除\",\"code\":601}', 0, NULL, '2024-03-26 14:24:28', 31);
INSERT INTO `sys_oper_log` VALUES (186, '菜单管理', 2, 'com.ruoyi.web.controller.system.SysMenuController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/menu', '127.0.0.1', '内网IP', '{\"children\":[],\"createTime\":\"2024-03-20 09:39:53\",\"icon\":\"guide\",\"isCache\":\"0\",\"isFrame\":\"0\",\"menuId\":4,\"menuName\":\"若依官网\",\"menuType\":\"M\",\"orderNum\":4,\"params\":{},\"parentId\":0,\"path\":\"http://ruoyi.vip\",\"perms\":\"\",\"query\":\"\",\"status\":\"0\",\"updateBy\":\"admin\",\"visible\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:24:38', 13);
INSERT INTO `sys_oper_log` VALUES (187, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile', '10.0.236.10', '内网IP', '{\"admin\":false,\"email\":\"seafra.liu@gmail.com\",\"nickName\":\"栖凰\",\"params\":{},\"phonenumber\":\"18042670817\",\"sex\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:54:10', 23);
INSERT INTO `sys_oper_log` VALUES (188, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.changeStatus()', 'PUT', 1, 'admin', '研发部门', '/system/user/changeStatus', '10.0.236.10', '内网IP', '{\"admin\":false,\"params\":{},\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:54:27', 20);
INSERT INTO `sys_oper_log` VALUES (189, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '10.0.236.10', '内网IP', '{\"admin\":false,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 09:39:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":105,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-03-20 09:39:53\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"若依\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:54:49', 55);
INSERT INTO `sys_oper_log` VALUES (190, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '10.0.236.10', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-20 09:39:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032],\"params\":{},\"remark\":\"普通角色\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:55:03', 63);
INSERT INTO `sys_oper_log` VALUES (191, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', '测试部门', '/system/user/profile/avatar', '10.0.236.10', '内网IP', '', NULL, 1, '文件[1x.webp]后缀[webp]不正确，请上传[bmp, gif, jpg, jpeg, png]格式', '2024-03-26 14:57:12', 6);
INSERT INTO `sys_oper_log` VALUES (192, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'ry', '测试部门', '/system/user/profile/avatar', '10.0.236.10', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/03/26/1x_20240326145722A001.jpg\",\"code\":200}', 0, NULL, '2024-03-26 14:57:22', 97);
INSERT INTO `sys_oper_log` VALUES (193, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updateProfile()', 'PUT', 1, 'ry', '测试部门', '/system/user/profile', '10.0.236.10', '内网IP', '{\"admin\":false,\"email\":\"ry@qq.com\",\"nickName\":\"清言\",\"params\":{},\"phonenumber\":\"15666666666\",\"sex\":\"1\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:57:30', 28);
INSERT INTO `sys_oper_log` VALUES (194, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '10.0.236.10', '内网IP', '{\"businessName\":\"recollections\",\"className\":\"Recollections\",\"columns\":[{\"capJavaField\":\"RecollectionId\",\"columnComment\":\"回忆录id\",\"columnId\":17,\"columnName\":\"recollection_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"recollectionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:22:24\",\"usableColumn\":false},{\"capJavaField\":\"RecollectionName\",\"columnComment\":\"回忆录名称\",\"columnId\":18,\"columnName\":\"recollection_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recollectionName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:22:24\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":19,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"we\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:22:24\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":20,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"d', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 14:59:23', 48);
INSERT INTO `sys_oper_log` VALUES (195, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '10.0.236.10', '内网IP', '{\"tables\":\"recollections\"}', NULL, 0, NULL, '2024-03-26 14:59:26', 594);
INSERT INTO `sys_oper_log` VALUES (196, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '10.0.236.10', '内网IP', '{\"businessName\":\"recollections\",\"className\":\"Recollections\",\"columns\":[{\"capJavaField\":\"RecollectionId\",\"columnComment\":\"回忆录id\",\"columnId\":17,\"columnName\":\"recollection_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"recollectionId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:59:23\",\"usableColumn\":false},{\"capJavaField\":\"RecollectionName\",\"columnComment\":\"回忆录名称\",\"columnId\":18,\"columnName\":\"recollection_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"recollectionName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:59:23\",\"usableColumn\":false},{\"capJavaField\":\"CreateBy\",\"columnComment\":\"创建者\",\"columnId\":19,\"columnName\":\"create_by\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"dictType\":\"we\",\"edit\":false,\"htmlType\":\"select\",\"increment\":false,\"insert\":true,\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isRequired\":\"1\",\"javaField\":\"createBy\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":true,\"sort\":3,\"superColumn\":true,\"tableId\":5,\"updateBy\":\"\",\"updateTime\":\"2024-03-26 14:59:23\",\"usableColumn\":false},{\"capJavaField\":\"CreateTime\",\"columnComment\":\"创建时间\",\"columnId\":20,\"columnName\":\"create_time\",\"columnType\":\"datetime\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 14:07:41\",\"d', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:02:56', 58);
INSERT INTO `sys_oper_log` VALUES (197, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '研发部门', '/tool/gen/batchGenCode', '10.0.236.10', '内网IP', '{\"tables\":\"recollections\"}', NULL, 0, NULL, '2024-03-26 15:02:58', 163);
INSERT INTO `sys_oper_log` VALUES (198, '回忆录', 1, 'com.ruoyi.web.controller.system.RecollectionsController.add()', 'POST', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:15:33', 45);
INSERT INTO `sys_oper_log` VALUES (199, '回忆录', 2, 'com.ruoyi.web.controller.system.RecollectionsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 15:25:27\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:25:27', 17);
INSERT INTO `sys_oper_log` VALUES (200, '回忆录', 2, 'com.ruoyi.web.controller.system.RecollectionsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 15:25:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:25:36', 11);
INSERT INTO `sys_oper_log` VALUES (201, '回忆录', 2, 'com.ruoyi.web.controller.system.RecollectionsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 15:26:05\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:26:05', 17);
INSERT INTO `sys_oper_log` VALUES (202, '回忆录', 2, 'com.ruoyi.web.controller.system.RecollectionsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"1\",\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 15:50:35\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:50:35', 46);
INSERT INTO `sys_oper_log` VALUES (203, '回忆录', 2, 'com.ruoyi.web.controller.system.RecollectionsController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2024-03-26 15:15:33\",\"params\":{},\"recollectionId\":200,\"recollectionName\":\"微信通话\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 15:50:38\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:50:38', 15);
INSERT INTO `sys_oper_log` VALUES (204, '回忆录', 1, 'com.ruoyi.web.controller.system.RecollectionsController.add()', 'POST', 1, 'admin', '研发部门', '/system/recollections', '10.0.236.10', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2024-03-26 15:50:47\",\"params\":{},\"recollectionId\":201,\"recollectionName\":\"光遇\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:50:48', 25);
INSERT INTO `sys_oper_log` VALUES (205, '代码生成', 6, 'com.ruoyi.generator.controller.GenController.importTableSave()', 'POST', 1, 'admin', '研发部门', '/tool/gen/importTable', '10.0.236.10', '内网IP', '{\"tables\":\"memory\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:51:01', 148);
INSERT INTO `sys_oper_log` VALUES (206, '代码生成', 2, 'com.ruoyi.generator.controller.GenController.editSave()', 'PUT', 1, 'admin', '研发部门', '/tool/gen', '10.0.236.10', '内网IP', '{\"businessName\":\"memory\",\"className\":\"Memory\",\"columns\":[{\"capJavaField\":\"MemoryId\",\"columnComment\":\"回忆id\",\"columnId\":24,\"columnName\":\"memory_id\",\"columnType\":\"bigint\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 15:51:01\",\"dictType\":\"\",\"edit\":false,\"htmlType\":\"input\",\"increment\":true,\"insert\":false,\"isIncrement\":\"1\",\"isInsert\":\"0\",\"isList\":\"1\",\"isPk\":\"1\",\"isRequired\":\"0\",\"javaField\":\"memoryId\",\"javaType\":\"Long\",\"list\":true,\"params\":{},\"pk\":true,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":1,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MemoryName\",\"columnComment\":\"回忆名\",\"columnId\":25,\"columnName\":\"memory_name\",\"columnType\":\"varchar(64)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 15:51:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"input\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"1\",\"isRequired\":\"1\",\"javaField\":\"memoryName\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":true,\"queryType\":\"LIKE\",\"required\":true,\"sort\":2,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MemoryImg\",\"columnComment\":\"回忆图片\",\"columnId\":26,\"columnName\":\"memory_img\",\"columnType\":\"varchar(128)\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 15:51:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"imageUpload\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"isPk\":\"0\",\"isQuery\":\"0\",\"isRequired\":\"0\",\"javaField\":\"memoryImg\",\"javaType\":\"String\",\"list\":true,\"params\":{},\"pk\":false,\"query\":false,\"queryType\":\"EQ\",\"required\":false,\"sort\":3,\"superColumn\":false,\"tableId\":6,\"updateBy\":\"\",\"usableColumn\":false},{\"capJavaField\":\"MemoryTime\",\"columnComment\":\"持续时间\",\"columnId\":27,\"columnName\":\"memory_time\",\"columnType\":\"time\",\"createBy\":\"admin\",\"createTime\":\"2024-03-26 15:51:01\",\"dictType\":\"\",\"edit\":true,\"htmlType\":\"datetime\",\"increment\":false,\"insert\":true,\"isEdit\":\"1\",\"isIncrement\":\"0\",\"isInsert\":\"1\",\"isList\":\"1\",\"is', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 15:55:10', 96);
INSERT INTO `sys_oper_log` VALUES (207, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/103', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-03-26 16:45:54', 21);
INSERT INTO `sys_oper_log` VALUES (208, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/104', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:45:57', 26);
INSERT INTO `sys_oper_log` VALUES (209, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/105', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"部门存在用户,不允许删除\",\"code\":601}', 0, NULL, '2024-03-26 16:45:58', 28);
INSERT INTO `sys_oper_log` VALUES (210, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/106', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:46:00', 22);
INSERT INTO `sys_oper_log` VALUES (211, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"存在下级部门,不允许删除\",\"code\":601}', 0, NULL, '2024-03-26 16:46:02', 20);
INSERT INTO `sys_oper_log` VALUES (212, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/108', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:46:04', 21);
INSERT INTO `sys_oper_log` VALUES (213, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/109', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:46:06', 55);
INSERT INTO `sys_oper_log` VALUES (214, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/102', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:46:08', 48);
INSERT INTO `sys_oper_log` VALUES (215, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/107', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:46:10', 43);
INSERT INTO `sys_oper_log` VALUES (216, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"流光忆庭\",\"leader\":\"栖凰\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:47:11', 32);
INSERT INTO `sys_oper_log` VALUES (217, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0\",\"children\":[],\"deptId\":100,\"deptName\":\"世界美好收集委员会\",\"email\":\"ry@qq.com\",\"leader\":\"栖凰凰\",\"orderNum\":0,\"params\":{},\"parentId\":0,\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:47:37', 36);
INSERT INTO `sys_oper_log` VALUES (218, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 09:39:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"seafra.liu@gmail.com\",\"loginDate\":\"2024-03-26 16:45:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"栖凰\",\"params\":{},\"phonenumber\":\"18042670817\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-03-26 16:48:07', 4);
INSERT INTO `sys_oper_log` VALUES (219, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":true,\"avatar\":\"\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 09:39:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"研发部门\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":200,\"email\":\"seafra.liu@gmail.com\",\"loginDate\":\"2024-03-26 16:45:24\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"栖凰\",\"params\":{},\"phonenumber\":\"18042670817\",\"postIds\":[1],\"remark\":\"管理员\",\"roleIds\":[1],\"roles\":[{\"admin\":true,\"dataScope\":\"1\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":1,\"roleKey\":\"admin\",\"roleName\":\"超级管理员\",\"roleSort\":1,\"status\":\"0\"}],\"sex\":\"0\",\"status\":\"0\",\"userId\":1,\"userName\":\"admin\"}', NULL, 1, '不允许操作超级管理员用户', '2024-03-26 16:48:08', 1);
INSERT INTO `sys_oper_log` VALUES (220, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'admin', '研发部门', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:48:57', 417);
INSERT INTO `sys_oper_log` VALUES (221, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"流光忆庭\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"世界美好收集委员会\",\"phone\":\"15888888888\",\"status\":\"0\"}', '{\"msg\":\"修改部门\'流光忆庭\'失败，部门名称已存在\",\"code\":500}', 0, NULL, '2024-03-26 16:50:16', 9);
INSERT INTO `sys_oper_log` VALUES (222, '部门管理', 3, 'com.ruoyi.web.controller.system.SysDeptController.remove()', 'DELETE', 1, 'admin', '研发部门', '/system/dept/200', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:50:29', 27);
INSERT INTO `sys_oper_log` VALUES (223, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"deptId\":101,\"deptName\":\"流光忆庭\",\"email\":\"ry@qq.com\",\"leader\":\"清言\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"parentName\":\"世界美好收集委员会\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:50:39', 54);
INSERT INTO `sys_oper_log` VALUES (224, '部门管理', 2, 'com.ruoyi.web.controller.system.SysDeptController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":103,\"deptName\":\"忆质收集部门\",\"email\":\"ry@qq.com\",\"leader\":\"若依\",\"orderNum\":1,\"params\":{},\"parentId\":101,\"parentName\":\"流光忆庭\",\"phone\":\"15888888888\",\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:51:08', 44);
INSERT INTO `sys_oper_log` VALUES (225, '部门管理', 1, 'com.ruoyi.web.controller.system.SysDeptController.add()', 'POST', 1, 'admin', '研发部门', '/system/dept', '127.0.0.1', '内网IP', '{\"ancestors\":\"0,100\",\"children\":[],\"createBy\":\"admin\",\"deptName\":\"为往圣继绝学\",\"orderNum\":1,\"params\":{},\"parentId\":100,\"status\":\"0\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:51:45', 21);
INSERT INTO `sys_oper_log` VALUES (226, '用户管理', 2, 'com.ruoyi.web.controller.system.SysUserController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/user', '127.0.0.1', '内网IP', '{\"admin\":false,\"avatar\":\"/profile/avatar/2024/03/26/1x_20240326145722A001.jpg\",\"createBy\":\"admin\",\"createTime\":\"2024-03-20 09:39:53\",\"delFlag\":\"0\",\"dept\":{\"ancestors\":\"0,100,101\",\"children\":[],\"deptId\":105,\"deptName\":\"测试部门\",\"leader\":\"若依\",\"orderNum\":3,\"params\":{},\"parentId\":101,\"status\":\"0\"},\"deptId\":201,\"email\":\"ry@qq.com\",\"loginDate\":\"2024-03-26 16:45:13\",\"loginIp\":\"127.0.0.1\",\"nickName\":\"清言\",\"params\":{},\"phonenumber\":\"15666666666\",\"postIds\":[],\"remark\":\"测试员\",\"roleIds\":[2],\"roles\":[{\"admin\":false,\"dataScope\":\"2\",\"deptCheckStrictly\":false,\"flag\":false,\"menuCheckStrictly\":false,\"params\":{},\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"普通角色\",\"roleSort\":2,\"status\":\"0\"}],\"sex\":\"1\",\"status\":\"0\",\"updateBy\":\"admin\",\"userId\":2,\"userName\":\"ry\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:52:09', 58);
INSERT INTO `sys_oper_log` VALUES (227, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '研发部门', '/system/role', '127.0.0.1', '内网IP', '{\"admin\":false,\"createTime\":\"2024-03-20 09:39:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2034,2035,2036,2037,2038],\"params\":{},\"remark\":\"有个还在读书的小孩\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"学生\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:52:53', 48);
INSERT INTO `sys_oper_log` VALUES (228, '用户头像', 2, 'com.ruoyi.web.controller.system.SysProfileController.avatar()', 'POST', 1, 'qingyan', '为往圣继绝学', '/system/user/profile/avatar', '127.0.0.1', '内网IP', '', '{\"msg\":\"操作成功\",\"imgUrl\":\"/profile/avatar/2024/03/26/1711443484447_20240326165815A001.jpg\",\"code\":200}', 0, NULL, '2024-03-26 16:58:15', 104);
INSERT INTO `sys_oper_log` VALUES (229, '个人信息', 2, 'com.ruoyi.web.controller.system.SysProfileController.updatePwd()', 'PUT', 1, 'qingyan', '为往圣继绝学', '/system/user/profile/updatePwd', '127.0.0.1', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 16:58:42', 446);
INSERT INTO `sys_oper_log` VALUES (230, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '忆质收集部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"recollections\"}', NULL, 0, NULL, '2024-03-26 16:59:17', 304);
INSERT INTO `sys_oper_log` VALUES (231, '代码生成', 8, 'com.ruoyi.generator.controller.GenController.batchGenCode()', 'GET', 1, 'admin', '忆质收集部门', '/tool/gen/batchGenCode', '127.0.0.1', '内网IP', '{\"tables\":\"memory\"}', NULL, 0, NULL, '2024-03-26 16:59:25', 186);
INSERT INTO `sys_oper_log` VALUES (232, '回忆', 1, 'com.ruoyi.web.controller.system.MemoryController.add()', 'POST', 1, 'admin', '忆质收集部门', '/system/memory', '127.0.0.1', '内网IP', '{\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"2024-03-26\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:34:43', 69);
INSERT INTO `sys_oper_log` VALUES (233, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"0027-12-21\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:39:25\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:39:26', 24);
INSERT INTO `sys_oper_log` VALUES (234, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:40:41\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:40:42', 49);
INSERT INTO `sys_oper_log` VALUES (235, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"0026-11-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:40:52\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:40:52', 10);
INSERT INTO `sys_oper_log` VALUES (236, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '127.0.0.1', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:41:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:41:34', 17);
INSERT INTO `sys_oper_log` VALUES (237, '回忆', 1, 'com.ruoyi.web.controller.system.MemoryController.add()', 'POST', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createTime\":\"2024-03-26 17:43:54\",\"memoryId\":1001,\"memoryName\":\"1\",\"memoryTime\":\"0020-08-17\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:43:55', 15);
INSERT INTO `sys_oper_log` VALUES (238, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:43:55\",\"memoryId\":1001,\"memoryImg\":\"\",\"memoryName\":\"1\",\"memoryTime\":\"0021-12-30\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:44:02\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:44:02', 21);
INSERT INTO `sys_oper_log` VALUES (239, '回忆', 3, 'com.ruoyi.web.controller.system.MemoryController.remove()', 'DELETE', 1, 'admin', '忆质收集部门', '/system/memory/1001', '10.0.236.10', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:44:30', 35);
INSERT INTO `sys_oper_log` VALUES (240, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:46:04\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:46:04', 18);
INSERT INTO `sys_oper_log` VALUES (241, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:46:11\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:46:12', 17);
INSERT INTO `sys_oper_log` VALUES (242, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"0021-12-30\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:46:39\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:46:40', 13);
INSERT INTO `sys_oper_log` VALUES (243, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:50:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:50:01', 7);
INSERT INTO `sys_oper_log` VALUES (244, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:50:12\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:50:13', 15);
INSERT INTO `sys_oper_log` VALUES (245, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"1970-01-01\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:50:31\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:50:32', 13);
INSERT INTO `sys_oper_log` VALUES (246, '回忆', 1, 'com.ruoyi.web.controller.system.MemoryController.add()', 'POST', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createTime\":\"2024-03-26 17:55:40\",\"memoryId\":1002,\"memoryName\":\"1\",\"memoryTime\":\"23:59:58\",\"params\":{}}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:55:41', 42);
INSERT INTO `sys_oper_log` VALUES (247, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:55:41\",\"memoryId\":1002,\"memoryImg\":\"\",\"memoryName\":\"1\",\"memoryTime\":\"23:59:58\",\"params\":{},\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:55:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:55:48', 20);
INSERT INTO `sys_oper_log` VALUES (248, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"11:59:53\",\"params\":{},\"remark\":\"今晚聊了下被表白的情感经历，尝试了一下不断电话，事实证明只要亮着屏幕就不会挂，但是26号中午还是一不小心中断了，遗憾没能到12小时，更遗憾没能坚持到清言回家\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 17:58:13\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:58:13', 27);
INSERT INTO `sys_oper_log` VALUES (249, '回忆', 3, 'com.ruoyi.web.controller.system.MemoryController.remove()', 'DELETE', 1, 'admin', '忆质收集部门', '/system/memory/1002', '10.0.236.10', '内网IP', '{}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 17:58:19', 37);
INSERT INTO `sys_oper_log` VALUES (250, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"11:59:53\",\"params\":{},\"recollectionId\":200,\"remark\":\"今晚聊了下被表白的情感经历，尝试了一下不断电话，事实证明只要亮着屏幕就不会挂，但是26号中午还是一不小心中断了，遗憾没能到12小时，更遗憾没能坚持到清言回家\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 18:12:01\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 18:12:01', 12);
INSERT INTO `sys_oper_log` VALUES (251, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"11:59:53\",\"params\":{},\"recollectionId\":200,\"remark\":\"今晚聊了下被表白的情感经历，尝试了一下不断电话，事实证明只要亮着屏幕就不会挂，但是26号中午还是一不小心中断了，遗憾没能到12小时，更遗憾没能坚持到清言回家\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 18:34:33\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 18:34:33', 49);
INSERT INTO `sys_oper_log` VALUES (252, '回忆', 2, 'com.ruoyi.web.controller.system.MemoryController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/memory', '10.0.236.10', '内网IP', '{\"createBy\":\"0\",\"createTime\":\"2024-03-26 17:34:43\",\"memoryId\":1000,\"memoryImg\":\"/profile/upload/2024/03/26/25号晚_20240326173435A003.jpg\",\"memoryName\":\"25号晚\",\"memoryTime\":\"11:59:53\",\"params\":{},\"recollectionId\":200,\"remark\":\"今晚聊了下被表白的情感经历，尝试了一下不断电话，事实证明只要亮着屏幕就不会挂，但是26号中午还是一不小心中断了，遗憾没能到12小时，更遗憾没能坚持到清言回家\",\"updateBy\":\"\",\"updateTime\":\"2024-03-26 18:37:48\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 18:37:49', 43);
INSERT INTO `sys_oper_log` VALUES (253, '角色管理', 2, 'com.ruoyi.web.controller.system.SysRoleController.edit()', 'PUT', 1, 'admin', '忆质收集部门', '/system/role', '123.185.110.81', 'XX XX', '{\"admin\":false,\"createTime\":\"2024-03-20 09:39:53\",\"dataScope\":\"2\",\"delFlag\":\"0\",\"deptCheckStrictly\":true,\"flag\":false,\"menuCheckStrictly\":true,\"menuIds\":[2032,2033,2034,2035,2036,2037,2038,2039,2040,2041,2042,2043,2044],\"params\":{},\"remark\":\"有个还在读书的小孩\",\"roleId\":2,\"roleKey\":\"common\",\"roleName\":\"学生\",\"roleSort\":2,\"status\":\"0\",\"updateBy\":\"admin\"}', '{\"msg\":\"操作成功\",\"code\":200}', 0, NULL, '2024-03-26 19:41:49', 82);

-- ----------------------------
-- Table structure for sys_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_post`;
CREATE TABLE `sys_post`  (
  `post_id` bigint NOT NULL AUTO_INCREMENT COMMENT '岗位ID',
  `post_code` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位编码',
  `post_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '岗位名称',
  `post_sort` int NOT NULL COMMENT '显示顺序',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '状态（0正常 1停用）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`post_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '岗位信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_post
-- ----------------------------
INSERT INTO `sys_post` VALUES (1, 'ceo', '董事长', 1, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (2, 'se', '项目经理', 2, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (3, 'hr', '人力资源', 3, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '');
INSERT INTO `sys_post` VALUES (4, 'user', '普通员工', 4, '0', 'admin', '2024-03-20 09:39:53', '', NULL, '');

-- ----------------------------
-- Table structure for sys_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_role`;
CREATE TABLE `sys_role`  (
  `role_id` bigint NOT NULL AUTO_INCREMENT COMMENT '角色ID',
  `role_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色名称',
  `role_key` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色权限字符串',
  `role_sort` int NOT NULL COMMENT '显示顺序',
  `data_scope` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '1' COMMENT '数据范围（1：全部数据权限 2：自定数据权限 3：本部门数据权限 4：本部门及以下数据权限）',
  `menu_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '菜单树选择项是否关联显示',
  `dept_check_strictly` tinyint(1) NULL DEFAULT 1 COMMENT '部门树选择项是否关联显示',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '角色状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role
-- ----------------------------
INSERT INTO `sys_role` VALUES (1, '超级管理员', 'admin', 1, '1', 1, 1, '0', '0', 'admin', '2024-03-20 09:39:53', '', NULL, '超级管理员');
INSERT INTO `sys_role` VALUES (2, '学生', 'common', 2, '2', 1, 1, '0', '0', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 19:41:48', '有个还在读书的小孩');

-- ----------------------------
-- Table structure for sys_role_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_dept`;
CREATE TABLE `sys_role_dept`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `dept_id` bigint NOT NULL COMMENT '部门ID',
  PRIMARY KEY (`role_id`, `dept_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和部门关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_dept
-- ----------------------------
INSERT INTO `sys_role_dept` VALUES (2, 100);
INSERT INTO `sys_role_dept` VALUES (2, 101);
INSERT INTO `sys_role_dept` VALUES (2, 105);

-- ----------------------------
-- Table structure for sys_role_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_role_menu`;
CREATE TABLE `sys_role_menu`  (
  `role_id` bigint NOT NULL COMMENT '角色ID',
  `menu_id` bigint NOT NULL COMMENT '菜单ID',
  PRIMARY KEY (`role_id`, `menu_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '角色和菜单关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_role_menu
-- ----------------------------
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

-- ----------------------------
-- Table structure for sys_user
-- ----------------------------
DROP TABLE IF EXISTS `sys_user`;
CREATE TABLE `sys_user`  (
  `user_id` bigint NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `dept_id` bigint NULL DEFAULT NULL COMMENT '部门ID',
  `user_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户账号',
  `nick_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL COMMENT '用户昵称',
  `user_type` varchar(2) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '00' COMMENT '用户类型（00系统用户）',
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '用户邮箱',
  `phonenumber` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '手机号码',
  `sex` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '用户性别（0男 1女 2未知）',
  `avatar` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '头像地址',
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '密码',
  `status` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '帐号状态（0正常 1停用）',
  `del_flag` char(1) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '0' COMMENT '删除标志（0代表存在 2代表删除）',
  `login_ip` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '最后登录IP',
  `login_date` datetime NULL DEFAULT NULL COMMENT '最后登录时间',
  `create_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '创建者',
  `create_time` datetime NULL DEFAULT NULL COMMENT '创建时间',
  `update_by` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT '' COMMENT '更新者',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `remark` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 100 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户信息表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user
-- ----------------------------
INSERT INTO `sys_user` VALUES (1, 103, 'admin', '栖凰', '00', 'seafra.liu@gmail.com', '18042670817', '0', '', '$2a$10$XWy2HNhHK1hI2oATxq0Ne.Nq1DswBp4fmfakt7/aDXgUExZojLpVK', '0', '0', '123.185.110.81', '2024-03-26 19:40:29', 'admin', '2024-03-20 09:39:53', '', '2024-03-26 19:40:29', '管理员');
INSERT INTO `sys_user` VALUES (2, 201, 'qingyan', '清言', '00', 'ry@qq.com', '15666666666', '1', '/profile/avatar/2024/03/26/1711443484447_20240326165815A001.jpg', '$2a$10$1jE0JXqKVdhMBcXj5Wr1buFZ6ZnRO1m0Uj2pNS9fL8U.aztJrAnG6', '0', '0', '123.185.110.81', '2024-03-26 19:45:24', 'admin', '2024-03-20 09:39:53', 'admin', '2024-03-26 19:45:23', '测试员');

-- ----------------------------
-- Table structure for sys_user_post
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_post`;
CREATE TABLE `sys_user_post`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `post_id` bigint NOT NULL COMMENT '岗位ID',
  PRIMARY KEY (`user_id`, `post_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户与岗位关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_post
-- ----------------------------
INSERT INTO `sys_user_post` VALUES (1, 1);

-- ----------------------------
-- Table structure for sys_user_role
-- ----------------------------
DROP TABLE IF EXISTS `sys_user_role`;
CREATE TABLE `sys_user_role`  (
  `user_id` bigint NOT NULL COMMENT '用户ID',
  `role_id` bigint NOT NULL COMMENT '角色ID',
  PRIMARY KEY (`user_id`, `role_id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci COMMENT = '用户和角色关联表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of sys_user_role
-- ----------------------------
INSERT INTO `sys_user_role` VALUES (1, 1);
INSERT INTO `sys_user_role` VALUES (2, 2);

SET FOREIGN_KEY_CHECKS = 1;
