SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- TABLE ABOUT ADMIN
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  INDEX `ix_admin_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- INSERT RECORD ABOUT ADMIN
INSERT INTO `admin` VALUES (1, 'admin', 'admin', '2020-10-06 10:23:41');

-- TABLE ABOUT ADMINLOG
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `login_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `admin_id`(`admin_id`) USING BTREE,
  INDEX `ix_adminlog_login_time`(`login_time`) USING BTREE,
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- TABLE ABOUT CAST
DROP TABLE IF EXISTS `cast`;
CREATE TABLE `cast`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `second_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 1 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- Table structure for comment
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `film_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  `score` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `film_id`(`film_id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ix_comment_create_time`(`create_time`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- INSERT SOME RECORD TODO
-- 
-- 
-- 

-- Table structure for direct
DROP TABLE IF EXISTS `direct`;
CREATE TABLE `direct`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `film_id`(`film_id`) USING BTREE,
  INDEX `director_id`(`director_id`) USING BTREE,
  INDEX `ix_direct_create_time`(`create_time`) USING BTREE,
  CONSTRAINT `direct_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT,
  CONSTRAINT `direct_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`) ON DELETE RESTRICT ON UPDATE RESTRICT
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- Records of direct
-- ----------------------------
INSERT INTO `direct` VALUES (1, NULL, 1, '2020-10-06 14:26:16');
INSERT INTO `direct` VALUES (2, 3, 1, '2020-10-06 14:35:36');

-- Table structure for director
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `second_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 6 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- Records of director
INSERT INTO `director` VALUES (1, NULL, NULL, NULL, NULL, NULL, 'Steven Spielberg', '2020-10-06 11:22:38');
INSERT INTO `director` VALUES (2, NULL, NULL, NULL, NULL, NULL, 'Martin Scorsese', '2020-10-06 11:22:41');
INSERT INTO `director` VALUES (3, NULL, NULL, NULL, NULL, NULL, 'Quentin Tarantino', '2020-10-06 11:22:43');
INSERT INTO `director` VALUES (4, NULL, NULL, NULL, NULL, NULL, 'Ridley Scott', '2020-10-06 11:22:45');
INSERT INTO `director` VALUES (5, NULL, NULL, NULL, NULL, NULL, 'James Cameron', '2020-10-06 11:22:48');