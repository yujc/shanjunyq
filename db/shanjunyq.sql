# SQL-Front 5.1  (Build 4.16)

/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE */;
/*!40101 SET SQL_MODE='NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES */;
/*!40103 SET SQL_NOTES='ON' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS */;
/*!40014 SET FOREIGN_KEY_CHECKS=0 */;


# Host: localhost    Database: shanjunyq
# ------------------------------------------------------
# Server version 5.5.38

DROP DATABASE IF EXISTS `shanjunyq`;
CREATE DATABASE `shanjunyq` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `shanjunyq`;

#
# Source for table sj_admin_group
#

DROP TABLE IF EXISTS `sj_admin_group`;
CREATE TABLE `sj_admin_group` (
  `group_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) DEFAULT NULL,
  `base_purview` text,
  `menu_purview` text,
  `status` tinyint(1) DEFAULT '1',
  PRIMARY KEY (`group_id`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理组';

#
# Dumping data for table sj_admin_group
#

LOCK TABLES `sj_admin_group` WRITE;
/*!40000 ALTER TABLE `sj_admin_group` DISABLE KEYS */;
INSERT INTO `sj_admin_group` VALUES (1,'管理员','a:2:{i:0;s:15:\"Admin_AppManage\";i:1;s:21:\"Admin_AppManage_index\";}','a:4:{i:0;s:19:\"首页_管理首页\";i:1;s:19:\"内容_栏目管理\";i:2;s:19:\"内容_文章管理\";i:3;s:22:\"系统_用户组管理\";}',1);
/*!40000 ALTER TABLE `sj_admin_group` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_admin_log
#

DROP TABLE IF EXISTS `sj_admin_log`;
CREATE TABLE `sj_admin_log` (
  `log_id` int(10) NOT NULL AUTO_INCREMENT,
  `user_id` int(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  `ip` varchar(250) DEFAULT NULL,
  `app` varchar(250) DEFAULT '1',
  `content` text,
  PRIMARY KEY (`log_id`),
  KEY `user_id` (`user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台操作记录';

#
# Dumping data for table sj_admin_log
#

LOCK TABLES `sj_admin_log` WRITE;
/*!40000 ALTER TABLE `sj_admin_log` DISABLE KEYS */;
INSERT INTO `sj_admin_log` VALUES (1,1,1421463066,'127.0.0.1','Admin','登录系统');
/*!40000 ALTER TABLE `sj_admin_log` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_admin_user
#

DROP TABLE IF EXISTS `sj_admin_user`;
CREATE TABLE `sj_admin_user` (
  `user_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户IP',
  `group_id` int(10) NOT NULL DEFAULT '1' COMMENT '用户组ID',
  `username` varchar(20) NOT NULL COMMENT '登录名',
  `password` varchar(32) NOT NULL COMMENT '密码',
  `nicename` varchar(20) DEFAULT NULL COMMENT '昵称',
  `email` varchar(50) DEFAULT NULL,
  `status` tinyint(1) unsigned DEFAULT '1' COMMENT '状态',
  `level` int(5) DEFAULT '1' COMMENT '等级',
  `reg_time` int(10) DEFAULT NULL COMMENT '注册时间',
  `last_login_time` int(10) DEFAULT NULL COMMENT '最后登录时间',
  `last_login_ip` varchar(15) DEFAULT '未知' COMMENT '登录IP',
  PRIMARY KEY (`user_id`),
  KEY `username` (`username`),
  KEY `group_id` (`group_id`) USING BTREE,
  KEY `email` (`email`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='后台管理员';

#
# Dumping data for table sj_admin_user
#

LOCK TABLES `sj_admin_user` WRITE;
/*!40000 ALTER TABLE `sj_admin_user` DISABLE KEYS */;
INSERT INTO `sj_admin_user` VALUES (1,1,'admin','21232f297a57a5a743894a0e4a801fc3','管理员','admin@duxcms.com',1,1,1399361747,1421463065,'127.0.0.1');
/*!40000 ALTER TABLE `sj_admin_user` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_category
#

DROP TABLE IF EXISTS `sj_category`;
CREATE TABLE `sj_category` (
  `class_id` int(10) NOT NULL AUTO_INCREMENT,
  `parent_id` int(10) DEFAULT '0',
  `app` varchar(20) DEFAULT NULL,
  `show` tinyint(1) unsigned DEFAULT '1',
  `sequence` int(10) DEFAULT '0',
  `type` int(10) NOT NULL DEFAULT '1',
  `name` varchar(250) DEFAULT NULL,
  `urlname` varchar(250) DEFAULT NULL,
  `subname` varchar(250) DEFAULT NULL,
  `image` varchar(250) DEFAULT NULL,
  `class_tpl` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL,
  `description` varchar(250) DEFAULT NULL,
  `upload_config` int(10) DEFAULT '1',
  PRIMARY KEY (`class_id`),
  UNIQUE KEY `urlname` (`urlname`) USING BTREE,
  KEY `pid` (`parent_id`),
  KEY `mid` (`app`),
  KEY `sequence` (`sequence`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='栏目基础信息';

#
# Dumping data for table sj_category
#

LOCK TABLES `sj_category` WRITE;
/*!40000 ALTER TABLE `sj_category` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_category` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_category_article
#

DROP TABLE IF EXISTS `sj_category_article`;
CREATE TABLE `sj_category_article` (
  `class_id` int(10) NOT NULL,
  `fieldset_id` int(10) NOT NULL,
  `content_tpl` varchar(250) NOT NULL,
  `config_upload` text NOT NULL,
  `content_order` varchar(250) NOT NULL,
  `page` int(10) NOT NULL DEFAULT '10'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章栏目信息';

#
# Dumping data for table sj_category_article
#

LOCK TABLES `sj_category_article` WRITE;
/*!40000 ALTER TABLE `sj_category_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_category_article` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_category_page
#

DROP TABLE IF EXISTS `sj_category_page`;
CREATE TABLE `sj_category_page` (
  `class_id` int(10) unsigned NOT NULL DEFAULT '0',
  `content` mediumtext COMMENT '内容',
  KEY `cid` (`class_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='单页栏目信息';

#
# Dumping data for table sj_category_page
#

LOCK TABLES `sj_category_page` WRITE;
/*!40000 ALTER TABLE `sj_category_page` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_category_page` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_config
#

DROP TABLE IF EXISTS `sj_config`;
CREATE TABLE `sj_config` (
  `name` varchar(250) NOT NULL,
  `data` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站配置';

#
# Dumping data for table sj_config
#

LOCK TABLES `sj_config` WRITE;
/*!40000 ALTER TABLE `sj_config` DISABLE KEYS */;
INSERT INTO `sj_config` VALUES ('site_title','DuxCms网站管理系统');
INSERT INTO `sj_config` VALUES ('site_subtitle','简单、易用、轻巧');
INSERT INTO `sj_config` VALUES ('site_url','');
INSERT INTO `sj_config` VALUES ('site_keywords','duxcms');
INSERT INTO `sj_config` VALUES ('site_description','');
INSERT INTO `sj_config` VALUES ('site_email','admin@duxcms.com');
INSERT INTO `sj_config` VALUES ('site_copyright','duxcms');
INSERT INTO `sj_config` VALUES ('site_statistics','');
INSERT INTO `sj_config` VALUES ('tpl_name','default');
INSERT INTO `sj_config` VALUES ('tpl_index','index');
INSERT INTO `sj_config` VALUES ('tpl_search','search');
INSERT INTO `sj_config` VALUES ('tpl_tags','tag');
INSERT INTO `sj_config` VALUES ('mobile_status','0');
INSERT INTO `sj_config` VALUES ('mobile_tpl','mobile');
INSERT INTO `sj_config` VALUES ('mobile_domain','');
/*!40000 ALTER TABLE `sj_config` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_config_upload
#

DROP TABLE IF EXISTS `sj_config_upload`;
CREATE TABLE `sj_config_upload` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `upload_size` int(10) NOT NULL,
  `upload_exts` varchar(250) DEFAULT NULL,
  `upload_replace` tinyint(1) DEFAULT NULL,
  `thumb_status` tinyint(1) DEFAULT NULL,
  `water_status` tinyint(1) DEFAULT NULL,
  `thumb_type` tinyint(1) DEFAULT NULL,
  `thumb_width` int(10) DEFAULT NULL,
  `thumb_height` int(10) DEFAULT NULL,
  `water_image` varchar(250) DEFAULT NULL,
  `water_position` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='网站配置';

#
# Dumping data for table sj_config_upload
#

LOCK TABLES `sj_config_upload` WRITE;
/*!40000 ALTER TABLE `sj_config_upload` DISABLE KEYS */;
INSERT INTO `sj_config_upload` VALUES (1,'默认',10,'jpg,gif,bmp,png',0,0,0,1,800,800,'logo.jpg',1);
/*!40000 ALTER TABLE `sj_config_upload` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_content
#

DROP TABLE IF EXISTS `sj_content`;
CREATE TABLE `sj_content` (
  `content_id` int(10) NOT NULL AUTO_INCREMENT COMMENT '文章ID',
  `class_id` int(10) DEFAULT NULL COMMENT '栏目ID',
  `title` varchar(250) DEFAULT NULL COMMENT '标题',
  `urltitle` varchar(250) DEFAULT NULL COMMENT 'URL路径',
  `font_color` varchar(250) DEFAULT NULL COMMENT '颜色',
  `font_bold` tinyint(1) DEFAULT NULL COMMENT '加粗',
  `font_em` tinyint(1) DEFAULT NULL,
  `position` varchar(250) DEFAULT NULL,
  `keywords` varchar(250) DEFAULT NULL COMMENT '关键词',
  `description` varchar(250) DEFAULT NULL COMMENT '描述',
  `time` int(10) DEFAULT NULL COMMENT '更新时间',
  `image` varchar(250) DEFAULT NULL COMMENT '封面图',
  `url` varchar(250) DEFAULT NULL COMMENT '跳转',
  `sequence` int(10) DEFAULT NULL COMMENT '排序',
  `status` int(10) DEFAULT NULL COMMENT '状态',
  `copyfrom` varchar(250) DEFAULT NULL COMMENT '来源',
  `views` int(10) DEFAULT '0' COMMENT '浏览数',
  `taglink` int(10) DEFAULT '0' COMMENT 'TAG链接',
  `tpl` varchar(250) DEFAULT NULL,
  `site` int(10) DEFAULT '1',
  PRIMARY KEY (`content_id`),
  UNIQUE KEY `urltitle` (`urltitle`) USING BTREE,
  KEY `title` (`title`) USING BTREE,
  KEY `description` (`description`) USING BTREE,
  KEY `keywords` (`keywords`),
  KEY `class_id` (`class_id`) USING BTREE,
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='内容基础';

#
# Dumping data for table sj_content
#

LOCK TABLES `sj_content` WRITE;
/*!40000 ALTER TABLE `sj_content` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_content` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_content_article
#

DROP TABLE IF EXISTS `sj_content_article`;
CREATE TABLE `sj_content_article` (
  `content_id` int(10) DEFAULT NULL,
  `content` mediumtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='文章内容信息';

#
# Dumping data for table sj_content_article
#

LOCK TABLES `sj_content_article` WRITE;
/*!40000 ALTER TABLE `sj_content_article` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_content_article` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_ext_guestbook
#

DROP TABLE IF EXISTS `sj_ext_guestbook`;
CREATE TABLE `sj_ext_guestbook` (
  `data_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(250) DEFAULT NULL,
  `email` varchar(250) DEFAULT NULL,
  `content` text,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`data_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

#
# Dumping data for table sj_ext_guestbook
#

LOCK TABLES `sj_ext_guestbook` WRITE;
/*!40000 ALTER TABLE `sj_ext_guestbook` DISABLE KEYS */;
INSERT INTO `sj_ext_guestbook` VALUES (1,'Life','349865361@qq.com','欢迎使用DuxCms内容管理系统！',1418960975);
/*!40000 ALTER TABLE `sj_ext_guestbook` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_field
#

DROP TABLE IF EXISTS `sj_field`;
CREATE TABLE `sj_field` (
  `field_id` int(10) NOT NULL AUTO_INCREMENT,
  `fieldset_id` int(10) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `field` varchar(250) DEFAULT NULL,
  `type` int(5) DEFAULT '1',
  `tip` varchar(250) DEFAULT NULL,
  `verify_type` varchar(250) DEFAULT NULL,
  `verify_data` text,
  `verify_data_js` text,
  `verify_condition` tinyint(1) DEFAULT NULL,
  `default` varchar(250) DEFAULT NULL,
  `sequence` int(10) DEFAULT '0',
  `errormsg` varchar(250) DEFAULT NULL,
  `config` text,
  PRIMARY KEY (`field_id`),
  KEY `field` (`field`),
  KEY `sequence` (`sequence`),
  KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='扩展字段基础';

#
# Dumping data for table sj_field
#

LOCK TABLES `sj_field` WRITE;
/*!40000 ALTER TABLE `sj_field` DISABLE KEYS */;
INSERT INTO `sj_field` VALUES (1,1,'昵称','name',1,'','regex','cmVxdWlyZQ==','Kg==',1,'',0,'','');
INSERT INTO `sj_field` VALUES (2,1,'邮箱','email',1,'','regex','ZW1haWw=','ZQ==',1,'',1,'','');
INSERT INTO `sj_field` VALUES (3,1,'内容','content',2,'','regex','cmVxdWlyZQ==','Kg==',1,'',3,'','');
INSERT INTO `sj_field` VALUES (4,1,'时间','time',10,'','regex','','',1,'',2,'','');
/*!40000 ALTER TABLE `sj_field` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_field_expand
#

DROP TABLE IF EXISTS `sj_field_expand`;
CREATE TABLE `sj_field_expand` (
  `field_id` int(10) DEFAULT NULL,
  `post` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段-扩展模型';

#
# Dumping data for table sj_field_expand
#

LOCK TABLES `sj_field_expand` WRITE;
/*!40000 ALTER TABLE `sj_field_expand` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_field_expand` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_field_form
#

DROP TABLE IF EXISTS `sj_field_form`;
CREATE TABLE `sj_field_form` (
  `field_id` int(10) DEFAULT NULL,
  `post` tinyint(1) DEFAULT '0',
  `show` tinyint(1) DEFAULT '0',
  `search` tinyint(1) DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='扩展字段-表单';

#
# Dumping data for table sj_field_form
#

LOCK TABLES `sj_field_form` WRITE;
/*!40000 ALTER TABLE `sj_field_form` DISABLE KEYS */;
INSERT INTO `sj_field_form` VALUES (1,1,1,1);
INSERT INTO `sj_field_form` VALUES (2,1,1,1);
INSERT INTO `sj_field_form` VALUES (3,1,1,1);
INSERT INTO `sj_field_form` VALUES (4,0,1,1);
/*!40000 ALTER TABLE `sj_field_form` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_fieldset
#

DROP TABLE IF EXISTS `sj_fieldset`;
CREATE TABLE `sj_fieldset` (
  `fieldset_id` int(10) NOT NULL AUTO_INCREMENT,
  `table` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  PRIMARY KEY (`fieldset_id`),
  UNIQUE KEY `table` (`table`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='字段集基础';

#
# Dumping data for table sj_fieldset
#

LOCK TABLES `sj_fieldset` WRITE;
/*!40000 ALTER TABLE `sj_fieldset` DISABLE KEYS */;
INSERT INTO `sj_fieldset` VALUES (1,'guestbook','留言板');
/*!40000 ALTER TABLE `sj_fieldset` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_fieldset_expand
#

DROP TABLE IF EXISTS `sj_fieldset_expand`;
CREATE TABLE `sj_fieldset_expand` (
  `fieldset_id` int(10) DEFAULT NULL,
  `status` tinyint(1) DEFAULT NULL,
  UNIQUE KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段集-扩展模型';

#
# Dumping data for table sj_fieldset_expand
#

LOCK TABLES `sj_fieldset_expand` WRITE;
/*!40000 ALTER TABLE `sj_fieldset_expand` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_fieldset_expand` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_fieldset_form
#

DROP TABLE IF EXISTS `sj_fieldset_form`;
CREATE TABLE `sj_fieldset_form` (
  `fieldset_id` int(10) DEFAULT NULL,
  `show_list` tinyint(1) DEFAULT NULL,
  `show_info` tinyint(1) DEFAULT NULL,
  `list_page` int(5) DEFAULT NULL,
  `list_where` varchar(250) DEFAULT NULL,
  `list_order` varchar(250) DEFAULT NULL,
  `tpl_list` varchar(250) DEFAULT NULL,
  `tpl_info` varchar(250) DEFAULT NULL,
  `post_status` tinyint(1) DEFAULT NULL,
  `post_msg` varchar(250) DEFAULT NULL,
  `post_return_url` varchar(250) DEFAULT NULL,
  UNIQUE KEY `fieldset_id` (`fieldset_id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='字段集-扩展表单';

#
# Dumping data for table sj_fieldset_form
#

LOCK TABLES `sj_fieldset_form` WRITE;
/*!40000 ALTER TABLE `sj_fieldset_form` DISABLE KEYS */;
INSERT INTO `sj_fieldset_form` VALUES (1,1,0,10,'','data_id desc','guestbook','guestbook',1,'留言发布成功！','');
/*!40000 ALTER TABLE `sj_fieldset_form` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_file
#

DROP TABLE IF EXISTS `sj_file`;
CREATE TABLE `sj_file` (
  `file_id` int(10) NOT NULL AUTO_INCREMENT,
  `url` varchar(250) DEFAULT NULL,
  `original` varchar(250) DEFAULT NULL,
  `title` varchar(250) DEFAULT NULL,
  `ext` varchar(250) DEFAULT NULL,
  `size` int(10) DEFAULT NULL,
  `time` int(10) DEFAULT NULL,
  PRIMARY KEY (`file_id`),
  KEY `ext` (`ext`),
  KEY `time` (`time`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='上传文件';

#
# Dumping data for table sj_file
#

LOCK TABLES `sj_file` WRITE;
/*!40000 ALTER TABLE `sj_file` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_file` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_fragment
#

DROP TABLE IF EXISTS `sj_fragment`;
CREATE TABLE `sj_fragment` (
  `fragment_id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '文章id',
  `label` varchar(250) DEFAULT NULL,
  `name` varchar(250) DEFAULT NULL,
  `content` text,
  PRIMARY KEY (`fragment_id`),
  KEY `label` (`label`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='网站碎片';

#
# Dumping data for table sj_fragment
#

LOCK TABLES `sj_fragment` WRITE;
/*!40000 ALTER TABLE `sj_fragment` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_fragment` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_position
#

DROP TABLE IF EXISTS `sj_position`;
CREATE TABLE `sj_position` (
  `position_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `sequence` int(10) DEFAULT '0',
  PRIMARY KEY (`position_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='推荐位';

#
# Dumping data for table sj_position
#

LOCK TABLES `sj_position` WRITE;
/*!40000 ALTER TABLE `sj_position` DISABLE KEYS */;
INSERT INTO `sj_position` VALUES (1,'首页推荐',0);
/*!40000 ALTER TABLE `sj_position` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_tags
#

DROP TABLE IF EXISTS `sj_tags`;
CREATE TABLE `sj_tags` (
  `tag_id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `click` int(10) DEFAULT '1',
  `quote` int(10) DEFAULT '1',
  PRIMARY KEY (`tag_id`),
  KEY `quote` (`quote`),
  KEY `click` (`click`),
  KEY `name` (`name`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TAG标签';

#
# Dumping data for table sj_tags
#

LOCK TABLES `sj_tags` WRITE;
/*!40000 ALTER TABLE `sj_tags` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_tags` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_tags_has
#

DROP TABLE IF EXISTS `sj_tags_has`;
CREATE TABLE `sj_tags_has` (
  `content_id` int(10) DEFAULT NULL,
  `tag_id` int(10) DEFAULT NULL,
  KEY `aid` (`content_id`),
  KEY `tid` (`tag_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='TAG关系';

#
# Dumping data for table sj_tags_has
#

LOCK TABLES `sj_tags_has` WRITE;
/*!40000 ALTER TABLE `sj_tags_has` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_tags_has` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_total_spider
#

DROP TABLE IF EXISTS `sj_total_spider`;
CREATE TABLE `sj_total_spider` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `baidu` int(10) DEFAULT '0',
  `google` int(10) DEFAULT '0',
  `soso` int(10) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='蜘蛛统计';

#
# Dumping data for table sj_total_spider
#

LOCK TABLES `sj_total_spider` WRITE;
/*!40000 ALTER TABLE `sj_total_spider` DISABLE KEYS */;
/*!40000 ALTER TABLE `sj_total_spider` ENABLE KEYS */;
UNLOCK TABLES;

#
# Source for table sj_total_visitor
#

DROP TABLE IF EXISTS `sj_total_visitor`;
CREATE TABLE `sj_total_visitor` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `time` int(10) DEFAULT NULL,
  `count` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='访客统计';

#
# Dumping data for table sj_total_visitor
#

LOCK TABLES `sj_total_visitor` WRITE;
/*!40000 ALTER TABLE `sj_total_visitor` DISABLE KEYS */;
INSERT INTO `sj_total_visitor` VALUES (1,1421424000,7);
/*!40000 ALTER TABLE `sj_total_visitor` ENABLE KEYS */;
UNLOCK TABLES;

/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
