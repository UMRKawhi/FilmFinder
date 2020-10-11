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


-- TABLE ABOUT MOVIE COMMENT
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


-- INSERT SOME COMMENT TODO
-- 
-- 


-- TABLE ABOUT DIRECT
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


-- INSERT SOME DIRECT
-- ----------------------------
INSERT INTO `direct` VALUES (1, NULL, 1, '2020-10-06 14:26:16');
INSERT INTO `direct` VALUES (2, 3, 1, '2020-10-06 14:35:36');


-- TABLE ABOUT DIRECTOR
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


-- INSERT SOME DIRECTS
INSERT INTO `director` VALUES (1, NULL, NULL, NULL, NULL, NULL, 'Steven Spielberg', '2020-10-06 11:22:38');
INSERT INTO `director` VALUES (2, NULL, NULL, NULL, NULL, NULL, 'Martin Scorsese', '2020-10-06 11:22:41');
INSERT INTO `director` VALUES (3, NULL, NULL, NULL, NULL, NULL, 'Quentin Tarantino', '2020-10-06 11:22:43');
INSERT INTO `director` VALUES (4, NULL, NULL, NULL, NULL, NULL, 'Ridley Scott', '2020-10-06 11:22:45');
INSERT INTO `director` VALUES (5, NULL, NULL, NULL, NULL, NULL, 'James Cameron', '2020-10-06 11:22:48');


-- TABLE ABOUT BLACKLIST
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `user_id`(`user_id`) USING BTREE,
  INDEX `ix_blacklist_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- TABLE ABOUT FILMS
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `logo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `play_num` bigint(20) DEFAULT NULL,
  `comment_num` bigint(20) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `release_length` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `logo`(`logo`) USING BTREE,
  INDEX `ix_film_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;


-- INSERT FILM
INSERT INTO `film` VALUES (3, 'The Lost World: Jurassic Park', 'The Lost World: Jurassic Park is a 1997 American science fiction adventure film and the second installment in the Jurassic Park film series. A sequel to 1993\'s Jurassic Park and loosely based on Michael Crichton\'s 1995 novel The Lost World, the film was directed by Steven Spielberg and written by David Koepp. The film stars Jeff Goldblum, returning as the eccentric chaos theorist and mathematician Ian Malcolm, as well as Julianne Moore, Pete Postlethwaite, Arliss Howard, Vince Vaughn, and Vanessa Lee Chester. Four years after the disaster at Jurassic Park, John Hammond (Richard Attenborough) sends a team, led by Malcolm, to Isla Sorna, the second island Hammond\'s company InGen used to make the dinosaurs, to study the animals while coming into conflict with a team led by InGen to bring some of the dinosaurs back to the United States.\r\n\r\nAfter the original novel\'s release and the first film\'s success, fans pressured Crichton for a sequel. Following the book\'s publication in 1995, production began on a film sequel. Filming took place from September to December 1996, primarily in California, with a shoot in Kauai, Hawaii, where the first film was shot. The Lost World\'s plot and imagery is substantially darker than Jurassic Park. It makes more extensive use of computer-generated imagery to depict the dinosaurs, along with life-sized animatronics.\r\n\r\nReleased on May 23, 1997, the film received mixed reviews from critics, who praised the visuals and action sequences, but criticized the writing, and character development. The film was a box office success, grossing over $618 million worldwide, becoming the second-highest-grossing film of 1997. It earned an Academy Award nomination for Best Visual Effects. A sequel, Jurassic Park III, was released on July 18, 2001.', '20201006143536afefcd5eb58043d2adc9b97c18596787.jpg', 3, 107, 3, '2020-10-25', '128', '2020-10-06 14:35:36');


-- TABLE ABOUT GENRE
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `create_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `genre`(`name`) USING BTREE,
  INDEX `ix_genre_create_time`(`create_time`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;



-- INSERT SOME GENRES
-- 
-- 


-- Table structure for user

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `first_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `second_name` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `phone` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `face` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `register_time` datetime(0) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE INDEX `name`(`name`) USING BTREE,
  UNIQUE INDEX `email`(`email`) USING BTREE,
  UNIQUE INDEX `phone`(`phone`) USING BTREE,
  UNIQUE INDEX `face`(`face`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;
