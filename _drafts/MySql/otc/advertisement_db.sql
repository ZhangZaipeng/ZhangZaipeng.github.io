-- 普通广告主表
DROP TABLE IF EXISTS `tb_advertisement`;
CREATE TABLE `tb_advertisement`(
	`advert_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

	-- 价格设置 （浮动价格，固定价格）

	-- 付款期限

  `advert_type` SMALLINT(1) NOT NULL COMMENT '广告类型 0 收购 1 出售',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

	`lcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',
	`floor` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 最低限额',
	`ceiling` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 最高限额',

	`payment_id` INT(11) DEFAULT NULL COMMENT'支付方式 id',

	`instruction` text DEFAULT NULL COMMENT '交易说明',
  `remark` text DEFAULT NULL COMMENT '交易备注',

  `max_process_order` INT(11) DEFAULT '0' COMMENT '最大订单处理量',
  `must_auth` SMALLINT(1) DEFAULT '0' COMMENT '是否必须通过 实名认证, 0 否 1 是',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 下架 1 上架' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`advert_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='普通广告主表'
AUTO_INCREMENT=1
;


-- 批量 广告主表
DROP TABLE IF EXISTS `tb_batch_advertisement`;
CREATE TABLE `tb_batch_advertisement`(
	`advert_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

  -- 付款期限

  `advert_type` SMALLINT(1) NOT NULL COMMENT '广告类型 0 收购 1 出售',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',
	`lcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',

	`amount` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 数量',
  `price` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 单价',

	`payment_id` INT(11) DEFAULT NULL COMMENT'支付方式 id',
  `cust_name` varchar(20) DEFAULT NULL COMMENT'收款人 姓名',
  `cust_account` varchar(50) DEFAULT NULL COMMENT'收款人 账号',
  `cust_contact` varchar(50) DEFAULT NULL COMMENT'收款人 联系方式',

  `must_auth` SMALLINT(1) DEFAULT '0' COMMENT '是否必须通过 实名认证, 0 否 1 是',

  `remark` text DEFAULT NULL COMMENT '交易备注',

	`expired_time` TIMESTAMP NOT NULL COMMENT '过期时间' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`advert_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='广告主表'
AUTO_INCREMENT=1
;
