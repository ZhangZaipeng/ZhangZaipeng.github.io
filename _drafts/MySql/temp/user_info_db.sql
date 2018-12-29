-- 用户表
CREATE TABLE `tb_user` (
  `user_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',

  `uname` VARCHAR(20) DEFAULT NULL COMMENT '用户名',
  `icon_img_url` VARCHAR(128) DEFAULT NULL COMMENT '头像',

  `mobile` VARCHAR(20) DEFAULT NULL COMMENT '手机号',
  `email` varchar(50) DEFAULT NULL COMMENT '邮箱',
  `auth_level` SMALLINT(1) DEFAULT '0' COMMENT '0 未认证 1 实名认证',
  `security_pwd` varchar(100) DEFAULT NULL COMMENT '资金安全密码',

  `invitees_user_id` bigint(11) DEFAULT '0' COMMENT '被邀请人用户ID， 0 没有邀请人',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_id`),
	UNIQUE KEY `uniq_mobile` (`mobile`),
  UNIQUE KEY `uniq_email` (`email`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='用户表'
AUTO_INCREMENT=98000000
;


-- 用户登录表
DROP TABLE IF EXISTS `tb_user_agent`;
CREATE TABLE `tb_user_agent` (
  `user_agent_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '用户登录编号',
  `user_id` BIGINT(20) NOT NULL COMMENT '用户编号',

  `login_name` varchar(50) DEFAULT NULL COMMENT '登录名',
	`login_pwd` varchar(100) DEFAULT NULL COMMENT '登录密码',

	`telephone` varchar(20) DEFAULT NULL COMMENT '电话',
	`email` varchar(128) DEFAULT NULL COMMENT '邮箱',

	`last_login_time` TIMESTAMP NULL COMMENT '最后登录时间',
	`login_count` INTEGER NULL COMMENT '登录次数',

	`deleted` SMALLINT(1) DEFAULT '0' COMMENT '0 有效 1 无效',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_agent_id`),
	UNIQUE KEY `uniq_telephone` (`telephone`),
	UNIQUE KEY `uniq_email` (`email`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='用户登录表'
AUTO_INCREMENT=1
;

-- 用户认证信息记录表
CREATE TABLE `tb_user_auth` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户编号',

  `area_type` smallint(1) DEFAULT NULL COMMENT '会员地区类别：1-中华人民共和国，2-其它国家或地区',
  `area_name` varchar(256) DEFAULT NULL COMMENT '地区名称',
  `auth_name` varchar(256) DEFAULT NULL COMMENT '认证名称',

  `card_no` varchar(128) NOT NULL COMMENT '身份证号码',
  `card_home` varchar(128) DEFAULT NULL COMMENT '证件封面',
  `card_back` varchar(128) DEFAULT NULL COMMENT '证件背面',
  `card_hand` varchar(128) DEFAULT NULL COMMENT '手持身份证',

  `card_start_time` varchar(20) DEFAULT NULL COMMENT '身份证起始时间',
  `card_end_time` varchar(20) DEFAULT NULL COMMENT '身份证结束时间',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',

  PRIMARY KEY (`id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='用户认证信息记录表'
AUTO_INCREMENT=1
;
