/*
 Navicat Premium Data Transfer

 Source Server         : My Conection
 Source Server Type    : MySQL
 Source Server Version : 100136
 Source Host           : localhost:3306
 Source Schema         : quiz_test

 Target Server Type    : MySQL
 Target Server Version : 100136
 File Encoding         : 65001

 Date: 18/03/2022 08:51:08
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for answers
-- ----------------------------
DROP TABLE IF EXISTS `answers`;
CREATE TABLE `answers`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `question_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `value` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `answers_question_id_foreign`(`question_id`) USING BTREE,
  CONSTRAINT `answers_question_id_foreign` FOREIGN KEY (`question_id`) REFERENCES `questions` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of answers
-- ----------------------------
INSERT INTO `answers` VALUES (1, 3, 'asdfadadsfadsf', 1, '2022-03-17 18:45:42', '2022-03-17 18:45:42');
INSERT INTO `answers` VALUES (2, 3, 'adsfa', 2, '2022-03-17 18:45:42', '2022-03-17 18:45:42');
INSERT INTO `answers` VALUES (3, 3, 'dfasdfasdfasdfa', 3, '2022-03-17 18:45:42', '2022-03-17 18:45:42');

-- ----------------------------
-- Table structure for failed_jobs
-- ----------------------------
DROP TABLE IF EXISTS `failed_jobs`;
CREATE TABLE `failed_jobs`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `uuid` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0),
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `failed_jobs_uuid_unique`(`uuid`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for migrations
-- ----------------------------
DROP TABLE IF EXISTS `migrations`;
CREATE TABLE `migrations`  (
  `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT,
  `migration` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 15 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of migrations
-- ----------------------------
INSERT INTO `migrations` VALUES (1, '2014_10_12_000000_create_users_table', 1);
INSERT INTO `migrations` VALUES (2, '2014_10_12_100000_create_password_resets_table', 1);
INSERT INTO `migrations` VALUES (3, '2019_05_03_000001_create_customer_columns', 1);
INSERT INTO `migrations` VALUES (4, '2019_05_03_000002_create_subscriptions_table', 1);
INSERT INTO `migrations` VALUES (5, '2019_05_03_000003_create_subscription_items_table', 1);
INSERT INTO `migrations` VALUES (6, '2019_08_19_000000_create_failed_jobs_table', 1);
INSERT INTO `migrations` VALUES (7, '2019_12_14_000001_create_personal_access_tokens_table', 1);
INSERT INTO `migrations` VALUES (8, '2022_03_16_202054_create_types_table', 1);
INSERT INTO `migrations` VALUES (9, '2022_03_16_202221_create_questions_table', 1);
INSERT INTO `migrations` VALUES (10, '2022_03_16_203726_create_answers_table', 1);
INSERT INTO `migrations` VALUES (11, '2022_03_16_204427_add_user_type_column_to_users_table', 1);
INSERT INTO `migrations` VALUES (12, '2022_03_17_160813_add_correct_answer_column_to_questions_table', 1);
INSERT INTO `migrations` VALUES (13, '2022_03_17_203654_create_quiz_table', 2);
INSERT INTO `migrations` VALUES (14, '2022_03_18_061312_create_results_table', 2);

-- ----------------------------
-- Table structure for password_resets
-- ----------------------------
DROP TABLE IF EXISTS `password_resets`;
CREATE TABLE `password_resets`  (
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  INDEX `password_resets_email_index`(`email`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for personal_access_tokens
-- ----------------------------
DROP TABLE IF EXISTS `personal_access_tokens`;
CREATE TABLE `personal_access_tokens`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `tokenable_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL,
  `last_used_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `personal_access_tokens_token_unique`(`token`) USING BTREE,
  INDEX `personal_access_tokens_tokenable_type_tokenable_id_index`(`tokenable_type`, `tokenable_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 134 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of personal_access_tokens
-- ----------------------------
INSERT INTO `personal_access_tokens` VALUES (1, 'App\\Models\\User', 1, 'tokens', '4e193364bb18ab673f5e03b628e37722622243f28a68a68c9ed6d144847d7508', '[\"*\"]', NULL, '2022-03-17 17:56:51', '2022-03-17 17:56:51');
INSERT INTO `personal_access_tokens` VALUES (2, 'App\\Models\\User', 1, 'tokens', '66f99637d18b014794d0e4b65cc6bccbf37fe9c9dc6937957cdb42d70cab6a5b', '[\"*\"]', NULL, '2022-03-17 18:09:43', '2022-03-17 18:09:43');
INSERT INTO `personal_access_tokens` VALUES (3, 'App\\Models\\User', 1, 'tokens', '3927bbf248497834fbb680600a140c1681c83f36cae7b8dd314e8313799fc11f', '[\"*\"]', NULL, '2022-03-17 18:10:50', '2022-03-17 18:10:50');
INSERT INTO `personal_access_tokens` VALUES (4, 'App\\Models\\User', 1, 'tokens', '50ee9fbaf6478b4ea0f6fac364d6d331a16ae176de6dcd1850d4fe47e82b3fd7', '[\"*\"]', NULL, '2022-03-17 18:11:02', '2022-03-17 18:11:02');
INSERT INTO `personal_access_tokens` VALUES (5, 'App\\Models\\User', 1, 'tokens', '6666bf63faac7706e57ee88e1eb48007511638db2b00963ca99d5eb1444ba68e', '[\"*\"]', NULL, '2022-03-17 18:16:11', '2022-03-17 18:16:11');
INSERT INTO `personal_access_tokens` VALUES (6, 'App\\Models\\User', 1, 'tokens', '6ece3f8991b9fe8e02060eb20ccb0f883300943003b901548a4c01e9c92aa9e4', '[\"*\"]', NULL, '2022-03-17 18:18:26', '2022-03-17 18:18:26');
INSERT INTO `personal_access_tokens` VALUES (7, 'App\\Models\\User', 1, 'tokens', 'b066ec65282d4802c0ec4d47a0c04611b807caa01d7b02c063ae83fb2fd9df83', '[\"*\"]', NULL, '2022-03-17 18:20:43', '2022-03-17 18:20:43');
INSERT INTO `personal_access_tokens` VALUES (8, 'App\\Models\\User', 1, 'tokens', '6150b40389285f5c87753182879ef272d4e3c0c22a541a8dbb4589c0fa71af48', '[\"*\"]', NULL, '2022-03-17 18:28:18', '2022-03-17 18:28:18');
INSERT INTO `personal_access_tokens` VALUES (9, 'App\\Models\\User', 1, 'tokens', '8eacdbc3885352d99ddae66a06184ed9726cd8a468e21ed075bd8f5014de315a', '[\"*\"]', NULL, '2022-03-17 18:28:58', '2022-03-17 18:28:58');
INSERT INTO `personal_access_tokens` VALUES (10, 'App\\Models\\User', 1, 'tokens', '0c9723436d48011443077c4d03dd849252c08b19dffd0e7050a7d20fe39789d9', '[\"*\"]', NULL, '2022-03-17 18:29:31', '2022-03-17 18:29:31');
INSERT INTO `personal_access_tokens` VALUES (11, 'App\\Models\\User', 1, 'tokens', '20acd5f1b4c37f73c284f432d0041cdb2bbe505d452f9b1df93339ae514cccda', '[\"*\"]', NULL, '2022-03-17 18:33:10', '2022-03-17 18:33:10');
INSERT INTO `personal_access_tokens` VALUES (12, 'App\\Models\\User', 1, 'tokens', 'f2b2a039d0c07732ab9d56adabcd8f1a2284748598af88b23612f4a355ac4674', '[\"*\"]', NULL, '2022-03-17 18:33:37', '2022-03-17 18:33:37');
INSERT INTO `personal_access_tokens` VALUES (13, 'App\\Models\\User', 1, 'tokens', '000ba107929f2eec5a1138565d0d9693eb6c896f28181dbc0dbb3cf93ac06e87', '[\"*\"]', NULL, '2022-03-17 18:34:59', '2022-03-17 18:34:59');
INSERT INTO `personal_access_tokens` VALUES (14, 'App\\Models\\User', 1, 'tokens', 'afe9bea8e48f83ec981d830baeeafde058e2470b630bb8ee19478fdef2a45557', '[\"*\"]', NULL, '2022-03-17 18:35:30', '2022-03-17 18:35:30');
INSERT INTO `personal_access_tokens` VALUES (15, 'App\\Models\\User', 1, 'tokens', 'b845c8f8492116132f1cf0933b2d9e0229cbb98090f6687c0a8e45456ad8da8b', '[\"*\"]', NULL, '2022-03-17 18:36:43', '2022-03-17 18:36:43');
INSERT INTO `personal_access_tokens` VALUES (16, 'App\\Models\\User', 1, 'tokens', '04b5e79ab3d44bfb3a54327d9fe41e24e729062e13bac4451d17d8528310cbfb', '[\"*\"]', NULL, '2022-03-17 18:36:56', '2022-03-17 18:36:56');
INSERT INTO `personal_access_tokens` VALUES (17, 'App\\Models\\User', 1, 'tokens', '0a8b6a747f8df789d511ec3c2d935328a63a4235c24454579bf9f1154f690fb1', '[\"*\"]', NULL, '2022-03-17 18:40:02', '2022-03-17 18:40:02');
INSERT INTO `personal_access_tokens` VALUES (18, 'App\\Models\\User', 1, 'tokens', '7eeb272fbf716a313bf419aad4936c344c19c9364bbf17dcf9fe09ab7f6c7df2', '[\"*\"]', NULL, '2022-03-17 18:45:19', '2022-03-17 18:45:19');
INSERT INTO `personal_access_tokens` VALUES (19, 'App\\Models\\User', 1, 'tokens', '5f4eba2188717fa701831ce1d2906e945c9188ce36139917e0a5a44c8b3e5f5f', '[\"*\"]', NULL, '2022-03-17 18:46:40', '2022-03-17 18:46:40');
INSERT INTO `personal_access_tokens` VALUES (20, 'App\\Models\\User', 1, 'tokens', '3c9298fb43240eabae3d8ea5160b29e5e6e16bfff5c187b98f17f14120ca57b4', '[\"*\"]', NULL, '2022-03-17 18:49:32', '2022-03-17 18:49:32');
INSERT INTO `personal_access_tokens` VALUES (21, 'App\\Models\\User', 1, 'tokens', '852103e2356b3b40aae9823291990567bd128cae40cf6483b1505b223202e4dc', '[\"*\"]', NULL, '2022-03-17 18:50:42', '2022-03-17 18:50:42');
INSERT INTO `personal_access_tokens` VALUES (22, 'App\\Models\\User', 1, 'tokens', '17b06b730545e255cec9db03ad9579ab22163a971452ed1713327a1c3091f702', '[\"*\"]', NULL, '2022-03-17 18:51:29', '2022-03-17 18:51:29');
INSERT INTO `personal_access_tokens` VALUES (23, 'App\\Models\\User', 1, 'tokens', '1a501ea841d29088aecbbc3b5b9a0a6d53ee0f751954135006809b338166d55a', '[\"*\"]', NULL, '2022-03-17 20:37:40', '2022-03-17 20:37:40');
INSERT INTO `personal_access_tokens` VALUES (24, 'App\\Models\\User', 1, 'tokens', 'a85eb60855c7472e24af7fc2fabb235762ce6bc84a76c23e7766257fd5d9cb88', '[\"*\"]', NULL, '2022-03-17 20:46:16', '2022-03-17 20:46:16');
INSERT INTO `personal_access_tokens` VALUES (25, 'App\\Models\\User', 1, 'tokens', '5f8a8229501a0e037b9db8518faf97e23150b1dbd963d6074d732e64a503add7', '[\"*\"]', NULL, '2022-03-17 20:49:42', '2022-03-17 20:49:42');
INSERT INTO `personal_access_tokens` VALUES (26, 'App\\Models\\User', 1, 'tokens', 'fd96ec020aadafd7df759891017eefe9233c102ff4e4606d875af734a95a29d1', '[\"*\"]', NULL, '2022-03-17 20:49:57', '2022-03-17 20:49:57');
INSERT INTO `personal_access_tokens` VALUES (27, 'App\\Models\\User', 1, 'tokens', '8934c06dc88b9891ef63ce66072a4eccadfd93846719bc7c14ed0ef299b7ee06', '[\"*\"]', NULL, '2022-03-17 20:51:19', '2022-03-17 20:51:19');
INSERT INTO `personal_access_tokens` VALUES (28, 'App\\Models\\User', 1, 'tokens', '2f0c13d91a7f6d940da6db800d687e9d7e9537917ae6a29b5403eda46725ea30', '[\"*\"]', NULL, '2022-03-17 20:51:46', '2022-03-17 20:51:46');
INSERT INTO `personal_access_tokens` VALUES (29, 'App\\Models\\User', 1, 'tokens', '10d3316061c1775dfe96e86646063772eb560119c3ae6d01d107ca70bfae7dc2', '[\"*\"]', NULL, '2022-03-17 20:52:33', '2022-03-17 20:52:33');
INSERT INTO `personal_access_tokens` VALUES (30, 'App\\Models\\User', 1, 'tokens', '2e12b7789d376b580fd33b3b7c4769643d630f59dbe5af3323d4f71db8d2c67a', '[\"*\"]', NULL, '2022-03-17 20:52:51', '2022-03-17 20:52:51');
INSERT INTO `personal_access_tokens` VALUES (31, 'App\\Models\\User', 1, 'tokens', 'd5c9cb6389377a36a4ed0e78301f5428d556ada32c014e135d88b1ccb2556e64', '[\"*\"]', NULL, '2022-03-17 20:57:45', '2022-03-17 20:57:45');
INSERT INTO `personal_access_tokens` VALUES (32, 'App\\Models\\User', 1, 'tokens', 'adb529929cf7b933bcb0d90b32a32aeaba2b422f7b83556a3838df4bae4a0589', '[\"*\"]', NULL, '2022-03-17 20:57:50', '2022-03-17 20:57:50');
INSERT INTO `personal_access_tokens` VALUES (33, 'App\\Models\\User', 1, 'tokens', '91feb2ad2f873745c0e3ae29f3dbf608239bcbfad62901cca32515f9c346fcdd', '[\"*\"]', NULL, '2022-03-17 20:57:54', '2022-03-17 20:57:54');
INSERT INTO `personal_access_tokens` VALUES (34, 'App\\Models\\User', 1, 'tokens', '663a8a9985a1052544ced51df2c4b9afffa62d159df6290351f95b61676421aa', '[\"*\"]', NULL, '2022-03-17 21:05:45', '2022-03-17 21:05:45');
INSERT INTO `personal_access_tokens` VALUES (35, 'App\\Models\\User', 1, 'tokens', '952142133d5496fbd8fee88334a49230c2d3bb72caab064b64b5b30fc694afe8', '[\"*\"]', NULL, '2022-03-17 21:07:25', '2022-03-17 21:07:25');
INSERT INTO `personal_access_tokens` VALUES (36, 'App\\Models\\User', 1, 'tokens', 'd8f38edb856c3c423370af2f95d4e9c6e0d44fe4ee316c8fb13fb3d6d361d6c6', '[\"*\"]', NULL, '2022-03-17 21:07:33', '2022-03-17 21:07:33');
INSERT INTO `personal_access_tokens` VALUES (37, 'App\\Models\\User', 1, 'tokens', '051b88d461d0d8a90f5a8a11293036c13325291ba0e18c12217312c7459e9ad5', '[\"*\"]', NULL, '2022-03-17 23:17:21', '2022-03-17 23:17:21');
INSERT INTO `personal_access_tokens` VALUES (38, 'App\\Models\\User', 1, 'tokens', '2d19c597310113bd2cce85f1026610e79812573aa64f6fb517d3aa0639725cb9', '[\"*\"]', NULL, '2022-03-17 23:17:27', '2022-03-17 23:17:27');
INSERT INTO `personal_access_tokens` VALUES (39, 'App\\Models\\User', 1, 'tokens', 'f5eca68580cab20dda3f0efc83f32404359f9f6f5115bc968df10912d910255c', '[\"*\"]', NULL, '2022-03-17 23:19:39', '2022-03-17 23:19:39');
INSERT INTO `personal_access_tokens` VALUES (40, 'App\\Models\\User', 1, 'tokens', '07fa4830446695b1887a6a0f10b4066344f395eb195cf6a34a1c05c383cf99d5', '[\"*\"]', NULL, '2022-03-17 23:19:43', '2022-03-17 23:19:43');
INSERT INTO `personal_access_tokens` VALUES (41, 'App\\Models\\User', 1, 'tokens', '3f6b0ac438edff5d7a9d8e0bda85370ce5fb361e230c13c9d453a00613a8079a', '[\"*\"]', NULL, '2022-03-17 23:20:20', '2022-03-17 23:20:20');
INSERT INTO `personal_access_tokens` VALUES (42, 'App\\Models\\User', 1, 'tokens', '3e5443e864c4b0df1ef0b41a6e19b4095dd81abf8e87642aa944540a5bdd8c25', '[\"*\"]', NULL, '2022-03-17 23:20:42', '2022-03-17 23:20:42');
INSERT INTO `personal_access_tokens` VALUES (43, 'App\\Models\\User', 1, 'tokens', 'e490cf38b3a0ecfaf11a3b5e5ee8a6aecce432f0c0256046506db34a6ca14530', '[\"*\"]', NULL, '2022-03-17 23:21:30', '2022-03-17 23:21:30');
INSERT INTO `personal_access_tokens` VALUES (44, 'App\\Models\\User', 1, 'tokens', '5c490dd9d4f31c4e9bc2516b708b73d841b6ba0a0e46fbbb09381322567c9629', '[\"*\"]', NULL, '2022-03-17 23:21:54', '2022-03-17 23:21:54');
INSERT INTO `personal_access_tokens` VALUES (45, 'App\\Models\\User', 1, 'tokens', 'f57a7a57f5ee48780e368d7d350b18883a190294d8ca4eaed956ad54bbf75a04', '[\"*\"]', NULL, '2022-03-17 23:22:30', '2022-03-17 23:22:30');
INSERT INTO `personal_access_tokens` VALUES (46, 'App\\Models\\User', 1, 'tokens', '77e01b4fc28383d40ca249c3462d74db07483396f8be8653589fcefc6a5e4611', '[\"*\"]', NULL, '2022-03-17 23:23:18', '2022-03-17 23:23:18');
INSERT INTO `personal_access_tokens` VALUES (47, 'App\\Models\\User', 1, 'tokens', '1b3b5372f0edd4cd12ed9aed628427526172617b908d46273b222101aa902a25', '[\"*\"]', NULL, '2022-03-17 23:24:09', '2022-03-17 23:24:09');
INSERT INTO `personal_access_tokens` VALUES (48, 'App\\Models\\User', 1, 'tokens', 'ece0fee234690eb2c48a2249e04b4384ad68db142ae8d5c98ae99449f33c222f', '[\"*\"]', NULL, '2022-03-17 23:25:02', '2022-03-17 23:25:02');
INSERT INTO `personal_access_tokens` VALUES (49, 'App\\Models\\User', 1, 'tokens', '4629bea545fd2e04af7768f741f37f20cdc0dde9f61b8391282a572006b7caf6', '[\"*\"]', NULL, '2022-03-17 23:25:18', '2022-03-17 23:25:18');
INSERT INTO `personal_access_tokens` VALUES (50, 'App\\Models\\User', 1, 'tokens', 'b01571cb0cd7c7a74c76a31ce6a02b9b9f1c26ca669156b9160498753c3ffffe', '[\"*\"]', NULL, '2022-03-17 23:31:24', '2022-03-17 23:31:24');
INSERT INTO `personal_access_tokens` VALUES (51, 'App\\Models\\User', 1, 'tokens', '8436ec34a6617d0779313709f1d49ae4b7b0fc2d7a0139b2391469b564835048', '[\"*\"]', NULL, '2022-03-17 23:41:15', '2022-03-17 23:41:15');
INSERT INTO `personal_access_tokens` VALUES (52, 'App\\Models\\User', 1, 'tokens', '406fcaf642af7c9883787703dcd9f29983bbf75d58443f9fd43b95893e047b76', '[\"*\"]', NULL, '2022-03-17 23:41:36', '2022-03-17 23:41:36');
INSERT INTO `personal_access_tokens` VALUES (53, 'App\\Models\\User', 1, 'tokens', '25d2bb31b0c55fbec000b3d032c32830005b4dbaedeb64185bc136746a8e1d5f', '[\"*\"]', NULL, '2022-03-17 23:41:37', '2022-03-17 23:41:37');
INSERT INTO `personal_access_tokens` VALUES (54, 'App\\Models\\User', 1, 'tokens', '020806d08da0fd4fa3451f9f580c687583e810f753960d39083300bca4d64fcd', '[\"*\"]', NULL, '2022-03-17 23:41:44', '2022-03-17 23:41:44');
INSERT INTO `personal_access_tokens` VALUES (55, 'App\\Models\\User', 1, 'tokens', '00d634c8a36433cd5737106702a040d6cd7b7d6267238f49619bb27631bbf1d8', '[\"*\"]', NULL, '2022-03-17 23:47:17', '2022-03-17 23:47:17');
INSERT INTO `personal_access_tokens` VALUES (56, 'App\\Models\\User', 1, 'tokens', 'e4b7bffd54229bf233cee6b01dc29ce213d00f626de4c81f9794ff96c1a08712', '[\"*\"]', NULL, '2022-03-17 23:49:15', '2022-03-17 23:49:15');
INSERT INTO `personal_access_tokens` VALUES (57, 'App\\Models\\User', 1, 'tokens', 'e711a7e58d1528f02736e4edf77dd364c39da4f5eb99685c2e45f29e5694e348', '[\"*\"]', NULL, '2022-03-17 23:50:04', '2022-03-17 23:50:04');
INSERT INTO `personal_access_tokens` VALUES (58, 'App\\Models\\User', 1, 'tokens', 'ff5420d19327b5962d73d5b77a273afb0d55d6ec0347cbb29c29b6ec403ca5a3', '[\"*\"]', NULL, '2022-03-17 23:50:18', '2022-03-17 23:50:18');
INSERT INTO `personal_access_tokens` VALUES (59, 'App\\Models\\User', 1, 'tokens', '91ff1533d301fa13e084e236acec53e882119fca11b7c5179fd4254077388fce', '[\"*\"]', NULL, '2022-03-17 23:53:30', '2022-03-17 23:53:30');
INSERT INTO `personal_access_tokens` VALUES (60, 'App\\Models\\User', 1, 'tokens', 'c0683b444717da3249ba7f390d080326e6a52a3f9ae330161b28c328656d5365', '[\"*\"]', NULL, '2022-03-17 23:54:27', '2022-03-17 23:54:27');
INSERT INTO `personal_access_tokens` VALUES (61, 'App\\Models\\User', 1, 'tokens', '20254e1e11c926357e8fcf217d261856c5a33c7096fb44ed19ab0d9f6b28619a', '[\"*\"]', NULL, '2022-03-17 23:55:56', '2022-03-17 23:55:56');
INSERT INTO `personal_access_tokens` VALUES (62, 'App\\Models\\User', 1, 'tokens', 'db5693de0a4cacfc0dc7820e514bbfaeb7fa0a9e7a440668f6e6b5ae64f157f6', '[\"*\"]', NULL, '2022-03-17 23:58:54', '2022-03-17 23:58:54');
INSERT INTO `personal_access_tokens` VALUES (63, 'App\\Models\\User', 1, 'tokens', 'd840e8705a2d5cf6863ac0082d76107cd09869c07f0e7d59997c320b6cc2d46b', '[\"*\"]', NULL, '2022-03-17 23:59:36', '2022-03-17 23:59:36');
INSERT INTO `personal_access_tokens` VALUES (64, 'App\\Models\\User', 1, 'tokens', 'f5f57cb2e1c9429a7cabb9ad8bd09a886245298186b90be6a97ddfccaf6bf88a', '[\"*\"]', NULL, '2022-03-18 00:00:10', '2022-03-18 00:00:10');
INSERT INTO `personal_access_tokens` VALUES (65, 'App\\Models\\User', 1, 'tokens', '730959f5d6721f82486578783a6373f5a6f5df52feb5d84e775c349cd15a32cd', '[\"*\"]', NULL, '2022-03-18 00:02:44', '2022-03-18 00:02:44');
INSERT INTO `personal_access_tokens` VALUES (66, 'App\\Models\\User', 1, 'tokens', 'ef4ebe6c8b43fe48c4629fa3ae75a02f0eb5cb637774bf57dcbb29fb19609b7c', '[\"*\"]', NULL, '2022-03-18 00:03:04', '2022-03-18 00:03:04');
INSERT INTO `personal_access_tokens` VALUES (67, 'App\\Models\\User', 1, 'tokens', '5f7a1fffbc7a8fcd0d963fdc4511711e5ea5661eeecf3ed7e946d6e58448200f', '[\"*\"]', NULL, '2022-03-18 04:17:28', '2022-03-18 04:17:28');
INSERT INTO `personal_access_tokens` VALUES (68, 'App\\Models\\User', 1, 'tokens', '82a2b1ff7d515f95f3a0fc7460d1125cf70c99f54b3bd9eda50ac99a180b33c6', '[\"*\"]', NULL, '2022-03-18 04:17:28', '2022-03-18 04:17:28');
INSERT INTO `personal_access_tokens` VALUES (69, 'App\\Models\\User', 1, 'tokens', '71061f3628348894bd78bdbad1d96c9c3824a01632e04f957af73fc00a89e5a9', '[\"*\"]', NULL, '2022-03-18 04:17:59', '2022-03-18 04:17:59');
INSERT INTO `personal_access_tokens` VALUES (70, 'App\\Models\\User', 1, 'tokens', '1ffbb483fb311852aa1e3a41cd9aa10118eef1a2f17384b23bf78868b96c7f5d', '[\"*\"]', NULL, '2022-03-18 04:18:06', '2022-03-18 04:18:06');
INSERT INTO `personal_access_tokens` VALUES (71, 'App\\Models\\User', 1, 'tokens', '578ffca68c0ae505cc916de56052eefb4a5671c0d320ff46a01336363bcd7a16', '[\"*\"]', NULL, '2022-03-18 04:18:20', '2022-03-18 04:18:20');
INSERT INTO `personal_access_tokens` VALUES (72, 'App\\Models\\User', 1, 'tokens', 'aa3173651fc7e8132821664f8334543af844c512f6d3706305462a53052f9a9f', '[\"*\"]', NULL, '2022-03-18 04:19:24', '2022-03-18 04:19:24');
INSERT INTO `personal_access_tokens` VALUES (73, 'App\\Models\\User', 1, 'tokens', '3924fbeb31c97eac19419a99da7d54daa5ab961ea2e2f29a9533774b825edde7', '[\"*\"]', NULL, '2022-03-18 04:20:18', '2022-03-18 04:20:18');
INSERT INTO `personal_access_tokens` VALUES (74, 'App\\Models\\User', 1, 'tokens', '1d8943ef4bc1395f8545af7d8189db90ad66380cd011172543b74613df25c4a1', '[\"*\"]', NULL, '2022-03-18 04:20:29', '2022-03-18 04:20:29');
INSERT INTO `personal_access_tokens` VALUES (75, 'App\\Models\\User', 1, 'tokens', '16187f83b9cc9445a79bf3372f7a695316540f37aa2c47a298a4cc91f3486faa', '[\"*\"]', NULL, '2022-03-18 04:24:12', '2022-03-18 04:24:12');
INSERT INTO `personal_access_tokens` VALUES (76, 'App\\Models\\User', 1, 'tokens', 'b2301866dd40990c0d276bb3c928fdc6aaa482700c352a8c78d4464f51a9c4c1', '[\"*\"]', NULL, '2022-03-18 04:34:10', '2022-03-18 04:34:10');
INSERT INTO `personal_access_tokens` VALUES (77, 'App\\Models\\User', 1, 'tokens', '743c946dba616ae4e0c1ef165042de78aee8528588c61e151b5829881a756cdd', '[\"*\"]', NULL, '2022-03-18 04:34:12', '2022-03-18 04:34:12');
INSERT INTO `personal_access_tokens` VALUES (78, 'App\\Models\\User', 1, 'tokens', 'd38e1e56041b7ab0a9d415d2e252d13e59edc834d26f775bede1863f7dfadb75', '[\"*\"]', NULL, '2022-03-18 04:34:27', '2022-03-18 04:34:27');
INSERT INTO `personal_access_tokens` VALUES (79, 'App\\Models\\User', 1, 'tokens', '4b823d8752b20105df3125cef871e157acd3f6ac0d3ac4b2d91b67373534dfae', '[\"*\"]', NULL, '2022-03-18 04:34:29', '2022-03-18 04:34:29');
INSERT INTO `personal_access_tokens` VALUES (80, 'App\\Models\\User', 2, 'tokens', 'abe9f2ba442ccf9097c490c4deb7823f1ba18098977bbf2cc31d01a674d35215', '[\"*\"]', NULL, '2022-03-18 04:37:48', '2022-03-18 04:37:48');
INSERT INTO `personal_access_tokens` VALUES (81, 'App\\Models\\User', 1, 'tokens', '0279d514312900eb3860edb1140273a119cdb4d786e2d639bd1d35cabea7e801', '[\"*\"]', NULL, '2022-03-18 04:38:45', '2022-03-18 04:38:45');
INSERT INTO `personal_access_tokens` VALUES (82, 'App\\Models\\User', 2, 'tokens', '3fef3a0ba2a93d78a5a1a03e47f8593daf1fb17f0889305750d2e81f7010e1c3', '[\"*\"]', NULL, '2022-03-18 04:39:01', '2022-03-18 04:39:01');
INSERT INTO `personal_access_tokens` VALUES (83, 'App\\Models\\User', 2, 'tokens', '6d17499d9a8eb28972a12d6472adc11893951eb23de2d523aead8d148ea159d9', '[\"*\"]', NULL, '2022-03-18 04:39:18', '2022-03-18 04:39:18');
INSERT INTO `personal_access_tokens` VALUES (84, 'App\\Models\\User', 2, 'tokens', '80569ba1d2a76fef28a756614109de692abf5d93bbe0e5652956bb3aa3937351', '[\"*\"]', NULL, '2022-03-18 04:39:24', '2022-03-18 04:39:24');
INSERT INTO `personal_access_tokens` VALUES (85, 'App\\Models\\User', 2, 'tokens', 'bb78522589244999f34643877ce90c0d463b23b8cd22279c2500199170e89ab0', '[\"*\"]', NULL, '2022-03-18 04:50:41', '2022-03-18 04:50:41');
INSERT INTO `personal_access_tokens` VALUES (86, 'App\\Models\\User', 2, 'tokens', '0343895f419188a64268b0e3236271c6d60594c4e16ac064ed867f8d7a482774', '[\"*\"]', NULL, '2022-03-18 04:51:16', '2022-03-18 04:51:16');
INSERT INTO `personal_access_tokens` VALUES (87, 'App\\Models\\User', 2, 'tokens', '899cf4e7b8999e7ba7f6e6f1de2adc913569b4e03953dc1f625bb7d3756fa53c', '[\"*\"]', NULL, '2022-03-18 04:51:20', '2022-03-18 04:51:20');
INSERT INTO `personal_access_tokens` VALUES (88, 'App\\Models\\User', 2, 'tokens', '81a0fdf9917aebd2cbb445e5380a5c57a649154a471e0bccfdc50d5b4a5a8714', '[\"*\"]', NULL, '2022-03-18 04:51:27', '2022-03-18 04:51:27');
INSERT INTO `personal_access_tokens` VALUES (89, 'App\\Models\\User', 2, 'tokens', '16465c02e1e33ea11b4e9f43b0a573e53e0a9716d7b1bd50c7a12674ceefd941', '[\"*\"]', NULL, '2022-03-18 04:51:51', '2022-03-18 04:51:51');
INSERT INTO `personal_access_tokens` VALUES (90, 'App\\Models\\User', 1, 'tokens', '9ec11ed2c58ac558c37910f840d2538bfa4c9400ed3ba3b609c35f6b21401f78', '[\"*\"]', NULL, '2022-03-18 04:55:21', '2022-03-18 04:55:21');
INSERT INTO `personal_access_tokens` VALUES (91, 'App\\Models\\User', 2, 'tokens', '6b92995a3655e3188b3b4908d536f4d1f5ffa74248c9ff8b26be2a0dce074c03', '[\"*\"]', NULL, '2022-03-18 04:55:30', '2022-03-18 04:55:30');
INSERT INTO `personal_access_tokens` VALUES (92, 'App\\Models\\User', 2, 'tokens', 'cc48b6db352be9e4eca33beaa43c1c6583d040b5649b774465821d8a7bf0dd17', '[\"*\"]', NULL, '2022-03-18 04:56:38', '2022-03-18 04:56:38');
INSERT INTO `personal_access_tokens` VALUES (93, 'App\\Models\\User', 2, 'tokens', '71a2726edfdab3e25f9b6258b10a44101848de269318e7795f0e75c929e73012', '[\"*\"]', NULL, '2022-03-18 04:57:39', '2022-03-18 04:57:39');
INSERT INTO `personal_access_tokens` VALUES (94, 'App\\Models\\User', 2, 'tokens', '1ab04f661878f95005d64efd6f6cfeea1bbe1c0900cec26fd1be4feceedb8374', '[\"*\"]', NULL, '2022-03-18 04:58:29', '2022-03-18 04:58:29');
INSERT INTO `personal_access_tokens` VALUES (95, 'App\\Models\\User', 2, 'tokens', '7c6d03cdebf6e2b069504d08249e5f292a354080105415276f3480963e2c1c26', '[\"*\"]', NULL, '2022-03-18 04:59:14', '2022-03-18 04:59:14');
INSERT INTO `personal_access_tokens` VALUES (96, 'App\\Models\\User', 2, 'tokens', '94026f19657466965fb6ac8a8c82a9dc451f23ba3068efd84fee98236ccdb410', '[\"*\"]', NULL, '2022-03-18 05:08:25', '2022-03-18 05:08:25');
INSERT INTO `personal_access_tokens` VALUES (97, 'App\\Models\\User', 2, 'tokens', '6bfb36a5ada7cafc2fa4b72e6be5bfe51cb4dc95e27605c332d9cc27d433f4f6', '[\"*\"]', NULL, '2022-03-18 05:09:18', '2022-03-18 05:09:18');
INSERT INTO `personal_access_tokens` VALUES (98, 'App\\Models\\User', 2, 'tokens', '9980a3815a0b43d4996cefab393722ac92e02159d10b9e8cc377ed9a468de271', '[\"*\"]', NULL, '2022-03-18 05:10:01', '2022-03-18 05:10:01');
INSERT INTO `personal_access_tokens` VALUES (99, 'App\\Models\\User', 2, 'tokens', '15b7f8c3cce25c332eb4f877a5fb688ffca3eebf83db1f31b1fe1483c5da09bc', '[\"*\"]', NULL, '2022-03-18 05:10:56', '2022-03-18 05:10:56');
INSERT INTO `personal_access_tokens` VALUES (100, 'App\\Models\\User', 2, 'tokens', '89da6722e67c96a00ae0357a884f8f4d64b7591264120b158594c459b6d7d946', '[\"*\"]', NULL, '2022-03-18 05:11:10', '2022-03-18 05:11:10');
INSERT INTO `personal_access_tokens` VALUES (101, 'App\\Models\\User', 2, 'tokens', '25e0ea6128dc34278c87a34ae26a24e7b555a71b8280751932c856fd9996f412', '[\"*\"]', NULL, '2022-03-18 05:13:33', '2022-03-18 05:13:33');
INSERT INTO `personal_access_tokens` VALUES (102, 'App\\Models\\User', 2, 'tokens', 'c96596af9402acc1d7e6fc49501b9bf6733426f72f7b9d006984b522e0790e64', '[\"*\"]', NULL, '2022-03-18 05:14:47', '2022-03-18 05:14:47');
INSERT INTO `personal_access_tokens` VALUES (103, 'App\\Models\\User', 2, 'tokens', '05cb26ca631f9b5ccccbd819b97983c86aa4139cbaf991368baff2b64924f391', '[\"*\"]', NULL, '2022-03-18 05:35:19', '2022-03-18 05:35:19');
INSERT INTO `personal_access_tokens` VALUES (104, 'App\\Models\\User', 2, 'tokens', 'ba691c7637ce1c60e7ff69a1ed633a67d6f8d25fb0fcb92f23a71931ba87ab10', '[\"*\"]', NULL, '2022-03-18 05:35:55', '2022-03-18 05:35:55');
INSERT INTO `personal_access_tokens` VALUES (105, 'App\\Models\\User', 2, 'tokens', 'ed1b1434519402bc72b372a4d2e2957d9051cceee81ba6006a732be4d3dccb6b', '[\"*\"]', NULL, '2022-03-18 05:36:30', '2022-03-18 05:36:30');
INSERT INTO `personal_access_tokens` VALUES (106, 'App\\Models\\User', 2, 'tokens', 'c47b610863b354dbaf2f58b8a70271c80f9ae1e08c996be5cea76d66bbb6a564', '[\"*\"]', NULL, '2022-03-18 05:37:27', '2022-03-18 05:37:27');
INSERT INTO `personal_access_tokens` VALUES (107, 'App\\Models\\User', 2, 'tokens', '84c77c36f8be1d33e981ed8b8d42e4639d2affaf2038af1c7413f903b8cdfd59', '[\"*\"]', NULL, '2022-03-18 05:44:33', '2022-03-18 05:44:33');
INSERT INTO `personal_access_tokens` VALUES (108, 'App\\Models\\User', 2, 'tokens', '5c897536ee3c9c0dcca3fa8db9c6e3522eb6fe6754268c0a0b78aed6197dd291', '[\"*\"]', NULL, '2022-03-18 05:46:37', '2022-03-18 05:46:37');
INSERT INTO `personal_access_tokens` VALUES (109, 'App\\Models\\User', 2, 'tokens', '9b6ac4bb25fb3bc9afe3e27466c2269f450fafbc42013d0dc023cef1ed1bbeaf', '[\"*\"]', NULL, '2022-03-18 05:48:08', '2022-03-18 05:48:08');
INSERT INTO `personal_access_tokens` VALUES (110, 'App\\Models\\User', 2, 'tokens', 'c16d7c25baaf3a56a4699acbb5d907f9c35a82c226f37c12e0ba295e329a6ade', '[\"*\"]', NULL, '2022-03-18 05:49:49', '2022-03-18 05:49:49');
INSERT INTO `personal_access_tokens` VALUES (111, 'App\\Models\\User', 2, 'tokens', '5e34b626f587b7ad24e50dd83b8512e3285c20c1a1cafb9af8a3d8862b043a71', '[\"*\"]', NULL, '2022-03-18 05:55:01', '2022-03-18 05:55:01');
INSERT INTO `personal_access_tokens` VALUES (112, 'App\\Models\\User', 2, 'tokens', '9bcd043377bfdd2da85ccf959c2517050b359986bc2bba97619c31e24f40d4d0', '[\"*\"]', NULL, '2022-03-18 05:55:19', '2022-03-18 05:55:19');
INSERT INTO `personal_access_tokens` VALUES (113, 'App\\Models\\User', 2, 'tokens', 'c7ddd0a65b4195f43b2c839de87e178470eb2d3e74dc18fe22fa1cde53fad8b6', '[\"*\"]', NULL, '2022-03-18 05:57:59', '2022-03-18 05:57:59');
INSERT INTO `personal_access_tokens` VALUES (114, 'App\\Models\\User', 2, 'tokens', 'a8b6b0b0de20718edc8b840e9ee77f1815822dfb9734b7243d644da0f2047c3d', '[\"*\"]', NULL, '2022-03-18 05:58:18', '2022-03-18 05:58:18');
INSERT INTO `personal_access_tokens` VALUES (115, 'App\\Models\\User', 2, 'tokens', '7ab913d74069a24b91b7d82273e2e20f85e2e08f19b1dd1d001243cf749dfe76', '[\"*\"]', NULL, '2022-03-18 05:58:42', '2022-03-18 05:58:42');
INSERT INTO `personal_access_tokens` VALUES (116, 'App\\Models\\User', 2, 'tokens', '0af7f9c4a1785945e00b42d9ee485ec466cb93789c5795d80a31fa1141a6969a', '[\"*\"]', NULL, '2022-03-18 06:06:12', '2022-03-18 06:06:12');
INSERT INTO `personal_access_tokens` VALUES (117, 'App\\Models\\User', 2, 'tokens', '20e28823e646754dc79c802b488b2bf27aa91e52c6b0a6b19fc4d84e53aaa818', '[\"*\"]', NULL, '2022-03-18 06:06:46', '2022-03-18 06:06:46');
INSERT INTO `personal_access_tokens` VALUES (118, 'App\\Models\\User', 2, 'tokens', 'aecb7430edf3298589b833da8dcfa5cbe1de4d233987c5f18de8a243776658dd', '[\"*\"]', NULL, '2022-03-18 06:08:41', '2022-03-18 06:08:41');
INSERT INTO `personal_access_tokens` VALUES (119, 'App\\Models\\User', 2, 'tokens', '124291b8cdc0e1ede598fbe47c4c524a6852bfe50d31cde4cb8a1147b6ad8993', '[\"*\"]', NULL, '2022-03-18 06:12:12', '2022-03-18 06:12:12');
INSERT INTO `personal_access_tokens` VALUES (120, 'App\\Models\\User', 2, 'tokens', '3a618e9fdc9dc51fc74f8cfb40fa61ef9ee9218ce74eba30a426f67115be61da', '[\"*\"]', NULL, '2022-03-18 06:18:29', '2022-03-18 06:18:29');
INSERT INTO `personal_access_tokens` VALUES (121, 'App\\Models\\User', 2, 'tokens', 'bf6092963e59e3c889e7673474df9724b49dab105f4439e767a566e28d3b3812', '[\"*\"]', NULL, '2022-03-18 06:23:07', '2022-03-18 06:23:07');
INSERT INTO `personal_access_tokens` VALUES (122, 'App\\Models\\User', 2, 'tokens', '664638f020b964a51f7c42ee27d41eb026d2be6ef7d060000b84df5937c031f7', '[\"*\"]', NULL, '2022-03-18 06:24:20', '2022-03-18 06:24:20');
INSERT INTO `personal_access_tokens` VALUES (123, 'App\\Models\\User', 1, 'tokens', '699a2d8101037bcc5a825858197ddbd39cccd991d1f5e98bd240f014ecc53d87', '[\"*\"]', NULL, '2022-03-18 06:37:15', '2022-03-18 06:37:15');
INSERT INTO `personal_access_tokens` VALUES (124, 'App\\Models\\User', 1, 'tokens', '5f2866e601096ed09ff579e3463ba0cd0055e7748b89d93b5c13e3a038014598', '[\"*\"]', NULL, '2022-03-18 06:37:47', '2022-03-18 06:37:47');
INSERT INTO `personal_access_tokens` VALUES (125, 'App\\Models\\User', 1, 'tokens', 'eb30fac51915ea5ed1ef40f948eb92dd291585441143db2d2e87ed22a86ef008', '[\"*\"]', NULL, '2022-03-18 06:39:45', '2022-03-18 06:39:45');
INSERT INTO `personal_access_tokens` VALUES (126, 'App\\Models\\User', 1, 'tokens', '380d98de732c387e5bf24633852512397622f42135402885508c18827d197d8a', '[\"*\"]', NULL, '2022-03-18 06:45:29', '2022-03-18 06:45:29');
INSERT INTO `personal_access_tokens` VALUES (127, 'App\\Models\\User', 1, 'tokens', 'a402bc753f1b75a5eeced8ad0c6c01d7d8ea60d6016db5d33854f7c03f8a48ec', '[\"*\"]', NULL, '2022-03-18 06:45:45', '2022-03-18 06:45:45');
INSERT INTO `personal_access_tokens` VALUES (128, 'App\\Models\\User', 1, 'tokens', '42d645253ef3c7a43808b9b8d4b6565d80b90b6387f5c8c1c94994603d7dd024', '[\"*\"]', NULL, '2022-03-18 06:46:00', '2022-03-18 06:46:00');
INSERT INTO `personal_access_tokens` VALUES (129, 'App\\Models\\User', 1, 'tokens', '969635e23d5b473bf8d240c53479effb7e56e9e7e072a565b6c26ac1425aff16', '[\"*\"]', NULL, '2022-03-18 06:46:31', '2022-03-18 06:46:31');
INSERT INTO `personal_access_tokens` VALUES (130, 'App\\Models\\User', 1, 'tokens', '68adde997802cfd88e390d159bef0bc9d0dcf2dd0f3b880631c05f0741d310e0', '[\"*\"]', NULL, '2022-03-18 06:46:49', '2022-03-18 06:46:49');
INSERT INTO `personal_access_tokens` VALUES (131, 'App\\Models\\User', 1, 'tokens', '30dad0b5a82bdc38dbc70285eae1d897b0a3bd74315c18f3156745a7062b8d5b', '[\"*\"]', NULL, '2022-03-18 06:47:26', '2022-03-18 06:47:26');
INSERT INTO `personal_access_tokens` VALUES (132, 'App\\Models\\User', 1, 'tokens', '11e7adde34e05ac1275af70c844802757b247595bd98a7e0ee5855f427e46e3d', '[\"*\"]', NULL, '2022-03-18 06:48:59', '2022-03-18 06:48:59');
INSERT INTO `personal_access_tokens` VALUES (133, 'App\\Models\\User', 1, 'tokens', '37821f03f3030bbb5b2a2c7c13fe9253cffb9e409ff1a2a9f2ee05266cfbd875', '[\"*\"]', NULL, '2022-03-18 06:49:17', '2022-03-18 06:49:17');

-- ----------------------------
-- Table structure for questions
-- ----------------------------
DROP TABLE IF EXISTS `questions`;
CREATE TABLE `questions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `type_id` bigint(20) UNSIGNED NOT NULL,
  `text` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `correct_answer` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `limit_time` int(10) UNSIGNED NULL DEFAULT NULL,
  `active` tinyint(1) NOT NULL DEFAULT 0,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `questions_type_id_foreign`(`type_id`) USING BTREE,
  CONSTRAINT `questions_type_id_foreign` FOREIGN KEY (`type_id`) REFERENCES `types` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 5 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of questions
-- ----------------------------
INSERT INTO `questions` VALUES (1, 1, 'React is a JS framework', '1', NULL, 1, '2022-03-17 17:57:19', '2022-03-18 04:55:27');
INSERT INTO `questions` VALUES (2, 1, 'This is the first one', '1', 10, 1, '2022-03-17 18:16:27', '2022-03-17 18:33:44');
INSERT INTO `questions` VALUES (3, 2, 'adfdsfadsf', '2', 20, 1, '2022-03-17 18:45:42', '2022-03-18 04:55:26');
INSERT INTO `questions` VALUES (4, 1, 'asdfasdfasdfadsf', '1', 30, 1, '2022-03-17 20:46:47', '2022-03-17 20:51:52');

-- ----------------------------
-- Table structure for quiz
-- ----------------------------
DROP TABLE IF EXISTS `quiz`;
CREATE TABLE `quiz`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for results
-- ----------------------------
DROP TABLE IF EXISTS `results`;
CREATE TABLE `results`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `score` bigint(20) UNSIGNED NOT NULL,
  `take_time` bigint(20) UNSIGNED NOT NULL,
  `unanswered_count` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `results_user_id_foreign`(`user_id`) USING BTREE,
  CONSTRAINT `results_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of results
-- ----------------------------
INSERT INTO `results` VALUES (1, 2, 4, 10, 1, '2022-03-18 06:24:32', '2022-03-18 06:24:32');
INSERT INTO `results` VALUES (2, 2, 4, 10, 1, '2022-03-18 06:25:36', '2022-03-18 06:25:36');

-- ----------------------------
-- Table structure for subscription_items
-- ----------------------------
DROP TABLE IF EXISTS `subscription_items`;
CREATE TABLE `subscription_items`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `subscription_id` bigint(20) UNSIGNED NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_product` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subscription_items_subscription_id_stripe_price_unique`(`subscription_id`, `stripe_price`) USING BTREE,
  UNIQUE INDEX `subscription_items_stripe_id_unique`(`stripe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for subscriptions
-- ----------------------------
DROP TABLE IF EXISTS `subscriptions`;
CREATE TABLE `subscriptions`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_status` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stripe_price` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `quantity` int(11) NULL DEFAULT NULL,
  `trial_ends_at` timestamp(0) NULL DEFAULT NULL,
  `ends_at` timestamp(0) NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `subscriptions_stripe_id_unique`(`stripe_id`) USING BTREE,
  INDEX `subscriptions_user_id_stripe_status_index`(`user_id`, `stripe_status`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Table structure for types
-- ----------------------------
DROP TABLE IF EXISTS `types`;
CREATE TABLE `types`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `types` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `types_types_index`(`types`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of types
-- ----------------------------
INSERT INTO `types` VALUES (1, 'binary', '2022-03-17 17:56:40', '2022-03-17 17:56:40');
INSERT INTO `types` VALUES (2, 'choice', '2022-03-17 17:56:40', '2022-03-17 17:56:40');

-- ----------------------------
-- Table structure for users
-- ----------------------------
DROP TABLE IF EXISTS `users`;
CREATE TABLE `users`  (
  `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT,
  `name` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp(0) NULL DEFAULT NULL,
  `password` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` enum('admin','tester') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `created_at` timestamp(0) NULL DEFAULT NULL,
  `updated_at` timestamp(0) NULL DEFAULT NULL,
  `stripe_id` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pm_type` varchar(191) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `pm_last_four` varchar(4) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NULL DEFAULT NULL,
  `trial_ends_at` timestamp(0) NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `users_email_unique`(`email`) USING BTREE,
  INDEX `users_stripe_id_index`(`stripe_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_unicode_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of users
-- ----------------------------
INSERT INTO `users` VALUES (1, 'Admin', 'admin@gmail.com', NULL, '$2y$10$Xj52FgoBiiQRY0hhr8lDeOdVGaylswjBBhMM4BMNQPZVJszmd4rPq', 'admin', 'kzJSgTrKSSUj967apuPUnKzB8Kf20yK2wWxa14tzQlzPPRWWGU1y8uzMNuoL', '2022-03-17 17:56:40', '2022-03-17 17:56:40', NULL, NULL, NULL, NULL);
INSERT INTO `users` VALUES (2, 'Shiny@tester', 'test@dev.com', NULL, '$2y$10$mCnCeWX9FEHAIUY4LlmC0.NCRnZ7pq2w.sqSiqFt5B6JBFhQw80Wi', 'tester', 'y82kpjazClYHZu6bz6gw0bUo7KCKwD8gJeHTQRtQJIrvFXlVcn5n9C8E1ogR', '2022-03-18 04:37:48', '2022-03-18 04:37:48', NULL, NULL, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
