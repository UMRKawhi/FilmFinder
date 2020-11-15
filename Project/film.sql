/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50731
Source Host           : localhost:3306
Source Database       : film

Target Server Type    : MYSQL
Target Server Version : 50731
File Encoding         : 65001

Date: 2020-11-15 17:28:09
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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of blacklist
-- ----------------------------
INSERT INTO `blacklist` VALUES ('16', '3', '2', '2020-11-15 01:06:28');

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
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of comment
-- ----------------------------
INSERT INTO `comment` VALUES ('19', 'I\'m trying to save you money; this is the last film title that you should consider borrowing. Renting Shawshank will cost you five bucks... just plunk down the $25 and own the title. You\'ll wind up going back to this gem time and time again. This is one of few movies that are truly timeless. And it\'s entertaining and moving, no matter how many times you view it.\r\n\r\nForget about what others (including myself) might suggest you\'ll discover in \"The Shawshank Redemption;\" when you watch it, you\'ll identify something very personal in your own life with a scene, a character, or a moment in this uncomplicated movie. When you need hope, you\'ll look for Shawshank. When you want to believe in the will of overcoming even the greatest obstacles, Shawshank will uplift you in ways that you can\'t find in movies today.\r\n\r\nSome liken the film to some kind of spiritual awakening. Of course, some can go to a church or mosque to find enlightenment and Faith in humanity, but most places of worship are open only certain days or times. But when you need affirmation of the lasting bond of friendships that prevail over the most dire circumstances, Shawshank will give it to you. It makes grown men (like me) cry, still. I wonder whether Shawshank was truly meant for viewing in the privacy of the home, because it is a personal experience that really makes you look inward. Nominated for seven, this is the best film that never one a single Oscar.\r\n\r\nHow ironic that an innocent man winds up being surrounded by the corruption of the legal system. Shawshank itself is similar to the character of Andy Dufresne. Prejudging this classic film, critics couldn\'t get past the title. The public followed suit, initially dismissing Shawshank, which failed in the box office just like \"It\'s a Wonderful Life\" and \"Citizen Kane.\" It could have just whithered away on the store shelves, like Andy Dufresne could have in his own cell. But the characters prevailed, because Andy -- And Shawshank -- stayed true. Now, these movies are right up there as the most popular films of all time.\r\n\r\nAnyone who has yet to watch Shawshank may be so jaded of movies, or the film\'s title, or how a 2-1/2- hour movie set inside the walls of a prison can manage to tap the soul of such a wide range of people. Shawshank has not one explosion. I wonder if it even has a single special effect or digitally- enhanced frame.\r\n\r\nBut every aspect of Shawshank fit together. The acting from the top to the bit part. The musical score. The editing. The photography. The story, from opening credits to final scene. All involved, including the town of Mansfield, Ohio (where Shawshank was actually filmed) played their roles perfectly. Shawshank is a must- see, must- own title.', '9', '2', '2020-11-07 14:19:13', '5');
INSERT INTO `comment` VALUES ('20', 'Why do I want to write the 234th comment on The Shawshank Redemption? I am not sure - almost everything that could be possibly said about it has been said. But like so many other people who wrote comments, I was and am profoundly moved by this simple and eloquent depiction of hope and friendship and redemption.\r\n\r\nThe only other movie I have ever seen that effects me as strongly is To Kill a Mockingbird. Both movies leave me feeling cleaner for having watched them.\r\n\r\nI didn\'t intend to see this movie at all: I do not like prison movies and I don\'t normally watch them. I work at a branch library and one day as I was checking The Shawshank Redemption out to one of our older patrons, she said to me, \"Whenever I feel down or depressed, I check out this movie and watch it and it always makes me feel better.\" At the time, I thought that was very strange. One day there was nothing on TV except things I absolutely would not watch under any circumstance or things that I had seen too many times already. I remembered what she said, so I watched it. I have watched it many many times since then and it gets better with every showing.\r\n\r\nNo action, no special effects - just men in prison uniforms talking to each other.\r\n\r\nThe Shawshank Redemption and To Kill a Mockingbird are the best movies I have ever seen. I do not judge it by it\'s technical merits - I don\'t really care about that. I have read that Citizen Kane or The Godfather or this or that movie is the best movie ever made. They may have the best technique or be the most influential motion pictures ever made, but not the best. The best movies are ones that touch the soul. It takes a movie like The Shawshank Redemption to touch the soul.', '9', '1', '2020-11-07 14:20:49', '5');
INSERT INTO `comment` VALUES ('21', 'The most wonderful movie I have ever seen!', '19', '3', '2020-11-08 10:56:45', '5');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of film
-- ----------------------------
INSERT INTO `film` VALUES ('9', 'The Shawshank Redemption', 'In 1947 Portland, Maine, banker Andy Dufresne is convicted of murdering his wife and her lover and is sentenced to two consecutive life sentences at the Shawshank State Penitentiary. He is befriended by Ellis \"Red\" Redding, an inmate and prison contraband smuggler serving a life sentence. Red procures a rock hammer and a large poster of Rita Hayworth for Andy. Assigned to work in the prison laundry, Andy is frequently sexually assaulted by \"the Sisters\" and their leader, Bogs.\r\n\r\nIn 1949, Andy overhears the captain of the guards, Byron Hadley, complaining about being taxed on an inheritance and offers to help him shelter the money legally. After an assault by the Sisters nearly kills Andy, Hadley beats and cripples Bogs, who is subsequently transferred to another prison. Andy is not attacked again. Warden Samuel Norton meets Andy and reassigns him to the prison library to assist elderly inmate Brooks Hatlen, a front to allow Andy to manage financial matters for other prison staff, guards from other prisons, and the warden himself. Andy begins writing weekly letters to the state legislature requesting funds to improve the prison\'s decaying library.\r\n\r\nBrooks is paroled in 1954 after serving 50 years, but he cannot adjust to the outside world and eventually hangs himself. The legislature sends a library donation that includes a recording of The Marriage of Figaro; Andy plays an excerpt over the public address system and is punished with solitary confinement. After his release from solitary, Andy explains that hope is what gets him through his time, a concept that Red dismisses. In 1963, Norton begins exploiting prison labor for public works, profiting by undercutting skilled labor costs and receiving bribes. Andy launders the money using the alias \"Randall Stephens\".\r\n\r\nTommy Williams is incarcerated for burglary in 1965. Andy and Red befriend him, and Andy helps him pass his GED exam. A year later, Tommy reveals to Red and Andy that his cellmate at another prison had claimed responsibility for the murders for which Andy was convicted. Andy approaches Norton with this information, but Norton refuses to listen, and when Andy mentions the money laundering, Norton sends him back to solitary confinement. Norton has Hadley murder Tommy under the guise of an escape attempt. Andy attempts to discontinue the laundering, but relents after Norton threatens to destroy the library, remove Andy\'s protection from the guards, and move him to worse conditions. Andy is released from solitary confinement after two months, and he tells a skeptical Red that he dreams of living in Zihuatanejo, a Mexican coastal town. Andy also tells him of a specific hayfield near Buxton, asking Red—once he is released—to retrieve a package that Andy buried there. Red worries about Andy\'s well-being, especially when he learns Andy asked a fellow inmate for 6 ft (1.8 m) of rope.\r\n\r\nAt the next day\'s roll call, the guards find Andy\'s cell empty. An irate Norton throws a rock at a poster of Raquel Welch hanging on the cell wall, revealing a tunnel that Andy dug with his rock hammer over the past 19 years. The previous night, Andy used the rope to escape through the tunnel and prison sewage pipe, taking Norton\'s suit, shoes, and ledger, containing proof of the money laundering. While guards search for him, Andy poses as Randall Stephens, withdraws over $370,000 (equivalent to $2.92 million in 2019) of the laundered money from several banks, and mails the ledger and other evidence of the corruption and murders at Shawshank to a local newspaper. State police arrive at Shawshank and take Hadley into custody, while Norton commits suicide to avoid arrest.\r\n\r\nThe following year, Red is finally paroled after serving 40 years. He struggles to adapt to life outside prison and fears that he never will. Remembering his promise to Andy, he visits Buxton and finds a cache containing money and a letter asking him to come to Zihuatanejo. Red violates his parole by traveling to Fort Hancock, Texas, and crossing the border into Mexico, admitting that he finally feels hope. He finds Andy on a beach in Zihuatanejo, and the two reunited friends happily embrace.', 'The Shawshank Redemption.jpg', '5', '148', '2', '1994-10-14', '142', '2020-11-07 14:08:06');
INSERT INTO `film` VALUES ('10', 'Farewell My Concubine', 'Douzi, a boy endowed with feminine features, is abandoned by his prostitute mother to an all-boys Peking opera troupe supervised by Master Guan. He befriends Shitou, a student of the troupe.\r\n\r\nA few years later in 1938, a teenage Douzi is trained to play dan (female roles), while Shitou learns jing (painted face male roles). When practicing the play \"Dreaming of the World Outside the Nunnery\", Douzi accidentally substitutes the line \"I am by nature a girl, not a boy\" with \"I am by nature a boy, not a girl,\" and is disciplined by the instructors. Douzi along with another student, Laizi, attempt to run away, but Douzi decides to pursue acting seriously after witnessing an opera performance. Upon returning, they find the whole troupe being punished for their desertion, and Douzi is beaten. As a result, Laizi hangs himself.\r\n\r\nAn agent who provides funding for opera plays comes to the troupe to seek potentials. When Douzi repeats the same mistake in front of the agent, Shitou commands him to start over. Douzi finally whispers, \"I am by nature a girl, not a boy\". He delivers the entire monologue successfully, to the joy of the troupe, and secures the agent. The troupe is invited to perform for eunuch Zhang. Shitou and Douzi are brought to Zhang\'s house where they find a finely crafted sword, which Shitou promises to one day gift to Douzi, as the hero would do for his concubine. Zhang asks to meet Douzi in his room and sexually assaults him. Douzi does not mention this to anyone, but Shitou implicitly knows what happened. On their way home, Douzi adopts an abandoned baby, who later comes under Master Guan\'s training.\r\n\r\n\r\nMemorabilia from the film exhibited at \"The Art of Leslie Cheung\'s Movie Images\", April 2013, Hong Kong Central Library.\r\nYears go by, Douzi and Shitou become Peking opera stars under stage names Cheng Dieyi and Duan Xiaolou, respectively. Their signature performance is the play Farewell My Concubine, where Dieyi plays the concubine Consort Yu and Xiaolou plays the hero Xiang Yu. Their fame attracts the attention of Yuan Shiqing, a reputable person who attends their performances. Yuan Shiqing also possesses a sword similar to the one that Dieyi and Xiaolou found, which he gives to Dieyi. The adult Dieyi has an unrequited love for Xiaolou, but when Xiaolou marries Juxian, a headstrong courtesan at an upscale brothel, Dieyi and Xiaolou\'s relationship begins to fall apart. The love triangle between Dieyi, Xiaolou, and Juxian leads to jealousy and betrayal, which is further complicated by the successive political upheavals following the Second Sino-Japanese War. When Master Guan dies, the abandoned baby, now Xiao Si, comes under Dieyi\'s training to continue learning dan roles.\r\n\r\nWhen the communist forces win the civil war, Xiao Si becomes an avid follower of the new government. Dieyi\'s addiction to opium negatively affects his performances, but he ultimately rehabilitates with the help of Xiaolou and Juxian. Xiao Si nurtures resentment against Dieyi because of his rigorous teachings and usurps his role in Farewell My Concubine during one performance, without anyone telling Dieyi beforehand. Devastated by the betrayal, Dieyi secludes himself and refuses to reconcile with Xiaolou. As the Cultural Revolution continues, the entire opera troupe is put on a struggle session by the Red Guards where, under pressure, Dieyi and Xiaolou accuse each other of counterrevolutionary acts. Dieyi also tells the guards that Juxian was a prostitute. To protect himself from further prosecution, Xiaolou swears that he does not love her and will \"make a clean break\" with her. Juxian is heartbroken and returns the sword to Dieyi before committing suicide. Afterward, Xiao Si is caught by the Red Guards when he is singing Consort Yu\'s lines to the mirror alone in a practice room.\r\n\r\nIn 1977, Dieyi and Xiaolou reunite, seeming to have mended their relationship. They once again practice Farewell My Concubine; Xiaolou begins with the line \"I am by nature a boy,\" to which Dieyi makes the same mistake of finishing with \"I am not a girl.\" As they finish their performance, Dieyi takes Xiaolou\'s sword and cuts his throat, paralleling the concubine\'s final act in the opera.', 'Farewell, My Concubine.jpg', '0', '21', '0', '1993-01-01', '155', '2020-11-07 14:13:21');
INSERT INTO `film` VALUES ('11', 'Forrest Gump', 'In 1981, at a bus stop in Savannah, Georgia, a man named Forrest Gump recounts his life story to strangers who sit next to him on a bench.\r\n\r\nIn 1951, in Greenbow, Alabama, young Forrest is fitted with leg braces to correct a curved spine, and is unable to walk properly. He lives alone with his mother, who runs a boarding house out of their home that attracts many tenants, including a young Elvis Presley, who plays the guitar for Forrest and incorporates Forrest\'s jerky dance movements into his performances. On his first day of school, Forrest meets a girl named Jenny Curran, and the two become best friends.\r\n\r\nForrest is often bullied because of his physical disability and marginal intelligence. While fleeing from several bullies, his leg braces break off, revealing Forrest to be a very fast runner. This talent eventually allows him to receive a football scholarship at the University of Alabama in 1963, where he is coached by Bear Bryant; he witnesses Governor George Wallace\'s stand in the schoolhouse door, becomes a top kick returner, is named on the All-American team, and meets President John F. Kennedy at the White House.\r\n\r\nAfter graduating college in 1967, Forrest enlists into the U.S. Army. During basic training, he befriends a fellow soldier nicknamed \"Bubba\", who convinces Forrest to go into the shrimping business with him after their service. In 1968, they are sent to Vietnam, serving with the 9th Infantry Division in the Mekong Delta region. After months of routine operations, their platoon is ambushed while on patrol, and Bubba is killed in action. Forrest saves several wounded platoon-mates—including his lieutenant, Dan Taylor, who loses both his legs—and is awarded the Medal of Honor for his heroism by President Lyndon B. Johnson.\r\n\r\nAt the anti-war \"March on the Pentagon\" rally, Forrest meets Abbie Hoffman and briefly reunites with Jenny, who has been living a hippie lifestyle. He also develops a talent for ping-pong, and becomes a sports celebrity as he competes against Chinese teams in ping-pong diplomacy, earning him an interview alongside John Lennon on The Dick Cavett Show. He spends the holidays and the 1972 new year in New York City with Lieutenant Dan, who has become an embittered cripple. Forrest soon meets President Richard Nixon and is put up in the Watergate complex, where he accidentally exposes the Watergate scandal, forcing Nixon to resign. Forrest is eventually discharged from the army.\r\n\r\nReturning to Greenbow, Forrest endorses a company that makes ping-pong paddles. He uses the earnings to buy a shrimping boat in Bayou La Batre, fulfilling his promise to Bubba. Lieutenant Dan joins Forrest in 1974, and they initially have little success. After their boat becomes the only one to survive Hurricane Carmen, they pull in huge amounts of shrimp and create the Bubba Gump Shrimp Company, after which Lieutenant Dan finally thanks Forrest for saving his life. Lieutenant Dan invests into what Forrest thinks is ”some kind of fruit company” and the two become millionaires, but Forrest also gives half of the earnings to Bubba\'s family. Forrest then returns home to see his mother as she dies of cancer.\r\n\r\nIn 1976, Jenny—in the midst of recovering from years of drugs and abuse—returns to visit Forrest, and after a while he proposes to her. That night she tells Forrest she loves him and the two make love, but she leaves the next morning. Heartbroken, Forrest goes running, and spends the next three years in a relentless cross-country marathon, becoming famous again before returning home to Greenbow.\r\n\r\nBack in 1981, Forrest reveals that he is waiting at the bus stop because he received a letter from Jenny, who asked him to visit her. As Forrest is finally reunited with Jenny, she introduces him to their son, named Forrest Gump, Jr. Jenny tells Forrest she is sick with an unknown incurable virus, and the three move back to Greenbow. Jenny and Forrest finally marry, but she dies a year later. The film ends with Forrest seeing his son off on his first day of school.', 'Forrest Gump.jpg', '0', '17', '0', '1994-07-06', '142', '2020-11-07 14:17:54');
INSERT INTO `film` VALUES ('12', 'Léon', 'Léon is an Italian hitman (or \"cleaner\", as he refers to himself) living a solitary life in New York City\'s Little Italy. His work comes from a mafioso named \"Old Tony\".\r\n\r\nOne day, Léon meets Mathilda Lando, a lonely 12-year-old girl. Mathilda lives with her dysfunctional family in an apartment down the hall, and has stopped attending class at her school for troubled girls. Mathilda\'s abusive father attracts the ire of corrupt DEA agents, who have been paying him to stash cocaine in his apartment. After they discover he has been stealing the cocaine, DEA agents storm the building, led by sharply dressed drug addict Norman Stansfield. During the raid, Stansfield murders Mathilda\'s entire family while she is out shopping for groceries. When Mathilda returns, she realizes what has happened just in time to continue down the hall to Léon\'s apartment; he hesitantly gives her shelter.\r\n\r\nMathilda quickly discovers that Léon is a hitman. She begs him to take care of her and to teach her his skills, as she wants to avenge the murder of her four-year-old brother. At first, Léon is unsettled by her presence, and considers murdering her, but he eventually trains Mathilda and shows her how to use various weapons. In exchange, she runs his errands, cleans his apartment, and teaches him how to read. In time, the pair form a close bond. Mathilda looks up to Léon and quickly develops a crush on him, often telling him she loves him, but he refuses to reciprocate.\r\n\r\nWhen Léon heads out for an apparent assignment, Mathilda fills a bag with guns from Léon\'s collection and sets out to kill Stansfield. She bluffs her way into the DEA office by posing as a delivery girl, only to be ambushed by Stansfield in a bathroom; one of his men arrives and announces that Léon had just killed Malky, one of the corrupt DEA agents, in Chinatown that morning. Léon, after discovering her plan in a note left for him, rescues Mathilda, killing two more of Stansfield\'s men in the process. An enraged Stansfield confronts Tony, who is violently interrogated for Léon\'s whereabouts.\r\n\r\nAs Mathilda and Léon recover from the ordeal, Léon tells her about how he became a cleaner; when Léon was young in Italy, he was in love with a girl from a wealthy family. The two made plans to elope, but when the girl\'s father discovered their relationship, he killed her out of anger and escaped justice. Léon killed the father out of revenge and fled to New York, where he met Tony and trained to become a cleaner.\r\n\r\nLater, while Mathilda returns home from grocery shopping, a NYPD ESU team sent by Stansfield captures her and attempts to infiltrate Léon\'s apartment. Léon ambushes the ESU team and rescues Mathilda. Léon creates a quick escape for Mathilda by smashing a hole in an air shaft; he tells her to meet him at Tony\'s place in an hour, and tells her that he loves her, moments before the police blow up the apartment. In the chaos that follows, Léon sneaks out of the building disguised as a wounded ESU officer; he goes unnoticed save for Stansfield, who follows him and shoots him in the back. As he is dying, Léon places an object in Stansfield\'s hands that he says is \"from Mathilda\"; Stansfield discovers that it is a grenade pin. He then opens Léon\'s vest to find a cluster of active grenades, which promptly detonate, killing Stansfield.\r\n\r\nMathilda goes to Tony, as Léon had told her to do earlier. Mathilda tries to convince Tony to hire her in Leon\'s place, but Tony flatly refuses to hire a twelve-year-old, and tells Mathilda he had been instructed by Léon to give his money to her if anything happened to him. He gives Mathilda $100 from Leon\'s funds as an allowance, and sends her back to school, where the headmistress re-admits her after Mathilda reveals what had happened to her. She then walks onto a field near the school to plant Léon\'s houseplant, as she had told Léon that he should \"give it roots\".', '202011071430165c61bc9c23ea4f5caf5a99df0d437a80.jpg', '0', '10', '0', '1994-09-14', '133', '2020-11-07 14:30:17');
INSERT INTO `film` VALUES ('13', 'Titanic', 'In 1996, treasure hunter Brock Lovett and his team board the research vessel Akademik Mstislav Keldysh to search the wreck of RMS Titanic for a necklace with a rare diamond, the Heart of the Ocean. They recover a safe containing a drawing of a young woman wearing only the necklace dated April 14, 1912, the day the ship struck the iceberg.[Note 1] Rose Dawson Calvert, the woman in the drawing, is brought aboard Keldysh and tells Lovett of her experiences aboard Titanic.\r\n\r\nIn 1912 Southampton, 17-year-old first-class passenger Rose DeWitt Bukater, her fiancé Cal Hockley, and her mother Ruth board the luxurious Titanic. Ruth emphasizes that Rose\'s marriage will resolve their family\'s financial problems and allow them to retain their upper-class status. Distraught over the engagement, Rose climbs over the stern and contemplates suicide; Jack Dawson, a poor artist, intervenes and discourages her. Discovered with Jack, Rose tells a concerned Cal that she was peering over the edge and Jack saved her from falling. Cal becomes indifferent, and it is suggested to him that Jack be rewarded; he invites Jack to dine with them in first-class. Jack and Rose develop a tentative friendship, despite Cal, his valet Spicer Lovejoy, and Ruth, being wary of him. Following dinner, Rose secretly joins Jack at a party in third-class.\r\n\r\nAware of Cal and Ruth\'s disapproval, Rose rebuffs Jack\'s advances, but later realizes she prefers him over Cal. After rendezvousing on the bow at sunset, Rose takes Jack to her state room; at her request, Jack sketches Rose posing nude wearing Cal\'s engagement present, the Heart of the Ocean. They evade Lovejoy, and have sex in an automobile inside the cargo hold. On the forward deck, they witness the ship\'s collision with an iceberg and overhear its officers and builder discussing its seriousness.\r\n\r\nCal discovers Jack\'s sketch of Rose and an insulting note from her in his safe along with the necklace. When Jack and Rose attempt to inform Cal of the collision, Cal retaliates by having Lovejoy slip the necklace into Jack\'s pocket, accusing him of theft. Jack is arrested and restrained in the master-at-arms\' office. Cal puts the necklace in his own coat pocket.\r\n\r\nWith the ship sinking, Rose flees Cal and her mother, who has boarded a lifeboat, and frees Jack. On the boat deck, Cal and Jack encourage her to board a lifeboat. While intending only to save himself, Cal claims he can ensure he and Jack get off safely. As her lifeboat lowers, Rose realizes she cannot leave Jack, and jumps back on board. Cal takes Lovejoy\'s pistol and chases Rose and Jack into the flooding first-class dining saloon. After using up his ammunition, he relents. Cal realizes he gave his coat, and consequently the necklace, to Rose. He later boards a lifeboat by carrying a lost child.\r\n\r\nAfter braving several obstacles, Jack and Rose return to the boat deck. The lifeboats have departed and passengers are falling to their deaths as the stern rises out of the water. The ship breaks in half, dropping the stern into the water. Jack and Rose climb onto the back of it, and ride it into the ocean. He helps her onto a wooden panel buoyant enough for only one person. He assures her that she will die an old woman, warm in her bed. Jack dies of hypothermia,[8] but Rose is saved by a returning lifeboat.\r\n\r\nThe RMS Carpathia later rescues the survivors; on board, Rose hides from Cal en route to New York City, where she gives her name as Rose Dawson. Rose says she later read that Cal committed suicide after losing his fortune in the Wall Street Crash of 1929.\r\n\r\nBack in the present, Lovett decides to abandon his search after hearing Rose\'s story. Alone on the stern of Keldysh, Rose takes out the Heart of the Ocean, which was in her possession all along, and drops it into the sea over the wreck site. While she is seemingly asleep or has died in her bed,[9] photos on her dresser depict a life of freedom and adventure. A young Rose reunites with Jack at Titanic\'s Grand Staircase, applauded by those who died on the ship.', '20201107162651197e643fa0474f3186dfee3bf47e64e1.jpg', '0', '12', '0', '1997-12-19', '194', '2020-11-07 16:26:52');
INSERT INTO `film` VALUES ('14', 'Life Is Beautiful', 'In 1939, in the Kingdom of Italy, Guido Orefice is a young Jewish man who arrives to work in the city (Arezzo, in Tuscany) where his uncle Eliseo runs a restaurant. Guido is comical and sharp and falls in love with a Gentile girl named Dora. Later, he sees her again in the city where she is a teacher and set to be engaged to a rich, but arrogant, man, a local government official with whom Guido has regular run-ins. Guido sets up many \"coincidental\" incidents to show his interest in Dora. Finally, Dora sees Guido\'s affection and promise, and gives in, against her better judgment. He steals the lady from her engagement party, on a horse, humiliating her fiancé and mother. They are later married and have a son, Giosuè, and run a bookstore.\r\n\r\nWhen World War II breaks out, Guido, his uncle Eliseo, and Giosuè are seized on Giosuè\'s birthday. They and many other Jews are forced onto a train and taken to a concentration camp. After confronting a guard about her husband and son, and being told there is no mistake, Dora volunteers to get on the train in order to be close to her family. However, as men and women are separated in the camp, Dora and Guido never see each other during the internment. Guido pulls off various stunts, such as using the camp\'s loudspeaker to send messages—symbolic or literal—to Dora to assure her that he and their son are safe. Eliseo is murdered in a gas chamber shortly after their arrival. Giosuè narrowly avoids being gassed himself as he hates to take baths and showers, and did not follow the other children when they had been ordered to enter the gas chambers and were told they were showers.\r\n\r\nIn the camp, Guido hides their true situation from his son. Guido explains to Giosuè that the camp is a complicated game in which he must perform the tasks Guido gives him. Each of the tasks will earn them points and whoever gets to one thousand points first will win a tank. He tells him that if he cries, complains that he wants his mother, or says that he is hungry, he will lose points, while quiet boys who hide from the camp guards earn extra points. Giosuè is at times reluctant to go along with the game, but Guido convinces him each time to continue. At one point Guido takes advantage of the appearance of visiting German officers and their families to show Giosuè that other children are hiding as part of the game, and he also takes advantage of a German nanny thinking Giosuè is one of her charges in order to feed him as Guido serves the German officers. Guido and Giosuè are almost found out to be prisoners by another server until Guido is found teaching all of the German children how to say \"Thank you\" in Italian.\r\n\r\nGuido maintains this story right until the end when, in the chaos of shutting down the camp as the Allied forces approach, he tells his son to stay in a box until everybody has left, this being the final task in the competition before the promised tank is his. Guido goes to find Dora, but he is caught by a German soldier. An officer makes the decision to murder Guido, who is led off by the soldier. While he is walking to his death, Guido passes by Giosuè one last time and winks, still in character and playing the game. Guido is then shot and left for dead in an alleyway. The next morning, Giosuè emerges from the sweat-box, just as a US Army unit led by a Sherman tank arrives and the camp is liberated. Giosuè is overjoyed about winning the game (unaware that his father is dead), thinking that he won the tank, and an American soldier allows Giosuè to ride on the tank. While traveling to safety, Giosuè soon spots Dora in the procession leaving the camp and reunites with his mother. While the young Giosuè excitedly tells his mother about how he had won a tank, just as his father had promised, the adult Giosuè, in an overheard monologue, reminisces on the sacrifices his father made for him and his story.', '2020110716290611a7cb0eadcf44d2aac1831c5355b96b.jpg', '0', '8', '0', '1997-12-20', '116', '2020-11-07 16:29:07');
INSERT INTO `film` VALUES ('15', 'Spirited Away', 'Ten-year-old Chihiro and her parents are traveling to their new home. They make a wrong turn and stop in front of a tunnel leading to what appears to be an abandoned village, which Chihiro\'s father insists on exploring despite his daughter\'s misgivings. They find a seemingly empty restaurant still stocked with food, which Chihiro\'s parents immediately begin to eat. While exploring further, Chihiro finds an exquisite bathhouse and meets a boy named Haku, who warns her to return across the riverbed before sunset. However, Chihiro discovers too late that her parents have metamorphosed into pigs, and she is unable to cross the now-flooded river.\r\n\r\nHaku finds Chihiro and advises her to ask for a job from the bathhouse\'s boiler-man, Kamaji. Kamaji asks Lin, a bathhouse worker, to send Chihiro to Yubaba, the witch who runs the bathhouse. Yubaba tries to frighten Chihiro away, but Chihiro persists, and Yubaba hires her. Yubaba takes away the second kanji of her name, Chihiro (千尋), renaming her Sen (千). Haku later warns her that if she forgets her name like he has forgotten his, she will not be able to leave the spirit world.\r\n\r\nSen is treated poorly by the other bathhouse workers; only Kamaji and Lin show sympathy for her. While working, she invites a silent creature named No-Face inside, believing him to be a customer. A \"stink spirit\" arrives as Sen\'s first customer, and she discovers he is the spirit of a polluted river. In gratitude for cleaning him, he gives Sen a magic emetic dumpling. Meanwhile, No-Face, imitating the gold left behind by the stink spirit, tempts a worker with gold and then swallows him. He demands food and begins tipping expensively. He swallows two more workers when they interfere with his conversation with Sen.\r\n\r\nSen sees paper Shikigami attacking a Japanese dragon and recognizes the dragon as Haku. When a grievously injured Haku crashes into Yubaba\'s penthouse, Sen follows him upstairs. A shikigami that stowed away on her back shapeshifts into Zeniba, Yubaba\'s twin sister. She transforms Yubaba\'s son, Boh, into a mouse and mutates Yubaba\'s harpy into a tiny bird. Zeniba tells Sen that Haku has stolen a magic golden seal from her, and warns Sen that it carries a deadly curse. Haku destroys the shikigami, eliminating Zeniba\'s manifestation. He falls into the boiler room with Sen, Boh, and the harpy, where Sen feeds him part of the dumpling, causing him to vomit both the seal and a black slug, which Sen crushes with her foot.\r\n\r\nWith Haku unconscious, Sen resolves to return the seal and apologize to Zeniba. Sen confronts No-Face, who is now massive, and feeds him the rest of the dumpling. No-Face follows Sen out of the bathhouse, regurgitating everything he has eaten. Sen, No-Face, Boh, and the harpy travel by train to meet Zeniba. Yubaba orders that Sen\'s parents be slaughtered, but Haku reveals that Boh is missing and offers to retrieve him if Yubaba releases Sen and her parents.\r\n\r\nZeniba reveals that Sen\'s love for Haku broke her curse and that Yubaba used the black slug to take control over Haku. Haku appears at Zeniba\'s home in his dragon form and flies Sen, Boh, and the harpy to the bathhouse. No-Face decides to remain with Zeniba. In mid-flight, Sen recalls falling years ago into the Kohaku River and being washed safely ashore, correctly guessing Haku\'s real identity as the spirit of the river.\r\n\r\nWhen they arrive at the bathhouse, Yubaba forces Sen to identify her parents from among a group of pigs in order to break their curse. After Sen answers correctly that none of the pigs are her parents, she is free to go. Haku takes her to the now-dry riverbed and vows to meet her again. Chihiro returns through the tunnel with her parents, who do not remember anything after eating at the restaurant stall. When they reach their car, they find it covered in dust and leaves, but drive off toward their new home.', '202011071631501dae37d10fbe4c2bb536b5e3c38a03a5.jpg', '0', '17', '0', '2001-07-20', '125', '2020-11-07 16:31:50');
INSERT INTO `film` VALUES ('16', 'Inception', 'Dominick \"Dom\" Cobb and Arthur are \"extractors\": they perform corporate espionage using experimental military technology to infiltrate their targets\' subconscious and extract information through a shared dream world. Their latest target, Saito, reveals he arranged their mission to test Cobb for a seemingly impossible job: implanting an idea in a person\'s subconscious, or \"inception\". Saito wants Cobb to convince Robert, the son of Saito\'s ailing competitor Maurice Fischer, to dissolve his father\'s company. In return, Saito promises to clear Cobb\'s criminal status, which prevents him from returning home to his children.\r\n\r\nCobb accepts the offer and assembles his team: Eames, an identity forger; Yusuf, a chemist with a sedative for the \"dream within a dream\" strategy; and Ariadne, an architecture student tasked with designing the dream\'s labyrinth, recruited through Cobb\'s father-in-law, Professor Stephen Miles. Ariadne discovers that Cobb\'s subconscious houses an invasive projection of his late wife, Mal. After Maurice dies, Robert accompanies the body on a ten-hour flight, where the team, including Saito, sedate him into a shared dream. At each dream level, the person generating the dream stays behind to set up a \"kick\" to awaken the other team members from the deeper dream, coordinated by the playing of song \"Non, je ne regrette rien\" as an auditory cue; these kicks must occur simultaneously, despite time flowing faster in each successive level.\r\n\r\nThe first level is Yusuf\'s dream of a rainy Los Angeles. The team abducts Robert, but are attacked by projections from his subconscious. Saito is wounded, and Cobb reveals that while dying in the dream would normally waken dreamers, the sedatives stabilizing the multi-level dream will instead send them into \"limbo\": a world of infinite subconscious in which dreamers risk forgetting they are in a dream. Eames impersonates Robert\'s godfather, Peter Browning, to suggest that Robert reconsider his father\'s will. Cobb tells Ariadne that he and Mal entered limbo while experimenting with the dream-sharing technology. Sedated for five hours of real time, they spent fifty years in a dream world. When Mal refused to return to reality, Cobb used a rudimentary form of inception by reactivating her totem, an object dreamers use to distinguish dreams from reality. After waking up, Mal still believed she was dreaming. Attempting to \"wake up\" for real, she committed suicide and framed Cobb for her death to force him to do the same. Cobb fled the U.S., leaving his children in Miles\' care. Yusuf drives the team in a van as they are sedated into the second level, a hotel dreamed by Arthur. Cobb persuades Robert that he has been kidnapped by Browning, and that Cobb is his subconscious protector, leading Robert into another level in a ruse to enter Robert\'s subconscious.\r\n\r\nThe team infiltrate the third level, a fortified mountain hospital dreamed by Eames, and hold off the guards as Saito takes Robert into the equivalent of his subconscious. Yusuf, pursued by Robert\'s projections in the first level, deliberately drives off a bridge, initiating his kick too soon. This causes an avalanche in Eames\' level, and removes gravity on Arthur\'s level, forcing Arthur to improvise a new kick synchronized with the van hitting the water. Mal\'s projection emerges in Eames\' level and kills Robert; Cobb kills Mal, and Saito succumbs to his wounds. Cobb and Ariadne enter limbo to rescue Robert and Saito, while Eames prepares a kick by rigging the hospital with explosives.\r\n\r\nCobb makes peace with his guilt over Mal\'s death. Ariadne kills Mal\'s projection and wakes Robert up with a kick. Revived at the third level, he discovers the planted idea: a projection of his dying father telling him to be his own man. While Cobb searches for Saito in limbo, the others ride the synchronized kicks back to reality. Cobb finds an aged Saito and reminds him of their agreement. The dreamers all awaken on the plane, and Saito makes a phone call.\r\n\r\nArriving at Los Angeles International Airport, Cobb passes the U.S. immigration checkpoint and Miles accompanies him to his home. Using Mal\'s totem—a top that spins indefinitely in a dream—to test if he is indeed in the real world, Cobb does not observe the result and instead joins his children.', '202011071633516c8df0393f054eb7b66c028e08c415cf.jpg', '0', '15', '0', '2010-07-16', '148', '2020-11-07 16:33:52');
INSERT INTO `film` VALUES ('17', 'Interstellar', 'In 2067,crop blights and dust storms threaten humanity\'s survival. Corn is the last viable crop. The world also regresses into a post-truth society where younger generations are taught false history, including the faking of the Apollo moon missions. Widowed engineer and former NASA pilot Joseph Cooper is now a farmer. Living with him are his father-in-law, Donald; his 15-year-old son, Tom Cooper, and 10-year-old daughter, Murphy \"Murph\" Cooper. After a dust storm, strange dust patterns inexplicably appear on Murphy\'s bedroom floor; she attributes the anomaly to a ghost. Cooper eventually deduces the patterns were caused by gravity variations and that they represent geographic coordinates in binary code. Cooper follows the coordinates to a secret NASA facility headed by Professor John Brand, Cooper\'s former supervisor. Professor Brand says gravitational anomalies have happened elsewhere. Forty-eight years earlier, unknown beings positioned a wormhole near Saturn, opening a path to a distant galaxy with twelve potentially habitable worlds located near a black hole named Gargantua. Twelve volunteers travelled through the wormhole to individually survey the planets. Astronauts Miller, Edmunds, and Mann reported positive results. Based on their data, Professor Brand conceived two plans to ensure humanity\'s survival. Plan A involves developing a gravitational propulsion theory to propel colonies into space, while Plan B involves launching the Endurance spacecraft carrying 5,000 frozen human embryos to colonize a habitable planet.\r\n\r\nCooper is recruited to pilot the Endurance. The crew includes scientists Dr. Amelia Brand (Professor Brand\'s daughter), Dr. Romilly, Dr. Doyle, and robots TARS and CASE. Before leaving, Cooper gives a distraught Murphy his wristwatch to compare their relative time for when he returns. After traversing the wormhole, Romilly studies the black hole while Cooper, Doyle, and Brand descend in a landing craft to investigate Miller\'s planet, an ocean world. After finding wreckage from Miller\'s ship, a gigantic tidal wave kills Doyle (because the gravitational pull on this planet was high) and delays the lander\'s departure. Due to the proximity of the black hole, time is severely dilated: as a result, 23 years have elapsed for Romilly on Endurance by the time Cooper and Brand return.\r\n\r\nEdmunds\' planet has slightly better telemetry, while Mann broadcasts positive data. Cooper decides to use their remaining fuel to reach Mann\'s planet, where they revive him from cryostasis. Meanwhile, Murph, now a scientist working with NASA, transmits a message announcing Professor Brand has died. She has learned that Plan A, which required unattainable data from within a black hole, was never viable. Plan B was always Professor Brand\'s only option. Murphy accuses Brand and Cooper of knowing that those left on Earth were doomed. Cooper subsequently declares that he will be returning to Earth while Brand and Romilly will remain on Mann\'s planet for permanent habitation as the planet is believed to be habitable. Cooper goes with Mann to explore and inspect the planet. Mann reveals to Cooper that the frozen planet is uninhabitable as he had sent falsified data in order to be rescued; Mann attempts to kill Cooper so that he can take the Endurance to \"complete the mission\" by going to Edmunds\' planet. He then takes a lander and heads for Endurance. Meanwhile, Romilly is killed by a booby trap left by Mann. Brand and Cooper race to the Endurance in another lander. Mann dies during a failed manual docking operation, severely damaging Endurance. After a difficult docking manoeuver, Cooper regains control of the damaged but functional Endurance.\r\n\r\n\r\nMiller\'s planet orbiting Gargantua\r\nWith insufficient fuel to reach Edmunds\' planet, they use a slingshot maneuver so close to Gargantua that time dilation adds another 51 years. In the process, Cooper and TARS jettison themselves to shed weight and propel Endurance using Newton\'s third law to ensure Endurance reaches Edmunds\' planet. Slipping through the event horizon of Gargantua, they eject from their respective craft and find themselves inside a massive tesseract, constructed by future humans. Across different time periods, Cooper can see through the bookcases of Murphy\'s old room on Earth and weakly interact with its gravity. Cooper realizes he was Murphy\'s \"ghost\" and manipulates the second hand of the wristwatch he gave her, using Morse code to transmit the quantum data that TARS collected from inside the event horizon. Cooper and TARS are ejected from the tesseract. Cooper is picked up and awakens on a space habitat orbiting Saturn, where he reunites with an elderly Murphy. Using the quantum data sent by Cooper, the younger Murphy had solved the gravitational propulsion theory for Plan A, enabling humanity\'s exodus and survival. Nearing death and with her own family, Murphy urges Cooper to return to Amelia, telling him that \"no parent should have to watch their own child die.\" Cooper and TARS take a spacecraft to rejoin Amelia and CASE on Edmunds\' habitable planet.', '20201107163554d53b0827278c47d78e38d7e040575620.jpg', '0', '12', '0', '2014-11-07', '169', '2020-11-07 16:35:54');
INSERT INTO `film` VALUES ('18', 'WALL·E', 'In the 29th century, rampant consumerism and environmental neglect have turned Earth into a garbage-strewn wasteland; humanity is nowhere to be found and has been evacuated by the megacorporation Buy-N-Large (BnL) on giant starliners seven centuries earlier. Of all the robotic trash compactors left by BnL to clean up, only one remains operational: a Waste Allocation Load-Lifter: Earth Class named WALL-E. One day, WALL-E\'s routine of compressing trash and collecting interesting objects is broken by the arrival of an unmanned probe carrying an Extraterrestrial Vegetation Evaluator named EVE, sent to scan the planet for human-sustainable life. WALL-E is smitten by the sleek, otherworldly robot; and the two begin to connect until EVE goes into standby when WALL-E shows her his most recent find: a living seedling. The probe then collects EVE and the plant, and—with WALL-E clinging on—returns to its mothership, the starliner Axiom.\r\n\r\nIn the centuries since the Axiom left Earth, its passengers have degenerated into helpless corpulence due to laziness and microgravity, their every whim catered to by machinery; even the captain, one B. McCrea, is used to sitting back while his robotic lieutenant and steering wheel AUTO flies the ship. McCrea is taken aback by a positive probe response and learns that placing the plant in the ship\'s Holo-Detector will trigger a hyperjump back to Earth so humanity can begin recolonization. Upon inspecting EVE\'s storage compartment, however, the plant turns up missing, and EVE blames WALL-E for its disappearance.\r\n\r\nWith the plant missing, EVE is deemed faulty and taken to Diagnostics. Mistaking the process for torture, WALL-E shuts all of Diagnostics down, causing him and EVE to be designated as rogues. Frustrated, EVE tries to send WALL-E home on an escape pod, but they are interrupted when AUTO\'s first mate GO-4 arrives and stows the stolen plant in a pod set to self-destruct. WALL-E saves the plant from being lost for good, and he and EVE reconcile and celebrate with a \"dance in space\" around the Axiom.\r\n\r\nEVE brings the plant back to McCrea, who watches EVE\'s recordings of Earth and concludes that they have to go back. However, AUTO is revealed to be loyal only to his own secret no-return directive A113—issued after BnL inaccurately concluded centuries ago that the planet could not be saved—even when McCrea countermands it; AUTO mutinies with GO-4 as a result, electrocuting and frying WALL-E\'s circuit board, putting EVE into standby, throwing them both down the garbage chute, and locking McCrea in his quarters. EVE and WALL-E are nearly ejected into space along with the ship\'s trash but are saved by the cleaning robot \"Microbe Obliterator\" named M-O, who has been following WALL-E\'s dirt trail across the ship. As humans and robots help in securing the plant, McCrea and AUTO fight for control, resulting in GO-4 being obliterated and WALL-E being crushed in the Holo-Detector when the latter tries to keep it open; McCrea eventually overpowers and deactivates AUTO, and the plant is inserted into the Holo-Detector, initiating the hyperjump.\r\n\r\nArriving back on Earth, EVE repairs WALL-E but finds that his memory has been reset and his personality is gone. Heartbroken, EVE gives WALL-E a farewell kiss, which sparks his memory and restores his original personality. WALL-E and EVE reunite as the inhabitants of the Axiom take their first steps on Earth. During the credits, humans and robots turn the ravaged planet into a paradise, and the plant is shown to have grown into a mighty tree.', '2020110716375511b8ec98f4b645a082d48bbf2d099676.jpg', '0', '14', '0', '2008-06-27', '98', '2020-11-07 16:37:56');
INSERT INTO `film` VALUES ('19', 'Zootopia', 'In a world of anthropomorphic mammals, rabbit Judy Hopps from rural Bunnyburrow fulfills her childhood dream of becoming a police officer in urban Zootopia. Despite being the academy valedictorian, Judy is delegated to parking duty by Chief Bogo, who doubts her potential because she is a rabbit. On her first day, she is hustled by a con artist fox duo, Nick Wilde and Finnick.\r\n\r\nJudy abandons parking duty to arrest Duke Weaselton, a weasel who stole a bag of crocus bulbs known as Midnicampum holicithias. Bogo reprimands her, but an otter, Mrs. Otterton, enters Bogo\'s office pleading for someone to find her husband Emmitt, one of fourteen predators who are missing. When Judy volunteers and Assistant Mayor Dawn Bellwether praises the assignment, Bogo has no choice but to give Judy the case, stipulating she has 48 hours to find Emmitt Otterton and that she must resign if she fails.\r\n\r\nJudy blackmails Nick into assisting her by covertly recording his confession to tax evasion, having ascertained from photo evidence that Nick was the last to see Emmitt. They track Emmitt to a limousine owned by crime boss Mr. Big, who reveals Emmitt went \"savage\"—reverted to a feral state—and attacked his chauffeur Manchas. At his home, Manchas mentions Emmitt yelled about \"Night Howlers\" before the attack. Then Manchas himself turns savage and chases the pair. Judy saves Nick by trapping Manchas, and calls the ZPD for help. When help arrives, Manchas has vanished. Bogo demands Judy turn in her badge, but Nick reminds Bogo that Judy still has 10 hours to solve the case.\r\n\r\nAt City Hall, Bellwether offers Judy and Nick access to the city\'s traffic cameras. They discover Manchas was captured by wolves, whom Judy surmises are the \"Night Howlers\". They locate the missing predators—all gone savage—imprisoned at Cliffside Asylum, where Mayor Leodore Lionheart hides them from the public while trying to determine the cause of their behavior. Lionheart and the asylum staff are arrested for false imprisonment and Bellwether becomes the new mayor.\r\n\r\nJudy, praised for solving the case, has become friends with Nick and asks him to join the ZPD as her partner. However, she upsets him at a press conference by blaming predatory biology for the recent savage behavior, resulting in him to angrily reject her offer; her comments also incite hateful speech and discrimination against predators throughout Zootopia. Wracked with guilt, Judy quits her job and returns to Bunnyburrow.\r\n\r\nBack home, Judy learns the Night Howlers are actually the crocus bulbs Weaselton stole, and they contain a neurotoxin that has severe psychotropic effects on mammals. After returning to Zootopia and tearfully reconciling with Nick, the duo confront Weaselton, who, with persuasion from Mr. Big, tells them the bulbs he stole were for a ram named Doug. They find Doug in a laboratory hidden in the city subway, developing a drug made from Night Howlers, which he has been shooting at predators with a dart gun.\r\n\r\nJudy and Nick obtain the serum as evidence, but before they can reach the ZPD, Bellwether confronts them in the Natural History Museum and takes the evidence, revealing herself as the mastermind behind a prey-supremacist conspiracy to frame predators as dangerous and savage. Bellwether traps them in an exhibition after Nick refuses to abandon an injured Judy. She shoots a serum pellet at Nick to make him attack Judy, and summons the ZPD for help. But Judy and Nick have replaced the serum pellets in Bellwether\'s gun with blueberries. Enraged, Bellwether threatens to frame the pair for the attacks before discovering that Judy baited her into openly declaring her role in the attacks and recorded the confession, just as Bogo and his fellow officers arrive on the scene.\r\n\r\nBellwether and her accomplices are arrested for their crimes, while Lionheart publicly denies knowledge of her plot and states that his imprisonment of the infected predators was a \"wrong thing for the right reason\". With the cause of the epidemic identified, the predators are cured and Judy rejoins the ZPD. Nick graduates from the Zootopia Police Academy as the city\'s first fox police officer and becomes Judy\'s partner.', '202011071639189f7adc56c89b40149aa7f5017af3070b.jpg', '5', '90', '1', '2016-03-04', '108', '2020-11-07 16:39:19');
INSERT INTO `film` VALUES ('20', 'Up', 'Renowned explorer Charles F. Muntz says he has found a new species of giant bird at Paradise Falls, South America. However, archaeologists study the skeleton of the bird and conclude that Muntz fabricated it. Disgraced, Muntz vows to bring back a live specimen and will not return until he does so.\r\n\r\nYoungster Carl Fredricksen meets Ellie. Both are aspiring explorers who idolize Muntz, and the two quickly become friends. Ellie reveals her dream to Carl about going to live by Paradise Falls. The two eventually get married and repeatedly save up for a trip to Paradise Falls, but always end up spending the money on more pressing needs. As an elderly man, Carl finally buys tickets for the trip, but Ellie falls ill and dies before they can go.\r\n\r\nCarl continues living in the house he and Ellie fixed up, stubbornly holding out while the neighborhood around him is replaced by skyscrapers. When he unintentionally injures a construction worker, the developer trying to buy his place seizes the opportunity. The court deems him a public menace and orders him to move to a retirement home. However, Carl resolves to keep his promise to Ellie. Having worked his entire life as a balloon salesman, he turns his house into a makeshift airship by attaching hundreds of helium balloons to it and flies away.\r\n\r\nRussell, a young Wilderness Explorer trying to earn his final merit badge for \"Assisting the Elderly\", becomes an accidental stowaway. Before Carl can drop Russell off, a cumulonimbus storm drives them all the way to South America. The house lands on a tepui opposite Paradise Falls. Carl and Russell harness themselves to the still-buoyant house and begin to walk it across the mesa, hoping to reach the falls before the balloons deflate. Russell encounters a tall colorful bird whom he names \"Kevin\", who is trying to gather food for her chicks. They then meet a Golden Retriever named Dug, who wears a special collar that allows him to speak, and who vows to take the bird to his master. The next day, they encounter a pack of aggressive dogs (also with special collars) led by Alpha, a Doberman Pinscher, and are taken to their master, the elderly Muntz.\r\n\r\nMuntz invites Carl and Russell aboard his dirigible, where he explains to them that he is still searching for the giant bird he promised to bring back. Russell notes the bird\'s similarity to Kevin and Muntz becomes hostile, thinking they are attempting to capture the bird for themselves—he implies he has killed other visitors he suspected of doing the same thing. Carl and Russell flee with Kevin and Dug, but Kevin is injured in the process. Using the tracking device on Dug\'s collar, Muntz finds and captures Kevin, then sets fire to Carl\'s house, which pops many of the balloons. Carl is forced to decide whether to save his house or Kevin; he chooses his house, upsetting Russell. Carl finally parks the house at Paradise Falls, where Carl sadly looks through Ellie\'s childhood scrapbook and finds a final note thanking him for their \"adventure\" and encouraging him to have a new one.\r\n\r\nReinvigorated, Carl goes outside, only to see Russell flying away, using some balloons and a leaf blower, to try to rescue Kevin. Carl lightens the house enough for him and Dug to follow. Muntz captures Russell, but Carl and Dug board the dirigible and free both Russell and Kevin. Muntz pursues them around the airship and corners Kevin, Dug, and Russell inside Carl\'s house. They escape by jumping back onto the dirigible after Carl lures Kevin with chocolate; Muntz leaps after them, but gets caught on some balloon lines and falls to the ground far below. The house, having lost too many balloons, descends out of sight through the clouds.\r\n\r\nCarl and Russell reunite Kevin with her chicks and fly the dirigible back home. Russell receives his \"Assisting the Elderly\" badge and Carl gives him a bottle cap from a grape soda called \"The Ellie Badge\", the same one given to him by Ellie during his first encounter with her when they were children. Carl then becomes a grandpa-like figure to Russell. Unbeknownst to Carl, his house lands on the cliff beside Paradise Falls, fulfilling his promise to Ellie.', '20201107164130ff4421cf309a43de8afa1e9e2a077908.jpg', '0', '12', '0', '2009-05-09', '96', '2020-11-07 16:41:30');

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
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of genre
-- ----------------------------
INSERT INTO `genre` VALUES ('1', 'science', '2020-10-06 10:52:14');
INSERT INTO `genre` VALUES ('2', 'horror', '2020-10-06 10:56:29');
INSERT INTO `genre` VALUES ('5', 'animation', '2020-10-06 10:56:46');
INSERT INTO `genre` VALUES ('6', 'music', '2020-10-06 10:56:54');
INSERT INTO `genre` VALUES ('8', 'drama', '2020-11-07 14:06:05');

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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'carflo', '123', '123', 'pbkdf2:sha256:150000$7uAMm4BK$c55dad0013fd532843002b09daf6486e5c25898ec844085277e6b498a1f88f56', '123@123.com', '123', '202011071434172c16f96e433941d683a552a15bd9c917.jpg', '2020-10-06 09:41:58');
INSERT INTO `user` VALUES ('2', 'admin', 'admin', 'admin', 'pbkdf2:sha256:150000$S1e59BcO$dc45f4154319be0988bce039bf0cc869eaf44fb03e5c954d257215c002b84edb', 'admin@admin.com', '1234', '202011071435392f91afb123804f0a90d7bd4e90fbccff.png', '2020-10-06 10:21:34');
INSERT INTO `user` VALUES ('3', 'user1', '123', '123', 'pbkdf2:sha256:150000$dzluvDfc$ffd31ae90441073053f86c77289fae7f4d2ca6133f68158afb4b7856e9716a6a', '123', '12345', '2020110810561165c121a7800d4881b16541bf754656ce.png', '2020-11-08 10:55:47');

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
) ENGINE=InnoDB AUTO_INCREMENT=645 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
INSERT INTO `userlog` VALUES ('634', '3', '127.0.0.1', '2020-11-14 14:57:27', '19');
INSERT INTO `userlog` VALUES ('635', '3', '127.0.0.1', '2020-11-14 15:02:29', '19');
INSERT INTO `userlog` VALUES ('636', '2', '127.0.0.1', '2020-11-15 00:39:27', null);
INSERT INTO `userlog` VALUES ('637', '2', '127.0.0.1', '2020-11-15 00:39:31', '19');
INSERT INTO `userlog` VALUES ('638', '3', '127.0.0.1', '2020-11-15 00:59:29', null);
INSERT INTO `userlog` VALUES ('639', '3', '127.0.0.1', '2020-11-15 01:06:11', '19');
INSERT INTO `userlog` VALUES ('640', '3', '127.0.0.1', '2020-11-15 01:06:16', '9');
INSERT INTO `userlog` VALUES ('641', '3', '127.0.0.1', '2020-11-15 01:06:17', '9');
INSERT INTO `userlog` VALUES ('642', '3', '127.0.0.1', '2020-11-15 01:06:26', '9');
INSERT INTO `userlog` VALUES ('643', '3', '127.0.0.1', '2020-11-15 01:06:28', '9');
INSERT INTO `userlog` VALUES ('644', '3', '127.0.0.1', '2020-11-15 01:23:19', '19');

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
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8mb4 ROW_FORMAT=DYNAMIC;

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
