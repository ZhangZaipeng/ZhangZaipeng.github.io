-- 交易 币种
DROP TABLE IF EXISTS `tb_trade_coin`;
CREATE TABLE `tb_trade_coin`(
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

insert into tb_trade_coin (tcoin_name_cn, tcoin_name_en) values ('比特币','BTC');
insert into tb_trade_coin (tcoin_name_cn, tcoin_name_en) values ('泰达币','USDT');


-- 计价 币种
DROP TABLE IF EXISTS `tb_limit_coin`;
CREATE TABLE `tb_limit_coin`(
  `lcoin_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

	`lcoin_name_cn` varchar(20) NOT NULL COMMENT '计价币种 中文名称',

	`lcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 关闭 1 开启' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`lcoin_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='计价 币种'
AUTO_INCREMENT=1
;

insert into tb_limit_coin (lcoin_name_cn,lcoin_name_en) values ('人民币','CNY');
insert into tb_limit_coin (lcoin_name_cn,lcoin_name_en) values ('美元','USD');


-- 支付方式
DROP TABLE IF EXISTS `tb_payment`;
CREATE TABLE `tb_payment`(
	`payment_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

	`lcoin_id`  INT(11) NOT NULL COMMENT '计价币种 id',

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
