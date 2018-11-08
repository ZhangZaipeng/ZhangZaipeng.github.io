-- 交易次数 ： 买卖 成功下单次数
-- 历史成交 ： 买卖 某个交易币种的数量 975.52 BTC
-- 好评度 ： 好评次数/总次数（总下单次数）
-- 评价总分数 （非常愉快 2 ，还好 1， 很糟糕 -1）， 默认为 1

-- 用户 信用记录
DROP TABLE IF EXISTS `tb_user_credit`;
CREATE TABLE `tb_user_credit`(

	`user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `success_onum` INT(11) DEFAULT '0' COMMENT '买卖 成功下单次数',
  `history_tran_number` decimal(8,8)
  `trade_total` decimal(8,4) DEFAULT '0' COMMENT '好评度 ',
  `comment_score` INT(11) DEFAULT '0' COMMENT '评价总分数（非常愉快 2 ，还好 1， 很糟糕 -1）',

  `trade_number` decimal(20,10) DEFAULT NULL COMMENT '交易 数量',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

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
