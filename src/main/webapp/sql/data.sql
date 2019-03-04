/*
Navicat MySQL Data Transfer

Source Server         : 127.0.0.1
Source Server Version : 50717
Source Host           : localhost:3306
Source Database       : cqbbj

Target Server Type    : MYSQL
Target Server Version : 50717
File Encoding         : 65001

Date: 2019-03-04 20:35:34
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for sys_car
-- ----------------------------
DROP TABLE IF EXISTS `sys_car`;
CREATE TABLE `sys_car` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `license` varchar(20) NOT NULL COMMENT '车牌号',
  `brand` varchar(20) NOT NULL COMMENT '品牌型号',
  `engine` varchar(20) DEFAULT NULL COMMENT '发动机号',
  `vin` varchar(20) DEFAULT NULL COMMENT '车架号',
  `insurance_date` date DEFAULT NULL COMMENT '保险到期',
  `examined_date` date DEFAULT NULL COMMENT '年审到期',
  `purchase_date` date DEFAULT NULL COMMENT '采购日期',
  `carType` int(1) NOT NULL COMMENT '车辆类型 0：大货车 1：小货车 2：轿车',
  `status` int(1) NOT NULL COMMENT '车辆状态 0：正常 1：锁定 2：报废',
  `emp_no` varchar(100) NOT NULL COMMENT '默认司机',
  `car_no` varchar(100) NOT NULL COMMENT '车辆编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='车辆表';

-- ----------------------------
-- Records of sys_car
-- ----------------------------

-- ----------------------------
-- Table structure for sys_company_info
-- ----------------------------
DROP TABLE IF EXISTS `sys_company_info`;
CREATE TABLE `sys_company_info` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '企业名称',
  `address` varchar(100) NOT NULL COMMENT '公司地址',
  `telephone` varchar(20) NOT NULL COMMENT '联系方式',
  `logo` varchar(200) DEFAULT NULL COMMENT '企业logo',
  `msg_sign` varchar(10) DEFAULT NULL COMMENT '短信签名',
  `msg_count` int(10) NOT NULL COMMENT '短信条数',
  `msg_open` int(1) NOT NULL COMMENT '短信开关 0：开启 1：关闭',
  `keyword` varchar(255) NOT NULL COMMENT '关键词配置',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='公司信息表';

-- ----------------------------
-- Records of sys_company_info
-- ----------------------------
INSERT INTO `sys_company_info` VALUES ('1', '2019-03-04 20:32:58', '0', '重庆山城棒棒军', '重庆市渝中区中山路二路200号A座9-6', '023-63527312', null, '重庆棒棒军', '0', '0', '电视/洗衣机/空调/空调拆装/大床/茶几/电视柜/椅子/沙发/小床/饭桌/');

-- ----------------------------
-- Table structure for sys_customer
-- ----------------------------
DROP TABLE IF EXISTS `sys_customer`;
CREATE TABLE `sys_customer` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '客户姓名',
  `phone` varchar(20) NOT NULL COMMENT '客户电话',
  `cust_no` varchar(100) NOT NULL COMMENT '客户编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客户表';

-- ----------------------------
-- Records of sys_customer
-- ----------------------------

-- ----------------------------
-- Table structure for sys_dept
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept`;
CREATE TABLE `sys_dept` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '部门名称',
  `is_disabled` int(1) NOT NULL COMMENT '是否禁用 0：正常 1：禁用',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='部门表';

-- ----------------------------
-- Records of sys_dept
-- ----------------------------
INSERT INTO `sys_dept` VALUES ('1', '2019-03-04 19:47:20', '0', '行政部', '0');
INSERT INTO `sys_dept` VALUES ('2', '2019-03-04 20:06:12', '0', '财务部', '0');
INSERT INTO `sys_dept` VALUES ('3', '2019-03-04 20:06:18', '0', '运输部', '0');
INSERT INTO `sys_dept` VALUES ('4', '2019-03-04 20:06:23', '0', '调度部', '0');
INSERT INTO `sys_dept` VALUES ('5', '2019-03-04 20:06:31', '0', '搬运部', '0');

-- ----------------------------
-- Table structure for sys_dept_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_dept_menu`;
CREATE TABLE `sys_dept_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `dept_id` int(10) NOT NULL,
  `menu_id` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='部门菜单关联表';

-- ----------------------------
-- Records of sys_dept_menu
-- ----------------------------
INSERT INTO `sys_dept_menu` VALUES ('38', '1', '1');
INSERT INTO `sys_dept_menu` VALUES ('39', '1', '2');
INSERT INTO `sys_dept_menu` VALUES ('40', '1', '3');
INSERT INTO `sys_dept_menu` VALUES ('41', '1', '4');
INSERT INTO `sys_dept_menu` VALUES ('42', '1', '5');
INSERT INTO `sys_dept_menu` VALUES ('43', '1', '6');
INSERT INTO `sys_dept_menu` VALUES ('44', '1', '7');
INSERT INTO `sys_dept_menu` VALUES ('45', '1', '8');
INSERT INTO `sys_dept_menu` VALUES ('46', '1', '9');
INSERT INTO `sys_dept_menu` VALUES ('47', '1', '10');
INSERT INTO `sys_dept_menu` VALUES ('48', '1', '11');
INSERT INTO `sys_dept_menu` VALUES ('49', '1', '12');
INSERT INTO `sys_dept_menu` VALUES ('50', '1', '13');
INSERT INTO `sys_dept_menu` VALUES ('51', '1', '14');
INSERT INTO `sys_dept_menu` VALUES ('52', '1', '15');
INSERT INTO `sys_dept_menu` VALUES ('53', '1', '16');
INSERT INTO `sys_dept_menu` VALUES ('54', '1', '17');
INSERT INTO `sys_dept_menu` VALUES ('55', '1', '19');
INSERT INTO `sys_dept_menu` VALUES ('56', '1', '18');

-- ----------------------------
-- Table structure for sys_employee
-- ----------------------------
DROP TABLE IF EXISTS `sys_employee`;
CREATE TABLE `sys_employee` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `account` varchar(64) NOT NULL,
  `password` varchar(64) NOT NULL,
  `name` varchar(20) NOT NULL COMMENT '姓名',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `sex` int(1) NOT NULL COMMENT '性别 0：未知 1：男 2：女',
  `is_disabled` int(1) NOT NULL COMMENT '0：启用 1：禁用',
  `emp_no` varchar(100) NOT NULL COMMENT '员工编号',
  `dept_id` int(10) NOT NULL COMMENT '所属部门',
  `position_id` int(10) NOT NULL COMMENT '所属职位',
  `money` double(10,2) NOT NULL COMMENT '员工钱包',
  `is_onjob` int(1) NOT NULL COMMENT '是否在职 0：在职 1：离职',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='员工表';

-- ----------------------------
-- Records of sys_employee
-- ----------------------------
INSERT INTO `sys_employee` VALUES ('1', '2019-03-04 20:23:14', '0', 'wxy', 'e10adc3949ba59abbe56e057f20f883e', '王小源', '18888888888', '1', '0', 'EP201903042023137020919', '1', '1', '0.00', '0');

-- ----------------------------
-- Table structure for sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `sys_menu`;
CREATE TABLE `sys_menu` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '菜单名称',
  `url` varchar(100) DEFAULT NULL COMMENT '跳转路径',
  `icon` varchar(100) DEFAULT NULL COMMENT '图标样式',
  `pid` int(10) NOT NULL COMMENT '父级ID',
  `is_disabled` int(1) NOT NULL COMMENT '0:启用 1：禁用',
  `sort` int(2) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='菜单表';

-- ----------------------------
-- Records of sys_menu
-- ----------------------------
INSERT INTO `sys_menu` VALUES ('1', '2019-03-04 19:44:05', '0', '用户管理', null, null, '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('2', '2019-03-04 19:44:28', '0', '菜单管理', '/menu/menu', null, '1', '0', '0');
INSERT INTO `sys_menu` VALUES ('3', '2019-03-04 19:52:34', '0', '部门设置', '/dept/dept', null, '1', '0', '0');
INSERT INTO `sys_menu` VALUES ('4', '2019-03-04 19:52:56', '0', '职位设置', '/position/position', null, '1', '0', '0');
INSERT INTO `sys_menu` VALUES ('5', '2019-03-04 19:53:21', '0', '员工管理', '/employee/employee', null, '1', '0', '0');
INSERT INTO `sys_menu` VALUES ('6', '2019-03-04 19:53:57', '0', '离职员工', '/employee/resignedEmployee', null, '1', '0', '0');
INSERT INTO `sys_menu` VALUES ('7', '2019-03-04 19:55:24', '0', '订单管理', '', null, '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('8', '2019-03-04 19:55:45', '0', '添加订单', '/order/orderList?page=1', null, '7', '0', '0');
INSERT INTO `sys_menu` VALUES ('9', '2019-03-04 19:56:05', '0', '未派订单', '/order/orderList?page=2', null, '7', '0', '0');
INSERT INTO `sys_menu` VALUES ('10', '2019-03-04 19:56:21', '0', '已派订单', '/order/orderList?page=3', null, '7', '0', '0');
INSERT INTO `sys_menu` VALUES ('11', '2019-03-04 19:56:38', '0', '完成订单', '/order/orderList?page=4', null, '7', '0', '0');
INSERT INTO `sys_menu` VALUES ('12', '2019-03-04 19:57:18', '0', '作废订单', '/order/orderList?page=5', null, '7', '0', '0');
INSERT INTO `sys_menu` VALUES ('13', '2019-03-04 19:58:19', '0', '客户管理', '', null, '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('14', '2019-03-04 19:59:02', '0', '客户列表', '/customer/customer', null, '13', '0', '0');
INSERT INTO `sys_menu` VALUES ('15', '2019-03-04 20:00:10', '0', '车辆管理', '', null, '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('16', '2019-03-04 20:00:21', '0', '车辆列表', '/car/car', null, '15', '0', '0');
INSERT INTO `sys_menu` VALUES ('17', '2019-03-04 20:01:16', '0', '系统设置', '', null, '0', '0', '0');
INSERT INTO `sys_menu` VALUES ('18', '2019-03-04 20:01:40', '0', '操作日志', '/operationLog/operationLog', null, '17', '0', '0');
INSERT INTO `sys_menu` VALUES ('19', '2019-03-04 20:02:20', '0', '商户设置', '', null, '17', '0', '0');

-- ----------------------------
-- Table structure for sys_message_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_message_log`;
CREATE TABLE `sys_message_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `phone` varchar(20) NOT NULL COMMENT '手机号',
  `content` varchar(100) NOT NULL COMMENT '内容',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='短信日志表';

-- ----------------------------
-- Records of sys_message_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_money_detail
-- ----------------------------
DROP TABLE IF EXISTS `sys_money_detail`;
CREATE TABLE `sys_money_detail` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `emp_no` varchar(100) NOT NULL COMMENT '员工编号',
  `type` int(10) NOT NULL COMMENT '收支类型 0：收入 1：支出',
  `money` double(10,2) NOT NULL COMMENT '金额',
  `remark` varchar(100) NOT NULL COMMENT '备注',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='收支明细表';

-- ----------------------------
-- Records of sys_money_detail
-- ----------------------------

-- ----------------------------
-- Table structure for sys_operation_log
-- ----------------------------
DROP TABLE IF EXISTS `sys_operation_log`;
CREATE TABLE `sys_operation_log` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '员工姓名',
  `content` varchar(100) NOT NULL COMMENT '操作',
  `ip` varchar(20) NOT NULL COMMENT 'IP地址',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='操作日志表';

-- ----------------------------
-- Records of sys_operation_log
-- ----------------------------

-- ----------------------------
-- Table structure for sys_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_order`;
CREATE TABLE `sys_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '客户姓名',
  `phone` varchar(20) NOT NULL COMMENT '客户电话',
  `start` varchar(100) NOT NULL COMMENT '搬出地址',
  `end` varchar(100) NOT NULL COMMENT '搬入地址',
  `price` double(10,2) NOT NULL COMMENT '预估起价',
  `beginTime` datetime NOT NULL COMMENT '预约时间',
  `content` varchar(255) DEFAULT NULL COMMENT '搬运备注',
  `status` int(1) NOT NULL COMMENT '订单状态 0：未派单 1：已派单 2：已完成 3：已取消',
  `startMap` varchar(100) DEFAULT NULL COMMENT '经纬度',
  `endMap` varchar(100) DEFAULT NULL COMMENT '经纬度',
  `order_no` varchar(100) NOT NULL COMMENT '订单编号',
  `endTime` datetime DEFAULT NULL COMMENT '完成时间',
  `cust_no` varchar(100) NOT NULL,
  `receiveMoney` double(10,2) DEFAULT NULL,
  `receiveText` varchar(200) DEFAULT NULL,
  `costMoney` double(10,2) DEFAULT NULL,
  `visit` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='订单表';

-- ----------------------------
-- Records of sys_order
-- ----------------------------

-- ----------------------------
-- Table structure for sys_pay_record
-- ----------------------------
DROP TABLE IF EXISTS `sys_pay_record`;
CREATE TABLE `sys_pay_record` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `order_no` varchar(20) NOT NULL COMMENT '订单号',
  `cust_no` varchar(20) NOT NULL COMMENT '客户名称',
  `payWay` int(1) NOT NULL COMMENT '支付类型 0：现金 1：微信 2：签单',
  `payMoney` double(10,2) NOT NULL COMMENT '支付金额',
  `payTime` datetime NOT NULL COMMENT '支付时间',
  `trans_no` varchar(100) NOT NULL COMMENT '交易号',
  `emp_no` varchar(100) NOT NULL COMMENT '收款人',
  `record_no` varchar(100) NOT NULL COMMENT '记录编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付记录表';

-- ----------------------------
-- Records of sys_pay_record
-- ----------------------------

-- ----------------------------
-- Table structure for sys_position
-- ----------------------------
DROP TABLE IF EXISTS `sys_position`;
CREATE TABLE `sys_position` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `name` varchar(20) NOT NULL COMMENT '职位名称',
  `is_disabled` int(1) NOT NULL COMMENT '是否禁用 0：正常 1：禁用',
  `dept_id` int(10) DEFAULT NULL COMMENT '部门ID',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='职位表';

-- ----------------------------
-- Records of sys_position
-- ----------------------------
INSERT INTO `sys_position` VALUES ('1', '2019-03-04 20:07:43', '0', '搬运工', '0', null);
INSERT INTO `sys_position` VALUES ('2', '2019-03-04 20:07:55', '0', '空调工', '0', null);
INSERT INTO `sys_position` VALUES ('3', '2019-03-04 20:08:49', '0', '初级司机', '0', null);
INSERT INTO `sys_position` VALUES ('4', '2019-03-04 20:08:58', '0', '中级司机', '0', null);
INSERT INTO `sys_position` VALUES ('5', '2019-03-04 20:09:04', '0', '高级司机', '0', null);

-- ----------------------------
-- Table structure for sys_salary
-- ----------------------------
DROP TABLE IF EXISTS `sys_salary`;
CREATE TABLE `sys_salary` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `emp_no` double(10,2) NOT NULL COMMENT '员工编号',
  `base_money` double(10,2) NOT NULL COMMENT '基本工资',
  `profit_money` double(10,2) NOT NULL COMMENT '提成工资',
  `other_moeny` double(10,2) NOT NULL COMMENT '其他开支',
  `real_moeny` double(10,2) NOT NULL COMMENT '实发工资',
  `remark` varchar(100) DEFAULT NULL COMMENT '薪资备注',
  `year` int(2) NOT NULL COMMENT '年份',
  `month` int(2) NOT NULL COMMENT '月份',
  `salary_no` varchar(100) NOT NULL COMMENT '记录编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='工资表';

-- ----------------------------
-- Records of sys_salary
-- ----------------------------

-- ----------------------------
-- Table structure for sys_send_order
-- ----------------------------
DROP TABLE IF EXISTS `sys_send_order`;
CREATE TABLE `sys_send_order` (
  `id` int(10) NOT NULL AUTO_INCREMENT COMMENT '主键ID',
  `createTime` datetime NOT NULL COMMENT '创建时间',
  `deleteStatus` int(1) NOT NULL COMMENT '0：未删除 1：已删除',
  `order_no` varchar(100) NOT NULL,
  `emp_no` varchar(100) NOT NULL,
  `type` int(1) NOT NULL COMMENT '派遣类型 0：收款人员 1：随车司机 2：随车搬运工 3：随车空调工',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='派单表';

-- ----------------------------
-- Records of sys_send_order
-- ----------------------------
