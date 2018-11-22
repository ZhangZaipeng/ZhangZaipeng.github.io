-- 交易 币种
DROP TABLE IF EXISTS `tb_trans_coin`;
CREATE TABLE `tb_trans_coin`(
	`tcoin_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

  `tcoin_name_cn` varchar(20) NOT NULL COMMENT '交易币种 中文名称',

	`tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 关闭 1 开启' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`tcoin_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='交易 币种'
AUTO_INCREMENT=1
;

insert into tb_trans_coin (tcoin_name_cn, tcoin_name_en) values ('比特币','BTC');
insert into tb_trans_coin (tcoin_name_cn, tcoin_name_en) values ('泰达币','USDT');


-- 计价 币种
DROP TABLE IF EXISTS `tb_valuation_coin`;
CREATE TABLE `tb_valuation_coin`(
  `vcoin_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

	`vcoin_name_cn` varchar(20) NOT NULL COMMENT '计价币种 中文名称',

	`vcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 关闭 1 开启' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`vcoin_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='法币种'
AUTO_INCREMENT=1
;

insert into tb_valuation_coin (vcoin_name_cn,vcoin_name_en) values ('人民币','CNY');
insert into tb_valuation_coin (vcoin_name_cn,vcoin_name_en) values ('美元','USD');

-- 交易费率表
CREATE TABLE `tb_tcoin_rate` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT COMMENT '自增长ID',
  `tcoin_id` bigint(11) DEFAULT NULL COMMENT '交易 币种 ID',
  `rate` decimal(20,8) DEFAULT NULL COMMENT '手续费',

  `created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`id`)
)
ENGINE=InnoDB
AUTO_INCREMENT=5
DEFAULT CHARSET=utf8
ROW_FORMAT=COMPACT COMMENT='交易 币种 费率';

-- 支付方式
DROP TABLE IF EXISTS `tb_payment_info`;
CREATE TABLE `tb_payment_info`(
	`payment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

	`vcoin_id`  INT(11) NOT NULL COMMENT '计价币种 id',

	`payment_name` varchar(20) DEFAULT NULL COMMENT'支付方式 名称',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`payment_type_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='支付方式'
AUTO_INCREMENT=1
;
