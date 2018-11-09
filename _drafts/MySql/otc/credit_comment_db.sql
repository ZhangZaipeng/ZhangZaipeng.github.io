-- 交易次数 ： 买卖 成功下单次数
-- 历史成交量 ： 买卖 某个交易币种的数量 975.52 BTC
-- 好评度 ： 好评次数/总次数（总下单次数）
-- 评价总分数 （非常愉快 2 ，还好 1， 很糟糕 -1）， 默认为 1

-- 用户 信用记录
DROP TABLE IF EXISTS `tb_user_credit`;
CREATE TABLE `tb_user_credit`(
	`user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `success_trans_number` INT(11) DEFAULT '0' COMMENT '买卖 成功下单次数',
  `history_trans_number` decimal(20,8) COMMENT '买卖 历史成交量',
  `comment_ratio` decimal(8,4) DEFAULT '0' COMMENT '评论 比率',
  `comment_score` INT(11) DEFAULT '0' COMMENT '评价总分数 （非常愉快 +2 ，还好 +1， 很糟糕 -1）',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='用户 信用记录'
AUTO_INCREMENT=1
;


-- 用户 评价记录
DROP TABLE IF EXISTS `tb_comment`;
CREATE TABLE `tb_comment`(
  `comment_id` bigint(11) AUTO_INCREMENT COMMENT '自增长主键',
	`user_id` bigint(11) NOT NULL COMMENT '用户ID',
  `advert_id` BIGINT(11) NOT NULL '评论广告id',

  `passive_uname` varchar(20) NOT NULL COMMENT '被评价人 用户名',
  `content` varchar(255) DEFAULT NULL COMMENT '评论 内容',
  `type` SMALLINT(1) DEFAULT '1' COMMENT '评论 类型（2 好评 ，1 中评， -1 差评）' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='用户 信用记录'
AUTO_INCREMENT=1
;


