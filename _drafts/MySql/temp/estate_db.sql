-- 首页广告  banner
DROP TABLE IF EXISTS `tb_banner`;
CREATE TABLE `tb_banner`(

  `banner_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',

  `banner_url` varchar(100) NOT NULL COMMENT '图片URL',
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='首页广告 表'
;

-- 开发商 表
DROP TABLE IF EXISTS `tb_develop_business`;
CREATE TABLE `tb_develop_business`(

  `develop_bus_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `develop_bus_name` varchar(100) NOT NULL COMMENT '开发商 名称',

  `coin_name_en` varchar(20) NOT NULL COMMENT '对应 币种 英文名称（大写）',
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='开发商 表'
;

-- 户型表 关联 开发商
DROP TABLE IF EXISTS `tb_nhouse_type`;
CREATE TABLE `tb_nhouse_type`(
  `nhouse_type_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `develop_bus_id` BIGINT(11) NOT NULL COMMENT '开发商ID',

	`nhouse_name` varchar(50) NOT NULL COMMENT '户型名称',
	`nhouse_desc` varchar(255) NOT NULL COMMENT '户型简介',
	`nhouse_num` int(11) DEFAULT '0' COMMENT '户型 存量',
  `nhouse_acreage` DECIMAL(10,2) NOT NULL COMMENT '户型 面积',
	`nhouse_price` DECIMAL(15,5) NOT NULL COMMENT '户型 单价',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 有效 1 无效 9 删除' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`nhouse_type_id`),
	INDEX `idx_user_id` (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='new 新房 户型表 '
;


-- 新房 轮播图表
DROP TABLE IF EXISTS `tb_nhouse_banner`;
CREATE TABLE `tb_nhouse_banner`(
  `nhouse_banner_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `nhouse_type_id` BIGINT(11) NOT NULL COMMENT '户型ID',

	`desc` varchar(255) DEFAULT NULL COMMENT '备注',
	`url` varchar(255) DEFAULT NULL COMMENT '图片路径',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 有效 1 无效 9 删除' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`nhouse_banner_id`),
	INDEX `idx_user_id` (`nhouse_type_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='新房 轮播图表 '
;


-- 新房 详细介绍图表
DROP TABLE IF EXISTS `tb_nhouse_img`;
CREATE TABLE `tb_nhouse_img`(
  `nhouse_img_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `nhouse_type_id` BIGINT(11) NOT NULL COMMENT '户型ID',

	`desc` varchar(255) DEFAULT NULL COMMENT '备注',
	`url` varchar(255) DEFAULT NULL COMMENT '图片路径',

	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 有效 1 无效 9 删除' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`nhouse_img_id`),
	INDEX `idx_user_id` (`nhouse_type_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='新房 详细介绍图表'
;


-- 新房订单表
DROP TABLE IF EXISTS `tb_nhouse_order`;
CREATE TABLE `tb_nhouse_order`(
  `nhouse_order_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `user_id` BIGINT(11) NOT NULL COMMENT '用户编号',
  `nhouse_type_id` BIGINT(11) NOT NULL COMMENT '户型ID',

  `develop_bus_name` varchar(100) NOT NULL COMMENT '开发商 名称',
	`coin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',
  `trans_price` DECIMAL(15,5) NOT NULL COMMENT '当时 交易单价',
  `total_price` DECIMAL(15,5) NOT NULL COMMENT '交易总价',

  `nhouse_snap_name` varchar(20) NOT NULL COMMENT '户型名称',
	`nhouse_snap_desc` varchar(20) NOT NULL COMMENT '户型简介',
  `nhouse_snap_acreage` DECIMAL(10,2) NOT NULL COMMENT '户型 面积',
	`nhouse_snap_price` DECIMAL(15,5) NOT NULL COMMENT '户型 单价',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`advert_house_id`),
	INDEX `idx_user_id` (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='new 新房 订单表'
;

-- 二手房交易 表
DROP TABLE IF EXISTS `tb_advert_ohouse`;
CREATE TABLE `tb_advert_ohouse`(
  `advert_ohouse_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `user_id` BIGINT(11) NOT NULL COMMENT '用户编号',

	`coin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',
	`trans_num` DECIMAL(15,5) NOT NULL COMMENT '交易交易数量',

	-- 价格设置 （浮动价格，固定价格）
  `price_type` SMALLINT(1) NOT NULL COMMENT '设置价格类型 1 浮动价格 2 固定价格',
  `overflow_ratio` DECIMAL(10,4) DEFAULT NULL COMMENT '溢价比例',
  `fixed_price` DECIMAL(10,4) DEFAULT NULL COMMENT '固定价格',

  -- 交易限额
	`trans_floor` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 最低限额',
	`trans_ceiling` DECIMAL(15,5) DEFAULT NULL COMMENT'交易 最高限额',

  `advert_type` SMALLINT(1) NOT NULL COMMENT '广告类型 1 买 2 卖',
	`status` SMALLINT(1) DEFAULT '1' COMMENT '状态 0 下架 1 上架 9 删除' ,

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`advert_house_id`),
	INDEX `idx_user_id` (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='old 二手房交易 表'
;

-- 二手房 订单表
DROP TABLE IF EXISTS `tb_ohouse_order`;
CREATE TABLE `tb_ohouse_order`(
  `ohouse_order_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '自增长主键',
  `user_id` BIGINT(11) NOT NULL COMMENT '用户编号',
  `advert_ohouse_id` BIGINT(11) NOT NULL COMMENT '二手广告ID',

	`coin_name_en` varchar(20) NOT NULL COMMENT '交易币种 英文名称（大写）',
	`trans_num` DECIMAL(15,5) NOT NULL COMMENT '交易交易数量',
  `trans_price` DECIMAL(15,5) NOT NULL COMMENT '当时 交易单价',
  `total_price` DECIMAL(15,5) NOT NULL COMMENT '交易总价',

  `type` SMALLINT(1) NOT NULL COMMENT '广告类型 1 买 2 卖',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',
	PRIMARY KEY (`advert_house_id`),
	INDEX `idx_user_id` (`user_id`)
)
COLLATE='utf8_unicode_ci'
ENGINE=INNODB
ROW_FORMAT=DEFAULT
DEFAULT CHARSET=utf8
AUTO_INCREMENT=1
COMMENT='old 二手房 订单表'
;
