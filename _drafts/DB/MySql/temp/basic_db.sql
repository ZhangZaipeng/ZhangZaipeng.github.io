DROP TABLE IF EXISTS `tb_coin`;
CREATE TABLE `tb_coin`(
	`coin_id` INT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

  `coin_name_cn` varchar(20) NOT NULL COMMENT '交易币种 中文名称',

	`coin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',

	`sort` SMALLINT(1) DEFAULT '0' COMMENT '排序',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 关闭 1 开启' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
  PRIMARY KEY (`coin_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
COMMENT='币种'
AUTO_INCREMENT=1
;

-- 房价走势图
