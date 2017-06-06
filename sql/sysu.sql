/*
* 用户信息表
* 暂定
*/
USE sysu;
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(32) NOT NULL,
  `username` char(255) COLLATE utf8_bin NOT NULL,
  `password` char(255) COLLATE utf8_bin NOT NULL,
  `name` char(255) COLLATE utf8_bin DEFAULT NULL,
  `stu_num` char(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;


SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `collect`
-- ----------------------------
DROP TABLE IF EXISTS `collect`;
CREATE TABLE `collect` (
  `user_id` int(11) DEFAULT NULL,
  `goods_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of collect
-- ----------------------------

-- ----------------------------
-- Table structure for `goods`
-- ----------------------------
/*
* 商品信息表
* 暂定
*/
DROP TABLE IF EXISTS `goods`;
CREATE TABLE `goods` (
  `id` int(11) NOT NULL,
  `image` char(255) COLLATE utf8_bin NOT NULL,
  `type_id` int(11) NOT NULL COMMENT '类型id',
  `name` char(255) COLLATE utf8_bin NOT NULL COMMENT '商品名',
  `num` int(11) DEFAULT NULL COMMENT '数量',
  `price` float NOT NULL,
  `status` int(11) NOT NULL,
  `content` varchar(255) COLLATE utf8_bin NOT NULL,
  `producter_id` int(11) NOT NULL,
  `create_date` datetime NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- ----------------------------
-- Records of goods
-- ----------------------------
INSERT INTO `goods` VALUES ('1', 'static/goods_img/1.jpg', '4', '笔记本', '1', '4000', '2', '二手笔记本，8成新，I7处理器', '10', '2015-12-12 12:10:10');
INSERT INTO `goods` VALUES ('2', 'static/goods_img/2.jpg', '2', '被套', '1', '30', '2', '二手被套', '1017', '2015-12-16 02:34:01');
INSERT INTO `goods` VALUES ('3', 'static/goods_img/3.jpg', '2', '自行车', '1', '50', '2', '二手自行车', '1017', '2015-12-11 11:22:33');
INSERT INTO `goods` VALUES ('4', 'static/goods_img/4.jpg', '5', '网球拍', '1', '50', '2', '二手网球拍，用过几天，九成新', '123', '2015-12-17 11:00:16');
INSERT INTO `goods` VALUES ('5', 'static/goods_img/5.jpg', '5', '篮球', '1', '80', '2', '全牛皮篮球，', '9', '2015-12-17 11:02:57');
INSERT INTO `goods` VALUES ('6', 'static/goods_img/6.jpg', '2', '懒人桌', '1', '15', '2', '加固型懒人桌，九成新', '123', '2015-12-17 11:05:00');
INSERT INTO `goods` VALUES ('7', 'static/goods_img/7.jpg', '1', '考研书', '1', '30', '2', '聚星文登考研', '123', '2015-12-21 11:07:22');
INSERT INTO `goods` VALUES ('8', 'static/goods_img/8.jpg', '1', '公务员书', '1', '30', '2', '公务员考试书籍，9成新', '123', '2015-12-23 16:02:21');
INSERT INTO `goods` VALUES ('9', 'static/goods_img/9.jpg', '2', '凉席', '1', '60', '2', '寝室牛皮凉席', '123', '2015-12-23 16:20:46');
INSERT INTO `goods` VALUES ('10', 'static/goods_img/10.jpg', '2', '纯棉枕头', '1', '50', '2', '纯棉枕头', '123', '2015-12-23 16:21:37');