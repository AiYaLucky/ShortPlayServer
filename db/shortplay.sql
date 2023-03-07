/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : 127.0.0.1:3306
 Source Schema         : shorttv

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 20/02/2023 23:29:12
*/

-- ----------------------------
-- 创建数据库，如果存在则清空
-- ----------------------------
DROP DATABASE IF EXISTS shortplay;
CREATE DATABASE IF NOT EXISTS shortplay CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- ----------------------------
-- 切换到创建的数据库
-- ----------------------------
USE shortplay;

/*下面开始创建数据表*/
-- ----------------------------
-- 用户数据表
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`
(
    `uid`      varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户唯一id',
    `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户昵称',
    `account`  varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户邮件',
    `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '用户邮件',
    `email`    varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '地址',
    `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '用户生日',
    `address`  varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NULL DEFAULT NULL COMMENT '地址',
    `phone`    bigint(0)                                                     NULL DEFAULT NULL COMMENT '电话号码',
    PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user`
VALUES ('3bf7cd0a-b8BC-BdAc-c2D5-D7327efDe1C9', '陆秀兰', '123', '123', 'h.tivbcssy@cdmkr.hm', '1972-07-03',
        '新疆维吾尔自治区 阿勒泰地区 哈巴河县', 18633478319);

-- ----------------------------
-- 视频数据表
-- ----------------------------
DROP TABLE IF EXISTS `video_list`;
CREATE TABLE `video_list`
(
    `id`       int(0)                                                        NOT NULL AUTO_INCREMENT COMMENT '自增id',
    `imgurl`   varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频展示图片url',
    `videourl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频url',
    `desc`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '剧集说明',
    `name`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '剧集名称',
    `videoid`  int(0)                                                        NOT NULL COMMENT '剧集标识',
    `epnum`    int(0)                                                        NOT NULL COMMENT '剧集编号',
    `type`     varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci  NOT NULL COMMENT '类别名称',
    PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB
  AUTO_INCREMENT = 1
  CHARACTER SET = utf8mb4
  COLLATE = utf8mb4_general_ci COMMENT = '用户视频数据表'
  ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of video_list
-- ----------------------------
INSERT INTO `video_list`
VALUES (1,
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F31c1f675-1d37-4722-97e6-94e7e2bb0255%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1680678765&t=b919a819259551e8bc062dca978806af',
        'http://aiyalucky.f3322.net/tjjq.mp4', '我不是药神', '我不是药神', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (2,
        'https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fsafe-img.xhscdn.com%2Fbw1%2F5f1fd0ff-6daf-45c2-8b74-964a8ff67050%3FimageView2%2F2%2Fw%2F1080%2Fformat%2Fjpg&refer=http%3A%2F%2Fsafe-img.xhscdn.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1680678765&t=94c4fd2e7cbc486b76ae37008500037b',
        'http://aiyalucky.f3322.net/tjjq.mp4', '中国药神', '中国药神', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (3, 'https://img.zcool.cn/community/01a045609be25811013f4720410657.jpg@1280w_1l_2o_100sh.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '心里有数', '心里有数', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (4, 'https://images.uiiiuiii.com/wp-content/uploads/2021/05/i-poster-zyj-210523-2-15.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '秘密访客', '秘密访客', 1, 1, '奇幻');
INSERT INTO `video_list`
VALUES (5, 'http://t13.baidu.com/it/u=2201369358,289619178&fm=224&app=112&f=JPEG?w=500&h=500',
        'http://aiyalucky.f3322.net/tjjq.mp4', 'memories os murder', 'memories os murder', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (6,
        'https://pics6.baidu.com/feed/e824b899a9014c08a735dc66295573007af4f49a.jpeg?token=3362495a1d62598146ee3914be170568',
        'http://aiyalucky.f3322.net/tjjq.mp4', '绿巨人浩克', '绿巨人浩克', 1, 1, '奇幻');
INSERT INTO `video_list`
VALUES (7, 'https://i0.hdslb.com/bfs/article/5822ac6ac8ce369d50c029271f008a7a7a8111b3.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', 'AMOUR', 'AMOUR', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (8,
        'https://img.zcool.cn/community/01711b5bfb97c4a801209252b2b9cb.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100',
        'http://aiyalucky.f3322.net/tjjq.mp4', '绝地逃亡', '绝地逃亡', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (9, 'https://n.sinaimg.cn/sinakd20110/76/w690h986/20200310/3697-iqrhckm8907553.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '花木兰', '花木兰', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (10, 'https://images.uiiiuiii.com/wp-content/uploads/2021/06/i-poster-zyj-210606-2-11.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '河神2', '河神2', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (11, 'https://img.sj33.cn/uploads/allimg/200604/20060428171910881.jpg', 'http://aiyalucky.f3322.net/tjjq.mp4',
        '世界之战', '世界之战', 1, 1, '奇幻');
INSERT INTO `video_list`
VALUES (12, 'https://img.doooor.com/img/forum/201706/25/183324oeeihqlfbbbzzi62.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '泰坦尼克号', '泰坦尼克号', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (13, 'https://img0.baidu.com/it/u=4207483472,2503925342&fm=253&fmt=auto&app=138&f=JPEG?w=500&h=755',
        'http://aiyalucky.f3322.net/tjjq.mp4', '绣春刀', '绣春刀', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (14,
        'https://img.zcool.cn/community/01d3fb5e82051da801216518206177.jpg?x-oss-process=image/auto-orient,1/resize,m_lfit,w_1280,limit_1/sharpen,100',
        'http://aiyalucky.f3322.net/tjjq.mp4', '大话西游', '大话西游', 1, 1, '奇幻');
INSERT INTO `video_list`
VALUES (15, 'https://file.digitaling.com/eImg/uimages/20180703/1530590665474628.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '影', '影', 1, 1, '动作');
INSERT INTO `video_list`
VALUES (16, 'https://img1.baidu.com/it/u=544819868,150419940&fm=253&fmt=auto&app=138&f=JPEG?w=377&h=500',
        'http://aiyalucky.f3322.net/tjjq.mp4', '乘风破浪', '乘风破浪', 1, 1, '情感');
INSERT INTO `video_list`
VALUES (17, 'https://img.zcool.cn/community/011c28554281820000019ae985e07a.jpg@1280w_1l_2o_100sh.jpg',
        'http://aiyalucky.f3322.net/tjjq.mp4', '出埃及记', '出埃及记', 1, 1, '奇幻');
INSERT INTO `video_list`
VALUES (18, 'https://img.sj33.cn/uploads/allimg/201707/7-1FF1091411.jpg', 'http://aiyalucky.f3322.net/tjjq.mp4',
        '蜘蛛侠', '蜘蛛侠', 1, 1, '奇幻');

SET FOREIGN_KEY_CHECKS = 1;
