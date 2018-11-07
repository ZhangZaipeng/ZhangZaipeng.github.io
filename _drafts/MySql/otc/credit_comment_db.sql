交易次数 ： 买卖 某个交易币种的 下单次数
历史成交 ： 买卖 某个交易币种的数量 975.52 BTC
好评度 99.95%
评价数 +3936 / -2

-- 信用

-- 评论（非常愉快 2 ，还好 1， 很糟糕 -1）
-- 用户 信用记录
DROP TABLE IF EXISTS `tb_order_comment`;
CREATE TABLE `tb_user_credit`(

	`user_id` bigint(11) NOT NULL COMMENT '用户ID',
	`trade_no` char(40) NOT NULL COMMENT '交易 订单号',

  `unit_price` decimal(20,10) DEFAULT NULL COMMENT '交易 单价',
  `trade_total` decimal(20,10) DEFAULT NULL COMMENT '交易 总额',
  `lcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',

  `trade_number` decimal(20,10) DEFAULT NULL COMMENT '交易 数量',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `pay_prompt` TIMESTAMP NOT NULL COMMENT '付款期限 ',
  `status` smallint(1) DEFAULT '0' COMMENT '订单状态 0：进行中， 1：已完成， 2：已取消',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='用户下单表'
AUTO_INCREMENT=1
;
