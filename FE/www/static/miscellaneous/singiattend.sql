/*
 Navicat Premium Data Transfer

 Source Server         : XAMPP
 Source Server Type    : MariaDB
 Source Server Version : 100414
 Source Host           : localhost:3306
 Source Schema         : singiattend

 Target Server Type    : MariaDB
 Target Server Version : 100414
 File Encoding         : 65001

 Date: 20/09/2021 20:12:35
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for exercise
-- ----------------------------
DROP TABLE IF EXISTS `exercise`;
CREATE TABLE `exercise` (
  `exercise_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_file_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`exercise_id`) USING BTREE,
  UNIQUE KEY `uq_log_fileName_start_time_end_time` (`log_file_name`,`start_time`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of exercise
-- ----------------------------
BEGIN;
INSERT INTO `exercise` VALUES (29, '72_7025.log', '16:00:00', '16:45:00');
INSERT INTO `exercise` VALUES (30, '73_6364.log', '16:20:00', '17:05:00');
INSERT INTO `exercise` VALUES (31, '73_7165.log', '17:10:00', '17:55:00');
COMMIT;

-- ----------------------------
-- Table structure for faculty
-- ----------------------------
DROP TABLE IF EXISTS `faculty`;
CREATE TABLE `faculty` (
  `faculty_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`faculty_id`) USING BTREE,
  UNIQUE KEY `uq_title_titleEnglish` (`title`,`title_english`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of faculty
-- ----------------------------
BEGIN;
INSERT INTO `faculty` VALUES (6, 'Еколошки факултет', 'Faculty of Ecology');
INSERT INTO `faculty` VALUES (1, 'Пословни факултет у Београду', 'Faculty of Business in Belgrade');
INSERT INTO `faculty` VALUES (4, 'Технички факултет', 'Faculty of Technical Sciences');
INSERT INTO `faculty` VALUES (3, 'Факултет за информатику и рачунарство', 'Faculty of Informatics and Computing');
INSERT INTO `faculty` VALUES (2, 'Факултет за туристички и хотелијерски менаџмент', 'Faculty of Tourism and Hospitality Management');
INSERT INTO `faculty` VALUES (5, 'Факултет за физичку културу и менаџмент у спорту', 'Faculty of Physical Education and Sports Management');
COMMIT;

-- ----------------------------
-- Table structure for lecture
-- ----------------------------
DROP TABLE IF EXISTS `lecture`;
CREATE TABLE `lecture` (
  `lecture_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `log_file_name` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `start_time` time NOT NULL,
  `end_time` time NOT NULL,
  PRIMARY KEY (`lecture_id`),
  UNIQUE KEY `uq_log_fileName_start_time_end_time` (`log_file_name`,`start_time`,`end_time`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=59 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of lecture
-- ----------------------------
BEGIN;
INSERT INTO `lecture` VALUES (46, '70_1410.log', '23:00:00', '23:45:00');
INSERT INTO `lecture` VALUES (44, '70_1684.log', '21:00:00', '21:45:00');
INSERT INTO `lecture` VALUES (45, '70_2430.log', '21:50:00', '22:35:00');
INSERT INTO `lecture` VALUES (43, '70_2932.log', '20:00:00', '20:45:00');
INSERT INTO `lecture` VALUES (48, '70_433.log', '12:00:00', '12:45:00');
INSERT INTO `lecture` VALUES (47, '70_6556.log', '11:00:00', '11:45:00');
INSERT INTO `lecture` VALUES (42, '70_6883.log', '19:00:00', '19:45:00');
INSERT INTO `lecture` VALUES (54, '71_6341.log', '12:15:00', '13:00:00');
INSERT INTO `lecture` VALUES (55, '72_4073.log', '12:00:00', '12:45:00');
INSERT INTO `lecture` VALUES (56, '72_5954.log', '13:00:00', '13:45:00');
INSERT INTO `lecture` VALUES (57, '72_6167.log', '15:15:00', '16:00:00');
INSERT INTO `lecture` VALUES (58, '73_95.log', '16:20:00', '17:05:00');
COMMIT;

-- ----------------------------
-- Table structure for staff
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `staff_id` int(10) unsigned NOT NULL,
  `name_surname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `role` enum('assistant','professor') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`staff_id`),
  UNIQUE KEY `uq_email_role` (`email`,`role`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of staff
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES (1222, 'Ивана Штрумбергер', 'istrumberger', '5FnHYUjjAf1lZULPkKlsaKYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (1337, 'Сања Филиповић', 'sfilipovic@singidunum.ac.rs', 'r1NrJGkC31Z/5GaQZV29+A==', 'professor');
INSERT INTO `staff` VALUES (1376, 'Ана Перишић', 'aperisic@singidunum.ac.rs', 'BQ9CMJULtn0zXmTSjpV3qg==', 'professor');
INSERT INTO `staff` VALUES (1500, 'Владан Марковић', 'vmarkovic@singidunum.ac.rs', 'ovYS4E/LVmRkI07cqvtngw==', 'professor');
INSERT INTO `staff` VALUES (1677, 'Немања Станишић', 'nestanisic@singidunum.ac.rs', 'KS7P9N3ol0VRCIanx2c1RQ==', 'professor');
INSERT INTO `staff` VALUES (1712, 'Горанка Кнежевић', 'gknezevic@singidunum.ac.rs', 'IXSCeoYZajAXMKRkzpocNw==', 'professor');
INSERT INTO `staff` VALUES (1721, 'Ивана Брдар', 'ibrdar@singidunum.ac.rs', 'pbGJQTaaWYIdLLa2LguF4w==', 'professor');
INSERT INTO `staff` VALUES (1802, 'Тијана Гајић', 'tigajic@singidunum.ac.rs', 'yz/sqxQjqS8sl/QUqDY6lQ==', 'professor');
INSERT INTO `staff` VALUES (1807, 'Вуле Миздраковић', 'vmizdrakovic@singidunum.ac.rs', 'acH/a04M8BF8SU8jUPtjW6YQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (1821, 'Нина Драгићевић', 'ndragicevic@singidunum.ac.rs', 'W/M1wwzQijVPb/H5M9833A==', 'professor');
INSERT INTO `staff` VALUES (1888, 'Лоис Георгиос Нектариос', 'lgeorgios@singidunum.ac.rs', 'kxrKl5PNsiism4Rs8vLY9A==', 'professor');
INSERT INTO `staff` VALUES (1941, 'Ендре Пап', 'epap@singidunum.ac.rs', 'O7hexauYiX0yCO95CK8Glw==', 'professor');
INSERT INTO `staff` VALUES (2017, 'Милош Добројевић', 'mdobrojevic@singidunum.ac.rs', 'L4zGDXOVrwnqQ7WZI+GNFQ==', 'professor');
INSERT INTO `staff` VALUES (2064, 'Велисав Марковић', 'vlmarkovic@singidunum.ac.rs', 'eGM/9NYrHK/w6WiQldXIvw==', 'professor');
INSERT INTO `staff` VALUES (2132, 'Милена Рикаловић', 'mrikalovic@singidunum.ac.rs', 'yQO1LUmjO5xR0j79mva6Zg==', 'professor');
INSERT INTO `staff` VALUES (2140, 'Ивица Терзић', 'iterzic@singidunum.ac.rs', 'WtnZukTaKzT1y8ZIB53Pvw==', 'professor');
INSERT INTO `staff` VALUES (2164, 'Жаклина Спалевић', 'zspalevic@singidunum.ac.rs', 'cVVsOIhPc/HMaFHMQUpFyA==', 'professor');
INSERT INTO `staff` VALUES (2170, 'Зоран Петровић', 'zpetrovic@singidunum.ac.rs', 'l6FRZEGLO31wohhbSMWR0w==', 'professor');
INSERT INTO `staff` VALUES (2750, 'Бранислав Банић', 'bbanic@singidunum.ac.rs', 'howj7VySfQMSBtNmjAvc8Q==', 'professor');
INSERT INTO `staff` VALUES (2971, 'Марина Савковић', 'msavkovic@singidunum.ac.rs', 'mU0BfIvU27hR20V4FHVT8g==', 'professor');
INSERT INTO `staff` VALUES (2982, 'Милош Милошевић', 'mmilosevic@singidunum.ac.rs', 'ssSMg1woid+mdyhKCZlG+w==', 'professor');
INSERT INTO `staff` VALUES (3244, 'Радмила Сузић', 'rsuzic@singidunum.ac.rs', 'KsfsKo/T9nfoimJOsnseZw==', 'professor');
INSERT INTO `staff` VALUES (3254, 'Иван Ћук', 'icuk@singidunum.ac.rs', 'UPGk1bVBRQjahQkjI/MHmg==', 'professor');
INSERT INTO `staff` VALUES (3325, 'Јелена Предић Аткинсон', 'jpredic@singidunum.ac.rs', 'Jw5fYjGF8FkGJROuNqaJdA==', 'professor');
INSERT INTO `staff` VALUES (3403, 'Драган Цветковић', 'dcvetkovic@singidunum.ac.rs', 'n8VoPzva2D8Txa6XArvlQQ==', 'professor');
INSERT INTO `staff` VALUES (3446, 'Дорђе Обрадовић', 'dobradovic@singidunum.ac.rs', 'Rbmn4EgDZ7ddKf/OocDnrQ==', 'professor');
INSERT INTO `staff` VALUES (3504, 'Марија Станковић', 'mstankovic@singidunum.ac.rs', 'd7XB96ZVDAWGlPFJPFOIhw==', 'professor');
INSERT INTO `staff` VALUES (3516, 'Никица Радовић', 'nradovic@singidunum.ac.rs', 'KGE+U/46+8g52W+pcG0xVA==', 'professor');
INSERT INTO `staff` VALUES (3531, 'Зоран Цекић', 'zcekic@singidunum.ac.rs', 'uai/cTTILU4nWOo5izmEog==', 'professor');
INSERT INTO `staff` VALUES (3565, 'Лепа Бабић', 'lbabic@singidunum.ac.rs', 'K/U+YxcKc4Cuhj47WyfqeA==', 'professor');
INSERT INTO `staff` VALUES (3650, 'Ивана Ђерић', 'idjeric@singidunum.ac.rs', 'y0zvolGYWeM+DW1+2wLRXA==', 'professor');
INSERT INTO `staff` VALUES (3668, 'Дејан Живковић', 'dzivkovic@singidunum.ac.rs', 'XT5voXhFzbEl6sffOBb/fA==', 'professor');
INSERT INTO `staff` VALUES (3810, 'Предраг Гавриловић', 'pgavrilovic@singidunum.ac.rs', 'e9k+vWHkOgwLcWK6z3/5TA==', 'professor');
INSERT INTO `staff` VALUES (3867, 'Милош Станковић', 'mistankovic@singidunum.ac.rs', 'LIU+HgoYJ59jg46+2y3g+g==', 'professor');
INSERT INTO `staff` VALUES (3956, 'Маја Вељковић Мичос', 'mveljkovic@singidunum.ac.rs', 'gdeFywalhs/izqCWqAigFA==', 'professor');
INSERT INTO `staff` VALUES (4005, 'Наташа Килибарда', 'nkilibarda@singidunum.ac.rs', 'IfXjbH9z/cLQmGoVaJtogw==', 'professor');
INSERT INTO `staff` VALUES (4030, 'Давор Корчок', 'dkorcok@singidunum.ac.rs', 'VX7xvrk552Hfq+2p9g8uSQ==', 'professor');
INSERT INTO `staff` VALUES (4255, 'Бранко Перишић', 'bperisic@singidunum.ac.rs', 'uEu6nH51JTI6+PBUas5mFA==', 'professor');
INSERT INTO `staff` VALUES (4289, 'Биљана Стојановић', 'bstojanovic@singidunum.ac.rs', '6/o/ztFlbDU5cd7GyB3O4Q==', 'professor');
INSERT INTO `staff` VALUES (4294, 'Павле Павловић', 'ppavlovic@singidunum.ac.rs', 'OueMBXOFyGO28IODC5sYMw==', 'professor');
INSERT INTO `staff` VALUES (4327, 'Ненад Дикић', 'ndikic@singidunum.ac.rs', 'XYknc3CtHqhYdwgFolgMVQ==', 'professor');
INSERT INTO `staff` VALUES (4392, 'Тијана Радојевић', 'tradojevic@singidunum.ac.rs', 'g64qmHfAnqPWVQopPZQZdg==', 'professor');
INSERT INTO `staff` VALUES (4430, 'Иван Миловановић', 'imilovanovic@singidunum.ac.rs', 'oWcS15HOFr5rDpl10LgA46YQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (4474, 'Владимир Џамић', 'vdzamic@singidunum.ac.rs', 'mKfQlx4OX/EsqU5i07ZDag==', 'professor');
INSERT INTO `staff` VALUES (4486, 'Виолета Томашевић', 'vtomasevic@singidunum.ac.rs', 'VTusuwYnLI9cfjb/sVB0ZQ==', 'professor');
INSERT INTO `staff` VALUES (4490, 'Марија Костић', 'mkostic@singidunum.ac.rs', '6eKvopAq2iNJ0iSStxIwKA==', 'professor');
INSERT INTO `staff` VALUES (4674, 'Живка Малић', 'zmalic@singidunum.ac.rs', 'FF1Y0h5rW4byprCLyUlloA==', 'professor');
INSERT INTO `staff` VALUES (4755, 'Месуд Аџемовић', 'madzemovic@singidunum.ac.rs', 'oThNtulKUFSlgZJZDJm8wg==', 'professor');
INSERT INTO `staff` VALUES (4767, 'Наташа Станишић', 'nstanisic@singidunum.ac.rs', '6wGs6t8T0c6UmaNgb7dopg==', 'professor');
INSERT INTO `staff` VALUES (4785, 'Марко Танасковић', 'mtanaskovic@singidunum.ac.rs', '4el4Av4FDQcdtexGVuE+sw==', 'professor');
INSERT INTO `staff` VALUES (4846, 'Сузана Ђорђевић Милошевић', 'sdjordjevic@singidunum.ac.rs', '/MpW4BuH4VQVYMAPn7x7kw==', 'professor');
INSERT INTO `staff` VALUES (4881, 'Валентина Бошковић Марковић', 'vboskovic@singidunum.ac.rs', '4U1x8K+WY69XXubbRDxuDA==', 'professor');
INSERT INTO `staff` VALUES (4930, 'Јован Травица', 'jtravica@singidunum.ac.rs', 'D8MWXrmGH8v2u3JUsPawXg==', 'professor');
INSERT INTO `staff` VALUES (4949, 'Марко Павићевић', 'mpavicevic@singidunum.ac.rs', 'rAmj4SJBujP46GIYzYPIOQ==', 'professor');
INSERT INTO `staff` VALUES (4964, 'Драгана Четојевић Симин', 'dcetojevic@singidunum.ac.rs', 'HXj0t+kJcOnu3H6zAa/G8A==', 'professor');
INSERT INTO `staff` VALUES (4965, 'Лидија Амиџић', 'lamidzic@singidunum.ac.rs', 'oMP4MmCncgYnzv4qfdn4iw==', 'professor');
INSERT INTO `staff` VALUES (5091, 'Емилијан Мохора', 'emohora@singidunum.ac.rs', '+GU3ihm0hx3ikLTUKqSVzQ==', 'professor');
INSERT INTO `staff` VALUES (5130, 'Милован Станишић', 'mstanisic@singidunum.ac.rs', 'pdEYjI6DKVuiy/Na6z1Okg==', 'professor');
INSERT INTO `staff` VALUES (5141, 'Милош Пупавац', 'mpupavac@singidunum.ac.rs', 'zqRJXj8sjiOpX6TeTwyZ9w==', 'professor');
INSERT INTO `staff` VALUES (5161, 'Милена Николић', 'mnikolic@singidunum.ac.rs', 'PrlcPYi2uElFv0M/Tev3Dg==', 'professor');
INSERT INTO `staff` VALUES (5240, 'Владислав Мишковиц', 'vmiskovic@singidunum.ac.rs', 'CfqMY3+5veJht2Fonnw/9A==', 'professor');
INSERT INTO `staff` VALUES (5256, 'Александра Гагић', 'agagic@singidunum.ac.rs', 'QI3jOEUSSLid5rCdZs5VdQ==', 'professor');
INSERT INTO `staff` VALUES (5257, 'Небојша Бачанин Џакула', 'nbacanin@singidunum.ac.rs', '9HtAXAN5w0JoDBCviBQmZA==', 'professor');
INSERT INTO `staff` VALUES (5369, 'Иван Ковачевић', 'ikovacevic@singidunum.ac.rs', 'wUT142RbShFyjSZlofbPVQ==', 'professor');
INSERT INTO `staff` VALUES (5456, 'Мирко Росић', 'mrosic@singidunum.ac.rs', 'BKdUS+SYAHt4KbGzR5WwFg==', 'professor');
INSERT INTO `staff` VALUES (5615, 'Гордана Дражић', 'gdrazic@singidunum.ac.rs', 'L13pOW2vXHUHEd8LzczXRg==', 'professor');
INSERT INTO `staff` VALUES (5662, 'Ангелина Његуш', 'anjegus@singidunum.ac.rs', 'V3h2yXELV25flHU60vbSPA==', 'professor');
INSERT INTO `staff` VALUES (5689, 'Саша Радоја', 'sradoja@singidunum.ac.rs', 'GD8gaxpdHZQnMlNxdXRPNg==', 'professor');
INSERT INTO `staff` VALUES (6185, 'Софија Петковић', 'spetkovic@singidunum.ac.rs', 'MUZYrFZCgfppNjsYC4fuUQ==', 'professor');
INSERT INTO `staff` VALUES (6231, 'Драгиша Величковић', 'dvelickovic@singidunum.ac.rs', 'AVgs5mwUkF6BlwLjki6dCQ==', 'professor');
INSERT INTO `staff` VALUES (6273, 'Александар Јевремовић', 'ajevremovic@singidunum.ac.rs', 'NXMQHCdCILeuT5IiIT7B+Q==', 'professor');
INSERT INTO `staff` VALUES (6314, 'Милован Крњајић', 'mkrnjajic@singidunum.ac.rs', 'fy4iNFRYGJMLIFBg8CBYtw==', 'professor');
INSERT INTO `staff` VALUES (6357, 'Лидија Барјактаровић', 'lbarjaktarovic@singidunum.ac.rs', 'WKAuyPhbdS1YGHjMfaeQmmGsHatZSLxlP5cMIcV1oKg=', 'professor');
INSERT INTO `staff` VALUES (6406, 'Горан Авлијаш', 'gavlijas@singidunum.ac.rs', 'EyD2Af0oA7hKkaRt2+0R6w==', 'professor');
INSERT INTO `staff` VALUES (6411, 'Предраг Вукадиновић', 'pvukadinovic@singidunum.ac.rs', 'USCEY7GAJryXotnoFOgXLqYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (6415, 'Миодраг Живковић', 'mzivkovic@singidunum.ac.rs', 'BMqU77sG5SDPDAkhPnbefQ==', 'professor');
INSERT INTO `staff` VALUES (6435, 'Ана Јованцаи Стакић', 'ajovancai@singidunum.ac.rs', 'XhNXgb+q8CldgbPSxbz0FA==', 'professor');
INSERT INTO `staff` VALUES (6441, 'Дарија Лунић', 'dlunic@singidunum.ac.rs', 'zaVNwT0nfbdaOTM31HI4sg==', 'professor');
INSERT INTO `staff` VALUES (6501, 'Милан Милосављевић', 'mmilosavljevic@singidunum.ac.rs', 'DnOSsBz38EeFuaIEYDn8/WAWXyWTH3kW9DlN0l37nss=', 'professor');
INSERT INTO `staff` VALUES (6653, 'Милица Чоловић', 'mcolovic@singidunum.ac.rs', 'CpfeFsc56qYmNAQapyNCZA==', 'professor');
INSERT INTO `staff` VALUES (6757, 'Тамара Стојменовић', 'tstojmenovic@singidunum.ac.rs', 'cBFXBBe8U3Wx6vtwVCYRv6YQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (6793, 'Срђан Марковић', 'smarkovic@singidunum.ac.rs', 'IGZu6nAiD5MNG6oXkloQww==', 'professor');
INSERT INTO `staff` VALUES (6805, 'Тамара Гајић', 'tgajic@singidunum.ac.rs', '9MhOVCmm9o5ii9N0BM9syg==', 'professor');
INSERT INTO `staff` VALUES (6809, 'Маријана Продановић', 'mprodanovic@singidunum.ac.rs', 'B+LaOslz3yqG8yORxSIp3Q==', 'professor');
INSERT INTO `staff` VALUES (6988, 'Ана Благојевић', 'ablagojevic@singidunum.ac.rs', 'rAahAw2zFjLm40vOt9Y5PA==', 'professor');
INSERT INTO `staff` VALUES (7079, 'Гордана Добријевић', 'gdobrijevic@singidunum.ac.rs', 'mjY6jIcZiLqlO1gWyZMWvQ==', 'professor');
INSERT INTO `staff` VALUES (7097, 'Миле Станишић', 'mlstanisic@singidunum.ac.rs', 'r1EU1xnkqk+QstENGekBBw==', 'professor');
INSERT INTO `staff` VALUES (7147, 'Јелена Гајић', 'jgajic@singidunum.ac.rs', 'ISeyaTcCVokfeZoA8H1fTg==', 'professor');
INSERT INTO `staff` VALUES (7226, 'Душан Боровчанин', 'dborovcanin@singidunum.ac.rs', 'Fln3DNlOUWrGDDrxg1Hi5g==', 'professor');
INSERT INTO `staff` VALUES (7290, 'Марија Анђелковић', 'mandjelkovic@singidunum.ac.rs', 'l3iE6oShSwXnFeeymcBo+6YQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (7343, 'Слађана Спасић', 'sspasic@singidunum.ac.rs', '2lzqG5JdSmBjQ1NgBJaXDg==', 'professor');
INSERT INTO `staff` VALUES (7370, 'Јован Попеску', 'jpopesku@singidunum.ac.rs', 'jLU24Rik80wMMzenEo7+dQ==', 'professor');
INSERT INTO `staff` VALUES (7382, 'Милош Антонијевић', 'mantonijevic@singidunum.ac.rs', 'ZV8/XEbyH7FdXcXLzZftlaYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (7432, 'Ана Радуловић', 'aradulovic@singidunum.ac.rs', 'q7rVaHzlv2yHN+czIlPdkg==', 'professor');
INSERT INTO `staff` VALUES (7466, 'Јасна Петровић', 'jpetrovic@singidunum.ac.rs', 'OX1ivaPvl89P2kTndqJT9Q==', 'professor');
INSERT INTO `staff` VALUES (7505, 'Лазар Дражета', 'ldrazeta@singidunum.ac.rs', 'ZzdCkXP+FV8ua1hBYtLxbQ==', 'professor');
INSERT INTO `staff` VALUES (7511, 'Јелена Миловановић', 'jmilovanovic@singidunum.ac.rs', 'qv9HJRowYTJPSqrRnJDbUKYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (7512, 'Нина Пантелић', 'npantelic@singidunum.ac.rs', 'hMlsXeOVUK/FsHK5iM3hnw==', 'professor');
INSERT INTO `staff` VALUES (7523, 'Предраг Немец', 'pnemec@singidunum.ac.rs', 'bF+XsaWI/JMjYom8KTdqsg==', 'professor');
INSERT INTO `staff` VALUES (7526, 'Гордана Никић', 'gnikic@singidunum.ac.rs', '2Eh20H6FCnLEPtxGqluQSA==', 'professor');
INSERT INTO `staff` VALUES (7728, 'Зоран Јеремић', 'zjeremic@singidunum.ac.rs', 'Vpn6hcd25n5v9iJMLXI5NA==', 'professor');
INSERT INTO `staff` VALUES (7795, 'Александар Гаџић', 'agadzic@singidunum.ac.rs', 'lcEYnFHuJmDp9wFtx1XUdA==', 'professor');
INSERT INTO `staff` VALUES (7962, 'Марко Милојевић', 'mmilojevic@singidunum.ac.rs', 'rKwhD/jKhOkpqJFceMLpvw==', 'professor');
INSERT INTO `staff` VALUES (8018, 'Ева Туба', 'etuba@singidunum.ac.rs', 'BS65uEoTcCJpLNAgIpBO2A==', 'professor');
INSERT INTO `staff` VALUES (8064, 'Саша Адамовић', 'sadamovic@singidunum.ac.rs', 'CT8dbdKbv2mmqQS2oxInrw==', 'professor');
INSERT INTO `staff` VALUES (8117, 'Миљан Вучетић', 'mvucetic@singidunum.ac.rs', 'GK8UbZKdW2ZdB39bxGCxCg==', 'professor');
INSERT INTO `staff` VALUES (8225, 'Јована Бошковић', 'jboskovic@singidunum.ac.rs', 'r+1sm21fTCpRUDHacABtAw==', 'professor');
INSERT INTO `staff` VALUES (8232, 'Светлана Станишић', 'sstanisic@singidunum.ac.rs', 'ZkwwGnGcUR8YwFipzDcccw==', 'professor');
INSERT INTO `staff` VALUES (8253, 'Никола Стакић', 'nstakic@singidunum.ac.rs', '++6ihLPUP9h1tA1xQlfhjg==', 'professor');
INSERT INTO `staff` VALUES (8285, 'Милош Петковић', 'mpetkovic@singidunum.ac.rs', 'yfz1O5vKY1JKKvmG9SPfZg==', 'professor');
INSERT INTO `staff` VALUES (8305, 'Млађан Јовановић', 'mjovanovic@singidunum.ac.rs', 'l4asJHpGPEjlQQ63o1Yj0g==', 'professor');
INSERT INTO `staff` VALUES (8366, 'Весна Немец', 'vnemec@singidunum.ac.rs', '+VBNKVZ/0/eUXMXORxq4FA==', 'professor');
INSERT INTO `staff` VALUES (8592, 'Мирољуб Хаџић', 'mhadzic@singidunum.ac.rs', 'jmGcp+pAWURy0iWMoij4GA==', 'professor');
INSERT INTO `staff` VALUES (8594, 'Милош Стојменовић', 'mstojmenovic@singidunum.ac.rs', 'gByekAd1iD8H8Bzt5xjwTKYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (8617, 'Данка Милојковић', 'dmilojkovic@singidunum.ac.rs', 'A8k9MSqdycAJXSnqFDOVuA==', 'professor');
INSERT INTO `staff` VALUES (8655, 'Јелена Николић', 'jnikolic@singidunum.ac.rs', '7I3DLfk1pAOJRS9O9DD3LQ==', 'professor');
INSERT INTO `staff` VALUES (8694, 'Бојана Продановић Ђорђевић', 'bprodanovic@singidunum.ac.rs', 'LJqvihIKMzh4FLph51p6fQ==', 'professor');
INSERT INTO `staff` VALUES (8721, 'Марија Илић', 'milic@singidunum.ac.rs', 'MqqV698orMrFamxJTT64yg==', 'professor');
INSERT INTO `staff` VALUES (8755, 'Мирослав Поповић', 'mpopovic@singidunum.ac.rs', 'frhdbcaCECvHZHMDpKHNOg==', 'professor');
INSERT INTO `staff` VALUES (8766, 'Драгана Богавац', 'dbogavac@singidunum.ac.rs', 'hT11JDR+h+/YRx7vy0qWfg==', 'professor');
INSERT INTO `staff` VALUES (8883, 'Јованка Попов Раљић', 'jpopov@singidunum.ac.rs', 'pvnDVpUou9T+e7n/La20Jg==', 'professor');
INSERT INTO `staff` VALUES (8984, 'Андрија Петровић', 'apetrovic@singidunum.ac.rs', 'IFtualF4rD+Nd5TrVGIakg==', 'professor');
INSERT INTO `staff` VALUES (9018, 'Неда Маенза', 'nmaenza@singidunum.ac.rs', 'rwtJ60MT+rG8VtJzAr6iMQ==', 'professor');
INSERT INTO `staff` VALUES (9036, 'Маја Вујчић Тркуља', 'mvujcic@singidunum.ac.rs', 'DfSq9SEKvKDXlxD+oy0ACg==', 'professor');
INSERT INTO `staff` VALUES (9178, 'Зоран Јовић', 'zjovic@singidunum.ac.rs', 'gqlleWfNA4956gRv4bXT2A==', 'professor');
INSERT INTO `staff` VALUES (9214, 'Младен Веиновић', 'mveinovic@singidunum.ac.rs', 'ZiPKNxeH/wWKC+U/g1Vzxw==', 'professor');
INSERT INTO `staff` VALUES (9258, 'Славко Алчаковић', 'salcakovic@singidunum.ac.rs', 'iFtCQUTWfAYPzAq4J0Zfaw==', 'professor');
INSERT INTO `staff` VALUES (9321, 'Марко Шарац', 'msarac@singidunum.ac.rs', 'JX8RgMa9xPbMilo6VlSJSQ==', 'professor');
INSERT INTO `staff` VALUES (9457, 'Слободан Черовић', 'scerovic@singidunum.ac.rs', 'HiUrFq/xLobiyic8pGT5sQ==', 'professor');
INSERT INTO `staff` VALUES (9476, 'Катарина Насрадин', 'knasradin@singidunum.ac.rs', 'ne/ZxfTMA2EgUcLrssCefw==', 'professor');
INSERT INTO `staff` VALUES (9493, 'Мирослав Кнежевић', 'mknezevic@singidunum.ac.rs', '6erZV3uqjaimpPSHaHOXlA==', 'professor');
INSERT INTO `staff` VALUES (9517, 'Далибор Радовановић', 'dradovanovic@singidunum.ac.rs', '2Z4GiT0LktGqeMFSskKLcqYQdCzS94RUH436DuLC8FU=', 'professor');
INSERT INTO `staff` VALUES (9606, 'Ненад Трунић', 'ntrunic@singidunum.ac.rs', 'r6sZIXxv5fi6ooUTzytotg==', 'professor');
INSERT INTO `staff` VALUES (9608, 'Данијел Павловић', 'dpavlovic@singidunum.ac.rs', 'QsJYWK00i4Gazd3GlDTQDA==', 'professor');
INSERT INTO `staff` VALUES (9619, 'Горан Куњадић', 'gkunjadic@singidunum.ac.rs', 'XSOzyu4cPOrDVDZ3kXIVDQ==', 'professor');
INSERT INTO `staff` VALUES (9874, 'Петар Спалевић', 'pspalevic@singidunum.ac.rs', 'I4gWfDmP3v+as2Y4j1UTcw==', 'professor');
INSERT INTO `staff` VALUES (9918, 'Марина Марјановић', 'mmarjanovic@singidunum.ac.rs', 'Wj3+eTzr0OOcsc5uNzkMNA==', 'professor');
INSERT INTO `staff` VALUES (9955, 'Биљана Радичић', 'bradicic@singidunum.ac.rs', 'kjFB8nfyEqwbfSCuLziYwA==', 'professor');
INSERT INTO `staff` VALUES (10082, 'Маја Кљајић', 'mkljajic@singidunum.ac.rs', 'FYXmpbMG0wq8SPFZg1jzfQ==', 'assistant');
INSERT INTO `staff` VALUES (10524, 'Иван Радосављевић', 'iradosavljevic@singidunum.ac.rs', 'm8/x08UzQL3ut9dJ27RX8S+qFt1DVfT8mzMCarkVlZM=', 'assistant');
INSERT INTO `staff` VALUES (10581, 'Јелена Гавриловић', 'jgavrilovic@singidunum.ac.rs', 'mcy8iMYeekKhKFIgnXxrBqYQdCzS94RUH436DuLC8FU=', 'assistant');
INSERT INTO `staff` VALUES (10833, 'Младен Видовић', 'mvidovic@singidunum.ac.rs', 'Q4m4UYSjNM0hpVR3rGfNOg==', 'assistant');
INSERT INTO `staff` VALUES (11008, 'Станко Гаврић', 'sgavric@singidunum.ac.rs', 'Squ8WEsOVPv8cY9RQf1M2Q==', 'assistant');
INSERT INTO `staff` VALUES (11200, 'Ивана Васић', 'ivasic@singidunum.ac.rs', 'gj9GcOuI3cOjrsShwbE8Bg==', 'assistant');
INSERT INTO `staff` VALUES (11366, 'Небојша Стојановић', 'nstojanovic@singidunum.ac.rs', 'Y0FqZgkYMOWPeX87JcCubKYQdCzS94RUH436DuLC8FU=', 'assistant');
INSERT INTO `staff` VALUES (11643, 'Ана Обрадовић', 'aobradovic@singidunum.ac.rs', 'S+SEl9yHBHAky/6n3LcaEg==', 'assistant');
INSERT INTO `staff` VALUES (11952, 'Александра Митровић', 'amitrovic@singidunum.ac.rs', 'k2xDRfJuOIc/ImS3KzMEYQ==', 'assistant');
INSERT INTO `staff` VALUES (12328, 'Вук Гајић', 'vgajic@singidunum.ac.rs', '64OuFAzHlzpQMY74toATaw==', 'assistant');
INSERT INTO `staff` VALUES (12411, 'Али Елсадаи', 'aelsadai@singidunum.ac.rs', 'YAePisejRyE9zZRyuXi88Q==', 'assistant');
INSERT INTO `staff` VALUES (12477, 'Филип Алимпић', 'falimpic@singidunum.ac.rs', 'Bi7fP56Vxnu65VRHdsJM2g==', 'assistant');
INSERT INTO `staff` VALUES (13720, 'Урош Арнаут', 'uarnaut@singidunum.ac.rs', 'QPnNRtv7YbNRGQ9qsQe59A==', 'assistant');
INSERT INTO `staff` VALUES (13884, 'Душан Марковић', 'dmarkovic@singidunum.ac.rs', 'yT5eTF9HPA7QyZQa1bdJJg==', 'assistant');
INSERT INTO `staff` VALUES (13957, 'Урош Драговић', 'udragovic@singidunum.ac.rs', 'Bo5geARUqAaouWtl76uMeA==', 'assistant');
INSERT INTO `staff` VALUES (15401, 'Милош Мравик', 'mmravik@singidunum.ac.rs', '9NO+TBMBWQVMdb9yiZlWjA==', 'assistant');
INSERT INTO `staff` VALUES (15608, 'Андреј Тодоровић', 'atodorovic@singidunum.ac.rs', 'YLT/OVZPP1CsRt3LHTGqXQ==', 'assistant');
INSERT INTO `staff` VALUES (15866, 'Аманда Иванковић', 'aivankovic@singidunum.ac.rs', 'f51SwB3UpBmwaGY9GlzwTA==', 'assistant');
INSERT INTO `staff` VALUES (16046, 'Петар Јакић', 'pjakic@singidunum.ac.rs', '/x45ijR9FuL7BMa5tuiIIQ==', 'assistant');
INSERT INTO `staff` VALUES (16165, 'Никола Васић', 'nvasic@singidunum.ac.rs', '0+RH9VXUHOEJupLbpSCTMw==', 'assistant');
INSERT INTO `staff` VALUES (16224, 'Небојша Нешић', 'nnesic@singidunum.ac.rs', 'N2HcxGy22+SGsWXQxVhibw==', 'assistant');
INSERT INTO `staff` VALUES (16572, 'Алекса Панић', 'apanic@singidunum.ac.rs', 'pnPd9U8OcR4vPtHyciuHHw==', 'assistant');
INSERT INTO `staff` VALUES (16637, 'Михаило Тодоровић', 'mtodorovic@singidunum.ac.rs', 'Da+kOkooRvI19OoqCXY8ag==', 'assistant');
INSERT INTO `staff` VALUES (17023, 'Владимир Митић', 'vmitic@singidunum.ac.rs', 'iPBni45c1g0jqLZXCp/UOA==', 'assistant');
INSERT INTO `staff` VALUES (17349, 'Душан Мандић', 'dmandic@singidunum.ac.rs', 'rUGRq/DXvnv9D7YTTYpyXg==', 'assistant');
INSERT INTO `staff` VALUES (17581, 'Тимеа Бездан', 'tbezdan@singidunum.ac.rs', 'FiTgJMfQ/B8b8eeRNQK9jw==', 'assistant');
INSERT INTO `staff` VALUES (18540, 'Алекса Ћук', 'acuk@singidunum.ac.rs', '3+kLDttkLh1TdTJBKJY1sg==', 'assistant');
INSERT INTO `staff` VALUES (18728, 'Милан Таир', 'mtair@singidunum.ac.rs', 'hqbZc3bhQBsC38EdfDnOuA==', 'assistant');
INSERT INTO `staff` VALUES (18733, 'Кристина Каличанин', 'kkalicanin@singidunum.ac.rs', 'qCqzX8vGjz8CiSFCtfncDg==', 'assistant');
INSERT INTO `staff` VALUES (19505, 'Маја Обрадовиц', 'mobradovic@singidunum.ac.rs', 'RnZc1zeZiIbOIe31hWasbg==', 'assistant');
INSERT INTO `staff` VALUES (19545, 'Даниела Цветковић', 'dcvetkovic@singidunum.ac.rs', 'w9R4xZkcsznpEiah65H6og==', 'assistant');
INSERT INTO `staff` VALUES (19698, 'Никола Савановић', 'nsavanovic@singidunum.ac.rs', 'D/2vsL3JQPKNtoO7o3pnmA==', 'assistant');
INSERT INTO `staff` VALUES (26318, 'Петар Бишевац', 'pbisevac@singidunum.ac.rs', 'sg+PDZlUbVx5VSoglUyFZw==', 'assistant');
COMMIT;

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student` (
  `student_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name_surname` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `index` varchar(11) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8_unicode_ci NOT NULL,
  `study_id` int(10) unsigned NOT NULL,
  `year` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`student_id`) USING BTREE,
  UNIQUE KEY `uq_indexNo_studentEmail_study_id_enrolled` (`index`,`email`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=403 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of student
-- ----------------------------
BEGIN;
INSERT INTO `student` VALUES (201, 'Анђела Жилић', '2016/283054', '9KFYr+pr35znHhKy/Y69tg==', 'andjela.zilic.16', 12, '4');
INSERT INTO `student` VALUES (202, 'Момчило Срдић', '2006/246337', 'gypL834jIJ+F08oUg4OnEg==', 'momcilo.srdic.06', 1, '3');
INSERT INTO `student` VALUES (203, 'Жарко Врховац', '2008/225118', 'cAVChxSzgPWt1zBiV+H27A==', 'zarko.vrhovac.08', 8, '3');
INSERT INTO `student` VALUES (204, 'Средоје Ширкић', '2009/287521', 'ApFlYPxxhfy4eo7ktJYS+A==', 'sredoje.sirkic.00@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (205, 'Бранимир Алановић', '2012/257365', 'n2VetHE/y9wAfjd1pTuK8g==', 'branimir.alanovic.01@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (206, 'Вишеслав Максимовић', '2000/295280', 'hj4MI9ajaFyhvK04KXKXiRSSY8Vh9r9Q48LAJjBRPJM=', 'viseslav.maksimovic.00@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (207, 'Бошко Ћирић', '2017/228271', 'duXMEgm1SkiTH4iKEtsGcg==', 'bosko.ciric.01@singimail.rs', 7, '3');
INSERT INTO `student` VALUES (208, 'Влатка Јерков', '2019/254085', 'kUxr7r3dkUNFddY3bWv1vA==', 'vlatka.jerkov.01@singimail.rs', 7, '1');
INSERT INTO `student` VALUES (209, 'Миљан Радовановић', '2009/251684', 'nO2+t/DINd8LDeZGB+ax17H2NLZXwB4y0P3umjVfjNk=', 'miljan.radovanovic.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (210, 'Бојан Пелак', '2010/222761', 'vPn0Bb0jA8X1gi44o1+qtA==', 'bojan.pelak.01@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (211, 'Цвијетин Коничанин', '2000/246334', 'Msym/+1y6TTjK2qI0vLjOqYQdCzS94RUH436DuLC8FU=', 'cvijetin.konicanin.00@singimail.rs', 15, '3');
INSERT INTO `student` VALUES (212, 'Сретомир Доклестић', '2000/256887', 'yXL6xHrHB/nG7n8UItZKUqYQdCzS94RUH436DuLC8FU=', 'sretomir.doklestic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (213, 'Веселинка Радиновић', '2019/224260', 'z9Dwlc4BaSejuQKGxZxPvKYQdCzS94RUH436DuLC8FU=', 'veselinka.radinovic.01@singimail.rs', 15, '1');
INSERT INTO `student` VALUES (214, 'Вукашин Андјелковић', '2011/254131', 'Yj9UCePIm8fyVQ5gqqw/uLH2NLZXwB4y0P3umjVfjNk=', 'vukasin.andjelkovic.01@singimail.rs', 8, '4');
INSERT INTO `student` VALUES (215, 'Вујица Којашевић', '2002/271863', 'ETpnWvVHrlgXVvBzNqWOI6YQdCzS94RUH436DuLC8FU=', 'vujica.kojasevic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (216, 'Страцимир Милутиновић', '2009/283985', 'InjVNUL8GaY9y8Fwqg6EWWD8nGOja+su6xujqeaCLUE=', 'stracimir.milutinovic.00@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (217, 'Дејан Бандовић', '2018/276355', 'zpa+GiyB9vx0da47k+mQkQ==', 'dejan.bandovic.01@singimail.rs', 2, '2');
INSERT INTO `student` VALUES (218, 'Славка Јозић', '2002/276137', 'ERj1uA5maUR0C4erHYLsYg==', 'slavka.jozic.00@singimail.rs', 14, '4');
INSERT INTO `student` VALUES (219, 'Југослав Топић', '2019/281815', 'HEaHtk52FrsnF310JjoMfA==', 'jugoslav.topic.01@singimail.rs', 9, '1');
INSERT INTO `student` VALUES (220, 'Мирјана Станић', '2012/280831', 'wmzNZvfuJCtZsKkL9/Qskw==', 'mirjana.stanic.01@singimail.rs', 15, '3');
INSERT INTO `student` VALUES (221, 'Душка Дедић', '2011/277496', '4OHlqdkAo5lyYb9tHiR+Rw==', 'duska.dedic.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (222, 'Стојанка Вукелић', '2006/299347', 'bT6B6WxMM7cdStKjLiH9YA==', 'stojanka.vukelic.00@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (223, 'Зорана Гајић', '2004/286824', '01FzSSxREJnGDvpmiCu69w==', 'zorana.gajic.00@singimail.rs', 1, '4');
INSERT INTO `student` VALUES (224, 'Гордана Талија', '2012/227211', 'bMVm/zbxDw9OwCU712/Sbg==', 'gordana.talija.01@singimail.rs', 14, '3');
INSERT INTO `student` VALUES (225, 'Иван Гогић', '2007/200103', 'kBNFp7dqPp8iKIUzkL2Ilg==', 'ivan.gogic.00@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (226, 'Љубинка Делић', '2019/281037', 'vKH1n+iUTiZGSsctT/OX2w==', 'ljubinka.delic.01@singimail.rs', 8, '1');
INSERT INTO `student` VALUES (227, 'Чедомир Дојкић', '2016/247277', 'py9GmBWgfcssicmKOCNllw==', 'cedomir.dojkic.01@singimail.rs', 8, '4');
INSERT INTO `student` VALUES (228, 'Коста Иванчир', '2007/282179', 'ZFxFYFLG8krq0ASdJawlqw==', 'kosta.ivancir.00@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (229, 'Стојан Булатовић', '2009/290805', 'IrVjNF7W4WtbtIASHu9Y8qYQdCzS94RUH436DuLC8FU=', 'stojan.bulatovic.00@singimail.rs', 12, '3');
INSERT INTO `student` VALUES (230, 'Дражен Вујић', '2018/212167', 'IA7CEt/F1PVEhlHTaRfk5g==', 'drazen.vujic.01@singimail.rs', 6, '2');
INSERT INTO `student` VALUES (231, 'Даница Малин', '2017/220908', '7/7/ZOVGhYasY7MU46FJ8Q==', 'danica.malin.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (232, 'Милена Вуксановић', '2013/229989', 'tiJuHjTeNvjYpO2lc2R/QxSSY8Vh9r9Q48LAJjBRPJM=', 'milena.vuksanovic.01@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (233, 'Радмила Перишић', '2009/226588', 'cOva1rwvxyLKcAe8jkVjzg==', 'radmila.perisic.00@singimail.rs', 3, '4');
INSERT INTO `student` VALUES (234, 'Костадин Пашић', '2000/235229', '90OmsvVH8O8J7Do8OztoPg==', 'kostadin.pasic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (235, 'Стојанка Вукмановић', '2014/294663', 'ih2Ys0YOFMoecBolz/ArpRSSY8Vh9r9Q48LAJjBRPJM=', 'stojanka.vukmanovic.01@singimail.rs', 11, '3');
INSERT INTO `student` VALUES (236, 'Вујадин Челар', '2002/240363', 'UTukkIvS00yKhwE9oj/iCQ==', 'vujadin.celar.00@singimail.rs', 12, '3');
INSERT INTO `student` VALUES (237, 'Стојанка Карађорђевић', '2016/262581', 'x2V76+72yw3qHNzfr2kivz0jIesfR+K3FEUme0ZJWVo=', 'stojanka.karadjordjevic.01@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (238, 'Небојша Краљић', '2006/217023', 'vLFcNDYCq/gvy76Ru7vLVg==', 'nebojsa.kraljic.00@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (239, 'Владислав Јевтић', '2007/234707', 'B8AR40vYr+StgunYpEf0kw==', 'vladislav.jevtic.00@singimail.rs', 4, '3');
INSERT INTO `student` VALUES (240, 'Владан Иванишевић', '2000/244234', 'KsMNAkCVDf8lGeeJygukZhSSY8Vh9r9Q48LAJjBRPJM=', 'vladan.ivanisevic.00@singimail.rs', 8, '4');
INSERT INTO `student` VALUES (241, 'Добрица Родић', '2010/220126', 'Dz0nXBA2YftCHPYufoHIUA==', 'dobrica.rodic.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (242, 'Веселин Спасојевић', '2018/225743', 'TXVIp/9eStpebq6N+OUipBSSY8Vh9r9Q48LAJjBRPJM=', 'veselin.spasojevic.01@singimail.rs', 6, '2');
INSERT INTO `student` VALUES (243, 'Љубица Травар', '2014/281417', 'q2nOTC/w6r/s5LxRlrI23Q==', 'ljubica.travar.01@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (244, 'Радич Татомировић', '2012/285993', 'kQy6j9pJM+2WF/IXsrb70GD8nGOja+su6xujqeaCLUE=', 'radic.tatomirovic.01@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (245, 'Миљан Цукавац', '2010/211058', '8/zhCE6qgRzmklgT6Y864A==', 'miljan.cukavac.01@singimail.rs', 4, '3');
INSERT INTO `student` VALUES (246, 'Ђоко Врховац', '2004/228379', 'ZHXdy1WB27AkwbvueASTnA==', 'djoko.vrhovac.00@singimail.rs', 9, '3');
INSERT INTO `student` VALUES (247, 'Иван Пејић', '2016/246563', 'FZrB/KqzsHd4fOrRdiO+Xg==', 'ivan.pejic.01@singimail.rs', 13, '4');
INSERT INTO `student` VALUES (248, 'Димитрије Јовићевић', '2000/272779', 'NkbqJPfSpjXysdni3oMA7KYQdCzS94RUH436DuLC8FU=', 'dimitrije.jovicevic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (249, 'Ђорђе Марјановић', '2018/294031', 'FE/E9MXP1kvhC9wt8qmi/RSSY8Vh9r9Q48LAJjBRPJM=', 'djordje.marjanovic.01@singimail.rs', 4, '2');
INSERT INTO `student` VALUES (250, 'Марко Репац', '2002/241294', '4zWSuYguyk+3eKlH9T5XWQ==', 'marko.repac.00@singimail.rs', 11, '3');
INSERT INTO `student` VALUES (251, 'Зорана Грбовић', '2011/204171', 'x19LWi/4kDMdL97335s+Ig==', 'zorana.grbovic.01@singimail.rs', 11, '4');
INSERT INTO `student` VALUES (252, 'Иван Братић', '2000/261346', 'FpWz+eqtV/ksrKKDY4cEUg==', 'ivan.bratic.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (253, 'Јездимир Марјановић', '2019/217954', 'U7/u+tpcQ76ELPRKGE2KERSSY8Vh9r9Q48LAJjBRPJM=', 'jezdimir.marjanovic.01@singimail.rs', 7, '1');
INSERT INTO `student` VALUES (254, 'Љубивоје Ивић', '2019/275578', 'R8/vyKCiSBT6nA/UYZHuYw==', 'ljubivoje.ivic.01@singimail.rs', 3, '1');
INSERT INTO `student` VALUES (255, 'Стеван Васић', '2005/282666', 'tTnT1r2X42MXlPXPLWa6fg==', 'stevan.vasic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (256, 'Снежана Бајић', '2001/231386', 'Lm8q72GldfMuTwsIuGJ9jw==', 'snezana.bajic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (257, 'Снежана Вујовић', '2012/219344', 'Po7JyJqDkJNqpT3Q0XVS0A==', 'snezana.vujovic.01@singimail.rs', 6, '3');
INSERT INTO `student` VALUES (258, 'Вуксан Катић', '2015/244431', '/qsK6LRMIPAZufHEnIeVqw==', 'vuksan.katic.01@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (259, 'Миланко Белин', '2014/203123', 'gNGlfrg/mRpooXJt5FKzzA==', 'milanko.belin.01@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (260, 'Јованка Видаковић', '2000/246999', 'lXvIgX41/kLMJTUIpljOZaYQdCzS94RUH436DuLC8FU=', 'jovanka.vidakovic.00@singimail.rs', 2, '3');
INSERT INTO `student` VALUES (261, 'Десимир Шегрт', '2000/259034', 'u7oNBKZog7ji5Q3Kgc+HGg==', 'desimir.segrt.00@singimail.rs', 13, '4');
INSERT INTO `student` VALUES (262, 'Живко Цебо', '2010/244044', 'pHgGmffOKLRmAaZWgyUv7g==', 'zivko.cebo.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (263, 'Радич Зарић', '2006/297415', 'nmk+bb9UnJudlMbMTK2XYg==', 'radic.zaric.00@singimail.rs', 13, '4');
INSERT INTO `student` VALUES (264, 'Благоје Лукачевић', '2015/208488', 'A8ORv1nwxIE0n4Xw9inMbqYQdCzS94RUH436DuLC8FU=', 'blagoje.lukacevic.01@singimail.rs', 6, '3');
INSERT INTO `student` VALUES (265, 'Сандра Тесла', '2001/234230', 'BfPRavcnmzbFiF3fe49feQ==', 'sandra.tesla.00@singimail.rs', 11, '3');
INSERT INTO `student` VALUES (266, 'Аца Пепић', '2007/296177', '1vDKaLwG3IZqrhDWUjEl2w==', 'aca.pepic.00@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (267, 'Борка Андрејевић', '2006/209902', '8pr/wXiVd94sx6V+5SJo9RSSY8Vh9r9Q48LAJjBRPJM=', 'borka.andrejevic.00@singimail.rs', 11, '4');
INSERT INTO `student` VALUES (268, 'Живојин Вучковић', '2015/209040', 'NaJOUOYFF1DlBCZ1gPxX6Q==', 'zivojin.vuckovic.01@singimail.rs', 14, '4');
INSERT INTO `student` VALUES (269, 'Сања Јозић', '2019/217390', 'bT/P2/Tk7Qd+1cPKVru70A==', 'sanja.jozic.01@singimail.rs', 8, '1');
INSERT INTO `student` VALUES (270, 'Јанко Белошевић', '2001/294257', 'i4aRtmMrcESmv7Soh5QxCKYQdCzS94RUH436DuLC8FU=', 'janko.belosevic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (271, 'Милорад Рајлић', '2009/246176', 'TIpFhVxLwWHRm/HRB8wWLw==', 'milorad.rajlic.00@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (272, 'Филип Ловрић', '2009/287255', 'XLIGr/2lZTSpE+dR+53KUg==', 'filip.lovric.00@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (273, 'Владо Бошњак', '2001/256733', '61sT3K1Pw/K9gPt5bfvqyQ==', 'vlado.bosnjak.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (274, 'Миран Томаш', '2008/293500', '6T0R4lYIf8AFk4OLSCqOAw==', 'miran.tomas.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (275, 'Благоје Милутиновић', '2005/298452', 'VUl2mOUsXNyVMp0IDofRTLdPuB74awetBOlRkpViNag=', 'blagoje.milutinovic.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (276, 'Душица Видић', '2008/265847', 'WR7qQI3WZ3qXYalIxi/N1w==', 'dusica.vidic.00@singimail.rs', 1, '4');
INSERT INTO `student` VALUES (277, 'Ђорђе Тодоровић', '2016/259698', 'yQzUgPq2bcm1Box+ikLeHqYQdCzS94RUH436DuLC8FU=', 'djordje.todorovic.01@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (278, 'Влатка Шупут', '2015/205853', 'hJlppgu11yIl5rPFf9JSwQ==', 'vlatka.suput.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (279, 'Данко Јуришић', '2006/268199', 'uL1kP/vAJhXSZWqXKkdn9g==', 'danko.jurisic.00@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (280, 'Светозар Цебо', '2014/211074', 'jrmBHN8ymRmhYKkUrT03eg==', 'svetozar.cebo.01@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (281, 'Здеслав Пејчић', '2018/226834', 'FodXQbYYJjWxuolykz+Wqg==', 'zdeslav.pejcic.01@singimail.rs', 12, '2');
INSERT INTO `student` VALUES (282, 'Влатко Зечевић', '2011/236031', 'YUxzz59x4ZzuH1zshrBKjQ==', 'vlatko.zecevic.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (283, 'Цвијетин Родић', '2003/281214', 'i7HQRKnBzE3haiMrVnjd3Q==', 'cvijetin.rodic.00@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (284, 'Анка Панић', '2017/235866', 'PxnkFkMo+TDnmMTBNuIjEg==', 'anka.panic.01@singimail.rs', 8, '3');
INSERT INTO `student` VALUES (285, 'Милутин Иванчев', '2014/202010', 'A+NhkHXu50707Qpa8P20Lg==', 'milutin.ivancev.01@singimail.rs', 4, '3');
INSERT INTO `student` VALUES (286, 'Данијел Кадијевић', '2009/230839', 'qy5s7IAmdkyjSDBImyhUuaYQdCzS94RUH436DuLC8FU=', 'danijel.kadijevic.00@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (287, 'Светозар Вујачић', '2009/228929', '0W7ye7wvhMl5EOvH1kPSAg==', 'svetozar.vujacic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (288, 'Владимир Пепић', '2019/283029', 'iNyT8hoNAvS6ZdA4Jfn91w==', 'vladimir.pepic.01@singimail.rs', 10, '1');
INSERT INTO `student` VALUES (289, 'Милена Лутовац', '2012/256084', 'fPW54lokZeghs/0E2yQYlA==', 'milena.lutovac.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (290, 'Дамјан Панић', '2000/258043', 'G/AV4j3cs3ulYJk3nKZT7Q==', 'damjan.panic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (291, 'Снежана Дебељачки', '2014/240144', 'IlVEg7N8KdTv5mhjzUucYRSSY8Vh9r9Q48LAJjBRPJM=', 'snezana.debeljacki.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (292, 'Предимир Бандовић', '2017/206162', 'FGOm18We9FlZxGaN+avZbQ==', 'predimir.bandovic.01@singimail.rs', 6, '3');
INSERT INTO `student` VALUES (293, 'Јанко Никитовић', '2012/206413', 'ZatF+6qzG61KA2wG4nvYe6YQdCzS94RUH436DuLC8FU=', 'janko.nikitovic.01@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (294, 'Синиша Ратковић', '2003/257141', '+wJgi6XwSnqZt4mTkqTKOw==', 'sinisa.ratkovic.00@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (295, 'Душан Дражић', '2017/291508', 'ThVyc5YS9ADU3O/c/6Dydw==', 'dusan.drazic.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (296, 'Сања Стојковић', '2005/238069', '7jGk7FyGVLMhdUa+QsJTFaYQdCzS94RUH436DuLC8FU=', 'sanja.stojkovic.00@singimail.rs', 7, '3');
INSERT INTO `student` VALUES (297, 'Радојка Васић', '2011/244386', 'eNnYMNOpHTLE2ENdi32ifg==', 'radojka.vasic.01@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (298, 'Милана Вујисић', '2005/290454', 'wNHWqM8kKNmGOjDt/gCpNg==', 'milana.vujisic.00@singimail.rs', 10, '3');
INSERT INTO `student` VALUES (299, 'Золтанислав Павковић', '2017/255849', 'dYIf1UxUr8XIA1wdsTBtMQ==', 'zoltanislav.pavkovic.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (300, 'Младен Љубичић', '2018/233469', 'lOUDd8/hZFLRPfYzVvbkGQ==', 'mladen.ljubicic.01@singimail.rs', 8, '2');
INSERT INTO `student` VALUES (301, 'Милован Дангић', '2005/214376', 'OC3he2FM4j75vEURiYW4FQ==', 'milovan.dangic.00@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (302, 'Милана Тоља', '2018/240423', 'RnsFSyC1f7OzpsjWOvuY0A==', 'milana.tolja.01@singimail.rs', 13, '2');
INSERT INTO `student` VALUES (303, 'Периша Којановић', '2001/246093', 'FChjwSIjDqGlrpObJ0Gl3aYQdCzS94RUH436DuLC8FU=', 'perisa.kojanovic.00@singimail.rs', 12, '3');
INSERT INTO `student` VALUES (304, 'Добрица Цветковић', '2012/232015', 'F4hkhYjODgdGD9vkcSSqSKYQdCzS94RUH436DuLC8FU=', 'dobrica.cvetkovic.01@singimail.rs', 1, '4');
INSERT INTO `student` VALUES (305, 'Радојка Недић', '2007/245456', '7xuawnN7joZtzNJmieEEPQ==', 'radojka.nedic.00@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (306, 'Никша Репац', '2011/279034', 'uZ2e/8SLI1fXeDW5LrczJQ==', 'niksa.repac.01@singimail.rs', 11, '3');
INSERT INTO `student` VALUES (307, 'Младен Вукадиновић', '2001/264580', 'w2LWrwifviYcxE1jWUWqKai/4cIgdvVgUG+0akOaze0=', 'mladen.vukadinovic.00@singimail.rs', 3, '4');
INSERT INTO `student` VALUES (308, 'Михаило Ивањи', '2017/210375', '8LbyclbR6ebf/CBqKvS+cQ==', 'mihailo.ivanji.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (309, 'Родољуб Зрнић', '2016/281473', 'S2y5EEBJh9uatrDloW02gg==', 'rodoljub.zrnic.01@singimail.rs', 11, '4');
INSERT INTO `student` VALUES (310, 'Душанка Златар', '2002/292919', 'IY2BXmLFeASTOymu+VLARA==', 'dusanka.zlatar.00@singimail.rs', 3, '4');
INSERT INTO `student` VALUES (311, 'Слађана Бошковић', '2001/268125', 'TgobR/BskJC79TMpEjnQPg==', 'sladjana.boskovic.00@singimail.rs', 2, '3');
INSERT INTO `student` VALUES (312, 'Миран Пејчић', '2007/299290', '4FCI4cauEdJgPag2gP5sVQ==', 'miran.pejcic.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (313, 'Вуксан Зеленовић', '2000/263543', 'brotd8fUFo/9j0j06EwhBKYQdCzS94RUH436DuLC8FU=', 'vuksan.zelenovic.00@singimail.rs', 15, '3');
INSERT INTO `student` VALUES (314, 'Растко Штимац', '2014/204359', 'CY0CYF0m2ubcSSNNHDVgiA==', 'rastko.stimac.01@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (315, 'Константин Ожеговић', '2012/238681', 'wbNp0j1MjT3dtE+kk1Ni/Q==', 'konstantin.ozegovic.01@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (316, 'Аца Пејовић', '2004/232320', 'MnYxrCxHXbB2goRKYLf0Qw==', 'aca.pejovic.00@singimail.rs', 13, '4');
INSERT INTO `student` VALUES (317, 'Благица Јованов', '2014/289272', 'nQgh07/SayVUk3vjLQ/ONg==', 'blagica.jovanov.01@singimail.rs', 11, '3');
INSERT INTO `student` VALUES (318, 'Илија Делибашић', '2012/265191', 'Fl0TjTtMSypL9kkdpi2CTqYQdCzS94RUH436DuLC8FU=', 'ilija.delibasic.01@singimail.rs', 6, '3');
INSERT INTO `student` VALUES (319, 'Фазан Раденовић', '2000/276356', 'qbxgeK5tKI5qVn8oHwp+eaYQdCzS94RUH436DuLC8FU=', 'fazan.radenovic.00@singimail.rs', 10, '3');
INSERT INTO `student` VALUES (320, 'Јасмина Павковић', '2005/260804', 'aD9ecUofO0CsZs4/NG/BnA==', 'jasmina.pavkovic.00@singimail.rs', 8, '4');
INSERT INTO `student` VALUES (321, 'Кристијан Шарановић', '2007/226887', '/YyWuowCT8jYD7mwsM0XNqYQdCzS94RUH436DuLC8FU=', 'kristijan.saranovic.00@singimail.rs', 2, '3');
INSERT INTO `student` VALUES (322, 'Митар Лишић', '2007/264538', 'uU0M8Xh5QOY8kmicNMBbjA==', 'mitar.lisic.00@singimail.rs', 12, '3');
INSERT INTO `student` VALUES (323, 'Миодраг Тесла', '2004/221840', '8BD1WI5w40rKUBii/upkMA==', 'miodrag.tesla.00@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (324, 'Миленко Вукелић', '2015/226884', 'YQv3CpwBIeDsmkMLhhIf8Q==', 'milenko.vukelic.01@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (325, 'Живан Бумба', '2019/220753', 'OqK1NN5O5rSOuf/rET4enA==', 'zivan.bumba.01@singimail.rs', 5, '1');
INSERT INTO `student` VALUES (326, 'Страхиња Марјановић', '2012/233358', '/OROm+QE+EcsivkGNQ8SxhSSY8Vh9r9Q48LAJjBRPJM=', 'strahinja.marjanovic.01@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (327, 'Микица Чекић', '2000/223061', 'vUaNq2g2MDlrVlHLo1oleA==', 'mikica.cekic.00@singimail.rs', 12, '3');
INSERT INTO `student` VALUES (328, 'Сергеј Божовић', '2006/220352', 'BY2Oa9qL47Tsx/YmK8KVvg==', 'sergej.bozovic.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (329, 'Бранимир Лековић', '2004/250848', '78WYtETZDyGOM4lJHhVP8g==', 'branimir.lekovic.00@singimail.rs', 6, '3');
INSERT INTO `student` VALUES (330, 'Радмила Вукан', '2000/275904', 'ucHNl28dWDzonZt7NHpetQ==', 'radmila.vukan.00@singimail.rs', 8, '3');
INSERT INTO `student` VALUES (331, 'Славко Јозић', '2006/259965', 'CS70iiQOB7P97KtiNskivQ==', 'slavko.jozic.00@singimail.rs', 9, '3');
INSERT INTO `student` VALUES (332, 'Љубинка Јелић', '2001/236912', 'GvIUkR4TTtAfzqg9Y925Jw==', 'ljubinka.jelic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (333, 'Жељко Јауковић', '2004/261171', 'wAxm4lzYbMFaKxR9afVILA==', 'zeljko.jaukovic.00@singimail.rs', 2, '3');
INSERT INTO `student` VALUES (334, 'Наталија Видић', '2017/212192', 'PEPOsNzNHRQCmJ7tgEHRLw==', 'natalija.vidic.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (335, 'Звонко Милановић', '2010/247212', 'etKg5S3n+js4PPGTTCnhraYQdCzS94RUH436DuLC8FU=', 'zvonko.milanovic.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (336, 'Периша Катић', '2001/216674', 'wKIrO+dkOYa3aOXXkbRTZQ==', 'perisa.katic.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (337, 'Славица Стамболић', '2012/278253', 'EKYPMnGEKecaeO4Rwc+3eqYQdCzS94RUH436DuLC8FU=', 'slavica.stambolic.01@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (338, 'Цвијетин Јањић', '2012/231628', 'jYKuh8sY/yUvAS9hB87lmw==', 'cvijetin.janjic.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (339, 'Урош Пузигаћа', '2005/261197', 'GJ5sg+rp6xDxjeJCeZw7IA==', 'uros.puzigaca.00@singimail.rs', 14, '4');
INSERT INTO `student` VALUES (340, 'Душанка Иваз', '2001/268004', '595wrhUca0EXaI/yQyJN3Q==', 'dusanka.ivaz.00@singimail.rs', 14, '3');
INSERT INTO `student` VALUES (341, 'Влатка Ојданић', '2010/250098', 'DwVF+o4TYm6wU/Hsa9nw+A==', 'vlatka.ojdanic.01@singimail.rs', 5, '4');
INSERT INTO `student` VALUES (342, 'Средоје Тесла', '2015/251462', 'gtNrgCgWglCmr/AVirALfw==', 'sredoje.tesla.01@singimail.rs', 9, '3');
INSERT INTO `student` VALUES (343, 'Миомир Кордић', '2019/241820', 'roBDY/Gg754tFKvHWk/JAg==', 'miomir.kordic.01@singimail.rs', 1, '1');
INSERT INTO `student` VALUES (344, 'Огњен Месарош', '2011/227769', '3p6HBWTnzOR9OdyJ+Y1fEw==', 'ognjen.mesaros.01@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (345, 'Срђан Дукић', '2011/216570', '0bAKd+1RYO8to9ZZyXzEKQ==', 'srdjan.dukic.01@singimail.rs', 3, '4');
INSERT INTO `student` VALUES (346, 'Бојан Лашић', '2016/254934', 'LiE9A6XGlvEyQOikZkw7Uw==', 'bojan.lasic.01@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (347, 'Драшко Вукићевић', '2003/218176', 'OpwozNxvWcMP9IAg9PMffaYQdCzS94RUH436DuLC8FU=', 'drasko.vukicevic.00@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (348, 'Миран Грбовић', '2017/237646', '+LGmzpX/8CUV5FcjaA/9tA==', 'miran.grbovic.01@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (349, 'Милка Кокотовић', '2014/295147', '92sIIl5GEUqBGU/SAhQpGKYQdCzS94RUH436DuLC8FU=', 'milka.kokotovic.01@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (350, 'Вукашин Калабић', '2000/203194', 'uo73PmKzbxFBMihPhYggsg==', 'vukasin.kalabic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (351, 'Сергеј Абрамовић', '2001/227101', 'YXAYriCqfvP/1Lfy+vdR36YQdCzS94RUH436DuLC8FU=', 'sergej.abramovic.00@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (352, 'Здеслав Панић', '2013/221035', 'pvLou4Bjb2jPd5klPsn8hQ==', 'zdeslav.panic.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (353, 'Костадин Болић', '2006/290593', 'eL0fkL2xnWRnqfjbUaF53g==', 'kostadin.bolic.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (354, 'Станко Бандовић', '2001/234756', 'eeUIYOXvIu5XwRkMWJh78A==', 'stanko.bandovic.00@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (355, 'Урош Рабреновић', '2017/201339', 'wX0Q3JHDAmhkTBsWPBvvJxSSY8Vh9r9Q48LAJjBRPJM=', 'uros.rabrenovic.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (356, 'Борислав Бабовић', '2009/210125', 'uiMx5YUyvQaM8OR4kmkk+w==', 'borislav.babovic.00@singimail.rs', 10, '3');
INSERT INTO `student` VALUES (357, 'Бојана Пејчић', '2013/270178', 'X3kjg5RgIJ96CwFx9gsskw==', 'bojana.pejcic.01@singimail.rs', 10, '4');
INSERT INTO `student` VALUES (358, 'Адријана Рабреновић', '2015/227595', 'xClh13Aa0SxxZLQDiON/CRSSY8Vh9r9Q48LAJjBRPJM=', 'adrijana.rabrenovic.01@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (359, 'Ђурађ Мачкић', '2019/200303', 'afa2LCIG9RRCl7z9BCxvoA==', 'djuradj.mackic.01@singimail.rs', 14, '1');
INSERT INTO `student` VALUES (360, 'Слободан Галић', '2017/211696', 'PynQUNuP+yfhcmbePBa5nQ==', 'slobodan.galic.01@singimail.rs', 4, '3');
INSERT INTO `student` VALUES (361, 'Верица Жилић', '2019/247894', 'cVKJcX9melq/N2yOtfHzlg==', 'verica.zilic.01@singimail.rs', 2, '1');
INSERT INTO `student` VALUES (362, 'Љубомир Сертић', '2007/293188', '0P5GmakZt2EtOlDLt0dxdg==', 'ljubomir.sertic.00@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (363, 'Обрад Стипић', '2008/272236', '3OvhuPfpZGUnoxnM12vVAA==', 'obrad.stipic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (364, 'Станислав Каралић', '2003/260182', 'Fq4Fs7CzPHlhrE7m2+ZYhQ==', 'stanislav.karalic.00@singimail.rs', 15, '3');
INSERT INTO `student` VALUES (365, 'Драгољуб Мићић', '2016/287847', 'lEbV2q1lnBJ0wTbuXym09g==', 'dragoljub.micic.01@singimail.rs', 5, '4');
INSERT INTO `student` VALUES (366, 'Душанка Матушчак', '2010/211786', 'YRv9nV0rljS8/nzKqCc7UQ==', 'dusanka.matuscak.01@singimail.rs', 14, '4');
INSERT INTO `student` VALUES (367, 'Владан Рачић', '2007/229100', '52ofiOfZ3cdMQBVi+ib/dA==', 'vladan.racic.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (368, 'Адријана Видаковић', '2013/235195', '1InPz1u+jnH8SHMswKIq3KYQdCzS94RUH436DuLC8FU=', 'adrijana.vidakovic.01@singimail.rs', 8, '3');
INSERT INTO `student` VALUES (369, 'Бранко Ћирић', '2007/232120', 'RozHONsFQhynothLfXU+wg==', 'branko.ciric.00@singimail.rs', 7, '4');
INSERT INTO `student` VALUES (370, 'Јездимир Принцип', '2000/239928', 'xqH3XDYVe1m1d5vSO/7BhQ==', 'jezdimir.princip.00@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (371, 'Варадинка Молнар', '2011/254975', 'zCw2BfELL5yDQSPoPVd7hQ==', 'varadinka.molnar.01@singimail.rs', 5, '4');
INSERT INTO `student` VALUES (372, 'Вук Којановић', '2009/246349', 'wDaRgOYCy4wRYoL6/jgpgaYQdCzS94RUH436DuLC8FU=', 'vuk.kojanovic.00@singimail.rs', 2, '4');
INSERT INTO `student` VALUES (373, 'Марица Јауковић', '2000/242387', 'ofGpTg3/YXL1N7Kklrkykg==', 'marica.jaukovic.00@singimail.rs', 7, '3');
INSERT INTO `student` VALUES (374, 'Берислав Брајковић', '2006/282595', 'TQ2JWFyGZR+zaaN0Mh5BmaYQdCzS94RUH436DuLC8FU=', 'berislav.brajkovic.00@singimail.rs', 2, '3');
INSERT INTO `student` VALUES (375, 'Веселинка Зрнић', '2014/267440', 'ru6qA8+AcdvmXdM/74LL3A==', 'veselinka.zrnic.01@singimail.rs', 9, '4');
INSERT INTO `student` VALUES (376, 'Средоје Милинковић', '2010/286752', 'YodX838j3cxOVa7k4i6B8hSSY8Vh9r9Q48LAJjBRPJM=', 'sredoje.milinkovic.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (377, 'Радич Лутовац', '2018/272345', 'VGTgYk53S1AAT4tHaNUPOw==', 'radic.lutovac.01@singimail.rs', 15, '2');
INSERT INTO `student` VALUES (378, 'Богољуб Живуловић', '2011/235836', '/IQ3KHzynpgzBmJQ7hnT4qYQdCzS94RUH436DuLC8FU=', 'bogoljub.zivulovic.01@singimail.rs', 6, '1');
INSERT INTO `student` VALUES (379, 'Кокан Пелак', '2019/215099', '+TN8IIl8g9QvRQKeFFNfXQ==', 'kokan.pelak.01@singimail.rs', 2, '1');
INSERT INTO `student` VALUES (380, 'Ненад Арсенијевић', '2018/203506', 'cJXLt7pHcjo3lNYXcck/i4OvCzLLJ4eBnakNONKdriQ=', 'nenad.arsenijevic.01@singimail.rs', 15, '2');
INSERT INTO `student` VALUES (381, 'Борјан Пековић', '2002/266895', '/ALerD1beEQDYyJOJO37IQ==', 'borjan.pekovic.00@singimail.rs', 15, '3');
INSERT INTO `student` VALUES (382, 'Драгутин Томовић', '2009/201275', 'Odl+5tep0Z1z7HV6NhsMrA==', 'dragutin.tomovic.00@singimail.rs', 11, '4');
INSERT INTO `student` VALUES (383, 'Бранислав Машић', '2004/285978', 'UBVY+k/z+9CRI20QrPuAng==', 'branislav.masic.00@singimail.rs', 15, '4');
INSERT INTO `student` VALUES (384, 'Јелена Јерковић', '2007/224419', 'XRrx9/JR/oWNYF6q4+Ikug==', 'jelena.jerkovic.00@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (385, 'Борка Јелавић', '2011/228701', 'y8oDh84mTXajTQkxWT1NdA==', 'borka.jelavic.01@singimail.rs', 10, '3');
INSERT INTO `student` VALUES (386, 'Драгиња Зечевић', '2008/284773', 'L0zpJ6sgkjhDJFTZwgrd7w==', 'draginja.zecevic.00@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (387, 'Данка Бошковић', '2013/208937', 'wgU0Aozf+8Plv9K9zoD3aw==', 'danka.boskovic.01@singimail.rs', 6, '4');
INSERT INTO `student` VALUES (388, 'Ружица Дојкић', '2016/288304', 'sDM7mdX3x/nXWMNih3kmyA==', 'ruzica.dojkic.01@singimail.rs', 4, '4');
INSERT INTO `student` VALUES (389, 'Томислав Новаковић', '2008/260592', 'jiGUJl2V3LbgIpeiWVbURKYQdCzS94RUH436DuLC8FU=', 'tomislav.novakovic.00@singimail.rs', 3, '3');
INSERT INTO `student` VALUES (390, 'Драгица Ашанин', '2015/218238', 'WvLSnzYTm1BHihiXCNk7CQ==', 'dragica.asanin.01@singimail.rs', 13, '3');
INSERT INTO `student` VALUES (391, 'Миливоје Гојковић', '2018/287994', 'NKrYiW1pMLb8HWUKK78l8Q==', 'milivoje.gojkovic.01@singimail.rs', 1, '2');
INSERT INTO `student` VALUES (392, 'Будимир Андрејевић', '2019/259194', '7g7gKyCUMhRrS+PwOxygkBSSY8Vh9r9Q48LAJjBRPJM=', 'budimir.andrejevic.01@singimail.rs', 12, '1');
INSERT INTO `student` VALUES (393, 'Драгиња Арслановић', '2012/216897', 'XZL1++hdjgLGWO5Qux8APxSSY8Vh9r9Q48LAJjBRPJM=', 'draginja.arslanovic.01@singimail.rs', 13, '4');
INSERT INTO `student` VALUES (394, 'Будимир Видацовицх', '2004/269362', 'Ttk0CP8mn6LScDgFfv8UwRSSY8Vh9r9Q48LAJjBRPJM=', 'budimir.vidacovich.00@singimail.rs', 9, '3');
INSERT INTO `student` VALUES (395, 'Радојка Анђелковић', '2018/219118', 'V/X8USOASpBppqhVlpATkh272l+TcBY1RS78du5S1ik=', 'radojka.andjelkovic.01@singimail.rs', 13, '2');
INSERT INTO `student` VALUES (396, 'Снежана Ђуровић', '2006/234449', 'HnTZAG9IJ9Lu4s9s9kpCPg==', 'snezana.djurovic.00@singimail.rs', 12, '4');
INSERT INTO `student` VALUES (397, 'Иван Кораћ', '2012/256825', 'ZEx2ZkSSm3LSwagKfqf+lg==', 'ivan.korac.01@singimail.rs', 5, '3');
INSERT INTO `student` VALUES (398, 'Миљан Перовић', '2019/253015', 'fmNcCAVVuSYD9dPns3jF7w==', 'miljan.perovic.01@singimail.rs', 4, '1');
INSERT INTO `student` VALUES (399, 'Бранислав Гудељ', '2010/293106', 'AgrZ3beRq3DPnHvSZlLXrA==', 'branislav.gudelj.01@singimail.rs', 1, '3');
INSERT INTO `student` VALUES (400, 'Ђурађ Кокотовић', '2011/286639', 'xKLXj4m4PkaDAbZD5+b0LqYQdCzS94RUH436DuLC8FU=', 'djuradj.kokotovic.01@singimail.rs', 8, '4');
INSERT INTO `student` VALUES (401, 'Марко Дојкић', '2018/201682', 'WDEONXsnkWk9LeT3jSxe8g==', 'marko.dojkic.18@singimail.rs', 6, '4');
COMMIT;

-- ----------------------------
-- Table structure for study
-- ----------------------------
DROP TABLE IF EXISTS `study`;
CREATE TABLE `study` (
  `study_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `title_english` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `faculty_id` int(10) unsigned NOT NULL,
  `taught_in` enum('engleski','srpski') COLLATE utf8_unicode_ci NOT NULL,
  PRIMARY KEY (`study_id`) USING BTREE,
  UNIQUE KEY `uq_title_titleEnglish_taughtIn` (`title`,`title_english`,`taught_in`) USING BTREE,
  KEY `fk_study_faculty_id_faculty_faculty_id` (`faculty_id`),
  CONSTRAINT `study_ibfk_1` FOREIGN KEY (`faculty_id`) REFERENCES `faculty` (`faculty_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=22 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of study
-- ----------------------------
BEGIN;
INSERT INTO `study` VALUES (1, 'Пословна економија', 'Business Economics', 1, 'srpski');
INSERT INTO `study` VALUES (2, 'Англистика', 'Anglistics', 1, 'srpski');
INSERT INTO `study` VALUES (3, 'Туризам, хотелијерство и економија хране', 'Tourism, Hospitality and Food Economics', 2, 'srpski');
INSERT INTO `study` VALUES (4, 'Рачунарске науке', 'Computer science', 3, 'srpski');
INSERT INTO `study` VALUES (5, 'Информационе технологије', 'Information Technology', 3, 'srpski');
INSERT INTO `study` VALUES (6, 'Софтверско и информационо инжењерство', 'Software and Data Engineering', 4, 'srpski');
INSERT INTO `study` VALUES (7, 'Физичко васпитање и спорт', 'Physical education and sports', 5, 'srpski');
INSERT INTO `study` VALUES (8, 'Менаџмент у спорту', 'Management in sports', 5, 'srpski');
INSERT INTO `study` VALUES (9, 'Животна средина и одрживи развој', 'Environment and Sustainable Development', 6, 'srpski');
INSERT INTO `study` VALUES (10, 'Пословна економија', 'Business Economics', 1, 'engleski');
INSERT INTO `study` VALUES (11, 'Англистика', 'Anglistics', 1, 'engleski');
INSERT INTO `study` VALUES (12, 'Туризам, хотелијерство и економија хране', 'Tourism, Hospitality and Food Economics', 2, 'engleski');
INSERT INTO `study` VALUES (13, 'Информационе технологије', 'Information Technology', 3, 'engleski');
INSERT INTO `study` VALUES (14, 'Софтверско и информационо инжењерство', 'Software and Data Engineering', 4, 'engleski');
INSERT INTO `study` VALUES (15, 'Животна средина и одрживи развој', 'Environment and Sustainable Development', 6, 'engleski');
INSERT INTO `study` VALUES (16, 'Фармација', 'Pharmacy', 6, 'srpski');
COMMIT;

-- ----------------------------
-- Table structure for subject
-- ----------------------------
DROP TABLE IF EXISTS `subject`;
CREATE TABLE `subject` (
  `subject_id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `title` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `title_english` varchar(128) COLLATE utf8_unicode_ci NOT NULL,
  `professor_id` int(10) unsigned NOT NULL,
  `assistant_id` int(10) unsigned DEFAULT NULL,
  `last_lecture_at` datetime DEFAULT NULL,
  `last_exercise_at` datetime DEFAULT NULL,
  `is_inactive` tinyint(1) unsigned NOT NULL DEFAULT 1,
  PRIMARY KEY (`subject_id`) USING BTREE,
  UNIQUE KEY `uq_title_titleEnglish` (`title`,`title_english`) USING BTREE,
  KEY `fk_subject_professor_id_staff_staff_id` (`professor_id`),
  KEY `fk_subject_assistant_id_staff_staff_id` (`assistant_id`),
  CONSTRAINT `subject_ibfk_1` FOREIGN KEY (`assistant_id`) REFERENCES `staff` (`staff_id`) ON UPDATE CASCADE,
  CONSTRAINT `subject_ibfk_2` FOREIGN KEY (`professor_id`) REFERENCES `staff` (`staff_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=74 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subject
-- ----------------------------
BEGIN;
INSERT INTO `subject` VALUES (70, 'Италијански језик', 'Italian language', 8694, NULL, '2021-09-15 12:00:00', NULL, 0);
INSERT INTO `subject` VALUES (71, 'Енглески Језик 1', 'English Language 1', 7466, NULL, '2021-09-15 12:15:00', NULL, 1);
INSERT INTO `subject` VALUES (72, 'Основе Програмирања - Python', 'Basics of computer programming - Python', 5240, 18728, '2021-09-15 15:15:00', '2021-09-15 16:00:00', 0);
INSERT INTO `subject` VALUES (73, 'Конкурентно и дистрибуирано програмирање', 'Concurrent and distributed programming', 5257, 26318, '2021-09-18 16:20:00', '2021-09-18 17:10:00', 0);
COMMIT;

-- ----------------------------
-- Table structure for subject_study
-- ----------------------------
DROP TABLE IF EXISTS `subject_study`;
CREATE TABLE `subject_study` (
  `subject_study` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `study_id` int(10) unsigned NOT NULL,
  `subject_id` int(10) unsigned NOT NULL,
  `year` enum('1','2','3','4','5') COLLATE utf8_unicode_ci NOT NULL DEFAULT '1',
  PRIMARY KEY (`subject_study`),
  UNIQUE KEY `uq_subject_id_study_id_year` (`study_id`,`year`,`subject_id`) USING BTREE,
  KEY `fk_subject_study_subject_id_subject_subject_id` (`subject_id`),
  CONSTRAINT `subject_study_ibfk_1` FOREIGN KEY (`study_id`) REFERENCES `study` (`study_id`) ON UPDATE CASCADE,
  CONSTRAINT `subject_study_ibfk_2` FOREIGN KEY (`subject_id`) REFERENCES `subject` (`subject_id`) ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=113 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of subject_study
-- ----------------------------
BEGIN;
INSERT INTO `subject_study` VALUES (72, 1, 70, '1');
INSERT INTO `subject_study` VALUES (100, 1, 71, '1');
INSERT INTO `subject_study` VALUES (73, 1, 70, '2');
INSERT INTO `subject_study` VALUES (74, 1, 70, '3');
INSERT INTO `subject_study` VALUES (75, 1, 70, '4');
INSERT INTO `subject_study` VALUES (93, 2, 71, '1');
INSERT INTO `subject_study` VALUES (82, 3, 70, '1');
INSERT INTO `subject_study` VALUES (105, 3, 71, '1');
INSERT INTO `subject_study` VALUES (83, 3, 70, '2');
INSERT INTO `subject_study` VALUES (84, 3, 70, '3');
INSERT INTO `subject_study` VALUES (85, 3, 70, '4');
INSERT INTO `subject_study` VALUES (101, 4, 71, '1');
INSERT INTO `subject_study` VALUES (76, 4, 70, '3');
INSERT INTO `subject_study` VALUES (77, 4, 70, '4');
INSERT INTO `subject_study` VALUES (97, 5, 71, '1');
INSERT INTO `subject_study` VALUES (109, 5, 72, '1');
INSERT INTO `subject_study` VALUES (62, 5, 70, '3');
INSERT INTO `subject_study` VALUES (63, 5, 70, '4');
INSERT INTO `subject_study` VALUES (103, 6, 71, '1');
INSERT INTO `subject_study` VALUES (111, 6, 72, '1');
INSERT INTO `subject_study` VALUES (112, 6, 73, '4');
INSERT INTO `subject_study` VALUES (88, 7, 70, '1');
INSERT INTO `subject_study` VALUES (107, 7, 71, '1');
INSERT INTO `subject_study` VALUES (89, 7, 70, '2');
INSERT INTO `subject_study` VALUES (90, 7, 70, '3');
INSERT INTO `subject_study` VALUES (91, 7, 70, '4');
INSERT INTO `subject_study` VALUES (64, 8, 70, '1');
INSERT INTO `subject_study` VALUES (98, 8, 71, '1');
INSERT INTO `subject_study` VALUES (65, 8, 70, '2');
INSERT INTO `subject_study` VALUES (66, 8, 70, '3');
INSERT INTO `subject_study` VALUES (67, 8, 70, '4');
INSERT INTO `subject_study` VALUES (56, 9, 70, '1');
INSERT INTO `subject_study` VALUES (95, 9, 71, '1');
INSERT INTO `subject_study` VALUES (57, 9, 70, '2');
INSERT INTO `subject_study` VALUES (58, 9, 70, '3');
INSERT INTO `subject_study` VALUES (59, 9, 70, '4');
INSERT INTO `subject_study` VALUES (68, 10, 70, '1');
INSERT INTO `subject_study` VALUES (99, 10, 71, '1');
INSERT INTO `subject_study` VALUES (69, 10, 70, '2');
INSERT INTO `subject_study` VALUES (70, 10, 70, '3');
INSERT INTO `subject_study` VALUES (71, 10, 70, '4');
INSERT INTO `subject_study` VALUES (92, 11, 71, '1');
INSERT INTO `subject_study` VALUES (78, 12, 70, '1');
INSERT INTO `subject_study` VALUES (104, 12, 71, '1');
INSERT INTO `subject_study` VALUES (79, 12, 70, '2');
INSERT INTO `subject_study` VALUES (80, 12, 70, '3');
INSERT INTO `subject_study` VALUES (81, 12, 70, '4');
INSERT INTO `subject_study` VALUES (96, 13, 71, '1');
INSERT INTO `subject_study` VALUES (108, 13, 72, '1');
INSERT INTO `subject_study` VALUES (60, 13, 70, '3');
INSERT INTO `subject_study` VALUES (61, 13, 70, '4');
INSERT INTO `subject_study` VALUES (102, 14, 71, '1');
INSERT INTO `subject_study` VALUES (110, 14, 72, '1');
INSERT INTO `subject_study` VALUES (52, 15, 70, '1');
INSERT INTO `subject_study` VALUES (94, 15, 71, '1');
INSERT INTO `subject_study` VALUES (53, 15, 70, '2');
INSERT INTO `subject_study` VALUES (54, 15, 70, '3');
INSERT INTO `subject_study` VALUES (55, 15, 70, '4');
INSERT INTO `subject_study` VALUES (106, 16, 71, '1');
INSERT INTO `subject_study` VALUES (86, 16, 70, '3');
INSERT INTO `subject_study` VALUES (87, 16, 70, '4');
COMMIT;

-- ----------------------------
-- Triggers structure for table subject
-- ----------------------------
DROP TRIGGER IF EXISTS `subject_ BI`;
delimiter ;;
CREATE TRIGGER `subject_ BI` BEFORE INSERT ON `subject` FOR EACH ROW IF NEW.assistant_id NOT IN (SELECT staff_id FROM staff WHERE role = 'assistant') THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Staff member is not an assistant!";
END IF
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table subject
-- ----------------------------
DROP TRIGGER IF EXISTS `subject_BU`;
delimiter ;;
CREATE TRIGGER `subject_BU` BEFORE UPDATE ON `subject` FOR EACH ROW IF NEW.assistant_id NOT IN (SELECT staff_id FROM staff WHERE role = 'assistant') THEN
				SIGNAL SQLSTATE '50001' SET MESSAGE_TEXT = "Staff member is not an assistant!";
END IF
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
