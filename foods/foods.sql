/*
Navicat MySQL Data Transfer

Source Server         : mysql
Source Server Version : 50505
Source Host           : localhost:3306
Source Database       : foods

Target Server Type    : MYSQL
Target Server Version : 50505
File Encoding         : 65001

Date: 2018-05-08 10:03:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for qw_article
-- ----------------------------
DROP TABLE IF EXISTS `qw_article`;
CREATE TABLE `qw_article` (
  `aid` int(11) NOT NULL AUTO_INCREMENT,
  `sid` int(11) NOT NULL COMMENT '分类id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `seotitle` varchar(255) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL COMMENT '关键词',
  `description` varchar(255) NOT NULL COMMENT '摘要',
  `thumbnail` varchar(255) NOT NULL COMMENT '缩略图',
  `content` text NOT NULL COMMENT '内容',
  `t` int(10) unsigned NOT NULL COMMENT '时间',
  `n` int(10) unsigned NOT NULL DEFAULT '0' COMMENT '点击',
  PRIMARY KEY (`aid`),
  KEY `sid` (`sid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_article
-- ----------------------------

-- ----------------------------
-- Table structure for qw_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_group`;
CREATE TABLE `qw_auth_group` (
  `id` mediumint(8) unsigned NOT NULL AUTO_INCREMENT,
  `title` char(100) NOT NULL DEFAULT '',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `rules` varchar(255) NOT NULL DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_auth_group
-- ----------------------------
INSERT INTO `qw_auth_group` VALUES ('1', '超级管理员', '1', '1,2,58,65,59,60,61,62,3,56,4,6,5,7,8,9,10,51,52,53,57,11,54,12,13,14,15,16,17,18,19,20,21,22,23,24,25,26,27,29,30,31,32,33,34,36,37,38,39,40,41,42,43,44,45,46,47,63,48,49,50,55');
INSERT INTO `qw_auth_group` VALUES ('2', '管理员', '1', '13,14,23,22,21,20,19,18,17,16,15,24,36,34,33,32,31,30,29,27,26,25,1');
INSERT INTO `qw_auth_group` VALUES ('3', '普通用户', '1', '1');
INSERT INTO `qw_auth_group` VALUES ('6', '333', '0', '1,2');

-- ----------------------------
-- Table structure for qw_auth_group_access
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_group_access`;
CREATE TABLE `qw_auth_group_access` (
  `uid` mediumint(8) unsigned NOT NULL,
  `group_id` mediumint(8) unsigned NOT NULL,
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_auth_group_access
-- ----------------------------
INSERT INTO `qw_auth_group_access` VALUES ('1', '1');

-- ----------------------------
-- Table structure for qw_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `qw_auth_rule`;
CREATE TABLE `qw_auth_rule` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `name` char(80) NOT NULL DEFAULT '',
  `title` char(20) NOT NULL DEFAULT '',
  `icon` varchar(255) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT '1',
  `status` tinyint(1) NOT NULL DEFAULT '1',
  `condition` char(100) NOT NULL DEFAULT '',
  `islink` tinyint(1) NOT NULL DEFAULT '1',
  `o` int(11) NOT NULL COMMENT '排序',
  `tips` text NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=96 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_auth_rule
-- ----------------------------
INSERT INTO `qw_auth_rule` VALUES ('1', '0', 'Index/index', '控制台', 'menu-icon fa fa-tachometer', '1', '1', '', '1', '1', '友情提示：经常查看操作日志，发现异常以便及时追查原因。');
INSERT INTO `qw_auth_rule` VALUES ('2', '0', '', '系统设置', 'menu-icon fa fa-cog', '1', '1', '', '0', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('3', '2', 'Setting/setting', '网站设置', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '3', '这是网站设置的提示。');
INSERT INTO `qw_auth_rule` VALUES ('4', '2', 'Menu/index', '后台菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '4', '');
INSERT INTO `qw_auth_rule` VALUES ('5', '2', 'Menu/add', '新增菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '5', '');
INSERT INTO `qw_auth_rule` VALUES ('6', '4', 'Menu/edit', '编辑菜单', '', '1', '1', '', '1', '6', '');
INSERT INTO `qw_auth_rule` VALUES ('7', '2', 'Menu/update', '保存菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '7', '');
INSERT INTO `qw_auth_rule` VALUES ('8', '2', 'Menu/del', '删除菜单', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '8', '');
INSERT INTO `qw_auth_rule` VALUES ('9', '2', 'Database/backup', '数据库备份', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '9', '');
INSERT INTO `qw_auth_rule` VALUES ('10', '9', 'Database/recovery', '数据库还原', '', '1', '1', '', '0', '10', '');
INSERT INTO `qw_auth_rule` VALUES ('11', '2', 'Update/update', '在线升级', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '11', '');
INSERT INTO `qw_auth_rule` VALUES ('12', '2', 'Update/devlog', '开发日志', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '12', '');
INSERT INTO `qw_auth_rule` VALUES ('13', '0', '', '用户及组', 'menu-icon fa fa-users', '1', '1', '', '0', '13', '');
INSERT INTO `qw_auth_rule` VALUES ('14', '13', 'Member/index', '用户管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '14', '');
INSERT INTO `qw_auth_rule` VALUES ('15', '13', 'Member/add', '新增用户', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '15', '');
INSERT INTO `qw_auth_rule` VALUES ('16', '13', 'Member/edit', '编辑用户', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '16', '');
INSERT INTO `qw_auth_rule` VALUES ('17', '13', 'Member/update', '保存用户', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '17', '');
INSERT INTO `qw_auth_rule` VALUES ('18', '13', 'Member/del', '删除用户', '', '1', '1', '', '0', '18', '');
INSERT INTO `qw_auth_rule` VALUES ('19', '13', 'Group/index', '用户组管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '19', '');
INSERT INTO `qw_auth_rule` VALUES ('20', '13', 'Group/add', '新增用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '20', '');
INSERT INTO `qw_auth_rule` VALUES ('21', '13', 'Group/edit', '编辑用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '21', '');
INSERT INTO `qw_auth_rule` VALUES ('22', '13', 'Group/update', '保存用户组', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '22', '');
INSERT INTO `qw_auth_rule` VALUES ('23', '13', 'Group/del', '删除用户组', '', '1', '1', '', '0', '23', '');
INSERT INTO `qw_auth_rule` VALUES ('24', '0', '', '网站内容', 'menu-icon fa fa-desktop', '1', '1', '', '0', '24', '');
INSERT INTO `qw_auth_rule` VALUES ('25', '24', 'Article/index', '文章管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '25', '网站虽然重要，身体更重要，出去走走吧。');
INSERT INTO `qw_auth_rule` VALUES ('26', '24', 'Article/add', '新增文章', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '26', '');
INSERT INTO `qw_auth_rule` VALUES ('27', '24', 'Article/edit', '编辑文章', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '27', '');
INSERT INTO `qw_auth_rule` VALUES ('29', '24', 'Article/update', '保存文章', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '29', '');
INSERT INTO `qw_auth_rule` VALUES ('30', '24', 'Article/del', '删除文章', '', '1', '1', '', '0', '30', '');
INSERT INTO `qw_auth_rule` VALUES ('31', '24', 'Category/index', '分类管理', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '31', '');
INSERT INTO `qw_auth_rule` VALUES ('32', '24', 'Category/add', '新增分类', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '32', '');
INSERT INTO `qw_auth_rule` VALUES ('33', '24', 'Category/edit', '编辑分类', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '33', '');
INSERT INTO `qw_auth_rule` VALUES ('34', '24', 'Category/update', '保存分类', 'menu-icon fa fa-caret-right', '1', '1', '', '0', '34', '');
INSERT INTO `qw_auth_rule` VALUES ('36', '24', 'Category/del', '删除分类', '', '1', '1', '', '0', '36', '');
INSERT INTO `qw_auth_rule` VALUES ('37', '0', '', '其它功能', 'menu-icon fa fa-legal', '1', '1', '', '0', '37', '');
INSERT INTO `qw_auth_rule` VALUES ('38', '37', 'Link/index', '友情链接', 'menu-icon fa fa-caret-right', '1', '1', '', '1', '38', '');
INSERT INTO `qw_auth_rule` VALUES ('39', '37', 'Link/add', '增加链接', '', '1', '1', '', '1', '39', '');
INSERT INTO `qw_auth_rule` VALUES ('40', '37', 'Link/edit', '编辑链接', '', '1', '1', '', '0', '40', '');
INSERT INTO `qw_auth_rule` VALUES ('41', '37', 'Link/update', '保存链接', '', '1', '1', '', '0', '41', '');
INSERT INTO `qw_auth_rule` VALUES ('42', '37', 'Link/del', '删除链接', '', '1', '1', '', '0', '42', '');
INSERT INTO `qw_auth_rule` VALUES ('43', '37', 'Flash/index', '焦点图', 'menu-icon fa fa-desktop', '1', '1', '', '1', '43', '');
INSERT INTO `qw_auth_rule` VALUES ('44', '37', 'Flash/add', '新增焦点图', '', '1', '1', '', '1', '44', '');
INSERT INTO `qw_auth_rule` VALUES ('45', '37', 'Flash/update', '保存焦点图', '', '1', '1', '', '0', '45', '');
INSERT INTO `qw_auth_rule` VALUES ('46', '37', 'Flash/edit', '编辑焦点图', '', '1', '1', '', '0', '46', '');
INSERT INTO `qw_auth_rule` VALUES ('47', '37', 'Flash/del', '删除焦点图', '', '1', '1', '', '0', '47', '');
INSERT INTO `qw_auth_rule` VALUES ('48', '0', 'Personal/index', '个人中心', 'menu-icon fa fa-user', '1', '1', '', '1', '48', '');
INSERT INTO `qw_auth_rule` VALUES ('49', '48', 'Personal/profile', '个人资料', 'menu-icon fa fa-user', '1', '1', '', '1', '49', '');
INSERT INTO `qw_auth_rule` VALUES ('50', '48', 'Logout/index', '退出', '', '1', '1', '', '1', '50', '');
INSERT INTO `qw_auth_rule` VALUES ('51', '9', 'Database/export', '备份', '', '1', '1', '', '0', '51', '');
INSERT INTO `qw_auth_rule` VALUES ('52', '9', 'Database/optimize', '数据优化', '', '1', '1', '', '0', '52', '');
INSERT INTO `qw_auth_rule` VALUES ('53', '9', 'Database/repair', '修复表', '', '1', '1', '', '0', '53', '');
INSERT INTO `qw_auth_rule` VALUES ('54', '11', 'Update/updating', '升级安装', '', '1', '1', '', '0', '54', '');
INSERT INTO `qw_auth_rule` VALUES ('55', '48', 'Personal/update', '资料保存', '', '1', '1', '', '0', '55', '');
INSERT INTO `qw_auth_rule` VALUES ('56', '3', 'Setting/update', '设置保存', '', '1', '1', '', '0', '56', '');
INSERT INTO `qw_auth_rule` VALUES ('57', '9', 'Database/del', '备份删除', '', '1', '1', '', '0', '57', '');
INSERT INTO `qw_auth_rule` VALUES ('58', '2', 'variable/index', '自定义变量', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('59', '58', 'variable/add', '新增变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('60', '58', 'variable/edit', '编辑变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('61', '58', 'variable/update', '保存变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('62', '58', 'variable/del', '删除变量', '', '1', '1', '', '0', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('63', '37', 'Facebook/add', '用户反馈', '', '1', '1', '', '1', '63', '');
INSERT INTO `qw_auth_rule` VALUES ('67', '66', 'Custorm/index', '项目列表', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('69', '0', '', '广告管理', 'menu-icon fa fa-cog', '1', '1', '', '1', '3', '');
INSERT INTO `qw_auth_rule` VALUES ('70', '69', 'New/index', '广告列表', 'menu-icon fa fa-cog', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('71', '69', 'New/add', '添加广告', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('75', '74', 'Pay/form', '新增二维码', '', '1', '1', '', '1', '1', '');
INSERT INTO `qw_auth_rule` VALUES ('76', '74', 'Pay/index', '二维码列表', '', '1', '1', '', '1', '0', '');
INSERT INTO `qw_auth_rule` VALUES ('81', '0', '', '美食简介', 'menu-icon fa fa-cog', '1', '1', '', '1', '3', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('82', '81', 'Foods/index', '简介列表', '', '1', '1', '', '1', '1', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('83', '81', 'Foods/form', '新增简介', '', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('84', '0', '', '菜谱管理', 'menu-icon fa fa-cog', '1', '1', '', '1', '4', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('85', '84', 'Menus/index', '菜谱列表', '', '1', '1', '', '1', '1', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('86', '84', 'Menus/form', '新增菜谱', '', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('87', '0', '', '建康管理', 'menu-icon fa fa-cog', '1', '1', '', '1', '5', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('88', '87', 'Health/index', '健康列表', '', '1', '1', '', '1', '1', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('89', '87', 'Health/form', '新增健康', '', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('90', '0', '', '社区管理', 'menu-icon fa fa-cog', '1', '1', '', '1', '6', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('91', '90', 'Community/index', '社区列表', '', '1', '1', '', '1', '1', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('92', '90', 'Community/form', '新增', '', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('93', '0', '', '精选', 'menu-icon fa fa-cog', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('94', '93', 'Sift/index', '精选列表', '', '1', '1', '', '1', '1', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;\r\n&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');
INSERT INTO `qw_auth_rule` VALUES ('95', '93', 'Sift/form', '新增精选', '', '1', '1', '', '1', '2', '&lt;div id=&quot;selenium-highlight&quot;&gt;\r\n&lt;/div&gt;');

-- ----------------------------
-- Table structure for qw_category
-- ----------------------------
DROP TABLE IF EXISTS `qw_category`;
CREATE TABLE `qw_category` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` tinyint(1) NOT NULL COMMENT '0正常，1单页，2外链',
  `pid` int(11) NOT NULL COMMENT '父ID',
  `name` varchar(100) NOT NULL COMMENT '分类名称',
  `dir` varchar(100) NOT NULL COMMENT '目录名称',
  `seotitle` varchar(200) DEFAULT NULL COMMENT 'SEO标题',
  `keywords` varchar(255) NOT NULL,
  `description` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `url` varchar(255) NOT NULL,
  `cattemplate` varchar(100) NOT NULL,
  `contemplate` varchar(100) NOT NULL,
  `o` int(11) NOT NULL COMMENT '排序',
  PRIMARY KEY (`id`),
  KEY `fsid` (`pid`)
) ENGINE=MyISAM AUTO_INCREMENT=36 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_category
-- ----------------------------

-- ----------------------------
-- Table structure for qw_community
-- ----------------------------
DROP TABLE IF EXISTS `qw_community`;
CREATE TABLE `qw_community` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `community_title` varchar(255) DEFAULT NULL,
  `community_content` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_community
-- ----------------------------
INSERT INTO `qw_community` VALUES ('1', 'dsfdsfdsfsdf', '风格都十分广泛受到广泛大使馆电风扇广泛的空梵蒂冈豆腐干地方地方豆腐干豆腐干豆腐干豆腐干豆腐干豆腐干豆腐干豆腐干豆腐干', '/foods/Public/attached/2018/05/05/5aed01f21d1e1.jpg', '1525481974');

-- ----------------------------
-- Table structure for qw_custorm
-- ----------------------------
DROP TABLE IF EXISTS `qw_custorm`;
CREATE TABLE `qw_custorm` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `cname` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `phone` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `adders` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  `content` varchar(500) CHARACTER SET utf8 DEFAULT NULL,
  `set` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qw_custorm
-- ----------------------------
INSERT INTO `qw_custorm` VALUES ('1', 'dsfsdf', '', '133222222', 'dsfdsf', '1523459288', 'sdsdfsd', '3');

-- ----------------------------
-- Table structure for qw_devlog
-- ----------------------------
DROP TABLE IF EXISTS `qw_devlog`;
CREATE TABLE `qw_devlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `v` varchar(225) NOT NULL COMMENT '版本号',
  `y` int(4) NOT NULL COMMENT '年分',
  `t` int(10) NOT NULL COMMENT '发布日期',
  `log` text NOT NULL COMMENT '更新日志',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_devlog
-- ----------------------------
INSERT INTO `qw_devlog` VALUES ('1', '1.0.0', '2016', '1440259200', 'QWADMIN第一个版本发布。');
INSERT INTO `qw_devlog` VALUES ('2', '1.0.1', '2016', '1440259200', '修改cookie过于简单的安全风险。');

-- ----------------------------
-- Table structure for qw_flash
-- ----------------------------
DROP TABLE IF EXISTS `qw_flash`;
CREATE TABLE `qw_flash` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `pic` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_flash
-- ----------------------------

-- ----------------------------
-- Table structure for qw_foods
-- ----------------------------
DROP TABLE IF EXISTS `qw_foods`;
CREATE TABLE `qw_foods` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `foods_title` varchar(255) DEFAULT NULL,
  `foods_content` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_foods
-- ----------------------------
INSERT INTO `qw_foods` VALUES ('6', 'dsfdsfdsfsdf', 'sdfdsfsd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef0d8a149fa.png', '1525616015');
INSERT INTO `qw_foods` VALUES ('7', 'dsfffffffffffffffff', 'dsfsdfdsf\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef0d942257f.jpg', '1525616021');
INSERT INTO `qw_foods` VALUES ('8', '', 'sdfsdfsd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef0da31deaa.png', '1525616036');

-- ----------------------------
-- Table structure for qw_health
-- ----------------------------
DROP TABLE IF EXISTS `qw_health`;
CREATE TABLE `qw_health` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `health_title` varchar(255) DEFAULT NULL,
  `health_content` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_health
-- ----------------------------
INSERT INTO `qw_health` VALUES ('2', '士大夫发射点', '第三方\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee5765b6208.jpg', '1525569383');
INSERT INTO `qw_health` VALUES ('3', '大师傅士大夫', '胜多负少f\'s\'d\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee576b4e12d.png', '1525569388');
INSERT INTO `qw_health` VALUES ('4', '似的发射点', '似的发射点\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee5770961fa.jpg', '1525569395');
INSERT INTO `qw_health` VALUES ('5', 'dsfsdf', 'asdsadsad\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef035246278.jpg', '1525613395');
INSERT INTO `qw_health` VALUES ('6', 'asdas', 'asdasd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef03634b852.png', '1525613412');
INSERT INTO `qw_health` VALUES ('7', 'asdasd', 'asdasd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef0378492ec.jpg', '1525613433');

-- ----------------------------
-- Table structure for qw_links
-- ----------------------------
DROP TABLE IF EXISTS `qw_links`;
CREATE TABLE `qw_links` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `logo` varchar(255) NOT NULL,
  `o` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `o` (`o`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_links
-- ----------------------------

-- ----------------------------
-- Table structure for qw_log
-- ----------------------------
DROP TABLE IF EXISTS `qw_log`;
CREATE TABLE `qw_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `t` int(10) NOT NULL,
  `ip` varchar(16) NOT NULL,
  `log` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=141 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_log
-- ----------------------------
INSERT INTO `qw_log` VALUES ('40', 'admin', '1522048464', '127.0.0.1', '编辑菜单，ID：72');
INSERT INTO `qw_log` VALUES ('39', 'admin', '1522048448', '127.0.0.1', '编辑菜单，ID：2');
INSERT INTO `qw_log` VALUES ('38', 'admin', '1522048411', '127.0.0.1', '新增菜单，名称：订单管理');
INSERT INTO `qw_log` VALUES ('56', 'admin', '1523266106', '::1', '删除会员UID：Array');
INSERT INTO `qw_log` VALUES ('35', 'admin', '1521622198', '127.0.0.1', '登录失败。');
INSERT INTO `qw_log` VALUES ('36', 'admin', '1521622209', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('37', 'admin', '1522048305', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('41', 'admin', '1522048523', '127.0.0.1', '新增菜单，名称：订单列表');
INSERT INTO `qw_log` VALUES ('42', 'admin', '1522048535', '127.0.0.1', '编辑菜单，ID：72');
INSERT INTO `qw_log` VALUES ('43', 'admin', '1522160729', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('44', 'admin', '1522243008', '::1', '登录失败。');
INSERT INTO `qw_log` VALUES ('45', 'admin', '1522243019', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('46', 'admin', '1522243843', '::1', '编辑菜单，ID：69');
INSERT INTO `qw_log` VALUES ('47', 'admin', '1522243856', '::1', '编辑菜单，ID：66');
INSERT INTO `qw_log` VALUES ('48', 'admin', '1522243864', '::1', '编辑菜单，ID：2');
INSERT INTO `qw_log` VALUES ('49', 'admin', '1522332534', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('50', 'admin', '1522332558', '::1', '编辑菜单，ID：69');
INSERT INTO `qw_log` VALUES ('51', 'admin', '1522335624', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('52', 'admin', '1522336783', '127.0.0.1', '登录失败。');
INSERT INTO `qw_log` VALUES ('53', 'admin', '1522336791', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('54', 'admin', '1522337236', '127.0.0.1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('55', 'admin', '1522337676', '127.0.0.1', '编辑菜单，ID：66');
INSERT INTO `qw_log` VALUES ('57', 'admin', '1523266158', '::1', '删除会员UID：Array');
INSERT INTO `qw_log` VALUES ('58', 'admin', '1523279219', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('59', 'admin', '1523279257', '::1', '新增菜单，名称：付款二维码管理');
INSERT INTO `qw_log` VALUES ('60', 'admin', '1523279271', '::1', '编辑菜单，ID：74');
INSERT INTO `qw_log` VALUES ('61', 'admin', '1523279298', '::1', '编辑菜单，ID：74');
INSERT INTO `qw_log` VALUES ('62', 'admin', '1523279308', '::1', '编辑菜单，ID：74');
INSERT INTO `qw_log` VALUES ('63', 'admin', '1523279344', '::1', '新增菜单，名称：新增二维码');
INSERT INTO `qw_log` VALUES ('64', 'admin', '1523279368', '::1', '新增菜单，名称：二维码列表');
INSERT INTO `qw_log` VALUES ('65', 'admin', '1523280882', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('66', 'admin', '1523281723', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('67', 'admin', '1523282433', '::1', '删除UID：3');
INSERT INTO `qw_log` VALUES ('68', 'admin', '1523282793', '::1', '删除UID：7');
INSERT INTO `qw_log` VALUES ('69', 'admin', '1523282836', '127.0.0.1', '登录成功。');
INSERT INTO `qw_log` VALUES ('70', 'admin', '1523457067', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('71', 'admin', '1523457104', '::1', '新增菜单，名称：留言审核管理');
INSERT INTO `qw_log` VALUES ('72', 'admin', '1523457133', '::1', '新增菜单，名称：留言列表');
INSERT INTO `qw_log` VALUES ('73', 'admin', '1523457800', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('74', 'admin', '1523460761', '::1', '编辑菜单，ID：2');
INSERT INTO `qw_log` VALUES ('75', 'admin', '1523460858', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('76', 'admin', '1523669179', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('77', 'admin', '1523669813', '::1', '新增菜单，名称：专业方向');
INSERT INTO `qw_log` VALUES ('78', 'admin', '1523669852', '::1', '新增菜单，名称：添加专业');
INSERT INTO `qw_log` VALUES ('79', 'admin', '1523669872', '::1', '编辑菜单，ID：79');
INSERT INTO `qw_log` VALUES ('80', 'admin', '1523669899', '::1', '编辑菜单，ID：79');
INSERT INTO `qw_log` VALUES ('81', 'admin', '1523672148', '::1', '编辑菜单，ID：80');
INSERT INTO `qw_log` VALUES ('82', 'admin', '1523757904', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('83', 'admin', '1523758298', '::1', '编辑菜单，ID：66');
INSERT INTO `qw_log` VALUES ('84', 'admin', '1523758315', '::1', '删除菜单ID：74');
INSERT INTO `qw_log` VALUES ('85', 'admin', '1523967337', '222.209.152.188', '登录成功。');
INSERT INTO `qw_log` VALUES ('86', 'admin', '1523967356', '222.209.152.188', '编辑菜单，ID：2');
INSERT INTO `qw_log` VALUES ('87', 'admin', '1524024132', '118.113.147.164', '登录成功。');
INSERT INTO `qw_log` VALUES ('88', 'admin', '1525418065', '::1', '新增菜单，名称：美食简介');
INSERT INTO `qw_log` VALUES ('89', 'admin', '1525418101', '::1', '新增菜单，名称：简介列表');
INSERT INTO `qw_log` VALUES ('90', 'admin', '1525418133', '::1', '新增菜单，名称：新增简介');
INSERT INTO `qw_log` VALUES ('91', 'admin', '1525418203', '::1', '新增菜单，名称：菜谱管理');
INSERT INTO `qw_log` VALUES ('92', 'admin', '1525418232', '::1', '新增菜单，名称：菜谱列表');
INSERT INTO `qw_log` VALUES ('93', 'admin', '1525418376', '::1', '新增菜单，名称：新增菜谱');
INSERT INTO `qw_log` VALUES ('94', 'admin', '1525418420', '::1', '新增菜单，名称：建康管理');
INSERT INTO `qw_log` VALUES ('95', 'admin', '1525418454', '::1', '新增菜单，名称：健康列表');
INSERT INTO `qw_log` VALUES ('96', 'admin', '1525418482', '::1', '新增菜单，名称：新增健康');
INSERT INTO `qw_log` VALUES ('97', 'admin', '1525418529', '::1', '新增菜单，名称：社区留言管理');
INSERT INTO `qw_log` VALUES ('98', 'admin', '1525418579', '::1', '新增菜单，名称：社区列表');
INSERT INTO `qw_log` VALUES ('99', 'admin', '1525418599', '::1', '新增菜单，名称：新增');
INSERT INTO `qw_log` VALUES ('100', 'admin', '1525418624', '::1', '编辑菜单，ID：92');
INSERT INTO `qw_log` VALUES ('101', 'admin', '1525418648', '::1', '新增菜单，名称：精选');
INSERT INTO `qw_log` VALUES ('102', 'admin', '1525418673', '::1', '新增菜单，名称：精选列表');
INSERT INTO `qw_log` VALUES ('103', 'admin', '1525418696', '::1', '新增菜单，名称：新增精选');
INSERT INTO `qw_log` VALUES ('104', 'admin', '1525418709', '::1', '编辑菜单，ID：94');
INSERT INTO `qw_log` VALUES ('105', 'admin', '1525418727', '::1', '编辑菜单，ID：90');
INSERT INTO `qw_log` VALUES ('106', 'admin', '1525418819', '::1', '编辑菜单，ID：72');
INSERT INTO `qw_log` VALUES ('107', 'admin', '1525418886', '::1', '修改个人资料');
INSERT INTO `qw_log` VALUES ('108', 'admin', '1525480917', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('109', 'admin', '1525483941', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('110', 'admin', '1525486953', '::1', '编辑菜单，ID：82');
INSERT INTO `qw_log` VALUES ('111', 'admin', '1525486967', '::1', '编辑菜单，ID：83');
INSERT INTO `qw_log` VALUES ('112', 'admin', '1525487162', '::1', '新增成功。');
INSERT INTO `qw_log` VALUES ('113', 'admin', '1525487367', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('114', 'admin', '1525487405', '::1', '删除UID：7');
INSERT INTO `qw_log` VALUES ('115', 'admin', '1525487411', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('116', 'admin', '1525487418', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('117', 'admin', '1525488393', '::1', '编辑菜单，ID：85');
INSERT INTO `qw_log` VALUES ('118', 'admin', '1525488408', '::1', '编辑菜单，ID：86');
INSERT INTO `qw_log` VALUES ('119', 'admin', '1525567099', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('120', 'admin', '1525567582', '::1', '删除UID：27');
INSERT INTO `qw_log` VALUES ('121', 'admin', '1525568543', '::1', '删除UID：Array');
INSERT INTO `qw_log` VALUES ('122', 'admin', '1525569383', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('123', 'admin', '1525569388', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('124', 'admin', '1525569395', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('125', 'admin', '1525572771', '::1', '删除菜单ID：68');
INSERT INTO `qw_log` VALUES ('126', 'admin', '1525572778', '::1', '删除菜单ID：66');
INSERT INTO `qw_log` VALUES ('127', 'admin', '1525572820', '::1', '删除菜单ID：Array');
INSERT INTO `qw_log` VALUES ('128', 'admin', '1525572829', '::1', '编辑菜单，ID：2');
INSERT INTO `qw_log` VALUES ('129', 'admin', '1525613348', '::1', '登录成功。');
INSERT INTO `qw_log` VALUES ('130', 'admin', '1525613364', '::1', '删除UID：1');
INSERT INTO `qw_log` VALUES ('131', 'admin', '1525613395', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('132', 'admin', '1525613413', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('133', 'admin', '1525613433', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('134', 'admin', '1525616015', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('135', 'admin', '1525616021', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('136', 'admin', '1525616026', '::1', '删除UID：5');
INSERT INTO `qw_log` VALUES ('137', 'admin', '1525616029', '::1', '删除UID：1');
INSERT INTO `qw_log` VALUES ('138', 'admin', '1525616036', '::1', '新增成功!');
INSERT INTO `qw_log` VALUES ('139', 'admin', '1525616041', '::1', '删除UID：3');
INSERT INTO `qw_log` VALUES ('140', 'admin', '1525742089', '::1', '登录成功。');

-- ----------------------------
-- Table structure for qw_major
-- ----------------------------
DROP TABLE IF EXISTS `qw_major`;
CREATE TABLE `qw_major` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `major_name` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_major
-- ----------------------------
INSERT INTO `qw_major` VALUES ('1', '撒旦');
INSERT INTO `qw_major` VALUES ('2', '');
INSERT INTO `qw_major` VALUES ('3', '');
INSERT INTO `qw_major` VALUES ('4', '热热特');

-- ----------------------------
-- Table structure for qw_member
-- ----------------------------
DROP TABLE IF EXISTS `qw_member`;
CREATE TABLE `qw_member` (
  `uid` int(11) NOT NULL AUTO_INCREMENT,
  `user` varchar(225) NOT NULL,
  `head` varchar(255) NOT NULL COMMENT '头像',
  `sex` tinyint(1) NOT NULL COMMENT '0保密1男，2女',
  `birthday` int(10) NOT NULL COMMENT '生日',
  `phone` varchar(20) NOT NULL COMMENT '电话',
  `qq` varchar(20) NOT NULL COMMENT 'QQ',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `password` varchar(32) NOT NULL,
  `t` int(10) unsigned NOT NULL COMMENT '注册时间',
  PRIMARY KEY (`uid`)
) ENGINE=MyISAM AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_member
-- ----------------------------
INSERT INTO `qw_member` VALUES ('1', 'admin', '/foods/Public/attached/2018/05/04/5aec0b8549df0.png', '1', '1420128000', '13800138000', '331349451', 'xieyanwei@qq.com', '66d6a1c8748025462128dc75bf5ae8d1', '1442505600');

-- ----------------------------
-- Table structure for qw_menus
-- ----------------------------
DROP TABLE IF EXISTS `qw_menus`;
CREATE TABLE `qw_menus` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `menus_title` varchar(255) DEFAULT NULL,
  `menus_content` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_menus
-- ----------------------------
INSERT INTO `qw_menus` VALUES ('1', 'dsfdsfdsfsdf', '的风格和地方各地方', '/foods/Public/attached/2018/05/05/5aed01f21d1e1.jpg', '1525481974');

-- ----------------------------
-- Table structure for qw_message
-- ----------------------------
DROP TABLE IF EXISTS `qw_message`;
CREATE TABLE `qw_message` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `message` varchar(255) DEFAULT NULL,
  `entry_name` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_message
-- ----------------------------
INSERT INTO `qw_message` VALUES ('1', '鬼地方鬼地方', null, '1');
INSERT INTO `qw_message` VALUES ('2', '鬼地方鬼地方', null, '2');
INSERT INTO `qw_message` VALUES ('3', '是多少', null, '1');
INSERT INTO `qw_message` VALUES ('4', '为微软', null, '1');
INSERT INTO `qw_message` VALUES ('5', '豆腐干地方', null, '1');
INSERT INTO `qw_message` VALUES ('6', '为', null, '1');
INSERT INTO `qw_message` VALUES ('7', '而温热温热', null, '1');
INSERT INTO `qw_message` VALUES ('8', '温热温热', null, '1');
INSERT INTO `qw_message` VALUES ('9', '收费', null, '1');
INSERT INTO `qw_message` VALUES ('10', '', null, '1');
INSERT INTO `qw_message` VALUES ('11', '', null, '1');
INSERT INTO `qw_message` VALUES ('12', '', null, '1');
INSERT INTO `qw_message` VALUES ('13', '是大师傅士大夫', null, '1');
INSERT INTO `qw_message` VALUES ('14', '士大夫士大夫', '打发士大夫', '2');
INSERT INTO `qw_message` VALUES ('15', null, null, '0');
INSERT INTO `qw_message` VALUES ('16', null, null, '0');

-- ----------------------------
-- Table structure for qw_new
-- ----------------------------
DROP TABLE IF EXISTS `qw_new`;
CREATE TABLE `qw_new` (
  `id` int(22) NOT NULL AUTO_INCREMENT,
  `image` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `path` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `t` int(11) DEFAULT NULL,
  `miaoshu_one` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  `miaoshu_two` varchar(255) CHARACTER SET utf8 DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=latin1;

-- ----------------------------
-- Records of qw_new
-- ----------------------------
INSERT INTO `qw_new` VALUES ('33', '/foods/Public/attached/2018/05/06/5aee543b453fd.png', 'http://www.eleme.com', '1525568572', '世界上最好、最快的点餐平台', '期待您的订单');

-- ----------------------------
-- Table structure for qw_order
-- ----------------------------
DROP TABLE IF EXISTS `qw_order`;
CREATE TABLE `qw_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `ptype` varchar(255) DEFAULT NULL,
  `price` decimal(20,1) DEFAULT NULL,
  `qq` varchar(255) DEFAULT NULL,
  `nickname` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `techtype` varchar(255) DEFAULT NULL,
  `endtime` int(20) DEFAULT NULL,
  `school` varchar(255) DEFAULT NULL,
  `entry_name` varchar(255) DEFAULT NULL,
  `project_requirements` varchar(255) DEFAULT NULL,
  `remarks` varchar(255) DEFAULT NULL,
  `source` varchar(255) DEFAULT NULL,
  `stutas` varchar(255) DEFAULT '1',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_order
-- ----------------------------
INSERT INTO `qw_order` VALUES ('9', '2', '2334.0', '1223122', 'ceshi', '13302303030', '3', '1524672000', '成都大学', '测试项目', '灭有', '无', '4', '2');
INSERT INTO `qw_order` VALUES ('10', '2', '23456.0', '1232312', 'dsf', '13322222222', '1', '1522944000', 'sddfdsf', 'dsfdsf', 'sdfdsfdsf', 'sdfsdf', null, '1');
INSERT INTO `qw_order` VALUES ('11', '1', '123.0', '123213213', '魏汝稳', '13322222222', '4', '1523548800', '撒大苏打', '撒打算', '啊实打实的', '阿斯顿', null, '1');
INSERT INTO `qw_order` VALUES ('12', '1', '0.0', '', '', '', '1', '0', '', '', '', '', null, '1');
INSERT INTO `qw_order` VALUES ('13', '1', '12234.0', '13344444444', '士大夫', '13344444444', '1', '1524067200', '测试学校', '测试1234', '需求以23完成', '上述', null, '1');

-- ----------------------------
-- Table structure for qw_pay
-- ----------------------------
DROP TABLE IF EXISTS `qw_pay`;
CREATE TABLE `qw_pay` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `t` int(22) DEFAULT '0',
  `stutas` varchar(50) DEFAULT NULL,
  `pay` varchar(225) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='付款码';

-- ----------------------------
-- Records of qw_pay
-- ----------------------------
INSERT INTO `qw_pay` VALUES ('2', '1523281679', '0', '/qwadmin/Public/attached/2018/04/09/5acb6f0f2e96e.jpg');
INSERT INTO `qw_pay` VALUES ('4', '1523282439', '0', '/qwadmin/Public/attached/2018/04/09/5acb6f0f2e96e.jpg');
INSERT INTO `qw_pay` VALUES ('5', '1523282553', '0', '/qwadmin/Public/attached/2018/04/09/5acb6f0f2e96e.jpg');
INSERT INTO `qw_pay` VALUES ('6', '1523282778', '0', '/qwadmin/Public/attached/2018/04/09/5acb6f0f2e96e.jpg');
INSERT INTO `qw_pay` VALUES ('8', '1523282842', '0', '/qwadmin/Public/attached/2018/04/09/5acb6f0f2e96e.jpg');

-- ----------------------------
-- Table structure for qw_setting
-- ----------------------------
DROP TABLE IF EXISTS `qw_setting`;
CREATE TABLE `qw_setting` (
  `k` varchar(100) NOT NULL COMMENT '变量',
  `v` varchar(255) NOT NULL COMMENT '值',
  `type` tinyint(1) NOT NULL COMMENT '0系统，1自定义',
  `name` varchar(255) NOT NULL COMMENT '说明',
  PRIMARY KEY (`k`),
  KEY `k` (`k`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_setting
-- ----------------------------
INSERT INTO `qw_setting` VALUES ('sitename', '美食网站后台管理', '0', '');
INSERT INTO `qw_setting` VALUES ('title', '', '0', '');
INSERT INTO `qw_setting` VALUES ('keywords', '关键词', '0', '');
INSERT INTO `qw_setting` VALUES ('description', '网站描述', '0', '');
INSERT INTO `qw_setting` VALUES ('footer', '2017©XXXXX', '0', '');
INSERT INTO `qw_setting` VALUES ('test', '测试', '1', '测试变量');

-- ----------------------------
-- Table structure for qw_sift
-- ----------------------------
DROP TABLE IF EXISTS `qw_sift`;
CREATE TABLE `qw_sift` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sift_title` varchar(255) DEFAULT NULL,
  `sift_content` varchar(500) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `t` int(22) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qw_sift
-- ----------------------------
INSERT INTO `qw_sift` VALUES ('2', '士大夫发射点', '第三方\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee5765b6208.jpg', '1525569383');
INSERT INTO `qw_sift` VALUES ('3', '大师傅士大夫', '胜多负少f\'s\'d\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee576b4e12d.png', '1525569388');
INSERT INTO `qw_sift` VALUES ('4', '似的发射点', '似的发射点\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aee5770961fa.jpg', '1525569395');
INSERT INTO `qw_sift` VALUES ('5', 'dsfsdf', 'asdsadsad\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef035246278.jpg', '1525613395');
INSERT INTO `qw_sift` VALUES ('6', 'asdas', 'asdasd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef03634b852.png', '1525613412');
INSERT INTO `qw_sift` VALUES ('7', 'asdasd', 'asdasd\r\n<div id=\"selenium-highlight\">\r\n</div>', '/foods/Public/attached/2018/05/06/5aef0378492ec.jpg', '1525613433');
