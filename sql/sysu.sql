/*
* 用户信息表
* 暂定
*/
USE hfuu_shop;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL,
  `username` char(255) COLLATE utf8_bin NOT NULL,
  `password` char(255) COLLATE utf8_bin NOT NULL,
  `stu_num` char(255) COLLATE utf8_bin DEFAULT NULL,
  `name` char(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;