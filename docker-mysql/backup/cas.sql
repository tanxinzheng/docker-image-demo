/*
 Navicat Premium Data Transfer

 Source Server         : docker-localhost
 Source Server Type    : MySQL
 Source Server Version : 50719
 Source Host           : localhost:3306
 Source Schema         : cas

 Target Server Type    : MySQL
 Target Server Version : 50719
 File Encoding         : 65001

 Date: 19/10/2019 13:39:57
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for cas_user
-- ----------------------------
DROP TABLE IF EXISTS `cas_user`;
CREATE TABLE `cas_user` (
  `id` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '主键',
  `username` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '用户名',
  `password` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码',
  `salt` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '密码盐值',
  `email` varchar(100) COLLATE utf8_unicode_ci DEFAULT NULL COMMENT '电子邮箱',
  `phone` varchar(100) COLLATE utf8_unicode_ci DEFAULT '' COMMENT '手机号码',
  `nickname` varchar(100) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '昵称',
  `created_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '创建人',
  `created_time` datetime NOT NULL COMMENT '创建时间',
  `updated_by` varchar(50) COLLATE utf8_unicode_ci NOT NULL DEFAULT '' COMMENT '更新人',
  `updated_time` datetime NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `UNI_USERNAME` (`username`),
  UNIQUE KEY `UNI_NICKNAME` (`nickname`),
  UNIQUE KEY `UNI_EMAIL` (`email`),
  UNIQUE KEY `UNI_PHONE` (`phone`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户表';

-- ----------------------------
-- Records of cas_user
-- ----------------------------
BEGIN;
INSERT INTO `cas_user` VALUES ('1', 'admin', '5caf380d95d2f8a67b3be4b883ab0b16', '9c5aca7819134a3bb1cb4dd395f7cacb', 'admin@xmomen.com', '15000084483', '管理员', 'SYSTEM', '2019-04-16 10:15:17', 'SYSTEM', '2019-04-16 10:15:23');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
