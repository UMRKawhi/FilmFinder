/*
Navicat MySQL Data Transfer

Source Server         : 34.87.235.63_3306
Source Server Version : 50725
Source Host           : 34.87.235.63:3306
Source Database       : film

Target Server Type    : MYSQL
Target Server Version : 50725
File Encoding         : 65001

Date: 2020-11-16 12:23:29
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `password` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  KEY `ix_admin_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('1', 'admin', 'pbkdf2:sha256:150000$S1e59BcO$dc45f4154319be0988bce039bf0cc869eaf44fb03e5c954d257215c002b84edb', '2020-10-06 10:23:41');

-- ----------------------------
-- Table structure for `adminlog`
-- ----------------------------
DROP TABLE IF EXISTS `adminlog`;
CREATE TABLE `adminlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `login_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `ix_adminlog_login_time` (`login_time`) USING BTREE,
  CONSTRAINT `adminlog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of adminlog
-- ----------------------------

-- ----------------------------
-- Table structure for `blacklist`
-- ----------------------------
DROP TABLE IF EXISTS `blacklist`;
CREATE TABLE `blacklist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `banner_id` int(11) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_blacklist_create_time` (`create_time`) USING BTREE,
  KEY `blacklist_ibfk_1` (`user_id`) USING BTREE,
  KEY `blacklist_ibfk_2` (`banner_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blacklist
-- ----------------------------

-- ----------------------------
-- Table structure for `cast`
-- ----------------------------
DROP TABLE IF EXISTS `cast`;
CREATE TABLE `cast` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `second_name` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `name` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of cast
-- ----------------------------

-- ----------------------------
-- Table structure for `comment`
-- ----------------------------
DROP TABLE IF EXISTS `comment`;
CREATE TABLE `comment` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `content` text,
  `film_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  `score` smallint(6) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_comment_create_time` (`create_time`) USING BTREE,
  KEY `comment_ibfk_1` (`film_id`) USING BTREE,
  KEY `comment_ibfk_2` (`user_id`) USING BTREE,
  CONSTRAINT `comment_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `comment_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('19', 'I\'m trying to save you money; this is the last film title that you should consider borrowing. Renting Shawshank will cost you five bucks... just plunk down the $25 and own the title. You\'ll wind up going back to this gem time and time again. This is one of few movies that are truly timeless. And it\'s entertaining and moving, no matter how many times you view it.\r\n\r\nForget about what others (including myself) might suggest you\'ll discover in \"The Shawshank Redemption;\" when you watch it, you\'ll identify something very personal in your own life with a scene, a character, or a moment in this uncomplicated movie. When you need hope, you\'ll look for Shawshank. When you want to believe in the will of overcoming even the greatest obstacles, Shawshank will uplift you in ways that you can\'t find in movies today.\r\n\r\nSome liken the film to some kind of spiritual awakening. Of course, some can go to a church or mosque to find enlightenment and Faith in humanity, but most places of worship are open only certain days or times. But when you need affirmation of the lasting bond of friendships that prevail over the most dire circumstances, Shawshank will give it to you. It makes grown men (like me) cry, still. I wonder whether Shawshank was truly meant for viewing in the privacy of the home, because it is a personal experience that really makes you look inward. Nominated for seven, this is the best film that never one a single Oscar.\r\n\r\nHow ironic that an innocent man winds up being surrounded by the corruption of the legal system. Shawshank itself is similar to the character of Andy Dufresne. Prejudging this classic film, critics couldn\'t get past the title. The public followed suit, initially dismissing Shawshank, which failed in the box office just like \"It\'s a Wonderful Life\" and \"Citizen Kane.\" It could have just whithered away on the store shelves, like Andy Dufresne could have in his own cell. But the characters prevailed, because Andy -- And Shawshank -- stayed true. Now, these movies are right up there as the most popular films of all time.\r\n\r\nAnyone who has yet to watch Shawshank may be so jaded of movies, or the film\'s title, or how a 2-1/2- hour movie set inside the walls of a prison can manage to tap the soul of such a wide range of people. Shawshank has not one explosion. I wonder if it even has a single special effect or digitally- enhanced frame.\r\n\r\nBut every aspect of Shawshank fit together. The acting from the top to the bit part. The musical score. The editing. The photography. The story, from opening credits to final scene. All involved, including the town of Mansfield, Ohio (where Shawshank was actually filmed) played their roles perfectly. Shawshank is a must- see, must- own title.', '9', '2', '2020-11-07 14:19:13', '5');
INSERT INTO `comment` VALUES ('20', 'Why do I want to write the 234th comment on The Shawshank Redemption? I am not sure - almost everything that could be possibly said about it has been said. But like so many other people who wrote comments, I was and am profoundly moved by this simple and eloquent depiction of hope and friendship and redemption.\r\n\r\nThe only other movie I have ever seen that effects me as strongly is To Kill a Mockingbird. Both movies leave me feeling cleaner for having watched them.\r\n\r\nI didn\'t intend to see this movie at all: I do not like prison movies and I don\'t normally watch them. I work at a branch library and one day as I was checking The Shawshank Redemption out to one of our older patrons, she said to me, \"Whenever I feel down or depressed, I check out this movie and watch it and it always makes me feel better.\" At the time, I thought that was very strange. One day there was nothing on TV except things I absolutely would not watch under any circumstance or things that I had seen too many times already. I remembered what she said, so I watched it. I have watched it many many times since then and it gets better with every showing.\r\n\r\nNo action, no special effects - just men in prison uniforms talking to each other.\r\n\r\nThe Shawshank Redemption and To Kill a Mockingbird are the best movies I have ever seen. I do not judge it by it\'s technical merits - I don\'t really care about that. I have read that Citizen Kane or The Godfather or this or that movie is the best movie ever made. They may have the best technique or be the most influential motion pictures ever made, but not the best. The best movies are ones that touch the soul. It takes a movie like The Shawshank Redemption to touch the soul.', '9', '1', '2020-11-07 14:20:49', '5');
INSERT INTO `comment` VALUES ('21', 'The most wonderful movie I have ever seen!', '19', '3', '2020-11-08 10:56:45', '5');
INSERT INTO `comment` VALUES ('24', 'trash file!', '9', '4', '2020-11-15 16:50:47', '1');
INSERT INTO `comment` VALUES ('25', 'I love Blue Velvet. David Lynch is the best director!', '28', '9', '2020-11-16 10:53:01', '5');
INSERT INTO `comment` VALUES ('26', 'Steven Spielberg is a good director. Horror is the best genre!', '22', '9', '2020-11-16 10:58:14', '4');
INSERT INTO `comment` VALUES ('27', 'David Lynch is the best director! And the movie is excellent!', '30', '9', '2020-11-16 10:59:05', '5');
INSERT INTO `comment` VALUES ('28', 'Thirller movie has same elements as horror movie! I like it! Panic Room is so cool!', '34', '9', '2020-11-16 11:03:34', '5');
INSERT INTO `comment` VALUES ('29', 'I don\'t like animation!', '19', '9', '2020-11-16 11:41:22', '1');
INSERT INTO `comment` VALUES ('30', 'Science movie is not bad.', '27', '9', '2020-11-16 11:42:20', '3');
INSERT INTO `comment` VALUES ('31', 'David Lynch is a good director. Very sad story!', '26', '9', '2020-11-16 11:43:00', '4');
INSERT INTO `comment` VALUES ('33', 'Not bad!', '32', '9', '2020-11-16 11:44:55', '3');
INSERT INTO `comment` VALUES ('34', 'I don\'t like horror movie!', '28', '8', '2020-11-16 12:03:12', '1');
INSERT INTO `comment` VALUES ('35', 'I like thriller movie!', '34', '8', '2020-11-16 12:03:42', '5');
INSERT INTO `comment` VALUES ('36', 'I don\'t like horror movie!', '30', '8', '2020-11-16 12:04:16', '1');
INSERT INTO `comment` VALUES ('37', 'I don\'t like horror movie!', '22', '8', '2020-11-16 12:04:38', '2');
INSERT INTO `comment` VALUES ('38', 'Biography movie is not bad!', '26', '8', '2020-11-16 12:08:23', '3');
INSERT INTO `comment` VALUES ('39', 'I like thriller movie!', '31', '8', '2020-11-16 12:08:55', '5');
INSERT INTO `comment` VALUES ('40', 'Biography movie is not bad!~', '35', '8', '2020-11-16 12:09:42', '3');
INSERT INTO `comment` VALUES ('41', 'Crime movie is so good!', '33', '8', '2020-11-16 12:09:58', '5');
INSERT INTO `comment` VALUES ('42', 'I hate couple!', '29', '8', '2020-11-16 12:10:27', '1');
INSERT INTO `comment` VALUES ('43', 'Trash movie!', '30', '7', '2020-11-16 12:12:27', '1');
INSERT INTO `comment` VALUES ('44', 'Trash movie!', '29', '7', '2020-11-16 12:12:43', '1');
INSERT INTO `comment` VALUES ('45', 'Good movie!', '35', '7', '2020-11-16 12:12:59', '5');
INSERT INTO `comment` VALUES ('46', 'Good movie!', '26', '7', '2020-11-16 12:13:25', '5');
INSERT INTO `comment` VALUES ('47', 'Not bad!', '32', '7', '2020-11-16 12:14:03', '3');
INSERT INTO `comment` VALUES ('48', 'Don\'t like it!', '27', '7', '2020-11-16 12:14:18', '2');
INSERT INTO `comment` VALUES ('49', 'Quite interesting.', '28', '7', '2020-11-16 12:14:41', '3');
INSERT INTO `comment` VALUES ('50', 'The best movie directed by David Fincher!', '34', '7', '2020-11-16 12:15:13', '5');
INSERT INTO `comment` VALUES ('51', 'Crime movie is so boring!', '33', '7', '2020-11-16 12:15:38', '2');
INSERT INTO `comment` VALUES ('52', 'Thirller movie is good!', '31', '7', '2020-11-16 12:17:31', '4');
INSERT INTO `comment` VALUES ('53', 'Very famous movie!', '29', '6', '2020-11-16 12:18:45', '3');
INSERT INTO `comment` VALUES ('54', 'To be honest, this is good movie!', '27', '6', '2020-11-16 12:19:15', '5');
INSERT INTO `comment` VALUES ('55', 'Thriller movie is good!', '31', '6', '2020-11-16 12:19:51', '4');
INSERT INTO `comment` VALUES ('56', 'trash movie!', '35', '6', '2020-11-16 12:20:05', '1');
INSERT INTO `comment` VALUES ('57', 'Crime movie is good!', '33', '6', '2020-11-16 12:20:23', '4');

-- ----------------------------
-- Table structure for `direct`
-- ----------------------------
DROP TABLE IF EXISTS `direct`;
CREATE TABLE `direct` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `director_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `film_id` (`film_id`) USING BTREE,
  KEY `director_id` (`director_id`) USING BTREE,
  KEY `ix_direct_create_time` (`create_time`) USING BTREE,
  CONSTRAINT `direct_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `direct_ibfk_2` FOREIGN KEY (`director_id`) REFERENCES `director` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of direct
-- ----------------------------
INSERT INTO `direct` VALUES ('2', null, '1', '2020-10-06 14:35:36');
INSERT INTO `direct` VALUES ('3', null, '1', '2020-10-07 22:25:38');
INSERT INTO `direct` VALUES ('4', null, '1', '2020-10-08 10:20:49');
INSERT INTO `direct` VALUES ('5', null, '1', '2020-10-14 23:49:08');
INSERT INTO `direct` VALUES ('8', '9', '7', '2020-11-07 14:08:06');
INSERT INTO `direct` VALUES ('9', '10', '8', '2020-11-07 14:13:21');
INSERT INTO `direct` VALUES ('10', '11', '9', '2020-11-07 14:17:54');
INSERT INTO `direct` VALUES ('11', '12', '10', '2020-11-07 14:30:17');
INSERT INTO `direct` VALUES ('12', '13', '5', '2020-11-07 16:26:52');
INSERT INTO `direct` VALUES ('13', '14', '11', '2020-11-07 16:29:07');
INSERT INTO `direct` VALUES ('14', '15', '13', '2020-11-07 16:31:50');
INSERT INTO `direct` VALUES ('15', '16', '15', '2020-11-07 16:33:52');
INSERT INTO `direct` VALUES ('16', '17', '15', '2020-11-07 16:35:54');
INSERT INTO `direct` VALUES ('17', '18', '20', '2020-11-07 16:37:56');
INSERT INTO `direct` VALUES ('18', '19', '21', '2020-11-07 16:39:19');
INSERT INTO `direct` VALUES ('19', '20', '25', '2020-11-07 16:41:30');
INSERT INTO `direct` VALUES ('20', null, '1', '2020-11-14 15:25:26');
INSERT INTO `direct` VALUES ('21', '22', '1', '2020-11-14 15:26:04');
INSERT INTO `direct` VALUES ('22', null, '30', '2020-11-15 17:10:51');
INSERT INTO `direct` VALUES ('23', null, '31', '2020-11-16 08:56:43');
INSERT INTO `direct` VALUES ('24', null, '31', '2020-11-16 09:02:43');
INSERT INTO `direct` VALUES ('25', '26', '31', '2020-11-16 09:25:31');
INSERT INTO `direct` VALUES ('26', '27', '31', '2020-11-16 09:30:56');
INSERT INTO `direct` VALUES ('27', '28', '31', '2020-11-16 09:35:33');
INSERT INTO `direct` VALUES ('28', '29', '31', '2020-11-16 09:49:24');
INSERT INTO `direct` VALUES ('29', '30', '31', '2020-11-16 09:54:16');
INSERT INTO `direct` VALUES ('30', '31', '32', '2020-11-16 09:59:49');
INSERT INTO `direct` VALUES ('31', '32', '32', '2020-11-16 10:04:29');
INSERT INTO `direct` VALUES ('32', '33', '32', '2020-11-16 10:20:08');
INSERT INTO `direct` VALUES ('33', '34', '32', '2020-11-16 10:25:13');
INSERT INTO `direct` VALUES ('34', '35', '32', '2020-11-16 10:34:17');

-- ----------------------------
-- Table structure for `director`
-- ----------------------------
DROP TABLE IF EXISTS `director`;
CREATE TABLE `director` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `first_name` varchar(20) DEFAULT NULL,
  `second_name` varchar(20) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `name` varchar(100) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of director
-- ----------------------------
INSERT INTO `director` VALUES ('1', null, null, null, null, null, 'Steven Spielberg', '2020-10-06 11:22:38');
INSERT INTO `director` VALUES ('2', null, null, null, null, null, 'Martin Scorsese', '2020-10-06 11:22:41');
INSERT INTO `director` VALUES ('3', null, null, null, null, null, 'Quentin Tarantino', '2020-10-06 11:22:43');
INSERT INTO `director` VALUES ('5', null, null, null, null, null, 'James Cameron', '2020-10-06 11:22:48');
INSERT INTO `director` VALUES ('7', null, null, null, null, null, 'Frank Darabont', '2020-11-07 14:01:04');
INSERT INTO `director` VALUES ('8', null, null, null, null, null, 'Kaige Chen', '2020-11-07 14:01:12');
INSERT INTO `director` VALUES ('9', null, null, null, null, null, 'Robert Zemeckis', '2020-11-07 14:01:21');
INSERT INTO `director` VALUES ('10', null, null, null, null, null, 'Luc Besson', '2020-11-07 14:01:29');
INSERT INTO `director` VALUES ('11', null, null, null, null, null, 'Roberto Benigni', '2020-11-07 14:01:55');
INSERT INTO `director` VALUES ('13', null, null, null, null, null, 'Hayao Miyazaki', '2020-11-07 14:02:09');
INSERT INTO `director` VALUES ('15', null, null, null, null, null, 'Christopher Nolan', '2020-11-07 14:02:34');
INSERT INTO `director` VALUES ('16', null, null, null, null, null, 'Lasse Hallström', '2020-11-07 14:02:42');
INSERT INTO `director` VALUES ('17', null, null, null, null, null, 'Giuseppe Tornatore', '2020-11-07 14:02:53');
INSERT INTO `director` VALUES ('18', null, null, null, null, null, 'Peter Weir', '2020-11-07 14:03:02');
INSERT INTO `director` VALUES ('19', null, null, null, null, null, 'Rajkumar Hirani', '2020-11-07 14:03:11');
INSERT INTO `director` VALUES ('20', null, null, null, null, null, 'Andrew Stanton', '2020-11-07 14:03:19');
INSERT INTO `director` VALUES ('21', null, null, null, null, null, 'Byron Howard', '2020-11-07 14:03:36');
INSERT INTO `director` VALUES ('22', null, null, null, null, null, 'Francis Ford Coppola', '2020-11-07 14:03:44');
INSERT INTO `director` VALUES ('23', null, null, null, null, null, 'Gabriele Muccino', '2020-11-07 14:03:53');
INSERT INTO `director` VALUES ('24', null, null, null, null, null, 'Billy Wilde', '2020-11-07 14:04:06');
INSERT INTO `director` VALUES ('25', null, null, null, null, null, 'Pete Docter', '2020-11-07 16:40:35');
INSERT INTO `director` VALUES ('27', null, null, null, null, null, 'Don Hall', '2020-11-14 15:29:15');
INSERT INTO `director` VALUES ('28', null, null, null, null, null, 'George Lucas', '2020-11-14 19:08:04');
INSERT INTO `director` VALUES ('29', null, null, null, null, null, 'James Wan', '2020-11-14 19:43:22');
INSERT INTO `director` VALUES ('30', null, null, null, null, null, 'James McTeigue', '2020-11-15 17:09:52');
INSERT INTO `director` VALUES ('31', null, null, null, null, null, 'David Lynch', '2020-11-16 08:52:46');
INSERT INTO `director` VALUES ('32', null, null, null, null, null, 'David Fincher', '2020-11-16 09:55:32');

-- ----------------------------
-- Table structure for `film`
-- ----------------------------
DROP TABLE IF EXISTS `film`;
CREATE TABLE `film` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `description` text,
  `logo` varchar(255) DEFAULT NULL,
  `star` smallint(6) DEFAULT NULL,
  `play_num` bigint(20) DEFAULT NULL,
  `comment_num` bigint(20) DEFAULT NULL,
  `release_time` date DEFAULT NULL,
  `release_length` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `logo` (`logo`) USING BTREE,
  KEY `ix_film_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('9', 'The Shawshank Redemption', 'In 1947 Portland, Maine, banker Andy Dufresne is convicted of murdering his wife and her lover and is sentenced to two consecutive life sentences at the Shawshank State Penitentiary. He is befriended by Ellis \"Red\" Redding, an inmate and prison contraband smuggler serving a life sentence. Red procures a rock hammer and a large poster of Rita Hayworth for Andy. Assigned to work in the prison laundry, Andy is frequently sexually assaulted by \"the Sisters\" and their leader, Bogs.\r\n\r\nIn 1949, Andy overhears the captain of the guards, Byron Hadley, complaining about being taxed on an inheritance and offers to help him shelter the money legally. After an assault by the Sisters nearly kills Andy, Hadley beats and cripples Bogs, who is subsequently transferred to another prison. Andy is not attacked again. Warden Samuel Norton meets Andy and reassigns him to the prison library to assist elderly inmate Brooks Hatlen, a front to allow Andy to manage financial matters for other prison staff, guards from other prisons, and the warden himself. Andy begins writing weekly letters to the state legislature requesting funds to improve the prison\'s decaying library.\r\n\r\nBrooks is paroled in 1954 after serving 50 years, but he cannot adjust to the outside world and eventually hangs himself. The legislature sends a library donation that includes a recording of The Marriage of Figaro; Andy plays an excerpt over the public address system and is punished with solitary confinement. After his release from solitary, Andy explains that hope is what gets him through his time, a concept that Red dismisses. In 1963, Norton begins exploiting prison labor for public works, profiting by undercutting skilled labor costs and receiving bribes. Andy launders the money using the alias \"Randall Stephens\".\r\n\r\nTommy Williams is incarcerated for burglary in 1965. Andy and Red befriend him, and Andy helps him pass his GED exam. A year later, Tommy reveals to Red and Andy that his cellmate at another prison had claimed responsibility for the murders for which Andy was convicted. Andy approaches Norton with this information, but Norton refuses to listen, and when Andy mentions the money laundering, Norton sends him back to solitary confinement. Norton has Hadley murder Tommy under the guise of an escape attempt. Andy attempts to discontinue the laundering, but relents after Norton threatens to destroy the library, remove Andy\'s protection from the guards, and move him to worse conditions. Andy is released from solitary confinement after two months, and he tells a skeptical Red that he dreams of living in Zihuatanejo, a Mexican coastal town. Andy also tells him of a specific hayfield near Buxton, asking Red—once he is released—to retrieve a package that Andy buried there. Red worries about Andy\'s well-being, especially when he learns Andy asked a fellow inmate for 6 ft (1.8 m) of rope.\r\n\r\nAt the next day\'s roll call, the guards find Andy\'s cell empty. An irate Norton throws a rock at a poster of Raquel Welch hanging on the cell wall, revealing a tunnel that Andy dug with his rock hammer over the past 19 years. The previous night, Andy used the rope to escape through the tunnel and prison sewage pipe, taking Norton\'s suit, shoes, and ledger, containing proof of the money laundering. While guards search for him, Andy poses as Randall Stephens, withdraws over $370,000 (equivalent to $2.92 million in 2019) of the laundered money from several banks, and mails the ledger and other evidence of the corruption and murders at Shawshank to a local newspaper. State police arrive at Shawshank and take Hadley into custody, while Norton commits suicide to avoid arrest.\r\n\r\nThe following year, Red is finally paroled after serving 40 years. He struggles to adapt to life outside prison and fears that he never will. Remembering his promise to Andy, he visits Buxton and finds a cache containing money and a letter asking him to come to Zihuatanejo. Red violates his parole by traveling to Fort Hancock, Texas, and crossing the border into Mexico, admitting that he finally feels hope. He finds Andy on a beach in Zihuatanejo, and the two reunited friends happily embrace.', 'The Shawshank Redemption.jpg', '4', '168', '3', '1994-10-14', '142', '2020-11-07 14:08:06');
INSERT INTO `film` VALUES ('10', 'Farewell My Concubine', 'Douzi, a boy endowed with feminine features, is abandoned by his prostitute mother to an all-boys Peking opera troupe supervised by Master Guan. He befriends Shitou, a student of the troupe.\r\n\r\nA few years later in 1938, a teenage Douzi is trained to play dan (female roles), while Shitou learns jing (painted face male roles). When practicing the play \"Dreaming of the World Outside the Nunnery\", Douzi accidentally substitutes the line \"I am by nature a girl, not a boy\" with \"I am by nature a boy, not a girl,\" and is disciplined by the instructors. Douzi along with another student, Laizi, attempt to run away, but Douzi decides to pursue acting seriously after witnessing an opera performance. Upon returning, they find the whole troupe being punished for their desertion, and Douzi is beaten. As a result, Laizi hangs himself.\r\n\r\nAn agent who provides funding for opera plays comes to the troupe to seek potentials. When Douzi repeats the same mistake in front of the agent, Shitou commands him to start over. Douzi finally whispers, \"I am by nature a girl, not a boy\". He delivers the entire monologue successfully, to the joy of the troupe, and secures the agent. The troupe is invited to perform for eunuch Zhang. Shitou and Douzi are brought to Zhang\'s house where they find a finely crafted sword, which Shitou promises to one day gift to Douzi, as the hero would do for his concubine. Zhang asks to meet Douzi in his room and sexually assaults him. Douzi does not mention this to anyone, but Shitou implicitly knows what happened. On their way home, Douzi adopts an abandoned baby, who later comes under Master Guan\'s training.\r\n\r\n\r\nMemorabilia from the film exhibited at \"The Art of Leslie Cheung\'s Movie Images\", April 2013, Hong Kong Central Library.\r\nYears go by, Douzi and Shitou become Peking opera stars under stage names Cheng Dieyi and Duan Xiaolou, respectively. Their signature performance is the play Farewell My Concubine, where Dieyi plays the concubine Consort Yu and Xiaolou plays the hero Xiang Yu. Their fame attracts the attention of Yuan Shiqing, a reputable person who attends their performances. Yuan Shiqing also possesses a sword similar to the one that Dieyi and Xiaolou found, which he gives to Dieyi. The adult Dieyi has an unrequited love for Xiaolou, but when Xiaolou marries Juxian, a headstrong courtesan at an upscale brothel, Dieyi and Xiaolou\'s relationship begins to fall apart. The love triangle between Dieyi, Xiaolou, and Juxian leads to jealousy and betrayal, which is further complicated by the successive political upheavals following the Second Sino-Japanese War. When Master Guan dies, the abandoned baby, now Xiao Si, comes under Dieyi\'s training to continue learning dan roles.\r\n\r\nWhen the communist forces win the civil war, Xiao Si becomes an avid follower of the new government. Dieyi\'s addiction to opium negatively affects his performances, but he ultimately rehabilitates with the help of Xiaolou and Juxian. Xiao Si nurtures resentment against Dieyi because of his rigorous teachings and usurps his role in Farewell My Concubine during one performance, without anyone telling Dieyi beforehand. Devastated by the betrayal, Dieyi secludes himself and refuses to reconcile with Xiaolou. As the Cultural Revolution continues, the entire opera troupe is put on a struggle session by the Red Guards where, under pressure, Dieyi and Xiaolou accuse each other of counterrevolutionary acts. Dieyi also tells the guards that Juxian was a prostitute. To protect himself from further prosecution, Xiaolou swears that he does not love her and will \"make a clean break\" with her. Juxian is heartbroken and returns the sword to Dieyi before committing suicide. Afterward, Xiao Si is caught by the Red Guards when he is singing Consort Yu\'s lines to the mirror alone in a practice room.\r\n\r\nIn 1977, Dieyi and Xiaolou reunite, seeming to have mended their relationship. They once again practice Farewell My Concubine; Xiaolou begins with the line \"I am by nature a boy,\" to which Dieyi makes the same mistake of finishing with \"I am not a girl.\" As they finish their performance, Dieyi takes Xiaolou\'s sword and cuts his throat, paralleling the concubine\'s final act in the opera.', 'Farewell, My Concubine.jpg', '0', '21', '0', '1993-01-01', '155', '2020-11-07 14:13:21');
INSERT INTO `film` VALUES ('11', 'Forrest Gump', 'In 1981, at a bus stop in Savannah, Georgia, a man named Forrest Gump recounts his life story to strangers who sit next to him on a bench.\r\n\r\nIn 1951, in Greenbow, Alabama, young Forrest is fitted with leg braces to correct a curved spine, and is unable to walk properly. He lives alone with his mother, who runs a boarding house out of their home that attracts many tenants, including a young Elvis Presley, who plays the guitar for Forrest and incorporates Forrest\'s jerky dance movements into his performances. On his first day of school, Forrest meets a girl named Jenny Curran, and the two become best friends.\r\n\r\nForrest is often bullied because of his physical disability and marginal intelligence. While fleeing from several bullies, his leg braces break off, revealing Forrest to be a very fast runner. This talent eventually allows him to receive a football scholarship at the University of Alabama in 1963, where he is coached by Bear Bryant; he witnesses Governor George Wallace\'s stand in the schoolhouse door, becomes a top kick returner, is named on the All-American team, and meets President John F. Kennedy at the White House.\r\n\r\nAfter graduating college in 1967, Forrest enlists into the U.S. Army. During basic training, he befriends a fellow soldier nicknamed \"Bubba\", who convinces Forrest to go into the shrimping business with him after their service. In 1968, they are sent to Vietnam, serving with the 9th Infantry Division in the Mekong Delta region. After months of routine operations, their platoon is ambushed while on patrol, and Bubba is killed in action. Forrest saves several wounded platoon-mates—including his lieutenant, Dan Taylor, who loses both his legs—and is awarded the Medal of Honor for his heroism by President Lyndon B. Johnson.\r\n\r\nAt the anti-war \"March on the Pentagon\" rally, Forrest meets Abbie Hoffman and briefly reunites with Jenny, who has been living a hippie lifestyle. He also develops a talent for ping-pong, and becomes a sports celebrity as he competes against Chinese teams in ping-pong diplomacy, earning him an interview alongside John Lennon on The Dick Cavett Show. He spends the holidays and the 1972 new year in New York City with Lieutenant Dan, who has become an embittered cripple. Forrest soon meets President Richard Nixon and is put up in the Watergate complex, where he accidentally exposes the Watergate scandal, forcing Nixon to resign. Forrest is eventually discharged from the army.\r\n\r\nReturning to Greenbow, Forrest endorses a company that makes ping-pong paddles. He uses the earnings to buy a shrimping boat in Bayou La Batre, fulfilling his promise to Bubba. Lieutenant Dan joins Forrest in 1974, and they initially have little success. After their boat becomes the only one to survive Hurricane Carmen, they pull in huge amounts of shrimp and create the Bubba Gump Shrimp Company, after which Lieutenant Dan finally thanks Forrest for saving his life. Lieutenant Dan invests into what Forrest thinks is ”some kind of fruit company” and the two become millionaires, but Forrest also gives half of the earnings to Bubba\'s family. Forrest then returns home to see his mother as she dies of cancer.\r\n\r\nIn 1976, Jenny—in the midst of recovering from years of drugs and abuse—returns to visit Forrest, and after a while he proposes to her. That night she tells Forrest she loves him and the two make love, but she leaves the next morning. Heartbroken, Forrest goes running, and spends the next three years in a relentless cross-country marathon, becoming famous again before returning home to Greenbow.\r\n\r\nBack in 1981, Forrest reveals that he is waiting at the bus stop because he received a letter from Jenny, who asked him to visit her. As Forrest is finally reunited with Jenny, she introduces him to their son, named Forrest Gump, Jr. Jenny tells Forrest she is sick with an unknown incurable virus, and the three move back to Greenbow. Jenny and Forrest finally marry, but she dies a year later. The film ends with Forrest seeing his son off on his first day of school.', 'Forrest Gump.jpg', '0', '17', '0', '1994-07-06', '142', '2020-11-07 14:17:54');
INSERT INTO `film` VALUES ('12', 'Léon', 'Léon is an Italian hitman (or \"cleaner\", as he refers to himself) living a solitary life in New York City\'s Little Italy. His work comes from a mafioso named \"Old Tony\".\r\n\r\nOne day, Léon meets Mathilda Lando, a lonely 12-year-old girl. Mathilda lives with her dysfunctional family in an apartment down the hall, and has stopped attending class at her school for troubled girls. Mathilda\'s abusive father attracts the ire of corrupt DEA agents, who have been paying him to stash cocaine in his apartment. After they discover he has been stealing the cocaine, DEA agents storm the building, led by sharply dressed drug addict Norman Stansfield. During the raid, Stansfield murders Mathilda\'s entire family while she is out shopping for groceries. When Mathilda returns, she realizes what has happened just in time to continue down the hall to Léon\'s apartment; he hesitantly gives her shelter.\r\n\r\nMathilda quickly discovers that Léon is a hitman. She begs him to take care of her and to teach her his skills, as she wants to avenge the murder of her four-year-old brother. At first, Léon is unsettled by her presence, and considers murdering her, but he eventually trains Mathilda and shows her how to use various weapons. In exchange, she runs his errands, cleans his apartment, and teaches him how to read. In time, the pair form a close bond. Mathilda looks up to Léon and quickly develops a crush on him, often telling him she loves him, but he refuses to reciprocate.\r\n\r\nWhen Léon heads out for an apparent assignment, Mathilda fills a bag with guns from Léon\'s collection and sets out to kill Stansfield. She bluffs her way into the DEA office by posing as a delivery girl, only to be ambushed by Stansfield in a bathroom; one of his men arrives and announces that Léon had just killed Malky, one of the corrupt DEA agents, in Chinatown that morning. Léon, after discovering her plan in a note left for him, rescues Mathilda, killing two more of Stansfield\'s men in the process. An enraged Stansfield confronts Tony, who is violently interrogated for Léon\'s whereabouts.\r\n\r\nAs Mathilda and Léon recover from the ordeal, Léon tells her about how he became a cleaner; when Léon was young in Italy, he was in love with a girl from a wealthy family. The two made plans to elope, but when the girl\'s father discovered their relationship, he killed her out of anger and escaped justice. Léon killed the father out of revenge and fled to New York, where he met Tony and trained to become a cleaner.\r\n\r\nLater, while Mathilda returns home from grocery shopping, a NYPD ESU team sent by Stansfield captures her and attempts to infiltrate Léon\'s apartment. Léon ambushes the ESU team and rescues Mathilda. Léon creates a quick escape for Mathilda by smashing a hole in an air shaft; he tells her to meet him at Tony\'s place in an hour, and tells her that he loves her, moments before the police blow up the apartment. In the chaos that follows, Léon sneaks out of the building disguised as a wounded ESU officer; he goes unnoticed save for Stansfield, who follows him and shoots him in the back. As he is dying, Léon places an object in Stansfield\'s hands that he says is \"from Mathilda\"; Stansfield discovers that it is a grenade pin. He then opens Léon\'s vest to find a cluster of active grenades, which promptly detonate, killing Stansfield.\r\n\r\nMathilda goes to Tony, as Léon had told her to do earlier. Mathilda tries to convince Tony to hire her in Leon\'s place, but Tony flatly refuses to hire a twelve-year-old, and tells Mathilda he had been instructed by Léon to give his money to her if anything happened to him. He gives Mathilda $100 from Leon\'s funds as an allowance, and sends her back to school, where the headmistress re-admits her after Mathilda reveals what had happened to her. She then walks onto a field near the school to plant Léon\'s houseplant, as she had told Léon that he should \"give it roots\".', '202011071430165c61bc9c23ea4f5caf5a99df0d437a80.jpg', '0', '12', '0', '1994-09-14', '133', '2020-11-07 14:30:17');
INSERT INTO `film` VALUES ('13', 'Titanic', 'In 1996, treasure hunter Brock Lovett and his team board the research vessel Akademik Mstislav Keldysh to search the wreck of RMS Titanic for a necklace with a rare diamond, the Heart of the Ocean. They recover a safe containing a drawing of a young woman wearing only the necklace dated April 14, 1912, the day the ship struck the iceberg.[Note 1] Rose Dawson Calvert, the woman in the drawing, is brought aboard Keldysh and tells Lovett of her experiences aboard Titanic.\r\n\r\nIn 1912 Southampton, 17-year-old first-class passenger Rose DeWitt Bukater, her fiancé Cal Hockley, and her mother Ruth board the luxurious Titanic. Ruth emphasizes that Rose\'s marriage will resolve their family\'s financial problems and allow them to retain their upper-class status. Distraught over the engagement, Rose climbs over the stern and contemplates suicide; Jack Dawson, a poor artist, intervenes and discourages her. Discovered with Jack, Rose tells a concerned Cal that she was peering over the edge and Jack saved her from falling. Cal becomes indifferent, and it is suggested to him that Jack be rewarded; he invites Jack to dine with them in first-class. Jack and Rose develop a tentative friendship, despite Cal, his valet Spicer Lovejoy, and Ruth, being wary of him. Following dinner, Rose secretly joins Jack at a party in third-class.\r\n\r\nAware of Cal and Ruth\'s disapproval, Rose rebuffs Jack\'s advances, but later realizes she prefers him over Cal. After rendezvousing on the bow at sunset, Rose takes Jack to her state room; at her request, Jack sketches Rose posing nude wearing Cal\'s engagement present, the Heart of the Ocean. They evade Lovejoy, and have sex in an automobile inside the cargo hold. On the forward deck, they witness the ship\'s collision with an iceberg and overhear its officers and builder discussing its seriousness.\r\n\r\nCal discovers Jack\'s sketch of Rose and an insulting note from her in his safe along with the necklace. When Jack and Rose attempt to inform Cal of the collision, Cal retaliates by having Lovejoy slip the necklace into Jack\'s pocket, accusing him of theft. Jack is arrested and restrained in the master-at-arms\' office. Cal puts the necklace in his own coat pocket.\r\n\r\nWith the ship sinking, Rose flees Cal and her mother, who has boarded a lifeboat, and frees Jack. On the boat deck, Cal and Jack encourage her to board a lifeboat. While intending only to save himself, Cal claims he can ensure he and Jack get off safely. As her lifeboat lowers, Rose realizes she cannot leave Jack, and jumps back on board. Cal takes Lovejoy\'s pistol and chases Rose and Jack into the flooding first-class dining saloon. After using up his ammunition, he relents. Cal realizes he gave his coat, and consequently the necklace, to Rose. He later boards a lifeboat by carrying a lost child.\r\n\r\nAfter braving several obstacles, Jack and Rose return to the boat deck. The lifeboats have departed and passengers are falling to their deaths as the stern rises out of the water. The ship breaks in half, dropping the stern into the water. Jack and Rose climb onto the back of it, and ride it into the ocean. He helps her onto a wooden panel buoyant enough for only one person. He assures her that she will die an old woman, warm in her bed. Jack dies of hypothermia,[8] but Rose is saved by a returning lifeboat.\r\n\r\nThe RMS Carpathia later rescues the survivors; on board, Rose hides from Cal en route to New York City, where she gives her name as Rose Dawson. Rose says she later read that Cal committed suicide after losing his fortune in the Wall Street Crash of 1929.\r\n\r\nBack in the present, Lovett decides to abandon his search after hearing Rose\'s story. Alone on the stern of Keldysh, Rose takes out the Heart of the Ocean, which was in her possession all along, and drops it into the sea over the wreck site. While she is seemingly asleep or has died in her bed,[9] photos on her dresser depict a life of freedom and adventure. A young Rose reunites with Jack at Titanic\'s Grand Staircase, applauded by those who died on the ship.', '20201107162651197e643fa0474f3186dfee3bf47e64e1.jpg', '0', '15', '0', '1997-12-19', '194', '2020-11-07 16:26:52');
INSERT INTO `film` VALUES ('14', 'Life Is Beautiful', 'In 1939, in the Kingdom of Italy, Guido Orefice is a young Jewish man who arrives to work in the city (Arezzo, in Tuscany) where his uncle Eliseo runs a restaurant. Guido is comical and sharp and falls in love with a Gentile girl named Dora. Later, he sees her again in the city where she is a teacher and set to be engaged to a rich, but arrogant, man, a local government official with whom Guido has regular run-ins. Guido sets up many \"coincidental\" incidents to show his interest in Dora. Finally, Dora sees Guido\'s affection and promise, and gives in, against her better judgment. He steals the lady from her engagement party, on a horse, humiliating her fiancé and mother. They are later married and have a son, Giosuè, and run a bookstore.\r\n\r\nWhen World War II breaks out, Guido, his uncle Eliseo, and Giosuè are seized on Giosuè\'s birthday. They and many other Jews are forced onto a train and taken to a concentration camp. After confronting a guard about her husband and son, and being told there is no mistake, Dora volunteers to get on the train in order to be close to her family. However, as men and women are separated in the camp, Dora and Guido never see each other during the internment. Guido pulls off various stunts, such as using the camp\'s loudspeaker to send messages—symbolic or literal—to Dora to assure her that he and their son are safe. Eliseo is murdered in a gas chamber shortly after their arrival. Giosuè narrowly avoids being gassed himself as he hates to take baths and showers, and did not follow the other children when they had been ordered to enter the gas chambers and were told they were showers.\r\n\r\nIn the camp, Guido hides their true situation from his son. Guido explains to Giosuè that the camp is a complicated game in which he must perform the tasks Guido gives him. Each of the tasks will earn them points and whoever gets to one thousand points first will win a tank. He tells him that if he cries, complains that he wants his mother, or says that he is hungry, he will lose points, while quiet boys who hide from the camp guards earn extra points. Giosuè is at times reluctant to go along with the game, but Guido convinces him each time to continue. At one point Guido takes advantage of the appearance of visiting German officers and their families to show Giosuè that other children are hiding as part of the game, and he also takes advantage of a German nanny thinking Giosuè is one of her charges in order to feed him as Guido serves the German officers. Guido and Giosuè are almost found out to be prisoners by another server until Guido is found teaching all of the German children how to say \"Thank you\" in Italian.\r\n\r\nGuido maintains this story right until the end when, in the chaos of shutting down the camp as the Allied forces approach, he tells his son to stay in a box until everybody has left, this being the final task in the competition before the promised tank is his. Guido goes to find Dora, but he is caught by a German soldier. An officer makes the decision to murder Guido, who is led off by the soldier. While he is walking to his death, Guido passes by Giosuè one last time and winks, still in character and playing the game. Guido is then shot and left for dead in an alleyway. The next morning, Giosuè emerges from the sweat-box, just as a US Army unit led by a Sherman tank arrives and the camp is liberated. Giosuè is overjoyed about winning the game (unaware that his father is dead), thinking that he won the tank, and an American soldier allows Giosuè to ride on the tank. While traveling to safety, Giosuè soon spots Dora in the procession leaving the camp and reunites with his mother. While the young Giosuè excitedly tells his mother about how he had won a tank, just as his father had promised, the adult Giosuè, in an overheard monologue, reminisces on the sacrifices his father made for him and his story.', '2020110716290611a7cb0eadcf44d2aac1831c5355b96b.jpg', '0', '9', '0', '1997-12-20', '116', '2020-11-07 16:29:07');
INSERT INTO `film` VALUES ('15', 'Spirited Away', 'Ten-year-old Chihiro and her parents are traveling to their new home. They make a wrong turn and stop in front of a tunnel leading to what appears to be an abandoned village, which Chihiro\'s father insists on exploring despite his daughter\'s misgivings. They find a seemingly empty restaurant still stocked with food, which Chihiro\'s parents immediately begin to eat. While exploring further, Chihiro finds an exquisite bathhouse and meets a boy named Haku, who warns her to return across the riverbed before sunset. However, Chihiro discovers too late that her parents have metamorphosed into pigs, and she is unable to cross the now-flooded river.\r\n\r\nHaku finds Chihiro and advises her to ask for a job from the bathhouse\'s boiler-man, Kamaji. Kamaji asks Lin, a bathhouse worker, to send Chihiro to Yubaba, the witch who runs the bathhouse. Yubaba tries to frighten Chihiro away, but Chihiro persists, and Yubaba hires her. Yubaba takes away the second kanji of her name, Chihiro (千尋), renaming her Sen (千). Haku later warns her that if she forgets her name like he has forgotten his, she will not be able to leave the spirit world.\r\n\r\nSen is treated poorly by the other bathhouse workers; only Kamaji and Lin show sympathy for her. While working, she invites a silent creature named No-Face inside, believing him to be a customer. A \"stink spirit\" arrives as Sen\'s first customer, and she discovers he is the spirit of a polluted river. In gratitude for cleaning him, he gives Sen a magic emetic dumpling. Meanwhile, No-Face, imitating the gold left behind by the stink spirit, tempts a worker with gold and then swallows him. He demands food and begins tipping expensively. He swallows two more workers when they interfere with his conversation with Sen.\r\n\r\nSen sees paper Shikigami attacking a Japanese dragon and recognizes the dragon as Haku. When a grievously injured Haku crashes into Yubaba\'s penthouse, Sen follows him upstairs. A shikigami that stowed away on her back shapeshifts into Zeniba, Yubaba\'s twin sister. She transforms Yubaba\'s son, Boh, into a mouse and mutates Yubaba\'s harpy into a tiny bird. Zeniba tells Sen that Haku has stolen a magic golden seal from her, and warns Sen that it carries a deadly curse. Haku destroys the shikigami, eliminating Zeniba\'s manifestation. He falls into the boiler room with Sen, Boh, and the harpy, where Sen feeds him part of the dumpling, causing him to vomit both the seal and a black slug, which Sen crushes with her foot.\r\n\r\nWith Haku unconscious, Sen resolves to return the seal and apologize to Zeniba. Sen confronts No-Face, who is now massive, and feeds him the rest of the dumpling. No-Face follows Sen out of the bathhouse, regurgitating everything he has eaten. Sen, No-Face, Boh, and the harpy travel by train to meet Zeniba. Yubaba orders that Sen\'s parents be slaughtered, but Haku reveals that Boh is missing and offers to retrieve him if Yubaba releases Sen and her parents.\r\n\r\nZeniba reveals that Sen\'s love for Haku broke her curse and that Yubaba used the black slug to take control over Haku. Haku appears at Zeniba\'s home in his dragon form and flies Sen, Boh, and the harpy to the bathhouse. No-Face decides to remain with Zeniba. In mid-flight, Sen recalls falling years ago into the Kohaku River and being washed safely ashore, correctly guessing Haku\'s real identity as the spirit of the river.\r\n\r\nWhen they arrive at the bathhouse, Yubaba forces Sen to identify her parents from among a group of pigs in order to break their curse. After Sen answers correctly that none of the pigs are her parents, she is free to go. Haku takes her to the now-dry riverbed and vows to meet her again. Chihiro returns through the tunnel with her parents, who do not remember anything after eating at the restaurant stall. When they reach their car, they find it covered in dust and leaves, but drive off toward their new home.', '202011071631501dae37d10fbe4c2bb536b5e3c38a03a5.jpg', '0', '18', '0', '2001-07-20', '125', '2020-11-07 16:31:50');
INSERT INTO `film` VALUES ('16', 'Inception', 'Dominick \"Dom\" Cobb and Arthur are \"extractors\": they perform corporate espionage using experimental military technology to infiltrate their targets\' subconscious and extract information through a shared dream world. Their latest target, Saito, reveals he arranged their mission to test Cobb for a seemingly impossible job: implanting an idea in a person\'s subconscious, or \"inception\". Saito wants Cobb to convince Robert, the son of Saito\'s ailing competitor Maurice Fischer, to dissolve his father\'s company. In return, Saito promises to clear Cobb\'s criminal status, which prevents him from returning home to his children.\r\n\r\nCobb accepts the offer and assembles his team: Eames, an identity forger; Yusuf, a chemist with a sedative for the \"dream within a dream\" strategy; and Ariadne, an architecture student tasked with designing the dream\'s labyrinth, recruited through Cobb\'s father-in-law, Professor Stephen Miles. Ariadne discovers that Cobb\'s subconscious houses an invasive projection of his late wife, Mal. After Maurice dies, Robert accompanies the body on a ten-hour flight, where the team, including Saito, sedate him into a shared dream. At each dream level, the person generating the dream stays behind to set up a \"kick\" to awaken the other team members from the deeper dream, coordinated by the playing of song \"Non, je ne regrette rien\" as an auditory cue; these kicks must occur simultaneously, despite time flowing faster in each successive level.\r\n\r\nThe first level is Yusuf\'s dream of a rainy Los Angeles. The team abducts Robert, but are attacked by projections from his subconscious. Saito is wounded, and Cobb reveals that while dying in the dream would normally waken dreamers, the sedatives stabilizing the multi-level dream will instead send them into \"limbo\": a world of infinite subconscious in which dreamers risk forgetting they are in a dream. Eames impersonates Robert\'s godfather, Peter Browning, to suggest that Robert reconsider his father\'s will. Cobb tells Ariadne that he and Mal entered limbo while experimenting with the dream-sharing technology. Sedated for five hours of real time, they spent fifty years in a dream world. When Mal refused to return to reality, Cobb used a rudimentary form of inception by reactivating her totem, an object dreamers use to distinguish dreams from reality. After waking up, Mal still believed she was dreaming. Attempting to \"wake up\" for real, she committed suicide and framed Cobb for her death to force him to do the same. Cobb fled the U.S., leaving his children in Miles\' care. Yusuf drives the team in a van as they are sedated into the second level, a hotel dreamed by Arthur. Cobb persuades Robert that he has been kidnapped by Browning, and that Cobb is his subconscious protector, leading Robert into another level in a ruse to enter Robert\'s subconscious.\r\n\r\nThe team infiltrate the third level, a fortified mountain hospital dreamed by Eames, and hold off the guards as Saito takes Robert into the equivalent of his subconscious. Yusuf, pursued by Robert\'s projections in the first level, deliberately drives off a bridge, initiating his kick too soon. This causes an avalanche in Eames\' level, and removes gravity on Arthur\'s level, forcing Arthur to improvise a new kick synchronized with the van hitting the water. Mal\'s projection emerges in Eames\' level and kills Robert; Cobb kills Mal, and Saito succumbs to his wounds. Cobb and Ariadne enter limbo to rescue Robert and Saito, while Eames prepares a kick by rigging the hospital with explosives.\r\n\r\nCobb makes peace with his guilt over Mal\'s death. Ariadne kills Mal\'s projection and wakes Robert up with a kick. Revived at the third level, he discovers the planted idea: a projection of his dying father telling him to be his own man. While Cobb searches for Saito in limbo, the others ride the synchronized kicks back to reality. Cobb finds an aged Saito and reminds him of their agreement. The dreamers all awaken on the plane, and Saito makes a phone call.\r\n\r\nArriving at Los Angeles International Airport, Cobb passes the U.S. immigration checkpoint and Miles accompanies him to his home. Using Mal\'s totem—a top that spins indefinitely in a dream—to test if he is indeed in the real world, Cobb does not observe the result and instead joins his children.', '202011071633516c8df0393f054eb7b66c028e08c415cf.jpg', '0', '17', '0', '2010-07-16', '148', '2020-11-07 16:33:52');
INSERT INTO `film` VALUES ('17', 'Interstellar', 'In 2067,crop blights and dust storms threaten humanity\'s survival. Corn is the last viable crop. The world also regresses into a post-truth society where younger generations are taught false history, including the faking of the Apollo moon missions. Widowed engineer and former NASA pilot Joseph Cooper is now a farmer. Living with him are his father-in-law, Donald; his 15-year-old son, Tom Cooper, and 10-year-old daughter, Murphy \"Murph\" Cooper. After a dust storm, strange dust patterns inexplicably appear on Murphy\'s bedroom floor; she attributes the anomaly to a ghost. Cooper eventually deduces the patterns were caused by gravity variations and that they represent geographic coordinates in binary code. Cooper follows the coordinates to a secret NASA facility headed by Professor John Brand, Cooper\'s former supervisor. Professor Brand says gravitational anomalies have happened elsewhere. Forty-eight years earlier, unknown beings positioned a wormhole near Saturn, opening a path to a distant galaxy with twelve potentially habitable worlds located near a black hole named Gargantua. Twelve volunteers travelled through the wormhole to individually survey the planets. Astronauts Miller, Edmunds, and Mann reported positive results. Based on their data, Professor Brand conceived two plans to ensure humanity\'s survival. Plan A involves developing a gravitational propulsion theory to propel colonies into space, while Plan B involves launching the Endurance spacecraft carrying 5,000 frozen human embryos to colonize a habitable planet.\r\n\r\nCooper is recruited to pilot the Endurance. The crew includes scientists Dr. Amelia Brand (Professor Brand\'s daughter), Dr. Romilly, Dr. Doyle, and robots TARS and CASE. Before leaving, Cooper gives a distraught Murphy his wristwatch to compare their relative time for when he returns. After traversing the wormhole, Romilly studies the black hole while Cooper, Doyle, and Brand descend in a landing craft to investigate Miller\'s planet, an ocean world. After finding wreckage from Miller\'s ship, a gigantic tidal wave kills Doyle (because the gravitational pull on this planet was high) and delays the lander\'s departure. Due to the proximity of the black hole, time is severely dilated: as a result, 23 years have elapsed for Romilly on Endurance by the time Cooper and Brand return.\r\n\r\nEdmunds\' planet has slightly better telemetry, while Mann broadcasts positive data. Cooper decides to use their remaining fuel to reach Mann\'s planet, where they revive him from cryostasis. Meanwhile, Murph, now a scientist working with NASA, transmits a message announcing Professor Brand has died. She has learned that Plan A, which required unattainable data from within a black hole, was never viable. Plan B was always Professor Brand\'s only option. Murphy accuses Brand and Cooper of knowing that those left on Earth were doomed. Cooper subsequently declares that he will be returning to Earth while Brand and Romilly will remain on Mann\'s planet for permanent habitation as the planet is believed to be habitable. Cooper goes with Mann to explore and inspect the planet. Mann reveals to Cooper that the frozen planet is uninhabitable as he had sent falsified data in order to be rescued; Mann attempts to kill Cooper so that he can take the Endurance to \"complete the mission\" by going to Edmunds\' planet. He then takes a lander and heads for Endurance. Meanwhile, Romilly is killed by a booby trap left by Mann. Brand and Cooper race to the Endurance in another lander. Mann dies during a failed manual docking operation, severely damaging Endurance. After a difficult docking manoeuver, Cooper regains control of the damaged but functional Endurance.\r\n\r\n\r\nMiller\'s planet orbiting Gargantua\r\nWith insufficient fuel to reach Edmunds\' planet, they use a slingshot maneuver so close to Gargantua that time dilation adds another 51 years. In the process, Cooper and TARS jettison themselves to shed weight and propel Endurance using Newton\'s third law to ensure Endurance reaches Edmunds\' planet. Slipping through the event horizon of Gargantua, they eject from their respective craft and find themselves inside a massive tesseract, constructed by future humans. Across different time periods, Cooper can see through the bookcases of Murphy\'s old room on Earth and weakly interact with its gravity. Cooper realizes he was Murphy\'s \"ghost\" and manipulates the second hand of the wristwatch he gave her, using Morse code to transmit the quantum data that TARS collected from inside the event horizon. Cooper and TARS are ejected from the tesseract. Cooper is picked up and awakens on a space habitat orbiting Saturn, where he reunites with an elderly Murphy. Using the quantum data sent by Cooper, the younger Murphy had solved the gravitational propulsion theory for Plan A, enabling humanity\'s exodus and survival. Nearing death and with her own family, Murphy urges Cooper to return to Amelia, telling him that \"no parent should have to watch their own child die.\" Cooper and TARS take a spacecraft to rejoin Amelia and CASE on Edmunds\' habitable planet.', '20201107163554d53b0827278c47d78e38d7e040575620.jpg', '0', '12', '0', '2014-11-07', '169', '2020-11-07 16:35:54');
INSERT INTO `film` VALUES ('18', 'WALL·E', 'In the 29th century, rampant consumerism and environmental neglect have turned Earth into a garbage-strewn wasteland; humanity is nowhere to be found and has been evacuated by the megacorporation Buy-N-Large (BnL) on giant starliners seven centuries earlier. Of all the robotic trash compactors left by BnL to clean up, only one remains operational: a Waste Allocation Load-Lifter: Earth Class named WALL-E. One day, WALL-E\'s routine of compressing trash and collecting interesting objects is broken by the arrival of an unmanned probe carrying an Extraterrestrial Vegetation Evaluator named EVE, sent to scan the planet for human-sustainable life. WALL-E is smitten by the sleek, otherworldly robot; and the two begin to connect until EVE goes into standby when WALL-E shows her his most recent find: a living seedling. The probe then collects EVE and the plant, and—with WALL-E clinging on—returns to its mothership, the starliner Axiom.\r\n\r\nIn the centuries since the Axiom left Earth, its passengers have degenerated into helpless corpulence due to laziness and microgravity, their every whim catered to by machinery; even the captain, one B. McCrea, is used to sitting back while his robotic lieutenant and steering wheel AUTO flies the ship. McCrea is taken aback by a positive probe response and learns that placing the plant in the ship\'s Holo-Detector will trigger a hyperjump back to Earth so humanity can begin recolonization. Upon inspecting EVE\'s storage compartment, however, the plant turns up missing, and EVE blames WALL-E for its disappearance.\r\n\r\nWith the plant missing, EVE is deemed faulty and taken to Diagnostics. Mistaking the process for torture, WALL-E shuts all of Diagnostics down, causing him and EVE to be designated as rogues. Frustrated, EVE tries to send WALL-E home on an escape pod, but they are interrupted when AUTO\'s first mate GO-4 arrives and stows the stolen plant in a pod set to self-destruct. WALL-E saves the plant from being lost for good, and he and EVE reconcile and celebrate with a \"dance in space\" around the Axiom.\r\n\r\nEVE brings the plant back to McCrea, who watches EVE\'s recordings of Earth and concludes that they have to go back. However, AUTO is revealed to be loyal only to his own secret no-return directive A113—issued after BnL inaccurately concluded centuries ago that the planet could not be saved—even when McCrea countermands it; AUTO mutinies with GO-4 as a result, electrocuting and frying WALL-E\'s circuit board, putting EVE into standby, throwing them both down the garbage chute, and locking McCrea in his quarters. EVE and WALL-E are nearly ejected into space along with the ship\'s trash but are saved by the cleaning robot \"Microbe Obliterator\" named M-O, who has been following WALL-E\'s dirt trail across the ship. As humans and robots help in securing the plant, McCrea and AUTO fight for control, resulting in GO-4 being obliterated and WALL-E being crushed in the Holo-Detector when the latter tries to keep it open; McCrea eventually overpowers and deactivates AUTO, and the plant is inserted into the Holo-Detector, initiating the hyperjump.\r\n\r\nArriving back on Earth, EVE repairs WALL-E but finds that his memory has been reset and his personality is gone. Heartbroken, EVE gives WALL-E a farewell kiss, which sparks his memory and restores his original personality. WALL-E and EVE reunite as the inhabitants of the Axiom take their first steps on Earth. During the credits, humans and robots turn the ravaged planet into a paradise, and the plant is shown to have grown into a mighty tree.', '2020110716375511b8ec98f4b645a082d48bbf2d099676.jpg', '0', '15', '0', '2008-06-27', '98', '2020-11-07 16:37:56');
INSERT INTO `film` VALUES ('19', 'Zootopia', 'In a world of anthropomorphic mammals, rabbit Judy Hopps from rural Bunnyburrow fulfills her childhood dream of becoming a police officer in urban Zootopia. Despite being the academy valedictorian, Judy is delegated to parking duty by Chief Bogo, who doubts her potential because she is a rabbit. On her first day, she is hustled by a con artist fox duo, Nick Wilde and Finnick.\r\n\r\nJudy abandons parking duty to arrest Duke Weaselton, a weasel who stole a bag of crocus bulbs known as Midnicampum holicithias. Bogo reprimands her, but an otter, Mrs. Otterton, enters Bogo\'s office pleading for someone to find her husband Emmitt, one of fourteen predators who are missing. When Judy volunteers and Assistant Mayor Dawn Bellwether praises the assignment, Bogo has no choice but to give Judy the case, stipulating she has 48 hours to find Emmitt Otterton and that she must resign if she fails.\r\n\r\nJudy blackmails Nick into assisting her by covertly recording his confession to tax evasion, having ascertained from photo evidence that Nick was the last to see Emmitt. They track Emmitt to a limousine owned by crime boss Mr. Big, who reveals Emmitt went \"savage\"—reverted to a feral state—and attacked his chauffeur Manchas. At his home, Manchas mentions Emmitt yelled about \"Night Howlers\" before the attack. Then Manchas himself turns savage and chases the pair. Judy saves Nick by trapping Manchas, and calls the ZPD for help. When help arrives, Manchas has vanished. Bogo demands Judy turn in her badge, but Nick reminds Bogo that Judy still has 10 hours to solve the case.\r\n\r\nAt City Hall, Bellwether offers Judy and Nick access to the city\'s traffic cameras. They discover Manchas was captured by wolves, whom Judy surmises are the \"Night Howlers\". They locate the missing predators—all gone savage—imprisoned at Cliffside Asylum, where Mayor Leodore Lionheart hides them from the public while trying to determine the cause of their behavior. Lionheart and the asylum staff are arrested for false imprisonment and Bellwether becomes the new mayor.\r\n\r\nJudy, praised for solving the case, has become friends with Nick and asks him to join the ZPD as her partner. However, she upsets him at a press conference by blaming predatory biology for the recent savage behavior, resulting in him to angrily reject her offer; her comments also incite hateful speech and discrimination against predators throughout Zootopia. Wracked with guilt, Judy quits her job and returns to Bunnyburrow.\r\n\r\nBack home, Judy learns the Night Howlers are actually the crocus bulbs Weaselton stole, and they contain a neurotoxin that has severe psychotropic effects on mammals. After returning to Zootopia and tearfully reconciling with Nick, the duo confront Weaselton, who, with persuasion from Mr. Big, tells them the bulbs he stole were for a ram named Doug. They find Doug in a laboratory hidden in the city subway, developing a drug made from Night Howlers, which he has been shooting at predators with a dart gun.\r\n\r\nJudy and Nick obtain the serum as evidence, but before they can reach the ZPD, Bellwether confronts them in the Natural History Museum and takes the evidence, revealing herself as the mastermind behind a prey-supremacist conspiracy to frame predators as dangerous and savage. Bellwether traps them in an exhibition after Nick refuses to abandon an injured Judy. She shoots a serum pellet at Nick to make him attack Judy, and summons the ZPD for help. But Judy and Nick have replaced the serum pellets in Bellwether\'s gun with blueberries. Enraged, Bellwether threatens to frame the pair for the attacks before discovering that Judy baited her into openly declaring her role in the attacks and recorded the confession, just as Bogo and his fellow officers arrive on the scene.\r\n\r\nBellwether and her accomplices are arrested for their crimes, while Lionheart publicly denies knowledge of her plot and states that his imprisonment of the infected predators was a \"wrong thing for the right reason\". With the cause of the epidemic identified, the predators are cured and Judy rejoins the ZPD. Nick graduates from the Zootopia Police Academy as the city\'s first fox police officer and becomes Judy\'s partner.', '202011071639189f7adc56c89b40149aa7f5017af3070b.jpg', '3', '139', '2', '2016-03-04', '108', '2020-11-07 16:39:19');
INSERT INTO `film` VALUES ('20', 'Up', 'Renowned explorer Charles F. Muntz says he has found a new species of giant bird at Paradise Falls, South America. However, archaeologists study the skeleton of the bird and conclude that Muntz fabricated it. Disgraced, Muntz vows to bring back a live specimen and will not return until he does so.\r\n\r\nYoungster Carl Fredricksen meets Ellie. Both are aspiring explorers who idolize Muntz, and the two quickly become friends. Ellie reveals her dream to Carl about going to live by Paradise Falls. The two eventually get married and repeatedly save up for a trip to Paradise Falls, but always end up spending the money on more pressing needs. As an elderly man, Carl finally buys tickets for the trip, but Ellie falls ill and dies before they can go.\r\n\r\nCarl continues living in the house he and Ellie fixed up, stubbornly holding out while the neighborhood around him is replaced by skyscrapers. When he unintentionally injures a construction worker, the developer trying to buy his place seizes the opportunity. The court deems him a public menace and orders him to move to a retirement home. However, Carl resolves to keep his promise to Ellie. Having worked his entire life as a balloon salesman, he turns his house into a makeshift airship by attaching hundreds of helium balloons to it and flies away.\r\n\r\nRussell, a young Wilderness Explorer trying to earn his final merit badge for \"Assisting the Elderly\", becomes an accidental stowaway. Before Carl can drop Russell off, a cumulonimbus storm drives them all the way to South America. The house lands on a tepui opposite Paradise Falls. Carl and Russell harness themselves to the still-buoyant house and begin to walk it across the mesa, hoping to reach the falls before the balloons deflate. Russell encounters a tall colorful bird whom he names \"Kevin\", who is trying to gather food for her chicks. They then meet a Golden Retriever named Dug, who wears a special collar that allows him to speak, and who vows to take the bird to his master. The next day, they encounter a pack of aggressive dogs (also with special collars) led by Alpha, a Doberman Pinscher, and are taken to their master, the elderly Muntz.\r\n\r\nMuntz invites Carl and Russell aboard his dirigible, where he explains to them that he is still searching for the giant bird he promised to bring back. Russell notes the bird\'s similarity to Kevin and Muntz becomes hostile, thinking they are attempting to capture the bird for themselves—he implies he has killed other visitors he suspected of doing the same thing. Carl and Russell flee with Kevin and Dug, but Kevin is injured in the process. Using the tracking device on Dug\'s collar, Muntz finds and captures Kevin, then sets fire to Carl\'s house, which pops many of the balloons. Carl is forced to decide whether to save his house or Kevin; he chooses his house, upsetting Russell. Carl finally parks the house at Paradise Falls, where Carl sadly looks through Ellie\'s childhood scrapbook and finds a final note thanking him for their \"adventure\" and encouraging him to have a new one.\r\n\r\nReinvigorated, Carl goes outside, only to see Russell flying away, using some balloons and a leaf blower, to try to rescue Kevin. Carl lightens the house enough for him and Dug to follow. Muntz captures Russell, but Carl and Dug board the dirigible and free both Russell and Kevin. Muntz pursues them around the airship and corners Kevin, Dug, and Russell inside Carl\'s house. They escape by jumping back onto the dirigible after Carl lures Kevin with chocolate; Muntz leaps after them, but gets caught on some balloon lines and falls to the ground far below. The house, having lost too many balloons, descends out of sight through the clouds.\r\n\r\nCarl and Russell reunite Kevin with her chicks and fly the dirigible back home. Russell receives his \"Assisting the Elderly\" badge and Carl gives him a bottle cap from a grape soda called \"The Ellie Badge\", the same one given to him by Ellie during his first encounter with her when they were children. Carl then becomes a grandpa-like figure to Russell. Unbeknownst to Carl, his house lands on the cliff beside Paradise Falls, fulfilling his promise to Ellie.', '20201107164130ff4421cf309a43de8afa1e9e2a077908.jpg', '0', '12', '0', '2009-05-09', '96', '2020-11-07 16:41:30');
INSERT INTO `film` VALUES ('22', 'Jaws', 'During a beach party at dusk on Amity Island, a young woman, Chrissie Watkins, goes skinny dipping in the ocean. While treading water, she is violently pulled under. The next day, her partial remains are found on shore. The medical examiner\'s ruling that the death was due to a shark attack leads police chief Martin Brody to close the beaches. Mayor Larry Vaughn overrules him, fearing that the town\'s summer economy will be ruined and points out that the town has never had trouble with sharks. The coroner now concurs with the mayor\'s theory that Chrissie was killed in a boating accident. Brody reluctantly accepts their conclusion until the shark kills both a pet dog and a young boy, Alex Kintner, in full daylight on a crowded beach. A bounty is placed on the shark, prompting an amateur shark-hunting frenzy. Local professional shark hunter Quint offers his services for $10,000. Meanwhile, consulting oceanographer Matt Hooper examines Chrissie\'s remains, and confirms her death was caused by a shark—an unusually large one.\r\n\r\nWhen local fishermen catch a tiger shark, the mayor proclaims that the beach is safe. Mrs. Kintner, Alex’s mother, openly blames Brody for her son’s death; leaving him guilt-ridden. Hooper disputes that it is the same predator, confirming this after no human remains are found inside it. Hooper and Brody find a half-sunken vessel while searching the night waters in Hooper\'s boat. Underwater, Hooper retrieves a sizable great white shark\'s tooth embedded in the submerged hull. He drops it in fright after encountering the partial corpse of local fisherman Ben Gardner. Vaughn discounts Brody and Hooper\'s statements that a huge great white shark is responsible for the deaths, and refuses to close the beaches, allowing only added safety precautions. On the Fourth of July weekend, tourists pack the beaches. Following a juvenile prank in which the presence of a shark is simulated, the real shark enters a nearby estuary, killing a boater and causing Brody\'s oldest son, Michael, to go into shock. Brody then convinces a guilt-ridden Vaughn to hire Quint.\r\n\r\nQuint, Brody, and Hooper set out on Quint\'s boat, the Orca, to hunt the shark. While Brody lays down a chum line, Quint waits for an opportunity to hook the shark. Without warning, it appears behind the boat. Quint, estimating its length at 25 feet (7.6 m) and weight at 3 tonnes (3.0 long tons; 3.3 short tons), harpoons it with a line attached to a flotation barrel, but the shark pulls the barrel underwater and disappears.\r\n\r\nAt nightfall, Quint and Hooper drunkenly exchange stories about their assorted scars, and Quint reveals that he survived the USS Indianapolis. The shark returns unexpectedly, ramming the boat\'s hull, and disabling the power. The men work through the night, repairing the engine. In the morning, Brody attempts to call the Coast Guard, but Quint, who has become obsessed with killing the shark without outside assistance, smashes the radio. After a long chase, Quint harpoons another barrel into the shark. The line is tied to the stern cleats, but the shark drags the boat backward, swamping the deck and flooding the engine compartment. Quint prepares to sever the line to prevent the transom from being pulled out but the cleats break off, keeping the barrels attached to the shark. Quint heads toward shore to draw the shark into shallower waters, but he pushes the damaged engine past the safety limits and the overtaxed engine fails.\r\n\r\nWith the Orca slowly sinking, the trio attempt a riskier approach. Hooper puts on scuba gear and enters the water in a shark-proof cage, intending to lethally inject the shark with strychnine, using a hypodermic spear. The shark attacks the cage, causing Hooper to drop the spear, which sinks and is lost. While the shark thrashes in the tangled remains of the cage, Hooper manages to escape to the seabed. The shark escapes and leaps onto the deck of the sinking boat. Quint then slips down the deck and is devoured by the shark. Trapped on the sinking vessel, Brody jams a pressurized scuba tank into the shark\'s mouth, and, climbing the crow\'s nest, shoots the tank with Quint\'s rifle. The resulting explosion obliterates the shark. Hooper surfaces, and he and Brody paddle back to Amity Island clinging to the remaining barrels.', '20201114152603d113b55aef9b48a086afac91f9578798.jpg', '3', '14', '2', '1975-06-20', '124', '2020-11-14 15:26:04');
INSERT INTO `film` VALUES ('26', 'The Elephant Man', 'Frederick Treves, a surgeon at the London Hospital, finds Joseph Merrick in a Victorian freak show in London\'s East End, where he is kept by Mr. Bytes, a greedy, sadistic, psychopathic, despicable, violent and heartless ringmaster. His head is kept hooded, and his \"owner\", who views him as intellectually disabled, is paid by Treves to bring him to the hospital for examination. Treves presents Merrick to his colleagues and highlights his monstrous skull, which forces him to sleep with his head on his knees, since if he were to lie down, he would asphyxiate. On Merrick\'s return, he is beaten so badly by Bytes that he has to call Treves for medical help. Treves brings him back to the hospital.\r\n\r\nMerrick is tended to by Mrs. Mothershead, the formidable matron, as the other nurses are too frightened of him. Mr. Carr Gomm, the hospital\'s Governor, is against housing Merrick, as the hospital does not accept \"incurables\". To prove that Merrick can make progress, Treves trains him to say a few conversational sentences. Carr Gomm sees through this ruse, but as he is leaving, Merrick begins to recite the 23rd Psalm, and continues past the part of the Psalm that Treves taught him. Merrick tells the doctors that he knows how to read, and has memorized the 23rd Psalm because it is his favourite. Carr Gomm permits him to stay, and Merrick spends his time practising conversation with Treves and building a model of a cathedral he sees from his window.\r\n\r\nMerrick has tea with Treves and his wife, and is so overwhelmed by their kindness, he shows them his mother\'s picture. He believes he must have been a \"disappointment\" to his mother, but hopes she would be proud to see him with his \"lovely friends\". Merrick begins to take guests in his rooms, including the actress Madge Kendal, who introduces him to the work of Shakespeare. Merrick quickly becomes an object of curiosity to high society, and Mrs. Mothershead expresses concerns that he is still being put on display as a freak. Treves begins to question the morality of his actions. Meanwhile, a night porter named Jim starts selling tickets to locals, who come at night to gawk at the \"Elephant Man\".\r\n\r\nThe issue of Merrick\'s residence is challenged at a hospital council meeting, but he is guaranteed permanent residence by command of the hospital\'s royal patron, Queen Victoria, who sends word with her daughter-in-law Alexandra. However, Merrick is soon kidnapped by Bytes during one of Jim\'s raucous late-night showings. Bytes leaves England and takes Merrick on the road as a circus attraction once again. A witness reports to Treves who confronts Jim about what he has done, and Mothershead fires him.\r\n\r\nMerrick is forced to be an \"attraction\" again, but during a \"show\" in Belgium, Merrick, who is weak and dying, collapses, causing a drunken Bytes to lock him in a cage and leave him to die. Merrick manages to escape from Bytes with the help of his fellow freakshow attractions. Upon returning to London, he is harassed through Liverpool Street station by several young boys and accidentally knocks down a young girl. Merrick is chased, unmasked, and cornered by an angry mob. He cries, \"I am not an elephant! I am not an animal! I am a human being! I ... am ... a ... man!\" before collapsing. Policemen return Merrick to the hospital and Treves. He recovers some of his health, but is dying of chronic obstructive pulmonary disease. Treves and Mothershead take Merrick to see one of Mrs Kendal\'s shows at the theatre, and Kendal dedicates the performance to him. A proud Merrick receives a standing ovation from the audience.\r\n\r\nBack at the hospital, Merrick thanks Treves for all he has done, and completes his church model. He lies down on his back in bed, imitating a sleeping child in a picture on his wall, and dies in his sleep. Merrick is consoled by a vision of his mother, who quotes Lord Tennyson\'s \"Nothing Will Die\".', '202011160925317476589c6e974310a4f8c1960e5c7da3.jpg', '4', '15', '3', '1980-10-10', '124', '2020-11-16 09:25:31');
INSERT INTO `film` VALUES ('27', 'Dune', 'In the far future, the known universe is ruled by Padishah Emperor Shaddam IV. The most important substance in the empire is the drug known as melange or \"spice\", which can extend life and expand consciousness. The most profitable and important of its properties is its ability to assist the Spacing Guild with folding space, allowing safe, instantaneous interstellar travel. The Guild fears a conspiracy that could jeopardize spice production and sends an emissary to demand an explanation from the Emperor, who confidentially shares his plans to destroy House Atreides. The popularity of Duke Leto Atreides has grown through the empire, and he is suspected to be amassing a secret army, which Emperor Shaddam sees as a potential threat to his rule. Shaddam\'s plan is to give House Atreides control of the planet Arrakis (also known as Dune), the only source of spice. Once they are installed on Arrakis, he intends to have them ambushed by their longtime archenemies, the Harkonnens, with assistance from the Emperor\'s elite troops, the Sardaukar. The Guild Navigator commands the Emperor to kill Duke Leto\'s son, Paul Atreides, a young man who dreams prophetic visions of his purpose. The execution order draws the attention of the Bene Gesserit sisterhood, as Paul is tied to their centuries-long breeding program to produce a superbeing, the Kwisatz Haderach. Before Paul leaves for Arrakis, he is tested by the Bene Gesserit Reverend Mother Mohiam by being forced to place his hand in a box which induces excruciating pain. To Mohiam\'s surprise and eventual satisfaction, he passes the test.\r\n\r\nMeanwhile, on the industrial world of Giedi Prime, the sadistic Baron Vladimir Harkonnen tells his nephews Glossu Rabban and Feyd-Rautha about his plan to eliminate the Atreides by manipulating someone in House Atreides into betraying the Duke. The Atreides leave their homeworld Caladan for Arrakis, a barren desert planet populated by gigantic sandworms. The native people of Arrakis are called the Fremen, a mysterious people who have long held a prophecy that a messiah will lead them to freedom. Upon arrival on Arrakis, Duke Leto is informed by one of his right-hand men, Duncan Idaho, that the Fremen have been underestimated. There are in fact large numbers of them and they could prove to be powerful allies. Duke Leto begins to gain the trust of the Fremen, but before an alliance can be established, the Harkonnens launch their attack. The Harkonnens\' traitor within House Atreides, Dr. Wellington Yueh, Leto\'s personal physician, disables critical shields and destroys sonic weapons, leaving House Atreides nearly defenseless. In the attack, Idaho is killed, Leto is captured, and nearly all of House Atreides is wiped out. While captured, Leto dies in a failed attempt to assassinate the Baron Harkonnen using a poison gas capsule planted in his tooth by Dr. Yueh. Leto\'s concubine Lady Jessica and his son Paul survive the attack and escape into the deep desert, where they are taken in by a sietch of Fremen. Paul takes on the Fremen name Muad\'Dib, and emerges as the leader for whom the Fremen have been waiting. He teaches the Fremen to build and use Weirding Modules—sonic weapons developed by House Atreides—and begins to target spice mining production. He also falls in love with Chani, the young Fremen warrier he encountered when he first arrived among the Fremen, while Jessica becomes the Fremen reverend mother.\r\n\r\nOver the next two years, spice production is effectively halted, and Paul is reunited with Gurney Halleck, one of his father\'s senior aides, both of whom thought the other dead. The Spacing Guild warns the Emperor of the deteriorating situation on Arrakis, and they fear that Paul will consume the Water of Life, a powerful poison used by the Bene Gesserit to help induce their abilities. The meeting is revealed to Paul in a prophetic dream, but then the dreams suddenly stop. Shaken by the absence of his visions, he goes out into the desert with Chani, drinks the Water of Life and enters into a trance. Upon awakening, he is transformed, obtaining powerful psychic abilities and the ability to control the sandworms. Paul also regains his ability to see into space and the future, and learns the Emperor is amassing a huge invasion fleet above Arrakis to wipe out the Fremen and regain control of the planet. As the Emperor arrives at Arrakis, Paul launches a final attack against the Harkonnens and the Emperor\'s Sardaukar at the capital city of Arrakeen. Riding in on sandworms and brandishing their sonic weapons, his Fremen warriors easily defeat the Emperor\'s legions, while Paul\'s sister Alia kills Baron Harkonnen. Once in Arrakeen, Paul faces the defeated Emperor and engages Feyd-Rautha in a duel to the death. After killing Feyd, Paul demonstrates his newfound powers and fulfills the Fremen prophecy by causing rain to fall on Arrakis, and Alia declares him to be the Kwisatz Haderach.', '202011160930550d4bd374fc64470b98c2faa3ee5ba7f6.jpg', '3', '15', '3', '1984-12-01', '137', '2020-11-16 09:30:56');
INSERT INTO `film` VALUES ('28', 'Blue Velvet', 'College student Jeffrey Beaumont returns home to Lumberton, North Carolina, after his father suffers a near-fatal stroke. Walking home from the hospital, he cuts through a vacant lot and discovers a severed human ear. Jeffrey takes the ear to police detective John Williams and becomes reacquainted with his daughter, Sandy, who tells him that the ear somehow relates to a lounge singer named Dorothy Vallens. Intrigued, Jeffrey enters Dorothy\'s apartment by posing as an exterminator and steals a spare key while she is distracted by a man in a distinctive yellow sport coat whom Jeffrey nicknames the \"Yellow Man\".\r\n\r\nJeffrey and Sandy attend Dorothy\'s nightclub act, in which she sings \"Blue Velvet\", and leave early so Jeffrey can case her apartment. When Dorothy returns home, she finds him hiding in a closet and fellates him after forcing him to undress at knifepoint. Jeffrey retreats to the closet when their encounter is interrupted by the arrival of Frank Booth, who beats Dorothy and subjects her to fisting, dry humping, humiliation and sexual roleplay.\r\n\r\nAfter learning that Frank has abducted Dorothy\'s husband and child to force her into sex slavery, Jeffrey suspects Frank cut off her husband\'s ear to warn her to stay alive for her family\'s sake. Jeffrey relays the experience to Sandy—without revealing his sexual encounter with Dorothy—who urges him to tell her father what he knows about the case. Jeffrey refuses since he does not want to land Sandy or himself in trouble; he also fears what Frank, a gangster and raging psychopath, might do.\r\n\r\nWhile he keeps seeing Sandy, Jeffrey also starts a sadomasochistic sexual relationship in which Dorothy encourages him to beat her. Jeffrey sees Frank attending Dorothy\'s show and later observes him drug dealing and meeting with the Yellow Man.\r\n\r\nWhen Frank catches Jeffrey leaving Dorothy\'s apartment, he abducts them and brings them to the lair of Ben, a criminal associate who is holding Dorothy\'s husband and son hostage. Frank permits Dorothy to see her family and forces Jeffrey to watch Ben perform an impromptu lip-sync of Roy Orbison\'s \"In Dreams\", which causes Frank to suffer a breakdown. Afterwards he takes Jeffrey to a field, where he violently kisses him before beating him unconscious. Jeffrey awakes the next morning bruised and bloodied.\r\n\r\nJeffrey visits the police station and realizes that Sandy\'s father\'s partner is the Yellow Man, who has been murdering Frank\'s rival drug dealers and stealing confiscated narcotics from the evidence room for Frank to sell. After Jeffrey and Sandy attend a party, they are pursued by a car which they assume belongs to Frank. As they arrive at Jeffrey\'s home, Sandy realizes the car belongs to her boyfriend Mike. After Mike threatens to beat Jeffrey for stealing his girlfriend, Dorothy appears on Jeffrey\'s porch naked, beaten and confused. Mike backs down as Jeffrey and Sandy whisk Dorothy to Sandy\'s house to summon medical attention.\r\n\r\nWhen Dorothy calls Jeffrey \"my secret lover\", Sandy is distraught and slaps him for deceiving her. Jeffrey asks Sandy to tell her father everything and returns alone to Dorothy\'s apartment, where he discovers her husband dead and the Yellow Man mortally wounded. Remembering that Frank has a police radio in his car, Jeffrey uses the Yellow Man\'s walkie-talkie to lie about his precise location in the apartment, saying he\'s in the bedroom, and instead hides in the living room closet. When Frank arrives, Jeffrey ambushes and shoots him dead with the Yellow Man\'s gun.\r\n\r\nSandy\'s father leads a police raid on Frank\'s headquarters, killing his men and crippling his criminal empire. Jeffrey and Sandy continue their relationship and Dorothy is reunited with her son.', '20201116093532215fd19b2256400e9199a242dd73ddf1.jpg', '3', '34', '3', '1986-09-19', '120', '2020-11-16 09:35:33');
INSERT INTO `film` VALUES ('29', 'Wild at Heart', 'Lovers Lula and Sailor are separated after he is jailed for killing a man who attacked him with a knife; the assailant, Bobby Ray Lemon, was hired by Lula\'s mother, Marietta Fortune. Upon Sailor\'s release, Lula picks him up outside prison, where she hands him his snakeskin jacket. They go to a hotel where she reserved a room, make love and go to see the speed metal band Powermad. At the club, Sailor gets into a fight with a man who flirts with Lula, and then leads the band in a rendition of the Elvis Presley song \"Love Me\". Later, back in their hotel room, after making love again, Sailor and Lula finally decide to run away to California, breaking Sailor\'s parole. Marietta arranges for private detective Johnnie Farragut — her on-off boyfriend — to find them and bring them back. But unbeknownst to Farragut, Marietta also hires gangster Marcello Santos to track them and kill Sailor. Santos\'s minions capture and kill Farragut, sending Marietta into a guilt-fueled psychosis.\r\n\r\nUnaware of all of the events happening back in North Carolina, Lula and Sailor continue on their way until — according to Lula — they witness a bad omen: the aftermath of a two-car accident, and the only survivor, a young woman, dying in front of them. With little money left, Sailor heads for Big Tuna, Texas, where he contacts \'old friend\' Perdita Durango, who might be able to help them, although she secretly knows he is under contract to be killed by Lula\'s mother. While Sailor agrees to join up with gangster Bobby Peru in a feed store robbery, Lula waits for him in the hotel room, trying to conceal that she is pregnant with Sailor\'s child. While Sailor is out, Peru enters the room and threatens to sexually assault Lula, forcing her to ask him to have sex with her, before leaving, stating he has no time. This traumatizes Lula, who was raped as a child.\r\n\r\nThe robbery goes spectacularly wrong when Peru unnecessarily shoots the two clerks. Peru then admits to Sailor that he has been hired to kill him, and Sailor realizes he has been given a pistol with dummy ammunition. Chasing Sailor out of the store, Peru is about to kill him when the sheriff\'s deputy opens fire on him and Peru accidentally blows his own head off with his own shotgun. Sailor is arrested and sentenced to six years in prison.\r\n\r\nWhile Sailor is in jail, Lula has their child. Upon his release, Lula decides to reunite with him. Rejecting her mother\'s objections over the phone, she throws water over her mother\'s photograph and goes to pick up Sailor with their son. When they meet Sailor, he reveals he will be leaving them both, having decided whilst in prison that he is not good enough for them. While he is walking a short distance away, Sailor encounters a gang who surround him. He insults them, and they quickly knock him out. While unconscious, he sees a vision in the form of Glinda the Good Witch, who tells him, \'Don\'t turn away from love, Sailor.\' When he awakens, Sailor apologizes to the men, tells them he realizes the error of his ways, and then runs after Lula. The photograph of Marietta, in Lula\'s house, sizzles and vanishes. As there is a traffic jam on the road, Sailor begins to run over the roofs and hoods of the cars to get back to Lula and their child in the car. Sailor sings \"Love Me Tender\" to Lula, having earlier said that he would only sing that song to his wife.', '2020111609492305f14f0aae6e411d883e299052e5684a.jpg', '2', '16', '3', '1990-08-17', '125', '2020-11-16 09:49:24');
INSERT INTO `film` VALUES ('30', 'Twin Peaks: Fire Walk with Me', 'FBI Regional Bureau Chief Gordon Cole sends agents Chester Desmond and Sam Stanley to investigate the murder of teenage drifter and prostitute Teresa Banks in the town of Deer Meadow, Washington. The pair are informed about their new assignment through a woman named Lil, who wears an artificial blue rose on her lapel. Desmond and Stanley view Teresa\'s body at a morgue. They notice that a ring is missing from her finger and a small piece of paper with the letter \"T\" printed on it has been inserted under one of her fingernails. The agents arrange for Teresa\'s body to be taken to Portland. Later, Desmond finds Teresa\'s missing ring under a trailer. As he reaches out to it, he is taken by an unseen force.\r\n\r\nAt FBI headquarters in Philadelphia, Cole and Agents Dale Cooper and Albert Rosenfield experience a brief vision of their long-lost colleague Agent Phillip Jeffries. He tells them about a meeting he witnessed involving several mysterious spirits—The Man from Another Place, Killer BOB, Mrs. Chalfont and her grandson. Agent Cooper is sent to Deer Meadow to investigate Desmond\'s disappearance, but finds no answers.\r\n\r\nOne year later in Twin Peaks, high school homecoming queen Laura Palmer and her best friend Donna Hayward attend school. Laura is addicted to cocaine and is cheating on her boyfriend Bobby Briggs with biker James Hurley. Laura discovers that pages are missing from her secret diary, and gives the rest of the diary to her agoraphobic friend Harold Smith.\r\n\r\nMrs. Chalfont and her grandson appear to Laura. They warn her that the \"man behind the mask\" is in her bedroom. Laura runs home, where she sees BOB. She rushes outside in terror and sees her father, Leland, emerge from the house. That evening, Leland\'s behavior is erratic and abusive — he accusingly asks Laura about her romances, then tells her he loves her. She has a dream about entering the Black Lodge. Cooper and the Man from Another Place appear in her dream. The Man from Another Place identifies himself as MIKE\'s severed arm, and offers Teresa\'s ring to Laura, but Cooper tells her not to take it. Laura sees Annie Blackburn next to her in bed, covered in blood. Annie tells Laura to write in her diary that \"the good Dale is in the Lodge and cannot leave\". Laura sees the ring in her hand, but when she wakes up, it is gone.\r\n\r\nLaura goes to the Roadhouse to meet her drug connections and have sex with men, where she is joined by Donna. Laura discusses Teresa Banks\'s murder with Ronette Pulaski. When she sees a drugged and topless Donna making out with a stranger, Laura takes her home and begs Donna not to become like her. The next morning, Philip Gerard, the one-armed man possessed by the repentant demon MIKE, in an attempt to warn Laura about her father and BOB, pulls up alongside Leland\'s car and shows Teresa\'s ring to Laura. Leland recalls his affair with Teresa. He had asked Teresa to set up a foursome with some of her friends, but fled after discovering Laura was among them. Teresa realized who he was and plotted to blackmail him, and he killed her.\r\n\r\nOne night, BOB comes through Laura\'s window and begins to rape her, only to transform into Leland. Upset, Laura begins using more cocaine. Bobby breaks up with Laura, and she then ends her relationship with James and goes to a cabin in the woods for an orgy with Ronette, Jacques Renault and Leo Johnson. Leland follows her there and beats Jacques unconscious. Leo flees and Leland takes Laura and Ronette to an abandoned train car. Laura asks Leland if he is going to kill her, and he transforms into BOB, and tells her that he intends to possess her. BOB beats Ronette unconscious. MIKE, who tracked the BOB-possessed Leland to the train, rescues Ronette and throws Teresa\'s ring into the train car. Laura puts it on, which prevents BOB from possessing her. Enraged, BOB stabs Laura to death. The BOB-possessed Leland places Laura\'s body in the lake.\r\n\r\nAs Laura\'s corpse drifts away, the BOB-possessed Leland enters the Red Room, where he encounters MIKE and the Man from Another Place who demand their share of \"garmonbozia (pain and sorrow).\"\r\n\r\nAs Laura\'s body is found by the Sheriff\'s department, Agent Cooper comforts her spirit in the Lodge. When Laura sees an angel that had previously disappeared from her bedroom painting, she begins to cry and laugh.', '20201116095416d330c9d694344c1784f21379bad19b71.jpg', '2', '15', '3', '1992-06-03', '135', '2020-11-16 09:54:16');
INSERT INTO `film` VALUES ('31', 'Zodiac', 'On July 4, 1969, an unknown man attacks Darlene Ferrin and Mike Mageau with a handgun at a lovers\' lane in Vallejo, California. Only Mike survives.\r\n\r\nOne month later, the San Francisco Chronicle receives encrypted letters written by the killer calling himself the \"Zodiac,\" who threatens to kill a dozen people unless his coded message containing his identity is published. Political cartoonist Robert Graysmith, who correctly guesses that his identity is not in the message, is not taken seriously by crime reporter Paul Avery or the editors and is excluded from the initial details about the killings. When the newspaper publishes the letters, a married couple deciphers one. In September, the killer stabs law student Bryan Hartnell and Cecelia Shepard at Lake Berryessa in Napa County; Cecelia dies two days later.\r\n\r\nAt the office, Avery makes fun of Graysmith before they discuss the coded letters. Graysmith interprets the letter, which Avery finds helpful, and he begins sharing information. One of Graysmith\'s insights about the letters is that the Zodiac\'s reference to man as \"the most dangerous animal of them all\" is a reference to the film The Most Dangerous Game, which features the villainous Count Zaroff, a man who hunts live human prey.\r\n\r\nTwo weeks later, San Francisco taxicab driver Paul Stine is shot and killed in the city\'s Presidio Heights district. The Zodiac killer mails pieces of Stine\'s bloodstained shirt to the Chronicle along with a taunting letter. San Francisco police inspectors Dave Toschi and his partner Bill Armstrong are assigned to the case by Captain Marty Lee, and work closely with Vallejo\'s Jack Mulanax and Captain Ken Narlow in Napa. Someone claiming to be Zodiac continues to send taunting letters and speaks on the phone with lawyer Melvin Belli on a television talk show hosted by Jim Dunbar.\r\n\r\nIn 1971, Detectives Toschi, Armstrong, and Mulanax question Arthur Leigh Allen, a suspect in the Vallejo case. They notice that he wears a Zodiac wristwatch, with the same logo used by the killer and Toschi heavily suspects him. However, a handwriting expert insists that Allen did not write the Zodiac letters, even though Allen is said to be ambidextrous. Avery receives a letter threatening his life; becoming paranoid, he turns to drugs and alcohol. He shares information with the Riverside Police Department that the killer might have been active before the initial killings, angering Toschi and Armstrong. The case\'s notoriety weighs on Toschi, who is unable to sit through a Hollywood film, Dirty Harry, loosely based on the Zodiac case.\r\n\r\nIn 1978, Avery moves to the Sacramento Bee. Graysmith persistently contacts Toschi about the Zodiac murders, and eventually impresses him with his knowledge of the case. While Toschi cannot directly give Graysmith access to the evidence, he provides names in other police departments where Zodiac murders occurred. Armstrong transfers from the San Francisco Police homicide division, and Toschi is demoted for supposedly forging a Zodiac letter.\r\n\r\nGraysmith continues his own investigation, profiled in the Chronicle, and gives a television interview about the book he is writing about the case. He begins receiving phone calls with heavy breathing. As his obsession deepens, Graysmith loses his job, and his wife Melanie leaves him, taking their children. Graysmith learns that Allen lived close to Ferrin and probably knew her and that his birthday matches the one Zodiac gave when he spoke to one of Belli\'s maids. While circumstantial evidence seems to indicate his guilt, the physical evidence, such as fingerprints and handwriting samples, do not implicate him. In 1983, Graysmith tracks Allen to a Vallejo Ace Hardware store, where he is employed as a sales clerk; they stare at each other before Graysmith leaves. Eight years later, after Graysmith\'s book, Zodiac, has become a bestseller, Mike Mageau identifies Allen from a police mugshot. Final text indicates that Allen died before he could be questioned and that the case remains open.', '202011160959494be351e74e5b40149a468d7f6fed96be.jpg', '4', '15', '3', '2007-03-02', '157', '2020-11-16 09:59:49');
INSERT INTO `film` VALUES ('32', 'Fight Club', 'The unnamed Narrator is an automobile recall specialist who is unfulfilled by his job and possessions, and suffers from chronic insomnia. He finds catharsis by attending support groups and posing as a sufferer of several diseases, curing his insomnia. His bliss is disturbed when another impostor, Marla Singer, also begins attending the same support groups. The two agree to split which groups they attend.\r\n\r\nOn a flight home from a business trip, the Narrator meets soap salesman Tyler Durden. The Narrator returns home to find his apartment and all his belongings have been destroyed by an explosion. Deciding against asking Marla for help, he calls Tyler and they meet at a bar. The Narrator is disheartened by the loss of his material possessions; Tyler says he is trapped by consumerism. In the parking lot, he asks the Narrator to hit him, and they have a fistfight.\r\n\r\nThe Narrator moves into Tyler\'s home, a large dilapidated house in an industrial area. They have further fights outside the bar, which attract growing crowds of men. The fights move to the bar\'s basement where the men form Fight Club, which routinely meets for the men to fight recreationally.\r\n\r\nMarla overdoses on pills and telephones the Narrator for help; he ignores her, but Tyler goes to her apartment to save her. Tyler and Marla begin a sexual relationship, much to the Narrator\'s irritation. Tyler warns the Narrator never to talk to Marla about him. The Narrator blackmails his boss for his company\'s assets to support Fight Club and quits his job.\r\n\r\nSoon, Fight Clubs begin to form across the country. New members begin to join en masse, including Robert \"Bob\" Paulson, a man with testicular cancer who the Narrator had previously met in a support group. Tyler recruits their members to a new anti-materialist and anti-corporate organization, Project Mayhem, without the Narrator\'s involvement. The group engages in subversive acts of vandalism and violence, increasingly troubling the Narrator. After the Narrator complains that Tyler has excluded him, Tyler reveals that he was the one who caused the explosion at the Narrator\'s condo and then leaves the house.\r\n\r\nWhen Paulson is killed by the police during a botched sabotage operation, the Narrator tries to halt the project. He follows a paper trail to cities Tyler has visited. In one city, a Project Mayhem member addresses the Narrator as \"Mr. Durden.\" Confused, the Narrator calls Marla and discovers that she also believes he is Tyler. Tyler appears in his hotel room and reveals that they are dissociated personalities in the same body; the Narrator assumed the personality of Tyler when he believed he was sleeping.\r\n\r\nThe Narrator blacks out. When he returns to the house, he uncovers Tyler\'s plans to erase debt by destroying buildings that contain credit card records. He apologizes to Marla and warns her that she is in danger, but she is tired of his contradictory behavior and refuses to listen. He tries to warn the police, but the officers are members of the Project. He attempts to disarm the explosives in one building, but Tyler subdues him.\r\n\r\nWith Tyler holding him at gunpoint on the top floor, the Narrator realizes that, as he and Tyler are the same person, the Narrator is holding the gun. He fires it into his own mouth, shooting through his cheek. Tyler dies, and the Narrator ceases mentally projecting him. Project Mayhem members bring a kidnapped Marla to the building. Holding hands, the Narrator and Marla watch as the explosives detonate, collapsing buildings around them.', '202011161004291d7d9e5e5c194232b7322cef60e8392c.jpg', '3', '16', '2', '1999-10-10', '139', '2020-11-16 10:04:29');
INSERT INTO `film` VALUES ('33', 'Seven', 'Soon-to-retire detective William Somerset is partnered with short-tempered but idealistic David Mills, who has recently moved to an unnamed large city with his wife Tracy. After forming a friendship with Somerset, Tracy confides to him that she is pregnant and has yet to tell Mills, as she is unhappy with the city and feels it is no place to raise a child. Somerset sympathizes, having had a similar situation with his ex-girlfriend many years earlier, and advises her to tell Mills only if she plans to keep the child.\r\n\r\nSomerset and Mills investigate a set of murders inspired by the seven deadly sins: a man forced to eat until his stomach burst, representing gluttony, and a defense attorney killed after being forced to cut a pound of flesh from himself, representing greed. Clues at the murder scenes lead them to a suspect\'s apartment, where they find a third victim, a drug dealer and child molester, strapped to a bed, emaciated but alive, representing sloth. The third victim is in critical condition and in no way would be able to answer any questions asked from Somerset and Mills. Daily photographs of the victim, taken over a year, show the crimes were planned far in advance.\r\n\r\nThe detectives use library records to identify a John Doe and track him to his apartment. Doe flees and Mills gives chase, during which Mills falls from a fire escape and injures his arm. Mills searches a truck before being struck in the head with a tire iron. While he is incapacitated, Doe walks up and holds Mills at gunpoint for a moment before escaping. The apartment contains hundreds of notebooks revealing Doe\'s psychopathy, as well as a clue to another murder. The detectives arrive too late to stop a man forced by Doe at gunpoint to kill a prostitute by raping her with a custom-made, bladed strap-on, representing lust. The following day, they attend the scene of a fifth victim, a model whose face has been mutilated by Doe; she was given the option to call for help and live disfigured, or commit suicide by taking pills, representing pride.\r\n\r\nAs Somerset and Mills return to the police station, Doe turns himself in, covered in the blood of an unidentified victim. Doe offers to take the detectives to the final two victims and confess to the murders, but only under specific terms, or he will plead insanity. Somerset is wary, but Mills agrees.\r\n\r\nDoe\'s directions lead the detectives to a remote deserted location, and within minutes, a delivery van approaches. Mills holds Doe at gunpoint while Somerset intercepts the driver, who says he was instructed to bring a box to them. Doe begins to taunt Mills, telling him how envious he was of his life with Tracy. Somerset opens the box and, in a sudden panic, warns Mills to stay back. Doe states that his sin was envy, and Tracy died as a result. Her head is in the box, he says, and she was pregnant. Despite Somerset\'s warnings, Mills fatally shoots Doe, representing wrath, and completing Doe\'s plan. Somerset and the police captain watch as the devastated Mills is taken away, and Somerset offers Mills help. When the captain asks where he\'ll be, Somerset replies, \"Around.\"', '202011161020081cb7ee63a340428ca6c76830a5da6cd9.jpg', '4', '14', '3', '1995-09-22', '127', '2020-11-16 10:20:08');
INSERT INTO `film` VALUES ('34', 'Panic Room', 'Recently divorced Meg Altman, and her eleven-year-old daughter, Sarah, move into a four-story brownstone in New York City\'s Upper West Side. The house\'s previous owner, a reclusive millionaire, installed a \"panic room\" to protect the occupants from intruders. The room is protected by concrete and steel on all sides and a thick steel door and has an extensive security system with multiple surveillance cameras, a public address (P.A.) system, and a separate phone line. On the night the two move into the house, Junior, the previous owner\'s grandson; Burnham, an employee of the residence\'s security company; and Raoul, a vicious hitman Junior recruited, break in. They are after $3 million in bearer bonds locked inside a floor safe in the panic room.\r\n\r\nJunior has miscalculated when the new occupants would move in, but he convinces a reluctant Burnham to continue the heist, who had immediately sought to abandon the heist upon learning of the family\'s presence. Meg wakes up and happens to see the three men on the panic room video monitors. Meg gets Sarah and they get into the panic room, barely locking the door in time. They are unable to call for help because the dedicated phone line is not hooked up. To force the two out, Burnham pumps propane gas into the room\'s air vents. However, a trigger-happy Raoul dangerously increases the amount. Unable to seal the vents, Meg ignites the gas, while she and Sarah cover themselves with fireproof blankets, sending the ignited propane through the hose into the tank, blowing up the tank and leaving Junior badly burned. The Altmans make several attempts to summon help, including unsuccessfully signaling a neighbor with a flashlight through a ventilation pipe. Meg taps into the main telephone line and calls her ex-husband, Stephen, but the intruders cut the main line, abruptly ending the call.\r\n\r\nAll attempts to get into the room fail, and Junior gives up on the robbery while letting slip that there is far more money in the safe than he indicated. As Junior is about to leave, Raoul fatally shoots him, then forces Burnham to finish the robbery. Stephen arrives and immediately is taken hostage. Raoul severely beats him, making sure Meg can see it on the security camera. Sarah, a diabetic, suffers a seizure. Her emergency glucagon syringes are kept in her bedroom. Knowing that Meg wants something outside, Raoul tricks Meg into thinking it is safe to temporarily leave the panic room. While she goes to get Sarah\'s med kit, Burnham finds Sarah nearly unconscious on the floor. After retrieving the med kit, Meg struggles briefly with Raoul, who is thrown into the panic room, his gun knocked from his hand. Meg throws the kit into the panic room just as Burnham locks himself, Raoul, and Sarah inside, crushing Raoul\'s fingers in the sliding steel door. Meg, who now has the gun, begs the intruders over the PA system to give Sarah the injection. Burnham, not wanting to hurt anyone, injects Sarah, telling her he only participated in the robbery to help his child. He informs Meg that Sarah is alright.\r\n\r\nFollowing up on Stephen\'s earlier 911 call, two policemen arrive at the door. To protect Sarah, Meg convinces the officers to leave. Burnham opens the safe and finds $22 million in bearer bonds inside. As the burglars attempt to leave using Sarah as a hostage, Meg rigs booby traps, leading to an ambush where she knocks Raoul over a banister and into a stairwell with a sledgehammer. As Burnham flees, Raoul crawls back and overpowers Meg, preparing to bludgeon her with the sledgehammer. Burnham, hearing Sarah screaming, rushes back and shoots Raoul in the back of the head, killing him instantly. The police, alerted by Meg\'s earlier odd behavior, arrive in force and apprehend Burnham, who drops the bearer bonds that scatter in the wind.\r\n\r\nLater, Meg and Sarah, recovered from their harrowing ordeal, search the newspaper for a new home.', '202011161025124ec828543e824411b0ea55184809adb0.jpg', '5', '27', '3', '2002-03-29', '112', '2020-11-16 10:25:13');
INSERT INTO `film` VALUES ('35', 'The Social Network', 'In October 2003, 19-year-old Harvard University sophomore Mark Zuckerberg is dumped by his girlfriend Erica Albright. Returning to his dorm, Zuckerberg writes an insulting entry about Albright on his LiveJournal blog. He creates a campus website called Facemash by hacking into college databases to steal photos of female students, then allowing site visitors to rate their attractiveness. After traffic to the site crashes parts of Harvard\'s computer network, Zuckerberg is given six months of academic probation. However, Facemash\'s popularity attracts the attention of twins Cameron and Tyler Winklevoss and their business partner Divya Narendra. The trio invites Zuckerberg to work on Harvard Connection, a social network exclusive to Harvard students and aimed at dating.\r\n\r\nZuckerberg approaches his friend Eduardo Saverin with an idea for Thefacebook, a social networking website that would be exclusive to Ivy League students. Saverin provides $1,000 in seed funding, allowing Zuckerberg to build the website, which quickly becomes popular. When they learn of Thefacebook, the Winklevoss twins and Narendra are incensed, believing that Zuckerberg stole their idea while keeping them in the dark by stalling on developing the Harvard Connection website. They raise their complaint with Harvard President Larry Summers, who is dismissive and sees no value in either disciplinary action or Thefacebook.\r\n\r\nSaverin and Zuckerberg meet fellow student Christy Ling, who asks them to \"Facebook me\", a phrase that impresses them. As Thefacebook grows in popularity, Zuckerberg extends the network to Yale University, Columbia University, and Stanford University. Ling arranges for Saverin and Zuckerberg to meet Napster co-founder Sean Parker, who presents a \"billion-dollar\" vision for the company that impresses Zuckerberg. He also suggests renaming the site Facebook. At Parker\'s suggestion, the company moves to Palo Alto, with Saverin remaining in New York to work on business development. After Parker promises to expand Facebook to two continents, Zuckerberg invites him to live at the house he is using as company headquarters.\r\n\r\nWhile competing in the Henley Royal Regatta for Harvard against the Hollandia Roeiclub, the Winklevoss twins discover that Facebook has expanded to Europe with Oxford, Cambridge and LSE, and decide to sue the company for theft of intellectual property. Meanwhile, Saverin objects to Parker making business decisions for Facebook and freezes the company\'s bank account in the resulting dispute. He relents when Zuckerberg reveals that they have secured $500,000 from angel investor Peter Thiel. Saverin becomes enraged when he discovers that the new investment deal allows his share of Facebook to be diluted from 34% to 0.03% while maintaining the ownership percentage of all other parties. He confronts Zuckerberg and Parker, and Saverin vows to sue Zuckerberg before being ejected from the building. Saverin\'s name is removed from the masthead as co-founder. Later, Parker is apprehended for cocaine possession at a party celebrating the 1 millionth user. He attempts to blame Saverin, so Zuckerberg cuts ties with him.\r\n\r\nIn depositions, the Winklevoss twins claim that Zuckerberg stole their idea, while Saverin claims his shares of Facebook were unfairly diluted when the company was incorporated. Marylin Delpy, a junior lawyer for the defense, informs Zuckerberg that they will settle with Saverin since the sordid details of Facebook\'s founding and Zuckerberg\'s callous attitude will make him unsympathetic to a jury. Alone, Zuckerberg sends a Facebook friend request to Albright and repeatedly refreshes the page.', '2020111610341757a4fc815072441fa02fe10275641a09.jpg', '3', '11', '3', '2010-10-01', '120', '2020-11-16 10:34:17');

-- ----------------------------
-- Table structure for `genre`
-- ----------------------------
DROP TABLE IF EXISTS `genre`;
CREATE TABLE `genre` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `genre` (`name`) USING BTREE,
  KEY `ix_genre_create_time` (`create_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES ('1', 'science', '2020-10-06 10:52:14');
INSERT INTO `genre` VALUES ('2', 'horror', '2020-10-06 10:56:29');
INSERT INTO `genre` VALUES ('5', 'animation', '2020-10-06 10:56:46');
INSERT INTO `genre` VALUES ('6', 'music', '2020-10-06 10:56:54');
INSERT INTO `genre` VALUES ('8', 'drama', '2020-11-07 14:06:05');
INSERT INTO `genre` VALUES ('9', 'biography', '2020-11-16 09:01:40');
INSERT INTO `genre` VALUES ('10', 'romantic', '2020-11-16 09:47:49');
INSERT INTO `genre` VALUES ('11', 'thriller', '2020-11-16 09:56:20');
INSERT INTO `genre` VALUES ('12', 'crime', '2020-11-16 10:18:34');

-- ----------------------------
-- Table structure for `genretag`
-- ----------------------------
DROP TABLE IF EXISTS `genretag`;
CREATE TABLE `genretag` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `genre_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `film_id` (`film_id`) USING BTREE,
  KEY `genre_id` (`genre_id`) USING BTREE,
  KEY `ix_genretag_create_time` (`create_time`) USING BTREE,
  CONSTRAINT `genretag_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `genretag_ibfk_2` FOREIGN KEY (`genre_id`) REFERENCES `genre` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of genretag
-- ----------------------------
INSERT INTO `genretag` VALUES ('1', null, '1', '2020-10-06 14:26:16');
INSERT INTO `genretag` VALUES ('2', null, '1', '2020-10-06 14:35:36');
INSERT INTO `genretag` VALUES ('3', null, '1', '2020-10-07 22:25:38');
INSERT INTO `genretag` VALUES ('4', null, '1', '2020-10-08 10:20:49');
INSERT INTO `genretag` VALUES ('5', null, '5', '2020-10-14 23:49:07');
INSERT INTO `genretag` VALUES ('6', null, '2', '2020-10-17 22:18:04');
INSERT INTO `genretag` VALUES ('7', null, '1', '2020-10-31 20:45:43');
INSERT INTO `genretag` VALUES ('8', '9', '8', '2020-11-07 14:08:06');
INSERT INTO `genretag` VALUES ('9', '10', '8', '2020-11-07 14:13:21');
INSERT INTO `genretag` VALUES ('10', '11', '8', '2020-11-07 14:17:54');
INSERT INTO `genretag` VALUES ('11', '12', '8', '2020-11-07 14:30:17');
INSERT INTO `genretag` VALUES ('12', '13', '8', '2020-11-07 16:26:52');
INSERT INTO `genretag` VALUES ('13', '14', '8', '2020-11-07 16:29:07');
INSERT INTO `genretag` VALUES ('14', '15', '5', '2020-11-07 16:31:50');
INSERT INTO `genretag` VALUES ('15', '16', '1', '2020-11-07 16:33:52');
INSERT INTO `genretag` VALUES ('16', '17', '1', '2020-11-07 16:35:54');
INSERT INTO `genretag` VALUES ('17', '18', '5', '2020-11-07 16:37:56');
INSERT INTO `genretag` VALUES ('18', '19', '5', '2020-11-07 16:39:19');
INSERT INTO `genretag` VALUES ('19', '20', '5', '2020-11-07 16:41:30');
INSERT INTO `genretag` VALUES ('20', null, '2', '2020-11-14 15:25:26');
INSERT INTO `genretag` VALUES ('21', '22', '2', '2020-11-14 15:26:04');
INSERT INTO `genretag` VALUES ('22', null, '1', '2020-11-15 17:10:51');
INSERT INTO `genretag` VALUES ('23', null, '2', '2020-11-16 08:56:43');
INSERT INTO `genretag` VALUES ('24', null, '9', '2020-11-16 09:02:43');
INSERT INTO `genretag` VALUES ('25', '26', '9', '2020-11-16 09:25:31');
INSERT INTO `genretag` VALUES ('26', '27', '1', '2020-11-16 09:30:56');
INSERT INTO `genretag` VALUES ('27', '28', '2', '2020-11-16 09:35:33');
INSERT INTO `genretag` VALUES ('28', '29', '10', '2020-11-16 09:49:24');
INSERT INTO `genretag` VALUES ('29', '30', '2', '2020-11-16 09:54:16');
INSERT INTO `genretag` VALUES ('30', '31', '11', '2020-11-16 09:59:49');
INSERT INTO `genretag` VALUES ('31', '32', '8', '2020-11-16 10:04:29');
INSERT INTO `genretag` VALUES ('32', '33', '12', '2020-11-16 10:20:08');
INSERT INTO `genretag` VALUES ('33', '34', '11', '2020-11-16 10:25:13');
INSERT INTO `genretag` VALUES ('34', '35', '9', '2020-11-16 10:34:17');

-- ----------------------------
-- Table structure for `operatelog`
-- ----------------------------
DROP TABLE IF EXISTS `operatelog`;
CREATE TABLE `operatelog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `admin_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `reason` varchar(600) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `admin_id` (`admin_id`) USING BTREE,
  KEY `ix_operatelog_create_time` (`create_time`) USING BTREE,
  CONSTRAINT `operatelog_ibfk_1` FOREIGN KEY (`admin_id`) REFERENCES `admin` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of operatelog
-- ----------------------------

-- ----------------------------
-- Table structure for `performance`
-- ----------------------------
DROP TABLE IF EXISTS `performance`;
CREATE TABLE `performance` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `cast_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `film_id` (`film_id`) USING BTREE,
  KEY `cast_id` (`cast_id`) USING BTREE,
  KEY `ix_performance_create_time` (`create_time`) USING BTREE,
  CONSTRAINT `performance_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`),
  CONSTRAINT `performance_ibfk_2` FOREIGN KEY (`cast_id`) REFERENCES `cast` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of performance
-- ----------------------------

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(11) DEFAULT NULL,
  `first_name` varchar(20) DEFAULT NULL,
  `second_name` varchar(20) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `email` varchar(100) DEFAULT NULL,
  `phone` varchar(20) DEFAULT NULL,
  `face` varchar(255) DEFAULT NULL,
  `register_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`name`) USING BTREE,
  UNIQUE KEY `email` (`email`) USING BTREE,
  UNIQUE KEY `phone` (`phone`) USING BTREE,
  UNIQUE KEY `face` (`face`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'user3', '123', '123', 'pbkdf2:sha256:150000$7uAMm4BK$c55dad0013fd532843002b09daf6486e5c25898ec844085277e6b498a1f88f56', '123@123.com', '123', '202011071434172c16f96e433941d683a552a15bd9c917.jpg', '2020-10-06 09:41:58');
INSERT INTO `user` VALUES ('2', 'admin', 'admin', 'admin', 'pbkdf2:sha256:150000$S1e59BcO$dc45f4154319be0988bce039bf0cc869eaf44fb03e5c954d257215c002b84edb', 'admin@admin.com', '1234', '202011161045104189813900fd4c1fb24708650901a84f.png', '2020-10-06 10:21:34');
INSERT INTO `user` VALUES ('3', 'user1', '123', '123', 'pbkdf2:sha256:150000$dzluvDfc$ffd31ae90441073053f86c77289fae7f4d2ca6133f68158afb4b7856e9716a6a', '123', '12345', '2020110810561165c121a7800d4881b16541bf754656ce.png', '2020-11-08 10:55:47');
INSERT INTO `user` VALUES ('4', 'user2', 'shabi', 'shabi', 'pbkdf2:sha256:150000$yVBhw953$d4bdd2393cc28bb91f24f0c061d5ce1161456afa076e5025d834e4d3eacaabff', '1234567@gmail.com', '1234567', '202011161040382d15ba47321c4804ad3c5dd676b49f6f.jpg', '2020-11-15 16:47:40');
INSERT INTO `user` VALUES ('5', 'user4', '123', '123', 'pbkdf2:sha256:150000$oNRkOa86$89e4d3fc48dc19642f1fc318759d0940717e9059211686c77c87f52a28c7b43a', '1234@gmail.com', '123456', '202011161043175975e5167db140b5ad96cc97a73a4966.jpg', '2020-11-16 10:43:03');
INSERT INTO `user` VALUES ('6', 'user5', '123', '123', 'pbkdf2:sha256:150000$RfgCCqnN$9337caa015246e4e006376abc4e9d62de9d047b8ff9310bd21fc26b5cab8ba84', '1234@123.com', '12345678', '20201116104425c54c2253ff184835b4c7b8d0e3cb8827.png', '2020-11-16 10:43:59');
INSERT INTO `user` VALUES ('7', 'user6', '123', '123', 'pbkdf2:sha256:150000$HXyUx7an$24da58ec1bd25ad769310308237e6fa2770770eb6771939e16276dac907a7fd9', '123@gmail.com', '123456789', '202011161046417ab44642279e4df493b834128b52b924.jpg', '2020-11-16 10:46:22');
INSERT INTO `user` VALUES ('8', 'user7', '123', '123', 'pbkdf2:sha256:150000$4YTYe4Qz$803372472bfd0a8bddc93913dbc5f89ceb8048666d349b7316d2ae9074290b15', '12345@gmail.com', '54321', '20201116104728f002fb2b70ef42f88e9e93c2c00deb11.png', '2020-11-16 10:47:20');
INSERT INTO `user` VALUES ('9', 'user8', '123', '123', 'pbkdf2:sha256:150000$TkO086WN$68b20d16f31468fc7ca2d20475d340cef89783eb8537a66f7f84195df87b2564', '12345678@gmail.com', '4321', '20201116104845acd6a8933f9b4ba09251a4d287520b02.png', '2020-11-16 10:48:37');

-- ----------------------------
-- Table structure for `userlog`
-- ----------------------------
DROP TABLE IF EXISTS `userlog`;
CREATE TABLE `userlog` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `ip` varchar(100) DEFAULT NULL,
  `log_time` datetime DEFAULT NULL,
  `film_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `user_id` (`user_id`) USING BTREE,
  KEY `ix_userlog_log_time` (`log_time`) USING BTREE,
  CONSTRAINT `userlog_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=957 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of userlog
-- ----------------------------
INSERT INTO `userlog` VALUES ('1', '1', '127.0.0.1', '2020-10-06 09:51:14', '3');
INSERT INTO `userlog` VALUES ('2', '1', null, '2020-10-07 10:58:53', '3');
INSERT INTO `userlog` VALUES ('3', '1', '127.0.0.1', '2020-10-07 11:00:32', '3');
INSERT INTO `userlog` VALUES ('4', '1', '127.0.0.1', '2020-10-07 11:00:43', '3');
INSERT INTO `userlog` VALUES ('5', '1', '127.0.0.1', '2020-10-07 11:08:57', null);
INSERT INTO `userlog` VALUES ('6', '1', '127.0.0.1', '2020-10-07 11:45:32', '3');
INSERT INTO `userlog` VALUES ('7', '1', '127.0.0.1', '2020-10-07 11:52:27', '3');
INSERT INTO `userlog` VALUES ('8', '1', '127.0.0.1', '2020-10-07 11:56:38', '3');
INSERT INTO `userlog` VALUES ('9', '1', '127.0.0.1', '2020-10-07 11:56:46', '3');
INSERT INTO `userlog` VALUES ('10', '1', '127.0.0.1', '2020-10-07 11:56:46', '3');
INSERT INTO `userlog` VALUES ('11', '1', '127.0.0.1', '2020-10-07 11:56:59', '3');
INSERT INTO `userlog` VALUES ('12', '1', '127.0.0.1', '2020-10-07 12:30:09', '3');
INSERT INTO `userlog` VALUES ('13', '1', '127.0.0.1', '2020-10-07 12:30:49', '3');
INSERT INTO `userlog` VALUES ('14', '1', '127.0.0.1', '2020-10-07 12:43:14', '3');
INSERT INTO `userlog` VALUES ('15', '1', '127.0.0.1', '2020-10-07 12:43:26', '3');
INSERT INTO `userlog` VALUES ('16', '1', '127.0.0.1', '2020-10-07 12:43:55', '3');
INSERT INTO `userlog` VALUES ('17', '1', '127.0.0.1', '2020-10-07 12:44:02', '3');
INSERT INTO `userlog` VALUES ('18', '1', '127.0.0.1', '2020-10-07 12:44:29', '3');
INSERT INTO `userlog` VALUES ('19', '1', '127.0.0.1', '2020-10-07 12:44:34', '3');
INSERT INTO `userlog` VALUES ('20', '1', '127.0.0.1', '2020-10-07 12:44:35', '3');
INSERT INTO `userlog` VALUES ('21', '1', '127.0.0.1', '2020-10-07 12:58:11', '3');
INSERT INTO `userlog` VALUES ('22', '1', '127.0.0.1', '2020-10-07 13:16:34', '3');
INSERT INTO `userlog` VALUES ('23', '1', '127.0.0.1', '2020-10-07 13:16:48', '3');
INSERT INTO `userlog` VALUES ('24', '1', '127.0.0.1', '2020-10-07 21:59:38', null);
INSERT INTO `userlog` VALUES ('25', '1', '127.0.0.1', '2020-10-07 21:59:48', '3');
INSERT INTO `userlog` VALUES ('26', '1', '127.0.0.1', '2020-10-07 21:59:58', '3');
INSERT INTO `userlog` VALUES ('27', '1', '127.0.0.1', '2020-10-07 21:59:58', '3');
INSERT INTO `userlog` VALUES ('28', '1', '127.0.0.1', '2020-10-07 22:01:13', '3');
INSERT INTO `userlog` VALUES ('29', '1', '127.0.0.1', '2020-10-07 22:01:17', '3');
INSERT INTO `userlog` VALUES ('30', '1', '127.0.0.1', '2020-10-07 22:01:30', '3');
INSERT INTO `userlog` VALUES ('31', '1', '127.0.0.1', '2020-10-07 22:01:35', '3');
INSERT INTO `userlog` VALUES ('32', '1', '127.0.0.1', '2020-10-07 22:09:27', null);
INSERT INTO `userlog` VALUES ('33', '1', '127.0.0.1', '2020-10-07 22:10:03', '3');
INSERT INTO `userlog` VALUES ('34', '1', '127.0.0.1', '2020-10-07 22:10:16', '3');
INSERT INTO `userlog` VALUES ('35', '1', '127.0.0.1', '2020-10-07 22:34:00', '3');
INSERT INTO `userlog` VALUES ('36', '1', '127.0.0.1', '2020-10-07 22:51:47', '3');
INSERT INTO `userlog` VALUES ('37', '1', '127.0.0.1', '2020-10-07 22:55:32', '3');
INSERT INTO `userlog` VALUES ('38', '1', '127.0.0.1', '2020-10-07 22:55:35', '3');
INSERT INTO `userlog` VALUES ('39', '1', '127.0.0.1', '2020-10-07 22:56:00', '3');
INSERT INTO `userlog` VALUES ('40', '1', '127.0.0.1', '2020-10-07 22:58:42', '3');
INSERT INTO `userlog` VALUES ('41', '1', '127.0.0.1', '2020-10-07 22:58:44', '3');
INSERT INTO `userlog` VALUES ('42', '1', '127.0.0.1', '2020-10-14 21:52:22', null);
INSERT INTO `userlog` VALUES ('43', '1', '127.0.0.1', '2020-10-14 21:53:05', null);
INSERT INTO `userlog` VALUES ('44', '1', '127.0.0.1', '2020-10-14 22:08:16', null);
INSERT INTO `userlog` VALUES ('45', '1', '127.0.0.1', '2020-10-14 23:52:40', '6');
INSERT INTO `userlog` VALUES ('46', '1', '127.0.0.1', '2020-10-14 23:52:51', '3');
INSERT INTO `userlog` VALUES ('47', '1', '127.0.0.1', '2020-10-15 00:03:58', '3');
INSERT INTO `userlog` VALUES ('48', '1', '127.0.0.1', '2020-10-15 00:04:05', '3');
INSERT INTO `userlog` VALUES ('49', '1', '127.0.0.1', '2020-10-15 00:05:06', '3');
INSERT INTO `userlog` VALUES ('50', '1', '127.0.0.1', '2020-10-15 00:05:13', '3');
INSERT INTO `userlog` VALUES ('51', '1', '127.0.0.1', '2020-10-15 00:05:14', '3');
INSERT INTO `userlog` VALUES ('52', '1', '127.0.0.1', '2020-10-15 00:07:02', '3');
INSERT INTO `userlog` VALUES ('53', '1', '127.0.0.1', '2020-10-15 00:11:58', '3');
INSERT INTO `userlog` VALUES ('54', '1', '127.0.0.1', '2020-10-15 00:12:45', '3');
INSERT INTO `userlog` VALUES ('55', '1', '127.0.0.1', '2020-10-15 22:39:50', null);
INSERT INTO `userlog` VALUES ('56', '1', '127.0.0.1', '2020-10-15 22:40:04', '3');
INSERT INTO `userlog` VALUES ('57', '1', '127.0.0.1', '2020-10-15 22:43:49', '3');
INSERT INTO `userlog` VALUES ('58', '1', '127.0.0.1', '2020-10-15 23:26:10', null);
INSERT INTO `userlog` VALUES ('59', '1', '127.0.0.1', '2020-10-15 23:26:21', '3');
INSERT INTO `userlog` VALUES ('60', '1', '127.0.0.1', '2020-10-15 23:26:33', '3');
INSERT INTO `userlog` VALUES ('61', '1', '127.0.0.1', '2020-10-15 23:26:33', '3');
INSERT INTO `userlog` VALUES ('62', '1', '127.0.0.1', '2020-10-15 23:27:35', '3');
INSERT INTO `userlog` VALUES ('63', '1', '127.0.0.1', '2020-10-15 23:27:35', '3');
INSERT INTO `userlog` VALUES ('64', '1', '127.0.0.1', '2020-10-15 23:48:59', '3');
INSERT INTO `userlog` VALUES ('65', '1', '127.0.0.1', '2020-10-15 23:50:38', '3');
INSERT INTO `userlog` VALUES ('66', '1', '127.0.0.1', '2020-10-15 23:51:05', '3');
INSERT INTO `userlog` VALUES ('67', '1', '127.0.0.1', '2020-10-15 23:51:53', '3');
INSERT INTO `userlog` VALUES ('68', '1', '127.0.0.1', '2020-10-15 23:52:36', '3');
INSERT INTO `userlog` VALUES ('69', '1', '127.0.0.1', '2020-10-15 23:52:38', '3');
INSERT INTO `userlog` VALUES ('70', '1', '127.0.0.1', '2020-10-15 23:53:18', '3');
INSERT INTO `userlog` VALUES ('71', '1', '127.0.0.1', '2020-10-15 23:53:22', '3');
INSERT INTO `userlog` VALUES ('72', '1', '127.0.0.1', '2020-10-15 23:54:34', '3');
INSERT INTO `userlog` VALUES ('73', '1', '127.0.0.1', '2020-10-15 23:54:35', '3');
INSERT INTO `userlog` VALUES ('74', '1', '127.0.0.1', '2020-10-15 23:55:06', '3');
INSERT INTO `userlog` VALUES ('75', '1', '127.0.0.1', '2020-10-15 23:55:08', '3');
INSERT INTO `userlog` VALUES ('76', '1', '127.0.0.1', '2020-10-15 23:56:16', '3');
INSERT INTO `userlog` VALUES ('77', '1', '127.0.0.1', '2020-10-15 23:56:42', '3');
INSERT INTO `userlog` VALUES ('78', '1', '127.0.0.1', '2020-10-15 23:56:46', '3');
INSERT INTO `userlog` VALUES ('79', '1', '127.0.0.1', '2020-10-16 00:25:47', '3');
INSERT INTO `userlog` VALUES ('80', '1', '127.0.0.1', '2020-10-16 00:25:50', '3');
INSERT INTO `userlog` VALUES ('81', '1', '127.0.0.1', '2020-10-16 00:26:02', '3');
INSERT INTO `userlog` VALUES ('82', '1', '127.0.0.1', '2020-10-16 00:26:17', '3');
INSERT INTO `userlog` VALUES ('83', '1', '127.0.0.1', '2020-10-17 17:13:54', null);
INSERT INTO `userlog` VALUES ('84', '1', '127.0.0.1', '2020-10-17 17:14:46', '3');
INSERT INTO `userlog` VALUES ('85', '1', '127.0.0.1', '2020-10-17 17:14:50', '3');
INSERT INTO `userlog` VALUES ('86', '1', '127.0.0.1', '2020-10-17 17:18:23', '3');
INSERT INTO `userlog` VALUES ('87', '1', '127.0.0.1', '2020-10-17 17:18:25', '3');
INSERT INTO `userlog` VALUES ('88', '1', '127.0.0.1', '2020-10-17 17:18:30', '3');
INSERT INTO `userlog` VALUES ('89', '1', '127.0.0.1', '2020-10-17 17:18:52', '3');
INSERT INTO `userlog` VALUES ('90', '1', '127.0.0.1', '2020-10-17 17:18:57', '3');
INSERT INTO `userlog` VALUES ('91', '1', '127.0.0.1', '2020-10-17 17:19:01', '3');
INSERT INTO `userlog` VALUES ('92', '1', '127.0.0.1', '2020-10-17 17:41:44', null);
INSERT INTO `userlog` VALUES ('93', '1', '127.0.0.1', '2020-10-17 17:42:17', '3');
INSERT INTO `userlog` VALUES ('94', '1', '127.0.0.1', '2020-10-17 17:42:36', '3');
INSERT INTO `userlog` VALUES ('95', '1', '127.0.0.1', '2020-10-17 17:44:20', '3');
INSERT INTO `userlog` VALUES ('96', '1', '127.0.0.1', '2020-10-17 17:44:57', '3');
INSERT INTO `userlog` VALUES ('97', '1', '127.0.0.1', '2020-10-17 17:46:47', '3');
INSERT INTO `userlog` VALUES ('98', '1', '127.0.0.1', '2020-10-17 17:47:45', '3');
INSERT INTO `userlog` VALUES ('99', '1', '127.0.0.1', '2020-10-17 17:47:58', '3');
INSERT INTO `userlog` VALUES ('100', '1', '127.0.0.1', '2020-10-17 17:48:03', '3');
INSERT INTO `userlog` VALUES ('101', '1', '127.0.0.1', '2020-10-17 17:49:11', '3');
INSERT INTO `userlog` VALUES ('102', '1', '127.0.0.1', '2020-10-17 17:50:27', '3');
INSERT INTO `userlog` VALUES ('103', '1', '127.0.0.1', '2020-10-17 17:50:38', '3');
INSERT INTO `userlog` VALUES ('104', '1', '127.0.0.1', '2020-10-17 17:50:48', '3');
INSERT INTO `userlog` VALUES ('105', '1', '127.0.0.1', '2020-10-17 17:51:55', '3');
INSERT INTO `userlog` VALUES ('106', '1', '127.0.0.1', '2020-10-17 22:02:09', null);
INSERT INTO `userlog` VALUES ('107', '1', '127.0.0.1', '2020-10-17 22:12:52', null);
INSERT INTO `userlog` VALUES ('108', '1', '127.0.0.1', '2020-10-17 22:13:12', null);
INSERT INTO `userlog` VALUES ('109', '2', '127.0.0.1', '2020-10-17 22:18:50', null);
INSERT INTO `userlog` VALUES ('110', '2', '127.0.0.1', '2020-10-17 22:20:25', '7');
INSERT INTO `userlog` VALUES ('111', '2', '127.0.0.1', '2020-10-17 22:20:38', '3');
INSERT INTO `userlog` VALUES ('112', '1', '127.0.0.1', '2020-10-17 22:20:52', null);
INSERT INTO `userlog` VALUES ('113', '2', '127.0.0.1', '2020-10-17 22:21:08', '3');
INSERT INTO `userlog` VALUES ('114', '2', '127.0.0.1', '2020-10-17 22:21:08', '3');
INSERT INTO `userlog` VALUES ('115', '1', '127.0.0.1', '2020-10-17 22:21:28', '3');
INSERT INTO `userlog` VALUES ('116', '1', '127.0.0.1', '2020-10-17 22:22:02', '3');
INSERT INTO `userlog` VALUES ('117', '1', '127.0.0.1', '2020-10-17 22:30:25', '3');
INSERT INTO `userlog` VALUES ('118', '1', '127.0.0.1', '2020-10-17 22:30:34', '3');
INSERT INTO `userlog` VALUES ('119', '1', '127.0.0.1', '2020-10-17 22:30:46', '3');
INSERT INTO `userlog` VALUES ('120', '2', '127.0.0.1', '2020-10-17 22:43:36', '3');
INSERT INTO `userlog` VALUES ('121', '2', '127.0.0.1', '2020-10-17 22:43:42', '3');
INSERT INTO `userlog` VALUES ('122', '2', '127.0.0.1', '2020-10-17 22:43:44', '3');
INSERT INTO `userlog` VALUES ('123', '2', '127.0.0.1', '2020-10-17 22:45:15', '3');
INSERT INTO `userlog` VALUES ('124', '2', '127.0.0.1', '2020-10-17 22:45:18', '3');
INSERT INTO `userlog` VALUES ('125', '1', '127.0.0.1', '2020-10-17 22:54:19', '3');
INSERT INTO `userlog` VALUES ('126', '1', '127.0.0.1', '2020-10-17 22:56:13', '3');
INSERT INTO `userlog` VALUES ('127', '1', '127.0.0.1', '2020-10-17 22:59:52', '3');
INSERT INTO `userlog` VALUES ('128', '1', '127.0.0.1', '2020-10-17 23:06:24', '3');
INSERT INTO `userlog` VALUES ('129', '1', '127.0.0.1', '2020-10-17 23:12:18', null);
INSERT INTO `userlog` VALUES ('130', '1', '127.0.0.1', '2020-10-17 23:12:57', '3');
INSERT INTO `userlog` VALUES ('131', '1', '127.0.0.1', '2020-10-17 23:14:36', '3');
INSERT INTO `userlog` VALUES ('132', '2', '127.0.0.1', '2020-10-26 16:32:51', null);
INSERT INTO `userlog` VALUES ('133', '1', '127.0.0.1', '2020-10-26 16:34:27', null);
INSERT INTO `userlog` VALUES ('134', '1', '127.0.0.1', '2020-10-26 16:43:15', '3');
INSERT INTO `userlog` VALUES ('135', '1', '127.0.0.1', '2020-10-26 23:56:06', null);
INSERT INTO `userlog` VALUES ('136', '1', '127.0.0.1', '2020-10-26 23:56:39', '3');
INSERT INTO `userlog` VALUES ('137', '1', '127.0.0.1', '2020-10-26 23:57:09', '3');
INSERT INTO `userlog` VALUES ('138', '1', '127.0.0.1', '2020-10-26 23:57:12', '3');
INSERT INTO `userlog` VALUES ('139', '1', '127.0.0.1', '2020-10-27 00:00:29', '3');
INSERT INTO `userlog` VALUES ('140', '1', '127.0.0.1', '2020-10-27 00:00:43', '3');
INSERT INTO `userlog` VALUES ('141', '1', '127.0.0.1', '2020-10-27 00:03:17', '3');
INSERT INTO `userlog` VALUES ('142', '1', '127.0.0.1', '2020-10-27 00:03:56', '3');
INSERT INTO `userlog` VALUES ('143', '1', '127.0.0.1', '2020-10-27 00:04:13', '3');
INSERT INTO `userlog` VALUES ('144', '1', '127.0.0.1', '2020-10-27 00:04:43', '3');
INSERT INTO `userlog` VALUES ('145', '1', '127.0.0.1', '2020-10-27 00:04:51', '3');
INSERT INTO `userlog` VALUES ('146', '1', '127.0.0.1', '2020-10-27 00:04:57', '3');
INSERT INTO `userlog` VALUES ('147', '1', '127.0.0.1', '2020-10-27 00:07:55', '3');
INSERT INTO `userlog` VALUES ('148', '1', '127.0.0.1', '2020-10-28 01:07:27', null);
INSERT INTO `userlog` VALUES ('149', '1', '127.0.0.1', '2020-10-28 01:07:35', '3');
INSERT INTO `userlog` VALUES ('150', '1', '127.0.0.1', '2020-10-28 01:07:59', '3');
INSERT INTO `userlog` VALUES ('151', '1', '127.0.0.1', '2020-10-30 00:30:31', null);
INSERT INTO `userlog` VALUES ('152', '1', '127.0.0.1', '2020-10-30 00:30:42', '3');
INSERT INTO `userlog` VALUES ('153', '1', '127.0.0.1', '2020-10-30 00:30:52', '3');
INSERT INTO `userlog` VALUES ('154', '1', '127.0.0.1', '2020-10-30 00:30:52', '3');
INSERT INTO `userlog` VALUES ('155', '1', '127.0.0.1', '2020-10-30 00:30:57', '3');
INSERT INTO `userlog` VALUES ('156', '1', '127.0.0.1', '2020-10-30 00:30:57', '3');
INSERT INTO `userlog` VALUES ('157', '1', '127.0.0.1', '2020-10-30 00:31:02', '3');
INSERT INTO `userlog` VALUES ('158', '1', '127.0.0.1', '2020-10-30 00:31:02', '3');
INSERT INTO `userlog` VALUES ('159', '1', '127.0.0.1', '2020-10-30 00:31:06', '3');
INSERT INTO `userlog` VALUES ('160', '1', '127.0.0.1', '2020-10-30 00:31:06', '3');
INSERT INTO `userlog` VALUES ('161', '1', '127.0.0.1', '2020-10-30 00:31:10', '3');
INSERT INTO `userlog` VALUES ('162', '1', '127.0.0.1', '2020-10-30 00:31:10', '3');
INSERT INTO `userlog` VALUES ('163', '1', '127.0.0.1', '2020-10-30 00:31:14', '3');
INSERT INTO `userlog` VALUES ('164', '1', '127.0.0.1', '2020-10-30 00:31:14', '3');
INSERT INTO `userlog` VALUES ('165', '1', '127.0.0.1', '2020-10-30 00:31:18', '3');
INSERT INTO `userlog` VALUES ('166', '1', '127.0.0.1', '2020-10-30 00:31:18', '3');
INSERT INTO `userlog` VALUES ('167', '1', '127.0.0.1', '2020-10-30 00:31:26', '3');
INSERT INTO `userlog` VALUES ('168', '1', '127.0.0.1', '2020-10-30 00:31:26', '3');
INSERT INTO `userlog` VALUES ('169', '1', '127.0.0.1', '2020-10-30 00:31:36', '3');
INSERT INTO `userlog` VALUES ('170', '1', '127.0.0.1', '2020-10-30 00:41:09', '3');
INSERT INTO `userlog` VALUES ('171', '1', '127.0.0.1', '2020-10-30 00:41:15', '3');
INSERT INTO `userlog` VALUES ('172', '1', '127.0.0.1', '2020-10-30 00:41:18', '3');
INSERT INTO `userlog` VALUES ('173', '1', '127.0.0.1', '2020-10-30 00:41:21', '3');
INSERT INTO `userlog` VALUES ('174', '1', '127.0.0.1', '2020-10-30 00:41:23', '3');
INSERT INTO `userlog` VALUES ('175', '1', '127.0.0.1', '2020-10-31 19:47:16', '3');
INSERT INTO `userlog` VALUES ('176', '1', '127.0.0.1', '2020-10-31 19:47:20', '3');
INSERT INTO `userlog` VALUES ('177', '1', '127.0.0.1', '2020-10-31 19:47:22', '3');
INSERT INTO `userlog` VALUES ('178', '1', '127.0.0.1', '2020-10-31 21:15:32', null);
INSERT INTO `userlog` VALUES ('179', '1', '127.0.0.1', '2020-10-31 21:15:39', '3');
INSERT INTO `userlog` VALUES ('180', '1', '127.0.0.1', '2020-10-31 21:15:44', '3');
INSERT INTO `userlog` VALUES ('181', '1', '127.0.0.1', '2020-10-31 21:20:08', null);
INSERT INTO `userlog` VALUES ('182', '1', '127.0.0.1', '2020-10-31 21:20:16', '3');
INSERT INTO `userlog` VALUES ('183', '1', '127.0.0.1', '2020-11-04 23:12:22', null);
INSERT INTO `userlog` VALUES ('184', '2', '127.0.0.1', '2020-11-04 23:12:44', null);
INSERT INTO `userlog` VALUES ('185', '1', '127.0.0.1', '2020-11-04 23:13:18', '3');
INSERT INTO `userlog` VALUES ('186', '1', '127.0.0.1', '2020-11-04 23:13:32', '3');
INSERT INTO `userlog` VALUES ('187', '1', '127.0.0.1', '2020-11-04 23:17:13', '3');
INSERT INTO `userlog` VALUES ('188', '1', '127.0.0.1', '2020-11-04 23:17:40', '3');
INSERT INTO `userlog` VALUES ('189', '1', '127.0.0.1', '2020-11-04 23:17:55', '3');
INSERT INTO `userlog` VALUES ('190', '1', '127.0.0.1', '2020-11-04 23:17:55', '3');
INSERT INTO `userlog` VALUES ('191', '2', '127.0.0.1', '2020-11-04 23:18:06', '3');
INSERT INTO `userlog` VALUES ('192', '2', '127.0.0.1', '2020-11-04 23:18:14', '3');
INSERT INTO `userlog` VALUES ('193', '2', '127.0.0.1', '2020-11-04 23:18:14', '3');
INSERT INTO `userlog` VALUES ('194', '1', '127.0.0.1', '2020-11-04 23:18:20', '3');
INSERT INTO `userlog` VALUES ('195', '1', '127.0.0.1', '2020-11-04 23:18:24', '3');
INSERT INTO `userlog` VALUES ('196', '2', '127.0.0.1', '2020-11-04 23:18:28', '3');
INSERT INTO `userlog` VALUES ('197', '2', '127.0.0.1', '2020-11-04 23:20:37', '3');
INSERT INTO `userlog` VALUES ('198', '2', '127.0.0.1', '2020-11-04 23:26:44', '3');
INSERT INTO `userlog` VALUES ('199', '2', '127.0.0.1', '2020-11-04 23:26:49', '3');
INSERT INTO `userlog` VALUES ('200', '2', '127.0.0.1', '2020-11-04 23:27:07', '3');
INSERT INTO `userlog` VALUES ('201', '2', '127.0.0.1', '2020-11-04 23:27:35', '3');
INSERT INTO `userlog` VALUES ('202', '2', '127.0.0.1', '2020-11-04 23:28:37', '3');
INSERT INTO `userlog` VALUES ('203', '1', '127.0.0.1', '2020-11-04 23:29:18', '3');
INSERT INTO `userlog` VALUES ('204', '1', '127.0.0.1', '2020-11-04 23:31:24', '3');
INSERT INTO `userlog` VALUES ('205', '1', '127.0.0.1', '2020-11-04 23:39:21', '3');
INSERT INTO `userlog` VALUES ('206', '2', '127.0.0.1', '2020-11-04 23:47:34', '8');
INSERT INTO `userlog` VALUES ('207', '2', '127.0.0.1', '2020-11-04 23:48:18', '3');
INSERT INTO `userlog` VALUES ('208', '2', '127.0.0.1', '2020-11-04 23:54:50', '7');
INSERT INTO `userlog` VALUES ('209', '2', '127.0.0.1', '2020-11-05 00:04:30', '7');
INSERT INTO `userlog` VALUES ('210', '2', '127.0.0.1', '2020-11-05 00:07:08', '8');
INSERT INTO `userlog` VALUES ('211', '2', '127.0.0.1', '2020-11-05 00:07:14', '8');
INSERT INTO `userlog` VALUES ('212', '2', '127.0.0.1', '2020-11-05 00:07:14', '8');
INSERT INTO `userlog` VALUES ('213', '2', '127.0.0.1', '2020-11-05 00:20:05', '7');
INSERT INTO `userlog` VALUES ('214', '2', '127.0.0.1', '2020-11-05 00:23:15', '7');
INSERT INTO `userlog` VALUES ('215', '2', '127.0.0.1', '2020-11-05 00:23:19', '3');
INSERT INTO `userlog` VALUES ('216', '2', '127.0.0.1', '2020-11-05 00:23:21', '3');
INSERT INTO `userlog` VALUES ('217', '2', '127.0.0.1', '2020-11-05 00:24:08', '3');
INSERT INTO `userlog` VALUES ('218', '2', '127.0.0.1', '2020-11-05 00:26:25', '3');
INSERT INTO `userlog` VALUES ('219', '1', '127.0.0.1', '2020-11-06 00:04:10', null);
INSERT INTO `userlog` VALUES ('220', '1', '127.0.0.1', '2020-11-06 00:04:43', '3');
INSERT INTO `userlog` VALUES ('221', '1', '127.0.0.1', '2020-11-06 00:05:29', '3');
INSERT INTO `userlog` VALUES ('222', '1', '127.0.0.1', '2020-11-06 00:05:47', '3');
INSERT INTO `userlog` VALUES ('223', '1', '127.0.0.1', '2020-11-06 00:07:10', '3');
INSERT INTO `userlog` VALUES ('224', '1', '127.0.0.1', '2020-11-06 00:07:24', '3');
INSERT INTO `userlog` VALUES ('225', '1', '127.0.0.1', '2020-11-07 13:06:57', null);
INSERT INTO `userlog` VALUES ('226', '2', '127.0.0.1', '2020-11-07 13:07:07', null);
INSERT INTO `userlog` VALUES ('227', '2', '127.0.0.1', '2020-11-07 14:08:54', '9');
INSERT INTO `userlog` VALUES ('228', '2', '127.0.0.1', '2020-11-07 14:08:56', '9');
INSERT INTO `userlog` VALUES ('229', '2', '127.0.0.1', '2020-11-07 14:08:57', '9');
INSERT INTO `userlog` VALUES ('230', '2', '127.0.0.1', '2020-11-07 14:08:58', '9');
INSERT INTO `userlog` VALUES ('231', '2', '127.0.0.1', '2020-11-07 14:09:00', '9');
INSERT INTO `userlog` VALUES ('232', '2', '127.0.0.1', '2020-11-07 14:10:19', '9');
INSERT INTO `userlog` VALUES ('233', '2', '127.0.0.1', '2020-11-07 14:10:22', '9');
INSERT INTO `userlog` VALUES ('234', '2', '127.0.0.1', '2020-11-07 14:10:54', '9');
INSERT INTO `userlog` VALUES ('235', '2', '127.0.0.1', '2020-11-07 14:10:59', '9');
INSERT INTO `userlog` VALUES ('236', '2', '127.0.0.1', '2020-11-07 14:13:24', '9');
INSERT INTO `userlog` VALUES ('237', '2', '127.0.0.1', '2020-11-07 14:13:27', '9');
INSERT INTO `userlog` VALUES ('238', '2', '127.0.0.1', '2020-11-07 14:13:29', '10');
INSERT INTO `userlog` VALUES ('239', '2', '127.0.0.1', '2020-11-07 14:13:32', '10');
INSERT INTO `userlog` VALUES ('240', '2', '127.0.0.1', '2020-11-07 14:13:33', '10');
INSERT INTO `userlog` VALUES ('241', '2', '127.0.0.1', '2020-11-07 14:13:49', '10');
INSERT INTO `userlog` VALUES ('242', '2', '127.0.0.1', '2020-11-07 14:13:51', '10');
INSERT INTO `userlog` VALUES ('243', '2', '127.0.0.1', '2020-11-07 14:18:09', '9');
INSERT INTO `userlog` VALUES ('244', '2', '127.0.0.1', '2020-11-07 14:18:12', '11');
INSERT INTO `userlog` VALUES ('245', '2', '127.0.0.1', '2020-11-07 14:18:15', '9');
INSERT INTO `userlog` VALUES ('246', '2', '127.0.0.1', '2020-11-07 14:18:23', '9');
INSERT INTO `userlog` VALUES ('247', '2', '127.0.0.1', '2020-11-07 14:19:13', '9');
INSERT INTO `userlog` VALUES ('248', '2', '127.0.0.1', '2020-11-07 14:19:13', '9');
INSERT INTO `userlog` VALUES ('249', '2', '127.0.0.1', '2020-11-07 14:19:42', '9');
INSERT INTO `userlog` VALUES ('250', '2', '127.0.0.1', '2020-11-07 14:19:45', '9');
INSERT INTO `userlog` VALUES ('251', '1', '127.0.0.1', '2020-11-07 14:20:01', null);
INSERT INTO `userlog` VALUES ('252', '1', '127.0.0.1', '2020-11-07 14:20:04', '9');
INSERT INTO `userlog` VALUES ('253', '1', '127.0.0.1', '2020-11-07 14:20:40', '9');
INSERT INTO `userlog` VALUES ('254', '1', '127.0.0.1', '2020-11-07 14:20:49', '9');
INSERT INTO `userlog` VALUES ('255', '1', '127.0.0.1', '2020-11-07 14:20:49', '9');
INSERT INTO `userlog` VALUES ('256', '1', '127.0.0.1', '2020-11-07 14:22:39', '9');
INSERT INTO `userlog` VALUES ('257', '1', '127.0.0.1', '2020-11-07 14:22:56', '9');
INSERT INTO `userlog` VALUES ('258', '1', '127.0.0.1', '2020-11-07 14:22:56', '9');
INSERT INTO `userlog` VALUES ('259', '1', '127.0.0.1', '2020-11-07 14:22:58', '9');
INSERT INTO `userlog` VALUES ('260', '1', '127.0.0.1', '2020-11-07 14:22:58', '9');
INSERT INTO `userlog` VALUES ('261', '1', '127.0.0.1', '2020-11-07 14:23:00', '9');
INSERT INTO `userlog` VALUES ('262', '1', '127.0.0.1', '2020-11-07 14:23:00', '9');
INSERT INTO `userlog` VALUES ('263', '1', '127.0.0.1', '2020-11-07 14:23:01', '9');
INSERT INTO `userlog` VALUES ('264', '1', '127.0.0.1', '2020-11-07 14:23:01', '9');
INSERT INTO `userlog` VALUES ('265', '1', '127.0.0.1', '2020-11-07 14:23:03', '9');
INSERT INTO `userlog` VALUES ('266', '1', '127.0.0.1', '2020-11-07 14:23:03', '9');
INSERT INTO `userlog` VALUES ('267', '1', '127.0.0.1', '2020-11-07 14:23:04', '9');
INSERT INTO `userlog` VALUES ('268', '1', '127.0.0.1', '2020-11-07 14:23:05', '9');
INSERT INTO `userlog` VALUES ('269', '1', '127.0.0.1', '2020-11-07 14:23:09', '9');
INSERT INTO `userlog` VALUES ('270', '1', '127.0.0.1', '2020-11-07 14:23:09', '9');
INSERT INTO `userlog` VALUES ('271', '1', '127.0.0.1', '2020-11-07 14:23:11', '9');
INSERT INTO `userlog` VALUES ('272', '1', '127.0.0.1', '2020-11-07 14:23:11', '9');
INSERT INTO `userlog` VALUES ('273', '1', '127.0.0.1', '2020-11-07 14:23:13', '9');
INSERT INTO `userlog` VALUES ('274', '1', '127.0.0.1', '2020-11-07 14:23:13', '9');
INSERT INTO `userlog` VALUES ('275', '1', '127.0.0.1', '2020-11-07 14:23:15', '9');
INSERT INTO `userlog` VALUES ('276', '1', '127.0.0.1', '2020-11-07 14:23:17', '9');
INSERT INTO `userlog` VALUES ('277', '1', '127.0.0.1', '2020-11-07 14:23:20', '9');
INSERT INTO `userlog` VALUES ('278', '1', '127.0.0.1', '2020-11-07 14:23:38', '9');
INSERT INTO `userlog` VALUES ('279', '1', '127.0.0.1', '2020-11-07 14:23:42', '9');
INSERT INTO `userlog` VALUES ('280', '1', '127.0.0.1', '2020-11-07 14:25:37', '9');
INSERT INTO `userlog` VALUES ('281', '1', '127.0.0.1', '2020-11-07 14:25:39', '9');
INSERT INTO `userlog` VALUES ('282', '1', '127.0.0.1', '2020-11-07 14:25:43', '9');
INSERT INTO `userlog` VALUES ('283', '1', '127.0.0.1', '2020-11-07 14:25:46', '9');
INSERT INTO `userlog` VALUES ('284', '1', '127.0.0.1', '2020-11-07 14:25:54', '9');
INSERT INTO `userlog` VALUES ('285', '1', '127.0.0.1', '2020-11-07 14:30:49', '9');
INSERT INTO `userlog` VALUES ('286', '1', '127.0.0.1', '2020-11-07 14:34:24', '9');
INSERT INTO `userlog` VALUES ('287', '2', '127.0.0.1', '2020-11-07 14:35:08', null);
INSERT INTO `userlog` VALUES ('288', '2', '127.0.0.1', '2020-11-07 14:35:47', '9');
INSERT INTO `userlog` VALUES ('289', '2', '127.0.0.1', '2020-11-07 14:40:23', '9');
INSERT INTO `userlog` VALUES ('290', '2', '127.0.0.1', '2020-11-07 14:40:25', '9');
INSERT INTO `userlog` VALUES ('291', '2', '127.0.0.1', '2020-11-07 14:40:39', '11');
INSERT INTO `userlog` VALUES ('292', '2', '127.0.0.1', '2020-11-07 14:40:44', '11');
INSERT INTO `userlog` VALUES ('293', '2', '127.0.0.1', '2020-11-07 16:29:15', '14');
INSERT INTO `userlog` VALUES ('294', '2', '127.0.0.1', '2020-11-07 16:29:18', '12');
INSERT INTO `userlog` VALUES ('295', '2', '127.0.0.1', '2020-11-07 16:29:20', '11');
INSERT INTO `userlog` VALUES ('296', '2', '127.0.0.1', '2020-11-07 16:29:22', '10');
INSERT INTO `userlog` VALUES ('297', '2', '127.0.0.1', '2020-11-07 16:29:29', '9');
INSERT INTO `userlog` VALUES ('298', '2', '127.0.0.1', '2020-11-07 16:29:31', '13');
INSERT INTO `userlog` VALUES ('299', '2', '127.0.0.1', '2020-11-07 16:29:39', '10');
INSERT INTO `userlog` VALUES ('300', '2', '127.0.0.1', '2020-11-07 16:30:15', '10');
INSERT INTO `userlog` VALUES ('301', '2', '127.0.0.1', '2020-11-07 16:30:18', '10');
INSERT INTO `userlog` VALUES ('302', '2', '127.0.0.1', '2020-11-07 16:30:21', '10');
INSERT INTO `userlog` VALUES ('303', '2', '127.0.0.1', '2020-11-07 16:31:55', '15');
INSERT INTO `userlog` VALUES ('304', '2', '127.0.0.1', '2020-11-07 16:32:08', '15');
INSERT INTO `userlog` VALUES ('305', '2', '127.0.0.1', '2020-11-07 16:32:22', '15');
INSERT INTO `userlog` VALUES ('306', '2', '127.0.0.1', '2020-11-07 16:33:54', '15');
INSERT INTO `userlog` VALUES ('307', '2', '127.0.0.1', '2020-11-07 16:34:05', '16');
INSERT INTO `userlog` VALUES ('308', '2', '127.0.0.1', '2020-11-07 16:34:14', '9');
INSERT INTO `userlog` VALUES ('309', '2', '127.0.0.1', '2020-11-07 16:36:02', '17');
INSERT INTO `userlog` VALUES ('310', '2', '127.0.0.1', '2020-11-07 16:36:15', '17');
INSERT INTO `userlog` VALUES ('311', '2', '127.0.0.1', '2020-11-07 16:36:19', '17');
INSERT INTO `userlog` VALUES ('312', '2', '127.0.0.1', '2020-11-07 16:39:29', '19');
INSERT INTO `userlog` VALUES ('313', '2', '127.0.0.1', '2020-11-07 16:41:33', '19');
INSERT INTO `userlog` VALUES ('314', '2', '127.0.0.1', '2020-11-07 16:41:48', '19');
INSERT INTO `userlog` VALUES ('315', '2', '127.0.0.1', '2020-11-07 16:41:51', '19');
INSERT INTO `userlog` VALUES ('316', '2', '127.0.0.1', '2020-11-07 16:41:58', '9');
INSERT INTO `userlog` VALUES ('317', '2', '127.0.0.1', '2020-11-07 16:42:30', '9');
INSERT INTO `userlog` VALUES ('318', '2', '127.0.0.1', '2020-11-07 16:44:04', '9');
INSERT INTO `userlog` VALUES ('319', '2', '127.0.0.1', '2020-11-07 16:45:28', '9');
INSERT INTO `userlog` VALUES ('320', '2', '127.0.0.1', '2020-11-07 16:45:28', '9');
INSERT INTO `userlog` VALUES ('321', '2', '127.0.0.1', '2020-11-07 16:45:30', '9');
INSERT INTO `userlog` VALUES ('322', '2', '127.0.0.1', '2020-11-07 16:45:30', '9');
INSERT INTO `userlog` VALUES ('323', '2', '127.0.0.1', '2020-11-07 16:45:32', '9');
INSERT INTO `userlog` VALUES ('324', '2', '127.0.0.1', '2020-11-07 16:45:32', '9');
INSERT INTO `userlog` VALUES ('325', '2', '127.0.0.1', '2020-11-07 16:45:33', '9');
INSERT INTO `userlog` VALUES ('326', '2', '127.0.0.1', '2020-11-07 16:45:33', '9');
INSERT INTO `userlog` VALUES ('327', '2', '127.0.0.1', '2020-11-07 16:45:35', '9');
INSERT INTO `userlog` VALUES ('328', '2', '127.0.0.1', '2020-11-07 16:45:35', '9');
INSERT INTO `userlog` VALUES ('329', '2', '127.0.0.1', '2020-11-07 16:45:36', '9');
INSERT INTO `userlog` VALUES ('330', '2', '127.0.0.1', '2020-11-07 16:45:36', '9');
INSERT INTO `userlog` VALUES ('331', '2', '127.0.0.1', '2020-11-07 16:45:38', '9');
INSERT INTO `userlog` VALUES ('332', '2', '127.0.0.1', '2020-11-07 16:45:38', '9');
INSERT INTO `userlog` VALUES ('333', '2', '127.0.0.1', '2020-11-07 16:45:39', '9');
INSERT INTO `userlog` VALUES ('334', '2', '127.0.0.1', '2020-11-07 16:45:39', '9');
INSERT INTO `userlog` VALUES ('335', '2', '127.0.0.1', '2020-11-07 16:45:41', '9');
INSERT INTO `userlog` VALUES ('336', '2', '127.0.0.1', '2020-11-07 16:45:41', '9');
INSERT INTO `userlog` VALUES ('337', '2', '127.0.0.1', '2020-11-07 16:45:44', '9');
INSERT INTO `userlog` VALUES ('338', '2', '127.0.0.1', '2020-11-07 16:45:46', '9');
INSERT INTO `userlog` VALUES ('339', '2', '127.0.0.1', '2020-11-07 16:45:48', '9');
INSERT INTO `userlog` VALUES ('340', '2', '127.0.0.1', '2020-11-07 16:45:51', '9');
INSERT INTO `userlog` VALUES ('341', '2', '127.0.0.1', '2020-11-07 16:45:56', '9');
INSERT INTO `userlog` VALUES ('342', '2', '127.0.0.1', '2020-11-07 16:45:56', '9');
INSERT INTO `userlog` VALUES ('343', '2', '127.0.0.1', '2020-11-07 16:45:58', '9');
INSERT INTO `userlog` VALUES ('344', '2', '127.0.0.1', '2020-11-07 16:45:58', '9');
INSERT INTO `userlog` VALUES ('345', '2', '127.0.0.1', '2020-11-07 16:45:59', '9');
INSERT INTO `userlog` VALUES ('346', '2', '127.0.0.1', '2020-11-07 16:45:59', '9');
INSERT INTO `userlog` VALUES ('347', '2', '127.0.0.1', '2020-11-07 16:46:01', '9');
INSERT INTO `userlog` VALUES ('348', '2', '127.0.0.1', '2020-11-07 16:46:01', '9');
INSERT INTO `userlog` VALUES ('349', '2', '127.0.0.1', '2020-11-07 16:46:02', '9');
INSERT INTO `userlog` VALUES ('350', '2', '127.0.0.1', '2020-11-07 16:46:02', '9');
INSERT INTO `userlog` VALUES ('351', '2', '127.0.0.1', '2020-11-07 16:46:03', '9');
INSERT INTO `userlog` VALUES ('352', '2', '127.0.0.1', '2020-11-07 16:46:03', '9');
INSERT INTO `userlog` VALUES ('353', '2', '127.0.0.1', '2020-11-07 16:46:05', '9');
INSERT INTO `userlog` VALUES ('354', '2', '127.0.0.1', '2020-11-07 16:46:05', '9');
INSERT INTO `userlog` VALUES ('355', '2', '127.0.0.1', '2020-11-07 16:46:06', '9');
INSERT INTO `userlog` VALUES ('356', '2', '127.0.0.1', '2020-11-07 16:46:06', '9');
INSERT INTO `userlog` VALUES ('357', '2', '127.0.0.1', '2020-11-07 16:46:08', '9');
INSERT INTO `userlog` VALUES ('358', '2', '127.0.0.1', '2020-11-07 16:46:08', '9');
INSERT INTO `userlog` VALUES ('359', '2', '127.0.0.1', '2020-11-07 16:46:09', '9');
INSERT INTO `userlog` VALUES ('360', '2', '127.0.0.1', '2020-11-07 16:46:09', '9');
INSERT INTO `userlog` VALUES ('361', '2', '127.0.0.1', '2020-11-07 16:46:12', '9');
INSERT INTO `userlog` VALUES ('362', '2', '127.0.0.1', '2020-11-07 16:46:15', '9');
INSERT INTO `userlog` VALUES ('363', '2', '127.0.0.1', '2020-11-07 16:46:18', '9');
INSERT INTO `userlog` VALUES ('364', '2', '127.0.0.1', '2020-11-07 16:46:20', '9');
INSERT INTO `userlog` VALUES ('365', '2', '127.0.0.1', '2020-11-07 16:46:23', '9');
INSERT INTO `userlog` VALUES ('366', '2', '127.0.0.1', '2020-11-07 16:46:26', '9');
INSERT INTO `userlog` VALUES ('367', '2', '127.0.0.1', '2020-11-07 16:46:29', '9');
INSERT INTO `userlog` VALUES ('368', '2', '127.0.0.1', '2020-11-07 16:46:32', '9');
INSERT INTO `userlog` VALUES ('369', '2', '127.0.0.1', '2020-11-07 16:46:34', '9');
INSERT INTO `userlog` VALUES ('370', '2', '127.0.0.1', '2020-11-07 16:46:50', '9');
INSERT INTO `userlog` VALUES ('371', '2', '127.0.0.1', '2020-11-07 16:46:51', '9');
INSERT INTO `userlog` VALUES ('372', '2', '127.0.0.1', '2020-11-07 16:47:49', '9');
INSERT INTO `userlog` VALUES ('373', '2', '127.0.0.1', '2020-11-07 16:47:52', '9');
INSERT INTO `userlog` VALUES ('374', '2', '127.0.0.1', '2020-11-07 16:47:52', '9');
INSERT INTO `userlog` VALUES ('375', '2', '127.0.0.1', '2020-11-07 16:47:55', '9');
INSERT INTO `userlog` VALUES ('376', '2', '127.0.0.1', '2020-11-07 16:47:55', '9');
INSERT INTO `userlog` VALUES ('377', '2', '127.0.0.1', '2020-11-07 16:47:57', '9');
INSERT INTO `userlog` VALUES ('378', '2', '127.0.0.1', '2020-11-07 16:47:57', '9');
INSERT INTO `userlog` VALUES ('379', '2', '127.0.0.1', '2020-11-07 16:47:58', '9');
INSERT INTO `userlog` VALUES ('380', '2', '127.0.0.1', '2020-11-07 16:47:58', '9');
INSERT INTO `userlog` VALUES ('381', '2', '127.0.0.1', '2020-11-07 16:47:59', '9');
INSERT INTO `userlog` VALUES ('382', '2', '127.0.0.1', '2020-11-07 16:47:59', '9');
INSERT INTO `userlog` VALUES ('383', '2', '127.0.0.1', '2020-11-07 16:48:01', '9');
INSERT INTO `userlog` VALUES ('384', '2', '127.0.0.1', '2020-11-07 16:48:01', '9');
INSERT INTO `userlog` VALUES ('385', '2', '127.0.0.1', '2020-11-07 16:48:02', '9');
INSERT INTO `userlog` VALUES ('386', '2', '127.0.0.1', '2020-11-07 16:48:02', '9');
INSERT INTO `userlog` VALUES ('387', '2', '127.0.0.1', '2020-11-07 16:48:04', '9');
INSERT INTO `userlog` VALUES ('388', '2', '127.0.0.1', '2020-11-07 16:48:04', '9');
INSERT INTO `userlog` VALUES ('389', '2', '127.0.0.1', '2020-11-07 16:48:06', '9');
INSERT INTO `userlog` VALUES ('390', '2', '127.0.0.1', '2020-11-07 16:48:16', '9');
INSERT INTO `userlog` VALUES ('391', '2', '127.0.0.1', '2020-11-07 16:48:16', '9');
INSERT INTO `userlog` VALUES ('392', '2', '127.0.0.1', '2020-11-07 16:48:18', '9');
INSERT INTO `userlog` VALUES ('393', '2', '127.0.0.1', '2020-11-07 16:48:18', '9');
INSERT INTO `userlog` VALUES ('394', '2', '127.0.0.1', '2020-11-07 16:48:19', '9');
INSERT INTO `userlog` VALUES ('395', '2', '127.0.0.1', '2020-11-07 16:48:19', '9');
INSERT INTO `userlog` VALUES ('396', '2', '127.0.0.1', '2020-11-07 16:48:21', '9');
INSERT INTO `userlog` VALUES ('397', '2', '127.0.0.1', '2020-11-07 16:48:21', '9');
INSERT INTO `userlog` VALUES ('398', '2', '127.0.0.1', '2020-11-07 16:48:22', '9');
INSERT INTO `userlog` VALUES ('399', '2', '127.0.0.1', '2020-11-07 16:48:22', '9');
INSERT INTO `userlog` VALUES ('400', '2', '127.0.0.1', '2020-11-07 16:48:24', '9');
INSERT INTO `userlog` VALUES ('401', '2', '127.0.0.1', '2020-11-07 16:48:24', '9');
INSERT INTO `userlog` VALUES ('402', '2', '127.0.0.1', '2020-11-07 16:48:25', '9');
INSERT INTO `userlog` VALUES ('403', '2', '127.0.0.1', '2020-11-07 16:48:25', '9');
INSERT INTO `userlog` VALUES ('404', '2', '127.0.0.1', '2020-11-07 16:48:27', '9');
INSERT INTO `userlog` VALUES ('405', '2', '127.0.0.1', '2020-11-07 16:48:27', '9');
INSERT INTO `userlog` VALUES ('406', '2', '127.0.0.1', '2020-11-07 16:48:50', '9');
INSERT INTO `userlog` VALUES ('407', '2', '127.0.0.1', '2020-11-07 16:48:52', '9');
INSERT INTO `userlog` VALUES ('408', '2', '127.0.0.1', '2020-11-07 16:48:55', '9');
INSERT INTO `userlog` VALUES ('409', '2', '127.0.0.1', '2020-11-07 16:49:13', '19');
INSERT INTO `userlog` VALUES ('410', '2', '127.0.0.1', '2020-11-07 16:55:54', '19');
INSERT INTO `userlog` VALUES ('411', '2', '127.0.0.1', '2020-11-07 16:56:01', '19');
INSERT INTO `userlog` VALUES ('412', '2', '127.0.0.1', '2020-11-07 16:56:08', '19');
INSERT INTO `userlog` VALUES ('413', '2', '127.0.0.1', '2020-11-07 16:56:12', '19');
INSERT INTO `userlog` VALUES ('414', '2', '127.0.0.1', '2020-11-07 18:01:13', '19');
INSERT INTO `userlog` VALUES ('415', '3', '127.0.0.1', '2020-11-08 10:55:51', null);
INSERT INTO `userlog` VALUES ('416', '3', '127.0.0.1', '2020-11-08 10:56:16', '19');
INSERT INTO `userlog` VALUES ('417', '3', '127.0.0.1', '2020-11-08 10:56:45', '19');
INSERT INTO `userlog` VALUES ('418', '3', '127.0.0.1', '2020-11-08 10:56:45', '19');
INSERT INTO `userlog` VALUES ('419', '3', '127.0.0.1', '2020-11-08 10:56:49', '19');
INSERT INTO `userlog` VALUES ('420', '3', '127.0.0.1', '2020-11-08 10:56:56', '18');
INSERT INTO `userlog` VALUES ('421', '3', '127.0.0.1', '2020-11-08 10:57:11', '18');
INSERT INTO `userlog` VALUES ('422', '3', '127.0.0.1', '2020-11-08 10:57:11', '18');
INSERT INTO `userlog` VALUES ('423', '3', '127.0.0.1', '2020-11-08 10:57:14', '18');
INSERT INTO `userlog` VALUES ('424', '3', '127.0.0.1', '2020-11-08 10:57:24', '20');
INSERT INTO `userlog` VALUES ('425', '3', '127.0.0.1', '2020-11-08 10:58:08', '20');
INSERT INTO `userlog` VALUES ('426', '3', '127.0.0.1', '2020-11-08 10:58:08', '20');
INSERT INTO `userlog` VALUES ('427', '3', '127.0.0.1', '2020-11-08 10:58:20', '13');
INSERT INTO `userlog` VALUES ('428', '3', '127.0.0.1', '2020-11-08 10:58:50', '13');
INSERT INTO `userlog` VALUES ('429', '3', '127.0.0.1', '2020-11-08 10:58:50', '13');
INSERT INTO `userlog` VALUES ('430', '3', '127.0.0.1', '2020-11-08 10:59:08', '10');
INSERT INTO `userlog` VALUES ('431', '3', '127.0.0.1', '2020-11-08 11:00:00', '10');
INSERT INTO `userlog` VALUES ('432', '3', '127.0.0.1', '2020-11-08 11:00:00', '10');
INSERT INTO `userlog` VALUES ('433', '3', '127.0.0.1', '2020-11-08 11:00:15', '10');
INSERT INTO `userlog` VALUES ('434', '3', '127.0.0.1', '2020-11-08 11:00:23', '15');
INSERT INTO `userlog` VALUES ('435', '3', '127.0.0.1', '2020-11-08 11:00:48', '15');
INSERT INTO `userlog` VALUES ('436', '3', '127.0.0.1', '2020-11-08 11:00:48', '15');
INSERT INTO `userlog` VALUES ('437', '3', '127.0.0.1', '2020-11-08 11:00:55', '14');
INSERT INTO `userlog` VALUES ('438', '3', '127.0.0.1', '2020-11-08 11:01:54', '14');
INSERT INTO `userlog` VALUES ('439', '3', '127.0.0.1', '2020-11-08 11:01:54', '14');
INSERT INTO `userlog` VALUES ('440', '3', '127.0.0.1', '2020-11-08 11:02:02', '12');
INSERT INTO `userlog` VALUES ('441', '3', '127.0.0.1', '2020-11-08 11:03:06', '12');
INSERT INTO `userlog` VALUES ('442', '3', '127.0.0.1', '2020-11-08 11:03:06', '12');
INSERT INTO `userlog` VALUES ('443', '3', '127.0.0.1', '2020-11-08 11:03:17', '17');
INSERT INTO `userlog` VALUES ('444', '3', '127.0.0.1', '2020-11-08 11:03:51', '17');
INSERT INTO `userlog` VALUES ('445', '3', '127.0.0.1', '2020-11-08 11:03:51', '17');
INSERT INTO `userlog` VALUES ('446', '3', '127.0.0.1', '2020-11-08 11:03:54', '17');
INSERT INTO `userlog` VALUES ('447', '3', '127.0.0.1', '2020-11-08 11:04:01', '17');
INSERT INTO `userlog` VALUES ('448', '3', '127.0.0.1', '2020-11-08 11:04:21', '19');
INSERT INTO `userlog` VALUES ('449', '3', '127.0.0.1', '2020-11-08 11:04:23', '19');
INSERT INTO `userlog` VALUES ('450', '3', '127.0.0.1', '2020-11-08 11:04:49', '19');
INSERT INTO `userlog` VALUES ('451', '3', '127.0.0.1', '2020-11-08 11:04:50', '19');
INSERT INTO `userlog` VALUES ('452', '3', '127.0.0.1', '2020-11-08 11:05:29', '16');
INSERT INTO `userlog` VALUES ('453', '3', '127.0.0.1', '2020-11-08 11:05:55', '16');
INSERT INTO `userlog` VALUES ('454', '3', '127.0.0.1', '2020-11-08 11:05:55', '16');
INSERT INTO `userlog` VALUES ('455', '3', '127.0.0.1', '2020-11-08 11:05:59', '16');
INSERT INTO `userlog` VALUES ('456', '3', '127.0.0.1', '2020-11-08 11:06:19', '16');
INSERT INTO `userlog` VALUES ('457', '3', '127.0.0.1', '2020-11-08 11:07:08', '19');
INSERT INTO `userlog` VALUES ('458', '3', '127.0.0.1', '2020-11-08 11:07:10', '19');
INSERT INTO `userlog` VALUES ('459', '3', '127.0.0.1', '2020-11-08 11:07:33', '19');
INSERT INTO `userlog` VALUES ('460', '3', '127.0.0.1', '2020-11-08 11:07:55', '9');
INSERT INTO `userlog` VALUES ('461', '3', '127.0.0.1', '2020-11-08 11:08:02', '19');
INSERT INTO `userlog` VALUES ('462', '3', '127.0.0.1', '2020-11-08 11:08:10', '19');
INSERT INTO `userlog` VALUES ('463', '3', '127.0.0.1', '2020-11-08 11:08:31', '19');
INSERT INTO `userlog` VALUES ('464', '3', '127.0.0.1', '2020-11-08 11:09:27', '13');
INSERT INTO `userlog` VALUES ('465', '3', '127.0.0.1', '2020-11-08 11:09:30', '19');
INSERT INTO `userlog` VALUES ('466', '3', '127.0.0.1', '2020-11-08 11:09:33', '9');
INSERT INTO `userlog` VALUES ('467', '3', '127.0.0.1', '2020-11-08 11:09:37', '15');
INSERT INTO `userlog` VALUES ('468', '3', '127.0.0.1', '2020-11-08 11:09:40', '12');
INSERT INTO `userlog` VALUES ('469', '3', '127.0.0.1', '2020-11-08 11:09:44', '17');
INSERT INTO `userlog` VALUES ('470', '3', '127.0.0.1', '2020-11-08 11:09:46', '16');
INSERT INTO `userlog` VALUES ('471', '3', '127.0.0.1', '2020-11-08 11:09:51', '10');
INSERT INTO `userlog` VALUES ('472', '3', '127.0.0.1', '2020-11-08 11:09:54', '11');
INSERT INTO `userlog` VALUES ('473', '1', '127.0.0.1', '2020-11-08 11:10:28', null);
INSERT INTO `userlog` VALUES ('474', '1', '127.0.0.1', '2020-11-08 11:10:35', '19');
INSERT INTO `userlog` VALUES ('475', '3', '127.0.0.1', '2020-11-08 11:11:06', null);
INSERT INTO `userlog` VALUES ('476', '3', '127.0.0.1', '2020-11-08 11:11:18', '9');
INSERT INTO `userlog` VALUES ('477', '3', '127.0.0.1', '2020-11-08 11:11:20', '10');
INSERT INTO `userlog` VALUES ('478', '3', '127.0.0.1', '2020-11-08 11:11:22', '11');
INSERT INTO `userlog` VALUES ('479', '3', '127.0.0.1', '2020-11-08 11:11:24', '13');
INSERT INTO `userlog` VALUES ('480', '3', '127.0.0.1', '2020-11-08 11:11:26', '15');
INSERT INTO `userlog` VALUES ('481', '3', '127.0.0.1', '2020-11-08 11:11:28', '16');
INSERT INTO `userlog` VALUES ('482', '3', '127.0.0.1', '2020-11-08 11:11:31', '17');
INSERT INTO `userlog` VALUES ('483', '3', '127.0.0.1', '2020-11-08 11:11:33', '18');
INSERT INTO `userlog` VALUES ('484', '3', '127.0.0.1', '2020-11-08 11:11:35', '19');
INSERT INTO `userlog` VALUES ('485', '3', '127.0.0.1', '2020-11-08 11:11:54', '11');
INSERT INTO `userlog` VALUES ('486', '3', '127.0.0.1', '2020-11-08 11:12:15', '11');
INSERT INTO `userlog` VALUES ('487', '3', '127.0.0.1', '2020-11-08 11:12:15', '11');
INSERT INTO `userlog` VALUES ('488', '3', '127.0.0.1', '2020-11-08 11:12:17', '11');
INSERT INTO `userlog` VALUES ('489', '3', '127.0.0.1', '2020-11-08 11:12:41', '9');
INSERT INTO `userlog` VALUES ('490', '3', '127.0.0.1', '2020-11-08 11:12:43', '9');
INSERT INTO `userlog` VALUES ('491', '3', '127.0.0.1', '2020-11-08 11:12:49', '9');
INSERT INTO `userlog` VALUES ('492', '3', '127.0.0.1', '2020-11-08 11:12:54', '9');
INSERT INTO `userlog` VALUES ('493', '3', '127.0.0.1', '2020-11-08 11:12:56', '9');
INSERT INTO `userlog` VALUES ('494', '3', '127.0.0.1', '2020-11-08 11:15:46', '19');
INSERT INTO `userlog` VALUES ('495', '3', '127.0.0.1', '2020-11-08 11:16:27', '19');
INSERT INTO `userlog` VALUES ('496', '3', '127.0.0.1', '2020-11-08 11:16:31', '19');
INSERT INTO `userlog` VALUES ('497', '3', '127.0.0.1', '2020-11-08 11:17:04', '19');
INSERT INTO `userlog` VALUES ('498', '3', '127.0.0.1', '2020-11-08 11:22:55', '19');
INSERT INTO `userlog` VALUES ('499', '3', '127.0.0.1', '2020-11-08 11:23:04', '18');
INSERT INTO `userlog` VALUES ('500', '3', '127.0.0.1', '2020-11-08 11:23:07', '11');
INSERT INTO `userlog` VALUES ('501', '3', '127.0.0.1', '2020-11-08 11:23:13', '10');
INSERT INTO `userlog` VALUES ('502', '3', '127.0.0.1', '2020-11-08 11:23:30', '9');
INSERT INTO `userlog` VALUES ('503', '3', '127.0.0.1', '2020-11-08 11:23:34', '9');
INSERT INTO `userlog` VALUES ('504', '3', '127.0.0.1', '2020-11-08 11:23:41', '9');
INSERT INTO `userlog` VALUES ('505', '3', '127.0.0.1', '2020-11-08 11:25:18', '9');
INSERT INTO `userlog` VALUES ('506', '3', '127.0.0.1', '2020-11-08 11:27:03', '19');
INSERT INTO `userlog` VALUES ('507', '3', '127.0.0.1', '2020-11-08 12:01:21', '19');
INSERT INTO `userlog` VALUES ('508', '3', '127.0.0.1', '2020-11-08 12:21:30', null);
INSERT INTO `userlog` VALUES ('509', '3', '127.0.0.1', '2020-11-08 12:21:35', '19');
INSERT INTO `userlog` VALUES ('510', '3', '127.0.0.1', '2020-11-08 12:21:44', '19');
INSERT INTO `userlog` VALUES ('511', '3', '127.0.0.1', '2020-11-08 12:21:47', '19');
INSERT INTO `userlog` VALUES ('512', '3', '127.0.0.1', '2020-11-08 12:45:43', '19');
INSERT INTO `userlog` VALUES ('513', '3', '127.0.0.1', '2020-11-08 12:54:54', '19');
INSERT INTO `userlog` VALUES ('514', '3', '127.0.0.1', '2020-11-08 12:54:58', '19');
INSERT INTO `userlog` VALUES ('515', '3', '127.0.0.1', '2020-11-08 12:55:07', '19');
INSERT INTO `userlog` VALUES ('516', '3', '127.0.0.1', '2020-11-08 12:55:08', '19');
INSERT INTO `userlog` VALUES ('517', '3', '127.0.0.1', '2020-11-08 19:20:37', '19');
INSERT INTO `userlog` VALUES ('518', '3', '127.0.0.1', '2020-11-08 19:20:43', '19');
INSERT INTO `userlog` VALUES ('519', '3', '127.0.0.1', '2020-11-08 19:20:59', '13');
INSERT INTO `userlog` VALUES ('520', '3', '127.0.0.1', '2020-11-08 19:21:01', '13');
INSERT INTO `userlog` VALUES ('521', '3', '127.0.0.1', '2020-11-08 19:21:05', '13');
INSERT INTO `userlog` VALUES ('522', '3', '127.0.0.1', '2020-11-08 19:26:34', '19');
INSERT INTO `userlog` VALUES ('523', '2', '127.0.0.1', '2020-11-12 03:39:21', null);
INSERT INTO `userlog` VALUES ('524', '2', '127.0.0.1', '2020-11-12 09:02:54', '19');
INSERT INTO `userlog` VALUES ('525', '2', '127.0.0.1', '2020-11-12 09:02:56', '19');
INSERT INTO `userlog` VALUES ('526', '2', '127.0.0.1', '2020-11-12 09:03:00', '9');
INSERT INTO `userlog` VALUES ('527', '2', '127.0.0.1', '2020-11-12 09:03:02', '9');
INSERT INTO `userlog` VALUES ('528', '2', '127.0.0.1', '2020-11-12 09:05:06', '13');
INSERT INTO `userlog` VALUES ('529', '2', '127.0.0.1', '2020-11-12 09:05:22', '9');
INSERT INTO `userlog` VALUES ('530', '2', '127.0.0.1', '2020-11-12 09:05:34', '9');
INSERT INTO `userlog` VALUES ('531', '2', '127.0.0.1', '2020-11-12 09:05:37', '9');
INSERT INTO `userlog` VALUES ('532', '2', '127.0.0.1', '2020-11-12 09:05:43', '15');
INSERT INTO `userlog` VALUES ('533', '2', '127.0.0.1', '2020-11-12 09:05:45', '15');
INSERT INTO `userlog` VALUES ('534', '2', '127.0.0.1', '2020-11-12 09:05:57', '18');
INSERT INTO `userlog` VALUES ('535', '2', '127.0.0.1', '2020-11-12 09:06:06', '9');
INSERT INTO `userlog` VALUES ('536', '2', '127.0.0.1', '2020-11-12 09:06:10', '20');
INSERT INTO `userlog` VALUES ('537', '2', '127.0.0.1', '2020-11-12 09:06:23', '18');
INSERT INTO `userlog` VALUES ('538', '2', '127.0.0.1', '2020-11-12 09:06:28', '9');
INSERT INTO `userlog` VALUES ('539', '2', '127.0.0.1', '2020-11-12 09:06:31', '11');
INSERT INTO `userlog` VALUES ('540', '2', '127.0.0.1', '2020-11-12 09:06:35', '14');
INSERT INTO `userlog` VALUES ('541', '2', '127.0.0.1', '2020-11-12 09:06:38', '14');
INSERT INTO `userlog` VALUES ('542', '2', '127.0.0.1', '2020-11-12 09:06:46', '12');
INSERT INTO `userlog` VALUES ('543', '2', '127.0.0.1', '2020-11-12 09:06:58', '15');
INSERT INTO `userlog` VALUES ('544', '2', '127.0.0.1', '2020-11-12 09:07:05', '20');
INSERT INTO `userlog` VALUES ('545', '2', '127.0.0.1', '2020-11-12 09:07:41', '15');
INSERT INTO `userlog` VALUES ('546', '2', '127.0.0.1', '2020-11-12 09:07:43', '15');
INSERT INTO `userlog` VALUES ('547', '2', '127.0.0.1', '2020-11-12 09:08:02', '20');
INSERT INTO `userlog` VALUES ('548', '2', '127.0.0.1', '2020-11-12 09:08:06', '20');
INSERT INTO `userlog` VALUES ('549', '2', '127.0.0.1', '2020-11-12 09:08:08', '12');
INSERT INTO `userlog` VALUES ('550', '2', '127.0.0.1', '2020-11-12 09:08:14', '20');
INSERT INTO `userlog` VALUES ('551', '2', '127.0.0.1', '2020-11-12 09:08:15', '20');
INSERT INTO `userlog` VALUES ('552', '2', '127.0.0.1', '2020-11-12 09:08:20', '12');
INSERT INTO `userlog` VALUES ('553', '2', '127.0.0.1', '2020-11-12 09:08:48', '9');
INSERT INTO `userlog` VALUES ('554', '2', '127.0.0.1', '2020-11-12 09:08:51', '17');
INSERT INTO `userlog` VALUES ('555', '2', '127.0.0.1', '2020-11-12 09:08:58', '16');
INSERT INTO `userlog` VALUES ('556', '2', '127.0.0.1', '2020-11-12 09:09:02', '19');
INSERT INTO `userlog` VALUES ('557', '2', '127.0.0.1', '2020-11-12 09:09:06', '10');
INSERT INTO `userlog` VALUES ('558', '2', '127.0.0.1', '2020-11-12 09:09:20', '19');
INSERT INTO `userlog` VALUES ('559', '2', '127.0.0.1', '2020-11-12 09:09:23', '18');
INSERT INTO `userlog` VALUES ('560', '2', '127.0.0.1', '2020-11-12 09:09:25', '18');
INSERT INTO `userlog` VALUES ('561', '2', '127.0.0.1', '2020-11-12 09:11:24', null);
INSERT INTO `userlog` VALUES ('562', '2', '127.0.0.1', '2020-11-12 09:11:29', '19');
INSERT INTO `userlog` VALUES ('563', '2', '127.0.0.1', '2020-11-12 09:11:30', '19');
INSERT INTO `userlog` VALUES ('564', '2', '127.0.0.1', '2020-11-12 09:11:39', '19');
INSERT INTO `userlog` VALUES ('565', '2', '127.0.0.1', '2020-11-12 09:11:47', '19');
INSERT INTO `userlog` VALUES ('566', '2', '127.0.0.1', '2020-11-12 09:11:53', '20');
INSERT INTO `userlog` VALUES ('567', '2', '127.0.0.1', '2020-11-12 09:12:30', '12');
INSERT INTO `userlog` VALUES ('568', '2', '127.0.0.1', '2020-11-12 09:12:44', '16');
INSERT INTO `userlog` VALUES ('569', '2', '127.0.0.1', '2020-11-12 09:12:49', '17');
INSERT INTO `userlog` VALUES ('570', '2', '127.0.0.1', '2020-11-12 09:12:53', '16');
INSERT INTO `userlog` VALUES ('571', '2', '127.0.0.1', '2020-11-12 09:12:55', '16');
INSERT INTO `userlog` VALUES ('572', '2', '127.0.0.1', '2020-11-12 09:13:01', '19');
INSERT INTO `userlog` VALUES ('573', '2', '127.0.0.1', '2020-11-12 09:13:05', '9');
INSERT INTO `userlog` VALUES ('574', '2', '127.0.0.1', '2020-11-12 09:13:09', '18');
INSERT INTO `userlog` VALUES ('575', '2', '127.0.0.1', '2020-11-12 09:13:12', '20');
INSERT INTO `userlog` VALUES ('576', '2', '127.0.0.1', '2020-11-12 09:13:15', '12');
INSERT INTO `userlog` VALUES ('577', '2', '127.0.0.1', '2020-11-12 09:13:18', '13');
INSERT INTO `userlog` VALUES ('578', '2', '127.0.0.1', '2020-11-12 09:13:29', '15');
INSERT INTO `userlog` VALUES ('579', '2', '127.0.0.1', '2020-11-12 09:13:32', '15');
INSERT INTO `userlog` VALUES ('580', '2', '127.0.0.1', '2020-11-12 09:13:36', '14');
INSERT INTO `userlog` VALUES ('581', '2', '127.0.0.1', '2020-11-12 09:13:44', '11');
INSERT INTO `userlog` VALUES ('582', '2', '127.0.0.1', '2020-11-12 09:13:46', '11');
INSERT INTO `userlog` VALUES ('583', '2', '127.0.0.1', '2020-11-12 09:13:48', '10');
INSERT INTO `userlog` VALUES ('584', '2', '127.0.0.1', '2020-11-12 09:13:49', '10');
INSERT INTO `userlog` VALUES ('585', '2', '127.0.0.1', '2020-11-12 09:13:59', '19');
INSERT INTO `userlog` VALUES ('586', '3', '127.0.0.1', '2020-11-12 09:16:44', null);
INSERT INTO `userlog` VALUES ('587', '3', '127.0.0.1', '2020-11-12 09:17:05', '17');
INSERT INTO `userlog` VALUES ('588', '3', '127.0.0.1', '2020-11-12 09:17:11', '10');
INSERT INTO `userlog` VALUES ('589', '3', '127.0.0.1', '2020-11-12 09:17:23', '16');
INSERT INTO `userlog` VALUES ('590', '3', '127.0.0.1', '2020-11-12 09:17:26', '16');
INSERT INTO `userlog` VALUES ('591', '3', '127.0.0.1', '2020-11-12 09:17:29', '12');
INSERT INTO `userlog` VALUES ('592', '3', '127.0.0.1', '2020-11-12 09:17:34', '14');
INSERT INTO `userlog` VALUES ('593', '3', '127.0.0.1', '2020-11-12 09:17:35', '14');
INSERT INTO `userlog` VALUES ('594', '3', '127.0.0.1', '2020-11-12 09:17:39', '20');
INSERT INTO `userlog` VALUES ('595', '3', '127.0.0.1', '2020-11-12 09:17:43', '11');
INSERT INTO `userlog` VALUES ('596', '3', '127.0.0.1', '2020-11-12 09:17:45', '11');
INSERT INTO `userlog` VALUES ('597', '3', '127.0.0.1', '2020-11-12 09:17:47', '11');
INSERT INTO `userlog` VALUES ('598', '3', '127.0.0.1', '2020-11-12 09:17:48', '11');
INSERT INTO `userlog` VALUES ('599', '3', '127.0.0.1', '2020-11-12 09:19:23', '20');
INSERT INTO `userlog` VALUES ('600', '3', '127.0.0.1', '2020-11-12 09:19:26', '18');
INSERT INTO `userlog` VALUES ('601', '3', '127.0.0.1', '2020-11-12 09:19:28', '18');
INSERT INTO `userlog` VALUES ('602', '3', '127.0.0.1', '2020-11-12 09:19:35', '15');
INSERT INTO `userlog` VALUES ('603', '3', '127.0.0.1', '2020-11-12 09:19:37', '15');
INSERT INTO `userlog` VALUES ('604', '3', '127.0.0.1', '2020-11-12 09:19:42', '9');
INSERT INTO `userlog` VALUES ('605', '3', '127.0.0.1', '2020-11-12 09:19:45', '13');
INSERT INTO `userlog` VALUES ('606', '3', '127.0.0.1', '2020-11-12 09:19:47', '13');
INSERT INTO `userlog` VALUES ('607', '3', '127.0.0.1', '2020-11-12 09:19:51', '19');
INSERT INTO `userlog` VALUES ('608', '3', '127.0.0.1', '2020-11-12 09:19:55', '9');
INSERT INTO `userlog` VALUES ('609', '3', '127.0.0.1', '2020-11-12 09:22:05', '19');
INSERT INTO `userlog` VALUES ('610', '2', '127.0.0.1', '2020-11-14 08:55:19', null);
INSERT INTO `userlog` VALUES ('611', '2', '127.0.0.1', '2020-11-14 08:55:24', '19');
INSERT INTO `userlog` VALUES ('612', '2', '127.0.0.1', '2020-11-14 08:55:26', '19');
INSERT INTO `userlog` VALUES ('613', '2', '127.0.0.1', '2020-11-14 08:55:28', '9');
INSERT INTO `userlog` VALUES ('614', '2', '127.0.0.1', '2020-11-14 08:55:32', '9');
INSERT INTO `userlog` VALUES ('615', '2', '127.0.0.1', '2020-11-14 08:55:35', '9');
INSERT INTO `userlog` VALUES ('616', '2', '127.0.0.1', '2020-11-14 08:55:40', '9');
INSERT INTO `userlog` VALUES ('617', '2', '127.0.0.1', '2020-11-14 08:55:45', '9');
INSERT INTO `userlog` VALUES ('618', '2', '127.0.0.1', '2020-11-14 08:58:01', '19');
INSERT INTO `userlog` VALUES ('619', '2', '127.0.0.1', '2020-11-14 08:58:02', '19');
INSERT INTO `userlog` VALUES ('620', '2', '127.0.0.1', '2020-11-14 08:58:12', '18');
INSERT INTO `userlog` VALUES ('621', '2', '127.0.0.1', '2020-11-14 08:59:30', '16');
INSERT INTO `userlog` VALUES ('622', '2', '127.0.0.1', '2020-11-14 08:59:35', '18');
INSERT INTO `userlog` VALUES ('623', '2', '127.0.0.1', '2020-11-14 08:59:38', '9');
INSERT INTO `userlog` VALUES ('624', '2', '127.0.0.1', '2020-11-14 08:59:41', '9');
INSERT INTO `userlog` VALUES ('625', '2', '127.0.0.1', '2020-11-14 08:59:44', '9');
INSERT INTO `userlog` VALUES ('626', '2', '127.0.0.1', '2020-11-14 09:12:19', '19');
INSERT INTO `userlog` VALUES ('627', '2', '127.0.0.1', '2020-11-14 09:12:21', '19');
INSERT INTO `userlog` VALUES ('628', '2', '127.0.0.1', '2020-11-14 09:12:25', '9');
INSERT INTO `userlog` VALUES ('629', '2', '127.0.0.1', '2020-11-14 09:12:27', '9');
INSERT INTO `userlog` VALUES ('630', '2', '127.0.0.1', '2020-11-14 09:15:23', '9');
INSERT INTO `userlog` VALUES ('631', '2', '127.0.0.1', '2020-11-14 09:15:30', '10');
INSERT INTO `userlog` VALUES ('632', '2', '127.0.0.1', '2020-11-14 09:15:43', '19');
INSERT INTO `userlog` VALUES ('633', '2', '127.0.0.1', '2020-11-14 09:15:57', '19');
INSERT INTO `userlog` VALUES ('634', '2', '127.0.0.1', '2020-11-14 12:17:16', '19');
INSERT INTO `userlog` VALUES ('635', '2', '127.0.0.1', '2020-11-14 12:17:31', '19');
INSERT INTO `userlog` VALUES ('636', '2', '127.0.0.1', '2020-11-14 12:17:39', '13');
INSERT INTO `userlog` VALUES ('637', '2', '127.0.0.1', '2020-11-14 12:17:47', '19');
INSERT INTO `userlog` VALUES ('638', '2', '127.0.0.1', '2020-11-14 12:18:20', '19');
INSERT INTO `userlog` VALUES ('639', '2', '127.0.0.1', '2020-11-14 12:18:47', '19');
INSERT INTO `userlog` VALUES ('640', '3', '127.0.0.1', '2020-11-14 14:25:58', null);
INSERT INTO `userlog` VALUES ('641', '3', '127.0.0.1', '2020-11-14 14:27:14', '19');
INSERT INTO `userlog` VALUES ('642', '3', '127.0.0.1', '2020-11-14 14:34:23', '19');
INSERT INTO `userlog` VALUES ('643', '3', '127.0.0.1', '2020-11-14 14:36:19', '19');
INSERT INTO `userlog` VALUES ('644', '3', '127.0.0.1', '2020-11-14 14:38:12', '19');
INSERT INTO `userlog` VALUES ('645', '3', '127.0.0.1', '2020-11-14 15:05:16', '19');
INSERT INTO `userlog` VALUES ('646', '3', '127.0.0.1', '2020-11-14 15:06:27', '19');
INSERT INTO `userlog` VALUES ('647', '3', '127.0.0.1', '2020-11-14 15:06:36', '19');
INSERT INTO `userlog` VALUES ('648', '3', '127.0.0.1', '2020-11-14 15:06:41', '19');
INSERT INTO `userlog` VALUES ('649', '3', '127.0.0.1', '2020-11-14 15:07:43', '19');
INSERT INTO `userlog` VALUES ('650', '2', '127.0.0.1', '2020-11-14 19:30:40', null);
INSERT INTO `userlog` VALUES ('651', '2', '127.0.0.1', '2020-11-14 19:30:44', '19');
INSERT INTO `userlog` VALUES ('652', '2', '127.0.0.1', '2020-11-14 19:30:45', '19');
INSERT INTO `userlog` VALUES ('653', '2', '127.0.0.1', '2020-11-14 19:30:55', '9');
INSERT INTO `userlog` VALUES ('654', '2', '127.0.0.1', '2020-11-14 19:30:58', '9');
INSERT INTO `userlog` VALUES ('655', '2', '127.0.0.1', '2020-11-14 19:31:01', '9');
INSERT INTO `userlog` VALUES ('656', '2', '127.0.0.1', '2020-11-14 19:31:11', '9');
INSERT INTO `userlog` VALUES ('657', '2', '127.0.0.1', '2020-11-14 19:31:13', '9');
INSERT INTO `userlog` VALUES ('658', '2', '127.0.0.1', '2020-11-14 19:31:15', '9');
INSERT INTO `userlog` VALUES ('659', '2', '127.0.0.1', '2020-11-14 19:31:24', '19');
INSERT INTO `userlog` VALUES ('660', '2', '127.0.0.1', '2020-11-14 19:31:27', '19');
INSERT INTO `userlog` VALUES ('661', '2', '127.0.0.1', '2020-11-14 19:31:30', '19');
INSERT INTO `userlog` VALUES ('662', '2', '127.0.0.1', '2020-11-14 19:35:54', '22');
INSERT INTO `userlog` VALUES ('663', '2', '127.0.0.1', '2020-11-14 19:35:58', '22');
INSERT INTO `userlog` VALUES ('664', '2', '127.0.0.1', '2020-11-14 19:36:01', '9');
INSERT INTO `userlog` VALUES ('665', '2', '127.0.0.1', '2020-11-14 19:36:07', '22');
INSERT INTO `userlog` VALUES ('666', '2', '127.0.0.1', '2020-11-14 20:05:31', '19');
INSERT INTO `userlog` VALUES ('667', '2', '127.0.0.1', '2020-11-14 20:05:39', '19');
INSERT INTO `userlog` VALUES ('668', '2', '127.0.0.1', '2020-11-14 20:05:51', '22');
INSERT INTO `userlog` VALUES ('669', '3', '127.0.0.1', '2020-11-15 09:26:29', null);
INSERT INTO `userlog` VALUES ('670', '3', '127.0.0.1', '2020-11-15 16:04:12', null);
INSERT INTO `userlog` VALUES ('671', '3', '127.0.0.1', '2020-11-15 16:09:03', null);
INSERT INTO `userlog` VALUES ('672', '3', '127.0.0.1', '2020-11-15 16:11:45', '19');
INSERT INTO `userlog` VALUES ('673', '3', '127.0.0.1', '2020-11-15 16:11:48', '9');
INSERT INTO `userlog` VALUES ('674', '3', '127.0.0.1', '2020-11-15 16:11:49', '9');
INSERT INTO `userlog` VALUES ('675', '3', '127.0.0.1', '2020-11-15 16:11:59', '9');
INSERT INTO `userlog` VALUES ('676', '3', '127.0.0.1', '2020-11-15 16:17:51', '9');
INSERT INTO `userlog` VALUES ('677', '3', '127.0.0.1', '2020-11-15 16:18:45', '19');
INSERT INTO `userlog` VALUES ('678', '3', '127.0.0.1', '2020-11-15 16:23:08', '19');
INSERT INTO `userlog` VALUES ('679', '3', '127.0.0.1', '2020-11-15 16:23:48', '19');
INSERT INTO `userlog` VALUES ('680', '3', '127.0.0.1', '2020-11-15 16:23:59', '19');
INSERT INTO `userlog` VALUES ('681', '3', '127.0.0.1', '2020-11-15 16:23:59', '19');
INSERT INTO `userlog` VALUES ('682', '3', '127.0.0.1', '2020-11-15 16:26:10', '9');
INSERT INTO `userlog` VALUES ('683', '3', '127.0.0.1', '2020-11-15 16:26:42', '9');
INSERT INTO `userlog` VALUES ('684', '3', '127.0.0.1', '2020-11-15 16:26:52', '9');
INSERT INTO `userlog` VALUES ('685', '3', '127.0.0.1', '2020-11-15 16:26:52', '9');
INSERT INTO `userlog` VALUES ('686', '3', '127.0.0.1', '2020-11-15 16:27:04', '9');
INSERT INTO `userlog` VALUES ('687', '3', '127.0.0.1', '2020-11-15 16:27:07', '9');
INSERT INTO `userlog` VALUES ('688', '3', '127.0.0.1', '2020-11-15 16:27:11', '19');
INSERT INTO `userlog` VALUES ('689', '3', '127.0.0.1', '2020-11-15 16:27:14', '19');
INSERT INTO `userlog` VALUES ('690', '4', '127.0.0.1', '2020-11-15 16:47:49', null);
INSERT INTO `userlog` VALUES ('691', '4', '127.0.0.1', '2020-11-15 16:48:53', '19');
INSERT INTO `userlog` VALUES ('692', '4', '127.0.0.1', '2020-11-15 16:49:38', '9');
INSERT INTO `userlog` VALUES ('693', '4', '127.0.0.1', '2020-11-15 16:49:42', '9');
INSERT INTO `userlog` VALUES ('694', '4', '127.0.0.1', '2020-11-15 16:50:34', '9');
INSERT INTO `userlog` VALUES ('695', '4', '127.0.0.1', '2020-11-15 16:50:47', '9');
INSERT INTO `userlog` VALUES ('696', '4', '127.0.0.1', '2020-11-15 16:50:47', '9');
INSERT INTO `userlog` VALUES ('697', '4', '127.0.0.1', '2020-11-15 16:53:06', '9');
INSERT INTO `userlog` VALUES ('698', '4', '127.0.0.1', '2020-11-15 16:53:21', '9');
INSERT INTO `userlog` VALUES ('699', '4', '127.0.0.1', '2020-11-15 16:54:40', '19');
INSERT INTO `userlog` VALUES ('700', '4', '127.0.0.1', '2020-11-15 16:55:43', '9');
INSERT INTO `userlog` VALUES ('701', '4', '127.0.0.1', '2020-11-15 16:55:57', '19');
INSERT INTO `userlog` VALUES ('702', '4', '127.0.0.1', '2020-11-15 16:59:15', '19');
INSERT INTO `userlog` VALUES ('703', '4', '127.0.0.1', '2020-11-15 16:59:57', '22');
INSERT INTO `userlog` VALUES ('704', '4', '127.0.0.1', '2020-11-15 17:00:47', '19');
INSERT INTO `userlog` VALUES ('705', '4', '127.0.0.1', '2020-11-15 17:01:27', null);
INSERT INTO `userlog` VALUES ('706', '4', '127.0.0.1', '2020-11-15 17:05:35', '16');
INSERT INTO `userlog` VALUES ('707', '4', '127.0.0.1', '2020-11-15 17:06:02', '16');
INSERT INTO `userlog` VALUES ('708', '4', '127.0.0.1', '2020-11-15 17:06:23', '13');
INSERT INTO `userlog` VALUES ('709', '4', '127.0.0.1', '2020-11-15 17:06:59', '13');
INSERT INTO `userlog` VALUES ('710', '4', '127.0.0.1', '2020-11-15 17:07:02', '19');
INSERT INTO `userlog` VALUES ('711', '4', '127.0.0.1', '2020-11-15 17:11:04', '23');
INSERT INTO `userlog` VALUES ('712', '4', '127.0.0.1', '2020-11-15 17:12:29', '23');
INSERT INTO `userlog` VALUES ('713', '4', '127.0.0.1', '2020-11-15 17:18:44', null);
INSERT INTO `userlog` VALUES ('714', '4', '127.0.0.1', '2020-11-15 17:18:59', null);
INSERT INTO `userlog` VALUES ('715', '4', '127.0.0.1', '2020-11-15 19:00:38', '19');
INSERT INTO `userlog` VALUES ('716', '3', '127.0.0.1', '2020-11-16 10:05:21', null);
INSERT INTO `userlog` VALUES ('717', '3', '127.0.0.1', '2020-11-16 10:05:26', '27');
INSERT INTO `userlog` VALUES ('718', '3', '127.0.0.1', '2020-11-16 10:05:29', '27');
INSERT INTO `userlog` VALUES ('719', '3', '127.0.0.1', '2020-11-16 10:06:07', '27');
INSERT INTO `userlog` VALUES ('720', '3', '127.0.0.1', '2020-11-16 10:14:23', '12');
INSERT INTO `userlog` VALUES ('721', '3', '127.0.0.1', '2020-11-16 10:14:25', '14');
INSERT INTO `userlog` VALUES ('722', '3', '127.0.0.1', '2020-11-16 10:14:27', '15');
INSERT INTO `userlog` VALUES ('723', '3', '127.0.0.1', '2020-11-16 10:25:19', '34');
INSERT INTO `userlog` VALUES ('724', '4', '127.0.0.1', '2020-11-16 10:36:07', null);
INSERT INTO `userlog` VALUES ('725', '4', '127.0.0.1', '2020-11-16 10:41:43', null);
INSERT INTO `userlog` VALUES ('726', '1', '127.0.0.1', '2020-11-16 10:42:06', null);
INSERT INTO `userlog` VALUES ('727', '5', '127.0.0.1', '2020-11-16 10:43:09', null);
INSERT INTO `userlog` VALUES ('728', '5', '127.0.0.1', '2020-11-16 10:44:12', null);
INSERT INTO `userlog` VALUES ('729', '6', '127.0.0.1', '2020-11-16 10:44:18', null);
INSERT INTO `userlog` VALUES ('730', '2', '127.0.0.1', '2020-11-16 10:45:04', null);
INSERT INTO `userlog` VALUES ('731', '7', '127.0.0.1', '2020-11-16 10:46:33', null);
INSERT INTO `userlog` VALUES ('732', '8', '127.0.0.1', '2020-11-16 10:47:24', null);
INSERT INTO `userlog` VALUES ('733', '9', '127.0.0.1', '2020-11-16 10:48:42', null);
INSERT INTO `userlog` VALUES ('734', '9', '127.0.0.1', '2020-11-16 10:49:07', '19');
INSERT INTO `userlog` VALUES ('735', '9', '127.0.0.1', '2020-11-16 10:49:22', '28');
INSERT INTO `userlog` VALUES ('736', '9', '127.0.0.1', '2020-11-16 10:49:29', '28');
INSERT INTO `userlog` VALUES ('737', '9', '127.0.0.1', '2020-11-16 10:50:03', '28');
INSERT INTO `userlog` VALUES ('738', '9', '127.0.0.1', '2020-11-16 10:50:05', '28');
INSERT INTO `userlog` VALUES ('739', '9', '127.0.0.1', '2020-11-16 10:50:16', '28');
INSERT INTO `userlog` VALUES ('740', '9', '127.0.0.1', '2020-11-16 10:50:44', '28');
INSERT INTO `userlog` VALUES ('741', '9', '127.0.0.1', '2020-11-16 10:50:46', '28');
INSERT INTO `userlog` VALUES ('742', '9', '127.0.0.1', '2020-11-16 10:50:56', '19');
INSERT INTO `userlog` VALUES ('743', '9', '127.0.0.1', '2020-11-16 10:50:58', '19');
INSERT INTO `userlog` VALUES ('744', '9', '127.0.0.1', '2020-11-16 10:51:04', '19');
INSERT INTO `userlog` VALUES ('745', '9', '127.0.0.1', '2020-11-16 10:52:39', '28');
INSERT INTO `userlog` VALUES ('746', '9', '127.0.0.1', '2020-11-16 10:53:01', '28');
INSERT INTO `userlog` VALUES ('747', '9', '127.0.0.1', '2020-11-16 10:53:01', '28');
INSERT INTO `userlog` VALUES ('748', '9', '127.0.0.1', '2020-11-16 10:53:05', '28');
INSERT INTO `userlog` VALUES ('749', '9', '127.0.0.1', '2020-11-16 10:53:09', '28');
INSERT INTO `userlog` VALUES ('750', '9', '127.0.0.1', '2020-11-16 10:53:50', '22');
INSERT INTO `userlog` VALUES ('751', '9', '127.0.0.1', '2020-11-16 10:57:20', '22');
INSERT INTO `userlog` VALUES ('752', '9', '127.0.0.1', '2020-11-16 10:57:25', '22');
INSERT INTO `userlog` VALUES ('753', '9', '127.0.0.1', '2020-11-16 10:57:41', '22');
INSERT INTO `userlog` VALUES ('754', '9', '127.0.0.1', '2020-11-16 10:58:14', '22');
INSERT INTO `userlog` VALUES ('755', '9', '127.0.0.1', '2020-11-16 10:58:14', '22');
INSERT INTO `userlog` VALUES ('756', '9', '127.0.0.1', '2020-11-16 10:58:32', '22');
INSERT INTO `userlog` VALUES ('757', '9', '127.0.0.1', '2020-11-16 10:58:38', '30');
INSERT INTO `userlog` VALUES ('758', '9', '127.0.0.1', '2020-11-16 10:59:05', '30');
INSERT INTO `userlog` VALUES ('759', '9', '127.0.0.1', '2020-11-16 10:59:05', '30');
INSERT INTO `userlog` VALUES ('760', '9', '127.0.0.1', '2020-11-16 10:59:17', '19');
INSERT INTO `userlog` VALUES ('761', '9', '127.0.0.1', '2020-11-16 11:00:14', '28');
INSERT INTO `userlog` VALUES ('762', '9', '127.0.0.1', '2020-11-16 11:01:35', '28');
INSERT INTO `userlog` VALUES ('763', '9', '127.0.0.1', '2020-11-16 11:01:51', '28');
INSERT INTO `userlog` VALUES ('764', '9', '127.0.0.1', '2020-11-16 11:02:02', '28');
INSERT INTO `userlog` VALUES ('765', '9', '127.0.0.1', '2020-11-16 11:02:47', '34');
INSERT INTO `userlog` VALUES ('766', '9', '127.0.0.1', '2020-11-16 11:03:34', '34');
INSERT INTO `userlog` VALUES ('767', '9', '127.0.0.1', '2020-11-16 11:03:35', '34');
INSERT INTO `userlog` VALUES ('768', '9', '127.0.0.1', '2020-11-16 11:03:43', '34');
INSERT INTO `userlog` VALUES ('769', '9', '127.0.0.1', '2020-11-16 11:03:57', '34');
INSERT INTO `userlog` VALUES ('770', '9', '127.0.0.1', '2020-11-16 11:04:09', '34');
INSERT INTO `userlog` VALUES ('771', '9', '127.0.0.1', '2020-11-16 11:04:27', '29');
INSERT INTO `userlog` VALUES ('772', '9', '127.0.0.1', '2020-11-16 11:04:46', '28');
INSERT INTO `userlog` VALUES ('773', '9', '127.0.0.1', '2020-11-16 11:04:51', '28');
INSERT INTO `userlog` VALUES ('774', '9', '127.0.0.1', '2020-11-16 11:04:54', '30');
INSERT INTO `userlog` VALUES ('775', '9', '127.0.0.1', '2020-11-16 11:04:57', '34');
INSERT INTO `userlog` VALUES ('776', '9', '127.0.0.1', '2020-11-16 11:05:51', '28');
INSERT INTO `userlog` VALUES ('777', '9', '127.0.0.1', '2020-11-16 11:05:58', '28');
INSERT INTO `userlog` VALUES ('778', '9', '127.0.0.1', '2020-11-16 11:06:09', '28');
INSERT INTO `userlog` VALUES ('779', '9', '127.0.0.1', '2020-11-16 11:06:48', '30');
INSERT INTO `userlog` VALUES ('780', '9', '127.0.0.1', '2020-11-16 11:40:35', '28');
INSERT INTO `userlog` VALUES ('781', '9', '127.0.0.1', '2020-11-16 11:40:46', '34');
INSERT INTO `userlog` VALUES ('782', '9', '127.0.0.1', '2020-11-16 11:41:03', '19');
INSERT INTO `userlog` VALUES ('783', '9', '127.0.0.1', '2020-11-16 11:41:21', '19');
INSERT INTO `userlog` VALUES ('784', '9', '127.0.0.1', '2020-11-16 11:41:22', '19');
INSERT INTO `userlog` VALUES ('785', '9', '127.0.0.1', '2020-11-16 11:41:29', '28');
INSERT INTO `userlog` VALUES ('786', '9', '127.0.0.1', '2020-11-16 11:41:34', '34');
INSERT INTO `userlog` VALUES ('787', '9', '127.0.0.1', '2020-11-16 11:41:37', '30');
INSERT INTO `userlog` VALUES ('788', '9', '127.0.0.1', '2020-11-16 11:41:41', '22');
INSERT INTO `userlog` VALUES ('789', '9', '127.0.0.1', '2020-11-16 11:42:02', '27');
INSERT INTO `userlog` VALUES ('790', '9', '127.0.0.1', '2020-11-16 11:42:20', '27');
INSERT INTO `userlog` VALUES ('791', '9', '127.0.0.1', '2020-11-16 11:42:20', '27');
INSERT INTO `userlog` VALUES ('792', '9', '127.0.0.1', '2020-11-16 11:42:27', '27');
INSERT INTO `userlog` VALUES ('793', '9', '127.0.0.1', '2020-11-16 11:42:40', '26');
INSERT INTO `userlog` VALUES ('794', '9', '127.0.0.1', '2020-11-16 11:43:00', '26');
INSERT INTO `userlog` VALUES ('795', '9', '127.0.0.1', '2020-11-16 11:43:00', '26');
INSERT INTO `userlog` VALUES ('796', '9', '127.0.0.1', '2020-11-16 11:43:02', '26');
INSERT INTO `userlog` VALUES ('797', '9', '127.0.0.1', '2020-11-16 11:43:11', '32');
INSERT INTO `userlog` VALUES ('798', '9', '127.0.0.1', '2020-11-16 11:43:36', '32');
INSERT INTO `userlog` VALUES ('799', '9', '127.0.0.1', '2020-11-16 11:43:36', '32');
INSERT INTO `userlog` VALUES ('800', '9', '127.0.0.1', '2020-11-16 11:43:39', '32');
INSERT INTO `userlog` VALUES ('801', '9', '127.0.0.1', '2020-11-16 11:43:46', '32');
INSERT INTO `userlog` VALUES ('802', '9', '127.0.0.1', '2020-11-16 11:43:55', '12');
INSERT INTO `userlog` VALUES ('803', '9', '127.0.0.1', '2020-11-16 11:44:48', '32');
INSERT INTO `userlog` VALUES ('804', '9', '127.0.0.1', '2020-11-16 11:44:55', '32');
INSERT INTO `userlog` VALUES ('805', '9', '127.0.0.1', '2020-11-16 11:44:55', '32');
INSERT INTO `userlog` VALUES ('806', '9', '127.0.0.1', '2020-11-16 11:45:00', '32');
INSERT INTO `userlog` VALUES ('807', '9', '127.0.0.1', '2020-11-16 11:45:07', '32');
INSERT INTO `userlog` VALUES ('808', '9', '127.0.0.1', '2020-11-16 11:45:15', '32');
INSERT INTO `userlog` VALUES ('809', '9', '127.0.0.1', '2020-11-16 11:50:44', '32');
INSERT INTO `userlog` VALUES ('810', '9', '127.0.0.1', '2020-11-16 11:59:48', '28');
INSERT INTO `userlog` VALUES ('811', '9', '127.0.0.1', '2020-11-16 12:00:42', '34');
INSERT INTO `userlog` VALUES ('812', '9', '127.0.0.1', '2020-11-16 12:00:51', '34');
INSERT INTO `userlog` VALUES ('813', '9', '127.0.0.1', '2020-11-16 12:01:26', '34');
INSERT INTO `userlog` VALUES ('814', '9', '127.0.0.1', '2020-11-16 12:01:54', '34');
INSERT INTO `userlog` VALUES ('815', '9', '127.0.0.1', '2020-11-16 12:01:57', '35');
INSERT INTO `userlog` VALUES ('816', '9', '127.0.0.1', '2020-11-16 12:02:09', '34');
INSERT INTO `userlog` VALUES ('817', '9', '127.0.0.1', '2020-11-16 12:02:13', '34');
INSERT INTO `userlog` VALUES ('818', '9', '127.0.0.1', '2020-11-16 12:02:18', '34');
INSERT INTO `userlog` VALUES ('819', '8', '127.0.0.1', '2020-11-16 12:02:38', null);
INSERT INTO `userlog` VALUES ('820', '8', '127.0.0.1', '2020-11-16 12:02:45', '28');
INSERT INTO `userlog` VALUES ('821', '8', '127.0.0.1', '2020-11-16 12:03:12', '28');
INSERT INTO `userlog` VALUES ('822', '8', '127.0.0.1', '2020-11-16 12:03:12', '28');
INSERT INTO `userlog` VALUES ('823', '8', '127.0.0.1', '2020-11-16 12:03:20', '34');
INSERT INTO `userlog` VALUES ('824', '8', '127.0.0.1', '2020-11-16 12:03:42', '34');
INSERT INTO `userlog` VALUES ('825', '8', '127.0.0.1', '2020-11-16 12:03:42', '34');
INSERT INTO `userlog` VALUES ('826', '8', '127.0.0.1', '2020-11-16 12:03:47', '34');
INSERT INTO `userlog` VALUES ('827', '8', '127.0.0.1', '2020-11-16 12:03:52', '30');
INSERT INTO `userlog` VALUES ('828', '8', '127.0.0.1', '2020-11-16 12:04:16', '30');
INSERT INTO `userlog` VALUES ('829', '8', '127.0.0.1', '2020-11-16 12:04:17', '30');
INSERT INTO `userlog` VALUES ('830', '8', '127.0.0.1', '2020-11-16 12:04:23', '22');
INSERT INTO `userlog` VALUES ('831', '8', '127.0.0.1', '2020-11-16 12:04:38', '22');
INSERT INTO `userlog` VALUES ('832', '8', '127.0.0.1', '2020-11-16 12:04:38', '22');
INSERT INTO `userlog` VALUES ('833', '8', '127.0.0.1', '2020-11-16 12:04:43', '26');
INSERT INTO `userlog` VALUES ('834', '8', '127.0.0.1', '2020-11-16 12:08:23', '26');
INSERT INTO `userlog` VALUES ('835', '8', '127.0.0.1', '2020-11-16 12:08:23', '26');
INSERT INTO `userlog` VALUES ('836', '8', '127.0.0.1', '2020-11-16 12:08:33', '28');
INSERT INTO `userlog` VALUES ('837', '8', '127.0.0.1', '2020-11-16 12:08:45', '31');
INSERT INTO `userlog` VALUES ('838', '8', '127.0.0.1', '2020-11-16 12:08:55', '31');
INSERT INTO `userlog` VALUES ('839', '8', '127.0.0.1', '2020-11-16 12:08:55', '31');
INSERT INTO `userlog` VALUES ('840', '8', '127.0.0.1', '2020-11-16 12:08:59', '31');
INSERT INTO `userlog` VALUES ('841', '8', '127.0.0.1', '2020-11-16 12:09:01', '31');
INSERT INTO `userlog` VALUES ('842', '8', '127.0.0.1', '2020-11-16 12:09:04', '31');
INSERT INTO `userlog` VALUES ('843', '8', '127.0.0.1', '2020-11-16 12:09:31', '35');
INSERT INTO `userlog` VALUES ('844', '8', '127.0.0.1', '2020-11-16 12:09:42', '35');
INSERT INTO `userlog` VALUES ('845', '8', '127.0.0.1', '2020-11-16 12:09:43', '35');
INSERT INTO `userlog` VALUES ('846', '8', '127.0.0.1', '2020-11-16 12:09:44', '35');
INSERT INTO `userlog` VALUES ('847', '8', '127.0.0.1', '2020-11-16 12:09:47', '33');
INSERT INTO `userlog` VALUES ('848', '8', '127.0.0.1', '2020-11-16 12:09:58', '33');
INSERT INTO `userlog` VALUES ('849', '8', '127.0.0.1', '2020-11-16 12:09:59', '33');
INSERT INTO `userlog` VALUES ('850', '8', '127.0.0.1', '2020-11-16 12:10:00', '33');
INSERT INTO `userlog` VALUES ('851', '8', '127.0.0.1', '2020-11-16 12:10:05', '33');
INSERT INTO `userlog` VALUES ('852', '8', '127.0.0.1', '2020-11-16 12:10:13', '33');
INSERT INTO `userlog` VALUES ('853', '8', '127.0.0.1', '2020-11-16 12:10:18', '29');
INSERT INTO `userlog` VALUES ('854', '8', '127.0.0.1', '2020-11-16 12:10:27', '29');
INSERT INTO `userlog` VALUES ('855', '8', '127.0.0.1', '2020-11-16 12:10:27', '29');
INSERT INTO `userlog` VALUES ('856', '8', '127.0.0.1', '2020-11-16 12:10:35', '29');
INSERT INTO `userlog` VALUES ('857', '8', '127.0.0.1', '2020-11-16 12:10:42', '29');
INSERT INTO `userlog` VALUES ('858', '8', '127.0.0.1', '2020-11-16 12:10:54', '29');
INSERT INTO `userlog` VALUES ('859', '8', '127.0.0.1', '2020-11-16 12:10:59', '34');
INSERT INTO `userlog` VALUES ('860', '8', '127.0.0.1', '2020-11-16 12:11:02', '33');
INSERT INTO `userlog` VALUES ('861', '8', '127.0.0.1', '2020-11-16 12:11:08', '31');
INSERT INTO `userlog` VALUES ('862', '8', '127.0.0.1', '2020-11-16 12:11:12', '26');
INSERT INTO `userlog` VALUES ('863', '8', '127.0.0.1', '2020-11-16 12:11:15', '28');
INSERT INTO `userlog` VALUES ('864', '8', '127.0.0.1', '2020-11-16 12:11:19', '32');
INSERT INTO `userlog` VALUES ('865', '8', '127.0.0.1', '2020-11-16 12:11:23', '30');
INSERT INTO `userlog` VALUES ('866', '8', '127.0.0.1', '2020-11-16 12:11:27', '29');
INSERT INTO `userlog` VALUES ('867', '7', '127.0.0.1', '2020-11-16 12:11:37', null);
INSERT INTO `userlog` VALUES ('868', '7', '127.0.0.1', '2020-11-16 12:11:55', '30');
INSERT INTO `userlog` VALUES ('869', '7', '127.0.0.1', '2020-11-16 12:12:27', '30');
INSERT INTO `userlog` VALUES ('870', '7', '127.0.0.1', '2020-11-16 12:12:27', '30');
INSERT INTO `userlog` VALUES ('871', '7', '127.0.0.1', '2020-11-16 12:12:34', '30');
INSERT INTO `userlog` VALUES ('872', '7', '127.0.0.1', '2020-11-16 12:12:37', '29');
INSERT INTO `userlog` VALUES ('873', '7', '127.0.0.1', '2020-11-16 12:12:43', '29');
INSERT INTO `userlog` VALUES ('874', '7', '127.0.0.1', '2020-11-16 12:12:43', '29');
INSERT INTO `userlog` VALUES ('875', '7', '127.0.0.1', '2020-11-16 12:12:44', '29');
INSERT INTO `userlog` VALUES ('876', '7', '127.0.0.1', '2020-11-16 12:12:50', '35');
INSERT INTO `userlog` VALUES ('877', '7', '127.0.0.1', '2020-11-16 12:12:59', '35');
INSERT INTO `userlog` VALUES ('878', '7', '127.0.0.1', '2020-11-16 12:12:59', '35');
INSERT INTO `userlog` VALUES ('879', '7', '127.0.0.1', '2020-11-16 12:13:07', '35');
INSERT INTO `userlog` VALUES ('880', '7', '127.0.0.1', '2020-11-16 12:13:13', '26');
INSERT INTO `userlog` VALUES ('881', '7', '127.0.0.1', '2020-11-16 12:13:25', '26');
INSERT INTO `userlog` VALUES ('882', '7', '127.0.0.1', '2020-11-16 12:13:26', '26');
INSERT INTO `userlog` VALUES ('883', '7', '127.0.0.1', '2020-11-16 12:13:29', '26');
INSERT INTO `userlog` VALUES ('884', '7', '127.0.0.1', '2020-11-16 12:13:31', '26');
INSERT INTO `userlog` VALUES ('885', '7', '127.0.0.1', '2020-11-16 12:13:38', '26');
INSERT INTO `userlog` VALUES ('886', '7', '127.0.0.1', '2020-11-16 12:13:47', '29');
INSERT INTO `userlog` VALUES ('887', '7', '127.0.0.1', '2020-11-16 12:13:50', '30');
INSERT INTO `userlog` VALUES ('888', '7', '127.0.0.1', '2020-11-16 12:13:53', '32');
INSERT INTO `userlog` VALUES ('889', '7', '127.0.0.1', '2020-11-16 12:14:03', '32');
INSERT INTO `userlog` VALUES ('890', '7', '127.0.0.1', '2020-11-16 12:14:03', '32');
INSERT INTO `userlog` VALUES ('891', '7', '127.0.0.1', '2020-11-16 12:14:05', '32');
INSERT INTO `userlog` VALUES ('892', '7', '127.0.0.1', '2020-11-16 12:14:08', '27');
INSERT INTO `userlog` VALUES ('893', '7', '127.0.0.1', '2020-11-16 12:14:18', '27');
INSERT INTO `userlog` VALUES ('894', '7', '127.0.0.1', '2020-11-16 12:14:18', '27');
INSERT INTO `userlog` VALUES ('895', '7', '127.0.0.1', '2020-11-16 12:14:20', '27');
INSERT INTO `userlog` VALUES ('896', '7', '127.0.0.1', '2020-11-16 12:14:22', '28');
INSERT INTO `userlog` VALUES ('897', '7', '127.0.0.1', '2020-11-16 12:14:41', '28');
INSERT INTO `userlog` VALUES ('898', '7', '127.0.0.1', '2020-11-16 12:14:41', '28');
INSERT INTO `userlog` VALUES ('899', '7', '127.0.0.1', '2020-11-16 12:14:44', '28');
INSERT INTO `userlog` VALUES ('900', '7', '127.0.0.1', '2020-11-16 12:14:47', '34');
INSERT INTO `userlog` VALUES ('901', '7', '127.0.0.1', '2020-11-16 12:15:13', '34');
INSERT INTO `userlog` VALUES ('902', '7', '127.0.0.1', '2020-11-16 12:15:13', '34');
INSERT INTO `userlog` VALUES ('903', '7', '127.0.0.1', '2020-11-16 12:15:16', '34');
INSERT INTO `userlog` VALUES ('904', '7', '127.0.0.1', '2020-11-16 12:15:21', '33');
INSERT INTO `userlog` VALUES ('905', '7', '127.0.0.1', '2020-11-16 12:15:38', '33');
INSERT INTO `userlog` VALUES ('906', '7', '127.0.0.1', '2020-11-16 12:15:38', '33');
INSERT INTO `userlog` VALUES ('907', '7', '127.0.0.1', '2020-11-16 12:15:41', '33');
INSERT INTO `userlog` VALUES ('908', '7', '127.0.0.1', '2020-11-16 12:15:48', '33');
INSERT INTO `userlog` VALUES ('909', '7', '127.0.0.1', '2020-11-16 12:16:05', '34');
INSERT INTO `userlog` VALUES ('910', '7', '127.0.0.1', '2020-11-16 12:16:08', '31');
INSERT INTO `userlog` VALUES ('911', '7', '127.0.0.1', '2020-11-16 12:16:58', '34');
INSERT INTO `userlog` VALUES ('912', '7', '127.0.0.1', '2020-11-16 12:17:01', '31');
INSERT INTO `userlog` VALUES ('913', '7', '127.0.0.1', '2020-11-16 12:17:31', '31');
INSERT INTO `userlog` VALUES ('914', '7', '127.0.0.1', '2020-11-16 12:17:31', '31');
INSERT INTO `userlog` VALUES ('915', '7', '127.0.0.1', '2020-11-16 12:17:33', '31');
INSERT INTO `userlog` VALUES ('916', '7', '127.0.0.1', '2020-11-16 12:17:39', '29');
INSERT INTO `userlog` VALUES ('917', '7', '127.0.0.1', '2020-11-16 12:17:42', '30');
INSERT INTO `userlog` VALUES ('918', '7', '127.0.0.1', '2020-11-16 12:17:45', '27');
INSERT INTO `userlog` VALUES ('919', '7', '127.0.0.1', '2020-11-16 12:17:49', '32');
INSERT INTO `userlog` VALUES ('920', '7', '127.0.0.1', '2020-11-16 12:17:56', '28');
INSERT INTO `userlog` VALUES ('921', '7', '127.0.0.1', '2020-11-16 12:17:59', '31');
INSERT INTO `userlog` VALUES ('922', '7', '127.0.0.1', '2020-11-16 12:18:02', '26');
INSERT INTO `userlog` VALUES ('923', '7', '127.0.0.1', '2020-11-16 12:18:07', '33');
INSERT INTO `userlog` VALUES ('924', '7', '127.0.0.1', '2020-11-16 12:18:10', '34');
INSERT INTO `userlog` VALUES ('925', '6', '127.0.0.1', '2020-11-16 12:18:20', null);
INSERT INTO `userlog` VALUES ('926', '6', '127.0.0.1', '2020-11-16 12:18:30', '29');
INSERT INTO `userlog` VALUES ('927', '6', '127.0.0.1', '2020-11-16 12:18:45', '29');
INSERT INTO `userlog` VALUES ('928', '6', '127.0.0.1', '2020-11-16 12:18:45', '29');
INSERT INTO `userlog` VALUES ('929', '6', '127.0.0.1', '2020-11-16 12:18:48', '29');
INSERT INTO `userlog` VALUES ('930', '6', '127.0.0.1', '2020-11-16 12:18:51', '30');
INSERT INTO `userlog` VALUES ('931', '6', '127.0.0.1', '2020-11-16 12:18:58', '27');
INSERT INTO `userlog` VALUES ('932', '6', '127.0.0.1', '2020-11-16 12:19:15', '27');
INSERT INTO `userlog` VALUES ('933', '6', '127.0.0.1', '2020-11-16 12:19:15', '27');
INSERT INTO `userlog` VALUES ('934', '6', '127.0.0.1', '2020-11-16 12:19:21', '27');
INSERT INTO `userlog` VALUES ('935', '6', '127.0.0.1', '2020-11-16 12:19:35', '28');
INSERT INTO `userlog` VALUES ('936', '6', '127.0.0.1', '2020-11-16 12:19:38', '31');
INSERT INTO `userlog` VALUES ('937', '6', '127.0.0.1', '2020-11-16 12:19:51', '31');
INSERT INTO `userlog` VALUES ('938', '6', '127.0.0.1', '2020-11-16 12:19:51', '31');
INSERT INTO `userlog` VALUES ('939', '6', '127.0.0.1', '2020-11-16 12:19:54', '31');
INSERT INTO `userlog` VALUES ('940', '6', '127.0.0.1', '2020-11-16 12:19:57', '35');
INSERT INTO `userlog` VALUES ('941', '6', '127.0.0.1', '2020-11-16 12:20:05', '35');
INSERT INTO `userlog` VALUES ('942', '6', '127.0.0.1', '2020-11-16 12:20:05', '35');
INSERT INTO `userlog` VALUES ('943', '6', '127.0.0.1', '2020-11-16 12:20:06', '35');
INSERT INTO `userlog` VALUES ('944', '6', '127.0.0.1', '2020-11-16 12:20:09', '26');
INSERT INTO `userlog` VALUES ('945', '6', '127.0.0.1', '2020-11-16 12:20:11', '33');
INSERT INTO `userlog` VALUES ('946', '6', '127.0.0.1', '2020-11-16 12:20:23', '33');
INSERT INTO `userlog` VALUES ('947', '6', '127.0.0.1', '2020-11-16 12:20:23', '33');
INSERT INTO `userlog` VALUES ('948', '6', '127.0.0.1', '2020-11-16 12:21:31', '34');
INSERT INTO `userlog` VALUES ('949', '6', '127.0.0.1', '2020-11-16 12:21:34', '33');
INSERT INTO `userlog` VALUES ('950', '6', '127.0.0.1', '2020-11-16 12:21:41', '26');
INSERT INTO `userlog` VALUES ('951', '6', '127.0.0.1', '2020-11-16 12:21:45', '31');
INSERT INTO `userlog` VALUES ('952', '6', '127.0.0.1', '2020-11-16 12:21:48', '28');
INSERT INTO `userlog` VALUES ('953', '6', '127.0.0.1', '2020-11-16 12:21:52', '27');
INSERT INTO `userlog` VALUES ('954', '6', '127.0.0.1', '2020-11-16 12:21:57', '35');
INSERT INTO `userlog` VALUES ('955', '6', '127.0.0.1', '2020-11-16 12:22:01', '30');
INSERT INTO `userlog` VALUES ('956', '6', '127.0.0.1', '2020-11-16 12:22:08', '29');

-- ----------------------------
-- Table structure for `wishlist`
-- ----------------------------
DROP TABLE IF EXISTS `wishlist`;
CREATE TABLE `wishlist` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `film_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `create_time` datetime DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  KEY `ix_wishlist_create_time` (`create_time`) USING BTREE,
  KEY `wishlist_ibfk_1` (`film_id`) USING BTREE,
  KEY `wishlist_ibfk_2` (`user_id`) USING BTREE,
  CONSTRAINT `wishlist_ibfk_1` FOREIGN KEY (`film_id`) REFERENCES `film` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wishlist_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `user` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of wishlist
-- ----------------------------
INSERT INTO `wishlist` VALUES ('6', '10', '2', '2020-11-07 14:13:45');
INSERT INTO `wishlist` VALUES ('7', '19', '3', '2020-11-08 10:56:46');
INSERT INTO `wishlist` VALUES ('8', '18', '3', '2020-11-08 10:57:12');
INSERT INTO `wishlist` VALUES ('9', '13', '3', '2020-11-08 10:58:52');
INSERT INTO `wishlist` VALUES ('10', '9', '3', '2020-11-08 11:09:34');
INSERT INTO `wishlist` VALUES ('11', '15', '3', '2020-11-08 11:09:38');
INSERT INTO `wishlist` VALUES ('12', '12', '3', '2020-11-08 11:09:41');
INSERT INTO `wishlist` VALUES ('13', '17', '3', '2020-11-08 11:09:45');
INSERT INTO `wishlist` VALUES ('14', '16', '3', '2020-11-08 11:09:48');
INSERT INTO `wishlist` VALUES ('15', '10', '3', '2020-11-08 11:09:52');
INSERT INTO `wishlist` VALUES ('16', '11', '3', '2020-11-08 11:09:55');
INSERT INTO `wishlist` VALUES ('18', '28', '9', '2020-11-16 11:41:30');
INSERT INTO `wishlist` VALUES ('19', '34', '9', '2020-11-16 11:41:35');
INSERT INTO `wishlist` VALUES ('20', '30', '9', '2020-11-16 11:41:39');
INSERT INTO `wishlist` VALUES ('21', '22', '9', '2020-11-16 11:41:42');
INSERT INTO `wishlist` VALUES ('23', '35', '7', '2020-11-16 12:13:00');
INSERT INTO `wishlist` VALUES ('24', '26', '7', '2020-11-16 12:13:27');
INSERT INTO `wishlist` VALUES ('25', '29', '6', '2020-11-16 12:18:46');
INSERT INTO `wishlist` VALUES ('26', '27', '6', '2020-11-16 12:19:16');
INSERT INTO `wishlist` VALUES ('27', '31', '6', '2020-11-16 12:19:53');
