-- 用户表
CREATE TABLE `tb_user` (
	`user_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
	`real_name` VARCHAR(20) NULL COMMENT '真实姓名',
	`nick_name` VARCHAR(20) NULL COMMENT '昵称',

	`gender` VARCHAR(2) NULL COMMENT '男/女',
	`nric` VARCHAR(20) NULL COMMENT '身份证号',
	`mobile` VARCHAR(20) NULL COMMENT '手机号',
	`birthdate` TIMESTAMP NULL COMMENT '出生日期',
	`icon_img_url` VARCHAR(128) NULL COMMENT '头像',
	`nric_pic_img_url` VARCHAR(128) NULL COMMENT '身份证正面',
	`nric_pic2_img_url` VARCHAR(128) NULL COMMENT '身份证反面',
	`point` BIGINT(11) DEFAULT '0'  COMMENT '积分',

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

-- 用户资产表
CREATE TABLE `tb_user_asset` (
  `asset_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) NOT NULL COMMENT '用户标识',

  `tcoin_id` bigint(11) NOT NULL COMMENT '交易 币种ID',
  `currency` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `balance` decimal(40,18) DEFAULT '0.000000000000000000' COMMENT '用户总资产',
  `available` decimal(40,18) DEFAULT '0.000000000000000000' COMMENT '用户可用资产',
  `freez` decimal(40,18) DEFAULT '0.000000000000000000' COMMENT '用户冻结资产',

  `status` smallint(1) DEFAULT '1' COMMENT '状态：1-正常，2-删除',

  `crypto_address` varchar(255) DEFAULT NULL COMMENT '资产充值地址',
  `account_pwd` varchar(255) DEFAULT NULL COMMENT '账户创建密码',
  `iv` varchar(256) DEFAULT NULL COMMENT '',

  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

  PRIMARY KEY (`asset_id`),
  UNIQUE KEY `uniq_currency_crypto_address` (`currency`,`crypto_address`),
  UNIQUE KEY `uniq_user_id_coin_id` (`user_id`,`tcoin_id`)
) ENGINE=InnoDB
AUTO_INCREMENT=1
DEFAULT CHARSET=utf8
COMMENT='用户资产信息';


CREATE TABLE `tb_user_asset_record` (
  `record_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',

  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `trans_no` char(40) NOT NULL COMMENT '对应表单唯一ID',

  `total_amount` decimal(40,18) DEFAULT NULL COMMENT '总金额',
  `detail` varchar(30) DEFAULT NULL COMMENT '记录 明细',

  `record_type` smallint(1) NOT NULL COMMENT '1.买 2卖',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`record_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_trans_no` (`trans_no`) USING BTREE,
  KEY `idx_created_at` (`created_at`),
  KEY `idx_record_type` (`record_type`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=1 DEFAULT CHARSET=utf8
COMMENT='用户资金流水记录表';
