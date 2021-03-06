-- 用户资金流水记录表
CREATE TABLE `tb_user_asset_record` (
  `record_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '流水ID',

  `user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `trans_no` char(40) NOT NULL COMMENT '对应表单唯一ID',

  `amount` decimal(20,10) DEFAULT NULL COMMENT '总金额',
  `snap_assert` decimal(20,10) DEFAULT NULL COMMENT '备注资产快照',

  `record_detail` varchar(100) DEFAULT NULL COMMENT '记录 明细',

  `record_type` smallint(1) NOT NULL COMMENT '1.借款 2.贷款 3.新房买 4.二手房买 二手房卖',

  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `updated_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',

  PRIMARY KEY (`record_id`),
  KEY `idx_user_id` (`user_id`),
  KEY `idx_trans_no` (`trans_no`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='用户资金流水记录表';


-- 用户资产表
CREATE TABLE `tb_user_asset` (
  `asset_id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长',
  `user_id` bigint(11) NOT NULL COMMENT '用户标识',

  `tcoin_id` bigint(11) NOT NULL COMMENT '交易 币种ID',
  `currency` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `balance` decimal(20,8) DEFAULT '0' COMMENT '用户总资产',
  `available` decimal(20,8) DEFAULT '0' COMMENT '用户可用资产',
  `freez` decimal(20,8) DEFAULT '0' COMMENT '用户 冻结',
  `locked` decimal(20,8) DEFAULT '0' COMMENT '用户 锁仓',

  `status` smallint(1) DEFAULT '1' COMMENT '状态：1-正常，0-删除',

  `crypto_address` varchar(255) DEFAULT NULL COMMENT '资产充值地址',

  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

  PRIMARY KEY (`asset_id`),
  UNIQUE KEY `uniq_currency_crypto_address` (`currency`,`crypto_address`),
  UNIQUE KEY `uniq_user_id_coin_id` (`user_id`,`tcoin_id`)
) ENGINE=InnoDB
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='用户资产信息';
