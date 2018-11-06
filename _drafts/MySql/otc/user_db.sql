-- 用户表
CREATE TABLE `tb_user` (
	`user_id` BIGINT(11) NOT NULL AUTO_INCREMENT COMMENT '用户编号',
	`real_name` VARCHAR(20) NULL COMMENT '真实姓名',
	`nick_name` VARCHAR(20) NULL COMMENT '昵称',

	`gender` VARCHAR(2) NULL COMMENT '男/女',
	`nric` VARCHAR(20) NULL COMMENT '身份证号',
	`mobile` VARCHAR(20) NULL COMMENT '手机号',
	`birthdate` TIMESTAMP NULL COMMENT '出生日期',
	`icon_img_url` VARCHAR(128) NULL COMMENT '头像',
	`nric_pic_img_url` VARCHAR(128) NULL COMMENT '身份证正面',
	`nric_pic2_img_url` VARCHAR(128) NULL COMMENT '身份证反面',
	`point` BIGINT(11) DEFAULT '0'  COMMENT '积分',

	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_id`)
)
COLLATE='utf8_general_ci'
ENGINE=InnoDB
ROW_FORMAT=DEFAULT
COMMENT='用户表'
AUTO_INCREMENT=98000000
;

-- 用户登录表
DROP TABLE IF EXISTS `tb_user_agent`;
CREATE TABLE `tb_user_agent` (
	`user_agent_id` BIGINT(20) NOT NULL AUTO_INCREMENT COMMENT '用户登录编号',
	`user_id` BIGINT(20) COMMENT '用户编号',
	`login_name` varchar(50) NULL COMMENT '登录名',
	`login_pwd` varchar(100) NULL COMMENT '登录密码',

	`telephone` varchar(20) NULL COMMENT '电话',
	`email` varchar(128) NULL COMMENT '邮箱',

	`last_login_time` TIMESTAMP NULL COMMENT '最后登录时间',
	`login_count` INTEGER NULL COMMENT '登录次数',

	`deleted` SMALLINT(1) NULL DEFAULT '0' COMMENT '0 有效 1 无效',
	`created_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
	`updated_at` TIMESTAMP NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '最后修改时间',

	PRIMARY KEY (`user_agent_id`),
	UNIQUE KEY `idx_telephone` (`telephone`),
	INDEX `idx_user_agent_id` (`user_agent_id`)
)
ENGINE=InnoDB
COLLATE='utf8_general_ci'
ROW_FORMAT=DEFAULT
COMMENT='客户登录'
AUTO_INCREMENT=1
;