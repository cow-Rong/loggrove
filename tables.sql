CREATE TABLE IF NOT EXISTS `user`(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `username` VARCHAR(150) NOT NULL,
  `password` VARCHAR(128) NOT NULL,
  `fullname` VARCHAR(150),
  `email` VARCHAR(254) NOT NULL,
  `join_time` DATETIME NOT NULL,
  `role` TINYINT NOT NULL,
  `status` TINYINT NOT NULL,
  PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `session`(
  `session_id` VARCHAR(40) NOT NULL,
  `user_id` INT NOT NULL,
  `session_data` LONGTEXT NOT NULL,
  `create_time` DATETIME NOT NULL,
  `expire_time` DATETIME NOT NULL,
  PRIMARY KEY ( `session_id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `auditlog`(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `user_id` INT NOT NULL,
  `uri` VARCHAR(200) NOT NULL,
  `method` VARCHAR(10) NOT NULL,
  `reqdata` LONGTEXT,
  `record_time` DATETIME,
  PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `logfile`(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `location` TINYINT NOT NULL,
  `host` VARCHAR(200) NOT NULL,
  `path` VARCHAR(500) NOT NULL,
  `create_time` DATETIME,
  `comment` VARCHAR(200),
  PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `monitor_item`(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `logfile_id` INT NOT NULL,
  `search_pattern` VARCHAR(200) NOT NULL,
  `alert` TINYINT NOT NULL,
  `check_interval` INT,
  `trigger_format` VARCHAR(100),
  `dingding_webhook` VARCHAR(500),
  `create_time` DATETIME,
  `comment` VARCHAR(200),
  PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;


CREATE TABLE IF NOT EXISTS `monitor_count`(
  `id` INT UNSIGNED AUTO_INCREMENT,
  `logfile_id` INT NOT NULL,
  `monitor_item_id` INT NOT NULL,
  `count` INT NOT NULL,
  `count_time` DATETIME,
  PRIMARY KEY ( `id` )
)ENGINE=InnoDB DEFAULT CHARSET=utf8;