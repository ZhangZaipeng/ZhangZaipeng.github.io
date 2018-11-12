-- 下单表
DROP TABLE IF EXISTS `tb_order`;
CREATE TABLE `tb_order`(
  `order_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '订单id',
	`trade_no` char(40) NOT NULL COMMENT ' 订单号 编号',
	`user_id` bigint(11) NOT NULL COMMENT '用户ID',

  `unit_price` decimal(20,10) DEFAULT NULL COMMENT '交易 单价',
  `trade_total` decimal(20,10) DEFAULT NULL COMMENT '交易 总额',
  `vcoin_name_en` varchar(20) NOT NULL COMMENT '计价币种 英文名称（大写）',

  `trade_number` decimal(20,10) DEFAULT NULL COMMENT '交易 数量',
  `tcoin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

  `pay_prompt` TIMESTAMP NOT NULL COMMENT '付款期限 ',
  `status` smallint(1) DEFAULT '0' COMMENT '订单状态 0：进行中， 1：已完成， 2：已取消',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`trade_no`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
COMMENT='用户下单表'
AUTO_INCREMENT=1
;

-- 当天取消三笔订单，被投诉冻结账户


-- 交易流程 （买）
-- 查看广告 --> 买家下单 --> 买家支付 --> 3小时内上传支付凭证 , 标记订单完成 --> 等待释放数字货币
                      --> 锁定卖家资产
                      --> 卖家等待到账


-- 交易流程 （卖）
-- 查看广告 --> 买家下单 --> 卖家等待到账 --> 卖家确认到账 --> 卖家点击释放数字货币
                      --> 卖家锁定资产
                      --> 买家支付
