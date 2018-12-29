-- 借贷 广告表
DROP TABLE IF EXISTS `tb_borrow_advert`;
CREATE TABLE `tb_borrow_advert` (
  `b_advert_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `user_id` BIGINT(11) NOT NULL COMMENT '用户编号',

  `coin_id` BIGINT(11) NOT NULL COMMENT '抵押币种ID',
  `coin_name_en` BIGINT(11) NOT NULL COMMENT '抵押币种 大写',

  `annualized_rate` decimal(10,4) NOT NULL COMMENT '年化率',
  `pledge_rate` int(11) NOT NULL COMMENT '质押率 1：50%，2：55%，3：60%，4：65%，5：70%',
  `time_limit` int(11) NOT NULL COMMENT '借贷期限 30天，60天，90天，120天',
  `min_limit` decimal(20,5) NOT NULL COMMENT '借贷 最小借贷上限',
  `interest_type` SMALLINT(1) NOT NULL COMMENT '付息方式 1 周期付 2 到期付 3 按天付',
  `back_interest` SMALLINT(1) DEFAULT '1' COMMENT '回款方式 1 先息后本',

  `coin_num` BIGINT(11) NOT NULL COMMENT '抵押币种 数量',
  `remain_coin_num` decimal(20,5) DEFAULT '0' COMMENT '剩余 抵押币种 数量',
  `total_borrow_num` decimal(20,5) NOT NULL COMMENT '总借贷数量 USDT ',
  `remain_borrow_num` decimal(20,5) DEFAULT '0' COMMENT '剩余借贷数量',

	`type` SMALLINT(1) NOT NULL COMMENT '1 借款 2 放款',
	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 下架 1 上架 9 删除' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`b_advert_id`),
	INDEX `idx_user_id` (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='借贷 广告表'
AUTO_INCREMENT=1
;

-- 借贷 合约
CREATE TABLE `tb_borrow_contract` (
  `contract_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

  `b_advert_id` BIGINT(11) NOT NULL COMMENT '借贷 ID',
  `borrow_user_id` BIGINT(11) NOT NULL COMMENT '借款 用户编号',
  `loan_user_id` BIGINT(11) NOT NULL COMMENT '贷款 用户编号',

  `coin_name_en` BIGINT(11) NOT NULL COMMENT '抵押币种 大写',
  `coin_num` BIGINT(11) NOT NULL COMMENT '抵押币种 数量',
  `total_borrow_num` decimal(20,5) NOT NULL COMMENT '总借贷数量 USDT ',
  `annualized_rate` decimal(10,4) NOT NULL COMMENT '年化率',
  `pledge_rate` int(11) NOT NULL COMMENT '质押率 1：50%，2：55%，3：60%，4：65%，5：70%',
  `time_limit` int(11) NOT NULL COMMENT '借贷期限 7天 15天 30天，60天，90天，120天',
  `interest_type` SMALLINT(1) NOT NULL COMMENT '付息方式 1 周期付(固定30天) 2 到期付 3 按天付',

  `start_interest_date` TIMESTAMP NOT NULL COMMENT '起息时间',
  `next_interest_date` TIMESTAMP NOT NULL COMMENT '下一期 还息时间',
  `end_interest_date` TIMESTAMP NOT NULL COMMENT '到息时间',

	`status` SMALLINT(1) NOT NULL COMMENT '1 执行中 2 违约 3 完成',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`contract_id`),
	INDEX `idx_b_advert_id` (`b_advert_id`),
	INDEX `idx_borrow_user_id` (`borrow_user_id`),
	INDEX `idx_loan_user_id` (`loan_user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='借贷 合约表'
AUTO_INCREMENT=1
;

-- 借贷 收益流水
CREATE TABLE `tb_borrow_record` (
  `record_id` BIGINT(11) NOT NULL COMMENT '自增长主键',
  `contract_id` BIGINT(11) NOT NULL COMMENT '合约 ID',

  `coin_name_en` BIGINT(11) NOT NULL COMMENT '币种 大写',

  `amount` decimal(20,5) NOT NULL COMMENT '金额',

	`type` SMALLINT(1) NOT NULL COMMENT '1 放款收益 2 贷款利息 3 违约金 4 还款 5 收款',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`record_id`),
	INDEX `idx_contract_id` (`contract_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='借贷 收益流水'
AUTO_INCREMENT=1
;
