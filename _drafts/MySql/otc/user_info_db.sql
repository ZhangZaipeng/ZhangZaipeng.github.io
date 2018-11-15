-- 用户表
CREATE TABLE `tb_user` (
	`user_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',

	`uname` VARCHAR(20) NULL COMMENT '用户名',
  `icon_img_url` VARCHAR(128) NULL COMMENT '头像',

  `mobile` VARCHAR(20) NULL COMMENT '手机号',
  `email` varchar(128) NULL COMMENT '邮箱',

  `auth_level` smallint(1) DEFAULT '0' COMMENT '认证等级：0-普通，1-实名，2-进阶',

  -- 接收订单邮件通知

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
COMMENT='用户表'
AUTO_INCREMENT=98000000
;

-- 用户登录表
DROP TABLE IF EXISTS `tb_user_agent`;
CREATE TABLE `tb_user_agent` (
	`user_agent_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '用户登录编号',
	`user_id` BIGINT(20) COMMENT '用户编号',
	`login_name` varchar(50) NULL COMMENT '登录名',
	`login_pwd` varchar(100) NULL COMMENT '登录密码',

	`telephone` varchar(20) NULL COMMENT '电话',
	`email` varchar(128) NULL COMMENT '邮箱',

	`last_login_time` TIMESTAMP NULL COMMENT '最后登录时间',
	`login_count` INTEGER NULL COMMENT '登录次数',

	`deleted` SMALLINT(1) NULL DEFAULT '0' COMMENT '0 有效 1 无效',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_agent_id`),
	UNIQUE KEY `idx_telephone` (`telephone`),
	INDEX `idx_user_agent_id` (`user_agent_id`)
)
ENGINE=InnoDB
COLLATE='utf8_general_ci'
ROW_FORMAT=DEFAULT
COMMENT='客户登录'
AUTO_INCREMENT=1
;

-- 用户认证信息记录表
CREATE TABLE `tb_user_auth` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户编号',

  `area_type` smallint(1) DEFAULT NULL COMMENT '会员地区类别：1-中华人民共和国，2-其它国家或地区',
  `area_name` varchar(256) DEFAULT NULL COMMENT '地区名称',
  `auth_name` varchar(256) DEFAULT NULL COMMENT '认证名称',

  `card_no` varchar(128) DEFAULT NULL COMMENT '身份证号码',
  `card_home` varchar(128) DEFAULT NULL COMMENT '证件封面',
  `card_back` varchar(128) DEFAULT NULL COMMENT '证件背面',
  `card_hand` varchar(128) DEFAULT NULL COMMENT '手持身份证',

  `card_start_time` varchar(20) DEFAULT NULL COMMENT '身份证起始时间',
  `card_end_time` varchar(20) DEFAULT NULL COMMENT '身份证结束时间',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',

  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=utf8
ROW_FORMAT=COMPACT
COMMENT='用户认证信息记录表';

-- 用户 收款 账号
CREATE TABLE `tb_user_payment_account` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) DEFAULT NULL COMMENT '用户编号',
  `payment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '支付 id',

  `account_info` varchar(256) DEFAULT NULL COMMENT '收款 账户信息',
  `account_img_url` varchar(256) DEFAULT NULL COMMENT '收款 账户图片',
  `show_order_page` SMALLINT(1) NULL DEFAULT '1' COMMENT '是否 展示在订单页面 0 否 1是',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',

  PRIMARY KEY (`id`),
  UNIQUE KEY `uniq_user_payment_id` (`user_id`,`payment_id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=utf8
ROW_FORMAT=COMPACT
COMMENT='用户 收款 账号表';

-- 用户 信任名单 信息
CREATE TABLE `tb_user_trust_list`(
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',

  `to_user_id` bigint(11) NOT NULL COMMENT '对方用户编号',

  `source` varchar(50) DEFAULT NULL COMMENT '信任来源',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=utf8
ROW_FORMAT=COMPACT
COMMENT='用户 信任名单 信息';

-- 用户 黑名单 信息
CREATE TABLE `tb_user_black_list`(
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) NOT NULL COMMENT '用户编号',

  `to_user_id` bigint(11) NOT NULL COMMENT '对方用户编号',
  `source` varchar(50) DEFAULT NULL COMMENT '信任来源',

  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=utf8
ROW_FORMAT=COMPACT
COMMENT='用户 黑名单 信息';
