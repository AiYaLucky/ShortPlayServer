/*
 Navicat Premium Data Transfer

 Source Server         : 127.0.0.1
 Source Server Type    : MySQL
 Source Server Version : 80032
 Source Host           : localhost:3306
 Source Schema         : online_videos

 Target Server Type    : MySQL
 Target Server Version : 80032
 File Encoding         : 65001

 Date: 28/04/2023 16:55:27
*/
-- ----------------------------
-- 创建数据库，如果存在则清空
-- ----------------------------
DROP DATABASE IF EXISTS online_videos;
CREATE DATABASE IF NOT EXISTS online_videos CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;

-- ----------------------------
-- 切换到创建的数据库
-- ----------------------------
USE online_videos;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;


-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `uid` varchar(128) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户唯一id',
  `username` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户昵称',
  `account` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮件',
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '用户邮件',
  `email` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `birthday` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户生日',
  `address` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '地址',
  `phone` bigint(0) NULL DEFAULT NULL COMMENT '电话号码',
  PRIMARY KEY (`uid`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('3bf7cd0a-b8BC-BdAc-c2D5-D7327efDe1C9', '陆秀兰', '123', '123', 'h.tivbcssy@cdmkr.hm', '1972-07-03', '新疆维吾尔自治区 阿勒泰地区 哈巴河县', 18633478319);

-- ----------------------------
-- Table structure for video_list
-- ----------------------------
DROP TABLE IF EXISTS `video_list`;
CREATE TABLE `video_list`  (
  `id` int(0) NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `imgurl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频展示图片url',
  `videourl` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '视频url',
  `name` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '剧集名称',
  `desc` varchar(512) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '剧集说明',
  `videoid` int(0) NOT NULL COMMENT '剧集标识同一个数值说明是同一部剧',
  `epnum` int(0) NOT NULL COMMENT '剧集编号，0是封面，1开始才是具体的集数',
  `type` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '类别名称',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户视频数据表' ROW_FORMAT = Dynamic;

-- ----------------------------
-- 视频数据表初始数据
-- ----------------------------
/*国产电视剧*/
INSERT INTO `video_list` VALUES (1, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2887941178.webp', '', '星落凝成糖', '该剧是继《香蜜沉沉烬如霜》《冰糖炖雪梨》后“蜜糖三部曲”的收官之作。根据作家一度君华的同名小说改编，讲述了人族皇室的一对孪生公主受阴谋算计，错嫁天界与沉渊界，在一次次啼笑皆非的伪装中，原本相看两厌的错嫁夫妻们，竟逐渐相识相知萌生爱意...', 1, 0, '情感');
INSERT INTO `video_list` VALUES (2, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2887941178.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/577e5ead84c44271a7033ac2aa871f8b?filename=1.mp4', '星落凝成糖01', '归墟东丘的地脉紫芝生出一株双生花，花灵飘散入了人族皇后之腹，诞育出夜昙、青葵两位公主。青葵根骨清奇，携吉兆而生，被神族册为天妃。', 1, 1, '情感');
INSERT INTO `video_list` VALUES (3, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2887941178.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/d151293f6fea4936b3c4f9b767839428?filename=1.mp4', '星落凝成糖02', '玄商神君虽错认夜昙为青葵，对这门婚事万分不愿，但碍于天帝之命，也只好亲自率军接亲。沉渊领军之人是有勇无谋的大殿下乌玳和韬晦极深的三殿下嘲风。', 1, 2, '情感');
INSERT INTO `video_list` VALUES (4, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2887941178.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/ed33047eb20f4343b1bd343dd2a9aa3a?filename=1.mp4', '星落凝成糖03', '夜昙和青葵在魍魎城中碰面，二人细想换轿原委却不得头绪。夜昙虽记得撞破嘲风暗杀之事，可却不知嘲风身份。嘲风见青葵与夜昙重逢，以为错嫁之事难以遮掩，为免夜昙说出自己的秘密，嘲风决定秘密诛杀双花。', 1, 3, '情感');
INSERT INTO `video_list` VALUES (5, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2889960329.webp', '', '看见缘分的少女', '该剧讲述了一位动情就会得重病的练武奇才少女周缘，在女扮男装闯入京城的“青云书院”后，惹上了天生克妻的恨嫁小侯爷卫起的故事', 2, 0, '情感');
INSERT INTO `video_list` VALUES (6, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2889960329.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/44f13e94a8f64aaa896f6671760b5fe3?filename=1.mp4', '看见缘分的少女01', '卫起跪在红线庙里求姻缘，门外的侍卫聊得热火朝天，一人说卫起是在祈求国泰民安，另一人却指明这庙分明是姻缘庙，于是两人八卦起来，一人坚持说卫起是来求姻缘的，另一人则坚称，以卫起待婚榜榜首的位置，根本不需要求姻缘。', 2, 1, '情感');
INSERT INTO `video_list` VALUES (7, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2889960329.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/8e8eb9415a7f4f6390d89801e5159960?filename=1.mp4', '看见缘分的少女02', '一日后，城外，周缘正悠闲地半靠在马车上看风景，突然听到落水的声音，于是赶紧把跳河的陈姑娘救上岸，得知她被人逼婚，自告奋勇要为对方拦住那些胆敢来抢婚的人。', 2, 2, '情感');
INSERT INTO `video_list` VALUES (8, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2889960329.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/692aeea6adb945f6805ba8907fc2fd71?filename=1.mp4', '看见缘分的少女03', '卫起喝得烂醉倒在路边，周缘得知他很想要个朋友，又想替他找到正缘，便决定与他做朋友，好寻机断掉姻缘。卫起借着酒意，说想跟自己做朋友的周缘是个疯子，但他很快醉倒在地上。', 2, 3, '情感');
INSERT INTO `video_list` VALUES (9, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2888088879.webp', '', '九霄寒夜暖', '乾国“畏寒”女捕快苏玖儿（李一桐饰）与祺族“内热”少主寒狰（毕雯珺饰），因关乎两族关系的离奇凶案而相遇，为求快速破奇案，苏玖儿与寒狰两人从剑拔弩张走向互利合作。', 3, 0, '情感');
INSERT INTO `video_list` VALUES (10, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2888088879.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/1083ebb71de9467ca20bec572f9013f8?filename=1.mp4', '九霄寒夜暖01', '乾国的九霄城，有祺人混居于此。祺人来自朔北，可化身兽形，平日与乾人无异。但是近两年来，乾族律法难以约束天生异能的祺族，两族之间矛盾频发。 ', 3, 1, '情感');
INSERT INTO `video_list` VALUES (11, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2888088879.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/c7b13640abb54e52b60a28e2a0720a0e?filename=1.mp4', '九霄寒夜暖02', '苏玖儿和寒狰终于火海逃生，而就在百姓救火时，第三具尸体被凶手神不知鬼不觉抛弃在井中。 “花柳堂”东家大闹督查卫找苏玖儿讨说法，索要赔偿金。', 3, 2, '情感');
INSERT INTO `video_list` VALUES (12, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2888088879.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/4f5d42917701448a922cf828a2916f66?filename=1.mp4', '九霄寒夜暖03', '寒狰并未被苏玖儿钳制，反而以其人之道还治其人之身，狠狠整治了苏玖儿一番！苏玖儿确认寒狰能治好自己的五感尽失之症，忍气吞声向他发出了合作搭档、一起抓捕“三道疤”的邀请，却被对方狠狠拒绝。', 3, 3, '情感');
INSERT INTO `video_list` VALUES (13, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2890394683.webp', '', '尘封十三载', ' 1997年未能侦破的特殊杀人案件在13年后重现，当年一直没有追查到真凶的刑警卫峥嵘（陈建斌 饰）备受打击离开一线，而曾经初出茅庐的新警陆行知（陈晓 饰）褪去稚嫩青涩，已成为缜密细致的刑侦能手，案件的重重巧合让师徒二人再次走到了一起，合力追缉真凶。该剧改编自娄霄鹏的小说《黯夜之光》。', 4, 0, '悬疑');
INSERT INTO `video_list` VALUES (14, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2890394683.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/8bdee0f0812e42c3a145b17bc043bcbb?filename=1.mp4', '尘封十三载01', '卫起跪在红线庙里求姻缘，门外的侍卫聊得热火朝天，一人说卫起是在祈求国泰民安，另一人却指明这庙分明是姻缘庙，于是两人八卦起来，一人坚持说卫起是来求姻缘的，另一人则坚称，以卫起待婚榜榜首的位置，根本不需要求姻缘。', 4, 1, '悬疑');
INSERT INTO `video_list` VALUES (15, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2890394683.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/0478e61280634d7d83879c9e7f36ed1d?filename=1.mp4', '尘封十三载02', '一日后，城外，周缘正悠闲地半靠在马车上看风景，突然听到落水的声音，于是赶紧把跳河的陈姑娘救上岸，得知她被人逼婚，自告奋勇要为对方拦住那些胆敢来抢婚的人。', 4, 2, '悬疑');
INSERT INTO `video_list` VALUES (16, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2890394683.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/635b3fb94844452faa1e3c5712b269c0?filename=1.mp4', '尘封十三载03', '卫起喝得烂醉倒在路边，周缘得知他很想要个朋友，又想替他找到正缘，便决定与他做朋友，好寻机断掉姻缘。卫起借着酒意，说想跟自己做朋友的周缘是个疯子，但他很快醉倒在地上。', 4, 3, '悬疑');
INSERT INTO `video_list` VALUES (17, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2880707547.webp', '', '长月烬明', '为了解救被魔神澹台烬（罗云熙 饰）统治折磨的世界，衡阳宗掌门之女黎苏苏（白鹿 饰）孤注一掷，回到五百年前，化身叶家小女儿叶夕雾，阻止彼时尚未被邪念彻底侵蚀的景国质子澹台烬成为魔神。未料澹台烬竟是叶夕雾的丈夫，二人逐渐生出情愫，最终，黎苏苏以身证道，改变了澹台烬和世界的命运。', 5, 0, '情感');
INSERT INTO `video_list` VALUES (18, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2880707547.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/132b34ef28a4451c9ddec870ad3008fa?filename=1.mp4', '长月烬明01', '魔神乃世间罪业化身，带来灾厄带来死亡，他们总是滥杀无辜，这个世界因为他们而变得动荡不安。这次，魔神来到了逍遥宗，这里藏着一个过去镜。原本有一个仙门结界，魔神轻轻一动手指结界就被破坏了。', 5, 1, '情感');
INSERT INTO `video_list` VALUES (19, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2880707547.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/952cfb9518f8456489807c1459399982?filename=1.mp4', '长月烬明02', '叶夕雾来到房间看着这里并不熟悉的一切，她终于回到了500年前，如今她还有更重要的任务，虽然已经找到了澹台烬但是他现在也只是一介凡身，此时他还跪在冰天雪地中，今晚的日子确实非常难熬。', 5, 2, '情感');
INSERT INTO `video_list` VALUES (20, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2880707547.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/692aeea6adb945f6805ba8907fc2fd71?filename=1.mp4', '长月烬明03', '丫鬟们发现澹台烬总是和苍蝇蚊子说话，大家都觉得他是个神经病。因为在叶府没人和澹台烬说话，他也只能和这些动物说话。叶夕雾也担心澹台烬会因为憋久了才会成为魔神，所以整日都会悄悄跟着他。', 5, 3, '情感');
/*美剧*/
INSERT INTO `video_list` VALUES (21, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2648998976.webp', '', '鹿角男孩', '十年前，“大崩塌”对世界造成了严重破坏，并导致了神秘的混血儿的出现——出生时半人半兽的婴儿。由于不确定杂交种是病毒的起因还是结果，许多人害怕并猎杀它们。', 6, 0, '情感');
INSERT INTO `video_list` VALUES (22, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2648998976.webp', 'https://3662705163.qnqcdn.net:22443/qn-kLyjuqYdnIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/a0f0c740e76244ef8368091c752dfbc0/74e4444cf9524e00ad1fcfdf34c26b89-354e622ac9532206029440a3d8969456-hd.mp4?sign=091a0d7708336072ea412af315c419a9&t=644cc8a7&clientType=android_RRMJ', '鹿角男孩 01', '', 6, 1, '情感');
INSERT INTO `video_list` VALUES (23, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2648998976.webp', 'https://2045442737.qnqcdn.net:22443/qn-spfqG999bIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/415c90739fcc4bd2b209c4481f9b77b8/23ad3f02d03c47488f3406f08a4b4463-cf7a1562311b1738d6c745955a12458f-hd.mp4?sign=60a98e1a4e0118e91f377d124cbde131&t=644cd70e&clientType=android_RRMJ', '鹿角男孩 02', '', 6, 2, '情感');
INSERT INTO `video_list` VALUES (24, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2891222378.webp', '', '夺命护士', 'One early morning in March 2015, the Danish police received a call from a nurse at Nykøbing Falster Hospital. She suspects her close colleague of deliberately killing patients and fears that it has just happened again. ', 7, 0, '情感');
INSERT INTO `video_list` VALUES (25, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2891222378.webp', 'https://quuu.cc/cache/89b32b3431699216784967bbf7bcbe31.m3u8', '夺命护士 01', '', 7, 1, '情感');
INSERT INTO `video_list` VALUES (26, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2891222378.webp', 'https://quuu.cc/cache/a641f4feea944c7815f8515ec0309cec.m3u8', '夺命护士 02', '', 7, 2, '情感');
INSERT INTO `video_list` VALUES (27, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2889089541.webp', '', '爱与死亡', '', 8, 0, '情感');
INSERT INTO `video_list` VALUES (28, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2889089541.webp', 'https://3663521750.qnqcdn.net:22443/qn-m6yx7NCXaIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/481df2d0e57571edbffa0674a2ce0102/0a589b2c07ac4cc1bb4783fa5fedaa17-0a2f2c552e5ef6ce5a7e64014a1dce57-sd.mp4?sign=8149386da2481a06746b0ed112907bb0&t=644cc966&clientType=android_RRMJ', '爱与死亡 01', '', 8, 1, '情感');
INSERT INTO `video_list` VALUES (29, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2889089541.webp', 'https://1699992731.qnqcdn.net:22443/qn-eXgecMmLzIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/a41cf2f0e56d71ed80156723b78e0102/f725bf9faaf643c7bb5843eef4f62680-5acee8c993d707a8ea4e020898988cd8-hd.mp4?sign=b3dc05558bceeb1dda1ef6171671c3a9&t=644cc96b&clientType=android_RRMJ', '爱与死亡 02', '', 8, 2, '情感');
/*动漫剧集*/
INSERT INTO `video_list` VALUES (30, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551222097.webp', '', '鬼灭之刃', '日本大正时期，那是一个吃人的恶鬼横行的世界，一名家人被鬼杀死，妹妹也变成了鬼的主人公炭治郎，在猎鬼人的指引下，成为了鬼猎人组织“鬼杀队”的一员，为了让妹妹祢豆子变回人类，为了讨伐杀害家人的恶鬼，为了斩断悲伤的连锁而展开了战斗。', 9, 0, '情感');
INSERT INTO `video_list` VALUES (31, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551222097.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/f20b56145fa741e1a6060269a3bf378c?filename=1.mp4', '鬼灭之刃 01', '舞台是日本的大正时代，名叫灶门炭治郎的平凡农村少年，靠着卖炭来维持一家的生计。某天他下山去卖炭，回家时天色已暗，好心的三郎爷爷变留他住了一晚。', 9, 1, '情感');
INSERT INTO `video_list` VALUES (32, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551222097.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/67bdb0600a734c94aa222e624f9aba3d?filename=1.mp4', '鬼灭之刃 02', '在加入鬼杀队的最终选拔上，炭治郎与异形的鬼展开对峙，他用师父‧鳞泷传授的招式来应战！他能够通过选拔吗？之后，回到鳞泷身边的炭治郎，带着已经醒来的祢豆子', 9, 2, '情感');
INSERT INTO `video_list` VALUES (33, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2551222097.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/49e38381ade449d5bcd9adcecb7d0d30?filename=1.mp4', '鬼灭之刃 03', '炭治郎跟祢豆子对上操控手鞠跟箭头的两个鬼。炭治郎他们获得珠世跟愈史郎的协助，勇敢面对自称是鬼舞辻直属部下‧十二鬼月的鬼！', 9, 3, '情感');
INSERT INTO `video_list` VALUES (34, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2869306649.webp', '', '间谍过家家', '', 10, 0, '情感');
INSERT INTO `video_list` VALUES (35, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2869306649.webp', 'https://lf1-cdn-tos.bytegoofy.com/obj/tos-cn-v-0000/6e10814bc03c471ebea782db6522bbb7?filename=1.mp4', '间谍过家家 01', '西国情报局东国对策科“WISE”命令间谍“黄昏”前去调查企图推进东国战争计划的德斯蒙。“黄昏”假扮成了精神科医生劳埃德·福杰，为了能接触到与目标人物有关联的名门伊甸学园', 10, 1, '情感');
INSERT INTO `video_list` VALUES (36, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2869306649.webp', 'https://lf1-cdn-tos.bytegoofy.com/obj/tos-cn-v-0000/49f65892254948c8b85e33f6da1ce703?filename=1.mp4', '间谍过家家 02', '市政府事务员约尔·布莱尔，事实上有着一张“荆棘公主”的隐秘一面。约尔对于单女性会被怀疑是间谍的风潮感到不安。', 10, 2, '情感');
INSERT INTO `video_list` VALUES (37, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2869306649.webp', 'https://p9-sign.douyinpic.com/obj/tos-cn-v-0000c2367/c0db54da181c4dde936b344d0da819fe?filename=1.mp4&x-expires=1990965600&x-signature=d%2BcRFHQo7nrQ4Gv2A51Jcw4ZXYk%3D', '间谍过家家 03', '约尔搬去了劳埃德和阿尼亚的家里。在家族人员全部物色到后，家族成员都找到后，接下来就是做面试的准备了。', 10, 3, '情感');
INSERT INTO `video_list` VALUES (38, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2605274206.webp', '', '进击的巨人', '', 11, 0, '情感');
INSERT INTO `video_list` VALUES (39, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2605274206.webp', 'https://v3.douyinvod.com/c5ea292c8f97c1e46819e54bacd206ae/644b922b/video/tos/cn/tos-cn-v-0064/ecaec3fae15a4abcba0d7472c726b85a/?a=13&br=2383&bt=2383&btag=e00078030&cc=1f&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=4&filename=1.mp4&ft=iJtKqy7oZob0PD1Jct9Xg9wXHrl2kEeC~&l=202304281604386D0582F970DC4147A736&mime_type=video_mp4&net=5&qs=13&rc=M2Q6cWY6ZnZnZDMzNDQzM0BpM2Q6cWY6ZnZnZDMzNDQzM0AycTI1cjRvcnNgLS1kMTBzYSMycTI1cjRvcnNgLS1kMTBzcw%3D%3D', '进击的巨人 01', '', 11, 1, '情感');
INSERT INTO `video_list` VALUES (40, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2605274206.webp', 'https://v3.douyinvod.com/92936358ef1e63fb226a5ac5fa968e80/644b95f3/video/tos/cn/tos-cn-v-0064/39c45a59d2ca4617897bf5fcb132cc6e/?a=13&br=2384&bt=2384&btag=e00078030&cc=1f&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=4&filename=1.mp4&ft=iJtKqy7oZNF0PD1lGA9Xg9w5tpCTvEeC~&l=2023042816221657085C7C4708CF5194C4&mime_type=video_mp4&net=5&qs=13&rc=M281cDg6ZjtnZDMzNDQzM0BpM281cDg6ZjtnZDMzNDQzM0BhZWcxcjRvc3NgLS1kMS9zYSNhZWcxcjRvc3NgLS1kMS9zcw%3D%3D', '进击的巨人 02', '', 11, 2, '情感');
INSERT INTO `video_list` VALUES (41, 'https://img9.doubanio.com/view/photo/s_ratio_poster/public/p2605274206.webp', 'https://v3.douyinvod.com/61eae091157fe7fb5bbd0331f9dde3ce/644b8a21/video/tos/cn/tos-cn-v-0064/cbf0653f420549de8e9fadbe612c774c/?a=13&br=2386&bt=2386&btag=e00078030&cc=1f&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=4&filename=1.mp4&ft=iJtKqyGTZkx0PD133t9Xg9wd..nSvEeC~&l=2023042815315089C941E409CAE94CB2B0&mime_type=video_mp4&net=5&qs=13&rc=M2w4OWU6ZnhnZDMzNDQzM0BpM2w4OWU6ZnhnZDMzNDQzM0BtaTBfcjRvc3NgLS1kMTBzYSNtaTBfcjRvc3NgLS1kMTBzcw%3D%3D', '进击的巨人 03', '', 11, 3, '情感');
INSERT INTO `video_list` VALUES (42, 'https://img9.doubanio.com/view/photo/m/public/p2634594864.webp', '', '名侦探柯南', '名侦探柯南系列”第23部动画剧场版，票房和口碑也屡破纪录。作为平成年代最后一部柯南电影，首次将案件发生地设立在海外，基德时隔四年后再度回归，与柯南合体展开行动', 12, 0, '悬疑');
INSERT INTO `video_list` VALUES (43, 'https://img9.doubanio.com/view/photo/m/public/p2634594864.webp', 'https://p3-sign.douyinpic.com/obj/tos-cn-v-0000c2367/b2e47311c2044a1c886fb32195ba006f?filename=1.mp4&x-expires=1990969200&x-signature=d4OWYfvO%2FLC0Dpqc3g0Lh5P3kc8%3D', '名侦探柯南 万圣节的新娘', '', 12, 1, '悬疑');
INSERT INTO `video_list` VALUES (44, 'https://img9.doubanio.com/view/photo/m/public/p2634594864.webp', 'https://v3.douyinvod.com/72e9a56544de82d7f5420a8c5d5358c9/644baa9c/video/tos/cn/tos-cn-v-0064/26a1fd501bb94d8e8043bf22c003a6e1/?a=13&br=2064&bt=2064&btag=e00078030&cc=1f&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=4&filename=1.mp4&ft=iJtKqy7oZt10PD1Q.A9Xg9wYUmDGkEeC~&l=2023042816250924CEBF0FEC6CA14BC660&mime_type=video_mp4&net=5&qs=13&rc=M3ZqdjQ6Zm9wZTMzNDQzM0BpM3ZqdjQ6Zm9wZTMzNDQzM0BpX2tpcjQwcmZgLS1kMTBzYSNpX2tpcjQwcmZgLS1kMTBzcw%3D%3D', '名侦探柯南 绀青之拳', '', 12, 2, '悬疑');
INSERT INTO `video_list` VALUES (45, 'https://img9.doubanio.com/view/photo/m/public/p2634594864.webp', 'https://v3.douyinvod.com/cf37592164ef720b749edef5d5c4642c/644baaf0/video/tos/cn/tos-cn-v-0064/f1b467ed74044a79b3b279de17bbe557/?a=13&br=1914&bt=1914&btag=e00078030&cc=1f&cd=0%7C0%7C0%7C0&ch=0&cr=0&cs=0&dr=0&ds=4&filename=1.mp4&ft=XEGJ8q1hm7A0D12N5aiUG-UxedpoVVF_O5&l=202304281625456EC0ED9D8E4F464C9D17&mime_type=video_mp4&net=5&qs=13&rc=ampzNTY6Zjs3ZTMzNDQzM0BpampzNTY6Zjs3ZTMzNDQzM0BeMjBhcjRfMGZgLS1kMTBzYSNeMjBhcjRfMGZgLS1kMTBzcw%3D%3D', '名侦探柯南 零的执行人', '', 12, 3, '悬疑');
INSERT INTO `video_list` VALUES (46, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2675950683.webp', '', '斗破苍穹', '三年之约后，萧炎终于在迦南学院见到了薰儿，此后他广交挚友并成立磐门；为继续提升实力以三上云岚宗为父复仇，他以身犯险深入天焚炼气塔吞噬陨落心炎……', 13, 0, '情感');
INSERT INTO `video_list` VALUES (47, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2675950683.webp', 'https://gd-cowtransfer.static.cowtransfer.com/cowtransfer/cowtransfer/86121/78e37dfe48724d5ea7376132a60030f7.mp4?auth_key=1682676329-87ecc340acc24f90861fc4eced37dc81-0-9ce1f46ae32ec57285548ad13e124ba1', '斗破苍穹 01', '', 13, 1, '情感');
INSERT INTO `video_list` VALUES (48, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2675950683.webp', 'https://gd-cowtransfer.static.cowtransfer.com/cowtransfer/cowtransfer/86121/49d3996847754d50bd6095434c80a7a7.mp4?auth_key=1682679626-b7a48225fbd148d9947cc149395f0520-0-1be1e172d6e62b4305c4105a53a80263', '斗破苍穹 02', '', 13, 2, '情感');
INSERT INTO `video_list` VALUES (49, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2675950683.webp', 'https://gd-cowtransfer.static.cowtransfer.com/cowtransfer/cowtransfer/86121/42128947eb294a1f86fb8bb99a6fd116.mp4?auth_key=1682679640-60d7a4af6e0f45699db1afd8c7ed9205-0-edaedeceb72b96b420f356c463078d9d', '斗破苍穹 03', '', 13, 3, '情感');
/*日剧部分*/
INSERT INTO `video_list` VALUES (50, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890948667.webp', '', '我继承了牛郎俱乐部', '', 14, 0, '情感');
INSERT INTO `video_list` VALUES (51, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890948667.webp', 'https://3729664550.qnqcdn.net:22443/qn-WXizSRNSrIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/d7428cd0de5671edbfed6723a78f0102/48b5c56e0bcf4362aac391433bdd5bef-685047f24716ef02233f632ca445679f-hd.mp4?sign=9ea664aa075befa07c979869a4bad47a&t=644cc4ef&clientType=android_RRMJ', '我继承了牛郎俱乐部 01', '', 14, 1, '情感');
INSERT INTO `video_list` VALUES (52, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890948667.webp', 'https://1850853185.qnqcdn.net:22443/qn-mmQgW6OO6IiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/db8b1640e3d871eda9416732b78e0102/c8079ceafb604e73a92209d316d071cd-1ae1335167948af72f7a6c71017f85ee-hd.mp4?sign=807369a5e65bce0711ad4e531bf7440b&t=644cd5ce&clientType=android_RRMJ', '我继承了牛郎俱乐部 02', '', 14, 2, '情感');
INSERT INTO `video_list` VALUES (53, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890464929.webp', '', '我的媳夫', '', 15, 0, '情感');
INSERT INTO `video_list` VALUES (54, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890464929.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/762f6a99b63d485d926e3e39a2f9392b?filename=1.mp4', '我的媳夫 01', '', 15, 1, '情感');
INSERT INTO `video_list` VALUES (55, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890464929.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/0bfa4e3c8e22462d8ca9122699127911?filename=1.mp4', '我的媳夫 02', '', 15, 2, '情感');
INSERT INTO `video_list` VALUES (56, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890464929.webp', 'https://p1.bdxiguaimg.com/obj/tos-alisg-v-90231e-sg/78a1ba277e664e69a2604c773268e555?filename=1.mp4', '我的媳夫 03', '', 15, 3, '情感');
INSERT INTO `video_list` VALUES (57, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890532190.webp', '', '全裸饭', '讲述一个爱全裸吃饭的精英上班族因爱上了喜欢做饭的果蔬店老板，逐渐发现了自己真正追求的生活方式的故事，在金融厅工作的一条飒太(近藤颂利)表面上是无可厚非的高品格男子，而他消除压力的方法之一是晚上回到家里全裸吃饭', 16, 0, '情感');
INSERT INTO `video_list` VALUES (58, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890532190.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/ca936732f3104372b33bbf757287dd9e?filename=1.mp4', '全裸饭 01', '', 16, 1, '情感');
INSERT INTO `video_list` VALUES (59, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2890532190.webp', 'https://sf9-dycdn-tos.pstatp.com/obj/tos-cn-i-8gu37r9deh/ca936732f3104372b33bbf757287dd9e?filename=1.mp4', '全裸饭 02', '', 16, 2, '情感');
/*韩剧部分*/
INSERT INTO `video_list` VALUES (60, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2884876907.webp', '', '黑暗荣耀', '文同珢（宋慧乔 饰）出生在一个贫穷的家庭之中，高中时期，她不幸被班上由朴涎镇（林智妍 饰）和全宰寯（朴成焄 饰）等人组成的小团体选中，成为了他们霸凌的对象。朴涎镇对待文同珢的手段非常的残暴，用卷发棒将其烫得体无完肤。', 17, 0, '情感');
INSERT INTO `video_list` VALUES (61, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2884876907.webp', 'https://3079830717.qnqcdn.net:22443/qn-Sq3J0DZP7IiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/23801140882071edbfff0675b3ed0102/4b9292db8be8466d8b98be872f812654-7f1b1c66e08f6f019f3028fe446e1ae3-hd.mp4?sign=6a1c73e9b785c95686872f31c1397c89&t=644cd21a&clientType=android_RRMJ', '黑暗荣耀 01', '', 17, 1, '情感');
INSERT INTO `video_list` VALUES (62, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2884876907.webp', 'https://zj-cdn-movie.rr.tv/ccb14f80899871eda2eb0764a0ec0102/828c97bca947428fa3024c1aba1ebd2e-89258e1374ff5471716e69ea1f757d15-hd.mp4?auth_key=1682757023-d4f60e1131352686530c5d65809a57d7-0-26750a4ddb57777b85f85b2d46c5fdb5&clientType=android_RRMJ', '黑暗荣耀 02', '', 17, 2, '情感');
INSERT INTO `video_list` VALUES (63, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2677934359.webp', '', '鱿鱼游戏', '一群走投无路并急需金钱的人收到神秘邀请，邀请他们共同加入一场游戏。为了赢取 456 亿韩元的奖金，背景各异的 456 名参赛者被关在秘密场所进行游戏。', 18, 0, '情感');
INSERT INTO `video_list` VALUES (64, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2677934359.webp', 'https://quuu.cc/cache/45d552d18f602dee95c3323177621c09.m3u8', '鱿鱼游戏 01', '', 18, 1, '情感');
INSERT INTO `video_list` VALUES (65, 'https://img1.doubanio.com/view/photo/s_ratio_poster/public/p2677934359.webp', 'https://quuu.cc/cache/d8c3da7e6a39a0e79340336107518b25.m3u8', '鱿鱼游戏 02', '', 18, 2, '情感');
INSERT INTO `video_list` VALUES (66, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2882015921.webp', '', '财阀家的小儿子', '改编自同名人气网络小说，讲述管理财阀一家的秘书尹贤宇（宋仲基 饰），被冤枉涉嫌侵吞资金而被财阀家杀害。尹贤宇重生为财阀家的小儿子陈道俊，以新的身份一边成长一边复仇的故事。', 19, 0, '情感');
INSERT INTO `video_list` VALUES (67, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2882015921.webp', 'https://ks-cdn-movie.rr.tv/4a10f80ff80e4f78bb39e21202f0a907/bcb64d62d7624458b00cac63c83ffc62-50a12eda469f6533e8ef68f0a3525ef0-hd.mp4?auth_key=1682757799-2a59df294575f36c4da66e13ca3764a1-0-68861de5073572a88bb2be0b922eaa41&clientType=android_RRMJ', '财阀家的小儿子 01', '', 19, 1, '情感');
INSERT INTO `video_list` VALUES (68, 'https://img2.doubanio.com/view/photo/s_ratio_poster/public/p2882015921.webp', '', '财阀家的小儿子 02', 'https://1873420038.qnqcdn.net:22443/qn-2vYrO0YiNIiFEdxApHjpkI1wyFy4UeiQ3Rg.qn-302-cdn-local.rr.tv/248ca59026734e7785c3fd23388d7a20/08b955de7d6a48d1b774ade8703f76d4-4f3c1986f761b10fb61a8345b7c6e7f9-hd.mp4?sign=842746a194930d5c0028e38c37f10da1&t=644cd8b1&clientType=android_RRMJ', 19, 2, '情感');

SET FOREIGN_KEY_CHECKS = 1;
