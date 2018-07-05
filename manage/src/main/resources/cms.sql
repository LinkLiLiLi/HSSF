/*
Navicat MySQL Data Transfer

Source Server         : loccalhost
Source Server Version : 50529
Source Host           : localhost:3306
Source Database       : cms

Target Server Type    : MYSQL
Target Server Version : 50529
File Encoding         : 65001

Date: 2018-01-21 21:33:12
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for abnormal_attendance_t
-- ----------------------------
DROP TABLE IF EXISTS `abnormal_attendance_t`;
CREATE TABLE `abnormal_attendance_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '用户id',
  `abnormal_date` date DEFAULT NULL COMMENT '异常日期',
  `abnormal_type` int(11) DEFAULT NULL COMMENT '异常类型（0：旷工；1：迟到；2：早退；10：正常）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_8` (`user_id`),
  CONSTRAINT `FK_Reference_8` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='考勤异常情况表';

-- ----------------------------
-- Records of abnormal_attendance_t
-- ----------------------------
INSERT INTO `abnormal_attendance_t` VALUES ('6c78e9fe9b4748dcb6720c8e5864d555', '68ff9976be70420d83e48fc536cf1fd2', '2017-07-23', '0', 'api', '2017-07-24 18:48:13', null, null);
INSERT INTO `abnormal_attendance_t` VALUES ('73d478d60112433a909d3ca1b449a966', 'd5b3b7c05e754db9b9882d02b4a6e57c', '2017-07-14', '1', 'api', '2017-07-17 21:08:00', null, null);
INSERT INTO `abnormal_attendance_t` VALUES ('bbc20567bd974bb3befc6e13214ef1a4', 'd5b3b7c05e754db9b9882d02b4a6e57c', '2017-07-23', '0', 'api', '2017-07-24 17:39:46', null, null);
INSERT INTO `abnormal_attendance_t` VALUES ('bc3b34023fd44f7db9f0b0e85bbc9d8b', '55e0c7400ea54b33921c4e908ea61c09', '2017-07-23', '1', 'api', '2017-07-24 18:47:47', null, null);
INSERT INTO `abnormal_attendance_t` VALUES ('ca9429cc8c0d4746895560567b4a1000', '55e0c7400ea54b33921c4e908ea61c09', '2017-07-10', '2', 'api', '2017-07-16 23:28:29', null, null);
INSERT INTO `abnormal_attendance_t` VALUES ('d3ff1a55b81c416ab4c7dfac453f0c39', 'd5b3b7c05e754db9b9882d02b4a6e57c', '2017-07-09', '10', 'api', '2017-07-16 23:23:43', 'api', '2017-07-16 23:25:16');

-- ----------------------------
-- Table structure for absent_t
-- ----------------------------
DROP TABLE IF EXISTS `absent_t`;
CREATE TABLE `absent_t` (
  `id` char(32) NOT NULL,
  `absent_type` int(11) NOT NULL COMMENT '1：请假；2：外出；3：出差；4：加班',
  `start_time` datetime NOT NULL,
  `end_time` datetime NOT NULL,
  `reason` varchar(200) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `user_id` char(32) NOT NULL,
  `duration` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK667504EEB2777AC` (`user_id`),
  CONSTRAINT `FK667504EEB2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of absent_t
-- ----------------------------
INSERT INTO `absent_t` VALUES ('0266c5d113244206915b449d6a181bd0', '2', '2018-01-21 00:00:00', '2018-01-25 00:00:00', 'asd', 'api', '2018-01-21 11:34:51', null, null, '96e79218965eb72c92a549dd5a330112', '');
INSERT INTO `absent_t` VALUES ('2bec9c471ab74ac1b3f1a31fdd776aae', '1', '2018-01-09 16:00:00', '2018-01-09 19:00:00', '123', 'api', '2018-01-09 16:55:49', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '2');
INSERT INTO `absent_t` VALUES ('34faee5bfca248d4907cb485dfb57965', '4', '2018-01-10 10:00:00', '2018-01-10 19:00:00', '123123123', 'api', '2018-01-10 10:37:22', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '1');
INSERT INTO `absent_t` VALUES ('59516d3dac1a4b7ca21c71616f981a7c', '4', '2018-01-10 10:00:00', '2018-01-10 23:00:00', 'asd', 'api', '2018-01-10 10:22:41', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '1');
INSERT INTO `absent_t` VALUES ('5b12a37b6be44b32a100263361f83d5f', '4', '2018-01-10 04:00:00', '2018-01-10 20:00:00', '123123123', 'api', '2018-01-10 10:27:36', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '12');
INSERT INTO `absent_t` VALUES ('8a1297f510ec4dab8d48d879626aa330', '1', '2018-01-09 17:00:00', '2018-01-09 23:00:00', '阿斯达撒旦', 'api', '2018-01-09 17:17:34', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '12.5');
INSERT INTO `absent_t` VALUES ('9aa33e504bac492585c44e68c6df115b', '4', '2018-01-10 10:00:00', '2018-01-10 23:00:00', '123123123', 'api', '2018-01-10 10:27:09', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '1');
INSERT INTO `absent_t` VALUES ('a15573047ae34abea95766f8e3f353b5', '2', '2018-01-03 09:00:00', '2018-01-03 17:30:00', '家中有事', 'api', '2018-01-03 15:51:09', null, null, '68ff9976be70420d83e48fc536cf1fd2', '10');
INSERT INTO `absent_t` VALUES ('a6279205e83940269233268210daab4b', '4', '2018-01-10 10:00:00', '2018-01-10 20:00:00', '1231231', 'api', '2018-01-10 10:28:39', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '12');
INSERT INTO `absent_t` VALUES ('ac5689a58f1b462987d0e9ca3ed4a266', '2', '2018-01-09 17:00:00', '2018-01-09 23:00:00', '阿达', 'api', '2018-01-09 17:17:49', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '0.2');
INSERT INTO `absent_t` VALUES ('bb4bf214b9b8400596a0cc10a617927a', '4', '2018-01-10 10:00:00', '2018-01-10 23:00:00', 'asd', 'api', '2018-01-10 10:38:26', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '1');
INSERT INTO `absent_t` VALUES ('c2ea1bd4072a45d5bc5bafbd69cf08e2', '3', '2018-01-09 17:00:00', '2018-01-09 23:00:00', '大的', 'api', '2018-01-09 17:18:33', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '12');
INSERT INTO `absent_t` VALUES ('ebf6edceb0fe4f869411b4af187de498', '1', '2018-01-09 17:00:00', '2018-01-09 23:00:00', '戚薇戚薇戚薇', 'api', '2018-01-09 17:07:17', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '1');
INSERT INTO `absent_t` VALUES ('ed817b19933143bfaeeea257015bc43c', '4', '2018-01-10 10:00:00', '2018-01-10 21:00:00', '1111', 'api', '2018-01-10 10:37:45', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', '111');
INSERT INTO `absent_t` VALUES ('fa6395df90da4065b7d53013bb3d1cb9', '4', '2018-01-09 17:00:00', '2018-01-09 23:00:00', '12313123', 'api', '2018-01-09 17:18:47', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', '123');

-- ----------------------------
-- Table structure for apply_back_to_school_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_back_to_school_t`;
CREATE TABLE `apply_back_to_school_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `dept_name` varchar(50) DEFAULT NULL COMMENT '所在部门',
  `apply_time` date DEFAULT NULL COMMENT '申请日期',
  `user_name` varchar(20) DEFAULT NULL COMMENT '学生姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `school` varchar(100) DEFAULT NULL COMMENT '就读学校',
  `entrance_time` date DEFAULT NULL COMMENT '入学时间',
  `center_time` date DEFAULT NULL COMMENT '入中心时间',
  `cultivation_mode` varchar(20) DEFAULT NULL COMMENT '培养方式',
  `tutor` varchar(20) DEFAULT NULL COMMENT '导师姓名',
  `leave_time` date DEFAULT NULL COMMENT '拟离开中心时间',
  `reason` varchar(100) DEFAULT NULL COMMENT '原由',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_40` (`add_user`),
  CONSTRAINT `FK_Reference_40` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='学生返校申请表';

-- ----------------------------
-- Records of apply_back_to_school_t
-- ----------------------------
INSERT INTO `apply_back_to_school_t` VALUES ('779d57fe31df434ab6f8d068ee330bd4', '业务一部', '2017-08-09', 'L', '1', '清华大学', '2017-08-01', '2017-08-02', '不知道', '张三', '2017-08-03', '毕业答辩', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2017-08-09 21:23:20', 'api', '2017-12-31 14:05:15');

-- ----------------------------
-- Table structure for apply_change_dept_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_change_dept_t`;
CREATE TABLE `apply_change_dept_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `apply_time` date DEFAULT NULL COMMENT '申请日期',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `center_time` date DEFAULT NULL COMMENT '入中心时间',
  `before_dept` varchar(50) DEFAULT NULL COMMENT '变动前部门',
  `after_dept` varchar(50) DEFAULT NULL COMMENT '变动后部门',
  `change_type` int(11) DEFAULT NULL COMMENT '变动类别（0：调岗；1：借调；2：调薪；3其他）',
  `change_end_time` date DEFAULT NULL COMMENT '借调截止时间',
  `other_info` varchar(50) DEFAULT NULL COMMENT '其他',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `after_amount` int(11) DEFAULT NULL,
  `before_amount` int(11) DEFAULT NULL,
  `change_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_38` (`add_user`),
  CONSTRAINT `FK_Reference_38` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内部变动表';

-- ----------------------------
-- Records of apply_change_dept_t
-- ----------------------------
INSERT INTO `apply_change_dept_t` VALUES ('597ebe09074441fc95631f0b0ed249d5', '2017-08-10', 'L', '2017-08-01', '科技发展部', '技术研究部', '2', '2017-08-10', '1', 'api', '2017-08-10 22:17:23', 'api', '2017-12-31 14:30:06', '68ff9976be70420d83e48fc536cf1fd2', '6000', '5000', '2017-09-01');

-- ----------------------------
-- Table structure for apply_cheque_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_cheque_detail_t`;
CREATE TABLE `apply_cheque_detail_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '申请人',
  `creator` varchar(32) NOT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `pay_unit` varchar(50) DEFAULT NULL,
  `pay_project` varchar(200) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `use_info` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `cheque_id` char(32) DEFAULT NULL,
  `project_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8C7DA59383406070` (`cheque_id`),
  KEY `FK8C7DA593B2777AC` (`user_id`),
  KEY `FK8C7DA5934CD7B278` (`project_id`),
  CONSTRAINT `FK8C7DA5934CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FK8C7DA59383406070` FOREIGN KEY (`cheque_id`) REFERENCES `apply_cheque_t` (`id`),
  CONSTRAINT `FK8C7DA593B2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_cheque_detail_t
-- ----------------------------
INSERT INTO `apply_cheque_detail_t` VALUES ('1e7cf045272444209ac05594657578b4', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2018-01-01 20:59:23', null, null, 'q', '横向课题', 'q', 'q', '2', 'q', 'q', 'bca59328c1144ef1833c121ce6a1533e', '263ef7665c0a42e4acfbfaac865622ca');
INSERT INTO `apply_cheque_detail_t` VALUES ('25d49e4f9069409fbdba03b4e3a1fb17', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2017-12-31 16:04:55', null, null, '1', '2', '3', '3', '4', '5', '6', '118ea6fbe93d412eba9656347332dbe3', null);
INSERT INTO `apply_cheque_detail_t` VALUES ('8a57310fbce348cf9187471c5cb1b62a', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2018-01-01 20:59:23', null, null, '12', '横向课题', '12', '12', '12', '12', '12', 'bca59328c1144ef1833c121ce6a1533e', '263ef7665c0a42e4acfbfaac865622ca');
INSERT INTO `apply_cheque_detail_t` VALUES ('e7092c0fb853425eb2acbf0bd732196d', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2018-01-01 20:59:23', null, null, 'qw', '农业智能感知', 'qwe', 'qwe', '12', 'qw', 'qwe', 'bca59328c1144ef1833c121ce6a1533e', '49f4104393604a00925f6072187620b1');

-- ----------------------------
-- Table structure for apply_cheque_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_cheque_t`;
CREATE TABLE `apply_cheque_t` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `apply_date` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `key_words` varchar(500) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_cheque_t
-- ----------------------------
INSERT INTO `apply_cheque_t` VALUES ('118ea6fbe93d412eba9656347332dbe3', 'L领用', '2017-11-09 00:00:00', 'api', '2017-11-09 10:44:24', 'api', '2018-01-01 21:07:46', '1|2|5|3', null, '1');
INSERT INTO `apply_cheque_t` VALUES ('bca59328c1144ef1833c121ce6a1533e', 'qqq', '2018-01-02 00:00:00', 'api', '2018-01-01 20:01:00', 'api', '2018-01-01 21:06:29', 'qw|农业智能感知|qw|qweq|横向课题|q|q12|横向课题|12|12', 'kijhgfds', '1');

-- ----------------------------
-- Table structure for apply_expert_fee_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_expert_fee_t`;
CREATE TABLE `apply_expert_fee_t` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `apply_date` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `key_words` varchar(500) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_expert_fee_t
-- ----------------------------
INSERT INTO `apply_expert_fee_t` VALUES ('36c9d5808de94d3bb1c910a376fac662', 'asdasd', '2018-01-16 00:00:00', 'api', '2018-01-07 20:06:11', null, null, '111|11|1|1', 'asd', null);
INSERT INTO `apply_expert_fee_t` VALUES ('62bd092edbe44a7ebbcfa195096d5e5a', 'L转件报销票', '2017-11-09 00:00:00', 'api', '2017-11-09 11:56:25', 'api', '2018-01-01 22:35:07', 'L|220323125225222x|英泰伟业|java研发', 'sda', '1');

-- ----------------------------
-- Table structure for apply_leave_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_leave_t`;
CREATE TABLE `apply_leave_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `apply_time` date DEFAULT NULL COMMENT '填写时间',
  `user_id` char(32) DEFAULT NULL COMMENT '申请人',
  `user_group_id` char(32) DEFAULT NULL COMMENT '所属小组',
  `leave_type` int(11) DEFAULT NULL COMMENT '请假类别（1：公差；2：病假；3：事假；4：其他）',
  `reason` varchar(200) DEFAULT NULL COMMENT '请假事由及去向',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `contact_user` varchar(20) DEFAULT NULL COMMENT '紧急联系人',
  `contact_mobile` varchar(20) DEFAULT NULL COMMENT '紧急联系电话',
  `beginTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始请假时间',
  `endTime` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束请假时间',
  `apply_type` int(11) DEFAULT NULL COMMENT '请假类型（0：员工；1：学生）',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_36` (`user_id`),
  CONSTRAINT `FK_Reference_36` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假申请表';

-- ----------------------------
-- Records of apply_leave_t
-- ----------------------------
INSERT INTO `apply_leave_t` VALUES ('71f28c4a55964c35a31c0d1303de54b9', '2017-07-30', '68ff9976be70420d83e48fc536cf1fd2', null, '2', '请假回家探亲', '13621299528', '彭麻麻', '13258965896', '2017-12-31 00:00:00', '2017-12-31 00:00:00', '0', 'api', '2017-08-20 12:38:31', 'api', '2017-12-31 15:07:19');

-- ----------------------------
-- Table structure for apply_need_hands_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_need_hands_t`;
CREATE TABLE `apply_need_hands_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `dept` varchar(50) DEFAULT NULL COMMENT '用人部门',
  `apply_date` date DEFAULT NULL COMMENT '申请日期',
  `post` int(11) DEFAULT NULL COMMENT '聘用岗位',
  `employ_type` int(11) DEFAULT NULL COMMENT '聘用方式',
  `userName` varchar(20) DEFAULT NULL COMMENT '拟聘人姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `age` int(11) DEFAULT NULL COMMENT '年龄',
  `education` varchar(20) DEFAULT NULL COMMENT '拟聘人学历',
  `join_date` date DEFAULT NULL COMMENT '入职日期	',
  `term_date` date DEFAULT NULL COMMENT '合同期限',
  `amount` int(11) DEFAULT NULL COMMENT '岗位津贴',
  `trial_amount` int(11) DEFAULT NULL COMMENT '试用期期限',
  `trial_amount_subsidy` int(11) DEFAULT NULL COMMENT '试用期岗位津贴',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `term_amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_35` (`add_user`),
  CONSTRAINT `FK_Reference_35` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用人申请表';

-- ----------------------------
-- Records of apply_need_hands_t
-- ----------------------------
INSERT INTO `apply_need_hands_t` VALUES ('11f939596ea447818757d254652a7536', '市场拓展', '2017-08-08', '3', '2', '土豆', '1', '15', '博士', '2017-08-08', null, '3500', '31', '200', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2017-08-08 22:53:51', 'api', '2017-12-31 13:43:21', '3');

-- ----------------------------
-- Table structure for apply_overtime_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_overtime_t`;
CREATE TABLE `apply_overtime_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `apply_time` date DEFAULT NULL COMMENT '填写时间',
  `user_id` char(32) DEFAULT NULL COMMENT '申请人',
  `user_group_id` char(32) DEFAULT NULL COMMENT '所属小组',
  `reason` varchar(100) DEFAULT NULL COMMENT '加班事由',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `concat_user` varchar(50) DEFAULT NULL COMMENT '紧急联系人',
  `concat_mobile` varchar(50) DEFAULT NULL COMMENT '紧急联系电话',
  `begin_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '开始时间',
  `end_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '结束时间',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_37` (`user_id`),
  CONSTRAINT `FK_Reference_37` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='加班申请表';

-- ----------------------------
-- Records of apply_overtime_t
-- ----------------------------
INSERT INTO `apply_overtime_t` VALUES ('290ba7bedf3f4ab6b3df0b0560e193bd', '2017-08-17', '68ff9976be70420d83e48fc536cf1fd2', null, '加班看书学习android', '13621299528', '彭麻麻', '11023231258', '2017-08-17 17:03:05', '2017-08-17 22:03:04', 'api', '2017-08-17 22:27:30', 'api', '2017-12-31 13:20:40');

-- ----------------------------
-- Table structure for apply_register_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_register_t`;
CREATE TABLE `apply_register_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓  名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `place` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `education` varchar(10) DEFAULT NULL COMMENT '学  历',
  `reading_student` int(11) DEFAULT NULL COMMENT '是否在读',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `email` varchar(100) DEFAULT NULL COMMENT 'E-mail',
  `phone` varchar(20) DEFAULT NULL COMMENT '联系电话（手机）',
  `major` varchar(100) DEFAULT NULL COMMENT '专    业',
  `entrance_time` date DEFAULT NULL COMMENT '入学时间',
  `school` varchar(100) DEFAULT NULL COMMENT '就读学校',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `first_mentor` varchar(20) DEFAULT NULL COMMENT '第一导师',
  `center_time` date DEFAULT NULL COMMENT '到中心时间',
  `second_mentor` varchar(20) DEFAULT NULL COMMENT '第二导师',
  `center_mentor` varchar(20) DEFAULT NULL COMMENT '中心责任导师',
  `project_group` varchar(100) DEFAULT NULL COMMENT '所在课题组',
  `departure_time` date DEFAULT NULL COMMENT '预计离开时间',
  `project_group_person` varchar(20) DEFAULT NULL COMMENT '课题组负责人',
  `hobby` varchar(50) DEFAULT NULL COMMENT '兴趣爱好',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `mobile` varchar(20) DEFAULT NULL COMMENT '办公电话（座机）',
  `contacts` varchar(20) DEFAULT NULL COMMENT '紧急情况联系人',
  `contacts_phone` varchar(20) DEFAULT NULL COMMENT '紧急情况联系电话',
  `relationship` varchar(50) DEFAULT NULL COMMENT '与本人关系',
  `cadres` int(11) DEFAULT NULL COMMENT '是否担任过学生干部',
  `post` varchar(50) DEFAULT NULL COMMENT '任过何种职务',
  `mode` int(11) DEFAULT NULL COMMENT '培养方式',
  `self_info` varchar(500) DEFAULT NULL COMMENT '自我介绍',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_32` (`add_user`),
  CONSTRAINT `FK_Reference_32` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='研究生登记表';

-- ----------------------------
-- Records of apply_register_t
-- ----------------------------
INSERT INTO `apply_register_t` VALUES ('346342dcf4f04b729538ce96d07fbaab', 'L', '0', '满族', '北京市', '博士', '1', '1991-10-06', 'hojve232@126.com', '13621299528', '计算机', '2017-08-06', '清华大学', '2017-08-06', '张三', '2017-08-06', '李四', '王五', '自动化测试', '2017-08-06', '赵六', '打球', '220123456789', '010-12345678', '蛋黄派', '0101010111', '饭友', '0', '班长', '2', '没啥说的，就是nb-11', 'api', '2017-08-06 16:59:22', 'api', '2017-12-31 12:55:27', '68ff9976be70420d83e48fc536cf1fd2');

-- ----------------------------
-- Table structure for apply_reimbursement_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_reimbursement_t`;
CREATE TABLE `apply_reimbursement_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `re_date` datetime DEFAULT NULL,
  `pay_unit` varchar(50) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `sum` int(11) DEFAULT NULL,
  `apply_id` char(32) DEFAULT NULL,
  `project_id` char(32) DEFAULT NULL,
  `status` int(4) DEFAULT NULL,
  `reason` varchar(200) DEFAULT NULL,
  `apply_user` varchar(30) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK931885CCA43F246` (`add_user`),
  KEY `FK931885C4CD7B278` (`project_id`),
  CONSTRAINT `FK931885C4CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FK931885CCA43F246` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_reimbursement_t
-- ----------------------------
INSERT INTO `apply_reimbursement_t` VALUES ('18829d76fbca4dcdb76f9ec52759e1d3', 'api', '2018-01-01 10:55:37', 'api', '2018-01-01 10:55:58', '68ff9976be70420d83e48fc536cf1fd2', '2017-11-01 00:00:00', '派得', '1111ddd', '1111dd', '11', null, '263ef7665c0a42e4acfbfaac865622ca', '0', null, null);

-- ----------------------------
-- Table structure for apply_remuneration_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_remuneration_t`;
CREATE TABLE `apply_remuneration_t` (
  `id` char(32) NOT NULL,
  `title` varchar(255) NOT NULL,
  `apply_date` datetime DEFAULT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `key_words` varchar(500) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_remuneration_t
-- ----------------------------
INSERT INTO `apply_remuneration_t` VALUES ('99a808f4c4fe438b92dc4162166117a2', '霍建伟劳务计算单', '2017-11-09 00:00:00', 'api', '2017-11-09 13:26:25', 'api', '2018-01-01 22:12:37', 'L|220323198910152525|工商银行|622020805001756235L|22222222222222|工商银行|6325252525252222', 'asd', '1');

-- ----------------------------
-- Table structure for apply_salary_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_salary_t`;
CREATE TABLE `apply_salary_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `education` varchar(100) DEFAULT NULL COMMENT '学历/位',
  `center_time` date DEFAULT NULL COMMENT '入中心时间',
  `organization` varchar(50) DEFAULT NULL COMMENT '编制',
  `title_name` varchar(50) DEFAULT NULL COMMENT '职称',
  `before_amount` int(11) DEFAULT NULL COMMENT '现岗位津贴',
  `before_wages` int(11) DEFAULT NULL COMMENT '月工资',
  `after_amount` int(11) DEFAULT NULL COMMENT '调整后岗贴	',
  `after_wages` int(11) DEFAULT NULL COMMENT '调整后月工资',
  `change_time` date DEFAULT NULL COMMENT '变动日期',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `apply_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_39` (`add_user`),
  CONSTRAINT `FK_Reference_39` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='调薪申请表';

-- ----------------------------
-- Records of apply_salary_t
-- ----------------------------
INSERT INTO `apply_salary_t` VALUES ('7e91e6ad7f824482b803853920e22849', '科学研究部', 'L', '博士', '2017-08-01', '事业', '高级研究员', '7000', '1000', '7000', '10000', '2017-09-01', 'api', '2017-08-09 20:29:03', 'api', '2017-12-31 12:15:03', '68ff9976be70420d83e48fc536cf1fd2', '2017-08-09');

-- ----------------------------
-- Table structure for apply_storage_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_storage_t`;
CREATE TABLE `apply_storage_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `title_name` varchar(50) DEFAULT NULL COMMENT '标题',
  `change_time` date DEFAULT NULL COMMENT '变动日期',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门',
  `kd_number` varchar(50) DEFAULT NULL COMMENT '库单编号',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `user_id` char(32) DEFAULT NULL COMMENT '用户id',
  `type` varchar(20) DEFAULT NULL COMMENT '类型（enter：出库；outer：入库）',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_41` (`user_id`),
  CONSTRAINT `FK_Reference_41` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='库存表';

-- ----------------------------
-- Records of apply_storage_t
-- ----------------------------
INSERT INTO `apply_storage_t` VALUES ('19d06fd826d64295a2cffd7852aa7501', '橡胶管', '2017-08-22', '研发部', 'kd12012', 'api', '2017-08-22 21:23:20', 'api', '2017-12-31 11:29:54', '68ff9976be70420d83e48fc536cf1fd2', null);

-- ----------------------------
-- Table structure for apply_transfer_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_transfer_t`;
CREATE TABLE `apply_transfer_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `trans_date` datetime DEFAULT NULL,
  `receive_unit` varchar(50) DEFAULT NULL,
  `account_id` varchar(255) DEFAULT NULL,
  `bank` varchar(100) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `use_info` varchar(50) DEFAULT NULL,
  `pay_unit` varchar(50) DEFAULT NULL,
  `project` varchar(50) DEFAULT NULL,
  `number` varchar(20) DEFAULT NULL,
  `detail` varchar(100) DEFAULT NULL,
  `pact` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `work_day` varchar(5) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `project_id` char(32) DEFAULT NULL,
  `audit_status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FKB5727691B2777AC` (`user_id`),
  KEY `FKB57276914CD7B278` (`project_id`),
  CONSTRAINT `FKB57276914CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FKB5727691B2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_transfer_t
-- ----------------------------
INSERT INTO `apply_transfer_t` VALUES ('9cce6991784c49c3a9a468b5a9d7a55c', 'api', '2017-11-08 10:59:50', 'api', '2018-01-01 12:16:05', '2017-11-08 00:00:00', '百度无限公司', '6222232323502258', '中国银行', '500000', '网络改造工程', '伟业', '网络改造', '101', '不知道', '0', '1', '120', '备注', '68ff9976be70420d83e48fc536cf1fd2', '49f4104393604a00925f6072187620b1', null);
INSERT INTO `apply_transfer_t` VALUES ('a6c18f56e2994393afa0c14abb2f44b9', 'api', '2017-11-08 10:50:23', 'api', '2018-01-01 12:17:34', '2017-11-01 00:00:00', '英泰科技伟业', '52123333652252254', '建设银行', '52365000', '吃喝玩乐', '回事有限公司', '玩玩玩', '88888', '明细', '0', '1', '12', '备注上', '68ff9976be70420d83e48fc536cf1fd2', '263ef7665c0a42e4acfbfaac865622ca', null);

-- ----------------------------
-- Table structure for apply_trval_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_trval_t`;
CREATE TABLE `apply_trval_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `name` varchar(10) DEFAULT NULL,
  `reason` varchar(50) DEFAULT NULL,
  `travel_date` datetime DEFAULT NULL,
  `card` int(11) DEFAULT NULL,
  `money` int(11) DEFAULT NULL,
  `cheque` int(11) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK52D7BB47B2777AC` (`user_id`),
  CONSTRAINT `FK52D7BB47B2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of apply_trval_t
-- ----------------------------
INSERT INTO `apply_trval_t` VALUES ('cc7905fa59114f09a2e207ef594294be', 'api', '2017-11-09 17:57:12', 'api', '2018-01-01 21:43:23', null, 'L', '玩玩玩', '2017-11-09 00:00:00', '500', '300', '100', '68ff9976be70420d83e48fc536cf1fd2', null, '1');

-- ----------------------------
-- Table structure for apply_turn_up_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_turn_up_t`;
CREATE TABLE `apply_turn_up_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别',
  `birth` date DEFAULT NULL COMMENT '出生日期',
  `nation` varchar(20) DEFAULT NULL COMMENT '民族',
  `marriage` int(11) DEFAULT NULL COMMENT '婚否',
  `outlook` varchar(20) DEFAULT NULL COMMENT '政治面貌',
  `place` varchar(100) DEFAULT NULL COMMENT '籍贯',
  `home_address` varchar(200) DEFAULT NULL COMMENT '家庭地址',
  `dept` varchar(50) DEFAULT NULL COMMENT '部门	',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '手机号码',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证号	',
  `school` varchar(200) DEFAULT NULL COMMENT '毕业院校	',
  `major` varchar(200) DEFAULT NULL COMMENT '专业',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `education` varchar(20) DEFAULT NULL COMMENT '学历	',
  `degree` varchar(50) DEFAULT NULL COMMENT '学位',
  `join_work_time` date DEFAULT NULL COMMENT '参加工作时间	',
  `center_time` date DEFAULT NULL COMMENT '来中心时间',
  `working_years` int(11) DEFAULT NULL COMMENT '连续工龄',
  `post` varchar(50) DEFAULT NULL COMMENT '现工作岗位',
  `mobile` varchar(20) DEFAULT NULL COMMENT '宅电',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `head_path` varchar(100) DEFAULT NULL COMMENT '照片',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_33` (`add_user`),
  CONSTRAINT `FK_Reference_33` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='转编表';

-- ----------------------------
-- Records of apply_turn_up_t
-- ----------------------------
INSERT INTO `apply_turn_up_t` VALUES ('6f655e2a7eec49c2b6aedce86de9cbaf', '呀土豆', '0', '2017-07-30', '满族', '1', '团员', '上海', '上海滩', '仓储', '1325654562', '11111122245444', '交大', '金融', '2017-08-07', '博士', '学士', '2017-08-07', '2017-08-07', '4', '工程师', '012555555', 'api', '2017-08-07 20:54:52', 'api', '2017-12-31 10:57:19', '68ff9976be70420d83e48fc536cf1fd2', '93702dcb7c0b4ac693f94fc40e0ee0f1.jpg');
INSERT INTO `apply_turn_up_t` VALUES ('e9ec4208264d42b699b17164d9b06b1a', 'L', '0', '2017-08-07', '满族', '0', '中共党员', '北京', '海淀区', '软件工程 部', '13621299528', '220123456578952', '清华大学', '计算机', '2017-08-07', '博士', '学士学位', '2017-07-30', '2017-08-30', '5', '架构师', '010 12345678', 'api', '2017-08-07 20:08:51', null, null, '68ff9976be70420d83e48fc536cf1fd2', '8705805bbaa84309965e635de38d49a3.jpg');

-- ----------------------------
-- Table structure for apply_use_car_t
-- ----------------------------
DROP TABLE IF EXISTS `apply_use_car_t`;
CREATE TABLE `apply_use_car_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `apply_dept` varchar(50) DEFAULT NULL COMMENT '申请部门',
  `apply_user` char(32) NOT NULL COMMENT '申请人',
  `apply_time` date DEFAULT NULL COMMENT '申请日期',
  `special_info` varchar(50) DEFAULT NULL COMMENT '特殊使用申请',
  `reason` varchar(200) DEFAULT NULL COMMENT '事由（人数）',
  `destination` varchar(200) DEFAULT NULL COMMENT '目的地',
  `car_number` varchar(20) DEFAULT NULL COMMENT '车牌号码',
  `exception_record` varchar(200) DEFAULT NULL COMMENT '异常情况记录',
  `begin_time` date DEFAULT NULL COMMENT '驶出时间',
  `end_time` date DEFAULT NULL COMMENT '交回时间',
  `stop_car_price` int(11) DEFAULT NULL COMMENT '停车费',
  `driver` varchar(20) DEFAULT NULL COMMENT '出车驾驶员',
  `use_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_30` (`apply_user`),
  CONSTRAINT `FK_Reference_30` FOREIGN KEY (`apply_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用车申请';

-- ----------------------------
-- Records of apply_use_car_t
-- ----------------------------
INSERT INTO `apply_use_car_t` VALUES ('eec6c67ac20d47c089b5da2a6270f04b', 'api', '2017-08-06 13:57:44', 'api', '2017-12-31 10:10:33', '业务应用开发', '68ff9976be70420d83e48fc536cf1fd2', '2017-08-06', '1345', '旅游（4人）', '青岛', '京n52356', '车胎爆裂', '2017-08-06', '2017-08-24', '55', 'L', '2017-08-06');

-- ----------------------------
-- Table structure for article_t
-- ----------------------------
DROP TABLE IF EXISTS `article_t`;
CREATE TABLE `article_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `abstract_desc` varchar(300) DEFAULT NULL COMMENT '摘要',
  `author` char(32) DEFAULT NULL COMMENT '作者',
  `public_date` date DEFAULT NULL COMMENT '见刊时间',
  `unit` int(11) DEFAULT NULL COMMENT '单位（1：信心中心；2：装备中心）',
  `publicatioin` varchar(200) DEFAULT NULL COMMENT '刊物',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `project_id` char(32) DEFAULT NULL COMMENT '隶属项目',
  `factor` varchar(50) DEFAULT NULL COMMENT '影响因子',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_23` (`project_id`),
  KEY `FK_Reference_26` (`author`),
  CONSTRAINT `FK_Reference_23` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FK_Reference_26` FOREIGN KEY (`author`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Records of article_t
-- ----------------------------

-- ----------------------------
-- Table structure for assets_t
-- ----------------------------
DROP TABLE IF EXISTS `assets_t`;
CREATE TABLE `assets_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `assets_name` varchar(50) DEFAULT NULL COMMENT '资产名称',
  `prize` bigint(20) DEFAULT NULL COMMENT '价格',
  `buy_date` date DEFAULT NULL COMMENT '购买时间',
  `type` varchar(50) DEFAULT NULL COMMENT '类别',
  `location` varchar(200) DEFAULT NULL COMMENT '所在地',
  `charge` varchar(20) DEFAULT NULL COMMENT '负责人',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：正常；2：报废）',
  `fixed_assets` int(11) DEFAULT NULL COMMENT '固定资产（0：是；1：否）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `assets_number` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='固定资产表';

-- ----------------------------
-- Records of assets_t
-- ----------------------------
INSERT INTO `assets_t` VALUES ('b5d76ef754984dee9f620aca6b531f83', 'java疯狂讲义', '50', '2017-07-26', '书籍', '自动化部', 'L', '1', '0', 'api', '2017-07-26 22:47:25', 'api', '2017-07-26 22:54:07', 'NO1.0233222');

-- ----------------------------
-- Table structure for attachment_t
-- ----------------------------
DROP TABLE IF EXISTS `attachment_t`;
CREATE TABLE `attachment_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `file_name` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '附件地址',
  `file_type` int(11) DEFAULT NULL COMMENT '附件类型（1：预算说明；）',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_12` (`project_id`),
  CONSTRAINT `FK_Reference_12` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='附件表';

-- ----------------------------
-- Records of attachment_t
-- ----------------------------
INSERT INTO `attachment_t` VALUES ('2b1e9012f88442fcab74a1000d7b5d19', 'c63130fd1d224b3391275c7db1018e77 (1).docx', 'ebbb33da279042cf8b04b9b820d997cd.docx', null, '49f4104393604a00925f6072187620b1', 'api', null, null, null);

-- ----------------------------
-- Table structure for attendance_group_t
-- ----------------------------
DROP TABLE IF EXISTS `attendance_group_t`;
CREATE TABLE `attendance_group_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_id` char(32) NOT NULL,
  `attendance_set_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK646BEF5EB9444F55` (`attendance_set_id`),
  KEY `FK646BEF5EB2777AC` (`user_id`),
  CONSTRAINT `FK646BEF5EB2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK646BEF5EB9444F55` FOREIGN KEY (`attendance_set_id`) REFERENCES `attendance_set_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_group_t
-- ----------------------------
INSERT INTO `attendance_group_t` VALUES ('182fb3dc84e64da7a469ec65f481fd37', 'api', '2018-01-10 13:07:04', null, null, '78e4ddb8f1d04ccdab0d8cda2a250dcf', 'c46db2e996c94d74836a9f02c3f11d22');
INSERT INTO `attendance_group_t` VALUES ('203a74bd070a4200a7603ea9c88e9b5c', 'api', '2018-01-10 13:07:04', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', 'c46db2e996c94d74836a9f02c3f11d22');
INSERT INTO `attendance_group_t` VALUES ('580627eb46634296ac6d86ae928e358e', 'api', '2018-01-10 13:07:04', null, null, 'd5b3b7c05e754db9b9882d02b4a6e57c', 'c46db2e996c94d74836a9f02c3f11d22');
INSERT INTO `attendance_group_t` VALUES ('6b18923c885d4517bc54861b653eb523', 'api', '2018-01-10 13:07:04', null, null, '68ff9976be70420d83e48fc536cf1fd2', 'c46db2e996c94d74836a9f02c3f11d22');
INSERT INTO `attendance_group_t` VALUES ('859fab3957cf4eb98f6dfa307786603b', 'api', '2018-01-10 13:07:04', null, null, '99623bf797344b34ba34ccb6f69f433c', 'c46db2e996c94d74836a9f02c3f11d22');
INSERT INTO `attendance_group_t` VALUES ('f9e6b2562f71471189e9ba2067431bd1', 'api', '2018-01-10 13:07:04', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', 'c46db2e996c94d74836a9f02c3f11d22');

-- ----------------------------
-- Table structure for attendance_set_t
-- ----------------------------
DROP TABLE IF EXISTS `attendance_set_t`;
CREATE TABLE `attendance_set_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `start_time` time DEFAULT NULL,
  `end_time` time DEFAULT NULL,
  `lunch_end_time` time DEFAULT NULL,
  `lunch_start_time` time DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_set_t
-- ----------------------------
INSERT INTO `attendance_set_t` VALUES ('c46db2e996c94d74836a9f02c3f11d22', 'api', '2018-01-03 10:35:23', 'api', '2018-01-10 13:07:04', '09:00:00', '17:30:00', '13:00:00', '11:30:00');

-- ----------------------------
-- Table structure for attendance_stat_t
-- ----------------------------
DROP TABLE IF EXISTS `attendance_stat_t`;
CREATE TABLE `attendance_stat_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `user_id` char(32) NOT NULL,
  `zaodaka` int(11) DEFAULT NULL,
  `wandaka` int(11) DEFAULT NULL,
  `qingjia` int(11) DEFAULT NULL,
  `waichu` int(11) DEFAULT NULL,
  `chuchai` int(11) DEFAULT NULL,
  `jiaban` int(11) DEFAULT NULL,
  `kuanggong` int(255) DEFAULT NULL,
  `stat_time` date DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK38D57F5FB2777AC` (`user_id`),
  CONSTRAINT `FK38D57F5FB2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_stat_t
-- ----------------------------
INSERT INTO `attendance_stat_t` VALUES ('01f666dd271048729a0574ef7818f4f7', 'api', '2018-01-10 12:35:30', null, null, '68ff9976be70420d83e48fc536cf1fd2', null, null, null, null, null, null, '1', '2018-01-09');
INSERT INTO `attendance_stat_t` VALUES ('0666c79212b24f458b659224806e95b2', 'api', '2018-01-10 12:37:46', 'api', '2018-01-10 10:38:49', 'c9956b56fd1b4cc3a7c8156e9e110387', '0', '1', null, null, '1', null, null, '2018-01-09');
INSERT INTO `attendance_stat_t` VALUES ('1f50a9b2036f4514bc7bdc26a29382ac', 'api', '2018-01-10 12:35:30', null, null, '78e4ddb8f1d04ccdab0d8cda2a250dcf', null, null, null, null, null, null, '1', '2018-01-09');
INSERT INTO `attendance_stat_t` VALUES ('206d64f670a44a51bdd68db0351031df', 'api', '2018-01-10 12:35:30', null, null, '99623bf797344b34ba34ccb6f69f433c', null, null, null, null, null, null, '1', '2018-01-09');
INSERT INTO `attendance_stat_t` VALUES ('36b68ac650894fd1b278f5213a0301a8', 'api', '2018-01-10 12:35:30', null, null, 'd5b3b7c05e754db9b9882d02b4a6e57c', null, null, null, null, null, null, '1', '2018-01-09');
INSERT INTO `attendance_stat_t` VALUES ('3b8d6112d9ac469dacd978fc602791d9', 'api', '2018-01-21 09:40:03', null, null, 'c9956b56fd1b4cc3a7c8156e9e110387', null, null, null, null, null, null, '1', '2018-01-20');
INSERT INTO `attendance_stat_t` VALUES ('3c0b85733cf445748e60a7717ec9b57b', 'api', '2018-01-21 09:40:03', null, null, '78e4ddb8f1d04ccdab0d8cda2a250dcf', null, null, null, null, null, null, '1', '2018-01-20');
INSERT INTO `attendance_stat_t` VALUES ('4790031a3bef4bc4a1273ddb695bd6c8', 'api', '2018-01-21 10:47:00', null, null, '3938d94fa8e44fc8b76c0db734ac56b1', null, null, null, null, null, null, '1', '2018-01-20');
INSERT INTO `attendance_stat_t` VALUES ('4d86c4be898840b7984eb675305f49b7', 'api', '2018-01-21 10:46:30', null, null, '68ff9976be70420d83e48fc536cf1fd2', null, null, null, null, null, null, '1', '2018-01-20');
INSERT INTO `attendance_stat_t` VALUES ('4f47f702afd347bf81772ae68d49b73e', 'api', '2018-01-21 09:40:03', null, null, '99623bf797344b34ba34ccb6f69f433c', null, null, null, null, null, null, '1', '2018-01-20');
INSERT INTO `attendance_stat_t` VALUES ('60a0e1ee69064c47a8d4587ad253de65', 'api', '2018-01-21 10:46:42', 'api', '2018-01-10 13:16:00', '3938d94fa8e44fc8b76c0db734ac56b1', '1', null, null, null, null, null, null, '2018-01-21');
INSERT INTO `attendance_stat_t` VALUES ('d770445bf7344e119414c741685737ff', 'api', '2018-01-21 10:46:28', null, null, 'd5b3b7c05e754db9b9882d02b4a6e57c', null, null, '1', null, null, null, '1', '2018-01-21');
INSERT INTO `attendance_stat_t` VALUES ('e4f57f109bf244d981cf3adeff92ddbd', 'api', '2018-01-21 10:46:27', null, null, '68ff9976be70420d83e48fc536cf1fd2', null, null, null, null, '1', null, '1', '2018-01-21');
INSERT INTO `attendance_stat_t` VALUES ('f90744f188c94236bbc50fea23b1508d', 'api', '2018-01-21 10:46:30', null, null, 'd5b3b7c05e754db9b9882d02b4a6e57c', null, null, null, null, null, null, '1', '2018-01-20');

-- ----------------------------
-- Table structure for attendance_t
-- ----------------------------
DROP TABLE IF EXISTS `attendance_t`;
CREATE TABLE `attendance_t` (
  `id` char(32) NOT NULL,
  `attendance_time` datetime NOT NULL COMMENT '打卡时间',
  `times` int(11) NOT NULL COMMENT '打卡次数',
  `addr` varchar(200) DEFAULT NULL COMMENT '地址',
  `user_id` char(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(50) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modifier` varchar(50) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8AAAD89EB2777AC` (`user_id`),
  CONSTRAINT `FK8AAAD89EB2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of attendance_t
-- ----------------------------
INSERT INTO `attendance_t` VALUES ('1ce90cec6d014c2b9926d40b485b3e50', '2018-01-10 10:15:24', '1', '北京市, 东城区, 中华路, 甲10号', '3938d94fa8e44fc8b76c0db734ac56b1', '2018-01-10 10:15:24', 'api', null, null, null);
INSERT INTO `attendance_t` VALUES ('36a78cc473de40698cd6099c182da401', '2018-01-03 16:16:47', '1', '英泰科技大厦', '68ff9976be70420d83e48fc536cf1fd2', '2018-01-03 16:16:47', 'api', null, null, null);
INSERT INTO `attendance_t` VALUES ('5855e21dab4a479a9e98c2ecfca9383a', '2018-01-09 16:47:51', '2', '北京市, 东城区, 中华路, 甲10号', '3938d94fa8e44fc8b76c0db734ac56b1', '2018-01-09 16:47:51', 'api', null, null, null);
INSERT INTO `attendance_t` VALUES ('78e4ddb8f1d04ccdab0d8cda2a250dcf', '2018-01-03 08:05:06', '1', 'aa', '78e4ddb8f1d04ccdab0d8cda2a250dcf', '2018-01-03 08:05:06', null, null, null, null);
INSERT INTO `attendance_t` VALUES ('862367d8d77d4612b9f80f52c31f9354', '2018-01-03 18:37:34', '2', '英泰科技大厦', '68ff9976be70420d83e48fc536cf1fd2', '2018-01-03 18:37:34', 'api', null, null, null);
INSERT INTO `attendance_t` VALUES ('d4fe515ab7054185ad61a7b6e024c71e', '2018-01-09 16:47:37', '1', '北京市, 东城区, 中华路, 甲10号', '3938d94fa8e44fc8b76c0db734ac56b1', '2018-01-09 16:47:37', 'api', null, null, null);
INSERT INTO `attendance_t` VALUES ('dbe9c094ea2d486face54d3baccb2d55', '2018-01-03 09:05:06', '1', 'asd', 'dbe9c094ea2d486face54d3baccb2d55', '2018-01-03 09:05:06', null, null, null, null);

-- ----------------------------
-- Table structure for award_t
-- ----------------------------
DROP TABLE IF EXISTS `award_t`;
CREATE TABLE `award_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `award_name` varchar(50) DEFAULT NULL COMMENT '奖励名称',
  `awardee` char(32) DEFAULT NULL COMMENT '获奖人',
  `unit` int(11) DEFAULT NULL COMMENT '单位（1：信心中心；2：装备中心）',
  `number` varchar(20) DEFAULT NULL COMMENT '编号',
  `gave_unit` varchar(50) DEFAULT NULL COMMENT '授予单位',
  `grade` varchar(20) DEFAULT NULL COMMENT '级别',
  `award_date` date DEFAULT NULL COMMENT '获奖之间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_27` (`awardee`),
  CONSTRAINT `FK_Reference_27` FOREIGN KEY (`awardee`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='奖励表';

-- ----------------------------
-- Records of award_t
-- ----------------------------

-- ----------------------------
-- Table structure for business_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `business_detail_t`;
CREATE TABLE `business_detail_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `last_progress` varchar(200) DEFAULT NULL COMMENT '最新进展',
  `busniess_id` char(32) NOT NULL COMMENT '商务id',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `detail` varchar(200) DEFAULT NULL COMMENT '细节',
  `note_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_42` (`busniess_id`),
  CONSTRAINT `FK_Reference_42` FOREIGN KEY (`busniess_id`) REFERENCES `project_busniess_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='业务细节';

-- ----------------------------
-- Records of business_detail_t
-- ----------------------------
INSERT INTO `business_detail_t` VALUES ('9a8b3d4c64724ef98904c62c23859b50', 'd', '6055362ed86f4a44818313b901851435', 'api', '2018-01-09 12:52:13', null, null, 'ddd', '2018-01-07 00:00:00');
INSERT INTO `business_detail_t` VALUES ('d467e1dd1b4d4fc9ae54351c752b7496', '123', '6055362ed86f4a44818313b901851435', 'api', '2018-01-09 12:46:23', null, null, '123asd', '2018-01-09 00:00:00');

-- ----------------------------
-- Table structure for buss_travel_t
-- ----------------------------
DROP TABLE IF EXISTS `buss_travel_t`;
CREATE TABLE `buss_travel_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '用户id',
  `begin_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `days` int(11) DEFAULT NULL COMMENT '天数',
  `destination` varchar(100) DEFAULT NULL COMMENT '目的地',
  `desc_info` varchar(200) DEFAULT NULL COMMENT '描述',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT NULL COMMENT '状态（0：未审核；1：审核通过；2：审核不通过）',
  `audit_user` char(32) DEFAULT NULL COMMENT '审核人',
  `apply_date` date DEFAULT NULL COMMENT '申请日期',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_10` (`user_id`),
  KEY `FKC43B8D5B78CEC34C` (`audit_user`),
  CONSTRAINT `FKC43B8D5B78CEC34C` FOREIGN KEY (`audit_user`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_10` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='出差表';

-- ----------------------------
-- Records of buss_travel_t
-- ----------------------------
INSERT INTO `buss_travel_t` VALUES ('1e94e729207349dab7edbd37f4c416fa', '96e79218965eb72c92a549dd5a330112', '2017-07-03', '2017-07-26', '11', '浙江', '维修设备', 'api', '2017-07-18 22:05:58', null, null, '0', null, '2017-07-18');
INSERT INTO `buss_travel_t` VALUES ('66deb5dbdbcb4cf6a9e7f31ece8cbc7a', '96e79218965eb72c92a549dd5a330112', '2017-06-25', '2017-07-30', '36', '江西 九江', '外出安装设备', 'api', '2017-07-18 22:04:41', 'api', '2017-07-18 22:05:35', '1', '96e79218965eb72c92a549dd5a330112', '2017-07-18');

-- ----------------------------
-- Table structure for common_forms_t
-- ----------------------------
DROP TABLE IF EXISTS `common_forms_t`;
CREATE TABLE `common_forms_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `form_name` varchar(50) DEFAULT NULL COMMENT '表单名称',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `file_name` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '附件地址',
  `add_time` datetime DEFAULT NULL COMMENT '添加时间',
  `user_id` char(32) DEFAULT NULL COMMENT '用户ud',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_29` (`user_id`),
  CONSTRAINT `FK_Reference_29` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='常用表单表';

-- ----------------------------
-- Records of common_forms_t
-- ----------------------------
INSERT INTO `common_forms_t` VALUES ('3b04bd93e5c74fb5a033952e33e81b11', '测试添加表单', '测试添加表单测试添加表单测试添加表单', '2017-08-01宝乐彩运营数据.xlsx', '0892a75fd75140baa2412ace58d95693.xlsx', '2017-08-06 09:04:27', '68ff9976be70420d83e48fc536cf1fd2', 'api', '2017-08-06 09:04:27', 'api', '2017-11-02 19:35:23');

-- ----------------------------
-- Table structure for consume_item_t
-- ----------------------------
DROP TABLE IF EXISTS `consume_item_t`;
CREATE TABLE `consume_item_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `modify_time` datetime DEFAULT NULL,
  `product_type_id` char(32) DEFAULT NULL COMMENT '产品id',
  `product_store_id` char(32) DEFAULT NULL COMMENT '库存id',
  `amount` int(11) DEFAULT NULL COMMENT '消耗数量',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `production_id` char(32) DEFAULT NULL COMMENT '生成id',
  `model` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK125FDBEB619DE205` (`production_id`),
  KEY `FK125FDBEB25D03C2E` (`product_type_id`),
  KEY `FK125FDBEB22CB83E6` (`product_store_id`),
  CONSTRAINT `FK125FDBEB22CB83E6` FOREIGN KEY (`product_store_id`) REFERENCES `product_store_t` (`id`),
  CONSTRAINT `FK125FDBEB25D03C2E` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`),
  CONSTRAINT `FK125FDBEB619DE205` FOREIGN KEY (`production_id`) REFERENCES `production_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='消耗条目';

-- ----------------------------
-- Records of consume_item_t
-- ----------------------------
INSERT INTO `consume_item_t` VALUES ('28f1287fc8ca46ec99950e02da8fc899', null, 'c49ea4f4119d4e468691464f376f7ed4', '84e31501855549b491ca33a1c128871e', '9', 'api', '2017-12-27 17:03:51', null, 'cf781a22de10428d87a6af24ddb031d8', null);
INSERT INTO `consume_item_t` VALUES ('33e4fe6ba1c545089795449c0f2e4ca9', null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', 'd9e3e95a96f74e8b9bc87928aee79bbe', '111', 'api', '2017-12-27 17:03:51', null, 'cf781a22de10428d87a6af24ddb031d8', null);
INSERT INTO `consume_item_t` VALUES ('6ea27632e67b40c5bb0ce8beffc87905', null, 'c49ea4f4119d4e468691464f376f7ed4', '84e31501855549b491ca33a1c128871e', '1', 'api', '2017-12-27 17:24:45', null, '1799630370064cd4a6d7ea37bce84b73', null);
INSERT INTO `consume_item_t` VALUES ('a65000f05e724db0ac34e4405bc18036', null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', 'd9e3e95a96f74e8b9bc87928aee79bbe', '222', 'api', '2017-12-27 15:15:08', null, 'cf03a06ed33b4c1e97671b96cf544fa0', null);
INSERT INTO `consume_item_t` VALUES ('be716bdb33344221983151d1f35f9050', null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', 'd9e3e95a96f74e8b9bc87928aee79bbe', '222', 'api', '2017-12-27 17:24:45', null, '1799630370064cd4a6d7ea37bce84b73', null);
INSERT INTO `consume_item_t` VALUES ('e2f66ecf59094993a4f7475d0bce0573', null, 'c49ea4f4119d4e468691464f376f7ed4', '84e31501855549b491ca33a1c128871e', '1', 'api', '2017-12-27 15:15:08', null, 'cf03a06ed33b4c1e97671b96cf544fa0', null);

-- ----------------------------
-- Table structure for cost_t
-- ----------------------------
DROP TABLE IF EXISTS `cost_t`;
CREATE TABLE `cost_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `program_cost_id` char(32) DEFAULT NULL COMMENT '工程支出id',
  `cost_amount` bigint(20) DEFAULT NULL COMMENT '支出金额',
  `cost_unit` varchar(50) DEFAULT NULL COMMENT '支出单位',
  `cost_date` date DEFAULT NULL COMMENT '支出时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_22` (`program_cost_id`),
  CONSTRAINT `FK_Reference_22` FOREIGN KEY (`program_cost_id`) REFERENCES `program_cost_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支出明细表';

-- ----------------------------
-- Records of cost_t
-- ----------------------------

-- ----------------------------
-- Table structure for data_download_t
-- ----------------------------
DROP TABLE IF EXISTS `data_download_t`;
CREATE TABLE `data_download_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '上传人id',
  `data_type` int(11) DEFAULT NULL COMMENT '数据类型（0：资料下载；1：规章制度）',
  `title` varchar(100) DEFAULT NULL COMMENT '标题',
  `abstrct_desc` varchar(200) DEFAULT NULL COMMENT '摘要',
  `upload_date` datetime DEFAULT NULL COMMENT '上传时间',
  `file_name` varchar(100) DEFAULT NULL COMMENT '附件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '附件地址',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1` (`user_id`),
  CONSTRAINT `FK_Reference_1` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='资料下载表';

-- ----------------------------
-- Records of data_download_t
-- ----------------------------

-- ----------------------------
-- Table structure for dial_out_fund_t
-- ----------------------------
DROP TABLE IF EXISTS `dial_out_fund_t`;
CREATE TABLE `dial_out_fund_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `unit` varchar(50) DEFAULT NULL COMMENT '收款单位',
  `amount` int(8) DEFAULT NULL COMMENT '金额',
  `project_id` char(32) DEFAULT NULL COMMENT '支出项目',
  `out_time` datetime DEFAULT NULL COMMENT '时间',
  `deal_man` varchar(20) DEFAULT NULL COMMENT '经办人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  PRIMARY KEY (`id`),
  KEY `FKB46C6FBA4CD7B278` (`project_id`),
  CONSTRAINT `FKB46C6FBA4CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dial_out_fund_t
-- ----------------------------
INSERT INTO `dial_out_fund_t` VALUES ('e75748a8a85944d2b59805db8c57075a', null, null, 'api', '2018-01-01 13:19:20', '手环2', '122', '49f4104393604a00925f6072187620b1', '2018-01-01 00:00:00', '王企鹅群无1', '请问1');

-- ----------------------------
-- Table structure for expense_finance_t
-- ----------------------------
DROP TABLE IF EXISTS `expense_finance_t`;
CREATE TABLE `expense_finance_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_id` char(32) DEFAULT NULL COMMENT '项目',
  `subject_type` int(11) DEFAULT NULL COMMENT '科目（）',
  `budget_amount` bigint(20) DEFAULT NULL COMMENT '预算金额',
  `cost` bigint(20) DEFAULT NULL COMMENT '支出',
  `invoice_detail` varchar(100) DEFAULT NULL COMMENT '发票明细',
  `amount` bigint(20) DEFAULT NULL COMMENT '本次金额',
  `handl_user_id` char(32) DEFAULT NULL COMMENT '经办人',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_17` (`handl_user_id`),
  KEY `FK_Reference_18` (`project_id`),
  CONSTRAINT `FK_Reference_17` FOREIGN KEY (`handl_user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_18` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日常报销（财务）';

-- ----------------------------
-- Records of expense_finance_t
-- ----------------------------

-- ----------------------------
-- Table structure for expense_self_t
-- ----------------------------
DROP TABLE IF EXISTS `expense_self_t`;
CREATE TABLE `expense_self_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `invoice_detail` varchar(100) DEFAULT NULL COMMENT '发票明细',
  `amount` bigint(20) DEFAULT NULL COMMENT '金额',
  `reason` varchar(100) DEFAULT NULL COMMENT '理由',
  `handl_user_id` char(32) DEFAULT NULL COMMENT '经办人',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_19` (`handl_user_id`),
  CONSTRAINT `FK_Reference_19` FOREIGN KEY (`handl_user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='日常报销表（个人）';

-- ----------------------------
-- Records of expense_self_t
-- ----------------------------

-- ----------------------------
-- Table structure for experts_t
-- ----------------------------
DROP TABLE IF EXISTS `experts_t`;
CREATE TABLE `experts_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_name` varchar(20) DEFAULT NULL COMMENT '姓名',
  `gender` int(11) DEFAULT NULL COMMENT '性别（0：男；1：女）',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证号',
  `unit` varchar(100) DEFAULT NULL COMMENT '单位',
  `title` varchar(20) DEFAULT NULL COMMENT '职称',
  `bank_card` varchar(30) DEFAULT NULL COMMENT '银行卡号',
  `bank_name` varchar(50) DEFAULT NULL COMMENT '开户行',
  `phoneNumber` varchar(20) DEFAULT NULL COMMENT '电话',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专家表';

-- ----------------------------
-- Records of experts_t
-- ----------------------------
INSERT INTO `experts_t` VALUES ('17cbb8163a474d3ab69eed5fa9411d46', '孙婷婷', '1', '6322222222211444', '装备中心', '程序员', '6223030303000303030', '农业银行', '17012345678', 'stt@126.com', 'api', '2017-07-15 14:48:06', null, null);
INSERT INTO `experts_t` VALUES ('2a9a94f7e498469680df4bb505fa1d5f', '麻麻1', '0', '112', '223', '334', '445', '556', '667', '778', null, null, 'api', '2017-10-30 19:31:09');
INSERT INTO `experts_t` VALUES ('6ed74426d5cc48a5969bcb6634d514e7', 'L', '0', '220323198910137515', '北京农业智能装备中心', '技术研究院', '62253210000122003', '中国工商银行', '13621299528', 'hojve232@126.com', null, null, 'api', '2017-07-15 14:47:18');

-- ----------------------------
-- Table structure for expert_fee_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `expert_fee_detail_t`;
CREATE TABLE `expert_fee_detail_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `name` varchar(10) DEFAULT NULL,
  `id_card` varchar(30) DEFAULT NULL,
  `unit` varchar(50) DEFAULT NULL,
  `title` varchar(30) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `bank_card` varchar(20) DEFAULT NULL,
  `bane_name` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `user_id` char(32) DEFAULT NULL,
  `fee_date` datetime DEFAULT NULL,
  `apply_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKE3F2E094B2777AC` (`user_id`),
  KEY `FKE3F2E094B434B672` (`apply_id`),
  CONSTRAINT `FKE3F2E094B2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FKE3F2E094B434B672` FOREIGN KEY (`apply_id`) REFERENCES `apply_expert_fee_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of expert_fee_detail_t
-- ----------------------------
INSERT INTO `expert_fee_detail_t` VALUES ('558789ba9c80441683e7bdd1c5f1f033', 'api', '2018-01-07 20:06:11', null, null, '111', '11', '1', '1', '1', '1', '1', '1', '68ff9976be70420d83e48fc536cf1fd2', null, '36c9d5808de94d3bb1c910a376fac662');
INSERT INTO `expert_fee_detail_t` VALUES ('737b93e08eb24e619bd25be61098dffa', 'api', '2018-01-01 22:32:09', null, null, 'L', '220323125225222x', '英泰伟业', 'java研发', '5', '622022236585255', '建设银行', '800', '68ff9976be70420d83e48fc536cf1fd2', null, '62bd092edbe44a7ebbcfa195096d5e5a');

-- ----------------------------
-- Table structure for function_t
-- ----------------------------
DROP TABLE IF EXISTS `function_t`;
CREATE TABLE `function_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `function_code` varchar(50) DEFAULT NULL COMMENT '功能代码',
  `function_name` varchar(20) DEFAULT NULL COMMENT '功能名称',
  `function_type` int(11) DEFAULT NULL COMMENT '功能类型（0：菜单；1：操作）',
  `parent_function_id` char(32) DEFAULT NULL COMMENT '父功能菜单',
  `sort` int(11) DEFAULT NULL COMMENT '排序',
  `status` int(11) DEFAULT NULL COMMENT '状态（0：正常；1：冻结）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `function_function_fk` (`parent_function_id`),
  KEY `FKFC41E9CD31C6DF77` (`parent_function_id`),
  CONSTRAINT `FKFC41E9CD31C6DF77` FOREIGN KEY (`parent_function_id`) REFERENCES `function_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统工能表';

-- ----------------------------
-- Records of function_t
-- ----------------------------
INSERT INTO `function_t` VALUES ('019cef7053804692b7afa8f1b640e0c3', 'apply_usecar', '公务用车', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '107', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('02dac7f9bf6a40fc88086a676e7a34cc', 'funds_cheque_sub', '提交审核', '2', 'c3e7cf7a338e443093ed61a0d3f9c61a', '63', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('02f29bab7e914f4dbc768b1661f5206e', 'project0_delete', '删除项目', '2', '7c7115994866468ea0e14a1121c5ec3b', '33', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('03a853e928b0466791506b1aafdbc62c', 'apply_expertfee_edit', '编辑申请', '2', 'ded39ed0aa954c34ba3a3390921e6e71', '184', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('05e7c020477b4bd4a1b817e3f49c6974', 'plan_reply', '计划进展', '2', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', '23', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('081f2ee65f774472ac748357168ac694', 'funds_cheque_add', '差旅报销', '2', '65ea1ab75a754abda5762b0d78cc1a04', '67', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('093cc6a328bd4604a477a8a4e18de4dc', 'funds_remuneration_audit', '劳务审核', '2', 'ed49d770e1574108b4f2b36efc9d81f6', '77', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('097f2092182647a199bf723034acbfee', 'experts_add', '添加专家', '2', '2c1d6fd25d8049a5b6d4faa8a51ecff2', '13', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('0b607f0bd899422cb9c71402849bc5a7', 'funds_other_edit', '修改支出', '2', 'edf60ffbf35a48a395212f8db3426bbb', '52', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('0f670e0df0c54fd6aa8d6da271f2e721', 'funds_transfer', '转账管理', '1', '776c5428bf104b2dbdb2c280c086a033', '54', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('0fa5ca202ef5431fbaa5aeb39b9b07da', 'jxc_store_add', '添加库存', '2', '65c9550aee3949ea8b478ac595ffd2c9', '212', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('13668fcf83c84fe1b0624bded1851891', 'products', '生产管理', '0', null, '229', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('13c35cd8177a41899d0525bd21e93dcd', 'jxc_purchase', '采购管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '193', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('146c450aa1af43049bf1c49a70e4d7e2', 'jxc_purchase_add', '添加采购单', '2', '13c35cd8177a41899d0525bd21e93dcd', '194', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1839f9f9e6db4f5098cd8617944ca2bb', 'funds_out_delete', '删除经费', '2', '8ca577450d2d4681a941fcde721f0910', '49', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('199eb048688d44bfad191b9bc87b289a', 'apply_leave1', '学生请假登记', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '152', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1cf77e815d0343c19770ab7e74e1f685', 'experts_delete', '删除专家', '2', '2c1d6fd25d8049a5b6d4faa8a51ecff2', '15', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1d9384d3bdd14586aaac073150b3b211', 'joutanl_add', '添加日志', '2', '1d9384d3bdd14586aaac073150b3b2ec', '25', '0', 'init', '2018-01-21 09:36:32', null, null);
INSERT INTO `function_t` VALUES ('1d9384d3bdd14586aaac073150b3b2ec', 'joutanl', '工作日志', '1', 'bb20fb8537e543b49bb0f807aed245ef', '24', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1dfab9fe3f6942fea3e92b5d6e9b85ce', 'apply_salary_print', '打印登记', '2', 'a2e23da17ec24b6ca17be2eec548e792', '130', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1e946136850844d2a42ae4de95a73a10', 'assets_list', '固定资产', '1', 'b07fc05241a34951961bb134e59d3d5e', '96', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1f2c7c5a251042c098612dba5d815d7a', 'product_edit', '编辑记录', '2', 'a68358f4a76f4a2b801dcb22f65fa091', '234', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('1f745c26cbdd403887e16c4f4c067dad', 'jxc', '进销存管理', '0', null, '192', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('20877f40c3ee4c0c9d36c011fe75b370', 'apply_register', '研究生登记', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '112', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2116f77edea649409ebb9115ffe0cce3', 'apply_backToSchool_print', '打印申请', '2', 'eb0286a8954f45d58350266ee579e18c', '135', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('21b6e4d1ea624bd98d6e2bf736ceba11', 'apply_register_edit', '编辑登记', '2', '20877f40c3ee4c0c9d36c011fe75b370', '114', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('220b143b708c469f97eef74153f54377', 'user_add', '添加人员', '2', '5ee48d30d72f49d0b09a9ddbe8005fc2', '3', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2230a6c6afca4654994f07ac6b78410b', 'jxc_income_cancel', '取消', '2', '8695e62810534a299367d87600194478', '203', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('24f949ce4fe24d00bd3a4b990b853267', 'apply_needhands_delete', '删除登记', '2', '92d21791f4484208ad87b40edfef4e36', '126', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('24febc42318e48be9104ec33241ad7bd', 'apply_storage_delete', '删除出入库', '2', 'e4f9b25bb29b41629a384254f70b913c', '161', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('25772568073e4508b9e2a532d74dc6af', 'jxc_production_edit', '编辑生产单', '2', '728e1a5d5eb04b56924a674e7b7e3a99', '216', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('25c39443b5124d15aa2cbc952846de35', 'user_edit', '修改人员', '2', '5ee48d30d72f49d0b09a9ddbe8005fc2', '4', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('290e73b194ef48cab5efd7da24b09ae6', 'apply_turnup_add', '转编登记', '2', '609644d6ed55415e91a9dce3587739d6', '118', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('299153ae2c1b40e48c7faa3654143778', 'jxc_dealer_edit', '编辑渠道商', '2', 'df14d80db30f493faac3ebbb94a324a5', '225', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2a9625d648e3444c9a2699b99da82080', 'funds_reimbursement_delete', '删除报销', '2', 'f5f36e98d39f4ed994aba6aad285e546', '44', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2c1d6fd25d8049a5b6d4faa8a51ecff2', 'experts', '专家管理', '1', 'bb20fb8537e543b49bb0f807aed245ef', '12', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2c59e48825d2462aa8260366574e5051', 'repair', '返修记录', '1', '13668fcf83c84fe1b0624bded1851891', '235', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2d0f1cc2931c40a086e701de417e61f9', 'jxc_out_store', '出库', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '210', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2d2cc9ed925047ba80a5d64881dcbbb2', 'funds_experfee_sub', '提交审核', '2', 'e10b02d3133e4c188aea200beb2d2214', '81', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2eb716450d3947688f73593a33de4907', 'product_add_node', '添加节点', '2', 'a68358f4a76f4a2b801dcb22f65fa091', '232', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2ed3b43b8f3849fc8a6bc656c48a8fe6', 'jxc_income_store', '入库', '2', '8695e62810534a299367d87600194478', '202', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2f1dec3044b04ee59a08f1f663aa20b9', 'role_add', '添加权限', '2', 'd4176bd74fd94bf090c0d655808713ca', '6', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('2f65e7aa17b14cca8faf26fceabf72ca', 'apply_register_print', '打印登记', '2', '20877f40c3ee4c0c9d36c011fe75b370', '115', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('30ff40f709da4e1986d6fdad8ee89d2f', 'startup_delete', '删除实施', '2', 'fe2a474b712c44fab6d3d56e6c4d9b64', '94', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3178372731be480b940837642ee0a10f', 'jxc_dealer_show', '查看产品', '2', 'df14d80db30f493faac3ebbb94a324a5', '226', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3185e09cd15f403a8fd4c3dcf51f8450', 'products_add', '创建记录', '2', 'a68358f4a76f4a2b801dcb22f65fa091', '231', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3483daed9ac34dbc88dd2623510352e5', 'apply_remuneration', '劳务计算单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '172', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('35443649b2d94d21bc0c52a608feb38a', 'apply_cheque_delete', '删除申请', '2', 'f858e867571d4362a7ce8cf0f9f99a30', '191', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('35cdcb0fb8bc4054a69dc8274ba676c1', 'funds_experfee_add', '添加专家费', '2', 'e10b02d3133e4c188aea200beb2d2214', '79', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3770269cb7c84a9caa7f08e2b48ad553', 'apply_overtime_add', '加班申请', '2', '7ad89be678bd41d98046707e008e5ce0', '143', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('392ce8e4bca243208ac9a5b14b3854ff', 'funds_fund', '经费到账', '1', '776c5428bf104b2dbdb2c280c086a033', '36', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('39cfb69ec8bb496cbc4541f7a2394650', 'funds_transfer_edit', '编辑转账', '2', '0f670e0df0c54fd6aa8d6da271f2e721', '56', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3a1669fb4c3043548bae9f905c1220c6', 'jxc_dealer_add', '添加渠道商', '2', 'df14d80db30f493faac3ebbb94a324a5', '224', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3b9609cfaec34cd0a692c62f209faca1', 'project1_delete', '删除项目', '2', '73921e1cb76a42a5950bf9fbe5e63631', '30', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3bee2c779b2c40d6885a9d7464fc3c8e', 'apply_online', '在线填报', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '106', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3cb3a1b7be8f418285c495fd459b223f', 'business_node', '添加节点', '2', 'f6c9d786132a4e429414f5a0dd7d2dbb', '88', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('3d15ee020d1c4294a224cabcb123b5dc', 'funds_transfer_audit', '转账审核', '2', '0f670e0df0c54fd6aa8d6da271f2e721', '59', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('417410b80f064ca1b5a545c72d440bf6', 'funds_cheque_audit', '报销审核', '2', '65ea1ab75a754abda5762b0d78cc1a04', '71', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('427bb773efce4ac2b1f9c70ef25496f1', 'project1_edit', '修改项目', '2', '73921e1cb76a42a5950bf9fbe5e63631', '29', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4312de8ba0ee4dec86d5f45e924ad413', 'repair_add', '创建记录', '2', '2c59e48825d2462aa8260366574e5051', '236', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('433e2aec2d0449da9d9ffe524c633430', 'apply_leave0', '员工请假申请', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '147', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4463c3e9ab904c41b962f113948d9118', 'project', '工程管理', '0', null, '84', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('44d73f216e8b4a1ba5445fe78bb276d0', 'funds_cheque_audit', '支票审核', '2', 'c3e7cf7a338e443093ed61a0d3f9c61a', '65', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('482f0e93d4344e3083fc274a17f91d13', 'apply_salary_add', '调薪登记', '2', 'a2e23da17ec24b6ca17be2eec548e792', '128', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('48b68155a61f4fa8a9233239c0f4ca95', 'apply_trval_delete', '删除申请', '2', 'b33b20c8f48a4ec78c328ceefdcbc2da', '166', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('49850bd75a634fbea8b70b51c0f2209b', 'role_sq', '权限授权', '2', 'd4176bd74fd94bf090c0d655808713ca', '8', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4b900c6857b74e1a81a236d0ac371dfa', 'apply_form', '常用表单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '101', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4bdc1a6195784a6bb61868be97e35a60', 'funds_out_edit', '修改经费', '2', '8ca577450d2d4681a941fcde721f0910', '48', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4c7acaa8fd1f40d2b807ef12940c08e6', 'assets_edit', '修改资产', '2', '1e946136850844d2a42ae4de95a73a10', '98', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4e966416066e4ecaa853f10e8eb3ab54', 'apply_salary_edit', '编辑登记', '2', 'a2e23da17ec24b6ca17be2eec548e792', '129', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4f844777e3264597a7df0214b3416589', 'apply_remuneration_delete', '删除申请', '2', '3483daed9ac34dbc88dd2623510352e5', '176', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('4fef1dccea884633bf63f3ee289eec63', 'group_edit', '修改小组', '2', 'c32b39857fa946c99c3b7f38bb1d7978', '10', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5140a1f4aef746aa8acae143ee843fc3', 'product_delete', '删除记录', '2', 'a68358f4a76f4a2b801dcb22f65fa091', '233', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5238d64cf76b4ef7aa0cf0241197745f', 'project1_add', '添加项目', '2', '73921e1cb76a42a5950bf9fbe5e63631', '28', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('537df1fcc02c479ab2ebc164fa0aa977', 'startup_node', '添加节点', '2', 'fe2a474b712c44fab6d3d56e6c4d9b64', '93', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('53e5a414cefc44d0984b5f7d2dd83165', 'jxc_purchase_edit', '编辑采购单', '2', '13c35cd8177a41899d0525bd21e93dcd', '195', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('57a9a3175c4c41dc919643ccfc2c6aa0', 'apply_remuneration_edit', '编辑申请', '2', '3483daed9ac34dbc88dd2623510352e5', '174', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('57d038ffddfc43429cb47886a784da7a', 'funds_remuneration_edit', '编辑劳务', '2', 'ed49d770e1574108b4f2b36efc9d81f6', '74', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('58198d91503c479f9b2f60e6fd244c9a', 'apply_leave0_delete', '删除请假登记', '2', '433e2aec2d0449da9d9ffe524c633430', '151', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5824da6688fa40e080396454a84e8e73', 'funds_transfer_add', '创建转账', '2', '0f670e0df0c54fd6aa8d6da271f2e721', '55', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('584850923b0a4dd38699a35881f65edf', 'apply_usecar_add', '用车申请', '2', '019cef7053804692b7afa8f1b640e0c3', '108', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('592be2e1ae824addb577876000710fe9', 'funds_remuneration_sub', '提交审核', '2', 'ed49d770e1574108b4f2b36efc9d81f6', '75', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('59e7f5c6a15442fba4be4fdde6091941', 'apply_changeDept_delete', '删除登记', '2', '66b294bfdc3248b4806c1ab5223d7ce4', '141', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5a46cbc4999b4c24a8fb4f92f9b05ef0', 'funds_reimbursement_edit', '修改报销', '2', 'f5f36e98d39f4ed994aba6aad285e546', '42', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5ab34adcc9d94d0eab2acb4b8a354404', 'apply_transfer_print', '打印申请', '2', 'c053e2d88d704c7db76cd2c237594015', '170', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5acf5ac873674e7582946fdb896b35a4', 'apply_expertfee_print', '打印申请', '2', 'ded39ed0aa954c34ba3a3390921e6e71', '185', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5b1bcdd5ba3740c58a48b3fbbc4a1897', 'apply_usecar_print', '打印申请', '2', '019cef7053804692b7afa8f1b640e0c3', '110', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5df413bfb7d54d9790299232f2a42984', 'apply_remuneration_print', '打印申请', '2', '3483daed9ac34dbc88dd2623510352e5', '175', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5ee48d30d72f49d0b09a9ddbe8005fc2', 'user', '人员管理', '1', 'bb20fb8537e543b49bb0f807aed245ef', '2', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('5ef049f4566c472486ed45b350c6622a', 'apply_transfer_edit', '编辑申请', '2', 'c053e2d88d704c7db76cd2c237594015', '169', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6077b4907c634f44883cb23fc77b74f2', 'funds_other_delete', '删除支出', '2', 'edf60ffbf35a48a395212f8db3426bbb', '53', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('609644d6ed55415e91a9dce3587739d6', 'apply_turnup', '转编登记', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '117', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6294cb7477ce45d59e4b8660070bb283', 'jxc_purchase_delete', '删除采购单', '2', '13c35cd8177a41899d0525bd21e93dcd', '197', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('638e4bc12d844d02b9a134406ffe1cc1', 'funds_reimbursement_audit', '审核报销', '2', 'f5f36e98d39f4ed994aba6aad285e546', '45', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6548698683f94f4fbbf007415d176ff5', 'role_edit', '修改权限', '2', 'd4176bd74fd94bf090c0d655808713ca', '7', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('65c9550aee3949ea8b478ac595ffd2c9', 'jxc_store', '库存管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '211', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('65ea1ab75a754abda5762b0d78cc1a04', 'funds_trval', '差旅管理', '1', '776c5428bf104b2dbdb2c280c086a033', '66', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('666a1c9c6f724722b45b5f983ddf6a6f', 'jxc_out', '出库管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '204', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('667f67afcfab42bd861d332215a31c44', 'startup_edit', '修改实施', '2', 'fe2a474b712c44fab6d3d56e6c4d9b64', '92', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('668c243fc70e4521a6680cfbc3755308', 'apply_leave1_add', '学生请假登记', '2', '199eb048688d44bfad191b9bc87b289a', '153', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('66b294bfdc3248b4806c1ab5223d7ce4', 'apply_changedept', '人事变动', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '137', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('67162de2888a44a6935c78cd8da17348', 'apply_leave0_print', '打印请假登记', '2', '433e2aec2d0449da9d9ffe524c633430', '150', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('67f32efc79424e09898df7b9a9bfb08e', 'jxc_manage_add', '添加关系', '2', 'c8fbc72fdb33450bbbb3fbb13979df01', '221', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('69a3cb6c8e134d608d57d16f43723193', 'plan_audi', '计划审核', '2', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', '22', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6b20b8d4b65645e4883fd8250536cef5', 'apply_turnup_print', '打印登机', '2', '609644d6ed55415e91a9dce3587739d6', '120', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6c24e3189bb3454aa8f5b74e131b1076', 'jxc_production_out', '出库', '2', '728e1a5d5eb04b56924a674e7b7e3a99', '218', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6d5f05ed557d4709a5f0373733b51eb5', 'funds_cheque_delete', '删除支票', '2', 'c3e7cf7a338e443093ed61a0d3f9c61a', '64', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6df7e2e05bba4bbc9b44c71f5e39f15d', 'apply_overtime_delete', '删除申请', '2', '7ad89be678bd41d98046707e008e5ce0', '146', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6e0683beb8814ce4a59c0cd7faf85bac', 'apply_reimbursement', '报销单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '177', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('6f14683521434f2db7d9e3a132e0958f', 'apply_remuneration_add', '劳务申请', '2', '3483daed9ac34dbc88dd2623510352e5', '173', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('705f2cecd5c44ce491df6086c60532fa', 'apply_form_delete', '删除表单', '2', '4b900c6857b74e1a81a236d0ac371dfa', '105', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('713dbe2e7ebf4f79b6081ee5e624f4e0', 'funds_experfee_edit', '编辑专家费', '2', 'e10b02d3133e4c188aea200beb2d2214', '80', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7265a905072f437b9161bf49bc539620', 'funds_cheque_edit', '编辑差旅', '2', '65ea1ab75a754abda5762b0d78cc1a04', '68', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('72872fb60c3444f8a70ba92e1a658e15', 'project0_add', '添加项目', '2', '7c7115994866468ea0e14a1121c5ec3b', '32', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('728e1a5d5eb04b56924a674e7b7e3a99', 'jxc_production', '生产管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '214', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('73188b0e02c24d3a91ecb4704f34666f', 'apply_form_edit', '编辑表单', '2', '4b900c6857b74e1a81a236d0ac371dfa', '103', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('73921e1cb76a42a5950bf9fbe5e63631', 'project1', '横向课题', '1', 'b654e741c6464ab490e4770713d498f8', '27', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('75dbaf5002384a9dad594282ce8718a8', 'funds_other_add', '添加支出', '2', 'edf60ffbf35a48a395212f8db3426bbb', '51', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('76056d119b324fb39b5b5012022369d4', 'apply_storage_print', '打印出入库', '2', 'e4f9b25bb29b41629a384254f70b913c', '160', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('776c5428bf104b2dbdb2c280c086a033', 'funds', '经费管理', '0', null, '35', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('79da129b5ee644a8a767551a8948d0b8', 'apply_register_delete', '删除登记', '2', '20877f40c3ee4c0c9d36c011fe75b370', '116', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7a7af402ec5c4c79bd3c66e21e98ed4f', 'funds_cheque_edit', '编辑支票', '2', 'c3e7cf7a338e443093ed61a0d3f9c61a', '62', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7ad89be678bd41d98046707e008e5ce0', 'apply_overtime', '加班申请', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '142', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7c7115994866468ea0e14a1121c5ec3b', 'project0', '纵向课题', '1', 'b654e741c6464ab490e4770713d498f8', '31', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7c7e80234be244e78ba9ac6ee40d690d', 'jxc_out_sub', '提交审核', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '206', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7d8348aca58248eb8b35016a95d0bdfa', 'funds_reimbursement_add', '创建报销', '2', 'f5f36e98d39f4ed994aba6aad285e546', '41', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7d8994a0f4ed49c1b7417fa32a344965', 'apply_needhands_print', '打印登记', '2', '92d21791f4484208ad87b40edfef4e36', '125', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('7dda4d9acea54dbcbed13751de3b1b3f', 'apply_cheque_print', '打印申请', '2', 'f858e867571d4362a7ce8cf0f9f99a30', '190', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('804890264b384bfba8bc726f7da976e8', 'repair_delete', '删除记录', '2', '2c59e48825d2462aa8260366574e5051', '238', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('806e81946d754f0db4ad1da6f0bc9c1b', 'apply_transfer_add', '转账申请', '2', 'c053e2d88d704c7db76cd2c237594015', '168', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('810bd29cea0a40d0b5e4f859a3504cba', 'business_edit', '修改商务', '2', 'f6c9d786132a4e429414f5a0dd7d2dbb', '87', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('81acdb87688148529d91e2e572a36d9d', 'funds_transfer_delete', '删除转账', '2', '0f670e0df0c54fd6aa8d6da271f2e721', '58', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('852995a146194c288573e9a2888f044c', 'funds_reimbursement_sub', '提交审核', '2', 'f5f36e98d39f4ed994aba6aad285e546', '43', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8588cad181024f11b6bc45b1d39918f8', 'apply_reimbursement_add', '报销申请', '2', '6e0683beb8814ce4a59c0cd7faf85bac', '178', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8695e62810534a299367d87600194478', 'jxc_income', '入库管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '200', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('88e56a54cb784488a0736c3399892e66', 'apply_needhands_add', '用人登记', '2', '92d21791f4484208ad87b40edfef4e36', '123', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8901e206440d4d68aeb69cd3d7af500e', 'funds_transfer_sub', '提交审核', '2', '0f670e0df0c54fd6aa8d6da271f2e721', '57', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8a55c0ff234143bba52cb77a4b6f8ed8', 'apply_expertfee_add', '专家费报销申请', '2', 'ded39ed0aa954c34ba3a3390921e6e71', '183', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8ad6c1aac1c7400293885680e354cc71', 'apply_leave1_edit', '编辑请假登记', '2', '199eb048688d44bfad191b9bc87b289a', '154', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8b4e80d580c74cc680bda09aacdd6e37', 'apply_online_add', '添加表单', '2', '4b900c6857b74e1a81a236d0ac371dfa', '102', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8c5a7183242e497ea0da0b4dbce82efe', 'apply_transfer_delete', '删除申请', '2', 'c053e2d88d704c7db76cd2c237594015', '171', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8ca577450d2d4681a941fcde721f0910', 'funds_out', '外拨经费', '1', '776c5428bf104b2dbdb2c280c086a033', '46', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8e37f608915046049285d1be93285139', 'funds_experfee_audit', '专家费审核', '2', 'e10b02d3133e4c188aea200beb2d2214', '83', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('8eee0efdcc514603a57afe63b8021b7a', 'apply_backtoschool_delete', '删除申请', '2', 'eb0286a8954f45d58350266ee579e18c', '136', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('90c762f6a54446638fdda94dc956608c', 'funds_cheque_delete', '删除报销', '2', '65ea1ab75a754abda5762b0d78cc1a04', '70', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('91a40e4b6d434d6aa2e9ae2a15a3fb26', 'apply_turnup_delete', '删除登记', '2', '609644d6ed55415e91a9dce3587739d6', '121', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('92d21791f4484208ad87b40edfef4e36', 'apply_needhands', '用人登记', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '122', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('9481a5dfc84a49f29e8af52949a00fb0', 'apply_expertfee_delete', '删除申请', '2', 'ded39ed0aa954c34ba3a3390921e6e71', '186', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('960b9b299de748d4b21d7e65744b1947', 'jxc_production_delete', '删除生产单', '2', '728e1a5d5eb04b56924a674e7b7e3a99', '217', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('99a5b745c5e54c28846c9fd8408281e4', 'apply_register_add', '研究生登记', '2', '20877f40c3ee4c0c9d36c011fe75b370', '113', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('9b49cbc15c37404ebd87e94ea9954ff3', 'funds_cheque_add', '支票登记', '2', 'c3e7cf7a338e443093ed61a0d3f9c61a', '61', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('9b62d01cde824c1e91ea50d43d6c0886', 'funds_fund_add', '添加到账', '2', '392ce8e4bca243208ac9a5b14b3854ff', '37', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('9d520af2b9564fb59e520018529620e7', 'jxc_out_edit', '编辑出库', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '205', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a053e823132940338b5322cfb648dd99', 'experts_edit', '修改专家', '2', '2c1d6fd25d8049a5b6d4faa8a51ecff2', '14', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a139f08792374b3fa9b1e3a3c7409c63', 'apply_reimbursement_delete', '删除申请', '2', '6e0683beb8814ce4a59c0cd7faf85bac', '181', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a2d941f02ebe44fe96dd4f31ff4e5607', 'group_delete', '删除小组', '2', 'c32b39857fa946c99c3b7f38bb1d7978', '11', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a2e23da17ec24b6ca17be2eec548e792', 'apply_salary', '调薪申请', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '127', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a3109cf32fd84394af4033d5c5be4183', 'apply_usecar_edit', '编辑申请', '2', '019cef7053804692b7afa8f1b640e0c3', '109', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a63dae29597d472fbfa1c8cf1dc3cd38', 'assets_add', '添加资产', '2', '1e946136850844d2a42ae4de95a73a10', '97', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a68358f4a76f4a2b801dcb22f65fa091', 'product', '生产记录', '1', '13668fcf83c84fe1b0624bded1851891', '230', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('a94c69f6744146dc8459dc2743f3d16e', 'apply_backToSchool_edit', '编辑申请', '2', 'eb0286a8954f45d58350266ee579e18c', '134', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('aba639f23a9246199f5314d143756a15', 'jxc_out_audit', '审核出库', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '208', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('abd21b4e9bd1493d80e945e90da55193', 'assets_delete', '删除资产', '2', '1e946136850844d2a42ae4de95a73a10', '99', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('aebd7327dab2429284c5e44138fb4e66', 'apply_reimbursement_print', '打印申请', '2', '6e0683beb8814ce4a59c0cd7faf85bac', '180', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('aec1c0173174434f918a56492418b765', 'apply_changedept_add', '变动登记', '2', '66b294bfdc3248b4806c1ab5223d7ce4', '138', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b07fc05241a34951961bb134e59d3d5e', 'assets', '固定资产管理', '0', null, '95', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b14984e201224f40bc21657155fef884', 'apply_trval_print', '打印申请', '2', 'b33b20c8f48a4ec78c328ceefdcbc2da', '165', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b2f44efb4aba4127ba22abd95b933d6f', 'plan_edit', '编辑计划', '2', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', '21', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b33b20c8f48a4ec78c328ceefdcbc2da', 'apply_trval', '差旅报销', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '162', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b4262a0492a04e25a41ec2166b3a0982', 'apply_overtime_edit', '编辑申请', '2', '7ad89be678bd41d98046707e008e5ce0', '144', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b5615bc11ab2499b8ce57e0fd2d18567', 'apply_salary_delete', '删除登记', '2', 'a2e23da17ec24b6ca17be2eec548e792', '131', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b5c958a23fef4405a44a47d72dc8788d', 'funds_out_add', '添加经费', '2', '8ca577450d2d4681a941fcde721f0910', '47', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b649c429bc174f9da16a3310420aee9e', 'apply_form_down', '下载表单', '2', '4b900c6857b74e1a81a236d0ac371dfa', '104', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b654e741c6464ab490e4770713d498f8', 'project', '项目管理', '0', null, '26', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b658234af3f549f38c6a982788230cc4', 'jxc_out_delete', '删除出库', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '207', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('b855a1a246d44c7ea9fc314d07da88a9', 'apply', '申请管理', '0', null, '100', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('bb20fb8537e543b49bb0f807aed245ef', 'dept', '部门管理', '0', null, '1', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('bb66147d9c7e4eefa39884036e2b048b', 'funds_experfee_delete', '删除专家费', '2', 'e10b02d3133e4c188aea200beb2d2214', '82', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('bd23d80cb6ae43d3be04d386da491bef', 'apply_leave0_add', '员工请假登记', '2', '433e2aec2d0449da9d9ffe524c633430', '148', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('be1c771cbcdf4daeb670e4784afb017d', 'apply_overtime_print', '打印申请', '2', '7ad89be678bd41d98046707e008e5ce0', '145', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c053e2d88d704c7db76cd2c237594015', 'apply_transfer', '转账单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '167', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c1dcd06e3707485eb64f2fe0242e4bf3', 'apply_changeDept_edit', '编辑登记', '2', '66b294bfdc3248b4806c1ab5223d7ce4', '139', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c32b39857fa946c99c3b7f38bb1d7978', 'group', '小组管理', '1', 'bb20fb8537e543b49bb0f807aed245ef', '9', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c34053e9609f4417adcb256aaa5796b6', 'apply_leave1_print', '打印请假登记', '2', '199eb048688d44bfad191b9bc87b289a', '155', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c3e7cf7a338e443093ed61a0d3f9c61a', 'funds_cheque', '支票管理', '1', '776c5428bf104b2dbdb2c280c086a033', '60', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c5aa1013e13f43c39e10500b570b0712', 'funds_remuneration_delete', '删除劳务', '2', 'ed49d770e1574108b4f2b36efc9d81f6', '76', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c6975dc898314ab29c844c3496d4e0fa', 'apply_trval_edit', '编辑申请', '2', 'b33b20c8f48a4ec78c328ceefdcbc2da', '164', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c6a2b1473e694e9995f655a45c81db95', 'apply_backtoschool_add', '返校申请', '2', 'eb0286a8954f45d58350266ee579e18c', '133', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c7aba3c15b6c4558aa6872522a706126', 'jxc_purchase_post_audit', '主任审核采购单', '2', '13c35cd8177a41899d0525bd21e93dcd', '199', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c8fbc72fdb33450bbbb3fbb13979df01', 'jxc_manage', '产品管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '220', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c960d0472a2a4f4f9fa1ad46952200db', 'apply_cheque_edit', '编辑申请', '2', 'f858e867571d4362a7ce8cf0f9f99a30', '189', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('c99209d4198b4ec2b0fbca5d19c539e0', 'repair_edit', '编辑记录', '2', '2c59e48825d2462aa8260366574e5051', '237', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('cad7323d2239497083dd9cf736e60812', 'jxc_production_income', '入库', '2', '728e1a5d5eb04b56924a674e7b7e3a99', '219', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('cb0069a7ce8648f5b215059b8b08e302', 'apply_turnup_edit', '编辑登记', '2', '609644d6ed55415e91a9dce3587739d6', '119', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('cdd4319d2e614b7987149c930c24c404', 'project0_change', '经费变动', '2', '7c7115994866468ea0e14a1121c5ec3b', '34', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('cfe6007c56bf4328aede239e8aca161e', 'apply_needhands_edit', '编辑登记', '2', '92d21791f4484208ad87b40edfef4e36', '124', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d012d8909ac345e19faee0c83d604aff', 'apply_reimbursement_edit', '编辑申请', '2', '6e0683beb8814ce4a59c0cd7faf85bac', '179', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d0f756b7203c484482bdf22034545833', 'apply_leave0_edit', '编辑请假登记', '2', '433e2aec2d0449da9d9ffe524c633430', '149', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d13850ae4ea0419ebf82670e544af0be', 'business_add', '添加商务', '2', 'f6c9d786132a4e429414f5a0dd7d2dbb', '86', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d302525cb21e42cebfdc889eb83cb119', 'business_delete', '删除商务', '2', 'f6c9d786132a4e429414f5a0dd7d2dbb', '89', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d4176bd74fd94bf090c0d655808713ca', 'role', '角色管理', '1', 'bb20fb8537e543b49bb0f807aed245ef', '5', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d78e99400c574617b2225fdc27d99826', 'apply_cheque_add', '支票申请', '2', 'f858e867571d4362a7ce8cf0f9f99a30', '188', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('d95788918d6142eaa5e0d99aee11759b', 'funds_fund_delete', '删除到账', '2', '392ce8e4bca243208ac9a5b14b3854ff', '39', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('daf9b8d9283a40fbaa877d5b33689208', 'funds_remuneration_add', '添加劳务', '2', 'ed49d770e1574108b4f2b36efc9d81f6', '73', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('de777baf76104fd5acb0172c1778ba3b', 'apply_leave1_delete', '删除请假登记', '2', '199eb048688d44bfad191b9bc87b289a', '156', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('ded39ed0aa954c34ba3a3390921e6e71', 'apply_expertfee', '专家费报销单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '182', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('df14d80db30f493faac3ebbb94a324a5', 'jxc_dealer', '经销商管理', '1', '1f745c26cbdd403887e16c4f4c067dad', '223', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('df7e5b56f3954b3aaa65a7c86a0c0bf9', 'plan', '工作计划', '1', 'bb20fb8537e543b49bb0f807aed245ef', '19', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('e10b02d3133e4c188aea200beb2d2214', 'funds_expertfee', '专家费管理', '1', '776c5428bf104b2dbdb2c280c086a033', '78', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('e4d0b362935c46abbc0d704c8fece838', 'startup_add', '添加实施', '2', 'fe2a474b712c44fab6d3d56e6c4d9b64', '91', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('e4f9b25bb29b41629a384254f70b913c', 'apply_storage', '办公室出入库', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '157', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('e6db9f5c6adf450685f95beedf3b2638', 'apply_trval_add', '报销申请', '2', 'b33b20c8f48a4ec78c328ceefdcbc2da', '163', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('e7d1d101421040d0869332929fa30f3b', 'jxc_out_audit_post', '主任审核出库', '2', '666a1c9c6f724722b45b5f983ddf6a6f', '209', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('ea6b1933239440e29d0455b89f8749b4', 'jxc_store_type_add', '添加商品', '2', '65c9550aee3949ea8b478ac595ffd2c9', '213', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('eb0286a8954f45d58350266ee579e18c', 'apply_backtoschool', '返校申请', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '132', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('eb6a3dda3bed47d4849401b7e2e36561', 'jxc_purchase_audit', '审核采购单', '2', '13c35cd8177a41899d0525bd21e93dcd', '198', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('ec2534d687d842f1b2f51b4c58800d45', 'funds_cheque_sub', '提交审核', '2', '65ea1ab75a754abda5762b0d78cc1a04', '69', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('ec73b730cee94a9b9aa63173db0868a5', 'apply_usecar_delete', '删除申请', '2', '019cef7053804692b7afa8f1b640e0c3', '111', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('eca1906e31f64b069000f39afa4d02aa', 'jxc_manage_gx', '关系结构', '2', 'c8fbc72fdb33450bbbb3fbb13979df01', '222', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('ed49d770e1574108b4f2b36efc9d81f6', 'funds_remuneration', '劳务管理', '1', '776c5428bf104b2dbdb2c280c086a033', '72', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('edf60ffbf35a48a395212f8db3426bbb', 'funds_other', '其他支出', '1', '776c5428bf104b2dbdb2c280c086a033', '50', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f01eb1556d1f48a395f813265a425a08', 'apply_storage_edit', '编辑出入库', '2', 'e4f9b25bb29b41629a384254f70b913c', '159', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f2d08c5a1f984ac5b0d47914261b22b6', 'plan_add', '添加计划', '2', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', '20', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f59cd8a2f8cb4e46a6f6d28258e81d81', 'jxc_production_add', '下生产单', '2', '728e1a5d5eb04b56924a674e7b7e3a99', '215', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f5f36e98d39f4ed994aba6aad285e546', 'funds_reimbursement', '日常报销', '1', '776c5428bf104b2dbdb2c280c086a033', '40', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f6c9d786132a4e429414f5a0dd7d2dbb', 'business', '项目商务', '1', '4463c3e9ab904c41b962f113948d9118', '85', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f858e867571d4362a7ce8cf0f9f99a30', 'apply_cheque', '支票登记单', '1', 'b855a1a246d44c7ea9fc314d07da88a9', '187', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('f895e56603fb45fc9627539f1ee751e9', 'jxc_purchase_sub', '提交审核', '2', '13c35cd8177a41899d0525bd21e93dcd', '196', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('fc6279ad0747496390a56b75bfb71fb4', 'funds_fund_edit', '修改到账', '2', '392ce8e4bca243208ac9a5b14b3854ff', '38', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('fd0fb7f119ba4ba2acadc05bba460085', 'apply_changeDept_print', '打印登记', '2', '66b294bfdc3248b4806c1ab5223d7ce4', '140', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('fd125b21648b4d4f9aaf462ed6548c10', 'apply_storage_add', '办公室出入库', '2', 'e4f9b25bb29b41629a384254f70b913c', '158', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('fe1aedc722d744b6a61547874f6f6e28', 'jxc_income_edit', '编辑入库', '2', '8695e62810534a299367d87600194478', '201', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('fe2a474b712c44fab6d3d56e6c4d9b64', 'startup', '项目实施', '1', '4463c3e9ab904c41b962f113948d9118', '90', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('qqqcef7053804692b7afa8f1b640e0c3', 'attendance', '考勤管理', '1', 'bb20fb8537e543b49bb0f807aed245ef', '16', '0', 'init', '2018-01-09 12:20:55', null, null);
INSERT INTO `function_t` VALUES ('vvvcef7053804692b7afa8f1b640e0c3', 'attendance_add', '考勤填报', '2', 'qqqcef7053804692b7afa8f1b640e0c3', '18', '0', 'init', '2018-01-21 11:09:01', null, null);
INSERT INTO `function_t` VALUES ('wwwcef7053804692b7afa8f1b640e0c3', 'attendance_set', '考勤组设置', '2', 'qqqcef7053804692b7afa8f1b640e0c3', '17', '0', 'init', '2018-01-09 12:20:55', null, null);

-- ----------------------------
-- Table structure for funds_detail_change_t
-- ----------------------------
DROP TABLE IF EXISTS `funds_detail_change_t`;
CREATE TABLE `funds_detail_change_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT NULL COMMENT '记录最后修改时间',
  `funds_detail_id` char(32) NOT NULL,
  `original_budget` int(8) DEFAULT NULL,
  `new_budget` int(8) DEFAULT NULL,
  `project_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAAFF07E25EBFFB5` (`funds_detail_id`),
  KEY `FKAAFF07E24CD7B278` (`project_id`),
  CONSTRAINT `FKAAFF07E24CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FKAAFF07E25EBFFB5` FOREIGN KEY (`funds_detail_id`) REFERENCES `funds_detail_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_detail_change_t
-- ----------------------------
INSERT INTO `funds_detail_change_t` VALUES ('5847f6f86aba4e74b33a50ba1f0d450f', 'api', '2018-01-07 22:30:16', null, null, '4194e4e284a449bb998ee802a2f861ad', '2000', '111', '49f4104393604a00925f6072187620b1');
INSERT INTO `funds_detail_change_t` VALUES ('acf081ad219b498fa8a75bb2437604ac', 'api', '2018-01-07 22:26:11', null, null, '4194e4e284a449bb998ee802a2f861ad', '2000', '2', '49f4104393604a00925f6072187620b1');
INSERT INTO `funds_detail_change_t` VALUES ('cf6b1be4c68c468f9d3e26d8427b23fc', 'api', '2018-01-07 22:33:36', null, null, '4194e4e284a449bb998ee802a2f861ad', '2000', '12', '49f4104393604a00925f6072187620b1');

-- ----------------------------
-- Table structure for funds_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `funds_detail_t`;
CREATE TABLE `funds_detail_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `original_budget` int(8) DEFAULT NULL,
  `new_budget` int(8) DEFAULT NULL,
  `pay` int(8) DEFAULT NULL,
  `original_balance` int(8) DEFAULT NULL,
  `new_balance` int(8) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_3` (`project_id`),
  CONSTRAINT `FK_Reference_3` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of funds_detail_t
-- ----------------------------
INSERT INTO `funds_detail_t` VALUES ('4194e4e284a449bb998ee802a2f861ad', '49f4104393604a00925f6072187620b1', 'api', '2017-11-26 09:09:57', 'api', '2018-01-07 22:33:37', '5000', '12', '1000', '2000', '500', '去去去');

-- ----------------------------
-- Table structure for funds_income_t
-- ----------------------------
DROP TABLE IF EXISTS `funds_income_t`;
CREATE TABLE `funds_income_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `income_amount` int(11) DEFAULT NULL COMMENT '已到账经费',
  `amount` int(11) DEFAULT NULL COMMENT '本次经费',
  `change_time` date DEFAULT NULL COMMENT '到账时间',
  `bill_info` int(11) DEFAULT NULL COMMENT '发票情况',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `financial_number` varchar(50) DEFAULT NULL COMMENT '财务编号',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_44` (`project_id`),
  CONSTRAINT `FK_Reference_44` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='经费到账表';

-- ----------------------------
-- Records of funds_income_t
-- ----------------------------
INSERT INTO `funds_income_t` VALUES ('0066bf217ad14da297f902223903e611', 'api', '2018-01-09 11:38:41', null, null, '49f4104393604a00925f6072187620b1', '68ff9976be70420d83e48fc536cf1fd2', '530', '300', '2018-01-08', '0', '', 'jsd1208');
INSERT INTO `funds_income_t` VALUES ('305f4a73d6f846fa800f699e37882a68', 'api', '2018-01-09 11:38:16', 'api', '2018-01-09 11:38:41', '49f4104393604a00925f6072187620b1', '68ff9976be70420d83e48fc536cf1fd2', '530', '230', '2018-01-01', '0', '', 'jsd1207');
INSERT INTO `funds_income_t` VALUES ('914b678a7f6e4338b6684f109b987a8b', null, null, 'api', '2017-11-26 13:30:50', '263ef7665c0a42e4acfbfaac865622ca', '68ff9976be70420d83e48fc536cf1fd2', '113', '111', '2017-11-15', '0', '111', '1111');

-- ----------------------------
-- Table structure for income_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `income_detail_t`;
CREATE TABLE `income_detail_t` (
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_id` char(32) DEFAULT NULL COMMENT '添加人',
  `income_id` char(32) DEFAULT NULL COMMENT '收入id',
  `income_money` bigint(20) DEFAULT NULL COMMENT '到账金额',
  `income_date` datetime DEFAULT NULL COMMENT '到账时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `id` char(32) NOT NULL COMMENT 'uuid',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_15` (`income_id`),
  KEY `FK_Reference_16` (`user_id`),
  CONSTRAINT `FK_Reference_15` FOREIGN KEY (`income_id`) REFERENCES `income_t` (`id`),
  CONSTRAINT `FK_Reference_16` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收入明细表';

-- ----------------------------
-- Records of income_detail_t
-- ----------------------------

-- ----------------------------
-- Table structure for income_t
-- ----------------------------
DROP TABLE IF EXISTS `income_t`;
CREATE TABLE `income_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '添加人',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  `incom_money` bigint(20) DEFAULT NULL COMMENT '已到账经费',
  `last_money` bigint(20) DEFAULT NULL COMMENT '最近到账金额',
  `last_date` datetime DEFAULT NULL COMMENT '最近到账时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_13` (`project_id`),
  KEY `FK_Reference_14` (`user_id`),
  CONSTRAINT `FK_Reference_13` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FK_Reference_14` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收入表';

-- ----------------------------
-- Records of income_t
-- ----------------------------

-- ----------------------------
-- Table structure for leave_t
-- ----------------------------
DROP TABLE IF EXISTS `leave_t`;
CREATE TABLE `leave_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '用户id',
  `begin_date` date DEFAULT NULL COMMENT '开始时间',
  `end_date` date DEFAULT NULL COMMENT '结束时间',
  `reason` varchar(200) DEFAULT NULL COMMENT '原由',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `status` int(11) DEFAULT '0',
  `audit_user` char(32) DEFAULT NULL,
  `days` int(11) DEFAULT NULL,
  `leave_type` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_9` (`user_id`),
  KEY `FK30888EC78CEC34C` (`audit_user`),
  CONSTRAINT `FK30888EC78CEC34C` FOREIGN KEY (`audit_user`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_9` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='请假表';

-- ----------------------------
-- Records of leave_t
-- ----------------------------
INSERT INTO `leave_t` VALUES ('602d4029b56d46f18a50fd51f353a4a1', '96e79218965eb72c92a549dd5a330112', '2017-07-02', '2017-07-24', '11', 'api', '2017-07-17 23:19:21', 'api', '2017-07-17 23:43:51', '1', '96e79218965eb72c92a549dd5a330112', '4', '2');
INSERT INTO `leave_t` VALUES ('76a80fe33f384d429f6850d1b57affcb', '96e79218965eb72c92a549dd5a330112', '2017-06-25', '2017-07-19', 'ces ', 'api', '2017-07-17 23:44:49', null, null, '0', null, '3', '3');
INSERT INTO `leave_t` VALUES ('b23637eacadf438f81745012f5e37645', '96e79218965eb72c92a549dd5a330112', '2017-06-25', '2017-07-04', '回家结婚吧', 'api', '2017-07-17 23:16:36', 'api', '2017-07-17 23:42:58', '2', '96e79218965eb72c92a549dd5a330112', '11', '2');

-- ----------------------------
-- Table structure for media_t
-- ----------------------------
DROP TABLE IF EXISTS `media_t`;
CREATE TABLE `media_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `title` varchar(50) DEFAULT NULL COMMENT '标题',
  `media_name` varchar(50) DEFAULT NULL COMMENT '媒体名称',
  `unit` int(11) DEFAULT NULL COMMENT '单位（1：信心中心；2：装备中心）',
  `report_date` date DEFAULT NULL COMMENT '报道时间',
  `url` varchar(200) DEFAULT NULL COMMENT '链接',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='媒体报道表';

-- ----------------------------
-- Records of media_t
-- ----------------------------

-- ----------------------------
-- Table structure for online_apply_t
-- ----------------------------
DROP TABLE IF EXISTS `online_apply_t`;
CREATE TABLE `online_apply_t` (
  `id` varchar(32) NOT NULL,
  `content` varchar(200) DEFAULT NULL,
  `create_time` date DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `file_name` varchar(200) DEFAULT NULL,
  `file_path` varchar(200) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `modify_time` date DEFAULT NULL,
  `title` varchar(100) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `user_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK900CC5F7B2777AC` (`user_id`),
  CONSTRAINT `FK900CC5F7B2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of online_apply_t
-- ----------------------------

-- ----------------------------
-- Table structure for other_fund_t
-- ----------------------------
DROP TABLE IF EXISTS `other_fund_t`;
CREATE TABLE `other_fund_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `unit` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  `change_time` datetime DEFAULT NULL,
  `content` varchar(200) DEFAULT NULL,
  `remark` varchar(100) DEFAULT NULL,
  `deal_man` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_fund_t
-- ----------------------------
INSERT INTO `other_fund_t` VALUES ('0187f498e0494dcd8d20742f41ababb8', null, null, 'api', '2018-01-01 18:50:12', '111111112', '3331', '2018-01-10 00:00:00', '2222222222221', '44441', '334441');

-- ----------------------------
-- Table structure for out_store_apply_t
-- ----------------------------
DROP TABLE IF EXISTS `out_store_apply_t`;
CREATE TABLE `out_store_apply_t` (
  `id` char(32) NOT NULL,
  `product_type_id` char(32) NOT NULL,
  `model` varchar(200) NOT NULL,
  `amount` int(11) DEFAULT NULL,
  `out_no` varchar(20) DEFAULT NULL,
  `out_time` datetime DEFAULT NULL,
  `purpose` varchar(200) DEFAULT NULL,
  `project_id` char(32) DEFAULT NULL,
  `use_man` varchar(20) DEFAULT NULL,
  `out_man` varchar(20) DEFAULT NULL,
  `remark` varchar(200) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(30) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `audit_msg` varchar(200) DEFAULT '',
  `product_store_id` char(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK6F8C3B544CD7B278` (`project_id`),
  KEY `FK6F8C3B5425D03C2E` (`product_type_id`),
  KEY `FK6F8C3B5422CB83E6` (`product_store_id`),
  CONSTRAINT `FK6F8C3B5422CB83E6` FOREIGN KEY (`product_store_id`) REFERENCES `product_store_t` (`id`),
  CONSTRAINT `FK6F8C3B5425D03C2E` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`),
  CONSTRAINT `FK6F8C3B544CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of out_store_apply_t
-- ----------------------------
INSERT INTO `out_store_apply_t` VALUES ('0eb33fc1b5dd4883b9da10d9bea9dde9', '17a298861b0c4f22b23aa66ba16bee6b', '颜色-绿色容量-300厂家-东厂', '1', '20180107-01', null, '111', '263ef7665c0a42e4acfbfaac865622ca', 'L', null, '111', '0', '2018-01-07 20:33:44', 'api', null, null, null, '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `out_store_apply_t` VALUES ('8f8fee5a28484e0493d3a6107094a18c', '17a298861b0c4f22b23aa66ba16bee6b', '厂家-东厂容量-300颜色-绿色', '1', '20171225-01', null, '2', '263ef7665c0a42e4acfbfaac865622ca', 'L', null, '3', '0', '2017-12-25 10:12:02', 'api', null, null, null, '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `out_store_apply_t` VALUES ('914db3ed7f5d4042ad24f34ff371c0b0', '17a298861b0c4f22b23aa66ba16bee6b', '厂家-东厂容量-300颜色-绿色', '133333', '20171226-01', null, '11111', null, 'L', null, 'ad', '0', '2017-12-26 09:32:42', 'api', null, null, null, '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `out_store_apply_t` VALUES ('a6cf297ea78a41adb41920cb994bc68b', '17a298861b0c4f22b23aa66ba16bee6b', '容量-200颜色-黄色厂家-东厂', '1', '20171226-02', null, '224d', '263ef7665c0a42e4acfbfaac865622ca', 'L', null, '333啊', '1', '2017-12-26 09:59:04', 'api', '2017-12-26 11:12:55', 'api', null, 'c9e216df900b40f6a4031c6df8441078');
INSERT INTO `out_store_apply_t` VALUES ('d5784a65a9894eec9a68a361301ec2e3', '17a298861b0c4f22b23aa66ba16bee6b', '容量-200颜色-黄色厂家-东厂', '1', '20171226-03', null, '111', null, 'L', null, '11', '4', '2017-12-26 10:34:26', 'api', '2017-12-26 11:27:24', 'api', '4', '46a17b049c584505be9893f29cc84d2b');

-- ----------------------------
-- Table structure for patent_t
-- ----------------------------
DROP TABLE IF EXISTS `patent_t`;
CREATE TABLE `patent_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `patent_name` varchar(50) DEFAULT NULL COMMENT '专利名称',
  `type` varchar(20) DEFAULT NULL COMMENT '类别',
  `inventor` char(32) DEFAULT NULL COMMENT '发明人',
  `unit` int(11) DEFAULT NULL COMMENT '单位（1：信心中心；2：装备中心）',
  `status` int(11) DEFAULT NULL COMMENT '授权状态',
  `patent_date` date DEFAULT NULL COMMENT '时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_24` (`inventor`),
  CONSTRAINT `FK_Reference_24` FOREIGN KEY (`inventor`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='专利表';

-- ----------------------------
-- Records of patent_t
-- ----------------------------

-- ----------------------------
-- Table structure for permission_t
-- ----------------------------
DROP TABLE IF EXISTS `permission_t`;
CREATE TABLE `permission_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `role_id` char(32) DEFAULT NULL COMMENT '角色id',
  `function_id` char(32) DEFAULT NULL COMMENT '功能id',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `permission_function_fk` (`function_id`),
  KEY `role_permission_fk` (`role_id`),
  CONSTRAINT `permission_function_fk` FOREIGN KEY (`function_id`) REFERENCES `function_t` (`id`),
  CONSTRAINT `role_permission_fk` FOREIGN KEY (`role_id`) REFERENCES `role_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='权限功能表';

-- ----------------------------
-- Records of permission_t
-- ----------------------------
INSERT INTO `permission_t` VALUES ('00d27560c5c348dab06b2dee61e8e919', '96e79218965eb72c92a549dd5a330112', '4b900c6857b74e1a81a236d0ac371dfa', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('011342828404479caa212b5da4ea5fc4', '67f5b7d9e5c146f1b4e8dd953951ab7b', '24febc42318e48be9104ec33241ad7bd', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0180b7028d184b9e9266649d8f36ceb4', '96e79218965eb72c92a549dd5a330112', '776c5428bf104b2dbdb2c280c086a033', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('024db0879e6349afac97816cb7dce0ce', '96e79218965eb72c92a549dd5a330112', '24f949ce4fe24d00bd3a4b990b853267', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('02a192307fae429d88388d9e2a6a98f4', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'bd23d80cb6ae43d3be04d386da491bef', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('02d705bcc77d42d2a6742d730a1d2f53', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f858e867571d4362a7ce8cf0f9f99a30', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0352c91cea8b4d40ac599884e13df8b0', '96e79218965eb72c92a549dd5a330112', '6077b4907c634f44883cb23fc77b74f2', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('03de049705a74857b0446a491f925001', '7f87ef95e3a54d84a49db9d7aa50d955', 'de777baf76104fd5acb0172c1778ba3b', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('043c05e3b1b44f8e84b01b474128c33f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4fef1dccea884633bf63f3ee289eec63', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('04d4e9c14ce74139ab0108dd5c7aeb02', '7f87ef95e3a54d84a49db9d7aa50d955', '3185e09cd15f403a8fd4c3dcf51f8450', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('052a584039d646bfb1bdecf5588510c5', '96e79218965eb72c92a549dd5a330112', 'aebd7327dab2429284c5e44138fb4e66', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0584e81692724e9ba8e65fdfdefe45d1', '96e79218965eb72c92a549dd5a330112', '81acdb87688148529d91e2e572a36d9d', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('058b66837fae42f8adaa0d9534f84bb2', '96e79218965eb72c92a549dd5a330112', '53e5a414cefc44d0984b5f7d2dd83165', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('06045351de174866b93dab0593a6d18d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '13668fcf83c84fe1b0624bded1851891', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0606bc683cc64caeb37ed0d518dddb1c', '7f87ef95e3a54d84a49db9d7aa50d955', '91a40e4b6d434d6aa2e9ae2a15a3fb26', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('06476522d5974994908e1ccba6bc96ca', '96e79218965eb72c92a549dd5a330112', '30ff40f709da4e1986d6fdad8ee89d2f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0675cacd51c4407a8e61ed384607a009', '67f5b7d9e5c146f1b4e8dd953951ab7b', '592be2e1ae824addb577876000710fe9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('067dd2699e3049d381844df5c123e2da', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b33b20c8f48a4ec78c328ceefdcbc2da', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0704e9cfa992443ca351da4f66e22d13', '96e79218965eb72c92a549dd5a330112', 'f01eb1556d1f48a395f813265a425a08', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0715e8a6bfc343899bd169abd2c58b8d', '96e79218965eb72c92a549dd5a330112', 'c7aba3c15b6c4558aa6872522a706126', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('075a95e85b8c4ec8b26cebda7e363b8b', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'aebd7327dab2429284c5e44138fb4e66', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0866835770bd442598e467108a5833d8', '7f87ef95e3a54d84a49db9d7aa50d955', 'a63dae29597d472fbfa1c8cf1dc3cd38', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('08b35307f5344de18e5a732121e6807c', '96e79218965eb72c92a549dd5a330112', '03a853e928b0466791506b1aafdbc62c', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('08b9018ebb7a43d99650d55cc56d8eee', '96e79218965eb72c92a549dd5a330112', '8a55c0ff234143bba52cb77a4b6f8ed8', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('08c794822b45453396ce1c22257ee63c', '96e79218965eb72c92a549dd5a330112', '3a1669fb4c3043548bae9f905c1220c6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('090eba6194d84d52a1311cf5bd8ac7d1', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a2d941f02ebe44fe96dd4f31ff4e5607', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('09936fc169dd48fbb60af819cba50764', '96e79218965eb72c92a549dd5a330112', '852995a146194c288573e9a2888f044c', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0b2c92d434ab4956ad76a7d311760fa0', '96e79218965eb72c92a549dd5a330112', '72872fb60c3444f8a70ba92e1a658e15', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0b3f8168e8c0467e9445515a9105fa94', '67f5b7d9e5c146f1b4e8dd953951ab7b', '90c762f6a54446638fdda94dc956608c', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0b452663d5ec4e06ae77e447d855df47', '96e79218965eb72c92a549dd5a330112', 'c6a2b1473e694e9995f655a45c81db95', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0bb23e6c1b2b4f5180d725e4c7b6d8c2', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3185e09cd15f403a8fd4c3dcf51f8450', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0c2509c9a2db4d42a438ea3a3b25bf12', '7f87ef95e3a54d84a49db9d7aa50d955', '8901e206440d4d68aeb69cd3d7af500e', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('0c6bdbcac0524aa8b122ba19c095cd4a', '96e79218965eb72c92a549dd5a330112', 'c34053e9609f4417adcb256aaa5796b6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0ca8872c0f7d4e52878748868fef1dc1', '96e79218965eb72c92a549dd5a330112', '88e56a54cb784488a0736c3399892e66', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0caff173490b4e6487dfcf92ac2dc0d4', '7f87ef95e3a54d84a49db9d7aa50d955', 'qqqcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('0cd6d243b6b948cc80194218098e2f5f', '96e79218965eb72c92a549dd5a330112', '1e946136850844d2a42ae4de95a73a10', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0cfd3b9da6c34640ae7e50598d2924a6', '7f87ef95e3a54d84a49db9d7aa50d955', '417410b80f064ca1b5a545c72d440bf6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('0d2cea7b45e6412a8192321b5fe1d1c3', '96e79218965eb72c92a549dd5a330112', '2ed3b43b8f3849fc8a6bc656c48a8fe6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0d4cfa521f6846b4b08b9a6dea411fb9', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6b20b8d4b65645e4883fd8250536cef5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0db58d002da44842abf638a0d2129972', '96e79218965eb72c92a549dd5a330112', 'd302525cb21e42cebfdc889eb83cb119', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0dcc99d016a2489193097d764c4545dc', '96e79218965eb72c92a549dd5a330112', '0fa5ca202ef5431fbaa5aeb39b9b07da', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('0de637ed0a8b4b6daec15b82947f8159', '7f87ef95e3a54d84a49db9d7aa50d955', 'c34053e9609f4417adcb256aaa5796b6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('0e0e64fe8a2942ad9ad14d07d7acce79', '67f5b7d9e5c146f1b4e8dd953951ab7b', '482f0e93d4344e3083fc274a17f91d13', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0e1e4b01345348bd951a802d13837ba5', '7f87ef95e3a54d84a49db9d7aa50d955', '3bee2c779b2c40d6885a9d7464fc3c8e', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('0e870ea5c2cc4d5da0ca6d0219b5afe1', '7f87ef95e3a54d84a49db9d7aa50d955', 'bd23d80cb6ae43d3be04d386da491bef', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('0ea703b5a4de46b0899217ec0ba08a30', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3b9609cfaec34cd0a692c62f209faca1', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0ec768fb4a8947f2b91646977723dee1', '67f5b7d9e5c146f1b4e8dd953951ab7b', '02dac7f9bf6a40fc88086a676e7a34cc', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('0fe847a1a74b4156ae4322bb9bb34f86', '7f87ef95e3a54d84a49db9d7aa50d955', 'f895e56603fb45fc9627539f1ee751e9', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('104279211a764f1bb130005c6adb0298', '7f87ef95e3a54d84a49db9d7aa50d955', 'f59cd8a2f8cb4e46a6f6d28258e81d81', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('104c1568ca0a4ceaa4575611c0703a4a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '427bb773efce4ac2b1f9c70ef25496f1', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('10670d1927174342a7ea37aab2f84561', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c053e2d88d704c7db76cd2c237594015', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('10ed32f540054904bf740b13b0cd7237', '96e79218965eb72c92a549dd5a330112', '48b68155a61f4fa8a9233239c0f4ca95', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('112b57a3ca484e21a2c5a34b9dbda780', '7f87ef95e3a54d84a49db9d7aa50d955', '638e4bc12d844d02b9a134406ffe1cc1', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('11d40867044d4d0a9bef727d9e4635de', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'aba639f23a9246199f5314d143756a15', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('1207dceb56784219b2df167788b4fd0a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '220b143b708c469f97eef74153f54377', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('1245a76909704cc69171d0148d6ec434', '96e79218965eb72c92a549dd5a330112', '2116f77edea649409ebb9115ffe0cce3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('12e55a01834344f6bd52db9f1f4ec86a', '7f87ef95e3a54d84a49db9d7aa50d955', 'e10b02d3133e4c188aea200beb2d2214', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('132b82fad10948c785db0bc7ecc1b22d', '96e79218965eb72c92a549dd5a330112', 'c8fbc72fdb33450bbbb3fbb13979df01', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('133562b7ce8747aba2218c4366ff3965', '7f87ef95e3a54d84a49db9d7aa50d955', '8695e62810534a299367d87600194478', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('134e61e56e3a4e65a490469892cd50ae', '96e79218965eb72c92a549dd5a330112', '44d73f216e8b4a1ba5445fe78bb276d0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('13ec43ca37994b97bba3bd0d6cdf6b7a', '7f87ef95e3a54d84a49db9d7aa50d955', '3770269cb7c84a9caa7f08e2b48ad553', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('144e49a5e387490c8a3a9164faa516d3', '96e79218965eb72c92a549dd5a330112', 'c32b39857fa946c99c3b7f38bb1d7978', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('14655c15488f4d74a9996b63d8373d21', '7f87ef95e3a54d84a49db9d7aa50d955', '4c7acaa8fd1f40d2b807ef12940c08e6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('151a888824ec44bdabf6ad8041488f60', '7f87ef95e3a54d84a49db9d7aa50d955', '76056d119b324fb39b5b5012022369d4', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('1594e2d12bb2429ebf823e554149f116', '7f87ef95e3a54d84a49db9d7aa50d955', 'd95788918d6142eaa5e0d99aee11759b', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('1603d739324a4750a6d20c4e75b7d859', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6548698683f94f4fbbf007415d176ff5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('1619693aa4c54922a11839fd994294e5', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a68358f4a76f4a2b801dcb22f65fa091', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('161daec4ed0345c9ad71158b6408e7cc', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'ded39ed0aa954c34ba3a3390921e6e71', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('16c0995517b04a329794f87d00a0b68f', '96e79218965eb72c92a549dd5a330112', '7265a905072f437b9161bf49bc539620', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('17588497f69c4af3998b146117aeefc5', '7f87ef95e3a54d84a49db9d7aa50d955', 'b14984e201224f40bc21657155fef884', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('17e37138c6854a25b3bb140725e5f8c8', '96e79218965eb72c92a549dd5a330112', '6c24e3189bb3454aa8f5b74e131b1076', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('17f68871b70c4d108df2a492e514a832', '96e79218965eb72c92a549dd5a330112', 'f895e56603fb45fc9627539f1ee751e9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('18296c65e77a4da2b2cc649d8b702246', '96e79218965eb72c92a549dd5a330112', '146c450aa1af43049bf1c49a70e4d7e2', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('185782cb887641688d2a001ea13fd13b', '7f87ef95e3a54d84a49db9d7aa50d955', '3178372731be480b940837642ee0a10f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('18c290075abb4497b2a985c4842dae47', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c3e7cf7a338e443093ed61a0d3f9c61a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('193e9ce51fa44541808a2972c1524af4', '96e79218965eb72c92a549dd5a330112', 'a2e23da17ec24b6ca17be2eec548e792', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('1a19b66cfdc14c5e872d9b6fc51b6b50', '7f87ef95e3a54d84a49db9d7aa50d955', '53e5a414cefc44d0984b5f7d2dd83165', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('1ae6ff7e10c3436387eafb9449d3cef2', '7f87ef95e3a54d84a49db9d7aa50d955', '960b9b299de748d4b21d7e65744b1947', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('1b08597a9c9b450786b0ae53fc650dd7', '96e79218965eb72c92a549dd5a330112', '9b62d01cde824c1e91ea50d43d6c0886', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('1b37760723f845d7b3633268dfb927bf', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2eb716450d3947688f73593a33de4907', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('1b5d0dc9578a424aa59b2dc63734833f', '7f87ef95e3a54d84a49db9d7aa50d955', '13c35cd8177a41899d0525bd21e93dcd', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('1c6c7f20ce0d4e7ebfd406989f300df5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8695e62810534a299367d87600194478', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('1d9384d3bdd14586aaac073150b3b211', '96e79218965eb72c92a549dd5a330112', '1d9384d3bdd14586aaac073150b3b211', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('1dfee34754874c18aaeb1f711fb03ef0', '7f87ef95e3a54d84a49db9d7aa50d955', 'fc6279ad0747496390a56b75bfb71fb4', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('1e35348384be44fe9ec24efa3ace7b3f', '7f87ef95e3a54d84a49db9d7aa50d955', 'ded39ed0aa954c34ba3a3390921e6e71', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('1e6b3de5dc8f4422bd5d393b43d6999f', '96e79218965eb72c92a549dd5a330112', 'f2d08c5a1f984ac5b0d47914261b22b6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('1e6fffc4d8754123b99bb26014b5fd4c', '7f87ef95e3a54d84a49db9d7aa50d955', '609644d6ed55415e91a9dce3587739d6', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('1e938f9ab87649ceb83e8baf78177c10', '96e79218965eb72c92a549dd5a330112', '5df413bfb7d54d9790299232f2a42984', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('1f408c7b65fb4891a6c7f84baeba7b45', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'cad7323d2239497083dd9cf736e60812', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2083ba062df145d3b8495b612fcb680d', '7f87ef95e3a54d84a49db9d7aa50d955', 'c053e2d88d704c7db76cd2c237594015', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('20c5a13493dc46d1a531cab5710db69c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '88e56a54cb784488a0736c3399892e66', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('20eeb76bab6c49f6a8d97ed0dba535f7', '96e79218965eb72c92a549dd5a330112', '6e0683beb8814ce4a59c0cd7faf85bac', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2106ac4b3663457fb9b703abe3eb7066', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1d9384d3bdd14586aaac073150b3b2ec', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('211557dc68db486eac30a80a6d22b579', '96e79218965eb72c92a549dd5a330112', '35443649b2d94d21bc0c52a608feb38a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('218100f7364646dbb2f6123b5c16da3e', '96e79218965eb72c92a549dd5a330112', 'abd21b4e9bd1493d80e945e90da55193', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2255ea081ca64694a677f5de03a4fe84', '96e79218965eb72c92a549dd5a330112', '2d0f1cc2931c40a086e701de417e61f9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('22933fe4d21b4d9f8dcba2c5b919075b', '96e79218965eb72c92a549dd5a330112', '3185e09cd15f403a8fd4c3dcf51f8450', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2328e93e60184ea291732a1c510ec3da', '96e79218965eb72c92a549dd5a330112', 'f5f36e98d39f4ed994aba6aad285e546', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('258134193471417cb46f06802a385322', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1f2c7c5a251042c098612dba5d815d7a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('25b10691decb43b48fe974bb2aa3ee11', '7f87ef95e3a54d84a49db9d7aa50d955', '25c39443b5124d15aa2cbc952846de35', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('25d3abba62cb474abccac5436290be06', '96e79218965eb72c92a549dd5a330112', '9481a5dfc84a49f29e8af52949a00fb0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('261030d0c2aa44e19d9107428656f089', '7f87ef95e3a54d84a49db9d7aa50d955', 'f858e867571d4362a7ce8cf0f9f99a30', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('2670434a115d4d44b168efb0ccdfba65', '7f87ef95e3a54d84a49db9d7aa50d955', '81acdb87688148529d91e2e572a36d9d', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('26db8cc3dec84701a54e8b78f10de7e9', '7f87ef95e3a54d84a49db9d7aa50d955', '6077b4907c634f44883cb23fc77b74f2', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('27272aa2ace9470db8a147db892428e8', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b658234af3f549f38c6a982788230cc4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('272e28ea0af24506aee21216f6782215', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f895e56603fb45fc9627539f1ee751e9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('27336c98c62c4c95a6dd1382c9cdbb59', '7f87ef95e3a54d84a49db9d7aa50d955', '73921e1cb76a42a5950bf9fbe5e63631', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('27b0b3dd4b3a418684649a88bafe6a39', '96e79218965eb72c92a549dd5a330112', '92d21791f4484208ad87b40edfef4e36', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('27e0505b6be940d2a179453373ad1179', '67f5b7d9e5c146f1b4e8dd953951ab7b', '666a1c9c6f724722b45b5f983ddf6a6f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('28621b1c3cc943c08aeea6089f6337b0', '7f87ef95e3a54d84a49db9d7aa50d955', '3a1669fb4c3043548bae9f905c1220c6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('289a0704f1c94daeb21d93d8d5679f9c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2d2cc9ed925047ba80a5d64881dcbbb2', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('289b8f3fe8ed43feb9cec81ca1382d74', '67f5b7d9e5c146f1b4e8dd953951ab7b', '433e2aec2d0449da9d9ffe524c633430', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('28c7f16c60c64ec2a7cded0d44e87e6b', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7d8994a0f4ed49c1b7417fa32a344965', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('293c7fd7f42d4c7cb84b3b5e140db720', '96e79218965eb72c92a549dd5a330112', 'a053e823132940338b5322cfb648dd99', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('29b40b80ec9a4f2eacb8ff6fbeb7b629', '67f5b7d9e5c146f1b4e8dd953951ab7b', '25c39443b5124d15aa2cbc952846de35', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('29e4eadd77cd4e60b356553d68366684', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'aec1c0173174434f918a56492418b765', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2a0cba7dba7e427b8e97881ca6e59e41', '96e79218965eb72c92a549dd5a330112', '2f65e7aa17b14cca8faf26fceabf72ca', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2a3c04967f7e46818eed56f2b1e7021f', '7f87ef95e3a54d84a49db9d7aa50d955', 'c960d0472a2a4f4f9fa1ad46952200db', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2a40c460c8864017961b0160925d5357', '7f87ef95e3a54d84a49db9d7aa50d955', '8e37f608915046049285d1be93285139', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2aa453a0912742e68f2e0e602b40a0e3', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3178372731be480b940837642ee0a10f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2acd407f51ab4232bd033556e9e549a9', '7f87ef95e3a54d84a49db9d7aa50d955', '0fa5ca202ef5431fbaa5aeb39b9b07da', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2ad86f4709b0486aaa1042a0133765dd', '96e79218965eb72c92a549dd5a330112', '592be2e1ae824addb577876000710fe9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2b76521daa324180a1892db76241565b', '7f87ef95e3a54d84a49db9d7aa50d955', '05e7c020477b4bd4a1b817e3f49c6974', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('2c0f7ea6bd494899b5426e362ac3e1ef', '7f87ef95e3a54d84a49db9d7aa50d955', '019cef7053804692b7afa8f1b640e0c3', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('2c24a2a65cc443e285bfb4ffbe55acff', '96e79218965eb72c92a549dd5a330112', '4c7acaa8fd1f40d2b807ef12940c08e6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2c9c962372484383bfb055f63c9c09de', '7f87ef95e3a54d84a49db9d7aa50d955', '7d8994a0f4ed49c1b7417fa32a344965', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2d0e6d354b8f4e25bd62aeeee19c68b8', '96e79218965eb72c92a549dd5a330112', '097f2092182647a199bf723034acbfee', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2d145caedd47478f9eae4c02559e6122', '67f5b7d9e5c146f1b4e8dd953951ab7b', '9d520af2b9564fb59e520018529620e7', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2d17b19bc04e47dd8b5d1a3f9976add6', '96e79218965eb72c92a549dd5a330112', '609644d6ed55415e91a9dce3587739d6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2da41d9c837e447c9b4845511df615cc', '7f87ef95e3a54d84a49db9d7aa50d955', '6df7e2e05bba4bbc9b44c71f5e39f15d', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2ddf1b743bb947c28548f6f3e9e23865', '7f87ef95e3a54d84a49db9d7aa50d955', 'e4d0b362935c46abbc0d704c8fece838', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2dfcd67a9eed4510ba3de3063c885ca4', '7f87ef95e3a54d84a49db9d7aa50d955', '5df413bfb7d54d9790299232f2a42984', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2e105a32208e47c7a114a9d043ed8df5', '7f87ef95e3a54d84a49db9d7aa50d955', '081f2ee65f774472ac748357168ac694', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2e18314983b143f198dc37fd9f0e6ccf', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b4262a0492a04e25a41ec2166b3a0982', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2ee001cdaac14a8799c41b289dde21d3', '96e79218965eb72c92a549dd5a330112', '65c9550aee3949ea8b478ac595ffd2c9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2f173e3af8ca453a97bafc9e8e4a9f54', '7f87ef95e3a54d84a49db9d7aa50d955', '1dfab9fe3f6942fea3e92b5d6e9b85ce', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('2f2051a350194b7da944309b81e3c352', '7f87ef95e3a54d84a49db9d7aa50d955', 'a68358f4a76f4a2b801dcb22f65fa091', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('2f516124f8f44b8baa6cb3701e1eb502', '96e79218965eb72c92a549dd5a330112', '4312de8ba0ee4dec86d5f45e924ad413', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2f6a2fa84bf24112a6015e1e965ec304', '96e79218965eb72c92a549dd5a330112', 'a68358f4a76f4a2b801dcb22f65fa091', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('2f7948ec2d054f13add5768e2b2f66ed', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'd0f756b7203c484482bdf22034545833', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('2fe9eff672284a7a846169857c832a59', '96e79218965eb72c92a549dd5a330112', '8e37f608915046049285d1be93285139', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('30803b71da6b4c9daad6f7e6d9d9a67f', '7f87ef95e3a54d84a49db9d7aa50d955', '6548698683f94f4fbbf007415d176ff5', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('30b43a637676458c9aacb8ff8e3c39d7', '96e79218965eb72c92a549dd5a330112', 'd0f756b7203c484482bdf22034545833', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('312961c6f91f4212930d25acc74f967a', '96e79218965eb72c92a549dd5a330112', '65ea1ab75a754abda5762b0d78cc1a04', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3268db90a503471296c2939990f55200', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'edf60ffbf35a48a395212f8db3426bbb', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3290a269da2d4693be209af26e961300', '7f87ef95e3a54d84a49db9d7aa50d955', '537df1fcc02c479ab2ebc164fa0aa977', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('32c24749feeb49cb8a43e9352356154f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4e966416066e4ecaa853f10e8eb3ab54', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3362704e958c443cac60140d4fdbcafd', '7f87ef95e3a54d84a49db9d7aa50d955', '1d9384d3bdd14586aaac073150b3b2ec', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('3397635d054c49a1ad3c3810b91b940a', '96e79218965eb72c92a549dd5a330112', '8588cad181024f11b6bc45b1d39918f8', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('33b4f497f3664eb3847ee0c082628a9a', '7f87ef95e3a54d84a49db9d7aa50d955', 'a053e823132940338b5322cfb648dd99', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('33daa8ae427642f4aae076f88b202557', '96e79218965eb72c92a549dd5a330112', 'a94c69f6744146dc8459dc2743f3d16e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('346552fd2bc948599dd71f1a173f9682', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'e10b02d3133e4c188aea200beb2d2214', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('34c86095374247a69136a099838cd603', '96e79218965eb72c92a549dd5a330112', 'be1c771cbcdf4daeb670e4784afb017d', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('352c8e2a502448b9a771b67b47cbaf21', '67f5b7d9e5c146f1b4e8dd953951ab7b', '0fa5ca202ef5431fbaa5aeb39b9b07da', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3541ff344bce40e096144b6171056811', '7f87ef95e3a54d84a49db9d7aa50d955', '7c7115994866468ea0e14a1121c5ec3b', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('35755c09d3f44a8d872093ea47e8955c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8588cad181024f11b6bc45b1d39918f8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('358cfcde62bd4f88b70ddf1ae4015c9b', '96e79218965eb72c92a549dd5a330112', 'd13850ae4ea0419ebf82670e544af0be', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('367e0fd94c084c3d95259d0e9f621dcf', '7f87ef95e3a54d84a49db9d7aa50d955', 'a94c69f6744146dc8459dc2743f3d16e', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('368bb8f0665a4d2eae1b22a17e62e60b', '96e79218965eb72c92a549dd5a330112', 'e7d1d101421040d0869332929fa30f3b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('36c6c71de6e24423a6c63c891bec332c', '96e79218965eb72c92a549dd5a330112', 'b5c958a23fef4405a44a47d72dc8788d', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('37117dbe6a7f447683e558d5748b5a3f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4b900c6857b74e1a81a236d0ac371dfa', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('37446dc7f9b44b3685ba22e2ac334072', '7f87ef95e3a54d84a49db9d7aa50d955', '48b68155a61f4fa8a9233239c0f4ca95', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('37ad9664051d4e89a339136ad90852cb', '67f5b7d9e5c146f1b4e8dd953951ab7b', '53e5a414cefc44d0984b5f7d2dd83165', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('37f879dbe5124eccbceb58824953221a', '7f87ef95e3a54d84a49db9d7aa50d955', 'f5f36e98d39f4ed994aba6aad285e546', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('384e6f92835844e2bd2651ee6697d233', '96e79218965eb72c92a549dd5a330112', '806e81946d754f0db4ad1da6f0bc9c1b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('386755ad59a54d46a51da0fe5082a66e', '96e79218965eb72c92a549dd5a330112', '8901e206440d4d68aeb69cd3d7af500e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('386d433ed58d400cb4432f6107a7a5c6', '7f87ef95e3a54d84a49db9d7aa50d955', '2230a6c6afca4654994f07ac6b78410b', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('395471fee4c54a4fb9418bc216196685', '7f87ef95e3a54d84a49db9d7aa50d955', '59e7f5c6a15442fba4be4fdde6091941', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('399e3cae46df4ef4985fef2c50de443f', '96e79218965eb72c92a549dd5a330112', '584850923b0a4dd38699a35881f65edf', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('39ab1dfacd23419a913210adcdfba2a2', '96e79218965eb72c92a549dd5a330112', '02dac7f9bf6a40fc88086a676e7a34cc', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3a1d4a050f724d64aa4ee63716408a43', '96e79218965eb72c92a549dd5a330112', 'ea6b1933239440e29d0455b89f8749b4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3a3aefaf97b5436d86f9f07d8d018e15', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c7aba3c15b6c4558aa6872522a706126', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3a5c144d957947daa039723f9ce1dee4', '7f87ef95e3a54d84a49db9d7aa50d955', '7dda4d9acea54dbcbed13751de3b1b3f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('3aee21e0d3dd4cf89bb1769dc9e375f6', '7f87ef95e3a54d84a49db9d7aa50d955', 'e6db9f5c6adf450685f95beedf3b2638', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('3b702381ddaf4c44bb4448bb5fe6ddd9', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5ee48d30d72f49d0b09a9ddbe8005fc2', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3be2058ed6494674bc1b081346e63ad8', '96e79218965eb72c92a549dd5a330112', '2f1dec3044b04ee59a08f1f663aa20b9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3d20f34a24ae461983d078dd8a88359d', '96e79218965eb72c92a549dd5a330112', '537df1fcc02c479ab2ebc164fa0aa977', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3d8c329c2ecb435191a3ea38b493be4b', '7f87ef95e3a54d84a49db9d7aa50d955', '2f1dec3044b04ee59a08f1f663aa20b9', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('3ddbf8062d10469b9c16de4726286742', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2d0f1cc2931c40a086e701de417e61f9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3df4e677bc7248feb7a667700b4f65c4', '7f87ef95e3a54d84a49db9d7aa50d955', '6f14683521434f2db7d9e3a132e0958f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('3e33080c431044faa9709ce3902d5541', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6294cb7477ce45d59e4b8660070bb283', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('3e3a74d65eb542a99a17f916fd8cbc51', '7f87ef95e3a54d84a49db9d7aa50d955', 'c1dcd06e3707485eb64f2fe0242e4bf3', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('3e42adf079274c5fbb7881b5e611cc8e', '96e79218965eb72c92a549dd5a330112', '1839f9f9e6db4f5098cd8617944ca2bb', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('3f0390390d55410ab945203e3e6af8db', '7f87ef95e3a54d84a49db9d7aa50d955', '1cf77e815d0343c19770ab7e74e1f685', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('3fd121ab746849f1b3f0854f2b6c43b2', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8a55c0ff234143bba52cb77a4b6f8ed8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('400932e02084445aa797d999dc2f94f5', '7f87ef95e3a54d84a49db9d7aa50d955', 'c5aa1013e13f43c39e10500b570b0712', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4022a7547709437cb1b56a843b647522', '96e79218965eb72c92a549dd5a330112', '73921e1cb76a42a5950bf9fbe5e63631', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('417035751e38419a93d79cfd9eef99d6', '96e79218965eb72c92a549dd5a330112', '7d8994a0f4ed49c1b7417fa32a344965', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('42881bf5944d4829bf11a9b06ed6a71e', '7f87ef95e3a54d84a49db9d7aa50d955', '584850923b0a4dd38699a35881f65edf', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4301702b7e764360864a2bf01dfa864f', '7f87ef95e3a54d84a49db9d7aa50d955', '668c243fc70e4521a6680cfbc3755308', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('43448c80b5d943b5b7904f3c2b92317d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '146c450aa1af43049bf1c49a70e4d7e2', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('436ea82ae52d4d82aac78b51489250f6', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f5f36e98d39f4ed994aba6aad285e546', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('43fb2ec123a2454ab9fcfce615ba40ae', '7f87ef95e3a54d84a49db9d7aa50d955', 'cad7323d2239497083dd9cf736e60812', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('450edf7d64064987a1df3652fb21e326', '96e79218965eb72c92a549dd5a330112', 'f858e867571d4362a7ce8cf0f9f99a30', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('45396066d93d48898efc569c52f42509', '96e79218965eb72c92a549dd5a330112', '2230a6c6afca4654994f07ac6b78410b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('45d141edc1284cc8b3b56bc690f8a507', '96e79218965eb72c92a549dd5a330112', '019cef7053804692b7afa8f1b640e0c3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('45df5e517ce849a8be60216aabd2ac5c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2116f77edea649409ebb9115ffe0cce3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('46f525ed22b24d3088e4b868d7e91693', '96e79218965eb72c92a549dd5a330112', '7a7af402ec5c4c79bd3c66e21e98ed4f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('47290e3964c643f894e13357e4ecbfd7', '7f87ef95e3a54d84a49db9d7aa50d955', '65ea1ab75a754abda5762b0d78cc1a04', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('4796623f3aac49c48791775125ff1c3c', '96e79218965eb72c92a549dd5a330112', 'c99209d4198b4ec2b0fbca5d19c539e0', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('486336ff453b428997061298f236a16a', '7f87ef95e3a54d84a49db9d7aa50d955', '290e73b194ef48cab5efd7da24b09ae6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('48fb9901da9f482c87c2d16ada40e459', '96e79218965eb72c92a549dd5a330112', 'ded39ed0aa954c34ba3a3390921e6e71', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('497bc7eff45e4da499ccff4a09bc8fda', '96e79218965eb72c92a549dd5a330112', '90c762f6a54446638fdda94dc956608c', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('49a25fb2f87546369edc8bbc2a1a9525', '96e79218965eb72c92a549dd5a330112', 'fd0fb7f119ba4ba2acadc05bba460085', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('4a053de7532e4f1a85bf0113d73ed8d2', '7f87ef95e3a54d84a49db9d7aa50d955', '592be2e1ae824addb577876000710fe9', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4a09ba23080f442ebfbc43ae8af78ebd', '7f87ef95e3a54d84a49db9d7aa50d955', 'e7d1d101421040d0869332929fa30f3b', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4b64919ce54940b5a7788409f7922407', '96e79218965eb72c92a549dd5a330112', '59e7f5c6a15442fba4be4fdde6091941', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('4be3eaa2489b4312a27dacffded6963f', '7f87ef95e3a54d84a49db9d7aa50d955', '99a5b745c5e54c28846c9fd8408281e4', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4be605937fd848978789ff6b573f2a5e', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f59cd8a2f8cb4e46a6f6d28258e81d81', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('4c800c9f17a3479f8d035f1d17a6aacd', '96e79218965eb72c92a549dd5a330112', 'e6db9f5c6adf450685f95beedf3b2638', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('4d985a6b212a4ae88f2fbb4baaaaabed', '96e79218965eb72c92a549dd5a330112', 'df14d80db30f493faac3ebbb94a324a5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('4e3e157c84d24869b5c706c7d5c59ab8', '96e79218965eb72c92a549dd5a330112', '9b49cbc15c37404ebd87e94ea9954ff3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('4ef460354d6a4d9fbf475ed4ad341ff6', '7f87ef95e3a54d84a49db9d7aa50d955', '73188b0e02c24d3a91ecb4704f34666f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('4f856ca561ed40efa7046a013f3a0940', '7f87ef95e3a54d84a49db9d7aa50d955', 'b5615bc11ab2499b8ce57e0fd2d18567', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('502ac0dc47684c118816a6da49b475a3', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'd4176bd74fd94bf090c0d655808713ca', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5051bce70a7141bc839f2e567e6f15d4', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b654e741c6464ab490e4770713d498f8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('518a1bb9c87b40ee820e087c925f748a', '96e79218965eb72c92a549dd5a330112', 'c053e2d88d704c7db76cd2c237594015', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('51eae0c88e39427d8cac072e873999c8', '96e79218965eb72c92a549dd5a330112', '0b607f0bd899422cb9c71402849bc5a7', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('52307364aacb4588889d265a97f857b0', '67f5b7d9e5c146f1b4e8dd953951ab7b', '76056d119b324fb39b5b5012022369d4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('52b7cbf2f52c4428a2ed571ca99f42dd', '96e79218965eb72c92a549dd5a330112', '6b20b8d4b65645e4883fd8250536cef5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('52c0de947ad94e9bb7d8a11d7d521d6d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '92d21791f4484208ad87b40edfef4e36', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('53158794849a4fd2bd5e57d8cc637a2d', '7f87ef95e3a54d84a49db9d7aa50d955', '88e56a54cb784488a0736c3399892e66', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('531b128ca3f04d05bc4a3c0ed66a13a2', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'eb0286a8954f45d58350266ee579e18c', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5355d748886f473fbbd7bf8e20afd523', '96e79218965eb72c92a549dd5a330112', 'b649c429bc174f9da16a3310420aee9e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('53738869c3914d4192583b7e0dec93c9', '7f87ef95e3a54d84a49db9d7aa50d955', 'd78e99400c574617b2225fdc27d99826', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('538c3931969b4016a383491aaaa02c0f', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b649c429bc174f9da16a3310420aee9e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('539153254f0a4a218723703c7184e101', '7f87ef95e3a54d84a49db9d7aa50d955', '7d8348aca58248eb8b35016a95d0bdfa', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('53fa55e6fee6481f9addba3c340805fe', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'fd0fb7f119ba4ba2acadc05bba460085', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('546c9af43f18452a831babef921a4c24', '7f87ef95e3a54d84a49db9d7aa50d955', '8ad6c1aac1c7400293885680e354cc71', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('551234cf92a24e50b349f8db440e8f9c', '7f87ef95e3a54d84a49db9d7aa50d955', 'eca1906e31f64b069000f39afa4d02aa', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('559159f66611424c96e64d38f5da1ba4', '67f5b7d9e5c146f1b4e8dd953951ab7b', '59e7f5c6a15442fba4be4fdde6091941', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5592f9e4565543c59a76dc53adf6f337', '96e79218965eb72c92a549dd5a330112', '20877f40c3ee4c0c9d36c011fe75b370', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('569f8f735fd1443e92f8902e9acbcdcb', '7f87ef95e3a54d84a49db9d7aa50d955', '35cdcb0fb8bc4054a69dc8274ba676c1', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('56e3a6ced4ef4897b5321a474b2010e7', '7f87ef95e3a54d84a49db9d7aa50d955', '2ed3b43b8f3849fc8a6bc656c48a8fe6', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('56e79e1c66574432901f88b121c70d6b', '7f87ef95e3a54d84a49db9d7aa50d955', '66b294bfdc3248b4806c1ab5223d7ce4', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('56eb229cf78a410dbfd2dc6c7b52b265', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5a46cbc4999b4c24a8fb4f92f9b05ef0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('573f97463ece4b3ab733c389c276108d', '7f87ef95e3a54d84a49db9d7aa50d955', '8eee0efdcc514603a57afe63b8021b7a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('5781d62d52544743ae97d84f16c012a1', '96e79218965eb72c92a549dd5a330112', 'fc6279ad0747496390a56b75bfb71fb4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('585f6c3d75db4b9b9eb62691ca7fd300', '96e79218965eb72c92a549dd5a330112', '5a46cbc4999b4c24a8fb4f92f9b05ef0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('59e294c498354b63b7fd59f3edbca6a4', '96e79218965eb72c92a549dd5a330112', '35cdcb0fb8bc4054a69dc8274ba676c1', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5a21744882d54eab89e439feec22c281', '96e79218965eb72c92a549dd5a330112', 'eb6a3dda3bed47d4849401b7e2e36561', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5a6b12af88df40a3879c660d79b4fa73', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1cf77e815d0343c19770ab7e74e1f685', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5a749e4cfee24883b14de64e98293085', '96e79218965eb72c92a549dd5a330112', 'edf60ffbf35a48a395212f8db3426bbb', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5ad9fba61877446a9b8f16b29396e815', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'abd21b4e9bd1493d80e945e90da55193', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5ae8c66d57364b2482076aff319647d9', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c5aa1013e13f43c39e10500b570b0712', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5aeefbaf15f34a80b60846db19cfbc69', '7f87ef95e3a54d84a49db9d7aa50d955', '5140a1f4aef746aa8acae143ee843fc3', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('5b1224cd5f634e02b205e7bde14ed980', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'fe1aedc722d744b6a61547874f6f6e28', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5b233c68cfd34c8d8711fa8d0f932256', '96e79218965eb72c92a549dd5a330112', '427bb773efce4ac2b1f9c70ef25496f1', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5b5c076c21f448d1b340588e7a698d2b', '96e79218965eb72c92a549dd5a330112', 'b654e741c6464ab490e4770713d498f8', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5bce475a73904b9da2b7ba265d4bbb7c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '584850923b0a4dd38699a35881f65edf', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5d9065e57d94404a867265bb16f23b46', '7f87ef95e3a54d84a49db9d7aa50d955', '57a9a3175c4c41dc919643ccfc2c6aa0', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('5dac3bba0c754eecb3baba609619faff', '96e79218965eb72c92a549dd5a330112', 'aec1c0173174434f918a56492418b765', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5dc69246cda74f7d8914bbdda3527eba', '7f87ef95e3a54d84a49db9d7aa50d955', '44d73f216e8b4a1ba5445fe78bb276d0', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('5e805664c7ce49cb89c78371e67f1bfa', '7f87ef95e3a54d84a49db9d7aa50d955', 'f2d08c5a1f984ac5b0d47914261b22b6', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('5efca1b80b3942f89d237892a7cc6505', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8e37f608915046049285d1be93285139', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('5f71780d8ff5437fb51bb66cc2099ca4', '96e79218965eb72c92a549dd5a330112', '67162de2888a44a6935c78cd8da17348', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5fa82e8c3f2e48cc819aabb01f299fa9', '96e79218965eb72c92a549dd5a330112', '66b294bfdc3248b4806c1ab5223d7ce4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('5fc0f50473054010854df13c65b5c4a8', '96e79218965eb72c92a549dd5a330112', 'b4262a0492a04e25a41ec2166b3a0982', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('600d5ca10ec04a2a8c78d656d9c7d854', '96e79218965eb72c92a549dd5a330112', '3bee2c779b2c40d6885a9d7464fc3c8e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6064bcf6ad694a6c9a4aaf51a20d3137', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8b4e80d580c74cc680bda09aacdd6e37', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('60e5307d071e46bca55de1d584c4aa17', '96e79218965eb72c92a549dd5a330112', '3178372731be480b940837642ee0a10f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('61613390cff74bbeb3cb21d4e6e6cbb7', '96e79218965eb72c92a549dd5a330112', 'b33b20c8f48a4ec78c328ceefdcbc2da', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('61710afed97e4a6abe3de0572ab06eac', '7f87ef95e3a54d84a49db9d7aa50d955', 'c7aba3c15b6c4558aa6872522a706126', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('6176f98bc9ba4a17b6abe3a242858079', '7f87ef95e3a54d84a49db9d7aa50d955', '5ab34adcc9d94d0eab2acb4b8a354404', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('61f95b0c2f6044339efbd98e423f34b7', '7f87ef95e3a54d84a49db9d7aa50d955', '4fef1dccea884633bf63f3ee289eec63', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('6219cc99184748169d28e0e1fae5ec42', '67f5b7d9e5c146f1b4e8dd953951ab7b', '9b49cbc15c37404ebd87e94ea9954ff3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('631eace9964542f8ba7808331230db27', '96e79218965eb72c92a549dd5a330112', 'daf9b8d9283a40fbaa877d5b33689208', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('636be831826844e6a7e1556f398ea5b0', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a053e823132940338b5322cfb648dd99', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('637b2920008e44a4bd58655ca2fe675f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7c7e80234be244e78ba9ac6ee40d690d', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('63854967e79048bfabe9ea0f62fa856d', '96e79218965eb72c92a549dd5a330112', '081f2ee65f774472ac748357168ac694', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('638cd50823d54491b7a6760fcaea06bd', '96e79218965eb72c92a549dd5a330112', '4fef1dccea884633bf63f3ee289eec63', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('64340ee500b24c0496deae7d35ad253c', '7f87ef95e3a54d84a49db9d7aa50d955', '5a46cbc4999b4c24a8fb4f92f9b05ef0', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('6468fc4a0eb9406980d7a631799ad87d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '21b6e4d1ea624bd98d6e2bf736ceba11', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('64c8285c13564f45a35d01d84261d62c', '7f87ef95e3a54d84a49db9d7aa50d955', '7c7e80234be244e78ba9ac6ee40d690d', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('64e61f2b6bfb4405853c026cd5b0644b', '7f87ef95e3a54d84a49db9d7aa50d955', '1f745c26cbdd403887e16c4f4c067dad', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('652cbc49e7eb4860ad27f7a2fe346965', '96e79218965eb72c92a549dd5a330112', '21b6e4d1ea624bd98d6e2bf736ceba11', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('658b8fb75b0e406b9feacd2ead38132e', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'fd125b21648b4d4f9aaf462ed6548c10', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6631ad989662491481fb0cd10f2703a3', '96e79218965eb72c92a549dd5a330112', '8ad6c1aac1c7400293885680e354cc71', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('66b6e43232184bb28da413883af8f4c9', '67f5b7d9e5c146f1b4e8dd953951ab7b', '609644d6ed55415e91a9dce3587739d6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('66ca882149de44848425303039ba95b5', '96e79218965eb72c92a549dd5a330112', 'a2d941f02ebe44fe96dd4f31ff4e5607', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('67018f9f7858412d93dedb1df1c657b6', '7f87ef95e3a54d84a49db9d7aa50d955', 'fd125b21648b4d4f9aaf462ed6548c10', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('6770654d23264aa192a735f231903799', '96e79218965eb72c92a549dd5a330112', '39cfb69ec8bb496cbc4541f7a2394650', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('67d860ea7cff4277b0923559a7c315d6', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c6a2b1473e694e9995f655a45c81db95', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6919f1b406a548bdb6d693b1cddd9494', '96e79218965eb72c92a549dd5a330112', 'cb0069a7ce8648f5b215059b8b08e302', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('694b849591a94b21a7eef6162aa4f85f', '96e79218965eb72c92a549dd5a330112', '5140a1f4aef746aa8acae143ee843fc3', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('69671326e25c47a8b55d64654224e548', '96e79218965eb72c92a549dd5a330112', '5ee48d30d72f49d0b09a9ddbe8005fc2', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6a5d623edc834ebfb1451a457be5d7df', '7f87ef95e3a54d84a49db9d7aa50d955', '49850bd75a634fbea8b70b51c0f2209b', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('6a94bd4c20be4d66beb6b45556bc0037', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8c5a7183242e497ea0da0b4dbce82efe', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6ab2e6516c5f4fe49eae1135eeb63fdb', '96e79218965eb72c92a549dd5a330112', '2c59e48825d2462aa8260366574e5051', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6c0b5b8569904a4ca0a94cef6902678e', '7f87ef95e3a54d84a49db9d7aa50d955', '433e2aec2d0449da9d9ffe524c633430', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('6c4d089671c9451dbf224ce923574c11', '96e79218965eb72c92a549dd5a330112', '668c243fc70e4521a6680cfbc3755308', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6c980d96fae94ae696c8525eca5a2d08', '7f87ef95e3a54d84a49db9d7aa50d955', '2f65e7aa17b14cca8faf26fceabf72ca', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('6c9ecaba1aab44bda270126b03ed8b9e', '96e79218965eb72c92a549dd5a330112', '6294cb7477ce45d59e4b8660070bb283', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6d2a6edf475b43319afc312cb2e941a7', '96e79218965eb72c92a549dd5a330112', '0f670e0df0c54fd6aa8d6da271f2e721', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6deb28fec93a439eb73911f31fab1844', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7a7af402ec5c4c79bd3c66e21e98ed4f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6e2136d81bec4985a84e4a536bed0879', '7f87ef95e3a54d84a49db9d7aa50d955', '806e81946d754f0db4ad1da6f0bc9c1b', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('6ede025a541243759541d91fd20c05ab', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'vvvcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6f051c7be85a47debddd9f9fbbb53396', '67f5b7d9e5c146f1b4e8dd953951ab7b', '44d73f216e8b4a1ba5445fe78bb276d0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('6f6ea2c9032f44438711896bc934aa96', '96e79218965eb72c92a549dd5a330112', 'de777baf76104fd5acb0172c1778ba3b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6f98dc40fa654edfb7261691dff1d9cc', '7f87ef95e3a54d84a49db9d7aa50d955', '7ad89be678bd41d98046707e008e5ce0', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('6fc2f71819e844788caa33c85e94090f', '96e79218965eb72c92a549dd5a330112', '7c7e80234be244e78ba9ac6ee40d690d', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('6fc6ec571e78417a8247b364deaff5fd', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c960d0472a2a4f4f9fa1ad46952200db', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7015d16250824200b6946727de4a8d13', '67f5b7d9e5c146f1b4e8dd953951ab7b', '299153ae2c1b40e48c7faa3654143778', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('701b3c878acb41949a2635870b7f0878', '7f87ef95e3a54d84a49db9d7aa50d955', '30ff40f709da4e1986d6fdad8ee89d2f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('701f190c347f481692e8b2b7d577172a', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c6975dc898314ab29c844c3496d4e0fa', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7116bb68c9b941638683fdfcbc94c61e', '7f87ef95e3a54d84a49db9d7aa50d955', '67f32efc79424e09898df7b9a9bfb08e', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('71621f3818af4412ba30b60289de65c6', '96e79218965eb72c92a549dd5a330112', 'fd125b21648b4d4f9aaf462ed6548c10', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('71edcdbc1f3a4e558412dd6322f6c44b', '96e79218965eb72c92a549dd5a330112', '6df7e2e05bba4bbc9b44c71f5e39f15d', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7333eb70845340b78365fcaac29900f9', '7f87ef95e3a54d84a49db9d7aa50d955', 'd0f756b7203c484482bdf22034545833', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('73b79f3bf5a2428b9bc5012fdcbee662', '7f87ef95e3a54d84a49db9d7aa50d955', '4bdc1a6195784a6bb61868be97e35a60', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('73f57f6401474130b73ace0215396649', '67f5b7d9e5c146f1b4e8dd953951ab7b', '199eb048688d44bfad191b9bc87b289a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('73fe7a4ecce640fdad04525540107a14', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b5c958a23fef4405a44a47d72dc8788d', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('748e4a64e7af4ef8b4d29a7811354622', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'e6db9f5c6adf450685f95beedf3b2638', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('753ea14050cc4b9dbef059955879b03d', '96e79218965eb72c92a549dd5a330112', '99a5b745c5e54c28846c9fd8408281e4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('75874f1144464bc0865ec39b46205ce5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '20877f40c3ee4c0c9d36c011fe75b370', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('75e457245b8e4ec0b783a22ec0b08f91', '67f5b7d9e5c146f1b4e8dd953951ab7b', '57a9a3175c4c41dc919643ccfc2c6aa0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('75ee7dea0799459689b6691f52f8af3a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '91a40e4b6d434d6aa2e9ae2a15a3fb26', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7619341843e54963a5ef8ca245e2c928', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a139f08792374b3fa9b1e3a3c7409c63', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('762d86f81b6740f8bb4048fa93094d92', '7f87ef95e3a54d84a49db9d7aa50d955', '4f844777e3264597a7df0214b3416589', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('76331f04eb154708b466e0ce3b47e411', '67f5b7d9e5c146f1b4e8dd953951ab7b', '093cc6a328bd4604a477a8a4e18de4dc', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7696e9b4f2b24bf3891a6cdf9b9e3c7c', '96e79218965eb72c92a549dd5a330112', 'd78e99400c574617b2225fdc27d99826', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7741f023a6fb432dacc7f0dee8ef0b1b', '67f5b7d9e5c146f1b4e8dd953951ab7b', '804890264b384bfba8bc726f7da976e8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('77cbb8a54b5947b1a80b8b80523070f6', '67f5b7d9e5c146f1b4e8dd953951ab7b', '081f2ee65f774472ac748357168ac694', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('77ea9ae9bc6342619204c1663fadb4b8', '7f87ef95e3a54d84a49db9d7aa50d955', '13668fcf83c84fe1b0624bded1851891', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('7821e01c1c724b42810aba0e8bf5837d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '776c5428bf104b2dbdb2c280c086a033', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('788d300ea718453ba6d57d3a89455e27', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5140a1f4aef746aa8acae143ee843fc3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('78a609af4a844222972b345f44ecae86', '96e79218965eb72c92a549dd5a330112', '6d5f05ed557d4709a5f0373733b51eb5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('78b55218184145128cb3e568e7a85d66', '67f5b7d9e5c146f1b4e8dd953951ab7b', '0b607f0bd899422cb9c71402849bc5a7', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7905bc270a7c432a8d87c1d51657b9cb', '96e79218965eb72c92a549dd5a330112', '24febc42318e48be9104ec33241ad7bd', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7a6a3cef55474b6895b2c7ec1e036cb4', '96e79218965eb72c92a549dd5a330112', 'aba639f23a9246199f5314d143756a15', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7abf85a857cf42efbbf0b44674cf7177', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a3109cf32fd84394af4033d5c5be4183', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7b11b78807594871933b1ee7d58f61e0', '7f87ef95e3a54d84a49db9d7aa50d955', '2d0f1cc2931c40a086e701de417e61f9', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('7b721268eeb14e929f457749b317e7a0', '7f87ef95e3a54d84a49db9d7aa50d955', '093cc6a328bd4604a477a8a4e18de4dc', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('7b735d90cd8e4c38b715e0358fae1c67', '96e79218965eb72c92a549dd5a330112', 'b855a1a246d44c7ea9fc314d07da88a9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7be21255010d47f5a427086f2b0e7416', '7f87ef95e3a54d84a49db9d7aa50d955', '776c5428bf104b2dbdb2c280c086a033', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('7ca82b538f9342b6a27513633d5a7523', '96e79218965eb72c92a549dd5a330112', 'b14984e201224f40bc21657155fef884', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7d318c4520674a8cb3141b4a35d73300', '7f87ef95e3a54d84a49db9d7aa50d955', '24febc42318e48be9104ec33241ad7bd', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('7db64ab9496c4bf789c2fe6909a34ff9', '96e79218965eb72c92a549dd5a330112', 'bb20fb8537e543b49bb0f807aed245ef', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('7f1840cede4149019e11d8032ddccda1', '67f5b7d9e5c146f1b4e8dd953951ab7b', '39cfb69ec8bb496cbc4541f7a2394650', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7fb816c12a06487d8800dc2c89f984f0', '67f5b7d9e5c146f1b4e8dd953951ab7b', '806e81946d754f0db4ad1da6f0bc9c1b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('7fdd5f31b0b84f379ac6e645a3882376', '96e79218965eb72c92a549dd5a330112', 'a3109cf32fd84394af4033d5c5be4183', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('80344b0ab59c4bf79469519b985877b9', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8ad6c1aac1c7400293885680e354cc71', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('815d9ad83b5d40b9a240f278068dd589', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5824da6688fa40e080396454a84e8e73', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('81a75a4742ad4f69aff8114d66d1ac43', '7f87ef95e3a54d84a49db9d7aa50d955', 'b2f44efb4aba4127ba22abd95b933d6f', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('81d3ca469c9e412096c1adf3bc2b633e', '7f87ef95e3a54d84a49db9d7aa50d955', '67162de2888a44a6935c78cd8da17348', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('8220bf22d5e94cef8bc2e0ef5cad87fb', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'be1c771cbcdf4daeb670e4784afb017d', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('82225040cdd9401885ed0137b82c4599', '96e79218965eb72c92a549dd5a330112', '57d038ffddfc43429cb47886a784da7a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8254c04397034162a10e3dd21e48ac99', '67f5b7d9e5c146f1b4e8dd953951ab7b', '67162de2888a44a6935c78cd8da17348', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('82799882702b44f2a401be971b28aa96', '96e79218965eb72c92a549dd5a330112', 'cfe6007c56bf4328aede239e8aca161e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('827e311f89114db8be160b552b79b8cb', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'd012d8909ac345e19faee0c83d604aff', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('84b91a49bb3645dd938c1d303717785c', '96e79218965eb72c92a549dd5a330112', 'b658234af3f549f38c6a982788230cc4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('852e508fd4044e1f9c7fcb3cddafaac2', '96e79218965eb72c92a549dd5a330112', '1d9384d3bdd14586aaac073150b3b2ec', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8539eb6dc17b4502bea847fdab245d99', '96e79218965eb72c92a549dd5a330112', 'c6975dc898314ab29c844c3496d4e0fa', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8580008197b74e37b671d3f94616f02e', '7f87ef95e3a54d84a49db9d7aa50d955', '9b62d01cde824c1e91ea50d43d6c0886', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('85ff3d7e11b949928d8450ac81dfc869', '7f87ef95e3a54d84a49db9d7aa50d955', 'f6c9d786132a4e429414f5a0dd7d2dbb', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('867d83ee64dc4a67ad2c92a85ae81e2b', '96e79218965eb72c92a549dd5a330112', '8695e62810534a299367d87600194478', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('869616a6d12844fd83cb8208d10213ec', '67f5b7d9e5c146f1b4e8dd953951ab7b', '35443649b2d94d21bc0c52a608feb38a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('878e99313fd1475287629daebc8853c1', '96e79218965eb72c92a549dd5a330112', '3770269cb7c84a9caa7f08e2b48ad553', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('87d34dba05074f079427f34916c5b16c', '7f87ef95e3a54d84a49db9d7aa50d955', '705f2cecd5c44ce491df6086c60532fa', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('87d928a312a14e64a9274cecbe9af6cb', '7f87ef95e3a54d84a49db9d7aa50d955', '804890264b384bfba8bc726f7da976e8', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('884d031115b941d082e599660c74c32c', '96e79218965eb72c92a549dd5a330112', '705f2cecd5c44ce491df6086c60532fa', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('887ced95cd7e404da1e6391b66788ad5', '7f87ef95e3a54d84a49db9d7aa50d955', '8b4e80d580c74cc680bda09aacdd6e37', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('891810cb80dc4b43a4f233929209b8e1', '7f87ef95e3a54d84a49db9d7aa50d955', '220b143b708c469f97eef74153f54377', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('893bdd54f1944f67a545c8afcf09beb0', '7f87ef95e3a54d84a49db9d7aa50d955', 'b658234af3f549f38c6a982788230cc4', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('8b22a061f6cb4b3abc7db60695d38523', '7f87ef95e3a54d84a49db9d7aa50d955', '3483daed9ac34dbc88dd2623510352e5', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('8ba9f229b0dc4a6dae304d3cdf749508', '7f87ef95e3a54d84a49db9d7aa50d955', 'bb20fb8537e543b49bb0f807aed245ef', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('8bf46a9c634145b991b7521b9dde17ed', '67f5b7d9e5c146f1b4e8dd953951ab7b', '713dbe2e7ebf4f79b6081ee5e624f4e0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8bf9e6a450804c85b0447d80bfa668d4', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'cfe6007c56bf4328aede239e8aca161e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8d8b2ba1eee741348c84abcfdaff2023', '7f87ef95e3a54d84a49db9d7aa50d955', '0f670e0df0c54fd6aa8d6da271f2e721', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('8dc2b804fd7b4444832a77921db71d20', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c34053e9609f4417adcb256aaa5796b6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8dfd67ba68fb4944963a528a23e47988', '7f87ef95e3a54d84a49db9d7aa50d955', 'd4176bd74fd94bf090c0d655808713ca', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('8dffd076373b4c9dac09604a5d99bdd0', '67f5b7d9e5c146f1b4e8dd953951ab7b', '705f2cecd5c44ce491df6086c60532fa', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8e45b82d6d024f4da447c0d027398d5a', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'd78e99400c574617b2225fdc27d99826', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8e52cc5ebfbf421c924224bd51e8c433', '96e79218965eb72c92a549dd5a330112', '960b9b299de748d4b21d7e65744b1947', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8e6f03c669684ac891a6cf4c33088d55', '7f87ef95e3a54d84a49db9d7aa50d955', '1e946136850844d2a42ae4de95a73a10', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('8e898f6a953d49728e4d449c1a5e50d8', '96e79218965eb72c92a549dd5a330112', 'cdd4319d2e614b7987149c930c24c404', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8efff1905c7d437e9cdff446eb53c2c6', '67f5b7d9e5c146f1b4e8dd953951ab7b', '638e4bc12d844d02b9a134406ffe1cc1', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8f31b67349a045f2a1a4f7ffc90b665d', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'bb20fb8537e543b49bb0f807aed245ef', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('8f790786f6ab4377b8504c5b6c6a5967', '96e79218965eb72c92a549dd5a330112', '299153ae2c1b40e48c7faa3654143778', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('8f8c77f04db74642a63679d2619361b6', '7f87ef95e3a54d84a49db9d7aa50d955', 'aebd7327dab2429284c5e44138fb4e66', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('901dac885bc14732988cd46c15cea813', '96e79218965eb72c92a549dd5a330112', 'ec73b730cee94a9b9aa63173db0868a5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('905c398b227c4022af7854855aa55a95', '96e79218965eb72c92a549dd5a330112', '05e7c020477b4bd4a1b817e3f49c6974', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('90743b948d9f4158826f912a22e4510d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8ca577450d2d4681a941fcde721f0910', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('90d5ed127b48471ba47af6c6eb88bbbc', '67f5b7d9e5c146f1b4e8dd953951ab7b', '73188b0e02c24d3a91ecb4704f34666f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('90fcfbf958fa43b1928b2a94d71c2459', '7f87ef95e3a54d84a49db9d7aa50d955', '92d21791f4484208ad87b40edfef4e36', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('910eb28c36f7451a92b84594d17440d1', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5acf5ac873674e7582946fdb896b35a4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9120ebcdf8514b47a6b13a29d089b13e', '96e79218965eb72c92a549dd5a330112', '6548698683f94f4fbbf007415d176ff5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('91264786292b4717a33419a77ab20611', '7f87ef95e3a54d84a49db9d7aa50d955', '199eb048688d44bfad191b9bc87b289a', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('9237dd7edf4e462ea49ba5cab8f937e9', '7f87ef95e3a54d84a49db9d7aa50d955', '4312de8ba0ee4dec86d5f45e924ad413', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('926d473b636a41bb931d9d83c9d87569', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'e4f9b25bb29b41629a384254f70b913c', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('92a633a751da4a5ba55ee22262f34de2', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7265a905072f437b9161bf49bc539620', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9314178d68914784a984198ad9f221ab', '7f87ef95e3a54d84a49db9d7aa50d955', '6d5f05ed557d4709a5f0373733b51eb5', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('93a889f3d7f44e62b005dd2e6f6b47ae', '96e79218965eb72c92a549dd5a330112', '7dda4d9acea54dbcbed13751de3b1b3f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('93e4ebad779a4e1aa99830f50f0eec78', '96e79218965eb72c92a549dd5a330112', 'a63dae29597d472fbfa1c8cf1dc3cd38', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9400b2ff56224774befee3c5e00a1383', '67f5b7d9e5c146f1b4e8dd953951ab7b', '49850bd75a634fbea8b70b51c0f2209b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9415ff6058914fe4a59ce87f4c5cfeb4', '96e79218965eb72c92a549dd5a330112', '5238d64cf76b4ef7aa0cf0241197745f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('94217dbfc7ee4e49b24f42355f8b258a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7d8348aca58248eb8b35016a95d0bdfa', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('947ec2d524464ca19a60642859b4dd1a', '7f87ef95e3a54d84a49db9d7aa50d955', 'd302525cb21e42cebfdc889eb83cb119', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('94d927a8f59e46b795c2188fa11172ce', '96e79218965eb72c92a549dd5a330112', '713dbe2e7ebf4f79b6081ee5e624f4e0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('94e51bb7358d4f66b023d438030b3e3f', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'e7d1d101421040d0869332929fa30f3b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('95219a3523e844a68f6d6a015b8594d6', '96e79218965eb72c92a549dd5a330112', '4463c3e9ab904c41b962f113948d9118', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('956158bea6ab4b5b9595da4072f022fe', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6e0683beb8814ce4a59c0cd7faf85bac', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('95f29eeac8ac4c68ada7db834d764963', '7f87ef95e3a54d84a49db9d7aa50d955', 'c6975dc898314ab29c844c3496d4e0fa', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('961cf1b06ce64ba28d7239cfb0419c38', '96e79218965eb72c92a549dd5a330112', '482f0e93d4344e3083fc274a17f91d13', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9628d036436648dbbb2df0ee8fb819c2', '96e79218965eb72c92a549dd5a330112', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('963a6a04b4b2454ab4e7dd4f3e92be03', '7f87ef95e3a54d84a49db9d7aa50d955', '57d038ffddfc43429cb47886a784da7a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('964453872e7147debfd33916d7459d29', '7f87ef95e3a54d84a49db9d7aa50d955', 'b07fc05241a34951961bb134e59d3d5e', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('966c0d4859564388b6fc52fb08d9cfe9', '7f87ef95e3a54d84a49db9d7aa50d955', '482f0e93d4344e3083fc274a17f91d13', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('967bf5ad2e354cfc9029bfd51198fab3', '7f87ef95e3a54d84a49db9d7aa50d955', '65c9550aee3949ea8b478ac595ffd2c9', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('96e753a9e8c547b09f185019e92513f1', '96e79218965eb72c92a549dd5a330112', 'f59cd8a2f8cb4e46a6f6d28258e81d81', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('970507e5257043f3a39464aa80a1565d', '7f87ef95e3a54d84a49db9d7aa50d955', '8c5a7183242e497ea0da0b4dbce82efe', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('976d44113fe74dbe9635daa69fc565e7', '67f5b7d9e5c146f1b4e8dd953951ab7b', '392ce8e4bca243208ac9a5b14b3854ff', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('97d7375472894b71a66eda9aa8d4660d', '7f87ef95e3a54d84a49db9d7aa50d955', '9b49cbc15c37404ebd87e94ea9954ff3', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('97e9ad1fc17b465183e13b3727f35d45', '7f87ef95e3a54d84a49db9d7aa50d955', 'b654e741c6464ab490e4770713d498f8', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('9909bbbed6d743e7a46fd5a10b2b160a', '96e79218965eb72c92a549dd5a330112', '5ef049f4566c472486ed45b350c6622a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('992f7f65560c4431b67c482019044ca2', '96e79218965eb72c92a549dd5a330112', '1cf77e815d0343c19770ab7e74e1f685', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('997240e1b847448d90d92f89c5a1b6f1', '67f5b7d9e5c146f1b4e8dd953951ab7b', '0f670e0df0c54fd6aa8d6da271f2e721', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('99d56d1ed266415491fed347f4f4257a', '7f87ef95e3a54d84a49db9d7aa50d955', '2d2cc9ed925047ba80a5d64881dcbbb2', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('99e8214d232c440ea7de413335b77823', '67f5b7d9e5c146f1b4e8dd953951ab7b', '66b294bfdc3248b4806c1ab5223d7ce4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9a108aa9aea349b29ba4970d2d0b360c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '73921e1cb76a42a5950bf9fbe5e63631', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9a11320e53f74678bf1aaaaea669620c', '96e79218965eb72c92a549dd5a330112', '2c1d6fd25d8049a5b6d4faa8a51ecff2', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9a24c54e06b944ea8a8bdef2b2d17607', '7f87ef95e3a54d84a49db9d7aa50d955', '72872fb60c3444f8a70ba92e1a658e15', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('9a8aec8f78324517ac6841a1b48a8892', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'cdd4319d2e614b7987149c930c24c404', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9b1c2c738c97483dbd148a630aa8604a', '7f87ef95e3a54d84a49db9d7aa50d955', '3b9609cfaec34cd0a692c62f209faca1', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('9b6a5301970a40cbb20c4b2e1a00992c', '96e79218965eb72c92a549dd5a330112', '8ca577450d2d4681a941fcde721f0910', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9c3b3e478dae4d03baa2b03f223c1025', '96e79218965eb72c92a549dd5a330112', '13c35cd8177a41899d0525bd21e93dcd', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9d0ce5e63db74e1b8dcca2d8810bcd54', '96e79218965eb72c92a549dd5a330112', 'e10b02d3133e4c188aea200beb2d2214', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('9da40e17403543da9b8be898b15a25f2', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f2d08c5a1f984ac5b0d47914261b22b6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9e2a2092f5fb4760840ee45f9cf3ee37', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b855a1a246d44c7ea9fc314d07da88a9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9eb252fe08d44f95a1bdc08c39dcb7f7', '67f5b7d9e5c146f1b4e8dd953951ab7b', '03a853e928b0466791506b1aafdbc62c', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('9fd9d258768240ffbf1ee475ccd0b31d', '96e79218965eb72c92a549dd5a330112', '638e4bc12d844d02b9a134406ffe1cc1', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a040866af06d4c9884f34d071ad11e47', '7f87ef95e3a54d84a49db9d7aa50d955', '5824da6688fa40e080396454a84e8e73', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a05221d5c99942328443e31f6a4af4ee', '96e79218965eb72c92a549dd5a330112', '58198d91503c479f9b2f60e6fd244c9a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a0c2099884664c51bd7713a0bd494874', '96e79218965eb72c92a549dd5a330112', '5ab34adcc9d94d0eab2acb4b8a354404', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a0d6d21f2c2e4910a9f0195c63b7b19c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6df7e2e05bba4bbc9b44c71f5e39f15d', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a12a5695c97044ca8d0d8856715c5bfe', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6f14683521434f2db7d9e3a132e0958f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a17611fa9721480e8505bb7126eac917', '67f5b7d9e5c146f1b4e8dd953951ab7b', '48b68155a61f4fa8a9233239c0f4ca95', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a1ce3b7b0c3c40fc90aa3573688a2e6e', '67f5b7d9e5c146f1b4e8dd953951ab7b', '81acdb87688148529d91e2e572a36d9d', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a1d879ace8da41199ac74d0b0090dc5a', '96e79218965eb72c92a549dd5a330112', '2a9625d648e3444c9a2699b99da82080', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a345c4a1d96146f6b99c1e9b80b02418', '67f5b7d9e5c146f1b4e8dd953951ab7b', '72872fb60c3444f8a70ba92e1a658e15', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a3527878e0b8427db21307e651ce5187', '7f87ef95e3a54d84a49db9d7aa50d955', '667f67afcfab42bd861d332215a31c44', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a37b2de064934b94a32fee3ff554ff04', '7f87ef95e3a54d84a49db9d7aa50d955', '713dbe2e7ebf4f79b6081ee5e624f4e0', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a39c9f42631142e08e3e0a4cd7dbcfdf', '7f87ef95e3a54d84a49db9d7aa50d955', '02dac7f9bf6a40fc88086a676e7a34cc', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a3f34a834cc24cdfb2ed0317ed58bee1', '96e79218965eb72c92a549dd5a330112', '3483daed9ac34dbc88dd2623510352e5', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a453ba9307bd461dbcebfc30ac796ac8', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7ad89be678bd41d98046707e008e5ce0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a4fa6acba9d240d2b22e55ca6ac0e1bf', '96e79218965eb72c92a549dd5a330112', 'ed49d770e1574108b4f2b36efc9d81f6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a5bb5df5ca2c40168e925456fb685624', '96e79218965eb72c92a549dd5a330112', '02f29bab7e914f4dbc768b1661f5206e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a5ccf51b6086406994f461ea5390e437', '7f87ef95e3a54d84a49db9d7aa50d955', 'edf60ffbf35a48a395212f8db3426bbb', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('a646ce6bac824c35b9ec51877ca2621d', '7f87ef95e3a54d84a49db9d7aa50d955', '24f949ce4fe24d00bd3a4b990b853267', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a65fb000f0df47609f7a7f59b95994d5', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'daf9b8d9283a40fbaa877d5b33689208', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a67db6dc7bca46d19e9f30455117364c', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'de777baf76104fd5acb0172c1778ba3b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a6893d64b3604c9ab4a9f3fb1d3db118', '96e79218965eb72c92a549dd5a330112', '433e2aec2d0449da9d9ffe524c633430', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('a6b817aaa4a54deaa6db86597715b396', '7f87ef95e3a54d84a49db9d7aa50d955', '39cfb69ec8bb496cbc4541f7a2394650', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a7d1f581a4994d09a15feef9d6bf67ce', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2c1d6fd25d8049a5b6d4faa8a51ecff2', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a7f5816c696a4a72b041b9cbd453ac98', '7f87ef95e3a54d84a49db9d7aa50d955', '02f29bab7e914f4dbc768b1661f5206e', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('a80706531bc3447dbd9c62ebbb3afcaa', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4f844777e3264597a7df0214b3416589', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('a89a740776de4a2d8636ba60a69329f9', '7f87ef95e3a54d84a49db9d7aa50d955', '4e966416066e4ecaa853f10e8eb3ab54', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('a9c70d92e4424644935356ee36cf3b83', '7f87ef95e3a54d84a49db9d7aa50d955', 'c99209d4198b4ec2b0fbca5d19c539e0', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('aa535fe5428c40e58d851f7403f3009e', '96e79218965eb72c92a549dd5a330112', 'c1dcd06e3707485eb64f2fe0242e4bf3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('aa66123be8224794a4f26546f49d13b5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2a9625d648e3444c9a2699b99da82080', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('aacde965080744b98a196ceefcbd4608', '7f87ef95e3a54d84a49db9d7aa50d955', '3cb3a1b7be8f418285c495fd459b223f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('aae7448480b34605b314074739c527b6', '67f5b7d9e5c146f1b4e8dd953951ab7b', '960b9b299de748d4b21d7e65744b1947', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('aaf4491e94a0477ab891de357647a9d7', '7f87ef95e3a54d84a49db9d7aa50d955', '8a55c0ff234143bba52cb77a4b6f8ed8', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('ab0cb7238d7e4f3c8b7ecc5b46c85f4c', '96e79218965eb72c92a549dd5a330112', '4e966416066e4ecaa853f10e8eb3ab54', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ab58c8e052254d26a86b6c55e0b903bc', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1839f9f9e6db4f5098cd8617944ca2bb', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ab7c5a6bdca44ce8b9b58d1c268b2de1', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'bb66147d9c7e4eefa39884036e2b048b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ac03de6c2e2f4a87bcf9f0048c0b8e7b', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b2f44efb4aba4127ba22abd95b933d6f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ac6f18edde51471b8320aafb890974fe', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4c7acaa8fd1f40d2b807ef12940c08e6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ac71180568844b6aa3ec8d81f5e20a17', '7f87ef95e3a54d84a49db9d7aa50d955', '728e1a5d5eb04b56924a674e7b7e3a99', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('acaf9b220b0048529d27eb715fba4665', '67f5b7d9e5c146f1b4e8dd953951ab7b', '728e1a5d5eb04b56924a674e7b7e3a99', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ad626709010e43ccb751fdcac15426d4', '7f87ef95e3a54d84a49db9d7aa50d955', '4463c3e9ab904c41b962f113948d9118', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('aede873475b9406a82da934e8ec6dd2f', '96e79218965eb72c92a549dd5a330112', '67f32efc79424e09898df7b9a9bfb08e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('b0233cde19384bc49dcd6cb5fa69662f', '7f87ef95e3a54d84a49db9d7aa50d955', '5acf5ac873674e7582946fdb896b35a4', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b08ba1fd402c43368197b4ddf34aa855', '96e79218965eb72c92a549dd5a330112', '5b1bcdd5ba3740c58a48b3fbbc4a1897', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('b13c03570535416eb97c528f212f50dd', '7f87ef95e3a54d84a49db9d7aa50d955', '79da129b5ee644a8a767551a8948d0b8', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b1be39b7cc0848ecab208df8404f2794', '96e79218965eb72c92a549dd5a330112', '810bd29cea0a40d0b5e4f859a3504cba', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('b25f91e6c22948ddaca9f84aee0999b2', '7f87ef95e3a54d84a49db9d7aa50d955', '5b1bcdd5ba3740c58a48b3fbbc4a1897', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b2e52bc0d7a144ee9ccf186adc298618', '7f87ef95e3a54d84a49db9d7aa50d955', 'b5c958a23fef4405a44a47d72dc8788d', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b31259859df0429492979199313b9bca', '67f5b7d9e5c146f1b4e8dd953951ab7b', '290e73b194ef48cab5efd7da24b09ae6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b387f1ba1c3c49bb97c95024110efc0d', '96e79218965eb72c92a549dd5a330112', '220b143b708c469f97eef74153f54377', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('b4211aa1093d4e19b091a3cc19ea09ba', '7f87ef95e3a54d84a49db9d7aa50d955', 'aba639f23a9246199f5314d143756a15', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b497f88ccafa46da94eb6953286d20d3', '7f87ef95e3a54d84a49db9d7aa50d955', 'fd0fb7f119ba4ba2acadc05bba460085', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b49cf99bec8a48eba81073c1bf930864', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7dda4d9acea54dbcbed13751de3b1b3f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b52c1278e62349e6840f7388f8012991', '7f87ef95e3a54d84a49db9d7aa50d955', '2c59e48825d2462aa8260366574e5051', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('b65e8f265f784ffc87823d82ab25d166', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'd95788918d6142eaa5e0d99aee11759b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b67dbb696fda4727bf94b04dd0d3e11f', '7f87ef95e3a54d84a49db9d7aa50d955', 'be1c771cbcdf4daeb670e4784afb017d', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b6d6dcdfd5514eeaa7e373398dbaaba9', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'fc6279ad0747496390a56b75bfb71fb4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b6d8fd35c8e24313b7791665ccca155a', '7f87ef95e3a54d84a49db9d7aa50d955', '5ef049f4566c472486ed45b350c6622a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b6dc097620bc4dfba168a4ecd08e0c91', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'df14d80db30f493faac3ebbb94a324a5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b730a326ce26417c8e2bf7221dccff59', '7f87ef95e3a54d84a49db9d7aa50d955', '3d15ee020d1c4294a224cabcb123b5dc', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b86ff036058a46418260a170182d679b', '7f87ef95e3a54d84a49db9d7aa50d955', '1f2c7c5a251042c098612dba5d815d7a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b87ff0e8127e4c24aa81bc7372beb266', '96e79218965eb72c92a549dd5a330112', 'f6c9d786132a4e429414f5a0dd7d2dbb', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('b8f6d34ca7914e969de6928f071fafa3', '7f87ef95e3a54d84a49db9d7aa50d955', 'aec1c0173174434f918a56492418b765', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b93ecc3671d3499c8d3e1e03f030a021', '7f87ef95e3a54d84a49db9d7aa50d955', '21b6e4d1ea624bd98d6e2bf736ceba11', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('b94042f572ae4b858e1d77980977e1bd', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3483daed9ac34dbc88dd2623510352e5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b995bc801b3e4b2f86cf06f0c0886369', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2c59e48825d2462aa8260366574e5051', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('b9e077a933e642d68c4fb11a0840d58d', '96e79218965eb72c92a549dd5a330112', '79da129b5ee644a8a767551a8948d0b8', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ba7da42a80274033a0d685dc7148302e', '67f5b7d9e5c146f1b4e8dd953951ab7b', '417410b80f064ca1b5a545c72d440bf6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('bad179e48688474089fd47461449ac8f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '57d038ffddfc43429cb47886a784da7a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('baecd8e58d9048ec98cefae943aee054', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b5615bc11ab2499b8ce57e0fd2d18567', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('bb5985377c04446e8d6424805cbe1c3d', '96e79218965eb72c92a549dd5a330112', 'd012d8909ac345e19faee0c83d604aff', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('bbe12cb2d17f4f958c15d8e737d41084', '96e79218965eb72c92a549dd5a330112', '1dfab9fe3f6942fea3e92b5d6e9b85ce', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('bbf8810925274896848373b0f2ec06bc', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c1dcd06e3707485eb64f2fe0242e4bf3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('bc49367b8e624227a2430f7c2ecb0366', '96e79218965eb72c92a549dd5a330112', '7ad89be678bd41d98046707e008e5ce0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('be4f2ee2ae674642b5b54e1c47d5895a', '7f87ef95e3a54d84a49db9d7aa50d955', 'cdd4319d2e614b7987149c930c24c404', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('beaf4b0aa1584ab888cfcf152faf22cf', '96e79218965eb72c92a549dd5a330112', '093cc6a328bd4604a477a8a4e18de4dc', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('bf03dfd1421c4867ad9c7bc749a5a602', '67f5b7d9e5c146f1b4e8dd953951ab7b', '24f949ce4fe24d00bd3a4b990b853267', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('bf270cc357894c18bcbc0cbb67152dfe', '96e79218965eb72c92a549dd5a330112', 'c5aa1013e13f43c39e10500b570b0712', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('bf775308e8ac4ef5b8cfefc893aea885', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5238d64cf76b4ef7aa0cf0241197745f', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('bff2d16a84994c788e3bfd2404ff479c', '7f87ef95e3a54d84a49db9d7aa50d955', '427bb773efce4ac2b1f9c70ef25496f1', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('c0442756ec6743be836f5a95df3a1072', '96e79218965eb72c92a549dd5a330112', '804890264b384bfba8bc726f7da976e8', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c124e17c898c458ea88be8fb4c6474d7', '67f5b7d9e5c146f1b4e8dd953951ab7b', '79da129b5ee644a8a767551a8948d0b8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c1309210330748468076ebbe16d9d55c', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'ed49d770e1574108b4f2b36efc9d81f6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c164655ed33846ddb5ffe2da12b6da81', '7f87ef95e3a54d84a49db9d7aa50d955', 'a2e23da17ec24b6ca17be2eec548e792', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('c181a3c056ae46ac8cf2d61da7b90bd3', '7f87ef95e3a54d84a49db9d7aa50d955', 'a2d941f02ebe44fe96dd4f31ff4e5607', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('c32bc4814403479c8ab8672c89dda3a7', '96e79218965eb72c92a549dd5a330112', '13668fcf83c84fe1b0624bded1851891', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c3591072a63c4e8aba78209887390d01', '96e79218965eb72c92a549dd5a330112', 'cad7323d2239497083dd9cf736e60812', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c38353ef629d4c59b2a84b0bbac11e5a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6c24e3189bb3454aa8f5b74e131b1076', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c58898215d01460ba2bfcb2eb0bd3442', '96e79218965eb72c92a549dd5a330112', 'd95788918d6142eaa5e0d99aee11759b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c5960e2b031f4ae196dfd4d6acd051f3', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8eee0efdcc514603a57afe63b8021b7a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c5bca95c62d24202b4874842e6f58265', '7f87ef95e3a54d84a49db9d7aa50d955', '8ca577450d2d4681a941fcde721f0910', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('c5e7864b759a422ab85177609ea16f7f', '7f87ef95e3a54d84a49db9d7aa50d955', '852995a146194c288573e9a2888f044c', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('c61a6acc0ffb4e48ad767b91ee5368a0', '67f5b7d9e5c146f1b4e8dd953951ab7b', '668c243fc70e4521a6680cfbc3755308', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c61d4ca52b32443d94c84cf156c5bd81', '67f5b7d9e5c146f1b4e8dd953951ab7b', '9b62d01cde824c1e91ea50d43d6c0886', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c6d65dede9054611896e948a7fc5b8d5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '69a3cb6c8e134d608d57d16f43723193', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c6f46d8bde8a4538bac44b8b0c1574fc', '67f5b7d9e5c146f1b4e8dd953951ab7b', '67f32efc79424e09898df7b9a9bfb08e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c70998502ad644a38480849665b2ca36', '7f87ef95e3a54d84a49db9d7aa50d955', 'a139f08792374b3fa9b1e3a3c7409c63', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('c75b35888897442eae86cd4201bae140', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5df413bfb7d54d9790299232f2a42984', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c850e9545f754c6da7794d086b1fb500', '96e79218965eb72c92a549dd5a330112', 'eca1906e31f64b069000f39afa4d02aa', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c894f3494fe24697a140b6aa9eab60b7', '96e79218965eb72c92a549dd5a330112', 'fe1aedc722d744b6a61547874f6f6e28', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('c8a79201a54f46429ccaf28e616dbee8', '7f87ef95e3a54d84a49db9d7aa50d955', '1839f9f9e6db4f5098cd8617944ca2bb', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('c9965980e6204113bf6206a95a6cfde9', '67f5b7d9e5c146f1b4e8dd953951ab7b', '13c35cd8177a41899d0525bd21e93dcd', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('c9b6be33bcb84c96a09f210db23db668', '7f87ef95e3a54d84a49db9d7aa50d955', '0b607f0bd899422cb9c71402849bc5a7', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('c9d3732236e841f4be1b85434c464f77', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'eca1906e31f64b069000f39afa4d02aa', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('cada74bb1cb1418c9988ad022649a1f5', '7f87ef95e3a54d84a49db9d7aa50d955', '20877f40c3ee4c0c9d36c011fe75b370', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('cb18797b126a483889b5767098c83531', '96e79218965eb72c92a549dd5a330112', '25c39443b5124d15aa2cbc952846de35', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('cc53ff7190d949ec997fcde4b00173bb', '96e79218965eb72c92a549dd5a330112', '91a40e4b6d434d6aa2e9ae2a15a3fb26', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('cc843e1963824492a1852de65102e73d', '7f87ef95e3a54d84a49db9d7aa50d955', 'f01eb1556d1f48a395f813265a425a08', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('cd41a863826d4ebb901b1d5daca5b8e1', '7f87ef95e3a54d84a49db9d7aa50d955', 'bb66147d9c7e4eefa39884036e2b048b', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('cdbc3e01ee17495abdf8a5ba1825d704', '67f5b7d9e5c146f1b4e8dd953951ab7b', '65ea1ab75a754abda5762b0d78cc1a04', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('cddd99088eaf4bb99c6ffa64a36f0ae8', '96e79218965eb72c92a549dd5a330112', '9d520af2b9564fb59e520018529620e7', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('cde90fb8988f4aa2b9a1034dcef7466f', '96e79218965eb72c92a549dd5a330112', '4f844777e3264597a7df0214b3416589', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ce9187ea1650478bbce1b84c778affa3', '7f87ef95e3a54d84a49db9d7aa50d955', 'df14d80db30f493faac3ebbb94a324a5', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('cea7e7ae0ae3467db64088b398a7a626', '7f87ef95e3a54d84a49db9d7aa50d955', 'eb0286a8954f45d58350266ee579e18c', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('ced35a5106f14b43a6cd165da465b8c1', '7f87ef95e3a54d84a49db9d7aa50d955', 'daf9b8d9283a40fbaa877d5b33689208', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('cf21d10cea9a4ce7a1a13cc44a5638b3', '7f87ef95e3a54d84a49db9d7aa50d955', '666a1c9c6f724722b45b5f983ddf6a6f', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('cf9eadae0ad044c7a9700b4882d8362c', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3770269cb7c84a9caa7f08e2b48ad553', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d03b87f4fdc14026953eae69f12a7012', '7f87ef95e3a54d84a49db9d7aa50d955', '8588cad181024f11b6bc45b1d39918f8', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d050240a182b455789b0653a0d9220fd', '7f87ef95e3a54d84a49db9d7aa50d955', '90c762f6a54446638fdda94dc956608c', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d0b6550d36d944949927150aa920db41', '96e79218965eb72c92a549dd5a330112', '73188b0e02c24d3a91ecb4704f34666f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d123a3618d2a49ac9a85c2280b3e714f', '96e79218965eb72c92a549dd5a330112', 'c3e7cf7a338e443093ed61a0d3f9c61a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d151e2161b17465aa77d6a442a892e32', '67f5b7d9e5c146f1b4e8dd953951ab7b', '019cef7053804692b7afa8f1b640e0c3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d1726456bc2b4b10a16c5ee3c241ca7d', '7f87ef95e3a54d84a49db9d7aa50d955', '69a3cb6c8e134d608d57d16f43723193', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('d18e3b68924941368958e68e90cdb63e', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2f1dec3044b04ee59a08f1f663aa20b9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d307f3db10274eac89b4111c1b0209a7', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6d5f05ed557d4709a5f0373733b51eb5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d37cd57561e44eb489c13a7f881f96cc', '7f87ef95e3a54d84a49db9d7aa50d955', '58198d91503c479f9b2f60e6fd244c9a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d3d284b86fe84206937e777f5a30759b', '7f87ef95e3a54d84a49db9d7aa50d955', '6e0683beb8814ce4a59c0cd7faf85bac', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('d400f2e7089149de8a2b38b73f33c492', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b14984e201224f40bc21657155fef884', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d43a3b88c5414009a863201646abaaba', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'ea6b1933239440e29d0455b89f8749b4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d51a3d51265145f8937e82128e358842', '96e79218965eb72c92a549dd5a330112', 'b2f44efb4aba4127ba22abd95b933d6f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d52f5d664caf4759a266e0f1d7912fd3', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5b1bcdd5ba3740c58a48b3fbbc4a1897', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d55442264d184dea8151e36ef2ceca6c', '7f87ef95e3a54d84a49db9d7aa50d955', 'cb0069a7ce8648f5b215059b8b08e302', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d6435a726a264715a6b6962f39e96f97', '96e79218965eb72c92a549dd5a330112', 'e4d0b362935c46abbc0d704c8fece838', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d65d16f352eb4231a38dd22d4d757c34', '7f87ef95e3a54d84a49db9d7aa50d955', '2c1d6fd25d8049a5b6d4faa8a51ecff2', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('d687aceeaa274f0eb9d5ea1453567473', '96e79218965eb72c92a549dd5a330112', '8eee0efdcc514603a57afe63b8021b7a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d6d8dc33c2fd47c4915863a7ce6ced3b', '7f87ef95e3a54d84a49db9d7aa50d955', '097f2092182647a199bf723034acbfee', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('d6fa7257e2bf410bb692c6d14e659a88', '7f87ef95e3a54d84a49db9d7aa50d955', '2116f77edea649409ebb9115ffe0cce3', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d778d7ec8a3c45bb9e9e005c4ec699d2', '7f87ef95e3a54d84a49db9d7aa50d955', '7a7af402ec5c4c79bd3c66e21e98ed4f', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d7ad22a6277a40e3ab8d8622c2660150', '96e79218965eb72c92a549dd5a330112', 'bd23d80cb6ae43d3be04d386da491bef', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('d82c673250a346a99292668724e3d140', '67f5b7d9e5c146f1b4e8dd953951ab7b', '6077b4907c634f44883cb23fc77b74f2', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d8ad26893bc34070a0f7fc611204739d', '7f87ef95e3a54d84a49db9d7aa50d955', '9481a5dfc84a49f29e8af52949a00fb0', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d96049a81e0a4bfe8a170f5f78f3e837', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c8fbc72fdb33450bbbb3fbb13979df01', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d96fd24f422d470c8b3045c4d505626f', '7f87ef95e3a54d84a49db9d7aa50d955', '299153ae2c1b40e48c7faa3654143778', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d98ffcadcd2f4d96a715ad072885a6d6', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5ab34adcc9d94d0eab2acb4b8a354404', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('d9ae8cec23e24197b4151620392df609', '7f87ef95e3a54d84a49db9d7aa50d955', 'd012d8909ac345e19faee0c83d604aff', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('d9e1a7e1bf064f41bebb804df7743ad6', '67f5b7d9e5c146f1b4e8dd953951ab7b', '7c7115994866468ea0e14a1121c5ec3b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('da584f1bad2e407680b44ad36f68b60b', '96e79218965eb72c92a549dd5a330112', '76056d119b324fb39b5b5012022369d4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('da5e620fdbac4acba71e11f37c917c45', '96e79218965eb72c92a549dd5a330112', '57a9a3175c4c41dc919643ccfc2c6aa0', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('dac0a97b05704d5481a9f1c0a89ba17b', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1e946136850844d2a42ae4de95a73a10', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('db210a25dc194b54a2898b82547addf5', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('db5d31638ab44f399549235eb8e9072d', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c99209d4198b4ec2b0fbca5d19c539e0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('dbca02f09b384c549b02250e7ffa7f03', '96e79218965eb72c92a549dd5a330112', '1f2c7c5a251042c098612dba5d815d7a', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('dc59b4efe4ae4d43acdb9fbd86d1e770', '67f5b7d9e5c146f1b4e8dd953951ab7b', '02f29bab7e914f4dbc768b1661f5206e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('dc811dbc1a484c71b11f87d19b87cecb', '7f87ef95e3a54d84a49db9d7aa50d955', '2a9625d648e3444c9a2699b99da82080', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('dd098ea3412f49abb87c9dcee02d3da1', '7f87ef95e3a54d84a49db9d7aa50d955', 'abd21b4e9bd1493d80e945e90da55193', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('ddd7dcdf0b4f4e1abd92bb1a5f4e6e67', '7f87ef95e3a54d84a49db9d7aa50d955', 'b855a1a246d44c7ea9fc314d07da88a9', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('df4780d5547445ff86b6c325b5e6f491', '96e79218965eb72c92a549dd5a330112', '4bdc1a6195784a6bb61868be97e35a60', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('df94777bfd1a46c4b05530edac21a6c2', '96e79218965eb72c92a549dd5a330112', 'b07fc05241a34951961bb134e59d3d5e', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('dfa5fac872eb4b3795c7ce86e6dc0291', '67f5b7d9e5c146f1b4e8dd953951ab7b', '25772568073e4508b9e2a532d74dc6af', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('dfb05f292c834b54bcc20fd5b297214e', '7f87ef95e3a54d84a49db9d7aa50d955', 'c3e7cf7a338e443093ed61a0d3f9c61a', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('e000cfbf3b4d47b8b94a270dbc396279', '67f5b7d9e5c146f1b4e8dd953951ab7b', '58198d91503c479f9b2f60e6fd244c9a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e03870d64db54f1fba1b950f8d1a90a5', '7f87ef95e3a54d84a49db9d7aa50d955', '6294cb7477ce45d59e4b8660070bb283', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e090ca7769984163abf4344a337d14ac', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'eb6a3dda3bed47d4849401b7e2e36561', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e090f429156641f39739b1db8d2d1ee3', '96e79218965eb72c92a549dd5a330112', '666a1c9c6f724722b45b5f983ddf6a6f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e12dd309fef34317be90dd7873609291', '96e79218965eb72c92a549dd5a330112', 'c960d0472a2a4f4f9fa1ad46952200db', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e133e666da164f409c326ea9d9a1a58e', '7f87ef95e3a54d84a49db9d7aa50d955', '2eb716450d3947688f73593a33de4907', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e29897b402734d9d869d8f7354c6720f', '96e79218965eb72c92a549dd5a330112', '392ce8e4bca243208ac9a5b14b3854ff', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e2dd820524c94db583bd929b8acb93dd', '96e79218965eb72c92a549dd5a330112', 'ec2534d687d842f1b2f51b4c58800d45', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e31eaf7fa1394888acef91c4946848af', '96e79218965eb72c92a549dd5a330112', '199eb048688d44bfad191b9bc87b289a', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e38fd4bf8cf34a388738ab7c18ecc12a', '7f87ef95e3a54d84a49db9d7aa50d955', 'cfe6007c56bf4328aede239e8aca161e', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e3db81481474491e93aac3a488e3420f', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'qqqcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e3dbb45915b84a6f8a437cea9584af88', '7f87ef95e3a54d84a49db9d7aa50d955', 'ea6b1933239440e29d0455b89f8749b4', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e48b8293b959478286db63649a9a1b9a', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1f745c26cbdd403887e16c4f4c067dad', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e517bc22f7f74f3ea1ef718fa6dc7114', '7f87ef95e3a54d84a49db9d7aa50d955', 'ec73b730cee94a9b9aa63173db0868a5', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e520b06574b948029186644418614c78', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a94c69f6744146dc8459dc2743f3d16e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e539d400f3bd43a0b23379eb9184ddf6', '96e79218965eb72c92a549dd5a330112', 'd4176bd74fd94bf090c0d655808713ca', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e54abc1e8bbf437bb9df192ce1d413c3', '96e79218965eb72c92a549dd5a330112', '6f14683521434f2db7d9e3a132e0958f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e584d5ce2e90428fb3fd03ae92d06329', '67f5b7d9e5c146f1b4e8dd953951ab7b', '852995a146194c288573e9a2888f044c', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e587c21a911741ae8282e473413c2af9', '96e79218965eb72c92a549dd5a330112', '667f67afcfab42bd861d332215a31c44', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e64805c6c472419289ebf07c65881d74', '96e79218965eb72c92a549dd5a330112', '3d15ee020d1c4294a224cabcb123b5dc', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e659fdb17a6c409da012a97f1f63bbd1', '7f87ef95e3a54d84a49db9d7aa50d955', '5ee48d30d72f49d0b09a9ddbe8005fc2', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('e6663c1811594e8b9244b0ad81581fa1', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3bee2c779b2c40d6885a9d7464fc3c8e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e6c08b2eedc44f2a93b4c408d386fc58', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'b07fc05241a34951961bb134e59d3d5e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e70239403db4430cb14fe7d8bc412565', '7f87ef95e3a54d84a49db9d7aa50d955', '35443649b2d94d21bc0c52a608feb38a', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e7449120463c4362a4c8481fd408be84', '7f87ef95e3a54d84a49db9d7aa50d955', 'ec2534d687d842f1b2f51b4c58800d45', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('e7e4fd194f1146829cdaee460d5a143f', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a2e23da17ec24b6ca17be2eec548e792', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e825c7c877494b20a805bfbc386d4f1e', '96e79218965eb72c92a549dd5a330112', 'e4f9b25bb29b41629a384254f70b913c', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e88591324b6a422aac6b94aa88d5e991', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'ec2534d687d842f1b2f51b4c58800d45', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e8f7e3fd4e9846ce93c080df6321459b', '96e79218965eb72c92a549dd5a330112', '2d2cc9ed925047ba80a5d64881dcbbb2', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('e8fc5f82fe824ff68f5a927b8347335f', '67f5b7d9e5c146f1b4e8dd953951ab7b', '35cdcb0fb8bc4054a69dc8274ba676c1', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('e9b818748b564f5cb8a0b48e83185ef9', '7f87ef95e3a54d84a49db9d7aa50d955', 'df7e5b56f3954b3aaa65a7c86a0c0bf9', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('e9cbe4af9aed413ea0bb04939aa76886', '96e79218965eb72c92a549dd5a330112', '3cb3a1b7be8f418285c495fd459b223f', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ea07ea7d03b84aa183ba90cf4143fd9f', '7f87ef95e3a54d84a49db9d7aa50d955', '75dbaf5002384a9dad594282ce8718a8', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('ea1f766a5d16453dabcffec77a6c1597', '96e79218965eb72c92a549dd5a330112', '75dbaf5002384a9dad594282ce8718a8', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ea827ac3d80d4d649d71e56c3438da5a', '7f87ef95e3a54d84a49db9d7aa50d955', '4b900c6857b74e1a81a236d0ac371dfa', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('ead1319aa8a4480d9ea1d9ff61987020', '7f87ef95e3a54d84a49db9d7aa50d955', '392ce8e4bca243208ac9a5b14b3854ff', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('eb1ef2229b7e43078ac167f741b5af81', '7f87ef95e3a54d84a49db9d7aa50d955', 'c6a2b1473e694e9995f655a45c81db95', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('eb359c7dca964f199008c9ff2cc9d0c1', '7f87ef95e3a54d84a49db9d7aa50d955', '6b20b8d4b65645e4883fd8250536cef5', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('eb575f5c1bde468e93acae655ed977b3', '7f87ef95e3a54d84a49db9d7aa50d955', '5238d64cf76b4ef7aa0cf0241197745f', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('eb75ebff623d49a3959e65b4f0734f4f', '96e79218965eb72c92a549dd5a330112', '728e1a5d5eb04b56924a674e7b7e3a99', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ebee73109a36413da2a0c20913d63c78', '7f87ef95e3a54d84a49db9d7aa50d955', 'fe1aedc722d744b6a61547874f6f6e28', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('ec286a5580cf4d3498a09bee5ec79f39', '7f87ef95e3a54d84a49db9d7aa50d955', 'eb6a3dda3bed47d4849401b7e2e36561', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('ec2a5ba80c0e483994d4ce91b90e8ff5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '75dbaf5002384a9dad594282ce8718a8', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ec3127a9d9e74d51b7b61c048a45e946', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'cb0069a7ce8648f5b215059b8b08e302', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('ecd3137755724e129154b14287a44611', '96e79218965eb72c92a549dd5a330112', '5824da6688fa40e080396454a84e8e73', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ed3d18c809c044318838196795dc54d3', '96e79218965eb72c92a549dd5a330112', 'b5615bc11ab2499b8ce57e0fd2d18567', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ed83a2b316ba4ed7a38c45f69559e2a2', '96e79218965eb72c92a549dd5a330112', '8c5a7183242e497ea0da0b4dbce82efe', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('edaa7775fd7f4be0bc51c48490e2abf0', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2ed3b43b8f3849fc8a6bc656c48a8fe6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('edbcd8455134408091bb5c258f730887', '96e79218965eb72c92a549dd5a330112', '5acf5ac873674e7582946fdb896b35a4', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ee03aee6589e4dd2adbe2e25f6d2f1ba', '7f87ef95e3a54d84a49db9d7aa50d955', '6c24e3189bb3454aa8f5b74e131b1076', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('efad56533222425f94c66d5c8bde6f83', '67f5b7d9e5c146f1b4e8dd953951ab7b', '097f2092182647a199bf723034acbfee', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('efb0a7d518d4432881a59080af65e501', '96e79218965eb72c92a549dd5a330112', '1f745c26cbdd403887e16c4f4c067dad', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('efdafe2417b9468290a5a9f2b59321e5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '65c9550aee3949ea8b478ac595ffd2c9', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f0ae033dc80a49a9b7968d1ac94b3ba1', '7f87ef95e3a54d84a49db9d7aa50d955', '810bd29cea0a40d0b5e4f859a3504cba', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f0bcbcfff8814cf6a6204cb1a7bb4418', '7f87ef95e3a54d84a49db9d7aa50d955', 'b4262a0492a04e25a41ec2166b3a0982', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f0e428eebfd64f1a932b3d7e653910f2', '7f87ef95e3a54d84a49db9d7aa50d955', 'b649c429bc174f9da16a3310420aee9e', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f0f93fa36d6d4407acd778bff447b923', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2230a6c6afca4654994f07ac6b78410b', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f10f7faf939c4a98adfb92aae8b3cacc', '96e79218965eb72c92a549dd5a330112', 'a139f08792374b3fa9b1e3a3c7409c63', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f157044410864fe5bfc9e3e9a9567efd', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4312de8ba0ee4dec86d5f45e924ad413', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f1751cb0e83a47a594222fcf9fa64291', '96e79218965eb72c92a549dd5a330112', 'eb0286a8954f45d58350266ee579e18c', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f1f1461588f94dbf8c1aefe8d2abe0dc', '67f5b7d9e5c146f1b4e8dd953951ab7b', '9481a5dfc84a49f29e8af52949a00fb0', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f23f8745548642328c239f62f6f71e57', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3a1669fb4c3043548bae9f905c1220c6', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f2694e7cc13f4b6a8caa9e6215f4b60a', '7f87ef95e3a54d84a49db9d7aa50d955', 'c8fbc72fdb33450bbbb3fbb13979df01', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('f27e6076d3904f6ea274b7b118d6a385', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'a63dae29597d472fbfa1c8cf1dc3cd38', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f302556c0f6e4dc99a2b88008ef2eafe', '96e79218965eb72c92a549dd5a330112', '417410b80f064ca1b5a545c72d440bf6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f3310836b7024ab380602f692f8f5c92', '7f87ef95e3a54d84a49db9d7aa50d955', '9d520af2b9564fb59e520018529620e7', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f35a646be36e46c4819afddb8303bb85', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'c32b39857fa946c99c3b7f38bb1d7978', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f3cd2f630d644d3b9155644c20d2f3b7', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'wwwcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f3f07cec24f14bc7a2c0f201a788c4ef', '96e79218965eb72c92a549dd5a330112', '69a3cb6c8e134d608d57d16f43723193', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f4a4459684084936a9c6059185400976', '7f87ef95e3a54d84a49db9d7aa50d955', '146c450aa1af43049bf1c49a70e4d7e2', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f4af71a78fde4af999065f34333fe889', '7f87ef95e3a54d84a49db9d7aa50d955', 'd13850ae4ea0419ebf82670e544af0be', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f4f1c2f970cf4c7bbb2c51a57b25f0e5', '67f5b7d9e5c146f1b4e8dd953951ab7b', '05e7c020477b4bd4a1b817e3f49c6974', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f4f4971e7380407d8e50d6eb6d324a33', '96e79218965eb72c92a549dd5a330112', '7d8348aca58248eb8b35016a95d0bdfa', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f50db1d0247d49fab8169714f078e357', '7f87ef95e3a54d84a49db9d7aa50d955', '03a853e928b0466791506b1aafdbc62c', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f5535d1b4f3d4c5b9a8e31dbf48ad834', '7f87ef95e3a54d84a49db9d7aa50d955', '7265a905072f437b9161bf49bc539620', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('f635b0905e934ef68e9c7b26edcbd7e4', '96e79218965eb72c92a549dd5a330112', '2eb716450d3947688f73593a33de4907', 'init', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f68df105477b4b80abb697c928577ab7', '96e79218965eb72c92a549dd5a330112', '25772568073e4508b9e2a532d74dc6af', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f7789e4730a44109b3b4b922a31c6eef', '67f5b7d9e5c146f1b4e8dd953951ab7b', '4bdc1a6195784a6bb61868be97e35a60', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f78efa40f9404ce980981835b7bb2435', '96e79218965eb72c92a549dd5a330112', '49850bd75a634fbea8b70b51c0f2209b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f7e410bfe9bd46d1beda582f6bddd58a', '7f87ef95e3a54d84a49db9d7aa50d955', 'c32b39857fa946c99c3b7f38bb1d7978', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('f7fd86ab97ce4fa09561e31408b78355', '67f5b7d9e5c146f1b4e8dd953951ab7b', '99a5b745c5e54c28846c9fd8408281e4', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f8b21012c5734b3f963f5b55c6d1d14d', '7f87ef95e3a54d84a49db9d7aa50d955', 'fe2a474b712c44fab6d3d56e6c4d9b64', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('f8b96ba07beb401ca8248e523e1845e1', '96e79218965eb72c92a549dd5a330112', '8b4e80d580c74cc680bda09aacdd6e37', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('f8db481fb05b4fdcb16212480792dbc7', '67f5b7d9e5c146f1b4e8dd953951ab7b', '8901e206440d4d68aeb69cd3d7af500e', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f8e02a10007f4e1282095fcc065b140b', '67f5b7d9e5c146f1b4e8dd953951ab7b', '3d15ee020d1c4294a224cabcb123b5dc', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('f93a21a2d16b47ee86ed021d78f2a5d4', '96e79218965eb72c92a549dd5a330112', 'bb66147d9c7e4eefa39884036e2b048b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('fa24fd8d72a941d6b128972ffd6ed763', '7f87ef95e3a54d84a49db9d7aa50d955', '25772568073e4508b9e2a532d74dc6af', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('fa6449566eca409ab2df15542b252d0c', '96e79218965eb72c92a549dd5a330112', '3b9609cfaec34cd0a692c62f209faca1', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('fa8783ab9c894f5d894f341bb7b9ba6d', '67f5b7d9e5c146f1b4e8dd953951ab7b', '1dfab9fe3f6942fea3e92b5d6e9b85ce', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('fac9555cf174464bb17e116e9416a684', '96e79218965eb72c92a549dd5a330112', 'fe2a474b712c44fab6d3d56e6c4d9b64', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('fb44f63c8c6c4f938fafcfcac0e2cc0a', '96e79218965eb72c92a549dd5a330112', '7c7115994866468ea0e14a1121c5ec3b', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('fb646c29b46d446da1898be076f3a676', '67f5b7d9e5c146f1b4e8dd953951ab7b', '2f65e7aa17b14cca8faf26fceabf72ca', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('fba71eddb60747fd89d847f06f943088', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'f01eb1556d1f48a395f813265a425a08', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('fc0a71877e024907b140e2eaed4da53c', '7f87ef95e3a54d84a49db9d7aa50d955', 'ed49d770e1574108b4f2b36efc9d81f6', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('fc555c15191a45e2af371969a7d88ff1', '7f87ef95e3a54d84a49db9d7aa50d955', 'a3109cf32fd84394af4033d5c5be4183', 'api', '2018-01-10 13:15:06', null, null);
INSERT INTO `permission_t` VALUES ('fd3d731b1d94415280ef17738072e626', '67f5b7d9e5c146f1b4e8dd953951ab7b', '5ef049f4566c472486ed45b350c6622a', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('fe0b3dc3cfa14f0ba2ac9433389bb2fa', '67f5b7d9e5c146f1b4e8dd953951ab7b', 'ec73b730cee94a9b9aa63173db0868a5', 'api', '2018-01-21 15:28:39', null, null);
INSERT INTO `permission_t` VALUES ('fedc9d11eea2471c99867da51bcb8d6b', '7f87ef95e3a54d84a49db9d7aa50d955', 'b33b20c8f48a4ec78c328ceefdcbc2da', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('ff3216f8cf25496f9d096e631a0e356a', '7f87ef95e3a54d84a49db9d7aa50d955', 'wwwcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('ff7764de39684620be623761d555bd64', '96e79218965eb72c92a549dd5a330112', '290e73b194ef48cab5efd7da24b09ae6', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('ff95d0e4dd06450c94d3c0984d9aa6ac', '7f87ef95e3a54d84a49db9d7aa50d955', 'e4f9b25bb29b41629a384254f70b913c', 'api', '2018-01-10 13:15:05', null, null);
INSERT INTO `permission_t` VALUES ('qqqcef7053804692b7afa8f1b640e0c3', '96e79218965eb72c92a549dd5a330112', 'qqqcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('vvvcef7053804692b7afa8f1b640e0c3', '96e79218965eb72c92a549dd5a330112', 'vvvcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-09 12:20:48', null, null);
INSERT INTO `permission_t` VALUES ('wwwcef7053804692b7afa8f1b640e0c3', '96e79218965eb72c92a549dd5a330112', 'wwwcef7053804692b7afa8f1b640e0c3', 'api', '2018-01-09 12:20:48', null, null);

-- ----------------------------
-- Table structure for plan_log_t
-- ----------------------------
DROP TABLE IF EXISTS `plan_log_t`;
CREATE TABLE `plan_log_t` (
  `id` varchar(32) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `creator` varchar(20) DEFAULT NULL,
  `modifier` varchar(20) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `progress` varchar(20) DEFAULT NULL,
  `plan_id` varchar(32) DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id` (`id`),
  KEY `FK2C8219A3C5CFE49D` (`plan_id`),
  CONSTRAINT `FK2C8219A3C5CFE49D` FOREIGN KEY (`plan_id`) REFERENCES `work_plan_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_log_t
-- ----------------------------
INSERT INTO `plan_log_t` VALUES ('07365452a1044e1b9abaa45e6a51a27e', '2017-10-31 15:20:30', 'api', null, null, '哈嘿', '9562ec914fbf4b90aeb32c270a5f4b94');
INSERT INTO `plan_log_t` VALUES ('12d8adef94794a4590d4364b2c0abe68', '2017-10-31 15:19:05', 'api', null, null, 'asdddd', '9562ec914fbf4b90aeb32c270a5f4b94');
INSERT INTO `plan_log_t` VALUES ('13033d85a9d3487fb369bbe9dda62896', '2017-07-30 14:54:31', 'api', null, null, '测试通过', 'c7184659872745fd95a655e6af2ff08d');
INSERT INTO `plan_log_t` VALUES ('25b45e043aa245a3980382b7fc1e718b', '2017-07-30 14:52:38', 'api', null, null, '框架搭建完成', 'e7d01e94eeee481a964b7f127ffdb805');
INSERT INTO `plan_log_t` VALUES ('33b28989978247c0a9ca40e98fcb3cb1', '2017-07-30 14:52:38', 'api', null, null, '框架搭建完成', 'e7d01e94eeee481a964b7f127ffdb805');
INSERT INTO `plan_log_t` VALUES ('468619969cc44fe097e7bce453d33d92', '2017-07-30 14:53:23', 'api', null, null, '阿萨德', 'c7184659872745fd95a655e6af2ff08d');
INSERT INTO `plan_log_t` VALUES ('54b889fa0f6241d59618ad93d5587029', '2017-07-30 14:52:46', 'api', null, null, '框架搭建完成', 'e7d01e94eeee481a964b7f127ffdb805');
INSERT INTO `plan_log_t` VALUES ('95590909757a47dfb44ab9ba96739fd5', '2017-07-30 14:54:44', 'api', null, null, '测试通过', 'c7184659872745fd95a655e6af2ff08d');
INSERT INTO `plan_log_t` VALUES ('9dc695e1d41045f79eabc6043e761ff0', '2017-07-30 14:58:38', 'api', null, null, '自己册书', '8654fcac974a4a7ea03101b7950c7004');
INSERT INTO `plan_log_t` VALUES ('ab7898035d754d6793aee0922b7e48c1', '2017-09-11 08:20:28', 'api', null, null, '我爱测试', '8654fcac974a4a7ea03101b7950c7004');
INSERT INTO `plan_log_t` VALUES ('cf2ab02a865e45fcb3f2582c7c6ddbe5', '2017-09-11 14:43:45', 'api', null, null, '1111111111sa', '8654fcac974a4a7ea03101b7950c7004');
INSERT INTO `plan_log_t` VALUES ('d112c97338f148eb9a52a771ddf290c4', '2017-07-30 14:52:35', 'api', null, null, '框架搭建完成', 'e7d01e94eeee481a964b7f127ffdb805');
INSERT INTO `plan_log_t` VALUES ('f56ea31ba18342a5b47acbddc82c02c3', '2017-07-30 14:52:38', 'api', null, null, '框架搭建完成', 'e7d01e94eeee481a964b7f127ffdb805');

-- ----------------------------
-- Table structure for production_node_t
-- ----------------------------
DROP TABLE IF EXISTS `production_node_t`;
CREATE TABLE `production_node_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `production_record_id` char(32) DEFAULT NULL COMMENT '生产记录id',
  `progress` varchar(200) DEFAULT NULL COMMENT '进展情况',
  `note_date` date DEFAULT NULL COMMENT '时间节点',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_28` (`production_record_id`),
  CONSTRAINT `FK_Reference_28` FOREIGN KEY (`production_record_id`) REFERENCES `production_record_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产节点表';

-- ----------------------------
-- Records of production_node_t
-- ----------------------------
INSERT INTO `production_node_t` VALUES ('042e7fb56ad445f2a6ba35d027e3b044', '15fc8bb31db543ffaecbabd2c9241ad8', 'dddd', '2017-11-03', 'api', '2017-11-02 16:58:28', null, null);
INSERT INTO `production_node_t` VALUES ('4dab4dc399394cc6ab6a9c04c89687e0', '15fc8bb31db543ffaecbabd2c9241ad8', '啊啊啊', '2017-11-02', 'api', '2017-11-02 16:57:04', null, null);
INSERT INTO `production_node_t` VALUES ('7ea40416190349f4bde6209ecf6ee98b', 'fc829e4fd73b42069e5cc1e80d658b55', '2', '2017-09-11', 'api', '2017-09-11 15:21:46', null, null);
INSERT INTO `production_node_t` VALUES ('b14e8c39c33e4090975a0297ed5d738b', 'fc829e4fd73b42069e5cc1e80d658b55', 'dddddddddddddd', '2018-01-09', 'api', '2018-01-09 12:31:14', null, null);
INSERT INTO `production_node_t` VALUES ('b16f40f438b84511a3cdd4894ff55def', 'acf1246370a145e99bf1e150406bc319', '8d', '2017-11-07', 'api', '2017-11-02 17:05:08', null, null);
INSERT INTO `production_node_t` VALUES ('bf793674dd774e4a821b81ba8776f72e', 'fc829e4fd73b42069e5cc1e80d658b55', '阿萨德', '2018-01-16', 'api', '2018-01-07 08:23:50', null, null);
INSERT INTO `production_node_t` VALUES ('cae0e357658c4affaf5719f7b62810fd', 'fc829e4fd73b42069e5cc1e80d658b55', 'ok', '2017-07-30', 'api', '2017-07-30 09:21:32', null, null);

-- ----------------------------
-- Table structure for production_record_t
-- ----------------------------
DROP TABLE IF EXISTS `production_record_t`;
CREATE TABLE `production_record_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `task_name` varchar(50) DEFAULT NULL COMMENT '任务名称',
  `task_number` varchar(50) DEFAULT NULL COMMENT '任务单号',
  `task_date` date DEFAULT NULL COMMENT '下单日期',
  `end_date` date DEFAULT NULL COMMENT '截止日期',
  `problem` varchar(200) DEFAULT NULL COMMENT '问题',
  `last_progress` varchar(200) DEFAULT NULL COMMENT '状态',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产记录表';

-- ----------------------------
-- Records of production_record_t
-- ----------------------------
INSERT INTO `production_record_t` VALUES ('15fc8bb31db543ffaecbabd2c9241ad8', '会话会话或', 'KD1222', '2017-11-01', '2017-11-30', '啊啊啊啊啊', 'dddd', 'api', '2017-11-02 16:34:35', 'api', '2017-11-02 16:58:28');
INSERT INTO `production_record_t` VALUES ('acf1246370a145e99bf1e150406bc319', 'L', '1111', '2017-11-02', '2017-11-29', '777', '8d', 'api', '2017-11-02 16:26:30', 'api', '2017-11-02 17:05:08');
INSERT INTO `production_record_t` VALUES ('fc829e4fd73b42069e5cc1e80d658b55', '线路调整', 'JLFC20170802', '2017-07-30', '2018-01-01', 'a', 'dddddddddddddd', 'api', '2017-07-30 08:37:56', 'api', '2018-01-09 12:31:14');

-- ----------------------------
-- Table structure for production_t
-- ----------------------------
DROP TABLE IF EXISTS `production_t`;
CREATE TABLE `production_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `product_type_id` char(32) NOT NULL COMMENT '产品',
  `product_store_id` char(32) NOT NULL COMMENT '库存',
  `model` varchar(200) DEFAULT NULL COMMENT '型号',
  `income_status` int(11) DEFAULT NULL COMMENT '生产状态',
  `out_status` int(11) DEFAULT NULL COMMENT '出库状态',
  `purpose` varchar(100) DEFAULT NULL COMMENT '用途',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `use_man` varchar(20) DEFAULT NULL COMMENT '领用人',
  `out_man` varchar(20) DEFAULT NULL COMMENT '出库人',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `use_time` datetime DEFAULT NULL COMMENT '领用时间',
  `out_time` datetime DEFAULT NULL COMMENT '出库时间',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK3D03B26E25D03C2E` (`product_type_id`),
  KEY `FK3D03B26E22CB83E6` (`product_store_id`),
  CONSTRAINT `FK3D03B26E22CB83E6` FOREIGN KEY (`product_store_id`) REFERENCES `product_store_t` (`id`),
  CONSTRAINT `FK3D03B26E25D03C2E` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='生产表';

-- ----------------------------
-- Records of production_t
-- ----------------------------
INSERT INTO `production_t` VALUES ('1799630370064cd4a6d7ea37bce84b73', '17a298861b0c4f22b23aa66ba16bee6b', 'c9e216df900b40f6a4031c6df8441078', '容量-200颜色-黄色厂家-东厂', '0', '0', '123', '2', null, null, '123', null, null, 'api', '2017-12-27 17:24:45', null, null);
INSERT INTO `production_t` VALUES ('cf03a06ed33b4c1e97671b96cf544fa0', '17a298861b0c4f22b23aa66ba16bee6b', '46a17b049c584505be9893f29cc84d2b', '颜色-绿色容量-300厂家-东厂', '1', '1', '123', '2', 'L', 'L', '132', '2017-12-27 16:27:18', '2017-12-27 15:49:33', null, null, 'api', '2017-12-27 16:27:18');
INSERT INTO `production_t` VALUES ('cf781a22de10428d87a6af24ddb031d8', '17a298861b0c4f22b23aa66ba16bee6b', 'c9e216df900b40f6a4031c6df8441078', '容量-200颜色-黄色厂家-东厂', '1', '1', '321', '1', 'L', 'L', '321', '2017-12-27 17:24:58', '2017-12-27 17:24:53', 'api', '2017-12-27 17:03:51', 'api', '2017-12-27 17:24:58');

-- ----------------------------
-- Table structure for product_after_sale_t
-- ----------------------------
DROP TABLE IF EXISTS `product_after_sale_t`;
CREATE TABLE `product_after_sale_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `project_name` varchar(100) DEFAULT NULL COMMENT '所属项目',
  `sale_date` date DEFAULT NULL COMMENT '时间',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：正在进行；2：暂停；3：终止）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品售后表';

-- ----------------------------
-- Records of product_after_sale_t
-- ----------------------------

-- ----------------------------
-- Table structure for product_dealer_t
-- ----------------------------
DROP TABLE IF EXISTS `product_dealer_t`;
CREATE TABLE `product_dealer_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `dealer_name` varchar(50) NOT NULL COMMENT ' 渠道商名称',
  `bank_info` varchar(100) DEFAULT NULL COMMENT '银行户头',
  `link_name` varchar(20) DEFAULT NULL COMMENT '联系人',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `link_addr` varchar(100) DEFAULT NULL COMMENT '联系地址',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品渠道商';

-- ----------------------------
-- Records of product_dealer_t
-- ----------------------------
INSERT INTO `product_dealer_t` VALUES ('5164c0642b56428d9a68241cef503141', '尺子制造厂', '直尺', 'and', '19129318931', '卡萨丁就拉屎的', 'api', '2017-12-20 19:57:37', null, null);
INSERT INTO `product_dealer_t` VALUES ('d5949813fd0f4be685f09332bdf62f45', '宏志杯子制造有限公司', '宏志1', '大王峰2', '13621222226', '北京海淀位置了1', null, null, 'api', '2017-12-20 14:59:30');

-- ----------------------------
-- Table structure for product_manage_t
-- ----------------------------
DROP TABLE IF EXISTS `product_manage_t`;
CREATE TABLE `product_manage_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `amount` int(11) NOT NULL COMMENT '所需数量',
  `parent_id` char(32) DEFAULT NULL COMMENT '父id',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `product_type_id` char(32) NOT NULL COMMENT '产品id',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_611` (`product_type_id`),
  CONSTRAINT `FK_Reference_611` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品管理表';

-- ----------------------------
-- Records of product_manage_t
-- ----------------------------
INSERT INTO `product_manage_t` VALUES ('08da7c44eedc456ea2d72917e0b0911f', '1', null, 'api', '2017-12-21 14:08:14', null, null, '17a298861b0c4f22b23aa66ba16bee6b');
INSERT INTO `product_manage_t` VALUES ('14e5e43c6d164b648a17fd6fef6cdde1', '30', 'c1cd26901f304779a2d84fbea41c941b', 'api', '2017-12-21 17:12:52', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('172462ca8b0747bd8bc31d6105359d0f', '3', '1888606f7f444cca9239670fb0453b90', 'api', '2017-12-21 17:46:52', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('1888606f7f444cca9239670fb0453b90', '2', 'f388756a9f3343a482abdcdc7affa41e', 'api', '2017-12-21 17:45:35', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('191e94ff4f0243ea8edcf4f10a823e82', '2', '8755efb198e84eb98c623534778c0438', 'api', '2017-12-27 17:23:42', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('1e8815aca5024b73b49e3a8b091394d5', '33', '2ddfde4befc7440aae378ef377e18629', 'api', '2017-12-21 17:37:44', null, null, 'd1ce731ecf1741959e70b8da43a5ace1');
INSERT INTO `product_manage_t` VALUES ('2bebc2b10c7649329e9d2cfa1c2a5685', '9', 'dc681c4e260a41cf8ee5b3d5ada63b0a', 'api', '2017-12-21 17:47:04', null, null, '17a298861b0c4f22b23aa66ba16bee6b');
INSERT INTO `product_manage_t` VALUES ('2ddfde4befc7440aae378ef377e18629', '3', 'dc60beb46ba149429670a55e902f89f5', 'api', '2017-12-21 17:37:29', null, null, '71dd6f0797524b81a4c927ae25dbc0d8');
INSERT INTO `product_manage_t` VALUES ('34a3d8824ca64beb8d82c6737bf0f93f', '2', '57e367a3c27740e985ac8e453418d781', 'api', '2017-12-21 17:47:34', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('3be504f8e16e4cd5bf6e6b9defc2c042', '2', 'c1cd26901f304779a2d84fbea41c941b', 'api', '2017-12-21 17:12:52', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('440c4c6f8d9e4286b95f9a2a7810c1ab', '9', '2bebc2b10c7649329e9d2cfa1c2a5685', 'api', '2017-12-21 17:47:04', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('4a9013935b884bf7affa637fa61eeed4', '2', 'f5cc3fd7d37146478ad22f22607f543d', 'api', '2017-12-21 17:12:05', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('51dc48208a3d4f7eab3a1120be8a8fba', '3', '191e94ff4f0243ea8edcf4f10a823e82', 'api', '2017-12-27 17:23:42', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('53a81d951f6242f18b42a8e863e61479', '9', '96b30426f1dd46008d10c23a334a53ce', 'api', '2017-12-21 17:36:55', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('57e367a3c27740e985ac8e453418d781', '9', '9ede1694a32a4545a90a472de3a9fa28', 'api', '2017-12-21 17:47:34', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('597a0517525647efab592bf6f3ee2074', '30', '53a81d951f6242f18b42a8e863e61479', 'api', '2017-12-21 17:36:55', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('5a2cc28686a046cba6e5114ed34226f1', '30', '8755efb198e84eb98c623534778c0438', 'api', '2017-12-27 17:23:42', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('5ab1a6fee9494dbe85a6882f706a8249', '2', '53a81d951f6242f18b42a8e863e61479', 'api', '2017-12-21 17:36:55', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('60b99321922c472b82ae5182c70d809a', '33', 'b7c0f4d47219441c9a4e2852490907eb', 'api', '2017-12-21 17:47:34', null, null, 'd1ce731ecf1741959e70b8da43a5ace1');
INSERT INTO `product_manage_t` VALUES ('6610daea2ac44668b556356c9a3a9295', '3', 'c0257dedb11f4a8c878477f7eae7470b', 'api', '2017-12-21 17:47:04', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('69902183e3134442a7436b0f55783261', '2', 'b7e0ee5deb5d4b079fafea7008cddbb0', 'api', '2017-12-21 17:11:44', null, null, 'e04019f6fa434c00aa85456098820aa7');
INSERT INTO `product_manage_t` VALUES ('6a4338e31a934fe6be628938998563f2', '3', '34a3d8824ca64beb8d82c6737bf0f93f', 'api', '2017-12-21 17:47:34', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('6e182447fdec4d6982dcc5e25c0a8a22', '30', 'f388756a9f3343a482abdcdc7affa41e', 'api', '2017-12-21 17:45:35', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('7d39cfb457a54b478d98a96aaca1bb44', '111', '08da7c44eedc456ea2d72917e0b0911f', 'api', '2017-12-26 16:28:36', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('8755efb198e84eb98c623534778c0438', '33', 'e02e6b0d30e744bf9256018b46e74c01', 'api', '2017-12-27 17:23:42', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('8984d9fa273243cc8cfeb6dbfbbd76a1', '1', null, 'api', '2017-12-21 17:44:57', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('96b30426f1dd46008d10c23a334a53ce', '9', 'dc60beb46ba149429670a55e902f89f5', 'api', '2017-12-21 17:36:55', null, null, '17a298861b0c4f22b23aa66ba16bee6b');
INSERT INTO `product_manage_t` VALUES ('9ede1694a32a4545a90a472de3a9fa28', '9', 'ffda389f83684bff87f17c55bfd0e2ae', 'api', '2017-12-21 17:47:34', null, null, '17a298861b0c4f22b23aa66ba16bee6b');
INSERT INTO `product_manage_t` VALUES ('ab8a04f6566c42e7969c58e9b217923a', '3', 'dc681c4e260a41cf8ee5b3d5ada63b0a', 'api', '2017-12-21 17:47:04', null, null, '71dd6f0797524b81a4c927ae25dbc0d8');
INSERT INTO `product_manage_t` VALUES ('b595620347204cb195315c0cbe211d3b', '1', null, 'api', '2017-12-21 16:21:59', null, null, '702d0ced2a254b98980377cd78021a14');
INSERT INTO `product_manage_t` VALUES ('b7c0f4d47219441c9a4e2852490907eb', '3', 'ffda389f83684bff87f17c55bfd0e2ae', 'api', '2017-12-21 17:47:34', null, null, '71dd6f0797524b81a4c927ae25dbc0d8');
INSERT INTO `product_manage_t` VALUES ('b7d999c7f50741139f63b3f01bea32e5', '30', '57e367a3c27740e985ac8e453418d781', 'api', '2017-12-21 17:47:34', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('b7e0ee5deb5d4b079fafea7008cddbb0', '3', 'b595620347204cb195315c0cbe211d3b', 'api', '2017-12-21 16:22:23', null, null, '7f6550a0775c4edb8bf6a4461fd01788');
INSERT INTO `product_manage_t` VALUES ('bd3c48c45bd34db68c01d4f15cc21ba1', '30', '440c4c6f8d9e4286b95f9a2a7810c1ab', 'api', '2017-12-21 17:47:04', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('c0257dedb11f4a8c878477f7eae7470b', '2', '440c4c6f8d9e4286b95f9a2a7810c1ab', 'api', '2017-12-21 17:47:04', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('c1cd26901f304779a2d84fbea41c941b', '9', '08da7c44eedc456ea2d72917e0b0911f', 'api', '2017-12-21 17:12:52', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('c35dbb415162477b9efe71b754f115fd', '30', '8984d9fa273243cc8cfeb6dbfbbd76a1', 'api', '2017-12-21 17:44:57', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('d71019854f3c47a6bdbd0b0be7689ecb', '30', 'f5cc3fd7d37146478ad22f22607f543d', 'api', '2017-12-21 17:12:16', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8');
INSERT INTO `product_manage_t` VALUES ('dc546f5f6cdf458fa2fbccab08aac90c', '33', 'ab8a04f6566c42e7969c58e9b217923a', 'api', '2017-12-21 17:47:04', null, null, 'd1ce731ecf1741959e70b8da43a5ace1');
INSERT INTO `product_manage_t` VALUES ('dc60beb46ba149429670a55e902f89f5', '2', 'b595620347204cb195315c0cbe211d3b', 'api', '2017-12-21 16:24:38', null, null, '702c2046fe214faa8913fea606de9cbf');
INSERT INTO `product_manage_t` VALUES ('dc681c4e260a41cf8ee5b3d5ada63b0a', '9', '172462ca8b0747bd8bc31d6105359d0f', 'api', '2017-12-21 17:47:04', null, null, '702c2046fe214faa8913fea606de9cbf');
INSERT INTO `product_manage_t` VALUES ('e02e6b0d30e744bf9256018b46e74c01', '1', null, 'api', '2017-12-27 17:23:42', null, null, 'e04019f6fa434c00aa85456098820aa7');
INSERT INTO `product_manage_t` VALUES ('f388756a9f3343a482abdcdc7affa41e', '33', '69902183e3134442a7436b0f55783261', 'api', '2017-12-21 17:45:35', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('f5cc3fd7d37146478ad22f22607f543d', '1', 'b7e0ee5deb5d4b079fafea7008cddbb0', 'api', '2017-12-21 17:06:22', null, null, 'c49ea4f4119d4e468691464f376f7ed4');
INSERT INTO `product_manage_t` VALUES ('f62a1bd0a9874d58acd3afa55c7f41d8', '1', null, 'api', '2017-12-21 16:15:50', null, null, 'd1ce731ecf1741959e70b8da43a5ace1');
INSERT INTO `product_manage_t` VALUES ('f9fbcd58c2944ed1ac1e0654cbf64634', '2', '8984d9fa273243cc8cfeb6dbfbbd76a1', 'api', '2017-12-21 17:44:57', null, null, '2622bef326ef4333b7699e5184efaeaf');
INSERT INTO `product_manage_t` VALUES ('ffda389f83684bff87f17c55bfd0e2ae', '1', 'd71019854f3c47a6bdbd0b0be7689ecb', 'api', '2017-12-21 17:47:34', null, null, '702c2046fe214faa8913fea606de9cbf');

-- ----------------------------
-- Table structure for product_property_t
-- ----------------------------
DROP TABLE IF EXISTS `product_property_t`;
CREATE TABLE `product_property_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `product_type_id` char(32) NOT NULL COMMENT '产品类型id',
  `type` int(11) DEFAULT NULL COMMENT '是否支持手动输入（0：可以；）',
  `property_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_1ss` (`product_type_id`),
  CONSTRAINT `FK_Reference_1ss` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性名称';

-- ----------------------------
-- Records of product_property_t
-- ----------------------------
INSERT INTO `product_property_t` VALUES ('2cc734f9500f4bb691a130de98ab5263', 'api', '2017-12-21 16:15:13', null, null, 'e04019f6fa434c00aa85456098820aa7', null, 'e');
INSERT INTO `product_property_t` VALUES ('3f55cc1f7744427493e49a8d79b41ef5', 'api', '2017-12-20 17:48:24', null, null, '17a298861b0c4f22b23aa66ba16bee6b', null, '颜色');
INSERT INTO `product_property_t` VALUES ('403a41a3288e412ba7460192fd05c625', 'api', '2017-12-20 18:29:13', null, null, '71dd6f0797524b81a4c927ae25dbc0d8', null, '颜色');
INSERT INTO `product_property_t` VALUES ('4cfb01fe7bc34ab5804340cce8b17184', 'api', '2017-12-20 17:48:24', null, null, '17a298861b0c4f22b23aa66ba16bee6b', '0', '容量');
INSERT INTO `product_property_t` VALUES ('7f25e26c0565424a9990b7c56fe46d13', 'api', '2017-12-21 16:15:25', null, null, '2622bef326ef4333b7699e5184efaeaf', null, 'q');
INSERT INTO `product_property_t` VALUES ('80e0814e957a43e9ad6315fe1ff71000', 'api', '2017-12-21 16:15:05', null, null, 'c49ea4f4119d4e468691464f376f7ed4', null, 'd');
INSERT INTO `product_property_t` VALUES ('85825bee8a104321ae4c05dfb2133da1', 'api', '2017-12-21 16:14:46', null, null, '7f6550a0775c4edb8bf6a4461fd01788', null, '尺寸');
INSERT INTO `product_property_t` VALUES ('9c015b37e0174d9582ed280d408e0d94', 'api', '2018-01-21 15:37:26', null, null, '4b6ba40a46714cd7bb782499207d84fe', null, '型号');
INSERT INTO `product_property_t` VALUES ('a0196306b7e649f7bf826dc0bae55c42', 'api', '2017-12-21 16:14:11', null, null, 'd1ce731ecf1741959e70b8da43a5ace1', null, '颜色');
INSERT INTO `product_property_t` VALUES ('b5dda59d43f54b519113846d1e3d10f5', 'api', '2017-12-21 16:15:33', null, null, '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', null, 'w');
INSERT INTO `product_property_t` VALUES ('d292d442d72b445f8a88a6fe0561dea7', 'api', '2017-12-21 16:21:45', null, null, '702d0ced2a254b98980377cd78021a14', null, 'a');
INSERT INTO `product_property_t` VALUES ('e327d3d6beb84a6e9a2f724d9c8322cd', 'api', '2017-12-20 18:29:13', null, null, '71dd6f0797524b81a4c927ae25dbc0d8', '0', '长度');
INSERT INTO `product_property_t` VALUES ('e5b9ca21c8ec40e793d7f29ba2be2912', 'api', '2017-12-20 17:48:24', null, null, '17a298861b0c4f22b23aa66ba16bee6b', null, '厂家');
INSERT INTO `product_property_t` VALUES ('f89979536e674e6b999ad860d80675ed', 'api', '2017-12-21 16:14:57', null, null, '702c2046fe214faa8913fea606de9cbf', null, 'c');
INSERT INTO `product_property_t` VALUES ('fc6ab27581c2407ba513ef90ee82438f', 'api', '2018-01-21 15:37:26', null, null, '4b6ba40a46714cd7bb782499207d84fe', null, 'cup');

-- ----------------------------
-- Table structure for product_property_value_t
-- ----------------------------
DROP TABLE IF EXISTS `product_property_value_t`;
CREATE TABLE `product_property_value_t` (
  `modify_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `creator` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `modifier` varchar(32) DEFAULT NULL,
  `id` char(32) NOT NULL COMMENT 'uuid',
  `product_property_id` char(32) NOT NULL COMMENT '产品属性id',
  `vals` varchar(50) NOT NULL COMMENT '属性可选信息',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2233` (`product_property_id`),
  CONSTRAINT `FK_Reference_2233` FOREIGN KEY (`product_property_id`) REFERENCES `product_property_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品属性值';

-- ----------------------------
-- Records of product_property_value_t
-- ----------------------------
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:14:11', 'api', '2017-12-21 16:14:11', null, '26d3eeee91604a63bb14e8bb2780d5c0', 'a0196306b7e649f7bf826dc0bae55c42', '黑 b');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 18:29:13', 'api', '2017-12-20 18:29:13', null, '28939d79aec84b9fad3df375d31edee4', 'e327d3d6beb84a6e9a2f724d9c8322cd', '100');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:21:45', 'api', '2017-12-21 16:21:45', null, '355104bbace54be99d726948ff5d0acc', 'd292d442d72b445f8a88a6fe0561dea7', 'a');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:14:57', 'api', '2017-12-21 16:14:57', null, '36218b79850a4c2cbcd0221db0d7ce4d', 'f89979536e674e6b999ad860d80675ed', 'c');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:14:46', 'api', '2017-12-21 16:14:46', null, '37e3e45901dd4db3be0d7f98c7127a12', '85825bee8a104321ae4c05dfb2133da1', '10');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, '44f76c549dbe4f1dbfa585ed41eb3e79', '3f55cc1f7744427493e49a8d79b41ef5', '黄色');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:15:05', 'api', '2017-12-21 16:15:05', null, '4b89a2fa571e4577ba22f2b2c9c74588', '80e0814e957a43e9ad6315fe1ff71000', 'd');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 18:29:13', 'api', '2017-12-20 18:29:13', null, '5511b383fd8048f89bfa2446906e12ec', 'e327d3d6beb84a6e9a2f724d9c8322cd', '50');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, '5acfaa3dcb2846568cdcd5c82175795d', '3f55cc1f7744427493e49a8d79b41ef5', '绿色');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:14:11', 'api', '2017-12-21 16:14:11', null, '5e7db267068a43c4ba750e3cc706e99c', 'a0196306b7e649f7bf826dc0bae55c42', '红r');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:15:13', 'api', '2017-12-21 16:15:13', null, '65e98aa00e154b15b923b6c6a7f7bcf2', '2cc734f9500f4bb691a130de98ab5263', 'e');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, '89ec046615034c128942de255dadcdd5', '4cfb01fe7bc34ab5804340cce8b17184', '200');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:15:25', 'api', '2017-12-21 16:15:25', null, '9541933fec49417098b1109d5f8a5d7d', '7f25e26c0565424a9990b7c56fe46d13', 'q');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:15:33', 'api', '2017-12-21 16:15:33', null, 'a7f80ea31d7049aaa533f1834845920d', 'b5dda59d43f54b519113846d1e3d10f5', 'w');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 18:29:13', 'api', '2017-12-20 18:29:13', null, 'aaccbf95216145e08ba2c979bdc0761e', '403a41a3288e412ba7460192fd05c625', '绿色');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, 'ad33d7c9f8814bc8ada5b8508c17afaa', '3f55cc1f7744427493e49a8d79b41ef5', '黑色');
INSERT INTO `product_property_value_t` VALUES ('2017-12-21 16:14:46', 'api', '2017-12-21 16:14:46', null, 'c84e48d7f72d4b4796e5d935b65de313', '85825bee8a104321ae4c05dfb2133da1', '20');
INSERT INTO `product_property_value_t` VALUES ('2018-01-21 15:37:26', 'api', '2018-01-21 15:37:26', null, 'ccef5cae2d804c05819a39edfc190cf1', '9c015b37e0174d9582ed280d408e0d94', '887');
INSERT INTO `product_property_value_t` VALUES ('2018-01-21 15:37:26', 'api', '2018-01-21 15:37:26', null, 'd408469c17ae4c788ec4dda646bb8a31', '9c015b37e0174d9582ed280d408e0d94', '885');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, 'dbd48ce0a48b4a21b2e3f0c41cc89327', 'e5b9ca21c8ec40e793d7f29ba2be2912', '东厂');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, 'f13041cdcc5b4d1a8d0bd490dada87ac', '4cfb01fe7bc34ab5804340cce8b17184', '400');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 17:48:25', 'api', '2017-12-20 17:48:24', null, 'f30edfdf996c4d58acaab07178962da5', '4cfb01fe7bc34ab5804340cce8b17184', '600');
INSERT INTO `product_property_value_t` VALUES ('2017-12-20 18:29:13', 'api', '2017-12-20 18:29:13', null, 'fae9dbb2e2bd4d59b08734d9ba24f501', '403a41a3288e412ba7460192fd05c625', '黑色');
INSERT INTO `product_property_value_t` VALUES ('2018-01-21 15:37:26', 'api', '2018-01-21 15:37:26', null, 'fddfb553b6b14f97859be877bba65e5c', 'fc6ab27581c2407ba513ef90ee82438f', 'i5');
INSERT INTO `product_property_value_t` VALUES ('2018-01-21 15:37:26', 'api', '2018-01-21 15:37:26', null, 'fe703cf048e84e438c8582f2d80e972b', 'fc6ab27581c2407ba513ef90ee82438f', 'i7');

-- ----------------------------
-- Table structure for product_store_item_t
-- ----------------------------
DROP TABLE IF EXISTS `product_store_item_t`;
CREATE TABLE `product_store_item_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `product_store_id` char(32) NOT NULL COMMENT '产品库存id',
  `property_name` varchar(50) NOT NULL COMMENT '属性名称',
  `property_value` varchar(50) NOT NULL COMMENT '属性值',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5112` (`product_store_id`),
  CONSTRAINT `FK_Reference_5112` FOREIGN KEY (`product_store_id`) REFERENCES `product_store_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存属性';

-- ----------------------------
-- Records of product_store_item_t
-- ----------------------------
INSERT INTO `product_store_item_t` VALUES ('03cbed1025fa4f31bfe77103d9ffdce1', 'api', '2018-01-21 15:37:50', null, null, '91cadb430a794f97b4a76134e9c1f8a8', '型号', '885');
INSERT INTO `product_store_item_t` VALUES ('092047041dae4a489020aa39637633b3', 'api', '2017-12-20 19:15:39', null, null, 'c9e216df900b40f6a4031c6df8441078', '容量', '200');
INSERT INTO `product_store_item_t` VALUES ('30c2ca7acba4431bb0db13fdce76144c', 'api', '2017-12-20 19:10:49', null, null, '46a17b049c584505be9893f29cc84d2b', '厂家', '东厂');
INSERT INTO `product_store_item_t` VALUES ('378bddc112b84b4c8be6d28a09359c78', 'api', '2017-12-26 16:16:23', null, null, '84e31501855549b491ca33a1c128871e', 'd', 'd');
INSERT INTO `product_store_item_t` VALUES ('3a6a596766a94a46ab80f2d8251acf86', 'api', '2018-01-21 15:37:50', null, null, '91cadb430a794f97b4a76134e9c1f8a8', 'cup', 'i7');
INSERT INTO `product_store_item_t` VALUES ('6b0d73f74f6a4652a432aedcad7fa811', 'api', '2017-12-20 19:15:39', null, null, 'c9e216df900b40f6a4031c6df8441078', '颜色', '黄色');
INSERT INTO `product_store_item_t` VALUES ('90a755b71e8f48039292f215ce63b08b', 'api', '2017-12-20 19:10:47', null, null, '46a17b049c584505be9893f29cc84d2b', '容量', '300');
INSERT INTO `product_store_item_t` VALUES ('e992c77cc7864ff4b4d1c109d3ecd26d', 'api', '2017-12-20 19:15:39', null, null, 'c9e216df900b40f6a4031c6df8441078', '厂家', '东厂');
INSERT INTO `product_store_item_t` VALUES ('f8f4b0ffe9104a67b079a3195c21406e', 'api', '2017-12-20 19:10:46', null, null, '46a17b049c584505be9893f29cc84d2b', '颜色', '绿色');
INSERT INTO `product_store_item_t` VALUES ('fb41cc8720bd400ab717dfe968539948', 'api', '2017-12-26 16:29:36', null, null, 'd9e3e95a96f74e8b9bc87928aee79bbe', 'w', 'w');

-- ----------------------------
-- Table structure for product_store_t
-- ----------------------------
DROP TABLE IF EXISTS `product_store_t`;
CREATE TABLE `product_store_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `amount` int(11) NOT NULL COMMENT '数量',
  `store_addr` varchar(100) NOT NULL COMMENT '存放地点',
  `brand` varchar(50) NOT NULL COMMENT '品牌',
  `product_type_id` char(32) NOT NULL COMMENT '产品id',
  `product_dealer_id` char(32) NOT NULL COMMENT '经销商id',
  `prize` int(11) NOT NULL COMMENT '价格',
  `content` varchar(200) DEFAULT NULL COMMENT '备注',
  `image` varchar(50) DEFAULT NULL COMMENT '图片',
  `creator` varchar(32) DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `model` varchar(150) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_31` (`product_dealer_id`),
  KEY `FK_Reference_411` (`product_type_id`),
  CONSTRAINT `FK_Reference_31` FOREIGN KEY (`product_dealer_id`) REFERENCES `product_dealer_t` (`id`),
  CONSTRAINT `FK_Reference_411` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品库存';

-- ----------------------------
-- Records of product_store_t
-- ----------------------------
INSERT INTO `product_store_t` VALUES ('46a17b049c584505be9893f29cc84d2b', '29', '北京农科大厦', '仁德', '17a298861b0c4f22b23aa66ba16bee6b', 'd5949813fd0f4be685f09332bdf62f45', '15', '备注', null, 'api', 'api', '2017-12-27 16:27:18', '2017-12-20 19:10:45', null);
INSERT INTO `product_store_t` VALUES ('84e31501855549b491ca33a1c128871e', '0', '北京', '啊啊啊', 'c49ea4f4119d4e468691464f376f7ed4', '5164c0642b56428d9a68241cef503141', '12', '', null, 'api', 'api', '2017-12-27 17:24:53', '2017-12-26 16:16:23', null);
INSERT INTO `product_store_t` VALUES ('91cadb430a794f97b4a76134e9c1f8a8', '111', '212', '1212', '4b6ba40a46714cd7bb782499207d84fe', 'd5949813fd0f4be685f09332bdf62f45', '121', '21', null, 'api', null, null, '2018-01-21 15:37:50', null);
INSERT INTO `product_store_t` VALUES ('c9e216df900b40f6a4031c6df8441078', '435', '1', '212', '17a298861b0c4f22b23aa66ba16bee6b', 'd5949813fd0f4be685f09332bdf62f45', '12', '12', 'b53950ffa6524e289bec380c78852b1a.jpg', 'api', 'api', '2017-12-27 17:24:58', '2017-12-20 19:15:39', null);
INSERT INTO `product_store_t` VALUES ('d9e3e95a96f74e8b9bc87928aee79bbe', '1889', '12', '12', '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', '5164c0642b56428d9a68241cef503141', '15', '12', null, 'api', 'api', '2017-12-27 17:24:53', '2017-12-26 16:29:36', null);

-- ----------------------------
-- Table structure for product_type_t
-- ----------------------------
DROP TABLE IF EXISTS `product_type_t`;
CREATE TABLE `product_type_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00',
  `type_name` varchar(100) DEFAULT NULL COMMENT '类型名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='产品类型表';

-- ----------------------------
-- Records of product_type_t
-- ----------------------------
INSERT INTO `product_type_t` VALUES ('17a298861b0c4f22b23aa66ba16bee6b', 'api', '2017-12-20 17:48:24', 'api', '2017-12-20 17:48:24', '杯子-黄色-绿色-黑色-200-400-600-东厂');
INSERT INTO `product_type_t` VALUES ('2622bef326ef4333b7699e5184efaeaf', 'api', '2017-12-21 16:15:25', 'api', '2017-12-21 16:15:25', 'Q-q');
INSERT INTO `product_type_t` VALUES ('4b6ba40a46714cd7bb782499207d84fe', 'api', '2018-01-21 15:37:26', null, null, '笔记本');
INSERT INTO `product_type_t` VALUES ('4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', 'api', '2017-12-21 16:15:33', 'api', '2017-12-21 16:15:33', 'W-w');
INSERT INTO `product_type_t` VALUES ('702c2046fe214faa8913fea606de9cbf', 'api', '2017-12-21 16:14:57', 'api', '2017-12-21 16:14:57', 'C-c');
INSERT INTO `product_type_t` VALUES ('702d0ced2a254b98980377cd78021a14', 'api', '2017-12-21 16:21:45', 'api', '2017-12-21 16:21:45', 'A-a');
INSERT INTO `product_type_t` VALUES ('71dd6f0797524b81a4c927ae25dbc0d8', 'api', '2017-12-20 18:29:13', 'api', '2017-12-20 18:29:13', '尺子-50-100-绿色-黑色');
INSERT INTO `product_type_t` VALUES ('7f6550a0775c4edb8bf6a4461fd01788', 'api', '2017-12-21 16:14:46', 'api', '2017-12-21 16:14:46', 'B-10-20');
INSERT INTO `product_type_t` VALUES ('c49ea4f4119d4e468691464f376f7ed4', 'api', '2017-12-21 16:15:05', 'api', '2017-12-21 16:15:05', 'D-d');
INSERT INTO `product_type_t` VALUES ('d1ce731ecf1741959e70b8da43a5ace1', 'api', '2017-12-22 14:11:58', 'api', '2017-12-21 16:14:11', 'A-红-r-黑-b');
INSERT INTO `product_type_t` VALUES ('e04019f6fa434c00aa85456098820aa7', 'api', '2017-12-21 16:15:13', 'api', '2017-12-21 16:15:13', 'E-e');

-- ----------------------------
-- Table structure for program_cost_t
-- ----------------------------
DROP TABLE IF EXISTS `program_cost_t`;
CREATE TABLE `program_cost_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_id` char(32) DEFAULT NULL COMMENT '项目',
  `total_amount` bigint(20) DEFAULT NULL COMMENT '总经费',
  `total_cost` bigint(20) DEFAULT NULL COMMENT '已支出经费',
  `last_cost` bigint(20) DEFAULT NULL COMMENT '本次支出',
  `last_cost_date` date DEFAULT NULL COMMENT '本次支出时间',
  `unit` varchar(50) DEFAULT NULL COMMENT '单位',
  `type` int(11) DEFAULT NULL COMMENT '类别（1：技术成本；2：项目成本）',
  `add_user_id` char(32) DEFAULT NULL COMMENT '添加人',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_20` (`add_user_id`),
  KEY `FK_Reference_21` (`project_id`),
  CONSTRAINT `FK_Reference_20` FOREIGN KEY (`add_user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_21` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工程支出';

-- ----------------------------
-- Records of program_cost_t
-- ----------------------------

-- ----------------------------
-- Table structure for project_after_sale_t
-- ----------------------------
DROP TABLE IF EXISTS `project_after_sale_t`;
CREATE TABLE `project_after_sale_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `last_progress` varchar(200) DEFAULT NULL COMMENT '最新进展',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：正在进行；2：暂停；3：终止）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目售后表';

-- ----------------------------
-- Records of project_after_sale_t
-- ----------------------------

-- ----------------------------
-- Table structure for project_busniess_t
-- ----------------------------
DROP TABLE IF EXISTS `project_busniess_t`;
CREATE TABLE `project_busniess_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `buss_name` varchar(100) DEFAULT NULL COMMENT '业务名称',
  `unit` varchar(50) DEFAULT NULL COMMENT '甲方单位',
  `contact` varchar(20) DEFAULT NULL COMMENT '甲方联系人',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '联系电话',
  `salesman` varchar(20) DEFAULT NULL COMMENT '业务员',
  `contact_date` date DEFAULT NULL COMMENT '接洽时间',
  `last_progress` varchar(200) DEFAULT NULL COMMENT '最新进展',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：正在进行；2：暂停；3：终止）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `buss_content` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目商务表';

-- ----------------------------
-- Records of project_busniess_t
-- ----------------------------
INSERT INTO `project_busniess_t` VALUES ('6055362ed86f4a44818313b901851435', 'asd', 'asd', 'asd', 'asd', 'asd', '2018-01-09', 'd', '1', 'api', '2018-01-09 12:34:32', 'api', '2018-01-09 12:52:13', 'asd');

-- ----------------------------
-- Table structure for project_enter_info_t
-- ----------------------------
DROP TABLE IF EXISTS `project_enter_info_t`;
CREATE TABLE `project_enter_info_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  `enter_time` date DEFAULT NULL COMMENT '入账时间',
  `amount` int(11) DEFAULT NULL COMMENT '金额',
  `pay_info` int(11) DEFAULT NULL COMMENT '支付情况',
  `bill_info` int(11) DEFAULT NULL COMMENT '发票情况',
  `dfuty_free` int(11) DEFAULT NULL COMMENT '免税认证',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_43` (`project_id`),
  CONSTRAINT `FK_Reference_43` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目入账情况';

-- ----------------------------
-- Records of project_enter_info_t
-- ----------------------------
INSERT INTO `project_enter_info_t` VALUES ('38e2ee24e427451e8dc4be3179af43c5', 'c844e383844d45b89f0e97a4989989ff', '2017-11-22', '111111', '0', '1', '0', 'api', '2017-11-26 10:26:36', null, null);
INSERT INTO `project_enter_info_t` VALUES ('51b129ce61524372b2d80b4457332037', '263ef7665c0a42e4acfbfaac865622ca', '2017-11-26', '5000', '1', '1', '1', 'api', '2017-11-26 10:47:03', null, null);
INSERT INTO `project_enter_info_t` VALUES ('f39c05a57d474c28b855f729b34650c8', '263ef7665c0a42e4acfbfaac865622ca', '2017-11-21', '300', '0', null, '0', 'api', '2017-11-26 10:47:03', null, null);

-- ----------------------------
-- Table structure for project_file_t
-- ----------------------------
DROP TABLE IF EXISTS `project_file_t`;
CREATE TABLE `project_file_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `buss_id` char(32) DEFAULT NULL COMMENT '业务id',
  `type` int(11) DEFAULT NULL COMMENT '类型（1：项目商务；2：项目实施；3：项目售后；4：产品售后）',
  `file_name` varchar(200) DEFAULT NULL COMMENT '附件名称',
  `file_path` varchar(200) DEFAULT NULL COMMENT '附件地址',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `file_type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目附件表';

-- ----------------------------
-- Records of project_file_t
-- ----------------------------
INSERT INTO `project_file_t` VALUES ('040f93a603644f47b143e086a5b78558', 'e21cd97d749d45d681ab023609a1206b', null, null, null, 'api', '2018-01-09 12:54:06', null, null, '');
INSERT INTO `project_file_t` VALUES ('d75a37c9f2f645b1b6b6fad7fb972bdc', '6055362ed86f4a44818313b901851435', null, null, null, 'api', '2018-01-09 12:34:32', null, null, '');

-- ----------------------------
-- Table structure for project_startup_t
-- ----------------------------
DROP TABLE IF EXISTS `project_startup_t`;
CREATE TABLE `project_startup_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `end_date` date DEFAULT NULL COMMENT '截止日期',
  `charge` varchar(20) DEFAULT NULL COMMENT '负责人',
  `last_progress` varchar(200) DEFAULT NULL COMMENT '最新进展',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：正在进行；2：暂停；3：终止）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `project_id` char(32) NOT NULL,
  `user_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKECA99D8C4CD7B278` (`project_id`),
  KEY `FKECA99D8CB2777AC` (`user_id`),
  CONSTRAINT `FKECA99D8CB2777AC` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FKECA99D8C4CD7B278` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='项目实施表';

-- ----------------------------
-- Records of project_startup_t
-- ----------------------------
INSERT INTO `project_startup_t` VALUES ('e21cd97d749d45d681ab023609a1206b', null, '2018-01-08', null, 'asd', '1', 'api', '2018-01-09 12:54:06', 'api', '2018-01-09 12:54:17', '263ef7665c0a42e4acfbfaac865622ca', '55e0c7400ea54b33921c4e908ea61c09');

-- ----------------------------
-- Table structure for project_t
-- ----------------------------
DROP TABLE IF EXISTS `project_t`;
CREATE TABLE `project_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `financial_number` varchar(50) DEFAULT NULL COMMENT '财务编号',
  `resource` varchar(50) DEFAULT NULL COMMENT '项目来源',
  `project_name` varchar(100) DEFAULT NULL COMMENT '项目名称',
  `user_id` char(32) DEFAULT NULL COMMENT '项目负责人',
  `unit` int(11) DEFAULT NULL COMMENT '承担单位（1：信息中心；2：派得伟业）',
  `begin_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `total_money` double(20,0) DEFAULT NULL COMMENT '经费总额',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `project_type` int(11) DEFAULT NULL,
  `group_id` char(32) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `file_number` varchar(30) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `depute_unit` varchar(50) DEFAULT NULL COMMENT '委托单位',
  `remark` varchar(200) DEFAULT NULL,
  `fund_money` double(255,0) DEFAULT NULL COMMENT '到账经费',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_2` (`user_id`),
  KEY `FKCAA9F4CE75B66DBD` (`group_id`),
  CONSTRAINT `FKCAA9F4CE75B66DBD` FOREIGN KEY (`group_id`) REFERENCES `user_group_t` (`id`),
  CONSTRAINT `FK_Reference_2` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of project_t
-- ----------------------------
INSERT INTO `project_t` VALUES ('263ef7665c0a42e4acfbfaac865622ca', 'HXKT2017', null, '横向课题', '55e0c7400ea54b33921c4e908ea61c09', '1', '2017-10-29', '2017-11-30', '5000000', null, null, 'api', '2017-11-26 10:47:03', '1', '9da7472fe87d4f349065c9e7d5e82893', '1', '1111', '0', '英泰', '', null);
INSERT INTO `project_t` VALUES ('49f4104393604a00925f6072187620b1', 'CAIWU52000', '农业发展部', '农业智能感知', '68ff9976be70420d83e48fc536cf1fd2', '2', '2017-11-10', '2017-11-10', '500', null, null, 'api', '2017-11-26 09:09:57', '2', 'f7960470e1674b68a1a10d99cd2b0f12', '0', 'DA360000', '0', null, null, null);
INSERT INTO `project_t` VALUES ('c844e383844d45b89f0e97a4989989ff', 'HX', null, '横向可', '55e0c7400ea54b33921c4e908ea61c09', '1', '2017-11-06', '2017-11-14', '11111', 'api', '2017-11-26 10:26:36', 'api', '2017-11-26 10:59:13', '1', '9da7472fe87d4f349065c9e7d5e82893', '0', '11', '1', '111', null, null);

-- ----------------------------
-- Table structure for purchase_apply_t
-- ----------------------------
DROP TABLE IF EXISTS `purchase_apply_t`;
CREATE TABLE `purchase_apply_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `product_name` varchar(100) NOT NULL COMMENT '产品名称',
  `purpose` varchar(100) NOT NULL COMMENT '用途',
  `apply_time` datetime NOT NULL COMMENT '申请时间',
  `end_time` datetime DEFAULT NULL COMMENT '截止时间',
  `purchase_status` int(11) DEFAULT NULL COMMENT '采购状态（1：进行中，2：采购完成）',
  `status` int(11) NOT NULL COMMENT '状态（0：未提交审核；1：待审核；2：一审通过；3：主任审核通过；）',
  `audit_msg` varchar(100) DEFAULT NULL COMMENT '审核意见',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购申请表';

-- ----------------------------
-- Records of purchase_apply_t
-- ----------------------------
INSERT INTO `purchase_apply_t` VALUES ('1713dc74afd143178b31d097ef49fe4a', 'asd', 'asd', '2018-01-07 20:25:27', null, null, '0', null, 'api', '2018-01-07 20:25:29', null, null);
INSERT INTO `purchase_apply_t` VALUES ('48a541f89c634d57bb1119fc81ceb956', '房屋搭建', '阿斯达撒旦', '2017-12-22 14:54:54', '2017-12-24 11:44:08', '2', '3', 'tongguo', 'api', '2017-12-22 14:54:54', 'api', '2017-12-24 11:44:08');
INSERT INTO `purchase_apply_t` VALUES ('a354f06adcd340579d3c365cb4c1aaeb', '购买投影仪111', '1111', '2018-01-08 00:00:00', '2018-01-24 00:00:00', null, '0', null, 'api', '2018-01-21 15:32:29', null, null);
INSERT INTO `purchase_apply_t` VALUES ('a916f61fa553407f9ae38ce179d8452c', 'ttttt', 'ttt', '2018-01-21 15:27:38', '2018-01-31 00:00:00', null, '0', null, 'api', '2018-01-21 15:27:38', null, null);
INSERT INTO `purchase_apply_t` VALUES ('addaa7de92414c01abe913712b68ec47', 'asd', 'asd', '2018-01-07 20:23:58', null, null, '0', null, 'api', '2018-01-07 20:23:58', null, null);
INSERT INTO `purchase_apply_t` VALUES ('e3740022e01e4e3297a97a78146b696e', 'asd', 'asd', '2018-01-07 20:24:16', null, null, '0', null, 'api', '2018-01-07 20:24:16', null, null);

-- ----------------------------
-- Table structure for purchase_audit_log_t
-- ----------------------------
DROP TABLE IF EXISTS `purchase_audit_log_t`;
CREATE TABLE `purchase_audit_log_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `audit_user_id` char(32) NOT NULL COMMENT '审核人',
  `status` int(11) NOT NULL COMMENT '审核状态（1：通过；2：不通过）',
  `audit_msg` varchar(100) NOT NULL COMMENT '审核意见',
  `purchase_apply_id` char(32) NOT NULL COMMENT '采购申请id',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_21219` (`purchase_apply_id`),
  KEY `FK61DD4697604AF48` (`audit_user_id`),
  CONSTRAINT `FK61DD4697604AF48` FOREIGN KEY (`audit_user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_21219` FOREIGN KEY (`purchase_apply_id`) REFERENCES `purchase_apply_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购审核历史流程';

-- ----------------------------
-- Records of purchase_audit_log_t
-- ----------------------------
INSERT INTO `purchase_audit_log_t` VALUES ('0a2874b2da5c468a9d8a19fba3ef5a00', '68ff9976be70420d83e48fc536cf1fd2', '1', 'tongguo', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-24 10:09:20', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('4675fc06448244ae88df9f001bc25ea2', 'c9956b56fd1b4cc3a7c8156e9e110387', '1', '4321', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-24 10:08:41', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('4a6b85ef22d04ff2ae147620f54e84c9', '68ff9976be70420d83e48fc536cf1fd2', '2', 'purchaseApply', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-22 17:44:36', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('cc6a1f571bdb4850a500c55adf6b923a', '68ff9976be70420d83e48fc536cf1fd2', '1', 'purchaseApply', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-22 17:44:11', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('d76d9756a8844917830678c7aeb28ee1', '68ff9976be70420d83e48fc536cf1fd2', '1', '1', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-24 10:05:31', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('ee48b232d3b7472d9a1b86551008ee0e', '68ff9976be70420d83e48fc536cf1fd2', '1', '333', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-22 17:44:54', null, null);
INSERT INTO `purchase_audit_log_t` VALUES ('fc97959bfba04ba4adb5dae447eeb5a0', '68ff9976be70420d83e48fc536cf1fd2', '1', '通过', '48a541f89c634d57bb1119fc81ceb956', 'api', '2017-12-22 17:45:49', null, null);

-- ----------------------------
-- Table structure for purchase_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `purchase_detail_t`;
CREATE TABLE `purchase_detail_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `purchase_apply_id` char(32) NOT NULL COMMENT '采购申请id',
  `product_type_id` char(32) NOT NULL COMMENT '产品id',
  `model` varchar(100) DEFAULT NULL COMMENT '规格型号',
  `manufacturer` varchar(100) DEFAULT NULL COMMENT '生产厂家',
  `amount` int(11) NOT NULL COMMENT '数量',
  `remark` varchar(100) DEFAULT NULL COMMENT '备注',
  `image` varchar(100) DEFAULT NULL COMMENT '图片附件地址',
  `creator` varchar(32) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `modifier` varchar(32) DEFAULT NULL,
  `modify_time` datetime DEFAULT NULL,
  `status` int(11) DEFAULT NULL COMMENT '状态（1：购买中；2：已到货；3：取消）',
  `product_store_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_327` (`purchase_apply_id`),
  KEY `FK_Reference_138` (`product_type_id`),
  KEY `FK1560918422CB83E6` (`product_store_id`),
  CONSTRAINT `FK1560918422CB83E6` FOREIGN KEY (`product_store_id`) REFERENCES `product_store_t` (`id`),
  CONSTRAINT `FK_Reference_138` FOREIGN KEY (`product_type_id`) REFERENCES `product_type_t` (`id`),
  CONSTRAINT `FK_Reference_327` FOREIGN KEY (`purchase_apply_id`) REFERENCES `purchase_apply_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='采购明细';

-- ----------------------------
-- Records of purchase_detail_t
-- ----------------------------
INSERT INTO `purchase_detail_t` VALUES ('1578a385dba34b3eb7d590583f1bc1e6', '48a541f89c634d57bb1119fc81ceb956', '17a298861b0c4f22b23aa66ba16bee6b', '容量-200颜色-黄色厂家-东厂', '订单2', '211', '订单', null, 'api', '2017-12-22 16:13:39', 'api', '2017-12-24 11:52:00', '2', 'c9e216df900b40f6a4031c6df8441078');
INSERT INTO `purchase_detail_t` VALUES ('3af1e1e842c24d91baa8728d7708ae53', '48a541f89c634d57bb1119fc81ceb956', '17a298861b0c4f22b23aa66ba16bee6b', '容量-200颜色-黄色厂家-东厂', '订单23', '222', '订单的', null, 'api', '2017-12-22 16:13:39', 'api', '2017-12-24 11:52:02', '3', 'c9e216df900b40f6a4031c6df8441078');
INSERT INTO `purchase_detail_t` VALUES ('3c69c25a849e415cb8397c50d5ac3c1d', 'e3740022e01e4e3297a97a78146b696e', '17a298861b0c4f22b23aa66ba16bee6b', '颜色-绿色容量-300厂家-东厂', 'asd', '111', 'aasd', null, 'api', '2018-01-07 20:24:16', null, null, null, '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `purchase_detail_t` VALUES ('4ccdd4cd28d94600bfb4142942946a3c', 'a354f06adcd340579d3c365cb4c1aaeb', 'c49ea4f4119d4e468691464f376f7ed4', 'd-d', '111', '11', '11', null, 'api', '2018-01-21 15:32:29', null, null, null, '84e31501855549b491ca33a1c128871e');
INSERT INTO `purchase_detail_t` VALUES ('6e8348bec88b4d8b9ad4446454c9a447', '48a541f89c634d57bb1119fc81ceb956', '17a298861b0c4f22b23aa66ba16bee6b', '厂家-东厂容量-300颜色-绿色', '订单', '2', '11', null, 'api', '2017-12-22 16:13:39', 'api', '2017-12-24 11:52:04', '3', '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `purchase_detail_t` VALUES ('825512db054945928e0400f6bc991a6e', 'a916f61fa553407f9ae38ce179d8452c', 'c49ea4f4119d4e468691464f376f7ed4', 'd-d', 'asd', '12', '12', null, 'api', '2018-01-21 15:27:38', null, null, null, '84e31501855549b491ca33a1c128871e');
INSERT INTO `purchase_detail_t` VALUES ('86d2c91895a04a0588cdcd53015767fe', '48a541f89c634d57bb1119fc81ceb956', '17a298861b0c4f22b23aa66ba16bee6b', '厂家-东厂容量-300颜色-绿色', 'asd', '25', '阿萨德', '5dbc695ad6e744cb88d03de1003ff927.jpg', 'api', '2017-12-22 16:13:39', 'api', '2017-12-24 11:52:06', '3', '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `purchase_detail_t` VALUES ('dfdc3848162f4b5e883dafe269e28aa4', '1713dc74afd143178b31d097ef49fe4a', '17a298861b0c4f22b23aa66ba16bee6b', '颜色-绿色容量-300厂家-东厂', 'asd', '111', '111', null, 'api', '2018-01-07 20:25:36', null, null, null, '46a17b049c584505be9893f29cc84d2b');
INSERT INTO `purchase_detail_t` VALUES ('e0ed0a10dad740e38ea07437366196a4', 'addaa7de92414c01abe913712b68ec47', '4d6f9dd59b8d4ec1a4a08a1f16ffd6f8', 'w-w', 'asd', '12', 'asd', '763d7c629cd5460bb02f065ada813c0e.doc', 'api', '2018-01-07 20:23:58', null, null, null, 'd9e3e95a96f74e8b9bc87928aee79bbe');

-- ----------------------------
-- Table structure for quota_t
-- ----------------------------
DROP TABLE IF EXISTS `quota_t`;
CREATE TABLE `quota_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '添加人',
  `quota_type` int(11) DEFAULT NULL COMMENT '指标类型（1：文章；2：专利；3：标准；4：检测报告；5：产品；）',
  `title` varchar(200) DEFAULT NULL COMMENT '标题',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `project_id` char(32) DEFAULT NULL COMMENT '项目id',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_5` (`project_id`),
  KEY `FK_Reference_7` (`user_id`),
  CONSTRAINT `FK_Reference_5` FOREIGN KEY (`project_id`) REFERENCES `project_t` (`id`),
  CONSTRAINT `FK_Reference_7` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指标表';

-- ----------------------------
-- Records of quota_t
-- ----------------------------

-- ----------------------------
-- Table structure for reimbursement_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `reimbursement_detail_t`;
CREATE TABLE `reimbursement_detail_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `apply_id` char(32) DEFAULT NULL,
  `detail` varchar(50) DEFAULT NULL,
  `amount` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK36A372D4A60E1AE` (`apply_id`),
  KEY `FK36A372DCA43F246` (`add_user`),
  CONSTRAINT `FK36A372DCA43F246` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of reimbursement_detail_t
-- ----------------------------
INSERT INTO `reimbursement_detail_t` VALUES ('140ee64cae9e42f9929a4a33721c634b', 'api', '2017-11-26 16:09:46', null, null, '68ff9976be70420d83e48fc536cf1fd2', '18829d76fbca4dcdb76f9ec52759e1d3', '111', '111');

-- ----------------------------
-- Table structure for remuneration_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `remuneration_detail_t`;
CREATE TABLE `remuneration_detail_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `add_user` char(32) DEFAULT NULL COMMENT '添加人',
  `name` varchar(255) DEFAULT NULL,
  `id_card` varchar(20) DEFAULT NULL,
  `bank_card` varchar(20) DEFAULT NULL,
  `bank_name` varchar(50) DEFAULT NULL,
  `all_amount` int(11) DEFAULT NULL,
  `tax_amount` int(11) DEFAULT NULL,
  `pay_amount` int(11) DEFAULT NULL,
  `apply_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKAD15EAB0B44E0FB7` (`apply_id`),
  KEY `FKAD15EAB0CA43F246` (`add_user`),
  CONSTRAINT `FKAD15EAB0B44E0FB7` FOREIGN KEY (`apply_id`) REFERENCES `apply_remuneration_t` (`id`),
  CONSTRAINT `FKAD15EAB0CA43F246` FOREIGN KEY (`add_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of remuneration_detail_t
-- ----------------------------
INSERT INTO `remuneration_detail_t` VALUES ('0df48b8da0e641c4a8cd900edf080576', 'api', '2018-01-01 22:08:38', null, null, '68ff9976be70420d83e48fc536cf1fd2', 'L', '22222222222222', '6325252525252222', '工商银行', '8000', '0', '7900', '99a808f4c4fe438b92dc4162166117a2');
INSERT INTO `remuneration_detail_t` VALUES ('11969538a0374b179fd0f8b5552da454', 'api', '2018-01-01 22:08:38', null, null, '68ff9976be70420d83e48fc536cf1fd2', 'L', '220323198910152525', '622020805001756235', '工商银行', '800', '0', '800', '99a808f4c4fe438b92dc4162166117a2');

-- ----------------------------
-- Table structure for repair_record_t
-- ----------------------------
DROP TABLE IF EXISTS `repair_record_t`;
CREATE TABLE `repair_record_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `product_name` varchar(100) DEFAULT NULL COMMENT '产品名称',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `unit` varchar(50) DEFAULT NULL COMMENT '返修单位',
  `production_date` date DEFAULT NULL COMMENT '生产日期',
  `process_log` varchar(500) DEFAULT NULL COMMENT '过程记录',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='返修记录表';

-- ----------------------------
-- Records of repair_record_t
-- ----------------------------
INSERT INTO `repair_record_t` VALUES ('0af97be259014c6fa315b8e425eca5f5', '二氧化碳检查仪', '1', '北京第三医院', '2017-06-25', '现场排查检测', '2017-07-27', 'api', '2017-07-30 14:01:33', null, null);
INSERT INTO `repair_record_t` VALUES ('727d41a30db34d8fb3eb11d2e54da81d', '叶绿素检测仪', '50', '移动科技', '2017-07-30', '叶绿素检测仪叶绿素检测仪叶绿素检测仪', '备注', 'api', '2017-07-30 13:58:45', 'api', '2017-07-30 14:00:43');

-- ----------------------------
-- Table structure for role_t
-- ----------------------------
DROP TABLE IF EXISTS `role_t`;
CREATE TABLE `role_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `role_name` varchar(20) DEFAULT NULL COMMENT '角色名称',
  `role_code` varchar(32) DEFAULT NULL COMMENT '角色代码',
  `role_desc` varchar(200) DEFAULT NULL COMMENT '角色描述',
  `status` int(11) DEFAULT NULL COMMENT '状态（0：启用；1：禁用）',
  `build_type` int(11) DEFAULT NULL COMMENT '创建类型（0：内置；1：新建）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='角色表';

-- ----------------------------
-- Records of role_t
-- ----------------------------
INSERT INTO `role_t` VALUES ('67f5b7d9e5c146f1b4e8dd953951ab7b', '办公室', '67f5b7d9e5c146f1b4e8dd953951ab7b', '办公室权限', '0', '1', 'api', '2017-10-29 15:33:01', 'api', '2018-01-21 15:28:39');
INSERT INTO `role_t` VALUES ('7f87ef95e3a54d84a49db9d7aa50d955', 'ceshi', '7f87ef95e3a54d84a49db9d7aa50d955', 'cesi', '0', '1', 'api', '2017-07-16 00:10:34', 'api', '2018-01-10 13:15:05');
INSERT INTO `role_t` VALUES ('96e79218965eb72c92a549dd5a330112', '超级管理员', 'supperadmin', '具有所有权限', '0', '0', 'houjw', '2017-07-05 22:43:14', null, null);

-- ----------------------------
-- Table structure for soft_t
-- ----------------------------
DROP TABLE IF EXISTS `soft_t`;
CREATE TABLE `soft_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `soft_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `finish_user` char(32) DEFAULT NULL COMMENT '完成人',
  `unit` int(11) DEFAULT NULL COMMENT '单位（1：信心中心；2：装备中心）',
  `register_number` varchar(50) DEFAULT NULL COMMENT '登记号',
  `status` int(11) DEFAULT NULL COMMENT '状态',
  `soft_date` date DEFAULT NULL COMMENT '时间',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_25` (`finish_user`),
  CONSTRAINT `FK_Reference_25` FOREIGN KEY (`finish_user`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='软著表';

-- ----------------------------
-- Records of soft_t
-- ----------------------------

-- ----------------------------
-- Table structure for startup_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `startup_detail_t`;
CREATE TABLE `startup_detail_t` (
  `id` char(32) NOT NULL,
  `last_progress` varchar(200) DEFAULT NULL COMMENT '最新进展',
  `startup_id` char(32) NOT NULL COMMENT '商务id',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `detail` varchar(200) DEFAULT NULL COMMENT '细节',
  `note_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK8425BF88DF49E4E8` (`startup_id`),
  CONSTRAINT `FK8425BF88DF49E4E8` FOREIGN KEY (`startup_id`) REFERENCES `project_startup_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of startup_detail_t
-- ----------------------------
INSERT INTO `startup_detail_t` VALUES ('98afc958145948959050db7831c133ae', 'asd', 'e21cd97d749d45d681ab023609a1206b', 'api', '2018-01-09 12:54:17', null, null, 'asd', '2018-01-08 00:00:00');

-- ----------------------------
-- Table structure for storage_item_t
-- ----------------------------
DROP TABLE IF EXISTS `storage_item_t`;
CREATE TABLE `storage_item_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `apply_storage_id` varchar(32) DEFAULT NULL COMMENT '库存id',
  `goods_number` varchar(50) DEFAULT NULL COMMENT '编号',
  `goods_name` varchar(50) DEFAULT NULL COMMENT '名称',
  `specification` varchar(50) DEFAULT NULL COMMENT '规格',
  `unit` char(10) DEFAULT NULL COMMENT '单位',
  `amount` int(11) DEFAULT NULL COMMENT '数量',
  `sign_price` int(11) DEFAULT NULL COMMENT '单价',
  `price` int(11) DEFAULT NULL COMMENT '金额',
  `remark` varchar(200) DEFAULT NULL COMMENT '备注',
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  PRIMARY KEY (`id`),
  KEY `FKBC41188CBE1AB9B5` (`apply_storage_id`),
  CONSTRAINT `FKBC41188CBE1AB9B5` FOREIGN KEY (`apply_storage_id`) REFERENCES `apply_storage_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='仓库条目';

-- ----------------------------
-- Records of storage_item_t
-- ----------------------------
INSERT INTO `storage_item_t` VALUES ('ba6d6de7bb05442fbecf211664e5e35a', '19d06fd826d64295a2cffd7852aa7501', '12012', '橡胶管', 'x-n20', '英泰伟业', '2', '2', '4', '无', 'api', '2017-12-31 11:29:54', null, null);
INSERT INTO `storage_item_t` VALUES ('bd387c6e4c2645d6aad423ceb4c25e7f', '19d06fd826d64295a2cffd7852aa7501', '11111', '晶体管', 'jtg110', '派得伟业', '50', '50', '2500', '', 'api', '2017-12-31 11:29:54', null, null);
INSERT INTO `storage_item_t` VALUES ('e2aa8594f0c04195805162df2e0e4c56', '19d06fd826d64295a2cffd7852aa7501', '12023', '试管', 'sg1-10', '科技', '5', '50', '250', '无', 'api', '2017-12-31 11:29:54', null, null);

-- ----------------------------
-- Table structure for trval_detail_t
-- ----------------------------
DROP TABLE IF EXISTS `trval_detail_t`;
CREATE TABLE `trval_detail_t` (
  `id` char(32) NOT NULL,
  `creator` varchar(32) DEFAULT NULL COMMENT '创建者',
  `create_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '记录创建时间',
  `modifier` varchar(32) DEFAULT NULL COMMENT '最后修改者',
  `modify_time` timestamp NULL DEFAULT '0000-00-00 00:00:00' COMMENT '记录最后修改时间',
  `out_date` datetime DEFAULT NULL,
  `arrive_date` datetime DEFAULT NULL,
  `out_addr` varchar(50) DEFAULT NULL,
  `arrive_addr` varchar(50) DEFAULT NULL,
  `vehicle` varchar(20) DEFAULT NULL,
  `traffic_sum` int(11) DEFAULT NULL,
  `traffic_amount` int(11) DEFAULT NULL,
  `live_sum` int(11) DEFAULT NULL,
  `live_amount` int(11) DEFAULT NULL,
  `traffic_subsidy_days` int(11) DEFAULT NULL,
  `traffic_subsidy_amount` int(11) DEFAULT NULL,
  `food_subsidy_days` int(11) DEFAULT NULL,
  `food_subsidy_amount` int(11) DEFAULT NULL,
  `other_sum` int(11) DEFAULT NULL,
  `other_amount` int(11) DEFAULT NULL,
  `apply_id` char(32) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `FKD80874E2C5D5FE59` (`apply_id`),
  CONSTRAINT `FKD80874E2C5D5FE59` FOREIGN KEY (`apply_id`) REFERENCES `apply_trval_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of trval_detail_t
-- ----------------------------
INSERT INTO `trval_detail_t` VALUES ('b3671f4a051b4d6ea9a92f65e9131ce4', 'api', '2018-01-01 21:40:46', null, null, '2017-11-09 00:00:00', '2017-11-22 00:00:00', '上海', '北京', '火车', '1', '500', '1', '200', '1', '1', '2', '1501', '1', '1', 'cc7905fa59114f09a2e207ef594294be');

-- ----------------------------
-- Table structure for user_group_t
-- ----------------------------
DROP TABLE IF EXISTS `user_group_t`;
CREATE TABLE `user_group_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `group_name` varchar(30) DEFAULT NULL COMMENT '小组名称',
  `group_desc` varchar(200) DEFAULT NULL COMMENT '小组描述',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `parent_group_id` char(32) DEFAULT NULL COMMENT '父id',
  `icon` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='小组管理';

-- ----------------------------
-- Records of user_group_t
-- ----------------------------
INSERT INTO `user_group_t` VALUES ('00ec05211a284a8ea424d6fb020894c0', '111111111dddd', '11111111dddd', 'api', '2017-10-30 16:17:41', 'api', '2017-10-30 18:19:53', '9a18bc646b3c479aa0fe93e850553b21', null);
INSERT INTO `user_group_t` VALUES ('05b1bc23f07b4bae9ece53029e0c4fcd', '学术研究一部', '学术研究一部', 'api', '2017-10-30 09:51:53', null, null, 'f7960470e1674b68a1a10d99cd2b0f12', null);
INSERT INTO `user_group_t` VALUES ('16b5bda6b3cc4b23928ce47e14fc4813', '学术研究2部', '', 'api', '2017-10-30 09:52:01', null, null, 'f7960470e1674b68a1a10d99cd2b0f12', null);
INSERT INTO `user_group_t` VALUES ('1c15c3303d7046b2ba22415a3626c6c8', '2222', '2222', 'api', '2017-10-30 09:52:15', null, null, '05b1bc23f07b4bae9ece53029e0c4fcd', null);
INSERT INTO `user_group_t` VALUES ('30c8903a56294116a4ac90f4d3ee5b22', '硬件A', '硬件A', 'api', '2017-10-30 13:42:48', null, null, '9da7472fe87d4f349065c9e7d5e82893', null);
INSERT INTO `user_group_t` VALUES ('3656236e3666483a8577c967444a0834', '技术研究二部', '技术研究二部', 'api', '2017-07-15 12:15:19', null, null, 'f0e5a75516e9456bbf07699af5eaaf3d', 'icon-minus-sign');
INSERT INTO `user_group_t` VALUES ('3d3363e1d96b4b29bc7908b06f234bc3', '111111', '', 'api', '2017-10-30 09:52:09', null, null, '16b5bda6b3cc4b23928ce47e14fc4813', null);
INSERT INTO `user_group_t` VALUES ('55494490cb564479b4e1fb0ede9f373d', '软件4', '软件4', 'api', '2017-10-30 16:17:26', null, null, '3656236e3666483a8577c967444a0834', null);
INSERT INTO `user_group_t` VALUES ('71dfe48fb5c24290a2655668367a66ea', '123123', '123123', 'api', '2017-10-30 09:52:35', null, null, '1c15c3303d7046b2ba22415a3626c6c8', null);
INSERT INTO `user_group_t` VALUES ('8a4eb6f6c3c041618ee23d6697b9faab', 'ddd', ' 订单', 'api', '2017-10-30 18:51:56', null, null, '3d3363e1d96b4b29bc7908b06f234bc3', null);
INSERT INTO `user_group_t` VALUES ('8f8e8843fa0a4a67a0a2b61d4febbf24', '软件2部', '软件2部', 'api', '2017-07-24 18:37:34', null, null, 'eae465864c7241e8a59212d2584485e8', 'icon-minus-sign');
INSERT INTO `user_group_t` VALUES ('9a18bc646b3c479aa0fe93e850553b21', '3333', '3333', 'api', '2017-10-30 09:52:22', null, null, 'f7960470e1674b68a1a10d99cd2b0f12', null);
INSERT INTO `user_group_t` VALUES ('9da7472fe87d4f349065c9e7d5e82893', '硬件2', '硬件', null, null, 'api', '2017-10-30 18:51:38', '3656236e3666483a8577c967444a0834', 'icon-minus-sign');
INSERT INTO `user_group_t` VALUES ('bde598e0f4fd428ea1f558c3d87f3d19', '888', '8888', 'api', '2017-11-23 14:54:39', null, null, 'e221241912bc44178c104508c92fef72', null);
INSERT INTO `user_group_t` VALUES ('e221241912bc44178c104508c92fef72', '123', '123123', 'api', '2017-10-30 09:52:28', null, null, '3656236e3666483a8577c967444a0834', null);
INSERT INTO `user_group_t` VALUES ('eae465864c7241e8a59212d2584485e8', '软件', '软件', 'api', '2017-07-15 12:15:38', null, null, '3656236e3666483a8577c967444a0834', 'icon-minus-sign');
INSERT INTO `user_group_t` VALUES ('f0e5a75516e9456bbf07699af5eaaf3d', '农业自动化部', '农业自动化部', 'api', '2017-07-15 12:14:54', null, null, '', 'icon-th');
INSERT INTO `user_group_t` VALUES ('f7960470e1674b68a1a10d99cd2b0f12', '技术研究一部', '技术研究一部-修改', null, null, null, null, 'f0e5a75516e9456bbf07699af5eaaf3d', 'icon-minus-sign');

-- ----------------------------
-- Table structure for user_t
-- ----------------------------
DROP TABLE IF EXISTS `user_t`;
CREATE TABLE `user_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `name` varchar(10) DEFAULT NULL COMMENT '姓名',
  `sex` int(11) DEFAULT NULL COMMENT '性别（0：男；1：女）',
  `user_name` varchar(20) DEFAULT NULL COMMENT '登录名',
  `password` varchar(32) DEFAULT NULL COMMENT '登录密码',
  `user_group_name` varchar(30) DEFAULT NULL COMMENT '用户组名称',
  `user_type` int(11) DEFAULT NULL COMMENT '用户类型（0：学生；1：员工）',
  `build_type` int(11) DEFAULT NULL COMMENT '创建类型（0：内置；1：新建）',
  `use_status` int(11) DEFAULT NULL COMMENT '使用状态（0：启用；1：禁用）',
  `post` int(11) DEFAULT NULL COMMENT '岗位（0：主任；1：组长；2：职工）',
  `user_group_id` char(32) DEFAULT NULL COMMENT '小组id',
  `role_id` char(32) DEFAULT NULL COMMENT '权限id',
  `id_card` varchar(30) DEFAULT NULL COMMENT '身份证号码',
  `titles` varchar(50) DEFAULT NULL COMMENT '职称',
  `phone_number` varchar(20) DEFAULT NULL COMMENT '电话号码',
  `induction_time` date DEFAULT NULL COMMENT '入中心时间',
  `departure_time` date DEFAULT NULL COMMENT '离职时间',
  `image_url` varchar(100) DEFAULT NULL COMMENT '照片地址',
  `status` int(11) DEFAULT NULL COMMENT '状态（1：在岗，2：离职:3：辞退，4：换岗）',
  `school` varchar(30) DEFAULT NULL COMMENT '学校',
  `entrance_time` date DEFAULT NULL COMMENT '入学时间',
  `graduation_time` date DEFAULT NULL COMMENT '毕业时间',
  `education` int(11) DEFAULT NULL COMMENT '学历（1：硕士:2：博士:3：学士）',
  `tutor` varchar(10) DEFAULT NULL COMMENT '中心导师',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `open_id` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `user_role_fk` (`role_id`),
  KEY `user_user_group_fk` (`user_group_id`),
  CONSTRAINT `user_role_fk` FOREIGN KEY (`role_id`) REFERENCES `role_t` (`id`),
  CONSTRAINT `user_user_group_fk` FOREIGN KEY (`user_group_id`) REFERENCES `user_group_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表';

-- ----------------------------
-- Records of user_t
-- ----------------------------
INSERT INTO `user_t` VALUES ('3938d94fa8e44fc8b76c0db734ac56b1', '侯建平', '0', 'houjp', '96e79218965eb72c92a549dd5a330112', '硬件2', null, '1', '0', '2', '9da7472fe87d4f349065c9e7d5e82893', '67f5b7d9e5c146f1b4e8dd953951ab7b', '', '', '', null, null, null, '1', '', null, null, '1', '', 'api', '2018-01-09 15:37:28', 'api', '2018-01-09 16:20:42', null);
INSERT INTO `user_t` VALUES ('55e0c7400ea54b33921c4e908ea61c09', 'hou', '1', 'hou', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '1', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '123', '123', '123', '2017-07-06', '2017-07-13', null, '1', '', null, null, '1', '', 'api', '2017-07-16 14:42:46', 'api', '2017-07-16 14:49:13', null);
INSERT INTO `user_t` VALUES ('609f7ee6e63240758bbaa2457dcdc5ed', 'asdasd', '0', 'adsasd', '123123', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, 'f4983508b31c4264a8b159f7308a2970.jpg', '1', '', null, null, '1', '', 'api', '2017-10-29 14:17:33', 'api', '2017-10-29 14:18:01', null);
INSERT INTO `user_t` VALUES ('68ff9976be70420d83e48fc536cf1fd2', 'L', '1', 'houjw', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '111111111', null, '1111111', null, null, 'b1426052bf0e4b0aae3897f74aa1c9aa.jpg', '1', '', null, null, '1', '', 'api', '2017-07-16 12:53:35', 'api', '2018-01-07 08:02:36', 'aaaaa');
INSERT INTO `user_t` VALUES ('78e4ddb8f1d04ccdab0d8cda2a250dcf', '张弛', '0', 'asdasd', 'a8f5f167f44f4964e6c998dee827110c', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, null, '1', '', null, null, '1', '', 'api', '2017-10-29 14:15:50', null, null, null);
INSERT INTO `user_t` VALUES ('7dc783a2b21c4c989acc3adb4153828f', '不知道不最高', '1', 'buzhidao', null, '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', '11111', '13621299528', '2017-10-29', '2017-10-30', '3ac27e5037194312a4d75e49924b34f8.jpg', '2', '中山大学', '2017-10-31', '2017-11-01', '3', '赵老师', 'api', '2017-10-29 14:33:19', 'api', '2018-01-09 15:31:08', null);
INSERT INTO `user_t` VALUES ('8252455337c34a6cbd3b3fc0e8f91abd', '小包', '0', 'xiaob', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '2205222323232323', null, '12012012012', null, null, '7f2813f6d55147f49a4941e310445730.jpg', '1', '', null, null, '1', '', 'api', '2017-07-16 14:00:43', null, null, null);
INSERT INTO `user_t` VALUES ('88a499cff10c480196adec823681ec98', '加加加', '0', '11111', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, '5c1a88d017e94cebb00220a0d07b2b3f.jpg', '1', '', null, null, '1', '', 'api', '2017-10-29 14:21:10', null, null, null);
INSERT INTO `user_t` VALUES ('8ac13a1e97b74092aeb916aa339821e4', '1111', '0', '11111', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, 'null\\13562cd4a12549a49655bc5402c160e3.jpg', '1', '', null, null, '1', '', 'api', '2017-10-29 14:13:47', null, null, null);
INSERT INTO `user_t` VALUES ('96e79218965eb72c92a549dd5a330112', '超级管理员', '1', 'admin', '96e79218965eb72c92a549dd5a330112', null, null, null, '0', '0', '3656236e3666483a8577c967444a0834', '96e79218965eb72c92a549dd5a330112', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);
INSERT INTO `user_t` VALUES ('99623bf797344b34ba34ccb6f69f433c', '我爱我加', '0', 'html', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, 'fe0c76eae02a4edfbfd0b4e43332b732.jpg', '1', '', null, null, '1', '', 'api', '2017-10-29 14:19:30', null, null, null);
INSERT INTO `user_t` VALUES ('af2d2a0568a64c6ca2fe740f8d0487b4', 'L', '0', 'houjw', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', '111', '', null, null, '35dcf44200f140b7a68adea3005e690a.jpg', '1', '', null, null, '1', '', 'api', '2017-07-16 12:56:32', null, null, null);
INSERT INTO `user_t` VALUES ('c9956b56fd1b4cc3a7c8156e9e110387', '小灰机', '0', 'xiaohj', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '3', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '20202231231231', '77', '123123123', null, null, 'a41c2362eb4f4a778539d4ec48448443.jpg', '1', '新加坡大学', null, null, '3', '习大大', 'api', '2017-07-16 14:06:57', null, null, 'test');
INSERT INTO `user_t` VALUES ('d5b3b7c05e754db9b9882d02b4a6e57c', '心疼疼', '0', 'stt', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '1', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '11111', null, '11111', null, null, '1c6cfd41e5ee4003a7b0c895354c3c9b.jpg', '1', '', null, null, '1', '', 'api', '2017-07-16 13:00:40', null, null, null);
INSERT INTO `user_t` VALUES ('dbe9c094ea2d486face54d3baccb2d55', '张弛', '0', 'zhangci', '96e79218965eb72c92a549dd5a330112', '技术研究二部', null, '1', '0', '0', '3656236e3666483a8577c967444a0834', '7f87ef95e3a54d84a49db9d7aa50d955', '', null, '', null, null, 'null\\3103cdc707d1485ea1e02efd73762c06.jpg', '1', '', null, null, '1', '', 'api', '2017-10-29 14:11:16', null, null, null);

-- ----------------------------
-- Table structure for work_experience_t
-- ----------------------------
DROP TABLE IF EXISTS `work_experience_t`;
CREATE TABLE `work_experience_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `begin_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `unit` varchar(100) DEFAULT NULL COMMENT '工作单位',
  `insurance` int(11) DEFAULT NULL COMMENT '是否保险',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `turn_up_id` char(32) DEFAULT NULL COMMENT '转编id',
  PRIMARY KEY (`id`),
  KEY `FK_Reference_34` (`turn_up_id`),
  CONSTRAINT `FK_Reference_34` FOREIGN KEY (`turn_up_id`) REFERENCES `apply_turn_up_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作经验表';

-- ----------------------------
-- Records of work_experience_t
-- ----------------------------
INSERT INTO `work_experience_t` VALUES ('0cc2ac0d678140de95d483dcdfdca782', '2017-07-30', '2017-08-15', '英泰伟业信息技术股份有限公司', '1', 'api', '2017-12-31 10:57:19', null, null, '6f655e2a7eec49c2b6aedce86de9cbaf');
INSERT INTO `work_experience_t` VALUES ('9f3c25eff57744d19992e4ad2af23175', '2017-07-30', '2017-08-17', '东京', '0', 'api', '2017-12-31 10:57:19', null, null, '6f655e2a7eec49c2b6aedce86de9cbaf');

-- ----------------------------
-- Table structure for work_joutanl_t
-- ----------------------------
DROP TABLE IF EXISTS `work_joutanl_t`;
CREATE TABLE `work_joutanl_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '用户id',
  `work_content` varchar(500) DEFAULT NULL COMMENT '工作内容',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `remark` varchar(500) DEFAULT NULL COMMENT '备注',
  `joutanl_date` datetime DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_11` (`user_id`),
  CONSTRAINT `FK_Reference_11` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作日志表';

-- ----------------------------
-- Records of work_joutanl_t
-- ----------------------------
INSERT INTO `work_joutanl_t` VALUES ('04b43d89e759465c9dd715cc2eaf8167', '3938d94fa8e44fc8b76c0db734ac56b1', '居然没有返回湿哒哒', 'api', '2018-01-09 16:34:14', 'api', '2018-01-09 16:50:52', null, '2018-01-09 16:34:14');
INSERT INTO `work_joutanl_t` VALUES ('090fd7bd5d054d43ae2d37626e018abe', '3938d94fa8e44fc8b76c0db734ac56b1', '晕啊没找到功能在哪里111', 'api', '2018-01-09 16:31:13', 'api', '2018-01-09 16:53:46', null, '2018-01-09 16:31:12');
INSERT INTO `work_joutanl_t` VALUES ('0de78db7857146f893e1bf30caa01c7a', '68ff9976be70420d83e48fc536cf1fd2', '哈哈哈哈哈', 'api', '2017-12-18 18:36:21', null, null, null, '2017-12-18 18:36:21');
INSERT INTO `work_joutanl_t` VALUES ('8bd33ec16f1540ad8682f40096251413', '96e79218965eb72c92a549dd5a330112', 'qqqq', 'api', '2018-01-21 09:42:19', null, null, null, '2018-01-21 00:00:00');
INSERT INTO `work_joutanl_t` VALUES ('908155a4ef964c5a93e2e3f4b84d352f', '68ff9976be70420d83e48fc536cf1fd2', '我爱情 嗷嗷啊啊啊eee', 'api', '2017-11-02 10:30:47', 'api', '2017-11-02 14:40:49', null, '2017-11-02 00:00:00');
INSERT INTO `work_joutanl_t` VALUES ('ae6aecb2c50e486ca9f18d662b3f666d', '68ff9976be70420d83e48fc536cf1fd2', '系统上线.', 'api', '2017-11-02 15:23:54', 'api', '2017-11-02 15:24:27', null, '2017-11-01 00:00:00');
INSERT INTO `work_joutanl_t` VALUES ('bb57d606d0774b0b90d98b3c8132a57e', '68ff9976be70420d83e48fc536cf1fd2', '额鹅鹅鹅鹅鹅鹅11111', 'api', '2017-12-18 15:01:09', 'api', '2017-12-18 18:37:06', null, '2017-12-18 15:01:09');
INSERT INTO `work_joutanl_t` VALUES ('c352748970dd4ecf8bdfcbee86882bb9', '68ff9976be70420d83e48fc536cf1fd2', '哈哈哈哈哈', 'api', '2017-12-18 15:02:36', null, null, null, '2017-12-18 15:02:36');
INSERT INTO `work_joutanl_t` VALUES ('c86dbb37ca21416aa3f9d0986acb146a', '68ff9976be70420d83e48fc536cf1fd2', '哈哈哈哈哈', 'api', '2017-12-18 18:34:30', null, null, null, '2017-12-18 18:34:30');

-- ----------------------------
-- Table structure for work_plan_t
-- ----------------------------
DROP TABLE IF EXISTS `work_plan_t`;
CREATE TABLE `work_plan_t` (
  `id` char(32) NOT NULL COMMENT 'uuid',
  `user_id` char(32) DEFAULT NULL COMMENT '用户Id',
  `dist_user_id` char(32) DEFAULT NULL COMMENT '分配人',
  `begin_time` date DEFAULT NULL COMMENT '开始时间',
  `end_time` date DEFAULT NULL COMMENT '结束时间',
  `content` varchar(200) DEFAULT NULL COMMENT '内容',
  `arrangement` varchar(20) DEFAULT NULL COMMENT '安排人',
  `setbacks` int(11) DEFAULT '0' COMMENT '进度',
  `progress` varchar(200) DEFAULT NULL COMMENT '进度',
  `evaluate` int(11) DEFAULT NULL COMMENT '评价（0：已完成；1：未完成）',
  `creator` varchar(20) DEFAULT NULL COMMENT '创建人',
  `create_time` datetime DEFAULT NULL COMMENT '创建时间',
  `modifier` varchar(20) DEFAULT NULL COMMENT '修改人',
  `modify_time` datetime DEFAULT NULL COMMENT '修改时间',
  `user_group_id` char(32) DEFAULT NULL COMMENT '小组',
  `last_progress` longtext,
  PRIMARY KEY (`id`),
  KEY `FK_Reference_6` (`user_id`),
  KEY `FKFA6CC1CC96E92613` (`dist_user_id`),
  KEY `FKFA6CC1CC78B9C7B1` (`user_group_id`),
  CONSTRAINT `FKFA6CC1CC78B9C7B1` FOREIGN KEY (`user_group_id`) REFERENCES `user_group_t` (`id`),
  CONSTRAINT `FKFA6CC1CC96E92613` FOREIGN KEY (`dist_user_id`) REFERENCES `user_t` (`id`),
  CONSTRAINT `FK_Reference_6` FOREIGN KEY (`user_id`) REFERENCES `user_t` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工作计划表';

-- ----------------------------
-- Records of work_plan_t
-- ----------------------------
INSERT INTO `work_plan_t` VALUES ('3603c36b0c25479fa79839374d371f90', '3938d94fa8e44fc8b76c0db734ac56b1', '3938d94fa8e44fc8b76c0db734ac56b1', '2018-01-08', '2018-01-31', '不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高', null, '0', null, '0', 'api', '2018-01-09 16:26:42', 'api', '2018-01-09 16:27:26', '9da7472fe87d4f349065c9e7d5e82893', null);
INSERT INTO `work_plan_t` VALUES ('5cdd11d91c5f4bc49369d4e7b4c10c15', '3938d94fa8e44fc8b76c0db734ac56b1', '3938d94fa8e44fc8b76c0db734ac56b1', '2018-01-08', '2018-01-31', '不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高不知道不最高', null, '0', null, null, 'api', '2018-01-09 15:49:48', 'api', '2018-01-09 16:26:17', '9da7472fe87d4f349065c9e7d5e82893', null);
INSERT INTO `work_plan_t` VALUES ('6bc99be92f4e4af38ac5ce9492fdbdd5', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', '2017-07-03', '2017-07-19', 'asd', null, '0', null, null, 'api', '2017-07-16 16:58:44', null, null, '3656236e3666483a8577c967444a0834', null);
INSERT INTO `work_plan_t` VALUES ('84017f6bf00f407fad7a84b24f9b4203', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', '2017-07-12', '2017-07-14', '我要测试准确性', null, '80', '马上完成。', '0', 'api', '2017-07-16 19:09:46', 'api', '2017-07-19 22:40:37', '3656236e3666483a8577c967444a0834', null);
INSERT INTO `work_plan_t` VALUES ('8654fcac974a4a7ea03101b7950c7004', '68ff9976be70420d83e48fc536cf1fd2', '68ff9976be70420d83e48fc536cf1fd2', '2017-06-25', '2017-07-24', '测试', null, '0', null, '0', 'api', '2017-07-24 18:55:36', 'api', '2017-09-11 14:43:45', '3656236e3666483a8577c967444a0834', '1111111111sa');
INSERT INTO `work_plan_t` VALUES ('9562ec914fbf4b90aeb32c270a5f4b94', '68ff9976be70420d83e48fc536cf1fd2', '68ff9976be70420d83e48fc536cf1fd2', '2017-10-31', '2017-11-09', '开心by', null, '0', null, '0', 'api', '2017-10-31 14:53:03', 'api', '2017-10-31 16:00:53', '3656236e3666483a8577c967444a0834', '哈嘿');
INSERT INTO `work_plan_t` VALUES ('c68fc6468802408a8dfa257357761da3', 'd5b3b7c05e754db9b9882d02b4a6e57c', '68ff9976be70420d83e48fc536cf1fd2', '2017-07-16', '2017-07-20', '测试查看他人', null, '0', null, '0', 'api', '2017-07-24 17:43:58', 'api', '2018-01-09 10:45:45', '3656236e3666483a8577c967444a0834', null);
INSERT INTO `work_plan_t` VALUES ('c7184659872745fd95a655e6af2ff08d', '68ff9976be70420d83e48fc536cf1fd2', '68ff9976be70420d83e48fc536cf1fd2', '2017-07-23', '2017-11-11', '测试工作计划', null, '0', null, '0', 'api', '2017-07-24 17:43:10', 'api', '2018-01-09 10:45:27', '3656236e3666483a8577c967444a0834', '测试通过');
INSERT INTO `work_plan_t` VALUES ('e471fd9996034482bdaaea56e7a2e04e', '96e79218965eb72c92a549dd5a330112', '96e79218965eb72c92a549dd5a330112', '2017-07-04', '2017-07-31', 'asd', null, '0', null, null, 'api', '2017-07-16 17:01:37', null, null, '3656236e3666483a8577c967444a0834', null);
INSERT INTO `work_plan_t` VALUES ('e7d01e94eeee481a964b7f127ffdb805', '68ff9976be70420d83e48fc536cf1fd2', '68ff9976be70420d83e48fc536cf1fd2', '2017-06-25', '2017-10-24', '阿萨德', null, '0', null, null, 'api', '2017-07-24 18:54:47', 'api', '2017-07-30 14:52:46', '3656236e3666483a8577c967444a0834', '框架搭建完成');
