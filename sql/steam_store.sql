/*
 Navicat Premium Data Transfer

 Source Server         : windows_mysql_80
 Source Server Type    : MySQL
 Source Server Version : 80200 (8.2.0)
 Source Host           : localhost:3306
 Source Schema         : steam_store

 Target Server Type    : MySQL
 Target Server Version : 80200 (8.2.0)
 File Encoding         : 65001

 Date: 28/12/2023 07:34:31
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for steam_cart
-- ----------------------------
DROP TABLE IF EXISTS `steam_cart`;
CREATE TABLE `steam_cart`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `game_id` int NULL DEFAULT NULL COMMENT '游戏ID',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steam_cart
-- ----------------------------
INSERT INTO `steam_cart` VALUES (8, 1, 6, '2023-12-28 07:13:53', NULL);
INSERT INTO `steam_cart` VALUES (9, 1, 8, '2023-12-28 07:19:09', NULL);

-- ----------------------------
-- Table structure for steam_comment
-- ----------------------------
DROP TABLE IF EXISTS `steam_comment`;
CREATE TABLE `steam_comment`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `game_id` int NULL DEFAULT NULL COMMENT '游戏ID',
  `content` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '评论内容',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '评论时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '修改时间',
  `user_id` int NULL DEFAULT NULL COMMENT '评论人',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steam_comment
-- ----------------------------

-- ----------------------------
-- Table structure for steam_game
-- ----------------------------
DROP TABLE IF EXISTS `steam_game`;
CREATE TABLE `steam_game`  (
  `id` int NOT NULL AUTO_INCREMENT COMMENT '主键',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏名',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime NULL DEFAULT NULL COMMENT '更新时间',
  `origin_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '原始价格',
  `final_price` decimal(10, 2) NULL DEFAULT NULL COMMENT '当前价格',
  `short_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '简短描述',
  `long_desc` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '长描述',
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT 'logo图片',
  `images` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL COMMENT '游戏图片地址',
  `poster` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '游戏海报',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 11 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steam_game
-- ----------------------------
INSERT INTO `steam_game` VALUES (3, 'Counter-Strike 2', '2023-12-28 05:53:46', NULL, 100.00, 1.00, '二十多年来，在全球数百万玩家的共同铸就下，Counter-Strike 提供了精湛绝伦的竞技体验。而如今，CS 传奇的下一章即将揭开序幕，那就是 Counter-Strike 2。', '二十多年来，在全球数百万玩家的共同铸就下，Counter-Strike 提供了精湛绝伦的竞技体验。而如今，CS 传奇的下一章即将揭开序幕，那就是 Counter-Strike 2。\n\nCounter-Strike 2 是 CS:GO 的免费升级版，展现了 Counter-Strike 历史上最大的技术飞跃。Counter-Strike 2 由 Source 2 引擎打造，具备基于物理的逼真渲染、最为先进的网络、经过升级的社区创意工坊工具，令人耳目一新。\n\nCounter Strike 系列于 1999 年开创了以完成目标为重的游戏玩法，而 Counter Strike 2 除了将这一经典元素保留，还会呈现以下特色：\n\n全新 CS 综合得分与经过更新的优先权模式\n全球及区域排行榜\n经过升级和大改的地图\n革命性的动态烟雾弹\n不受刷新频率阻碍的游戏体验\n全新设计的声画效果\nCS:GO 的所有物品均迁移至 CS2', 'https://cdn.akamai.steamstatic.com/steam/apps/730/capsule_sm_120_schinese.jpg?t=1698860631', 'https://cdn.akamai.steamstatic.com/steam/apps/730/ss_d830cfd0550fbb64d80e803e93c929c3abb02056.1920x1080.jpg?t=1698860631,https://cdn.akamai.steamstatic.com/steam/apps/730/ss_796601d9d67faf53486eeb26d0724347cea67ddc.1920x1080.jpg?t=1698860631,https://cdn.akamai.steamstatic.com/steam/apps/730/ss_13bb35638c0267759276f511ee97064773b37a51.1920x1080.jpg?t=1698860631', NULL);
INSERT INTO `steam_game` VALUES (4, 'Left 4 Dead 2', '2023-12-28 05:56:42', NULL, 42.00, 4.20, '让大家翘首以盼的的《求生之路 2》（L4D2）以僵尸大灾难为背景，是 2008 年最受欢迎且屡获殊荣的合作游戏《求生之路》的续集。这个第一人称射击恐怖合作动作游戏将带领玩家和好友穿过美国南部的城市、沼泽和墓地，从萨凡纳到新奥尔良，沿途经过五个漫长的战役。玩家将扮演四名新生还者中的一名，', '让大家翘首以盼的的《求生之路 2》（L4D2）以僵尸大灾难为背景，是 2008 年最受欢迎且屡获殊荣的合作游戏《求生之路》的续集。\n这个第一人称射击恐怖合作动作游戏将带领玩家和好友穿过美国南部的城市、沼泽和墓地，从萨凡纳到新奥尔良，沿途经过五个漫长的战役。\n玩家将扮演四名新生还者中的一名，装备有种类繁多、数量惊人的经典及先进武器。 除了枪支之外，玩家还有机会用各种可制造屠杀的近战武器在感染者上泄愤，例如电锯、斧头、甚至是致命的平底锅。\n玩家将在对抗三种恐怖无比、令人生畏的新特殊感染者（或者在对抗模式中扮演这些新的特殊感染者）时，考验这些武器的威力， 还会遭遇五种“不寻常”的普通感染者，包括可怕的泥人。\n正是 AI 总监 2.0 将《求生之路》那疯狂无比、动作场面连续不断的游戏玩法推上了新的高度。 优化后的总监系统能程序化地改变沿途天气和玩家行走的路径，还可以根据玩家的表现调整敌人的数量、效果和音效。 《求生之路 2》保证每次游戏都会带来令人满意、充满独特挑战的体验，符合玩家各自的游戏风格。\n来自《半衰期》、《传送门》、《军团要塞》和《反恐精英》制作者的下一代合作动作游戏。\n超过 20 种新武器和物品，超过 10 种近战武器——斧头、电锯、平底锅、棒球棍——让玩家和僵尸亲密接触。\n全新生还者。 全新故事。 全新对白。\n五个辽阔的战役，可以在合作、对抗和生还者模式中进行。\n全新多人游戏模式。\n“不寻常”的普通感染者。 五个新战役的每一个都至少有一种该战役专属的“不寻常”普通感染者。\nAI 总监 2.0：被称为“AI 总监”的先进技术，推进了《求生之路》独特的游戏玩法， 根据玩家的表现自定义敌人的数量、效果和音乐。 《求生之路 2》则以 AI 总监 2.0 为特点，扩展了总监系统的能力，可以自定义关卡布局、游戏世界内的物体、天气和照明来反映一天中的不同时间。\n统计、排名和奖励系统促使玩家们合作游戏。', 'https://cdn.akamai.steamstatic.com/steam/apps/550/capsule_sm_120.jpg?t=1675801903', 'https://cdn.akamai.steamstatic.com/steam/apps/550/ss_2eae29fbdfe8e5e8999b96d8bb28c5db70507968.600x338.jpg?t=1675801903,https://cdn.akamai.steamstatic.com/steam/apps/550/ss_29b3b4f2a3994c889f6fc12e0781d9d4726ef33f.600x338.jpg?t=1675801903,https://cdn.akamai.steamstatic.com/steam/apps/550/ss_9488e329bb42d792a059fb44cb7135d25b6262f5.600x338.jpg?t=1675801903,https://cdn.akamai.steamstatic.com/steam/apps/550/ss_6ec4ee04d4924b099e25ce79f3d6571c3b623b3b.600x338.jpg?t=1675801903', NULL);
INSERT INTO `steam_game` VALUES (5, 'Garry\'s Mod', '2023-12-28 05:58:31', NULL, 36.00, 18.00, 'Garry\'s Mod is a physics sandbox. There aren\'t any predefined aims or goals. We give you the tools and leave you to play.', 'Garry\'s Mod 是一个物理实验场。 与普通游戏不同，这款游戏并没有预定的目标或目的。 我们给您工具，您决定游戏内容。\n您可以调出各种对象互相组合，创造新的道具，不论汽车、火箭、投石车还是连名字都没有的机器，一切都由您决定。\n如果您对设计工程并不在行，也别担心！ 您还能把许多不同角色放在好笑的地方。', 'https://cdn.akamai.steamstatic.com/steam/apps/4000/capsule_sm_120.jpg?t=1698777053', 'https://cdn.akamai.steamstatic.com/steam/apps/4000/ss_ff27d52a103d1685e4981673c4f700b860cb23de.600x338.jpg?t=1698777053,https://cdn.akamai.steamstatic.com/steam/apps/4000/0000000826.600x338.jpg?t=1698777053,https://cdn.akamai.steamstatic.com/steam/apps/4000/ss_65ec9828538eac8db20efc8149990060911fefc4.600x338.jpg?t=1698777053,https://cdn.akamai.steamstatic.com/steam/apps/4000/ss_c13ffded1d71bedfa7ede94c11cbd21fbd21a32c.600x338.jpg?t=1698777053', NULL);
INSERT INTO `steam_game` VALUES (6, 'PAYDAY3 (收获日3)', '2023-12-28 07:06:45', NULL, 128.00, 96.00, '有史以来最受欢迎的合作射击游戏之一——备受瞩目的续作《PAYDAY 3》火爆归来！自本系列发布以来，PAYDAY玩家一直沉醉在精心计划然后执行劫案的快感中，这也让PAYDAY得以打造出无与伦比的高强度合作型FPS体验。', '有史以来最受欢迎的合作射击游戏之一——备受瞩目的续作《PAYDAY 3》火爆归来！自本系列发布以来，PAYDAY玩家一直沉醉在精心计划然后执行劫案的快感中，这也让PAYDAY得以打造出无与伦比的高强度合作型FPS体验。', 'https://cdn.akamai.steamstatic.com/steam/apps/1272080/capsule_231x87_alt_assets_3.jpg?t=1702547327', 'https://cdn.akamai.steamstatic.com/steam/apps/1272080/ss_c751853378d528dd15c075465d29c99acee5db4a.600x338.jpg?t=1702547327,https://cdn.akamai.steamstatic.com/steam/apps/1272080/ss_af05bb8f8199b48aea40a696031e959ba4842d84.600x338.jpg?t=1702547327,https://cdn.akamai.steamstatic.com/steam/apps/1272080/ss_feab168614803617da20ef134ff05b49692784ba.600x338.jpg?t=1702547327', 'https://cdn.akamai.steamstatic.com/steam/apps/1272080/hero_capsule.jpg?t=1702547327');
INSERT INTO `steam_game` VALUES (7, '沉没之地', '2023-12-28 07:17:17', NULL, 70.00, 56.00, '在被海水淹没的地球上求生。探索沉没的都市，搜集材料，模块化建造基地，制造道具和武器，和海盗争夺有限的陆地资源。单机或者和朋友一起在充满挑战的海洋末世生存下去！', '为何要采用抢先体验这种模式？\n“We want to engage with our community and get valuable feedback and ideas to fuel the future development of this game.”\n这款游戏的抢先体验状态大约持续多久？\n“We are aiming to bring it to completion in one year. But that time frame can vary based on the players\' feedback and possible modifications for improving the game.”\n计划中的完整版本和抢先体验版本到底有多少不同？\n“The full version will contain more locations to explore, new crafting items, buildings, ships and lore/storyline. And community generated ideas, contents in the game.”\n抢先体验版本的现状如何？\n“We have a playable survival game with base building, base defense, crafting, trading, combat, boat driving, underwater adventure and many unique locations to explore.”\n在抢先体验期间和结束之后，游戏价格会有所不同吗？\n“We do plan to gradually increase price as we ship more content.”\n在开发过程中，你们是如何计划让玩家社区参与进来的？\n“We will be active on the steam forum, our Discord server and other social media. We will also frequently publish devlogs on our website and Youtube channel.”', 'https://cdn.akamai.steamstatic.com/steam/apps/2080690/capsule_231x87.jpg?t=1703562037', 'https://cdn.akamai.steamstatic.com/steam/apps/2080690/ss_0d70acebd7b63e3ceb4cf94351b48e115284ac61.600x338.jpg?t=1703562037,https://cdn.akamai.steamstatic.com/steam/apps/2080690/ss_0d70acebd7b63e3ceb4cf94351b48e115284ac61.600x338.jpg?t=1703562037,https://cdn.akamai.steamstatic.com/steam/apps/2080690/ss_411aa5f5fd0a126dacbd17971ae5cca610042898.600x338.jpg?t=1703562037', 'https://cdn.akamai.steamstatic.com/steam/apps/2080690/hero_capsule.jpg?t=1703562037');
INSERT INTO `steam_game` VALUES (8, 'Sons Of The Forest', '2023-12-28 07:18:48', NULL, 108.00, 86.40, '你被派到了一座孤岛上，寻找一位失踪的亿万富翁，结果却发现自己深陷被食人生物占领的炼狱之地。你需要制作工具和武器、建造房屋，倾尽全力生存下去，无论独自一人还是与朋友一起——一切尽在这款新推出的开放世界恐怖生存模拟游戏中。', '你被派到了一座孤岛上，寻找一位失踪的亿万富翁，结果却发现自己深陷被食人生物占领的炼狱之地。你需要制作工具和武器、建造房屋，倾尽全力生存下去，无论独自一人还是与朋友一起——一切尽在这款新推出的开放世界恐怖生存模拟游戏中。', 'https://cdn.akamai.steamstatic.com/steam/apps/1326470/header.jpg?t=1697048131', 'https://cdn.akamai.steamstatic.com/steam/apps/1326470/ss_e6e3ab1badfb287a77fb6eef7b1589a35371496b.600x338.jpg?t=1697048131,https://cdn.akamai.steamstatic.com/steam/apps/1326470/ss_4fa5d260318f0aa37754b00c5dc10d1b7b9b9b1d.600x338.jpg?t=1697048131,https://cdn.akamai.steamstatic.com/steam/apps/1326470/ss_2b67491ca913adea6953429e1a567824aaa0ed54.600x338.jpg?t=1697048131', 'https://cdn.akamai.steamstatic.com/steam/apps/1326470/hero_capsule.jpg?t=1697048131');
INSERT INTO `steam_game` VALUES (9, 'Project Zomboid', '2023-12-28 07:21:39', NULL, 76.00, 50.92, 'Project Zomboid is the ultimate in zombie survival. Alone or in MP: you loot, build, craft, fight, farm and fish in a struggle to survive. A hardcore RPG skillset, a vast map, massively customisable sandbox and a cute tutorial raccoon await the unwary. So how will you die? All it takes is a bite..', 'Project Zomboid is an open-ended zombie-infested sandbox. It asks one simple question – how will you die? \n\nIn the towns of Muldraugh and West Point, survivors must loot houses, build defences and do their utmost to delay their inevitable death day by day. No help is coming – their continued survival relies on their own cunning, luck and ability to evade a relentless horde.\nCurrent Features\n\nHardcore Sandbox Zombie Survival Game with a focus on realistic survival.\nOnline multiplayer survival with persistent player run servers.\nLocal 4 player split-screen co-op\nHundreds of zombies with swarm mechanics and in-depth visual and hearing systems.\nFull line of sight system and real-time lighting, sound and visibility mechanics. Hide in the shadows, keep quiet and keep the lights off at night, or at least hang sheets over the windows.\nVast and growing map (loosely based on a real world location) for you to explore, loot and set up your fortress. Check out Blindcoder’s map project: https://map.projectzomboid.com/\nVehicles with full physics and deep and realistic gameplay mechanics.\nUse tools and items to craft weapons, barricade and cook. You can even build zombie proof forts by chopping trees, sawing wood and scavenging supplies.\nDeal with depression, boredom, hunger, thirst and illness while trying to survive.\nDay turns to night. The electricity falters. Hordes migrate. Winter draws in. Nature gradually starts to take over.\nFarming, fishing, carpentry, cooking, trapping, character customization, skills and perks that develop based on what you do in-game.\nProper zombies that don’t run. (Unless you tell them to in the sandbox menu).\nA ton of amazing atmospheric music tracks by the prodigy that is Zach Beever.\nImaginative Challenge scenarios and instant action ‘Last Stand’ mode, on top of regular Sandbox and Survival ', 'https://cdn.akamai.steamstatic.com/steam/apps/108600/header.jpg?t=1691508011', 'https://cdn.akamai.steamstatic.com/steam/apps/108600/ss_eca8be032b3f5508bf5bea74cfbc823a4df047ce.600x338.jpg?t=1691508011,https://cdn.akamai.steamstatic.com/steam/apps/108600/ss_7300ecc70342b6fcbdf39b6f9ff4c408066f8fc2.600x338.jpg?t=1691508011.https://cdn.akamai.steamstatic.com/steam/apps/108600/ss_eb1862af5109e4658e2538d897cbd16b87ad1818.600x338.jpg?t=1691508011', 'https://cdn.akamai.steamstatic.com/steam/apps/108600/hero_capsule.jpg?t=1691508011');
INSERT INTO `steam_game` VALUES (10, 'Red Dead Redemption 2', '2023-12-28 07:23:40', NULL, 279.00, 92.07, 'Red Dead Redemption 2 已荣获超过 175 项年度游戏奖项且获得超过 250 个满分评价，游戏中述说亚瑟·摩根和声名狼藉的范德林德帮派的传奇故事，体验在 19 世纪的最后岁月里横跨美国的亡命之旅。除此之外，还可免费享受 Red Dead 在线模式中与众多玩家共享的逼真世界。', '美国，1899 年。\n\n亚瑟·摩根和范德林德帮众是一群逃亡在外的亡命之徒。联邦侦探和全国顶尖的赏金猎人在他们的身后穷追不舍，亚瑟一行人必须在广袤蛮荒的美国腹地上四处劫掠、挣扎求生。而帮派内部的矛盾分化日渐加深，摆在亚瑟面前的将是他无法避免的抉择：究竟是选择自己的理想，还是选择效忠于抚养了自己的帮派。\n\n现已添加额外故事模式内容和功能齐全的照片模式。除此之外，Red Dead Redemption 2 玩家还可免费享受 Red Dead 在线模式中与众多玩家共享的逼真世界。此模式中，玩家可从事各种不同的职业，在边疆开拓属于自己的独特生涯。您可以成为追捕通缉犯的赏金猎人、经营自己生意的商贩、发掘珍奇宝藏的收藏家或运营地下酿酒厂的私酒贩等等。\n\nRed Dead Redemption 2 PC 版借助全新图形和技术改进以增强沉浸感，并充分利用了电脑强大的性能，使这个庞大、丰富而细致的世界的每个角落都栩栩如生。包括更广的渲染距离；为改良的昼夜照明而提供的更高质量的全局照明和环境光遮蔽；改良的反射和所有距离提供更深、更高分辨率的阴影；细分曲面处理树木纹理并改善草地和毛皮纹理，使所有植物和动物都更加逼真。\n\nRed Dead Redemption 2 PC 版还提供 HDR 支持，可在高端显示设置上以 4K 及更高分辨率运行、多显示器配置、宽屏配置、更快的帧速率及更多。', 'https://cdn.akamai.steamstatic.com/steam/apps/1174180/header.jpg?t=1695140956', 'https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_bac60bacbf5da8945103648c08d27d5e202444ca.600x338.jpg?t=1695140956,https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_668dafe477743f8b50b818d5bbfcec669e9ba93e.600x338.jpg?t=1695140956.https://cdn.akamai.steamstatic.com/steam/apps/1174180/ss_66b553f4c209476d3e4ce25fa4714002cc914c4f.600x338.jpg?t=1695140956', 'https://cdn.akamai.steamstatic.com/steam/apps/1174180/hero_capsule.jpg?t=1695140956');

-- ----------------------------
-- Table structure for steam_my_game
-- ----------------------------
DROP TABLE IF EXISTS `steam_my_game`;
CREATE TABLE `steam_my_game`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NULL DEFAULT NULL COMMENT '用户ID',
  `game_id` int NULL DEFAULT NULL COMMENT '游戏ID',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steam_my_game
-- ----------------------------
INSERT INTO `steam_my_game` VALUES (2, 1, 3, '2023-12-28 06:56:58', NULL);
INSERT INTO `steam_my_game` VALUES (4, 1, 4, '2023-12-28 06:58:41', NULL);
INSERT INTO `steam_my_game` VALUES (5, 1, 5, '2023-12-28 06:58:41', NULL);

-- ----------------------------
-- Table structure for steam_user
-- ----------------------------
DROP TABLE IF EXISTS `steam_user`;
CREATE TABLE `steam_user`  (
  `id` int UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键',
  `login_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录账号',
  `login_pwd` char(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL COMMENT '登录密码',
  `nickname` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `add_time` datetime NULL DEFAULT CURRENT_TIMESTAMP COMMENT '添加时间',
  `update_time` datetime NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP COMMENT '修改时间',
  `avatar` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像',
  `is_admin` tinyint(1) NOT NULL DEFAULT 0 COMMENT '是否为管理员',
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `idx_login_name`(`login_name` ASC) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 9 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of steam_user
-- ----------------------------
INSERT INTO `steam_user` VALUES (1, 'mao', '1cae28c7ef8757b79f1866b83480875f', 'hulue', '2023-12-24 14:51:30', '2023-12-28 01:46:12', NULL, 1);
INSERT INTO `steam_user` VALUES (4, 'mao1', '38aa677d9feb3c9386ec333aec839737', NULL, '2023-12-24 14:59:43', NULL, NULL, 0);
INSERT INTO `steam_user` VALUES (5, 'sdfsefsefse', 'b21a0a95e9ee76a195f460d258d0a8d9', NULL, '2023-12-24 15:02:51', NULL, NULL, 0);
INSERT INTO `steam_user` VALUES (6, 'hulue', 'f7d0ceab1a16713e107ff1c942f7d4ec', NULL, '2023-12-24 15:03:20', NULL, NULL, 0);
INSERT INTO `steam_user` VALUES (8, 'user1', '6b29253c405a8a6f0c221d0960dfaa8b', NULL, '2023-12-28 07:26:45', NULL, NULL, 0);

SET FOREIGN_KEY_CHECKS = 1;
